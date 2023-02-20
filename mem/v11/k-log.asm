
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
c0100025:	e8 de 3a 00 00       	call   c0103b08 <ReloadGDT>
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
c010004e:	e9 5e 03 00 00       	jmp    c01003b1 <kernel_main>
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
c010014b:	e8 fd 6f 00 00       	call   c010714d <exception_handler>
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
c0100168:	e8 e0 6f 00 00       	call   c010714d <exception_handler>
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
c0100195:	e8 4b 35 00 00       	call   c01036e5 <clock_handler>
c010019a:	e9 eb 00 00 00       	jmp    c010028a <reenter_restore>

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
c01001c7:	e8 91 44 00 00       	call   c010465d <keyboard_handler>
c01001cc:	b0 f8                	mov    $0xf8,%al
c01001ce:	e6 21                	out    %al,$0x21
c01001d0:	83 3d a8 f7 10 c0 00 	cmpl   $0x0,0xc010f7a8
c01001d7:	0f 85 ad 00 00 00    	jne    c010028a <reenter_restore>
c01001dd:	e9 a8 00 00 00       	jmp    c010028a <reenter_restore>

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
c010020d:	e8 8e 11 00 00       	call   c01013a0 <hd_handler>
c0100212:	b0 bf                	mov    $0xbf,%al
c0100214:	e6 a1                	out    %al,$0xa1
c0100216:	83 3d a8 f7 10 c0 00 	cmpl   $0x0,0xc010f7a8
c010021d:	75 6b                	jne    c010028a <reenter_restore>
c010021f:	eb 69                	jmp    c010028a <reenter_restore>

c0100221 <sys_call>:
c0100221:	60                   	pusha  
c0100222:	1e                   	push   %ds
c0100223:	06                   	push   %es
c0100224:	0f a0                	push   %fs
c0100226:	0f a8                	push   %gs
c0100228:	89 e6                	mov    %esp,%esi
c010022a:	89 e5                	mov    %esp,%ebp
c010022c:	66 8c d2             	mov    %ss,%dx
c010022f:	8e da                	mov    %edx,%ds
c0100231:	8e c2                	mov    %edx,%es
c0100233:	8e e2                	mov    %edx,%fs
c0100235:	ff 05 a8 f7 10 c0    	incl   0xc010f7a8
c010023b:	83 3d a8 f7 10 c0 00 	cmpl   $0x0,0xc010f7a8
c0100242:	75 00                	jne    c0100244 <sys_call.1>

c0100244 <sys_call.1>:
c0100244:	fb                   	sti    
c0100245:	56                   	push   %esi
c0100246:	ff 35 c0 fb 10 c0    	pushl  0xc010fbc0
c010024c:	53                   	push   %ebx
c010024d:	51                   	push   %ecx
c010024e:	ff 14 85 2c e1 10 c0 	call   *-0x3fef1ed4(,%eax,4)
c0100255:	83 c4 0c             	add    $0xc,%esp
c0100258:	5e                   	pop    %esi
c0100259:	89 45 2c             	mov    %eax,0x2c(%ebp)
c010025c:	83 3d a8 f7 10 c0 00 	cmpl   $0x0,0xc010f7a8
c0100263:	75 25                	jne    c010028a <reenter_restore>
c0100265:	eb 23                	jmp    c010028a <reenter_restore>

c0100267 <fork_restart>:
c0100267:	fa                   	cli    
c0100268:	ff 0d a8 f7 10 c0    	decl   0xc010f7a8
c010026e:	0f a9                	pop    %gs
c0100270:	0f a1                	pop    %fs
c0100272:	07                   	pop    %es
c0100273:	1f                   	pop    %ds
c0100274:	61                   	popa   
c0100275:	cf                   	iret   

c0100276 <restart>:
c0100276:	fa                   	cli    
c0100277:	ff 0d a8 f7 10 c0    	decl   0xc010f7a8
c010027d:	89 e5                	mov    %esp,%ebp
c010027f:	8b 65 04             	mov    0x4(%ebp),%esp
c0100282:	0f a9                	pop    %gs
c0100284:	0f a1                	pop    %fs
c0100286:	07                   	pop    %es
c0100287:	1f                   	pop    %ds
c0100288:	61                   	popa   
c0100289:	cf                   	iret   

c010028a <reenter_restore>:
c010028a:	fa                   	cli    
c010028b:	ff 0d a8 f7 10 c0    	decl   0xc010f7a8
c0100291:	0f a9                	pop    %gs
c0100293:	0f a1                	pop    %fs
c0100295:	07                   	pop    %es
c0100296:	1f                   	pop    %ds
c0100297:	61                   	popa   
c0100298:	cf                   	iret   

c0100299 <in_byte>:
c0100299:	31 d2                	xor    %edx,%edx
c010029b:	8b 54 24 04          	mov    0x4(%esp),%edx
c010029f:	31 c0                	xor    %eax,%eax
c01002a1:	ec                   	in     (%dx),%al
c01002a2:	90                   	nop
c01002a3:	90                   	nop
c01002a4:	c3                   	ret    

c01002a5 <out_byte>:
c01002a5:	31 d2                	xor    %edx,%edx
c01002a7:	31 c0                	xor    %eax,%eax
c01002a9:	8b 54 24 04          	mov    0x4(%esp),%edx
c01002ad:	8a 44 24 08          	mov    0x8(%esp),%al
c01002b1:	ee                   	out    %al,(%dx)
c01002b2:	90                   	nop
c01002b3:	90                   	nop
c01002b4:	c3                   	ret    

c01002b5 <in_byte2>:
c01002b5:	55                   	push   %ebp
c01002b6:	89 e5                	mov    %esp,%ebp
c01002b8:	52                   	push   %edx
c01002b9:	31 d2                	xor    %edx,%edx
c01002bb:	66 8b 55 08          	mov    0x8(%ebp),%dx
c01002bf:	31 c0                	xor    %eax,%eax
c01002c1:	ec                   	in     (%dx),%al
c01002c2:	90                   	nop
c01002c3:	90                   	nop
c01002c4:	5b                   	pop    %ebx
c01002c5:	5d                   	pop    %ebp
c01002c6:	c3                   	ret    

c01002c7 <disable_int>:
c01002c7:	fa                   	cli    
c01002c8:	c3                   	ret    

c01002c9 <enable_int>:
c01002c9:	fb                   	sti    
c01002ca:	c3                   	ret    

c01002cb <check_tss_esp0>:
c01002cb:	55                   	push   %ebp
c01002cc:	89 e5                	mov    %esp,%ebp
c01002ce:	8b 45 08             	mov    0x8(%ebp),%eax
c01002d1:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c01002d4:	83 c0 44             	add    $0x44,%eax
c01002d7:	8b 15 44 06 11 c0    	mov    0xc0110644,%edx
c01002dd:	39 d0                	cmp    %edx,%eax
c01002df:	74 7c                	je     c010035d <check_tss_esp0.2>

c01002e1 <check_tss_esp0.1>:
c01002e1:	50                   	push   %eax
c01002e2:	52                   	push   %edx
c01002e3:	68 10 e0 10 c0       	push   $0xc010e010
c01002e8:	e8 9f fd ff ff       	call   c010008c <disp_str>
c01002ed:	83 c4 04             	add    $0x4,%esp
c01002f0:	5a                   	pop    %edx
c01002f1:	58                   	pop    %eax
c01002f2:	52                   	push   %edx
c01002f3:	50                   	push   %eax
c01002f4:	53                   	push   %ebx
c01002f5:	e8 ed 6c 00 00       	call   c0106fe7 <disp_int>
c01002fa:	83 c4 04             	add    $0x4,%esp
c01002fd:	58                   	pop    %eax
c01002fe:	5a                   	pop    %edx
c01002ff:	52                   	push   %edx
c0100300:	50                   	push   %eax
c0100301:	e8 e1 6c 00 00       	call   c0106fe7 <disp_int>
c0100306:	58                   	pop    %eax
c0100307:	5a                   	pop    %edx
c0100308:	52                   	push   %edx
c0100309:	50                   	push   %eax
c010030a:	ff 35 a8 f7 10 c0    	pushl  0xc010f7a8
c0100310:	e8 d2 6c 00 00       	call   c0106fe7 <disp_int>
c0100315:	83 c4 04             	add    $0x4,%esp
c0100318:	58                   	pop    %eax
c0100319:	5a                   	pop    %edx
c010031a:	52                   	push   %edx
c010031b:	50                   	push   %eax
c010031c:	ff 72 ec             	pushl  -0x14(%edx)
c010031f:	e8 c3 6c 00 00       	call   c0106fe7 <disp_int>
c0100324:	83 c4 04             	add    $0x4,%esp
c0100327:	58                   	pop    %eax
c0100328:	5a                   	pop    %edx
c0100329:	52                   	push   %edx
c010032a:	50                   	push   %eax
c010032b:	ff 70 ec             	pushl  -0x14(%eax)
c010032e:	e8 b4 6c 00 00       	call   c0106fe7 <disp_int>
c0100333:	83 c4 04             	add    $0x4,%esp
c0100336:	58                   	pop    %eax
c0100337:	5a                   	pop    %edx
c0100338:	52                   	push   %edx
c0100339:	50                   	push   %eax
c010033a:	ff 35 c0 fb 10 c0    	pushl  0xc010fbc0
c0100340:	e8 a2 6c 00 00       	call   c0106fe7 <disp_int>
c0100345:	83 c4 04             	add    $0x4,%esp
c0100348:	58                   	pop    %eax
c0100349:	5a                   	pop    %edx
c010034a:	52                   	push   %edx
c010034b:	50                   	push   %eax
c010034c:	68 60 f7 10 c0       	push   $0xc010f760
c0100351:	e8 91 6c 00 00       	call   c0106fe7 <disp_int>
c0100356:	83 c4 04             	add    $0x4,%esp
c0100359:	58                   	pop    %eax
c010035a:	5a                   	pop    %edx
c010035b:	5d                   	pop    %ebp
c010035c:	c3                   	ret    

c010035d <check_tss_esp0.2>:
c010035d:	5d                   	pop    %ebp
c010035e:	c3                   	ret    

c010035f <enable_8259A_casecade_irq>:
c010035f:	9c                   	pushf  
c0100360:	fa                   	cli    
c0100361:	e4 21                	in     $0x21,%al
c0100363:	24 fb                	and    $0xfb,%al
c0100365:	e6 21                	out    %al,$0x21
c0100367:	9d                   	popf   
c0100368:	c3                   	ret    

c0100369 <disable_8259A_casecade_irq>:
c0100369:	9c                   	pushf  
c010036a:	fa                   	cli    
c010036b:	e4 21                	in     $0x21,%al
c010036d:	0c 04                	or     $0x4,%al
c010036f:	e6 21                	out    %al,$0x21
c0100371:	9c                   	pushf  
c0100372:	c3                   	ret    

c0100373 <enable_8259A_slave_winchester_irq>:
c0100373:	9c                   	pushf  
c0100374:	fa                   	cli    
c0100375:	e4 a1                	in     $0xa1,%al
c0100377:	24 bf                	and    $0xbf,%al
c0100379:	e6 a1                	out    %al,$0xa1
c010037b:	9d                   	popf   
c010037c:	c3                   	ret    

c010037d <disable_8259A_slave_winchester_irq>:
c010037d:	9c                   	pushf  
c010037e:	fa                   	cli    
c010037f:	e4 a1                	in     $0xa1,%al
c0100381:	0c 40                	or     $0x40,%al
c0100383:	e6 a1                	out    %al,$0xa1
c0100385:	9d                   	popf   
c0100386:	c3                   	ret    

c0100387 <update_cr3>:
c0100387:	55                   	push   %ebp
c0100388:	89 e5                	mov    %esp,%ebp
c010038a:	8b 45 08             	mov    0x8(%ebp),%eax
c010038d:	0f 22 d8             	mov    %eax,%cr3
c0100390:	89 ec                	mov    %ebp,%esp
c0100392:	5d                   	pop    %ebp
c0100393:	c3                   	ret    

c0100394 <update_tss>:
c0100394:	55                   	push   %ebp
c0100395:	89 e5                	mov    %esp,%ebp
c0100397:	8b 45 08             	mov    0x8(%ebp),%eax
c010039a:	a3 44 06 11 c0       	mov    %eax,0xc0110644
c010039f:	89 ec                	mov    %ebp,%esp
c01003a1:	5d                   	pop    %ebp
c01003a2:	c3                   	ret    

c01003a3 <get_running_thread_pcb>:
c01003a3:	89 e0                	mov    %esp,%eax
c01003a5:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01003aa:	c3                   	ret    

c01003ab <sys_call_test>:
c01003ab:	9c                   	pushf  
c01003ac:	66 87 db             	xchg   %bx,%bx
c01003af:	9d                   	popf   
c01003b0:	c3                   	ret    

c01003b1 <kernel_main>:
c01003b1:	55                   	push   %ebp
c01003b2:	89 e5                	mov    %esp,%ebp
c01003b4:	83 ec 18             	sub    $0x18,%esp
c01003b7:	e8 58 01 00 00       	call   c0100514 <init>
c01003bc:	c7 45 f4 0f 00 00 00 	movl   $0xf,-0xc(%ebp)
c01003c3:	e8 db ff ff ff       	call   c01003a3 <get_running_thread_pcb>
c01003c8:	a3 e0 0e 11 c0       	mov    %eax,0xc0110ee0
c01003cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01003d0:	8d 50 02             	lea    0x2(%eax),%edx
c01003d3:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c01003d8:	89 90 1c 01 00 00    	mov    %edx,0x11c(%eax)
c01003de:	8b 15 e0 0e 11 c0    	mov    0xc0110ee0,%edx
c01003e4:	8b 80 1c 01 00 00    	mov    0x11c(%eax),%eax
c01003ea:	89 82 18 01 00 00    	mov    %eax,0x118(%edx)
c01003f0:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c01003f5:	8b 15 28 0f 11 c0    	mov    0xc0110f28,%edx
c01003fb:	89 50 08             	mov    %edx,0x8(%eax)
c01003fe:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c0100403:	05 28 01 00 00       	add    $0x128,%eax
c0100408:	83 ec 08             	sub    $0x8,%esp
c010040b:	68 a0 a2 10 c0       	push   $0xc010a2a0
c0100410:	50                   	push   %eax
c0100411:	e8 74 ae 00 00       	call   c010b28a <Strcpy>
c0100416:	83 c4 10             	add    $0x10,%esp
c0100419:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c010041e:	a3 c0 fb 10 c0       	mov    %eax,0xc010fbc0
c0100423:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c0100428:	05 60 02 00 00       	add    $0x260,%eax
c010042d:	83 ec 08             	sub    $0x8,%esp
c0100430:	50                   	push   %eax
c0100431:	68 ec fd 10 c0       	push   $0xc010fdec
c0100436:	e8 a5 9a 00 00       	call   c0109ee0 <appendToDoubleLinkList>
c010043b:	83 c4 10             	add    $0x10,%esp
c010043e:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c0100443:	05 6a 02 00 00       	add    $0x26a,%eax
c0100448:	83 ec 08             	sub    $0x8,%esp
c010044b:	50                   	push   %eax
c010044c:	68 ec fd 10 c0       	push   $0xc010fdec
c0100451:	e8 8a 9a 00 00       	call   c0109ee0 <appendToDoubleLinkList>
c0100456:	83 c4 10             	add    $0x10,%esp
c0100459:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010045c:	83 ec 0c             	sub    $0xc,%esp
c010045f:	50                   	push   %eax
c0100460:	6a 00                	push   $0x0
c0100462:	68 ac a2 10 c0       	push   $0xc010a2ac
c0100467:	68 b3 a2 10 c0       	push   $0xc010a2b3
c010046c:	68 c4 50 10 c0       	push   $0xc01050c4
c0100471:	e8 ae 97 00 00       	call   c0109c24 <process_execute>
c0100476:	83 c4 20             	add    $0x20,%esp
c0100479:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010047c:	83 ec 0c             	sub    $0xc,%esp
c010047f:	50                   	push   %eax
c0100480:	6a 00                	push   $0x0
c0100482:	68 bc a2 10 c0       	push   $0xc010a2bc
c0100487:	68 c4 a2 10 c0       	push   $0xc010a2c4
c010048c:	68 a9 15 10 c0       	push   $0xc01015a9
c0100491:	e8 8e 97 00 00       	call   c0109c24 <process_execute>
c0100496:	83 c4 20             	add    $0x20,%esp
c0100499:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010049c:	83 ec 0c             	sub    $0xc,%esp
c010049f:	50                   	push   %eax
c01004a0:	6a 00                	push   $0x0
c01004a2:	68 cd a2 10 c0       	push   $0xc010a2cd
c01004a7:	68 d4 a2 10 c0       	push   $0xc010a2d4
c01004ac:	68 18 07 10 c0       	push   $0xc0100718
c01004b1:	e8 6e 97 00 00       	call   c0109c24 <process_execute>
c01004b6:	83 c4 20             	add    $0x20,%esp
c01004b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01004bc:	83 ec 0c             	sub    $0xc,%esp
c01004bf:	50                   	push   %eax
c01004c0:	6a 00                	push   $0x0
c01004c2:	68 dd a2 10 c0       	push   $0xc010a2dd
c01004c7:	68 e5 a2 10 c0       	push   $0xc010a2e5
c01004cc:	68 5a 45 10 c0       	push   $0xc010455a
c01004d1:	e8 4e 97 00 00       	call   c0109c24 <process_execute>
c01004d6:	83 c4 20             	add    $0x20,%esp
c01004d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01004dc:	83 e8 02             	sub    $0x2,%eax
c01004df:	83 ec 0c             	sub    $0xc,%esp
c01004e2:	50                   	push   %eax
c01004e3:	6a 01                	push   $0x1
c01004e5:	68 ef a2 10 c0       	push   $0xc010a2ef
c01004ea:	68 f9 a2 10 c0       	push   $0xc010a2f9
c01004ef:	68 a8 06 10 c0       	push   $0xc01006a8
c01004f4:	e8 2b 97 00 00       	call   c0109c24 <process_execute>
c01004f9:	83 c4 20             	add    $0x20,%esp
c01004fc:	83 ec 0c             	sub    $0xc,%esp
c01004ff:	68 06 a3 10 c0       	push   $0xc010a306
c0100504:	e8 83 fb ff ff       	call   c010008c <disp_str>
c0100509:	83 c4 10             	add    $0x10,%esp
c010050c:	fb                   	sti    
c010050d:	e8 f9 65 00 00       	call   c0106b0b <stop_here>
c0100512:	eb f9                	jmp    c010050d <kernel_main+0x15c>

c0100514 <init>:
c0100514:	55                   	push   %ebp
c0100515:	89 e5                	mov    %esp,%ebp
c0100517:	83 ec 18             	sub    $0x18,%esp
c010051a:	c7 05 28 0f 11 c0 00 	movl   $0x400000,0xc0110f28
c0100521:	00 40 00 
c0100524:	c7 05 a8 f7 10 c0 63 	movl   $0x63,0xc010f7a8
c010052b:	00 00 00 
c010052e:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0100535:	00 00 00 
c0100538:	c7 05 90 f7 10 c0 00 	movl   $0x0,0xc010f790
c010053f:	00 00 00 
c0100542:	c7 05 c4 06 11 c0 64 	movl   $0x64,0xc01106c4
c0100549:	00 00 00 
c010054c:	c7 05 fc fd 10 c0 09 	movl   $0x9,0xc010fdfc
c0100553:	00 00 00 
c0100556:	c7 05 c0 fb 10 c0 00 	movl   $0x0,0xc010fbc0
c010055d:	00 00 00 
c0100560:	83 ec 0c             	sub    $0xc,%esp
c0100563:	68 10 a3 10 c0       	push   $0xc010a310
c0100568:	e8 1f fb ff ff       	call   c010008c <disp_str>
c010056d:	83 c4 10             	add    $0x10,%esp
c0100570:	e8 c2 6f 00 00       	call   c0107537 <init_keyboard>
c0100575:	83 ec 0c             	sub    $0xc,%esp
c0100578:	68 00 00 00 04       	push   $0x4000000
c010057d:	e8 40 64 00 00       	call   c01069c2 <init_memory>
c0100582:	83 c4 10             	add    $0x10,%esp
c0100585:	83 ec 0c             	sub    $0xc,%esp
c0100588:	68 ec fd 10 c0       	push   $0xc010fdec
c010058d:	e8 23 98 00 00       	call   c0109db5 <initDoubleLinkList>
c0100592:	83 c4 10             	add    $0x10,%esp
c0100595:	83 ec 0c             	sub    $0xc,%esp
c0100598:	68 04 0f 11 c0       	push   $0xc0110f04
c010059d:	e8 13 98 00 00       	call   c0109db5 <initDoubleLinkList>
c01005a2:	83 c4 10             	add    $0x10,%esp
c01005a5:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c01005ac:	00 00 00 
c01005af:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01005b6:	eb 14                	jmp    c01005cc <init+0xb8>
c01005b8:	83 ec 0c             	sub    $0xc,%esp
c01005bb:	68 16 a3 10 c0       	push   $0xc010a316
c01005c0:	e8 c7 fa ff ff       	call   c010008c <disp_str>
c01005c5:	83 c4 10             	add    $0x10,%esp
c01005c8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01005cc:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c01005d3:	7e e3                	jle    c01005b8 <init+0xa4>
c01005d5:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c01005dc:	00 00 00 
c01005df:	90                   	nop
c01005e0:	c9                   	leave  
c01005e1:	c3                   	ret    

c01005e2 <kernel_thread_a>:
c01005e2:	55                   	push   %ebp
c01005e3:	89 e5                	mov    %esp,%ebp
c01005e5:	83 ec 18             	sub    $0x18,%esp
c01005e8:	83 ec 0c             	sub    $0xc,%esp
c01005eb:	ff 75 08             	pushl  0x8(%ebp)
c01005ee:	e8 99 fa ff ff       	call   c010008c <disp_str>
c01005f3:	83 c4 10             	add    $0x10,%esp
c01005f6:	a1 a4 f7 10 c0       	mov    0xc010f7a4,%eax
c01005fb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01005fe:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0100605:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100608:	a3 a4 f7 10 c0       	mov    %eax,0xc010f7a4
c010060d:	83 ec 0c             	sub    $0xc,%esp
c0100610:	68 17 a3 10 c0       	push   $0xc010a317
c0100615:	e8 72 fa ff ff       	call   c010008c <disp_str>
c010061a:	83 c4 10             	add    $0x10,%esp
c010061d:	83 ec 0c             	sub    $0xc,%esp
c0100620:	68 20 a3 10 c0       	push   $0xc010a320
c0100625:	e8 62 fa ff ff       	call   c010008c <disp_str>
c010062a:	83 c4 10             	add    $0x10,%esp
c010062d:	eb d6                	jmp    c0100605 <kernel_thread_a+0x23>

c010062f <kernel_thread_b>:
c010062f:	55                   	push   %ebp
c0100630:	89 e5                	mov    %esp,%ebp
c0100632:	83 ec 18             	sub    $0x18,%esp
c0100635:	83 ec 0c             	sub    $0xc,%esp
c0100638:	ff 75 08             	pushl  0x8(%ebp)
c010063b:	e8 4c fa ff ff       	call   c010008c <disp_str>
c0100640:	83 c4 10             	add    $0x10,%esp
c0100643:	a1 a4 f7 10 c0       	mov    0xc010f7a4,%eax
c0100648:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010064b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0100652:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100655:	a3 a4 f7 10 c0       	mov    %eax,0xc010f7a4
c010065a:	83 ec 0c             	sub    $0xc,%esp
c010065d:	68 22 a3 10 c0       	push   $0xc010a322
c0100662:	e8 25 fa ff ff       	call   c010008c <disp_str>
c0100667:	83 c4 10             	add    $0x10,%esp
c010066a:	83 ec 0c             	sub    $0xc,%esp
c010066d:	68 20 a3 10 c0       	push   $0xc010a320
c0100672:	e8 15 fa ff ff       	call   c010008c <disp_str>
c0100677:	83 c4 10             	add    $0x10,%esp
c010067a:	eb d6                	jmp    c0100652 <kernel_thread_b+0x23>

c010067c <kernel_thread_c>:
c010067c:	55                   	push   %ebp
c010067d:	89 e5                	mov    %esp,%ebp
c010067f:	83 ec 08             	sub    $0x8,%esp
c0100682:	83 ec 0c             	sub    $0xc,%esp
c0100685:	ff 75 08             	pushl  0x8(%ebp)
c0100688:	e8 ff f9 ff ff       	call   c010008c <disp_str>
c010068d:	83 c4 10             	add    $0x10,%esp
c0100690:	eb fe                	jmp    c0100690 <kernel_thread_c+0x14>

c0100692 <kernel_thread_d>:
c0100692:	55                   	push   %ebp
c0100693:	89 e5                	mov    %esp,%ebp
c0100695:	83 ec 08             	sub    $0x8,%esp
c0100698:	83 ec 0c             	sub    $0xc,%esp
c010069b:	ff 75 08             	pushl  0x8(%ebp)
c010069e:	e8 e9 f9 ff ff       	call   c010008c <disp_str>
c01006a3:	83 c4 10             	add    $0x10,%esp
c01006a6:	eb fe                	jmp    c01006a6 <kernel_thread_d+0x14>

c01006a8 <user_proc_a>:
c01006a8:	55                   	push   %ebp
c01006a9:	89 e5                	mov    %esp,%ebp
c01006ab:	83 ec 08             	sub    $0x8,%esp
c01006ae:	83 ec 0c             	sub    $0xc,%esp
c01006b1:	68 2b a3 10 c0       	push   $0xc010a32b
c01006b6:	e8 d1 f9 ff ff       	call   c010008c <disp_str>
c01006bb:	83 c4 10             	add    $0x10,%esp
c01006be:	e8 17 79 00 00       	call   c0107fda <test_shell>
c01006c3:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c01006ca:	00 00 00 
c01006cd:	83 ec 0c             	sub    $0xc,%esp
c01006d0:	68 3d a3 10 c0       	push   $0xc010a33d
c01006d5:	e8 b2 f9 ff ff       	call   c010008c <disp_str>
c01006da:	83 c4 10             	add    $0x10,%esp
c01006dd:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c01006e2:	83 ec 0c             	sub    $0xc,%esp
c01006e5:	50                   	push   %eax
c01006e6:	e8 fc 68 00 00       	call   c0106fe7 <disp_int>
c01006eb:	83 c4 10             	add    $0x10,%esp
c01006ee:	83 ec 0c             	sub    $0xc,%esp
c01006f1:	68 3f a3 10 c0       	push   $0xc010a33f
c01006f6:	e8 91 f9 ff ff       	call   c010008c <disp_str>
c01006fb:	83 c4 10             	add    $0x10,%esp
c01006fe:	eb c3                	jmp    c01006c3 <user_proc_a+0x1b>

c0100700 <user_proc_b>:
c0100700:	55                   	push   %ebp
c0100701:	89 e5                	mov    %esp,%ebp
c0100703:	83 ec 08             	sub    $0x8,%esp
c0100706:	83 ec 0c             	sub    $0xc,%esp
c0100709:	68 41 a3 10 c0       	push   $0xc010a341
c010070e:	e8 79 f9 ff ff       	call   c010008c <disp_str>
c0100713:	83 c4 10             	add    $0x10,%esp
c0100716:	eb fe                	jmp    c0100716 <user_proc_b+0x16>

c0100718 <TaskHD>:
c0100718:	55                   	push   %ebp
c0100719:	89 e5                	mov    %esp,%ebp
c010071b:	83 ec 18             	sub    $0x18,%esp
c010071e:	e8 80 fc ff ff       	call   c01003a3 <get_running_thread_pcb>
c0100723:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0100726:	e8 32 00 00 00       	call   c010075d <init_hd>
c010072b:	83 ec 0c             	sub    $0xc,%esp
c010072e:	6a 7c                	push   $0x7c
c0100730:	e8 47 0e 00 00       	call   c010157c <sys_malloc>
c0100735:	83 c4 10             	add    $0x10,%esp
c0100738:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010073b:	83 ec 04             	sub    $0x4,%esp
c010073e:	6a 7c                	push   $0x7c
c0100740:	6a 00                	push   $0x0
c0100742:	ff 75 f0             	pushl  -0x10(%ebp)
c0100745:	e8 21 ab 00 00       	call   c010b26b <Memset>
c010074a:	83 c4 10             	add    $0x10,%esp
c010074d:	83 ec 0c             	sub    $0xc,%esp
c0100750:	ff 75 f0             	pushl  -0x10(%ebp)
c0100753:	e8 1f 00 00 00       	call   c0100777 <hd_handle>
c0100758:	83 c4 10             	add    $0x10,%esp
c010075b:	eb de                	jmp    c010073b <TaskHD+0x23>

c010075d <init_hd>:
c010075d:	55                   	push   %ebp
c010075e:	89 e5                	mov    %esp,%ebp
c0100760:	83 ec 18             	sub    $0x18,%esp
c0100763:	c7 45 f4 75 04 00 00 	movl   $0x475,-0xc(%ebp)
c010076a:	e8 f0 fb ff ff       	call   c010035f <enable_8259A_casecade_irq>
c010076f:	e8 ff fb ff ff       	call   c0100373 <enable_8259A_slave_winchester_irq>
c0100774:	90                   	nop
c0100775:	c9                   	leave  
c0100776:	c3                   	ret    

c0100777 <hd_handle>:
c0100777:	55                   	push   %ebp
c0100778:	89 e5                	mov    %esp,%ebp
c010077a:	83 ec 18             	sub    $0x18,%esp
c010077d:	83 ec 04             	sub    $0x4,%esp
c0100780:	6a 12                	push   $0x12
c0100782:	ff 75 08             	pushl  0x8(%ebp)
c0100785:	6a 02                	push   $0x2
c0100787:	e8 0c 8b 00 00       	call   c0109298 <send_rec>
c010078c:	83 c4 10             	add    $0x10,%esp
c010078f:	8b 45 08             	mov    0x8(%ebp),%eax
c0100792:	8b 40 78             	mov    0x78(%eax),%eax
c0100795:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0100798:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010079c:	0f 84 d4 00 00 00    	je     c0100876 <hd_handle+0xff>
c01007a2:	8b 45 08             	mov    0x8(%ebp),%eax
c01007a5:	8b 00                	mov    (%eax),%eax
c01007a7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01007aa:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c01007ae:	74 28                	je     c01007d8 <hd_handle+0x61>
c01007b0:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c01007b4:	74 22                	je     c01007d8 <hd_handle+0x61>
c01007b6:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c01007ba:	74 1c                	je     c01007d8 <hd_handle+0x61>
c01007bc:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c01007c0:	74 16                	je     c01007d8 <hd_handle+0x61>
c01007c2:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c01007c9:	74 0d                	je     c01007d8 <hd_handle+0x61>
c01007cb:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c01007d2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01007d5:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01007d8:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c01007dc:	74 34                	je     c0100812 <hd_handle+0x9b>
c01007de:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c01007e2:	74 2e                	je     c0100812 <hd_handle+0x9b>
c01007e4:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c01007e8:	74 28                	je     c0100812 <hd_handle+0x9b>
c01007ea:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c01007ee:	74 22                	je     c0100812 <hd_handle+0x9b>
c01007f0:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c01007f7:	74 19                	je     c0100812 <hd_handle+0x9b>
c01007f9:	6a 6d                	push   $0x6d
c01007fb:	68 54 a3 10 c0       	push   $0xc010a354
c0100800:	68 54 a3 10 c0       	push   $0xc010a354
c0100805:	68 5c a3 10 c0       	push   $0xc010a35c
c010080a:	e8 19 7e 00 00       	call   c0108628 <assertion_failure>
c010080f:	83 c4 10             	add    $0x10,%esp
c0100812:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c0100816:	74 2c                	je     c0100844 <hd_handle+0xcd>
c0100818:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c010081c:	77 0e                	ja     c010082c <hd_handle+0xb5>
c010081e:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c0100822:	74 19                	je     c010083d <hd_handle+0xc6>
c0100824:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c0100828:	74 1a                	je     c0100844 <hd_handle+0xcd>
c010082a:	eb 37                	jmp    c0100863 <hd_handle+0xec>
c010082c:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c0100830:	74 22                	je     c0100854 <hd_handle+0xdd>
c0100832:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c0100839:	74 3e                	je     c0100879 <hd_handle+0x102>
c010083b:	eb 26                	jmp    c0100863 <hd_handle+0xec>
c010083d:	e8 e6 06 00 00       	call   c0100f28 <hd_open>
c0100842:	eb 36                	jmp    c010087a <hd_handle+0x103>
c0100844:	83 ec 0c             	sub    $0xc,%esp
c0100847:	ff 75 08             	pushl  0x8(%ebp)
c010084a:	e8 b2 08 00 00       	call   c0101101 <hd_rdwt>
c010084f:	83 c4 10             	add    $0x10,%esp
c0100852:	eb 26                	jmp    c010087a <hd_handle+0x103>
c0100854:	83 ec 0c             	sub    $0xc,%esp
c0100857:	6a 00                	push   $0x0
c0100859:	e8 71 07 00 00       	call   c0100fcf <get_hd_ioctl>
c010085e:	83 c4 10             	add    $0x10,%esp
c0100861:	eb 17                	jmp    c010087a <hd_handle+0x103>
c0100863:	83 ec 0c             	sub    $0xc,%esp
c0100866:	68 b6 a3 10 c0       	push   $0xc010a3b6
c010086b:	e8 74 7d 00 00       	call   c01085e4 <spin>
c0100870:	83 c4 10             	add    $0x10,%esp
c0100873:	90                   	nop
c0100874:	eb 04                	jmp    c010087a <hd_handle+0x103>
c0100876:	90                   	nop
c0100877:	eb 01                	jmp    c010087a <hd_handle+0x103>
c0100879:	90                   	nop
c010087a:	c9                   	leave  
c010087b:	c3                   	ret    

c010087c <hd_cmd_out>:
c010087c:	55                   	push   %ebp
c010087d:	89 e5                	mov    %esp,%ebp
c010087f:	83 ec 08             	sub    $0x8,%esp
c0100882:	83 ec 04             	sub    $0x4,%esp
c0100885:	68 18 73 01 00       	push   $0x17318
c010088a:	6a 00                	push   $0x0
c010088c:	68 80 00 00 00       	push   $0x80
c0100891:	e8 36 0b 00 00       	call   c01013cc <waitfor>
c0100896:	83 c4 10             	add    $0x10,%esp
c0100899:	85 c0                	test   %eax,%eax
c010089b:	75 10                	jne    c01008ad <hd_cmd_out+0x31>
c010089d:	83 ec 0c             	sub    $0xc,%esp
c01008a0:	68 c8 a3 10 c0       	push   $0xc010a3c8
c01008a5:	e8 60 7d 00 00       	call   c010860a <panic>
c01008aa:	83 c4 10             	add    $0x10,%esp
c01008ad:	83 ec 08             	sub    $0x8,%esp
c01008b0:	6a 00                	push   $0x0
c01008b2:	68 f6 03 00 00       	push   $0x3f6
c01008b7:	e8 e9 f9 ff ff       	call   c01002a5 <out_byte>
c01008bc:	83 c4 10             	add    $0x10,%esp
c01008bf:	8b 45 08             	mov    0x8(%ebp),%eax
c01008c2:	0f b6 00             	movzbl (%eax),%eax
c01008c5:	0f b6 c0             	movzbl %al,%eax
c01008c8:	83 ec 08             	sub    $0x8,%esp
c01008cb:	50                   	push   %eax
c01008cc:	68 f1 01 00 00       	push   $0x1f1
c01008d1:	e8 cf f9 ff ff       	call   c01002a5 <out_byte>
c01008d6:	83 c4 10             	add    $0x10,%esp
c01008d9:	8b 45 08             	mov    0x8(%ebp),%eax
c01008dc:	0f b6 40 01          	movzbl 0x1(%eax),%eax
c01008e0:	0f b6 c0             	movzbl %al,%eax
c01008e3:	83 ec 08             	sub    $0x8,%esp
c01008e6:	50                   	push   %eax
c01008e7:	68 f2 01 00 00       	push   $0x1f2
c01008ec:	e8 b4 f9 ff ff       	call   c01002a5 <out_byte>
c01008f1:	83 c4 10             	add    $0x10,%esp
c01008f4:	8b 45 08             	mov    0x8(%ebp),%eax
c01008f7:	0f b6 40 02          	movzbl 0x2(%eax),%eax
c01008fb:	0f b6 c0             	movzbl %al,%eax
c01008fe:	83 ec 08             	sub    $0x8,%esp
c0100901:	50                   	push   %eax
c0100902:	68 f3 01 00 00       	push   $0x1f3
c0100907:	e8 99 f9 ff ff       	call   c01002a5 <out_byte>
c010090c:	83 c4 10             	add    $0x10,%esp
c010090f:	8b 45 08             	mov    0x8(%ebp),%eax
c0100912:	0f b6 40 03          	movzbl 0x3(%eax),%eax
c0100916:	0f b6 c0             	movzbl %al,%eax
c0100919:	83 ec 08             	sub    $0x8,%esp
c010091c:	50                   	push   %eax
c010091d:	68 f4 01 00 00       	push   $0x1f4
c0100922:	e8 7e f9 ff ff       	call   c01002a5 <out_byte>
c0100927:	83 c4 10             	add    $0x10,%esp
c010092a:	8b 45 08             	mov    0x8(%ebp),%eax
c010092d:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0100931:	0f b6 c0             	movzbl %al,%eax
c0100934:	83 ec 08             	sub    $0x8,%esp
c0100937:	50                   	push   %eax
c0100938:	68 f5 01 00 00       	push   $0x1f5
c010093d:	e8 63 f9 ff ff       	call   c01002a5 <out_byte>
c0100942:	83 c4 10             	add    $0x10,%esp
c0100945:	8b 45 08             	mov    0x8(%ebp),%eax
c0100948:	0f b6 40 05          	movzbl 0x5(%eax),%eax
c010094c:	0f b6 c0             	movzbl %al,%eax
c010094f:	83 ec 08             	sub    $0x8,%esp
c0100952:	50                   	push   %eax
c0100953:	68 f6 01 00 00       	push   $0x1f6
c0100958:	e8 48 f9 ff ff       	call   c01002a5 <out_byte>
c010095d:	83 c4 10             	add    $0x10,%esp
c0100960:	8b 45 08             	mov    0x8(%ebp),%eax
c0100963:	0f b6 40 06          	movzbl 0x6(%eax),%eax
c0100967:	0f b6 c0             	movzbl %al,%eax
c010096a:	83 ec 08             	sub    $0x8,%esp
c010096d:	50                   	push   %eax
c010096e:	68 f7 01 00 00       	push   $0x1f7
c0100973:	e8 2d f9 ff ff       	call   c01002a5 <out_byte>
c0100978:	83 c4 10             	add    $0x10,%esp
c010097b:	90                   	nop
c010097c:	c9                   	leave  
c010097d:	c3                   	ret    

c010097e <hd_identify>:
c010097e:	55                   	push   %ebp
c010097f:	89 e5                	mov    %esp,%ebp
c0100981:	53                   	push   %ebx
c0100982:	83 ec 24             	sub    $0x24,%esp
c0100985:	89 e0                	mov    %esp,%eax
c0100987:	89 c3                	mov    %eax,%ebx
c0100989:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
c010098d:	c6 45 e6 01          	movb   $0x1,-0x1a(%ebp)
c0100991:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
c0100995:	c6 45 e8 00          	movb   $0x0,-0x18(%ebp)
c0100999:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c010099d:	8b 45 08             	mov    0x8(%ebp),%eax
c01009a0:	c1 e0 04             	shl    $0x4,%eax
c01009a3:	83 c8 e0             	or     $0xffffffe0,%eax
c01009a6:	88 45 ea             	mov    %al,-0x16(%ebp)
c01009a9:	c6 45 eb ec          	movb   $0xec,-0x15(%ebp)
c01009ad:	83 ec 0c             	sub    $0xc,%esp
c01009b0:	8d 45 e5             	lea    -0x1b(%ebp),%eax
c01009b3:	50                   	push   %eax
c01009b4:	e8 c3 fe ff ff       	call   c010087c <hd_cmd_out>
c01009b9:	83 c4 10             	add    $0x10,%esp
c01009bc:	e8 f0 06 00 00       	call   c01010b1 <interrupt_wait>
c01009c1:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c01009c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01009cb:	8d 50 ff             	lea    -0x1(%eax),%edx
c01009ce:	89 55 f0             	mov    %edx,-0x10(%ebp)
c01009d1:	89 c2                	mov    %eax,%edx
c01009d3:	b8 10 00 00 00       	mov    $0x10,%eax
c01009d8:	83 e8 01             	sub    $0x1,%eax
c01009db:	01 d0                	add    %edx,%eax
c01009dd:	b9 10 00 00 00       	mov    $0x10,%ecx
c01009e2:	ba 00 00 00 00       	mov    $0x0,%edx
c01009e7:	f7 f1                	div    %ecx
c01009e9:	6b c0 10             	imul   $0x10,%eax,%eax
c01009ec:	29 c4                	sub    %eax,%esp
c01009ee:	89 e0                	mov    %esp,%eax
c01009f0:	83 c0 00             	add    $0x0,%eax
c01009f3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01009f6:	83 ec 04             	sub    $0x4,%esp
c01009f9:	ff 75 f4             	pushl  -0xc(%ebp)
c01009fc:	6a 00                	push   $0x0
c01009fe:	ff 75 ec             	pushl  -0x14(%ebp)
c0100a01:	e8 65 a8 00 00       	call   c010b26b <Memset>
c0100a06:	83 c4 10             	add    $0x10,%esp
c0100a09:	83 ec 04             	sub    $0x4,%esp
c0100a0c:	ff 75 f4             	pushl  -0xc(%ebp)
c0100a0f:	ff 75 ec             	pushl  -0x14(%ebp)
c0100a12:	68 f0 01 00 00       	push   $0x1f0
c0100a17:	e8 a3 a8 00 00       	call   c010b2bf <read_port>
c0100a1c:	83 c4 10             	add    $0x10,%esp
c0100a1f:	83 ec 0c             	sub    $0xc,%esp
c0100a22:	ff 75 ec             	pushl  -0x14(%ebp)
c0100a25:	e8 0b 00 00 00       	call   c0100a35 <print_hdinfo>
c0100a2a:	83 c4 10             	add    $0x10,%esp
c0100a2d:	89 dc                	mov    %ebx,%esp
c0100a2f:	90                   	nop
c0100a30:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100a33:	c9                   	leave  
c0100a34:	c3                   	ret    

c0100a35 <print_hdinfo>:
c0100a35:	55                   	push   %ebp
c0100a36:	89 e5                	mov    %esp,%ebp
c0100a38:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0100a3e:	66 c7 45 b4 0a 00    	movw   $0xa,-0x4c(%ebp)
c0100a44:	66 c7 45 b6 14 00    	movw   $0x14,-0x4a(%ebp)
c0100a4a:	c7 45 b8 53 65 72 69 	movl   $0x69726553,-0x48(%ebp)
c0100a51:	c7 45 bc 61 6c 20 4e 	movl   $0x4e206c61,-0x44(%ebp)
c0100a58:	c7 45 c0 75 6d 62 65 	movl   $0x65626d75,-0x40(%ebp)
c0100a5f:	c7 45 c4 72 00 00 00 	movl   $0x72,-0x3c(%ebp)
c0100a66:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0100a6d:	66 c7 45 cc 1b 00    	movw   $0x1b,-0x34(%ebp)
c0100a73:	66 c7 45 ce 28 00    	movw   $0x28,-0x32(%ebp)
c0100a79:	c7 45 d0 4d 6f 64 65 	movl   $0x65646f4d,-0x30(%ebp)
c0100a80:	c7 45 d4 6c 20 4e 75 	movl   $0x754e206c,-0x2c(%ebp)
c0100a87:	c7 45 d8 6d 62 65 72 	movl   $0x7265626d,-0x28(%ebp)
c0100a8e:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0100a95:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0100a9c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100aa3:	e9 8f 00 00 00       	jmp    c0100b37 <print_hdinfo+0x102>
c0100aa8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0100aaf:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100ab2:	89 d0                	mov    %edx,%eax
c0100ab4:	01 c0                	add    %eax,%eax
c0100ab6:	01 d0                	add    %edx,%eax
c0100ab8:	c1 e0 03             	shl    $0x3,%eax
c0100abb:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100abe:	01 c8                	add    %ecx,%eax
c0100ac0:	83 e8 44             	sub    $0x44,%eax
c0100ac3:	0f b7 00             	movzwl (%eax),%eax
c0100ac6:	0f b7 c0             	movzwl %ax,%eax
c0100ac9:	8d 14 00             	lea    (%eax,%eax,1),%edx
c0100acc:	8b 45 08             	mov    0x8(%ebp),%eax
c0100acf:	01 d0                	add    %edx,%eax
c0100ad1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0100ad4:	eb 30                	jmp    c0100b06 <print_hdinfo+0xd1>
c0100ad6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100ad9:	8d 50 01             	lea    0x1(%eax),%edx
c0100adc:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0100adf:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0100ae2:	83 c2 01             	add    $0x1,%edx
c0100ae5:	0f b6 00             	movzbl (%eax),%eax
c0100ae8:	88 44 15 81          	mov    %al,-0x7f(%ebp,%edx,1)
c0100aec:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100aef:	8d 50 01             	lea    0x1(%eax),%edx
c0100af2:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0100af5:	0f b6 00             	movzbl (%eax),%eax
c0100af8:	8d 4d 81             	lea    -0x7f(%ebp),%ecx
c0100afb:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0100afe:	01 ca                	add    %ecx,%edx
c0100b00:	88 02                	mov    %al,(%edx)
c0100b02:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0100b06:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100b09:	89 d0                	mov    %edx,%eax
c0100b0b:	01 c0                	add    %eax,%eax
c0100b0d:	01 d0                	add    %edx,%eax
c0100b0f:	c1 e0 03             	shl    $0x3,%eax
c0100b12:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100b15:	01 c8                	add    %ecx,%eax
c0100b17:	83 e8 42             	sub    $0x42,%eax
c0100b1a:	0f b7 00             	movzwl (%eax),%eax
c0100b1d:	66 d1 e8             	shr    %ax
c0100b20:	0f b7 c0             	movzwl %ax,%eax
c0100b23:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0100b26:	7c ae                	jl     c0100ad6 <print_hdinfo+0xa1>
c0100b28:	8d 55 81             	lea    -0x7f(%ebp),%edx
c0100b2b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100b2e:	01 d0                	add    %edx,%eax
c0100b30:	c6 00 00             	movb   $0x0,(%eax)
c0100b33:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0100b37:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0100b3b:	0f 8e 67 ff ff ff    	jle    c0100aa8 <print_hdinfo+0x73>
c0100b41:	8b 45 08             	mov    0x8(%ebp),%eax
c0100b44:	0f b7 40 62          	movzwl 0x62(%eax),%eax
c0100b48:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
c0100b4c:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0100b50:	66 c1 e8 08          	shr    $0x8,%ax
c0100b54:	66 85 c0             	test   %ax,%ax
c0100b57:	0f 95 c0             	setne  %al
c0100b5a:	88 45 e9             	mov    %al,-0x17(%ebp)
c0100b5d:	c7 45 ac 59 65 73 00 	movl   $0x736559,-0x54(%ebp)
c0100b64:	66 c7 45 a9 4e 6f    	movw   $0x6f4e,-0x57(%ebp)
c0100b6a:	c6 45 ab 00          	movb   $0x0,-0x55(%ebp)
c0100b6e:	80 7d e9 01          	cmpb   $0x1,-0x17(%ebp)
c0100b72:	75 15                	jne    c0100b89 <print_hdinfo+0x154>
c0100b74:	83 ec 08             	sub    $0x8,%esp
c0100b77:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0100b7a:	50                   	push   %eax
c0100b7b:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0100b7e:	50                   	push   %eax
c0100b7f:	e8 06 a7 00 00       	call   c010b28a <Strcpy>
c0100b84:	83 c4 10             	add    $0x10,%esp
c0100b87:	eb 13                	jmp    c0100b9c <print_hdinfo+0x167>
c0100b89:	83 ec 08             	sub    $0x8,%esp
c0100b8c:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0100b8f:	50                   	push   %eax
c0100b90:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0100b93:	50                   	push   %eax
c0100b94:	e8 f1 a6 00 00       	call   c010b28a <Strcpy>
c0100b99:	83 c4 10             	add    $0x10,%esp
c0100b9c:	8b 45 08             	mov    0x8(%ebp),%eax
c0100b9f:	83 c0 7a             	add    $0x7a,%eax
c0100ba2:	0f b7 00             	movzwl (%eax),%eax
c0100ba5:	0f b7 d0             	movzwl %ax,%edx
c0100ba8:	8b 45 08             	mov    0x8(%ebp),%eax
c0100bab:	83 c0 78             	add    $0x78,%eax
c0100bae:	0f b7 00             	movzwl (%eax),%eax
c0100bb1:	0f b7 c0             	movzwl %ax,%eax
c0100bb4:	83 c0 10             	add    $0x10,%eax
c0100bb7:	89 c1                	mov    %eax,%ecx
c0100bb9:	d3 e2                	shl    %cl,%edx
c0100bbb:	89 d0                	mov    %edx,%eax
c0100bbd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0100bc0:	90                   	nop
c0100bc1:	c9                   	leave  
c0100bc2:	c3                   	ret    

c0100bc3 <print_dpt_entry>:
c0100bc3:	55                   	push   %ebp
c0100bc4:	89 e5                	mov    %esp,%ebp
c0100bc6:	83 ec 08             	sub    $0x8,%esp
c0100bc9:	8b 45 08             	mov    0x8(%ebp),%eax
c0100bcc:	8b 40 08             	mov    0x8(%eax),%eax
c0100bcf:	83 ec 08             	sub    $0x8,%esp
c0100bd2:	50                   	push   %eax
c0100bd3:	68 d2 a3 10 c0       	push   $0xc010a3d2
c0100bd8:	e8 ee 76 00 00       	call   c01082cb <Printf>
c0100bdd:	83 c4 10             	add    $0x10,%esp
c0100be0:	8b 45 08             	mov    0x8(%ebp),%eax
c0100be3:	8b 40 0c             	mov    0xc(%eax),%eax
c0100be6:	83 ec 08             	sub    $0x8,%esp
c0100be9:	50                   	push   %eax
c0100bea:	68 da a3 10 c0       	push   $0xc010a3da
c0100bef:	e8 d7 76 00 00       	call   c01082cb <Printf>
c0100bf4:	83 c4 10             	add    $0x10,%esp
c0100bf7:	8b 45 08             	mov    0x8(%ebp),%eax
c0100bfa:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0100bfe:	0f b6 c0             	movzbl %al,%eax
c0100c01:	83 ec 08             	sub    $0x8,%esp
c0100c04:	50                   	push   %eax
c0100c05:	68 eb a3 10 c0       	push   $0xc010a3eb
c0100c0a:	e8 bc 76 00 00       	call   c01082cb <Printf>
c0100c0f:	83 c4 10             	add    $0x10,%esp
c0100c12:	8b 45 08             	mov    0x8(%ebp),%eax
c0100c15:	0f b6 00             	movzbl (%eax),%eax
c0100c18:	0f b6 c0             	movzbl %al,%eax
c0100c1b:	83 ec 08             	sub    $0x8,%esp
c0100c1e:	50                   	push   %eax
c0100c1f:	68 f9 a3 10 c0       	push   $0xc010a3f9
c0100c24:	e8 a2 76 00 00       	call   c01082cb <Printf>
c0100c29:	83 c4 10             	add    $0x10,%esp
c0100c2c:	90                   	nop
c0100c2d:	c9                   	leave  
c0100c2e:	c3                   	ret    

c0100c2f <get_partition_table>:
c0100c2f:	55                   	push   %ebp
c0100c30:	89 e5                	mov    %esp,%ebp
c0100c32:	53                   	push   %ebx
c0100c33:	83 ec 24             	sub    $0x24,%esp
c0100c36:	89 e0                	mov    %esp,%eax
c0100c38:	89 c3                	mov    %eax,%ebx
c0100c3a:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
c0100c3e:	c6 45 e2 01          	movb   $0x1,-0x1e(%ebp)
c0100c42:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100c45:	88 45 e3             	mov    %al,-0x1d(%ebp)
c0100c48:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100c4b:	c1 f8 08             	sar    $0x8,%eax
c0100c4e:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0100c51:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100c54:	c1 f8 10             	sar    $0x10,%eax
c0100c57:	88 45 e5             	mov    %al,-0x1b(%ebp)
c0100c5a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100c5d:	c1 f8 18             	sar    $0x18,%eax
c0100c60:	89 c2                	mov    %eax,%edx
c0100c62:	8b 45 08             	mov    0x8(%ebp),%eax
c0100c65:	c1 e0 04             	shl    $0x4,%eax
c0100c68:	09 d0                	or     %edx,%eax
c0100c6a:	83 c8 e0             	or     $0xffffffe0,%eax
c0100c6d:	88 45 e6             	mov    %al,-0x1a(%ebp)
c0100c70:	c6 45 e7 20          	movb   $0x20,-0x19(%ebp)
c0100c74:	83 ec 0c             	sub    $0xc,%esp
c0100c77:	8d 45 e1             	lea    -0x1f(%ebp),%eax
c0100c7a:	50                   	push   %eax
c0100c7b:	e8 fc fb ff ff       	call   c010087c <hd_cmd_out>
c0100c80:	83 c4 10             	add    $0x10,%esp
c0100c83:	e8 29 04 00 00       	call   c01010b1 <interrupt_wait>
c0100c88:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c0100c8f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100c92:	8d 50 ff             	lea    -0x1(%eax),%edx
c0100c95:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0100c98:	89 c2                	mov    %eax,%edx
c0100c9a:	b8 10 00 00 00       	mov    $0x10,%eax
c0100c9f:	83 e8 01             	sub    $0x1,%eax
c0100ca2:	01 d0                	add    %edx,%eax
c0100ca4:	b9 10 00 00 00       	mov    $0x10,%ecx
c0100ca9:	ba 00 00 00 00       	mov    $0x0,%edx
c0100cae:	f7 f1                	div    %ecx
c0100cb0:	6b c0 10             	imul   $0x10,%eax,%eax
c0100cb3:	29 c4                	sub    %eax,%esp
c0100cb5:	89 e0                	mov    %esp,%eax
c0100cb7:	83 c0 00             	add    $0x0,%eax
c0100cba:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0100cbd:	83 ec 04             	sub    $0x4,%esp
c0100cc0:	ff 75 f4             	pushl  -0xc(%ebp)
c0100cc3:	6a 00                	push   $0x0
c0100cc5:	ff 75 ec             	pushl  -0x14(%ebp)
c0100cc8:	e8 9e a5 00 00       	call   c010b26b <Memset>
c0100ccd:	83 c4 10             	add    $0x10,%esp
c0100cd0:	83 ec 04             	sub    $0x4,%esp
c0100cd3:	ff 75 f4             	pushl  -0xc(%ebp)
c0100cd6:	ff 75 ec             	pushl  -0x14(%ebp)
c0100cd9:	68 f0 01 00 00       	push   $0x1f0
c0100cde:	e8 dc a5 00 00       	call   c010b2bf <read_port>
c0100ce3:	83 c4 10             	add    $0x10,%esp
c0100ce6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100ce9:	05 be 01 00 00       	add    $0x1be,%eax
c0100cee:	83 ec 04             	sub    $0x4,%esp
c0100cf1:	6a 40                	push   $0x40
c0100cf3:	50                   	push   %eax
c0100cf4:	ff 75 10             	pushl  0x10(%ebp)
c0100cf7:	e8 fd 5e 00 00       	call   c0106bf9 <Memcpy>
c0100cfc:	83 c4 10             	add    $0x10,%esp
c0100cff:	c7 45 e8 05 00 00 00 	movl   $0x5,-0x18(%ebp)
c0100d06:	89 dc                	mov    %ebx,%esp
c0100d08:	90                   	nop
c0100d09:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100d0c:	c9                   	leave  
c0100d0d:	c3                   	ret    

c0100d0e <partition>:
c0100d0e:	55                   	push   %ebp
c0100d0f:	89 e5                	mov    %esp,%ebp
c0100d11:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0100d17:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100d1a:	88 45 84             	mov    %al,-0x7c(%ebp)
c0100d1d:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c0100d21:	7f 19                	jg     c0100d3c <partition+0x2e>
c0100d23:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0100d26:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0100d2b:	89 c8                	mov    %ecx,%eax
c0100d2d:	f7 ea                	imul   %edx
c0100d2f:	d1 fa                	sar    %edx
c0100d31:	89 c8                	mov    %ecx,%eax
c0100d33:	c1 f8 1f             	sar    $0x1f,%eax
c0100d36:	29 c2                	sub    %eax,%edx
c0100d38:	89 d0                	mov    %edx,%eax
c0100d3a:	eb 11                	jmp    c0100d4d <partition+0x3f>
c0100d3c:	8b 45 08             	mov    0x8(%ebp),%eax
c0100d3f:	83 e8 10             	sub    $0x10,%eax
c0100d42:	8d 50 3f             	lea    0x3f(%eax),%edx
c0100d45:	85 c0                	test   %eax,%eax
c0100d47:	0f 48 c2             	cmovs  %edx,%eax
c0100d4a:	c1 f8 06             	sar    $0x6,%eax
c0100d4d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0100d50:	80 7d 84 00          	cmpb   $0x0,-0x7c(%ebp)
c0100d54:	0f 85 cc 00 00 00    	jne    c0100e26 <partition+0x118>
c0100d5a:	83 ec 04             	sub    $0x4,%esp
c0100d5d:	6a 40                	push   $0x40
c0100d5f:	6a 00                	push   $0x0
c0100d61:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100d64:	50                   	push   %eax
c0100d65:	e8 01 a5 00 00       	call   c010b26b <Memset>
c0100d6a:	83 c4 10             	add    $0x10,%esp
c0100d6d:	83 ec 04             	sub    $0x4,%esp
c0100d70:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100d73:	50                   	push   %eax
c0100d74:	6a 00                	push   $0x0
c0100d76:	ff 75 e8             	pushl  -0x18(%ebp)
c0100d79:	e8 b1 fe ff ff       	call   c0100c2f <get_partition_table>
c0100d7e:	83 c4 10             	add    $0x10,%esp
c0100d81:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100d88:	e9 8a 00 00 00       	jmp    c0100e17 <partition+0x109>
c0100d8d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100d90:	83 c0 01             	add    $0x1,%eax
c0100d93:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0100d96:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100d99:	c1 e0 04             	shl    $0x4,%eax
c0100d9c:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100d9f:	01 c8                	add    %ecx,%eax
c0100da1:	83 e8 5c             	sub    $0x5c,%eax
c0100da4:	8b 00                	mov    (%eax),%eax
c0100da6:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0100da9:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0100dac:	c1 e1 03             	shl    $0x3,%ecx
c0100daf:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0100db5:	01 ca                	add    %ecx,%edx
c0100db7:	81 c2 44 0f 11 c0    	add    $0xc0110f44,%edx
c0100dbd:	89 02                	mov    %eax,(%edx)
c0100dbf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100dc2:	c1 e0 04             	shl    $0x4,%eax
c0100dc5:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100dc8:	01 c8                	add    %ecx,%eax
c0100dca:	83 e8 58             	sub    $0x58,%eax
c0100dcd:	8b 00                	mov    (%eax),%eax
c0100dcf:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0100dd2:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0100dd5:	c1 e1 03             	shl    $0x3,%ecx
c0100dd8:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0100dde:	01 ca                	add    %ecx,%edx
c0100de0:	81 c2 48 0f 11 c0    	add    $0xc0110f48,%edx
c0100de6:	89 02                	mov    %eax,(%edx)
c0100de8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100deb:	c1 e0 04             	shl    $0x4,%eax
c0100dee:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100df1:	01 c8                	add    %ecx,%eax
c0100df3:	83 e8 60             	sub    $0x60,%eax
c0100df6:	0f b6 00             	movzbl (%eax),%eax
c0100df9:	3c 05                	cmp    $0x5,%al
c0100dfb:	75 16                	jne    c0100e13 <partition+0x105>
c0100dfd:	8b 55 08             	mov    0x8(%ebp),%edx
c0100e00:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100e03:	01 d0                	add    %edx,%eax
c0100e05:	83 ec 08             	sub    $0x8,%esp
c0100e08:	6a 01                	push   $0x1
c0100e0a:	50                   	push   %eax
c0100e0b:	e8 fe fe ff ff       	call   c0100d0e <partition>
c0100e10:	83 c4 10             	add    $0x10,%esp
c0100e13:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0100e17:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c0100e1b:	0f 8e 6c ff ff ff    	jle    c0100d8d <partition+0x7f>
c0100e21:	e9 ff 00 00 00       	jmp    c0100f25 <partition+0x217>
c0100e26:	80 7d 84 01          	cmpb   $0x1,-0x7c(%ebp)
c0100e2a:	0f 85 f5 00 00 00    	jne    c0100f25 <partition+0x217>
c0100e30:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0100e33:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0100e38:	89 c8                	mov    %ecx,%eax
c0100e3a:	f7 ea                	imul   %edx
c0100e3c:	d1 fa                	sar    %edx
c0100e3e:	89 c8                	mov    %ecx,%eax
c0100e40:	c1 f8 1f             	sar    $0x1f,%eax
c0100e43:	29 c2                	sub    %eax,%edx
c0100e45:	89 d0                	mov    %edx,%eax
c0100e47:	c1 e0 02             	shl    $0x2,%eax
c0100e4a:	01 d0                	add    %edx,%eax
c0100e4c:	29 c1                	sub    %eax,%ecx
c0100e4e:	89 c8                	mov    %ecx,%eax
c0100e50:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0100e53:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0100e56:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100e59:	c1 e2 03             	shl    $0x3,%edx
c0100e5c:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0100e62:	01 d0                	add    %edx,%eax
c0100e64:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c0100e69:	8b 00                	mov    (%eax),%eax
c0100e6b:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0100e6e:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0100e71:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100e74:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0100e77:	83 e8 01             	sub    $0x1,%eax
c0100e7a:	c1 e0 04             	shl    $0x4,%eax
c0100e7d:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0100e80:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0100e87:	e9 8c 00 00 00       	jmp    c0100f18 <partition+0x20a>
c0100e8c:	83 ec 04             	sub    $0x4,%esp
c0100e8f:	6a 40                	push   $0x40
c0100e91:	6a 00                	push   $0x0
c0100e93:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100e96:	50                   	push   %eax
c0100e97:	e8 cf a3 00 00       	call   c010b26b <Memset>
c0100e9c:	83 c4 10             	add    $0x10,%esp
c0100e9f:	83 ec 04             	sub    $0x4,%esp
c0100ea2:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100ea5:	50                   	push   %eax
c0100ea6:	ff 75 f0             	pushl  -0x10(%ebp)
c0100ea9:	ff 75 e8             	pushl  -0x18(%ebp)
c0100eac:	e8 7e fd ff ff       	call   c0100c2f <get_partition_table>
c0100eb1:	83 c4 10             	add    $0x10,%esp
c0100eb4:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0100eb7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100eba:	01 d0                	add    %edx,%eax
c0100ebc:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0100ebf:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0100ec2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100ec5:	01 c2                	add    %eax,%edx
c0100ec7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0100eca:	8d 48 04             	lea    0x4(%eax),%ecx
c0100ecd:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100ed0:	c1 e1 03             	shl    $0x3,%ecx
c0100ed3:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0100ed9:	01 c8                	add    %ecx,%eax
c0100edb:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c0100ee0:	89 10                	mov    %edx,(%eax)
c0100ee2:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0100ee5:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0100ee8:	8d 4a 04             	lea    0x4(%edx),%ecx
c0100eeb:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0100eee:	c1 e1 03             	shl    $0x3,%ecx
c0100ef1:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0100ef7:	01 ca                	add    %ecx,%edx
c0100ef9:	81 c2 48 0f 11 c0    	add    $0xc0110f48,%edx
c0100eff:	89 02                	mov    %eax,(%edx)
c0100f01:	0f b6 45 a8          	movzbl -0x58(%ebp),%eax
c0100f05:	84 c0                	test   %al,%al
c0100f07:	74 1b                	je     c0100f24 <partition+0x216>
c0100f09:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0100f0c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0100f0f:	01 d0                	add    %edx,%eax
c0100f11:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100f14:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0100f18:	83 7d ec 0f          	cmpl   $0xf,-0x14(%ebp)
c0100f1c:	0f 8e 6a ff ff ff    	jle    c0100e8c <partition+0x17e>
c0100f22:	eb 01                	jmp    c0100f25 <partition+0x217>
c0100f24:	90                   	nop
c0100f25:	90                   	nop
c0100f26:	c9                   	leave  
c0100f27:	c3                   	ret    

c0100f28 <hd_open>:
c0100f28:	55                   	push   %ebp
c0100f29:	89 e5                	mov    %esp,%ebp
c0100f2b:	83 ec 18             	sub    $0x18,%esp
c0100f2e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100f35:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100f38:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0100f3e:	05 40 0f 11 c0       	add    $0xc0110f40,%eax
c0100f43:	8b 00                	mov    (%eax),%eax
c0100f45:	8d 50 01             	lea    0x1(%eax),%edx
c0100f48:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100f4b:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0100f51:	05 40 0f 11 c0       	add    $0xc0110f40,%eax
c0100f56:	89 10                	mov    %edx,(%eax)
c0100f58:	83 ec 0c             	sub    $0xc,%esp
c0100f5b:	6a 00                	push   $0x0
c0100f5d:	e8 1c fa ff ff       	call   c010097e <hd_identify>
c0100f62:	83 c4 10             	add    $0x10,%esp
c0100f65:	83 ec 08             	sub    $0x8,%esp
c0100f68:	6a 00                	push   $0x0
c0100f6a:	6a 00                	push   $0x0
c0100f6c:	e8 9d fd ff ff       	call   c0100d0e <partition>
c0100f71:	83 c4 10             	add    $0x10,%esp
c0100f74:	83 ec 0c             	sub    $0xc,%esp
c0100f77:	6a 7c                	push   $0x7c
c0100f79:	e8 fe 05 00 00       	call   c010157c <sys_malloc>
c0100f7e:	83 c4 10             	add    $0x10,%esp
c0100f81:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100f84:	83 ec 04             	sub    $0x4,%esp
c0100f87:	6a 7c                	push   $0x7c
c0100f89:	6a 00                	push   $0x0
c0100f8b:	ff 75 f0             	pushl  -0x10(%ebp)
c0100f8e:	e8 d8 a2 00 00       	call   c010b26b <Memset>
c0100f93:	83 c4 10             	add    $0x10,%esp
c0100f96:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100f99:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0100fa0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100fa3:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0100faa:	83 ec 04             	sub    $0x4,%esp
c0100fad:	6a 02                	push   $0x2
c0100faf:	ff 75 f0             	pushl  -0x10(%ebp)
c0100fb2:	6a 01                	push   $0x1
c0100fb4:	e8 df 82 00 00       	call   c0109298 <send_rec>
c0100fb9:	83 c4 10             	add    $0x10,%esp
c0100fbc:	83 ec 08             	sub    $0x8,%esp
c0100fbf:	6a 7c                	push   $0x7c
c0100fc1:	ff 75 f0             	pushl  -0x10(%ebp)
c0100fc4:	e8 c8 05 00 00       	call   c0101591 <sys_free>
c0100fc9:	83 c4 10             	add    $0x10,%esp
c0100fcc:	90                   	nop
c0100fcd:	c9                   	leave  
c0100fce:	c3                   	ret    

c0100fcf <get_hd_ioctl>:
c0100fcf:	55                   	push   %ebp
c0100fd0:	89 e5                	mov    %esp,%ebp
c0100fd2:	83 ec 18             	sub    $0x18,%esp
c0100fd5:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c0100fd9:	7f 19                	jg     c0100ff4 <get_hd_ioctl+0x25>
c0100fdb:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0100fde:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0100fe3:	89 c8                	mov    %ecx,%eax
c0100fe5:	f7 ea                	imul   %edx
c0100fe7:	d1 fa                	sar    %edx
c0100fe9:	89 c8                	mov    %ecx,%eax
c0100feb:	c1 f8 1f             	sar    $0x1f,%eax
c0100fee:	29 c2                	sub    %eax,%edx
c0100ff0:	89 d0                	mov    %edx,%eax
c0100ff2:	eb 11                	jmp    c0101005 <get_hd_ioctl+0x36>
c0100ff4:	8b 45 08             	mov    0x8(%ebp),%eax
c0100ff7:	83 e8 10             	sub    $0x10,%eax
c0100ffa:	8d 50 3f             	lea    0x3f(%eax),%edx
c0100ffd:	85 c0                	test   %eax,%eax
c0100fff:	0f 48 c2             	cmovs  %edx,%eax
c0101002:	c1 f8 06             	sar    $0x6,%eax
c0101005:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101008:	8b 55 08             	mov    0x8(%ebp),%edx
c010100b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010100e:	c1 e2 03             	shl    $0x3,%edx
c0101011:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0101017:	01 d0                	add    %edx,%eax
c0101019:	05 48 0f 11 c0       	add    $0xc0110f48,%eax
c010101e:	8b 00                	mov    (%eax),%eax
c0101020:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0101023:	83 ec 0c             	sub    $0xc,%esp
c0101026:	6a 7c                	push   $0x7c
c0101028:	e8 4f 05 00 00       	call   c010157c <sys_malloc>
c010102d:	83 c4 10             	add    $0x10,%esp
c0101030:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0101033:	83 ec 04             	sub    $0x4,%esp
c0101036:	6a 7c                	push   $0x7c
c0101038:	6a 00                	push   $0x0
c010103a:	ff 75 ec             	pushl  -0x14(%ebp)
c010103d:	e8 29 a2 00 00       	call   c010b26b <Memset>
c0101042:	83 c4 10             	add    $0x10,%esp
c0101045:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101048:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c010104f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101052:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0101059:	83 ec 04             	sub    $0x4,%esp
c010105c:	6a 02                	push   $0x2
c010105e:	ff 75 ec             	pushl  -0x14(%ebp)
c0101061:	6a 01                	push   $0x1
c0101063:	e8 30 82 00 00       	call   c0109298 <send_rec>
c0101068:	83 c4 10             	add    $0x10,%esp
c010106b:	83 ec 08             	sub    $0x8,%esp
c010106e:	6a 7c                	push   $0x7c
c0101070:	ff 75 ec             	pushl  -0x14(%ebp)
c0101073:	e8 19 05 00 00       	call   c0101591 <sys_free>
c0101078:	83 c4 10             	add    $0x10,%esp
c010107b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010107e:	c9                   	leave  
c010107f:	c3                   	ret    

c0101080 <wait_for>:
c0101080:	55                   	push   %ebp
c0101081:	89 e5                	mov    %esp,%ebp
c0101083:	83 ec 08             	sub    $0x8,%esp
c0101086:	83 ec 04             	sub    $0x4,%esp
c0101089:	68 50 c3 00 00       	push   $0xc350
c010108e:	6a 08                	push   $0x8
c0101090:	6a 08                	push   $0x8
c0101092:	e8 35 03 00 00       	call   c01013cc <waitfor>
c0101097:	83 c4 10             	add    $0x10,%esp
c010109a:	85 c0                	test   %eax,%eax
c010109c:	75 10                	jne    c01010ae <wait_for+0x2e>
c010109e:	83 ec 0c             	sub    $0xc,%esp
c01010a1:	68 04 a4 10 c0       	push   $0xc010a404
c01010a6:	e8 5f 75 00 00       	call   c010860a <panic>
c01010ab:	83 c4 10             	add    $0x10,%esp
c01010ae:	90                   	nop
c01010af:	c9                   	leave  
c01010b0:	c3                   	ret    

c01010b1 <interrupt_wait>:
c01010b1:	55                   	push   %ebp
c01010b2:	89 e5                	mov    %esp,%ebp
c01010b4:	83 ec 18             	sub    $0x18,%esp
c01010b7:	83 ec 0c             	sub    $0xc,%esp
c01010ba:	6a 7c                	push   $0x7c
c01010bc:	e8 bb 04 00 00       	call   c010157c <sys_malloc>
c01010c1:	83 c4 10             	add    $0x10,%esp
c01010c4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01010c7:	83 ec 04             	sub    $0x4,%esp
c01010ca:	6a 7c                	push   $0x7c
c01010cc:	6a 00                	push   $0x0
c01010ce:	ff 75 f4             	pushl  -0xc(%ebp)
c01010d1:	e8 95 a1 00 00       	call   c010b26b <Memset>
c01010d6:	83 c4 10             	add    $0x10,%esp
c01010d9:	83 ec 04             	sub    $0x4,%esp
c01010dc:	68 13 02 00 00       	push   $0x213
c01010e1:	ff 75 f4             	pushl  -0xc(%ebp)
c01010e4:	6a 02                	push   $0x2
c01010e6:	e8 ad 81 00 00       	call   c0109298 <send_rec>
c01010eb:	83 c4 10             	add    $0x10,%esp
c01010ee:	83 ec 08             	sub    $0x8,%esp
c01010f1:	6a 7c                	push   $0x7c
c01010f3:	ff 75 f4             	pushl  -0xc(%ebp)
c01010f6:	e8 96 04 00 00       	call   c0101591 <sys_free>
c01010fb:	83 c4 10             	add    $0x10,%esp
c01010fe:	90                   	nop
c01010ff:	c9                   	leave  
c0101100:	c3                   	ret    

c0101101 <hd_rdwt>:
c0101101:	55                   	push   %ebp
c0101102:	89 e5                	mov    %esp,%ebp
c0101104:	81 ec c8 00 00 00    	sub    $0xc8,%esp
c010110a:	8b 45 08             	mov    0x8(%ebp),%eax
c010110d:	8b 40 18             	mov    0x18(%eax),%eax
c0101110:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0101113:	8b 45 08             	mov    0x8(%ebp),%eax
c0101116:	8b 40 14             	mov    0x14(%eax),%eax
c0101119:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010111c:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c0101120:	7f 19                	jg     c010113b <hd_rdwt+0x3a>
c0101122:	8b 4d e8             	mov    -0x18(%ebp),%ecx
c0101125:	ba 67 66 66 66       	mov    $0x66666667,%edx
c010112a:	89 c8                	mov    %ecx,%eax
c010112c:	f7 ea                	imul   %edx
c010112e:	d1 fa                	sar    %edx
c0101130:	89 c8                	mov    %ecx,%eax
c0101132:	c1 f8 1f             	sar    $0x1f,%eax
c0101135:	29 c2                	sub    %eax,%edx
c0101137:	89 d0                	mov    %edx,%eax
c0101139:	eb 11                	jmp    c010114c <hd_rdwt+0x4b>
c010113b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010113e:	83 e8 10             	sub    $0x10,%eax
c0101141:	8d 50 3f             	lea    0x3f(%eax),%edx
c0101144:	85 c0                	test   %eax,%eax
c0101146:	0f 48 c2             	cmovs  %edx,%eax
c0101149:	c1 f8 06             	sar    $0x6,%eax
c010114c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010114f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101152:	8d 50 f0             	lea    -0x10(%eax),%edx
c0101155:	89 d0                	mov    %edx,%eax
c0101157:	c1 f8 1f             	sar    $0x1f,%eax
c010115a:	c1 e8 1a             	shr    $0x1a,%eax
c010115d:	01 c2                	add    %eax,%edx
c010115f:	83 e2 3f             	and    $0x3f,%edx
c0101162:	29 c2                	sub    %eax,%edx
c0101164:	89 d0                	mov    %edx,%eax
c0101166:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0101169:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010116c:	c1 e8 09             	shr    $0x9,%eax
c010116f:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0101172:	83 7d e8 08          	cmpl   $0x8,-0x18(%ebp)
c0101176:	7f 1a                	jg     c0101192 <hd_rdwt+0x91>
c0101178:	8b 55 e8             	mov    -0x18(%ebp),%edx
c010117b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010117e:	c1 e2 03             	shl    $0x3,%edx
c0101181:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0101187:	01 d0                	add    %edx,%eax
c0101189:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c010118e:	8b 00                	mov    (%eax),%eax
c0101190:	eb 1b                	jmp    c01011ad <hd_rdwt+0xac>
c0101192:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101195:	8d 50 04             	lea    0x4(%eax),%edx
c0101198:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010119b:	c1 e2 03             	shl    $0x3,%edx
c010119e:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c01011a4:	01 d0                	add    %edx,%eax
c01011a6:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c01011ab:	8b 00                	mov    (%eax),%eax
c01011ad:	8b 55 dc             	mov    -0x24(%ebp),%edx
c01011b0:	01 d0                	add    %edx,%eax
c01011b2:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01011b5:	8b 45 08             	mov    0x8(%ebp),%eax
c01011b8:	8b 40 0c             	mov    0xc(%eax),%eax
c01011bb:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01011be:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01011c1:	05 ff 01 00 00       	add    $0x1ff,%eax
c01011c6:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c01011cc:	85 c0                	test   %eax,%eax
c01011ce:	0f 48 c2             	cmovs  %edx,%eax
c01011d1:	c1 f8 09             	sar    $0x9,%eax
c01011d4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01011d7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01011da:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01011dd:	8b 45 08             	mov    0x8(%ebp),%eax
c01011e0:	8b 40 10             	mov    0x10(%eax),%eax
c01011e3:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01011e6:	8b 45 08             	mov    0x8(%ebp),%eax
c01011e9:	8b 00                	mov    (%eax),%eax
c01011eb:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01011ee:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01011f1:	83 ec 08             	sub    $0x8,%esp
c01011f4:	50                   	push   %eax
c01011f5:	ff 75 d0             	pushl  -0x30(%ebp)
c01011f8:	e8 8f 4b 00 00       	call   c0105d8c <alloc_virtual_memory>
c01011fd:	83 c4 10             	add    $0x10,%esp
c0101200:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0101203:	8b 45 08             	mov    0x8(%ebp),%eax
c0101206:	8b 40 78             	mov    0x78(%eax),%eax
c0101209:	89 45 c8             	mov    %eax,-0x38(%ebp)
c010120c:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c0101210:	74 22                	je     c0101234 <hd_rdwt+0x133>
c0101212:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c0101216:	74 1c                	je     c0101234 <hd_rdwt+0x133>
c0101218:	68 b7 01 00 00       	push   $0x1b7
c010121d:	68 54 a3 10 c0       	push   $0xc010a354
c0101222:	68 54 a3 10 c0       	push   $0xc010a354
c0101227:	68 16 a4 10 c0       	push   $0xc010a416
c010122c:	e8 f7 73 00 00       	call   c0108628 <assertion_failure>
c0101231:	83 c4 10             	add    $0x10,%esp
c0101234:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
c0101238:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010123b:	88 45 be             	mov    %al,-0x42(%ebp)
c010123e:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101241:	88 45 bf             	mov    %al,-0x41(%ebp)
c0101244:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101247:	c1 f8 08             	sar    $0x8,%eax
c010124a:	88 45 c0             	mov    %al,-0x40(%ebp)
c010124d:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101250:	c1 f8 10             	sar    $0x10,%eax
c0101253:	88 45 c1             	mov    %al,-0x3f(%ebp)
c0101256:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101259:	c1 f8 18             	sar    $0x18,%eax
c010125c:	83 e0 0f             	and    $0xf,%eax
c010125f:	83 c8 e0             	or     $0xffffffe0,%eax
c0101262:	88 45 c2             	mov    %al,-0x3e(%ebp)
c0101265:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c0101269:	75 07                	jne    c0101272 <hd_rdwt+0x171>
c010126b:	b8 20 00 00 00       	mov    $0x20,%eax
c0101270:	eb 05                	jmp    c0101277 <hd_rdwt+0x176>
c0101272:	b8 30 00 00 00       	mov    $0x30,%eax
c0101277:	88 45 c3             	mov    %al,-0x3d(%ebp)
c010127a:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c010127e:	3c 20                	cmp    $0x20,%al
c0101280:	74 24                	je     c01012a6 <hd_rdwt+0x1a5>
c0101282:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c0101286:	3c 30                	cmp    $0x30,%al
c0101288:	74 1c                	je     c01012a6 <hd_rdwt+0x1a5>
c010128a:	68 c5 01 00 00       	push   $0x1c5
c010128f:	68 54 a3 10 c0       	push   $0xc010a354
c0101294:	68 54 a3 10 c0       	push   $0xc010a354
c0101299:	68 34 a4 10 c0       	push   $0xc010a434
c010129e:	e8 85 73 00 00       	call   c0108628 <assertion_failure>
c01012a3:	83 c4 10             	add    $0x10,%esp
c01012a6:	83 ec 0c             	sub    $0xc,%esp
c01012a9:	8d 45 bd             	lea    -0x43(%ebp),%eax
c01012ac:	50                   	push   %eax
c01012ad:	e8 ca f5 ff ff       	call   c010087c <hd_cmd_out>
c01012b2:	83 c4 10             	add    $0x10,%esp
c01012b5:	e9 9c 00 00 00       	jmp    c0101356 <hd_rdwt+0x255>
c01012ba:	b8 00 02 00 00       	mov    $0x200,%eax
c01012bf:	81 7d f4 00 02 00 00 	cmpl   $0x200,-0xc(%ebp)
c01012c6:	0f 4e 45 f4          	cmovle -0xc(%ebp),%eax
c01012ca:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c01012cd:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c01012d1:	75 51                	jne    c0101324 <hd_rdwt+0x223>
c01012d3:	e8 a8 fd ff ff       	call   c0101080 <wait_for>
c01012d8:	e8 d4 fd ff ff       	call   c01010b1 <interrupt_wait>
c01012dd:	83 ec 04             	sub    $0x4,%esp
c01012e0:	ff 75 c4             	pushl  -0x3c(%ebp)
c01012e3:	6a 00                	push   $0x0
c01012e5:	68 80 11 11 c0       	push   $0xc0111180
c01012ea:	e8 7c 9f 00 00       	call   c010b26b <Memset>
c01012ef:	83 c4 10             	add    $0x10,%esp
c01012f2:	83 ec 04             	sub    $0x4,%esp
c01012f5:	68 00 02 00 00       	push   $0x200
c01012fa:	68 80 11 11 c0       	push   $0xc0111180
c01012ff:	68 f0 01 00 00       	push   $0x1f0
c0101304:	e8 b6 9f 00 00       	call   c010b2bf <read_port>
c0101309:	83 c4 10             	add    $0x10,%esp
c010130c:	83 ec 04             	sub    $0x4,%esp
c010130f:	ff 75 c4             	pushl  -0x3c(%ebp)
c0101312:	68 80 11 11 c0       	push   $0xc0111180
c0101317:	ff 75 f0             	pushl  -0x10(%ebp)
c010131a:	e8 da 58 00 00       	call   c0106bf9 <Memcpy>
c010131f:	83 c4 10             	add    $0x10,%esp
c0101322:	eb 26                	jmp    c010134a <hd_rdwt+0x249>
c0101324:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c0101328:	75 20                	jne    c010134a <hd_rdwt+0x249>
c010132a:	e8 51 fd ff ff       	call   c0101080 <wait_for>
c010132f:	83 ec 04             	sub    $0x4,%esp
c0101332:	ff 75 c4             	pushl  -0x3c(%ebp)
c0101335:	ff 75 f0             	pushl  -0x10(%ebp)
c0101338:	68 f0 01 00 00       	push   $0x1f0
c010133d:	e8 91 9f 00 00       	call   c010b2d3 <write_port>
c0101342:	83 c4 10             	add    $0x10,%esp
c0101345:	e8 67 fd ff ff       	call   c01010b1 <interrupt_wait>
c010134a:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c010134d:	29 45 f4             	sub    %eax,-0xc(%ebp)
c0101350:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0101353:	01 45 f0             	add    %eax,-0x10(%ebp)
c0101356:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010135a:	0f 85 5a ff ff ff    	jne    c01012ba <hd_rdwt+0x1b9>
c0101360:	83 ec 04             	sub    $0x4,%esp
c0101363:	6a 7c                	push   $0x7c
c0101365:	6a 00                	push   $0x0
c0101367:	8d 85 40 ff ff ff    	lea    -0xc0(%ebp),%eax
c010136d:	50                   	push   %eax
c010136e:	e8 f8 9e 00 00       	call   c010b26b <Memset>
c0101373:	83 c4 10             	add    $0x10,%esp
c0101376:	c7 45 b8 65 00 00 00 	movl   $0x65,-0x48(%ebp)
c010137d:	c7 85 48 ff ff ff 00 	movl   $0x0,-0xb8(%ebp)
c0101384:	00 00 00 
c0101387:	83 ec 04             	sub    $0x4,%esp
c010138a:	6a 02                	push   $0x2
c010138c:	8d 85 40 ff ff ff    	lea    -0xc0(%ebp),%eax
c0101392:	50                   	push   %eax
c0101393:	6a 01                	push   $0x1
c0101395:	e8 fe 7e 00 00       	call   c0109298 <send_rec>
c010139a:	83 c4 10             	add    $0x10,%esp
c010139d:	90                   	nop
c010139e:	c9                   	leave  
c010139f:	c3                   	ret    

c01013a0 <hd_handler>:
c01013a0:	55                   	push   %ebp
c01013a1:	89 e5                	mov    %esp,%ebp
c01013a3:	83 ec 18             	sub    $0x18,%esp
c01013a6:	83 ec 0c             	sub    $0xc,%esp
c01013a9:	68 f7 01 00 00       	push   $0x1f7
c01013ae:	e8 e6 ee ff ff       	call   c0100299 <in_byte>
c01013b3:	83 c4 10             	add    $0x10,%esp
c01013b6:	0f b6 c0             	movzbl %al,%eax
c01013b9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01013bc:	83 ec 0c             	sub    $0xc,%esp
c01013bf:	6a 03                	push   $0x3
c01013c1:	e8 6c 81 00 00       	call   c0109532 <inform_int>
c01013c6:	83 c4 10             	add    $0x10,%esp
c01013c9:	90                   	nop
c01013ca:	c9                   	leave  
c01013cb:	c3                   	ret    

c01013cc <waitfor>:
c01013cc:	55                   	push   %ebp
c01013cd:	89 e5                	mov    %esp,%ebp
c01013cf:	83 ec 18             	sub    $0x18,%esp
c01013d2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01013d9:	eb 26                	jmp    c0101401 <waitfor+0x35>
c01013db:	83 ec 0c             	sub    $0xc,%esp
c01013de:	68 f7 01 00 00       	push   $0x1f7
c01013e3:	e8 b1 ee ff ff       	call   c0100299 <in_byte>
c01013e8:	83 c4 10             	add    $0x10,%esp
c01013eb:	0f b6 c0             	movzbl %al,%eax
c01013ee:	23 45 08             	and    0x8(%ebp),%eax
c01013f1:	39 45 0c             	cmp    %eax,0xc(%ebp)
c01013f4:	75 07                	jne    c01013fd <waitfor+0x31>
c01013f6:	b8 01 00 00 00       	mov    $0x1,%eax
c01013fb:	eb 11                	jmp    c010140e <waitfor+0x42>
c01013fd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0101401:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101404:	3b 45 10             	cmp    0x10(%ebp),%eax
c0101407:	7c d2                	jl     c01013db <waitfor+0xf>
c0101409:	b8 00 00 00 00       	mov    $0x0,%eax
c010140e:	c9                   	leave  
c010140f:	c3                   	ret    

c0101410 <print_hd_info>:
c0101410:	55                   	push   %ebp
c0101411:	89 e5                	mov    %esp,%ebp
c0101413:	83 ec 18             	sub    $0x18,%esp
c0101416:	83 ec 0c             	sub    $0xc,%esp
c0101419:	68 68 a4 10 c0       	push   $0xc010a468
c010141e:	e8 a8 6e 00 00       	call   c01082cb <Printf>
c0101423:	83 c4 10             	add    $0x10,%esp
c0101426:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010142d:	eb 3b                	jmp    c010146a <print_hd_info+0x5a>
c010142f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101432:	8b 04 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%eax
c0101439:	85 c0                	test   %eax,%eax
c010143b:	74 28                	je     c0101465 <print_hd_info+0x55>
c010143d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101440:	8b 14 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%edx
c0101447:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010144a:	8b 04 c5 44 0f 11 c0 	mov    -0x3feef0bc(,%eax,8),%eax
c0101451:	ff 75 f4             	pushl  -0xc(%ebp)
c0101454:	52                   	push   %edx
c0101455:	50                   	push   %eax
c0101456:	68 85 a4 10 c0       	push   $0xc010a485
c010145b:	e8 6b 6e 00 00       	call   c01082cb <Printf>
c0101460:	83 c4 10             	add    $0x10,%esp
c0101463:	eb 01                	jmp    c0101466 <print_hd_info+0x56>
c0101465:	90                   	nop
c0101466:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c010146a:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c010146e:	7e bf                	jle    c010142f <print_hd_info+0x1f>
c0101470:	83 ec 0c             	sub    $0xc,%esp
c0101473:	68 9d a4 10 c0       	push   $0xc010a49d
c0101478:	e8 4e 6e 00 00       	call   c01082cb <Printf>
c010147d:	83 c4 10             	add    $0x10,%esp
c0101480:	83 ec 0c             	sub    $0xc,%esp
c0101483:	68 b8 a4 10 c0       	push   $0xc010a4b8
c0101488:	e8 3e 6e 00 00       	call   c01082cb <Printf>
c010148d:	83 c4 10             	add    $0x10,%esp
c0101490:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%ebp)
c0101497:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c010149e:	eb 44                	jmp    c01014e4 <print_hd_info+0xd4>
c01014a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01014a3:	83 c0 04             	add    $0x4,%eax
c01014a6:	8b 04 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%eax
c01014ad:	85 c0                	test   %eax,%eax
c01014af:	74 2e                	je     c01014df <print_hd_info+0xcf>
c01014b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01014b4:	83 c0 04             	add    $0x4,%eax
c01014b7:	8b 14 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%edx
c01014be:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01014c1:	83 c0 04             	add    $0x4,%eax
c01014c4:	8b 04 c5 44 0f 11 c0 	mov    -0x3feef0bc(,%eax,8),%eax
c01014cb:	ff 75 f0             	pushl  -0x10(%ebp)
c01014ce:	52                   	push   %edx
c01014cf:	50                   	push   %eax
c01014d0:	68 85 a4 10 c0       	push   $0xc010a485
c01014d5:	e8 f1 6d 00 00       	call   c01082cb <Printf>
c01014da:	83 c4 10             	add    $0x10,%esp
c01014dd:	eb 01                	jmp    c01014e0 <print_hd_info+0xd0>
c01014df:	90                   	nop
c01014e0:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01014e4:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c01014e8:	7e b6                	jle    c01014a0 <print_hd_info+0x90>
c01014ea:	83 ec 0c             	sub    $0xc,%esp
c01014ed:	68 d5 a4 10 c0       	push   $0xc010a4d5
c01014f2:	e8 d4 6d 00 00       	call   c01082cb <Printf>
c01014f7:	83 c4 10             	add    $0x10,%esp
c01014fa:	90                   	nop
c01014fb:	c9                   	leave  
c01014fc:	c3                   	ret    

c01014fd <is_empty>:
c01014fd:	55                   	push   %ebp
c01014fe:	89 e5                	mov    %esp,%ebp
c0101500:	83 ec 10             	sub    $0x10,%esp
c0101503:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c010150a:	eb 1a                	jmp    c0101526 <is_empty+0x29>
c010150c:	8b 55 fc             	mov    -0x4(%ebp),%edx
c010150f:	8b 45 08             	mov    0x8(%ebp),%eax
c0101512:	01 d0                	add    %edx,%eax
c0101514:	0f b6 00             	movzbl (%eax),%eax
c0101517:	84 c0                	test   %al,%al
c0101519:	74 07                	je     c0101522 <is_empty+0x25>
c010151b:	b8 00 00 00 00       	mov    $0x0,%eax
c0101520:	eb 11                	jmp    c0101533 <is_empty+0x36>
c0101522:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0101526:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0101529:	3b 45 0c             	cmp    0xc(%ebp),%eax
c010152c:	7c de                	jl     c010150c <is_empty+0xf>
c010152e:	b8 01 00 00 00       	mov    $0x1,%eax
c0101533:	c9                   	leave  
c0101534:	c3                   	ret    
c0101535:	66 90                	xchg   %ax,%ax
c0101537:	66 90                	xchg   %ax,%ax
c0101539:	66 90                	xchg   %ax,%ax
c010153b:	66 90                	xchg   %ax,%ax
c010153d:	66 90                	xchg   %ax,%ax
c010153f:	90                   	nop

c0101540 <write_debug>:
c0101540:	b8 02 00 00 00       	mov    $0x2,%eax
c0101545:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0101549:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c010154d:	cd 90                	int    $0x90
c010154f:	c3                   	ret    

c0101550 <send_msg>:
c0101550:	55                   	push   %ebp
c0101551:	89 e5                	mov    %esp,%ebp
c0101553:	53                   	push   %ebx
c0101554:	51                   	push   %ecx
c0101555:	b8 03 00 00 00       	mov    $0x3,%eax
c010155a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c010155d:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0101560:	cd 90                	int    $0x90
c0101562:	59                   	pop    %ecx
c0101563:	5b                   	pop    %ebx
c0101564:	5d                   	pop    %ebp
c0101565:	c3                   	ret    

c0101566 <receive_msg>:
c0101566:	55                   	push   %ebp
c0101567:	89 e5                	mov    %esp,%ebp
c0101569:	53                   	push   %ebx
c010156a:	51                   	push   %ecx
c010156b:	b8 04 00 00 00       	mov    $0x4,%eax
c0101570:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c0101573:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0101576:	cd 90                	int    $0x90
c0101578:	59                   	pop    %ecx
c0101579:	5b                   	pop    %ebx
c010157a:	5d                   	pop    %ebp
c010157b:	c3                   	ret    

c010157c <sys_malloc>:
c010157c:	56                   	push   %esi
c010157d:	57                   	push   %edi
c010157e:	53                   	push   %ebx
c010157f:	55                   	push   %ebp
c0101580:	89 e5                	mov    %esp,%ebp
c0101582:	b8 05 00 00 00       	mov    $0x5,%eax
c0101587:	8b 4d 14             	mov    0x14(%ebp),%ecx
c010158a:	cd 90                	int    $0x90
c010158c:	5d                   	pop    %ebp
c010158d:	5b                   	pop    %ebx
c010158e:	5f                   	pop    %edi
c010158f:	5e                   	pop    %esi
c0101590:	c3                   	ret    

c0101591 <sys_free>:
c0101591:	56                   	push   %esi
c0101592:	57                   	push   %edi
c0101593:	53                   	push   %ebx
c0101594:	55                   	push   %ebp
c0101595:	89 e5                	mov    %esp,%ebp
c0101597:	b8 06 00 00 00       	mov    $0x6,%eax
c010159c:	8b 4d 14             	mov    0x14(%ebp),%ecx
c010159f:	8b 5d 18             	mov    0x18(%ebp),%ebx
c01015a2:	cd 90                	int    $0x90
c01015a4:	5d                   	pop    %ebp
c01015a5:	5b                   	pop    %ebx
c01015a6:	5f                   	pop    %edi
c01015a7:	5e                   	pop    %esi
c01015a8:	c3                   	ret    

c01015a9 <task_fs>:
c01015a9:	55                   	push   %ebp
c01015aa:	89 e5                	mov    %esp,%ebp
c01015ac:	83 ec 28             	sub    $0x28,%esp
c01015af:	e8 bb 08 00 00       	call   c0101e6f <init_fs>
c01015b4:	83 ec 0c             	sub    $0xc,%esp
c01015b7:	6a 7c                	push   $0x7c
c01015b9:	e8 be ff ff ff       	call   c010157c <sys_malloc>
c01015be:	83 c4 10             	add    $0x10,%esp
c01015c1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01015c4:	83 ec 0c             	sub    $0xc,%esp
c01015c7:	6a 7c                	push   $0x7c
c01015c9:	e8 ae ff ff ff       	call   c010157c <sys_malloc>
c01015ce:	83 c4 10             	add    $0x10,%esp
c01015d1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01015d4:	83 ec 04             	sub    $0x4,%esp
c01015d7:	6a 7c                	push   $0x7c
c01015d9:	6a 00                	push   $0x0
c01015db:	ff 75 f4             	pushl  -0xc(%ebp)
c01015de:	e8 88 9c 00 00       	call   c010b26b <Memset>
c01015e3:	83 c4 10             	add    $0x10,%esp
c01015e6:	83 ec 04             	sub    $0x4,%esp
c01015e9:	6a 12                	push   $0x12
c01015eb:	ff 75 f4             	pushl  -0xc(%ebp)
c01015ee:	6a 02                	push   $0x2
c01015f0:	e8 a3 7c 00 00       	call   c0109298 <send_rec>
c01015f5:	83 c4 10             	add    $0x10,%esp
c01015f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01015fb:	8b 40 78             	mov    0x78(%eax),%eax
c01015fe:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0101601:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101604:	8b 00                	mov    (%eax),%eax
c0101606:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0101609:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010160c:	8b 40 50             	mov    0x50(%eax),%eax
c010160f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0101612:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101615:	8b 40 68             	mov    0x68(%eax),%eax
c0101618:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010161b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010161e:	8b 00                	mov    (%eax),%eax
c0101620:	85 c0                	test   %eax,%eax
c0101622:	75 07                	jne    c010162b <task_fs+0x82>
c0101624:	c7 45 dc 05 00 00 00 	movl   $0x5,-0x24(%ebp)
c010162b:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0101632:	83 ec 0c             	sub    $0xc,%esp
c0101635:	ff 75 e8             	pushl  -0x18(%ebp)
c0101638:	e8 19 21 00 00       	call   c0103756 <pid2proc>
c010163d:	83 c4 10             	add    $0x10,%esp
c0101640:	a3 c8 fb 10 c0       	mov    %eax,0xc010fbc8
c0101645:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0101649:	74 37                	je     c0101682 <task_fs+0xd9>
c010164b:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
c010164f:	74 31                	je     c0101682 <task_fs+0xd9>
c0101651:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c0101655:	74 2b                	je     c0101682 <task_fs+0xd9>
c0101657:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
c010165b:	74 25                	je     c0101682 <task_fs+0xd9>
c010165d:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
c0101661:	74 1f                	je     c0101682 <task_fs+0xd9>
c0101663:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
c0101667:	74 19                	je     c0101682 <task_fs+0xd9>
c0101669:	6a 7a                	push   $0x7a
c010166b:	68 f4 a4 10 c0       	push   $0xc010a4f4
c0101670:	68 f4 a4 10 c0       	push   $0xc010a4f4
c0101675:	68 04 a5 10 c0       	push   $0xc010a504
c010167a:	e8 a9 6f 00 00       	call   c0108628 <assertion_failure>
c010167f:	83 c4 10             	add    $0x10,%esp
c0101682:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c0101686:	74 3a                	je     c01016c2 <task_fs+0x119>
c0101688:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c010168c:	7f 19                	jg     c01016a7 <task_fs+0xfe>
c010168e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0101692:	0f 84 10 01 00 00    	je     c01017a8 <task_fs+0x1ff>
c0101698:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
c010169c:	0f 84 a1 00 00 00    	je     c0101743 <task_fs+0x19a>
c01016a2:	e9 ef 00 00 00       	jmp    c0101796 <task_fs+0x1ed>
c01016a7:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
c01016ab:	74 50                	je     c01016fd <task_fs+0x154>
c01016ad:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
c01016b1:	0f 84 c6 00 00 00    	je     c010177d <task_fs+0x1d4>
c01016b7:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
c01016bb:	74 40                	je     c01016fd <task_fs+0x154>
c01016bd:	e9 d4 00 00 00       	jmp    c0101796 <task_fs+0x1ed>
c01016c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01016c5:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c01016cc:	83 ec 0c             	sub    $0xc,%esp
c01016cf:	ff 75 f4             	pushl  -0xc(%ebp)
c01016d2:	e8 ec 07 00 00       	call   c0101ec3 <do_open>
c01016d7:	83 c4 10             	add    $0x10,%esp
c01016da:	89 c2                	mov    %eax,%edx
c01016dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01016df:	89 50 50             	mov    %edx,0x50(%eax)
c01016e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01016e5:	8b 00                	mov    (%eax),%eax
c01016e7:	83 ec 04             	sub    $0x4,%esp
c01016ea:	50                   	push   %eax
c01016eb:	ff 75 f4             	pushl  -0xc(%ebp)
c01016ee:	6a 01                	push   $0x1
c01016f0:	e8 a3 7b 00 00       	call   c0109298 <send_rec>
c01016f5:	83 c4 10             	add    $0x10,%esp
c01016f8:	e9 b2 00 00 00       	jmp    c01017af <task_fs+0x206>
c01016fd:	83 ec 0c             	sub    $0xc,%esp
c0101700:	ff 75 f4             	pushl  -0xc(%ebp)
c0101703:	e8 f9 18 00 00       	call   c0103001 <do_rdwt>
c0101708:	83 c4 10             	add    $0x10,%esp
c010170b:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010170e:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
c0101712:	0f 84 96 00 00 00    	je     c01017ae <task_fs+0x205>
c0101718:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010171b:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0101722:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0101725:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101728:	89 50 60             	mov    %edx,0x60(%eax)
c010172b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010172e:	8b 00                	mov    (%eax),%eax
c0101730:	83 ec 04             	sub    $0x4,%esp
c0101733:	50                   	push   %eax
c0101734:	ff 75 f4             	pushl  -0xc(%ebp)
c0101737:	6a 01                	push   $0x1
c0101739:	e8 5a 7b 00 00       	call   c0109298 <send_rec>
c010173e:	83 c4 10             	add    $0x10,%esp
c0101741:	eb 6b                	jmp    c01017ae <task_fs+0x205>
c0101743:	83 ec 0c             	sub    $0xc,%esp
c0101746:	ff 75 e4             	pushl  -0x1c(%ebp)
c0101749:	e8 d0 1d 00 00       	call   c010351e <do_close>
c010174e:	83 c4 10             	add    $0x10,%esp
c0101751:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101754:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c010175b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010175e:	c7 40 58 00 00 00 00 	movl   $0x0,0x58(%eax)
c0101765:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101768:	8b 00                	mov    (%eax),%eax
c010176a:	83 ec 04             	sub    $0x4,%esp
c010176d:	50                   	push   %eax
c010176e:	ff 75 f4             	pushl  -0xc(%ebp)
c0101771:	6a 01                	push   $0x1
c0101773:	e8 20 7b 00 00       	call   c0109298 <send_rec>
c0101778:	83 c4 10             	add    $0x10,%esp
c010177b:	eb 32                	jmp    c01017af <task_fs+0x206>
c010177d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101780:	8b 40 68             	mov    0x68(%eax),%eax
c0101783:	83 ec 04             	sub    $0x4,%esp
c0101786:	50                   	push   %eax
c0101787:	ff 75 f4             	pushl  -0xc(%ebp)
c010178a:	6a 01                	push   $0x1
c010178c:	e8 07 7b 00 00       	call   c0109298 <send_rec>
c0101791:	83 c4 10             	add    $0x10,%esp
c0101794:	eb 19                	jmp    c01017af <task_fs+0x206>
c0101796:	83 ec 0c             	sub    $0xc,%esp
c0101799:	68 67 a5 10 c0       	push   $0xc010a567
c010179e:	e8 67 6e 00 00       	call   c010860a <panic>
c01017a3:	83 c4 10             	add    $0x10,%esp
c01017a6:	eb 07                	jmp    c01017af <task_fs+0x206>
c01017a8:	90                   	nop
c01017a9:	e9 26 fe ff ff       	jmp    c01015d4 <task_fs+0x2b>
c01017ae:	90                   	nop
c01017af:	e9 20 fe ff ff       	jmp    c01015d4 <task_fs+0x2b>

c01017b4 <rd_wt>:
c01017b4:	55                   	push   %ebp
c01017b5:	89 e5                	mov    %esp,%ebp
c01017b7:	83 ec 18             	sub    $0x18,%esp
c01017ba:	83 ec 0c             	sub    $0xc,%esp
c01017bd:	6a 7c                	push   $0x7c
c01017bf:	e8 b8 fd ff ff       	call   c010157c <sys_malloc>
c01017c4:	83 c4 10             	add    $0x10,%esp
c01017c7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01017ca:	83 ec 04             	sub    $0x4,%esp
c01017cd:	6a 7c                	push   $0x7c
c01017cf:	6a 00                	push   $0x0
c01017d1:	ff 75 f4             	pushl  -0xc(%ebp)
c01017d4:	e8 92 9a 00 00       	call   c010b26b <Memset>
c01017d9:	83 c4 10             	add    $0x10,%esp
c01017dc:	8b 55 18             	mov    0x18(%ebp),%edx
c01017df:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01017e2:	89 50 78             	mov    %edx,0x78(%eax)
c01017e5:	8b 55 0c             	mov    0xc(%ebp),%edx
c01017e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01017eb:	89 50 14             	mov    %edx,0x14(%eax)
c01017ee:	8b 55 10             	mov    0x10(%ebp),%edx
c01017f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01017f4:	89 50 10             	mov    %edx,0x10(%eax)
c01017f7:	8b 55 14             	mov    0x14(%ebp),%edx
c01017fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01017fd:	89 50 0c             	mov    %edx,0xc(%eax)
c0101800:	8b 45 08             	mov    0x8(%ebp),%eax
c0101803:	c1 e0 09             	shl    $0x9,%eax
c0101806:	89 c2                	mov    %eax,%edx
c0101808:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010180b:	89 50 18             	mov    %edx,0x18(%eax)
c010180e:	83 7d 18 07          	cmpl   $0x7,0x18(%ebp)
c0101812:	74 22                	je     c0101836 <rd_wt+0x82>
c0101814:	83 7d 18 0a          	cmpl   $0xa,0x18(%ebp)
c0101818:	74 1c                	je     c0101836 <rd_wt+0x82>
c010181a:	68 b1 00 00 00       	push   $0xb1
c010181f:	68 f4 a4 10 c0       	push   $0xc010a4f4
c0101824:	68 f4 a4 10 c0       	push   $0xc010a4f4
c0101829:	68 7a a5 10 c0       	push   $0xc010a57a
c010182e:	e8 f5 6d 00 00       	call   c0108628 <assertion_failure>
c0101833:	83 c4 10             	add    $0x10,%esp
c0101836:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101839:	8b 40 78             	mov    0x78(%eax),%eax
c010183c:	83 f8 07             	cmp    $0x7,%eax
c010183f:	74 27                	je     c0101868 <rd_wt+0xb4>
c0101841:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101844:	8b 40 78             	mov    0x78(%eax),%eax
c0101847:	83 f8 0a             	cmp    $0xa,%eax
c010184a:	74 1c                	je     c0101868 <rd_wt+0xb4>
c010184c:	68 b2 00 00 00       	push   $0xb2
c0101851:	68 f4 a4 10 c0       	push   $0xc010a4f4
c0101856:	68 f4 a4 10 c0       	push   $0xc010a4f4
c010185b:	68 98 a5 10 c0       	push   $0xc010a598
c0101860:	e8 c3 6d 00 00       	call   c0108628 <assertion_failure>
c0101865:	83 c4 10             	add    $0x10,%esp
c0101868:	83 ec 04             	sub    $0x4,%esp
c010186b:	6a 03                	push   $0x3
c010186d:	ff 75 f4             	pushl  -0xc(%ebp)
c0101870:	6a 03                	push   $0x3
c0101872:	e8 21 7a 00 00       	call   c0109298 <send_rec>
c0101877:	83 c4 10             	add    $0x10,%esp
c010187a:	83 ec 08             	sub    $0x8,%esp
c010187d:	6a 7c                	push   $0x7c
c010187f:	ff 75 f4             	pushl  -0xc(%ebp)
c0101882:	e8 0a fd ff ff       	call   c0101591 <sys_free>
c0101887:	83 c4 10             	add    $0x10,%esp
c010188a:	90                   	nop
c010188b:	c9                   	leave  
c010188c:	c3                   	ret    

c010188d <mkfs>:
c010188d:	55                   	push   %ebp
c010188e:	89 e5                	mov    %esp,%ebp
c0101890:	57                   	push   %edi
c0101891:	81 ec d4 00 00 00    	sub    $0xd4,%esp
c0101897:	83 ec 0c             	sub    $0xc,%esp
c010189a:	68 00 80 00 00       	push   $0x8000
c010189f:	e8 d8 fc ff ff       	call   c010157c <sys_malloc>
c01018a4:	83 c4 10             	add    $0x10,%esp
c01018a7:	a3 a4 21 11 c0       	mov    %eax,0xc01121a4
c01018ac:	83 ec 0c             	sub    $0xc,%esp
c01018af:	6a 24                	push   $0x24
c01018b1:	e8 c6 fc ff ff       	call   c010157c <sys_malloc>
c01018b6:	83 c4 10             	add    $0x10,%esp
c01018b9:	a3 a0 21 11 c0       	mov    %eax,0xc01121a0
c01018be:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c01018c3:	83 ec 0c             	sub    $0xc,%esp
c01018c6:	50                   	push   %eax
c01018c7:	e8 0f 46 00 00       	call   c0105edb <get_physical_address>
c01018cc:	83 c4 10             	add    $0x10,%esp
c01018cf:	a3 84 17 11 c0       	mov    %eax,0xc0111784
c01018d4:	a1 a0 21 11 c0       	mov    0xc01121a0,%eax
c01018d9:	83 ec 0c             	sub    $0xc,%esp
c01018dc:	50                   	push   %eax
c01018dd:	e8 f9 45 00 00       	call   c0105edb <get_physical_address>
c01018e2:	83 c4 10             	add    $0x10,%esp
c01018e5:	a3 80 17 11 c0       	mov    %eax,0xc0111780
c01018ea:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c01018ef:	83 ec 04             	sub    $0x4,%esp
c01018f2:	68 00 02 00 00       	push   $0x200
c01018f7:	6a 00                	push   $0x0
c01018f9:	50                   	push   %eax
c01018fa:	e8 6c 99 00 00       	call   c010b26b <Memset>
c01018ff:	83 c4 10             	add    $0x10,%esp
c0101902:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101907:	83 ec 0c             	sub    $0xc,%esp
c010190a:	6a 0a                	push   $0xa
c010190c:	68 00 02 00 00       	push   $0x200
c0101911:	50                   	push   %eax
c0101912:	6a 20                	push   $0x20
c0101914:	6a 00                	push   $0x0
c0101916:	e8 99 fe ff ff       	call   c01017b4 <rd_wt>
c010191b:	83 c4 20             	add    $0x20,%esp
c010191e:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101923:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0101926:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101929:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c0101930:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101933:	c7 40 10 00 08 00 00 	movl   $0x800,0x10(%eax)
c010193a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010193d:	c7 40 08 00 08 00 00 	movl   $0x800,0x8(%eax)
c0101944:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101947:	c7 40 0c 00 01 00 00 	movl   $0x100,0xc(%eax)
c010194e:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101951:	8b 40 04             	mov    0x4(%eax),%eax
c0101954:	8d 50 02             	lea    0x2(%eax),%edx
c0101957:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010195a:	8b 40 08             	mov    0x8(%eax),%eax
c010195d:	01 c2                	add    %eax,%edx
c010195f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101962:	8b 40 0c             	mov    0xc(%eax),%eax
c0101965:	01 c2                	add    %eax,%edx
c0101967:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010196a:	89 10                	mov    %edx,(%eax)
c010196c:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c0101973:	b8 00 02 00 00       	mov    $0x200,%eax
c0101978:	2b 45 d8             	sub    -0x28(%ebp),%eax
c010197b:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0101981:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0101984:	01 ca                	add    %ecx,%edx
c0101986:	83 ec 04             	sub    $0x4,%esp
c0101989:	50                   	push   %eax
c010198a:	6a 80                	push   $0xffffff80
c010198c:	52                   	push   %edx
c010198d:	e8 d9 98 00 00       	call   c010b26b <Memset>
c0101992:	83 c4 10             	add    $0x10,%esp
c0101995:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010199a:	83 ec 0c             	sub    $0xc,%esp
c010199d:	6a 0a                	push   $0xa
c010199f:	68 00 02 00 00       	push   $0x200
c01019a4:	50                   	push   %eax
c01019a5:	6a 20                	push   $0x20
c01019a7:	6a 01                	push   $0x1
c01019a9:	e8 06 fe ff ff       	call   c01017b4 <rd_wt>
c01019ae:	83 c4 20             	add    $0x20,%esp
c01019b1:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01019b4:	8b 10                	mov    (%eax),%edx
c01019b6:	89 55 98             	mov    %edx,-0x68(%ebp)
c01019b9:	8b 50 04             	mov    0x4(%eax),%edx
c01019bc:	89 55 9c             	mov    %edx,-0x64(%ebp)
c01019bf:	8b 50 08             	mov    0x8(%eax),%edx
c01019c2:	89 55 a0             	mov    %edx,-0x60(%ebp)
c01019c5:	8b 50 0c             	mov    0xc(%eax),%edx
c01019c8:	89 55 a4             	mov    %edx,-0x5c(%ebp)
c01019cb:	8b 50 10             	mov    0x10(%eax),%edx
c01019ce:	89 55 a8             	mov    %edx,-0x58(%ebp)
c01019d1:	8b 50 14             	mov    0x14(%eax),%edx
c01019d4:	89 55 ac             	mov    %edx,-0x54(%ebp)
c01019d7:	8b 50 18             	mov    0x18(%eax),%edx
c01019da:	89 55 b0             	mov    %edx,-0x50(%ebp)
c01019dd:	8b 50 1c             	mov    0x1c(%eax),%edx
c01019e0:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c01019e3:	8b 40 20             	mov    0x20(%eax),%eax
c01019e6:	89 45 b8             	mov    %eax,-0x48(%ebp)
c01019e9:	c6 45 d7 3f          	movb   $0x3f,-0x29(%ebp)
c01019ed:	0f be 55 d7          	movsbl -0x29(%ebp),%edx
c01019f1:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c01019f6:	83 ec 04             	sub    $0x4,%esp
c01019f9:	6a 01                	push   $0x1
c01019fb:	52                   	push   %edx
c01019fc:	50                   	push   %eax
c01019fd:	e8 69 98 00 00       	call   c010b26b <Memset>
c0101a02:	83 c4 10             	add    $0x10,%esp
c0101a05:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101a0a:	83 c0 01             	add    $0x1,%eax
c0101a0d:	83 ec 04             	sub    $0x4,%esp
c0101a10:	68 ff 01 00 00       	push   $0x1ff
c0101a15:	6a 80                	push   $0xffffff80
c0101a17:	50                   	push   %eax
c0101a18:	e8 4e 98 00 00       	call   c010b26b <Memset>
c0101a1d:	83 c4 10             	add    $0x10,%esp
c0101a20:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101a25:	83 ec 0c             	sub    $0xc,%esp
c0101a28:	6a 0a                	push   $0xa
c0101a2a:	68 00 02 00 00       	push   $0x200
c0101a2f:	50                   	push   %eax
c0101a30:	6a 20                	push   $0x20
c0101a32:	6a 02                	push   $0x2
c0101a34:	e8 7b fd ff ff       	call   c01017b4 <rd_wt>
c0101a39:	83 c4 20             	add    $0x20,%esp
c0101a3c:	c7 45 d0 03 00 00 00 	movl   $0x3,-0x30(%ebp)
c0101a43:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101a48:	83 ec 04             	sub    $0x4,%esp
c0101a4b:	68 00 02 00 00       	push   $0x200
c0101a50:	6a ff                	push   $0xffffffff
c0101a52:	50                   	push   %eax
c0101a53:	e8 13 98 00 00       	call   c010b26b <Memset>
c0101a58:	83 c4 10             	add    $0x10,%esp
c0101a5b:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101a60:	83 ec 0c             	sub    $0xc,%esp
c0101a63:	6a 0a                	push   $0xa
c0101a65:	68 00 02 00 00       	push   $0x200
c0101a6a:	50                   	push   %eax
c0101a6b:	6a 20                	push   $0x20
c0101a6d:	ff 75 d0             	pushl  -0x30(%ebp)
c0101a70:	e8 3f fd ff ff       	call   c01017b4 <rd_wt>
c0101a75:	83 c4 20             	add    $0x20,%esp
c0101a78:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101a7d:	83 ec 04             	sub    $0x4,%esp
c0101a80:	6a 01                	push   $0x1
c0101a82:	6a 01                	push   $0x1
c0101a84:	50                   	push   %eax
c0101a85:	e8 e1 97 00 00       	call   c010b26b <Memset>
c0101a8a:	83 c4 10             	add    $0x10,%esp
c0101a8d:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101a92:	83 c0 01             	add    $0x1,%eax
c0101a95:	83 ec 04             	sub    $0x4,%esp
c0101a98:	68 ff 01 00 00       	push   $0x1ff
c0101a9d:	6a 00                	push   $0x0
c0101a9f:	50                   	push   %eax
c0101aa0:	e8 c6 97 00 00       	call   c010b26b <Memset>
c0101aa5:	83 c4 10             	add    $0x10,%esp
c0101aa8:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101aad:	89 c2                	mov    %eax,%edx
c0101aaf:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0101ab2:	83 c0 01             	add    $0x1,%eax
c0101ab5:	83 ec 0c             	sub    $0xc,%esp
c0101ab8:	6a 0a                	push   $0xa
c0101aba:	68 00 02 00 00       	push   $0x200
c0101abf:	52                   	push   %edx
c0101ac0:	6a 20                	push   $0x20
c0101ac2:	50                   	push   %eax
c0101ac3:	e8 ec fc ff ff       	call   c01017b4 <rd_wt>
c0101ac8:	83 c4 20             	add    $0x20,%esp
c0101acb:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101ace:	83 e8 02             	sub    $0x2,%eax
c0101ad1:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0101ad4:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0101adb:	eb 04                	jmp    c0101ae1 <mkfs+0x254>
c0101add:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0101ae1:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0101ae4:	83 c0 01             	add    $0x1,%eax
c0101ae7:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0101aea:	7e f1                	jle    c0101add <mkfs+0x250>
c0101aec:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101af1:	89 c2                	mov    %eax,%edx
c0101af3:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101af6:	83 c0 03             	add    $0x3,%eax
c0101af9:	83 ec 0c             	sub    $0xc,%esp
c0101afc:	6a 0a                	push   $0xa
c0101afe:	68 00 02 00 00       	push   $0x200
c0101b03:	52                   	push   %edx
c0101b04:	6a 20                	push   $0x20
c0101b06:	50                   	push   %eax
c0101b07:	e8 a8 fc ff ff       	call   c01017b4 <rd_wt>
c0101b0c:	83 c4 20             	add    $0x20,%esp
c0101b0f:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101b14:	89 c2                	mov    %eax,%edx
c0101b16:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101b19:	83 c0 03             	add    $0x3,%eax
c0101b1c:	83 ec 0c             	sub    $0xc,%esp
c0101b1f:	6a 07                	push   $0x7
c0101b21:	68 00 02 00 00       	push   $0x200
c0101b26:	52                   	push   %edx
c0101b27:	6a 20                	push   $0x20
c0101b29:	50                   	push   %eax
c0101b2a:	e8 85 fc ff ff       	call   c01017b4 <rd_wt>
c0101b2f:	83 c4 20             	add    $0x20,%esp
c0101b32:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101b37:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0101b3a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101b3d:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0101b43:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101b46:	c7 40 04 50 00 00 00 	movl   $0x50,0x4(%eax)
c0101b4d:	8b 55 98             	mov    -0x68(%ebp),%edx
c0101b50:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101b53:	89 50 08             	mov    %edx,0x8(%eax)
c0101b56:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101b59:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0101b60:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101b63:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c0101b6a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101b6d:	8b 10                	mov    (%eax),%edx
c0101b6f:	89 15 c0 21 11 c0    	mov    %edx,0xc01121c0
c0101b75:	8b 50 04             	mov    0x4(%eax),%edx
c0101b78:	89 15 c4 21 11 c0    	mov    %edx,0xc01121c4
c0101b7e:	8b 50 08             	mov    0x8(%eax),%edx
c0101b81:	89 15 c8 21 11 c0    	mov    %edx,0xc01121c8
c0101b87:	8b 50 0c             	mov    0xc(%eax),%edx
c0101b8a:	89 15 cc 21 11 c0    	mov    %edx,0xc01121cc
c0101b90:	8b 50 10             	mov    0x10(%eax),%edx
c0101b93:	89 15 d0 21 11 c0    	mov    %edx,0xc01121d0
c0101b99:	8b 50 14             	mov    0x14(%eax),%edx
c0101b9c:	89 15 d4 21 11 c0    	mov    %edx,0xc01121d4
c0101ba2:	8b 50 18             	mov    0x18(%eax),%edx
c0101ba5:	89 15 d8 21 11 c0    	mov    %edx,0xc01121d8
c0101bab:	8b 50 1c             	mov    0x1c(%eax),%edx
c0101bae:	89 15 dc 21 11 c0    	mov    %edx,0xc01121dc
c0101bb4:	8b 50 20             	mov    0x20(%eax),%edx
c0101bb7:	89 15 e0 21 11 c0    	mov    %edx,0xc01121e0
c0101bbd:	8b 40 24             	mov    0x24(%eax),%eax
c0101bc0:	a3 e4 21 11 c0       	mov    %eax,0xc01121e4
c0101bc5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0101bcc:	eb 4c                	jmp    c0101c1a <mkfs+0x38d>
c0101bce:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101bd3:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0101bd6:	83 c2 01             	add    $0x1,%edx
c0101bd9:	c1 e2 05             	shl    $0x5,%edx
c0101bdc:	01 d0                	add    %edx,%eax
c0101bde:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0101be1:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101be4:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0101bea:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101bed:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0101bf4:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101bf7:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c0101bfe:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
c0101c05:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0101c08:	c1 e0 08             	shl    $0x8,%eax
c0101c0b:	0b 45 f0             	or     -0x10(%ebp),%eax
c0101c0e:	89 c2                	mov    %eax,%edx
c0101c10:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101c13:	89 50 08             	mov    %edx,0x8(%eax)
c0101c16:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0101c1a:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
c0101c1e:	7e ae                	jle    c0101bce <mkfs+0x341>
c0101c20:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
c0101c27:	8d 95 70 ff ff ff    	lea    -0x90(%ebp),%edx
c0101c2d:	b8 00 00 00 00       	mov    $0x0,%eax
c0101c32:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0101c37:	89 d7                	mov    %edx,%edi
c0101c39:	f3 ab                	rep stos %eax,%es:(%edi)
c0101c3b:	c7 85 70 ff ff ff c0 	movl   $0xc010a5c0,-0x90(%ebp)
c0101c42:	a5 10 c0 
c0101c45:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0101c4c:	eb 54                	jmp    c0101ca2 <mkfs+0x415>
c0101c4e:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101c53:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0101c56:	83 c2 04             	add    $0x4,%edx
c0101c59:	c1 e2 05             	shl    $0x5,%edx
c0101c5c:	01 d0                	add    %edx,%eax
c0101c5e:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0101c61:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101c64:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0101c6a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101c6d:	c7 40 04 00 e8 08 00 	movl   $0x8e800,0x4(%eax)
c0101c74:	8b 45 98             	mov    -0x68(%ebp),%eax
c0101c77:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0101c7a:	83 c2 01             	add    $0x1,%edx
c0101c7d:	c1 e2 0b             	shl    $0xb,%edx
c0101c80:	01 c2                	add    %eax,%edx
c0101c82:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101c85:	89 50 08             	mov    %edx,0x8(%eax)
c0101c88:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101c8b:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0101c92:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101c95:	8d 50 05             	lea    0x5(%eax),%edx
c0101c98:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101c9b:	89 50 10             	mov    %edx,0x10(%eax)
c0101c9e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0101ca2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101ca5:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0101ca8:	7c a4                	jl     c0101c4e <mkfs+0x3c1>
c0101caa:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101caf:	89 c2                	mov    %eax,%edx
c0101cb1:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101cb4:	83 c0 03             	add    $0x3,%eax
c0101cb7:	83 ec 0c             	sub    $0xc,%esp
c0101cba:	6a 0a                	push   $0xa
c0101cbc:	68 00 02 00 00       	push   $0x200
c0101cc1:	52                   	push   %edx
c0101cc2:	6a 20                	push   $0x20
c0101cc4:	50                   	push   %eax
c0101cc5:	e8 ea fa ff ff       	call   c01017b4 <rd_wt>
c0101cca:	83 c4 20             	add    $0x20,%esp
c0101ccd:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101cd2:	89 c2                	mov    %eax,%edx
c0101cd4:	8b 45 98             	mov    -0x68(%ebp),%eax
c0101cd7:	83 ec 0c             	sub    $0xc,%esp
c0101cda:	6a 07                	push   $0x7
c0101cdc:	68 00 02 00 00       	push   $0x200
c0101ce1:	52                   	push   %edx
c0101ce2:	6a 20                	push   $0x20
c0101ce4:	50                   	push   %eax
c0101ce5:	e8 ca fa ff ff       	call   c01017b4 <rd_wt>
c0101cea:	83 c4 20             	add    $0x20,%esp
c0101ced:	c7 85 60 ff ff ff cc 	movl   $0xcc,-0xa0(%ebp)
c0101cf4:	00 00 00 
c0101cf7:	66 c7 85 5e ff ff ff 	movw   $0x2e,-0xa2(%ebp)
c0101cfe:	2e 00 
c0101d00:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101d05:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0101d08:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101d0b:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0101d11:	83 ec 0c             	sub    $0xc,%esp
c0101d14:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0101d1a:	50                   	push   %eax
c0101d1b:	e8 84 95 00 00       	call   c010b2a4 <Strlen>
c0101d20:	83 c4 10             	add    $0x10,%esp
c0101d23:	89 c1                	mov    %eax,%ecx
c0101d25:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101d28:	8d 50 04             	lea    0x4(%eax),%edx
c0101d2b:	83 ec 04             	sub    $0x4,%esp
c0101d2e:	51                   	push   %ecx
c0101d2f:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0101d35:	50                   	push   %eax
c0101d36:	52                   	push   %edx
c0101d37:	e8 bd 4e 00 00       	call   c0106bf9 <Memcpy>
c0101d3c:	83 c4 10             	add    $0x10,%esp
c0101d3f:	8d 95 34 ff ff ff    	lea    -0xcc(%ebp),%edx
c0101d45:	b8 00 00 00 00       	mov    $0x0,%eax
c0101d4a:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0101d4f:	89 d7                	mov    %edx,%edi
c0101d51:	f3 ab                	rep stos %eax,%es:(%edi)
c0101d53:	c7 85 34 ff ff ff cc 	movl   $0xc010a5cc,-0xcc(%ebp)
c0101d5a:	a5 10 c0 
c0101d5d:	c7 85 38 ff ff ff d5 	movl   $0xc010a5d5,-0xc8(%ebp)
c0101d64:	a5 10 c0 
c0101d67:	c7 85 3c ff ff ff de 	movl   $0xc010a5de,-0xc4(%ebp)
c0101d6e:	a5 10 c0 
c0101d71:	c7 45 bc 03 00 00 00 	movl   $0x3,-0x44(%ebp)
c0101d78:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0101d7f:	eb 49                	jmp    c0101dca <mkfs+0x53d>
c0101d81:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0101d85:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101d88:	8d 50 02             	lea    0x2(%eax),%edx
c0101d8b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101d8e:	89 10                	mov    %edx,(%eax)
c0101d90:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101d93:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0101d9a:	83 ec 0c             	sub    $0xc,%esp
c0101d9d:	50                   	push   %eax
c0101d9e:	e8 01 95 00 00       	call   c010b2a4 <Strlen>
c0101da3:	83 c4 10             	add    $0x10,%esp
c0101da6:	89 c1                	mov    %eax,%ecx
c0101da8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101dab:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0101db2:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0101db5:	83 c2 04             	add    $0x4,%edx
c0101db8:	83 ec 04             	sub    $0x4,%esp
c0101dbb:	51                   	push   %ecx
c0101dbc:	50                   	push   %eax
c0101dbd:	52                   	push   %edx
c0101dbe:	e8 36 4e 00 00       	call   c0106bf9 <Memcpy>
c0101dc3:	83 c4 10             	add    $0x10,%esp
c0101dc6:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0101dca:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101dcd:	3b 45 bc             	cmp    -0x44(%ebp),%eax
c0101dd0:	7c af                	jl     c0101d81 <mkfs+0x4f4>
c0101dd2:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0101dd9:	eb 66                	jmp    c0101e41 <mkfs+0x5b4>
c0101ddb:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101dde:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0101de5:	83 ec 0c             	sub    $0xc,%esp
c0101de8:	50                   	push   %eax
c0101de9:	e8 b6 94 00 00       	call   c010b2a4 <Strlen>
c0101dee:	83 c4 10             	add    $0x10,%esp
c0101df1:	85 c0                	test   %eax,%eax
c0101df3:	74 47                	je     c0101e3c <mkfs+0x5af>
c0101df5:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0101df9:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101dfc:	8d 50 05             	lea    0x5(%eax),%edx
c0101dff:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101e02:	89 10                	mov    %edx,(%eax)
c0101e04:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101e07:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0101e0e:	83 ec 0c             	sub    $0xc,%esp
c0101e11:	50                   	push   %eax
c0101e12:	e8 8d 94 00 00       	call   c010b2a4 <Strlen>
c0101e17:	83 c4 10             	add    $0x10,%esp
c0101e1a:	89 c1                	mov    %eax,%ecx
c0101e1c:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101e1f:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0101e26:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0101e29:	83 c2 04             	add    $0x4,%edx
c0101e2c:	83 ec 04             	sub    $0x4,%esp
c0101e2f:	51                   	push   %ecx
c0101e30:	50                   	push   %eax
c0101e31:	52                   	push   %edx
c0101e32:	e8 c2 4d 00 00       	call   c0106bf9 <Memcpy>
c0101e37:	83 c4 10             	add    $0x10,%esp
c0101e3a:	eb 01                	jmp    c0101e3d <mkfs+0x5b0>
c0101e3c:	90                   	nop
c0101e3d:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0101e41:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101e44:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0101e47:	7c 92                	jl     c0101ddb <mkfs+0x54e>
c0101e49:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101e4e:	89 c2                	mov    %eax,%edx
c0101e50:	8b 45 98             	mov    -0x68(%ebp),%eax
c0101e53:	83 ec 0c             	sub    $0xc,%esp
c0101e56:	6a 0a                	push   $0xa
c0101e58:	68 00 02 00 00       	push   $0x200
c0101e5d:	52                   	push   %edx
c0101e5e:	6a 20                	push   $0x20
c0101e60:	50                   	push   %eax
c0101e61:	e8 4e f9 ff ff       	call   c01017b4 <rd_wt>
c0101e66:	83 c4 20             	add    $0x20,%esp
c0101e69:	90                   	nop
c0101e6a:	8b 7d fc             	mov    -0x4(%ebp),%edi
c0101e6d:	c9                   	leave  
c0101e6e:	c3                   	ret    

c0101e6f <init_fs>:
c0101e6f:	55                   	push   %ebp
c0101e70:	89 e5                	mov    %esp,%ebp
c0101e72:	83 ec 18             	sub    $0x18,%esp
c0101e75:	83 ec 0c             	sub    $0xc,%esp
c0101e78:	6a 7c                	push   $0x7c
c0101e7a:	e8 fd f6 ff ff       	call   c010157c <sys_malloc>
c0101e7f:	83 c4 10             	add    $0x10,%esp
c0101e82:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101e85:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101e88:	c7 40 78 06 00 00 00 	movl   $0x6,0x78(%eax)
c0101e8f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101e92:	c7 40 14 20 00 00 00 	movl   $0x20,0x14(%eax)
c0101e99:	83 ec 04             	sub    $0x4,%esp
c0101e9c:	6a 03                	push   $0x3
c0101e9e:	ff 75 f4             	pushl  -0xc(%ebp)
c0101ea1:	6a 03                	push   $0x3
c0101ea3:	e8 f0 73 00 00       	call   c0109298 <send_rec>
c0101ea8:	83 c4 10             	add    $0x10,%esp
c0101eab:	e8 dd f9 ff ff       	call   c010188d <mkfs>
c0101eb0:	83 ec 08             	sub    $0x8,%esp
c0101eb3:	6a 7c                	push   $0x7c
c0101eb5:	ff 75 f4             	pushl  -0xc(%ebp)
c0101eb8:	e8 d4 f6 ff ff       	call   c0101591 <sys_free>
c0101ebd:	83 c4 10             	add    $0x10,%esp
c0101ec0:	90                   	nop
c0101ec1:	c9                   	leave  
c0101ec2:	c3                   	ret    

c0101ec3 <do_open>:
c0101ec3:	55                   	push   %ebp
c0101ec4:	89 e5                	mov    %esp,%ebp
c0101ec6:	83 ec 68             	sub    $0x68,%esp
c0101ec9:	83 ec 04             	sub    $0x4,%esp
c0101ecc:	6a 0c                	push   $0xc
c0101ece:	6a 00                	push   $0x0
c0101ed0:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0101ed3:	50                   	push   %eax
c0101ed4:	e8 92 93 00 00       	call   c010b26b <Memset>
c0101ed9:	83 c4 10             	add    $0x10,%esp
c0101edc:	8b 45 08             	mov    0x8(%ebp),%eax
c0101edf:	8b 40 44             	mov    0x44(%eax),%eax
c0101ee2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0101ee5:	83 ec 08             	sub    $0x8,%esp
c0101ee8:	6a 0c                	push   $0xc
c0101eea:	ff 75 e4             	pushl  -0x1c(%ebp)
c0101eed:	e8 9a 3e 00 00       	call   c0105d8c <alloc_virtual_memory>
c0101ef2:	83 c4 10             	add    $0x10,%esp
c0101ef5:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0101ef8:	8b 45 08             	mov    0x8(%ebp),%eax
c0101efb:	8b 40 40             	mov    0x40(%eax),%eax
c0101efe:	89 c2                	mov    %eax,%edx
c0101f00:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101f03:	83 ec 04             	sub    $0x4,%esp
c0101f06:	52                   	push   %edx
c0101f07:	50                   	push   %eax
c0101f08:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0101f0b:	50                   	push   %eax
c0101f0c:	e8 e8 4c 00 00       	call   c0106bf9 <Memcpy>
c0101f11:	83 c4 10             	add    $0x10,%esp
c0101f14:	8b 45 08             	mov    0x8(%ebp),%eax
c0101f17:	8b 40 40             	mov    0x40(%eax),%eax
c0101f1a:	c6 44 05 c4 00       	movb   $0x0,-0x3c(%ebp,%eax,1)
c0101f1f:	8b 45 08             	mov    0x8(%ebp),%eax
c0101f22:	8b 40 74             	mov    0x74(%eax),%eax
c0101f25:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0101f28:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c0101f2f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0101f36:	eb 1f                	jmp    c0101f57 <do_open+0x94>
c0101f38:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c0101f3d:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0101f40:	83 c2 4c             	add    $0x4c,%edx
c0101f43:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c0101f47:	85 c0                	test   %eax,%eax
c0101f49:	75 08                	jne    c0101f53 <do_open+0x90>
c0101f4b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101f4e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101f51:	eb 0a                	jmp    c0101f5d <do_open+0x9a>
c0101f53:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0101f57:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c0101f5b:	7e db                	jle    c0101f38 <do_open+0x75>
c0101f5d:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c0101f61:	75 1c                	jne    c0101f7f <do_open+0xbc>
c0101f63:	68 c6 01 00 00       	push   $0x1c6
c0101f68:	68 f4 a4 10 c0       	push   $0xc010a4f4
c0101f6d:	68 f4 a4 10 c0       	push   $0xc010a4f4
c0101f72:	68 e7 a5 10 c0       	push   $0xc010a5e7
c0101f77:	e8 ac 66 00 00       	call   c0108628 <assertion_failure>
c0101f7c:	83 c4 10             	add    $0x10,%esp
c0101f7f:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%ebp)
c0101f86:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0101f8d:	eb 1d                	jmp    c0101fac <do_open+0xe9>
c0101f8f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101f92:	c1 e0 04             	shl    $0x4,%eax
c0101f95:	05 88 13 11 c0       	add    $0xc0111388,%eax
c0101f9a:	8b 00                	mov    (%eax),%eax
c0101f9c:	85 c0                	test   %eax,%eax
c0101f9e:	75 08                	jne    c0101fa8 <do_open+0xe5>
c0101fa0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101fa3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0101fa6:	eb 0a                	jmp    c0101fb2 <do_open+0xef>
c0101fa8:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0101fac:	83 7d e8 3f          	cmpl   $0x3f,-0x18(%ebp)
c0101fb0:	7e dd                	jle    c0101f8f <do_open+0xcc>
c0101fb2:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
c0101fb6:	75 1c                	jne    c0101fd4 <do_open+0x111>
c0101fb8:	68 d2 01 00 00       	push   $0x1d2
c0101fbd:	68 f4 a4 10 c0       	push   $0xc010a4f4
c0101fc2:	68 f4 a4 10 c0       	push   $0xc010a4f4
c0101fc7:	68 ef a5 10 c0       	push   $0xc010a5ef
c0101fcc:	e8 57 66 00 00       	call   c0108628 <assertion_failure>
c0101fd1:	83 c4 10             	add    $0x10,%esp
c0101fd4:	83 ec 0c             	sub    $0xc,%esp
c0101fd7:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0101fda:	50                   	push   %eax
c0101fdb:	e8 b2 00 00 00       	call   c0102092 <search_file>
c0101fe0:	83 c4 10             	add    $0x10,%esp
c0101fe3:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0101fe6:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c0101fea:	75 2b                	jne    c0102017 <do_open+0x154>
c0101fec:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0101ff0:	7e 10                	jle    c0102002 <do_open+0x13f>
c0101ff2:	83 ec 0c             	sub    $0xc,%esp
c0101ff5:	68 f7 a5 10 c0       	push   $0xc010a5f7
c0101ffa:	e8 0b 66 00 00       	call   c010860a <panic>
c0101fff:	83 c4 10             	add    $0x10,%esp
c0102002:	83 ec 08             	sub    $0x8,%esp
c0102005:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0102008:	50                   	push   %eax
c0102009:	8d 45 9c             	lea    -0x64(%ebp),%eax
c010200c:	50                   	push   %eax
c010200d:	e8 40 04 00 00       	call   c0102452 <create_file>
c0102012:	83 c4 10             	add    $0x10,%esp
c0102015:	eb 22                	jmp    c0102039 <do_open+0x176>
c0102017:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
c010201b:	75 07                	jne    c0102024 <do_open+0x161>
c010201d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102022:	eb 6c                	jmp    c0102090 <do_open+0x1cd>
c0102024:	83 ec 08             	sub    $0x8,%esp
c0102027:	ff 75 d8             	pushl  -0x28(%ebp)
c010202a:	8d 45 9c             	lea    -0x64(%ebp),%eax
c010202d:	50                   	push   %eax
c010202e:	e8 5d 02 00 00       	call   c0102290 <get_inode>
c0102033:	83 c4 10             	add    $0x10,%esp
c0102036:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0102039:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c010203e:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0102041:	c1 e2 04             	shl    $0x4,%edx
c0102044:	8d 8a 80 13 11 c0    	lea    -0x3feeec80(%edx),%ecx
c010204a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010204d:	83 c2 4c             	add    $0x4c,%edx
c0102050:	89 4c 90 0c          	mov    %ecx,0xc(%eax,%edx,4)
c0102054:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0102057:	8b 55 ec             	mov    -0x14(%ebp),%edx
c010205a:	c1 e2 04             	shl    $0x4,%edx
c010205d:	81 c2 88 13 11 c0    	add    $0xc0111388,%edx
c0102063:	89 02                	mov    %eax,(%edx)
c0102065:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102068:	c1 e0 04             	shl    $0x4,%eax
c010206b:	05 84 13 11 c0       	add    $0xc0111384,%eax
c0102070:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0102076:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102079:	c1 e0 04             	shl    $0x4,%eax
c010207c:	05 80 13 11 c0       	add    $0xc0111380,%eax
c0102081:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0102087:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010208a:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010208d:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0102090:	c9                   	leave  
c0102091:	c3                   	ret    

c0102092 <search_file>:
c0102092:	55                   	push   %ebp
c0102093:	89 e5                	mov    %esp,%ebp
c0102095:	83 ec 68             	sub    $0x68,%esp
c0102098:	83 ec 04             	sub    $0x4,%esp
c010209b:	6a 0c                	push   $0xc
c010209d:	6a 00                	push   $0x0
c010209f:	8d 45 c0             	lea    -0x40(%ebp),%eax
c01020a2:	50                   	push   %eax
c01020a3:	e8 c3 91 00 00       	call   c010b26b <Memset>
c01020a8:	83 c4 10             	add    $0x10,%esp
c01020ab:	83 ec 04             	sub    $0x4,%esp
c01020ae:	6a 28                	push   $0x28
c01020b0:	6a 00                	push   $0x0
c01020b2:	8d 45 98             	lea    -0x68(%ebp),%eax
c01020b5:	50                   	push   %eax
c01020b6:	e8 b0 91 00 00       	call   c010b26b <Memset>
c01020bb:	83 c4 10             	add    $0x10,%esp
c01020be:	83 ec 04             	sub    $0x4,%esp
c01020c1:	8d 45 98             	lea    -0x68(%ebp),%eax
c01020c4:	50                   	push   %eax
c01020c5:	ff 75 08             	pushl  0x8(%ebp)
c01020c8:	8d 45 c0             	lea    -0x40(%ebp),%eax
c01020cb:	50                   	push   %eax
c01020cc:	e8 f3 00 00 00       	call   c01021c4 <strip_path>
c01020d1:	83 c4 10             	add    $0x10,%esp
c01020d4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01020d7:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%ebp)
c01020db:	75 0a                	jne    c01020e7 <search_file+0x55>
c01020dd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01020e2:	e9 db 00 00 00       	jmp    c01021c2 <search_file+0x130>
c01020e7:	8b 45 9c             	mov    -0x64(%ebp),%eax
c01020ea:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01020ed:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01020f0:	05 00 02 00 00       	add    $0x200,%eax
c01020f5:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c01020fb:	85 c0                	test   %eax,%eax
c01020fd:	0f 48 c2             	cmovs  %edx,%eax
c0102100:	c1 f8 09             	sar    $0x9,%eax
c0102103:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0102106:	8b 45 9c             	mov    -0x64(%ebp),%eax
c0102109:	c1 e8 04             	shr    $0x4,%eax
c010210c:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010210f:	e8 5c 14 00 00       	call   c0103570 <get_super_block>
c0102114:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0102117:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010211a:	8b 00                	mov    (%eax),%eax
c010211c:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010211f:	c7 45 cc 20 00 00 00 	movl   $0x20,-0x34(%ebp)
c0102126:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010212d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102134:	eb 7b                	jmp    c01021b1 <search_file+0x11f>
c0102136:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010213b:	89 c1                	mov    %eax,%ecx
c010213d:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0102140:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102143:	01 d0                	add    %edx,%eax
c0102145:	83 ec 0c             	sub    $0xc,%esp
c0102148:	6a 07                	push   $0x7
c010214a:	68 00 02 00 00       	push   $0x200
c010214f:	51                   	push   %ecx
c0102150:	ff 75 cc             	pushl  -0x34(%ebp)
c0102153:	50                   	push   %eax
c0102154:	e8 5b f6 ff ff       	call   c01017b4 <rd_wt>
c0102159:	83 c4 20             	add    $0x20,%esp
c010215c:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0102161:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102164:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010216b:	eb 35                	jmp    c01021a2 <search_file+0x110>
c010216d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0102171:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102174:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0102177:	7f 33                	jg     c01021ac <search_file+0x11a>
c0102179:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010217c:	83 c0 04             	add    $0x4,%eax
c010217f:	83 ec 08             	sub    $0x8,%esp
c0102182:	50                   	push   %eax
c0102183:	8d 45 c0             	lea    -0x40(%ebp),%eax
c0102186:	50                   	push   %eax
c0102187:	e8 73 74 00 00       	call   c01095ff <strcmp>
c010218c:	83 c4 10             	add    $0x10,%esp
c010218f:	85 c0                	test   %eax,%eax
c0102191:	75 07                	jne    c010219a <search_file+0x108>
c0102193:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102196:	8b 00                	mov    (%eax),%eax
c0102198:	eb 28                	jmp    c01021c2 <search_file+0x130>
c010219a:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c010219e:	83 45 ec 10          	addl   $0x10,-0x14(%ebp)
c01021a2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01021a5:	83 f8 1f             	cmp    $0x1f,%eax
c01021a8:	76 c3                	jbe    c010216d <search_file+0xdb>
c01021aa:	eb 01                	jmp    c01021ad <search_file+0x11b>
c01021ac:	90                   	nop
c01021ad:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01021b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01021b4:	3b 45 dc             	cmp    -0x24(%ebp),%eax
c01021b7:	0f 8c 79 ff ff ff    	jl     c0102136 <search_file+0xa4>
c01021bd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01021c2:	c9                   	leave  
c01021c3:	c3                   	ret    

c01021c4 <strip_path>:
c01021c4:	55                   	push   %ebp
c01021c5:	89 e5                	mov    %esp,%ebp
c01021c7:	83 ec 10             	sub    $0x10,%esp
c01021ca:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01021ce:	75 0a                	jne    c01021da <strip_path+0x16>
c01021d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01021d5:	e9 b4 00 00 00       	jmp    c010228e <strip_path+0xca>
c01021da:	8b 45 08             	mov    0x8(%ebp),%eax
c01021dd:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01021e0:	8b 45 0c             	mov    0xc(%ebp),%eax
c01021e3:	89 45 f8             	mov    %eax,-0x8(%ebp)
c01021e6:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01021e9:	0f b6 00             	movzbl (%eax),%eax
c01021ec:	3c 2f                	cmp    $0x2f,%al
c01021ee:	75 2d                	jne    c010221d <strip_path+0x59>
c01021f0:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c01021f4:	eb 27                	jmp    c010221d <strip_path+0x59>
c01021f6:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01021f9:	0f b6 00             	movzbl (%eax),%eax
c01021fc:	3c 2f                	cmp    $0x2f,%al
c01021fe:	75 0a                	jne    c010220a <strip_path+0x46>
c0102200:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102205:	e9 84 00 00 00       	jmp    c010228e <strip_path+0xca>
c010220a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010220d:	0f b6 10             	movzbl (%eax),%edx
c0102210:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102213:	88 10                	mov    %dl,(%eax)
c0102215:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0102219:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c010221d:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102220:	0f b6 00             	movzbl (%eax),%eax
c0102223:	84 c0                	test   %al,%al
c0102225:	75 cf                	jne    c01021f6 <strip_path+0x32>
c0102227:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010222a:	c6 00 00             	movb   $0x0,(%eax)
c010222d:	8b 45 10             	mov    0x10(%ebp),%eax
c0102230:	8b 15 c0 21 11 c0    	mov    0xc01121c0,%edx
c0102236:	89 10                	mov    %edx,(%eax)
c0102238:	8b 15 c4 21 11 c0    	mov    0xc01121c4,%edx
c010223e:	89 50 04             	mov    %edx,0x4(%eax)
c0102241:	8b 15 c8 21 11 c0    	mov    0xc01121c8,%edx
c0102247:	89 50 08             	mov    %edx,0x8(%eax)
c010224a:	8b 15 cc 21 11 c0    	mov    0xc01121cc,%edx
c0102250:	89 50 0c             	mov    %edx,0xc(%eax)
c0102253:	8b 15 d0 21 11 c0    	mov    0xc01121d0,%edx
c0102259:	89 50 10             	mov    %edx,0x10(%eax)
c010225c:	8b 15 d4 21 11 c0    	mov    0xc01121d4,%edx
c0102262:	89 50 14             	mov    %edx,0x14(%eax)
c0102265:	8b 15 d8 21 11 c0    	mov    0xc01121d8,%edx
c010226b:	89 50 18             	mov    %edx,0x18(%eax)
c010226e:	8b 15 dc 21 11 c0    	mov    0xc01121dc,%edx
c0102274:	89 50 1c             	mov    %edx,0x1c(%eax)
c0102277:	8b 15 e0 21 11 c0    	mov    0xc01121e0,%edx
c010227d:	89 50 20             	mov    %edx,0x20(%eax)
c0102280:	8b 15 e4 21 11 c0    	mov    0xc01121e4,%edx
c0102286:	89 50 24             	mov    %edx,0x24(%eax)
c0102289:	b8 00 00 00 00       	mov    $0x0,%eax
c010228e:	c9                   	leave  
c010228f:	c3                   	ret    

c0102290 <get_inode>:
c0102290:	55                   	push   %ebp
c0102291:	89 e5                	mov    %esp,%ebp
c0102293:	56                   	push   %esi
c0102294:	53                   	push   %ebx
c0102295:	83 ec 20             	sub    $0x20,%esp
c0102298:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010229c:	75 0a                	jne    c01022a8 <get_inode+0x18>
c010229e:	b8 00 00 00 00       	mov    $0x0,%eax
c01022a3:	e9 a3 01 00 00       	jmp    c010244b <get_inode+0x1bb>
c01022a8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01022af:	c7 45 f0 a0 17 11 c0 	movl   $0xc01117a0,-0x10(%ebp)
c01022b6:	eb 69                	jmp    c0102321 <get_inode+0x91>
c01022b8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01022bb:	8b 40 24             	mov    0x24(%eax),%eax
c01022be:	85 c0                	test   %eax,%eax
c01022c0:	7e 53                	jle    c0102315 <get_inode+0x85>
c01022c2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01022c5:	8b 40 10             	mov    0x10(%eax),%eax
c01022c8:	39 45 0c             	cmp    %eax,0xc(%ebp)
c01022cb:	75 50                	jne    c010231d <get_inode+0x8d>
c01022cd:	8b 45 08             	mov    0x8(%ebp),%eax
c01022d0:	8b 55 f0             	mov    -0x10(%ebp),%edx
c01022d3:	8b 0a                	mov    (%edx),%ecx
c01022d5:	89 08                	mov    %ecx,(%eax)
c01022d7:	8b 4a 04             	mov    0x4(%edx),%ecx
c01022da:	89 48 04             	mov    %ecx,0x4(%eax)
c01022dd:	8b 4a 08             	mov    0x8(%edx),%ecx
c01022e0:	89 48 08             	mov    %ecx,0x8(%eax)
c01022e3:	8b 4a 0c             	mov    0xc(%edx),%ecx
c01022e6:	89 48 0c             	mov    %ecx,0xc(%eax)
c01022e9:	8b 4a 10             	mov    0x10(%edx),%ecx
c01022ec:	89 48 10             	mov    %ecx,0x10(%eax)
c01022ef:	8b 4a 14             	mov    0x14(%edx),%ecx
c01022f2:	89 48 14             	mov    %ecx,0x14(%eax)
c01022f5:	8b 4a 18             	mov    0x18(%edx),%ecx
c01022f8:	89 48 18             	mov    %ecx,0x18(%eax)
c01022fb:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c01022fe:	89 48 1c             	mov    %ecx,0x1c(%eax)
c0102301:	8b 4a 20             	mov    0x20(%edx),%ecx
c0102304:	89 48 20             	mov    %ecx,0x20(%eax)
c0102307:	8b 52 24             	mov    0x24(%edx),%edx
c010230a:	89 50 24             	mov    %edx,0x24(%eax)
c010230d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102310:	e9 36 01 00 00       	jmp    c010244b <get_inode+0x1bb>
c0102315:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102318:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010231b:	eb 0d                	jmp    c010232a <get_inode+0x9a>
c010231d:	83 45 f0 28          	addl   $0x28,-0x10(%ebp)
c0102321:	81 7d f0 a0 21 11 c0 	cmpl   $0xc01121a0,-0x10(%ebp)
c0102328:	76 8e                	jbe    c01022b8 <get_inode+0x28>
c010232a:	e8 41 12 00 00       	call   c0103570 <get_super_block>
c010232f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102332:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c0102339:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010233c:	8b 40 04             	mov    0x4(%eax),%eax
c010233f:	8d 50 02             	lea    0x2(%eax),%edx
c0102342:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102345:	8b 40 08             	mov    0x8(%eax),%eax
c0102348:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c010234b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010234e:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0102351:	b8 00 02 00 00       	mov    $0x200,%eax
c0102356:	99                   	cltd   
c0102357:	f7 7d e8             	idivl  -0x18(%ebp)
c010235a:	89 c6                	mov    %eax,%esi
c010235c:	89 c8                	mov    %ecx,%eax
c010235e:	99                   	cltd   
c010235f:	f7 fe                	idiv   %esi
c0102361:	01 d8                	add    %ebx,%eax
c0102363:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0102366:	c7 45 e0 20 00 00 00 	movl   $0x20,-0x20(%ebp)
c010236d:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102372:	83 ec 0c             	sub    $0xc,%esp
c0102375:	6a 07                	push   $0x7
c0102377:	68 00 02 00 00       	push   $0x200
c010237c:	50                   	push   %eax
c010237d:	ff 75 e0             	pushl  -0x20(%ebp)
c0102380:	ff 75 e4             	pushl  -0x1c(%ebp)
c0102383:	e8 2c f4 ff ff       	call   c01017b4 <rd_wt>
c0102388:	83 c4 20             	add    $0x20,%esp
c010238b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010238e:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0102391:	b8 00 02 00 00       	mov    $0x200,%eax
c0102396:	99                   	cltd   
c0102397:	f7 7d e8             	idivl  -0x18(%ebp)
c010239a:	89 c3                	mov    %eax,%ebx
c010239c:	89 c8                	mov    %ecx,%eax
c010239e:	99                   	cltd   
c010239f:	f7 fb                	idiv   %ebx
c01023a1:	89 55 dc             	mov    %edx,-0x24(%ebp)
c01023a4:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01023aa:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01023ad:	0f af 45 dc          	imul   -0x24(%ebp),%eax
c01023b1:	01 d0                	add    %edx,%eax
c01023b3:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01023b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01023b9:	8b 55 d8             	mov    -0x28(%ebp),%edx
c01023bc:	8b 0a                	mov    (%edx),%ecx
c01023be:	89 08                	mov    %ecx,(%eax)
c01023c0:	8b 4a 04             	mov    0x4(%edx),%ecx
c01023c3:	89 48 04             	mov    %ecx,0x4(%eax)
c01023c6:	8b 4a 08             	mov    0x8(%edx),%ecx
c01023c9:	89 48 08             	mov    %ecx,0x8(%eax)
c01023cc:	8b 4a 0c             	mov    0xc(%edx),%ecx
c01023cf:	89 48 0c             	mov    %ecx,0xc(%eax)
c01023d2:	8b 4a 10             	mov    0x10(%edx),%ecx
c01023d5:	89 48 10             	mov    %ecx,0x10(%eax)
c01023d8:	8b 4a 14             	mov    0x14(%edx),%ecx
c01023db:	89 48 14             	mov    %ecx,0x14(%eax)
c01023de:	8b 4a 18             	mov    0x18(%edx),%ecx
c01023e1:	89 48 18             	mov    %ecx,0x18(%eax)
c01023e4:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c01023e7:	89 48 1c             	mov    %ecx,0x1c(%eax)
c01023ea:	8b 4a 20             	mov    0x20(%edx),%ecx
c01023ed:	89 48 20             	mov    %ecx,0x20(%eax)
c01023f0:	8b 52 24             	mov    0x24(%edx),%edx
c01023f3:	89 50 24             	mov    %edx,0x24(%eax)
c01023f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01023f9:	8b 55 0c             	mov    0xc(%ebp),%edx
c01023fc:	89 50 10             	mov    %edx,0x10(%eax)
c01023ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102402:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0102405:	89 50 20             	mov    %edx,0x20(%eax)
c0102408:	8b 45 08             	mov    0x8(%ebp),%eax
c010240b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010240e:	8b 0a                	mov    (%edx),%ecx
c0102410:	89 08                	mov    %ecx,(%eax)
c0102412:	8b 4a 04             	mov    0x4(%edx),%ecx
c0102415:	89 48 04             	mov    %ecx,0x4(%eax)
c0102418:	8b 4a 08             	mov    0x8(%edx),%ecx
c010241b:	89 48 08             	mov    %ecx,0x8(%eax)
c010241e:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0102421:	89 48 0c             	mov    %ecx,0xc(%eax)
c0102424:	8b 4a 10             	mov    0x10(%edx),%ecx
c0102427:	89 48 10             	mov    %ecx,0x10(%eax)
c010242a:	8b 4a 14             	mov    0x14(%edx),%ecx
c010242d:	89 48 14             	mov    %ecx,0x14(%eax)
c0102430:	8b 4a 18             	mov    0x18(%edx),%ecx
c0102433:	89 48 18             	mov    %ecx,0x18(%eax)
c0102436:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0102439:	89 48 1c             	mov    %ecx,0x1c(%eax)
c010243c:	8b 4a 20             	mov    0x20(%edx),%ecx
c010243f:	89 48 20             	mov    %ecx,0x20(%eax)
c0102442:	8b 52 24             	mov    0x24(%edx),%edx
c0102445:	89 50 24             	mov    %edx,0x24(%eax)
c0102448:	8b 45 08             	mov    0x8(%ebp),%eax
c010244b:	8d 65 f8             	lea    -0x8(%ebp),%esp
c010244e:	5b                   	pop    %ebx
c010244f:	5e                   	pop    %esi
c0102450:	5d                   	pop    %ebp
c0102451:	c3                   	ret    

c0102452 <create_file>:
c0102452:	55                   	push   %ebp
c0102453:	89 e5                	mov    %esp,%ebp
c0102455:	81 ec 98 00 00 00    	sub    $0x98,%esp
c010245b:	8d 45 b8             	lea    -0x48(%ebp),%eax
c010245e:	50                   	push   %eax
c010245f:	ff 75 0c             	pushl  0xc(%ebp)
c0102462:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0102465:	50                   	push   %eax
c0102466:	e8 59 fd ff ff       	call   c01021c4 <strip_path>
c010246b:	83 c4 0c             	add    $0xc,%esp
c010246e:	83 f8 ff             	cmp    $0xffffffff,%eax
c0102471:	75 0a                	jne    c010247d <create_file+0x2b>
c0102473:	b8 00 00 00 00       	mov    $0x0,%eax
c0102478:	e9 de 00 00 00       	jmp    c010255b <create_file+0x109>
c010247d:	e8 db 00 00 00       	call   c010255d <alloc_imap_bit>
c0102482:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102485:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102489:	75 0a                	jne    c0102495 <create_file+0x43>
c010248b:	b8 00 00 00 00       	mov    $0x0,%eax
c0102490:	e9 c6 00 00 00       	jmp    c010255b <create_file+0x109>
c0102495:	e8 d6 10 00 00       	call   c0103570 <get_super_block>
c010249a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010249d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01024a0:	8b 40 10             	mov    0x10(%eax),%eax
c01024a3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01024a6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01024a9:	83 ec 08             	sub    $0x8,%esp
c01024ac:	50                   	push   %eax
c01024ad:	ff 75 f4             	pushl  -0xc(%ebp)
c01024b0:	e8 a5 01 00 00       	call   c010265a <alloc_smap_bit>
c01024b5:	83 c4 10             	add    $0x10,%esp
c01024b8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01024bb:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c01024bf:	75 0a                	jne    c01024cb <create_file+0x79>
c01024c1:	b8 00 00 00 00       	mov    $0x0,%eax
c01024c6:	e9 90 00 00 00       	jmp    c010255b <create_file+0x109>
c01024cb:	83 ec 04             	sub    $0x4,%esp
c01024ce:	ff 75 e8             	pushl  -0x18(%ebp)
c01024d1:	ff 75 f4             	pushl  -0xc(%ebp)
c01024d4:	8d 45 84             	lea    -0x7c(%ebp),%eax
c01024d7:	50                   	push   %eax
c01024d8:	e8 1e 03 00 00       	call   c01027fb <new_inode>
c01024dd:	83 c4 10             	add    $0x10,%esp
c01024e0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01024e3:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c01024e7:	75 07                	jne    c01024f0 <create_file+0x9e>
c01024e9:	b8 00 00 00 00       	mov    $0x0,%eax
c01024ee:	eb 6b                	jmp    c010255b <create_file+0x109>
c01024f0:	ff 75 f4             	pushl  -0xc(%ebp)
c01024f3:	8d 45 ac             	lea    -0x54(%ebp),%eax
c01024f6:	50                   	push   %eax
c01024f7:	8d 45 b8             	lea    -0x48(%ebp),%eax
c01024fa:	50                   	push   %eax
c01024fb:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102501:	50                   	push   %eax
c0102502:	e8 12 04 00 00       	call   c0102919 <new_dir_entry>
c0102507:	83 c4 10             	add    $0x10,%esp
c010250a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010250d:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0102511:	75 07                	jne    c010251a <create_file+0xc8>
c0102513:	b8 00 00 00 00       	mov    $0x0,%eax
c0102518:	eb 41                	jmp    c010255b <create_file+0x109>
c010251a:	8b 45 08             	mov    0x8(%ebp),%eax
c010251d:	8b 55 84             	mov    -0x7c(%ebp),%edx
c0102520:	89 10                	mov    %edx,(%eax)
c0102522:	8b 55 88             	mov    -0x78(%ebp),%edx
c0102525:	89 50 04             	mov    %edx,0x4(%eax)
c0102528:	8b 55 8c             	mov    -0x74(%ebp),%edx
c010252b:	89 50 08             	mov    %edx,0x8(%eax)
c010252e:	8b 55 90             	mov    -0x70(%ebp),%edx
c0102531:	89 50 0c             	mov    %edx,0xc(%eax)
c0102534:	8b 55 94             	mov    -0x6c(%ebp),%edx
c0102537:	89 50 10             	mov    %edx,0x10(%eax)
c010253a:	8b 55 98             	mov    -0x68(%ebp),%edx
c010253d:	89 50 14             	mov    %edx,0x14(%eax)
c0102540:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0102543:	89 50 18             	mov    %edx,0x18(%eax)
c0102546:	8b 55 a0             	mov    -0x60(%ebp),%edx
c0102549:	89 50 1c             	mov    %edx,0x1c(%eax)
c010254c:	8b 55 a4             	mov    -0x5c(%ebp),%edx
c010254f:	89 50 20             	mov    %edx,0x20(%eax)
c0102552:	8b 55 a8             	mov    -0x58(%ebp),%edx
c0102555:	89 50 24             	mov    %edx,0x24(%eax)
c0102558:	8b 45 08             	mov    0x8(%ebp),%eax
c010255b:	c9                   	leave  
c010255c:	c3                   	ret    

c010255d <alloc_imap_bit>:
c010255d:	55                   	push   %ebp
c010255e:	89 e5                	mov    %esp,%ebp
c0102560:	53                   	push   %ebx
c0102561:	83 ec 24             	sub    $0x24,%esp
c0102564:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c010256b:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c0102572:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102577:	83 ec 0c             	sub    $0xc,%esp
c010257a:	6a 07                	push   $0x7
c010257c:	68 00 02 00 00       	push   $0x200
c0102581:	50                   	push   %eax
c0102582:	ff 75 e8             	pushl  -0x18(%ebp)
c0102585:	ff 75 ec             	pushl  -0x14(%ebp)
c0102588:	e8 27 f2 ff ff       	call   c01017b4 <rd_wt>
c010258d:	83 c4 20             	add    $0x20,%esp
c0102590:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0102597:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010259e:	e9 a5 00 00 00       	jmp    c0102648 <alloc_imap_bit+0xeb>
c01025a3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01025aa:	e9 8b 00 00 00       	jmp    c010263a <alloc_imap_bit+0xdd>
c01025af:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01025b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01025b8:	01 d0                	add    %edx,%eax
c01025ba:	0f b6 00             	movzbl (%eax),%eax
c01025bd:	0f be d0             	movsbl %al,%edx
c01025c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01025c3:	89 c1                	mov    %eax,%ecx
c01025c5:	d3 fa                	sar    %cl,%edx
c01025c7:	89 d0                	mov    %edx,%eax
c01025c9:	83 e0 01             	and    $0x1,%eax
c01025cc:	85 c0                	test   %eax,%eax
c01025ce:	74 06                	je     c01025d6 <alloc_imap_bit+0x79>
c01025d0:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01025d4:	eb 64                	jmp    c010263a <alloc_imap_bit+0xdd>
c01025d6:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01025dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01025df:	01 d0                	add    %edx,%eax
c01025e1:	0f b6 18             	movzbl (%eax),%ebx
c01025e4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01025e7:	ba 01 00 00 00       	mov    $0x1,%edx
c01025ec:	89 c1                	mov    %eax,%ecx
c01025ee:	d3 e2                	shl    %cl,%edx
c01025f0:	89 d0                	mov    %edx,%eax
c01025f2:	89 c1                	mov    %eax,%ecx
c01025f4:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01025fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01025fd:	01 d0                	add    %edx,%eax
c01025ff:	09 cb                	or     %ecx,%ebx
c0102601:	89 da                	mov    %ebx,%edx
c0102603:	88 10                	mov    %dl,(%eax)
c0102605:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102608:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c010260f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102612:	01 d0                	add    %edx,%eax
c0102614:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0102617:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010261c:	83 ec 0c             	sub    $0xc,%esp
c010261f:	6a 0a                	push   $0xa
c0102621:	68 00 02 00 00       	push   $0x200
c0102626:	50                   	push   %eax
c0102627:	ff 75 e8             	pushl  -0x18(%ebp)
c010262a:	ff 75 ec             	pushl  -0x14(%ebp)
c010262d:	e8 82 f1 ff ff       	call   c01017b4 <rd_wt>
c0102632:	83 c4 20             	add    $0x20,%esp
c0102635:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102638:	eb 1b                	jmp    c0102655 <alloc_imap_bit+0xf8>
c010263a:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
c010263e:	0f 8e 6b ff ff ff    	jle    c01025af <alloc_imap_bit+0x52>
c0102644:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0102648:	81 7d f4 ff 01 00 00 	cmpl   $0x1ff,-0xc(%ebp)
c010264f:	0f 8e 4e ff ff ff    	jle    c01025a3 <alloc_imap_bit+0x46>
c0102655:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0102658:	c9                   	leave  
c0102659:	c3                   	ret    

c010265a <alloc_smap_bit>:
c010265a:	55                   	push   %ebp
c010265b:	89 e5                	mov    %esp,%ebp
c010265d:	53                   	push   %ebx
c010265e:	83 ec 34             	sub    $0x34,%esp
c0102661:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102665:	75 1c                	jne    c0102683 <alloc_smap_bit+0x29>
c0102667:	68 fc 02 00 00       	push   $0x2fc
c010266c:	68 f4 a4 10 c0       	push   $0xc010a4f4
c0102671:	68 f4 a4 10 c0       	push   $0xc010a4f4
c0102676:	68 04 a6 10 c0       	push   $0xc010a604
c010267b:	e8 a8 5f 00 00       	call   c0108628 <assertion_failure>
c0102680:	83 c4 10             	add    $0x10,%esp
c0102683:	e8 e8 0e 00 00       	call   c0103570 <get_super_block>
c0102688:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010268b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010268e:	8b 40 08             	mov    0x8(%eax),%eax
c0102691:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0102694:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102697:	8b 40 04             	mov    0x4(%eax),%eax
c010269a:	83 c0 02             	add    $0x2,%eax
c010269d:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01026a0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01026a7:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c01026ae:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01026b5:	e9 20 01 00 00       	jmp    c01027da <alloc_smap_bit+0x180>
c01026ba:	8b 55 dc             	mov    -0x24(%ebp),%edx
c01026bd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01026c0:	01 d0                	add    %edx,%eax
c01026c2:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01026c5:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01026ca:	83 ec 0c             	sub    $0xc,%esp
c01026cd:	6a 07                	push   $0x7
c01026cf:	68 00 02 00 00       	push   $0x200
c01026d4:	50                   	push   %eax
c01026d5:	ff 75 d8             	pushl  -0x28(%ebp)
c01026d8:	ff 75 d4             	pushl  -0x2c(%ebp)
c01026db:	e8 d4 f0 ff ff       	call   c01017b4 <rd_wt>
c01026e0:	83 c4 20             	add    $0x20,%esp
c01026e3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01026ea:	e9 b0 00 00 00       	jmp    c010279f <alloc_smap_bit+0x145>
c01026ef:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01026f6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01026fa:	0f 85 8c 00 00 00    	jne    c010278c <alloc_smap_bit+0x132>
c0102700:	eb 45                	jmp    c0102747 <alloc_smap_bit+0xed>
c0102702:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102708:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010270b:	01 d0                	add    %edx,%eax
c010270d:	0f b6 00             	movzbl (%eax),%eax
c0102710:	0f be d0             	movsbl %al,%edx
c0102713:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102716:	89 c1                	mov    %eax,%ecx
c0102718:	d3 fa                	sar    %cl,%edx
c010271a:	89 d0                	mov    %edx,%eax
c010271c:	83 e0 01             	and    $0x1,%eax
c010271f:	85 c0                	test   %eax,%eax
c0102721:	74 06                	je     c0102729 <alloc_smap_bit+0xcf>
c0102723:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0102727:	eb 1e                	jmp    c0102747 <alloc_smap_bit+0xed>
c0102729:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010272c:	c1 e0 09             	shl    $0x9,%eax
c010272f:	89 c2                	mov    %eax,%edx
c0102731:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102734:	01 d0                	add    %edx,%eax
c0102736:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c010273d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102740:	01 d0                	add    %edx,%eax
c0102742:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102745:	eb 06                	jmp    c010274d <alloc_smap_bit+0xf3>
c0102747:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c010274b:	7e b5                	jle    c0102702 <alloc_smap_bit+0xa8>
c010274d:	eb 3d                	jmp    c010278c <alloc_smap_bit+0x132>
c010274f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102753:	74 45                	je     c010279a <alloc_smap_bit+0x140>
c0102755:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c010275b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010275e:	01 d0                	add    %edx,%eax
c0102760:	0f b6 18             	movzbl (%eax),%ebx
c0102763:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102766:	ba 01 00 00 00       	mov    $0x1,%edx
c010276b:	89 c1                	mov    %eax,%ecx
c010276d:	d3 e2                	shl    %cl,%edx
c010276f:	89 d0                	mov    %edx,%eax
c0102771:	89 c1                	mov    %eax,%ecx
c0102773:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102779:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010277c:	01 d0                	add    %edx,%eax
c010277e:	09 cb                	or     %ecx,%ebx
c0102780:	89 da                	mov    %ebx,%edx
c0102782:	88 10                	mov    %dl,(%eax)
c0102784:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0102788:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c010278c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102790:	74 09                	je     c010279b <alloc_smap_bit+0x141>
c0102792:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0102796:	7e b7                	jle    c010274f <alloc_smap_bit+0xf5>
c0102798:	eb 01                	jmp    c010279b <alloc_smap_bit+0x141>
c010279a:	90                   	nop
c010279b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c010279f:	81 7d ec ff 01 00 00 	cmpl   $0x1ff,-0x14(%ebp)
c01027a6:	0f 8e 43 ff ff ff    	jle    c01026ef <alloc_smap_bit+0x95>
c01027ac:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01027b0:	74 1e                	je     c01027d0 <alloc_smap_bit+0x176>
c01027b2:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01027b7:	83 ec 0c             	sub    $0xc,%esp
c01027ba:	6a 0a                	push   $0xa
c01027bc:	68 00 02 00 00       	push   $0x200
c01027c1:	50                   	push   %eax
c01027c2:	ff 75 d8             	pushl  -0x28(%ebp)
c01027c5:	ff 75 d4             	pushl  -0x2c(%ebp)
c01027c8:	e8 e7 ef ff ff       	call   c01017b4 <rd_wt>
c01027cd:	83 c4 20             	add    $0x20,%esp
c01027d0:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01027d4:	74 12                	je     c01027e8 <alloc_smap_bit+0x18e>
c01027d6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01027da:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01027dd:	3b 45 e0             	cmp    -0x20(%ebp),%eax
c01027e0:	0f 8c d4 fe ff ff    	jl     c01026ba <alloc_smap_bit+0x60>
c01027e6:	eb 01                	jmp    c01027e9 <alloc_smap_bit+0x18f>
c01027e8:	90                   	nop
c01027e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01027ec:	8d 50 ff             	lea    -0x1(%eax),%edx
c01027ef:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01027f2:	8b 00                	mov    (%eax),%eax
c01027f4:	01 d0                	add    %edx,%eax
c01027f6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01027f9:	c9                   	leave  
c01027fa:	c3                   	ret    

c01027fb <new_inode>:
c01027fb:	55                   	push   %ebp
c01027fc:	89 e5                	mov    %esp,%ebp
c01027fe:	83 ec 38             	sub    $0x38,%esp
c0102801:	83 ec 08             	sub    $0x8,%esp
c0102804:	ff 75 0c             	pushl  0xc(%ebp)
c0102807:	8d 45 c8             	lea    -0x38(%ebp),%eax
c010280a:	50                   	push   %eax
c010280b:	e8 80 fa ff ff       	call   c0102290 <get_inode>
c0102810:	83 c4 10             	add    $0x10,%esp
c0102813:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0102816:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010281a:	75 0a                	jne    c0102826 <new_inode+0x2b>
c010281c:	b8 00 00 00 00       	mov    $0x0,%eax
c0102821:	e9 f1 00 00 00       	jmp    c0102917 <new_inode+0x11c>
c0102826:	8b 45 10             	mov    0x10(%ebp),%eax
c0102829:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010282c:	c7 45 d4 00 08 00 00 	movl   $0x800,-0x2c(%ebp)
c0102833:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c010283a:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
c0102841:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102844:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0102847:	83 ec 0c             	sub    $0xc,%esp
c010284a:	8d 45 c8             	lea    -0x38(%ebp),%eax
c010284d:	50                   	push   %eax
c010284e:	e8 39 0b 00 00       	call   c010338c <sync_inode>
c0102853:	83 c4 10             	add    $0x10,%esp
c0102856:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c010285d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0102864:	eb 1d                	jmp    c0102883 <new_inode+0x88>
c0102866:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102869:	89 d0                	mov    %edx,%eax
c010286b:	c1 e0 02             	shl    $0x2,%eax
c010286e:	01 d0                	add    %edx,%eax
c0102870:	c1 e0 03             	shl    $0x3,%eax
c0102873:	05 b0 17 11 c0       	add    $0xc01117b0,%eax
c0102878:	8b 00                	mov    (%eax),%eax
c010287a:	39 45 0c             	cmp    %eax,0xc(%ebp)
c010287d:	74 0c                	je     c010288b <new_inode+0x90>
c010287f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0102883:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c0102887:	7e dd                	jle    c0102866 <new_inode+0x6b>
c0102889:	eb 01                	jmp    c010288c <new_inode+0x91>
c010288b:	90                   	nop
c010288c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010288f:	89 d0                	mov    %edx,%eax
c0102891:	c1 e0 02             	shl    $0x2,%eax
c0102894:	01 d0                	add    %edx,%eax
c0102896:	c1 e0 03             	shl    $0x3,%eax
c0102899:	05 a0 17 11 c0       	add    $0xc01117a0,%eax
c010289e:	8b 55 c8             	mov    -0x38(%ebp),%edx
c01028a1:	89 10                	mov    %edx,(%eax)
c01028a3:	8b 55 cc             	mov    -0x34(%ebp),%edx
c01028a6:	89 50 04             	mov    %edx,0x4(%eax)
c01028a9:	8b 55 d0             	mov    -0x30(%ebp),%edx
c01028ac:	89 50 08             	mov    %edx,0x8(%eax)
c01028af:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c01028b2:	89 50 0c             	mov    %edx,0xc(%eax)
c01028b5:	8b 55 d8             	mov    -0x28(%ebp),%edx
c01028b8:	89 50 10             	mov    %edx,0x10(%eax)
c01028bb:	8b 55 dc             	mov    -0x24(%ebp),%edx
c01028be:	89 50 14             	mov    %edx,0x14(%eax)
c01028c1:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01028c4:	89 50 18             	mov    %edx,0x18(%eax)
c01028c7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01028ca:	89 50 1c             	mov    %edx,0x1c(%eax)
c01028cd:	8b 55 e8             	mov    -0x18(%ebp),%edx
c01028d0:	89 50 20             	mov    %edx,0x20(%eax)
c01028d3:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01028d6:	89 50 24             	mov    %edx,0x24(%eax)
c01028d9:	8b 45 08             	mov    0x8(%ebp),%eax
c01028dc:	8b 55 c8             	mov    -0x38(%ebp),%edx
c01028df:	89 10                	mov    %edx,(%eax)
c01028e1:	8b 55 cc             	mov    -0x34(%ebp),%edx
c01028e4:	89 50 04             	mov    %edx,0x4(%eax)
c01028e7:	8b 55 d0             	mov    -0x30(%ebp),%edx
c01028ea:	89 50 08             	mov    %edx,0x8(%eax)
c01028ed:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c01028f0:	89 50 0c             	mov    %edx,0xc(%eax)
c01028f3:	8b 55 d8             	mov    -0x28(%ebp),%edx
c01028f6:	89 50 10             	mov    %edx,0x10(%eax)
c01028f9:	8b 55 dc             	mov    -0x24(%ebp),%edx
c01028fc:	89 50 14             	mov    %edx,0x14(%eax)
c01028ff:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0102902:	89 50 18             	mov    %edx,0x18(%eax)
c0102905:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0102908:	89 50 1c             	mov    %edx,0x1c(%eax)
c010290b:	8b 55 e8             	mov    -0x18(%ebp),%edx
c010290e:	89 50 20             	mov    %edx,0x20(%eax)
c0102911:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0102914:	89 50 24             	mov    %edx,0x24(%eax)
c0102917:	c9                   	leave  
c0102918:	c3                   	ret    

c0102919 <new_dir_entry>:
c0102919:	55                   	push   %ebp
c010291a:	89 e5                	mov    %esp,%ebp
c010291c:	83 ec 48             	sub    $0x48,%esp
c010291f:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
c0102926:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102929:	8b 40 04             	mov    0x4(%eax),%eax
c010292c:	99                   	cltd   
c010292d:	f7 7d dc             	idivl  -0x24(%ebp)
c0102930:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0102933:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102936:	8b 40 0c             	mov    0xc(%eax),%eax
c0102939:	99                   	cltd   
c010293a:	f7 7d dc             	idivl  -0x24(%ebp)
c010293d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0102940:	e8 2b 0c 00 00       	call   c0103570 <get_super_block>
c0102945:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0102948:	8b 45 d0             	mov    -0x30(%ebp),%eax
c010294b:	8b 00                	mov    (%eax),%eax
c010294d:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0102950:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102953:	8b 40 0c             	mov    0xc(%eax),%eax
c0102956:	05 00 02 00 00       	add    $0x200,%eax
c010295b:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0102961:	85 c0                	test   %eax,%eax
c0102963:	0f 48 c2             	cmovs  %edx,%eax
c0102966:	c1 f8 09             	sar    $0x9,%eax
c0102969:	89 45 c8             	mov    %eax,-0x38(%ebp)
c010296c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0102973:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c010297a:	c7 45 c4 20 00 00 00 	movl   $0x20,-0x3c(%ebp)
c0102981:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0102988:	eb 7f                	jmp    c0102a09 <new_dir_entry+0xf0>
c010298a:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010298f:	89 c1                	mov    %eax,%ecx
c0102991:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102994:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102997:	01 d0                	add    %edx,%eax
c0102999:	83 ec 0c             	sub    $0xc,%esp
c010299c:	6a 07                	push   $0x7
c010299e:	68 00 02 00 00       	push   $0x200
c01029a3:	51                   	push   %ecx
c01029a4:	ff 75 c4             	pushl  -0x3c(%ebp)
c01029a7:	50                   	push   %eax
c01029a8:	e8 07 ee ff ff       	call   c01017b4 <rd_wt>
c01029ad:	83 c4 20             	add    $0x20,%esp
c01029b0:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c01029b5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01029b8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01029bf:	eb 25                	jmp    c01029e6 <new_dir_entry+0xcd>
c01029c1:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c01029c5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01029c8:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c01029cb:	7f 29                	jg     c01029f6 <new_dir_entry+0xdd>
c01029cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01029d0:	8b 00                	mov    (%eax),%eax
c01029d2:	85 c0                	test   %eax,%eax
c01029d4:	75 08                	jne    c01029de <new_dir_entry+0xc5>
c01029d6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01029d9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01029dc:	eb 19                	jmp    c01029f7 <new_dir_entry+0xde>
c01029de:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c01029e2:	83 45 f0 10          	addl   $0x10,-0x10(%ebp)
c01029e6:	b8 00 02 00 00       	mov    $0x200,%eax
c01029eb:	99                   	cltd   
c01029ec:	f7 7d dc             	idivl  -0x24(%ebp)
c01029ef:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c01029f2:	7c cd                	jl     c01029c1 <new_dir_entry+0xa8>
c01029f4:	eb 01                	jmp    c01029f7 <new_dir_entry+0xde>
c01029f6:	90                   	nop
c01029f7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01029fa:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c01029fd:	7f 16                	jg     c0102a15 <new_dir_entry+0xfc>
c01029ff:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102a03:	75 10                	jne    c0102a15 <new_dir_entry+0xfc>
c0102a05:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0102a09:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102a0c:	3b 45 c8             	cmp    -0x38(%ebp),%eax
c0102a0f:	0f 8c 75 ff ff ff    	jl     c010298a <new_dir_entry+0x71>
c0102a15:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0102a18:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
c0102a1b:	75 0a                	jne    c0102a27 <new_dir_entry+0x10e>
c0102a1d:	b8 00 00 00 00       	mov    $0x0,%eax
c0102a22:	e9 fc 00 00 00       	jmp    c0102b23 <new_dir_entry+0x20a>
c0102a27:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0102a2e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102a32:	75 1e                	jne    c0102a52 <new_dir_entry+0x139>
c0102a34:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102a37:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102a3a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102a3d:	8b 50 04             	mov    0x4(%eax),%edx
c0102a40:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0102a43:	01 c2                	add    %eax,%edx
c0102a45:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102a48:	89 50 04             	mov    %edx,0x4(%eax)
c0102a4b:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0102a52:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102a55:	8b 55 14             	mov    0x14(%ebp),%edx
c0102a58:	89 10                	mov    %edx,(%eax)
c0102a5a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102a5d:	83 c0 04             	add    $0x4,%eax
c0102a60:	83 ec 08             	sub    $0x8,%esp
c0102a63:	ff 75 10             	pushl  0x10(%ebp)
c0102a66:	50                   	push   %eax
c0102a67:	e8 1e 88 00 00       	call   c010b28a <Strcpy>
c0102a6c:	83 c4 10             	add    $0x10,%esp
c0102a6f:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a72:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102a75:	8b 0a                	mov    (%edx),%ecx
c0102a77:	89 08                	mov    %ecx,(%eax)
c0102a79:	8b 4a 04             	mov    0x4(%edx),%ecx
c0102a7c:	89 48 04             	mov    %ecx,0x4(%eax)
c0102a7f:	8b 4a 08             	mov    0x8(%edx),%ecx
c0102a82:	89 48 08             	mov    %ecx,0x8(%eax)
c0102a85:	8b 52 0c             	mov    0xc(%edx),%edx
c0102a88:	89 50 0c             	mov    %edx,0xc(%eax)
c0102a8b:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102a90:	89 c1                	mov    %eax,%ecx
c0102a92:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102a95:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102a98:	01 d0                	add    %edx,%eax
c0102a9a:	83 ec 0c             	sub    $0xc,%esp
c0102a9d:	6a 0a                	push   $0xa
c0102a9f:	68 00 02 00 00       	push   $0x200
c0102aa4:	51                   	push   %ecx
c0102aa5:	ff 75 c4             	pushl  -0x3c(%ebp)
c0102aa8:	50                   	push   %eax
c0102aa9:	e8 06 ed ff ff       	call   c01017b4 <rd_wt>
c0102aae:	83 c4 20             	add    $0x20,%esp
c0102ab1:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0102ab5:	74 69                	je     c0102b20 <new_dir_entry+0x207>
c0102ab7:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102aba:	8b 10                	mov    (%eax),%edx
c0102abc:	89 15 c0 21 11 c0    	mov    %edx,0xc01121c0
c0102ac2:	8b 50 04             	mov    0x4(%eax),%edx
c0102ac5:	89 15 c4 21 11 c0    	mov    %edx,0xc01121c4
c0102acb:	8b 50 08             	mov    0x8(%eax),%edx
c0102ace:	89 15 c8 21 11 c0    	mov    %edx,0xc01121c8
c0102ad4:	8b 50 0c             	mov    0xc(%eax),%edx
c0102ad7:	89 15 cc 21 11 c0    	mov    %edx,0xc01121cc
c0102add:	8b 50 10             	mov    0x10(%eax),%edx
c0102ae0:	89 15 d0 21 11 c0    	mov    %edx,0xc01121d0
c0102ae6:	8b 50 14             	mov    0x14(%eax),%edx
c0102ae9:	89 15 d4 21 11 c0    	mov    %edx,0xc01121d4
c0102aef:	8b 50 18             	mov    0x18(%eax),%edx
c0102af2:	89 15 d8 21 11 c0    	mov    %edx,0xc01121d8
c0102af8:	8b 50 1c             	mov    0x1c(%eax),%edx
c0102afb:	89 15 dc 21 11 c0    	mov    %edx,0xc01121dc
c0102b01:	8b 50 20             	mov    0x20(%eax),%edx
c0102b04:	89 15 e0 21 11 c0    	mov    %edx,0xc01121e0
c0102b0a:	8b 40 24             	mov    0x24(%eax),%eax
c0102b0d:	a3 e4 21 11 c0       	mov    %eax,0xc01121e4
c0102b12:	83 ec 0c             	sub    $0xc,%esp
c0102b15:	ff 75 0c             	pushl  0xc(%ebp)
c0102b18:	e8 6f 08 00 00       	call   c010338c <sync_inode>
c0102b1d:	83 c4 10             	add    $0x10,%esp
c0102b20:	8b 45 08             	mov    0x8(%ebp),%eax
c0102b23:	c9                   	leave  
c0102b24:	c3                   	ret    

c0102b25 <do_unlink>:
c0102b25:	55                   	push   %ebp
c0102b26:	89 e5                	mov    %esp,%ebp
c0102b28:	53                   	push   %ebx
c0102b29:	81 ec a4 00 00 00    	sub    $0xa4,%esp
c0102b2f:	83 ec 08             	sub    $0x8,%esp
c0102b32:	ff 75 08             	pushl  0x8(%ebp)
c0102b35:	68 19 a6 10 c0       	push   $0xc010a619
c0102b3a:	e8 c0 6a 00 00       	call   c01095ff <strcmp>
c0102b3f:	83 c4 10             	add    $0x10,%esp
c0102b42:	85 c0                	test   %eax,%eax
c0102b44:	75 10                	jne    c0102b56 <do_unlink+0x31>
c0102b46:	83 ec 0c             	sub    $0xc,%esp
c0102b49:	68 1b a6 10 c0       	push   $0xc010a61b
c0102b4e:	e8 b7 5a 00 00       	call   c010860a <panic>
c0102b53:	83 c4 10             	add    $0x10,%esp
c0102b56:	83 ec 0c             	sub    $0xc,%esp
c0102b59:	ff 75 08             	pushl  0x8(%ebp)
c0102b5c:	e8 31 f5 ff ff       	call   c0102092 <search_file>
c0102b61:	83 c4 10             	add    $0x10,%esp
c0102b64:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0102b67:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0102b6b:	75 10                	jne    c0102b7d <do_unlink+0x58>
c0102b6d:	83 ec 0c             	sub    $0xc,%esp
c0102b70:	68 37 a6 10 c0       	push   $0xc010a637
c0102b75:	e8 90 5a 00 00       	call   c010860a <panic>
c0102b7a:	83 c4 10             	add    $0x10,%esp
c0102b7d:	83 ec 08             	sub    $0x8,%esp
c0102b80:	ff 75 d0             	pushl  -0x30(%ebp)
c0102b83:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0102b89:	50                   	push   %eax
c0102b8a:	e8 01 f7 ff ff       	call   c0102290 <get_inode>
c0102b8f:	83 c4 10             	add    $0x10,%esp
c0102b92:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0102b95:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0102b99:	75 10                	jne    c0102bab <do_unlink+0x86>
c0102b9b:	83 ec 0c             	sub    $0xc,%esp
c0102b9e:	68 37 a6 10 c0       	push   $0xc010a637
c0102ba3:	e8 62 5a 00 00       	call   c010860a <panic>
c0102ba8:	83 c4 10             	add    $0x10,%esp
c0102bab:	8b 45 88             	mov    -0x78(%ebp),%eax
c0102bae:	85 c0                	test   %eax,%eax
c0102bb0:	7e 10                	jle    c0102bc2 <do_unlink+0x9d>
c0102bb2:	83 ec 0c             	sub    $0xc,%esp
c0102bb5:	68 50 a6 10 c0       	push   $0xc010a650
c0102bba:	e8 4b 5a 00 00       	call   c010860a <panic>
c0102bbf:	83 c4 10             	add    $0x10,%esp
c0102bc2:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0102bc8:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0102bcb:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0102bce:	8d 50 07             	lea    0x7(%eax),%edx
c0102bd1:	85 c0                	test   %eax,%eax
c0102bd3:	0f 48 c2             	cmovs  %edx,%eax
c0102bd6:	c1 f8 03             	sar    $0x3,%eax
c0102bd9:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0102bdc:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0102bdf:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0102be5:	85 c0                	test   %eax,%eax
c0102be7:	0f 48 c2             	cmovs  %edx,%eax
c0102bea:	c1 f8 09             	sar    $0x9,%eax
c0102bed:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0102bf0:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0102bf3:	99                   	cltd   
c0102bf4:	c1 ea 1d             	shr    $0x1d,%edx
c0102bf7:	01 d0                	add    %edx,%eax
c0102bf9:	83 e0 07             	and    $0x7,%eax
c0102bfc:	29 d0                	sub    %edx,%eax
c0102bfe:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0102c01:	c7 45 b8 20 00 00 00 	movl   $0x20,-0x48(%ebp)
c0102c08:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102c0d:	89 c2                	mov    %eax,%edx
c0102c0f:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0102c12:	83 c0 02             	add    $0x2,%eax
c0102c15:	83 ec 0c             	sub    $0xc,%esp
c0102c18:	6a 07                	push   $0x7
c0102c1a:	68 00 02 00 00       	push   $0x200
c0102c1f:	52                   	push   %edx
c0102c20:	ff 75 b8             	pushl  -0x48(%ebp)
c0102c23:	50                   	push   %eax
c0102c24:	e8 8b eb ff ff       	call   c01017b4 <rd_wt>
c0102c29:	83 c4 20             	add    $0x20,%esp
c0102c2c:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102c32:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0102c35:	01 d0                	add    %edx,%eax
c0102c37:	0f b6 10             	movzbl (%eax),%edx
c0102c3a:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0102c3d:	bb 01 00 00 00       	mov    $0x1,%ebx
c0102c42:	89 c1                	mov    %eax,%ecx
c0102c44:	d3 e3                	shl    %cl,%ebx
c0102c46:	89 d8                	mov    %ebx,%eax
c0102c48:	f7 d0                	not    %eax
c0102c4a:	89 c3                	mov    %eax,%ebx
c0102c4c:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0102c52:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0102c55:	01 c8                	add    %ecx,%eax
c0102c57:	21 da                	and    %ebx,%edx
c0102c59:	88 10                	mov    %dl,(%eax)
c0102c5b:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102c60:	89 c2                	mov    %eax,%edx
c0102c62:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0102c65:	83 c0 02             	add    $0x2,%eax
c0102c68:	83 ec 0c             	sub    $0xc,%esp
c0102c6b:	6a 0a                	push   $0xa
c0102c6d:	68 00 02 00 00       	push   $0x200
c0102c72:	52                   	push   %edx
c0102c73:	ff 75 b8             	pushl  -0x48(%ebp)
c0102c76:	50                   	push   %eax
c0102c77:	e8 38 eb ff ff       	call   c01017b4 <rd_wt>
c0102c7c:	83 c4 20             	add    $0x20,%esp
c0102c7f:	e8 ec 08 00 00       	call   c0103570 <get_super_block>
c0102c84:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0102c87:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0102c8d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0102c90:	8b 00                	mov    (%eax),%eax
c0102c92:	29 c2                	sub    %eax,%edx
c0102c94:	89 d0                	mov    %edx,%eax
c0102c96:	83 c0 01             	add    $0x1,%eax
c0102c99:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0102c9c:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0102c9f:	8d 50 07             	lea    0x7(%eax),%edx
c0102ca2:	85 c0                	test   %eax,%eax
c0102ca4:	0f 48 c2             	cmovs  %edx,%eax
c0102ca7:	c1 f8 03             	sar    $0x3,%eax
c0102caa:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0102cad:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0102cb0:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0102cb6:	85 c0                	test   %eax,%eax
c0102cb8:	0f 48 c2             	cmovs  %edx,%eax
c0102cbb:	c1 f8 09             	sar    $0x9,%eax
c0102cbe:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0102cc1:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0102cc4:	99                   	cltd   
c0102cc5:	c1 ea 1d             	shr    $0x1d,%edx
c0102cc8:	01 d0                	add    %edx,%eax
c0102cca:	83 e0 07             	and    $0x7,%eax
c0102ccd:	29 d0                	sub    %edx,%eax
c0102ccf:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0102cd2:	b8 08 00 00 00       	mov    $0x8,%eax
c0102cd7:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c0102cda:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0102cdd:	29 c2                	sub    %eax,%edx
c0102cdf:	89 d0                	mov    %edx,%eax
c0102ce1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102ce4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102ce7:	8d 50 07             	lea    0x7(%eax),%edx
c0102cea:	85 c0                	test   %eax,%eax
c0102cec:	0f 48 c2             	cmovs  %edx,%eax
c0102cef:	c1 f8 03             	sar    $0x3,%eax
c0102cf2:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0102cf5:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102cfa:	89 c1                	mov    %eax,%ecx
c0102cfc:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0102cff:	8b 40 04             	mov    0x4(%eax),%eax
c0102d02:	8d 50 02             	lea    0x2(%eax),%edx
c0102d05:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0102d08:	01 d0                	add    %edx,%eax
c0102d0a:	83 ec 0c             	sub    $0xc,%esp
c0102d0d:	6a 07                	push   $0x7
c0102d0f:	68 00 02 00 00       	push   $0x200
c0102d14:	51                   	push   %ecx
c0102d15:	ff 75 b8             	pushl  -0x48(%ebp)
c0102d18:	50                   	push   %eax
c0102d19:	e8 96 ea ff ff       	call   c01017b4 <rd_wt>
c0102d1e:	83 c4 20             	add    $0x20,%esp
c0102d21:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102d27:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0102d2a:	01 d0                	add    %edx,%eax
c0102d2c:	0f b6 10             	movzbl (%eax),%edx
c0102d2f:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0102d32:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0102d37:	89 c1                	mov    %eax,%ecx
c0102d39:	d3 e3                	shl    %cl,%ebx
c0102d3b:	89 d8                	mov    %ebx,%eax
c0102d3d:	f7 d0                	not    %eax
c0102d3f:	89 c3                	mov    %eax,%ebx
c0102d41:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0102d47:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0102d4a:	01 c8                	add    %ecx,%eax
c0102d4c:	21 da                	and    %ebx,%edx
c0102d4e:	88 10                	mov    %dl,(%eax)
c0102d50:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0102d57:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0102d5a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102d5d:	eb 6b                	jmp    c0102dca <do_unlink+0x2a5>
c0102d5f:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0102d66:	75 4c                	jne    c0102db4 <do_unlink+0x28f>
c0102d68:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102d6f:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102d74:	83 ec 0c             	sub    $0xc,%esp
c0102d77:	6a 0a                	push   $0xa
c0102d79:	68 00 02 00 00       	push   $0x200
c0102d7e:	50                   	push   %eax
c0102d7f:	ff 75 b8             	pushl  -0x48(%ebp)
c0102d82:	ff 75 ec             	pushl  -0x14(%ebp)
c0102d85:	e8 2a ea ff ff       	call   c01017b4 <rd_wt>
c0102d8a:	83 c4 20             	add    $0x20,%esp
c0102d8d:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102d92:	89 c1                	mov    %eax,%ecx
c0102d94:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102d97:	8d 50 01             	lea    0x1(%eax),%edx
c0102d9a:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0102d9d:	83 ec 0c             	sub    $0xc,%esp
c0102da0:	6a 07                	push   $0x7
c0102da2:	68 00 02 00 00       	push   $0x200
c0102da7:	51                   	push   %ecx
c0102da8:	ff 75 b8             	pushl  -0x48(%ebp)
c0102dab:	50                   	push   %eax
c0102dac:	e8 03 ea ff ff       	call   c01017b4 <rd_wt>
c0102db1:	83 c4 20             	add    $0x20,%esp
c0102db4:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102dba:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102dbd:	01 d0                	add    %edx,%eax
c0102dbf:	c6 00 00             	movb   $0x0,(%eax)
c0102dc2:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0102dc6:	83 6d f4 08          	subl   $0x8,-0xc(%ebp)
c0102dca:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102dcd:	3b 45 a0             	cmp    -0x60(%ebp),%eax
c0102dd0:	7c 8d                	jl     c0102d5f <do_unlink+0x23a>
c0102dd2:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0102dd9:	75 4c                	jne    c0102e27 <do_unlink+0x302>
c0102ddb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102de2:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102de7:	83 ec 0c             	sub    $0xc,%esp
c0102dea:	6a 0a                	push   $0xa
c0102dec:	68 00 02 00 00       	push   $0x200
c0102df1:	50                   	push   %eax
c0102df2:	ff 75 b8             	pushl  -0x48(%ebp)
c0102df5:	ff 75 ec             	pushl  -0x14(%ebp)
c0102df8:	e8 b7 e9 ff ff       	call   c01017b4 <rd_wt>
c0102dfd:	83 c4 20             	add    $0x20,%esp
c0102e00:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102e05:	89 c1                	mov    %eax,%ecx
c0102e07:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102e0a:	8d 50 01             	lea    0x1(%eax),%edx
c0102e0d:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0102e10:	83 ec 0c             	sub    $0xc,%esp
c0102e13:	6a 07                	push   $0x7
c0102e15:	68 00 02 00 00       	push   $0x200
c0102e1a:	51                   	push   %ecx
c0102e1b:	ff 75 b8             	pushl  -0x48(%ebp)
c0102e1e:	50                   	push   %eax
c0102e1f:	e8 90 e9 ff ff       	call   c01017b4 <rd_wt>
c0102e24:	83 c4 20             	add    $0x20,%esp
c0102e27:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102e2d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102e30:	01 d0                	add    %edx,%eax
c0102e32:	0f b6 10             	movzbl (%eax),%edx
c0102e35:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102e38:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0102e3d:	89 c1                	mov    %eax,%ecx
c0102e3f:	d3 e3                	shl    %cl,%ebx
c0102e41:	89 d8                	mov    %ebx,%eax
c0102e43:	89 c3                	mov    %eax,%ebx
c0102e45:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0102e4b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102e4e:	01 c8                	add    %ecx,%eax
c0102e50:	21 da                	and    %ebx,%edx
c0102e52:	88 10                	mov    %dl,(%eax)
c0102e54:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102e59:	83 ec 0c             	sub    $0xc,%esp
c0102e5c:	6a 0a                	push   $0xa
c0102e5e:	68 00 02 00 00       	push   $0x200
c0102e63:	50                   	push   %eax
c0102e64:	ff 75 b8             	pushl  -0x48(%ebp)
c0102e67:	ff 75 ec             	pushl  -0x14(%ebp)
c0102e6a:	e8 45 e9 ff ff       	call   c01017b4 <rd_wt>
c0102e6f:	83 c4 20             	add    $0x20,%esp
c0102e72:	c7 85 6c ff ff ff 00 	movl   $0x0,-0x94(%ebp)
c0102e79:	00 00 00 
c0102e7c:	c7 85 68 ff ff ff 00 	movl   $0x0,-0x98(%ebp)
c0102e83:	00 00 00 
c0102e86:	c7 85 70 ff ff ff 00 	movl   $0x0,-0x90(%ebp)
c0102e8d:	00 00 00 
c0102e90:	83 ec 0c             	sub    $0xc,%esp
c0102e93:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0102e99:	50                   	push   %eax
c0102e9a:	e8 ed 04 00 00       	call   c010338c <sync_inode>
c0102e9f:	83 c4 10             	add    $0x10,%esp
c0102ea2:	83 ec 0c             	sub    $0xc,%esp
c0102ea5:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0102eab:	50                   	push   %eax
c0102eac:	e8 2f 06 00 00       	call   c01034e0 <put_inode>
c0102eb1:	83 c4 10             	add    $0x10,%esp
c0102eb4:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0102eb7:	8b 00                	mov    (%eax),%eax
c0102eb9:	89 45 9c             	mov    %eax,-0x64(%ebp)
c0102ebc:	c7 45 98 c0 21 11 c0 	movl   $0xc01121c0,-0x68(%ebp)
c0102ec3:	8b 45 98             	mov    -0x68(%ebp),%eax
c0102ec6:	8b 40 04             	mov    0x4(%eax),%eax
c0102ec9:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0102ecc:	8b 45 98             	mov    -0x68(%ebp),%eax
c0102ecf:	8b 40 0c             	mov    0xc(%eax),%eax
c0102ed2:	89 45 90             	mov    %eax,-0x70(%ebp)
c0102ed5:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0102ed8:	c1 e8 04             	shr    $0x4,%eax
c0102edb:	89 45 8c             	mov    %eax,-0x74(%ebp)
c0102ede:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0102ee5:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0102eec:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0102ef3:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0102efa:	e9 a5 00 00 00       	jmp    c0102fa4 <do_unlink+0x47f>
c0102eff:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102f04:	89 c1                	mov    %eax,%ecx
c0102f06:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0102f09:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0102f0c:	01 d0                	add    %edx,%eax
c0102f0e:	83 ec 0c             	sub    $0xc,%esp
c0102f11:	6a 07                	push   $0x7
c0102f13:	68 00 02 00 00       	push   $0x200
c0102f18:	51                   	push   %ecx
c0102f19:	ff 75 b8             	pushl  -0x48(%ebp)
c0102f1c:	50                   	push   %eax
c0102f1d:	e8 92 e8 ff ff       	call   c01017b4 <rd_wt>
c0102f22:	83 c4 20             	add    $0x20,%esp
c0102f25:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0102f2a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0102f2d:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0102f34:	eb 51                	jmp    c0102f87 <do_unlink+0x462>
c0102f36:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0102f3a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102f3d:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0102f40:	7f 4f                	jg     c0102f91 <do_unlink+0x46c>
c0102f42:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0102f45:	83 c0 10             	add    $0x10,%eax
c0102f48:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0102f4b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0102f4e:	83 c0 04             	add    $0x4,%eax
c0102f51:	83 ec 08             	sub    $0x8,%esp
c0102f54:	ff 75 08             	pushl  0x8(%ebp)
c0102f57:	50                   	push   %eax
c0102f58:	e8 a2 66 00 00       	call   c01095ff <strcmp>
c0102f5d:	83 c4 10             	add    $0x10,%esp
c0102f60:	85 c0                	test   %eax,%eax
c0102f62:	75 1b                	jne    c0102f7f <do_unlink+0x45a>
c0102f64:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c0102f6b:	83 ec 04             	sub    $0x4,%esp
c0102f6e:	6a 10                	push   $0x10
c0102f70:	6a 00                	push   $0x0
c0102f72:	ff 75 d4             	pushl  -0x2c(%ebp)
c0102f75:	e8 f1 82 00 00       	call   c010b26b <Memset>
c0102f7a:	83 c4 10             	add    $0x10,%esp
c0102f7d:	eb 13                	jmp    c0102f92 <do_unlink+0x46d>
c0102f7f:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
c0102f83:	83 45 d4 10          	addl   $0x10,-0x2c(%ebp)
c0102f87:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0102f8a:	3b 45 90             	cmp    -0x70(%ebp),%eax
c0102f8d:	7c a7                	jl     c0102f36 <do_unlink+0x411>
c0102f8f:	eb 01                	jmp    c0102f92 <do_unlink+0x46d>
c0102f91:	90                   	nop
c0102f92:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102f95:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0102f98:	7f 16                	jg     c0102fb0 <do_unlink+0x48b>
c0102f9a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0102f9e:	75 10                	jne    c0102fb0 <do_unlink+0x48b>
c0102fa0:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
c0102fa4:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0102fa7:	3b 45 90             	cmp    -0x70(%ebp),%eax
c0102faa:	0f 8c 4f ff ff ff    	jl     c0102eff <do_unlink+0x3da>
c0102fb0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102fb3:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0102fb6:	75 17                	jne    c0102fcf <do_unlink+0x4aa>
c0102fb8:	8b 45 98             	mov    -0x68(%ebp),%eax
c0102fbb:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0102fbe:	89 50 04             	mov    %edx,0x4(%eax)
c0102fc1:	83 ec 0c             	sub    $0xc,%esp
c0102fc4:	ff 75 98             	pushl  -0x68(%ebp)
c0102fc7:	e8 c0 03 00 00       	call   c010338c <sync_inode>
c0102fcc:	83 c4 10             	add    $0x10,%esp
c0102fcf:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0102fd3:	74 26                	je     c0102ffb <do_unlink+0x4d6>
c0102fd5:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102fda:	89 c1                	mov    %eax,%ecx
c0102fdc:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0102fdf:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102fe2:	01 d0                	add    %edx,%eax
c0102fe4:	83 ec 0c             	sub    $0xc,%esp
c0102fe7:	6a 0a                	push   $0xa
c0102fe9:	68 00 02 00 00       	push   $0x200
c0102fee:	51                   	push   %ecx
c0102fef:	ff 75 b8             	pushl  -0x48(%ebp)
c0102ff2:	50                   	push   %eax
c0102ff3:	e8 bc e7 ff ff       	call   c01017b4 <rd_wt>
c0102ff8:	83 c4 20             	add    $0x20,%esp
c0102ffb:	90                   	nop
c0102ffc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0102fff:	c9                   	leave  
c0103000:	c3                   	ret    

c0103001 <do_rdwt>:
c0103001:	55                   	push   %ebp
c0103002:	89 e5                	mov    %esp,%ebp
c0103004:	81 ec 98 00 00 00    	sub    $0x98,%esp
c010300a:	8b 45 08             	mov    0x8(%ebp),%eax
c010300d:	8b 40 78             	mov    0x78(%eax),%eax
c0103010:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0103013:	8b 45 08             	mov    0x8(%ebp),%eax
c0103016:	8b 40 60             	mov    0x60(%eax),%eax
c0103019:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010301c:	8b 45 08             	mov    0x8(%ebp),%eax
c010301f:	8b 40 6c             	mov    0x6c(%eax),%eax
c0103022:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0103025:	8b 45 08             	mov    0x8(%ebp),%eax
c0103028:	8b 00                	mov    (%eax),%eax
c010302a:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010302d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103030:	8b 40 10             	mov    0x10(%eax),%eax
c0103033:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0103036:	8b 45 08             	mov    0x8(%ebp),%eax
c0103039:	8b 40 50             	mov    0x50(%eax),%eax
c010303c:	89 45 c8             	mov    %eax,-0x38(%ebp)
c010303f:	83 ec 0c             	sub    $0xc,%esp
c0103042:	ff 75 d0             	pushl  -0x30(%ebp)
c0103045:	e8 0c 07 00 00       	call   c0103756 <pid2proc>
c010304a:	83 c4 10             	add    $0x10,%esp
c010304d:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0103050:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0103053:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0103056:	83 c2 4c             	add    $0x4c,%edx
c0103059:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c010305d:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0103060:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0103063:	8b 40 08             	mov    0x8(%eax),%eax
c0103066:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0103069:	8b 45 08             	mov    0x8(%ebp),%eax
c010306c:	8b 00                	mov    (%eax),%eax
c010306e:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0103071:	83 ec 08             	sub    $0x8,%esp
c0103074:	ff 75 bc             	pushl  -0x44(%ebp)
c0103077:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c010307d:	50                   	push   %eax
c010307e:	e8 0d f2 ff ff       	call   c0102290 <get_inode>
c0103083:	83 c4 10             	add    $0x10,%esp
c0103086:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0103089:	83 7d b4 00          	cmpl   $0x0,-0x4c(%ebp)
c010308d:	75 10                	jne    c010309f <do_rdwt+0x9e>
c010308f:	83 ec 0c             	sub    $0xc,%esp
c0103092:	68 88 a6 10 c0       	push   $0xc010a688
c0103097:	e8 6e 55 00 00       	call   c010860a <panic>
c010309c:	83 c4 10             	add    $0x10,%esp
c010309f:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c01030a5:	89 45 b0             	mov    %eax,-0x50(%ebp)
c01030a8:	8b 45 c0             	mov    -0x40(%ebp),%eax
c01030ab:	8b 40 04             	mov    0x4(%eax),%eax
c01030ae:	89 45 ac             	mov    %eax,-0x54(%ebp)
c01030b1:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c01030b5:	74 22                	je     c01030d9 <do_rdwt+0xd8>
c01030b7:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c01030bb:	74 1c                	je     c01030d9 <do_rdwt+0xd8>
c01030bd:	68 a7 04 00 00       	push   $0x4a7
c01030c2:	68 f4 a4 10 c0       	push   $0xc010a4f4
c01030c7:	68 f4 a4 10 c0       	push   $0xc010a4f4
c01030cc:	68 98 a6 10 c0       	push   $0xc010a698
c01030d1:	e8 52 55 00 00       	call   c0108628 <assertion_failure>
c01030d6:	83 c4 10             	add    $0x10,%esp
c01030d9:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
c01030df:	83 f8 01             	cmp    $0x1,%eax
c01030e2:	0f 85 86 00 00 00    	jne    c010316e <do_rdwt+0x16d>
c01030e8:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c01030ec:	75 09                	jne    c01030f7 <do_rdwt+0xf6>
c01030ee:	c7 45 f4 d2 07 00 00 	movl   $0x7d2,-0xc(%ebp)
c01030f5:	eb 0d                	jmp    c0103104 <do_rdwt+0x103>
c01030f7:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c01030fb:	75 07                	jne    c0103104 <do_rdwt+0x103>
c01030fd:	c7 45 f4 d3 07 00 00 	movl   $0x7d3,-0xc(%ebp)
c0103104:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0103107:	8b 45 08             	mov    0x8(%ebp),%eax
c010310a:	89 50 78             	mov    %edx,0x78(%eax)
c010310d:	8b 55 b8             	mov    -0x48(%ebp),%edx
c0103110:	8b 45 08             	mov    0x8(%ebp),%eax
c0103113:	89 50 68             	mov    %edx,0x68(%eax)
c0103116:	83 ec 04             	sub    $0x4,%esp
c0103119:	6a 04                	push   $0x4
c010311b:	ff 75 08             	pushl  0x8(%ebp)
c010311e:	6a 03                	push   $0x3
c0103120:	e8 73 61 00 00       	call   c0109298 <send_rec>
c0103125:	83 c4 10             	add    $0x10,%esp
c0103128:	8b 45 08             	mov    0x8(%ebp),%eax
c010312b:	8b 40 78             	mov    0x78(%eax),%eax
c010312e:	83 f8 66             	cmp    $0x66,%eax
c0103131:	75 13                	jne    c0103146 <do_rdwt+0x145>
c0103133:	83 ec 04             	sub    $0x4,%esp
c0103136:	ff 75 b8             	pushl  -0x48(%ebp)
c0103139:	ff 75 08             	pushl  0x8(%ebp)
c010313c:	6a 01                	push   $0x1
c010313e:	e8 55 61 00 00       	call   c0109298 <send_rec>
c0103143:	83 c4 10             	add    $0x10,%esp
c0103146:	8b 45 08             	mov    0x8(%ebp),%eax
c0103149:	8b 40 78             	mov    0x78(%eax),%eax
c010314c:	83 f8 65             	cmp    $0x65,%eax
c010314f:	75 13                	jne    c0103164 <do_rdwt+0x163>
c0103151:	83 ec 04             	sub    $0x4,%esp
c0103154:	ff 75 b8             	pushl  -0x48(%ebp)
c0103157:	ff 75 08             	pushl  0x8(%ebp)
c010315a:	6a 01                	push   $0x1
c010315c:	e8 37 61 00 00       	call   c0109298 <send_rec>
c0103161:	83 c4 10             	add    $0x10,%esp
c0103164:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0103169:	e9 1c 02 00 00       	jmp    c010338a <do_rdwt+0x389>
c010316e:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c0103172:	75 18                	jne    c010318c <do_rdwt+0x18b>
c0103174:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c010317a:	c1 e0 09             	shl    $0x9,%eax
c010317d:	39 45 ac             	cmp    %eax,-0x54(%ebp)
c0103180:	75 0a                	jne    c010318c <do_rdwt+0x18b>
c0103182:	b8 00 00 00 00       	mov    $0x0,%eax
c0103187:	e9 fe 01 00 00       	jmp    c010338a <do_rdwt+0x389>
c010318c:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c0103190:	75 14                	jne    c01031a6 <do_rdwt+0x1a5>
c0103192:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0103195:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0103198:	01 d0                	add    %edx,%eax
c010319a:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c010319d:	0f 4e 45 b0          	cmovle -0x50(%ebp),%eax
c01031a1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01031a4:	eb 19                	jmp    c01031bf <do_rdwt+0x1be>
c01031a6:	8b 55 ac             	mov    -0x54(%ebp),%edx
c01031a9:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01031ac:	01 c2                	add    %eax,%edx
c01031ae:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c01031b4:	c1 e0 09             	shl    $0x9,%eax
c01031b7:	39 c2                	cmp    %eax,%edx
c01031b9:	0f 4e c2             	cmovle %edx,%eax
c01031bc:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01031bf:	8b 45 ac             	mov    -0x54(%ebp),%eax
c01031c2:	99                   	cltd   
c01031c3:	c1 ea 17             	shr    $0x17,%edx
c01031c6:	01 d0                	add    %edx,%eax
c01031c8:	25 ff 01 00 00       	and    $0x1ff,%eax
c01031cd:	29 d0                	sub    %edx,%eax
c01031cf:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01031d2:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c01031d8:	8b 45 ac             	mov    -0x54(%ebp),%eax
c01031db:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c01031e1:	85 c0                	test   %eax,%eax
c01031e3:	0f 48 c1             	cmovs  %ecx,%eax
c01031e6:	c1 f8 09             	sar    $0x9,%eax
c01031e9:	01 d0                	add    %edx,%eax
c01031eb:	89 45 a8             	mov    %eax,-0x58(%ebp)
c01031ee:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c01031f4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01031f7:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c01031fd:	85 c0                	test   %eax,%eax
c01031ff:	0f 48 c1             	cmovs  %ecx,%eax
c0103202:	c1 f8 09             	sar    $0x9,%eax
c0103205:	01 d0                	add    %edx,%eax
c0103207:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c010320a:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c010320d:	2b 45 a8             	sub    -0x58(%ebp),%eax
c0103210:	ba 00 00 10 00       	mov    $0x100000,%edx
c0103215:	39 d0                	cmp    %edx,%eax
c0103217:	7d 0b                	jge    c0103224 <do_rdwt+0x223>
c0103219:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c010321c:	2b 45 a8             	sub    -0x58(%ebp),%eax
c010321f:	83 c0 01             	add    $0x1,%eax
c0103222:	eb 05                	jmp    c0103229 <do_rdwt+0x228>
c0103224:	b8 00 00 10 00       	mov    $0x100000,%eax
c0103229:	89 45 a0             	mov    %eax,-0x60(%ebp)
c010322c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010322f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0103232:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0103239:	8b 45 08             	mov    0x8(%ebp),%eax
c010323c:	8b 00                	mov    (%eax),%eax
c010323e:	83 ec 0c             	sub    $0xc,%esp
c0103241:	50                   	push   %eax
c0103242:	e8 0f 05 00 00       	call   c0103756 <pid2proc>
c0103247:	83 c4 10             	add    $0x10,%esp
c010324a:	89 45 9c             	mov    %eax,-0x64(%ebp)
c010324d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0103250:	83 ec 08             	sub    $0x8,%esp
c0103253:	50                   	push   %eax
c0103254:	ff 75 cc             	pushl  -0x34(%ebp)
c0103257:	e8 30 2b 00 00       	call   c0105d8c <alloc_virtual_memory>
c010325c:	83 c4 10             	add    $0x10,%esp
c010325f:	89 45 98             	mov    %eax,-0x68(%ebp)
c0103262:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0103265:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0103268:	e9 c5 00 00 00       	jmp    c0103332 <do_rdwt+0x331>
c010326d:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0103270:	c1 e0 09             	shl    $0x9,%eax
c0103273:	2b 45 ec             	sub    -0x14(%ebp),%eax
c0103276:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c0103279:	0f 4e 45 e8          	cmovle -0x18(%ebp),%eax
c010327d:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0103280:	c7 45 90 20 00 00 00 	movl   $0x20,-0x70(%ebp)
c0103287:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c010328b:	75 46                	jne    c01032d3 <do_rdwt+0x2d2>
c010328d:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0103290:	c1 e0 09             	shl    $0x9,%eax
c0103293:	8b 15 84 17 11 c0    	mov    0xc0111784,%edx
c0103299:	83 ec 0c             	sub    $0xc,%esp
c010329c:	6a 07                	push   $0x7
c010329e:	50                   	push   %eax
c010329f:	52                   	push   %edx
c01032a0:	ff 75 90             	pushl  -0x70(%ebp)
c01032a3:	ff 75 e0             	pushl  -0x20(%ebp)
c01032a6:	e8 09 e5 ff ff       	call   c01017b4 <rd_wt>
c01032ab:	83 c4 20             	add    $0x20,%esp
c01032ae:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01032b4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01032b7:	01 d0                	add    %edx,%eax
c01032b9:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c01032bc:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01032bf:	01 ca                	add    %ecx,%edx
c01032c1:	83 ec 04             	sub    $0x4,%esp
c01032c4:	ff 75 94             	pushl  -0x6c(%ebp)
c01032c7:	50                   	push   %eax
c01032c8:	52                   	push   %edx
c01032c9:	e8 2b 39 00 00       	call   c0106bf9 <Memcpy>
c01032ce:	83 c4 10             	add    $0x10,%esp
c01032d1:	eb 46                	jmp    c0103319 <do_rdwt+0x318>
c01032d3:	8b 55 98             	mov    -0x68(%ebp),%edx
c01032d6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01032d9:	01 d0                	add    %edx,%eax
c01032db:	89 c1                	mov    %eax,%ecx
c01032dd:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01032e3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01032e6:	01 d0                	add    %edx,%eax
c01032e8:	83 ec 04             	sub    $0x4,%esp
c01032eb:	ff 75 94             	pushl  -0x6c(%ebp)
c01032ee:	51                   	push   %ecx
c01032ef:	50                   	push   %eax
c01032f0:	e8 04 39 00 00       	call   c0106bf9 <Memcpy>
c01032f5:	83 c4 10             	add    $0x10,%esp
c01032f8:	8b 45 a0             	mov    -0x60(%ebp),%eax
c01032fb:	c1 e0 09             	shl    $0x9,%eax
c01032fe:	8b 15 84 17 11 c0    	mov    0xc0111784,%edx
c0103304:	83 ec 0c             	sub    $0xc,%esp
c0103307:	6a 0a                	push   $0xa
c0103309:	50                   	push   %eax
c010330a:	52                   	push   %edx
c010330b:	ff 75 90             	pushl  -0x70(%ebp)
c010330e:	ff 75 e0             	pushl  -0x20(%ebp)
c0103311:	e8 9e e4 ff ff       	call   c01017b4 <rd_wt>
c0103316:	83 c4 20             	add    $0x20,%esp
c0103319:	8b 45 94             	mov    -0x6c(%ebp),%eax
c010331c:	29 45 e8             	sub    %eax,-0x18(%ebp)
c010331f:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0103322:	01 45 e4             	add    %eax,-0x1c(%ebp)
c0103325:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c010332c:	8b 45 a0             	mov    -0x60(%ebp),%eax
c010332f:	01 45 e0             	add    %eax,-0x20(%ebp)
c0103332:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0103335:	3b 45 a4             	cmp    -0x5c(%ebp),%eax
c0103338:	7f 0a                	jg     c0103344 <do_rdwt+0x343>
c010333a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c010333e:	0f 85 29 ff ff ff    	jne    c010326d <do_rdwt+0x26c>
c0103344:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0103347:	8b 50 04             	mov    0x4(%eax),%edx
c010334a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010334d:	01 c2                	add    %eax,%edx
c010334f:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0103352:	89 50 04             	mov    %edx,0x4(%eax)
c0103355:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0103358:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010335b:	01 c2                	add    %eax,%edx
c010335d:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c0103363:	39 c2                	cmp    %eax,%edx
c0103365:	7e 20                	jle    c0103387 <do_rdwt+0x386>
c0103367:	8b 55 ac             	mov    -0x54(%ebp),%edx
c010336a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010336d:	01 d0                	add    %edx,%eax
c010336f:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c0103375:	83 ec 0c             	sub    $0xc,%esp
c0103378:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c010337e:	50                   	push   %eax
c010337f:	e8 08 00 00 00       	call   c010338c <sync_inode>
c0103384:	83 c4 10             	add    $0x10,%esp
c0103387:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010338a:	c9                   	leave  
c010338b:	c3                   	ret    

c010338c <sync_inode>:
c010338c:	55                   	push   %ebp
c010338d:	89 e5                	mov    %esp,%ebp
c010338f:	53                   	push   %ebx
c0103390:	83 ec 34             	sub    $0x34,%esp
c0103393:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010339a:	eb 74                	jmp    c0103410 <sync_inode+0x84>
c010339c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010339f:	89 d0                	mov    %edx,%eax
c01033a1:	c1 e0 02             	shl    $0x2,%eax
c01033a4:	01 d0                	add    %edx,%eax
c01033a6:	c1 e0 03             	shl    $0x3,%eax
c01033a9:	05 b0 17 11 c0       	add    $0xc01117b0,%eax
c01033ae:	8b 10                	mov    (%eax),%edx
c01033b0:	8b 45 08             	mov    0x8(%ebp),%eax
c01033b3:	8b 40 10             	mov    0x10(%eax),%eax
c01033b6:	39 c2                	cmp    %eax,%edx
c01033b8:	75 52                	jne    c010340c <sync_inode+0x80>
c01033ba:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01033bd:	89 d0                	mov    %edx,%eax
c01033bf:	c1 e0 02             	shl    $0x2,%eax
c01033c2:	01 d0                	add    %edx,%eax
c01033c4:	c1 e0 03             	shl    $0x3,%eax
c01033c7:	8d 90 a0 17 11 c0    	lea    -0x3feee860(%eax),%edx
c01033cd:	8b 45 08             	mov    0x8(%ebp),%eax
c01033d0:	8b 08                	mov    (%eax),%ecx
c01033d2:	89 0a                	mov    %ecx,(%edx)
c01033d4:	8b 48 04             	mov    0x4(%eax),%ecx
c01033d7:	89 4a 04             	mov    %ecx,0x4(%edx)
c01033da:	8b 48 08             	mov    0x8(%eax),%ecx
c01033dd:	89 4a 08             	mov    %ecx,0x8(%edx)
c01033e0:	8b 48 0c             	mov    0xc(%eax),%ecx
c01033e3:	89 4a 0c             	mov    %ecx,0xc(%edx)
c01033e6:	8b 48 10             	mov    0x10(%eax),%ecx
c01033e9:	89 4a 10             	mov    %ecx,0x10(%edx)
c01033ec:	8b 48 14             	mov    0x14(%eax),%ecx
c01033ef:	89 4a 14             	mov    %ecx,0x14(%edx)
c01033f2:	8b 48 18             	mov    0x18(%eax),%ecx
c01033f5:	89 4a 18             	mov    %ecx,0x18(%edx)
c01033f8:	8b 48 1c             	mov    0x1c(%eax),%ecx
c01033fb:	89 4a 1c             	mov    %ecx,0x1c(%edx)
c01033fe:	8b 48 20             	mov    0x20(%eax),%ecx
c0103401:	89 4a 20             	mov    %ecx,0x20(%edx)
c0103404:	8b 40 24             	mov    0x24(%eax),%eax
c0103407:	89 42 24             	mov    %eax,0x24(%edx)
c010340a:	eb 0a                	jmp    c0103416 <sync_inode+0x8a>
c010340c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0103410:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c0103414:	7e 86                	jle    c010339c <sync_inode+0x10>
c0103416:	c7 45 f0 20 00 00 00 	movl   $0x20,-0x10(%ebp)
c010341d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103420:	8b 40 10             	mov    0x10(%eax),%eax
c0103423:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103426:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103429:	8d 48 ff             	lea    -0x1(%eax),%ecx
c010342c:	b8 00 02 00 00       	mov    $0x200,%eax
c0103431:	99                   	cltd   
c0103432:	f7 7d f0             	idivl  -0x10(%ebp)
c0103435:	89 c3                	mov    %eax,%ebx
c0103437:	89 c8                	mov    %ecx,%eax
c0103439:	99                   	cltd   
c010343a:	f7 fb                	idiv   %ebx
c010343c:	89 55 e8             	mov    %edx,-0x18(%ebp)
c010343f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103442:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0103445:	b8 00 02 00 00       	mov    $0x200,%eax
c010344a:	99                   	cltd   
c010344b:	f7 7d f0             	idivl  -0x10(%ebp)
c010344e:	89 c3                	mov    %eax,%ebx
c0103450:	89 c8                	mov    %ecx,%eax
c0103452:	99                   	cltd   
c0103453:	f7 fb                	idiv   %ebx
c0103455:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0103458:	8b 45 08             	mov    0x8(%ebp),%eax
c010345b:	8b 40 20             	mov    0x20(%eax),%eax
c010345e:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0103461:	e8 0a 01 00 00       	call   c0103570 <get_super_block>
c0103466:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0103469:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010346c:	8b 40 04             	mov    0x4(%eax),%eax
c010346f:	8d 50 02             	lea    0x2(%eax),%edx
c0103472:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0103475:	8b 40 08             	mov    0x8(%eax),%eax
c0103478:	01 c2                	add    %eax,%edx
c010347a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010347d:	01 d0                	add    %edx,%eax
c010347f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0103482:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0103487:	83 ec 0c             	sub    $0xc,%esp
c010348a:	6a 07                	push   $0x7
c010348c:	68 00 02 00 00       	push   $0x200
c0103491:	50                   	push   %eax
c0103492:	ff 75 e0             	pushl  -0x20(%ebp)
c0103495:	ff 75 d8             	pushl  -0x28(%ebp)
c0103498:	e8 17 e3 ff ff       	call   c01017b4 <rd_wt>
c010349d:	83 c4 20             	add    $0x20,%esp
c01034a0:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c01034a5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01034a8:	83 ec 04             	sub    $0x4,%esp
c01034ab:	ff 75 f0             	pushl  -0x10(%ebp)
c01034ae:	ff 75 08             	pushl  0x8(%ebp)
c01034b1:	ff 75 d4             	pushl  -0x2c(%ebp)
c01034b4:	e8 40 37 00 00       	call   c0106bf9 <Memcpy>
c01034b9:	83 c4 10             	add    $0x10,%esp
c01034bc:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01034c1:	83 ec 0c             	sub    $0xc,%esp
c01034c4:	6a 0a                	push   $0xa
c01034c6:	68 00 02 00 00       	push   $0x200
c01034cb:	50                   	push   %eax
c01034cc:	ff 75 e0             	pushl  -0x20(%ebp)
c01034cf:	ff 75 d8             	pushl  -0x28(%ebp)
c01034d2:	e8 dd e2 ff ff       	call   c01017b4 <rd_wt>
c01034d7:	83 c4 20             	add    $0x20,%esp
c01034da:	90                   	nop
c01034db:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01034de:	c9                   	leave  
c01034df:	c3                   	ret    

c01034e0 <put_inode>:
c01034e0:	55                   	push   %ebp
c01034e1:	89 e5                	mov    %esp,%ebp
c01034e3:	83 ec 08             	sub    $0x8,%esp
c01034e6:	8b 45 08             	mov    0x8(%ebp),%eax
c01034e9:	8b 40 24             	mov    0x24(%eax),%eax
c01034ec:	85 c0                	test   %eax,%eax
c01034ee:	7f 1c                	jg     c010350c <put_inode+0x2c>
c01034f0:	68 4c 05 00 00       	push   $0x54c
c01034f5:	68 f4 a4 10 c0       	push   $0xc010a4f4
c01034fa:	68 f4 a4 10 c0       	push   $0xc010a4f4
c01034ff:	68 cc a6 10 c0       	push   $0xc010a6cc
c0103504:	e8 1f 51 00 00       	call   c0108628 <assertion_failure>
c0103509:	83 c4 10             	add    $0x10,%esp
c010350c:	8b 45 08             	mov    0x8(%ebp),%eax
c010350f:	8b 40 24             	mov    0x24(%eax),%eax
c0103512:	8d 50 ff             	lea    -0x1(%eax),%edx
c0103515:	8b 45 08             	mov    0x8(%ebp),%eax
c0103518:	89 50 24             	mov    %edx,0x24(%eax)
c010351b:	90                   	nop
c010351c:	c9                   	leave  
c010351d:	c3                   	ret    

c010351e <do_close>:
c010351e:	55                   	push   %ebp
c010351f:	89 e5                	mov    %esp,%ebp
c0103521:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c0103526:	8b 55 08             	mov    0x8(%ebp),%edx
c0103529:	83 c2 4c             	add    $0x4c,%edx
c010352c:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c0103530:	8b 50 0c             	mov    0xc(%eax),%edx
c0103533:	83 ea 01             	sub    $0x1,%edx
c0103536:	89 50 0c             	mov    %edx,0xc(%eax)
c0103539:	8b 40 0c             	mov    0xc(%eax),%eax
c010353c:	85 c0                	test   %eax,%eax
c010353e:	75 16                	jne    c0103556 <do_close+0x38>
c0103540:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c0103545:	8b 55 08             	mov    0x8(%ebp),%edx
c0103548:	83 c2 4c             	add    $0x4c,%edx
c010354b:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c010354f:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0103556:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c010355b:	8b 55 08             	mov    0x8(%ebp),%edx
c010355e:	83 c2 4c             	add    $0x4c,%edx
c0103561:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
c0103568:	00 
c0103569:	b8 00 00 00 00       	mov    $0x0,%eax
c010356e:	5d                   	pop    %ebp
c010356f:	c3                   	ret    

c0103570 <get_super_block>:
c0103570:	55                   	push   %ebp
c0103571:	89 e5                	mov    %esp,%ebp
c0103573:	83 ec 08             	sub    $0x8,%esp
c0103576:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010357b:	83 ec 0c             	sub    $0xc,%esp
c010357e:	6a 07                	push   $0x7
c0103580:	68 00 02 00 00       	push   $0x200
c0103585:	50                   	push   %eax
c0103586:	6a 20                	push   $0x20
c0103588:	6a 01                	push   $0x1
c010358a:	e8 25 e2 ff ff       	call   c01017b4 <rd_wt>
c010358f:	83 c4 20             	add    $0x20,%esp
c0103592:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0103598:	a1 a0 21 11 c0       	mov    0xc01121a0,%eax
c010359d:	8b 0a                	mov    (%edx),%ecx
c010359f:	89 08                	mov    %ecx,(%eax)
c01035a1:	8b 4a 04             	mov    0x4(%edx),%ecx
c01035a4:	89 48 04             	mov    %ecx,0x4(%eax)
c01035a7:	8b 4a 08             	mov    0x8(%edx),%ecx
c01035aa:	89 48 08             	mov    %ecx,0x8(%eax)
c01035ad:	8b 4a 0c             	mov    0xc(%edx),%ecx
c01035b0:	89 48 0c             	mov    %ecx,0xc(%eax)
c01035b3:	8b 4a 10             	mov    0x10(%edx),%ecx
c01035b6:	89 48 10             	mov    %ecx,0x10(%eax)
c01035b9:	8b 4a 14             	mov    0x14(%edx),%ecx
c01035bc:	89 48 14             	mov    %ecx,0x14(%eax)
c01035bf:	8b 4a 18             	mov    0x18(%edx),%ecx
c01035c2:	89 48 18             	mov    %ecx,0x18(%eax)
c01035c5:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c01035c8:	89 48 1c             	mov    %ecx,0x1c(%eax)
c01035cb:	8b 52 20             	mov    0x20(%edx),%edx
c01035ce:	89 50 20             	mov    %edx,0x20(%eax)
c01035d1:	a1 a0 21 11 c0       	mov    0xc01121a0,%eax
c01035d6:	c9                   	leave  
c01035d7:	c3                   	ret    

c01035d8 <schedule_process>:
c01035d8:	55                   	push   %ebp
c01035d9:	89 e5                	mov    %esp,%ebp
c01035db:	83 ec 18             	sub    $0x18,%esp
c01035de:	c7 45 f4 00 00 40 00 	movl   $0x400000,-0xc(%ebp)
c01035e5:	e8 b9 cd ff ff       	call   c01003a3 <get_running_thread_pcb>
c01035ea:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01035ed:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01035f0:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01035f7:	84 c0                	test   %al,%al
c01035f9:	75 35                	jne    c0103630 <schedule_process+0x58>
c01035fb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01035fe:	8b 90 1c 01 00 00    	mov    0x11c(%eax),%edx
c0103604:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103607:	89 90 18 01 00 00    	mov    %edx,0x118(%eax)
c010360d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103610:	c6 80 3c 02 00 00 03 	movb   $0x3,0x23c(%eax)
c0103617:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010361a:	05 60 02 00 00       	add    $0x260,%eax
c010361f:	83 ec 08             	sub    $0x8,%esp
c0103622:	50                   	push   %eax
c0103623:	68 ec fd 10 c0       	push   $0xc010fdec
c0103628:	e8 9a 69 00 00       	call   c0109fc7 <insertToDoubleLinkList>
c010362d:	83 c4 10             	add    $0x10,%esp
c0103630:	83 ec 0c             	sub    $0xc,%esp
c0103633:	68 ec fd 10 c0       	push   $0xc010fdec
c0103638:	e8 a6 67 00 00       	call   c0109de3 <isListEmpty>
c010363d:	83 c4 10             	add    $0x10,%esp
c0103640:	84 c0                	test   %al,%al
c0103642:	74 19                	je     c010365d <schedule_process+0x85>
c0103644:	6a 1e                	push   $0x1e
c0103646:	68 db a6 10 c0       	push   $0xc010a6db
c010364b:	68 db a6 10 c0       	push   $0xc010a6db
c0103650:	68 e5 a6 10 c0       	push   $0xc010a6e5
c0103655:	e8 ce 4f 00 00       	call   c0108628 <assertion_failure>
c010365a:	83 c4 10             	add    $0x10,%esp
c010365d:	83 ec 0c             	sub    $0xc,%esp
c0103660:	68 ec fd 10 c0       	push   $0xc010fdec
c0103665:	e8 e0 69 00 00       	call   c010a04a <popFromDoubleLinkList>
c010366a:	83 c4 10             	add    $0x10,%esp
c010366d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103670:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103673:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0103678:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010367b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010367e:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0103685:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103688:	8b 50 08             	mov    0x8(%eax),%edx
c010368b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010368e:	39 c2                	cmp    %eax,%edx
c0103690:	74 28                	je     c01036ba <schedule_process+0xe2>
c0103692:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103695:	05 00 10 00 00       	add    $0x1000,%eax
c010369a:	83 ec 0c             	sub    $0xc,%esp
c010369d:	50                   	push   %eax
c010369e:	e8 f1 cc ff ff       	call   c0100394 <update_tss>
c01036a3:	83 c4 10             	add    $0x10,%esp
c01036a6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01036a9:	8b 40 08             	mov    0x8(%eax),%eax
c01036ac:	83 ec 0c             	sub    $0xc,%esp
c01036af:	50                   	push   %eax
c01036b0:	e8 d2 cc ff ff       	call   c0100387 <update_cr3>
c01036b5:	83 c4 10             	add    $0x10,%esp
c01036b8:	eb 0f                	jmp    c01036c9 <schedule_process+0xf1>
c01036ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01036bd:	83 ec 0c             	sub    $0xc,%esp
c01036c0:	50                   	push   %eax
c01036c1:	e8 c1 cc ff ff       	call   c0100387 <update_cr3>
c01036c6:	83 c4 10             	add    $0x10,%esp
c01036c9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01036cc:	a3 c0 fb 10 c0       	mov    %eax,0xc010fbc0
c01036d1:	83 ec 08             	sub    $0x8,%esp
c01036d4:	ff 75 e8             	pushl  -0x18(%ebp)
c01036d7:	ff 75 f0             	pushl  -0x10(%ebp)
c01036da:	e8 c1 66 00 00       	call   c0109da0 <switch_to>
c01036df:	83 c4 10             	add    $0x10,%esp
c01036e2:	90                   	nop
c01036e3:	c9                   	leave  
c01036e4:	c3                   	ret    

c01036e5 <clock_handler>:
c01036e5:	55                   	push   %ebp
c01036e6:	89 e5                	mov    %esp,%ebp
c01036e8:	83 ec 18             	sub    $0x18,%esp
c01036eb:	e8 b3 cc ff ff       	call   c01003a3 <get_running_thread_pcb>
c01036f0:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01036f3:	a1 c0 06 11 c0       	mov    0xc01106c0,%eax
c01036f8:	85 c0                	test   %eax,%eax
c01036fa:	74 0d                	je     c0103709 <clock_handler+0x24>
c01036fc:	83 ec 0c             	sub    $0xc,%esp
c01036ff:	6a 04                	push   $0x4
c0103701:	e8 2c 5e 00 00       	call   c0109532 <inform_int>
c0103706:	83 c4 10             	add    $0x10,%esp
c0103709:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c010370e:	83 f8 64             	cmp    $0x64,%eax
c0103711:	75 0c                	jne    c010371f <clock_handler+0x3a>
c0103713:	c7 05 a8 f7 10 c0 01 	movl   $0x1,0xc010f7a8
c010371a:	00 00 00 
c010371d:	eb 0a                	jmp    c0103729 <clock_handler+0x44>
c010371f:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c0103724:	83 f8 01             	cmp    $0x1,%eax
c0103727:	75 2a                	jne    c0103753 <clock_handler+0x6e>
c0103729:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010372c:	8b 80 18 01 00 00    	mov    0x118(%eax),%eax
c0103732:	85 c0                	test   %eax,%eax
c0103734:	74 16                	je     c010374c <clock_handler+0x67>
c0103736:	a1 c0 fb 10 c0       	mov    0xc010fbc0,%eax
c010373b:	8b 90 18 01 00 00    	mov    0x118(%eax),%edx
c0103741:	83 ea 01             	sub    $0x1,%edx
c0103744:	89 90 18 01 00 00    	mov    %edx,0x118(%eax)
c010374a:	eb 08                	jmp    c0103754 <clock_handler+0x6f>
c010374c:	e8 87 fe ff ff       	call   c01035d8 <schedule_process>
c0103751:	eb 01                	jmp    c0103754 <clock_handler+0x6f>
c0103753:	90                   	nop
c0103754:	c9                   	leave  
c0103755:	c3                   	ret    

c0103756 <pid2proc>:
c0103756:	55                   	push   %ebp
c0103757:	89 e5                	mov    %esp,%ebp
c0103759:	83 ec 20             	sub    $0x20,%esp
c010375c:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0103763:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010376a:	a1 04 0f 11 c0       	mov    0xc0110f04,%eax
c010376f:	8b 15 08 0f 11 c0    	mov    0xc0110f08,%edx
c0103775:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103778:	89 55 f0             	mov    %edx,-0x10(%ebp)
c010377b:	a1 0c 0f 11 c0       	mov    0xc0110f0c,%eax
c0103780:	8b 15 10 0f 11 c0    	mov    0xc0110f10,%edx
c0103786:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0103789:	89 55 e8             	mov    %edx,-0x18(%ebp)
c010378c:	a1 08 0f 11 c0       	mov    0xc0110f08,%eax
c0103791:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103794:	eb 36                	jmp    c01037cc <pid2proc+0x76>
c0103796:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103799:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010379e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01037a1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01037a5:	75 07                	jne    c01037ae <pid2proc+0x58>
c01037a7:	c7 45 f8 04 00 00 00 	movl   $0x4,-0x8(%ebp)
c01037ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01037b1:	8b 90 14 01 00 00    	mov    0x114(%eax),%edx
c01037b7:	8b 45 08             	mov    0x8(%ebp),%eax
c01037ba:	39 c2                	cmp    %eax,%edx
c01037bc:	75 05                	jne    c01037c3 <pid2proc+0x6d>
c01037be:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01037c1:	eb 17                	jmp    c01037da <pid2proc+0x84>
c01037c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01037c6:	8b 40 04             	mov    0x4(%eax),%eax
c01037c9:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01037cc:	81 7d fc 0c 0f 11 c0 	cmpl   $0xc0110f0c,-0x4(%ebp)
c01037d3:	75 c1                	jne    c0103796 <pid2proc+0x40>
c01037d5:	b8 00 00 00 00       	mov    $0x0,%eax
c01037da:	c9                   	leave  
c01037db:	c3                   	ret    

c01037dc <proc2pid>:
c01037dc:	55                   	push   %ebp
c01037dd:	89 e5                	mov    %esp,%ebp
c01037df:	83 ec 10             	sub    $0x10,%esp
c01037e2:	8b 45 08             	mov    0x8(%ebp),%eax
c01037e5:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c01037eb:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01037ee:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01037f1:	c9                   	leave  
c01037f2:	c3                   	ret    

c01037f3 <InitDescriptor>:
c01037f3:	55                   	push   %ebp
c01037f4:	89 e5                	mov    %esp,%ebp
c01037f6:	83 ec 04             	sub    $0x4,%esp
c01037f9:	8b 45 14             	mov    0x14(%ebp),%eax
c01037fc:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
c0103800:	8b 45 10             	mov    0x10(%ebp),%eax
c0103803:	89 c2                	mov    %eax,%edx
c0103805:	8b 45 08             	mov    0x8(%ebp),%eax
c0103808:	66 89 10             	mov    %dx,(%eax)
c010380b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010380e:	89 c2                	mov    %eax,%edx
c0103810:	8b 45 08             	mov    0x8(%ebp),%eax
c0103813:	66 89 50 02          	mov    %dx,0x2(%eax)
c0103817:	8b 45 0c             	mov    0xc(%ebp),%eax
c010381a:	c1 e8 10             	shr    $0x10,%eax
c010381d:	89 c2                	mov    %eax,%edx
c010381f:	8b 45 08             	mov    0x8(%ebp),%eax
c0103822:	88 50 04             	mov    %dl,0x4(%eax)
c0103825:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0103829:	89 c2                	mov    %eax,%edx
c010382b:	8b 45 08             	mov    0x8(%ebp),%eax
c010382e:	88 50 05             	mov    %dl,0x5(%eax)
c0103831:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0103835:	66 c1 e8 08          	shr    $0x8,%ax
c0103839:	c1 e0 04             	shl    $0x4,%eax
c010383c:	89 c2                	mov    %eax,%edx
c010383e:	8b 45 10             	mov    0x10(%ebp),%eax
c0103841:	c1 e8 10             	shr    $0x10,%eax
c0103844:	83 e0 0f             	and    $0xf,%eax
c0103847:	09 c2                	or     %eax,%edx
c0103849:	8b 45 08             	mov    0x8(%ebp),%eax
c010384c:	88 50 06             	mov    %dl,0x6(%eax)
c010384f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103852:	c1 e8 18             	shr    $0x18,%eax
c0103855:	89 c2                	mov    %eax,%edx
c0103857:	8b 45 08             	mov    0x8(%ebp),%eax
c010385a:	88 50 07             	mov    %dl,0x7(%eax)
c010385d:	90                   	nop
c010385e:	c9                   	leave  
c010385f:	c3                   	ret    

c0103860 <Seg2PhyAddr>:
c0103860:	55                   	push   %ebp
c0103861:	89 e5                	mov    %esp,%ebp
c0103863:	83 ec 10             	sub    $0x10,%esp
c0103866:	8b 45 08             	mov    0x8(%ebp),%eax
c0103869:	c1 e8 03             	shr    $0x3,%eax
c010386c:	8b 14 c5 c4 f7 10 c0 	mov    -0x3fef083c(,%eax,8),%edx
c0103873:	8b 04 c5 c0 f7 10 c0 	mov    -0x3fef0840(,%eax,8),%eax
c010387a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010387d:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0103880:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0103884:	0f b7 c0             	movzwl %ax,%eax
c0103887:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c010388b:	0f b6 d2             	movzbl %dl,%edx
c010388e:	c1 e2 10             	shl    $0x10,%edx
c0103891:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c0103897:	09 d0                	or     %edx,%eax
c0103899:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010389c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010389f:	c9                   	leave  
c01038a0:	c3                   	ret    

c01038a1 <Seg2PhyAddrLDT>:
c01038a1:	55                   	push   %ebp
c01038a2:	89 e5                	mov    %esp,%ebp
c01038a4:	83 ec 10             	sub    $0x10,%esp
c01038a7:	8b 45 08             	mov    0x8(%ebp),%eax
c01038aa:	c1 e8 03             	shr    $0x3,%eax
c01038ad:	89 c2                	mov    %eax,%edx
c01038af:	8b 45 0c             	mov    0xc(%ebp),%eax
c01038b2:	83 c2 20             	add    $0x20,%edx
c01038b5:	8d 54 d0 02          	lea    0x2(%eax,%edx,8),%edx
c01038b9:	8b 02                	mov    (%edx),%eax
c01038bb:	8b 52 04             	mov    0x4(%edx),%edx
c01038be:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01038c1:	89 55 f8             	mov    %edx,-0x8(%ebp)
c01038c4:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c01038c8:	0f b7 c0             	movzwl %ax,%eax
c01038cb:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c01038cf:	0f b6 d2             	movzbl %dl,%edx
c01038d2:	c1 e2 10             	shl    $0x10,%edx
c01038d5:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c01038db:	09 d0                	or     %edx,%eax
c01038dd:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01038e0:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01038e3:	c9                   	leave  
c01038e4:	c3                   	ret    

c01038e5 <VirAddr2PhyAddr>:
c01038e5:	55                   	push   %ebp
c01038e6:	89 e5                	mov    %esp,%ebp
c01038e8:	83 ec 10             	sub    $0x10,%esp
c01038eb:	8b 55 0c             	mov    0xc(%ebp),%edx
c01038ee:	8b 45 08             	mov    0x8(%ebp),%eax
c01038f1:	01 d0                	add    %edx,%eax
c01038f3:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01038f6:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01038f9:	c9                   	leave  
c01038fa:	c3                   	ret    

c01038fb <v2l>:
c01038fb:	55                   	push   %ebp
c01038fc:	89 e5                	mov    %esp,%ebp
c01038fe:	83 ec 18             	sub    $0x18,%esp
c0103901:	83 ec 0c             	sub    $0xc,%esp
c0103904:	ff 75 08             	pushl  0x8(%ebp)
c0103907:	e8 4a fe ff ff       	call   c0103756 <pid2proc>
c010390c:	83 c4 10             	add    $0x10,%esp
c010390f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103912:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0103919:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010391c:	83 ec 08             	sub    $0x8,%esp
c010391f:	ff 75 f4             	pushl  -0xc(%ebp)
c0103922:	50                   	push   %eax
c0103923:	e8 79 ff ff ff       	call   c01038a1 <Seg2PhyAddrLDT>
c0103928:	83 c4 10             	add    $0x10,%esp
c010392b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010392e:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0103931:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103934:	01 d0                	add    %edx,%eax
c0103936:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0103939:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010393c:	c9                   	leave  
c010393d:	c3                   	ret    

c010393e <init_propt>:
c010393e:	55                   	push   %ebp
c010393f:	89 e5                	mov    %esp,%ebp
c0103941:	83 ec 38             	sub    $0x38,%esp
c0103944:	6a 0e                	push   $0xe
c0103946:	6a 08                	push   $0x8
c0103948:	68 71 01 10 c0       	push   $0xc0100171
c010394d:	6a 20                	push   $0x20
c010394f:	e8 58 01 00 00       	call   c0103aac <InitInterruptDesc>
c0103954:	83 c4 10             	add    $0x10,%esp
c0103957:	6a 0e                	push   $0xe
c0103959:	6a 08                	push   $0x8
c010395b:	68 9f 01 10 c0       	push   $0xc010019f
c0103960:	6a 21                	push   $0x21
c0103962:	e8 45 01 00 00       	call   c0103aac <InitInterruptDesc>
c0103967:	83 c4 10             	add    $0x10,%esp
c010396a:	6a 0e                	push   $0xe
c010396c:	6a 08                	push   $0x8
c010396e:	68 e2 01 10 c0       	push   $0xc01001e2
c0103973:	6a 2e                	push   $0x2e
c0103975:	e8 32 01 00 00       	call   c0103aac <InitInterruptDesc>
c010397a:	83 c4 10             	add    $0x10,%esp
c010397d:	83 ec 04             	sub    $0x4,%esp
c0103980:	68 e0 15 00 00       	push   $0x15e0
c0103985:	6a 00                	push   $0x0
c0103987:	68 00 22 18 c0       	push   $0xc0182200
c010398c:	e8 da 78 00 00       	call   c010b26b <Memset>
c0103991:	83 c4 10             	add    $0x10,%esp
c0103994:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c010399b:	83 ec 04             	sub    $0x4,%esp
c010399e:	ff 75 f4             	pushl  -0xc(%ebp)
c01039a1:	6a 00                	push   $0x0
c01039a3:	68 40 06 11 c0       	push   $0xc0110640
c01039a8:	e8 be 78 00 00       	call   c010b26b <Memset>
c01039ad:	83 c4 10             	add    $0x10,%esp
c01039b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01039b3:	a3 a8 06 11 c0       	mov    %eax,0xc01106a8
c01039b8:	c7 05 48 06 11 c0 30 	movl   $0x30,0xc0110648
c01039bf:	00 00 00 
c01039c2:	83 ec 0c             	sub    $0xc,%esp
c01039c5:	6a 30                	push   $0x30
c01039c7:	e8 94 fe ff ff       	call   c0103860 <Seg2PhyAddr>
c01039cc:	83 c4 10             	add    $0x10,%esp
c01039cf:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01039d2:	c7 45 ec 40 06 11 c0 	movl   $0xc0110640,-0x14(%ebp)
c01039d9:	c7 45 e8 89 00 00 00 	movl   $0x89,-0x18(%ebp)
c01039e0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01039e3:	0f b7 d0             	movzwl %ax,%edx
c01039e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01039e9:	83 e8 01             	sub    $0x1,%eax
c01039ec:	89 c1                	mov    %eax,%ecx
c01039ee:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01039f1:	52                   	push   %edx
c01039f2:	51                   	push   %ecx
c01039f3:	50                   	push   %eax
c01039f4:	68 00 f8 10 c0       	push   $0xc010f800
c01039f9:	e8 f5 fd ff ff       	call   c01037f3 <InitDescriptor>
c01039fe:	83 c4 10             	add    $0x10,%esp
c0103a01:	c7 45 e4 00 80 0b c0 	movl   $0xc00b8000,-0x1c(%ebp)
c0103a08:	68 f2 00 00 00       	push   $0xf2
c0103a0d:	68 ff ff 00 00       	push   $0xffff
c0103a12:	ff 75 e4             	pushl  -0x1c(%ebp)
c0103a15:	68 f8 f7 10 c0       	push   $0xc010f7f8
c0103a1a:	e8 d4 fd ff ff       	call   c01037f3 <InitDescriptor>
c0103a1f:	83 c4 10             	add    $0x10,%esp
c0103a22:	c7 45 e0 b2 0c 00 00 	movl   $0xcb2,-0x20(%ebp)
c0103a29:	c7 45 dc 9a 0c 00 00 	movl   $0xc9a,-0x24(%ebp)
c0103a30:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%ebp)
c0103a37:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0103a3a:	0f b7 c0             	movzwl %ax,%eax
c0103a3d:	50                   	push   %eax
c0103a3e:	ff 75 d8             	pushl  -0x28(%ebp)
c0103a41:	6a 00                	push   $0x0
c0103a43:	68 08 f8 10 c0       	push   $0xc010f808
c0103a48:	e8 a6 fd ff ff       	call   c01037f3 <InitDescriptor>
c0103a4d:	83 c4 10             	add    $0x10,%esp
c0103a50:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0103a53:	0f b7 c0             	movzwl %ax,%eax
c0103a56:	50                   	push   %eax
c0103a57:	ff 75 d8             	pushl  -0x28(%ebp)
c0103a5a:	6a 00                	push   $0x0
c0103a5c:	68 10 f8 10 c0       	push   $0xc010f810
c0103a61:	e8 8d fd ff ff       	call   c01037f3 <InitDescriptor>
c0103a66:	83 c4 10             	add    $0x10,%esp
c0103a69:	c7 45 d4 b2 0c 00 00 	movl   $0xcb2,-0x2c(%ebp)
c0103a70:	c7 45 d0 ba 0c 00 00 	movl   $0xcba,-0x30(%ebp)
c0103a77:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0103a7a:	0f b7 c0             	movzwl %ax,%eax
c0103a7d:	50                   	push   %eax
c0103a7e:	ff 75 d8             	pushl  -0x28(%ebp)
c0103a81:	6a 00                	push   $0x0
c0103a83:	68 18 f8 10 c0       	push   $0xc010f818
c0103a88:	e8 66 fd ff ff       	call   c01037f3 <InitDescriptor>
c0103a8d:	83 c4 10             	add    $0x10,%esp
c0103a90:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0103a93:	0f b7 c0             	movzwl %ax,%eax
c0103a96:	50                   	push   %eax
c0103a97:	ff 75 d8             	pushl  -0x28(%ebp)
c0103a9a:	6a 00                	push   $0x0
c0103a9c:	68 20 f8 10 c0       	push   $0xc010f820
c0103aa1:	e8 4d fd ff ff       	call   c01037f3 <InitDescriptor>
c0103aa6:	83 c4 10             	add    $0x10,%esp
c0103aa9:	90                   	nop
c0103aaa:	c9                   	leave  
c0103aab:	c3                   	ret    

c0103aac <InitInterruptDesc>:
c0103aac:	55                   	push   %ebp
c0103aad:	89 e5                	mov    %esp,%ebp
c0103aaf:	83 ec 10             	sub    $0x10,%esp
c0103ab2:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ab5:	c1 e0 03             	shl    $0x3,%eax
c0103ab8:	05 e0 06 11 c0       	add    $0xc01106e0,%eax
c0103abd:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103ac0:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103ac3:	c6 40 04 00          	movb   $0x0,0x4(%eax)
c0103ac7:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103aca:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0103acd:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0103ad0:	89 c2                	mov    %eax,%edx
c0103ad2:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103ad5:	66 89 10             	mov    %dx,(%eax)
c0103ad8:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103adb:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
c0103ae1:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0103ae4:	c1 f8 10             	sar    $0x10,%eax
c0103ae7:	89 c2                	mov    %eax,%edx
c0103ae9:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103aec:	66 89 50 06          	mov    %dx,0x6(%eax)
c0103af0:	8b 45 10             	mov    0x10(%ebp),%eax
c0103af3:	c1 e0 04             	shl    $0x4,%eax
c0103af6:	89 c2                	mov    %eax,%edx
c0103af8:	8b 45 14             	mov    0x14(%ebp),%eax
c0103afb:	09 d0                	or     %edx,%eax
c0103afd:	89 c2                	mov    %eax,%edx
c0103aff:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103b02:	88 50 05             	mov    %dl,0x5(%eax)
c0103b05:	90                   	nop
c0103b06:	c9                   	leave  
c0103b07:	c3                   	ret    

c0103b08 <ReloadGDT>:
c0103b08:	55                   	push   %ebp
c0103b09:	89 e5                	mov    %esp,%ebp
c0103b0b:	83 ec 28             	sub    $0x28,%esp
c0103b0e:	b8 cc 06 11 c0       	mov    $0xc01106cc,%eax
c0103b13:	0f b7 00             	movzwl (%eax),%eax
c0103b16:	98                   	cwtl   
c0103b17:	ba ce 06 11 c0       	mov    $0xc01106ce,%edx
c0103b1c:	8b 12                	mov    (%edx),%edx
c0103b1e:	83 ec 04             	sub    $0x4,%esp
c0103b21:	50                   	push   %eax
c0103b22:	52                   	push   %edx
c0103b23:	68 c0 f7 10 c0       	push   $0xc010f7c0
c0103b28:	e8 10 77 00 00       	call   c010b23d <Memcpy2>
c0103b2d:	83 c4 10             	add    $0x10,%esp
c0103b30:	c7 45 f0 cc 06 11 c0 	movl   $0xc01106cc,-0x10(%ebp)
c0103b37:	c7 45 ec ce 06 11 c0 	movl   $0xc01106ce,-0x14(%ebp)
c0103b3e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103b41:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
c0103b46:	ba c0 f7 10 c0       	mov    $0xc010f7c0,%edx
c0103b4b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103b4e:	89 10                	mov    %edx,(%eax)
c0103b50:	c7 45 e8 88 f7 10 c0 	movl   $0xc010f788,-0x18(%ebp)
c0103b57:	c7 45 e4 8a f7 10 c0 	movl   $0xc010f78a,-0x1c(%ebp)
c0103b5e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103b61:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
c0103b66:	ba e0 06 11 c0       	mov    $0xc01106e0,%edx
c0103b6b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0103b6e:	89 10                	mov    %edx,(%eax)
c0103b70:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0103b77:	eb 04                	jmp    c0103b7d <ReloadGDT+0x75>
c0103b79:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0103b7d:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c0103b84:	7e f3                	jle    c0103b79 <ReloadGDT+0x71>
c0103b86:	e8 a9 37 00 00       	call   c0107334 <init_internal_interrupt>
c0103b8b:	e8 ae fd ff ff       	call   c010393e <init_propt>
c0103b90:	90                   	nop
c0103b91:	c9                   	leave  
c0103b92:	c3                   	ret    

c0103b93 <select_console>:
c0103b93:	55                   	push   %ebp
c0103b94:	89 e5                	mov    %esp,%ebp
c0103b96:	83 ec 18             	sub    $0x18,%esp
c0103b99:	8b 45 08             	mov    0x8(%ebp),%eax
c0103b9c:	88 45 f4             	mov    %al,-0xc(%ebp)
c0103b9f:	80 7d f4 00          	cmpb   $0x0,-0xc(%ebp)
c0103ba3:	75 27                	jne    c0103bcc <select_console+0x39>
c0103ba5:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
c0103ba9:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0103baf:	05 00 fe 10 c0       	add    $0xc010fe00,%eax
c0103bb4:	a3 80 f7 10 c0       	mov    %eax,0xc010f780
c0103bb9:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c0103bbe:	83 ec 0c             	sub    $0xc,%esp
c0103bc1:	50                   	push   %eax
c0103bc2:	e8 08 00 00 00       	call   c0103bcf <flush>
c0103bc7:	83 c4 10             	add    $0x10,%esp
c0103bca:	eb 01                	jmp    c0103bcd <select_console+0x3a>
c0103bcc:	90                   	nop
c0103bcd:	c9                   	leave  
c0103bce:	c3                   	ret    

c0103bcf <flush>:
c0103bcf:	55                   	push   %ebp
c0103bd0:	89 e5                	mov    %esp,%ebp
c0103bd2:	83 ec 08             	sub    $0x8,%esp
c0103bd5:	8b 45 08             	mov    0x8(%ebp),%eax
c0103bd8:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103bde:	8b 40 0c             	mov    0xc(%eax),%eax
c0103be1:	83 ec 0c             	sub    $0xc,%esp
c0103be4:	50                   	push   %eax
c0103be5:	e8 1e 00 00 00       	call   c0103c08 <set_cursor>
c0103bea:	83 c4 10             	add    $0x10,%esp
c0103bed:	8b 45 08             	mov    0x8(%ebp),%eax
c0103bf0:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103bf6:	8b 40 08             	mov    0x8(%eax),%eax
c0103bf9:	83 ec 0c             	sub    $0xc,%esp
c0103bfc:	50                   	push   %eax
c0103bfd:	e8 64 00 00 00       	call   c0103c66 <set_console_start_video_addr>
c0103c02:	83 c4 10             	add    $0x10,%esp
c0103c05:	90                   	nop
c0103c06:	c9                   	leave  
c0103c07:	c3                   	ret    

c0103c08 <set_cursor>:
c0103c08:	55                   	push   %ebp
c0103c09:	89 e5                	mov    %esp,%ebp
c0103c0b:	83 ec 08             	sub    $0x8,%esp
c0103c0e:	83 ec 08             	sub    $0x8,%esp
c0103c11:	6a 0e                	push   $0xe
c0103c13:	68 d4 03 00 00       	push   $0x3d4
c0103c18:	e8 88 c6 ff ff       	call   c01002a5 <out_byte>
c0103c1d:	83 c4 10             	add    $0x10,%esp
c0103c20:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c23:	c1 e8 08             	shr    $0x8,%eax
c0103c26:	0f b7 c0             	movzwl %ax,%eax
c0103c29:	83 ec 08             	sub    $0x8,%esp
c0103c2c:	50                   	push   %eax
c0103c2d:	68 d5 03 00 00       	push   $0x3d5
c0103c32:	e8 6e c6 ff ff       	call   c01002a5 <out_byte>
c0103c37:	83 c4 10             	add    $0x10,%esp
c0103c3a:	83 ec 08             	sub    $0x8,%esp
c0103c3d:	6a 0f                	push   $0xf
c0103c3f:	68 d4 03 00 00       	push   $0x3d4
c0103c44:	e8 5c c6 ff ff       	call   c01002a5 <out_byte>
c0103c49:	83 c4 10             	add    $0x10,%esp
c0103c4c:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c4f:	0f b7 c0             	movzwl %ax,%eax
c0103c52:	83 ec 08             	sub    $0x8,%esp
c0103c55:	50                   	push   %eax
c0103c56:	68 d5 03 00 00       	push   $0x3d5
c0103c5b:	e8 45 c6 ff ff       	call   c01002a5 <out_byte>
c0103c60:	83 c4 10             	add    $0x10,%esp
c0103c63:	90                   	nop
c0103c64:	c9                   	leave  
c0103c65:	c3                   	ret    

c0103c66 <set_console_start_video_addr>:
c0103c66:	55                   	push   %ebp
c0103c67:	89 e5                	mov    %esp,%ebp
c0103c69:	83 ec 08             	sub    $0x8,%esp
c0103c6c:	83 ec 08             	sub    $0x8,%esp
c0103c6f:	6a 0c                	push   $0xc
c0103c71:	68 d4 03 00 00       	push   $0x3d4
c0103c76:	e8 2a c6 ff ff       	call   c01002a5 <out_byte>
c0103c7b:	83 c4 10             	add    $0x10,%esp
c0103c7e:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c81:	c1 e8 08             	shr    $0x8,%eax
c0103c84:	0f b7 c0             	movzwl %ax,%eax
c0103c87:	83 ec 08             	sub    $0x8,%esp
c0103c8a:	50                   	push   %eax
c0103c8b:	68 d5 03 00 00       	push   $0x3d5
c0103c90:	e8 10 c6 ff ff       	call   c01002a5 <out_byte>
c0103c95:	83 c4 10             	add    $0x10,%esp
c0103c98:	83 ec 08             	sub    $0x8,%esp
c0103c9b:	6a 0d                	push   $0xd
c0103c9d:	68 d4 03 00 00       	push   $0x3d4
c0103ca2:	e8 fe c5 ff ff       	call   c01002a5 <out_byte>
c0103ca7:	83 c4 10             	add    $0x10,%esp
c0103caa:	8b 45 08             	mov    0x8(%ebp),%eax
c0103cad:	0f b7 c0             	movzwl %ax,%eax
c0103cb0:	83 ec 08             	sub    $0x8,%esp
c0103cb3:	50                   	push   %eax
c0103cb4:	68 d5 03 00 00       	push   $0x3d5
c0103cb9:	e8 e7 c5 ff ff       	call   c01002a5 <out_byte>
c0103cbe:	83 c4 10             	add    $0x10,%esp
c0103cc1:	90                   	nop
c0103cc2:	c9                   	leave  
c0103cc3:	c3                   	ret    

c0103cc4 <put_key>:
c0103cc4:	55                   	push   %ebp
c0103cc5:	89 e5                	mov    %esp,%ebp
c0103cc7:	83 ec 04             	sub    $0x4,%esp
c0103cca:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103ccd:	88 45 fc             	mov    %al,-0x4(%ebp)
c0103cd0:	8b 45 08             	mov    0x8(%ebp),%eax
c0103cd3:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0103cd9:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c0103cde:	77 4d                	ja     c0103d2d <put_key+0x69>
c0103ce0:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ce3:	8b 00                	mov    (%eax),%eax
c0103ce5:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
c0103ce9:	89 10                	mov    %edx,(%eax)
c0103ceb:	8b 45 08             	mov    0x8(%ebp),%eax
c0103cee:	8b 00                	mov    (%eax),%eax
c0103cf0:	8d 50 04             	lea    0x4(%eax),%edx
c0103cf3:	8b 45 08             	mov    0x8(%ebp),%eax
c0103cf6:	89 10                	mov    %edx,(%eax)
c0103cf8:	8b 45 08             	mov    0x8(%ebp),%eax
c0103cfb:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0103d01:	8d 50 01             	lea    0x1(%eax),%edx
c0103d04:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d07:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0103d0d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d10:	8b 00                	mov    (%eax),%eax
c0103d12:	8b 55 08             	mov    0x8(%ebp),%edx
c0103d15:	83 c2 08             	add    $0x8,%edx
c0103d18:	81 c2 00 08 00 00    	add    $0x800,%edx
c0103d1e:	39 d0                	cmp    %edx,%eax
c0103d20:	75 0b                	jne    c0103d2d <put_key+0x69>
c0103d22:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d25:	8d 50 08             	lea    0x8(%eax),%edx
c0103d28:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d2b:	89 10                	mov    %edx,(%eax)
c0103d2d:	90                   	nop
c0103d2e:	c9                   	leave  
c0103d2f:	c3                   	ret    

c0103d30 <scroll_up>:
c0103d30:	55                   	push   %ebp
c0103d31:	89 e5                	mov    %esp,%ebp
c0103d33:	83 ec 08             	sub    $0x8,%esp
c0103d36:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d39:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103d3f:	8b 40 08             	mov    0x8(%eax),%eax
c0103d42:	8d 50 b0             	lea    -0x50(%eax),%edx
c0103d45:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d48:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103d4e:	8b 00                	mov    (%eax),%eax
c0103d50:	39 c2                	cmp    %eax,%edx
c0103d52:	76 1b                	jbe    c0103d6f <scroll_up+0x3f>
c0103d54:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d57:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103d5d:	8b 40 08             	mov    0x8(%eax),%eax
c0103d60:	83 e8 50             	sub    $0x50,%eax
c0103d63:	83 ec 0c             	sub    $0xc,%esp
c0103d66:	50                   	push   %eax
c0103d67:	e8 fa fe ff ff       	call   c0103c66 <set_console_start_video_addr>
c0103d6c:	83 c4 10             	add    $0x10,%esp
c0103d6f:	90                   	nop
c0103d70:	c9                   	leave  
c0103d71:	c3                   	ret    

c0103d72 <scroll_down>:
c0103d72:	55                   	push   %ebp
c0103d73:	89 e5                	mov    %esp,%ebp
c0103d75:	83 ec 08             	sub    $0x8,%esp
c0103d78:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d7b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103d81:	8b 40 08             	mov    0x8(%eax),%eax
c0103d84:	8d 48 50             	lea    0x50(%eax),%ecx
c0103d87:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d8a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103d90:	8b 10                	mov    (%eax),%edx
c0103d92:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d95:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103d9b:	8b 40 04             	mov    0x4(%eax),%eax
c0103d9e:	01 d0                	add    %edx,%eax
c0103da0:	39 c1                	cmp    %eax,%ecx
c0103da2:	73 36                	jae    c0103dda <scroll_down+0x68>
c0103da4:	8b 45 08             	mov    0x8(%ebp),%eax
c0103da7:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103dad:	8b 40 08             	mov    0x8(%eax),%eax
c0103db0:	83 c0 50             	add    $0x50,%eax
c0103db3:	83 ec 0c             	sub    $0xc,%esp
c0103db6:	50                   	push   %eax
c0103db7:	e8 aa fe ff ff       	call   c0103c66 <set_console_start_video_addr>
c0103dbc:	83 c4 10             	add    $0x10,%esp
c0103dbf:	8b 45 08             	mov    0x8(%ebp),%eax
c0103dc2:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103dc8:	8b 50 08             	mov    0x8(%eax),%edx
c0103dcb:	8b 45 08             	mov    0x8(%ebp),%eax
c0103dce:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103dd4:	83 c2 50             	add    $0x50,%edx
c0103dd7:	89 50 08             	mov    %edx,0x8(%eax)
c0103dda:	90                   	nop
c0103ddb:	c9                   	leave  
c0103ddc:	c3                   	ret    

c0103ddd <out_char>:
c0103ddd:	55                   	push   %ebp
c0103dde:	89 e5                	mov    %esp,%ebp
c0103de0:	83 ec 28             	sub    $0x28,%esp
c0103de3:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103de6:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0103de9:	e8 a7 2d 00 00       	call   c0106b95 <intr_disable>
c0103dee:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103df1:	8b 45 08             	mov    0x8(%ebp),%eax
c0103df4:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103dfa:	8b 40 0c             	mov    0xc(%eax),%eax
c0103dfd:	05 00 c0 05 60       	add    $0x6005c000,%eax
c0103e02:	01 c0                	add    %eax,%eax
c0103e04:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103e07:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
c0103e0b:	83 f8 08             	cmp    $0x8,%eax
c0103e0e:	0f 84 8d 00 00 00    	je     c0103ea1 <out_char+0xc4>
c0103e14:	83 f8 0a             	cmp    $0xa,%eax
c0103e17:	0f 85 c9 00 00 00    	jne    c0103ee6 <out_char+0x109>
c0103e1d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e20:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e26:	8b 50 0c             	mov    0xc(%eax),%edx
c0103e29:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e2c:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e32:	8b 08                	mov    (%eax),%ecx
c0103e34:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e37:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e3d:	8b 40 04             	mov    0x4(%eax),%eax
c0103e40:	01 c8                	add    %ecx,%eax
c0103e42:	83 e8 50             	sub    $0x50,%eax
c0103e45:	39 c2                	cmp    %eax,%edx
c0103e47:	0f 83 f4 00 00 00    	jae    c0103f41 <out_char+0x164>
c0103e4d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e50:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e56:	8b 08                	mov    (%eax),%ecx
c0103e58:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e5b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e61:	8b 50 0c             	mov    0xc(%eax),%edx
c0103e64:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e67:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e6d:	8b 00                	mov    (%eax),%eax
c0103e6f:	29 c2                	sub    %eax,%edx
c0103e71:	89 d0                	mov    %edx,%eax
c0103e73:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
c0103e78:	f7 e2                	mul    %edx
c0103e7a:	89 d0                	mov    %edx,%eax
c0103e7c:	c1 e8 06             	shr    $0x6,%eax
c0103e7f:	8d 50 01             	lea    0x1(%eax),%edx
c0103e82:	89 d0                	mov    %edx,%eax
c0103e84:	c1 e0 02             	shl    $0x2,%eax
c0103e87:	01 d0                	add    %edx,%eax
c0103e89:	c1 e0 04             	shl    $0x4,%eax
c0103e8c:	89 c2                	mov    %eax,%edx
c0103e8e:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e91:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e97:	01 ca                	add    %ecx,%edx
c0103e99:	89 50 0c             	mov    %edx,0xc(%eax)
c0103e9c:	e9 a0 00 00 00       	jmp    c0103f41 <out_char+0x164>
c0103ea1:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ea4:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103eaa:	8b 50 0c             	mov    0xc(%eax),%edx
c0103ead:	8b 45 08             	mov    0x8(%ebp),%eax
c0103eb0:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103eb6:	8b 00                	mov    (%eax),%eax
c0103eb8:	39 c2                	cmp    %eax,%edx
c0103eba:	0f 86 84 00 00 00    	jbe    c0103f44 <out_char+0x167>
c0103ec0:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ec3:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103ec9:	8b 50 0c             	mov    0xc(%eax),%edx
c0103ecc:	83 ea 01             	sub    $0x1,%edx
c0103ecf:	89 50 0c             	mov    %edx,0xc(%eax)
c0103ed2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103ed5:	83 e8 02             	sub    $0x2,%eax
c0103ed8:	c6 00 20             	movb   $0x20,(%eax)
c0103edb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103ede:	83 e8 01             	sub    $0x1,%eax
c0103ee1:	c6 00 00             	movb   $0x0,(%eax)
c0103ee4:	eb 5e                	jmp    c0103f44 <out_char+0x167>
c0103ee6:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ee9:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103eef:	8b 40 0c             	mov    0xc(%eax),%eax
c0103ef2:	8d 48 01             	lea    0x1(%eax),%ecx
c0103ef5:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ef8:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103efe:	8b 10                	mov    (%eax),%edx
c0103f00:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f03:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f09:	8b 40 04             	mov    0x4(%eax),%eax
c0103f0c:	01 d0                	add    %edx,%eax
c0103f0e:	39 c1                	cmp    %eax,%ecx
c0103f10:	73 35                	jae    c0103f47 <out_char+0x16a>
c0103f12:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103f15:	8d 50 01             	lea    0x1(%eax),%edx
c0103f18:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0103f1b:	0f b6 55 e4          	movzbl -0x1c(%ebp),%edx
c0103f1f:	88 10                	mov    %dl,(%eax)
c0103f21:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103f24:	8d 50 01             	lea    0x1(%eax),%edx
c0103f27:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0103f2a:	c6 00 0a             	movb   $0xa,(%eax)
c0103f2d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f30:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f36:	8b 50 0c             	mov    0xc(%eax),%edx
c0103f39:	83 c2 01             	add    $0x1,%edx
c0103f3c:	89 50 0c             	mov    %edx,0xc(%eax)
c0103f3f:	eb 06                	jmp    c0103f47 <out_char+0x16a>
c0103f41:	90                   	nop
c0103f42:	eb 14                	jmp    c0103f58 <out_char+0x17b>
c0103f44:	90                   	nop
c0103f45:	eb 11                	jmp    c0103f58 <out_char+0x17b>
c0103f47:	90                   	nop
c0103f48:	eb 0e                	jmp    c0103f58 <out_char+0x17b>
c0103f4a:	83 ec 0c             	sub    $0xc,%esp
c0103f4d:	ff 75 08             	pushl  0x8(%ebp)
c0103f50:	e8 1d fe ff ff       	call   c0103d72 <scroll_down>
c0103f55:	83 c4 10             	add    $0x10,%esp
c0103f58:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f5b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f61:	8b 50 0c             	mov    0xc(%eax),%edx
c0103f64:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f67:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f6d:	8b 40 08             	mov    0x8(%eax),%eax
c0103f70:	29 c2                	sub    %eax,%edx
c0103f72:	89 d0                	mov    %edx,%eax
c0103f74:	3d d0 07 00 00       	cmp    $0x7d0,%eax
c0103f79:	77 cf                	ja     c0103f4a <out_char+0x16d>
c0103f7b:	83 ec 0c             	sub    $0xc,%esp
c0103f7e:	ff 75 08             	pushl  0x8(%ebp)
c0103f81:	e8 49 fc ff ff       	call   c0103bcf <flush>
c0103f86:	83 c4 10             	add    $0x10,%esp
c0103f89:	83 ec 0c             	sub    $0xc,%esp
c0103f8c:	ff 75 f4             	pushl  -0xc(%ebp)
c0103f8f:	e8 2a 2c 00 00       	call   c0106bbe <intr_set_status>
c0103f94:	83 c4 10             	add    $0x10,%esp
c0103f97:	90                   	nop
c0103f98:	c9                   	leave  
c0103f99:	c3                   	ret    

c0103f9a <tty_dev_read>:
c0103f9a:	55                   	push   %ebp
c0103f9b:	89 e5                	mov    %esp,%ebp
c0103f9d:	83 ec 08             	sub    $0x8,%esp
c0103fa0:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c0103fa5:	39 45 08             	cmp    %eax,0x8(%ebp)
c0103fa8:	75 17                	jne    c0103fc1 <tty_dev_read+0x27>
c0103faa:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c0103faf:	85 c0                	test   %eax,%eax
c0103fb1:	7e 0e                	jle    c0103fc1 <tty_dev_read+0x27>
c0103fb3:	83 ec 0c             	sub    $0xc,%esp
c0103fb6:	ff 75 08             	pushl  0x8(%ebp)
c0103fb9:	e8 89 07 00 00       	call   c0104747 <keyboard_read>
c0103fbe:	83 c4 10             	add    $0x10,%esp
c0103fc1:	90                   	nop
c0103fc2:	c9                   	leave  
c0103fc3:	c3                   	ret    

c0103fc4 <tty_dev_write>:
c0103fc4:	55                   	push   %ebp
c0103fc5:	89 e5                	mov    %esp,%ebp
c0103fc7:	83 ec 28             	sub    $0x28,%esp
c0103fca:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fcd:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0103fd3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103fd6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0103fdd:	e9 88 01 00 00       	jmp    c010416a <tty_dev_write+0x1a6>
c0103fe2:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fe5:	8b 40 04             	mov    0x4(%eax),%eax
c0103fe8:	8b 00                	mov    (%eax),%eax
c0103fea:	88 45 e7             	mov    %al,-0x19(%ebp)
c0103fed:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ff0:	8b 40 04             	mov    0x4(%eax),%eax
c0103ff3:	8d 50 04             	lea    0x4(%eax),%edx
c0103ff6:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ff9:	89 50 04             	mov    %edx,0x4(%eax)
c0103ffc:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fff:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0104005:	8d 50 ff             	lea    -0x1(%eax),%edx
c0104008:	8b 45 08             	mov    0x8(%ebp),%eax
c010400b:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0104011:	8b 45 08             	mov    0x8(%ebp),%eax
c0104014:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c010401a:	8d 50 01             	lea    0x1(%eax),%edx
c010401d:	8b 45 08             	mov    0x8(%ebp),%eax
c0104020:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0104026:	8b 45 08             	mov    0x8(%ebp),%eax
c0104029:	8b 40 04             	mov    0x4(%eax),%eax
c010402c:	8b 55 08             	mov    0x8(%ebp),%edx
c010402f:	83 c2 08             	add    $0x8,%edx
c0104032:	81 c2 00 08 00 00    	add    $0x800,%edx
c0104038:	39 d0                	cmp    %edx,%eax
c010403a:	75 0c                	jne    c0104048 <tty_dev_write+0x84>
c010403c:	8b 45 08             	mov    0x8(%ebp),%eax
c010403f:	8d 50 08             	lea    0x8(%eax),%edx
c0104042:	8b 45 08             	mov    0x8(%ebp),%eax
c0104045:	89 50 04             	mov    %edx,0x4(%eax)
c0104048:	8b 45 08             	mov    0x8(%ebp),%eax
c010404b:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0104051:	85 c0                	test   %eax,%eax
c0104053:	0f 84 11 01 00 00    	je     c010416a <tty_dev_write+0x1a6>
c0104059:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c010405d:	3c 20                	cmp    $0x20,%al
c010405f:	76 08                	jbe    c0104069 <tty_dev_write+0xa5>
c0104061:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104065:	3c 7e                	cmp    $0x7e,%al
c0104067:	76 10                	jbe    c0104079 <tty_dev_write+0xb5>
c0104069:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c010406d:	3c 20                	cmp    $0x20,%al
c010406f:	74 08                	je     c0104079 <tty_dev_write+0xb5>
c0104071:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104075:	84 c0                	test   %al,%al
c0104077:	75 58                	jne    c01040d1 <tty_dev_write+0x10d>
c0104079:	8b 45 08             	mov    0x8(%ebp),%eax
c010407c:	8b 90 18 08 00 00    	mov    0x818(%eax),%edx
c0104082:	8b 45 08             	mov    0x8(%ebp),%eax
c0104085:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c010408b:	01 d0                	add    %edx,%eax
c010408d:	83 e8 01             	sub    $0x1,%eax
c0104090:	89 c2                	mov    %eax,%edx
c0104092:	83 ec 04             	sub    $0x4,%esp
c0104095:	6a 01                	push   $0x1
c0104097:	8d 45 e7             	lea    -0x19(%ebp),%eax
c010409a:	50                   	push   %eax
c010409b:	52                   	push   %edx
c010409c:	e8 58 2b 00 00       	call   c0106bf9 <Memcpy>
c01040a1:	83 c4 10             	add    $0x10,%esp
c01040a4:	8b 45 08             	mov    0x8(%ebp),%eax
c01040a7:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c01040ad:	8d 50 ff             	lea    -0x1(%eax),%edx
c01040b0:	8b 45 08             	mov    0x8(%ebp),%eax
c01040b3:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c01040b9:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c01040bd:	0f b6 c0             	movzbl %al,%eax
c01040c0:	83 ec 08             	sub    $0x8,%esp
c01040c3:	50                   	push   %eax
c01040c4:	ff 75 08             	pushl  0x8(%ebp)
c01040c7:	e8 11 fd ff ff       	call   c0103ddd <out_char>
c01040cc:	83 c4 10             	add    $0x10,%esp
c01040cf:	eb 7c                	jmp    c010414d <tty_dev_write+0x189>
c01040d1:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c01040d5:	3c 08                	cmp    $0x8,%al
c01040d7:	75 42                	jne    c010411b <tty_dev_write+0x157>
c01040d9:	8b 45 08             	mov    0x8(%ebp),%eax
c01040dc:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c01040e2:	8d 50 01             	lea    0x1(%eax),%edx
c01040e5:	8b 45 08             	mov    0x8(%ebp),%eax
c01040e8:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c01040ee:	8b 45 08             	mov    0x8(%ebp),%eax
c01040f1:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c01040f7:	8d 50 fe             	lea    -0x2(%eax),%edx
c01040fa:	8b 45 08             	mov    0x8(%ebp),%eax
c01040fd:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0104103:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104107:	0f b6 c0             	movzbl %al,%eax
c010410a:	83 ec 08             	sub    $0x8,%esp
c010410d:	50                   	push   %eax
c010410e:	ff 75 08             	pushl  0x8(%ebp)
c0104111:	e8 c7 fc ff ff       	call   c0103ddd <out_char>
c0104116:	83 c4 10             	add    $0x10,%esp
c0104119:	eb 32                	jmp    c010414d <tty_dev_write+0x189>
c010411b:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c010411f:	3c 0a                	cmp    $0xa,%al
c0104121:	75 2a                	jne    c010414d <tty_dev_write+0x189>
c0104123:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104127:	0f b6 c0             	movzbl %al,%eax
c010412a:	83 ec 08             	sub    $0x8,%esp
c010412d:	50                   	push   %eax
c010412e:	ff 75 08             	pushl  0x8(%ebp)
c0104131:	e8 a7 fc ff ff       	call   c0103ddd <out_char>
c0104136:	83 c4 10             	add    $0x10,%esp
c0104139:	8b 45 08             	mov    0x8(%ebp),%eax
c010413c:	c7 80 0c 08 00 00 00 	movl   $0x0,0x80c(%eax)
c0104143:	00 00 00 
c0104146:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c010414d:	8b 45 08             	mov    0x8(%ebp),%eax
c0104150:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0104156:	8b 45 08             	mov    0x8(%ebp),%eax
c0104159:	8b 80 14 08 00 00    	mov    0x814(%eax),%eax
c010415f:	39 c2                	cmp    %eax,%edx
c0104161:	75 07                	jne    c010416a <tty_dev_write+0x1a6>
c0104163:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c010416a:	8b 45 08             	mov    0x8(%ebp),%eax
c010416d:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0104173:	85 c0                	test   %eax,%eax
c0104175:	0f 85 67 fe ff ff    	jne    c0103fe2 <tty_dev_write+0x1e>
c010417b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010417f:	74 6d                	je     c01041ee <tty_dev_write+0x22a>
c0104181:	c7 45 ec 7c 00 00 00 	movl   $0x7c,-0x14(%ebp)
c0104188:	83 ec 0c             	sub    $0xc,%esp
c010418b:	ff 75 ec             	pushl  -0x14(%ebp)
c010418e:	e8 e9 d3 ff ff       	call   c010157c <sys_malloc>
c0104193:	83 c4 10             	add    $0x10,%esp
c0104196:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0104199:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010419c:	c7 40 78 66 00 00 00 	movl   $0x66,0x78(%eax)
c01041a3:	8b 45 08             	mov    0x8(%ebp),%eax
c01041a6:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c01041ac:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01041af:	89 50 60             	mov    %edx,0x60(%eax)
c01041b2:	8b 45 08             	mov    0x8(%ebp),%eax
c01041b5:	8b 90 20 08 00 00    	mov    0x820(%eax),%edx
c01041bb:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01041be:	89 50 68             	mov    %edx,0x68(%eax)
c01041c1:	8b 45 08             	mov    0x8(%ebp),%eax
c01041c4:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c01041ca:	83 ec 04             	sub    $0x4,%esp
c01041cd:	50                   	push   %eax
c01041ce:	ff 75 e8             	pushl  -0x18(%ebp)
c01041d1:	6a 01                	push   $0x1
c01041d3:	e8 c0 50 00 00       	call   c0109298 <send_rec>
c01041d8:	83 c4 10             	add    $0x10,%esp
c01041db:	83 ec 08             	sub    $0x8,%esp
c01041de:	ff 75 ec             	pushl  -0x14(%ebp)
c01041e1:	ff 75 e8             	pushl  -0x18(%ebp)
c01041e4:	e8 a8 d3 ff ff       	call   c0101591 <sys_free>
c01041e9:	83 c4 10             	add    $0x10,%esp
c01041ec:	eb 01                	jmp    c01041ef <tty_dev_write+0x22b>
c01041ee:	90                   	nop
c01041ef:	c9                   	leave  
c01041f0:	c3                   	ret    

c01041f1 <tty_do_read>:
c01041f1:	55                   	push   %ebp
c01041f2:	89 e5                	mov    %esp,%ebp
c01041f4:	83 ec 08             	sub    $0x8,%esp
c01041f7:	8b 45 08             	mov    0x8(%ebp),%eax
c01041fa:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c0104201:	00 00 00 
c0104204:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104207:	8b 50 68             	mov    0x68(%eax),%edx
c010420a:	8b 45 08             	mov    0x8(%ebp),%eax
c010420d:	89 90 20 08 00 00    	mov    %edx,0x820(%eax)
c0104213:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104216:	8b 00                	mov    (%eax),%eax
c0104218:	89 c2                	mov    %eax,%edx
c010421a:	8b 45 08             	mov    0x8(%ebp),%eax
c010421d:	89 90 1c 08 00 00    	mov    %edx,0x81c(%eax)
c0104223:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104226:	8b 50 60             	mov    0x60(%eax),%edx
c0104229:	8b 45 08             	mov    0x8(%ebp),%eax
c010422c:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c0104232:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104235:	8b 50 60             	mov    0x60(%eax),%edx
c0104238:	8b 45 08             	mov    0x8(%ebp),%eax
c010423b:	89 90 14 08 00 00    	mov    %edx,0x814(%eax)
c0104241:	8b 45 08             	mov    0x8(%ebp),%eax
c0104244:	8b 90 0c 08 00 00    	mov    0x80c(%eax),%edx
c010424a:	8b 45 0c             	mov    0xc(%ebp),%eax
c010424d:	8b 40 10             	mov    0x10(%eax),%eax
c0104250:	83 ec 08             	sub    $0x8,%esp
c0104253:	52                   	push   %edx
c0104254:	50                   	push   %eax
c0104255:	e8 32 1b 00 00       	call   c0105d8c <alloc_virtual_memory>
c010425a:	83 c4 10             	add    $0x10,%esp
c010425d:	89 c2                	mov    %eax,%edx
c010425f:	8b 45 08             	mov    0x8(%ebp),%eax
c0104262:	89 90 18 08 00 00    	mov    %edx,0x818(%eax)
c0104268:	8b 45 08             	mov    0x8(%ebp),%eax
c010426b:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c0104271:	83 f8 02             	cmp    $0x2,%eax
c0104274:	74 1c                	je     c0104292 <tty_do_read+0xa1>
c0104276:	68 3b 01 00 00       	push   $0x13b
c010427b:	68 01 a7 10 c0       	push   $0xc010a701
c0104280:	68 01 a7 10 c0       	push   $0xc010a701
c0104285:	68 0b a7 10 c0       	push   $0xc010a70b
c010428a:	e8 99 43 00 00       	call   c0108628 <assertion_failure>
c010428f:	83 c4 10             	add    $0x10,%esp
c0104292:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104295:	c7 40 78 67 00 00 00 	movl   $0x67,0x78(%eax)
c010429c:	8b 45 08             	mov    0x8(%ebp),%eax
c010429f:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c01042a5:	83 ec 04             	sub    $0x4,%esp
c01042a8:	50                   	push   %eax
c01042a9:	ff 75 0c             	pushl  0xc(%ebp)
c01042ac:	6a 01                	push   $0x1
c01042ae:	e8 e5 4f 00 00       	call   c0109298 <send_rec>
c01042b3:	83 c4 10             	add    $0x10,%esp
c01042b6:	90                   	nop
c01042b7:	c9                   	leave  
c01042b8:	c3                   	ret    

c01042b9 <tty_do_write>:
c01042b9:	55                   	push   %ebp
c01042ba:	89 e5                	mov    %esp,%ebp
c01042bc:	53                   	push   %ebx
c01042bd:	83 ec 24             	sub    $0x24,%esp
c01042c0:	89 e0                	mov    %esp,%eax
c01042c2:	89 c3                	mov    %eax,%ebx
c01042c4:	c7 45 e8 80 00 00 00 	movl   $0x80,-0x18(%ebp)
c01042cb:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01042ce:	8d 50 ff             	lea    -0x1(%eax),%edx
c01042d1:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c01042d4:	89 c2                	mov    %eax,%edx
c01042d6:	b8 10 00 00 00       	mov    $0x10,%eax
c01042db:	83 e8 01             	sub    $0x1,%eax
c01042de:	01 d0                	add    %edx,%eax
c01042e0:	b9 10 00 00 00       	mov    $0x10,%ecx
c01042e5:	ba 00 00 00 00       	mov    $0x0,%edx
c01042ea:	f7 f1                	div    %ecx
c01042ec:	6b c0 10             	imul   $0x10,%eax,%eax
c01042ef:	29 c4                	sub    %eax,%esp
c01042f1:	89 e0                	mov    %esp,%eax
c01042f3:	83 c0 00             	add    $0x0,%eax
c01042f6:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01042f9:	83 ec 04             	sub    $0x4,%esp
c01042fc:	ff 75 e8             	pushl  -0x18(%ebp)
c01042ff:	6a 00                	push   $0x0
c0104301:	ff 75 e0             	pushl  -0x20(%ebp)
c0104304:	e8 62 6f 00 00       	call   c010b26b <Memset>
c0104309:	83 c4 10             	add    $0x10,%esp
c010430c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010430f:	8b 40 60             	mov    0x60(%eax),%eax
c0104312:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0104315:	8b 45 08             	mov    0x8(%ebp),%eax
c0104318:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c010431f:	00 00 00 
c0104322:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0104325:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104328:	8b 40 10             	mov    0x10(%eax),%eax
c010432b:	83 ec 08             	sub    $0x8,%esp
c010432e:	52                   	push   %edx
c010432f:	50                   	push   %eax
c0104330:	e8 57 1a 00 00       	call   c0105d8c <alloc_virtual_memory>
c0104335:	83 c4 10             	add    $0x10,%esp
c0104338:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010433b:	eb 7e                	jmp    c01043bb <tty_do_write+0x102>
c010433d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104340:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c0104343:	0f 4e 45 ec          	cmovle -0x14(%ebp),%eax
c0104347:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010434a:	8b 45 08             	mov    0x8(%ebp),%eax
c010434d:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0104353:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104356:	01 d0                	add    %edx,%eax
c0104358:	83 ec 04             	sub    $0x4,%esp
c010435b:	ff 75 f0             	pushl  -0x10(%ebp)
c010435e:	50                   	push   %eax
c010435f:	ff 75 e0             	pushl  -0x20(%ebp)
c0104362:	e8 92 28 00 00       	call   c0106bf9 <Memcpy>
c0104367:	83 c4 10             	add    $0x10,%esp
c010436a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010436d:	29 45 ec             	sub    %eax,-0x14(%ebp)
c0104370:	8b 45 08             	mov    0x8(%ebp),%eax
c0104373:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0104379:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010437c:	01 c2                	add    %eax,%edx
c010437e:	8b 45 08             	mov    0x8(%ebp),%eax
c0104381:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0104387:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010438e:	eb 25                	jmp    c01043b5 <tty_do_write+0xfc>
c0104390:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0104393:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104396:	01 d0                	add    %edx,%eax
c0104398:	0f b6 00             	movzbl (%eax),%eax
c010439b:	0f b6 c0             	movzbl %al,%eax
c010439e:	83 ec 08             	sub    $0x8,%esp
c01043a1:	50                   	push   %eax
c01043a2:	ff 75 08             	pushl  0x8(%ebp)
c01043a5:	e8 33 fa ff ff       	call   c0103ddd <out_char>
c01043aa:	83 c4 10             	add    $0x10,%esp
c01043ad:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01043b1:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c01043b5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c01043b9:	75 d5                	jne    c0104390 <tty_do_write+0xd7>
c01043bb:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c01043bf:	0f 85 78 ff ff ff    	jne    c010433d <tty_do_write+0x84>
c01043c5:	83 ec 0c             	sub    $0xc,%esp
c01043c8:	6a 7c                	push   $0x7c
c01043ca:	e8 ad d1 ff ff       	call   c010157c <sys_malloc>
c01043cf:	83 c4 10             	add    $0x10,%esp
c01043d2:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01043d5:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01043d8:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c01043df:	8b 45 08             	mov    0x8(%ebp),%eax
c01043e2:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c01043e8:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01043eb:	89 50 58             	mov    %edx,0x58(%eax)
c01043ee:	8b 45 0c             	mov    0xc(%ebp),%eax
c01043f1:	8b 00                	mov    (%eax),%eax
c01043f3:	83 ec 04             	sub    $0x4,%esp
c01043f6:	50                   	push   %eax
c01043f7:	ff 75 d8             	pushl  -0x28(%ebp)
c01043fa:	6a 01                	push   $0x1
c01043fc:	e8 97 4e 00 00       	call   c0109298 <send_rec>
c0104401:	83 c4 10             	add    $0x10,%esp
c0104404:	83 ec 08             	sub    $0x8,%esp
c0104407:	6a 7c                	push   $0x7c
c0104409:	ff 75 d8             	pushl  -0x28(%ebp)
c010440c:	e8 80 d1 ff ff       	call   c0101591 <sys_free>
c0104411:	83 c4 10             	add    $0x10,%esp
c0104414:	89 dc                	mov    %ebx,%esp
c0104416:	90                   	nop
c0104417:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c010441a:	c9                   	leave  
c010441b:	c3                   	ret    

c010441c <init_screen>:
c010441c:	55                   	push   %ebp
c010441d:	89 e5                	mov    %esp,%ebp
c010441f:	83 ec 10             	sub    $0x10,%esp
c0104422:	8b 45 08             	mov    0x8(%ebp),%eax
c0104425:	2d 00 fe 10 c0       	sub    $0xc010fe00,%eax
c010442a:	c1 f8 03             	sar    $0x3,%eax
c010442d:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c0104433:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0104436:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0104439:	c1 e0 04             	shl    $0x4,%eax
c010443c:	8d 90 14 0f 11 c0    	lea    -0x3feef0ec(%eax),%edx
c0104442:	8b 45 08             	mov    0x8(%ebp),%eax
c0104445:	89 90 24 08 00 00    	mov    %edx,0x824(%eax)
c010444b:	c7 45 f8 ff 3f 00 00 	movl   $0x3fff,-0x8(%ebp)
c0104452:	8b 45 08             	mov    0x8(%ebp),%eax
c0104455:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c010445b:	8b 55 f8             	mov    -0x8(%ebp),%edx
c010445e:	89 50 04             	mov    %edx,0x4(%eax)
c0104461:	8b 45 08             	mov    0x8(%ebp),%eax
c0104464:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c010446a:	8b 50 04             	mov    0x4(%eax),%edx
c010446d:	8b 45 08             	mov    0x8(%ebp),%eax
c0104470:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104476:	0f af 55 fc          	imul   -0x4(%ebp),%edx
c010447a:	89 10                	mov    %edx,(%eax)
c010447c:	8b 45 08             	mov    0x8(%ebp),%eax
c010447f:	8b 90 24 08 00 00    	mov    0x824(%eax),%edx
c0104485:	8b 45 08             	mov    0x8(%ebp),%eax
c0104488:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c010448e:	8b 12                	mov    (%edx),%edx
c0104490:	89 50 08             	mov    %edx,0x8(%eax)
c0104493:	8b 55 08             	mov    0x8(%ebp),%edx
c0104496:	8b 92 24 08 00 00    	mov    0x824(%edx),%edx
c010449c:	8b 40 08             	mov    0x8(%eax),%eax
c010449f:	89 42 0c             	mov    %eax,0xc(%edx)
c01044a2:	90                   	nop
c01044a3:	c9                   	leave  
c01044a4:	c3                   	ret    

c01044a5 <init_tty>:
c01044a5:	55                   	push   %ebp
c01044a6:	89 e5                	mov    %esp,%ebp
c01044a8:	83 ec 18             	sub    $0x18,%esp
c01044ab:	c7 45 f4 00 fe 10 c0 	movl   $0xc010fe00,-0xc(%ebp)
c01044b2:	e9 92 00 00 00       	jmp    c0104549 <init_tty+0xa4>
c01044b7:	83 ec 04             	sub    $0x4,%esp
c01044ba:	68 28 08 00 00       	push   $0x828
c01044bf:	6a 00                	push   $0x0
c01044c1:	ff 75 f4             	pushl  -0xc(%ebp)
c01044c4:	e8 a2 6d 00 00       	call   c010b26b <Memset>
c01044c9:	83 c4 10             	add    $0x10,%esp
c01044cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01044cf:	8d 50 08             	lea    0x8(%eax),%edx
c01044d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01044d5:	89 50 04             	mov    %edx,0x4(%eax)
c01044d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01044db:	8b 50 04             	mov    0x4(%eax),%edx
c01044de:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01044e1:	89 10                	mov    %edx,(%eax)
c01044e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01044e6:	c7 80 08 08 00 00 00 	movl   $0x0,0x808(%eax)
c01044ed:	00 00 00 
c01044f0:	83 ec 0c             	sub    $0xc,%esp
c01044f3:	ff 75 f4             	pushl  -0xc(%ebp)
c01044f6:	e8 21 ff ff ff       	call   c010441c <init_screen>
c01044fb:	83 c4 10             	add    $0x10,%esp
c01044fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104501:	2d 00 fe 10 c0       	sub    $0xc010fe00,%eax
c0104506:	85 c0                	test   %eax,%eax
c0104508:	7e 38                	jle    c0104542 <init_tty+0x9d>
c010450a:	83 ec 08             	sub    $0x8,%esp
c010450d:	6a 23                	push   $0x23
c010450f:	ff 75 f4             	pushl  -0xc(%ebp)
c0104512:	e8 c6 f8 ff ff       	call   c0103ddd <out_char>
c0104517:	83 c4 10             	add    $0x10,%esp
c010451a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010451d:	05 a8 8f 01 00       	add    $0x18fa8,%eax
c0104522:	2d 00 fe 10 c0       	sub    $0xc010fe00,%eax
c0104527:	c1 f8 03             	sar    $0x3,%eax
c010452a:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c0104530:	0f b6 c0             	movzbl %al,%eax
c0104533:	83 ec 08             	sub    $0x8,%esp
c0104536:	50                   	push   %eax
c0104537:	ff 75 f4             	pushl  -0xc(%ebp)
c010453a:	e8 9e f8 ff ff       	call   c0103ddd <out_char>
c010453f:	83 c4 10             	add    $0x10,%esp
c0104542:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c0104549:	b8 28 06 11 c0       	mov    $0xc0110628,%eax
c010454e:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0104551:	0f 82 60 ff ff ff    	jb     c01044b7 <init_tty+0x12>
c0104557:	90                   	nop
c0104558:	c9                   	leave  
c0104559:	c3                   	ret    

c010455a <TaskTTY>:
c010455a:	55                   	push   %ebp
c010455b:	89 e5                	mov    %esp,%ebp
c010455d:	83 ec 28             	sub    $0x28,%esp
c0104560:	e8 40 ff ff ff       	call   c01044a5 <init_tty>
c0104565:	83 ec 0c             	sub    $0xc,%esp
c0104568:	6a 00                	push   $0x0
c010456a:	e8 24 f6 ff ff       	call   c0103b93 <select_console>
c010456f:	83 c4 10             	add    $0x10,%esp
c0104572:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0104579:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0104580:	83 ec 0c             	sub    $0xc,%esp
c0104583:	6a 7c                	push   $0x7c
c0104585:	e8 f2 cf ff ff       	call   c010157c <sys_malloc>
c010458a:	83 c4 10             	add    $0x10,%esp
c010458d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0104590:	c7 45 f4 00 fe 10 c0 	movl   $0xc010fe00,-0xc(%ebp)
c0104597:	eb 30                	jmp    c01045c9 <TaskTTY+0x6f>
c0104599:	83 ec 0c             	sub    $0xc,%esp
c010459c:	ff 75 f4             	pushl  -0xc(%ebp)
c010459f:	e8 f6 f9 ff ff       	call   c0103f9a <tty_dev_read>
c01045a4:	83 c4 10             	add    $0x10,%esp
c01045a7:	83 ec 0c             	sub    $0xc,%esp
c01045aa:	ff 75 f4             	pushl  -0xc(%ebp)
c01045ad:	e8 12 fa ff ff       	call   c0103fc4 <tty_dev_write>
c01045b2:	83 c4 10             	add    $0x10,%esp
c01045b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01045b8:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c01045be:	85 c0                	test   %eax,%eax
c01045c0:	75 d7                	jne    c0104599 <TaskTTY+0x3f>
c01045c2:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c01045c9:	b8 28 06 11 c0       	mov    $0xc0110628,%eax
c01045ce:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c01045d1:	72 c6                	jb     c0104599 <TaskTTY+0x3f>
c01045d3:	83 ec 04             	sub    $0x4,%esp
c01045d6:	6a 12                	push   $0x12
c01045d8:	ff 75 e8             	pushl  -0x18(%ebp)
c01045db:	6a 02                	push   $0x2
c01045dd:	e8 b6 4c 00 00       	call   c0109298 <send_rec>
c01045e2:	83 c4 10             	add    $0x10,%esp
c01045e5:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01045e8:	8b 40 78             	mov    0x78(%eax),%eax
c01045eb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01045ee:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c01045f5:	74 28                	je     c010461f <TaskTTY+0xc5>
c01045f7:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c01045fe:	7f 0b                	jg     c010460b <TaskTTY+0xb1>
c0104600:	81 7d e4 d1 07 00 00 	cmpl   $0x7d1,-0x1c(%ebp)
c0104607:	74 4e                	je     c0104657 <TaskTTY+0xfd>
c0104609:	eb 4d                	jmp    c0104658 <TaskTTY+0xfe>
c010460b:	81 7d e4 d3 07 00 00 	cmpl   $0x7d3,-0x1c(%ebp)
c0104612:	74 21                	je     c0104635 <TaskTTY+0xdb>
c0104614:	81 7d e4 d5 07 00 00 	cmpl   $0x7d5,-0x1c(%ebp)
c010461b:	74 2e                	je     c010464b <TaskTTY+0xf1>
c010461d:	eb 39                	jmp    c0104658 <TaskTTY+0xfe>
c010461f:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c0104624:	83 ec 08             	sub    $0x8,%esp
c0104627:	ff 75 e8             	pushl  -0x18(%ebp)
c010462a:	50                   	push   %eax
c010462b:	e8 c1 fb ff ff       	call   c01041f1 <tty_do_read>
c0104630:	83 c4 10             	add    $0x10,%esp
c0104633:	eb 23                	jmp    c0104658 <TaskTTY+0xfe>
c0104635:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c010463a:	83 ec 08             	sub    $0x8,%esp
c010463d:	ff 75 e8             	pushl  -0x18(%ebp)
c0104640:	50                   	push   %eax
c0104641:	e8 73 fc ff ff       	call   c01042b9 <tty_do_write>
c0104646:	83 c4 10             	add    $0x10,%esp
c0104649:	eb 0d                	jmp    c0104658 <TaskTTY+0xfe>
c010464b:	c7 05 c0 06 11 c0 00 	movl   $0x0,0xc01106c0
c0104652:	00 00 00 
c0104655:	eb 01                	jmp    c0104658 <TaskTTY+0xfe>
c0104657:	90                   	nop
c0104658:	e9 33 ff ff ff       	jmp    c0104590 <TaskTTY+0x36>

c010465d <keyboard_handler>:
c010465d:	55                   	push   %ebp
c010465e:	89 e5                	mov    %esp,%ebp
c0104660:	83 ec 18             	sub    $0x18,%esp
c0104663:	c7 05 c0 06 11 c0 01 	movl   $0x1,0xc01106c0
c010466a:	00 00 00 
c010466d:	c7 45 f4 60 00 00 00 	movl   $0x60,-0xc(%ebp)
c0104674:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c0104679:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c010467e:	7f 5e                	jg     c01046de <keyboard_handler+0x81>
c0104680:	e8 42 bc ff ff       	call   c01002c7 <disable_int>
c0104685:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104688:	0f b7 c0             	movzwl %ax,%eax
c010468b:	83 ec 0c             	sub    $0xc,%esp
c010468e:	50                   	push   %eax
c010468f:	e8 05 bc ff ff       	call   c0100299 <in_byte>
c0104694:	83 c4 10             	add    $0x10,%esp
c0104697:	88 45 f3             	mov    %al,-0xd(%ebp)
c010469a:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c010469f:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
c01046a3:	88 10                	mov    %dl,(%eax)
c01046a5:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c01046aa:	83 c0 01             	add    $0x1,%eax
c01046ad:	a3 e0 fb 10 c0       	mov    %eax,0xc010fbe0
c01046b2:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c01046b7:	83 c0 01             	add    $0x1,%eax
c01046ba:	a3 e8 fb 10 c0       	mov    %eax,0xc010fbe8
c01046bf:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c01046c4:	ba ec fd 10 c0       	mov    $0xc010fdec,%edx
c01046c9:	39 d0                	cmp    %edx,%eax
c01046cb:	72 0a                	jb     c01046d7 <keyboard_handler+0x7a>
c01046cd:	c7 05 e0 fb 10 c0 ec 	movl   $0xc010fbec,0xc010fbe0
c01046d4:	fb 10 c0 
c01046d7:	e8 ed bb ff ff       	call   c01002c9 <enable_int>
c01046dc:	eb 01                	jmp    c01046df <keyboard_handler+0x82>
c01046de:	90                   	nop
c01046df:	c9                   	leave  
c01046e0:	c3                   	ret    

c01046e1 <read_from_keyboard_buf>:
c01046e1:	55                   	push   %ebp
c01046e2:	89 e5                	mov    %esp,%ebp
c01046e4:	83 ec 18             	sub    $0x18,%esp
c01046e7:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
c01046eb:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c01046f0:	85 c0                	test   %eax,%eax
c01046f2:	7f 06                	jg     c01046fa <read_from_keyboard_buf+0x19>
c01046f4:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c01046f8:	eb 4b                	jmp    c0104745 <read_from_keyboard_buf+0x64>
c01046fa:	e8 c8 bb ff ff       	call   c01002c7 <disable_int>
c01046ff:	a1 e4 fb 10 c0       	mov    0xc010fbe4,%eax
c0104704:	0f b6 00             	movzbl (%eax),%eax
c0104707:	88 45 f7             	mov    %al,-0x9(%ebp)
c010470a:	a1 e4 fb 10 c0       	mov    0xc010fbe4,%eax
c010470f:	83 c0 01             	add    $0x1,%eax
c0104712:	a3 e4 fb 10 c0       	mov    %eax,0xc010fbe4
c0104717:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c010471c:	83 e8 01             	sub    $0x1,%eax
c010471f:	a3 e8 fb 10 c0       	mov    %eax,0xc010fbe8
c0104724:	a1 e4 fb 10 c0       	mov    0xc010fbe4,%eax
c0104729:	ba ec fd 10 c0       	mov    $0xc010fdec,%edx
c010472e:	39 d0                	cmp    %edx,%eax
c0104730:	72 0a                	jb     c010473c <read_from_keyboard_buf+0x5b>
c0104732:	c7 05 e4 fb 10 c0 ec 	movl   $0xc010fbec,0xc010fbe4
c0104739:	fb 10 c0 
c010473c:	e8 88 bb ff ff       	call   c01002c9 <enable_int>
c0104741:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c0104745:	c9                   	leave  
c0104746:	c3                   	ret    

c0104747 <keyboard_read>:
c0104747:	55                   	push   %ebp
c0104748:	89 e5                	mov    %esp,%ebp
c010474a:	83 ec 28             	sub    $0x28,%esp
c010474d:	90                   	nop
c010474e:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c0104753:	85 c0                	test   %eax,%eax
c0104755:	7e f7                	jle    c010474e <keyboard_read+0x7>
c0104757:	e8 85 ff ff ff       	call   c01046e1 <read_from_keyboard_buf>
c010475c:	88 45 ea             	mov    %al,-0x16(%ebp)
c010475f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0104766:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c010476a:	80 7d ea e1          	cmpb   $0xe1,-0x16(%ebp)
c010476e:	75 5a                	jne    c01047ca <keyboard_read+0x83>
c0104770:	c6 45 e3 e1          	movb   $0xe1,-0x1d(%ebp)
c0104774:	c6 45 e4 1d          	movb   $0x1d,-0x1c(%ebp)
c0104778:	c6 45 e5 45          	movb   $0x45,-0x1b(%ebp)
c010477c:	c6 45 e6 e1          	movb   $0xe1,-0x1a(%ebp)
c0104780:	c6 45 e7 9d          	movb   $0x9d,-0x19(%ebp)
c0104784:	c6 45 e8 c5          	movb   $0xc5,-0x18(%ebp)
c0104788:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
c010478c:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0104793:	eb 20                	jmp    c01047b5 <keyboard_read+0x6e>
c0104795:	e8 47 ff ff ff       	call   c01046e1 <read_from_keyboard_buf>
c010479a:	89 c1                	mov    %eax,%ecx
c010479c:	8d 55 e3             	lea    -0x1d(%ebp),%edx
c010479f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01047a2:	01 d0                	add    %edx,%eax
c01047a4:	0f b6 00             	movzbl (%eax),%eax
c01047a7:	38 c1                	cmp    %al,%cl
c01047a9:	74 06                	je     c01047b1 <keyboard_read+0x6a>
c01047ab:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
c01047af:	eb 0a                	jmp    c01047bb <keyboard_read+0x74>
c01047b1:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c01047b5:	83 7d ec 05          	cmpl   $0x5,-0x14(%ebp)
c01047b9:	7e da                	jle    c0104795 <keyboard_read+0x4e>
c01047bb:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
c01047bf:	74 68                	je     c0104829 <keyboard_read+0xe2>
c01047c1:	c7 45 f4 80 01 00 00 	movl   $0x180,-0xc(%ebp)
c01047c8:	eb 5f                	jmp    c0104829 <keyboard_read+0xe2>
c01047ca:	80 7d ea e0          	cmpb   $0xe0,-0x16(%ebp)
c01047ce:	75 59                	jne    c0104829 <keyboard_read+0xe2>
c01047d0:	e8 0c ff ff ff       	call   c01046e1 <read_from_keyboard_buf>
c01047d5:	3c 2a                	cmp    $0x2a,%al
c01047d7:	75 1d                	jne    c01047f6 <keyboard_read+0xaf>
c01047d9:	e8 03 ff ff ff       	call   c01046e1 <read_from_keyboard_buf>
c01047de:	3c e0                	cmp    $0xe0,%al
c01047e0:	75 14                	jne    c01047f6 <keyboard_read+0xaf>
c01047e2:	e8 fa fe ff ff       	call   c01046e1 <read_from_keyboard_buf>
c01047e7:	3c 37                	cmp    $0x37,%al
c01047e9:	75 0b                	jne    c01047f6 <keyboard_read+0xaf>
c01047eb:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c01047f2:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
c01047f6:	e8 e6 fe ff ff       	call   c01046e1 <read_from_keyboard_buf>
c01047fb:	3c b7                	cmp    $0xb7,%al
c01047fd:	75 1d                	jne    c010481c <keyboard_read+0xd5>
c01047ff:	e8 dd fe ff ff       	call   c01046e1 <read_from_keyboard_buf>
c0104804:	3c e0                	cmp    $0xe0,%al
c0104806:	75 14                	jne    c010481c <keyboard_read+0xd5>
c0104808:	e8 d4 fe ff ff       	call   c01046e1 <read_from_keyboard_buf>
c010480d:	3c aa                	cmp    $0xaa,%al
c010480f:	75 0b                	jne    c010481c <keyboard_read+0xd5>
c0104811:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c0104818:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c010481c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0104820:	75 07                	jne    c0104829 <keyboard_read+0xe2>
c0104822:	c6 05 84 f7 10 c0 01 	movb   $0x1,0xc010f784
c0104829:	81 7d f4 80 01 00 00 	cmpl   $0x180,-0xc(%ebp)
c0104830:	0f 84 8d 00 00 00    	je     c01048c3 <keyboard_read+0x17c>
c0104836:	81 7d f4 81 01 00 00 	cmpl   $0x181,-0xc(%ebp)
c010483d:	0f 84 80 00 00 00    	je     c01048c3 <keyboard_read+0x17c>
c0104843:	80 7d ea 36          	cmpb   $0x36,-0x16(%ebp)
c0104847:	0f 94 c2             	sete   %dl
c010484a:	80 7d ea 2a          	cmpb   $0x2a,-0x16(%ebp)
c010484e:	0f 94 c0             	sete   %al
c0104851:	09 d0                	or     %edx,%eax
c0104853:	84 c0                	test   %al,%al
c0104855:	74 07                	je     c010485e <keyboard_read+0x117>
c0104857:	c6 05 c8 06 11 c0 01 	movb   $0x1,0xc01106c8
c010485e:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
c0104862:	f7 d0                	not    %eax
c0104864:	c0 e8 07             	shr    $0x7,%al
c0104867:	88 45 e9             	mov    %al,-0x17(%ebp)
c010486a:	80 7d ea 00          	cmpb   $0x0,-0x16(%ebp)
c010486e:	74 53                	je     c01048c3 <keyboard_read+0x17c>
c0104870:	80 7d e9 00          	cmpb   $0x0,-0x17(%ebp)
c0104874:	74 4d                	je     c01048c3 <keyboard_read+0x17c>
c0104876:	c6 45 eb 00          	movb   $0x0,-0x15(%ebp)
c010487a:	0f b6 05 c8 06 11 c0 	movzbl 0xc01106c8,%eax
c0104881:	3c 01                	cmp    $0x1,%al
c0104883:	75 04                	jne    c0104889 <keyboard_read+0x142>
c0104885:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
c0104889:	0f b6 05 84 f7 10 c0 	movzbl 0xc010f784,%eax
c0104890:	84 c0                	test   %al,%al
c0104892:	74 04                	je     c0104898 <keyboard_read+0x151>
c0104894:	c6 45 eb 02          	movb   $0x2,-0x15(%ebp)
c0104898:	0f b6 55 ea          	movzbl -0x16(%ebp),%edx
c010489c:	89 d0                	mov    %edx,%eax
c010489e:	01 c0                	add    %eax,%eax
c01048a0:	01 c2                	add    %eax,%edx
c01048a2:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c01048a6:	01 d0                	add    %edx,%eax
c01048a8:	8b 04 85 60 e1 10 c0 	mov    -0x3fef1ea0(,%eax,4),%eax
c01048af:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01048b2:	83 ec 08             	sub    $0x8,%esp
c01048b5:	ff 75 f4             	pushl  -0xc(%ebp)
c01048b8:	ff 75 08             	pushl  0x8(%ebp)
c01048bb:	e8 1a 00 00 00       	call   c01048da <in_process>
c01048c0:	83 c4 10             	add    $0x10,%esp
c01048c3:	90                   	nop
c01048c4:	c9                   	leave  
c01048c5:	c3                   	ret    

c01048c6 <init_keyboard_handler>:
c01048c6:	55                   	push   %ebp
c01048c7:	89 e5                	mov    %esp,%ebp
c01048c9:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c01048d0:	c6 05 c8 06 11 c0 00 	movb   $0x0,0xc01106c8
c01048d7:	90                   	nop
c01048d8:	5d                   	pop    %ebp
c01048d9:	c3                   	ret    

c01048da <in_process>:
c01048da:	55                   	push   %ebp
c01048db:	89 e5                	mov    %esp,%ebp
c01048dd:	83 ec 18             	sub    $0x18,%esp
c01048e0:	83 ec 04             	sub    $0x4,%esp
c01048e3:	6a 02                	push   $0x2
c01048e5:	6a 00                	push   $0x0
c01048e7:	8d 45 f6             	lea    -0xa(%ebp),%eax
c01048ea:	50                   	push   %eax
c01048eb:	e8 7b 69 00 00       	call   c010b26b <Memset>
c01048f0:	83 c4 10             	add    $0x10,%esp
c01048f3:	8b 45 0c             	mov    0xc(%ebp),%eax
c01048f6:	25 00 01 00 00       	and    $0x100,%eax
c01048fb:	85 c0                	test   %eax,%eax
c01048fd:	75 28                	jne    c0104927 <in_process+0x4d>
c01048ff:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104902:	0f b6 c0             	movzbl %al,%eax
c0104905:	83 ec 08             	sub    $0x8,%esp
c0104908:	50                   	push   %eax
c0104909:	ff 75 08             	pushl  0x8(%ebp)
c010490c:	e8 b3 f3 ff ff       	call   c0103cc4 <put_key>
c0104911:	83 c4 10             	add    $0x10,%esp
c0104914:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c010491b:	c6 05 c8 06 11 c0 00 	movb   $0x0,0xc01106c8
c0104922:	e9 42 01 00 00       	jmp    c0104a69 <in_process+0x18f>
c0104927:	0f b6 05 c8 06 11 c0 	movzbl 0xc01106c8,%eax
c010492e:	84 c0                	test   %al,%al
c0104930:	0f 84 a9 00 00 00    	je     c01049df <in_process+0x105>
c0104936:	83 7d 0c 2a          	cmpl   $0x2a,0xc(%ebp)
c010493a:	0f 84 9f 00 00 00    	je     c01049df <in_process+0x105>
c0104940:	83 7d 0c 36          	cmpl   $0x36,0xc(%ebp)
c0104944:	0f 84 95 00 00 00    	je     c01049df <in_process+0x105>
c010494a:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0104951:	74 64                	je     c01049b7 <in_process+0xdd>
c0104953:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c010495a:	77 0b                	ja     c0104967 <in_process+0x8d>
c010495c:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0104963:	74 64                	je     c01049c9 <in_process+0xef>
c0104965:	eb 73                	jmp    c01049da <in_process+0x100>
c0104967:	81 7d 0c 55 01 00 00 	cmpl   $0x155,0xc(%ebp)
c010496e:	74 0b                	je     c010497b <in_process+0xa1>
c0104970:	81 7d 0c 68 01 00 00 	cmpl   $0x168,0xc(%ebp)
c0104977:	74 20                	je     c0104999 <in_process+0xbf>
c0104979:	eb 5f                	jmp    c01049da <in_process+0x100>
c010497b:	83 ec 0c             	sub    $0xc,%esp
c010497e:	ff 75 08             	pushl  0x8(%ebp)
c0104981:	e8 aa f3 ff ff       	call   c0103d30 <scroll_up>
c0104986:	83 c4 10             	add    $0x10,%esp
c0104989:	c6 05 c8 06 11 c0 00 	movb   $0x0,0xc01106c8
c0104990:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c0104997:	eb 41                	jmp    c01049da <in_process+0x100>
c0104999:	83 ec 0c             	sub    $0xc,%esp
c010499c:	ff 75 08             	pushl  0x8(%ebp)
c010499f:	e8 ce f3 ff ff       	call   c0103d72 <scroll_down>
c01049a4:	83 c4 10             	add    $0x10,%esp
c01049a7:	c6 05 c8 06 11 c0 00 	movb   $0x0,0xc01106c8
c01049ae:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c01049b5:	eb 23                	jmp    c01049da <in_process+0x100>
c01049b7:	83 ec 08             	sub    $0x8,%esp
c01049ba:	6a 0a                	push   $0xa
c01049bc:	ff 75 08             	pushl  0x8(%ebp)
c01049bf:	e8 19 f4 ff ff       	call   c0103ddd <out_char>
c01049c4:	83 c4 10             	add    $0x10,%esp
c01049c7:	eb 11                	jmp    c01049da <in_process+0x100>
c01049c9:	83 ec 08             	sub    $0x8,%esp
c01049cc:	6a 08                	push   $0x8
c01049ce:	ff 75 08             	pushl  0x8(%ebp)
c01049d1:	e8 07 f4 ff ff       	call   c0103ddd <out_char>
c01049d6:	83 c4 10             	add    $0x10,%esp
c01049d9:	90                   	nop
c01049da:	e9 8a 00 00 00       	jmp    c0104a69 <in_process+0x18f>
c01049df:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c01049e6:	74 55                	je     c0104a3d <in_process+0x163>
c01049e8:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c01049ef:	77 14                	ja     c0104a05 <in_process+0x12b>
c01049f1:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c01049f8:	74 31                	je     c0104a2b <in_process+0x151>
c01049fa:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0104a01:	74 16                	je     c0104a19 <in_process+0x13f>
c0104a03:	eb 64                	jmp    c0104a69 <in_process+0x18f>
c0104a05:	81 7d 0c 41 01 00 00 	cmpl   $0x141,0xc(%ebp)
c0104a0c:	74 3e                	je     c0104a4c <in_process+0x172>
c0104a0e:	81 7d 0c 42 01 00 00 	cmpl   $0x142,0xc(%ebp)
c0104a15:	74 44                	je     c0104a5b <in_process+0x181>
c0104a17:	eb 50                	jmp    c0104a69 <in_process+0x18f>
c0104a19:	83 ec 08             	sub    $0x8,%esp
c0104a1c:	6a 0a                	push   $0xa
c0104a1e:	ff 75 08             	pushl  0x8(%ebp)
c0104a21:	e8 9e f2 ff ff       	call   c0103cc4 <put_key>
c0104a26:	83 c4 10             	add    $0x10,%esp
c0104a29:	eb 3e                	jmp    c0104a69 <in_process+0x18f>
c0104a2b:	83 ec 08             	sub    $0x8,%esp
c0104a2e:	6a 08                	push   $0x8
c0104a30:	ff 75 08             	pushl  0x8(%ebp)
c0104a33:	e8 8c f2 ff ff       	call   c0103cc4 <put_key>
c0104a38:	83 c4 10             	add    $0x10,%esp
c0104a3b:	eb 2c                	jmp    c0104a69 <in_process+0x18f>
c0104a3d:	83 ec 0c             	sub    $0xc,%esp
c0104a40:	6a 00                	push   $0x0
c0104a42:	e8 4c f1 ff ff       	call   c0103b93 <select_console>
c0104a47:	83 c4 10             	add    $0x10,%esp
c0104a4a:	eb 1d                	jmp    c0104a69 <in_process+0x18f>
c0104a4c:	83 ec 0c             	sub    $0xc,%esp
c0104a4f:	6a 01                	push   $0x1
c0104a51:	e8 3d f1 ff ff       	call   c0103b93 <select_console>
c0104a56:	83 c4 10             	add    $0x10,%esp
c0104a59:	eb 0e                	jmp    c0104a69 <in_process+0x18f>
c0104a5b:	83 ec 0c             	sub    $0xc,%esp
c0104a5e:	6a 02                	push   $0x2
c0104a60:	e8 2e f1 ff ff       	call   c0103b93 <select_console>
c0104a65:	83 c4 10             	add    $0x10,%esp
c0104a68:	90                   	nop
c0104a69:	90                   	nop
c0104a6a:	c9                   	leave  
c0104a6b:	c3                   	ret    

c0104a6c <open>:
c0104a6c:	55                   	push   %ebp
c0104a6d:	89 e5                	mov    %esp,%ebp
c0104a6f:	83 ec 18             	sub    $0x18,%esp
c0104a72:	83 ec 0c             	sub    $0xc,%esp
c0104a75:	6a 7c                	push   $0x7c
c0104a77:	e8 00 cb ff ff       	call   c010157c <sys_malloc>
c0104a7c:	83 c4 10             	add    $0x10,%esp
c0104a7f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104a82:	83 ec 04             	sub    $0x4,%esp
c0104a85:	6a 7c                	push   $0x7c
c0104a87:	6a 00                	push   $0x0
c0104a89:	ff 75 f4             	pushl  -0xc(%ebp)
c0104a8c:	e8 da 67 00 00       	call   c010b26b <Memset>
c0104a91:	83 c4 10             	add    $0x10,%esp
c0104a94:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104a97:	c7 40 78 06 00 00 00 	movl   $0x6,0x78(%eax)
c0104a9e:	83 ec 0c             	sub    $0xc,%esp
c0104aa1:	ff 75 08             	pushl  0x8(%ebp)
c0104aa4:	e8 32 14 00 00       	call   c0105edb <get_physical_address>
c0104aa9:	83 c4 10             	add    $0x10,%esp
c0104aac:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104aaf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104ab2:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104ab5:	89 50 44             	mov    %edx,0x44(%eax)
c0104ab8:	8b 55 0c             	mov    0xc(%ebp),%edx
c0104abb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104abe:	89 50 74             	mov    %edx,0x74(%eax)
c0104ac1:	83 ec 0c             	sub    $0xc,%esp
c0104ac4:	ff 75 08             	pushl  0x8(%ebp)
c0104ac7:	e8 d8 67 00 00       	call   c010b2a4 <Strlen>
c0104acc:	83 c4 10             	add    $0x10,%esp
c0104acf:	89 c2                	mov    %eax,%edx
c0104ad1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104ad4:	89 50 40             	mov    %edx,0x40(%eax)
c0104ad7:	83 ec 04             	sub    $0x4,%esp
c0104ada:	6a 02                	push   $0x2
c0104adc:	ff 75 f4             	pushl  -0xc(%ebp)
c0104adf:	6a 03                	push   $0x3
c0104ae1:	e8 b2 47 00 00       	call   c0109298 <send_rec>
c0104ae6:	83 c4 10             	add    $0x10,%esp
c0104ae9:	83 ec 08             	sub    $0x8,%esp
c0104aec:	6a 7c                	push   $0x7c
c0104aee:	ff 75 f4             	pushl  -0xc(%ebp)
c0104af1:	e8 9b ca ff ff       	call   c0101591 <sys_free>
c0104af6:	83 c4 10             	add    $0x10,%esp
c0104af9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104afc:	8b 40 50             	mov    0x50(%eax),%eax
c0104aff:	c9                   	leave  
c0104b00:	c3                   	ret    

c0104b01 <read>:
c0104b01:	55                   	push   %ebp
c0104b02:	89 e5                	mov    %esp,%ebp
c0104b04:	83 ec 38             	sub    $0x38,%esp
c0104b07:	c7 45 dc 7c 00 00 00 	movl   $0x7c,-0x24(%ebp)
c0104b0e:	83 ec 0c             	sub    $0xc,%esp
c0104b11:	ff 75 dc             	pushl  -0x24(%ebp)
c0104b14:	e8 63 ca ff ff       	call   c010157c <sys_malloc>
c0104b19:	83 c4 10             	add    $0x10,%esp
c0104b1c:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0104b1f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104b22:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0104b27:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104b2a:	83 ec 0c             	sub    $0xc,%esp
c0104b2d:	ff 75 0c             	pushl  0xc(%ebp)
c0104b30:	e8 a6 13 00 00       	call   c0105edb <get_physical_address>
c0104b35:	83 c4 10             	add    $0x10,%esp
c0104b38:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104b3b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104b3e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0104b43:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0104b46:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104b49:	05 ff 0f 00 00       	add    $0xfff,%eax
c0104b4e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0104b51:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0104b58:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0104b5f:	8b 55 10             	mov    0x10(%ebp),%edx
c0104b62:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104b65:	01 d0                	add    %edx,%eax
c0104b67:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
c0104b6a:	0f 83 a8 00 00 00    	jae    c0104c18 <read+0x117>
c0104b70:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104b73:	2b 45 f0             	sub    -0x10(%ebp),%eax
c0104b76:	05 00 10 00 00       	add    $0x1000,%eax
c0104b7b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0104b7e:	8b 45 10             	mov    0x10(%ebp),%eax
c0104b81:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0104b84:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104b87:	83 ec 04             	sub    $0x4,%esp
c0104b8a:	50                   	push   %eax
c0104b8b:	6a 00                	push   $0x0
c0104b8d:	ff 75 d8             	pushl  -0x28(%ebp)
c0104b90:	e8 d6 66 00 00       	call   c010b26b <Memset>
c0104b95:	83 c4 10             	add    $0x10,%esp
c0104b98:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104b9b:	c7 40 78 07 00 00 00 	movl   $0x7,0x78(%eax)
c0104ba2:	8b 55 08             	mov    0x8(%ebp),%edx
c0104ba5:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104ba8:	89 50 50             	mov    %edx,0x50(%eax)
c0104bab:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104bae:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104bb1:	89 50 10             	mov    %edx,0x10(%eax)
c0104bb4:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104bb7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0104bba:	89 50 60             	mov    %edx,0x60(%eax)
c0104bbd:	83 ec 04             	sub    $0x4,%esp
c0104bc0:	6a 02                	push   $0x2
c0104bc2:	ff 75 d8             	pushl  -0x28(%ebp)
c0104bc5:	6a 03                	push   $0x3
c0104bc7:	e8 cc 46 00 00       	call   c0109298 <send_rec>
c0104bcc:	83 c4 10             	add    $0x10,%esp
c0104bcf:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104bd2:	8b 40 60             	mov    0x60(%eax),%eax
c0104bd5:	01 45 e8             	add    %eax,-0x18(%ebp)
c0104bd8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0104bdb:	29 45 e0             	sub    %eax,-0x20(%ebp)
c0104bde:	8b 45 10             	mov    0x10(%ebp),%eax
c0104be1:	2b 45 e4             	sub    -0x1c(%ebp),%eax
c0104be4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0104be7:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0104bea:	89 45 10             	mov    %eax,0x10(%ebp)
c0104bed:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
c0104bf4:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c0104bfb:	83 ec 0c             	sub    $0xc,%esp
c0104bfe:	ff 75 f4             	pushl  -0xc(%ebp)
c0104c01:	e8 d5 12 00 00       	call   c0105edb <get_physical_address>
c0104c06:	83 c4 10             	add    $0x10,%esp
c0104c09:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104c0c:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0104c10:	0f 85 6e ff ff ff    	jne    c0104b84 <read+0x83>
c0104c16:	eb 54                	jmp    c0104c6c <read+0x16b>
c0104c18:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104c1b:	83 ec 04             	sub    $0x4,%esp
c0104c1e:	50                   	push   %eax
c0104c1f:	6a 00                	push   $0x0
c0104c21:	ff 75 d8             	pushl  -0x28(%ebp)
c0104c24:	e8 42 66 00 00       	call   c010b26b <Memset>
c0104c29:	83 c4 10             	add    $0x10,%esp
c0104c2c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104c2f:	c7 40 78 07 00 00 00 	movl   $0x7,0x78(%eax)
c0104c36:	8b 55 08             	mov    0x8(%ebp),%edx
c0104c39:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104c3c:	89 50 50             	mov    %edx,0x50(%eax)
c0104c3f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104c42:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104c45:	89 50 10             	mov    %edx,0x10(%eax)
c0104c48:	8b 55 10             	mov    0x10(%ebp),%edx
c0104c4b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104c4e:	89 50 60             	mov    %edx,0x60(%eax)
c0104c51:	83 ec 04             	sub    $0x4,%esp
c0104c54:	6a 02                	push   $0x2
c0104c56:	ff 75 d8             	pushl  -0x28(%ebp)
c0104c59:	6a 03                	push   $0x3
c0104c5b:	e8 38 46 00 00       	call   c0109298 <send_rec>
c0104c60:	83 c4 10             	add    $0x10,%esp
c0104c63:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104c66:	8b 40 60             	mov    0x60(%eax),%eax
c0104c69:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0104c6c:	83 ec 08             	sub    $0x8,%esp
c0104c6f:	ff 75 dc             	pushl  -0x24(%ebp)
c0104c72:	ff 75 d8             	pushl  -0x28(%ebp)
c0104c75:	e8 17 c9 ff ff       	call   c0101591 <sys_free>
c0104c7a:	83 c4 10             	add    $0x10,%esp
c0104c7d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104c80:	c9                   	leave  
c0104c81:	c3                   	ret    

c0104c82 <write>:
c0104c82:	55                   	push   %ebp
c0104c83:	89 e5                	mov    %esp,%ebp
c0104c85:	83 ec 18             	sub    $0x18,%esp
c0104c88:	c7 45 f4 7c 00 00 00 	movl   $0x7c,-0xc(%ebp)
c0104c8f:	83 ec 0c             	sub    $0xc,%esp
c0104c92:	ff 75 f4             	pushl  -0xc(%ebp)
c0104c95:	e8 e2 c8 ff ff       	call   c010157c <sys_malloc>
c0104c9a:	83 c4 10             	add    $0x10,%esp
c0104c9d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104ca0:	83 ec 0c             	sub    $0xc,%esp
c0104ca3:	ff 75 0c             	pushl  0xc(%ebp)
c0104ca6:	e8 30 12 00 00       	call   c0105edb <get_physical_address>
c0104cab:	83 c4 10             	add    $0x10,%esp
c0104cae:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0104cb1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104cb4:	c7 40 78 0a 00 00 00 	movl   $0xa,0x78(%eax)
c0104cbb:	8b 55 08             	mov    0x8(%ebp),%edx
c0104cbe:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104cc1:	89 50 50             	mov    %edx,0x50(%eax)
c0104cc4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104cc7:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0104cca:	89 50 10             	mov    %edx,0x10(%eax)
c0104ccd:	8b 55 10             	mov    0x10(%ebp),%edx
c0104cd0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104cd3:	89 50 60             	mov    %edx,0x60(%eax)
c0104cd6:	83 ec 04             	sub    $0x4,%esp
c0104cd9:	6a 02                	push   $0x2
c0104cdb:	ff 75 f0             	pushl  -0x10(%ebp)
c0104cde:	6a 03                	push   $0x3
c0104ce0:	e8 b3 45 00 00       	call   c0109298 <send_rec>
c0104ce5:	83 c4 10             	add    $0x10,%esp
c0104ce8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104ceb:	8b 40 60             	mov    0x60(%eax),%eax
c0104cee:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0104cf1:	83 ec 08             	sub    $0x8,%esp
c0104cf4:	ff 75 f4             	pushl  -0xc(%ebp)
c0104cf7:	ff 75 f0             	pushl  -0x10(%ebp)
c0104cfa:	e8 92 c8 ff ff       	call   c0101591 <sys_free>
c0104cff:	83 c4 10             	add    $0x10,%esp
c0104d02:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104d05:	c9                   	leave  
c0104d06:	c3                   	ret    

c0104d07 <close>:
c0104d07:	55                   	push   %ebp
c0104d08:	89 e5                	mov    %esp,%ebp
c0104d0a:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104d10:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0104d17:	8b 45 08             	mov    0x8(%ebp),%eax
c0104d1a:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0104d1d:	83 ec 04             	sub    $0x4,%esp
c0104d20:	6a 02                	push   $0x2
c0104d22:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104d28:	50                   	push   %eax
c0104d29:	6a 03                	push   $0x3
c0104d2b:	e8 68 45 00 00       	call   c0109298 <send_rec>
c0104d30:	83 c4 10             	add    $0x10,%esp
c0104d33:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104d36:	83 f8 65             	cmp    $0x65,%eax
c0104d39:	74 19                	je     c0104d54 <close+0x4d>
c0104d3b:	6a 13                	push   $0x13
c0104d3d:	68 23 a7 10 c0       	push   $0xc010a723
c0104d42:	68 23 a7 10 c0       	push   $0xc010a723
c0104d47:	68 2f a7 10 c0       	push   $0xc010a72f
c0104d4c:	e8 d7 38 00 00       	call   c0108628 <assertion_failure>
c0104d51:	83 c4 10             	add    $0x10,%esp
c0104d54:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0104d57:	c9                   	leave  
c0104d58:	c3                   	ret    

c0104d59 <wait>:
c0104d59:	55                   	push   %ebp
c0104d5a:	89 e5                	mov    %esp,%ebp
c0104d5c:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104d62:	c7 45 f4 09 00 00 00 	movl   $0x9,-0xc(%ebp)
c0104d69:	83 ec 04             	sub    $0x4,%esp
c0104d6c:	6a 01                	push   $0x1
c0104d6e:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104d74:	50                   	push   %eax
c0104d75:	6a 03                	push   $0x3
c0104d77:	e8 1c 45 00 00       	call   c0109298 <send_rec>
c0104d7c:	83 c4 10             	add    $0x10,%esp
c0104d7f:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0104d82:	89 c2                	mov    %eax,%edx
c0104d84:	8b 45 08             	mov    0x8(%ebp),%eax
c0104d87:	89 10                	mov    %edx,(%eax)
c0104d89:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104d8c:	83 f8 21             	cmp    $0x21,%eax
c0104d8f:	74 05                	je     c0104d96 <wait+0x3d>
c0104d91:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104d94:	eb 05                	jmp    c0104d9b <wait+0x42>
c0104d96:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0104d9b:	c9                   	leave  
c0104d9c:	c3                   	ret    

c0104d9d <exit>:
c0104d9d:	55                   	push   %ebp
c0104d9e:	89 e5                	mov    %esp,%ebp
c0104da0:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104da6:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
c0104dad:	8b 45 08             	mov    0x8(%ebp),%eax
c0104db0:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0104db3:	83 ec 04             	sub    $0x4,%esp
c0104db6:	6a 01                	push   $0x1
c0104db8:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104dbe:	50                   	push   %eax
c0104dbf:	6a 03                	push   $0x3
c0104dc1:	e8 d2 44 00 00       	call   c0109298 <send_rec>
c0104dc6:	83 c4 10             	add    $0x10,%esp
c0104dc9:	90                   	nop
c0104dca:	c9                   	leave  
c0104dcb:	c3                   	ret    

c0104dcc <fork>:
c0104dcc:	55                   	push   %ebp
c0104dcd:	89 e5                	mov    %esp,%ebp
c0104dcf:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104dd5:	83 ec 04             	sub    $0x4,%esp
c0104dd8:	6a 7c                	push   $0x7c
c0104dda:	6a 00                	push   $0x0
c0104ddc:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104de2:	50                   	push   %eax
c0104de3:	e8 83 64 00 00       	call   c010b26b <Memset>
c0104de8:	83 c4 10             	add    $0x10,%esp
c0104deb:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
c0104df2:	83 ec 04             	sub    $0x4,%esp
c0104df5:	6a 01                	push   $0x1
c0104df7:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104dfd:	50                   	push   %eax
c0104dfe:	6a 03                	push   $0x3
c0104e00:	e8 93 44 00 00       	call   c0109298 <send_rec>
c0104e05:	83 c4 10             	add    $0x10,%esp
c0104e08:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c0104e0f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104e12:	c9                   	leave  
c0104e13:	c3                   	ret    

c0104e14 <getpid>:
c0104e14:	55                   	push   %ebp
c0104e15:	89 e5                	mov    %esp,%ebp
c0104e17:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104e1d:	c7 45 f4 05 00 00 00 	movl   $0x5,-0xc(%ebp)
c0104e24:	83 ec 04             	sub    $0x4,%esp
c0104e27:	6a 05                	push   $0x5
c0104e29:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104e2f:	50                   	push   %eax
c0104e30:	6a 03                	push   $0x3
c0104e32:	e8 61 44 00 00       	call   c0109298 <send_rec>
c0104e37:	83 c4 10             	add    $0x10,%esp
c0104e3a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104e3d:	c9                   	leave  
c0104e3e:	c3                   	ret    

c0104e3f <exec>:
c0104e3f:	55                   	push   %ebp
c0104e40:	89 e5                	mov    %esp,%ebp
c0104e42:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104e48:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0104e4f:	8b 45 08             	mov    0x8(%ebp),%eax
c0104e52:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0104e55:	83 ec 0c             	sub    $0xc,%esp
c0104e58:	ff 75 08             	pushl  0x8(%ebp)
c0104e5b:	e8 44 64 00 00       	call   c010b2a4 <Strlen>
c0104e60:	83 c4 10             	add    $0x10,%esp
c0104e63:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0104e66:	c7 45 8c 00 00 00 00 	movl   $0x0,-0x74(%ebp)
c0104e6d:	c7 45 98 00 00 00 00 	movl   $0x0,-0x68(%ebp)
c0104e74:	83 ec 04             	sub    $0x4,%esp
c0104e77:	6a 01                	push   $0x1
c0104e79:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104e7f:	50                   	push   %eax
c0104e80:	6a 03                	push   $0x3
c0104e82:	e8 11 44 00 00       	call   c0109298 <send_rec>
c0104e87:	83 c4 10             	add    $0x10,%esp
c0104e8a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104e8d:	83 f8 65             	cmp    $0x65,%eax
c0104e90:	74 19                	je     c0104eab <exec+0x6c>
c0104e92:	6a 19                	push   $0x19
c0104e94:	68 47 a7 10 c0       	push   $0xc010a747
c0104e99:	68 47 a7 10 c0       	push   $0xc010a747
c0104e9e:	68 52 a7 10 c0       	push   $0xc010a752
c0104ea3:	e8 80 37 00 00       	call   c0108628 <assertion_failure>
c0104ea8:	83 c4 10             	add    $0x10,%esp
c0104eab:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0104eae:	c9                   	leave  
c0104eaf:	c3                   	ret    

c0104eb0 <execv>:
c0104eb0:	55                   	push   %ebp
c0104eb1:	89 e5                	mov    %esp,%ebp
c0104eb3:	81 ec b8 00 00 00    	sub    $0xb8,%esp
c0104eb9:	c7 45 e0 00 01 00 00 	movl   $0x100,-0x20(%ebp)
c0104ec0:	83 ec 0c             	sub    $0xc,%esp
c0104ec3:	ff 75 e0             	pushl  -0x20(%ebp)
c0104ec6:	e8 b1 c6 ff ff       	call   c010157c <sys_malloc>
c0104ecb:	83 c4 10             	add    $0x10,%esp
c0104ece:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0104ed1:	66 87 db             	xchg   %bx,%bx
c0104ed4:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0104ed7:	83 ec 04             	sub    $0x4,%esp
c0104eda:	50                   	push   %eax
c0104edb:	6a 00                	push   $0x0
c0104edd:	ff 75 dc             	pushl  -0x24(%ebp)
c0104ee0:	e8 86 63 00 00       	call   c010b26b <Memset>
c0104ee5:	83 c4 10             	add    $0x10,%esp
c0104ee8:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104eeb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104eee:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0104ef5:	eb 23                	jmp    c0104f1a <execv+0x6a>
c0104ef7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104efa:	8b 00                	mov    (%eax),%eax
c0104efc:	83 ec 08             	sub    $0x8,%esp
c0104eff:	50                   	push   %eax
c0104f00:	68 6a a7 10 c0       	push   $0xc010a76a
c0104f05:	e8 c1 33 00 00       	call   c01082cb <Printf>
c0104f0a:	83 c4 10             	add    $0x10,%esp
c0104f0d:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
c0104f11:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104f14:	83 c0 04             	add    $0x4,%eax
c0104f17:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104f1a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104f1d:	8b 00                	mov    (%eax),%eax
c0104f1f:	85 c0                	test   %eax,%eax
c0104f21:	75 d4                	jne    c0104ef7 <execv+0x47>
c0104f23:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104f26:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104f29:	01 d0                	add    %edx,%eax
c0104f2b:	c6 00 00             	movb   $0x0,(%eax)
c0104f2e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104f31:	83 c0 04             	add    $0x4,%eax
c0104f34:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104f37:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104f3a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0104f3d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104f40:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0104f43:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0104f4a:	eb 5b                	jmp    c0104fa7 <execv+0xf7>
c0104f4c:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104f4f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104f52:	01 c2                	add    %eax,%edx
c0104f54:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104f57:	89 10                	mov    %edx,(%eax)
c0104f59:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104f5c:	8b 00                	mov    (%eax),%eax
c0104f5e:	8b 4d f0             	mov    -0x10(%ebp),%ecx
c0104f61:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0104f64:	01 ca                	add    %ecx,%edx
c0104f66:	83 ec 08             	sub    $0x8,%esp
c0104f69:	50                   	push   %eax
c0104f6a:	52                   	push   %edx
c0104f6b:	e8 1a 63 00 00       	call   c010b28a <Strcpy>
c0104f70:	83 c4 10             	add    $0x10,%esp
c0104f73:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104f76:	8b 00                	mov    (%eax),%eax
c0104f78:	83 ec 0c             	sub    $0xc,%esp
c0104f7b:	50                   	push   %eax
c0104f7c:	e8 23 63 00 00       	call   c010b2a4 <Strlen>
c0104f81:	83 c4 10             	add    $0x10,%esp
c0104f84:	01 45 f0             	add    %eax,-0x10(%ebp)
c0104f87:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104f8a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104f8d:	01 d0                	add    %edx,%eax
c0104f8f:	c6 00 00             	movb   $0x0,(%eax)
c0104f92:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104f95:	83 c0 01             	add    $0x1,%eax
c0104f98:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104f9b:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
c0104f9f:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c0104fa3:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0104fa7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104faa:	8b 00                	mov    (%eax),%eax
c0104fac:	85 c0                	test   %eax,%eax
c0104fae:	75 9c                	jne    c0104f4c <execv+0x9c>
c0104fb0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104fb3:	ba 00 00 00 c0       	mov    $0xc0000000,%edx
c0104fb8:	29 c2                	sub    %eax,%edx
c0104fba:	89 d0                	mov    %edx,%eax
c0104fbc:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0104fbf:	83 ec 0c             	sub    $0xc,%esp
c0104fc2:	ff 75 08             	pushl  0x8(%ebp)
c0104fc5:	e8 11 0f 00 00       	call   c0105edb <get_physical_address>
c0104fca:	83 c4 10             	add    $0x10,%esp
c0104fcd:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0104fd0:	83 ec 0c             	sub    $0xc,%esp
c0104fd3:	ff 75 dc             	pushl  -0x24(%ebp)
c0104fd6:	e8 00 0f 00 00       	call   c0105edb <get_physical_address>
c0104fdb:	83 c4 10             	add    $0x10,%esp
c0104fde:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0104fe1:	83 ec 0c             	sub    $0xc,%esp
c0104fe4:	ff 75 d8             	pushl  -0x28(%ebp)
c0104fe7:	e8 ef 0e 00 00       	call   c0105edb <get_physical_address>
c0104fec:	83 c4 10             	add    $0x10,%esp
c0104fef:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0104ff2:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
c0104ff9:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0104ffc:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0104fff:	83 ec 0c             	sub    $0xc,%esp
c0105002:	ff 75 08             	pushl  0x8(%ebp)
c0105005:	e8 9a 62 00 00       	call   c010b2a4 <Strlen>
c010500a:	83 c4 10             	add    $0x10,%esp
c010500d:	89 45 90             	mov    %eax,-0x70(%ebp)
c0105010:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0105013:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
c0105019:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010501c:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c0105022:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105025:	89 85 70 ff ff ff    	mov    %eax,-0x90(%ebp)
c010502b:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010502e:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
c0105034:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0105037:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c010503d:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105040:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0105043:	29 c2                	sub    %eax,%edx
c0105045:	89 d0                	mov    %edx,%eax
c0105047:	89 85 7c ff ff ff    	mov    %eax,-0x84(%ebp)
c010504d:	83 ec 04             	sub    $0x4,%esp
c0105050:	6a 01                	push   $0x1
c0105052:	8d 85 50 ff ff ff    	lea    -0xb0(%ebp),%eax
c0105058:	50                   	push   %eax
c0105059:	6a 03                	push   $0x3
c010505b:	e8 38 42 00 00       	call   c0109298 <send_rec>
c0105060:	83 c4 10             	add    $0x10,%esp
c0105063:	83 ec 08             	sub    $0x8,%esp
c0105066:	68 00 04 00 00       	push   $0x400
c010506b:	ff 75 dc             	pushl  -0x24(%ebp)
c010506e:	e8 1e c5 ff ff       	call   c0101591 <sys_free>
c0105073:	83 c4 10             	add    $0x10,%esp
c0105076:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0105079:	83 f8 65             	cmp    $0x65,%eax
c010507c:	74 1c                	je     c010509a <execv+0x1ea>
c010507e:	68 95 00 00 00       	push   $0x95
c0105083:	68 47 a7 10 c0       	push   $0xc010a747
c0105088:	68 47 a7 10 c0       	push   $0xc010a747
c010508d:	68 52 a7 10 c0       	push   $0xc010a752
c0105092:	e8 91 35 00 00       	call   c0108628 <assertion_failure>
c0105097:	83 c4 10             	add    $0x10,%esp
c010509a:	8b 45 a8             	mov    -0x58(%ebp),%eax
c010509d:	c9                   	leave  
c010509e:	c3                   	ret    

c010509f <execl>:
c010509f:	55                   	push   %ebp
c01050a0:	89 e5                	mov    %esp,%ebp
c01050a2:	83 ec 18             	sub    $0x18,%esp
c01050a5:	8d 45 0c             	lea    0xc(%ebp),%eax
c01050a8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01050ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01050ae:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01050b1:	83 ec 08             	sub    $0x8,%esp
c01050b4:	ff 75 f0             	pushl  -0x10(%ebp)
c01050b7:	ff 75 08             	pushl  0x8(%ebp)
c01050ba:	e8 f1 fd ff ff       	call   c0104eb0 <execv>
c01050bf:	83 c4 10             	add    $0x10,%esp
c01050c2:	c9                   	leave  
c01050c3:	c3                   	ret    

c01050c4 <TaskMM>:
c01050c4:	55                   	push   %ebp
c01050c5:	89 e5                	mov    %esp,%ebp
c01050c7:	83 ec 28             	sub    $0x28,%esp
c01050ca:	83 ec 0c             	sub    $0xc,%esp
c01050cd:	6a 7c                	push   $0x7c
c01050cf:	e8 a8 c4 ff ff       	call   c010157c <sys_malloc>
c01050d4:	83 c4 10             	add    $0x10,%esp
c01050d7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01050da:	83 ec 0c             	sub    $0xc,%esp
c01050dd:	6a 7c                	push   $0x7c
c01050df:	e8 98 c4 ff ff       	call   c010157c <sys_malloc>
c01050e4:	83 c4 10             	add    $0x10,%esp
c01050e7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01050ea:	83 ec 04             	sub    $0x4,%esp
c01050ed:	6a 12                	push   $0x12
c01050ef:	ff 75 f0             	pushl  -0x10(%ebp)
c01050f2:	6a 02                	push   $0x2
c01050f4:	e8 9f 41 00 00       	call   c0109298 <send_rec>
c01050f9:	83 c4 10             	add    $0x10,%esp
c01050fc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01050ff:	8b 40 78             	mov    0x78(%eax),%eax
c0105102:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105105:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105108:	8b 00                	mov    (%eax),%eax
c010510a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010510d:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0105114:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105117:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c010511e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105121:	c7 40 58 00 00 00 00 	movl   $0x0,0x58(%eax)
c0105128:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c010512c:	74 4e                	je     c010517c <TaskMM+0xb8>
c010512e:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c0105132:	7f 08                	jg     c010513c <TaskMM+0x78>
c0105134:	83 7d e8 02          	cmpl   $0x2,-0x18(%ebp)
c0105138:	74 28                	je     c0105162 <TaskMM+0x9e>
c010513a:	eb 71                	jmp    c01051ad <TaskMM+0xe9>
c010513c:	83 7d e8 04          	cmpl   $0x4,-0x18(%ebp)
c0105140:	74 08                	je     c010514a <TaskMM+0x86>
c0105142:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c0105146:	74 4e                	je     c0105196 <TaskMM+0xd2>
c0105148:	eb 63                	jmp    c01051ad <TaskMM+0xe9>
c010514a:	83 ec 0c             	sub    $0xc,%esp
c010514d:	ff 75 f0             	pushl  -0x10(%ebp)
c0105150:	e8 d0 04 00 00       	call   c0105625 <do_fork>
c0105155:	83 c4 10             	add    $0x10,%esp
c0105158:	89 c2                	mov    %eax,%edx
c010515a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010515d:	89 50 5c             	mov    %edx,0x5c(%eax)
c0105160:	eb 5c                	jmp    c01051be <TaskMM+0xfa>
c0105162:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0105169:	66 87 db             	xchg   %bx,%bx
c010516c:	83 ec 0c             	sub    $0xc,%esp
c010516f:	ff 75 f0             	pushl  -0x10(%ebp)
c0105172:	e8 95 00 00 00       	call   c010520c <do_exec>
c0105177:	83 c4 10             	add    $0x10,%esp
c010517a:	eb 42                	jmp    c01051be <TaskMM+0xfa>
c010517c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0105183:	83 ec 08             	sub    $0x8,%esp
c0105186:	ff 75 e0             	pushl  -0x20(%ebp)
c0105189:	ff 75 f0             	pushl  -0x10(%ebp)
c010518c:	e8 02 05 00 00       	call   c0105693 <do_exit>
c0105191:	83 c4 10             	add    $0x10,%esp
c0105194:	eb 28                	jmp    c01051be <TaskMM+0xfa>
c0105196:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010519d:	83 ec 0c             	sub    $0xc,%esp
c01051a0:	ff 75 f0             	pushl  -0x10(%ebp)
c01051a3:	e8 75 05 00 00       	call   c010571d <do_wait>
c01051a8:	83 c4 10             	add    $0x10,%esp
c01051ab:	eb 11                	jmp    c01051be <TaskMM+0xfa>
c01051ad:	83 ec 0c             	sub    $0xc,%esp
c01051b0:	68 74 a7 10 c0       	push   $0xc010a774
c01051b5:	e8 50 34 00 00       	call   c010860a <panic>
c01051ba:	83 c4 10             	add    $0x10,%esp
c01051bd:	90                   	nop
c01051be:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01051c2:	0f 84 22 ff ff ff    	je     c01050ea <TaskMM+0x26>
c01051c8:	83 ec 0c             	sub    $0xc,%esp
c01051cb:	6a 03                	push   $0x3
c01051cd:	e8 c5 2f 00 00       	call   c0108197 <delay>
c01051d2:	83 c4 10             	add    $0x10,%esp
c01051d5:	83 ec 04             	sub    $0x4,%esp
c01051d8:	ff 75 e4             	pushl  -0x1c(%ebp)
c01051db:	ff 75 ec             	pushl  -0x14(%ebp)
c01051de:	6a 01                	push   $0x1
c01051e0:	e8 b3 40 00 00       	call   c0109298 <send_rec>
c01051e5:	83 c4 10             	add    $0x10,%esp
c01051e8:	e9 fd fe ff ff       	jmp    c01050ea <TaskMM+0x26>

c01051ed <alloc_mem>:
c01051ed:	55                   	push   %ebp
c01051ee:	89 e5                	mov    %esp,%ebp
c01051f0:	83 ec 10             	sub    $0x10,%esp
c01051f3:	8b 45 08             	mov    0x8(%ebp),%eax
c01051f6:	83 e8 08             	sub    $0x8,%eax
c01051f9:	69 c0 00 10 10 00    	imul   $0x101000,%eax,%eax
c01051ff:	05 00 00 a0 00       	add    $0xa00000,%eax
c0105204:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105207:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010520a:	c9                   	leave  
c010520b:	c3                   	ret    

c010520c <do_exec>:
c010520c:	55                   	push   %ebp
c010520d:	89 e5                	mov    %esp,%ebp
c010520f:	81 ec 38 01 00 00    	sub    $0x138,%esp
c0105215:	c7 85 56 ff ff ff 64 	movl   $0x5f766564,-0xaa(%ebp)
c010521c:	65 76 5f 
c010521f:	c7 85 5a ff ff ff 74 	movl   $0x31797474,-0xa6(%ebp)
c0105226:	74 79 31 
c0105229:	66 c7 85 5e ff ff ff 	movw   $0x0,-0xa2(%ebp)
c0105230:	00 00 
c0105232:	83 ec 08             	sub    $0x8,%esp
c0105235:	6a 00                	push   $0x0
c0105237:	8d 85 56 ff ff ff    	lea    -0xaa(%ebp),%eax
c010523d:	50                   	push   %eax
c010523e:	e8 29 f8 ff ff       	call   c0104a6c <open>
c0105243:	83 c4 10             	add    $0x10,%esp
c0105246:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105249:	8b 45 08             	mov    0x8(%ebp),%eax
c010524c:	8b 00                	mov    (%eax),%eax
c010524e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0105251:	c7 45 d0 00 40 03 00 	movl   $0x34000,-0x30(%ebp)
c0105258:	8b 45 d0             	mov    -0x30(%ebp),%eax
c010525b:	83 ec 0c             	sub    $0xc,%esp
c010525e:	50                   	push   %eax
c010525f:	e8 18 c3 ff ff       	call   c010157c <sys_malloc>
c0105264:	83 c4 10             	add    $0x10,%esp
c0105267:	89 45 cc             	mov    %eax,-0x34(%ebp)
c010526a:	83 ec 04             	sub    $0x4,%esp
c010526d:	ff 75 d0             	pushl  -0x30(%ebp)
c0105270:	6a 00                	push   $0x0
c0105272:	ff 75 cc             	pushl  -0x34(%ebp)
c0105275:	e8 f1 5f 00 00       	call   c010b26b <Memset>
c010527a:	83 c4 10             	add    $0x10,%esp
c010527d:	83 ec 04             	sub    $0x4,%esp
c0105280:	6a 0c                	push   $0xc
c0105282:	6a 00                	push   $0x0
c0105284:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c010528a:	50                   	push   %eax
c010528b:	e8 db 5f 00 00       	call   c010b26b <Memset>
c0105290:	83 c4 10             	add    $0x10,%esp
c0105293:	8b 45 08             	mov    0x8(%ebp),%eax
c0105296:	8b 40 44             	mov    0x44(%eax),%eax
c0105299:	89 45 c8             	mov    %eax,-0x38(%ebp)
c010529c:	8b 45 08             	mov    0x8(%ebp),%eax
c010529f:	8b 40 40             	mov    0x40(%eax),%eax
c01052a2:	83 ec 08             	sub    $0x8,%esp
c01052a5:	50                   	push   %eax
c01052a6:	ff 75 c8             	pushl  -0x38(%ebp)
c01052a9:	e8 de 0a 00 00       	call   c0105d8c <alloc_virtual_memory>
c01052ae:	83 c4 10             	add    $0x10,%esp
c01052b1:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c01052b4:	8b 45 08             	mov    0x8(%ebp),%eax
c01052b7:	8b 40 40             	mov    0x40(%eax),%eax
c01052ba:	89 c2                	mov    %eax,%edx
c01052bc:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01052bf:	83 ec 04             	sub    $0x4,%esp
c01052c2:	52                   	push   %edx
c01052c3:	50                   	push   %eax
c01052c4:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c01052ca:	50                   	push   %eax
c01052cb:	e8 29 19 00 00       	call   c0106bf9 <Memcpy>
c01052d0:	83 c4 10             	add    $0x10,%esp
c01052d3:	8b 45 08             	mov    0x8(%ebp),%eax
c01052d6:	8b 40 40             	mov    0x40(%eax),%eax
c01052d9:	c6 84 05 4a ff ff ff 	movb   $0x0,-0xb6(%ebp,%eax,1)
c01052e0:	00 
c01052e1:	83 ec 08             	sub    $0x8,%esp
c01052e4:	6a 00                	push   $0x0
c01052e6:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c01052ec:	50                   	push   %eax
c01052ed:	e8 7a f7 ff ff       	call   c0104a6c <open>
c01052f2:	83 c4 10             	add    $0x10,%esp
c01052f5:	89 45 c0             	mov    %eax,-0x40(%ebp)
c01052f8:	83 7d c0 ff          	cmpl   $0xffffffff,-0x40(%ebp)
c01052fc:	75 15                	jne    c0105313 <do_exec+0x107>
c01052fe:	83 ec 0c             	sub    $0xc,%esp
c0105301:	68 85 a7 10 c0       	push   $0xc010a785
c0105306:	e8 c0 2f 00 00       	call   c01082cb <Printf>
c010530b:	83 c4 10             	add    $0x10,%esp
c010530e:	e9 10 03 00 00       	jmp    c0105623 <do_exec+0x417>
c0105313:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010531a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010531d:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0105320:	01 d0                	add    %edx,%eax
c0105322:	83 ec 04             	sub    $0x4,%esp
c0105325:	68 00 10 00 00       	push   $0x1000
c010532a:	50                   	push   %eax
c010532b:	ff 75 c0             	pushl  -0x40(%ebp)
c010532e:	e8 ce f7 ff ff       	call   c0104b01 <read>
c0105333:	83 c4 10             	add    $0x10,%esp
c0105336:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0105339:	8b 45 bc             	mov    -0x44(%ebp),%eax
c010533c:	01 45 f4             	add    %eax,-0xc(%ebp)
c010533f:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
c0105343:	74 0a                	je     c010534f <do_exec+0x143>
c0105345:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105348:	3b 45 d0             	cmp    -0x30(%ebp),%eax
c010534b:	7d 05                	jge    c0105352 <do_exec+0x146>
c010534d:	eb cb                	jmp    c010531a <do_exec+0x10e>
c010534f:	90                   	nop
c0105350:	eb 01                	jmp    c0105353 <do_exec+0x147>
c0105352:	90                   	nop
c0105353:	83 ec 0c             	sub    $0xc,%esp
c0105356:	ff 75 c0             	pushl  -0x40(%ebp)
c0105359:	e8 a9 f9 ff ff       	call   c0104d07 <close>
c010535e:	83 c4 10             	add    $0x10,%esp
c0105361:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0105364:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0105367:	8b 45 b8             	mov    -0x48(%ebp),%eax
c010536a:	8b 40 18             	mov    0x18(%eax),%eax
c010536d:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0105370:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0105377:	e9 04 01 00 00       	jmp    c0105480 <do_exec+0x274>
c010537c:	8b 45 b8             	mov    -0x48(%ebp),%eax
c010537f:	0f b7 40 28          	movzwl 0x28(%eax),%eax
c0105383:	0f b7 d0             	movzwl %ax,%edx
c0105386:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0105389:	0f b7 40 2a          	movzwl 0x2a(%eax),%eax
c010538d:	0f b7 c0             	movzwl %ax,%eax
c0105390:	0f af 45 f0          	imul   -0x10(%ebp),%eax
c0105394:	01 c2                	add    %eax,%edx
c0105396:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0105399:	01 d0                	add    %edx,%eax
c010539b:	89 45 b0             	mov    %eax,-0x50(%ebp)
c010539e:	8b 45 b0             	mov    -0x50(%ebp),%eax
c01053a1:	8b 40 10             	mov    0x10(%eax),%eax
c01053a4:	89 45 ac             	mov    %eax,-0x54(%ebp)
c01053a7:	8b 45 ac             	mov    -0x54(%ebp),%eax
c01053aa:	05 ff 0f 00 00       	add    $0xfff,%eax
c01053af:	c1 e8 0c             	shr    $0xc,%eax
c01053b2:	89 45 a8             	mov    %eax,-0x58(%ebp)
c01053b5:	8b 45 b0             	mov    -0x50(%ebp),%eax
c01053b8:	8b 40 08             	mov    0x8(%eax),%eax
c01053bb:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c01053be:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01053c5:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c01053c8:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c01053cb:	89 45 a0             	mov    %eax,-0x60(%ebp)
c01053ce:	8b 45 b0             	mov    -0x50(%ebp),%eax
c01053d1:	8b 50 04             	mov    0x4(%eax),%edx
c01053d4:	8b 45 a0             	mov    -0x60(%ebp),%eax
c01053d7:	01 d0                	add    %edx,%eax
c01053d9:	89 45 9c             	mov    %eax,-0x64(%ebp)
c01053dc:	83 7d ac 00          	cmpl   $0x0,-0x54(%ebp)
c01053e0:	0f 84 95 00 00 00    	je     c010547b <do_exec+0x26f>
c01053e6:	83 ec 04             	sub    $0x4,%esp
c01053e9:	ff 75 d4             	pushl  -0x2c(%ebp)
c01053ec:	ff 75 a8             	pushl  -0x58(%ebp)
c01053ef:	ff 75 a4             	pushl  -0x5c(%ebp)
c01053f2:	e8 a0 07 00 00       	call   c0105b97 <get_virtual_address_start_with_addr>
c01053f7:	83 c4 10             	add    $0x10,%esp
c01053fa:	89 45 98             	mov    %eax,-0x68(%ebp)
c01053fd:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0105400:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105403:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c010540a:	eb 41                	jmp    c010544d <do_exec+0x241>
c010540c:	83 ec 08             	sub    $0x8,%esp
c010540f:	ff 75 d4             	pushl  -0x2c(%ebp)
c0105412:	ff 75 e8             	pushl  -0x18(%ebp)
c0105415:	e8 f3 0a 00 00       	call   c0105f0d <alloc_physical_memory_of_proc>
c010541a:	83 c4 10             	add    $0x10,%esp
c010541d:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0105420:	83 ec 08             	sub    $0x8,%esp
c0105423:	68 00 10 00 00       	push   $0x1000
c0105428:	ff 75 94             	pushl  -0x6c(%ebp)
c010542b:	e8 5c 09 00 00       	call   c0105d8c <alloc_virtual_memory>
c0105430:	83 c4 10             	add    $0x10,%esp
c0105433:	89 45 90             	mov    %eax,-0x70(%ebp)
c0105436:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c010543a:	75 06                	jne    c0105442 <do_exec+0x236>
c010543c:	8b 45 90             	mov    -0x70(%ebp),%eax
c010543f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105442:	81 45 e8 00 10 00 00 	addl   $0x1000,-0x18(%ebp)
c0105449:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c010544d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105450:	39 45 a8             	cmp    %eax,-0x58(%ebp)
c0105453:	77 b7                	ja     c010540c <do_exec+0x200>
c0105455:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0105458:	8b 40 10             	mov    0x10(%eax),%eax
c010545b:	89 c1                	mov    %eax,%ecx
c010545d:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0105460:	8b 50 04             	mov    0x4(%eax),%edx
c0105463:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0105466:	01 c2                	add    %eax,%edx
c0105468:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010546b:	83 ec 04             	sub    $0x4,%esp
c010546e:	51                   	push   %ecx
c010546f:	52                   	push   %edx
c0105470:	50                   	push   %eax
c0105471:	e8 83 17 00 00       	call   c0106bf9 <Memcpy>
c0105476:	83 c4 10             	add    $0x10,%esp
c0105479:	eb 01                	jmp    c010547c <do_exec+0x270>
c010547b:	90                   	nop
c010547c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0105480:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0105483:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
c0105487:	0f b7 c0             	movzwl %ax,%eax
c010548a:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c010548d:	0f 8c e9 fe ff ff    	jl     c010537c <do_exec+0x170>
c0105493:	8b 45 08             	mov    0x8(%ebp),%eax
c0105496:	8b 40 10             	mov    0x10(%eax),%eax
c0105499:	89 45 8c             	mov    %eax,-0x74(%ebp)
c010549c:	8b 45 08             	mov    0x8(%ebp),%eax
c010549f:	8b 40 1c             	mov    0x1c(%eax),%eax
c01054a2:	89 45 88             	mov    %eax,-0x78(%ebp)
c01054a5:	8b 45 08             	mov    0x8(%ebp),%eax
c01054a8:	8b 40 24             	mov    0x24(%eax),%eax
c01054ab:	89 45 84             	mov    %eax,-0x7c(%ebp)
c01054ae:	83 ec 0c             	sub    $0xc,%esp
c01054b1:	ff 75 d4             	pushl  -0x2c(%ebp)
c01054b4:	e8 9d e2 ff ff       	call   c0103756 <pid2proc>
c01054b9:	83 c4 10             	add    $0x10,%esp
c01054bc:	89 45 80             	mov    %eax,-0x80(%ebp)
c01054bf:	8b 45 08             	mov    0x8(%ebp),%eax
c01054c2:	8b 40 10             	mov    0x10(%eax),%eax
c01054c5:	89 85 7c ff ff ff    	mov    %eax,-0x84(%ebp)
c01054cb:	83 ec 08             	sub    $0x8,%esp
c01054ce:	ff 75 88             	pushl  -0x78(%ebp)
c01054d1:	ff b5 7c ff ff ff    	pushl  -0x84(%ebp)
c01054d7:	e8 b0 08 00 00       	call   c0105d8c <alloc_virtual_memory>
c01054dc:	83 c4 10             	add    $0x10,%esp
c01054df:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01054e5:	8b 45 08             	mov    0x8(%ebp),%eax
c01054e8:	8b 40 2c             	mov    0x2c(%eax),%eax
c01054eb:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
c01054f1:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c01054f8:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01054fe:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105501:	eb 1a                	jmp    c010551d <do_exec+0x311>
c0105503:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0105507:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010550a:	8b 10                	mov    (%eax),%edx
c010550c:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0105512:	01 c2                	add    %eax,%edx
c0105514:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105517:	89 10                	mov    %edx,(%eax)
c0105519:	83 45 dc 04          	addl   $0x4,-0x24(%ebp)
c010551d:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105520:	8b 00                	mov    (%eax),%eax
c0105522:	85 c0                	test   %eax,%eax
c0105524:	75 dd                	jne    c0105503 <do_exec+0x2f7>
c0105526:	83 ec 0c             	sub    $0xc,%esp
c0105529:	ff 75 84             	pushl  -0x7c(%ebp)
c010552c:	e8 5b 08 00 00       	call   c0105d8c <alloc_virtual_memory>
c0105531:	83 c4 10             	add    $0x10,%esp
c0105534:	89 85 70 ff ff ff    	mov    %eax,-0x90(%ebp)
c010553a:	8b 95 78 ff ff ff    	mov    -0x88(%ebp),%edx
c0105540:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
c0105546:	83 ec 04             	sub    $0x4,%esp
c0105549:	ff 75 88             	pushl  -0x78(%ebp)
c010554c:	52                   	push   %edx
c010554d:	50                   	push   %eax
c010554e:	e8 a6 16 00 00       	call   c0106bf9 <Memcpy>
c0105553:	83 c4 10             	add    $0x10,%esp
c0105556:	8b 45 08             	mov    0x8(%ebp),%eax
c0105559:	8b 40 28             	mov    0x28(%eax),%eax
c010555c:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c0105562:	83 ec 08             	sub    $0x8,%esp
c0105565:	ff 75 d4             	pushl  -0x2c(%ebp)
c0105568:	ff 75 80             	pushl  -0x80(%ebp)
c010556b:	e8 ef 08 00 00       	call   c0105e5f <get_physical_address_proc>
c0105570:	83 c4 10             	add    $0x10,%esp
c0105573:	89 85 68 ff ff ff    	mov    %eax,-0x98(%ebp)
c0105579:	83 ec 08             	sub    $0x8,%esp
c010557c:	68 00 10 00 00       	push   $0x1000
c0105581:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
c0105587:	e8 00 08 00 00       	call   c0105d8c <alloc_virtual_memory>
c010558c:	83 c4 10             	add    $0x10,%esp
c010558f:	89 85 64 ff ff ff    	mov    %eax,-0x9c(%ebp)
c0105595:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
c010559b:	05 bc 0f 00 00       	add    $0xfbc,%eax
c01055a0:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
c01055a6:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c01055ac:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c01055b2:	89 50 20             	mov    %edx,0x20(%eax)
c01055b5:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01055b8:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c01055be:	89 50 28             	mov    %edx,0x28(%eax)
c01055c1:	8b 45 b8             	mov    -0x48(%ebp),%eax
c01055c4:	8b 40 18             	mov    0x18(%eax),%eax
c01055c7:	89 c2                	mov    %eax,%edx
c01055c9:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c01055cf:	89 50 30             	mov    %edx,0x30(%eax)
c01055d2:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c01055d8:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c01055de:	89 50 3c             	mov    %edx,0x3c(%eax)
c01055e1:	8b 45 80             	mov    -0x80(%ebp),%eax
c01055e4:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c01055eb:	00 00 00 
c01055ee:	c7 85 44 ff ff ff 65 	movl   $0x65,-0xbc(%ebp)
c01055f5:	00 00 00 
c01055f8:	c7 85 24 ff ff ff 00 	movl   $0x0,-0xdc(%ebp)
c01055ff:	00 00 00 
c0105602:	c7 85 28 ff ff ff 00 	movl   $0x0,-0xd8(%ebp)
c0105609:	00 00 00 
c010560c:	83 ec 04             	sub    $0x4,%esp
c010560f:	ff 75 d4             	pushl  -0x2c(%ebp)
c0105612:	8d 85 cc fe ff ff    	lea    -0x134(%ebp),%eax
c0105618:	50                   	push   %eax
c0105619:	6a 01                	push   $0x1
c010561b:	e8 78 3c 00 00       	call   c0109298 <send_rec>
c0105620:	83 c4 10             	add    $0x10,%esp
c0105623:	c9                   	leave  
c0105624:	c3                   	ret    

c0105625 <do_fork>:
c0105625:	55                   	push   %ebp
c0105626:	89 e5                	mov    %esp,%ebp
c0105628:	81 ec 98 00 00 00    	sub    $0x98,%esp
c010562e:	8b 45 08             	mov    0x8(%ebp),%eax
c0105631:	8b 00                	mov    (%eax),%eax
c0105633:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105636:	83 ec 0c             	sub    $0xc,%esp
c0105639:	ff 75 f4             	pushl  -0xc(%ebp)
c010563c:	e8 52 45 00 00       	call   c0109b93 <fork_process>
c0105641:	83 c4 10             	add    $0x10,%esp
c0105644:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105647:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010564a:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c0105650:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105653:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105656:	8b 90 14 01 00 00    	mov    0x114(%eax),%edx
c010565c:	8b 45 08             	mov    0x8(%ebp),%eax
c010565f:	89 50 5c             	mov    %edx,0x5c(%eax)
c0105662:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c0105669:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0105670:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0105677:	83 ec 04             	sub    $0x4,%esp
c010567a:	ff 75 ec             	pushl  -0x14(%ebp)
c010567d:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
c0105683:	50                   	push   %eax
c0105684:	6a 01                	push   $0x1
c0105686:	e8 0d 3c 00 00       	call   c0109298 <send_rec>
c010568b:	83 c4 10             	add    $0x10,%esp
c010568e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105691:	c9                   	leave  
c0105692:	c3                   	ret    

c0105693 <do_exit>:
c0105693:	55                   	push   %ebp
c0105694:	89 e5                	mov    %esp,%ebp
c0105696:	83 ec 18             	sub    $0x18,%esp
c0105699:	8b 45 08             	mov    0x8(%ebp),%eax
c010569c:	8b 00                	mov    (%eax),%eax
c010569e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01056a1:	83 ec 0c             	sub    $0xc,%esp
c01056a4:	ff 75 f4             	pushl  -0xc(%ebp)
c01056a7:	e8 aa e0 ff ff       	call   c0103756 <pid2proc>
c01056ac:	83 c4 10             	add    $0x10,%esp
c01056af:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01056b2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01056b5:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c01056bb:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01056be:	83 ec 0c             	sub    $0xc,%esp
c01056c1:	ff 75 ec             	pushl  -0x14(%ebp)
c01056c4:	e8 8d e0 ff ff       	call   c0103756 <pid2proc>
c01056c9:	83 c4 10             	add    $0x10,%esp
c01056cc:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01056cf:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c01056d3:	74 45                	je     c010571a <do_exit+0x87>
c01056d5:	8b 45 08             	mov    0x8(%ebp),%eax
c01056d8:	8b 40 54             	mov    0x54(%eax),%eax
c01056db:	89 c2                	mov    %eax,%edx
c01056dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01056e0:	89 90 5c 02 00 00    	mov    %edx,0x25c(%eax)
c01056e6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01056e9:	0f b6 80 3d 02 00 00 	movzbl 0x23d(%eax),%eax
c01056f0:	3c 04                	cmp    $0x4,%al
c01056f2:	75 1a                	jne    c010570e <do_exit+0x7b>
c01056f4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01056f7:	c6 80 3d 02 00 00 fb 	movb   $0xfb,0x23d(%eax)
c01056fe:	83 ec 0c             	sub    $0xc,%esp
c0105701:	ff 75 f0             	pushl  -0x10(%ebp)
c0105704:	e8 33 01 00 00       	call   c010583c <cleanup>
c0105709:	83 c4 10             	add    $0x10,%esp
c010570c:	eb 0d                	jmp    c010571b <do_exit+0x88>
c010570e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105711:	c6 80 3c 02 00 00 03 	movb   $0x3,0x23c(%eax)
c0105718:	eb 01                	jmp    c010571b <do_exit+0x88>
c010571a:	90                   	nop
c010571b:	c9                   	leave  
c010571c:	c3                   	ret    

c010571d <do_wait>:
c010571d:	55                   	push   %ebp
c010571e:	89 e5                	mov    %esp,%ebp
c0105720:	81 ec a8 00 00 00    	sub    $0xa8,%esp
c0105726:	8b 45 08             	mov    0x8(%ebp),%eax
c0105729:	8b 00                	mov    (%eax),%eax
c010572b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010572e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0105735:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010573c:	83 ec 0c             	sub    $0xc,%esp
c010573f:	ff 75 ec             	pushl  -0x14(%ebp)
c0105742:	e8 0f e0 ff ff       	call   c0103756 <pid2proc>
c0105747:	83 c4 10             	add    $0x10,%esp
c010574a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010574d:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0105751:	75 19                	jne    c010576c <do_wait+0x4f>
c0105753:	6a 58                	push   $0x58
c0105755:	68 95 a7 10 c0       	push   $0xc010a795
c010575a:	68 95 a7 10 c0       	push   $0xc010a795
c010575f:	68 a3 a7 10 c0       	push   $0xc010a7a3
c0105764:	e8 bf 2e 00 00       	call   c0108628 <assertion_failure>
c0105769:	83 c4 10             	add    $0x10,%esp
c010576c:	a1 ec fd 10 c0       	mov    0xc010fdec,%eax
c0105771:	8b 15 f0 fd 10 c0    	mov    0xc010fdf0,%edx
c0105777:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010577a:	89 55 e0             	mov    %edx,-0x20(%ebp)
c010577d:	a1 f4 fd 10 c0       	mov    0xc010fdf4,%eax
c0105782:	8b 15 f8 fd 10 c0    	mov    0xc010fdf8,%edx
c0105788:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010578b:	89 55 d8             	mov    %edx,-0x28(%ebp)
c010578e:	a1 f0 fd 10 c0       	mov    0xc010fdf0,%eax
c0105793:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105796:	eb 5b                	jmp    c01057f3 <do_wait+0xd6>
c0105798:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010579b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01057a0:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01057a3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01057a6:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c01057ac:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c01057af:	74 0b                	je     c01057bc <do_wait+0x9f>
c01057b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01057b4:	8b 40 04             	mov    0x4(%eax),%eax
c01057b7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01057ba:	eb 37                	jmp    c01057f3 <do_wait+0xd6>
c01057bc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01057c0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01057c3:	0f b6 80 3d 02 00 00 	movzbl 0x23d(%eax),%eax
c01057ca:	3c 03                	cmp    $0x3,%al
c01057cc:	74 0b                	je     c01057d9 <do_wait+0xbc>
c01057ce:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01057d1:	8b 40 04             	mov    0x4(%eax),%eax
c01057d4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01057d7:	eb 1a                	jmp    c01057f3 <do_wait+0xd6>
c01057d9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01057dc:	c6 80 3d 02 00 00 fb 	movb   $0xfb,0x23d(%eax)
c01057e3:	83 ec 0c             	sub    $0xc,%esp
c01057e6:	ff 75 e8             	pushl  -0x18(%ebp)
c01057e9:	e8 4e 00 00 00       	call   c010583c <cleanup>
c01057ee:	83 c4 10             	add    $0x10,%esp
c01057f1:	eb 47                	jmp    c010583a <do_wait+0x11d>
c01057f3:	81 7d f0 f4 fd 10 c0 	cmpl   $0xc010fdf4,-0x10(%ebp)
c01057fa:	75 9c                	jne    c0105798 <do_wait+0x7b>
c01057fc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0105800:	74 0c                	je     c010580e <do_wait+0xf1>
c0105802:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105805:	c6 80 3d 02 00 00 04 	movb   $0x4,0x23d(%eax)
c010580c:	eb 2c                	jmp    c010583a <do_wait+0x11d>
c010580e:	c7 45 d0 65 00 00 00 	movl   $0x65,-0x30(%ebp)
c0105815:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
c010581c:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
c0105823:	83 ec 04             	sub    $0x4,%esp
c0105826:	ff 75 ec             	pushl  -0x14(%ebp)
c0105829:	8d 85 58 ff ff ff    	lea    -0xa8(%ebp),%eax
c010582f:	50                   	push   %eax
c0105830:	6a 01                	push   $0x1
c0105832:	e8 61 3a 00 00       	call   c0109298 <send_rec>
c0105837:	83 c4 10             	add    $0x10,%esp
c010583a:	c9                   	leave  
c010583b:	c3                   	ret    

c010583c <cleanup>:
c010583c:	55                   	push   %ebp
c010583d:	89 e5                	mov    %esp,%ebp
c010583f:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0105845:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c010584c:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0105853:	8b 45 08             	mov    0x8(%ebp),%eax
c0105856:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c010585c:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010585f:	8b 45 08             	mov    0x8(%ebp),%eax
c0105862:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c0105868:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010586b:	8b 45 08             	mov    0x8(%ebp),%eax
c010586e:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0105874:	83 ec 04             	sub    $0x4,%esp
c0105877:	50                   	push   %eax
c0105878:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c010587e:	50                   	push   %eax
c010587f:	6a 01                	push   $0x1
c0105881:	e8 12 3a 00 00       	call   c0109298 <send_rec>
c0105886:	83 c4 10             	add    $0x10,%esp
c0105889:	8b 45 08             	mov    0x8(%ebp),%eax
c010588c:	c6 80 3c 02 00 00 ff 	movb   $0xff,0x23c(%eax)
c0105893:	90                   	nop
c0105894:	c9                   	leave  
c0105895:	c3                   	ret    

c0105896 <init_bitmap>:
c0105896:	55                   	push   %ebp
c0105897:	89 e5                	mov    %esp,%ebp
c0105899:	83 ec 08             	sub    $0x8,%esp
c010589c:	8b 45 08             	mov    0x8(%ebp),%eax
c010589f:	8b 50 04             	mov    0x4(%eax),%edx
c01058a2:	8b 45 08             	mov    0x8(%ebp),%eax
c01058a5:	8b 00                	mov    (%eax),%eax
c01058a7:	83 ec 04             	sub    $0x4,%esp
c01058aa:	52                   	push   %edx
c01058ab:	6a 00                	push   $0x0
c01058ad:	50                   	push   %eax
c01058ae:	e8 b8 59 00 00       	call   c010b26b <Memset>
c01058b3:	83 c4 10             	add    $0x10,%esp
c01058b6:	90                   	nop
c01058b7:	c9                   	leave  
c01058b8:	c3                   	ret    

c01058b9 <test_bit_val>:
c01058b9:	55                   	push   %ebp
c01058ba:	89 e5                	mov    %esp,%ebp
c01058bc:	53                   	push   %ebx
c01058bd:	83 ec 10             	sub    $0x10,%esp
c01058c0:	8b 45 0c             	mov    0xc(%ebp),%eax
c01058c3:	8d 50 07             	lea    0x7(%eax),%edx
c01058c6:	85 c0                	test   %eax,%eax
c01058c8:	0f 48 c2             	cmovs  %edx,%eax
c01058cb:	c1 f8 03             	sar    $0x3,%eax
c01058ce:	89 45 f8             	mov    %eax,-0x8(%ebp)
c01058d1:	8b 45 0c             	mov    0xc(%ebp),%eax
c01058d4:	99                   	cltd   
c01058d5:	c1 ea 1d             	shr    $0x1d,%edx
c01058d8:	01 d0                	add    %edx,%eax
c01058da:	83 e0 07             	and    $0x7,%eax
c01058dd:	29 d0                	sub    %edx,%eax
c01058df:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01058e2:	8b 45 08             	mov    0x8(%ebp),%eax
c01058e5:	8b 10                	mov    (%eax),%edx
c01058e7:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01058ea:	01 d0                	add    %edx,%eax
c01058ec:	0f b6 00             	movzbl (%eax),%eax
c01058ef:	88 45 f3             	mov    %al,-0xd(%ebp)
c01058f2:	0f be 55 f3          	movsbl -0xd(%ebp),%edx
c01058f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01058f9:	bb 01 00 00 00       	mov    $0x1,%ebx
c01058fe:	89 c1                	mov    %eax,%ecx
c0105900:	d3 e3                	shl    %cl,%ebx
c0105902:	89 d8                	mov    %ebx,%eax
c0105904:	21 c2                	and    %eax,%edx
c0105906:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105909:	89 c1                	mov    %eax,%ecx
c010590b:	d3 fa                	sar    %cl,%edx
c010590d:	89 d0                	mov    %edx,%eax
c010590f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105912:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0105916:	0f 9f c0             	setg   %al
c0105919:	0f b6 c0             	movzbl %al,%eax
c010591c:	83 c4 10             	add    $0x10,%esp
c010591f:	5b                   	pop    %ebx
c0105920:	5d                   	pop    %ebp
c0105921:	c3                   	ret    

c0105922 <set_bit_val>:
c0105922:	55                   	push   %ebp
c0105923:	89 e5                	mov    %esp,%ebp
c0105925:	83 ec 10             	sub    $0x10,%esp
c0105928:	8b 45 0c             	mov    0xc(%ebp),%eax
c010592b:	8d 50 07             	lea    0x7(%eax),%edx
c010592e:	85 c0                	test   %eax,%eax
c0105930:	0f 48 c2             	cmovs  %edx,%eax
c0105933:	c1 f8 03             	sar    $0x3,%eax
c0105936:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105939:	8b 45 0c             	mov    0xc(%ebp),%eax
c010593c:	99                   	cltd   
c010593d:	c1 ea 1d             	shr    $0x1d,%edx
c0105940:	01 d0                	add    %edx,%eax
c0105942:	83 e0 07             	and    $0x7,%eax
c0105945:	29 d0                	sub    %edx,%eax
c0105947:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010594a:	8b 45 08             	mov    0x8(%ebp),%eax
c010594d:	8b 10                	mov    (%eax),%edx
c010594f:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105952:	01 d0                	add    %edx,%eax
c0105954:	0f b6 00             	movzbl (%eax),%eax
c0105957:	88 45 ff             	mov    %al,-0x1(%ebp)
c010595a:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c010595e:	7e 13                	jle    c0105973 <set_bit_val+0x51>
c0105960:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105963:	ba 01 00 00 00       	mov    $0x1,%edx
c0105968:	89 c1                	mov    %eax,%ecx
c010596a:	d3 e2                	shl    %cl,%edx
c010596c:	89 d0                	mov    %edx,%eax
c010596e:	08 45 ff             	or     %al,-0x1(%ebp)
c0105971:	eb 13                	jmp    c0105986 <set_bit_val+0x64>
c0105973:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105976:	ba 01 00 00 00       	mov    $0x1,%edx
c010597b:	89 c1                	mov    %eax,%ecx
c010597d:	d3 e2                	shl    %cl,%edx
c010597f:	89 d0                	mov    %edx,%eax
c0105981:	f7 d0                	not    %eax
c0105983:	20 45 ff             	and    %al,-0x1(%ebp)
c0105986:	8b 45 08             	mov    0x8(%ebp),%eax
c0105989:	8b 10                	mov    (%eax),%edx
c010598b:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010598e:	01 c2                	add    %eax,%edx
c0105990:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
c0105994:	88 02                	mov    %al,(%edx)
c0105996:	b8 01 00 00 00       	mov    $0x1,%eax
c010599b:	c9                   	leave  
c010599c:	c3                   	ret    

c010599d <set_bits>:
c010599d:	55                   	push   %ebp
c010599e:	89 e5                	mov    %esp,%ebp
c01059a0:	83 ec 10             	sub    $0x10,%esp
c01059a3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c01059aa:	eb 1c                	jmp    c01059c8 <set_bits+0x2b>
c01059ac:	8b 45 0c             	mov    0xc(%ebp),%eax
c01059af:	8d 50 01             	lea    0x1(%eax),%edx
c01059b2:	89 55 0c             	mov    %edx,0xc(%ebp)
c01059b5:	ff 75 10             	pushl  0x10(%ebp)
c01059b8:	50                   	push   %eax
c01059b9:	ff 75 08             	pushl  0x8(%ebp)
c01059bc:	e8 61 ff ff ff       	call   c0105922 <set_bit_val>
c01059c1:	83 c4 0c             	add    $0xc,%esp
c01059c4:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c01059c8:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01059cb:	3b 45 14             	cmp    0x14(%ebp),%eax
c01059ce:	7c dc                	jl     c01059ac <set_bits+0xf>
c01059d0:	b8 01 00 00 00       	mov    $0x1,%eax
c01059d5:	c9                   	leave  
c01059d6:	c3                   	ret    

c01059d7 <get_first_free_bit>:
c01059d7:	55                   	push   %ebp
c01059d8:	89 e5                	mov    %esp,%ebp
c01059da:	83 ec 10             	sub    $0x10,%esp
c01059dd:	8b 45 08             	mov    0x8(%ebp),%eax
c01059e0:	8b 40 04             	mov    0x4(%eax),%eax
c01059e3:	c1 e0 03             	shl    $0x3,%eax
c01059e6:	89 45 f8             	mov    %eax,-0x8(%ebp)
c01059e9:	8b 45 0c             	mov    0xc(%ebp),%eax
c01059ec:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01059ef:	eb 1b                	jmp    c0105a0c <get_first_free_bit+0x35>
c01059f1:	ff 75 fc             	pushl  -0x4(%ebp)
c01059f4:	ff 75 08             	pushl  0x8(%ebp)
c01059f7:	e8 bd fe ff ff       	call   c01058b9 <test_bit_val>
c01059fc:	83 c4 08             	add    $0x8,%esp
c01059ff:	85 c0                	test   %eax,%eax
c0105a01:	75 05                	jne    c0105a08 <get_first_free_bit+0x31>
c0105a03:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105a06:	eb 11                	jmp    c0105a19 <get_first_free_bit+0x42>
c0105a08:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0105a0c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105a0f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c0105a12:	7c dd                	jl     c01059f1 <get_first_free_bit+0x1a>
c0105a14:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0105a19:	c9                   	leave  
c0105a1a:	c3                   	ret    

c0105a1b <get_bits>:
c0105a1b:	55                   	push   %ebp
c0105a1c:	89 e5                	mov    %esp,%ebp
c0105a1e:	83 ec 20             	sub    $0x20,%esp
c0105a21:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0105a28:	ff 75 f0             	pushl  -0x10(%ebp)
c0105a2b:	ff 75 08             	pushl  0x8(%ebp)
c0105a2e:	e8 a4 ff ff ff       	call   c01059d7 <get_first_free_bit>
c0105a33:	83 c4 08             	add    $0x8,%esp
c0105a36:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105a39:	8b 45 08             	mov    0x8(%ebp),%eax
c0105a3c:	8b 40 04             	mov    0x4(%eax),%eax
c0105a3f:	c1 e0 03             	shl    $0x3,%eax
c0105a42:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105a45:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105a48:	83 e8 01             	sub    $0x1,%eax
c0105a4b:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105a4e:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c0105a52:	75 08                	jne    c0105a5c <get_bits+0x41>
c0105a54:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105a57:	e9 85 00 00 00       	jmp    c0105ae1 <get_bits+0xc6>
c0105a5c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105a5f:	83 c0 01             	add    $0x1,%eax
c0105a62:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105a65:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105a68:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105a6b:	eb 58                	jmp    c0105ac5 <get_bits+0xaa>
c0105a6d:	ff 75 f8             	pushl  -0x8(%ebp)
c0105a70:	ff 75 08             	pushl  0x8(%ebp)
c0105a73:	e8 41 fe ff ff       	call   c01058b9 <test_bit_val>
c0105a78:	83 c4 08             	add    $0x8,%esp
c0105a7b:	85 c0                	test   %eax,%eax
c0105a7d:	75 0a                	jne    c0105a89 <get_bits+0x6e>
c0105a7f:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0105a83:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0105a87:	eb 2b                	jmp    c0105ab4 <get_bits+0x99>
c0105a89:	6a 00                	push   $0x0
c0105a8b:	ff 75 08             	pushl  0x8(%ebp)
c0105a8e:	e8 44 ff ff ff       	call   c01059d7 <get_first_free_bit>
c0105a93:	83 c4 08             	add    $0x8,%esp
c0105a96:	83 c0 01             	add    $0x1,%eax
c0105a99:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105a9c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105a9f:	83 c0 01             	add    $0x1,%eax
c0105aa2:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105aa5:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105aa8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105aab:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105aae:	83 e8 01             	sub    $0x1,%eax
c0105ab1:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105ab4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105ab7:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c0105aba:	7c 09                	jl     c0105ac5 <get_bits+0xaa>
c0105abc:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c0105ac3:	eb 0d                	jmp    c0105ad2 <get_bits+0xb7>
c0105ac5:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105ac8:	8d 50 ff             	lea    -0x1(%eax),%edx
c0105acb:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0105ace:	85 c0                	test   %eax,%eax
c0105ad0:	7f 9b                	jg     c0105a6d <get_bits+0x52>
c0105ad2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105ad5:	2b 45 0c             	sub    0xc(%ebp),%eax
c0105ad8:	83 c0 01             	add    $0x1,%eax
c0105adb:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105ade:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105ae1:	c9                   	leave  
c0105ae2:	c3                   	ret    

c0105ae3 <get_a_page>:
c0105ae3:	55                   	push   %ebp
c0105ae4:	89 e5                	mov    %esp,%ebp
c0105ae6:	83 ec 28             	sub    $0x28,%esp
c0105ae9:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0105aed:	75 22                	jne    c0105b11 <get_a_page+0x2e>
c0105aef:	a1 ac 06 11 c0       	mov    0xc01106ac,%eax
c0105af4:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105af7:	a1 b0 06 11 c0       	mov    0xc01106b0,%eax
c0105afc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105aff:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0105b04:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105b07:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c0105b0c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105b0f:	eb 20                	jmp    c0105b31 <get_a_page+0x4e>
c0105b11:	a1 f4 0e 11 c0       	mov    0xc0110ef4,%eax
c0105b16:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105b19:	a1 f8 0e 11 c0       	mov    0xc0110ef8,%eax
c0105b1e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105b21:	a1 fc 0e 11 c0       	mov    0xc0110efc,%eax
c0105b26:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105b29:	a1 00 0f 11 c0       	mov    0xc0110f00,%eax
c0105b2e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105b31:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105b34:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0105b37:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105b3a:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0105b3d:	6a 01                	push   $0x1
c0105b3f:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105b42:	50                   	push   %eax
c0105b43:	e8 d3 fe ff ff       	call   c0105a1b <get_bits>
c0105b48:	83 c4 08             	add    $0x8,%esp
c0105b4b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105b4e:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c0105b52:	75 1c                	jne    c0105b70 <get_a_page+0x8d>
c0105b54:	68 84 00 00 00       	push   $0x84
c0105b59:	68 b6 a7 10 c0       	push   $0xc010a7b6
c0105b5e:	68 b6 a7 10 c0       	push   $0xc010a7b6
c0105b63:	68 c0 a7 10 c0       	push   $0xc010a7c0
c0105b68:	e8 bb 2a 00 00       	call   c0108628 <assertion_failure>
c0105b6d:	83 c4 10             	add    $0x10,%esp
c0105b70:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105b73:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0105b76:	c1 e2 0c             	shl    $0xc,%edx
c0105b79:	01 d0                	add    %edx,%eax
c0105b7b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105b7e:	83 ec 04             	sub    $0x4,%esp
c0105b81:	6a 01                	push   $0x1
c0105b83:	ff 75 f4             	pushl  -0xc(%ebp)
c0105b86:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105b89:	50                   	push   %eax
c0105b8a:	e8 93 fd ff ff       	call   c0105922 <set_bit_val>
c0105b8f:	83 c4 10             	add    $0x10,%esp
c0105b92:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105b95:	c9                   	leave  
c0105b96:	c3                   	ret    

c0105b97 <get_virtual_address_start_with_addr>:
c0105b97:	55                   	push   %ebp
c0105b98:	89 e5                	mov    %esp,%ebp
c0105b9a:	83 ec 38             	sub    $0x38,%esp
c0105b9d:	e8 01 a8 ff ff       	call   c01003a3 <get_running_thread_pcb>
c0105ba2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105ba5:	83 ec 0c             	sub    $0xc,%esp
c0105ba8:	ff 75 10             	pushl  0x10(%ebp)
c0105bab:	e8 a6 db ff ff       	call   c0103756 <pid2proc>
c0105bb0:	83 c4 10             	add    $0x10,%esp
c0105bb3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105bb6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105bb9:	8b 40 0c             	mov    0xc(%eax),%eax
c0105bbc:	83 ec 04             	sub    $0x4,%esp
c0105bbf:	6a 0c                	push   $0xc
c0105bc1:	50                   	push   %eax
c0105bc2:	8d 45 dc             	lea    -0x24(%ebp),%eax
c0105bc5:	50                   	push   %eax
c0105bc6:	e8 2e 10 00 00       	call   c0106bf9 <Memcpy>
c0105bcb:	83 c4 10             	add    $0x10,%esp
c0105bce:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105bd1:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0105bd4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0105bd7:	89 55 d8             	mov    %edx,-0x28(%ebp)
c0105bda:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105bdd:	8b 55 08             	mov    0x8(%ebp),%edx
c0105be0:	29 c2                	sub    %eax,%edx
c0105be2:	89 d0                	mov    %edx,%eax
c0105be4:	c1 e8 0c             	shr    $0xc,%eax
c0105be7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105bea:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0105bee:	79 1c                	jns    c0105c0c <get_virtual_address_start_with_addr+0x75>
c0105bf0:	68 97 00 00 00       	push   $0x97
c0105bf5:	68 b6 a7 10 c0       	push   $0xc010a7b6
c0105bfa:	68 b6 a7 10 c0       	push   $0xc010a7b6
c0105bff:	68 cc a7 10 c0       	push   $0xc010a7cc
c0105c04:	e8 1f 2a 00 00       	call   c0108628 <assertion_failure>
c0105c09:	83 c4 10             	add    $0x10,%esp
c0105c0c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105c0f:	50                   	push   %eax
c0105c10:	6a 01                	push   $0x1
c0105c12:	ff 75 ec             	pushl  -0x14(%ebp)
c0105c15:	8d 45 d4             	lea    -0x2c(%ebp),%eax
c0105c18:	50                   	push   %eax
c0105c19:	e8 7f fd ff ff       	call   c010599d <set_bits>
c0105c1e:	83 c4 10             	add    $0x10,%esp
c0105c21:	8b 45 08             	mov    0x8(%ebp),%eax
c0105c24:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105c29:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105c2c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105c2f:	c9                   	leave  
c0105c30:	c3                   	ret    

c0105c31 <get_virtual_address>:
c0105c31:	55                   	push   %ebp
c0105c32:	89 e5                	mov    %esp,%ebp
c0105c34:	83 ec 28             	sub    $0x28,%esp
c0105c37:	e8 67 a7 ff ff       	call   c01003a3 <get_running_thread_pcb>
c0105c3c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105c3f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0105c43:	75 1a                	jne    c0105c5f <get_virtual_address+0x2e>
c0105c45:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0105c4a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105c4d:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0105c52:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105c55:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c0105c5a:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105c5d:	eb 18                	jmp    c0105c77 <get_virtual_address+0x46>
c0105c5f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105c62:	8b 40 0c             	mov    0xc(%eax),%eax
c0105c65:	83 ec 04             	sub    $0x4,%esp
c0105c68:	6a 0c                	push   $0xc
c0105c6a:	50                   	push   %eax
c0105c6b:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0105c6e:	50                   	push   %eax
c0105c6f:	e8 85 0f 00 00       	call   c0106bf9 <Memcpy>
c0105c74:	83 c4 10             	add    $0x10,%esp
c0105c77:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105c7a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0105c7d:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105c80:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0105c83:	8b 45 08             	mov    0x8(%ebp),%eax
c0105c86:	83 ec 08             	sub    $0x8,%esp
c0105c89:	50                   	push   %eax
c0105c8a:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105c8d:	50                   	push   %eax
c0105c8e:	e8 88 fd ff ff       	call   c0105a1b <get_bits>
c0105c93:	83 c4 10             	add    $0x10,%esp
c0105c96:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105c99:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105c9c:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0105c9f:	c1 e2 0c             	shl    $0xc,%edx
c0105ca2:	01 d0                	add    %edx,%eax
c0105ca4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105ca7:	8b 45 08             	mov    0x8(%ebp),%eax
c0105caa:	50                   	push   %eax
c0105cab:	6a 01                	push   $0x1
c0105cad:	ff 75 f0             	pushl  -0x10(%ebp)
c0105cb0:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105cb3:	50                   	push   %eax
c0105cb4:	e8 e4 fc ff ff       	call   c010599d <set_bits>
c0105cb9:	83 c4 10             	add    $0x10,%esp
c0105cbc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105cbf:	c9                   	leave  
c0105cc0:	c3                   	ret    

c0105cc1 <ptr_pde>:
c0105cc1:	55                   	push   %ebp
c0105cc2:	89 e5                	mov    %esp,%ebp
c0105cc4:	8b 45 08             	mov    0x8(%ebp),%eax
c0105cc7:	c1 e8 16             	shr    $0x16,%eax
c0105cca:	05 00 fc ff 3f       	add    $0x3ffffc00,%eax
c0105ccf:	c1 e0 02             	shl    $0x2,%eax
c0105cd2:	5d                   	pop    %ebp
c0105cd3:	c3                   	ret    

c0105cd4 <ptr_pte>:
c0105cd4:	55                   	push   %ebp
c0105cd5:	89 e5                	mov    %esp,%ebp
c0105cd7:	8b 45 08             	mov    0x8(%ebp),%eax
c0105cda:	c1 e8 0a             	shr    $0xa,%eax
c0105cdd:	25 00 f0 3f 00       	and    $0x3ff000,%eax
c0105ce2:	89 c2                	mov    %eax,%edx
c0105ce4:	8b 45 08             	mov    0x8(%ebp),%eax
c0105ce7:	c1 e8 0c             	shr    $0xc,%eax
c0105cea:	25 ff 03 00 00       	and    $0x3ff,%eax
c0105cef:	c1 e0 02             	shl    $0x2,%eax
c0105cf2:	01 d0                	add    %edx,%eax
c0105cf4:	2d 00 00 40 00       	sub    $0x400000,%eax
c0105cf9:	5d                   	pop    %ebp
c0105cfa:	c3                   	ret    

c0105cfb <add_map_entry>:
c0105cfb:	55                   	push   %ebp
c0105cfc:	89 e5                	mov    %esp,%ebp
c0105cfe:	83 ec 18             	sub    $0x18,%esp
c0105d01:	ff 75 08             	pushl  0x8(%ebp)
c0105d04:	e8 b8 ff ff ff       	call   c0105cc1 <ptr_pde>
c0105d09:	83 c4 04             	add    $0x4,%esp
c0105d0c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105d0f:	ff 75 08             	pushl  0x8(%ebp)
c0105d12:	e8 bd ff ff ff       	call   c0105cd4 <ptr_pte>
c0105d17:	83 c4 04             	add    $0x4,%esp
c0105d1a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105d1d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105d20:	8b 00                	mov    (%eax),%eax
c0105d22:	83 e0 01             	and    $0x1,%eax
c0105d25:	85 c0                	test   %eax,%eax
c0105d27:	74 1b                	je     c0105d44 <add_map_entry+0x49>
c0105d29:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105d2c:	8b 00                	mov    (%eax),%eax
c0105d2e:	83 e0 01             	and    $0x1,%eax
c0105d31:	85 c0                	test   %eax,%eax
c0105d33:	75 54                	jne    c0105d89 <add_map_entry+0x8e>
c0105d35:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105d38:	83 c8 07             	or     $0x7,%eax
c0105d3b:	89 c2                	mov    %eax,%edx
c0105d3d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105d40:	89 10                	mov    %edx,(%eax)
c0105d42:	eb 45                	jmp    c0105d89 <add_map_entry+0x8e>
c0105d44:	83 ec 0c             	sub    $0xc,%esp
c0105d47:	6a 00                	push   $0x0
c0105d49:	e8 95 fd ff ff       	call   c0105ae3 <get_a_page>
c0105d4e:	83 c4 10             	add    $0x10,%esp
c0105d51:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105d54:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105d57:	83 c8 07             	or     $0x7,%eax
c0105d5a:	89 c2                	mov    %eax,%edx
c0105d5c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105d5f:	89 10                	mov    %edx,(%eax)
c0105d61:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105d64:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105d69:	83 ec 04             	sub    $0x4,%esp
c0105d6c:	68 00 10 00 00       	push   $0x1000
c0105d71:	6a 00                	push   $0x0
c0105d73:	50                   	push   %eax
c0105d74:	e8 f2 54 00 00       	call   c010b26b <Memset>
c0105d79:	83 c4 10             	add    $0x10,%esp
c0105d7c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105d7f:	83 c8 07             	or     $0x7,%eax
c0105d82:	89 c2                	mov    %eax,%edx
c0105d84:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105d87:	89 10                	mov    %edx,(%eax)
c0105d89:	90                   	nop
c0105d8a:	c9                   	leave  
c0105d8b:	c3                   	ret    

c0105d8c <alloc_virtual_memory>:
c0105d8c:	55                   	push   %ebp
c0105d8d:	89 e5                	mov    %esp,%ebp
c0105d8f:	83 ec 28             	sub    $0x28,%esp
c0105d92:	8b 45 08             	mov    0x8(%ebp),%eax
c0105d95:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105d9a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105d9d:	8b 45 08             	mov    0x8(%ebp),%eax
c0105da0:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0105da3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105da6:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105da9:	01 45 e4             	add    %eax,-0x1c(%ebp)
c0105dac:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105daf:	05 ff 0f 00 00       	add    $0xfff,%eax
c0105db4:	c1 e8 0c             	shr    $0xc,%eax
c0105db7:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105dba:	e8 e4 a5 ff ff       	call   c01003a3 <get_running_thread_pcb>
c0105dbf:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105dc2:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105dc5:	8b 50 08             	mov    0x8(%eax),%edx
c0105dc8:	a1 28 0f 11 c0       	mov    0xc0110f28,%eax
c0105dcd:	39 c2                	cmp    %eax,%edx
c0105dcf:	75 09                	jne    c0105dda <alloc_virtual_memory+0x4e>
c0105dd1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0105dd8:	eb 07                	jmp    c0105de1 <alloc_virtual_memory+0x55>
c0105dda:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0105de1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0105de8:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0105def:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0105df6:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0105dfd:	eb 47                	jmp    c0105e46 <alloc_virtual_memory+0xba>
c0105dff:	83 ec 08             	sub    $0x8,%esp
c0105e02:	ff 75 f0             	pushl  -0x10(%ebp)
c0105e05:	6a 01                	push   $0x1
c0105e07:	e8 25 fe ff ff       	call   c0105c31 <get_virtual_address>
c0105e0c:	83 c4 10             	add    $0x10,%esp
c0105e0f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105e12:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0105e16:	74 13                	je     c0105e2b <alloc_virtual_memory+0x9f>
c0105e18:	83 ec 0c             	sub    $0xc,%esp
c0105e1b:	ff 75 f0             	pushl  -0x10(%ebp)
c0105e1e:	e8 c0 fc ff ff       	call   c0105ae3 <get_a_page>
c0105e23:	83 c4 10             	add    $0x10,%esp
c0105e26:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105e29:	eb 06                	jmp    c0105e31 <alloc_virtual_memory+0xa5>
c0105e2b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0105e2e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105e31:	83 ec 08             	sub    $0x8,%esp
c0105e34:	ff 75 f4             	pushl  -0xc(%ebp)
c0105e37:	ff 75 d8             	pushl  -0x28(%ebp)
c0105e3a:	e8 bc fe ff ff       	call   c0105cfb <add_map_entry>
c0105e3f:	83 c4 10             	add    $0x10,%esp
c0105e42:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0105e46:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105e49:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c0105e4c:	72 b1                	jb     c0105dff <alloc_virtual_memory+0x73>
c0105e4e:	8b 45 08             	mov    0x8(%ebp),%eax
c0105e51:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105e56:	89 c2                	mov    %eax,%edx
c0105e58:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105e5b:	01 d0                	add    %edx,%eax
c0105e5d:	c9                   	leave  
c0105e5e:	c3                   	ret    

c0105e5f <get_physical_address_proc>:
c0105e5f:	55                   	push   %ebp
c0105e60:	89 e5                	mov    %esp,%ebp
c0105e62:	83 ec 18             	sub    $0x18,%esp
c0105e65:	e8 5d a4 ff ff       	call   c01002c7 <disable_int>
c0105e6a:	e8 34 a5 ff ff       	call   c01003a3 <get_running_thread_pcb>
c0105e6f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105e72:	83 ec 0c             	sub    $0xc,%esp
c0105e75:	ff 75 0c             	pushl  0xc(%ebp)
c0105e78:	e8 d9 d8 ff ff       	call   c0103756 <pid2proc>
c0105e7d:	83 c4 10             	add    $0x10,%esp
c0105e80:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105e83:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105e86:	8b 40 08             	mov    0x8(%eax),%eax
c0105e89:	83 ec 0c             	sub    $0xc,%esp
c0105e8c:	50                   	push   %eax
c0105e8d:	e8 f5 a4 ff ff       	call   c0100387 <update_cr3>
c0105e92:	83 c4 10             	add    $0x10,%esp
c0105e95:	83 ec 0c             	sub    $0xc,%esp
c0105e98:	ff 75 08             	pushl  0x8(%ebp)
c0105e9b:	e8 34 fe ff ff       	call   c0105cd4 <ptr_pte>
c0105ea0:	83 c4 10             	add    $0x10,%esp
c0105ea3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105ea6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105ea9:	8b 00                	mov    (%eax),%eax
c0105eab:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105eb0:	89 c2                	mov    %eax,%edx
c0105eb2:	8b 45 08             	mov    0x8(%ebp),%eax
c0105eb5:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105eba:	09 d0                	or     %edx,%eax
c0105ebc:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105ebf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105ec2:	8b 40 08             	mov    0x8(%eax),%eax
c0105ec5:	83 ec 0c             	sub    $0xc,%esp
c0105ec8:	50                   	push   %eax
c0105ec9:	e8 b9 a4 ff ff       	call   c0100387 <update_cr3>
c0105ece:	83 c4 10             	add    $0x10,%esp
c0105ed1:	e8 f3 a3 ff ff       	call   c01002c9 <enable_int>
c0105ed6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105ed9:	c9                   	leave  
c0105eda:	c3                   	ret    

c0105edb <get_physical_address>:
c0105edb:	55                   	push   %ebp
c0105edc:	89 e5                	mov    %esp,%ebp
c0105ede:	83 ec 10             	sub    $0x10,%esp
c0105ee1:	ff 75 08             	pushl  0x8(%ebp)
c0105ee4:	e8 eb fd ff ff       	call   c0105cd4 <ptr_pte>
c0105ee9:	83 c4 04             	add    $0x4,%esp
c0105eec:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105eef:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105ef2:	8b 00                	mov    (%eax),%eax
c0105ef4:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105ef9:	89 c2                	mov    %eax,%edx
c0105efb:	8b 45 08             	mov    0x8(%ebp),%eax
c0105efe:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105f03:	09 d0                	or     %edx,%eax
c0105f05:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105f08:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105f0b:	c9                   	leave  
c0105f0c:	c3                   	ret    

c0105f0d <alloc_physical_memory_of_proc>:
c0105f0d:	55                   	push   %ebp
c0105f0e:	89 e5                	mov    %esp,%ebp
c0105f10:	83 ec 48             	sub    $0x48,%esp
c0105f13:	e8 af a3 ff ff       	call   c01002c7 <disable_int>
c0105f18:	8b 45 08             	mov    0x8(%ebp),%eax
c0105f1b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105f20:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105f23:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0105f2a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105f2d:	83 ec 0c             	sub    $0xc,%esp
c0105f30:	50                   	push   %eax
c0105f31:	e8 20 d8 ff ff       	call   c0103756 <pid2proc>
c0105f36:	83 c4 10             	add    $0x10,%esp
c0105f39:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105f3c:	e8 62 a4 ff ff       	call   c01003a3 <get_running_thread_pcb>
c0105f41:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105f44:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105f47:	8b 40 0c             	mov    0xc(%eax),%eax
c0105f4a:	83 ec 04             	sub    $0x4,%esp
c0105f4d:	6a 0c                	push   $0xc
c0105f4f:	50                   	push   %eax
c0105f50:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0105f53:	50                   	push   %eax
c0105f54:	e8 a0 0c 00 00       	call   c0106bf9 <Memcpy>
c0105f59:	83 c4 10             	add    $0x10,%esp
c0105f5c:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0105f5f:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0105f62:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0105f65:	89 55 c8             	mov    %edx,-0x38(%ebp)
c0105f68:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0105f6b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0105f6e:	29 c2                	sub    %eax,%edx
c0105f70:	89 d0                	mov    %edx,%eax
c0105f72:	c1 e8 0c             	shr    $0xc,%eax
c0105f75:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105f78:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0105f7b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0105f7e:	c1 e2 0c             	shl    $0xc,%edx
c0105f81:	01 d0                	add    %edx,%eax
c0105f83:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105f86:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105f89:	6a 01                	push   $0x1
c0105f8b:	6a 01                	push   $0x1
c0105f8d:	50                   	push   %eax
c0105f8e:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0105f91:	50                   	push   %eax
c0105f92:	e8 06 fa ff ff       	call   c010599d <set_bits>
c0105f97:	83 c4 10             	add    $0x10,%esp
c0105f9a:	83 ec 0c             	sub    $0xc,%esp
c0105f9d:	ff 75 f0             	pushl  -0x10(%ebp)
c0105fa0:	e8 3e fb ff ff       	call   c0105ae3 <get_a_page>
c0105fa5:	83 c4 10             	add    $0x10,%esp
c0105fa8:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105fab:	8b 45 08             	mov    0x8(%ebp),%eax
c0105fae:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105fb3:	89 c2                	mov    %eax,%edx
c0105fb5:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105fb8:	01 d0                	add    %edx,%eax
c0105fba:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105fbd:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105fc0:	8b 40 08             	mov    0x8(%eax),%eax
c0105fc3:	83 ec 0c             	sub    $0xc,%esp
c0105fc6:	50                   	push   %eax
c0105fc7:	e8 bb a3 ff ff       	call   c0100387 <update_cr3>
c0105fcc:	83 c4 10             	add    $0x10,%esp
c0105fcf:	83 ec 08             	sub    $0x8,%esp
c0105fd2:	ff 75 dc             	pushl  -0x24(%ebp)
c0105fd5:	ff 75 f4             	pushl  -0xc(%ebp)
c0105fd8:	e8 1e fd ff ff       	call   c0105cfb <add_map_entry>
c0105fdd:	83 c4 10             	add    $0x10,%esp
c0105fe0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105fe3:	8b 40 08             	mov    0x8(%eax),%eax
c0105fe6:	83 ec 0c             	sub    $0xc,%esp
c0105fe9:	50                   	push   %eax
c0105fea:	e8 98 a3 ff ff       	call   c0100387 <update_cr3>
c0105fef:	83 c4 10             	add    $0x10,%esp
c0105ff2:	e8 d2 a2 ff ff       	call   c01002c9 <enable_int>
c0105ff7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0105ffa:	c9                   	leave  
c0105ffb:	c3                   	ret    

c0105ffc <alloc_physical_memory>:
c0105ffc:	55                   	push   %ebp
c0105ffd:	89 e5                	mov    %esp,%ebp
c0105fff:	83 ec 38             	sub    $0x38,%esp
c0106002:	8b 45 08             	mov    0x8(%ebp),%eax
c0106005:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010600a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010600d:	e8 91 a3 ff ff       	call   c01003a3 <get_running_thread_pcb>
c0106012:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0106015:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0106019:	75 1a                	jne    c0106035 <alloc_physical_memory+0x39>
c010601b:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0106020:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106023:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0106028:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010602b:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c0106030:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0106033:	eb 18                	jmp    c010604d <alloc_physical_memory+0x51>
c0106035:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106038:	8b 40 0c             	mov    0xc(%eax),%eax
c010603b:	83 ec 04             	sub    $0x4,%esp
c010603e:	6a 0c                	push   $0xc
c0106040:	50                   	push   %eax
c0106041:	8d 45 d4             	lea    -0x2c(%ebp),%eax
c0106044:	50                   	push   %eax
c0106045:	e8 af 0b 00 00       	call   c0106bf9 <Memcpy>
c010604a:	83 c4 10             	add    $0x10,%esp
c010604d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106050:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0106053:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0106056:	89 55 d0             	mov    %edx,-0x30(%ebp)
c0106059:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010605c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010605f:	29 c2                	sub    %eax,%edx
c0106061:	89 d0                	mov    %edx,%eax
c0106063:	c1 e8 0c             	shr    $0xc,%eax
c0106066:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106069:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010606c:	8b 55 ec             	mov    -0x14(%ebp),%edx
c010606f:	c1 e2 0c             	shl    $0xc,%edx
c0106072:	01 d0                	add    %edx,%eax
c0106074:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106077:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010607a:	6a 01                	push   $0x1
c010607c:	6a 01                	push   $0x1
c010607e:	50                   	push   %eax
c010607f:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0106082:	50                   	push   %eax
c0106083:	e8 15 f9 ff ff       	call   c010599d <set_bits>
c0106088:	83 c4 10             	add    $0x10,%esp
c010608b:	83 ec 0c             	sub    $0xc,%esp
c010608e:	ff 75 0c             	pushl  0xc(%ebp)
c0106091:	e8 4d fa ff ff       	call   c0105ae3 <get_a_page>
c0106096:	83 c4 10             	add    $0x10,%esp
c0106099:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010609c:	8b 45 08             	mov    0x8(%ebp),%eax
c010609f:	25 ff 0f 00 00       	and    $0xfff,%eax
c01060a4:	89 c2                	mov    %eax,%edx
c01060a6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01060a9:	01 d0                	add    %edx,%eax
c01060ab:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01060ae:	83 ec 08             	sub    $0x8,%esp
c01060b1:	ff 75 e4             	pushl  -0x1c(%ebp)
c01060b4:	ff 75 f4             	pushl  -0xc(%ebp)
c01060b7:	e8 3f fc ff ff       	call   c0105cfb <add_map_entry>
c01060bc:	83 c4 10             	add    $0x10,%esp
c01060bf:	8b 45 08             	mov    0x8(%ebp),%eax
c01060c2:	c9                   	leave  
c01060c3:	c3                   	ret    

c01060c4 <alloc_memory>:
c01060c4:	55                   	push   %ebp
c01060c5:	89 e5                	mov    %esp,%ebp
c01060c7:	83 ec 18             	sub    $0x18,%esp
c01060ca:	83 ec 08             	sub    $0x8,%esp
c01060cd:	ff 75 0c             	pushl  0xc(%ebp)
c01060d0:	ff 75 08             	pushl  0x8(%ebp)
c01060d3:	e8 59 fb ff ff       	call   c0105c31 <get_virtual_address>
c01060d8:	83 c4 10             	add    $0x10,%esp
c01060db:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01060de:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01060e1:	2d 00 10 00 00       	sub    $0x1000,%eax
c01060e6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01060e9:	eb 29                	jmp    c0106114 <alloc_memory+0x50>
c01060eb:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c01060f2:	83 ec 0c             	sub    $0xc,%esp
c01060f5:	ff 75 0c             	pushl  0xc(%ebp)
c01060f8:	e8 e6 f9 ff ff       	call   c0105ae3 <get_a_page>
c01060fd:	83 c4 10             	add    $0x10,%esp
c0106100:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106103:	83 ec 08             	sub    $0x8,%esp
c0106106:	ff 75 ec             	pushl  -0x14(%ebp)
c0106109:	ff 75 f4             	pushl  -0xc(%ebp)
c010610c:	e8 ea fb ff ff       	call   c0105cfb <add_map_entry>
c0106111:	83 c4 10             	add    $0x10,%esp
c0106114:	8b 45 08             	mov    0x8(%ebp),%eax
c0106117:	8d 50 ff             	lea    -0x1(%eax),%edx
c010611a:	89 55 08             	mov    %edx,0x8(%ebp)
c010611d:	85 c0                	test   %eax,%eax
c010611f:	75 ca                	jne    c01060eb <alloc_memory+0x27>
c0106121:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106124:	c9                   	leave  
c0106125:	c3                   	ret    

c0106126 <get_a_virtual_page>:
c0106126:	55                   	push   %ebp
c0106127:	89 e5                	mov    %esp,%ebp
c0106129:	83 ec 18             	sub    $0x18,%esp
c010612c:	83 ec 0c             	sub    $0xc,%esp
c010612f:	ff 75 08             	pushl  0x8(%ebp)
c0106132:	e8 ac f9 ff ff       	call   c0105ae3 <get_a_page>
c0106137:	83 c4 10             	add    $0x10,%esp
c010613a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010613d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106140:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0106145:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0106148:	83 ec 08             	sub    $0x8,%esp
c010614b:	ff 75 f4             	pushl  -0xc(%ebp)
c010614e:	ff 75 f0             	pushl  -0x10(%ebp)
c0106151:	e8 a5 fb ff ff       	call   c0105cfb <add_map_entry>
c0106156:	83 c4 10             	add    $0x10,%esp
c0106159:	8b 45 0c             	mov    0xc(%ebp),%eax
c010615c:	c9                   	leave  
c010615d:	c3                   	ret    

c010615e <block2arena>:
c010615e:	55                   	push   %ebp
c010615f:	89 e5                	mov    %esp,%ebp
c0106161:	83 ec 10             	sub    $0x10,%esp
c0106164:	8b 45 08             	mov    0x8(%ebp),%eax
c0106167:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010616c:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010616f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106172:	c9                   	leave  
c0106173:	c3                   	ret    

c0106174 <sys_malloc2>:
c0106174:	55                   	push   %ebp
c0106175:	89 e5                	mov    %esp,%ebp
c0106177:	83 ec 68             	sub    $0x68,%esp
c010617a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106181:	e8 1d a2 ff ff       	call   c01003a3 <get_running_thread_pcb>
c0106186:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0106189:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010618c:	8b 50 08             	mov    0x8(%eax),%edx
c010618f:	a1 28 0f 11 c0       	mov    0xc0110f28,%eax
c0106194:	39 c2                	cmp    %eax,%edx
c0106196:	75 10                	jne    c01061a8 <sys_malloc2+0x34>
c0106198:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c010619f:	c7 45 ec e0 37 18 c0 	movl   $0xc01837e0,-0x14(%ebp)
c01061a6:	eb 10                	jmp    c01061b8 <sys_malloc2+0x44>
c01061a8:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c01061af:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01061b2:	83 c0 10             	add    $0x10,%eax
c01061b5:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01061b8:	81 7d 08 00 04 00 00 	cmpl   $0x400,0x8(%ebp)
c01061bf:	76 52                	jbe    c0106213 <sys_malloc2+0x9f>
c01061c1:	8b 45 08             	mov    0x8(%ebp),%eax
c01061c4:	05 0b 10 00 00       	add    $0x100b,%eax
c01061c9:	c1 e8 0c             	shr    $0xc,%eax
c01061cc:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01061cf:	83 ec 08             	sub    $0x8,%esp
c01061d2:	ff 75 f0             	pushl  -0x10(%ebp)
c01061d5:	ff 75 d8             	pushl  -0x28(%ebp)
c01061d8:	e8 e7 fe ff ff       	call   c01060c4 <alloc_memory>
c01061dd:	83 c4 10             	add    $0x10,%esp
c01061e0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01061e3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01061e6:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01061e9:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01061ec:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c01061f2:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01061f5:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c01061fc:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01061ff:	c6 40 08 01          	movb   $0x1,0x8(%eax)
c0106203:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106206:	05 90 00 00 00       	add    $0x90,%eax
c010620b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010620e:	e9 f0 01 00 00       	jmp    c0106403 <sys_malloc2+0x28f>
c0106213:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010621a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0106221:	eb 26                	jmp    c0106249 <sys_malloc2+0xd5>
c0106223:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0106226:	89 d0                	mov    %edx,%eax
c0106228:	01 c0                	add    %eax,%eax
c010622a:	01 d0                	add    %edx,%eax
c010622c:	c1 e0 03             	shl    $0x3,%eax
c010622f:	89 c2                	mov    %eax,%edx
c0106231:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106234:	01 d0                	add    %edx,%eax
c0106236:	8b 00                	mov    (%eax),%eax
c0106238:	39 45 08             	cmp    %eax,0x8(%ebp)
c010623b:	77 08                	ja     c0106245 <sys_malloc2+0xd1>
c010623d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106240:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106243:	eb 0a                	jmp    c010624f <sys_malloc2+0xdb>
c0106245:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0106249:	83 7d e4 09          	cmpl   $0x9,-0x1c(%ebp)
c010624d:	7e d4                	jle    c0106223 <sys_malloc2+0xaf>
c010624f:	83 ec 08             	sub    $0x8,%esp
c0106252:	ff 75 f0             	pushl  -0x10(%ebp)
c0106255:	6a 01                	push   $0x1
c0106257:	e8 68 fe ff ff       	call   c01060c4 <alloc_memory>
c010625c:	83 c4 10             	add    $0x10,%esp
c010625f:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0106262:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0106265:	89 d0                	mov    %edx,%eax
c0106267:	01 c0                	add    %eax,%eax
c0106269:	01 d0                	add    %edx,%eax
c010626b:	c1 e0 03             	shl    $0x3,%eax
c010626e:	89 c2                	mov    %eax,%edx
c0106270:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106273:	01 d0                	add    %edx,%eax
c0106275:	83 ec 04             	sub    $0x4,%esp
c0106278:	6a 18                	push   $0x18
c010627a:	50                   	push   %eax
c010627b:	ff 75 cc             	pushl  -0x34(%ebp)
c010627e:	e8 76 09 00 00       	call   c0106bf9 <Memcpy>
c0106283:	83 c4 10             	add    $0x10,%esp
c0106286:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c010628d:	e8 03 09 00 00       	call   c0106b95 <intr_disable>
c0106292:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0106295:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0106298:	89 d0                	mov    %edx,%eax
c010629a:	01 c0                	add    %eax,%eax
c010629c:	01 d0                	add    %edx,%eax
c010629e:	c1 e0 03             	shl    $0x3,%eax
c01062a1:	89 c2                	mov    %eax,%edx
c01062a3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01062a6:	01 d0                	add    %edx,%eax
c01062a8:	83 c0 08             	add    $0x8,%eax
c01062ab:	83 ec 0c             	sub    $0xc,%esp
c01062ae:	50                   	push   %eax
c01062af:	e8 2f 3b 00 00       	call   c0109de3 <isListEmpty>
c01062b4:	83 c4 10             	add    $0x10,%esp
c01062b7:	3c 01                	cmp    $0x1,%al
c01062b9:	0f 85 c1 00 00 00    	jne    c0106380 <sys_malloc2+0x20c>
c01062bf:	c7 45 c8 01 00 00 00 	movl   $0x1,-0x38(%ebp)
c01062c6:	83 ec 08             	sub    $0x8,%esp
c01062c9:	ff 75 f0             	pushl  -0x10(%ebp)
c01062cc:	6a 01                	push   $0x1
c01062ce:	e8 f1 fd ff ff       	call   c01060c4 <alloc_memory>
c01062d3:	83 c4 10             	add    $0x10,%esp
c01062d6:	89 45 c0             	mov    %eax,-0x40(%ebp)
c01062d9:	8b 45 c0             	mov    -0x40(%ebp),%eax
c01062dc:	83 ec 0c             	sub    $0xc,%esp
c01062df:	50                   	push   %eax
c01062e0:	e8 79 fe ff ff       	call   c010615e <block2arena>
c01062e5:	83 c4 10             	add    $0x10,%esp
c01062e8:	89 45 bc             	mov    %eax,-0x44(%ebp)
c01062eb:	8b 55 e8             	mov    -0x18(%ebp),%edx
c01062ee:	89 d0                	mov    %edx,%eax
c01062f0:	01 c0                	add    %eax,%eax
c01062f2:	01 d0                	add    %edx,%eax
c01062f4:	c1 e0 03             	shl    $0x3,%eax
c01062f7:	89 c2                	mov    %eax,%edx
c01062f9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01062fc:	01 d0                	add    %edx,%eax
c01062fe:	8b 50 04             	mov    0x4(%eax),%edx
c0106301:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0106304:	89 50 04             	mov    %edx,0x4(%eax)
c0106307:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010630a:	8b 00                	mov    (%eax),%eax
c010630c:	89 45 b8             	mov    %eax,-0x48(%ebp)
c010630f:	c7 45 b4 0c 00 00 00 	movl   $0xc,-0x4c(%ebp)
c0106316:	b8 00 10 00 00       	mov    $0x1000,%eax
c010631b:	2b 45 b4             	sub    -0x4c(%ebp),%eax
c010631e:	ba 00 00 00 00       	mov    $0x0,%edx
c0106323:	f7 75 b8             	divl   -0x48(%ebp)
c0106326:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0106329:	8b 55 c0             	mov    -0x40(%ebp),%edx
c010632c:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c010632f:	01 d0                	add    %edx,%eax
c0106331:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0106334:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c010633b:	eb 3b                	jmp    c0106378 <sys_malloc2+0x204>
c010633d:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0106340:	0f af 45 b8          	imul   -0x48(%ebp),%eax
c0106344:	89 c2                	mov    %eax,%edx
c0106346:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0106349:	01 d0                	add    %edx,%eax
c010634b:	89 45 a8             	mov    %eax,-0x58(%ebp)
c010634e:	8b 4d a8             	mov    -0x58(%ebp),%ecx
c0106351:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0106354:	89 d0                	mov    %edx,%eax
c0106356:	01 c0                	add    %eax,%eax
c0106358:	01 d0                	add    %edx,%eax
c010635a:	c1 e0 03             	shl    $0x3,%eax
c010635d:	89 c2                	mov    %eax,%edx
c010635f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106362:	01 d0                	add    %edx,%eax
c0106364:	83 c0 08             	add    $0x8,%eax
c0106367:	83 ec 08             	sub    $0x8,%esp
c010636a:	51                   	push   %ecx
c010636b:	50                   	push   %eax
c010636c:	e8 6f 3b 00 00       	call   c0109ee0 <appendToDoubleLinkList>
c0106371:	83 c4 10             	add    $0x10,%esp
c0106374:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0106378:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010637b:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c010637e:	77 bd                	ja     c010633d <sys_malloc2+0x1c9>
c0106380:	83 ec 0c             	sub    $0xc,%esp
c0106383:	ff 75 c4             	pushl  -0x3c(%ebp)
c0106386:	e8 33 08 00 00       	call   c0106bbe <intr_set_status>
c010638b:	83 c4 10             	add    $0x10,%esp
c010638e:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0106391:	89 d0                	mov    %edx,%eax
c0106393:	01 c0                	add    %eax,%eax
c0106395:	01 d0                	add    %edx,%eax
c0106397:	c1 e0 03             	shl    $0x3,%eax
c010639a:	89 c2                	mov    %eax,%edx
c010639c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010639f:	01 d0                	add    %edx,%eax
c01063a1:	83 c0 08             	add    $0x8,%eax
c01063a4:	83 ec 0c             	sub    $0xc,%esp
c01063a7:	50                   	push   %eax
c01063a8:	e8 9d 3c 00 00       	call   c010a04a <popFromDoubleLinkList>
c01063ad:	83 c4 10             	add    $0x10,%esp
c01063b0:	89 45 a8             	mov    %eax,-0x58(%ebp)
c01063b3:	8b 45 a8             	mov    -0x58(%ebp),%eax
c01063b6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01063b9:	83 7d a8 00          	cmpl   $0x0,-0x58(%ebp)
c01063bd:	75 1c                	jne    c01063db <sys_malloc2+0x267>
c01063bf:	68 ef 01 00 00       	push   $0x1ef
c01063c4:	68 b6 a7 10 c0       	push   $0xc010a7b6
c01063c9:	68 b6 a7 10 c0       	push   $0xc010a7b6
c01063ce:	68 d7 a7 10 c0       	push   $0xc010a7d7
c01063d3:	e8 50 22 00 00       	call   c0108628 <assertion_failure>
c01063d8:	83 c4 10             	add    $0x10,%esp
c01063db:	8b 45 a8             	mov    -0x58(%ebp),%eax
c01063de:	83 ec 0c             	sub    $0xc,%esp
c01063e1:	50                   	push   %eax
c01063e2:	e8 77 fd ff ff       	call   c010615e <block2arena>
c01063e7:	83 c4 10             	add    $0x10,%esp
c01063ea:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c01063ed:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c01063f0:	8b 40 04             	mov    0x4(%eax),%eax
c01063f3:	8d 50 ff             	lea    -0x1(%eax),%edx
c01063f6:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c01063f9:	89 50 04             	mov    %edx,0x4(%eax)
c01063fc:	c7 45 c4 04 00 00 00 	movl   $0x4,-0x3c(%ebp)
c0106403:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0106407:	75 1c                	jne    c0106425 <sys_malloc2+0x2b1>
c0106409:	68 f6 01 00 00       	push   $0x1f6
c010640e:	68 b6 a7 10 c0       	push   $0xc010a7b6
c0106413:	68 b6 a7 10 c0       	push   $0xc010a7b6
c0106418:	68 e9 a7 10 c0       	push   $0xc010a7e9
c010641d:	e8 06 22 00 00       	call   c0108628 <assertion_failure>
c0106422:	83 c4 10             	add    $0x10,%esp
c0106425:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106428:	c9                   	leave  
c0106429:	c3                   	ret    

c010642a <remove_map_entry>:
c010642a:	55                   	push   %ebp
c010642b:	89 e5                	mov    %esp,%ebp
c010642d:	83 ec 10             	sub    $0x10,%esp
c0106430:	ff 75 08             	pushl  0x8(%ebp)
c0106433:	e8 9c f8 ff ff       	call   c0105cd4 <ptr_pte>
c0106438:	83 c4 04             	add    $0x4,%esp
c010643b:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010643e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106441:	8b 10                	mov    (%eax),%edx
c0106443:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106446:	89 10                	mov    %edx,(%eax)
c0106448:	90                   	nop
c0106449:	c9                   	leave  
c010644a:	c3                   	ret    

c010644b <free_a_page>:
c010644b:	55                   	push   %ebp
c010644c:	89 e5                	mov    %esp,%ebp
c010644e:	83 ec 20             	sub    $0x20,%esp
c0106451:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0106455:	75 21                	jne    c0106478 <free_a_page+0x2d>
c0106457:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c010645c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010645f:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0106464:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106467:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c010646c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010646f:	c7 45 fc ac 06 11 c0 	movl   $0xc01106ac,-0x4(%ebp)
c0106476:	eb 1f                	jmp    c0106497 <free_a_page+0x4c>
c0106478:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c010647d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106480:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0106485:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106488:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c010648d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106490:	c7 45 fc f4 0e 11 c0 	movl   $0xc0110ef4,-0x4(%ebp)
c0106497:	8b 45 08             	mov    0x8(%ebp),%eax
c010649a:	c1 e8 0c             	shr    $0xc,%eax
c010649d:	89 45 f8             	mov    %eax,-0x8(%ebp)
c01064a0:	6a 00                	push   $0x0
c01064a2:	ff 75 f8             	pushl  -0x8(%ebp)
c01064a5:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c01064a8:	50                   	push   %eax
c01064a9:	e8 74 f4 ff ff       	call   c0105922 <set_bit_val>
c01064ae:	83 c4 0c             	add    $0xc,%esp
c01064b1:	ff 75 08             	pushl  0x8(%ebp)
c01064b4:	e8 22 fa ff ff       	call   c0105edb <get_physical_address>
c01064b9:	83 c4 04             	add    $0x4,%esp
c01064bc:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01064bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01064c2:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c01064c8:	85 c0                	test   %eax,%eax
c01064ca:	0f 48 c2             	cmovs  %edx,%eax
c01064cd:	c1 f8 0c             	sar    $0xc,%eax
c01064d0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01064d3:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01064d6:	6a 00                	push   $0x0
c01064d8:	ff 75 f0             	pushl  -0x10(%ebp)
c01064db:	50                   	push   %eax
c01064dc:	e8 41 f4 ff ff       	call   c0105922 <set_bit_val>
c01064e1:	83 c4 0c             	add    $0xc,%esp
c01064e4:	ff 75 08             	pushl  0x8(%ebp)
c01064e7:	e8 3e ff ff ff       	call   c010642a <remove_map_entry>
c01064ec:	83 c4 04             	add    $0x4,%esp
c01064ef:	90                   	nop
c01064f0:	c9                   	leave  
c01064f1:	c3                   	ret    

c01064f2 <sys_free2>:
c01064f2:	55                   	push   %ebp
c01064f3:	89 e5                	mov    %esp,%ebp
c01064f5:	83 ec 58             	sub    $0x58,%esp
c01064f8:	e8 a6 9e ff ff       	call   c01003a3 <get_running_thread_pcb>
c01064fd:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0106500:	e8 90 06 00 00       	call   c0106b95 <intr_disable>
c0106505:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0106508:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010650b:	8b 50 08             	mov    0x8(%eax),%edx
c010650e:	a1 28 0f 11 c0       	mov    0xc0110f28,%eax
c0106513:	39 c2                	cmp    %eax,%edx
c0106515:	75 10                	jne    c0106527 <sys_free2+0x35>
c0106517:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010651e:	c7 45 f0 e0 37 18 c0 	movl   $0xc01837e0,-0x10(%ebp)
c0106525:	eb 10                	jmp    c0106537 <sys_free2+0x45>
c0106527:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c010652e:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106531:	83 c0 10             	add    $0x10,%eax
c0106534:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0106537:	81 7d 0c 00 04 00 00 	cmpl   $0x400,0xc(%ebp)
c010653e:	76 4d                	jbe    c010658d <sys_free2+0x9b>
c0106540:	8b 45 08             	mov    0x8(%ebp),%eax
c0106543:	83 e8 0c             	sub    $0xc,%eax
c0106546:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106549:	83 45 0c 0c          	addl   $0xc,0xc(%ebp)
c010654d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106550:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106555:	c1 e8 0c             	shr    $0xc,%eax
c0106558:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010655b:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0106562:	eb 1c                	jmp    c0106580 <sys_free2+0x8e>
c0106564:	83 ec 08             	sub    $0x8,%esp
c0106567:	ff 75 f4             	pushl  -0xc(%ebp)
c010656a:	ff 75 ec             	pushl  -0x14(%ebp)
c010656d:	e8 d9 fe ff ff       	call   c010644b <free_a_page>
c0106572:	83 c4 10             	add    $0x10,%esp
c0106575:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
c010657c:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0106580:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106583:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
c0106586:	77 dc                	ja     c0106564 <sys_free2+0x72>
c0106588:	e9 dc 00 00 00       	jmp    c0106669 <sys_free2+0x177>
c010658d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0106594:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c010659b:	eb 26                	jmp    c01065c3 <sys_free2+0xd1>
c010659d:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01065a0:	89 d0                	mov    %edx,%eax
c01065a2:	01 c0                	add    %eax,%eax
c01065a4:	01 d0                	add    %edx,%eax
c01065a6:	c1 e0 03             	shl    $0x3,%eax
c01065a9:	89 c2                	mov    %eax,%edx
c01065ab:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01065ae:	01 d0                	add    %edx,%eax
c01065b0:	8b 00                	mov    (%eax),%eax
c01065b2:	39 45 0c             	cmp    %eax,0xc(%ebp)
c01065b5:	77 08                	ja     c01065bf <sys_free2+0xcd>
c01065b7:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01065ba:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01065bd:	eb 0a                	jmp    c01065c9 <sys_free2+0xd7>
c01065bf:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c01065c3:	83 7d e0 09          	cmpl   $0x9,-0x20(%ebp)
c01065c7:	7e d4                	jle    c010659d <sys_free2+0xab>
c01065c9:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01065cc:	89 d0                	mov    %edx,%eax
c01065ce:	01 c0                	add    %eax,%eax
c01065d0:	01 d0                	add    %edx,%eax
c01065d2:	c1 e0 03             	shl    $0x3,%eax
c01065d5:	89 c2                	mov    %eax,%edx
c01065d7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01065da:	01 d0                	add    %edx,%eax
c01065dc:	8b 10                	mov    (%eax),%edx
c01065de:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c01065e1:	8b 50 04             	mov    0x4(%eax),%edx
c01065e4:	89 55 b8             	mov    %edx,-0x48(%ebp)
c01065e7:	8b 50 08             	mov    0x8(%eax),%edx
c01065ea:	89 55 bc             	mov    %edx,-0x44(%ebp)
c01065ed:	8b 50 0c             	mov    0xc(%eax),%edx
c01065f0:	89 55 c0             	mov    %edx,-0x40(%ebp)
c01065f3:	8b 50 10             	mov    0x10(%eax),%edx
c01065f6:	89 55 c4             	mov    %edx,-0x3c(%ebp)
c01065f9:	8b 40 14             	mov    0x14(%eax),%eax
c01065fc:	89 45 c8             	mov    %eax,-0x38(%ebp)
c01065ff:	8b 45 08             	mov    0x8(%ebp),%eax
c0106602:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0106605:	83 ec 0c             	sub    $0xc,%esp
c0106608:	ff 75 d0             	pushl  -0x30(%ebp)
c010660b:	e8 4e fb ff ff       	call   c010615e <block2arena>
c0106610:	83 c4 10             	add    $0x10,%esp
c0106613:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0106616:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0106619:	89 d0                	mov    %edx,%eax
c010661b:	01 c0                	add    %eax,%eax
c010661d:	01 d0                	add    %edx,%eax
c010661f:	c1 e0 03             	shl    $0x3,%eax
c0106622:	89 c2                	mov    %eax,%edx
c0106624:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106627:	01 d0                	add    %edx,%eax
c0106629:	83 c0 08             	add    $0x8,%eax
c010662c:	83 ec 08             	sub    $0x8,%esp
c010662f:	ff 75 d0             	pushl  -0x30(%ebp)
c0106632:	50                   	push   %eax
c0106633:	e8 a8 38 00 00       	call   c0109ee0 <appendToDoubleLinkList>
c0106638:	83 c4 10             	add    $0x10,%esp
c010663b:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010663e:	8b 40 04             	mov    0x4(%eax),%eax
c0106641:	8d 50 01             	lea    0x1(%eax),%edx
c0106644:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0106647:	89 50 04             	mov    %edx,0x4(%eax)
c010664a:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010664d:	8b 50 04             	mov    0x4(%eax),%edx
c0106650:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0106653:	39 c2                	cmp    %eax,%edx
c0106655:	75 12                	jne    c0106669 <sys_free2+0x177>
c0106657:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010665a:	83 ec 08             	sub    $0x8,%esp
c010665d:	ff 75 f4             	pushl  -0xc(%ebp)
c0106660:	50                   	push   %eax
c0106661:	e8 e5 fd ff ff       	call   c010644b <free_a_page>
c0106666:	83 c4 10             	add    $0x10,%esp
c0106669:	83 ec 0c             	sub    $0xc,%esp
c010666c:	ff 75 d8             	pushl  -0x28(%ebp)
c010666f:	e8 4a 05 00 00       	call   c0106bbe <intr_set_status>
c0106674:	83 c4 10             	add    $0x10,%esp
c0106677:	90                   	nop
c0106678:	c9                   	leave  
c0106679:	c3                   	ret    

c010667a <init_memory_block_desc>:
c010667a:	55                   	push   %ebp
c010667b:	89 e5                	mov    %esp,%ebp
c010667d:	83 ec 18             	sub    $0x18,%esp
c0106680:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106687:	e9 b2 00 00 00       	jmp    c010673e <init_memory_block_desc+0xc4>
c010668c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0106690:	75 1b                	jne    c01066ad <init_memory_block_desc+0x33>
c0106692:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106695:	89 d0                	mov    %edx,%eax
c0106697:	01 c0                	add    %eax,%eax
c0106699:	01 d0                	add    %edx,%eax
c010669b:	c1 e0 03             	shl    $0x3,%eax
c010669e:	89 c2                	mov    %eax,%edx
c01066a0:	8b 45 08             	mov    0x8(%ebp),%eax
c01066a3:	01 d0                	add    %edx,%eax
c01066a5:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c01066ab:	eb 2e                	jmp    c01066db <init_memory_block_desc+0x61>
c01066ad:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01066b0:	89 d0                	mov    %edx,%eax
c01066b2:	01 c0                	add    %eax,%eax
c01066b4:	01 d0                	add    %edx,%eax
c01066b6:	c1 e0 03             	shl    $0x3,%eax
c01066b9:	8d 50 e8             	lea    -0x18(%eax),%edx
c01066bc:	8b 45 08             	mov    0x8(%ebp),%eax
c01066bf:	01 d0                	add    %edx,%eax
c01066c1:	8b 08                	mov    (%eax),%ecx
c01066c3:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01066c6:	89 d0                	mov    %edx,%eax
c01066c8:	01 c0                	add    %eax,%eax
c01066ca:	01 d0                	add    %edx,%eax
c01066cc:	c1 e0 03             	shl    $0x3,%eax
c01066cf:	89 c2                	mov    %eax,%edx
c01066d1:	8b 45 08             	mov    0x8(%ebp),%eax
c01066d4:	01 d0                	add    %edx,%eax
c01066d6:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
c01066d9:	89 10                	mov    %edx,(%eax)
c01066db:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01066de:	89 d0                	mov    %edx,%eax
c01066e0:	01 c0                	add    %eax,%eax
c01066e2:	01 d0                	add    %edx,%eax
c01066e4:	c1 e0 03             	shl    $0x3,%eax
c01066e7:	89 c2                	mov    %eax,%edx
c01066e9:	8b 45 08             	mov    0x8(%ebp),%eax
c01066ec:	01 d0                	add    %edx,%eax
c01066ee:	8b 00                	mov    (%eax),%eax
c01066f0:	89 c1                	mov    %eax,%ecx
c01066f2:	b8 f4 0f 00 00       	mov    $0xff4,%eax
c01066f7:	ba 00 00 00 00       	mov    $0x0,%edx
c01066fc:	f7 f1                	div    %ecx
c01066fe:	89 c1                	mov    %eax,%ecx
c0106700:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106703:	89 d0                	mov    %edx,%eax
c0106705:	01 c0                	add    %eax,%eax
c0106707:	01 d0                	add    %edx,%eax
c0106709:	c1 e0 03             	shl    $0x3,%eax
c010670c:	89 c2                	mov    %eax,%edx
c010670e:	8b 45 08             	mov    0x8(%ebp),%eax
c0106711:	01 d0                	add    %edx,%eax
c0106713:	89 ca                	mov    %ecx,%edx
c0106715:	89 50 04             	mov    %edx,0x4(%eax)
c0106718:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010671b:	89 d0                	mov    %edx,%eax
c010671d:	01 c0                	add    %eax,%eax
c010671f:	01 d0                	add    %edx,%eax
c0106721:	c1 e0 03             	shl    $0x3,%eax
c0106724:	89 c2                	mov    %eax,%edx
c0106726:	8b 45 08             	mov    0x8(%ebp),%eax
c0106729:	01 d0                	add    %edx,%eax
c010672b:	83 c0 08             	add    $0x8,%eax
c010672e:	83 ec 0c             	sub    $0xc,%esp
c0106731:	50                   	push   %eax
c0106732:	e8 7e 36 00 00       	call   c0109db5 <initDoubleLinkList>
c0106737:	83 c4 10             	add    $0x10,%esp
c010673a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c010673e:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c0106742:	0f 8e 44 ff ff ff    	jle    c010668c <init_memory_block_desc+0x12>
c0106748:	90                   	nop
c0106749:	c9                   	leave  
c010674a:	c3                   	ret    

c010674b <init_memory2>:
c010674b:	55                   	push   %ebp
c010674c:	89 e5                	mov    %esp,%ebp
c010674e:	83 ec 38             	sub    $0x38,%esp
c0106751:	c7 45 f4 00 00 00 02 	movl   $0x2000000,-0xc(%ebp)
c0106758:	c7 45 f0 00 20 10 00 	movl   $0x102000,-0x10(%ebp)
c010675f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106762:	a3 b4 06 11 c0       	mov    %eax,0xc01106b4
c0106767:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010676a:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c010676f:	29 c2                	sub    %eax,%edx
c0106771:	89 d0                	mov    %edx,%eax
c0106773:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106776:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106779:	89 c2                	mov    %eax,%edx
c010677b:	c1 ea 1f             	shr    $0x1f,%edx
c010677e:	01 d0                	add    %edx,%eax
c0106780:	d1 f8                	sar    %eax
c0106782:	a3 b8 06 11 c0       	mov    %eax,0xc01106b8
c0106787:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c010678c:	83 ec 0c             	sub    $0xc,%esp
c010678f:	50                   	push   %eax
c0106790:	e8 52 08 00 00       	call   c0106fe7 <disp_int>
c0106795:	83 c4 10             	add    $0x10,%esp
c0106798:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c010679d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01067a0:	29 c2                	sub    %eax,%edx
c01067a2:	89 d0                	mov    %edx,%eax
c01067a4:	a3 00 0f 11 c0       	mov    %eax,0xc0110f00
c01067a9:	83 ec 0c             	sub    $0xc,%esp
c01067ac:	68 f5 a7 10 c0       	push   $0xc010a7f5
c01067b1:	e8 d6 98 ff ff       	call   c010008c <disp_str>
c01067b6:	83 c4 10             	add    $0x10,%esp
c01067b9:	a1 00 0f 11 c0       	mov    0xc0110f00,%eax
c01067be:	83 ec 0c             	sub    $0xc,%esp
c01067c1:	50                   	push   %eax
c01067c2:	e8 20 08 00 00       	call   c0106fe7 <disp_int>
c01067c7:	83 c4 10             	add    $0x10,%esp
c01067ca:	83 ec 0c             	sub    $0xc,%esp
c01067cd:	68 f5 a7 10 c0       	push   $0xc010a7f5
c01067d2:	e8 b5 98 ff ff       	call   c010008c <disp_str>
c01067d7:	83 c4 10             	add    $0x10,%esp
c01067da:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c01067df:	05 ff 0f 00 00       	add    $0xfff,%eax
c01067e4:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c01067ea:	85 c0                	test   %eax,%eax
c01067ec:	0f 48 c2             	cmovs  %edx,%eax
c01067ef:	c1 f8 0c             	sar    $0xc,%eax
c01067f2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01067f5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01067f8:	83 c0 07             	add    $0x7,%eax
c01067fb:	8d 50 07             	lea    0x7(%eax),%edx
c01067fe:	85 c0                	test   %eax,%eax
c0106800:	0f 48 c2             	cmovs  %edx,%eax
c0106803:	c1 f8 03             	sar    $0x3,%eax
c0106806:	a3 b0 06 11 c0       	mov    %eax,0xc01106b0
c010680b:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106810:	2d 00 00 00 40       	sub    $0x40000000,%eax
c0106815:	a3 ac 06 11 c0       	mov    %eax,0xc01106ac
c010681a:	8b 15 b0 06 11 c0    	mov    0xc01106b0,%edx
c0106820:	a1 ac 06 11 c0       	mov    0xc01106ac,%eax
c0106825:	83 ec 04             	sub    $0x4,%esp
c0106828:	52                   	push   %edx
c0106829:	6a 00                	push   $0x0
c010682b:	50                   	push   %eax
c010682c:	e8 3a 4a 00 00       	call   c010b26b <Memset>
c0106831:	83 c4 10             	add    $0x10,%esp
c0106834:	a1 b0 06 11 c0       	mov    0xc01106b0,%eax
c0106839:	05 ff 0f 00 00       	add    $0xfff,%eax
c010683e:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106844:	85 c0                	test   %eax,%eax
c0106846:	0f 48 c2             	cmovs  %edx,%eax
c0106849:	c1 f8 0c             	sar    $0xc,%eax
c010684c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010684f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106852:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106855:	ff 75 e8             	pushl  -0x18(%ebp)
c0106858:	6a 01                	push   $0x1
c010685a:	6a 00                	push   $0x0
c010685c:	68 ac 06 11 c0       	push   $0xc01106ac
c0106861:	e8 37 f1 ff ff       	call   c010599d <set_bits>
c0106866:	83 c4 10             	add    $0x10,%esp
c0106869:	a1 00 0f 11 c0       	mov    0xc0110f00,%eax
c010686e:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106873:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106879:	85 c0                	test   %eax,%eax
c010687b:	0f 48 c2             	cmovs  %edx,%eax
c010687e:	c1 f8 0c             	sar    $0xc,%eax
c0106881:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106884:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106887:	83 c0 07             	add    $0x7,%eax
c010688a:	8d 50 07             	lea    0x7(%eax),%edx
c010688d:	85 c0                	test   %eax,%eax
c010688f:	0f 48 c2             	cmovs  %edx,%eax
c0106892:	c1 f8 03             	sar    $0x3,%eax
c0106895:	a3 f8 0e 11 c0       	mov    %eax,0xc0110ef8
c010689a:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c010689f:	8b 15 b0 06 11 c0    	mov    0xc01106b0,%edx
c01068a5:	01 d0                	add    %edx,%eax
c01068a7:	a3 f4 0e 11 c0       	mov    %eax,0xc0110ef4
c01068ac:	8b 15 f8 0e 11 c0    	mov    0xc0110ef8,%edx
c01068b2:	a1 f4 0e 11 c0       	mov    0xc0110ef4,%eax
c01068b7:	83 ec 04             	sub    $0x4,%esp
c01068ba:	52                   	push   %edx
c01068bb:	6a 00                	push   $0x0
c01068bd:	50                   	push   %eax
c01068be:	e8 a8 49 00 00       	call   c010b26b <Memset>
c01068c3:	83 c4 10             	add    $0x10,%esp
c01068c6:	a1 f8 0e 11 c0       	mov    0xc0110ef8,%eax
c01068cb:	05 ff 0f 00 00       	add    $0xfff,%eax
c01068d0:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c01068d6:	85 c0                	test   %eax,%eax
c01068d8:	0f 48 c2             	cmovs  %edx,%eax
c01068db:	c1 f8 0c             	sar    $0xc,%eax
c01068de:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01068e1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01068e4:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01068e7:	ff 75 e8             	pushl  -0x18(%ebp)
c01068ea:	6a 01                	push   $0x1
c01068ec:	ff 75 e0             	pushl  -0x20(%ebp)
c01068ef:	68 ac 06 11 c0       	push   $0xc01106ac
c01068f4:	e8 a4 f0 ff ff       	call   c010599d <set_bits>
c01068f9:	83 c4 10             	add    $0x10,%esp
c01068fc:	c7 45 dc 00 00 10 00 	movl   $0x100000,-0x24(%ebp)
c0106903:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106906:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106909:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010690c:	83 c0 07             	add    $0x7,%eax
c010690f:	8d 50 07             	lea    0x7(%eax),%edx
c0106912:	85 c0                	test   %eax,%eax
c0106914:	0f 48 c2             	cmovs  %edx,%eax
c0106917:	c1 f8 03             	sar    $0x3,%eax
c010691a:	a3 98 f7 10 c0       	mov    %eax,0xc010f798
c010691f:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106924:	8b 15 b0 06 11 c0    	mov    0xc01106b0,%edx
c010692a:	01 c2                	add    %eax,%edx
c010692c:	a1 f8 0e 11 c0       	mov    0xc0110ef8,%eax
c0106931:	01 d0                	add    %edx,%eax
c0106933:	a3 94 f7 10 c0       	mov    %eax,0xc010f794
c0106938:	8b 15 98 f7 10 c0    	mov    0xc010f798,%edx
c010693e:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0106943:	83 ec 04             	sub    $0x4,%esp
c0106946:	52                   	push   %edx
c0106947:	6a 00                	push   $0x0
c0106949:	50                   	push   %eax
c010694a:	e8 1c 49 00 00       	call   c010b26b <Memset>
c010694f:	83 c4 10             	add    $0x10,%esp
c0106952:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0106955:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106958:	01 d0                	add    %edx,%eax
c010695a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010695d:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0106962:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106967:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c010696d:	85 c0                	test   %eax,%eax
c010696f:	0f 48 c2             	cmovs  %edx,%eax
c0106972:	c1 f8 0c             	sar    $0xc,%eax
c0106975:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106978:	ff 75 e8             	pushl  -0x18(%ebp)
c010697b:	6a 01                	push   $0x1
c010697d:	ff 75 e0             	pushl  -0x20(%ebp)
c0106980:	68 ac 06 11 c0       	push   $0xc01106ac
c0106985:	e8 13 f0 ff ff       	call   c010599d <set_bits>
c010698a:	83 c4 10             	add    $0x10,%esp
c010698d:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0106990:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106993:	01 d0                	add    %edx,%eax
c0106995:	c1 e0 0c             	shl    $0xc,%eax
c0106998:	a3 9c f7 10 c0       	mov    %eax,0xc010f79c
c010699d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01069a0:	83 c0 02             	add    $0x2,%eax
c01069a3:	c1 e0 0c             	shl    $0xc,%eax
c01069a6:	89 c2                	mov    %eax,%edx
c01069a8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01069ab:	01 d0                	add    %edx,%eax
c01069ad:	a3 9c f7 10 c0       	mov    %eax,0xc010f79c
c01069b2:	c7 45 d8 05 00 00 00 	movl   $0x5,-0x28(%ebp)
c01069b9:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01069bc:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01069bf:	90                   	nop
c01069c0:	c9                   	leave  
c01069c1:	c3                   	ret    

c01069c2 <init_memory>:
c01069c2:	55                   	push   %ebp
c01069c3:	89 e5                	mov    %esp,%ebp
c01069c5:	83 ec 38             	sub    $0x38,%esp
c01069c8:	c7 45 f4 00 00 02 c0 	movl   $0xc0020000,-0xc(%ebp)
c01069cf:	c7 45 f0 00 00 40 c0 	movl   $0xc0400000,-0x10(%ebp)
c01069d6:	c7 45 ec 00 00 10 00 	movl   $0x100000,-0x14(%ebp)
c01069dd:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01069e0:	05 00 00 40 00       	add    $0x400000,%eax
c01069e5:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01069e8:	8b 45 08             	mov    0x8(%ebp),%eax
c01069eb:	2b 45 e8             	sub    -0x18(%ebp),%eax
c01069ee:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c01069f4:	85 c0                	test   %eax,%eax
c01069f6:	0f 48 c2             	cmovs  %edx,%eax
c01069f9:	c1 f8 0c             	sar    $0xc,%eax
c01069fc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01069ff:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106a02:	89 c2                	mov    %eax,%edx
c0106a04:	c1 ea 1f             	shr    $0x1f,%edx
c0106a07:	01 d0                	add    %edx,%eax
c0106a09:	d1 f8                	sar    %eax
c0106a0b:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106a0e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106a11:	2b 45 e0             	sub    -0x20(%ebp),%eax
c0106a14:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0106a17:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0106a1a:	8d 50 07             	lea    0x7(%eax),%edx
c0106a1d:	85 c0                	test   %eax,%eax
c0106a1f:	0f 48 c2             	cmovs  %edx,%eax
c0106a22:	c1 f8 03             	sar    $0x3,%eax
c0106a25:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0106a28:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106a2b:	8d 50 07             	lea    0x7(%eax),%edx
c0106a2e:	85 c0                	test   %eax,%eax
c0106a30:	0f 48 c2             	cmovs  %edx,%eax
c0106a33:	c1 f8 03             	sar    $0x3,%eax
c0106a36:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106a39:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106a3c:	a3 b4 06 11 c0       	mov    %eax,0xc01106b4
c0106a41:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106a46:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0106a49:	c1 e2 0c             	shl    $0xc,%edx
c0106a4c:	01 d0                	add    %edx,%eax
c0106a4e:	a3 fc 0e 11 c0       	mov    %eax,0xc0110efc
c0106a53:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106a56:	a3 ac 06 11 c0       	mov    %eax,0xc01106ac
c0106a5b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106a5e:	a3 b0 06 11 c0       	mov    %eax,0xc01106b0
c0106a63:	a1 ac 06 11 c0       	mov    0xc01106ac,%eax
c0106a68:	83 ec 04             	sub    $0x4,%esp
c0106a6b:	ff 75 d8             	pushl  -0x28(%ebp)
c0106a6e:	6a 00                	push   $0x0
c0106a70:	50                   	push   %eax
c0106a71:	e8 f5 47 00 00       	call   c010b26b <Memset>
c0106a76:	83 c4 10             	add    $0x10,%esp
c0106a79:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106a7c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106a7f:	01 d0                	add    %edx,%eax
c0106a81:	a3 f4 0e 11 c0       	mov    %eax,0xc0110ef4
c0106a86:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106a89:	a3 f8 0e 11 c0       	mov    %eax,0xc0110ef8
c0106a8e:	a1 f4 0e 11 c0       	mov    0xc0110ef4,%eax
c0106a93:	83 ec 04             	sub    $0x4,%esp
c0106a96:	ff 75 d4             	pushl  -0x2c(%ebp)
c0106a99:	6a 00                	push   $0x0
c0106a9b:	50                   	push   %eax
c0106a9c:	e8 ca 47 00 00       	call   c010b26b <Memset>
c0106aa1:	83 c4 10             	add    $0x10,%esp
c0106aa4:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106aa7:	a3 98 f7 10 c0       	mov    %eax,0xc010f798
c0106aac:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106aaf:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106ab2:	01 c2                	add    %eax,%edx
c0106ab4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106ab7:	01 d0                	add    %edx,%eax
c0106ab9:	a3 94 f7 10 c0       	mov    %eax,0xc010f794
c0106abe:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106ac1:	05 00 00 10 00       	add    $0x100000,%eax
c0106ac6:	a3 9c f7 10 c0       	mov    %eax,0xc010f79c
c0106acb:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0106ad0:	83 ec 04             	sub    $0x4,%esp
c0106ad3:	ff 75 d8             	pushl  -0x28(%ebp)
c0106ad6:	6a 00                	push   $0x0
c0106ad8:	50                   	push   %eax
c0106ad9:	e8 8d 47 00 00       	call   c010b26b <Memset>
c0106ade:	83 c4 10             	add    $0x10,%esp
c0106ae1:	83 ec 04             	sub    $0x4,%esp
c0106ae4:	68 f0 00 00 00       	push   $0xf0
c0106ae9:	6a 00                	push   $0x0
c0106aeb:	68 e0 37 18 c0       	push   $0xc01837e0
c0106af0:	e8 76 47 00 00       	call   c010b26b <Memset>
c0106af5:	83 c4 10             	add    $0x10,%esp
c0106af8:	83 ec 0c             	sub    $0xc,%esp
c0106afb:	68 e0 37 18 c0       	push   $0xc01837e0
c0106b00:	e8 75 fb ff ff       	call   c010667a <init_memory_block_desc>
c0106b05:	83 c4 10             	add    $0x10,%esp
c0106b08:	90                   	nop
c0106b09:	c9                   	leave  
c0106b0a:	c3                   	ret    

c0106b0b <stop_here>:
c0106b0b:	55                   	push   %ebp
c0106b0c:	89 e5                	mov    %esp,%ebp
c0106b0e:	83 ec 08             	sub    $0x8,%esp
c0106b11:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0106b18:	00 00 00 
c0106b1b:	83 ec 0c             	sub    $0xc,%esp
c0106b1e:	68 00 a8 10 c0       	push   $0xc010a800
c0106b23:	e8 64 95 ff ff       	call   c010008c <disp_str>
c0106b28:	83 c4 10             	add    $0x10,%esp
c0106b2b:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0106b30:	83 ec 0c             	sub    $0xc,%esp
c0106b33:	50                   	push   %eax
c0106b34:	e8 ae 04 00 00       	call   c0106fe7 <disp_int>
c0106b39:	83 c4 10             	add    $0x10,%esp
c0106b3c:	83 ec 0c             	sub    $0xc,%esp
c0106b3f:	68 02 a8 10 c0       	push   $0xc010a802
c0106b44:	e8 43 95 ff ff       	call   c010008c <disp_str>
c0106b49:	83 c4 10             	add    $0x10,%esp
c0106b4c:	90                   	nop
c0106b4d:	c9                   	leave  
c0106b4e:	c3                   	ret    

c0106b4f <catch_error>:
c0106b4f:	55                   	push   %ebp
c0106b50:	89 e5                	mov    %esp,%ebp
c0106b52:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0106b57:	83 c0 01             	add    $0x1,%eax
c0106b5a:	a3 c4 fb 10 c0       	mov    %eax,0xc010fbc4
c0106b5f:	a1 a4 f7 10 c0       	mov    0xc010f7a4,%eax
c0106b64:	a3 a0 f7 10 c0       	mov    %eax,0xc010f7a0
c0106b69:	90                   	nop
c0106b6a:	5d                   	pop    %ebp
c0106b6b:	c3                   	ret    

c0106b6c <intr_enable>:
c0106b6c:	55                   	push   %ebp
c0106b6d:	89 e5                	mov    %esp,%ebp
c0106b6f:	83 ec 18             	sub    $0x18,%esp
c0106b72:	e8 65 00 00 00       	call   c0106bdc <intr_get_status>
c0106b77:	83 f8 01             	cmp    $0x1,%eax
c0106b7a:	75 0c                	jne    c0106b88 <intr_enable+0x1c>
c0106b7c:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0106b83:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106b86:	eb 0b                	jmp    c0106b93 <intr_enable+0x27>
c0106b88:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106b8f:	fb                   	sti    
c0106b90:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106b93:	c9                   	leave  
c0106b94:	c3                   	ret    

c0106b95 <intr_disable>:
c0106b95:	55                   	push   %ebp
c0106b96:	89 e5                	mov    %esp,%ebp
c0106b98:	83 ec 18             	sub    $0x18,%esp
c0106b9b:	e8 3c 00 00 00       	call   c0106bdc <intr_get_status>
c0106ba0:	83 f8 01             	cmp    $0x1,%eax
c0106ba3:	75 0d                	jne    c0106bb2 <intr_disable+0x1d>
c0106ba5:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0106bac:	fa                   	cli    
c0106bad:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106bb0:	eb 0a                	jmp    c0106bbc <intr_disable+0x27>
c0106bb2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106bb9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106bbc:	c9                   	leave  
c0106bbd:	c3                   	ret    

c0106bbe <intr_set_status>:
c0106bbe:	55                   	push   %ebp
c0106bbf:	89 e5                	mov    %esp,%ebp
c0106bc1:	83 ec 08             	sub    $0x8,%esp
c0106bc4:	8b 45 08             	mov    0x8(%ebp),%eax
c0106bc7:	83 e0 01             	and    $0x1,%eax
c0106bca:	85 c0                	test   %eax,%eax
c0106bcc:	74 07                	je     c0106bd5 <intr_set_status+0x17>
c0106bce:	e8 99 ff ff ff       	call   c0106b6c <intr_enable>
c0106bd3:	eb 05                	jmp    c0106bda <intr_set_status+0x1c>
c0106bd5:	e8 bb ff ff ff       	call   c0106b95 <intr_disable>
c0106bda:	c9                   	leave  
c0106bdb:	c3                   	ret    

c0106bdc <intr_get_status>:
c0106bdc:	55                   	push   %ebp
c0106bdd:	89 e5                	mov    %esp,%ebp
c0106bdf:	83 ec 10             	sub    $0x10,%esp
c0106be2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0106be9:	9c                   	pushf  
c0106bea:	58                   	pop    %eax
c0106beb:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0106bee:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106bf1:	c1 e8 09             	shr    $0x9,%eax
c0106bf4:	83 e0 01             	and    $0x1,%eax
c0106bf7:	c9                   	leave  
c0106bf8:	c3                   	ret    

c0106bf9 <Memcpy>:
c0106bf9:	55                   	push   %ebp
c0106bfa:	89 e5                	mov    %esp,%ebp
c0106bfc:	83 ec 18             	sub    $0x18,%esp
c0106bff:	e8 91 ff ff ff       	call   c0106b95 <intr_disable>
c0106c04:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106c07:	83 ec 04             	sub    $0x4,%esp
c0106c0a:	ff 75 10             	pushl  0x10(%ebp)
c0106c0d:	ff 75 0c             	pushl  0xc(%ebp)
c0106c10:	ff 75 08             	pushl  0x8(%ebp)
c0106c13:	e8 25 46 00 00       	call   c010b23d <Memcpy2>
c0106c18:	83 c4 10             	add    $0x10,%esp
c0106c1b:	83 ec 0c             	sub    $0xc,%esp
c0106c1e:	ff 75 f4             	pushl  -0xc(%ebp)
c0106c21:	e8 98 ff ff ff       	call   c0106bbe <intr_set_status>
c0106c26:	83 c4 10             	add    $0x10,%esp
c0106c29:	90                   	nop
c0106c2a:	c9                   	leave  
c0106c2b:	c3                   	ret    

c0106c2c <untar>:
c0106c2c:	55                   	push   %ebp
c0106c2d:	89 e5                	mov    %esp,%ebp
c0106c2f:	81 ec 48 0a 00 00    	sub    $0xa48,%esp
c0106c35:	83 ec 08             	sub    $0x8,%esp
c0106c38:	6a 00                	push   $0x0
c0106c3a:	ff 75 08             	pushl  0x8(%ebp)
c0106c3d:	e8 2a de ff ff       	call   c0104a6c <open>
c0106c42:	83 c4 10             	add    $0x10,%esp
c0106c45:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106c48:	83 ec 0c             	sub    $0xc,%esp
c0106c4b:	68 04 a8 10 c0       	push   $0xc010a804
c0106c50:	e8 76 16 00 00       	call   c01082cb <Printf>
c0106c55:	83 c4 10             	add    $0x10,%esp
c0106c58:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0106c5f:	c7 45 dc 00 02 00 00 	movl   $0x200,-0x24(%ebp)
c0106c66:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106c6d:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0106c74:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0106c7b:	e9 63 02 00 00       	jmp    c0106ee3 <untar+0x2b7>
c0106c80:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0106c84:	7e 58                	jle    c0106cde <untar+0xb2>
c0106c86:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106c89:	05 ff 01 00 00       	add    $0x1ff,%eax
c0106c8e:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0106c94:	85 c0                	test   %eax,%eax
c0106c96:	0f 48 c2             	cmovs  %edx,%eax
c0106c99:	c1 f8 09             	sar    $0x9,%eax
c0106c9c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106c9f:	83 ec 04             	sub    $0x4,%esp
c0106ca2:	68 00 02 00 00       	push   $0x200
c0106ca7:	6a 00                	push   $0x0
c0106ca9:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106caf:	50                   	push   %eax
c0106cb0:	e8 b6 45 00 00       	call   c010b26b <Memset>
c0106cb5:	83 c4 10             	add    $0x10,%esp
c0106cb8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106cbb:	c1 e0 09             	shl    $0x9,%eax
c0106cbe:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0106cc1:	83 ec 04             	sub    $0x4,%esp
c0106cc4:	50                   	push   %eax
c0106cc5:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106ccb:	50                   	push   %eax
c0106ccc:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106ccf:	e8 2d de ff ff       	call   c0104b01 <read>
c0106cd4:	83 c4 10             	add    $0x10,%esp
c0106cd7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106cde:	83 ec 04             	sub    $0x4,%esp
c0106ce1:	68 00 02 00 00       	push   $0x200
c0106ce6:	6a 00                	push   $0x0
c0106ce8:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106cee:	50                   	push   %eax
c0106cef:	e8 77 45 00 00       	call   c010b26b <Memset>
c0106cf4:	83 c4 10             	add    $0x10,%esp
c0106cf7:	83 ec 04             	sub    $0x4,%esp
c0106cfa:	68 00 02 00 00       	push   $0x200
c0106cff:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106d05:	50                   	push   %eax
c0106d06:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106d09:	e8 f3 dd ff ff       	call   c0104b01 <read>
c0106d0e:	83 c4 10             	add    $0x10,%esp
c0106d11:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0106d14:	83 ec 0c             	sub    $0xc,%esp
c0106d17:	68 16 a8 10 c0       	push   $0xc010a816
c0106d1c:	e8 aa 15 00 00       	call   c01082cb <Printf>
c0106d21:	83 c4 10             	add    $0x10,%esp
c0106d24:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0106d28:	0f 84 c1 01 00 00    	je     c0106eef <untar+0x2c3>
c0106d2e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106d31:	01 45 f4             	add    %eax,-0xc(%ebp)
c0106d34:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0106d3b:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106d41:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0106d44:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106d47:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0106d4a:	83 ec 08             	sub    $0x8,%esp
c0106d4d:	6a 07                	push   $0x7
c0106d4f:	ff 75 cc             	pushl  -0x34(%ebp)
c0106d52:	e8 15 dd ff ff       	call   c0104a6c <open>
c0106d57:	83 c4 10             	add    $0x10,%esp
c0106d5a:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0106d5d:	83 ec 0c             	sub    $0xc,%esp
c0106d60:	68 28 a8 10 c0       	push   $0xc010a828
c0106d65:	e8 61 15 00 00       	call   c01082cb <Printf>
c0106d6a:	83 c4 10             	add    $0x10,%esp
c0106d6d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0106d74:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106d77:	83 c0 7c             	add    $0x7c,%eax
c0106d7a:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0106d7d:	83 ec 0c             	sub    $0xc,%esp
c0106d80:	ff 75 cc             	pushl  -0x34(%ebp)
c0106d83:	e8 1c 45 00 00       	call   c010b2a4 <Strlen>
c0106d88:	83 c4 10             	add    $0x10,%esp
c0106d8b:	85 c0                	test   %eax,%eax
c0106d8d:	75 28                	jne    c0106db7 <untar+0x18b>
c0106d8f:	83 ec 0c             	sub    $0xc,%esp
c0106d92:	ff 75 c4             	pushl  -0x3c(%ebp)
c0106d95:	e8 0a 45 00 00       	call   c010b2a4 <Strlen>
c0106d9a:	83 c4 10             	add    $0x10,%esp
c0106d9d:	85 c0                	test   %eax,%eax
c0106d9f:	75 16                	jne    c0106db7 <untar+0x18b>
c0106da1:	83 ec 0c             	sub    $0xc,%esp
c0106da4:	68 3a a8 10 c0       	push   $0xc010a83a
c0106da9:	e8 1d 15 00 00       	call   c01082cb <Printf>
c0106dae:	83 c4 10             	add    $0x10,%esp
c0106db1:	90                   	nop
c0106db2:	e9 39 01 00 00       	jmp    c0106ef0 <untar+0x2c4>
c0106db7:	83 ec 0c             	sub    $0xc,%esp
c0106dba:	68 41 a8 10 c0       	push   $0xc010a841
c0106dbf:	e8 07 15 00 00       	call   c01082cb <Printf>
c0106dc4:	83 c4 10             	add    $0x10,%esp
c0106dc7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0106dca:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106dcd:	eb 1f                	jmp    c0106dee <untar+0x1c2>
c0106dcf:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106dd2:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0106dd9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106ddc:	0f b6 00             	movzbl (%eax),%eax
c0106ddf:	0f be c0             	movsbl %al,%eax
c0106de2:	83 e8 30             	sub    $0x30,%eax
c0106de5:	01 d0                	add    %edx,%eax
c0106de7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106dea:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0106dee:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106df1:	0f b6 00             	movzbl (%eax),%eax
c0106df4:	84 c0                	test   %al,%al
c0106df6:	75 d7                	jne    c0106dcf <untar+0x1a3>
c0106df8:	83 ec 0c             	sub    $0xc,%esp
c0106dfb:	68 4f a8 10 c0       	push   $0xc010a84f
c0106e00:	e8 c6 14 00 00       	call   c01082cb <Printf>
c0106e05:	83 c4 10             	add    $0x10,%esp
c0106e08:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106e0b:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0106e0e:	c7 45 bc 00 08 00 00 	movl   $0x800,-0x44(%ebp)
c0106e15:	83 ec 08             	sub    $0x8,%esp
c0106e18:	ff 75 c0             	pushl  -0x40(%ebp)
c0106e1b:	68 5d a8 10 c0       	push   $0xc010a85d
c0106e20:	e8 a6 14 00 00       	call   c01082cb <Printf>
c0106e25:	83 c4 10             	add    $0x10,%esp
c0106e28:	83 ec 08             	sub    $0x8,%esp
c0106e2b:	ff 75 c0             	pushl  -0x40(%ebp)
c0106e2e:	68 6f a8 10 c0       	push   $0xc010a86f
c0106e33:	e8 93 14 00 00       	call   c01082cb <Printf>
c0106e38:	83 c4 10             	add    $0x10,%esp
c0106e3b:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0106e3e:	39 45 bc             	cmp    %eax,-0x44(%ebp)
c0106e41:	0f 4e 45 bc          	cmovle -0x44(%ebp),%eax
c0106e45:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0106e48:	e8 02 fd ff ff       	call   c0106b4f <catch_error>
c0106e4d:	83 ec 04             	sub    $0x4,%esp
c0106e50:	ff 75 b8             	pushl  -0x48(%ebp)
c0106e53:	8d 85 b8 f5 ff ff    	lea    -0xa48(%ebp),%eax
c0106e59:	50                   	push   %eax
c0106e5a:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106e5d:	e8 9f dc ff ff       	call   c0104b01 <read>
c0106e62:	83 c4 10             	add    $0x10,%esp
c0106e65:	01 45 f4             	add    %eax,-0xc(%ebp)
c0106e68:	83 ec 04             	sub    $0x4,%esp
c0106e6b:	ff 75 b8             	pushl  -0x48(%ebp)
c0106e6e:	8d 85 b8 f5 ff ff    	lea    -0xa48(%ebp),%eax
c0106e74:	50                   	push   %eax
c0106e75:	ff 75 c8             	pushl  -0x38(%ebp)
c0106e78:	e8 05 de ff ff       	call   c0104c82 <write>
c0106e7d:	83 c4 10             	add    $0x10,%esp
c0106e80:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106e83:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0106e86:	7d 02                	jge    c0106e8a <untar+0x25e>
c0106e88:	eb be                	jmp    c0106e48 <untar+0x21c>
c0106e8a:	90                   	nop
c0106e8b:	83 ec 08             	sub    $0x8,%esp
c0106e8e:	ff 75 f4             	pushl  -0xc(%ebp)
c0106e91:	68 81 a8 10 c0       	push   $0xc010a881
c0106e96:	e8 30 14 00 00       	call   c01082cb <Printf>
c0106e9b:	83 c4 10             	add    $0x10,%esp
c0106e9e:	83 ec 08             	sub    $0x8,%esp
c0106ea1:	ff 75 c0             	pushl  -0x40(%ebp)
c0106ea4:	68 93 a8 10 c0       	push   $0xc010a893
c0106ea9:	e8 1d 14 00 00       	call   c01082cb <Printf>
c0106eae:	83 c4 10             	add    $0x10,%esp
c0106eb1:	83 ec 0c             	sub    $0xc,%esp
c0106eb4:	68 a4 a8 10 c0       	push   $0xc010a8a4
c0106eb9:	e8 0d 14 00 00       	call   c01082cb <Printf>
c0106ebe:	83 c4 10             	add    $0x10,%esp
c0106ec1:	83 ec 0c             	sub    $0xc,%esp
c0106ec4:	ff 75 c8             	pushl  -0x38(%ebp)
c0106ec7:	e8 3b de ff ff       	call   c0104d07 <close>
c0106ecc:	83 c4 10             	add    $0x10,%esp
c0106ecf:	83 ec 0c             	sub    $0xc,%esp
c0106ed2:	68 b2 a8 10 c0       	push   $0xc010a8b2
c0106ed7:	e8 ef 13 00 00       	call   c01082cb <Printf>
c0106edc:	83 c4 10             	add    $0x10,%esp
c0106edf:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c0106ee3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0106ee7:	0f 8f 93 fd ff ff    	jg     c0106c80 <untar+0x54>
c0106eed:	eb 01                	jmp    c0106ef0 <untar+0x2c4>
c0106eef:	90                   	nop
c0106ef0:	83 ec 0c             	sub    $0xc,%esp
c0106ef3:	68 bf a8 10 c0       	push   $0xc010a8bf
c0106ef8:	e8 ce 13 00 00       	call   c01082cb <Printf>
c0106efd:	83 c4 10             	add    $0x10,%esp
c0106f00:	83 ec 0c             	sub    $0xc,%esp
c0106f03:	68 d1 a8 10 c0       	push   $0xc010a8d1
c0106f08:	e8 be 13 00 00       	call   c01082cb <Printf>
c0106f0d:	83 c4 10             	add    $0x10,%esp
c0106f10:	83 ec 0c             	sub    $0xc,%esp
c0106f13:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106f16:	e8 ec dd ff ff       	call   c0104d07 <close>
c0106f1b:	83 c4 10             	add    $0x10,%esp
c0106f1e:	83 ec 0c             	sub    $0xc,%esp
c0106f21:	68 e1 a8 10 c0       	push   $0xc010a8e1
c0106f26:	e8 a0 13 00 00       	call   c01082cb <Printf>
c0106f2b:	83 c4 10             	add    $0x10,%esp
c0106f2e:	83 ec 0c             	sub    $0xc,%esp
c0106f31:	68 f4 a8 10 c0       	push   $0xc010a8f4
c0106f36:	e8 90 13 00 00       	call   c01082cb <Printf>
c0106f3b:	83 c4 10             	add    $0x10,%esp
c0106f3e:	90                   	nop
c0106f3f:	c9                   	leave  
c0106f40:	c3                   	ret    

c0106f41 <atoi>:
c0106f41:	55                   	push   %ebp
c0106f42:	89 e5                	mov    %esp,%ebp
c0106f44:	83 ec 10             	sub    $0x10,%esp
c0106f47:	8b 45 08             	mov    0x8(%ebp),%eax
c0106f4a:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0106f4d:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106f50:	8d 50 01             	lea    0x1(%eax),%edx
c0106f53:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0106f56:	c6 00 30             	movb   $0x30,(%eax)
c0106f59:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106f5c:	8d 50 01             	lea    0x1(%eax),%edx
c0106f5f:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0106f62:	c6 00 78             	movb   $0x78,(%eax)
c0106f65:	c6 45 fa 00          	movb   $0x0,-0x6(%ebp)
c0106f69:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0106f6d:	75 0e                	jne    c0106f7d <atoi+0x3c>
c0106f6f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106f72:	8d 50 01             	lea    0x1(%eax),%edx
c0106f75:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0106f78:	c6 00 30             	movb   $0x30,(%eax)
c0106f7b:	eb 61                	jmp    c0106fde <atoi+0x9d>
c0106f7d:	c7 45 f4 1c 00 00 00 	movl   $0x1c,-0xc(%ebp)
c0106f84:	eb 52                	jmp    c0106fd8 <atoi+0x97>
c0106f86:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106f89:	8b 55 0c             	mov    0xc(%ebp),%edx
c0106f8c:	89 c1                	mov    %eax,%ecx
c0106f8e:	d3 fa                	sar    %cl,%edx
c0106f90:	89 d0                	mov    %edx,%eax
c0106f92:	83 e0 0f             	and    $0xf,%eax
c0106f95:	88 45 fb             	mov    %al,-0x5(%ebp)
c0106f98:	80 7d fa 00          	cmpb   $0x0,-0x6(%ebp)
c0106f9c:	75 06                	jne    c0106fa4 <atoi+0x63>
c0106f9e:	80 7d fb 00          	cmpb   $0x0,-0x5(%ebp)
c0106fa2:	74 2f                	je     c0106fd3 <atoi+0x92>
c0106fa4:	c6 45 fa 01          	movb   $0x1,-0x6(%ebp)
c0106fa8:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0106fac:	83 c0 30             	add    $0x30,%eax
c0106faf:	88 45 fb             	mov    %al,-0x5(%ebp)
c0106fb2:	80 7d fb 39          	cmpb   $0x39,-0x5(%ebp)
c0106fb6:	7e 0a                	jle    c0106fc2 <atoi+0x81>
c0106fb8:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0106fbc:	83 c0 07             	add    $0x7,%eax
c0106fbf:	88 45 fb             	mov    %al,-0x5(%ebp)
c0106fc2:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106fc5:	8d 50 01             	lea    0x1(%eax),%edx
c0106fc8:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0106fcb:	0f b6 55 fb          	movzbl -0x5(%ebp),%edx
c0106fcf:	88 10                	mov    %dl,(%eax)
c0106fd1:	eb 01                	jmp    c0106fd4 <atoi+0x93>
c0106fd3:	90                   	nop
c0106fd4:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c0106fd8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0106fdc:	79 a8                	jns    c0106f86 <atoi+0x45>
c0106fde:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106fe1:	c6 00 00             	movb   $0x0,(%eax)
c0106fe4:	90                   	nop
c0106fe5:	c9                   	leave  
c0106fe6:	c3                   	ret    

c0106fe7 <disp_int>:
c0106fe7:	55                   	push   %ebp
c0106fe8:	89 e5                	mov    %esp,%ebp
c0106fea:	83 ec 18             	sub    $0x18,%esp
c0106fed:	ff 75 08             	pushl  0x8(%ebp)
c0106ff0:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0106ff3:	50                   	push   %eax
c0106ff4:	e8 48 ff ff ff       	call   c0106f41 <atoi>
c0106ff9:	83 c4 08             	add    $0x8,%esp
c0106ffc:	83 ec 08             	sub    $0x8,%esp
c0106fff:	6a 0b                	push   $0xb
c0107001:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0107004:	50                   	push   %eax
c0107005:	e8 bd 90 ff ff       	call   c01000c7 <disp_str_colour>
c010700a:	83 c4 10             	add    $0x10,%esp
c010700d:	90                   	nop
c010700e:	c9                   	leave  
c010700f:	c3                   	ret    

c0107010 <do_page_fault>:
c0107010:	55                   	push   %ebp
c0107011:	89 e5                	mov    %esp,%ebp
c0107013:	83 ec 28             	sub    $0x28,%esp
c0107016:	0f 20 d0             	mov    %cr2,%eax
c0107019:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010701c:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0107023:	00 00 00 
c0107026:	83 ec 0c             	sub    $0xc,%esp
c0107029:	68 ff a8 10 c0       	push   $0xc010a8ff
c010702e:	e8 59 90 ff ff       	call   c010008c <disp_str>
c0107033:	83 c4 10             	add    $0x10,%esp
c0107036:	83 ec 0c             	sub    $0xc,%esp
c0107039:	68 0e a9 10 c0       	push   $0xc010a90e
c010703e:	e8 49 90 ff ff       	call   c010008c <disp_str>
c0107043:	83 c4 10             	add    $0x10,%esp
c0107046:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0107049:	83 ec 0c             	sub    $0xc,%esp
c010704c:	50                   	push   %eax
c010704d:	e8 95 ff ff ff       	call   c0106fe7 <disp_int>
c0107052:	83 c4 10             	add    $0x10,%esp
c0107055:	83 ec 0c             	sub    $0xc,%esp
c0107058:	68 13 a9 10 c0       	push   $0xc010a913
c010705d:	e8 2a 90 ff ff       	call   c010008c <disp_str>
c0107062:	83 c4 10             	add    $0x10,%esp
c0107065:	83 ec 0c             	sub    $0xc,%esp
c0107068:	ff 75 f4             	pushl  -0xc(%ebp)
c010706b:	e8 51 ec ff ff       	call   c0105cc1 <ptr_pde>
c0107070:	83 c4 10             	add    $0x10,%esp
c0107073:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107076:	83 ec 0c             	sub    $0xc,%esp
c0107079:	ff 75 f4             	pushl  -0xc(%ebp)
c010707c:	e8 53 ec ff ff       	call   c0105cd4 <ptr_pte>
c0107081:	83 c4 10             	add    $0x10,%esp
c0107084:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0107087:	83 ec 0c             	sub    $0xc,%esp
c010708a:	68 15 a9 10 c0       	push   $0xc010a915
c010708f:	e8 f8 8f ff ff       	call   c010008c <disp_str>
c0107094:	83 c4 10             	add    $0x10,%esp
c0107097:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010709a:	83 ec 0c             	sub    $0xc,%esp
c010709d:	50                   	push   %eax
c010709e:	e8 44 ff ff ff       	call   c0106fe7 <disp_int>
c01070a3:	83 c4 10             	add    $0x10,%esp
c01070a6:	83 ec 0c             	sub    $0xc,%esp
c01070a9:	68 1a a9 10 c0       	push   $0xc010a91a
c01070ae:	e8 d9 8f ff ff       	call   c010008c <disp_str>
c01070b3:	83 c4 10             	add    $0x10,%esp
c01070b6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01070b9:	8b 00                	mov    (%eax),%eax
c01070bb:	83 ec 0c             	sub    $0xc,%esp
c01070be:	50                   	push   %eax
c01070bf:	e8 23 ff ff ff       	call   c0106fe7 <disp_int>
c01070c4:	83 c4 10             	add    $0x10,%esp
c01070c7:	83 ec 0c             	sub    $0xc,%esp
c01070ca:	68 13 a9 10 c0       	push   $0xc010a913
c01070cf:	e8 b8 8f ff ff       	call   c010008c <disp_str>
c01070d4:	83 c4 10             	add    $0x10,%esp
c01070d7:	83 ec 0c             	sub    $0xc,%esp
c01070da:	68 23 a9 10 c0       	push   $0xc010a923
c01070df:	e8 a8 8f ff ff       	call   c010008c <disp_str>
c01070e4:	83 c4 10             	add    $0x10,%esp
c01070e7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01070ea:	83 ec 0c             	sub    $0xc,%esp
c01070ed:	50                   	push   %eax
c01070ee:	e8 f4 fe ff ff       	call   c0106fe7 <disp_int>
c01070f3:	83 c4 10             	add    $0x10,%esp
c01070f6:	83 ec 0c             	sub    $0xc,%esp
c01070f9:	68 28 a9 10 c0       	push   $0xc010a928
c01070fe:	e8 89 8f ff ff       	call   c010008c <disp_str>
c0107103:	83 c4 10             	add    $0x10,%esp
c0107106:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0107109:	8b 00                	mov    (%eax),%eax
c010710b:	83 ec 0c             	sub    $0xc,%esp
c010710e:	50                   	push   %eax
c010710f:	e8 d3 fe ff ff       	call   c0106fe7 <disp_int>
c0107114:	83 c4 10             	add    $0x10,%esp
c0107117:	83 ec 0c             	sub    $0xc,%esp
c010711a:	68 13 a9 10 c0       	push   $0xc010a913
c010711f:	e8 68 8f ff ff       	call   c010008c <disp_str>
c0107124:	83 c4 10             	add    $0x10,%esp
c0107127:	c7 45 e8 00 00 10 00 	movl   $0x100000,-0x18(%ebp)
c010712e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0107131:	8b 00                	mov    (%eax),%eax
c0107133:	83 e0 01             	and    $0x1,%eax
c0107136:	85 c0                	test   %eax,%eax
c0107138:	74 09                	je     c0107143 <do_page_fault+0x133>
c010713a:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
c0107141:	eb 07                	jmp    c010714a <do_page_fault+0x13a>
c0107143:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c010714a:	90                   	nop
c010714b:	c9                   	leave  
c010714c:	c3                   	ret    

c010714d <exception_handler>:
c010714d:	55                   	push   %ebp
c010714e:	89 e5                	mov    %esp,%ebp
c0107150:	57                   	push   %edi
c0107151:	56                   	push   %esi
c0107152:	53                   	push   %ebx
c0107153:	83 ec 6c             	sub    $0x6c,%esp
c0107156:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0107159:	bb a0 ab 10 c0       	mov    $0xc010aba0,%ebx
c010715e:	ba 13 00 00 00       	mov    $0x13,%edx
c0107163:	89 c7                	mov    %eax,%edi
c0107165:	89 de                	mov    %ebx,%esi
c0107167:	89 d1                	mov    %edx,%ecx
c0107169:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c010716b:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0107172:	eb 04                	jmp    c0107178 <exception_handler+0x2b>
c0107174:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0107178:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c010717f:	7e f3                	jle    c0107174 <exception_handler+0x27>
c0107181:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0107188:	00 00 00 
c010718b:	83 ec 0c             	sub    $0xc,%esp
c010718e:	68 31 a9 10 c0       	push   $0xc010a931
c0107193:	e8 f4 8e ff ff       	call   c010008c <disp_str>
c0107198:	83 c4 10             	add    $0x10,%esp
c010719b:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c01071a2:	8b 45 08             	mov    0x8(%ebp),%eax
c01071a5:	8b 44 85 8c          	mov    -0x74(%ebp,%eax,4),%eax
c01071a9:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01071ac:	83 ec 0c             	sub    $0xc,%esp
c01071af:	ff 75 dc             	pushl  -0x24(%ebp)
c01071b2:	e8 d5 8e ff ff       	call   c010008c <disp_str>
c01071b7:	83 c4 10             	add    $0x10,%esp
c01071ba:	83 ec 0c             	sub    $0xc,%esp
c01071bd:	68 3f a9 10 c0       	push   $0xc010a93f
c01071c2:	e8 c5 8e ff ff       	call   c010008c <disp_str>
c01071c7:	83 c4 10             	add    $0x10,%esp
c01071ca:	83 ec 0c             	sub    $0xc,%esp
c01071cd:	68 42 a9 10 c0       	push   $0xc010a942
c01071d2:	e8 b5 8e ff ff       	call   c010008c <disp_str>
c01071d7:	83 c4 10             	add    $0x10,%esp
c01071da:	8b 45 08             	mov    0x8(%ebp),%eax
c01071dd:	83 ec 0c             	sub    $0xc,%esp
c01071e0:	50                   	push   %eax
c01071e1:	e8 01 fe ff ff       	call   c0106fe7 <disp_int>
c01071e6:	83 c4 10             	add    $0x10,%esp
c01071e9:	83 ec 0c             	sub    $0xc,%esp
c01071ec:	68 3f a9 10 c0       	push   $0xc010a93f
c01071f1:	e8 96 8e ff ff       	call   c010008c <disp_str>
c01071f6:	83 c4 10             	add    $0x10,%esp
c01071f9:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c01071fd:	74 2f                	je     c010722e <exception_handler+0xe1>
c01071ff:	83 ec 0c             	sub    $0xc,%esp
c0107202:	68 4a a9 10 c0       	push   $0xc010a94a
c0107207:	e8 80 8e ff ff       	call   c010008c <disp_str>
c010720c:	83 c4 10             	add    $0x10,%esp
c010720f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0107212:	83 ec 0c             	sub    $0xc,%esp
c0107215:	50                   	push   %eax
c0107216:	e8 cc fd ff ff       	call   c0106fe7 <disp_int>
c010721b:	83 c4 10             	add    $0x10,%esp
c010721e:	83 ec 0c             	sub    $0xc,%esp
c0107221:	68 3f a9 10 c0       	push   $0xc010a93f
c0107226:	e8 61 8e ff ff       	call   c010008c <disp_str>
c010722b:	83 c4 10             	add    $0x10,%esp
c010722e:	83 ec 0c             	sub    $0xc,%esp
c0107231:	68 54 a9 10 c0       	push   $0xc010a954
c0107236:	e8 51 8e ff ff       	call   c010008c <disp_str>
c010723b:	83 c4 10             	add    $0x10,%esp
c010723e:	83 ec 0c             	sub    $0xc,%esp
c0107241:	ff 75 14             	pushl  0x14(%ebp)
c0107244:	e8 9e fd ff ff       	call   c0106fe7 <disp_int>
c0107249:	83 c4 10             	add    $0x10,%esp
c010724c:	83 ec 0c             	sub    $0xc,%esp
c010724f:	68 3f a9 10 c0       	push   $0xc010a93f
c0107254:	e8 33 8e ff ff       	call   c010008c <disp_str>
c0107259:	83 c4 10             	add    $0x10,%esp
c010725c:	83 ec 0c             	sub    $0xc,%esp
c010725f:	68 58 a9 10 c0       	push   $0xc010a958
c0107264:	e8 23 8e ff ff       	call   c010008c <disp_str>
c0107269:	83 c4 10             	add    $0x10,%esp
c010726c:	8b 45 10             	mov    0x10(%ebp),%eax
c010726f:	83 ec 0c             	sub    $0xc,%esp
c0107272:	50                   	push   %eax
c0107273:	e8 6f fd ff ff       	call   c0106fe7 <disp_int>
c0107278:	83 c4 10             	add    $0x10,%esp
c010727b:	83 ec 0c             	sub    $0xc,%esp
c010727e:	68 3f a9 10 c0       	push   $0xc010a93f
c0107283:	e8 04 8e ff ff       	call   c010008c <disp_str>
c0107288:	83 c4 10             	add    $0x10,%esp
c010728b:	83 ec 0c             	sub    $0xc,%esp
c010728e:	68 5d a9 10 c0       	push   $0xc010a95d
c0107293:	e8 f4 8d ff ff       	call   c010008c <disp_str>
c0107298:	83 c4 10             	add    $0x10,%esp
c010729b:	83 ec 0c             	sub    $0xc,%esp
c010729e:	ff 75 18             	pushl  0x18(%ebp)
c01072a1:	e8 41 fd ff ff       	call   c0106fe7 <disp_int>
c01072a6:	83 c4 10             	add    $0x10,%esp
c01072a9:	83 ec 0c             	sub    $0xc,%esp
c01072ac:	68 3f a9 10 c0       	push   $0xc010a93f
c01072b1:	e8 d6 8d ff ff       	call   c010008c <disp_str>
c01072b6:	83 c4 10             	add    $0x10,%esp
c01072b9:	83 ec 0c             	sub    $0xc,%esp
c01072bc:	68 68 a9 10 c0       	push   $0xc010a968
c01072c1:	e8 c6 8d ff ff       	call   c010008c <disp_str>
c01072c6:	83 c4 10             	add    $0x10,%esp
c01072c9:	83 7d 08 0e          	cmpl   $0xe,0x8(%ebp)
c01072cd:	75 45                	jne    c0107314 <exception_handler+0x1c7>
c01072cf:	0f 20 d0             	mov    %cr2,%eax
c01072d2:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01072d5:	83 ec 0c             	sub    $0xc,%esp
c01072d8:	68 87 a9 10 c0       	push   $0xc010a987
c01072dd:	e8 aa 8d ff ff       	call   c010008c <disp_str>
c01072e2:	83 c4 10             	add    $0x10,%esp
c01072e5:	83 ec 0c             	sub    $0xc,%esp
c01072e8:	68 0e a9 10 c0       	push   $0xc010a90e
c01072ed:	e8 9a 8d ff ff       	call   c010008c <disp_str>
c01072f2:	83 c4 10             	add    $0x10,%esp
c01072f5:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01072f8:	83 ec 0c             	sub    $0xc,%esp
c01072fb:	50                   	push   %eax
c01072fc:	e8 e6 fc ff ff       	call   c0106fe7 <disp_int>
c0107301:	83 c4 10             	add    $0x10,%esp
c0107304:	83 ec 0c             	sub    $0xc,%esp
c0107307:	68 13 a9 10 c0       	push   $0xc010a913
c010730c:	e8 7b 8d ff ff       	call   c010008c <disp_str>
c0107311:	83 c4 10             	add    $0x10,%esp
c0107314:	83 7d 08 0d          	cmpl   $0xd,0x8(%ebp)
c0107318:	75 11                	jne    c010732b <exception_handler+0x1de>
c010731a:	83 ec 0c             	sub    $0xc,%esp
c010731d:	68 93 a9 10 c0       	push   $0xc010a993
c0107322:	e8 65 8d ff ff       	call   c010008c <disp_str>
c0107327:	83 c4 10             	add    $0x10,%esp
c010732a:	90                   	nop
c010732b:	90                   	nop
c010732c:	8d 65 f4             	lea    -0xc(%ebp),%esp
c010732f:	5b                   	pop    %ebx
c0107330:	5e                   	pop    %esi
c0107331:	5f                   	pop    %edi
c0107332:	5d                   	pop    %ebp
c0107333:	c3                   	ret    

c0107334 <init_internal_interrupt>:
c0107334:	55                   	push   %ebp
c0107335:	89 e5                	mov    %esp,%ebp
c0107337:	83 ec 08             	sub    $0x8,%esp
c010733a:	6a 0e                	push   $0xe
c010733c:	6a 08                	push   $0x8
c010733e:	68 03 01 10 c0       	push   $0xc0100103
c0107343:	6a 00                	push   $0x0
c0107345:	e8 62 c7 ff ff       	call   c0103aac <InitInterruptDesc>
c010734a:	83 c4 10             	add    $0x10,%esp
c010734d:	6a 0e                	push   $0xe
c010734f:	6a 08                	push   $0x8
c0107351:	68 09 01 10 c0       	push   $0xc0100109
c0107356:	6a 01                	push   $0x1
c0107358:	e8 4f c7 ff ff       	call   c0103aac <InitInterruptDesc>
c010735d:	83 c4 10             	add    $0x10,%esp
c0107360:	6a 0e                	push   $0xe
c0107362:	6a 08                	push   $0x8
c0107364:	68 0f 01 10 c0       	push   $0xc010010f
c0107369:	6a 02                	push   $0x2
c010736b:	e8 3c c7 ff ff       	call   c0103aac <InitInterruptDesc>
c0107370:	83 c4 10             	add    $0x10,%esp
c0107373:	6a 0e                	push   $0xe
c0107375:	6a 08                	push   $0x8
c0107377:	68 15 01 10 c0       	push   $0xc0100115
c010737c:	6a 03                	push   $0x3
c010737e:	e8 29 c7 ff ff       	call   c0103aac <InitInterruptDesc>
c0107383:	83 c4 10             	add    $0x10,%esp
c0107386:	6a 0e                	push   $0xe
c0107388:	6a 08                	push   $0x8
c010738a:	68 1b 01 10 c0       	push   $0xc010011b
c010738f:	6a 04                	push   $0x4
c0107391:	e8 16 c7 ff ff       	call   c0103aac <InitInterruptDesc>
c0107396:	83 c4 10             	add    $0x10,%esp
c0107399:	6a 0e                	push   $0xe
c010739b:	6a 08                	push   $0x8
c010739d:	68 21 01 10 c0       	push   $0xc0100121
c01073a2:	6a 05                	push   $0x5
c01073a4:	e8 03 c7 ff ff       	call   c0103aac <InitInterruptDesc>
c01073a9:	83 c4 10             	add    $0x10,%esp
c01073ac:	6a 0e                	push   $0xe
c01073ae:	6a 08                	push   $0x8
c01073b0:	68 27 01 10 c0       	push   $0xc0100127
c01073b5:	6a 06                	push   $0x6
c01073b7:	e8 f0 c6 ff ff       	call   c0103aac <InitInterruptDesc>
c01073bc:	83 c4 10             	add    $0x10,%esp
c01073bf:	6a 0e                	push   $0xe
c01073c1:	6a 08                	push   $0x8
c01073c3:	68 2d 01 10 c0       	push   $0xc010012d
c01073c8:	6a 07                	push   $0x7
c01073ca:	e8 dd c6 ff ff       	call   c0103aac <InitInterruptDesc>
c01073cf:	83 c4 10             	add    $0x10,%esp
c01073d2:	6a 0e                	push   $0xe
c01073d4:	6a 08                	push   $0x8
c01073d6:	68 33 01 10 c0       	push   $0xc0100133
c01073db:	6a 08                	push   $0x8
c01073dd:	e8 ca c6 ff ff       	call   c0103aac <InitInterruptDesc>
c01073e2:	83 c4 10             	add    $0x10,%esp
c01073e5:	6a 0e                	push   $0xe
c01073e7:	6a 08                	push   $0x8
c01073e9:	68 37 01 10 c0       	push   $0xc0100137
c01073ee:	6a 09                	push   $0x9
c01073f0:	e8 b7 c6 ff ff       	call   c0103aac <InitInterruptDesc>
c01073f5:	83 c4 10             	add    $0x10,%esp
c01073f8:	6a 0e                	push   $0xe
c01073fa:	6a 08                	push   $0x8
c01073fc:	68 3d 01 10 c0       	push   $0xc010013d
c0107401:	6a 0a                	push   $0xa
c0107403:	e8 a4 c6 ff ff       	call   c0103aac <InitInterruptDesc>
c0107408:	83 c4 10             	add    $0x10,%esp
c010740b:	6a 0e                	push   $0xe
c010740d:	6a 08                	push   $0x8
c010740f:	68 41 01 10 c0       	push   $0xc0100141
c0107414:	6a 0b                	push   $0xb
c0107416:	e8 91 c6 ff ff       	call   c0103aac <InitInterruptDesc>
c010741b:	83 c4 10             	add    $0x10,%esp
c010741e:	6a 0e                	push   $0xe
c0107420:	6a 08                	push   $0x8
c0107422:	68 45 01 10 c0       	push   $0xc0100145
c0107427:	6a 0c                	push   $0xc
c0107429:	e8 7e c6 ff ff       	call   c0103aac <InitInterruptDesc>
c010742e:	83 c4 10             	add    $0x10,%esp
c0107431:	6a 0e                	push   $0xe
c0107433:	6a 08                	push   $0x8
c0107435:	68 49 01 10 c0       	push   $0xc0100149
c010743a:	6a 0d                	push   $0xd
c010743c:	e8 6b c6 ff ff       	call   c0103aac <InitInterruptDesc>
c0107441:	83 c4 10             	add    $0x10,%esp
c0107444:	6a 0e                	push   $0xe
c0107446:	6a 08                	push   $0x8
c0107448:	68 54 01 10 c0       	push   $0xc0100154
c010744d:	6a 0e                	push   $0xe
c010744f:	e8 58 c6 ff ff       	call   c0103aac <InitInterruptDesc>
c0107454:	83 c4 10             	add    $0x10,%esp
c0107457:	6a 0e                	push   $0xe
c0107459:	6a 08                	push   $0x8
c010745b:	68 58 01 10 c0       	push   $0xc0100158
c0107460:	6a 10                	push   $0x10
c0107462:	e8 45 c6 ff ff       	call   c0103aac <InitInterruptDesc>
c0107467:	83 c4 10             	add    $0x10,%esp
c010746a:	6a 0e                	push   $0xe
c010746c:	6a 08                	push   $0x8
c010746e:	68 5e 01 10 c0       	push   $0xc010015e
c0107473:	6a 11                	push   $0x11
c0107475:	e8 32 c6 ff ff       	call   c0103aac <InitInterruptDesc>
c010747a:	83 c4 10             	add    $0x10,%esp
c010747d:	6a 0e                	push   $0xe
c010747f:	6a 08                	push   $0x8
c0107481:	68 62 01 10 c0       	push   $0xc0100162
c0107486:	6a 12                	push   $0x12
c0107488:	e8 1f c6 ff ff       	call   c0103aac <InitInterruptDesc>
c010748d:	83 c4 10             	add    $0x10,%esp
c0107490:	6a 0e                	push   $0xe
c0107492:	6a 0e                	push   $0xe
c0107494:	68 21 02 10 c0       	push   $0xc0100221
c0107499:	68 90 00 00 00       	push   $0x90
c010749e:	e8 09 c6 ff ff       	call   c0103aac <InitInterruptDesc>
c01074a3:	83 c4 10             	add    $0x10,%esp
c01074a6:	90                   	nop
c01074a7:	c9                   	leave  
c01074a8:	c3                   	ret    

c01074a9 <spurious_irq>:
c01074a9:	55                   	push   %ebp
c01074aa:	89 e5                	mov    %esp,%ebp
c01074ac:	83 ec 08             	sub    $0x8,%esp
c01074af:	83 ec 08             	sub    $0x8,%esp
c01074b2:	6a 0b                	push   $0xb
c01074b4:	68 ec ab 10 c0       	push   $0xc010abec
c01074b9:	e8 09 8c ff ff       	call   c01000c7 <disp_str_colour>
c01074be:	83 c4 10             	add    $0x10,%esp
c01074c1:	83 ec 0c             	sub    $0xc,%esp
c01074c4:	ff 75 08             	pushl  0x8(%ebp)
c01074c7:	e8 1b fb ff ff       	call   c0106fe7 <disp_int>
c01074cc:	83 c4 10             	add    $0x10,%esp
c01074cf:	a1 e8 0e 11 c0       	mov    0xc0110ee8,%eax
c01074d4:	8b 15 ec 0e 11 c0    	mov    0xc0110eec,%edx
c01074da:	83 c0 01             	add    $0x1,%eax
c01074dd:	83 d2 00             	adc    $0x0,%edx
c01074e0:	a3 e8 0e 11 c0       	mov    %eax,0xc0110ee8
c01074e5:	89 15 ec 0e 11 c0    	mov    %edx,0xc0110eec
c01074eb:	83 ec 0c             	sub    $0xc,%esp
c01074ee:	68 00 a8 10 c0       	push   $0xc010a800
c01074f3:	e8 94 8b ff ff       	call   c010008c <disp_str>
c01074f8:	83 c4 10             	add    $0x10,%esp
c01074fb:	a1 e8 0e 11 c0       	mov    0xc0110ee8,%eax
c0107500:	8b 15 ec 0e 11 c0    	mov    0xc0110eec,%edx
c0107506:	83 ec 0c             	sub    $0xc,%esp
c0107509:	50                   	push   %eax
c010750a:	e8 d8 fa ff ff       	call   c0106fe7 <disp_int>
c010750f:	83 c4 10             	add    $0x10,%esp
c0107512:	83 ec 0c             	sub    $0xc,%esp
c0107515:	68 02 a8 10 c0       	push   $0xc010a802
c010751a:	e8 6d 8b ff ff       	call   c010008c <disp_str>
c010751f:	83 c4 10             	add    $0x10,%esp
c0107522:	83 ec 08             	sub    $0x8,%esp
c0107525:	6a 0c                	push   $0xc
c0107527:	68 14 ac 10 c0       	push   $0xc010ac14
c010752c:	e8 96 8b ff ff       	call   c01000c7 <disp_str_colour>
c0107531:	83 c4 10             	add    $0x10,%esp
c0107534:	90                   	nop
c0107535:	c9                   	leave  
c0107536:	c3                   	ret    

c0107537 <init_keyboard>:
c0107537:	55                   	push   %ebp
c0107538:	89 e5                	mov    %esp,%ebp
c010753a:	83 ec 18             	sub    $0x18,%esp
c010753d:	83 ec 04             	sub    $0x4,%esp
c0107540:	68 00 02 00 00       	push   $0x200
c0107545:	6a 00                	push   $0x0
c0107547:	68 ec fb 10 c0       	push   $0xc010fbec
c010754c:	e8 1a 3d 00 00       	call   c010b26b <Memset>
c0107551:	83 c4 10             	add    $0x10,%esp
c0107554:	c7 05 e0 fb 10 c0 ec 	movl   $0xc010fbec,0xc010fbe0
c010755b:	fb 10 c0 
c010755e:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c0107563:	a3 e4 fb 10 c0       	mov    %eax,0xc010fbe4
c0107568:	c7 05 e8 fb 10 c0 00 	movl   $0x0,0xc010fbe8
c010756f:	00 00 00 
c0107572:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0107579:	00 00 00 
c010757c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0107583:	eb 04                	jmp    c0107589 <init_keyboard+0x52>
c0107585:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0107589:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c0107590:	7e f3                	jle    c0107585 <init_keyboard+0x4e>
c0107592:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0107599:	00 00 00 
c010759c:	e8 25 d3 ff ff       	call   c01048c6 <init_keyboard_handler>
c01075a1:	90                   	nop
c01075a2:	c9                   	leave  
c01075a3:	c3                   	ret    

c01075a4 <TestTTY>:
c01075a4:	55                   	push   %ebp
c01075a5:	89 e5                	mov    %esp,%ebp
c01075a7:	83 ec 28             	sub    $0x28,%esp
c01075aa:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c01075b1:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c01075b8:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c01075be:	83 ec 08             	sub    $0x8,%esp
c01075c1:	6a 02                	push   $0x2
c01075c3:	8d 45 de             	lea    -0x22(%ebp),%eax
c01075c6:	50                   	push   %eax
c01075c7:	e8 a0 d4 ff ff       	call   c0104a6c <open>
c01075cc:	83 c4 10             	add    $0x10,%esp
c01075cf:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01075d2:	83 ec 08             	sub    $0x8,%esp
c01075d5:	6a 02                	push   $0x2
c01075d7:	8d 45 de             	lea    -0x22(%ebp),%eax
c01075da:	50                   	push   %eax
c01075db:	e8 8c d4 ff ff       	call   c0104a6c <open>
c01075e0:	83 c4 10             	add    $0x10,%esp
c01075e3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01075e6:	83 ec 0c             	sub    $0xc,%esp
c01075e9:	68 39 ac 10 c0       	push   $0xc010ac39
c01075ee:	e8 d8 0c 00 00       	call   c01082cb <Printf>
c01075f3:	83 c4 10             	add    $0x10,%esp
c01075f6:	83 ec 0c             	sub    $0xc,%esp
c01075f9:	6a 0a                	push   $0xa
c01075fb:	e8 7c 9f ff ff       	call   c010157c <sys_malloc>
c0107600:	83 c4 10             	add    $0x10,%esp
c0107603:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0107606:	83 ec 04             	sub    $0x4,%esp
c0107609:	6a 0a                	push   $0xa
c010760b:	6a 00                	push   $0x0
c010760d:	ff 75 ec             	pushl  -0x14(%ebp)
c0107610:	e8 56 3c 00 00       	call   c010b26b <Memset>
c0107615:	83 c4 10             	add    $0x10,%esp
c0107618:	83 ec 04             	sub    $0x4,%esp
c010761b:	6a 0a                	push   $0xa
c010761d:	ff 75 ec             	pushl  -0x14(%ebp)
c0107620:	ff 75 f0             	pushl  -0x10(%ebp)
c0107623:	e8 d9 d4 ff ff       	call   c0104b01 <read>
c0107628:	83 c4 10             	add    $0x10,%esp
c010762b:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010762e:	83 ec 08             	sub    $0x8,%esp
c0107631:	ff 75 ec             	pushl  -0x14(%ebp)
c0107634:	68 4b ac 10 c0       	push   $0xc010ac4b
c0107639:	e8 8d 0c 00 00       	call   c01082cb <Printf>
c010763e:	83 c4 10             	add    $0x10,%esp
c0107641:	eb c3                	jmp    c0107606 <TestTTY+0x62>

c0107643 <TestFS>:
c0107643:	55                   	push   %ebp
c0107644:	89 e5                	mov    %esp,%ebp
c0107646:	81 ec 28 01 00 00    	sub    $0x128,%esp
c010764c:	83 ec 0c             	sub    $0xc,%esp
c010764f:	68 55 ac 10 c0       	push   $0xc010ac55
c0107654:	e8 33 8a ff ff       	call   c010008c <disp_str>
c0107659:	83 c4 10             	add    $0x10,%esp
c010765c:	c7 45 be 64 65 76 5f 	movl   $0x5f766564,-0x42(%ebp)
c0107663:	c7 45 c2 74 74 79 31 	movl   $0x31797474,-0x3e(%ebp)
c010766a:	66 c7 45 c6 00 00    	movw   $0x0,-0x3a(%ebp)
c0107670:	66 87 db             	xchg   %bx,%bx
c0107673:	83 ec 08             	sub    $0x8,%esp
c0107676:	6a 02                	push   $0x2
c0107678:	8d 45 be             	lea    -0x42(%ebp),%eax
c010767b:	50                   	push   %eax
c010767c:	e8 eb d3 ff ff       	call   c0104a6c <open>
c0107681:	83 c4 10             	add    $0x10,%esp
c0107684:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107687:	66 87 db             	xchg   %bx,%bx
c010768a:	83 ec 08             	sub    $0x8,%esp
c010768d:	6a 02                	push   $0x2
c010768f:	8d 45 be             	lea    -0x42(%ebp),%eax
c0107692:	50                   	push   %eax
c0107693:	e8 d4 d3 ff ff       	call   c0104a6c <open>
c0107698:	83 c4 10             	add    $0x10,%esp
c010769b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010769e:	66 87 db             	xchg   %bx,%bx
c01076a1:	83 ec 0c             	sub    $0xc,%esp
c01076a4:	68 39 ac 10 c0       	push   $0xc010ac39
c01076a9:	e8 1d 0c 00 00       	call   c01082cb <Printf>
c01076ae:	83 c4 10             	add    $0x10,%esp
c01076b1:	66 87 db             	xchg   %bx,%bx
c01076b4:	c7 45 b9 41 43 00 00 	movl   $0x4341,-0x47(%ebp)
c01076bb:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
c01076bf:	c7 45 b4 63 41 42 00 	movl   $0x424163,-0x4c(%ebp)
c01076c6:	c6 45 b8 00          	movb   $0x0,-0x48(%ebp)
c01076ca:	c7 45 aa 49 4e 54 45 	movl   $0x45544e49,-0x56(%ebp)
c01076d1:	c7 45 ae 52 52 55 50 	movl   $0x50555252,-0x52(%ebp)
c01076d8:	66 c7 45 b2 54 00    	movw   $0x54,-0x4e(%ebp)
c01076de:	66 87 db             	xchg   %bx,%bx
c01076e1:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c01076e8:	66 87 db             	xchg   %bx,%bx
c01076eb:	83 ec 0c             	sub    $0xc,%esp
c01076ee:	68 5d ac 10 c0       	push   $0xc010ac5d
c01076f3:	e8 d3 0b 00 00       	call   c01082cb <Printf>
c01076f8:	83 c4 10             	add    $0x10,%esp
c01076fb:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c01076ff:	0f 85 43 03 00 00    	jne    c0107a48 <TestFS+0x405>
c0107705:	83 ec 08             	sub    $0x8,%esp
c0107708:	6a 07                	push   $0x7
c010770a:	8d 45 b9             	lea    -0x47(%ebp),%eax
c010770d:	50                   	push   %eax
c010770e:	e8 59 d3 ff ff       	call   c0104a6c <open>
c0107713:	83 c4 10             	add    $0x10,%esp
c0107716:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0107719:	83 ec 08             	sub    $0x8,%esp
c010771c:	ff 75 e4             	pushl  -0x1c(%ebp)
c010771f:	68 75 ac 10 c0       	push   $0xc010ac75
c0107724:	e8 a2 0b 00 00       	call   c01082cb <Printf>
c0107729:	83 c4 10             	add    $0x10,%esp
c010772c:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0107733:	c7 45 96 63 67 3a 68 	movl   $0x683a6763,-0x6a(%ebp)
c010773a:	c7 45 9a 65 6c 6c 6f 	movl   $0x6f6c6c65,-0x66(%ebp)
c0107741:	c7 45 9e 2c 77 6f 72 	movl   $0x726f772c,-0x62(%ebp)
c0107748:	c7 45 a2 6c 64 21 00 	movl   $0x21646c,-0x5e(%ebp)
c010774f:	c7 45 a6 00 00 00 00 	movl   $0x0,-0x5a(%ebp)
c0107756:	83 ec 0c             	sub    $0xc,%esp
c0107759:	8d 45 96             	lea    -0x6a(%ebp),%eax
c010775c:	50                   	push   %eax
c010775d:	e8 42 3b 00 00       	call   c010b2a4 <Strlen>
c0107762:	83 c4 10             	add    $0x10,%esp
c0107765:	83 ec 04             	sub    $0x4,%esp
c0107768:	50                   	push   %eax
c0107769:	8d 45 96             	lea    -0x6a(%ebp),%eax
c010776c:	50                   	push   %eax
c010776d:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107770:	e8 0d d5 ff ff       	call   c0104c82 <write>
c0107775:	83 c4 10             	add    $0x10,%esp
c0107778:	83 ec 04             	sub    $0x4,%esp
c010777b:	6a 14                	push   $0x14
c010777d:	6a 00                	push   $0x0
c010777f:	8d 45 82             	lea    -0x7e(%ebp),%eax
c0107782:	50                   	push   %eax
c0107783:	e8 e3 3a 00 00       	call   c010b26b <Memset>
c0107788:	83 c4 10             	add    $0x10,%esp
c010778b:	83 ec 04             	sub    $0x4,%esp
c010778e:	6a 12                	push   $0x12
c0107790:	8d 45 82             	lea    -0x7e(%ebp),%eax
c0107793:	50                   	push   %eax
c0107794:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107797:	e8 65 d3 ff ff       	call   c0104b01 <read>
c010779c:	83 c4 10             	add    $0x10,%esp
c010779f:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01077a2:	83 ec 08             	sub    $0x8,%esp
c01077a5:	8d 45 82             	lea    -0x7e(%ebp),%eax
c01077a8:	50                   	push   %eax
c01077a9:	68 7e ac 10 c0       	push   $0xc010ac7e
c01077ae:	e8 18 0b 00 00       	call   c01082cb <Printf>
c01077b3:	83 c4 10             	add    $0x10,%esp
c01077b6:	66 87 db             	xchg   %bx,%bx
c01077b9:	83 ec 0c             	sub    $0xc,%esp
c01077bc:	6a 0a                	push   $0xa
c01077be:	e8 d4 09 00 00       	call   c0108197 <delay>
c01077c3:	83 c4 10             	add    $0x10,%esp
c01077c6:	83 ec 08             	sub    $0x8,%esp
c01077c9:	6a 07                	push   $0x7
c01077cb:	8d 45 b4             	lea    -0x4c(%ebp),%eax
c01077ce:	50                   	push   %eax
c01077cf:	e8 98 d2 ff ff       	call   c0104a6c <open>
c01077d4:	83 c4 10             	add    $0x10,%esp
c01077d7:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01077da:	83 ec 08             	sub    $0x8,%esp
c01077dd:	ff 75 dc             	pushl  -0x24(%ebp)
c01077e0:	68 89 ac 10 c0       	push   $0xc010ac89
c01077e5:	e8 e1 0a 00 00       	call   c01082cb <Printf>
c01077ea:	83 c4 10             	add    $0x10,%esp
c01077ed:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01077f4:	c7 85 6e ff ff ff 63 	movl   $0x683a6763,-0x92(%ebp)
c01077fb:	67 3a 68 
c01077fe:	c7 85 72 ff ff ff 6f 	movl   $0x6120776f,-0x8e(%ebp)
c0107805:	77 20 61 
c0107808:	c7 85 76 ff ff ff 72 	movl   $0x79206572,-0x8a(%ebp)
c010780f:	65 20 79 
c0107812:	c7 85 7a ff ff ff 6f 	movl   $0x3f756f,-0x86(%ebp)
c0107819:	75 3f 00 
c010781c:	c7 85 7e ff ff ff 00 	movl   $0x0,-0x82(%ebp)
c0107823:	00 00 00 
c0107826:	83 ec 0c             	sub    $0xc,%esp
c0107829:	8d 85 6e ff ff ff    	lea    -0x92(%ebp),%eax
c010782f:	50                   	push   %eax
c0107830:	e8 6f 3a 00 00       	call   c010b2a4 <Strlen>
c0107835:	83 c4 10             	add    $0x10,%esp
c0107838:	83 ec 04             	sub    $0x4,%esp
c010783b:	50                   	push   %eax
c010783c:	8d 85 6e ff ff ff    	lea    -0x92(%ebp),%eax
c0107842:	50                   	push   %eax
c0107843:	ff 75 dc             	pushl  -0x24(%ebp)
c0107846:	e8 37 d4 ff ff       	call   c0104c82 <write>
c010784b:	83 c4 10             	add    $0x10,%esp
c010784e:	83 ec 04             	sub    $0x4,%esp
c0107851:	6a 14                	push   $0x14
c0107853:	6a 00                	push   $0x0
c0107855:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c010785b:	50                   	push   %eax
c010785c:	e8 0a 3a 00 00       	call   c010b26b <Memset>
c0107861:	83 c4 10             	add    $0x10,%esp
c0107864:	83 ec 04             	sub    $0x4,%esp
c0107867:	6a 12                	push   $0x12
c0107869:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c010786f:	50                   	push   %eax
c0107870:	ff 75 dc             	pushl  -0x24(%ebp)
c0107873:	e8 89 d2 ff ff       	call   c0104b01 <read>
c0107878:	83 c4 10             	add    $0x10,%esp
c010787b:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010787e:	83 ec 08             	sub    $0x8,%esp
c0107881:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c0107887:	50                   	push   %eax
c0107888:	68 93 ac 10 c0       	push   $0xc010ac93
c010788d:	e8 39 0a 00 00       	call   c01082cb <Printf>
c0107892:	83 c4 10             	add    $0x10,%esp
c0107895:	83 ec 08             	sub    $0x8,%esp
c0107898:	6a 07                	push   $0x7
c010789a:	8d 45 aa             	lea    -0x56(%ebp),%eax
c010789d:	50                   	push   %eax
c010789e:	e8 c9 d1 ff ff       	call   c0104a6c <open>
c01078a3:	83 c4 10             	add    $0x10,%esp
c01078a6:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01078a9:	83 ec 08             	sub    $0x8,%esp
c01078ac:	ff 75 dc             	pushl  -0x24(%ebp)
c01078af:	68 89 ac 10 c0       	push   $0xc010ac89
c01078b4:	e8 12 0a 00 00       	call   c01082cb <Printf>
c01078b9:	83 c4 10             	add    $0x10,%esp
c01078bc:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01078c3:	c7 85 3c ff ff ff 49 	movl   $0x69772049,-0xc4(%ebp)
c01078ca:	20 77 69 
c01078cd:	c7 85 40 ff ff ff 6c 	movl   $0x73206c6c,-0xc0(%ebp)
c01078d4:	6c 20 73 
c01078d7:	c7 85 44 ff ff ff 75 	movl   $0x65636375,-0xbc(%ebp)
c01078de:	63 63 65 
c01078e1:	c7 85 48 ff ff ff 73 	movl   $0x61207373,-0xb8(%ebp)
c01078e8:	73 20 61 
c01078eb:	c7 85 4c ff ff ff 74 	movl   $0x616c2074,-0xb4(%ebp)
c01078f2:	20 6c 61 
c01078f5:	c7 85 50 ff ff ff 73 	movl   $0x2e7473,-0xb0(%ebp)
c01078fc:	74 2e 00 
c01078ff:	c7 85 54 ff ff ff 00 	movl   $0x0,-0xac(%ebp)
c0107906:	00 00 00 
c0107909:	66 c7 85 58 ff ff ff 	movw   $0x0,-0xa8(%ebp)
c0107910:	00 00 
c0107912:	83 ec 0c             	sub    $0xc,%esp
c0107915:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c010791b:	50                   	push   %eax
c010791c:	e8 83 39 00 00       	call   c010b2a4 <Strlen>
c0107921:	83 c4 10             	add    $0x10,%esp
c0107924:	83 ec 04             	sub    $0x4,%esp
c0107927:	50                   	push   %eax
c0107928:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c010792e:	50                   	push   %eax
c010792f:	ff 75 d4             	pushl  -0x2c(%ebp)
c0107932:	e8 4b d3 ff ff       	call   c0104c82 <write>
c0107937:	83 c4 10             	add    $0x10,%esp
c010793a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0107941:	eb 5c                	jmp    c010799f <TestFS+0x35c>
c0107943:	83 ec 04             	sub    $0x4,%esp
c0107946:	6a 1e                	push   $0x1e
c0107948:	6a 00                	push   $0x0
c010794a:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c0107950:	50                   	push   %eax
c0107951:	e8 15 39 00 00       	call   c010b26b <Memset>
c0107956:	83 c4 10             	add    $0x10,%esp
c0107959:	83 ec 0c             	sub    $0xc,%esp
c010795c:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c0107962:	50                   	push   %eax
c0107963:	e8 3c 39 00 00       	call   c010b2a4 <Strlen>
c0107968:	83 c4 10             	add    $0x10,%esp
c010796b:	83 ec 04             	sub    $0x4,%esp
c010796e:	50                   	push   %eax
c010796f:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c0107975:	50                   	push   %eax
c0107976:	ff 75 d4             	pushl  -0x2c(%ebp)
c0107979:	e8 83 d1 ff ff       	call   c0104b01 <read>
c010797e:	83 c4 10             	add    $0x10,%esp
c0107981:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0107984:	83 ec 08             	sub    $0x8,%esp
c0107987:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c010798d:	50                   	push   %eax
c010798e:	68 9e ac 10 c0       	push   $0xc010ac9e
c0107993:	e8 33 09 00 00       	call   c01082cb <Printf>
c0107998:	83 c4 10             	add    $0x10,%esp
c010799b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c010799f:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c01079a3:	7e 9e                	jle    c0107943 <TestFS+0x300>
c01079a5:	c7 85 0a ff ff ff 69 	movl   $0x74736e69,-0xf6(%ebp)
c01079ac:	6e 73 74 
c01079af:	c7 85 0e ff ff ff 61 	movl   $0x2e6c6c61,-0xf2(%ebp)
c01079b6:	6c 6c 2e 
c01079b9:	c7 85 12 ff ff ff 74 	movl   $0x726174,-0xee(%ebp)
c01079c0:	61 72 00 
c01079c3:	c7 85 16 ff ff ff 00 	movl   $0x0,-0xea(%ebp)
c01079ca:	00 00 00 
c01079cd:	c7 85 1a ff ff ff 00 	movl   $0x0,-0xe6(%ebp)
c01079d4:	00 00 00 
c01079d7:	83 ec 08             	sub    $0x8,%esp
c01079da:	6a 00                	push   $0x0
c01079dc:	8d 85 0a ff ff ff    	lea    -0xf6(%ebp),%eax
c01079e2:	50                   	push   %eax
c01079e3:	e8 84 d0 ff ff       	call   c0104a6c <open>
c01079e8:	83 c4 10             	add    $0x10,%esp
c01079eb:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01079ee:	83 ec 08             	sub    $0x8,%esp
c01079f1:	ff 75 cc             	pushl  -0x34(%ebp)
c01079f4:	68 a9 ac 10 c0       	push   $0xc010aca9
c01079f9:	e8 cd 08 00 00       	call   c01082cb <Printf>
c01079fe:	83 c4 10             	add    $0x10,%esp
c0107a01:	83 ec 04             	sub    $0x4,%esp
c0107a04:	6a 28                	push   $0x28
c0107a06:	6a 00                	push   $0x0
c0107a08:	8d 85 e2 fe ff ff    	lea    -0x11e(%ebp),%eax
c0107a0e:	50                   	push   %eax
c0107a0f:	e8 57 38 00 00       	call   c010b26b <Memset>
c0107a14:	83 c4 10             	add    $0x10,%esp
c0107a17:	83 ec 04             	sub    $0x4,%esp
c0107a1a:	6a 28                	push   $0x28
c0107a1c:	8d 85 e2 fe ff ff    	lea    -0x11e(%ebp),%eax
c0107a22:	50                   	push   %eax
c0107a23:	ff 75 cc             	pushl  -0x34(%ebp)
c0107a26:	e8 d6 d0 ff ff       	call   c0104b01 <read>
c0107a2b:	83 c4 10             	add    $0x10,%esp
c0107a2e:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0107a31:	83 ec 08             	sub    $0x8,%esp
c0107a34:	8d 85 e2 fe ff ff    	lea    -0x11e(%ebp),%eax
c0107a3a:	50                   	push   %eax
c0107a3b:	68 b3 ac 10 c0       	push   $0xc010acb3
c0107a40:	e8 86 08 00 00       	call   c01082cb <Printf>
c0107a45:	83 c4 10             	add    $0x10,%esp
c0107a48:	90                   	nop
c0107a49:	c9                   	leave  
c0107a4a:	c3                   	ret    

c0107a4b <wait_exit>:
c0107a4b:	55                   	push   %ebp
c0107a4c:	89 e5                	mov    %esp,%ebp
c0107a4e:	83 ec 28             	sub    $0x28,%esp
c0107a51:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0107a58:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0107a5f:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0107a65:	83 ec 08             	sub    $0x8,%esp
c0107a68:	6a 02                	push   $0x2
c0107a6a:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107a6d:	50                   	push   %eax
c0107a6e:	e8 f9 cf ff ff       	call   c0104a6c <open>
c0107a73:	83 c4 10             	add    $0x10,%esp
c0107a76:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107a79:	83 ec 08             	sub    $0x8,%esp
c0107a7c:	6a 02                	push   $0x2
c0107a7e:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107a81:	50                   	push   %eax
c0107a82:	e8 e5 cf ff ff       	call   c0104a6c <open>
c0107a87:	83 c4 10             	add    $0x10,%esp
c0107a8a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0107a8d:	e8 3a d3 ff ff       	call   c0104dcc <fork>
c0107a92:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0107a95:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0107a99:	7e 35                	jle    c0107ad0 <wait_exit+0x85>
c0107a9b:	83 ec 0c             	sub    $0xc,%esp
c0107a9e:	68 be ac 10 c0       	push   $0xc010acbe
c0107aa3:	e8 23 08 00 00       	call   c01082cb <Printf>
c0107aa8:	83 c4 10             	add    $0x10,%esp
c0107aab:	83 ec 0c             	sub    $0xc,%esp
c0107aae:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0107ab1:	50                   	push   %eax
c0107ab2:	e8 a2 d2 ff ff       	call   c0104d59 <wait>
c0107ab7:	83 c4 10             	add    $0x10,%esp
c0107aba:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0107abd:	83 ec 08             	sub    $0x8,%esp
c0107ac0:	50                   	push   %eax
c0107ac1:	68 d6 ac 10 c0       	push   $0xc010acd6
c0107ac6:	e8 00 08 00 00       	call   c01082cb <Printf>
c0107acb:	83 c4 10             	add    $0x10,%esp
c0107ace:	eb fe                	jmp    c0107ace <wait_exit+0x83>
c0107ad0:	83 ec 0c             	sub    $0xc,%esp
c0107ad3:	68 f1 ac 10 c0       	push   $0xc010acf1
c0107ad8:	e8 ee 07 00 00       	call   c01082cb <Printf>
c0107add:	83 c4 10             	add    $0x10,%esp
c0107ae0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0107ae7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0107aea:	8d 50 01             	lea    0x1(%eax),%edx
c0107aed:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0107af0:	3d 50 c3 00 00       	cmp    $0xc350,%eax
c0107af5:	7f 02                	jg     c0107af9 <wait_exit+0xae>
c0107af7:	eb ee                	jmp    c0107ae7 <wait_exit+0x9c>
c0107af9:	90                   	nop
c0107afa:	83 ec 0c             	sub    $0xc,%esp
c0107afd:	68 fd ac 10 c0       	push   $0xc010acfd
c0107b02:	e8 c4 07 00 00       	call   c01082cb <Printf>
c0107b07:	83 c4 10             	add    $0x10,%esp
c0107b0a:	83 ec 0c             	sub    $0xc,%esp
c0107b0d:	68 0b ad 10 c0       	push   $0xc010ad0b
c0107b12:	e8 b4 07 00 00       	call   c01082cb <Printf>
c0107b17:	83 c4 10             	add    $0x10,%esp
c0107b1a:	83 ec 0c             	sub    $0xc,%esp
c0107b1d:	68 1a ad 10 c0       	push   $0xc010ad1a
c0107b22:	e8 a4 07 00 00       	call   c01082cb <Printf>
c0107b27:	83 c4 10             	add    $0x10,%esp
c0107b2a:	83 ec 0c             	sub    $0xc,%esp
c0107b2d:	6a 5a                	push   $0x5a
c0107b2f:	e8 69 d2 ff ff       	call   c0104d9d <exit>
c0107b34:	83 c4 10             	add    $0x10,%esp
c0107b37:	83 ec 0c             	sub    $0xc,%esp
c0107b3a:	68 29 ad 10 c0       	push   $0xc010ad29
c0107b3f:	e8 87 07 00 00       	call   c01082cb <Printf>
c0107b44:	83 c4 10             	add    $0x10,%esp
c0107b47:	eb fe                	jmp    c0107b47 <wait_exit+0xfc>

c0107b49 <INIT_fork>:
c0107b49:	55                   	push   %ebp
c0107b4a:	89 e5                	mov    %esp,%ebp
c0107b4c:	83 ec 78             	sub    $0x78,%esp
c0107b4f:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0107b56:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0107b5d:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0107b63:	83 ec 08             	sub    $0x8,%esp
c0107b66:	6a 02                	push   $0x2
c0107b68:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107b6b:	50                   	push   %eax
c0107b6c:	e8 fb ce ff ff       	call   c0104a6c <open>
c0107b71:	83 c4 10             	add    $0x10,%esp
c0107b74:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0107b77:	83 ec 08             	sub    $0x8,%esp
c0107b7a:	6a 02                	push   $0x2
c0107b7c:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107b7f:	50                   	push   %eax
c0107b80:	e8 e7 ce ff ff       	call   c0104a6c <open>
c0107b85:	83 c4 10             	add    $0x10,%esp
c0107b88:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107b8b:	c7 45 b6 49 4e 49 54 	movl   $0x54494e49,-0x4a(%ebp)
c0107b92:	c7 45 ba 20 69 73 20 	movl   $0x20736920,-0x46(%ebp)
c0107b99:	c7 45 be 72 75 6e 6e 	movl   $0x6e6e7572,-0x42(%ebp)
c0107ba0:	c7 45 c2 69 6e 67 0a 	movl   $0xa676e69,-0x3e(%ebp)
c0107ba7:	c7 45 c6 00 00 00 00 	movl   $0x0,-0x3a(%ebp)
c0107bae:	c7 45 ca 00 00 00 00 	movl   $0x0,-0x36(%ebp)
c0107bb5:	c7 45 ce 00 00 00 00 	movl   $0x0,-0x32(%ebp)
c0107bbc:	c7 45 d2 00 00 00 00 	movl   $0x0,-0x2e(%ebp)
c0107bc3:	c7 45 d6 00 00 00 00 	movl   $0x0,-0x2a(%ebp)
c0107bca:	c7 45 da 00 00 00 00 	movl   $0x0,-0x26(%ebp)
c0107bd1:	83 ec 0c             	sub    $0xc,%esp
c0107bd4:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107bd7:	50                   	push   %eax
c0107bd8:	e8 ee 06 00 00       	call   c01082cb <Printf>
c0107bdd:	83 c4 10             	add    $0x10,%esp
c0107be0:	83 ec 0c             	sub    $0xc,%esp
c0107be3:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107be6:	50                   	push   %eax
c0107be7:	e8 b8 36 00 00       	call   c010b2a4 <Strlen>
c0107bec:	83 c4 10             	add    $0x10,%esp
c0107bef:	83 ec 04             	sub    $0x4,%esp
c0107bf2:	50                   	push   %eax
c0107bf3:	6a 00                	push   $0x0
c0107bf5:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107bf8:	50                   	push   %eax
c0107bf9:	e8 6d 36 00 00       	call   c010b26b <Memset>
c0107bfe:	83 c4 10             	add    $0x10,%esp
c0107c01:	83 ec 04             	sub    $0x4,%esp
c0107c04:	6a 28                	push   $0x28
c0107c06:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107c09:	50                   	push   %eax
c0107c0a:	ff 75 f0             	pushl  -0x10(%ebp)
c0107c0d:	e8 ef ce ff ff       	call   c0104b01 <read>
c0107c12:	83 c4 10             	add    $0x10,%esp
c0107c15:	83 ec 0c             	sub    $0xc,%esp
c0107c18:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107c1b:	50                   	push   %eax
c0107c1c:	e8 aa 06 00 00       	call   c01082cb <Printf>
c0107c21:	83 c4 10             	add    $0x10,%esp
c0107c24:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0107c2b:	e8 9c d1 ff ff       	call   c0104dcc <fork>
c0107c30:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0107c33:	83 ec 0c             	sub    $0xc,%esp
c0107c36:	6a 01                	push   $0x1
c0107c38:	e8 5a 05 00 00       	call   c0108197 <delay>
c0107c3d:	83 c4 10             	add    $0x10,%esp
c0107c40:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0107c44:	0f 8e cd 00 00 00    	jle    c0107d17 <INIT_fork+0x1ce>
c0107c4a:	83 ec 08             	sub    $0x8,%esp
c0107c4d:	ff 75 e8             	pushl  -0x18(%ebp)
c0107c50:	68 37 ad 10 c0       	push   $0xc010ad37
c0107c55:	e8 71 06 00 00       	call   c01082cb <Printf>
c0107c5a:	83 c4 10             	add    $0x10,%esp
c0107c5d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0107c61:	c7 45 8e 50 61 72 65 	movl   $0x65726150,-0x72(%ebp)
c0107c68:	c7 45 92 6e 74 2e 4e 	movl   $0x4e2e746e,-0x6e(%ebp)
c0107c6f:	c7 45 96 69 63 65 20 	movl   $0x20656369,-0x6a(%ebp)
c0107c76:	c7 45 9a 74 6f 20 6d 	movl   $0x6d206f74,-0x66(%ebp)
c0107c7d:	c7 45 9e 65 65 74 20 	movl   $0x20746565,-0x62(%ebp)
c0107c84:	c7 45 a2 79 6f 75 21 	movl   $0x21756f79,-0x5e(%ebp)
c0107c8b:	c7 45 a6 0a 00 00 00 	movl   $0xa,-0x5a(%ebp)
c0107c92:	c7 45 aa 00 00 00 00 	movl   $0x0,-0x56(%ebp)
c0107c99:	c7 45 ae 00 00 00 00 	movl   $0x0,-0x52(%ebp)
c0107ca0:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)
c0107ca7:	83 ec 0c             	sub    $0xc,%esp
c0107caa:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107cad:	50                   	push   %eax
c0107cae:	e8 f1 35 00 00       	call   c010b2a4 <Strlen>
c0107cb3:	83 c4 10             	add    $0x10,%esp
c0107cb6:	83 ec 04             	sub    $0x4,%esp
c0107cb9:	50                   	push   %eax
c0107cba:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107cbd:	50                   	push   %eax
c0107cbe:	ff 75 f4             	pushl  -0xc(%ebp)
c0107cc1:	e8 bc cf ff ff       	call   c0104c82 <write>
c0107cc6:	83 c4 10             	add    $0x10,%esp
c0107cc9:	e8 81 ee ff ff       	call   c0106b4f <catch_error>
c0107cce:	83 ec 0c             	sub    $0xc,%esp
c0107cd1:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107cd4:	50                   	push   %eax
c0107cd5:	e8 ca 35 00 00       	call   c010b2a4 <Strlen>
c0107cda:	83 c4 10             	add    $0x10,%esp
c0107cdd:	83 ec 04             	sub    $0x4,%esp
c0107ce0:	50                   	push   %eax
c0107ce1:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107ce4:	50                   	push   %eax
c0107ce5:	ff 75 f4             	pushl  -0xc(%ebp)
c0107ce8:	e8 95 cf ff ff       	call   c0104c82 <write>
c0107ced:	83 c4 10             	add    $0x10,%esp
c0107cf0:	83 ec 0c             	sub    $0xc,%esp
c0107cf3:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107cf6:	50                   	push   %eax
c0107cf7:	e8 a8 35 00 00       	call   c010b2a4 <Strlen>
c0107cfc:	83 c4 10             	add    $0x10,%esp
c0107cff:	83 ec 04             	sub    $0x4,%esp
c0107d02:	50                   	push   %eax
c0107d03:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107d06:	50                   	push   %eax
c0107d07:	ff 75 f4             	pushl  -0xc(%ebp)
c0107d0a:	e8 73 cf ff ff       	call   c0104c82 <write>
c0107d0f:	83 c4 10             	add    $0x10,%esp
c0107d12:	e9 d6 00 00 00       	jmp    c0107ded <INIT_fork+0x2a4>
c0107d17:	83 ec 08             	sub    $0x8,%esp
c0107d1a:	ff 75 e8             	pushl  -0x18(%ebp)
c0107d1d:	68 37 ad 10 c0       	push   $0xc010ad37
c0107d22:	e8 a4 05 00 00       	call   c01082cb <Printf>
c0107d27:	83 c4 10             	add    $0x10,%esp
c0107d2a:	83 ec 0c             	sub    $0xc,%esp
c0107d2d:	6a 01                	push   $0x1
c0107d2f:	e8 63 04 00 00       	call   c0108197 <delay>
c0107d34:	83 c4 10             	add    $0x10,%esp
c0107d37:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0107d3b:	83 45 ec 02          	addl   $0x2,-0x14(%ebp)
c0107d3f:	c7 45 8e 43 68 69 6c 	movl   $0x6c696843,-0x72(%ebp)
c0107d46:	c7 45 92 64 2e 53 65 	movl   $0x65532e64,-0x6e(%ebp)
c0107d4d:	c7 45 96 65 20 79 6f 	movl   $0x6f792065,-0x6a(%ebp)
c0107d54:	c7 45 9a 75 20 61 67 	movl   $0x67612075,-0x66(%ebp)
c0107d5b:	c7 45 9e 61 69 6e 0a 	movl   $0xa6e6961,-0x62(%ebp)
c0107d62:	c7 45 a2 00 00 00 00 	movl   $0x0,-0x5e(%ebp)
c0107d69:	c7 45 a6 00 00 00 00 	movl   $0x0,-0x5a(%ebp)
c0107d70:	c7 45 aa 00 00 00 00 	movl   $0x0,-0x56(%ebp)
c0107d77:	c7 45 ae 00 00 00 00 	movl   $0x0,-0x52(%ebp)
c0107d7e:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)
c0107d85:	83 ec 0c             	sub    $0xc,%esp
c0107d88:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107d8b:	50                   	push   %eax
c0107d8c:	e8 13 35 00 00       	call   c010b2a4 <Strlen>
c0107d91:	83 c4 10             	add    $0x10,%esp
c0107d94:	83 ec 04             	sub    $0x4,%esp
c0107d97:	50                   	push   %eax
c0107d98:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107d9b:	50                   	push   %eax
c0107d9c:	ff 75 f4             	pushl  -0xc(%ebp)
c0107d9f:	e8 de ce ff ff       	call   c0104c82 <write>
c0107da4:	83 c4 10             	add    $0x10,%esp
c0107da7:	83 ec 0c             	sub    $0xc,%esp
c0107daa:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107dad:	50                   	push   %eax
c0107dae:	e8 f1 34 00 00       	call   c010b2a4 <Strlen>
c0107db3:	83 c4 10             	add    $0x10,%esp
c0107db6:	83 ec 04             	sub    $0x4,%esp
c0107db9:	50                   	push   %eax
c0107dba:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107dbd:	50                   	push   %eax
c0107dbe:	ff 75 f4             	pushl  -0xc(%ebp)
c0107dc1:	e8 bc ce ff ff       	call   c0104c82 <write>
c0107dc6:	83 c4 10             	add    $0x10,%esp
c0107dc9:	83 ec 0c             	sub    $0xc,%esp
c0107dcc:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107dcf:	50                   	push   %eax
c0107dd0:	e8 cf 34 00 00       	call   c010b2a4 <Strlen>
c0107dd5:	83 c4 10             	add    $0x10,%esp
c0107dd8:	83 ec 04             	sub    $0x4,%esp
c0107ddb:	50                   	push   %eax
c0107ddc:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107ddf:	50                   	push   %eax
c0107de0:	ff 75 f4             	pushl  -0xc(%ebp)
c0107de3:	e8 9a ce ff ff       	call   c0104c82 <write>
c0107de8:	83 c4 10             	add    $0x10,%esp
c0107deb:	eb fe                	jmp    c0107deb <INIT_fork+0x2a2>
c0107ded:	83 ec 04             	sub    $0x4,%esp
c0107df0:	6a 28                	push   $0x28
c0107df2:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107df5:	50                   	push   %eax
c0107df6:	ff 75 f0             	pushl  -0x10(%ebp)
c0107df9:	e8 03 cd ff ff       	call   c0104b01 <read>
c0107dfe:	83 c4 10             	add    $0x10,%esp
c0107e01:	83 ec 0c             	sub    $0xc,%esp
c0107e04:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107e07:	50                   	push   %eax
c0107e08:	e8 be 04 00 00       	call   c01082cb <Printf>
c0107e0d:	83 c4 10             	add    $0x10,%esp
c0107e10:	83 ec 0c             	sub    $0xc,%esp
c0107e13:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107e16:	50                   	push   %eax
c0107e17:	e8 af 04 00 00       	call   c01082cb <Printf>
c0107e1c:	83 c4 10             	add    $0x10,%esp
c0107e1f:	83 ec 0c             	sub    $0xc,%esp
c0107e22:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107e25:	50                   	push   %eax
c0107e26:	e8 a0 04 00 00       	call   c01082cb <Printf>
c0107e2b:	83 c4 10             	add    $0x10,%esp
c0107e2e:	83 ec 0c             	sub    $0xc,%esp
c0107e31:	68 41 ad 10 c0       	push   $0xc010ad41
c0107e36:	e8 a9 07 00 00       	call   c01085e4 <spin>
c0107e3b:	83 c4 10             	add    $0x10,%esp
c0107e3e:	90                   	nop
c0107e3f:	c9                   	leave  
c0107e40:	c3                   	ret    

c0107e41 <simple_shell>:
c0107e41:	55                   	push   %ebp
c0107e42:	89 e5                	mov    %esp,%ebp
c0107e44:	57                   	push   %edi
c0107e45:	83 ec 64             	sub    $0x64,%esp
c0107e48:	c7 45 d2 64 65 76 5f 	movl   $0x5f766564,-0x2e(%ebp)
c0107e4f:	c7 45 d6 74 74 79 31 	movl   $0x31797474,-0x2a(%ebp)
c0107e56:	66 c7 45 da 00 00    	movw   $0x0,-0x26(%ebp)
c0107e5c:	83 ec 08             	sub    $0x8,%esp
c0107e5f:	6a 02                	push   $0x2
c0107e61:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c0107e64:	50                   	push   %eax
c0107e65:	e8 02 cc ff ff       	call   c0104a6c <open>
c0107e6a:	83 c4 10             	add    $0x10,%esp
c0107e6d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107e70:	83 ec 08             	sub    $0x8,%esp
c0107e73:	6a 02                	push   $0x2
c0107e75:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c0107e78:	50                   	push   %eax
c0107e79:	e8 ee cb ff ff       	call   c0104a6c <open>
c0107e7e:	83 c4 10             	add    $0x10,%esp
c0107e81:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0107e84:	8d 55 a8             	lea    -0x58(%ebp),%edx
c0107e87:	b8 00 00 00 00       	mov    $0x0,%eax
c0107e8c:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0107e91:	89 d7                	mov    %edx,%edi
c0107e93:	f3 ab                	rep stos %eax,%es:(%edi)
c0107e95:	c7 45 a8 49 ad 10 c0 	movl   $0xc010ad49,-0x58(%ebp)
c0107e9c:	c7 45 ac 4e ad 10 c0 	movl   $0xc010ad4e,-0x54(%ebp)
c0107ea3:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0107eaa:	66 87 db             	xchg   %bx,%bx
c0107ead:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
c0107eb4:	c7 45 e8 02 00 00 00 	movl   $0x2,-0x18(%ebp)
c0107ebb:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0107ebe:	c7 44 85 a8 00 00 00 	movl   $0x0,-0x58(%ebp,%eax,4)
c0107ec5:	00 
c0107ec6:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0107ec9:	85 c0                	test   %eax,%eax
c0107ecb:	75 1c                	jne    c0107ee9 <simple_shell+0xa8>
c0107ecd:	68 da 02 00 00       	push   $0x2da
c0107ed2:	68 54 ad 10 c0       	push   $0xc010ad54
c0107ed7:	68 54 ad 10 c0       	push   $0xc010ad54
c0107edc:	68 64 ad 10 c0       	push   $0xc010ad64
c0107ee1:	e8 42 07 00 00       	call   c0108628 <assertion_failure>
c0107ee6:	83 c4 10             	add    $0x10,%esp
c0107ee9:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0107eec:	83 ec 08             	sub    $0x8,%esp
c0107eef:	6a 02                	push   $0x2
c0107ef1:	50                   	push   %eax
c0107ef2:	e8 75 cb ff ff       	call   c0104a6c <open>
c0107ef7:	83 c4 10             	add    $0x10,%esp
c0107efa:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0107efd:	66 87 db             	xchg   %bx,%bx
c0107f00:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
c0107f04:	75 4e                	jne    c0107f54 <simple_shell+0x113>
c0107f06:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0107f0d:	eb 26                	jmp    c0107f35 <simple_shell+0xf4>
c0107f0f:	8b 55 a8             	mov    -0x58(%ebp),%edx
c0107f12:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0107f15:	01 d0                	add    %edx,%eax
c0107f17:	0f b6 00             	movzbl (%eax),%eax
c0107f1a:	0f be c0             	movsbl %al,%eax
c0107f1d:	83 ec 04             	sub    $0x4,%esp
c0107f20:	50                   	push   %eax
c0107f21:	ff 75 f4             	pushl  -0xc(%ebp)
c0107f24:	68 73 ad 10 c0       	push   $0xc010ad73
c0107f29:	e8 9d 03 00 00       	call   c01082cb <Printf>
c0107f2e:	83 c4 10             	add    $0x10,%esp
c0107f31:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0107f35:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
c0107f39:	7e d4                	jle    c0107f0f <simple_shell+0xce>
c0107f3b:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0107f3e:	83 ec 08             	sub    $0x8,%esp
c0107f41:	50                   	push   %eax
c0107f42:	68 7a ad 10 c0       	push   $0xc010ad7a
c0107f47:	e8 7f 03 00 00       	call   c01082cb <Printf>
c0107f4c:	83 c4 10             	add    $0x10,%esp
c0107f4f:	e9 81 00 00 00       	jmp    c0107fd5 <simple_shell+0x194>
c0107f54:	83 ec 0c             	sub    $0xc,%esp
c0107f57:	68 80 ad 10 c0       	push   $0xc010ad80
c0107f5c:	e8 6a 03 00 00       	call   c01082cb <Printf>
c0107f61:	83 c4 10             	add    $0x10,%esp
c0107f64:	e8 63 ce ff ff       	call   c0104dcc <fork>
c0107f69:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0107f6c:	83 ec 0c             	sub    $0xc,%esp
c0107f6f:	68 95 ad 10 c0       	push   $0xc010ad95
c0107f74:	e8 52 03 00 00       	call   c01082cb <Printf>
c0107f79:	83 c4 10             	add    $0x10,%esp
c0107f7c:	66 87 db             	xchg   %bx,%bx
c0107f7f:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
c0107f83:	7e 11                	jle    c0107f96 <simple_shell+0x155>
c0107f85:	83 ec 0c             	sub    $0xc,%esp
c0107f88:	8d 45 a4             	lea    -0x5c(%ebp),%eax
c0107f8b:	50                   	push   %eax
c0107f8c:	e8 c8 cd ff ff       	call   c0104d59 <wait>
c0107f91:	83 c4 10             	add    $0x10,%esp
c0107f94:	eb 3f                	jmp    c0107fd5 <simple_shell+0x194>
c0107f96:	83 ec 0c             	sub    $0xc,%esp
c0107f99:	68 aa ad 10 c0       	push   $0xc010adaa
c0107f9e:	e8 28 03 00 00       	call   c01082cb <Printf>
c0107fa3:	83 c4 10             	add    $0x10,%esp
c0107fa6:	83 ec 0c             	sub    $0xc,%esp
c0107fa9:	ff 75 e0             	pushl  -0x20(%ebp)
c0107fac:	e8 56 cd ff ff       	call   c0104d07 <close>
c0107fb1:	83 c4 10             	add    $0x10,%esp
c0107fb4:	66 87 db             	xchg   %bx,%bx
c0107fb7:	6a 00                	push   $0x0
c0107fb9:	68 4e ad 10 c0       	push   $0xc010ad4e
c0107fbe:	68 49 ad 10 c0       	push   $0xc010ad49
c0107fc3:	68 c6 ad 10 c0       	push   $0xc010adc6
c0107fc8:	e8 d2 d0 ff ff       	call   c010509f <execl>
c0107fcd:	83 c4 10             	add    $0x10,%esp
c0107fd0:	66 87 db             	xchg   %bx,%bx
c0107fd3:	eb fe                	jmp    c0107fd3 <simple_shell+0x192>
c0107fd5:	8b 7d fc             	mov    -0x4(%ebp),%edi
c0107fd8:	c9                   	leave  
c0107fd9:	c3                   	ret    

c0107fda <test_shell>:
c0107fda:	55                   	push   %ebp
c0107fdb:	89 e5                	mov    %esp,%ebp
c0107fdd:	83 ec 38             	sub    $0x38,%esp
c0107fe0:	c7 45 ea 64 65 76 5f 	movl   $0x5f766564,-0x16(%ebp)
c0107fe7:	c7 45 ee 74 74 79 31 	movl   $0x31797474,-0x12(%ebp)
c0107fee:	66 c7 45 f2 00 00    	movw   $0x0,-0xe(%ebp)
c0107ff4:	83 ec 08             	sub    $0x8,%esp
c0107ff7:	6a 02                	push   $0x2
c0107ff9:	8d 45 ea             	lea    -0x16(%ebp),%eax
c0107ffc:	50                   	push   %eax
c0107ffd:	e8 6a ca ff ff       	call   c0104a6c <open>
c0108002:	83 c4 10             	add    $0x10,%esp
c0108005:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108008:	c7 45 d6 69 6e 73 74 	movl   $0x74736e69,-0x2a(%ebp)
c010800f:	c7 45 da 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x26(%ebp)
c0108016:	c7 45 de 74 61 72 00 	movl   $0x726174,-0x22(%ebp)
c010801d:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c0108024:	c7 45 e6 00 00 00 00 	movl   $0x0,-0x1a(%ebp)
c010802b:	83 ec 0c             	sub    $0xc,%esp
c010802e:	8d 45 d6             	lea    -0x2a(%ebp),%eax
c0108031:	50                   	push   %eax
c0108032:	e8 f5 eb ff ff       	call   c0106c2c <untar>
c0108037:	83 c4 10             	add    $0x10,%esp
c010803a:	e8 02 fe ff ff       	call   c0107e41 <simple_shell>
c010803f:	90                   	nop
c0108040:	c9                   	leave  
c0108041:	c3                   	ret    

c0108042 <test_exec>:
c0108042:	55                   	push   %ebp
c0108043:	89 e5                	mov    %esp,%ebp
c0108045:	83 ec 38             	sub    $0x38,%esp
c0108048:	83 ec 0c             	sub    $0xc,%esp
c010804b:	68 00 a8 10 c0       	push   $0xc010a800
c0108050:	e8 37 80 ff ff       	call   c010008c <disp_str>
c0108055:	83 c4 10             	add    $0x10,%esp
c0108058:	83 ec 0c             	sub    $0xc,%esp
c010805b:	68 02 a8 10 c0       	push   $0xc010a802
c0108060:	e8 27 80 ff ff       	call   c010008c <disp_str>
c0108065:	83 c4 10             	add    $0x10,%esp
c0108068:	c7 45 e6 64 65 76 5f 	movl   $0x5f766564,-0x1a(%ebp)
c010806f:	c7 45 ea 74 74 79 31 	movl   $0x31797474,-0x16(%ebp)
c0108076:	66 c7 45 ee 00 00    	movw   $0x0,-0x12(%ebp)
c010807c:	83 ec 08             	sub    $0x8,%esp
c010807f:	6a 02                	push   $0x2
c0108081:	8d 45 e6             	lea    -0x1a(%ebp),%eax
c0108084:	50                   	push   %eax
c0108085:	e8 e2 c9 ff ff       	call   c0104a6c <open>
c010808a:	83 c4 10             	add    $0x10,%esp
c010808d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108090:	c7 45 d2 69 6e 73 74 	movl   $0x74736e69,-0x2e(%ebp)
c0108097:	c7 45 d6 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x2a(%ebp)
c010809e:	c7 45 da 74 61 72 00 	movl   $0x726174,-0x26(%ebp)
c01080a5:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
c01080ac:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c01080b3:	83 ec 0c             	sub    $0xc,%esp
c01080b6:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c01080b9:	50                   	push   %eax
c01080ba:	e8 6d eb ff ff       	call   c0106c2c <untar>
c01080bf:	83 c4 10             	add    $0x10,%esp
c01080c2:	83 ec 08             	sub    $0x8,%esp
c01080c5:	6a 00                	push   $0x0
c01080c7:	68 cc ad 10 c0       	push   $0xc010adcc
c01080cc:	68 d0 ad 10 c0       	push   $0xc010add0
c01080d1:	68 4e ad 10 c0       	push   $0xc010ad4e
c01080d6:	68 49 ad 10 c0       	push   $0xc010ad49
c01080db:	68 c6 ad 10 c0       	push   $0xc010adc6
c01080e0:	e8 ba cf ff ff       	call   c010509f <execl>
c01080e5:	83 c4 20             	add    $0x20,%esp
c01080e8:	e8 1e ea ff ff       	call   c0106b0b <stop_here>
c01080ed:	e8 da cc ff ff       	call   c0104dcc <fork>
c01080f2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01080f5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c01080f9:	7e 25                	jle    c0108120 <test_exec+0xde>
c01080fb:	83 ec 0c             	sub    $0xc,%esp
c01080fe:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0108101:	50                   	push   %eax
c0108102:	e8 52 cc ff ff       	call   c0104d59 <wait>
c0108107:	83 c4 10             	add    $0x10,%esp
c010810a:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010810d:	83 ec 08             	sub    $0x8,%esp
c0108110:	50                   	push   %eax
c0108111:	68 d6 ad 10 c0       	push   $0xc010add6
c0108116:	e8 b0 01 00 00       	call   c01082cb <Printf>
c010811b:	83 c4 10             	add    $0x10,%esp
c010811e:	eb 33                	jmp    c0108153 <test_exec+0x111>
c0108120:	83 ec 0c             	sub    $0xc,%esp
c0108123:	68 e8 ad 10 c0       	push   $0xc010ade8
c0108128:	e8 9e 01 00 00       	call   c01082cb <Printf>
c010812d:	83 c4 10             	add    $0x10,%esp
c0108130:	83 ec 0c             	sub    $0xc,%esp
c0108133:	6a 00                	push   $0x0
c0108135:	68 d0 ad 10 c0       	push   $0xc010add0
c010813a:	68 4e ad 10 c0       	push   $0xc010ad4e
c010813f:	68 49 ad 10 c0       	push   $0xc010ad49
c0108144:	68 c6 ad 10 c0       	push   $0xc010adc6
c0108149:	e8 51 cf ff ff       	call   c010509f <execl>
c010814e:	83 c4 20             	add    $0x20,%esp
c0108151:	eb fe                	jmp    c0108151 <test_exec+0x10f>
c0108153:	c9                   	leave  
c0108154:	c3                   	ret    

c0108155 <INIT>:
c0108155:	55                   	push   %ebp
c0108156:	89 e5                	mov    %esp,%ebp
c0108158:	83 ec 08             	sub    $0x8,%esp
c010815b:	e8 7a fe ff ff       	call   c0107fda <test_shell>
c0108160:	eb fe                	jmp    c0108160 <INIT+0xb>

c0108162 <TestA>:
c0108162:	55                   	push   %ebp
c0108163:	89 e5                	mov    %esp,%ebp
c0108165:	83 ec 08             	sub    $0x8,%esp
c0108168:	83 ec 0c             	sub    $0xc,%esp
c010816b:	6a 05                	push   $0x5
c010816d:	e8 75 ee ff ff       	call   c0106fe7 <disp_int>
c0108172:	83 c4 10             	add    $0x10,%esp
c0108175:	83 ec 0c             	sub    $0xc,%esp
c0108178:	68 13 a9 10 c0       	push   $0xc010a913
c010817d:	e8 0a 7f ff ff       	call   c010008c <disp_str>
c0108182:	83 c4 10             	add    $0x10,%esp
c0108185:	83 ec 0c             	sub    $0xc,%esp
c0108188:	68 f6 ad 10 c0       	push   $0xc010adf6
c010818d:	e8 fa 7e ff ff       	call   c010008c <disp_str>
c0108192:	83 c4 10             	add    $0x10,%esp
c0108195:	eb fe                	jmp    c0108195 <TestA+0x33>

c0108197 <delay>:
c0108197:	55                   	push   %ebp
c0108198:	89 e5                	mov    %esp,%ebp
c010819a:	83 ec 10             	sub    $0x10,%esp
c010819d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c01081a4:	eb 2a                	jmp    c01081d0 <delay+0x39>
c01081a6:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c01081ad:	eb 17                	jmp    c01081c6 <delay+0x2f>
c01081af:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01081b6:	eb 04                	jmp    c01081bc <delay+0x25>
c01081b8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01081bc:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c01081c0:	7e f6                	jle    c01081b8 <delay+0x21>
c01081c2:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c01081c6:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
c01081ca:	7e e3                	jle    c01081af <delay+0x18>
c01081cc:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c01081d0:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01081d3:	3b 45 08             	cmp    0x8(%ebp),%eax
c01081d6:	7c ce                	jl     c01081a6 <delay+0xf>
c01081d8:	90                   	nop
c01081d9:	c9                   	leave  
c01081da:	c3                   	ret    

c01081db <TestB>:
c01081db:	55                   	push   %ebp
c01081dc:	89 e5                	mov    %esp,%ebp
c01081de:	83 ec 08             	sub    $0x8,%esp
c01081e1:	83 ec 0c             	sub    $0xc,%esp
c01081e4:	68 fd ad 10 c0       	push   $0xc010adfd
c01081e9:	e8 9e 7e ff ff       	call   c010008c <disp_str>
c01081ee:	83 c4 10             	add    $0x10,%esp
c01081f1:	eb fe                	jmp    c01081f1 <TestB+0x16>

c01081f3 <TestC>:
c01081f3:	55                   	push   %ebp
c01081f4:	89 e5                	mov    %esp,%ebp
c01081f6:	83 ec 18             	sub    $0x18,%esp
c01081f9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108200:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c0108204:	77 1a                	ja     c0108220 <TestC+0x2d>
c0108206:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
c010820d:	83 ec 08             	sub    $0x8,%esp
c0108210:	ff 75 f0             	pushl  -0x10(%ebp)
c0108213:	68 00 ae 10 c0       	push   $0xc010ae00
c0108218:	e8 ae 00 00 00       	call   c01082cb <Printf>
c010821d:	83 c4 10             	add    $0x10,%esp
c0108220:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0108224:	eb da                	jmp    c0108200 <TestC+0xd>

c0108226 <sys_get_ticks>:
c0108226:	55                   	push   %ebp
c0108227:	89 e5                	mov    %esp,%ebp
c0108229:	a1 e8 0e 11 c0       	mov    0xc0110ee8,%eax
c010822e:	8b 15 ec 0e 11 c0    	mov    0xc0110eec,%edx
c0108234:	5d                   	pop    %ebp
c0108235:	c3                   	ret    

c0108236 <sys_write>:
c0108236:	55                   	push   %ebp
c0108237:	89 e5                	mov    %esp,%ebp
c0108239:	83 ec 18             	sub    $0x18,%esp
c010823c:	8b 45 10             	mov    0x10(%ebp),%eax
c010823f:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0108245:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c010824b:	05 00 fe 10 c0       	add    $0xc010fe00,%eax
c0108250:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108253:	8b 45 0c             	mov    0xc(%ebp),%eax
c0108256:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108259:	8b 45 08             	mov    0x8(%ebp),%eax
c010825c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010825f:	eb 20                	jmp    c0108281 <sys_write+0x4b>
c0108261:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108264:	0f b6 00             	movzbl (%eax),%eax
c0108267:	0f b6 c0             	movzbl %al,%eax
c010826a:	83 ec 08             	sub    $0x8,%esp
c010826d:	50                   	push   %eax
c010826e:	ff 75 ec             	pushl  -0x14(%ebp)
c0108271:	e8 67 bb ff ff       	call   c0103ddd <out_char>
c0108276:	83 c4 10             	add    $0x10,%esp
c0108279:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c010827d:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
c0108281:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0108285:	7f da                	jg     c0108261 <sys_write+0x2b>
c0108287:	90                   	nop
c0108288:	c9                   	leave  
c0108289:	c3                   	ret    

c010828a <milli_delay>:
c010828a:	55                   	push   %ebp
c010828b:	89 e5                	mov    %esp,%ebp
c010828d:	83 ec 18             	sub    $0x18,%esp
c0108290:	e8 8a 11 00 00       	call   c010941f <get_ticks_ipc>
c0108295:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108298:	90                   	nop
c0108299:	e8 81 11 00 00       	call   c010941f <get_ticks_ipc>
c010829e:	2b 45 f4             	sub    -0xc(%ebp),%eax
c01082a1:	89 c1                	mov    %eax,%ecx
c01082a3:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
c01082a8:	89 c8                	mov    %ecx,%eax
c01082aa:	f7 ea                	imul   %edx
c01082ac:	c1 fa 05             	sar    $0x5,%edx
c01082af:	89 c8                	mov    %ecx,%eax
c01082b1:	c1 f8 1f             	sar    $0x1f,%eax
c01082b4:	29 c2                	sub    %eax,%edx
c01082b6:	89 d0                	mov    %edx,%eax
c01082b8:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
c01082be:	39 45 08             	cmp    %eax,0x8(%ebp)
c01082c1:	77 d6                	ja     c0108299 <milli_delay+0xf>
c01082c3:	90                   	nop
c01082c4:	c9                   	leave  
c01082c5:	c3                   	ret    

c01082c6 <TaskSys>:
c01082c6:	55                   	push   %ebp
c01082c7:	89 e5                	mov    %esp,%ebp
c01082c9:	eb fe                	jmp    c01082c9 <TaskSys+0x3>

c01082cb <Printf>:
c01082cb:	55                   	push   %ebp
c01082cc:	89 e5                	mov    %esp,%ebp
c01082ce:	81 ec 18 01 00 00    	sub    $0x118,%esp
c01082d4:	83 ec 04             	sub    $0x4,%esp
c01082d7:	68 00 01 00 00       	push   $0x100
c01082dc:	6a 00                	push   $0x0
c01082de:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c01082e4:	50                   	push   %eax
c01082e5:	e8 81 2f 00 00       	call   c010b26b <Memset>
c01082ea:	83 c4 10             	add    $0x10,%esp
c01082ed:	8d 45 0c             	lea    0xc(%ebp),%eax
c01082f0:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01082f3:	8b 45 08             	mov    0x8(%ebp),%eax
c01082f6:	83 ec 04             	sub    $0x4,%esp
c01082f9:	ff 75 f4             	pushl  -0xc(%ebp)
c01082fc:	50                   	push   %eax
c01082fd:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108303:	50                   	push   %eax
c0108304:	e8 20 00 00 00       	call   c0108329 <vsprintf>
c0108309:	83 c4 10             	add    $0x10,%esp
c010830c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010830f:	83 ec 04             	sub    $0x4,%esp
c0108312:	ff 75 f0             	pushl  -0x10(%ebp)
c0108315:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c010831b:	50                   	push   %eax
c010831c:	6a 00                	push   $0x0
c010831e:	e8 5f c9 ff ff       	call   c0104c82 <write>
c0108323:	83 c4 10             	add    $0x10,%esp
c0108326:	90                   	nop
c0108327:	c9                   	leave  
c0108328:	c3                   	ret    

c0108329 <vsprintf>:
c0108329:	55                   	push   %ebp
c010832a:	89 e5                	mov    %esp,%ebp
c010832c:	81 ec 68 02 00 00    	sub    $0x268,%esp
c0108332:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0108338:	89 85 e4 fd ff ff    	mov    %eax,-0x21c(%ebp)
c010833e:	83 ec 04             	sub    $0x4,%esp
c0108341:	6a 40                	push   $0x40
c0108343:	6a 00                	push   $0x0
c0108345:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c010834b:	50                   	push   %eax
c010834c:	e8 1a 2f 00 00       	call   c010b26b <Memset>
c0108351:	83 c4 10             	add    $0x10,%esp
c0108354:	8b 45 10             	mov    0x10(%ebp),%eax
c0108357:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010835a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0108361:	8b 45 08             	mov    0x8(%ebp),%eax
c0108364:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108367:	e9 53 01 00 00       	jmp    c01084bf <vsprintf+0x196>
c010836c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010836f:	0f b6 00             	movzbl (%eax),%eax
c0108372:	3c 25                	cmp    $0x25,%al
c0108374:	74 16                	je     c010838c <vsprintf+0x63>
c0108376:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108379:	8d 50 01             	lea    0x1(%eax),%edx
c010837c:	89 55 f4             	mov    %edx,-0xc(%ebp)
c010837f:	8b 55 0c             	mov    0xc(%ebp),%edx
c0108382:	0f b6 12             	movzbl (%edx),%edx
c0108385:	88 10                	mov    %dl,(%eax)
c0108387:	e9 2f 01 00 00       	jmp    c01084bb <vsprintf+0x192>
c010838c:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c0108390:	8b 45 0c             	mov    0xc(%ebp),%eax
c0108393:	0f b6 00             	movzbl (%eax),%eax
c0108396:	0f be c0             	movsbl %al,%eax
c0108399:	83 f8 64             	cmp    $0x64,%eax
c010839c:	74 26                	je     c01083c4 <vsprintf+0x9b>
c010839e:	83 f8 64             	cmp    $0x64,%eax
c01083a1:	7f 0e                	jg     c01083b1 <vsprintf+0x88>
c01083a3:	83 f8 63             	cmp    $0x63,%eax
c01083a6:	0f 84 f2 00 00 00    	je     c010849e <vsprintf+0x175>
c01083ac:	e9 0a 01 00 00       	jmp    c01084bb <vsprintf+0x192>
c01083b1:	83 f8 73             	cmp    $0x73,%eax
c01083b4:	0f 84 b0 00 00 00    	je     c010846a <vsprintf+0x141>
c01083ba:	83 f8 78             	cmp    $0x78,%eax
c01083bd:	74 5d                	je     c010841c <vsprintf+0xf3>
c01083bf:	e9 f7 00 00 00       	jmp    c01084bb <vsprintf+0x192>
c01083c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01083c7:	8b 00                	mov    (%eax),%eax
c01083c9:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01083cc:	83 ec 04             	sub    $0x4,%esp
c01083cf:	6a 0a                	push   $0xa
c01083d1:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c01083d7:	50                   	push   %eax
c01083d8:	ff 75 e8             	pushl  -0x18(%ebp)
c01083db:	e8 96 10 00 00       	call   c0109476 <itoa>
c01083e0:	83 c4 10             	add    $0x10,%esp
c01083e3:	83 ec 08             	sub    $0x8,%esp
c01083e6:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c01083ec:	50                   	push   %eax
c01083ed:	ff 75 f4             	pushl  -0xc(%ebp)
c01083f0:	e8 95 2e 00 00       	call   c010b28a <Strcpy>
c01083f5:	83 c4 10             	add    $0x10,%esp
c01083f8:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c01083fc:	83 ec 0c             	sub    $0xc,%esp
c01083ff:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0108405:	50                   	push   %eax
c0108406:	e8 99 2e 00 00       	call   c010b2a4 <Strlen>
c010840b:	83 c4 10             	add    $0x10,%esp
c010840e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108411:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0108414:	01 45 f4             	add    %eax,-0xc(%ebp)
c0108417:	e9 9f 00 00 00       	jmp    c01084bb <vsprintf+0x192>
c010841c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010841f:	8b 00                	mov    (%eax),%eax
c0108421:	83 ec 08             	sub    $0x8,%esp
c0108424:	50                   	push   %eax
c0108425:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c010842b:	50                   	push   %eax
c010842c:	e8 10 eb ff ff       	call   c0106f41 <atoi>
c0108431:	83 c4 10             	add    $0x10,%esp
c0108434:	83 ec 08             	sub    $0x8,%esp
c0108437:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c010843d:	50                   	push   %eax
c010843e:	ff 75 f4             	pushl  -0xc(%ebp)
c0108441:	e8 44 2e 00 00       	call   c010b28a <Strcpy>
c0108446:	83 c4 10             	add    $0x10,%esp
c0108449:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c010844d:	83 ec 0c             	sub    $0xc,%esp
c0108450:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0108456:	50                   	push   %eax
c0108457:	e8 48 2e 00 00       	call   c010b2a4 <Strlen>
c010845c:	83 c4 10             	add    $0x10,%esp
c010845f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108462:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0108465:	01 45 f4             	add    %eax,-0xc(%ebp)
c0108468:	eb 51                	jmp    c01084bb <vsprintf+0x192>
c010846a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010846d:	8b 00                	mov    (%eax),%eax
c010846f:	83 ec 08             	sub    $0x8,%esp
c0108472:	50                   	push   %eax
c0108473:	ff 75 f4             	pushl  -0xc(%ebp)
c0108476:	e8 0f 2e 00 00       	call   c010b28a <Strcpy>
c010847b:	83 c4 10             	add    $0x10,%esp
c010847e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108481:	8b 00                	mov    (%eax),%eax
c0108483:	83 ec 0c             	sub    $0xc,%esp
c0108486:	50                   	push   %eax
c0108487:	e8 18 2e 00 00       	call   c010b2a4 <Strlen>
c010848c:	83 c4 10             	add    $0x10,%esp
c010848f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108492:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0108496:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0108499:	01 45 f4             	add    %eax,-0xc(%ebp)
c010849c:	eb 1d                	jmp    c01084bb <vsprintf+0x192>
c010849e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01084a1:	0f b6 10             	movzbl (%eax),%edx
c01084a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01084a7:	88 10                	mov    %dl,(%eax)
c01084a9:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c01084ad:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c01084b4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01084b7:	01 45 f4             	add    %eax,-0xc(%ebp)
c01084ba:	90                   	nop
c01084bb:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c01084bf:	8b 45 0c             	mov    0xc(%ebp),%eax
c01084c2:	0f b6 00             	movzbl (%eax),%eax
c01084c5:	84 c0                	test   %al,%al
c01084c7:	0f 85 9f fe ff ff    	jne    c010836c <vsprintf+0x43>
c01084cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01084d0:	2b 45 08             	sub    0x8(%ebp),%eax
c01084d3:	c9                   	leave  
c01084d4:	c3                   	ret    

c01084d5 <printx>:
c01084d5:	55                   	push   %ebp
c01084d6:	89 e5                	mov    %esp,%ebp
c01084d8:	81 ec 18 01 00 00    	sub    $0x118,%esp
c01084de:	8d 45 0c             	lea    0xc(%ebp),%eax
c01084e1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01084e4:	8b 45 08             	mov    0x8(%ebp),%eax
c01084e7:	83 ec 04             	sub    $0x4,%esp
c01084ea:	ff 75 f4             	pushl  -0xc(%ebp)
c01084ed:	50                   	push   %eax
c01084ee:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c01084f4:	50                   	push   %eax
c01084f5:	e8 2f fe ff ff       	call   c0108329 <vsprintf>
c01084fa:	83 c4 10             	add    $0x10,%esp
c01084fd:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108500:	83 ec 08             	sub    $0x8,%esp
c0108503:	ff 75 f0             	pushl  -0x10(%ebp)
c0108506:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c010850c:	50                   	push   %eax
c010850d:	e8 2e 90 ff ff       	call   c0101540 <write_debug>
c0108512:	83 c4 10             	add    $0x10,%esp
c0108515:	90                   	nop
c0108516:	c9                   	leave  
c0108517:	c3                   	ret    

c0108518 <sys_printx>:
c0108518:	55                   	push   %ebp
c0108519:	89 e5                	mov    %esp,%ebp
c010851b:	83 ec 28             	sub    $0x28,%esp
c010851e:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c0108523:	85 c0                	test   %eax,%eax
c0108525:	75 15                	jne    c010853c <sys_printx+0x24>
c0108527:	8b 45 10             	mov    0x10(%ebp),%eax
c010852a:	8b 80 80 02 00 00    	mov    0x280(%eax),%eax
c0108530:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108533:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010853a:	eb 10                	jmp    c010854c <sys_printx+0x34>
c010853c:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c0108541:	85 c0                	test   %eax,%eax
c0108543:	74 07                	je     c010854c <sys_printx+0x34>
c0108545:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010854c:	8b 55 08             	mov    0x8(%ebp),%edx
c010854f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108552:	01 d0                	add    %edx,%eax
c0108554:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0108557:	8b 45 10             	mov    0x10(%ebp),%eax
c010855a:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0108560:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0108566:	05 00 fe 10 c0       	add    $0xc010fe00,%eax
c010856b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010856e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108571:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108574:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108577:	0f b6 00             	movzbl (%eax),%eax
c010857a:	88 45 e3             	mov    %al,-0x1d(%ebp)
c010857d:	eb 3a                	jmp    c01085b9 <sys_printx+0xa1>
c010857f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108582:	0f b6 00             	movzbl (%eax),%eax
c0108585:	3c 3b                	cmp    $0x3b,%al
c0108587:	74 0a                	je     c0108593 <sys_printx+0x7b>
c0108589:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010858c:	0f b6 00             	movzbl (%eax),%eax
c010858f:	3c 3a                	cmp    $0x3a,%al
c0108591:	75 06                	jne    c0108599 <sys_printx+0x81>
c0108593:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0108597:	eb 20                	jmp    c01085b9 <sys_printx+0xa1>
c0108599:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010859c:	0f b6 00             	movzbl (%eax),%eax
c010859f:	0f b6 c0             	movzbl %al,%eax
c01085a2:	83 ec 08             	sub    $0x8,%esp
c01085a5:	50                   	push   %eax
c01085a6:	ff 75 e4             	pushl  -0x1c(%ebp)
c01085a9:	e8 2f b8 ff ff       	call   c0103ddd <out_char>
c01085ae:	83 c4 10             	add    $0x10,%esp
c01085b1:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01085b5:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c01085b9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01085bd:	7f c0                	jg     c010857f <sys_printx+0x67>
c01085bf:	80 7d e3 3b          	cmpb   $0x3b,-0x1d(%ebp)
c01085c3:	75 10                	jne    c01085d5 <sys_printx+0xbd>
c01085c5:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c01085ca:	85 c0                	test   %eax,%eax
c01085cc:	74 13                	je     c01085e1 <sys_printx+0xc9>
c01085ce:	e8 f4 7c ff ff       	call   c01002c7 <disable_int>
c01085d3:	eb 0c                	jmp    c01085e1 <sys_printx+0xc9>
c01085d5:	80 7d e3 3a          	cmpb   $0x3a,-0x1d(%ebp)
c01085d9:	75 06                	jne    c01085e1 <sys_printx+0xc9>
c01085db:	e8 e7 7c ff ff       	call   c01002c7 <disable_int>
c01085e0:	90                   	nop
c01085e1:	90                   	nop
c01085e2:	c9                   	leave  
c01085e3:	c3                   	ret    

c01085e4 <spin>:
c01085e4:	55                   	push   %ebp
c01085e5:	89 e5                	mov    %esp,%ebp
c01085e7:	83 ec 08             	sub    $0x8,%esp
c01085ea:	83 ec 0c             	sub    $0xc,%esp
c01085ed:	ff 75 08             	pushl  0x8(%ebp)
c01085f0:	e8 97 7a ff ff       	call   c010008c <disp_str>
c01085f5:	83 c4 10             	add    $0x10,%esp
c01085f8:	83 ec 0c             	sub    $0xc,%esp
c01085fb:	68 13 a9 10 c0       	push   $0xc010a913
c0108600:	e8 87 7a ff ff       	call   c010008c <disp_str>
c0108605:	83 c4 10             	add    $0x10,%esp
c0108608:	eb fe                	jmp    c0108608 <spin+0x24>

c010860a <panic>:
c010860a:	55                   	push   %ebp
c010860b:	89 e5                	mov    %esp,%ebp
c010860d:	83 ec 08             	sub    $0x8,%esp
c0108610:	83 ec 04             	sub    $0x4,%esp
c0108613:	ff 75 08             	pushl  0x8(%ebp)
c0108616:	6a 3a                	push   $0x3a
c0108618:	68 0d ae 10 c0       	push   $0xc010ae0d
c010861d:	e8 b3 fe ff ff       	call   c01084d5 <printx>
c0108622:	83 c4 10             	add    $0x10,%esp
c0108625:	90                   	nop
c0108626:	c9                   	leave  
c0108627:	c3                   	ret    

c0108628 <assertion_failure>:
c0108628:	55                   	push   %ebp
c0108629:	89 e5                	mov    %esp,%ebp
c010862b:	83 ec 08             	sub    $0x8,%esp
c010862e:	83 ec 08             	sub    $0x8,%esp
c0108631:	ff 75 14             	pushl  0x14(%ebp)
c0108634:	ff 75 10             	pushl  0x10(%ebp)
c0108637:	ff 75 0c             	pushl  0xc(%ebp)
c010863a:	ff 75 08             	pushl  0x8(%ebp)
c010863d:	6a 3b                	push   $0x3b
c010863f:	68 14 ae 10 c0       	push   $0xc010ae14
c0108644:	e8 8c fe ff ff       	call   c01084d5 <printx>
c0108649:	83 c4 20             	add    $0x20,%esp
c010864c:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0108653:	00 00 00 
c0108656:	83 ec 0c             	sub    $0xc,%esp
c0108659:	68 00 a8 10 c0       	push   $0xc010a800
c010865e:	e8 29 7a ff ff       	call   c010008c <disp_str>
c0108663:	83 c4 10             	add    $0x10,%esp
c0108666:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c010866b:	83 ec 0c             	sub    $0xc,%esp
c010866e:	50                   	push   %eax
c010866f:	e8 73 e9 ff ff       	call   c0106fe7 <disp_int>
c0108674:	83 c4 10             	add    $0x10,%esp
c0108677:	83 ec 0c             	sub    $0xc,%esp
c010867a:	68 02 a8 10 c0       	push   $0xc010a802
c010867f:	e8 08 7a ff ff       	call   c010008c <disp_str>
c0108684:	83 c4 10             	add    $0x10,%esp
c0108687:	83 ec 0c             	sub    $0xc,%esp
c010868a:	68 47 ae 10 c0       	push   $0xc010ae47
c010868f:	e8 50 ff ff ff       	call   c01085e4 <spin>
c0108694:	83 c4 10             	add    $0x10,%esp
c0108697:	90                   	nop
c0108698:	c9                   	leave  
c0108699:	c3                   	ret    

c010869a <assertion_failure2>:
c010869a:	55                   	push   %ebp
c010869b:	89 e5                	mov    %esp,%ebp
c010869d:	83 ec 08             	sub    $0x8,%esp
c01086a0:	83 ec 04             	sub    $0x4,%esp
c01086a3:	ff 75 18             	pushl  0x18(%ebp)
c01086a6:	ff 75 14             	pushl  0x14(%ebp)
c01086a9:	ff 75 10             	pushl  0x10(%ebp)
c01086ac:	ff 75 0c             	pushl  0xc(%ebp)
c01086af:	ff 75 08             	pushl  0x8(%ebp)
c01086b2:	6a 3b                	push   $0x3b
c01086b4:	68 54 ae 10 c0       	push   $0xc010ae54
c01086b9:	e8 17 fe ff ff       	call   c01084d5 <printx>
c01086be:	83 c4 20             	add    $0x20,%esp
c01086c1:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c01086c8:	00 00 00 
c01086cb:	83 ec 0c             	sub    $0xc,%esp
c01086ce:	68 00 a8 10 c0       	push   $0xc010a800
c01086d3:	e8 b4 79 ff ff       	call   c010008c <disp_str>
c01086d8:	83 c4 10             	add    $0x10,%esp
c01086db:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c01086e0:	83 ec 0c             	sub    $0xc,%esp
c01086e3:	50                   	push   %eax
c01086e4:	e8 fe e8 ff ff       	call   c0106fe7 <disp_int>
c01086e9:	83 c4 10             	add    $0x10,%esp
c01086ec:	83 ec 0c             	sub    $0xc,%esp
c01086ef:	68 02 a8 10 c0       	push   $0xc010a802
c01086f4:	e8 93 79 ff ff       	call   c010008c <disp_str>
c01086f9:	83 c4 10             	add    $0x10,%esp
c01086fc:	83 ec 0c             	sub    $0xc,%esp
c01086ff:	68 47 ae 10 c0       	push   $0xc010ae47
c0108704:	e8 db fe ff ff       	call   c01085e4 <spin>
c0108709:	83 c4 10             	add    $0x10,%esp
c010870c:	90                   	nop
c010870d:	c9                   	leave  
c010870e:	c3                   	ret    

c010870f <dead_lock>:
c010870f:	55                   	push   %ebp
c0108710:	89 e5                	mov    %esp,%ebp
c0108712:	b8 00 00 00 00       	mov    $0x0,%eax
c0108717:	5d                   	pop    %ebp
c0108718:	c3                   	ret    

c0108719 <sys_send_msg>:
c0108719:	55                   	push   %ebp
c010871a:	89 e5                	mov    %esp,%ebp
c010871c:	83 ec 58             	sub    $0x58,%esp
c010871f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0108726:	83 ec 0c             	sub    $0xc,%esp
c0108729:	ff 75 0c             	pushl  0xc(%ebp)
c010872c:	e8 25 b0 ff ff       	call   c0103756 <pid2proc>
c0108731:	83 c4 10             	add    $0x10,%esp
c0108734:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0108737:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c010873b:	74 2c                	je     c0108769 <sys_send_msg+0x50>
c010873d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108740:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c0108746:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c010874b:	74 1c                	je     c0108769 <sys_send_msg+0x50>
c010874d:	68 25 05 00 00       	push   $0x525
c0108752:	68 54 ad 10 c0       	push   $0xc010ad54
c0108757:	68 54 ad 10 c0       	push   $0xc010ad54
c010875c:	68 94 ae 10 c0       	push   $0xc010ae94
c0108761:	e8 c2 fe ff ff       	call   c0108628 <assertion_failure>
c0108766:	83 c4 10             	add    $0x10,%esp
c0108769:	8b 45 10             	mov    0x10(%ebp),%eax
c010876c:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c0108772:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0108777:	74 1c                	je     c0108795 <sys_send_msg+0x7c>
c0108779:	68 27 05 00 00       	push   $0x527
c010877e:	68 54 ad 10 c0       	push   $0xc010ad54
c0108783:	68 54 ad 10 c0       	push   $0xc010ad54
c0108788:	68 bc ae 10 c0       	push   $0xc010aebc
c010878d:	e8 96 fe ff ff       	call   c0108628 <assertion_failure>
c0108792:	83 c4 10             	add    $0x10,%esp
c0108795:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0108799:	75 22                	jne    c01087bd <sys_send_msg+0xa4>
c010879b:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c010879f:	75 1c                	jne    c01087bd <sys_send_msg+0xa4>
c01087a1:	68 2a 05 00 00       	push   $0x52a
c01087a6:	68 54 ad 10 c0       	push   $0xc010ad54
c01087ab:	68 54 ad 10 c0       	push   $0xc010ad54
c01087b0:	68 df ae 10 c0       	push   $0xc010aedf
c01087b5:	e8 6e fe ff ff       	call   c0108628 <assertion_failure>
c01087ba:	83 c4 10             	add    $0x10,%esp
c01087bd:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01087c0:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01087c7:	84 c0                	test   %al,%al
c01087c9:	74 65                	je     c0108830 <sys_send_msg+0x117>
c01087cb:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01087ce:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01087d5:	3c 01                	cmp    $0x1,%al
c01087d7:	74 57                	je     c0108830 <sys_send_msg+0x117>
c01087d9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01087dc:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01087e3:	3c 02                	cmp    $0x2,%al
c01087e5:	74 49                	je     c0108830 <sys_send_msg+0x117>
c01087e7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01087ea:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01087f1:	3c 03                	cmp    $0x3,%al
c01087f3:	74 3b                	je     c0108830 <sys_send_msg+0x117>
c01087f5:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01087f8:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01087ff:	3c 04                	cmp    $0x4,%al
c0108801:	74 2d                	je     c0108830 <sys_send_msg+0x117>
c0108803:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108806:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010880d:	0f be c0             	movsbl %al,%eax
c0108810:	83 ec 0c             	sub    $0xc,%esp
c0108813:	68 2e 05 00 00       	push   $0x52e
c0108818:	68 54 ad 10 c0       	push   $0xc010ad54
c010881d:	68 54 ad 10 c0       	push   $0xc010ad54
c0108822:	50                   	push   %eax
c0108823:	68 f0 ae 10 c0       	push   $0xc010aef0
c0108828:	e8 6d fe ff ff       	call   c010869a <assertion_failure2>
c010882d:	83 c4 20             	add    $0x20,%esp
c0108830:	8b 45 10             	mov    0x10(%ebp),%eax
c0108833:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010883a:	84 c0                	test   %al,%al
c010883c:	74 65                	je     c01088a3 <sys_send_msg+0x18a>
c010883e:	8b 45 10             	mov    0x10(%ebp),%eax
c0108841:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108848:	3c 01                	cmp    $0x1,%al
c010884a:	74 57                	je     c01088a3 <sys_send_msg+0x18a>
c010884c:	8b 45 10             	mov    0x10(%ebp),%eax
c010884f:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108856:	3c 02                	cmp    $0x2,%al
c0108858:	74 49                	je     c01088a3 <sys_send_msg+0x18a>
c010885a:	8b 45 10             	mov    0x10(%ebp),%eax
c010885d:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108864:	3c 03                	cmp    $0x3,%al
c0108866:	74 3b                	je     c01088a3 <sys_send_msg+0x18a>
c0108868:	8b 45 10             	mov    0x10(%ebp),%eax
c010886b:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108872:	3c 04                	cmp    $0x4,%al
c0108874:	74 2d                	je     c01088a3 <sys_send_msg+0x18a>
c0108876:	8b 45 10             	mov    0x10(%ebp),%eax
c0108879:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108880:	0f be c0             	movsbl %al,%eax
c0108883:	83 ec 0c             	sub    $0xc,%esp
c0108886:	68 31 05 00 00       	push   $0x531
c010888b:	68 54 ad 10 c0       	push   $0xc010ad54
c0108890:	68 54 ad 10 c0       	push   $0xc010ad54
c0108895:	50                   	push   %eax
c0108896:	68 8c af 10 c0       	push   $0xc010af8c
c010889b:	e8 fa fd ff ff       	call   c010869a <assertion_failure2>
c01088a0:	83 c4 20             	add    $0x20,%esp
c01088a3:	83 ec 0c             	sub    $0xc,%esp
c01088a6:	ff 75 10             	pushl  0x10(%ebp)
c01088a9:	e8 2e af ff ff       	call   c01037dc <proc2pid>
c01088ae:	83 c4 10             	add    $0x10,%esp
c01088b1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01088b4:	c7 45 e0 7c 00 00 00 	movl   $0x7c,-0x20(%ebp)
c01088bb:	8b 45 08             	mov    0x8(%ebp),%eax
c01088be:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01088c1:	83 ec 08             	sub    $0x8,%esp
c01088c4:	ff 75 e4             	pushl  -0x1c(%ebp)
c01088c7:	ff 75 dc             	pushl  -0x24(%ebp)
c01088ca:	e8 90 d5 ff ff       	call   c0105e5f <get_physical_address_proc>
c01088cf:	83 c4 10             	add    $0x10,%esp
c01088d2:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01088d5:	83 ec 08             	sub    $0x8,%esp
c01088d8:	ff 75 e0             	pushl  -0x20(%ebp)
c01088db:	ff 75 d8             	pushl  -0x28(%ebp)
c01088de:	e8 a9 d4 ff ff       	call   c0105d8c <alloc_virtual_memory>
c01088e3:	83 c4 10             	add    $0x10,%esp
c01088e6:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01088e9:	8b 45 10             	mov    0x10(%ebp),%eax
c01088ec:	8b 80 80 02 00 00    	mov    0x280(%eax),%eax
c01088f2:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01088f5:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c01088fc:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01088ff:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0108902:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0108905:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0108908:	89 10                	mov    %edx,(%eax)
c010890a:	83 ec 08             	sub    $0x8,%esp
c010890d:	ff 75 0c             	pushl  0xc(%ebp)
c0108910:	ff 75 e4             	pushl  -0x1c(%ebp)
c0108913:	e8 f7 fd ff ff       	call   c010870f <dead_lock>
c0108918:	83 c4 10             	add    $0x10,%esp
c010891b:	83 f8 01             	cmp    $0x1,%eax
c010891e:	75 10                	jne    c0108930 <sys_send_msg+0x217>
c0108920:	83 ec 0c             	sub    $0xc,%esp
c0108923:	68 1c b0 10 c0       	push   $0xc010b01c
c0108928:	e8 dd fc ff ff       	call   c010860a <panic>
c010892d:	83 c4 10             	add    $0x10,%esp
c0108930:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108933:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010893a:	3c 02                	cmp    $0x2,%al
c010893c:	0f 85 ca 01 00 00    	jne    c0108b0c <sys_send_msg+0x3f3>
c0108942:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108945:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c010894b:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c010894e:	74 12                	je     c0108962 <sys_send_msg+0x249>
c0108950:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108953:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0108959:	83 f8 12             	cmp    $0x12,%eax
c010895c:	0f 85 aa 01 00 00    	jne    c0108b0c <sys_send_msg+0x3f3>
c0108962:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108965:	8b 80 80 02 00 00    	mov    0x280(%eax),%eax
c010896b:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c010896e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108971:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0108977:	89 45 c0             	mov    %eax,-0x40(%ebp)
c010897a:	83 ec 08             	sub    $0x8,%esp
c010897d:	ff 75 0c             	pushl  0xc(%ebp)
c0108980:	ff 75 c0             	pushl  -0x40(%ebp)
c0108983:	e8 d7 d4 ff ff       	call   c0105e5f <get_physical_address_proc>
c0108988:	83 c4 10             	add    $0x10,%esp
c010898b:	89 45 bc             	mov    %eax,-0x44(%ebp)
c010898e:	83 ec 08             	sub    $0x8,%esp
c0108991:	ff 75 e0             	pushl  -0x20(%ebp)
c0108994:	ff 75 bc             	pushl  -0x44(%ebp)
c0108997:	e8 f0 d3 ff ff       	call   c0105d8c <alloc_virtual_memory>
c010899c:	83 c4 10             	add    $0x10,%esp
c010899f:	89 45 b8             	mov    %eax,-0x48(%ebp)
c01089a2:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c01089a5:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c01089a8:	8b 45 b8             	mov    -0x48(%ebp),%eax
c01089ab:	83 ec 04             	sub    $0x4,%esp
c01089ae:	51                   	push   %ecx
c01089af:	52                   	push   %edx
c01089b0:	50                   	push   %eax
c01089b1:	e8 43 e2 ff ff       	call   c0106bf9 <Memcpy>
c01089b6:	83 c4 10             	add    $0x10,%esp
c01089b9:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c01089be:	3d 41 05 00 00       	cmp    $0x541,%eax
c01089c3:	75 0a                	jne    c01089cf <sys_send_msg+0x2b6>
c01089c5:	c7 05 a0 f7 10 c0 04 	movl   $0x4,0xc010f7a0
c01089cc:	00 00 00 
c01089cf:	8b 45 10             	mov    0x10(%ebp),%eax
c01089d2:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c01089d9:	00 00 00 
c01089dc:	8b 45 10             	mov    0x10(%ebp),%eax
c01089df:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c01089e6:	8b 45 10             	mov    0x10(%ebp),%eax
c01089e9:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c01089f0:	00 00 00 
c01089f3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01089f6:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c01089fd:	00 00 00 
c0108a00:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108a03:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0108a0a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108a0d:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c0108a14:	00 00 00 
c0108a17:	8b 45 10             	mov    0x10(%ebp),%eax
c0108a1a:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c0108a21:	00 00 00 
c0108a24:	83 ec 0c             	sub    $0xc,%esp
c0108a27:	ff 75 e8             	pushl  -0x18(%ebp)
c0108a2a:	e8 a0 09 00 00       	call   c01093cf <unblock>
c0108a2f:	83 c4 10             	add    $0x10,%esp
c0108a32:	8b 45 10             	mov    0x10(%ebp),%eax
c0108a35:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108a3c:	84 c0                	test   %al,%al
c0108a3e:	74 1c                	je     c0108a5c <sys_send_msg+0x343>
c0108a40:	68 69 05 00 00       	push   $0x569
c0108a45:	68 54 ad 10 c0       	push   $0xc010ad54
c0108a4a:	68 54 ad 10 c0       	push   $0xc010ad54
c0108a4f:	68 27 b0 10 c0       	push   $0xc010b027
c0108a54:	e8 cf fb ff ff       	call   c0108628 <assertion_failure>
c0108a59:	83 c4 10             	add    $0x10,%esp
c0108a5c:	8b 45 10             	mov    0x10(%ebp),%eax
c0108a5f:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c0108a65:	83 f8 21             	cmp    $0x21,%eax
c0108a68:	74 1c                	je     c0108a86 <sys_send_msg+0x36d>
c0108a6a:	68 6a 05 00 00       	push   $0x56a
c0108a6f:	68 54 ad 10 c0       	push   $0xc010ad54
c0108a74:	68 54 ad 10 c0       	push   $0xc010ad54
c0108a79:	68 3b b0 10 c0       	push   $0xc010b03b
c0108a7e:	e8 a5 fb ff ff       	call   c0108628 <assertion_failure>
c0108a83:	83 c4 10             	add    $0x10,%esp
c0108a86:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108a89:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0108a8f:	85 c0                	test   %eax,%eax
c0108a91:	74 1c                	je     c0108aaf <sys_send_msg+0x396>
c0108a93:	68 6c 05 00 00       	push   $0x56c
c0108a98:	68 54 ad 10 c0       	push   $0xc010ad54
c0108a9d:	68 54 ad 10 c0       	push   $0xc010ad54
c0108aa2:	68 58 b0 10 c0       	push   $0xc010b058
c0108aa7:	e8 7c fb ff ff       	call   c0108628 <assertion_failure>
c0108aac:	83 c4 10             	add    $0x10,%esp
c0108aaf:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108ab2:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108ab9:	84 c0                	test   %al,%al
c0108abb:	74 1c                	je     c0108ad9 <sys_send_msg+0x3c0>
c0108abd:	68 6d 05 00 00       	push   $0x56d
c0108ac2:	68 54 ad 10 c0       	push   $0xc010ad54
c0108ac7:	68 54 ad 10 c0       	push   $0xc010ad54
c0108acc:	68 6d b0 10 c0       	push   $0xc010b06d
c0108ad1:	e8 52 fb ff ff       	call   c0108628 <assertion_failure>
c0108ad6:	83 c4 10             	add    $0x10,%esp
c0108ad9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108adc:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0108ae2:	83 f8 21             	cmp    $0x21,%eax
c0108ae5:	0f 84 45 01 00 00    	je     c0108c30 <sys_send_msg+0x517>
c0108aeb:	68 6e 05 00 00       	push   $0x56e
c0108af0:	68 54 ad 10 c0       	push   $0xc010ad54
c0108af5:	68 54 ad 10 c0       	push   $0xc010ad54
c0108afa:	68 84 b0 10 c0       	push   $0xc010b084
c0108aff:	e8 24 fb ff ff       	call   c0108628 <assertion_failure>
c0108b04:	83 c4 10             	add    $0x10,%esp
c0108b07:	e9 24 01 00 00       	jmp    c0108c30 <sys_send_msg+0x517>
c0108b0c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108b13:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108b16:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0108b19:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108b1c:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0108b22:	85 c0                	test   %eax,%eax
c0108b24:	75 1b                	jne    c0108b41 <sys_send_msg+0x428>
c0108b26:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108b29:	8b 55 10             	mov    0x10(%ebp),%edx
c0108b2c:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c0108b32:	8b 45 10             	mov    0x10(%ebp),%eax
c0108b35:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c0108b3c:	00 00 00 
c0108b3f:	eb 3f                	jmp    c0108b80 <sys_send_msg+0x467>
c0108b41:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108b44:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0108b4a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108b4d:	eb 12                	jmp    c0108b61 <sys_send_msg+0x448>
c0108b4f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108b52:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108b55:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108b58:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0108b5e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108b61:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0108b65:	75 e8                	jne    c0108b4f <sys_send_msg+0x436>
c0108b67:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108b6a:	8b 55 10             	mov    0x10(%ebp),%edx
c0108b6d:	89 90 50 02 00 00    	mov    %edx,0x250(%eax)
c0108b73:	8b 45 10             	mov    0x10(%ebp),%eax
c0108b76:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c0108b7d:	00 00 00 
c0108b80:	8b 45 10             	mov    0x10(%ebp),%eax
c0108b83:	8b 55 08             	mov    0x8(%ebp),%edx
c0108b86:	89 90 40 02 00 00    	mov    %edx,0x240(%eax)
c0108b8c:	8b 45 10             	mov    0x10(%ebp),%eax
c0108b8f:	8b 55 0c             	mov    0xc(%ebp),%edx
c0108b92:	89 90 44 02 00 00    	mov    %edx,0x244(%eax)
c0108b98:	8b 45 10             	mov    0x10(%ebp),%eax
c0108b9b:	c6 80 3c 02 00 00 01 	movb   $0x1,0x23c(%eax)
c0108ba2:	8b 45 10             	mov    0x10(%ebp),%eax
c0108ba5:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108bac:	3c 01                	cmp    $0x1,%al
c0108bae:	74 1c                	je     c0108bcc <sys_send_msg+0x4b3>
c0108bb0:	68 90 05 00 00       	push   $0x590
c0108bb5:	68 54 ad 10 c0       	push   $0xc010ad54
c0108bba:	68 54 ad 10 c0       	push   $0xc010ad54
c0108bbf:	68 a8 b0 10 c0       	push   $0xc010b0a8
c0108bc4:	e8 5f fa ff ff       	call   c0108628 <assertion_failure>
c0108bc9:	83 c4 10             	add    $0x10,%esp
c0108bcc:	8b 45 10             	mov    0x10(%ebp),%eax
c0108bcf:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c0108bd5:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0108bd8:	74 1c                	je     c0108bf6 <sys_send_msg+0x4dd>
c0108bda:	68 91 05 00 00       	push   $0x591
c0108bdf:	68 54 ad 10 c0       	push   $0xc010ad54
c0108be4:	68 54 ad 10 c0       	push   $0xc010ad54
c0108be9:	68 c4 b0 10 c0       	push   $0xc010b0c4
c0108bee:	e8 35 fa ff ff       	call   c0108628 <assertion_failure>
c0108bf3:	83 c4 10             	add    $0x10,%esp
c0108bf6:	8b 45 10             	mov    0x10(%ebp),%eax
c0108bf9:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0108bff:	39 45 08             	cmp    %eax,0x8(%ebp)
c0108c02:	74 1c                	je     c0108c20 <sys_send_msg+0x507>
c0108c04:	68 92 05 00 00       	push   $0x592
c0108c09:	68 54 ad 10 c0       	push   $0xc010ad54
c0108c0e:	68 54 ad 10 c0       	push   $0xc010ad54
c0108c13:	68 e6 b0 10 c0       	push   $0xc010b0e6
c0108c18:	e8 0b fa ff ff       	call   c0108628 <assertion_failure>
c0108c1d:	83 c4 10             	add    $0x10,%esp
c0108c20:	83 ec 0c             	sub    $0xc,%esp
c0108c23:	ff 75 10             	pushl  0x10(%ebp)
c0108c26:	e8 68 07 00 00       	call   c0109393 <block>
c0108c2b:	83 c4 10             	add    $0x10,%esp
c0108c2e:	eb 01                	jmp    c0108c31 <sys_send_msg+0x518>
c0108c30:	90                   	nop
c0108c31:	b8 00 00 00 00       	mov    $0x0,%eax
c0108c36:	c9                   	leave  
c0108c37:	c3                   	ret    

c0108c38 <sys_receive_msg>:
c0108c38:	55                   	push   %ebp
c0108c39:	89 e5                	mov    %esp,%ebp
c0108c3b:	83 ec 58             	sub    $0x58,%esp
c0108c3e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108c45:	83 ec 0c             	sub    $0xc,%esp
c0108c48:	ff 75 0c             	pushl  0xc(%ebp)
c0108c4b:	e8 06 ab ff ff       	call   c0103756 <pid2proc>
c0108c50:	83 c4 10             	add    $0x10,%esp
c0108c53:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0108c56:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0108c5a:	74 2c                	je     c0108c88 <sys_receive_msg+0x50>
c0108c5c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108c5f:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c0108c65:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0108c6a:	74 1c                	je     c0108c88 <sys_receive_msg+0x50>
c0108c6c:	68 a6 05 00 00       	push   $0x5a6
c0108c71:	68 54 ad 10 c0       	push   $0xc010ad54
c0108c76:	68 54 ad 10 c0       	push   $0xc010ad54
c0108c7b:	68 bc ae 10 c0       	push   $0xc010aebc
c0108c80:	e8 a3 f9 ff ff       	call   c0108628 <assertion_failure>
c0108c85:	83 c4 10             	add    $0x10,%esp
c0108c88:	8b 45 10             	mov    0x10(%ebp),%eax
c0108c8b:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c0108c91:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0108c96:	74 1c                	je     c0108cb4 <sys_receive_msg+0x7c>
c0108c98:	68 a8 05 00 00       	push   $0x5a8
c0108c9d:	68 54 ad 10 c0       	push   $0xc010ad54
c0108ca2:	68 54 ad 10 c0       	push   $0xc010ad54
c0108ca7:	68 94 ae 10 c0       	push   $0xc010ae94
c0108cac:	e8 77 f9 ff ff       	call   c0108628 <assertion_failure>
c0108cb1:	83 c4 10             	add    $0x10,%esp
c0108cb4:	8b 45 10             	mov    0x10(%ebp),%eax
c0108cb7:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108cbe:	84 c0                	test   %al,%al
c0108cc0:	74 65                	je     c0108d27 <sys_receive_msg+0xef>
c0108cc2:	8b 45 10             	mov    0x10(%ebp),%eax
c0108cc5:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108ccc:	3c 01                	cmp    $0x1,%al
c0108cce:	74 57                	je     c0108d27 <sys_receive_msg+0xef>
c0108cd0:	8b 45 10             	mov    0x10(%ebp),%eax
c0108cd3:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108cda:	3c 02                	cmp    $0x2,%al
c0108cdc:	74 49                	je     c0108d27 <sys_receive_msg+0xef>
c0108cde:	8b 45 10             	mov    0x10(%ebp),%eax
c0108ce1:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108ce8:	3c 03                	cmp    $0x3,%al
c0108cea:	74 3b                	je     c0108d27 <sys_receive_msg+0xef>
c0108cec:	8b 45 10             	mov    0x10(%ebp),%eax
c0108cef:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108cf6:	3c 04                	cmp    $0x4,%al
c0108cf8:	74 2d                	je     c0108d27 <sys_receive_msg+0xef>
c0108cfa:	8b 45 10             	mov    0x10(%ebp),%eax
c0108cfd:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108d04:	0f be c0             	movsbl %al,%eax
c0108d07:	83 ec 0c             	sub    $0xc,%esp
c0108d0a:	68 ab 05 00 00       	push   $0x5ab
c0108d0f:	68 54 ad 10 c0       	push   $0xc010ad54
c0108d14:	68 54 ad 10 c0       	push   $0xc010ad54
c0108d19:	50                   	push   %eax
c0108d1a:	68 f0 ae 10 c0       	push   $0xc010aef0
c0108d1f:	e8 76 f9 ff ff       	call   c010869a <assertion_failure2>
c0108d24:	83 c4 20             	add    $0x20,%esp
c0108d27:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0108d2b:	74 73                	je     c0108da0 <sys_receive_msg+0x168>
c0108d2d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108d30:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108d37:	84 c0                	test   %al,%al
c0108d39:	74 65                	je     c0108da0 <sys_receive_msg+0x168>
c0108d3b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108d3e:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108d45:	3c 01                	cmp    $0x1,%al
c0108d47:	74 57                	je     c0108da0 <sys_receive_msg+0x168>
c0108d49:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108d4c:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108d53:	3c 02                	cmp    $0x2,%al
c0108d55:	74 49                	je     c0108da0 <sys_receive_msg+0x168>
c0108d57:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108d5a:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108d61:	3c 03                	cmp    $0x3,%al
c0108d63:	74 3b                	je     c0108da0 <sys_receive_msg+0x168>
c0108d65:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108d68:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108d6f:	3c 04                	cmp    $0x4,%al
c0108d71:	74 2d                	je     c0108da0 <sys_receive_msg+0x168>
c0108d73:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108d76:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108d7d:	0f be c0             	movsbl %al,%eax
c0108d80:	83 ec 0c             	sub    $0xc,%esp
c0108d83:	68 af 05 00 00       	push   $0x5af
c0108d88:	68 54 ad 10 c0       	push   $0xc010ad54
c0108d8d:	68 54 ad 10 c0       	push   $0xc010ad54
c0108d92:	50                   	push   %eax
c0108d93:	68 8c af 10 c0       	push   $0xc010af8c
c0108d98:	e8 fd f8 ff ff       	call   c010869a <assertion_failure2>
c0108d9d:	83 c4 20             	add    $0x20,%esp
c0108da0:	83 ec 0c             	sub    $0xc,%esp
c0108da3:	ff 75 10             	pushl  0x10(%ebp)
c0108da6:	e8 31 aa ff ff       	call   c01037dc <proc2pid>
c0108dab:	83 c4 10             	add    $0x10,%esp
c0108dae:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0108db1:	c7 45 dc 7c 00 00 00 	movl   $0x7c,-0x24(%ebp)
c0108db8:	8b 45 08             	mov    0x8(%ebp),%eax
c0108dbb:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0108dbe:	8b 45 10             	mov    0x10(%ebp),%eax
c0108dc1:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c0108dc7:	83 ec 08             	sub    $0x8,%esp
c0108dca:	50                   	push   %eax
c0108dcb:	ff 75 d8             	pushl  -0x28(%ebp)
c0108dce:	e8 8c d0 ff ff       	call   c0105e5f <get_physical_address_proc>
c0108dd3:	83 c4 10             	add    $0x10,%esp
c0108dd6:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0108dd9:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0108de0:	8b 45 10             	mov    0x10(%ebp),%eax
c0108de3:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0108de9:	85 c0                	test   %eax,%eax
c0108deb:	0f 84 c5 00 00 00    	je     c0108eb6 <sys_receive_msg+0x27e>
c0108df1:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0108df5:	74 0d                	je     c0108e04 <sys_receive_msg+0x1cc>
c0108df7:	81 7d 0c 13 02 00 00 	cmpl   $0x213,0xc(%ebp)
c0108dfe:	0f 85 b2 00 00 00    	jne    c0108eb6 <sys_receive_msg+0x27e>
c0108e04:	c7 45 d0 7c 00 00 00 	movl   $0x7c,-0x30(%ebp)
c0108e0b:	83 ec 0c             	sub    $0xc,%esp
c0108e0e:	ff 75 d0             	pushl  -0x30(%ebp)
c0108e11:	e8 66 87 ff ff       	call   c010157c <sys_malloc>
c0108e16:	83 c4 10             	add    $0x10,%esp
c0108e19:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0108e1c:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0108e1f:	83 ec 04             	sub    $0x4,%esp
c0108e22:	50                   	push   %eax
c0108e23:	6a 00                	push   $0x0
c0108e25:	ff 75 cc             	pushl  -0x34(%ebp)
c0108e28:	e8 3e 24 00 00       	call   c010b26b <Memset>
c0108e2d:	83 c4 10             	add    $0x10,%esp
c0108e30:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0108e33:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c0108e39:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0108e3c:	c7 40 78 d5 07 00 00 	movl   $0x7d5,0x78(%eax)
c0108e43:	83 ec 08             	sub    $0x8,%esp
c0108e46:	ff 75 d0             	pushl  -0x30(%ebp)
c0108e49:	ff 75 d4             	pushl  -0x2c(%ebp)
c0108e4c:	e8 3b cf ff ff       	call   c0105d8c <alloc_virtual_memory>
c0108e51:	83 c4 10             	add    $0x10,%esp
c0108e54:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0108e57:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0108e5a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0108e5d:	83 ec 04             	sub    $0x4,%esp
c0108e60:	52                   	push   %edx
c0108e61:	ff 75 cc             	pushl  -0x34(%ebp)
c0108e64:	50                   	push   %eax
c0108e65:	e8 8f dd ff ff       	call   c0106bf9 <Memcpy>
c0108e6a:	83 c4 10             	add    $0x10,%esp
c0108e6d:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e70:	c7 80 54 02 00 00 00 	movl   $0x0,0x254(%eax)
c0108e77:	00 00 00 
c0108e7a:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e7d:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c0108e84:	00 00 00 
c0108e87:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e8a:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c0108e91:	00 00 00 
c0108e94:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e97:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0108e9e:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c0108ea5:	83 ec 08             	sub    $0x8,%esp
c0108ea8:	ff 75 d0             	pushl  -0x30(%ebp)
c0108eab:	ff 75 cc             	pushl  -0x34(%ebp)
c0108eae:	e8 de 86 ff ff       	call   c0101591 <sys_free>
c0108eb3:	83 c4 10             	add    $0x10,%esp
c0108eb6:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c0108eba:	0f 84 d4 03 00 00    	je     c0109294 <sys_receive_msg+0x65c>
c0108ec0:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0108ec4:	75 26                	jne    c0108eec <sys_receive_msg+0x2b4>
c0108ec6:	8b 45 10             	mov    0x10(%ebp),%eax
c0108ec9:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0108ecf:	85 c0                	test   %eax,%eax
c0108ed1:	0f 84 8a 00 00 00    	je     c0108f61 <sys_receive_msg+0x329>
c0108ed7:	8b 45 10             	mov    0x10(%ebp),%eax
c0108eda:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0108ee0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108ee3:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0108eea:	eb 75                	jmp    c0108f61 <sys_receive_msg+0x329>
c0108eec:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0108ef0:	78 6f                	js     c0108f61 <sys_receive_msg+0x329>
c0108ef2:	83 7d 0c 07          	cmpl   $0x7,0xc(%ebp)
c0108ef6:	7f 69                	jg     c0108f61 <sys_receive_msg+0x329>
c0108ef8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108efb:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108f02:	3c 01                	cmp    $0x1,%al
c0108f04:	75 5b                	jne    c0108f61 <sys_receive_msg+0x329>
c0108f06:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108f09:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c0108f0f:	83 f8 12             	cmp    $0x12,%eax
c0108f12:	74 0e                	je     c0108f22 <sys_receive_msg+0x2ea>
c0108f14:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108f17:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c0108f1d:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c0108f20:	75 3f                	jne    c0108f61 <sys_receive_msg+0x329>
c0108f22:	8b 45 10             	mov    0x10(%ebp),%eax
c0108f25:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0108f2b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108f2e:	eb 2b                	jmp    c0108f5b <sys_receive_msg+0x323>
c0108f30:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108f33:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108f36:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108f39:	8b 90 14 01 00 00    	mov    0x114(%eax),%edx
c0108f3f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0108f42:	39 c2                	cmp    %eax,%edx
c0108f44:	75 09                	jne    c0108f4f <sys_receive_msg+0x317>
c0108f46:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0108f4d:	eb 12                	jmp    c0108f61 <sys_receive_msg+0x329>
c0108f4f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108f52:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0108f58:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108f5b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0108f5f:	75 cf                	jne    c0108f30 <sys_receive_msg+0x2f8>
c0108f61:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0108f65:	0f 85 4e 02 00 00    	jne    c01091b9 <sys_receive_msg+0x581>
c0108f6b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108f6e:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0108f71:	83 ec 08             	sub    $0x8,%esp
c0108f74:	ff 75 dc             	pushl  -0x24(%ebp)
c0108f77:	ff 75 d4             	pushl  -0x2c(%ebp)
c0108f7a:	e8 0d ce ff ff       	call   c0105d8c <alloc_virtual_memory>
c0108f7f:	83 c4 10             	add    $0x10,%esp
c0108f82:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0108f85:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0108f88:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0108f8e:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0108f91:	83 ec 0c             	sub    $0xc,%esp
c0108f94:	ff 75 c4             	pushl  -0x3c(%ebp)
c0108f97:	e8 40 a8 ff ff       	call   c01037dc <proc2pid>
c0108f9c:	83 c4 10             	add    $0x10,%esp
c0108f9f:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0108fa2:	83 ec 08             	sub    $0x8,%esp
c0108fa5:	ff 75 b8             	pushl  -0x48(%ebp)
c0108fa8:	ff 75 bc             	pushl  -0x44(%ebp)
c0108fab:	e8 af ce ff ff       	call   c0105e5f <get_physical_address_proc>
c0108fb0:	83 c4 10             	add    $0x10,%esp
c0108fb3:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0108fb6:	83 ec 08             	sub    $0x8,%esp
c0108fb9:	ff 75 dc             	pushl  -0x24(%ebp)
c0108fbc:	ff 75 b4             	pushl  -0x4c(%ebp)
c0108fbf:	e8 c8 cd ff ff       	call   c0105d8c <alloc_virtual_memory>
c0108fc4:	83 c4 10             	add    $0x10,%esp
c0108fc7:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0108fca:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0108fcd:	83 ec 04             	sub    $0x4,%esp
c0108fd0:	50                   	push   %eax
c0108fd1:	ff 75 b0             	pushl  -0x50(%ebp)
c0108fd4:	ff 75 c0             	pushl  -0x40(%ebp)
c0108fd7:	e8 1d dc ff ff       	call   c0106bf9 <Memcpy>
c0108fdc:	83 c4 10             	add    $0x10,%esp
c0108fdf:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0108fe2:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0108fe5:	8b 45 10             	mov    0x10(%ebp),%eax
c0108fe8:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0108fee:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0108ff1:	75 21                	jne    c0109014 <sys_receive_msg+0x3dc>
c0108ff3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108ff6:	8b 90 50 02 00 00    	mov    0x250(%eax),%edx
c0108ffc:	8b 45 10             	mov    0x10(%ebp),%eax
c0108fff:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c0109005:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109008:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c010900f:	00 00 00 
c0109012:	eb 1f                	jmp    c0109033 <sys_receive_msg+0x3fb>
c0109014:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109017:	8b 90 50 02 00 00    	mov    0x250(%eax),%edx
c010901d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109020:	89 90 50 02 00 00    	mov    %edx,0x250(%eax)
c0109026:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109029:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c0109030:	00 00 00 
c0109033:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0109036:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c010903d:	00 00 00 
c0109040:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0109043:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c010904a:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c010904d:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c0109054:	00 00 00 
c0109057:	8b 45 10             	mov    0x10(%ebp),%eax
c010905a:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c0109061:	00 00 00 
c0109064:	8b 45 10             	mov    0x10(%ebp),%eax
c0109067:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c010906e:	00 00 00 
c0109071:	8b 45 10             	mov    0x10(%ebp),%eax
c0109074:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c010907b:	00 00 00 
c010907e:	83 ec 0c             	sub    $0xc,%esp
c0109081:	ff 75 c4             	pushl  -0x3c(%ebp)
c0109084:	e8 46 03 00 00       	call   c01093cf <unblock>
c0109089:	83 c4 10             	add    $0x10,%esp
c010908c:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c010908f:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0109095:	85 c0                	test   %eax,%eax
c0109097:	74 1c                	je     c01090b5 <sys_receive_msg+0x47d>
c0109099:	68 1f 06 00 00       	push   $0x61f
c010909e:	68 54 ad 10 c0       	push   $0xc010ad54
c01090a3:	68 54 ad 10 c0       	push   $0xc010ad54
c01090a8:	68 fb b0 10 c0       	push   $0xc010b0fb
c01090ad:	e8 76 f5 ff ff       	call   c0108628 <assertion_failure>
c01090b2:	83 c4 10             	add    $0x10,%esp
c01090b5:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01090b8:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01090bf:	84 c0                	test   %al,%al
c01090c1:	74 1c                	je     c01090df <sys_receive_msg+0x4a7>
c01090c3:	68 20 06 00 00       	push   $0x620
c01090c8:	68 54 ad 10 c0       	push   $0xc010ad54
c01090cd:	68 54 ad 10 c0       	push   $0xc010ad54
c01090d2:	68 13 b1 10 c0       	push   $0xc010b113
c01090d7:	e8 4c f5 ff ff       	call   c0108628 <assertion_failure>
c01090dc:	83 c4 10             	add    $0x10,%esp
c01090df:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01090e2:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c01090e8:	83 f8 21             	cmp    $0x21,%eax
c01090eb:	74 1c                	je     c0109109 <sys_receive_msg+0x4d1>
c01090ed:	68 21 06 00 00       	push   $0x621
c01090f2:	68 54 ad 10 c0       	push   $0xc010ad54
c01090f7:	68 54 ad 10 c0       	push   $0xc010ad54
c01090fc:	68 2c b1 10 c0       	push   $0xc010b12c
c0109101:	e8 22 f5 ff ff       	call   c0108628 <assertion_failure>
c0109106:	83 c4 10             	add    $0x10,%esp
c0109109:	8b 45 10             	mov    0x10(%ebp),%eax
c010910c:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0109112:	85 c0                	test   %eax,%eax
c0109114:	74 1c                	je     c0109132 <sys_receive_msg+0x4fa>
c0109116:	68 23 06 00 00       	push   $0x623
c010911b:	68 54 ad 10 c0       	push   $0xc010ad54
c0109120:	68 54 ad 10 c0       	push   $0xc010ad54
c0109125:	68 58 b0 10 c0       	push   $0xc010b058
c010912a:	e8 f9 f4 ff ff       	call   c0108628 <assertion_failure>
c010912f:	83 c4 10             	add    $0x10,%esp
c0109132:	8b 45 10             	mov    0x10(%ebp),%eax
c0109135:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010913c:	84 c0                	test   %al,%al
c010913e:	74 1c                	je     c010915c <sys_receive_msg+0x524>
c0109140:	68 24 06 00 00       	push   $0x624
c0109145:	68 54 ad 10 c0       	push   $0xc010ad54
c010914a:	68 54 ad 10 c0       	push   $0xc010ad54
c010914f:	68 6d b0 10 c0       	push   $0xc010b06d
c0109154:	e8 cf f4 ff ff       	call   c0108628 <assertion_failure>
c0109159:	83 c4 10             	add    $0x10,%esp
c010915c:	8b 45 10             	mov    0x10(%ebp),%eax
c010915f:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0109165:	83 f8 21             	cmp    $0x21,%eax
c0109168:	74 1c                	je     c0109186 <sys_receive_msg+0x54e>
c010916a:	68 25 06 00 00       	push   $0x625
c010916f:	68 54 ad 10 c0       	push   $0xc010ad54
c0109174:	68 54 ad 10 c0       	push   $0xc010ad54
c0109179:	68 84 b0 10 c0       	push   $0xc010b084
c010917e:	e8 a5 f4 ff ff       	call   c0108628 <assertion_failure>
c0109183:	83 c4 10             	add    $0x10,%esp
c0109186:	8b 45 10             	mov    0x10(%ebp),%eax
c0109189:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c010918f:	83 f8 21             	cmp    $0x21,%eax
c0109192:	0f 84 f5 00 00 00    	je     c010928d <sys_receive_msg+0x655>
c0109198:	68 26 06 00 00       	push   $0x626
c010919d:	68 54 ad 10 c0       	push   $0xc010ad54
c01091a2:	68 54 ad 10 c0       	push   $0xc010ad54
c01091a7:	68 50 b1 10 c0       	push   $0xc010b150
c01091ac:	e8 77 f4 ff ff       	call   c0108628 <assertion_failure>
c01091b1:	83 c4 10             	add    $0x10,%esp
c01091b4:	e9 d4 00 00 00       	jmp    c010928d <sys_receive_msg+0x655>
c01091b9:	8b 45 10             	mov    0x10(%ebp),%eax
c01091bc:	c6 80 3c 02 00 00 02 	movb   $0x2,0x23c(%eax)
c01091c3:	8b 45 10             	mov    0x10(%ebp),%eax
c01091c6:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01091cd:	3c 02                	cmp    $0x2,%al
c01091cf:	74 1c                	je     c01091ed <sys_receive_msg+0x5b5>
c01091d1:	68 2b 06 00 00       	push   $0x62b
c01091d6:	68 54 ad 10 c0       	push   $0xc010ad54
c01091db:	68 54 ad 10 c0       	push   $0xc010ad54
c01091e0:	68 6f b1 10 c0       	push   $0xc010b16f
c01091e5:	e8 3e f4 ff ff       	call   c0108628 <assertion_failure>
c01091ea:	83 c4 10             	add    $0x10,%esp
c01091ed:	8b 45 10             	mov    0x10(%ebp),%eax
c01091f0:	8b 55 08             	mov    0x8(%ebp),%edx
c01091f3:	89 90 40 02 00 00    	mov    %edx,0x240(%eax)
c01091f9:	8b 45 10             	mov    0x10(%ebp),%eax
c01091fc:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109203:	3c 02                	cmp    $0x2,%al
c0109205:	74 1c                	je     c0109223 <sys_receive_msg+0x5eb>
c0109207:	68 2d 06 00 00       	push   $0x62d
c010920c:	68 54 ad 10 c0       	push   $0xc010ad54
c0109211:	68 54 ad 10 c0       	push   $0xc010ad54
c0109216:	68 6f b1 10 c0       	push   $0xc010b16f
c010921b:	e8 08 f4 ff ff       	call   c0108628 <assertion_failure>
c0109220:	83 c4 10             	add    $0x10,%esp
c0109223:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0109227:	75 0f                	jne    c0109238 <sys_receive_msg+0x600>
c0109229:	8b 45 10             	mov    0x10(%ebp),%eax
c010922c:	c7 80 48 02 00 00 12 	movl   $0x12,0x248(%eax)
c0109233:	00 00 00 
c0109236:	eb 0c                	jmp    c0109244 <sys_receive_msg+0x60c>
c0109238:	8b 45 10             	mov    0x10(%ebp),%eax
c010923b:	8b 55 0c             	mov    0xc(%ebp),%edx
c010923e:	89 90 48 02 00 00    	mov    %edx,0x248(%eax)
c0109244:	8b 45 10             	mov    0x10(%ebp),%eax
c0109247:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010924e:	3c 02                	cmp    $0x2,%al
c0109250:	74 2d                	je     c010927f <sys_receive_msg+0x647>
c0109252:	8b 45 10             	mov    0x10(%ebp),%eax
c0109255:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010925c:	0f be c0             	movsbl %al,%eax
c010925f:	83 ec 0c             	sub    $0xc,%esp
c0109262:	68 38 06 00 00       	push   $0x638
c0109267:	68 54 ad 10 c0       	push   $0xc010ad54
c010926c:	68 54 ad 10 c0       	push   $0xc010ad54
c0109271:	50                   	push   %eax
c0109272:	68 6f b1 10 c0       	push   $0xc010b16f
c0109277:	e8 1e f4 ff ff       	call   c010869a <assertion_failure2>
c010927c:	83 c4 20             	add    $0x20,%esp
c010927f:	83 ec 0c             	sub    $0xc,%esp
c0109282:	ff 75 10             	pushl  0x10(%ebp)
c0109285:	e8 09 01 00 00       	call   c0109393 <block>
c010928a:	83 c4 10             	add    $0x10,%esp
c010928d:	b8 00 00 00 00       	mov    $0x0,%eax
c0109292:	eb 02                	jmp    c0109296 <sys_receive_msg+0x65e>
c0109294:	90                   	nop
c0109295:	90                   	nop
c0109296:	c9                   	leave  
c0109297:	c3                   	ret    

c0109298 <send_rec>:
c0109298:	55                   	push   %ebp
c0109299:	89 e5                	mov    %esp,%ebp
c010929b:	83 ec 18             	sub    $0x18,%esp
c010929e:	8b 45 0c             	mov    0xc(%ebp),%eax
c01092a1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01092a4:	c7 45 f0 7c 00 00 00 	movl   $0x7c,-0x10(%ebp)
c01092ab:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c01092af:	74 28                	je     c01092d9 <send_rec+0x41>
c01092b1:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c01092b5:	74 22                	je     c01092d9 <send_rec+0x41>
c01092b7:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c01092bb:	74 1c                	je     c01092d9 <send_rec+0x41>
c01092bd:	68 4a 06 00 00       	push   $0x64a
c01092c2:	68 54 ad 10 c0       	push   $0xc010ad54
c01092c7:	68 54 ad 10 c0       	push   $0xc010ad54
c01092cc:	68 90 b1 10 c0       	push   $0xc010b190
c01092d1:	e8 52 f3 ff ff       	call   c0108628 <assertion_failure>
c01092d6:	83 c4 10             	add    $0x10,%esp
c01092d9:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c01092dd:	75 14                	jne    c01092f3 <send_rec+0x5b>
c01092df:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01092e2:	83 ec 04             	sub    $0x4,%esp
c01092e5:	50                   	push   %eax
c01092e6:	6a 00                	push   $0x0
c01092e8:	ff 75 0c             	pushl  0xc(%ebp)
c01092eb:	e8 7b 1f 00 00       	call   c010b26b <Memset>
c01092f0:	83 c4 10             	add    $0x10,%esp
c01092f3:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c01092f7:	74 23                	je     c010931c <send_rec+0x84>
c01092f9:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c01092fd:	74 34                	je     c0109333 <send_rec+0x9b>
c01092ff:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c0109303:	75 74                	jne    c0109379 <send_rec+0xe1>
c0109305:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109308:	83 ec 08             	sub    $0x8,%esp
c010930b:	ff 75 10             	pushl  0x10(%ebp)
c010930e:	50                   	push   %eax
c010930f:	e8 3c 82 ff ff       	call   c0101550 <send_msg>
c0109314:	83 c4 10             	add    $0x10,%esp
c0109317:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010931a:	eb 70                	jmp    c010938c <send_rec+0xf4>
c010931c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010931f:	83 ec 08             	sub    $0x8,%esp
c0109322:	ff 75 10             	pushl  0x10(%ebp)
c0109325:	50                   	push   %eax
c0109326:	e8 3b 82 ff ff       	call   c0101566 <receive_msg>
c010932b:	83 c4 10             	add    $0x10,%esp
c010932e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109331:	eb 59                	jmp    c010938c <send_rec+0xf4>
c0109333:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109336:	83 ec 08             	sub    $0x8,%esp
c0109339:	ff 75 10             	pushl  0x10(%ebp)
c010933c:	50                   	push   %eax
c010933d:	e8 0e 82 ff ff       	call   c0101550 <send_msg>
c0109342:	83 c4 10             	add    $0x10,%esp
c0109345:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109348:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c010934c:	75 3d                	jne    c010938b <send_rec+0xf3>
c010934e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109351:	83 ec 04             	sub    $0x4,%esp
c0109354:	50                   	push   %eax
c0109355:	6a 00                	push   $0x0
c0109357:	ff 75 0c             	pushl  0xc(%ebp)
c010935a:	e8 0c 1f 00 00       	call   c010b26b <Memset>
c010935f:	83 c4 10             	add    $0x10,%esp
c0109362:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109365:	83 ec 08             	sub    $0x8,%esp
c0109368:	ff 75 10             	pushl  0x10(%ebp)
c010936b:	50                   	push   %eax
c010936c:	e8 f5 81 ff ff       	call   c0101566 <receive_msg>
c0109371:	83 c4 10             	add    $0x10,%esp
c0109374:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109377:	eb 12                	jmp    c010938b <send_rec+0xf3>
c0109379:	83 ec 0c             	sub    $0xc,%esp
c010937c:	68 cc b1 10 c0       	push   $0xc010b1cc
c0109381:	e8 84 f2 ff ff       	call   c010860a <panic>
c0109386:	83 c4 10             	add    $0x10,%esp
c0109389:	eb 01                	jmp    c010938c <send_rec+0xf4>
c010938b:	90                   	nop
c010938c:	b8 00 00 00 00       	mov    $0x0,%eax
c0109391:	c9                   	leave  
c0109392:	c3                   	ret    

c0109393 <block>:
c0109393:	55                   	push   %ebp
c0109394:	89 e5                	mov    %esp,%ebp
c0109396:	83 ec 08             	sub    $0x8,%esp
c0109399:	8b 45 08             	mov    0x8(%ebp),%eax
c010939c:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01093a3:	84 c0                	test   %al,%al
c01093a5:	75 1c                	jne    c01093c3 <block+0x30>
c01093a7:	68 79 06 00 00       	push   $0x679
c01093ac:	68 54 ad 10 c0       	push   $0xc010ad54
c01093b1:	68 54 ad 10 c0       	push   $0xc010ad54
c01093b6:	68 e1 b1 10 c0       	push   $0xc010b1e1
c01093bb:	e8 68 f2 ff ff       	call   c0108628 <assertion_failure>
c01093c0:	83 c4 10             	add    $0x10,%esp
c01093c3:	e8 10 a2 ff ff       	call   c01035d8 <schedule_process>
c01093c8:	b8 00 00 00 00       	mov    $0x0,%eax
c01093cd:	c9                   	leave  
c01093ce:	c3                   	ret    

c01093cf <unblock>:
c01093cf:	55                   	push   %ebp
c01093d0:	89 e5                	mov    %esp,%ebp
c01093d2:	83 ec 08             	sub    $0x8,%esp
c01093d5:	8b 45 08             	mov    0x8(%ebp),%eax
c01093d8:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01093df:	84 c0                	test   %al,%al
c01093e1:	74 1c                	je     c01093ff <unblock+0x30>
c01093e3:	68 82 06 00 00       	push   $0x682
c01093e8:	68 54 ad 10 c0       	push   $0xc010ad54
c01093ed:	68 54 ad 10 c0       	push   $0xc010ad54
c01093f2:	68 f9 b1 10 c0       	push   $0xc010b1f9
c01093f7:	e8 2c f2 ff ff       	call   c0108628 <assertion_failure>
c01093fc:	83 c4 10             	add    $0x10,%esp
c01093ff:	8b 45 08             	mov    0x8(%ebp),%eax
c0109402:	05 60 02 00 00       	add    $0x260,%eax
c0109407:	83 ec 08             	sub    $0x8,%esp
c010940a:	50                   	push   %eax
c010940b:	68 ec fd 10 c0       	push   $0xc010fdec
c0109410:	e8 cb 0a 00 00       	call   c0109ee0 <appendToDoubleLinkList>
c0109415:	83 c4 10             	add    $0x10,%esp
c0109418:	b8 00 00 00 00       	mov    $0x0,%eax
c010941d:	c9                   	leave  
c010941e:	c3                   	ret    

c010941f <get_ticks_ipc>:
c010941f:	55                   	push   %ebp
c0109420:	89 e5                	mov    %esp,%ebp
c0109422:	81 ec 98 00 00 00    	sub    $0x98,%esp
c0109428:	83 ec 04             	sub    $0x4,%esp
c010942b:	6a 7c                	push   $0x7c
c010942d:	6a 00                	push   $0x0
c010942f:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0109435:	50                   	push   %eax
c0109436:	e8 30 1e 00 00       	call   c010b26b <Memset>
c010943b:	83 c4 10             	add    $0x10,%esp
c010943e:	c7 85 78 ff ff ff 01 	movl   $0x1,-0x88(%ebp)
c0109445:	00 00 00 
c0109448:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c010944f:	83 ec 04             	sub    $0x4,%esp
c0109452:	6a 01                	push   $0x1
c0109454:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c010945a:	50                   	push   %eax
c010945b:	6a 03                	push   $0x3
c010945d:	e8 36 fe ff ff       	call   c0109298 <send_rec>
c0109462:	83 c4 10             	add    $0x10,%esp
c0109465:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109468:	8b 85 7c ff ff ff    	mov    -0x84(%ebp),%eax
c010946e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109471:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109474:	c9                   	leave  
c0109475:	c3                   	ret    

c0109476 <itoa>:
c0109476:	55                   	push   %ebp
c0109477:	89 e5                	mov    %esp,%ebp
c0109479:	53                   	push   %ebx
c010947a:	83 ec 14             	sub    $0x14,%esp
c010947d:	8b 45 08             	mov    0x8(%ebp),%eax
c0109480:	99                   	cltd   
c0109481:	f7 7d 10             	idivl  0x10(%ebp)
c0109484:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0109487:	8b 45 08             	mov    0x8(%ebp),%eax
c010948a:	99                   	cltd   
c010948b:	f7 7d 10             	idivl  0x10(%ebp)
c010948e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109491:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0109495:	74 14                	je     c01094ab <itoa+0x35>
c0109497:	83 ec 04             	sub    $0x4,%esp
c010949a:	ff 75 10             	pushl  0x10(%ebp)
c010949d:	ff 75 0c             	pushl  0xc(%ebp)
c01094a0:	ff 75 f0             	pushl  -0x10(%ebp)
c01094a3:	e8 ce ff ff ff       	call   c0109476 <itoa>
c01094a8:	83 c4 10             	add    $0x10,%esp
c01094ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01094ae:	8d 58 30             	lea    0x30(%eax),%ebx
c01094b1:	8b 45 0c             	mov    0xc(%ebp),%eax
c01094b4:	8b 00                	mov    (%eax),%eax
c01094b6:	8d 48 01             	lea    0x1(%eax),%ecx
c01094b9:	8b 55 0c             	mov    0xc(%ebp),%edx
c01094bc:	89 0a                	mov    %ecx,(%edx)
c01094be:	89 da                	mov    %ebx,%edx
c01094c0:	88 10                	mov    %dl,(%eax)
c01094c2:	8b 45 0c             	mov    0xc(%ebp),%eax
c01094c5:	8b 00                	mov    (%eax),%eax
c01094c7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01094ca:	c9                   	leave  
c01094cb:	c3                   	ret    

c01094cc <i2a>:
c01094cc:	55                   	push   %ebp
c01094cd:	89 e5                	mov    %esp,%ebp
c01094cf:	53                   	push   %ebx
c01094d0:	83 ec 14             	sub    $0x14,%esp
c01094d3:	8b 45 08             	mov    0x8(%ebp),%eax
c01094d6:	99                   	cltd   
c01094d7:	f7 7d 0c             	idivl  0xc(%ebp)
c01094da:	89 55 f4             	mov    %edx,-0xc(%ebp)
c01094dd:	8b 45 08             	mov    0x8(%ebp),%eax
c01094e0:	99                   	cltd   
c01094e1:	f7 7d 0c             	idivl  0xc(%ebp)
c01094e4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01094e7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c01094eb:	74 14                	je     c0109501 <i2a+0x35>
c01094ed:	83 ec 04             	sub    $0x4,%esp
c01094f0:	ff 75 10             	pushl  0x10(%ebp)
c01094f3:	ff 75 0c             	pushl  0xc(%ebp)
c01094f6:	ff 75 f0             	pushl  -0x10(%ebp)
c01094f9:	e8 ce ff ff ff       	call   c01094cc <i2a>
c01094fe:	83 c4 10             	add    $0x10,%esp
c0109501:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c0109505:	7f 0a                	jg     c0109511 <i2a+0x45>
c0109507:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010950a:	83 c0 30             	add    $0x30,%eax
c010950d:	89 c3                	mov    %eax,%ebx
c010950f:	eb 08                	jmp    c0109519 <i2a+0x4d>
c0109511:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109514:	83 c0 37             	add    $0x37,%eax
c0109517:	89 c3                	mov    %eax,%ebx
c0109519:	8b 45 10             	mov    0x10(%ebp),%eax
c010951c:	8b 00                	mov    (%eax),%eax
c010951e:	8d 48 01             	lea    0x1(%eax),%ecx
c0109521:	8b 55 10             	mov    0x10(%ebp),%edx
c0109524:	89 0a                	mov    %ecx,(%edx)
c0109526:	88 18                	mov    %bl,(%eax)
c0109528:	8b 45 10             	mov    0x10(%ebp),%eax
c010952b:	8b 00                	mov    (%eax),%eax
c010952d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0109530:	c9                   	leave  
c0109531:	c3                   	ret    

c0109532 <inform_int>:
c0109532:	55                   	push   %ebp
c0109533:	89 e5                	mov    %esp,%ebp
c0109535:	83 ec 18             	sub    $0x18,%esp
c0109538:	83 ec 0c             	sub    $0xc,%esp
c010953b:	ff 75 08             	pushl  0x8(%ebp)
c010953e:	e8 13 a2 ff ff       	call   c0103756 <pid2proc>
c0109543:	83 c4 10             	add    $0x10,%esp
c0109546:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109549:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010954c:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109553:	0f be c0             	movsbl %al,%eax
c0109556:	83 e0 02             	and    $0x2,%eax
c0109559:	85 c0                	test   %eax,%eax
c010955b:	0f 84 8e 00 00 00    	je     c01095ef <inform_int+0xbd>
c0109561:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109564:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c010956a:	3d 13 02 00 00       	cmp    $0x213,%eax
c010956f:	74 0e                	je     c010957f <inform_int+0x4d>
c0109571:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109574:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c010957a:	83 f8 12             	cmp    $0x12,%eax
c010957d:	75 7d                	jne    c01095fc <inform_int+0xca>
c010957f:	c7 45 f0 7c 00 00 00 	movl   $0x7c,-0x10(%ebp)
c0109586:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109589:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c010958f:	83 ec 08             	sub    $0x8,%esp
c0109592:	ff 75 f0             	pushl  -0x10(%ebp)
c0109595:	50                   	push   %eax
c0109596:	e8 f1 c7 ff ff       	call   c0105d8c <alloc_virtual_memory>
c010959b:	83 c4 10             	add    $0x10,%esp
c010959e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01095a1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01095a4:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c01095aa:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01095ad:	c7 40 78 d5 07 00 00 	movl   $0x7d5,0x78(%eax)
c01095b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01095b7:	c7 80 54 02 00 00 00 	movl   $0x0,0x254(%eax)
c01095be:	00 00 00 
c01095c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01095c4:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c01095cb:	00 00 00 
c01095ce:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01095d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01095d8:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c01095df:	83 ec 0c             	sub    $0xc,%esp
c01095e2:	ff 75 f4             	pushl  -0xc(%ebp)
c01095e5:	e8 e5 fd ff ff       	call   c01093cf <unblock>
c01095ea:	83 c4 10             	add    $0x10,%esp
c01095ed:	eb 0d                	jmp    c01095fc <inform_int+0xca>
c01095ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01095f2:	c7 80 54 02 00 00 01 	movl   $0x1,0x254(%eax)
c01095f9:	00 00 00 
c01095fc:	90                   	nop
c01095fd:	c9                   	leave  
c01095fe:	c3                   	ret    

c01095ff <strcmp>:
c01095ff:	55                   	push   %ebp
c0109600:	89 e5                	mov    %esp,%ebp
c0109602:	83 ec 10             	sub    $0x10,%esp
c0109605:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0109609:	74 06                	je     c0109611 <strcmp+0x12>
c010960b:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010960f:	75 08                	jne    c0109619 <strcmp+0x1a>
c0109611:	8b 45 08             	mov    0x8(%ebp),%eax
c0109614:	2b 45 0c             	sub    0xc(%ebp),%eax
c0109617:	eb 53                	jmp    c010966c <strcmp+0x6d>
c0109619:	8b 45 08             	mov    0x8(%ebp),%eax
c010961c:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010961f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0109622:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0109625:	eb 18                	jmp    c010963f <strcmp+0x40>
c0109627:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010962a:	0f b6 10             	movzbl (%eax),%edx
c010962d:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0109630:	0f b6 00             	movzbl (%eax),%eax
c0109633:	38 c2                	cmp    %al,%dl
c0109635:	75 1e                	jne    c0109655 <strcmp+0x56>
c0109637:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c010963b:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c010963f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0109642:	0f b6 00             	movzbl (%eax),%eax
c0109645:	84 c0                	test   %al,%al
c0109647:	74 0d                	je     c0109656 <strcmp+0x57>
c0109649:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010964c:	0f b6 00             	movzbl (%eax),%eax
c010964f:	84 c0                	test   %al,%al
c0109651:	75 d4                	jne    c0109627 <strcmp+0x28>
c0109653:	eb 01                	jmp    c0109656 <strcmp+0x57>
c0109655:	90                   	nop
c0109656:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0109659:	0f b6 00             	movzbl (%eax),%eax
c010965c:	0f be d0             	movsbl %al,%edx
c010965f:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0109662:	0f b6 00             	movzbl (%eax),%eax
c0109665:	0f be c0             	movsbl %al,%eax
c0109668:	29 c2                	sub    %eax,%edx
c010966a:	89 d0                	mov    %edx,%eax
c010966c:	c9                   	leave  
c010966d:	c3                   	ret    

c010966e <create_user_process_address_space>:
c010966e:	55                   	push   %ebp
c010966f:	89 e5                	mov    %esp,%ebp
c0109671:	83 ec 18             	sub    $0x18,%esp
c0109674:	83 ec 08             	sub    $0x8,%esp
c0109677:	6a 00                	push   $0x0
c0109679:	6a 01                	push   $0x1
c010967b:	e8 44 ca ff ff       	call   c01060c4 <alloc_memory>
c0109680:	83 c4 10             	add    $0x10,%esp
c0109683:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109686:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109689:	c7 40 08 00 80 04 08 	movl   $0x8048000,0x8(%eax)
c0109690:	c7 45 f0 00 80 fb b7 	movl   $0xb7fb8000,-0x10(%ebp)
c0109697:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010969a:	05 ff 0f 00 00       	add    $0xfff,%eax
c010969f:	c1 e8 0c             	shr    $0xc,%eax
c01096a2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01096a5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01096a8:	83 c0 07             	add    $0x7,%eax
c01096ab:	c1 e8 03             	shr    $0x3,%eax
c01096ae:	89 c2                	mov    %eax,%edx
c01096b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01096b3:	89 50 04             	mov    %edx,0x4(%eax)
c01096b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01096b9:	8b 40 04             	mov    0x4(%eax),%eax
c01096bc:	05 ff 0f 00 00       	add    $0xfff,%eax
c01096c1:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c01096c7:	85 c0                	test   %eax,%eax
c01096c9:	0f 48 c2             	cmovs  %edx,%eax
c01096cc:	c1 f8 0c             	sar    $0xc,%eax
c01096cf:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01096d2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01096d5:	83 ec 08             	sub    $0x8,%esp
c01096d8:	6a 00                	push   $0x0
c01096da:	50                   	push   %eax
c01096db:	e8 e4 c9 ff ff       	call   c01060c4 <alloc_memory>
c01096e0:	83 c4 10             	add    $0x10,%esp
c01096e3:	89 c2                	mov    %eax,%edx
c01096e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01096e8:	89 10                	mov    %edx,(%eax)
c01096ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01096ed:	83 ec 0c             	sub    $0xc,%esp
c01096f0:	50                   	push   %eax
c01096f1:	e8 a0 c1 ff ff       	call   c0105896 <init_bitmap>
c01096f6:	83 c4 10             	add    $0x10,%esp
c01096f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01096fc:	c9                   	leave  
c01096fd:	c3                   	ret    

c01096fe <user_process>:
c01096fe:	55                   	push   %ebp
c01096ff:	89 e5                	mov    %esp,%ebp
c0109701:	83 ec 38             	sub    $0x38,%esp
c0109704:	c7 45 f0 b2 0c 00 00 	movl   $0xcb2,-0x10(%ebp)
c010970b:	c7 45 ec ba 0c 00 00 	movl   $0xcba,-0x14(%ebp)
c0109712:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%ebp)
c0109719:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c010971d:	75 0e                	jne    c010972d <user_process+0x2f>
c010971f:	66 c7 45 f6 48 00    	movw   $0x48,-0xa(%ebp)
c0109725:	66 c7 45 f4 50 00    	movw   $0x50,-0xc(%ebp)
c010972b:	eb 0c                	jmp    c0109739 <user_process+0x3b>
c010972d:	66 c7 45 f6 59 00    	movw   $0x59,-0xa(%ebp)
c0109733:	66 c7 45 f4 61 00    	movw   $0x61,-0xc(%ebp)
c0109739:	e8 65 6c ff ff       	call   c01003a3 <get_running_thread_pcb>
c010973e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109741:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109744:	8b 55 14             	mov    0x14(%ebp),%edx
c0109747:	89 90 18 01 00 00    	mov    %edx,0x118(%eax)
c010974d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109750:	8b 90 18 01 00 00    	mov    0x118(%eax),%edx
c0109756:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109759:	89 90 1c 01 00 00    	mov    %edx,0x11c(%eax)
c010975f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109762:	05 00 10 00 00       	add    $0x1000,%eax
c0109767:	89 c2                	mov    %eax,%edx
c0109769:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010976c:	89 10                	mov    %edx,(%eax)
c010976e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109771:	8b 00                	mov    (%eax),%eax
c0109773:	83 e8 44             	sub    $0x44,%eax
c0109776:	89 c2                	mov    %eax,%edx
c0109778:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010977b:	89 10                	mov    %edx,(%eax)
c010977d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109780:	8b 00                	mov    (%eax),%eax
c0109782:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109785:	c6 45 df 00          	movb   $0x0,-0x21(%ebp)
c0109789:	66 c7 45 dc 02 12    	movw   $0x1202,-0x24(%ebp)
c010978f:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0109793:	66 89 45 da          	mov    %ax,-0x26(%ebp)
c0109797:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c010979b:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
c010979f:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c01097a3:	66 89 45 d6          	mov    %ax,-0x2a(%ebp)
c01097a7:	66 c7 45 d4 38 00    	movw   $0x38,-0x2c(%ebp)
c01097ad:	0f b7 55 f4          	movzwl -0xc(%ebp),%edx
c01097b1:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01097b4:	89 50 34             	mov    %edx,0x34(%eax)
c01097b7:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c01097bb:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01097be:	89 50 0c             	mov    %edx,0xc(%eax)
c01097c1:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c01097c5:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01097c8:	89 50 04             	mov    %edx,0x4(%eax)
c01097cb:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c01097cf:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01097d2:	89 50 08             	mov    %edx,0x8(%eax)
c01097d5:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c01097d9:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01097dc:	89 50 40             	mov    %edx,0x40(%eax)
c01097df:	0f b7 55 d4          	movzwl -0x2c(%ebp),%edx
c01097e3:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01097e6:	89 10                	mov    %edx,(%eax)
c01097e8:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01097eb:	8b 55 08             	mov    0x8(%ebp),%edx
c01097ee:	89 50 30             	mov    %edx,0x30(%eax)
c01097f1:	0f b7 55 dc          	movzwl -0x24(%ebp),%edx
c01097f5:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01097f8:	89 50 38             	mov    %edx,0x38(%eax)
c01097fb:	83 ec 08             	sub    $0x8,%esp
c01097fe:	6a 01                	push   $0x1
c0109800:	68 00 f0 ff bf       	push   $0xbffff000
c0109805:	e8 f2 c7 ff ff       	call   c0105ffc <alloc_physical_memory>
c010980a:	83 c4 10             	add    $0x10,%esp
c010980d:	8d 90 00 10 00 00    	lea    0x1000(%eax),%edx
c0109813:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109816:	89 50 3c             	mov    %edx,0x3c(%eax)
c0109819:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010981c:	83 ec 0c             	sub    $0xc,%esp
c010981f:	50                   	push   %eax
c0109820:	e8 51 6a ff ff       	call   c0100276 <restart>
c0109825:	83 c4 10             	add    $0x10,%esp
c0109828:	90                   	nop
c0109829:	c9                   	leave  
c010982a:	c3                   	ret    

c010982b <clone_pcb>:
c010982b:	55                   	push   %ebp
c010982c:	89 e5                	mov    %esp,%ebp
c010982e:	83 ec 38             	sub    $0x38,%esp
c0109831:	83 ec 08             	sub    $0x8,%esp
c0109834:	6a 00                	push   $0x0
c0109836:	6a 01                	push   $0x1
c0109838:	e8 87 c8 ff ff       	call   c01060c4 <alloc_memory>
c010983d:	83 c4 10             	add    $0x10,%esp
c0109840:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109843:	83 ec 04             	sub    $0x4,%esp
c0109846:	68 00 10 00 00       	push   $0x1000
c010984b:	6a 00                	push   $0x0
c010984d:	ff 75 f4             	pushl  -0xc(%ebp)
c0109850:	e8 16 1a 00 00       	call   c010b26b <Memset>
c0109855:	83 c4 10             	add    $0x10,%esp
c0109858:	83 ec 04             	sub    $0x4,%esp
c010985b:	68 00 10 00 00       	push   $0x1000
c0109860:	ff 75 08             	pushl  0x8(%ebp)
c0109863:	ff 75 f4             	pushl  -0xc(%ebp)
c0109866:	e8 8e d3 ff ff       	call   c0106bf9 <Memcpy>
c010986b:	83 c4 10             	add    $0x10,%esp
c010986e:	a1 c4 06 11 c0       	mov    0xc01106c4,%eax
c0109873:	8d 50 01             	lea    0x1(%eax),%edx
c0109876:	89 15 c4 06 11 c0    	mov    %edx,0xc01106c4
c010987c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010987f:	89 82 14 01 00 00    	mov    %eax,0x114(%edx)
c0109885:	8b 45 08             	mov    0x8(%ebp),%eax
c0109888:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c010988e:	89 c2                	mov    %eax,%edx
c0109890:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109893:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c0109899:	83 ec 08             	sub    $0x8,%esp
c010989c:	6a 00                	push   $0x0
c010989e:	6a 01                	push   $0x1
c01098a0:	e8 1f c8 ff ff       	call   c01060c4 <alloc_memory>
c01098a5:	83 c4 10             	add    $0x10,%esp
c01098a8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01098ab:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01098ae:	05 00 0c 00 00       	add    $0xc00,%eax
c01098b3:	83 ec 04             	sub    $0x4,%esp
c01098b6:	68 00 04 00 00       	push   $0x400
c01098bb:	68 00 fc ff ff       	push   $0xfffffc00
c01098c0:	50                   	push   %eax
c01098c1:	e8 33 d3 ff ff       	call   c0106bf9 <Memcpy>
c01098c6:	83 c4 10             	add    $0x10,%esp
c01098c9:	83 ec 0c             	sub    $0xc,%esp
c01098cc:	ff 75 f0             	pushl  -0x10(%ebp)
c01098cf:	e8 07 c6 ff ff       	call   c0105edb <get_physical_address>
c01098d4:	83 c4 10             	add    $0x10,%esp
c01098d7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01098da:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01098dd:	05 fc 0f 00 00       	add    $0xffc,%eax
c01098e2:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01098e5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01098e8:	83 c8 07             	or     $0x7,%eax
c01098eb:	89 c2                	mov    %eax,%edx
c01098ed:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01098f0:	89 10                	mov    %edx,(%eax)
c01098f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01098f5:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01098f8:	89 50 08             	mov    %edx,0x8(%eax)
c01098fb:	e8 6e fd ff ff       	call   c010966e <create_user_process_address_space>
c0109900:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109903:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0109906:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109909:	89 50 0c             	mov    %edx,0xc(%eax)
c010990c:	8b 45 08             	mov    0x8(%ebp),%eax
c010990f:	8b 40 0c             	mov    0xc(%eax),%eax
c0109912:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109915:	83 ec 04             	sub    $0x4,%esp
c0109918:	6a 0c                	push   $0xc
c010991a:	ff 75 e0             	pushl  -0x20(%ebp)
c010991d:	ff 75 e4             	pushl  -0x1c(%ebp)
c0109920:	e8 d4 d2 ff ff       	call   c0106bf9 <Memcpy>
c0109925:	83 c4 10             	add    $0x10,%esp
c0109928:	c7 45 dc 00 80 fb b7 	movl   $0xb7fb8000,-0x24(%ebp)
c010992f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0109932:	05 ff 0f 00 00       	add    $0xfff,%eax
c0109937:	c1 e8 0c             	shr    $0xc,%eax
c010993a:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010993d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109940:	83 c0 07             	add    $0x7,%eax
c0109943:	c1 e8 03             	shr    $0x3,%eax
c0109946:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0109949:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010994c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010994f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0109952:	05 ff 0f 00 00       	add    $0xfff,%eax
c0109957:	c1 e8 0c             	shr    $0xc,%eax
c010995a:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010995d:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0109960:	83 ec 08             	sub    $0x8,%esp
c0109963:	6a 00                	push   $0x0
c0109965:	50                   	push   %eax
c0109966:	e8 59 c7 ff ff       	call   c01060c4 <alloc_memory>
c010996b:	83 c4 10             	add    $0x10,%esp
c010996e:	89 c2                	mov    %eax,%edx
c0109970:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109973:	89 10                	mov    %edx,(%eax)
c0109975:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0109978:	c1 e0 0c             	shl    $0xc,%eax
c010997b:	89 45 cc             	mov    %eax,-0x34(%ebp)
c010997e:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109981:	8b 10                	mov    (%eax),%edx
c0109983:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109986:	8b 00                	mov    (%eax),%eax
c0109988:	83 ec 04             	sub    $0x4,%esp
c010998b:	ff 75 cc             	pushl  -0x34(%ebp)
c010998e:	52                   	push   %edx
c010998f:	50                   	push   %eax
c0109990:	e8 64 d2 ff ff       	call   c0106bf9 <Memcpy>
c0109995:	83 c4 10             	add    $0x10,%esp
c0109998:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010999b:	c9                   	leave  
c010999c:	c3                   	ret    

c010999d <build_body_stack>:
c010999d:	55                   	push   %ebp
c010999e:	89 e5                	mov    %esp,%ebp
c01099a0:	83 ec 48             	sub    $0x48,%esp
c01099a3:	8b 45 08             	mov    0x8(%ebp),%eax
c01099a6:	8b 40 0c             	mov    0xc(%eax),%eax
c01099a9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01099ac:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01099af:	8b 50 04             	mov    0x4(%eax),%edx
c01099b2:	8b 00                	mov    (%eax),%eax
c01099b4:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c01099b7:	89 55 c8             	mov    %edx,-0x38(%ebp)
c01099ba:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01099bd:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01099c0:	8b 45 c8             	mov    -0x38(%ebp),%eax
c01099c3:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01099c6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01099c9:	8b 40 08             	mov    0x8(%eax),%eax
c01099cc:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01099cf:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01099d6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01099dd:	e8 b3 d1 ff ff       	call   c0106b95 <intr_disable>
c01099e2:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01099e5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01099ec:	e9 c2 00 00 00       	jmp    c0109ab3 <build_body_stack+0x116>
c01099f1:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01099f4:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01099f7:	01 d0                	add    %edx,%eax
c01099f9:	0f b6 00             	movzbl (%eax),%eax
c01099fc:	88 45 d3             	mov    %al,-0x2d(%ebp)
c01099ff:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0109a06:	e9 9a 00 00 00       	jmp    c0109aa5 <build_body_stack+0x108>
c0109a0b:	0f be 55 d3          	movsbl -0x2d(%ebp),%edx
c0109a0f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109a12:	89 c1                	mov    %eax,%ecx
c0109a14:	d3 fa                	sar    %cl,%edx
c0109a16:	89 d0                	mov    %edx,%eax
c0109a18:	83 e0 01             	and    $0x1,%eax
c0109a1b:	85 c0                	test   %eax,%eax
c0109a1d:	75 06                	jne    c0109a25 <build_body_stack+0x88>
c0109a1f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0109a23:	eb 7c                	jmp    c0109aa1 <build_body_stack+0x104>
c0109a25:	8b 45 08             	mov    0x8(%ebp),%eax
c0109a28:	8b 40 08             	mov    0x8(%eax),%eax
c0109a2b:	83 ec 0c             	sub    $0xc,%esp
c0109a2e:	50                   	push   %eax
c0109a2f:	e8 53 69 ff ff       	call   c0100387 <update_cr3>
c0109a34:	83 c4 10             	add    $0x10,%esp
c0109a37:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109a3a:	c1 e0 0c             	shl    $0xc,%eax
c0109a3d:	89 c2                	mov    %eax,%edx
c0109a3f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109a42:	01 d0                	add    %edx,%eax
c0109a44:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0109a47:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0109a4a:	8b 45 10             	mov    0x10(%ebp),%eax
c0109a4d:	83 ec 04             	sub    $0x4,%esp
c0109a50:	68 00 10 00 00       	push   $0x1000
c0109a55:	52                   	push   %edx
c0109a56:	50                   	push   %eax
c0109a57:	e8 9d d1 ff ff       	call   c0106bf9 <Memcpy>
c0109a5c:	83 c4 10             	add    $0x10,%esp
c0109a5f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0109a62:	8b 40 08             	mov    0x8(%eax),%eax
c0109a65:	83 ec 0c             	sub    $0xc,%esp
c0109a68:	50                   	push   %eax
c0109a69:	e8 19 69 ff ff       	call   c0100387 <update_cr3>
c0109a6e:	83 c4 10             	add    $0x10,%esp
c0109a71:	83 ec 08             	sub    $0x8,%esp
c0109a74:	ff 75 cc             	pushl  -0x34(%ebp)
c0109a77:	6a 01                	push   $0x1
c0109a79:	e8 a8 c6 ff ff       	call   c0106126 <get_a_virtual_page>
c0109a7e:	83 c4 10             	add    $0x10,%esp
c0109a81:	8b 55 10             	mov    0x10(%ebp),%edx
c0109a84:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0109a87:	83 ec 04             	sub    $0x4,%esp
c0109a8a:	68 00 10 00 00       	push   $0x1000
c0109a8f:	52                   	push   %edx
c0109a90:	50                   	push   %eax
c0109a91:	e8 63 d1 ff ff       	call   c0106bf9 <Memcpy>
c0109a96:	83 c4 10             	add    $0x10,%esp
c0109a99:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0109a9d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0109aa1:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0109aa5:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0109aa9:	0f 8e 5c ff ff ff    	jle    c0109a0b <build_body_stack+0x6e>
c0109aaf:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0109ab3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109ab6:	39 45 dc             	cmp    %eax,-0x24(%ebp)
c0109ab9:	0f 87 32 ff ff ff    	ja     c01099f1 <build_body_stack+0x54>
c0109abf:	83 ec 0c             	sub    $0xc,%esp
c0109ac2:	ff 75 d4             	pushl  -0x2c(%ebp)
c0109ac5:	e8 f4 d0 ff ff       	call   c0106bbe <intr_set_status>
c0109aca:	83 c4 10             	add    $0x10,%esp
c0109acd:	90                   	nop
c0109ace:	c9                   	leave  
c0109acf:	c3                   	ret    

c0109ad0 <build_process_kernel_stack>:
c0109ad0:	55                   	push   %ebp
c0109ad1:	89 e5                	mov    %esp,%ebp
c0109ad3:	83 ec 28             	sub    $0x28,%esp
c0109ad6:	e8 ba d0 ff ff       	call   c0106b95 <intr_disable>
c0109adb:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109ade:	8b 45 08             	mov    0x8(%ebp),%eax
c0109ae1:	05 00 10 00 00       	add    $0x1000,%eax
c0109ae6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109ae9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109aec:	8b 00                	mov    (%eax),%eax
c0109aee:	83 f8 38             	cmp    $0x38,%eax
c0109af1:	74 06                	je     c0109af9 <build_process_kernel_stack+0x29>
c0109af3:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c0109af7:	eb f0                	jmp    c0109ae9 <build_process_kernel_stack+0x19>
c0109af9:	90                   	nop
c0109afa:	8b 45 08             	mov    0x8(%ebp),%eax
c0109afd:	05 00 10 00 00       	add    $0x1000,%eax
c0109b02:	89 c2                	mov    %eax,%edx
c0109b04:	8b 45 08             	mov    0x8(%ebp),%eax
c0109b07:	89 50 04             	mov    %edx,0x4(%eax)
c0109b0a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109b0d:	83 c0 2c             	add    $0x2c,%eax
c0109b10:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109b13:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109b16:	83 e8 04             	sub    $0x4,%eax
c0109b19:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0109b1c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109b1f:	83 e8 08             	sub    $0x8,%eax
c0109b22:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109b25:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109b28:	83 e8 0c             	sub    $0xc,%eax
c0109b2b:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109b2e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109b31:	83 e8 10             	sub    $0x10,%eax
c0109b34:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0109b37:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109b3a:	83 e8 14             	sub    $0x14,%eax
c0109b3d:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0109b40:	ba 67 02 10 c0       	mov    $0xc0100267,%edx
c0109b45:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109b48:	89 10                	mov    %edx,(%eax)
c0109b4a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109b4d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0109b53:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109b56:	8b 10                	mov    (%eax),%edx
c0109b58:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0109b5b:	89 10                	mov    %edx,(%eax)
c0109b5d:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0109b60:	8b 10                	mov    (%eax),%edx
c0109b62:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109b65:	89 10                	mov    %edx,(%eax)
c0109b67:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109b6a:	8b 10                	mov    (%eax),%edx
c0109b6c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109b6f:	89 10                	mov    %edx,(%eax)
c0109b71:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109b74:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0109b7a:	8b 45 08             	mov    0x8(%ebp),%eax
c0109b7d:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0109b80:	89 10                	mov    %edx,(%eax)
c0109b82:	83 ec 0c             	sub    $0xc,%esp
c0109b85:	ff 75 f0             	pushl  -0x10(%ebp)
c0109b88:	e8 31 d0 ff ff       	call   c0106bbe <intr_set_status>
c0109b8d:	83 c4 10             	add    $0x10,%esp
c0109b90:	90                   	nop
c0109b91:	c9                   	leave  
c0109b92:	c3                   	ret    

c0109b93 <fork_process>:
c0109b93:	55                   	push   %ebp
c0109b94:	89 e5                	mov    %esp,%ebp
c0109b96:	83 ec 18             	sub    $0x18,%esp
c0109b99:	8b 45 08             	mov    0x8(%ebp),%eax
c0109b9c:	83 ec 0c             	sub    $0xc,%esp
c0109b9f:	50                   	push   %eax
c0109ba0:	e8 b1 9b ff ff       	call   c0103756 <pid2proc>
c0109ba5:	83 c4 10             	add    $0x10,%esp
c0109ba8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109bab:	83 ec 0c             	sub    $0xc,%esp
c0109bae:	ff 75 f4             	pushl  -0xc(%ebp)
c0109bb1:	e8 75 fc ff ff       	call   c010982b <clone_pcb>
c0109bb6:	83 c4 10             	add    $0x10,%esp
c0109bb9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109bbc:	83 ec 08             	sub    $0x8,%esp
c0109bbf:	6a 00                	push   $0x0
c0109bc1:	6a 01                	push   $0x1
c0109bc3:	e8 fc c4 ff ff       	call   c01060c4 <alloc_memory>
c0109bc8:	83 c4 10             	add    $0x10,%esp
c0109bcb:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109bce:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109bd1:	83 ec 04             	sub    $0x4,%esp
c0109bd4:	68 00 10 00 00       	push   $0x1000
c0109bd9:	6a 00                	push   $0x0
c0109bdb:	50                   	push   %eax
c0109bdc:	e8 8a 16 00 00       	call   c010b26b <Memset>
c0109be1:	83 c4 10             	add    $0x10,%esp
c0109be4:	83 ec 04             	sub    $0x4,%esp
c0109be7:	ff 75 ec             	pushl  -0x14(%ebp)
c0109bea:	ff 75 f0             	pushl  -0x10(%ebp)
c0109bed:	ff 75 f4             	pushl  -0xc(%ebp)
c0109bf0:	e8 a8 fd ff ff       	call   c010999d <build_body_stack>
c0109bf5:	83 c4 10             	add    $0x10,%esp
c0109bf8:	83 ec 0c             	sub    $0xc,%esp
c0109bfb:	ff 75 f0             	pushl  -0x10(%ebp)
c0109bfe:	e8 cd fe ff ff       	call   c0109ad0 <build_process_kernel_stack>
c0109c03:	83 c4 10             	add    $0x10,%esp
c0109c06:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109c09:	05 6a 02 00 00       	add    $0x26a,%eax
c0109c0e:	83 ec 08             	sub    $0x8,%esp
c0109c11:	50                   	push   %eax
c0109c12:	68 04 0f 11 c0       	push   $0xc0110f04
c0109c17:	e8 c4 02 00 00       	call   c0109ee0 <appendToDoubleLinkList>
c0109c1c:	83 c4 10             	add    $0x10,%esp
c0109c1f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109c22:	c9                   	leave  
c0109c23:	c3                   	ret    

c0109c24 <process_execute>:
c0109c24:	55                   	push   %ebp
c0109c25:	89 e5                	mov    %esp,%ebp
c0109c27:	83 ec 28             	sub    $0x28,%esp
c0109c2a:	e8 c7 04 00 00       	call   c010a0f6 <thread_init>
c0109c2f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109c32:	83 ec 0c             	sub    $0xc,%esp
c0109c35:	ff 75 f4             	pushl  -0xc(%ebp)
c0109c38:	e8 66 05 00 00       	call   c010a1a3 <thread_create>
c0109c3d:	83 c4 10             	add    $0x10,%esp
c0109c40:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109c43:	05 28 01 00 00       	add    $0x128,%eax
c0109c48:	83 ec 08             	sub    $0x8,%esp
c0109c4b:	ff 75 10             	pushl  0x10(%ebp)
c0109c4e:	50                   	push   %eax
c0109c4f:	e8 36 16 00 00       	call   c010b28a <Strcpy>
c0109c54:	83 c4 10             	add    $0x10,%esp
c0109c57:	83 ec 08             	sub    $0x8,%esp
c0109c5a:	6a 00                	push   $0x0
c0109c5c:	6a 01                	push   $0x1
c0109c5e:	e8 61 c4 ff ff       	call   c01060c4 <alloc_memory>
c0109c63:	83 c4 10             	add    $0x10,%esp
c0109c66:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109c69:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109c6c:	05 00 0c 00 00       	add    $0xc00,%eax
c0109c71:	83 ec 04             	sub    $0x4,%esp
c0109c74:	68 00 04 00 00       	push   $0x400
c0109c79:	68 00 fc ff ff       	push   $0xfffffc00
c0109c7e:	50                   	push   %eax
c0109c7f:	e8 75 cf ff ff       	call   c0106bf9 <Memcpy>
c0109c84:	83 c4 10             	add    $0x10,%esp
c0109c87:	83 ec 0c             	sub    $0xc,%esp
c0109c8a:	ff 75 f0             	pushl  -0x10(%ebp)
c0109c8d:	e8 49 c2 ff ff       	call   c0105edb <get_physical_address>
c0109c92:	83 c4 10             	add    $0x10,%esp
c0109c95:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109c98:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109c9b:	05 fc 0f 00 00       	add    $0xffc,%eax
c0109ca0:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0109ca3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109ca6:	83 c8 07             	or     $0x7,%eax
c0109ca9:	89 c2                	mov    %eax,%edx
c0109cab:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109cae:	89 10                	mov    %edx,(%eax)
c0109cb0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109cb3:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0109cb6:	89 50 08             	mov    %edx,0x8(%eax)
c0109cb9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109cbc:	83 c0 10             	add    $0x10,%eax
c0109cbf:	83 ec 0c             	sub    $0xc,%esp
c0109cc2:	50                   	push   %eax
c0109cc3:	e8 b2 c9 ff ff       	call   c010667a <init_memory_block_desc>
c0109cc8:	83 c4 10             	add    $0x10,%esp
c0109ccb:	e8 9e f9 ff ff       	call   c010966e <create_user_process_address_space>
c0109cd0:	89 c2                	mov    %eax,%edx
c0109cd2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109cd5:	89 50 0c             	mov    %edx,0xc(%eax)
c0109cd8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109cdb:	8b 00                	mov    (%eax),%eax
c0109cdd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109ce0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109ce3:	c7 40 10 fe 96 10 c0 	movl   $0xc01096fe,0x10(%eax)
c0109cea:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109ced:	8b 55 08             	mov    0x8(%ebp),%edx
c0109cf0:	89 50 18             	mov    %edx,0x18(%eax)
c0109cf3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109cf6:	8b 55 0c             	mov    0xc(%ebp),%edx
c0109cf9:	89 50 1c             	mov    %edx,0x1c(%eax)
c0109cfc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109cff:	8b 55 14             	mov    0x14(%ebp),%edx
c0109d02:	89 50 20             	mov    %edx,0x20(%eax)
c0109d05:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109d08:	8b 55 18             	mov    0x18(%ebp),%edx
c0109d0b:	89 50 24             	mov    %edx,0x24(%eax)
c0109d0e:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0109d11:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109d14:	89 50 28             	mov    %edx,0x28(%eax)
c0109d17:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109d1a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0109d20:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109d23:	8b 10                	mov    (%eax),%edx
c0109d25:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109d28:	89 50 04             	mov    %edx,0x4(%eax)
c0109d2b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109d2e:	8b 50 04             	mov    0x4(%eax),%edx
c0109d31:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109d34:	89 50 08             	mov    %edx,0x8(%eax)
c0109d37:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109d3a:	8b 50 08             	mov    0x8(%eax),%edx
c0109d3d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109d40:	89 50 0c             	mov    %edx,0xc(%eax)
c0109d43:	83 ec 0c             	sub    $0xc,%esp
c0109d46:	68 ec fd 10 c0       	push   $0xc010fdec
c0109d4b:	e8 93 00 00 00       	call   c0109de3 <isListEmpty>
c0109d50:	83 c4 10             	add    $0x10,%esp
c0109d53:	e8 3d ce ff ff       	call   c0106b95 <intr_disable>
c0109d58:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109d5b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109d5e:	05 60 02 00 00       	add    $0x260,%eax
c0109d63:	83 ec 08             	sub    $0x8,%esp
c0109d66:	50                   	push   %eax
c0109d67:	68 ec fd 10 c0       	push   $0xc010fdec
c0109d6c:	e8 6f 01 00 00       	call   c0109ee0 <appendToDoubleLinkList>
c0109d71:	83 c4 10             	add    $0x10,%esp
c0109d74:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109d77:	05 6a 02 00 00       	add    $0x26a,%eax
c0109d7c:	83 ec 08             	sub    $0x8,%esp
c0109d7f:	50                   	push   %eax
c0109d80:	68 04 0f 11 c0       	push   $0xc0110f04
c0109d85:	e8 56 01 00 00       	call   c0109ee0 <appendToDoubleLinkList>
c0109d8a:	83 c4 10             	add    $0x10,%esp
c0109d8d:	83 ec 0c             	sub    $0xc,%esp
c0109d90:	ff 75 e0             	pushl  -0x20(%ebp)
c0109d93:	e8 26 ce ff ff       	call   c0106bbe <intr_set_status>
c0109d98:	83 c4 10             	add    $0x10,%esp
c0109d9b:	90                   	nop
c0109d9c:	c9                   	leave  
c0109d9d:	c3                   	ret    
c0109d9e:	66 90                	xchg   %ax,%ax

c0109da0 <switch_to>:
c0109da0:	56                   	push   %esi
c0109da1:	57                   	push   %edi
c0109da2:	53                   	push   %ebx
c0109da3:	55                   	push   %ebp
c0109da4:	89 e5                	mov    %esp,%ebp
c0109da6:	8b 45 14             	mov    0x14(%ebp),%eax
c0109da9:	89 20                	mov    %esp,(%eax)
c0109dab:	8b 45 18             	mov    0x18(%ebp),%eax
c0109dae:	8b 20                	mov    (%eax),%esp
c0109db0:	5d                   	pop    %ebp
c0109db1:	5b                   	pop    %ebx
c0109db2:	5f                   	pop    %edi
c0109db3:	5e                   	pop    %esi
c0109db4:	c3                   	ret    

c0109db5 <initDoubleLinkList>:
c0109db5:	55                   	push   %ebp
c0109db6:	89 e5                	mov    %esp,%ebp
c0109db8:	8b 45 08             	mov    0x8(%ebp),%eax
c0109dbb:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0109dc1:	8b 45 08             	mov    0x8(%ebp),%eax
c0109dc4:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c0109dcb:	8b 45 08             	mov    0x8(%ebp),%eax
c0109dce:	8d 50 08             	lea    0x8(%eax),%edx
c0109dd1:	8b 45 08             	mov    0x8(%ebp),%eax
c0109dd4:	89 50 04             	mov    %edx,0x4(%eax)
c0109dd7:	8b 55 08             	mov    0x8(%ebp),%edx
c0109dda:	8b 45 08             	mov    0x8(%ebp),%eax
c0109ddd:	89 50 08             	mov    %edx,0x8(%eax)
c0109de0:	90                   	nop
c0109de1:	5d                   	pop    %ebp
c0109de2:	c3                   	ret    

c0109de3 <isListEmpty>:
c0109de3:	55                   	push   %ebp
c0109de4:	89 e5                	mov    %esp,%ebp
c0109de6:	8b 45 08             	mov    0x8(%ebp),%eax
c0109de9:	8b 40 04             	mov    0x4(%eax),%eax
c0109dec:	8b 55 08             	mov    0x8(%ebp),%edx
c0109def:	83 c2 08             	add    $0x8,%edx
c0109df2:	39 d0                	cmp    %edx,%eax
c0109df4:	75 07                	jne    c0109dfd <isListEmpty+0x1a>
c0109df6:	b8 01 00 00 00       	mov    $0x1,%eax
c0109dfb:	eb 05                	jmp    c0109e02 <isListEmpty+0x1f>
c0109dfd:	b8 00 00 00 00       	mov    $0x0,%eax
c0109e02:	5d                   	pop    %ebp
c0109e03:	c3                   	ret    

c0109e04 <findElementInList>:
c0109e04:	55                   	push   %ebp
c0109e05:	89 e5                	mov    %esp,%ebp
c0109e07:	83 ec 28             	sub    $0x28,%esp
c0109e0a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0109e0e:	75 19                	jne    c0109e29 <findElementInList+0x25>
c0109e10:	6a 60                	push   $0x60
c0109e12:	68 11 b2 10 c0       	push   $0xc010b211
c0109e17:	68 11 b2 10 c0       	push   $0xc010b211
c0109e1c:	68 24 b2 10 c0       	push   $0xc010b224
c0109e21:	e8 02 e8 ff ff       	call   c0108628 <assertion_failure>
c0109e26:	83 c4 10             	add    $0x10,%esp
c0109e29:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0109e2d:	75 19                	jne    c0109e48 <findElementInList+0x44>
c0109e2f:	6a 61                	push   $0x61
c0109e31:	68 11 b2 10 c0       	push   $0xc010b211
c0109e36:	68 11 b2 10 c0       	push   $0xc010b211
c0109e3b:	68 30 b2 10 c0       	push   $0xc010b230
c0109e40:	e8 e3 e7 ff ff       	call   c0108628 <assertion_failure>
c0109e45:	83 c4 10             	add    $0x10,%esp
c0109e48:	e8 48 cd ff ff       	call   c0106b95 <intr_disable>
c0109e4d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109e50:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0109e57:	8b 45 08             	mov    0x8(%ebp),%eax
c0109e5a:	8b 40 08             	mov    0x8(%eax),%eax
c0109e5d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0109e60:	8b 45 08             	mov    0x8(%ebp),%eax
c0109e63:	8b 40 04             	mov    0x4(%eax),%eax
c0109e66:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109e69:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0109e6d:	75 07                	jne    c0109e76 <findElementInList+0x72>
c0109e6f:	b8 00 00 00 00       	mov    $0x0,%eax
c0109e74:	eb 68                	jmp    c0109ede <findElementInList+0xda>
c0109e76:	8b 45 0c             	mov    0xc(%ebp),%eax
c0109e79:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109e7c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109e7f:	2b 45 f0             	sub    -0x10(%ebp),%eax
c0109e82:	c1 f8 03             	sar    $0x3,%eax
c0109e85:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109e88:	eb 36                	jmp    c0109ec0 <findElementInList+0xbc>
c0109e8a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109e8d:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c0109e90:	75 07                	jne    c0109e99 <findElementInList+0x95>
c0109e92:	b8 01 00 00 00       	mov    $0x1,%eax
c0109e97:	eb 45                	jmp    c0109ede <findElementInList+0xda>
c0109e99:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0109e9d:	75 07                	jne    c0109ea6 <findElementInList+0xa2>
c0109e9f:	b8 00 00 00 00       	mov    $0x0,%eax
c0109ea4:	eb 38                	jmp    c0109ede <findElementInList+0xda>
c0109ea6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109ea9:	8b 40 04             	mov    0x4(%eax),%eax
c0109eac:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109eaf:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0109eb3:	75 07                	jne    c0109ebc <findElementInList+0xb8>
c0109eb5:	b8 00 00 00 00       	mov    $0x0,%eax
c0109eba:	eb 22                	jmp    c0109ede <findElementInList+0xda>
c0109ebc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0109ec0:	8b 45 08             	mov    0x8(%ebp),%eax
c0109ec3:	83 c0 08             	add    $0x8,%eax
c0109ec6:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0109ec9:	75 bf                	jne    c0109e8a <findElementInList+0x86>
c0109ecb:	83 ec 0c             	sub    $0xc,%esp
c0109ece:	ff 75 ec             	pushl  -0x14(%ebp)
c0109ed1:	e8 e8 cc ff ff       	call   c0106bbe <intr_set_status>
c0109ed6:	83 c4 10             	add    $0x10,%esp
c0109ed9:	b8 00 00 00 00       	mov    $0x0,%eax
c0109ede:	c9                   	leave  
c0109edf:	c3                   	ret    

c0109ee0 <appendToDoubleLinkList>:
c0109ee0:	55                   	push   %ebp
c0109ee1:	89 e5                	mov    %esp,%ebp
c0109ee3:	83 ec 18             	sub    $0x18,%esp
c0109ee6:	83 ec 08             	sub    $0x8,%esp
c0109ee9:	ff 75 0c             	pushl  0xc(%ebp)
c0109eec:	ff 75 08             	pushl  0x8(%ebp)
c0109eef:	e8 10 ff ff ff       	call   c0109e04 <findElementInList>
c0109ef4:	83 c4 10             	add    $0x10,%esp
c0109ef7:	3c 01                	cmp    $0x1,%al
c0109ef9:	0f 84 c2 00 00 00    	je     c0109fc1 <appendToDoubleLinkList+0xe1>
c0109eff:	e8 91 cc ff ff       	call   c0106b95 <intr_disable>
c0109f04:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109f07:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0109f0b:	75 1c                	jne    c0109f29 <appendToDoubleLinkList+0x49>
c0109f0d:	68 9e 00 00 00       	push   $0x9e
c0109f12:	68 11 b2 10 c0       	push   $0xc010b211
c0109f17:	68 11 b2 10 c0       	push   $0xc010b211
c0109f1c:	68 24 b2 10 c0       	push   $0xc010b224
c0109f21:	e8 02 e7 ff ff       	call   c0108628 <assertion_failure>
c0109f26:	83 c4 10             	add    $0x10,%esp
c0109f29:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0109f2d:	75 1c                	jne    c0109f4b <appendToDoubleLinkList+0x6b>
c0109f2f:	68 9f 00 00 00       	push   $0x9f
c0109f34:	68 11 b2 10 c0       	push   $0xc010b211
c0109f39:	68 11 b2 10 c0       	push   $0xc010b211
c0109f3e:	68 30 b2 10 c0       	push   $0xc010b230
c0109f43:	e8 e0 e6 ff ff       	call   c0108628 <assertion_failure>
c0109f48:	83 c4 10             	add    $0x10,%esp
c0109f4b:	83 ec 08             	sub    $0x8,%esp
c0109f4e:	ff 75 0c             	pushl  0xc(%ebp)
c0109f51:	ff 75 08             	pushl  0x8(%ebp)
c0109f54:	e8 ab fe ff ff       	call   c0109e04 <findElementInList>
c0109f59:	83 c4 10             	add    $0x10,%esp
c0109f5c:	3c 01                	cmp    $0x1,%al
c0109f5e:	74 64                	je     c0109fc4 <appendToDoubleLinkList+0xe4>
c0109f60:	8b 45 0c             	mov    0xc(%ebp),%eax
c0109f63:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109f66:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109f69:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0109f70:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109f73:	8b 50 04             	mov    0x4(%eax),%edx
c0109f76:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109f79:	89 10                	mov    %edx,(%eax)
c0109f7b:	8b 45 08             	mov    0x8(%ebp),%eax
c0109f7e:	8b 50 08             	mov    0x8(%eax),%edx
c0109f81:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109f84:	89 10                	mov    %edx,(%eax)
c0109f86:	8b 45 08             	mov    0x8(%ebp),%eax
c0109f89:	8b 40 08             	mov    0x8(%eax),%eax
c0109f8c:	85 c0                	test   %eax,%eax
c0109f8e:	74 0c                	je     c0109f9c <appendToDoubleLinkList+0xbc>
c0109f90:	8b 45 08             	mov    0x8(%ebp),%eax
c0109f93:	8b 40 08             	mov    0x8(%eax),%eax
c0109f96:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0109f99:	89 50 04             	mov    %edx,0x4(%eax)
c0109f9c:	8b 45 08             	mov    0x8(%ebp),%eax
c0109f9f:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0109fa2:	89 50 08             	mov    %edx,0x8(%eax)
c0109fa5:	8b 45 08             	mov    0x8(%ebp),%eax
c0109fa8:	8d 50 08             	lea    0x8(%eax),%edx
c0109fab:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109fae:	89 50 04             	mov    %edx,0x4(%eax)
c0109fb1:	83 ec 0c             	sub    $0xc,%esp
c0109fb4:	ff 75 f4             	pushl  -0xc(%ebp)
c0109fb7:	e8 02 cc ff ff       	call   c0106bbe <intr_set_status>
c0109fbc:	83 c4 10             	add    $0x10,%esp
c0109fbf:	eb 04                	jmp    c0109fc5 <appendToDoubleLinkList+0xe5>
c0109fc1:	90                   	nop
c0109fc2:	eb 01                	jmp    c0109fc5 <appendToDoubleLinkList+0xe5>
c0109fc4:	90                   	nop
c0109fc5:	c9                   	leave  
c0109fc6:	c3                   	ret    

c0109fc7 <insertToDoubleLinkList>:
c0109fc7:	55                   	push   %ebp
c0109fc8:	89 e5                	mov    %esp,%ebp
c0109fca:	83 ec 18             	sub    $0x18,%esp
c0109fcd:	83 ec 08             	sub    $0x8,%esp
c0109fd0:	ff 75 0c             	pushl  0xc(%ebp)
c0109fd3:	ff 75 08             	pushl  0x8(%ebp)
c0109fd6:	e8 29 fe ff ff       	call   c0109e04 <findElementInList>
c0109fdb:	83 c4 10             	add    $0x10,%esp
c0109fde:	3c 01                	cmp    $0x1,%al
c0109fe0:	74 65                	je     c010a047 <insertToDoubleLinkList+0x80>
c0109fe2:	e8 ae cb ff ff       	call   c0106b95 <intr_disable>
c0109fe7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109fea:	8b 45 0c             	mov    0xc(%ebp),%eax
c0109fed:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109ff0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109ff3:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0109ffa:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109ffd:	8b 50 04             	mov    0x4(%eax),%edx
c010a000:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a003:	89 10                	mov    %edx,(%eax)
c010a005:	8b 45 08             	mov    0x8(%ebp),%eax
c010a008:	8b 50 04             	mov    0x4(%eax),%edx
c010a00b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a00e:	89 50 04             	mov    %edx,0x4(%eax)
c010a011:	8b 45 08             	mov    0x8(%ebp),%eax
c010a014:	8b 40 04             	mov    0x4(%eax),%eax
c010a017:	85 c0                	test   %eax,%eax
c010a019:	74 0b                	je     c010a026 <insertToDoubleLinkList+0x5f>
c010a01b:	8b 45 08             	mov    0x8(%ebp),%eax
c010a01e:	8b 40 04             	mov    0x4(%eax),%eax
c010a021:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010a024:	89 10                	mov    %edx,(%eax)
c010a026:	8b 45 08             	mov    0x8(%ebp),%eax
c010a029:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010a02c:	89 50 04             	mov    %edx,0x4(%eax)
c010a02f:	8b 55 08             	mov    0x8(%ebp),%edx
c010a032:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a035:	89 10                	mov    %edx,(%eax)
c010a037:	83 ec 0c             	sub    $0xc,%esp
c010a03a:	ff 75 f4             	pushl  -0xc(%ebp)
c010a03d:	e8 7c cb ff ff       	call   c0106bbe <intr_set_status>
c010a042:	83 c4 10             	add    $0x10,%esp
c010a045:	eb 01                	jmp    c010a048 <insertToDoubleLinkList+0x81>
c010a047:	90                   	nop
c010a048:	c9                   	leave  
c010a049:	c3                   	ret    

c010a04a <popFromDoubleLinkList>:
c010a04a:	55                   	push   %ebp
c010a04b:	89 e5                	mov    %esp,%ebp
c010a04d:	83 ec 18             	sub    $0x18,%esp
c010a050:	e8 40 cb ff ff       	call   c0106b95 <intr_disable>
c010a055:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a058:	83 ec 0c             	sub    $0xc,%esp
c010a05b:	ff 75 08             	pushl  0x8(%ebp)
c010a05e:	e8 80 fd ff ff       	call   c0109de3 <isListEmpty>
c010a063:	83 c4 10             	add    $0x10,%esp
c010a066:	3c 01                	cmp    $0x1,%al
c010a068:	75 07                	jne    c010a071 <popFromDoubleLinkList+0x27>
c010a06a:	b8 00 00 00 00       	mov    $0x0,%eax
c010a06f:	eb 6b                	jmp    c010a0dc <popFromDoubleLinkList+0x92>
c010a071:	8b 45 08             	mov    0x8(%ebp),%eax
c010a074:	8b 40 08             	mov    0x8(%eax),%eax
c010a077:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a07a:	8b 45 08             	mov    0x8(%ebp),%eax
c010a07d:	8b 40 08             	mov    0x8(%eax),%eax
c010a080:	85 c0                	test   %eax,%eax
c010a082:	75 07                	jne    c010a08b <popFromDoubleLinkList+0x41>
c010a084:	b8 00 00 00 00       	mov    $0x0,%eax
c010a089:	eb 51                	jmp    c010a0dc <popFromDoubleLinkList+0x92>
c010a08b:	8b 45 08             	mov    0x8(%ebp),%eax
c010a08e:	8b 40 08             	mov    0x8(%eax),%eax
c010a091:	8b 00                	mov    (%eax),%eax
c010a093:	85 c0                	test   %eax,%eax
c010a095:	74 11                	je     c010a0a8 <popFromDoubleLinkList+0x5e>
c010a097:	8b 45 08             	mov    0x8(%ebp),%eax
c010a09a:	8b 40 08             	mov    0x8(%eax),%eax
c010a09d:	8b 00                	mov    (%eax),%eax
c010a09f:	8b 55 08             	mov    0x8(%ebp),%edx
c010a0a2:	83 c2 08             	add    $0x8,%edx
c010a0a5:	89 50 04             	mov    %edx,0x4(%eax)
c010a0a8:	8b 45 08             	mov    0x8(%ebp),%eax
c010a0ab:	8b 40 08             	mov    0x8(%eax),%eax
c010a0ae:	8b 10                	mov    (%eax),%edx
c010a0b0:	8b 45 08             	mov    0x8(%ebp),%eax
c010a0b3:	89 50 08             	mov    %edx,0x8(%eax)
c010a0b6:	83 ec 0c             	sub    $0xc,%esp
c010a0b9:	ff 75 f4             	pushl  -0xc(%ebp)
c010a0bc:	e8 fd ca ff ff       	call   c0106bbe <intr_set_status>
c010a0c1:	83 c4 10             	add    $0x10,%esp
c010a0c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a0c7:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c010a0ce:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a0d1:	8b 50 04             	mov    0x4(%eax),%edx
c010a0d4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a0d7:	89 10                	mov    %edx,(%eax)
c010a0d9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a0dc:	c9                   	leave  
c010a0dd:	c3                   	ret    

c010a0de <kernel_thread>:
c010a0de:	55                   	push   %ebp
c010a0df:	89 e5                	mov    %esp,%ebp
c010a0e1:	83 ec 08             	sub    $0x8,%esp
c010a0e4:	fb                   	sti    
c010a0e5:	83 ec 0c             	sub    $0xc,%esp
c010a0e8:	ff 75 0c             	pushl  0xc(%ebp)
c010a0eb:	8b 45 08             	mov    0x8(%ebp),%eax
c010a0ee:	ff d0                	call   *%eax
c010a0f0:	83 c4 10             	add    $0x10,%esp
c010a0f3:	90                   	nop
c010a0f4:	c9                   	leave  
c010a0f5:	c3                   	ret    

c010a0f6 <thread_init>:
c010a0f6:	55                   	push   %ebp
c010a0f7:	89 e5                	mov    %esp,%ebp
c010a0f9:	83 ec 18             	sub    $0x18,%esp
c010a0fc:	83 ec 08             	sub    $0x8,%esp
c010a0ff:	6a 00                	push   $0x0
c010a101:	6a 01                	push   $0x1
c010a103:	e8 bc bf ff ff       	call   c01060c4 <alloc_memory>
c010a108:	83 c4 10             	add    $0x10,%esp
c010a10b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a10e:	83 ec 04             	sub    $0x4,%esp
c010a111:	68 00 10 00 00       	push   $0x1000
c010a116:	6a 00                	push   $0x0
c010a118:	ff 75 f4             	pushl  -0xc(%ebp)
c010a11b:	e8 4b 11 00 00       	call   c010b26b <Memset>
c010a120:	83 c4 10             	add    $0x10,%esp
c010a123:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a126:	05 00 10 00 00       	add    $0x1000,%eax
c010a12b:	89 c2                	mov    %eax,%edx
c010a12d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a130:	89 10                	mov    %edx,(%eax)
c010a132:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a135:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c010a13c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a13f:	c7 80 58 02 00 00 ff 	movl   $0xffffffff,0x258(%eax)
c010a146:	ff ff ff 
c010a149:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a14c:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c010a153:	00 00 00 
c010a156:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a159:	8b 90 50 02 00 00    	mov    0x250(%eax),%edx
c010a15f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a162:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c010a168:	a1 90 f7 10 c0       	mov    0xc010f790,%eax
c010a16d:	83 c0 01             	add    $0x1,%eax
c010a170:	a3 90 f7 10 c0       	mov    %eax,0xc010f790
c010a175:	8b 15 90 f7 10 c0    	mov    0xc010f790,%edx
c010a17b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a17e:	89 90 14 01 00 00    	mov    %edx,0x114(%eax)
c010a184:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a187:	c7 80 18 01 00 00 0f 	movl   $0xf,0x118(%eax)
c010a18e:	00 00 00 
c010a191:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a194:	c7 80 b8 02 00 00 e0 	movl   $0x99abcde0,0x2b8(%eax)
c010a19b:	cd ab 99 
c010a19e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a1a1:	c9                   	leave  
c010a1a2:	c3                   	ret    

c010a1a3 <thread_create>:
c010a1a3:	55                   	push   %ebp
c010a1a4:	89 e5                	mov    %esp,%ebp
c010a1a6:	83 ec 10             	sub    $0x10,%esp
c010a1a9:	c7 45 fc 44 00 00 00 	movl   $0x44,-0x4(%ebp)
c010a1b0:	c7 45 f8 30 00 00 00 	movl   $0x30,-0x8(%ebp)
c010a1b7:	8b 45 08             	mov    0x8(%ebp),%eax
c010a1ba:	8b 00                	mov    (%eax),%eax
c010a1bc:	2b 45 fc             	sub    -0x4(%ebp),%eax
c010a1bf:	89 c2                	mov    %eax,%edx
c010a1c1:	8b 45 08             	mov    0x8(%ebp),%eax
c010a1c4:	89 10                	mov    %edx,(%eax)
c010a1c6:	8b 45 08             	mov    0x8(%ebp),%eax
c010a1c9:	8b 00                	mov    (%eax),%eax
c010a1cb:	2b 45 f8             	sub    -0x8(%ebp),%eax
c010a1ce:	89 c2                	mov    %eax,%edx
c010a1d0:	8b 45 08             	mov    0x8(%ebp),%eax
c010a1d3:	89 10                	mov    %edx,(%eax)
c010a1d5:	90                   	nop
c010a1d6:	c9                   	leave  
c010a1d7:	c3                   	ret    

c010a1d8 <thread_start>:
c010a1d8:	55                   	push   %ebp
c010a1d9:	89 e5                	mov    %esp,%ebp
c010a1db:	83 ec 18             	sub    $0x18,%esp
c010a1de:	e8 13 ff ff ff       	call   c010a0f6 <thread_init>
c010a1e3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a1e6:	83 ec 0c             	sub    $0xc,%esp
c010a1e9:	ff 75 f4             	pushl  -0xc(%ebp)
c010a1ec:	e8 b2 ff ff ff       	call   c010a1a3 <thread_create>
c010a1f1:	83 c4 10             	add    $0x10,%esp
c010a1f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a1f7:	05 28 01 00 00       	add    $0x128,%eax
c010a1fc:	83 ec 08             	sub    $0x8,%esp
c010a1ff:	ff 75 10             	pushl  0x10(%ebp)
c010a202:	50                   	push   %eax
c010a203:	e8 82 10 00 00       	call   c010b28a <Strcpy>
c010a208:	83 c4 10             	add    $0x10,%esp
c010a20b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a20e:	8b 00                	mov    (%eax),%eax
c010a210:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a213:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a216:	c7 40 10 de a0 10 c0 	movl   $0xc010a0de,0x10(%eax)
c010a21d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a220:	8b 55 08             	mov    0x8(%ebp),%edx
c010a223:	89 50 18             	mov    %edx,0x18(%eax)
c010a226:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a229:	8b 55 0c             	mov    0xc(%ebp),%edx
c010a22c:	89 50 1c             	mov    %edx,0x1c(%eax)
c010a22f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a232:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010a238:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a23b:	8b 10                	mov    (%eax),%edx
c010a23d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a240:	89 50 04             	mov    %edx,0x4(%eax)
c010a243:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a246:	8b 50 04             	mov    0x4(%eax),%edx
c010a249:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a24c:	89 50 08             	mov    %edx,0x8(%eax)
c010a24f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a252:	8b 50 08             	mov    0x8(%eax),%edx
c010a255:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a258:	89 50 0c             	mov    %edx,0xc(%eax)
c010a25b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a25e:	05 60 02 00 00       	add    $0x260,%eax
c010a263:	83 ec 08             	sub    $0x8,%esp
c010a266:	50                   	push   %eax
c010a267:	68 ec fd 10 c0       	push   $0xc010fdec
c010a26c:	e8 6f fc ff ff       	call   c0109ee0 <appendToDoubleLinkList>
c010a271:	83 c4 10             	add    $0x10,%esp
c010a274:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a277:	05 6a 02 00 00       	add    $0x26a,%eax
c010a27c:	83 ec 08             	sub    $0x8,%esp
c010a27f:	50                   	push   %eax
c010a280:	68 04 0f 11 c0       	push   $0xc0110f04
c010a285:	e8 56 fc ff ff       	call   c0109ee0 <appendToDoubleLinkList>
c010a28a:	83 c4 10             	add    $0x10,%esp
c010a28d:	90                   	nop
c010a28e:	c9                   	leave  
c010a28f:	c3                   	ret    
