
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
c0100025:	e8 71 3b 00 00       	call   c0103b9b <ReloadGDT>
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
c010004e:	e9 ae 03 00 00       	jmp    c0100401 <kernel_main>
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
c010014b:	e8 90 70 00 00       	call   c01071e0 <exception_handler>
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
c0100168:	e8 73 70 00 00       	call   c01071e0 <exception_handler>
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
c0100195:	e8 cb 35 00 00       	call   c0103765 <clock_handler>
c010019a:	e9 34 01 00 00       	jmp    c01002d3 <reenter_restore>

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
c01001c7:	e8 24 45 00 00       	call   c01046f0 <keyboard_handler>
c01001cc:	b0 f8                	mov    $0xf8,%al
c01001ce:	e6 21                	out    %al,$0x21
c01001d0:	83 3d a8 f7 10 c0 00 	cmpl   $0x0,0xc010f7a8
c01001d7:	0f 85 f6 00 00 00    	jne    c01002d3 <reenter_restore>
c01001dd:	e9 f1 00 00 00       	jmp    c01002d3 <reenter_restore>

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
c010020d:	e8 dc 11 00 00       	call   c01013ee <hd_handler>
c0100212:	b0 bb                	mov    $0xbb,%al
c0100214:	e6 a1                	out    %al,$0xa1
c0100216:	83 3d a8 f7 10 c0 00 	cmpl   $0x0,0xc010f7a8
c010021d:	0f 85 b0 00 00 00    	jne    c01002d3 <reenter_restore>
c0100223:	e9 ab 00 00 00       	jmp    c01002d3 <reenter_restore>

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
c0100256:	e8 bf 11 00 00       	call   c010141a <net_handler>
c010025b:	b0 bb                	mov    $0xbb,%al
c010025d:	e6 a1                	out    %al,$0xa1
c010025f:	83 3d a8 f7 10 c0 00 	cmpl   $0x0,0xc010f7a8
c0100266:	75 6b                	jne    c01002d3 <reenter_restore>
c0100268:	eb 69                	jmp    c01002d3 <reenter_restore>

c010026a <sys_call>:
c010026a:	60                   	pusha  
c010026b:	1e                   	push   %ds
c010026c:	06                   	push   %es
c010026d:	0f a0                	push   %fs
c010026f:	0f a8                	push   %gs
c0100271:	89 e6                	mov    %esp,%esi
c0100273:	89 e5                	mov    %esp,%ebp
c0100275:	66 8c d2             	mov    %ss,%dx
c0100278:	8e da                	mov    %edx,%ds
c010027a:	8e c2                	mov    %edx,%es
c010027c:	8e e2                	mov    %edx,%fs
c010027e:	ff 05 a8 f7 10 c0    	incl   0xc010f7a8
c0100284:	83 3d a8 f7 10 c0 00 	cmpl   $0x0,0xc010f7a8
c010028b:	75 00                	jne    c010028d <sys_call.1>

c010028d <sys_call.1>:
c010028d:	fb                   	sti    
c010028e:	56                   	push   %esi
c010028f:	ff 35 c0 fb 10 c0    	pushl  0xc010fbc0
c0100295:	53                   	push   %ebx
c0100296:	51                   	push   %ecx
c0100297:	ff 14 85 2c e1 10 c0 	call   *-0x3fef1ed4(,%eax,4)
c010029e:	83 c4 0c             	add    $0xc,%esp
c01002a1:	5e                   	pop    %esi
c01002a2:	89 45 2c             	mov    %eax,0x2c(%ebp)
c01002a5:	83 3d a8 f7 10 c0 00 	cmpl   $0x0,0xc010f7a8
c01002ac:	75 25                	jne    c01002d3 <reenter_restore>
c01002ae:	eb 23                	jmp    c01002d3 <reenter_restore>

c01002b0 <fork_restart>:
c01002b0:	fa                   	cli    
c01002b1:	ff 0d a8 f7 10 c0    	decl   0xc010f7a8
c01002b7:	0f a9                	pop    %gs
c01002b9:	0f a1                	pop    %fs
c01002bb:	07                   	pop    %es
c01002bc:	1f                   	pop    %ds
c01002bd:	61                   	popa   
c01002be:	cf                   	iret   

c01002bf <restart>:
c01002bf:	fa                   	cli    
c01002c0:	ff 0d a8 f7 10 c0    	decl   0xc010f7a8
c01002c6:	89 e5                	mov    %esp,%ebp
c01002c8:	8b 65 04             	mov    0x4(%ebp),%esp
c01002cb:	0f a9                	pop    %gs
c01002cd:	0f a1                	pop    %fs
c01002cf:	07                   	pop    %es
c01002d0:	1f                   	pop    %ds
c01002d1:	61                   	popa   
c01002d2:	cf                   	iret   

c01002d3 <reenter_restore>:
c01002d3:	fa                   	cli    
c01002d4:	ff 0d a8 f7 10 c0    	decl   0xc010f7a8
c01002da:	0f a9                	pop    %gs
c01002dc:	0f a1                	pop    %fs
c01002de:	07                   	pop    %es
c01002df:	1f                   	pop    %ds
c01002e0:	61                   	popa   
c01002e1:	cf                   	iret   

c01002e2 <in_byte>:
c01002e2:	31 d2                	xor    %edx,%edx
c01002e4:	8b 54 24 04          	mov    0x4(%esp),%edx
c01002e8:	31 c0                	xor    %eax,%eax
c01002ea:	ec                   	in     (%dx),%al
c01002eb:	90                   	nop
c01002ec:	90                   	nop
c01002ed:	c3                   	ret    

c01002ee <out_byte>:
c01002ee:	31 d2                	xor    %edx,%edx
c01002f0:	31 c0                	xor    %eax,%eax
c01002f2:	8b 54 24 04          	mov    0x4(%esp),%edx
c01002f6:	8a 44 24 08          	mov    0x8(%esp),%al
c01002fa:	ee                   	out    %al,(%dx)
c01002fb:	90                   	nop
c01002fc:	90                   	nop
c01002fd:	c3                   	ret    

c01002fe <in_byte2>:
c01002fe:	55                   	push   %ebp
c01002ff:	89 e5                	mov    %esp,%ebp
c0100301:	52                   	push   %edx
c0100302:	31 d2                	xor    %edx,%edx
c0100304:	66 8b 55 08          	mov    0x8(%ebp),%dx
c0100308:	31 c0                	xor    %eax,%eax
c010030a:	ec                   	in     (%dx),%al
c010030b:	90                   	nop
c010030c:	90                   	nop
c010030d:	5b                   	pop    %ebx
c010030e:	5d                   	pop    %ebp
c010030f:	c3                   	ret    

c0100310 <disable_int>:
c0100310:	fa                   	cli    
c0100311:	c3                   	ret    

c0100312 <enable_int>:
c0100312:	fb                   	sti    
c0100313:	c3                   	ret    

c0100314 <check_tss_esp0>:
c0100314:	55                   	push   %ebp
c0100315:	89 e5                	mov    %esp,%ebp
c0100317:	8b 45 08             	mov    0x8(%ebp),%eax
c010031a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c010031d:	83 c0 44             	add    $0x44,%eax
c0100320:	8b 15 44 06 11 c0    	mov    0xc0110644,%edx
c0100326:	39 d0                	cmp    %edx,%eax
c0100328:	74 7c                	je     c01003a6 <check_tss_esp0.2>

c010032a <check_tss_esp0.1>:
c010032a:	50                   	push   %eax
c010032b:	52                   	push   %edx
c010032c:	68 10 e0 10 c0       	push   $0xc010e010
c0100331:	e8 56 fd ff ff       	call   c010008c <disp_str>
c0100336:	83 c4 04             	add    $0x4,%esp
c0100339:	5a                   	pop    %edx
c010033a:	58                   	pop    %eax
c010033b:	52                   	push   %edx
c010033c:	50                   	push   %eax
c010033d:	53                   	push   %ebx
c010033e:	e8 37 6d 00 00       	call   c010707a <disp_int>
c0100343:	83 c4 04             	add    $0x4,%esp
c0100346:	58                   	pop    %eax
c0100347:	5a                   	pop    %edx
c0100348:	52                   	push   %edx
c0100349:	50                   	push   %eax
c010034a:	e8 2b 6d 00 00       	call   c010707a <disp_int>
c010034f:	58                   	pop    %eax
c0100350:	5a                   	pop    %edx
c0100351:	52                   	push   %edx
c0100352:	50                   	push   %eax
c0100353:	ff 35 a8 f7 10 c0    	pushl  0xc010f7a8
c0100359:	e8 1c 6d 00 00       	call   c010707a <disp_int>
c010035e:	83 c4 04             	add    $0x4,%esp
c0100361:	58                   	pop    %eax
c0100362:	5a                   	pop    %edx
c0100363:	52                   	push   %edx
c0100364:	50                   	push   %eax
c0100365:	ff 72 ec             	pushl  -0x14(%edx)
c0100368:	e8 0d 6d 00 00       	call   c010707a <disp_int>
c010036d:	83 c4 04             	add    $0x4,%esp
c0100370:	58                   	pop    %eax
c0100371:	5a                   	pop    %edx
c0100372:	52                   	push   %edx
c0100373:	50                   	push   %eax
c0100374:	ff 70 ec             	pushl  -0x14(%eax)
c0100377:	e8 fe 6c 00 00       	call   c010707a <disp_int>
c010037c:	83 c4 04             	add    $0x4,%esp
c010037f:	58                   	pop    %eax
c0100380:	5a                   	pop    %edx
c0100381:	52                   	push   %edx
c0100382:	50                   	push   %eax
c0100383:	ff 35 c0 fb 10 c0    	pushl  0xc010fbc0
c0100389:	e8 ec 6c 00 00       	call   c010707a <disp_int>
c010038e:	83 c4 04             	add    $0x4,%esp
c0100391:	58                   	pop    %eax
c0100392:	5a                   	pop    %edx
c0100393:	52                   	push   %edx
c0100394:	50                   	push   %eax
c0100395:	68 60 f7 10 c0       	push   $0xc010f760
c010039a:	e8 db 6c 00 00       	call   c010707a <disp_int>
c010039f:	83 c4 04             	add    $0x4,%esp
c01003a2:	58                   	pop    %eax
c01003a3:	5a                   	pop    %edx
c01003a4:	5d                   	pop    %ebp
c01003a5:	c3                   	ret    

c01003a6 <check_tss_esp0.2>:
c01003a6:	5d                   	pop    %ebp
c01003a7:	c3                   	ret    

c01003a8 <enable_8259A_casecade_irq>:
c01003a8:	9c                   	pushf  
c01003a9:	fa                   	cli    
c01003aa:	e4 21                	in     $0x21,%al
c01003ac:	24 fb                	and    $0xfb,%al
c01003ae:	e6 21                	out    %al,$0x21
c01003b0:	9d                   	popf   
c01003b1:	c3                   	ret    

c01003b2 <disable_8259A_casecade_irq>:
c01003b2:	9c                   	pushf  
c01003b3:	fa                   	cli    
c01003b4:	e4 21                	in     $0x21,%al
c01003b6:	0c 04                	or     $0x4,%al
c01003b8:	e6 21                	out    %al,$0x21
c01003ba:	9c                   	pushf  
c01003bb:	c3                   	ret    

c01003bc <enable_8259A_slave_winchester_irq>:
c01003bc:	9c                   	pushf  
c01003bd:	fa                   	cli    
c01003be:	e4 a1                	in     $0xa1,%al
c01003c0:	24 bf                	and    $0xbf,%al
c01003c2:	e6 a1                	out    %al,$0xa1
c01003c4:	9d                   	popf   
c01003c5:	c3                   	ret    

c01003c6 <disable_8259A_slave_winchester_irq>:
c01003c6:	9c                   	pushf  
c01003c7:	fa                   	cli    
c01003c8:	e4 a1                	in     $0xa1,%al
c01003ca:	0c 40                	or     $0x40,%al
c01003cc:	e6 a1                	out    %al,$0xa1
c01003ce:	9d                   	popf   
c01003cf:	c3                   	ret    

c01003d0 <update_cr3>:
c01003d0:	55                   	push   %ebp
c01003d1:	89 e5                	mov    %esp,%ebp
c01003d3:	8b 45 08             	mov    0x8(%ebp),%eax
c01003d6:	0f 22 d8             	mov    %eax,%cr3
c01003d9:	89 ec                	mov    %ebp,%esp
c01003db:	5d                   	pop    %ebp
c01003dc:	c3                   	ret    

c01003dd <update_tss>:
c01003dd:	55                   	push   %ebp
c01003de:	89 e5                	mov    %esp,%ebp
c01003e0:	8b 45 08             	mov    0x8(%ebp),%eax
c01003e3:	a3 44 06 11 c0       	mov    %eax,0xc0110644
c01003e8:	89 ec                	mov    %ebp,%esp
c01003ea:	5d                   	pop    %ebp
c01003eb:	c3                   	ret    

c01003ec <get_running_thread_pcb>:
c01003ec:	89 e0                	mov    %esp,%eax
c01003ee:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01003f3:	c3                   	ret    

c01003f4 <sys_call_test>:
c01003f4:	9c                   	pushf  
c01003f5:	9d                   	popf   
c01003f6:	c3                   	ret    

c01003f7 <enable_8259A_slave_net_irq>:
c01003f7:	9c                   	pushf  
c01003f8:	fa                   	cli    
c01003f9:	e4 a1                	in     $0xa1,%al
c01003fb:	24 fb                	and    $0xfb,%al
c01003fd:	e6 a1                	out    %al,$0xa1
c01003ff:	9d                   	popf   
c0100400:	c3                   	ret    

c0100401 <kernel_main>:
c0100401:	55                   	push   %ebp
c0100402:	89 e5                	mov    %esp,%ebp
c0100404:	83 ec 18             	sub    $0x18,%esp
c0100407:	e8 7b 01 00 00       	call   c0100587 <init>
c010040c:	c7 45 f4 0f 00 00 00 	movl   $0xf,-0xc(%ebp)
c0100413:	e8 d4 ff ff ff       	call   c01003ec <get_running_thread_pcb>
c0100418:	a3 e0 0e 11 c0       	mov    %eax,0xc0110ee0
c010041d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100420:	8d 50 02             	lea    0x2(%eax),%edx
c0100423:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c0100428:	89 90 1c 01 00 00    	mov    %edx,0x11c(%eax)
c010042e:	8b 15 e0 0e 11 c0    	mov    0xc0110ee0,%edx
c0100434:	8b 80 1c 01 00 00    	mov    0x11c(%eax),%eax
c010043a:	89 82 18 01 00 00    	mov    %eax,0x118(%edx)
c0100440:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c0100445:	8b 15 28 0f 11 c0    	mov    0xc0110f28,%edx
c010044b:	89 50 08             	mov    %edx,0x8(%eax)
c010044e:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c0100453:	05 28 01 00 00       	add    $0x128,%eax
c0100458:	83 ec 08             	sub    $0x8,%esp
c010045b:	68 00 b0 10 c0       	push   $0xc010b000
c0100460:	50                   	push   %eax
c0100461:	e8 88 bd 00 00       	call   c010c1ee <Strcpy>
c0100466:	83 c4 10             	add    $0x10,%esp
c0100469:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c010046e:	a3 c0 fb 10 c0       	mov    %eax,0xc010fbc0
c0100473:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c0100478:	05 60 02 00 00       	add    $0x260,%eax
c010047d:	83 ec 08             	sub    $0x8,%esp
c0100480:	50                   	push   %eax
c0100481:	68 ec fd 10 c0       	push   $0xc010fdec
c0100486:	e8 d5 9c 00 00       	call   c010a160 <appendToDoubleLinkList>
c010048b:	83 c4 10             	add    $0x10,%esp
c010048e:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c0100493:	05 6a 02 00 00       	add    $0x26a,%eax
c0100498:	83 ec 08             	sub    $0x8,%esp
c010049b:	50                   	push   %eax
c010049c:	68 ec fd 10 c0       	push   $0xc010fdec
c01004a1:	e8 ba 9c 00 00       	call   c010a160 <appendToDoubleLinkList>
c01004a6:	83 c4 10             	add    $0x10,%esp
c01004a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01004ac:	83 ec 0c             	sub    $0xc,%esp
c01004af:	50                   	push   %eax
c01004b0:	6a 00                	push   $0x0
c01004b2:	68 0c b0 10 c0       	push   $0xc010b00c
c01004b7:	68 13 b0 10 c0       	push   $0xc010b013
c01004bc:	68 57 51 10 c0       	push   $0xc0105157
c01004c1:	e8 db 99 00 00       	call   c0109ea1 <process_execute>
c01004c6:	83 c4 20             	add    $0x20,%esp
c01004c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01004cc:	83 ec 0c             	sub    $0xc,%esp
c01004cf:	50                   	push   %eax
c01004d0:	6a 00                	push   $0x0
c01004d2:	68 1c b0 10 c0       	push   $0xc010b01c
c01004d7:	68 24 b0 10 c0       	push   $0xc010b024
c01004dc:	68 09 16 10 c0       	push   $0xc0101609
c01004e1:	e8 bb 99 00 00       	call   c0109ea1 <process_execute>
c01004e6:	83 c4 20             	add    $0x20,%esp
c01004e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01004ec:	83 ec 0c             	sub    $0xc,%esp
c01004ef:	50                   	push   %eax
c01004f0:	6a 00                	push   $0x0
c01004f2:	68 2d b0 10 c0       	push   $0xc010b02d
c01004f7:	68 34 b0 10 c0       	push   $0xc010b034
c01004fc:	68 66 07 10 c0       	push   $0xc0100766
c0100501:	e8 9b 99 00 00       	call   c0109ea1 <process_execute>
c0100506:	83 c4 20             	add    $0x20,%esp
c0100509:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010050c:	83 ec 0c             	sub    $0xc,%esp
c010050f:	50                   	push   %eax
c0100510:	6a 00                	push   $0x0
c0100512:	68 3d b0 10 c0       	push   $0xc010b03d
c0100517:	68 45 b0 10 c0       	push   $0xc010b045
c010051c:	68 ed 45 10 c0       	push   $0xc01045ed
c0100521:	e8 7b 99 00 00       	call   c0109ea1 <process_execute>
c0100526:	83 c4 20             	add    $0x20,%esp
c0100529:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010052c:	83 e8 02             	sub    $0x2,%eax
c010052f:	83 ec 0c             	sub    $0xc,%esp
c0100532:	50                   	push   %eax
c0100533:	6a 01                	push   $0x1
c0100535:	68 4f b0 10 c0       	push   $0xc010b04f
c010053a:	68 59 b0 10 c0       	push   $0xc010b059
c010053f:	68 e1 06 10 c0       	push   $0xc01006e1
c0100544:	e8 58 99 00 00       	call   c0109ea1 <process_execute>
c0100549:	83 c4 20             	add    $0x20,%esp
c010054c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010054f:	83 e8 03             	sub    $0x3,%eax
c0100552:	83 ec 0c             	sub    $0xc,%esp
c0100555:	50                   	push   %eax
c0100556:	6a 01                	push   $0x1
c0100558:	68 66 b0 10 c0       	push   $0xc010b066
c010055d:	68 70 b0 10 c0       	push   $0xc010b070
c0100562:	68 4e 07 10 c0       	push   $0xc010074e
c0100567:	e8 35 99 00 00       	call   c0109ea1 <process_execute>
c010056c:	83 c4 20             	add    $0x20,%esp
c010056f:	83 ec 0c             	sub    $0xc,%esp
c0100572:	68 7d b0 10 c0       	push   $0xc010b07d
c0100577:	e8 10 fb ff ff       	call   c010008c <disp_str>
c010057c:	83 c4 10             	add    $0x10,%esp
c010057f:	fb                   	sti    
c0100580:	e8 19 66 00 00       	call   c0106b9e <stop_here>
c0100585:	eb f9                	jmp    c0100580 <kernel_main+0x17f>

c0100587 <init>:
c0100587:	55                   	push   %ebp
c0100588:	89 e5                	mov    %esp,%ebp
c010058a:	83 ec 08             	sub    $0x8,%esp
c010058d:	c7 05 28 0f 11 c0 00 	movl   $0x400000,0xc0110f28
c0100594:	00 40 00 
c0100597:	c7 05 a8 f7 10 c0 63 	movl   $0x63,0xc010f7a8
c010059e:	00 00 00 
c01005a1:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c01005a8:	00 00 00 
c01005ab:	c7 05 90 f7 10 c0 00 	movl   $0x0,0xc010f790
c01005b2:	00 00 00 
c01005b5:	c7 05 c4 06 11 c0 64 	movl   $0x64,0xc01106c4
c01005bc:	00 00 00 
c01005bf:	c7 05 fc fd 10 c0 09 	movl   $0x9,0xc010fdfc
c01005c6:	00 00 00 
c01005c9:	c7 05 c0 fb 10 c0 00 	movl   $0x0,0xc010fbc0
c01005d0:	00 00 00 
c01005d3:	83 ec 0c             	sub    $0xc,%esp
c01005d6:	68 87 b0 10 c0       	push   $0xc010b087
c01005db:	e8 ac fa ff ff       	call   c010008c <disp_str>
c01005e0:	83 c4 10             	add    $0x10,%esp
c01005e3:	e8 e2 6f 00 00       	call   c01075ca <init_keyboard>
c01005e8:	83 ec 0c             	sub    $0xc,%esp
c01005eb:	68 00 00 00 04       	push   $0x4000000
c01005f0:	e8 60 64 00 00       	call   c0106a55 <init_memory>
c01005f5:	83 c4 10             	add    $0x10,%esp
c01005f8:	83 ec 0c             	sub    $0xc,%esp
c01005fb:	68 ec fd 10 c0       	push   $0xc010fdec
c0100600:	e8 30 9a 00 00       	call   c010a035 <initDoubleLinkList>
c0100605:	83 c4 10             	add    $0x10,%esp
c0100608:	83 ec 0c             	sub    $0xc,%esp
c010060b:	68 04 0f 11 c0       	push   $0xc0110f04
c0100610:	e8 20 9a 00 00       	call   c010a035 <initDoubleLinkList>
c0100615:	83 c4 10             	add    $0x10,%esp
c0100618:	90                   	nop
c0100619:	c9                   	leave  
c010061a:	c3                   	ret    

c010061b <kernel_thread_a>:
c010061b:	55                   	push   %ebp
c010061c:	89 e5                	mov    %esp,%ebp
c010061e:	83 ec 18             	sub    $0x18,%esp
c0100621:	83 ec 0c             	sub    $0xc,%esp
c0100624:	ff 75 08             	pushl  0x8(%ebp)
c0100627:	e8 60 fa ff ff       	call   c010008c <disp_str>
c010062c:	83 c4 10             	add    $0x10,%esp
c010062f:	a1 a4 f7 10 c0       	mov    0xc010f7a4,%eax
c0100634:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0100637:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c010063e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100641:	a3 a4 f7 10 c0       	mov    %eax,0xc010f7a4
c0100646:	83 ec 0c             	sub    $0xc,%esp
c0100649:	68 8d b0 10 c0       	push   $0xc010b08d
c010064e:	e8 39 fa ff ff       	call   c010008c <disp_str>
c0100653:	83 c4 10             	add    $0x10,%esp
c0100656:	83 ec 0c             	sub    $0xc,%esp
c0100659:	68 96 b0 10 c0       	push   $0xc010b096
c010065e:	e8 29 fa ff ff       	call   c010008c <disp_str>
c0100663:	83 c4 10             	add    $0x10,%esp
c0100666:	eb d6                	jmp    c010063e <kernel_thread_a+0x23>

c0100668 <kernel_thread_b>:
c0100668:	55                   	push   %ebp
c0100669:	89 e5                	mov    %esp,%ebp
c010066b:	83 ec 18             	sub    $0x18,%esp
c010066e:	83 ec 0c             	sub    $0xc,%esp
c0100671:	ff 75 08             	pushl  0x8(%ebp)
c0100674:	e8 13 fa ff ff       	call   c010008c <disp_str>
c0100679:	83 c4 10             	add    $0x10,%esp
c010067c:	a1 a4 f7 10 c0       	mov    0xc010f7a4,%eax
c0100681:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0100684:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c010068b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010068e:	a3 a4 f7 10 c0       	mov    %eax,0xc010f7a4
c0100693:	83 ec 0c             	sub    $0xc,%esp
c0100696:	68 98 b0 10 c0       	push   $0xc010b098
c010069b:	e8 ec f9 ff ff       	call   c010008c <disp_str>
c01006a0:	83 c4 10             	add    $0x10,%esp
c01006a3:	83 ec 0c             	sub    $0xc,%esp
c01006a6:	68 96 b0 10 c0       	push   $0xc010b096
c01006ab:	e8 dc f9 ff ff       	call   c010008c <disp_str>
c01006b0:	83 c4 10             	add    $0x10,%esp
c01006b3:	eb d6                	jmp    c010068b <kernel_thread_b+0x23>

c01006b5 <kernel_thread_c>:
c01006b5:	55                   	push   %ebp
c01006b6:	89 e5                	mov    %esp,%ebp
c01006b8:	83 ec 08             	sub    $0x8,%esp
c01006bb:	83 ec 0c             	sub    $0xc,%esp
c01006be:	ff 75 08             	pushl  0x8(%ebp)
c01006c1:	e8 c6 f9 ff ff       	call   c010008c <disp_str>
c01006c6:	83 c4 10             	add    $0x10,%esp
c01006c9:	eb fe                	jmp    c01006c9 <kernel_thread_c+0x14>

c01006cb <kernel_thread_d>:
c01006cb:	55                   	push   %ebp
c01006cc:	89 e5                	mov    %esp,%ebp
c01006ce:	83 ec 08             	sub    $0x8,%esp
c01006d1:	83 ec 0c             	sub    $0xc,%esp
c01006d4:	ff 75 08             	pushl  0x8(%ebp)
c01006d7:	e8 b0 f9 ff ff       	call   c010008c <disp_str>
c01006dc:	83 c4 10             	add    $0x10,%esp
c01006df:	eb fe                	jmp    c01006df <kernel_thread_d+0x14>

c01006e1 <user_proc_a>:
c01006e1:	55                   	push   %ebp
c01006e2:	89 e5                	mov    %esp,%ebp
c01006e4:	83 ec 08             	sub    $0x8,%esp
c01006e7:	83 ec 0c             	sub    $0xc,%esp
c01006ea:	68 a4 b0 10 c0       	push   $0xc010b0a4
c01006ef:	e8 98 f9 ff ff       	call   c010008c <disp_str>
c01006f4:	83 c4 10             	add    $0x10,%esp
c01006f7:	c7 05 cc 06 11 c0 04 	movl   $0x4,0xc01106cc
c01006fe:	00 00 00 
c0100701:	e8 0a 9e 00 00       	call   c010a510 <DriverInitialize>
c0100706:	e8 7e 9e 00 00       	call   c010a589 <DriverSend>
c010070b:	83 ec 0c             	sub    $0xc,%esp
c010070e:	68 c3 b0 10 c0       	push   $0xc010b0c3
c0100713:	e8 74 f9 ff ff       	call   c010008c <disp_str>
c0100718:	83 c4 10             	add    $0x10,%esp
c010071b:	83 ec 0c             	sub    $0xc,%esp
c010071e:	68 d6 b0 10 c0       	push   $0xc010b0d6
c0100723:	e8 64 f9 ff ff       	call   c010008c <disp_str>
c0100728:	83 c4 10             	add    $0x10,%esp
c010072b:	a1 cc 06 11 c0       	mov    0xc01106cc,%eax
c0100730:	83 ec 0c             	sub    $0xc,%esp
c0100733:	50                   	push   %eax
c0100734:	e8 41 69 00 00       	call   c010707a <disp_int>
c0100739:	83 c4 10             	add    $0x10,%esp
c010073c:	83 ec 0c             	sub    $0xc,%esp
c010073f:	68 e9 b0 10 c0       	push   $0xc010b0e9
c0100744:	e8 43 f9 ff ff       	call   c010008c <disp_str>
c0100749:	83 c4 10             	add    $0x10,%esp
c010074c:	eb fe                	jmp    c010074c <user_proc_a+0x6b>

c010074e <user_proc_b>:
c010074e:	55                   	push   %ebp
c010074f:	89 e5                	mov    %esp,%ebp
c0100751:	83 ec 08             	sub    $0x8,%esp
c0100754:	83 ec 0c             	sub    $0xc,%esp
c0100757:	68 00 b1 10 c0       	push   $0xc010b100
c010075c:	e8 2b f9 ff ff       	call   c010008c <disp_str>
c0100761:	83 c4 10             	add    $0x10,%esp
c0100764:	eb fe                	jmp    c0100764 <user_proc_b+0x16>

c0100766 <TaskHD>:
c0100766:	55                   	push   %ebp
c0100767:	89 e5                	mov    %esp,%ebp
c0100769:	83 ec 18             	sub    $0x18,%esp
c010076c:	e8 7b fc ff ff       	call   c01003ec <get_running_thread_pcb>
c0100771:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0100774:	e8 32 00 00 00       	call   c01007ab <init_hd>
c0100779:	83 ec 0c             	sub    $0xc,%esp
c010077c:	6a 7c                	push   $0x7c
c010077e:	e8 59 0e 00 00       	call   c01015dc <sys_malloc>
c0100783:	83 c4 10             	add    $0x10,%esp
c0100786:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100789:	83 ec 04             	sub    $0x4,%esp
c010078c:	6a 7c                	push   $0x7c
c010078e:	6a 00                	push   $0x0
c0100790:	ff 75 f0             	pushl  -0x10(%ebp)
c0100793:	e8 37 ba 00 00       	call   c010c1cf <Memset>
c0100798:	83 c4 10             	add    $0x10,%esp
c010079b:	83 ec 0c             	sub    $0xc,%esp
c010079e:	ff 75 f0             	pushl  -0x10(%ebp)
c01007a1:	e8 1f 00 00 00       	call   c01007c5 <hd_handle>
c01007a6:	83 c4 10             	add    $0x10,%esp
c01007a9:	eb de                	jmp    c0100789 <TaskHD+0x23>

c01007ab <init_hd>:
c01007ab:	55                   	push   %ebp
c01007ac:	89 e5                	mov    %esp,%ebp
c01007ae:	83 ec 18             	sub    $0x18,%esp
c01007b1:	c7 45 f4 75 04 00 00 	movl   $0x475,-0xc(%ebp)
c01007b8:	e8 eb fb ff ff       	call   c01003a8 <enable_8259A_casecade_irq>
c01007bd:	e8 fa fb ff ff       	call   c01003bc <enable_8259A_slave_winchester_irq>
c01007c2:	90                   	nop
c01007c3:	c9                   	leave  
c01007c4:	c3                   	ret    

c01007c5 <hd_handle>:
c01007c5:	55                   	push   %ebp
c01007c6:	89 e5                	mov    %esp,%ebp
c01007c8:	83 ec 18             	sub    $0x18,%esp
c01007cb:	83 ec 04             	sub    $0x4,%esp
c01007ce:	6a 12                	push   $0x12
c01007d0:	ff 75 08             	pushl  0x8(%ebp)
c01007d3:	6a 02                	push   $0x2
c01007d5:	e8 3b 8d 00 00       	call   c0109515 <send_rec>
c01007da:	83 c4 10             	add    $0x10,%esp
c01007dd:	8b 45 08             	mov    0x8(%ebp),%eax
c01007e0:	8b 40 78             	mov    0x78(%eax),%eax
c01007e3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01007e6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01007ea:	0f 84 d4 00 00 00    	je     c01008c4 <hd_handle+0xff>
c01007f0:	8b 45 08             	mov    0x8(%ebp),%eax
c01007f3:	8b 00                	mov    (%eax),%eax
c01007f5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01007f8:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c01007fc:	74 28                	je     c0100826 <hd_handle+0x61>
c01007fe:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c0100802:	74 22                	je     c0100826 <hd_handle+0x61>
c0100804:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c0100808:	74 1c                	je     c0100826 <hd_handle+0x61>
c010080a:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c010080e:	74 16                	je     c0100826 <hd_handle+0x61>
c0100810:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c0100817:	74 0d                	je     c0100826 <hd_handle+0x61>
c0100819:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c0100820:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100823:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0100826:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c010082a:	74 34                	je     c0100860 <hd_handle+0x9b>
c010082c:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c0100830:	74 2e                	je     c0100860 <hd_handle+0x9b>
c0100832:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c0100836:	74 28                	je     c0100860 <hd_handle+0x9b>
c0100838:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c010083c:	74 22                	je     c0100860 <hd_handle+0x9b>
c010083e:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c0100845:	74 19                	je     c0100860 <hd_handle+0x9b>
c0100847:	6a 6d                	push   $0x6d
c0100849:	68 20 b1 10 c0       	push   $0xc010b120
c010084e:	68 20 b1 10 c0       	push   $0xc010b120
c0100853:	68 28 b1 10 c0       	push   $0xc010b128
c0100858:	e8 48 80 00 00       	call   c01088a5 <assertion_failure>
c010085d:	83 c4 10             	add    $0x10,%esp
c0100860:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c0100864:	74 2c                	je     c0100892 <hd_handle+0xcd>
c0100866:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c010086a:	77 0e                	ja     c010087a <hd_handle+0xb5>
c010086c:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c0100870:	74 19                	je     c010088b <hd_handle+0xc6>
c0100872:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c0100876:	74 1a                	je     c0100892 <hd_handle+0xcd>
c0100878:	eb 37                	jmp    c01008b1 <hd_handle+0xec>
c010087a:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c010087e:	74 22                	je     c01008a2 <hd_handle+0xdd>
c0100880:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c0100887:	74 3e                	je     c01008c7 <hd_handle+0x102>
c0100889:	eb 26                	jmp    c01008b1 <hd_handle+0xec>
c010088b:	e8 e6 06 00 00       	call   c0100f76 <hd_open>
c0100890:	eb 36                	jmp    c01008c8 <hd_handle+0x103>
c0100892:	83 ec 0c             	sub    $0xc,%esp
c0100895:	ff 75 08             	pushl  0x8(%ebp)
c0100898:	e8 b2 08 00 00       	call   c010114f <hd_rdwt>
c010089d:	83 c4 10             	add    $0x10,%esp
c01008a0:	eb 26                	jmp    c01008c8 <hd_handle+0x103>
c01008a2:	83 ec 0c             	sub    $0xc,%esp
c01008a5:	6a 00                	push   $0x0
c01008a7:	e8 71 07 00 00       	call   c010101d <get_hd_ioctl>
c01008ac:	83 c4 10             	add    $0x10,%esp
c01008af:	eb 17                	jmp    c01008c8 <hd_handle+0x103>
c01008b1:	83 ec 0c             	sub    $0xc,%esp
c01008b4:	68 82 b1 10 c0       	push   $0xc010b182
c01008b9:	e8 a3 7f 00 00       	call   c0108861 <spin>
c01008be:	83 c4 10             	add    $0x10,%esp
c01008c1:	90                   	nop
c01008c2:	eb 04                	jmp    c01008c8 <hd_handle+0x103>
c01008c4:	90                   	nop
c01008c5:	eb 01                	jmp    c01008c8 <hd_handle+0x103>
c01008c7:	90                   	nop
c01008c8:	c9                   	leave  
c01008c9:	c3                   	ret    

c01008ca <hd_cmd_out>:
c01008ca:	55                   	push   %ebp
c01008cb:	89 e5                	mov    %esp,%ebp
c01008cd:	83 ec 08             	sub    $0x8,%esp
c01008d0:	83 ec 04             	sub    $0x4,%esp
c01008d3:	68 18 73 01 00       	push   $0x17318
c01008d8:	6a 00                	push   $0x0
c01008da:	68 80 00 00 00       	push   $0x80
c01008df:	e8 52 0b 00 00       	call   c0101436 <waitfor>
c01008e4:	83 c4 10             	add    $0x10,%esp
c01008e7:	85 c0                	test   %eax,%eax
c01008e9:	75 10                	jne    c01008fb <hd_cmd_out+0x31>
c01008eb:	83 ec 0c             	sub    $0xc,%esp
c01008ee:	68 94 b1 10 c0       	push   $0xc010b194
c01008f3:	e8 8f 7f 00 00       	call   c0108887 <panic>
c01008f8:	83 c4 10             	add    $0x10,%esp
c01008fb:	83 ec 08             	sub    $0x8,%esp
c01008fe:	6a 00                	push   $0x0
c0100900:	68 f6 03 00 00       	push   $0x3f6
c0100905:	e8 e4 f9 ff ff       	call   c01002ee <out_byte>
c010090a:	83 c4 10             	add    $0x10,%esp
c010090d:	8b 45 08             	mov    0x8(%ebp),%eax
c0100910:	0f b6 00             	movzbl (%eax),%eax
c0100913:	0f b6 c0             	movzbl %al,%eax
c0100916:	83 ec 08             	sub    $0x8,%esp
c0100919:	50                   	push   %eax
c010091a:	68 f1 01 00 00       	push   $0x1f1
c010091f:	e8 ca f9 ff ff       	call   c01002ee <out_byte>
c0100924:	83 c4 10             	add    $0x10,%esp
c0100927:	8b 45 08             	mov    0x8(%ebp),%eax
c010092a:	0f b6 40 01          	movzbl 0x1(%eax),%eax
c010092e:	0f b6 c0             	movzbl %al,%eax
c0100931:	83 ec 08             	sub    $0x8,%esp
c0100934:	50                   	push   %eax
c0100935:	68 f2 01 00 00       	push   $0x1f2
c010093a:	e8 af f9 ff ff       	call   c01002ee <out_byte>
c010093f:	83 c4 10             	add    $0x10,%esp
c0100942:	8b 45 08             	mov    0x8(%ebp),%eax
c0100945:	0f b6 40 02          	movzbl 0x2(%eax),%eax
c0100949:	0f b6 c0             	movzbl %al,%eax
c010094c:	83 ec 08             	sub    $0x8,%esp
c010094f:	50                   	push   %eax
c0100950:	68 f3 01 00 00       	push   $0x1f3
c0100955:	e8 94 f9 ff ff       	call   c01002ee <out_byte>
c010095a:	83 c4 10             	add    $0x10,%esp
c010095d:	8b 45 08             	mov    0x8(%ebp),%eax
c0100960:	0f b6 40 03          	movzbl 0x3(%eax),%eax
c0100964:	0f b6 c0             	movzbl %al,%eax
c0100967:	83 ec 08             	sub    $0x8,%esp
c010096a:	50                   	push   %eax
c010096b:	68 f4 01 00 00       	push   $0x1f4
c0100970:	e8 79 f9 ff ff       	call   c01002ee <out_byte>
c0100975:	83 c4 10             	add    $0x10,%esp
c0100978:	8b 45 08             	mov    0x8(%ebp),%eax
c010097b:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c010097f:	0f b6 c0             	movzbl %al,%eax
c0100982:	83 ec 08             	sub    $0x8,%esp
c0100985:	50                   	push   %eax
c0100986:	68 f5 01 00 00       	push   $0x1f5
c010098b:	e8 5e f9 ff ff       	call   c01002ee <out_byte>
c0100990:	83 c4 10             	add    $0x10,%esp
c0100993:	8b 45 08             	mov    0x8(%ebp),%eax
c0100996:	0f b6 40 05          	movzbl 0x5(%eax),%eax
c010099a:	0f b6 c0             	movzbl %al,%eax
c010099d:	83 ec 08             	sub    $0x8,%esp
c01009a0:	50                   	push   %eax
c01009a1:	68 f6 01 00 00       	push   $0x1f6
c01009a6:	e8 43 f9 ff ff       	call   c01002ee <out_byte>
c01009ab:	83 c4 10             	add    $0x10,%esp
c01009ae:	8b 45 08             	mov    0x8(%ebp),%eax
c01009b1:	0f b6 40 06          	movzbl 0x6(%eax),%eax
c01009b5:	0f b6 c0             	movzbl %al,%eax
c01009b8:	83 ec 08             	sub    $0x8,%esp
c01009bb:	50                   	push   %eax
c01009bc:	68 f7 01 00 00       	push   $0x1f7
c01009c1:	e8 28 f9 ff ff       	call   c01002ee <out_byte>
c01009c6:	83 c4 10             	add    $0x10,%esp
c01009c9:	90                   	nop
c01009ca:	c9                   	leave  
c01009cb:	c3                   	ret    

c01009cc <hd_identify>:
c01009cc:	55                   	push   %ebp
c01009cd:	89 e5                	mov    %esp,%ebp
c01009cf:	53                   	push   %ebx
c01009d0:	83 ec 24             	sub    $0x24,%esp
c01009d3:	89 e0                	mov    %esp,%eax
c01009d5:	89 c3                	mov    %eax,%ebx
c01009d7:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
c01009db:	c6 45 e6 01          	movb   $0x1,-0x1a(%ebp)
c01009df:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
c01009e3:	c6 45 e8 00          	movb   $0x0,-0x18(%ebp)
c01009e7:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c01009eb:	8b 45 08             	mov    0x8(%ebp),%eax
c01009ee:	c1 e0 04             	shl    $0x4,%eax
c01009f1:	83 c8 e0             	or     $0xffffffe0,%eax
c01009f4:	88 45 ea             	mov    %al,-0x16(%ebp)
c01009f7:	c6 45 eb ec          	movb   $0xec,-0x15(%ebp)
c01009fb:	83 ec 0c             	sub    $0xc,%esp
c01009fe:	8d 45 e5             	lea    -0x1b(%ebp),%eax
c0100a01:	50                   	push   %eax
c0100a02:	e8 c3 fe ff ff       	call   c01008ca <hd_cmd_out>
c0100a07:	83 c4 10             	add    $0x10,%esp
c0100a0a:	e8 f0 06 00 00       	call   c01010ff <interrupt_wait>
c0100a0f:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c0100a16:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100a19:	8d 50 ff             	lea    -0x1(%eax),%edx
c0100a1c:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0100a1f:	89 c2                	mov    %eax,%edx
c0100a21:	b8 10 00 00 00       	mov    $0x10,%eax
c0100a26:	83 e8 01             	sub    $0x1,%eax
c0100a29:	01 d0                	add    %edx,%eax
c0100a2b:	b9 10 00 00 00       	mov    $0x10,%ecx
c0100a30:	ba 00 00 00 00       	mov    $0x0,%edx
c0100a35:	f7 f1                	div    %ecx
c0100a37:	6b c0 10             	imul   $0x10,%eax,%eax
c0100a3a:	29 c4                	sub    %eax,%esp
c0100a3c:	89 e0                	mov    %esp,%eax
c0100a3e:	83 c0 00             	add    $0x0,%eax
c0100a41:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0100a44:	83 ec 04             	sub    $0x4,%esp
c0100a47:	ff 75 f4             	pushl  -0xc(%ebp)
c0100a4a:	6a 00                	push   $0x0
c0100a4c:	ff 75 ec             	pushl  -0x14(%ebp)
c0100a4f:	e8 7b b7 00 00       	call   c010c1cf <Memset>
c0100a54:	83 c4 10             	add    $0x10,%esp
c0100a57:	83 ec 04             	sub    $0x4,%esp
c0100a5a:	ff 75 f4             	pushl  -0xc(%ebp)
c0100a5d:	ff 75 ec             	pushl  -0x14(%ebp)
c0100a60:	68 f0 01 00 00       	push   $0x1f0
c0100a65:	e8 b9 b7 00 00       	call   c010c223 <read_port>
c0100a6a:	83 c4 10             	add    $0x10,%esp
c0100a6d:	83 ec 0c             	sub    $0xc,%esp
c0100a70:	ff 75 ec             	pushl  -0x14(%ebp)
c0100a73:	e8 0b 00 00 00       	call   c0100a83 <print_hdinfo>
c0100a78:	83 c4 10             	add    $0x10,%esp
c0100a7b:	89 dc                	mov    %ebx,%esp
c0100a7d:	90                   	nop
c0100a7e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100a81:	c9                   	leave  
c0100a82:	c3                   	ret    

c0100a83 <print_hdinfo>:
c0100a83:	55                   	push   %ebp
c0100a84:	89 e5                	mov    %esp,%ebp
c0100a86:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0100a8c:	66 c7 45 b4 0a 00    	movw   $0xa,-0x4c(%ebp)
c0100a92:	66 c7 45 b6 14 00    	movw   $0x14,-0x4a(%ebp)
c0100a98:	c7 45 b8 53 65 72 69 	movl   $0x69726553,-0x48(%ebp)
c0100a9f:	c7 45 bc 61 6c 20 4e 	movl   $0x4e206c61,-0x44(%ebp)
c0100aa6:	c7 45 c0 75 6d 62 65 	movl   $0x65626d75,-0x40(%ebp)
c0100aad:	c7 45 c4 72 00 00 00 	movl   $0x72,-0x3c(%ebp)
c0100ab4:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0100abb:	66 c7 45 cc 1b 00    	movw   $0x1b,-0x34(%ebp)
c0100ac1:	66 c7 45 ce 28 00    	movw   $0x28,-0x32(%ebp)
c0100ac7:	c7 45 d0 4d 6f 64 65 	movl   $0x65646f4d,-0x30(%ebp)
c0100ace:	c7 45 d4 6c 20 4e 75 	movl   $0x754e206c,-0x2c(%ebp)
c0100ad5:	c7 45 d8 6d 62 65 72 	movl   $0x7265626d,-0x28(%ebp)
c0100adc:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0100ae3:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0100aea:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100af1:	e9 8f 00 00 00       	jmp    c0100b85 <print_hdinfo+0x102>
c0100af6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0100afd:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100b00:	89 d0                	mov    %edx,%eax
c0100b02:	01 c0                	add    %eax,%eax
c0100b04:	01 d0                	add    %edx,%eax
c0100b06:	c1 e0 03             	shl    $0x3,%eax
c0100b09:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100b0c:	01 c8                	add    %ecx,%eax
c0100b0e:	83 e8 44             	sub    $0x44,%eax
c0100b11:	0f b7 00             	movzwl (%eax),%eax
c0100b14:	0f b7 c0             	movzwl %ax,%eax
c0100b17:	8d 14 00             	lea    (%eax,%eax,1),%edx
c0100b1a:	8b 45 08             	mov    0x8(%ebp),%eax
c0100b1d:	01 d0                	add    %edx,%eax
c0100b1f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0100b22:	eb 30                	jmp    c0100b54 <print_hdinfo+0xd1>
c0100b24:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100b27:	8d 50 01             	lea    0x1(%eax),%edx
c0100b2a:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0100b2d:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0100b30:	83 c2 01             	add    $0x1,%edx
c0100b33:	0f b6 00             	movzbl (%eax),%eax
c0100b36:	88 44 15 81          	mov    %al,-0x7f(%ebp,%edx,1)
c0100b3a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100b3d:	8d 50 01             	lea    0x1(%eax),%edx
c0100b40:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0100b43:	0f b6 00             	movzbl (%eax),%eax
c0100b46:	8d 4d 81             	lea    -0x7f(%ebp),%ecx
c0100b49:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0100b4c:	01 ca                	add    %ecx,%edx
c0100b4e:	88 02                	mov    %al,(%edx)
c0100b50:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0100b54:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100b57:	89 d0                	mov    %edx,%eax
c0100b59:	01 c0                	add    %eax,%eax
c0100b5b:	01 d0                	add    %edx,%eax
c0100b5d:	c1 e0 03             	shl    $0x3,%eax
c0100b60:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100b63:	01 c8                	add    %ecx,%eax
c0100b65:	83 e8 42             	sub    $0x42,%eax
c0100b68:	0f b7 00             	movzwl (%eax),%eax
c0100b6b:	66 d1 e8             	shr    %ax
c0100b6e:	0f b7 c0             	movzwl %ax,%eax
c0100b71:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0100b74:	7c ae                	jl     c0100b24 <print_hdinfo+0xa1>
c0100b76:	8d 55 81             	lea    -0x7f(%ebp),%edx
c0100b79:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100b7c:	01 d0                	add    %edx,%eax
c0100b7e:	c6 00 00             	movb   $0x0,(%eax)
c0100b81:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0100b85:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0100b89:	0f 8e 67 ff ff ff    	jle    c0100af6 <print_hdinfo+0x73>
c0100b8f:	8b 45 08             	mov    0x8(%ebp),%eax
c0100b92:	0f b7 40 62          	movzwl 0x62(%eax),%eax
c0100b96:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
c0100b9a:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0100b9e:	66 c1 e8 08          	shr    $0x8,%ax
c0100ba2:	66 85 c0             	test   %ax,%ax
c0100ba5:	0f 95 c0             	setne  %al
c0100ba8:	88 45 e9             	mov    %al,-0x17(%ebp)
c0100bab:	c7 45 ac 59 65 73 00 	movl   $0x736559,-0x54(%ebp)
c0100bb2:	66 c7 45 a9 4e 6f    	movw   $0x6f4e,-0x57(%ebp)
c0100bb8:	c6 45 ab 00          	movb   $0x0,-0x55(%ebp)
c0100bbc:	80 7d e9 01          	cmpb   $0x1,-0x17(%ebp)
c0100bc0:	75 15                	jne    c0100bd7 <print_hdinfo+0x154>
c0100bc2:	83 ec 08             	sub    $0x8,%esp
c0100bc5:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0100bc8:	50                   	push   %eax
c0100bc9:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0100bcc:	50                   	push   %eax
c0100bcd:	e8 1c b6 00 00       	call   c010c1ee <Strcpy>
c0100bd2:	83 c4 10             	add    $0x10,%esp
c0100bd5:	eb 13                	jmp    c0100bea <print_hdinfo+0x167>
c0100bd7:	83 ec 08             	sub    $0x8,%esp
c0100bda:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0100bdd:	50                   	push   %eax
c0100bde:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0100be1:	50                   	push   %eax
c0100be2:	e8 07 b6 00 00       	call   c010c1ee <Strcpy>
c0100be7:	83 c4 10             	add    $0x10,%esp
c0100bea:	8b 45 08             	mov    0x8(%ebp),%eax
c0100bed:	83 c0 7a             	add    $0x7a,%eax
c0100bf0:	0f b7 00             	movzwl (%eax),%eax
c0100bf3:	0f b7 d0             	movzwl %ax,%edx
c0100bf6:	8b 45 08             	mov    0x8(%ebp),%eax
c0100bf9:	83 c0 78             	add    $0x78,%eax
c0100bfc:	0f b7 00             	movzwl (%eax),%eax
c0100bff:	0f b7 c0             	movzwl %ax,%eax
c0100c02:	83 c0 10             	add    $0x10,%eax
c0100c05:	89 c1                	mov    %eax,%ecx
c0100c07:	d3 e2                	shl    %cl,%edx
c0100c09:	89 d0                	mov    %edx,%eax
c0100c0b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0100c0e:	90                   	nop
c0100c0f:	c9                   	leave  
c0100c10:	c3                   	ret    

c0100c11 <print_dpt_entry>:
c0100c11:	55                   	push   %ebp
c0100c12:	89 e5                	mov    %esp,%ebp
c0100c14:	83 ec 08             	sub    $0x8,%esp
c0100c17:	8b 45 08             	mov    0x8(%ebp),%eax
c0100c1a:	8b 40 08             	mov    0x8(%eax),%eax
c0100c1d:	83 ec 08             	sub    $0x8,%esp
c0100c20:	50                   	push   %eax
c0100c21:	68 9e b1 10 c0       	push   $0xc010b19e
c0100c26:	e8 1d 79 00 00       	call   c0108548 <Printf>
c0100c2b:	83 c4 10             	add    $0x10,%esp
c0100c2e:	8b 45 08             	mov    0x8(%ebp),%eax
c0100c31:	8b 40 0c             	mov    0xc(%eax),%eax
c0100c34:	83 ec 08             	sub    $0x8,%esp
c0100c37:	50                   	push   %eax
c0100c38:	68 a6 b1 10 c0       	push   $0xc010b1a6
c0100c3d:	e8 06 79 00 00       	call   c0108548 <Printf>
c0100c42:	83 c4 10             	add    $0x10,%esp
c0100c45:	8b 45 08             	mov    0x8(%ebp),%eax
c0100c48:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0100c4c:	0f b6 c0             	movzbl %al,%eax
c0100c4f:	83 ec 08             	sub    $0x8,%esp
c0100c52:	50                   	push   %eax
c0100c53:	68 b7 b1 10 c0       	push   $0xc010b1b7
c0100c58:	e8 eb 78 00 00       	call   c0108548 <Printf>
c0100c5d:	83 c4 10             	add    $0x10,%esp
c0100c60:	8b 45 08             	mov    0x8(%ebp),%eax
c0100c63:	0f b6 00             	movzbl (%eax),%eax
c0100c66:	0f b6 c0             	movzbl %al,%eax
c0100c69:	83 ec 08             	sub    $0x8,%esp
c0100c6c:	50                   	push   %eax
c0100c6d:	68 c5 b1 10 c0       	push   $0xc010b1c5
c0100c72:	e8 d1 78 00 00       	call   c0108548 <Printf>
c0100c77:	83 c4 10             	add    $0x10,%esp
c0100c7a:	90                   	nop
c0100c7b:	c9                   	leave  
c0100c7c:	c3                   	ret    

c0100c7d <get_partition_table>:
c0100c7d:	55                   	push   %ebp
c0100c7e:	89 e5                	mov    %esp,%ebp
c0100c80:	53                   	push   %ebx
c0100c81:	83 ec 24             	sub    $0x24,%esp
c0100c84:	89 e0                	mov    %esp,%eax
c0100c86:	89 c3                	mov    %eax,%ebx
c0100c88:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
c0100c8c:	c6 45 e2 01          	movb   $0x1,-0x1e(%ebp)
c0100c90:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100c93:	88 45 e3             	mov    %al,-0x1d(%ebp)
c0100c96:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100c99:	c1 f8 08             	sar    $0x8,%eax
c0100c9c:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0100c9f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100ca2:	c1 f8 10             	sar    $0x10,%eax
c0100ca5:	88 45 e5             	mov    %al,-0x1b(%ebp)
c0100ca8:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100cab:	c1 f8 18             	sar    $0x18,%eax
c0100cae:	89 c2                	mov    %eax,%edx
c0100cb0:	8b 45 08             	mov    0x8(%ebp),%eax
c0100cb3:	c1 e0 04             	shl    $0x4,%eax
c0100cb6:	09 d0                	or     %edx,%eax
c0100cb8:	83 c8 e0             	or     $0xffffffe0,%eax
c0100cbb:	88 45 e6             	mov    %al,-0x1a(%ebp)
c0100cbe:	c6 45 e7 20          	movb   $0x20,-0x19(%ebp)
c0100cc2:	83 ec 0c             	sub    $0xc,%esp
c0100cc5:	8d 45 e1             	lea    -0x1f(%ebp),%eax
c0100cc8:	50                   	push   %eax
c0100cc9:	e8 fc fb ff ff       	call   c01008ca <hd_cmd_out>
c0100cce:	83 c4 10             	add    $0x10,%esp
c0100cd1:	e8 29 04 00 00       	call   c01010ff <interrupt_wait>
c0100cd6:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c0100cdd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100ce0:	8d 50 ff             	lea    -0x1(%eax),%edx
c0100ce3:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0100ce6:	89 c2                	mov    %eax,%edx
c0100ce8:	b8 10 00 00 00       	mov    $0x10,%eax
c0100ced:	83 e8 01             	sub    $0x1,%eax
c0100cf0:	01 d0                	add    %edx,%eax
c0100cf2:	b9 10 00 00 00       	mov    $0x10,%ecx
c0100cf7:	ba 00 00 00 00       	mov    $0x0,%edx
c0100cfc:	f7 f1                	div    %ecx
c0100cfe:	6b c0 10             	imul   $0x10,%eax,%eax
c0100d01:	29 c4                	sub    %eax,%esp
c0100d03:	89 e0                	mov    %esp,%eax
c0100d05:	83 c0 00             	add    $0x0,%eax
c0100d08:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0100d0b:	83 ec 04             	sub    $0x4,%esp
c0100d0e:	ff 75 f4             	pushl  -0xc(%ebp)
c0100d11:	6a 00                	push   $0x0
c0100d13:	ff 75 ec             	pushl  -0x14(%ebp)
c0100d16:	e8 b4 b4 00 00       	call   c010c1cf <Memset>
c0100d1b:	83 c4 10             	add    $0x10,%esp
c0100d1e:	83 ec 04             	sub    $0x4,%esp
c0100d21:	ff 75 f4             	pushl  -0xc(%ebp)
c0100d24:	ff 75 ec             	pushl  -0x14(%ebp)
c0100d27:	68 f0 01 00 00       	push   $0x1f0
c0100d2c:	e8 f2 b4 00 00       	call   c010c223 <read_port>
c0100d31:	83 c4 10             	add    $0x10,%esp
c0100d34:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100d37:	05 be 01 00 00       	add    $0x1be,%eax
c0100d3c:	83 ec 04             	sub    $0x4,%esp
c0100d3f:	6a 40                	push   $0x40
c0100d41:	50                   	push   %eax
c0100d42:	ff 75 10             	pushl  0x10(%ebp)
c0100d45:	e8 42 5f 00 00       	call   c0106c8c <Memcpy>
c0100d4a:	83 c4 10             	add    $0x10,%esp
c0100d4d:	c7 45 e8 05 00 00 00 	movl   $0x5,-0x18(%ebp)
c0100d54:	89 dc                	mov    %ebx,%esp
c0100d56:	90                   	nop
c0100d57:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100d5a:	c9                   	leave  
c0100d5b:	c3                   	ret    

c0100d5c <partition>:
c0100d5c:	55                   	push   %ebp
c0100d5d:	89 e5                	mov    %esp,%ebp
c0100d5f:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0100d65:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100d68:	88 45 84             	mov    %al,-0x7c(%ebp)
c0100d6b:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c0100d6f:	7f 19                	jg     c0100d8a <partition+0x2e>
c0100d71:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0100d74:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0100d79:	89 c8                	mov    %ecx,%eax
c0100d7b:	f7 ea                	imul   %edx
c0100d7d:	d1 fa                	sar    %edx
c0100d7f:	89 c8                	mov    %ecx,%eax
c0100d81:	c1 f8 1f             	sar    $0x1f,%eax
c0100d84:	29 c2                	sub    %eax,%edx
c0100d86:	89 d0                	mov    %edx,%eax
c0100d88:	eb 11                	jmp    c0100d9b <partition+0x3f>
c0100d8a:	8b 45 08             	mov    0x8(%ebp),%eax
c0100d8d:	83 e8 10             	sub    $0x10,%eax
c0100d90:	8d 50 3f             	lea    0x3f(%eax),%edx
c0100d93:	85 c0                	test   %eax,%eax
c0100d95:	0f 48 c2             	cmovs  %edx,%eax
c0100d98:	c1 f8 06             	sar    $0x6,%eax
c0100d9b:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0100d9e:	80 7d 84 00          	cmpb   $0x0,-0x7c(%ebp)
c0100da2:	0f 85 cc 00 00 00    	jne    c0100e74 <partition+0x118>
c0100da8:	83 ec 04             	sub    $0x4,%esp
c0100dab:	6a 40                	push   $0x40
c0100dad:	6a 00                	push   $0x0
c0100daf:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100db2:	50                   	push   %eax
c0100db3:	e8 17 b4 00 00       	call   c010c1cf <Memset>
c0100db8:	83 c4 10             	add    $0x10,%esp
c0100dbb:	83 ec 04             	sub    $0x4,%esp
c0100dbe:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100dc1:	50                   	push   %eax
c0100dc2:	6a 00                	push   $0x0
c0100dc4:	ff 75 e8             	pushl  -0x18(%ebp)
c0100dc7:	e8 b1 fe ff ff       	call   c0100c7d <get_partition_table>
c0100dcc:	83 c4 10             	add    $0x10,%esp
c0100dcf:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100dd6:	e9 8a 00 00 00       	jmp    c0100e65 <partition+0x109>
c0100ddb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100dde:	83 c0 01             	add    $0x1,%eax
c0100de1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0100de4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100de7:	c1 e0 04             	shl    $0x4,%eax
c0100dea:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100ded:	01 c8                	add    %ecx,%eax
c0100def:	83 e8 5c             	sub    $0x5c,%eax
c0100df2:	8b 00                	mov    (%eax),%eax
c0100df4:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0100df7:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0100dfa:	c1 e1 03             	shl    $0x3,%ecx
c0100dfd:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0100e03:	01 ca                	add    %ecx,%edx
c0100e05:	81 c2 44 0f 11 c0    	add    $0xc0110f44,%edx
c0100e0b:	89 02                	mov    %eax,(%edx)
c0100e0d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100e10:	c1 e0 04             	shl    $0x4,%eax
c0100e13:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100e16:	01 c8                	add    %ecx,%eax
c0100e18:	83 e8 58             	sub    $0x58,%eax
c0100e1b:	8b 00                	mov    (%eax),%eax
c0100e1d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0100e20:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0100e23:	c1 e1 03             	shl    $0x3,%ecx
c0100e26:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0100e2c:	01 ca                	add    %ecx,%edx
c0100e2e:	81 c2 48 0f 11 c0    	add    $0xc0110f48,%edx
c0100e34:	89 02                	mov    %eax,(%edx)
c0100e36:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100e39:	c1 e0 04             	shl    $0x4,%eax
c0100e3c:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100e3f:	01 c8                	add    %ecx,%eax
c0100e41:	83 e8 60             	sub    $0x60,%eax
c0100e44:	0f b6 00             	movzbl (%eax),%eax
c0100e47:	3c 05                	cmp    $0x5,%al
c0100e49:	75 16                	jne    c0100e61 <partition+0x105>
c0100e4b:	8b 55 08             	mov    0x8(%ebp),%edx
c0100e4e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100e51:	01 d0                	add    %edx,%eax
c0100e53:	83 ec 08             	sub    $0x8,%esp
c0100e56:	6a 01                	push   $0x1
c0100e58:	50                   	push   %eax
c0100e59:	e8 fe fe ff ff       	call   c0100d5c <partition>
c0100e5e:	83 c4 10             	add    $0x10,%esp
c0100e61:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0100e65:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c0100e69:	0f 8e 6c ff ff ff    	jle    c0100ddb <partition+0x7f>
c0100e6f:	e9 ff 00 00 00       	jmp    c0100f73 <partition+0x217>
c0100e74:	80 7d 84 01          	cmpb   $0x1,-0x7c(%ebp)
c0100e78:	0f 85 f5 00 00 00    	jne    c0100f73 <partition+0x217>
c0100e7e:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0100e81:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0100e86:	89 c8                	mov    %ecx,%eax
c0100e88:	f7 ea                	imul   %edx
c0100e8a:	d1 fa                	sar    %edx
c0100e8c:	89 c8                	mov    %ecx,%eax
c0100e8e:	c1 f8 1f             	sar    $0x1f,%eax
c0100e91:	29 c2                	sub    %eax,%edx
c0100e93:	89 d0                	mov    %edx,%eax
c0100e95:	c1 e0 02             	shl    $0x2,%eax
c0100e98:	01 d0                	add    %edx,%eax
c0100e9a:	29 c1                	sub    %eax,%ecx
c0100e9c:	89 c8                	mov    %ecx,%eax
c0100e9e:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0100ea1:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0100ea4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100ea7:	c1 e2 03             	shl    $0x3,%edx
c0100eaa:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0100eb0:	01 d0                	add    %edx,%eax
c0100eb2:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c0100eb7:	8b 00                	mov    (%eax),%eax
c0100eb9:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0100ebc:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0100ebf:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100ec2:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0100ec5:	83 e8 01             	sub    $0x1,%eax
c0100ec8:	c1 e0 04             	shl    $0x4,%eax
c0100ecb:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0100ece:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0100ed5:	e9 8c 00 00 00       	jmp    c0100f66 <partition+0x20a>
c0100eda:	83 ec 04             	sub    $0x4,%esp
c0100edd:	6a 40                	push   $0x40
c0100edf:	6a 00                	push   $0x0
c0100ee1:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100ee4:	50                   	push   %eax
c0100ee5:	e8 e5 b2 00 00       	call   c010c1cf <Memset>
c0100eea:	83 c4 10             	add    $0x10,%esp
c0100eed:	83 ec 04             	sub    $0x4,%esp
c0100ef0:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100ef3:	50                   	push   %eax
c0100ef4:	ff 75 f0             	pushl  -0x10(%ebp)
c0100ef7:	ff 75 e8             	pushl  -0x18(%ebp)
c0100efa:	e8 7e fd ff ff       	call   c0100c7d <get_partition_table>
c0100eff:	83 c4 10             	add    $0x10,%esp
c0100f02:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0100f05:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100f08:	01 d0                	add    %edx,%eax
c0100f0a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0100f0d:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0100f10:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100f13:	01 c2                	add    %eax,%edx
c0100f15:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0100f18:	8d 48 04             	lea    0x4(%eax),%ecx
c0100f1b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100f1e:	c1 e1 03             	shl    $0x3,%ecx
c0100f21:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0100f27:	01 c8                	add    %ecx,%eax
c0100f29:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c0100f2e:	89 10                	mov    %edx,(%eax)
c0100f30:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0100f33:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0100f36:	8d 4a 04             	lea    0x4(%edx),%ecx
c0100f39:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0100f3c:	c1 e1 03             	shl    $0x3,%ecx
c0100f3f:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0100f45:	01 ca                	add    %ecx,%edx
c0100f47:	81 c2 48 0f 11 c0    	add    $0xc0110f48,%edx
c0100f4d:	89 02                	mov    %eax,(%edx)
c0100f4f:	0f b6 45 a8          	movzbl -0x58(%ebp),%eax
c0100f53:	84 c0                	test   %al,%al
c0100f55:	74 1b                	je     c0100f72 <partition+0x216>
c0100f57:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0100f5a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0100f5d:	01 d0                	add    %edx,%eax
c0100f5f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100f62:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0100f66:	83 7d ec 0f          	cmpl   $0xf,-0x14(%ebp)
c0100f6a:	0f 8e 6a ff ff ff    	jle    c0100eda <partition+0x17e>
c0100f70:	eb 01                	jmp    c0100f73 <partition+0x217>
c0100f72:	90                   	nop
c0100f73:	90                   	nop
c0100f74:	c9                   	leave  
c0100f75:	c3                   	ret    

c0100f76 <hd_open>:
c0100f76:	55                   	push   %ebp
c0100f77:	89 e5                	mov    %esp,%ebp
c0100f79:	83 ec 18             	sub    $0x18,%esp
c0100f7c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100f83:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100f86:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0100f8c:	05 40 0f 11 c0       	add    $0xc0110f40,%eax
c0100f91:	8b 00                	mov    (%eax),%eax
c0100f93:	8d 50 01             	lea    0x1(%eax),%edx
c0100f96:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100f99:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0100f9f:	05 40 0f 11 c0       	add    $0xc0110f40,%eax
c0100fa4:	89 10                	mov    %edx,(%eax)
c0100fa6:	83 ec 0c             	sub    $0xc,%esp
c0100fa9:	6a 00                	push   $0x0
c0100fab:	e8 1c fa ff ff       	call   c01009cc <hd_identify>
c0100fb0:	83 c4 10             	add    $0x10,%esp
c0100fb3:	83 ec 08             	sub    $0x8,%esp
c0100fb6:	6a 00                	push   $0x0
c0100fb8:	6a 00                	push   $0x0
c0100fba:	e8 9d fd ff ff       	call   c0100d5c <partition>
c0100fbf:	83 c4 10             	add    $0x10,%esp
c0100fc2:	83 ec 0c             	sub    $0xc,%esp
c0100fc5:	6a 7c                	push   $0x7c
c0100fc7:	e8 10 06 00 00       	call   c01015dc <sys_malloc>
c0100fcc:	83 c4 10             	add    $0x10,%esp
c0100fcf:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100fd2:	83 ec 04             	sub    $0x4,%esp
c0100fd5:	6a 7c                	push   $0x7c
c0100fd7:	6a 00                	push   $0x0
c0100fd9:	ff 75 f0             	pushl  -0x10(%ebp)
c0100fdc:	e8 ee b1 00 00       	call   c010c1cf <Memset>
c0100fe1:	83 c4 10             	add    $0x10,%esp
c0100fe4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100fe7:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0100fee:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100ff1:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0100ff8:	83 ec 04             	sub    $0x4,%esp
c0100ffb:	6a 02                	push   $0x2
c0100ffd:	ff 75 f0             	pushl  -0x10(%ebp)
c0101000:	6a 01                	push   $0x1
c0101002:	e8 0e 85 00 00       	call   c0109515 <send_rec>
c0101007:	83 c4 10             	add    $0x10,%esp
c010100a:	83 ec 08             	sub    $0x8,%esp
c010100d:	6a 7c                	push   $0x7c
c010100f:	ff 75 f0             	pushl  -0x10(%ebp)
c0101012:	e8 da 05 00 00       	call   c01015f1 <sys_free>
c0101017:	83 c4 10             	add    $0x10,%esp
c010101a:	90                   	nop
c010101b:	c9                   	leave  
c010101c:	c3                   	ret    

c010101d <get_hd_ioctl>:
c010101d:	55                   	push   %ebp
c010101e:	89 e5                	mov    %esp,%ebp
c0101020:	83 ec 18             	sub    $0x18,%esp
c0101023:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c0101027:	7f 19                	jg     c0101042 <get_hd_ioctl+0x25>
c0101029:	8b 4d 08             	mov    0x8(%ebp),%ecx
c010102c:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0101031:	89 c8                	mov    %ecx,%eax
c0101033:	f7 ea                	imul   %edx
c0101035:	d1 fa                	sar    %edx
c0101037:	89 c8                	mov    %ecx,%eax
c0101039:	c1 f8 1f             	sar    $0x1f,%eax
c010103c:	29 c2                	sub    %eax,%edx
c010103e:	89 d0                	mov    %edx,%eax
c0101040:	eb 11                	jmp    c0101053 <get_hd_ioctl+0x36>
c0101042:	8b 45 08             	mov    0x8(%ebp),%eax
c0101045:	83 e8 10             	sub    $0x10,%eax
c0101048:	8d 50 3f             	lea    0x3f(%eax),%edx
c010104b:	85 c0                	test   %eax,%eax
c010104d:	0f 48 c2             	cmovs  %edx,%eax
c0101050:	c1 f8 06             	sar    $0x6,%eax
c0101053:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101056:	8b 55 08             	mov    0x8(%ebp),%edx
c0101059:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010105c:	c1 e2 03             	shl    $0x3,%edx
c010105f:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0101065:	01 d0                	add    %edx,%eax
c0101067:	05 48 0f 11 c0       	add    $0xc0110f48,%eax
c010106c:	8b 00                	mov    (%eax),%eax
c010106e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0101071:	83 ec 0c             	sub    $0xc,%esp
c0101074:	6a 7c                	push   $0x7c
c0101076:	e8 61 05 00 00       	call   c01015dc <sys_malloc>
c010107b:	83 c4 10             	add    $0x10,%esp
c010107e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0101081:	83 ec 04             	sub    $0x4,%esp
c0101084:	6a 7c                	push   $0x7c
c0101086:	6a 00                	push   $0x0
c0101088:	ff 75 ec             	pushl  -0x14(%ebp)
c010108b:	e8 3f b1 00 00       	call   c010c1cf <Memset>
c0101090:	83 c4 10             	add    $0x10,%esp
c0101093:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101096:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c010109d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01010a0:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c01010a7:	83 ec 04             	sub    $0x4,%esp
c01010aa:	6a 02                	push   $0x2
c01010ac:	ff 75 ec             	pushl  -0x14(%ebp)
c01010af:	6a 01                	push   $0x1
c01010b1:	e8 5f 84 00 00       	call   c0109515 <send_rec>
c01010b6:	83 c4 10             	add    $0x10,%esp
c01010b9:	83 ec 08             	sub    $0x8,%esp
c01010bc:	6a 7c                	push   $0x7c
c01010be:	ff 75 ec             	pushl  -0x14(%ebp)
c01010c1:	e8 2b 05 00 00       	call   c01015f1 <sys_free>
c01010c6:	83 c4 10             	add    $0x10,%esp
c01010c9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01010cc:	c9                   	leave  
c01010cd:	c3                   	ret    

c01010ce <wait_for>:
c01010ce:	55                   	push   %ebp
c01010cf:	89 e5                	mov    %esp,%ebp
c01010d1:	83 ec 08             	sub    $0x8,%esp
c01010d4:	83 ec 04             	sub    $0x4,%esp
c01010d7:	68 50 c3 00 00       	push   $0xc350
c01010dc:	6a 08                	push   $0x8
c01010de:	6a 08                	push   $0x8
c01010e0:	e8 51 03 00 00       	call   c0101436 <waitfor>
c01010e5:	83 c4 10             	add    $0x10,%esp
c01010e8:	85 c0                	test   %eax,%eax
c01010ea:	75 10                	jne    c01010fc <wait_for+0x2e>
c01010ec:	83 ec 0c             	sub    $0xc,%esp
c01010ef:	68 d0 b1 10 c0       	push   $0xc010b1d0
c01010f4:	e8 8e 77 00 00       	call   c0108887 <panic>
c01010f9:	83 c4 10             	add    $0x10,%esp
c01010fc:	90                   	nop
c01010fd:	c9                   	leave  
c01010fe:	c3                   	ret    

c01010ff <interrupt_wait>:
c01010ff:	55                   	push   %ebp
c0101100:	89 e5                	mov    %esp,%ebp
c0101102:	83 ec 18             	sub    $0x18,%esp
c0101105:	83 ec 0c             	sub    $0xc,%esp
c0101108:	6a 7c                	push   $0x7c
c010110a:	e8 cd 04 00 00       	call   c01015dc <sys_malloc>
c010110f:	83 c4 10             	add    $0x10,%esp
c0101112:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101115:	83 ec 04             	sub    $0x4,%esp
c0101118:	6a 7c                	push   $0x7c
c010111a:	6a 00                	push   $0x0
c010111c:	ff 75 f4             	pushl  -0xc(%ebp)
c010111f:	e8 ab b0 00 00       	call   c010c1cf <Memset>
c0101124:	83 c4 10             	add    $0x10,%esp
c0101127:	83 ec 04             	sub    $0x4,%esp
c010112a:	68 13 02 00 00       	push   $0x213
c010112f:	ff 75 f4             	pushl  -0xc(%ebp)
c0101132:	6a 02                	push   $0x2
c0101134:	e8 dc 83 00 00       	call   c0109515 <send_rec>
c0101139:	83 c4 10             	add    $0x10,%esp
c010113c:	83 ec 08             	sub    $0x8,%esp
c010113f:	6a 7c                	push   $0x7c
c0101141:	ff 75 f4             	pushl  -0xc(%ebp)
c0101144:	e8 a8 04 00 00       	call   c01015f1 <sys_free>
c0101149:	83 c4 10             	add    $0x10,%esp
c010114c:	90                   	nop
c010114d:	c9                   	leave  
c010114e:	c3                   	ret    

c010114f <hd_rdwt>:
c010114f:	55                   	push   %ebp
c0101150:	89 e5                	mov    %esp,%ebp
c0101152:	81 ec c8 00 00 00    	sub    $0xc8,%esp
c0101158:	8b 45 08             	mov    0x8(%ebp),%eax
c010115b:	8b 40 18             	mov    0x18(%eax),%eax
c010115e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0101161:	8b 45 08             	mov    0x8(%ebp),%eax
c0101164:	8b 40 14             	mov    0x14(%eax),%eax
c0101167:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010116a:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c010116e:	7f 19                	jg     c0101189 <hd_rdwt+0x3a>
c0101170:	8b 4d e8             	mov    -0x18(%ebp),%ecx
c0101173:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0101178:	89 c8                	mov    %ecx,%eax
c010117a:	f7 ea                	imul   %edx
c010117c:	d1 fa                	sar    %edx
c010117e:	89 c8                	mov    %ecx,%eax
c0101180:	c1 f8 1f             	sar    $0x1f,%eax
c0101183:	29 c2                	sub    %eax,%edx
c0101185:	89 d0                	mov    %edx,%eax
c0101187:	eb 11                	jmp    c010119a <hd_rdwt+0x4b>
c0101189:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010118c:	83 e8 10             	sub    $0x10,%eax
c010118f:	8d 50 3f             	lea    0x3f(%eax),%edx
c0101192:	85 c0                	test   %eax,%eax
c0101194:	0f 48 c2             	cmovs  %edx,%eax
c0101197:	c1 f8 06             	sar    $0x6,%eax
c010119a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010119d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01011a0:	8d 50 f0             	lea    -0x10(%eax),%edx
c01011a3:	89 d0                	mov    %edx,%eax
c01011a5:	c1 f8 1f             	sar    $0x1f,%eax
c01011a8:	c1 e8 1a             	shr    $0x1a,%eax
c01011ab:	01 c2                	add    %eax,%edx
c01011ad:	83 e2 3f             	and    $0x3f,%edx
c01011b0:	29 c2                	sub    %eax,%edx
c01011b2:	89 d0                	mov    %edx,%eax
c01011b4:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01011b7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01011ba:	c1 e8 09             	shr    $0x9,%eax
c01011bd:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01011c0:	83 7d e8 08          	cmpl   $0x8,-0x18(%ebp)
c01011c4:	7f 1a                	jg     c01011e0 <hd_rdwt+0x91>
c01011c6:	8b 55 e8             	mov    -0x18(%ebp),%edx
c01011c9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01011cc:	c1 e2 03             	shl    $0x3,%edx
c01011cf:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c01011d5:	01 d0                	add    %edx,%eax
c01011d7:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c01011dc:	8b 00                	mov    (%eax),%eax
c01011de:	eb 1b                	jmp    c01011fb <hd_rdwt+0xac>
c01011e0:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01011e3:	8d 50 04             	lea    0x4(%eax),%edx
c01011e6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01011e9:	c1 e2 03             	shl    $0x3,%edx
c01011ec:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c01011f2:	01 d0                	add    %edx,%eax
c01011f4:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c01011f9:	8b 00                	mov    (%eax),%eax
c01011fb:	8b 55 dc             	mov    -0x24(%ebp),%edx
c01011fe:	01 d0                	add    %edx,%eax
c0101200:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0101203:	8b 45 08             	mov    0x8(%ebp),%eax
c0101206:	8b 40 0c             	mov    0xc(%eax),%eax
c0101209:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010120c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010120f:	05 ff 01 00 00       	add    $0x1ff,%eax
c0101214:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c010121a:	85 c0                	test   %eax,%eax
c010121c:	0f 48 c2             	cmovs  %edx,%eax
c010121f:	c1 f8 09             	sar    $0x9,%eax
c0101222:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0101225:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0101228:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010122b:	8b 45 08             	mov    0x8(%ebp),%eax
c010122e:	8b 40 10             	mov    0x10(%eax),%eax
c0101231:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0101234:	8b 45 08             	mov    0x8(%ebp),%eax
c0101237:	8b 00                	mov    (%eax),%eax
c0101239:	89 45 cc             	mov    %eax,-0x34(%ebp)
c010123c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010123f:	83 ec 08             	sub    $0x8,%esp
c0101242:	50                   	push   %eax
c0101243:	ff 75 d0             	pushl  -0x30(%ebp)
c0101246:	e8 d4 4b 00 00       	call   c0105e1f <alloc_virtual_memory>
c010124b:	83 c4 10             	add    $0x10,%esp
c010124e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0101251:	8b 45 08             	mov    0x8(%ebp),%eax
c0101254:	8b 40 78             	mov    0x78(%eax),%eax
c0101257:	89 45 c8             	mov    %eax,-0x38(%ebp)
c010125a:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c010125e:	74 22                	je     c0101282 <hd_rdwt+0x133>
c0101260:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c0101264:	74 1c                	je     c0101282 <hd_rdwt+0x133>
c0101266:	68 b7 01 00 00       	push   $0x1b7
c010126b:	68 20 b1 10 c0       	push   $0xc010b120
c0101270:	68 20 b1 10 c0       	push   $0xc010b120
c0101275:	68 e2 b1 10 c0       	push   $0xc010b1e2
c010127a:	e8 26 76 00 00       	call   c01088a5 <assertion_failure>
c010127f:	83 c4 10             	add    $0x10,%esp
c0101282:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
c0101286:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0101289:	88 45 be             	mov    %al,-0x42(%ebp)
c010128c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010128f:	88 45 bf             	mov    %al,-0x41(%ebp)
c0101292:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101295:	c1 f8 08             	sar    $0x8,%eax
c0101298:	88 45 c0             	mov    %al,-0x40(%ebp)
c010129b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010129e:	c1 f8 10             	sar    $0x10,%eax
c01012a1:	88 45 c1             	mov    %al,-0x3f(%ebp)
c01012a4:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01012a7:	c1 f8 18             	sar    $0x18,%eax
c01012aa:	83 e0 0f             	and    $0xf,%eax
c01012ad:	83 c8 e0             	or     $0xffffffe0,%eax
c01012b0:	88 45 c2             	mov    %al,-0x3e(%ebp)
c01012b3:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c01012b7:	75 07                	jne    c01012c0 <hd_rdwt+0x171>
c01012b9:	b8 20 00 00 00       	mov    $0x20,%eax
c01012be:	eb 05                	jmp    c01012c5 <hd_rdwt+0x176>
c01012c0:	b8 30 00 00 00       	mov    $0x30,%eax
c01012c5:	88 45 c3             	mov    %al,-0x3d(%ebp)
c01012c8:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c01012cc:	3c 20                	cmp    $0x20,%al
c01012ce:	74 24                	je     c01012f4 <hd_rdwt+0x1a5>
c01012d0:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c01012d4:	3c 30                	cmp    $0x30,%al
c01012d6:	74 1c                	je     c01012f4 <hd_rdwt+0x1a5>
c01012d8:	68 c5 01 00 00       	push   $0x1c5
c01012dd:	68 20 b1 10 c0       	push   $0xc010b120
c01012e2:	68 20 b1 10 c0       	push   $0xc010b120
c01012e7:	68 00 b2 10 c0       	push   $0xc010b200
c01012ec:	e8 b4 75 00 00       	call   c01088a5 <assertion_failure>
c01012f1:	83 c4 10             	add    $0x10,%esp
c01012f4:	83 ec 0c             	sub    $0xc,%esp
c01012f7:	8d 45 bd             	lea    -0x43(%ebp),%eax
c01012fa:	50                   	push   %eax
c01012fb:	e8 ca f5 ff ff       	call   c01008ca <hd_cmd_out>
c0101300:	83 c4 10             	add    $0x10,%esp
c0101303:	e9 9c 00 00 00       	jmp    c01013a4 <hd_rdwt+0x255>
c0101308:	b8 00 02 00 00       	mov    $0x200,%eax
c010130d:	81 7d f4 00 02 00 00 	cmpl   $0x200,-0xc(%ebp)
c0101314:	0f 4e 45 f4          	cmovle -0xc(%ebp),%eax
c0101318:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c010131b:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c010131f:	75 51                	jne    c0101372 <hd_rdwt+0x223>
c0101321:	e8 a8 fd ff ff       	call   c01010ce <wait_for>
c0101326:	e8 d4 fd ff ff       	call   c01010ff <interrupt_wait>
c010132b:	83 ec 04             	sub    $0x4,%esp
c010132e:	ff 75 c4             	pushl  -0x3c(%ebp)
c0101331:	6a 00                	push   $0x0
c0101333:	68 80 11 11 c0       	push   $0xc0111180
c0101338:	e8 92 ae 00 00       	call   c010c1cf <Memset>
c010133d:	83 c4 10             	add    $0x10,%esp
c0101340:	83 ec 04             	sub    $0x4,%esp
c0101343:	68 00 02 00 00       	push   $0x200
c0101348:	68 80 11 11 c0       	push   $0xc0111180
c010134d:	68 f0 01 00 00       	push   $0x1f0
c0101352:	e8 cc ae 00 00       	call   c010c223 <read_port>
c0101357:	83 c4 10             	add    $0x10,%esp
c010135a:	83 ec 04             	sub    $0x4,%esp
c010135d:	ff 75 c4             	pushl  -0x3c(%ebp)
c0101360:	68 80 11 11 c0       	push   $0xc0111180
c0101365:	ff 75 f0             	pushl  -0x10(%ebp)
c0101368:	e8 1f 59 00 00       	call   c0106c8c <Memcpy>
c010136d:	83 c4 10             	add    $0x10,%esp
c0101370:	eb 26                	jmp    c0101398 <hd_rdwt+0x249>
c0101372:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c0101376:	75 20                	jne    c0101398 <hd_rdwt+0x249>
c0101378:	e8 51 fd ff ff       	call   c01010ce <wait_for>
c010137d:	83 ec 04             	sub    $0x4,%esp
c0101380:	ff 75 c4             	pushl  -0x3c(%ebp)
c0101383:	ff 75 f0             	pushl  -0x10(%ebp)
c0101386:	68 f0 01 00 00       	push   $0x1f0
c010138b:	e8 a7 ae 00 00       	call   c010c237 <write_port>
c0101390:	83 c4 10             	add    $0x10,%esp
c0101393:	e8 67 fd ff ff       	call   c01010ff <interrupt_wait>
c0101398:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c010139b:	29 45 f4             	sub    %eax,-0xc(%ebp)
c010139e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01013a1:	01 45 f0             	add    %eax,-0x10(%ebp)
c01013a4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01013a8:	0f 85 5a ff ff ff    	jne    c0101308 <hd_rdwt+0x1b9>
c01013ae:	83 ec 04             	sub    $0x4,%esp
c01013b1:	6a 7c                	push   $0x7c
c01013b3:	6a 00                	push   $0x0
c01013b5:	8d 85 40 ff ff ff    	lea    -0xc0(%ebp),%eax
c01013bb:	50                   	push   %eax
c01013bc:	e8 0e ae 00 00       	call   c010c1cf <Memset>
c01013c1:	83 c4 10             	add    $0x10,%esp
c01013c4:	c7 45 b8 65 00 00 00 	movl   $0x65,-0x48(%ebp)
c01013cb:	c7 85 48 ff ff ff 00 	movl   $0x0,-0xb8(%ebp)
c01013d2:	00 00 00 
c01013d5:	83 ec 04             	sub    $0x4,%esp
c01013d8:	6a 02                	push   $0x2
c01013da:	8d 85 40 ff ff ff    	lea    -0xc0(%ebp),%eax
c01013e0:	50                   	push   %eax
c01013e1:	6a 01                	push   $0x1
c01013e3:	e8 2d 81 00 00       	call   c0109515 <send_rec>
c01013e8:	83 c4 10             	add    $0x10,%esp
c01013eb:	90                   	nop
c01013ec:	c9                   	leave  
c01013ed:	c3                   	ret    

c01013ee <hd_handler>:
c01013ee:	55                   	push   %ebp
c01013ef:	89 e5                	mov    %esp,%ebp
c01013f1:	83 ec 18             	sub    $0x18,%esp
c01013f4:	83 ec 0c             	sub    $0xc,%esp
c01013f7:	68 f7 01 00 00       	push   $0x1f7
c01013fc:	e8 e1 ee ff ff       	call   c01002e2 <in_byte>
c0101401:	83 c4 10             	add    $0x10,%esp
c0101404:	0f b6 c0             	movzbl %al,%eax
c0101407:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010140a:	83 ec 0c             	sub    $0xc,%esp
c010140d:	6a 03                	push   $0x3
c010140f:	e8 9b 83 00 00       	call   c01097af <inform_int>
c0101414:	83 c4 10             	add    $0x10,%esp
c0101417:	90                   	nop
c0101418:	c9                   	leave  
c0101419:	c3                   	ret    

c010141a <net_handler>:
c010141a:	55                   	push   %ebp
c010141b:	89 e5                	mov    %esp,%ebp
c010141d:	83 ec 08             	sub    $0x8,%esp
c0101420:	83 ec 0c             	sub    $0xc,%esp
c0101423:	68 34 b2 10 c0       	push   $0xc010b234
c0101428:	e8 1b 71 00 00       	call   c0108548 <Printf>
c010142d:	83 c4 10             	add    $0x10,%esp
c0101430:	66 87 db             	xchg   %bx,%bx
c0101433:	90                   	nop
c0101434:	c9                   	leave  
c0101435:	c3                   	ret    

c0101436 <waitfor>:
c0101436:	55                   	push   %ebp
c0101437:	89 e5                	mov    %esp,%ebp
c0101439:	83 ec 18             	sub    $0x18,%esp
c010143c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0101443:	eb 26                	jmp    c010146b <waitfor+0x35>
c0101445:	83 ec 0c             	sub    $0xc,%esp
c0101448:	68 f7 01 00 00       	push   $0x1f7
c010144d:	e8 90 ee ff ff       	call   c01002e2 <in_byte>
c0101452:	83 c4 10             	add    $0x10,%esp
c0101455:	0f b6 c0             	movzbl %al,%eax
c0101458:	23 45 08             	and    0x8(%ebp),%eax
c010145b:	39 45 0c             	cmp    %eax,0xc(%ebp)
c010145e:	75 07                	jne    c0101467 <waitfor+0x31>
c0101460:	b8 01 00 00 00       	mov    $0x1,%eax
c0101465:	eb 11                	jmp    c0101478 <waitfor+0x42>
c0101467:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c010146b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010146e:	3b 45 10             	cmp    0x10(%ebp),%eax
c0101471:	7c d2                	jl     c0101445 <waitfor+0xf>
c0101473:	b8 00 00 00 00       	mov    $0x0,%eax
c0101478:	c9                   	leave  
c0101479:	c3                   	ret    

c010147a <print_hd_info>:
c010147a:	55                   	push   %ebp
c010147b:	89 e5                	mov    %esp,%ebp
c010147d:	83 ec 18             	sub    $0x18,%esp
c0101480:	83 ec 0c             	sub    $0xc,%esp
c0101483:	68 56 b2 10 c0       	push   $0xc010b256
c0101488:	e8 bb 70 00 00       	call   c0108548 <Printf>
c010148d:	83 c4 10             	add    $0x10,%esp
c0101490:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0101497:	eb 3b                	jmp    c01014d4 <print_hd_info+0x5a>
c0101499:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010149c:	8b 04 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%eax
c01014a3:	85 c0                	test   %eax,%eax
c01014a5:	74 28                	je     c01014cf <print_hd_info+0x55>
c01014a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01014aa:	8b 14 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%edx
c01014b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01014b4:	8b 04 c5 44 0f 11 c0 	mov    -0x3feef0bc(,%eax,8),%eax
c01014bb:	ff 75 f4             	pushl  -0xc(%ebp)
c01014be:	52                   	push   %edx
c01014bf:	50                   	push   %eax
c01014c0:	68 73 b2 10 c0       	push   $0xc010b273
c01014c5:	e8 7e 70 00 00       	call   c0108548 <Printf>
c01014ca:	83 c4 10             	add    $0x10,%esp
c01014cd:	eb 01                	jmp    c01014d0 <print_hd_info+0x56>
c01014cf:	90                   	nop
c01014d0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01014d4:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c01014d8:	7e bf                	jle    c0101499 <print_hd_info+0x1f>
c01014da:	83 ec 0c             	sub    $0xc,%esp
c01014dd:	68 8b b2 10 c0       	push   $0xc010b28b
c01014e2:	e8 61 70 00 00       	call   c0108548 <Printf>
c01014e7:	83 c4 10             	add    $0x10,%esp
c01014ea:	83 ec 0c             	sub    $0xc,%esp
c01014ed:	68 a6 b2 10 c0       	push   $0xc010b2a6
c01014f2:	e8 51 70 00 00       	call   c0108548 <Printf>
c01014f7:	83 c4 10             	add    $0x10,%esp
c01014fa:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%ebp)
c0101501:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0101508:	eb 44                	jmp    c010154e <print_hd_info+0xd4>
c010150a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010150d:	83 c0 04             	add    $0x4,%eax
c0101510:	8b 04 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%eax
c0101517:	85 c0                	test   %eax,%eax
c0101519:	74 2e                	je     c0101549 <print_hd_info+0xcf>
c010151b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010151e:	83 c0 04             	add    $0x4,%eax
c0101521:	8b 14 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%edx
c0101528:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010152b:	83 c0 04             	add    $0x4,%eax
c010152e:	8b 04 c5 44 0f 11 c0 	mov    -0x3feef0bc(,%eax,8),%eax
c0101535:	ff 75 f0             	pushl  -0x10(%ebp)
c0101538:	52                   	push   %edx
c0101539:	50                   	push   %eax
c010153a:	68 73 b2 10 c0       	push   $0xc010b273
c010153f:	e8 04 70 00 00       	call   c0108548 <Printf>
c0101544:	83 c4 10             	add    $0x10,%esp
c0101547:	eb 01                	jmp    c010154a <print_hd_info+0xd0>
c0101549:	90                   	nop
c010154a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c010154e:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c0101552:	7e b6                	jle    c010150a <print_hd_info+0x90>
c0101554:	83 ec 0c             	sub    $0xc,%esp
c0101557:	68 c3 b2 10 c0       	push   $0xc010b2c3
c010155c:	e8 e7 6f 00 00       	call   c0108548 <Printf>
c0101561:	83 c4 10             	add    $0x10,%esp
c0101564:	90                   	nop
c0101565:	c9                   	leave  
c0101566:	c3                   	ret    

c0101567 <is_empty>:
c0101567:	55                   	push   %ebp
c0101568:	89 e5                	mov    %esp,%ebp
c010156a:	83 ec 10             	sub    $0x10,%esp
c010156d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0101574:	eb 1a                	jmp    c0101590 <is_empty+0x29>
c0101576:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0101579:	8b 45 08             	mov    0x8(%ebp),%eax
c010157c:	01 d0                	add    %edx,%eax
c010157e:	0f b6 00             	movzbl (%eax),%eax
c0101581:	84 c0                	test   %al,%al
c0101583:	74 07                	je     c010158c <is_empty+0x25>
c0101585:	b8 00 00 00 00       	mov    $0x0,%eax
c010158a:	eb 11                	jmp    c010159d <is_empty+0x36>
c010158c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0101590:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0101593:	3b 45 0c             	cmp    0xc(%ebp),%eax
c0101596:	7c de                	jl     c0101576 <is_empty+0xf>
c0101598:	b8 01 00 00 00       	mov    $0x1,%eax
c010159d:	c9                   	leave  
c010159e:	c3                   	ret    
c010159f:	90                   	nop

c01015a0 <write_debug>:
c01015a0:	b8 02 00 00 00       	mov    $0x2,%eax
c01015a5:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c01015a9:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c01015ad:	cd 90                	int    $0x90
c01015af:	c3                   	ret    

c01015b0 <send_msg>:
c01015b0:	55                   	push   %ebp
c01015b1:	89 e5                	mov    %esp,%ebp
c01015b3:	53                   	push   %ebx
c01015b4:	51                   	push   %ecx
c01015b5:	b8 03 00 00 00       	mov    $0x3,%eax
c01015ba:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c01015bd:	8b 4d 08             	mov    0x8(%ebp),%ecx
c01015c0:	cd 90                	int    $0x90
c01015c2:	59                   	pop    %ecx
c01015c3:	5b                   	pop    %ebx
c01015c4:	5d                   	pop    %ebp
c01015c5:	c3                   	ret    

c01015c6 <receive_msg>:
c01015c6:	55                   	push   %ebp
c01015c7:	89 e5                	mov    %esp,%ebp
c01015c9:	53                   	push   %ebx
c01015ca:	51                   	push   %ecx
c01015cb:	b8 04 00 00 00       	mov    $0x4,%eax
c01015d0:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c01015d3:	8b 4d 08             	mov    0x8(%ebp),%ecx
c01015d6:	cd 90                	int    $0x90
c01015d8:	59                   	pop    %ecx
c01015d9:	5b                   	pop    %ebx
c01015da:	5d                   	pop    %ebp
c01015db:	c3                   	ret    

c01015dc <sys_malloc>:
c01015dc:	56                   	push   %esi
c01015dd:	57                   	push   %edi
c01015de:	53                   	push   %ebx
c01015df:	55                   	push   %ebp
c01015e0:	89 e5                	mov    %esp,%ebp
c01015e2:	b8 05 00 00 00       	mov    $0x5,%eax
c01015e7:	8b 4d 14             	mov    0x14(%ebp),%ecx
c01015ea:	cd 90                	int    $0x90
c01015ec:	5d                   	pop    %ebp
c01015ed:	5b                   	pop    %ebx
c01015ee:	5f                   	pop    %edi
c01015ef:	5e                   	pop    %esi
c01015f0:	c3                   	ret    

c01015f1 <sys_free>:
c01015f1:	56                   	push   %esi
c01015f2:	57                   	push   %edi
c01015f3:	53                   	push   %ebx
c01015f4:	55                   	push   %ebp
c01015f5:	89 e5                	mov    %esp,%ebp
c01015f7:	b8 06 00 00 00       	mov    $0x6,%eax
c01015fc:	8b 4d 14             	mov    0x14(%ebp),%ecx
c01015ff:	8b 5d 18             	mov    0x18(%ebp),%ebx
c0101602:	cd 90                	int    $0x90
c0101604:	5d                   	pop    %ebp
c0101605:	5b                   	pop    %ebx
c0101606:	5f                   	pop    %edi
c0101607:	5e                   	pop    %esi
c0101608:	c3                   	ret    

c0101609 <task_fs>:
c0101609:	55                   	push   %ebp
c010160a:	89 e5                	mov    %esp,%ebp
c010160c:	83 ec 28             	sub    $0x28,%esp
c010160f:	e8 bb 08 00 00       	call   c0101ecf <init_fs>
c0101614:	83 ec 0c             	sub    $0xc,%esp
c0101617:	6a 7c                	push   $0x7c
c0101619:	e8 be ff ff ff       	call   c01015dc <sys_malloc>
c010161e:	83 c4 10             	add    $0x10,%esp
c0101621:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101624:	83 ec 0c             	sub    $0xc,%esp
c0101627:	6a 7c                	push   $0x7c
c0101629:	e8 ae ff ff ff       	call   c01015dc <sys_malloc>
c010162e:	83 c4 10             	add    $0x10,%esp
c0101631:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0101634:	83 ec 04             	sub    $0x4,%esp
c0101637:	6a 7c                	push   $0x7c
c0101639:	6a 00                	push   $0x0
c010163b:	ff 75 f4             	pushl  -0xc(%ebp)
c010163e:	e8 8c ab 00 00       	call   c010c1cf <Memset>
c0101643:	83 c4 10             	add    $0x10,%esp
c0101646:	83 ec 04             	sub    $0x4,%esp
c0101649:	6a 12                	push   $0x12
c010164b:	ff 75 f4             	pushl  -0xc(%ebp)
c010164e:	6a 02                	push   $0x2
c0101650:	e8 c0 7e 00 00       	call   c0109515 <send_rec>
c0101655:	83 c4 10             	add    $0x10,%esp
c0101658:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010165b:	8b 40 78             	mov    0x78(%eax),%eax
c010165e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0101661:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101664:	8b 00                	mov    (%eax),%eax
c0101666:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0101669:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010166c:	8b 40 50             	mov    0x50(%eax),%eax
c010166f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0101672:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101675:	8b 40 68             	mov    0x68(%eax),%eax
c0101678:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010167b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010167e:	8b 00                	mov    (%eax),%eax
c0101680:	85 c0                	test   %eax,%eax
c0101682:	75 07                	jne    c010168b <task_fs+0x82>
c0101684:	c7 45 dc 05 00 00 00 	movl   $0x5,-0x24(%ebp)
c010168b:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0101692:	83 ec 0c             	sub    $0xc,%esp
c0101695:	ff 75 e8             	pushl  -0x18(%ebp)
c0101698:	e8 39 21 00 00       	call   c01037d6 <pid2proc>
c010169d:	83 c4 10             	add    $0x10,%esp
c01016a0:	a3 c8 fb 10 c0       	mov    %eax,0xc010fbc8
c01016a5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c01016a9:	74 37                	je     c01016e2 <task_fs+0xd9>
c01016ab:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
c01016af:	74 31                	je     c01016e2 <task_fs+0xd9>
c01016b1:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c01016b5:	74 2b                	je     c01016e2 <task_fs+0xd9>
c01016b7:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
c01016bb:	74 25                	je     c01016e2 <task_fs+0xd9>
c01016bd:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
c01016c1:	74 1f                	je     c01016e2 <task_fs+0xd9>
c01016c3:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
c01016c7:	74 19                	je     c01016e2 <task_fs+0xd9>
c01016c9:	6a 7a                	push   $0x7a
c01016cb:	68 e4 b2 10 c0       	push   $0xc010b2e4
c01016d0:	68 e4 b2 10 c0       	push   $0xc010b2e4
c01016d5:	68 f4 b2 10 c0       	push   $0xc010b2f4
c01016da:	e8 c6 71 00 00       	call   c01088a5 <assertion_failure>
c01016df:	83 c4 10             	add    $0x10,%esp
c01016e2:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c01016e6:	74 3a                	je     c0101722 <task_fs+0x119>
c01016e8:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c01016ec:	7f 19                	jg     c0101707 <task_fs+0xfe>
c01016ee:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c01016f2:	0f 84 10 01 00 00    	je     c0101808 <task_fs+0x1ff>
c01016f8:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
c01016fc:	0f 84 a1 00 00 00    	je     c01017a3 <task_fs+0x19a>
c0101702:	e9 ef 00 00 00       	jmp    c01017f6 <task_fs+0x1ed>
c0101707:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
c010170b:	74 50                	je     c010175d <task_fs+0x154>
c010170d:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
c0101711:	0f 84 c6 00 00 00    	je     c01017dd <task_fs+0x1d4>
c0101717:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
c010171b:	74 40                	je     c010175d <task_fs+0x154>
c010171d:	e9 d4 00 00 00       	jmp    c01017f6 <task_fs+0x1ed>
c0101722:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101725:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c010172c:	83 ec 0c             	sub    $0xc,%esp
c010172f:	ff 75 f4             	pushl  -0xc(%ebp)
c0101732:	e8 ec 07 00 00       	call   c0101f23 <do_open>
c0101737:	83 c4 10             	add    $0x10,%esp
c010173a:	89 c2                	mov    %eax,%edx
c010173c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010173f:	89 50 50             	mov    %edx,0x50(%eax)
c0101742:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101745:	8b 00                	mov    (%eax),%eax
c0101747:	83 ec 04             	sub    $0x4,%esp
c010174a:	50                   	push   %eax
c010174b:	ff 75 f4             	pushl  -0xc(%ebp)
c010174e:	6a 01                	push   $0x1
c0101750:	e8 c0 7d 00 00       	call   c0109515 <send_rec>
c0101755:	83 c4 10             	add    $0x10,%esp
c0101758:	e9 b2 00 00 00       	jmp    c010180f <task_fs+0x206>
c010175d:	83 ec 0c             	sub    $0xc,%esp
c0101760:	ff 75 f4             	pushl  -0xc(%ebp)
c0101763:	e8 19 19 00 00       	call   c0103081 <do_rdwt>
c0101768:	83 c4 10             	add    $0x10,%esp
c010176b:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010176e:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
c0101772:	0f 84 96 00 00 00    	je     c010180e <task_fs+0x205>
c0101778:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010177b:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0101782:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0101785:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101788:	89 50 60             	mov    %edx,0x60(%eax)
c010178b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010178e:	8b 00                	mov    (%eax),%eax
c0101790:	83 ec 04             	sub    $0x4,%esp
c0101793:	50                   	push   %eax
c0101794:	ff 75 f4             	pushl  -0xc(%ebp)
c0101797:	6a 01                	push   $0x1
c0101799:	e8 77 7d 00 00       	call   c0109515 <send_rec>
c010179e:	83 c4 10             	add    $0x10,%esp
c01017a1:	eb 6b                	jmp    c010180e <task_fs+0x205>
c01017a3:	83 ec 0c             	sub    $0xc,%esp
c01017a6:	ff 75 e4             	pushl  -0x1c(%ebp)
c01017a9:	e8 f0 1d 00 00       	call   c010359e <do_close>
c01017ae:	83 c4 10             	add    $0x10,%esp
c01017b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01017b4:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c01017bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01017be:	c7 40 58 00 00 00 00 	movl   $0x0,0x58(%eax)
c01017c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01017c8:	8b 00                	mov    (%eax),%eax
c01017ca:	83 ec 04             	sub    $0x4,%esp
c01017cd:	50                   	push   %eax
c01017ce:	ff 75 f4             	pushl  -0xc(%ebp)
c01017d1:	6a 01                	push   $0x1
c01017d3:	e8 3d 7d 00 00       	call   c0109515 <send_rec>
c01017d8:	83 c4 10             	add    $0x10,%esp
c01017db:	eb 32                	jmp    c010180f <task_fs+0x206>
c01017dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01017e0:	8b 40 68             	mov    0x68(%eax),%eax
c01017e3:	83 ec 04             	sub    $0x4,%esp
c01017e6:	50                   	push   %eax
c01017e7:	ff 75 f4             	pushl  -0xc(%ebp)
c01017ea:	6a 01                	push   $0x1
c01017ec:	e8 24 7d 00 00       	call   c0109515 <send_rec>
c01017f1:	83 c4 10             	add    $0x10,%esp
c01017f4:	eb 19                	jmp    c010180f <task_fs+0x206>
c01017f6:	83 ec 0c             	sub    $0xc,%esp
c01017f9:	68 57 b3 10 c0       	push   $0xc010b357
c01017fe:	e8 84 70 00 00       	call   c0108887 <panic>
c0101803:	83 c4 10             	add    $0x10,%esp
c0101806:	eb 07                	jmp    c010180f <task_fs+0x206>
c0101808:	90                   	nop
c0101809:	e9 26 fe ff ff       	jmp    c0101634 <task_fs+0x2b>
c010180e:	90                   	nop
c010180f:	e9 20 fe ff ff       	jmp    c0101634 <task_fs+0x2b>

c0101814 <rd_wt>:
c0101814:	55                   	push   %ebp
c0101815:	89 e5                	mov    %esp,%ebp
c0101817:	83 ec 18             	sub    $0x18,%esp
c010181a:	83 ec 0c             	sub    $0xc,%esp
c010181d:	6a 7c                	push   $0x7c
c010181f:	e8 b8 fd ff ff       	call   c01015dc <sys_malloc>
c0101824:	83 c4 10             	add    $0x10,%esp
c0101827:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010182a:	83 ec 04             	sub    $0x4,%esp
c010182d:	6a 7c                	push   $0x7c
c010182f:	6a 00                	push   $0x0
c0101831:	ff 75 f4             	pushl  -0xc(%ebp)
c0101834:	e8 96 a9 00 00       	call   c010c1cf <Memset>
c0101839:	83 c4 10             	add    $0x10,%esp
c010183c:	8b 55 18             	mov    0x18(%ebp),%edx
c010183f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101842:	89 50 78             	mov    %edx,0x78(%eax)
c0101845:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101848:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010184b:	89 50 14             	mov    %edx,0x14(%eax)
c010184e:	8b 55 10             	mov    0x10(%ebp),%edx
c0101851:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101854:	89 50 10             	mov    %edx,0x10(%eax)
c0101857:	8b 55 14             	mov    0x14(%ebp),%edx
c010185a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010185d:	89 50 0c             	mov    %edx,0xc(%eax)
c0101860:	8b 45 08             	mov    0x8(%ebp),%eax
c0101863:	c1 e0 09             	shl    $0x9,%eax
c0101866:	89 c2                	mov    %eax,%edx
c0101868:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010186b:	89 50 18             	mov    %edx,0x18(%eax)
c010186e:	83 7d 18 07          	cmpl   $0x7,0x18(%ebp)
c0101872:	74 22                	je     c0101896 <rd_wt+0x82>
c0101874:	83 7d 18 0a          	cmpl   $0xa,0x18(%ebp)
c0101878:	74 1c                	je     c0101896 <rd_wt+0x82>
c010187a:	68 b1 00 00 00       	push   $0xb1
c010187f:	68 e4 b2 10 c0       	push   $0xc010b2e4
c0101884:	68 e4 b2 10 c0       	push   $0xc010b2e4
c0101889:	68 6a b3 10 c0       	push   $0xc010b36a
c010188e:	e8 12 70 00 00       	call   c01088a5 <assertion_failure>
c0101893:	83 c4 10             	add    $0x10,%esp
c0101896:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101899:	8b 40 78             	mov    0x78(%eax),%eax
c010189c:	83 f8 07             	cmp    $0x7,%eax
c010189f:	74 27                	je     c01018c8 <rd_wt+0xb4>
c01018a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01018a4:	8b 40 78             	mov    0x78(%eax),%eax
c01018a7:	83 f8 0a             	cmp    $0xa,%eax
c01018aa:	74 1c                	je     c01018c8 <rd_wt+0xb4>
c01018ac:	68 b2 00 00 00       	push   $0xb2
c01018b1:	68 e4 b2 10 c0       	push   $0xc010b2e4
c01018b6:	68 e4 b2 10 c0       	push   $0xc010b2e4
c01018bb:	68 88 b3 10 c0       	push   $0xc010b388
c01018c0:	e8 e0 6f 00 00       	call   c01088a5 <assertion_failure>
c01018c5:	83 c4 10             	add    $0x10,%esp
c01018c8:	83 ec 04             	sub    $0x4,%esp
c01018cb:	6a 03                	push   $0x3
c01018cd:	ff 75 f4             	pushl  -0xc(%ebp)
c01018d0:	6a 03                	push   $0x3
c01018d2:	e8 3e 7c 00 00       	call   c0109515 <send_rec>
c01018d7:	83 c4 10             	add    $0x10,%esp
c01018da:	83 ec 08             	sub    $0x8,%esp
c01018dd:	6a 7c                	push   $0x7c
c01018df:	ff 75 f4             	pushl  -0xc(%ebp)
c01018e2:	e8 0a fd ff ff       	call   c01015f1 <sys_free>
c01018e7:	83 c4 10             	add    $0x10,%esp
c01018ea:	90                   	nop
c01018eb:	c9                   	leave  
c01018ec:	c3                   	ret    

c01018ed <mkfs>:
c01018ed:	55                   	push   %ebp
c01018ee:	89 e5                	mov    %esp,%ebp
c01018f0:	57                   	push   %edi
c01018f1:	81 ec d4 00 00 00    	sub    $0xd4,%esp
c01018f7:	83 ec 0c             	sub    $0xc,%esp
c01018fa:	68 00 80 00 00       	push   $0x8000
c01018ff:	e8 d8 fc ff ff       	call   c01015dc <sys_malloc>
c0101904:	83 c4 10             	add    $0x10,%esp
c0101907:	a3 a4 21 11 c0       	mov    %eax,0xc01121a4
c010190c:	83 ec 0c             	sub    $0xc,%esp
c010190f:	6a 24                	push   $0x24
c0101911:	e8 c6 fc ff ff       	call   c01015dc <sys_malloc>
c0101916:	83 c4 10             	add    $0x10,%esp
c0101919:	a3 a0 21 11 c0       	mov    %eax,0xc01121a0
c010191e:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101923:	83 ec 0c             	sub    $0xc,%esp
c0101926:	50                   	push   %eax
c0101927:	e8 42 46 00 00       	call   c0105f6e <get_physical_address>
c010192c:	83 c4 10             	add    $0x10,%esp
c010192f:	a3 84 17 11 c0       	mov    %eax,0xc0111784
c0101934:	a1 a0 21 11 c0       	mov    0xc01121a0,%eax
c0101939:	83 ec 0c             	sub    $0xc,%esp
c010193c:	50                   	push   %eax
c010193d:	e8 2c 46 00 00       	call   c0105f6e <get_physical_address>
c0101942:	83 c4 10             	add    $0x10,%esp
c0101945:	a3 80 17 11 c0       	mov    %eax,0xc0111780
c010194a:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c010194f:	83 ec 04             	sub    $0x4,%esp
c0101952:	68 00 02 00 00       	push   $0x200
c0101957:	6a 00                	push   $0x0
c0101959:	50                   	push   %eax
c010195a:	e8 70 a8 00 00       	call   c010c1cf <Memset>
c010195f:	83 c4 10             	add    $0x10,%esp
c0101962:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101967:	83 ec 0c             	sub    $0xc,%esp
c010196a:	6a 0a                	push   $0xa
c010196c:	68 00 02 00 00       	push   $0x200
c0101971:	50                   	push   %eax
c0101972:	6a 20                	push   $0x20
c0101974:	6a 00                	push   $0x0
c0101976:	e8 99 fe ff ff       	call   c0101814 <rd_wt>
c010197b:	83 c4 20             	add    $0x20,%esp
c010197e:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101983:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0101986:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101989:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c0101990:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101993:	c7 40 10 00 08 00 00 	movl   $0x800,0x10(%eax)
c010199a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010199d:	c7 40 08 00 08 00 00 	movl   $0x800,0x8(%eax)
c01019a4:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01019a7:	c7 40 0c 00 01 00 00 	movl   $0x100,0xc(%eax)
c01019ae:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01019b1:	8b 40 04             	mov    0x4(%eax),%eax
c01019b4:	8d 50 02             	lea    0x2(%eax),%edx
c01019b7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01019ba:	8b 40 08             	mov    0x8(%eax),%eax
c01019bd:	01 c2                	add    %eax,%edx
c01019bf:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01019c2:	8b 40 0c             	mov    0xc(%eax),%eax
c01019c5:	01 c2                	add    %eax,%edx
c01019c7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01019ca:	89 10                	mov    %edx,(%eax)
c01019cc:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c01019d3:	b8 00 02 00 00       	mov    $0x200,%eax
c01019d8:	2b 45 d8             	sub    -0x28(%ebp),%eax
c01019db:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c01019e1:	8b 55 d8             	mov    -0x28(%ebp),%edx
c01019e4:	01 ca                	add    %ecx,%edx
c01019e6:	83 ec 04             	sub    $0x4,%esp
c01019e9:	50                   	push   %eax
c01019ea:	6a 80                	push   $0xffffff80
c01019ec:	52                   	push   %edx
c01019ed:	e8 dd a7 00 00       	call   c010c1cf <Memset>
c01019f2:	83 c4 10             	add    $0x10,%esp
c01019f5:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01019fa:	83 ec 0c             	sub    $0xc,%esp
c01019fd:	6a 0a                	push   $0xa
c01019ff:	68 00 02 00 00       	push   $0x200
c0101a04:	50                   	push   %eax
c0101a05:	6a 20                	push   $0x20
c0101a07:	6a 01                	push   $0x1
c0101a09:	e8 06 fe ff ff       	call   c0101814 <rd_wt>
c0101a0e:	83 c4 20             	add    $0x20,%esp
c0101a11:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101a14:	8b 10                	mov    (%eax),%edx
c0101a16:	89 55 98             	mov    %edx,-0x68(%ebp)
c0101a19:	8b 50 04             	mov    0x4(%eax),%edx
c0101a1c:	89 55 9c             	mov    %edx,-0x64(%ebp)
c0101a1f:	8b 50 08             	mov    0x8(%eax),%edx
c0101a22:	89 55 a0             	mov    %edx,-0x60(%ebp)
c0101a25:	8b 50 0c             	mov    0xc(%eax),%edx
c0101a28:	89 55 a4             	mov    %edx,-0x5c(%ebp)
c0101a2b:	8b 50 10             	mov    0x10(%eax),%edx
c0101a2e:	89 55 a8             	mov    %edx,-0x58(%ebp)
c0101a31:	8b 50 14             	mov    0x14(%eax),%edx
c0101a34:	89 55 ac             	mov    %edx,-0x54(%ebp)
c0101a37:	8b 50 18             	mov    0x18(%eax),%edx
c0101a3a:	89 55 b0             	mov    %edx,-0x50(%ebp)
c0101a3d:	8b 50 1c             	mov    0x1c(%eax),%edx
c0101a40:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c0101a43:	8b 40 20             	mov    0x20(%eax),%eax
c0101a46:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0101a49:	c6 45 d7 3f          	movb   $0x3f,-0x29(%ebp)
c0101a4d:	0f be 55 d7          	movsbl -0x29(%ebp),%edx
c0101a51:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101a56:	83 ec 04             	sub    $0x4,%esp
c0101a59:	6a 01                	push   $0x1
c0101a5b:	52                   	push   %edx
c0101a5c:	50                   	push   %eax
c0101a5d:	e8 6d a7 00 00       	call   c010c1cf <Memset>
c0101a62:	83 c4 10             	add    $0x10,%esp
c0101a65:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101a6a:	83 c0 01             	add    $0x1,%eax
c0101a6d:	83 ec 04             	sub    $0x4,%esp
c0101a70:	68 ff 01 00 00       	push   $0x1ff
c0101a75:	6a 80                	push   $0xffffff80
c0101a77:	50                   	push   %eax
c0101a78:	e8 52 a7 00 00       	call   c010c1cf <Memset>
c0101a7d:	83 c4 10             	add    $0x10,%esp
c0101a80:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101a85:	83 ec 0c             	sub    $0xc,%esp
c0101a88:	6a 0a                	push   $0xa
c0101a8a:	68 00 02 00 00       	push   $0x200
c0101a8f:	50                   	push   %eax
c0101a90:	6a 20                	push   $0x20
c0101a92:	6a 02                	push   $0x2
c0101a94:	e8 7b fd ff ff       	call   c0101814 <rd_wt>
c0101a99:	83 c4 20             	add    $0x20,%esp
c0101a9c:	c7 45 d0 03 00 00 00 	movl   $0x3,-0x30(%ebp)
c0101aa3:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101aa8:	83 ec 04             	sub    $0x4,%esp
c0101aab:	68 00 02 00 00       	push   $0x200
c0101ab0:	6a ff                	push   $0xffffffff
c0101ab2:	50                   	push   %eax
c0101ab3:	e8 17 a7 00 00       	call   c010c1cf <Memset>
c0101ab8:	83 c4 10             	add    $0x10,%esp
c0101abb:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101ac0:	83 ec 0c             	sub    $0xc,%esp
c0101ac3:	6a 0a                	push   $0xa
c0101ac5:	68 00 02 00 00       	push   $0x200
c0101aca:	50                   	push   %eax
c0101acb:	6a 20                	push   $0x20
c0101acd:	ff 75 d0             	pushl  -0x30(%ebp)
c0101ad0:	e8 3f fd ff ff       	call   c0101814 <rd_wt>
c0101ad5:	83 c4 20             	add    $0x20,%esp
c0101ad8:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101add:	83 ec 04             	sub    $0x4,%esp
c0101ae0:	6a 01                	push   $0x1
c0101ae2:	6a 01                	push   $0x1
c0101ae4:	50                   	push   %eax
c0101ae5:	e8 e5 a6 00 00       	call   c010c1cf <Memset>
c0101aea:	83 c4 10             	add    $0x10,%esp
c0101aed:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101af2:	83 c0 01             	add    $0x1,%eax
c0101af5:	83 ec 04             	sub    $0x4,%esp
c0101af8:	68 ff 01 00 00       	push   $0x1ff
c0101afd:	6a 00                	push   $0x0
c0101aff:	50                   	push   %eax
c0101b00:	e8 ca a6 00 00       	call   c010c1cf <Memset>
c0101b05:	83 c4 10             	add    $0x10,%esp
c0101b08:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101b0d:	89 c2                	mov    %eax,%edx
c0101b0f:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0101b12:	83 c0 01             	add    $0x1,%eax
c0101b15:	83 ec 0c             	sub    $0xc,%esp
c0101b18:	6a 0a                	push   $0xa
c0101b1a:	68 00 02 00 00       	push   $0x200
c0101b1f:	52                   	push   %edx
c0101b20:	6a 20                	push   $0x20
c0101b22:	50                   	push   %eax
c0101b23:	e8 ec fc ff ff       	call   c0101814 <rd_wt>
c0101b28:	83 c4 20             	add    $0x20,%esp
c0101b2b:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101b2e:	83 e8 02             	sub    $0x2,%eax
c0101b31:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0101b34:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0101b3b:	eb 04                	jmp    c0101b41 <mkfs+0x254>
c0101b3d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0101b41:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0101b44:	83 c0 01             	add    $0x1,%eax
c0101b47:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0101b4a:	7e f1                	jle    c0101b3d <mkfs+0x250>
c0101b4c:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101b51:	89 c2                	mov    %eax,%edx
c0101b53:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101b56:	83 c0 03             	add    $0x3,%eax
c0101b59:	83 ec 0c             	sub    $0xc,%esp
c0101b5c:	6a 0a                	push   $0xa
c0101b5e:	68 00 02 00 00       	push   $0x200
c0101b63:	52                   	push   %edx
c0101b64:	6a 20                	push   $0x20
c0101b66:	50                   	push   %eax
c0101b67:	e8 a8 fc ff ff       	call   c0101814 <rd_wt>
c0101b6c:	83 c4 20             	add    $0x20,%esp
c0101b6f:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101b74:	89 c2                	mov    %eax,%edx
c0101b76:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101b79:	83 c0 03             	add    $0x3,%eax
c0101b7c:	83 ec 0c             	sub    $0xc,%esp
c0101b7f:	6a 07                	push   $0x7
c0101b81:	68 00 02 00 00       	push   $0x200
c0101b86:	52                   	push   %edx
c0101b87:	6a 20                	push   $0x20
c0101b89:	50                   	push   %eax
c0101b8a:	e8 85 fc ff ff       	call   c0101814 <rd_wt>
c0101b8f:	83 c4 20             	add    $0x20,%esp
c0101b92:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101b97:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0101b9a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101b9d:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0101ba3:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101ba6:	c7 40 04 50 00 00 00 	movl   $0x50,0x4(%eax)
c0101bad:	8b 55 98             	mov    -0x68(%ebp),%edx
c0101bb0:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101bb3:	89 50 08             	mov    %edx,0x8(%eax)
c0101bb6:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101bb9:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0101bc0:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101bc3:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c0101bca:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101bcd:	8b 10                	mov    (%eax),%edx
c0101bcf:	89 15 c0 21 11 c0    	mov    %edx,0xc01121c0
c0101bd5:	8b 50 04             	mov    0x4(%eax),%edx
c0101bd8:	89 15 c4 21 11 c0    	mov    %edx,0xc01121c4
c0101bde:	8b 50 08             	mov    0x8(%eax),%edx
c0101be1:	89 15 c8 21 11 c0    	mov    %edx,0xc01121c8
c0101be7:	8b 50 0c             	mov    0xc(%eax),%edx
c0101bea:	89 15 cc 21 11 c0    	mov    %edx,0xc01121cc
c0101bf0:	8b 50 10             	mov    0x10(%eax),%edx
c0101bf3:	89 15 d0 21 11 c0    	mov    %edx,0xc01121d0
c0101bf9:	8b 50 14             	mov    0x14(%eax),%edx
c0101bfc:	89 15 d4 21 11 c0    	mov    %edx,0xc01121d4
c0101c02:	8b 50 18             	mov    0x18(%eax),%edx
c0101c05:	89 15 d8 21 11 c0    	mov    %edx,0xc01121d8
c0101c0b:	8b 50 1c             	mov    0x1c(%eax),%edx
c0101c0e:	89 15 dc 21 11 c0    	mov    %edx,0xc01121dc
c0101c14:	8b 50 20             	mov    0x20(%eax),%edx
c0101c17:	89 15 e0 21 11 c0    	mov    %edx,0xc01121e0
c0101c1d:	8b 40 24             	mov    0x24(%eax),%eax
c0101c20:	a3 e4 21 11 c0       	mov    %eax,0xc01121e4
c0101c25:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0101c2c:	eb 4c                	jmp    c0101c7a <mkfs+0x38d>
c0101c2e:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101c33:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0101c36:	83 c2 01             	add    $0x1,%edx
c0101c39:	c1 e2 05             	shl    $0x5,%edx
c0101c3c:	01 d0                	add    %edx,%eax
c0101c3e:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0101c41:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101c44:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0101c4a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101c4d:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0101c54:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101c57:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c0101c5e:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
c0101c65:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0101c68:	c1 e0 08             	shl    $0x8,%eax
c0101c6b:	0b 45 f0             	or     -0x10(%ebp),%eax
c0101c6e:	89 c2                	mov    %eax,%edx
c0101c70:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101c73:	89 50 08             	mov    %edx,0x8(%eax)
c0101c76:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0101c7a:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
c0101c7e:	7e ae                	jle    c0101c2e <mkfs+0x341>
c0101c80:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
c0101c87:	8d 95 70 ff ff ff    	lea    -0x90(%ebp),%edx
c0101c8d:	b8 00 00 00 00       	mov    $0x0,%eax
c0101c92:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0101c97:	89 d7                	mov    %edx,%edi
c0101c99:	f3 ab                	rep stos %eax,%es:(%edi)
c0101c9b:	c7 85 70 ff ff ff b0 	movl   $0xc010b3b0,-0x90(%ebp)
c0101ca2:	b3 10 c0 
c0101ca5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0101cac:	eb 54                	jmp    c0101d02 <mkfs+0x415>
c0101cae:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101cb3:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0101cb6:	83 c2 04             	add    $0x4,%edx
c0101cb9:	c1 e2 05             	shl    $0x5,%edx
c0101cbc:	01 d0                	add    %edx,%eax
c0101cbe:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0101cc1:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101cc4:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0101cca:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101ccd:	c7 40 04 00 e8 08 00 	movl   $0x8e800,0x4(%eax)
c0101cd4:	8b 45 98             	mov    -0x68(%ebp),%eax
c0101cd7:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0101cda:	83 c2 01             	add    $0x1,%edx
c0101cdd:	c1 e2 0b             	shl    $0xb,%edx
c0101ce0:	01 c2                	add    %eax,%edx
c0101ce2:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101ce5:	89 50 08             	mov    %edx,0x8(%eax)
c0101ce8:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101ceb:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0101cf2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101cf5:	8d 50 05             	lea    0x5(%eax),%edx
c0101cf8:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101cfb:	89 50 10             	mov    %edx,0x10(%eax)
c0101cfe:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0101d02:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101d05:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0101d08:	7c a4                	jl     c0101cae <mkfs+0x3c1>
c0101d0a:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101d0f:	89 c2                	mov    %eax,%edx
c0101d11:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101d14:	83 c0 03             	add    $0x3,%eax
c0101d17:	83 ec 0c             	sub    $0xc,%esp
c0101d1a:	6a 0a                	push   $0xa
c0101d1c:	68 00 02 00 00       	push   $0x200
c0101d21:	52                   	push   %edx
c0101d22:	6a 20                	push   $0x20
c0101d24:	50                   	push   %eax
c0101d25:	e8 ea fa ff ff       	call   c0101814 <rd_wt>
c0101d2a:	83 c4 20             	add    $0x20,%esp
c0101d2d:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101d32:	89 c2                	mov    %eax,%edx
c0101d34:	8b 45 98             	mov    -0x68(%ebp),%eax
c0101d37:	83 ec 0c             	sub    $0xc,%esp
c0101d3a:	6a 07                	push   $0x7
c0101d3c:	68 00 02 00 00       	push   $0x200
c0101d41:	52                   	push   %edx
c0101d42:	6a 20                	push   $0x20
c0101d44:	50                   	push   %eax
c0101d45:	e8 ca fa ff ff       	call   c0101814 <rd_wt>
c0101d4a:	83 c4 20             	add    $0x20,%esp
c0101d4d:	c7 85 60 ff ff ff cc 	movl   $0xcc,-0xa0(%ebp)
c0101d54:	00 00 00 
c0101d57:	66 c7 85 5e ff ff ff 	movw   $0x2e,-0xa2(%ebp)
c0101d5e:	2e 00 
c0101d60:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101d65:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0101d68:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101d6b:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0101d71:	83 ec 0c             	sub    $0xc,%esp
c0101d74:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0101d7a:	50                   	push   %eax
c0101d7b:	e8 88 a4 00 00       	call   c010c208 <Strlen>
c0101d80:	83 c4 10             	add    $0x10,%esp
c0101d83:	89 c1                	mov    %eax,%ecx
c0101d85:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101d88:	8d 50 04             	lea    0x4(%eax),%edx
c0101d8b:	83 ec 04             	sub    $0x4,%esp
c0101d8e:	51                   	push   %ecx
c0101d8f:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0101d95:	50                   	push   %eax
c0101d96:	52                   	push   %edx
c0101d97:	e8 f0 4e 00 00       	call   c0106c8c <Memcpy>
c0101d9c:	83 c4 10             	add    $0x10,%esp
c0101d9f:	8d 95 34 ff ff ff    	lea    -0xcc(%ebp),%edx
c0101da5:	b8 00 00 00 00       	mov    $0x0,%eax
c0101daa:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0101daf:	89 d7                	mov    %edx,%edi
c0101db1:	f3 ab                	rep stos %eax,%es:(%edi)
c0101db3:	c7 85 34 ff ff ff bc 	movl   $0xc010b3bc,-0xcc(%ebp)
c0101dba:	b3 10 c0 
c0101dbd:	c7 85 38 ff ff ff c5 	movl   $0xc010b3c5,-0xc8(%ebp)
c0101dc4:	b3 10 c0 
c0101dc7:	c7 85 3c ff ff ff ce 	movl   $0xc010b3ce,-0xc4(%ebp)
c0101dce:	b3 10 c0 
c0101dd1:	c7 45 bc 03 00 00 00 	movl   $0x3,-0x44(%ebp)
c0101dd8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0101ddf:	eb 49                	jmp    c0101e2a <mkfs+0x53d>
c0101de1:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0101de5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101de8:	8d 50 02             	lea    0x2(%eax),%edx
c0101deb:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101dee:	89 10                	mov    %edx,(%eax)
c0101df0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101df3:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0101dfa:	83 ec 0c             	sub    $0xc,%esp
c0101dfd:	50                   	push   %eax
c0101dfe:	e8 05 a4 00 00       	call   c010c208 <Strlen>
c0101e03:	83 c4 10             	add    $0x10,%esp
c0101e06:	89 c1                	mov    %eax,%ecx
c0101e08:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101e0b:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0101e12:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0101e15:	83 c2 04             	add    $0x4,%edx
c0101e18:	83 ec 04             	sub    $0x4,%esp
c0101e1b:	51                   	push   %ecx
c0101e1c:	50                   	push   %eax
c0101e1d:	52                   	push   %edx
c0101e1e:	e8 69 4e 00 00       	call   c0106c8c <Memcpy>
c0101e23:	83 c4 10             	add    $0x10,%esp
c0101e26:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0101e2a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101e2d:	3b 45 bc             	cmp    -0x44(%ebp),%eax
c0101e30:	7c af                	jl     c0101de1 <mkfs+0x4f4>
c0101e32:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0101e39:	eb 66                	jmp    c0101ea1 <mkfs+0x5b4>
c0101e3b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101e3e:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0101e45:	83 ec 0c             	sub    $0xc,%esp
c0101e48:	50                   	push   %eax
c0101e49:	e8 ba a3 00 00       	call   c010c208 <Strlen>
c0101e4e:	83 c4 10             	add    $0x10,%esp
c0101e51:	85 c0                	test   %eax,%eax
c0101e53:	74 47                	je     c0101e9c <mkfs+0x5af>
c0101e55:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0101e59:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101e5c:	8d 50 05             	lea    0x5(%eax),%edx
c0101e5f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101e62:	89 10                	mov    %edx,(%eax)
c0101e64:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101e67:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0101e6e:	83 ec 0c             	sub    $0xc,%esp
c0101e71:	50                   	push   %eax
c0101e72:	e8 91 a3 00 00       	call   c010c208 <Strlen>
c0101e77:	83 c4 10             	add    $0x10,%esp
c0101e7a:	89 c1                	mov    %eax,%ecx
c0101e7c:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101e7f:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0101e86:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0101e89:	83 c2 04             	add    $0x4,%edx
c0101e8c:	83 ec 04             	sub    $0x4,%esp
c0101e8f:	51                   	push   %ecx
c0101e90:	50                   	push   %eax
c0101e91:	52                   	push   %edx
c0101e92:	e8 f5 4d 00 00       	call   c0106c8c <Memcpy>
c0101e97:	83 c4 10             	add    $0x10,%esp
c0101e9a:	eb 01                	jmp    c0101e9d <mkfs+0x5b0>
c0101e9c:	90                   	nop
c0101e9d:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0101ea1:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101ea4:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0101ea7:	7c 92                	jl     c0101e3b <mkfs+0x54e>
c0101ea9:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101eae:	89 c2                	mov    %eax,%edx
c0101eb0:	8b 45 98             	mov    -0x68(%ebp),%eax
c0101eb3:	83 ec 0c             	sub    $0xc,%esp
c0101eb6:	6a 0a                	push   $0xa
c0101eb8:	68 00 02 00 00       	push   $0x200
c0101ebd:	52                   	push   %edx
c0101ebe:	6a 20                	push   $0x20
c0101ec0:	50                   	push   %eax
c0101ec1:	e8 4e f9 ff ff       	call   c0101814 <rd_wt>
c0101ec6:	83 c4 20             	add    $0x20,%esp
c0101ec9:	90                   	nop
c0101eca:	8b 7d fc             	mov    -0x4(%ebp),%edi
c0101ecd:	c9                   	leave  
c0101ece:	c3                   	ret    

c0101ecf <init_fs>:
c0101ecf:	55                   	push   %ebp
c0101ed0:	89 e5                	mov    %esp,%ebp
c0101ed2:	83 ec 18             	sub    $0x18,%esp
c0101ed5:	83 ec 0c             	sub    $0xc,%esp
c0101ed8:	6a 7c                	push   $0x7c
c0101eda:	e8 fd f6 ff ff       	call   c01015dc <sys_malloc>
c0101edf:	83 c4 10             	add    $0x10,%esp
c0101ee2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101ee5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101ee8:	c7 40 78 06 00 00 00 	movl   $0x6,0x78(%eax)
c0101eef:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101ef2:	c7 40 14 20 00 00 00 	movl   $0x20,0x14(%eax)
c0101ef9:	83 ec 04             	sub    $0x4,%esp
c0101efc:	6a 03                	push   $0x3
c0101efe:	ff 75 f4             	pushl  -0xc(%ebp)
c0101f01:	6a 03                	push   $0x3
c0101f03:	e8 0d 76 00 00       	call   c0109515 <send_rec>
c0101f08:	83 c4 10             	add    $0x10,%esp
c0101f0b:	e8 dd f9 ff ff       	call   c01018ed <mkfs>
c0101f10:	83 ec 08             	sub    $0x8,%esp
c0101f13:	6a 7c                	push   $0x7c
c0101f15:	ff 75 f4             	pushl  -0xc(%ebp)
c0101f18:	e8 d4 f6 ff ff       	call   c01015f1 <sys_free>
c0101f1d:	83 c4 10             	add    $0x10,%esp
c0101f20:	90                   	nop
c0101f21:	c9                   	leave  
c0101f22:	c3                   	ret    

c0101f23 <do_open>:
c0101f23:	55                   	push   %ebp
c0101f24:	89 e5                	mov    %esp,%ebp
c0101f26:	83 ec 68             	sub    $0x68,%esp
c0101f29:	83 ec 04             	sub    $0x4,%esp
c0101f2c:	6a 0c                	push   $0xc
c0101f2e:	6a 00                	push   $0x0
c0101f30:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0101f33:	50                   	push   %eax
c0101f34:	e8 96 a2 00 00       	call   c010c1cf <Memset>
c0101f39:	83 c4 10             	add    $0x10,%esp
c0101f3c:	8b 45 08             	mov    0x8(%ebp),%eax
c0101f3f:	8b 40 44             	mov    0x44(%eax),%eax
c0101f42:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0101f45:	83 ec 08             	sub    $0x8,%esp
c0101f48:	6a 0c                	push   $0xc
c0101f4a:	ff 75 e4             	pushl  -0x1c(%ebp)
c0101f4d:	e8 cd 3e 00 00       	call   c0105e1f <alloc_virtual_memory>
c0101f52:	83 c4 10             	add    $0x10,%esp
c0101f55:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0101f58:	8b 45 08             	mov    0x8(%ebp),%eax
c0101f5b:	8b 40 40             	mov    0x40(%eax),%eax
c0101f5e:	89 c2                	mov    %eax,%edx
c0101f60:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101f63:	83 ec 04             	sub    $0x4,%esp
c0101f66:	52                   	push   %edx
c0101f67:	50                   	push   %eax
c0101f68:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0101f6b:	50                   	push   %eax
c0101f6c:	e8 1b 4d 00 00       	call   c0106c8c <Memcpy>
c0101f71:	83 c4 10             	add    $0x10,%esp
c0101f74:	8b 45 08             	mov    0x8(%ebp),%eax
c0101f77:	8b 40 40             	mov    0x40(%eax),%eax
c0101f7a:	c6 44 05 c4 00       	movb   $0x0,-0x3c(%ebp,%eax,1)
c0101f7f:	8b 45 08             	mov    0x8(%ebp),%eax
c0101f82:	8b 40 74             	mov    0x74(%eax),%eax
c0101f85:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0101f88:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c0101f8f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0101f96:	eb 1f                	jmp    c0101fb7 <do_open+0x94>
c0101f98:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c0101f9d:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0101fa0:	83 c2 4c             	add    $0x4c,%edx
c0101fa3:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c0101fa7:	85 c0                	test   %eax,%eax
c0101fa9:	75 08                	jne    c0101fb3 <do_open+0x90>
c0101fab:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101fae:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101fb1:	eb 0a                	jmp    c0101fbd <do_open+0x9a>
c0101fb3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0101fb7:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c0101fbb:	7e db                	jle    c0101f98 <do_open+0x75>
c0101fbd:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c0101fc1:	75 1c                	jne    c0101fdf <do_open+0xbc>
c0101fc3:	68 c6 01 00 00       	push   $0x1c6
c0101fc8:	68 e4 b2 10 c0       	push   $0xc010b2e4
c0101fcd:	68 e4 b2 10 c0       	push   $0xc010b2e4
c0101fd2:	68 d7 b3 10 c0       	push   $0xc010b3d7
c0101fd7:	e8 c9 68 00 00       	call   c01088a5 <assertion_failure>
c0101fdc:	83 c4 10             	add    $0x10,%esp
c0101fdf:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%ebp)
c0101fe6:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0101fed:	eb 1d                	jmp    c010200c <do_open+0xe9>
c0101fef:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101ff2:	c1 e0 04             	shl    $0x4,%eax
c0101ff5:	05 88 13 11 c0       	add    $0xc0111388,%eax
c0101ffa:	8b 00                	mov    (%eax),%eax
c0101ffc:	85 c0                	test   %eax,%eax
c0101ffe:	75 08                	jne    c0102008 <do_open+0xe5>
c0102000:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102003:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102006:	eb 0a                	jmp    c0102012 <do_open+0xef>
c0102008:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c010200c:	83 7d e8 3f          	cmpl   $0x3f,-0x18(%ebp)
c0102010:	7e dd                	jle    c0101fef <do_open+0xcc>
c0102012:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
c0102016:	75 1c                	jne    c0102034 <do_open+0x111>
c0102018:	68 d2 01 00 00       	push   $0x1d2
c010201d:	68 e4 b2 10 c0       	push   $0xc010b2e4
c0102022:	68 e4 b2 10 c0       	push   $0xc010b2e4
c0102027:	68 df b3 10 c0       	push   $0xc010b3df
c010202c:	e8 74 68 00 00       	call   c01088a5 <assertion_failure>
c0102031:	83 c4 10             	add    $0x10,%esp
c0102034:	83 ec 0c             	sub    $0xc,%esp
c0102037:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c010203a:	50                   	push   %eax
c010203b:	e8 d2 00 00 00       	call   c0102112 <search_file>
c0102040:	83 c4 10             	add    $0x10,%esp
c0102043:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0102046:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c010204a:	75 2b                	jne    c0102077 <do_open+0x154>
c010204c:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0102050:	7e 10                	jle    c0102062 <do_open+0x13f>
c0102052:	83 ec 0c             	sub    $0xc,%esp
c0102055:	68 e7 b3 10 c0       	push   $0xc010b3e7
c010205a:	e8 28 68 00 00       	call   c0108887 <panic>
c010205f:	83 c4 10             	add    $0x10,%esp
c0102062:	83 ec 08             	sub    $0x8,%esp
c0102065:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0102068:	50                   	push   %eax
c0102069:	8d 45 9c             	lea    -0x64(%ebp),%eax
c010206c:	50                   	push   %eax
c010206d:	e8 60 04 00 00       	call   c01024d2 <create_file>
c0102072:	83 c4 10             	add    $0x10,%esp
c0102075:	eb 25                	jmp    c010209c <do_open+0x179>
c0102077:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
c010207b:	75 0a                	jne    c0102087 <do_open+0x164>
c010207d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102082:	e9 89 00 00 00       	jmp    c0102110 <do_open+0x1ed>
c0102087:	83 ec 08             	sub    $0x8,%esp
c010208a:	ff 75 d8             	pushl  -0x28(%ebp)
c010208d:	8d 45 9c             	lea    -0x64(%ebp),%eax
c0102090:	50                   	push   %eax
c0102091:	e8 7a 02 00 00       	call   c0102310 <get_inode>
c0102096:	83 c4 10             	add    $0x10,%esp
c0102099:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010209c:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c01020a1:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01020a4:	c1 e2 04             	shl    $0x4,%edx
c01020a7:	8d 8a 80 13 11 c0    	lea    -0x3feeec80(%edx),%ecx
c01020ad:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01020b0:	83 c2 4c             	add    $0x4c,%edx
c01020b3:	89 4c 90 0c          	mov    %ecx,0xc(%eax,%edx,4)
c01020b7:	8b 45 ac             	mov    -0x54(%ebp),%eax
c01020ba:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01020bd:	c1 e2 04             	shl    $0x4,%edx
c01020c0:	81 c2 88 13 11 c0    	add    $0xc0111388,%edx
c01020c6:	89 02                	mov    %eax,(%edx)
c01020c8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01020cb:	c1 e0 04             	shl    $0x4,%eax
c01020ce:	05 84 13 11 c0       	add    $0xc0111384,%eax
c01020d3:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c01020d9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01020dc:	c1 e0 04             	shl    $0x4,%eax
c01020df:	05 80 13 11 c0       	add    $0xc0111380,%eax
c01020e4:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c01020ea:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01020ed:	c1 e0 04             	shl    $0x4,%eax
c01020f0:	05 8c 13 11 c0       	add    $0xc011138c,%eax
c01020f5:	8b 00                	mov    (%eax),%eax
c01020f7:	8d 50 01             	lea    0x1(%eax),%edx
c01020fa:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01020fd:	c1 e0 04             	shl    $0x4,%eax
c0102100:	05 8c 13 11 c0       	add    $0xc011138c,%eax
c0102105:	89 10                	mov    %edx,(%eax)
c0102107:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010210a:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010210d:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0102110:	c9                   	leave  
c0102111:	c3                   	ret    

c0102112 <search_file>:
c0102112:	55                   	push   %ebp
c0102113:	89 e5                	mov    %esp,%ebp
c0102115:	83 ec 68             	sub    $0x68,%esp
c0102118:	83 ec 04             	sub    $0x4,%esp
c010211b:	6a 0c                	push   $0xc
c010211d:	6a 00                	push   $0x0
c010211f:	8d 45 c0             	lea    -0x40(%ebp),%eax
c0102122:	50                   	push   %eax
c0102123:	e8 a7 a0 00 00       	call   c010c1cf <Memset>
c0102128:	83 c4 10             	add    $0x10,%esp
c010212b:	83 ec 04             	sub    $0x4,%esp
c010212e:	6a 28                	push   $0x28
c0102130:	6a 00                	push   $0x0
c0102132:	8d 45 98             	lea    -0x68(%ebp),%eax
c0102135:	50                   	push   %eax
c0102136:	e8 94 a0 00 00       	call   c010c1cf <Memset>
c010213b:	83 c4 10             	add    $0x10,%esp
c010213e:	83 ec 04             	sub    $0x4,%esp
c0102141:	8d 45 98             	lea    -0x68(%ebp),%eax
c0102144:	50                   	push   %eax
c0102145:	ff 75 08             	pushl  0x8(%ebp)
c0102148:	8d 45 c0             	lea    -0x40(%ebp),%eax
c010214b:	50                   	push   %eax
c010214c:	e8 f3 00 00 00       	call   c0102244 <strip_path>
c0102151:	83 c4 10             	add    $0x10,%esp
c0102154:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0102157:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%ebp)
c010215b:	75 0a                	jne    c0102167 <search_file+0x55>
c010215d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102162:	e9 db 00 00 00       	jmp    c0102242 <search_file+0x130>
c0102167:	8b 45 9c             	mov    -0x64(%ebp),%eax
c010216a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010216d:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0102170:	05 00 02 00 00       	add    $0x200,%eax
c0102175:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c010217b:	85 c0                	test   %eax,%eax
c010217d:	0f 48 c2             	cmovs  %edx,%eax
c0102180:	c1 f8 09             	sar    $0x9,%eax
c0102183:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0102186:	8b 45 9c             	mov    -0x64(%ebp),%eax
c0102189:	c1 e8 04             	shr    $0x4,%eax
c010218c:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010218f:	e8 5c 14 00 00       	call   c01035f0 <get_super_block>
c0102194:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0102197:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010219a:	8b 00                	mov    (%eax),%eax
c010219c:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010219f:	c7 45 cc 20 00 00 00 	movl   $0x20,-0x34(%ebp)
c01021a6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01021ad:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01021b4:	eb 7b                	jmp    c0102231 <search_file+0x11f>
c01021b6:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01021bb:	89 c1                	mov    %eax,%ecx
c01021bd:	8b 55 d0             	mov    -0x30(%ebp),%edx
c01021c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01021c3:	01 d0                	add    %edx,%eax
c01021c5:	83 ec 0c             	sub    $0xc,%esp
c01021c8:	6a 07                	push   $0x7
c01021ca:	68 00 02 00 00       	push   $0x200
c01021cf:	51                   	push   %ecx
c01021d0:	ff 75 cc             	pushl  -0x34(%ebp)
c01021d3:	50                   	push   %eax
c01021d4:	e8 3b f6 ff ff       	call   c0101814 <rd_wt>
c01021d9:	83 c4 20             	add    $0x20,%esp
c01021dc:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c01021e1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01021e4:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01021eb:	eb 35                	jmp    c0102222 <search_file+0x110>
c01021ed:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01021f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01021f4:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c01021f7:	7f 33                	jg     c010222c <search_file+0x11a>
c01021f9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01021fc:	83 c0 04             	add    $0x4,%eax
c01021ff:	83 ec 08             	sub    $0x8,%esp
c0102202:	50                   	push   %eax
c0102203:	8d 45 c0             	lea    -0x40(%ebp),%eax
c0102206:	50                   	push   %eax
c0102207:	e8 70 76 00 00       	call   c010987c <strcmp>
c010220c:	83 c4 10             	add    $0x10,%esp
c010220f:	85 c0                	test   %eax,%eax
c0102211:	75 07                	jne    c010221a <search_file+0x108>
c0102213:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102216:	8b 00                	mov    (%eax),%eax
c0102218:	eb 28                	jmp    c0102242 <search_file+0x130>
c010221a:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c010221e:	83 45 ec 10          	addl   $0x10,-0x14(%ebp)
c0102222:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102225:	83 f8 1f             	cmp    $0x1f,%eax
c0102228:	76 c3                	jbe    c01021ed <search_file+0xdb>
c010222a:	eb 01                	jmp    c010222d <search_file+0x11b>
c010222c:	90                   	nop
c010222d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0102231:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102234:	3b 45 dc             	cmp    -0x24(%ebp),%eax
c0102237:	0f 8c 79 ff ff ff    	jl     c01021b6 <search_file+0xa4>
c010223d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102242:	c9                   	leave  
c0102243:	c3                   	ret    

c0102244 <strip_path>:
c0102244:	55                   	push   %ebp
c0102245:	89 e5                	mov    %esp,%ebp
c0102247:	83 ec 10             	sub    $0x10,%esp
c010224a:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010224e:	75 0a                	jne    c010225a <strip_path+0x16>
c0102250:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102255:	e9 b4 00 00 00       	jmp    c010230e <strip_path+0xca>
c010225a:	8b 45 08             	mov    0x8(%ebp),%eax
c010225d:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0102260:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102263:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0102266:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102269:	0f b6 00             	movzbl (%eax),%eax
c010226c:	3c 2f                	cmp    $0x2f,%al
c010226e:	75 2d                	jne    c010229d <strip_path+0x59>
c0102270:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0102274:	eb 27                	jmp    c010229d <strip_path+0x59>
c0102276:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102279:	0f b6 00             	movzbl (%eax),%eax
c010227c:	3c 2f                	cmp    $0x2f,%al
c010227e:	75 0a                	jne    c010228a <strip_path+0x46>
c0102280:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102285:	e9 84 00 00 00       	jmp    c010230e <strip_path+0xca>
c010228a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010228d:	0f b6 10             	movzbl (%eax),%edx
c0102290:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102293:	88 10                	mov    %dl,(%eax)
c0102295:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0102299:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c010229d:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01022a0:	0f b6 00             	movzbl (%eax),%eax
c01022a3:	84 c0                	test   %al,%al
c01022a5:	75 cf                	jne    c0102276 <strip_path+0x32>
c01022a7:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01022aa:	c6 00 00             	movb   $0x0,(%eax)
c01022ad:	8b 45 10             	mov    0x10(%ebp),%eax
c01022b0:	8b 15 c0 21 11 c0    	mov    0xc01121c0,%edx
c01022b6:	89 10                	mov    %edx,(%eax)
c01022b8:	8b 15 c4 21 11 c0    	mov    0xc01121c4,%edx
c01022be:	89 50 04             	mov    %edx,0x4(%eax)
c01022c1:	8b 15 c8 21 11 c0    	mov    0xc01121c8,%edx
c01022c7:	89 50 08             	mov    %edx,0x8(%eax)
c01022ca:	8b 15 cc 21 11 c0    	mov    0xc01121cc,%edx
c01022d0:	89 50 0c             	mov    %edx,0xc(%eax)
c01022d3:	8b 15 d0 21 11 c0    	mov    0xc01121d0,%edx
c01022d9:	89 50 10             	mov    %edx,0x10(%eax)
c01022dc:	8b 15 d4 21 11 c0    	mov    0xc01121d4,%edx
c01022e2:	89 50 14             	mov    %edx,0x14(%eax)
c01022e5:	8b 15 d8 21 11 c0    	mov    0xc01121d8,%edx
c01022eb:	89 50 18             	mov    %edx,0x18(%eax)
c01022ee:	8b 15 dc 21 11 c0    	mov    0xc01121dc,%edx
c01022f4:	89 50 1c             	mov    %edx,0x1c(%eax)
c01022f7:	8b 15 e0 21 11 c0    	mov    0xc01121e0,%edx
c01022fd:	89 50 20             	mov    %edx,0x20(%eax)
c0102300:	8b 15 e4 21 11 c0    	mov    0xc01121e4,%edx
c0102306:	89 50 24             	mov    %edx,0x24(%eax)
c0102309:	b8 00 00 00 00       	mov    $0x0,%eax
c010230e:	c9                   	leave  
c010230f:	c3                   	ret    

c0102310 <get_inode>:
c0102310:	55                   	push   %ebp
c0102311:	89 e5                	mov    %esp,%ebp
c0102313:	56                   	push   %esi
c0102314:	53                   	push   %ebx
c0102315:	83 ec 20             	sub    $0x20,%esp
c0102318:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010231c:	75 0a                	jne    c0102328 <get_inode+0x18>
c010231e:	b8 00 00 00 00       	mov    $0x0,%eax
c0102323:	e9 a3 01 00 00       	jmp    c01024cb <get_inode+0x1bb>
c0102328:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010232f:	c7 45 f0 a0 17 11 c0 	movl   $0xc01117a0,-0x10(%ebp)
c0102336:	eb 69                	jmp    c01023a1 <get_inode+0x91>
c0102338:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010233b:	8b 40 24             	mov    0x24(%eax),%eax
c010233e:	85 c0                	test   %eax,%eax
c0102340:	7e 53                	jle    c0102395 <get_inode+0x85>
c0102342:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102345:	8b 40 10             	mov    0x10(%eax),%eax
c0102348:	39 45 0c             	cmp    %eax,0xc(%ebp)
c010234b:	75 50                	jne    c010239d <get_inode+0x8d>
c010234d:	8b 45 08             	mov    0x8(%ebp),%eax
c0102350:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0102353:	8b 0a                	mov    (%edx),%ecx
c0102355:	89 08                	mov    %ecx,(%eax)
c0102357:	8b 4a 04             	mov    0x4(%edx),%ecx
c010235a:	89 48 04             	mov    %ecx,0x4(%eax)
c010235d:	8b 4a 08             	mov    0x8(%edx),%ecx
c0102360:	89 48 08             	mov    %ecx,0x8(%eax)
c0102363:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0102366:	89 48 0c             	mov    %ecx,0xc(%eax)
c0102369:	8b 4a 10             	mov    0x10(%edx),%ecx
c010236c:	89 48 10             	mov    %ecx,0x10(%eax)
c010236f:	8b 4a 14             	mov    0x14(%edx),%ecx
c0102372:	89 48 14             	mov    %ecx,0x14(%eax)
c0102375:	8b 4a 18             	mov    0x18(%edx),%ecx
c0102378:	89 48 18             	mov    %ecx,0x18(%eax)
c010237b:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c010237e:	89 48 1c             	mov    %ecx,0x1c(%eax)
c0102381:	8b 4a 20             	mov    0x20(%edx),%ecx
c0102384:	89 48 20             	mov    %ecx,0x20(%eax)
c0102387:	8b 52 24             	mov    0x24(%edx),%edx
c010238a:	89 50 24             	mov    %edx,0x24(%eax)
c010238d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102390:	e9 36 01 00 00       	jmp    c01024cb <get_inode+0x1bb>
c0102395:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102398:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010239b:	eb 0d                	jmp    c01023aa <get_inode+0x9a>
c010239d:	83 45 f0 28          	addl   $0x28,-0x10(%ebp)
c01023a1:	81 7d f0 a0 21 11 c0 	cmpl   $0xc01121a0,-0x10(%ebp)
c01023a8:	76 8e                	jbe    c0102338 <get_inode+0x28>
c01023aa:	e8 41 12 00 00       	call   c01035f0 <get_super_block>
c01023af:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01023b2:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c01023b9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01023bc:	8b 40 04             	mov    0x4(%eax),%eax
c01023bf:	8d 50 02             	lea    0x2(%eax),%edx
c01023c2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01023c5:	8b 40 08             	mov    0x8(%eax),%eax
c01023c8:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c01023cb:	8b 45 0c             	mov    0xc(%ebp),%eax
c01023ce:	8d 48 ff             	lea    -0x1(%eax),%ecx
c01023d1:	b8 00 02 00 00       	mov    $0x200,%eax
c01023d6:	99                   	cltd   
c01023d7:	f7 7d e8             	idivl  -0x18(%ebp)
c01023da:	89 c6                	mov    %eax,%esi
c01023dc:	89 c8                	mov    %ecx,%eax
c01023de:	99                   	cltd   
c01023df:	f7 fe                	idiv   %esi
c01023e1:	01 d8                	add    %ebx,%eax
c01023e3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01023e6:	c7 45 e0 20 00 00 00 	movl   $0x20,-0x20(%ebp)
c01023ed:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01023f2:	83 ec 0c             	sub    $0xc,%esp
c01023f5:	6a 07                	push   $0x7
c01023f7:	68 00 02 00 00       	push   $0x200
c01023fc:	50                   	push   %eax
c01023fd:	ff 75 e0             	pushl  -0x20(%ebp)
c0102400:	ff 75 e4             	pushl  -0x1c(%ebp)
c0102403:	e8 0c f4 ff ff       	call   c0101814 <rd_wt>
c0102408:	83 c4 20             	add    $0x20,%esp
c010240b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010240e:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0102411:	b8 00 02 00 00       	mov    $0x200,%eax
c0102416:	99                   	cltd   
c0102417:	f7 7d e8             	idivl  -0x18(%ebp)
c010241a:	89 c3                	mov    %eax,%ebx
c010241c:	89 c8                	mov    %ecx,%eax
c010241e:	99                   	cltd   
c010241f:	f7 fb                	idiv   %ebx
c0102421:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0102424:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c010242a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010242d:	0f af 45 dc          	imul   -0x24(%ebp),%eax
c0102431:	01 d0                	add    %edx,%eax
c0102433:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0102436:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102439:	8b 55 d8             	mov    -0x28(%ebp),%edx
c010243c:	8b 0a                	mov    (%edx),%ecx
c010243e:	89 08                	mov    %ecx,(%eax)
c0102440:	8b 4a 04             	mov    0x4(%edx),%ecx
c0102443:	89 48 04             	mov    %ecx,0x4(%eax)
c0102446:	8b 4a 08             	mov    0x8(%edx),%ecx
c0102449:	89 48 08             	mov    %ecx,0x8(%eax)
c010244c:	8b 4a 0c             	mov    0xc(%edx),%ecx
c010244f:	89 48 0c             	mov    %ecx,0xc(%eax)
c0102452:	8b 4a 10             	mov    0x10(%edx),%ecx
c0102455:	89 48 10             	mov    %ecx,0x10(%eax)
c0102458:	8b 4a 14             	mov    0x14(%edx),%ecx
c010245b:	89 48 14             	mov    %ecx,0x14(%eax)
c010245e:	8b 4a 18             	mov    0x18(%edx),%ecx
c0102461:	89 48 18             	mov    %ecx,0x18(%eax)
c0102464:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0102467:	89 48 1c             	mov    %ecx,0x1c(%eax)
c010246a:	8b 4a 20             	mov    0x20(%edx),%ecx
c010246d:	89 48 20             	mov    %ecx,0x20(%eax)
c0102470:	8b 52 24             	mov    0x24(%edx),%edx
c0102473:	89 50 24             	mov    %edx,0x24(%eax)
c0102476:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102479:	8b 55 0c             	mov    0xc(%ebp),%edx
c010247c:	89 50 10             	mov    %edx,0x10(%eax)
c010247f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102482:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0102485:	89 50 20             	mov    %edx,0x20(%eax)
c0102488:	8b 45 08             	mov    0x8(%ebp),%eax
c010248b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010248e:	8b 0a                	mov    (%edx),%ecx
c0102490:	89 08                	mov    %ecx,(%eax)
c0102492:	8b 4a 04             	mov    0x4(%edx),%ecx
c0102495:	89 48 04             	mov    %ecx,0x4(%eax)
c0102498:	8b 4a 08             	mov    0x8(%edx),%ecx
c010249b:	89 48 08             	mov    %ecx,0x8(%eax)
c010249e:	8b 4a 0c             	mov    0xc(%edx),%ecx
c01024a1:	89 48 0c             	mov    %ecx,0xc(%eax)
c01024a4:	8b 4a 10             	mov    0x10(%edx),%ecx
c01024a7:	89 48 10             	mov    %ecx,0x10(%eax)
c01024aa:	8b 4a 14             	mov    0x14(%edx),%ecx
c01024ad:	89 48 14             	mov    %ecx,0x14(%eax)
c01024b0:	8b 4a 18             	mov    0x18(%edx),%ecx
c01024b3:	89 48 18             	mov    %ecx,0x18(%eax)
c01024b6:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c01024b9:	89 48 1c             	mov    %ecx,0x1c(%eax)
c01024bc:	8b 4a 20             	mov    0x20(%edx),%ecx
c01024bf:	89 48 20             	mov    %ecx,0x20(%eax)
c01024c2:	8b 52 24             	mov    0x24(%edx),%edx
c01024c5:	89 50 24             	mov    %edx,0x24(%eax)
c01024c8:	8b 45 08             	mov    0x8(%ebp),%eax
c01024cb:	8d 65 f8             	lea    -0x8(%ebp),%esp
c01024ce:	5b                   	pop    %ebx
c01024cf:	5e                   	pop    %esi
c01024d0:	5d                   	pop    %ebp
c01024d1:	c3                   	ret    

c01024d2 <create_file>:
c01024d2:	55                   	push   %ebp
c01024d3:	89 e5                	mov    %esp,%ebp
c01024d5:	81 ec 98 00 00 00    	sub    $0x98,%esp
c01024db:	8d 45 b8             	lea    -0x48(%ebp),%eax
c01024de:	50                   	push   %eax
c01024df:	ff 75 0c             	pushl  0xc(%ebp)
c01024e2:	8d 45 ac             	lea    -0x54(%ebp),%eax
c01024e5:	50                   	push   %eax
c01024e6:	e8 59 fd ff ff       	call   c0102244 <strip_path>
c01024eb:	83 c4 0c             	add    $0xc,%esp
c01024ee:	83 f8 ff             	cmp    $0xffffffff,%eax
c01024f1:	75 0a                	jne    c01024fd <create_file+0x2b>
c01024f3:	b8 00 00 00 00       	mov    $0x0,%eax
c01024f8:	e9 de 00 00 00       	jmp    c01025db <create_file+0x109>
c01024fd:	e8 db 00 00 00       	call   c01025dd <alloc_imap_bit>
c0102502:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102505:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102509:	75 0a                	jne    c0102515 <create_file+0x43>
c010250b:	b8 00 00 00 00       	mov    $0x0,%eax
c0102510:	e9 c6 00 00 00       	jmp    c01025db <create_file+0x109>
c0102515:	e8 d6 10 00 00       	call   c01035f0 <get_super_block>
c010251a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010251d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102520:	8b 40 10             	mov    0x10(%eax),%eax
c0102523:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102526:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102529:	83 ec 08             	sub    $0x8,%esp
c010252c:	50                   	push   %eax
c010252d:	ff 75 f4             	pushl  -0xc(%ebp)
c0102530:	e8 a5 01 00 00       	call   c01026da <alloc_smap_bit>
c0102535:	83 c4 10             	add    $0x10,%esp
c0102538:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010253b:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c010253f:	75 0a                	jne    c010254b <create_file+0x79>
c0102541:	b8 00 00 00 00       	mov    $0x0,%eax
c0102546:	e9 90 00 00 00       	jmp    c01025db <create_file+0x109>
c010254b:	83 ec 04             	sub    $0x4,%esp
c010254e:	ff 75 e8             	pushl  -0x18(%ebp)
c0102551:	ff 75 f4             	pushl  -0xc(%ebp)
c0102554:	8d 45 84             	lea    -0x7c(%ebp),%eax
c0102557:	50                   	push   %eax
c0102558:	e8 1e 03 00 00       	call   c010287b <new_inode>
c010255d:	83 c4 10             	add    $0x10,%esp
c0102560:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0102563:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0102567:	75 07                	jne    c0102570 <create_file+0x9e>
c0102569:	b8 00 00 00 00       	mov    $0x0,%eax
c010256e:	eb 6b                	jmp    c01025db <create_file+0x109>
c0102570:	ff 75 f4             	pushl  -0xc(%ebp)
c0102573:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0102576:	50                   	push   %eax
c0102577:	8d 45 b8             	lea    -0x48(%ebp),%eax
c010257a:	50                   	push   %eax
c010257b:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102581:	50                   	push   %eax
c0102582:	e8 12 04 00 00       	call   c0102999 <new_dir_entry>
c0102587:	83 c4 10             	add    $0x10,%esp
c010258a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010258d:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0102591:	75 07                	jne    c010259a <create_file+0xc8>
c0102593:	b8 00 00 00 00       	mov    $0x0,%eax
c0102598:	eb 41                	jmp    c01025db <create_file+0x109>
c010259a:	8b 45 08             	mov    0x8(%ebp),%eax
c010259d:	8b 55 84             	mov    -0x7c(%ebp),%edx
c01025a0:	89 10                	mov    %edx,(%eax)
c01025a2:	8b 55 88             	mov    -0x78(%ebp),%edx
c01025a5:	89 50 04             	mov    %edx,0x4(%eax)
c01025a8:	8b 55 8c             	mov    -0x74(%ebp),%edx
c01025ab:	89 50 08             	mov    %edx,0x8(%eax)
c01025ae:	8b 55 90             	mov    -0x70(%ebp),%edx
c01025b1:	89 50 0c             	mov    %edx,0xc(%eax)
c01025b4:	8b 55 94             	mov    -0x6c(%ebp),%edx
c01025b7:	89 50 10             	mov    %edx,0x10(%eax)
c01025ba:	8b 55 98             	mov    -0x68(%ebp),%edx
c01025bd:	89 50 14             	mov    %edx,0x14(%eax)
c01025c0:	8b 55 9c             	mov    -0x64(%ebp),%edx
c01025c3:	89 50 18             	mov    %edx,0x18(%eax)
c01025c6:	8b 55 a0             	mov    -0x60(%ebp),%edx
c01025c9:	89 50 1c             	mov    %edx,0x1c(%eax)
c01025cc:	8b 55 a4             	mov    -0x5c(%ebp),%edx
c01025cf:	89 50 20             	mov    %edx,0x20(%eax)
c01025d2:	8b 55 a8             	mov    -0x58(%ebp),%edx
c01025d5:	89 50 24             	mov    %edx,0x24(%eax)
c01025d8:	8b 45 08             	mov    0x8(%ebp),%eax
c01025db:	c9                   	leave  
c01025dc:	c3                   	ret    

c01025dd <alloc_imap_bit>:
c01025dd:	55                   	push   %ebp
c01025de:	89 e5                	mov    %esp,%ebp
c01025e0:	53                   	push   %ebx
c01025e1:	83 ec 24             	sub    $0x24,%esp
c01025e4:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c01025eb:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c01025f2:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01025f7:	83 ec 0c             	sub    $0xc,%esp
c01025fa:	6a 07                	push   $0x7
c01025fc:	68 00 02 00 00       	push   $0x200
c0102601:	50                   	push   %eax
c0102602:	ff 75 e8             	pushl  -0x18(%ebp)
c0102605:	ff 75 ec             	pushl  -0x14(%ebp)
c0102608:	e8 07 f2 ff ff       	call   c0101814 <rd_wt>
c010260d:	83 c4 20             	add    $0x20,%esp
c0102610:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0102617:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010261e:	e9 a5 00 00 00       	jmp    c01026c8 <alloc_imap_bit+0xeb>
c0102623:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c010262a:	e9 8b 00 00 00       	jmp    c01026ba <alloc_imap_bit+0xdd>
c010262f:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102635:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102638:	01 d0                	add    %edx,%eax
c010263a:	0f b6 00             	movzbl (%eax),%eax
c010263d:	0f be d0             	movsbl %al,%edx
c0102640:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102643:	89 c1                	mov    %eax,%ecx
c0102645:	d3 fa                	sar    %cl,%edx
c0102647:	89 d0                	mov    %edx,%eax
c0102649:	83 e0 01             	and    $0x1,%eax
c010264c:	85 c0                	test   %eax,%eax
c010264e:	74 06                	je     c0102656 <alloc_imap_bit+0x79>
c0102650:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0102654:	eb 64                	jmp    c01026ba <alloc_imap_bit+0xdd>
c0102656:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c010265c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010265f:	01 d0                	add    %edx,%eax
c0102661:	0f b6 18             	movzbl (%eax),%ebx
c0102664:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102667:	ba 01 00 00 00       	mov    $0x1,%edx
c010266c:	89 c1                	mov    %eax,%ecx
c010266e:	d3 e2                	shl    %cl,%edx
c0102670:	89 d0                	mov    %edx,%eax
c0102672:	89 c1                	mov    %eax,%ecx
c0102674:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c010267a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010267d:	01 d0                	add    %edx,%eax
c010267f:	09 cb                	or     %ecx,%ebx
c0102681:	89 da                	mov    %ebx,%edx
c0102683:	88 10                	mov    %dl,(%eax)
c0102685:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102688:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c010268f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102692:	01 d0                	add    %edx,%eax
c0102694:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0102697:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010269c:	83 ec 0c             	sub    $0xc,%esp
c010269f:	6a 0a                	push   $0xa
c01026a1:	68 00 02 00 00       	push   $0x200
c01026a6:	50                   	push   %eax
c01026a7:	ff 75 e8             	pushl  -0x18(%ebp)
c01026aa:	ff 75 ec             	pushl  -0x14(%ebp)
c01026ad:	e8 62 f1 ff ff       	call   c0101814 <rd_wt>
c01026b2:	83 c4 20             	add    $0x20,%esp
c01026b5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01026b8:	eb 1b                	jmp    c01026d5 <alloc_imap_bit+0xf8>
c01026ba:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
c01026be:	0f 8e 6b ff ff ff    	jle    c010262f <alloc_imap_bit+0x52>
c01026c4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01026c8:	81 7d f4 ff 01 00 00 	cmpl   $0x1ff,-0xc(%ebp)
c01026cf:	0f 8e 4e ff ff ff    	jle    c0102623 <alloc_imap_bit+0x46>
c01026d5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01026d8:	c9                   	leave  
c01026d9:	c3                   	ret    

c01026da <alloc_smap_bit>:
c01026da:	55                   	push   %ebp
c01026db:	89 e5                	mov    %esp,%ebp
c01026dd:	53                   	push   %ebx
c01026de:	83 ec 34             	sub    $0x34,%esp
c01026e1:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01026e5:	75 1c                	jne    c0102703 <alloc_smap_bit+0x29>
c01026e7:	68 fd 02 00 00       	push   $0x2fd
c01026ec:	68 e4 b2 10 c0       	push   $0xc010b2e4
c01026f1:	68 e4 b2 10 c0       	push   $0xc010b2e4
c01026f6:	68 f4 b3 10 c0       	push   $0xc010b3f4
c01026fb:	e8 a5 61 00 00       	call   c01088a5 <assertion_failure>
c0102700:	83 c4 10             	add    $0x10,%esp
c0102703:	e8 e8 0e 00 00       	call   c01035f0 <get_super_block>
c0102708:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010270b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010270e:	8b 40 08             	mov    0x8(%eax),%eax
c0102711:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0102714:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102717:	8b 40 04             	mov    0x4(%eax),%eax
c010271a:	83 c0 02             	add    $0x2,%eax
c010271d:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0102720:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0102727:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c010272e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102735:	e9 20 01 00 00       	jmp    c010285a <alloc_smap_bit+0x180>
c010273a:	8b 55 dc             	mov    -0x24(%ebp),%edx
c010273d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102740:	01 d0                	add    %edx,%eax
c0102742:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0102745:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010274a:	83 ec 0c             	sub    $0xc,%esp
c010274d:	6a 07                	push   $0x7
c010274f:	68 00 02 00 00       	push   $0x200
c0102754:	50                   	push   %eax
c0102755:	ff 75 d8             	pushl  -0x28(%ebp)
c0102758:	ff 75 d4             	pushl  -0x2c(%ebp)
c010275b:	e8 b4 f0 ff ff       	call   c0101814 <rd_wt>
c0102760:	83 c4 20             	add    $0x20,%esp
c0102763:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c010276a:	e9 b0 00 00 00       	jmp    c010281f <alloc_smap_bit+0x145>
c010276f:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0102776:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010277a:	0f 85 8c 00 00 00    	jne    c010280c <alloc_smap_bit+0x132>
c0102780:	eb 45                	jmp    c01027c7 <alloc_smap_bit+0xed>
c0102782:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102788:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010278b:	01 d0                	add    %edx,%eax
c010278d:	0f b6 00             	movzbl (%eax),%eax
c0102790:	0f be d0             	movsbl %al,%edx
c0102793:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102796:	89 c1                	mov    %eax,%ecx
c0102798:	d3 fa                	sar    %cl,%edx
c010279a:	89 d0                	mov    %edx,%eax
c010279c:	83 e0 01             	and    $0x1,%eax
c010279f:	85 c0                	test   %eax,%eax
c01027a1:	74 06                	je     c01027a9 <alloc_smap_bit+0xcf>
c01027a3:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c01027a7:	eb 1e                	jmp    c01027c7 <alloc_smap_bit+0xed>
c01027a9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01027ac:	c1 e0 09             	shl    $0x9,%eax
c01027af:	89 c2                	mov    %eax,%edx
c01027b1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01027b4:	01 d0                	add    %edx,%eax
c01027b6:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c01027bd:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01027c0:	01 d0                	add    %edx,%eax
c01027c2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01027c5:	eb 06                	jmp    c01027cd <alloc_smap_bit+0xf3>
c01027c7:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c01027cb:	7e b5                	jle    c0102782 <alloc_smap_bit+0xa8>
c01027cd:	eb 3d                	jmp    c010280c <alloc_smap_bit+0x132>
c01027cf:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01027d3:	74 45                	je     c010281a <alloc_smap_bit+0x140>
c01027d5:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01027db:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01027de:	01 d0                	add    %edx,%eax
c01027e0:	0f b6 18             	movzbl (%eax),%ebx
c01027e3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01027e6:	ba 01 00 00 00       	mov    $0x1,%edx
c01027eb:	89 c1                	mov    %eax,%ecx
c01027ed:	d3 e2                	shl    %cl,%edx
c01027ef:	89 d0                	mov    %edx,%eax
c01027f1:	89 c1                	mov    %eax,%ecx
c01027f3:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01027f9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01027fc:	01 d0                	add    %edx,%eax
c01027fe:	09 cb                	or     %ecx,%ebx
c0102800:	89 da                	mov    %ebx,%edx
c0102802:	88 10                	mov    %dl,(%eax)
c0102804:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0102808:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c010280c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102810:	74 09                	je     c010281b <alloc_smap_bit+0x141>
c0102812:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0102816:	7e b7                	jle    c01027cf <alloc_smap_bit+0xf5>
c0102818:	eb 01                	jmp    c010281b <alloc_smap_bit+0x141>
c010281a:	90                   	nop
c010281b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c010281f:	81 7d ec ff 01 00 00 	cmpl   $0x1ff,-0x14(%ebp)
c0102826:	0f 8e 43 ff ff ff    	jle    c010276f <alloc_smap_bit+0x95>
c010282c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102830:	74 1e                	je     c0102850 <alloc_smap_bit+0x176>
c0102832:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102837:	83 ec 0c             	sub    $0xc,%esp
c010283a:	6a 0a                	push   $0xa
c010283c:	68 00 02 00 00       	push   $0x200
c0102841:	50                   	push   %eax
c0102842:	ff 75 d8             	pushl  -0x28(%ebp)
c0102845:	ff 75 d4             	pushl  -0x2c(%ebp)
c0102848:	e8 c7 ef ff ff       	call   c0101814 <rd_wt>
c010284d:	83 c4 20             	add    $0x20,%esp
c0102850:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102854:	74 12                	je     c0102868 <alloc_smap_bit+0x18e>
c0102856:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c010285a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010285d:	3b 45 e0             	cmp    -0x20(%ebp),%eax
c0102860:	0f 8c d4 fe ff ff    	jl     c010273a <alloc_smap_bit+0x60>
c0102866:	eb 01                	jmp    c0102869 <alloc_smap_bit+0x18f>
c0102868:	90                   	nop
c0102869:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010286c:	8d 50 ff             	lea    -0x1(%eax),%edx
c010286f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102872:	8b 00                	mov    (%eax),%eax
c0102874:	01 d0                	add    %edx,%eax
c0102876:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0102879:	c9                   	leave  
c010287a:	c3                   	ret    

c010287b <new_inode>:
c010287b:	55                   	push   %ebp
c010287c:	89 e5                	mov    %esp,%ebp
c010287e:	83 ec 38             	sub    $0x38,%esp
c0102881:	83 ec 08             	sub    $0x8,%esp
c0102884:	ff 75 0c             	pushl  0xc(%ebp)
c0102887:	8d 45 c8             	lea    -0x38(%ebp),%eax
c010288a:	50                   	push   %eax
c010288b:	e8 80 fa ff ff       	call   c0102310 <get_inode>
c0102890:	83 c4 10             	add    $0x10,%esp
c0102893:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0102896:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010289a:	75 0a                	jne    c01028a6 <new_inode+0x2b>
c010289c:	b8 00 00 00 00       	mov    $0x0,%eax
c01028a1:	e9 f1 00 00 00       	jmp    c0102997 <new_inode+0x11c>
c01028a6:	8b 45 10             	mov    0x10(%ebp),%eax
c01028a9:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01028ac:	c7 45 d4 00 08 00 00 	movl   $0x800,-0x2c(%ebp)
c01028b3:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c01028ba:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
c01028c1:	8b 45 0c             	mov    0xc(%ebp),%eax
c01028c4:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01028c7:	83 ec 0c             	sub    $0xc,%esp
c01028ca:	8d 45 c8             	lea    -0x38(%ebp),%eax
c01028cd:	50                   	push   %eax
c01028ce:	e8 39 0b 00 00       	call   c010340c <sync_inode>
c01028d3:	83 c4 10             	add    $0x10,%esp
c01028d6:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c01028dd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01028e4:	eb 1d                	jmp    c0102903 <new_inode+0x88>
c01028e6:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01028e9:	89 d0                	mov    %edx,%eax
c01028eb:	c1 e0 02             	shl    $0x2,%eax
c01028ee:	01 d0                	add    %edx,%eax
c01028f0:	c1 e0 03             	shl    $0x3,%eax
c01028f3:	05 b0 17 11 c0       	add    $0xc01117b0,%eax
c01028f8:	8b 00                	mov    (%eax),%eax
c01028fa:	39 45 0c             	cmp    %eax,0xc(%ebp)
c01028fd:	74 0c                	je     c010290b <new_inode+0x90>
c01028ff:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0102903:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c0102907:	7e dd                	jle    c01028e6 <new_inode+0x6b>
c0102909:	eb 01                	jmp    c010290c <new_inode+0x91>
c010290b:	90                   	nop
c010290c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010290f:	89 d0                	mov    %edx,%eax
c0102911:	c1 e0 02             	shl    $0x2,%eax
c0102914:	01 d0                	add    %edx,%eax
c0102916:	c1 e0 03             	shl    $0x3,%eax
c0102919:	05 a0 17 11 c0       	add    $0xc01117a0,%eax
c010291e:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0102921:	89 10                	mov    %edx,(%eax)
c0102923:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102926:	89 50 04             	mov    %edx,0x4(%eax)
c0102929:	8b 55 d0             	mov    -0x30(%ebp),%edx
c010292c:	89 50 08             	mov    %edx,0x8(%eax)
c010292f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0102932:	89 50 0c             	mov    %edx,0xc(%eax)
c0102935:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0102938:	89 50 10             	mov    %edx,0x10(%eax)
c010293b:	8b 55 dc             	mov    -0x24(%ebp),%edx
c010293e:	89 50 14             	mov    %edx,0x14(%eax)
c0102941:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0102944:	89 50 18             	mov    %edx,0x18(%eax)
c0102947:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c010294a:	89 50 1c             	mov    %edx,0x1c(%eax)
c010294d:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0102950:	89 50 20             	mov    %edx,0x20(%eax)
c0102953:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0102956:	89 50 24             	mov    %edx,0x24(%eax)
c0102959:	8b 45 08             	mov    0x8(%ebp),%eax
c010295c:	8b 55 c8             	mov    -0x38(%ebp),%edx
c010295f:	89 10                	mov    %edx,(%eax)
c0102961:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102964:	89 50 04             	mov    %edx,0x4(%eax)
c0102967:	8b 55 d0             	mov    -0x30(%ebp),%edx
c010296a:	89 50 08             	mov    %edx,0x8(%eax)
c010296d:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0102970:	89 50 0c             	mov    %edx,0xc(%eax)
c0102973:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0102976:	89 50 10             	mov    %edx,0x10(%eax)
c0102979:	8b 55 dc             	mov    -0x24(%ebp),%edx
c010297c:	89 50 14             	mov    %edx,0x14(%eax)
c010297f:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0102982:	89 50 18             	mov    %edx,0x18(%eax)
c0102985:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0102988:	89 50 1c             	mov    %edx,0x1c(%eax)
c010298b:	8b 55 e8             	mov    -0x18(%ebp),%edx
c010298e:	89 50 20             	mov    %edx,0x20(%eax)
c0102991:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0102994:	89 50 24             	mov    %edx,0x24(%eax)
c0102997:	c9                   	leave  
c0102998:	c3                   	ret    

c0102999 <new_dir_entry>:
c0102999:	55                   	push   %ebp
c010299a:	89 e5                	mov    %esp,%ebp
c010299c:	83 ec 48             	sub    $0x48,%esp
c010299f:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
c01029a6:	8b 45 0c             	mov    0xc(%ebp),%eax
c01029a9:	8b 40 04             	mov    0x4(%eax),%eax
c01029ac:	99                   	cltd   
c01029ad:	f7 7d dc             	idivl  -0x24(%ebp)
c01029b0:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01029b3:	8b 45 0c             	mov    0xc(%ebp),%eax
c01029b6:	8b 40 0c             	mov    0xc(%eax),%eax
c01029b9:	99                   	cltd   
c01029ba:	f7 7d dc             	idivl  -0x24(%ebp)
c01029bd:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01029c0:	e8 2b 0c 00 00       	call   c01035f0 <get_super_block>
c01029c5:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01029c8:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01029cb:	8b 00                	mov    (%eax),%eax
c01029cd:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01029d0:	8b 45 0c             	mov    0xc(%ebp),%eax
c01029d3:	8b 40 0c             	mov    0xc(%eax),%eax
c01029d6:	05 00 02 00 00       	add    $0x200,%eax
c01029db:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c01029e1:	85 c0                	test   %eax,%eax
c01029e3:	0f 48 c2             	cmovs  %edx,%eax
c01029e6:	c1 f8 09             	sar    $0x9,%eax
c01029e9:	89 45 c8             	mov    %eax,-0x38(%ebp)
c01029ec:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01029f3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01029fa:	c7 45 c4 20 00 00 00 	movl   $0x20,-0x3c(%ebp)
c0102a01:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0102a08:	eb 7f                	jmp    c0102a89 <new_dir_entry+0xf0>
c0102a0a:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102a0f:	89 c1                	mov    %eax,%ecx
c0102a11:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102a14:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102a17:	01 d0                	add    %edx,%eax
c0102a19:	83 ec 0c             	sub    $0xc,%esp
c0102a1c:	6a 07                	push   $0x7
c0102a1e:	68 00 02 00 00       	push   $0x200
c0102a23:	51                   	push   %ecx
c0102a24:	ff 75 c4             	pushl  -0x3c(%ebp)
c0102a27:	50                   	push   %eax
c0102a28:	e8 e7 ed ff ff       	call   c0101814 <rd_wt>
c0102a2d:	83 c4 20             	add    $0x20,%esp
c0102a30:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0102a35:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0102a38:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0102a3f:	eb 25                	jmp    c0102a66 <new_dir_entry+0xcd>
c0102a41:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0102a45:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102a48:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0102a4b:	7f 29                	jg     c0102a76 <new_dir_entry+0xdd>
c0102a4d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102a50:	8b 00                	mov    (%eax),%eax
c0102a52:	85 c0                	test   %eax,%eax
c0102a54:	75 08                	jne    c0102a5e <new_dir_entry+0xc5>
c0102a56:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102a59:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102a5c:	eb 19                	jmp    c0102a77 <new_dir_entry+0xde>
c0102a5e:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0102a62:	83 45 f0 10          	addl   $0x10,-0x10(%ebp)
c0102a66:	b8 00 02 00 00       	mov    $0x200,%eax
c0102a6b:	99                   	cltd   
c0102a6c:	f7 7d dc             	idivl  -0x24(%ebp)
c0102a6f:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0102a72:	7c cd                	jl     c0102a41 <new_dir_entry+0xa8>
c0102a74:	eb 01                	jmp    c0102a77 <new_dir_entry+0xde>
c0102a76:	90                   	nop
c0102a77:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102a7a:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0102a7d:	7f 16                	jg     c0102a95 <new_dir_entry+0xfc>
c0102a7f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102a83:	75 10                	jne    c0102a95 <new_dir_entry+0xfc>
c0102a85:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0102a89:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102a8c:	3b 45 c8             	cmp    -0x38(%ebp),%eax
c0102a8f:	0f 8c 75 ff ff ff    	jl     c0102a0a <new_dir_entry+0x71>
c0102a95:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0102a98:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
c0102a9b:	75 0a                	jne    c0102aa7 <new_dir_entry+0x10e>
c0102a9d:	b8 00 00 00 00       	mov    $0x0,%eax
c0102aa2:	e9 fc 00 00 00       	jmp    c0102ba3 <new_dir_entry+0x20a>
c0102aa7:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0102aae:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102ab2:	75 1e                	jne    c0102ad2 <new_dir_entry+0x139>
c0102ab4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102ab7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102aba:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102abd:	8b 50 04             	mov    0x4(%eax),%edx
c0102ac0:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0102ac3:	01 c2                	add    %eax,%edx
c0102ac5:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102ac8:	89 50 04             	mov    %edx,0x4(%eax)
c0102acb:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0102ad2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102ad5:	8b 55 14             	mov    0x14(%ebp),%edx
c0102ad8:	89 10                	mov    %edx,(%eax)
c0102ada:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102add:	83 c0 04             	add    $0x4,%eax
c0102ae0:	83 ec 08             	sub    $0x8,%esp
c0102ae3:	ff 75 10             	pushl  0x10(%ebp)
c0102ae6:	50                   	push   %eax
c0102ae7:	e8 02 97 00 00       	call   c010c1ee <Strcpy>
c0102aec:	83 c4 10             	add    $0x10,%esp
c0102aef:	8b 45 08             	mov    0x8(%ebp),%eax
c0102af2:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102af5:	8b 0a                	mov    (%edx),%ecx
c0102af7:	89 08                	mov    %ecx,(%eax)
c0102af9:	8b 4a 04             	mov    0x4(%edx),%ecx
c0102afc:	89 48 04             	mov    %ecx,0x4(%eax)
c0102aff:	8b 4a 08             	mov    0x8(%edx),%ecx
c0102b02:	89 48 08             	mov    %ecx,0x8(%eax)
c0102b05:	8b 52 0c             	mov    0xc(%edx),%edx
c0102b08:	89 50 0c             	mov    %edx,0xc(%eax)
c0102b0b:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102b10:	89 c1                	mov    %eax,%ecx
c0102b12:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102b15:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102b18:	01 d0                	add    %edx,%eax
c0102b1a:	83 ec 0c             	sub    $0xc,%esp
c0102b1d:	6a 0a                	push   $0xa
c0102b1f:	68 00 02 00 00       	push   $0x200
c0102b24:	51                   	push   %ecx
c0102b25:	ff 75 c4             	pushl  -0x3c(%ebp)
c0102b28:	50                   	push   %eax
c0102b29:	e8 e6 ec ff ff       	call   c0101814 <rd_wt>
c0102b2e:	83 c4 20             	add    $0x20,%esp
c0102b31:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0102b35:	74 69                	je     c0102ba0 <new_dir_entry+0x207>
c0102b37:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102b3a:	8b 10                	mov    (%eax),%edx
c0102b3c:	89 15 c0 21 11 c0    	mov    %edx,0xc01121c0
c0102b42:	8b 50 04             	mov    0x4(%eax),%edx
c0102b45:	89 15 c4 21 11 c0    	mov    %edx,0xc01121c4
c0102b4b:	8b 50 08             	mov    0x8(%eax),%edx
c0102b4e:	89 15 c8 21 11 c0    	mov    %edx,0xc01121c8
c0102b54:	8b 50 0c             	mov    0xc(%eax),%edx
c0102b57:	89 15 cc 21 11 c0    	mov    %edx,0xc01121cc
c0102b5d:	8b 50 10             	mov    0x10(%eax),%edx
c0102b60:	89 15 d0 21 11 c0    	mov    %edx,0xc01121d0
c0102b66:	8b 50 14             	mov    0x14(%eax),%edx
c0102b69:	89 15 d4 21 11 c0    	mov    %edx,0xc01121d4
c0102b6f:	8b 50 18             	mov    0x18(%eax),%edx
c0102b72:	89 15 d8 21 11 c0    	mov    %edx,0xc01121d8
c0102b78:	8b 50 1c             	mov    0x1c(%eax),%edx
c0102b7b:	89 15 dc 21 11 c0    	mov    %edx,0xc01121dc
c0102b81:	8b 50 20             	mov    0x20(%eax),%edx
c0102b84:	89 15 e0 21 11 c0    	mov    %edx,0xc01121e0
c0102b8a:	8b 40 24             	mov    0x24(%eax),%eax
c0102b8d:	a3 e4 21 11 c0       	mov    %eax,0xc01121e4
c0102b92:	83 ec 0c             	sub    $0xc,%esp
c0102b95:	ff 75 0c             	pushl  0xc(%ebp)
c0102b98:	e8 6f 08 00 00       	call   c010340c <sync_inode>
c0102b9d:	83 c4 10             	add    $0x10,%esp
c0102ba0:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ba3:	c9                   	leave  
c0102ba4:	c3                   	ret    

c0102ba5 <do_unlink>:
c0102ba5:	55                   	push   %ebp
c0102ba6:	89 e5                	mov    %esp,%ebp
c0102ba8:	53                   	push   %ebx
c0102ba9:	81 ec a4 00 00 00    	sub    $0xa4,%esp
c0102baf:	83 ec 08             	sub    $0x8,%esp
c0102bb2:	ff 75 08             	pushl  0x8(%ebp)
c0102bb5:	68 09 b4 10 c0       	push   $0xc010b409
c0102bba:	e8 bd 6c 00 00       	call   c010987c <strcmp>
c0102bbf:	83 c4 10             	add    $0x10,%esp
c0102bc2:	85 c0                	test   %eax,%eax
c0102bc4:	75 10                	jne    c0102bd6 <do_unlink+0x31>
c0102bc6:	83 ec 0c             	sub    $0xc,%esp
c0102bc9:	68 0b b4 10 c0       	push   $0xc010b40b
c0102bce:	e8 b4 5c 00 00       	call   c0108887 <panic>
c0102bd3:	83 c4 10             	add    $0x10,%esp
c0102bd6:	83 ec 0c             	sub    $0xc,%esp
c0102bd9:	ff 75 08             	pushl  0x8(%ebp)
c0102bdc:	e8 31 f5 ff ff       	call   c0102112 <search_file>
c0102be1:	83 c4 10             	add    $0x10,%esp
c0102be4:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0102be7:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0102beb:	75 10                	jne    c0102bfd <do_unlink+0x58>
c0102bed:	83 ec 0c             	sub    $0xc,%esp
c0102bf0:	68 27 b4 10 c0       	push   $0xc010b427
c0102bf5:	e8 8d 5c 00 00       	call   c0108887 <panic>
c0102bfa:	83 c4 10             	add    $0x10,%esp
c0102bfd:	83 ec 08             	sub    $0x8,%esp
c0102c00:	ff 75 d0             	pushl  -0x30(%ebp)
c0102c03:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0102c09:	50                   	push   %eax
c0102c0a:	e8 01 f7 ff ff       	call   c0102310 <get_inode>
c0102c0f:	83 c4 10             	add    $0x10,%esp
c0102c12:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0102c15:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0102c19:	75 10                	jne    c0102c2b <do_unlink+0x86>
c0102c1b:	83 ec 0c             	sub    $0xc,%esp
c0102c1e:	68 27 b4 10 c0       	push   $0xc010b427
c0102c23:	e8 5f 5c 00 00       	call   c0108887 <panic>
c0102c28:	83 c4 10             	add    $0x10,%esp
c0102c2b:	8b 45 88             	mov    -0x78(%ebp),%eax
c0102c2e:	85 c0                	test   %eax,%eax
c0102c30:	7e 10                	jle    c0102c42 <do_unlink+0x9d>
c0102c32:	83 ec 0c             	sub    $0xc,%esp
c0102c35:	68 40 b4 10 c0       	push   $0xc010b440
c0102c3a:	e8 48 5c 00 00       	call   c0108887 <panic>
c0102c3f:	83 c4 10             	add    $0x10,%esp
c0102c42:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0102c48:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0102c4b:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0102c4e:	8d 50 07             	lea    0x7(%eax),%edx
c0102c51:	85 c0                	test   %eax,%eax
c0102c53:	0f 48 c2             	cmovs  %edx,%eax
c0102c56:	c1 f8 03             	sar    $0x3,%eax
c0102c59:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0102c5c:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0102c5f:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0102c65:	85 c0                	test   %eax,%eax
c0102c67:	0f 48 c2             	cmovs  %edx,%eax
c0102c6a:	c1 f8 09             	sar    $0x9,%eax
c0102c6d:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0102c70:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0102c73:	99                   	cltd   
c0102c74:	c1 ea 1d             	shr    $0x1d,%edx
c0102c77:	01 d0                	add    %edx,%eax
c0102c79:	83 e0 07             	and    $0x7,%eax
c0102c7c:	29 d0                	sub    %edx,%eax
c0102c7e:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0102c81:	c7 45 b8 20 00 00 00 	movl   $0x20,-0x48(%ebp)
c0102c88:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102c8d:	89 c2                	mov    %eax,%edx
c0102c8f:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0102c92:	83 c0 02             	add    $0x2,%eax
c0102c95:	83 ec 0c             	sub    $0xc,%esp
c0102c98:	6a 07                	push   $0x7
c0102c9a:	68 00 02 00 00       	push   $0x200
c0102c9f:	52                   	push   %edx
c0102ca0:	ff 75 b8             	pushl  -0x48(%ebp)
c0102ca3:	50                   	push   %eax
c0102ca4:	e8 6b eb ff ff       	call   c0101814 <rd_wt>
c0102ca9:	83 c4 20             	add    $0x20,%esp
c0102cac:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102cb2:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0102cb5:	01 d0                	add    %edx,%eax
c0102cb7:	0f b6 10             	movzbl (%eax),%edx
c0102cba:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0102cbd:	bb 01 00 00 00       	mov    $0x1,%ebx
c0102cc2:	89 c1                	mov    %eax,%ecx
c0102cc4:	d3 e3                	shl    %cl,%ebx
c0102cc6:	89 d8                	mov    %ebx,%eax
c0102cc8:	f7 d0                	not    %eax
c0102cca:	89 c3                	mov    %eax,%ebx
c0102ccc:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0102cd2:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0102cd5:	01 c8                	add    %ecx,%eax
c0102cd7:	21 da                	and    %ebx,%edx
c0102cd9:	88 10                	mov    %dl,(%eax)
c0102cdb:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102ce0:	89 c2                	mov    %eax,%edx
c0102ce2:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0102ce5:	83 c0 02             	add    $0x2,%eax
c0102ce8:	83 ec 0c             	sub    $0xc,%esp
c0102ceb:	6a 0a                	push   $0xa
c0102ced:	68 00 02 00 00       	push   $0x200
c0102cf2:	52                   	push   %edx
c0102cf3:	ff 75 b8             	pushl  -0x48(%ebp)
c0102cf6:	50                   	push   %eax
c0102cf7:	e8 18 eb ff ff       	call   c0101814 <rd_wt>
c0102cfc:	83 c4 20             	add    $0x20,%esp
c0102cff:	e8 ec 08 00 00       	call   c01035f0 <get_super_block>
c0102d04:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0102d07:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0102d0d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0102d10:	8b 00                	mov    (%eax),%eax
c0102d12:	29 c2                	sub    %eax,%edx
c0102d14:	89 d0                	mov    %edx,%eax
c0102d16:	83 c0 01             	add    $0x1,%eax
c0102d19:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0102d1c:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0102d1f:	8d 50 07             	lea    0x7(%eax),%edx
c0102d22:	85 c0                	test   %eax,%eax
c0102d24:	0f 48 c2             	cmovs  %edx,%eax
c0102d27:	c1 f8 03             	sar    $0x3,%eax
c0102d2a:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0102d2d:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0102d30:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0102d36:	85 c0                	test   %eax,%eax
c0102d38:	0f 48 c2             	cmovs  %edx,%eax
c0102d3b:	c1 f8 09             	sar    $0x9,%eax
c0102d3e:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0102d41:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0102d44:	99                   	cltd   
c0102d45:	c1 ea 1d             	shr    $0x1d,%edx
c0102d48:	01 d0                	add    %edx,%eax
c0102d4a:	83 e0 07             	and    $0x7,%eax
c0102d4d:	29 d0                	sub    %edx,%eax
c0102d4f:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0102d52:	b8 08 00 00 00       	mov    $0x8,%eax
c0102d57:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c0102d5a:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0102d5d:	29 c2                	sub    %eax,%edx
c0102d5f:	89 d0                	mov    %edx,%eax
c0102d61:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102d64:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102d67:	8d 50 07             	lea    0x7(%eax),%edx
c0102d6a:	85 c0                	test   %eax,%eax
c0102d6c:	0f 48 c2             	cmovs  %edx,%eax
c0102d6f:	c1 f8 03             	sar    $0x3,%eax
c0102d72:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0102d75:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102d7a:	89 c1                	mov    %eax,%ecx
c0102d7c:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0102d7f:	8b 40 04             	mov    0x4(%eax),%eax
c0102d82:	8d 50 02             	lea    0x2(%eax),%edx
c0102d85:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0102d88:	01 d0                	add    %edx,%eax
c0102d8a:	83 ec 0c             	sub    $0xc,%esp
c0102d8d:	6a 07                	push   $0x7
c0102d8f:	68 00 02 00 00       	push   $0x200
c0102d94:	51                   	push   %ecx
c0102d95:	ff 75 b8             	pushl  -0x48(%ebp)
c0102d98:	50                   	push   %eax
c0102d99:	e8 76 ea ff ff       	call   c0101814 <rd_wt>
c0102d9e:	83 c4 20             	add    $0x20,%esp
c0102da1:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102da7:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0102daa:	01 d0                	add    %edx,%eax
c0102dac:	0f b6 10             	movzbl (%eax),%edx
c0102daf:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0102db2:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0102db7:	89 c1                	mov    %eax,%ecx
c0102db9:	d3 e3                	shl    %cl,%ebx
c0102dbb:	89 d8                	mov    %ebx,%eax
c0102dbd:	f7 d0                	not    %eax
c0102dbf:	89 c3                	mov    %eax,%ebx
c0102dc1:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0102dc7:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0102dca:	01 c8                	add    %ecx,%eax
c0102dcc:	21 da                	and    %ebx,%edx
c0102dce:	88 10                	mov    %dl,(%eax)
c0102dd0:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0102dd7:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0102dda:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102ddd:	eb 6b                	jmp    c0102e4a <do_unlink+0x2a5>
c0102ddf:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0102de6:	75 4c                	jne    c0102e34 <do_unlink+0x28f>
c0102de8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102def:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102df4:	83 ec 0c             	sub    $0xc,%esp
c0102df7:	6a 0a                	push   $0xa
c0102df9:	68 00 02 00 00       	push   $0x200
c0102dfe:	50                   	push   %eax
c0102dff:	ff 75 b8             	pushl  -0x48(%ebp)
c0102e02:	ff 75 ec             	pushl  -0x14(%ebp)
c0102e05:	e8 0a ea ff ff       	call   c0101814 <rd_wt>
c0102e0a:	83 c4 20             	add    $0x20,%esp
c0102e0d:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102e12:	89 c1                	mov    %eax,%ecx
c0102e14:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102e17:	8d 50 01             	lea    0x1(%eax),%edx
c0102e1a:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0102e1d:	83 ec 0c             	sub    $0xc,%esp
c0102e20:	6a 07                	push   $0x7
c0102e22:	68 00 02 00 00       	push   $0x200
c0102e27:	51                   	push   %ecx
c0102e28:	ff 75 b8             	pushl  -0x48(%ebp)
c0102e2b:	50                   	push   %eax
c0102e2c:	e8 e3 e9 ff ff       	call   c0101814 <rd_wt>
c0102e31:	83 c4 20             	add    $0x20,%esp
c0102e34:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102e3a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102e3d:	01 d0                	add    %edx,%eax
c0102e3f:	c6 00 00             	movb   $0x0,(%eax)
c0102e42:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0102e46:	83 6d f4 08          	subl   $0x8,-0xc(%ebp)
c0102e4a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102e4d:	3b 45 a0             	cmp    -0x60(%ebp),%eax
c0102e50:	7c 8d                	jl     c0102ddf <do_unlink+0x23a>
c0102e52:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0102e59:	75 4c                	jne    c0102ea7 <do_unlink+0x302>
c0102e5b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102e62:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102e67:	83 ec 0c             	sub    $0xc,%esp
c0102e6a:	6a 0a                	push   $0xa
c0102e6c:	68 00 02 00 00       	push   $0x200
c0102e71:	50                   	push   %eax
c0102e72:	ff 75 b8             	pushl  -0x48(%ebp)
c0102e75:	ff 75 ec             	pushl  -0x14(%ebp)
c0102e78:	e8 97 e9 ff ff       	call   c0101814 <rd_wt>
c0102e7d:	83 c4 20             	add    $0x20,%esp
c0102e80:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102e85:	89 c1                	mov    %eax,%ecx
c0102e87:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102e8a:	8d 50 01             	lea    0x1(%eax),%edx
c0102e8d:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0102e90:	83 ec 0c             	sub    $0xc,%esp
c0102e93:	6a 07                	push   $0x7
c0102e95:	68 00 02 00 00       	push   $0x200
c0102e9a:	51                   	push   %ecx
c0102e9b:	ff 75 b8             	pushl  -0x48(%ebp)
c0102e9e:	50                   	push   %eax
c0102e9f:	e8 70 e9 ff ff       	call   c0101814 <rd_wt>
c0102ea4:	83 c4 20             	add    $0x20,%esp
c0102ea7:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102ead:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102eb0:	01 d0                	add    %edx,%eax
c0102eb2:	0f b6 10             	movzbl (%eax),%edx
c0102eb5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102eb8:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0102ebd:	89 c1                	mov    %eax,%ecx
c0102ebf:	d3 e3                	shl    %cl,%ebx
c0102ec1:	89 d8                	mov    %ebx,%eax
c0102ec3:	89 c3                	mov    %eax,%ebx
c0102ec5:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0102ecb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102ece:	01 c8                	add    %ecx,%eax
c0102ed0:	21 da                	and    %ebx,%edx
c0102ed2:	88 10                	mov    %dl,(%eax)
c0102ed4:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102ed9:	83 ec 0c             	sub    $0xc,%esp
c0102edc:	6a 0a                	push   $0xa
c0102ede:	68 00 02 00 00       	push   $0x200
c0102ee3:	50                   	push   %eax
c0102ee4:	ff 75 b8             	pushl  -0x48(%ebp)
c0102ee7:	ff 75 ec             	pushl  -0x14(%ebp)
c0102eea:	e8 25 e9 ff ff       	call   c0101814 <rd_wt>
c0102eef:	83 c4 20             	add    $0x20,%esp
c0102ef2:	c7 85 6c ff ff ff 00 	movl   $0x0,-0x94(%ebp)
c0102ef9:	00 00 00 
c0102efc:	c7 85 68 ff ff ff 00 	movl   $0x0,-0x98(%ebp)
c0102f03:	00 00 00 
c0102f06:	c7 85 70 ff ff ff 00 	movl   $0x0,-0x90(%ebp)
c0102f0d:	00 00 00 
c0102f10:	83 ec 0c             	sub    $0xc,%esp
c0102f13:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0102f19:	50                   	push   %eax
c0102f1a:	e8 ed 04 00 00       	call   c010340c <sync_inode>
c0102f1f:	83 c4 10             	add    $0x10,%esp
c0102f22:	83 ec 0c             	sub    $0xc,%esp
c0102f25:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0102f2b:	50                   	push   %eax
c0102f2c:	e8 2f 06 00 00       	call   c0103560 <put_inode>
c0102f31:	83 c4 10             	add    $0x10,%esp
c0102f34:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0102f37:	8b 00                	mov    (%eax),%eax
c0102f39:	89 45 9c             	mov    %eax,-0x64(%ebp)
c0102f3c:	c7 45 98 c0 21 11 c0 	movl   $0xc01121c0,-0x68(%ebp)
c0102f43:	8b 45 98             	mov    -0x68(%ebp),%eax
c0102f46:	8b 40 04             	mov    0x4(%eax),%eax
c0102f49:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0102f4c:	8b 45 98             	mov    -0x68(%ebp),%eax
c0102f4f:	8b 40 0c             	mov    0xc(%eax),%eax
c0102f52:	89 45 90             	mov    %eax,-0x70(%ebp)
c0102f55:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0102f58:	c1 e8 04             	shr    $0x4,%eax
c0102f5b:	89 45 8c             	mov    %eax,-0x74(%ebp)
c0102f5e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0102f65:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0102f6c:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0102f73:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0102f7a:	e9 a5 00 00 00       	jmp    c0103024 <do_unlink+0x47f>
c0102f7f:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102f84:	89 c1                	mov    %eax,%ecx
c0102f86:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0102f89:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0102f8c:	01 d0                	add    %edx,%eax
c0102f8e:	83 ec 0c             	sub    $0xc,%esp
c0102f91:	6a 07                	push   $0x7
c0102f93:	68 00 02 00 00       	push   $0x200
c0102f98:	51                   	push   %ecx
c0102f99:	ff 75 b8             	pushl  -0x48(%ebp)
c0102f9c:	50                   	push   %eax
c0102f9d:	e8 72 e8 ff ff       	call   c0101814 <rd_wt>
c0102fa2:	83 c4 20             	add    $0x20,%esp
c0102fa5:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0102faa:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0102fad:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0102fb4:	eb 51                	jmp    c0103007 <do_unlink+0x462>
c0102fb6:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0102fba:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102fbd:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0102fc0:	7f 4f                	jg     c0103011 <do_unlink+0x46c>
c0102fc2:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0102fc5:	83 c0 10             	add    $0x10,%eax
c0102fc8:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0102fcb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0102fce:	83 c0 04             	add    $0x4,%eax
c0102fd1:	83 ec 08             	sub    $0x8,%esp
c0102fd4:	ff 75 08             	pushl  0x8(%ebp)
c0102fd7:	50                   	push   %eax
c0102fd8:	e8 9f 68 00 00       	call   c010987c <strcmp>
c0102fdd:	83 c4 10             	add    $0x10,%esp
c0102fe0:	85 c0                	test   %eax,%eax
c0102fe2:	75 1b                	jne    c0102fff <do_unlink+0x45a>
c0102fe4:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c0102feb:	83 ec 04             	sub    $0x4,%esp
c0102fee:	6a 10                	push   $0x10
c0102ff0:	6a 00                	push   $0x0
c0102ff2:	ff 75 d4             	pushl  -0x2c(%ebp)
c0102ff5:	e8 d5 91 00 00       	call   c010c1cf <Memset>
c0102ffa:	83 c4 10             	add    $0x10,%esp
c0102ffd:	eb 13                	jmp    c0103012 <do_unlink+0x46d>
c0102fff:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
c0103003:	83 45 d4 10          	addl   $0x10,-0x2c(%ebp)
c0103007:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010300a:	3b 45 90             	cmp    -0x70(%ebp),%eax
c010300d:	7c a7                	jl     c0102fb6 <do_unlink+0x411>
c010300f:	eb 01                	jmp    c0103012 <do_unlink+0x46d>
c0103011:	90                   	nop
c0103012:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0103015:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0103018:	7f 16                	jg     c0103030 <do_unlink+0x48b>
c010301a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c010301e:	75 10                	jne    c0103030 <do_unlink+0x48b>
c0103020:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
c0103024:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0103027:	3b 45 90             	cmp    -0x70(%ebp),%eax
c010302a:	0f 8c 4f ff ff ff    	jl     c0102f7f <do_unlink+0x3da>
c0103030:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0103033:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0103036:	75 17                	jne    c010304f <do_unlink+0x4aa>
c0103038:	8b 45 98             	mov    -0x68(%ebp),%eax
c010303b:	8b 55 e0             	mov    -0x20(%ebp),%edx
c010303e:	89 50 04             	mov    %edx,0x4(%eax)
c0103041:	83 ec 0c             	sub    $0xc,%esp
c0103044:	ff 75 98             	pushl  -0x68(%ebp)
c0103047:	e8 c0 03 00 00       	call   c010340c <sync_inode>
c010304c:	83 c4 10             	add    $0x10,%esp
c010304f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0103053:	74 26                	je     c010307b <do_unlink+0x4d6>
c0103055:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010305a:	89 c1                	mov    %eax,%ecx
c010305c:	8b 55 9c             	mov    -0x64(%ebp),%edx
c010305f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103062:	01 d0                	add    %edx,%eax
c0103064:	83 ec 0c             	sub    $0xc,%esp
c0103067:	6a 0a                	push   $0xa
c0103069:	68 00 02 00 00       	push   $0x200
c010306e:	51                   	push   %ecx
c010306f:	ff 75 b8             	pushl  -0x48(%ebp)
c0103072:	50                   	push   %eax
c0103073:	e8 9c e7 ff ff       	call   c0101814 <rd_wt>
c0103078:	83 c4 20             	add    $0x20,%esp
c010307b:	90                   	nop
c010307c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c010307f:	c9                   	leave  
c0103080:	c3                   	ret    

c0103081 <do_rdwt>:
c0103081:	55                   	push   %ebp
c0103082:	89 e5                	mov    %esp,%ebp
c0103084:	81 ec 98 00 00 00    	sub    $0x98,%esp
c010308a:	8b 45 08             	mov    0x8(%ebp),%eax
c010308d:	8b 40 78             	mov    0x78(%eax),%eax
c0103090:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0103093:	8b 45 08             	mov    0x8(%ebp),%eax
c0103096:	8b 40 60             	mov    0x60(%eax),%eax
c0103099:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010309c:	8b 45 08             	mov    0x8(%ebp),%eax
c010309f:	8b 40 6c             	mov    0x6c(%eax),%eax
c01030a2:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01030a5:	8b 45 08             	mov    0x8(%ebp),%eax
c01030a8:	8b 00                	mov    (%eax),%eax
c01030aa:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01030ad:	8b 45 08             	mov    0x8(%ebp),%eax
c01030b0:	8b 40 10             	mov    0x10(%eax),%eax
c01030b3:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01030b6:	8b 45 08             	mov    0x8(%ebp),%eax
c01030b9:	8b 40 50             	mov    0x50(%eax),%eax
c01030bc:	89 45 c8             	mov    %eax,-0x38(%ebp)
c01030bf:	83 ec 0c             	sub    $0xc,%esp
c01030c2:	ff 75 d0             	pushl  -0x30(%ebp)
c01030c5:	e8 0c 07 00 00       	call   c01037d6 <pid2proc>
c01030ca:	83 c4 10             	add    $0x10,%esp
c01030cd:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c01030d0:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01030d3:	8b 55 c8             	mov    -0x38(%ebp),%edx
c01030d6:	83 c2 4c             	add    $0x4c,%edx
c01030d9:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c01030dd:	89 45 c0             	mov    %eax,-0x40(%ebp)
c01030e0:	8b 45 c0             	mov    -0x40(%ebp),%eax
c01030e3:	8b 40 08             	mov    0x8(%eax),%eax
c01030e6:	89 45 bc             	mov    %eax,-0x44(%ebp)
c01030e9:	8b 45 08             	mov    0x8(%ebp),%eax
c01030ec:	8b 00                	mov    (%eax),%eax
c01030ee:	89 45 b8             	mov    %eax,-0x48(%ebp)
c01030f1:	83 ec 08             	sub    $0x8,%esp
c01030f4:	ff 75 bc             	pushl  -0x44(%ebp)
c01030f7:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c01030fd:	50                   	push   %eax
c01030fe:	e8 0d f2 ff ff       	call   c0102310 <get_inode>
c0103103:	83 c4 10             	add    $0x10,%esp
c0103106:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0103109:	83 7d b4 00          	cmpl   $0x0,-0x4c(%ebp)
c010310d:	75 10                	jne    c010311f <do_rdwt+0x9e>
c010310f:	83 ec 0c             	sub    $0xc,%esp
c0103112:	68 78 b4 10 c0       	push   $0xc010b478
c0103117:	e8 6b 57 00 00       	call   c0108887 <panic>
c010311c:	83 c4 10             	add    $0x10,%esp
c010311f:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c0103125:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0103128:	8b 45 c0             	mov    -0x40(%ebp),%eax
c010312b:	8b 40 04             	mov    0x4(%eax),%eax
c010312e:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0103131:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c0103135:	74 22                	je     c0103159 <do_rdwt+0xd8>
c0103137:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c010313b:	74 1c                	je     c0103159 <do_rdwt+0xd8>
c010313d:	68 a8 04 00 00       	push   $0x4a8
c0103142:	68 e4 b2 10 c0       	push   $0xc010b2e4
c0103147:	68 e4 b2 10 c0       	push   $0xc010b2e4
c010314c:	68 88 b4 10 c0       	push   $0xc010b488
c0103151:	e8 4f 57 00 00       	call   c01088a5 <assertion_failure>
c0103156:	83 c4 10             	add    $0x10,%esp
c0103159:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
c010315f:	83 f8 01             	cmp    $0x1,%eax
c0103162:	0f 85 86 00 00 00    	jne    c01031ee <do_rdwt+0x16d>
c0103168:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c010316c:	75 09                	jne    c0103177 <do_rdwt+0xf6>
c010316e:	c7 45 f4 d2 07 00 00 	movl   $0x7d2,-0xc(%ebp)
c0103175:	eb 0d                	jmp    c0103184 <do_rdwt+0x103>
c0103177:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c010317b:	75 07                	jne    c0103184 <do_rdwt+0x103>
c010317d:	c7 45 f4 d3 07 00 00 	movl   $0x7d3,-0xc(%ebp)
c0103184:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0103187:	8b 45 08             	mov    0x8(%ebp),%eax
c010318a:	89 50 78             	mov    %edx,0x78(%eax)
c010318d:	8b 55 b8             	mov    -0x48(%ebp),%edx
c0103190:	8b 45 08             	mov    0x8(%ebp),%eax
c0103193:	89 50 68             	mov    %edx,0x68(%eax)
c0103196:	83 ec 04             	sub    $0x4,%esp
c0103199:	6a 04                	push   $0x4
c010319b:	ff 75 08             	pushl  0x8(%ebp)
c010319e:	6a 03                	push   $0x3
c01031a0:	e8 70 63 00 00       	call   c0109515 <send_rec>
c01031a5:	83 c4 10             	add    $0x10,%esp
c01031a8:	8b 45 08             	mov    0x8(%ebp),%eax
c01031ab:	8b 40 78             	mov    0x78(%eax),%eax
c01031ae:	83 f8 66             	cmp    $0x66,%eax
c01031b1:	75 13                	jne    c01031c6 <do_rdwt+0x145>
c01031b3:	83 ec 04             	sub    $0x4,%esp
c01031b6:	ff 75 b8             	pushl  -0x48(%ebp)
c01031b9:	ff 75 08             	pushl  0x8(%ebp)
c01031bc:	6a 01                	push   $0x1
c01031be:	e8 52 63 00 00       	call   c0109515 <send_rec>
c01031c3:	83 c4 10             	add    $0x10,%esp
c01031c6:	8b 45 08             	mov    0x8(%ebp),%eax
c01031c9:	8b 40 78             	mov    0x78(%eax),%eax
c01031cc:	83 f8 65             	cmp    $0x65,%eax
c01031cf:	75 13                	jne    c01031e4 <do_rdwt+0x163>
c01031d1:	83 ec 04             	sub    $0x4,%esp
c01031d4:	ff 75 b8             	pushl  -0x48(%ebp)
c01031d7:	ff 75 08             	pushl  0x8(%ebp)
c01031da:	6a 01                	push   $0x1
c01031dc:	e8 34 63 00 00       	call   c0109515 <send_rec>
c01031e1:	83 c4 10             	add    $0x10,%esp
c01031e4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01031e9:	e9 1c 02 00 00       	jmp    c010340a <do_rdwt+0x389>
c01031ee:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c01031f2:	75 18                	jne    c010320c <do_rdwt+0x18b>
c01031f4:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c01031fa:	c1 e0 09             	shl    $0x9,%eax
c01031fd:	39 45 ac             	cmp    %eax,-0x54(%ebp)
c0103200:	75 0a                	jne    c010320c <do_rdwt+0x18b>
c0103202:	b8 00 00 00 00       	mov    $0x0,%eax
c0103207:	e9 fe 01 00 00       	jmp    c010340a <do_rdwt+0x389>
c010320c:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c0103210:	75 14                	jne    c0103226 <do_rdwt+0x1a5>
c0103212:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0103215:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0103218:	01 d0                	add    %edx,%eax
c010321a:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c010321d:	0f 4e 45 b0          	cmovle -0x50(%ebp),%eax
c0103221:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103224:	eb 19                	jmp    c010323f <do_rdwt+0x1be>
c0103226:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0103229:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010322c:	01 c2                	add    %eax,%edx
c010322e:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0103234:	c1 e0 09             	shl    $0x9,%eax
c0103237:	39 c2                	cmp    %eax,%edx
c0103239:	0f 4e c2             	cmovle %edx,%eax
c010323c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010323f:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0103242:	99                   	cltd   
c0103243:	c1 ea 17             	shr    $0x17,%edx
c0103246:	01 d0                	add    %edx,%eax
c0103248:	25 ff 01 00 00       	and    $0x1ff,%eax
c010324d:	29 d0                	sub    %edx,%eax
c010324f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103252:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c0103258:	8b 45 ac             	mov    -0x54(%ebp),%eax
c010325b:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c0103261:	85 c0                	test   %eax,%eax
c0103263:	0f 48 c1             	cmovs  %ecx,%eax
c0103266:	c1 f8 09             	sar    $0x9,%eax
c0103269:	01 d0                	add    %edx,%eax
c010326b:	89 45 a8             	mov    %eax,-0x58(%ebp)
c010326e:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c0103274:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103277:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c010327d:	85 c0                	test   %eax,%eax
c010327f:	0f 48 c1             	cmovs  %ecx,%eax
c0103282:	c1 f8 09             	sar    $0x9,%eax
c0103285:	01 d0                	add    %edx,%eax
c0103287:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c010328a:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c010328d:	2b 45 a8             	sub    -0x58(%ebp),%eax
c0103290:	ba 00 00 10 00       	mov    $0x100000,%edx
c0103295:	39 d0                	cmp    %edx,%eax
c0103297:	7d 0b                	jge    c01032a4 <do_rdwt+0x223>
c0103299:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c010329c:	2b 45 a8             	sub    -0x58(%ebp),%eax
c010329f:	83 c0 01             	add    $0x1,%eax
c01032a2:	eb 05                	jmp    c01032a9 <do_rdwt+0x228>
c01032a4:	b8 00 00 10 00       	mov    $0x100000,%eax
c01032a9:	89 45 a0             	mov    %eax,-0x60(%ebp)
c01032ac:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01032af:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01032b2:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01032b9:	8b 45 08             	mov    0x8(%ebp),%eax
c01032bc:	8b 00                	mov    (%eax),%eax
c01032be:	83 ec 0c             	sub    $0xc,%esp
c01032c1:	50                   	push   %eax
c01032c2:	e8 0f 05 00 00       	call   c01037d6 <pid2proc>
c01032c7:	83 c4 10             	add    $0x10,%esp
c01032ca:	89 45 9c             	mov    %eax,-0x64(%ebp)
c01032cd:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01032d0:	83 ec 08             	sub    $0x8,%esp
c01032d3:	50                   	push   %eax
c01032d4:	ff 75 cc             	pushl  -0x34(%ebp)
c01032d7:	e8 43 2b 00 00       	call   c0105e1f <alloc_virtual_memory>
c01032dc:	83 c4 10             	add    $0x10,%esp
c01032df:	89 45 98             	mov    %eax,-0x68(%ebp)
c01032e2:	8b 45 a8             	mov    -0x58(%ebp),%eax
c01032e5:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01032e8:	e9 c5 00 00 00       	jmp    c01033b2 <do_rdwt+0x331>
c01032ed:	8b 45 a0             	mov    -0x60(%ebp),%eax
c01032f0:	c1 e0 09             	shl    $0x9,%eax
c01032f3:	2b 45 ec             	sub    -0x14(%ebp),%eax
c01032f6:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c01032f9:	0f 4e 45 e8          	cmovle -0x18(%ebp),%eax
c01032fd:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0103300:	c7 45 90 20 00 00 00 	movl   $0x20,-0x70(%ebp)
c0103307:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c010330b:	75 46                	jne    c0103353 <do_rdwt+0x2d2>
c010330d:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0103310:	c1 e0 09             	shl    $0x9,%eax
c0103313:	8b 15 84 17 11 c0    	mov    0xc0111784,%edx
c0103319:	83 ec 0c             	sub    $0xc,%esp
c010331c:	6a 07                	push   $0x7
c010331e:	50                   	push   %eax
c010331f:	52                   	push   %edx
c0103320:	ff 75 90             	pushl  -0x70(%ebp)
c0103323:	ff 75 e0             	pushl  -0x20(%ebp)
c0103326:	e8 e9 e4 ff ff       	call   c0101814 <rd_wt>
c010332b:	83 c4 20             	add    $0x20,%esp
c010332e:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0103334:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103337:	01 d0                	add    %edx,%eax
c0103339:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c010333c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c010333f:	01 ca                	add    %ecx,%edx
c0103341:	83 ec 04             	sub    $0x4,%esp
c0103344:	ff 75 94             	pushl  -0x6c(%ebp)
c0103347:	50                   	push   %eax
c0103348:	52                   	push   %edx
c0103349:	e8 3e 39 00 00       	call   c0106c8c <Memcpy>
c010334e:	83 c4 10             	add    $0x10,%esp
c0103351:	eb 46                	jmp    c0103399 <do_rdwt+0x318>
c0103353:	8b 55 98             	mov    -0x68(%ebp),%edx
c0103356:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0103359:	01 d0                	add    %edx,%eax
c010335b:	89 c1                	mov    %eax,%ecx
c010335d:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0103363:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103366:	01 d0                	add    %edx,%eax
c0103368:	83 ec 04             	sub    $0x4,%esp
c010336b:	ff 75 94             	pushl  -0x6c(%ebp)
c010336e:	51                   	push   %ecx
c010336f:	50                   	push   %eax
c0103370:	e8 17 39 00 00       	call   c0106c8c <Memcpy>
c0103375:	83 c4 10             	add    $0x10,%esp
c0103378:	8b 45 a0             	mov    -0x60(%ebp),%eax
c010337b:	c1 e0 09             	shl    $0x9,%eax
c010337e:	8b 15 84 17 11 c0    	mov    0xc0111784,%edx
c0103384:	83 ec 0c             	sub    $0xc,%esp
c0103387:	6a 0a                	push   $0xa
c0103389:	50                   	push   %eax
c010338a:	52                   	push   %edx
c010338b:	ff 75 90             	pushl  -0x70(%ebp)
c010338e:	ff 75 e0             	pushl  -0x20(%ebp)
c0103391:	e8 7e e4 ff ff       	call   c0101814 <rd_wt>
c0103396:	83 c4 20             	add    $0x20,%esp
c0103399:	8b 45 94             	mov    -0x6c(%ebp),%eax
c010339c:	29 45 e8             	sub    %eax,-0x18(%ebp)
c010339f:	8b 45 94             	mov    -0x6c(%ebp),%eax
c01033a2:	01 45 e4             	add    %eax,-0x1c(%ebp)
c01033a5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01033ac:	8b 45 a0             	mov    -0x60(%ebp),%eax
c01033af:	01 45 e0             	add    %eax,-0x20(%ebp)
c01033b2:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01033b5:	3b 45 a4             	cmp    -0x5c(%ebp),%eax
c01033b8:	7f 0a                	jg     c01033c4 <do_rdwt+0x343>
c01033ba:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c01033be:	0f 85 29 ff ff ff    	jne    c01032ed <do_rdwt+0x26c>
c01033c4:	8b 45 c0             	mov    -0x40(%ebp),%eax
c01033c7:	8b 50 04             	mov    0x4(%eax),%edx
c01033ca:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01033cd:	01 c2                	add    %eax,%edx
c01033cf:	8b 45 c0             	mov    -0x40(%ebp),%eax
c01033d2:	89 50 04             	mov    %edx,0x4(%eax)
c01033d5:	8b 55 ac             	mov    -0x54(%ebp),%edx
c01033d8:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01033db:	01 c2                	add    %eax,%edx
c01033dd:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c01033e3:	39 c2                	cmp    %eax,%edx
c01033e5:	7e 20                	jle    c0103407 <do_rdwt+0x386>
c01033e7:	8b 55 ac             	mov    -0x54(%ebp),%edx
c01033ea:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01033ed:	01 d0                	add    %edx,%eax
c01033ef:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c01033f5:	83 ec 0c             	sub    $0xc,%esp
c01033f8:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c01033fe:	50                   	push   %eax
c01033ff:	e8 08 00 00 00       	call   c010340c <sync_inode>
c0103404:	83 c4 10             	add    $0x10,%esp
c0103407:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010340a:	c9                   	leave  
c010340b:	c3                   	ret    

c010340c <sync_inode>:
c010340c:	55                   	push   %ebp
c010340d:	89 e5                	mov    %esp,%ebp
c010340f:	53                   	push   %ebx
c0103410:	83 ec 34             	sub    $0x34,%esp
c0103413:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010341a:	eb 74                	jmp    c0103490 <sync_inode+0x84>
c010341c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010341f:	89 d0                	mov    %edx,%eax
c0103421:	c1 e0 02             	shl    $0x2,%eax
c0103424:	01 d0                	add    %edx,%eax
c0103426:	c1 e0 03             	shl    $0x3,%eax
c0103429:	05 b0 17 11 c0       	add    $0xc01117b0,%eax
c010342e:	8b 10                	mov    (%eax),%edx
c0103430:	8b 45 08             	mov    0x8(%ebp),%eax
c0103433:	8b 40 10             	mov    0x10(%eax),%eax
c0103436:	39 c2                	cmp    %eax,%edx
c0103438:	75 52                	jne    c010348c <sync_inode+0x80>
c010343a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010343d:	89 d0                	mov    %edx,%eax
c010343f:	c1 e0 02             	shl    $0x2,%eax
c0103442:	01 d0                	add    %edx,%eax
c0103444:	c1 e0 03             	shl    $0x3,%eax
c0103447:	8d 90 a0 17 11 c0    	lea    -0x3feee860(%eax),%edx
c010344d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103450:	8b 08                	mov    (%eax),%ecx
c0103452:	89 0a                	mov    %ecx,(%edx)
c0103454:	8b 48 04             	mov    0x4(%eax),%ecx
c0103457:	89 4a 04             	mov    %ecx,0x4(%edx)
c010345a:	8b 48 08             	mov    0x8(%eax),%ecx
c010345d:	89 4a 08             	mov    %ecx,0x8(%edx)
c0103460:	8b 48 0c             	mov    0xc(%eax),%ecx
c0103463:	89 4a 0c             	mov    %ecx,0xc(%edx)
c0103466:	8b 48 10             	mov    0x10(%eax),%ecx
c0103469:	89 4a 10             	mov    %ecx,0x10(%edx)
c010346c:	8b 48 14             	mov    0x14(%eax),%ecx
c010346f:	89 4a 14             	mov    %ecx,0x14(%edx)
c0103472:	8b 48 18             	mov    0x18(%eax),%ecx
c0103475:	89 4a 18             	mov    %ecx,0x18(%edx)
c0103478:	8b 48 1c             	mov    0x1c(%eax),%ecx
c010347b:	89 4a 1c             	mov    %ecx,0x1c(%edx)
c010347e:	8b 48 20             	mov    0x20(%eax),%ecx
c0103481:	89 4a 20             	mov    %ecx,0x20(%edx)
c0103484:	8b 40 24             	mov    0x24(%eax),%eax
c0103487:	89 42 24             	mov    %eax,0x24(%edx)
c010348a:	eb 0a                	jmp    c0103496 <sync_inode+0x8a>
c010348c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0103490:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c0103494:	7e 86                	jle    c010341c <sync_inode+0x10>
c0103496:	c7 45 f0 20 00 00 00 	movl   $0x20,-0x10(%ebp)
c010349d:	8b 45 08             	mov    0x8(%ebp),%eax
c01034a0:	8b 40 10             	mov    0x10(%eax),%eax
c01034a3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01034a6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01034a9:	8d 48 ff             	lea    -0x1(%eax),%ecx
c01034ac:	b8 00 02 00 00       	mov    $0x200,%eax
c01034b1:	99                   	cltd   
c01034b2:	f7 7d f0             	idivl  -0x10(%ebp)
c01034b5:	89 c3                	mov    %eax,%ebx
c01034b7:	89 c8                	mov    %ecx,%eax
c01034b9:	99                   	cltd   
c01034ba:	f7 fb                	idiv   %ebx
c01034bc:	89 55 e8             	mov    %edx,-0x18(%ebp)
c01034bf:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01034c2:	8d 48 ff             	lea    -0x1(%eax),%ecx
c01034c5:	b8 00 02 00 00       	mov    $0x200,%eax
c01034ca:	99                   	cltd   
c01034cb:	f7 7d f0             	idivl  -0x10(%ebp)
c01034ce:	89 c3                	mov    %eax,%ebx
c01034d0:	89 c8                	mov    %ecx,%eax
c01034d2:	99                   	cltd   
c01034d3:	f7 fb                	idiv   %ebx
c01034d5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01034d8:	8b 45 08             	mov    0x8(%ebp),%eax
c01034db:	8b 40 20             	mov    0x20(%eax),%eax
c01034de:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01034e1:	e8 0a 01 00 00       	call   c01035f0 <get_super_block>
c01034e6:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01034e9:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01034ec:	8b 40 04             	mov    0x4(%eax),%eax
c01034ef:	8d 50 02             	lea    0x2(%eax),%edx
c01034f2:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01034f5:	8b 40 08             	mov    0x8(%eax),%eax
c01034f8:	01 c2                	add    %eax,%edx
c01034fa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01034fd:	01 d0                	add    %edx,%eax
c01034ff:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0103502:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0103507:	83 ec 0c             	sub    $0xc,%esp
c010350a:	6a 07                	push   $0x7
c010350c:	68 00 02 00 00       	push   $0x200
c0103511:	50                   	push   %eax
c0103512:	ff 75 e0             	pushl  -0x20(%ebp)
c0103515:	ff 75 d8             	pushl  -0x28(%ebp)
c0103518:	e8 f7 e2 ff ff       	call   c0101814 <rd_wt>
c010351d:	83 c4 20             	add    $0x20,%esp
c0103520:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0103525:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0103528:	83 ec 04             	sub    $0x4,%esp
c010352b:	ff 75 f0             	pushl  -0x10(%ebp)
c010352e:	ff 75 08             	pushl  0x8(%ebp)
c0103531:	ff 75 d4             	pushl  -0x2c(%ebp)
c0103534:	e8 53 37 00 00       	call   c0106c8c <Memcpy>
c0103539:	83 c4 10             	add    $0x10,%esp
c010353c:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0103541:	83 ec 0c             	sub    $0xc,%esp
c0103544:	6a 0a                	push   $0xa
c0103546:	68 00 02 00 00       	push   $0x200
c010354b:	50                   	push   %eax
c010354c:	ff 75 e0             	pushl  -0x20(%ebp)
c010354f:	ff 75 d8             	pushl  -0x28(%ebp)
c0103552:	e8 bd e2 ff ff       	call   c0101814 <rd_wt>
c0103557:	83 c4 20             	add    $0x20,%esp
c010355a:	90                   	nop
c010355b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c010355e:	c9                   	leave  
c010355f:	c3                   	ret    

c0103560 <put_inode>:
c0103560:	55                   	push   %ebp
c0103561:	89 e5                	mov    %esp,%ebp
c0103563:	83 ec 08             	sub    $0x8,%esp
c0103566:	8b 45 08             	mov    0x8(%ebp),%eax
c0103569:	8b 40 24             	mov    0x24(%eax),%eax
c010356c:	85 c0                	test   %eax,%eax
c010356e:	7f 1c                	jg     c010358c <put_inode+0x2c>
c0103570:	68 4d 05 00 00       	push   $0x54d
c0103575:	68 e4 b2 10 c0       	push   $0xc010b2e4
c010357a:	68 e4 b2 10 c0       	push   $0xc010b2e4
c010357f:	68 bc b4 10 c0       	push   $0xc010b4bc
c0103584:	e8 1c 53 00 00       	call   c01088a5 <assertion_failure>
c0103589:	83 c4 10             	add    $0x10,%esp
c010358c:	8b 45 08             	mov    0x8(%ebp),%eax
c010358f:	8b 40 24             	mov    0x24(%eax),%eax
c0103592:	8d 50 ff             	lea    -0x1(%eax),%edx
c0103595:	8b 45 08             	mov    0x8(%ebp),%eax
c0103598:	89 50 24             	mov    %edx,0x24(%eax)
c010359b:	90                   	nop
c010359c:	c9                   	leave  
c010359d:	c3                   	ret    

c010359e <do_close>:
c010359e:	55                   	push   %ebp
c010359f:	89 e5                	mov    %esp,%ebp
c01035a1:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c01035a6:	8b 55 08             	mov    0x8(%ebp),%edx
c01035a9:	83 c2 4c             	add    $0x4c,%edx
c01035ac:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c01035b0:	8b 50 0c             	mov    0xc(%eax),%edx
c01035b3:	83 ea 01             	sub    $0x1,%edx
c01035b6:	89 50 0c             	mov    %edx,0xc(%eax)
c01035b9:	8b 40 0c             	mov    0xc(%eax),%eax
c01035bc:	85 c0                	test   %eax,%eax
c01035be:	75 16                	jne    c01035d6 <do_close+0x38>
c01035c0:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c01035c5:	8b 55 08             	mov    0x8(%ebp),%edx
c01035c8:	83 c2 4c             	add    $0x4c,%edx
c01035cb:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c01035cf:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c01035d6:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c01035db:	8b 55 08             	mov    0x8(%ebp),%edx
c01035de:	83 c2 4c             	add    $0x4c,%edx
c01035e1:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
c01035e8:	00 
c01035e9:	b8 00 00 00 00       	mov    $0x0,%eax
c01035ee:	5d                   	pop    %ebp
c01035ef:	c3                   	ret    

c01035f0 <get_super_block>:
c01035f0:	55                   	push   %ebp
c01035f1:	89 e5                	mov    %esp,%ebp
c01035f3:	83 ec 08             	sub    $0x8,%esp
c01035f6:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01035fb:	83 ec 0c             	sub    $0xc,%esp
c01035fe:	6a 07                	push   $0x7
c0103600:	68 00 02 00 00       	push   $0x200
c0103605:	50                   	push   %eax
c0103606:	6a 20                	push   $0x20
c0103608:	6a 01                	push   $0x1
c010360a:	e8 05 e2 ff ff       	call   c0101814 <rd_wt>
c010360f:	83 c4 20             	add    $0x20,%esp
c0103612:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0103618:	a1 a0 21 11 c0       	mov    0xc01121a0,%eax
c010361d:	8b 0a                	mov    (%edx),%ecx
c010361f:	89 08                	mov    %ecx,(%eax)
c0103621:	8b 4a 04             	mov    0x4(%edx),%ecx
c0103624:	89 48 04             	mov    %ecx,0x4(%eax)
c0103627:	8b 4a 08             	mov    0x8(%edx),%ecx
c010362a:	89 48 08             	mov    %ecx,0x8(%eax)
c010362d:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0103630:	89 48 0c             	mov    %ecx,0xc(%eax)
c0103633:	8b 4a 10             	mov    0x10(%edx),%ecx
c0103636:	89 48 10             	mov    %ecx,0x10(%eax)
c0103639:	8b 4a 14             	mov    0x14(%edx),%ecx
c010363c:	89 48 14             	mov    %ecx,0x14(%eax)
c010363f:	8b 4a 18             	mov    0x18(%edx),%ecx
c0103642:	89 48 18             	mov    %ecx,0x18(%eax)
c0103645:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0103648:	89 48 1c             	mov    %ecx,0x1c(%eax)
c010364b:	8b 52 20             	mov    0x20(%edx),%edx
c010364e:	89 50 20             	mov    %edx,0x20(%eax)
c0103651:	a1 a0 21 11 c0       	mov    0xc01121a0,%eax
c0103656:	c9                   	leave  
c0103657:	c3                   	ret    

c0103658 <schedule_process>:
c0103658:	55                   	push   %ebp
c0103659:	89 e5                	mov    %esp,%ebp
c010365b:	83 ec 18             	sub    $0x18,%esp
c010365e:	c7 45 f4 00 00 40 00 	movl   $0x400000,-0xc(%ebp)
c0103665:	e8 82 cd ff ff       	call   c01003ec <get_running_thread_pcb>
c010366a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010366d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103670:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0103677:	84 c0                	test   %al,%al
c0103679:	75 35                	jne    c01036b0 <schedule_process+0x58>
c010367b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010367e:	8b 90 1c 01 00 00    	mov    0x11c(%eax),%edx
c0103684:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103687:	89 90 18 01 00 00    	mov    %edx,0x118(%eax)
c010368d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103690:	c6 80 3c 02 00 00 03 	movb   $0x3,0x23c(%eax)
c0103697:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010369a:	05 60 02 00 00       	add    $0x260,%eax
c010369f:	83 ec 08             	sub    $0x8,%esp
c01036a2:	50                   	push   %eax
c01036a3:	68 ec fd 10 c0       	push   $0xc010fdec
c01036a8:	e8 9a 6b 00 00       	call   c010a247 <insertToDoubleLinkList>
c01036ad:	83 c4 10             	add    $0x10,%esp
c01036b0:	83 ec 0c             	sub    $0xc,%esp
c01036b3:	68 ec fd 10 c0       	push   $0xc010fdec
c01036b8:	e8 a6 69 00 00       	call   c010a063 <isListEmpty>
c01036bd:	83 c4 10             	add    $0x10,%esp
c01036c0:	84 c0                	test   %al,%al
c01036c2:	74 19                	je     c01036dd <schedule_process+0x85>
c01036c4:	6a 1e                	push   $0x1e
c01036c6:	68 cb b4 10 c0       	push   $0xc010b4cb
c01036cb:	68 cb b4 10 c0       	push   $0xc010b4cb
c01036d0:	68 d5 b4 10 c0       	push   $0xc010b4d5
c01036d5:	e8 cb 51 00 00       	call   c01088a5 <assertion_failure>
c01036da:	83 c4 10             	add    $0x10,%esp
c01036dd:	83 ec 0c             	sub    $0xc,%esp
c01036e0:	68 ec fd 10 c0       	push   $0xc010fdec
c01036e5:	e8 e0 6b 00 00       	call   c010a2ca <popFromDoubleLinkList>
c01036ea:	83 c4 10             	add    $0x10,%esp
c01036ed:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01036f0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01036f3:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01036f8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01036fb:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01036fe:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0103705:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103708:	8b 50 08             	mov    0x8(%eax),%edx
c010370b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010370e:	39 c2                	cmp    %eax,%edx
c0103710:	74 28                	je     c010373a <schedule_process+0xe2>
c0103712:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103715:	05 00 10 00 00       	add    $0x1000,%eax
c010371a:	83 ec 0c             	sub    $0xc,%esp
c010371d:	50                   	push   %eax
c010371e:	e8 ba cc ff ff       	call   c01003dd <update_tss>
c0103723:	83 c4 10             	add    $0x10,%esp
c0103726:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103729:	8b 40 08             	mov    0x8(%eax),%eax
c010372c:	83 ec 0c             	sub    $0xc,%esp
c010372f:	50                   	push   %eax
c0103730:	e8 9b cc ff ff       	call   c01003d0 <update_cr3>
c0103735:	83 c4 10             	add    $0x10,%esp
c0103738:	eb 0f                	jmp    c0103749 <schedule_process+0xf1>
c010373a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010373d:	83 ec 0c             	sub    $0xc,%esp
c0103740:	50                   	push   %eax
c0103741:	e8 8a cc ff ff       	call   c01003d0 <update_cr3>
c0103746:	83 c4 10             	add    $0x10,%esp
c0103749:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010374c:	a3 c0 fb 10 c0       	mov    %eax,0xc010fbc0
c0103751:	83 ec 08             	sub    $0x8,%esp
c0103754:	ff 75 e8             	pushl  -0x18(%ebp)
c0103757:	ff 75 f0             	pushl  -0x10(%ebp)
c010375a:	e8 c1 68 00 00       	call   c010a020 <switch_to>
c010375f:	83 c4 10             	add    $0x10,%esp
c0103762:	90                   	nop
c0103763:	c9                   	leave  
c0103764:	c3                   	ret    

c0103765 <clock_handler>:
c0103765:	55                   	push   %ebp
c0103766:	89 e5                	mov    %esp,%ebp
c0103768:	83 ec 18             	sub    $0x18,%esp
c010376b:	e8 7c cc ff ff       	call   c01003ec <get_running_thread_pcb>
c0103770:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103773:	a1 c0 06 11 c0       	mov    0xc01106c0,%eax
c0103778:	85 c0                	test   %eax,%eax
c010377a:	74 0d                	je     c0103789 <clock_handler+0x24>
c010377c:	83 ec 0c             	sub    $0xc,%esp
c010377f:	6a 04                	push   $0x4
c0103781:	e8 29 60 00 00       	call   c01097af <inform_int>
c0103786:	83 c4 10             	add    $0x10,%esp
c0103789:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c010378e:	83 f8 64             	cmp    $0x64,%eax
c0103791:	75 0c                	jne    c010379f <clock_handler+0x3a>
c0103793:	c7 05 a8 f7 10 c0 01 	movl   $0x1,0xc010f7a8
c010379a:	00 00 00 
c010379d:	eb 0a                	jmp    c01037a9 <clock_handler+0x44>
c010379f:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c01037a4:	83 f8 01             	cmp    $0x1,%eax
c01037a7:	75 2a                	jne    c01037d3 <clock_handler+0x6e>
c01037a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01037ac:	8b 80 18 01 00 00    	mov    0x118(%eax),%eax
c01037b2:	85 c0                	test   %eax,%eax
c01037b4:	74 16                	je     c01037cc <clock_handler+0x67>
c01037b6:	a1 c0 fb 10 c0       	mov    0xc010fbc0,%eax
c01037bb:	8b 90 18 01 00 00    	mov    0x118(%eax),%edx
c01037c1:	83 ea 01             	sub    $0x1,%edx
c01037c4:	89 90 18 01 00 00    	mov    %edx,0x118(%eax)
c01037ca:	eb 08                	jmp    c01037d4 <clock_handler+0x6f>
c01037cc:	e8 87 fe ff ff       	call   c0103658 <schedule_process>
c01037d1:	eb 01                	jmp    c01037d4 <clock_handler+0x6f>
c01037d3:	90                   	nop
c01037d4:	c9                   	leave  
c01037d5:	c3                   	ret    

c01037d6 <pid2proc>:
c01037d6:	55                   	push   %ebp
c01037d7:	89 e5                	mov    %esp,%ebp
c01037d9:	83 ec 20             	sub    $0x20,%esp
c01037dc:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c01037e3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01037ea:	a1 04 0f 11 c0       	mov    0xc0110f04,%eax
c01037ef:	8b 15 08 0f 11 c0    	mov    0xc0110f08,%edx
c01037f5:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01037f8:	89 55 f0             	mov    %edx,-0x10(%ebp)
c01037fb:	a1 0c 0f 11 c0       	mov    0xc0110f0c,%eax
c0103800:	8b 15 10 0f 11 c0    	mov    0xc0110f10,%edx
c0103806:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0103809:	89 55 e8             	mov    %edx,-0x18(%ebp)
c010380c:	a1 08 0f 11 c0       	mov    0xc0110f08,%eax
c0103811:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103814:	eb 36                	jmp    c010384c <pid2proc+0x76>
c0103816:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103819:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010381e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103821:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0103825:	75 07                	jne    c010382e <pid2proc+0x58>
c0103827:	c7 45 f8 04 00 00 00 	movl   $0x4,-0x8(%ebp)
c010382e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103831:	8b 90 14 01 00 00    	mov    0x114(%eax),%edx
c0103837:	8b 45 08             	mov    0x8(%ebp),%eax
c010383a:	39 c2                	cmp    %eax,%edx
c010383c:	75 05                	jne    c0103843 <pid2proc+0x6d>
c010383e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103841:	eb 17                	jmp    c010385a <pid2proc+0x84>
c0103843:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103846:	8b 40 04             	mov    0x4(%eax),%eax
c0103849:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010384c:	81 7d fc 0c 0f 11 c0 	cmpl   $0xc0110f0c,-0x4(%ebp)
c0103853:	75 c1                	jne    c0103816 <pid2proc+0x40>
c0103855:	b8 00 00 00 00       	mov    $0x0,%eax
c010385a:	c9                   	leave  
c010385b:	c3                   	ret    

c010385c <proc2pid>:
c010385c:	55                   	push   %ebp
c010385d:	89 e5                	mov    %esp,%ebp
c010385f:	83 ec 10             	sub    $0x10,%esp
c0103862:	8b 45 08             	mov    0x8(%ebp),%eax
c0103865:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c010386b:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010386e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103871:	c9                   	leave  
c0103872:	c3                   	ret    

c0103873 <InitDescriptor>:
c0103873:	55                   	push   %ebp
c0103874:	89 e5                	mov    %esp,%ebp
c0103876:	83 ec 04             	sub    $0x4,%esp
c0103879:	8b 45 14             	mov    0x14(%ebp),%eax
c010387c:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
c0103880:	8b 45 10             	mov    0x10(%ebp),%eax
c0103883:	89 c2                	mov    %eax,%edx
c0103885:	8b 45 08             	mov    0x8(%ebp),%eax
c0103888:	66 89 10             	mov    %dx,(%eax)
c010388b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010388e:	89 c2                	mov    %eax,%edx
c0103890:	8b 45 08             	mov    0x8(%ebp),%eax
c0103893:	66 89 50 02          	mov    %dx,0x2(%eax)
c0103897:	8b 45 0c             	mov    0xc(%ebp),%eax
c010389a:	c1 e8 10             	shr    $0x10,%eax
c010389d:	89 c2                	mov    %eax,%edx
c010389f:	8b 45 08             	mov    0x8(%ebp),%eax
c01038a2:	88 50 04             	mov    %dl,0x4(%eax)
c01038a5:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c01038a9:	89 c2                	mov    %eax,%edx
c01038ab:	8b 45 08             	mov    0x8(%ebp),%eax
c01038ae:	88 50 05             	mov    %dl,0x5(%eax)
c01038b1:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c01038b5:	66 c1 e8 08          	shr    $0x8,%ax
c01038b9:	c1 e0 04             	shl    $0x4,%eax
c01038bc:	89 c2                	mov    %eax,%edx
c01038be:	8b 45 10             	mov    0x10(%ebp),%eax
c01038c1:	c1 e8 10             	shr    $0x10,%eax
c01038c4:	83 e0 0f             	and    $0xf,%eax
c01038c7:	09 c2                	or     %eax,%edx
c01038c9:	8b 45 08             	mov    0x8(%ebp),%eax
c01038cc:	88 50 06             	mov    %dl,0x6(%eax)
c01038cf:	8b 45 0c             	mov    0xc(%ebp),%eax
c01038d2:	c1 e8 18             	shr    $0x18,%eax
c01038d5:	89 c2                	mov    %eax,%edx
c01038d7:	8b 45 08             	mov    0x8(%ebp),%eax
c01038da:	88 50 07             	mov    %dl,0x7(%eax)
c01038dd:	90                   	nop
c01038de:	c9                   	leave  
c01038df:	c3                   	ret    

c01038e0 <Seg2PhyAddr>:
c01038e0:	55                   	push   %ebp
c01038e1:	89 e5                	mov    %esp,%ebp
c01038e3:	83 ec 10             	sub    $0x10,%esp
c01038e6:	8b 45 08             	mov    0x8(%ebp),%eax
c01038e9:	c1 e8 03             	shr    $0x3,%eax
c01038ec:	8b 14 c5 c4 f7 10 c0 	mov    -0x3fef083c(,%eax,8),%edx
c01038f3:	8b 04 c5 c0 f7 10 c0 	mov    -0x3fef0840(,%eax,8),%eax
c01038fa:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01038fd:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0103900:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0103904:	0f b7 c0             	movzwl %ax,%eax
c0103907:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c010390b:	0f b6 d2             	movzbl %dl,%edx
c010390e:	c1 e2 10             	shl    $0x10,%edx
c0103911:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c0103917:	09 d0                	or     %edx,%eax
c0103919:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010391c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010391f:	c9                   	leave  
c0103920:	c3                   	ret    

c0103921 <Seg2PhyAddrLDT>:
c0103921:	55                   	push   %ebp
c0103922:	89 e5                	mov    %esp,%ebp
c0103924:	83 ec 10             	sub    $0x10,%esp
c0103927:	8b 45 08             	mov    0x8(%ebp),%eax
c010392a:	c1 e8 03             	shr    $0x3,%eax
c010392d:	89 c2                	mov    %eax,%edx
c010392f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103932:	83 c2 20             	add    $0x20,%edx
c0103935:	8d 54 d0 02          	lea    0x2(%eax,%edx,8),%edx
c0103939:	8b 02                	mov    (%edx),%eax
c010393b:	8b 52 04             	mov    0x4(%edx),%edx
c010393e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103941:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0103944:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0103948:	0f b7 c0             	movzwl %ax,%eax
c010394b:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c010394f:	0f b6 d2             	movzbl %dl,%edx
c0103952:	c1 e2 10             	shl    $0x10,%edx
c0103955:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c010395b:	09 d0                	or     %edx,%eax
c010395d:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103960:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103963:	c9                   	leave  
c0103964:	c3                   	ret    

c0103965 <VirAddr2PhyAddr>:
c0103965:	55                   	push   %ebp
c0103966:	89 e5                	mov    %esp,%ebp
c0103968:	83 ec 10             	sub    $0x10,%esp
c010396b:	8b 55 0c             	mov    0xc(%ebp),%edx
c010396e:	8b 45 08             	mov    0x8(%ebp),%eax
c0103971:	01 d0                	add    %edx,%eax
c0103973:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103976:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103979:	c9                   	leave  
c010397a:	c3                   	ret    

c010397b <v2l>:
c010397b:	55                   	push   %ebp
c010397c:	89 e5                	mov    %esp,%ebp
c010397e:	83 ec 18             	sub    $0x18,%esp
c0103981:	83 ec 0c             	sub    $0xc,%esp
c0103984:	ff 75 08             	pushl  0x8(%ebp)
c0103987:	e8 4a fe ff ff       	call   c01037d6 <pid2proc>
c010398c:	83 c4 10             	add    $0x10,%esp
c010398f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103992:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0103999:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010399c:	83 ec 08             	sub    $0x8,%esp
c010399f:	ff 75 f4             	pushl  -0xc(%ebp)
c01039a2:	50                   	push   %eax
c01039a3:	e8 79 ff ff ff       	call   c0103921 <Seg2PhyAddrLDT>
c01039a8:	83 c4 10             	add    $0x10,%esp
c01039ab:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01039ae:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01039b1:	8b 45 0c             	mov    0xc(%ebp),%eax
c01039b4:	01 d0                	add    %edx,%eax
c01039b6:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01039b9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01039bc:	c9                   	leave  
c01039bd:	c3                   	ret    

c01039be <init_propt>:
c01039be:	55                   	push   %ebp
c01039bf:	89 e5                	mov    %esp,%ebp
c01039c1:	83 ec 38             	sub    $0x38,%esp
c01039c4:	6a 0e                	push   $0xe
c01039c6:	6a 08                	push   $0x8
c01039c8:	68 71 01 10 c0       	push   $0xc0100171
c01039cd:	6a 20                	push   $0x20
c01039cf:	e8 6b 01 00 00       	call   c0103b3f <InitInterruptDesc>
c01039d4:	83 c4 10             	add    $0x10,%esp
c01039d7:	6a 0e                	push   $0xe
c01039d9:	6a 08                	push   $0x8
c01039db:	68 9f 01 10 c0       	push   $0xc010019f
c01039e0:	6a 21                	push   $0x21
c01039e2:	e8 58 01 00 00       	call   c0103b3f <InitInterruptDesc>
c01039e7:	83 c4 10             	add    $0x10,%esp
c01039ea:	6a 0e                	push   $0xe
c01039ec:	6a 08                	push   $0x8
c01039ee:	68 e2 01 10 c0       	push   $0xc01001e2
c01039f3:	6a 2e                	push   $0x2e
c01039f5:	e8 45 01 00 00       	call   c0103b3f <InitInterruptDesc>
c01039fa:	83 c4 10             	add    $0x10,%esp
c01039fd:	6a 0e                	push   $0xe
c01039ff:	6a 08                	push   $0x8
c0103a01:	68 28 02 10 c0       	push   $0xc0100228
c0103a06:	6a 2a                	push   $0x2a
c0103a08:	e8 32 01 00 00       	call   c0103b3f <InitInterruptDesc>
c0103a0d:	83 c4 10             	add    $0x10,%esp
c0103a10:	83 ec 04             	sub    $0x4,%esp
c0103a13:	68 e0 15 00 00       	push   $0x15e0
c0103a18:	6a 00                	push   $0x0
c0103a1a:	68 00 22 18 c0       	push   $0xc0182200
c0103a1f:	e8 ab 87 00 00       	call   c010c1cf <Memset>
c0103a24:	83 c4 10             	add    $0x10,%esp
c0103a27:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c0103a2e:	83 ec 04             	sub    $0x4,%esp
c0103a31:	ff 75 f4             	pushl  -0xc(%ebp)
c0103a34:	6a 00                	push   $0x0
c0103a36:	68 40 06 11 c0       	push   $0xc0110640
c0103a3b:	e8 8f 87 00 00       	call   c010c1cf <Memset>
c0103a40:	83 c4 10             	add    $0x10,%esp
c0103a43:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103a46:	a3 a8 06 11 c0       	mov    %eax,0xc01106a8
c0103a4b:	c7 05 48 06 11 c0 30 	movl   $0x30,0xc0110648
c0103a52:	00 00 00 
c0103a55:	83 ec 0c             	sub    $0xc,%esp
c0103a58:	6a 30                	push   $0x30
c0103a5a:	e8 81 fe ff ff       	call   c01038e0 <Seg2PhyAddr>
c0103a5f:	83 c4 10             	add    $0x10,%esp
c0103a62:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103a65:	c7 45 ec 40 06 11 c0 	movl   $0xc0110640,-0x14(%ebp)
c0103a6c:	c7 45 e8 89 00 00 00 	movl   $0x89,-0x18(%ebp)
c0103a73:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103a76:	0f b7 d0             	movzwl %ax,%edx
c0103a79:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103a7c:	83 e8 01             	sub    $0x1,%eax
c0103a7f:	89 c1                	mov    %eax,%ecx
c0103a81:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103a84:	52                   	push   %edx
c0103a85:	51                   	push   %ecx
c0103a86:	50                   	push   %eax
c0103a87:	68 00 f8 10 c0       	push   $0xc010f800
c0103a8c:	e8 e2 fd ff ff       	call   c0103873 <InitDescriptor>
c0103a91:	83 c4 10             	add    $0x10,%esp
c0103a94:	c7 45 e4 00 80 0b c0 	movl   $0xc00b8000,-0x1c(%ebp)
c0103a9b:	68 f2 00 00 00       	push   $0xf2
c0103aa0:	68 ff ff 00 00       	push   $0xffff
c0103aa5:	ff 75 e4             	pushl  -0x1c(%ebp)
c0103aa8:	68 f8 f7 10 c0       	push   $0xc010f7f8
c0103aad:	e8 c1 fd ff ff       	call   c0103873 <InitDescriptor>
c0103ab2:	83 c4 10             	add    $0x10,%esp
c0103ab5:	c7 45 e0 b2 0c 00 00 	movl   $0xcb2,-0x20(%ebp)
c0103abc:	c7 45 dc 9a 0c 00 00 	movl   $0xc9a,-0x24(%ebp)
c0103ac3:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%ebp)
c0103aca:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0103acd:	0f b7 c0             	movzwl %ax,%eax
c0103ad0:	50                   	push   %eax
c0103ad1:	ff 75 d8             	pushl  -0x28(%ebp)
c0103ad4:	6a 00                	push   $0x0
c0103ad6:	68 08 f8 10 c0       	push   $0xc010f808
c0103adb:	e8 93 fd ff ff       	call   c0103873 <InitDescriptor>
c0103ae0:	83 c4 10             	add    $0x10,%esp
c0103ae3:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0103ae6:	0f b7 c0             	movzwl %ax,%eax
c0103ae9:	50                   	push   %eax
c0103aea:	ff 75 d8             	pushl  -0x28(%ebp)
c0103aed:	6a 00                	push   $0x0
c0103aef:	68 10 f8 10 c0       	push   $0xc010f810
c0103af4:	e8 7a fd ff ff       	call   c0103873 <InitDescriptor>
c0103af9:	83 c4 10             	add    $0x10,%esp
c0103afc:	c7 45 d4 b2 0c 00 00 	movl   $0xcb2,-0x2c(%ebp)
c0103b03:	c7 45 d0 ba 0c 00 00 	movl   $0xcba,-0x30(%ebp)
c0103b0a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0103b0d:	0f b7 c0             	movzwl %ax,%eax
c0103b10:	50                   	push   %eax
c0103b11:	ff 75 d8             	pushl  -0x28(%ebp)
c0103b14:	6a 00                	push   $0x0
c0103b16:	68 18 f8 10 c0       	push   $0xc010f818
c0103b1b:	e8 53 fd ff ff       	call   c0103873 <InitDescriptor>
c0103b20:	83 c4 10             	add    $0x10,%esp
c0103b23:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0103b26:	0f b7 c0             	movzwl %ax,%eax
c0103b29:	50                   	push   %eax
c0103b2a:	ff 75 d8             	pushl  -0x28(%ebp)
c0103b2d:	6a 00                	push   $0x0
c0103b2f:	68 20 f8 10 c0       	push   $0xc010f820
c0103b34:	e8 3a fd ff ff       	call   c0103873 <InitDescriptor>
c0103b39:	83 c4 10             	add    $0x10,%esp
c0103b3c:	90                   	nop
c0103b3d:	c9                   	leave  
c0103b3e:	c3                   	ret    

c0103b3f <InitInterruptDesc>:
c0103b3f:	55                   	push   %ebp
c0103b40:	89 e5                	mov    %esp,%ebp
c0103b42:	83 ec 10             	sub    $0x10,%esp
c0103b45:	8b 45 08             	mov    0x8(%ebp),%eax
c0103b48:	c1 e0 03             	shl    $0x3,%eax
c0103b4b:	05 e0 06 11 c0       	add    $0xc01106e0,%eax
c0103b50:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103b53:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103b56:	c6 40 04 00          	movb   $0x0,0x4(%eax)
c0103b5a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103b5d:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0103b60:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0103b63:	89 c2                	mov    %eax,%edx
c0103b65:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103b68:	66 89 10             	mov    %dx,(%eax)
c0103b6b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103b6e:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
c0103b74:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0103b77:	c1 f8 10             	sar    $0x10,%eax
c0103b7a:	89 c2                	mov    %eax,%edx
c0103b7c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103b7f:	66 89 50 06          	mov    %dx,0x6(%eax)
c0103b83:	8b 45 10             	mov    0x10(%ebp),%eax
c0103b86:	c1 e0 04             	shl    $0x4,%eax
c0103b89:	89 c2                	mov    %eax,%edx
c0103b8b:	8b 45 14             	mov    0x14(%ebp),%eax
c0103b8e:	09 d0                	or     %edx,%eax
c0103b90:	89 c2                	mov    %eax,%edx
c0103b92:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103b95:	88 50 05             	mov    %dl,0x5(%eax)
c0103b98:	90                   	nop
c0103b99:	c9                   	leave  
c0103b9a:	c3                   	ret    

c0103b9b <ReloadGDT>:
c0103b9b:	55                   	push   %ebp
c0103b9c:	89 e5                	mov    %esp,%ebp
c0103b9e:	83 ec 28             	sub    $0x28,%esp
c0103ba1:	b8 d0 06 11 c0       	mov    $0xc01106d0,%eax
c0103ba6:	0f b7 00             	movzwl (%eax),%eax
c0103ba9:	98                   	cwtl   
c0103baa:	ba d2 06 11 c0       	mov    $0xc01106d2,%edx
c0103baf:	8b 12                	mov    (%edx),%edx
c0103bb1:	83 ec 04             	sub    $0x4,%esp
c0103bb4:	50                   	push   %eax
c0103bb5:	52                   	push   %edx
c0103bb6:	68 c0 f7 10 c0       	push   $0xc010f7c0
c0103bbb:	e8 e1 85 00 00       	call   c010c1a1 <Memcpy2>
c0103bc0:	83 c4 10             	add    $0x10,%esp
c0103bc3:	c7 45 f0 d0 06 11 c0 	movl   $0xc01106d0,-0x10(%ebp)
c0103bca:	c7 45 ec d2 06 11 c0 	movl   $0xc01106d2,-0x14(%ebp)
c0103bd1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103bd4:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
c0103bd9:	ba c0 f7 10 c0       	mov    $0xc010f7c0,%edx
c0103bde:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103be1:	89 10                	mov    %edx,(%eax)
c0103be3:	c7 45 e8 88 f7 10 c0 	movl   $0xc010f788,-0x18(%ebp)
c0103bea:	c7 45 e4 8a f7 10 c0 	movl   $0xc010f78a,-0x1c(%ebp)
c0103bf1:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103bf4:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
c0103bf9:	ba e0 06 11 c0       	mov    $0xc01106e0,%edx
c0103bfe:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0103c01:	89 10                	mov    %edx,(%eax)
c0103c03:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0103c0a:	eb 04                	jmp    c0103c10 <ReloadGDT+0x75>
c0103c0c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0103c10:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c0103c17:	7e f3                	jle    c0103c0c <ReloadGDT+0x71>
c0103c19:	e8 a9 37 00 00       	call   c01073c7 <init_internal_interrupt>
c0103c1e:	e8 9b fd ff ff       	call   c01039be <init_propt>
c0103c23:	90                   	nop
c0103c24:	c9                   	leave  
c0103c25:	c3                   	ret    

c0103c26 <select_console>:
c0103c26:	55                   	push   %ebp
c0103c27:	89 e5                	mov    %esp,%ebp
c0103c29:	83 ec 18             	sub    $0x18,%esp
c0103c2c:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c2f:	88 45 f4             	mov    %al,-0xc(%ebp)
c0103c32:	80 7d f4 00          	cmpb   $0x0,-0xc(%ebp)
c0103c36:	75 27                	jne    c0103c5f <select_console+0x39>
c0103c38:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
c0103c3c:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0103c42:	05 00 fe 10 c0       	add    $0xc010fe00,%eax
c0103c47:	a3 80 f7 10 c0       	mov    %eax,0xc010f780
c0103c4c:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c0103c51:	83 ec 0c             	sub    $0xc,%esp
c0103c54:	50                   	push   %eax
c0103c55:	e8 08 00 00 00       	call   c0103c62 <flush>
c0103c5a:	83 c4 10             	add    $0x10,%esp
c0103c5d:	eb 01                	jmp    c0103c60 <select_console+0x3a>
c0103c5f:	90                   	nop
c0103c60:	c9                   	leave  
c0103c61:	c3                   	ret    

c0103c62 <flush>:
c0103c62:	55                   	push   %ebp
c0103c63:	89 e5                	mov    %esp,%ebp
c0103c65:	83 ec 08             	sub    $0x8,%esp
c0103c68:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c6b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103c71:	8b 40 0c             	mov    0xc(%eax),%eax
c0103c74:	83 ec 0c             	sub    $0xc,%esp
c0103c77:	50                   	push   %eax
c0103c78:	e8 1e 00 00 00       	call   c0103c9b <set_cursor>
c0103c7d:	83 c4 10             	add    $0x10,%esp
c0103c80:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c83:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103c89:	8b 40 08             	mov    0x8(%eax),%eax
c0103c8c:	83 ec 0c             	sub    $0xc,%esp
c0103c8f:	50                   	push   %eax
c0103c90:	e8 64 00 00 00       	call   c0103cf9 <set_console_start_video_addr>
c0103c95:	83 c4 10             	add    $0x10,%esp
c0103c98:	90                   	nop
c0103c99:	c9                   	leave  
c0103c9a:	c3                   	ret    

c0103c9b <set_cursor>:
c0103c9b:	55                   	push   %ebp
c0103c9c:	89 e5                	mov    %esp,%ebp
c0103c9e:	83 ec 08             	sub    $0x8,%esp
c0103ca1:	83 ec 08             	sub    $0x8,%esp
c0103ca4:	6a 0e                	push   $0xe
c0103ca6:	68 d4 03 00 00       	push   $0x3d4
c0103cab:	e8 3e c6 ff ff       	call   c01002ee <out_byte>
c0103cb0:	83 c4 10             	add    $0x10,%esp
c0103cb3:	8b 45 08             	mov    0x8(%ebp),%eax
c0103cb6:	c1 e8 08             	shr    $0x8,%eax
c0103cb9:	0f b7 c0             	movzwl %ax,%eax
c0103cbc:	83 ec 08             	sub    $0x8,%esp
c0103cbf:	50                   	push   %eax
c0103cc0:	68 d5 03 00 00       	push   $0x3d5
c0103cc5:	e8 24 c6 ff ff       	call   c01002ee <out_byte>
c0103cca:	83 c4 10             	add    $0x10,%esp
c0103ccd:	83 ec 08             	sub    $0x8,%esp
c0103cd0:	6a 0f                	push   $0xf
c0103cd2:	68 d4 03 00 00       	push   $0x3d4
c0103cd7:	e8 12 c6 ff ff       	call   c01002ee <out_byte>
c0103cdc:	83 c4 10             	add    $0x10,%esp
c0103cdf:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ce2:	0f b7 c0             	movzwl %ax,%eax
c0103ce5:	83 ec 08             	sub    $0x8,%esp
c0103ce8:	50                   	push   %eax
c0103ce9:	68 d5 03 00 00       	push   $0x3d5
c0103cee:	e8 fb c5 ff ff       	call   c01002ee <out_byte>
c0103cf3:	83 c4 10             	add    $0x10,%esp
c0103cf6:	90                   	nop
c0103cf7:	c9                   	leave  
c0103cf8:	c3                   	ret    

c0103cf9 <set_console_start_video_addr>:
c0103cf9:	55                   	push   %ebp
c0103cfa:	89 e5                	mov    %esp,%ebp
c0103cfc:	83 ec 08             	sub    $0x8,%esp
c0103cff:	83 ec 08             	sub    $0x8,%esp
c0103d02:	6a 0c                	push   $0xc
c0103d04:	68 d4 03 00 00       	push   $0x3d4
c0103d09:	e8 e0 c5 ff ff       	call   c01002ee <out_byte>
c0103d0e:	83 c4 10             	add    $0x10,%esp
c0103d11:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d14:	c1 e8 08             	shr    $0x8,%eax
c0103d17:	0f b7 c0             	movzwl %ax,%eax
c0103d1a:	83 ec 08             	sub    $0x8,%esp
c0103d1d:	50                   	push   %eax
c0103d1e:	68 d5 03 00 00       	push   $0x3d5
c0103d23:	e8 c6 c5 ff ff       	call   c01002ee <out_byte>
c0103d28:	83 c4 10             	add    $0x10,%esp
c0103d2b:	83 ec 08             	sub    $0x8,%esp
c0103d2e:	6a 0d                	push   $0xd
c0103d30:	68 d4 03 00 00       	push   $0x3d4
c0103d35:	e8 b4 c5 ff ff       	call   c01002ee <out_byte>
c0103d3a:	83 c4 10             	add    $0x10,%esp
c0103d3d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d40:	0f b7 c0             	movzwl %ax,%eax
c0103d43:	83 ec 08             	sub    $0x8,%esp
c0103d46:	50                   	push   %eax
c0103d47:	68 d5 03 00 00       	push   $0x3d5
c0103d4c:	e8 9d c5 ff ff       	call   c01002ee <out_byte>
c0103d51:	83 c4 10             	add    $0x10,%esp
c0103d54:	90                   	nop
c0103d55:	c9                   	leave  
c0103d56:	c3                   	ret    

c0103d57 <put_key>:
c0103d57:	55                   	push   %ebp
c0103d58:	89 e5                	mov    %esp,%ebp
c0103d5a:	83 ec 04             	sub    $0x4,%esp
c0103d5d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103d60:	88 45 fc             	mov    %al,-0x4(%ebp)
c0103d63:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d66:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0103d6c:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c0103d71:	77 4d                	ja     c0103dc0 <put_key+0x69>
c0103d73:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d76:	8b 00                	mov    (%eax),%eax
c0103d78:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
c0103d7c:	89 10                	mov    %edx,(%eax)
c0103d7e:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d81:	8b 00                	mov    (%eax),%eax
c0103d83:	8d 50 04             	lea    0x4(%eax),%edx
c0103d86:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d89:	89 10                	mov    %edx,(%eax)
c0103d8b:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d8e:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0103d94:	8d 50 01             	lea    0x1(%eax),%edx
c0103d97:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d9a:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0103da0:	8b 45 08             	mov    0x8(%ebp),%eax
c0103da3:	8b 00                	mov    (%eax),%eax
c0103da5:	8b 55 08             	mov    0x8(%ebp),%edx
c0103da8:	83 c2 08             	add    $0x8,%edx
c0103dab:	81 c2 00 08 00 00    	add    $0x800,%edx
c0103db1:	39 d0                	cmp    %edx,%eax
c0103db3:	75 0b                	jne    c0103dc0 <put_key+0x69>
c0103db5:	8b 45 08             	mov    0x8(%ebp),%eax
c0103db8:	8d 50 08             	lea    0x8(%eax),%edx
c0103dbb:	8b 45 08             	mov    0x8(%ebp),%eax
c0103dbe:	89 10                	mov    %edx,(%eax)
c0103dc0:	90                   	nop
c0103dc1:	c9                   	leave  
c0103dc2:	c3                   	ret    

c0103dc3 <scroll_up>:
c0103dc3:	55                   	push   %ebp
c0103dc4:	89 e5                	mov    %esp,%ebp
c0103dc6:	83 ec 08             	sub    $0x8,%esp
c0103dc9:	8b 45 08             	mov    0x8(%ebp),%eax
c0103dcc:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103dd2:	8b 40 08             	mov    0x8(%eax),%eax
c0103dd5:	8d 50 b0             	lea    -0x50(%eax),%edx
c0103dd8:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ddb:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103de1:	8b 00                	mov    (%eax),%eax
c0103de3:	39 c2                	cmp    %eax,%edx
c0103de5:	76 1b                	jbe    c0103e02 <scroll_up+0x3f>
c0103de7:	8b 45 08             	mov    0x8(%ebp),%eax
c0103dea:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103df0:	8b 40 08             	mov    0x8(%eax),%eax
c0103df3:	83 e8 50             	sub    $0x50,%eax
c0103df6:	83 ec 0c             	sub    $0xc,%esp
c0103df9:	50                   	push   %eax
c0103dfa:	e8 fa fe ff ff       	call   c0103cf9 <set_console_start_video_addr>
c0103dff:	83 c4 10             	add    $0x10,%esp
c0103e02:	90                   	nop
c0103e03:	c9                   	leave  
c0103e04:	c3                   	ret    

c0103e05 <scroll_down>:
c0103e05:	55                   	push   %ebp
c0103e06:	89 e5                	mov    %esp,%ebp
c0103e08:	83 ec 08             	sub    $0x8,%esp
c0103e0b:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e0e:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e14:	8b 40 08             	mov    0x8(%eax),%eax
c0103e17:	8d 48 50             	lea    0x50(%eax),%ecx
c0103e1a:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e1d:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e23:	8b 10                	mov    (%eax),%edx
c0103e25:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e28:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e2e:	8b 40 04             	mov    0x4(%eax),%eax
c0103e31:	01 d0                	add    %edx,%eax
c0103e33:	39 c1                	cmp    %eax,%ecx
c0103e35:	73 36                	jae    c0103e6d <scroll_down+0x68>
c0103e37:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e3a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e40:	8b 40 08             	mov    0x8(%eax),%eax
c0103e43:	83 c0 50             	add    $0x50,%eax
c0103e46:	83 ec 0c             	sub    $0xc,%esp
c0103e49:	50                   	push   %eax
c0103e4a:	e8 aa fe ff ff       	call   c0103cf9 <set_console_start_video_addr>
c0103e4f:	83 c4 10             	add    $0x10,%esp
c0103e52:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e55:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e5b:	8b 50 08             	mov    0x8(%eax),%edx
c0103e5e:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e61:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e67:	83 c2 50             	add    $0x50,%edx
c0103e6a:	89 50 08             	mov    %edx,0x8(%eax)
c0103e6d:	90                   	nop
c0103e6e:	c9                   	leave  
c0103e6f:	c3                   	ret    

c0103e70 <out_char>:
c0103e70:	55                   	push   %ebp
c0103e71:	89 e5                	mov    %esp,%ebp
c0103e73:	83 ec 28             	sub    $0x28,%esp
c0103e76:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103e79:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0103e7c:	e8 a7 2d 00 00       	call   c0106c28 <intr_disable>
c0103e81:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103e84:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e87:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e8d:	8b 40 0c             	mov    0xc(%eax),%eax
c0103e90:	05 00 c0 05 60       	add    $0x6005c000,%eax
c0103e95:	01 c0                	add    %eax,%eax
c0103e97:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103e9a:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
c0103e9e:	83 f8 08             	cmp    $0x8,%eax
c0103ea1:	0f 84 8d 00 00 00    	je     c0103f34 <out_char+0xc4>
c0103ea7:	83 f8 0a             	cmp    $0xa,%eax
c0103eaa:	0f 85 c9 00 00 00    	jne    c0103f79 <out_char+0x109>
c0103eb0:	8b 45 08             	mov    0x8(%ebp),%eax
c0103eb3:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103eb9:	8b 50 0c             	mov    0xc(%eax),%edx
c0103ebc:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ebf:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103ec5:	8b 08                	mov    (%eax),%ecx
c0103ec7:	8b 45 08             	mov    0x8(%ebp),%eax
c0103eca:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103ed0:	8b 40 04             	mov    0x4(%eax),%eax
c0103ed3:	01 c8                	add    %ecx,%eax
c0103ed5:	83 e8 50             	sub    $0x50,%eax
c0103ed8:	39 c2                	cmp    %eax,%edx
c0103eda:	0f 83 f4 00 00 00    	jae    c0103fd4 <out_char+0x164>
c0103ee0:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ee3:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103ee9:	8b 08                	mov    (%eax),%ecx
c0103eeb:	8b 45 08             	mov    0x8(%ebp),%eax
c0103eee:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103ef4:	8b 50 0c             	mov    0xc(%eax),%edx
c0103ef7:	8b 45 08             	mov    0x8(%ebp),%eax
c0103efa:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f00:	8b 00                	mov    (%eax),%eax
c0103f02:	29 c2                	sub    %eax,%edx
c0103f04:	89 d0                	mov    %edx,%eax
c0103f06:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
c0103f0b:	f7 e2                	mul    %edx
c0103f0d:	89 d0                	mov    %edx,%eax
c0103f0f:	c1 e8 06             	shr    $0x6,%eax
c0103f12:	8d 50 01             	lea    0x1(%eax),%edx
c0103f15:	89 d0                	mov    %edx,%eax
c0103f17:	c1 e0 02             	shl    $0x2,%eax
c0103f1a:	01 d0                	add    %edx,%eax
c0103f1c:	c1 e0 04             	shl    $0x4,%eax
c0103f1f:	89 c2                	mov    %eax,%edx
c0103f21:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f24:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f2a:	01 ca                	add    %ecx,%edx
c0103f2c:	89 50 0c             	mov    %edx,0xc(%eax)
c0103f2f:	e9 a0 00 00 00       	jmp    c0103fd4 <out_char+0x164>
c0103f34:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f37:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f3d:	8b 50 0c             	mov    0xc(%eax),%edx
c0103f40:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f43:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f49:	8b 00                	mov    (%eax),%eax
c0103f4b:	39 c2                	cmp    %eax,%edx
c0103f4d:	0f 86 84 00 00 00    	jbe    c0103fd7 <out_char+0x167>
c0103f53:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f56:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f5c:	8b 50 0c             	mov    0xc(%eax),%edx
c0103f5f:	83 ea 01             	sub    $0x1,%edx
c0103f62:	89 50 0c             	mov    %edx,0xc(%eax)
c0103f65:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103f68:	83 e8 02             	sub    $0x2,%eax
c0103f6b:	c6 00 20             	movb   $0x20,(%eax)
c0103f6e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103f71:	83 e8 01             	sub    $0x1,%eax
c0103f74:	c6 00 00             	movb   $0x0,(%eax)
c0103f77:	eb 5e                	jmp    c0103fd7 <out_char+0x167>
c0103f79:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f7c:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f82:	8b 40 0c             	mov    0xc(%eax),%eax
c0103f85:	8d 48 01             	lea    0x1(%eax),%ecx
c0103f88:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f8b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f91:	8b 10                	mov    (%eax),%edx
c0103f93:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f96:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f9c:	8b 40 04             	mov    0x4(%eax),%eax
c0103f9f:	01 d0                	add    %edx,%eax
c0103fa1:	39 c1                	cmp    %eax,%ecx
c0103fa3:	73 35                	jae    c0103fda <out_char+0x16a>
c0103fa5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103fa8:	8d 50 01             	lea    0x1(%eax),%edx
c0103fab:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0103fae:	0f b6 55 e4          	movzbl -0x1c(%ebp),%edx
c0103fb2:	88 10                	mov    %dl,(%eax)
c0103fb4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103fb7:	8d 50 01             	lea    0x1(%eax),%edx
c0103fba:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0103fbd:	c6 00 0a             	movb   $0xa,(%eax)
c0103fc0:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fc3:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103fc9:	8b 50 0c             	mov    0xc(%eax),%edx
c0103fcc:	83 c2 01             	add    $0x1,%edx
c0103fcf:	89 50 0c             	mov    %edx,0xc(%eax)
c0103fd2:	eb 06                	jmp    c0103fda <out_char+0x16a>
c0103fd4:	90                   	nop
c0103fd5:	eb 14                	jmp    c0103feb <out_char+0x17b>
c0103fd7:	90                   	nop
c0103fd8:	eb 11                	jmp    c0103feb <out_char+0x17b>
c0103fda:	90                   	nop
c0103fdb:	eb 0e                	jmp    c0103feb <out_char+0x17b>
c0103fdd:	83 ec 0c             	sub    $0xc,%esp
c0103fe0:	ff 75 08             	pushl  0x8(%ebp)
c0103fe3:	e8 1d fe ff ff       	call   c0103e05 <scroll_down>
c0103fe8:	83 c4 10             	add    $0x10,%esp
c0103feb:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fee:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103ff4:	8b 50 0c             	mov    0xc(%eax),%edx
c0103ff7:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ffa:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104000:	8b 40 08             	mov    0x8(%eax),%eax
c0104003:	29 c2                	sub    %eax,%edx
c0104005:	89 d0                	mov    %edx,%eax
c0104007:	3d d0 07 00 00       	cmp    $0x7d0,%eax
c010400c:	77 cf                	ja     c0103fdd <out_char+0x16d>
c010400e:	83 ec 0c             	sub    $0xc,%esp
c0104011:	ff 75 08             	pushl  0x8(%ebp)
c0104014:	e8 49 fc ff ff       	call   c0103c62 <flush>
c0104019:	83 c4 10             	add    $0x10,%esp
c010401c:	83 ec 0c             	sub    $0xc,%esp
c010401f:	ff 75 f4             	pushl  -0xc(%ebp)
c0104022:	e8 2a 2c 00 00       	call   c0106c51 <intr_set_status>
c0104027:	83 c4 10             	add    $0x10,%esp
c010402a:	90                   	nop
c010402b:	c9                   	leave  
c010402c:	c3                   	ret    

c010402d <tty_dev_read>:
c010402d:	55                   	push   %ebp
c010402e:	89 e5                	mov    %esp,%ebp
c0104030:	83 ec 08             	sub    $0x8,%esp
c0104033:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c0104038:	39 45 08             	cmp    %eax,0x8(%ebp)
c010403b:	75 17                	jne    c0104054 <tty_dev_read+0x27>
c010403d:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c0104042:	85 c0                	test   %eax,%eax
c0104044:	7e 0e                	jle    c0104054 <tty_dev_read+0x27>
c0104046:	83 ec 0c             	sub    $0xc,%esp
c0104049:	ff 75 08             	pushl  0x8(%ebp)
c010404c:	e8 89 07 00 00       	call   c01047da <keyboard_read>
c0104051:	83 c4 10             	add    $0x10,%esp
c0104054:	90                   	nop
c0104055:	c9                   	leave  
c0104056:	c3                   	ret    

c0104057 <tty_dev_write>:
c0104057:	55                   	push   %ebp
c0104058:	89 e5                	mov    %esp,%ebp
c010405a:	83 ec 28             	sub    $0x28,%esp
c010405d:	8b 45 08             	mov    0x8(%ebp),%eax
c0104060:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0104066:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104069:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0104070:	e9 88 01 00 00       	jmp    c01041fd <tty_dev_write+0x1a6>
c0104075:	8b 45 08             	mov    0x8(%ebp),%eax
c0104078:	8b 40 04             	mov    0x4(%eax),%eax
c010407b:	8b 00                	mov    (%eax),%eax
c010407d:	88 45 e7             	mov    %al,-0x19(%ebp)
c0104080:	8b 45 08             	mov    0x8(%ebp),%eax
c0104083:	8b 40 04             	mov    0x4(%eax),%eax
c0104086:	8d 50 04             	lea    0x4(%eax),%edx
c0104089:	8b 45 08             	mov    0x8(%ebp),%eax
c010408c:	89 50 04             	mov    %edx,0x4(%eax)
c010408f:	8b 45 08             	mov    0x8(%ebp),%eax
c0104092:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0104098:	8d 50 ff             	lea    -0x1(%eax),%edx
c010409b:	8b 45 08             	mov    0x8(%ebp),%eax
c010409e:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c01040a4:	8b 45 08             	mov    0x8(%ebp),%eax
c01040a7:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c01040ad:	8d 50 01             	lea    0x1(%eax),%edx
c01040b0:	8b 45 08             	mov    0x8(%ebp),%eax
c01040b3:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c01040b9:	8b 45 08             	mov    0x8(%ebp),%eax
c01040bc:	8b 40 04             	mov    0x4(%eax),%eax
c01040bf:	8b 55 08             	mov    0x8(%ebp),%edx
c01040c2:	83 c2 08             	add    $0x8,%edx
c01040c5:	81 c2 00 08 00 00    	add    $0x800,%edx
c01040cb:	39 d0                	cmp    %edx,%eax
c01040cd:	75 0c                	jne    c01040db <tty_dev_write+0x84>
c01040cf:	8b 45 08             	mov    0x8(%ebp),%eax
c01040d2:	8d 50 08             	lea    0x8(%eax),%edx
c01040d5:	8b 45 08             	mov    0x8(%ebp),%eax
c01040d8:	89 50 04             	mov    %edx,0x4(%eax)
c01040db:	8b 45 08             	mov    0x8(%ebp),%eax
c01040de:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c01040e4:	85 c0                	test   %eax,%eax
c01040e6:	0f 84 11 01 00 00    	je     c01041fd <tty_dev_write+0x1a6>
c01040ec:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c01040f0:	3c 20                	cmp    $0x20,%al
c01040f2:	76 08                	jbe    c01040fc <tty_dev_write+0xa5>
c01040f4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c01040f8:	3c 7e                	cmp    $0x7e,%al
c01040fa:	76 10                	jbe    c010410c <tty_dev_write+0xb5>
c01040fc:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104100:	3c 20                	cmp    $0x20,%al
c0104102:	74 08                	je     c010410c <tty_dev_write+0xb5>
c0104104:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104108:	84 c0                	test   %al,%al
c010410a:	75 58                	jne    c0104164 <tty_dev_write+0x10d>
c010410c:	8b 45 08             	mov    0x8(%ebp),%eax
c010410f:	8b 90 18 08 00 00    	mov    0x818(%eax),%edx
c0104115:	8b 45 08             	mov    0x8(%ebp),%eax
c0104118:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c010411e:	01 d0                	add    %edx,%eax
c0104120:	83 e8 01             	sub    $0x1,%eax
c0104123:	89 c2                	mov    %eax,%edx
c0104125:	83 ec 04             	sub    $0x4,%esp
c0104128:	6a 01                	push   $0x1
c010412a:	8d 45 e7             	lea    -0x19(%ebp),%eax
c010412d:	50                   	push   %eax
c010412e:	52                   	push   %edx
c010412f:	e8 58 2b 00 00       	call   c0106c8c <Memcpy>
c0104134:	83 c4 10             	add    $0x10,%esp
c0104137:	8b 45 08             	mov    0x8(%ebp),%eax
c010413a:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0104140:	8d 50 ff             	lea    -0x1(%eax),%edx
c0104143:	8b 45 08             	mov    0x8(%ebp),%eax
c0104146:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c010414c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104150:	0f b6 c0             	movzbl %al,%eax
c0104153:	83 ec 08             	sub    $0x8,%esp
c0104156:	50                   	push   %eax
c0104157:	ff 75 08             	pushl  0x8(%ebp)
c010415a:	e8 11 fd ff ff       	call   c0103e70 <out_char>
c010415f:	83 c4 10             	add    $0x10,%esp
c0104162:	eb 7c                	jmp    c01041e0 <tty_dev_write+0x189>
c0104164:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104168:	3c 08                	cmp    $0x8,%al
c010416a:	75 42                	jne    c01041ae <tty_dev_write+0x157>
c010416c:	8b 45 08             	mov    0x8(%ebp),%eax
c010416f:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0104175:	8d 50 01             	lea    0x1(%eax),%edx
c0104178:	8b 45 08             	mov    0x8(%ebp),%eax
c010417b:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c0104181:	8b 45 08             	mov    0x8(%ebp),%eax
c0104184:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c010418a:	8d 50 fe             	lea    -0x2(%eax),%edx
c010418d:	8b 45 08             	mov    0x8(%ebp),%eax
c0104190:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0104196:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c010419a:	0f b6 c0             	movzbl %al,%eax
c010419d:	83 ec 08             	sub    $0x8,%esp
c01041a0:	50                   	push   %eax
c01041a1:	ff 75 08             	pushl  0x8(%ebp)
c01041a4:	e8 c7 fc ff ff       	call   c0103e70 <out_char>
c01041a9:	83 c4 10             	add    $0x10,%esp
c01041ac:	eb 32                	jmp    c01041e0 <tty_dev_write+0x189>
c01041ae:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c01041b2:	3c 0a                	cmp    $0xa,%al
c01041b4:	75 2a                	jne    c01041e0 <tty_dev_write+0x189>
c01041b6:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c01041ba:	0f b6 c0             	movzbl %al,%eax
c01041bd:	83 ec 08             	sub    $0x8,%esp
c01041c0:	50                   	push   %eax
c01041c1:	ff 75 08             	pushl  0x8(%ebp)
c01041c4:	e8 a7 fc ff ff       	call   c0103e70 <out_char>
c01041c9:	83 c4 10             	add    $0x10,%esp
c01041cc:	8b 45 08             	mov    0x8(%ebp),%eax
c01041cf:	c7 80 0c 08 00 00 00 	movl   $0x0,0x80c(%eax)
c01041d6:	00 00 00 
c01041d9:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c01041e0:	8b 45 08             	mov    0x8(%ebp),%eax
c01041e3:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c01041e9:	8b 45 08             	mov    0x8(%ebp),%eax
c01041ec:	8b 80 14 08 00 00    	mov    0x814(%eax),%eax
c01041f2:	39 c2                	cmp    %eax,%edx
c01041f4:	75 07                	jne    c01041fd <tty_dev_write+0x1a6>
c01041f6:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c01041fd:	8b 45 08             	mov    0x8(%ebp),%eax
c0104200:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0104206:	85 c0                	test   %eax,%eax
c0104208:	0f 85 67 fe ff ff    	jne    c0104075 <tty_dev_write+0x1e>
c010420e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0104212:	74 6d                	je     c0104281 <tty_dev_write+0x22a>
c0104214:	c7 45 ec 7c 00 00 00 	movl   $0x7c,-0x14(%ebp)
c010421b:	83 ec 0c             	sub    $0xc,%esp
c010421e:	ff 75 ec             	pushl  -0x14(%ebp)
c0104221:	e8 b6 d3 ff ff       	call   c01015dc <sys_malloc>
c0104226:	83 c4 10             	add    $0x10,%esp
c0104229:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010422c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010422f:	c7 40 78 66 00 00 00 	movl   $0x66,0x78(%eax)
c0104236:	8b 45 08             	mov    0x8(%ebp),%eax
c0104239:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c010423f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104242:	89 50 60             	mov    %edx,0x60(%eax)
c0104245:	8b 45 08             	mov    0x8(%ebp),%eax
c0104248:	8b 90 20 08 00 00    	mov    0x820(%eax),%edx
c010424e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104251:	89 50 68             	mov    %edx,0x68(%eax)
c0104254:	8b 45 08             	mov    0x8(%ebp),%eax
c0104257:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c010425d:	83 ec 04             	sub    $0x4,%esp
c0104260:	50                   	push   %eax
c0104261:	ff 75 e8             	pushl  -0x18(%ebp)
c0104264:	6a 01                	push   $0x1
c0104266:	e8 aa 52 00 00       	call   c0109515 <send_rec>
c010426b:	83 c4 10             	add    $0x10,%esp
c010426e:	83 ec 08             	sub    $0x8,%esp
c0104271:	ff 75 ec             	pushl  -0x14(%ebp)
c0104274:	ff 75 e8             	pushl  -0x18(%ebp)
c0104277:	e8 75 d3 ff ff       	call   c01015f1 <sys_free>
c010427c:	83 c4 10             	add    $0x10,%esp
c010427f:	eb 01                	jmp    c0104282 <tty_dev_write+0x22b>
c0104281:	90                   	nop
c0104282:	c9                   	leave  
c0104283:	c3                   	ret    

c0104284 <tty_do_read>:
c0104284:	55                   	push   %ebp
c0104285:	89 e5                	mov    %esp,%ebp
c0104287:	83 ec 08             	sub    $0x8,%esp
c010428a:	8b 45 08             	mov    0x8(%ebp),%eax
c010428d:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c0104294:	00 00 00 
c0104297:	8b 45 0c             	mov    0xc(%ebp),%eax
c010429a:	8b 50 68             	mov    0x68(%eax),%edx
c010429d:	8b 45 08             	mov    0x8(%ebp),%eax
c01042a0:	89 90 20 08 00 00    	mov    %edx,0x820(%eax)
c01042a6:	8b 45 0c             	mov    0xc(%ebp),%eax
c01042a9:	8b 00                	mov    (%eax),%eax
c01042ab:	89 c2                	mov    %eax,%edx
c01042ad:	8b 45 08             	mov    0x8(%ebp),%eax
c01042b0:	89 90 1c 08 00 00    	mov    %edx,0x81c(%eax)
c01042b6:	8b 45 0c             	mov    0xc(%ebp),%eax
c01042b9:	8b 50 60             	mov    0x60(%eax),%edx
c01042bc:	8b 45 08             	mov    0x8(%ebp),%eax
c01042bf:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c01042c5:	8b 45 0c             	mov    0xc(%ebp),%eax
c01042c8:	8b 50 60             	mov    0x60(%eax),%edx
c01042cb:	8b 45 08             	mov    0x8(%ebp),%eax
c01042ce:	89 90 14 08 00 00    	mov    %edx,0x814(%eax)
c01042d4:	8b 45 08             	mov    0x8(%ebp),%eax
c01042d7:	8b 90 0c 08 00 00    	mov    0x80c(%eax),%edx
c01042dd:	8b 45 0c             	mov    0xc(%ebp),%eax
c01042e0:	8b 40 10             	mov    0x10(%eax),%eax
c01042e3:	83 ec 08             	sub    $0x8,%esp
c01042e6:	52                   	push   %edx
c01042e7:	50                   	push   %eax
c01042e8:	e8 32 1b 00 00       	call   c0105e1f <alloc_virtual_memory>
c01042ed:	83 c4 10             	add    $0x10,%esp
c01042f0:	89 c2                	mov    %eax,%edx
c01042f2:	8b 45 08             	mov    0x8(%ebp),%eax
c01042f5:	89 90 18 08 00 00    	mov    %edx,0x818(%eax)
c01042fb:	8b 45 08             	mov    0x8(%ebp),%eax
c01042fe:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c0104304:	83 f8 02             	cmp    $0x2,%eax
c0104307:	74 1c                	je     c0104325 <tty_do_read+0xa1>
c0104309:	68 3b 01 00 00       	push   $0x13b
c010430e:	68 f1 b4 10 c0       	push   $0xc010b4f1
c0104313:	68 f1 b4 10 c0       	push   $0xc010b4f1
c0104318:	68 fb b4 10 c0       	push   $0xc010b4fb
c010431d:	e8 83 45 00 00       	call   c01088a5 <assertion_failure>
c0104322:	83 c4 10             	add    $0x10,%esp
c0104325:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104328:	c7 40 78 67 00 00 00 	movl   $0x67,0x78(%eax)
c010432f:	8b 45 08             	mov    0x8(%ebp),%eax
c0104332:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c0104338:	83 ec 04             	sub    $0x4,%esp
c010433b:	50                   	push   %eax
c010433c:	ff 75 0c             	pushl  0xc(%ebp)
c010433f:	6a 01                	push   $0x1
c0104341:	e8 cf 51 00 00       	call   c0109515 <send_rec>
c0104346:	83 c4 10             	add    $0x10,%esp
c0104349:	90                   	nop
c010434a:	c9                   	leave  
c010434b:	c3                   	ret    

c010434c <tty_do_write>:
c010434c:	55                   	push   %ebp
c010434d:	89 e5                	mov    %esp,%ebp
c010434f:	53                   	push   %ebx
c0104350:	83 ec 24             	sub    $0x24,%esp
c0104353:	89 e0                	mov    %esp,%eax
c0104355:	89 c3                	mov    %eax,%ebx
c0104357:	c7 45 e8 80 00 00 00 	movl   $0x80,-0x18(%ebp)
c010435e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104361:	8d 50 ff             	lea    -0x1(%eax),%edx
c0104364:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c0104367:	89 c2                	mov    %eax,%edx
c0104369:	b8 10 00 00 00       	mov    $0x10,%eax
c010436e:	83 e8 01             	sub    $0x1,%eax
c0104371:	01 d0                	add    %edx,%eax
c0104373:	b9 10 00 00 00       	mov    $0x10,%ecx
c0104378:	ba 00 00 00 00       	mov    $0x0,%edx
c010437d:	f7 f1                	div    %ecx
c010437f:	6b c0 10             	imul   $0x10,%eax,%eax
c0104382:	29 c4                	sub    %eax,%esp
c0104384:	89 e0                	mov    %esp,%eax
c0104386:	83 c0 00             	add    $0x0,%eax
c0104389:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010438c:	83 ec 04             	sub    $0x4,%esp
c010438f:	ff 75 e8             	pushl  -0x18(%ebp)
c0104392:	6a 00                	push   $0x0
c0104394:	ff 75 e0             	pushl  -0x20(%ebp)
c0104397:	e8 33 7e 00 00       	call   c010c1cf <Memset>
c010439c:	83 c4 10             	add    $0x10,%esp
c010439f:	8b 45 0c             	mov    0xc(%ebp),%eax
c01043a2:	8b 40 60             	mov    0x60(%eax),%eax
c01043a5:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01043a8:	8b 45 08             	mov    0x8(%ebp),%eax
c01043ab:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c01043b2:	00 00 00 
c01043b5:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01043b8:	8b 45 0c             	mov    0xc(%ebp),%eax
c01043bb:	8b 40 10             	mov    0x10(%eax),%eax
c01043be:	83 ec 08             	sub    $0x8,%esp
c01043c1:	52                   	push   %edx
c01043c2:	50                   	push   %eax
c01043c3:	e8 57 1a 00 00       	call   c0105e1f <alloc_virtual_memory>
c01043c8:	83 c4 10             	add    $0x10,%esp
c01043cb:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01043ce:	eb 7e                	jmp    c010444e <tty_do_write+0x102>
c01043d0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01043d3:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c01043d6:	0f 4e 45 ec          	cmovle -0x14(%ebp),%eax
c01043da:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01043dd:	8b 45 08             	mov    0x8(%ebp),%eax
c01043e0:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c01043e6:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01043e9:	01 d0                	add    %edx,%eax
c01043eb:	83 ec 04             	sub    $0x4,%esp
c01043ee:	ff 75 f0             	pushl  -0x10(%ebp)
c01043f1:	50                   	push   %eax
c01043f2:	ff 75 e0             	pushl  -0x20(%ebp)
c01043f5:	e8 92 28 00 00       	call   c0106c8c <Memcpy>
c01043fa:	83 c4 10             	add    $0x10,%esp
c01043fd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104400:	29 45 ec             	sub    %eax,-0x14(%ebp)
c0104403:	8b 45 08             	mov    0x8(%ebp),%eax
c0104406:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c010440c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010440f:	01 c2                	add    %eax,%edx
c0104411:	8b 45 08             	mov    0x8(%ebp),%eax
c0104414:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c010441a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0104421:	eb 25                	jmp    c0104448 <tty_do_write+0xfc>
c0104423:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0104426:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104429:	01 d0                	add    %edx,%eax
c010442b:	0f b6 00             	movzbl (%eax),%eax
c010442e:	0f b6 c0             	movzbl %al,%eax
c0104431:	83 ec 08             	sub    $0x8,%esp
c0104434:	50                   	push   %eax
c0104435:	ff 75 08             	pushl  0x8(%ebp)
c0104438:	e8 33 fa ff ff       	call   c0103e70 <out_char>
c010443d:	83 c4 10             	add    $0x10,%esp
c0104440:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0104444:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c0104448:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010444c:	75 d5                	jne    c0104423 <tty_do_write+0xd7>
c010444e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0104452:	0f 85 78 ff ff ff    	jne    c01043d0 <tty_do_write+0x84>
c0104458:	83 ec 0c             	sub    $0xc,%esp
c010445b:	6a 7c                	push   $0x7c
c010445d:	e8 7a d1 ff ff       	call   c01015dc <sys_malloc>
c0104462:	83 c4 10             	add    $0x10,%esp
c0104465:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0104468:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010446b:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0104472:	8b 45 08             	mov    0x8(%ebp),%eax
c0104475:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c010447b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010447e:	89 50 58             	mov    %edx,0x58(%eax)
c0104481:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104484:	8b 00                	mov    (%eax),%eax
c0104486:	83 ec 04             	sub    $0x4,%esp
c0104489:	50                   	push   %eax
c010448a:	ff 75 d8             	pushl  -0x28(%ebp)
c010448d:	6a 01                	push   $0x1
c010448f:	e8 81 50 00 00       	call   c0109515 <send_rec>
c0104494:	83 c4 10             	add    $0x10,%esp
c0104497:	83 ec 08             	sub    $0x8,%esp
c010449a:	6a 7c                	push   $0x7c
c010449c:	ff 75 d8             	pushl  -0x28(%ebp)
c010449f:	e8 4d d1 ff ff       	call   c01015f1 <sys_free>
c01044a4:	83 c4 10             	add    $0x10,%esp
c01044a7:	89 dc                	mov    %ebx,%esp
c01044a9:	90                   	nop
c01044aa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01044ad:	c9                   	leave  
c01044ae:	c3                   	ret    

c01044af <init_screen>:
c01044af:	55                   	push   %ebp
c01044b0:	89 e5                	mov    %esp,%ebp
c01044b2:	83 ec 10             	sub    $0x10,%esp
c01044b5:	8b 45 08             	mov    0x8(%ebp),%eax
c01044b8:	2d 00 fe 10 c0       	sub    $0xc010fe00,%eax
c01044bd:	c1 f8 03             	sar    $0x3,%eax
c01044c0:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c01044c6:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01044c9:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01044cc:	c1 e0 04             	shl    $0x4,%eax
c01044cf:	8d 90 14 0f 11 c0    	lea    -0x3feef0ec(%eax),%edx
c01044d5:	8b 45 08             	mov    0x8(%ebp),%eax
c01044d8:	89 90 24 08 00 00    	mov    %edx,0x824(%eax)
c01044de:	c7 45 f8 ff 3f 00 00 	movl   $0x3fff,-0x8(%ebp)
c01044e5:	8b 45 08             	mov    0x8(%ebp),%eax
c01044e8:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01044ee:	8b 55 f8             	mov    -0x8(%ebp),%edx
c01044f1:	89 50 04             	mov    %edx,0x4(%eax)
c01044f4:	8b 45 08             	mov    0x8(%ebp),%eax
c01044f7:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01044fd:	8b 50 04             	mov    0x4(%eax),%edx
c0104500:	8b 45 08             	mov    0x8(%ebp),%eax
c0104503:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104509:	0f af 55 fc          	imul   -0x4(%ebp),%edx
c010450d:	89 10                	mov    %edx,(%eax)
c010450f:	8b 45 08             	mov    0x8(%ebp),%eax
c0104512:	8b 90 24 08 00 00    	mov    0x824(%eax),%edx
c0104518:	8b 45 08             	mov    0x8(%ebp),%eax
c010451b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104521:	8b 12                	mov    (%edx),%edx
c0104523:	89 50 08             	mov    %edx,0x8(%eax)
c0104526:	8b 55 08             	mov    0x8(%ebp),%edx
c0104529:	8b 92 24 08 00 00    	mov    0x824(%edx),%edx
c010452f:	8b 40 08             	mov    0x8(%eax),%eax
c0104532:	89 42 0c             	mov    %eax,0xc(%edx)
c0104535:	90                   	nop
c0104536:	c9                   	leave  
c0104537:	c3                   	ret    

c0104538 <init_tty>:
c0104538:	55                   	push   %ebp
c0104539:	89 e5                	mov    %esp,%ebp
c010453b:	83 ec 18             	sub    $0x18,%esp
c010453e:	c7 45 f4 00 fe 10 c0 	movl   $0xc010fe00,-0xc(%ebp)
c0104545:	e9 92 00 00 00       	jmp    c01045dc <init_tty+0xa4>
c010454a:	83 ec 04             	sub    $0x4,%esp
c010454d:	68 28 08 00 00       	push   $0x828
c0104552:	6a 00                	push   $0x0
c0104554:	ff 75 f4             	pushl  -0xc(%ebp)
c0104557:	e8 73 7c 00 00       	call   c010c1cf <Memset>
c010455c:	83 c4 10             	add    $0x10,%esp
c010455f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104562:	8d 50 08             	lea    0x8(%eax),%edx
c0104565:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104568:	89 50 04             	mov    %edx,0x4(%eax)
c010456b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010456e:	8b 50 04             	mov    0x4(%eax),%edx
c0104571:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104574:	89 10                	mov    %edx,(%eax)
c0104576:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104579:	c7 80 08 08 00 00 00 	movl   $0x0,0x808(%eax)
c0104580:	00 00 00 
c0104583:	83 ec 0c             	sub    $0xc,%esp
c0104586:	ff 75 f4             	pushl  -0xc(%ebp)
c0104589:	e8 21 ff ff ff       	call   c01044af <init_screen>
c010458e:	83 c4 10             	add    $0x10,%esp
c0104591:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104594:	2d 00 fe 10 c0       	sub    $0xc010fe00,%eax
c0104599:	85 c0                	test   %eax,%eax
c010459b:	7e 38                	jle    c01045d5 <init_tty+0x9d>
c010459d:	83 ec 08             	sub    $0x8,%esp
c01045a0:	6a 23                	push   $0x23
c01045a2:	ff 75 f4             	pushl  -0xc(%ebp)
c01045a5:	e8 c6 f8 ff ff       	call   c0103e70 <out_char>
c01045aa:	83 c4 10             	add    $0x10,%esp
c01045ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01045b0:	05 a8 8f 01 00       	add    $0x18fa8,%eax
c01045b5:	2d 00 fe 10 c0       	sub    $0xc010fe00,%eax
c01045ba:	c1 f8 03             	sar    $0x3,%eax
c01045bd:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c01045c3:	0f b6 c0             	movzbl %al,%eax
c01045c6:	83 ec 08             	sub    $0x8,%esp
c01045c9:	50                   	push   %eax
c01045ca:	ff 75 f4             	pushl  -0xc(%ebp)
c01045cd:	e8 9e f8 ff ff       	call   c0103e70 <out_char>
c01045d2:	83 c4 10             	add    $0x10,%esp
c01045d5:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c01045dc:	b8 28 06 11 c0       	mov    $0xc0110628,%eax
c01045e1:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c01045e4:	0f 82 60 ff ff ff    	jb     c010454a <init_tty+0x12>
c01045ea:	90                   	nop
c01045eb:	c9                   	leave  
c01045ec:	c3                   	ret    

c01045ed <TaskTTY>:
c01045ed:	55                   	push   %ebp
c01045ee:	89 e5                	mov    %esp,%ebp
c01045f0:	83 ec 28             	sub    $0x28,%esp
c01045f3:	e8 40 ff ff ff       	call   c0104538 <init_tty>
c01045f8:	83 ec 0c             	sub    $0xc,%esp
c01045fb:	6a 00                	push   $0x0
c01045fd:	e8 24 f6 ff ff       	call   c0103c26 <select_console>
c0104602:	83 c4 10             	add    $0x10,%esp
c0104605:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c010460c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0104613:	83 ec 0c             	sub    $0xc,%esp
c0104616:	6a 7c                	push   $0x7c
c0104618:	e8 bf cf ff ff       	call   c01015dc <sys_malloc>
c010461d:	83 c4 10             	add    $0x10,%esp
c0104620:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0104623:	c7 45 f4 00 fe 10 c0 	movl   $0xc010fe00,-0xc(%ebp)
c010462a:	eb 30                	jmp    c010465c <TaskTTY+0x6f>
c010462c:	83 ec 0c             	sub    $0xc,%esp
c010462f:	ff 75 f4             	pushl  -0xc(%ebp)
c0104632:	e8 f6 f9 ff ff       	call   c010402d <tty_dev_read>
c0104637:	83 c4 10             	add    $0x10,%esp
c010463a:	83 ec 0c             	sub    $0xc,%esp
c010463d:	ff 75 f4             	pushl  -0xc(%ebp)
c0104640:	e8 12 fa ff ff       	call   c0104057 <tty_dev_write>
c0104645:	83 c4 10             	add    $0x10,%esp
c0104648:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010464b:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0104651:	85 c0                	test   %eax,%eax
c0104653:	75 d7                	jne    c010462c <TaskTTY+0x3f>
c0104655:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c010465c:	b8 28 06 11 c0       	mov    $0xc0110628,%eax
c0104661:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0104664:	72 c6                	jb     c010462c <TaskTTY+0x3f>
c0104666:	83 ec 04             	sub    $0x4,%esp
c0104669:	6a 12                	push   $0x12
c010466b:	ff 75 e8             	pushl  -0x18(%ebp)
c010466e:	6a 02                	push   $0x2
c0104670:	e8 a0 4e 00 00       	call   c0109515 <send_rec>
c0104675:	83 c4 10             	add    $0x10,%esp
c0104678:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010467b:	8b 40 78             	mov    0x78(%eax),%eax
c010467e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0104681:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c0104688:	74 28                	je     c01046b2 <TaskTTY+0xc5>
c010468a:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c0104691:	7f 0b                	jg     c010469e <TaskTTY+0xb1>
c0104693:	81 7d e4 d1 07 00 00 	cmpl   $0x7d1,-0x1c(%ebp)
c010469a:	74 4e                	je     c01046ea <TaskTTY+0xfd>
c010469c:	eb 4d                	jmp    c01046eb <TaskTTY+0xfe>
c010469e:	81 7d e4 d3 07 00 00 	cmpl   $0x7d3,-0x1c(%ebp)
c01046a5:	74 21                	je     c01046c8 <TaskTTY+0xdb>
c01046a7:	81 7d e4 d5 07 00 00 	cmpl   $0x7d5,-0x1c(%ebp)
c01046ae:	74 2e                	je     c01046de <TaskTTY+0xf1>
c01046b0:	eb 39                	jmp    c01046eb <TaskTTY+0xfe>
c01046b2:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c01046b7:	83 ec 08             	sub    $0x8,%esp
c01046ba:	ff 75 e8             	pushl  -0x18(%ebp)
c01046bd:	50                   	push   %eax
c01046be:	e8 c1 fb ff ff       	call   c0104284 <tty_do_read>
c01046c3:	83 c4 10             	add    $0x10,%esp
c01046c6:	eb 23                	jmp    c01046eb <TaskTTY+0xfe>
c01046c8:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c01046cd:	83 ec 08             	sub    $0x8,%esp
c01046d0:	ff 75 e8             	pushl  -0x18(%ebp)
c01046d3:	50                   	push   %eax
c01046d4:	e8 73 fc ff ff       	call   c010434c <tty_do_write>
c01046d9:	83 c4 10             	add    $0x10,%esp
c01046dc:	eb 0d                	jmp    c01046eb <TaskTTY+0xfe>
c01046de:	c7 05 c0 06 11 c0 00 	movl   $0x0,0xc01106c0
c01046e5:	00 00 00 
c01046e8:	eb 01                	jmp    c01046eb <TaskTTY+0xfe>
c01046ea:	90                   	nop
c01046eb:	e9 33 ff ff ff       	jmp    c0104623 <TaskTTY+0x36>

c01046f0 <keyboard_handler>:
c01046f0:	55                   	push   %ebp
c01046f1:	89 e5                	mov    %esp,%ebp
c01046f3:	83 ec 18             	sub    $0x18,%esp
c01046f6:	c7 05 c0 06 11 c0 01 	movl   $0x1,0xc01106c0
c01046fd:	00 00 00 
c0104700:	c7 45 f4 60 00 00 00 	movl   $0x60,-0xc(%ebp)
c0104707:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c010470c:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c0104711:	7f 5e                	jg     c0104771 <keyboard_handler+0x81>
c0104713:	e8 f8 bb ff ff       	call   c0100310 <disable_int>
c0104718:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010471b:	0f b7 c0             	movzwl %ax,%eax
c010471e:	83 ec 0c             	sub    $0xc,%esp
c0104721:	50                   	push   %eax
c0104722:	e8 bb bb ff ff       	call   c01002e2 <in_byte>
c0104727:	83 c4 10             	add    $0x10,%esp
c010472a:	88 45 f3             	mov    %al,-0xd(%ebp)
c010472d:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c0104732:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
c0104736:	88 10                	mov    %dl,(%eax)
c0104738:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c010473d:	83 c0 01             	add    $0x1,%eax
c0104740:	a3 e0 fb 10 c0       	mov    %eax,0xc010fbe0
c0104745:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c010474a:	83 c0 01             	add    $0x1,%eax
c010474d:	a3 e8 fb 10 c0       	mov    %eax,0xc010fbe8
c0104752:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c0104757:	ba ec fd 10 c0       	mov    $0xc010fdec,%edx
c010475c:	39 d0                	cmp    %edx,%eax
c010475e:	72 0a                	jb     c010476a <keyboard_handler+0x7a>
c0104760:	c7 05 e0 fb 10 c0 ec 	movl   $0xc010fbec,0xc010fbe0
c0104767:	fb 10 c0 
c010476a:	e8 a3 bb ff ff       	call   c0100312 <enable_int>
c010476f:	eb 01                	jmp    c0104772 <keyboard_handler+0x82>
c0104771:	90                   	nop
c0104772:	c9                   	leave  
c0104773:	c3                   	ret    

c0104774 <read_from_keyboard_buf>:
c0104774:	55                   	push   %ebp
c0104775:	89 e5                	mov    %esp,%ebp
c0104777:	83 ec 18             	sub    $0x18,%esp
c010477a:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
c010477e:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c0104783:	85 c0                	test   %eax,%eax
c0104785:	7f 06                	jg     c010478d <read_from_keyboard_buf+0x19>
c0104787:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c010478b:	eb 4b                	jmp    c01047d8 <read_from_keyboard_buf+0x64>
c010478d:	e8 7e bb ff ff       	call   c0100310 <disable_int>
c0104792:	a1 e4 fb 10 c0       	mov    0xc010fbe4,%eax
c0104797:	0f b6 00             	movzbl (%eax),%eax
c010479a:	88 45 f7             	mov    %al,-0x9(%ebp)
c010479d:	a1 e4 fb 10 c0       	mov    0xc010fbe4,%eax
c01047a2:	83 c0 01             	add    $0x1,%eax
c01047a5:	a3 e4 fb 10 c0       	mov    %eax,0xc010fbe4
c01047aa:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c01047af:	83 e8 01             	sub    $0x1,%eax
c01047b2:	a3 e8 fb 10 c0       	mov    %eax,0xc010fbe8
c01047b7:	a1 e4 fb 10 c0       	mov    0xc010fbe4,%eax
c01047bc:	ba ec fd 10 c0       	mov    $0xc010fdec,%edx
c01047c1:	39 d0                	cmp    %edx,%eax
c01047c3:	72 0a                	jb     c01047cf <read_from_keyboard_buf+0x5b>
c01047c5:	c7 05 e4 fb 10 c0 ec 	movl   $0xc010fbec,0xc010fbe4
c01047cc:	fb 10 c0 
c01047cf:	e8 3e bb ff ff       	call   c0100312 <enable_int>
c01047d4:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c01047d8:	c9                   	leave  
c01047d9:	c3                   	ret    

c01047da <keyboard_read>:
c01047da:	55                   	push   %ebp
c01047db:	89 e5                	mov    %esp,%ebp
c01047dd:	83 ec 28             	sub    $0x28,%esp
c01047e0:	90                   	nop
c01047e1:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c01047e6:	85 c0                	test   %eax,%eax
c01047e8:	7e f7                	jle    c01047e1 <keyboard_read+0x7>
c01047ea:	e8 85 ff ff ff       	call   c0104774 <read_from_keyboard_buf>
c01047ef:	88 45 ea             	mov    %al,-0x16(%ebp)
c01047f2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01047f9:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c01047fd:	80 7d ea e1          	cmpb   $0xe1,-0x16(%ebp)
c0104801:	75 5a                	jne    c010485d <keyboard_read+0x83>
c0104803:	c6 45 e3 e1          	movb   $0xe1,-0x1d(%ebp)
c0104807:	c6 45 e4 1d          	movb   $0x1d,-0x1c(%ebp)
c010480b:	c6 45 e5 45          	movb   $0x45,-0x1b(%ebp)
c010480f:	c6 45 e6 e1          	movb   $0xe1,-0x1a(%ebp)
c0104813:	c6 45 e7 9d          	movb   $0x9d,-0x19(%ebp)
c0104817:	c6 45 e8 c5          	movb   $0xc5,-0x18(%ebp)
c010481b:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
c010481f:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0104826:	eb 20                	jmp    c0104848 <keyboard_read+0x6e>
c0104828:	e8 47 ff ff ff       	call   c0104774 <read_from_keyboard_buf>
c010482d:	89 c1                	mov    %eax,%ecx
c010482f:	8d 55 e3             	lea    -0x1d(%ebp),%edx
c0104832:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104835:	01 d0                	add    %edx,%eax
c0104837:	0f b6 00             	movzbl (%eax),%eax
c010483a:	38 c1                	cmp    %al,%cl
c010483c:	74 06                	je     c0104844 <keyboard_read+0x6a>
c010483e:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
c0104842:	eb 0a                	jmp    c010484e <keyboard_read+0x74>
c0104844:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0104848:	83 7d ec 05          	cmpl   $0x5,-0x14(%ebp)
c010484c:	7e da                	jle    c0104828 <keyboard_read+0x4e>
c010484e:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
c0104852:	74 68                	je     c01048bc <keyboard_read+0xe2>
c0104854:	c7 45 f4 80 01 00 00 	movl   $0x180,-0xc(%ebp)
c010485b:	eb 5f                	jmp    c01048bc <keyboard_read+0xe2>
c010485d:	80 7d ea e0          	cmpb   $0xe0,-0x16(%ebp)
c0104861:	75 59                	jne    c01048bc <keyboard_read+0xe2>
c0104863:	e8 0c ff ff ff       	call   c0104774 <read_from_keyboard_buf>
c0104868:	3c 2a                	cmp    $0x2a,%al
c010486a:	75 1d                	jne    c0104889 <keyboard_read+0xaf>
c010486c:	e8 03 ff ff ff       	call   c0104774 <read_from_keyboard_buf>
c0104871:	3c e0                	cmp    $0xe0,%al
c0104873:	75 14                	jne    c0104889 <keyboard_read+0xaf>
c0104875:	e8 fa fe ff ff       	call   c0104774 <read_from_keyboard_buf>
c010487a:	3c 37                	cmp    $0x37,%al
c010487c:	75 0b                	jne    c0104889 <keyboard_read+0xaf>
c010487e:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c0104885:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
c0104889:	e8 e6 fe ff ff       	call   c0104774 <read_from_keyboard_buf>
c010488e:	3c b7                	cmp    $0xb7,%al
c0104890:	75 1d                	jne    c01048af <keyboard_read+0xd5>
c0104892:	e8 dd fe ff ff       	call   c0104774 <read_from_keyboard_buf>
c0104897:	3c e0                	cmp    $0xe0,%al
c0104899:	75 14                	jne    c01048af <keyboard_read+0xd5>
c010489b:	e8 d4 fe ff ff       	call   c0104774 <read_from_keyboard_buf>
c01048a0:	3c aa                	cmp    $0xaa,%al
c01048a2:	75 0b                	jne    c01048af <keyboard_read+0xd5>
c01048a4:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c01048ab:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c01048af:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01048b3:	75 07                	jne    c01048bc <keyboard_read+0xe2>
c01048b5:	c6 05 84 f7 10 c0 01 	movb   $0x1,0xc010f784
c01048bc:	81 7d f4 80 01 00 00 	cmpl   $0x180,-0xc(%ebp)
c01048c3:	0f 84 8d 00 00 00    	je     c0104956 <keyboard_read+0x17c>
c01048c9:	81 7d f4 81 01 00 00 	cmpl   $0x181,-0xc(%ebp)
c01048d0:	0f 84 80 00 00 00    	je     c0104956 <keyboard_read+0x17c>
c01048d6:	80 7d ea 36          	cmpb   $0x36,-0x16(%ebp)
c01048da:	0f 94 c2             	sete   %dl
c01048dd:	80 7d ea 2a          	cmpb   $0x2a,-0x16(%ebp)
c01048e1:	0f 94 c0             	sete   %al
c01048e4:	09 d0                	or     %edx,%eax
c01048e6:	84 c0                	test   %al,%al
c01048e8:	74 07                	je     c01048f1 <keyboard_read+0x117>
c01048ea:	c6 05 c8 06 11 c0 01 	movb   $0x1,0xc01106c8
c01048f1:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
c01048f5:	f7 d0                	not    %eax
c01048f7:	c0 e8 07             	shr    $0x7,%al
c01048fa:	88 45 e9             	mov    %al,-0x17(%ebp)
c01048fd:	80 7d ea 00          	cmpb   $0x0,-0x16(%ebp)
c0104901:	74 53                	je     c0104956 <keyboard_read+0x17c>
c0104903:	80 7d e9 00          	cmpb   $0x0,-0x17(%ebp)
c0104907:	74 4d                	je     c0104956 <keyboard_read+0x17c>
c0104909:	c6 45 eb 00          	movb   $0x0,-0x15(%ebp)
c010490d:	0f b6 05 c8 06 11 c0 	movzbl 0xc01106c8,%eax
c0104914:	3c 01                	cmp    $0x1,%al
c0104916:	75 04                	jne    c010491c <keyboard_read+0x142>
c0104918:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
c010491c:	0f b6 05 84 f7 10 c0 	movzbl 0xc010f784,%eax
c0104923:	84 c0                	test   %al,%al
c0104925:	74 04                	je     c010492b <keyboard_read+0x151>
c0104927:	c6 45 eb 02          	movb   $0x2,-0x15(%ebp)
c010492b:	0f b6 55 ea          	movzbl -0x16(%ebp),%edx
c010492f:	89 d0                	mov    %edx,%eax
c0104931:	01 c0                	add    %eax,%eax
c0104933:	01 c2                	add    %eax,%edx
c0104935:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c0104939:	01 d0                	add    %edx,%eax
c010493b:	8b 04 85 60 e1 10 c0 	mov    -0x3fef1ea0(,%eax,4),%eax
c0104942:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104945:	83 ec 08             	sub    $0x8,%esp
c0104948:	ff 75 f4             	pushl  -0xc(%ebp)
c010494b:	ff 75 08             	pushl  0x8(%ebp)
c010494e:	e8 1a 00 00 00       	call   c010496d <in_process>
c0104953:	83 c4 10             	add    $0x10,%esp
c0104956:	90                   	nop
c0104957:	c9                   	leave  
c0104958:	c3                   	ret    

c0104959 <init_keyboard_handler>:
c0104959:	55                   	push   %ebp
c010495a:	89 e5                	mov    %esp,%ebp
c010495c:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c0104963:	c6 05 c8 06 11 c0 00 	movb   $0x0,0xc01106c8
c010496a:	90                   	nop
c010496b:	5d                   	pop    %ebp
c010496c:	c3                   	ret    

c010496d <in_process>:
c010496d:	55                   	push   %ebp
c010496e:	89 e5                	mov    %esp,%ebp
c0104970:	83 ec 18             	sub    $0x18,%esp
c0104973:	83 ec 04             	sub    $0x4,%esp
c0104976:	6a 02                	push   $0x2
c0104978:	6a 00                	push   $0x0
c010497a:	8d 45 f6             	lea    -0xa(%ebp),%eax
c010497d:	50                   	push   %eax
c010497e:	e8 4c 78 00 00       	call   c010c1cf <Memset>
c0104983:	83 c4 10             	add    $0x10,%esp
c0104986:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104989:	25 00 01 00 00       	and    $0x100,%eax
c010498e:	85 c0                	test   %eax,%eax
c0104990:	75 28                	jne    c01049ba <in_process+0x4d>
c0104992:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104995:	0f b6 c0             	movzbl %al,%eax
c0104998:	83 ec 08             	sub    $0x8,%esp
c010499b:	50                   	push   %eax
c010499c:	ff 75 08             	pushl  0x8(%ebp)
c010499f:	e8 b3 f3 ff ff       	call   c0103d57 <put_key>
c01049a4:	83 c4 10             	add    $0x10,%esp
c01049a7:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c01049ae:	c6 05 c8 06 11 c0 00 	movb   $0x0,0xc01106c8
c01049b5:	e9 42 01 00 00       	jmp    c0104afc <in_process+0x18f>
c01049ba:	0f b6 05 c8 06 11 c0 	movzbl 0xc01106c8,%eax
c01049c1:	84 c0                	test   %al,%al
c01049c3:	0f 84 a9 00 00 00    	je     c0104a72 <in_process+0x105>
c01049c9:	83 7d 0c 2a          	cmpl   $0x2a,0xc(%ebp)
c01049cd:	0f 84 9f 00 00 00    	je     c0104a72 <in_process+0x105>
c01049d3:	83 7d 0c 36          	cmpl   $0x36,0xc(%ebp)
c01049d7:	0f 84 95 00 00 00    	je     c0104a72 <in_process+0x105>
c01049dd:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c01049e4:	74 64                	je     c0104a4a <in_process+0xdd>
c01049e6:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c01049ed:	77 0b                	ja     c01049fa <in_process+0x8d>
c01049ef:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c01049f6:	74 64                	je     c0104a5c <in_process+0xef>
c01049f8:	eb 73                	jmp    c0104a6d <in_process+0x100>
c01049fa:	81 7d 0c 55 01 00 00 	cmpl   $0x155,0xc(%ebp)
c0104a01:	74 0b                	je     c0104a0e <in_process+0xa1>
c0104a03:	81 7d 0c 68 01 00 00 	cmpl   $0x168,0xc(%ebp)
c0104a0a:	74 20                	je     c0104a2c <in_process+0xbf>
c0104a0c:	eb 5f                	jmp    c0104a6d <in_process+0x100>
c0104a0e:	83 ec 0c             	sub    $0xc,%esp
c0104a11:	ff 75 08             	pushl  0x8(%ebp)
c0104a14:	e8 aa f3 ff ff       	call   c0103dc3 <scroll_up>
c0104a19:	83 c4 10             	add    $0x10,%esp
c0104a1c:	c6 05 c8 06 11 c0 00 	movb   $0x0,0xc01106c8
c0104a23:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c0104a2a:	eb 41                	jmp    c0104a6d <in_process+0x100>
c0104a2c:	83 ec 0c             	sub    $0xc,%esp
c0104a2f:	ff 75 08             	pushl  0x8(%ebp)
c0104a32:	e8 ce f3 ff ff       	call   c0103e05 <scroll_down>
c0104a37:	83 c4 10             	add    $0x10,%esp
c0104a3a:	c6 05 c8 06 11 c0 00 	movb   $0x0,0xc01106c8
c0104a41:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c0104a48:	eb 23                	jmp    c0104a6d <in_process+0x100>
c0104a4a:	83 ec 08             	sub    $0x8,%esp
c0104a4d:	6a 0a                	push   $0xa
c0104a4f:	ff 75 08             	pushl  0x8(%ebp)
c0104a52:	e8 19 f4 ff ff       	call   c0103e70 <out_char>
c0104a57:	83 c4 10             	add    $0x10,%esp
c0104a5a:	eb 11                	jmp    c0104a6d <in_process+0x100>
c0104a5c:	83 ec 08             	sub    $0x8,%esp
c0104a5f:	6a 08                	push   $0x8
c0104a61:	ff 75 08             	pushl  0x8(%ebp)
c0104a64:	e8 07 f4 ff ff       	call   c0103e70 <out_char>
c0104a69:	83 c4 10             	add    $0x10,%esp
c0104a6c:	90                   	nop
c0104a6d:	e9 8a 00 00 00       	jmp    c0104afc <in_process+0x18f>
c0104a72:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0104a79:	74 55                	je     c0104ad0 <in_process+0x163>
c0104a7b:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0104a82:	77 14                	ja     c0104a98 <in_process+0x12b>
c0104a84:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0104a8b:	74 31                	je     c0104abe <in_process+0x151>
c0104a8d:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0104a94:	74 16                	je     c0104aac <in_process+0x13f>
c0104a96:	eb 64                	jmp    c0104afc <in_process+0x18f>
c0104a98:	81 7d 0c 41 01 00 00 	cmpl   $0x141,0xc(%ebp)
c0104a9f:	74 3e                	je     c0104adf <in_process+0x172>
c0104aa1:	81 7d 0c 42 01 00 00 	cmpl   $0x142,0xc(%ebp)
c0104aa8:	74 44                	je     c0104aee <in_process+0x181>
c0104aaa:	eb 50                	jmp    c0104afc <in_process+0x18f>
c0104aac:	83 ec 08             	sub    $0x8,%esp
c0104aaf:	6a 0a                	push   $0xa
c0104ab1:	ff 75 08             	pushl  0x8(%ebp)
c0104ab4:	e8 9e f2 ff ff       	call   c0103d57 <put_key>
c0104ab9:	83 c4 10             	add    $0x10,%esp
c0104abc:	eb 3e                	jmp    c0104afc <in_process+0x18f>
c0104abe:	83 ec 08             	sub    $0x8,%esp
c0104ac1:	6a 08                	push   $0x8
c0104ac3:	ff 75 08             	pushl  0x8(%ebp)
c0104ac6:	e8 8c f2 ff ff       	call   c0103d57 <put_key>
c0104acb:	83 c4 10             	add    $0x10,%esp
c0104ace:	eb 2c                	jmp    c0104afc <in_process+0x18f>
c0104ad0:	83 ec 0c             	sub    $0xc,%esp
c0104ad3:	6a 00                	push   $0x0
c0104ad5:	e8 4c f1 ff ff       	call   c0103c26 <select_console>
c0104ada:	83 c4 10             	add    $0x10,%esp
c0104add:	eb 1d                	jmp    c0104afc <in_process+0x18f>
c0104adf:	83 ec 0c             	sub    $0xc,%esp
c0104ae2:	6a 01                	push   $0x1
c0104ae4:	e8 3d f1 ff ff       	call   c0103c26 <select_console>
c0104ae9:	83 c4 10             	add    $0x10,%esp
c0104aec:	eb 0e                	jmp    c0104afc <in_process+0x18f>
c0104aee:	83 ec 0c             	sub    $0xc,%esp
c0104af1:	6a 02                	push   $0x2
c0104af3:	e8 2e f1 ff ff       	call   c0103c26 <select_console>
c0104af8:	83 c4 10             	add    $0x10,%esp
c0104afb:	90                   	nop
c0104afc:	90                   	nop
c0104afd:	c9                   	leave  
c0104afe:	c3                   	ret    

c0104aff <open>:
c0104aff:	55                   	push   %ebp
c0104b00:	89 e5                	mov    %esp,%ebp
c0104b02:	83 ec 18             	sub    $0x18,%esp
c0104b05:	83 ec 0c             	sub    $0xc,%esp
c0104b08:	6a 7c                	push   $0x7c
c0104b0a:	e8 cd ca ff ff       	call   c01015dc <sys_malloc>
c0104b0f:	83 c4 10             	add    $0x10,%esp
c0104b12:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104b15:	83 ec 04             	sub    $0x4,%esp
c0104b18:	6a 7c                	push   $0x7c
c0104b1a:	6a 00                	push   $0x0
c0104b1c:	ff 75 f4             	pushl  -0xc(%ebp)
c0104b1f:	e8 ab 76 00 00       	call   c010c1cf <Memset>
c0104b24:	83 c4 10             	add    $0x10,%esp
c0104b27:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104b2a:	c7 40 78 06 00 00 00 	movl   $0x6,0x78(%eax)
c0104b31:	83 ec 0c             	sub    $0xc,%esp
c0104b34:	ff 75 08             	pushl  0x8(%ebp)
c0104b37:	e8 32 14 00 00       	call   c0105f6e <get_physical_address>
c0104b3c:	83 c4 10             	add    $0x10,%esp
c0104b3f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104b42:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104b45:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104b48:	89 50 44             	mov    %edx,0x44(%eax)
c0104b4b:	8b 55 0c             	mov    0xc(%ebp),%edx
c0104b4e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104b51:	89 50 74             	mov    %edx,0x74(%eax)
c0104b54:	83 ec 0c             	sub    $0xc,%esp
c0104b57:	ff 75 08             	pushl  0x8(%ebp)
c0104b5a:	e8 a9 76 00 00       	call   c010c208 <Strlen>
c0104b5f:	83 c4 10             	add    $0x10,%esp
c0104b62:	89 c2                	mov    %eax,%edx
c0104b64:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104b67:	89 50 40             	mov    %edx,0x40(%eax)
c0104b6a:	83 ec 04             	sub    $0x4,%esp
c0104b6d:	6a 02                	push   $0x2
c0104b6f:	ff 75 f4             	pushl  -0xc(%ebp)
c0104b72:	6a 03                	push   $0x3
c0104b74:	e8 9c 49 00 00       	call   c0109515 <send_rec>
c0104b79:	83 c4 10             	add    $0x10,%esp
c0104b7c:	83 ec 08             	sub    $0x8,%esp
c0104b7f:	6a 7c                	push   $0x7c
c0104b81:	ff 75 f4             	pushl  -0xc(%ebp)
c0104b84:	e8 68 ca ff ff       	call   c01015f1 <sys_free>
c0104b89:	83 c4 10             	add    $0x10,%esp
c0104b8c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104b8f:	8b 40 50             	mov    0x50(%eax),%eax
c0104b92:	c9                   	leave  
c0104b93:	c3                   	ret    

c0104b94 <read>:
c0104b94:	55                   	push   %ebp
c0104b95:	89 e5                	mov    %esp,%ebp
c0104b97:	83 ec 38             	sub    $0x38,%esp
c0104b9a:	c7 45 dc 7c 00 00 00 	movl   $0x7c,-0x24(%ebp)
c0104ba1:	83 ec 0c             	sub    $0xc,%esp
c0104ba4:	ff 75 dc             	pushl  -0x24(%ebp)
c0104ba7:	e8 30 ca ff ff       	call   c01015dc <sys_malloc>
c0104bac:	83 c4 10             	add    $0x10,%esp
c0104baf:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0104bb2:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104bb5:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0104bba:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104bbd:	83 ec 0c             	sub    $0xc,%esp
c0104bc0:	ff 75 0c             	pushl  0xc(%ebp)
c0104bc3:	e8 a6 13 00 00       	call   c0105f6e <get_physical_address>
c0104bc8:	83 c4 10             	add    $0x10,%esp
c0104bcb:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104bce:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104bd1:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0104bd6:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0104bd9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104bdc:	05 ff 0f 00 00       	add    $0xfff,%eax
c0104be1:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0104be4:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0104beb:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0104bf2:	8b 55 10             	mov    0x10(%ebp),%edx
c0104bf5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104bf8:	01 d0                	add    %edx,%eax
c0104bfa:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
c0104bfd:	0f 83 a8 00 00 00    	jae    c0104cab <read+0x117>
c0104c03:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104c06:	2b 45 f0             	sub    -0x10(%ebp),%eax
c0104c09:	05 00 10 00 00       	add    $0x1000,%eax
c0104c0e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0104c11:	8b 45 10             	mov    0x10(%ebp),%eax
c0104c14:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0104c17:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104c1a:	83 ec 04             	sub    $0x4,%esp
c0104c1d:	50                   	push   %eax
c0104c1e:	6a 00                	push   $0x0
c0104c20:	ff 75 d8             	pushl  -0x28(%ebp)
c0104c23:	e8 a7 75 00 00       	call   c010c1cf <Memset>
c0104c28:	83 c4 10             	add    $0x10,%esp
c0104c2b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104c2e:	c7 40 78 07 00 00 00 	movl   $0x7,0x78(%eax)
c0104c35:	8b 55 08             	mov    0x8(%ebp),%edx
c0104c38:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104c3b:	89 50 50             	mov    %edx,0x50(%eax)
c0104c3e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104c41:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104c44:	89 50 10             	mov    %edx,0x10(%eax)
c0104c47:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104c4a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0104c4d:	89 50 60             	mov    %edx,0x60(%eax)
c0104c50:	83 ec 04             	sub    $0x4,%esp
c0104c53:	6a 02                	push   $0x2
c0104c55:	ff 75 d8             	pushl  -0x28(%ebp)
c0104c58:	6a 03                	push   $0x3
c0104c5a:	e8 b6 48 00 00       	call   c0109515 <send_rec>
c0104c5f:	83 c4 10             	add    $0x10,%esp
c0104c62:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104c65:	8b 40 60             	mov    0x60(%eax),%eax
c0104c68:	01 45 e8             	add    %eax,-0x18(%ebp)
c0104c6b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0104c6e:	29 45 e0             	sub    %eax,-0x20(%ebp)
c0104c71:	8b 45 10             	mov    0x10(%ebp),%eax
c0104c74:	2b 45 e4             	sub    -0x1c(%ebp),%eax
c0104c77:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0104c7a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0104c7d:	89 45 10             	mov    %eax,0x10(%ebp)
c0104c80:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
c0104c87:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c0104c8e:	83 ec 0c             	sub    $0xc,%esp
c0104c91:	ff 75 f4             	pushl  -0xc(%ebp)
c0104c94:	e8 d5 12 00 00       	call   c0105f6e <get_physical_address>
c0104c99:	83 c4 10             	add    $0x10,%esp
c0104c9c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104c9f:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0104ca3:	0f 85 6e ff ff ff    	jne    c0104c17 <read+0x83>
c0104ca9:	eb 54                	jmp    c0104cff <read+0x16b>
c0104cab:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104cae:	83 ec 04             	sub    $0x4,%esp
c0104cb1:	50                   	push   %eax
c0104cb2:	6a 00                	push   $0x0
c0104cb4:	ff 75 d8             	pushl  -0x28(%ebp)
c0104cb7:	e8 13 75 00 00       	call   c010c1cf <Memset>
c0104cbc:	83 c4 10             	add    $0x10,%esp
c0104cbf:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104cc2:	c7 40 78 07 00 00 00 	movl   $0x7,0x78(%eax)
c0104cc9:	8b 55 08             	mov    0x8(%ebp),%edx
c0104ccc:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104ccf:	89 50 50             	mov    %edx,0x50(%eax)
c0104cd2:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104cd5:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104cd8:	89 50 10             	mov    %edx,0x10(%eax)
c0104cdb:	8b 55 10             	mov    0x10(%ebp),%edx
c0104cde:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104ce1:	89 50 60             	mov    %edx,0x60(%eax)
c0104ce4:	83 ec 04             	sub    $0x4,%esp
c0104ce7:	6a 02                	push   $0x2
c0104ce9:	ff 75 d8             	pushl  -0x28(%ebp)
c0104cec:	6a 03                	push   $0x3
c0104cee:	e8 22 48 00 00       	call   c0109515 <send_rec>
c0104cf3:	83 c4 10             	add    $0x10,%esp
c0104cf6:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104cf9:	8b 40 60             	mov    0x60(%eax),%eax
c0104cfc:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0104cff:	83 ec 08             	sub    $0x8,%esp
c0104d02:	ff 75 dc             	pushl  -0x24(%ebp)
c0104d05:	ff 75 d8             	pushl  -0x28(%ebp)
c0104d08:	e8 e4 c8 ff ff       	call   c01015f1 <sys_free>
c0104d0d:	83 c4 10             	add    $0x10,%esp
c0104d10:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104d13:	c9                   	leave  
c0104d14:	c3                   	ret    

c0104d15 <write>:
c0104d15:	55                   	push   %ebp
c0104d16:	89 e5                	mov    %esp,%ebp
c0104d18:	83 ec 18             	sub    $0x18,%esp
c0104d1b:	c7 45 f4 7c 00 00 00 	movl   $0x7c,-0xc(%ebp)
c0104d22:	83 ec 0c             	sub    $0xc,%esp
c0104d25:	ff 75 f4             	pushl  -0xc(%ebp)
c0104d28:	e8 af c8 ff ff       	call   c01015dc <sys_malloc>
c0104d2d:	83 c4 10             	add    $0x10,%esp
c0104d30:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104d33:	83 ec 0c             	sub    $0xc,%esp
c0104d36:	ff 75 0c             	pushl  0xc(%ebp)
c0104d39:	e8 30 12 00 00       	call   c0105f6e <get_physical_address>
c0104d3e:	83 c4 10             	add    $0x10,%esp
c0104d41:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0104d44:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104d47:	c7 40 78 0a 00 00 00 	movl   $0xa,0x78(%eax)
c0104d4e:	8b 55 08             	mov    0x8(%ebp),%edx
c0104d51:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104d54:	89 50 50             	mov    %edx,0x50(%eax)
c0104d57:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104d5a:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0104d5d:	89 50 10             	mov    %edx,0x10(%eax)
c0104d60:	8b 55 10             	mov    0x10(%ebp),%edx
c0104d63:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104d66:	89 50 60             	mov    %edx,0x60(%eax)
c0104d69:	83 ec 04             	sub    $0x4,%esp
c0104d6c:	6a 02                	push   $0x2
c0104d6e:	ff 75 f0             	pushl  -0x10(%ebp)
c0104d71:	6a 03                	push   $0x3
c0104d73:	e8 9d 47 00 00       	call   c0109515 <send_rec>
c0104d78:	83 c4 10             	add    $0x10,%esp
c0104d7b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104d7e:	8b 40 60             	mov    0x60(%eax),%eax
c0104d81:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0104d84:	83 ec 08             	sub    $0x8,%esp
c0104d87:	ff 75 f4             	pushl  -0xc(%ebp)
c0104d8a:	ff 75 f0             	pushl  -0x10(%ebp)
c0104d8d:	e8 5f c8 ff ff       	call   c01015f1 <sys_free>
c0104d92:	83 c4 10             	add    $0x10,%esp
c0104d95:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104d98:	c9                   	leave  
c0104d99:	c3                   	ret    

c0104d9a <close>:
c0104d9a:	55                   	push   %ebp
c0104d9b:	89 e5                	mov    %esp,%ebp
c0104d9d:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104da3:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0104daa:	8b 45 08             	mov    0x8(%ebp),%eax
c0104dad:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0104db0:	83 ec 04             	sub    $0x4,%esp
c0104db3:	6a 02                	push   $0x2
c0104db5:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104dbb:	50                   	push   %eax
c0104dbc:	6a 03                	push   $0x3
c0104dbe:	e8 52 47 00 00       	call   c0109515 <send_rec>
c0104dc3:	83 c4 10             	add    $0x10,%esp
c0104dc6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104dc9:	83 f8 65             	cmp    $0x65,%eax
c0104dcc:	74 19                	je     c0104de7 <close+0x4d>
c0104dce:	6a 13                	push   $0x13
c0104dd0:	68 13 b5 10 c0       	push   $0xc010b513
c0104dd5:	68 13 b5 10 c0       	push   $0xc010b513
c0104dda:	68 1f b5 10 c0       	push   $0xc010b51f
c0104ddf:	e8 c1 3a 00 00       	call   c01088a5 <assertion_failure>
c0104de4:	83 c4 10             	add    $0x10,%esp
c0104de7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0104dea:	c9                   	leave  
c0104deb:	c3                   	ret    

c0104dec <wait>:
c0104dec:	55                   	push   %ebp
c0104ded:	89 e5                	mov    %esp,%ebp
c0104def:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104df5:	c7 45 f4 09 00 00 00 	movl   $0x9,-0xc(%ebp)
c0104dfc:	83 ec 04             	sub    $0x4,%esp
c0104dff:	6a 01                	push   $0x1
c0104e01:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104e07:	50                   	push   %eax
c0104e08:	6a 03                	push   $0x3
c0104e0a:	e8 06 47 00 00       	call   c0109515 <send_rec>
c0104e0f:	83 c4 10             	add    $0x10,%esp
c0104e12:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0104e15:	89 c2                	mov    %eax,%edx
c0104e17:	8b 45 08             	mov    0x8(%ebp),%eax
c0104e1a:	89 10                	mov    %edx,(%eax)
c0104e1c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104e1f:	83 f8 21             	cmp    $0x21,%eax
c0104e22:	74 05                	je     c0104e29 <wait+0x3d>
c0104e24:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104e27:	eb 05                	jmp    c0104e2e <wait+0x42>
c0104e29:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0104e2e:	c9                   	leave  
c0104e2f:	c3                   	ret    

c0104e30 <exit>:
c0104e30:	55                   	push   %ebp
c0104e31:	89 e5                	mov    %esp,%ebp
c0104e33:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104e39:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
c0104e40:	8b 45 08             	mov    0x8(%ebp),%eax
c0104e43:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0104e46:	83 ec 04             	sub    $0x4,%esp
c0104e49:	6a 01                	push   $0x1
c0104e4b:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104e51:	50                   	push   %eax
c0104e52:	6a 03                	push   $0x3
c0104e54:	e8 bc 46 00 00       	call   c0109515 <send_rec>
c0104e59:	83 c4 10             	add    $0x10,%esp
c0104e5c:	90                   	nop
c0104e5d:	c9                   	leave  
c0104e5e:	c3                   	ret    

c0104e5f <fork>:
c0104e5f:	55                   	push   %ebp
c0104e60:	89 e5                	mov    %esp,%ebp
c0104e62:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104e68:	83 ec 04             	sub    $0x4,%esp
c0104e6b:	6a 7c                	push   $0x7c
c0104e6d:	6a 00                	push   $0x0
c0104e6f:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104e75:	50                   	push   %eax
c0104e76:	e8 54 73 00 00       	call   c010c1cf <Memset>
c0104e7b:	83 c4 10             	add    $0x10,%esp
c0104e7e:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
c0104e85:	83 ec 04             	sub    $0x4,%esp
c0104e88:	6a 01                	push   $0x1
c0104e8a:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104e90:	50                   	push   %eax
c0104e91:	6a 03                	push   $0x3
c0104e93:	e8 7d 46 00 00       	call   c0109515 <send_rec>
c0104e98:	83 c4 10             	add    $0x10,%esp
c0104e9b:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c0104ea2:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104ea5:	c9                   	leave  
c0104ea6:	c3                   	ret    

c0104ea7 <getpid>:
c0104ea7:	55                   	push   %ebp
c0104ea8:	89 e5                	mov    %esp,%ebp
c0104eaa:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104eb0:	c7 45 f4 05 00 00 00 	movl   $0x5,-0xc(%ebp)
c0104eb7:	83 ec 04             	sub    $0x4,%esp
c0104eba:	6a 05                	push   $0x5
c0104ebc:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104ec2:	50                   	push   %eax
c0104ec3:	6a 03                	push   $0x3
c0104ec5:	e8 4b 46 00 00       	call   c0109515 <send_rec>
c0104eca:	83 c4 10             	add    $0x10,%esp
c0104ecd:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104ed0:	c9                   	leave  
c0104ed1:	c3                   	ret    

c0104ed2 <exec>:
c0104ed2:	55                   	push   %ebp
c0104ed3:	89 e5                	mov    %esp,%ebp
c0104ed5:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104edb:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0104ee2:	8b 45 08             	mov    0x8(%ebp),%eax
c0104ee5:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0104ee8:	83 ec 0c             	sub    $0xc,%esp
c0104eeb:	ff 75 08             	pushl  0x8(%ebp)
c0104eee:	e8 15 73 00 00       	call   c010c208 <Strlen>
c0104ef3:	83 c4 10             	add    $0x10,%esp
c0104ef6:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0104ef9:	c7 45 8c 00 00 00 00 	movl   $0x0,-0x74(%ebp)
c0104f00:	c7 45 98 00 00 00 00 	movl   $0x0,-0x68(%ebp)
c0104f07:	83 ec 04             	sub    $0x4,%esp
c0104f0a:	6a 01                	push   $0x1
c0104f0c:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104f12:	50                   	push   %eax
c0104f13:	6a 03                	push   $0x3
c0104f15:	e8 fb 45 00 00       	call   c0109515 <send_rec>
c0104f1a:	83 c4 10             	add    $0x10,%esp
c0104f1d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104f20:	83 f8 65             	cmp    $0x65,%eax
c0104f23:	74 19                	je     c0104f3e <exec+0x6c>
c0104f25:	6a 19                	push   $0x19
c0104f27:	68 37 b5 10 c0       	push   $0xc010b537
c0104f2c:	68 37 b5 10 c0       	push   $0xc010b537
c0104f31:	68 42 b5 10 c0       	push   $0xc010b542
c0104f36:	e8 6a 39 00 00       	call   c01088a5 <assertion_failure>
c0104f3b:	83 c4 10             	add    $0x10,%esp
c0104f3e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0104f41:	c9                   	leave  
c0104f42:	c3                   	ret    

c0104f43 <execv>:
c0104f43:	55                   	push   %ebp
c0104f44:	89 e5                	mov    %esp,%ebp
c0104f46:	81 ec b8 00 00 00    	sub    $0xb8,%esp
c0104f4c:	c7 45 e0 00 01 00 00 	movl   $0x100,-0x20(%ebp)
c0104f53:	83 ec 0c             	sub    $0xc,%esp
c0104f56:	ff 75 e0             	pushl  -0x20(%ebp)
c0104f59:	e8 7e c6 ff ff       	call   c01015dc <sys_malloc>
c0104f5e:	83 c4 10             	add    $0x10,%esp
c0104f61:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0104f64:	66 87 db             	xchg   %bx,%bx
c0104f67:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0104f6a:	83 ec 04             	sub    $0x4,%esp
c0104f6d:	50                   	push   %eax
c0104f6e:	6a 00                	push   $0x0
c0104f70:	ff 75 dc             	pushl  -0x24(%ebp)
c0104f73:	e8 57 72 00 00       	call   c010c1cf <Memset>
c0104f78:	83 c4 10             	add    $0x10,%esp
c0104f7b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104f7e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104f81:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0104f88:	eb 23                	jmp    c0104fad <execv+0x6a>
c0104f8a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104f8d:	8b 00                	mov    (%eax),%eax
c0104f8f:	83 ec 08             	sub    $0x8,%esp
c0104f92:	50                   	push   %eax
c0104f93:	68 5a b5 10 c0       	push   $0xc010b55a
c0104f98:	e8 ab 35 00 00       	call   c0108548 <Printf>
c0104f9d:	83 c4 10             	add    $0x10,%esp
c0104fa0:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
c0104fa4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104fa7:	83 c0 04             	add    $0x4,%eax
c0104faa:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104fad:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104fb0:	8b 00                	mov    (%eax),%eax
c0104fb2:	85 c0                	test   %eax,%eax
c0104fb4:	75 d4                	jne    c0104f8a <execv+0x47>
c0104fb6:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104fb9:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104fbc:	01 d0                	add    %edx,%eax
c0104fbe:	c6 00 00             	movb   $0x0,(%eax)
c0104fc1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104fc4:	83 c0 04             	add    $0x4,%eax
c0104fc7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104fca:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104fcd:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0104fd0:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104fd3:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0104fd6:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0104fdd:	eb 5b                	jmp    c010503a <execv+0xf7>
c0104fdf:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104fe2:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104fe5:	01 c2                	add    %eax,%edx
c0104fe7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104fea:	89 10                	mov    %edx,(%eax)
c0104fec:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104fef:	8b 00                	mov    (%eax),%eax
c0104ff1:	8b 4d f0             	mov    -0x10(%ebp),%ecx
c0104ff4:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0104ff7:	01 ca                	add    %ecx,%edx
c0104ff9:	83 ec 08             	sub    $0x8,%esp
c0104ffc:	50                   	push   %eax
c0104ffd:	52                   	push   %edx
c0104ffe:	e8 eb 71 00 00       	call   c010c1ee <Strcpy>
c0105003:	83 c4 10             	add    $0x10,%esp
c0105006:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105009:	8b 00                	mov    (%eax),%eax
c010500b:	83 ec 0c             	sub    $0xc,%esp
c010500e:	50                   	push   %eax
c010500f:	e8 f4 71 00 00       	call   c010c208 <Strlen>
c0105014:	83 c4 10             	add    $0x10,%esp
c0105017:	01 45 f0             	add    %eax,-0x10(%ebp)
c010501a:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010501d:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105020:	01 d0                	add    %edx,%eax
c0105022:	c6 00 00             	movb   $0x0,(%eax)
c0105025:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105028:	83 c0 01             	add    $0x1,%eax
c010502b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010502e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
c0105032:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c0105036:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c010503a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010503d:	8b 00                	mov    (%eax),%eax
c010503f:	85 c0                	test   %eax,%eax
c0105041:	75 9c                	jne    c0104fdf <execv+0x9c>
c0105043:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105046:	ba 00 00 00 c0       	mov    $0xc0000000,%edx
c010504b:	29 c2                	sub    %eax,%edx
c010504d:	89 d0                	mov    %edx,%eax
c010504f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105052:	83 ec 0c             	sub    $0xc,%esp
c0105055:	ff 75 08             	pushl  0x8(%ebp)
c0105058:	e8 11 0f 00 00       	call   c0105f6e <get_physical_address>
c010505d:	83 c4 10             	add    $0x10,%esp
c0105060:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0105063:	83 ec 0c             	sub    $0xc,%esp
c0105066:	ff 75 dc             	pushl  -0x24(%ebp)
c0105069:	e8 00 0f 00 00       	call   c0105f6e <get_physical_address>
c010506e:	83 c4 10             	add    $0x10,%esp
c0105071:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0105074:	83 ec 0c             	sub    $0xc,%esp
c0105077:	ff 75 d8             	pushl  -0x28(%ebp)
c010507a:	e8 ef 0e 00 00       	call   c0105f6e <get_physical_address>
c010507f:	83 c4 10             	add    $0x10,%esp
c0105082:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0105085:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
c010508c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010508f:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0105092:	83 ec 0c             	sub    $0xc,%esp
c0105095:	ff 75 08             	pushl  0x8(%ebp)
c0105098:	e8 6b 71 00 00       	call   c010c208 <Strlen>
c010509d:	83 c4 10             	add    $0x10,%esp
c01050a0:	89 45 90             	mov    %eax,-0x70(%ebp)
c01050a3:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01050a6:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
c01050ac:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01050af:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c01050b5:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01050b8:	89 85 70 ff ff ff    	mov    %eax,-0x90(%ebp)
c01050be:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01050c1:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
c01050c7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01050ca:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01050d0:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01050d3:	8b 55 d8             	mov    -0x28(%ebp),%edx
c01050d6:	29 c2                	sub    %eax,%edx
c01050d8:	89 d0                	mov    %edx,%eax
c01050da:	89 85 7c ff ff ff    	mov    %eax,-0x84(%ebp)
c01050e0:	83 ec 04             	sub    $0x4,%esp
c01050e3:	6a 01                	push   $0x1
c01050e5:	8d 85 50 ff ff ff    	lea    -0xb0(%ebp),%eax
c01050eb:	50                   	push   %eax
c01050ec:	6a 03                	push   $0x3
c01050ee:	e8 22 44 00 00       	call   c0109515 <send_rec>
c01050f3:	83 c4 10             	add    $0x10,%esp
c01050f6:	83 ec 08             	sub    $0x8,%esp
c01050f9:	68 00 04 00 00       	push   $0x400
c01050fe:	ff 75 dc             	pushl  -0x24(%ebp)
c0105101:	e8 eb c4 ff ff       	call   c01015f1 <sys_free>
c0105106:	83 c4 10             	add    $0x10,%esp
c0105109:	8b 45 c8             	mov    -0x38(%ebp),%eax
c010510c:	83 f8 65             	cmp    $0x65,%eax
c010510f:	74 1c                	je     c010512d <execv+0x1ea>
c0105111:	68 95 00 00 00       	push   $0x95
c0105116:	68 37 b5 10 c0       	push   $0xc010b537
c010511b:	68 37 b5 10 c0       	push   $0xc010b537
c0105120:	68 42 b5 10 c0       	push   $0xc010b542
c0105125:	e8 7b 37 00 00       	call   c01088a5 <assertion_failure>
c010512a:	83 c4 10             	add    $0x10,%esp
c010512d:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0105130:	c9                   	leave  
c0105131:	c3                   	ret    

c0105132 <execl>:
c0105132:	55                   	push   %ebp
c0105133:	89 e5                	mov    %esp,%ebp
c0105135:	83 ec 18             	sub    $0x18,%esp
c0105138:	8d 45 0c             	lea    0xc(%ebp),%eax
c010513b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010513e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105141:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105144:	83 ec 08             	sub    $0x8,%esp
c0105147:	ff 75 f0             	pushl  -0x10(%ebp)
c010514a:	ff 75 08             	pushl  0x8(%ebp)
c010514d:	e8 f1 fd ff ff       	call   c0104f43 <execv>
c0105152:	83 c4 10             	add    $0x10,%esp
c0105155:	c9                   	leave  
c0105156:	c3                   	ret    

c0105157 <TaskMM>:
c0105157:	55                   	push   %ebp
c0105158:	89 e5                	mov    %esp,%ebp
c010515a:	83 ec 28             	sub    $0x28,%esp
c010515d:	83 ec 0c             	sub    $0xc,%esp
c0105160:	6a 7c                	push   $0x7c
c0105162:	e8 75 c4 ff ff       	call   c01015dc <sys_malloc>
c0105167:	83 c4 10             	add    $0x10,%esp
c010516a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010516d:	83 ec 0c             	sub    $0xc,%esp
c0105170:	6a 7c                	push   $0x7c
c0105172:	e8 65 c4 ff ff       	call   c01015dc <sys_malloc>
c0105177:	83 c4 10             	add    $0x10,%esp
c010517a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010517d:	83 ec 04             	sub    $0x4,%esp
c0105180:	6a 12                	push   $0x12
c0105182:	ff 75 f0             	pushl  -0x10(%ebp)
c0105185:	6a 02                	push   $0x2
c0105187:	e8 89 43 00 00       	call   c0109515 <send_rec>
c010518c:	83 c4 10             	add    $0x10,%esp
c010518f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105192:	8b 40 78             	mov    0x78(%eax),%eax
c0105195:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105198:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010519b:	8b 00                	mov    (%eax),%eax
c010519d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01051a0:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c01051a7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01051aa:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c01051b1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01051b4:	c7 40 58 00 00 00 00 	movl   $0x0,0x58(%eax)
c01051bb:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c01051bf:	74 4e                	je     c010520f <TaskMM+0xb8>
c01051c1:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c01051c5:	7f 08                	jg     c01051cf <TaskMM+0x78>
c01051c7:	83 7d e8 02          	cmpl   $0x2,-0x18(%ebp)
c01051cb:	74 28                	je     c01051f5 <TaskMM+0x9e>
c01051cd:	eb 71                	jmp    c0105240 <TaskMM+0xe9>
c01051cf:	83 7d e8 04          	cmpl   $0x4,-0x18(%ebp)
c01051d3:	74 08                	je     c01051dd <TaskMM+0x86>
c01051d5:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c01051d9:	74 4e                	je     c0105229 <TaskMM+0xd2>
c01051db:	eb 63                	jmp    c0105240 <TaskMM+0xe9>
c01051dd:	83 ec 0c             	sub    $0xc,%esp
c01051e0:	ff 75 f0             	pushl  -0x10(%ebp)
c01051e3:	e8 d0 04 00 00       	call   c01056b8 <do_fork>
c01051e8:	83 c4 10             	add    $0x10,%esp
c01051eb:	89 c2                	mov    %eax,%edx
c01051ed:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01051f0:	89 50 5c             	mov    %edx,0x5c(%eax)
c01051f3:	eb 5c                	jmp    c0105251 <TaskMM+0xfa>
c01051f5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01051fc:	66 87 db             	xchg   %bx,%bx
c01051ff:	83 ec 0c             	sub    $0xc,%esp
c0105202:	ff 75 f0             	pushl  -0x10(%ebp)
c0105205:	e8 95 00 00 00       	call   c010529f <do_exec>
c010520a:	83 c4 10             	add    $0x10,%esp
c010520d:	eb 42                	jmp    c0105251 <TaskMM+0xfa>
c010520f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0105216:	83 ec 08             	sub    $0x8,%esp
c0105219:	ff 75 e0             	pushl  -0x20(%ebp)
c010521c:	ff 75 f0             	pushl  -0x10(%ebp)
c010521f:	e8 02 05 00 00       	call   c0105726 <do_exit>
c0105224:	83 c4 10             	add    $0x10,%esp
c0105227:	eb 28                	jmp    c0105251 <TaskMM+0xfa>
c0105229:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0105230:	83 ec 0c             	sub    $0xc,%esp
c0105233:	ff 75 f0             	pushl  -0x10(%ebp)
c0105236:	e8 75 05 00 00       	call   c01057b0 <do_wait>
c010523b:	83 c4 10             	add    $0x10,%esp
c010523e:	eb 11                	jmp    c0105251 <TaskMM+0xfa>
c0105240:	83 ec 0c             	sub    $0xc,%esp
c0105243:	68 64 b5 10 c0       	push   $0xc010b564
c0105248:	e8 3a 36 00 00       	call   c0108887 <panic>
c010524d:	83 c4 10             	add    $0x10,%esp
c0105250:	90                   	nop
c0105251:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0105255:	0f 84 22 ff ff ff    	je     c010517d <TaskMM+0x26>
c010525b:	83 ec 0c             	sub    $0xc,%esp
c010525e:	6a 03                	push   $0x3
c0105260:	e8 af 31 00 00       	call   c0108414 <delay>
c0105265:	83 c4 10             	add    $0x10,%esp
c0105268:	83 ec 04             	sub    $0x4,%esp
c010526b:	ff 75 e4             	pushl  -0x1c(%ebp)
c010526e:	ff 75 ec             	pushl  -0x14(%ebp)
c0105271:	6a 01                	push   $0x1
c0105273:	e8 9d 42 00 00       	call   c0109515 <send_rec>
c0105278:	83 c4 10             	add    $0x10,%esp
c010527b:	e9 fd fe ff ff       	jmp    c010517d <TaskMM+0x26>

c0105280 <alloc_mem>:
c0105280:	55                   	push   %ebp
c0105281:	89 e5                	mov    %esp,%ebp
c0105283:	83 ec 10             	sub    $0x10,%esp
c0105286:	8b 45 08             	mov    0x8(%ebp),%eax
c0105289:	83 e8 08             	sub    $0x8,%eax
c010528c:	69 c0 00 10 10 00    	imul   $0x101000,%eax,%eax
c0105292:	05 00 00 a0 00       	add    $0xa00000,%eax
c0105297:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010529a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010529d:	c9                   	leave  
c010529e:	c3                   	ret    

c010529f <do_exec>:
c010529f:	55                   	push   %ebp
c01052a0:	89 e5                	mov    %esp,%ebp
c01052a2:	81 ec 38 01 00 00    	sub    $0x138,%esp
c01052a8:	c7 85 56 ff ff ff 64 	movl   $0x5f766564,-0xaa(%ebp)
c01052af:	65 76 5f 
c01052b2:	c7 85 5a ff ff ff 74 	movl   $0x31797474,-0xa6(%ebp)
c01052b9:	74 79 31 
c01052bc:	66 c7 85 5e ff ff ff 	movw   $0x0,-0xa2(%ebp)
c01052c3:	00 00 
c01052c5:	83 ec 08             	sub    $0x8,%esp
c01052c8:	6a 00                	push   $0x0
c01052ca:	8d 85 56 ff ff ff    	lea    -0xaa(%ebp),%eax
c01052d0:	50                   	push   %eax
c01052d1:	e8 29 f8 ff ff       	call   c0104aff <open>
c01052d6:	83 c4 10             	add    $0x10,%esp
c01052d9:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01052dc:	8b 45 08             	mov    0x8(%ebp),%eax
c01052df:	8b 00                	mov    (%eax),%eax
c01052e1:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01052e4:	c7 45 d0 00 40 03 00 	movl   $0x34000,-0x30(%ebp)
c01052eb:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01052ee:	83 ec 0c             	sub    $0xc,%esp
c01052f1:	50                   	push   %eax
c01052f2:	e8 e5 c2 ff ff       	call   c01015dc <sys_malloc>
c01052f7:	83 c4 10             	add    $0x10,%esp
c01052fa:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01052fd:	83 ec 04             	sub    $0x4,%esp
c0105300:	ff 75 d0             	pushl  -0x30(%ebp)
c0105303:	6a 00                	push   $0x0
c0105305:	ff 75 cc             	pushl  -0x34(%ebp)
c0105308:	e8 c2 6e 00 00       	call   c010c1cf <Memset>
c010530d:	83 c4 10             	add    $0x10,%esp
c0105310:	83 ec 04             	sub    $0x4,%esp
c0105313:	6a 0c                	push   $0xc
c0105315:	6a 00                	push   $0x0
c0105317:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c010531d:	50                   	push   %eax
c010531e:	e8 ac 6e 00 00       	call   c010c1cf <Memset>
c0105323:	83 c4 10             	add    $0x10,%esp
c0105326:	8b 45 08             	mov    0x8(%ebp),%eax
c0105329:	8b 40 44             	mov    0x44(%eax),%eax
c010532c:	89 45 c8             	mov    %eax,-0x38(%ebp)
c010532f:	8b 45 08             	mov    0x8(%ebp),%eax
c0105332:	8b 40 40             	mov    0x40(%eax),%eax
c0105335:	83 ec 08             	sub    $0x8,%esp
c0105338:	50                   	push   %eax
c0105339:	ff 75 c8             	pushl  -0x38(%ebp)
c010533c:	e8 de 0a 00 00       	call   c0105e1f <alloc_virtual_memory>
c0105341:	83 c4 10             	add    $0x10,%esp
c0105344:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0105347:	8b 45 08             	mov    0x8(%ebp),%eax
c010534a:	8b 40 40             	mov    0x40(%eax),%eax
c010534d:	89 c2                	mov    %eax,%edx
c010534f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0105352:	83 ec 04             	sub    $0x4,%esp
c0105355:	52                   	push   %edx
c0105356:	50                   	push   %eax
c0105357:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c010535d:	50                   	push   %eax
c010535e:	e8 29 19 00 00       	call   c0106c8c <Memcpy>
c0105363:	83 c4 10             	add    $0x10,%esp
c0105366:	8b 45 08             	mov    0x8(%ebp),%eax
c0105369:	8b 40 40             	mov    0x40(%eax),%eax
c010536c:	c6 84 05 4a ff ff ff 	movb   $0x0,-0xb6(%ebp,%eax,1)
c0105373:	00 
c0105374:	83 ec 08             	sub    $0x8,%esp
c0105377:	6a 00                	push   $0x0
c0105379:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c010537f:	50                   	push   %eax
c0105380:	e8 7a f7 ff ff       	call   c0104aff <open>
c0105385:	83 c4 10             	add    $0x10,%esp
c0105388:	89 45 c0             	mov    %eax,-0x40(%ebp)
c010538b:	83 7d c0 ff          	cmpl   $0xffffffff,-0x40(%ebp)
c010538f:	75 15                	jne    c01053a6 <do_exec+0x107>
c0105391:	83 ec 0c             	sub    $0xc,%esp
c0105394:	68 75 b5 10 c0       	push   $0xc010b575
c0105399:	e8 aa 31 00 00       	call   c0108548 <Printf>
c010539e:	83 c4 10             	add    $0x10,%esp
c01053a1:	e9 10 03 00 00       	jmp    c01056b6 <do_exec+0x417>
c01053a6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01053ad:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01053b0:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01053b3:	01 d0                	add    %edx,%eax
c01053b5:	83 ec 04             	sub    $0x4,%esp
c01053b8:	68 00 10 00 00       	push   $0x1000
c01053bd:	50                   	push   %eax
c01053be:	ff 75 c0             	pushl  -0x40(%ebp)
c01053c1:	e8 ce f7 ff ff       	call   c0104b94 <read>
c01053c6:	83 c4 10             	add    $0x10,%esp
c01053c9:	89 45 bc             	mov    %eax,-0x44(%ebp)
c01053cc:	8b 45 bc             	mov    -0x44(%ebp),%eax
c01053cf:	01 45 f4             	add    %eax,-0xc(%ebp)
c01053d2:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
c01053d6:	74 0a                	je     c01053e2 <do_exec+0x143>
c01053d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01053db:	3b 45 d0             	cmp    -0x30(%ebp),%eax
c01053de:	7d 05                	jge    c01053e5 <do_exec+0x146>
c01053e0:	eb cb                	jmp    c01053ad <do_exec+0x10e>
c01053e2:	90                   	nop
c01053e3:	eb 01                	jmp    c01053e6 <do_exec+0x147>
c01053e5:	90                   	nop
c01053e6:	83 ec 0c             	sub    $0xc,%esp
c01053e9:	ff 75 c0             	pushl  -0x40(%ebp)
c01053ec:	e8 a9 f9 ff ff       	call   c0104d9a <close>
c01053f1:	83 c4 10             	add    $0x10,%esp
c01053f4:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01053f7:	89 45 b8             	mov    %eax,-0x48(%ebp)
c01053fa:	8b 45 b8             	mov    -0x48(%ebp),%eax
c01053fd:	8b 40 18             	mov    0x18(%eax),%eax
c0105400:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0105403:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c010540a:	e9 04 01 00 00       	jmp    c0105513 <do_exec+0x274>
c010540f:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0105412:	0f b7 40 28          	movzwl 0x28(%eax),%eax
c0105416:	0f b7 d0             	movzwl %ax,%edx
c0105419:	8b 45 b8             	mov    -0x48(%ebp),%eax
c010541c:	0f b7 40 2a          	movzwl 0x2a(%eax),%eax
c0105420:	0f b7 c0             	movzwl %ax,%eax
c0105423:	0f af 45 f0          	imul   -0x10(%ebp),%eax
c0105427:	01 c2                	add    %eax,%edx
c0105429:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010542c:	01 d0                	add    %edx,%eax
c010542e:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0105431:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0105434:	8b 40 10             	mov    0x10(%eax),%eax
c0105437:	89 45 ac             	mov    %eax,-0x54(%ebp)
c010543a:	8b 45 ac             	mov    -0x54(%ebp),%eax
c010543d:	05 ff 0f 00 00       	add    $0xfff,%eax
c0105442:	c1 e8 0c             	shr    $0xc,%eax
c0105445:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0105448:	8b 45 b0             	mov    -0x50(%ebp),%eax
c010544b:	8b 40 08             	mov    0x8(%eax),%eax
c010544e:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0105451:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0105458:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c010545b:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c010545e:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0105461:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0105464:	8b 50 04             	mov    0x4(%eax),%edx
c0105467:	8b 45 a0             	mov    -0x60(%ebp),%eax
c010546a:	01 d0                	add    %edx,%eax
c010546c:	89 45 9c             	mov    %eax,-0x64(%ebp)
c010546f:	83 7d ac 00          	cmpl   $0x0,-0x54(%ebp)
c0105473:	0f 84 95 00 00 00    	je     c010550e <do_exec+0x26f>
c0105479:	83 ec 04             	sub    $0x4,%esp
c010547c:	ff 75 d4             	pushl  -0x2c(%ebp)
c010547f:	ff 75 a8             	pushl  -0x58(%ebp)
c0105482:	ff 75 a4             	pushl  -0x5c(%ebp)
c0105485:	e8 a0 07 00 00       	call   c0105c2a <get_virtual_address_start_with_addr>
c010548a:	83 c4 10             	add    $0x10,%esp
c010548d:	89 45 98             	mov    %eax,-0x68(%ebp)
c0105490:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0105493:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105496:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c010549d:	eb 41                	jmp    c01054e0 <do_exec+0x241>
c010549f:	83 ec 08             	sub    $0x8,%esp
c01054a2:	ff 75 d4             	pushl  -0x2c(%ebp)
c01054a5:	ff 75 e8             	pushl  -0x18(%ebp)
c01054a8:	e8 f3 0a 00 00       	call   c0105fa0 <alloc_physical_memory_of_proc>
c01054ad:	83 c4 10             	add    $0x10,%esp
c01054b0:	89 45 94             	mov    %eax,-0x6c(%ebp)
c01054b3:	83 ec 08             	sub    $0x8,%esp
c01054b6:	68 00 10 00 00       	push   $0x1000
c01054bb:	ff 75 94             	pushl  -0x6c(%ebp)
c01054be:	e8 5c 09 00 00       	call   c0105e1f <alloc_virtual_memory>
c01054c3:	83 c4 10             	add    $0x10,%esp
c01054c6:	89 45 90             	mov    %eax,-0x70(%ebp)
c01054c9:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c01054cd:	75 06                	jne    c01054d5 <do_exec+0x236>
c01054cf:	8b 45 90             	mov    -0x70(%ebp),%eax
c01054d2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01054d5:	81 45 e8 00 10 00 00 	addl   $0x1000,-0x18(%ebp)
c01054dc:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c01054e0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01054e3:	39 45 a8             	cmp    %eax,-0x58(%ebp)
c01054e6:	77 b7                	ja     c010549f <do_exec+0x200>
c01054e8:	8b 45 b0             	mov    -0x50(%ebp),%eax
c01054eb:	8b 40 10             	mov    0x10(%eax),%eax
c01054ee:	89 c1                	mov    %eax,%ecx
c01054f0:	8b 45 b0             	mov    -0x50(%ebp),%eax
c01054f3:	8b 50 04             	mov    0x4(%eax),%edx
c01054f6:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01054f9:	01 c2                	add    %eax,%edx
c01054fb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01054fe:	83 ec 04             	sub    $0x4,%esp
c0105501:	51                   	push   %ecx
c0105502:	52                   	push   %edx
c0105503:	50                   	push   %eax
c0105504:	e8 83 17 00 00       	call   c0106c8c <Memcpy>
c0105509:	83 c4 10             	add    $0x10,%esp
c010550c:	eb 01                	jmp    c010550f <do_exec+0x270>
c010550e:	90                   	nop
c010550f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0105513:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0105516:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
c010551a:	0f b7 c0             	movzwl %ax,%eax
c010551d:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0105520:	0f 8c e9 fe ff ff    	jl     c010540f <do_exec+0x170>
c0105526:	8b 45 08             	mov    0x8(%ebp),%eax
c0105529:	8b 40 10             	mov    0x10(%eax),%eax
c010552c:	89 45 8c             	mov    %eax,-0x74(%ebp)
c010552f:	8b 45 08             	mov    0x8(%ebp),%eax
c0105532:	8b 40 1c             	mov    0x1c(%eax),%eax
c0105535:	89 45 88             	mov    %eax,-0x78(%ebp)
c0105538:	8b 45 08             	mov    0x8(%ebp),%eax
c010553b:	8b 40 24             	mov    0x24(%eax),%eax
c010553e:	89 45 84             	mov    %eax,-0x7c(%ebp)
c0105541:	83 ec 0c             	sub    $0xc,%esp
c0105544:	ff 75 d4             	pushl  -0x2c(%ebp)
c0105547:	e8 8a e2 ff ff       	call   c01037d6 <pid2proc>
c010554c:	83 c4 10             	add    $0x10,%esp
c010554f:	89 45 80             	mov    %eax,-0x80(%ebp)
c0105552:	8b 45 08             	mov    0x8(%ebp),%eax
c0105555:	8b 40 10             	mov    0x10(%eax),%eax
c0105558:	89 85 7c ff ff ff    	mov    %eax,-0x84(%ebp)
c010555e:	83 ec 08             	sub    $0x8,%esp
c0105561:	ff 75 88             	pushl  -0x78(%ebp)
c0105564:	ff b5 7c ff ff ff    	pushl  -0x84(%ebp)
c010556a:	e8 b0 08 00 00       	call   c0105e1f <alloc_virtual_memory>
c010556f:	83 c4 10             	add    $0x10,%esp
c0105572:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0105578:	8b 45 08             	mov    0x8(%ebp),%eax
c010557b:	8b 40 2c             	mov    0x2c(%eax),%eax
c010557e:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
c0105584:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c010558b:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0105591:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105594:	eb 1a                	jmp    c01055b0 <do_exec+0x311>
c0105596:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c010559a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010559d:	8b 10                	mov    (%eax),%edx
c010559f:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c01055a5:	01 c2                	add    %eax,%edx
c01055a7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01055aa:	89 10                	mov    %edx,(%eax)
c01055ac:	83 45 dc 04          	addl   $0x4,-0x24(%ebp)
c01055b0:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01055b3:	8b 00                	mov    (%eax),%eax
c01055b5:	85 c0                	test   %eax,%eax
c01055b7:	75 dd                	jne    c0105596 <do_exec+0x2f7>
c01055b9:	83 ec 0c             	sub    $0xc,%esp
c01055bc:	ff 75 84             	pushl  -0x7c(%ebp)
c01055bf:	e8 5b 08 00 00       	call   c0105e1f <alloc_virtual_memory>
c01055c4:	83 c4 10             	add    $0x10,%esp
c01055c7:	89 85 70 ff ff ff    	mov    %eax,-0x90(%ebp)
c01055cd:	8b 95 78 ff ff ff    	mov    -0x88(%ebp),%edx
c01055d3:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
c01055d9:	83 ec 04             	sub    $0x4,%esp
c01055dc:	ff 75 88             	pushl  -0x78(%ebp)
c01055df:	52                   	push   %edx
c01055e0:	50                   	push   %eax
c01055e1:	e8 a6 16 00 00       	call   c0106c8c <Memcpy>
c01055e6:	83 c4 10             	add    $0x10,%esp
c01055e9:	8b 45 08             	mov    0x8(%ebp),%eax
c01055ec:	8b 40 28             	mov    0x28(%eax),%eax
c01055ef:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c01055f5:	83 ec 08             	sub    $0x8,%esp
c01055f8:	ff 75 d4             	pushl  -0x2c(%ebp)
c01055fb:	ff 75 80             	pushl  -0x80(%ebp)
c01055fe:	e8 ef 08 00 00       	call   c0105ef2 <get_physical_address_proc>
c0105603:	83 c4 10             	add    $0x10,%esp
c0105606:	89 85 68 ff ff ff    	mov    %eax,-0x98(%ebp)
c010560c:	83 ec 08             	sub    $0x8,%esp
c010560f:	68 00 10 00 00       	push   $0x1000
c0105614:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
c010561a:	e8 00 08 00 00       	call   c0105e1f <alloc_virtual_memory>
c010561f:	83 c4 10             	add    $0x10,%esp
c0105622:	89 85 64 ff ff ff    	mov    %eax,-0x9c(%ebp)
c0105628:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
c010562e:	05 bc 0f 00 00       	add    $0xfbc,%eax
c0105633:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
c0105639:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c010563f:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0105645:	89 50 20             	mov    %edx,0x20(%eax)
c0105648:	8b 55 e0             	mov    -0x20(%ebp),%edx
c010564b:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c0105651:	89 50 28             	mov    %edx,0x28(%eax)
c0105654:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0105657:	8b 40 18             	mov    0x18(%eax),%eax
c010565a:	89 c2                	mov    %eax,%edx
c010565c:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c0105662:	89 50 30             	mov    %edx,0x30(%eax)
c0105665:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c010566b:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0105671:	89 50 3c             	mov    %edx,0x3c(%eax)
c0105674:	8b 45 80             	mov    -0x80(%ebp),%eax
c0105677:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c010567e:	00 00 00 
c0105681:	c7 85 44 ff ff ff 65 	movl   $0x65,-0xbc(%ebp)
c0105688:	00 00 00 
c010568b:	c7 85 24 ff ff ff 00 	movl   $0x0,-0xdc(%ebp)
c0105692:	00 00 00 
c0105695:	c7 85 28 ff ff ff 00 	movl   $0x0,-0xd8(%ebp)
c010569c:	00 00 00 
c010569f:	83 ec 04             	sub    $0x4,%esp
c01056a2:	ff 75 d4             	pushl  -0x2c(%ebp)
c01056a5:	8d 85 cc fe ff ff    	lea    -0x134(%ebp),%eax
c01056ab:	50                   	push   %eax
c01056ac:	6a 01                	push   $0x1
c01056ae:	e8 62 3e 00 00       	call   c0109515 <send_rec>
c01056b3:	83 c4 10             	add    $0x10,%esp
c01056b6:	c9                   	leave  
c01056b7:	c3                   	ret    

c01056b8 <do_fork>:
c01056b8:	55                   	push   %ebp
c01056b9:	89 e5                	mov    %esp,%ebp
c01056bb:	81 ec 98 00 00 00    	sub    $0x98,%esp
c01056c1:	8b 45 08             	mov    0x8(%ebp),%eax
c01056c4:	8b 00                	mov    (%eax),%eax
c01056c6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01056c9:	83 ec 0c             	sub    $0xc,%esp
c01056cc:	ff 75 f4             	pushl  -0xc(%ebp)
c01056cf:	e8 3c 47 00 00       	call   c0109e10 <fork_process>
c01056d4:	83 c4 10             	add    $0x10,%esp
c01056d7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01056da:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01056dd:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c01056e3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01056e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01056e9:	8b 90 14 01 00 00    	mov    0x114(%eax),%edx
c01056ef:	8b 45 08             	mov    0x8(%ebp),%eax
c01056f2:	89 50 5c             	mov    %edx,0x5c(%eax)
c01056f5:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c01056fc:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0105703:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c010570a:	83 ec 04             	sub    $0x4,%esp
c010570d:	ff 75 ec             	pushl  -0x14(%ebp)
c0105710:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
c0105716:	50                   	push   %eax
c0105717:	6a 01                	push   $0x1
c0105719:	e8 f7 3d 00 00       	call   c0109515 <send_rec>
c010571e:	83 c4 10             	add    $0x10,%esp
c0105721:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105724:	c9                   	leave  
c0105725:	c3                   	ret    

c0105726 <do_exit>:
c0105726:	55                   	push   %ebp
c0105727:	89 e5                	mov    %esp,%ebp
c0105729:	83 ec 18             	sub    $0x18,%esp
c010572c:	8b 45 08             	mov    0x8(%ebp),%eax
c010572f:	8b 00                	mov    (%eax),%eax
c0105731:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105734:	83 ec 0c             	sub    $0xc,%esp
c0105737:	ff 75 f4             	pushl  -0xc(%ebp)
c010573a:	e8 97 e0 ff ff       	call   c01037d6 <pid2proc>
c010573f:	83 c4 10             	add    $0x10,%esp
c0105742:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105745:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105748:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c010574e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105751:	83 ec 0c             	sub    $0xc,%esp
c0105754:	ff 75 ec             	pushl  -0x14(%ebp)
c0105757:	e8 7a e0 ff ff       	call   c01037d6 <pid2proc>
c010575c:	83 c4 10             	add    $0x10,%esp
c010575f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105762:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0105766:	74 45                	je     c01057ad <do_exit+0x87>
c0105768:	8b 45 08             	mov    0x8(%ebp),%eax
c010576b:	8b 40 54             	mov    0x54(%eax),%eax
c010576e:	89 c2                	mov    %eax,%edx
c0105770:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105773:	89 90 5c 02 00 00    	mov    %edx,0x25c(%eax)
c0105779:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010577c:	0f b6 80 3d 02 00 00 	movzbl 0x23d(%eax),%eax
c0105783:	3c 04                	cmp    $0x4,%al
c0105785:	75 1a                	jne    c01057a1 <do_exit+0x7b>
c0105787:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010578a:	c6 80 3d 02 00 00 fb 	movb   $0xfb,0x23d(%eax)
c0105791:	83 ec 0c             	sub    $0xc,%esp
c0105794:	ff 75 f0             	pushl  -0x10(%ebp)
c0105797:	e8 33 01 00 00       	call   c01058cf <cleanup>
c010579c:	83 c4 10             	add    $0x10,%esp
c010579f:	eb 0d                	jmp    c01057ae <do_exit+0x88>
c01057a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01057a4:	c6 80 3c 02 00 00 03 	movb   $0x3,0x23c(%eax)
c01057ab:	eb 01                	jmp    c01057ae <do_exit+0x88>
c01057ad:	90                   	nop
c01057ae:	c9                   	leave  
c01057af:	c3                   	ret    

c01057b0 <do_wait>:
c01057b0:	55                   	push   %ebp
c01057b1:	89 e5                	mov    %esp,%ebp
c01057b3:	81 ec a8 00 00 00    	sub    $0xa8,%esp
c01057b9:	8b 45 08             	mov    0x8(%ebp),%eax
c01057bc:	8b 00                	mov    (%eax),%eax
c01057be:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01057c1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01057c8:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01057cf:	83 ec 0c             	sub    $0xc,%esp
c01057d2:	ff 75 ec             	pushl  -0x14(%ebp)
c01057d5:	e8 fc df ff ff       	call   c01037d6 <pid2proc>
c01057da:	83 c4 10             	add    $0x10,%esp
c01057dd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01057e0:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c01057e4:	75 19                	jne    c01057ff <do_wait+0x4f>
c01057e6:	6a 58                	push   $0x58
c01057e8:	68 85 b5 10 c0       	push   $0xc010b585
c01057ed:	68 85 b5 10 c0       	push   $0xc010b585
c01057f2:	68 93 b5 10 c0       	push   $0xc010b593
c01057f7:	e8 a9 30 00 00       	call   c01088a5 <assertion_failure>
c01057fc:	83 c4 10             	add    $0x10,%esp
c01057ff:	a1 ec fd 10 c0       	mov    0xc010fdec,%eax
c0105804:	8b 15 f0 fd 10 c0    	mov    0xc010fdf0,%edx
c010580a:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010580d:	89 55 e0             	mov    %edx,-0x20(%ebp)
c0105810:	a1 f4 fd 10 c0       	mov    0xc010fdf4,%eax
c0105815:	8b 15 f8 fd 10 c0    	mov    0xc010fdf8,%edx
c010581b:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010581e:	89 55 d8             	mov    %edx,-0x28(%ebp)
c0105821:	a1 f0 fd 10 c0       	mov    0xc010fdf0,%eax
c0105826:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105829:	eb 5b                	jmp    c0105886 <do_wait+0xd6>
c010582b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010582e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105833:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105836:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105839:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c010583f:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c0105842:	74 0b                	je     c010584f <do_wait+0x9f>
c0105844:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105847:	8b 40 04             	mov    0x4(%eax),%eax
c010584a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010584d:	eb 37                	jmp    c0105886 <do_wait+0xd6>
c010584f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0105853:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105856:	0f b6 80 3d 02 00 00 	movzbl 0x23d(%eax),%eax
c010585d:	3c 03                	cmp    $0x3,%al
c010585f:	74 0b                	je     c010586c <do_wait+0xbc>
c0105861:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105864:	8b 40 04             	mov    0x4(%eax),%eax
c0105867:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010586a:	eb 1a                	jmp    c0105886 <do_wait+0xd6>
c010586c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010586f:	c6 80 3d 02 00 00 fb 	movb   $0xfb,0x23d(%eax)
c0105876:	83 ec 0c             	sub    $0xc,%esp
c0105879:	ff 75 e8             	pushl  -0x18(%ebp)
c010587c:	e8 4e 00 00 00       	call   c01058cf <cleanup>
c0105881:	83 c4 10             	add    $0x10,%esp
c0105884:	eb 47                	jmp    c01058cd <do_wait+0x11d>
c0105886:	81 7d f0 f4 fd 10 c0 	cmpl   $0xc010fdf4,-0x10(%ebp)
c010588d:	75 9c                	jne    c010582b <do_wait+0x7b>
c010588f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0105893:	74 0c                	je     c01058a1 <do_wait+0xf1>
c0105895:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105898:	c6 80 3d 02 00 00 04 	movb   $0x4,0x23d(%eax)
c010589f:	eb 2c                	jmp    c01058cd <do_wait+0x11d>
c01058a1:	c7 45 d0 65 00 00 00 	movl   $0x65,-0x30(%ebp)
c01058a8:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
c01058af:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
c01058b6:	83 ec 04             	sub    $0x4,%esp
c01058b9:	ff 75 ec             	pushl  -0x14(%ebp)
c01058bc:	8d 85 58 ff ff ff    	lea    -0xa8(%ebp),%eax
c01058c2:	50                   	push   %eax
c01058c3:	6a 01                	push   $0x1
c01058c5:	e8 4b 3c 00 00       	call   c0109515 <send_rec>
c01058ca:	83 c4 10             	add    $0x10,%esp
c01058cd:	c9                   	leave  
c01058ce:	c3                   	ret    

c01058cf <cleanup>:
c01058cf:	55                   	push   %ebp
c01058d0:	89 e5                	mov    %esp,%ebp
c01058d2:	81 ec 88 00 00 00    	sub    $0x88,%esp
c01058d8:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c01058df:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c01058e6:	8b 45 08             	mov    0x8(%ebp),%eax
c01058e9:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c01058ef:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01058f2:	8b 45 08             	mov    0x8(%ebp),%eax
c01058f5:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c01058fb:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01058fe:	8b 45 08             	mov    0x8(%ebp),%eax
c0105901:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0105907:	83 ec 04             	sub    $0x4,%esp
c010590a:	50                   	push   %eax
c010590b:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0105911:	50                   	push   %eax
c0105912:	6a 01                	push   $0x1
c0105914:	e8 fc 3b 00 00       	call   c0109515 <send_rec>
c0105919:	83 c4 10             	add    $0x10,%esp
c010591c:	8b 45 08             	mov    0x8(%ebp),%eax
c010591f:	c6 80 3c 02 00 00 ff 	movb   $0xff,0x23c(%eax)
c0105926:	90                   	nop
c0105927:	c9                   	leave  
c0105928:	c3                   	ret    

c0105929 <init_bitmap>:
c0105929:	55                   	push   %ebp
c010592a:	89 e5                	mov    %esp,%ebp
c010592c:	83 ec 08             	sub    $0x8,%esp
c010592f:	8b 45 08             	mov    0x8(%ebp),%eax
c0105932:	8b 50 04             	mov    0x4(%eax),%edx
c0105935:	8b 45 08             	mov    0x8(%ebp),%eax
c0105938:	8b 00                	mov    (%eax),%eax
c010593a:	83 ec 04             	sub    $0x4,%esp
c010593d:	52                   	push   %edx
c010593e:	6a 00                	push   $0x0
c0105940:	50                   	push   %eax
c0105941:	e8 89 68 00 00       	call   c010c1cf <Memset>
c0105946:	83 c4 10             	add    $0x10,%esp
c0105949:	90                   	nop
c010594a:	c9                   	leave  
c010594b:	c3                   	ret    

c010594c <test_bit_val>:
c010594c:	55                   	push   %ebp
c010594d:	89 e5                	mov    %esp,%ebp
c010594f:	53                   	push   %ebx
c0105950:	83 ec 10             	sub    $0x10,%esp
c0105953:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105956:	8d 50 07             	lea    0x7(%eax),%edx
c0105959:	85 c0                	test   %eax,%eax
c010595b:	0f 48 c2             	cmovs  %edx,%eax
c010595e:	c1 f8 03             	sar    $0x3,%eax
c0105961:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105964:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105967:	99                   	cltd   
c0105968:	c1 ea 1d             	shr    $0x1d,%edx
c010596b:	01 d0                	add    %edx,%eax
c010596d:	83 e0 07             	and    $0x7,%eax
c0105970:	29 d0                	sub    %edx,%eax
c0105972:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105975:	8b 45 08             	mov    0x8(%ebp),%eax
c0105978:	8b 10                	mov    (%eax),%edx
c010597a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010597d:	01 d0                	add    %edx,%eax
c010597f:	0f b6 00             	movzbl (%eax),%eax
c0105982:	88 45 f3             	mov    %al,-0xd(%ebp)
c0105985:	0f be 55 f3          	movsbl -0xd(%ebp),%edx
c0105989:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010598c:	bb 01 00 00 00       	mov    $0x1,%ebx
c0105991:	89 c1                	mov    %eax,%ecx
c0105993:	d3 e3                	shl    %cl,%ebx
c0105995:	89 d8                	mov    %ebx,%eax
c0105997:	21 c2                	and    %eax,%edx
c0105999:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010599c:	89 c1                	mov    %eax,%ecx
c010599e:	d3 fa                	sar    %cl,%edx
c01059a0:	89 d0                	mov    %edx,%eax
c01059a2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01059a5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c01059a9:	0f 9f c0             	setg   %al
c01059ac:	0f b6 c0             	movzbl %al,%eax
c01059af:	83 c4 10             	add    $0x10,%esp
c01059b2:	5b                   	pop    %ebx
c01059b3:	5d                   	pop    %ebp
c01059b4:	c3                   	ret    

c01059b5 <set_bit_val>:
c01059b5:	55                   	push   %ebp
c01059b6:	89 e5                	mov    %esp,%ebp
c01059b8:	83 ec 10             	sub    $0x10,%esp
c01059bb:	8b 45 0c             	mov    0xc(%ebp),%eax
c01059be:	8d 50 07             	lea    0x7(%eax),%edx
c01059c1:	85 c0                	test   %eax,%eax
c01059c3:	0f 48 c2             	cmovs  %edx,%eax
c01059c6:	c1 f8 03             	sar    $0x3,%eax
c01059c9:	89 45 f8             	mov    %eax,-0x8(%ebp)
c01059cc:	8b 45 0c             	mov    0xc(%ebp),%eax
c01059cf:	99                   	cltd   
c01059d0:	c1 ea 1d             	shr    $0x1d,%edx
c01059d3:	01 d0                	add    %edx,%eax
c01059d5:	83 e0 07             	and    $0x7,%eax
c01059d8:	29 d0                	sub    %edx,%eax
c01059da:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01059dd:	8b 45 08             	mov    0x8(%ebp),%eax
c01059e0:	8b 10                	mov    (%eax),%edx
c01059e2:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01059e5:	01 d0                	add    %edx,%eax
c01059e7:	0f b6 00             	movzbl (%eax),%eax
c01059ea:	88 45 ff             	mov    %al,-0x1(%ebp)
c01059ed:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c01059f1:	7e 13                	jle    c0105a06 <set_bit_val+0x51>
c01059f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01059f6:	ba 01 00 00 00       	mov    $0x1,%edx
c01059fb:	89 c1                	mov    %eax,%ecx
c01059fd:	d3 e2                	shl    %cl,%edx
c01059ff:	89 d0                	mov    %edx,%eax
c0105a01:	08 45 ff             	or     %al,-0x1(%ebp)
c0105a04:	eb 13                	jmp    c0105a19 <set_bit_val+0x64>
c0105a06:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105a09:	ba 01 00 00 00       	mov    $0x1,%edx
c0105a0e:	89 c1                	mov    %eax,%ecx
c0105a10:	d3 e2                	shl    %cl,%edx
c0105a12:	89 d0                	mov    %edx,%eax
c0105a14:	f7 d0                	not    %eax
c0105a16:	20 45 ff             	and    %al,-0x1(%ebp)
c0105a19:	8b 45 08             	mov    0x8(%ebp),%eax
c0105a1c:	8b 10                	mov    (%eax),%edx
c0105a1e:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105a21:	01 c2                	add    %eax,%edx
c0105a23:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
c0105a27:	88 02                	mov    %al,(%edx)
c0105a29:	b8 01 00 00 00       	mov    $0x1,%eax
c0105a2e:	c9                   	leave  
c0105a2f:	c3                   	ret    

c0105a30 <set_bits>:
c0105a30:	55                   	push   %ebp
c0105a31:	89 e5                	mov    %esp,%ebp
c0105a33:	83 ec 10             	sub    $0x10,%esp
c0105a36:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0105a3d:	eb 1c                	jmp    c0105a5b <set_bits+0x2b>
c0105a3f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105a42:	8d 50 01             	lea    0x1(%eax),%edx
c0105a45:	89 55 0c             	mov    %edx,0xc(%ebp)
c0105a48:	ff 75 10             	pushl  0x10(%ebp)
c0105a4b:	50                   	push   %eax
c0105a4c:	ff 75 08             	pushl  0x8(%ebp)
c0105a4f:	e8 61 ff ff ff       	call   c01059b5 <set_bit_val>
c0105a54:	83 c4 0c             	add    $0xc,%esp
c0105a57:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0105a5b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105a5e:	3b 45 14             	cmp    0x14(%ebp),%eax
c0105a61:	7c dc                	jl     c0105a3f <set_bits+0xf>
c0105a63:	b8 01 00 00 00       	mov    $0x1,%eax
c0105a68:	c9                   	leave  
c0105a69:	c3                   	ret    

c0105a6a <get_first_free_bit>:
c0105a6a:	55                   	push   %ebp
c0105a6b:	89 e5                	mov    %esp,%ebp
c0105a6d:	83 ec 10             	sub    $0x10,%esp
c0105a70:	8b 45 08             	mov    0x8(%ebp),%eax
c0105a73:	8b 40 04             	mov    0x4(%eax),%eax
c0105a76:	c1 e0 03             	shl    $0x3,%eax
c0105a79:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105a7c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105a7f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105a82:	eb 1b                	jmp    c0105a9f <get_first_free_bit+0x35>
c0105a84:	ff 75 fc             	pushl  -0x4(%ebp)
c0105a87:	ff 75 08             	pushl  0x8(%ebp)
c0105a8a:	e8 bd fe ff ff       	call   c010594c <test_bit_val>
c0105a8f:	83 c4 08             	add    $0x8,%esp
c0105a92:	85 c0                	test   %eax,%eax
c0105a94:	75 05                	jne    c0105a9b <get_first_free_bit+0x31>
c0105a96:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105a99:	eb 11                	jmp    c0105aac <get_first_free_bit+0x42>
c0105a9b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0105a9f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105aa2:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c0105aa5:	7c dd                	jl     c0105a84 <get_first_free_bit+0x1a>
c0105aa7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0105aac:	c9                   	leave  
c0105aad:	c3                   	ret    

c0105aae <get_bits>:
c0105aae:	55                   	push   %ebp
c0105aaf:	89 e5                	mov    %esp,%ebp
c0105ab1:	83 ec 20             	sub    $0x20,%esp
c0105ab4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0105abb:	ff 75 f0             	pushl  -0x10(%ebp)
c0105abe:	ff 75 08             	pushl  0x8(%ebp)
c0105ac1:	e8 a4 ff ff ff       	call   c0105a6a <get_first_free_bit>
c0105ac6:	83 c4 08             	add    $0x8,%esp
c0105ac9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105acc:	8b 45 08             	mov    0x8(%ebp),%eax
c0105acf:	8b 40 04             	mov    0x4(%eax),%eax
c0105ad2:	c1 e0 03             	shl    $0x3,%eax
c0105ad5:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105ad8:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105adb:	83 e8 01             	sub    $0x1,%eax
c0105ade:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105ae1:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c0105ae5:	75 08                	jne    c0105aef <get_bits+0x41>
c0105ae7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105aea:	e9 85 00 00 00       	jmp    c0105b74 <get_bits+0xc6>
c0105aef:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105af2:	83 c0 01             	add    $0x1,%eax
c0105af5:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105af8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105afb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105afe:	eb 58                	jmp    c0105b58 <get_bits+0xaa>
c0105b00:	ff 75 f8             	pushl  -0x8(%ebp)
c0105b03:	ff 75 08             	pushl  0x8(%ebp)
c0105b06:	e8 41 fe ff ff       	call   c010594c <test_bit_val>
c0105b0b:	83 c4 08             	add    $0x8,%esp
c0105b0e:	85 c0                	test   %eax,%eax
c0105b10:	75 0a                	jne    c0105b1c <get_bits+0x6e>
c0105b12:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0105b16:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0105b1a:	eb 2b                	jmp    c0105b47 <get_bits+0x99>
c0105b1c:	6a 00                	push   $0x0
c0105b1e:	ff 75 08             	pushl  0x8(%ebp)
c0105b21:	e8 44 ff ff ff       	call   c0105a6a <get_first_free_bit>
c0105b26:	83 c4 08             	add    $0x8,%esp
c0105b29:	83 c0 01             	add    $0x1,%eax
c0105b2c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105b2f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105b32:	83 c0 01             	add    $0x1,%eax
c0105b35:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105b38:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105b3b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105b3e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105b41:	83 e8 01             	sub    $0x1,%eax
c0105b44:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105b47:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105b4a:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c0105b4d:	7c 09                	jl     c0105b58 <get_bits+0xaa>
c0105b4f:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c0105b56:	eb 0d                	jmp    c0105b65 <get_bits+0xb7>
c0105b58:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105b5b:	8d 50 ff             	lea    -0x1(%eax),%edx
c0105b5e:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0105b61:	85 c0                	test   %eax,%eax
c0105b63:	7f 9b                	jg     c0105b00 <get_bits+0x52>
c0105b65:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105b68:	2b 45 0c             	sub    0xc(%ebp),%eax
c0105b6b:	83 c0 01             	add    $0x1,%eax
c0105b6e:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105b71:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105b74:	c9                   	leave  
c0105b75:	c3                   	ret    

c0105b76 <get_a_page>:
c0105b76:	55                   	push   %ebp
c0105b77:	89 e5                	mov    %esp,%ebp
c0105b79:	83 ec 28             	sub    $0x28,%esp
c0105b7c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0105b80:	75 22                	jne    c0105ba4 <get_a_page+0x2e>
c0105b82:	a1 ac 06 11 c0       	mov    0xc01106ac,%eax
c0105b87:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105b8a:	a1 b0 06 11 c0       	mov    0xc01106b0,%eax
c0105b8f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105b92:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0105b97:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105b9a:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c0105b9f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105ba2:	eb 20                	jmp    c0105bc4 <get_a_page+0x4e>
c0105ba4:	a1 f4 0e 11 c0       	mov    0xc0110ef4,%eax
c0105ba9:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105bac:	a1 f8 0e 11 c0       	mov    0xc0110ef8,%eax
c0105bb1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105bb4:	a1 fc 0e 11 c0       	mov    0xc0110efc,%eax
c0105bb9:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105bbc:	a1 00 0f 11 c0       	mov    0xc0110f00,%eax
c0105bc1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105bc4:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105bc7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0105bca:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105bcd:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0105bd0:	6a 01                	push   $0x1
c0105bd2:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105bd5:	50                   	push   %eax
c0105bd6:	e8 d3 fe ff ff       	call   c0105aae <get_bits>
c0105bdb:	83 c4 08             	add    $0x8,%esp
c0105bde:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105be1:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c0105be5:	75 1c                	jne    c0105c03 <get_a_page+0x8d>
c0105be7:	68 84 00 00 00       	push   $0x84
c0105bec:	68 a6 b5 10 c0       	push   $0xc010b5a6
c0105bf1:	68 a6 b5 10 c0       	push   $0xc010b5a6
c0105bf6:	68 b0 b5 10 c0       	push   $0xc010b5b0
c0105bfb:	e8 a5 2c 00 00       	call   c01088a5 <assertion_failure>
c0105c00:	83 c4 10             	add    $0x10,%esp
c0105c03:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105c06:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0105c09:	c1 e2 0c             	shl    $0xc,%edx
c0105c0c:	01 d0                	add    %edx,%eax
c0105c0e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105c11:	83 ec 04             	sub    $0x4,%esp
c0105c14:	6a 01                	push   $0x1
c0105c16:	ff 75 f4             	pushl  -0xc(%ebp)
c0105c19:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105c1c:	50                   	push   %eax
c0105c1d:	e8 93 fd ff ff       	call   c01059b5 <set_bit_val>
c0105c22:	83 c4 10             	add    $0x10,%esp
c0105c25:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105c28:	c9                   	leave  
c0105c29:	c3                   	ret    

c0105c2a <get_virtual_address_start_with_addr>:
c0105c2a:	55                   	push   %ebp
c0105c2b:	89 e5                	mov    %esp,%ebp
c0105c2d:	83 ec 38             	sub    $0x38,%esp
c0105c30:	e8 b7 a7 ff ff       	call   c01003ec <get_running_thread_pcb>
c0105c35:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105c38:	83 ec 0c             	sub    $0xc,%esp
c0105c3b:	ff 75 10             	pushl  0x10(%ebp)
c0105c3e:	e8 93 db ff ff       	call   c01037d6 <pid2proc>
c0105c43:	83 c4 10             	add    $0x10,%esp
c0105c46:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105c49:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105c4c:	8b 40 0c             	mov    0xc(%eax),%eax
c0105c4f:	83 ec 04             	sub    $0x4,%esp
c0105c52:	6a 0c                	push   $0xc
c0105c54:	50                   	push   %eax
c0105c55:	8d 45 dc             	lea    -0x24(%ebp),%eax
c0105c58:	50                   	push   %eax
c0105c59:	e8 2e 10 00 00       	call   c0106c8c <Memcpy>
c0105c5e:	83 c4 10             	add    $0x10,%esp
c0105c61:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105c64:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0105c67:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0105c6a:	89 55 d8             	mov    %edx,-0x28(%ebp)
c0105c6d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105c70:	8b 55 08             	mov    0x8(%ebp),%edx
c0105c73:	29 c2                	sub    %eax,%edx
c0105c75:	89 d0                	mov    %edx,%eax
c0105c77:	c1 e8 0c             	shr    $0xc,%eax
c0105c7a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105c7d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0105c81:	79 1c                	jns    c0105c9f <get_virtual_address_start_with_addr+0x75>
c0105c83:	68 97 00 00 00       	push   $0x97
c0105c88:	68 a6 b5 10 c0       	push   $0xc010b5a6
c0105c8d:	68 a6 b5 10 c0       	push   $0xc010b5a6
c0105c92:	68 bc b5 10 c0       	push   $0xc010b5bc
c0105c97:	e8 09 2c 00 00       	call   c01088a5 <assertion_failure>
c0105c9c:	83 c4 10             	add    $0x10,%esp
c0105c9f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105ca2:	50                   	push   %eax
c0105ca3:	6a 01                	push   $0x1
c0105ca5:	ff 75 ec             	pushl  -0x14(%ebp)
c0105ca8:	8d 45 d4             	lea    -0x2c(%ebp),%eax
c0105cab:	50                   	push   %eax
c0105cac:	e8 7f fd ff ff       	call   c0105a30 <set_bits>
c0105cb1:	83 c4 10             	add    $0x10,%esp
c0105cb4:	8b 45 08             	mov    0x8(%ebp),%eax
c0105cb7:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105cbc:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105cbf:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105cc2:	c9                   	leave  
c0105cc3:	c3                   	ret    

c0105cc4 <get_virtual_address>:
c0105cc4:	55                   	push   %ebp
c0105cc5:	89 e5                	mov    %esp,%ebp
c0105cc7:	83 ec 28             	sub    $0x28,%esp
c0105cca:	e8 1d a7 ff ff       	call   c01003ec <get_running_thread_pcb>
c0105ccf:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105cd2:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0105cd6:	75 1a                	jne    c0105cf2 <get_virtual_address+0x2e>
c0105cd8:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0105cdd:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105ce0:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0105ce5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105ce8:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c0105ced:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105cf0:	eb 18                	jmp    c0105d0a <get_virtual_address+0x46>
c0105cf2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105cf5:	8b 40 0c             	mov    0xc(%eax),%eax
c0105cf8:	83 ec 04             	sub    $0x4,%esp
c0105cfb:	6a 0c                	push   $0xc
c0105cfd:	50                   	push   %eax
c0105cfe:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0105d01:	50                   	push   %eax
c0105d02:	e8 85 0f 00 00       	call   c0106c8c <Memcpy>
c0105d07:	83 c4 10             	add    $0x10,%esp
c0105d0a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105d0d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0105d10:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105d13:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0105d16:	8b 45 08             	mov    0x8(%ebp),%eax
c0105d19:	83 ec 08             	sub    $0x8,%esp
c0105d1c:	50                   	push   %eax
c0105d1d:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105d20:	50                   	push   %eax
c0105d21:	e8 88 fd ff ff       	call   c0105aae <get_bits>
c0105d26:	83 c4 10             	add    $0x10,%esp
c0105d29:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105d2c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105d2f:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0105d32:	c1 e2 0c             	shl    $0xc,%edx
c0105d35:	01 d0                	add    %edx,%eax
c0105d37:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105d3a:	8b 45 08             	mov    0x8(%ebp),%eax
c0105d3d:	50                   	push   %eax
c0105d3e:	6a 01                	push   $0x1
c0105d40:	ff 75 f0             	pushl  -0x10(%ebp)
c0105d43:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105d46:	50                   	push   %eax
c0105d47:	e8 e4 fc ff ff       	call   c0105a30 <set_bits>
c0105d4c:	83 c4 10             	add    $0x10,%esp
c0105d4f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105d52:	c9                   	leave  
c0105d53:	c3                   	ret    

c0105d54 <ptr_pde>:
c0105d54:	55                   	push   %ebp
c0105d55:	89 e5                	mov    %esp,%ebp
c0105d57:	8b 45 08             	mov    0x8(%ebp),%eax
c0105d5a:	c1 e8 16             	shr    $0x16,%eax
c0105d5d:	05 00 fc ff 3f       	add    $0x3ffffc00,%eax
c0105d62:	c1 e0 02             	shl    $0x2,%eax
c0105d65:	5d                   	pop    %ebp
c0105d66:	c3                   	ret    

c0105d67 <ptr_pte>:
c0105d67:	55                   	push   %ebp
c0105d68:	89 e5                	mov    %esp,%ebp
c0105d6a:	8b 45 08             	mov    0x8(%ebp),%eax
c0105d6d:	c1 e8 0a             	shr    $0xa,%eax
c0105d70:	25 00 f0 3f 00       	and    $0x3ff000,%eax
c0105d75:	89 c2                	mov    %eax,%edx
c0105d77:	8b 45 08             	mov    0x8(%ebp),%eax
c0105d7a:	c1 e8 0c             	shr    $0xc,%eax
c0105d7d:	25 ff 03 00 00       	and    $0x3ff,%eax
c0105d82:	c1 e0 02             	shl    $0x2,%eax
c0105d85:	01 d0                	add    %edx,%eax
c0105d87:	2d 00 00 40 00       	sub    $0x400000,%eax
c0105d8c:	5d                   	pop    %ebp
c0105d8d:	c3                   	ret    

c0105d8e <add_map_entry>:
c0105d8e:	55                   	push   %ebp
c0105d8f:	89 e5                	mov    %esp,%ebp
c0105d91:	83 ec 18             	sub    $0x18,%esp
c0105d94:	ff 75 08             	pushl  0x8(%ebp)
c0105d97:	e8 b8 ff ff ff       	call   c0105d54 <ptr_pde>
c0105d9c:	83 c4 04             	add    $0x4,%esp
c0105d9f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105da2:	ff 75 08             	pushl  0x8(%ebp)
c0105da5:	e8 bd ff ff ff       	call   c0105d67 <ptr_pte>
c0105daa:	83 c4 04             	add    $0x4,%esp
c0105dad:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105db0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105db3:	8b 00                	mov    (%eax),%eax
c0105db5:	83 e0 01             	and    $0x1,%eax
c0105db8:	85 c0                	test   %eax,%eax
c0105dba:	74 1b                	je     c0105dd7 <add_map_entry+0x49>
c0105dbc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105dbf:	8b 00                	mov    (%eax),%eax
c0105dc1:	83 e0 01             	and    $0x1,%eax
c0105dc4:	85 c0                	test   %eax,%eax
c0105dc6:	75 54                	jne    c0105e1c <add_map_entry+0x8e>
c0105dc8:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105dcb:	83 c8 07             	or     $0x7,%eax
c0105dce:	89 c2                	mov    %eax,%edx
c0105dd0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105dd3:	89 10                	mov    %edx,(%eax)
c0105dd5:	eb 45                	jmp    c0105e1c <add_map_entry+0x8e>
c0105dd7:	83 ec 0c             	sub    $0xc,%esp
c0105dda:	6a 00                	push   $0x0
c0105ddc:	e8 95 fd ff ff       	call   c0105b76 <get_a_page>
c0105de1:	83 c4 10             	add    $0x10,%esp
c0105de4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105de7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105dea:	83 c8 07             	or     $0x7,%eax
c0105ded:	89 c2                	mov    %eax,%edx
c0105def:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105df2:	89 10                	mov    %edx,(%eax)
c0105df4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105df7:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105dfc:	83 ec 04             	sub    $0x4,%esp
c0105dff:	68 00 10 00 00       	push   $0x1000
c0105e04:	6a 00                	push   $0x0
c0105e06:	50                   	push   %eax
c0105e07:	e8 c3 63 00 00       	call   c010c1cf <Memset>
c0105e0c:	83 c4 10             	add    $0x10,%esp
c0105e0f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105e12:	83 c8 07             	or     $0x7,%eax
c0105e15:	89 c2                	mov    %eax,%edx
c0105e17:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105e1a:	89 10                	mov    %edx,(%eax)
c0105e1c:	90                   	nop
c0105e1d:	c9                   	leave  
c0105e1e:	c3                   	ret    

c0105e1f <alloc_virtual_memory>:
c0105e1f:	55                   	push   %ebp
c0105e20:	89 e5                	mov    %esp,%ebp
c0105e22:	83 ec 28             	sub    $0x28,%esp
c0105e25:	8b 45 08             	mov    0x8(%ebp),%eax
c0105e28:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105e2d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105e30:	8b 45 08             	mov    0x8(%ebp),%eax
c0105e33:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0105e36:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105e39:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105e3c:	01 45 e4             	add    %eax,-0x1c(%ebp)
c0105e3f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105e42:	05 ff 0f 00 00       	add    $0xfff,%eax
c0105e47:	c1 e8 0c             	shr    $0xc,%eax
c0105e4a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105e4d:	e8 9a a5 ff ff       	call   c01003ec <get_running_thread_pcb>
c0105e52:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105e55:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105e58:	8b 50 08             	mov    0x8(%eax),%edx
c0105e5b:	a1 28 0f 11 c0       	mov    0xc0110f28,%eax
c0105e60:	39 c2                	cmp    %eax,%edx
c0105e62:	75 09                	jne    c0105e6d <alloc_virtual_memory+0x4e>
c0105e64:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0105e6b:	eb 07                	jmp    c0105e74 <alloc_virtual_memory+0x55>
c0105e6d:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0105e74:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0105e7b:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0105e82:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0105e89:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0105e90:	eb 47                	jmp    c0105ed9 <alloc_virtual_memory+0xba>
c0105e92:	83 ec 08             	sub    $0x8,%esp
c0105e95:	ff 75 f0             	pushl  -0x10(%ebp)
c0105e98:	6a 01                	push   $0x1
c0105e9a:	e8 25 fe ff ff       	call   c0105cc4 <get_virtual_address>
c0105e9f:	83 c4 10             	add    $0x10,%esp
c0105ea2:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105ea5:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0105ea9:	74 13                	je     c0105ebe <alloc_virtual_memory+0x9f>
c0105eab:	83 ec 0c             	sub    $0xc,%esp
c0105eae:	ff 75 f0             	pushl  -0x10(%ebp)
c0105eb1:	e8 c0 fc ff ff       	call   c0105b76 <get_a_page>
c0105eb6:	83 c4 10             	add    $0x10,%esp
c0105eb9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105ebc:	eb 06                	jmp    c0105ec4 <alloc_virtual_memory+0xa5>
c0105ebe:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0105ec1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105ec4:	83 ec 08             	sub    $0x8,%esp
c0105ec7:	ff 75 f4             	pushl  -0xc(%ebp)
c0105eca:	ff 75 d8             	pushl  -0x28(%ebp)
c0105ecd:	e8 bc fe ff ff       	call   c0105d8e <add_map_entry>
c0105ed2:	83 c4 10             	add    $0x10,%esp
c0105ed5:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0105ed9:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105edc:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c0105edf:	72 b1                	jb     c0105e92 <alloc_virtual_memory+0x73>
c0105ee1:	8b 45 08             	mov    0x8(%ebp),%eax
c0105ee4:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105ee9:	89 c2                	mov    %eax,%edx
c0105eeb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105eee:	01 d0                	add    %edx,%eax
c0105ef0:	c9                   	leave  
c0105ef1:	c3                   	ret    

c0105ef2 <get_physical_address_proc>:
c0105ef2:	55                   	push   %ebp
c0105ef3:	89 e5                	mov    %esp,%ebp
c0105ef5:	83 ec 18             	sub    $0x18,%esp
c0105ef8:	e8 13 a4 ff ff       	call   c0100310 <disable_int>
c0105efd:	e8 ea a4 ff ff       	call   c01003ec <get_running_thread_pcb>
c0105f02:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105f05:	83 ec 0c             	sub    $0xc,%esp
c0105f08:	ff 75 0c             	pushl  0xc(%ebp)
c0105f0b:	e8 c6 d8 ff ff       	call   c01037d6 <pid2proc>
c0105f10:	83 c4 10             	add    $0x10,%esp
c0105f13:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105f16:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105f19:	8b 40 08             	mov    0x8(%eax),%eax
c0105f1c:	83 ec 0c             	sub    $0xc,%esp
c0105f1f:	50                   	push   %eax
c0105f20:	e8 ab a4 ff ff       	call   c01003d0 <update_cr3>
c0105f25:	83 c4 10             	add    $0x10,%esp
c0105f28:	83 ec 0c             	sub    $0xc,%esp
c0105f2b:	ff 75 08             	pushl  0x8(%ebp)
c0105f2e:	e8 34 fe ff ff       	call   c0105d67 <ptr_pte>
c0105f33:	83 c4 10             	add    $0x10,%esp
c0105f36:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105f39:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105f3c:	8b 00                	mov    (%eax),%eax
c0105f3e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105f43:	89 c2                	mov    %eax,%edx
c0105f45:	8b 45 08             	mov    0x8(%ebp),%eax
c0105f48:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105f4d:	09 d0                	or     %edx,%eax
c0105f4f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105f52:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105f55:	8b 40 08             	mov    0x8(%eax),%eax
c0105f58:	83 ec 0c             	sub    $0xc,%esp
c0105f5b:	50                   	push   %eax
c0105f5c:	e8 6f a4 ff ff       	call   c01003d0 <update_cr3>
c0105f61:	83 c4 10             	add    $0x10,%esp
c0105f64:	e8 a9 a3 ff ff       	call   c0100312 <enable_int>
c0105f69:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105f6c:	c9                   	leave  
c0105f6d:	c3                   	ret    

c0105f6e <get_physical_address>:
c0105f6e:	55                   	push   %ebp
c0105f6f:	89 e5                	mov    %esp,%ebp
c0105f71:	83 ec 10             	sub    $0x10,%esp
c0105f74:	ff 75 08             	pushl  0x8(%ebp)
c0105f77:	e8 eb fd ff ff       	call   c0105d67 <ptr_pte>
c0105f7c:	83 c4 04             	add    $0x4,%esp
c0105f7f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105f82:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105f85:	8b 00                	mov    (%eax),%eax
c0105f87:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105f8c:	89 c2                	mov    %eax,%edx
c0105f8e:	8b 45 08             	mov    0x8(%ebp),%eax
c0105f91:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105f96:	09 d0                	or     %edx,%eax
c0105f98:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105f9b:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105f9e:	c9                   	leave  
c0105f9f:	c3                   	ret    

c0105fa0 <alloc_physical_memory_of_proc>:
c0105fa0:	55                   	push   %ebp
c0105fa1:	89 e5                	mov    %esp,%ebp
c0105fa3:	83 ec 48             	sub    $0x48,%esp
c0105fa6:	e8 65 a3 ff ff       	call   c0100310 <disable_int>
c0105fab:	8b 45 08             	mov    0x8(%ebp),%eax
c0105fae:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105fb3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105fb6:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0105fbd:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105fc0:	83 ec 0c             	sub    $0xc,%esp
c0105fc3:	50                   	push   %eax
c0105fc4:	e8 0d d8 ff ff       	call   c01037d6 <pid2proc>
c0105fc9:	83 c4 10             	add    $0x10,%esp
c0105fcc:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105fcf:	e8 18 a4 ff ff       	call   c01003ec <get_running_thread_pcb>
c0105fd4:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105fd7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105fda:	8b 40 0c             	mov    0xc(%eax),%eax
c0105fdd:	83 ec 04             	sub    $0x4,%esp
c0105fe0:	6a 0c                	push   $0xc
c0105fe2:	50                   	push   %eax
c0105fe3:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0105fe6:	50                   	push   %eax
c0105fe7:	e8 a0 0c 00 00       	call   c0106c8c <Memcpy>
c0105fec:	83 c4 10             	add    $0x10,%esp
c0105fef:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0105ff2:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0105ff5:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0105ff8:	89 55 c8             	mov    %edx,-0x38(%ebp)
c0105ffb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0105ffe:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106001:	29 c2                	sub    %eax,%edx
c0106003:	89 d0                	mov    %edx,%eax
c0106005:	c1 e8 0c             	shr    $0xc,%eax
c0106008:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010600b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010600e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0106011:	c1 e2 0c             	shl    $0xc,%edx
c0106014:	01 d0                	add    %edx,%eax
c0106016:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106019:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010601c:	6a 01                	push   $0x1
c010601e:	6a 01                	push   $0x1
c0106020:	50                   	push   %eax
c0106021:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0106024:	50                   	push   %eax
c0106025:	e8 06 fa ff ff       	call   c0105a30 <set_bits>
c010602a:	83 c4 10             	add    $0x10,%esp
c010602d:	83 ec 0c             	sub    $0xc,%esp
c0106030:	ff 75 f0             	pushl  -0x10(%ebp)
c0106033:	e8 3e fb ff ff       	call   c0105b76 <get_a_page>
c0106038:	83 c4 10             	add    $0x10,%esp
c010603b:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010603e:	8b 45 08             	mov    0x8(%ebp),%eax
c0106041:	25 ff 0f 00 00       	and    $0xfff,%eax
c0106046:	89 c2                	mov    %eax,%edx
c0106048:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010604b:	01 d0                	add    %edx,%eax
c010604d:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0106050:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106053:	8b 40 08             	mov    0x8(%eax),%eax
c0106056:	83 ec 0c             	sub    $0xc,%esp
c0106059:	50                   	push   %eax
c010605a:	e8 71 a3 ff ff       	call   c01003d0 <update_cr3>
c010605f:	83 c4 10             	add    $0x10,%esp
c0106062:	83 ec 08             	sub    $0x8,%esp
c0106065:	ff 75 dc             	pushl  -0x24(%ebp)
c0106068:	ff 75 f4             	pushl  -0xc(%ebp)
c010606b:	e8 1e fd ff ff       	call   c0105d8e <add_map_entry>
c0106070:	83 c4 10             	add    $0x10,%esp
c0106073:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106076:	8b 40 08             	mov    0x8(%eax),%eax
c0106079:	83 ec 0c             	sub    $0xc,%esp
c010607c:	50                   	push   %eax
c010607d:	e8 4e a3 ff ff       	call   c01003d0 <update_cr3>
c0106082:	83 c4 10             	add    $0x10,%esp
c0106085:	e8 88 a2 ff ff       	call   c0100312 <enable_int>
c010608a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010608d:	c9                   	leave  
c010608e:	c3                   	ret    

c010608f <alloc_physical_memory>:
c010608f:	55                   	push   %ebp
c0106090:	89 e5                	mov    %esp,%ebp
c0106092:	83 ec 38             	sub    $0x38,%esp
c0106095:	8b 45 08             	mov    0x8(%ebp),%eax
c0106098:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010609d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01060a0:	e8 47 a3 ff ff       	call   c01003ec <get_running_thread_pcb>
c01060a5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01060a8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01060ac:	75 1a                	jne    c01060c8 <alloc_physical_memory+0x39>
c01060ae:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c01060b3:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01060b6:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c01060bb:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01060be:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c01060c3:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01060c6:	eb 18                	jmp    c01060e0 <alloc_physical_memory+0x51>
c01060c8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01060cb:	8b 40 0c             	mov    0xc(%eax),%eax
c01060ce:	83 ec 04             	sub    $0x4,%esp
c01060d1:	6a 0c                	push   $0xc
c01060d3:	50                   	push   %eax
c01060d4:	8d 45 d4             	lea    -0x2c(%ebp),%eax
c01060d7:	50                   	push   %eax
c01060d8:	e8 af 0b 00 00       	call   c0106c8c <Memcpy>
c01060dd:	83 c4 10             	add    $0x10,%esp
c01060e0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01060e3:	8b 55 d8             	mov    -0x28(%ebp),%edx
c01060e6:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01060e9:	89 55 d0             	mov    %edx,-0x30(%ebp)
c01060ec:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01060ef:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01060f2:	29 c2                	sub    %eax,%edx
c01060f4:	89 d0                	mov    %edx,%eax
c01060f6:	c1 e8 0c             	shr    $0xc,%eax
c01060f9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01060fc:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01060ff:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0106102:	c1 e2 0c             	shl    $0xc,%edx
c0106105:	01 d0                	add    %edx,%eax
c0106107:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010610a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010610d:	6a 01                	push   $0x1
c010610f:	6a 01                	push   $0x1
c0106111:	50                   	push   %eax
c0106112:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0106115:	50                   	push   %eax
c0106116:	e8 15 f9 ff ff       	call   c0105a30 <set_bits>
c010611b:	83 c4 10             	add    $0x10,%esp
c010611e:	83 ec 0c             	sub    $0xc,%esp
c0106121:	ff 75 0c             	pushl  0xc(%ebp)
c0106124:	e8 4d fa ff ff       	call   c0105b76 <get_a_page>
c0106129:	83 c4 10             	add    $0x10,%esp
c010612c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010612f:	8b 45 08             	mov    0x8(%ebp),%eax
c0106132:	25 ff 0f 00 00       	and    $0xfff,%eax
c0106137:	89 c2                	mov    %eax,%edx
c0106139:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010613c:	01 d0                	add    %edx,%eax
c010613e:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106141:	83 ec 08             	sub    $0x8,%esp
c0106144:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106147:	ff 75 f4             	pushl  -0xc(%ebp)
c010614a:	e8 3f fc ff ff       	call   c0105d8e <add_map_entry>
c010614f:	83 c4 10             	add    $0x10,%esp
c0106152:	8b 45 08             	mov    0x8(%ebp),%eax
c0106155:	c9                   	leave  
c0106156:	c3                   	ret    

c0106157 <alloc_memory>:
c0106157:	55                   	push   %ebp
c0106158:	89 e5                	mov    %esp,%ebp
c010615a:	83 ec 18             	sub    $0x18,%esp
c010615d:	83 ec 08             	sub    $0x8,%esp
c0106160:	ff 75 0c             	pushl  0xc(%ebp)
c0106163:	ff 75 08             	pushl  0x8(%ebp)
c0106166:	e8 59 fb ff ff       	call   c0105cc4 <get_virtual_address>
c010616b:	83 c4 10             	add    $0x10,%esp
c010616e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0106171:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106174:	2d 00 10 00 00       	sub    $0x1000,%eax
c0106179:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010617c:	eb 29                	jmp    c01061a7 <alloc_memory+0x50>
c010617e:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c0106185:	83 ec 0c             	sub    $0xc,%esp
c0106188:	ff 75 0c             	pushl  0xc(%ebp)
c010618b:	e8 e6 f9 ff ff       	call   c0105b76 <get_a_page>
c0106190:	83 c4 10             	add    $0x10,%esp
c0106193:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106196:	83 ec 08             	sub    $0x8,%esp
c0106199:	ff 75 ec             	pushl  -0x14(%ebp)
c010619c:	ff 75 f4             	pushl  -0xc(%ebp)
c010619f:	e8 ea fb ff ff       	call   c0105d8e <add_map_entry>
c01061a4:	83 c4 10             	add    $0x10,%esp
c01061a7:	8b 45 08             	mov    0x8(%ebp),%eax
c01061aa:	8d 50 ff             	lea    -0x1(%eax),%edx
c01061ad:	89 55 08             	mov    %edx,0x8(%ebp)
c01061b0:	85 c0                	test   %eax,%eax
c01061b2:	75 ca                	jne    c010617e <alloc_memory+0x27>
c01061b4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01061b7:	c9                   	leave  
c01061b8:	c3                   	ret    

c01061b9 <get_a_virtual_page>:
c01061b9:	55                   	push   %ebp
c01061ba:	89 e5                	mov    %esp,%ebp
c01061bc:	83 ec 18             	sub    $0x18,%esp
c01061bf:	83 ec 0c             	sub    $0xc,%esp
c01061c2:	ff 75 08             	pushl  0x8(%ebp)
c01061c5:	e8 ac f9 ff ff       	call   c0105b76 <get_a_page>
c01061ca:	83 c4 10             	add    $0x10,%esp
c01061cd:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01061d0:	8b 45 0c             	mov    0xc(%ebp),%eax
c01061d3:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01061d8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01061db:	83 ec 08             	sub    $0x8,%esp
c01061de:	ff 75 f4             	pushl  -0xc(%ebp)
c01061e1:	ff 75 f0             	pushl  -0x10(%ebp)
c01061e4:	e8 a5 fb ff ff       	call   c0105d8e <add_map_entry>
c01061e9:	83 c4 10             	add    $0x10,%esp
c01061ec:	8b 45 0c             	mov    0xc(%ebp),%eax
c01061ef:	c9                   	leave  
c01061f0:	c3                   	ret    

c01061f1 <block2arena>:
c01061f1:	55                   	push   %ebp
c01061f2:	89 e5                	mov    %esp,%ebp
c01061f4:	83 ec 10             	sub    $0x10,%esp
c01061f7:	8b 45 08             	mov    0x8(%ebp),%eax
c01061fa:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01061ff:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0106202:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106205:	c9                   	leave  
c0106206:	c3                   	ret    

c0106207 <sys_malloc2>:
c0106207:	55                   	push   %ebp
c0106208:	89 e5                	mov    %esp,%ebp
c010620a:	83 ec 68             	sub    $0x68,%esp
c010620d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106214:	e8 d3 a1 ff ff       	call   c01003ec <get_running_thread_pcb>
c0106219:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010621c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010621f:	8b 50 08             	mov    0x8(%eax),%edx
c0106222:	a1 28 0f 11 c0       	mov    0xc0110f28,%eax
c0106227:	39 c2                	cmp    %eax,%edx
c0106229:	75 10                	jne    c010623b <sys_malloc2+0x34>
c010622b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0106232:	c7 45 ec e0 37 18 c0 	movl   $0xc01837e0,-0x14(%ebp)
c0106239:	eb 10                	jmp    c010624b <sys_malloc2+0x44>
c010623b:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0106242:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106245:	83 c0 10             	add    $0x10,%eax
c0106248:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010624b:	81 7d 08 00 04 00 00 	cmpl   $0x400,0x8(%ebp)
c0106252:	76 52                	jbe    c01062a6 <sys_malloc2+0x9f>
c0106254:	8b 45 08             	mov    0x8(%ebp),%eax
c0106257:	05 0b 10 00 00       	add    $0x100b,%eax
c010625c:	c1 e8 0c             	shr    $0xc,%eax
c010625f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0106262:	83 ec 08             	sub    $0x8,%esp
c0106265:	ff 75 f0             	pushl  -0x10(%ebp)
c0106268:	ff 75 d8             	pushl  -0x28(%ebp)
c010626b:	e8 e7 fe ff ff       	call   c0106157 <alloc_memory>
c0106270:	83 c4 10             	add    $0x10,%esp
c0106273:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106276:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106279:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010627c:	8b 45 d0             	mov    -0x30(%ebp),%eax
c010627f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0106285:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106288:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c010628f:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106292:	c6 40 08 01          	movb   $0x1,0x8(%eax)
c0106296:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106299:	05 90 00 00 00       	add    $0x90,%eax
c010629e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01062a1:	e9 f0 01 00 00       	jmp    c0106496 <sys_malloc2+0x28f>
c01062a6:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01062ad:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01062b4:	eb 26                	jmp    c01062dc <sys_malloc2+0xd5>
c01062b6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01062b9:	89 d0                	mov    %edx,%eax
c01062bb:	01 c0                	add    %eax,%eax
c01062bd:	01 d0                	add    %edx,%eax
c01062bf:	c1 e0 03             	shl    $0x3,%eax
c01062c2:	89 c2                	mov    %eax,%edx
c01062c4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01062c7:	01 d0                	add    %edx,%eax
c01062c9:	8b 00                	mov    (%eax),%eax
c01062cb:	39 45 08             	cmp    %eax,0x8(%ebp)
c01062ce:	77 08                	ja     c01062d8 <sys_malloc2+0xd1>
c01062d0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01062d3:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01062d6:	eb 0a                	jmp    c01062e2 <sys_malloc2+0xdb>
c01062d8:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c01062dc:	83 7d e4 09          	cmpl   $0x9,-0x1c(%ebp)
c01062e0:	7e d4                	jle    c01062b6 <sys_malloc2+0xaf>
c01062e2:	83 ec 08             	sub    $0x8,%esp
c01062e5:	ff 75 f0             	pushl  -0x10(%ebp)
c01062e8:	6a 01                	push   $0x1
c01062ea:	e8 68 fe ff ff       	call   c0106157 <alloc_memory>
c01062ef:	83 c4 10             	add    $0x10,%esp
c01062f2:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01062f5:	8b 55 e8             	mov    -0x18(%ebp),%edx
c01062f8:	89 d0                	mov    %edx,%eax
c01062fa:	01 c0                	add    %eax,%eax
c01062fc:	01 d0                	add    %edx,%eax
c01062fe:	c1 e0 03             	shl    $0x3,%eax
c0106301:	89 c2                	mov    %eax,%edx
c0106303:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106306:	01 d0                	add    %edx,%eax
c0106308:	83 ec 04             	sub    $0x4,%esp
c010630b:	6a 18                	push   $0x18
c010630d:	50                   	push   %eax
c010630e:	ff 75 cc             	pushl  -0x34(%ebp)
c0106311:	e8 76 09 00 00       	call   c0106c8c <Memcpy>
c0106316:	83 c4 10             	add    $0x10,%esp
c0106319:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0106320:	e8 03 09 00 00       	call   c0106c28 <intr_disable>
c0106325:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0106328:	8b 55 e8             	mov    -0x18(%ebp),%edx
c010632b:	89 d0                	mov    %edx,%eax
c010632d:	01 c0                	add    %eax,%eax
c010632f:	01 d0                	add    %edx,%eax
c0106331:	c1 e0 03             	shl    $0x3,%eax
c0106334:	89 c2                	mov    %eax,%edx
c0106336:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106339:	01 d0                	add    %edx,%eax
c010633b:	83 c0 08             	add    $0x8,%eax
c010633e:	83 ec 0c             	sub    $0xc,%esp
c0106341:	50                   	push   %eax
c0106342:	e8 1c 3d 00 00       	call   c010a063 <isListEmpty>
c0106347:	83 c4 10             	add    $0x10,%esp
c010634a:	3c 01                	cmp    $0x1,%al
c010634c:	0f 85 c1 00 00 00    	jne    c0106413 <sys_malloc2+0x20c>
c0106352:	c7 45 c8 01 00 00 00 	movl   $0x1,-0x38(%ebp)
c0106359:	83 ec 08             	sub    $0x8,%esp
c010635c:	ff 75 f0             	pushl  -0x10(%ebp)
c010635f:	6a 01                	push   $0x1
c0106361:	e8 f1 fd ff ff       	call   c0106157 <alloc_memory>
c0106366:	83 c4 10             	add    $0x10,%esp
c0106369:	89 45 c0             	mov    %eax,-0x40(%ebp)
c010636c:	8b 45 c0             	mov    -0x40(%ebp),%eax
c010636f:	83 ec 0c             	sub    $0xc,%esp
c0106372:	50                   	push   %eax
c0106373:	e8 79 fe ff ff       	call   c01061f1 <block2arena>
c0106378:	83 c4 10             	add    $0x10,%esp
c010637b:	89 45 bc             	mov    %eax,-0x44(%ebp)
c010637e:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0106381:	89 d0                	mov    %edx,%eax
c0106383:	01 c0                	add    %eax,%eax
c0106385:	01 d0                	add    %edx,%eax
c0106387:	c1 e0 03             	shl    $0x3,%eax
c010638a:	89 c2                	mov    %eax,%edx
c010638c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010638f:	01 d0                	add    %edx,%eax
c0106391:	8b 50 04             	mov    0x4(%eax),%edx
c0106394:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0106397:	89 50 04             	mov    %edx,0x4(%eax)
c010639a:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010639d:	8b 00                	mov    (%eax),%eax
c010639f:	89 45 b8             	mov    %eax,-0x48(%ebp)
c01063a2:	c7 45 b4 0c 00 00 00 	movl   $0xc,-0x4c(%ebp)
c01063a9:	b8 00 10 00 00       	mov    $0x1000,%eax
c01063ae:	2b 45 b4             	sub    -0x4c(%ebp),%eax
c01063b1:	ba 00 00 00 00       	mov    $0x0,%edx
c01063b6:	f7 75 b8             	divl   -0x48(%ebp)
c01063b9:	89 45 b0             	mov    %eax,-0x50(%ebp)
c01063bc:	8b 55 c0             	mov    -0x40(%ebp),%edx
c01063bf:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c01063c2:	01 d0                	add    %edx,%eax
c01063c4:	89 45 ac             	mov    %eax,-0x54(%ebp)
c01063c7:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c01063ce:	eb 3b                	jmp    c010640b <sys_malloc2+0x204>
c01063d0:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01063d3:	0f af 45 b8          	imul   -0x48(%ebp),%eax
c01063d7:	89 c2                	mov    %eax,%edx
c01063d9:	8b 45 ac             	mov    -0x54(%ebp),%eax
c01063dc:	01 d0                	add    %edx,%eax
c01063de:	89 45 a8             	mov    %eax,-0x58(%ebp)
c01063e1:	8b 4d a8             	mov    -0x58(%ebp),%ecx
c01063e4:	8b 55 e8             	mov    -0x18(%ebp),%edx
c01063e7:	89 d0                	mov    %edx,%eax
c01063e9:	01 c0                	add    %eax,%eax
c01063eb:	01 d0                	add    %edx,%eax
c01063ed:	c1 e0 03             	shl    $0x3,%eax
c01063f0:	89 c2                	mov    %eax,%edx
c01063f2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01063f5:	01 d0                	add    %edx,%eax
c01063f7:	83 c0 08             	add    $0x8,%eax
c01063fa:	83 ec 08             	sub    $0x8,%esp
c01063fd:	51                   	push   %ecx
c01063fe:	50                   	push   %eax
c01063ff:	e8 5c 3d 00 00       	call   c010a160 <appendToDoubleLinkList>
c0106404:	83 c4 10             	add    $0x10,%esp
c0106407:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c010640b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010640e:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c0106411:	77 bd                	ja     c01063d0 <sys_malloc2+0x1c9>
c0106413:	83 ec 0c             	sub    $0xc,%esp
c0106416:	ff 75 c4             	pushl  -0x3c(%ebp)
c0106419:	e8 33 08 00 00       	call   c0106c51 <intr_set_status>
c010641e:	83 c4 10             	add    $0x10,%esp
c0106421:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0106424:	89 d0                	mov    %edx,%eax
c0106426:	01 c0                	add    %eax,%eax
c0106428:	01 d0                	add    %edx,%eax
c010642a:	c1 e0 03             	shl    $0x3,%eax
c010642d:	89 c2                	mov    %eax,%edx
c010642f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106432:	01 d0                	add    %edx,%eax
c0106434:	83 c0 08             	add    $0x8,%eax
c0106437:	83 ec 0c             	sub    $0xc,%esp
c010643a:	50                   	push   %eax
c010643b:	e8 8a 3e 00 00       	call   c010a2ca <popFromDoubleLinkList>
c0106440:	83 c4 10             	add    $0x10,%esp
c0106443:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0106446:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0106449:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010644c:	83 7d a8 00          	cmpl   $0x0,-0x58(%ebp)
c0106450:	75 1c                	jne    c010646e <sys_malloc2+0x267>
c0106452:	68 ef 01 00 00       	push   $0x1ef
c0106457:	68 a6 b5 10 c0       	push   $0xc010b5a6
c010645c:	68 a6 b5 10 c0       	push   $0xc010b5a6
c0106461:	68 c7 b5 10 c0       	push   $0xc010b5c7
c0106466:	e8 3a 24 00 00       	call   c01088a5 <assertion_failure>
c010646b:	83 c4 10             	add    $0x10,%esp
c010646e:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0106471:	83 ec 0c             	sub    $0xc,%esp
c0106474:	50                   	push   %eax
c0106475:	e8 77 fd ff ff       	call   c01061f1 <block2arena>
c010647a:	83 c4 10             	add    $0x10,%esp
c010647d:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0106480:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0106483:	8b 40 04             	mov    0x4(%eax),%eax
c0106486:	8d 50 ff             	lea    -0x1(%eax),%edx
c0106489:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c010648c:	89 50 04             	mov    %edx,0x4(%eax)
c010648f:	c7 45 c4 04 00 00 00 	movl   $0x4,-0x3c(%ebp)
c0106496:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010649a:	75 1c                	jne    c01064b8 <sys_malloc2+0x2b1>
c010649c:	68 f6 01 00 00       	push   $0x1f6
c01064a1:	68 a6 b5 10 c0       	push   $0xc010b5a6
c01064a6:	68 a6 b5 10 c0       	push   $0xc010b5a6
c01064ab:	68 d9 b5 10 c0       	push   $0xc010b5d9
c01064b0:	e8 f0 23 00 00       	call   c01088a5 <assertion_failure>
c01064b5:	83 c4 10             	add    $0x10,%esp
c01064b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01064bb:	c9                   	leave  
c01064bc:	c3                   	ret    

c01064bd <remove_map_entry>:
c01064bd:	55                   	push   %ebp
c01064be:	89 e5                	mov    %esp,%ebp
c01064c0:	83 ec 10             	sub    $0x10,%esp
c01064c3:	ff 75 08             	pushl  0x8(%ebp)
c01064c6:	e8 9c f8 ff ff       	call   c0105d67 <ptr_pte>
c01064cb:	83 c4 04             	add    $0x4,%esp
c01064ce:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01064d1:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01064d4:	8b 10                	mov    (%eax),%edx
c01064d6:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01064d9:	89 10                	mov    %edx,(%eax)
c01064db:	90                   	nop
c01064dc:	c9                   	leave  
c01064dd:	c3                   	ret    

c01064de <free_a_page>:
c01064de:	55                   	push   %ebp
c01064df:	89 e5                	mov    %esp,%ebp
c01064e1:	83 ec 20             	sub    $0x20,%esp
c01064e4:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01064e8:	75 21                	jne    c010650b <free_a_page+0x2d>
c01064ea:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c01064ef:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01064f2:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c01064f7:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01064fa:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c01064ff:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106502:	c7 45 fc ac 06 11 c0 	movl   $0xc01106ac,-0x4(%ebp)
c0106509:	eb 1f                	jmp    c010652a <free_a_page+0x4c>
c010650b:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0106510:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106513:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0106518:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010651b:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c0106520:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106523:	c7 45 fc f4 0e 11 c0 	movl   $0xc0110ef4,-0x4(%ebp)
c010652a:	8b 45 08             	mov    0x8(%ebp),%eax
c010652d:	c1 e8 0c             	shr    $0xc,%eax
c0106530:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0106533:	6a 00                	push   $0x0
c0106535:	ff 75 f8             	pushl  -0x8(%ebp)
c0106538:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c010653b:	50                   	push   %eax
c010653c:	e8 74 f4 ff ff       	call   c01059b5 <set_bit_val>
c0106541:	83 c4 0c             	add    $0xc,%esp
c0106544:	ff 75 08             	pushl  0x8(%ebp)
c0106547:	e8 22 fa ff ff       	call   c0105f6e <get_physical_address>
c010654c:	83 c4 04             	add    $0x4,%esp
c010654f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106552:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106555:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c010655b:	85 c0                	test   %eax,%eax
c010655d:	0f 48 c2             	cmovs  %edx,%eax
c0106560:	c1 f8 0c             	sar    $0xc,%eax
c0106563:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0106566:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106569:	6a 00                	push   $0x0
c010656b:	ff 75 f0             	pushl  -0x10(%ebp)
c010656e:	50                   	push   %eax
c010656f:	e8 41 f4 ff ff       	call   c01059b5 <set_bit_val>
c0106574:	83 c4 0c             	add    $0xc,%esp
c0106577:	ff 75 08             	pushl  0x8(%ebp)
c010657a:	e8 3e ff ff ff       	call   c01064bd <remove_map_entry>
c010657f:	83 c4 04             	add    $0x4,%esp
c0106582:	90                   	nop
c0106583:	c9                   	leave  
c0106584:	c3                   	ret    

c0106585 <sys_free2>:
c0106585:	55                   	push   %ebp
c0106586:	89 e5                	mov    %esp,%ebp
c0106588:	83 ec 58             	sub    $0x58,%esp
c010658b:	e8 5c 9e ff ff       	call   c01003ec <get_running_thread_pcb>
c0106590:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0106593:	e8 90 06 00 00       	call   c0106c28 <intr_disable>
c0106598:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010659b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010659e:	8b 50 08             	mov    0x8(%eax),%edx
c01065a1:	a1 28 0f 11 c0       	mov    0xc0110f28,%eax
c01065a6:	39 c2                	cmp    %eax,%edx
c01065a8:	75 10                	jne    c01065ba <sys_free2+0x35>
c01065aa:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01065b1:	c7 45 f0 e0 37 18 c0 	movl   $0xc01837e0,-0x10(%ebp)
c01065b8:	eb 10                	jmp    c01065ca <sys_free2+0x45>
c01065ba:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c01065c1:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01065c4:	83 c0 10             	add    $0x10,%eax
c01065c7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01065ca:	81 7d 0c 00 04 00 00 	cmpl   $0x400,0xc(%ebp)
c01065d1:	76 4d                	jbe    c0106620 <sys_free2+0x9b>
c01065d3:	8b 45 08             	mov    0x8(%ebp),%eax
c01065d6:	83 e8 0c             	sub    $0xc,%eax
c01065d9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01065dc:	83 45 0c 0c          	addl   $0xc,0xc(%ebp)
c01065e0:	8b 45 0c             	mov    0xc(%ebp),%eax
c01065e3:	05 ff 0f 00 00       	add    $0xfff,%eax
c01065e8:	c1 e8 0c             	shr    $0xc,%eax
c01065eb:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01065ee:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01065f5:	eb 1c                	jmp    c0106613 <sys_free2+0x8e>
c01065f7:	83 ec 08             	sub    $0x8,%esp
c01065fa:	ff 75 f4             	pushl  -0xc(%ebp)
c01065fd:	ff 75 ec             	pushl  -0x14(%ebp)
c0106600:	e8 d9 fe ff ff       	call   c01064de <free_a_page>
c0106605:	83 c4 10             	add    $0x10,%esp
c0106608:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
c010660f:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0106613:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106616:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
c0106619:	77 dc                	ja     c01065f7 <sys_free2+0x72>
c010661b:	e9 dc 00 00 00       	jmp    c01066fc <sys_free2+0x177>
c0106620:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0106627:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c010662e:	eb 26                	jmp    c0106656 <sys_free2+0xd1>
c0106630:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0106633:	89 d0                	mov    %edx,%eax
c0106635:	01 c0                	add    %eax,%eax
c0106637:	01 d0                	add    %edx,%eax
c0106639:	c1 e0 03             	shl    $0x3,%eax
c010663c:	89 c2                	mov    %eax,%edx
c010663e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106641:	01 d0                	add    %edx,%eax
c0106643:	8b 00                	mov    (%eax),%eax
c0106645:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0106648:	77 08                	ja     c0106652 <sys_free2+0xcd>
c010664a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010664d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106650:	eb 0a                	jmp    c010665c <sys_free2+0xd7>
c0106652:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0106656:	83 7d e0 09          	cmpl   $0x9,-0x20(%ebp)
c010665a:	7e d4                	jle    c0106630 <sys_free2+0xab>
c010665c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c010665f:	89 d0                	mov    %edx,%eax
c0106661:	01 c0                	add    %eax,%eax
c0106663:	01 d0                	add    %edx,%eax
c0106665:	c1 e0 03             	shl    $0x3,%eax
c0106668:	89 c2                	mov    %eax,%edx
c010666a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010666d:	01 d0                	add    %edx,%eax
c010666f:	8b 10                	mov    (%eax),%edx
c0106671:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c0106674:	8b 50 04             	mov    0x4(%eax),%edx
c0106677:	89 55 b8             	mov    %edx,-0x48(%ebp)
c010667a:	8b 50 08             	mov    0x8(%eax),%edx
c010667d:	89 55 bc             	mov    %edx,-0x44(%ebp)
c0106680:	8b 50 0c             	mov    0xc(%eax),%edx
c0106683:	89 55 c0             	mov    %edx,-0x40(%ebp)
c0106686:	8b 50 10             	mov    0x10(%eax),%edx
c0106689:	89 55 c4             	mov    %edx,-0x3c(%ebp)
c010668c:	8b 40 14             	mov    0x14(%eax),%eax
c010668f:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0106692:	8b 45 08             	mov    0x8(%ebp),%eax
c0106695:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0106698:	83 ec 0c             	sub    $0xc,%esp
c010669b:	ff 75 d0             	pushl  -0x30(%ebp)
c010669e:	e8 4e fb ff ff       	call   c01061f1 <block2arena>
c01066a3:	83 c4 10             	add    $0x10,%esp
c01066a6:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01066a9:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01066ac:	89 d0                	mov    %edx,%eax
c01066ae:	01 c0                	add    %eax,%eax
c01066b0:	01 d0                	add    %edx,%eax
c01066b2:	c1 e0 03             	shl    $0x3,%eax
c01066b5:	89 c2                	mov    %eax,%edx
c01066b7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01066ba:	01 d0                	add    %edx,%eax
c01066bc:	83 c0 08             	add    $0x8,%eax
c01066bf:	83 ec 08             	sub    $0x8,%esp
c01066c2:	ff 75 d0             	pushl  -0x30(%ebp)
c01066c5:	50                   	push   %eax
c01066c6:	e8 95 3a 00 00       	call   c010a160 <appendToDoubleLinkList>
c01066cb:	83 c4 10             	add    $0x10,%esp
c01066ce:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01066d1:	8b 40 04             	mov    0x4(%eax),%eax
c01066d4:	8d 50 01             	lea    0x1(%eax),%edx
c01066d7:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01066da:	89 50 04             	mov    %edx,0x4(%eax)
c01066dd:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01066e0:	8b 50 04             	mov    0x4(%eax),%edx
c01066e3:	8b 45 b8             	mov    -0x48(%ebp),%eax
c01066e6:	39 c2                	cmp    %eax,%edx
c01066e8:	75 12                	jne    c01066fc <sys_free2+0x177>
c01066ea:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01066ed:	83 ec 08             	sub    $0x8,%esp
c01066f0:	ff 75 f4             	pushl  -0xc(%ebp)
c01066f3:	50                   	push   %eax
c01066f4:	e8 e5 fd ff ff       	call   c01064de <free_a_page>
c01066f9:	83 c4 10             	add    $0x10,%esp
c01066fc:	83 ec 0c             	sub    $0xc,%esp
c01066ff:	ff 75 d8             	pushl  -0x28(%ebp)
c0106702:	e8 4a 05 00 00       	call   c0106c51 <intr_set_status>
c0106707:	83 c4 10             	add    $0x10,%esp
c010670a:	90                   	nop
c010670b:	c9                   	leave  
c010670c:	c3                   	ret    

c010670d <init_memory_block_desc>:
c010670d:	55                   	push   %ebp
c010670e:	89 e5                	mov    %esp,%ebp
c0106710:	83 ec 18             	sub    $0x18,%esp
c0106713:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010671a:	e9 b2 00 00 00       	jmp    c01067d1 <init_memory_block_desc+0xc4>
c010671f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0106723:	75 1b                	jne    c0106740 <init_memory_block_desc+0x33>
c0106725:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106728:	89 d0                	mov    %edx,%eax
c010672a:	01 c0                	add    %eax,%eax
c010672c:	01 d0                	add    %edx,%eax
c010672e:	c1 e0 03             	shl    $0x3,%eax
c0106731:	89 c2                	mov    %eax,%edx
c0106733:	8b 45 08             	mov    0x8(%ebp),%eax
c0106736:	01 d0                	add    %edx,%eax
c0106738:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c010673e:	eb 2e                	jmp    c010676e <init_memory_block_desc+0x61>
c0106740:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106743:	89 d0                	mov    %edx,%eax
c0106745:	01 c0                	add    %eax,%eax
c0106747:	01 d0                	add    %edx,%eax
c0106749:	c1 e0 03             	shl    $0x3,%eax
c010674c:	8d 50 e8             	lea    -0x18(%eax),%edx
c010674f:	8b 45 08             	mov    0x8(%ebp),%eax
c0106752:	01 d0                	add    %edx,%eax
c0106754:	8b 08                	mov    (%eax),%ecx
c0106756:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106759:	89 d0                	mov    %edx,%eax
c010675b:	01 c0                	add    %eax,%eax
c010675d:	01 d0                	add    %edx,%eax
c010675f:	c1 e0 03             	shl    $0x3,%eax
c0106762:	89 c2                	mov    %eax,%edx
c0106764:	8b 45 08             	mov    0x8(%ebp),%eax
c0106767:	01 d0                	add    %edx,%eax
c0106769:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
c010676c:	89 10                	mov    %edx,(%eax)
c010676e:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106771:	89 d0                	mov    %edx,%eax
c0106773:	01 c0                	add    %eax,%eax
c0106775:	01 d0                	add    %edx,%eax
c0106777:	c1 e0 03             	shl    $0x3,%eax
c010677a:	89 c2                	mov    %eax,%edx
c010677c:	8b 45 08             	mov    0x8(%ebp),%eax
c010677f:	01 d0                	add    %edx,%eax
c0106781:	8b 00                	mov    (%eax),%eax
c0106783:	89 c1                	mov    %eax,%ecx
c0106785:	b8 f4 0f 00 00       	mov    $0xff4,%eax
c010678a:	ba 00 00 00 00       	mov    $0x0,%edx
c010678f:	f7 f1                	div    %ecx
c0106791:	89 c1                	mov    %eax,%ecx
c0106793:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106796:	89 d0                	mov    %edx,%eax
c0106798:	01 c0                	add    %eax,%eax
c010679a:	01 d0                	add    %edx,%eax
c010679c:	c1 e0 03             	shl    $0x3,%eax
c010679f:	89 c2                	mov    %eax,%edx
c01067a1:	8b 45 08             	mov    0x8(%ebp),%eax
c01067a4:	01 d0                	add    %edx,%eax
c01067a6:	89 ca                	mov    %ecx,%edx
c01067a8:	89 50 04             	mov    %edx,0x4(%eax)
c01067ab:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01067ae:	89 d0                	mov    %edx,%eax
c01067b0:	01 c0                	add    %eax,%eax
c01067b2:	01 d0                	add    %edx,%eax
c01067b4:	c1 e0 03             	shl    $0x3,%eax
c01067b7:	89 c2                	mov    %eax,%edx
c01067b9:	8b 45 08             	mov    0x8(%ebp),%eax
c01067bc:	01 d0                	add    %edx,%eax
c01067be:	83 c0 08             	add    $0x8,%eax
c01067c1:	83 ec 0c             	sub    $0xc,%esp
c01067c4:	50                   	push   %eax
c01067c5:	e8 6b 38 00 00       	call   c010a035 <initDoubleLinkList>
c01067ca:	83 c4 10             	add    $0x10,%esp
c01067cd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01067d1:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c01067d5:	0f 8e 44 ff ff ff    	jle    c010671f <init_memory_block_desc+0x12>
c01067db:	90                   	nop
c01067dc:	c9                   	leave  
c01067dd:	c3                   	ret    

c01067de <init_memory2>:
c01067de:	55                   	push   %ebp
c01067df:	89 e5                	mov    %esp,%ebp
c01067e1:	83 ec 38             	sub    $0x38,%esp
c01067e4:	c7 45 f4 00 00 00 02 	movl   $0x2000000,-0xc(%ebp)
c01067eb:	c7 45 f0 00 20 10 00 	movl   $0x102000,-0x10(%ebp)
c01067f2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01067f5:	a3 b4 06 11 c0       	mov    %eax,0xc01106b4
c01067fa:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01067fd:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106802:	29 c2                	sub    %eax,%edx
c0106804:	89 d0                	mov    %edx,%eax
c0106806:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106809:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010680c:	89 c2                	mov    %eax,%edx
c010680e:	c1 ea 1f             	shr    $0x1f,%edx
c0106811:	01 d0                	add    %edx,%eax
c0106813:	d1 f8                	sar    %eax
c0106815:	a3 b8 06 11 c0       	mov    %eax,0xc01106b8
c010681a:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c010681f:	83 ec 0c             	sub    $0xc,%esp
c0106822:	50                   	push   %eax
c0106823:	e8 52 08 00 00       	call   c010707a <disp_int>
c0106828:	83 c4 10             	add    $0x10,%esp
c010682b:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c0106830:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106833:	29 c2                	sub    %eax,%edx
c0106835:	89 d0                	mov    %edx,%eax
c0106837:	a3 00 0f 11 c0       	mov    %eax,0xc0110f00
c010683c:	83 ec 0c             	sub    $0xc,%esp
c010683f:	68 e5 b5 10 c0       	push   $0xc010b5e5
c0106844:	e8 43 98 ff ff       	call   c010008c <disp_str>
c0106849:	83 c4 10             	add    $0x10,%esp
c010684c:	a1 00 0f 11 c0       	mov    0xc0110f00,%eax
c0106851:	83 ec 0c             	sub    $0xc,%esp
c0106854:	50                   	push   %eax
c0106855:	e8 20 08 00 00       	call   c010707a <disp_int>
c010685a:	83 c4 10             	add    $0x10,%esp
c010685d:	83 ec 0c             	sub    $0xc,%esp
c0106860:	68 e5 b5 10 c0       	push   $0xc010b5e5
c0106865:	e8 22 98 ff ff       	call   c010008c <disp_str>
c010686a:	83 c4 10             	add    $0x10,%esp
c010686d:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c0106872:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106877:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c010687d:	85 c0                	test   %eax,%eax
c010687f:	0f 48 c2             	cmovs  %edx,%eax
c0106882:	c1 f8 0c             	sar    $0xc,%eax
c0106885:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106888:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010688b:	83 c0 07             	add    $0x7,%eax
c010688e:	8d 50 07             	lea    0x7(%eax),%edx
c0106891:	85 c0                	test   %eax,%eax
c0106893:	0f 48 c2             	cmovs  %edx,%eax
c0106896:	c1 f8 03             	sar    $0x3,%eax
c0106899:	a3 b0 06 11 c0       	mov    %eax,0xc01106b0
c010689e:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c01068a3:	2d 00 00 00 40       	sub    $0x40000000,%eax
c01068a8:	a3 ac 06 11 c0       	mov    %eax,0xc01106ac
c01068ad:	8b 15 b0 06 11 c0    	mov    0xc01106b0,%edx
c01068b3:	a1 ac 06 11 c0       	mov    0xc01106ac,%eax
c01068b8:	83 ec 04             	sub    $0x4,%esp
c01068bb:	52                   	push   %edx
c01068bc:	6a 00                	push   $0x0
c01068be:	50                   	push   %eax
c01068bf:	e8 0b 59 00 00       	call   c010c1cf <Memset>
c01068c4:	83 c4 10             	add    $0x10,%esp
c01068c7:	a1 b0 06 11 c0       	mov    0xc01106b0,%eax
c01068cc:	05 ff 0f 00 00       	add    $0xfff,%eax
c01068d1:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c01068d7:	85 c0                	test   %eax,%eax
c01068d9:	0f 48 c2             	cmovs  %edx,%eax
c01068dc:	c1 f8 0c             	sar    $0xc,%eax
c01068df:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01068e2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01068e5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01068e8:	ff 75 e8             	pushl  -0x18(%ebp)
c01068eb:	6a 01                	push   $0x1
c01068ed:	6a 00                	push   $0x0
c01068ef:	68 ac 06 11 c0       	push   $0xc01106ac
c01068f4:	e8 37 f1 ff ff       	call   c0105a30 <set_bits>
c01068f9:	83 c4 10             	add    $0x10,%esp
c01068fc:	a1 00 0f 11 c0       	mov    0xc0110f00,%eax
c0106901:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106906:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c010690c:	85 c0                	test   %eax,%eax
c010690e:	0f 48 c2             	cmovs  %edx,%eax
c0106911:	c1 f8 0c             	sar    $0xc,%eax
c0106914:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106917:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010691a:	83 c0 07             	add    $0x7,%eax
c010691d:	8d 50 07             	lea    0x7(%eax),%edx
c0106920:	85 c0                	test   %eax,%eax
c0106922:	0f 48 c2             	cmovs  %edx,%eax
c0106925:	c1 f8 03             	sar    $0x3,%eax
c0106928:	a3 f8 0e 11 c0       	mov    %eax,0xc0110ef8
c010692d:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106932:	8b 15 b0 06 11 c0    	mov    0xc01106b0,%edx
c0106938:	01 d0                	add    %edx,%eax
c010693a:	a3 f4 0e 11 c0       	mov    %eax,0xc0110ef4
c010693f:	8b 15 f8 0e 11 c0    	mov    0xc0110ef8,%edx
c0106945:	a1 f4 0e 11 c0       	mov    0xc0110ef4,%eax
c010694a:	83 ec 04             	sub    $0x4,%esp
c010694d:	52                   	push   %edx
c010694e:	6a 00                	push   $0x0
c0106950:	50                   	push   %eax
c0106951:	e8 79 58 00 00       	call   c010c1cf <Memset>
c0106956:	83 c4 10             	add    $0x10,%esp
c0106959:	a1 f8 0e 11 c0       	mov    0xc0110ef8,%eax
c010695e:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106963:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106969:	85 c0                	test   %eax,%eax
c010696b:	0f 48 c2             	cmovs  %edx,%eax
c010696e:	c1 f8 0c             	sar    $0xc,%eax
c0106971:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106974:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106977:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010697a:	ff 75 e8             	pushl  -0x18(%ebp)
c010697d:	6a 01                	push   $0x1
c010697f:	ff 75 e0             	pushl  -0x20(%ebp)
c0106982:	68 ac 06 11 c0       	push   $0xc01106ac
c0106987:	e8 a4 f0 ff ff       	call   c0105a30 <set_bits>
c010698c:	83 c4 10             	add    $0x10,%esp
c010698f:	c7 45 dc 00 00 10 00 	movl   $0x100000,-0x24(%ebp)
c0106996:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106999:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010699c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010699f:	83 c0 07             	add    $0x7,%eax
c01069a2:	8d 50 07             	lea    0x7(%eax),%edx
c01069a5:	85 c0                	test   %eax,%eax
c01069a7:	0f 48 c2             	cmovs  %edx,%eax
c01069aa:	c1 f8 03             	sar    $0x3,%eax
c01069ad:	a3 98 f7 10 c0       	mov    %eax,0xc010f798
c01069b2:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c01069b7:	8b 15 b0 06 11 c0    	mov    0xc01106b0,%edx
c01069bd:	01 c2                	add    %eax,%edx
c01069bf:	a1 f8 0e 11 c0       	mov    0xc0110ef8,%eax
c01069c4:	01 d0                	add    %edx,%eax
c01069c6:	a3 94 f7 10 c0       	mov    %eax,0xc010f794
c01069cb:	8b 15 98 f7 10 c0    	mov    0xc010f798,%edx
c01069d1:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c01069d6:	83 ec 04             	sub    $0x4,%esp
c01069d9:	52                   	push   %edx
c01069da:	6a 00                	push   $0x0
c01069dc:	50                   	push   %eax
c01069dd:	e8 ed 57 00 00       	call   c010c1cf <Memset>
c01069e2:	83 c4 10             	add    $0x10,%esp
c01069e5:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01069e8:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01069eb:	01 d0                	add    %edx,%eax
c01069ed:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01069f0:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c01069f5:	05 ff 0f 00 00       	add    $0xfff,%eax
c01069fa:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106a00:	85 c0                	test   %eax,%eax
c0106a02:	0f 48 c2             	cmovs  %edx,%eax
c0106a05:	c1 f8 0c             	sar    $0xc,%eax
c0106a08:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106a0b:	ff 75 e8             	pushl  -0x18(%ebp)
c0106a0e:	6a 01                	push   $0x1
c0106a10:	ff 75 e0             	pushl  -0x20(%ebp)
c0106a13:	68 ac 06 11 c0       	push   $0xc01106ac
c0106a18:	e8 13 f0 ff ff       	call   c0105a30 <set_bits>
c0106a1d:	83 c4 10             	add    $0x10,%esp
c0106a20:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0106a23:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106a26:	01 d0                	add    %edx,%eax
c0106a28:	c1 e0 0c             	shl    $0xc,%eax
c0106a2b:	a3 9c f7 10 c0       	mov    %eax,0xc010f79c
c0106a30:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106a33:	83 c0 02             	add    $0x2,%eax
c0106a36:	c1 e0 0c             	shl    $0xc,%eax
c0106a39:	89 c2                	mov    %eax,%edx
c0106a3b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106a3e:	01 d0                	add    %edx,%eax
c0106a40:	a3 9c f7 10 c0       	mov    %eax,0xc010f79c
c0106a45:	c7 45 d8 05 00 00 00 	movl   $0x5,-0x28(%ebp)
c0106a4c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106a4f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106a52:	90                   	nop
c0106a53:	c9                   	leave  
c0106a54:	c3                   	ret    

c0106a55 <init_memory>:
c0106a55:	55                   	push   %ebp
c0106a56:	89 e5                	mov    %esp,%ebp
c0106a58:	83 ec 38             	sub    $0x38,%esp
c0106a5b:	c7 45 f4 00 00 02 c0 	movl   $0xc0020000,-0xc(%ebp)
c0106a62:	c7 45 f0 00 00 40 c0 	movl   $0xc0400000,-0x10(%ebp)
c0106a69:	c7 45 ec 00 00 10 00 	movl   $0x100000,-0x14(%ebp)
c0106a70:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106a73:	05 00 00 40 00       	add    $0x400000,%eax
c0106a78:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106a7b:	8b 45 08             	mov    0x8(%ebp),%eax
c0106a7e:	2b 45 e8             	sub    -0x18(%ebp),%eax
c0106a81:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106a87:	85 c0                	test   %eax,%eax
c0106a89:	0f 48 c2             	cmovs  %edx,%eax
c0106a8c:	c1 f8 0c             	sar    $0xc,%eax
c0106a8f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106a92:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106a95:	89 c2                	mov    %eax,%edx
c0106a97:	c1 ea 1f             	shr    $0x1f,%edx
c0106a9a:	01 d0                	add    %edx,%eax
c0106a9c:	d1 f8                	sar    %eax
c0106a9e:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106aa1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106aa4:	2b 45 e0             	sub    -0x20(%ebp),%eax
c0106aa7:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0106aaa:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0106aad:	8d 50 07             	lea    0x7(%eax),%edx
c0106ab0:	85 c0                	test   %eax,%eax
c0106ab2:	0f 48 c2             	cmovs  %edx,%eax
c0106ab5:	c1 f8 03             	sar    $0x3,%eax
c0106ab8:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0106abb:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106abe:	8d 50 07             	lea    0x7(%eax),%edx
c0106ac1:	85 c0                	test   %eax,%eax
c0106ac3:	0f 48 c2             	cmovs  %edx,%eax
c0106ac6:	c1 f8 03             	sar    $0x3,%eax
c0106ac9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106acc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106acf:	a3 b4 06 11 c0       	mov    %eax,0xc01106b4
c0106ad4:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106ad9:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0106adc:	c1 e2 0c             	shl    $0xc,%edx
c0106adf:	01 d0                	add    %edx,%eax
c0106ae1:	a3 fc 0e 11 c0       	mov    %eax,0xc0110efc
c0106ae6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106ae9:	a3 ac 06 11 c0       	mov    %eax,0xc01106ac
c0106aee:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106af1:	a3 b0 06 11 c0       	mov    %eax,0xc01106b0
c0106af6:	a1 ac 06 11 c0       	mov    0xc01106ac,%eax
c0106afb:	83 ec 04             	sub    $0x4,%esp
c0106afe:	ff 75 d8             	pushl  -0x28(%ebp)
c0106b01:	6a 00                	push   $0x0
c0106b03:	50                   	push   %eax
c0106b04:	e8 c6 56 00 00       	call   c010c1cf <Memset>
c0106b09:	83 c4 10             	add    $0x10,%esp
c0106b0c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106b0f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106b12:	01 d0                	add    %edx,%eax
c0106b14:	a3 f4 0e 11 c0       	mov    %eax,0xc0110ef4
c0106b19:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106b1c:	a3 f8 0e 11 c0       	mov    %eax,0xc0110ef8
c0106b21:	a1 f4 0e 11 c0       	mov    0xc0110ef4,%eax
c0106b26:	83 ec 04             	sub    $0x4,%esp
c0106b29:	ff 75 d4             	pushl  -0x2c(%ebp)
c0106b2c:	6a 00                	push   $0x0
c0106b2e:	50                   	push   %eax
c0106b2f:	e8 9b 56 00 00       	call   c010c1cf <Memset>
c0106b34:	83 c4 10             	add    $0x10,%esp
c0106b37:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106b3a:	a3 98 f7 10 c0       	mov    %eax,0xc010f798
c0106b3f:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106b42:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106b45:	01 c2                	add    %eax,%edx
c0106b47:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106b4a:	01 d0                	add    %edx,%eax
c0106b4c:	a3 94 f7 10 c0       	mov    %eax,0xc010f794
c0106b51:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106b54:	05 00 00 10 00       	add    $0x100000,%eax
c0106b59:	a3 9c f7 10 c0       	mov    %eax,0xc010f79c
c0106b5e:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0106b63:	83 ec 04             	sub    $0x4,%esp
c0106b66:	ff 75 d8             	pushl  -0x28(%ebp)
c0106b69:	6a 00                	push   $0x0
c0106b6b:	50                   	push   %eax
c0106b6c:	e8 5e 56 00 00       	call   c010c1cf <Memset>
c0106b71:	83 c4 10             	add    $0x10,%esp
c0106b74:	83 ec 04             	sub    $0x4,%esp
c0106b77:	68 f0 00 00 00       	push   $0xf0
c0106b7c:	6a 00                	push   $0x0
c0106b7e:	68 e0 37 18 c0       	push   $0xc01837e0
c0106b83:	e8 47 56 00 00       	call   c010c1cf <Memset>
c0106b88:	83 c4 10             	add    $0x10,%esp
c0106b8b:	83 ec 0c             	sub    $0xc,%esp
c0106b8e:	68 e0 37 18 c0       	push   $0xc01837e0
c0106b93:	e8 75 fb ff ff       	call   c010670d <init_memory_block_desc>
c0106b98:	83 c4 10             	add    $0x10,%esp
c0106b9b:	90                   	nop
c0106b9c:	c9                   	leave  
c0106b9d:	c3                   	ret    

c0106b9e <stop_here>:
c0106b9e:	55                   	push   %ebp
c0106b9f:	89 e5                	mov    %esp,%ebp
c0106ba1:	83 ec 08             	sub    $0x8,%esp
c0106ba4:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0106bab:	00 00 00 
c0106bae:	83 ec 0c             	sub    $0xc,%esp
c0106bb1:	68 00 b6 10 c0       	push   $0xc010b600
c0106bb6:	e8 d1 94 ff ff       	call   c010008c <disp_str>
c0106bbb:	83 c4 10             	add    $0x10,%esp
c0106bbe:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0106bc3:	83 ec 0c             	sub    $0xc,%esp
c0106bc6:	50                   	push   %eax
c0106bc7:	e8 ae 04 00 00       	call   c010707a <disp_int>
c0106bcc:	83 c4 10             	add    $0x10,%esp
c0106bcf:	83 ec 0c             	sub    $0xc,%esp
c0106bd2:	68 02 b6 10 c0       	push   $0xc010b602
c0106bd7:	e8 b0 94 ff ff       	call   c010008c <disp_str>
c0106bdc:	83 c4 10             	add    $0x10,%esp
c0106bdf:	90                   	nop
c0106be0:	c9                   	leave  
c0106be1:	c3                   	ret    

c0106be2 <catch_error>:
c0106be2:	55                   	push   %ebp
c0106be3:	89 e5                	mov    %esp,%ebp
c0106be5:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0106bea:	83 c0 01             	add    $0x1,%eax
c0106bed:	a3 c4 fb 10 c0       	mov    %eax,0xc010fbc4
c0106bf2:	a1 a4 f7 10 c0       	mov    0xc010f7a4,%eax
c0106bf7:	a3 a0 f7 10 c0       	mov    %eax,0xc010f7a0
c0106bfc:	90                   	nop
c0106bfd:	5d                   	pop    %ebp
c0106bfe:	c3                   	ret    

c0106bff <intr_enable>:
c0106bff:	55                   	push   %ebp
c0106c00:	89 e5                	mov    %esp,%ebp
c0106c02:	83 ec 18             	sub    $0x18,%esp
c0106c05:	e8 65 00 00 00       	call   c0106c6f <intr_get_status>
c0106c0a:	83 f8 01             	cmp    $0x1,%eax
c0106c0d:	75 0c                	jne    c0106c1b <intr_enable+0x1c>
c0106c0f:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0106c16:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106c19:	eb 0b                	jmp    c0106c26 <intr_enable+0x27>
c0106c1b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106c22:	fb                   	sti    
c0106c23:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106c26:	c9                   	leave  
c0106c27:	c3                   	ret    

c0106c28 <intr_disable>:
c0106c28:	55                   	push   %ebp
c0106c29:	89 e5                	mov    %esp,%ebp
c0106c2b:	83 ec 18             	sub    $0x18,%esp
c0106c2e:	e8 3c 00 00 00       	call   c0106c6f <intr_get_status>
c0106c33:	83 f8 01             	cmp    $0x1,%eax
c0106c36:	75 0d                	jne    c0106c45 <intr_disable+0x1d>
c0106c38:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0106c3f:	fa                   	cli    
c0106c40:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106c43:	eb 0a                	jmp    c0106c4f <intr_disable+0x27>
c0106c45:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106c4c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106c4f:	c9                   	leave  
c0106c50:	c3                   	ret    

c0106c51 <intr_set_status>:
c0106c51:	55                   	push   %ebp
c0106c52:	89 e5                	mov    %esp,%ebp
c0106c54:	83 ec 08             	sub    $0x8,%esp
c0106c57:	8b 45 08             	mov    0x8(%ebp),%eax
c0106c5a:	83 e0 01             	and    $0x1,%eax
c0106c5d:	85 c0                	test   %eax,%eax
c0106c5f:	74 07                	je     c0106c68 <intr_set_status+0x17>
c0106c61:	e8 99 ff ff ff       	call   c0106bff <intr_enable>
c0106c66:	eb 05                	jmp    c0106c6d <intr_set_status+0x1c>
c0106c68:	e8 bb ff ff ff       	call   c0106c28 <intr_disable>
c0106c6d:	c9                   	leave  
c0106c6e:	c3                   	ret    

c0106c6f <intr_get_status>:
c0106c6f:	55                   	push   %ebp
c0106c70:	89 e5                	mov    %esp,%ebp
c0106c72:	83 ec 10             	sub    $0x10,%esp
c0106c75:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0106c7c:	9c                   	pushf  
c0106c7d:	58                   	pop    %eax
c0106c7e:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0106c81:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106c84:	c1 e8 09             	shr    $0x9,%eax
c0106c87:	83 e0 01             	and    $0x1,%eax
c0106c8a:	c9                   	leave  
c0106c8b:	c3                   	ret    

c0106c8c <Memcpy>:
c0106c8c:	55                   	push   %ebp
c0106c8d:	89 e5                	mov    %esp,%ebp
c0106c8f:	83 ec 18             	sub    $0x18,%esp
c0106c92:	e8 91 ff ff ff       	call   c0106c28 <intr_disable>
c0106c97:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106c9a:	83 ec 04             	sub    $0x4,%esp
c0106c9d:	ff 75 10             	pushl  0x10(%ebp)
c0106ca0:	ff 75 0c             	pushl  0xc(%ebp)
c0106ca3:	ff 75 08             	pushl  0x8(%ebp)
c0106ca6:	e8 f6 54 00 00       	call   c010c1a1 <Memcpy2>
c0106cab:	83 c4 10             	add    $0x10,%esp
c0106cae:	83 ec 0c             	sub    $0xc,%esp
c0106cb1:	ff 75 f4             	pushl  -0xc(%ebp)
c0106cb4:	e8 98 ff ff ff       	call   c0106c51 <intr_set_status>
c0106cb9:	83 c4 10             	add    $0x10,%esp
c0106cbc:	90                   	nop
c0106cbd:	c9                   	leave  
c0106cbe:	c3                   	ret    

c0106cbf <untar>:
c0106cbf:	55                   	push   %ebp
c0106cc0:	89 e5                	mov    %esp,%ebp
c0106cc2:	81 ec 48 0a 00 00    	sub    $0xa48,%esp
c0106cc8:	83 ec 08             	sub    $0x8,%esp
c0106ccb:	6a 00                	push   $0x0
c0106ccd:	ff 75 08             	pushl  0x8(%ebp)
c0106cd0:	e8 2a de ff ff       	call   c0104aff <open>
c0106cd5:	83 c4 10             	add    $0x10,%esp
c0106cd8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106cdb:	83 ec 0c             	sub    $0xc,%esp
c0106cde:	68 04 b6 10 c0       	push   $0xc010b604
c0106ce3:	e8 60 18 00 00       	call   c0108548 <Printf>
c0106ce8:	83 c4 10             	add    $0x10,%esp
c0106ceb:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0106cf2:	c7 45 dc 00 02 00 00 	movl   $0x200,-0x24(%ebp)
c0106cf9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106d00:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0106d07:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0106d0e:	e9 63 02 00 00       	jmp    c0106f76 <untar+0x2b7>
c0106d13:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0106d17:	7e 58                	jle    c0106d71 <untar+0xb2>
c0106d19:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106d1c:	05 ff 01 00 00       	add    $0x1ff,%eax
c0106d21:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0106d27:	85 c0                	test   %eax,%eax
c0106d29:	0f 48 c2             	cmovs  %edx,%eax
c0106d2c:	c1 f8 09             	sar    $0x9,%eax
c0106d2f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106d32:	83 ec 04             	sub    $0x4,%esp
c0106d35:	68 00 02 00 00       	push   $0x200
c0106d3a:	6a 00                	push   $0x0
c0106d3c:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106d42:	50                   	push   %eax
c0106d43:	e8 87 54 00 00       	call   c010c1cf <Memset>
c0106d48:	83 c4 10             	add    $0x10,%esp
c0106d4b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106d4e:	c1 e0 09             	shl    $0x9,%eax
c0106d51:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0106d54:	83 ec 04             	sub    $0x4,%esp
c0106d57:	50                   	push   %eax
c0106d58:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106d5e:	50                   	push   %eax
c0106d5f:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106d62:	e8 2d de ff ff       	call   c0104b94 <read>
c0106d67:	83 c4 10             	add    $0x10,%esp
c0106d6a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106d71:	83 ec 04             	sub    $0x4,%esp
c0106d74:	68 00 02 00 00       	push   $0x200
c0106d79:	6a 00                	push   $0x0
c0106d7b:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106d81:	50                   	push   %eax
c0106d82:	e8 48 54 00 00       	call   c010c1cf <Memset>
c0106d87:	83 c4 10             	add    $0x10,%esp
c0106d8a:	83 ec 04             	sub    $0x4,%esp
c0106d8d:	68 00 02 00 00       	push   $0x200
c0106d92:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106d98:	50                   	push   %eax
c0106d99:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106d9c:	e8 f3 dd ff ff       	call   c0104b94 <read>
c0106da1:	83 c4 10             	add    $0x10,%esp
c0106da4:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0106da7:	83 ec 0c             	sub    $0xc,%esp
c0106daa:	68 16 b6 10 c0       	push   $0xc010b616
c0106daf:	e8 94 17 00 00       	call   c0108548 <Printf>
c0106db4:	83 c4 10             	add    $0x10,%esp
c0106db7:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0106dbb:	0f 84 c1 01 00 00    	je     c0106f82 <untar+0x2c3>
c0106dc1:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106dc4:	01 45 f4             	add    %eax,-0xc(%ebp)
c0106dc7:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0106dce:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106dd4:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0106dd7:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106dda:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0106ddd:	83 ec 08             	sub    $0x8,%esp
c0106de0:	6a 07                	push   $0x7
c0106de2:	ff 75 cc             	pushl  -0x34(%ebp)
c0106de5:	e8 15 dd ff ff       	call   c0104aff <open>
c0106dea:	83 c4 10             	add    $0x10,%esp
c0106ded:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0106df0:	83 ec 0c             	sub    $0xc,%esp
c0106df3:	68 28 b6 10 c0       	push   $0xc010b628
c0106df8:	e8 4b 17 00 00       	call   c0108548 <Printf>
c0106dfd:	83 c4 10             	add    $0x10,%esp
c0106e00:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0106e07:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106e0a:	83 c0 7c             	add    $0x7c,%eax
c0106e0d:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0106e10:	83 ec 0c             	sub    $0xc,%esp
c0106e13:	ff 75 cc             	pushl  -0x34(%ebp)
c0106e16:	e8 ed 53 00 00       	call   c010c208 <Strlen>
c0106e1b:	83 c4 10             	add    $0x10,%esp
c0106e1e:	85 c0                	test   %eax,%eax
c0106e20:	75 28                	jne    c0106e4a <untar+0x18b>
c0106e22:	83 ec 0c             	sub    $0xc,%esp
c0106e25:	ff 75 c4             	pushl  -0x3c(%ebp)
c0106e28:	e8 db 53 00 00       	call   c010c208 <Strlen>
c0106e2d:	83 c4 10             	add    $0x10,%esp
c0106e30:	85 c0                	test   %eax,%eax
c0106e32:	75 16                	jne    c0106e4a <untar+0x18b>
c0106e34:	83 ec 0c             	sub    $0xc,%esp
c0106e37:	68 3a b6 10 c0       	push   $0xc010b63a
c0106e3c:	e8 07 17 00 00       	call   c0108548 <Printf>
c0106e41:	83 c4 10             	add    $0x10,%esp
c0106e44:	90                   	nop
c0106e45:	e9 39 01 00 00       	jmp    c0106f83 <untar+0x2c4>
c0106e4a:	83 ec 0c             	sub    $0xc,%esp
c0106e4d:	68 41 b6 10 c0       	push   $0xc010b641
c0106e52:	e8 f1 16 00 00       	call   c0108548 <Printf>
c0106e57:	83 c4 10             	add    $0x10,%esp
c0106e5a:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0106e5d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106e60:	eb 1f                	jmp    c0106e81 <untar+0x1c2>
c0106e62:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106e65:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0106e6c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106e6f:	0f b6 00             	movzbl (%eax),%eax
c0106e72:	0f be c0             	movsbl %al,%eax
c0106e75:	83 e8 30             	sub    $0x30,%eax
c0106e78:	01 d0                	add    %edx,%eax
c0106e7a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106e7d:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0106e81:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106e84:	0f b6 00             	movzbl (%eax),%eax
c0106e87:	84 c0                	test   %al,%al
c0106e89:	75 d7                	jne    c0106e62 <untar+0x1a3>
c0106e8b:	83 ec 0c             	sub    $0xc,%esp
c0106e8e:	68 4f b6 10 c0       	push   $0xc010b64f
c0106e93:	e8 b0 16 00 00       	call   c0108548 <Printf>
c0106e98:	83 c4 10             	add    $0x10,%esp
c0106e9b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106e9e:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0106ea1:	c7 45 bc 00 08 00 00 	movl   $0x800,-0x44(%ebp)
c0106ea8:	83 ec 08             	sub    $0x8,%esp
c0106eab:	ff 75 c0             	pushl  -0x40(%ebp)
c0106eae:	68 5d b6 10 c0       	push   $0xc010b65d
c0106eb3:	e8 90 16 00 00       	call   c0108548 <Printf>
c0106eb8:	83 c4 10             	add    $0x10,%esp
c0106ebb:	83 ec 08             	sub    $0x8,%esp
c0106ebe:	ff 75 c0             	pushl  -0x40(%ebp)
c0106ec1:	68 6f b6 10 c0       	push   $0xc010b66f
c0106ec6:	e8 7d 16 00 00       	call   c0108548 <Printf>
c0106ecb:	83 c4 10             	add    $0x10,%esp
c0106ece:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0106ed1:	39 45 bc             	cmp    %eax,-0x44(%ebp)
c0106ed4:	0f 4e 45 bc          	cmovle -0x44(%ebp),%eax
c0106ed8:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0106edb:	e8 02 fd ff ff       	call   c0106be2 <catch_error>
c0106ee0:	83 ec 04             	sub    $0x4,%esp
c0106ee3:	ff 75 b8             	pushl  -0x48(%ebp)
c0106ee6:	8d 85 b8 f5 ff ff    	lea    -0xa48(%ebp),%eax
c0106eec:	50                   	push   %eax
c0106eed:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106ef0:	e8 9f dc ff ff       	call   c0104b94 <read>
c0106ef5:	83 c4 10             	add    $0x10,%esp
c0106ef8:	01 45 f4             	add    %eax,-0xc(%ebp)
c0106efb:	83 ec 04             	sub    $0x4,%esp
c0106efe:	ff 75 b8             	pushl  -0x48(%ebp)
c0106f01:	8d 85 b8 f5 ff ff    	lea    -0xa48(%ebp),%eax
c0106f07:	50                   	push   %eax
c0106f08:	ff 75 c8             	pushl  -0x38(%ebp)
c0106f0b:	e8 05 de ff ff       	call   c0104d15 <write>
c0106f10:	83 c4 10             	add    $0x10,%esp
c0106f13:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106f16:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0106f19:	7d 02                	jge    c0106f1d <untar+0x25e>
c0106f1b:	eb be                	jmp    c0106edb <untar+0x21c>
c0106f1d:	90                   	nop
c0106f1e:	83 ec 08             	sub    $0x8,%esp
c0106f21:	ff 75 f4             	pushl  -0xc(%ebp)
c0106f24:	68 81 b6 10 c0       	push   $0xc010b681
c0106f29:	e8 1a 16 00 00       	call   c0108548 <Printf>
c0106f2e:	83 c4 10             	add    $0x10,%esp
c0106f31:	83 ec 08             	sub    $0x8,%esp
c0106f34:	ff 75 c0             	pushl  -0x40(%ebp)
c0106f37:	68 93 b6 10 c0       	push   $0xc010b693
c0106f3c:	e8 07 16 00 00       	call   c0108548 <Printf>
c0106f41:	83 c4 10             	add    $0x10,%esp
c0106f44:	83 ec 0c             	sub    $0xc,%esp
c0106f47:	68 a4 b6 10 c0       	push   $0xc010b6a4
c0106f4c:	e8 f7 15 00 00       	call   c0108548 <Printf>
c0106f51:	83 c4 10             	add    $0x10,%esp
c0106f54:	83 ec 0c             	sub    $0xc,%esp
c0106f57:	ff 75 c8             	pushl  -0x38(%ebp)
c0106f5a:	e8 3b de ff ff       	call   c0104d9a <close>
c0106f5f:	83 c4 10             	add    $0x10,%esp
c0106f62:	83 ec 0c             	sub    $0xc,%esp
c0106f65:	68 b2 b6 10 c0       	push   $0xc010b6b2
c0106f6a:	e8 d9 15 00 00       	call   c0108548 <Printf>
c0106f6f:	83 c4 10             	add    $0x10,%esp
c0106f72:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c0106f76:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0106f7a:	0f 8f 93 fd ff ff    	jg     c0106d13 <untar+0x54>
c0106f80:	eb 01                	jmp    c0106f83 <untar+0x2c4>
c0106f82:	90                   	nop
c0106f83:	83 ec 0c             	sub    $0xc,%esp
c0106f86:	68 bf b6 10 c0       	push   $0xc010b6bf
c0106f8b:	e8 b8 15 00 00       	call   c0108548 <Printf>
c0106f90:	83 c4 10             	add    $0x10,%esp
c0106f93:	83 ec 0c             	sub    $0xc,%esp
c0106f96:	68 d1 b6 10 c0       	push   $0xc010b6d1
c0106f9b:	e8 a8 15 00 00       	call   c0108548 <Printf>
c0106fa0:	83 c4 10             	add    $0x10,%esp
c0106fa3:	83 ec 0c             	sub    $0xc,%esp
c0106fa6:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106fa9:	e8 ec dd ff ff       	call   c0104d9a <close>
c0106fae:	83 c4 10             	add    $0x10,%esp
c0106fb1:	83 ec 0c             	sub    $0xc,%esp
c0106fb4:	68 e1 b6 10 c0       	push   $0xc010b6e1
c0106fb9:	e8 8a 15 00 00       	call   c0108548 <Printf>
c0106fbe:	83 c4 10             	add    $0x10,%esp
c0106fc1:	83 ec 0c             	sub    $0xc,%esp
c0106fc4:	68 f4 b6 10 c0       	push   $0xc010b6f4
c0106fc9:	e8 7a 15 00 00       	call   c0108548 <Printf>
c0106fce:	83 c4 10             	add    $0x10,%esp
c0106fd1:	90                   	nop
c0106fd2:	c9                   	leave  
c0106fd3:	c3                   	ret    

c0106fd4 <atoi>:
c0106fd4:	55                   	push   %ebp
c0106fd5:	89 e5                	mov    %esp,%ebp
c0106fd7:	83 ec 10             	sub    $0x10,%esp
c0106fda:	8b 45 08             	mov    0x8(%ebp),%eax
c0106fdd:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0106fe0:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106fe3:	8d 50 01             	lea    0x1(%eax),%edx
c0106fe6:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0106fe9:	c6 00 30             	movb   $0x30,(%eax)
c0106fec:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106fef:	8d 50 01             	lea    0x1(%eax),%edx
c0106ff2:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0106ff5:	c6 00 78             	movb   $0x78,(%eax)
c0106ff8:	c6 45 fa 00          	movb   $0x0,-0x6(%ebp)
c0106ffc:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0107000:	75 0e                	jne    c0107010 <atoi+0x3c>
c0107002:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0107005:	8d 50 01             	lea    0x1(%eax),%edx
c0107008:	89 55 fc             	mov    %edx,-0x4(%ebp)
c010700b:	c6 00 30             	movb   $0x30,(%eax)
c010700e:	eb 61                	jmp    c0107071 <atoi+0x9d>
c0107010:	c7 45 f4 1c 00 00 00 	movl   $0x1c,-0xc(%ebp)
c0107017:	eb 52                	jmp    c010706b <atoi+0x97>
c0107019:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010701c:	8b 55 0c             	mov    0xc(%ebp),%edx
c010701f:	89 c1                	mov    %eax,%ecx
c0107021:	d3 fa                	sar    %cl,%edx
c0107023:	89 d0                	mov    %edx,%eax
c0107025:	83 e0 0f             	and    $0xf,%eax
c0107028:	88 45 fb             	mov    %al,-0x5(%ebp)
c010702b:	80 7d fa 00          	cmpb   $0x0,-0x6(%ebp)
c010702f:	75 06                	jne    c0107037 <atoi+0x63>
c0107031:	80 7d fb 00          	cmpb   $0x0,-0x5(%ebp)
c0107035:	74 2f                	je     c0107066 <atoi+0x92>
c0107037:	c6 45 fa 01          	movb   $0x1,-0x6(%ebp)
c010703b:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c010703f:	83 c0 30             	add    $0x30,%eax
c0107042:	88 45 fb             	mov    %al,-0x5(%ebp)
c0107045:	80 7d fb 39          	cmpb   $0x39,-0x5(%ebp)
c0107049:	7e 0a                	jle    c0107055 <atoi+0x81>
c010704b:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c010704f:	83 c0 07             	add    $0x7,%eax
c0107052:	88 45 fb             	mov    %al,-0x5(%ebp)
c0107055:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0107058:	8d 50 01             	lea    0x1(%eax),%edx
c010705b:	89 55 fc             	mov    %edx,-0x4(%ebp)
c010705e:	0f b6 55 fb          	movzbl -0x5(%ebp),%edx
c0107062:	88 10                	mov    %dl,(%eax)
c0107064:	eb 01                	jmp    c0107067 <atoi+0x93>
c0107066:	90                   	nop
c0107067:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c010706b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010706f:	79 a8                	jns    c0107019 <atoi+0x45>
c0107071:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0107074:	c6 00 00             	movb   $0x0,(%eax)
c0107077:	90                   	nop
c0107078:	c9                   	leave  
c0107079:	c3                   	ret    

c010707a <disp_int>:
c010707a:	55                   	push   %ebp
c010707b:	89 e5                	mov    %esp,%ebp
c010707d:	83 ec 18             	sub    $0x18,%esp
c0107080:	ff 75 08             	pushl  0x8(%ebp)
c0107083:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0107086:	50                   	push   %eax
c0107087:	e8 48 ff ff ff       	call   c0106fd4 <atoi>
c010708c:	83 c4 08             	add    $0x8,%esp
c010708f:	83 ec 08             	sub    $0x8,%esp
c0107092:	6a 0b                	push   $0xb
c0107094:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0107097:	50                   	push   %eax
c0107098:	e8 2a 90 ff ff       	call   c01000c7 <disp_str_colour>
c010709d:	83 c4 10             	add    $0x10,%esp
c01070a0:	90                   	nop
c01070a1:	c9                   	leave  
c01070a2:	c3                   	ret    

c01070a3 <do_page_fault>:
c01070a3:	55                   	push   %ebp
c01070a4:	89 e5                	mov    %esp,%ebp
c01070a6:	83 ec 28             	sub    $0x28,%esp
c01070a9:	0f 20 d0             	mov    %cr2,%eax
c01070ac:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01070af:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c01070b6:	00 00 00 
c01070b9:	83 ec 0c             	sub    $0xc,%esp
c01070bc:	68 ff b6 10 c0       	push   $0xc010b6ff
c01070c1:	e8 c6 8f ff ff       	call   c010008c <disp_str>
c01070c6:	83 c4 10             	add    $0x10,%esp
c01070c9:	83 ec 0c             	sub    $0xc,%esp
c01070cc:	68 0e b7 10 c0       	push   $0xc010b70e
c01070d1:	e8 b6 8f ff ff       	call   c010008c <disp_str>
c01070d6:	83 c4 10             	add    $0x10,%esp
c01070d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01070dc:	83 ec 0c             	sub    $0xc,%esp
c01070df:	50                   	push   %eax
c01070e0:	e8 95 ff ff ff       	call   c010707a <disp_int>
c01070e5:	83 c4 10             	add    $0x10,%esp
c01070e8:	83 ec 0c             	sub    $0xc,%esp
c01070eb:	68 13 b7 10 c0       	push   $0xc010b713
c01070f0:	e8 97 8f ff ff       	call   c010008c <disp_str>
c01070f5:	83 c4 10             	add    $0x10,%esp
c01070f8:	83 ec 0c             	sub    $0xc,%esp
c01070fb:	ff 75 f4             	pushl  -0xc(%ebp)
c01070fe:	e8 51 ec ff ff       	call   c0105d54 <ptr_pde>
c0107103:	83 c4 10             	add    $0x10,%esp
c0107106:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107109:	83 ec 0c             	sub    $0xc,%esp
c010710c:	ff 75 f4             	pushl  -0xc(%ebp)
c010710f:	e8 53 ec ff ff       	call   c0105d67 <ptr_pte>
c0107114:	83 c4 10             	add    $0x10,%esp
c0107117:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010711a:	83 ec 0c             	sub    $0xc,%esp
c010711d:	68 15 b7 10 c0       	push   $0xc010b715
c0107122:	e8 65 8f ff ff       	call   c010008c <disp_str>
c0107127:	83 c4 10             	add    $0x10,%esp
c010712a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010712d:	83 ec 0c             	sub    $0xc,%esp
c0107130:	50                   	push   %eax
c0107131:	e8 44 ff ff ff       	call   c010707a <disp_int>
c0107136:	83 c4 10             	add    $0x10,%esp
c0107139:	83 ec 0c             	sub    $0xc,%esp
c010713c:	68 1a b7 10 c0       	push   $0xc010b71a
c0107141:	e8 46 8f ff ff       	call   c010008c <disp_str>
c0107146:	83 c4 10             	add    $0x10,%esp
c0107149:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010714c:	8b 00                	mov    (%eax),%eax
c010714e:	83 ec 0c             	sub    $0xc,%esp
c0107151:	50                   	push   %eax
c0107152:	e8 23 ff ff ff       	call   c010707a <disp_int>
c0107157:	83 c4 10             	add    $0x10,%esp
c010715a:	83 ec 0c             	sub    $0xc,%esp
c010715d:	68 13 b7 10 c0       	push   $0xc010b713
c0107162:	e8 25 8f ff ff       	call   c010008c <disp_str>
c0107167:	83 c4 10             	add    $0x10,%esp
c010716a:	83 ec 0c             	sub    $0xc,%esp
c010716d:	68 23 b7 10 c0       	push   $0xc010b723
c0107172:	e8 15 8f ff ff       	call   c010008c <disp_str>
c0107177:	83 c4 10             	add    $0x10,%esp
c010717a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010717d:	83 ec 0c             	sub    $0xc,%esp
c0107180:	50                   	push   %eax
c0107181:	e8 f4 fe ff ff       	call   c010707a <disp_int>
c0107186:	83 c4 10             	add    $0x10,%esp
c0107189:	83 ec 0c             	sub    $0xc,%esp
c010718c:	68 28 b7 10 c0       	push   $0xc010b728
c0107191:	e8 f6 8e ff ff       	call   c010008c <disp_str>
c0107196:	83 c4 10             	add    $0x10,%esp
c0107199:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010719c:	8b 00                	mov    (%eax),%eax
c010719e:	83 ec 0c             	sub    $0xc,%esp
c01071a1:	50                   	push   %eax
c01071a2:	e8 d3 fe ff ff       	call   c010707a <disp_int>
c01071a7:	83 c4 10             	add    $0x10,%esp
c01071aa:	83 ec 0c             	sub    $0xc,%esp
c01071ad:	68 13 b7 10 c0       	push   $0xc010b713
c01071b2:	e8 d5 8e ff ff       	call   c010008c <disp_str>
c01071b7:	83 c4 10             	add    $0x10,%esp
c01071ba:	c7 45 e8 00 00 10 00 	movl   $0x100000,-0x18(%ebp)
c01071c1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01071c4:	8b 00                	mov    (%eax),%eax
c01071c6:	83 e0 01             	and    $0x1,%eax
c01071c9:	85 c0                	test   %eax,%eax
c01071cb:	74 09                	je     c01071d6 <do_page_fault+0x133>
c01071cd:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
c01071d4:	eb 07                	jmp    c01071dd <do_page_fault+0x13a>
c01071d6:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01071dd:	90                   	nop
c01071de:	c9                   	leave  
c01071df:	c3                   	ret    

c01071e0 <exception_handler>:
c01071e0:	55                   	push   %ebp
c01071e1:	89 e5                	mov    %esp,%ebp
c01071e3:	57                   	push   %edi
c01071e4:	56                   	push   %esi
c01071e5:	53                   	push   %ebx
c01071e6:	83 ec 6c             	sub    $0x6c,%esp
c01071e9:	8d 45 8c             	lea    -0x74(%ebp),%eax
c01071ec:	bb a0 b9 10 c0       	mov    $0xc010b9a0,%ebx
c01071f1:	ba 13 00 00 00       	mov    $0x13,%edx
c01071f6:	89 c7                	mov    %eax,%edi
c01071f8:	89 de                	mov    %ebx,%esi
c01071fa:	89 d1                	mov    %edx,%ecx
c01071fc:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c01071fe:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0107205:	eb 04                	jmp    c010720b <exception_handler+0x2b>
c0107207:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c010720b:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c0107212:	7e f3                	jle    c0107207 <exception_handler+0x27>
c0107214:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c010721b:	00 00 00 
c010721e:	83 ec 0c             	sub    $0xc,%esp
c0107221:	68 31 b7 10 c0       	push   $0xc010b731
c0107226:	e8 61 8e ff ff       	call   c010008c <disp_str>
c010722b:	83 c4 10             	add    $0x10,%esp
c010722e:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c0107235:	8b 45 08             	mov    0x8(%ebp),%eax
c0107238:	8b 44 85 8c          	mov    -0x74(%ebp,%eax,4),%eax
c010723c:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010723f:	83 ec 0c             	sub    $0xc,%esp
c0107242:	ff 75 dc             	pushl  -0x24(%ebp)
c0107245:	e8 42 8e ff ff       	call   c010008c <disp_str>
c010724a:	83 c4 10             	add    $0x10,%esp
c010724d:	83 ec 0c             	sub    $0xc,%esp
c0107250:	68 3f b7 10 c0       	push   $0xc010b73f
c0107255:	e8 32 8e ff ff       	call   c010008c <disp_str>
c010725a:	83 c4 10             	add    $0x10,%esp
c010725d:	83 ec 0c             	sub    $0xc,%esp
c0107260:	68 42 b7 10 c0       	push   $0xc010b742
c0107265:	e8 22 8e ff ff       	call   c010008c <disp_str>
c010726a:	83 c4 10             	add    $0x10,%esp
c010726d:	8b 45 08             	mov    0x8(%ebp),%eax
c0107270:	83 ec 0c             	sub    $0xc,%esp
c0107273:	50                   	push   %eax
c0107274:	e8 01 fe ff ff       	call   c010707a <disp_int>
c0107279:	83 c4 10             	add    $0x10,%esp
c010727c:	83 ec 0c             	sub    $0xc,%esp
c010727f:	68 3f b7 10 c0       	push   $0xc010b73f
c0107284:	e8 03 8e ff ff       	call   c010008c <disp_str>
c0107289:	83 c4 10             	add    $0x10,%esp
c010728c:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c0107290:	74 2f                	je     c01072c1 <exception_handler+0xe1>
c0107292:	83 ec 0c             	sub    $0xc,%esp
c0107295:	68 4a b7 10 c0       	push   $0xc010b74a
c010729a:	e8 ed 8d ff ff       	call   c010008c <disp_str>
c010729f:	83 c4 10             	add    $0x10,%esp
c01072a2:	8b 45 0c             	mov    0xc(%ebp),%eax
c01072a5:	83 ec 0c             	sub    $0xc,%esp
c01072a8:	50                   	push   %eax
c01072a9:	e8 cc fd ff ff       	call   c010707a <disp_int>
c01072ae:	83 c4 10             	add    $0x10,%esp
c01072b1:	83 ec 0c             	sub    $0xc,%esp
c01072b4:	68 3f b7 10 c0       	push   $0xc010b73f
c01072b9:	e8 ce 8d ff ff       	call   c010008c <disp_str>
c01072be:	83 c4 10             	add    $0x10,%esp
c01072c1:	83 ec 0c             	sub    $0xc,%esp
c01072c4:	68 54 b7 10 c0       	push   $0xc010b754
c01072c9:	e8 be 8d ff ff       	call   c010008c <disp_str>
c01072ce:	83 c4 10             	add    $0x10,%esp
c01072d1:	83 ec 0c             	sub    $0xc,%esp
c01072d4:	ff 75 14             	pushl  0x14(%ebp)
c01072d7:	e8 9e fd ff ff       	call   c010707a <disp_int>
c01072dc:	83 c4 10             	add    $0x10,%esp
c01072df:	83 ec 0c             	sub    $0xc,%esp
c01072e2:	68 3f b7 10 c0       	push   $0xc010b73f
c01072e7:	e8 a0 8d ff ff       	call   c010008c <disp_str>
c01072ec:	83 c4 10             	add    $0x10,%esp
c01072ef:	83 ec 0c             	sub    $0xc,%esp
c01072f2:	68 58 b7 10 c0       	push   $0xc010b758
c01072f7:	e8 90 8d ff ff       	call   c010008c <disp_str>
c01072fc:	83 c4 10             	add    $0x10,%esp
c01072ff:	8b 45 10             	mov    0x10(%ebp),%eax
c0107302:	83 ec 0c             	sub    $0xc,%esp
c0107305:	50                   	push   %eax
c0107306:	e8 6f fd ff ff       	call   c010707a <disp_int>
c010730b:	83 c4 10             	add    $0x10,%esp
c010730e:	83 ec 0c             	sub    $0xc,%esp
c0107311:	68 3f b7 10 c0       	push   $0xc010b73f
c0107316:	e8 71 8d ff ff       	call   c010008c <disp_str>
c010731b:	83 c4 10             	add    $0x10,%esp
c010731e:	83 ec 0c             	sub    $0xc,%esp
c0107321:	68 5d b7 10 c0       	push   $0xc010b75d
c0107326:	e8 61 8d ff ff       	call   c010008c <disp_str>
c010732b:	83 c4 10             	add    $0x10,%esp
c010732e:	83 ec 0c             	sub    $0xc,%esp
c0107331:	ff 75 18             	pushl  0x18(%ebp)
c0107334:	e8 41 fd ff ff       	call   c010707a <disp_int>
c0107339:	83 c4 10             	add    $0x10,%esp
c010733c:	83 ec 0c             	sub    $0xc,%esp
c010733f:	68 3f b7 10 c0       	push   $0xc010b73f
c0107344:	e8 43 8d ff ff       	call   c010008c <disp_str>
c0107349:	83 c4 10             	add    $0x10,%esp
c010734c:	83 ec 0c             	sub    $0xc,%esp
c010734f:	68 68 b7 10 c0       	push   $0xc010b768
c0107354:	e8 33 8d ff ff       	call   c010008c <disp_str>
c0107359:	83 c4 10             	add    $0x10,%esp
c010735c:	83 7d 08 0e          	cmpl   $0xe,0x8(%ebp)
c0107360:	75 45                	jne    c01073a7 <exception_handler+0x1c7>
c0107362:	0f 20 d0             	mov    %cr2,%eax
c0107365:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0107368:	83 ec 0c             	sub    $0xc,%esp
c010736b:	68 87 b7 10 c0       	push   $0xc010b787
c0107370:	e8 17 8d ff ff       	call   c010008c <disp_str>
c0107375:	83 c4 10             	add    $0x10,%esp
c0107378:	83 ec 0c             	sub    $0xc,%esp
c010737b:	68 0e b7 10 c0       	push   $0xc010b70e
c0107380:	e8 07 8d ff ff       	call   c010008c <disp_str>
c0107385:	83 c4 10             	add    $0x10,%esp
c0107388:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010738b:	83 ec 0c             	sub    $0xc,%esp
c010738e:	50                   	push   %eax
c010738f:	e8 e6 fc ff ff       	call   c010707a <disp_int>
c0107394:	83 c4 10             	add    $0x10,%esp
c0107397:	83 ec 0c             	sub    $0xc,%esp
c010739a:	68 13 b7 10 c0       	push   $0xc010b713
c010739f:	e8 e8 8c ff ff       	call   c010008c <disp_str>
c01073a4:	83 c4 10             	add    $0x10,%esp
c01073a7:	83 7d 08 0d          	cmpl   $0xd,0x8(%ebp)
c01073ab:	75 11                	jne    c01073be <exception_handler+0x1de>
c01073ad:	83 ec 0c             	sub    $0xc,%esp
c01073b0:	68 93 b7 10 c0       	push   $0xc010b793
c01073b5:	e8 d2 8c ff ff       	call   c010008c <disp_str>
c01073ba:	83 c4 10             	add    $0x10,%esp
c01073bd:	90                   	nop
c01073be:	90                   	nop
c01073bf:	8d 65 f4             	lea    -0xc(%ebp),%esp
c01073c2:	5b                   	pop    %ebx
c01073c3:	5e                   	pop    %esi
c01073c4:	5f                   	pop    %edi
c01073c5:	5d                   	pop    %ebp
c01073c6:	c3                   	ret    

c01073c7 <init_internal_interrupt>:
c01073c7:	55                   	push   %ebp
c01073c8:	89 e5                	mov    %esp,%ebp
c01073ca:	83 ec 08             	sub    $0x8,%esp
c01073cd:	6a 0e                	push   $0xe
c01073cf:	6a 08                	push   $0x8
c01073d1:	68 03 01 10 c0       	push   $0xc0100103
c01073d6:	6a 00                	push   $0x0
c01073d8:	e8 62 c7 ff ff       	call   c0103b3f <InitInterruptDesc>
c01073dd:	83 c4 10             	add    $0x10,%esp
c01073e0:	6a 0e                	push   $0xe
c01073e2:	6a 08                	push   $0x8
c01073e4:	68 09 01 10 c0       	push   $0xc0100109
c01073e9:	6a 01                	push   $0x1
c01073eb:	e8 4f c7 ff ff       	call   c0103b3f <InitInterruptDesc>
c01073f0:	83 c4 10             	add    $0x10,%esp
c01073f3:	6a 0e                	push   $0xe
c01073f5:	6a 08                	push   $0x8
c01073f7:	68 0f 01 10 c0       	push   $0xc010010f
c01073fc:	6a 02                	push   $0x2
c01073fe:	e8 3c c7 ff ff       	call   c0103b3f <InitInterruptDesc>
c0107403:	83 c4 10             	add    $0x10,%esp
c0107406:	6a 0e                	push   $0xe
c0107408:	6a 08                	push   $0x8
c010740a:	68 15 01 10 c0       	push   $0xc0100115
c010740f:	6a 03                	push   $0x3
c0107411:	e8 29 c7 ff ff       	call   c0103b3f <InitInterruptDesc>
c0107416:	83 c4 10             	add    $0x10,%esp
c0107419:	6a 0e                	push   $0xe
c010741b:	6a 08                	push   $0x8
c010741d:	68 1b 01 10 c0       	push   $0xc010011b
c0107422:	6a 04                	push   $0x4
c0107424:	e8 16 c7 ff ff       	call   c0103b3f <InitInterruptDesc>
c0107429:	83 c4 10             	add    $0x10,%esp
c010742c:	6a 0e                	push   $0xe
c010742e:	6a 08                	push   $0x8
c0107430:	68 21 01 10 c0       	push   $0xc0100121
c0107435:	6a 05                	push   $0x5
c0107437:	e8 03 c7 ff ff       	call   c0103b3f <InitInterruptDesc>
c010743c:	83 c4 10             	add    $0x10,%esp
c010743f:	6a 0e                	push   $0xe
c0107441:	6a 08                	push   $0x8
c0107443:	68 27 01 10 c0       	push   $0xc0100127
c0107448:	6a 06                	push   $0x6
c010744a:	e8 f0 c6 ff ff       	call   c0103b3f <InitInterruptDesc>
c010744f:	83 c4 10             	add    $0x10,%esp
c0107452:	6a 0e                	push   $0xe
c0107454:	6a 08                	push   $0x8
c0107456:	68 2d 01 10 c0       	push   $0xc010012d
c010745b:	6a 07                	push   $0x7
c010745d:	e8 dd c6 ff ff       	call   c0103b3f <InitInterruptDesc>
c0107462:	83 c4 10             	add    $0x10,%esp
c0107465:	6a 0e                	push   $0xe
c0107467:	6a 08                	push   $0x8
c0107469:	68 33 01 10 c0       	push   $0xc0100133
c010746e:	6a 08                	push   $0x8
c0107470:	e8 ca c6 ff ff       	call   c0103b3f <InitInterruptDesc>
c0107475:	83 c4 10             	add    $0x10,%esp
c0107478:	6a 0e                	push   $0xe
c010747a:	6a 08                	push   $0x8
c010747c:	68 37 01 10 c0       	push   $0xc0100137
c0107481:	6a 09                	push   $0x9
c0107483:	e8 b7 c6 ff ff       	call   c0103b3f <InitInterruptDesc>
c0107488:	83 c4 10             	add    $0x10,%esp
c010748b:	6a 0e                	push   $0xe
c010748d:	6a 08                	push   $0x8
c010748f:	68 3d 01 10 c0       	push   $0xc010013d
c0107494:	6a 0a                	push   $0xa
c0107496:	e8 a4 c6 ff ff       	call   c0103b3f <InitInterruptDesc>
c010749b:	83 c4 10             	add    $0x10,%esp
c010749e:	6a 0e                	push   $0xe
c01074a0:	6a 08                	push   $0x8
c01074a2:	68 41 01 10 c0       	push   $0xc0100141
c01074a7:	6a 0b                	push   $0xb
c01074a9:	e8 91 c6 ff ff       	call   c0103b3f <InitInterruptDesc>
c01074ae:	83 c4 10             	add    $0x10,%esp
c01074b1:	6a 0e                	push   $0xe
c01074b3:	6a 08                	push   $0x8
c01074b5:	68 45 01 10 c0       	push   $0xc0100145
c01074ba:	6a 0c                	push   $0xc
c01074bc:	e8 7e c6 ff ff       	call   c0103b3f <InitInterruptDesc>
c01074c1:	83 c4 10             	add    $0x10,%esp
c01074c4:	6a 0e                	push   $0xe
c01074c6:	6a 08                	push   $0x8
c01074c8:	68 49 01 10 c0       	push   $0xc0100149
c01074cd:	6a 0d                	push   $0xd
c01074cf:	e8 6b c6 ff ff       	call   c0103b3f <InitInterruptDesc>
c01074d4:	83 c4 10             	add    $0x10,%esp
c01074d7:	6a 0e                	push   $0xe
c01074d9:	6a 08                	push   $0x8
c01074db:	68 54 01 10 c0       	push   $0xc0100154
c01074e0:	6a 0e                	push   $0xe
c01074e2:	e8 58 c6 ff ff       	call   c0103b3f <InitInterruptDesc>
c01074e7:	83 c4 10             	add    $0x10,%esp
c01074ea:	6a 0e                	push   $0xe
c01074ec:	6a 08                	push   $0x8
c01074ee:	68 58 01 10 c0       	push   $0xc0100158
c01074f3:	6a 10                	push   $0x10
c01074f5:	e8 45 c6 ff ff       	call   c0103b3f <InitInterruptDesc>
c01074fa:	83 c4 10             	add    $0x10,%esp
c01074fd:	6a 0e                	push   $0xe
c01074ff:	6a 08                	push   $0x8
c0107501:	68 5e 01 10 c0       	push   $0xc010015e
c0107506:	6a 11                	push   $0x11
c0107508:	e8 32 c6 ff ff       	call   c0103b3f <InitInterruptDesc>
c010750d:	83 c4 10             	add    $0x10,%esp
c0107510:	6a 0e                	push   $0xe
c0107512:	6a 08                	push   $0x8
c0107514:	68 62 01 10 c0       	push   $0xc0100162
c0107519:	6a 12                	push   $0x12
c010751b:	e8 1f c6 ff ff       	call   c0103b3f <InitInterruptDesc>
c0107520:	83 c4 10             	add    $0x10,%esp
c0107523:	6a 0e                	push   $0xe
c0107525:	6a 0e                	push   $0xe
c0107527:	68 6a 02 10 c0       	push   $0xc010026a
c010752c:	68 90 00 00 00       	push   $0x90
c0107531:	e8 09 c6 ff ff       	call   c0103b3f <InitInterruptDesc>
c0107536:	83 c4 10             	add    $0x10,%esp
c0107539:	90                   	nop
c010753a:	c9                   	leave  
c010753b:	c3                   	ret    

c010753c <spurious_irq>:
c010753c:	55                   	push   %ebp
c010753d:	89 e5                	mov    %esp,%ebp
c010753f:	83 ec 08             	sub    $0x8,%esp
c0107542:	83 ec 08             	sub    $0x8,%esp
c0107545:	6a 0b                	push   $0xb
c0107547:	68 ec b9 10 c0       	push   $0xc010b9ec
c010754c:	e8 76 8b ff ff       	call   c01000c7 <disp_str_colour>
c0107551:	83 c4 10             	add    $0x10,%esp
c0107554:	83 ec 0c             	sub    $0xc,%esp
c0107557:	ff 75 08             	pushl  0x8(%ebp)
c010755a:	e8 1b fb ff ff       	call   c010707a <disp_int>
c010755f:	83 c4 10             	add    $0x10,%esp
c0107562:	a1 e8 0e 11 c0       	mov    0xc0110ee8,%eax
c0107567:	8b 15 ec 0e 11 c0    	mov    0xc0110eec,%edx
c010756d:	83 c0 01             	add    $0x1,%eax
c0107570:	83 d2 00             	adc    $0x0,%edx
c0107573:	a3 e8 0e 11 c0       	mov    %eax,0xc0110ee8
c0107578:	89 15 ec 0e 11 c0    	mov    %edx,0xc0110eec
c010757e:	83 ec 0c             	sub    $0xc,%esp
c0107581:	68 00 b6 10 c0       	push   $0xc010b600
c0107586:	e8 01 8b ff ff       	call   c010008c <disp_str>
c010758b:	83 c4 10             	add    $0x10,%esp
c010758e:	a1 e8 0e 11 c0       	mov    0xc0110ee8,%eax
c0107593:	8b 15 ec 0e 11 c0    	mov    0xc0110eec,%edx
c0107599:	83 ec 0c             	sub    $0xc,%esp
c010759c:	50                   	push   %eax
c010759d:	e8 d8 fa ff ff       	call   c010707a <disp_int>
c01075a2:	83 c4 10             	add    $0x10,%esp
c01075a5:	83 ec 0c             	sub    $0xc,%esp
c01075a8:	68 02 b6 10 c0       	push   $0xc010b602
c01075ad:	e8 da 8a ff ff       	call   c010008c <disp_str>
c01075b2:	83 c4 10             	add    $0x10,%esp
c01075b5:	83 ec 08             	sub    $0x8,%esp
c01075b8:	6a 0c                	push   $0xc
c01075ba:	68 14 ba 10 c0       	push   $0xc010ba14
c01075bf:	e8 03 8b ff ff       	call   c01000c7 <disp_str_colour>
c01075c4:	83 c4 10             	add    $0x10,%esp
c01075c7:	90                   	nop
c01075c8:	c9                   	leave  
c01075c9:	c3                   	ret    

c01075ca <init_keyboard>:
c01075ca:	55                   	push   %ebp
c01075cb:	89 e5                	mov    %esp,%ebp
c01075cd:	83 ec 08             	sub    $0x8,%esp
c01075d0:	83 ec 04             	sub    $0x4,%esp
c01075d3:	68 00 02 00 00       	push   $0x200
c01075d8:	6a 00                	push   $0x0
c01075da:	68 ec fb 10 c0       	push   $0xc010fbec
c01075df:	e8 eb 4b 00 00       	call   c010c1cf <Memset>
c01075e4:	83 c4 10             	add    $0x10,%esp
c01075e7:	c7 05 e0 fb 10 c0 ec 	movl   $0xc010fbec,0xc010fbe0
c01075ee:	fb 10 c0 
c01075f1:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c01075f6:	a3 e4 fb 10 c0       	mov    %eax,0xc010fbe4
c01075fb:	c7 05 e8 fb 10 c0 00 	movl   $0x0,0xc010fbe8
c0107602:	00 00 00 
c0107605:	e8 4f d3 ff ff       	call   c0104959 <init_keyboard_handler>
c010760a:	90                   	nop
c010760b:	c9                   	leave  
c010760c:	c3                   	ret    

c010760d <TestTTY>:
c010760d:	55                   	push   %ebp
c010760e:	89 e5                	mov    %esp,%ebp
c0107610:	83 ec 28             	sub    $0x28,%esp
c0107613:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c010761a:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0107621:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0107627:	83 ec 08             	sub    $0x8,%esp
c010762a:	6a 02                	push   $0x2
c010762c:	8d 45 de             	lea    -0x22(%ebp),%eax
c010762f:	50                   	push   %eax
c0107630:	e8 ca d4 ff ff       	call   c0104aff <open>
c0107635:	83 c4 10             	add    $0x10,%esp
c0107638:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010763b:	83 ec 08             	sub    $0x8,%esp
c010763e:	6a 02                	push   $0x2
c0107640:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107643:	50                   	push   %eax
c0107644:	e8 b6 d4 ff ff       	call   c0104aff <open>
c0107649:	83 c4 10             	add    $0x10,%esp
c010764c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010764f:	83 ec 0c             	sub    $0xc,%esp
c0107652:	68 39 ba 10 c0       	push   $0xc010ba39
c0107657:	e8 ec 0e 00 00       	call   c0108548 <Printf>
c010765c:	83 c4 10             	add    $0x10,%esp
c010765f:	83 ec 0c             	sub    $0xc,%esp
c0107662:	6a 0a                	push   $0xa
c0107664:	e8 73 9f ff ff       	call   c01015dc <sys_malloc>
c0107669:	83 c4 10             	add    $0x10,%esp
c010766c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010766f:	83 ec 04             	sub    $0x4,%esp
c0107672:	6a 0a                	push   $0xa
c0107674:	6a 00                	push   $0x0
c0107676:	ff 75 ec             	pushl  -0x14(%ebp)
c0107679:	e8 51 4b 00 00       	call   c010c1cf <Memset>
c010767e:	83 c4 10             	add    $0x10,%esp
c0107681:	83 ec 04             	sub    $0x4,%esp
c0107684:	6a 0a                	push   $0xa
c0107686:	ff 75 ec             	pushl  -0x14(%ebp)
c0107689:	ff 75 f0             	pushl  -0x10(%ebp)
c010768c:	e8 03 d5 ff ff       	call   c0104b94 <read>
c0107691:	83 c4 10             	add    $0x10,%esp
c0107694:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0107697:	83 ec 08             	sub    $0x8,%esp
c010769a:	ff 75 ec             	pushl  -0x14(%ebp)
c010769d:	68 4b ba 10 c0       	push   $0xc010ba4b
c01076a2:	e8 a1 0e 00 00       	call   c0108548 <Printf>
c01076a7:	83 c4 10             	add    $0x10,%esp
c01076aa:	eb c3                	jmp    c010766f <TestTTY+0x62>

c01076ac <TestReadReturnValue>:
c01076ac:	55                   	push   %ebp
c01076ad:	89 e5                	mov    %esp,%ebp
c01076af:	81 ec 18 02 00 00    	sub    $0x218,%esp
c01076b5:	c7 45 f4 55 ba 10 c0 	movl   $0xc010ba55,-0xc(%ebp)
c01076bc:	83 ec 08             	sub    $0x8,%esp
c01076bf:	6a 00                	push   $0x0
c01076c1:	ff 75 f4             	pushl  -0xc(%ebp)
c01076c4:	e8 36 d4 ff ff       	call   c0104aff <open>
c01076c9:	83 c4 10             	add    $0x10,%esp
c01076cc:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01076cf:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01076d6:	83 ec 04             	sub    $0x4,%esp
c01076d9:	68 cb 00 00 00       	push   $0xcb
c01076de:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c01076e4:	50                   	push   %eax
c01076e5:	ff 75 f0             	pushl  -0x10(%ebp)
c01076e8:	e8 a7 d4 ff ff       	call   c0104b94 <read>
c01076ed:	83 c4 10             	add    $0x10,%esp
c01076f0:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01076f3:	81 7d e8 cb 00 00 00 	cmpl   $0xcb,-0x18(%ebp)
c01076fa:	74 1c                	je     c0107718 <TestReadReturnValue+0x6c>
c01076fc:	68 08 02 00 00       	push   $0x208
c0107701:	68 61 ba 10 c0       	push   $0xc010ba61
c0107706:	68 61 ba 10 c0       	push   $0xc010ba61
c010770b:	68 71 ba 10 c0       	push   $0xc010ba71
c0107710:	e8 90 11 00 00       	call   c01088a5 <assertion_failure>
c0107715:	83 c4 10             	add    $0x10,%esp
c0107718:	83 ec 0c             	sub    $0xc,%esp
c010771b:	ff 75 f0             	pushl  -0x10(%ebp)
c010771e:	e8 77 d6 ff ff       	call   c0104d9a <close>
c0107723:	83 c4 10             	add    $0x10,%esp
c0107726:	90                   	nop
c0107727:	c9                   	leave  
c0107728:	c3                   	ret    

c0107729 <TestWriteReturnValue>:
c0107729:	55                   	push   %ebp
c010772a:	89 e5                	mov    %esp,%ebp
c010772c:	81 ec 28 02 00 00    	sub    $0x228,%esp
c0107732:	c7 45 f4 7c ba 10 c0 	movl   $0xc010ba7c,-0xc(%ebp)
c0107739:	83 ec 08             	sub    $0x8,%esp
c010773c:	6a 07                	push   $0x7
c010773e:	ff 75 f4             	pushl  -0xc(%ebp)
c0107741:	e8 b9 d3 ff ff       	call   c0104aff <open>
c0107746:	83 c4 10             	add    $0x10,%esp
c0107749:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010774c:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
c0107750:	75 1c                	jne    c010776e <TestWriteReturnValue+0x45>
c0107752:	68 12 02 00 00       	push   $0x212
c0107757:	68 61 ba 10 c0       	push   $0xc010ba61
c010775c:	68 61 ba 10 c0       	push   $0xc010ba61
c0107761:	68 89 ba 10 c0       	push   $0xc010ba89
c0107766:	e8 3a 11 00 00       	call   c01088a5 <assertion_failure>
c010776b:	83 c4 10             	add    $0x10,%esp
c010776e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0107775:	c7 45 e8 94 ba 10 c0 	movl   $0xc010ba94,-0x18(%ebp)
c010777c:	83 ec 0c             	sub    $0xc,%esp
c010777f:	ff 75 e8             	pushl  -0x18(%ebp)
c0107782:	e8 81 4a 00 00       	call   c010c208 <Strlen>
c0107787:	83 c4 10             	add    $0x10,%esp
c010778a:	83 ec 04             	sub    $0x4,%esp
c010778d:	50                   	push   %eax
c010778e:	ff 75 e8             	pushl  -0x18(%ebp)
c0107791:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c0107797:	50                   	push   %eax
c0107798:	e8 ef f4 ff ff       	call   c0106c8c <Memcpy>
c010779d:	83 c4 10             	add    $0x10,%esp
c01077a0:	83 ec 04             	sub    $0x4,%esp
c01077a3:	68 ff 01 00 00       	push   $0x1ff
c01077a8:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c01077ae:	50                   	push   %eax
c01077af:	ff 75 f0             	pushl  -0x10(%ebp)
c01077b2:	e8 5e d5 ff ff       	call   c0104d15 <write>
c01077b7:	83 c4 10             	add    $0x10,%esp
c01077ba:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01077bd:	83 ec 0c             	sub    $0xc,%esp
c01077c0:	ff 75 e8             	pushl  -0x18(%ebp)
c01077c3:	e8 40 4a 00 00       	call   c010c208 <Strlen>
c01077c8:	83 c4 10             	add    $0x10,%esp
c01077cb:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c01077ce:	74 1c                	je     c01077ec <TestWriteReturnValue+0xc3>
c01077d0:	68 1c 02 00 00       	push   $0x21c
c01077d5:	68 61 ba 10 c0       	push   $0xc010ba61
c01077da:	68 61 ba 10 c0       	push   $0xc010ba61
c01077df:	68 c7 ba 10 c0       	push   $0xc010bac7
c01077e4:	e8 bc 10 00 00       	call   c01088a5 <assertion_failure>
c01077e9:	83 c4 10             	add    $0x10,%esp
c01077ec:	83 ec 0c             	sub    $0xc,%esp
c01077ef:	ff 75 f0             	pushl  -0x10(%ebp)
c01077f2:	e8 a3 d5 ff ff       	call   c0104d9a <close>
c01077f7:	83 c4 10             	add    $0x10,%esp
c01077fa:	90                   	nop
c01077fb:	c9                   	leave  
c01077fc:	c3                   	ret    

c01077fd <TestFS2>:
c01077fd:	55                   	push   %ebp
c01077fe:	89 e5                	mov    %esp,%ebp
c0107800:	83 ec 08             	sub    $0x8,%esp
c0107803:	e8 21 ff ff ff       	call   c0107729 <TestWriteReturnValue>
c0107808:	90                   	nop
c0107809:	c9                   	leave  
c010780a:	c3                   	ret    

c010780b <TestFS>:
c010780b:	55                   	push   %ebp
c010780c:	89 e5                	mov    %esp,%ebp
c010780e:	57                   	push   %edi
c010780f:	56                   	push   %esi
c0107810:	53                   	push   %ebx
c0107811:	81 ec 8c 02 00 00    	sub    $0x28c,%esp
c0107817:	83 ec 0c             	sub    $0xc,%esp
c010781a:	68 da ba 10 c0       	push   $0xc010bada
c010781f:	e8 68 88 ff ff       	call   c010008c <disp_str>
c0107824:	83 c4 10             	add    $0x10,%esp
c0107827:	c7 45 ae 64 65 76 5f 	movl   $0x5f766564,-0x52(%ebp)
c010782e:	c7 45 b2 74 74 79 31 	movl   $0x31797474,-0x4e(%ebp)
c0107835:	66 c7 45 b6 00 00    	movw   $0x0,-0x4a(%ebp)
c010783b:	83 ec 08             	sub    $0x8,%esp
c010783e:	6a 02                	push   $0x2
c0107840:	8d 45 ae             	lea    -0x52(%ebp),%eax
c0107843:	50                   	push   %eax
c0107844:	e8 b6 d2 ff ff       	call   c0104aff <open>
c0107849:	83 c4 10             	add    $0x10,%esp
c010784c:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010784f:	83 ec 08             	sub    $0x8,%esp
c0107852:	6a 02                	push   $0x2
c0107854:	8d 45 ae             	lea    -0x52(%ebp),%eax
c0107857:	50                   	push   %eax
c0107858:	e8 a2 d2 ff ff       	call   c0104aff <open>
c010785d:	83 c4 10             	add    $0x10,%esp
c0107860:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0107863:	83 ec 0c             	sub    $0xc,%esp
c0107866:	68 39 ba 10 c0       	push   $0xc010ba39
c010786b:	e8 d8 0c 00 00       	call   c0108548 <Printf>
c0107870:	83 c4 10             	add    $0x10,%esp
c0107873:	c7 45 a9 41 43 00 00 	movl   $0x4341,-0x57(%ebp)
c010787a:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
c010787e:	c7 45 a4 63 41 42 00 	movl   $0x424163,-0x5c(%ebp)
c0107885:	c6 45 a8 00          	movb   $0x0,-0x58(%ebp)
c0107889:	c7 45 9a 49 4e 54 45 	movl   $0x45544e49,-0x66(%ebp)
c0107890:	c7 45 9e 52 52 55 50 	movl   $0x50555252,-0x62(%ebp)
c0107897:	66 c7 45 a2 54 00    	movw   $0x54,-0x5e(%ebp)
c010789d:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
c01078a4:	83 ec 0c             	sub    $0xc,%esp
c01078a7:	68 e2 ba 10 c0       	push   $0xc010bae2
c01078ac:	e8 97 0c 00 00       	call   c0108548 <Printf>
c01078b1:	83 c4 10             	add    $0x10,%esp
c01078b4:	83 7d d4 01          	cmpl   $0x1,-0x2c(%ebp)
c01078b8:	0f 85 e6 03 00 00    	jne    c0107ca4 <TestFS+0x499>
c01078be:	83 ec 08             	sub    $0x8,%esp
c01078c1:	6a 07                	push   $0x7
c01078c3:	8d 45 a9             	lea    -0x57(%ebp),%eax
c01078c6:	50                   	push   %eax
c01078c7:	e8 33 d2 ff ff       	call   c0104aff <open>
c01078cc:	83 c4 10             	add    $0x10,%esp
c01078cf:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01078d2:	83 ec 08             	sub    $0x8,%esp
c01078d5:	ff 75 d0             	pushl  -0x30(%ebp)
c01078d8:	68 fa ba 10 c0       	push   $0xc010bafa
c01078dd:	e8 66 0c 00 00       	call   c0108548 <Printf>
c01078e2:	83 c4 10             	add    $0x10,%esp
c01078e5:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c01078ec:	c7 45 86 63 67 3a 68 	movl   $0x683a6763,-0x7a(%ebp)
c01078f3:	c7 45 8a 65 6c 6c 6f 	movl   $0x6f6c6c65,-0x76(%ebp)
c01078fa:	c7 45 8e 2c 77 6f 72 	movl   $0x726f772c,-0x72(%ebp)
c0107901:	c7 45 92 6c 64 21 00 	movl   $0x21646c,-0x6e(%ebp)
c0107908:	c7 45 96 00 00 00 00 	movl   $0x0,-0x6a(%ebp)
c010790f:	83 ec 0c             	sub    $0xc,%esp
c0107912:	8d 45 86             	lea    -0x7a(%ebp),%eax
c0107915:	50                   	push   %eax
c0107916:	e8 ed 48 00 00       	call   c010c208 <Strlen>
c010791b:	83 c4 10             	add    $0x10,%esp
c010791e:	83 ec 04             	sub    $0x4,%esp
c0107921:	50                   	push   %eax
c0107922:	8d 45 86             	lea    -0x7a(%ebp),%eax
c0107925:	50                   	push   %eax
c0107926:	ff 75 d0             	pushl  -0x30(%ebp)
c0107929:	e8 e7 d3 ff ff       	call   c0104d15 <write>
c010792e:	83 c4 10             	add    $0x10,%esp
c0107931:	83 ec 0c             	sub    $0xc,%esp
c0107934:	ff 75 d0             	pushl  -0x30(%ebp)
c0107937:	e8 5e d4 ff ff       	call   c0104d9a <close>
c010793c:	83 c4 10             	add    $0x10,%esp
c010793f:	83 ec 08             	sub    $0x8,%esp
c0107942:	6a 00                	push   $0x0
c0107944:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0107947:	50                   	push   %eax
c0107948:	e8 b2 d1 ff ff       	call   c0104aff <open>
c010794d:	83 c4 10             	add    $0x10,%esp
c0107950:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0107953:	83 ec 04             	sub    $0x4,%esp
c0107956:	6a 14                	push   $0x14
c0107958:	6a 00                	push   $0x0
c010795a:	8d 85 72 ff ff ff    	lea    -0x8e(%ebp),%eax
c0107960:	50                   	push   %eax
c0107961:	e8 69 48 00 00       	call   c010c1cf <Memset>
c0107966:	83 c4 10             	add    $0x10,%esp
c0107969:	83 ec 04             	sub    $0x4,%esp
c010796c:	6a 12                	push   $0x12
c010796e:	8d 85 72 ff ff ff    	lea    -0x8e(%ebp),%eax
c0107974:	50                   	push   %eax
c0107975:	ff 75 d0             	pushl  -0x30(%ebp)
c0107978:	e8 17 d2 ff ff       	call   c0104b94 <read>
c010797d:	83 c4 10             	add    $0x10,%esp
c0107980:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0107983:	83 ec 08             	sub    $0x8,%esp
c0107986:	8d 85 72 ff ff ff    	lea    -0x8e(%ebp),%eax
c010798c:	50                   	push   %eax
c010798d:	68 03 bb 10 c0       	push   $0xc010bb03
c0107992:	e8 b1 0b 00 00       	call   c0108548 <Printf>
c0107997:	83 c4 10             	add    $0x10,%esp
c010799a:	83 ec 0c             	sub    $0xc,%esp
c010799d:	6a 0a                	push   $0xa
c010799f:	e8 70 0a 00 00       	call   c0108414 <delay>
c01079a4:	83 c4 10             	add    $0x10,%esp
c01079a7:	83 ec 08             	sub    $0x8,%esp
c01079aa:	6a 07                	push   $0x7
c01079ac:	8d 45 a4             	lea    -0x5c(%ebp),%eax
c01079af:	50                   	push   %eax
c01079b0:	e8 4a d1 ff ff       	call   c0104aff <open>
c01079b5:	83 c4 10             	add    $0x10,%esp
c01079b8:	89 45 c8             	mov    %eax,-0x38(%ebp)
c01079bb:	83 ec 08             	sub    $0x8,%esp
c01079be:	ff 75 c8             	pushl  -0x38(%ebp)
c01079c1:	68 0e bb 10 c0       	push   $0xc010bb0e
c01079c6:	e8 7d 0b 00 00       	call   c0108548 <Printf>
c01079cb:	83 c4 10             	add    $0x10,%esp
c01079ce:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c01079d5:	8d 85 92 fd ff ff    	lea    -0x26e(%ebp),%eax
c01079db:	bb 44 bb 10 c0       	mov    $0xc010bb44,%ebx
c01079e0:	ba bf 00 00 00       	mov    $0xbf,%edx
c01079e5:	8b 0b                	mov    (%ebx),%ecx
c01079e7:	89 08                	mov    %ecx,(%eax)
c01079e9:	8b 4c 13 fc          	mov    -0x4(%ebx,%edx,1),%ecx
c01079ed:	89 4c 10 fc          	mov    %ecx,-0x4(%eax,%edx,1)
c01079f1:	8d 78 04             	lea    0x4(%eax),%edi
c01079f4:	83 e7 fc             	and    $0xfffffffc,%edi
c01079f7:	29 f8                	sub    %edi,%eax
c01079f9:	29 c3                	sub    %eax,%ebx
c01079fb:	01 c2                	add    %eax,%edx
c01079fd:	83 e2 fc             	and    $0xfffffffc,%edx
c0107a00:	89 d0                	mov    %edx,%eax
c0107a02:	c1 e8 02             	shr    $0x2,%eax
c0107a05:	89 de                	mov    %ebx,%esi
c0107a07:	89 c1                	mov    %eax,%ecx
c0107a09:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0107a0b:	c7 85 51 fe ff ff 00 	movl   $0x0,-0x1af(%ebp)
c0107a12:	00 00 00 
c0107a15:	c7 85 55 fe ff ff 00 	movl   $0x0,-0x1ab(%ebp)
c0107a1c:	00 00 00 
c0107a1f:	c6 85 59 fe ff ff 00 	movb   $0x0,-0x1a7(%ebp)
c0107a26:	83 ec 0c             	sub    $0xc,%esp
c0107a29:	8d 85 92 fd ff ff    	lea    -0x26e(%ebp),%eax
c0107a2f:	50                   	push   %eax
c0107a30:	e8 d3 47 00 00       	call   c010c208 <Strlen>
c0107a35:	83 c4 10             	add    $0x10,%esp
c0107a38:	83 ec 04             	sub    $0x4,%esp
c0107a3b:	50                   	push   %eax
c0107a3c:	8d 85 92 fd ff ff    	lea    -0x26e(%ebp),%eax
c0107a42:	50                   	push   %eax
c0107a43:	ff 75 c8             	pushl  -0x38(%ebp)
c0107a46:	e8 ca d2 ff ff       	call   c0104d15 <write>
c0107a4b:	83 c4 10             	add    $0x10,%esp
c0107a4e:	83 ec 0c             	sub    $0xc,%esp
c0107a51:	ff 75 c8             	pushl  -0x38(%ebp)
c0107a54:	e8 41 d3 ff ff       	call   c0104d9a <close>
c0107a59:	83 c4 10             	add    $0x10,%esp
c0107a5c:	83 ec 08             	sub    $0x8,%esp
c0107a5f:	6a 00                	push   $0x0
c0107a61:	8d 45 a4             	lea    -0x5c(%ebp),%eax
c0107a64:	50                   	push   %eax
c0107a65:	e8 95 d0 ff ff       	call   c0104aff <open>
c0107a6a:	83 c4 10             	add    $0x10,%esp
c0107a6d:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0107a70:	83 ec 04             	sub    $0x4,%esp
c0107a73:	68 c8 00 00 00       	push   $0xc8
c0107a78:	6a 00                	push   $0x0
c0107a7a:	8d 85 5a fe ff ff    	lea    -0x1a6(%ebp),%eax
c0107a80:	50                   	push   %eax
c0107a81:	e8 49 47 00 00       	call   c010c1cf <Memset>
c0107a86:	83 c4 10             	add    $0x10,%esp
c0107a89:	83 ec 0c             	sub    $0xc,%esp
c0107a8c:	8d 85 92 fd ff ff    	lea    -0x26e(%ebp),%eax
c0107a92:	50                   	push   %eax
c0107a93:	e8 70 47 00 00       	call   c010c208 <Strlen>
c0107a98:	83 c4 10             	add    $0x10,%esp
c0107a9b:	83 ec 04             	sub    $0x4,%esp
c0107a9e:	50                   	push   %eax
c0107a9f:	8d 85 5a fe ff ff    	lea    -0x1a6(%ebp),%eax
c0107aa5:	50                   	push   %eax
c0107aa6:	ff 75 c8             	pushl  -0x38(%ebp)
c0107aa9:	e8 e6 d0 ff ff       	call   c0104b94 <read>
c0107aae:	83 c4 10             	add    $0x10,%esp
c0107ab1:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0107ab4:	83 ec 08             	sub    $0x8,%esp
c0107ab7:	8d 85 5a fe ff ff    	lea    -0x1a6(%ebp),%eax
c0107abd:	50                   	push   %eax
c0107abe:	68 18 bb 10 c0       	push   $0xc010bb18
c0107ac3:	e8 80 0a 00 00       	call   c0108548 <Printf>
c0107ac8:	83 c4 10             	add    $0x10,%esp
c0107acb:	83 ec 08             	sub    $0x8,%esp
c0107ace:	6a 07                	push   $0x7
c0107ad0:	8d 45 9a             	lea    -0x66(%ebp),%eax
c0107ad3:	50                   	push   %eax
c0107ad4:	e8 26 d0 ff ff       	call   c0104aff <open>
c0107ad9:	83 c4 10             	add    $0x10,%esp
c0107adc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0107adf:	83 ec 08             	sub    $0x8,%esp
c0107ae2:	ff 75 c8             	pushl  -0x38(%ebp)
c0107ae5:	68 0e bb 10 c0       	push   $0xc010bb0e
c0107aea:	e8 59 0a 00 00       	call   c0108548 <Printf>
c0107aef:	83 c4 10             	add    $0x10,%esp
c0107af2:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0107af9:	c7 85 54 ff ff ff 49 	movl   $0x69772049,-0xac(%ebp)
c0107b00:	20 77 69 
c0107b03:	c7 85 58 ff ff ff 6c 	movl   $0x73206c6c,-0xa8(%ebp)
c0107b0a:	6c 20 73 
c0107b0d:	c7 85 5c ff ff ff 75 	movl   $0x65636375,-0xa4(%ebp)
c0107b14:	63 63 65 
c0107b17:	c7 85 60 ff ff ff 73 	movl   $0x61207373,-0xa0(%ebp)
c0107b1e:	73 20 61 
c0107b21:	c7 85 64 ff ff ff 74 	movl   $0x616c2074,-0x9c(%ebp)
c0107b28:	20 6c 61 
c0107b2b:	c7 85 68 ff ff ff 73 	movl   $0x2e7473,-0x98(%ebp)
c0107b32:	74 2e 00 
c0107b35:	c7 85 6c ff ff ff 00 	movl   $0x0,-0x94(%ebp)
c0107b3c:	00 00 00 
c0107b3f:	66 c7 85 70 ff ff ff 	movw   $0x0,-0x90(%ebp)
c0107b46:	00 00 
c0107b48:	83 ec 0c             	sub    $0xc,%esp
c0107b4b:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
c0107b51:	50                   	push   %eax
c0107b52:	e8 b1 46 00 00       	call   c010c208 <Strlen>
c0107b57:	83 c4 10             	add    $0x10,%esp
c0107b5a:	83 ec 04             	sub    $0x4,%esp
c0107b5d:	50                   	push   %eax
c0107b5e:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
c0107b64:	50                   	push   %eax
c0107b65:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107b68:	e8 a8 d1 ff ff       	call   c0104d15 <write>
c0107b6d:	83 c4 10             	add    $0x10,%esp
c0107b70:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0107b77:	eb 7e                	jmp    c0107bf7 <TestFS+0x3ec>
c0107b79:	83 ec 0c             	sub    $0xc,%esp
c0107b7c:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107b7f:	e8 16 d2 ff ff       	call   c0104d9a <close>
c0107b84:	83 c4 10             	add    $0x10,%esp
c0107b87:	83 ec 08             	sub    $0x8,%esp
c0107b8a:	6a 00                	push   $0x0
c0107b8c:	8d 45 9a             	lea    -0x66(%ebp),%eax
c0107b8f:	50                   	push   %eax
c0107b90:	e8 6a cf ff ff       	call   c0104aff <open>
c0107b95:	83 c4 10             	add    $0x10,%esp
c0107b98:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0107b9b:	83 ec 04             	sub    $0x4,%esp
c0107b9e:	6a 1e                	push   $0x1e
c0107ba0:	6a 00                	push   $0x0
c0107ba2:	8d 85 36 ff ff ff    	lea    -0xca(%ebp),%eax
c0107ba8:	50                   	push   %eax
c0107ba9:	e8 21 46 00 00       	call   c010c1cf <Memset>
c0107bae:	83 c4 10             	add    $0x10,%esp
c0107bb1:	83 ec 0c             	sub    $0xc,%esp
c0107bb4:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
c0107bba:	50                   	push   %eax
c0107bbb:	e8 48 46 00 00       	call   c010c208 <Strlen>
c0107bc0:	83 c4 10             	add    $0x10,%esp
c0107bc3:	83 ec 04             	sub    $0x4,%esp
c0107bc6:	50                   	push   %eax
c0107bc7:	8d 85 36 ff ff ff    	lea    -0xca(%ebp),%eax
c0107bcd:	50                   	push   %eax
c0107bce:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107bd1:	e8 be cf ff ff       	call   c0104b94 <read>
c0107bd6:	83 c4 10             	add    $0x10,%esp
c0107bd9:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0107bdc:	83 ec 08             	sub    $0x8,%esp
c0107bdf:	8d 85 36 ff ff ff    	lea    -0xca(%ebp),%eax
c0107be5:	50                   	push   %eax
c0107be6:	68 23 bb 10 c0       	push   $0xc010bb23
c0107beb:	e8 58 09 00 00       	call   c0108548 <Printf>
c0107bf0:	83 c4 10             	add    $0x10,%esp
c0107bf3:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0107bf7:	83 7d e0 02          	cmpl   $0x2,-0x20(%ebp)
c0107bfb:	0f 8e 78 ff ff ff    	jle    c0107b79 <TestFS+0x36e>
c0107c01:	c7 85 22 ff ff ff 69 	movl   $0x74736e69,-0xde(%ebp)
c0107c08:	6e 73 74 
c0107c0b:	c7 85 26 ff ff ff 61 	movl   $0x2e6c6c61,-0xda(%ebp)
c0107c12:	6c 6c 2e 
c0107c15:	c7 85 2a ff ff ff 74 	movl   $0x726174,-0xd6(%ebp)
c0107c1c:	61 72 00 
c0107c1f:	c7 85 2e ff ff ff 00 	movl   $0x0,-0xd2(%ebp)
c0107c26:	00 00 00 
c0107c29:	c7 85 32 ff ff ff 00 	movl   $0x0,-0xce(%ebp)
c0107c30:	00 00 00 
c0107c33:	83 ec 08             	sub    $0x8,%esp
c0107c36:	6a 00                	push   $0x0
c0107c38:	8d 85 22 ff ff ff    	lea    -0xde(%ebp),%eax
c0107c3e:	50                   	push   %eax
c0107c3f:	e8 bb ce ff ff       	call   c0104aff <open>
c0107c44:	83 c4 10             	add    $0x10,%esp
c0107c47:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0107c4a:	83 ec 08             	sub    $0x8,%esp
c0107c4d:	ff 75 bc             	pushl  -0x44(%ebp)
c0107c50:	68 2e bb 10 c0       	push   $0xc010bb2e
c0107c55:	e8 ee 08 00 00       	call   c0108548 <Printf>
c0107c5a:	83 c4 10             	add    $0x10,%esp
c0107c5d:	83 ec 04             	sub    $0x4,%esp
c0107c60:	6a 28                	push   $0x28
c0107c62:	6a 00                	push   $0x0
c0107c64:	8d 85 6a fd ff ff    	lea    -0x296(%ebp),%eax
c0107c6a:	50                   	push   %eax
c0107c6b:	e8 5f 45 00 00       	call   c010c1cf <Memset>
c0107c70:	83 c4 10             	add    $0x10,%esp
c0107c73:	83 ec 04             	sub    $0x4,%esp
c0107c76:	6a 28                	push   $0x28
c0107c78:	8d 85 6a fd ff ff    	lea    -0x296(%ebp),%eax
c0107c7e:	50                   	push   %eax
c0107c7f:	ff 75 bc             	pushl  -0x44(%ebp)
c0107c82:	e8 0d cf ff ff       	call   c0104b94 <read>
c0107c87:	83 c4 10             	add    $0x10,%esp
c0107c8a:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0107c8d:	83 ec 08             	sub    $0x8,%esp
c0107c90:	8d 85 6a fd ff ff    	lea    -0x296(%ebp),%eax
c0107c96:	50                   	push   %eax
c0107c97:	68 38 bb 10 c0       	push   $0xc010bb38
c0107c9c:	e8 a7 08 00 00       	call   c0108548 <Printf>
c0107ca1:	83 c4 10             	add    $0x10,%esp
c0107ca4:	90                   	nop
c0107ca5:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0107ca8:	5b                   	pop    %ebx
c0107ca9:	5e                   	pop    %esi
c0107caa:	5f                   	pop    %edi
c0107cab:	5d                   	pop    %ebp
c0107cac:	c3                   	ret    

c0107cad <wait_exit>:
c0107cad:	55                   	push   %ebp
c0107cae:	89 e5                	mov    %esp,%ebp
c0107cb0:	83 ec 28             	sub    $0x28,%esp
c0107cb3:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0107cba:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0107cc1:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0107cc7:	83 ec 08             	sub    $0x8,%esp
c0107cca:	6a 02                	push   $0x2
c0107ccc:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107ccf:	50                   	push   %eax
c0107cd0:	e8 2a ce ff ff       	call   c0104aff <open>
c0107cd5:	83 c4 10             	add    $0x10,%esp
c0107cd8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107cdb:	83 ec 08             	sub    $0x8,%esp
c0107cde:	6a 02                	push   $0x2
c0107ce0:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107ce3:	50                   	push   %eax
c0107ce4:	e8 16 ce ff ff       	call   c0104aff <open>
c0107ce9:	83 c4 10             	add    $0x10,%esp
c0107cec:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0107cef:	e8 6b d1 ff ff       	call   c0104e5f <fork>
c0107cf4:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0107cf7:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0107cfb:	7e 35                	jle    c0107d32 <wait_exit+0x85>
c0107cfd:	83 ec 0c             	sub    $0xc,%esp
c0107d00:	68 0c bc 10 c0       	push   $0xc010bc0c
c0107d05:	e8 3e 08 00 00       	call   c0108548 <Printf>
c0107d0a:	83 c4 10             	add    $0x10,%esp
c0107d0d:	83 ec 0c             	sub    $0xc,%esp
c0107d10:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0107d13:	50                   	push   %eax
c0107d14:	e8 d3 d0 ff ff       	call   c0104dec <wait>
c0107d19:	83 c4 10             	add    $0x10,%esp
c0107d1c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0107d1f:	83 ec 08             	sub    $0x8,%esp
c0107d22:	50                   	push   %eax
c0107d23:	68 24 bc 10 c0       	push   $0xc010bc24
c0107d28:	e8 1b 08 00 00       	call   c0108548 <Printf>
c0107d2d:	83 c4 10             	add    $0x10,%esp
c0107d30:	eb fe                	jmp    c0107d30 <wait_exit+0x83>
c0107d32:	83 ec 0c             	sub    $0xc,%esp
c0107d35:	68 3f bc 10 c0       	push   $0xc010bc3f
c0107d3a:	e8 09 08 00 00       	call   c0108548 <Printf>
c0107d3f:	83 c4 10             	add    $0x10,%esp
c0107d42:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0107d49:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0107d4c:	8d 50 01             	lea    0x1(%eax),%edx
c0107d4f:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0107d52:	3d 50 c3 00 00       	cmp    $0xc350,%eax
c0107d57:	7f 02                	jg     c0107d5b <wait_exit+0xae>
c0107d59:	eb ee                	jmp    c0107d49 <wait_exit+0x9c>
c0107d5b:	90                   	nop
c0107d5c:	83 ec 0c             	sub    $0xc,%esp
c0107d5f:	68 4b bc 10 c0       	push   $0xc010bc4b
c0107d64:	e8 df 07 00 00       	call   c0108548 <Printf>
c0107d69:	83 c4 10             	add    $0x10,%esp
c0107d6c:	83 ec 0c             	sub    $0xc,%esp
c0107d6f:	68 59 bc 10 c0       	push   $0xc010bc59
c0107d74:	e8 cf 07 00 00       	call   c0108548 <Printf>
c0107d79:	83 c4 10             	add    $0x10,%esp
c0107d7c:	83 ec 0c             	sub    $0xc,%esp
c0107d7f:	68 68 bc 10 c0       	push   $0xc010bc68
c0107d84:	e8 bf 07 00 00       	call   c0108548 <Printf>
c0107d89:	83 c4 10             	add    $0x10,%esp
c0107d8c:	83 ec 0c             	sub    $0xc,%esp
c0107d8f:	6a 5a                	push   $0x5a
c0107d91:	e8 9a d0 ff ff       	call   c0104e30 <exit>
c0107d96:	83 c4 10             	add    $0x10,%esp
c0107d99:	83 ec 0c             	sub    $0xc,%esp
c0107d9c:	68 77 bc 10 c0       	push   $0xc010bc77
c0107da1:	e8 a2 07 00 00       	call   c0108548 <Printf>
c0107da6:	83 c4 10             	add    $0x10,%esp
c0107da9:	eb fe                	jmp    c0107da9 <wait_exit+0xfc>

c0107dab <INIT_fork>:
c0107dab:	55                   	push   %ebp
c0107dac:	89 e5                	mov    %esp,%ebp
c0107dae:	83 ec 78             	sub    $0x78,%esp
c0107db1:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0107db8:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0107dbf:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0107dc5:	83 ec 08             	sub    $0x8,%esp
c0107dc8:	6a 02                	push   $0x2
c0107dca:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107dcd:	50                   	push   %eax
c0107dce:	e8 2c cd ff ff       	call   c0104aff <open>
c0107dd3:	83 c4 10             	add    $0x10,%esp
c0107dd6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0107dd9:	83 ec 08             	sub    $0x8,%esp
c0107ddc:	6a 02                	push   $0x2
c0107dde:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107de1:	50                   	push   %eax
c0107de2:	e8 18 cd ff ff       	call   c0104aff <open>
c0107de7:	83 c4 10             	add    $0x10,%esp
c0107dea:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107ded:	c7 45 b6 49 4e 49 54 	movl   $0x54494e49,-0x4a(%ebp)
c0107df4:	c7 45 ba 20 69 73 20 	movl   $0x20736920,-0x46(%ebp)
c0107dfb:	c7 45 be 72 75 6e 6e 	movl   $0x6e6e7572,-0x42(%ebp)
c0107e02:	c7 45 c2 69 6e 67 0a 	movl   $0xa676e69,-0x3e(%ebp)
c0107e09:	c7 45 c6 00 00 00 00 	movl   $0x0,-0x3a(%ebp)
c0107e10:	c7 45 ca 00 00 00 00 	movl   $0x0,-0x36(%ebp)
c0107e17:	c7 45 ce 00 00 00 00 	movl   $0x0,-0x32(%ebp)
c0107e1e:	c7 45 d2 00 00 00 00 	movl   $0x0,-0x2e(%ebp)
c0107e25:	c7 45 d6 00 00 00 00 	movl   $0x0,-0x2a(%ebp)
c0107e2c:	c7 45 da 00 00 00 00 	movl   $0x0,-0x26(%ebp)
c0107e33:	83 ec 0c             	sub    $0xc,%esp
c0107e36:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107e39:	50                   	push   %eax
c0107e3a:	e8 09 07 00 00       	call   c0108548 <Printf>
c0107e3f:	83 c4 10             	add    $0x10,%esp
c0107e42:	83 ec 0c             	sub    $0xc,%esp
c0107e45:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107e48:	50                   	push   %eax
c0107e49:	e8 ba 43 00 00       	call   c010c208 <Strlen>
c0107e4e:	83 c4 10             	add    $0x10,%esp
c0107e51:	83 ec 04             	sub    $0x4,%esp
c0107e54:	50                   	push   %eax
c0107e55:	6a 00                	push   $0x0
c0107e57:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107e5a:	50                   	push   %eax
c0107e5b:	e8 6f 43 00 00       	call   c010c1cf <Memset>
c0107e60:	83 c4 10             	add    $0x10,%esp
c0107e63:	83 ec 04             	sub    $0x4,%esp
c0107e66:	6a 28                	push   $0x28
c0107e68:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107e6b:	50                   	push   %eax
c0107e6c:	ff 75 f0             	pushl  -0x10(%ebp)
c0107e6f:	e8 20 cd ff ff       	call   c0104b94 <read>
c0107e74:	83 c4 10             	add    $0x10,%esp
c0107e77:	83 ec 0c             	sub    $0xc,%esp
c0107e7a:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107e7d:	50                   	push   %eax
c0107e7e:	e8 c5 06 00 00       	call   c0108548 <Printf>
c0107e83:	83 c4 10             	add    $0x10,%esp
c0107e86:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0107e8d:	e8 cd cf ff ff       	call   c0104e5f <fork>
c0107e92:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0107e95:	83 ec 0c             	sub    $0xc,%esp
c0107e98:	6a 01                	push   $0x1
c0107e9a:	e8 75 05 00 00       	call   c0108414 <delay>
c0107e9f:	83 c4 10             	add    $0x10,%esp
c0107ea2:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0107ea6:	0f 8e cd 00 00 00    	jle    c0107f79 <INIT_fork+0x1ce>
c0107eac:	83 ec 08             	sub    $0x8,%esp
c0107eaf:	ff 75 e8             	pushl  -0x18(%ebp)
c0107eb2:	68 85 bc 10 c0       	push   $0xc010bc85
c0107eb7:	e8 8c 06 00 00       	call   c0108548 <Printf>
c0107ebc:	83 c4 10             	add    $0x10,%esp
c0107ebf:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0107ec3:	c7 45 8e 50 61 72 65 	movl   $0x65726150,-0x72(%ebp)
c0107eca:	c7 45 92 6e 74 2e 4e 	movl   $0x4e2e746e,-0x6e(%ebp)
c0107ed1:	c7 45 96 69 63 65 20 	movl   $0x20656369,-0x6a(%ebp)
c0107ed8:	c7 45 9a 74 6f 20 6d 	movl   $0x6d206f74,-0x66(%ebp)
c0107edf:	c7 45 9e 65 65 74 20 	movl   $0x20746565,-0x62(%ebp)
c0107ee6:	c7 45 a2 79 6f 75 21 	movl   $0x21756f79,-0x5e(%ebp)
c0107eed:	c7 45 a6 0a 00 00 00 	movl   $0xa,-0x5a(%ebp)
c0107ef4:	c7 45 aa 00 00 00 00 	movl   $0x0,-0x56(%ebp)
c0107efb:	c7 45 ae 00 00 00 00 	movl   $0x0,-0x52(%ebp)
c0107f02:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)
c0107f09:	83 ec 0c             	sub    $0xc,%esp
c0107f0c:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107f0f:	50                   	push   %eax
c0107f10:	e8 f3 42 00 00       	call   c010c208 <Strlen>
c0107f15:	83 c4 10             	add    $0x10,%esp
c0107f18:	83 ec 04             	sub    $0x4,%esp
c0107f1b:	50                   	push   %eax
c0107f1c:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107f1f:	50                   	push   %eax
c0107f20:	ff 75 f4             	pushl  -0xc(%ebp)
c0107f23:	e8 ed cd ff ff       	call   c0104d15 <write>
c0107f28:	83 c4 10             	add    $0x10,%esp
c0107f2b:	e8 b2 ec ff ff       	call   c0106be2 <catch_error>
c0107f30:	83 ec 0c             	sub    $0xc,%esp
c0107f33:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107f36:	50                   	push   %eax
c0107f37:	e8 cc 42 00 00       	call   c010c208 <Strlen>
c0107f3c:	83 c4 10             	add    $0x10,%esp
c0107f3f:	83 ec 04             	sub    $0x4,%esp
c0107f42:	50                   	push   %eax
c0107f43:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107f46:	50                   	push   %eax
c0107f47:	ff 75 f4             	pushl  -0xc(%ebp)
c0107f4a:	e8 c6 cd ff ff       	call   c0104d15 <write>
c0107f4f:	83 c4 10             	add    $0x10,%esp
c0107f52:	83 ec 0c             	sub    $0xc,%esp
c0107f55:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107f58:	50                   	push   %eax
c0107f59:	e8 aa 42 00 00       	call   c010c208 <Strlen>
c0107f5e:	83 c4 10             	add    $0x10,%esp
c0107f61:	83 ec 04             	sub    $0x4,%esp
c0107f64:	50                   	push   %eax
c0107f65:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107f68:	50                   	push   %eax
c0107f69:	ff 75 f4             	pushl  -0xc(%ebp)
c0107f6c:	e8 a4 cd ff ff       	call   c0104d15 <write>
c0107f71:	83 c4 10             	add    $0x10,%esp
c0107f74:	e9 d6 00 00 00       	jmp    c010804f <INIT_fork+0x2a4>
c0107f79:	83 ec 08             	sub    $0x8,%esp
c0107f7c:	ff 75 e8             	pushl  -0x18(%ebp)
c0107f7f:	68 85 bc 10 c0       	push   $0xc010bc85
c0107f84:	e8 bf 05 00 00       	call   c0108548 <Printf>
c0107f89:	83 c4 10             	add    $0x10,%esp
c0107f8c:	83 ec 0c             	sub    $0xc,%esp
c0107f8f:	6a 01                	push   $0x1
c0107f91:	e8 7e 04 00 00       	call   c0108414 <delay>
c0107f96:	83 c4 10             	add    $0x10,%esp
c0107f99:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0107f9d:	83 45 ec 02          	addl   $0x2,-0x14(%ebp)
c0107fa1:	c7 45 8e 43 68 69 6c 	movl   $0x6c696843,-0x72(%ebp)
c0107fa8:	c7 45 92 64 2e 53 65 	movl   $0x65532e64,-0x6e(%ebp)
c0107faf:	c7 45 96 65 20 79 6f 	movl   $0x6f792065,-0x6a(%ebp)
c0107fb6:	c7 45 9a 75 20 61 67 	movl   $0x67612075,-0x66(%ebp)
c0107fbd:	c7 45 9e 61 69 6e 0a 	movl   $0xa6e6961,-0x62(%ebp)
c0107fc4:	c7 45 a2 00 00 00 00 	movl   $0x0,-0x5e(%ebp)
c0107fcb:	c7 45 a6 00 00 00 00 	movl   $0x0,-0x5a(%ebp)
c0107fd2:	c7 45 aa 00 00 00 00 	movl   $0x0,-0x56(%ebp)
c0107fd9:	c7 45 ae 00 00 00 00 	movl   $0x0,-0x52(%ebp)
c0107fe0:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)
c0107fe7:	83 ec 0c             	sub    $0xc,%esp
c0107fea:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107fed:	50                   	push   %eax
c0107fee:	e8 15 42 00 00       	call   c010c208 <Strlen>
c0107ff3:	83 c4 10             	add    $0x10,%esp
c0107ff6:	83 ec 04             	sub    $0x4,%esp
c0107ff9:	50                   	push   %eax
c0107ffa:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107ffd:	50                   	push   %eax
c0107ffe:	ff 75 f4             	pushl  -0xc(%ebp)
c0108001:	e8 0f cd ff ff       	call   c0104d15 <write>
c0108006:	83 c4 10             	add    $0x10,%esp
c0108009:	83 ec 0c             	sub    $0xc,%esp
c010800c:	8d 45 8e             	lea    -0x72(%ebp),%eax
c010800f:	50                   	push   %eax
c0108010:	e8 f3 41 00 00       	call   c010c208 <Strlen>
c0108015:	83 c4 10             	add    $0x10,%esp
c0108018:	83 ec 04             	sub    $0x4,%esp
c010801b:	50                   	push   %eax
c010801c:	8d 45 8e             	lea    -0x72(%ebp),%eax
c010801f:	50                   	push   %eax
c0108020:	ff 75 f4             	pushl  -0xc(%ebp)
c0108023:	e8 ed cc ff ff       	call   c0104d15 <write>
c0108028:	83 c4 10             	add    $0x10,%esp
c010802b:	83 ec 0c             	sub    $0xc,%esp
c010802e:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0108031:	50                   	push   %eax
c0108032:	e8 d1 41 00 00       	call   c010c208 <Strlen>
c0108037:	83 c4 10             	add    $0x10,%esp
c010803a:	83 ec 04             	sub    $0x4,%esp
c010803d:	50                   	push   %eax
c010803e:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0108041:	50                   	push   %eax
c0108042:	ff 75 f4             	pushl  -0xc(%ebp)
c0108045:	e8 cb cc ff ff       	call   c0104d15 <write>
c010804a:	83 c4 10             	add    $0x10,%esp
c010804d:	eb fe                	jmp    c010804d <INIT_fork+0x2a2>
c010804f:	83 ec 04             	sub    $0x4,%esp
c0108052:	6a 28                	push   $0x28
c0108054:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0108057:	50                   	push   %eax
c0108058:	ff 75 f0             	pushl  -0x10(%ebp)
c010805b:	e8 34 cb ff ff       	call   c0104b94 <read>
c0108060:	83 c4 10             	add    $0x10,%esp
c0108063:	83 ec 0c             	sub    $0xc,%esp
c0108066:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0108069:	50                   	push   %eax
c010806a:	e8 d9 04 00 00       	call   c0108548 <Printf>
c010806f:	83 c4 10             	add    $0x10,%esp
c0108072:	83 ec 0c             	sub    $0xc,%esp
c0108075:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0108078:	50                   	push   %eax
c0108079:	e8 ca 04 00 00       	call   c0108548 <Printf>
c010807e:	83 c4 10             	add    $0x10,%esp
c0108081:	83 ec 0c             	sub    $0xc,%esp
c0108084:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0108087:	50                   	push   %eax
c0108088:	e8 bb 04 00 00       	call   c0108548 <Printf>
c010808d:	83 c4 10             	add    $0x10,%esp
c0108090:	83 ec 0c             	sub    $0xc,%esp
c0108093:	68 8f bc 10 c0       	push   $0xc010bc8f
c0108098:	e8 c4 07 00 00       	call   c0108861 <spin>
c010809d:	83 c4 10             	add    $0x10,%esp
c01080a0:	90                   	nop
c01080a1:	c9                   	leave  
c01080a2:	c3                   	ret    

c01080a3 <simple_shell>:
c01080a3:	55                   	push   %ebp
c01080a4:	89 e5                	mov    %esp,%ebp
c01080a6:	57                   	push   %edi
c01080a7:	83 ec 64             	sub    $0x64,%esp
c01080aa:	c7 45 d2 64 65 76 5f 	movl   $0x5f766564,-0x2e(%ebp)
c01080b1:	c7 45 d6 74 74 79 31 	movl   $0x31797474,-0x2a(%ebp)
c01080b8:	66 c7 45 da 00 00    	movw   $0x0,-0x26(%ebp)
c01080be:	83 ec 08             	sub    $0x8,%esp
c01080c1:	6a 02                	push   $0x2
c01080c3:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c01080c6:	50                   	push   %eax
c01080c7:	e8 33 ca ff ff       	call   c0104aff <open>
c01080cc:	83 c4 10             	add    $0x10,%esp
c01080cf:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01080d2:	83 ec 08             	sub    $0x8,%esp
c01080d5:	6a 02                	push   $0x2
c01080d7:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c01080da:	50                   	push   %eax
c01080db:	e8 1f ca ff ff       	call   c0104aff <open>
c01080e0:	83 c4 10             	add    $0x10,%esp
c01080e3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01080e6:	8d 55 a8             	lea    -0x58(%ebp),%edx
c01080e9:	b8 00 00 00 00       	mov    $0x0,%eax
c01080ee:	b9 0a 00 00 00       	mov    $0xa,%ecx
c01080f3:	89 d7                	mov    %edx,%edi
c01080f5:	f3 ab                	rep stos %eax,%es:(%edi)
c01080f7:	c7 45 a8 97 bc 10 c0 	movl   $0xc010bc97,-0x58(%ebp)
c01080fe:	c7 45 ac 9c bc 10 c0 	movl   $0xc010bc9c,-0x54(%ebp)
c0108105:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010810c:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
c0108113:	c7 45 e8 02 00 00 00 	movl   $0x2,-0x18(%ebp)
c010811a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010811d:	c7 44 85 a8 00 00 00 	movl   $0x0,-0x58(%ebp,%eax,4)
c0108124:	00 
c0108125:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0108128:	85 c0                	test   %eax,%eax
c010812a:	75 1c                	jne    c0108148 <simple_shell+0xa5>
c010812c:	68 0e 03 00 00       	push   $0x30e
c0108131:	68 61 ba 10 c0       	push   $0xc010ba61
c0108136:	68 61 ba 10 c0       	push   $0xc010ba61
c010813b:	68 a2 bc 10 c0       	push   $0xc010bca2
c0108140:	e8 60 07 00 00       	call   c01088a5 <assertion_failure>
c0108145:	83 c4 10             	add    $0x10,%esp
c0108148:	8b 45 a8             	mov    -0x58(%ebp),%eax
c010814b:	83 ec 08             	sub    $0x8,%esp
c010814e:	6a 02                	push   $0x2
c0108150:	50                   	push   %eax
c0108151:	e8 a9 c9 ff ff       	call   c0104aff <open>
c0108156:	83 c4 10             	add    $0x10,%esp
c0108159:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010815c:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
c0108160:	75 4b                	jne    c01081ad <simple_shell+0x10a>
c0108162:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108169:	eb 26                	jmp    c0108191 <simple_shell+0xee>
c010816b:	8b 55 a8             	mov    -0x58(%ebp),%edx
c010816e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108171:	01 d0                	add    %edx,%eax
c0108173:	0f b6 00             	movzbl (%eax),%eax
c0108176:	0f be c0             	movsbl %al,%eax
c0108179:	83 ec 04             	sub    $0x4,%esp
c010817c:	50                   	push   %eax
c010817d:	ff 75 f4             	pushl  -0xc(%ebp)
c0108180:	68 b1 bc 10 c0       	push   $0xc010bcb1
c0108185:	e8 be 03 00 00       	call   c0108548 <Printf>
c010818a:	83 c4 10             	add    $0x10,%esp
c010818d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0108191:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
c0108195:	7e d4                	jle    c010816b <simple_shell+0xc8>
c0108197:	8b 45 a8             	mov    -0x58(%ebp),%eax
c010819a:	83 ec 08             	sub    $0x8,%esp
c010819d:	50                   	push   %eax
c010819e:	68 b8 bc 10 c0       	push   $0xc010bcb8
c01081a3:	e8 a0 03 00 00       	call   c0108548 <Printf>
c01081a8:	83 c4 10             	add    $0x10,%esp
c01081ab:	eb 78                	jmp    c0108225 <simple_shell+0x182>
c01081ad:	83 ec 0c             	sub    $0xc,%esp
c01081b0:	68 be bc 10 c0       	push   $0xc010bcbe
c01081b5:	e8 8e 03 00 00       	call   c0108548 <Printf>
c01081ba:	83 c4 10             	add    $0x10,%esp
c01081bd:	e8 9d cc ff ff       	call   c0104e5f <fork>
c01081c2:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01081c5:	83 ec 0c             	sub    $0xc,%esp
c01081c8:	68 d3 bc 10 c0       	push   $0xc010bcd3
c01081cd:	e8 76 03 00 00       	call   c0108548 <Printf>
c01081d2:	83 c4 10             	add    $0x10,%esp
c01081d5:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
c01081d9:	7e 11                	jle    c01081ec <simple_shell+0x149>
c01081db:	83 ec 0c             	sub    $0xc,%esp
c01081de:	8d 45 a4             	lea    -0x5c(%ebp),%eax
c01081e1:	50                   	push   %eax
c01081e2:	e8 05 cc ff ff       	call   c0104dec <wait>
c01081e7:	83 c4 10             	add    $0x10,%esp
c01081ea:	eb 39                	jmp    c0108225 <simple_shell+0x182>
c01081ec:	83 ec 0c             	sub    $0xc,%esp
c01081ef:	68 e8 bc 10 c0       	push   $0xc010bce8
c01081f4:	e8 4f 03 00 00       	call   c0108548 <Printf>
c01081f9:	83 c4 10             	add    $0x10,%esp
c01081fc:	83 ec 0c             	sub    $0xc,%esp
c01081ff:	ff 75 e0             	pushl  -0x20(%ebp)
c0108202:	e8 93 cb ff ff       	call   c0104d9a <close>
c0108207:	83 c4 10             	add    $0x10,%esp
c010820a:	6a 00                	push   $0x0
c010820c:	68 9c bc 10 c0       	push   $0xc010bc9c
c0108211:	68 97 bc 10 c0       	push   $0xc010bc97
c0108216:	68 04 bd 10 c0       	push   $0xc010bd04
c010821b:	e8 12 cf ff ff       	call   c0105132 <execl>
c0108220:	83 c4 10             	add    $0x10,%esp
c0108223:	eb fe                	jmp    c0108223 <simple_shell+0x180>
c0108225:	8b 7d fc             	mov    -0x4(%ebp),%edi
c0108228:	c9                   	leave  
c0108229:	c3                   	ret    

c010822a <test_shell>:
c010822a:	55                   	push   %ebp
c010822b:	89 e5                	mov    %esp,%ebp
c010822d:	83 ec 38             	sub    $0x38,%esp
c0108230:	c7 45 ea 64 65 76 5f 	movl   $0x5f766564,-0x16(%ebp)
c0108237:	c7 45 ee 74 74 79 31 	movl   $0x31797474,-0x12(%ebp)
c010823e:	66 c7 45 f2 00 00    	movw   $0x0,-0xe(%ebp)
c0108244:	83 ec 08             	sub    $0x8,%esp
c0108247:	6a 02                	push   $0x2
c0108249:	8d 45 ea             	lea    -0x16(%ebp),%eax
c010824c:	50                   	push   %eax
c010824d:	e8 ad c8 ff ff       	call   c0104aff <open>
c0108252:	83 c4 10             	add    $0x10,%esp
c0108255:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108258:	c7 45 d6 69 6e 73 74 	movl   $0x74736e69,-0x2a(%ebp)
c010825f:	c7 45 da 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x26(%ebp)
c0108266:	c7 45 de 74 61 72 00 	movl   $0x726174,-0x22(%ebp)
c010826d:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c0108274:	c7 45 e6 00 00 00 00 	movl   $0x0,-0x1a(%ebp)
c010827b:	83 ec 0c             	sub    $0xc,%esp
c010827e:	8d 45 d6             	lea    -0x2a(%ebp),%eax
c0108281:	50                   	push   %eax
c0108282:	e8 38 ea ff ff       	call   c0106cbf <untar>
c0108287:	83 c4 10             	add    $0x10,%esp
c010828a:	e8 14 fe ff ff       	call   c01080a3 <simple_shell>
c010828f:	90                   	nop
c0108290:	c9                   	leave  
c0108291:	c3                   	ret    

c0108292 <test_exec>:
c0108292:	55                   	push   %ebp
c0108293:	89 e5                	mov    %esp,%ebp
c0108295:	83 ec 38             	sub    $0x38,%esp
c0108298:	83 ec 0c             	sub    $0xc,%esp
c010829b:	68 0a bd 10 c0       	push   $0xc010bd0a
c01082a0:	e8 e7 7d ff ff       	call   c010008c <disp_str>
c01082a5:	83 c4 10             	add    $0x10,%esp
c01082a8:	83 ec 0c             	sub    $0xc,%esp
c01082ab:	68 1c bd 10 c0       	push   $0xc010bd1c
c01082b0:	e8 d7 7d ff ff       	call   c010008c <disp_str>
c01082b5:	83 c4 10             	add    $0x10,%esp
c01082b8:	83 ec 0c             	sub    $0xc,%esp
c01082bb:	6a 07                	push   $0x7
c01082bd:	e8 b8 ed ff ff       	call   c010707a <disp_int>
c01082c2:	83 c4 10             	add    $0x10,%esp
c01082c5:	83 ec 0c             	sub    $0xc,%esp
c01082c8:	68 00 b6 10 c0       	push   $0xc010b600
c01082cd:	e8 ba 7d ff ff       	call   c010008c <disp_str>
c01082d2:	83 c4 10             	add    $0x10,%esp
c01082d5:	83 ec 0c             	sub    $0xc,%esp
c01082d8:	68 02 b6 10 c0       	push   $0xc010b602
c01082dd:	e8 aa 7d ff ff       	call   c010008c <disp_str>
c01082e2:	83 c4 10             	add    $0x10,%esp
c01082e5:	c7 45 e6 64 65 76 5f 	movl   $0x5f766564,-0x1a(%ebp)
c01082ec:	c7 45 ea 74 74 79 31 	movl   $0x31797474,-0x16(%ebp)
c01082f3:	66 c7 45 ee 00 00    	movw   $0x0,-0x12(%ebp)
c01082f9:	83 ec 08             	sub    $0x8,%esp
c01082fc:	6a 02                	push   $0x2
c01082fe:	8d 45 e6             	lea    -0x1a(%ebp),%eax
c0108301:	50                   	push   %eax
c0108302:	e8 f8 c7 ff ff       	call   c0104aff <open>
c0108307:	83 c4 10             	add    $0x10,%esp
c010830a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010830d:	c7 45 d2 69 6e 73 74 	movl   $0x74736e69,-0x2e(%ebp)
c0108314:	c7 45 d6 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x2a(%ebp)
c010831b:	c7 45 da 74 61 72 00 	movl   $0x726174,-0x26(%ebp)
c0108322:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
c0108329:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c0108330:	83 ec 0c             	sub    $0xc,%esp
c0108333:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c0108336:	50                   	push   %eax
c0108337:	e8 83 e9 ff ff       	call   c0106cbf <untar>
c010833c:	83 c4 10             	add    $0x10,%esp
c010833f:	83 ec 08             	sub    $0x8,%esp
c0108342:	6a 00                	push   $0x0
c0108344:	68 2f bd 10 c0       	push   $0xc010bd2f
c0108349:	68 33 bd 10 c0       	push   $0xc010bd33
c010834e:	68 9c bc 10 c0       	push   $0xc010bc9c
c0108353:	68 97 bc 10 c0       	push   $0xc010bc97
c0108358:	68 04 bd 10 c0       	push   $0xc010bd04
c010835d:	e8 d0 cd ff ff       	call   c0105132 <execl>
c0108362:	83 c4 20             	add    $0x20,%esp
c0108365:	e8 34 e8 ff ff       	call   c0106b9e <stop_here>
c010836a:	e8 f0 ca ff ff       	call   c0104e5f <fork>
c010836f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108372:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0108376:	7e 25                	jle    c010839d <test_exec+0x10b>
c0108378:	83 ec 0c             	sub    $0xc,%esp
c010837b:	8d 45 cc             	lea    -0x34(%ebp),%eax
c010837e:	50                   	push   %eax
c010837f:	e8 68 ca ff ff       	call   c0104dec <wait>
c0108384:	83 c4 10             	add    $0x10,%esp
c0108387:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010838a:	83 ec 08             	sub    $0x8,%esp
c010838d:	50                   	push   %eax
c010838e:	68 39 bd 10 c0       	push   $0xc010bd39
c0108393:	e8 b0 01 00 00       	call   c0108548 <Printf>
c0108398:	83 c4 10             	add    $0x10,%esp
c010839b:	eb 33                	jmp    c01083d0 <test_exec+0x13e>
c010839d:	83 ec 0c             	sub    $0xc,%esp
c01083a0:	68 4b bd 10 c0       	push   $0xc010bd4b
c01083a5:	e8 9e 01 00 00       	call   c0108548 <Printf>
c01083aa:	83 c4 10             	add    $0x10,%esp
c01083ad:	83 ec 0c             	sub    $0xc,%esp
c01083b0:	6a 00                	push   $0x0
c01083b2:	68 33 bd 10 c0       	push   $0xc010bd33
c01083b7:	68 9c bc 10 c0       	push   $0xc010bc9c
c01083bc:	68 97 bc 10 c0       	push   $0xc010bc97
c01083c1:	68 04 bd 10 c0       	push   $0xc010bd04
c01083c6:	e8 67 cd ff ff       	call   c0105132 <execl>
c01083cb:	83 c4 20             	add    $0x20,%esp
c01083ce:	eb fe                	jmp    c01083ce <test_exec+0x13c>
c01083d0:	c9                   	leave  
c01083d1:	c3                   	ret    

c01083d2 <INIT>:
c01083d2:	55                   	push   %ebp
c01083d3:	89 e5                	mov    %esp,%ebp
c01083d5:	83 ec 08             	sub    $0x8,%esp
c01083d8:	e8 4d fe ff ff       	call   c010822a <test_shell>
c01083dd:	eb fe                	jmp    c01083dd <INIT+0xb>

c01083df <TestA>:
c01083df:	55                   	push   %ebp
c01083e0:	89 e5                	mov    %esp,%ebp
c01083e2:	83 ec 08             	sub    $0x8,%esp
c01083e5:	83 ec 0c             	sub    $0xc,%esp
c01083e8:	6a 05                	push   $0x5
c01083ea:	e8 8b ec ff ff       	call   c010707a <disp_int>
c01083ef:	83 c4 10             	add    $0x10,%esp
c01083f2:	83 ec 0c             	sub    $0xc,%esp
c01083f5:	68 13 b7 10 c0       	push   $0xc010b713
c01083fa:	e8 8d 7c ff ff       	call   c010008c <disp_str>
c01083ff:	83 c4 10             	add    $0x10,%esp
c0108402:	83 ec 0c             	sub    $0xc,%esp
c0108405:	68 59 bd 10 c0       	push   $0xc010bd59
c010840a:	e8 7d 7c ff ff       	call   c010008c <disp_str>
c010840f:	83 c4 10             	add    $0x10,%esp
c0108412:	eb fe                	jmp    c0108412 <TestA+0x33>

c0108414 <delay>:
c0108414:	55                   	push   %ebp
c0108415:	89 e5                	mov    %esp,%ebp
c0108417:	83 ec 10             	sub    $0x10,%esp
c010841a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0108421:	eb 2a                	jmp    c010844d <delay+0x39>
c0108423:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c010842a:	eb 17                	jmp    c0108443 <delay+0x2f>
c010842c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108433:	eb 04                	jmp    c0108439 <delay+0x25>
c0108435:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0108439:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c010843d:	7e f6                	jle    c0108435 <delay+0x21>
c010843f:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0108443:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
c0108447:	7e e3                	jle    c010842c <delay+0x18>
c0108449:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c010844d:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0108450:	3b 45 08             	cmp    0x8(%ebp),%eax
c0108453:	7c ce                	jl     c0108423 <delay+0xf>
c0108455:	90                   	nop
c0108456:	c9                   	leave  
c0108457:	c3                   	ret    

c0108458 <TestB>:
c0108458:	55                   	push   %ebp
c0108459:	89 e5                	mov    %esp,%ebp
c010845b:	83 ec 08             	sub    $0x8,%esp
c010845e:	83 ec 0c             	sub    $0xc,%esp
c0108461:	68 60 bd 10 c0       	push   $0xc010bd60
c0108466:	e8 21 7c ff ff       	call   c010008c <disp_str>
c010846b:	83 c4 10             	add    $0x10,%esp
c010846e:	eb fe                	jmp    c010846e <TestB+0x16>

c0108470 <TestC>:
c0108470:	55                   	push   %ebp
c0108471:	89 e5                	mov    %esp,%ebp
c0108473:	83 ec 18             	sub    $0x18,%esp
c0108476:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010847d:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c0108481:	77 1a                	ja     c010849d <TestC+0x2d>
c0108483:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
c010848a:	83 ec 08             	sub    $0x8,%esp
c010848d:	ff 75 f0             	pushl  -0x10(%ebp)
c0108490:	68 63 bd 10 c0       	push   $0xc010bd63
c0108495:	e8 ae 00 00 00       	call   c0108548 <Printf>
c010849a:	83 c4 10             	add    $0x10,%esp
c010849d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01084a1:	eb da                	jmp    c010847d <TestC+0xd>

c01084a3 <sys_get_ticks>:
c01084a3:	55                   	push   %ebp
c01084a4:	89 e5                	mov    %esp,%ebp
c01084a6:	a1 e8 0e 11 c0       	mov    0xc0110ee8,%eax
c01084ab:	8b 15 ec 0e 11 c0    	mov    0xc0110eec,%edx
c01084b1:	5d                   	pop    %ebp
c01084b2:	c3                   	ret    

c01084b3 <sys_write>:
c01084b3:	55                   	push   %ebp
c01084b4:	89 e5                	mov    %esp,%ebp
c01084b6:	83 ec 18             	sub    $0x18,%esp
c01084b9:	8b 45 10             	mov    0x10(%ebp),%eax
c01084bc:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c01084c2:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c01084c8:	05 00 fe 10 c0       	add    $0xc010fe00,%eax
c01084cd:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01084d0:	8b 45 0c             	mov    0xc(%ebp),%eax
c01084d3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01084d6:	8b 45 08             	mov    0x8(%ebp),%eax
c01084d9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01084dc:	eb 20                	jmp    c01084fe <sys_write+0x4b>
c01084de:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01084e1:	0f b6 00             	movzbl (%eax),%eax
c01084e4:	0f b6 c0             	movzbl %al,%eax
c01084e7:	83 ec 08             	sub    $0x8,%esp
c01084ea:	50                   	push   %eax
c01084eb:	ff 75 ec             	pushl  -0x14(%ebp)
c01084ee:	e8 7d b9 ff ff       	call   c0103e70 <out_char>
c01084f3:	83 c4 10             	add    $0x10,%esp
c01084f6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01084fa:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
c01084fe:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0108502:	7f da                	jg     c01084de <sys_write+0x2b>
c0108504:	90                   	nop
c0108505:	c9                   	leave  
c0108506:	c3                   	ret    

c0108507 <milli_delay>:
c0108507:	55                   	push   %ebp
c0108508:	89 e5                	mov    %esp,%ebp
c010850a:	83 ec 18             	sub    $0x18,%esp
c010850d:	e8 8a 11 00 00       	call   c010969c <get_ticks_ipc>
c0108512:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108515:	90                   	nop
c0108516:	e8 81 11 00 00       	call   c010969c <get_ticks_ipc>
c010851b:	2b 45 f4             	sub    -0xc(%ebp),%eax
c010851e:	89 c1                	mov    %eax,%ecx
c0108520:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
c0108525:	89 c8                	mov    %ecx,%eax
c0108527:	f7 ea                	imul   %edx
c0108529:	c1 fa 05             	sar    $0x5,%edx
c010852c:	89 c8                	mov    %ecx,%eax
c010852e:	c1 f8 1f             	sar    $0x1f,%eax
c0108531:	29 c2                	sub    %eax,%edx
c0108533:	89 d0                	mov    %edx,%eax
c0108535:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
c010853b:	39 45 08             	cmp    %eax,0x8(%ebp)
c010853e:	77 d6                	ja     c0108516 <milli_delay+0xf>
c0108540:	90                   	nop
c0108541:	c9                   	leave  
c0108542:	c3                   	ret    

c0108543 <TaskSys>:
c0108543:	55                   	push   %ebp
c0108544:	89 e5                	mov    %esp,%ebp
c0108546:	eb fe                	jmp    c0108546 <TaskSys+0x3>

c0108548 <Printf>:
c0108548:	55                   	push   %ebp
c0108549:	89 e5                	mov    %esp,%ebp
c010854b:	81 ec 18 01 00 00    	sub    $0x118,%esp
c0108551:	83 ec 04             	sub    $0x4,%esp
c0108554:	68 00 01 00 00       	push   $0x100
c0108559:	6a 00                	push   $0x0
c010855b:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108561:	50                   	push   %eax
c0108562:	e8 68 3c 00 00       	call   c010c1cf <Memset>
c0108567:	83 c4 10             	add    $0x10,%esp
c010856a:	8d 45 0c             	lea    0xc(%ebp),%eax
c010856d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108570:	8b 45 08             	mov    0x8(%ebp),%eax
c0108573:	83 ec 04             	sub    $0x4,%esp
c0108576:	ff 75 f4             	pushl  -0xc(%ebp)
c0108579:	50                   	push   %eax
c010857a:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108580:	50                   	push   %eax
c0108581:	e8 20 00 00 00       	call   c01085a6 <vsprintf>
c0108586:	83 c4 10             	add    $0x10,%esp
c0108589:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010858c:	83 ec 04             	sub    $0x4,%esp
c010858f:	ff 75 f0             	pushl  -0x10(%ebp)
c0108592:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108598:	50                   	push   %eax
c0108599:	6a 00                	push   $0x0
c010859b:	e8 75 c7 ff ff       	call   c0104d15 <write>
c01085a0:	83 c4 10             	add    $0x10,%esp
c01085a3:	90                   	nop
c01085a4:	c9                   	leave  
c01085a5:	c3                   	ret    

c01085a6 <vsprintf>:
c01085a6:	55                   	push   %ebp
c01085a7:	89 e5                	mov    %esp,%ebp
c01085a9:	81 ec 68 02 00 00    	sub    $0x268,%esp
c01085af:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c01085b5:	89 85 e4 fd ff ff    	mov    %eax,-0x21c(%ebp)
c01085bb:	83 ec 04             	sub    $0x4,%esp
c01085be:	6a 40                	push   $0x40
c01085c0:	6a 00                	push   $0x0
c01085c2:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c01085c8:	50                   	push   %eax
c01085c9:	e8 01 3c 00 00       	call   c010c1cf <Memset>
c01085ce:	83 c4 10             	add    $0x10,%esp
c01085d1:	8b 45 10             	mov    0x10(%ebp),%eax
c01085d4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01085d7:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01085de:	8b 45 08             	mov    0x8(%ebp),%eax
c01085e1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01085e4:	e9 53 01 00 00       	jmp    c010873c <vsprintf+0x196>
c01085e9:	8b 45 0c             	mov    0xc(%ebp),%eax
c01085ec:	0f b6 00             	movzbl (%eax),%eax
c01085ef:	3c 25                	cmp    $0x25,%al
c01085f1:	74 16                	je     c0108609 <vsprintf+0x63>
c01085f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01085f6:	8d 50 01             	lea    0x1(%eax),%edx
c01085f9:	89 55 f4             	mov    %edx,-0xc(%ebp)
c01085fc:	8b 55 0c             	mov    0xc(%ebp),%edx
c01085ff:	0f b6 12             	movzbl (%edx),%edx
c0108602:	88 10                	mov    %dl,(%eax)
c0108604:	e9 2f 01 00 00       	jmp    c0108738 <vsprintf+0x192>
c0108609:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c010860d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0108610:	0f b6 00             	movzbl (%eax),%eax
c0108613:	0f be c0             	movsbl %al,%eax
c0108616:	83 f8 64             	cmp    $0x64,%eax
c0108619:	74 26                	je     c0108641 <vsprintf+0x9b>
c010861b:	83 f8 64             	cmp    $0x64,%eax
c010861e:	7f 0e                	jg     c010862e <vsprintf+0x88>
c0108620:	83 f8 63             	cmp    $0x63,%eax
c0108623:	0f 84 f2 00 00 00    	je     c010871b <vsprintf+0x175>
c0108629:	e9 0a 01 00 00       	jmp    c0108738 <vsprintf+0x192>
c010862e:	83 f8 73             	cmp    $0x73,%eax
c0108631:	0f 84 b0 00 00 00    	je     c01086e7 <vsprintf+0x141>
c0108637:	83 f8 78             	cmp    $0x78,%eax
c010863a:	74 5d                	je     c0108699 <vsprintf+0xf3>
c010863c:	e9 f7 00 00 00       	jmp    c0108738 <vsprintf+0x192>
c0108641:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108644:	8b 00                	mov    (%eax),%eax
c0108646:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0108649:	83 ec 04             	sub    $0x4,%esp
c010864c:	6a 0a                	push   $0xa
c010864e:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c0108654:	50                   	push   %eax
c0108655:	ff 75 e8             	pushl  -0x18(%ebp)
c0108658:	e8 96 10 00 00       	call   c01096f3 <itoa>
c010865d:	83 c4 10             	add    $0x10,%esp
c0108660:	83 ec 08             	sub    $0x8,%esp
c0108663:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0108669:	50                   	push   %eax
c010866a:	ff 75 f4             	pushl  -0xc(%ebp)
c010866d:	e8 7c 3b 00 00       	call   c010c1ee <Strcpy>
c0108672:	83 c4 10             	add    $0x10,%esp
c0108675:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0108679:	83 ec 0c             	sub    $0xc,%esp
c010867c:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0108682:	50                   	push   %eax
c0108683:	e8 80 3b 00 00       	call   c010c208 <Strlen>
c0108688:	83 c4 10             	add    $0x10,%esp
c010868b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010868e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0108691:	01 45 f4             	add    %eax,-0xc(%ebp)
c0108694:	e9 9f 00 00 00       	jmp    c0108738 <vsprintf+0x192>
c0108699:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010869c:	8b 00                	mov    (%eax),%eax
c010869e:	83 ec 08             	sub    $0x8,%esp
c01086a1:	50                   	push   %eax
c01086a2:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c01086a8:	50                   	push   %eax
c01086a9:	e8 26 e9 ff ff       	call   c0106fd4 <atoi>
c01086ae:	83 c4 10             	add    $0x10,%esp
c01086b1:	83 ec 08             	sub    $0x8,%esp
c01086b4:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c01086ba:	50                   	push   %eax
c01086bb:	ff 75 f4             	pushl  -0xc(%ebp)
c01086be:	e8 2b 3b 00 00       	call   c010c1ee <Strcpy>
c01086c3:	83 c4 10             	add    $0x10,%esp
c01086c6:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c01086ca:	83 ec 0c             	sub    $0xc,%esp
c01086cd:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c01086d3:	50                   	push   %eax
c01086d4:	e8 2f 3b 00 00       	call   c010c208 <Strlen>
c01086d9:	83 c4 10             	add    $0x10,%esp
c01086dc:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01086df:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01086e2:	01 45 f4             	add    %eax,-0xc(%ebp)
c01086e5:	eb 51                	jmp    c0108738 <vsprintf+0x192>
c01086e7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01086ea:	8b 00                	mov    (%eax),%eax
c01086ec:	83 ec 08             	sub    $0x8,%esp
c01086ef:	50                   	push   %eax
c01086f0:	ff 75 f4             	pushl  -0xc(%ebp)
c01086f3:	e8 f6 3a 00 00       	call   c010c1ee <Strcpy>
c01086f8:	83 c4 10             	add    $0x10,%esp
c01086fb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01086fe:	8b 00                	mov    (%eax),%eax
c0108700:	83 ec 0c             	sub    $0xc,%esp
c0108703:	50                   	push   %eax
c0108704:	e8 ff 3a 00 00       	call   c010c208 <Strlen>
c0108709:	83 c4 10             	add    $0x10,%esp
c010870c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010870f:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0108713:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0108716:	01 45 f4             	add    %eax,-0xc(%ebp)
c0108719:	eb 1d                	jmp    c0108738 <vsprintf+0x192>
c010871b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010871e:	0f b6 10             	movzbl (%eax),%edx
c0108721:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108724:	88 10                	mov    %dl,(%eax)
c0108726:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c010872a:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0108731:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0108734:	01 45 f4             	add    %eax,-0xc(%ebp)
c0108737:	90                   	nop
c0108738:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c010873c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010873f:	0f b6 00             	movzbl (%eax),%eax
c0108742:	84 c0                	test   %al,%al
c0108744:	0f 85 9f fe ff ff    	jne    c01085e9 <vsprintf+0x43>
c010874a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010874d:	2b 45 08             	sub    0x8(%ebp),%eax
c0108750:	c9                   	leave  
c0108751:	c3                   	ret    

c0108752 <printx>:
c0108752:	55                   	push   %ebp
c0108753:	89 e5                	mov    %esp,%ebp
c0108755:	81 ec 18 01 00 00    	sub    $0x118,%esp
c010875b:	8d 45 0c             	lea    0xc(%ebp),%eax
c010875e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108761:	8b 45 08             	mov    0x8(%ebp),%eax
c0108764:	83 ec 04             	sub    $0x4,%esp
c0108767:	ff 75 f4             	pushl  -0xc(%ebp)
c010876a:	50                   	push   %eax
c010876b:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108771:	50                   	push   %eax
c0108772:	e8 2f fe ff ff       	call   c01085a6 <vsprintf>
c0108777:	83 c4 10             	add    $0x10,%esp
c010877a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010877d:	83 ec 08             	sub    $0x8,%esp
c0108780:	ff 75 f0             	pushl  -0x10(%ebp)
c0108783:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108789:	50                   	push   %eax
c010878a:	e8 11 8e ff ff       	call   c01015a0 <write_debug>
c010878f:	83 c4 10             	add    $0x10,%esp
c0108792:	90                   	nop
c0108793:	c9                   	leave  
c0108794:	c3                   	ret    

c0108795 <sys_printx>:
c0108795:	55                   	push   %ebp
c0108796:	89 e5                	mov    %esp,%ebp
c0108798:	83 ec 28             	sub    $0x28,%esp
c010879b:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c01087a0:	85 c0                	test   %eax,%eax
c01087a2:	75 15                	jne    c01087b9 <sys_printx+0x24>
c01087a4:	8b 45 10             	mov    0x10(%ebp),%eax
c01087a7:	8b 80 80 02 00 00    	mov    0x280(%eax),%eax
c01087ad:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01087b0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01087b7:	eb 10                	jmp    c01087c9 <sys_printx+0x34>
c01087b9:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c01087be:	85 c0                	test   %eax,%eax
c01087c0:	74 07                	je     c01087c9 <sys_printx+0x34>
c01087c2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01087c9:	8b 55 08             	mov    0x8(%ebp),%edx
c01087cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01087cf:	01 d0                	add    %edx,%eax
c01087d1:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01087d4:	8b 45 10             	mov    0x10(%ebp),%eax
c01087d7:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c01087dd:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c01087e3:	05 00 fe 10 c0       	add    $0xc010fe00,%eax
c01087e8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01087eb:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01087ee:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01087f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01087f4:	0f b6 00             	movzbl (%eax),%eax
c01087f7:	88 45 e3             	mov    %al,-0x1d(%ebp)
c01087fa:	eb 3a                	jmp    c0108836 <sys_printx+0xa1>
c01087fc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01087ff:	0f b6 00             	movzbl (%eax),%eax
c0108802:	3c 3b                	cmp    $0x3b,%al
c0108804:	74 0a                	je     c0108810 <sys_printx+0x7b>
c0108806:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108809:	0f b6 00             	movzbl (%eax),%eax
c010880c:	3c 3a                	cmp    $0x3a,%al
c010880e:	75 06                	jne    c0108816 <sys_printx+0x81>
c0108810:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0108814:	eb 20                	jmp    c0108836 <sys_printx+0xa1>
c0108816:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108819:	0f b6 00             	movzbl (%eax),%eax
c010881c:	0f b6 c0             	movzbl %al,%eax
c010881f:	83 ec 08             	sub    $0x8,%esp
c0108822:	50                   	push   %eax
c0108823:	ff 75 e4             	pushl  -0x1c(%ebp)
c0108826:	e8 45 b6 ff ff       	call   c0103e70 <out_char>
c010882b:	83 c4 10             	add    $0x10,%esp
c010882e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0108832:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0108836:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010883a:	7f c0                	jg     c01087fc <sys_printx+0x67>
c010883c:	80 7d e3 3b          	cmpb   $0x3b,-0x1d(%ebp)
c0108840:	75 10                	jne    c0108852 <sys_printx+0xbd>
c0108842:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c0108847:	85 c0                	test   %eax,%eax
c0108849:	74 13                	je     c010885e <sys_printx+0xc9>
c010884b:	e8 c0 7a ff ff       	call   c0100310 <disable_int>
c0108850:	eb 0c                	jmp    c010885e <sys_printx+0xc9>
c0108852:	80 7d e3 3a          	cmpb   $0x3a,-0x1d(%ebp)
c0108856:	75 06                	jne    c010885e <sys_printx+0xc9>
c0108858:	e8 b3 7a ff ff       	call   c0100310 <disable_int>
c010885d:	90                   	nop
c010885e:	90                   	nop
c010885f:	c9                   	leave  
c0108860:	c3                   	ret    

c0108861 <spin>:
c0108861:	55                   	push   %ebp
c0108862:	89 e5                	mov    %esp,%ebp
c0108864:	83 ec 08             	sub    $0x8,%esp
c0108867:	83 ec 0c             	sub    $0xc,%esp
c010886a:	ff 75 08             	pushl  0x8(%ebp)
c010886d:	e8 1a 78 ff ff       	call   c010008c <disp_str>
c0108872:	83 c4 10             	add    $0x10,%esp
c0108875:	83 ec 0c             	sub    $0xc,%esp
c0108878:	68 13 b7 10 c0       	push   $0xc010b713
c010887d:	e8 0a 78 ff ff       	call   c010008c <disp_str>
c0108882:	83 c4 10             	add    $0x10,%esp
c0108885:	eb fe                	jmp    c0108885 <spin+0x24>

c0108887 <panic>:
c0108887:	55                   	push   %ebp
c0108888:	89 e5                	mov    %esp,%ebp
c010888a:	83 ec 08             	sub    $0x8,%esp
c010888d:	83 ec 04             	sub    $0x4,%esp
c0108890:	ff 75 08             	pushl  0x8(%ebp)
c0108893:	6a 3a                	push   $0x3a
c0108895:	68 70 bd 10 c0       	push   $0xc010bd70
c010889a:	e8 b3 fe ff ff       	call   c0108752 <printx>
c010889f:	83 c4 10             	add    $0x10,%esp
c01088a2:	90                   	nop
c01088a3:	c9                   	leave  
c01088a4:	c3                   	ret    

c01088a5 <assertion_failure>:
c01088a5:	55                   	push   %ebp
c01088a6:	89 e5                	mov    %esp,%ebp
c01088a8:	83 ec 08             	sub    $0x8,%esp
c01088ab:	83 ec 08             	sub    $0x8,%esp
c01088ae:	ff 75 14             	pushl  0x14(%ebp)
c01088b1:	ff 75 10             	pushl  0x10(%ebp)
c01088b4:	ff 75 0c             	pushl  0xc(%ebp)
c01088b7:	ff 75 08             	pushl  0x8(%ebp)
c01088ba:	6a 3b                	push   $0x3b
c01088bc:	68 78 bd 10 c0       	push   $0xc010bd78
c01088c1:	e8 8c fe ff ff       	call   c0108752 <printx>
c01088c6:	83 c4 20             	add    $0x20,%esp
c01088c9:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c01088d0:	00 00 00 
c01088d3:	83 ec 0c             	sub    $0xc,%esp
c01088d6:	68 00 b6 10 c0       	push   $0xc010b600
c01088db:	e8 ac 77 ff ff       	call   c010008c <disp_str>
c01088e0:	83 c4 10             	add    $0x10,%esp
c01088e3:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c01088e8:	83 ec 0c             	sub    $0xc,%esp
c01088eb:	50                   	push   %eax
c01088ec:	e8 89 e7 ff ff       	call   c010707a <disp_int>
c01088f1:	83 c4 10             	add    $0x10,%esp
c01088f4:	83 ec 0c             	sub    $0xc,%esp
c01088f7:	68 02 b6 10 c0       	push   $0xc010b602
c01088fc:	e8 8b 77 ff ff       	call   c010008c <disp_str>
c0108901:	83 c4 10             	add    $0x10,%esp
c0108904:	83 ec 0c             	sub    $0xc,%esp
c0108907:	68 ab bd 10 c0       	push   $0xc010bdab
c010890c:	e8 50 ff ff ff       	call   c0108861 <spin>
c0108911:	83 c4 10             	add    $0x10,%esp
c0108914:	90                   	nop
c0108915:	c9                   	leave  
c0108916:	c3                   	ret    

c0108917 <assertion_failure2>:
c0108917:	55                   	push   %ebp
c0108918:	89 e5                	mov    %esp,%ebp
c010891a:	83 ec 08             	sub    $0x8,%esp
c010891d:	83 ec 04             	sub    $0x4,%esp
c0108920:	ff 75 18             	pushl  0x18(%ebp)
c0108923:	ff 75 14             	pushl  0x14(%ebp)
c0108926:	ff 75 10             	pushl  0x10(%ebp)
c0108929:	ff 75 0c             	pushl  0xc(%ebp)
c010892c:	ff 75 08             	pushl  0x8(%ebp)
c010892f:	6a 3b                	push   $0x3b
c0108931:	68 b8 bd 10 c0       	push   $0xc010bdb8
c0108936:	e8 17 fe ff ff       	call   c0108752 <printx>
c010893b:	83 c4 20             	add    $0x20,%esp
c010893e:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0108945:	00 00 00 
c0108948:	83 ec 0c             	sub    $0xc,%esp
c010894b:	68 00 b6 10 c0       	push   $0xc010b600
c0108950:	e8 37 77 ff ff       	call   c010008c <disp_str>
c0108955:	83 c4 10             	add    $0x10,%esp
c0108958:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c010895d:	83 ec 0c             	sub    $0xc,%esp
c0108960:	50                   	push   %eax
c0108961:	e8 14 e7 ff ff       	call   c010707a <disp_int>
c0108966:	83 c4 10             	add    $0x10,%esp
c0108969:	83 ec 0c             	sub    $0xc,%esp
c010896c:	68 02 b6 10 c0       	push   $0xc010b602
c0108971:	e8 16 77 ff ff       	call   c010008c <disp_str>
c0108976:	83 c4 10             	add    $0x10,%esp
c0108979:	83 ec 0c             	sub    $0xc,%esp
c010897c:	68 ab bd 10 c0       	push   $0xc010bdab
c0108981:	e8 db fe ff ff       	call   c0108861 <spin>
c0108986:	83 c4 10             	add    $0x10,%esp
c0108989:	90                   	nop
c010898a:	c9                   	leave  
c010898b:	c3                   	ret    

c010898c <dead_lock>:
c010898c:	55                   	push   %ebp
c010898d:	89 e5                	mov    %esp,%ebp
c010898f:	b8 00 00 00 00       	mov    $0x0,%eax
c0108994:	5d                   	pop    %ebp
c0108995:	c3                   	ret    

c0108996 <sys_send_msg>:
c0108996:	55                   	push   %ebp
c0108997:	89 e5                	mov    %esp,%ebp
c0108999:	83 ec 58             	sub    $0x58,%esp
c010899c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01089a3:	83 ec 0c             	sub    $0xc,%esp
c01089a6:	ff 75 0c             	pushl  0xc(%ebp)
c01089a9:	e8 28 ae ff ff       	call   c01037d6 <pid2proc>
c01089ae:	83 c4 10             	add    $0x10,%esp
c01089b1:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01089b4:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c01089b8:	74 2c                	je     c01089e6 <sys_send_msg+0x50>
c01089ba:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01089bd:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c01089c3:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c01089c8:	74 1c                	je     c01089e6 <sys_send_msg+0x50>
c01089ca:	68 5c 05 00 00       	push   $0x55c
c01089cf:	68 61 ba 10 c0       	push   $0xc010ba61
c01089d4:	68 61 ba 10 c0       	push   $0xc010ba61
c01089d9:	68 f8 bd 10 c0       	push   $0xc010bdf8
c01089de:	e8 c2 fe ff ff       	call   c01088a5 <assertion_failure>
c01089e3:	83 c4 10             	add    $0x10,%esp
c01089e6:	8b 45 10             	mov    0x10(%ebp),%eax
c01089e9:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c01089ef:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c01089f4:	74 1c                	je     c0108a12 <sys_send_msg+0x7c>
c01089f6:	68 5e 05 00 00       	push   $0x55e
c01089fb:	68 61 ba 10 c0       	push   $0xc010ba61
c0108a00:	68 61 ba 10 c0       	push   $0xc010ba61
c0108a05:	68 20 be 10 c0       	push   $0xc010be20
c0108a0a:	e8 96 fe ff ff       	call   c01088a5 <assertion_failure>
c0108a0f:	83 c4 10             	add    $0x10,%esp
c0108a12:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0108a16:	75 22                	jne    c0108a3a <sys_send_msg+0xa4>
c0108a18:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0108a1c:	75 1c                	jne    c0108a3a <sys_send_msg+0xa4>
c0108a1e:	68 61 05 00 00       	push   $0x561
c0108a23:	68 61 ba 10 c0       	push   $0xc010ba61
c0108a28:	68 61 ba 10 c0       	push   $0xc010ba61
c0108a2d:	68 43 be 10 c0       	push   $0xc010be43
c0108a32:	e8 6e fe ff ff       	call   c01088a5 <assertion_failure>
c0108a37:	83 c4 10             	add    $0x10,%esp
c0108a3a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108a3d:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108a44:	84 c0                	test   %al,%al
c0108a46:	74 65                	je     c0108aad <sys_send_msg+0x117>
c0108a48:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108a4b:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108a52:	3c 01                	cmp    $0x1,%al
c0108a54:	74 57                	je     c0108aad <sys_send_msg+0x117>
c0108a56:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108a59:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108a60:	3c 02                	cmp    $0x2,%al
c0108a62:	74 49                	je     c0108aad <sys_send_msg+0x117>
c0108a64:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108a67:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108a6e:	3c 03                	cmp    $0x3,%al
c0108a70:	74 3b                	je     c0108aad <sys_send_msg+0x117>
c0108a72:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108a75:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108a7c:	3c 04                	cmp    $0x4,%al
c0108a7e:	74 2d                	je     c0108aad <sys_send_msg+0x117>
c0108a80:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108a83:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108a8a:	0f be c0             	movsbl %al,%eax
c0108a8d:	83 ec 0c             	sub    $0xc,%esp
c0108a90:	68 65 05 00 00       	push   $0x565
c0108a95:	68 61 ba 10 c0       	push   $0xc010ba61
c0108a9a:	68 61 ba 10 c0       	push   $0xc010ba61
c0108a9f:	50                   	push   %eax
c0108aa0:	68 54 be 10 c0       	push   $0xc010be54
c0108aa5:	e8 6d fe ff ff       	call   c0108917 <assertion_failure2>
c0108aaa:	83 c4 20             	add    $0x20,%esp
c0108aad:	8b 45 10             	mov    0x10(%ebp),%eax
c0108ab0:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108ab7:	84 c0                	test   %al,%al
c0108ab9:	74 65                	je     c0108b20 <sys_send_msg+0x18a>
c0108abb:	8b 45 10             	mov    0x10(%ebp),%eax
c0108abe:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108ac5:	3c 01                	cmp    $0x1,%al
c0108ac7:	74 57                	je     c0108b20 <sys_send_msg+0x18a>
c0108ac9:	8b 45 10             	mov    0x10(%ebp),%eax
c0108acc:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108ad3:	3c 02                	cmp    $0x2,%al
c0108ad5:	74 49                	je     c0108b20 <sys_send_msg+0x18a>
c0108ad7:	8b 45 10             	mov    0x10(%ebp),%eax
c0108ada:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108ae1:	3c 03                	cmp    $0x3,%al
c0108ae3:	74 3b                	je     c0108b20 <sys_send_msg+0x18a>
c0108ae5:	8b 45 10             	mov    0x10(%ebp),%eax
c0108ae8:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108aef:	3c 04                	cmp    $0x4,%al
c0108af1:	74 2d                	je     c0108b20 <sys_send_msg+0x18a>
c0108af3:	8b 45 10             	mov    0x10(%ebp),%eax
c0108af6:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108afd:	0f be c0             	movsbl %al,%eax
c0108b00:	83 ec 0c             	sub    $0xc,%esp
c0108b03:	68 68 05 00 00       	push   $0x568
c0108b08:	68 61 ba 10 c0       	push   $0xc010ba61
c0108b0d:	68 61 ba 10 c0       	push   $0xc010ba61
c0108b12:	50                   	push   %eax
c0108b13:	68 f0 be 10 c0       	push   $0xc010bef0
c0108b18:	e8 fa fd ff ff       	call   c0108917 <assertion_failure2>
c0108b1d:	83 c4 20             	add    $0x20,%esp
c0108b20:	83 ec 0c             	sub    $0xc,%esp
c0108b23:	ff 75 10             	pushl  0x10(%ebp)
c0108b26:	e8 31 ad ff ff       	call   c010385c <proc2pid>
c0108b2b:	83 c4 10             	add    $0x10,%esp
c0108b2e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0108b31:	c7 45 e0 7c 00 00 00 	movl   $0x7c,-0x20(%ebp)
c0108b38:	8b 45 08             	mov    0x8(%ebp),%eax
c0108b3b:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0108b3e:	83 ec 08             	sub    $0x8,%esp
c0108b41:	ff 75 e4             	pushl  -0x1c(%ebp)
c0108b44:	ff 75 dc             	pushl  -0x24(%ebp)
c0108b47:	e8 a6 d3 ff ff       	call   c0105ef2 <get_physical_address_proc>
c0108b4c:	83 c4 10             	add    $0x10,%esp
c0108b4f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0108b52:	83 ec 08             	sub    $0x8,%esp
c0108b55:	ff 75 e0             	pushl  -0x20(%ebp)
c0108b58:	ff 75 d8             	pushl  -0x28(%ebp)
c0108b5b:	e8 bf d2 ff ff       	call   c0105e1f <alloc_virtual_memory>
c0108b60:	83 c4 10             	add    $0x10,%esp
c0108b63:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0108b66:	8b 45 10             	mov    0x10(%ebp),%eax
c0108b69:	8b 80 80 02 00 00    	mov    0x280(%eax),%eax
c0108b6f:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0108b72:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0108b79:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0108b7c:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0108b7f:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0108b82:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0108b85:	89 10                	mov    %edx,(%eax)
c0108b87:	83 ec 08             	sub    $0x8,%esp
c0108b8a:	ff 75 0c             	pushl  0xc(%ebp)
c0108b8d:	ff 75 e4             	pushl  -0x1c(%ebp)
c0108b90:	e8 f7 fd ff ff       	call   c010898c <dead_lock>
c0108b95:	83 c4 10             	add    $0x10,%esp
c0108b98:	83 f8 01             	cmp    $0x1,%eax
c0108b9b:	75 10                	jne    c0108bad <sys_send_msg+0x217>
c0108b9d:	83 ec 0c             	sub    $0xc,%esp
c0108ba0:	68 80 bf 10 c0       	push   $0xc010bf80
c0108ba5:	e8 dd fc ff ff       	call   c0108887 <panic>
c0108baa:	83 c4 10             	add    $0x10,%esp
c0108bad:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108bb0:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108bb7:	3c 02                	cmp    $0x2,%al
c0108bb9:	0f 85 ca 01 00 00    	jne    c0108d89 <sys_send_msg+0x3f3>
c0108bbf:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108bc2:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0108bc8:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0108bcb:	74 12                	je     c0108bdf <sys_send_msg+0x249>
c0108bcd:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108bd0:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0108bd6:	83 f8 12             	cmp    $0x12,%eax
c0108bd9:	0f 85 aa 01 00 00    	jne    c0108d89 <sys_send_msg+0x3f3>
c0108bdf:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108be2:	8b 80 80 02 00 00    	mov    0x280(%eax),%eax
c0108be8:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0108beb:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108bee:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0108bf4:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0108bf7:	83 ec 08             	sub    $0x8,%esp
c0108bfa:	ff 75 0c             	pushl  0xc(%ebp)
c0108bfd:	ff 75 c0             	pushl  -0x40(%ebp)
c0108c00:	e8 ed d2 ff ff       	call   c0105ef2 <get_physical_address_proc>
c0108c05:	83 c4 10             	add    $0x10,%esp
c0108c08:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0108c0b:	83 ec 08             	sub    $0x8,%esp
c0108c0e:	ff 75 e0             	pushl  -0x20(%ebp)
c0108c11:	ff 75 bc             	pushl  -0x44(%ebp)
c0108c14:	e8 06 d2 ff ff       	call   c0105e1f <alloc_virtual_memory>
c0108c19:	83 c4 10             	add    $0x10,%esp
c0108c1c:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0108c1f:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0108c22:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0108c25:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0108c28:	83 ec 04             	sub    $0x4,%esp
c0108c2b:	51                   	push   %ecx
c0108c2c:	52                   	push   %edx
c0108c2d:	50                   	push   %eax
c0108c2e:	e8 59 e0 ff ff       	call   c0106c8c <Memcpy>
c0108c33:	83 c4 10             	add    $0x10,%esp
c0108c36:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0108c3b:	3d 41 05 00 00       	cmp    $0x541,%eax
c0108c40:	75 0a                	jne    c0108c4c <sys_send_msg+0x2b6>
c0108c42:	c7 05 a0 f7 10 c0 04 	movl   $0x4,0xc010f7a0
c0108c49:	00 00 00 
c0108c4c:	8b 45 10             	mov    0x10(%ebp),%eax
c0108c4f:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c0108c56:	00 00 00 
c0108c59:	8b 45 10             	mov    0x10(%ebp),%eax
c0108c5c:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0108c63:	8b 45 10             	mov    0x10(%ebp),%eax
c0108c66:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c0108c6d:	00 00 00 
c0108c70:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108c73:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c0108c7a:	00 00 00 
c0108c7d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108c80:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0108c87:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108c8a:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c0108c91:	00 00 00 
c0108c94:	8b 45 10             	mov    0x10(%ebp),%eax
c0108c97:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c0108c9e:	00 00 00 
c0108ca1:	83 ec 0c             	sub    $0xc,%esp
c0108ca4:	ff 75 e8             	pushl  -0x18(%ebp)
c0108ca7:	e8 a0 09 00 00       	call   c010964c <unblock>
c0108cac:	83 c4 10             	add    $0x10,%esp
c0108caf:	8b 45 10             	mov    0x10(%ebp),%eax
c0108cb2:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108cb9:	84 c0                	test   %al,%al
c0108cbb:	74 1c                	je     c0108cd9 <sys_send_msg+0x343>
c0108cbd:	68 a0 05 00 00       	push   $0x5a0
c0108cc2:	68 61 ba 10 c0       	push   $0xc010ba61
c0108cc7:	68 61 ba 10 c0       	push   $0xc010ba61
c0108ccc:	68 8b bf 10 c0       	push   $0xc010bf8b
c0108cd1:	e8 cf fb ff ff       	call   c01088a5 <assertion_failure>
c0108cd6:	83 c4 10             	add    $0x10,%esp
c0108cd9:	8b 45 10             	mov    0x10(%ebp),%eax
c0108cdc:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c0108ce2:	83 f8 21             	cmp    $0x21,%eax
c0108ce5:	74 1c                	je     c0108d03 <sys_send_msg+0x36d>
c0108ce7:	68 a1 05 00 00       	push   $0x5a1
c0108cec:	68 61 ba 10 c0       	push   $0xc010ba61
c0108cf1:	68 61 ba 10 c0       	push   $0xc010ba61
c0108cf6:	68 9f bf 10 c0       	push   $0xc010bf9f
c0108cfb:	e8 a5 fb ff ff       	call   c01088a5 <assertion_failure>
c0108d00:	83 c4 10             	add    $0x10,%esp
c0108d03:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108d06:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0108d0c:	85 c0                	test   %eax,%eax
c0108d0e:	74 1c                	je     c0108d2c <sys_send_msg+0x396>
c0108d10:	68 a3 05 00 00       	push   $0x5a3
c0108d15:	68 61 ba 10 c0       	push   $0xc010ba61
c0108d1a:	68 61 ba 10 c0       	push   $0xc010ba61
c0108d1f:	68 bc bf 10 c0       	push   $0xc010bfbc
c0108d24:	e8 7c fb ff ff       	call   c01088a5 <assertion_failure>
c0108d29:	83 c4 10             	add    $0x10,%esp
c0108d2c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108d2f:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108d36:	84 c0                	test   %al,%al
c0108d38:	74 1c                	je     c0108d56 <sys_send_msg+0x3c0>
c0108d3a:	68 a4 05 00 00       	push   $0x5a4
c0108d3f:	68 61 ba 10 c0       	push   $0xc010ba61
c0108d44:	68 61 ba 10 c0       	push   $0xc010ba61
c0108d49:	68 d1 bf 10 c0       	push   $0xc010bfd1
c0108d4e:	e8 52 fb ff ff       	call   c01088a5 <assertion_failure>
c0108d53:	83 c4 10             	add    $0x10,%esp
c0108d56:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108d59:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0108d5f:	83 f8 21             	cmp    $0x21,%eax
c0108d62:	0f 84 45 01 00 00    	je     c0108ead <sys_send_msg+0x517>
c0108d68:	68 a5 05 00 00       	push   $0x5a5
c0108d6d:	68 61 ba 10 c0       	push   $0xc010ba61
c0108d72:	68 61 ba 10 c0       	push   $0xc010ba61
c0108d77:	68 e8 bf 10 c0       	push   $0xc010bfe8
c0108d7c:	e8 24 fb ff ff       	call   c01088a5 <assertion_failure>
c0108d81:	83 c4 10             	add    $0x10,%esp
c0108d84:	e9 24 01 00 00       	jmp    c0108ead <sys_send_msg+0x517>
c0108d89:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108d90:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108d93:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0108d96:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108d99:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0108d9f:	85 c0                	test   %eax,%eax
c0108da1:	75 1b                	jne    c0108dbe <sys_send_msg+0x428>
c0108da3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108da6:	8b 55 10             	mov    0x10(%ebp),%edx
c0108da9:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c0108daf:	8b 45 10             	mov    0x10(%ebp),%eax
c0108db2:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c0108db9:	00 00 00 
c0108dbc:	eb 3f                	jmp    c0108dfd <sys_send_msg+0x467>
c0108dbe:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108dc1:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0108dc7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108dca:	eb 12                	jmp    c0108dde <sys_send_msg+0x448>
c0108dcc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108dcf:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108dd2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108dd5:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0108ddb:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108dde:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0108de2:	75 e8                	jne    c0108dcc <sys_send_msg+0x436>
c0108de4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108de7:	8b 55 10             	mov    0x10(%ebp),%edx
c0108dea:	89 90 50 02 00 00    	mov    %edx,0x250(%eax)
c0108df0:	8b 45 10             	mov    0x10(%ebp),%eax
c0108df3:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c0108dfa:	00 00 00 
c0108dfd:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e00:	8b 55 08             	mov    0x8(%ebp),%edx
c0108e03:	89 90 40 02 00 00    	mov    %edx,0x240(%eax)
c0108e09:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e0c:	8b 55 0c             	mov    0xc(%ebp),%edx
c0108e0f:	89 90 44 02 00 00    	mov    %edx,0x244(%eax)
c0108e15:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e18:	c6 80 3c 02 00 00 01 	movb   $0x1,0x23c(%eax)
c0108e1f:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e22:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108e29:	3c 01                	cmp    $0x1,%al
c0108e2b:	74 1c                	je     c0108e49 <sys_send_msg+0x4b3>
c0108e2d:	68 c7 05 00 00       	push   $0x5c7
c0108e32:	68 61 ba 10 c0       	push   $0xc010ba61
c0108e37:	68 61 ba 10 c0       	push   $0xc010ba61
c0108e3c:	68 0c c0 10 c0       	push   $0xc010c00c
c0108e41:	e8 5f fa ff ff       	call   c01088a5 <assertion_failure>
c0108e46:	83 c4 10             	add    $0x10,%esp
c0108e49:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e4c:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c0108e52:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0108e55:	74 1c                	je     c0108e73 <sys_send_msg+0x4dd>
c0108e57:	68 c8 05 00 00       	push   $0x5c8
c0108e5c:	68 61 ba 10 c0       	push   $0xc010ba61
c0108e61:	68 61 ba 10 c0       	push   $0xc010ba61
c0108e66:	68 28 c0 10 c0       	push   $0xc010c028
c0108e6b:	e8 35 fa ff ff       	call   c01088a5 <assertion_failure>
c0108e70:	83 c4 10             	add    $0x10,%esp
c0108e73:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e76:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0108e7c:	39 45 08             	cmp    %eax,0x8(%ebp)
c0108e7f:	74 1c                	je     c0108e9d <sys_send_msg+0x507>
c0108e81:	68 c9 05 00 00       	push   $0x5c9
c0108e86:	68 61 ba 10 c0       	push   $0xc010ba61
c0108e8b:	68 61 ba 10 c0       	push   $0xc010ba61
c0108e90:	68 4a c0 10 c0       	push   $0xc010c04a
c0108e95:	e8 0b fa ff ff       	call   c01088a5 <assertion_failure>
c0108e9a:	83 c4 10             	add    $0x10,%esp
c0108e9d:	83 ec 0c             	sub    $0xc,%esp
c0108ea0:	ff 75 10             	pushl  0x10(%ebp)
c0108ea3:	e8 68 07 00 00       	call   c0109610 <block>
c0108ea8:	83 c4 10             	add    $0x10,%esp
c0108eab:	eb 01                	jmp    c0108eae <sys_send_msg+0x518>
c0108ead:	90                   	nop
c0108eae:	b8 00 00 00 00       	mov    $0x0,%eax
c0108eb3:	c9                   	leave  
c0108eb4:	c3                   	ret    

c0108eb5 <sys_receive_msg>:
c0108eb5:	55                   	push   %ebp
c0108eb6:	89 e5                	mov    %esp,%ebp
c0108eb8:	83 ec 58             	sub    $0x58,%esp
c0108ebb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108ec2:	83 ec 0c             	sub    $0xc,%esp
c0108ec5:	ff 75 0c             	pushl  0xc(%ebp)
c0108ec8:	e8 09 a9 ff ff       	call   c01037d6 <pid2proc>
c0108ecd:	83 c4 10             	add    $0x10,%esp
c0108ed0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0108ed3:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0108ed7:	74 2c                	je     c0108f05 <sys_receive_msg+0x50>
c0108ed9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108edc:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c0108ee2:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0108ee7:	74 1c                	je     c0108f05 <sys_receive_msg+0x50>
c0108ee9:	68 dd 05 00 00       	push   $0x5dd
c0108eee:	68 61 ba 10 c0       	push   $0xc010ba61
c0108ef3:	68 61 ba 10 c0       	push   $0xc010ba61
c0108ef8:	68 20 be 10 c0       	push   $0xc010be20
c0108efd:	e8 a3 f9 ff ff       	call   c01088a5 <assertion_failure>
c0108f02:	83 c4 10             	add    $0x10,%esp
c0108f05:	8b 45 10             	mov    0x10(%ebp),%eax
c0108f08:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c0108f0e:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0108f13:	74 1c                	je     c0108f31 <sys_receive_msg+0x7c>
c0108f15:	68 df 05 00 00       	push   $0x5df
c0108f1a:	68 61 ba 10 c0       	push   $0xc010ba61
c0108f1f:	68 61 ba 10 c0       	push   $0xc010ba61
c0108f24:	68 f8 bd 10 c0       	push   $0xc010bdf8
c0108f29:	e8 77 f9 ff ff       	call   c01088a5 <assertion_failure>
c0108f2e:	83 c4 10             	add    $0x10,%esp
c0108f31:	8b 45 10             	mov    0x10(%ebp),%eax
c0108f34:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108f3b:	84 c0                	test   %al,%al
c0108f3d:	74 65                	je     c0108fa4 <sys_receive_msg+0xef>
c0108f3f:	8b 45 10             	mov    0x10(%ebp),%eax
c0108f42:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108f49:	3c 01                	cmp    $0x1,%al
c0108f4b:	74 57                	je     c0108fa4 <sys_receive_msg+0xef>
c0108f4d:	8b 45 10             	mov    0x10(%ebp),%eax
c0108f50:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108f57:	3c 02                	cmp    $0x2,%al
c0108f59:	74 49                	je     c0108fa4 <sys_receive_msg+0xef>
c0108f5b:	8b 45 10             	mov    0x10(%ebp),%eax
c0108f5e:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108f65:	3c 03                	cmp    $0x3,%al
c0108f67:	74 3b                	je     c0108fa4 <sys_receive_msg+0xef>
c0108f69:	8b 45 10             	mov    0x10(%ebp),%eax
c0108f6c:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108f73:	3c 04                	cmp    $0x4,%al
c0108f75:	74 2d                	je     c0108fa4 <sys_receive_msg+0xef>
c0108f77:	8b 45 10             	mov    0x10(%ebp),%eax
c0108f7a:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108f81:	0f be c0             	movsbl %al,%eax
c0108f84:	83 ec 0c             	sub    $0xc,%esp
c0108f87:	68 e2 05 00 00       	push   $0x5e2
c0108f8c:	68 61 ba 10 c0       	push   $0xc010ba61
c0108f91:	68 61 ba 10 c0       	push   $0xc010ba61
c0108f96:	50                   	push   %eax
c0108f97:	68 54 be 10 c0       	push   $0xc010be54
c0108f9c:	e8 76 f9 ff ff       	call   c0108917 <assertion_failure2>
c0108fa1:	83 c4 20             	add    $0x20,%esp
c0108fa4:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0108fa8:	74 73                	je     c010901d <sys_receive_msg+0x168>
c0108faa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108fad:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108fb4:	84 c0                	test   %al,%al
c0108fb6:	74 65                	je     c010901d <sys_receive_msg+0x168>
c0108fb8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108fbb:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108fc2:	3c 01                	cmp    $0x1,%al
c0108fc4:	74 57                	je     c010901d <sys_receive_msg+0x168>
c0108fc6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108fc9:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108fd0:	3c 02                	cmp    $0x2,%al
c0108fd2:	74 49                	je     c010901d <sys_receive_msg+0x168>
c0108fd4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108fd7:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108fde:	3c 03                	cmp    $0x3,%al
c0108fe0:	74 3b                	je     c010901d <sys_receive_msg+0x168>
c0108fe2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108fe5:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108fec:	3c 04                	cmp    $0x4,%al
c0108fee:	74 2d                	je     c010901d <sys_receive_msg+0x168>
c0108ff0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108ff3:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108ffa:	0f be c0             	movsbl %al,%eax
c0108ffd:	83 ec 0c             	sub    $0xc,%esp
c0109000:	68 e6 05 00 00       	push   $0x5e6
c0109005:	68 61 ba 10 c0       	push   $0xc010ba61
c010900a:	68 61 ba 10 c0       	push   $0xc010ba61
c010900f:	50                   	push   %eax
c0109010:	68 f0 be 10 c0       	push   $0xc010bef0
c0109015:	e8 fd f8 ff ff       	call   c0108917 <assertion_failure2>
c010901a:	83 c4 20             	add    $0x20,%esp
c010901d:	83 ec 0c             	sub    $0xc,%esp
c0109020:	ff 75 10             	pushl  0x10(%ebp)
c0109023:	e8 34 a8 ff ff       	call   c010385c <proc2pid>
c0109028:	83 c4 10             	add    $0x10,%esp
c010902b:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010902e:	c7 45 dc 7c 00 00 00 	movl   $0x7c,-0x24(%ebp)
c0109035:	8b 45 08             	mov    0x8(%ebp),%eax
c0109038:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010903b:	8b 45 10             	mov    0x10(%ebp),%eax
c010903e:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c0109044:	83 ec 08             	sub    $0x8,%esp
c0109047:	50                   	push   %eax
c0109048:	ff 75 d8             	pushl  -0x28(%ebp)
c010904b:	e8 a2 ce ff ff       	call   c0105ef2 <get_physical_address_proc>
c0109050:	83 c4 10             	add    $0x10,%esp
c0109053:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0109056:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010905d:	8b 45 10             	mov    0x10(%ebp),%eax
c0109060:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0109066:	85 c0                	test   %eax,%eax
c0109068:	0f 84 c5 00 00 00    	je     c0109133 <sys_receive_msg+0x27e>
c010906e:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0109072:	74 0d                	je     c0109081 <sys_receive_msg+0x1cc>
c0109074:	81 7d 0c 13 02 00 00 	cmpl   $0x213,0xc(%ebp)
c010907b:	0f 85 b2 00 00 00    	jne    c0109133 <sys_receive_msg+0x27e>
c0109081:	c7 45 d0 7c 00 00 00 	movl   $0x7c,-0x30(%ebp)
c0109088:	83 ec 0c             	sub    $0xc,%esp
c010908b:	ff 75 d0             	pushl  -0x30(%ebp)
c010908e:	e8 49 85 ff ff       	call   c01015dc <sys_malloc>
c0109093:	83 c4 10             	add    $0x10,%esp
c0109096:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0109099:	8b 45 d0             	mov    -0x30(%ebp),%eax
c010909c:	83 ec 04             	sub    $0x4,%esp
c010909f:	50                   	push   %eax
c01090a0:	6a 00                	push   $0x0
c01090a2:	ff 75 cc             	pushl  -0x34(%ebp)
c01090a5:	e8 25 31 00 00       	call   c010c1cf <Memset>
c01090aa:	83 c4 10             	add    $0x10,%esp
c01090ad:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01090b0:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c01090b6:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01090b9:	c7 40 78 d5 07 00 00 	movl   $0x7d5,0x78(%eax)
c01090c0:	83 ec 08             	sub    $0x8,%esp
c01090c3:	ff 75 d0             	pushl  -0x30(%ebp)
c01090c6:	ff 75 d4             	pushl  -0x2c(%ebp)
c01090c9:	e8 51 cd ff ff       	call   c0105e1f <alloc_virtual_memory>
c01090ce:	83 c4 10             	add    $0x10,%esp
c01090d1:	89 45 c8             	mov    %eax,-0x38(%ebp)
c01090d4:	8b 55 d0             	mov    -0x30(%ebp),%edx
c01090d7:	8b 45 c8             	mov    -0x38(%ebp),%eax
c01090da:	83 ec 04             	sub    $0x4,%esp
c01090dd:	52                   	push   %edx
c01090de:	ff 75 cc             	pushl  -0x34(%ebp)
c01090e1:	50                   	push   %eax
c01090e2:	e8 a5 db ff ff       	call   c0106c8c <Memcpy>
c01090e7:	83 c4 10             	add    $0x10,%esp
c01090ea:	8b 45 10             	mov    0x10(%ebp),%eax
c01090ed:	c7 80 54 02 00 00 00 	movl   $0x0,0x254(%eax)
c01090f4:	00 00 00 
c01090f7:	8b 45 10             	mov    0x10(%ebp),%eax
c01090fa:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c0109101:	00 00 00 
c0109104:	8b 45 10             	mov    0x10(%ebp),%eax
c0109107:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c010910e:	00 00 00 
c0109111:	8b 45 10             	mov    0x10(%ebp),%eax
c0109114:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c010911b:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c0109122:	83 ec 08             	sub    $0x8,%esp
c0109125:	ff 75 d0             	pushl  -0x30(%ebp)
c0109128:	ff 75 cc             	pushl  -0x34(%ebp)
c010912b:	e8 c1 84 ff ff       	call   c01015f1 <sys_free>
c0109130:	83 c4 10             	add    $0x10,%esp
c0109133:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c0109137:	0f 84 d4 03 00 00    	je     c0109511 <sys_receive_msg+0x65c>
c010913d:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0109141:	75 26                	jne    c0109169 <sys_receive_msg+0x2b4>
c0109143:	8b 45 10             	mov    0x10(%ebp),%eax
c0109146:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c010914c:	85 c0                	test   %eax,%eax
c010914e:	0f 84 8a 00 00 00    	je     c01091de <sys_receive_msg+0x329>
c0109154:	8b 45 10             	mov    0x10(%ebp),%eax
c0109157:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c010915d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109160:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0109167:	eb 75                	jmp    c01091de <sys_receive_msg+0x329>
c0109169:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010916d:	78 6f                	js     c01091de <sys_receive_msg+0x329>
c010916f:	83 7d 0c 07          	cmpl   $0x7,0xc(%ebp)
c0109173:	7f 69                	jg     c01091de <sys_receive_msg+0x329>
c0109175:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109178:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010917f:	3c 01                	cmp    $0x1,%al
c0109181:	75 5b                	jne    c01091de <sys_receive_msg+0x329>
c0109183:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109186:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c010918c:	83 f8 12             	cmp    $0x12,%eax
c010918f:	74 0e                	je     c010919f <sys_receive_msg+0x2ea>
c0109191:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109194:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c010919a:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c010919d:	75 3f                	jne    c01091de <sys_receive_msg+0x329>
c010919f:	8b 45 10             	mov    0x10(%ebp),%eax
c01091a2:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c01091a8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01091ab:	eb 2b                	jmp    c01091d8 <sys_receive_msg+0x323>
c01091ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01091b0:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01091b3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01091b6:	8b 90 14 01 00 00    	mov    0x114(%eax),%edx
c01091bc:	8b 45 0c             	mov    0xc(%ebp),%eax
c01091bf:	39 c2                	cmp    %eax,%edx
c01091c1:	75 09                	jne    c01091cc <sys_receive_msg+0x317>
c01091c3:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c01091ca:	eb 12                	jmp    c01091de <sys_receive_msg+0x329>
c01091cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01091cf:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c01091d5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01091d8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c01091dc:	75 cf                	jne    c01091ad <sys_receive_msg+0x2f8>
c01091de:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c01091e2:	0f 85 4e 02 00 00    	jne    c0109436 <sys_receive_msg+0x581>
c01091e8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01091eb:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c01091ee:	83 ec 08             	sub    $0x8,%esp
c01091f1:	ff 75 dc             	pushl  -0x24(%ebp)
c01091f4:	ff 75 d4             	pushl  -0x2c(%ebp)
c01091f7:	e8 23 cc ff ff       	call   c0105e1f <alloc_virtual_memory>
c01091fc:	83 c4 10             	add    $0x10,%esp
c01091ff:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0109202:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0109205:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c010920b:	89 45 bc             	mov    %eax,-0x44(%ebp)
c010920e:	83 ec 0c             	sub    $0xc,%esp
c0109211:	ff 75 c4             	pushl  -0x3c(%ebp)
c0109214:	e8 43 a6 ff ff       	call   c010385c <proc2pid>
c0109219:	83 c4 10             	add    $0x10,%esp
c010921c:	89 45 b8             	mov    %eax,-0x48(%ebp)
c010921f:	83 ec 08             	sub    $0x8,%esp
c0109222:	ff 75 b8             	pushl  -0x48(%ebp)
c0109225:	ff 75 bc             	pushl  -0x44(%ebp)
c0109228:	e8 c5 cc ff ff       	call   c0105ef2 <get_physical_address_proc>
c010922d:	83 c4 10             	add    $0x10,%esp
c0109230:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0109233:	83 ec 08             	sub    $0x8,%esp
c0109236:	ff 75 dc             	pushl  -0x24(%ebp)
c0109239:	ff 75 b4             	pushl  -0x4c(%ebp)
c010923c:	e8 de cb ff ff       	call   c0105e1f <alloc_virtual_memory>
c0109241:	83 c4 10             	add    $0x10,%esp
c0109244:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0109247:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010924a:	83 ec 04             	sub    $0x4,%esp
c010924d:	50                   	push   %eax
c010924e:	ff 75 b0             	pushl  -0x50(%ebp)
c0109251:	ff 75 c0             	pushl  -0x40(%ebp)
c0109254:	e8 33 da ff ff       	call   c0106c8c <Memcpy>
c0109259:	83 c4 10             	add    $0x10,%esp
c010925c:	8b 45 c0             	mov    -0x40(%ebp),%eax
c010925f:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0109262:	8b 45 10             	mov    0x10(%ebp),%eax
c0109265:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c010926b:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c010926e:	75 21                	jne    c0109291 <sys_receive_msg+0x3dc>
c0109270:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109273:	8b 90 50 02 00 00    	mov    0x250(%eax),%edx
c0109279:	8b 45 10             	mov    0x10(%ebp),%eax
c010927c:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c0109282:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109285:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c010928c:	00 00 00 
c010928f:	eb 1f                	jmp    c01092b0 <sys_receive_msg+0x3fb>
c0109291:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109294:	8b 90 50 02 00 00    	mov    0x250(%eax),%edx
c010929a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010929d:	89 90 50 02 00 00    	mov    %edx,0x250(%eax)
c01092a3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01092a6:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c01092ad:	00 00 00 
c01092b0:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01092b3:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c01092ba:	00 00 00 
c01092bd:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01092c0:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c01092c7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01092ca:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c01092d1:	00 00 00 
c01092d4:	8b 45 10             	mov    0x10(%ebp),%eax
c01092d7:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c01092de:	00 00 00 
c01092e1:	8b 45 10             	mov    0x10(%ebp),%eax
c01092e4:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c01092eb:	00 00 00 
c01092ee:	8b 45 10             	mov    0x10(%ebp),%eax
c01092f1:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c01092f8:	00 00 00 
c01092fb:	83 ec 0c             	sub    $0xc,%esp
c01092fe:	ff 75 c4             	pushl  -0x3c(%ebp)
c0109301:	e8 46 03 00 00       	call   c010964c <unblock>
c0109306:	83 c4 10             	add    $0x10,%esp
c0109309:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c010930c:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0109312:	85 c0                	test   %eax,%eax
c0109314:	74 1c                	je     c0109332 <sys_receive_msg+0x47d>
c0109316:	68 56 06 00 00       	push   $0x656
c010931b:	68 61 ba 10 c0       	push   $0xc010ba61
c0109320:	68 61 ba 10 c0       	push   $0xc010ba61
c0109325:	68 5f c0 10 c0       	push   $0xc010c05f
c010932a:	e8 76 f5 ff ff       	call   c01088a5 <assertion_failure>
c010932f:	83 c4 10             	add    $0x10,%esp
c0109332:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0109335:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010933c:	84 c0                	test   %al,%al
c010933e:	74 1c                	je     c010935c <sys_receive_msg+0x4a7>
c0109340:	68 57 06 00 00       	push   $0x657
c0109345:	68 61 ba 10 c0       	push   $0xc010ba61
c010934a:	68 61 ba 10 c0       	push   $0xc010ba61
c010934f:	68 77 c0 10 c0       	push   $0xc010c077
c0109354:	e8 4c f5 ff ff       	call   c01088a5 <assertion_failure>
c0109359:	83 c4 10             	add    $0x10,%esp
c010935c:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c010935f:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c0109365:	83 f8 21             	cmp    $0x21,%eax
c0109368:	74 1c                	je     c0109386 <sys_receive_msg+0x4d1>
c010936a:	68 58 06 00 00       	push   $0x658
c010936f:	68 61 ba 10 c0       	push   $0xc010ba61
c0109374:	68 61 ba 10 c0       	push   $0xc010ba61
c0109379:	68 90 c0 10 c0       	push   $0xc010c090
c010937e:	e8 22 f5 ff ff       	call   c01088a5 <assertion_failure>
c0109383:	83 c4 10             	add    $0x10,%esp
c0109386:	8b 45 10             	mov    0x10(%ebp),%eax
c0109389:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c010938f:	85 c0                	test   %eax,%eax
c0109391:	74 1c                	je     c01093af <sys_receive_msg+0x4fa>
c0109393:	68 5a 06 00 00       	push   $0x65a
c0109398:	68 61 ba 10 c0       	push   $0xc010ba61
c010939d:	68 61 ba 10 c0       	push   $0xc010ba61
c01093a2:	68 bc bf 10 c0       	push   $0xc010bfbc
c01093a7:	e8 f9 f4 ff ff       	call   c01088a5 <assertion_failure>
c01093ac:	83 c4 10             	add    $0x10,%esp
c01093af:	8b 45 10             	mov    0x10(%ebp),%eax
c01093b2:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01093b9:	84 c0                	test   %al,%al
c01093bb:	74 1c                	je     c01093d9 <sys_receive_msg+0x524>
c01093bd:	68 5b 06 00 00       	push   $0x65b
c01093c2:	68 61 ba 10 c0       	push   $0xc010ba61
c01093c7:	68 61 ba 10 c0       	push   $0xc010ba61
c01093cc:	68 d1 bf 10 c0       	push   $0xc010bfd1
c01093d1:	e8 cf f4 ff ff       	call   c01088a5 <assertion_failure>
c01093d6:	83 c4 10             	add    $0x10,%esp
c01093d9:	8b 45 10             	mov    0x10(%ebp),%eax
c01093dc:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c01093e2:	83 f8 21             	cmp    $0x21,%eax
c01093e5:	74 1c                	je     c0109403 <sys_receive_msg+0x54e>
c01093e7:	68 5c 06 00 00       	push   $0x65c
c01093ec:	68 61 ba 10 c0       	push   $0xc010ba61
c01093f1:	68 61 ba 10 c0       	push   $0xc010ba61
c01093f6:	68 e8 bf 10 c0       	push   $0xc010bfe8
c01093fb:	e8 a5 f4 ff ff       	call   c01088a5 <assertion_failure>
c0109400:	83 c4 10             	add    $0x10,%esp
c0109403:	8b 45 10             	mov    0x10(%ebp),%eax
c0109406:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c010940c:	83 f8 21             	cmp    $0x21,%eax
c010940f:	0f 84 f5 00 00 00    	je     c010950a <sys_receive_msg+0x655>
c0109415:	68 5d 06 00 00       	push   $0x65d
c010941a:	68 61 ba 10 c0       	push   $0xc010ba61
c010941f:	68 61 ba 10 c0       	push   $0xc010ba61
c0109424:	68 b4 c0 10 c0       	push   $0xc010c0b4
c0109429:	e8 77 f4 ff ff       	call   c01088a5 <assertion_failure>
c010942e:	83 c4 10             	add    $0x10,%esp
c0109431:	e9 d4 00 00 00       	jmp    c010950a <sys_receive_msg+0x655>
c0109436:	8b 45 10             	mov    0x10(%ebp),%eax
c0109439:	c6 80 3c 02 00 00 02 	movb   $0x2,0x23c(%eax)
c0109440:	8b 45 10             	mov    0x10(%ebp),%eax
c0109443:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010944a:	3c 02                	cmp    $0x2,%al
c010944c:	74 1c                	je     c010946a <sys_receive_msg+0x5b5>
c010944e:	68 62 06 00 00       	push   $0x662
c0109453:	68 61 ba 10 c0       	push   $0xc010ba61
c0109458:	68 61 ba 10 c0       	push   $0xc010ba61
c010945d:	68 d3 c0 10 c0       	push   $0xc010c0d3
c0109462:	e8 3e f4 ff ff       	call   c01088a5 <assertion_failure>
c0109467:	83 c4 10             	add    $0x10,%esp
c010946a:	8b 45 10             	mov    0x10(%ebp),%eax
c010946d:	8b 55 08             	mov    0x8(%ebp),%edx
c0109470:	89 90 40 02 00 00    	mov    %edx,0x240(%eax)
c0109476:	8b 45 10             	mov    0x10(%ebp),%eax
c0109479:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109480:	3c 02                	cmp    $0x2,%al
c0109482:	74 1c                	je     c01094a0 <sys_receive_msg+0x5eb>
c0109484:	68 64 06 00 00       	push   $0x664
c0109489:	68 61 ba 10 c0       	push   $0xc010ba61
c010948e:	68 61 ba 10 c0       	push   $0xc010ba61
c0109493:	68 d3 c0 10 c0       	push   $0xc010c0d3
c0109498:	e8 08 f4 ff ff       	call   c01088a5 <assertion_failure>
c010949d:	83 c4 10             	add    $0x10,%esp
c01094a0:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c01094a4:	75 0f                	jne    c01094b5 <sys_receive_msg+0x600>
c01094a6:	8b 45 10             	mov    0x10(%ebp),%eax
c01094a9:	c7 80 48 02 00 00 12 	movl   $0x12,0x248(%eax)
c01094b0:	00 00 00 
c01094b3:	eb 0c                	jmp    c01094c1 <sys_receive_msg+0x60c>
c01094b5:	8b 45 10             	mov    0x10(%ebp),%eax
c01094b8:	8b 55 0c             	mov    0xc(%ebp),%edx
c01094bb:	89 90 48 02 00 00    	mov    %edx,0x248(%eax)
c01094c1:	8b 45 10             	mov    0x10(%ebp),%eax
c01094c4:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01094cb:	3c 02                	cmp    $0x2,%al
c01094cd:	74 2d                	je     c01094fc <sys_receive_msg+0x647>
c01094cf:	8b 45 10             	mov    0x10(%ebp),%eax
c01094d2:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01094d9:	0f be c0             	movsbl %al,%eax
c01094dc:	83 ec 0c             	sub    $0xc,%esp
c01094df:	68 6f 06 00 00       	push   $0x66f
c01094e4:	68 61 ba 10 c0       	push   $0xc010ba61
c01094e9:	68 61 ba 10 c0       	push   $0xc010ba61
c01094ee:	50                   	push   %eax
c01094ef:	68 d3 c0 10 c0       	push   $0xc010c0d3
c01094f4:	e8 1e f4 ff ff       	call   c0108917 <assertion_failure2>
c01094f9:	83 c4 20             	add    $0x20,%esp
c01094fc:	83 ec 0c             	sub    $0xc,%esp
c01094ff:	ff 75 10             	pushl  0x10(%ebp)
c0109502:	e8 09 01 00 00       	call   c0109610 <block>
c0109507:	83 c4 10             	add    $0x10,%esp
c010950a:	b8 00 00 00 00       	mov    $0x0,%eax
c010950f:	eb 02                	jmp    c0109513 <sys_receive_msg+0x65e>
c0109511:	90                   	nop
c0109512:	90                   	nop
c0109513:	c9                   	leave  
c0109514:	c3                   	ret    

c0109515 <send_rec>:
c0109515:	55                   	push   %ebp
c0109516:	89 e5                	mov    %esp,%ebp
c0109518:	83 ec 18             	sub    $0x18,%esp
c010951b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010951e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109521:	c7 45 f0 7c 00 00 00 	movl   $0x7c,-0x10(%ebp)
c0109528:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c010952c:	74 28                	je     c0109556 <send_rec+0x41>
c010952e:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0109532:	74 22                	je     c0109556 <send_rec+0x41>
c0109534:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c0109538:	74 1c                	je     c0109556 <send_rec+0x41>
c010953a:	68 81 06 00 00       	push   $0x681
c010953f:	68 61 ba 10 c0       	push   $0xc010ba61
c0109544:	68 61 ba 10 c0       	push   $0xc010ba61
c0109549:	68 f4 c0 10 c0       	push   $0xc010c0f4
c010954e:	e8 52 f3 ff ff       	call   c01088a5 <assertion_failure>
c0109553:	83 c4 10             	add    $0x10,%esp
c0109556:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c010955a:	75 14                	jne    c0109570 <send_rec+0x5b>
c010955c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010955f:	83 ec 04             	sub    $0x4,%esp
c0109562:	50                   	push   %eax
c0109563:	6a 00                	push   $0x0
c0109565:	ff 75 0c             	pushl  0xc(%ebp)
c0109568:	e8 62 2c 00 00       	call   c010c1cf <Memset>
c010956d:	83 c4 10             	add    $0x10,%esp
c0109570:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0109574:	74 23                	je     c0109599 <send_rec+0x84>
c0109576:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c010957a:	74 34                	je     c01095b0 <send_rec+0x9b>
c010957c:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c0109580:	75 74                	jne    c01095f6 <send_rec+0xe1>
c0109582:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109585:	83 ec 08             	sub    $0x8,%esp
c0109588:	ff 75 10             	pushl  0x10(%ebp)
c010958b:	50                   	push   %eax
c010958c:	e8 1f 80 ff ff       	call   c01015b0 <send_msg>
c0109591:	83 c4 10             	add    $0x10,%esp
c0109594:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109597:	eb 70                	jmp    c0109609 <send_rec+0xf4>
c0109599:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010959c:	83 ec 08             	sub    $0x8,%esp
c010959f:	ff 75 10             	pushl  0x10(%ebp)
c01095a2:	50                   	push   %eax
c01095a3:	e8 1e 80 ff ff       	call   c01015c6 <receive_msg>
c01095a8:	83 c4 10             	add    $0x10,%esp
c01095ab:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01095ae:	eb 59                	jmp    c0109609 <send_rec+0xf4>
c01095b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01095b3:	83 ec 08             	sub    $0x8,%esp
c01095b6:	ff 75 10             	pushl  0x10(%ebp)
c01095b9:	50                   	push   %eax
c01095ba:	e8 f1 7f ff ff       	call   c01015b0 <send_msg>
c01095bf:	83 c4 10             	add    $0x10,%esp
c01095c2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01095c5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c01095c9:	75 3d                	jne    c0109608 <send_rec+0xf3>
c01095cb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01095ce:	83 ec 04             	sub    $0x4,%esp
c01095d1:	50                   	push   %eax
c01095d2:	6a 00                	push   $0x0
c01095d4:	ff 75 0c             	pushl  0xc(%ebp)
c01095d7:	e8 f3 2b 00 00       	call   c010c1cf <Memset>
c01095dc:	83 c4 10             	add    $0x10,%esp
c01095df:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01095e2:	83 ec 08             	sub    $0x8,%esp
c01095e5:	ff 75 10             	pushl  0x10(%ebp)
c01095e8:	50                   	push   %eax
c01095e9:	e8 d8 7f ff ff       	call   c01015c6 <receive_msg>
c01095ee:	83 c4 10             	add    $0x10,%esp
c01095f1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01095f4:	eb 12                	jmp    c0109608 <send_rec+0xf3>
c01095f6:	83 ec 0c             	sub    $0xc,%esp
c01095f9:	68 30 c1 10 c0       	push   $0xc010c130
c01095fe:	e8 84 f2 ff ff       	call   c0108887 <panic>
c0109603:	83 c4 10             	add    $0x10,%esp
c0109606:	eb 01                	jmp    c0109609 <send_rec+0xf4>
c0109608:	90                   	nop
c0109609:	b8 00 00 00 00       	mov    $0x0,%eax
c010960e:	c9                   	leave  
c010960f:	c3                   	ret    

c0109610 <block>:
c0109610:	55                   	push   %ebp
c0109611:	89 e5                	mov    %esp,%ebp
c0109613:	83 ec 08             	sub    $0x8,%esp
c0109616:	8b 45 08             	mov    0x8(%ebp),%eax
c0109619:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109620:	84 c0                	test   %al,%al
c0109622:	75 1c                	jne    c0109640 <block+0x30>
c0109624:	68 b0 06 00 00       	push   $0x6b0
c0109629:	68 61 ba 10 c0       	push   $0xc010ba61
c010962e:	68 61 ba 10 c0       	push   $0xc010ba61
c0109633:	68 45 c1 10 c0       	push   $0xc010c145
c0109638:	e8 68 f2 ff ff       	call   c01088a5 <assertion_failure>
c010963d:	83 c4 10             	add    $0x10,%esp
c0109640:	e8 13 a0 ff ff       	call   c0103658 <schedule_process>
c0109645:	b8 00 00 00 00       	mov    $0x0,%eax
c010964a:	c9                   	leave  
c010964b:	c3                   	ret    

c010964c <unblock>:
c010964c:	55                   	push   %ebp
c010964d:	89 e5                	mov    %esp,%ebp
c010964f:	83 ec 08             	sub    $0x8,%esp
c0109652:	8b 45 08             	mov    0x8(%ebp),%eax
c0109655:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010965c:	84 c0                	test   %al,%al
c010965e:	74 1c                	je     c010967c <unblock+0x30>
c0109660:	68 b9 06 00 00       	push   $0x6b9
c0109665:	68 61 ba 10 c0       	push   $0xc010ba61
c010966a:	68 61 ba 10 c0       	push   $0xc010ba61
c010966f:	68 5d c1 10 c0       	push   $0xc010c15d
c0109674:	e8 2c f2 ff ff       	call   c01088a5 <assertion_failure>
c0109679:	83 c4 10             	add    $0x10,%esp
c010967c:	8b 45 08             	mov    0x8(%ebp),%eax
c010967f:	05 60 02 00 00       	add    $0x260,%eax
c0109684:	83 ec 08             	sub    $0x8,%esp
c0109687:	50                   	push   %eax
c0109688:	68 ec fd 10 c0       	push   $0xc010fdec
c010968d:	e8 ce 0a 00 00       	call   c010a160 <appendToDoubleLinkList>
c0109692:	83 c4 10             	add    $0x10,%esp
c0109695:	b8 00 00 00 00       	mov    $0x0,%eax
c010969a:	c9                   	leave  
c010969b:	c3                   	ret    

c010969c <get_ticks_ipc>:
c010969c:	55                   	push   %ebp
c010969d:	89 e5                	mov    %esp,%ebp
c010969f:	81 ec 98 00 00 00    	sub    $0x98,%esp
c01096a5:	83 ec 04             	sub    $0x4,%esp
c01096a8:	6a 7c                	push   $0x7c
c01096aa:	6a 00                	push   $0x0
c01096ac:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01096b2:	50                   	push   %eax
c01096b3:	e8 17 2b 00 00       	call   c010c1cf <Memset>
c01096b8:	83 c4 10             	add    $0x10,%esp
c01096bb:	c7 85 78 ff ff ff 01 	movl   $0x1,-0x88(%ebp)
c01096c2:	00 00 00 
c01096c5:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c01096cc:	83 ec 04             	sub    $0x4,%esp
c01096cf:	6a 01                	push   $0x1
c01096d1:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01096d7:	50                   	push   %eax
c01096d8:	6a 03                	push   $0x3
c01096da:	e8 36 fe ff ff       	call   c0109515 <send_rec>
c01096df:	83 c4 10             	add    $0x10,%esp
c01096e2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01096e5:	8b 85 7c ff ff ff    	mov    -0x84(%ebp),%eax
c01096eb:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01096ee:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01096f1:	c9                   	leave  
c01096f2:	c3                   	ret    

c01096f3 <itoa>:
c01096f3:	55                   	push   %ebp
c01096f4:	89 e5                	mov    %esp,%ebp
c01096f6:	53                   	push   %ebx
c01096f7:	83 ec 14             	sub    $0x14,%esp
c01096fa:	8b 45 08             	mov    0x8(%ebp),%eax
c01096fd:	99                   	cltd   
c01096fe:	f7 7d 10             	idivl  0x10(%ebp)
c0109701:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0109704:	8b 45 08             	mov    0x8(%ebp),%eax
c0109707:	99                   	cltd   
c0109708:	f7 7d 10             	idivl  0x10(%ebp)
c010970b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010970e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0109712:	74 14                	je     c0109728 <itoa+0x35>
c0109714:	83 ec 04             	sub    $0x4,%esp
c0109717:	ff 75 10             	pushl  0x10(%ebp)
c010971a:	ff 75 0c             	pushl  0xc(%ebp)
c010971d:	ff 75 f0             	pushl  -0x10(%ebp)
c0109720:	e8 ce ff ff ff       	call   c01096f3 <itoa>
c0109725:	83 c4 10             	add    $0x10,%esp
c0109728:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010972b:	8d 58 30             	lea    0x30(%eax),%ebx
c010972e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0109731:	8b 00                	mov    (%eax),%eax
c0109733:	8d 48 01             	lea    0x1(%eax),%ecx
c0109736:	8b 55 0c             	mov    0xc(%ebp),%edx
c0109739:	89 0a                	mov    %ecx,(%edx)
c010973b:	89 da                	mov    %ebx,%edx
c010973d:	88 10                	mov    %dl,(%eax)
c010973f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0109742:	8b 00                	mov    (%eax),%eax
c0109744:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0109747:	c9                   	leave  
c0109748:	c3                   	ret    

c0109749 <i2a>:
c0109749:	55                   	push   %ebp
c010974a:	89 e5                	mov    %esp,%ebp
c010974c:	53                   	push   %ebx
c010974d:	83 ec 14             	sub    $0x14,%esp
c0109750:	8b 45 08             	mov    0x8(%ebp),%eax
c0109753:	99                   	cltd   
c0109754:	f7 7d 0c             	idivl  0xc(%ebp)
c0109757:	89 55 f4             	mov    %edx,-0xc(%ebp)
c010975a:	8b 45 08             	mov    0x8(%ebp),%eax
c010975d:	99                   	cltd   
c010975e:	f7 7d 0c             	idivl  0xc(%ebp)
c0109761:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109764:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0109768:	74 14                	je     c010977e <i2a+0x35>
c010976a:	83 ec 04             	sub    $0x4,%esp
c010976d:	ff 75 10             	pushl  0x10(%ebp)
c0109770:	ff 75 0c             	pushl  0xc(%ebp)
c0109773:	ff 75 f0             	pushl  -0x10(%ebp)
c0109776:	e8 ce ff ff ff       	call   c0109749 <i2a>
c010977b:	83 c4 10             	add    $0x10,%esp
c010977e:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c0109782:	7f 0a                	jg     c010978e <i2a+0x45>
c0109784:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109787:	83 c0 30             	add    $0x30,%eax
c010978a:	89 c3                	mov    %eax,%ebx
c010978c:	eb 08                	jmp    c0109796 <i2a+0x4d>
c010978e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109791:	83 c0 37             	add    $0x37,%eax
c0109794:	89 c3                	mov    %eax,%ebx
c0109796:	8b 45 10             	mov    0x10(%ebp),%eax
c0109799:	8b 00                	mov    (%eax),%eax
c010979b:	8d 48 01             	lea    0x1(%eax),%ecx
c010979e:	8b 55 10             	mov    0x10(%ebp),%edx
c01097a1:	89 0a                	mov    %ecx,(%edx)
c01097a3:	88 18                	mov    %bl,(%eax)
c01097a5:	8b 45 10             	mov    0x10(%ebp),%eax
c01097a8:	8b 00                	mov    (%eax),%eax
c01097aa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01097ad:	c9                   	leave  
c01097ae:	c3                   	ret    

c01097af <inform_int>:
c01097af:	55                   	push   %ebp
c01097b0:	89 e5                	mov    %esp,%ebp
c01097b2:	83 ec 18             	sub    $0x18,%esp
c01097b5:	83 ec 0c             	sub    $0xc,%esp
c01097b8:	ff 75 08             	pushl  0x8(%ebp)
c01097bb:	e8 16 a0 ff ff       	call   c01037d6 <pid2proc>
c01097c0:	83 c4 10             	add    $0x10,%esp
c01097c3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01097c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01097c9:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01097d0:	0f be c0             	movsbl %al,%eax
c01097d3:	83 e0 02             	and    $0x2,%eax
c01097d6:	85 c0                	test   %eax,%eax
c01097d8:	0f 84 8e 00 00 00    	je     c010986c <inform_int+0xbd>
c01097de:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01097e1:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c01097e7:	3d 13 02 00 00       	cmp    $0x213,%eax
c01097ec:	74 0e                	je     c01097fc <inform_int+0x4d>
c01097ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01097f1:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c01097f7:	83 f8 12             	cmp    $0x12,%eax
c01097fa:	75 7d                	jne    c0109879 <inform_int+0xca>
c01097fc:	c7 45 f0 7c 00 00 00 	movl   $0x7c,-0x10(%ebp)
c0109803:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109806:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c010980c:	83 ec 08             	sub    $0x8,%esp
c010980f:	ff 75 f0             	pushl  -0x10(%ebp)
c0109812:	50                   	push   %eax
c0109813:	e8 07 c6 ff ff       	call   c0105e1f <alloc_virtual_memory>
c0109818:	83 c4 10             	add    $0x10,%esp
c010981b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010981e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109821:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c0109827:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010982a:	c7 40 78 d5 07 00 00 	movl   $0x7d5,0x78(%eax)
c0109831:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109834:	c7 80 54 02 00 00 00 	movl   $0x0,0x254(%eax)
c010983b:	00 00 00 
c010983e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109841:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c0109848:	00 00 00 
c010984b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0109852:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109855:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c010985c:	83 ec 0c             	sub    $0xc,%esp
c010985f:	ff 75 f4             	pushl  -0xc(%ebp)
c0109862:	e8 e5 fd ff ff       	call   c010964c <unblock>
c0109867:	83 c4 10             	add    $0x10,%esp
c010986a:	eb 0d                	jmp    c0109879 <inform_int+0xca>
c010986c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010986f:	c7 80 54 02 00 00 01 	movl   $0x1,0x254(%eax)
c0109876:	00 00 00 
c0109879:	90                   	nop
c010987a:	c9                   	leave  
c010987b:	c3                   	ret    

c010987c <strcmp>:
c010987c:	55                   	push   %ebp
c010987d:	89 e5                	mov    %esp,%ebp
c010987f:	83 ec 10             	sub    $0x10,%esp
c0109882:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0109886:	74 06                	je     c010988e <strcmp+0x12>
c0109888:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010988c:	75 08                	jne    c0109896 <strcmp+0x1a>
c010988e:	8b 45 08             	mov    0x8(%ebp),%eax
c0109891:	2b 45 0c             	sub    0xc(%ebp),%eax
c0109894:	eb 53                	jmp    c01098e9 <strcmp+0x6d>
c0109896:	8b 45 08             	mov    0x8(%ebp),%eax
c0109899:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010989c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010989f:	89 45 f8             	mov    %eax,-0x8(%ebp)
c01098a2:	eb 18                	jmp    c01098bc <strcmp+0x40>
c01098a4:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01098a7:	0f b6 10             	movzbl (%eax),%edx
c01098aa:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01098ad:	0f b6 00             	movzbl (%eax),%eax
c01098b0:	38 c2                	cmp    %al,%dl
c01098b2:	75 1e                	jne    c01098d2 <strcmp+0x56>
c01098b4:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c01098b8:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c01098bc:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01098bf:	0f b6 00             	movzbl (%eax),%eax
c01098c2:	84 c0                	test   %al,%al
c01098c4:	74 0d                	je     c01098d3 <strcmp+0x57>
c01098c6:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01098c9:	0f b6 00             	movzbl (%eax),%eax
c01098cc:	84 c0                	test   %al,%al
c01098ce:	75 d4                	jne    c01098a4 <strcmp+0x28>
c01098d0:	eb 01                	jmp    c01098d3 <strcmp+0x57>
c01098d2:	90                   	nop
c01098d3:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01098d6:	0f b6 00             	movzbl (%eax),%eax
c01098d9:	0f be d0             	movsbl %al,%edx
c01098dc:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01098df:	0f b6 00             	movzbl (%eax),%eax
c01098e2:	0f be c0             	movsbl %al,%eax
c01098e5:	29 c2                	sub    %eax,%edx
c01098e7:	89 d0                	mov    %edx,%eax
c01098e9:	c9                   	leave  
c01098ea:	c3                   	ret    

c01098eb <create_user_process_address_space>:
c01098eb:	55                   	push   %ebp
c01098ec:	89 e5                	mov    %esp,%ebp
c01098ee:	83 ec 18             	sub    $0x18,%esp
c01098f1:	83 ec 08             	sub    $0x8,%esp
c01098f4:	6a 00                	push   $0x0
c01098f6:	6a 01                	push   $0x1
c01098f8:	e8 5a c8 ff ff       	call   c0106157 <alloc_memory>
c01098fd:	83 c4 10             	add    $0x10,%esp
c0109900:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109903:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109906:	c7 40 08 00 80 04 08 	movl   $0x8048000,0x8(%eax)
c010990d:	c7 45 f0 00 80 fb b7 	movl   $0xb7fb8000,-0x10(%ebp)
c0109914:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109917:	05 ff 0f 00 00       	add    $0xfff,%eax
c010991c:	c1 e8 0c             	shr    $0xc,%eax
c010991f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109922:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109925:	83 c0 07             	add    $0x7,%eax
c0109928:	c1 e8 03             	shr    $0x3,%eax
c010992b:	89 c2                	mov    %eax,%edx
c010992d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109930:	89 50 04             	mov    %edx,0x4(%eax)
c0109933:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109936:	8b 40 04             	mov    0x4(%eax),%eax
c0109939:	05 ff 0f 00 00       	add    $0xfff,%eax
c010993e:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0109944:	85 c0                	test   %eax,%eax
c0109946:	0f 48 c2             	cmovs  %edx,%eax
c0109949:	c1 f8 0c             	sar    $0xc,%eax
c010994c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010994f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109952:	83 ec 08             	sub    $0x8,%esp
c0109955:	6a 00                	push   $0x0
c0109957:	50                   	push   %eax
c0109958:	e8 fa c7 ff ff       	call   c0106157 <alloc_memory>
c010995d:	83 c4 10             	add    $0x10,%esp
c0109960:	89 c2                	mov    %eax,%edx
c0109962:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109965:	89 10                	mov    %edx,(%eax)
c0109967:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010996a:	83 ec 0c             	sub    $0xc,%esp
c010996d:	50                   	push   %eax
c010996e:	e8 b6 bf ff ff       	call   c0105929 <init_bitmap>
c0109973:	83 c4 10             	add    $0x10,%esp
c0109976:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109979:	c9                   	leave  
c010997a:	c3                   	ret    

c010997b <user_process>:
c010997b:	55                   	push   %ebp
c010997c:	89 e5                	mov    %esp,%ebp
c010997e:	83 ec 38             	sub    $0x38,%esp
c0109981:	c7 45 f0 b2 0c 00 00 	movl   $0xcb2,-0x10(%ebp)
c0109988:	c7 45 ec ba 0c 00 00 	movl   $0xcba,-0x14(%ebp)
c010998f:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%ebp)
c0109996:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c010999a:	75 0e                	jne    c01099aa <user_process+0x2f>
c010999c:	66 c7 45 f6 48 00    	movw   $0x48,-0xa(%ebp)
c01099a2:	66 c7 45 f4 50 00    	movw   $0x50,-0xc(%ebp)
c01099a8:	eb 0c                	jmp    c01099b6 <user_process+0x3b>
c01099aa:	66 c7 45 f6 59 00    	movw   $0x59,-0xa(%ebp)
c01099b0:	66 c7 45 f4 61 00    	movw   $0x61,-0xc(%ebp)
c01099b6:	e8 31 6a ff ff       	call   c01003ec <get_running_thread_pcb>
c01099bb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01099be:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01099c1:	8b 55 14             	mov    0x14(%ebp),%edx
c01099c4:	89 90 18 01 00 00    	mov    %edx,0x118(%eax)
c01099ca:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01099cd:	8b 90 18 01 00 00    	mov    0x118(%eax),%edx
c01099d3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01099d6:	89 90 1c 01 00 00    	mov    %edx,0x11c(%eax)
c01099dc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01099df:	05 00 10 00 00       	add    $0x1000,%eax
c01099e4:	89 c2                	mov    %eax,%edx
c01099e6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01099e9:	89 10                	mov    %edx,(%eax)
c01099eb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01099ee:	8b 00                	mov    (%eax),%eax
c01099f0:	83 e8 44             	sub    $0x44,%eax
c01099f3:	89 c2                	mov    %eax,%edx
c01099f5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01099f8:	89 10                	mov    %edx,(%eax)
c01099fa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01099fd:	8b 00                	mov    (%eax),%eax
c01099ff:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109a02:	c6 45 df 00          	movb   $0x0,-0x21(%ebp)
c0109a06:	66 c7 45 dc 02 12    	movw   $0x1202,-0x24(%ebp)
c0109a0c:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0109a10:	66 89 45 da          	mov    %ax,-0x26(%ebp)
c0109a14:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0109a18:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
c0109a1c:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0109a20:	66 89 45 d6          	mov    %ax,-0x2a(%ebp)
c0109a24:	66 c7 45 d4 38 00    	movw   $0x38,-0x2c(%ebp)
c0109a2a:	0f b7 55 f4          	movzwl -0xc(%ebp),%edx
c0109a2e:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109a31:	89 50 34             	mov    %edx,0x34(%eax)
c0109a34:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c0109a38:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109a3b:	89 50 0c             	mov    %edx,0xc(%eax)
c0109a3e:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c0109a42:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109a45:	89 50 04             	mov    %edx,0x4(%eax)
c0109a48:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c0109a4c:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109a4f:	89 50 08             	mov    %edx,0x8(%eax)
c0109a52:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c0109a56:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109a59:	89 50 40             	mov    %edx,0x40(%eax)
c0109a5c:	0f b7 55 d4          	movzwl -0x2c(%ebp),%edx
c0109a60:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109a63:	89 10                	mov    %edx,(%eax)
c0109a65:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109a68:	8b 55 08             	mov    0x8(%ebp),%edx
c0109a6b:	89 50 30             	mov    %edx,0x30(%eax)
c0109a6e:	0f b7 55 dc          	movzwl -0x24(%ebp),%edx
c0109a72:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109a75:	89 50 38             	mov    %edx,0x38(%eax)
c0109a78:	83 ec 08             	sub    $0x8,%esp
c0109a7b:	6a 01                	push   $0x1
c0109a7d:	68 00 f0 ff bf       	push   $0xbffff000
c0109a82:	e8 08 c6 ff ff       	call   c010608f <alloc_physical_memory>
c0109a87:	83 c4 10             	add    $0x10,%esp
c0109a8a:	8d 90 00 10 00 00    	lea    0x1000(%eax),%edx
c0109a90:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109a93:	89 50 3c             	mov    %edx,0x3c(%eax)
c0109a96:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109a99:	83 ec 0c             	sub    $0xc,%esp
c0109a9c:	50                   	push   %eax
c0109a9d:	e8 1d 68 ff ff       	call   c01002bf <restart>
c0109aa2:	83 c4 10             	add    $0x10,%esp
c0109aa5:	90                   	nop
c0109aa6:	c9                   	leave  
c0109aa7:	c3                   	ret    

c0109aa8 <clone_pcb>:
c0109aa8:	55                   	push   %ebp
c0109aa9:	89 e5                	mov    %esp,%ebp
c0109aab:	83 ec 38             	sub    $0x38,%esp
c0109aae:	83 ec 08             	sub    $0x8,%esp
c0109ab1:	6a 00                	push   $0x0
c0109ab3:	6a 01                	push   $0x1
c0109ab5:	e8 9d c6 ff ff       	call   c0106157 <alloc_memory>
c0109aba:	83 c4 10             	add    $0x10,%esp
c0109abd:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109ac0:	83 ec 04             	sub    $0x4,%esp
c0109ac3:	68 00 10 00 00       	push   $0x1000
c0109ac8:	6a 00                	push   $0x0
c0109aca:	ff 75 f4             	pushl  -0xc(%ebp)
c0109acd:	e8 fd 26 00 00       	call   c010c1cf <Memset>
c0109ad2:	83 c4 10             	add    $0x10,%esp
c0109ad5:	83 ec 04             	sub    $0x4,%esp
c0109ad8:	68 00 10 00 00       	push   $0x1000
c0109add:	ff 75 08             	pushl  0x8(%ebp)
c0109ae0:	ff 75 f4             	pushl  -0xc(%ebp)
c0109ae3:	e8 a4 d1 ff ff       	call   c0106c8c <Memcpy>
c0109ae8:	83 c4 10             	add    $0x10,%esp
c0109aeb:	a1 c4 06 11 c0       	mov    0xc01106c4,%eax
c0109af0:	8d 50 01             	lea    0x1(%eax),%edx
c0109af3:	89 15 c4 06 11 c0    	mov    %edx,0xc01106c4
c0109af9:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0109afc:	89 82 14 01 00 00    	mov    %eax,0x114(%edx)
c0109b02:	8b 45 08             	mov    0x8(%ebp),%eax
c0109b05:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c0109b0b:	89 c2                	mov    %eax,%edx
c0109b0d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109b10:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c0109b16:	83 ec 08             	sub    $0x8,%esp
c0109b19:	6a 00                	push   $0x0
c0109b1b:	6a 01                	push   $0x1
c0109b1d:	e8 35 c6 ff ff       	call   c0106157 <alloc_memory>
c0109b22:	83 c4 10             	add    $0x10,%esp
c0109b25:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109b28:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109b2b:	05 00 0c 00 00       	add    $0xc00,%eax
c0109b30:	83 ec 04             	sub    $0x4,%esp
c0109b33:	68 00 04 00 00       	push   $0x400
c0109b38:	68 00 fc ff ff       	push   $0xfffffc00
c0109b3d:	50                   	push   %eax
c0109b3e:	e8 49 d1 ff ff       	call   c0106c8c <Memcpy>
c0109b43:	83 c4 10             	add    $0x10,%esp
c0109b46:	83 ec 0c             	sub    $0xc,%esp
c0109b49:	ff 75 f0             	pushl  -0x10(%ebp)
c0109b4c:	e8 1d c4 ff ff       	call   c0105f6e <get_physical_address>
c0109b51:	83 c4 10             	add    $0x10,%esp
c0109b54:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109b57:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109b5a:	05 fc 0f 00 00       	add    $0xffc,%eax
c0109b5f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0109b62:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109b65:	83 c8 07             	or     $0x7,%eax
c0109b68:	89 c2                	mov    %eax,%edx
c0109b6a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109b6d:	89 10                	mov    %edx,(%eax)
c0109b6f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109b72:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0109b75:	89 50 08             	mov    %edx,0x8(%eax)
c0109b78:	e8 6e fd ff ff       	call   c01098eb <create_user_process_address_space>
c0109b7d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109b80:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0109b83:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109b86:	89 50 0c             	mov    %edx,0xc(%eax)
c0109b89:	8b 45 08             	mov    0x8(%ebp),%eax
c0109b8c:	8b 40 0c             	mov    0xc(%eax),%eax
c0109b8f:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109b92:	83 ec 04             	sub    $0x4,%esp
c0109b95:	6a 0c                	push   $0xc
c0109b97:	ff 75 e0             	pushl  -0x20(%ebp)
c0109b9a:	ff 75 e4             	pushl  -0x1c(%ebp)
c0109b9d:	e8 ea d0 ff ff       	call   c0106c8c <Memcpy>
c0109ba2:	83 c4 10             	add    $0x10,%esp
c0109ba5:	c7 45 dc 00 80 fb b7 	movl   $0xb7fb8000,-0x24(%ebp)
c0109bac:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0109baf:	05 ff 0f 00 00       	add    $0xfff,%eax
c0109bb4:	c1 e8 0c             	shr    $0xc,%eax
c0109bb7:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0109bba:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109bbd:	83 c0 07             	add    $0x7,%eax
c0109bc0:	c1 e8 03             	shr    $0x3,%eax
c0109bc3:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0109bc6:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0109bc9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0109bcc:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0109bcf:	05 ff 0f 00 00       	add    $0xfff,%eax
c0109bd4:	c1 e8 0c             	shr    $0xc,%eax
c0109bd7:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0109bda:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0109bdd:	83 ec 08             	sub    $0x8,%esp
c0109be0:	6a 00                	push   $0x0
c0109be2:	50                   	push   %eax
c0109be3:	e8 6f c5 ff ff       	call   c0106157 <alloc_memory>
c0109be8:	83 c4 10             	add    $0x10,%esp
c0109beb:	89 c2                	mov    %eax,%edx
c0109bed:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109bf0:	89 10                	mov    %edx,(%eax)
c0109bf2:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0109bf5:	c1 e0 0c             	shl    $0xc,%eax
c0109bf8:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0109bfb:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109bfe:	8b 10                	mov    (%eax),%edx
c0109c00:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109c03:	8b 00                	mov    (%eax),%eax
c0109c05:	83 ec 04             	sub    $0x4,%esp
c0109c08:	ff 75 cc             	pushl  -0x34(%ebp)
c0109c0b:	52                   	push   %edx
c0109c0c:	50                   	push   %eax
c0109c0d:	e8 7a d0 ff ff       	call   c0106c8c <Memcpy>
c0109c12:	83 c4 10             	add    $0x10,%esp
c0109c15:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109c18:	c9                   	leave  
c0109c19:	c3                   	ret    

c0109c1a <build_body_stack>:
c0109c1a:	55                   	push   %ebp
c0109c1b:	89 e5                	mov    %esp,%ebp
c0109c1d:	83 ec 48             	sub    $0x48,%esp
c0109c20:	8b 45 08             	mov    0x8(%ebp),%eax
c0109c23:	8b 40 0c             	mov    0xc(%eax),%eax
c0109c26:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109c29:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109c2c:	8b 50 04             	mov    0x4(%eax),%edx
c0109c2f:	8b 00                	mov    (%eax),%eax
c0109c31:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0109c34:	89 55 c8             	mov    %edx,-0x38(%ebp)
c0109c37:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0109c3a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109c3d:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0109c40:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0109c43:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109c46:	8b 40 08             	mov    0x8(%eax),%eax
c0109c49:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0109c4c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0109c53:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0109c5a:	e8 c9 cf ff ff       	call   c0106c28 <intr_disable>
c0109c5f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0109c62:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0109c69:	e9 c2 00 00 00       	jmp    c0109d30 <build_body_stack+0x116>
c0109c6e:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0109c71:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109c74:	01 d0                	add    %edx,%eax
c0109c76:	0f b6 00             	movzbl (%eax),%eax
c0109c79:	88 45 d3             	mov    %al,-0x2d(%ebp)
c0109c7c:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0109c83:	e9 9a 00 00 00       	jmp    c0109d22 <build_body_stack+0x108>
c0109c88:	0f be 55 d3          	movsbl -0x2d(%ebp),%edx
c0109c8c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109c8f:	89 c1                	mov    %eax,%ecx
c0109c91:	d3 fa                	sar    %cl,%edx
c0109c93:	89 d0                	mov    %edx,%eax
c0109c95:	83 e0 01             	and    $0x1,%eax
c0109c98:	85 c0                	test   %eax,%eax
c0109c9a:	75 06                	jne    c0109ca2 <build_body_stack+0x88>
c0109c9c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0109ca0:	eb 7c                	jmp    c0109d1e <build_body_stack+0x104>
c0109ca2:	8b 45 08             	mov    0x8(%ebp),%eax
c0109ca5:	8b 40 08             	mov    0x8(%eax),%eax
c0109ca8:	83 ec 0c             	sub    $0xc,%esp
c0109cab:	50                   	push   %eax
c0109cac:	e8 1f 67 ff ff       	call   c01003d0 <update_cr3>
c0109cb1:	83 c4 10             	add    $0x10,%esp
c0109cb4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109cb7:	c1 e0 0c             	shl    $0xc,%eax
c0109cba:	89 c2                	mov    %eax,%edx
c0109cbc:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109cbf:	01 d0                	add    %edx,%eax
c0109cc1:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0109cc4:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0109cc7:	8b 45 10             	mov    0x10(%ebp),%eax
c0109cca:	83 ec 04             	sub    $0x4,%esp
c0109ccd:	68 00 10 00 00       	push   $0x1000
c0109cd2:	52                   	push   %edx
c0109cd3:	50                   	push   %eax
c0109cd4:	e8 b3 cf ff ff       	call   c0106c8c <Memcpy>
c0109cd9:	83 c4 10             	add    $0x10,%esp
c0109cdc:	8b 45 0c             	mov    0xc(%ebp),%eax
c0109cdf:	8b 40 08             	mov    0x8(%eax),%eax
c0109ce2:	83 ec 0c             	sub    $0xc,%esp
c0109ce5:	50                   	push   %eax
c0109ce6:	e8 e5 66 ff ff       	call   c01003d0 <update_cr3>
c0109ceb:	83 c4 10             	add    $0x10,%esp
c0109cee:	83 ec 08             	sub    $0x8,%esp
c0109cf1:	ff 75 cc             	pushl  -0x34(%ebp)
c0109cf4:	6a 01                	push   $0x1
c0109cf6:	e8 be c4 ff ff       	call   c01061b9 <get_a_virtual_page>
c0109cfb:	83 c4 10             	add    $0x10,%esp
c0109cfe:	8b 55 10             	mov    0x10(%ebp),%edx
c0109d01:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0109d04:	83 ec 04             	sub    $0x4,%esp
c0109d07:	68 00 10 00 00       	push   $0x1000
c0109d0c:	52                   	push   %edx
c0109d0d:	50                   	push   %eax
c0109d0e:	e8 79 cf ff ff       	call   c0106c8c <Memcpy>
c0109d13:	83 c4 10             	add    $0x10,%esp
c0109d16:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0109d1a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0109d1e:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0109d22:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0109d26:	0f 8e 5c ff ff ff    	jle    c0109c88 <build_body_stack+0x6e>
c0109d2c:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0109d30:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109d33:	39 45 dc             	cmp    %eax,-0x24(%ebp)
c0109d36:	0f 87 32 ff ff ff    	ja     c0109c6e <build_body_stack+0x54>
c0109d3c:	83 ec 0c             	sub    $0xc,%esp
c0109d3f:	ff 75 d4             	pushl  -0x2c(%ebp)
c0109d42:	e8 0a cf ff ff       	call   c0106c51 <intr_set_status>
c0109d47:	83 c4 10             	add    $0x10,%esp
c0109d4a:	90                   	nop
c0109d4b:	c9                   	leave  
c0109d4c:	c3                   	ret    

c0109d4d <build_process_kernel_stack>:
c0109d4d:	55                   	push   %ebp
c0109d4e:	89 e5                	mov    %esp,%ebp
c0109d50:	83 ec 28             	sub    $0x28,%esp
c0109d53:	e8 d0 ce ff ff       	call   c0106c28 <intr_disable>
c0109d58:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109d5b:	8b 45 08             	mov    0x8(%ebp),%eax
c0109d5e:	05 00 10 00 00       	add    $0x1000,%eax
c0109d63:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109d66:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109d69:	8b 00                	mov    (%eax),%eax
c0109d6b:	83 f8 38             	cmp    $0x38,%eax
c0109d6e:	74 06                	je     c0109d76 <build_process_kernel_stack+0x29>
c0109d70:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c0109d74:	eb f0                	jmp    c0109d66 <build_process_kernel_stack+0x19>
c0109d76:	90                   	nop
c0109d77:	8b 45 08             	mov    0x8(%ebp),%eax
c0109d7a:	05 00 10 00 00       	add    $0x1000,%eax
c0109d7f:	89 c2                	mov    %eax,%edx
c0109d81:	8b 45 08             	mov    0x8(%ebp),%eax
c0109d84:	89 50 04             	mov    %edx,0x4(%eax)
c0109d87:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109d8a:	83 c0 2c             	add    $0x2c,%eax
c0109d8d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109d90:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109d93:	83 e8 04             	sub    $0x4,%eax
c0109d96:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0109d99:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109d9c:	83 e8 08             	sub    $0x8,%eax
c0109d9f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109da2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109da5:	83 e8 0c             	sub    $0xc,%eax
c0109da8:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109dab:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109dae:	83 e8 10             	sub    $0x10,%eax
c0109db1:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0109db4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109db7:	83 e8 14             	sub    $0x14,%eax
c0109dba:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0109dbd:	ba b0 02 10 c0       	mov    $0xc01002b0,%edx
c0109dc2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109dc5:	89 10                	mov    %edx,(%eax)
c0109dc7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109dca:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0109dd0:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109dd3:	8b 10                	mov    (%eax),%edx
c0109dd5:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0109dd8:	89 10                	mov    %edx,(%eax)
c0109dda:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0109ddd:	8b 10                	mov    (%eax),%edx
c0109ddf:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109de2:	89 10                	mov    %edx,(%eax)
c0109de4:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109de7:	8b 10                	mov    (%eax),%edx
c0109de9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109dec:	89 10                	mov    %edx,(%eax)
c0109dee:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109df1:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0109df7:	8b 45 08             	mov    0x8(%ebp),%eax
c0109dfa:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0109dfd:	89 10                	mov    %edx,(%eax)
c0109dff:	83 ec 0c             	sub    $0xc,%esp
c0109e02:	ff 75 f0             	pushl  -0x10(%ebp)
c0109e05:	e8 47 ce ff ff       	call   c0106c51 <intr_set_status>
c0109e0a:	83 c4 10             	add    $0x10,%esp
c0109e0d:	90                   	nop
c0109e0e:	c9                   	leave  
c0109e0f:	c3                   	ret    

c0109e10 <fork_process>:
c0109e10:	55                   	push   %ebp
c0109e11:	89 e5                	mov    %esp,%ebp
c0109e13:	83 ec 18             	sub    $0x18,%esp
c0109e16:	8b 45 08             	mov    0x8(%ebp),%eax
c0109e19:	83 ec 0c             	sub    $0xc,%esp
c0109e1c:	50                   	push   %eax
c0109e1d:	e8 b4 99 ff ff       	call   c01037d6 <pid2proc>
c0109e22:	83 c4 10             	add    $0x10,%esp
c0109e25:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109e28:	83 ec 0c             	sub    $0xc,%esp
c0109e2b:	ff 75 f4             	pushl  -0xc(%ebp)
c0109e2e:	e8 75 fc ff ff       	call   c0109aa8 <clone_pcb>
c0109e33:	83 c4 10             	add    $0x10,%esp
c0109e36:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109e39:	83 ec 08             	sub    $0x8,%esp
c0109e3c:	6a 00                	push   $0x0
c0109e3e:	6a 01                	push   $0x1
c0109e40:	e8 12 c3 ff ff       	call   c0106157 <alloc_memory>
c0109e45:	83 c4 10             	add    $0x10,%esp
c0109e48:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109e4b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109e4e:	83 ec 04             	sub    $0x4,%esp
c0109e51:	68 00 10 00 00       	push   $0x1000
c0109e56:	6a 00                	push   $0x0
c0109e58:	50                   	push   %eax
c0109e59:	e8 71 23 00 00       	call   c010c1cf <Memset>
c0109e5e:	83 c4 10             	add    $0x10,%esp
c0109e61:	83 ec 04             	sub    $0x4,%esp
c0109e64:	ff 75 ec             	pushl  -0x14(%ebp)
c0109e67:	ff 75 f0             	pushl  -0x10(%ebp)
c0109e6a:	ff 75 f4             	pushl  -0xc(%ebp)
c0109e6d:	e8 a8 fd ff ff       	call   c0109c1a <build_body_stack>
c0109e72:	83 c4 10             	add    $0x10,%esp
c0109e75:	83 ec 0c             	sub    $0xc,%esp
c0109e78:	ff 75 f0             	pushl  -0x10(%ebp)
c0109e7b:	e8 cd fe ff ff       	call   c0109d4d <build_process_kernel_stack>
c0109e80:	83 c4 10             	add    $0x10,%esp
c0109e83:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109e86:	05 6a 02 00 00       	add    $0x26a,%eax
c0109e8b:	83 ec 08             	sub    $0x8,%esp
c0109e8e:	50                   	push   %eax
c0109e8f:	68 04 0f 11 c0       	push   $0xc0110f04
c0109e94:	e8 c7 02 00 00       	call   c010a160 <appendToDoubleLinkList>
c0109e99:	83 c4 10             	add    $0x10,%esp
c0109e9c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109e9f:	c9                   	leave  
c0109ea0:	c3                   	ret    

c0109ea1 <process_execute>:
c0109ea1:	55                   	push   %ebp
c0109ea2:	89 e5                	mov    %esp,%ebp
c0109ea4:	83 ec 28             	sub    $0x28,%esp
c0109ea7:	e8 ca 04 00 00       	call   c010a376 <thread_init>
c0109eac:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109eaf:	83 ec 0c             	sub    $0xc,%esp
c0109eb2:	ff 75 f4             	pushl  -0xc(%ebp)
c0109eb5:	e8 69 05 00 00       	call   c010a423 <thread_create>
c0109eba:	83 c4 10             	add    $0x10,%esp
c0109ebd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109ec0:	05 28 01 00 00       	add    $0x128,%eax
c0109ec5:	83 ec 08             	sub    $0x8,%esp
c0109ec8:	ff 75 10             	pushl  0x10(%ebp)
c0109ecb:	50                   	push   %eax
c0109ecc:	e8 1d 23 00 00       	call   c010c1ee <Strcpy>
c0109ed1:	83 c4 10             	add    $0x10,%esp
c0109ed4:	83 ec 08             	sub    $0x8,%esp
c0109ed7:	6a 00                	push   $0x0
c0109ed9:	6a 01                	push   $0x1
c0109edb:	e8 77 c2 ff ff       	call   c0106157 <alloc_memory>
c0109ee0:	83 c4 10             	add    $0x10,%esp
c0109ee3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109ee6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109ee9:	05 00 0c 00 00       	add    $0xc00,%eax
c0109eee:	83 ec 04             	sub    $0x4,%esp
c0109ef1:	68 00 04 00 00       	push   $0x400
c0109ef6:	68 00 fc ff ff       	push   $0xfffffc00
c0109efb:	50                   	push   %eax
c0109efc:	e8 8b cd ff ff       	call   c0106c8c <Memcpy>
c0109f01:	83 c4 10             	add    $0x10,%esp
c0109f04:	83 ec 0c             	sub    $0xc,%esp
c0109f07:	ff 75 f0             	pushl  -0x10(%ebp)
c0109f0a:	e8 5f c0 ff ff       	call   c0105f6e <get_physical_address>
c0109f0f:	83 c4 10             	add    $0x10,%esp
c0109f12:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109f15:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109f18:	05 fc 0f 00 00       	add    $0xffc,%eax
c0109f1d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0109f20:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109f23:	83 c8 07             	or     $0x7,%eax
c0109f26:	89 c2                	mov    %eax,%edx
c0109f28:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109f2b:	89 10                	mov    %edx,(%eax)
c0109f2d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109f30:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0109f33:	89 50 08             	mov    %edx,0x8(%eax)
c0109f36:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109f39:	83 c0 10             	add    $0x10,%eax
c0109f3c:	83 ec 0c             	sub    $0xc,%esp
c0109f3f:	50                   	push   %eax
c0109f40:	e8 c8 c7 ff ff       	call   c010670d <init_memory_block_desc>
c0109f45:	83 c4 10             	add    $0x10,%esp
c0109f48:	e8 9e f9 ff ff       	call   c01098eb <create_user_process_address_space>
c0109f4d:	89 c2                	mov    %eax,%edx
c0109f4f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109f52:	89 50 0c             	mov    %edx,0xc(%eax)
c0109f55:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109f58:	8b 00                	mov    (%eax),%eax
c0109f5a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109f5d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109f60:	c7 40 10 7b 99 10 c0 	movl   $0xc010997b,0x10(%eax)
c0109f67:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109f6a:	8b 55 08             	mov    0x8(%ebp),%edx
c0109f6d:	89 50 18             	mov    %edx,0x18(%eax)
c0109f70:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109f73:	8b 55 0c             	mov    0xc(%ebp),%edx
c0109f76:	89 50 1c             	mov    %edx,0x1c(%eax)
c0109f79:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109f7c:	8b 55 14             	mov    0x14(%ebp),%edx
c0109f7f:	89 50 20             	mov    %edx,0x20(%eax)
c0109f82:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109f85:	8b 55 18             	mov    0x18(%ebp),%edx
c0109f88:	89 50 24             	mov    %edx,0x24(%eax)
c0109f8b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0109f8e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109f91:	89 50 28             	mov    %edx,0x28(%eax)
c0109f94:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109f97:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0109f9d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109fa0:	8b 10                	mov    (%eax),%edx
c0109fa2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109fa5:	89 50 04             	mov    %edx,0x4(%eax)
c0109fa8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109fab:	8b 50 04             	mov    0x4(%eax),%edx
c0109fae:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109fb1:	89 50 08             	mov    %edx,0x8(%eax)
c0109fb4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109fb7:	8b 50 08             	mov    0x8(%eax),%edx
c0109fba:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109fbd:	89 50 0c             	mov    %edx,0xc(%eax)
c0109fc0:	83 ec 0c             	sub    $0xc,%esp
c0109fc3:	68 ec fd 10 c0       	push   $0xc010fdec
c0109fc8:	e8 96 00 00 00       	call   c010a063 <isListEmpty>
c0109fcd:	83 c4 10             	add    $0x10,%esp
c0109fd0:	e8 53 cc ff ff       	call   c0106c28 <intr_disable>
c0109fd5:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109fd8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109fdb:	05 60 02 00 00       	add    $0x260,%eax
c0109fe0:	83 ec 08             	sub    $0x8,%esp
c0109fe3:	50                   	push   %eax
c0109fe4:	68 ec fd 10 c0       	push   $0xc010fdec
c0109fe9:	e8 72 01 00 00       	call   c010a160 <appendToDoubleLinkList>
c0109fee:	83 c4 10             	add    $0x10,%esp
c0109ff1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109ff4:	05 6a 02 00 00       	add    $0x26a,%eax
c0109ff9:	83 ec 08             	sub    $0x8,%esp
c0109ffc:	50                   	push   %eax
c0109ffd:	68 04 0f 11 c0       	push   $0xc0110f04
c010a002:	e8 59 01 00 00       	call   c010a160 <appendToDoubleLinkList>
c010a007:	83 c4 10             	add    $0x10,%esp
c010a00a:	83 ec 0c             	sub    $0xc,%esp
c010a00d:	ff 75 e0             	pushl  -0x20(%ebp)
c010a010:	e8 3c cc ff ff       	call   c0106c51 <intr_set_status>
c010a015:	83 c4 10             	add    $0x10,%esp
c010a018:	90                   	nop
c010a019:	c9                   	leave  
c010a01a:	c3                   	ret    
c010a01b:	66 90                	xchg   %ax,%ax
c010a01d:	66 90                	xchg   %ax,%ax
c010a01f:	90                   	nop

c010a020 <switch_to>:
c010a020:	56                   	push   %esi
c010a021:	57                   	push   %edi
c010a022:	53                   	push   %ebx
c010a023:	55                   	push   %ebp
c010a024:	89 e5                	mov    %esp,%ebp
c010a026:	8b 45 14             	mov    0x14(%ebp),%eax
c010a029:	89 20                	mov    %esp,(%eax)
c010a02b:	8b 45 18             	mov    0x18(%ebp),%eax
c010a02e:	8b 20                	mov    (%eax),%esp
c010a030:	5d                   	pop    %ebp
c010a031:	5b                   	pop    %ebx
c010a032:	5f                   	pop    %edi
c010a033:	5e                   	pop    %esi
c010a034:	c3                   	ret    

c010a035 <initDoubleLinkList>:
c010a035:	55                   	push   %ebp
c010a036:	89 e5                	mov    %esp,%ebp
c010a038:	8b 45 08             	mov    0x8(%ebp),%eax
c010a03b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010a041:	8b 45 08             	mov    0x8(%ebp),%eax
c010a044:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c010a04b:	8b 45 08             	mov    0x8(%ebp),%eax
c010a04e:	8d 50 08             	lea    0x8(%eax),%edx
c010a051:	8b 45 08             	mov    0x8(%ebp),%eax
c010a054:	89 50 04             	mov    %edx,0x4(%eax)
c010a057:	8b 55 08             	mov    0x8(%ebp),%edx
c010a05a:	8b 45 08             	mov    0x8(%ebp),%eax
c010a05d:	89 50 08             	mov    %edx,0x8(%eax)
c010a060:	90                   	nop
c010a061:	5d                   	pop    %ebp
c010a062:	c3                   	ret    

c010a063 <isListEmpty>:
c010a063:	55                   	push   %ebp
c010a064:	89 e5                	mov    %esp,%ebp
c010a066:	8b 45 08             	mov    0x8(%ebp),%eax
c010a069:	8b 40 04             	mov    0x4(%eax),%eax
c010a06c:	8b 55 08             	mov    0x8(%ebp),%edx
c010a06f:	83 c2 08             	add    $0x8,%edx
c010a072:	39 d0                	cmp    %edx,%eax
c010a074:	75 07                	jne    c010a07d <isListEmpty+0x1a>
c010a076:	b8 01 00 00 00       	mov    $0x1,%eax
c010a07b:	eb 05                	jmp    c010a082 <isListEmpty+0x1f>
c010a07d:	b8 00 00 00 00       	mov    $0x0,%eax
c010a082:	5d                   	pop    %ebp
c010a083:	c3                   	ret    

c010a084 <findElementInList>:
c010a084:	55                   	push   %ebp
c010a085:	89 e5                	mov    %esp,%ebp
c010a087:	83 ec 28             	sub    $0x28,%esp
c010a08a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c010a08e:	75 19                	jne    c010a0a9 <findElementInList+0x25>
c010a090:	6a 60                	push   $0x60
c010a092:	68 75 c1 10 c0       	push   $0xc010c175
c010a097:	68 75 c1 10 c0       	push   $0xc010c175
c010a09c:	68 88 c1 10 c0       	push   $0xc010c188
c010a0a1:	e8 ff e7 ff ff       	call   c01088a5 <assertion_failure>
c010a0a6:	83 c4 10             	add    $0x10,%esp
c010a0a9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010a0ad:	75 19                	jne    c010a0c8 <findElementInList+0x44>
c010a0af:	6a 61                	push   $0x61
c010a0b1:	68 75 c1 10 c0       	push   $0xc010c175
c010a0b6:	68 75 c1 10 c0       	push   $0xc010c175
c010a0bb:	68 94 c1 10 c0       	push   $0xc010c194
c010a0c0:	e8 e0 e7 ff ff       	call   c01088a5 <assertion_failure>
c010a0c5:	83 c4 10             	add    $0x10,%esp
c010a0c8:	e8 5b cb ff ff       	call   c0106c28 <intr_disable>
c010a0cd:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010a0d0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010a0d7:	8b 45 08             	mov    0x8(%ebp),%eax
c010a0da:	8b 40 08             	mov    0x8(%eax),%eax
c010a0dd:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010a0e0:	8b 45 08             	mov    0x8(%ebp),%eax
c010a0e3:	8b 40 04             	mov    0x4(%eax),%eax
c010a0e6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a0e9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010a0ed:	75 07                	jne    c010a0f6 <findElementInList+0x72>
c010a0ef:	b8 00 00 00 00       	mov    $0x0,%eax
c010a0f4:	eb 68                	jmp    c010a15e <findElementInList+0xda>
c010a0f6:	8b 45 0c             	mov    0xc(%ebp),%eax
c010a0f9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010a0fc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010a0ff:	2b 45 f0             	sub    -0x10(%ebp),%eax
c010a102:	c1 f8 03             	sar    $0x3,%eax
c010a105:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010a108:	eb 36                	jmp    c010a140 <findElementInList+0xbc>
c010a10a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a10d:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c010a110:	75 07                	jne    c010a119 <findElementInList+0x95>
c010a112:	b8 01 00 00 00       	mov    $0x1,%eax
c010a117:	eb 45                	jmp    c010a15e <findElementInList+0xda>
c010a119:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010a11d:	75 07                	jne    c010a126 <findElementInList+0xa2>
c010a11f:	b8 00 00 00 00       	mov    $0x0,%eax
c010a124:	eb 38                	jmp    c010a15e <findElementInList+0xda>
c010a126:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a129:	8b 40 04             	mov    0x4(%eax),%eax
c010a12c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a12f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010a133:	75 07                	jne    c010a13c <findElementInList+0xb8>
c010a135:	b8 00 00 00 00       	mov    $0x0,%eax
c010a13a:	eb 22                	jmp    c010a15e <findElementInList+0xda>
c010a13c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c010a140:	8b 45 08             	mov    0x8(%ebp),%eax
c010a143:	83 c0 08             	add    $0x8,%eax
c010a146:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c010a149:	75 bf                	jne    c010a10a <findElementInList+0x86>
c010a14b:	83 ec 0c             	sub    $0xc,%esp
c010a14e:	ff 75 ec             	pushl  -0x14(%ebp)
c010a151:	e8 fb ca ff ff       	call   c0106c51 <intr_set_status>
c010a156:	83 c4 10             	add    $0x10,%esp
c010a159:	b8 00 00 00 00       	mov    $0x0,%eax
c010a15e:	c9                   	leave  
c010a15f:	c3                   	ret    

c010a160 <appendToDoubleLinkList>:
c010a160:	55                   	push   %ebp
c010a161:	89 e5                	mov    %esp,%ebp
c010a163:	83 ec 18             	sub    $0x18,%esp
c010a166:	83 ec 08             	sub    $0x8,%esp
c010a169:	ff 75 0c             	pushl  0xc(%ebp)
c010a16c:	ff 75 08             	pushl  0x8(%ebp)
c010a16f:	e8 10 ff ff ff       	call   c010a084 <findElementInList>
c010a174:	83 c4 10             	add    $0x10,%esp
c010a177:	3c 01                	cmp    $0x1,%al
c010a179:	0f 84 c2 00 00 00    	je     c010a241 <appendToDoubleLinkList+0xe1>
c010a17f:	e8 a4 ca ff ff       	call   c0106c28 <intr_disable>
c010a184:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a187:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c010a18b:	75 1c                	jne    c010a1a9 <appendToDoubleLinkList+0x49>
c010a18d:	68 9e 00 00 00       	push   $0x9e
c010a192:	68 75 c1 10 c0       	push   $0xc010c175
c010a197:	68 75 c1 10 c0       	push   $0xc010c175
c010a19c:	68 88 c1 10 c0       	push   $0xc010c188
c010a1a1:	e8 ff e6 ff ff       	call   c01088a5 <assertion_failure>
c010a1a6:	83 c4 10             	add    $0x10,%esp
c010a1a9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010a1ad:	75 1c                	jne    c010a1cb <appendToDoubleLinkList+0x6b>
c010a1af:	68 9f 00 00 00       	push   $0x9f
c010a1b4:	68 75 c1 10 c0       	push   $0xc010c175
c010a1b9:	68 75 c1 10 c0       	push   $0xc010c175
c010a1be:	68 94 c1 10 c0       	push   $0xc010c194
c010a1c3:	e8 dd e6 ff ff       	call   c01088a5 <assertion_failure>
c010a1c8:	83 c4 10             	add    $0x10,%esp
c010a1cb:	83 ec 08             	sub    $0x8,%esp
c010a1ce:	ff 75 0c             	pushl  0xc(%ebp)
c010a1d1:	ff 75 08             	pushl  0x8(%ebp)
c010a1d4:	e8 ab fe ff ff       	call   c010a084 <findElementInList>
c010a1d9:	83 c4 10             	add    $0x10,%esp
c010a1dc:	3c 01                	cmp    $0x1,%al
c010a1de:	74 64                	je     c010a244 <appendToDoubleLinkList+0xe4>
c010a1e0:	8b 45 0c             	mov    0xc(%ebp),%eax
c010a1e3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a1e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a1e9:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c010a1f0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a1f3:	8b 50 04             	mov    0x4(%eax),%edx
c010a1f6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a1f9:	89 10                	mov    %edx,(%eax)
c010a1fb:	8b 45 08             	mov    0x8(%ebp),%eax
c010a1fe:	8b 50 08             	mov    0x8(%eax),%edx
c010a201:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a204:	89 10                	mov    %edx,(%eax)
c010a206:	8b 45 08             	mov    0x8(%ebp),%eax
c010a209:	8b 40 08             	mov    0x8(%eax),%eax
c010a20c:	85 c0                	test   %eax,%eax
c010a20e:	74 0c                	je     c010a21c <appendToDoubleLinkList+0xbc>
c010a210:	8b 45 08             	mov    0x8(%ebp),%eax
c010a213:	8b 40 08             	mov    0x8(%eax),%eax
c010a216:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010a219:	89 50 04             	mov    %edx,0x4(%eax)
c010a21c:	8b 45 08             	mov    0x8(%ebp),%eax
c010a21f:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010a222:	89 50 08             	mov    %edx,0x8(%eax)
c010a225:	8b 45 08             	mov    0x8(%ebp),%eax
c010a228:	8d 50 08             	lea    0x8(%eax),%edx
c010a22b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a22e:	89 50 04             	mov    %edx,0x4(%eax)
c010a231:	83 ec 0c             	sub    $0xc,%esp
c010a234:	ff 75 f4             	pushl  -0xc(%ebp)
c010a237:	e8 15 ca ff ff       	call   c0106c51 <intr_set_status>
c010a23c:	83 c4 10             	add    $0x10,%esp
c010a23f:	eb 04                	jmp    c010a245 <appendToDoubleLinkList+0xe5>
c010a241:	90                   	nop
c010a242:	eb 01                	jmp    c010a245 <appendToDoubleLinkList+0xe5>
c010a244:	90                   	nop
c010a245:	c9                   	leave  
c010a246:	c3                   	ret    

c010a247 <insertToDoubleLinkList>:
c010a247:	55                   	push   %ebp
c010a248:	89 e5                	mov    %esp,%ebp
c010a24a:	83 ec 18             	sub    $0x18,%esp
c010a24d:	83 ec 08             	sub    $0x8,%esp
c010a250:	ff 75 0c             	pushl  0xc(%ebp)
c010a253:	ff 75 08             	pushl  0x8(%ebp)
c010a256:	e8 29 fe ff ff       	call   c010a084 <findElementInList>
c010a25b:	83 c4 10             	add    $0x10,%esp
c010a25e:	3c 01                	cmp    $0x1,%al
c010a260:	74 65                	je     c010a2c7 <insertToDoubleLinkList+0x80>
c010a262:	e8 c1 c9 ff ff       	call   c0106c28 <intr_disable>
c010a267:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a26a:	8b 45 0c             	mov    0xc(%ebp),%eax
c010a26d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a270:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a273:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c010a27a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a27d:	8b 50 04             	mov    0x4(%eax),%edx
c010a280:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a283:	89 10                	mov    %edx,(%eax)
c010a285:	8b 45 08             	mov    0x8(%ebp),%eax
c010a288:	8b 50 04             	mov    0x4(%eax),%edx
c010a28b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a28e:	89 50 04             	mov    %edx,0x4(%eax)
c010a291:	8b 45 08             	mov    0x8(%ebp),%eax
c010a294:	8b 40 04             	mov    0x4(%eax),%eax
c010a297:	85 c0                	test   %eax,%eax
c010a299:	74 0b                	je     c010a2a6 <insertToDoubleLinkList+0x5f>
c010a29b:	8b 45 08             	mov    0x8(%ebp),%eax
c010a29e:	8b 40 04             	mov    0x4(%eax),%eax
c010a2a1:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010a2a4:	89 10                	mov    %edx,(%eax)
c010a2a6:	8b 45 08             	mov    0x8(%ebp),%eax
c010a2a9:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010a2ac:	89 50 04             	mov    %edx,0x4(%eax)
c010a2af:	8b 55 08             	mov    0x8(%ebp),%edx
c010a2b2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a2b5:	89 10                	mov    %edx,(%eax)
c010a2b7:	83 ec 0c             	sub    $0xc,%esp
c010a2ba:	ff 75 f4             	pushl  -0xc(%ebp)
c010a2bd:	e8 8f c9 ff ff       	call   c0106c51 <intr_set_status>
c010a2c2:	83 c4 10             	add    $0x10,%esp
c010a2c5:	eb 01                	jmp    c010a2c8 <insertToDoubleLinkList+0x81>
c010a2c7:	90                   	nop
c010a2c8:	c9                   	leave  
c010a2c9:	c3                   	ret    

c010a2ca <popFromDoubleLinkList>:
c010a2ca:	55                   	push   %ebp
c010a2cb:	89 e5                	mov    %esp,%ebp
c010a2cd:	83 ec 18             	sub    $0x18,%esp
c010a2d0:	e8 53 c9 ff ff       	call   c0106c28 <intr_disable>
c010a2d5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a2d8:	83 ec 0c             	sub    $0xc,%esp
c010a2db:	ff 75 08             	pushl  0x8(%ebp)
c010a2de:	e8 80 fd ff ff       	call   c010a063 <isListEmpty>
c010a2e3:	83 c4 10             	add    $0x10,%esp
c010a2e6:	3c 01                	cmp    $0x1,%al
c010a2e8:	75 07                	jne    c010a2f1 <popFromDoubleLinkList+0x27>
c010a2ea:	b8 00 00 00 00       	mov    $0x0,%eax
c010a2ef:	eb 6b                	jmp    c010a35c <popFromDoubleLinkList+0x92>
c010a2f1:	8b 45 08             	mov    0x8(%ebp),%eax
c010a2f4:	8b 40 08             	mov    0x8(%eax),%eax
c010a2f7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a2fa:	8b 45 08             	mov    0x8(%ebp),%eax
c010a2fd:	8b 40 08             	mov    0x8(%eax),%eax
c010a300:	85 c0                	test   %eax,%eax
c010a302:	75 07                	jne    c010a30b <popFromDoubleLinkList+0x41>
c010a304:	b8 00 00 00 00       	mov    $0x0,%eax
c010a309:	eb 51                	jmp    c010a35c <popFromDoubleLinkList+0x92>
c010a30b:	8b 45 08             	mov    0x8(%ebp),%eax
c010a30e:	8b 40 08             	mov    0x8(%eax),%eax
c010a311:	8b 00                	mov    (%eax),%eax
c010a313:	85 c0                	test   %eax,%eax
c010a315:	74 11                	je     c010a328 <popFromDoubleLinkList+0x5e>
c010a317:	8b 45 08             	mov    0x8(%ebp),%eax
c010a31a:	8b 40 08             	mov    0x8(%eax),%eax
c010a31d:	8b 00                	mov    (%eax),%eax
c010a31f:	8b 55 08             	mov    0x8(%ebp),%edx
c010a322:	83 c2 08             	add    $0x8,%edx
c010a325:	89 50 04             	mov    %edx,0x4(%eax)
c010a328:	8b 45 08             	mov    0x8(%ebp),%eax
c010a32b:	8b 40 08             	mov    0x8(%eax),%eax
c010a32e:	8b 10                	mov    (%eax),%edx
c010a330:	8b 45 08             	mov    0x8(%ebp),%eax
c010a333:	89 50 08             	mov    %edx,0x8(%eax)
c010a336:	83 ec 0c             	sub    $0xc,%esp
c010a339:	ff 75 f4             	pushl  -0xc(%ebp)
c010a33c:	e8 10 c9 ff ff       	call   c0106c51 <intr_set_status>
c010a341:	83 c4 10             	add    $0x10,%esp
c010a344:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a347:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c010a34e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a351:	8b 50 04             	mov    0x4(%eax),%edx
c010a354:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a357:	89 10                	mov    %edx,(%eax)
c010a359:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a35c:	c9                   	leave  
c010a35d:	c3                   	ret    

c010a35e <kernel_thread>:
c010a35e:	55                   	push   %ebp
c010a35f:	89 e5                	mov    %esp,%ebp
c010a361:	83 ec 08             	sub    $0x8,%esp
c010a364:	fb                   	sti    
c010a365:	83 ec 0c             	sub    $0xc,%esp
c010a368:	ff 75 0c             	pushl  0xc(%ebp)
c010a36b:	8b 45 08             	mov    0x8(%ebp),%eax
c010a36e:	ff d0                	call   *%eax
c010a370:	83 c4 10             	add    $0x10,%esp
c010a373:	90                   	nop
c010a374:	c9                   	leave  
c010a375:	c3                   	ret    

c010a376 <thread_init>:
c010a376:	55                   	push   %ebp
c010a377:	89 e5                	mov    %esp,%ebp
c010a379:	83 ec 18             	sub    $0x18,%esp
c010a37c:	83 ec 08             	sub    $0x8,%esp
c010a37f:	6a 00                	push   $0x0
c010a381:	6a 01                	push   $0x1
c010a383:	e8 cf bd ff ff       	call   c0106157 <alloc_memory>
c010a388:	83 c4 10             	add    $0x10,%esp
c010a38b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a38e:	83 ec 04             	sub    $0x4,%esp
c010a391:	68 00 10 00 00       	push   $0x1000
c010a396:	6a 00                	push   $0x0
c010a398:	ff 75 f4             	pushl  -0xc(%ebp)
c010a39b:	e8 2f 1e 00 00       	call   c010c1cf <Memset>
c010a3a0:	83 c4 10             	add    $0x10,%esp
c010a3a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a3a6:	05 00 10 00 00       	add    $0x1000,%eax
c010a3ab:	89 c2                	mov    %eax,%edx
c010a3ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a3b0:	89 10                	mov    %edx,(%eax)
c010a3b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a3b5:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c010a3bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a3bf:	c7 80 58 02 00 00 ff 	movl   $0xffffffff,0x258(%eax)
c010a3c6:	ff ff ff 
c010a3c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a3cc:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c010a3d3:	00 00 00 
c010a3d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a3d9:	8b 90 50 02 00 00    	mov    0x250(%eax),%edx
c010a3df:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a3e2:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c010a3e8:	a1 90 f7 10 c0       	mov    0xc010f790,%eax
c010a3ed:	83 c0 01             	add    $0x1,%eax
c010a3f0:	a3 90 f7 10 c0       	mov    %eax,0xc010f790
c010a3f5:	8b 15 90 f7 10 c0    	mov    0xc010f790,%edx
c010a3fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a3fe:	89 90 14 01 00 00    	mov    %edx,0x114(%eax)
c010a404:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a407:	c7 80 18 01 00 00 0f 	movl   $0xf,0x118(%eax)
c010a40e:	00 00 00 
c010a411:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a414:	c7 80 b8 02 00 00 e0 	movl   $0x99abcde0,0x2b8(%eax)
c010a41b:	cd ab 99 
c010a41e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a421:	c9                   	leave  
c010a422:	c3                   	ret    

c010a423 <thread_create>:
c010a423:	55                   	push   %ebp
c010a424:	89 e5                	mov    %esp,%ebp
c010a426:	83 ec 10             	sub    $0x10,%esp
c010a429:	c7 45 fc 44 00 00 00 	movl   $0x44,-0x4(%ebp)
c010a430:	c7 45 f8 30 00 00 00 	movl   $0x30,-0x8(%ebp)
c010a437:	8b 45 08             	mov    0x8(%ebp),%eax
c010a43a:	8b 00                	mov    (%eax),%eax
c010a43c:	2b 45 fc             	sub    -0x4(%ebp),%eax
c010a43f:	89 c2                	mov    %eax,%edx
c010a441:	8b 45 08             	mov    0x8(%ebp),%eax
c010a444:	89 10                	mov    %edx,(%eax)
c010a446:	8b 45 08             	mov    0x8(%ebp),%eax
c010a449:	8b 00                	mov    (%eax),%eax
c010a44b:	2b 45 f8             	sub    -0x8(%ebp),%eax
c010a44e:	89 c2                	mov    %eax,%edx
c010a450:	8b 45 08             	mov    0x8(%ebp),%eax
c010a453:	89 10                	mov    %edx,(%eax)
c010a455:	90                   	nop
c010a456:	c9                   	leave  
c010a457:	c3                   	ret    

c010a458 <thread_start>:
c010a458:	55                   	push   %ebp
c010a459:	89 e5                	mov    %esp,%ebp
c010a45b:	83 ec 18             	sub    $0x18,%esp
c010a45e:	e8 13 ff ff ff       	call   c010a376 <thread_init>
c010a463:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a466:	83 ec 0c             	sub    $0xc,%esp
c010a469:	ff 75 f4             	pushl  -0xc(%ebp)
c010a46c:	e8 b2 ff ff ff       	call   c010a423 <thread_create>
c010a471:	83 c4 10             	add    $0x10,%esp
c010a474:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a477:	05 28 01 00 00       	add    $0x128,%eax
c010a47c:	83 ec 08             	sub    $0x8,%esp
c010a47f:	ff 75 10             	pushl  0x10(%ebp)
c010a482:	50                   	push   %eax
c010a483:	e8 66 1d 00 00       	call   c010c1ee <Strcpy>
c010a488:	83 c4 10             	add    $0x10,%esp
c010a48b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a48e:	8b 00                	mov    (%eax),%eax
c010a490:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a493:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a496:	c7 40 10 5e a3 10 c0 	movl   $0xc010a35e,0x10(%eax)
c010a49d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a4a0:	8b 55 08             	mov    0x8(%ebp),%edx
c010a4a3:	89 50 18             	mov    %edx,0x18(%eax)
c010a4a6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a4a9:	8b 55 0c             	mov    0xc(%ebp),%edx
c010a4ac:	89 50 1c             	mov    %edx,0x1c(%eax)
c010a4af:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a4b2:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010a4b8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a4bb:	8b 10                	mov    (%eax),%edx
c010a4bd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a4c0:	89 50 04             	mov    %edx,0x4(%eax)
c010a4c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a4c6:	8b 50 04             	mov    0x4(%eax),%edx
c010a4c9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a4cc:	89 50 08             	mov    %edx,0x8(%eax)
c010a4cf:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a4d2:	8b 50 08             	mov    0x8(%eax),%edx
c010a4d5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a4d8:	89 50 0c             	mov    %edx,0xc(%eax)
c010a4db:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a4de:	05 60 02 00 00       	add    $0x260,%eax
c010a4e3:	83 ec 08             	sub    $0x8,%esp
c010a4e6:	50                   	push   %eax
c010a4e7:	68 ec fd 10 c0       	push   $0xc010fdec
c010a4ec:	e8 6f fc ff ff       	call   c010a160 <appendToDoubleLinkList>
c010a4f1:	83 c4 10             	add    $0x10,%esp
c010a4f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a4f7:	05 6a 02 00 00       	add    $0x26a,%eax
c010a4fc:	83 ec 08             	sub    $0x8,%esp
c010a4ff:	50                   	push   %eax
c010a500:	68 04 0f 11 c0       	push   $0xc0110f04
c010a505:	e8 56 fc ff ff       	call   c010a160 <appendToDoubleLinkList>
c010a50a:	83 c4 10             	add    $0x10,%esp
c010a50d:	90                   	nop
c010a50e:	c9                   	leave  
c010a50f:	c3                   	ret    

c010a510 <DriverInitialize>:
c010a510:	56                   	push   %esi
c010a511:	57                   	push   %edi
c010a512:	53                   	push   %ebx
c010a513:	55                   	push   %ebp
c010a514:	51                   	push   %ecx
c010a515:	89 e5                	mov    %esp,%ebp
c010a517:	b0 21                	mov    $0x21,%al
c010a519:	66 ba 00 03          	mov    $0x300,%dx
c010a51d:	ee                   	out    %al,(%dx)
c010a51e:	b0 49                	mov    $0x49,%al
c010a520:	66 ba 0e 03          	mov    $0x30e,%dx
c010a524:	ee                   	out    %al,(%dx)
c010a525:	66 ba 0a 03          	mov    $0x30a,%dx
c010a529:	30 c0                	xor    %al,%al
c010a52b:	ee                   	out    %al,(%dx)
c010a52c:	66 ba 0b 03          	mov    $0x30b,%dx
c010a530:	ee                   	out    %al,(%dx)
c010a531:	b0 00                	mov    $0x0,%al
c010a533:	66 ba 0c 03          	mov    $0x30c,%dx
c010a537:	ee                   	out    %al,(%dx)
c010a538:	b0 20                	mov    $0x20,%al
c010a53a:	66 ba 04 03          	mov    $0x304,%dx
c010a53e:	ee                   	out    %al,(%dx)
c010a53f:	b0 02                	mov    $0x2,%al
c010a541:	66 ba 0d 03          	mov    $0x30d,%dx
c010a545:	ee                   	out    %al,(%dx)
c010a546:	b0 26                	mov    $0x26,%al
c010a548:	66 ba 01 03          	mov    $0x301,%dx
c010a54c:	ee                   	out    %al,(%dx)
c010a54d:	66 ba 03 03          	mov    $0x303,%dx
c010a551:	ee                   	out    %al,(%dx)
c010a552:	b0 40                	mov    $0x40,%al
c010a554:	66 ba 02 03          	mov    $0x302,%dx
c010a558:	ee                   	out    %al,(%dx)
c010a559:	b0 61                	mov    $0x61,%al
c010a55b:	66 ba 00 03          	mov    $0x300,%dx
c010a55f:	ee                   	out    %al,(%dx)
c010a560:	b0 26                	mov    $0x26,%al
c010a562:	66 ba 07 03          	mov    $0x307,%dx
c010a566:	ee                   	out    %al,(%dx)
c010a567:	b0 22                	mov    $0x22,%al
c010a569:	66 ba 00 03          	mov    $0x300,%dx
c010a56d:	ee                   	out    %al,(%dx)
c010a56e:	b0 ff                	mov    $0xff,%al
c010a570:	66 ba 07 03          	mov    $0x307,%dx
c010a574:	ee                   	out    %al,(%dx)
c010a575:	b0 0b                	mov    $0xb,%al
c010a577:	66 ba 0f 03          	mov    $0x30f,%dx
c010a57b:	ee                   	out    %al,(%dx)
c010a57c:	66 ba 0d 03          	mov    $0x30d,%dx
c010a580:	b0 00                	mov    $0x0,%al
c010a582:	ee                   	out    %al,(%dx)
c010a583:	59                   	pop    %ecx
c010a584:	5d                   	pop    %ebp
c010a585:	5b                   	pop    %ebx
c010a586:	5f                   	pop    %edi
c010a587:	5e                   	pop    %esi
c010a588:	c3                   	ret    

c010a589 <DriverSend>:
c010a589:	56                   	push   %esi
c010a58a:	57                   	push   %edi
c010a58b:	53                   	push   %ebx
c010a58c:	55                   	push   %ebp
c010a58d:	51                   	push   %ecx
c010a58e:	89 e5                	mov    %esp,%ebp
c010a590:	66 ba 00 03          	mov    $0x300,%dx
c010a594:	ec                   	in     (%dx),%al
c010a595:	3c 26                	cmp    $0x26,%al
c010a597:	74 30                	je     c010a5c9 <QueueIt>
c010a599:	66 51                	push   %cx
c010a59b:	b4 40                	mov    $0x40,%ah
c010a59d:	30 c0                	xor    %al,%al
c010a59f:	e8 2c 00 00 00       	call   c010a5d0 <PCtoNIC>
c010a5a4:	e8 8d 00 00 00       	call   c010a636 <NICtoPC>
c010a5a9:	66 ba 04 03          	mov    $0x304,%dx
c010a5ad:	b0 40                	mov    $0x40,%al
c010a5af:	ee                   	out    %al,(%dx)
c010a5b0:	66 59                	pop    %cx
c010a5b2:	66 ba 05 03          	mov    $0x305,%dx
c010a5b6:	88 c8                	mov    %cl,%al
c010a5b8:	ee                   	out    %al,(%dx)
c010a5b9:	66 ba 06 03          	mov    $0x306,%dx
c010a5bd:	88 e8                	mov    %ch,%al
c010a5bf:	ee                   	out    %al,(%dx)
c010a5c0:	66 ba 00 03          	mov    $0x300,%dx
c010a5c4:	b0 26                	mov    $0x26,%al
c010a5c6:	ee                   	out    %al,(%dx)
c010a5c7:	eb 01                	jmp    c010a5ca <Finished>

c010a5c9 <QueueIt>:
c010a5c9:	90                   	nop

c010a5ca <Finished>:
c010a5ca:	59                   	pop    %ecx
c010a5cb:	5d                   	pop    %ebp
c010a5cc:	5b                   	pop    %ebx
c010a5cd:	5f                   	pop    %edi
c010a5ce:	5e                   	pop    %esi
c010a5cf:	c3                   	ret    

c010a5d0 <PCtoNIC>:
c010a5d0:	56                   	push   %esi
c010a5d1:	57                   	push   %edi
c010a5d2:	53                   	push   %ebx
c010a5d3:	55                   	push   %ebp
c010a5d4:	51                   	push   %ecx
c010a5d5:	89 e5                	mov    %esp,%ebp
c010a5d7:	66 50                	push   %ax
c010a5d9:	66 41                	inc    %cx
c010a5db:	66 83 e1 fe          	and    $0xfffe,%cx
c010a5df:	66 bb 80 00          	mov    $0x80,%bx
c010a5e3:	66 ba 0a 03          	mov    $0x30a,%dx
c010a5e7:	88 d8                	mov    %bl,%al
c010a5e9:	ee                   	out    %al,(%dx)
c010a5ea:	66 ba 0b 03          	mov    $0x30b,%dx
c010a5ee:	88 f8                	mov    %bh,%al
c010a5f0:	ee                   	out    %al,(%dx)
c010a5f1:	66 58                	pop    %ax
c010a5f3:	66 ba 08 03          	mov    $0x308,%dx
c010a5f7:	ee                   	out    %al,(%dx)
c010a5f8:	66 ba 09 03          	mov    $0x309,%dx
c010a5fc:	88 e0                	mov    %ah,%al
c010a5fe:	ee                   	out    %al,(%dx)
c010a5ff:	66 ba 00 03          	mov    $0x300,%dx
c010a603:	b0 12                	mov    $0x12,%al
c010a605:	ee                   	out    %al,(%dx)
c010a606:	66 ba 10 03          	mov    $0x310,%dx
c010a60a:	66 b9 80 00          	mov    $0x80,%cx
c010a60e:	66 d1 e9             	shr    %cx
c010a611:	66 b8 59 00          	mov    $0x59,%ax

c010a615 <Writing_Word>:
c010a615:	66 ef                	out    %ax,(%dx)
c010a617:	e2 fc                	loop   c010a615 <Writing_Word>
c010a619:	66 b9 00 00          	mov    $0x0,%cx
c010a61d:	66 ba 07 03          	mov    $0x307,%dx

c010a621 <CheckDMA>:
c010a621:	ec                   	in     (%dx),%al
c010a622:	a8 40                	test   $0x40,%al
c010a624:	75 02                	jne    c010a628 <toNICEND>
c010a626:	eb f9                	jmp    c010a621 <CheckDMA>

c010a628 <toNICEND>:
c010a628:	66 ba 07 03          	mov    $0x307,%dx
c010a62c:	b0 40                	mov    $0x40,%al
c010a62e:	ee                   	out    %al,(%dx)
c010a62f:	f8                   	clc    
c010a630:	59                   	pop    %ecx
c010a631:	5d                   	pop    %ebp
c010a632:	5b                   	pop    %ebx
c010a633:	5f                   	pop    %edi
c010a634:	5e                   	pop    %esi
c010a635:	c3                   	ret    

c010a636 <NICtoPC>:
c010a636:	56                   	push   %esi
c010a637:	57                   	push   %edi
c010a638:	53                   	push   %ebx
c010a639:	55                   	push   %ebp
c010a63a:	51                   	push   %ecx
c010a63b:	89 e5                	mov    %esp,%ebp
c010a63d:	66 50                	push   %ax
c010a63f:	66 41                	inc    %cx
c010a641:	66 83 e1 fe          	and    $0xfffe,%cx
c010a645:	66 bb 80 00          	mov    $0x80,%bx
c010a649:	66 ba 0a 03          	mov    $0x30a,%dx
c010a64d:	88 d8                	mov    %bl,%al
c010a64f:	ee                   	out    %al,(%dx)
c010a650:	66 ba 0b 03          	mov    $0x30b,%dx
c010a654:	88 f8                	mov    %bh,%al
c010a656:	ee                   	out    %al,(%dx)
c010a657:	66 58                	pop    %ax
c010a659:	66 ba 08 03          	mov    $0x308,%dx
c010a65d:	ee                   	out    %al,(%dx)
c010a65e:	66 ba 09 03          	mov    $0x309,%dx
c010a662:	88 e0                	mov    %ah,%al
c010a664:	ee                   	out    %al,(%dx)
c010a665:	66 ba 00 03          	mov    $0x300,%dx
c010a669:	b0 0a                	mov    $0xa,%al
c010a66b:	ee                   	out    %al,(%dx)
c010a66c:	66 ba 10 03          	mov    $0x310,%dx
c010a670:	66 b9 80 00          	mov    $0x80,%cx
c010a674:	66 d1 e9             	shr    %cx

c010a677 <READING_Word_NICtoPC>:
c010a677:	66 31 c0             	xor    %ax,%ax
c010a67a:	66 ed                	in     (%dx),%ax
c010a67c:	66 a3 cc 06 11 c0    	mov    %ax,0xc01106cc
c010a682:	e2 f3                	loop   c010a677 <READING_Word_NICtoPC>
c010a684:	66 ba 07 03          	mov    $0x307,%dx

c010a688 <CheckDMA_NICtoPC>:
c010a688:	ec                   	in     (%dx),%al
c010a689:	a8 40                	test   $0x40,%al
c010a68b:	75 02                	jne    c010a68f <ReadEnd>
c010a68d:	eb f9                	jmp    c010a688 <CheckDMA_NICtoPC>

c010a68f <ReadEnd>:
c010a68f:	ee                   	out    %al,(%dx)
c010a690:	59                   	pop    %ecx
c010a691:	5d                   	pop    %ebp
c010a692:	5b                   	pop    %ebx
c010a693:	5f                   	pop    %edi
c010a694:	5e                   	pop    %esi
c010a695:	c3                   	ret    
