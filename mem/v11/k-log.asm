
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
c0100025:	e8 8e 3a 00 00       	call   c0103ab8 <ReloadGDT>
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
c010014b:	e8 ad 6f 00 00       	call   c01070fd <exception_handler>
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
c0100168:	e8 90 6f 00 00       	call   c01070fd <exception_handler>
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
c0100195:	e8 fb 34 00 00       	call   c0103695 <clock_handler>
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
c01001c7:	e8 41 44 00 00       	call   c010460d <keyboard_handler>
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
c010020d:	e8 3c 11 00 00       	call   c010134e <hd_handler>
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
c01002f5:	e8 9d 6c 00 00       	call   c0106f97 <disp_int>
c01002fa:	83 c4 04             	add    $0x4,%esp
c01002fd:	58                   	pop    %eax
c01002fe:	5a                   	pop    %edx
c01002ff:	52                   	push   %edx
c0100300:	50                   	push   %eax
c0100301:	e8 91 6c 00 00       	call   c0106f97 <disp_int>
c0100306:	58                   	pop    %eax
c0100307:	5a                   	pop    %edx
c0100308:	52                   	push   %edx
c0100309:	50                   	push   %eax
c010030a:	ff 35 a8 f7 10 c0    	pushl  0xc010f7a8
c0100310:	e8 82 6c 00 00       	call   c0106f97 <disp_int>
c0100315:	83 c4 04             	add    $0x4,%esp
c0100318:	58                   	pop    %eax
c0100319:	5a                   	pop    %edx
c010031a:	52                   	push   %edx
c010031b:	50                   	push   %eax
c010031c:	ff 72 ec             	pushl  -0x14(%edx)
c010031f:	e8 73 6c 00 00       	call   c0106f97 <disp_int>
c0100324:	83 c4 04             	add    $0x4,%esp
c0100327:	58                   	pop    %eax
c0100328:	5a                   	pop    %edx
c0100329:	52                   	push   %edx
c010032a:	50                   	push   %eax
c010032b:	ff 70 ec             	pushl  -0x14(%eax)
c010032e:	e8 64 6c 00 00       	call   c0106f97 <disp_int>
c0100333:	83 c4 04             	add    $0x4,%esp
c0100336:	58                   	pop    %eax
c0100337:	5a                   	pop    %edx
c0100338:	52                   	push   %edx
c0100339:	50                   	push   %eax
c010033a:	ff 35 c0 fb 10 c0    	pushl  0xc010fbc0
c0100340:	e8 52 6c 00 00       	call   c0106f97 <disp_int>
c0100345:	83 c4 04             	add    $0x4,%esp
c0100348:	58                   	pop    %eax
c0100349:	5a                   	pop    %edx
c010034a:	52                   	push   %edx
c010034b:	50                   	push   %eax
c010034c:	68 60 f7 10 c0       	push   $0xc010f760
c0100351:	e8 41 6c 00 00       	call   c0106f97 <disp_int>
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
c01003b7:	e8 7b 01 00 00       	call   c0100537 <init>
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
c010040b:	68 20 a2 10 c0       	push   $0xc010a220
c0100410:	50                   	push   %eax
c0100411:	e8 34 ae 00 00       	call   c010b24a <Strcpy>
c0100416:	83 c4 10             	add    $0x10,%esp
c0100419:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c010041e:	a3 c0 fb 10 c0       	mov    %eax,0xc010fbc0
c0100423:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c0100428:	05 60 02 00 00       	add    $0x260,%eax
c010042d:	83 ec 08             	sub    $0x8,%esp
c0100430:	50                   	push   %eax
c0100431:	68 ec fd 10 c0       	push   $0xc010fdec
c0100436:	e8 35 9a 00 00       	call   c0109e70 <appendToDoubleLinkList>
c010043b:	83 c4 10             	add    $0x10,%esp
c010043e:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c0100443:	05 6a 02 00 00       	add    $0x26a,%eax
c0100448:	83 ec 08             	sub    $0x8,%esp
c010044b:	50                   	push   %eax
c010044c:	68 ec fd 10 c0       	push   $0xc010fdec
c0100451:	e8 1a 9a 00 00       	call   c0109e70 <appendToDoubleLinkList>
c0100456:	83 c4 10             	add    $0x10,%esp
c0100459:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010045c:	83 ec 0c             	sub    $0xc,%esp
c010045f:	50                   	push   %eax
c0100460:	6a 00                	push   $0x0
c0100462:	68 2c a2 10 c0       	push   $0xc010a22c
c0100467:	68 33 a2 10 c0       	push   $0xc010a233
c010046c:	68 74 50 10 c0       	push   $0xc0105074
c0100471:	e8 34 97 00 00       	call   c0109baa <process_execute>
c0100476:	83 c4 20             	add    $0x20,%esp
c0100479:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010047c:	83 ec 0c             	sub    $0xc,%esp
c010047f:	50                   	push   %eax
c0100480:	6a 00                	push   $0x0
c0100482:	68 3c a2 10 c0       	push   $0xc010a23c
c0100487:	68 44 a2 10 c0       	push   $0xc010a244
c010048c:	68 59 15 10 c0       	push   $0xc0101559
c0100491:	e8 14 97 00 00       	call   c0109baa <process_execute>
c0100496:	83 c4 20             	add    $0x20,%esp
c0100499:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010049c:	83 ec 0c             	sub    $0xc,%esp
c010049f:	50                   	push   %eax
c01004a0:	6a 00                	push   $0x0
c01004a2:	68 4d a2 10 c0       	push   $0xc010a24d
c01004a7:	68 54 a2 10 c0       	push   $0xc010a254
c01004ac:	68 c6 06 10 c0       	push   $0xc01006c6
c01004b1:	e8 f4 96 00 00       	call   c0109baa <process_execute>
c01004b6:	83 c4 20             	add    $0x20,%esp
c01004b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01004bc:	83 ec 0c             	sub    $0xc,%esp
c01004bf:	50                   	push   %eax
c01004c0:	6a 00                	push   $0x0
c01004c2:	68 5d a2 10 c0       	push   $0xc010a25d
c01004c7:	68 65 a2 10 c0       	push   $0xc010a265
c01004cc:	68 0a 45 10 c0       	push   $0xc010450a
c01004d1:	e8 d4 96 00 00       	call   c0109baa <process_execute>
c01004d6:	83 c4 20             	add    $0x20,%esp
c01004d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01004dc:	83 e8 02             	sub    $0x2,%eax
c01004df:	83 ec 0c             	sub    $0xc,%esp
c01004e2:	50                   	push   %eax
c01004e3:	6a 01                	push   $0x1
c01004e5:	68 6f a2 10 c0       	push   $0xc010a26f
c01004ea:	68 79 a2 10 c0       	push   $0xc010a279
c01004ef:	68 91 06 10 c0       	push   $0xc0100691
c01004f4:	e8 b1 96 00 00       	call   c0109baa <process_execute>
c01004f9:	83 c4 20             	add    $0x20,%esp
c01004fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01004ff:	83 e8 03             	sub    $0x3,%eax
c0100502:	83 ec 0c             	sub    $0xc,%esp
c0100505:	50                   	push   %eax
c0100506:	6a 01                	push   $0x1
c0100508:	68 86 a2 10 c0       	push   $0xc010a286
c010050d:	68 90 a2 10 c0       	push   $0xc010a290
c0100512:	68 ae 06 10 c0       	push   $0xc01006ae
c0100517:	e8 8e 96 00 00       	call   c0109baa <process_execute>
c010051c:	83 c4 20             	add    $0x20,%esp
c010051f:	83 ec 0c             	sub    $0xc,%esp
c0100522:	68 9d a2 10 c0       	push   $0xc010a29d
c0100527:	e8 60 fb ff ff       	call   c010008c <disp_str>
c010052c:	83 c4 10             	add    $0x10,%esp
c010052f:	fb                   	sti    
c0100530:	e8 86 65 00 00       	call   c0106abb <stop_here>
c0100535:	eb f9                	jmp    c0100530 <kernel_main+0x17f>

c0100537 <init>:
c0100537:	55                   	push   %ebp
c0100538:	89 e5                	mov    %esp,%ebp
c010053a:	83 ec 08             	sub    $0x8,%esp
c010053d:	c7 05 28 0f 11 c0 00 	movl   $0x400000,0xc0110f28
c0100544:	00 40 00 
c0100547:	c7 05 a8 f7 10 c0 63 	movl   $0x63,0xc010f7a8
c010054e:	00 00 00 
c0100551:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0100558:	00 00 00 
c010055b:	c7 05 90 f7 10 c0 00 	movl   $0x0,0xc010f790
c0100562:	00 00 00 
c0100565:	c7 05 c4 06 11 c0 64 	movl   $0x64,0xc01106c4
c010056c:	00 00 00 
c010056f:	c7 05 fc fd 10 c0 09 	movl   $0x9,0xc010fdfc
c0100576:	00 00 00 
c0100579:	c7 05 c0 fb 10 c0 00 	movl   $0x0,0xc010fbc0
c0100580:	00 00 00 
c0100583:	83 ec 0c             	sub    $0xc,%esp
c0100586:	68 a7 a2 10 c0       	push   $0xc010a2a7
c010058b:	e8 fc fa ff ff       	call   c010008c <disp_str>
c0100590:	83 c4 10             	add    $0x10,%esp
c0100593:	e8 4f 6f 00 00       	call   c01074e7 <init_keyboard>
c0100598:	83 ec 0c             	sub    $0xc,%esp
c010059b:	68 00 00 00 04       	push   $0x4000000
c01005a0:	e8 cd 63 00 00       	call   c0106972 <init_memory>
c01005a5:	83 c4 10             	add    $0x10,%esp
c01005a8:	83 ec 0c             	sub    $0xc,%esp
c01005ab:	68 ec fd 10 c0       	push   $0xc010fdec
c01005b0:	e8 90 97 00 00       	call   c0109d45 <initDoubleLinkList>
c01005b5:	83 c4 10             	add    $0x10,%esp
c01005b8:	83 ec 0c             	sub    $0xc,%esp
c01005bb:	68 04 0f 11 c0       	push   $0xc0110f04
c01005c0:	e8 80 97 00 00       	call   c0109d45 <initDoubleLinkList>
c01005c5:	83 c4 10             	add    $0x10,%esp
c01005c8:	90                   	nop
c01005c9:	c9                   	leave  
c01005ca:	c3                   	ret    

c01005cb <kernel_thread_a>:
c01005cb:	55                   	push   %ebp
c01005cc:	89 e5                	mov    %esp,%ebp
c01005ce:	83 ec 18             	sub    $0x18,%esp
c01005d1:	83 ec 0c             	sub    $0xc,%esp
c01005d4:	ff 75 08             	pushl  0x8(%ebp)
c01005d7:	e8 b0 fa ff ff       	call   c010008c <disp_str>
c01005dc:	83 c4 10             	add    $0x10,%esp
c01005df:	a1 a4 f7 10 c0       	mov    0xc010f7a4,%eax
c01005e4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01005e7:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01005ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01005f1:	a3 a4 f7 10 c0       	mov    %eax,0xc010f7a4
c01005f6:	83 ec 0c             	sub    $0xc,%esp
c01005f9:	68 ad a2 10 c0       	push   $0xc010a2ad
c01005fe:	e8 89 fa ff ff       	call   c010008c <disp_str>
c0100603:	83 c4 10             	add    $0x10,%esp
c0100606:	83 ec 0c             	sub    $0xc,%esp
c0100609:	68 b6 a2 10 c0       	push   $0xc010a2b6
c010060e:	e8 79 fa ff ff       	call   c010008c <disp_str>
c0100613:	83 c4 10             	add    $0x10,%esp
c0100616:	eb d6                	jmp    c01005ee <kernel_thread_a+0x23>

c0100618 <kernel_thread_b>:
c0100618:	55                   	push   %ebp
c0100619:	89 e5                	mov    %esp,%ebp
c010061b:	83 ec 18             	sub    $0x18,%esp
c010061e:	83 ec 0c             	sub    $0xc,%esp
c0100621:	ff 75 08             	pushl  0x8(%ebp)
c0100624:	e8 63 fa ff ff       	call   c010008c <disp_str>
c0100629:	83 c4 10             	add    $0x10,%esp
c010062c:	a1 a4 f7 10 c0       	mov    0xc010f7a4,%eax
c0100631:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0100634:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c010063b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010063e:	a3 a4 f7 10 c0       	mov    %eax,0xc010f7a4
c0100643:	83 ec 0c             	sub    $0xc,%esp
c0100646:	68 b8 a2 10 c0       	push   $0xc010a2b8
c010064b:	e8 3c fa ff ff       	call   c010008c <disp_str>
c0100650:	83 c4 10             	add    $0x10,%esp
c0100653:	83 ec 0c             	sub    $0xc,%esp
c0100656:	68 b6 a2 10 c0       	push   $0xc010a2b6
c010065b:	e8 2c fa ff ff       	call   c010008c <disp_str>
c0100660:	83 c4 10             	add    $0x10,%esp
c0100663:	eb d6                	jmp    c010063b <kernel_thread_b+0x23>

c0100665 <kernel_thread_c>:
c0100665:	55                   	push   %ebp
c0100666:	89 e5                	mov    %esp,%ebp
c0100668:	83 ec 08             	sub    $0x8,%esp
c010066b:	83 ec 0c             	sub    $0xc,%esp
c010066e:	ff 75 08             	pushl  0x8(%ebp)
c0100671:	e8 16 fa ff ff       	call   c010008c <disp_str>
c0100676:	83 c4 10             	add    $0x10,%esp
c0100679:	eb fe                	jmp    c0100679 <kernel_thread_c+0x14>

c010067b <kernel_thread_d>:
c010067b:	55                   	push   %ebp
c010067c:	89 e5                	mov    %esp,%ebp
c010067e:	83 ec 08             	sub    $0x8,%esp
c0100681:	83 ec 0c             	sub    $0xc,%esp
c0100684:	ff 75 08             	pushl  0x8(%ebp)
c0100687:	e8 00 fa ff ff       	call   c010008c <disp_str>
c010068c:	83 c4 10             	add    $0x10,%esp
c010068f:	eb fe                	jmp    c010068f <kernel_thread_d+0x14>

c0100691 <user_proc_a>:
c0100691:	55                   	push   %ebp
c0100692:	89 e5                	mov    %esp,%ebp
c0100694:	83 ec 08             	sub    $0x8,%esp
c0100697:	83 ec 0c             	sub    $0xc,%esp
c010069a:	68 c4 a2 10 c0       	push   $0xc010a2c4
c010069f:	e8 e8 f9 ff ff       	call   c010008c <disp_str>
c01006a4:	83 c4 10             	add    $0x10,%esp
c01006a7:	e8 1d 6f 00 00       	call   c01075c9 <TestFS>
c01006ac:	eb fe                	jmp    c01006ac <user_proc_a+0x1b>

c01006ae <user_proc_b>:
c01006ae:	55                   	push   %ebp
c01006af:	89 e5                	mov    %esp,%ebp
c01006b1:	83 ec 08             	sub    $0x8,%esp
c01006b4:	83 ec 0c             	sub    $0xc,%esp
c01006b7:	68 e4 a2 10 c0       	push   $0xc010a2e4
c01006bc:	e8 cb f9 ff ff       	call   c010008c <disp_str>
c01006c1:	83 c4 10             	add    $0x10,%esp
c01006c4:	eb fe                	jmp    c01006c4 <user_proc_b+0x16>

c01006c6 <TaskHD>:
c01006c6:	55                   	push   %ebp
c01006c7:	89 e5                	mov    %esp,%ebp
c01006c9:	83 ec 18             	sub    $0x18,%esp
c01006cc:	e8 d2 fc ff ff       	call   c01003a3 <get_running_thread_pcb>
c01006d1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01006d4:	e8 32 00 00 00       	call   c010070b <init_hd>
c01006d9:	83 ec 0c             	sub    $0xc,%esp
c01006dc:	6a 7c                	push   $0x7c
c01006de:	e8 49 0e 00 00       	call   c010152c <sys_malloc>
c01006e3:	83 c4 10             	add    $0x10,%esp
c01006e6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01006e9:	83 ec 04             	sub    $0x4,%esp
c01006ec:	6a 7c                	push   $0x7c
c01006ee:	6a 00                	push   $0x0
c01006f0:	ff 75 f0             	pushl  -0x10(%ebp)
c01006f3:	e8 33 ab 00 00       	call   c010b22b <Memset>
c01006f8:	83 c4 10             	add    $0x10,%esp
c01006fb:	83 ec 0c             	sub    $0xc,%esp
c01006fe:	ff 75 f0             	pushl  -0x10(%ebp)
c0100701:	e8 1f 00 00 00       	call   c0100725 <hd_handle>
c0100706:	83 c4 10             	add    $0x10,%esp
c0100709:	eb de                	jmp    c01006e9 <TaskHD+0x23>

c010070b <init_hd>:
c010070b:	55                   	push   %ebp
c010070c:	89 e5                	mov    %esp,%ebp
c010070e:	83 ec 18             	sub    $0x18,%esp
c0100711:	c7 45 f4 75 04 00 00 	movl   $0x475,-0xc(%ebp)
c0100718:	e8 42 fc ff ff       	call   c010035f <enable_8259A_casecade_irq>
c010071d:	e8 51 fc ff ff       	call   c0100373 <enable_8259A_slave_winchester_irq>
c0100722:	90                   	nop
c0100723:	c9                   	leave  
c0100724:	c3                   	ret    

c0100725 <hd_handle>:
c0100725:	55                   	push   %ebp
c0100726:	89 e5                	mov    %esp,%ebp
c0100728:	83 ec 18             	sub    $0x18,%esp
c010072b:	83 ec 04             	sub    $0x4,%esp
c010072e:	6a 12                	push   $0x12
c0100730:	ff 75 08             	pushl  0x8(%ebp)
c0100733:	6a 02                	push   $0x2
c0100735:	e8 e4 8a 00 00       	call   c010921e <send_rec>
c010073a:	83 c4 10             	add    $0x10,%esp
c010073d:	8b 45 08             	mov    0x8(%ebp),%eax
c0100740:	8b 40 78             	mov    0x78(%eax),%eax
c0100743:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0100746:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010074a:	0f 84 d4 00 00 00    	je     c0100824 <hd_handle+0xff>
c0100750:	8b 45 08             	mov    0x8(%ebp),%eax
c0100753:	8b 00                	mov    (%eax),%eax
c0100755:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100758:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c010075c:	74 28                	je     c0100786 <hd_handle+0x61>
c010075e:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c0100762:	74 22                	je     c0100786 <hd_handle+0x61>
c0100764:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c0100768:	74 1c                	je     c0100786 <hd_handle+0x61>
c010076a:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c010076e:	74 16                	je     c0100786 <hd_handle+0x61>
c0100770:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c0100777:	74 0d                	je     c0100786 <hd_handle+0x61>
c0100779:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c0100780:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100783:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0100786:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c010078a:	74 34                	je     c01007c0 <hd_handle+0x9b>
c010078c:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c0100790:	74 2e                	je     c01007c0 <hd_handle+0x9b>
c0100792:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c0100796:	74 28                	je     c01007c0 <hd_handle+0x9b>
c0100798:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c010079c:	74 22                	je     c01007c0 <hd_handle+0x9b>
c010079e:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c01007a5:	74 19                	je     c01007c0 <hd_handle+0x9b>
c01007a7:	6a 6d                	push   $0x6d
c01007a9:	68 04 a3 10 c0       	push   $0xc010a304
c01007ae:	68 04 a3 10 c0       	push   $0xc010a304
c01007b3:	68 0c a3 10 c0       	push   $0xc010a30c
c01007b8:	e8 f1 7d 00 00       	call   c01085ae <assertion_failure>
c01007bd:	83 c4 10             	add    $0x10,%esp
c01007c0:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c01007c4:	74 2c                	je     c01007f2 <hd_handle+0xcd>
c01007c6:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c01007ca:	77 0e                	ja     c01007da <hd_handle+0xb5>
c01007cc:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c01007d0:	74 19                	je     c01007eb <hd_handle+0xc6>
c01007d2:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c01007d6:	74 1a                	je     c01007f2 <hd_handle+0xcd>
c01007d8:	eb 37                	jmp    c0100811 <hd_handle+0xec>
c01007da:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c01007de:	74 22                	je     c0100802 <hd_handle+0xdd>
c01007e0:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c01007e7:	74 3e                	je     c0100827 <hd_handle+0x102>
c01007e9:	eb 26                	jmp    c0100811 <hd_handle+0xec>
c01007eb:	e8 e6 06 00 00       	call   c0100ed6 <hd_open>
c01007f0:	eb 36                	jmp    c0100828 <hd_handle+0x103>
c01007f2:	83 ec 0c             	sub    $0xc,%esp
c01007f5:	ff 75 08             	pushl  0x8(%ebp)
c01007f8:	e8 b2 08 00 00       	call   c01010af <hd_rdwt>
c01007fd:	83 c4 10             	add    $0x10,%esp
c0100800:	eb 26                	jmp    c0100828 <hd_handle+0x103>
c0100802:	83 ec 0c             	sub    $0xc,%esp
c0100805:	6a 00                	push   $0x0
c0100807:	e8 71 07 00 00       	call   c0100f7d <get_hd_ioctl>
c010080c:	83 c4 10             	add    $0x10,%esp
c010080f:	eb 17                	jmp    c0100828 <hd_handle+0x103>
c0100811:	83 ec 0c             	sub    $0xc,%esp
c0100814:	68 66 a3 10 c0       	push   $0xc010a366
c0100819:	e8 4c 7d 00 00       	call   c010856a <spin>
c010081e:	83 c4 10             	add    $0x10,%esp
c0100821:	90                   	nop
c0100822:	eb 04                	jmp    c0100828 <hd_handle+0x103>
c0100824:	90                   	nop
c0100825:	eb 01                	jmp    c0100828 <hd_handle+0x103>
c0100827:	90                   	nop
c0100828:	c9                   	leave  
c0100829:	c3                   	ret    

c010082a <hd_cmd_out>:
c010082a:	55                   	push   %ebp
c010082b:	89 e5                	mov    %esp,%ebp
c010082d:	83 ec 08             	sub    $0x8,%esp
c0100830:	83 ec 04             	sub    $0x4,%esp
c0100833:	68 18 73 01 00       	push   $0x17318
c0100838:	6a 00                	push   $0x0
c010083a:	68 80 00 00 00       	push   $0x80
c010083f:	e8 36 0b 00 00       	call   c010137a <waitfor>
c0100844:	83 c4 10             	add    $0x10,%esp
c0100847:	85 c0                	test   %eax,%eax
c0100849:	75 10                	jne    c010085b <hd_cmd_out+0x31>
c010084b:	83 ec 0c             	sub    $0xc,%esp
c010084e:	68 78 a3 10 c0       	push   $0xc010a378
c0100853:	e8 38 7d 00 00       	call   c0108590 <panic>
c0100858:	83 c4 10             	add    $0x10,%esp
c010085b:	83 ec 08             	sub    $0x8,%esp
c010085e:	6a 00                	push   $0x0
c0100860:	68 f6 03 00 00       	push   $0x3f6
c0100865:	e8 3b fa ff ff       	call   c01002a5 <out_byte>
c010086a:	83 c4 10             	add    $0x10,%esp
c010086d:	8b 45 08             	mov    0x8(%ebp),%eax
c0100870:	0f b6 00             	movzbl (%eax),%eax
c0100873:	0f b6 c0             	movzbl %al,%eax
c0100876:	83 ec 08             	sub    $0x8,%esp
c0100879:	50                   	push   %eax
c010087a:	68 f1 01 00 00       	push   $0x1f1
c010087f:	e8 21 fa ff ff       	call   c01002a5 <out_byte>
c0100884:	83 c4 10             	add    $0x10,%esp
c0100887:	8b 45 08             	mov    0x8(%ebp),%eax
c010088a:	0f b6 40 01          	movzbl 0x1(%eax),%eax
c010088e:	0f b6 c0             	movzbl %al,%eax
c0100891:	83 ec 08             	sub    $0x8,%esp
c0100894:	50                   	push   %eax
c0100895:	68 f2 01 00 00       	push   $0x1f2
c010089a:	e8 06 fa ff ff       	call   c01002a5 <out_byte>
c010089f:	83 c4 10             	add    $0x10,%esp
c01008a2:	8b 45 08             	mov    0x8(%ebp),%eax
c01008a5:	0f b6 40 02          	movzbl 0x2(%eax),%eax
c01008a9:	0f b6 c0             	movzbl %al,%eax
c01008ac:	83 ec 08             	sub    $0x8,%esp
c01008af:	50                   	push   %eax
c01008b0:	68 f3 01 00 00       	push   $0x1f3
c01008b5:	e8 eb f9 ff ff       	call   c01002a5 <out_byte>
c01008ba:	83 c4 10             	add    $0x10,%esp
c01008bd:	8b 45 08             	mov    0x8(%ebp),%eax
c01008c0:	0f b6 40 03          	movzbl 0x3(%eax),%eax
c01008c4:	0f b6 c0             	movzbl %al,%eax
c01008c7:	83 ec 08             	sub    $0x8,%esp
c01008ca:	50                   	push   %eax
c01008cb:	68 f4 01 00 00       	push   $0x1f4
c01008d0:	e8 d0 f9 ff ff       	call   c01002a5 <out_byte>
c01008d5:	83 c4 10             	add    $0x10,%esp
c01008d8:	8b 45 08             	mov    0x8(%ebp),%eax
c01008db:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c01008df:	0f b6 c0             	movzbl %al,%eax
c01008e2:	83 ec 08             	sub    $0x8,%esp
c01008e5:	50                   	push   %eax
c01008e6:	68 f5 01 00 00       	push   $0x1f5
c01008eb:	e8 b5 f9 ff ff       	call   c01002a5 <out_byte>
c01008f0:	83 c4 10             	add    $0x10,%esp
c01008f3:	8b 45 08             	mov    0x8(%ebp),%eax
c01008f6:	0f b6 40 05          	movzbl 0x5(%eax),%eax
c01008fa:	0f b6 c0             	movzbl %al,%eax
c01008fd:	83 ec 08             	sub    $0x8,%esp
c0100900:	50                   	push   %eax
c0100901:	68 f6 01 00 00       	push   $0x1f6
c0100906:	e8 9a f9 ff ff       	call   c01002a5 <out_byte>
c010090b:	83 c4 10             	add    $0x10,%esp
c010090e:	8b 45 08             	mov    0x8(%ebp),%eax
c0100911:	0f b6 40 06          	movzbl 0x6(%eax),%eax
c0100915:	0f b6 c0             	movzbl %al,%eax
c0100918:	83 ec 08             	sub    $0x8,%esp
c010091b:	50                   	push   %eax
c010091c:	68 f7 01 00 00       	push   $0x1f7
c0100921:	e8 7f f9 ff ff       	call   c01002a5 <out_byte>
c0100926:	83 c4 10             	add    $0x10,%esp
c0100929:	90                   	nop
c010092a:	c9                   	leave  
c010092b:	c3                   	ret    

c010092c <hd_identify>:
c010092c:	55                   	push   %ebp
c010092d:	89 e5                	mov    %esp,%ebp
c010092f:	53                   	push   %ebx
c0100930:	83 ec 24             	sub    $0x24,%esp
c0100933:	89 e0                	mov    %esp,%eax
c0100935:	89 c3                	mov    %eax,%ebx
c0100937:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
c010093b:	c6 45 e6 01          	movb   $0x1,-0x1a(%ebp)
c010093f:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
c0100943:	c6 45 e8 00          	movb   $0x0,-0x18(%ebp)
c0100947:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c010094b:	8b 45 08             	mov    0x8(%ebp),%eax
c010094e:	c1 e0 04             	shl    $0x4,%eax
c0100951:	83 c8 e0             	or     $0xffffffe0,%eax
c0100954:	88 45 ea             	mov    %al,-0x16(%ebp)
c0100957:	c6 45 eb ec          	movb   $0xec,-0x15(%ebp)
c010095b:	83 ec 0c             	sub    $0xc,%esp
c010095e:	8d 45 e5             	lea    -0x1b(%ebp),%eax
c0100961:	50                   	push   %eax
c0100962:	e8 c3 fe ff ff       	call   c010082a <hd_cmd_out>
c0100967:	83 c4 10             	add    $0x10,%esp
c010096a:	e8 f0 06 00 00       	call   c010105f <interrupt_wait>
c010096f:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c0100976:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100979:	8d 50 ff             	lea    -0x1(%eax),%edx
c010097c:	89 55 f0             	mov    %edx,-0x10(%ebp)
c010097f:	89 c2                	mov    %eax,%edx
c0100981:	b8 10 00 00 00       	mov    $0x10,%eax
c0100986:	83 e8 01             	sub    $0x1,%eax
c0100989:	01 d0                	add    %edx,%eax
c010098b:	b9 10 00 00 00       	mov    $0x10,%ecx
c0100990:	ba 00 00 00 00       	mov    $0x0,%edx
c0100995:	f7 f1                	div    %ecx
c0100997:	6b c0 10             	imul   $0x10,%eax,%eax
c010099a:	29 c4                	sub    %eax,%esp
c010099c:	89 e0                	mov    %esp,%eax
c010099e:	83 c0 00             	add    $0x0,%eax
c01009a1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01009a4:	83 ec 04             	sub    $0x4,%esp
c01009a7:	ff 75 f4             	pushl  -0xc(%ebp)
c01009aa:	6a 00                	push   $0x0
c01009ac:	ff 75 ec             	pushl  -0x14(%ebp)
c01009af:	e8 77 a8 00 00       	call   c010b22b <Memset>
c01009b4:	83 c4 10             	add    $0x10,%esp
c01009b7:	83 ec 04             	sub    $0x4,%esp
c01009ba:	ff 75 f4             	pushl  -0xc(%ebp)
c01009bd:	ff 75 ec             	pushl  -0x14(%ebp)
c01009c0:	68 f0 01 00 00       	push   $0x1f0
c01009c5:	e8 b5 a8 00 00       	call   c010b27f <read_port>
c01009ca:	83 c4 10             	add    $0x10,%esp
c01009cd:	83 ec 0c             	sub    $0xc,%esp
c01009d0:	ff 75 ec             	pushl  -0x14(%ebp)
c01009d3:	e8 0b 00 00 00       	call   c01009e3 <print_hdinfo>
c01009d8:	83 c4 10             	add    $0x10,%esp
c01009db:	89 dc                	mov    %ebx,%esp
c01009dd:	90                   	nop
c01009de:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01009e1:	c9                   	leave  
c01009e2:	c3                   	ret    

c01009e3 <print_hdinfo>:
c01009e3:	55                   	push   %ebp
c01009e4:	89 e5                	mov    %esp,%ebp
c01009e6:	81 ec 88 00 00 00    	sub    $0x88,%esp
c01009ec:	66 c7 45 b4 0a 00    	movw   $0xa,-0x4c(%ebp)
c01009f2:	66 c7 45 b6 14 00    	movw   $0x14,-0x4a(%ebp)
c01009f8:	c7 45 b8 53 65 72 69 	movl   $0x69726553,-0x48(%ebp)
c01009ff:	c7 45 bc 61 6c 20 4e 	movl   $0x4e206c61,-0x44(%ebp)
c0100a06:	c7 45 c0 75 6d 62 65 	movl   $0x65626d75,-0x40(%ebp)
c0100a0d:	c7 45 c4 72 00 00 00 	movl   $0x72,-0x3c(%ebp)
c0100a14:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0100a1b:	66 c7 45 cc 1b 00    	movw   $0x1b,-0x34(%ebp)
c0100a21:	66 c7 45 ce 28 00    	movw   $0x28,-0x32(%ebp)
c0100a27:	c7 45 d0 4d 6f 64 65 	movl   $0x65646f4d,-0x30(%ebp)
c0100a2e:	c7 45 d4 6c 20 4e 75 	movl   $0x754e206c,-0x2c(%ebp)
c0100a35:	c7 45 d8 6d 62 65 72 	movl   $0x7265626d,-0x28(%ebp)
c0100a3c:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0100a43:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0100a4a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100a51:	e9 8f 00 00 00       	jmp    c0100ae5 <print_hdinfo+0x102>
c0100a56:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0100a5d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100a60:	89 d0                	mov    %edx,%eax
c0100a62:	01 c0                	add    %eax,%eax
c0100a64:	01 d0                	add    %edx,%eax
c0100a66:	c1 e0 03             	shl    $0x3,%eax
c0100a69:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100a6c:	01 c8                	add    %ecx,%eax
c0100a6e:	83 e8 44             	sub    $0x44,%eax
c0100a71:	0f b7 00             	movzwl (%eax),%eax
c0100a74:	0f b7 c0             	movzwl %ax,%eax
c0100a77:	8d 14 00             	lea    (%eax,%eax,1),%edx
c0100a7a:	8b 45 08             	mov    0x8(%ebp),%eax
c0100a7d:	01 d0                	add    %edx,%eax
c0100a7f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0100a82:	eb 30                	jmp    c0100ab4 <print_hdinfo+0xd1>
c0100a84:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100a87:	8d 50 01             	lea    0x1(%eax),%edx
c0100a8a:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0100a8d:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0100a90:	83 c2 01             	add    $0x1,%edx
c0100a93:	0f b6 00             	movzbl (%eax),%eax
c0100a96:	88 44 15 81          	mov    %al,-0x7f(%ebp,%edx,1)
c0100a9a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100a9d:	8d 50 01             	lea    0x1(%eax),%edx
c0100aa0:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0100aa3:	0f b6 00             	movzbl (%eax),%eax
c0100aa6:	8d 4d 81             	lea    -0x7f(%ebp),%ecx
c0100aa9:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0100aac:	01 ca                	add    %ecx,%edx
c0100aae:	88 02                	mov    %al,(%edx)
c0100ab0:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0100ab4:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100ab7:	89 d0                	mov    %edx,%eax
c0100ab9:	01 c0                	add    %eax,%eax
c0100abb:	01 d0                	add    %edx,%eax
c0100abd:	c1 e0 03             	shl    $0x3,%eax
c0100ac0:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100ac3:	01 c8                	add    %ecx,%eax
c0100ac5:	83 e8 42             	sub    $0x42,%eax
c0100ac8:	0f b7 00             	movzwl (%eax),%eax
c0100acb:	66 d1 e8             	shr    %ax
c0100ace:	0f b7 c0             	movzwl %ax,%eax
c0100ad1:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0100ad4:	7c ae                	jl     c0100a84 <print_hdinfo+0xa1>
c0100ad6:	8d 55 81             	lea    -0x7f(%ebp),%edx
c0100ad9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100adc:	01 d0                	add    %edx,%eax
c0100ade:	c6 00 00             	movb   $0x0,(%eax)
c0100ae1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0100ae5:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0100ae9:	0f 8e 67 ff ff ff    	jle    c0100a56 <print_hdinfo+0x73>
c0100aef:	8b 45 08             	mov    0x8(%ebp),%eax
c0100af2:	0f b7 40 62          	movzwl 0x62(%eax),%eax
c0100af6:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
c0100afa:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0100afe:	66 c1 e8 08          	shr    $0x8,%ax
c0100b02:	66 85 c0             	test   %ax,%ax
c0100b05:	0f 95 c0             	setne  %al
c0100b08:	88 45 e9             	mov    %al,-0x17(%ebp)
c0100b0b:	c7 45 ac 59 65 73 00 	movl   $0x736559,-0x54(%ebp)
c0100b12:	66 c7 45 a9 4e 6f    	movw   $0x6f4e,-0x57(%ebp)
c0100b18:	c6 45 ab 00          	movb   $0x0,-0x55(%ebp)
c0100b1c:	80 7d e9 01          	cmpb   $0x1,-0x17(%ebp)
c0100b20:	75 15                	jne    c0100b37 <print_hdinfo+0x154>
c0100b22:	83 ec 08             	sub    $0x8,%esp
c0100b25:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0100b28:	50                   	push   %eax
c0100b29:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0100b2c:	50                   	push   %eax
c0100b2d:	e8 18 a7 00 00       	call   c010b24a <Strcpy>
c0100b32:	83 c4 10             	add    $0x10,%esp
c0100b35:	eb 13                	jmp    c0100b4a <print_hdinfo+0x167>
c0100b37:	83 ec 08             	sub    $0x8,%esp
c0100b3a:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0100b3d:	50                   	push   %eax
c0100b3e:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0100b41:	50                   	push   %eax
c0100b42:	e8 03 a7 00 00       	call   c010b24a <Strcpy>
c0100b47:	83 c4 10             	add    $0x10,%esp
c0100b4a:	8b 45 08             	mov    0x8(%ebp),%eax
c0100b4d:	83 c0 7a             	add    $0x7a,%eax
c0100b50:	0f b7 00             	movzwl (%eax),%eax
c0100b53:	0f b7 d0             	movzwl %ax,%edx
c0100b56:	8b 45 08             	mov    0x8(%ebp),%eax
c0100b59:	83 c0 78             	add    $0x78,%eax
c0100b5c:	0f b7 00             	movzwl (%eax),%eax
c0100b5f:	0f b7 c0             	movzwl %ax,%eax
c0100b62:	83 c0 10             	add    $0x10,%eax
c0100b65:	89 c1                	mov    %eax,%ecx
c0100b67:	d3 e2                	shl    %cl,%edx
c0100b69:	89 d0                	mov    %edx,%eax
c0100b6b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0100b6e:	90                   	nop
c0100b6f:	c9                   	leave  
c0100b70:	c3                   	ret    

c0100b71 <print_dpt_entry>:
c0100b71:	55                   	push   %ebp
c0100b72:	89 e5                	mov    %esp,%ebp
c0100b74:	83 ec 08             	sub    $0x8,%esp
c0100b77:	8b 45 08             	mov    0x8(%ebp),%eax
c0100b7a:	8b 40 08             	mov    0x8(%eax),%eax
c0100b7d:	83 ec 08             	sub    $0x8,%esp
c0100b80:	50                   	push   %eax
c0100b81:	68 82 a3 10 c0       	push   $0xc010a382
c0100b86:	e8 c6 76 00 00       	call   c0108251 <Printf>
c0100b8b:	83 c4 10             	add    $0x10,%esp
c0100b8e:	8b 45 08             	mov    0x8(%ebp),%eax
c0100b91:	8b 40 0c             	mov    0xc(%eax),%eax
c0100b94:	83 ec 08             	sub    $0x8,%esp
c0100b97:	50                   	push   %eax
c0100b98:	68 8a a3 10 c0       	push   $0xc010a38a
c0100b9d:	e8 af 76 00 00       	call   c0108251 <Printf>
c0100ba2:	83 c4 10             	add    $0x10,%esp
c0100ba5:	8b 45 08             	mov    0x8(%ebp),%eax
c0100ba8:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0100bac:	0f b6 c0             	movzbl %al,%eax
c0100baf:	83 ec 08             	sub    $0x8,%esp
c0100bb2:	50                   	push   %eax
c0100bb3:	68 9b a3 10 c0       	push   $0xc010a39b
c0100bb8:	e8 94 76 00 00       	call   c0108251 <Printf>
c0100bbd:	83 c4 10             	add    $0x10,%esp
c0100bc0:	8b 45 08             	mov    0x8(%ebp),%eax
c0100bc3:	0f b6 00             	movzbl (%eax),%eax
c0100bc6:	0f b6 c0             	movzbl %al,%eax
c0100bc9:	83 ec 08             	sub    $0x8,%esp
c0100bcc:	50                   	push   %eax
c0100bcd:	68 a9 a3 10 c0       	push   $0xc010a3a9
c0100bd2:	e8 7a 76 00 00       	call   c0108251 <Printf>
c0100bd7:	83 c4 10             	add    $0x10,%esp
c0100bda:	90                   	nop
c0100bdb:	c9                   	leave  
c0100bdc:	c3                   	ret    

c0100bdd <get_partition_table>:
c0100bdd:	55                   	push   %ebp
c0100bde:	89 e5                	mov    %esp,%ebp
c0100be0:	53                   	push   %ebx
c0100be1:	83 ec 24             	sub    $0x24,%esp
c0100be4:	89 e0                	mov    %esp,%eax
c0100be6:	89 c3                	mov    %eax,%ebx
c0100be8:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
c0100bec:	c6 45 e2 01          	movb   $0x1,-0x1e(%ebp)
c0100bf0:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100bf3:	88 45 e3             	mov    %al,-0x1d(%ebp)
c0100bf6:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100bf9:	c1 f8 08             	sar    $0x8,%eax
c0100bfc:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0100bff:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100c02:	c1 f8 10             	sar    $0x10,%eax
c0100c05:	88 45 e5             	mov    %al,-0x1b(%ebp)
c0100c08:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100c0b:	c1 f8 18             	sar    $0x18,%eax
c0100c0e:	89 c2                	mov    %eax,%edx
c0100c10:	8b 45 08             	mov    0x8(%ebp),%eax
c0100c13:	c1 e0 04             	shl    $0x4,%eax
c0100c16:	09 d0                	or     %edx,%eax
c0100c18:	83 c8 e0             	or     $0xffffffe0,%eax
c0100c1b:	88 45 e6             	mov    %al,-0x1a(%ebp)
c0100c1e:	c6 45 e7 20          	movb   $0x20,-0x19(%ebp)
c0100c22:	83 ec 0c             	sub    $0xc,%esp
c0100c25:	8d 45 e1             	lea    -0x1f(%ebp),%eax
c0100c28:	50                   	push   %eax
c0100c29:	e8 fc fb ff ff       	call   c010082a <hd_cmd_out>
c0100c2e:	83 c4 10             	add    $0x10,%esp
c0100c31:	e8 29 04 00 00       	call   c010105f <interrupt_wait>
c0100c36:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c0100c3d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100c40:	8d 50 ff             	lea    -0x1(%eax),%edx
c0100c43:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0100c46:	89 c2                	mov    %eax,%edx
c0100c48:	b8 10 00 00 00       	mov    $0x10,%eax
c0100c4d:	83 e8 01             	sub    $0x1,%eax
c0100c50:	01 d0                	add    %edx,%eax
c0100c52:	b9 10 00 00 00       	mov    $0x10,%ecx
c0100c57:	ba 00 00 00 00       	mov    $0x0,%edx
c0100c5c:	f7 f1                	div    %ecx
c0100c5e:	6b c0 10             	imul   $0x10,%eax,%eax
c0100c61:	29 c4                	sub    %eax,%esp
c0100c63:	89 e0                	mov    %esp,%eax
c0100c65:	83 c0 00             	add    $0x0,%eax
c0100c68:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0100c6b:	83 ec 04             	sub    $0x4,%esp
c0100c6e:	ff 75 f4             	pushl  -0xc(%ebp)
c0100c71:	6a 00                	push   $0x0
c0100c73:	ff 75 ec             	pushl  -0x14(%ebp)
c0100c76:	e8 b0 a5 00 00       	call   c010b22b <Memset>
c0100c7b:	83 c4 10             	add    $0x10,%esp
c0100c7e:	83 ec 04             	sub    $0x4,%esp
c0100c81:	ff 75 f4             	pushl  -0xc(%ebp)
c0100c84:	ff 75 ec             	pushl  -0x14(%ebp)
c0100c87:	68 f0 01 00 00       	push   $0x1f0
c0100c8c:	e8 ee a5 00 00       	call   c010b27f <read_port>
c0100c91:	83 c4 10             	add    $0x10,%esp
c0100c94:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100c97:	05 be 01 00 00       	add    $0x1be,%eax
c0100c9c:	83 ec 04             	sub    $0x4,%esp
c0100c9f:	6a 40                	push   $0x40
c0100ca1:	50                   	push   %eax
c0100ca2:	ff 75 10             	pushl  0x10(%ebp)
c0100ca5:	e8 ff 5e 00 00       	call   c0106ba9 <Memcpy>
c0100caa:	83 c4 10             	add    $0x10,%esp
c0100cad:	c7 45 e8 05 00 00 00 	movl   $0x5,-0x18(%ebp)
c0100cb4:	89 dc                	mov    %ebx,%esp
c0100cb6:	90                   	nop
c0100cb7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100cba:	c9                   	leave  
c0100cbb:	c3                   	ret    

c0100cbc <partition>:
c0100cbc:	55                   	push   %ebp
c0100cbd:	89 e5                	mov    %esp,%ebp
c0100cbf:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0100cc5:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100cc8:	88 45 84             	mov    %al,-0x7c(%ebp)
c0100ccb:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c0100ccf:	7f 19                	jg     c0100cea <partition+0x2e>
c0100cd1:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0100cd4:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0100cd9:	89 c8                	mov    %ecx,%eax
c0100cdb:	f7 ea                	imul   %edx
c0100cdd:	d1 fa                	sar    %edx
c0100cdf:	89 c8                	mov    %ecx,%eax
c0100ce1:	c1 f8 1f             	sar    $0x1f,%eax
c0100ce4:	29 c2                	sub    %eax,%edx
c0100ce6:	89 d0                	mov    %edx,%eax
c0100ce8:	eb 11                	jmp    c0100cfb <partition+0x3f>
c0100cea:	8b 45 08             	mov    0x8(%ebp),%eax
c0100ced:	83 e8 10             	sub    $0x10,%eax
c0100cf0:	8d 50 3f             	lea    0x3f(%eax),%edx
c0100cf3:	85 c0                	test   %eax,%eax
c0100cf5:	0f 48 c2             	cmovs  %edx,%eax
c0100cf8:	c1 f8 06             	sar    $0x6,%eax
c0100cfb:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0100cfe:	80 7d 84 00          	cmpb   $0x0,-0x7c(%ebp)
c0100d02:	0f 85 cc 00 00 00    	jne    c0100dd4 <partition+0x118>
c0100d08:	83 ec 04             	sub    $0x4,%esp
c0100d0b:	6a 40                	push   $0x40
c0100d0d:	6a 00                	push   $0x0
c0100d0f:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100d12:	50                   	push   %eax
c0100d13:	e8 13 a5 00 00       	call   c010b22b <Memset>
c0100d18:	83 c4 10             	add    $0x10,%esp
c0100d1b:	83 ec 04             	sub    $0x4,%esp
c0100d1e:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100d21:	50                   	push   %eax
c0100d22:	6a 00                	push   $0x0
c0100d24:	ff 75 e8             	pushl  -0x18(%ebp)
c0100d27:	e8 b1 fe ff ff       	call   c0100bdd <get_partition_table>
c0100d2c:	83 c4 10             	add    $0x10,%esp
c0100d2f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100d36:	e9 8a 00 00 00       	jmp    c0100dc5 <partition+0x109>
c0100d3b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100d3e:	83 c0 01             	add    $0x1,%eax
c0100d41:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0100d44:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100d47:	c1 e0 04             	shl    $0x4,%eax
c0100d4a:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100d4d:	01 c8                	add    %ecx,%eax
c0100d4f:	83 e8 5c             	sub    $0x5c,%eax
c0100d52:	8b 00                	mov    (%eax),%eax
c0100d54:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0100d57:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0100d5a:	c1 e1 03             	shl    $0x3,%ecx
c0100d5d:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0100d63:	01 ca                	add    %ecx,%edx
c0100d65:	81 c2 44 0f 11 c0    	add    $0xc0110f44,%edx
c0100d6b:	89 02                	mov    %eax,(%edx)
c0100d6d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100d70:	c1 e0 04             	shl    $0x4,%eax
c0100d73:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100d76:	01 c8                	add    %ecx,%eax
c0100d78:	83 e8 58             	sub    $0x58,%eax
c0100d7b:	8b 00                	mov    (%eax),%eax
c0100d7d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0100d80:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0100d83:	c1 e1 03             	shl    $0x3,%ecx
c0100d86:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0100d8c:	01 ca                	add    %ecx,%edx
c0100d8e:	81 c2 48 0f 11 c0    	add    $0xc0110f48,%edx
c0100d94:	89 02                	mov    %eax,(%edx)
c0100d96:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100d99:	c1 e0 04             	shl    $0x4,%eax
c0100d9c:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100d9f:	01 c8                	add    %ecx,%eax
c0100da1:	83 e8 60             	sub    $0x60,%eax
c0100da4:	0f b6 00             	movzbl (%eax),%eax
c0100da7:	3c 05                	cmp    $0x5,%al
c0100da9:	75 16                	jne    c0100dc1 <partition+0x105>
c0100dab:	8b 55 08             	mov    0x8(%ebp),%edx
c0100dae:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100db1:	01 d0                	add    %edx,%eax
c0100db3:	83 ec 08             	sub    $0x8,%esp
c0100db6:	6a 01                	push   $0x1
c0100db8:	50                   	push   %eax
c0100db9:	e8 fe fe ff ff       	call   c0100cbc <partition>
c0100dbe:	83 c4 10             	add    $0x10,%esp
c0100dc1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0100dc5:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c0100dc9:	0f 8e 6c ff ff ff    	jle    c0100d3b <partition+0x7f>
c0100dcf:	e9 ff 00 00 00       	jmp    c0100ed3 <partition+0x217>
c0100dd4:	80 7d 84 01          	cmpb   $0x1,-0x7c(%ebp)
c0100dd8:	0f 85 f5 00 00 00    	jne    c0100ed3 <partition+0x217>
c0100dde:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0100de1:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0100de6:	89 c8                	mov    %ecx,%eax
c0100de8:	f7 ea                	imul   %edx
c0100dea:	d1 fa                	sar    %edx
c0100dec:	89 c8                	mov    %ecx,%eax
c0100dee:	c1 f8 1f             	sar    $0x1f,%eax
c0100df1:	29 c2                	sub    %eax,%edx
c0100df3:	89 d0                	mov    %edx,%eax
c0100df5:	c1 e0 02             	shl    $0x2,%eax
c0100df8:	01 d0                	add    %edx,%eax
c0100dfa:	29 c1                	sub    %eax,%ecx
c0100dfc:	89 c8                	mov    %ecx,%eax
c0100dfe:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0100e01:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0100e04:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100e07:	c1 e2 03             	shl    $0x3,%edx
c0100e0a:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0100e10:	01 d0                	add    %edx,%eax
c0100e12:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c0100e17:	8b 00                	mov    (%eax),%eax
c0100e19:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0100e1c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0100e1f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100e22:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0100e25:	83 e8 01             	sub    $0x1,%eax
c0100e28:	c1 e0 04             	shl    $0x4,%eax
c0100e2b:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0100e2e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0100e35:	e9 8c 00 00 00       	jmp    c0100ec6 <partition+0x20a>
c0100e3a:	83 ec 04             	sub    $0x4,%esp
c0100e3d:	6a 40                	push   $0x40
c0100e3f:	6a 00                	push   $0x0
c0100e41:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100e44:	50                   	push   %eax
c0100e45:	e8 e1 a3 00 00       	call   c010b22b <Memset>
c0100e4a:	83 c4 10             	add    $0x10,%esp
c0100e4d:	83 ec 04             	sub    $0x4,%esp
c0100e50:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100e53:	50                   	push   %eax
c0100e54:	ff 75 f0             	pushl  -0x10(%ebp)
c0100e57:	ff 75 e8             	pushl  -0x18(%ebp)
c0100e5a:	e8 7e fd ff ff       	call   c0100bdd <get_partition_table>
c0100e5f:	83 c4 10             	add    $0x10,%esp
c0100e62:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0100e65:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100e68:	01 d0                	add    %edx,%eax
c0100e6a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0100e6d:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0100e70:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100e73:	01 c2                	add    %eax,%edx
c0100e75:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0100e78:	8d 48 04             	lea    0x4(%eax),%ecx
c0100e7b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100e7e:	c1 e1 03             	shl    $0x3,%ecx
c0100e81:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0100e87:	01 c8                	add    %ecx,%eax
c0100e89:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c0100e8e:	89 10                	mov    %edx,(%eax)
c0100e90:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0100e93:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0100e96:	8d 4a 04             	lea    0x4(%edx),%ecx
c0100e99:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0100e9c:	c1 e1 03             	shl    $0x3,%ecx
c0100e9f:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0100ea5:	01 ca                	add    %ecx,%edx
c0100ea7:	81 c2 48 0f 11 c0    	add    $0xc0110f48,%edx
c0100ead:	89 02                	mov    %eax,(%edx)
c0100eaf:	0f b6 45 a8          	movzbl -0x58(%ebp),%eax
c0100eb3:	84 c0                	test   %al,%al
c0100eb5:	74 1b                	je     c0100ed2 <partition+0x216>
c0100eb7:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0100eba:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0100ebd:	01 d0                	add    %edx,%eax
c0100ebf:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100ec2:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0100ec6:	83 7d ec 0f          	cmpl   $0xf,-0x14(%ebp)
c0100eca:	0f 8e 6a ff ff ff    	jle    c0100e3a <partition+0x17e>
c0100ed0:	eb 01                	jmp    c0100ed3 <partition+0x217>
c0100ed2:	90                   	nop
c0100ed3:	90                   	nop
c0100ed4:	c9                   	leave  
c0100ed5:	c3                   	ret    

c0100ed6 <hd_open>:
c0100ed6:	55                   	push   %ebp
c0100ed7:	89 e5                	mov    %esp,%ebp
c0100ed9:	83 ec 18             	sub    $0x18,%esp
c0100edc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100ee3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100ee6:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0100eec:	05 40 0f 11 c0       	add    $0xc0110f40,%eax
c0100ef1:	8b 00                	mov    (%eax),%eax
c0100ef3:	8d 50 01             	lea    0x1(%eax),%edx
c0100ef6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100ef9:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0100eff:	05 40 0f 11 c0       	add    $0xc0110f40,%eax
c0100f04:	89 10                	mov    %edx,(%eax)
c0100f06:	83 ec 0c             	sub    $0xc,%esp
c0100f09:	6a 00                	push   $0x0
c0100f0b:	e8 1c fa ff ff       	call   c010092c <hd_identify>
c0100f10:	83 c4 10             	add    $0x10,%esp
c0100f13:	83 ec 08             	sub    $0x8,%esp
c0100f16:	6a 00                	push   $0x0
c0100f18:	6a 00                	push   $0x0
c0100f1a:	e8 9d fd ff ff       	call   c0100cbc <partition>
c0100f1f:	83 c4 10             	add    $0x10,%esp
c0100f22:	83 ec 0c             	sub    $0xc,%esp
c0100f25:	6a 7c                	push   $0x7c
c0100f27:	e8 00 06 00 00       	call   c010152c <sys_malloc>
c0100f2c:	83 c4 10             	add    $0x10,%esp
c0100f2f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100f32:	83 ec 04             	sub    $0x4,%esp
c0100f35:	6a 7c                	push   $0x7c
c0100f37:	6a 00                	push   $0x0
c0100f39:	ff 75 f0             	pushl  -0x10(%ebp)
c0100f3c:	e8 ea a2 00 00       	call   c010b22b <Memset>
c0100f41:	83 c4 10             	add    $0x10,%esp
c0100f44:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100f47:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0100f4e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100f51:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0100f58:	83 ec 04             	sub    $0x4,%esp
c0100f5b:	6a 02                	push   $0x2
c0100f5d:	ff 75 f0             	pushl  -0x10(%ebp)
c0100f60:	6a 01                	push   $0x1
c0100f62:	e8 b7 82 00 00       	call   c010921e <send_rec>
c0100f67:	83 c4 10             	add    $0x10,%esp
c0100f6a:	83 ec 08             	sub    $0x8,%esp
c0100f6d:	6a 7c                	push   $0x7c
c0100f6f:	ff 75 f0             	pushl  -0x10(%ebp)
c0100f72:	e8 ca 05 00 00       	call   c0101541 <sys_free>
c0100f77:	83 c4 10             	add    $0x10,%esp
c0100f7a:	90                   	nop
c0100f7b:	c9                   	leave  
c0100f7c:	c3                   	ret    

c0100f7d <get_hd_ioctl>:
c0100f7d:	55                   	push   %ebp
c0100f7e:	89 e5                	mov    %esp,%ebp
c0100f80:	83 ec 18             	sub    $0x18,%esp
c0100f83:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c0100f87:	7f 19                	jg     c0100fa2 <get_hd_ioctl+0x25>
c0100f89:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0100f8c:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0100f91:	89 c8                	mov    %ecx,%eax
c0100f93:	f7 ea                	imul   %edx
c0100f95:	d1 fa                	sar    %edx
c0100f97:	89 c8                	mov    %ecx,%eax
c0100f99:	c1 f8 1f             	sar    $0x1f,%eax
c0100f9c:	29 c2                	sub    %eax,%edx
c0100f9e:	89 d0                	mov    %edx,%eax
c0100fa0:	eb 11                	jmp    c0100fb3 <get_hd_ioctl+0x36>
c0100fa2:	8b 45 08             	mov    0x8(%ebp),%eax
c0100fa5:	83 e8 10             	sub    $0x10,%eax
c0100fa8:	8d 50 3f             	lea    0x3f(%eax),%edx
c0100fab:	85 c0                	test   %eax,%eax
c0100fad:	0f 48 c2             	cmovs  %edx,%eax
c0100fb0:	c1 f8 06             	sar    $0x6,%eax
c0100fb3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0100fb6:	8b 55 08             	mov    0x8(%ebp),%edx
c0100fb9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100fbc:	c1 e2 03             	shl    $0x3,%edx
c0100fbf:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0100fc5:	01 d0                	add    %edx,%eax
c0100fc7:	05 48 0f 11 c0       	add    $0xc0110f48,%eax
c0100fcc:	8b 00                	mov    (%eax),%eax
c0100fce:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100fd1:	83 ec 0c             	sub    $0xc,%esp
c0100fd4:	6a 7c                	push   $0x7c
c0100fd6:	e8 51 05 00 00       	call   c010152c <sys_malloc>
c0100fdb:	83 c4 10             	add    $0x10,%esp
c0100fde:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0100fe1:	83 ec 04             	sub    $0x4,%esp
c0100fe4:	6a 7c                	push   $0x7c
c0100fe6:	6a 00                	push   $0x0
c0100fe8:	ff 75 ec             	pushl  -0x14(%ebp)
c0100feb:	e8 3b a2 00 00       	call   c010b22b <Memset>
c0100ff0:	83 c4 10             	add    $0x10,%esp
c0100ff3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100ff6:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0100ffd:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101000:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0101007:	83 ec 04             	sub    $0x4,%esp
c010100a:	6a 02                	push   $0x2
c010100c:	ff 75 ec             	pushl  -0x14(%ebp)
c010100f:	6a 01                	push   $0x1
c0101011:	e8 08 82 00 00       	call   c010921e <send_rec>
c0101016:	83 c4 10             	add    $0x10,%esp
c0101019:	83 ec 08             	sub    $0x8,%esp
c010101c:	6a 7c                	push   $0x7c
c010101e:	ff 75 ec             	pushl  -0x14(%ebp)
c0101021:	e8 1b 05 00 00       	call   c0101541 <sys_free>
c0101026:	83 c4 10             	add    $0x10,%esp
c0101029:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010102c:	c9                   	leave  
c010102d:	c3                   	ret    

c010102e <wait_for>:
c010102e:	55                   	push   %ebp
c010102f:	89 e5                	mov    %esp,%ebp
c0101031:	83 ec 08             	sub    $0x8,%esp
c0101034:	83 ec 04             	sub    $0x4,%esp
c0101037:	68 50 c3 00 00       	push   $0xc350
c010103c:	6a 08                	push   $0x8
c010103e:	6a 08                	push   $0x8
c0101040:	e8 35 03 00 00       	call   c010137a <waitfor>
c0101045:	83 c4 10             	add    $0x10,%esp
c0101048:	85 c0                	test   %eax,%eax
c010104a:	75 10                	jne    c010105c <wait_for+0x2e>
c010104c:	83 ec 0c             	sub    $0xc,%esp
c010104f:	68 b4 a3 10 c0       	push   $0xc010a3b4
c0101054:	e8 37 75 00 00       	call   c0108590 <panic>
c0101059:	83 c4 10             	add    $0x10,%esp
c010105c:	90                   	nop
c010105d:	c9                   	leave  
c010105e:	c3                   	ret    

c010105f <interrupt_wait>:
c010105f:	55                   	push   %ebp
c0101060:	89 e5                	mov    %esp,%ebp
c0101062:	83 ec 18             	sub    $0x18,%esp
c0101065:	83 ec 0c             	sub    $0xc,%esp
c0101068:	6a 7c                	push   $0x7c
c010106a:	e8 bd 04 00 00       	call   c010152c <sys_malloc>
c010106f:	83 c4 10             	add    $0x10,%esp
c0101072:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101075:	83 ec 04             	sub    $0x4,%esp
c0101078:	6a 7c                	push   $0x7c
c010107a:	6a 00                	push   $0x0
c010107c:	ff 75 f4             	pushl  -0xc(%ebp)
c010107f:	e8 a7 a1 00 00       	call   c010b22b <Memset>
c0101084:	83 c4 10             	add    $0x10,%esp
c0101087:	83 ec 04             	sub    $0x4,%esp
c010108a:	68 13 02 00 00       	push   $0x213
c010108f:	ff 75 f4             	pushl  -0xc(%ebp)
c0101092:	6a 02                	push   $0x2
c0101094:	e8 85 81 00 00       	call   c010921e <send_rec>
c0101099:	83 c4 10             	add    $0x10,%esp
c010109c:	83 ec 08             	sub    $0x8,%esp
c010109f:	6a 7c                	push   $0x7c
c01010a1:	ff 75 f4             	pushl  -0xc(%ebp)
c01010a4:	e8 98 04 00 00       	call   c0101541 <sys_free>
c01010a9:	83 c4 10             	add    $0x10,%esp
c01010ac:	90                   	nop
c01010ad:	c9                   	leave  
c01010ae:	c3                   	ret    

c01010af <hd_rdwt>:
c01010af:	55                   	push   %ebp
c01010b0:	89 e5                	mov    %esp,%ebp
c01010b2:	81 ec c8 00 00 00    	sub    $0xc8,%esp
c01010b8:	8b 45 08             	mov    0x8(%ebp),%eax
c01010bb:	8b 40 18             	mov    0x18(%eax),%eax
c01010be:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01010c1:	8b 45 08             	mov    0x8(%ebp),%eax
c01010c4:	8b 40 14             	mov    0x14(%eax),%eax
c01010c7:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01010ca:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c01010ce:	7f 19                	jg     c01010e9 <hd_rdwt+0x3a>
c01010d0:	8b 4d e8             	mov    -0x18(%ebp),%ecx
c01010d3:	ba 67 66 66 66       	mov    $0x66666667,%edx
c01010d8:	89 c8                	mov    %ecx,%eax
c01010da:	f7 ea                	imul   %edx
c01010dc:	d1 fa                	sar    %edx
c01010de:	89 c8                	mov    %ecx,%eax
c01010e0:	c1 f8 1f             	sar    $0x1f,%eax
c01010e3:	29 c2                	sub    %eax,%edx
c01010e5:	89 d0                	mov    %edx,%eax
c01010e7:	eb 11                	jmp    c01010fa <hd_rdwt+0x4b>
c01010e9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01010ec:	83 e8 10             	sub    $0x10,%eax
c01010ef:	8d 50 3f             	lea    0x3f(%eax),%edx
c01010f2:	85 c0                	test   %eax,%eax
c01010f4:	0f 48 c2             	cmovs  %edx,%eax
c01010f7:	c1 f8 06             	sar    $0x6,%eax
c01010fa:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01010fd:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101100:	8d 50 f0             	lea    -0x10(%eax),%edx
c0101103:	89 d0                	mov    %edx,%eax
c0101105:	c1 f8 1f             	sar    $0x1f,%eax
c0101108:	c1 e8 1a             	shr    $0x1a,%eax
c010110b:	01 c2                	add    %eax,%edx
c010110d:	83 e2 3f             	and    $0x3f,%edx
c0101110:	29 c2                	sub    %eax,%edx
c0101112:	89 d0                	mov    %edx,%eax
c0101114:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0101117:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010111a:	c1 e8 09             	shr    $0x9,%eax
c010111d:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0101120:	83 7d e8 08          	cmpl   $0x8,-0x18(%ebp)
c0101124:	7f 1a                	jg     c0101140 <hd_rdwt+0x91>
c0101126:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0101129:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010112c:	c1 e2 03             	shl    $0x3,%edx
c010112f:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0101135:	01 d0                	add    %edx,%eax
c0101137:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c010113c:	8b 00                	mov    (%eax),%eax
c010113e:	eb 1b                	jmp    c010115b <hd_rdwt+0xac>
c0101140:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101143:	8d 50 04             	lea    0x4(%eax),%edx
c0101146:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101149:	c1 e2 03             	shl    $0x3,%edx
c010114c:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0101152:	01 d0                	add    %edx,%eax
c0101154:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c0101159:	8b 00                	mov    (%eax),%eax
c010115b:	8b 55 dc             	mov    -0x24(%ebp),%edx
c010115e:	01 d0                	add    %edx,%eax
c0101160:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0101163:	8b 45 08             	mov    0x8(%ebp),%eax
c0101166:	8b 40 0c             	mov    0xc(%eax),%eax
c0101169:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010116c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010116f:	05 ff 01 00 00       	add    $0x1ff,%eax
c0101174:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c010117a:	85 c0                	test   %eax,%eax
c010117c:	0f 48 c2             	cmovs  %edx,%eax
c010117f:	c1 f8 09             	sar    $0x9,%eax
c0101182:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0101185:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0101188:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010118b:	8b 45 08             	mov    0x8(%ebp),%eax
c010118e:	8b 40 10             	mov    0x10(%eax),%eax
c0101191:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0101194:	8b 45 08             	mov    0x8(%ebp),%eax
c0101197:	8b 00                	mov    (%eax),%eax
c0101199:	89 45 cc             	mov    %eax,-0x34(%ebp)
c010119c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010119f:	83 ec 08             	sub    $0x8,%esp
c01011a2:	50                   	push   %eax
c01011a3:	ff 75 d0             	pushl  -0x30(%ebp)
c01011a6:	e8 91 4b 00 00       	call   c0105d3c <alloc_virtual_memory>
c01011ab:	83 c4 10             	add    $0x10,%esp
c01011ae:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01011b1:	8b 45 08             	mov    0x8(%ebp),%eax
c01011b4:	8b 40 78             	mov    0x78(%eax),%eax
c01011b7:	89 45 c8             	mov    %eax,-0x38(%ebp)
c01011ba:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c01011be:	74 22                	je     c01011e2 <hd_rdwt+0x133>
c01011c0:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c01011c4:	74 1c                	je     c01011e2 <hd_rdwt+0x133>
c01011c6:	68 b7 01 00 00       	push   $0x1b7
c01011cb:	68 04 a3 10 c0       	push   $0xc010a304
c01011d0:	68 04 a3 10 c0       	push   $0xc010a304
c01011d5:	68 c6 a3 10 c0       	push   $0xc010a3c6
c01011da:	e8 cf 73 00 00       	call   c01085ae <assertion_failure>
c01011df:	83 c4 10             	add    $0x10,%esp
c01011e2:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
c01011e6:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01011e9:	88 45 be             	mov    %al,-0x42(%ebp)
c01011ec:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01011ef:	88 45 bf             	mov    %al,-0x41(%ebp)
c01011f2:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01011f5:	c1 f8 08             	sar    $0x8,%eax
c01011f8:	88 45 c0             	mov    %al,-0x40(%ebp)
c01011fb:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01011fe:	c1 f8 10             	sar    $0x10,%eax
c0101201:	88 45 c1             	mov    %al,-0x3f(%ebp)
c0101204:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101207:	c1 f8 18             	sar    $0x18,%eax
c010120a:	83 e0 0f             	and    $0xf,%eax
c010120d:	83 c8 e0             	or     $0xffffffe0,%eax
c0101210:	88 45 c2             	mov    %al,-0x3e(%ebp)
c0101213:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c0101217:	75 07                	jne    c0101220 <hd_rdwt+0x171>
c0101219:	b8 20 00 00 00       	mov    $0x20,%eax
c010121e:	eb 05                	jmp    c0101225 <hd_rdwt+0x176>
c0101220:	b8 30 00 00 00       	mov    $0x30,%eax
c0101225:	88 45 c3             	mov    %al,-0x3d(%ebp)
c0101228:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c010122c:	3c 20                	cmp    $0x20,%al
c010122e:	74 24                	je     c0101254 <hd_rdwt+0x1a5>
c0101230:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c0101234:	3c 30                	cmp    $0x30,%al
c0101236:	74 1c                	je     c0101254 <hd_rdwt+0x1a5>
c0101238:	68 c5 01 00 00       	push   $0x1c5
c010123d:	68 04 a3 10 c0       	push   $0xc010a304
c0101242:	68 04 a3 10 c0       	push   $0xc010a304
c0101247:	68 e4 a3 10 c0       	push   $0xc010a3e4
c010124c:	e8 5d 73 00 00       	call   c01085ae <assertion_failure>
c0101251:	83 c4 10             	add    $0x10,%esp
c0101254:	83 ec 0c             	sub    $0xc,%esp
c0101257:	8d 45 bd             	lea    -0x43(%ebp),%eax
c010125a:	50                   	push   %eax
c010125b:	e8 ca f5 ff ff       	call   c010082a <hd_cmd_out>
c0101260:	83 c4 10             	add    $0x10,%esp
c0101263:	e9 9c 00 00 00       	jmp    c0101304 <hd_rdwt+0x255>
c0101268:	b8 00 02 00 00       	mov    $0x200,%eax
c010126d:	81 7d f4 00 02 00 00 	cmpl   $0x200,-0xc(%ebp)
c0101274:	0f 4e 45 f4          	cmovle -0xc(%ebp),%eax
c0101278:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c010127b:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c010127f:	75 51                	jne    c01012d2 <hd_rdwt+0x223>
c0101281:	e8 a8 fd ff ff       	call   c010102e <wait_for>
c0101286:	e8 d4 fd ff ff       	call   c010105f <interrupt_wait>
c010128b:	83 ec 04             	sub    $0x4,%esp
c010128e:	ff 75 c4             	pushl  -0x3c(%ebp)
c0101291:	6a 00                	push   $0x0
c0101293:	68 80 11 11 c0       	push   $0xc0111180
c0101298:	e8 8e 9f 00 00       	call   c010b22b <Memset>
c010129d:	83 c4 10             	add    $0x10,%esp
c01012a0:	83 ec 04             	sub    $0x4,%esp
c01012a3:	68 00 02 00 00       	push   $0x200
c01012a8:	68 80 11 11 c0       	push   $0xc0111180
c01012ad:	68 f0 01 00 00       	push   $0x1f0
c01012b2:	e8 c8 9f 00 00       	call   c010b27f <read_port>
c01012b7:	83 c4 10             	add    $0x10,%esp
c01012ba:	83 ec 04             	sub    $0x4,%esp
c01012bd:	ff 75 c4             	pushl  -0x3c(%ebp)
c01012c0:	68 80 11 11 c0       	push   $0xc0111180
c01012c5:	ff 75 f0             	pushl  -0x10(%ebp)
c01012c8:	e8 dc 58 00 00       	call   c0106ba9 <Memcpy>
c01012cd:	83 c4 10             	add    $0x10,%esp
c01012d0:	eb 26                	jmp    c01012f8 <hd_rdwt+0x249>
c01012d2:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c01012d6:	75 20                	jne    c01012f8 <hd_rdwt+0x249>
c01012d8:	e8 51 fd ff ff       	call   c010102e <wait_for>
c01012dd:	83 ec 04             	sub    $0x4,%esp
c01012e0:	ff 75 c4             	pushl  -0x3c(%ebp)
c01012e3:	ff 75 f0             	pushl  -0x10(%ebp)
c01012e6:	68 f0 01 00 00       	push   $0x1f0
c01012eb:	e8 a3 9f 00 00       	call   c010b293 <write_port>
c01012f0:	83 c4 10             	add    $0x10,%esp
c01012f3:	e8 67 fd ff ff       	call   c010105f <interrupt_wait>
c01012f8:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01012fb:	29 45 f4             	sub    %eax,-0xc(%ebp)
c01012fe:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0101301:	01 45 f0             	add    %eax,-0x10(%ebp)
c0101304:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0101308:	0f 85 5a ff ff ff    	jne    c0101268 <hd_rdwt+0x1b9>
c010130e:	83 ec 04             	sub    $0x4,%esp
c0101311:	6a 7c                	push   $0x7c
c0101313:	6a 00                	push   $0x0
c0101315:	8d 85 40 ff ff ff    	lea    -0xc0(%ebp),%eax
c010131b:	50                   	push   %eax
c010131c:	e8 0a 9f 00 00       	call   c010b22b <Memset>
c0101321:	83 c4 10             	add    $0x10,%esp
c0101324:	c7 45 b8 65 00 00 00 	movl   $0x65,-0x48(%ebp)
c010132b:	c7 85 48 ff ff ff 00 	movl   $0x0,-0xb8(%ebp)
c0101332:	00 00 00 
c0101335:	83 ec 04             	sub    $0x4,%esp
c0101338:	6a 02                	push   $0x2
c010133a:	8d 85 40 ff ff ff    	lea    -0xc0(%ebp),%eax
c0101340:	50                   	push   %eax
c0101341:	6a 01                	push   $0x1
c0101343:	e8 d6 7e 00 00       	call   c010921e <send_rec>
c0101348:	83 c4 10             	add    $0x10,%esp
c010134b:	90                   	nop
c010134c:	c9                   	leave  
c010134d:	c3                   	ret    

c010134e <hd_handler>:
c010134e:	55                   	push   %ebp
c010134f:	89 e5                	mov    %esp,%ebp
c0101351:	83 ec 18             	sub    $0x18,%esp
c0101354:	83 ec 0c             	sub    $0xc,%esp
c0101357:	68 f7 01 00 00       	push   $0x1f7
c010135c:	e8 38 ef ff ff       	call   c0100299 <in_byte>
c0101361:	83 c4 10             	add    $0x10,%esp
c0101364:	0f b6 c0             	movzbl %al,%eax
c0101367:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010136a:	83 ec 0c             	sub    $0xc,%esp
c010136d:	6a 03                	push   $0x3
c010136f:	e8 44 81 00 00       	call   c01094b8 <inform_int>
c0101374:	83 c4 10             	add    $0x10,%esp
c0101377:	90                   	nop
c0101378:	c9                   	leave  
c0101379:	c3                   	ret    

c010137a <waitfor>:
c010137a:	55                   	push   %ebp
c010137b:	89 e5                	mov    %esp,%ebp
c010137d:	83 ec 18             	sub    $0x18,%esp
c0101380:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0101387:	eb 26                	jmp    c01013af <waitfor+0x35>
c0101389:	83 ec 0c             	sub    $0xc,%esp
c010138c:	68 f7 01 00 00       	push   $0x1f7
c0101391:	e8 03 ef ff ff       	call   c0100299 <in_byte>
c0101396:	83 c4 10             	add    $0x10,%esp
c0101399:	0f b6 c0             	movzbl %al,%eax
c010139c:	23 45 08             	and    0x8(%ebp),%eax
c010139f:	39 45 0c             	cmp    %eax,0xc(%ebp)
c01013a2:	75 07                	jne    c01013ab <waitfor+0x31>
c01013a4:	b8 01 00 00 00       	mov    $0x1,%eax
c01013a9:	eb 11                	jmp    c01013bc <waitfor+0x42>
c01013ab:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01013af:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01013b2:	3b 45 10             	cmp    0x10(%ebp),%eax
c01013b5:	7c d2                	jl     c0101389 <waitfor+0xf>
c01013b7:	b8 00 00 00 00       	mov    $0x0,%eax
c01013bc:	c9                   	leave  
c01013bd:	c3                   	ret    

c01013be <print_hd_info>:
c01013be:	55                   	push   %ebp
c01013bf:	89 e5                	mov    %esp,%ebp
c01013c1:	83 ec 18             	sub    $0x18,%esp
c01013c4:	83 ec 0c             	sub    $0xc,%esp
c01013c7:	68 18 a4 10 c0       	push   $0xc010a418
c01013cc:	e8 80 6e 00 00       	call   c0108251 <Printf>
c01013d1:	83 c4 10             	add    $0x10,%esp
c01013d4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01013db:	eb 3b                	jmp    c0101418 <print_hd_info+0x5a>
c01013dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01013e0:	8b 04 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%eax
c01013e7:	85 c0                	test   %eax,%eax
c01013e9:	74 28                	je     c0101413 <print_hd_info+0x55>
c01013eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01013ee:	8b 14 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%edx
c01013f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01013f8:	8b 04 c5 44 0f 11 c0 	mov    -0x3feef0bc(,%eax,8),%eax
c01013ff:	ff 75 f4             	pushl  -0xc(%ebp)
c0101402:	52                   	push   %edx
c0101403:	50                   	push   %eax
c0101404:	68 35 a4 10 c0       	push   $0xc010a435
c0101409:	e8 43 6e 00 00       	call   c0108251 <Printf>
c010140e:	83 c4 10             	add    $0x10,%esp
c0101411:	eb 01                	jmp    c0101414 <print_hd_info+0x56>
c0101413:	90                   	nop
c0101414:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0101418:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c010141c:	7e bf                	jle    c01013dd <print_hd_info+0x1f>
c010141e:	83 ec 0c             	sub    $0xc,%esp
c0101421:	68 4d a4 10 c0       	push   $0xc010a44d
c0101426:	e8 26 6e 00 00       	call   c0108251 <Printf>
c010142b:	83 c4 10             	add    $0x10,%esp
c010142e:	83 ec 0c             	sub    $0xc,%esp
c0101431:	68 68 a4 10 c0       	push   $0xc010a468
c0101436:	e8 16 6e 00 00       	call   c0108251 <Printf>
c010143b:	83 c4 10             	add    $0x10,%esp
c010143e:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%ebp)
c0101445:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c010144c:	eb 44                	jmp    c0101492 <print_hd_info+0xd4>
c010144e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101451:	83 c0 04             	add    $0x4,%eax
c0101454:	8b 04 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%eax
c010145b:	85 c0                	test   %eax,%eax
c010145d:	74 2e                	je     c010148d <print_hd_info+0xcf>
c010145f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101462:	83 c0 04             	add    $0x4,%eax
c0101465:	8b 14 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%edx
c010146c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010146f:	83 c0 04             	add    $0x4,%eax
c0101472:	8b 04 c5 44 0f 11 c0 	mov    -0x3feef0bc(,%eax,8),%eax
c0101479:	ff 75 f0             	pushl  -0x10(%ebp)
c010147c:	52                   	push   %edx
c010147d:	50                   	push   %eax
c010147e:	68 35 a4 10 c0       	push   $0xc010a435
c0101483:	e8 c9 6d 00 00       	call   c0108251 <Printf>
c0101488:	83 c4 10             	add    $0x10,%esp
c010148b:	eb 01                	jmp    c010148e <print_hd_info+0xd0>
c010148d:	90                   	nop
c010148e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0101492:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c0101496:	7e b6                	jle    c010144e <print_hd_info+0x90>
c0101498:	83 ec 0c             	sub    $0xc,%esp
c010149b:	68 85 a4 10 c0       	push   $0xc010a485
c01014a0:	e8 ac 6d 00 00       	call   c0108251 <Printf>
c01014a5:	83 c4 10             	add    $0x10,%esp
c01014a8:	90                   	nop
c01014a9:	c9                   	leave  
c01014aa:	c3                   	ret    

c01014ab <is_empty>:
c01014ab:	55                   	push   %ebp
c01014ac:	89 e5                	mov    %esp,%ebp
c01014ae:	83 ec 10             	sub    $0x10,%esp
c01014b1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c01014b8:	eb 1a                	jmp    c01014d4 <is_empty+0x29>
c01014ba:	8b 55 fc             	mov    -0x4(%ebp),%edx
c01014bd:	8b 45 08             	mov    0x8(%ebp),%eax
c01014c0:	01 d0                	add    %edx,%eax
c01014c2:	0f b6 00             	movzbl (%eax),%eax
c01014c5:	84 c0                	test   %al,%al
c01014c7:	74 07                	je     c01014d0 <is_empty+0x25>
c01014c9:	b8 00 00 00 00       	mov    $0x0,%eax
c01014ce:	eb 11                	jmp    c01014e1 <is_empty+0x36>
c01014d0:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c01014d4:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01014d7:	3b 45 0c             	cmp    0xc(%ebp),%eax
c01014da:	7c de                	jl     c01014ba <is_empty+0xf>
c01014dc:	b8 01 00 00 00       	mov    $0x1,%eax
c01014e1:	c9                   	leave  
c01014e2:	c3                   	ret    
c01014e3:	66 90                	xchg   %ax,%ax
c01014e5:	66 90                	xchg   %ax,%ax
c01014e7:	66 90                	xchg   %ax,%ax
c01014e9:	66 90                	xchg   %ax,%ax
c01014eb:	66 90                	xchg   %ax,%ax
c01014ed:	66 90                	xchg   %ax,%ax
c01014ef:	90                   	nop

c01014f0 <write_debug>:
c01014f0:	b8 02 00 00 00       	mov    $0x2,%eax
c01014f5:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c01014f9:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c01014fd:	cd 90                	int    $0x90
c01014ff:	c3                   	ret    

c0101500 <send_msg>:
c0101500:	55                   	push   %ebp
c0101501:	89 e5                	mov    %esp,%ebp
c0101503:	53                   	push   %ebx
c0101504:	51                   	push   %ecx
c0101505:	b8 03 00 00 00       	mov    $0x3,%eax
c010150a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c010150d:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0101510:	cd 90                	int    $0x90
c0101512:	59                   	pop    %ecx
c0101513:	5b                   	pop    %ebx
c0101514:	5d                   	pop    %ebp
c0101515:	c3                   	ret    

c0101516 <receive_msg>:
c0101516:	55                   	push   %ebp
c0101517:	89 e5                	mov    %esp,%ebp
c0101519:	53                   	push   %ebx
c010151a:	51                   	push   %ecx
c010151b:	b8 04 00 00 00       	mov    $0x4,%eax
c0101520:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c0101523:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0101526:	cd 90                	int    $0x90
c0101528:	59                   	pop    %ecx
c0101529:	5b                   	pop    %ebx
c010152a:	5d                   	pop    %ebp
c010152b:	c3                   	ret    

c010152c <sys_malloc>:
c010152c:	56                   	push   %esi
c010152d:	57                   	push   %edi
c010152e:	53                   	push   %ebx
c010152f:	55                   	push   %ebp
c0101530:	89 e5                	mov    %esp,%ebp
c0101532:	b8 05 00 00 00       	mov    $0x5,%eax
c0101537:	8b 4d 14             	mov    0x14(%ebp),%ecx
c010153a:	cd 90                	int    $0x90
c010153c:	5d                   	pop    %ebp
c010153d:	5b                   	pop    %ebx
c010153e:	5f                   	pop    %edi
c010153f:	5e                   	pop    %esi
c0101540:	c3                   	ret    

c0101541 <sys_free>:
c0101541:	56                   	push   %esi
c0101542:	57                   	push   %edi
c0101543:	53                   	push   %ebx
c0101544:	55                   	push   %ebp
c0101545:	89 e5                	mov    %esp,%ebp
c0101547:	b8 06 00 00 00       	mov    $0x6,%eax
c010154c:	8b 4d 14             	mov    0x14(%ebp),%ecx
c010154f:	8b 5d 18             	mov    0x18(%ebp),%ebx
c0101552:	cd 90                	int    $0x90
c0101554:	5d                   	pop    %ebp
c0101555:	5b                   	pop    %ebx
c0101556:	5f                   	pop    %edi
c0101557:	5e                   	pop    %esi
c0101558:	c3                   	ret    

c0101559 <task_fs>:
c0101559:	55                   	push   %ebp
c010155a:	89 e5                	mov    %esp,%ebp
c010155c:	83 ec 28             	sub    $0x28,%esp
c010155f:	e8 bb 08 00 00       	call   c0101e1f <init_fs>
c0101564:	83 ec 0c             	sub    $0xc,%esp
c0101567:	6a 7c                	push   $0x7c
c0101569:	e8 be ff ff ff       	call   c010152c <sys_malloc>
c010156e:	83 c4 10             	add    $0x10,%esp
c0101571:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101574:	83 ec 0c             	sub    $0xc,%esp
c0101577:	6a 7c                	push   $0x7c
c0101579:	e8 ae ff ff ff       	call   c010152c <sys_malloc>
c010157e:	83 c4 10             	add    $0x10,%esp
c0101581:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0101584:	83 ec 04             	sub    $0x4,%esp
c0101587:	6a 7c                	push   $0x7c
c0101589:	6a 00                	push   $0x0
c010158b:	ff 75 f4             	pushl  -0xc(%ebp)
c010158e:	e8 98 9c 00 00       	call   c010b22b <Memset>
c0101593:	83 c4 10             	add    $0x10,%esp
c0101596:	83 ec 04             	sub    $0x4,%esp
c0101599:	6a 12                	push   $0x12
c010159b:	ff 75 f4             	pushl  -0xc(%ebp)
c010159e:	6a 02                	push   $0x2
c01015a0:	e8 79 7c 00 00       	call   c010921e <send_rec>
c01015a5:	83 c4 10             	add    $0x10,%esp
c01015a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01015ab:	8b 40 78             	mov    0x78(%eax),%eax
c01015ae:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01015b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01015b4:	8b 00                	mov    (%eax),%eax
c01015b6:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01015b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01015bc:	8b 40 50             	mov    0x50(%eax),%eax
c01015bf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01015c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01015c5:	8b 40 68             	mov    0x68(%eax),%eax
c01015c8:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01015cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01015ce:	8b 00                	mov    (%eax),%eax
c01015d0:	85 c0                	test   %eax,%eax
c01015d2:	75 07                	jne    c01015db <task_fs+0x82>
c01015d4:	c7 45 dc 05 00 00 00 	movl   $0x5,-0x24(%ebp)
c01015db:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c01015e2:	83 ec 0c             	sub    $0xc,%esp
c01015e5:	ff 75 e8             	pushl  -0x18(%ebp)
c01015e8:	e8 19 21 00 00       	call   c0103706 <pid2proc>
c01015ed:	83 c4 10             	add    $0x10,%esp
c01015f0:	a3 c8 fb 10 c0       	mov    %eax,0xc010fbc8
c01015f5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c01015f9:	74 37                	je     c0101632 <task_fs+0xd9>
c01015fb:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
c01015ff:	74 31                	je     c0101632 <task_fs+0xd9>
c0101601:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c0101605:	74 2b                	je     c0101632 <task_fs+0xd9>
c0101607:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
c010160b:	74 25                	je     c0101632 <task_fs+0xd9>
c010160d:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
c0101611:	74 1f                	je     c0101632 <task_fs+0xd9>
c0101613:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
c0101617:	74 19                	je     c0101632 <task_fs+0xd9>
c0101619:	6a 7a                	push   $0x7a
c010161b:	68 a4 a4 10 c0       	push   $0xc010a4a4
c0101620:	68 a4 a4 10 c0       	push   $0xc010a4a4
c0101625:	68 b4 a4 10 c0       	push   $0xc010a4b4
c010162a:	e8 7f 6f 00 00       	call   c01085ae <assertion_failure>
c010162f:	83 c4 10             	add    $0x10,%esp
c0101632:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c0101636:	74 3a                	je     c0101672 <task_fs+0x119>
c0101638:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c010163c:	7f 19                	jg     c0101657 <task_fs+0xfe>
c010163e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0101642:	0f 84 10 01 00 00    	je     c0101758 <task_fs+0x1ff>
c0101648:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
c010164c:	0f 84 a1 00 00 00    	je     c01016f3 <task_fs+0x19a>
c0101652:	e9 ef 00 00 00       	jmp    c0101746 <task_fs+0x1ed>
c0101657:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
c010165b:	74 50                	je     c01016ad <task_fs+0x154>
c010165d:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
c0101661:	0f 84 c6 00 00 00    	je     c010172d <task_fs+0x1d4>
c0101667:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
c010166b:	74 40                	je     c01016ad <task_fs+0x154>
c010166d:	e9 d4 00 00 00       	jmp    c0101746 <task_fs+0x1ed>
c0101672:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101675:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c010167c:	83 ec 0c             	sub    $0xc,%esp
c010167f:	ff 75 f4             	pushl  -0xc(%ebp)
c0101682:	e8 ec 07 00 00       	call   c0101e73 <do_open>
c0101687:	83 c4 10             	add    $0x10,%esp
c010168a:	89 c2                	mov    %eax,%edx
c010168c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010168f:	89 50 50             	mov    %edx,0x50(%eax)
c0101692:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101695:	8b 00                	mov    (%eax),%eax
c0101697:	83 ec 04             	sub    $0x4,%esp
c010169a:	50                   	push   %eax
c010169b:	ff 75 f4             	pushl  -0xc(%ebp)
c010169e:	6a 01                	push   $0x1
c01016a0:	e8 79 7b 00 00       	call   c010921e <send_rec>
c01016a5:	83 c4 10             	add    $0x10,%esp
c01016a8:	e9 b2 00 00 00       	jmp    c010175f <task_fs+0x206>
c01016ad:	83 ec 0c             	sub    $0xc,%esp
c01016b0:	ff 75 f4             	pushl  -0xc(%ebp)
c01016b3:	e8 f9 18 00 00       	call   c0102fb1 <do_rdwt>
c01016b8:	83 c4 10             	add    $0x10,%esp
c01016bb:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01016be:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
c01016c2:	0f 84 96 00 00 00    	je     c010175e <task_fs+0x205>
c01016c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01016cb:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c01016d2:	8b 55 d8             	mov    -0x28(%ebp),%edx
c01016d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01016d8:	89 50 60             	mov    %edx,0x60(%eax)
c01016db:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01016de:	8b 00                	mov    (%eax),%eax
c01016e0:	83 ec 04             	sub    $0x4,%esp
c01016e3:	50                   	push   %eax
c01016e4:	ff 75 f4             	pushl  -0xc(%ebp)
c01016e7:	6a 01                	push   $0x1
c01016e9:	e8 30 7b 00 00       	call   c010921e <send_rec>
c01016ee:	83 c4 10             	add    $0x10,%esp
c01016f1:	eb 6b                	jmp    c010175e <task_fs+0x205>
c01016f3:	83 ec 0c             	sub    $0xc,%esp
c01016f6:	ff 75 e4             	pushl  -0x1c(%ebp)
c01016f9:	e8 d0 1d 00 00       	call   c01034ce <do_close>
c01016fe:	83 c4 10             	add    $0x10,%esp
c0101701:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101704:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c010170b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010170e:	c7 40 58 00 00 00 00 	movl   $0x0,0x58(%eax)
c0101715:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101718:	8b 00                	mov    (%eax),%eax
c010171a:	83 ec 04             	sub    $0x4,%esp
c010171d:	50                   	push   %eax
c010171e:	ff 75 f4             	pushl  -0xc(%ebp)
c0101721:	6a 01                	push   $0x1
c0101723:	e8 f6 7a 00 00       	call   c010921e <send_rec>
c0101728:	83 c4 10             	add    $0x10,%esp
c010172b:	eb 32                	jmp    c010175f <task_fs+0x206>
c010172d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101730:	8b 40 68             	mov    0x68(%eax),%eax
c0101733:	83 ec 04             	sub    $0x4,%esp
c0101736:	50                   	push   %eax
c0101737:	ff 75 f4             	pushl  -0xc(%ebp)
c010173a:	6a 01                	push   $0x1
c010173c:	e8 dd 7a 00 00       	call   c010921e <send_rec>
c0101741:	83 c4 10             	add    $0x10,%esp
c0101744:	eb 19                	jmp    c010175f <task_fs+0x206>
c0101746:	83 ec 0c             	sub    $0xc,%esp
c0101749:	68 17 a5 10 c0       	push   $0xc010a517
c010174e:	e8 3d 6e 00 00       	call   c0108590 <panic>
c0101753:	83 c4 10             	add    $0x10,%esp
c0101756:	eb 07                	jmp    c010175f <task_fs+0x206>
c0101758:	90                   	nop
c0101759:	e9 26 fe ff ff       	jmp    c0101584 <task_fs+0x2b>
c010175e:	90                   	nop
c010175f:	e9 20 fe ff ff       	jmp    c0101584 <task_fs+0x2b>

c0101764 <rd_wt>:
c0101764:	55                   	push   %ebp
c0101765:	89 e5                	mov    %esp,%ebp
c0101767:	83 ec 18             	sub    $0x18,%esp
c010176a:	83 ec 0c             	sub    $0xc,%esp
c010176d:	6a 7c                	push   $0x7c
c010176f:	e8 b8 fd ff ff       	call   c010152c <sys_malloc>
c0101774:	83 c4 10             	add    $0x10,%esp
c0101777:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010177a:	83 ec 04             	sub    $0x4,%esp
c010177d:	6a 7c                	push   $0x7c
c010177f:	6a 00                	push   $0x0
c0101781:	ff 75 f4             	pushl  -0xc(%ebp)
c0101784:	e8 a2 9a 00 00       	call   c010b22b <Memset>
c0101789:	83 c4 10             	add    $0x10,%esp
c010178c:	8b 55 18             	mov    0x18(%ebp),%edx
c010178f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101792:	89 50 78             	mov    %edx,0x78(%eax)
c0101795:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101798:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010179b:	89 50 14             	mov    %edx,0x14(%eax)
c010179e:	8b 55 10             	mov    0x10(%ebp),%edx
c01017a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01017a4:	89 50 10             	mov    %edx,0x10(%eax)
c01017a7:	8b 55 14             	mov    0x14(%ebp),%edx
c01017aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01017ad:	89 50 0c             	mov    %edx,0xc(%eax)
c01017b0:	8b 45 08             	mov    0x8(%ebp),%eax
c01017b3:	c1 e0 09             	shl    $0x9,%eax
c01017b6:	89 c2                	mov    %eax,%edx
c01017b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01017bb:	89 50 18             	mov    %edx,0x18(%eax)
c01017be:	83 7d 18 07          	cmpl   $0x7,0x18(%ebp)
c01017c2:	74 22                	je     c01017e6 <rd_wt+0x82>
c01017c4:	83 7d 18 0a          	cmpl   $0xa,0x18(%ebp)
c01017c8:	74 1c                	je     c01017e6 <rd_wt+0x82>
c01017ca:	68 b1 00 00 00       	push   $0xb1
c01017cf:	68 a4 a4 10 c0       	push   $0xc010a4a4
c01017d4:	68 a4 a4 10 c0       	push   $0xc010a4a4
c01017d9:	68 2a a5 10 c0       	push   $0xc010a52a
c01017de:	e8 cb 6d 00 00       	call   c01085ae <assertion_failure>
c01017e3:	83 c4 10             	add    $0x10,%esp
c01017e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01017e9:	8b 40 78             	mov    0x78(%eax),%eax
c01017ec:	83 f8 07             	cmp    $0x7,%eax
c01017ef:	74 27                	je     c0101818 <rd_wt+0xb4>
c01017f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01017f4:	8b 40 78             	mov    0x78(%eax),%eax
c01017f7:	83 f8 0a             	cmp    $0xa,%eax
c01017fa:	74 1c                	je     c0101818 <rd_wt+0xb4>
c01017fc:	68 b2 00 00 00       	push   $0xb2
c0101801:	68 a4 a4 10 c0       	push   $0xc010a4a4
c0101806:	68 a4 a4 10 c0       	push   $0xc010a4a4
c010180b:	68 48 a5 10 c0       	push   $0xc010a548
c0101810:	e8 99 6d 00 00       	call   c01085ae <assertion_failure>
c0101815:	83 c4 10             	add    $0x10,%esp
c0101818:	83 ec 04             	sub    $0x4,%esp
c010181b:	6a 03                	push   $0x3
c010181d:	ff 75 f4             	pushl  -0xc(%ebp)
c0101820:	6a 03                	push   $0x3
c0101822:	e8 f7 79 00 00       	call   c010921e <send_rec>
c0101827:	83 c4 10             	add    $0x10,%esp
c010182a:	83 ec 08             	sub    $0x8,%esp
c010182d:	6a 7c                	push   $0x7c
c010182f:	ff 75 f4             	pushl  -0xc(%ebp)
c0101832:	e8 0a fd ff ff       	call   c0101541 <sys_free>
c0101837:	83 c4 10             	add    $0x10,%esp
c010183a:	90                   	nop
c010183b:	c9                   	leave  
c010183c:	c3                   	ret    

c010183d <mkfs>:
c010183d:	55                   	push   %ebp
c010183e:	89 e5                	mov    %esp,%ebp
c0101840:	57                   	push   %edi
c0101841:	81 ec d4 00 00 00    	sub    $0xd4,%esp
c0101847:	83 ec 0c             	sub    $0xc,%esp
c010184a:	68 00 80 00 00       	push   $0x8000
c010184f:	e8 d8 fc ff ff       	call   c010152c <sys_malloc>
c0101854:	83 c4 10             	add    $0x10,%esp
c0101857:	a3 a4 21 11 c0       	mov    %eax,0xc01121a4
c010185c:	83 ec 0c             	sub    $0xc,%esp
c010185f:	6a 24                	push   $0x24
c0101861:	e8 c6 fc ff ff       	call   c010152c <sys_malloc>
c0101866:	83 c4 10             	add    $0x10,%esp
c0101869:	a3 a0 21 11 c0       	mov    %eax,0xc01121a0
c010186e:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101873:	83 ec 0c             	sub    $0xc,%esp
c0101876:	50                   	push   %eax
c0101877:	e8 0f 46 00 00       	call   c0105e8b <get_physical_address>
c010187c:	83 c4 10             	add    $0x10,%esp
c010187f:	a3 84 17 11 c0       	mov    %eax,0xc0111784
c0101884:	a1 a0 21 11 c0       	mov    0xc01121a0,%eax
c0101889:	83 ec 0c             	sub    $0xc,%esp
c010188c:	50                   	push   %eax
c010188d:	e8 f9 45 00 00       	call   c0105e8b <get_physical_address>
c0101892:	83 c4 10             	add    $0x10,%esp
c0101895:	a3 80 17 11 c0       	mov    %eax,0xc0111780
c010189a:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c010189f:	83 ec 04             	sub    $0x4,%esp
c01018a2:	68 00 02 00 00       	push   $0x200
c01018a7:	6a 00                	push   $0x0
c01018a9:	50                   	push   %eax
c01018aa:	e8 7c 99 00 00       	call   c010b22b <Memset>
c01018af:	83 c4 10             	add    $0x10,%esp
c01018b2:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01018b7:	83 ec 0c             	sub    $0xc,%esp
c01018ba:	6a 0a                	push   $0xa
c01018bc:	68 00 02 00 00       	push   $0x200
c01018c1:	50                   	push   %eax
c01018c2:	6a 20                	push   $0x20
c01018c4:	6a 00                	push   $0x0
c01018c6:	e8 99 fe ff ff       	call   c0101764 <rd_wt>
c01018cb:	83 c4 20             	add    $0x20,%esp
c01018ce:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c01018d3:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01018d6:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01018d9:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c01018e0:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01018e3:	c7 40 10 00 08 00 00 	movl   $0x800,0x10(%eax)
c01018ea:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01018ed:	c7 40 08 00 08 00 00 	movl   $0x800,0x8(%eax)
c01018f4:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01018f7:	c7 40 0c 00 01 00 00 	movl   $0x100,0xc(%eax)
c01018fe:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101901:	8b 40 04             	mov    0x4(%eax),%eax
c0101904:	8d 50 02             	lea    0x2(%eax),%edx
c0101907:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010190a:	8b 40 08             	mov    0x8(%eax),%eax
c010190d:	01 c2                	add    %eax,%edx
c010190f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101912:	8b 40 0c             	mov    0xc(%eax),%eax
c0101915:	01 c2                	add    %eax,%edx
c0101917:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010191a:	89 10                	mov    %edx,(%eax)
c010191c:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c0101923:	b8 00 02 00 00       	mov    $0x200,%eax
c0101928:	2b 45 d8             	sub    -0x28(%ebp),%eax
c010192b:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0101931:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0101934:	01 ca                	add    %ecx,%edx
c0101936:	83 ec 04             	sub    $0x4,%esp
c0101939:	50                   	push   %eax
c010193a:	6a 80                	push   $0xffffff80
c010193c:	52                   	push   %edx
c010193d:	e8 e9 98 00 00       	call   c010b22b <Memset>
c0101942:	83 c4 10             	add    $0x10,%esp
c0101945:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010194a:	83 ec 0c             	sub    $0xc,%esp
c010194d:	6a 0a                	push   $0xa
c010194f:	68 00 02 00 00       	push   $0x200
c0101954:	50                   	push   %eax
c0101955:	6a 20                	push   $0x20
c0101957:	6a 01                	push   $0x1
c0101959:	e8 06 fe ff ff       	call   c0101764 <rd_wt>
c010195e:	83 c4 20             	add    $0x20,%esp
c0101961:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101964:	8b 10                	mov    (%eax),%edx
c0101966:	89 55 98             	mov    %edx,-0x68(%ebp)
c0101969:	8b 50 04             	mov    0x4(%eax),%edx
c010196c:	89 55 9c             	mov    %edx,-0x64(%ebp)
c010196f:	8b 50 08             	mov    0x8(%eax),%edx
c0101972:	89 55 a0             	mov    %edx,-0x60(%ebp)
c0101975:	8b 50 0c             	mov    0xc(%eax),%edx
c0101978:	89 55 a4             	mov    %edx,-0x5c(%ebp)
c010197b:	8b 50 10             	mov    0x10(%eax),%edx
c010197e:	89 55 a8             	mov    %edx,-0x58(%ebp)
c0101981:	8b 50 14             	mov    0x14(%eax),%edx
c0101984:	89 55 ac             	mov    %edx,-0x54(%ebp)
c0101987:	8b 50 18             	mov    0x18(%eax),%edx
c010198a:	89 55 b0             	mov    %edx,-0x50(%ebp)
c010198d:	8b 50 1c             	mov    0x1c(%eax),%edx
c0101990:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c0101993:	8b 40 20             	mov    0x20(%eax),%eax
c0101996:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0101999:	c6 45 d7 3f          	movb   $0x3f,-0x29(%ebp)
c010199d:	0f be 55 d7          	movsbl -0x29(%ebp),%edx
c01019a1:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c01019a6:	83 ec 04             	sub    $0x4,%esp
c01019a9:	6a 01                	push   $0x1
c01019ab:	52                   	push   %edx
c01019ac:	50                   	push   %eax
c01019ad:	e8 79 98 00 00       	call   c010b22b <Memset>
c01019b2:	83 c4 10             	add    $0x10,%esp
c01019b5:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c01019ba:	83 c0 01             	add    $0x1,%eax
c01019bd:	83 ec 04             	sub    $0x4,%esp
c01019c0:	68 ff 01 00 00       	push   $0x1ff
c01019c5:	6a 80                	push   $0xffffff80
c01019c7:	50                   	push   %eax
c01019c8:	e8 5e 98 00 00       	call   c010b22b <Memset>
c01019cd:	83 c4 10             	add    $0x10,%esp
c01019d0:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01019d5:	83 ec 0c             	sub    $0xc,%esp
c01019d8:	6a 0a                	push   $0xa
c01019da:	68 00 02 00 00       	push   $0x200
c01019df:	50                   	push   %eax
c01019e0:	6a 20                	push   $0x20
c01019e2:	6a 02                	push   $0x2
c01019e4:	e8 7b fd ff ff       	call   c0101764 <rd_wt>
c01019e9:	83 c4 20             	add    $0x20,%esp
c01019ec:	c7 45 d0 03 00 00 00 	movl   $0x3,-0x30(%ebp)
c01019f3:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c01019f8:	83 ec 04             	sub    $0x4,%esp
c01019fb:	68 00 02 00 00       	push   $0x200
c0101a00:	6a ff                	push   $0xffffffff
c0101a02:	50                   	push   %eax
c0101a03:	e8 23 98 00 00       	call   c010b22b <Memset>
c0101a08:	83 c4 10             	add    $0x10,%esp
c0101a0b:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101a10:	83 ec 0c             	sub    $0xc,%esp
c0101a13:	6a 0a                	push   $0xa
c0101a15:	68 00 02 00 00       	push   $0x200
c0101a1a:	50                   	push   %eax
c0101a1b:	6a 20                	push   $0x20
c0101a1d:	ff 75 d0             	pushl  -0x30(%ebp)
c0101a20:	e8 3f fd ff ff       	call   c0101764 <rd_wt>
c0101a25:	83 c4 20             	add    $0x20,%esp
c0101a28:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101a2d:	83 ec 04             	sub    $0x4,%esp
c0101a30:	6a 01                	push   $0x1
c0101a32:	6a 01                	push   $0x1
c0101a34:	50                   	push   %eax
c0101a35:	e8 f1 97 00 00       	call   c010b22b <Memset>
c0101a3a:	83 c4 10             	add    $0x10,%esp
c0101a3d:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101a42:	83 c0 01             	add    $0x1,%eax
c0101a45:	83 ec 04             	sub    $0x4,%esp
c0101a48:	68 ff 01 00 00       	push   $0x1ff
c0101a4d:	6a 00                	push   $0x0
c0101a4f:	50                   	push   %eax
c0101a50:	e8 d6 97 00 00       	call   c010b22b <Memset>
c0101a55:	83 c4 10             	add    $0x10,%esp
c0101a58:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101a5d:	89 c2                	mov    %eax,%edx
c0101a5f:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0101a62:	83 c0 01             	add    $0x1,%eax
c0101a65:	83 ec 0c             	sub    $0xc,%esp
c0101a68:	6a 0a                	push   $0xa
c0101a6a:	68 00 02 00 00       	push   $0x200
c0101a6f:	52                   	push   %edx
c0101a70:	6a 20                	push   $0x20
c0101a72:	50                   	push   %eax
c0101a73:	e8 ec fc ff ff       	call   c0101764 <rd_wt>
c0101a78:	83 c4 20             	add    $0x20,%esp
c0101a7b:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101a7e:	83 e8 02             	sub    $0x2,%eax
c0101a81:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0101a84:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0101a8b:	eb 04                	jmp    c0101a91 <mkfs+0x254>
c0101a8d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0101a91:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0101a94:	83 c0 01             	add    $0x1,%eax
c0101a97:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0101a9a:	7e f1                	jle    c0101a8d <mkfs+0x250>
c0101a9c:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101aa1:	89 c2                	mov    %eax,%edx
c0101aa3:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101aa6:	83 c0 03             	add    $0x3,%eax
c0101aa9:	83 ec 0c             	sub    $0xc,%esp
c0101aac:	6a 0a                	push   $0xa
c0101aae:	68 00 02 00 00       	push   $0x200
c0101ab3:	52                   	push   %edx
c0101ab4:	6a 20                	push   $0x20
c0101ab6:	50                   	push   %eax
c0101ab7:	e8 a8 fc ff ff       	call   c0101764 <rd_wt>
c0101abc:	83 c4 20             	add    $0x20,%esp
c0101abf:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101ac4:	89 c2                	mov    %eax,%edx
c0101ac6:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101ac9:	83 c0 03             	add    $0x3,%eax
c0101acc:	83 ec 0c             	sub    $0xc,%esp
c0101acf:	6a 07                	push   $0x7
c0101ad1:	68 00 02 00 00       	push   $0x200
c0101ad6:	52                   	push   %edx
c0101ad7:	6a 20                	push   $0x20
c0101ad9:	50                   	push   %eax
c0101ada:	e8 85 fc ff ff       	call   c0101764 <rd_wt>
c0101adf:	83 c4 20             	add    $0x20,%esp
c0101ae2:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101ae7:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0101aea:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101aed:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0101af3:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101af6:	c7 40 04 50 00 00 00 	movl   $0x50,0x4(%eax)
c0101afd:	8b 55 98             	mov    -0x68(%ebp),%edx
c0101b00:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101b03:	89 50 08             	mov    %edx,0x8(%eax)
c0101b06:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101b09:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0101b10:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101b13:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c0101b1a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101b1d:	8b 10                	mov    (%eax),%edx
c0101b1f:	89 15 c0 21 11 c0    	mov    %edx,0xc01121c0
c0101b25:	8b 50 04             	mov    0x4(%eax),%edx
c0101b28:	89 15 c4 21 11 c0    	mov    %edx,0xc01121c4
c0101b2e:	8b 50 08             	mov    0x8(%eax),%edx
c0101b31:	89 15 c8 21 11 c0    	mov    %edx,0xc01121c8
c0101b37:	8b 50 0c             	mov    0xc(%eax),%edx
c0101b3a:	89 15 cc 21 11 c0    	mov    %edx,0xc01121cc
c0101b40:	8b 50 10             	mov    0x10(%eax),%edx
c0101b43:	89 15 d0 21 11 c0    	mov    %edx,0xc01121d0
c0101b49:	8b 50 14             	mov    0x14(%eax),%edx
c0101b4c:	89 15 d4 21 11 c0    	mov    %edx,0xc01121d4
c0101b52:	8b 50 18             	mov    0x18(%eax),%edx
c0101b55:	89 15 d8 21 11 c0    	mov    %edx,0xc01121d8
c0101b5b:	8b 50 1c             	mov    0x1c(%eax),%edx
c0101b5e:	89 15 dc 21 11 c0    	mov    %edx,0xc01121dc
c0101b64:	8b 50 20             	mov    0x20(%eax),%edx
c0101b67:	89 15 e0 21 11 c0    	mov    %edx,0xc01121e0
c0101b6d:	8b 40 24             	mov    0x24(%eax),%eax
c0101b70:	a3 e4 21 11 c0       	mov    %eax,0xc01121e4
c0101b75:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0101b7c:	eb 4c                	jmp    c0101bca <mkfs+0x38d>
c0101b7e:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101b83:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0101b86:	83 c2 01             	add    $0x1,%edx
c0101b89:	c1 e2 05             	shl    $0x5,%edx
c0101b8c:	01 d0                	add    %edx,%eax
c0101b8e:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0101b91:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101b94:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0101b9a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101b9d:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0101ba4:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101ba7:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c0101bae:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
c0101bb5:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0101bb8:	c1 e0 08             	shl    $0x8,%eax
c0101bbb:	0b 45 f0             	or     -0x10(%ebp),%eax
c0101bbe:	89 c2                	mov    %eax,%edx
c0101bc0:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101bc3:	89 50 08             	mov    %edx,0x8(%eax)
c0101bc6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0101bca:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
c0101bce:	7e ae                	jle    c0101b7e <mkfs+0x341>
c0101bd0:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
c0101bd7:	8d 95 70 ff ff ff    	lea    -0x90(%ebp),%edx
c0101bdd:	b8 00 00 00 00       	mov    $0x0,%eax
c0101be2:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0101be7:	89 d7                	mov    %edx,%edi
c0101be9:	f3 ab                	rep stos %eax,%es:(%edi)
c0101beb:	c7 85 70 ff ff ff 70 	movl   $0xc010a570,-0x90(%ebp)
c0101bf2:	a5 10 c0 
c0101bf5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0101bfc:	eb 54                	jmp    c0101c52 <mkfs+0x415>
c0101bfe:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101c03:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0101c06:	83 c2 04             	add    $0x4,%edx
c0101c09:	c1 e2 05             	shl    $0x5,%edx
c0101c0c:	01 d0                	add    %edx,%eax
c0101c0e:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0101c11:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101c14:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0101c1a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101c1d:	c7 40 04 00 e8 08 00 	movl   $0x8e800,0x4(%eax)
c0101c24:	8b 45 98             	mov    -0x68(%ebp),%eax
c0101c27:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0101c2a:	83 c2 01             	add    $0x1,%edx
c0101c2d:	c1 e2 0b             	shl    $0xb,%edx
c0101c30:	01 c2                	add    %eax,%edx
c0101c32:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101c35:	89 50 08             	mov    %edx,0x8(%eax)
c0101c38:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101c3b:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0101c42:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101c45:	8d 50 05             	lea    0x5(%eax),%edx
c0101c48:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101c4b:	89 50 10             	mov    %edx,0x10(%eax)
c0101c4e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0101c52:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101c55:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0101c58:	7c a4                	jl     c0101bfe <mkfs+0x3c1>
c0101c5a:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101c5f:	89 c2                	mov    %eax,%edx
c0101c61:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101c64:	83 c0 03             	add    $0x3,%eax
c0101c67:	83 ec 0c             	sub    $0xc,%esp
c0101c6a:	6a 0a                	push   $0xa
c0101c6c:	68 00 02 00 00       	push   $0x200
c0101c71:	52                   	push   %edx
c0101c72:	6a 20                	push   $0x20
c0101c74:	50                   	push   %eax
c0101c75:	e8 ea fa ff ff       	call   c0101764 <rd_wt>
c0101c7a:	83 c4 20             	add    $0x20,%esp
c0101c7d:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101c82:	89 c2                	mov    %eax,%edx
c0101c84:	8b 45 98             	mov    -0x68(%ebp),%eax
c0101c87:	83 ec 0c             	sub    $0xc,%esp
c0101c8a:	6a 07                	push   $0x7
c0101c8c:	68 00 02 00 00       	push   $0x200
c0101c91:	52                   	push   %edx
c0101c92:	6a 20                	push   $0x20
c0101c94:	50                   	push   %eax
c0101c95:	e8 ca fa ff ff       	call   c0101764 <rd_wt>
c0101c9a:	83 c4 20             	add    $0x20,%esp
c0101c9d:	c7 85 60 ff ff ff cc 	movl   $0xcc,-0xa0(%ebp)
c0101ca4:	00 00 00 
c0101ca7:	66 c7 85 5e ff ff ff 	movw   $0x2e,-0xa2(%ebp)
c0101cae:	2e 00 
c0101cb0:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101cb5:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0101cb8:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101cbb:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0101cc1:	83 ec 0c             	sub    $0xc,%esp
c0101cc4:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0101cca:	50                   	push   %eax
c0101ccb:	e8 94 95 00 00       	call   c010b264 <Strlen>
c0101cd0:	83 c4 10             	add    $0x10,%esp
c0101cd3:	89 c1                	mov    %eax,%ecx
c0101cd5:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101cd8:	8d 50 04             	lea    0x4(%eax),%edx
c0101cdb:	83 ec 04             	sub    $0x4,%esp
c0101cde:	51                   	push   %ecx
c0101cdf:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0101ce5:	50                   	push   %eax
c0101ce6:	52                   	push   %edx
c0101ce7:	e8 bd 4e 00 00       	call   c0106ba9 <Memcpy>
c0101cec:	83 c4 10             	add    $0x10,%esp
c0101cef:	8d 95 34 ff ff ff    	lea    -0xcc(%ebp),%edx
c0101cf5:	b8 00 00 00 00       	mov    $0x0,%eax
c0101cfa:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0101cff:	89 d7                	mov    %edx,%edi
c0101d01:	f3 ab                	rep stos %eax,%es:(%edi)
c0101d03:	c7 85 34 ff ff ff 7c 	movl   $0xc010a57c,-0xcc(%ebp)
c0101d0a:	a5 10 c0 
c0101d0d:	c7 85 38 ff ff ff 85 	movl   $0xc010a585,-0xc8(%ebp)
c0101d14:	a5 10 c0 
c0101d17:	c7 85 3c ff ff ff 8e 	movl   $0xc010a58e,-0xc4(%ebp)
c0101d1e:	a5 10 c0 
c0101d21:	c7 45 bc 03 00 00 00 	movl   $0x3,-0x44(%ebp)
c0101d28:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0101d2f:	eb 49                	jmp    c0101d7a <mkfs+0x53d>
c0101d31:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0101d35:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101d38:	8d 50 02             	lea    0x2(%eax),%edx
c0101d3b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101d3e:	89 10                	mov    %edx,(%eax)
c0101d40:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101d43:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0101d4a:	83 ec 0c             	sub    $0xc,%esp
c0101d4d:	50                   	push   %eax
c0101d4e:	e8 11 95 00 00       	call   c010b264 <Strlen>
c0101d53:	83 c4 10             	add    $0x10,%esp
c0101d56:	89 c1                	mov    %eax,%ecx
c0101d58:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101d5b:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0101d62:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0101d65:	83 c2 04             	add    $0x4,%edx
c0101d68:	83 ec 04             	sub    $0x4,%esp
c0101d6b:	51                   	push   %ecx
c0101d6c:	50                   	push   %eax
c0101d6d:	52                   	push   %edx
c0101d6e:	e8 36 4e 00 00       	call   c0106ba9 <Memcpy>
c0101d73:	83 c4 10             	add    $0x10,%esp
c0101d76:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0101d7a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101d7d:	3b 45 bc             	cmp    -0x44(%ebp),%eax
c0101d80:	7c af                	jl     c0101d31 <mkfs+0x4f4>
c0101d82:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0101d89:	eb 66                	jmp    c0101df1 <mkfs+0x5b4>
c0101d8b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101d8e:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0101d95:	83 ec 0c             	sub    $0xc,%esp
c0101d98:	50                   	push   %eax
c0101d99:	e8 c6 94 00 00       	call   c010b264 <Strlen>
c0101d9e:	83 c4 10             	add    $0x10,%esp
c0101da1:	85 c0                	test   %eax,%eax
c0101da3:	74 47                	je     c0101dec <mkfs+0x5af>
c0101da5:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0101da9:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101dac:	8d 50 05             	lea    0x5(%eax),%edx
c0101daf:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101db2:	89 10                	mov    %edx,(%eax)
c0101db4:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101db7:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0101dbe:	83 ec 0c             	sub    $0xc,%esp
c0101dc1:	50                   	push   %eax
c0101dc2:	e8 9d 94 00 00       	call   c010b264 <Strlen>
c0101dc7:	83 c4 10             	add    $0x10,%esp
c0101dca:	89 c1                	mov    %eax,%ecx
c0101dcc:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101dcf:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0101dd6:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0101dd9:	83 c2 04             	add    $0x4,%edx
c0101ddc:	83 ec 04             	sub    $0x4,%esp
c0101ddf:	51                   	push   %ecx
c0101de0:	50                   	push   %eax
c0101de1:	52                   	push   %edx
c0101de2:	e8 c2 4d 00 00       	call   c0106ba9 <Memcpy>
c0101de7:	83 c4 10             	add    $0x10,%esp
c0101dea:	eb 01                	jmp    c0101ded <mkfs+0x5b0>
c0101dec:	90                   	nop
c0101ded:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0101df1:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101df4:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0101df7:	7c 92                	jl     c0101d8b <mkfs+0x54e>
c0101df9:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101dfe:	89 c2                	mov    %eax,%edx
c0101e00:	8b 45 98             	mov    -0x68(%ebp),%eax
c0101e03:	83 ec 0c             	sub    $0xc,%esp
c0101e06:	6a 0a                	push   $0xa
c0101e08:	68 00 02 00 00       	push   $0x200
c0101e0d:	52                   	push   %edx
c0101e0e:	6a 20                	push   $0x20
c0101e10:	50                   	push   %eax
c0101e11:	e8 4e f9 ff ff       	call   c0101764 <rd_wt>
c0101e16:	83 c4 20             	add    $0x20,%esp
c0101e19:	90                   	nop
c0101e1a:	8b 7d fc             	mov    -0x4(%ebp),%edi
c0101e1d:	c9                   	leave  
c0101e1e:	c3                   	ret    

c0101e1f <init_fs>:
c0101e1f:	55                   	push   %ebp
c0101e20:	89 e5                	mov    %esp,%ebp
c0101e22:	83 ec 18             	sub    $0x18,%esp
c0101e25:	83 ec 0c             	sub    $0xc,%esp
c0101e28:	6a 7c                	push   $0x7c
c0101e2a:	e8 fd f6 ff ff       	call   c010152c <sys_malloc>
c0101e2f:	83 c4 10             	add    $0x10,%esp
c0101e32:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101e35:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101e38:	c7 40 78 06 00 00 00 	movl   $0x6,0x78(%eax)
c0101e3f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101e42:	c7 40 14 20 00 00 00 	movl   $0x20,0x14(%eax)
c0101e49:	83 ec 04             	sub    $0x4,%esp
c0101e4c:	6a 03                	push   $0x3
c0101e4e:	ff 75 f4             	pushl  -0xc(%ebp)
c0101e51:	6a 03                	push   $0x3
c0101e53:	e8 c6 73 00 00       	call   c010921e <send_rec>
c0101e58:	83 c4 10             	add    $0x10,%esp
c0101e5b:	e8 dd f9 ff ff       	call   c010183d <mkfs>
c0101e60:	83 ec 08             	sub    $0x8,%esp
c0101e63:	6a 7c                	push   $0x7c
c0101e65:	ff 75 f4             	pushl  -0xc(%ebp)
c0101e68:	e8 d4 f6 ff ff       	call   c0101541 <sys_free>
c0101e6d:	83 c4 10             	add    $0x10,%esp
c0101e70:	90                   	nop
c0101e71:	c9                   	leave  
c0101e72:	c3                   	ret    

c0101e73 <do_open>:
c0101e73:	55                   	push   %ebp
c0101e74:	89 e5                	mov    %esp,%ebp
c0101e76:	83 ec 68             	sub    $0x68,%esp
c0101e79:	83 ec 04             	sub    $0x4,%esp
c0101e7c:	6a 0c                	push   $0xc
c0101e7e:	6a 00                	push   $0x0
c0101e80:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0101e83:	50                   	push   %eax
c0101e84:	e8 a2 93 00 00       	call   c010b22b <Memset>
c0101e89:	83 c4 10             	add    $0x10,%esp
c0101e8c:	8b 45 08             	mov    0x8(%ebp),%eax
c0101e8f:	8b 40 44             	mov    0x44(%eax),%eax
c0101e92:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0101e95:	83 ec 08             	sub    $0x8,%esp
c0101e98:	6a 0c                	push   $0xc
c0101e9a:	ff 75 e4             	pushl  -0x1c(%ebp)
c0101e9d:	e8 9a 3e 00 00       	call   c0105d3c <alloc_virtual_memory>
c0101ea2:	83 c4 10             	add    $0x10,%esp
c0101ea5:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0101ea8:	8b 45 08             	mov    0x8(%ebp),%eax
c0101eab:	8b 40 40             	mov    0x40(%eax),%eax
c0101eae:	89 c2                	mov    %eax,%edx
c0101eb0:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101eb3:	83 ec 04             	sub    $0x4,%esp
c0101eb6:	52                   	push   %edx
c0101eb7:	50                   	push   %eax
c0101eb8:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0101ebb:	50                   	push   %eax
c0101ebc:	e8 e8 4c 00 00       	call   c0106ba9 <Memcpy>
c0101ec1:	83 c4 10             	add    $0x10,%esp
c0101ec4:	8b 45 08             	mov    0x8(%ebp),%eax
c0101ec7:	8b 40 40             	mov    0x40(%eax),%eax
c0101eca:	c6 44 05 c4 00       	movb   $0x0,-0x3c(%ebp,%eax,1)
c0101ecf:	8b 45 08             	mov    0x8(%ebp),%eax
c0101ed2:	8b 40 74             	mov    0x74(%eax),%eax
c0101ed5:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0101ed8:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c0101edf:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0101ee6:	eb 1f                	jmp    c0101f07 <do_open+0x94>
c0101ee8:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c0101eed:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0101ef0:	83 c2 4c             	add    $0x4c,%edx
c0101ef3:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c0101ef7:	85 c0                	test   %eax,%eax
c0101ef9:	75 08                	jne    c0101f03 <do_open+0x90>
c0101efb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101efe:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101f01:	eb 0a                	jmp    c0101f0d <do_open+0x9a>
c0101f03:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0101f07:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c0101f0b:	7e db                	jle    c0101ee8 <do_open+0x75>
c0101f0d:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c0101f11:	75 1c                	jne    c0101f2f <do_open+0xbc>
c0101f13:	68 c6 01 00 00       	push   $0x1c6
c0101f18:	68 a4 a4 10 c0       	push   $0xc010a4a4
c0101f1d:	68 a4 a4 10 c0       	push   $0xc010a4a4
c0101f22:	68 97 a5 10 c0       	push   $0xc010a597
c0101f27:	e8 82 66 00 00       	call   c01085ae <assertion_failure>
c0101f2c:	83 c4 10             	add    $0x10,%esp
c0101f2f:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%ebp)
c0101f36:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0101f3d:	eb 1d                	jmp    c0101f5c <do_open+0xe9>
c0101f3f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101f42:	c1 e0 04             	shl    $0x4,%eax
c0101f45:	05 88 13 11 c0       	add    $0xc0111388,%eax
c0101f4a:	8b 00                	mov    (%eax),%eax
c0101f4c:	85 c0                	test   %eax,%eax
c0101f4e:	75 08                	jne    c0101f58 <do_open+0xe5>
c0101f50:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101f53:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0101f56:	eb 0a                	jmp    c0101f62 <do_open+0xef>
c0101f58:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0101f5c:	83 7d e8 3f          	cmpl   $0x3f,-0x18(%ebp)
c0101f60:	7e dd                	jle    c0101f3f <do_open+0xcc>
c0101f62:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
c0101f66:	75 1c                	jne    c0101f84 <do_open+0x111>
c0101f68:	68 d2 01 00 00       	push   $0x1d2
c0101f6d:	68 a4 a4 10 c0       	push   $0xc010a4a4
c0101f72:	68 a4 a4 10 c0       	push   $0xc010a4a4
c0101f77:	68 9f a5 10 c0       	push   $0xc010a59f
c0101f7c:	e8 2d 66 00 00       	call   c01085ae <assertion_failure>
c0101f81:	83 c4 10             	add    $0x10,%esp
c0101f84:	83 ec 0c             	sub    $0xc,%esp
c0101f87:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0101f8a:	50                   	push   %eax
c0101f8b:	e8 b2 00 00 00       	call   c0102042 <search_file>
c0101f90:	83 c4 10             	add    $0x10,%esp
c0101f93:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0101f96:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c0101f9a:	75 2b                	jne    c0101fc7 <do_open+0x154>
c0101f9c:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0101fa0:	7e 10                	jle    c0101fb2 <do_open+0x13f>
c0101fa2:	83 ec 0c             	sub    $0xc,%esp
c0101fa5:	68 a7 a5 10 c0       	push   $0xc010a5a7
c0101faa:	e8 e1 65 00 00       	call   c0108590 <panic>
c0101faf:	83 c4 10             	add    $0x10,%esp
c0101fb2:	83 ec 08             	sub    $0x8,%esp
c0101fb5:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0101fb8:	50                   	push   %eax
c0101fb9:	8d 45 9c             	lea    -0x64(%ebp),%eax
c0101fbc:	50                   	push   %eax
c0101fbd:	e8 40 04 00 00       	call   c0102402 <create_file>
c0101fc2:	83 c4 10             	add    $0x10,%esp
c0101fc5:	eb 22                	jmp    c0101fe9 <do_open+0x176>
c0101fc7:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
c0101fcb:	75 07                	jne    c0101fd4 <do_open+0x161>
c0101fcd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0101fd2:	eb 6c                	jmp    c0102040 <do_open+0x1cd>
c0101fd4:	83 ec 08             	sub    $0x8,%esp
c0101fd7:	ff 75 d8             	pushl  -0x28(%ebp)
c0101fda:	8d 45 9c             	lea    -0x64(%ebp),%eax
c0101fdd:	50                   	push   %eax
c0101fde:	e8 5d 02 00 00       	call   c0102240 <get_inode>
c0101fe3:	83 c4 10             	add    $0x10,%esp
c0101fe6:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0101fe9:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c0101fee:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0101ff1:	c1 e2 04             	shl    $0x4,%edx
c0101ff4:	8d 8a 80 13 11 c0    	lea    -0x3feeec80(%edx),%ecx
c0101ffa:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0101ffd:	83 c2 4c             	add    $0x4c,%edx
c0102000:	89 4c 90 0c          	mov    %ecx,0xc(%eax,%edx,4)
c0102004:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0102007:	8b 55 ec             	mov    -0x14(%ebp),%edx
c010200a:	c1 e2 04             	shl    $0x4,%edx
c010200d:	81 c2 88 13 11 c0    	add    $0xc0111388,%edx
c0102013:	89 02                	mov    %eax,(%edx)
c0102015:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102018:	c1 e0 04             	shl    $0x4,%eax
c010201b:	05 84 13 11 c0       	add    $0xc0111384,%eax
c0102020:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0102026:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102029:	c1 e0 04             	shl    $0x4,%eax
c010202c:	05 80 13 11 c0       	add    $0xc0111380,%eax
c0102031:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0102037:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010203a:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010203d:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0102040:	c9                   	leave  
c0102041:	c3                   	ret    

c0102042 <search_file>:
c0102042:	55                   	push   %ebp
c0102043:	89 e5                	mov    %esp,%ebp
c0102045:	83 ec 68             	sub    $0x68,%esp
c0102048:	83 ec 04             	sub    $0x4,%esp
c010204b:	6a 0c                	push   $0xc
c010204d:	6a 00                	push   $0x0
c010204f:	8d 45 c0             	lea    -0x40(%ebp),%eax
c0102052:	50                   	push   %eax
c0102053:	e8 d3 91 00 00       	call   c010b22b <Memset>
c0102058:	83 c4 10             	add    $0x10,%esp
c010205b:	83 ec 04             	sub    $0x4,%esp
c010205e:	6a 28                	push   $0x28
c0102060:	6a 00                	push   $0x0
c0102062:	8d 45 98             	lea    -0x68(%ebp),%eax
c0102065:	50                   	push   %eax
c0102066:	e8 c0 91 00 00       	call   c010b22b <Memset>
c010206b:	83 c4 10             	add    $0x10,%esp
c010206e:	83 ec 04             	sub    $0x4,%esp
c0102071:	8d 45 98             	lea    -0x68(%ebp),%eax
c0102074:	50                   	push   %eax
c0102075:	ff 75 08             	pushl  0x8(%ebp)
c0102078:	8d 45 c0             	lea    -0x40(%ebp),%eax
c010207b:	50                   	push   %eax
c010207c:	e8 f3 00 00 00       	call   c0102174 <strip_path>
c0102081:	83 c4 10             	add    $0x10,%esp
c0102084:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0102087:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%ebp)
c010208b:	75 0a                	jne    c0102097 <search_file+0x55>
c010208d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102092:	e9 db 00 00 00       	jmp    c0102172 <search_file+0x130>
c0102097:	8b 45 9c             	mov    -0x64(%ebp),%eax
c010209a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010209d:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01020a0:	05 00 02 00 00       	add    $0x200,%eax
c01020a5:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c01020ab:	85 c0                	test   %eax,%eax
c01020ad:	0f 48 c2             	cmovs  %edx,%eax
c01020b0:	c1 f8 09             	sar    $0x9,%eax
c01020b3:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01020b6:	8b 45 9c             	mov    -0x64(%ebp),%eax
c01020b9:	c1 e8 04             	shr    $0x4,%eax
c01020bc:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01020bf:	e8 5c 14 00 00       	call   c0103520 <get_super_block>
c01020c4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01020c7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01020ca:	8b 00                	mov    (%eax),%eax
c01020cc:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01020cf:	c7 45 cc 20 00 00 00 	movl   $0x20,-0x34(%ebp)
c01020d6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01020dd:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01020e4:	eb 7b                	jmp    c0102161 <search_file+0x11f>
c01020e6:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01020eb:	89 c1                	mov    %eax,%ecx
c01020ed:	8b 55 d0             	mov    -0x30(%ebp),%edx
c01020f0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01020f3:	01 d0                	add    %edx,%eax
c01020f5:	83 ec 0c             	sub    $0xc,%esp
c01020f8:	6a 07                	push   $0x7
c01020fa:	68 00 02 00 00       	push   $0x200
c01020ff:	51                   	push   %ecx
c0102100:	ff 75 cc             	pushl  -0x34(%ebp)
c0102103:	50                   	push   %eax
c0102104:	e8 5b f6 ff ff       	call   c0101764 <rd_wt>
c0102109:	83 c4 20             	add    $0x20,%esp
c010210c:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0102111:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102114:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010211b:	eb 35                	jmp    c0102152 <search_file+0x110>
c010211d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0102121:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102124:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0102127:	7f 33                	jg     c010215c <search_file+0x11a>
c0102129:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010212c:	83 c0 04             	add    $0x4,%eax
c010212f:	83 ec 08             	sub    $0x8,%esp
c0102132:	50                   	push   %eax
c0102133:	8d 45 c0             	lea    -0x40(%ebp),%eax
c0102136:	50                   	push   %eax
c0102137:	e8 49 74 00 00       	call   c0109585 <strcmp>
c010213c:	83 c4 10             	add    $0x10,%esp
c010213f:	85 c0                	test   %eax,%eax
c0102141:	75 07                	jne    c010214a <search_file+0x108>
c0102143:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102146:	8b 00                	mov    (%eax),%eax
c0102148:	eb 28                	jmp    c0102172 <search_file+0x130>
c010214a:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c010214e:	83 45 ec 10          	addl   $0x10,-0x14(%ebp)
c0102152:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102155:	83 f8 1f             	cmp    $0x1f,%eax
c0102158:	76 c3                	jbe    c010211d <search_file+0xdb>
c010215a:	eb 01                	jmp    c010215d <search_file+0x11b>
c010215c:	90                   	nop
c010215d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0102161:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102164:	3b 45 dc             	cmp    -0x24(%ebp),%eax
c0102167:	0f 8c 79 ff ff ff    	jl     c01020e6 <search_file+0xa4>
c010216d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102172:	c9                   	leave  
c0102173:	c3                   	ret    

c0102174 <strip_path>:
c0102174:	55                   	push   %ebp
c0102175:	89 e5                	mov    %esp,%ebp
c0102177:	83 ec 10             	sub    $0x10,%esp
c010217a:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010217e:	75 0a                	jne    c010218a <strip_path+0x16>
c0102180:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102185:	e9 b4 00 00 00       	jmp    c010223e <strip_path+0xca>
c010218a:	8b 45 08             	mov    0x8(%ebp),%eax
c010218d:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0102190:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102193:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0102196:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102199:	0f b6 00             	movzbl (%eax),%eax
c010219c:	3c 2f                	cmp    $0x2f,%al
c010219e:	75 2d                	jne    c01021cd <strip_path+0x59>
c01021a0:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c01021a4:	eb 27                	jmp    c01021cd <strip_path+0x59>
c01021a6:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01021a9:	0f b6 00             	movzbl (%eax),%eax
c01021ac:	3c 2f                	cmp    $0x2f,%al
c01021ae:	75 0a                	jne    c01021ba <strip_path+0x46>
c01021b0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01021b5:	e9 84 00 00 00       	jmp    c010223e <strip_path+0xca>
c01021ba:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01021bd:	0f b6 10             	movzbl (%eax),%edx
c01021c0:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01021c3:	88 10                	mov    %dl,(%eax)
c01021c5:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c01021c9:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c01021cd:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01021d0:	0f b6 00             	movzbl (%eax),%eax
c01021d3:	84 c0                	test   %al,%al
c01021d5:	75 cf                	jne    c01021a6 <strip_path+0x32>
c01021d7:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01021da:	c6 00 00             	movb   $0x0,(%eax)
c01021dd:	8b 45 10             	mov    0x10(%ebp),%eax
c01021e0:	8b 15 c0 21 11 c0    	mov    0xc01121c0,%edx
c01021e6:	89 10                	mov    %edx,(%eax)
c01021e8:	8b 15 c4 21 11 c0    	mov    0xc01121c4,%edx
c01021ee:	89 50 04             	mov    %edx,0x4(%eax)
c01021f1:	8b 15 c8 21 11 c0    	mov    0xc01121c8,%edx
c01021f7:	89 50 08             	mov    %edx,0x8(%eax)
c01021fa:	8b 15 cc 21 11 c0    	mov    0xc01121cc,%edx
c0102200:	89 50 0c             	mov    %edx,0xc(%eax)
c0102203:	8b 15 d0 21 11 c0    	mov    0xc01121d0,%edx
c0102209:	89 50 10             	mov    %edx,0x10(%eax)
c010220c:	8b 15 d4 21 11 c0    	mov    0xc01121d4,%edx
c0102212:	89 50 14             	mov    %edx,0x14(%eax)
c0102215:	8b 15 d8 21 11 c0    	mov    0xc01121d8,%edx
c010221b:	89 50 18             	mov    %edx,0x18(%eax)
c010221e:	8b 15 dc 21 11 c0    	mov    0xc01121dc,%edx
c0102224:	89 50 1c             	mov    %edx,0x1c(%eax)
c0102227:	8b 15 e0 21 11 c0    	mov    0xc01121e0,%edx
c010222d:	89 50 20             	mov    %edx,0x20(%eax)
c0102230:	8b 15 e4 21 11 c0    	mov    0xc01121e4,%edx
c0102236:	89 50 24             	mov    %edx,0x24(%eax)
c0102239:	b8 00 00 00 00       	mov    $0x0,%eax
c010223e:	c9                   	leave  
c010223f:	c3                   	ret    

c0102240 <get_inode>:
c0102240:	55                   	push   %ebp
c0102241:	89 e5                	mov    %esp,%ebp
c0102243:	56                   	push   %esi
c0102244:	53                   	push   %ebx
c0102245:	83 ec 20             	sub    $0x20,%esp
c0102248:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010224c:	75 0a                	jne    c0102258 <get_inode+0x18>
c010224e:	b8 00 00 00 00       	mov    $0x0,%eax
c0102253:	e9 a3 01 00 00       	jmp    c01023fb <get_inode+0x1bb>
c0102258:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010225f:	c7 45 f0 a0 17 11 c0 	movl   $0xc01117a0,-0x10(%ebp)
c0102266:	eb 69                	jmp    c01022d1 <get_inode+0x91>
c0102268:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010226b:	8b 40 24             	mov    0x24(%eax),%eax
c010226e:	85 c0                	test   %eax,%eax
c0102270:	7e 53                	jle    c01022c5 <get_inode+0x85>
c0102272:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102275:	8b 40 10             	mov    0x10(%eax),%eax
c0102278:	39 45 0c             	cmp    %eax,0xc(%ebp)
c010227b:	75 50                	jne    c01022cd <get_inode+0x8d>
c010227d:	8b 45 08             	mov    0x8(%ebp),%eax
c0102280:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0102283:	8b 0a                	mov    (%edx),%ecx
c0102285:	89 08                	mov    %ecx,(%eax)
c0102287:	8b 4a 04             	mov    0x4(%edx),%ecx
c010228a:	89 48 04             	mov    %ecx,0x4(%eax)
c010228d:	8b 4a 08             	mov    0x8(%edx),%ecx
c0102290:	89 48 08             	mov    %ecx,0x8(%eax)
c0102293:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0102296:	89 48 0c             	mov    %ecx,0xc(%eax)
c0102299:	8b 4a 10             	mov    0x10(%edx),%ecx
c010229c:	89 48 10             	mov    %ecx,0x10(%eax)
c010229f:	8b 4a 14             	mov    0x14(%edx),%ecx
c01022a2:	89 48 14             	mov    %ecx,0x14(%eax)
c01022a5:	8b 4a 18             	mov    0x18(%edx),%ecx
c01022a8:	89 48 18             	mov    %ecx,0x18(%eax)
c01022ab:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c01022ae:	89 48 1c             	mov    %ecx,0x1c(%eax)
c01022b1:	8b 4a 20             	mov    0x20(%edx),%ecx
c01022b4:	89 48 20             	mov    %ecx,0x20(%eax)
c01022b7:	8b 52 24             	mov    0x24(%edx),%edx
c01022ba:	89 50 24             	mov    %edx,0x24(%eax)
c01022bd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01022c0:	e9 36 01 00 00       	jmp    c01023fb <get_inode+0x1bb>
c01022c5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01022c8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01022cb:	eb 0d                	jmp    c01022da <get_inode+0x9a>
c01022cd:	83 45 f0 28          	addl   $0x28,-0x10(%ebp)
c01022d1:	81 7d f0 a0 21 11 c0 	cmpl   $0xc01121a0,-0x10(%ebp)
c01022d8:	76 8e                	jbe    c0102268 <get_inode+0x28>
c01022da:	e8 41 12 00 00       	call   c0103520 <get_super_block>
c01022df:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01022e2:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c01022e9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01022ec:	8b 40 04             	mov    0x4(%eax),%eax
c01022ef:	8d 50 02             	lea    0x2(%eax),%edx
c01022f2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01022f5:	8b 40 08             	mov    0x8(%eax),%eax
c01022f8:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c01022fb:	8b 45 0c             	mov    0xc(%ebp),%eax
c01022fe:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0102301:	b8 00 02 00 00       	mov    $0x200,%eax
c0102306:	99                   	cltd   
c0102307:	f7 7d e8             	idivl  -0x18(%ebp)
c010230a:	89 c6                	mov    %eax,%esi
c010230c:	89 c8                	mov    %ecx,%eax
c010230e:	99                   	cltd   
c010230f:	f7 fe                	idiv   %esi
c0102311:	01 d8                	add    %ebx,%eax
c0102313:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0102316:	c7 45 e0 20 00 00 00 	movl   $0x20,-0x20(%ebp)
c010231d:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102322:	83 ec 0c             	sub    $0xc,%esp
c0102325:	6a 07                	push   $0x7
c0102327:	68 00 02 00 00       	push   $0x200
c010232c:	50                   	push   %eax
c010232d:	ff 75 e0             	pushl  -0x20(%ebp)
c0102330:	ff 75 e4             	pushl  -0x1c(%ebp)
c0102333:	e8 2c f4 ff ff       	call   c0101764 <rd_wt>
c0102338:	83 c4 20             	add    $0x20,%esp
c010233b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010233e:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0102341:	b8 00 02 00 00       	mov    $0x200,%eax
c0102346:	99                   	cltd   
c0102347:	f7 7d e8             	idivl  -0x18(%ebp)
c010234a:	89 c3                	mov    %eax,%ebx
c010234c:	89 c8                	mov    %ecx,%eax
c010234e:	99                   	cltd   
c010234f:	f7 fb                	idiv   %ebx
c0102351:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0102354:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c010235a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010235d:	0f af 45 dc          	imul   -0x24(%ebp),%eax
c0102361:	01 d0                	add    %edx,%eax
c0102363:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0102366:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102369:	8b 55 d8             	mov    -0x28(%ebp),%edx
c010236c:	8b 0a                	mov    (%edx),%ecx
c010236e:	89 08                	mov    %ecx,(%eax)
c0102370:	8b 4a 04             	mov    0x4(%edx),%ecx
c0102373:	89 48 04             	mov    %ecx,0x4(%eax)
c0102376:	8b 4a 08             	mov    0x8(%edx),%ecx
c0102379:	89 48 08             	mov    %ecx,0x8(%eax)
c010237c:	8b 4a 0c             	mov    0xc(%edx),%ecx
c010237f:	89 48 0c             	mov    %ecx,0xc(%eax)
c0102382:	8b 4a 10             	mov    0x10(%edx),%ecx
c0102385:	89 48 10             	mov    %ecx,0x10(%eax)
c0102388:	8b 4a 14             	mov    0x14(%edx),%ecx
c010238b:	89 48 14             	mov    %ecx,0x14(%eax)
c010238e:	8b 4a 18             	mov    0x18(%edx),%ecx
c0102391:	89 48 18             	mov    %ecx,0x18(%eax)
c0102394:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0102397:	89 48 1c             	mov    %ecx,0x1c(%eax)
c010239a:	8b 4a 20             	mov    0x20(%edx),%ecx
c010239d:	89 48 20             	mov    %ecx,0x20(%eax)
c01023a0:	8b 52 24             	mov    0x24(%edx),%edx
c01023a3:	89 50 24             	mov    %edx,0x24(%eax)
c01023a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01023a9:	8b 55 0c             	mov    0xc(%ebp),%edx
c01023ac:	89 50 10             	mov    %edx,0x10(%eax)
c01023af:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01023b2:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01023b5:	89 50 20             	mov    %edx,0x20(%eax)
c01023b8:	8b 45 08             	mov    0x8(%ebp),%eax
c01023bb:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01023be:	8b 0a                	mov    (%edx),%ecx
c01023c0:	89 08                	mov    %ecx,(%eax)
c01023c2:	8b 4a 04             	mov    0x4(%edx),%ecx
c01023c5:	89 48 04             	mov    %ecx,0x4(%eax)
c01023c8:	8b 4a 08             	mov    0x8(%edx),%ecx
c01023cb:	89 48 08             	mov    %ecx,0x8(%eax)
c01023ce:	8b 4a 0c             	mov    0xc(%edx),%ecx
c01023d1:	89 48 0c             	mov    %ecx,0xc(%eax)
c01023d4:	8b 4a 10             	mov    0x10(%edx),%ecx
c01023d7:	89 48 10             	mov    %ecx,0x10(%eax)
c01023da:	8b 4a 14             	mov    0x14(%edx),%ecx
c01023dd:	89 48 14             	mov    %ecx,0x14(%eax)
c01023e0:	8b 4a 18             	mov    0x18(%edx),%ecx
c01023e3:	89 48 18             	mov    %ecx,0x18(%eax)
c01023e6:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c01023e9:	89 48 1c             	mov    %ecx,0x1c(%eax)
c01023ec:	8b 4a 20             	mov    0x20(%edx),%ecx
c01023ef:	89 48 20             	mov    %ecx,0x20(%eax)
c01023f2:	8b 52 24             	mov    0x24(%edx),%edx
c01023f5:	89 50 24             	mov    %edx,0x24(%eax)
c01023f8:	8b 45 08             	mov    0x8(%ebp),%eax
c01023fb:	8d 65 f8             	lea    -0x8(%ebp),%esp
c01023fe:	5b                   	pop    %ebx
c01023ff:	5e                   	pop    %esi
c0102400:	5d                   	pop    %ebp
c0102401:	c3                   	ret    

c0102402 <create_file>:
c0102402:	55                   	push   %ebp
c0102403:	89 e5                	mov    %esp,%ebp
c0102405:	81 ec 98 00 00 00    	sub    $0x98,%esp
c010240b:	8d 45 b8             	lea    -0x48(%ebp),%eax
c010240e:	50                   	push   %eax
c010240f:	ff 75 0c             	pushl  0xc(%ebp)
c0102412:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0102415:	50                   	push   %eax
c0102416:	e8 59 fd ff ff       	call   c0102174 <strip_path>
c010241b:	83 c4 0c             	add    $0xc,%esp
c010241e:	83 f8 ff             	cmp    $0xffffffff,%eax
c0102421:	75 0a                	jne    c010242d <create_file+0x2b>
c0102423:	b8 00 00 00 00       	mov    $0x0,%eax
c0102428:	e9 de 00 00 00       	jmp    c010250b <create_file+0x109>
c010242d:	e8 db 00 00 00       	call   c010250d <alloc_imap_bit>
c0102432:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102435:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102439:	75 0a                	jne    c0102445 <create_file+0x43>
c010243b:	b8 00 00 00 00       	mov    $0x0,%eax
c0102440:	e9 c6 00 00 00       	jmp    c010250b <create_file+0x109>
c0102445:	e8 d6 10 00 00       	call   c0103520 <get_super_block>
c010244a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010244d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102450:	8b 40 10             	mov    0x10(%eax),%eax
c0102453:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102456:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102459:	83 ec 08             	sub    $0x8,%esp
c010245c:	50                   	push   %eax
c010245d:	ff 75 f4             	pushl  -0xc(%ebp)
c0102460:	e8 a5 01 00 00       	call   c010260a <alloc_smap_bit>
c0102465:	83 c4 10             	add    $0x10,%esp
c0102468:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010246b:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c010246f:	75 0a                	jne    c010247b <create_file+0x79>
c0102471:	b8 00 00 00 00       	mov    $0x0,%eax
c0102476:	e9 90 00 00 00       	jmp    c010250b <create_file+0x109>
c010247b:	83 ec 04             	sub    $0x4,%esp
c010247e:	ff 75 e8             	pushl  -0x18(%ebp)
c0102481:	ff 75 f4             	pushl  -0xc(%ebp)
c0102484:	8d 45 84             	lea    -0x7c(%ebp),%eax
c0102487:	50                   	push   %eax
c0102488:	e8 1e 03 00 00       	call   c01027ab <new_inode>
c010248d:	83 c4 10             	add    $0x10,%esp
c0102490:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0102493:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0102497:	75 07                	jne    c01024a0 <create_file+0x9e>
c0102499:	b8 00 00 00 00       	mov    $0x0,%eax
c010249e:	eb 6b                	jmp    c010250b <create_file+0x109>
c01024a0:	ff 75 f4             	pushl  -0xc(%ebp)
c01024a3:	8d 45 ac             	lea    -0x54(%ebp),%eax
c01024a6:	50                   	push   %eax
c01024a7:	8d 45 b8             	lea    -0x48(%ebp),%eax
c01024aa:	50                   	push   %eax
c01024ab:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01024b1:	50                   	push   %eax
c01024b2:	e8 12 04 00 00       	call   c01028c9 <new_dir_entry>
c01024b7:	83 c4 10             	add    $0x10,%esp
c01024ba:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01024bd:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c01024c1:	75 07                	jne    c01024ca <create_file+0xc8>
c01024c3:	b8 00 00 00 00       	mov    $0x0,%eax
c01024c8:	eb 41                	jmp    c010250b <create_file+0x109>
c01024ca:	8b 45 08             	mov    0x8(%ebp),%eax
c01024cd:	8b 55 84             	mov    -0x7c(%ebp),%edx
c01024d0:	89 10                	mov    %edx,(%eax)
c01024d2:	8b 55 88             	mov    -0x78(%ebp),%edx
c01024d5:	89 50 04             	mov    %edx,0x4(%eax)
c01024d8:	8b 55 8c             	mov    -0x74(%ebp),%edx
c01024db:	89 50 08             	mov    %edx,0x8(%eax)
c01024de:	8b 55 90             	mov    -0x70(%ebp),%edx
c01024e1:	89 50 0c             	mov    %edx,0xc(%eax)
c01024e4:	8b 55 94             	mov    -0x6c(%ebp),%edx
c01024e7:	89 50 10             	mov    %edx,0x10(%eax)
c01024ea:	8b 55 98             	mov    -0x68(%ebp),%edx
c01024ed:	89 50 14             	mov    %edx,0x14(%eax)
c01024f0:	8b 55 9c             	mov    -0x64(%ebp),%edx
c01024f3:	89 50 18             	mov    %edx,0x18(%eax)
c01024f6:	8b 55 a0             	mov    -0x60(%ebp),%edx
c01024f9:	89 50 1c             	mov    %edx,0x1c(%eax)
c01024fc:	8b 55 a4             	mov    -0x5c(%ebp),%edx
c01024ff:	89 50 20             	mov    %edx,0x20(%eax)
c0102502:	8b 55 a8             	mov    -0x58(%ebp),%edx
c0102505:	89 50 24             	mov    %edx,0x24(%eax)
c0102508:	8b 45 08             	mov    0x8(%ebp),%eax
c010250b:	c9                   	leave  
c010250c:	c3                   	ret    

c010250d <alloc_imap_bit>:
c010250d:	55                   	push   %ebp
c010250e:	89 e5                	mov    %esp,%ebp
c0102510:	53                   	push   %ebx
c0102511:	83 ec 24             	sub    $0x24,%esp
c0102514:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c010251b:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c0102522:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102527:	83 ec 0c             	sub    $0xc,%esp
c010252a:	6a 07                	push   $0x7
c010252c:	68 00 02 00 00       	push   $0x200
c0102531:	50                   	push   %eax
c0102532:	ff 75 e8             	pushl  -0x18(%ebp)
c0102535:	ff 75 ec             	pushl  -0x14(%ebp)
c0102538:	e8 27 f2 ff ff       	call   c0101764 <rd_wt>
c010253d:	83 c4 20             	add    $0x20,%esp
c0102540:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0102547:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010254e:	e9 a5 00 00 00       	jmp    c01025f8 <alloc_imap_bit+0xeb>
c0102553:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c010255a:	e9 8b 00 00 00       	jmp    c01025ea <alloc_imap_bit+0xdd>
c010255f:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102565:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102568:	01 d0                	add    %edx,%eax
c010256a:	0f b6 00             	movzbl (%eax),%eax
c010256d:	0f be d0             	movsbl %al,%edx
c0102570:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102573:	89 c1                	mov    %eax,%ecx
c0102575:	d3 fa                	sar    %cl,%edx
c0102577:	89 d0                	mov    %edx,%eax
c0102579:	83 e0 01             	and    $0x1,%eax
c010257c:	85 c0                	test   %eax,%eax
c010257e:	74 06                	je     c0102586 <alloc_imap_bit+0x79>
c0102580:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0102584:	eb 64                	jmp    c01025ea <alloc_imap_bit+0xdd>
c0102586:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c010258c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010258f:	01 d0                	add    %edx,%eax
c0102591:	0f b6 18             	movzbl (%eax),%ebx
c0102594:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102597:	ba 01 00 00 00       	mov    $0x1,%edx
c010259c:	89 c1                	mov    %eax,%ecx
c010259e:	d3 e2                	shl    %cl,%edx
c01025a0:	89 d0                	mov    %edx,%eax
c01025a2:	89 c1                	mov    %eax,%ecx
c01025a4:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01025aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01025ad:	01 d0                	add    %edx,%eax
c01025af:	09 cb                	or     %ecx,%ebx
c01025b1:	89 da                	mov    %ebx,%edx
c01025b3:	88 10                	mov    %dl,(%eax)
c01025b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01025b8:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c01025bf:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01025c2:	01 d0                	add    %edx,%eax
c01025c4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01025c7:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01025cc:	83 ec 0c             	sub    $0xc,%esp
c01025cf:	6a 0a                	push   $0xa
c01025d1:	68 00 02 00 00       	push   $0x200
c01025d6:	50                   	push   %eax
c01025d7:	ff 75 e8             	pushl  -0x18(%ebp)
c01025da:	ff 75 ec             	pushl  -0x14(%ebp)
c01025dd:	e8 82 f1 ff ff       	call   c0101764 <rd_wt>
c01025e2:	83 c4 20             	add    $0x20,%esp
c01025e5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01025e8:	eb 1b                	jmp    c0102605 <alloc_imap_bit+0xf8>
c01025ea:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
c01025ee:	0f 8e 6b ff ff ff    	jle    c010255f <alloc_imap_bit+0x52>
c01025f4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01025f8:	81 7d f4 ff 01 00 00 	cmpl   $0x1ff,-0xc(%ebp)
c01025ff:	0f 8e 4e ff ff ff    	jle    c0102553 <alloc_imap_bit+0x46>
c0102605:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0102608:	c9                   	leave  
c0102609:	c3                   	ret    

c010260a <alloc_smap_bit>:
c010260a:	55                   	push   %ebp
c010260b:	89 e5                	mov    %esp,%ebp
c010260d:	53                   	push   %ebx
c010260e:	83 ec 34             	sub    $0x34,%esp
c0102611:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102615:	75 1c                	jne    c0102633 <alloc_smap_bit+0x29>
c0102617:	68 fc 02 00 00       	push   $0x2fc
c010261c:	68 a4 a4 10 c0       	push   $0xc010a4a4
c0102621:	68 a4 a4 10 c0       	push   $0xc010a4a4
c0102626:	68 b4 a5 10 c0       	push   $0xc010a5b4
c010262b:	e8 7e 5f 00 00       	call   c01085ae <assertion_failure>
c0102630:	83 c4 10             	add    $0x10,%esp
c0102633:	e8 e8 0e 00 00       	call   c0103520 <get_super_block>
c0102638:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010263b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010263e:	8b 40 08             	mov    0x8(%eax),%eax
c0102641:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0102644:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102647:	8b 40 04             	mov    0x4(%eax),%eax
c010264a:	83 c0 02             	add    $0x2,%eax
c010264d:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0102650:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0102657:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c010265e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102665:	e9 20 01 00 00       	jmp    c010278a <alloc_smap_bit+0x180>
c010266a:	8b 55 dc             	mov    -0x24(%ebp),%edx
c010266d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102670:	01 d0                	add    %edx,%eax
c0102672:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0102675:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010267a:	83 ec 0c             	sub    $0xc,%esp
c010267d:	6a 07                	push   $0x7
c010267f:	68 00 02 00 00       	push   $0x200
c0102684:	50                   	push   %eax
c0102685:	ff 75 d8             	pushl  -0x28(%ebp)
c0102688:	ff 75 d4             	pushl  -0x2c(%ebp)
c010268b:	e8 d4 f0 ff ff       	call   c0101764 <rd_wt>
c0102690:	83 c4 20             	add    $0x20,%esp
c0102693:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c010269a:	e9 b0 00 00 00       	jmp    c010274f <alloc_smap_bit+0x145>
c010269f:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01026a6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01026aa:	0f 85 8c 00 00 00    	jne    c010273c <alloc_smap_bit+0x132>
c01026b0:	eb 45                	jmp    c01026f7 <alloc_smap_bit+0xed>
c01026b2:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01026b8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01026bb:	01 d0                	add    %edx,%eax
c01026bd:	0f b6 00             	movzbl (%eax),%eax
c01026c0:	0f be d0             	movsbl %al,%edx
c01026c3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01026c6:	89 c1                	mov    %eax,%ecx
c01026c8:	d3 fa                	sar    %cl,%edx
c01026ca:	89 d0                	mov    %edx,%eax
c01026cc:	83 e0 01             	and    $0x1,%eax
c01026cf:	85 c0                	test   %eax,%eax
c01026d1:	74 06                	je     c01026d9 <alloc_smap_bit+0xcf>
c01026d3:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c01026d7:	eb 1e                	jmp    c01026f7 <alloc_smap_bit+0xed>
c01026d9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01026dc:	c1 e0 09             	shl    $0x9,%eax
c01026df:	89 c2                	mov    %eax,%edx
c01026e1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01026e4:	01 d0                	add    %edx,%eax
c01026e6:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c01026ed:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01026f0:	01 d0                	add    %edx,%eax
c01026f2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01026f5:	eb 06                	jmp    c01026fd <alloc_smap_bit+0xf3>
c01026f7:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c01026fb:	7e b5                	jle    c01026b2 <alloc_smap_bit+0xa8>
c01026fd:	eb 3d                	jmp    c010273c <alloc_smap_bit+0x132>
c01026ff:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102703:	74 45                	je     c010274a <alloc_smap_bit+0x140>
c0102705:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c010270b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010270e:	01 d0                	add    %edx,%eax
c0102710:	0f b6 18             	movzbl (%eax),%ebx
c0102713:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102716:	ba 01 00 00 00       	mov    $0x1,%edx
c010271b:	89 c1                	mov    %eax,%ecx
c010271d:	d3 e2                	shl    %cl,%edx
c010271f:	89 d0                	mov    %edx,%eax
c0102721:	89 c1                	mov    %eax,%ecx
c0102723:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102729:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010272c:	01 d0                	add    %edx,%eax
c010272e:	09 cb                	or     %ecx,%ebx
c0102730:	89 da                	mov    %ebx,%edx
c0102732:	88 10                	mov    %dl,(%eax)
c0102734:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0102738:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c010273c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102740:	74 09                	je     c010274b <alloc_smap_bit+0x141>
c0102742:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0102746:	7e b7                	jle    c01026ff <alloc_smap_bit+0xf5>
c0102748:	eb 01                	jmp    c010274b <alloc_smap_bit+0x141>
c010274a:	90                   	nop
c010274b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c010274f:	81 7d ec ff 01 00 00 	cmpl   $0x1ff,-0x14(%ebp)
c0102756:	0f 8e 43 ff ff ff    	jle    c010269f <alloc_smap_bit+0x95>
c010275c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102760:	74 1e                	je     c0102780 <alloc_smap_bit+0x176>
c0102762:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102767:	83 ec 0c             	sub    $0xc,%esp
c010276a:	6a 0a                	push   $0xa
c010276c:	68 00 02 00 00       	push   $0x200
c0102771:	50                   	push   %eax
c0102772:	ff 75 d8             	pushl  -0x28(%ebp)
c0102775:	ff 75 d4             	pushl  -0x2c(%ebp)
c0102778:	e8 e7 ef ff ff       	call   c0101764 <rd_wt>
c010277d:	83 c4 20             	add    $0x20,%esp
c0102780:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102784:	74 12                	je     c0102798 <alloc_smap_bit+0x18e>
c0102786:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c010278a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010278d:	3b 45 e0             	cmp    -0x20(%ebp),%eax
c0102790:	0f 8c d4 fe ff ff    	jl     c010266a <alloc_smap_bit+0x60>
c0102796:	eb 01                	jmp    c0102799 <alloc_smap_bit+0x18f>
c0102798:	90                   	nop
c0102799:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010279c:	8d 50 ff             	lea    -0x1(%eax),%edx
c010279f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01027a2:	8b 00                	mov    (%eax),%eax
c01027a4:	01 d0                	add    %edx,%eax
c01027a6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01027a9:	c9                   	leave  
c01027aa:	c3                   	ret    

c01027ab <new_inode>:
c01027ab:	55                   	push   %ebp
c01027ac:	89 e5                	mov    %esp,%ebp
c01027ae:	83 ec 38             	sub    $0x38,%esp
c01027b1:	83 ec 08             	sub    $0x8,%esp
c01027b4:	ff 75 0c             	pushl  0xc(%ebp)
c01027b7:	8d 45 c8             	lea    -0x38(%ebp),%eax
c01027ba:	50                   	push   %eax
c01027bb:	e8 80 fa ff ff       	call   c0102240 <get_inode>
c01027c0:	83 c4 10             	add    $0x10,%esp
c01027c3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01027c6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c01027ca:	75 0a                	jne    c01027d6 <new_inode+0x2b>
c01027cc:	b8 00 00 00 00       	mov    $0x0,%eax
c01027d1:	e9 f1 00 00 00       	jmp    c01028c7 <new_inode+0x11c>
c01027d6:	8b 45 10             	mov    0x10(%ebp),%eax
c01027d9:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01027dc:	c7 45 d4 00 08 00 00 	movl   $0x800,-0x2c(%ebp)
c01027e3:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c01027ea:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
c01027f1:	8b 45 0c             	mov    0xc(%ebp),%eax
c01027f4:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01027f7:	83 ec 0c             	sub    $0xc,%esp
c01027fa:	8d 45 c8             	lea    -0x38(%ebp),%eax
c01027fd:	50                   	push   %eax
c01027fe:	e8 39 0b 00 00       	call   c010333c <sync_inode>
c0102803:	83 c4 10             	add    $0x10,%esp
c0102806:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c010280d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0102814:	eb 1d                	jmp    c0102833 <new_inode+0x88>
c0102816:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102819:	89 d0                	mov    %edx,%eax
c010281b:	c1 e0 02             	shl    $0x2,%eax
c010281e:	01 d0                	add    %edx,%eax
c0102820:	c1 e0 03             	shl    $0x3,%eax
c0102823:	05 b0 17 11 c0       	add    $0xc01117b0,%eax
c0102828:	8b 00                	mov    (%eax),%eax
c010282a:	39 45 0c             	cmp    %eax,0xc(%ebp)
c010282d:	74 0c                	je     c010283b <new_inode+0x90>
c010282f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0102833:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c0102837:	7e dd                	jle    c0102816 <new_inode+0x6b>
c0102839:	eb 01                	jmp    c010283c <new_inode+0x91>
c010283b:	90                   	nop
c010283c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010283f:	89 d0                	mov    %edx,%eax
c0102841:	c1 e0 02             	shl    $0x2,%eax
c0102844:	01 d0                	add    %edx,%eax
c0102846:	c1 e0 03             	shl    $0x3,%eax
c0102849:	05 a0 17 11 c0       	add    $0xc01117a0,%eax
c010284e:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0102851:	89 10                	mov    %edx,(%eax)
c0102853:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102856:	89 50 04             	mov    %edx,0x4(%eax)
c0102859:	8b 55 d0             	mov    -0x30(%ebp),%edx
c010285c:	89 50 08             	mov    %edx,0x8(%eax)
c010285f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0102862:	89 50 0c             	mov    %edx,0xc(%eax)
c0102865:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0102868:	89 50 10             	mov    %edx,0x10(%eax)
c010286b:	8b 55 dc             	mov    -0x24(%ebp),%edx
c010286e:	89 50 14             	mov    %edx,0x14(%eax)
c0102871:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0102874:	89 50 18             	mov    %edx,0x18(%eax)
c0102877:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c010287a:	89 50 1c             	mov    %edx,0x1c(%eax)
c010287d:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0102880:	89 50 20             	mov    %edx,0x20(%eax)
c0102883:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0102886:	89 50 24             	mov    %edx,0x24(%eax)
c0102889:	8b 45 08             	mov    0x8(%ebp),%eax
c010288c:	8b 55 c8             	mov    -0x38(%ebp),%edx
c010288f:	89 10                	mov    %edx,(%eax)
c0102891:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102894:	89 50 04             	mov    %edx,0x4(%eax)
c0102897:	8b 55 d0             	mov    -0x30(%ebp),%edx
c010289a:	89 50 08             	mov    %edx,0x8(%eax)
c010289d:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c01028a0:	89 50 0c             	mov    %edx,0xc(%eax)
c01028a3:	8b 55 d8             	mov    -0x28(%ebp),%edx
c01028a6:	89 50 10             	mov    %edx,0x10(%eax)
c01028a9:	8b 55 dc             	mov    -0x24(%ebp),%edx
c01028ac:	89 50 14             	mov    %edx,0x14(%eax)
c01028af:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01028b2:	89 50 18             	mov    %edx,0x18(%eax)
c01028b5:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01028b8:	89 50 1c             	mov    %edx,0x1c(%eax)
c01028bb:	8b 55 e8             	mov    -0x18(%ebp),%edx
c01028be:	89 50 20             	mov    %edx,0x20(%eax)
c01028c1:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01028c4:	89 50 24             	mov    %edx,0x24(%eax)
c01028c7:	c9                   	leave  
c01028c8:	c3                   	ret    

c01028c9 <new_dir_entry>:
c01028c9:	55                   	push   %ebp
c01028ca:	89 e5                	mov    %esp,%ebp
c01028cc:	83 ec 48             	sub    $0x48,%esp
c01028cf:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
c01028d6:	8b 45 0c             	mov    0xc(%ebp),%eax
c01028d9:	8b 40 04             	mov    0x4(%eax),%eax
c01028dc:	99                   	cltd   
c01028dd:	f7 7d dc             	idivl  -0x24(%ebp)
c01028e0:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01028e3:	8b 45 0c             	mov    0xc(%ebp),%eax
c01028e6:	8b 40 0c             	mov    0xc(%eax),%eax
c01028e9:	99                   	cltd   
c01028ea:	f7 7d dc             	idivl  -0x24(%ebp)
c01028ed:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01028f0:	e8 2b 0c 00 00       	call   c0103520 <get_super_block>
c01028f5:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01028f8:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01028fb:	8b 00                	mov    (%eax),%eax
c01028fd:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0102900:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102903:	8b 40 0c             	mov    0xc(%eax),%eax
c0102906:	05 00 02 00 00       	add    $0x200,%eax
c010290b:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0102911:	85 c0                	test   %eax,%eax
c0102913:	0f 48 c2             	cmovs  %edx,%eax
c0102916:	c1 f8 09             	sar    $0x9,%eax
c0102919:	89 45 c8             	mov    %eax,-0x38(%ebp)
c010291c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0102923:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c010292a:	c7 45 c4 20 00 00 00 	movl   $0x20,-0x3c(%ebp)
c0102931:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0102938:	eb 7f                	jmp    c01029b9 <new_dir_entry+0xf0>
c010293a:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010293f:	89 c1                	mov    %eax,%ecx
c0102941:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102944:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102947:	01 d0                	add    %edx,%eax
c0102949:	83 ec 0c             	sub    $0xc,%esp
c010294c:	6a 07                	push   $0x7
c010294e:	68 00 02 00 00       	push   $0x200
c0102953:	51                   	push   %ecx
c0102954:	ff 75 c4             	pushl  -0x3c(%ebp)
c0102957:	50                   	push   %eax
c0102958:	e8 07 ee ff ff       	call   c0101764 <rd_wt>
c010295d:	83 c4 20             	add    $0x20,%esp
c0102960:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0102965:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0102968:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c010296f:	eb 25                	jmp    c0102996 <new_dir_entry+0xcd>
c0102971:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0102975:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102978:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c010297b:	7f 29                	jg     c01029a6 <new_dir_entry+0xdd>
c010297d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102980:	8b 00                	mov    (%eax),%eax
c0102982:	85 c0                	test   %eax,%eax
c0102984:	75 08                	jne    c010298e <new_dir_entry+0xc5>
c0102986:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102989:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010298c:	eb 19                	jmp    c01029a7 <new_dir_entry+0xde>
c010298e:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0102992:	83 45 f0 10          	addl   $0x10,-0x10(%ebp)
c0102996:	b8 00 02 00 00       	mov    $0x200,%eax
c010299b:	99                   	cltd   
c010299c:	f7 7d dc             	idivl  -0x24(%ebp)
c010299f:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c01029a2:	7c cd                	jl     c0102971 <new_dir_entry+0xa8>
c01029a4:	eb 01                	jmp    c01029a7 <new_dir_entry+0xde>
c01029a6:	90                   	nop
c01029a7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01029aa:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c01029ad:	7f 16                	jg     c01029c5 <new_dir_entry+0xfc>
c01029af:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01029b3:	75 10                	jne    c01029c5 <new_dir_entry+0xfc>
c01029b5:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c01029b9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01029bc:	3b 45 c8             	cmp    -0x38(%ebp),%eax
c01029bf:	0f 8c 75 ff ff ff    	jl     c010293a <new_dir_entry+0x71>
c01029c5:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01029c8:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
c01029cb:	75 0a                	jne    c01029d7 <new_dir_entry+0x10e>
c01029cd:	b8 00 00 00 00       	mov    $0x0,%eax
c01029d2:	e9 fc 00 00 00       	jmp    c0102ad3 <new_dir_entry+0x20a>
c01029d7:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c01029de:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01029e2:	75 1e                	jne    c0102a02 <new_dir_entry+0x139>
c01029e4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01029e7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01029ea:	8b 45 0c             	mov    0xc(%ebp),%eax
c01029ed:	8b 50 04             	mov    0x4(%eax),%edx
c01029f0:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01029f3:	01 c2                	add    %eax,%edx
c01029f5:	8b 45 0c             	mov    0xc(%ebp),%eax
c01029f8:	89 50 04             	mov    %edx,0x4(%eax)
c01029fb:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0102a02:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102a05:	8b 55 14             	mov    0x14(%ebp),%edx
c0102a08:	89 10                	mov    %edx,(%eax)
c0102a0a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102a0d:	83 c0 04             	add    $0x4,%eax
c0102a10:	83 ec 08             	sub    $0x8,%esp
c0102a13:	ff 75 10             	pushl  0x10(%ebp)
c0102a16:	50                   	push   %eax
c0102a17:	e8 2e 88 00 00       	call   c010b24a <Strcpy>
c0102a1c:	83 c4 10             	add    $0x10,%esp
c0102a1f:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a22:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102a25:	8b 0a                	mov    (%edx),%ecx
c0102a27:	89 08                	mov    %ecx,(%eax)
c0102a29:	8b 4a 04             	mov    0x4(%edx),%ecx
c0102a2c:	89 48 04             	mov    %ecx,0x4(%eax)
c0102a2f:	8b 4a 08             	mov    0x8(%edx),%ecx
c0102a32:	89 48 08             	mov    %ecx,0x8(%eax)
c0102a35:	8b 52 0c             	mov    0xc(%edx),%edx
c0102a38:	89 50 0c             	mov    %edx,0xc(%eax)
c0102a3b:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102a40:	89 c1                	mov    %eax,%ecx
c0102a42:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102a45:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102a48:	01 d0                	add    %edx,%eax
c0102a4a:	83 ec 0c             	sub    $0xc,%esp
c0102a4d:	6a 0a                	push   $0xa
c0102a4f:	68 00 02 00 00       	push   $0x200
c0102a54:	51                   	push   %ecx
c0102a55:	ff 75 c4             	pushl  -0x3c(%ebp)
c0102a58:	50                   	push   %eax
c0102a59:	e8 06 ed ff ff       	call   c0101764 <rd_wt>
c0102a5e:	83 c4 20             	add    $0x20,%esp
c0102a61:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0102a65:	74 69                	je     c0102ad0 <new_dir_entry+0x207>
c0102a67:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102a6a:	8b 10                	mov    (%eax),%edx
c0102a6c:	89 15 c0 21 11 c0    	mov    %edx,0xc01121c0
c0102a72:	8b 50 04             	mov    0x4(%eax),%edx
c0102a75:	89 15 c4 21 11 c0    	mov    %edx,0xc01121c4
c0102a7b:	8b 50 08             	mov    0x8(%eax),%edx
c0102a7e:	89 15 c8 21 11 c0    	mov    %edx,0xc01121c8
c0102a84:	8b 50 0c             	mov    0xc(%eax),%edx
c0102a87:	89 15 cc 21 11 c0    	mov    %edx,0xc01121cc
c0102a8d:	8b 50 10             	mov    0x10(%eax),%edx
c0102a90:	89 15 d0 21 11 c0    	mov    %edx,0xc01121d0
c0102a96:	8b 50 14             	mov    0x14(%eax),%edx
c0102a99:	89 15 d4 21 11 c0    	mov    %edx,0xc01121d4
c0102a9f:	8b 50 18             	mov    0x18(%eax),%edx
c0102aa2:	89 15 d8 21 11 c0    	mov    %edx,0xc01121d8
c0102aa8:	8b 50 1c             	mov    0x1c(%eax),%edx
c0102aab:	89 15 dc 21 11 c0    	mov    %edx,0xc01121dc
c0102ab1:	8b 50 20             	mov    0x20(%eax),%edx
c0102ab4:	89 15 e0 21 11 c0    	mov    %edx,0xc01121e0
c0102aba:	8b 40 24             	mov    0x24(%eax),%eax
c0102abd:	a3 e4 21 11 c0       	mov    %eax,0xc01121e4
c0102ac2:	83 ec 0c             	sub    $0xc,%esp
c0102ac5:	ff 75 0c             	pushl  0xc(%ebp)
c0102ac8:	e8 6f 08 00 00       	call   c010333c <sync_inode>
c0102acd:	83 c4 10             	add    $0x10,%esp
c0102ad0:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ad3:	c9                   	leave  
c0102ad4:	c3                   	ret    

c0102ad5 <do_unlink>:
c0102ad5:	55                   	push   %ebp
c0102ad6:	89 e5                	mov    %esp,%ebp
c0102ad8:	53                   	push   %ebx
c0102ad9:	81 ec a4 00 00 00    	sub    $0xa4,%esp
c0102adf:	83 ec 08             	sub    $0x8,%esp
c0102ae2:	ff 75 08             	pushl  0x8(%ebp)
c0102ae5:	68 c9 a5 10 c0       	push   $0xc010a5c9
c0102aea:	e8 96 6a 00 00       	call   c0109585 <strcmp>
c0102aef:	83 c4 10             	add    $0x10,%esp
c0102af2:	85 c0                	test   %eax,%eax
c0102af4:	75 10                	jne    c0102b06 <do_unlink+0x31>
c0102af6:	83 ec 0c             	sub    $0xc,%esp
c0102af9:	68 cb a5 10 c0       	push   $0xc010a5cb
c0102afe:	e8 8d 5a 00 00       	call   c0108590 <panic>
c0102b03:	83 c4 10             	add    $0x10,%esp
c0102b06:	83 ec 0c             	sub    $0xc,%esp
c0102b09:	ff 75 08             	pushl  0x8(%ebp)
c0102b0c:	e8 31 f5 ff ff       	call   c0102042 <search_file>
c0102b11:	83 c4 10             	add    $0x10,%esp
c0102b14:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0102b17:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0102b1b:	75 10                	jne    c0102b2d <do_unlink+0x58>
c0102b1d:	83 ec 0c             	sub    $0xc,%esp
c0102b20:	68 e7 a5 10 c0       	push   $0xc010a5e7
c0102b25:	e8 66 5a 00 00       	call   c0108590 <panic>
c0102b2a:	83 c4 10             	add    $0x10,%esp
c0102b2d:	83 ec 08             	sub    $0x8,%esp
c0102b30:	ff 75 d0             	pushl  -0x30(%ebp)
c0102b33:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0102b39:	50                   	push   %eax
c0102b3a:	e8 01 f7 ff ff       	call   c0102240 <get_inode>
c0102b3f:	83 c4 10             	add    $0x10,%esp
c0102b42:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0102b45:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0102b49:	75 10                	jne    c0102b5b <do_unlink+0x86>
c0102b4b:	83 ec 0c             	sub    $0xc,%esp
c0102b4e:	68 e7 a5 10 c0       	push   $0xc010a5e7
c0102b53:	e8 38 5a 00 00       	call   c0108590 <panic>
c0102b58:	83 c4 10             	add    $0x10,%esp
c0102b5b:	8b 45 88             	mov    -0x78(%ebp),%eax
c0102b5e:	85 c0                	test   %eax,%eax
c0102b60:	7e 10                	jle    c0102b72 <do_unlink+0x9d>
c0102b62:	83 ec 0c             	sub    $0xc,%esp
c0102b65:	68 00 a6 10 c0       	push   $0xc010a600
c0102b6a:	e8 21 5a 00 00       	call   c0108590 <panic>
c0102b6f:	83 c4 10             	add    $0x10,%esp
c0102b72:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0102b78:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0102b7b:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0102b7e:	8d 50 07             	lea    0x7(%eax),%edx
c0102b81:	85 c0                	test   %eax,%eax
c0102b83:	0f 48 c2             	cmovs  %edx,%eax
c0102b86:	c1 f8 03             	sar    $0x3,%eax
c0102b89:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0102b8c:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0102b8f:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0102b95:	85 c0                	test   %eax,%eax
c0102b97:	0f 48 c2             	cmovs  %edx,%eax
c0102b9a:	c1 f8 09             	sar    $0x9,%eax
c0102b9d:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0102ba0:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0102ba3:	99                   	cltd   
c0102ba4:	c1 ea 1d             	shr    $0x1d,%edx
c0102ba7:	01 d0                	add    %edx,%eax
c0102ba9:	83 e0 07             	and    $0x7,%eax
c0102bac:	29 d0                	sub    %edx,%eax
c0102bae:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0102bb1:	c7 45 b8 20 00 00 00 	movl   $0x20,-0x48(%ebp)
c0102bb8:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102bbd:	89 c2                	mov    %eax,%edx
c0102bbf:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0102bc2:	83 c0 02             	add    $0x2,%eax
c0102bc5:	83 ec 0c             	sub    $0xc,%esp
c0102bc8:	6a 07                	push   $0x7
c0102bca:	68 00 02 00 00       	push   $0x200
c0102bcf:	52                   	push   %edx
c0102bd0:	ff 75 b8             	pushl  -0x48(%ebp)
c0102bd3:	50                   	push   %eax
c0102bd4:	e8 8b eb ff ff       	call   c0101764 <rd_wt>
c0102bd9:	83 c4 20             	add    $0x20,%esp
c0102bdc:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102be2:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0102be5:	01 d0                	add    %edx,%eax
c0102be7:	0f b6 10             	movzbl (%eax),%edx
c0102bea:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0102bed:	bb 01 00 00 00       	mov    $0x1,%ebx
c0102bf2:	89 c1                	mov    %eax,%ecx
c0102bf4:	d3 e3                	shl    %cl,%ebx
c0102bf6:	89 d8                	mov    %ebx,%eax
c0102bf8:	f7 d0                	not    %eax
c0102bfa:	89 c3                	mov    %eax,%ebx
c0102bfc:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0102c02:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0102c05:	01 c8                	add    %ecx,%eax
c0102c07:	21 da                	and    %ebx,%edx
c0102c09:	88 10                	mov    %dl,(%eax)
c0102c0b:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102c10:	89 c2                	mov    %eax,%edx
c0102c12:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0102c15:	83 c0 02             	add    $0x2,%eax
c0102c18:	83 ec 0c             	sub    $0xc,%esp
c0102c1b:	6a 0a                	push   $0xa
c0102c1d:	68 00 02 00 00       	push   $0x200
c0102c22:	52                   	push   %edx
c0102c23:	ff 75 b8             	pushl  -0x48(%ebp)
c0102c26:	50                   	push   %eax
c0102c27:	e8 38 eb ff ff       	call   c0101764 <rd_wt>
c0102c2c:	83 c4 20             	add    $0x20,%esp
c0102c2f:	e8 ec 08 00 00       	call   c0103520 <get_super_block>
c0102c34:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0102c37:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0102c3d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0102c40:	8b 00                	mov    (%eax),%eax
c0102c42:	29 c2                	sub    %eax,%edx
c0102c44:	89 d0                	mov    %edx,%eax
c0102c46:	83 c0 01             	add    $0x1,%eax
c0102c49:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0102c4c:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0102c4f:	8d 50 07             	lea    0x7(%eax),%edx
c0102c52:	85 c0                	test   %eax,%eax
c0102c54:	0f 48 c2             	cmovs  %edx,%eax
c0102c57:	c1 f8 03             	sar    $0x3,%eax
c0102c5a:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0102c5d:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0102c60:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0102c66:	85 c0                	test   %eax,%eax
c0102c68:	0f 48 c2             	cmovs  %edx,%eax
c0102c6b:	c1 f8 09             	sar    $0x9,%eax
c0102c6e:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0102c71:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0102c74:	99                   	cltd   
c0102c75:	c1 ea 1d             	shr    $0x1d,%edx
c0102c78:	01 d0                	add    %edx,%eax
c0102c7a:	83 e0 07             	and    $0x7,%eax
c0102c7d:	29 d0                	sub    %edx,%eax
c0102c7f:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0102c82:	b8 08 00 00 00       	mov    $0x8,%eax
c0102c87:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c0102c8a:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0102c8d:	29 c2                	sub    %eax,%edx
c0102c8f:	89 d0                	mov    %edx,%eax
c0102c91:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102c94:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102c97:	8d 50 07             	lea    0x7(%eax),%edx
c0102c9a:	85 c0                	test   %eax,%eax
c0102c9c:	0f 48 c2             	cmovs  %edx,%eax
c0102c9f:	c1 f8 03             	sar    $0x3,%eax
c0102ca2:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0102ca5:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102caa:	89 c1                	mov    %eax,%ecx
c0102cac:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0102caf:	8b 40 04             	mov    0x4(%eax),%eax
c0102cb2:	8d 50 02             	lea    0x2(%eax),%edx
c0102cb5:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0102cb8:	01 d0                	add    %edx,%eax
c0102cba:	83 ec 0c             	sub    $0xc,%esp
c0102cbd:	6a 07                	push   $0x7
c0102cbf:	68 00 02 00 00       	push   $0x200
c0102cc4:	51                   	push   %ecx
c0102cc5:	ff 75 b8             	pushl  -0x48(%ebp)
c0102cc8:	50                   	push   %eax
c0102cc9:	e8 96 ea ff ff       	call   c0101764 <rd_wt>
c0102cce:	83 c4 20             	add    $0x20,%esp
c0102cd1:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102cd7:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0102cda:	01 d0                	add    %edx,%eax
c0102cdc:	0f b6 10             	movzbl (%eax),%edx
c0102cdf:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0102ce2:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0102ce7:	89 c1                	mov    %eax,%ecx
c0102ce9:	d3 e3                	shl    %cl,%ebx
c0102ceb:	89 d8                	mov    %ebx,%eax
c0102ced:	f7 d0                	not    %eax
c0102cef:	89 c3                	mov    %eax,%ebx
c0102cf1:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0102cf7:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0102cfa:	01 c8                	add    %ecx,%eax
c0102cfc:	21 da                	and    %ebx,%edx
c0102cfe:	88 10                	mov    %dl,(%eax)
c0102d00:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0102d07:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0102d0a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102d0d:	eb 6b                	jmp    c0102d7a <do_unlink+0x2a5>
c0102d0f:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0102d16:	75 4c                	jne    c0102d64 <do_unlink+0x28f>
c0102d18:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102d1f:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102d24:	83 ec 0c             	sub    $0xc,%esp
c0102d27:	6a 0a                	push   $0xa
c0102d29:	68 00 02 00 00       	push   $0x200
c0102d2e:	50                   	push   %eax
c0102d2f:	ff 75 b8             	pushl  -0x48(%ebp)
c0102d32:	ff 75 ec             	pushl  -0x14(%ebp)
c0102d35:	e8 2a ea ff ff       	call   c0101764 <rd_wt>
c0102d3a:	83 c4 20             	add    $0x20,%esp
c0102d3d:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102d42:	89 c1                	mov    %eax,%ecx
c0102d44:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102d47:	8d 50 01             	lea    0x1(%eax),%edx
c0102d4a:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0102d4d:	83 ec 0c             	sub    $0xc,%esp
c0102d50:	6a 07                	push   $0x7
c0102d52:	68 00 02 00 00       	push   $0x200
c0102d57:	51                   	push   %ecx
c0102d58:	ff 75 b8             	pushl  -0x48(%ebp)
c0102d5b:	50                   	push   %eax
c0102d5c:	e8 03 ea ff ff       	call   c0101764 <rd_wt>
c0102d61:	83 c4 20             	add    $0x20,%esp
c0102d64:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102d6a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102d6d:	01 d0                	add    %edx,%eax
c0102d6f:	c6 00 00             	movb   $0x0,(%eax)
c0102d72:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0102d76:	83 6d f4 08          	subl   $0x8,-0xc(%ebp)
c0102d7a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102d7d:	3b 45 a0             	cmp    -0x60(%ebp),%eax
c0102d80:	7c 8d                	jl     c0102d0f <do_unlink+0x23a>
c0102d82:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0102d89:	75 4c                	jne    c0102dd7 <do_unlink+0x302>
c0102d8b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102d92:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102d97:	83 ec 0c             	sub    $0xc,%esp
c0102d9a:	6a 0a                	push   $0xa
c0102d9c:	68 00 02 00 00       	push   $0x200
c0102da1:	50                   	push   %eax
c0102da2:	ff 75 b8             	pushl  -0x48(%ebp)
c0102da5:	ff 75 ec             	pushl  -0x14(%ebp)
c0102da8:	e8 b7 e9 ff ff       	call   c0101764 <rd_wt>
c0102dad:	83 c4 20             	add    $0x20,%esp
c0102db0:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102db5:	89 c1                	mov    %eax,%ecx
c0102db7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102dba:	8d 50 01             	lea    0x1(%eax),%edx
c0102dbd:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0102dc0:	83 ec 0c             	sub    $0xc,%esp
c0102dc3:	6a 07                	push   $0x7
c0102dc5:	68 00 02 00 00       	push   $0x200
c0102dca:	51                   	push   %ecx
c0102dcb:	ff 75 b8             	pushl  -0x48(%ebp)
c0102dce:	50                   	push   %eax
c0102dcf:	e8 90 e9 ff ff       	call   c0101764 <rd_wt>
c0102dd4:	83 c4 20             	add    $0x20,%esp
c0102dd7:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102ddd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102de0:	01 d0                	add    %edx,%eax
c0102de2:	0f b6 10             	movzbl (%eax),%edx
c0102de5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102de8:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0102ded:	89 c1                	mov    %eax,%ecx
c0102def:	d3 e3                	shl    %cl,%ebx
c0102df1:	89 d8                	mov    %ebx,%eax
c0102df3:	89 c3                	mov    %eax,%ebx
c0102df5:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0102dfb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102dfe:	01 c8                	add    %ecx,%eax
c0102e00:	21 da                	and    %ebx,%edx
c0102e02:	88 10                	mov    %dl,(%eax)
c0102e04:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102e09:	83 ec 0c             	sub    $0xc,%esp
c0102e0c:	6a 0a                	push   $0xa
c0102e0e:	68 00 02 00 00       	push   $0x200
c0102e13:	50                   	push   %eax
c0102e14:	ff 75 b8             	pushl  -0x48(%ebp)
c0102e17:	ff 75 ec             	pushl  -0x14(%ebp)
c0102e1a:	e8 45 e9 ff ff       	call   c0101764 <rd_wt>
c0102e1f:	83 c4 20             	add    $0x20,%esp
c0102e22:	c7 85 6c ff ff ff 00 	movl   $0x0,-0x94(%ebp)
c0102e29:	00 00 00 
c0102e2c:	c7 85 68 ff ff ff 00 	movl   $0x0,-0x98(%ebp)
c0102e33:	00 00 00 
c0102e36:	c7 85 70 ff ff ff 00 	movl   $0x0,-0x90(%ebp)
c0102e3d:	00 00 00 
c0102e40:	83 ec 0c             	sub    $0xc,%esp
c0102e43:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0102e49:	50                   	push   %eax
c0102e4a:	e8 ed 04 00 00       	call   c010333c <sync_inode>
c0102e4f:	83 c4 10             	add    $0x10,%esp
c0102e52:	83 ec 0c             	sub    $0xc,%esp
c0102e55:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0102e5b:	50                   	push   %eax
c0102e5c:	e8 2f 06 00 00       	call   c0103490 <put_inode>
c0102e61:	83 c4 10             	add    $0x10,%esp
c0102e64:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0102e67:	8b 00                	mov    (%eax),%eax
c0102e69:	89 45 9c             	mov    %eax,-0x64(%ebp)
c0102e6c:	c7 45 98 c0 21 11 c0 	movl   $0xc01121c0,-0x68(%ebp)
c0102e73:	8b 45 98             	mov    -0x68(%ebp),%eax
c0102e76:	8b 40 04             	mov    0x4(%eax),%eax
c0102e79:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0102e7c:	8b 45 98             	mov    -0x68(%ebp),%eax
c0102e7f:	8b 40 0c             	mov    0xc(%eax),%eax
c0102e82:	89 45 90             	mov    %eax,-0x70(%ebp)
c0102e85:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0102e88:	c1 e8 04             	shr    $0x4,%eax
c0102e8b:	89 45 8c             	mov    %eax,-0x74(%ebp)
c0102e8e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0102e95:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0102e9c:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0102ea3:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0102eaa:	e9 a5 00 00 00       	jmp    c0102f54 <do_unlink+0x47f>
c0102eaf:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102eb4:	89 c1                	mov    %eax,%ecx
c0102eb6:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0102eb9:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0102ebc:	01 d0                	add    %edx,%eax
c0102ebe:	83 ec 0c             	sub    $0xc,%esp
c0102ec1:	6a 07                	push   $0x7
c0102ec3:	68 00 02 00 00       	push   $0x200
c0102ec8:	51                   	push   %ecx
c0102ec9:	ff 75 b8             	pushl  -0x48(%ebp)
c0102ecc:	50                   	push   %eax
c0102ecd:	e8 92 e8 ff ff       	call   c0101764 <rd_wt>
c0102ed2:	83 c4 20             	add    $0x20,%esp
c0102ed5:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0102eda:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0102edd:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0102ee4:	eb 51                	jmp    c0102f37 <do_unlink+0x462>
c0102ee6:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0102eea:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102eed:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0102ef0:	7f 4f                	jg     c0102f41 <do_unlink+0x46c>
c0102ef2:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0102ef5:	83 c0 10             	add    $0x10,%eax
c0102ef8:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0102efb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0102efe:	83 c0 04             	add    $0x4,%eax
c0102f01:	83 ec 08             	sub    $0x8,%esp
c0102f04:	ff 75 08             	pushl  0x8(%ebp)
c0102f07:	50                   	push   %eax
c0102f08:	e8 78 66 00 00       	call   c0109585 <strcmp>
c0102f0d:	83 c4 10             	add    $0x10,%esp
c0102f10:	85 c0                	test   %eax,%eax
c0102f12:	75 1b                	jne    c0102f2f <do_unlink+0x45a>
c0102f14:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c0102f1b:	83 ec 04             	sub    $0x4,%esp
c0102f1e:	6a 10                	push   $0x10
c0102f20:	6a 00                	push   $0x0
c0102f22:	ff 75 d4             	pushl  -0x2c(%ebp)
c0102f25:	e8 01 83 00 00       	call   c010b22b <Memset>
c0102f2a:	83 c4 10             	add    $0x10,%esp
c0102f2d:	eb 13                	jmp    c0102f42 <do_unlink+0x46d>
c0102f2f:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
c0102f33:	83 45 d4 10          	addl   $0x10,-0x2c(%ebp)
c0102f37:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0102f3a:	3b 45 90             	cmp    -0x70(%ebp),%eax
c0102f3d:	7c a7                	jl     c0102ee6 <do_unlink+0x411>
c0102f3f:	eb 01                	jmp    c0102f42 <do_unlink+0x46d>
c0102f41:	90                   	nop
c0102f42:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102f45:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0102f48:	7f 16                	jg     c0102f60 <do_unlink+0x48b>
c0102f4a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0102f4e:	75 10                	jne    c0102f60 <do_unlink+0x48b>
c0102f50:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
c0102f54:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0102f57:	3b 45 90             	cmp    -0x70(%ebp),%eax
c0102f5a:	0f 8c 4f ff ff ff    	jl     c0102eaf <do_unlink+0x3da>
c0102f60:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102f63:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0102f66:	75 17                	jne    c0102f7f <do_unlink+0x4aa>
c0102f68:	8b 45 98             	mov    -0x68(%ebp),%eax
c0102f6b:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0102f6e:	89 50 04             	mov    %edx,0x4(%eax)
c0102f71:	83 ec 0c             	sub    $0xc,%esp
c0102f74:	ff 75 98             	pushl  -0x68(%ebp)
c0102f77:	e8 c0 03 00 00       	call   c010333c <sync_inode>
c0102f7c:	83 c4 10             	add    $0x10,%esp
c0102f7f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0102f83:	74 26                	je     c0102fab <do_unlink+0x4d6>
c0102f85:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102f8a:	89 c1                	mov    %eax,%ecx
c0102f8c:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0102f8f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102f92:	01 d0                	add    %edx,%eax
c0102f94:	83 ec 0c             	sub    $0xc,%esp
c0102f97:	6a 0a                	push   $0xa
c0102f99:	68 00 02 00 00       	push   $0x200
c0102f9e:	51                   	push   %ecx
c0102f9f:	ff 75 b8             	pushl  -0x48(%ebp)
c0102fa2:	50                   	push   %eax
c0102fa3:	e8 bc e7 ff ff       	call   c0101764 <rd_wt>
c0102fa8:	83 c4 20             	add    $0x20,%esp
c0102fab:	90                   	nop
c0102fac:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0102faf:	c9                   	leave  
c0102fb0:	c3                   	ret    

c0102fb1 <do_rdwt>:
c0102fb1:	55                   	push   %ebp
c0102fb2:	89 e5                	mov    %esp,%ebp
c0102fb4:	81 ec 98 00 00 00    	sub    $0x98,%esp
c0102fba:	8b 45 08             	mov    0x8(%ebp),%eax
c0102fbd:	8b 40 78             	mov    0x78(%eax),%eax
c0102fc0:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0102fc3:	8b 45 08             	mov    0x8(%ebp),%eax
c0102fc6:	8b 40 60             	mov    0x60(%eax),%eax
c0102fc9:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0102fcc:	8b 45 08             	mov    0x8(%ebp),%eax
c0102fcf:	8b 40 6c             	mov    0x6c(%eax),%eax
c0102fd2:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0102fd5:	8b 45 08             	mov    0x8(%ebp),%eax
c0102fd8:	8b 00                	mov    (%eax),%eax
c0102fda:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0102fdd:	8b 45 08             	mov    0x8(%ebp),%eax
c0102fe0:	8b 40 10             	mov    0x10(%eax),%eax
c0102fe3:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0102fe6:	8b 45 08             	mov    0x8(%ebp),%eax
c0102fe9:	8b 40 50             	mov    0x50(%eax),%eax
c0102fec:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0102fef:	83 ec 0c             	sub    $0xc,%esp
c0102ff2:	ff 75 d0             	pushl  -0x30(%ebp)
c0102ff5:	e8 0c 07 00 00       	call   c0103706 <pid2proc>
c0102ffa:	83 c4 10             	add    $0x10,%esp
c0102ffd:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0103000:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0103003:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0103006:	83 c2 4c             	add    $0x4c,%edx
c0103009:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c010300d:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0103010:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0103013:	8b 40 08             	mov    0x8(%eax),%eax
c0103016:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0103019:	8b 45 08             	mov    0x8(%ebp),%eax
c010301c:	8b 00                	mov    (%eax),%eax
c010301e:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0103021:	83 ec 08             	sub    $0x8,%esp
c0103024:	ff 75 bc             	pushl  -0x44(%ebp)
c0103027:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c010302d:	50                   	push   %eax
c010302e:	e8 0d f2 ff ff       	call   c0102240 <get_inode>
c0103033:	83 c4 10             	add    $0x10,%esp
c0103036:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0103039:	83 7d b4 00          	cmpl   $0x0,-0x4c(%ebp)
c010303d:	75 10                	jne    c010304f <do_rdwt+0x9e>
c010303f:	83 ec 0c             	sub    $0xc,%esp
c0103042:	68 38 a6 10 c0       	push   $0xc010a638
c0103047:	e8 44 55 00 00       	call   c0108590 <panic>
c010304c:	83 c4 10             	add    $0x10,%esp
c010304f:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c0103055:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0103058:	8b 45 c0             	mov    -0x40(%ebp),%eax
c010305b:	8b 40 04             	mov    0x4(%eax),%eax
c010305e:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0103061:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c0103065:	74 22                	je     c0103089 <do_rdwt+0xd8>
c0103067:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c010306b:	74 1c                	je     c0103089 <do_rdwt+0xd8>
c010306d:	68 a7 04 00 00       	push   $0x4a7
c0103072:	68 a4 a4 10 c0       	push   $0xc010a4a4
c0103077:	68 a4 a4 10 c0       	push   $0xc010a4a4
c010307c:	68 48 a6 10 c0       	push   $0xc010a648
c0103081:	e8 28 55 00 00       	call   c01085ae <assertion_failure>
c0103086:	83 c4 10             	add    $0x10,%esp
c0103089:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
c010308f:	83 f8 01             	cmp    $0x1,%eax
c0103092:	0f 85 86 00 00 00    	jne    c010311e <do_rdwt+0x16d>
c0103098:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c010309c:	75 09                	jne    c01030a7 <do_rdwt+0xf6>
c010309e:	c7 45 f4 d2 07 00 00 	movl   $0x7d2,-0xc(%ebp)
c01030a5:	eb 0d                	jmp    c01030b4 <do_rdwt+0x103>
c01030a7:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c01030ab:	75 07                	jne    c01030b4 <do_rdwt+0x103>
c01030ad:	c7 45 f4 d3 07 00 00 	movl   $0x7d3,-0xc(%ebp)
c01030b4:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01030b7:	8b 45 08             	mov    0x8(%ebp),%eax
c01030ba:	89 50 78             	mov    %edx,0x78(%eax)
c01030bd:	8b 55 b8             	mov    -0x48(%ebp),%edx
c01030c0:	8b 45 08             	mov    0x8(%ebp),%eax
c01030c3:	89 50 68             	mov    %edx,0x68(%eax)
c01030c6:	83 ec 04             	sub    $0x4,%esp
c01030c9:	6a 04                	push   $0x4
c01030cb:	ff 75 08             	pushl  0x8(%ebp)
c01030ce:	6a 03                	push   $0x3
c01030d0:	e8 49 61 00 00       	call   c010921e <send_rec>
c01030d5:	83 c4 10             	add    $0x10,%esp
c01030d8:	8b 45 08             	mov    0x8(%ebp),%eax
c01030db:	8b 40 78             	mov    0x78(%eax),%eax
c01030de:	83 f8 66             	cmp    $0x66,%eax
c01030e1:	75 13                	jne    c01030f6 <do_rdwt+0x145>
c01030e3:	83 ec 04             	sub    $0x4,%esp
c01030e6:	ff 75 b8             	pushl  -0x48(%ebp)
c01030e9:	ff 75 08             	pushl  0x8(%ebp)
c01030ec:	6a 01                	push   $0x1
c01030ee:	e8 2b 61 00 00       	call   c010921e <send_rec>
c01030f3:	83 c4 10             	add    $0x10,%esp
c01030f6:	8b 45 08             	mov    0x8(%ebp),%eax
c01030f9:	8b 40 78             	mov    0x78(%eax),%eax
c01030fc:	83 f8 65             	cmp    $0x65,%eax
c01030ff:	75 13                	jne    c0103114 <do_rdwt+0x163>
c0103101:	83 ec 04             	sub    $0x4,%esp
c0103104:	ff 75 b8             	pushl  -0x48(%ebp)
c0103107:	ff 75 08             	pushl  0x8(%ebp)
c010310a:	6a 01                	push   $0x1
c010310c:	e8 0d 61 00 00       	call   c010921e <send_rec>
c0103111:	83 c4 10             	add    $0x10,%esp
c0103114:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0103119:	e9 1c 02 00 00       	jmp    c010333a <do_rdwt+0x389>
c010311e:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c0103122:	75 18                	jne    c010313c <do_rdwt+0x18b>
c0103124:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c010312a:	c1 e0 09             	shl    $0x9,%eax
c010312d:	39 45 ac             	cmp    %eax,-0x54(%ebp)
c0103130:	75 0a                	jne    c010313c <do_rdwt+0x18b>
c0103132:	b8 00 00 00 00       	mov    $0x0,%eax
c0103137:	e9 fe 01 00 00       	jmp    c010333a <do_rdwt+0x389>
c010313c:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c0103140:	75 14                	jne    c0103156 <do_rdwt+0x1a5>
c0103142:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0103145:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0103148:	01 d0                	add    %edx,%eax
c010314a:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c010314d:	0f 4e 45 b0          	cmovle -0x50(%ebp),%eax
c0103151:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103154:	eb 19                	jmp    c010316f <do_rdwt+0x1be>
c0103156:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0103159:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010315c:	01 c2                	add    %eax,%edx
c010315e:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0103164:	c1 e0 09             	shl    $0x9,%eax
c0103167:	39 c2                	cmp    %eax,%edx
c0103169:	0f 4e c2             	cmovle %edx,%eax
c010316c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010316f:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0103172:	99                   	cltd   
c0103173:	c1 ea 17             	shr    $0x17,%edx
c0103176:	01 d0                	add    %edx,%eax
c0103178:	25 ff 01 00 00       	and    $0x1ff,%eax
c010317d:	29 d0                	sub    %edx,%eax
c010317f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103182:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c0103188:	8b 45 ac             	mov    -0x54(%ebp),%eax
c010318b:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c0103191:	85 c0                	test   %eax,%eax
c0103193:	0f 48 c1             	cmovs  %ecx,%eax
c0103196:	c1 f8 09             	sar    $0x9,%eax
c0103199:	01 d0                	add    %edx,%eax
c010319b:	89 45 a8             	mov    %eax,-0x58(%ebp)
c010319e:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c01031a4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01031a7:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c01031ad:	85 c0                	test   %eax,%eax
c01031af:	0f 48 c1             	cmovs  %ecx,%eax
c01031b2:	c1 f8 09             	sar    $0x9,%eax
c01031b5:	01 d0                	add    %edx,%eax
c01031b7:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c01031ba:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c01031bd:	2b 45 a8             	sub    -0x58(%ebp),%eax
c01031c0:	ba 00 00 10 00       	mov    $0x100000,%edx
c01031c5:	39 d0                	cmp    %edx,%eax
c01031c7:	7d 0b                	jge    c01031d4 <do_rdwt+0x223>
c01031c9:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c01031cc:	2b 45 a8             	sub    -0x58(%ebp),%eax
c01031cf:	83 c0 01             	add    $0x1,%eax
c01031d2:	eb 05                	jmp    c01031d9 <do_rdwt+0x228>
c01031d4:	b8 00 00 10 00       	mov    $0x100000,%eax
c01031d9:	89 45 a0             	mov    %eax,-0x60(%ebp)
c01031dc:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01031df:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01031e2:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01031e9:	8b 45 08             	mov    0x8(%ebp),%eax
c01031ec:	8b 00                	mov    (%eax),%eax
c01031ee:	83 ec 0c             	sub    $0xc,%esp
c01031f1:	50                   	push   %eax
c01031f2:	e8 0f 05 00 00       	call   c0103706 <pid2proc>
c01031f7:	83 c4 10             	add    $0x10,%esp
c01031fa:	89 45 9c             	mov    %eax,-0x64(%ebp)
c01031fd:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0103200:	83 ec 08             	sub    $0x8,%esp
c0103203:	50                   	push   %eax
c0103204:	ff 75 cc             	pushl  -0x34(%ebp)
c0103207:	e8 30 2b 00 00       	call   c0105d3c <alloc_virtual_memory>
c010320c:	83 c4 10             	add    $0x10,%esp
c010320f:	89 45 98             	mov    %eax,-0x68(%ebp)
c0103212:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0103215:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0103218:	e9 c5 00 00 00       	jmp    c01032e2 <do_rdwt+0x331>
c010321d:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0103220:	c1 e0 09             	shl    $0x9,%eax
c0103223:	2b 45 ec             	sub    -0x14(%ebp),%eax
c0103226:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c0103229:	0f 4e 45 e8          	cmovle -0x18(%ebp),%eax
c010322d:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0103230:	c7 45 90 20 00 00 00 	movl   $0x20,-0x70(%ebp)
c0103237:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c010323b:	75 46                	jne    c0103283 <do_rdwt+0x2d2>
c010323d:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0103240:	c1 e0 09             	shl    $0x9,%eax
c0103243:	8b 15 84 17 11 c0    	mov    0xc0111784,%edx
c0103249:	83 ec 0c             	sub    $0xc,%esp
c010324c:	6a 07                	push   $0x7
c010324e:	50                   	push   %eax
c010324f:	52                   	push   %edx
c0103250:	ff 75 90             	pushl  -0x70(%ebp)
c0103253:	ff 75 e0             	pushl  -0x20(%ebp)
c0103256:	e8 09 e5 ff ff       	call   c0101764 <rd_wt>
c010325b:	83 c4 20             	add    $0x20,%esp
c010325e:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0103264:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103267:	01 d0                	add    %edx,%eax
c0103269:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c010326c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c010326f:	01 ca                	add    %ecx,%edx
c0103271:	83 ec 04             	sub    $0x4,%esp
c0103274:	ff 75 94             	pushl  -0x6c(%ebp)
c0103277:	50                   	push   %eax
c0103278:	52                   	push   %edx
c0103279:	e8 2b 39 00 00       	call   c0106ba9 <Memcpy>
c010327e:	83 c4 10             	add    $0x10,%esp
c0103281:	eb 46                	jmp    c01032c9 <do_rdwt+0x318>
c0103283:	8b 55 98             	mov    -0x68(%ebp),%edx
c0103286:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0103289:	01 d0                	add    %edx,%eax
c010328b:	89 c1                	mov    %eax,%ecx
c010328d:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0103293:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103296:	01 d0                	add    %edx,%eax
c0103298:	83 ec 04             	sub    $0x4,%esp
c010329b:	ff 75 94             	pushl  -0x6c(%ebp)
c010329e:	51                   	push   %ecx
c010329f:	50                   	push   %eax
c01032a0:	e8 04 39 00 00       	call   c0106ba9 <Memcpy>
c01032a5:	83 c4 10             	add    $0x10,%esp
c01032a8:	8b 45 a0             	mov    -0x60(%ebp),%eax
c01032ab:	c1 e0 09             	shl    $0x9,%eax
c01032ae:	8b 15 84 17 11 c0    	mov    0xc0111784,%edx
c01032b4:	83 ec 0c             	sub    $0xc,%esp
c01032b7:	6a 0a                	push   $0xa
c01032b9:	50                   	push   %eax
c01032ba:	52                   	push   %edx
c01032bb:	ff 75 90             	pushl  -0x70(%ebp)
c01032be:	ff 75 e0             	pushl  -0x20(%ebp)
c01032c1:	e8 9e e4 ff ff       	call   c0101764 <rd_wt>
c01032c6:	83 c4 20             	add    $0x20,%esp
c01032c9:	8b 45 94             	mov    -0x6c(%ebp),%eax
c01032cc:	29 45 e8             	sub    %eax,-0x18(%ebp)
c01032cf:	8b 45 94             	mov    -0x6c(%ebp),%eax
c01032d2:	01 45 e4             	add    %eax,-0x1c(%ebp)
c01032d5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01032dc:	8b 45 a0             	mov    -0x60(%ebp),%eax
c01032df:	01 45 e0             	add    %eax,-0x20(%ebp)
c01032e2:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01032e5:	3b 45 a4             	cmp    -0x5c(%ebp),%eax
c01032e8:	7f 0a                	jg     c01032f4 <do_rdwt+0x343>
c01032ea:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c01032ee:	0f 85 29 ff ff ff    	jne    c010321d <do_rdwt+0x26c>
c01032f4:	8b 45 c0             	mov    -0x40(%ebp),%eax
c01032f7:	8b 50 04             	mov    0x4(%eax),%edx
c01032fa:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01032fd:	01 c2                	add    %eax,%edx
c01032ff:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0103302:	89 50 04             	mov    %edx,0x4(%eax)
c0103305:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0103308:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010330b:	01 c2                	add    %eax,%edx
c010330d:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c0103313:	39 c2                	cmp    %eax,%edx
c0103315:	7e 20                	jle    c0103337 <do_rdwt+0x386>
c0103317:	8b 55 ac             	mov    -0x54(%ebp),%edx
c010331a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010331d:	01 d0                	add    %edx,%eax
c010331f:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c0103325:	83 ec 0c             	sub    $0xc,%esp
c0103328:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c010332e:	50                   	push   %eax
c010332f:	e8 08 00 00 00       	call   c010333c <sync_inode>
c0103334:	83 c4 10             	add    $0x10,%esp
c0103337:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010333a:	c9                   	leave  
c010333b:	c3                   	ret    

c010333c <sync_inode>:
c010333c:	55                   	push   %ebp
c010333d:	89 e5                	mov    %esp,%ebp
c010333f:	53                   	push   %ebx
c0103340:	83 ec 34             	sub    $0x34,%esp
c0103343:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010334a:	eb 74                	jmp    c01033c0 <sync_inode+0x84>
c010334c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010334f:	89 d0                	mov    %edx,%eax
c0103351:	c1 e0 02             	shl    $0x2,%eax
c0103354:	01 d0                	add    %edx,%eax
c0103356:	c1 e0 03             	shl    $0x3,%eax
c0103359:	05 b0 17 11 c0       	add    $0xc01117b0,%eax
c010335e:	8b 10                	mov    (%eax),%edx
c0103360:	8b 45 08             	mov    0x8(%ebp),%eax
c0103363:	8b 40 10             	mov    0x10(%eax),%eax
c0103366:	39 c2                	cmp    %eax,%edx
c0103368:	75 52                	jne    c01033bc <sync_inode+0x80>
c010336a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010336d:	89 d0                	mov    %edx,%eax
c010336f:	c1 e0 02             	shl    $0x2,%eax
c0103372:	01 d0                	add    %edx,%eax
c0103374:	c1 e0 03             	shl    $0x3,%eax
c0103377:	8d 90 a0 17 11 c0    	lea    -0x3feee860(%eax),%edx
c010337d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103380:	8b 08                	mov    (%eax),%ecx
c0103382:	89 0a                	mov    %ecx,(%edx)
c0103384:	8b 48 04             	mov    0x4(%eax),%ecx
c0103387:	89 4a 04             	mov    %ecx,0x4(%edx)
c010338a:	8b 48 08             	mov    0x8(%eax),%ecx
c010338d:	89 4a 08             	mov    %ecx,0x8(%edx)
c0103390:	8b 48 0c             	mov    0xc(%eax),%ecx
c0103393:	89 4a 0c             	mov    %ecx,0xc(%edx)
c0103396:	8b 48 10             	mov    0x10(%eax),%ecx
c0103399:	89 4a 10             	mov    %ecx,0x10(%edx)
c010339c:	8b 48 14             	mov    0x14(%eax),%ecx
c010339f:	89 4a 14             	mov    %ecx,0x14(%edx)
c01033a2:	8b 48 18             	mov    0x18(%eax),%ecx
c01033a5:	89 4a 18             	mov    %ecx,0x18(%edx)
c01033a8:	8b 48 1c             	mov    0x1c(%eax),%ecx
c01033ab:	89 4a 1c             	mov    %ecx,0x1c(%edx)
c01033ae:	8b 48 20             	mov    0x20(%eax),%ecx
c01033b1:	89 4a 20             	mov    %ecx,0x20(%edx)
c01033b4:	8b 40 24             	mov    0x24(%eax),%eax
c01033b7:	89 42 24             	mov    %eax,0x24(%edx)
c01033ba:	eb 0a                	jmp    c01033c6 <sync_inode+0x8a>
c01033bc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01033c0:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c01033c4:	7e 86                	jle    c010334c <sync_inode+0x10>
c01033c6:	c7 45 f0 20 00 00 00 	movl   $0x20,-0x10(%ebp)
c01033cd:	8b 45 08             	mov    0x8(%ebp),%eax
c01033d0:	8b 40 10             	mov    0x10(%eax),%eax
c01033d3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01033d6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01033d9:	8d 48 ff             	lea    -0x1(%eax),%ecx
c01033dc:	b8 00 02 00 00       	mov    $0x200,%eax
c01033e1:	99                   	cltd   
c01033e2:	f7 7d f0             	idivl  -0x10(%ebp)
c01033e5:	89 c3                	mov    %eax,%ebx
c01033e7:	89 c8                	mov    %ecx,%eax
c01033e9:	99                   	cltd   
c01033ea:	f7 fb                	idiv   %ebx
c01033ec:	89 55 e8             	mov    %edx,-0x18(%ebp)
c01033ef:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01033f2:	8d 48 ff             	lea    -0x1(%eax),%ecx
c01033f5:	b8 00 02 00 00       	mov    $0x200,%eax
c01033fa:	99                   	cltd   
c01033fb:	f7 7d f0             	idivl  -0x10(%ebp)
c01033fe:	89 c3                	mov    %eax,%ebx
c0103400:	89 c8                	mov    %ecx,%eax
c0103402:	99                   	cltd   
c0103403:	f7 fb                	idiv   %ebx
c0103405:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0103408:	8b 45 08             	mov    0x8(%ebp),%eax
c010340b:	8b 40 20             	mov    0x20(%eax),%eax
c010340e:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0103411:	e8 0a 01 00 00       	call   c0103520 <get_super_block>
c0103416:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0103419:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010341c:	8b 40 04             	mov    0x4(%eax),%eax
c010341f:	8d 50 02             	lea    0x2(%eax),%edx
c0103422:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0103425:	8b 40 08             	mov    0x8(%eax),%eax
c0103428:	01 c2                	add    %eax,%edx
c010342a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010342d:	01 d0                	add    %edx,%eax
c010342f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0103432:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0103437:	83 ec 0c             	sub    $0xc,%esp
c010343a:	6a 07                	push   $0x7
c010343c:	68 00 02 00 00       	push   $0x200
c0103441:	50                   	push   %eax
c0103442:	ff 75 e0             	pushl  -0x20(%ebp)
c0103445:	ff 75 d8             	pushl  -0x28(%ebp)
c0103448:	e8 17 e3 ff ff       	call   c0101764 <rd_wt>
c010344d:	83 c4 20             	add    $0x20,%esp
c0103450:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0103455:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0103458:	83 ec 04             	sub    $0x4,%esp
c010345b:	ff 75 f0             	pushl  -0x10(%ebp)
c010345e:	ff 75 08             	pushl  0x8(%ebp)
c0103461:	ff 75 d4             	pushl  -0x2c(%ebp)
c0103464:	e8 40 37 00 00       	call   c0106ba9 <Memcpy>
c0103469:	83 c4 10             	add    $0x10,%esp
c010346c:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0103471:	83 ec 0c             	sub    $0xc,%esp
c0103474:	6a 0a                	push   $0xa
c0103476:	68 00 02 00 00       	push   $0x200
c010347b:	50                   	push   %eax
c010347c:	ff 75 e0             	pushl  -0x20(%ebp)
c010347f:	ff 75 d8             	pushl  -0x28(%ebp)
c0103482:	e8 dd e2 ff ff       	call   c0101764 <rd_wt>
c0103487:	83 c4 20             	add    $0x20,%esp
c010348a:	90                   	nop
c010348b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c010348e:	c9                   	leave  
c010348f:	c3                   	ret    

c0103490 <put_inode>:
c0103490:	55                   	push   %ebp
c0103491:	89 e5                	mov    %esp,%ebp
c0103493:	83 ec 08             	sub    $0x8,%esp
c0103496:	8b 45 08             	mov    0x8(%ebp),%eax
c0103499:	8b 40 24             	mov    0x24(%eax),%eax
c010349c:	85 c0                	test   %eax,%eax
c010349e:	7f 1c                	jg     c01034bc <put_inode+0x2c>
c01034a0:	68 4c 05 00 00       	push   $0x54c
c01034a5:	68 a4 a4 10 c0       	push   $0xc010a4a4
c01034aa:	68 a4 a4 10 c0       	push   $0xc010a4a4
c01034af:	68 7c a6 10 c0       	push   $0xc010a67c
c01034b4:	e8 f5 50 00 00       	call   c01085ae <assertion_failure>
c01034b9:	83 c4 10             	add    $0x10,%esp
c01034bc:	8b 45 08             	mov    0x8(%ebp),%eax
c01034bf:	8b 40 24             	mov    0x24(%eax),%eax
c01034c2:	8d 50 ff             	lea    -0x1(%eax),%edx
c01034c5:	8b 45 08             	mov    0x8(%ebp),%eax
c01034c8:	89 50 24             	mov    %edx,0x24(%eax)
c01034cb:	90                   	nop
c01034cc:	c9                   	leave  
c01034cd:	c3                   	ret    

c01034ce <do_close>:
c01034ce:	55                   	push   %ebp
c01034cf:	89 e5                	mov    %esp,%ebp
c01034d1:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c01034d6:	8b 55 08             	mov    0x8(%ebp),%edx
c01034d9:	83 c2 4c             	add    $0x4c,%edx
c01034dc:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c01034e0:	8b 50 0c             	mov    0xc(%eax),%edx
c01034e3:	83 ea 01             	sub    $0x1,%edx
c01034e6:	89 50 0c             	mov    %edx,0xc(%eax)
c01034e9:	8b 40 0c             	mov    0xc(%eax),%eax
c01034ec:	85 c0                	test   %eax,%eax
c01034ee:	75 16                	jne    c0103506 <do_close+0x38>
c01034f0:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c01034f5:	8b 55 08             	mov    0x8(%ebp),%edx
c01034f8:	83 c2 4c             	add    $0x4c,%edx
c01034fb:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c01034ff:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0103506:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c010350b:	8b 55 08             	mov    0x8(%ebp),%edx
c010350e:	83 c2 4c             	add    $0x4c,%edx
c0103511:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
c0103518:	00 
c0103519:	b8 00 00 00 00       	mov    $0x0,%eax
c010351e:	5d                   	pop    %ebp
c010351f:	c3                   	ret    

c0103520 <get_super_block>:
c0103520:	55                   	push   %ebp
c0103521:	89 e5                	mov    %esp,%ebp
c0103523:	83 ec 08             	sub    $0x8,%esp
c0103526:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010352b:	83 ec 0c             	sub    $0xc,%esp
c010352e:	6a 07                	push   $0x7
c0103530:	68 00 02 00 00       	push   $0x200
c0103535:	50                   	push   %eax
c0103536:	6a 20                	push   $0x20
c0103538:	6a 01                	push   $0x1
c010353a:	e8 25 e2 ff ff       	call   c0101764 <rd_wt>
c010353f:	83 c4 20             	add    $0x20,%esp
c0103542:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0103548:	a1 a0 21 11 c0       	mov    0xc01121a0,%eax
c010354d:	8b 0a                	mov    (%edx),%ecx
c010354f:	89 08                	mov    %ecx,(%eax)
c0103551:	8b 4a 04             	mov    0x4(%edx),%ecx
c0103554:	89 48 04             	mov    %ecx,0x4(%eax)
c0103557:	8b 4a 08             	mov    0x8(%edx),%ecx
c010355a:	89 48 08             	mov    %ecx,0x8(%eax)
c010355d:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0103560:	89 48 0c             	mov    %ecx,0xc(%eax)
c0103563:	8b 4a 10             	mov    0x10(%edx),%ecx
c0103566:	89 48 10             	mov    %ecx,0x10(%eax)
c0103569:	8b 4a 14             	mov    0x14(%edx),%ecx
c010356c:	89 48 14             	mov    %ecx,0x14(%eax)
c010356f:	8b 4a 18             	mov    0x18(%edx),%ecx
c0103572:	89 48 18             	mov    %ecx,0x18(%eax)
c0103575:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0103578:	89 48 1c             	mov    %ecx,0x1c(%eax)
c010357b:	8b 52 20             	mov    0x20(%edx),%edx
c010357e:	89 50 20             	mov    %edx,0x20(%eax)
c0103581:	a1 a0 21 11 c0       	mov    0xc01121a0,%eax
c0103586:	c9                   	leave  
c0103587:	c3                   	ret    

c0103588 <schedule_process>:
c0103588:	55                   	push   %ebp
c0103589:	89 e5                	mov    %esp,%ebp
c010358b:	83 ec 18             	sub    $0x18,%esp
c010358e:	c7 45 f4 00 00 40 00 	movl   $0x400000,-0xc(%ebp)
c0103595:	e8 09 ce ff ff       	call   c01003a3 <get_running_thread_pcb>
c010359a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010359d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01035a0:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01035a7:	84 c0                	test   %al,%al
c01035a9:	75 35                	jne    c01035e0 <schedule_process+0x58>
c01035ab:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01035ae:	8b 90 1c 01 00 00    	mov    0x11c(%eax),%edx
c01035b4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01035b7:	89 90 18 01 00 00    	mov    %edx,0x118(%eax)
c01035bd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01035c0:	c6 80 3c 02 00 00 03 	movb   $0x3,0x23c(%eax)
c01035c7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01035ca:	05 60 02 00 00       	add    $0x260,%eax
c01035cf:	83 ec 08             	sub    $0x8,%esp
c01035d2:	50                   	push   %eax
c01035d3:	68 ec fd 10 c0       	push   $0xc010fdec
c01035d8:	e8 7a 69 00 00       	call   c0109f57 <insertToDoubleLinkList>
c01035dd:	83 c4 10             	add    $0x10,%esp
c01035e0:	83 ec 0c             	sub    $0xc,%esp
c01035e3:	68 ec fd 10 c0       	push   $0xc010fdec
c01035e8:	e8 86 67 00 00       	call   c0109d73 <isListEmpty>
c01035ed:	83 c4 10             	add    $0x10,%esp
c01035f0:	84 c0                	test   %al,%al
c01035f2:	74 19                	je     c010360d <schedule_process+0x85>
c01035f4:	6a 1e                	push   $0x1e
c01035f6:	68 8b a6 10 c0       	push   $0xc010a68b
c01035fb:	68 8b a6 10 c0       	push   $0xc010a68b
c0103600:	68 95 a6 10 c0       	push   $0xc010a695
c0103605:	e8 a4 4f 00 00       	call   c01085ae <assertion_failure>
c010360a:	83 c4 10             	add    $0x10,%esp
c010360d:	83 ec 0c             	sub    $0xc,%esp
c0103610:	68 ec fd 10 c0       	push   $0xc010fdec
c0103615:	e8 c0 69 00 00       	call   c0109fda <popFromDoubleLinkList>
c010361a:	83 c4 10             	add    $0x10,%esp
c010361d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103620:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103623:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0103628:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010362b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010362e:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0103635:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103638:	8b 50 08             	mov    0x8(%eax),%edx
c010363b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010363e:	39 c2                	cmp    %eax,%edx
c0103640:	74 28                	je     c010366a <schedule_process+0xe2>
c0103642:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103645:	05 00 10 00 00       	add    $0x1000,%eax
c010364a:	83 ec 0c             	sub    $0xc,%esp
c010364d:	50                   	push   %eax
c010364e:	e8 41 cd ff ff       	call   c0100394 <update_tss>
c0103653:	83 c4 10             	add    $0x10,%esp
c0103656:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103659:	8b 40 08             	mov    0x8(%eax),%eax
c010365c:	83 ec 0c             	sub    $0xc,%esp
c010365f:	50                   	push   %eax
c0103660:	e8 22 cd ff ff       	call   c0100387 <update_cr3>
c0103665:	83 c4 10             	add    $0x10,%esp
c0103668:	eb 0f                	jmp    c0103679 <schedule_process+0xf1>
c010366a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010366d:	83 ec 0c             	sub    $0xc,%esp
c0103670:	50                   	push   %eax
c0103671:	e8 11 cd ff ff       	call   c0100387 <update_cr3>
c0103676:	83 c4 10             	add    $0x10,%esp
c0103679:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010367c:	a3 c0 fb 10 c0       	mov    %eax,0xc010fbc0
c0103681:	83 ec 08             	sub    $0x8,%esp
c0103684:	ff 75 e8             	pushl  -0x18(%ebp)
c0103687:	ff 75 f0             	pushl  -0x10(%ebp)
c010368a:	e8 a1 66 00 00       	call   c0109d30 <switch_to>
c010368f:	83 c4 10             	add    $0x10,%esp
c0103692:	90                   	nop
c0103693:	c9                   	leave  
c0103694:	c3                   	ret    

c0103695 <clock_handler>:
c0103695:	55                   	push   %ebp
c0103696:	89 e5                	mov    %esp,%ebp
c0103698:	83 ec 18             	sub    $0x18,%esp
c010369b:	e8 03 cd ff ff       	call   c01003a3 <get_running_thread_pcb>
c01036a0:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01036a3:	a1 c0 06 11 c0       	mov    0xc01106c0,%eax
c01036a8:	85 c0                	test   %eax,%eax
c01036aa:	74 0d                	je     c01036b9 <clock_handler+0x24>
c01036ac:	83 ec 0c             	sub    $0xc,%esp
c01036af:	6a 04                	push   $0x4
c01036b1:	e8 02 5e 00 00       	call   c01094b8 <inform_int>
c01036b6:	83 c4 10             	add    $0x10,%esp
c01036b9:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c01036be:	83 f8 64             	cmp    $0x64,%eax
c01036c1:	75 0c                	jne    c01036cf <clock_handler+0x3a>
c01036c3:	c7 05 a8 f7 10 c0 01 	movl   $0x1,0xc010f7a8
c01036ca:	00 00 00 
c01036cd:	eb 0a                	jmp    c01036d9 <clock_handler+0x44>
c01036cf:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c01036d4:	83 f8 01             	cmp    $0x1,%eax
c01036d7:	75 2a                	jne    c0103703 <clock_handler+0x6e>
c01036d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01036dc:	8b 80 18 01 00 00    	mov    0x118(%eax),%eax
c01036e2:	85 c0                	test   %eax,%eax
c01036e4:	74 16                	je     c01036fc <clock_handler+0x67>
c01036e6:	a1 c0 fb 10 c0       	mov    0xc010fbc0,%eax
c01036eb:	8b 90 18 01 00 00    	mov    0x118(%eax),%edx
c01036f1:	83 ea 01             	sub    $0x1,%edx
c01036f4:	89 90 18 01 00 00    	mov    %edx,0x118(%eax)
c01036fa:	eb 08                	jmp    c0103704 <clock_handler+0x6f>
c01036fc:	e8 87 fe ff ff       	call   c0103588 <schedule_process>
c0103701:	eb 01                	jmp    c0103704 <clock_handler+0x6f>
c0103703:	90                   	nop
c0103704:	c9                   	leave  
c0103705:	c3                   	ret    

c0103706 <pid2proc>:
c0103706:	55                   	push   %ebp
c0103707:	89 e5                	mov    %esp,%ebp
c0103709:	83 ec 20             	sub    $0x20,%esp
c010370c:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0103713:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010371a:	a1 04 0f 11 c0       	mov    0xc0110f04,%eax
c010371f:	8b 15 08 0f 11 c0    	mov    0xc0110f08,%edx
c0103725:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103728:	89 55 f0             	mov    %edx,-0x10(%ebp)
c010372b:	a1 0c 0f 11 c0       	mov    0xc0110f0c,%eax
c0103730:	8b 15 10 0f 11 c0    	mov    0xc0110f10,%edx
c0103736:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0103739:	89 55 e8             	mov    %edx,-0x18(%ebp)
c010373c:	a1 08 0f 11 c0       	mov    0xc0110f08,%eax
c0103741:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103744:	eb 36                	jmp    c010377c <pid2proc+0x76>
c0103746:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103749:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010374e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103751:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0103755:	75 07                	jne    c010375e <pid2proc+0x58>
c0103757:	c7 45 f8 04 00 00 00 	movl   $0x4,-0x8(%ebp)
c010375e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103761:	8b 90 14 01 00 00    	mov    0x114(%eax),%edx
c0103767:	8b 45 08             	mov    0x8(%ebp),%eax
c010376a:	39 c2                	cmp    %eax,%edx
c010376c:	75 05                	jne    c0103773 <pid2proc+0x6d>
c010376e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103771:	eb 17                	jmp    c010378a <pid2proc+0x84>
c0103773:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103776:	8b 40 04             	mov    0x4(%eax),%eax
c0103779:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010377c:	81 7d fc 0c 0f 11 c0 	cmpl   $0xc0110f0c,-0x4(%ebp)
c0103783:	75 c1                	jne    c0103746 <pid2proc+0x40>
c0103785:	b8 00 00 00 00       	mov    $0x0,%eax
c010378a:	c9                   	leave  
c010378b:	c3                   	ret    

c010378c <proc2pid>:
c010378c:	55                   	push   %ebp
c010378d:	89 e5                	mov    %esp,%ebp
c010378f:	83 ec 10             	sub    $0x10,%esp
c0103792:	8b 45 08             	mov    0x8(%ebp),%eax
c0103795:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c010379b:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010379e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01037a1:	c9                   	leave  
c01037a2:	c3                   	ret    

c01037a3 <InitDescriptor>:
c01037a3:	55                   	push   %ebp
c01037a4:	89 e5                	mov    %esp,%ebp
c01037a6:	83 ec 04             	sub    $0x4,%esp
c01037a9:	8b 45 14             	mov    0x14(%ebp),%eax
c01037ac:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
c01037b0:	8b 45 10             	mov    0x10(%ebp),%eax
c01037b3:	89 c2                	mov    %eax,%edx
c01037b5:	8b 45 08             	mov    0x8(%ebp),%eax
c01037b8:	66 89 10             	mov    %dx,(%eax)
c01037bb:	8b 45 0c             	mov    0xc(%ebp),%eax
c01037be:	89 c2                	mov    %eax,%edx
c01037c0:	8b 45 08             	mov    0x8(%ebp),%eax
c01037c3:	66 89 50 02          	mov    %dx,0x2(%eax)
c01037c7:	8b 45 0c             	mov    0xc(%ebp),%eax
c01037ca:	c1 e8 10             	shr    $0x10,%eax
c01037cd:	89 c2                	mov    %eax,%edx
c01037cf:	8b 45 08             	mov    0x8(%ebp),%eax
c01037d2:	88 50 04             	mov    %dl,0x4(%eax)
c01037d5:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c01037d9:	89 c2                	mov    %eax,%edx
c01037db:	8b 45 08             	mov    0x8(%ebp),%eax
c01037de:	88 50 05             	mov    %dl,0x5(%eax)
c01037e1:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c01037e5:	66 c1 e8 08          	shr    $0x8,%ax
c01037e9:	c1 e0 04             	shl    $0x4,%eax
c01037ec:	89 c2                	mov    %eax,%edx
c01037ee:	8b 45 10             	mov    0x10(%ebp),%eax
c01037f1:	c1 e8 10             	shr    $0x10,%eax
c01037f4:	83 e0 0f             	and    $0xf,%eax
c01037f7:	09 c2                	or     %eax,%edx
c01037f9:	8b 45 08             	mov    0x8(%ebp),%eax
c01037fc:	88 50 06             	mov    %dl,0x6(%eax)
c01037ff:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103802:	c1 e8 18             	shr    $0x18,%eax
c0103805:	89 c2                	mov    %eax,%edx
c0103807:	8b 45 08             	mov    0x8(%ebp),%eax
c010380a:	88 50 07             	mov    %dl,0x7(%eax)
c010380d:	90                   	nop
c010380e:	c9                   	leave  
c010380f:	c3                   	ret    

c0103810 <Seg2PhyAddr>:
c0103810:	55                   	push   %ebp
c0103811:	89 e5                	mov    %esp,%ebp
c0103813:	83 ec 10             	sub    $0x10,%esp
c0103816:	8b 45 08             	mov    0x8(%ebp),%eax
c0103819:	c1 e8 03             	shr    $0x3,%eax
c010381c:	8b 14 c5 c4 f7 10 c0 	mov    -0x3fef083c(,%eax,8),%edx
c0103823:	8b 04 c5 c0 f7 10 c0 	mov    -0x3fef0840(,%eax,8),%eax
c010382a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010382d:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0103830:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0103834:	0f b7 c0             	movzwl %ax,%eax
c0103837:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c010383b:	0f b6 d2             	movzbl %dl,%edx
c010383e:	c1 e2 10             	shl    $0x10,%edx
c0103841:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c0103847:	09 d0                	or     %edx,%eax
c0103849:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010384c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010384f:	c9                   	leave  
c0103850:	c3                   	ret    

c0103851 <Seg2PhyAddrLDT>:
c0103851:	55                   	push   %ebp
c0103852:	89 e5                	mov    %esp,%ebp
c0103854:	83 ec 10             	sub    $0x10,%esp
c0103857:	8b 45 08             	mov    0x8(%ebp),%eax
c010385a:	c1 e8 03             	shr    $0x3,%eax
c010385d:	89 c2                	mov    %eax,%edx
c010385f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103862:	83 c2 20             	add    $0x20,%edx
c0103865:	8d 54 d0 02          	lea    0x2(%eax,%edx,8),%edx
c0103869:	8b 02                	mov    (%edx),%eax
c010386b:	8b 52 04             	mov    0x4(%edx),%edx
c010386e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103871:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0103874:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0103878:	0f b7 c0             	movzwl %ax,%eax
c010387b:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c010387f:	0f b6 d2             	movzbl %dl,%edx
c0103882:	c1 e2 10             	shl    $0x10,%edx
c0103885:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c010388b:	09 d0                	or     %edx,%eax
c010388d:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103890:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103893:	c9                   	leave  
c0103894:	c3                   	ret    

c0103895 <VirAddr2PhyAddr>:
c0103895:	55                   	push   %ebp
c0103896:	89 e5                	mov    %esp,%ebp
c0103898:	83 ec 10             	sub    $0x10,%esp
c010389b:	8b 55 0c             	mov    0xc(%ebp),%edx
c010389e:	8b 45 08             	mov    0x8(%ebp),%eax
c01038a1:	01 d0                	add    %edx,%eax
c01038a3:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01038a6:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01038a9:	c9                   	leave  
c01038aa:	c3                   	ret    

c01038ab <v2l>:
c01038ab:	55                   	push   %ebp
c01038ac:	89 e5                	mov    %esp,%ebp
c01038ae:	83 ec 18             	sub    $0x18,%esp
c01038b1:	83 ec 0c             	sub    $0xc,%esp
c01038b4:	ff 75 08             	pushl  0x8(%ebp)
c01038b7:	e8 4a fe ff ff       	call   c0103706 <pid2proc>
c01038bc:	83 c4 10             	add    $0x10,%esp
c01038bf:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01038c2:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c01038c9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01038cc:	83 ec 08             	sub    $0x8,%esp
c01038cf:	ff 75 f4             	pushl  -0xc(%ebp)
c01038d2:	50                   	push   %eax
c01038d3:	e8 79 ff ff ff       	call   c0103851 <Seg2PhyAddrLDT>
c01038d8:	83 c4 10             	add    $0x10,%esp
c01038db:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01038de:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01038e1:	8b 45 0c             	mov    0xc(%ebp),%eax
c01038e4:	01 d0                	add    %edx,%eax
c01038e6:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01038e9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01038ec:	c9                   	leave  
c01038ed:	c3                   	ret    

c01038ee <init_propt>:
c01038ee:	55                   	push   %ebp
c01038ef:	89 e5                	mov    %esp,%ebp
c01038f1:	83 ec 38             	sub    $0x38,%esp
c01038f4:	6a 0e                	push   $0xe
c01038f6:	6a 08                	push   $0x8
c01038f8:	68 71 01 10 c0       	push   $0xc0100171
c01038fd:	6a 20                	push   $0x20
c01038ff:	e8 58 01 00 00       	call   c0103a5c <InitInterruptDesc>
c0103904:	83 c4 10             	add    $0x10,%esp
c0103907:	6a 0e                	push   $0xe
c0103909:	6a 08                	push   $0x8
c010390b:	68 9f 01 10 c0       	push   $0xc010019f
c0103910:	6a 21                	push   $0x21
c0103912:	e8 45 01 00 00       	call   c0103a5c <InitInterruptDesc>
c0103917:	83 c4 10             	add    $0x10,%esp
c010391a:	6a 0e                	push   $0xe
c010391c:	6a 08                	push   $0x8
c010391e:	68 e2 01 10 c0       	push   $0xc01001e2
c0103923:	6a 2e                	push   $0x2e
c0103925:	e8 32 01 00 00       	call   c0103a5c <InitInterruptDesc>
c010392a:	83 c4 10             	add    $0x10,%esp
c010392d:	83 ec 04             	sub    $0x4,%esp
c0103930:	68 e0 15 00 00       	push   $0x15e0
c0103935:	6a 00                	push   $0x0
c0103937:	68 00 22 18 c0       	push   $0xc0182200
c010393c:	e8 ea 78 00 00       	call   c010b22b <Memset>
c0103941:	83 c4 10             	add    $0x10,%esp
c0103944:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c010394b:	83 ec 04             	sub    $0x4,%esp
c010394e:	ff 75 f4             	pushl  -0xc(%ebp)
c0103951:	6a 00                	push   $0x0
c0103953:	68 40 06 11 c0       	push   $0xc0110640
c0103958:	e8 ce 78 00 00       	call   c010b22b <Memset>
c010395d:	83 c4 10             	add    $0x10,%esp
c0103960:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103963:	a3 a8 06 11 c0       	mov    %eax,0xc01106a8
c0103968:	c7 05 48 06 11 c0 30 	movl   $0x30,0xc0110648
c010396f:	00 00 00 
c0103972:	83 ec 0c             	sub    $0xc,%esp
c0103975:	6a 30                	push   $0x30
c0103977:	e8 94 fe ff ff       	call   c0103810 <Seg2PhyAddr>
c010397c:	83 c4 10             	add    $0x10,%esp
c010397f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103982:	c7 45 ec 40 06 11 c0 	movl   $0xc0110640,-0x14(%ebp)
c0103989:	c7 45 e8 89 00 00 00 	movl   $0x89,-0x18(%ebp)
c0103990:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103993:	0f b7 d0             	movzwl %ax,%edx
c0103996:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103999:	83 e8 01             	sub    $0x1,%eax
c010399c:	89 c1                	mov    %eax,%ecx
c010399e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01039a1:	52                   	push   %edx
c01039a2:	51                   	push   %ecx
c01039a3:	50                   	push   %eax
c01039a4:	68 00 f8 10 c0       	push   $0xc010f800
c01039a9:	e8 f5 fd ff ff       	call   c01037a3 <InitDescriptor>
c01039ae:	83 c4 10             	add    $0x10,%esp
c01039b1:	c7 45 e4 00 80 0b c0 	movl   $0xc00b8000,-0x1c(%ebp)
c01039b8:	68 f2 00 00 00       	push   $0xf2
c01039bd:	68 ff ff 00 00       	push   $0xffff
c01039c2:	ff 75 e4             	pushl  -0x1c(%ebp)
c01039c5:	68 f8 f7 10 c0       	push   $0xc010f7f8
c01039ca:	e8 d4 fd ff ff       	call   c01037a3 <InitDescriptor>
c01039cf:	83 c4 10             	add    $0x10,%esp
c01039d2:	c7 45 e0 b2 0c 00 00 	movl   $0xcb2,-0x20(%ebp)
c01039d9:	c7 45 dc 9a 0c 00 00 	movl   $0xc9a,-0x24(%ebp)
c01039e0:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%ebp)
c01039e7:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01039ea:	0f b7 c0             	movzwl %ax,%eax
c01039ed:	50                   	push   %eax
c01039ee:	ff 75 d8             	pushl  -0x28(%ebp)
c01039f1:	6a 00                	push   $0x0
c01039f3:	68 08 f8 10 c0       	push   $0xc010f808
c01039f8:	e8 a6 fd ff ff       	call   c01037a3 <InitDescriptor>
c01039fd:	83 c4 10             	add    $0x10,%esp
c0103a00:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0103a03:	0f b7 c0             	movzwl %ax,%eax
c0103a06:	50                   	push   %eax
c0103a07:	ff 75 d8             	pushl  -0x28(%ebp)
c0103a0a:	6a 00                	push   $0x0
c0103a0c:	68 10 f8 10 c0       	push   $0xc010f810
c0103a11:	e8 8d fd ff ff       	call   c01037a3 <InitDescriptor>
c0103a16:	83 c4 10             	add    $0x10,%esp
c0103a19:	c7 45 d4 b2 0c 00 00 	movl   $0xcb2,-0x2c(%ebp)
c0103a20:	c7 45 d0 ba 0c 00 00 	movl   $0xcba,-0x30(%ebp)
c0103a27:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0103a2a:	0f b7 c0             	movzwl %ax,%eax
c0103a2d:	50                   	push   %eax
c0103a2e:	ff 75 d8             	pushl  -0x28(%ebp)
c0103a31:	6a 00                	push   $0x0
c0103a33:	68 18 f8 10 c0       	push   $0xc010f818
c0103a38:	e8 66 fd ff ff       	call   c01037a3 <InitDescriptor>
c0103a3d:	83 c4 10             	add    $0x10,%esp
c0103a40:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0103a43:	0f b7 c0             	movzwl %ax,%eax
c0103a46:	50                   	push   %eax
c0103a47:	ff 75 d8             	pushl  -0x28(%ebp)
c0103a4a:	6a 00                	push   $0x0
c0103a4c:	68 20 f8 10 c0       	push   $0xc010f820
c0103a51:	e8 4d fd ff ff       	call   c01037a3 <InitDescriptor>
c0103a56:	83 c4 10             	add    $0x10,%esp
c0103a59:	90                   	nop
c0103a5a:	c9                   	leave  
c0103a5b:	c3                   	ret    

c0103a5c <InitInterruptDesc>:
c0103a5c:	55                   	push   %ebp
c0103a5d:	89 e5                	mov    %esp,%ebp
c0103a5f:	83 ec 10             	sub    $0x10,%esp
c0103a62:	8b 45 08             	mov    0x8(%ebp),%eax
c0103a65:	c1 e0 03             	shl    $0x3,%eax
c0103a68:	05 e0 06 11 c0       	add    $0xc01106e0,%eax
c0103a6d:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103a70:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103a73:	c6 40 04 00          	movb   $0x0,0x4(%eax)
c0103a77:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103a7a:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0103a7d:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0103a80:	89 c2                	mov    %eax,%edx
c0103a82:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103a85:	66 89 10             	mov    %dx,(%eax)
c0103a88:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103a8b:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
c0103a91:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0103a94:	c1 f8 10             	sar    $0x10,%eax
c0103a97:	89 c2                	mov    %eax,%edx
c0103a99:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103a9c:	66 89 50 06          	mov    %dx,0x6(%eax)
c0103aa0:	8b 45 10             	mov    0x10(%ebp),%eax
c0103aa3:	c1 e0 04             	shl    $0x4,%eax
c0103aa6:	89 c2                	mov    %eax,%edx
c0103aa8:	8b 45 14             	mov    0x14(%ebp),%eax
c0103aab:	09 d0                	or     %edx,%eax
c0103aad:	89 c2                	mov    %eax,%edx
c0103aaf:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103ab2:	88 50 05             	mov    %dl,0x5(%eax)
c0103ab5:	90                   	nop
c0103ab6:	c9                   	leave  
c0103ab7:	c3                   	ret    

c0103ab8 <ReloadGDT>:
c0103ab8:	55                   	push   %ebp
c0103ab9:	89 e5                	mov    %esp,%ebp
c0103abb:	83 ec 28             	sub    $0x28,%esp
c0103abe:	b8 cc 06 11 c0       	mov    $0xc01106cc,%eax
c0103ac3:	0f b7 00             	movzwl (%eax),%eax
c0103ac6:	98                   	cwtl   
c0103ac7:	ba ce 06 11 c0       	mov    $0xc01106ce,%edx
c0103acc:	8b 12                	mov    (%edx),%edx
c0103ace:	83 ec 04             	sub    $0x4,%esp
c0103ad1:	50                   	push   %eax
c0103ad2:	52                   	push   %edx
c0103ad3:	68 c0 f7 10 c0       	push   $0xc010f7c0
c0103ad8:	e8 20 77 00 00       	call   c010b1fd <Memcpy2>
c0103add:	83 c4 10             	add    $0x10,%esp
c0103ae0:	c7 45 f0 cc 06 11 c0 	movl   $0xc01106cc,-0x10(%ebp)
c0103ae7:	c7 45 ec ce 06 11 c0 	movl   $0xc01106ce,-0x14(%ebp)
c0103aee:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103af1:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
c0103af6:	ba c0 f7 10 c0       	mov    $0xc010f7c0,%edx
c0103afb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103afe:	89 10                	mov    %edx,(%eax)
c0103b00:	c7 45 e8 88 f7 10 c0 	movl   $0xc010f788,-0x18(%ebp)
c0103b07:	c7 45 e4 8a f7 10 c0 	movl   $0xc010f78a,-0x1c(%ebp)
c0103b0e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103b11:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
c0103b16:	ba e0 06 11 c0       	mov    $0xc01106e0,%edx
c0103b1b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0103b1e:	89 10                	mov    %edx,(%eax)
c0103b20:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0103b27:	eb 04                	jmp    c0103b2d <ReloadGDT+0x75>
c0103b29:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0103b2d:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c0103b34:	7e f3                	jle    c0103b29 <ReloadGDT+0x71>
c0103b36:	e8 a9 37 00 00       	call   c01072e4 <init_internal_interrupt>
c0103b3b:	e8 ae fd ff ff       	call   c01038ee <init_propt>
c0103b40:	90                   	nop
c0103b41:	c9                   	leave  
c0103b42:	c3                   	ret    

c0103b43 <select_console>:
c0103b43:	55                   	push   %ebp
c0103b44:	89 e5                	mov    %esp,%ebp
c0103b46:	83 ec 18             	sub    $0x18,%esp
c0103b49:	8b 45 08             	mov    0x8(%ebp),%eax
c0103b4c:	88 45 f4             	mov    %al,-0xc(%ebp)
c0103b4f:	80 7d f4 00          	cmpb   $0x0,-0xc(%ebp)
c0103b53:	75 27                	jne    c0103b7c <select_console+0x39>
c0103b55:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
c0103b59:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0103b5f:	05 00 fe 10 c0       	add    $0xc010fe00,%eax
c0103b64:	a3 80 f7 10 c0       	mov    %eax,0xc010f780
c0103b69:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c0103b6e:	83 ec 0c             	sub    $0xc,%esp
c0103b71:	50                   	push   %eax
c0103b72:	e8 08 00 00 00       	call   c0103b7f <flush>
c0103b77:	83 c4 10             	add    $0x10,%esp
c0103b7a:	eb 01                	jmp    c0103b7d <select_console+0x3a>
c0103b7c:	90                   	nop
c0103b7d:	c9                   	leave  
c0103b7e:	c3                   	ret    

c0103b7f <flush>:
c0103b7f:	55                   	push   %ebp
c0103b80:	89 e5                	mov    %esp,%ebp
c0103b82:	83 ec 08             	sub    $0x8,%esp
c0103b85:	8b 45 08             	mov    0x8(%ebp),%eax
c0103b88:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103b8e:	8b 40 0c             	mov    0xc(%eax),%eax
c0103b91:	83 ec 0c             	sub    $0xc,%esp
c0103b94:	50                   	push   %eax
c0103b95:	e8 1e 00 00 00       	call   c0103bb8 <set_cursor>
c0103b9a:	83 c4 10             	add    $0x10,%esp
c0103b9d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ba0:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103ba6:	8b 40 08             	mov    0x8(%eax),%eax
c0103ba9:	83 ec 0c             	sub    $0xc,%esp
c0103bac:	50                   	push   %eax
c0103bad:	e8 64 00 00 00       	call   c0103c16 <set_console_start_video_addr>
c0103bb2:	83 c4 10             	add    $0x10,%esp
c0103bb5:	90                   	nop
c0103bb6:	c9                   	leave  
c0103bb7:	c3                   	ret    

c0103bb8 <set_cursor>:
c0103bb8:	55                   	push   %ebp
c0103bb9:	89 e5                	mov    %esp,%ebp
c0103bbb:	83 ec 08             	sub    $0x8,%esp
c0103bbe:	83 ec 08             	sub    $0x8,%esp
c0103bc1:	6a 0e                	push   $0xe
c0103bc3:	68 d4 03 00 00       	push   $0x3d4
c0103bc8:	e8 d8 c6 ff ff       	call   c01002a5 <out_byte>
c0103bcd:	83 c4 10             	add    $0x10,%esp
c0103bd0:	8b 45 08             	mov    0x8(%ebp),%eax
c0103bd3:	c1 e8 08             	shr    $0x8,%eax
c0103bd6:	0f b7 c0             	movzwl %ax,%eax
c0103bd9:	83 ec 08             	sub    $0x8,%esp
c0103bdc:	50                   	push   %eax
c0103bdd:	68 d5 03 00 00       	push   $0x3d5
c0103be2:	e8 be c6 ff ff       	call   c01002a5 <out_byte>
c0103be7:	83 c4 10             	add    $0x10,%esp
c0103bea:	83 ec 08             	sub    $0x8,%esp
c0103bed:	6a 0f                	push   $0xf
c0103bef:	68 d4 03 00 00       	push   $0x3d4
c0103bf4:	e8 ac c6 ff ff       	call   c01002a5 <out_byte>
c0103bf9:	83 c4 10             	add    $0x10,%esp
c0103bfc:	8b 45 08             	mov    0x8(%ebp),%eax
c0103bff:	0f b7 c0             	movzwl %ax,%eax
c0103c02:	83 ec 08             	sub    $0x8,%esp
c0103c05:	50                   	push   %eax
c0103c06:	68 d5 03 00 00       	push   $0x3d5
c0103c0b:	e8 95 c6 ff ff       	call   c01002a5 <out_byte>
c0103c10:	83 c4 10             	add    $0x10,%esp
c0103c13:	90                   	nop
c0103c14:	c9                   	leave  
c0103c15:	c3                   	ret    

c0103c16 <set_console_start_video_addr>:
c0103c16:	55                   	push   %ebp
c0103c17:	89 e5                	mov    %esp,%ebp
c0103c19:	83 ec 08             	sub    $0x8,%esp
c0103c1c:	83 ec 08             	sub    $0x8,%esp
c0103c1f:	6a 0c                	push   $0xc
c0103c21:	68 d4 03 00 00       	push   $0x3d4
c0103c26:	e8 7a c6 ff ff       	call   c01002a5 <out_byte>
c0103c2b:	83 c4 10             	add    $0x10,%esp
c0103c2e:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c31:	c1 e8 08             	shr    $0x8,%eax
c0103c34:	0f b7 c0             	movzwl %ax,%eax
c0103c37:	83 ec 08             	sub    $0x8,%esp
c0103c3a:	50                   	push   %eax
c0103c3b:	68 d5 03 00 00       	push   $0x3d5
c0103c40:	e8 60 c6 ff ff       	call   c01002a5 <out_byte>
c0103c45:	83 c4 10             	add    $0x10,%esp
c0103c48:	83 ec 08             	sub    $0x8,%esp
c0103c4b:	6a 0d                	push   $0xd
c0103c4d:	68 d4 03 00 00       	push   $0x3d4
c0103c52:	e8 4e c6 ff ff       	call   c01002a5 <out_byte>
c0103c57:	83 c4 10             	add    $0x10,%esp
c0103c5a:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c5d:	0f b7 c0             	movzwl %ax,%eax
c0103c60:	83 ec 08             	sub    $0x8,%esp
c0103c63:	50                   	push   %eax
c0103c64:	68 d5 03 00 00       	push   $0x3d5
c0103c69:	e8 37 c6 ff ff       	call   c01002a5 <out_byte>
c0103c6e:	83 c4 10             	add    $0x10,%esp
c0103c71:	90                   	nop
c0103c72:	c9                   	leave  
c0103c73:	c3                   	ret    

c0103c74 <put_key>:
c0103c74:	55                   	push   %ebp
c0103c75:	89 e5                	mov    %esp,%ebp
c0103c77:	83 ec 04             	sub    $0x4,%esp
c0103c7a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103c7d:	88 45 fc             	mov    %al,-0x4(%ebp)
c0103c80:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c83:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0103c89:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c0103c8e:	77 4d                	ja     c0103cdd <put_key+0x69>
c0103c90:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c93:	8b 00                	mov    (%eax),%eax
c0103c95:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
c0103c99:	89 10                	mov    %edx,(%eax)
c0103c9b:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c9e:	8b 00                	mov    (%eax),%eax
c0103ca0:	8d 50 04             	lea    0x4(%eax),%edx
c0103ca3:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ca6:	89 10                	mov    %edx,(%eax)
c0103ca8:	8b 45 08             	mov    0x8(%ebp),%eax
c0103cab:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0103cb1:	8d 50 01             	lea    0x1(%eax),%edx
c0103cb4:	8b 45 08             	mov    0x8(%ebp),%eax
c0103cb7:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0103cbd:	8b 45 08             	mov    0x8(%ebp),%eax
c0103cc0:	8b 00                	mov    (%eax),%eax
c0103cc2:	8b 55 08             	mov    0x8(%ebp),%edx
c0103cc5:	83 c2 08             	add    $0x8,%edx
c0103cc8:	81 c2 00 08 00 00    	add    $0x800,%edx
c0103cce:	39 d0                	cmp    %edx,%eax
c0103cd0:	75 0b                	jne    c0103cdd <put_key+0x69>
c0103cd2:	8b 45 08             	mov    0x8(%ebp),%eax
c0103cd5:	8d 50 08             	lea    0x8(%eax),%edx
c0103cd8:	8b 45 08             	mov    0x8(%ebp),%eax
c0103cdb:	89 10                	mov    %edx,(%eax)
c0103cdd:	90                   	nop
c0103cde:	c9                   	leave  
c0103cdf:	c3                   	ret    

c0103ce0 <scroll_up>:
c0103ce0:	55                   	push   %ebp
c0103ce1:	89 e5                	mov    %esp,%ebp
c0103ce3:	83 ec 08             	sub    $0x8,%esp
c0103ce6:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ce9:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103cef:	8b 40 08             	mov    0x8(%eax),%eax
c0103cf2:	8d 50 b0             	lea    -0x50(%eax),%edx
c0103cf5:	8b 45 08             	mov    0x8(%ebp),%eax
c0103cf8:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103cfe:	8b 00                	mov    (%eax),%eax
c0103d00:	39 c2                	cmp    %eax,%edx
c0103d02:	76 1b                	jbe    c0103d1f <scroll_up+0x3f>
c0103d04:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d07:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103d0d:	8b 40 08             	mov    0x8(%eax),%eax
c0103d10:	83 e8 50             	sub    $0x50,%eax
c0103d13:	83 ec 0c             	sub    $0xc,%esp
c0103d16:	50                   	push   %eax
c0103d17:	e8 fa fe ff ff       	call   c0103c16 <set_console_start_video_addr>
c0103d1c:	83 c4 10             	add    $0x10,%esp
c0103d1f:	90                   	nop
c0103d20:	c9                   	leave  
c0103d21:	c3                   	ret    

c0103d22 <scroll_down>:
c0103d22:	55                   	push   %ebp
c0103d23:	89 e5                	mov    %esp,%ebp
c0103d25:	83 ec 08             	sub    $0x8,%esp
c0103d28:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d2b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103d31:	8b 40 08             	mov    0x8(%eax),%eax
c0103d34:	8d 48 50             	lea    0x50(%eax),%ecx
c0103d37:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d3a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103d40:	8b 10                	mov    (%eax),%edx
c0103d42:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d45:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103d4b:	8b 40 04             	mov    0x4(%eax),%eax
c0103d4e:	01 d0                	add    %edx,%eax
c0103d50:	39 c1                	cmp    %eax,%ecx
c0103d52:	73 36                	jae    c0103d8a <scroll_down+0x68>
c0103d54:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d57:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103d5d:	8b 40 08             	mov    0x8(%eax),%eax
c0103d60:	83 c0 50             	add    $0x50,%eax
c0103d63:	83 ec 0c             	sub    $0xc,%esp
c0103d66:	50                   	push   %eax
c0103d67:	e8 aa fe ff ff       	call   c0103c16 <set_console_start_video_addr>
c0103d6c:	83 c4 10             	add    $0x10,%esp
c0103d6f:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d72:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103d78:	8b 50 08             	mov    0x8(%eax),%edx
c0103d7b:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d7e:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103d84:	83 c2 50             	add    $0x50,%edx
c0103d87:	89 50 08             	mov    %edx,0x8(%eax)
c0103d8a:	90                   	nop
c0103d8b:	c9                   	leave  
c0103d8c:	c3                   	ret    

c0103d8d <out_char>:
c0103d8d:	55                   	push   %ebp
c0103d8e:	89 e5                	mov    %esp,%ebp
c0103d90:	83 ec 28             	sub    $0x28,%esp
c0103d93:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103d96:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0103d99:	e8 a7 2d 00 00       	call   c0106b45 <intr_disable>
c0103d9e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103da1:	8b 45 08             	mov    0x8(%ebp),%eax
c0103da4:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103daa:	8b 40 0c             	mov    0xc(%eax),%eax
c0103dad:	05 00 c0 05 60       	add    $0x6005c000,%eax
c0103db2:	01 c0                	add    %eax,%eax
c0103db4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103db7:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
c0103dbb:	83 f8 08             	cmp    $0x8,%eax
c0103dbe:	0f 84 8d 00 00 00    	je     c0103e51 <out_char+0xc4>
c0103dc4:	83 f8 0a             	cmp    $0xa,%eax
c0103dc7:	0f 85 c9 00 00 00    	jne    c0103e96 <out_char+0x109>
c0103dcd:	8b 45 08             	mov    0x8(%ebp),%eax
c0103dd0:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103dd6:	8b 50 0c             	mov    0xc(%eax),%edx
c0103dd9:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ddc:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103de2:	8b 08                	mov    (%eax),%ecx
c0103de4:	8b 45 08             	mov    0x8(%ebp),%eax
c0103de7:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103ded:	8b 40 04             	mov    0x4(%eax),%eax
c0103df0:	01 c8                	add    %ecx,%eax
c0103df2:	83 e8 50             	sub    $0x50,%eax
c0103df5:	39 c2                	cmp    %eax,%edx
c0103df7:	0f 83 f4 00 00 00    	jae    c0103ef1 <out_char+0x164>
c0103dfd:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e00:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e06:	8b 08                	mov    (%eax),%ecx
c0103e08:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e0b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e11:	8b 50 0c             	mov    0xc(%eax),%edx
c0103e14:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e17:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e1d:	8b 00                	mov    (%eax),%eax
c0103e1f:	29 c2                	sub    %eax,%edx
c0103e21:	89 d0                	mov    %edx,%eax
c0103e23:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
c0103e28:	f7 e2                	mul    %edx
c0103e2a:	89 d0                	mov    %edx,%eax
c0103e2c:	c1 e8 06             	shr    $0x6,%eax
c0103e2f:	8d 50 01             	lea    0x1(%eax),%edx
c0103e32:	89 d0                	mov    %edx,%eax
c0103e34:	c1 e0 02             	shl    $0x2,%eax
c0103e37:	01 d0                	add    %edx,%eax
c0103e39:	c1 e0 04             	shl    $0x4,%eax
c0103e3c:	89 c2                	mov    %eax,%edx
c0103e3e:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e41:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e47:	01 ca                	add    %ecx,%edx
c0103e49:	89 50 0c             	mov    %edx,0xc(%eax)
c0103e4c:	e9 a0 00 00 00       	jmp    c0103ef1 <out_char+0x164>
c0103e51:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e54:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e5a:	8b 50 0c             	mov    0xc(%eax),%edx
c0103e5d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e60:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e66:	8b 00                	mov    (%eax),%eax
c0103e68:	39 c2                	cmp    %eax,%edx
c0103e6a:	0f 86 84 00 00 00    	jbe    c0103ef4 <out_char+0x167>
c0103e70:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e73:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e79:	8b 50 0c             	mov    0xc(%eax),%edx
c0103e7c:	83 ea 01             	sub    $0x1,%edx
c0103e7f:	89 50 0c             	mov    %edx,0xc(%eax)
c0103e82:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103e85:	83 e8 02             	sub    $0x2,%eax
c0103e88:	c6 00 20             	movb   $0x20,(%eax)
c0103e8b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103e8e:	83 e8 01             	sub    $0x1,%eax
c0103e91:	c6 00 00             	movb   $0x0,(%eax)
c0103e94:	eb 5e                	jmp    c0103ef4 <out_char+0x167>
c0103e96:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e99:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e9f:	8b 40 0c             	mov    0xc(%eax),%eax
c0103ea2:	8d 48 01             	lea    0x1(%eax),%ecx
c0103ea5:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ea8:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103eae:	8b 10                	mov    (%eax),%edx
c0103eb0:	8b 45 08             	mov    0x8(%ebp),%eax
c0103eb3:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103eb9:	8b 40 04             	mov    0x4(%eax),%eax
c0103ebc:	01 d0                	add    %edx,%eax
c0103ebe:	39 c1                	cmp    %eax,%ecx
c0103ec0:	73 35                	jae    c0103ef7 <out_char+0x16a>
c0103ec2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103ec5:	8d 50 01             	lea    0x1(%eax),%edx
c0103ec8:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0103ecb:	0f b6 55 e4          	movzbl -0x1c(%ebp),%edx
c0103ecf:	88 10                	mov    %dl,(%eax)
c0103ed1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103ed4:	8d 50 01             	lea    0x1(%eax),%edx
c0103ed7:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0103eda:	c6 00 0a             	movb   $0xa,(%eax)
c0103edd:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ee0:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103ee6:	8b 50 0c             	mov    0xc(%eax),%edx
c0103ee9:	83 c2 01             	add    $0x1,%edx
c0103eec:	89 50 0c             	mov    %edx,0xc(%eax)
c0103eef:	eb 06                	jmp    c0103ef7 <out_char+0x16a>
c0103ef1:	90                   	nop
c0103ef2:	eb 14                	jmp    c0103f08 <out_char+0x17b>
c0103ef4:	90                   	nop
c0103ef5:	eb 11                	jmp    c0103f08 <out_char+0x17b>
c0103ef7:	90                   	nop
c0103ef8:	eb 0e                	jmp    c0103f08 <out_char+0x17b>
c0103efa:	83 ec 0c             	sub    $0xc,%esp
c0103efd:	ff 75 08             	pushl  0x8(%ebp)
c0103f00:	e8 1d fe ff ff       	call   c0103d22 <scroll_down>
c0103f05:	83 c4 10             	add    $0x10,%esp
c0103f08:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f0b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f11:	8b 50 0c             	mov    0xc(%eax),%edx
c0103f14:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f17:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f1d:	8b 40 08             	mov    0x8(%eax),%eax
c0103f20:	29 c2                	sub    %eax,%edx
c0103f22:	89 d0                	mov    %edx,%eax
c0103f24:	3d d0 07 00 00       	cmp    $0x7d0,%eax
c0103f29:	77 cf                	ja     c0103efa <out_char+0x16d>
c0103f2b:	83 ec 0c             	sub    $0xc,%esp
c0103f2e:	ff 75 08             	pushl  0x8(%ebp)
c0103f31:	e8 49 fc ff ff       	call   c0103b7f <flush>
c0103f36:	83 c4 10             	add    $0x10,%esp
c0103f39:	83 ec 0c             	sub    $0xc,%esp
c0103f3c:	ff 75 f4             	pushl  -0xc(%ebp)
c0103f3f:	e8 2a 2c 00 00       	call   c0106b6e <intr_set_status>
c0103f44:	83 c4 10             	add    $0x10,%esp
c0103f47:	90                   	nop
c0103f48:	c9                   	leave  
c0103f49:	c3                   	ret    

c0103f4a <tty_dev_read>:
c0103f4a:	55                   	push   %ebp
c0103f4b:	89 e5                	mov    %esp,%ebp
c0103f4d:	83 ec 08             	sub    $0x8,%esp
c0103f50:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c0103f55:	39 45 08             	cmp    %eax,0x8(%ebp)
c0103f58:	75 17                	jne    c0103f71 <tty_dev_read+0x27>
c0103f5a:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c0103f5f:	85 c0                	test   %eax,%eax
c0103f61:	7e 0e                	jle    c0103f71 <tty_dev_read+0x27>
c0103f63:	83 ec 0c             	sub    $0xc,%esp
c0103f66:	ff 75 08             	pushl  0x8(%ebp)
c0103f69:	e8 89 07 00 00       	call   c01046f7 <keyboard_read>
c0103f6e:	83 c4 10             	add    $0x10,%esp
c0103f71:	90                   	nop
c0103f72:	c9                   	leave  
c0103f73:	c3                   	ret    

c0103f74 <tty_dev_write>:
c0103f74:	55                   	push   %ebp
c0103f75:	89 e5                	mov    %esp,%ebp
c0103f77:	83 ec 28             	sub    $0x28,%esp
c0103f7a:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f7d:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0103f83:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103f86:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0103f8d:	e9 88 01 00 00       	jmp    c010411a <tty_dev_write+0x1a6>
c0103f92:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f95:	8b 40 04             	mov    0x4(%eax),%eax
c0103f98:	8b 00                	mov    (%eax),%eax
c0103f9a:	88 45 e7             	mov    %al,-0x19(%ebp)
c0103f9d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fa0:	8b 40 04             	mov    0x4(%eax),%eax
c0103fa3:	8d 50 04             	lea    0x4(%eax),%edx
c0103fa6:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fa9:	89 50 04             	mov    %edx,0x4(%eax)
c0103fac:	8b 45 08             	mov    0x8(%ebp),%eax
c0103faf:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0103fb5:	8d 50 ff             	lea    -0x1(%eax),%edx
c0103fb8:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fbb:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0103fc1:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fc4:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c0103fca:	8d 50 01             	lea    0x1(%eax),%edx
c0103fcd:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fd0:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0103fd6:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fd9:	8b 40 04             	mov    0x4(%eax),%eax
c0103fdc:	8b 55 08             	mov    0x8(%ebp),%edx
c0103fdf:	83 c2 08             	add    $0x8,%edx
c0103fe2:	81 c2 00 08 00 00    	add    $0x800,%edx
c0103fe8:	39 d0                	cmp    %edx,%eax
c0103fea:	75 0c                	jne    c0103ff8 <tty_dev_write+0x84>
c0103fec:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fef:	8d 50 08             	lea    0x8(%eax),%edx
c0103ff2:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ff5:	89 50 04             	mov    %edx,0x4(%eax)
c0103ff8:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ffb:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0104001:	85 c0                	test   %eax,%eax
c0104003:	0f 84 11 01 00 00    	je     c010411a <tty_dev_write+0x1a6>
c0104009:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c010400d:	3c 20                	cmp    $0x20,%al
c010400f:	76 08                	jbe    c0104019 <tty_dev_write+0xa5>
c0104011:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104015:	3c 7e                	cmp    $0x7e,%al
c0104017:	76 10                	jbe    c0104029 <tty_dev_write+0xb5>
c0104019:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c010401d:	3c 20                	cmp    $0x20,%al
c010401f:	74 08                	je     c0104029 <tty_dev_write+0xb5>
c0104021:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104025:	84 c0                	test   %al,%al
c0104027:	75 58                	jne    c0104081 <tty_dev_write+0x10d>
c0104029:	8b 45 08             	mov    0x8(%ebp),%eax
c010402c:	8b 90 18 08 00 00    	mov    0x818(%eax),%edx
c0104032:	8b 45 08             	mov    0x8(%ebp),%eax
c0104035:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c010403b:	01 d0                	add    %edx,%eax
c010403d:	83 e8 01             	sub    $0x1,%eax
c0104040:	89 c2                	mov    %eax,%edx
c0104042:	83 ec 04             	sub    $0x4,%esp
c0104045:	6a 01                	push   $0x1
c0104047:	8d 45 e7             	lea    -0x19(%ebp),%eax
c010404a:	50                   	push   %eax
c010404b:	52                   	push   %edx
c010404c:	e8 58 2b 00 00       	call   c0106ba9 <Memcpy>
c0104051:	83 c4 10             	add    $0x10,%esp
c0104054:	8b 45 08             	mov    0x8(%ebp),%eax
c0104057:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c010405d:	8d 50 ff             	lea    -0x1(%eax),%edx
c0104060:	8b 45 08             	mov    0x8(%ebp),%eax
c0104063:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c0104069:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c010406d:	0f b6 c0             	movzbl %al,%eax
c0104070:	83 ec 08             	sub    $0x8,%esp
c0104073:	50                   	push   %eax
c0104074:	ff 75 08             	pushl  0x8(%ebp)
c0104077:	e8 11 fd ff ff       	call   c0103d8d <out_char>
c010407c:	83 c4 10             	add    $0x10,%esp
c010407f:	eb 7c                	jmp    c01040fd <tty_dev_write+0x189>
c0104081:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104085:	3c 08                	cmp    $0x8,%al
c0104087:	75 42                	jne    c01040cb <tty_dev_write+0x157>
c0104089:	8b 45 08             	mov    0x8(%ebp),%eax
c010408c:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0104092:	8d 50 01             	lea    0x1(%eax),%edx
c0104095:	8b 45 08             	mov    0x8(%ebp),%eax
c0104098:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c010409e:	8b 45 08             	mov    0x8(%ebp),%eax
c01040a1:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c01040a7:	8d 50 fe             	lea    -0x2(%eax),%edx
c01040aa:	8b 45 08             	mov    0x8(%ebp),%eax
c01040ad:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c01040b3:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c01040b7:	0f b6 c0             	movzbl %al,%eax
c01040ba:	83 ec 08             	sub    $0x8,%esp
c01040bd:	50                   	push   %eax
c01040be:	ff 75 08             	pushl  0x8(%ebp)
c01040c1:	e8 c7 fc ff ff       	call   c0103d8d <out_char>
c01040c6:	83 c4 10             	add    $0x10,%esp
c01040c9:	eb 32                	jmp    c01040fd <tty_dev_write+0x189>
c01040cb:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c01040cf:	3c 0a                	cmp    $0xa,%al
c01040d1:	75 2a                	jne    c01040fd <tty_dev_write+0x189>
c01040d3:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c01040d7:	0f b6 c0             	movzbl %al,%eax
c01040da:	83 ec 08             	sub    $0x8,%esp
c01040dd:	50                   	push   %eax
c01040de:	ff 75 08             	pushl  0x8(%ebp)
c01040e1:	e8 a7 fc ff ff       	call   c0103d8d <out_char>
c01040e6:	83 c4 10             	add    $0x10,%esp
c01040e9:	8b 45 08             	mov    0x8(%ebp),%eax
c01040ec:	c7 80 0c 08 00 00 00 	movl   $0x0,0x80c(%eax)
c01040f3:	00 00 00 
c01040f6:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c01040fd:	8b 45 08             	mov    0x8(%ebp),%eax
c0104100:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0104106:	8b 45 08             	mov    0x8(%ebp),%eax
c0104109:	8b 80 14 08 00 00    	mov    0x814(%eax),%eax
c010410f:	39 c2                	cmp    %eax,%edx
c0104111:	75 07                	jne    c010411a <tty_dev_write+0x1a6>
c0104113:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c010411a:	8b 45 08             	mov    0x8(%ebp),%eax
c010411d:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0104123:	85 c0                	test   %eax,%eax
c0104125:	0f 85 67 fe ff ff    	jne    c0103f92 <tty_dev_write+0x1e>
c010412b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010412f:	74 6d                	je     c010419e <tty_dev_write+0x22a>
c0104131:	c7 45 ec 7c 00 00 00 	movl   $0x7c,-0x14(%ebp)
c0104138:	83 ec 0c             	sub    $0xc,%esp
c010413b:	ff 75 ec             	pushl  -0x14(%ebp)
c010413e:	e8 e9 d3 ff ff       	call   c010152c <sys_malloc>
c0104143:	83 c4 10             	add    $0x10,%esp
c0104146:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0104149:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010414c:	c7 40 78 66 00 00 00 	movl   $0x66,0x78(%eax)
c0104153:	8b 45 08             	mov    0x8(%ebp),%eax
c0104156:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c010415c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010415f:	89 50 60             	mov    %edx,0x60(%eax)
c0104162:	8b 45 08             	mov    0x8(%ebp),%eax
c0104165:	8b 90 20 08 00 00    	mov    0x820(%eax),%edx
c010416b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010416e:	89 50 68             	mov    %edx,0x68(%eax)
c0104171:	8b 45 08             	mov    0x8(%ebp),%eax
c0104174:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c010417a:	83 ec 04             	sub    $0x4,%esp
c010417d:	50                   	push   %eax
c010417e:	ff 75 e8             	pushl  -0x18(%ebp)
c0104181:	6a 01                	push   $0x1
c0104183:	e8 96 50 00 00       	call   c010921e <send_rec>
c0104188:	83 c4 10             	add    $0x10,%esp
c010418b:	83 ec 08             	sub    $0x8,%esp
c010418e:	ff 75 ec             	pushl  -0x14(%ebp)
c0104191:	ff 75 e8             	pushl  -0x18(%ebp)
c0104194:	e8 a8 d3 ff ff       	call   c0101541 <sys_free>
c0104199:	83 c4 10             	add    $0x10,%esp
c010419c:	eb 01                	jmp    c010419f <tty_dev_write+0x22b>
c010419e:	90                   	nop
c010419f:	c9                   	leave  
c01041a0:	c3                   	ret    

c01041a1 <tty_do_read>:
c01041a1:	55                   	push   %ebp
c01041a2:	89 e5                	mov    %esp,%ebp
c01041a4:	83 ec 08             	sub    $0x8,%esp
c01041a7:	8b 45 08             	mov    0x8(%ebp),%eax
c01041aa:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c01041b1:	00 00 00 
c01041b4:	8b 45 0c             	mov    0xc(%ebp),%eax
c01041b7:	8b 50 68             	mov    0x68(%eax),%edx
c01041ba:	8b 45 08             	mov    0x8(%ebp),%eax
c01041bd:	89 90 20 08 00 00    	mov    %edx,0x820(%eax)
c01041c3:	8b 45 0c             	mov    0xc(%ebp),%eax
c01041c6:	8b 00                	mov    (%eax),%eax
c01041c8:	89 c2                	mov    %eax,%edx
c01041ca:	8b 45 08             	mov    0x8(%ebp),%eax
c01041cd:	89 90 1c 08 00 00    	mov    %edx,0x81c(%eax)
c01041d3:	8b 45 0c             	mov    0xc(%ebp),%eax
c01041d6:	8b 50 60             	mov    0x60(%eax),%edx
c01041d9:	8b 45 08             	mov    0x8(%ebp),%eax
c01041dc:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c01041e2:	8b 45 0c             	mov    0xc(%ebp),%eax
c01041e5:	8b 50 60             	mov    0x60(%eax),%edx
c01041e8:	8b 45 08             	mov    0x8(%ebp),%eax
c01041eb:	89 90 14 08 00 00    	mov    %edx,0x814(%eax)
c01041f1:	8b 45 08             	mov    0x8(%ebp),%eax
c01041f4:	8b 90 0c 08 00 00    	mov    0x80c(%eax),%edx
c01041fa:	8b 45 0c             	mov    0xc(%ebp),%eax
c01041fd:	8b 40 10             	mov    0x10(%eax),%eax
c0104200:	83 ec 08             	sub    $0x8,%esp
c0104203:	52                   	push   %edx
c0104204:	50                   	push   %eax
c0104205:	e8 32 1b 00 00       	call   c0105d3c <alloc_virtual_memory>
c010420a:	83 c4 10             	add    $0x10,%esp
c010420d:	89 c2                	mov    %eax,%edx
c010420f:	8b 45 08             	mov    0x8(%ebp),%eax
c0104212:	89 90 18 08 00 00    	mov    %edx,0x818(%eax)
c0104218:	8b 45 08             	mov    0x8(%ebp),%eax
c010421b:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c0104221:	83 f8 02             	cmp    $0x2,%eax
c0104224:	74 1c                	je     c0104242 <tty_do_read+0xa1>
c0104226:	68 3b 01 00 00       	push   $0x13b
c010422b:	68 b1 a6 10 c0       	push   $0xc010a6b1
c0104230:	68 b1 a6 10 c0       	push   $0xc010a6b1
c0104235:	68 bb a6 10 c0       	push   $0xc010a6bb
c010423a:	e8 6f 43 00 00       	call   c01085ae <assertion_failure>
c010423f:	83 c4 10             	add    $0x10,%esp
c0104242:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104245:	c7 40 78 67 00 00 00 	movl   $0x67,0x78(%eax)
c010424c:	8b 45 08             	mov    0x8(%ebp),%eax
c010424f:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c0104255:	83 ec 04             	sub    $0x4,%esp
c0104258:	50                   	push   %eax
c0104259:	ff 75 0c             	pushl  0xc(%ebp)
c010425c:	6a 01                	push   $0x1
c010425e:	e8 bb 4f 00 00       	call   c010921e <send_rec>
c0104263:	83 c4 10             	add    $0x10,%esp
c0104266:	90                   	nop
c0104267:	c9                   	leave  
c0104268:	c3                   	ret    

c0104269 <tty_do_write>:
c0104269:	55                   	push   %ebp
c010426a:	89 e5                	mov    %esp,%ebp
c010426c:	53                   	push   %ebx
c010426d:	83 ec 24             	sub    $0x24,%esp
c0104270:	89 e0                	mov    %esp,%eax
c0104272:	89 c3                	mov    %eax,%ebx
c0104274:	c7 45 e8 80 00 00 00 	movl   $0x80,-0x18(%ebp)
c010427b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010427e:	8d 50 ff             	lea    -0x1(%eax),%edx
c0104281:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c0104284:	89 c2                	mov    %eax,%edx
c0104286:	b8 10 00 00 00       	mov    $0x10,%eax
c010428b:	83 e8 01             	sub    $0x1,%eax
c010428e:	01 d0                	add    %edx,%eax
c0104290:	b9 10 00 00 00       	mov    $0x10,%ecx
c0104295:	ba 00 00 00 00       	mov    $0x0,%edx
c010429a:	f7 f1                	div    %ecx
c010429c:	6b c0 10             	imul   $0x10,%eax,%eax
c010429f:	29 c4                	sub    %eax,%esp
c01042a1:	89 e0                	mov    %esp,%eax
c01042a3:	83 c0 00             	add    $0x0,%eax
c01042a6:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01042a9:	83 ec 04             	sub    $0x4,%esp
c01042ac:	ff 75 e8             	pushl  -0x18(%ebp)
c01042af:	6a 00                	push   $0x0
c01042b1:	ff 75 e0             	pushl  -0x20(%ebp)
c01042b4:	e8 72 6f 00 00       	call   c010b22b <Memset>
c01042b9:	83 c4 10             	add    $0x10,%esp
c01042bc:	8b 45 0c             	mov    0xc(%ebp),%eax
c01042bf:	8b 40 60             	mov    0x60(%eax),%eax
c01042c2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01042c5:	8b 45 08             	mov    0x8(%ebp),%eax
c01042c8:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c01042cf:	00 00 00 
c01042d2:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01042d5:	8b 45 0c             	mov    0xc(%ebp),%eax
c01042d8:	8b 40 10             	mov    0x10(%eax),%eax
c01042db:	83 ec 08             	sub    $0x8,%esp
c01042de:	52                   	push   %edx
c01042df:	50                   	push   %eax
c01042e0:	e8 57 1a 00 00       	call   c0105d3c <alloc_virtual_memory>
c01042e5:	83 c4 10             	add    $0x10,%esp
c01042e8:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01042eb:	eb 7e                	jmp    c010436b <tty_do_write+0x102>
c01042ed:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01042f0:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c01042f3:	0f 4e 45 ec          	cmovle -0x14(%ebp),%eax
c01042f7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01042fa:	8b 45 08             	mov    0x8(%ebp),%eax
c01042fd:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0104303:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104306:	01 d0                	add    %edx,%eax
c0104308:	83 ec 04             	sub    $0x4,%esp
c010430b:	ff 75 f0             	pushl  -0x10(%ebp)
c010430e:	50                   	push   %eax
c010430f:	ff 75 e0             	pushl  -0x20(%ebp)
c0104312:	e8 92 28 00 00       	call   c0106ba9 <Memcpy>
c0104317:	83 c4 10             	add    $0x10,%esp
c010431a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010431d:	29 45 ec             	sub    %eax,-0x14(%ebp)
c0104320:	8b 45 08             	mov    0x8(%ebp),%eax
c0104323:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0104329:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010432c:	01 c2                	add    %eax,%edx
c010432e:	8b 45 08             	mov    0x8(%ebp),%eax
c0104331:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0104337:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010433e:	eb 25                	jmp    c0104365 <tty_do_write+0xfc>
c0104340:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0104343:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104346:	01 d0                	add    %edx,%eax
c0104348:	0f b6 00             	movzbl (%eax),%eax
c010434b:	0f b6 c0             	movzbl %al,%eax
c010434e:	83 ec 08             	sub    $0x8,%esp
c0104351:	50                   	push   %eax
c0104352:	ff 75 08             	pushl  0x8(%ebp)
c0104355:	e8 33 fa ff ff       	call   c0103d8d <out_char>
c010435a:	83 c4 10             	add    $0x10,%esp
c010435d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0104361:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c0104365:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0104369:	75 d5                	jne    c0104340 <tty_do_write+0xd7>
c010436b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c010436f:	0f 85 78 ff ff ff    	jne    c01042ed <tty_do_write+0x84>
c0104375:	83 ec 0c             	sub    $0xc,%esp
c0104378:	6a 7c                	push   $0x7c
c010437a:	e8 ad d1 ff ff       	call   c010152c <sys_malloc>
c010437f:	83 c4 10             	add    $0x10,%esp
c0104382:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0104385:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104388:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c010438f:	8b 45 08             	mov    0x8(%ebp),%eax
c0104392:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0104398:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010439b:	89 50 58             	mov    %edx,0x58(%eax)
c010439e:	8b 45 0c             	mov    0xc(%ebp),%eax
c01043a1:	8b 00                	mov    (%eax),%eax
c01043a3:	83 ec 04             	sub    $0x4,%esp
c01043a6:	50                   	push   %eax
c01043a7:	ff 75 d8             	pushl  -0x28(%ebp)
c01043aa:	6a 01                	push   $0x1
c01043ac:	e8 6d 4e 00 00       	call   c010921e <send_rec>
c01043b1:	83 c4 10             	add    $0x10,%esp
c01043b4:	83 ec 08             	sub    $0x8,%esp
c01043b7:	6a 7c                	push   $0x7c
c01043b9:	ff 75 d8             	pushl  -0x28(%ebp)
c01043bc:	e8 80 d1 ff ff       	call   c0101541 <sys_free>
c01043c1:	83 c4 10             	add    $0x10,%esp
c01043c4:	89 dc                	mov    %ebx,%esp
c01043c6:	90                   	nop
c01043c7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01043ca:	c9                   	leave  
c01043cb:	c3                   	ret    

c01043cc <init_screen>:
c01043cc:	55                   	push   %ebp
c01043cd:	89 e5                	mov    %esp,%ebp
c01043cf:	83 ec 10             	sub    $0x10,%esp
c01043d2:	8b 45 08             	mov    0x8(%ebp),%eax
c01043d5:	2d 00 fe 10 c0       	sub    $0xc010fe00,%eax
c01043da:	c1 f8 03             	sar    $0x3,%eax
c01043dd:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c01043e3:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01043e6:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01043e9:	c1 e0 04             	shl    $0x4,%eax
c01043ec:	8d 90 14 0f 11 c0    	lea    -0x3feef0ec(%eax),%edx
c01043f2:	8b 45 08             	mov    0x8(%ebp),%eax
c01043f5:	89 90 24 08 00 00    	mov    %edx,0x824(%eax)
c01043fb:	c7 45 f8 ff 3f 00 00 	movl   $0x3fff,-0x8(%ebp)
c0104402:	8b 45 08             	mov    0x8(%ebp),%eax
c0104405:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c010440b:	8b 55 f8             	mov    -0x8(%ebp),%edx
c010440e:	89 50 04             	mov    %edx,0x4(%eax)
c0104411:	8b 45 08             	mov    0x8(%ebp),%eax
c0104414:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c010441a:	8b 50 04             	mov    0x4(%eax),%edx
c010441d:	8b 45 08             	mov    0x8(%ebp),%eax
c0104420:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104426:	0f af 55 fc          	imul   -0x4(%ebp),%edx
c010442a:	89 10                	mov    %edx,(%eax)
c010442c:	8b 45 08             	mov    0x8(%ebp),%eax
c010442f:	8b 90 24 08 00 00    	mov    0x824(%eax),%edx
c0104435:	8b 45 08             	mov    0x8(%ebp),%eax
c0104438:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c010443e:	8b 12                	mov    (%edx),%edx
c0104440:	89 50 08             	mov    %edx,0x8(%eax)
c0104443:	8b 55 08             	mov    0x8(%ebp),%edx
c0104446:	8b 92 24 08 00 00    	mov    0x824(%edx),%edx
c010444c:	8b 40 08             	mov    0x8(%eax),%eax
c010444f:	89 42 0c             	mov    %eax,0xc(%edx)
c0104452:	90                   	nop
c0104453:	c9                   	leave  
c0104454:	c3                   	ret    

c0104455 <init_tty>:
c0104455:	55                   	push   %ebp
c0104456:	89 e5                	mov    %esp,%ebp
c0104458:	83 ec 18             	sub    $0x18,%esp
c010445b:	c7 45 f4 00 fe 10 c0 	movl   $0xc010fe00,-0xc(%ebp)
c0104462:	e9 92 00 00 00       	jmp    c01044f9 <init_tty+0xa4>
c0104467:	83 ec 04             	sub    $0x4,%esp
c010446a:	68 28 08 00 00       	push   $0x828
c010446f:	6a 00                	push   $0x0
c0104471:	ff 75 f4             	pushl  -0xc(%ebp)
c0104474:	e8 b2 6d 00 00       	call   c010b22b <Memset>
c0104479:	83 c4 10             	add    $0x10,%esp
c010447c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010447f:	8d 50 08             	lea    0x8(%eax),%edx
c0104482:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104485:	89 50 04             	mov    %edx,0x4(%eax)
c0104488:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010448b:	8b 50 04             	mov    0x4(%eax),%edx
c010448e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104491:	89 10                	mov    %edx,(%eax)
c0104493:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104496:	c7 80 08 08 00 00 00 	movl   $0x0,0x808(%eax)
c010449d:	00 00 00 
c01044a0:	83 ec 0c             	sub    $0xc,%esp
c01044a3:	ff 75 f4             	pushl  -0xc(%ebp)
c01044a6:	e8 21 ff ff ff       	call   c01043cc <init_screen>
c01044ab:	83 c4 10             	add    $0x10,%esp
c01044ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01044b1:	2d 00 fe 10 c0       	sub    $0xc010fe00,%eax
c01044b6:	85 c0                	test   %eax,%eax
c01044b8:	7e 38                	jle    c01044f2 <init_tty+0x9d>
c01044ba:	83 ec 08             	sub    $0x8,%esp
c01044bd:	6a 23                	push   $0x23
c01044bf:	ff 75 f4             	pushl  -0xc(%ebp)
c01044c2:	e8 c6 f8 ff ff       	call   c0103d8d <out_char>
c01044c7:	83 c4 10             	add    $0x10,%esp
c01044ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01044cd:	05 a8 8f 01 00       	add    $0x18fa8,%eax
c01044d2:	2d 00 fe 10 c0       	sub    $0xc010fe00,%eax
c01044d7:	c1 f8 03             	sar    $0x3,%eax
c01044da:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c01044e0:	0f b6 c0             	movzbl %al,%eax
c01044e3:	83 ec 08             	sub    $0x8,%esp
c01044e6:	50                   	push   %eax
c01044e7:	ff 75 f4             	pushl  -0xc(%ebp)
c01044ea:	e8 9e f8 ff ff       	call   c0103d8d <out_char>
c01044ef:	83 c4 10             	add    $0x10,%esp
c01044f2:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c01044f9:	b8 28 06 11 c0       	mov    $0xc0110628,%eax
c01044fe:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0104501:	0f 82 60 ff ff ff    	jb     c0104467 <init_tty+0x12>
c0104507:	90                   	nop
c0104508:	c9                   	leave  
c0104509:	c3                   	ret    

c010450a <TaskTTY>:
c010450a:	55                   	push   %ebp
c010450b:	89 e5                	mov    %esp,%ebp
c010450d:	83 ec 28             	sub    $0x28,%esp
c0104510:	e8 40 ff ff ff       	call   c0104455 <init_tty>
c0104515:	83 ec 0c             	sub    $0xc,%esp
c0104518:	6a 00                	push   $0x0
c010451a:	e8 24 f6 ff ff       	call   c0103b43 <select_console>
c010451f:	83 c4 10             	add    $0x10,%esp
c0104522:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0104529:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0104530:	83 ec 0c             	sub    $0xc,%esp
c0104533:	6a 7c                	push   $0x7c
c0104535:	e8 f2 cf ff ff       	call   c010152c <sys_malloc>
c010453a:	83 c4 10             	add    $0x10,%esp
c010453d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0104540:	c7 45 f4 00 fe 10 c0 	movl   $0xc010fe00,-0xc(%ebp)
c0104547:	eb 30                	jmp    c0104579 <TaskTTY+0x6f>
c0104549:	83 ec 0c             	sub    $0xc,%esp
c010454c:	ff 75 f4             	pushl  -0xc(%ebp)
c010454f:	e8 f6 f9 ff ff       	call   c0103f4a <tty_dev_read>
c0104554:	83 c4 10             	add    $0x10,%esp
c0104557:	83 ec 0c             	sub    $0xc,%esp
c010455a:	ff 75 f4             	pushl  -0xc(%ebp)
c010455d:	e8 12 fa ff ff       	call   c0103f74 <tty_dev_write>
c0104562:	83 c4 10             	add    $0x10,%esp
c0104565:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104568:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c010456e:	85 c0                	test   %eax,%eax
c0104570:	75 d7                	jne    c0104549 <TaskTTY+0x3f>
c0104572:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c0104579:	b8 28 06 11 c0       	mov    $0xc0110628,%eax
c010457e:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0104581:	72 c6                	jb     c0104549 <TaskTTY+0x3f>
c0104583:	83 ec 04             	sub    $0x4,%esp
c0104586:	6a 12                	push   $0x12
c0104588:	ff 75 e8             	pushl  -0x18(%ebp)
c010458b:	6a 02                	push   $0x2
c010458d:	e8 8c 4c 00 00       	call   c010921e <send_rec>
c0104592:	83 c4 10             	add    $0x10,%esp
c0104595:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104598:	8b 40 78             	mov    0x78(%eax),%eax
c010459b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010459e:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c01045a5:	74 28                	je     c01045cf <TaskTTY+0xc5>
c01045a7:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c01045ae:	7f 0b                	jg     c01045bb <TaskTTY+0xb1>
c01045b0:	81 7d e4 d1 07 00 00 	cmpl   $0x7d1,-0x1c(%ebp)
c01045b7:	74 4e                	je     c0104607 <TaskTTY+0xfd>
c01045b9:	eb 4d                	jmp    c0104608 <TaskTTY+0xfe>
c01045bb:	81 7d e4 d3 07 00 00 	cmpl   $0x7d3,-0x1c(%ebp)
c01045c2:	74 21                	je     c01045e5 <TaskTTY+0xdb>
c01045c4:	81 7d e4 d5 07 00 00 	cmpl   $0x7d5,-0x1c(%ebp)
c01045cb:	74 2e                	je     c01045fb <TaskTTY+0xf1>
c01045cd:	eb 39                	jmp    c0104608 <TaskTTY+0xfe>
c01045cf:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c01045d4:	83 ec 08             	sub    $0x8,%esp
c01045d7:	ff 75 e8             	pushl  -0x18(%ebp)
c01045da:	50                   	push   %eax
c01045db:	e8 c1 fb ff ff       	call   c01041a1 <tty_do_read>
c01045e0:	83 c4 10             	add    $0x10,%esp
c01045e3:	eb 23                	jmp    c0104608 <TaskTTY+0xfe>
c01045e5:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c01045ea:	83 ec 08             	sub    $0x8,%esp
c01045ed:	ff 75 e8             	pushl  -0x18(%ebp)
c01045f0:	50                   	push   %eax
c01045f1:	e8 73 fc ff ff       	call   c0104269 <tty_do_write>
c01045f6:	83 c4 10             	add    $0x10,%esp
c01045f9:	eb 0d                	jmp    c0104608 <TaskTTY+0xfe>
c01045fb:	c7 05 c0 06 11 c0 00 	movl   $0x0,0xc01106c0
c0104602:	00 00 00 
c0104605:	eb 01                	jmp    c0104608 <TaskTTY+0xfe>
c0104607:	90                   	nop
c0104608:	e9 33 ff ff ff       	jmp    c0104540 <TaskTTY+0x36>

c010460d <keyboard_handler>:
c010460d:	55                   	push   %ebp
c010460e:	89 e5                	mov    %esp,%ebp
c0104610:	83 ec 18             	sub    $0x18,%esp
c0104613:	c7 05 c0 06 11 c0 01 	movl   $0x1,0xc01106c0
c010461a:	00 00 00 
c010461d:	c7 45 f4 60 00 00 00 	movl   $0x60,-0xc(%ebp)
c0104624:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c0104629:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c010462e:	7f 5e                	jg     c010468e <keyboard_handler+0x81>
c0104630:	e8 92 bc ff ff       	call   c01002c7 <disable_int>
c0104635:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104638:	0f b7 c0             	movzwl %ax,%eax
c010463b:	83 ec 0c             	sub    $0xc,%esp
c010463e:	50                   	push   %eax
c010463f:	e8 55 bc ff ff       	call   c0100299 <in_byte>
c0104644:	83 c4 10             	add    $0x10,%esp
c0104647:	88 45 f3             	mov    %al,-0xd(%ebp)
c010464a:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c010464f:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
c0104653:	88 10                	mov    %dl,(%eax)
c0104655:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c010465a:	83 c0 01             	add    $0x1,%eax
c010465d:	a3 e0 fb 10 c0       	mov    %eax,0xc010fbe0
c0104662:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c0104667:	83 c0 01             	add    $0x1,%eax
c010466a:	a3 e8 fb 10 c0       	mov    %eax,0xc010fbe8
c010466f:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c0104674:	ba ec fd 10 c0       	mov    $0xc010fdec,%edx
c0104679:	39 d0                	cmp    %edx,%eax
c010467b:	72 0a                	jb     c0104687 <keyboard_handler+0x7a>
c010467d:	c7 05 e0 fb 10 c0 ec 	movl   $0xc010fbec,0xc010fbe0
c0104684:	fb 10 c0 
c0104687:	e8 3d bc ff ff       	call   c01002c9 <enable_int>
c010468c:	eb 01                	jmp    c010468f <keyboard_handler+0x82>
c010468e:	90                   	nop
c010468f:	c9                   	leave  
c0104690:	c3                   	ret    

c0104691 <read_from_keyboard_buf>:
c0104691:	55                   	push   %ebp
c0104692:	89 e5                	mov    %esp,%ebp
c0104694:	83 ec 18             	sub    $0x18,%esp
c0104697:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
c010469b:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c01046a0:	85 c0                	test   %eax,%eax
c01046a2:	7f 06                	jg     c01046aa <read_from_keyboard_buf+0x19>
c01046a4:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c01046a8:	eb 4b                	jmp    c01046f5 <read_from_keyboard_buf+0x64>
c01046aa:	e8 18 bc ff ff       	call   c01002c7 <disable_int>
c01046af:	a1 e4 fb 10 c0       	mov    0xc010fbe4,%eax
c01046b4:	0f b6 00             	movzbl (%eax),%eax
c01046b7:	88 45 f7             	mov    %al,-0x9(%ebp)
c01046ba:	a1 e4 fb 10 c0       	mov    0xc010fbe4,%eax
c01046bf:	83 c0 01             	add    $0x1,%eax
c01046c2:	a3 e4 fb 10 c0       	mov    %eax,0xc010fbe4
c01046c7:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c01046cc:	83 e8 01             	sub    $0x1,%eax
c01046cf:	a3 e8 fb 10 c0       	mov    %eax,0xc010fbe8
c01046d4:	a1 e4 fb 10 c0       	mov    0xc010fbe4,%eax
c01046d9:	ba ec fd 10 c0       	mov    $0xc010fdec,%edx
c01046de:	39 d0                	cmp    %edx,%eax
c01046e0:	72 0a                	jb     c01046ec <read_from_keyboard_buf+0x5b>
c01046e2:	c7 05 e4 fb 10 c0 ec 	movl   $0xc010fbec,0xc010fbe4
c01046e9:	fb 10 c0 
c01046ec:	e8 d8 bb ff ff       	call   c01002c9 <enable_int>
c01046f1:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c01046f5:	c9                   	leave  
c01046f6:	c3                   	ret    

c01046f7 <keyboard_read>:
c01046f7:	55                   	push   %ebp
c01046f8:	89 e5                	mov    %esp,%ebp
c01046fa:	83 ec 28             	sub    $0x28,%esp
c01046fd:	90                   	nop
c01046fe:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c0104703:	85 c0                	test   %eax,%eax
c0104705:	7e f7                	jle    c01046fe <keyboard_read+0x7>
c0104707:	e8 85 ff ff ff       	call   c0104691 <read_from_keyboard_buf>
c010470c:	88 45 ea             	mov    %al,-0x16(%ebp)
c010470f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0104716:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c010471a:	80 7d ea e1          	cmpb   $0xe1,-0x16(%ebp)
c010471e:	75 5a                	jne    c010477a <keyboard_read+0x83>
c0104720:	c6 45 e3 e1          	movb   $0xe1,-0x1d(%ebp)
c0104724:	c6 45 e4 1d          	movb   $0x1d,-0x1c(%ebp)
c0104728:	c6 45 e5 45          	movb   $0x45,-0x1b(%ebp)
c010472c:	c6 45 e6 e1          	movb   $0xe1,-0x1a(%ebp)
c0104730:	c6 45 e7 9d          	movb   $0x9d,-0x19(%ebp)
c0104734:	c6 45 e8 c5          	movb   $0xc5,-0x18(%ebp)
c0104738:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
c010473c:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0104743:	eb 20                	jmp    c0104765 <keyboard_read+0x6e>
c0104745:	e8 47 ff ff ff       	call   c0104691 <read_from_keyboard_buf>
c010474a:	89 c1                	mov    %eax,%ecx
c010474c:	8d 55 e3             	lea    -0x1d(%ebp),%edx
c010474f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104752:	01 d0                	add    %edx,%eax
c0104754:	0f b6 00             	movzbl (%eax),%eax
c0104757:	38 c1                	cmp    %al,%cl
c0104759:	74 06                	je     c0104761 <keyboard_read+0x6a>
c010475b:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
c010475f:	eb 0a                	jmp    c010476b <keyboard_read+0x74>
c0104761:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0104765:	83 7d ec 05          	cmpl   $0x5,-0x14(%ebp)
c0104769:	7e da                	jle    c0104745 <keyboard_read+0x4e>
c010476b:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
c010476f:	74 68                	je     c01047d9 <keyboard_read+0xe2>
c0104771:	c7 45 f4 80 01 00 00 	movl   $0x180,-0xc(%ebp)
c0104778:	eb 5f                	jmp    c01047d9 <keyboard_read+0xe2>
c010477a:	80 7d ea e0          	cmpb   $0xe0,-0x16(%ebp)
c010477e:	75 59                	jne    c01047d9 <keyboard_read+0xe2>
c0104780:	e8 0c ff ff ff       	call   c0104691 <read_from_keyboard_buf>
c0104785:	3c 2a                	cmp    $0x2a,%al
c0104787:	75 1d                	jne    c01047a6 <keyboard_read+0xaf>
c0104789:	e8 03 ff ff ff       	call   c0104691 <read_from_keyboard_buf>
c010478e:	3c e0                	cmp    $0xe0,%al
c0104790:	75 14                	jne    c01047a6 <keyboard_read+0xaf>
c0104792:	e8 fa fe ff ff       	call   c0104691 <read_from_keyboard_buf>
c0104797:	3c 37                	cmp    $0x37,%al
c0104799:	75 0b                	jne    c01047a6 <keyboard_read+0xaf>
c010479b:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c01047a2:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
c01047a6:	e8 e6 fe ff ff       	call   c0104691 <read_from_keyboard_buf>
c01047ab:	3c b7                	cmp    $0xb7,%al
c01047ad:	75 1d                	jne    c01047cc <keyboard_read+0xd5>
c01047af:	e8 dd fe ff ff       	call   c0104691 <read_from_keyboard_buf>
c01047b4:	3c e0                	cmp    $0xe0,%al
c01047b6:	75 14                	jne    c01047cc <keyboard_read+0xd5>
c01047b8:	e8 d4 fe ff ff       	call   c0104691 <read_from_keyboard_buf>
c01047bd:	3c aa                	cmp    $0xaa,%al
c01047bf:	75 0b                	jne    c01047cc <keyboard_read+0xd5>
c01047c1:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c01047c8:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c01047cc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01047d0:	75 07                	jne    c01047d9 <keyboard_read+0xe2>
c01047d2:	c6 05 84 f7 10 c0 01 	movb   $0x1,0xc010f784
c01047d9:	81 7d f4 80 01 00 00 	cmpl   $0x180,-0xc(%ebp)
c01047e0:	0f 84 8d 00 00 00    	je     c0104873 <keyboard_read+0x17c>
c01047e6:	81 7d f4 81 01 00 00 	cmpl   $0x181,-0xc(%ebp)
c01047ed:	0f 84 80 00 00 00    	je     c0104873 <keyboard_read+0x17c>
c01047f3:	80 7d ea 36          	cmpb   $0x36,-0x16(%ebp)
c01047f7:	0f 94 c2             	sete   %dl
c01047fa:	80 7d ea 2a          	cmpb   $0x2a,-0x16(%ebp)
c01047fe:	0f 94 c0             	sete   %al
c0104801:	09 d0                	or     %edx,%eax
c0104803:	84 c0                	test   %al,%al
c0104805:	74 07                	je     c010480e <keyboard_read+0x117>
c0104807:	c6 05 c8 06 11 c0 01 	movb   $0x1,0xc01106c8
c010480e:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
c0104812:	f7 d0                	not    %eax
c0104814:	c0 e8 07             	shr    $0x7,%al
c0104817:	88 45 e9             	mov    %al,-0x17(%ebp)
c010481a:	80 7d ea 00          	cmpb   $0x0,-0x16(%ebp)
c010481e:	74 53                	je     c0104873 <keyboard_read+0x17c>
c0104820:	80 7d e9 00          	cmpb   $0x0,-0x17(%ebp)
c0104824:	74 4d                	je     c0104873 <keyboard_read+0x17c>
c0104826:	c6 45 eb 00          	movb   $0x0,-0x15(%ebp)
c010482a:	0f b6 05 c8 06 11 c0 	movzbl 0xc01106c8,%eax
c0104831:	3c 01                	cmp    $0x1,%al
c0104833:	75 04                	jne    c0104839 <keyboard_read+0x142>
c0104835:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
c0104839:	0f b6 05 84 f7 10 c0 	movzbl 0xc010f784,%eax
c0104840:	84 c0                	test   %al,%al
c0104842:	74 04                	je     c0104848 <keyboard_read+0x151>
c0104844:	c6 45 eb 02          	movb   $0x2,-0x15(%ebp)
c0104848:	0f b6 55 ea          	movzbl -0x16(%ebp),%edx
c010484c:	89 d0                	mov    %edx,%eax
c010484e:	01 c0                	add    %eax,%eax
c0104850:	01 c2                	add    %eax,%edx
c0104852:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c0104856:	01 d0                	add    %edx,%eax
c0104858:	8b 04 85 60 e1 10 c0 	mov    -0x3fef1ea0(,%eax,4),%eax
c010485f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104862:	83 ec 08             	sub    $0x8,%esp
c0104865:	ff 75 f4             	pushl  -0xc(%ebp)
c0104868:	ff 75 08             	pushl  0x8(%ebp)
c010486b:	e8 1a 00 00 00       	call   c010488a <in_process>
c0104870:	83 c4 10             	add    $0x10,%esp
c0104873:	90                   	nop
c0104874:	c9                   	leave  
c0104875:	c3                   	ret    

c0104876 <init_keyboard_handler>:
c0104876:	55                   	push   %ebp
c0104877:	89 e5                	mov    %esp,%ebp
c0104879:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c0104880:	c6 05 c8 06 11 c0 00 	movb   $0x0,0xc01106c8
c0104887:	90                   	nop
c0104888:	5d                   	pop    %ebp
c0104889:	c3                   	ret    

c010488a <in_process>:
c010488a:	55                   	push   %ebp
c010488b:	89 e5                	mov    %esp,%ebp
c010488d:	83 ec 18             	sub    $0x18,%esp
c0104890:	83 ec 04             	sub    $0x4,%esp
c0104893:	6a 02                	push   $0x2
c0104895:	6a 00                	push   $0x0
c0104897:	8d 45 f6             	lea    -0xa(%ebp),%eax
c010489a:	50                   	push   %eax
c010489b:	e8 8b 69 00 00       	call   c010b22b <Memset>
c01048a0:	83 c4 10             	add    $0x10,%esp
c01048a3:	8b 45 0c             	mov    0xc(%ebp),%eax
c01048a6:	25 00 01 00 00       	and    $0x100,%eax
c01048ab:	85 c0                	test   %eax,%eax
c01048ad:	75 28                	jne    c01048d7 <in_process+0x4d>
c01048af:	8b 45 0c             	mov    0xc(%ebp),%eax
c01048b2:	0f b6 c0             	movzbl %al,%eax
c01048b5:	83 ec 08             	sub    $0x8,%esp
c01048b8:	50                   	push   %eax
c01048b9:	ff 75 08             	pushl  0x8(%ebp)
c01048bc:	e8 b3 f3 ff ff       	call   c0103c74 <put_key>
c01048c1:	83 c4 10             	add    $0x10,%esp
c01048c4:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c01048cb:	c6 05 c8 06 11 c0 00 	movb   $0x0,0xc01106c8
c01048d2:	e9 42 01 00 00       	jmp    c0104a19 <in_process+0x18f>
c01048d7:	0f b6 05 c8 06 11 c0 	movzbl 0xc01106c8,%eax
c01048de:	84 c0                	test   %al,%al
c01048e0:	0f 84 a9 00 00 00    	je     c010498f <in_process+0x105>
c01048e6:	83 7d 0c 2a          	cmpl   $0x2a,0xc(%ebp)
c01048ea:	0f 84 9f 00 00 00    	je     c010498f <in_process+0x105>
c01048f0:	83 7d 0c 36          	cmpl   $0x36,0xc(%ebp)
c01048f4:	0f 84 95 00 00 00    	je     c010498f <in_process+0x105>
c01048fa:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0104901:	74 64                	je     c0104967 <in_process+0xdd>
c0104903:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c010490a:	77 0b                	ja     c0104917 <in_process+0x8d>
c010490c:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0104913:	74 64                	je     c0104979 <in_process+0xef>
c0104915:	eb 73                	jmp    c010498a <in_process+0x100>
c0104917:	81 7d 0c 55 01 00 00 	cmpl   $0x155,0xc(%ebp)
c010491e:	74 0b                	je     c010492b <in_process+0xa1>
c0104920:	81 7d 0c 68 01 00 00 	cmpl   $0x168,0xc(%ebp)
c0104927:	74 20                	je     c0104949 <in_process+0xbf>
c0104929:	eb 5f                	jmp    c010498a <in_process+0x100>
c010492b:	83 ec 0c             	sub    $0xc,%esp
c010492e:	ff 75 08             	pushl  0x8(%ebp)
c0104931:	e8 aa f3 ff ff       	call   c0103ce0 <scroll_up>
c0104936:	83 c4 10             	add    $0x10,%esp
c0104939:	c6 05 c8 06 11 c0 00 	movb   $0x0,0xc01106c8
c0104940:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c0104947:	eb 41                	jmp    c010498a <in_process+0x100>
c0104949:	83 ec 0c             	sub    $0xc,%esp
c010494c:	ff 75 08             	pushl  0x8(%ebp)
c010494f:	e8 ce f3 ff ff       	call   c0103d22 <scroll_down>
c0104954:	83 c4 10             	add    $0x10,%esp
c0104957:	c6 05 c8 06 11 c0 00 	movb   $0x0,0xc01106c8
c010495e:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c0104965:	eb 23                	jmp    c010498a <in_process+0x100>
c0104967:	83 ec 08             	sub    $0x8,%esp
c010496a:	6a 0a                	push   $0xa
c010496c:	ff 75 08             	pushl  0x8(%ebp)
c010496f:	e8 19 f4 ff ff       	call   c0103d8d <out_char>
c0104974:	83 c4 10             	add    $0x10,%esp
c0104977:	eb 11                	jmp    c010498a <in_process+0x100>
c0104979:	83 ec 08             	sub    $0x8,%esp
c010497c:	6a 08                	push   $0x8
c010497e:	ff 75 08             	pushl  0x8(%ebp)
c0104981:	e8 07 f4 ff ff       	call   c0103d8d <out_char>
c0104986:	83 c4 10             	add    $0x10,%esp
c0104989:	90                   	nop
c010498a:	e9 8a 00 00 00       	jmp    c0104a19 <in_process+0x18f>
c010498f:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0104996:	74 55                	je     c01049ed <in_process+0x163>
c0104998:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c010499f:	77 14                	ja     c01049b5 <in_process+0x12b>
c01049a1:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c01049a8:	74 31                	je     c01049db <in_process+0x151>
c01049aa:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c01049b1:	74 16                	je     c01049c9 <in_process+0x13f>
c01049b3:	eb 64                	jmp    c0104a19 <in_process+0x18f>
c01049b5:	81 7d 0c 41 01 00 00 	cmpl   $0x141,0xc(%ebp)
c01049bc:	74 3e                	je     c01049fc <in_process+0x172>
c01049be:	81 7d 0c 42 01 00 00 	cmpl   $0x142,0xc(%ebp)
c01049c5:	74 44                	je     c0104a0b <in_process+0x181>
c01049c7:	eb 50                	jmp    c0104a19 <in_process+0x18f>
c01049c9:	83 ec 08             	sub    $0x8,%esp
c01049cc:	6a 0a                	push   $0xa
c01049ce:	ff 75 08             	pushl  0x8(%ebp)
c01049d1:	e8 9e f2 ff ff       	call   c0103c74 <put_key>
c01049d6:	83 c4 10             	add    $0x10,%esp
c01049d9:	eb 3e                	jmp    c0104a19 <in_process+0x18f>
c01049db:	83 ec 08             	sub    $0x8,%esp
c01049de:	6a 08                	push   $0x8
c01049e0:	ff 75 08             	pushl  0x8(%ebp)
c01049e3:	e8 8c f2 ff ff       	call   c0103c74 <put_key>
c01049e8:	83 c4 10             	add    $0x10,%esp
c01049eb:	eb 2c                	jmp    c0104a19 <in_process+0x18f>
c01049ed:	83 ec 0c             	sub    $0xc,%esp
c01049f0:	6a 00                	push   $0x0
c01049f2:	e8 4c f1 ff ff       	call   c0103b43 <select_console>
c01049f7:	83 c4 10             	add    $0x10,%esp
c01049fa:	eb 1d                	jmp    c0104a19 <in_process+0x18f>
c01049fc:	83 ec 0c             	sub    $0xc,%esp
c01049ff:	6a 01                	push   $0x1
c0104a01:	e8 3d f1 ff ff       	call   c0103b43 <select_console>
c0104a06:	83 c4 10             	add    $0x10,%esp
c0104a09:	eb 0e                	jmp    c0104a19 <in_process+0x18f>
c0104a0b:	83 ec 0c             	sub    $0xc,%esp
c0104a0e:	6a 02                	push   $0x2
c0104a10:	e8 2e f1 ff ff       	call   c0103b43 <select_console>
c0104a15:	83 c4 10             	add    $0x10,%esp
c0104a18:	90                   	nop
c0104a19:	90                   	nop
c0104a1a:	c9                   	leave  
c0104a1b:	c3                   	ret    

c0104a1c <open>:
c0104a1c:	55                   	push   %ebp
c0104a1d:	89 e5                	mov    %esp,%ebp
c0104a1f:	83 ec 18             	sub    $0x18,%esp
c0104a22:	83 ec 0c             	sub    $0xc,%esp
c0104a25:	6a 7c                	push   $0x7c
c0104a27:	e8 00 cb ff ff       	call   c010152c <sys_malloc>
c0104a2c:	83 c4 10             	add    $0x10,%esp
c0104a2f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104a32:	83 ec 04             	sub    $0x4,%esp
c0104a35:	6a 7c                	push   $0x7c
c0104a37:	6a 00                	push   $0x0
c0104a39:	ff 75 f4             	pushl  -0xc(%ebp)
c0104a3c:	e8 ea 67 00 00       	call   c010b22b <Memset>
c0104a41:	83 c4 10             	add    $0x10,%esp
c0104a44:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104a47:	c7 40 78 06 00 00 00 	movl   $0x6,0x78(%eax)
c0104a4e:	83 ec 0c             	sub    $0xc,%esp
c0104a51:	ff 75 08             	pushl  0x8(%ebp)
c0104a54:	e8 32 14 00 00       	call   c0105e8b <get_physical_address>
c0104a59:	83 c4 10             	add    $0x10,%esp
c0104a5c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104a5f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104a62:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104a65:	89 50 44             	mov    %edx,0x44(%eax)
c0104a68:	8b 55 0c             	mov    0xc(%ebp),%edx
c0104a6b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104a6e:	89 50 74             	mov    %edx,0x74(%eax)
c0104a71:	83 ec 0c             	sub    $0xc,%esp
c0104a74:	ff 75 08             	pushl  0x8(%ebp)
c0104a77:	e8 e8 67 00 00       	call   c010b264 <Strlen>
c0104a7c:	83 c4 10             	add    $0x10,%esp
c0104a7f:	89 c2                	mov    %eax,%edx
c0104a81:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104a84:	89 50 40             	mov    %edx,0x40(%eax)
c0104a87:	83 ec 04             	sub    $0x4,%esp
c0104a8a:	6a 02                	push   $0x2
c0104a8c:	ff 75 f4             	pushl  -0xc(%ebp)
c0104a8f:	6a 03                	push   $0x3
c0104a91:	e8 88 47 00 00       	call   c010921e <send_rec>
c0104a96:	83 c4 10             	add    $0x10,%esp
c0104a99:	83 ec 08             	sub    $0x8,%esp
c0104a9c:	6a 7c                	push   $0x7c
c0104a9e:	ff 75 f4             	pushl  -0xc(%ebp)
c0104aa1:	e8 9b ca ff ff       	call   c0101541 <sys_free>
c0104aa6:	83 c4 10             	add    $0x10,%esp
c0104aa9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104aac:	8b 40 50             	mov    0x50(%eax),%eax
c0104aaf:	c9                   	leave  
c0104ab0:	c3                   	ret    

c0104ab1 <read>:
c0104ab1:	55                   	push   %ebp
c0104ab2:	89 e5                	mov    %esp,%ebp
c0104ab4:	83 ec 38             	sub    $0x38,%esp
c0104ab7:	c7 45 dc 7c 00 00 00 	movl   $0x7c,-0x24(%ebp)
c0104abe:	83 ec 0c             	sub    $0xc,%esp
c0104ac1:	ff 75 dc             	pushl  -0x24(%ebp)
c0104ac4:	e8 63 ca ff ff       	call   c010152c <sys_malloc>
c0104ac9:	83 c4 10             	add    $0x10,%esp
c0104acc:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0104acf:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104ad2:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0104ad7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104ada:	83 ec 0c             	sub    $0xc,%esp
c0104add:	ff 75 0c             	pushl  0xc(%ebp)
c0104ae0:	e8 a6 13 00 00       	call   c0105e8b <get_physical_address>
c0104ae5:	83 c4 10             	add    $0x10,%esp
c0104ae8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104aeb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104aee:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0104af3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0104af6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104af9:	05 ff 0f 00 00       	add    $0xfff,%eax
c0104afe:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0104b01:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0104b08:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0104b0f:	8b 55 10             	mov    0x10(%ebp),%edx
c0104b12:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104b15:	01 d0                	add    %edx,%eax
c0104b17:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
c0104b1a:	0f 83 a8 00 00 00    	jae    c0104bc8 <read+0x117>
c0104b20:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104b23:	2b 45 f0             	sub    -0x10(%ebp),%eax
c0104b26:	05 00 10 00 00       	add    $0x1000,%eax
c0104b2b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0104b2e:	8b 45 10             	mov    0x10(%ebp),%eax
c0104b31:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0104b34:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104b37:	83 ec 04             	sub    $0x4,%esp
c0104b3a:	50                   	push   %eax
c0104b3b:	6a 00                	push   $0x0
c0104b3d:	ff 75 d8             	pushl  -0x28(%ebp)
c0104b40:	e8 e6 66 00 00       	call   c010b22b <Memset>
c0104b45:	83 c4 10             	add    $0x10,%esp
c0104b48:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104b4b:	c7 40 78 07 00 00 00 	movl   $0x7,0x78(%eax)
c0104b52:	8b 55 08             	mov    0x8(%ebp),%edx
c0104b55:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104b58:	89 50 50             	mov    %edx,0x50(%eax)
c0104b5b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104b5e:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104b61:	89 50 10             	mov    %edx,0x10(%eax)
c0104b64:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104b67:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0104b6a:	89 50 60             	mov    %edx,0x60(%eax)
c0104b6d:	83 ec 04             	sub    $0x4,%esp
c0104b70:	6a 02                	push   $0x2
c0104b72:	ff 75 d8             	pushl  -0x28(%ebp)
c0104b75:	6a 03                	push   $0x3
c0104b77:	e8 a2 46 00 00       	call   c010921e <send_rec>
c0104b7c:	83 c4 10             	add    $0x10,%esp
c0104b7f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104b82:	8b 40 60             	mov    0x60(%eax),%eax
c0104b85:	01 45 e8             	add    %eax,-0x18(%ebp)
c0104b88:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0104b8b:	29 45 e0             	sub    %eax,-0x20(%ebp)
c0104b8e:	8b 45 10             	mov    0x10(%ebp),%eax
c0104b91:	2b 45 e4             	sub    -0x1c(%ebp),%eax
c0104b94:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0104b97:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0104b9a:	89 45 10             	mov    %eax,0x10(%ebp)
c0104b9d:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
c0104ba4:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c0104bab:	83 ec 0c             	sub    $0xc,%esp
c0104bae:	ff 75 f4             	pushl  -0xc(%ebp)
c0104bb1:	e8 d5 12 00 00       	call   c0105e8b <get_physical_address>
c0104bb6:	83 c4 10             	add    $0x10,%esp
c0104bb9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104bbc:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0104bc0:	0f 85 6e ff ff ff    	jne    c0104b34 <read+0x83>
c0104bc6:	eb 54                	jmp    c0104c1c <read+0x16b>
c0104bc8:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104bcb:	83 ec 04             	sub    $0x4,%esp
c0104bce:	50                   	push   %eax
c0104bcf:	6a 00                	push   $0x0
c0104bd1:	ff 75 d8             	pushl  -0x28(%ebp)
c0104bd4:	e8 52 66 00 00       	call   c010b22b <Memset>
c0104bd9:	83 c4 10             	add    $0x10,%esp
c0104bdc:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104bdf:	c7 40 78 07 00 00 00 	movl   $0x7,0x78(%eax)
c0104be6:	8b 55 08             	mov    0x8(%ebp),%edx
c0104be9:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104bec:	89 50 50             	mov    %edx,0x50(%eax)
c0104bef:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104bf2:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104bf5:	89 50 10             	mov    %edx,0x10(%eax)
c0104bf8:	8b 55 10             	mov    0x10(%ebp),%edx
c0104bfb:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104bfe:	89 50 60             	mov    %edx,0x60(%eax)
c0104c01:	83 ec 04             	sub    $0x4,%esp
c0104c04:	6a 02                	push   $0x2
c0104c06:	ff 75 d8             	pushl  -0x28(%ebp)
c0104c09:	6a 03                	push   $0x3
c0104c0b:	e8 0e 46 00 00       	call   c010921e <send_rec>
c0104c10:	83 c4 10             	add    $0x10,%esp
c0104c13:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104c16:	8b 40 60             	mov    0x60(%eax),%eax
c0104c19:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0104c1c:	83 ec 08             	sub    $0x8,%esp
c0104c1f:	ff 75 dc             	pushl  -0x24(%ebp)
c0104c22:	ff 75 d8             	pushl  -0x28(%ebp)
c0104c25:	e8 17 c9 ff ff       	call   c0101541 <sys_free>
c0104c2a:	83 c4 10             	add    $0x10,%esp
c0104c2d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104c30:	c9                   	leave  
c0104c31:	c3                   	ret    

c0104c32 <write>:
c0104c32:	55                   	push   %ebp
c0104c33:	89 e5                	mov    %esp,%ebp
c0104c35:	83 ec 18             	sub    $0x18,%esp
c0104c38:	c7 45 f4 7c 00 00 00 	movl   $0x7c,-0xc(%ebp)
c0104c3f:	83 ec 0c             	sub    $0xc,%esp
c0104c42:	ff 75 f4             	pushl  -0xc(%ebp)
c0104c45:	e8 e2 c8 ff ff       	call   c010152c <sys_malloc>
c0104c4a:	83 c4 10             	add    $0x10,%esp
c0104c4d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104c50:	83 ec 0c             	sub    $0xc,%esp
c0104c53:	ff 75 0c             	pushl  0xc(%ebp)
c0104c56:	e8 30 12 00 00       	call   c0105e8b <get_physical_address>
c0104c5b:	83 c4 10             	add    $0x10,%esp
c0104c5e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0104c61:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104c64:	c7 40 78 0a 00 00 00 	movl   $0xa,0x78(%eax)
c0104c6b:	8b 55 08             	mov    0x8(%ebp),%edx
c0104c6e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104c71:	89 50 50             	mov    %edx,0x50(%eax)
c0104c74:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104c77:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0104c7a:	89 50 10             	mov    %edx,0x10(%eax)
c0104c7d:	8b 55 10             	mov    0x10(%ebp),%edx
c0104c80:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104c83:	89 50 60             	mov    %edx,0x60(%eax)
c0104c86:	83 ec 04             	sub    $0x4,%esp
c0104c89:	6a 02                	push   $0x2
c0104c8b:	ff 75 f0             	pushl  -0x10(%ebp)
c0104c8e:	6a 03                	push   $0x3
c0104c90:	e8 89 45 00 00       	call   c010921e <send_rec>
c0104c95:	83 c4 10             	add    $0x10,%esp
c0104c98:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104c9b:	8b 40 60             	mov    0x60(%eax),%eax
c0104c9e:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0104ca1:	83 ec 08             	sub    $0x8,%esp
c0104ca4:	ff 75 f4             	pushl  -0xc(%ebp)
c0104ca7:	ff 75 f0             	pushl  -0x10(%ebp)
c0104caa:	e8 92 c8 ff ff       	call   c0101541 <sys_free>
c0104caf:	83 c4 10             	add    $0x10,%esp
c0104cb2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104cb5:	c9                   	leave  
c0104cb6:	c3                   	ret    

c0104cb7 <close>:
c0104cb7:	55                   	push   %ebp
c0104cb8:	89 e5                	mov    %esp,%ebp
c0104cba:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104cc0:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0104cc7:	8b 45 08             	mov    0x8(%ebp),%eax
c0104cca:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0104ccd:	83 ec 04             	sub    $0x4,%esp
c0104cd0:	6a 02                	push   $0x2
c0104cd2:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104cd8:	50                   	push   %eax
c0104cd9:	6a 03                	push   $0x3
c0104cdb:	e8 3e 45 00 00       	call   c010921e <send_rec>
c0104ce0:	83 c4 10             	add    $0x10,%esp
c0104ce3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104ce6:	83 f8 65             	cmp    $0x65,%eax
c0104ce9:	74 19                	je     c0104d04 <close+0x4d>
c0104ceb:	6a 13                	push   $0x13
c0104ced:	68 d3 a6 10 c0       	push   $0xc010a6d3
c0104cf2:	68 d3 a6 10 c0       	push   $0xc010a6d3
c0104cf7:	68 df a6 10 c0       	push   $0xc010a6df
c0104cfc:	e8 ad 38 00 00       	call   c01085ae <assertion_failure>
c0104d01:	83 c4 10             	add    $0x10,%esp
c0104d04:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0104d07:	c9                   	leave  
c0104d08:	c3                   	ret    

c0104d09 <wait>:
c0104d09:	55                   	push   %ebp
c0104d0a:	89 e5                	mov    %esp,%ebp
c0104d0c:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104d12:	c7 45 f4 09 00 00 00 	movl   $0x9,-0xc(%ebp)
c0104d19:	83 ec 04             	sub    $0x4,%esp
c0104d1c:	6a 01                	push   $0x1
c0104d1e:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104d24:	50                   	push   %eax
c0104d25:	6a 03                	push   $0x3
c0104d27:	e8 f2 44 00 00       	call   c010921e <send_rec>
c0104d2c:	83 c4 10             	add    $0x10,%esp
c0104d2f:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0104d32:	89 c2                	mov    %eax,%edx
c0104d34:	8b 45 08             	mov    0x8(%ebp),%eax
c0104d37:	89 10                	mov    %edx,(%eax)
c0104d39:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104d3c:	83 f8 21             	cmp    $0x21,%eax
c0104d3f:	74 05                	je     c0104d46 <wait+0x3d>
c0104d41:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104d44:	eb 05                	jmp    c0104d4b <wait+0x42>
c0104d46:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0104d4b:	c9                   	leave  
c0104d4c:	c3                   	ret    

c0104d4d <exit>:
c0104d4d:	55                   	push   %ebp
c0104d4e:	89 e5                	mov    %esp,%ebp
c0104d50:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104d56:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
c0104d5d:	8b 45 08             	mov    0x8(%ebp),%eax
c0104d60:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0104d63:	83 ec 04             	sub    $0x4,%esp
c0104d66:	6a 01                	push   $0x1
c0104d68:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104d6e:	50                   	push   %eax
c0104d6f:	6a 03                	push   $0x3
c0104d71:	e8 a8 44 00 00       	call   c010921e <send_rec>
c0104d76:	83 c4 10             	add    $0x10,%esp
c0104d79:	90                   	nop
c0104d7a:	c9                   	leave  
c0104d7b:	c3                   	ret    

c0104d7c <fork>:
c0104d7c:	55                   	push   %ebp
c0104d7d:	89 e5                	mov    %esp,%ebp
c0104d7f:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104d85:	83 ec 04             	sub    $0x4,%esp
c0104d88:	6a 7c                	push   $0x7c
c0104d8a:	6a 00                	push   $0x0
c0104d8c:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104d92:	50                   	push   %eax
c0104d93:	e8 93 64 00 00       	call   c010b22b <Memset>
c0104d98:	83 c4 10             	add    $0x10,%esp
c0104d9b:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
c0104da2:	83 ec 04             	sub    $0x4,%esp
c0104da5:	6a 01                	push   $0x1
c0104da7:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104dad:	50                   	push   %eax
c0104dae:	6a 03                	push   $0x3
c0104db0:	e8 69 44 00 00       	call   c010921e <send_rec>
c0104db5:	83 c4 10             	add    $0x10,%esp
c0104db8:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c0104dbf:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104dc2:	c9                   	leave  
c0104dc3:	c3                   	ret    

c0104dc4 <getpid>:
c0104dc4:	55                   	push   %ebp
c0104dc5:	89 e5                	mov    %esp,%ebp
c0104dc7:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104dcd:	c7 45 f4 05 00 00 00 	movl   $0x5,-0xc(%ebp)
c0104dd4:	83 ec 04             	sub    $0x4,%esp
c0104dd7:	6a 05                	push   $0x5
c0104dd9:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104ddf:	50                   	push   %eax
c0104de0:	6a 03                	push   $0x3
c0104de2:	e8 37 44 00 00       	call   c010921e <send_rec>
c0104de7:	83 c4 10             	add    $0x10,%esp
c0104dea:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104ded:	c9                   	leave  
c0104dee:	c3                   	ret    

c0104def <exec>:
c0104def:	55                   	push   %ebp
c0104df0:	89 e5                	mov    %esp,%ebp
c0104df2:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104df8:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0104dff:	8b 45 08             	mov    0x8(%ebp),%eax
c0104e02:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0104e05:	83 ec 0c             	sub    $0xc,%esp
c0104e08:	ff 75 08             	pushl  0x8(%ebp)
c0104e0b:	e8 54 64 00 00       	call   c010b264 <Strlen>
c0104e10:	83 c4 10             	add    $0x10,%esp
c0104e13:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0104e16:	c7 45 8c 00 00 00 00 	movl   $0x0,-0x74(%ebp)
c0104e1d:	c7 45 98 00 00 00 00 	movl   $0x0,-0x68(%ebp)
c0104e24:	83 ec 04             	sub    $0x4,%esp
c0104e27:	6a 01                	push   $0x1
c0104e29:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104e2f:	50                   	push   %eax
c0104e30:	6a 03                	push   $0x3
c0104e32:	e8 e7 43 00 00       	call   c010921e <send_rec>
c0104e37:	83 c4 10             	add    $0x10,%esp
c0104e3a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104e3d:	83 f8 65             	cmp    $0x65,%eax
c0104e40:	74 19                	je     c0104e5b <exec+0x6c>
c0104e42:	6a 19                	push   $0x19
c0104e44:	68 f7 a6 10 c0       	push   $0xc010a6f7
c0104e49:	68 f7 a6 10 c0       	push   $0xc010a6f7
c0104e4e:	68 02 a7 10 c0       	push   $0xc010a702
c0104e53:	e8 56 37 00 00       	call   c01085ae <assertion_failure>
c0104e58:	83 c4 10             	add    $0x10,%esp
c0104e5b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0104e5e:	c9                   	leave  
c0104e5f:	c3                   	ret    

c0104e60 <execv>:
c0104e60:	55                   	push   %ebp
c0104e61:	89 e5                	mov    %esp,%ebp
c0104e63:	81 ec b8 00 00 00    	sub    $0xb8,%esp
c0104e69:	c7 45 e0 00 01 00 00 	movl   $0x100,-0x20(%ebp)
c0104e70:	83 ec 0c             	sub    $0xc,%esp
c0104e73:	ff 75 e0             	pushl  -0x20(%ebp)
c0104e76:	e8 b1 c6 ff ff       	call   c010152c <sys_malloc>
c0104e7b:	83 c4 10             	add    $0x10,%esp
c0104e7e:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0104e81:	66 87 db             	xchg   %bx,%bx
c0104e84:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0104e87:	83 ec 04             	sub    $0x4,%esp
c0104e8a:	50                   	push   %eax
c0104e8b:	6a 00                	push   $0x0
c0104e8d:	ff 75 dc             	pushl  -0x24(%ebp)
c0104e90:	e8 96 63 00 00       	call   c010b22b <Memset>
c0104e95:	83 c4 10             	add    $0x10,%esp
c0104e98:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104e9b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104e9e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0104ea5:	eb 23                	jmp    c0104eca <execv+0x6a>
c0104ea7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104eaa:	8b 00                	mov    (%eax),%eax
c0104eac:	83 ec 08             	sub    $0x8,%esp
c0104eaf:	50                   	push   %eax
c0104eb0:	68 1a a7 10 c0       	push   $0xc010a71a
c0104eb5:	e8 97 33 00 00       	call   c0108251 <Printf>
c0104eba:	83 c4 10             	add    $0x10,%esp
c0104ebd:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
c0104ec1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104ec4:	83 c0 04             	add    $0x4,%eax
c0104ec7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104eca:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104ecd:	8b 00                	mov    (%eax),%eax
c0104ecf:	85 c0                	test   %eax,%eax
c0104ed1:	75 d4                	jne    c0104ea7 <execv+0x47>
c0104ed3:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104ed6:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104ed9:	01 d0                	add    %edx,%eax
c0104edb:	c6 00 00             	movb   $0x0,(%eax)
c0104ede:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104ee1:	83 c0 04             	add    $0x4,%eax
c0104ee4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104ee7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104eea:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0104eed:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104ef0:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0104ef3:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0104efa:	eb 5b                	jmp    c0104f57 <execv+0xf7>
c0104efc:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104eff:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104f02:	01 c2                	add    %eax,%edx
c0104f04:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104f07:	89 10                	mov    %edx,(%eax)
c0104f09:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104f0c:	8b 00                	mov    (%eax),%eax
c0104f0e:	8b 4d f0             	mov    -0x10(%ebp),%ecx
c0104f11:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0104f14:	01 ca                	add    %ecx,%edx
c0104f16:	83 ec 08             	sub    $0x8,%esp
c0104f19:	50                   	push   %eax
c0104f1a:	52                   	push   %edx
c0104f1b:	e8 2a 63 00 00       	call   c010b24a <Strcpy>
c0104f20:	83 c4 10             	add    $0x10,%esp
c0104f23:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104f26:	8b 00                	mov    (%eax),%eax
c0104f28:	83 ec 0c             	sub    $0xc,%esp
c0104f2b:	50                   	push   %eax
c0104f2c:	e8 33 63 00 00       	call   c010b264 <Strlen>
c0104f31:	83 c4 10             	add    $0x10,%esp
c0104f34:	01 45 f0             	add    %eax,-0x10(%ebp)
c0104f37:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104f3a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104f3d:	01 d0                	add    %edx,%eax
c0104f3f:	c6 00 00             	movb   $0x0,(%eax)
c0104f42:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104f45:	83 c0 01             	add    $0x1,%eax
c0104f48:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104f4b:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
c0104f4f:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c0104f53:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0104f57:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104f5a:	8b 00                	mov    (%eax),%eax
c0104f5c:	85 c0                	test   %eax,%eax
c0104f5e:	75 9c                	jne    c0104efc <execv+0x9c>
c0104f60:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104f63:	ba 00 00 00 c0       	mov    $0xc0000000,%edx
c0104f68:	29 c2                	sub    %eax,%edx
c0104f6a:	89 d0                	mov    %edx,%eax
c0104f6c:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0104f6f:	83 ec 0c             	sub    $0xc,%esp
c0104f72:	ff 75 08             	pushl  0x8(%ebp)
c0104f75:	e8 11 0f 00 00       	call   c0105e8b <get_physical_address>
c0104f7a:	83 c4 10             	add    $0x10,%esp
c0104f7d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0104f80:	83 ec 0c             	sub    $0xc,%esp
c0104f83:	ff 75 dc             	pushl  -0x24(%ebp)
c0104f86:	e8 00 0f 00 00       	call   c0105e8b <get_physical_address>
c0104f8b:	83 c4 10             	add    $0x10,%esp
c0104f8e:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0104f91:	83 ec 0c             	sub    $0xc,%esp
c0104f94:	ff 75 d8             	pushl  -0x28(%ebp)
c0104f97:	e8 ef 0e 00 00       	call   c0105e8b <get_physical_address>
c0104f9c:	83 c4 10             	add    $0x10,%esp
c0104f9f:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0104fa2:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
c0104fa9:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0104fac:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0104faf:	83 ec 0c             	sub    $0xc,%esp
c0104fb2:	ff 75 08             	pushl  0x8(%ebp)
c0104fb5:	e8 aa 62 00 00       	call   c010b264 <Strlen>
c0104fba:	83 c4 10             	add    $0x10,%esp
c0104fbd:	89 45 90             	mov    %eax,-0x70(%ebp)
c0104fc0:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0104fc3:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
c0104fc9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104fcc:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c0104fd2:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104fd5:	89 85 70 ff ff ff    	mov    %eax,-0x90(%ebp)
c0104fdb:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0104fde:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
c0104fe4:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104fe7:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0104fed:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104ff0:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0104ff3:	29 c2                	sub    %eax,%edx
c0104ff5:	89 d0                	mov    %edx,%eax
c0104ff7:	89 85 7c ff ff ff    	mov    %eax,-0x84(%ebp)
c0104ffd:	83 ec 04             	sub    $0x4,%esp
c0105000:	6a 01                	push   $0x1
c0105002:	8d 85 50 ff ff ff    	lea    -0xb0(%ebp),%eax
c0105008:	50                   	push   %eax
c0105009:	6a 03                	push   $0x3
c010500b:	e8 0e 42 00 00       	call   c010921e <send_rec>
c0105010:	83 c4 10             	add    $0x10,%esp
c0105013:	83 ec 08             	sub    $0x8,%esp
c0105016:	68 00 04 00 00       	push   $0x400
c010501b:	ff 75 dc             	pushl  -0x24(%ebp)
c010501e:	e8 1e c5 ff ff       	call   c0101541 <sys_free>
c0105023:	83 c4 10             	add    $0x10,%esp
c0105026:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0105029:	83 f8 65             	cmp    $0x65,%eax
c010502c:	74 1c                	je     c010504a <execv+0x1ea>
c010502e:	68 95 00 00 00       	push   $0x95
c0105033:	68 f7 a6 10 c0       	push   $0xc010a6f7
c0105038:	68 f7 a6 10 c0       	push   $0xc010a6f7
c010503d:	68 02 a7 10 c0       	push   $0xc010a702
c0105042:	e8 67 35 00 00       	call   c01085ae <assertion_failure>
c0105047:	83 c4 10             	add    $0x10,%esp
c010504a:	8b 45 a8             	mov    -0x58(%ebp),%eax
c010504d:	c9                   	leave  
c010504e:	c3                   	ret    

c010504f <execl>:
c010504f:	55                   	push   %ebp
c0105050:	89 e5                	mov    %esp,%ebp
c0105052:	83 ec 18             	sub    $0x18,%esp
c0105055:	8d 45 0c             	lea    0xc(%ebp),%eax
c0105058:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010505b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010505e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105061:	83 ec 08             	sub    $0x8,%esp
c0105064:	ff 75 f0             	pushl  -0x10(%ebp)
c0105067:	ff 75 08             	pushl  0x8(%ebp)
c010506a:	e8 f1 fd ff ff       	call   c0104e60 <execv>
c010506f:	83 c4 10             	add    $0x10,%esp
c0105072:	c9                   	leave  
c0105073:	c3                   	ret    

c0105074 <TaskMM>:
c0105074:	55                   	push   %ebp
c0105075:	89 e5                	mov    %esp,%ebp
c0105077:	83 ec 28             	sub    $0x28,%esp
c010507a:	83 ec 0c             	sub    $0xc,%esp
c010507d:	6a 7c                	push   $0x7c
c010507f:	e8 a8 c4 ff ff       	call   c010152c <sys_malloc>
c0105084:	83 c4 10             	add    $0x10,%esp
c0105087:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010508a:	83 ec 0c             	sub    $0xc,%esp
c010508d:	6a 7c                	push   $0x7c
c010508f:	e8 98 c4 ff ff       	call   c010152c <sys_malloc>
c0105094:	83 c4 10             	add    $0x10,%esp
c0105097:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010509a:	83 ec 04             	sub    $0x4,%esp
c010509d:	6a 12                	push   $0x12
c010509f:	ff 75 f0             	pushl  -0x10(%ebp)
c01050a2:	6a 02                	push   $0x2
c01050a4:	e8 75 41 00 00       	call   c010921e <send_rec>
c01050a9:	83 c4 10             	add    $0x10,%esp
c01050ac:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01050af:	8b 40 78             	mov    0x78(%eax),%eax
c01050b2:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01050b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01050b8:	8b 00                	mov    (%eax),%eax
c01050ba:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01050bd:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c01050c4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01050c7:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c01050ce:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01050d1:	c7 40 58 00 00 00 00 	movl   $0x0,0x58(%eax)
c01050d8:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c01050dc:	74 4e                	je     c010512c <TaskMM+0xb8>
c01050de:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c01050e2:	7f 08                	jg     c01050ec <TaskMM+0x78>
c01050e4:	83 7d e8 02          	cmpl   $0x2,-0x18(%ebp)
c01050e8:	74 28                	je     c0105112 <TaskMM+0x9e>
c01050ea:	eb 71                	jmp    c010515d <TaskMM+0xe9>
c01050ec:	83 7d e8 04          	cmpl   $0x4,-0x18(%ebp)
c01050f0:	74 08                	je     c01050fa <TaskMM+0x86>
c01050f2:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c01050f6:	74 4e                	je     c0105146 <TaskMM+0xd2>
c01050f8:	eb 63                	jmp    c010515d <TaskMM+0xe9>
c01050fa:	83 ec 0c             	sub    $0xc,%esp
c01050fd:	ff 75 f0             	pushl  -0x10(%ebp)
c0105100:	e8 d0 04 00 00       	call   c01055d5 <do_fork>
c0105105:	83 c4 10             	add    $0x10,%esp
c0105108:	89 c2                	mov    %eax,%edx
c010510a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010510d:	89 50 5c             	mov    %edx,0x5c(%eax)
c0105110:	eb 5c                	jmp    c010516e <TaskMM+0xfa>
c0105112:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0105119:	66 87 db             	xchg   %bx,%bx
c010511c:	83 ec 0c             	sub    $0xc,%esp
c010511f:	ff 75 f0             	pushl  -0x10(%ebp)
c0105122:	e8 95 00 00 00       	call   c01051bc <do_exec>
c0105127:	83 c4 10             	add    $0x10,%esp
c010512a:	eb 42                	jmp    c010516e <TaskMM+0xfa>
c010512c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0105133:	83 ec 08             	sub    $0x8,%esp
c0105136:	ff 75 e0             	pushl  -0x20(%ebp)
c0105139:	ff 75 f0             	pushl  -0x10(%ebp)
c010513c:	e8 02 05 00 00       	call   c0105643 <do_exit>
c0105141:	83 c4 10             	add    $0x10,%esp
c0105144:	eb 28                	jmp    c010516e <TaskMM+0xfa>
c0105146:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010514d:	83 ec 0c             	sub    $0xc,%esp
c0105150:	ff 75 f0             	pushl  -0x10(%ebp)
c0105153:	e8 75 05 00 00       	call   c01056cd <do_wait>
c0105158:	83 c4 10             	add    $0x10,%esp
c010515b:	eb 11                	jmp    c010516e <TaskMM+0xfa>
c010515d:	83 ec 0c             	sub    $0xc,%esp
c0105160:	68 24 a7 10 c0       	push   $0xc010a724
c0105165:	e8 26 34 00 00       	call   c0108590 <panic>
c010516a:	83 c4 10             	add    $0x10,%esp
c010516d:	90                   	nop
c010516e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0105172:	0f 84 22 ff ff ff    	je     c010509a <TaskMM+0x26>
c0105178:	83 ec 0c             	sub    $0xc,%esp
c010517b:	6a 03                	push   $0x3
c010517d:	e8 9b 2f 00 00       	call   c010811d <delay>
c0105182:	83 c4 10             	add    $0x10,%esp
c0105185:	83 ec 04             	sub    $0x4,%esp
c0105188:	ff 75 e4             	pushl  -0x1c(%ebp)
c010518b:	ff 75 ec             	pushl  -0x14(%ebp)
c010518e:	6a 01                	push   $0x1
c0105190:	e8 89 40 00 00       	call   c010921e <send_rec>
c0105195:	83 c4 10             	add    $0x10,%esp
c0105198:	e9 fd fe ff ff       	jmp    c010509a <TaskMM+0x26>

c010519d <alloc_mem>:
c010519d:	55                   	push   %ebp
c010519e:	89 e5                	mov    %esp,%ebp
c01051a0:	83 ec 10             	sub    $0x10,%esp
c01051a3:	8b 45 08             	mov    0x8(%ebp),%eax
c01051a6:	83 e8 08             	sub    $0x8,%eax
c01051a9:	69 c0 00 10 10 00    	imul   $0x101000,%eax,%eax
c01051af:	05 00 00 a0 00       	add    $0xa00000,%eax
c01051b4:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01051b7:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01051ba:	c9                   	leave  
c01051bb:	c3                   	ret    

c01051bc <do_exec>:
c01051bc:	55                   	push   %ebp
c01051bd:	89 e5                	mov    %esp,%ebp
c01051bf:	81 ec 38 01 00 00    	sub    $0x138,%esp
c01051c5:	c7 85 56 ff ff ff 64 	movl   $0x5f766564,-0xaa(%ebp)
c01051cc:	65 76 5f 
c01051cf:	c7 85 5a ff ff ff 74 	movl   $0x31797474,-0xa6(%ebp)
c01051d6:	74 79 31 
c01051d9:	66 c7 85 5e ff ff ff 	movw   $0x0,-0xa2(%ebp)
c01051e0:	00 00 
c01051e2:	83 ec 08             	sub    $0x8,%esp
c01051e5:	6a 00                	push   $0x0
c01051e7:	8d 85 56 ff ff ff    	lea    -0xaa(%ebp),%eax
c01051ed:	50                   	push   %eax
c01051ee:	e8 29 f8 ff ff       	call   c0104a1c <open>
c01051f3:	83 c4 10             	add    $0x10,%esp
c01051f6:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01051f9:	8b 45 08             	mov    0x8(%ebp),%eax
c01051fc:	8b 00                	mov    (%eax),%eax
c01051fe:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0105201:	c7 45 d0 00 40 03 00 	movl   $0x34000,-0x30(%ebp)
c0105208:	8b 45 d0             	mov    -0x30(%ebp),%eax
c010520b:	83 ec 0c             	sub    $0xc,%esp
c010520e:	50                   	push   %eax
c010520f:	e8 18 c3 ff ff       	call   c010152c <sys_malloc>
c0105214:	83 c4 10             	add    $0x10,%esp
c0105217:	89 45 cc             	mov    %eax,-0x34(%ebp)
c010521a:	83 ec 04             	sub    $0x4,%esp
c010521d:	ff 75 d0             	pushl  -0x30(%ebp)
c0105220:	6a 00                	push   $0x0
c0105222:	ff 75 cc             	pushl  -0x34(%ebp)
c0105225:	e8 01 60 00 00       	call   c010b22b <Memset>
c010522a:	83 c4 10             	add    $0x10,%esp
c010522d:	83 ec 04             	sub    $0x4,%esp
c0105230:	6a 0c                	push   $0xc
c0105232:	6a 00                	push   $0x0
c0105234:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c010523a:	50                   	push   %eax
c010523b:	e8 eb 5f 00 00       	call   c010b22b <Memset>
c0105240:	83 c4 10             	add    $0x10,%esp
c0105243:	8b 45 08             	mov    0x8(%ebp),%eax
c0105246:	8b 40 44             	mov    0x44(%eax),%eax
c0105249:	89 45 c8             	mov    %eax,-0x38(%ebp)
c010524c:	8b 45 08             	mov    0x8(%ebp),%eax
c010524f:	8b 40 40             	mov    0x40(%eax),%eax
c0105252:	83 ec 08             	sub    $0x8,%esp
c0105255:	50                   	push   %eax
c0105256:	ff 75 c8             	pushl  -0x38(%ebp)
c0105259:	e8 de 0a 00 00       	call   c0105d3c <alloc_virtual_memory>
c010525e:	83 c4 10             	add    $0x10,%esp
c0105261:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0105264:	8b 45 08             	mov    0x8(%ebp),%eax
c0105267:	8b 40 40             	mov    0x40(%eax),%eax
c010526a:	89 c2                	mov    %eax,%edx
c010526c:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c010526f:	83 ec 04             	sub    $0x4,%esp
c0105272:	52                   	push   %edx
c0105273:	50                   	push   %eax
c0105274:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c010527a:	50                   	push   %eax
c010527b:	e8 29 19 00 00       	call   c0106ba9 <Memcpy>
c0105280:	83 c4 10             	add    $0x10,%esp
c0105283:	8b 45 08             	mov    0x8(%ebp),%eax
c0105286:	8b 40 40             	mov    0x40(%eax),%eax
c0105289:	c6 84 05 4a ff ff ff 	movb   $0x0,-0xb6(%ebp,%eax,1)
c0105290:	00 
c0105291:	83 ec 08             	sub    $0x8,%esp
c0105294:	6a 00                	push   $0x0
c0105296:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c010529c:	50                   	push   %eax
c010529d:	e8 7a f7 ff ff       	call   c0104a1c <open>
c01052a2:	83 c4 10             	add    $0x10,%esp
c01052a5:	89 45 c0             	mov    %eax,-0x40(%ebp)
c01052a8:	83 7d c0 ff          	cmpl   $0xffffffff,-0x40(%ebp)
c01052ac:	75 15                	jne    c01052c3 <do_exec+0x107>
c01052ae:	83 ec 0c             	sub    $0xc,%esp
c01052b1:	68 35 a7 10 c0       	push   $0xc010a735
c01052b6:	e8 96 2f 00 00       	call   c0108251 <Printf>
c01052bb:	83 c4 10             	add    $0x10,%esp
c01052be:	e9 10 03 00 00       	jmp    c01055d3 <do_exec+0x417>
c01052c3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01052ca:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01052cd:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01052d0:	01 d0                	add    %edx,%eax
c01052d2:	83 ec 04             	sub    $0x4,%esp
c01052d5:	68 00 10 00 00       	push   $0x1000
c01052da:	50                   	push   %eax
c01052db:	ff 75 c0             	pushl  -0x40(%ebp)
c01052de:	e8 ce f7 ff ff       	call   c0104ab1 <read>
c01052e3:	83 c4 10             	add    $0x10,%esp
c01052e6:	89 45 bc             	mov    %eax,-0x44(%ebp)
c01052e9:	8b 45 bc             	mov    -0x44(%ebp),%eax
c01052ec:	01 45 f4             	add    %eax,-0xc(%ebp)
c01052ef:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
c01052f3:	74 0a                	je     c01052ff <do_exec+0x143>
c01052f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01052f8:	3b 45 d0             	cmp    -0x30(%ebp),%eax
c01052fb:	7d 05                	jge    c0105302 <do_exec+0x146>
c01052fd:	eb cb                	jmp    c01052ca <do_exec+0x10e>
c01052ff:	90                   	nop
c0105300:	eb 01                	jmp    c0105303 <do_exec+0x147>
c0105302:	90                   	nop
c0105303:	83 ec 0c             	sub    $0xc,%esp
c0105306:	ff 75 c0             	pushl  -0x40(%ebp)
c0105309:	e8 a9 f9 ff ff       	call   c0104cb7 <close>
c010530e:	83 c4 10             	add    $0x10,%esp
c0105311:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0105314:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0105317:	8b 45 b8             	mov    -0x48(%ebp),%eax
c010531a:	8b 40 18             	mov    0x18(%eax),%eax
c010531d:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0105320:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0105327:	e9 04 01 00 00       	jmp    c0105430 <do_exec+0x274>
c010532c:	8b 45 b8             	mov    -0x48(%ebp),%eax
c010532f:	0f b7 40 28          	movzwl 0x28(%eax),%eax
c0105333:	0f b7 d0             	movzwl %ax,%edx
c0105336:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0105339:	0f b7 40 2a          	movzwl 0x2a(%eax),%eax
c010533d:	0f b7 c0             	movzwl %ax,%eax
c0105340:	0f af 45 f0          	imul   -0x10(%ebp),%eax
c0105344:	01 c2                	add    %eax,%edx
c0105346:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0105349:	01 d0                	add    %edx,%eax
c010534b:	89 45 b0             	mov    %eax,-0x50(%ebp)
c010534e:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0105351:	8b 40 10             	mov    0x10(%eax),%eax
c0105354:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0105357:	8b 45 ac             	mov    -0x54(%ebp),%eax
c010535a:	05 ff 0f 00 00       	add    $0xfff,%eax
c010535f:	c1 e8 0c             	shr    $0xc,%eax
c0105362:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0105365:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0105368:	8b 40 08             	mov    0x8(%eax),%eax
c010536b:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c010536e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0105375:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0105378:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c010537b:	89 45 a0             	mov    %eax,-0x60(%ebp)
c010537e:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0105381:	8b 50 04             	mov    0x4(%eax),%edx
c0105384:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0105387:	01 d0                	add    %edx,%eax
c0105389:	89 45 9c             	mov    %eax,-0x64(%ebp)
c010538c:	83 7d ac 00          	cmpl   $0x0,-0x54(%ebp)
c0105390:	0f 84 95 00 00 00    	je     c010542b <do_exec+0x26f>
c0105396:	83 ec 04             	sub    $0x4,%esp
c0105399:	ff 75 d4             	pushl  -0x2c(%ebp)
c010539c:	ff 75 a8             	pushl  -0x58(%ebp)
c010539f:	ff 75 a4             	pushl  -0x5c(%ebp)
c01053a2:	e8 a0 07 00 00       	call   c0105b47 <get_virtual_address_start_with_addr>
c01053a7:	83 c4 10             	add    $0x10,%esp
c01053aa:	89 45 98             	mov    %eax,-0x68(%ebp)
c01053ad:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c01053b0:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01053b3:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01053ba:	eb 41                	jmp    c01053fd <do_exec+0x241>
c01053bc:	83 ec 08             	sub    $0x8,%esp
c01053bf:	ff 75 d4             	pushl  -0x2c(%ebp)
c01053c2:	ff 75 e8             	pushl  -0x18(%ebp)
c01053c5:	e8 f3 0a 00 00       	call   c0105ebd <alloc_physical_memory_of_proc>
c01053ca:	83 c4 10             	add    $0x10,%esp
c01053cd:	89 45 94             	mov    %eax,-0x6c(%ebp)
c01053d0:	83 ec 08             	sub    $0x8,%esp
c01053d3:	68 00 10 00 00       	push   $0x1000
c01053d8:	ff 75 94             	pushl  -0x6c(%ebp)
c01053db:	e8 5c 09 00 00       	call   c0105d3c <alloc_virtual_memory>
c01053e0:	83 c4 10             	add    $0x10,%esp
c01053e3:	89 45 90             	mov    %eax,-0x70(%ebp)
c01053e6:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c01053ea:	75 06                	jne    c01053f2 <do_exec+0x236>
c01053ec:	8b 45 90             	mov    -0x70(%ebp),%eax
c01053ef:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01053f2:	81 45 e8 00 10 00 00 	addl   $0x1000,-0x18(%ebp)
c01053f9:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c01053fd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105400:	39 45 a8             	cmp    %eax,-0x58(%ebp)
c0105403:	77 b7                	ja     c01053bc <do_exec+0x200>
c0105405:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0105408:	8b 40 10             	mov    0x10(%eax),%eax
c010540b:	89 c1                	mov    %eax,%ecx
c010540d:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0105410:	8b 50 04             	mov    0x4(%eax),%edx
c0105413:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0105416:	01 c2                	add    %eax,%edx
c0105418:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010541b:	83 ec 04             	sub    $0x4,%esp
c010541e:	51                   	push   %ecx
c010541f:	52                   	push   %edx
c0105420:	50                   	push   %eax
c0105421:	e8 83 17 00 00       	call   c0106ba9 <Memcpy>
c0105426:	83 c4 10             	add    $0x10,%esp
c0105429:	eb 01                	jmp    c010542c <do_exec+0x270>
c010542b:	90                   	nop
c010542c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0105430:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0105433:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
c0105437:	0f b7 c0             	movzwl %ax,%eax
c010543a:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c010543d:	0f 8c e9 fe ff ff    	jl     c010532c <do_exec+0x170>
c0105443:	8b 45 08             	mov    0x8(%ebp),%eax
c0105446:	8b 40 10             	mov    0x10(%eax),%eax
c0105449:	89 45 8c             	mov    %eax,-0x74(%ebp)
c010544c:	8b 45 08             	mov    0x8(%ebp),%eax
c010544f:	8b 40 1c             	mov    0x1c(%eax),%eax
c0105452:	89 45 88             	mov    %eax,-0x78(%ebp)
c0105455:	8b 45 08             	mov    0x8(%ebp),%eax
c0105458:	8b 40 24             	mov    0x24(%eax),%eax
c010545b:	89 45 84             	mov    %eax,-0x7c(%ebp)
c010545e:	83 ec 0c             	sub    $0xc,%esp
c0105461:	ff 75 d4             	pushl  -0x2c(%ebp)
c0105464:	e8 9d e2 ff ff       	call   c0103706 <pid2proc>
c0105469:	83 c4 10             	add    $0x10,%esp
c010546c:	89 45 80             	mov    %eax,-0x80(%ebp)
c010546f:	8b 45 08             	mov    0x8(%ebp),%eax
c0105472:	8b 40 10             	mov    0x10(%eax),%eax
c0105475:	89 85 7c ff ff ff    	mov    %eax,-0x84(%ebp)
c010547b:	83 ec 08             	sub    $0x8,%esp
c010547e:	ff 75 88             	pushl  -0x78(%ebp)
c0105481:	ff b5 7c ff ff ff    	pushl  -0x84(%ebp)
c0105487:	e8 b0 08 00 00       	call   c0105d3c <alloc_virtual_memory>
c010548c:	83 c4 10             	add    $0x10,%esp
c010548f:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0105495:	8b 45 08             	mov    0x8(%ebp),%eax
c0105498:	8b 40 2c             	mov    0x2c(%eax),%eax
c010549b:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
c01054a1:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c01054a8:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01054ae:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01054b1:	eb 1a                	jmp    c01054cd <do_exec+0x311>
c01054b3:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c01054b7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01054ba:	8b 10                	mov    (%eax),%edx
c01054bc:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c01054c2:	01 c2                	add    %eax,%edx
c01054c4:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01054c7:	89 10                	mov    %edx,(%eax)
c01054c9:	83 45 dc 04          	addl   $0x4,-0x24(%ebp)
c01054cd:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01054d0:	8b 00                	mov    (%eax),%eax
c01054d2:	85 c0                	test   %eax,%eax
c01054d4:	75 dd                	jne    c01054b3 <do_exec+0x2f7>
c01054d6:	83 ec 0c             	sub    $0xc,%esp
c01054d9:	ff 75 84             	pushl  -0x7c(%ebp)
c01054dc:	e8 5b 08 00 00       	call   c0105d3c <alloc_virtual_memory>
c01054e1:	83 c4 10             	add    $0x10,%esp
c01054e4:	89 85 70 ff ff ff    	mov    %eax,-0x90(%ebp)
c01054ea:	8b 95 78 ff ff ff    	mov    -0x88(%ebp),%edx
c01054f0:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
c01054f6:	83 ec 04             	sub    $0x4,%esp
c01054f9:	ff 75 88             	pushl  -0x78(%ebp)
c01054fc:	52                   	push   %edx
c01054fd:	50                   	push   %eax
c01054fe:	e8 a6 16 00 00       	call   c0106ba9 <Memcpy>
c0105503:	83 c4 10             	add    $0x10,%esp
c0105506:	8b 45 08             	mov    0x8(%ebp),%eax
c0105509:	8b 40 28             	mov    0x28(%eax),%eax
c010550c:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c0105512:	83 ec 08             	sub    $0x8,%esp
c0105515:	ff 75 d4             	pushl  -0x2c(%ebp)
c0105518:	ff 75 80             	pushl  -0x80(%ebp)
c010551b:	e8 ef 08 00 00       	call   c0105e0f <get_physical_address_proc>
c0105520:	83 c4 10             	add    $0x10,%esp
c0105523:	89 85 68 ff ff ff    	mov    %eax,-0x98(%ebp)
c0105529:	83 ec 08             	sub    $0x8,%esp
c010552c:	68 00 10 00 00       	push   $0x1000
c0105531:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
c0105537:	e8 00 08 00 00       	call   c0105d3c <alloc_virtual_memory>
c010553c:	83 c4 10             	add    $0x10,%esp
c010553f:	89 85 64 ff ff ff    	mov    %eax,-0x9c(%ebp)
c0105545:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
c010554b:	05 bc 0f 00 00       	add    $0xfbc,%eax
c0105550:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
c0105556:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c010555c:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0105562:	89 50 20             	mov    %edx,0x20(%eax)
c0105565:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0105568:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c010556e:	89 50 28             	mov    %edx,0x28(%eax)
c0105571:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0105574:	8b 40 18             	mov    0x18(%eax),%eax
c0105577:	89 c2                	mov    %eax,%edx
c0105579:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c010557f:	89 50 30             	mov    %edx,0x30(%eax)
c0105582:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c0105588:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c010558e:	89 50 3c             	mov    %edx,0x3c(%eax)
c0105591:	8b 45 80             	mov    -0x80(%ebp),%eax
c0105594:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c010559b:	00 00 00 
c010559e:	c7 85 44 ff ff ff 65 	movl   $0x65,-0xbc(%ebp)
c01055a5:	00 00 00 
c01055a8:	c7 85 24 ff ff ff 00 	movl   $0x0,-0xdc(%ebp)
c01055af:	00 00 00 
c01055b2:	c7 85 28 ff ff ff 00 	movl   $0x0,-0xd8(%ebp)
c01055b9:	00 00 00 
c01055bc:	83 ec 04             	sub    $0x4,%esp
c01055bf:	ff 75 d4             	pushl  -0x2c(%ebp)
c01055c2:	8d 85 cc fe ff ff    	lea    -0x134(%ebp),%eax
c01055c8:	50                   	push   %eax
c01055c9:	6a 01                	push   $0x1
c01055cb:	e8 4e 3c 00 00       	call   c010921e <send_rec>
c01055d0:	83 c4 10             	add    $0x10,%esp
c01055d3:	c9                   	leave  
c01055d4:	c3                   	ret    

c01055d5 <do_fork>:
c01055d5:	55                   	push   %ebp
c01055d6:	89 e5                	mov    %esp,%ebp
c01055d8:	81 ec 98 00 00 00    	sub    $0x98,%esp
c01055de:	8b 45 08             	mov    0x8(%ebp),%eax
c01055e1:	8b 00                	mov    (%eax),%eax
c01055e3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01055e6:	83 ec 0c             	sub    $0xc,%esp
c01055e9:	ff 75 f4             	pushl  -0xc(%ebp)
c01055ec:	e8 28 45 00 00       	call   c0109b19 <fork_process>
c01055f1:	83 c4 10             	add    $0x10,%esp
c01055f4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01055f7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01055fa:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c0105600:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105603:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105606:	8b 90 14 01 00 00    	mov    0x114(%eax),%edx
c010560c:	8b 45 08             	mov    0x8(%ebp),%eax
c010560f:	89 50 5c             	mov    %edx,0x5c(%eax)
c0105612:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c0105619:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0105620:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0105627:	83 ec 04             	sub    $0x4,%esp
c010562a:	ff 75 ec             	pushl  -0x14(%ebp)
c010562d:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
c0105633:	50                   	push   %eax
c0105634:	6a 01                	push   $0x1
c0105636:	e8 e3 3b 00 00       	call   c010921e <send_rec>
c010563b:	83 c4 10             	add    $0x10,%esp
c010563e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105641:	c9                   	leave  
c0105642:	c3                   	ret    

c0105643 <do_exit>:
c0105643:	55                   	push   %ebp
c0105644:	89 e5                	mov    %esp,%ebp
c0105646:	83 ec 18             	sub    $0x18,%esp
c0105649:	8b 45 08             	mov    0x8(%ebp),%eax
c010564c:	8b 00                	mov    (%eax),%eax
c010564e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105651:	83 ec 0c             	sub    $0xc,%esp
c0105654:	ff 75 f4             	pushl  -0xc(%ebp)
c0105657:	e8 aa e0 ff ff       	call   c0103706 <pid2proc>
c010565c:	83 c4 10             	add    $0x10,%esp
c010565f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105662:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105665:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c010566b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010566e:	83 ec 0c             	sub    $0xc,%esp
c0105671:	ff 75 ec             	pushl  -0x14(%ebp)
c0105674:	e8 8d e0 ff ff       	call   c0103706 <pid2proc>
c0105679:	83 c4 10             	add    $0x10,%esp
c010567c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010567f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0105683:	74 45                	je     c01056ca <do_exit+0x87>
c0105685:	8b 45 08             	mov    0x8(%ebp),%eax
c0105688:	8b 40 54             	mov    0x54(%eax),%eax
c010568b:	89 c2                	mov    %eax,%edx
c010568d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105690:	89 90 5c 02 00 00    	mov    %edx,0x25c(%eax)
c0105696:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105699:	0f b6 80 3d 02 00 00 	movzbl 0x23d(%eax),%eax
c01056a0:	3c 04                	cmp    $0x4,%al
c01056a2:	75 1a                	jne    c01056be <do_exit+0x7b>
c01056a4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01056a7:	c6 80 3d 02 00 00 fb 	movb   $0xfb,0x23d(%eax)
c01056ae:	83 ec 0c             	sub    $0xc,%esp
c01056b1:	ff 75 f0             	pushl  -0x10(%ebp)
c01056b4:	e8 33 01 00 00       	call   c01057ec <cleanup>
c01056b9:	83 c4 10             	add    $0x10,%esp
c01056bc:	eb 0d                	jmp    c01056cb <do_exit+0x88>
c01056be:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01056c1:	c6 80 3c 02 00 00 03 	movb   $0x3,0x23c(%eax)
c01056c8:	eb 01                	jmp    c01056cb <do_exit+0x88>
c01056ca:	90                   	nop
c01056cb:	c9                   	leave  
c01056cc:	c3                   	ret    

c01056cd <do_wait>:
c01056cd:	55                   	push   %ebp
c01056ce:	89 e5                	mov    %esp,%ebp
c01056d0:	81 ec a8 00 00 00    	sub    $0xa8,%esp
c01056d6:	8b 45 08             	mov    0x8(%ebp),%eax
c01056d9:	8b 00                	mov    (%eax),%eax
c01056db:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01056de:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01056e5:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01056ec:	83 ec 0c             	sub    $0xc,%esp
c01056ef:	ff 75 ec             	pushl  -0x14(%ebp)
c01056f2:	e8 0f e0 ff ff       	call   c0103706 <pid2proc>
c01056f7:	83 c4 10             	add    $0x10,%esp
c01056fa:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01056fd:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0105701:	75 19                	jne    c010571c <do_wait+0x4f>
c0105703:	6a 58                	push   $0x58
c0105705:	68 45 a7 10 c0       	push   $0xc010a745
c010570a:	68 45 a7 10 c0       	push   $0xc010a745
c010570f:	68 53 a7 10 c0       	push   $0xc010a753
c0105714:	e8 95 2e 00 00       	call   c01085ae <assertion_failure>
c0105719:	83 c4 10             	add    $0x10,%esp
c010571c:	a1 ec fd 10 c0       	mov    0xc010fdec,%eax
c0105721:	8b 15 f0 fd 10 c0    	mov    0xc010fdf0,%edx
c0105727:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010572a:	89 55 e0             	mov    %edx,-0x20(%ebp)
c010572d:	a1 f4 fd 10 c0       	mov    0xc010fdf4,%eax
c0105732:	8b 15 f8 fd 10 c0    	mov    0xc010fdf8,%edx
c0105738:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010573b:	89 55 d8             	mov    %edx,-0x28(%ebp)
c010573e:	a1 f0 fd 10 c0       	mov    0xc010fdf0,%eax
c0105743:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105746:	eb 5b                	jmp    c01057a3 <do_wait+0xd6>
c0105748:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010574b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105750:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105753:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105756:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c010575c:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c010575f:	74 0b                	je     c010576c <do_wait+0x9f>
c0105761:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105764:	8b 40 04             	mov    0x4(%eax),%eax
c0105767:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010576a:	eb 37                	jmp    c01057a3 <do_wait+0xd6>
c010576c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0105770:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105773:	0f b6 80 3d 02 00 00 	movzbl 0x23d(%eax),%eax
c010577a:	3c 03                	cmp    $0x3,%al
c010577c:	74 0b                	je     c0105789 <do_wait+0xbc>
c010577e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105781:	8b 40 04             	mov    0x4(%eax),%eax
c0105784:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105787:	eb 1a                	jmp    c01057a3 <do_wait+0xd6>
c0105789:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010578c:	c6 80 3d 02 00 00 fb 	movb   $0xfb,0x23d(%eax)
c0105793:	83 ec 0c             	sub    $0xc,%esp
c0105796:	ff 75 e8             	pushl  -0x18(%ebp)
c0105799:	e8 4e 00 00 00       	call   c01057ec <cleanup>
c010579e:	83 c4 10             	add    $0x10,%esp
c01057a1:	eb 47                	jmp    c01057ea <do_wait+0x11d>
c01057a3:	81 7d f0 f4 fd 10 c0 	cmpl   $0xc010fdf4,-0x10(%ebp)
c01057aa:	75 9c                	jne    c0105748 <do_wait+0x7b>
c01057ac:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01057b0:	74 0c                	je     c01057be <do_wait+0xf1>
c01057b2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01057b5:	c6 80 3d 02 00 00 04 	movb   $0x4,0x23d(%eax)
c01057bc:	eb 2c                	jmp    c01057ea <do_wait+0x11d>
c01057be:	c7 45 d0 65 00 00 00 	movl   $0x65,-0x30(%ebp)
c01057c5:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
c01057cc:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
c01057d3:	83 ec 04             	sub    $0x4,%esp
c01057d6:	ff 75 ec             	pushl  -0x14(%ebp)
c01057d9:	8d 85 58 ff ff ff    	lea    -0xa8(%ebp),%eax
c01057df:	50                   	push   %eax
c01057e0:	6a 01                	push   $0x1
c01057e2:	e8 37 3a 00 00       	call   c010921e <send_rec>
c01057e7:	83 c4 10             	add    $0x10,%esp
c01057ea:	c9                   	leave  
c01057eb:	c3                   	ret    

c01057ec <cleanup>:
c01057ec:	55                   	push   %ebp
c01057ed:	89 e5                	mov    %esp,%ebp
c01057ef:	81 ec 88 00 00 00    	sub    $0x88,%esp
c01057f5:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c01057fc:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0105803:	8b 45 08             	mov    0x8(%ebp),%eax
c0105806:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c010580c:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010580f:	8b 45 08             	mov    0x8(%ebp),%eax
c0105812:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c0105818:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010581b:	8b 45 08             	mov    0x8(%ebp),%eax
c010581e:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0105824:	83 ec 04             	sub    $0x4,%esp
c0105827:	50                   	push   %eax
c0105828:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c010582e:	50                   	push   %eax
c010582f:	6a 01                	push   $0x1
c0105831:	e8 e8 39 00 00       	call   c010921e <send_rec>
c0105836:	83 c4 10             	add    $0x10,%esp
c0105839:	8b 45 08             	mov    0x8(%ebp),%eax
c010583c:	c6 80 3c 02 00 00 ff 	movb   $0xff,0x23c(%eax)
c0105843:	90                   	nop
c0105844:	c9                   	leave  
c0105845:	c3                   	ret    

c0105846 <init_bitmap>:
c0105846:	55                   	push   %ebp
c0105847:	89 e5                	mov    %esp,%ebp
c0105849:	83 ec 08             	sub    $0x8,%esp
c010584c:	8b 45 08             	mov    0x8(%ebp),%eax
c010584f:	8b 50 04             	mov    0x4(%eax),%edx
c0105852:	8b 45 08             	mov    0x8(%ebp),%eax
c0105855:	8b 00                	mov    (%eax),%eax
c0105857:	83 ec 04             	sub    $0x4,%esp
c010585a:	52                   	push   %edx
c010585b:	6a 00                	push   $0x0
c010585d:	50                   	push   %eax
c010585e:	e8 c8 59 00 00       	call   c010b22b <Memset>
c0105863:	83 c4 10             	add    $0x10,%esp
c0105866:	90                   	nop
c0105867:	c9                   	leave  
c0105868:	c3                   	ret    

c0105869 <test_bit_val>:
c0105869:	55                   	push   %ebp
c010586a:	89 e5                	mov    %esp,%ebp
c010586c:	53                   	push   %ebx
c010586d:	83 ec 10             	sub    $0x10,%esp
c0105870:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105873:	8d 50 07             	lea    0x7(%eax),%edx
c0105876:	85 c0                	test   %eax,%eax
c0105878:	0f 48 c2             	cmovs  %edx,%eax
c010587b:	c1 f8 03             	sar    $0x3,%eax
c010587e:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105881:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105884:	99                   	cltd   
c0105885:	c1 ea 1d             	shr    $0x1d,%edx
c0105888:	01 d0                	add    %edx,%eax
c010588a:	83 e0 07             	and    $0x7,%eax
c010588d:	29 d0                	sub    %edx,%eax
c010588f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105892:	8b 45 08             	mov    0x8(%ebp),%eax
c0105895:	8b 10                	mov    (%eax),%edx
c0105897:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010589a:	01 d0                	add    %edx,%eax
c010589c:	0f b6 00             	movzbl (%eax),%eax
c010589f:	88 45 f3             	mov    %al,-0xd(%ebp)
c01058a2:	0f be 55 f3          	movsbl -0xd(%ebp),%edx
c01058a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01058a9:	bb 01 00 00 00       	mov    $0x1,%ebx
c01058ae:	89 c1                	mov    %eax,%ecx
c01058b0:	d3 e3                	shl    %cl,%ebx
c01058b2:	89 d8                	mov    %ebx,%eax
c01058b4:	21 c2                	and    %eax,%edx
c01058b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01058b9:	89 c1                	mov    %eax,%ecx
c01058bb:	d3 fa                	sar    %cl,%edx
c01058bd:	89 d0                	mov    %edx,%eax
c01058bf:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01058c2:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c01058c6:	0f 9f c0             	setg   %al
c01058c9:	0f b6 c0             	movzbl %al,%eax
c01058cc:	83 c4 10             	add    $0x10,%esp
c01058cf:	5b                   	pop    %ebx
c01058d0:	5d                   	pop    %ebp
c01058d1:	c3                   	ret    

c01058d2 <set_bit_val>:
c01058d2:	55                   	push   %ebp
c01058d3:	89 e5                	mov    %esp,%ebp
c01058d5:	83 ec 10             	sub    $0x10,%esp
c01058d8:	8b 45 0c             	mov    0xc(%ebp),%eax
c01058db:	8d 50 07             	lea    0x7(%eax),%edx
c01058de:	85 c0                	test   %eax,%eax
c01058e0:	0f 48 c2             	cmovs  %edx,%eax
c01058e3:	c1 f8 03             	sar    $0x3,%eax
c01058e6:	89 45 f8             	mov    %eax,-0x8(%ebp)
c01058e9:	8b 45 0c             	mov    0xc(%ebp),%eax
c01058ec:	99                   	cltd   
c01058ed:	c1 ea 1d             	shr    $0x1d,%edx
c01058f0:	01 d0                	add    %edx,%eax
c01058f2:	83 e0 07             	and    $0x7,%eax
c01058f5:	29 d0                	sub    %edx,%eax
c01058f7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01058fa:	8b 45 08             	mov    0x8(%ebp),%eax
c01058fd:	8b 10                	mov    (%eax),%edx
c01058ff:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105902:	01 d0                	add    %edx,%eax
c0105904:	0f b6 00             	movzbl (%eax),%eax
c0105907:	88 45 ff             	mov    %al,-0x1(%ebp)
c010590a:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c010590e:	7e 13                	jle    c0105923 <set_bit_val+0x51>
c0105910:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105913:	ba 01 00 00 00       	mov    $0x1,%edx
c0105918:	89 c1                	mov    %eax,%ecx
c010591a:	d3 e2                	shl    %cl,%edx
c010591c:	89 d0                	mov    %edx,%eax
c010591e:	08 45 ff             	or     %al,-0x1(%ebp)
c0105921:	eb 13                	jmp    c0105936 <set_bit_val+0x64>
c0105923:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105926:	ba 01 00 00 00       	mov    $0x1,%edx
c010592b:	89 c1                	mov    %eax,%ecx
c010592d:	d3 e2                	shl    %cl,%edx
c010592f:	89 d0                	mov    %edx,%eax
c0105931:	f7 d0                	not    %eax
c0105933:	20 45 ff             	and    %al,-0x1(%ebp)
c0105936:	8b 45 08             	mov    0x8(%ebp),%eax
c0105939:	8b 10                	mov    (%eax),%edx
c010593b:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010593e:	01 c2                	add    %eax,%edx
c0105940:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
c0105944:	88 02                	mov    %al,(%edx)
c0105946:	b8 01 00 00 00       	mov    $0x1,%eax
c010594b:	c9                   	leave  
c010594c:	c3                   	ret    

c010594d <set_bits>:
c010594d:	55                   	push   %ebp
c010594e:	89 e5                	mov    %esp,%ebp
c0105950:	83 ec 10             	sub    $0x10,%esp
c0105953:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c010595a:	eb 1c                	jmp    c0105978 <set_bits+0x2b>
c010595c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010595f:	8d 50 01             	lea    0x1(%eax),%edx
c0105962:	89 55 0c             	mov    %edx,0xc(%ebp)
c0105965:	ff 75 10             	pushl  0x10(%ebp)
c0105968:	50                   	push   %eax
c0105969:	ff 75 08             	pushl  0x8(%ebp)
c010596c:	e8 61 ff ff ff       	call   c01058d2 <set_bit_val>
c0105971:	83 c4 0c             	add    $0xc,%esp
c0105974:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0105978:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010597b:	3b 45 14             	cmp    0x14(%ebp),%eax
c010597e:	7c dc                	jl     c010595c <set_bits+0xf>
c0105980:	b8 01 00 00 00       	mov    $0x1,%eax
c0105985:	c9                   	leave  
c0105986:	c3                   	ret    

c0105987 <get_first_free_bit>:
c0105987:	55                   	push   %ebp
c0105988:	89 e5                	mov    %esp,%ebp
c010598a:	83 ec 10             	sub    $0x10,%esp
c010598d:	8b 45 08             	mov    0x8(%ebp),%eax
c0105990:	8b 40 04             	mov    0x4(%eax),%eax
c0105993:	c1 e0 03             	shl    $0x3,%eax
c0105996:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105999:	8b 45 0c             	mov    0xc(%ebp),%eax
c010599c:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010599f:	eb 1b                	jmp    c01059bc <get_first_free_bit+0x35>
c01059a1:	ff 75 fc             	pushl  -0x4(%ebp)
c01059a4:	ff 75 08             	pushl  0x8(%ebp)
c01059a7:	e8 bd fe ff ff       	call   c0105869 <test_bit_val>
c01059ac:	83 c4 08             	add    $0x8,%esp
c01059af:	85 c0                	test   %eax,%eax
c01059b1:	75 05                	jne    c01059b8 <get_first_free_bit+0x31>
c01059b3:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01059b6:	eb 11                	jmp    c01059c9 <get_first_free_bit+0x42>
c01059b8:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c01059bc:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01059bf:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c01059c2:	7c dd                	jl     c01059a1 <get_first_free_bit+0x1a>
c01059c4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01059c9:	c9                   	leave  
c01059ca:	c3                   	ret    

c01059cb <get_bits>:
c01059cb:	55                   	push   %ebp
c01059cc:	89 e5                	mov    %esp,%ebp
c01059ce:	83 ec 20             	sub    $0x20,%esp
c01059d1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01059d8:	ff 75 f0             	pushl  -0x10(%ebp)
c01059db:	ff 75 08             	pushl  0x8(%ebp)
c01059de:	e8 a4 ff ff ff       	call   c0105987 <get_first_free_bit>
c01059e3:	83 c4 08             	add    $0x8,%esp
c01059e6:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01059e9:	8b 45 08             	mov    0x8(%ebp),%eax
c01059ec:	8b 40 04             	mov    0x4(%eax),%eax
c01059ef:	c1 e0 03             	shl    $0x3,%eax
c01059f2:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01059f5:	8b 45 0c             	mov    0xc(%ebp),%eax
c01059f8:	83 e8 01             	sub    $0x1,%eax
c01059fb:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01059fe:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c0105a02:	75 08                	jne    c0105a0c <get_bits+0x41>
c0105a04:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105a07:	e9 85 00 00 00       	jmp    c0105a91 <get_bits+0xc6>
c0105a0c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105a0f:	83 c0 01             	add    $0x1,%eax
c0105a12:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105a15:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105a18:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105a1b:	eb 58                	jmp    c0105a75 <get_bits+0xaa>
c0105a1d:	ff 75 f8             	pushl  -0x8(%ebp)
c0105a20:	ff 75 08             	pushl  0x8(%ebp)
c0105a23:	e8 41 fe ff ff       	call   c0105869 <test_bit_val>
c0105a28:	83 c4 08             	add    $0x8,%esp
c0105a2b:	85 c0                	test   %eax,%eax
c0105a2d:	75 0a                	jne    c0105a39 <get_bits+0x6e>
c0105a2f:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0105a33:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0105a37:	eb 2b                	jmp    c0105a64 <get_bits+0x99>
c0105a39:	6a 00                	push   $0x0
c0105a3b:	ff 75 08             	pushl  0x8(%ebp)
c0105a3e:	e8 44 ff ff ff       	call   c0105987 <get_first_free_bit>
c0105a43:	83 c4 08             	add    $0x8,%esp
c0105a46:	83 c0 01             	add    $0x1,%eax
c0105a49:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105a4c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105a4f:	83 c0 01             	add    $0x1,%eax
c0105a52:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105a55:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105a58:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105a5b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105a5e:	83 e8 01             	sub    $0x1,%eax
c0105a61:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105a64:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105a67:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c0105a6a:	7c 09                	jl     c0105a75 <get_bits+0xaa>
c0105a6c:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c0105a73:	eb 0d                	jmp    c0105a82 <get_bits+0xb7>
c0105a75:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105a78:	8d 50 ff             	lea    -0x1(%eax),%edx
c0105a7b:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0105a7e:	85 c0                	test   %eax,%eax
c0105a80:	7f 9b                	jg     c0105a1d <get_bits+0x52>
c0105a82:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105a85:	2b 45 0c             	sub    0xc(%ebp),%eax
c0105a88:	83 c0 01             	add    $0x1,%eax
c0105a8b:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105a8e:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105a91:	c9                   	leave  
c0105a92:	c3                   	ret    

c0105a93 <get_a_page>:
c0105a93:	55                   	push   %ebp
c0105a94:	89 e5                	mov    %esp,%ebp
c0105a96:	83 ec 28             	sub    $0x28,%esp
c0105a99:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0105a9d:	75 22                	jne    c0105ac1 <get_a_page+0x2e>
c0105a9f:	a1 ac 06 11 c0       	mov    0xc01106ac,%eax
c0105aa4:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105aa7:	a1 b0 06 11 c0       	mov    0xc01106b0,%eax
c0105aac:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105aaf:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0105ab4:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105ab7:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c0105abc:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105abf:	eb 20                	jmp    c0105ae1 <get_a_page+0x4e>
c0105ac1:	a1 f4 0e 11 c0       	mov    0xc0110ef4,%eax
c0105ac6:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105ac9:	a1 f8 0e 11 c0       	mov    0xc0110ef8,%eax
c0105ace:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105ad1:	a1 fc 0e 11 c0       	mov    0xc0110efc,%eax
c0105ad6:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105ad9:	a1 00 0f 11 c0       	mov    0xc0110f00,%eax
c0105ade:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105ae1:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105ae4:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0105ae7:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105aea:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0105aed:	6a 01                	push   $0x1
c0105aef:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105af2:	50                   	push   %eax
c0105af3:	e8 d3 fe ff ff       	call   c01059cb <get_bits>
c0105af8:	83 c4 08             	add    $0x8,%esp
c0105afb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105afe:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c0105b02:	75 1c                	jne    c0105b20 <get_a_page+0x8d>
c0105b04:	68 84 00 00 00       	push   $0x84
c0105b09:	68 66 a7 10 c0       	push   $0xc010a766
c0105b0e:	68 66 a7 10 c0       	push   $0xc010a766
c0105b13:	68 70 a7 10 c0       	push   $0xc010a770
c0105b18:	e8 91 2a 00 00       	call   c01085ae <assertion_failure>
c0105b1d:	83 c4 10             	add    $0x10,%esp
c0105b20:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105b23:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0105b26:	c1 e2 0c             	shl    $0xc,%edx
c0105b29:	01 d0                	add    %edx,%eax
c0105b2b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105b2e:	83 ec 04             	sub    $0x4,%esp
c0105b31:	6a 01                	push   $0x1
c0105b33:	ff 75 f4             	pushl  -0xc(%ebp)
c0105b36:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105b39:	50                   	push   %eax
c0105b3a:	e8 93 fd ff ff       	call   c01058d2 <set_bit_val>
c0105b3f:	83 c4 10             	add    $0x10,%esp
c0105b42:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105b45:	c9                   	leave  
c0105b46:	c3                   	ret    

c0105b47 <get_virtual_address_start_with_addr>:
c0105b47:	55                   	push   %ebp
c0105b48:	89 e5                	mov    %esp,%ebp
c0105b4a:	83 ec 38             	sub    $0x38,%esp
c0105b4d:	e8 51 a8 ff ff       	call   c01003a3 <get_running_thread_pcb>
c0105b52:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105b55:	83 ec 0c             	sub    $0xc,%esp
c0105b58:	ff 75 10             	pushl  0x10(%ebp)
c0105b5b:	e8 a6 db ff ff       	call   c0103706 <pid2proc>
c0105b60:	83 c4 10             	add    $0x10,%esp
c0105b63:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105b66:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105b69:	8b 40 0c             	mov    0xc(%eax),%eax
c0105b6c:	83 ec 04             	sub    $0x4,%esp
c0105b6f:	6a 0c                	push   $0xc
c0105b71:	50                   	push   %eax
c0105b72:	8d 45 dc             	lea    -0x24(%ebp),%eax
c0105b75:	50                   	push   %eax
c0105b76:	e8 2e 10 00 00       	call   c0106ba9 <Memcpy>
c0105b7b:	83 c4 10             	add    $0x10,%esp
c0105b7e:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105b81:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0105b84:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0105b87:	89 55 d8             	mov    %edx,-0x28(%ebp)
c0105b8a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105b8d:	8b 55 08             	mov    0x8(%ebp),%edx
c0105b90:	29 c2                	sub    %eax,%edx
c0105b92:	89 d0                	mov    %edx,%eax
c0105b94:	c1 e8 0c             	shr    $0xc,%eax
c0105b97:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105b9a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0105b9e:	79 1c                	jns    c0105bbc <get_virtual_address_start_with_addr+0x75>
c0105ba0:	68 97 00 00 00       	push   $0x97
c0105ba5:	68 66 a7 10 c0       	push   $0xc010a766
c0105baa:	68 66 a7 10 c0       	push   $0xc010a766
c0105baf:	68 7c a7 10 c0       	push   $0xc010a77c
c0105bb4:	e8 f5 29 00 00       	call   c01085ae <assertion_failure>
c0105bb9:	83 c4 10             	add    $0x10,%esp
c0105bbc:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105bbf:	50                   	push   %eax
c0105bc0:	6a 01                	push   $0x1
c0105bc2:	ff 75 ec             	pushl  -0x14(%ebp)
c0105bc5:	8d 45 d4             	lea    -0x2c(%ebp),%eax
c0105bc8:	50                   	push   %eax
c0105bc9:	e8 7f fd ff ff       	call   c010594d <set_bits>
c0105bce:	83 c4 10             	add    $0x10,%esp
c0105bd1:	8b 45 08             	mov    0x8(%ebp),%eax
c0105bd4:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105bd9:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105bdc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105bdf:	c9                   	leave  
c0105be0:	c3                   	ret    

c0105be1 <get_virtual_address>:
c0105be1:	55                   	push   %ebp
c0105be2:	89 e5                	mov    %esp,%ebp
c0105be4:	83 ec 28             	sub    $0x28,%esp
c0105be7:	e8 b7 a7 ff ff       	call   c01003a3 <get_running_thread_pcb>
c0105bec:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105bef:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0105bf3:	75 1a                	jne    c0105c0f <get_virtual_address+0x2e>
c0105bf5:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0105bfa:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105bfd:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0105c02:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105c05:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c0105c0a:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105c0d:	eb 18                	jmp    c0105c27 <get_virtual_address+0x46>
c0105c0f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105c12:	8b 40 0c             	mov    0xc(%eax),%eax
c0105c15:	83 ec 04             	sub    $0x4,%esp
c0105c18:	6a 0c                	push   $0xc
c0105c1a:	50                   	push   %eax
c0105c1b:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0105c1e:	50                   	push   %eax
c0105c1f:	e8 85 0f 00 00       	call   c0106ba9 <Memcpy>
c0105c24:	83 c4 10             	add    $0x10,%esp
c0105c27:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105c2a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0105c2d:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105c30:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0105c33:	8b 45 08             	mov    0x8(%ebp),%eax
c0105c36:	83 ec 08             	sub    $0x8,%esp
c0105c39:	50                   	push   %eax
c0105c3a:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105c3d:	50                   	push   %eax
c0105c3e:	e8 88 fd ff ff       	call   c01059cb <get_bits>
c0105c43:	83 c4 10             	add    $0x10,%esp
c0105c46:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105c49:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105c4c:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0105c4f:	c1 e2 0c             	shl    $0xc,%edx
c0105c52:	01 d0                	add    %edx,%eax
c0105c54:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105c57:	8b 45 08             	mov    0x8(%ebp),%eax
c0105c5a:	50                   	push   %eax
c0105c5b:	6a 01                	push   $0x1
c0105c5d:	ff 75 f0             	pushl  -0x10(%ebp)
c0105c60:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105c63:	50                   	push   %eax
c0105c64:	e8 e4 fc ff ff       	call   c010594d <set_bits>
c0105c69:	83 c4 10             	add    $0x10,%esp
c0105c6c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105c6f:	c9                   	leave  
c0105c70:	c3                   	ret    

c0105c71 <ptr_pde>:
c0105c71:	55                   	push   %ebp
c0105c72:	89 e5                	mov    %esp,%ebp
c0105c74:	8b 45 08             	mov    0x8(%ebp),%eax
c0105c77:	c1 e8 16             	shr    $0x16,%eax
c0105c7a:	05 00 fc ff 3f       	add    $0x3ffffc00,%eax
c0105c7f:	c1 e0 02             	shl    $0x2,%eax
c0105c82:	5d                   	pop    %ebp
c0105c83:	c3                   	ret    

c0105c84 <ptr_pte>:
c0105c84:	55                   	push   %ebp
c0105c85:	89 e5                	mov    %esp,%ebp
c0105c87:	8b 45 08             	mov    0x8(%ebp),%eax
c0105c8a:	c1 e8 0a             	shr    $0xa,%eax
c0105c8d:	25 00 f0 3f 00       	and    $0x3ff000,%eax
c0105c92:	89 c2                	mov    %eax,%edx
c0105c94:	8b 45 08             	mov    0x8(%ebp),%eax
c0105c97:	c1 e8 0c             	shr    $0xc,%eax
c0105c9a:	25 ff 03 00 00       	and    $0x3ff,%eax
c0105c9f:	c1 e0 02             	shl    $0x2,%eax
c0105ca2:	01 d0                	add    %edx,%eax
c0105ca4:	2d 00 00 40 00       	sub    $0x400000,%eax
c0105ca9:	5d                   	pop    %ebp
c0105caa:	c3                   	ret    

c0105cab <add_map_entry>:
c0105cab:	55                   	push   %ebp
c0105cac:	89 e5                	mov    %esp,%ebp
c0105cae:	83 ec 18             	sub    $0x18,%esp
c0105cb1:	ff 75 08             	pushl  0x8(%ebp)
c0105cb4:	e8 b8 ff ff ff       	call   c0105c71 <ptr_pde>
c0105cb9:	83 c4 04             	add    $0x4,%esp
c0105cbc:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105cbf:	ff 75 08             	pushl  0x8(%ebp)
c0105cc2:	e8 bd ff ff ff       	call   c0105c84 <ptr_pte>
c0105cc7:	83 c4 04             	add    $0x4,%esp
c0105cca:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105ccd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105cd0:	8b 00                	mov    (%eax),%eax
c0105cd2:	83 e0 01             	and    $0x1,%eax
c0105cd5:	85 c0                	test   %eax,%eax
c0105cd7:	74 1b                	je     c0105cf4 <add_map_entry+0x49>
c0105cd9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105cdc:	8b 00                	mov    (%eax),%eax
c0105cde:	83 e0 01             	and    $0x1,%eax
c0105ce1:	85 c0                	test   %eax,%eax
c0105ce3:	75 54                	jne    c0105d39 <add_map_entry+0x8e>
c0105ce5:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105ce8:	83 c8 07             	or     $0x7,%eax
c0105ceb:	89 c2                	mov    %eax,%edx
c0105ced:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105cf0:	89 10                	mov    %edx,(%eax)
c0105cf2:	eb 45                	jmp    c0105d39 <add_map_entry+0x8e>
c0105cf4:	83 ec 0c             	sub    $0xc,%esp
c0105cf7:	6a 00                	push   $0x0
c0105cf9:	e8 95 fd ff ff       	call   c0105a93 <get_a_page>
c0105cfe:	83 c4 10             	add    $0x10,%esp
c0105d01:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105d04:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105d07:	83 c8 07             	or     $0x7,%eax
c0105d0a:	89 c2                	mov    %eax,%edx
c0105d0c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105d0f:	89 10                	mov    %edx,(%eax)
c0105d11:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105d14:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105d19:	83 ec 04             	sub    $0x4,%esp
c0105d1c:	68 00 10 00 00       	push   $0x1000
c0105d21:	6a 00                	push   $0x0
c0105d23:	50                   	push   %eax
c0105d24:	e8 02 55 00 00       	call   c010b22b <Memset>
c0105d29:	83 c4 10             	add    $0x10,%esp
c0105d2c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105d2f:	83 c8 07             	or     $0x7,%eax
c0105d32:	89 c2                	mov    %eax,%edx
c0105d34:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105d37:	89 10                	mov    %edx,(%eax)
c0105d39:	90                   	nop
c0105d3a:	c9                   	leave  
c0105d3b:	c3                   	ret    

c0105d3c <alloc_virtual_memory>:
c0105d3c:	55                   	push   %ebp
c0105d3d:	89 e5                	mov    %esp,%ebp
c0105d3f:	83 ec 28             	sub    $0x28,%esp
c0105d42:	8b 45 08             	mov    0x8(%ebp),%eax
c0105d45:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105d4a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105d4d:	8b 45 08             	mov    0x8(%ebp),%eax
c0105d50:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0105d53:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105d56:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105d59:	01 45 e4             	add    %eax,-0x1c(%ebp)
c0105d5c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105d5f:	05 ff 0f 00 00       	add    $0xfff,%eax
c0105d64:	c1 e8 0c             	shr    $0xc,%eax
c0105d67:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105d6a:	e8 34 a6 ff ff       	call   c01003a3 <get_running_thread_pcb>
c0105d6f:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105d72:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105d75:	8b 50 08             	mov    0x8(%eax),%edx
c0105d78:	a1 28 0f 11 c0       	mov    0xc0110f28,%eax
c0105d7d:	39 c2                	cmp    %eax,%edx
c0105d7f:	75 09                	jne    c0105d8a <alloc_virtual_memory+0x4e>
c0105d81:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0105d88:	eb 07                	jmp    c0105d91 <alloc_virtual_memory+0x55>
c0105d8a:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0105d91:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0105d98:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0105d9f:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0105da6:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0105dad:	eb 47                	jmp    c0105df6 <alloc_virtual_memory+0xba>
c0105daf:	83 ec 08             	sub    $0x8,%esp
c0105db2:	ff 75 f0             	pushl  -0x10(%ebp)
c0105db5:	6a 01                	push   $0x1
c0105db7:	e8 25 fe ff ff       	call   c0105be1 <get_virtual_address>
c0105dbc:	83 c4 10             	add    $0x10,%esp
c0105dbf:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105dc2:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0105dc6:	74 13                	je     c0105ddb <alloc_virtual_memory+0x9f>
c0105dc8:	83 ec 0c             	sub    $0xc,%esp
c0105dcb:	ff 75 f0             	pushl  -0x10(%ebp)
c0105dce:	e8 c0 fc ff ff       	call   c0105a93 <get_a_page>
c0105dd3:	83 c4 10             	add    $0x10,%esp
c0105dd6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105dd9:	eb 06                	jmp    c0105de1 <alloc_virtual_memory+0xa5>
c0105ddb:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0105dde:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105de1:	83 ec 08             	sub    $0x8,%esp
c0105de4:	ff 75 f4             	pushl  -0xc(%ebp)
c0105de7:	ff 75 d8             	pushl  -0x28(%ebp)
c0105dea:	e8 bc fe ff ff       	call   c0105cab <add_map_entry>
c0105def:	83 c4 10             	add    $0x10,%esp
c0105df2:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0105df6:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105df9:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c0105dfc:	72 b1                	jb     c0105daf <alloc_virtual_memory+0x73>
c0105dfe:	8b 45 08             	mov    0x8(%ebp),%eax
c0105e01:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105e06:	89 c2                	mov    %eax,%edx
c0105e08:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105e0b:	01 d0                	add    %edx,%eax
c0105e0d:	c9                   	leave  
c0105e0e:	c3                   	ret    

c0105e0f <get_physical_address_proc>:
c0105e0f:	55                   	push   %ebp
c0105e10:	89 e5                	mov    %esp,%ebp
c0105e12:	83 ec 18             	sub    $0x18,%esp
c0105e15:	e8 ad a4 ff ff       	call   c01002c7 <disable_int>
c0105e1a:	e8 84 a5 ff ff       	call   c01003a3 <get_running_thread_pcb>
c0105e1f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105e22:	83 ec 0c             	sub    $0xc,%esp
c0105e25:	ff 75 0c             	pushl  0xc(%ebp)
c0105e28:	e8 d9 d8 ff ff       	call   c0103706 <pid2proc>
c0105e2d:	83 c4 10             	add    $0x10,%esp
c0105e30:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105e33:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105e36:	8b 40 08             	mov    0x8(%eax),%eax
c0105e39:	83 ec 0c             	sub    $0xc,%esp
c0105e3c:	50                   	push   %eax
c0105e3d:	e8 45 a5 ff ff       	call   c0100387 <update_cr3>
c0105e42:	83 c4 10             	add    $0x10,%esp
c0105e45:	83 ec 0c             	sub    $0xc,%esp
c0105e48:	ff 75 08             	pushl  0x8(%ebp)
c0105e4b:	e8 34 fe ff ff       	call   c0105c84 <ptr_pte>
c0105e50:	83 c4 10             	add    $0x10,%esp
c0105e53:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105e56:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105e59:	8b 00                	mov    (%eax),%eax
c0105e5b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105e60:	89 c2                	mov    %eax,%edx
c0105e62:	8b 45 08             	mov    0x8(%ebp),%eax
c0105e65:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105e6a:	09 d0                	or     %edx,%eax
c0105e6c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105e6f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105e72:	8b 40 08             	mov    0x8(%eax),%eax
c0105e75:	83 ec 0c             	sub    $0xc,%esp
c0105e78:	50                   	push   %eax
c0105e79:	e8 09 a5 ff ff       	call   c0100387 <update_cr3>
c0105e7e:	83 c4 10             	add    $0x10,%esp
c0105e81:	e8 43 a4 ff ff       	call   c01002c9 <enable_int>
c0105e86:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105e89:	c9                   	leave  
c0105e8a:	c3                   	ret    

c0105e8b <get_physical_address>:
c0105e8b:	55                   	push   %ebp
c0105e8c:	89 e5                	mov    %esp,%ebp
c0105e8e:	83 ec 10             	sub    $0x10,%esp
c0105e91:	ff 75 08             	pushl  0x8(%ebp)
c0105e94:	e8 eb fd ff ff       	call   c0105c84 <ptr_pte>
c0105e99:	83 c4 04             	add    $0x4,%esp
c0105e9c:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105e9f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105ea2:	8b 00                	mov    (%eax),%eax
c0105ea4:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105ea9:	89 c2                	mov    %eax,%edx
c0105eab:	8b 45 08             	mov    0x8(%ebp),%eax
c0105eae:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105eb3:	09 d0                	or     %edx,%eax
c0105eb5:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105eb8:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105ebb:	c9                   	leave  
c0105ebc:	c3                   	ret    

c0105ebd <alloc_physical_memory_of_proc>:
c0105ebd:	55                   	push   %ebp
c0105ebe:	89 e5                	mov    %esp,%ebp
c0105ec0:	83 ec 48             	sub    $0x48,%esp
c0105ec3:	e8 ff a3 ff ff       	call   c01002c7 <disable_int>
c0105ec8:	8b 45 08             	mov    0x8(%ebp),%eax
c0105ecb:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105ed0:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105ed3:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0105eda:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105edd:	83 ec 0c             	sub    $0xc,%esp
c0105ee0:	50                   	push   %eax
c0105ee1:	e8 20 d8 ff ff       	call   c0103706 <pid2proc>
c0105ee6:	83 c4 10             	add    $0x10,%esp
c0105ee9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105eec:	e8 b2 a4 ff ff       	call   c01003a3 <get_running_thread_pcb>
c0105ef1:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105ef4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105ef7:	8b 40 0c             	mov    0xc(%eax),%eax
c0105efa:	83 ec 04             	sub    $0x4,%esp
c0105efd:	6a 0c                	push   $0xc
c0105eff:	50                   	push   %eax
c0105f00:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0105f03:	50                   	push   %eax
c0105f04:	e8 a0 0c 00 00       	call   c0106ba9 <Memcpy>
c0105f09:	83 c4 10             	add    $0x10,%esp
c0105f0c:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0105f0f:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0105f12:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0105f15:	89 55 c8             	mov    %edx,-0x38(%ebp)
c0105f18:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0105f1b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0105f1e:	29 c2                	sub    %eax,%edx
c0105f20:	89 d0                	mov    %edx,%eax
c0105f22:	c1 e8 0c             	shr    $0xc,%eax
c0105f25:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105f28:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0105f2b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0105f2e:	c1 e2 0c             	shl    $0xc,%edx
c0105f31:	01 d0                	add    %edx,%eax
c0105f33:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105f36:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105f39:	6a 01                	push   $0x1
c0105f3b:	6a 01                	push   $0x1
c0105f3d:	50                   	push   %eax
c0105f3e:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0105f41:	50                   	push   %eax
c0105f42:	e8 06 fa ff ff       	call   c010594d <set_bits>
c0105f47:	83 c4 10             	add    $0x10,%esp
c0105f4a:	83 ec 0c             	sub    $0xc,%esp
c0105f4d:	ff 75 f0             	pushl  -0x10(%ebp)
c0105f50:	e8 3e fb ff ff       	call   c0105a93 <get_a_page>
c0105f55:	83 c4 10             	add    $0x10,%esp
c0105f58:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105f5b:	8b 45 08             	mov    0x8(%ebp),%eax
c0105f5e:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105f63:	89 c2                	mov    %eax,%edx
c0105f65:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105f68:	01 d0                	add    %edx,%eax
c0105f6a:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105f6d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105f70:	8b 40 08             	mov    0x8(%eax),%eax
c0105f73:	83 ec 0c             	sub    $0xc,%esp
c0105f76:	50                   	push   %eax
c0105f77:	e8 0b a4 ff ff       	call   c0100387 <update_cr3>
c0105f7c:	83 c4 10             	add    $0x10,%esp
c0105f7f:	83 ec 08             	sub    $0x8,%esp
c0105f82:	ff 75 dc             	pushl  -0x24(%ebp)
c0105f85:	ff 75 f4             	pushl  -0xc(%ebp)
c0105f88:	e8 1e fd ff ff       	call   c0105cab <add_map_entry>
c0105f8d:	83 c4 10             	add    $0x10,%esp
c0105f90:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105f93:	8b 40 08             	mov    0x8(%eax),%eax
c0105f96:	83 ec 0c             	sub    $0xc,%esp
c0105f99:	50                   	push   %eax
c0105f9a:	e8 e8 a3 ff ff       	call   c0100387 <update_cr3>
c0105f9f:	83 c4 10             	add    $0x10,%esp
c0105fa2:	e8 22 a3 ff ff       	call   c01002c9 <enable_int>
c0105fa7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0105faa:	c9                   	leave  
c0105fab:	c3                   	ret    

c0105fac <alloc_physical_memory>:
c0105fac:	55                   	push   %ebp
c0105fad:	89 e5                	mov    %esp,%ebp
c0105faf:	83 ec 38             	sub    $0x38,%esp
c0105fb2:	8b 45 08             	mov    0x8(%ebp),%eax
c0105fb5:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105fba:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105fbd:	e8 e1 a3 ff ff       	call   c01003a3 <get_running_thread_pcb>
c0105fc2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105fc5:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0105fc9:	75 1a                	jne    c0105fe5 <alloc_physical_memory+0x39>
c0105fcb:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0105fd0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0105fd3:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0105fd8:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105fdb:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c0105fe0:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105fe3:	eb 18                	jmp    c0105ffd <alloc_physical_memory+0x51>
c0105fe5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105fe8:	8b 40 0c             	mov    0xc(%eax),%eax
c0105feb:	83 ec 04             	sub    $0x4,%esp
c0105fee:	6a 0c                	push   $0xc
c0105ff0:	50                   	push   %eax
c0105ff1:	8d 45 d4             	lea    -0x2c(%ebp),%eax
c0105ff4:	50                   	push   %eax
c0105ff5:	e8 af 0b 00 00       	call   c0106ba9 <Memcpy>
c0105ffa:	83 c4 10             	add    $0x10,%esp
c0105ffd:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106000:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0106003:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0106006:	89 55 d0             	mov    %edx,-0x30(%ebp)
c0106009:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010600c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010600f:	29 c2                	sub    %eax,%edx
c0106011:	89 d0                	mov    %edx,%eax
c0106013:	c1 e8 0c             	shr    $0xc,%eax
c0106016:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106019:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010601c:	8b 55 ec             	mov    -0x14(%ebp),%edx
c010601f:	c1 e2 0c             	shl    $0xc,%edx
c0106022:	01 d0                	add    %edx,%eax
c0106024:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106027:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010602a:	6a 01                	push   $0x1
c010602c:	6a 01                	push   $0x1
c010602e:	50                   	push   %eax
c010602f:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0106032:	50                   	push   %eax
c0106033:	e8 15 f9 ff ff       	call   c010594d <set_bits>
c0106038:	83 c4 10             	add    $0x10,%esp
c010603b:	83 ec 0c             	sub    $0xc,%esp
c010603e:	ff 75 0c             	pushl  0xc(%ebp)
c0106041:	e8 4d fa ff ff       	call   c0105a93 <get_a_page>
c0106046:	83 c4 10             	add    $0x10,%esp
c0106049:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010604c:	8b 45 08             	mov    0x8(%ebp),%eax
c010604f:	25 ff 0f 00 00       	and    $0xfff,%eax
c0106054:	89 c2                	mov    %eax,%edx
c0106056:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106059:	01 d0                	add    %edx,%eax
c010605b:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010605e:	83 ec 08             	sub    $0x8,%esp
c0106061:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106064:	ff 75 f4             	pushl  -0xc(%ebp)
c0106067:	e8 3f fc ff ff       	call   c0105cab <add_map_entry>
c010606c:	83 c4 10             	add    $0x10,%esp
c010606f:	8b 45 08             	mov    0x8(%ebp),%eax
c0106072:	c9                   	leave  
c0106073:	c3                   	ret    

c0106074 <alloc_memory>:
c0106074:	55                   	push   %ebp
c0106075:	89 e5                	mov    %esp,%ebp
c0106077:	83 ec 18             	sub    $0x18,%esp
c010607a:	83 ec 08             	sub    $0x8,%esp
c010607d:	ff 75 0c             	pushl  0xc(%ebp)
c0106080:	ff 75 08             	pushl  0x8(%ebp)
c0106083:	e8 59 fb ff ff       	call   c0105be1 <get_virtual_address>
c0106088:	83 c4 10             	add    $0x10,%esp
c010608b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010608e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106091:	2d 00 10 00 00       	sub    $0x1000,%eax
c0106096:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106099:	eb 29                	jmp    c01060c4 <alloc_memory+0x50>
c010609b:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c01060a2:	83 ec 0c             	sub    $0xc,%esp
c01060a5:	ff 75 0c             	pushl  0xc(%ebp)
c01060a8:	e8 e6 f9 ff ff       	call   c0105a93 <get_a_page>
c01060ad:	83 c4 10             	add    $0x10,%esp
c01060b0:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01060b3:	83 ec 08             	sub    $0x8,%esp
c01060b6:	ff 75 ec             	pushl  -0x14(%ebp)
c01060b9:	ff 75 f4             	pushl  -0xc(%ebp)
c01060bc:	e8 ea fb ff ff       	call   c0105cab <add_map_entry>
c01060c1:	83 c4 10             	add    $0x10,%esp
c01060c4:	8b 45 08             	mov    0x8(%ebp),%eax
c01060c7:	8d 50 ff             	lea    -0x1(%eax),%edx
c01060ca:	89 55 08             	mov    %edx,0x8(%ebp)
c01060cd:	85 c0                	test   %eax,%eax
c01060cf:	75 ca                	jne    c010609b <alloc_memory+0x27>
c01060d1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01060d4:	c9                   	leave  
c01060d5:	c3                   	ret    

c01060d6 <get_a_virtual_page>:
c01060d6:	55                   	push   %ebp
c01060d7:	89 e5                	mov    %esp,%ebp
c01060d9:	83 ec 18             	sub    $0x18,%esp
c01060dc:	83 ec 0c             	sub    $0xc,%esp
c01060df:	ff 75 08             	pushl  0x8(%ebp)
c01060e2:	e8 ac f9 ff ff       	call   c0105a93 <get_a_page>
c01060e7:	83 c4 10             	add    $0x10,%esp
c01060ea:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01060ed:	8b 45 0c             	mov    0xc(%ebp),%eax
c01060f0:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01060f5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01060f8:	83 ec 08             	sub    $0x8,%esp
c01060fb:	ff 75 f4             	pushl  -0xc(%ebp)
c01060fe:	ff 75 f0             	pushl  -0x10(%ebp)
c0106101:	e8 a5 fb ff ff       	call   c0105cab <add_map_entry>
c0106106:	83 c4 10             	add    $0x10,%esp
c0106109:	8b 45 0c             	mov    0xc(%ebp),%eax
c010610c:	c9                   	leave  
c010610d:	c3                   	ret    

c010610e <block2arena>:
c010610e:	55                   	push   %ebp
c010610f:	89 e5                	mov    %esp,%ebp
c0106111:	83 ec 10             	sub    $0x10,%esp
c0106114:	8b 45 08             	mov    0x8(%ebp),%eax
c0106117:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010611c:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010611f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106122:	c9                   	leave  
c0106123:	c3                   	ret    

c0106124 <sys_malloc2>:
c0106124:	55                   	push   %ebp
c0106125:	89 e5                	mov    %esp,%ebp
c0106127:	83 ec 68             	sub    $0x68,%esp
c010612a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106131:	e8 6d a2 ff ff       	call   c01003a3 <get_running_thread_pcb>
c0106136:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0106139:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010613c:	8b 50 08             	mov    0x8(%eax),%edx
c010613f:	a1 28 0f 11 c0       	mov    0xc0110f28,%eax
c0106144:	39 c2                	cmp    %eax,%edx
c0106146:	75 10                	jne    c0106158 <sys_malloc2+0x34>
c0106148:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c010614f:	c7 45 ec e0 37 18 c0 	movl   $0xc01837e0,-0x14(%ebp)
c0106156:	eb 10                	jmp    c0106168 <sys_malloc2+0x44>
c0106158:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c010615f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106162:	83 c0 10             	add    $0x10,%eax
c0106165:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106168:	81 7d 08 00 04 00 00 	cmpl   $0x400,0x8(%ebp)
c010616f:	76 52                	jbe    c01061c3 <sys_malloc2+0x9f>
c0106171:	8b 45 08             	mov    0x8(%ebp),%eax
c0106174:	05 0b 10 00 00       	add    $0x100b,%eax
c0106179:	c1 e8 0c             	shr    $0xc,%eax
c010617c:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010617f:	83 ec 08             	sub    $0x8,%esp
c0106182:	ff 75 f0             	pushl  -0x10(%ebp)
c0106185:	ff 75 d8             	pushl  -0x28(%ebp)
c0106188:	e8 e7 fe ff ff       	call   c0106074 <alloc_memory>
c010618d:	83 c4 10             	add    $0x10,%esp
c0106190:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106193:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106196:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0106199:	8b 45 d0             	mov    -0x30(%ebp),%eax
c010619c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c01061a2:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01061a5:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c01061ac:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01061af:	c6 40 08 01          	movb   $0x1,0x8(%eax)
c01061b3:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01061b6:	05 90 00 00 00       	add    $0x90,%eax
c01061bb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01061be:	e9 f0 01 00 00       	jmp    c01063b3 <sys_malloc2+0x28f>
c01061c3:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01061ca:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01061d1:	eb 26                	jmp    c01061f9 <sys_malloc2+0xd5>
c01061d3:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01061d6:	89 d0                	mov    %edx,%eax
c01061d8:	01 c0                	add    %eax,%eax
c01061da:	01 d0                	add    %edx,%eax
c01061dc:	c1 e0 03             	shl    $0x3,%eax
c01061df:	89 c2                	mov    %eax,%edx
c01061e1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01061e4:	01 d0                	add    %edx,%eax
c01061e6:	8b 00                	mov    (%eax),%eax
c01061e8:	39 45 08             	cmp    %eax,0x8(%ebp)
c01061eb:	77 08                	ja     c01061f5 <sys_malloc2+0xd1>
c01061ed:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01061f0:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01061f3:	eb 0a                	jmp    c01061ff <sys_malloc2+0xdb>
c01061f5:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c01061f9:	83 7d e4 09          	cmpl   $0x9,-0x1c(%ebp)
c01061fd:	7e d4                	jle    c01061d3 <sys_malloc2+0xaf>
c01061ff:	83 ec 08             	sub    $0x8,%esp
c0106202:	ff 75 f0             	pushl  -0x10(%ebp)
c0106205:	6a 01                	push   $0x1
c0106207:	e8 68 fe ff ff       	call   c0106074 <alloc_memory>
c010620c:	83 c4 10             	add    $0x10,%esp
c010620f:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0106212:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0106215:	89 d0                	mov    %edx,%eax
c0106217:	01 c0                	add    %eax,%eax
c0106219:	01 d0                	add    %edx,%eax
c010621b:	c1 e0 03             	shl    $0x3,%eax
c010621e:	89 c2                	mov    %eax,%edx
c0106220:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106223:	01 d0                	add    %edx,%eax
c0106225:	83 ec 04             	sub    $0x4,%esp
c0106228:	6a 18                	push   $0x18
c010622a:	50                   	push   %eax
c010622b:	ff 75 cc             	pushl  -0x34(%ebp)
c010622e:	e8 76 09 00 00       	call   c0106ba9 <Memcpy>
c0106233:	83 c4 10             	add    $0x10,%esp
c0106236:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c010623d:	e8 03 09 00 00       	call   c0106b45 <intr_disable>
c0106242:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0106245:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0106248:	89 d0                	mov    %edx,%eax
c010624a:	01 c0                	add    %eax,%eax
c010624c:	01 d0                	add    %edx,%eax
c010624e:	c1 e0 03             	shl    $0x3,%eax
c0106251:	89 c2                	mov    %eax,%edx
c0106253:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106256:	01 d0                	add    %edx,%eax
c0106258:	83 c0 08             	add    $0x8,%eax
c010625b:	83 ec 0c             	sub    $0xc,%esp
c010625e:	50                   	push   %eax
c010625f:	e8 0f 3b 00 00       	call   c0109d73 <isListEmpty>
c0106264:	83 c4 10             	add    $0x10,%esp
c0106267:	3c 01                	cmp    $0x1,%al
c0106269:	0f 85 c1 00 00 00    	jne    c0106330 <sys_malloc2+0x20c>
c010626f:	c7 45 c8 01 00 00 00 	movl   $0x1,-0x38(%ebp)
c0106276:	83 ec 08             	sub    $0x8,%esp
c0106279:	ff 75 f0             	pushl  -0x10(%ebp)
c010627c:	6a 01                	push   $0x1
c010627e:	e8 f1 fd ff ff       	call   c0106074 <alloc_memory>
c0106283:	83 c4 10             	add    $0x10,%esp
c0106286:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0106289:	8b 45 c0             	mov    -0x40(%ebp),%eax
c010628c:	83 ec 0c             	sub    $0xc,%esp
c010628f:	50                   	push   %eax
c0106290:	e8 79 fe ff ff       	call   c010610e <block2arena>
c0106295:	83 c4 10             	add    $0x10,%esp
c0106298:	89 45 bc             	mov    %eax,-0x44(%ebp)
c010629b:	8b 55 e8             	mov    -0x18(%ebp),%edx
c010629e:	89 d0                	mov    %edx,%eax
c01062a0:	01 c0                	add    %eax,%eax
c01062a2:	01 d0                	add    %edx,%eax
c01062a4:	c1 e0 03             	shl    $0x3,%eax
c01062a7:	89 c2                	mov    %eax,%edx
c01062a9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01062ac:	01 d0                	add    %edx,%eax
c01062ae:	8b 50 04             	mov    0x4(%eax),%edx
c01062b1:	8b 45 bc             	mov    -0x44(%ebp),%eax
c01062b4:	89 50 04             	mov    %edx,0x4(%eax)
c01062b7:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01062ba:	8b 00                	mov    (%eax),%eax
c01062bc:	89 45 b8             	mov    %eax,-0x48(%ebp)
c01062bf:	c7 45 b4 0c 00 00 00 	movl   $0xc,-0x4c(%ebp)
c01062c6:	b8 00 10 00 00       	mov    $0x1000,%eax
c01062cb:	2b 45 b4             	sub    -0x4c(%ebp),%eax
c01062ce:	ba 00 00 00 00       	mov    $0x0,%edx
c01062d3:	f7 75 b8             	divl   -0x48(%ebp)
c01062d6:	89 45 b0             	mov    %eax,-0x50(%ebp)
c01062d9:	8b 55 c0             	mov    -0x40(%ebp),%edx
c01062dc:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c01062df:	01 d0                	add    %edx,%eax
c01062e1:	89 45 ac             	mov    %eax,-0x54(%ebp)
c01062e4:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c01062eb:	eb 3b                	jmp    c0106328 <sys_malloc2+0x204>
c01062ed:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01062f0:	0f af 45 b8          	imul   -0x48(%ebp),%eax
c01062f4:	89 c2                	mov    %eax,%edx
c01062f6:	8b 45 ac             	mov    -0x54(%ebp),%eax
c01062f9:	01 d0                	add    %edx,%eax
c01062fb:	89 45 a8             	mov    %eax,-0x58(%ebp)
c01062fe:	8b 4d a8             	mov    -0x58(%ebp),%ecx
c0106301:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0106304:	89 d0                	mov    %edx,%eax
c0106306:	01 c0                	add    %eax,%eax
c0106308:	01 d0                	add    %edx,%eax
c010630a:	c1 e0 03             	shl    $0x3,%eax
c010630d:	89 c2                	mov    %eax,%edx
c010630f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106312:	01 d0                	add    %edx,%eax
c0106314:	83 c0 08             	add    $0x8,%eax
c0106317:	83 ec 08             	sub    $0x8,%esp
c010631a:	51                   	push   %ecx
c010631b:	50                   	push   %eax
c010631c:	e8 4f 3b 00 00       	call   c0109e70 <appendToDoubleLinkList>
c0106321:	83 c4 10             	add    $0x10,%esp
c0106324:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0106328:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010632b:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c010632e:	77 bd                	ja     c01062ed <sys_malloc2+0x1c9>
c0106330:	83 ec 0c             	sub    $0xc,%esp
c0106333:	ff 75 c4             	pushl  -0x3c(%ebp)
c0106336:	e8 33 08 00 00       	call   c0106b6e <intr_set_status>
c010633b:	83 c4 10             	add    $0x10,%esp
c010633e:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0106341:	89 d0                	mov    %edx,%eax
c0106343:	01 c0                	add    %eax,%eax
c0106345:	01 d0                	add    %edx,%eax
c0106347:	c1 e0 03             	shl    $0x3,%eax
c010634a:	89 c2                	mov    %eax,%edx
c010634c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010634f:	01 d0                	add    %edx,%eax
c0106351:	83 c0 08             	add    $0x8,%eax
c0106354:	83 ec 0c             	sub    $0xc,%esp
c0106357:	50                   	push   %eax
c0106358:	e8 7d 3c 00 00       	call   c0109fda <popFromDoubleLinkList>
c010635d:	83 c4 10             	add    $0x10,%esp
c0106360:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0106363:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0106366:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106369:	83 7d a8 00          	cmpl   $0x0,-0x58(%ebp)
c010636d:	75 1c                	jne    c010638b <sys_malloc2+0x267>
c010636f:	68 ef 01 00 00       	push   $0x1ef
c0106374:	68 66 a7 10 c0       	push   $0xc010a766
c0106379:	68 66 a7 10 c0       	push   $0xc010a766
c010637e:	68 87 a7 10 c0       	push   $0xc010a787
c0106383:	e8 26 22 00 00       	call   c01085ae <assertion_failure>
c0106388:	83 c4 10             	add    $0x10,%esp
c010638b:	8b 45 a8             	mov    -0x58(%ebp),%eax
c010638e:	83 ec 0c             	sub    $0xc,%esp
c0106391:	50                   	push   %eax
c0106392:	e8 77 fd ff ff       	call   c010610e <block2arena>
c0106397:	83 c4 10             	add    $0x10,%esp
c010639a:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c010639d:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c01063a0:	8b 40 04             	mov    0x4(%eax),%eax
c01063a3:	8d 50 ff             	lea    -0x1(%eax),%edx
c01063a6:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c01063a9:	89 50 04             	mov    %edx,0x4(%eax)
c01063ac:	c7 45 c4 04 00 00 00 	movl   $0x4,-0x3c(%ebp)
c01063b3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01063b7:	75 1c                	jne    c01063d5 <sys_malloc2+0x2b1>
c01063b9:	68 f6 01 00 00       	push   $0x1f6
c01063be:	68 66 a7 10 c0       	push   $0xc010a766
c01063c3:	68 66 a7 10 c0       	push   $0xc010a766
c01063c8:	68 99 a7 10 c0       	push   $0xc010a799
c01063cd:	e8 dc 21 00 00       	call   c01085ae <assertion_failure>
c01063d2:	83 c4 10             	add    $0x10,%esp
c01063d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01063d8:	c9                   	leave  
c01063d9:	c3                   	ret    

c01063da <remove_map_entry>:
c01063da:	55                   	push   %ebp
c01063db:	89 e5                	mov    %esp,%ebp
c01063dd:	83 ec 10             	sub    $0x10,%esp
c01063e0:	ff 75 08             	pushl  0x8(%ebp)
c01063e3:	e8 9c f8 ff ff       	call   c0105c84 <ptr_pte>
c01063e8:	83 c4 04             	add    $0x4,%esp
c01063eb:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01063ee:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01063f1:	8b 10                	mov    (%eax),%edx
c01063f3:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01063f6:	89 10                	mov    %edx,(%eax)
c01063f8:	90                   	nop
c01063f9:	c9                   	leave  
c01063fa:	c3                   	ret    

c01063fb <free_a_page>:
c01063fb:	55                   	push   %ebp
c01063fc:	89 e5                	mov    %esp,%ebp
c01063fe:	83 ec 20             	sub    $0x20,%esp
c0106401:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0106405:	75 21                	jne    c0106428 <free_a_page+0x2d>
c0106407:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c010640c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010640f:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0106414:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106417:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c010641c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010641f:	c7 45 fc ac 06 11 c0 	movl   $0xc01106ac,-0x4(%ebp)
c0106426:	eb 1f                	jmp    c0106447 <free_a_page+0x4c>
c0106428:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c010642d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106430:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0106435:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106438:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c010643d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106440:	c7 45 fc f4 0e 11 c0 	movl   $0xc0110ef4,-0x4(%ebp)
c0106447:	8b 45 08             	mov    0x8(%ebp),%eax
c010644a:	c1 e8 0c             	shr    $0xc,%eax
c010644d:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0106450:	6a 00                	push   $0x0
c0106452:	ff 75 f8             	pushl  -0x8(%ebp)
c0106455:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c0106458:	50                   	push   %eax
c0106459:	e8 74 f4 ff ff       	call   c01058d2 <set_bit_val>
c010645e:	83 c4 0c             	add    $0xc,%esp
c0106461:	ff 75 08             	pushl  0x8(%ebp)
c0106464:	e8 22 fa ff ff       	call   c0105e8b <get_physical_address>
c0106469:	83 c4 04             	add    $0x4,%esp
c010646c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010646f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106472:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106478:	85 c0                	test   %eax,%eax
c010647a:	0f 48 c2             	cmovs  %edx,%eax
c010647d:	c1 f8 0c             	sar    $0xc,%eax
c0106480:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0106483:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106486:	6a 00                	push   $0x0
c0106488:	ff 75 f0             	pushl  -0x10(%ebp)
c010648b:	50                   	push   %eax
c010648c:	e8 41 f4 ff ff       	call   c01058d2 <set_bit_val>
c0106491:	83 c4 0c             	add    $0xc,%esp
c0106494:	ff 75 08             	pushl  0x8(%ebp)
c0106497:	e8 3e ff ff ff       	call   c01063da <remove_map_entry>
c010649c:	83 c4 04             	add    $0x4,%esp
c010649f:	90                   	nop
c01064a0:	c9                   	leave  
c01064a1:	c3                   	ret    

c01064a2 <sys_free2>:
c01064a2:	55                   	push   %ebp
c01064a3:	89 e5                	mov    %esp,%ebp
c01064a5:	83 ec 58             	sub    $0x58,%esp
c01064a8:	e8 f6 9e ff ff       	call   c01003a3 <get_running_thread_pcb>
c01064ad:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01064b0:	e8 90 06 00 00       	call   c0106b45 <intr_disable>
c01064b5:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01064b8:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01064bb:	8b 50 08             	mov    0x8(%eax),%edx
c01064be:	a1 28 0f 11 c0       	mov    0xc0110f28,%eax
c01064c3:	39 c2                	cmp    %eax,%edx
c01064c5:	75 10                	jne    c01064d7 <sys_free2+0x35>
c01064c7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01064ce:	c7 45 f0 e0 37 18 c0 	movl   $0xc01837e0,-0x10(%ebp)
c01064d5:	eb 10                	jmp    c01064e7 <sys_free2+0x45>
c01064d7:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c01064de:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01064e1:	83 c0 10             	add    $0x10,%eax
c01064e4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01064e7:	81 7d 0c 00 04 00 00 	cmpl   $0x400,0xc(%ebp)
c01064ee:	76 4d                	jbe    c010653d <sys_free2+0x9b>
c01064f0:	8b 45 08             	mov    0x8(%ebp),%eax
c01064f3:	83 e8 0c             	sub    $0xc,%eax
c01064f6:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01064f9:	83 45 0c 0c          	addl   $0xc,0xc(%ebp)
c01064fd:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106500:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106505:	c1 e8 0c             	shr    $0xc,%eax
c0106508:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010650b:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0106512:	eb 1c                	jmp    c0106530 <sys_free2+0x8e>
c0106514:	83 ec 08             	sub    $0x8,%esp
c0106517:	ff 75 f4             	pushl  -0xc(%ebp)
c010651a:	ff 75 ec             	pushl  -0x14(%ebp)
c010651d:	e8 d9 fe ff ff       	call   c01063fb <free_a_page>
c0106522:	83 c4 10             	add    $0x10,%esp
c0106525:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
c010652c:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0106530:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106533:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
c0106536:	77 dc                	ja     c0106514 <sys_free2+0x72>
c0106538:	e9 dc 00 00 00       	jmp    c0106619 <sys_free2+0x177>
c010653d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0106544:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c010654b:	eb 26                	jmp    c0106573 <sys_free2+0xd1>
c010654d:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0106550:	89 d0                	mov    %edx,%eax
c0106552:	01 c0                	add    %eax,%eax
c0106554:	01 d0                	add    %edx,%eax
c0106556:	c1 e0 03             	shl    $0x3,%eax
c0106559:	89 c2                	mov    %eax,%edx
c010655b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010655e:	01 d0                	add    %edx,%eax
c0106560:	8b 00                	mov    (%eax),%eax
c0106562:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0106565:	77 08                	ja     c010656f <sys_free2+0xcd>
c0106567:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010656a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010656d:	eb 0a                	jmp    c0106579 <sys_free2+0xd7>
c010656f:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0106573:	83 7d e0 09          	cmpl   $0x9,-0x20(%ebp)
c0106577:	7e d4                	jle    c010654d <sys_free2+0xab>
c0106579:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c010657c:	89 d0                	mov    %edx,%eax
c010657e:	01 c0                	add    %eax,%eax
c0106580:	01 d0                	add    %edx,%eax
c0106582:	c1 e0 03             	shl    $0x3,%eax
c0106585:	89 c2                	mov    %eax,%edx
c0106587:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010658a:	01 d0                	add    %edx,%eax
c010658c:	8b 10                	mov    (%eax),%edx
c010658e:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c0106591:	8b 50 04             	mov    0x4(%eax),%edx
c0106594:	89 55 b8             	mov    %edx,-0x48(%ebp)
c0106597:	8b 50 08             	mov    0x8(%eax),%edx
c010659a:	89 55 bc             	mov    %edx,-0x44(%ebp)
c010659d:	8b 50 0c             	mov    0xc(%eax),%edx
c01065a0:	89 55 c0             	mov    %edx,-0x40(%ebp)
c01065a3:	8b 50 10             	mov    0x10(%eax),%edx
c01065a6:	89 55 c4             	mov    %edx,-0x3c(%ebp)
c01065a9:	8b 40 14             	mov    0x14(%eax),%eax
c01065ac:	89 45 c8             	mov    %eax,-0x38(%ebp)
c01065af:	8b 45 08             	mov    0x8(%ebp),%eax
c01065b2:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01065b5:	83 ec 0c             	sub    $0xc,%esp
c01065b8:	ff 75 d0             	pushl  -0x30(%ebp)
c01065bb:	e8 4e fb ff ff       	call   c010610e <block2arena>
c01065c0:	83 c4 10             	add    $0x10,%esp
c01065c3:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01065c6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01065c9:	89 d0                	mov    %edx,%eax
c01065cb:	01 c0                	add    %eax,%eax
c01065cd:	01 d0                	add    %edx,%eax
c01065cf:	c1 e0 03             	shl    $0x3,%eax
c01065d2:	89 c2                	mov    %eax,%edx
c01065d4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01065d7:	01 d0                	add    %edx,%eax
c01065d9:	83 c0 08             	add    $0x8,%eax
c01065dc:	83 ec 08             	sub    $0x8,%esp
c01065df:	ff 75 d0             	pushl  -0x30(%ebp)
c01065e2:	50                   	push   %eax
c01065e3:	e8 88 38 00 00       	call   c0109e70 <appendToDoubleLinkList>
c01065e8:	83 c4 10             	add    $0x10,%esp
c01065eb:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01065ee:	8b 40 04             	mov    0x4(%eax),%eax
c01065f1:	8d 50 01             	lea    0x1(%eax),%edx
c01065f4:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01065f7:	89 50 04             	mov    %edx,0x4(%eax)
c01065fa:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01065fd:	8b 50 04             	mov    0x4(%eax),%edx
c0106600:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0106603:	39 c2                	cmp    %eax,%edx
c0106605:	75 12                	jne    c0106619 <sys_free2+0x177>
c0106607:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010660a:	83 ec 08             	sub    $0x8,%esp
c010660d:	ff 75 f4             	pushl  -0xc(%ebp)
c0106610:	50                   	push   %eax
c0106611:	e8 e5 fd ff ff       	call   c01063fb <free_a_page>
c0106616:	83 c4 10             	add    $0x10,%esp
c0106619:	83 ec 0c             	sub    $0xc,%esp
c010661c:	ff 75 d8             	pushl  -0x28(%ebp)
c010661f:	e8 4a 05 00 00       	call   c0106b6e <intr_set_status>
c0106624:	83 c4 10             	add    $0x10,%esp
c0106627:	90                   	nop
c0106628:	c9                   	leave  
c0106629:	c3                   	ret    

c010662a <init_memory_block_desc>:
c010662a:	55                   	push   %ebp
c010662b:	89 e5                	mov    %esp,%ebp
c010662d:	83 ec 18             	sub    $0x18,%esp
c0106630:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106637:	e9 b2 00 00 00       	jmp    c01066ee <init_memory_block_desc+0xc4>
c010663c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0106640:	75 1b                	jne    c010665d <init_memory_block_desc+0x33>
c0106642:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106645:	89 d0                	mov    %edx,%eax
c0106647:	01 c0                	add    %eax,%eax
c0106649:	01 d0                	add    %edx,%eax
c010664b:	c1 e0 03             	shl    $0x3,%eax
c010664e:	89 c2                	mov    %eax,%edx
c0106650:	8b 45 08             	mov    0x8(%ebp),%eax
c0106653:	01 d0                	add    %edx,%eax
c0106655:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c010665b:	eb 2e                	jmp    c010668b <init_memory_block_desc+0x61>
c010665d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106660:	89 d0                	mov    %edx,%eax
c0106662:	01 c0                	add    %eax,%eax
c0106664:	01 d0                	add    %edx,%eax
c0106666:	c1 e0 03             	shl    $0x3,%eax
c0106669:	8d 50 e8             	lea    -0x18(%eax),%edx
c010666c:	8b 45 08             	mov    0x8(%ebp),%eax
c010666f:	01 d0                	add    %edx,%eax
c0106671:	8b 08                	mov    (%eax),%ecx
c0106673:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106676:	89 d0                	mov    %edx,%eax
c0106678:	01 c0                	add    %eax,%eax
c010667a:	01 d0                	add    %edx,%eax
c010667c:	c1 e0 03             	shl    $0x3,%eax
c010667f:	89 c2                	mov    %eax,%edx
c0106681:	8b 45 08             	mov    0x8(%ebp),%eax
c0106684:	01 d0                	add    %edx,%eax
c0106686:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
c0106689:	89 10                	mov    %edx,(%eax)
c010668b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010668e:	89 d0                	mov    %edx,%eax
c0106690:	01 c0                	add    %eax,%eax
c0106692:	01 d0                	add    %edx,%eax
c0106694:	c1 e0 03             	shl    $0x3,%eax
c0106697:	89 c2                	mov    %eax,%edx
c0106699:	8b 45 08             	mov    0x8(%ebp),%eax
c010669c:	01 d0                	add    %edx,%eax
c010669e:	8b 00                	mov    (%eax),%eax
c01066a0:	89 c1                	mov    %eax,%ecx
c01066a2:	b8 f4 0f 00 00       	mov    $0xff4,%eax
c01066a7:	ba 00 00 00 00       	mov    $0x0,%edx
c01066ac:	f7 f1                	div    %ecx
c01066ae:	89 c1                	mov    %eax,%ecx
c01066b0:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01066b3:	89 d0                	mov    %edx,%eax
c01066b5:	01 c0                	add    %eax,%eax
c01066b7:	01 d0                	add    %edx,%eax
c01066b9:	c1 e0 03             	shl    $0x3,%eax
c01066bc:	89 c2                	mov    %eax,%edx
c01066be:	8b 45 08             	mov    0x8(%ebp),%eax
c01066c1:	01 d0                	add    %edx,%eax
c01066c3:	89 ca                	mov    %ecx,%edx
c01066c5:	89 50 04             	mov    %edx,0x4(%eax)
c01066c8:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01066cb:	89 d0                	mov    %edx,%eax
c01066cd:	01 c0                	add    %eax,%eax
c01066cf:	01 d0                	add    %edx,%eax
c01066d1:	c1 e0 03             	shl    $0x3,%eax
c01066d4:	89 c2                	mov    %eax,%edx
c01066d6:	8b 45 08             	mov    0x8(%ebp),%eax
c01066d9:	01 d0                	add    %edx,%eax
c01066db:	83 c0 08             	add    $0x8,%eax
c01066de:	83 ec 0c             	sub    $0xc,%esp
c01066e1:	50                   	push   %eax
c01066e2:	e8 5e 36 00 00       	call   c0109d45 <initDoubleLinkList>
c01066e7:	83 c4 10             	add    $0x10,%esp
c01066ea:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01066ee:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c01066f2:	0f 8e 44 ff ff ff    	jle    c010663c <init_memory_block_desc+0x12>
c01066f8:	90                   	nop
c01066f9:	c9                   	leave  
c01066fa:	c3                   	ret    

c01066fb <init_memory2>:
c01066fb:	55                   	push   %ebp
c01066fc:	89 e5                	mov    %esp,%ebp
c01066fe:	83 ec 38             	sub    $0x38,%esp
c0106701:	c7 45 f4 00 00 00 02 	movl   $0x2000000,-0xc(%ebp)
c0106708:	c7 45 f0 00 20 10 00 	movl   $0x102000,-0x10(%ebp)
c010670f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106712:	a3 b4 06 11 c0       	mov    %eax,0xc01106b4
c0106717:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010671a:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c010671f:	29 c2                	sub    %eax,%edx
c0106721:	89 d0                	mov    %edx,%eax
c0106723:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106726:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106729:	89 c2                	mov    %eax,%edx
c010672b:	c1 ea 1f             	shr    $0x1f,%edx
c010672e:	01 d0                	add    %edx,%eax
c0106730:	d1 f8                	sar    %eax
c0106732:	a3 b8 06 11 c0       	mov    %eax,0xc01106b8
c0106737:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c010673c:	83 ec 0c             	sub    $0xc,%esp
c010673f:	50                   	push   %eax
c0106740:	e8 52 08 00 00       	call   c0106f97 <disp_int>
c0106745:	83 c4 10             	add    $0x10,%esp
c0106748:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c010674d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106750:	29 c2                	sub    %eax,%edx
c0106752:	89 d0                	mov    %edx,%eax
c0106754:	a3 00 0f 11 c0       	mov    %eax,0xc0110f00
c0106759:	83 ec 0c             	sub    $0xc,%esp
c010675c:	68 a5 a7 10 c0       	push   $0xc010a7a5
c0106761:	e8 26 99 ff ff       	call   c010008c <disp_str>
c0106766:	83 c4 10             	add    $0x10,%esp
c0106769:	a1 00 0f 11 c0       	mov    0xc0110f00,%eax
c010676e:	83 ec 0c             	sub    $0xc,%esp
c0106771:	50                   	push   %eax
c0106772:	e8 20 08 00 00       	call   c0106f97 <disp_int>
c0106777:	83 c4 10             	add    $0x10,%esp
c010677a:	83 ec 0c             	sub    $0xc,%esp
c010677d:	68 a5 a7 10 c0       	push   $0xc010a7a5
c0106782:	e8 05 99 ff ff       	call   c010008c <disp_str>
c0106787:	83 c4 10             	add    $0x10,%esp
c010678a:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c010678f:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106794:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c010679a:	85 c0                	test   %eax,%eax
c010679c:	0f 48 c2             	cmovs  %edx,%eax
c010679f:	c1 f8 0c             	sar    $0xc,%eax
c01067a2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01067a5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01067a8:	83 c0 07             	add    $0x7,%eax
c01067ab:	8d 50 07             	lea    0x7(%eax),%edx
c01067ae:	85 c0                	test   %eax,%eax
c01067b0:	0f 48 c2             	cmovs  %edx,%eax
c01067b3:	c1 f8 03             	sar    $0x3,%eax
c01067b6:	a3 b0 06 11 c0       	mov    %eax,0xc01106b0
c01067bb:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c01067c0:	2d 00 00 00 40       	sub    $0x40000000,%eax
c01067c5:	a3 ac 06 11 c0       	mov    %eax,0xc01106ac
c01067ca:	8b 15 b0 06 11 c0    	mov    0xc01106b0,%edx
c01067d0:	a1 ac 06 11 c0       	mov    0xc01106ac,%eax
c01067d5:	83 ec 04             	sub    $0x4,%esp
c01067d8:	52                   	push   %edx
c01067d9:	6a 00                	push   $0x0
c01067db:	50                   	push   %eax
c01067dc:	e8 4a 4a 00 00       	call   c010b22b <Memset>
c01067e1:	83 c4 10             	add    $0x10,%esp
c01067e4:	a1 b0 06 11 c0       	mov    0xc01106b0,%eax
c01067e9:	05 ff 0f 00 00       	add    $0xfff,%eax
c01067ee:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c01067f4:	85 c0                	test   %eax,%eax
c01067f6:	0f 48 c2             	cmovs  %edx,%eax
c01067f9:	c1 f8 0c             	sar    $0xc,%eax
c01067fc:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01067ff:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106802:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106805:	ff 75 e8             	pushl  -0x18(%ebp)
c0106808:	6a 01                	push   $0x1
c010680a:	6a 00                	push   $0x0
c010680c:	68 ac 06 11 c0       	push   $0xc01106ac
c0106811:	e8 37 f1 ff ff       	call   c010594d <set_bits>
c0106816:	83 c4 10             	add    $0x10,%esp
c0106819:	a1 00 0f 11 c0       	mov    0xc0110f00,%eax
c010681e:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106823:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106829:	85 c0                	test   %eax,%eax
c010682b:	0f 48 c2             	cmovs  %edx,%eax
c010682e:	c1 f8 0c             	sar    $0xc,%eax
c0106831:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106834:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106837:	83 c0 07             	add    $0x7,%eax
c010683a:	8d 50 07             	lea    0x7(%eax),%edx
c010683d:	85 c0                	test   %eax,%eax
c010683f:	0f 48 c2             	cmovs  %edx,%eax
c0106842:	c1 f8 03             	sar    $0x3,%eax
c0106845:	a3 f8 0e 11 c0       	mov    %eax,0xc0110ef8
c010684a:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c010684f:	8b 15 b0 06 11 c0    	mov    0xc01106b0,%edx
c0106855:	01 d0                	add    %edx,%eax
c0106857:	a3 f4 0e 11 c0       	mov    %eax,0xc0110ef4
c010685c:	8b 15 f8 0e 11 c0    	mov    0xc0110ef8,%edx
c0106862:	a1 f4 0e 11 c0       	mov    0xc0110ef4,%eax
c0106867:	83 ec 04             	sub    $0x4,%esp
c010686a:	52                   	push   %edx
c010686b:	6a 00                	push   $0x0
c010686d:	50                   	push   %eax
c010686e:	e8 b8 49 00 00       	call   c010b22b <Memset>
c0106873:	83 c4 10             	add    $0x10,%esp
c0106876:	a1 f8 0e 11 c0       	mov    0xc0110ef8,%eax
c010687b:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106880:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106886:	85 c0                	test   %eax,%eax
c0106888:	0f 48 c2             	cmovs  %edx,%eax
c010688b:	c1 f8 0c             	sar    $0xc,%eax
c010688e:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106891:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106894:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106897:	ff 75 e8             	pushl  -0x18(%ebp)
c010689a:	6a 01                	push   $0x1
c010689c:	ff 75 e0             	pushl  -0x20(%ebp)
c010689f:	68 ac 06 11 c0       	push   $0xc01106ac
c01068a4:	e8 a4 f0 ff ff       	call   c010594d <set_bits>
c01068a9:	83 c4 10             	add    $0x10,%esp
c01068ac:	c7 45 dc 00 00 10 00 	movl   $0x100000,-0x24(%ebp)
c01068b3:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01068b6:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01068b9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01068bc:	83 c0 07             	add    $0x7,%eax
c01068bf:	8d 50 07             	lea    0x7(%eax),%edx
c01068c2:	85 c0                	test   %eax,%eax
c01068c4:	0f 48 c2             	cmovs  %edx,%eax
c01068c7:	c1 f8 03             	sar    $0x3,%eax
c01068ca:	a3 98 f7 10 c0       	mov    %eax,0xc010f798
c01068cf:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c01068d4:	8b 15 b0 06 11 c0    	mov    0xc01106b0,%edx
c01068da:	01 c2                	add    %eax,%edx
c01068dc:	a1 f8 0e 11 c0       	mov    0xc0110ef8,%eax
c01068e1:	01 d0                	add    %edx,%eax
c01068e3:	a3 94 f7 10 c0       	mov    %eax,0xc010f794
c01068e8:	8b 15 98 f7 10 c0    	mov    0xc010f798,%edx
c01068ee:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c01068f3:	83 ec 04             	sub    $0x4,%esp
c01068f6:	52                   	push   %edx
c01068f7:	6a 00                	push   $0x0
c01068f9:	50                   	push   %eax
c01068fa:	e8 2c 49 00 00       	call   c010b22b <Memset>
c01068ff:	83 c4 10             	add    $0x10,%esp
c0106902:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0106905:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106908:	01 d0                	add    %edx,%eax
c010690a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010690d:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0106912:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106917:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c010691d:	85 c0                	test   %eax,%eax
c010691f:	0f 48 c2             	cmovs  %edx,%eax
c0106922:	c1 f8 0c             	sar    $0xc,%eax
c0106925:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106928:	ff 75 e8             	pushl  -0x18(%ebp)
c010692b:	6a 01                	push   $0x1
c010692d:	ff 75 e0             	pushl  -0x20(%ebp)
c0106930:	68 ac 06 11 c0       	push   $0xc01106ac
c0106935:	e8 13 f0 ff ff       	call   c010594d <set_bits>
c010693a:	83 c4 10             	add    $0x10,%esp
c010693d:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0106940:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106943:	01 d0                	add    %edx,%eax
c0106945:	c1 e0 0c             	shl    $0xc,%eax
c0106948:	a3 9c f7 10 c0       	mov    %eax,0xc010f79c
c010694d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106950:	83 c0 02             	add    $0x2,%eax
c0106953:	c1 e0 0c             	shl    $0xc,%eax
c0106956:	89 c2                	mov    %eax,%edx
c0106958:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010695b:	01 d0                	add    %edx,%eax
c010695d:	a3 9c f7 10 c0       	mov    %eax,0xc010f79c
c0106962:	c7 45 d8 05 00 00 00 	movl   $0x5,-0x28(%ebp)
c0106969:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010696c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010696f:	90                   	nop
c0106970:	c9                   	leave  
c0106971:	c3                   	ret    

c0106972 <init_memory>:
c0106972:	55                   	push   %ebp
c0106973:	89 e5                	mov    %esp,%ebp
c0106975:	83 ec 38             	sub    $0x38,%esp
c0106978:	c7 45 f4 00 00 02 c0 	movl   $0xc0020000,-0xc(%ebp)
c010697f:	c7 45 f0 00 00 40 c0 	movl   $0xc0400000,-0x10(%ebp)
c0106986:	c7 45 ec 00 00 10 00 	movl   $0x100000,-0x14(%ebp)
c010698d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106990:	05 00 00 40 00       	add    $0x400000,%eax
c0106995:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106998:	8b 45 08             	mov    0x8(%ebp),%eax
c010699b:	2b 45 e8             	sub    -0x18(%ebp),%eax
c010699e:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c01069a4:	85 c0                	test   %eax,%eax
c01069a6:	0f 48 c2             	cmovs  %edx,%eax
c01069a9:	c1 f8 0c             	sar    $0xc,%eax
c01069ac:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01069af:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01069b2:	89 c2                	mov    %eax,%edx
c01069b4:	c1 ea 1f             	shr    $0x1f,%edx
c01069b7:	01 d0                	add    %edx,%eax
c01069b9:	d1 f8                	sar    %eax
c01069bb:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01069be:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01069c1:	2b 45 e0             	sub    -0x20(%ebp),%eax
c01069c4:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01069c7:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01069ca:	8d 50 07             	lea    0x7(%eax),%edx
c01069cd:	85 c0                	test   %eax,%eax
c01069cf:	0f 48 c2             	cmovs  %edx,%eax
c01069d2:	c1 f8 03             	sar    $0x3,%eax
c01069d5:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01069d8:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01069db:	8d 50 07             	lea    0x7(%eax),%edx
c01069de:	85 c0                	test   %eax,%eax
c01069e0:	0f 48 c2             	cmovs  %edx,%eax
c01069e3:	c1 f8 03             	sar    $0x3,%eax
c01069e6:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01069e9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01069ec:	a3 b4 06 11 c0       	mov    %eax,0xc01106b4
c01069f1:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c01069f6:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01069f9:	c1 e2 0c             	shl    $0xc,%edx
c01069fc:	01 d0                	add    %edx,%eax
c01069fe:	a3 fc 0e 11 c0       	mov    %eax,0xc0110efc
c0106a03:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106a06:	a3 ac 06 11 c0       	mov    %eax,0xc01106ac
c0106a0b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106a0e:	a3 b0 06 11 c0       	mov    %eax,0xc01106b0
c0106a13:	a1 ac 06 11 c0       	mov    0xc01106ac,%eax
c0106a18:	83 ec 04             	sub    $0x4,%esp
c0106a1b:	ff 75 d8             	pushl  -0x28(%ebp)
c0106a1e:	6a 00                	push   $0x0
c0106a20:	50                   	push   %eax
c0106a21:	e8 05 48 00 00       	call   c010b22b <Memset>
c0106a26:	83 c4 10             	add    $0x10,%esp
c0106a29:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106a2c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106a2f:	01 d0                	add    %edx,%eax
c0106a31:	a3 f4 0e 11 c0       	mov    %eax,0xc0110ef4
c0106a36:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106a39:	a3 f8 0e 11 c0       	mov    %eax,0xc0110ef8
c0106a3e:	a1 f4 0e 11 c0       	mov    0xc0110ef4,%eax
c0106a43:	83 ec 04             	sub    $0x4,%esp
c0106a46:	ff 75 d4             	pushl  -0x2c(%ebp)
c0106a49:	6a 00                	push   $0x0
c0106a4b:	50                   	push   %eax
c0106a4c:	e8 da 47 00 00       	call   c010b22b <Memset>
c0106a51:	83 c4 10             	add    $0x10,%esp
c0106a54:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106a57:	a3 98 f7 10 c0       	mov    %eax,0xc010f798
c0106a5c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106a5f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106a62:	01 c2                	add    %eax,%edx
c0106a64:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106a67:	01 d0                	add    %edx,%eax
c0106a69:	a3 94 f7 10 c0       	mov    %eax,0xc010f794
c0106a6e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106a71:	05 00 00 10 00       	add    $0x100000,%eax
c0106a76:	a3 9c f7 10 c0       	mov    %eax,0xc010f79c
c0106a7b:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0106a80:	83 ec 04             	sub    $0x4,%esp
c0106a83:	ff 75 d8             	pushl  -0x28(%ebp)
c0106a86:	6a 00                	push   $0x0
c0106a88:	50                   	push   %eax
c0106a89:	e8 9d 47 00 00       	call   c010b22b <Memset>
c0106a8e:	83 c4 10             	add    $0x10,%esp
c0106a91:	83 ec 04             	sub    $0x4,%esp
c0106a94:	68 f0 00 00 00       	push   $0xf0
c0106a99:	6a 00                	push   $0x0
c0106a9b:	68 e0 37 18 c0       	push   $0xc01837e0
c0106aa0:	e8 86 47 00 00       	call   c010b22b <Memset>
c0106aa5:	83 c4 10             	add    $0x10,%esp
c0106aa8:	83 ec 0c             	sub    $0xc,%esp
c0106aab:	68 e0 37 18 c0       	push   $0xc01837e0
c0106ab0:	e8 75 fb ff ff       	call   c010662a <init_memory_block_desc>
c0106ab5:	83 c4 10             	add    $0x10,%esp
c0106ab8:	90                   	nop
c0106ab9:	c9                   	leave  
c0106aba:	c3                   	ret    

c0106abb <stop_here>:
c0106abb:	55                   	push   %ebp
c0106abc:	89 e5                	mov    %esp,%ebp
c0106abe:	83 ec 08             	sub    $0x8,%esp
c0106ac1:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0106ac8:	00 00 00 
c0106acb:	83 ec 0c             	sub    $0xc,%esp
c0106ace:	68 c0 a7 10 c0       	push   $0xc010a7c0
c0106ad3:	e8 b4 95 ff ff       	call   c010008c <disp_str>
c0106ad8:	83 c4 10             	add    $0x10,%esp
c0106adb:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0106ae0:	83 ec 0c             	sub    $0xc,%esp
c0106ae3:	50                   	push   %eax
c0106ae4:	e8 ae 04 00 00       	call   c0106f97 <disp_int>
c0106ae9:	83 c4 10             	add    $0x10,%esp
c0106aec:	83 ec 0c             	sub    $0xc,%esp
c0106aef:	68 c2 a7 10 c0       	push   $0xc010a7c2
c0106af4:	e8 93 95 ff ff       	call   c010008c <disp_str>
c0106af9:	83 c4 10             	add    $0x10,%esp
c0106afc:	90                   	nop
c0106afd:	c9                   	leave  
c0106afe:	c3                   	ret    

c0106aff <catch_error>:
c0106aff:	55                   	push   %ebp
c0106b00:	89 e5                	mov    %esp,%ebp
c0106b02:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0106b07:	83 c0 01             	add    $0x1,%eax
c0106b0a:	a3 c4 fb 10 c0       	mov    %eax,0xc010fbc4
c0106b0f:	a1 a4 f7 10 c0       	mov    0xc010f7a4,%eax
c0106b14:	a3 a0 f7 10 c0       	mov    %eax,0xc010f7a0
c0106b19:	90                   	nop
c0106b1a:	5d                   	pop    %ebp
c0106b1b:	c3                   	ret    

c0106b1c <intr_enable>:
c0106b1c:	55                   	push   %ebp
c0106b1d:	89 e5                	mov    %esp,%ebp
c0106b1f:	83 ec 18             	sub    $0x18,%esp
c0106b22:	e8 65 00 00 00       	call   c0106b8c <intr_get_status>
c0106b27:	83 f8 01             	cmp    $0x1,%eax
c0106b2a:	75 0c                	jne    c0106b38 <intr_enable+0x1c>
c0106b2c:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0106b33:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106b36:	eb 0b                	jmp    c0106b43 <intr_enable+0x27>
c0106b38:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106b3f:	fb                   	sti    
c0106b40:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106b43:	c9                   	leave  
c0106b44:	c3                   	ret    

c0106b45 <intr_disable>:
c0106b45:	55                   	push   %ebp
c0106b46:	89 e5                	mov    %esp,%ebp
c0106b48:	83 ec 18             	sub    $0x18,%esp
c0106b4b:	e8 3c 00 00 00       	call   c0106b8c <intr_get_status>
c0106b50:	83 f8 01             	cmp    $0x1,%eax
c0106b53:	75 0d                	jne    c0106b62 <intr_disable+0x1d>
c0106b55:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0106b5c:	fa                   	cli    
c0106b5d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106b60:	eb 0a                	jmp    c0106b6c <intr_disable+0x27>
c0106b62:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106b69:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106b6c:	c9                   	leave  
c0106b6d:	c3                   	ret    

c0106b6e <intr_set_status>:
c0106b6e:	55                   	push   %ebp
c0106b6f:	89 e5                	mov    %esp,%ebp
c0106b71:	83 ec 08             	sub    $0x8,%esp
c0106b74:	8b 45 08             	mov    0x8(%ebp),%eax
c0106b77:	83 e0 01             	and    $0x1,%eax
c0106b7a:	85 c0                	test   %eax,%eax
c0106b7c:	74 07                	je     c0106b85 <intr_set_status+0x17>
c0106b7e:	e8 99 ff ff ff       	call   c0106b1c <intr_enable>
c0106b83:	eb 05                	jmp    c0106b8a <intr_set_status+0x1c>
c0106b85:	e8 bb ff ff ff       	call   c0106b45 <intr_disable>
c0106b8a:	c9                   	leave  
c0106b8b:	c3                   	ret    

c0106b8c <intr_get_status>:
c0106b8c:	55                   	push   %ebp
c0106b8d:	89 e5                	mov    %esp,%ebp
c0106b8f:	83 ec 10             	sub    $0x10,%esp
c0106b92:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0106b99:	9c                   	pushf  
c0106b9a:	58                   	pop    %eax
c0106b9b:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0106b9e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106ba1:	c1 e8 09             	shr    $0x9,%eax
c0106ba4:	83 e0 01             	and    $0x1,%eax
c0106ba7:	c9                   	leave  
c0106ba8:	c3                   	ret    

c0106ba9 <Memcpy>:
c0106ba9:	55                   	push   %ebp
c0106baa:	89 e5                	mov    %esp,%ebp
c0106bac:	83 ec 18             	sub    $0x18,%esp
c0106baf:	e8 91 ff ff ff       	call   c0106b45 <intr_disable>
c0106bb4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106bb7:	83 ec 04             	sub    $0x4,%esp
c0106bba:	ff 75 10             	pushl  0x10(%ebp)
c0106bbd:	ff 75 0c             	pushl  0xc(%ebp)
c0106bc0:	ff 75 08             	pushl  0x8(%ebp)
c0106bc3:	e8 35 46 00 00       	call   c010b1fd <Memcpy2>
c0106bc8:	83 c4 10             	add    $0x10,%esp
c0106bcb:	83 ec 0c             	sub    $0xc,%esp
c0106bce:	ff 75 f4             	pushl  -0xc(%ebp)
c0106bd1:	e8 98 ff ff ff       	call   c0106b6e <intr_set_status>
c0106bd6:	83 c4 10             	add    $0x10,%esp
c0106bd9:	90                   	nop
c0106bda:	c9                   	leave  
c0106bdb:	c3                   	ret    

c0106bdc <untar>:
c0106bdc:	55                   	push   %ebp
c0106bdd:	89 e5                	mov    %esp,%ebp
c0106bdf:	81 ec 48 0a 00 00    	sub    $0xa48,%esp
c0106be5:	83 ec 08             	sub    $0x8,%esp
c0106be8:	6a 00                	push   $0x0
c0106bea:	ff 75 08             	pushl  0x8(%ebp)
c0106bed:	e8 2a de ff ff       	call   c0104a1c <open>
c0106bf2:	83 c4 10             	add    $0x10,%esp
c0106bf5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106bf8:	83 ec 0c             	sub    $0xc,%esp
c0106bfb:	68 c4 a7 10 c0       	push   $0xc010a7c4
c0106c00:	e8 4c 16 00 00       	call   c0108251 <Printf>
c0106c05:	83 c4 10             	add    $0x10,%esp
c0106c08:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0106c0f:	c7 45 dc 00 02 00 00 	movl   $0x200,-0x24(%ebp)
c0106c16:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106c1d:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0106c24:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0106c2b:	e9 63 02 00 00       	jmp    c0106e93 <untar+0x2b7>
c0106c30:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0106c34:	7e 58                	jle    c0106c8e <untar+0xb2>
c0106c36:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106c39:	05 ff 01 00 00       	add    $0x1ff,%eax
c0106c3e:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0106c44:	85 c0                	test   %eax,%eax
c0106c46:	0f 48 c2             	cmovs  %edx,%eax
c0106c49:	c1 f8 09             	sar    $0x9,%eax
c0106c4c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106c4f:	83 ec 04             	sub    $0x4,%esp
c0106c52:	68 00 02 00 00       	push   $0x200
c0106c57:	6a 00                	push   $0x0
c0106c59:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106c5f:	50                   	push   %eax
c0106c60:	e8 c6 45 00 00       	call   c010b22b <Memset>
c0106c65:	83 c4 10             	add    $0x10,%esp
c0106c68:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106c6b:	c1 e0 09             	shl    $0x9,%eax
c0106c6e:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0106c71:	83 ec 04             	sub    $0x4,%esp
c0106c74:	50                   	push   %eax
c0106c75:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106c7b:	50                   	push   %eax
c0106c7c:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106c7f:	e8 2d de ff ff       	call   c0104ab1 <read>
c0106c84:	83 c4 10             	add    $0x10,%esp
c0106c87:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106c8e:	83 ec 04             	sub    $0x4,%esp
c0106c91:	68 00 02 00 00       	push   $0x200
c0106c96:	6a 00                	push   $0x0
c0106c98:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106c9e:	50                   	push   %eax
c0106c9f:	e8 87 45 00 00       	call   c010b22b <Memset>
c0106ca4:	83 c4 10             	add    $0x10,%esp
c0106ca7:	83 ec 04             	sub    $0x4,%esp
c0106caa:	68 00 02 00 00       	push   $0x200
c0106caf:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106cb5:	50                   	push   %eax
c0106cb6:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106cb9:	e8 f3 dd ff ff       	call   c0104ab1 <read>
c0106cbe:	83 c4 10             	add    $0x10,%esp
c0106cc1:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0106cc4:	83 ec 0c             	sub    $0xc,%esp
c0106cc7:	68 d6 a7 10 c0       	push   $0xc010a7d6
c0106ccc:	e8 80 15 00 00       	call   c0108251 <Printf>
c0106cd1:	83 c4 10             	add    $0x10,%esp
c0106cd4:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0106cd8:	0f 84 c1 01 00 00    	je     c0106e9f <untar+0x2c3>
c0106cde:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106ce1:	01 45 f4             	add    %eax,-0xc(%ebp)
c0106ce4:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0106ceb:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106cf1:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0106cf4:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106cf7:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0106cfa:	83 ec 08             	sub    $0x8,%esp
c0106cfd:	6a 07                	push   $0x7
c0106cff:	ff 75 cc             	pushl  -0x34(%ebp)
c0106d02:	e8 15 dd ff ff       	call   c0104a1c <open>
c0106d07:	83 c4 10             	add    $0x10,%esp
c0106d0a:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0106d0d:	83 ec 0c             	sub    $0xc,%esp
c0106d10:	68 e8 a7 10 c0       	push   $0xc010a7e8
c0106d15:	e8 37 15 00 00       	call   c0108251 <Printf>
c0106d1a:	83 c4 10             	add    $0x10,%esp
c0106d1d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0106d24:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106d27:	83 c0 7c             	add    $0x7c,%eax
c0106d2a:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0106d2d:	83 ec 0c             	sub    $0xc,%esp
c0106d30:	ff 75 cc             	pushl  -0x34(%ebp)
c0106d33:	e8 2c 45 00 00       	call   c010b264 <Strlen>
c0106d38:	83 c4 10             	add    $0x10,%esp
c0106d3b:	85 c0                	test   %eax,%eax
c0106d3d:	75 28                	jne    c0106d67 <untar+0x18b>
c0106d3f:	83 ec 0c             	sub    $0xc,%esp
c0106d42:	ff 75 c4             	pushl  -0x3c(%ebp)
c0106d45:	e8 1a 45 00 00       	call   c010b264 <Strlen>
c0106d4a:	83 c4 10             	add    $0x10,%esp
c0106d4d:	85 c0                	test   %eax,%eax
c0106d4f:	75 16                	jne    c0106d67 <untar+0x18b>
c0106d51:	83 ec 0c             	sub    $0xc,%esp
c0106d54:	68 fa a7 10 c0       	push   $0xc010a7fa
c0106d59:	e8 f3 14 00 00       	call   c0108251 <Printf>
c0106d5e:	83 c4 10             	add    $0x10,%esp
c0106d61:	90                   	nop
c0106d62:	e9 39 01 00 00       	jmp    c0106ea0 <untar+0x2c4>
c0106d67:	83 ec 0c             	sub    $0xc,%esp
c0106d6a:	68 01 a8 10 c0       	push   $0xc010a801
c0106d6f:	e8 dd 14 00 00       	call   c0108251 <Printf>
c0106d74:	83 c4 10             	add    $0x10,%esp
c0106d77:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0106d7a:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106d7d:	eb 1f                	jmp    c0106d9e <untar+0x1c2>
c0106d7f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106d82:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0106d89:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106d8c:	0f b6 00             	movzbl (%eax),%eax
c0106d8f:	0f be c0             	movsbl %al,%eax
c0106d92:	83 e8 30             	sub    $0x30,%eax
c0106d95:	01 d0                	add    %edx,%eax
c0106d97:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106d9a:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0106d9e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106da1:	0f b6 00             	movzbl (%eax),%eax
c0106da4:	84 c0                	test   %al,%al
c0106da6:	75 d7                	jne    c0106d7f <untar+0x1a3>
c0106da8:	83 ec 0c             	sub    $0xc,%esp
c0106dab:	68 0f a8 10 c0       	push   $0xc010a80f
c0106db0:	e8 9c 14 00 00       	call   c0108251 <Printf>
c0106db5:	83 c4 10             	add    $0x10,%esp
c0106db8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106dbb:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0106dbe:	c7 45 bc 00 08 00 00 	movl   $0x800,-0x44(%ebp)
c0106dc5:	83 ec 08             	sub    $0x8,%esp
c0106dc8:	ff 75 c0             	pushl  -0x40(%ebp)
c0106dcb:	68 1d a8 10 c0       	push   $0xc010a81d
c0106dd0:	e8 7c 14 00 00       	call   c0108251 <Printf>
c0106dd5:	83 c4 10             	add    $0x10,%esp
c0106dd8:	83 ec 08             	sub    $0x8,%esp
c0106ddb:	ff 75 c0             	pushl  -0x40(%ebp)
c0106dde:	68 2f a8 10 c0       	push   $0xc010a82f
c0106de3:	e8 69 14 00 00       	call   c0108251 <Printf>
c0106de8:	83 c4 10             	add    $0x10,%esp
c0106deb:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0106dee:	39 45 bc             	cmp    %eax,-0x44(%ebp)
c0106df1:	0f 4e 45 bc          	cmovle -0x44(%ebp),%eax
c0106df5:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0106df8:	e8 02 fd ff ff       	call   c0106aff <catch_error>
c0106dfd:	83 ec 04             	sub    $0x4,%esp
c0106e00:	ff 75 b8             	pushl  -0x48(%ebp)
c0106e03:	8d 85 b8 f5 ff ff    	lea    -0xa48(%ebp),%eax
c0106e09:	50                   	push   %eax
c0106e0a:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106e0d:	e8 9f dc ff ff       	call   c0104ab1 <read>
c0106e12:	83 c4 10             	add    $0x10,%esp
c0106e15:	01 45 f4             	add    %eax,-0xc(%ebp)
c0106e18:	83 ec 04             	sub    $0x4,%esp
c0106e1b:	ff 75 b8             	pushl  -0x48(%ebp)
c0106e1e:	8d 85 b8 f5 ff ff    	lea    -0xa48(%ebp),%eax
c0106e24:	50                   	push   %eax
c0106e25:	ff 75 c8             	pushl  -0x38(%ebp)
c0106e28:	e8 05 de ff ff       	call   c0104c32 <write>
c0106e2d:	83 c4 10             	add    $0x10,%esp
c0106e30:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106e33:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0106e36:	7d 02                	jge    c0106e3a <untar+0x25e>
c0106e38:	eb be                	jmp    c0106df8 <untar+0x21c>
c0106e3a:	90                   	nop
c0106e3b:	83 ec 08             	sub    $0x8,%esp
c0106e3e:	ff 75 f4             	pushl  -0xc(%ebp)
c0106e41:	68 41 a8 10 c0       	push   $0xc010a841
c0106e46:	e8 06 14 00 00       	call   c0108251 <Printf>
c0106e4b:	83 c4 10             	add    $0x10,%esp
c0106e4e:	83 ec 08             	sub    $0x8,%esp
c0106e51:	ff 75 c0             	pushl  -0x40(%ebp)
c0106e54:	68 53 a8 10 c0       	push   $0xc010a853
c0106e59:	e8 f3 13 00 00       	call   c0108251 <Printf>
c0106e5e:	83 c4 10             	add    $0x10,%esp
c0106e61:	83 ec 0c             	sub    $0xc,%esp
c0106e64:	68 64 a8 10 c0       	push   $0xc010a864
c0106e69:	e8 e3 13 00 00       	call   c0108251 <Printf>
c0106e6e:	83 c4 10             	add    $0x10,%esp
c0106e71:	83 ec 0c             	sub    $0xc,%esp
c0106e74:	ff 75 c8             	pushl  -0x38(%ebp)
c0106e77:	e8 3b de ff ff       	call   c0104cb7 <close>
c0106e7c:	83 c4 10             	add    $0x10,%esp
c0106e7f:	83 ec 0c             	sub    $0xc,%esp
c0106e82:	68 72 a8 10 c0       	push   $0xc010a872
c0106e87:	e8 c5 13 00 00       	call   c0108251 <Printf>
c0106e8c:	83 c4 10             	add    $0x10,%esp
c0106e8f:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c0106e93:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0106e97:	0f 8f 93 fd ff ff    	jg     c0106c30 <untar+0x54>
c0106e9d:	eb 01                	jmp    c0106ea0 <untar+0x2c4>
c0106e9f:	90                   	nop
c0106ea0:	83 ec 0c             	sub    $0xc,%esp
c0106ea3:	68 7f a8 10 c0       	push   $0xc010a87f
c0106ea8:	e8 a4 13 00 00       	call   c0108251 <Printf>
c0106ead:	83 c4 10             	add    $0x10,%esp
c0106eb0:	83 ec 0c             	sub    $0xc,%esp
c0106eb3:	68 91 a8 10 c0       	push   $0xc010a891
c0106eb8:	e8 94 13 00 00       	call   c0108251 <Printf>
c0106ebd:	83 c4 10             	add    $0x10,%esp
c0106ec0:	83 ec 0c             	sub    $0xc,%esp
c0106ec3:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106ec6:	e8 ec dd ff ff       	call   c0104cb7 <close>
c0106ecb:	83 c4 10             	add    $0x10,%esp
c0106ece:	83 ec 0c             	sub    $0xc,%esp
c0106ed1:	68 a1 a8 10 c0       	push   $0xc010a8a1
c0106ed6:	e8 76 13 00 00       	call   c0108251 <Printf>
c0106edb:	83 c4 10             	add    $0x10,%esp
c0106ede:	83 ec 0c             	sub    $0xc,%esp
c0106ee1:	68 b4 a8 10 c0       	push   $0xc010a8b4
c0106ee6:	e8 66 13 00 00       	call   c0108251 <Printf>
c0106eeb:	83 c4 10             	add    $0x10,%esp
c0106eee:	90                   	nop
c0106eef:	c9                   	leave  
c0106ef0:	c3                   	ret    

c0106ef1 <atoi>:
c0106ef1:	55                   	push   %ebp
c0106ef2:	89 e5                	mov    %esp,%ebp
c0106ef4:	83 ec 10             	sub    $0x10,%esp
c0106ef7:	8b 45 08             	mov    0x8(%ebp),%eax
c0106efa:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0106efd:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106f00:	8d 50 01             	lea    0x1(%eax),%edx
c0106f03:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0106f06:	c6 00 30             	movb   $0x30,(%eax)
c0106f09:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106f0c:	8d 50 01             	lea    0x1(%eax),%edx
c0106f0f:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0106f12:	c6 00 78             	movb   $0x78,(%eax)
c0106f15:	c6 45 fa 00          	movb   $0x0,-0x6(%ebp)
c0106f19:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0106f1d:	75 0e                	jne    c0106f2d <atoi+0x3c>
c0106f1f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106f22:	8d 50 01             	lea    0x1(%eax),%edx
c0106f25:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0106f28:	c6 00 30             	movb   $0x30,(%eax)
c0106f2b:	eb 61                	jmp    c0106f8e <atoi+0x9d>
c0106f2d:	c7 45 f4 1c 00 00 00 	movl   $0x1c,-0xc(%ebp)
c0106f34:	eb 52                	jmp    c0106f88 <atoi+0x97>
c0106f36:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106f39:	8b 55 0c             	mov    0xc(%ebp),%edx
c0106f3c:	89 c1                	mov    %eax,%ecx
c0106f3e:	d3 fa                	sar    %cl,%edx
c0106f40:	89 d0                	mov    %edx,%eax
c0106f42:	83 e0 0f             	and    $0xf,%eax
c0106f45:	88 45 fb             	mov    %al,-0x5(%ebp)
c0106f48:	80 7d fa 00          	cmpb   $0x0,-0x6(%ebp)
c0106f4c:	75 06                	jne    c0106f54 <atoi+0x63>
c0106f4e:	80 7d fb 00          	cmpb   $0x0,-0x5(%ebp)
c0106f52:	74 2f                	je     c0106f83 <atoi+0x92>
c0106f54:	c6 45 fa 01          	movb   $0x1,-0x6(%ebp)
c0106f58:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0106f5c:	83 c0 30             	add    $0x30,%eax
c0106f5f:	88 45 fb             	mov    %al,-0x5(%ebp)
c0106f62:	80 7d fb 39          	cmpb   $0x39,-0x5(%ebp)
c0106f66:	7e 0a                	jle    c0106f72 <atoi+0x81>
c0106f68:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0106f6c:	83 c0 07             	add    $0x7,%eax
c0106f6f:	88 45 fb             	mov    %al,-0x5(%ebp)
c0106f72:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106f75:	8d 50 01             	lea    0x1(%eax),%edx
c0106f78:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0106f7b:	0f b6 55 fb          	movzbl -0x5(%ebp),%edx
c0106f7f:	88 10                	mov    %dl,(%eax)
c0106f81:	eb 01                	jmp    c0106f84 <atoi+0x93>
c0106f83:	90                   	nop
c0106f84:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c0106f88:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0106f8c:	79 a8                	jns    c0106f36 <atoi+0x45>
c0106f8e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106f91:	c6 00 00             	movb   $0x0,(%eax)
c0106f94:	90                   	nop
c0106f95:	c9                   	leave  
c0106f96:	c3                   	ret    

c0106f97 <disp_int>:
c0106f97:	55                   	push   %ebp
c0106f98:	89 e5                	mov    %esp,%ebp
c0106f9a:	83 ec 18             	sub    $0x18,%esp
c0106f9d:	ff 75 08             	pushl  0x8(%ebp)
c0106fa0:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0106fa3:	50                   	push   %eax
c0106fa4:	e8 48 ff ff ff       	call   c0106ef1 <atoi>
c0106fa9:	83 c4 08             	add    $0x8,%esp
c0106fac:	83 ec 08             	sub    $0x8,%esp
c0106faf:	6a 0b                	push   $0xb
c0106fb1:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0106fb4:	50                   	push   %eax
c0106fb5:	e8 0d 91 ff ff       	call   c01000c7 <disp_str_colour>
c0106fba:	83 c4 10             	add    $0x10,%esp
c0106fbd:	90                   	nop
c0106fbe:	c9                   	leave  
c0106fbf:	c3                   	ret    

c0106fc0 <do_page_fault>:
c0106fc0:	55                   	push   %ebp
c0106fc1:	89 e5                	mov    %esp,%ebp
c0106fc3:	83 ec 28             	sub    $0x28,%esp
c0106fc6:	0f 20 d0             	mov    %cr2,%eax
c0106fc9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106fcc:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0106fd3:	00 00 00 
c0106fd6:	83 ec 0c             	sub    $0xc,%esp
c0106fd9:	68 bf a8 10 c0       	push   $0xc010a8bf
c0106fde:	e8 a9 90 ff ff       	call   c010008c <disp_str>
c0106fe3:	83 c4 10             	add    $0x10,%esp
c0106fe6:	83 ec 0c             	sub    $0xc,%esp
c0106fe9:	68 ce a8 10 c0       	push   $0xc010a8ce
c0106fee:	e8 99 90 ff ff       	call   c010008c <disp_str>
c0106ff3:	83 c4 10             	add    $0x10,%esp
c0106ff6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106ff9:	83 ec 0c             	sub    $0xc,%esp
c0106ffc:	50                   	push   %eax
c0106ffd:	e8 95 ff ff ff       	call   c0106f97 <disp_int>
c0107002:	83 c4 10             	add    $0x10,%esp
c0107005:	83 ec 0c             	sub    $0xc,%esp
c0107008:	68 d3 a8 10 c0       	push   $0xc010a8d3
c010700d:	e8 7a 90 ff ff       	call   c010008c <disp_str>
c0107012:	83 c4 10             	add    $0x10,%esp
c0107015:	83 ec 0c             	sub    $0xc,%esp
c0107018:	ff 75 f4             	pushl  -0xc(%ebp)
c010701b:	e8 51 ec ff ff       	call   c0105c71 <ptr_pde>
c0107020:	83 c4 10             	add    $0x10,%esp
c0107023:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107026:	83 ec 0c             	sub    $0xc,%esp
c0107029:	ff 75 f4             	pushl  -0xc(%ebp)
c010702c:	e8 53 ec ff ff       	call   c0105c84 <ptr_pte>
c0107031:	83 c4 10             	add    $0x10,%esp
c0107034:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0107037:	83 ec 0c             	sub    $0xc,%esp
c010703a:	68 d5 a8 10 c0       	push   $0xc010a8d5
c010703f:	e8 48 90 ff ff       	call   c010008c <disp_str>
c0107044:	83 c4 10             	add    $0x10,%esp
c0107047:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010704a:	83 ec 0c             	sub    $0xc,%esp
c010704d:	50                   	push   %eax
c010704e:	e8 44 ff ff ff       	call   c0106f97 <disp_int>
c0107053:	83 c4 10             	add    $0x10,%esp
c0107056:	83 ec 0c             	sub    $0xc,%esp
c0107059:	68 da a8 10 c0       	push   $0xc010a8da
c010705e:	e8 29 90 ff ff       	call   c010008c <disp_str>
c0107063:	83 c4 10             	add    $0x10,%esp
c0107066:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0107069:	8b 00                	mov    (%eax),%eax
c010706b:	83 ec 0c             	sub    $0xc,%esp
c010706e:	50                   	push   %eax
c010706f:	e8 23 ff ff ff       	call   c0106f97 <disp_int>
c0107074:	83 c4 10             	add    $0x10,%esp
c0107077:	83 ec 0c             	sub    $0xc,%esp
c010707a:	68 d3 a8 10 c0       	push   $0xc010a8d3
c010707f:	e8 08 90 ff ff       	call   c010008c <disp_str>
c0107084:	83 c4 10             	add    $0x10,%esp
c0107087:	83 ec 0c             	sub    $0xc,%esp
c010708a:	68 e3 a8 10 c0       	push   $0xc010a8e3
c010708f:	e8 f8 8f ff ff       	call   c010008c <disp_str>
c0107094:	83 c4 10             	add    $0x10,%esp
c0107097:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010709a:	83 ec 0c             	sub    $0xc,%esp
c010709d:	50                   	push   %eax
c010709e:	e8 f4 fe ff ff       	call   c0106f97 <disp_int>
c01070a3:	83 c4 10             	add    $0x10,%esp
c01070a6:	83 ec 0c             	sub    $0xc,%esp
c01070a9:	68 e8 a8 10 c0       	push   $0xc010a8e8
c01070ae:	e8 d9 8f ff ff       	call   c010008c <disp_str>
c01070b3:	83 c4 10             	add    $0x10,%esp
c01070b6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01070b9:	8b 00                	mov    (%eax),%eax
c01070bb:	83 ec 0c             	sub    $0xc,%esp
c01070be:	50                   	push   %eax
c01070bf:	e8 d3 fe ff ff       	call   c0106f97 <disp_int>
c01070c4:	83 c4 10             	add    $0x10,%esp
c01070c7:	83 ec 0c             	sub    $0xc,%esp
c01070ca:	68 d3 a8 10 c0       	push   $0xc010a8d3
c01070cf:	e8 b8 8f ff ff       	call   c010008c <disp_str>
c01070d4:	83 c4 10             	add    $0x10,%esp
c01070d7:	c7 45 e8 00 00 10 00 	movl   $0x100000,-0x18(%ebp)
c01070de:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01070e1:	8b 00                	mov    (%eax),%eax
c01070e3:	83 e0 01             	and    $0x1,%eax
c01070e6:	85 c0                	test   %eax,%eax
c01070e8:	74 09                	je     c01070f3 <do_page_fault+0x133>
c01070ea:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
c01070f1:	eb 07                	jmp    c01070fa <do_page_fault+0x13a>
c01070f3:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01070fa:	90                   	nop
c01070fb:	c9                   	leave  
c01070fc:	c3                   	ret    

c01070fd <exception_handler>:
c01070fd:	55                   	push   %ebp
c01070fe:	89 e5                	mov    %esp,%ebp
c0107100:	57                   	push   %edi
c0107101:	56                   	push   %esi
c0107102:	53                   	push   %ebx
c0107103:	83 ec 6c             	sub    $0x6c,%esp
c0107106:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0107109:	bb 60 ab 10 c0       	mov    $0xc010ab60,%ebx
c010710e:	ba 13 00 00 00       	mov    $0x13,%edx
c0107113:	89 c7                	mov    %eax,%edi
c0107115:	89 de                	mov    %ebx,%esi
c0107117:	89 d1                	mov    %edx,%ecx
c0107119:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c010711b:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0107122:	eb 04                	jmp    c0107128 <exception_handler+0x2b>
c0107124:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0107128:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c010712f:	7e f3                	jle    c0107124 <exception_handler+0x27>
c0107131:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0107138:	00 00 00 
c010713b:	83 ec 0c             	sub    $0xc,%esp
c010713e:	68 f1 a8 10 c0       	push   $0xc010a8f1
c0107143:	e8 44 8f ff ff       	call   c010008c <disp_str>
c0107148:	83 c4 10             	add    $0x10,%esp
c010714b:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c0107152:	8b 45 08             	mov    0x8(%ebp),%eax
c0107155:	8b 44 85 8c          	mov    -0x74(%ebp,%eax,4),%eax
c0107159:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010715c:	83 ec 0c             	sub    $0xc,%esp
c010715f:	ff 75 dc             	pushl  -0x24(%ebp)
c0107162:	e8 25 8f ff ff       	call   c010008c <disp_str>
c0107167:	83 c4 10             	add    $0x10,%esp
c010716a:	83 ec 0c             	sub    $0xc,%esp
c010716d:	68 ff a8 10 c0       	push   $0xc010a8ff
c0107172:	e8 15 8f ff ff       	call   c010008c <disp_str>
c0107177:	83 c4 10             	add    $0x10,%esp
c010717a:	83 ec 0c             	sub    $0xc,%esp
c010717d:	68 02 a9 10 c0       	push   $0xc010a902
c0107182:	e8 05 8f ff ff       	call   c010008c <disp_str>
c0107187:	83 c4 10             	add    $0x10,%esp
c010718a:	8b 45 08             	mov    0x8(%ebp),%eax
c010718d:	83 ec 0c             	sub    $0xc,%esp
c0107190:	50                   	push   %eax
c0107191:	e8 01 fe ff ff       	call   c0106f97 <disp_int>
c0107196:	83 c4 10             	add    $0x10,%esp
c0107199:	83 ec 0c             	sub    $0xc,%esp
c010719c:	68 ff a8 10 c0       	push   $0xc010a8ff
c01071a1:	e8 e6 8e ff ff       	call   c010008c <disp_str>
c01071a6:	83 c4 10             	add    $0x10,%esp
c01071a9:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c01071ad:	74 2f                	je     c01071de <exception_handler+0xe1>
c01071af:	83 ec 0c             	sub    $0xc,%esp
c01071b2:	68 0a a9 10 c0       	push   $0xc010a90a
c01071b7:	e8 d0 8e ff ff       	call   c010008c <disp_str>
c01071bc:	83 c4 10             	add    $0x10,%esp
c01071bf:	8b 45 0c             	mov    0xc(%ebp),%eax
c01071c2:	83 ec 0c             	sub    $0xc,%esp
c01071c5:	50                   	push   %eax
c01071c6:	e8 cc fd ff ff       	call   c0106f97 <disp_int>
c01071cb:	83 c4 10             	add    $0x10,%esp
c01071ce:	83 ec 0c             	sub    $0xc,%esp
c01071d1:	68 ff a8 10 c0       	push   $0xc010a8ff
c01071d6:	e8 b1 8e ff ff       	call   c010008c <disp_str>
c01071db:	83 c4 10             	add    $0x10,%esp
c01071de:	83 ec 0c             	sub    $0xc,%esp
c01071e1:	68 14 a9 10 c0       	push   $0xc010a914
c01071e6:	e8 a1 8e ff ff       	call   c010008c <disp_str>
c01071eb:	83 c4 10             	add    $0x10,%esp
c01071ee:	83 ec 0c             	sub    $0xc,%esp
c01071f1:	ff 75 14             	pushl  0x14(%ebp)
c01071f4:	e8 9e fd ff ff       	call   c0106f97 <disp_int>
c01071f9:	83 c4 10             	add    $0x10,%esp
c01071fc:	83 ec 0c             	sub    $0xc,%esp
c01071ff:	68 ff a8 10 c0       	push   $0xc010a8ff
c0107204:	e8 83 8e ff ff       	call   c010008c <disp_str>
c0107209:	83 c4 10             	add    $0x10,%esp
c010720c:	83 ec 0c             	sub    $0xc,%esp
c010720f:	68 18 a9 10 c0       	push   $0xc010a918
c0107214:	e8 73 8e ff ff       	call   c010008c <disp_str>
c0107219:	83 c4 10             	add    $0x10,%esp
c010721c:	8b 45 10             	mov    0x10(%ebp),%eax
c010721f:	83 ec 0c             	sub    $0xc,%esp
c0107222:	50                   	push   %eax
c0107223:	e8 6f fd ff ff       	call   c0106f97 <disp_int>
c0107228:	83 c4 10             	add    $0x10,%esp
c010722b:	83 ec 0c             	sub    $0xc,%esp
c010722e:	68 ff a8 10 c0       	push   $0xc010a8ff
c0107233:	e8 54 8e ff ff       	call   c010008c <disp_str>
c0107238:	83 c4 10             	add    $0x10,%esp
c010723b:	83 ec 0c             	sub    $0xc,%esp
c010723e:	68 1d a9 10 c0       	push   $0xc010a91d
c0107243:	e8 44 8e ff ff       	call   c010008c <disp_str>
c0107248:	83 c4 10             	add    $0x10,%esp
c010724b:	83 ec 0c             	sub    $0xc,%esp
c010724e:	ff 75 18             	pushl  0x18(%ebp)
c0107251:	e8 41 fd ff ff       	call   c0106f97 <disp_int>
c0107256:	83 c4 10             	add    $0x10,%esp
c0107259:	83 ec 0c             	sub    $0xc,%esp
c010725c:	68 ff a8 10 c0       	push   $0xc010a8ff
c0107261:	e8 26 8e ff ff       	call   c010008c <disp_str>
c0107266:	83 c4 10             	add    $0x10,%esp
c0107269:	83 ec 0c             	sub    $0xc,%esp
c010726c:	68 28 a9 10 c0       	push   $0xc010a928
c0107271:	e8 16 8e ff ff       	call   c010008c <disp_str>
c0107276:	83 c4 10             	add    $0x10,%esp
c0107279:	83 7d 08 0e          	cmpl   $0xe,0x8(%ebp)
c010727d:	75 45                	jne    c01072c4 <exception_handler+0x1c7>
c010727f:	0f 20 d0             	mov    %cr2,%eax
c0107282:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0107285:	83 ec 0c             	sub    $0xc,%esp
c0107288:	68 47 a9 10 c0       	push   $0xc010a947
c010728d:	e8 fa 8d ff ff       	call   c010008c <disp_str>
c0107292:	83 c4 10             	add    $0x10,%esp
c0107295:	83 ec 0c             	sub    $0xc,%esp
c0107298:	68 ce a8 10 c0       	push   $0xc010a8ce
c010729d:	e8 ea 8d ff ff       	call   c010008c <disp_str>
c01072a2:	83 c4 10             	add    $0x10,%esp
c01072a5:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01072a8:	83 ec 0c             	sub    $0xc,%esp
c01072ab:	50                   	push   %eax
c01072ac:	e8 e6 fc ff ff       	call   c0106f97 <disp_int>
c01072b1:	83 c4 10             	add    $0x10,%esp
c01072b4:	83 ec 0c             	sub    $0xc,%esp
c01072b7:	68 d3 a8 10 c0       	push   $0xc010a8d3
c01072bc:	e8 cb 8d ff ff       	call   c010008c <disp_str>
c01072c1:	83 c4 10             	add    $0x10,%esp
c01072c4:	83 7d 08 0d          	cmpl   $0xd,0x8(%ebp)
c01072c8:	75 11                	jne    c01072db <exception_handler+0x1de>
c01072ca:	83 ec 0c             	sub    $0xc,%esp
c01072cd:	68 53 a9 10 c0       	push   $0xc010a953
c01072d2:	e8 b5 8d ff ff       	call   c010008c <disp_str>
c01072d7:	83 c4 10             	add    $0x10,%esp
c01072da:	90                   	nop
c01072db:	90                   	nop
c01072dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
c01072df:	5b                   	pop    %ebx
c01072e0:	5e                   	pop    %esi
c01072e1:	5f                   	pop    %edi
c01072e2:	5d                   	pop    %ebp
c01072e3:	c3                   	ret    

c01072e4 <init_internal_interrupt>:
c01072e4:	55                   	push   %ebp
c01072e5:	89 e5                	mov    %esp,%ebp
c01072e7:	83 ec 08             	sub    $0x8,%esp
c01072ea:	6a 0e                	push   $0xe
c01072ec:	6a 08                	push   $0x8
c01072ee:	68 03 01 10 c0       	push   $0xc0100103
c01072f3:	6a 00                	push   $0x0
c01072f5:	e8 62 c7 ff ff       	call   c0103a5c <InitInterruptDesc>
c01072fa:	83 c4 10             	add    $0x10,%esp
c01072fd:	6a 0e                	push   $0xe
c01072ff:	6a 08                	push   $0x8
c0107301:	68 09 01 10 c0       	push   $0xc0100109
c0107306:	6a 01                	push   $0x1
c0107308:	e8 4f c7 ff ff       	call   c0103a5c <InitInterruptDesc>
c010730d:	83 c4 10             	add    $0x10,%esp
c0107310:	6a 0e                	push   $0xe
c0107312:	6a 08                	push   $0x8
c0107314:	68 0f 01 10 c0       	push   $0xc010010f
c0107319:	6a 02                	push   $0x2
c010731b:	e8 3c c7 ff ff       	call   c0103a5c <InitInterruptDesc>
c0107320:	83 c4 10             	add    $0x10,%esp
c0107323:	6a 0e                	push   $0xe
c0107325:	6a 08                	push   $0x8
c0107327:	68 15 01 10 c0       	push   $0xc0100115
c010732c:	6a 03                	push   $0x3
c010732e:	e8 29 c7 ff ff       	call   c0103a5c <InitInterruptDesc>
c0107333:	83 c4 10             	add    $0x10,%esp
c0107336:	6a 0e                	push   $0xe
c0107338:	6a 08                	push   $0x8
c010733a:	68 1b 01 10 c0       	push   $0xc010011b
c010733f:	6a 04                	push   $0x4
c0107341:	e8 16 c7 ff ff       	call   c0103a5c <InitInterruptDesc>
c0107346:	83 c4 10             	add    $0x10,%esp
c0107349:	6a 0e                	push   $0xe
c010734b:	6a 08                	push   $0x8
c010734d:	68 21 01 10 c0       	push   $0xc0100121
c0107352:	6a 05                	push   $0x5
c0107354:	e8 03 c7 ff ff       	call   c0103a5c <InitInterruptDesc>
c0107359:	83 c4 10             	add    $0x10,%esp
c010735c:	6a 0e                	push   $0xe
c010735e:	6a 08                	push   $0x8
c0107360:	68 27 01 10 c0       	push   $0xc0100127
c0107365:	6a 06                	push   $0x6
c0107367:	e8 f0 c6 ff ff       	call   c0103a5c <InitInterruptDesc>
c010736c:	83 c4 10             	add    $0x10,%esp
c010736f:	6a 0e                	push   $0xe
c0107371:	6a 08                	push   $0x8
c0107373:	68 2d 01 10 c0       	push   $0xc010012d
c0107378:	6a 07                	push   $0x7
c010737a:	e8 dd c6 ff ff       	call   c0103a5c <InitInterruptDesc>
c010737f:	83 c4 10             	add    $0x10,%esp
c0107382:	6a 0e                	push   $0xe
c0107384:	6a 08                	push   $0x8
c0107386:	68 33 01 10 c0       	push   $0xc0100133
c010738b:	6a 08                	push   $0x8
c010738d:	e8 ca c6 ff ff       	call   c0103a5c <InitInterruptDesc>
c0107392:	83 c4 10             	add    $0x10,%esp
c0107395:	6a 0e                	push   $0xe
c0107397:	6a 08                	push   $0x8
c0107399:	68 37 01 10 c0       	push   $0xc0100137
c010739e:	6a 09                	push   $0x9
c01073a0:	e8 b7 c6 ff ff       	call   c0103a5c <InitInterruptDesc>
c01073a5:	83 c4 10             	add    $0x10,%esp
c01073a8:	6a 0e                	push   $0xe
c01073aa:	6a 08                	push   $0x8
c01073ac:	68 3d 01 10 c0       	push   $0xc010013d
c01073b1:	6a 0a                	push   $0xa
c01073b3:	e8 a4 c6 ff ff       	call   c0103a5c <InitInterruptDesc>
c01073b8:	83 c4 10             	add    $0x10,%esp
c01073bb:	6a 0e                	push   $0xe
c01073bd:	6a 08                	push   $0x8
c01073bf:	68 41 01 10 c0       	push   $0xc0100141
c01073c4:	6a 0b                	push   $0xb
c01073c6:	e8 91 c6 ff ff       	call   c0103a5c <InitInterruptDesc>
c01073cb:	83 c4 10             	add    $0x10,%esp
c01073ce:	6a 0e                	push   $0xe
c01073d0:	6a 08                	push   $0x8
c01073d2:	68 45 01 10 c0       	push   $0xc0100145
c01073d7:	6a 0c                	push   $0xc
c01073d9:	e8 7e c6 ff ff       	call   c0103a5c <InitInterruptDesc>
c01073de:	83 c4 10             	add    $0x10,%esp
c01073e1:	6a 0e                	push   $0xe
c01073e3:	6a 08                	push   $0x8
c01073e5:	68 49 01 10 c0       	push   $0xc0100149
c01073ea:	6a 0d                	push   $0xd
c01073ec:	e8 6b c6 ff ff       	call   c0103a5c <InitInterruptDesc>
c01073f1:	83 c4 10             	add    $0x10,%esp
c01073f4:	6a 0e                	push   $0xe
c01073f6:	6a 08                	push   $0x8
c01073f8:	68 54 01 10 c0       	push   $0xc0100154
c01073fd:	6a 0e                	push   $0xe
c01073ff:	e8 58 c6 ff ff       	call   c0103a5c <InitInterruptDesc>
c0107404:	83 c4 10             	add    $0x10,%esp
c0107407:	6a 0e                	push   $0xe
c0107409:	6a 08                	push   $0x8
c010740b:	68 58 01 10 c0       	push   $0xc0100158
c0107410:	6a 10                	push   $0x10
c0107412:	e8 45 c6 ff ff       	call   c0103a5c <InitInterruptDesc>
c0107417:	83 c4 10             	add    $0x10,%esp
c010741a:	6a 0e                	push   $0xe
c010741c:	6a 08                	push   $0x8
c010741e:	68 5e 01 10 c0       	push   $0xc010015e
c0107423:	6a 11                	push   $0x11
c0107425:	e8 32 c6 ff ff       	call   c0103a5c <InitInterruptDesc>
c010742a:	83 c4 10             	add    $0x10,%esp
c010742d:	6a 0e                	push   $0xe
c010742f:	6a 08                	push   $0x8
c0107431:	68 62 01 10 c0       	push   $0xc0100162
c0107436:	6a 12                	push   $0x12
c0107438:	e8 1f c6 ff ff       	call   c0103a5c <InitInterruptDesc>
c010743d:	83 c4 10             	add    $0x10,%esp
c0107440:	6a 0e                	push   $0xe
c0107442:	6a 0e                	push   $0xe
c0107444:	68 21 02 10 c0       	push   $0xc0100221
c0107449:	68 90 00 00 00       	push   $0x90
c010744e:	e8 09 c6 ff ff       	call   c0103a5c <InitInterruptDesc>
c0107453:	83 c4 10             	add    $0x10,%esp
c0107456:	90                   	nop
c0107457:	c9                   	leave  
c0107458:	c3                   	ret    

c0107459 <spurious_irq>:
c0107459:	55                   	push   %ebp
c010745a:	89 e5                	mov    %esp,%ebp
c010745c:	83 ec 08             	sub    $0x8,%esp
c010745f:	83 ec 08             	sub    $0x8,%esp
c0107462:	6a 0b                	push   $0xb
c0107464:	68 ac ab 10 c0       	push   $0xc010abac
c0107469:	e8 59 8c ff ff       	call   c01000c7 <disp_str_colour>
c010746e:	83 c4 10             	add    $0x10,%esp
c0107471:	83 ec 0c             	sub    $0xc,%esp
c0107474:	ff 75 08             	pushl  0x8(%ebp)
c0107477:	e8 1b fb ff ff       	call   c0106f97 <disp_int>
c010747c:	83 c4 10             	add    $0x10,%esp
c010747f:	a1 e8 0e 11 c0       	mov    0xc0110ee8,%eax
c0107484:	8b 15 ec 0e 11 c0    	mov    0xc0110eec,%edx
c010748a:	83 c0 01             	add    $0x1,%eax
c010748d:	83 d2 00             	adc    $0x0,%edx
c0107490:	a3 e8 0e 11 c0       	mov    %eax,0xc0110ee8
c0107495:	89 15 ec 0e 11 c0    	mov    %edx,0xc0110eec
c010749b:	83 ec 0c             	sub    $0xc,%esp
c010749e:	68 c0 a7 10 c0       	push   $0xc010a7c0
c01074a3:	e8 e4 8b ff ff       	call   c010008c <disp_str>
c01074a8:	83 c4 10             	add    $0x10,%esp
c01074ab:	a1 e8 0e 11 c0       	mov    0xc0110ee8,%eax
c01074b0:	8b 15 ec 0e 11 c0    	mov    0xc0110eec,%edx
c01074b6:	83 ec 0c             	sub    $0xc,%esp
c01074b9:	50                   	push   %eax
c01074ba:	e8 d8 fa ff ff       	call   c0106f97 <disp_int>
c01074bf:	83 c4 10             	add    $0x10,%esp
c01074c2:	83 ec 0c             	sub    $0xc,%esp
c01074c5:	68 c2 a7 10 c0       	push   $0xc010a7c2
c01074ca:	e8 bd 8b ff ff       	call   c010008c <disp_str>
c01074cf:	83 c4 10             	add    $0x10,%esp
c01074d2:	83 ec 08             	sub    $0x8,%esp
c01074d5:	6a 0c                	push   $0xc
c01074d7:	68 d4 ab 10 c0       	push   $0xc010abd4
c01074dc:	e8 e6 8b ff ff       	call   c01000c7 <disp_str_colour>
c01074e1:	83 c4 10             	add    $0x10,%esp
c01074e4:	90                   	nop
c01074e5:	c9                   	leave  
c01074e6:	c3                   	ret    

c01074e7 <init_keyboard>:
c01074e7:	55                   	push   %ebp
c01074e8:	89 e5                	mov    %esp,%ebp
c01074ea:	83 ec 08             	sub    $0x8,%esp
c01074ed:	83 ec 04             	sub    $0x4,%esp
c01074f0:	68 00 02 00 00       	push   $0x200
c01074f5:	6a 00                	push   $0x0
c01074f7:	68 ec fb 10 c0       	push   $0xc010fbec
c01074fc:	e8 2a 3d 00 00       	call   c010b22b <Memset>
c0107501:	83 c4 10             	add    $0x10,%esp
c0107504:	c7 05 e0 fb 10 c0 ec 	movl   $0xc010fbec,0xc010fbe0
c010750b:	fb 10 c0 
c010750e:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c0107513:	a3 e4 fb 10 c0       	mov    %eax,0xc010fbe4
c0107518:	c7 05 e8 fb 10 c0 00 	movl   $0x0,0xc010fbe8
c010751f:	00 00 00 
c0107522:	e8 4f d3 ff ff       	call   c0104876 <init_keyboard_handler>
c0107527:	90                   	nop
c0107528:	c9                   	leave  
c0107529:	c3                   	ret    

c010752a <TestTTY>:
c010752a:	55                   	push   %ebp
c010752b:	89 e5                	mov    %esp,%ebp
c010752d:	83 ec 28             	sub    $0x28,%esp
c0107530:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0107537:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c010753e:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0107544:	83 ec 08             	sub    $0x8,%esp
c0107547:	6a 02                	push   $0x2
c0107549:	8d 45 de             	lea    -0x22(%ebp),%eax
c010754c:	50                   	push   %eax
c010754d:	e8 ca d4 ff ff       	call   c0104a1c <open>
c0107552:	83 c4 10             	add    $0x10,%esp
c0107555:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0107558:	83 ec 08             	sub    $0x8,%esp
c010755b:	6a 02                	push   $0x2
c010755d:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107560:	50                   	push   %eax
c0107561:	e8 b6 d4 ff ff       	call   c0104a1c <open>
c0107566:	83 c4 10             	add    $0x10,%esp
c0107569:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010756c:	83 ec 0c             	sub    $0xc,%esp
c010756f:	68 f9 ab 10 c0       	push   $0xc010abf9
c0107574:	e8 d8 0c 00 00       	call   c0108251 <Printf>
c0107579:	83 c4 10             	add    $0x10,%esp
c010757c:	83 ec 0c             	sub    $0xc,%esp
c010757f:	6a 0a                	push   $0xa
c0107581:	e8 a6 9f ff ff       	call   c010152c <sys_malloc>
c0107586:	83 c4 10             	add    $0x10,%esp
c0107589:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010758c:	83 ec 04             	sub    $0x4,%esp
c010758f:	6a 0a                	push   $0xa
c0107591:	6a 00                	push   $0x0
c0107593:	ff 75 ec             	pushl  -0x14(%ebp)
c0107596:	e8 90 3c 00 00       	call   c010b22b <Memset>
c010759b:	83 c4 10             	add    $0x10,%esp
c010759e:	83 ec 04             	sub    $0x4,%esp
c01075a1:	6a 0a                	push   $0xa
c01075a3:	ff 75 ec             	pushl  -0x14(%ebp)
c01075a6:	ff 75 f0             	pushl  -0x10(%ebp)
c01075a9:	e8 03 d5 ff ff       	call   c0104ab1 <read>
c01075ae:	83 c4 10             	add    $0x10,%esp
c01075b1:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01075b4:	83 ec 08             	sub    $0x8,%esp
c01075b7:	ff 75 ec             	pushl  -0x14(%ebp)
c01075ba:	68 0b ac 10 c0       	push   $0xc010ac0b
c01075bf:	e8 8d 0c 00 00       	call   c0108251 <Printf>
c01075c4:	83 c4 10             	add    $0x10,%esp
c01075c7:	eb c3                	jmp    c010758c <TestTTY+0x62>

c01075c9 <TestFS>:
c01075c9:	55                   	push   %ebp
c01075ca:	89 e5                	mov    %esp,%ebp
c01075cc:	81 ec 28 01 00 00    	sub    $0x128,%esp
c01075d2:	83 ec 0c             	sub    $0xc,%esp
c01075d5:	68 15 ac 10 c0       	push   $0xc010ac15
c01075da:	e8 ad 8a ff ff       	call   c010008c <disp_str>
c01075df:	83 c4 10             	add    $0x10,%esp
c01075e2:	c7 45 be 64 65 76 5f 	movl   $0x5f766564,-0x42(%ebp)
c01075e9:	c7 45 c2 74 74 79 31 	movl   $0x31797474,-0x3e(%ebp)
c01075f0:	66 c7 45 c6 00 00    	movw   $0x0,-0x3a(%ebp)
c01075f6:	66 87 db             	xchg   %bx,%bx
c01075f9:	83 ec 08             	sub    $0x8,%esp
c01075fc:	6a 02                	push   $0x2
c01075fe:	8d 45 be             	lea    -0x42(%ebp),%eax
c0107601:	50                   	push   %eax
c0107602:	e8 15 d4 ff ff       	call   c0104a1c <open>
c0107607:	83 c4 10             	add    $0x10,%esp
c010760a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010760d:	66 87 db             	xchg   %bx,%bx
c0107610:	83 ec 08             	sub    $0x8,%esp
c0107613:	6a 02                	push   $0x2
c0107615:	8d 45 be             	lea    -0x42(%ebp),%eax
c0107618:	50                   	push   %eax
c0107619:	e8 fe d3 ff ff       	call   c0104a1c <open>
c010761e:	83 c4 10             	add    $0x10,%esp
c0107621:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0107624:	66 87 db             	xchg   %bx,%bx
c0107627:	83 ec 0c             	sub    $0xc,%esp
c010762a:	68 f9 ab 10 c0       	push   $0xc010abf9
c010762f:	e8 1d 0c 00 00       	call   c0108251 <Printf>
c0107634:	83 c4 10             	add    $0x10,%esp
c0107637:	66 87 db             	xchg   %bx,%bx
c010763a:	c7 45 b9 41 43 00 00 	movl   $0x4341,-0x47(%ebp)
c0107641:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
c0107645:	c7 45 b4 63 41 42 00 	movl   $0x424163,-0x4c(%ebp)
c010764c:	c6 45 b8 00          	movb   $0x0,-0x48(%ebp)
c0107650:	c7 45 aa 49 4e 54 45 	movl   $0x45544e49,-0x56(%ebp)
c0107657:	c7 45 ae 52 52 55 50 	movl   $0x50555252,-0x52(%ebp)
c010765e:	66 c7 45 b2 54 00    	movw   $0x54,-0x4e(%ebp)
c0107664:	66 87 db             	xchg   %bx,%bx
c0107667:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c010766e:	66 87 db             	xchg   %bx,%bx
c0107671:	83 ec 0c             	sub    $0xc,%esp
c0107674:	68 1d ac 10 c0       	push   $0xc010ac1d
c0107679:	e8 d3 0b 00 00       	call   c0108251 <Printf>
c010767e:	83 c4 10             	add    $0x10,%esp
c0107681:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c0107685:	0f 85 43 03 00 00    	jne    c01079ce <TestFS+0x405>
c010768b:	83 ec 08             	sub    $0x8,%esp
c010768e:	6a 07                	push   $0x7
c0107690:	8d 45 b9             	lea    -0x47(%ebp),%eax
c0107693:	50                   	push   %eax
c0107694:	e8 83 d3 ff ff       	call   c0104a1c <open>
c0107699:	83 c4 10             	add    $0x10,%esp
c010769c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010769f:	83 ec 08             	sub    $0x8,%esp
c01076a2:	ff 75 e4             	pushl  -0x1c(%ebp)
c01076a5:	68 35 ac 10 c0       	push   $0xc010ac35
c01076aa:	e8 a2 0b 00 00       	call   c0108251 <Printf>
c01076af:	83 c4 10             	add    $0x10,%esp
c01076b2:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01076b9:	c7 45 96 63 67 3a 68 	movl   $0x683a6763,-0x6a(%ebp)
c01076c0:	c7 45 9a 65 6c 6c 6f 	movl   $0x6f6c6c65,-0x66(%ebp)
c01076c7:	c7 45 9e 2c 77 6f 72 	movl   $0x726f772c,-0x62(%ebp)
c01076ce:	c7 45 a2 6c 64 21 00 	movl   $0x21646c,-0x5e(%ebp)
c01076d5:	c7 45 a6 00 00 00 00 	movl   $0x0,-0x5a(%ebp)
c01076dc:	83 ec 0c             	sub    $0xc,%esp
c01076df:	8d 45 96             	lea    -0x6a(%ebp),%eax
c01076e2:	50                   	push   %eax
c01076e3:	e8 7c 3b 00 00       	call   c010b264 <Strlen>
c01076e8:	83 c4 10             	add    $0x10,%esp
c01076eb:	83 ec 04             	sub    $0x4,%esp
c01076ee:	50                   	push   %eax
c01076ef:	8d 45 96             	lea    -0x6a(%ebp),%eax
c01076f2:	50                   	push   %eax
c01076f3:	ff 75 e4             	pushl  -0x1c(%ebp)
c01076f6:	e8 37 d5 ff ff       	call   c0104c32 <write>
c01076fb:	83 c4 10             	add    $0x10,%esp
c01076fe:	83 ec 04             	sub    $0x4,%esp
c0107701:	6a 14                	push   $0x14
c0107703:	6a 00                	push   $0x0
c0107705:	8d 45 82             	lea    -0x7e(%ebp),%eax
c0107708:	50                   	push   %eax
c0107709:	e8 1d 3b 00 00       	call   c010b22b <Memset>
c010770e:	83 c4 10             	add    $0x10,%esp
c0107711:	83 ec 04             	sub    $0x4,%esp
c0107714:	6a 12                	push   $0x12
c0107716:	8d 45 82             	lea    -0x7e(%ebp),%eax
c0107719:	50                   	push   %eax
c010771a:	ff 75 e4             	pushl  -0x1c(%ebp)
c010771d:	e8 8f d3 ff ff       	call   c0104ab1 <read>
c0107722:	83 c4 10             	add    $0x10,%esp
c0107725:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0107728:	83 ec 08             	sub    $0x8,%esp
c010772b:	8d 45 82             	lea    -0x7e(%ebp),%eax
c010772e:	50                   	push   %eax
c010772f:	68 3e ac 10 c0       	push   $0xc010ac3e
c0107734:	e8 18 0b 00 00       	call   c0108251 <Printf>
c0107739:	83 c4 10             	add    $0x10,%esp
c010773c:	66 87 db             	xchg   %bx,%bx
c010773f:	83 ec 0c             	sub    $0xc,%esp
c0107742:	6a 0a                	push   $0xa
c0107744:	e8 d4 09 00 00       	call   c010811d <delay>
c0107749:	83 c4 10             	add    $0x10,%esp
c010774c:	83 ec 08             	sub    $0x8,%esp
c010774f:	6a 07                	push   $0x7
c0107751:	8d 45 b4             	lea    -0x4c(%ebp),%eax
c0107754:	50                   	push   %eax
c0107755:	e8 c2 d2 ff ff       	call   c0104a1c <open>
c010775a:	83 c4 10             	add    $0x10,%esp
c010775d:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0107760:	83 ec 08             	sub    $0x8,%esp
c0107763:	ff 75 dc             	pushl  -0x24(%ebp)
c0107766:	68 49 ac 10 c0       	push   $0xc010ac49
c010776b:	e8 e1 0a 00 00       	call   c0108251 <Printf>
c0107770:	83 c4 10             	add    $0x10,%esp
c0107773:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010777a:	c7 85 6e ff ff ff 63 	movl   $0x683a6763,-0x92(%ebp)
c0107781:	67 3a 68 
c0107784:	c7 85 72 ff ff ff 6f 	movl   $0x6120776f,-0x8e(%ebp)
c010778b:	77 20 61 
c010778e:	c7 85 76 ff ff ff 72 	movl   $0x79206572,-0x8a(%ebp)
c0107795:	65 20 79 
c0107798:	c7 85 7a ff ff ff 6f 	movl   $0x3f756f,-0x86(%ebp)
c010779f:	75 3f 00 
c01077a2:	c7 85 7e ff ff ff 00 	movl   $0x0,-0x82(%ebp)
c01077a9:	00 00 00 
c01077ac:	83 ec 0c             	sub    $0xc,%esp
c01077af:	8d 85 6e ff ff ff    	lea    -0x92(%ebp),%eax
c01077b5:	50                   	push   %eax
c01077b6:	e8 a9 3a 00 00       	call   c010b264 <Strlen>
c01077bb:	83 c4 10             	add    $0x10,%esp
c01077be:	83 ec 04             	sub    $0x4,%esp
c01077c1:	50                   	push   %eax
c01077c2:	8d 85 6e ff ff ff    	lea    -0x92(%ebp),%eax
c01077c8:	50                   	push   %eax
c01077c9:	ff 75 dc             	pushl  -0x24(%ebp)
c01077cc:	e8 61 d4 ff ff       	call   c0104c32 <write>
c01077d1:	83 c4 10             	add    $0x10,%esp
c01077d4:	83 ec 04             	sub    $0x4,%esp
c01077d7:	6a 14                	push   $0x14
c01077d9:	6a 00                	push   $0x0
c01077db:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c01077e1:	50                   	push   %eax
c01077e2:	e8 44 3a 00 00       	call   c010b22b <Memset>
c01077e7:	83 c4 10             	add    $0x10,%esp
c01077ea:	83 ec 04             	sub    $0x4,%esp
c01077ed:	6a 12                	push   $0x12
c01077ef:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c01077f5:	50                   	push   %eax
c01077f6:	ff 75 dc             	pushl  -0x24(%ebp)
c01077f9:	e8 b3 d2 ff ff       	call   c0104ab1 <read>
c01077fe:	83 c4 10             	add    $0x10,%esp
c0107801:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0107804:	83 ec 08             	sub    $0x8,%esp
c0107807:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c010780d:	50                   	push   %eax
c010780e:	68 53 ac 10 c0       	push   $0xc010ac53
c0107813:	e8 39 0a 00 00       	call   c0108251 <Printf>
c0107818:	83 c4 10             	add    $0x10,%esp
c010781b:	83 ec 08             	sub    $0x8,%esp
c010781e:	6a 07                	push   $0x7
c0107820:	8d 45 aa             	lea    -0x56(%ebp),%eax
c0107823:	50                   	push   %eax
c0107824:	e8 f3 d1 ff ff       	call   c0104a1c <open>
c0107829:	83 c4 10             	add    $0x10,%esp
c010782c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010782f:	83 ec 08             	sub    $0x8,%esp
c0107832:	ff 75 dc             	pushl  -0x24(%ebp)
c0107835:	68 49 ac 10 c0       	push   $0xc010ac49
c010783a:	e8 12 0a 00 00       	call   c0108251 <Printf>
c010783f:	83 c4 10             	add    $0x10,%esp
c0107842:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0107849:	c7 85 3c ff ff ff 49 	movl   $0x69772049,-0xc4(%ebp)
c0107850:	20 77 69 
c0107853:	c7 85 40 ff ff ff 6c 	movl   $0x73206c6c,-0xc0(%ebp)
c010785a:	6c 20 73 
c010785d:	c7 85 44 ff ff ff 75 	movl   $0x65636375,-0xbc(%ebp)
c0107864:	63 63 65 
c0107867:	c7 85 48 ff ff ff 73 	movl   $0x61207373,-0xb8(%ebp)
c010786e:	73 20 61 
c0107871:	c7 85 4c ff ff ff 74 	movl   $0x616c2074,-0xb4(%ebp)
c0107878:	20 6c 61 
c010787b:	c7 85 50 ff ff ff 73 	movl   $0x2e7473,-0xb0(%ebp)
c0107882:	74 2e 00 
c0107885:	c7 85 54 ff ff ff 00 	movl   $0x0,-0xac(%ebp)
c010788c:	00 00 00 
c010788f:	66 c7 85 58 ff ff ff 	movw   $0x0,-0xa8(%ebp)
c0107896:	00 00 
c0107898:	83 ec 0c             	sub    $0xc,%esp
c010789b:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c01078a1:	50                   	push   %eax
c01078a2:	e8 bd 39 00 00       	call   c010b264 <Strlen>
c01078a7:	83 c4 10             	add    $0x10,%esp
c01078aa:	83 ec 04             	sub    $0x4,%esp
c01078ad:	50                   	push   %eax
c01078ae:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c01078b4:	50                   	push   %eax
c01078b5:	ff 75 d4             	pushl  -0x2c(%ebp)
c01078b8:	e8 75 d3 ff ff       	call   c0104c32 <write>
c01078bd:	83 c4 10             	add    $0x10,%esp
c01078c0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01078c7:	eb 5c                	jmp    c0107925 <TestFS+0x35c>
c01078c9:	83 ec 04             	sub    $0x4,%esp
c01078cc:	6a 1e                	push   $0x1e
c01078ce:	6a 00                	push   $0x0
c01078d0:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c01078d6:	50                   	push   %eax
c01078d7:	e8 4f 39 00 00       	call   c010b22b <Memset>
c01078dc:	83 c4 10             	add    $0x10,%esp
c01078df:	83 ec 0c             	sub    $0xc,%esp
c01078e2:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c01078e8:	50                   	push   %eax
c01078e9:	e8 76 39 00 00       	call   c010b264 <Strlen>
c01078ee:	83 c4 10             	add    $0x10,%esp
c01078f1:	83 ec 04             	sub    $0x4,%esp
c01078f4:	50                   	push   %eax
c01078f5:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c01078fb:	50                   	push   %eax
c01078fc:	ff 75 d4             	pushl  -0x2c(%ebp)
c01078ff:	e8 ad d1 ff ff       	call   c0104ab1 <read>
c0107904:	83 c4 10             	add    $0x10,%esp
c0107907:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010790a:	83 ec 08             	sub    $0x8,%esp
c010790d:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c0107913:	50                   	push   %eax
c0107914:	68 5e ac 10 c0       	push   $0xc010ac5e
c0107919:	e8 33 09 00 00       	call   c0108251 <Printf>
c010791e:	83 c4 10             	add    $0x10,%esp
c0107921:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0107925:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c0107929:	7e 9e                	jle    c01078c9 <TestFS+0x300>
c010792b:	c7 85 0a ff ff ff 69 	movl   $0x74736e69,-0xf6(%ebp)
c0107932:	6e 73 74 
c0107935:	c7 85 0e ff ff ff 61 	movl   $0x2e6c6c61,-0xf2(%ebp)
c010793c:	6c 6c 2e 
c010793f:	c7 85 12 ff ff ff 74 	movl   $0x726174,-0xee(%ebp)
c0107946:	61 72 00 
c0107949:	c7 85 16 ff ff ff 00 	movl   $0x0,-0xea(%ebp)
c0107950:	00 00 00 
c0107953:	c7 85 1a ff ff ff 00 	movl   $0x0,-0xe6(%ebp)
c010795a:	00 00 00 
c010795d:	83 ec 08             	sub    $0x8,%esp
c0107960:	6a 00                	push   $0x0
c0107962:	8d 85 0a ff ff ff    	lea    -0xf6(%ebp),%eax
c0107968:	50                   	push   %eax
c0107969:	e8 ae d0 ff ff       	call   c0104a1c <open>
c010796e:	83 c4 10             	add    $0x10,%esp
c0107971:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0107974:	83 ec 08             	sub    $0x8,%esp
c0107977:	ff 75 cc             	pushl  -0x34(%ebp)
c010797a:	68 69 ac 10 c0       	push   $0xc010ac69
c010797f:	e8 cd 08 00 00       	call   c0108251 <Printf>
c0107984:	83 c4 10             	add    $0x10,%esp
c0107987:	83 ec 04             	sub    $0x4,%esp
c010798a:	6a 28                	push   $0x28
c010798c:	6a 00                	push   $0x0
c010798e:	8d 85 e2 fe ff ff    	lea    -0x11e(%ebp),%eax
c0107994:	50                   	push   %eax
c0107995:	e8 91 38 00 00       	call   c010b22b <Memset>
c010799a:	83 c4 10             	add    $0x10,%esp
c010799d:	83 ec 04             	sub    $0x4,%esp
c01079a0:	6a 28                	push   $0x28
c01079a2:	8d 85 e2 fe ff ff    	lea    -0x11e(%ebp),%eax
c01079a8:	50                   	push   %eax
c01079a9:	ff 75 cc             	pushl  -0x34(%ebp)
c01079ac:	e8 00 d1 ff ff       	call   c0104ab1 <read>
c01079b1:	83 c4 10             	add    $0x10,%esp
c01079b4:	89 45 c8             	mov    %eax,-0x38(%ebp)
c01079b7:	83 ec 08             	sub    $0x8,%esp
c01079ba:	8d 85 e2 fe ff ff    	lea    -0x11e(%ebp),%eax
c01079c0:	50                   	push   %eax
c01079c1:	68 73 ac 10 c0       	push   $0xc010ac73
c01079c6:	e8 86 08 00 00       	call   c0108251 <Printf>
c01079cb:	83 c4 10             	add    $0x10,%esp
c01079ce:	90                   	nop
c01079cf:	c9                   	leave  
c01079d0:	c3                   	ret    

c01079d1 <wait_exit>:
c01079d1:	55                   	push   %ebp
c01079d2:	89 e5                	mov    %esp,%ebp
c01079d4:	83 ec 28             	sub    $0x28,%esp
c01079d7:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c01079de:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c01079e5:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c01079eb:	83 ec 08             	sub    $0x8,%esp
c01079ee:	6a 02                	push   $0x2
c01079f0:	8d 45 de             	lea    -0x22(%ebp),%eax
c01079f3:	50                   	push   %eax
c01079f4:	e8 23 d0 ff ff       	call   c0104a1c <open>
c01079f9:	83 c4 10             	add    $0x10,%esp
c01079fc:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01079ff:	83 ec 08             	sub    $0x8,%esp
c0107a02:	6a 02                	push   $0x2
c0107a04:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107a07:	50                   	push   %eax
c0107a08:	e8 0f d0 ff ff       	call   c0104a1c <open>
c0107a0d:	83 c4 10             	add    $0x10,%esp
c0107a10:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0107a13:	e8 64 d3 ff ff       	call   c0104d7c <fork>
c0107a18:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0107a1b:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0107a1f:	7e 35                	jle    c0107a56 <wait_exit+0x85>
c0107a21:	83 ec 0c             	sub    $0xc,%esp
c0107a24:	68 7e ac 10 c0       	push   $0xc010ac7e
c0107a29:	e8 23 08 00 00       	call   c0108251 <Printf>
c0107a2e:	83 c4 10             	add    $0x10,%esp
c0107a31:	83 ec 0c             	sub    $0xc,%esp
c0107a34:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0107a37:	50                   	push   %eax
c0107a38:	e8 cc d2 ff ff       	call   c0104d09 <wait>
c0107a3d:	83 c4 10             	add    $0x10,%esp
c0107a40:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0107a43:	83 ec 08             	sub    $0x8,%esp
c0107a46:	50                   	push   %eax
c0107a47:	68 96 ac 10 c0       	push   $0xc010ac96
c0107a4c:	e8 00 08 00 00       	call   c0108251 <Printf>
c0107a51:	83 c4 10             	add    $0x10,%esp
c0107a54:	eb fe                	jmp    c0107a54 <wait_exit+0x83>
c0107a56:	83 ec 0c             	sub    $0xc,%esp
c0107a59:	68 b1 ac 10 c0       	push   $0xc010acb1
c0107a5e:	e8 ee 07 00 00       	call   c0108251 <Printf>
c0107a63:	83 c4 10             	add    $0x10,%esp
c0107a66:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0107a6d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0107a70:	8d 50 01             	lea    0x1(%eax),%edx
c0107a73:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0107a76:	3d 50 c3 00 00       	cmp    $0xc350,%eax
c0107a7b:	7f 02                	jg     c0107a7f <wait_exit+0xae>
c0107a7d:	eb ee                	jmp    c0107a6d <wait_exit+0x9c>
c0107a7f:	90                   	nop
c0107a80:	83 ec 0c             	sub    $0xc,%esp
c0107a83:	68 bd ac 10 c0       	push   $0xc010acbd
c0107a88:	e8 c4 07 00 00       	call   c0108251 <Printf>
c0107a8d:	83 c4 10             	add    $0x10,%esp
c0107a90:	83 ec 0c             	sub    $0xc,%esp
c0107a93:	68 cb ac 10 c0       	push   $0xc010accb
c0107a98:	e8 b4 07 00 00       	call   c0108251 <Printf>
c0107a9d:	83 c4 10             	add    $0x10,%esp
c0107aa0:	83 ec 0c             	sub    $0xc,%esp
c0107aa3:	68 da ac 10 c0       	push   $0xc010acda
c0107aa8:	e8 a4 07 00 00       	call   c0108251 <Printf>
c0107aad:	83 c4 10             	add    $0x10,%esp
c0107ab0:	83 ec 0c             	sub    $0xc,%esp
c0107ab3:	6a 5a                	push   $0x5a
c0107ab5:	e8 93 d2 ff ff       	call   c0104d4d <exit>
c0107aba:	83 c4 10             	add    $0x10,%esp
c0107abd:	83 ec 0c             	sub    $0xc,%esp
c0107ac0:	68 e9 ac 10 c0       	push   $0xc010ace9
c0107ac5:	e8 87 07 00 00       	call   c0108251 <Printf>
c0107aca:	83 c4 10             	add    $0x10,%esp
c0107acd:	eb fe                	jmp    c0107acd <wait_exit+0xfc>

c0107acf <INIT_fork>:
c0107acf:	55                   	push   %ebp
c0107ad0:	89 e5                	mov    %esp,%ebp
c0107ad2:	83 ec 78             	sub    $0x78,%esp
c0107ad5:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0107adc:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0107ae3:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0107ae9:	83 ec 08             	sub    $0x8,%esp
c0107aec:	6a 02                	push   $0x2
c0107aee:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107af1:	50                   	push   %eax
c0107af2:	e8 25 cf ff ff       	call   c0104a1c <open>
c0107af7:	83 c4 10             	add    $0x10,%esp
c0107afa:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0107afd:	83 ec 08             	sub    $0x8,%esp
c0107b00:	6a 02                	push   $0x2
c0107b02:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107b05:	50                   	push   %eax
c0107b06:	e8 11 cf ff ff       	call   c0104a1c <open>
c0107b0b:	83 c4 10             	add    $0x10,%esp
c0107b0e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107b11:	c7 45 b6 49 4e 49 54 	movl   $0x54494e49,-0x4a(%ebp)
c0107b18:	c7 45 ba 20 69 73 20 	movl   $0x20736920,-0x46(%ebp)
c0107b1f:	c7 45 be 72 75 6e 6e 	movl   $0x6e6e7572,-0x42(%ebp)
c0107b26:	c7 45 c2 69 6e 67 0a 	movl   $0xa676e69,-0x3e(%ebp)
c0107b2d:	c7 45 c6 00 00 00 00 	movl   $0x0,-0x3a(%ebp)
c0107b34:	c7 45 ca 00 00 00 00 	movl   $0x0,-0x36(%ebp)
c0107b3b:	c7 45 ce 00 00 00 00 	movl   $0x0,-0x32(%ebp)
c0107b42:	c7 45 d2 00 00 00 00 	movl   $0x0,-0x2e(%ebp)
c0107b49:	c7 45 d6 00 00 00 00 	movl   $0x0,-0x2a(%ebp)
c0107b50:	c7 45 da 00 00 00 00 	movl   $0x0,-0x26(%ebp)
c0107b57:	83 ec 0c             	sub    $0xc,%esp
c0107b5a:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107b5d:	50                   	push   %eax
c0107b5e:	e8 ee 06 00 00       	call   c0108251 <Printf>
c0107b63:	83 c4 10             	add    $0x10,%esp
c0107b66:	83 ec 0c             	sub    $0xc,%esp
c0107b69:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107b6c:	50                   	push   %eax
c0107b6d:	e8 f2 36 00 00       	call   c010b264 <Strlen>
c0107b72:	83 c4 10             	add    $0x10,%esp
c0107b75:	83 ec 04             	sub    $0x4,%esp
c0107b78:	50                   	push   %eax
c0107b79:	6a 00                	push   $0x0
c0107b7b:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107b7e:	50                   	push   %eax
c0107b7f:	e8 a7 36 00 00       	call   c010b22b <Memset>
c0107b84:	83 c4 10             	add    $0x10,%esp
c0107b87:	83 ec 04             	sub    $0x4,%esp
c0107b8a:	6a 28                	push   $0x28
c0107b8c:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107b8f:	50                   	push   %eax
c0107b90:	ff 75 f0             	pushl  -0x10(%ebp)
c0107b93:	e8 19 cf ff ff       	call   c0104ab1 <read>
c0107b98:	83 c4 10             	add    $0x10,%esp
c0107b9b:	83 ec 0c             	sub    $0xc,%esp
c0107b9e:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107ba1:	50                   	push   %eax
c0107ba2:	e8 aa 06 00 00       	call   c0108251 <Printf>
c0107ba7:	83 c4 10             	add    $0x10,%esp
c0107baa:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0107bb1:	e8 c6 d1 ff ff       	call   c0104d7c <fork>
c0107bb6:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0107bb9:	83 ec 0c             	sub    $0xc,%esp
c0107bbc:	6a 01                	push   $0x1
c0107bbe:	e8 5a 05 00 00       	call   c010811d <delay>
c0107bc3:	83 c4 10             	add    $0x10,%esp
c0107bc6:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0107bca:	0f 8e cd 00 00 00    	jle    c0107c9d <INIT_fork+0x1ce>
c0107bd0:	83 ec 08             	sub    $0x8,%esp
c0107bd3:	ff 75 e8             	pushl  -0x18(%ebp)
c0107bd6:	68 f7 ac 10 c0       	push   $0xc010acf7
c0107bdb:	e8 71 06 00 00       	call   c0108251 <Printf>
c0107be0:	83 c4 10             	add    $0x10,%esp
c0107be3:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0107be7:	c7 45 8e 50 61 72 65 	movl   $0x65726150,-0x72(%ebp)
c0107bee:	c7 45 92 6e 74 2e 4e 	movl   $0x4e2e746e,-0x6e(%ebp)
c0107bf5:	c7 45 96 69 63 65 20 	movl   $0x20656369,-0x6a(%ebp)
c0107bfc:	c7 45 9a 74 6f 20 6d 	movl   $0x6d206f74,-0x66(%ebp)
c0107c03:	c7 45 9e 65 65 74 20 	movl   $0x20746565,-0x62(%ebp)
c0107c0a:	c7 45 a2 79 6f 75 21 	movl   $0x21756f79,-0x5e(%ebp)
c0107c11:	c7 45 a6 0a 00 00 00 	movl   $0xa,-0x5a(%ebp)
c0107c18:	c7 45 aa 00 00 00 00 	movl   $0x0,-0x56(%ebp)
c0107c1f:	c7 45 ae 00 00 00 00 	movl   $0x0,-0x52(%ebp)
c0107c26:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)
c0107c2d:	83 ec 0c             	sub    $0xc,%esp
c0107c30:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107c33:	50                   	push   %eax
c0107c34:	e8 2b 36 00 00       	call   c010b264 <Strlen>
c0107c39:	83 c4 10             	add    $0x10,%esp
c0107c3c:	83 ec 04             	sub    $0x4,%esp
c0107c3f:	50                   	push   %eax
c0107c40:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107c43:	50                   	push   %eax
c0107c44:	ff 75 f4             	pushl  -0xc(%ebp)
c0107c47:	e8 e6 cf ff ff       	call   c0104c32 <write>
c0107c4c:	83 c4 10             	add    $0x10,%esp
c0107c4f:	e8 ab ee ff ff       	call   c0106aff <catch_error>
c0107c54:	83 ec 0c             	sub    $0xc,%esp
c0107c57:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107c5a:	50                   	push   %eax
c0107c5b:	e8 04 36 00 00       	call   c010b264 <Strlen>
c0107c60:	83 c4 10             	add    $0x10,%esp
c0107c63:	83 ec 04             	sub    $0x4,%esp
c0107c66:	50                   	push   %eax
c0107c67:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107c6a:	50                   	push   %eax
c0107c6b:	ff 75 f4             	pushl  -0xc(%ebp)
c0107c6e:	e8 bf cf ff ff       	call   c0104c32 <write>
c0107c73:	83 c4 10             	add    $0x10,%esp
c0107c76:	83 ec 0c             	sub    $0xc,%esp
c0107c79:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107c7c:	50                   	push   %eax
c0107c7d:	e8 e2 35 00 00       	call   c010b264 <Strlen>
c0107c82:	83 c4 10             	add    $0x10,%esp
c0107c85:	83 ec 04             	sub    $0x4,%esp
c0107c88:	50                   	push   %eax
c0107c89:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107c8c:	50                   	push   %eax
c0107c8d:	ff 75 f4             	pushl  -0xc(%ebp)
c0107c90:	e8 9d cf ff ff       	call   c0104c32 <write>
c0107c95:	83 c4 10             	add    $0x10,%esp
c0107c98:	e9 d6 00 00 00       	jmp    c0107d73 <INIT_fork+0x2a4>
c0107c9d:	83 ec 08             	sub    $0x8,%esp
c0107ca0:	ff 75 e8             	pushl  -0x18(%ebp)
c0107ca3:	68 f7 ac 10 c0       	push   $0xc010acf7
c0107ca8:	e8 a4 05 00 00       	call   c0108251 <Printf>
c0107cad:	83 c4 10             	add    $0x10,%esp
c0107cb0:	83 ec 0c             	sub    $0xc,%esp
c0107cb3:	6a 01                	push   $0x1
c0107cb5:	e8 63 04 00 00       	call   c010811d <delay>
c0107cba:	83 c4 10             	add    $0x10,%esp
c0107cbd:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0107cc1:	83 45 ec 02          	addl   $0x2,-0x14(%ebp)
c0107cc5:	c7 45 8e 43 68 69 6c 	movl   $0x6c696843,-0x72(%ebp)
c0107ccc:	c7 45 92 64 2e 53 65 	movl   $0x65532e64,-0x6e(%ebp)
c0107cd3:	c7 45 96 65 20 79 6f 	movl   $0x6f792065,-0x6a(%ebp)
c0107cda:	c7 45 9a 75 20 61 67 	movl   $0x67612075,-0x66(%ebp)
c0107ce1:	c7 45 9e 61 69 6e 0a 	movl   $0xa6e6961,-0x62(%ebp)
c0107ce8:	c7 45 a2 00 00 00 00 	movl   $0x0,-0x5e(%ebp)
c0107cef:	c7 45 a6 00 00 00 00 	movl   $0x0,-0x5a(%ebp)
c0107cf6:	c7 45 aa 00 00 00 00 	movl   $0x0,-0x56(%ebp)
c0107cfd:	c7 45 ae 00 00 00 00 	movl   $0x0,-0x52(%ebp)
c0107d04:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)
c0107d0b:	83 ec 0c             	sub    $0xc,%esp
c0107d0e:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107d11:	50                   	push   %eax
c0107d12:	e8 4d 35 00 00       	call   c010b264 <Strlen>
c0107d17:	83 c4 10             	add    $0x10,%esp
c0107d1a:	83 ec 04             	sub    $0x4,%esp
c0107d1d:	50                   	push   %eax
c0107d1e:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107d21:	50                   	push   %eax
c0107d22:	ff 75 f4             	pushl  -0xc(%ebp)
c0107d25:	e8 08 cf ff ff       	call   c0104c32 <write>
c0107d2a:	83 c4 10             	add    $0x10,%esp
c0107d2d:	83 ec 0c             	sub    $0xc,%esp
c0107d30:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107d33:	50                   	push   %eax
c0107d34:	e8 2b 35 00 00       	call   c010b264 <Strlen>
c0107d39:	83 c4 10             	add    $0x10,%esp
c0107d3c:	83 ec 04             	sub    $0x4,%esp
c0107d3f:	50                   	push   %eax
c0107d40:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107d43:	50                   	push   %eax
c0107d44:	ff 75 f4             	pushl  -0xc(%ebp)
c0107d47:	e8 e6 ce ff ff       	call   c0104c32 <write>
c0107d4c:	83 c4 10             	add    $0x10,%esp
c0107d4f:	83 ec 0c             	sub    $0xc,%esp
c0107d52:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107d55:	50                   	push   %eax
c0107d56:	e8 09 35 00 00       	call   c010b264 <Strlen>
c0107d5b:	83 c4 10             	add    $0x10,%esp
c0107d5e:	83 ec 04             	sub    $0x4,%esp
c0107d61:	50                   	push   %eax
c0107d62:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107d65:	50                   	push   %eax
c0107d66:	ff 75 f4             	pushl  -0xc(%ebp)
c0107d69:	e8 c4 ce ff ff       	call   c0104c32 <write>
c0107d6e:	83 c4 10             	add    $0x10,%esp
c0107d71:	eb fe                	jmp    c0107d71 <INIT_fork+0x2a2>
c0107d73:	83 ec 04             	sub    $0x4,%esp
c0107d76:	6a 28                	push   $0x28
c0107d78:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107d7b:	50                   	push   %eax
c0107d7c:	ff 75 f0             	pushl  -0x10(%ebp)
c0107d7f:	e8 2d cd ff ff       	call   c0104ab1 <read>
c0107d84:	83 c4 10             	add    $0x10,%esp
c0107d87:	83 ec 0c             	sub    $0xc,%esp
c0107d8a:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107d8d:	50                   	push   %eax
c0107d8e:	e8 be 04 00 00       	call   c0108251 <Printf>
c0107d93:	83 c4 10             	add    $0x10,%esp
c0107d96:	83 ec 0c             	sub    $0xc,%esp
c0107d99:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107d9c:	50                   	push   %eax
c0107d9d:	e8 af 04 00 00       	call   c0108251 <Printf>
c0107da2:	83 c4 10             	add    $0x10,%esp
c0107da5:	83 ec 0c             	sub    $0xc,%esp
c0107da8:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107dab:	50                   	push   %eax
c0107dac:	e8 a0 04 00 00       	call   c0108251 <Printf>
c0107db1:	83 c4 10             	add    $0x10,%esp
c0107db4:	83 ec 0c             	sub    $0xc,%esp
c0107db7:	68 01 ad 10 c0       	push   $0xc010ad01
c0107dbc:	e8 a9 07 00 00       	call   c010856a <spin>
c0107dc1:	83 c4 10             	add    $0x10,%esp
c0107dc4:	90                   	nop
c0107dc5:	c9                   	leave  
c0107dc6:	c3                   	ret    

c0107dc7 <simple_shell>:
c0107dc7:	55                   	push   %ebp
c0107dc8:	89 e5                	mov    %esp,%ebp
c0107dca:	57                   	push   %edi
c0107dcb:	83 ec 64             	sub    $0x64,%esp
c0107dce:	c7 45 d2 64 65 76 5f 	movl   $0x5f766564,-0x2e(%ebp)
c0107dd5:	c7 45 d6 74 74 79 31 	movl   $0x31797474,-0x2a(%ebp)
c0107ddc:	66 c7 45 da 00 00    	movw   $0x0,-0x26(%ebp)
c0107de2:	83 ec 08             	sub    $0x8,%esp
c0107de5:	6a 02                	push   $0x2
c0107de7:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c0107dea:	50                   	push   %eax
c0107deb:	e8 2c cc ff ff       	call   c0104a1c <open>
c0107df0:	83 c4 10             	add    $0x10,%esp
c0107df3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107df6:	83 ec 08             	sub    $0x8,%esp
c0107df9:	6a 02                	push   $0x2
c0107dfb:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c0107dfe:	50                   	push   %eax
c0107dff:	e8 18 cc ff ff       	call   c0104a1c <open>
c0107e04:	83 c4 10             	add    $0x10,%esp
c0107e07:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0107e0a:	8d 55 a8             	lea    -0x58(%ebp),%edx
c0107e0d:	b8 00 00 00 00       	mov    $0x0,%eax
c0107e12:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0107e17:	89 d7                	mov    %edx,%edi
c0107e19:	f3 ab                	rep stos %eax,%es:(%edi)
c0107e1b:	c7 45 a8 09 ad 10 c0 	movl   $0xc010ad09,-0x58(%ebp)
c0107e22:	c7 45 ac 0e ad 10 c0 	movl   $0xc010ad0e,-0x54(%ebp)
c0107e29:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0107e30:	66 87 db             	xchg   %bx,%bx
c0107e33:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
c0107e3a:	c7 45 e8 02 00 00 00 	movl   $0x2,-0x18(%ebp)
c0107e41:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0107e44:	c7 44 85 a8 00 00 00 	movl   $0x0,-0x58(%ebp,%eax,4)
c0107e4b:	00 
c0107e4c:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0107e4f:	85 c0                	test   %eax,%eax
c0107e51:	75 1c                	jne    c0107e6f <simple_shell+0xa8>
c0107e53:	68 da 02 00 00       	push   $0x2da
c0107e58:	68 14 ad 10 c0       	push   $0xc010ad14
c0107e5d:	68 14 ad 10 c0       	push   $0xc010ad14
c0107e62:	68 24 ad 10 c0       	push   $0xc010ad24
c0107e67:	e8 42 07 00 00       	call   c01085ae <assertion_failure>
c0107e6c:	83 c4 10             	add    $0x10,%esp
c0107e6f:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0107e72:	83 ec 08             	sub    $0x8,%esp
c0107e75:	6a 02                	push   $0x2
c0107e77:	50                   	push   %eax
c0107e78:	e8 9f cb ff ff       	call   c0104a1c <open>
c0107e7d:	83 c4 10             	add    $0x10,%esp
c0107e80:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0107e83:	66 87 db             	xchg   %bx,%bx
c0107e86:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
c0107e8a:	75 4e                	jne    c0107eda <simple_shell+0x113>
c0107e8c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0107e93:	eb 26                	jmp    c0107ebb <simple_shell+0xf4>
c0107e95:	8b 55 a8             	mov    -0x58(%ebp),%edx
c0107e98:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0107e9b:	01 d0                	add    %edx,%eax
c0107e9d:	0f b6 00             	movzbl (%eax),%eax
c0107ea0:	0f be c0             	movsbl %al,%eax
c0107ea3:	83 ec 04             	sub    $0x4,%esp
c0107ea6:	50                   	push   %eax
c0107ea7:	ff 75 f4             	pushl  -0xc(%ebp)
c0107eaa:	68 33 ad 10 c0       	push   $0xc010ad33
c0107eaf:	e8 9d 03 00 00       	call   c0108251 <Printf>
c0107eb4:	83 c4 10             	add    $0x10,%esp
c0107eb7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0107ebb:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
c0107ebf:	7e d4                	jle    c0107e95 <simple_shell+0xce>
c0107ec1:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0107ec4:	83 ec 08             	sub    $0x8,%esp
c0107ec7:	50                   	push   %eax
c0107ec8:	68 3a ad 10 c0       	push   $0xc010ad3a
c0107ecd:	e8 7f 03 00 00       	call   c0108251 <Printf>
c0107ed2:	83 c4 10             	add    $0x10,%esp
c0107ed5:	e9 81 00 00 00       	jmp    c0107f5b <simple_shell+0x194>
c0107eda:	83 ec 0c             	sub    $0xc,%esp
c0107edd:	68 40 ad 10 c0       	push   $0xc010ad40
c0107ee2:	e8 6a 03 00 00       	call   c0108251 <Printf>
c0107ee7:	83 c4 10             	add    $0x10,%esp
c0107eea:	e8 8d ce ff ff       	call   c0104d7c <fork>
c0107eef:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0107ef2:	83 ec 0c             	sub    $0xc,%esp
c0107ef5:	68 55 ad 10 c0       	push   $0xc010ad55
c0107efa:	e8 52 03 00 00       	call   c0108251 <Printf>
c0107eff:	83 c4 10             	add    $0x10,%esp
c0107f02:	66 87 db             	xchg   %bx,%bx
c0107f05:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
c0107f09:	7e 11                	jle    c0107f1c <simple_shell+0x155>
c0107f0b:	83 ec 0c             	sub    $0xc,%esp
c0107f0e:	8d 45 a4             	lea    -0x5c(%ebp),%eax
c0107f11:	50                   	push   %eax
c0107f12:	e8 f2 cd ff ff       	call   c0104d09 <wait>
c0107f17:	83 c4 10             	add    $0x10,%esp
c0107f1a:	eb 3f                	jmp    c0107f5b <simple_shell+0x194>
c0107f1c:	83 ec 0c             	sub    $0xc,%esp
c0107f1f:	68 6a ad 10 c0       	push   $0xc010ad6a
c0107f24:	e8 28 03 00 00       	call   c0108251 <Printf>
c0107f29:	83 c4 10             	add    $0x10,%esp
c0107f2c:	83 ec 0c             	sub    $0xc,%esp
c0107f2f:	ff 75 e0             	pushl  -0x20(%ebp)
c0107f32:	e8 80 cd ff ff       	call   c0104cb7 <close>
c0107f37:	83 c4 10             	add    $0x10,%esp
c0107f3a:	66 87 db             	xchg   %bx,%bx
c0107f3d:	6a 00                	push   $0x0
c0107f3f:	68 0e ad 10 c0       	push   $0xc010ad0e
c0107f44:	68 09 ad 10 c0       	push   $0xc010ad09
c0107f49:	68 86 ad 10 c0       	push   $0xc010ad86
c0107f4e:	e8 fc d0 ff ff       	call   c010504f <execl>
c0107f53:	83 c4 10             	add    $0x10,%esp
c0107f56:	66 87 db             	xchg   %bx,%bx
c0107f59:	eb fe                	jmp    c0107f59 <simple_shell+0x192>
c0107f5b:	8b 7d fc             	mov    -0x4(%ebp),%edi
c0107f5e:	c9                   	leave  
c0107f5f:	c3                   	ret    

c0107f60 <test_shell>:
c0107f60:	55                   	push   %ebp
c0107f61:	89 e5                	mov    %esp,%ebp
c0107f63:	83 ec 38             	sub    $0x38,%esp
c0107f66:	c7 45 ea 64 65 76 5f 	movl   $0x5f766564,-0x16(%ebp)
c0107f6d:	c7 45 ee 74 74 79 31 	movl   $0x31797474,-0x12(%ebp)
c0107f74:	66 c7 45 f2 00 00    	movw   $0x0,-0xe(%ebp)
c0107f7a:	83 ec 08             	sub    $0x8,%esp
c0107f7d:	6a 02                	push   $0x2
c0107f7f:	8d 45 ea             	lea    -0x16(%ebp),%eax
c0107f82:	50                   	push   %eax
c0107f83:	e8 94 ca ff ff       	call   c0104a1c <open>
c0107f88:	83 c4 10             	add    $0x10,%esp
c0107f8b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0107f8e:	c7 45 d6 69 6e 73 74 	movl   $0x74736e69,-0x2a(%ebp)
c0107f95:	c7 45 da 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x26(%ebp)
c0107f9c:	c7 45 de 74 61 72 00 	movl   $0x726174,-0x22(%ebp)
c0107fa3:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c0107faa:	c7 45 e6 00 00 00 00 	movl   $0x0,-0x1a(%ebp)
c0107fb1:	83 ec 0c             	sub    $0xc,%esp
c0107fb4:	8d 45 d6             	lea    -0x2a(%ebp),%eax
c0107fb7:	50                   	push   %eax
c0107fb8:	e8 1f ec ff ff       	call   c0106bdc <untar>
c0107fbd:	83 c4 10             	add    $0x10,%esp
c0107fc0:	e8 02 fe ff ff       	call   c0107dc7 <simple_shell>
c0107fc5:	90                   	nop
c0107fc6:	c9                   	leave  
c0107fc7:	c3                   	ret    

c0107fc8 <test_exec>:
c0107fc8:	55                   	push   %ebp
c0107fc9:	89 e5                	mov    %esp,%ebp
c0107fcb:	83 ec 38             	sub    $0x38,%esp
c0107fce:	83 ec 0c             	sub    $0xc,%esp
c0107fd1:	68 c0 a7 10 c0       	push   $0xc010a7c0
c0107fd6:	e8 b1 80 ff ff       	call   c010008c <disp_str>
c0107fdb:	83 c4 10             	add    $0x10,%esp
c0107fde:	83 ec 0c             	sub    $0xc,%esp
c0107fe1:	68 c2 a7 10 c0       	push   $0xc010a7c2
c0107fe6:	e8 a1 80 ff ff       	call   c010008c <disp_str>
c0107feb:	83 c4 10             	add    $0x10,%esp
c0107fee:	c7 45 e6 64 65 76 5f 	movl   $0x5f766564,-0x1a(%ebp)
c0107ff5:	c7 45 ea 74 74 79 31 	movl   $0x31797474,-0x16(%ebp)
c0107ffc:	66 c7 45 ee 00 00    	movw   $0x0,-0x12(%ebp)
c0108002:	83 ec 08             	sub    $0x8,%esp
c0108005:	6a 02                	push   $0x2
c0108007:	8d 45 e6             	lea    -0x1a(%ebp),%eax
c010800a:	50                   	push   %eax
c010800b:	e8 0c ca ff ff       	call   c0104a1c <open>
c0108010:	83 c4 10             	add    $0x10,%esp
c0108013:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108016:	c7 45 d2 69 6e 73 74 	movl   $0x74736e69,-0x2e(%ebp)
c010801d:	c7 45 d6 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x2a(%ebp)
c0108024:	c7 45 da 74 61 72 00 	movl   $0x726174,-0x26(%ebp)
c010802b:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
c0108032:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c0108039:	83 ec 0c             	sub    $0xc,%esp
c010803c:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c010803f:	50                   	push   %eax
c0108040:	e8 97 eb ff ff       	call   c0106bdc <untar>
c0108045:	83 c4 10             	add    $0x10,%esp
c0108048:	83 ec 08             	sub    $0x8,%esp
c010804b:	6a 00                	push   $0x0
c010804d:	68 8c ad 10 c0       	push   $0xc010ad8c
c0108052:	68 90 ad 10 c0       	push   $0xc010ad90
c0108057:	68 0e ad 10 c0       	push   $0xc010ad0e
c010805c:	68 09 ad 10 c0       	push   $0xc010ad09
c0108061:	68 86 ad 10 c0       	push   $0xc010ad86
c0108066:	e8 e4 cf ff ff       	call   c010504f <execl>
c010806b:	83 c4 20             	add    $0x20,%esp
c010806e:	e8 48 ea ff ff       	call   c0106abb <stop_here>
c0108073:	e8 04 cd ff ff       	call   c0104d7c <fork>
c0108078:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010807b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010807f:	7e 25                	jle    c01080a6 <test_exec+0xde>
c0108081:	83 ec 0c             	sub    $0xc,%esp
c0108084:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0108087:	50                   	push   %eax
c0108088:	e8 7c cc ff ff       	call   c0104d09 <wait>
c010808d:	83 c4 10             	add    $0x10,%esp
c0108090:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0108093:	83 ec 08             	sub    $0x8,%esp
c0108096:	50                   	push   %eax
c0108097:	68 96 ad 10 c0       	push   $0xc010ad96
c010809c:	e8 b0 01 00 00       	call   c0108251 <Printf>
c01080a1:	83 c4 10             	add    $0x10,%esp
c01080a4:	eb 33                	jmp    c01080d9 <test_exec+0x111>
c01080a6:	83 ec 0c             	sub    $0xc,%esp
c01080a9:	68 a8 ad 10 c0       	push   $0xc010ada8
c01080ae:	e8 9e 01 00 00       	call   c0108251 <Printf>
c01080b3:	83 c4 10             	add    $0x10,%esp
c01080b6:	83 ec 0c             	sub    $0xc,%esp
c01080b9:	6a 00                	push   $0x0
c01080bb:	68 90 ad 10 c0       	push   $0xc010ad90
c01080c0:	68 0e ad 10 c0       	push   $0xc010ad0e
c01080c5:	68 09 ad 10 c0       	push   $0xc010ad09
c01080ca:	68 86 ad 10 c0       	push   $0xc010ad86
c01080cf:	e8 7b cf ff ff       	call   c010504f <execl>
c01080d4:	83 c4 20             	add    $0x20,%esp
c01080d7:	eb fe                	jmp    c01080d7 <test_exec+0x10f>
c01080d9:	c9                   	leave  
c01080da:	c3                   	ret    

c01080db <INIT>:
c01080db:	55                   	push   %ebp
c01080dc:	89 e5                	mov    %esp,%ebp
c01080de:	83 ec 08             	sub    $0x8,%esp
c01080e1:	e8 7a fe ff ff       	call   c0107f60 <test_shell>
c01080e6:	eb fe                	jmp    c01080e6 <INIT+0xb>

c01080e8 <TestA>:
c01080e8:	55                   	push   %ebp
c01080e9:	89 e5                	mov    %esp,%ebp
c01080eb:	83 ec 08             	sub    $0x8,%esp
c01080ee:	83 ec 0c             	sub    $0xc,%esp
c01080f1:	6a 05                	push   $0x5
c01080f3:	e8 9f ee ff ff       	call   c0106f97 <disp_int>
c01080f8:	83 c4 10             	add    $0x10,%esp
c01080fb:	83 ec 0c             	sub    $0xc,%esp
c01080fe:	68 d3 a8 10 c0       	push   $0xc010a8d3
c0108103:	e8 84 7f ff ff       	call   c010008c <disp_str>
c0108108:	83 c4 10             	add    $0x10,%esp
c010810b:	83 ec 0c             	sub    $0xc,%esp
c010810e:	68 b6 ad 10 c0       	push   $0xc010adb6
c0108113:	e8 74 7f ff ff       	call   c010008c <disp_str>
c0108118:	83 c4 10             	add    $0x10,%esp
c010811b:	eb fe                	jmp    c010811b <TestA+0x33>

c010811d <delay>:
c010811d:	55                   	push   %ebp
c010811e:	89 e5                	mov    %esp,%ebp
c0108120:	83 ec 10             	sub    $0x10,%esp
c0108123:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c010812a:	eb 2a                	jmp    c0108156 <delay+0x39>
c010812c:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0108133:	eb 17                	jmp    c010814c <delay+0x2f>
c0108135:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010813c:	eb 04                	jmp    c0108142 <delay+0x25>
c010813e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0108142:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c0108146:	7e f6                	jle    c010813e <delay+0x21>
c0108148:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c010814c:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
c0108150:	7e e3                	jle    c0108135 <delay+0x18>
c0108152:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0108156:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0108159:	3b 45 08             	cmp    0x8(%ebp),%eax
c010815c:	7c ce                	jl     c010812c <delay+0xf>
c010815e:	90                   	nop
c010815f:	c9                   	leave  
c0108160:	c3                   	ret    

c0108161 <TestB>:
c0108161:	55                   	push   %ebp
c0108162:	89 e5                	mov    %esp,%ebp
c0108164:	83 ec 08             	sub    $0x8,%esp
c0108167:	83 ec 0c             	sub    $0xc,%esp
c010816a:	68 bd ad 10 c0       	push   $0xc010adbd
c010816f:	e8 18 7f ff ff       	call   c010008c <disp_str>
c0108174:	83 c4 10             	add    $0x10,%esp
c0108177:	eb fe                	jmp    c0108177 <TestB+0x16>

c0108179 <TestC>:
c0108179:	55                   	push   %ebp
c010817a:	89 e5                	mov    %esp,%ebp
c010817c:	83 ec 18             	sub    $0x18,%esp
c010817f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108186:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c010818a:	77 1a                	ja     c01081a6 <TestC+0x2d>
c010818c:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
c0108193:	83 ec 08             	sub    $0x8,%esp
c0108196:	ff 75 f0             	pushl  -0x10(%ebp)
c0108199:	68 c0 ad 10 c0       	push   $0xc010adc0
c010819e:	e8 ae 00 00 00       	call   c0108251 <Printf>
c01081a3:	83 c4 10             	add    $0x10,%esp
c01081a6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01081aa:	eb da                	jmp    c0108186 <TestC+0xd>

c01081ac <sys_get_ticks>:
c01081ac:	55                   	push   %ebp
c01081ad:	89 e5                	mov    %esp,%ebp
c01081af:	a1 e8 0e 11 c0       	mov    0xc0110ee8,%eax
c01081b4:	8b 15 ec 0e 11 c0    	mov    0xc0110eec,%edx
c01081ba:	5d                   	pop    %ebp
c01081bb:	c3                   	ret    

c01081bc <sys_write>:
c01081bc:	55                   	push   %ebp
c01081bd:	89 e5                	mov    %esp,%ebp
c01081bf:	83 ec 18             	sub    $0x18,%esp
c01081c2:	8b 45 10             	mov    0x10(%ebp),%eax
c01081c5:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c01081cb:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c01081d1:	05 00 fe 10 c0       	add    $0xc010fe00,%eax
c01081d6:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01081d9:	8b 45 0c             	mov    0xc(%ebp),%eax
c01081dc:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01081df:	8b 45 08             	mov    0x8(%ebp),%eax
c01081e2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01081e5:	eb 20                	jmp    c0108207 <sys_write+0x4b>
c01081e7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01081ea:	0f b6 00             	movzbl (%eax),%eax
c01081ed:	0f b6 c0             	movzbl %al,%eax
c01081f0:	83 ec 08             	sub    $0x8,%esp
c01081f3:	50                   	push   %eax
c01081f4:	ff 75 ec             	pushl  -0x14(%ebp)
c01081f7:	e8 91 bb ff ff       	call   c0103d8d <out_char>
c01081fc:	83 c4 10             	add    $0x10,%esp
c01081ff:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0108203:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
c0108207:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010820b:	7f da                	jg     c01081e7 <sys_write+0x2b>
c010820d:	90                   	nop
c010820e:	c9                   	leave  
c010820f:	c3                   	ret    

c0108210 <milli_delay>:
c0108210:	55                   	push   %ebp
c0108211:	89 e5                	mov    %esp,%ebp
c0108213:	83 ec 18             	sub    $0x18,%esp
c0108216:	e8 8a 11 00 00       	call   c01093a5 <get_ticks_ipc>
c010821b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010821e:	90                   	nop
c010821f:	e8 81 11 00 00       	call   c01093a5 <get_ticks_ipc>
c0108224:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0108227:	89 c1                	mov    %eax,%ecx
c0108229:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
c010822e:	89 c8                	mov    %ecx,%eax
c0108230:	f7 ea                	imul   %edx
c0108232:	c1 fa 05             	sar    $0x5,%edx
c0108235:	89 c8                	mov    %ecx,%eax
c0108237:	c1 f8 1f             	sar    $0x1f,%eax
c010823a:	29 c2                	sub    %eax,%edx
c010823c:	89 d0                	mov    %edx,%eax
c010823e:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
c0108244:	39 45 08             	cmp    %eax,0x8(%ebp)
c0108247:	77 d6                	ja     c010821f <milli_delay+0xf>
c0108249:	90                   	nop
c010824a:	c9                   	leave  
c010824b:	c3                   	ret    

c010824c <TaskSys>:
c010824c:	55                   	push   %ebp
c010824d:	89 e5                	mov    %esp,%ebp
c010824f:	eb fe                	jmp    c010824f <TaskSys+0x3>

c0108251 <Printf>:
c0108251:	55                   	push   %ebp
c0108252:	89 e5                	mov    %esp,%ebp
c0108254:	81 ec 18 01 00 00    	sub    $0x118,%esp
c010825a:	83 ec 04             	sub    $0x4,%esp
c010825d:	68 00 01 00 00       	push   $0x100
c0108262:	6a 00                	push   $0x0
c0108264:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c010826a:	50                   	push   %eax
c010826b:	e8 bb 2f 00 00       	call   c010b22b <Memset>
c0108270:	83 c4 10             	add    $0x10,%esp
c0108273:	8d 45 0c             	lea    0xc(%ebp),%eax
c0108276:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108279:	8b 45 08             	mov    0x8(%ebp),%eax
c010827c:	83 ec 04             	sub    $0x4,%esp
c010827f:	ff 75 f4             	pushl  -0xc(%ebp)
c0108282:	50                   	push   %eax
c0108283:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108289:	50                   	push   %eax
c010828a:	e8 20 00 00 00       	call   c01082af <vsprintf>
c010828f:	83 c4 10             	add    $0x10,%esp
c0108292:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108295:	83 ec 04             	sub    $0x4,%esp
c0108298:	ff 75 f0             	pushl  -0x10(%ebp)
c010829b:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c01082a1:	50                   	push   %eax
c01082a2:	6a 00                	push   $0x0
c01082a4:	e8 89 c9 ff ff       	call   c0104c32 <write>
c01082a9:	83 c4 10             	add    $0x10,%esp
c01082ac:	90                   	nop
c01082ad:	c9                   	leave  
c01082ae:	c3                   	ret    

c01082af <vsprintf>:
c01082af:	55                   	push   %ebp
c01082b0:	89 e5                	mov    %esp,%ebp
c01082b2:	81 ec 68 02 00 00    	sub    $0x268,%esp
c01082b8:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c01082be:	89 85 e4 fd ff ff    	mov    %eax,-0x21c(%ebp)
c01082c4:	83 ec 04             	sub    $0x4,%esp
c01082c7:	6a 40                	push   $0x40
c01082c9:	6a 00                	push   $0x0
c01082cb:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c01082d1:	50                   	push   %eax
c01082d2:	e8 54 2f 00 00       	call   c010b22b <Memset>
c01082d7:	83 c4 10             	add    $0x10,%esp
c01082da:	8b 45 10             	mov    0x10(%ebp),%eax
c01082dd:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01082e0:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01082e7:	8b 45 08             	mov    0x8(%ebp),%eax
c01082ea:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01082ed:	e9 53 01 00 00       	jmp    c0108445 <vsprintf+0x196>
c01082f2:	8b 45 0c             	mov    0xc(%ebp),%eax
c01082f5:	0f b6 00             	movzbl (%eax),%eax
c01082f8:	3c 25                	cmp    $0x25,%al
c01082fa:	74 16                	je     c0108312 <vsprintf+0x63>
c01082fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01082ff:	8d 50 01             	lea    0x1(%eax),%edx
c0108302:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0108305:	8b 55 0c             	mov    0xc(%ebp),%edx
c0108308:	0f b6 12             	movzbl (%edx),%edx
c010830b:	88 10                	mov    %dl,(%eax)
c010830d:	e9 2f 01 00 00       	jmp    c0108441 <vsprintf+0x192>
c0108312:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c0108316:	8b 45 0c             	mov    0xc(%ebp),%eax
c0108319:	0f b6 00             	movzbl (%eax),%eax
c010831c:	0f be c0             	movsbl %al,%eax
c010831f:	83 f8 64             	cmp    $0x64,%eax
c0108322:	74 26                	je     c010834a <vsprintf+0x9b>
c0108324:	83 f8 64             	cmp    $0x64,%eax
c0108327:	7f 0e                	jg     c0108337 <vsprintf+0x88>
c0108329:	83 f8 63             	cmp    $0x63,%eax
c010832c:	0f 84 f2 00 00 00    	je     c0108424 <vsprintf+0x175>
c0108332:	e9 0a 01 00 00       	jmp    c0108441 <vsprintf+0x192>
c0108337:	83 f8 73             	cmp    $0x73,%eax
c010833a:	0f 84 b0 00 00 00    	je     c01083f0 <vsprintf+0x141>
c0108340:	83 f8 78             	cmp    $0x78,%eax
c0108343:	74 5d                	je     c01083a2 <vsprintf+0xf3>
c0108345:	e9 f7 00 00 00       	jmp    c0108441 <vsprintf+0x192>
c010834a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010834d:	8b 00                	mov    (%eax),%eax
c010834f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0108352:	83 ec 04             	sub    $0x4,%esp
c0108355:	6a 0a                	push   $0xa
c0108357:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c010835d:	50                   	push   %eax
c010835e:	ff 75 e8             	pushl  -0x18(%ebp)
c0108361:	e8 96 10 00 00       	call   c01093fc <itoa>
c0108366:	83 c4 10             	add    $0x10,%esp
c0108369:	83 ec 08             	sub    $0x8,%esp
c010836c:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0108372:	50                   	push   %eax
c0108373:	ff 75 f4             	pushl  -0xc(%ebp)
c0108376:	e8 cf 2e 00 00       	call   c010b24a <Strcpy>
c010837b:	83 c4 10             	add    $0x10,%esp
c010837e:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0108382:	83 ec 0c             	sub    $0xc,%esp
c0108385:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c010838b:	50                   	push   %eax
c010838c:	e8 d3 2e 00 00       	call   c010b264 <Strlen>
c0108391:	83 c4 10             	add    $0x10,%esp
c0108394:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108397:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010839a:	01 45 f4             	add    %eax,-0xc(%ebp)
c010839d:	e9 9f 00 00 00       	jmp    c0108441 <vsprintf+0x192>
c01083a2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01083a5:	8b 00                	mov    (%eax),%eax
c01083a7:	83 ec 08             	sub    $0x8,%esp
c01083aa:	50                   	push   %eax
c01083ab:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c01083b1:	50                   	push   %eax
c01083b2:	e8 3a eb ff ff       	call   c0106ef1 <atoi>
c01083b7:	83 c4 10             	add    $0x10,%esp
c01083ba:	83 ec 08             	sub    $0x8,%esp
c01083bd:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c01083c3:	50                   	push   %eax
c01083c4:	ff 75 f4             	pushl  -0xc(%ebp)
c01083c7:	e8 7e 2e 00 00       	call   c010b24a <Strcpy>
c01083cc:	83 c4 10             	add    $0x10,%esp
c01083cf:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c01083d3:	83 ec 0c             	sub    $0xc,%esp
c01083d6:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c01083dc:	50                   	push   %eax
c01083dd:	e8 82 2e 00 00       	call   c010b264 <Strlen>
c01083e2:	83 c4 10             	add    $0x10,%esp
c01083e5:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01083e8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01083eb:	01 45 f4             	add    %eax,-0xc(%ebp)
c01083ee:	eb 51                	jmp    c0108441 <vsprintf+0x192>
c01083f0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01083f3:	8b 00                	mov    (%eax),%eax
c01083f5:	83 ec 08             	sub    $0x8,%esp
c01083f8:	50                   	push   %eax
c01083f9:	ff 75 f4             	pushl  -0xc(%ebp)
c01083fc:	e8 49 2e 00 00       	call   c010b24a <Strcpy>
c0108401:	83 c4 10             	add    $0x10,%esp
c0108404:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108407:	8b 00                	mov    (%eax),%eax
c0108409:	83 ec 0c             	sub    $0xc,%esp
c010840c:	50                   	push   %eax
c010840d:	e8 52 2e 00 00       	call   c010b264 <Strlen>
c0108412:	83 c4 10             	add    $0x10,%esp
c0108415:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108418:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c010841c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010841f:	01 45 f4             	add    %eax,-0xc(%ebp)
c0108422:	eb 1d                	jmp    c0108441 <vsprintf+0x192>
c0108424:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108427:	0f b6 10             	movzbl (%eax),%edx
c010842a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010842d:	88 10                	mov    %dl,(%eax)
c010842f:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0108433:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c010843a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010843d:	01 45 f4             	add    %eax,-0xc(%ebp)
c0108440:	90                   	nop
c0108441:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c0108445:	8b 45 0c             	mov    0xc(%ebp),%eax
c0108448:	0f b6 00             	movzbl (%eax),%eax
c010844b:	84 c0                	test   %al,%al
c010844d:	0f 85 9f fe ff ff    	jne    c01082f2 <vsprintf+0x43>
c0108453:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108456:	2b 45 08             	sub    0x8(%ebp),%eax
c0108459:	c9                   	leave  
c010845a:	c3                   	ret    

c010845b <printx>:
c010845b:	55                   	push   %ebp
c010845c:	89 e5                	mov    %esp,%ebp
c010845e:	81 ec 18 01 00 00    	sub    $0x118,%esp
c0108464:	8d 45 0c             	lea    0xc(%ebp),%eax
c0108467:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010846a:	8b 45 08             	mov    0x8(%ebp),%eax
c010846d:	83 ec 04             	sub    $0x4,%esp
c0108470:	ff 75 f4             	pushl  -0xc(%ebp)
c0108473:	50                   	push   %eax
c0108474:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c010847a:	50                   	push   %eax
c010847b:	e8 2f fe ff ff       	call   c01082af <vsprintf>
c0108480:	83 c4 10             	add    $0x10,%esp
c0108483:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108486:	83 ec 08             	sub    $0x8,%esp
c0108489:	ff 75 f0             	pushl  -0x10(%ebp)
c010848c:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108492:	50                   	push   %eax
c0108493:	e8 58 90 ff ff       	call   c01014f0 <write_debug>
c0108498:	83 c4 10             	add    $0x10,%esp
c010849b:	90                   	nop
c010849c:	c9                   	leave  
c010849d:	c3                   	ret    

c010849e <sys_printx>:
c010849e:	55                   	push   %ebp
c010849f:	89 e5                	mov    %esp,%ebp
c01084a1:	83 ec 28             	sub    $0x28,%esp
c01084a4:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c01084a9:	85 c0                	test   %eax,%eax
c01084ab:	75 15                	jne    c01084c2 <sys_printx+0x24>
c01084ad:	8b 45 10             	mov    0x10(%ebp),%eax
c01084b0:	8b 80 80 02 00 00    	mov    0x280(%eax),%eax
c01084b6:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01084b9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01084c0:	eb 10                	jmp    c01084d2 <sys_printx+0x34>
c01084c2:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c01084c7:	85 c0                	test   %eax,%eax
c01084c9:	74 07                	je     c01084d2 <sys_printx+0x34>
c01084cb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01084d2:	8b 55 08             	mov    0x8(%ebp),%edx
c01084d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01084d8:	01 d0                	add    %edx,%eax
c01084da:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01084dd:	8b 45 10             	mov    0x10(%ebp),%eax
c01084e0:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c01084e6:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c01084ec:	05 00 fe 10 c0       	add    $0xc010fe00,%eax
c01084f1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01084f4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01084f7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01084fa:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01084fd:	0f b6 00             	movzbl (%eax),%eax
c0108500:	88 45 e3             	mov    %al,-0x1d(%ebp)
c0108503:	eb 3a                	jmp    c010853f <sys_printx+0xa1>
c0108505:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108508:	0f b6 00             	movzbl (%eax),%eax
c010850b:	3c 3b                	cmp    $0x3b,%al
c010850d:	74 0a                	je     c0108519 <sys_printx+0x7b>
c010850f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108512:	0f b6 00             	movzbl (%eax),%eax
c0108515:	3c 3a                	cmp    $0x3a,%al
c0108517:	75 06                	jne    c010851f <sys_printx+0x81>
c0108519:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c010851d:	eb 20                	jmp    c010853f <sys_printx+0xa1>
c010851f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108522:	0f b6 00             	movzbl (%eax),%eax
c0108525:	0f b6 c0             	movzbl %al,%eax
c0108528:	83 ec 08             	sub    $0x8,%esp
c010852b:	50                   	push   %eax
c010852c:	ff 75 e4             	pushl  -0x1c(%ebp)
c010852f:	e8 59 b8 ff ff       	call   c0103d8d <out_char>
c0108534:	83 c4 10             	add    $0x10,%esp
c0108537:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c010853b:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c010853f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0108543:	7f c0                	jg     c0108505 <sys_printx+0x67>
c0108545:	80 7d e3 3b          	cmpb   $0x3b,-0x1d(%ebp)
c0108549:	75 10                	jne    c010855b <sys_printx+0xbd>
c010854b:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c0108550:	85 c0                	test   %eax,%eax
c0108552:	74 13                	je     c0108567 <sys_printx+0xc9>
c0108554:	e8 6e 7d ff ff       	call   c01002c7 <disable_int>
c0108559:	eb 0c                	jmp    c0108567 <sys_printx+0xc9>
c010855b:	80 7d e3 3a          	cmpb   $0x3a,-0x1d(%ebp)
c010855f:	75 06                	jne    c0108567 <sys_printx+0xc9>
c0108561:	e8 61 7d ff ff       	call   c01002c7 <disable_int>
c0108566:	90                   	nop
c0108567:	90                   	nop
c0108568:	c9                   	leave  
c0108569:	c3                   	ret    

c010856a <spin>:
c010856a:	55                   	push   %ebp
c010856b:	89 e5                	mov    %esp,%ebp
c010856d:	83 ec 08             	sub    $0x8,%esp
c0108570:	83 ec 0c             	sub    $0xc,%esp
c0108573:	ff 75 08             	pushl  0x8(%ebp)
c0108576:	e8 11 7b ff ff       	call   c010008c <disp_str>
c010857b:	83 c4 10             	add    $0x10,%esp
c010857e:	83 ec 0c             	sub    $0xc,%esp
c0108581:	68 d3 a8 10 c0       	push   $0xc010a8d3
c0108586:	e8 01 7b ff ff       	call   c010008c <disp_str>
c010858b:	83 c4 10             	add    $0x10,%esp
c010858e:	eb fe                	jmp    c010858e <spin+0x24>

c0108590 <panic>:
c0108590:	55                   	push   %ebp
c0108591:	89 e5                	mov    %esp,%ebp
c0108593:	83 ec 08             	sub    $0x8,%esp
c0108596:	83 ec 04             	sub    $0x4,%esp
c0108599:	ff 75 08             	pushl  0x8(%ebp)
c010859c:	6a 3a                	push   $0x3a
c010859e:	68 cd ad 10 c0       	push   $0xc010adcd
c01085a3:	e8 b3 fe ff ff       	call   c010845b <printx>
c01085a8:	83 c4 10             	add    $0x10,%esp
c01085ab:	90                   	nop
c01085ac:	c9                   	leave  
c01085ad:	c3                   	ret    

c01085ae <assertion_failure>:
c01085ae:	55                   	push   %ebp
c01085af:	89 e5                	mov    %esp,%ebp
c01085b1:	83 ec 08             	sub    $0x8,%esp
c01085b4:	83 ec 08             	sub    $0x8,%esp
c01085b7:	ff 75 14             	pushl  0x14(%ebp)
c01085ba:	ff 75 10             	pushl  0x10(%ebp)
c01085bd:	ff 75 0c             	pushl  0xc(%ebp)
c01085c0:	ff 75 08             	pushl  0x8(%ebp)
c01085c3:	6a 3b                	push   $0x3b
c01085c5:	68 d4 ad 10 c0       	push   $0xc010add4
c01085ca:	e8 8c fe ff ff       	call   c010845b <printx>
c01085cf:	83 c4 20             	add    $0x20,%esp
c01085d2:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c01085d9:	00 00 00 
c01085dc:	83 ec 0c             	sub    $0xc,%esp
c01085df:	68 c0 a7 10 c0       	push   $0xc010a7c0
c01085e4:	e8 a3 7a ff ff       	call   c010008c <disp_str>
c01085e9:	83 c4 10             	add    $0x10,%esp
c01085ec:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c01085f1:	83 ec 0c             	sub    $0xc,%esp
c01085f4:	50                   	push   %eax
c01085f5:	e8 9d e9 ff ff       	call   c0106f97 <disp_int>
c01085fa:	83 c4 10             	add    $0x10,%esp
c01085fd:	83 ec 0c             	sub    $0xc,%esp
c0108600:	68 c2 a7 10 c0       	push   $0xc010a7c2
c0108605:	e8 82 7a ff ff       	call   c010008c <disp_str>
c010860a:	83 c4 10             	add    $0x10,%esp
c010860d:	83 ec 0c             	sub    $0xc,%esp
c0108610:	68 07 ae 10 c0       	push   $0xc010ae07
c0108615:	e8 50 ff ff ff       	call   c010856a <spin>
c010861a:	83 c4 10             	add    $0x10,%esp
c010861d:	90                   	nop
c010861e:	c9                   	leave  
c010861f:	c3                   	ret    

c0108620 <assertion_failure2>:
c0108620:	55                   	push   %ebp
c0108621:	89 e5                	mov    %esp,%ebp
c0108623:	83 ec 08             	sub    $0x8,%esp
c0108626:	83 ec 04             	sub    $0x4,%esp
c0108629:	ff 75 18             	pushl  0x18(%ebp)
c010862c:	ff 75 14             	pushl  0x14(%ebp)
c010862f:	ff 75 10             	pushl  0x10(%ebp)
c0108632:	ff 75 0c             	pushl  0xc(%ebp)
c0108635:	ff 75 08             	pushl  0x8(%ebp)
c0108638:	6a 3b                	push   $0x3b
c010863a:	68 14 ae 10 c0       	push   $0xc010ae14
c010863f:	e8 17 fe ff ff       	call   c010845b <printx>
c0108644:	83 c4 20             	add    $0x20,%esp
c0108647:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c010864e:	00 00 00 
c0108651:	83 ec 0c             	sub    $0xc,%esp
c0108654:	68 c0 a7 10 c0       	push   $0xc010a7c0
c0108659:	e8 2e 7a ff ff       	call   c010008c <disp_str>
c010865e:	83 c4 10             	add    $0x10,%esp
c0108661:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0108666:	83 ec 0c             	sub    $0xc,%esp
c0108669:	50                   	push   %eax
c010866a:	e8 28 e9 ff ff       	call   c0106f97 <disp_int>
c010866f:	83 c4 10             	add    $0x10,%esp
c0108672:	83 ec 0c             	sub    $0xc,%esp
c0108675:	68 c2 a7 10 c0       	push   $0xc010a7c2
c010867a:	e8 0d 7a ff ff       	call   c010008c <disp_str>
c010867f:	83 c4 10             	add    $0x10,%esp
c0108682:	83 ec 0c             	sub    $0xc,%esp
c0108685:	68 07 ae 10 c0       	push   $0xc010ae07
c010868a:	e8 db fe ff ff       	call   c010856a <spin>
c010868f:	83 c4 10             	add    $0x10,%esp
c0108692:	90                   	nop
c0108693:	c9                   	leave  
c0108694:	c3                   	ret    

c0108695 <dead_lock>:
c0108695:	55                   	push   %ebp
c0108696:	89 e5                	mov    %esp,%ebp
c0108698:	b8 00 00 00 00       	mov    $0x0,%eax
c010869d:	5d                   	pop    %ebp
c010869e:	c3                   	ret    

c010869f <sys_send_msg>:
c010869f:	55                   	push   %ebp
c01086a0:	89 e5                	mov    %esp,%ebp
c01086a2:	83 ec 58             	sub    $0x58,%esp
c01086a5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01086ac:	83 ec 0c             	sub    $0xc,%esp
c01086af:	ff 75 0c             	pushl  0xc(%ebp)
c01086b2:	e8 4f b0 ff ff       	call   c0103706 <pid2proc>
c01086b7:	83 c4 10             	add    $0x10,%esp
c01086ba:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01086bd:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c01086c1:	74 2c                	je     c01086ef <sys_send_msg+0x50>
c01086c3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01086c6:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c01086cc:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c01086d1:	74 1c                	je     c01086ef <sys_send_msg+0x50>
c01086d3:	68 25 05 00 00       	push   $0x525
c01086d8:	68 14 ad 10 c0       	push   $0xc010ad14
c01086dd:	68 14 ad 10 c0       	push   $0xc010ad14
c01086e2:	68 54 ae 10 c0       	push   $0xc010ae54
c01086e7:	e8 c2 fe ff ff       	call   c01085ae <assertion_failure>
c01086ec:	83 c4 10             	add    $0x10,%esp
c01086ef:	8b 45 10             	mov    0x10(%ebp),%eax
c01086f2:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c01086f8:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c01086fd:	74 1c                	je     c010871b <sys_send_msg+0x7c>
c01086ff:	68 27 05 00 00       	push   $0x527
c0108704:	68 14 ad 10 c0       	push   $0xc010ad14
c0108709:	68 14 ad 10 c0       	push   $0xc010ad14
c010870e:	68 7c ae 10 c0       	push   $0xc010ae7c
c0108713:	e8 96 fe ff ff       	call   c01085ae <assertion_failure>
c0108718:	83 c4 10             	add    $0x10,%esp
c010871b:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c010871f:	75 22                	jne    c0108743 <sys_send_msg+0xa4>
c0108721:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0108725:	75 1c                	jne    c0108743 <sys_send_msg+0xa4>
c0108727:	68 2a 05 00 00       	push   $0x52a
c010872c:	68 14 ad 10 c0       	push   $0xc010ad14
c0108731:	68 14 ad 10 c0       	push   $0xc010ad14
c0108736:	68 9f ae 10 c0       	push   $0xc010ae9f
c010873b:	e8 6e fe ff ff       	call   c01085ae <assertion_failure>
c0108740:	83 c4 10             	add    $0x10,%esp
c0108743:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108746:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010874d:	84 c0                	test   %al,%al
c010874f:	74 65                	je     c01087b6 <sys_send_msg+0x117>
c0108751:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108754:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010875b:	3c 01                	cmp    $0x1,%al
c010875d:	74 57                	je     c01087b6 <sys_send_msg+0x117>
c010875f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108762:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108769:	3c 02                	cmp    $0x2,%al
c010876b:	74 49                	je     c01087b6 <sys_send_msg+0x117>
c010876d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108770:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108777:	3c 03                	cmp    $0x3,%al
c0108779:	74 3b                	je     c01087b6 <sys_send_msg+0x117>
c010877b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010877e:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108785:	3c 04                	cmp    $0x4,%al
c0108787:	74 2d                	je     c01087b6 <sys_send_msg+0x117>
c0108789:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010878c:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108793:	0f be c0             	movsbl %al,%eax
c0108796:	83 ec 0c             	sub    $0xc,%esp
c0108799:	68 2e 05 00 00       	push   $0x52e
c010879e:	68 14 ad 10 c0       	push   $0xc010ad14
c01087a3:	68 14 ad 10 c0       	push   $0xc010ad14
c01087a8:	50                   	push   %eax
c01087a9:	68 b0 ae 10 c0       	push   $0xc010aeb0
c01087ae:	e8 6d fe ff ff       	call   c0108620 <assertion_failure2>
c01087b3:	83 c4 20             	add    $0x20,%esp
c01087b6:	8b 45 10             	mov    0x10(%ebp),%eax
c01087b9:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01087c0:	84 c0                	test   %al,%al
c01087c2:	74 65                	je     c0108829 <sys_send_msg+0x18a>
c01087c4:	8b 45 10             	mov    0x10(%ebp),%eax
c01087c7:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01087ce:	3c 01                	cmp    $0x1,%al
c01087d0:	74 57                	je     c0108829 <sys_send_msg+0x18a>
c01087d2:	8b 45 10             	mov    0x10(%ebp),%eax
c01087d5:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01087dc:	3c 02                	cmp    $0x2,%al
c01087de:	74 49                	je     c0108829 <sys_send_msg+0x18a>
c01087e0:	8b 45 10             	mov    0x10(%ebp),%eax
c01087e3:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01087ea:	3c 03                	cmp    $0x3,%al
c01087ec:	74 3b                	je     c0108829 <sys_send_msg+0x18a>
c01087ee:	8b 45 10             	mov    0x10(%ebp),%eax
c01087f1:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01087f8:	3c 04                	cmp    $0x4,%al
c01087fa:	74 2d                	je     c0108829 <sys_send_msg+0x18a>
c01087fc:	8b 45 10             	mov    0x10(%ebp),%eax
c01087ff:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108806:	0f be c0             	movsbl %al,%eax
c0108809:	83 ec 0c             	sub    $0xc,%esp
c010880c:	68 31 05 00 00       	push   $0x531
c0108811:	68 14 ad 10 c0       	push   $0xc010ad14
c0108816:	68 14 ad 10 c0       	push   $0xc010ad14
c010881b:	50                   	push   %eax
c010881c:	68 4c af 10 c0       	push   $0xc010af4c
c0108821:	e8 fa fd ff ff       	call   c0108620 <assertion_failure2>
c0108826:	83 c4 20             	add    $0x20,%esp
c0108829:	83 ec 0c             	sub    $0xc,%esp
c010882c:	ff 75 10             	pushl  0x10(%ebp)
c010882f:	e8 58 af ff ff       	call   c010378c <proc2pid>
c0108834:	83 c4 10             	add    $0x10,%esp
c0108837:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010883a:	c7 45 e0 7c 00 00 00 	movl   $0x7c,-0x20(%ebp)
c0108841:	8b 45 08             	mov    0x8(%ebp),%eax
c0108844:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0108847:	83 ec 08             	sub    $0x8,%esp
c010884a:	ff 75 e4             	pushl  -0x1c(%ebp)
c010884d:	ff 75 dc             	pushl  -0x24(%ebp)
c0108850:	e8 ba d5 ff ff       	call   c0105e0f <get_physical_address_proc>
c0108855:	83 c4 10             	add    $0x10,%esp
c0108858:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010885b:	83 ec 08             	sub    $0x8,%esp
c010885e:	ff 75 e0             	pushl  -0x20(%ebp)
c0108861:	ff 75 d8             	pushl  -0x28(%ebp)
c0108864:	e8 d3 d4 ff ff       	call   c0105d3c <alloc_virtual_memory>
c0108869:	83 c4 10             	add    $0x10,%esp
c010886c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010886f:	8b 45 10             	mov    0x10(%ebp),%eax
c0108872:	8b 80 80 02 00 00    	mov    0x280(%eax),%eax
c0108878:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010887b:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0108882:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0108885:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0108888:	8b 45 c8             	mov    -0x38(%ebp),%eax
c010888b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c010888e:	89 10                	mov    %edx,(%eax)
c0108890:	83 ec 08             	sub    $0x8,%esp
c0108893:	ff 75 0c             	pushl  0xc(%ebp)
c0108896:	ff 75 e4             	pushl  -0x1c(%ebp)
c0108899:	e8 f7 fd ff ff       	call   c0108695 <dead_lock>
c010889e:	83 c4 10             	add    $0x10,%esp
c01088a1:	83 f8 01             	cmp    $0x1,%eax
c01088a4:	75 10                	jne    c01088b6 <sys_send_msg+0x217>
c01088a6:	83 ec 0c             	sub    $0xc,%esp
c01088a9:	68 dc af 10 c0       	push   $0xc010afdc
c01088ae:	e8 dd fc ff ff       	call   c0108590 <panic>
c01088b3:	83 c4 10             	add    $0x10,%esp
c01088b6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01088b9:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01088c0:	3c 02                	cmp    $0x2,%al
c01088c2:	0f 85 ca 01 00 00    	jne    c0108a92 <sys_send_msg+0x3f3>
c01088c8:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01088cb:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c01088d1:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c01088d4:	74 12                	je     c01088e8 <sys_send_msg+0x249>
c01088d6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01088d9:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c01088df:	83 f8 12             	cmp    $0x12,%eax
c01088e2:	0f 85 aa 01 00 00    	jne    c0108a92 <sys_send_msg+0x3f3>
c01088e8:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01088eb:	8b 80 80 02 00 00    	mov    0x280(%eax),%eax
c01088f1:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c01088f4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01088f7:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c01088fd:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0108900:	83 ec 08             	sub    $0x8,%esp
c0108903:	ff 75 0c             	pushl  0xc(%ebp)
c0108906:	ff 75 c0             	pushl  -0x40(%ebp)
c0108909:	e8 01 d5 ff ff       	call   c0105e0f <get_physical_address_proc>
c010890e:	83 c4 10             	add    $0x10,%esp
c0108911:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0108914:	83 ec 08             	sub    $0x8,%esp
c0108917:	ff 75 e0             	pushl  -0x20(%ebp)
c010891a:	ff 75 bc             	pushl  -0x44(%ebp)
c010891d:	e8 1a d4 ff ff       	call   c0105d3c <alloc_virtual_memory>
c0108922:	83 c4 10             	add    $0x10,%esp
c0108925:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0108928:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c010892b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c010892e:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0108931:	83 ec 04             	sub    $0x4,%esp
c0108934:	51                   	push   %ecx
c0108935:	52                   	push   %edx
c0108936:	50                   	push   %eax
c0108937:	e8 6d e2 ff ff       	call   c0106ba9 <Memcpy>
c010893c:	83 c4 10             	add    $0x10,%esp
c010893f:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0108944:	3d 41 05 00 00       	cmp    $0x541,%eax
c0108949:	75 0a                	jne    c0108955 <sys_send_msg+0x2b6>
c010894b:	c7 05 a0 f7 10 c0 04 	movl   $0x4,0xc010f7a0
c0108952:	00 00 00 
c0108955:	8b 45 10             	mov    0x10(%ebp),%eax
c0108958:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c010895f:	00 00 00 
c0108962:	8b 45 10             	mov    0x10(%ebp),%eax
c0108965:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c010896c:	8b 45 10             	mov    0x10(%ebp),%eax
c010896f:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c0108976:	00 00 00 
c0108979:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010897c:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c0108983:	00 00 00 
c0108986:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108989:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0108990:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108993:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c010899a:	00 00 00 
c010899d:	8b 45 10             	mov    0x10(%ebp),%eax
c01089a0:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c01089a7:	00 00 00 
c01089aa:	83 ec 0c             	sub    $0xc,%esp
c01089ad:	ff 75 e8             	pushl  -0x18(%ebp)
c01089b0:	e8 a0 09 00 00       	call   c0109355 <unblock>
c01089b5:	83 c4 10             	add    $0x10,%esp
c01089b8:	8b 45 10             	mov    0x10(%ebp),%eax
c01089bb:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01089c2:	84 c0                	test   %al,%al
c01089c4:	74 1c                	je     c01089e2 <sys_send_msg+0x343>
c01089c6:	68 69 05 00 00       	push   $0x569
c01089cb:	68 14 ad 10 c0       	push   $0xc010ad14
c01089d0:	68 14 ad 10 c0       	push   $0xc010ad14
c01089d5:	68 e7 af 10 c0       	push   $0xc010afe7
c01089da:	e8 cf fb ff ff       	call   c01085ae <assertion_failure>
c01089df:	83 c4 10             	add    $0x10,%esp
c01089e2:	8b 45 10             	mov    0x10(%ebp),%eax
c01089e5:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c01089eb:	83 f8 21             	cmp    $0x21,%eax
c01089ee:	74 1c                	je     c0108a0c <sys_send_msg+0x36d>
c01089f0:	68 6a 05 00 00       	push   $0x56a
c01089f5:	68 14 ad 10 c0       	push   $0xc010ad14
c01089fa:	68 14 ad 10 c0       	push   $0xc010ad14
c01089ff:	68 fb af 10 c0       	push   $0xc010affb
c0108a04:	e8 a5 fb ff ff       	call   c01085ae <assertion_failure>
c0108a09:	83 c4 10             	add    $0x10,%esp
c0108a0c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108a0f:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0108a15:	85 c0                	test   %eax,%eax
c0108a17:	74 1c                	je     c0108a35 <sys_send_msg+0x396>
c0108a19:	68 6c 05 00 00       	push   $0x56c
c0108a1e:	68 14 ad 10 c0       	push   $0xc010ad14
c0108a23:	68 14 ad 10 c0       	push   $0xc010ad14
c0108a28:	68 18 b0 10 c0       	push   $0xc010b018
c0108a2d:	e8 7c fb ff ff       	call   c01085ae <assertion_failure>
c0108a32:	83 c4 10             	add    $0x10,%esp
c0108a35:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108a38:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108a3f:	84 c0                	test   %al,%al
c0108a41:	74 1c                	je     c0108a5f <sys_send_msg+0x3c0>
c0108a43:	68 6d 05 00 00       	push   $0x56d
c0108a48:	68 14 ad 10 c0       	push   $0xc010ad14
c0108a4d:	68 14 ad 10 c0       	push   $0xc010ad14
c0108a52:	68 2d b0 10 c0       	push   $0xc010b02d
c0108a57:	e8 52 fb ff ff       	call   c01085ae <assertion_failure>
c0108a5c:	83 c4 10             	add    $0x10,%esp
c0108a5f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108a62:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0108a68:	83 f8 21             	cmp    $0x21,%eax
c0108a6b:	0f 84 45 01 00 00    	je     c0108bb6 <sys_send_msg+0x517>
c0108a71:	68 6e 05 00 00       	push   $0x56e
c0108a76:	68 14 ad 10 c0       	push   $0xc010ad14
c0108a7b:	68 14 ad 10 c0       	push   $0xc010ad14
c0108a80:	68 44 b0 10 c0       	push   $0xc010b044
c0108a85:	e8 24 fb ff ff       	call   c01085ae <assertion_failure>
c0108a8a:	83 c4 10             	add    $0x10,%esp
c0108a8d:	e9 24 01 00 00       	jmp    c0108bb6 <sys_send_msg+0x517>
c0108a92:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108a99:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108a9c:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0108a9f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108aa2:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0108aa8:	85 c0                	test   %eax,%eax
c0108aaa:	75 1b                	jne    c0108ac7 <sys_send_msg+0x428>
c0108aac:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108aaf:	8b 55 10             	mov    0x10(%ebp),%edx
c0108ab2:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c0108ab8:	8b 45 10             	mov    0x10(%ebp),%eax
c0108abb:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c0108ac2:	00 00 00 
c0108ac5:	eb 3f                	jmp    c0108b06 <sys_send_msg+0x467>
c0108ac7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108aca:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0108ad0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108ad3:	eb 12                	jmp    c0108ae7 <sys_send_msg+0x448>
c0108ad5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108ad8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108adb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108ade:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0108ae4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108ae7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0108aeb:	75 e8                	jne    c0108ad5 <sys_send_msg+0x436>
c0108aed:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108af0:	8b 55 10             	mov    0x10(%ebp),%edx
c0108af3:	89 90 50 02 00 00    	mov    %edx,0x250(%eax)
c0108af9:	8b 45 10             	mov    0x10(%ebp),%eax
c0108afc:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c0108b03:	00 00 00 
c0108b06:	8b 45 10             	mov    0x10(%ebp),%eax
c0108b09:	8b 55 08             	mov    0x8(%ebp),%edx
c0108b0c:	89 90 40 02 00 00    	mov    %edx,0x240(%eax)
c0108b12:	8b 45 10             	mov    0x10(%ebp),%eax
c0108b15:	8b 55 0c             	mov    0xc(%ebp),%edx
c0108b18:	89 90 44 02 00 00    	mov    %edx,0x244(%eax)
c0108b1e:	8b 45 10             	mov    0x10(%ebp),%eax
c0108b21:	c6 80 3c 02 00 00 01 	movb   $0x1,0x23c(%eax)
c0108b28:	8b 45 10             	mov    0x10(%ebp),%eax
c0108b2b:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108b32:	3c 01                	cmp    $0x1,%al
c0108b34:	74 1c                	je     c0108b52 <sys_send_msg+0x4b3>
c0108b36:	68 90 05 00 00       	push   $0x590
c0108b3b:	68 14 ad 10 c0       	push   $0xc010ad14
c0108b40:	68 14 ad 10 c0       	push   $0xc010ad14
c0108b45:	68 68 b0 10 c0       	push   $0xc010b068
c0108b4a:	e8 5f fa ff ff       	call   c01085ae <assertion_failure>
c0108b4f:	83 c4 10             	add    $0x10,%esp
c0108b52:	8b 45 10             	mov    0x10(%ebp),%eax
c0108b55:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c0108b5b:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0108b5e:	74 1c                	je     c0108b7c <sys_send_msg+0x4dd>
c0108b60:	68 91 05 00 00       	push   $0x591
c0108b65:	68 14 ad 10 c0       	push   $0xc010ad14
c0108b6a:	68 14 ad 10 c0       	push   $0xc010ad14
c0108b6f:	68 84 b0 10 c0       	push   $0xc010b084
c0108b74:	e8 35 fa ff ff       	call   c01085ae <assertion_failure>
c0108b79:	83 c4 10             	add    $0x10,%esp
c0108b7c:	8b 45 10             	mov    0x10(%ebp),%eax
c0108b7f:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0108b85:	39 45 08             	cmp    %eax,0x8(%ebp)
c0108b88:	74 1c                	je     c0108ba6 <sys_send_msg+0x507>
c0108b8a:	68 92 05 00 00       	push   $0x592
c0108b8f:	68 14 ad 10 c0       	push   $0xc010ad14
c0108b94:	68 14 ad 10 c0       	push   $0xc010ad14
c0108b99:	68 a6 b0 10 c0       	push   $0xc010b0a6
c0108b9e:	e8 0b fa ff ff       	call   c01085ae <assertion_failure>
c0108ba3:	83 c4 10             	add    $0x10,%esp
c0108ba6:	83 ec 0c             	sub    $0xc,%esp
c0108ba9:	ff 75 10             	pushl  0x10(%ebp)
c0108bac:	e8 68 07 00 00       	call   c0109319 <block>
c0108bb1:	83 c4 10             	add    $0x10,%esp
c0108bb4:	eb 01                	jmp    c0108bb7 <sys_send_msg+0x518>
c0108bb6:	90                   	nop
c0108bb7:	b8 00 00 00 00       	mov    $0x0,%eax
c0108bbc:	c9                   	leave  
c0108bbd:	c3                   	ret    

c0108bbe <sys_receive_msg>:
c0108bbe:	55                   	push   %ebp
c0108bbf:	89 e5                	mov    %esp,%ebp
c0108bc1:	83 ec 58             	sub    $0x58,%esp
c0108bc4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108bcb:	83 ec 0c             	sub    $0xc,%esp
c0108bce:	ff 75 0c             	pushl  0xc(%ebp)
c0108bd1:	e8 30 ab ff ff       	call   c0103706 <pid2proc>
c0108bd6:	83 c4 10             	add    $0x10,%esp
c0108bd9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0108bdc:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0108be0:	74 2c                	je     c0108c0e <sys_receive_msg+0x50>
c0108be2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108be5:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c0108beb:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0108bf0:	74 1c                	je     c0108c0e <sys_receive_msg+0x50>
c0108bf2:	68 a6 05 00 00       	push   $0x5a6
c0108bf7:	68 14 ad 10 c0       	push   $0xc010ad14
c0108bfc:	68 14 ad 10 c0       	push   $0xc010ad14
c0108c01:	68 7c ae 10 c0       	push   $0xc010ae7c
c0108c06:	e8 a3 f9 ff ff       	call   c01085ae <assertion_failure>
c0108c0b:	83 c4 10             	add    $0x10,%esp
c0108c0e:	8b 45 10             	mov    0x10(%ebp),%eax
c0108c11:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c0108c17:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0108c1c:	74 1c                	je     c0108c3a <sys_receive_msg+0x7c>
c0108c1e:	68 a8 05 00 00       	push   $0x5a8
c0108c23:	68 14 ad 10 c0       	push   $0xc010ad14
c0108c28:	68 14 ad 10 c0       	push   $0xc010ad14
c0108c2d:	68 54 ae 10 c0       	push   $0xc010ae54
c0108c32:	e8 77 f9 ff ff       	call   c01085ae <assertion_failure>
c0108c37:	83 c4 10             	add    $0x10,%esp
c0108c3a:	8b 45 10             	mov    0x10(%ebp),%eax
c0108c3d:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108c44:	84 c0                	test   %al,%al
c0108c46:	74 65                	je     c0108cad <sys_receive_msg+0xef>
c0108c48:	8b 45 10             	mov    0x10(%ebp),%eax
c0108c4b:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108c52:	3c 01                	cmp    $0x1,%al
c0108c54:	74 57                	je     c0108cad <sys_receive_msg+0xef>
c0108c56:	8b 45 10             	mov    0x10(%ebp),%eax
c0108c59:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108c60:	3c 02                	cmp    $0x2,%al
c0108c62:	74 49                	je     c0108cad <sys_receive_msg+0xef>
c0108c64:	8b 45 10             	mov    0x10(%ebp),%eax
c0108c67:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108c6e:	3c 03                	cmp    $0x3,%al
c0108c70:	74 3b                	je     c0108cad <sys_receive_msg+0xef>
c0108c72:	8b 45 10             	mov    0x10(%ebp),%eax
c0108c75:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108c7c:	3c 04                	cmp    $0x4,%al
c0108c7e:	74 2d                	je     c0108cad <sys_receive_msg+0xef>
c0108c80:	8b 45 10             	mov    0x10(%ebp),%eax
c0108c83:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108c8a:	0f be c0             	movsbl %al,%eax
c0108c8d:	83 ec 0c             	sub    $0xc,%esp
c0108c90:	68 ab 05 00 00       	push   $0x5ab
c0108c95:	68 14 ad 10 c0       	push   $0xc010ad14
c0108c9a:	68 14 ad 10 c0       	push   $0xc010ad14
c0108c9f:	50                   	push   %eax
c0108ca0:	68 b0 ae 10 c0       	push   $0xc010aeb0
c0108ca5:	e8 76 f9 ff ff       	call   c0108620 <assertion_failure2>
c0108caa:	83 c4 20             	add    $0x20,%esp
c0108cad:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0108cb1:	74 73                	je     c0108d26 <sys_receive_msg+0x168>
c0108cb3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108cb6:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108cbd:	84 c0                	test   %al,%al
c0108cbf:	74 65                	je     c0108d26 <sys_receive_msg+0x168>
c0108cc1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108cc4:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108ccb:	3c 01                	cmp    $0x1,%al
c0108ccd:	74 57                	je     c0108d26 <sys_receive_msg+0x168>
c0108ccf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108cd2:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108cd9:	3c 02                	cmp    $0x2,%al
c0108cdb:	74 49                	je     c0108d26 <sys_receive_msg+0x168>
c0108cdd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108ce0:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108ce7:	3c 03                	cmp    $0x3,%al
c0108ce9:	74 3b                	je     c0108d26 <sys_receive_msg+0x168>
c0108ceb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108cee:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108cf5:	3c 04                	cmp    $0x4,%al
c0108cf7:	74 2d                	je     c0108d26 <sys_receive_msg+0x168>
c0108cf9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108cfc:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108d03:	0f be c0             	movsbl %al,%eax
c0108d06:	83 ec 0c             	sub    $0xc,%esp
c0108d09:	68 af 05 00 00       	push   $0x5af
c0108d0e:	68 14 ad 10 c0       	push   $0xc010ad14
c0108d13:	68 14 ad 10 c0       	push   $0xc010ad14
c0108d18:	50                   	push   %eax
c0108d19:	68 4c af 10 c0       	push   $0xc010af4c
c0108d1e:	e8 fd f8 ff ff       	call   c0108620 <assertion_failure2>
c0108d23:	83 c4 20             	add    $0x20,%esp
c0108d26:	83 ec 0c             	sub    $0xc,%esp
c0108d29:	ff 75 10             	pushl  0x10(%ebp)
c0108d2c:	e8 5b aa ff ff       	call   c010378c <proc2pid>
c0108d31:	83 c4 10             	add    $0x10,%esp
c0108d34:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0108d37:	c7 45 dc 7c 00 00 00 	movl   $0x7c,-0x24(%ebp)
c0108d3e:	8b 45 08             	mov    0x8(%ebp),%eax
c0108d41:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0108d44:	8b 45 10             	mov    0x10(%ebp),%eax
c0108d47:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c0108d4d:	83 ec 08             	sub    $0x8,%esp
c0108d50:	50                   	push   %eax
c0108d51:	ff 75 d8             	pushl  -0x28(%ebp)
c0108d54:	e8 b6 d0 ff ff       	call   c0105e0f <get_physical_address_proc>
c0108d59:	83 c4 10             	add    $0x10,%esp
c0108d5c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0108d5f:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0108d66:	8b 45 10             	mov    0x10(%ebp),%eax
c0108d69:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0108d6f:	85 c0                	test   %eax,%eax
c0108d71:	0f 84 c5 00 00 00    	je     c0108e3c <sys_receive_msg+0x27e>
c0108d77:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0108d7b:	74 0d                	je     c0108d8a <sys_receive_msg+0x1cc>
c0108d7d:	81 7d 0c 13 02 00 00 	cmpl   $0x213,0xc(%ebp)
c0108d84:	0f 85 b2 00 00 00    	jne    c0108e3c <sys_receive_msg+0x27e>
c0108d8a:	c7 45 d0 7c 00 00 00 	movl   $0x7c,-0x30(%ebp)
c0108d91:	83 ec 0c             	sub    $0xc,%esp
c0108d94:	ff 75 d0             	pushl  -0x30(%ebp)
c0108d97:	e8 90 87 ff ff       	call   c010152c <sys_malloc>
c0108d9c:	83 c4 10             	add    $0x10,%esp
c0108d9f:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0108da2:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0108da5:	83 ec 04             	sub    $0x4,%esp
c0108da8:	50                   	push   %eax
c0108da9:	6a 00                	push   $0x0
c0108dab:	ff 75 cc             	pushl  -0x34(%ebp)
c0108dae:	e8 78 24 00 00       	call   c010b22b <Memset>
c0108db3:	83 c4 10             	add    $0x10,%esp
c0108db6:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0108db9:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c0108dbf:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0108dc2:	c7 40 78 d5 07 00 00 	movl   $0x7d5,0x78(%eax)
c0108dc9:	83 ec 08             	sub    $0x8,%esp
c0108dcc:	ff 75 d0             	pushl  -0x30(%ebp)
c0108dcf:	ff 75 d4             	pushl  -0x2c(%ebp)
c0108dd2:	e8 65 cf ff ff       	call   c0105d3c <alloc_virtual_memory>
c0108dd7:	83 c4 10             	add    $0x10,%esp
c0108dda:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0108ddd:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0108de0:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0108de3:	83 ec 04             	sub    $0x4,%esp
c0108de6:	52                   	push   %edx
c0108de7:	ff 75 cc             	pushl  -0x34(%ebp)
c0108dea:	50                   	push   %eax
c0108deb:	e8 b9 dd ff ff       	call   c0106ba9 <Memcpy>
c0108df0:	83 c4 10             	add    $0x10,%esp
c0108df3:	8b 45 10             	mov    0x10(%ebp),%eax
c0108df6:	c7 80 54 02 00 00 00 	movl   $0x0,0x254(%eax)
c0108dfd:	00 00 00 
c0108e00:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e03:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c0108e0a:	00 00 00 
c0108e0d:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e10:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c0108e17:	00 00 00 
c0108e1a:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e1d:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0108e24:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c0108e2b:	83 ec 08             	sub    $0x8,%esp
c0108e2e:	ff 75 d0             	pushl  -0x30(%ebp)
c0108e31:	ff 75 cc             	pushl  -0x34(%ebp)
c0108e34:	e8 08 87 ff ff       	call   c0101541 <sys_free>
c0108e39:	83 c4 10             	add    $0x10,%esp
c0108e3c:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c0108e40:	0f 84 d4 03 00 00    	je     c010921a <sys_receive_msg+0x65c>
c0108e46:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0108e4a:	75 26                	jne    c0108e72 <sys_receive_msg+0x2b4>
c0108e4c:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e4f:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0108e55:	85 c0                	test   %eax,%eax
c0108e57:	0f 84 8a 00 00 00    	je     c0108ee7 <sys_receive_msg+0x329>
c0108e5d:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e60:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0108e66:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108e69:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0108e70:	eb 75                	jmp    c0108ee7 <sys_receive_msg+0x329>
c0108e72:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0108e76:	78 6f                	js     c0108ee7 <sys_receive_msg+0x329>
c0108e78:	83 7d 0c 07          	cmpl   $0x7,0xc(%ebp)
c0108e7c:	7f 69                	jg     c0108ee7 <sys_receive_msg+0x329>
c0108e7e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108e81:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108e88:	3c 01                	cmp    $0x1,%al
c0108e8a:	75 5b                	jne    c0108ee7 <sys_receive_msg+0x329>
c0108e8c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108e8f:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c0108e95:	83 f8 12             	cmp    $0x12,%eax
c0108e98:	74 0e                	je     c0108ea8 <sys_receive_msg+0x2ea>
c0108e9a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108e9d:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c0108ea3:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c0108ea6:	75 3f                	jne    c0108ee7 <sys_receive_msg+0x329>
c0108ea8:	8b 45 10             	mov    0x10(%ebp),%eax
c0108eab:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0108eb1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108eb4:	eb 2b                	jmp    c0108ee1 <sys_receive_msg+0x323>
c0108eb6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108eb9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108ebc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108ebf:	8b 90 14 01 00 00    	mov    0x114(%eax),%edx
c0108ec5:	8b 45 0c             	mov    0xc(%ebp),%eax
c0108ec8:	39 c2                	cmp    %eax,%edx
c0108eca:	75 09                	jne    c0108ed5 <sys_receive_msg+0x317>
c0108ecc:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0108ed3:	eb 12                	jmp    c0108ee7 <sys_receive_msg+0x329>
c0108ed5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108ed8:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0108ede:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108ee1:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0108ee5:	75 cf                	jne    c0108eb6 <sys_receive_msg+0x2f8>
c0108ee7:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0108eeb:	0f 85 4e 02 00 00    	jne    c010913f <sys_receive_msg+0x581>
c0108ef1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108ef4:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0108ef7:	83 ec 08             	sub    $0x8,%esp
c0108efa:	ff 75 dc             	pushl  -0x24(%ebp)
c0108efd:	ff 75 d4             	pushl  -0x2c(%ebp)
c0108f00:	e8 37 ce ff ff       	call   c0105d3c <alloc_virtual_memory>
c0108f05:	83 c4 10             	add    $0x10,%esp
c0108f08:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0108f0b:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0108f0e:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0108f14:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0108f17:	83 ec 0c             	sub    $0xc,%esp
c0108f1a:	ff 75 c4             	pushl  -0x3c(%ebp)
c0108f1d:	e8 6a a8 ff ff       	call   c010378c <proc2pid>
c0108f22:	83 c4 10             	add    $0x10,%esp
c0108f25:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0108f28:	83 ec 08             	sub    $0x8,%esp
c0108f2b:	ff 75 b8             	pushl  -0x48(%ebp)
c0108f2e:	ff 75 bc             	pushl  -0x44(%ebp)
c0108f31:	e8 d9 ce ff ff       	call   c0105e0f <get_physical_address_proc>
c0108f36:	83 c4 10             	add    $0x10,%esp
c0108f39:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0108f3c:	83 ec 08             	sub    $0x8,%esp
c0108f3f:	ff 75 dc             	pushl  -0x24(%ebp)
c0108f42:	ff 75 b4             	pushl  -0x4c(%ebp)
c0108f45:	e8 f2 cd ff ff       	call   c0105d3c <alloc_virtual_memory>
c0108f4a:	83 c4 10             	add    $0x10,%esp
c0108f4d:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0108f50:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0108f53:	83 ec 04             	sub    $0x4,%esp
c0108f56:	50                   	push   %eax
c0108f57:	ff 75 b0             	pushl  -0x50(%ebp)
c0108f5a:	ff 75 c0             	pushl  -0x40(%ebp)
c0108f5d:	e8 47 dc ff ff       	call   c0106ba9 <Memcpy>
c0108f62:	83 c4 10             	add    $0x10,%esp
c0108f65:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0108f68:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0108f6b:	8b 45 10             	mov    0x10(%ebp),%eax
c0108f6e:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0108f74:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0108f77:	75 21                	jne    c0108f9a <sys_receive_msg+0x3dc>
c0108f79:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108f7c:	8b 90 50 02 00 00    	mov    0x250(%eax),%edx
c0108f82:	8b 45 10             	mov    0x10(%ebp),%eax
c0108f85:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c0108f8b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108f8e:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c0108f95:	00 00 00 
c0108f98:	eb 1f                	jmp    c0108fb9 <sys_receive_msg+0x3fb>
c0108f9a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108f9d:	8b 90 50 02 00 00    	mov    0x250(%eax),%edx
c0108fa3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0108fa6:	89 90 50 02 00 00    	mov    %edx,0x250(%eax)
c0108fac:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108faf:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c0108fb6:	00 00 00 
c0108fb9:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0108fbc:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c0108fc3:	00 00 00 
c0108fc6:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0108fc9:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0108fd0:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0108fd3:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c0108fda:	00 00 00 
c0108fdd:	8b 45 10             	mov    0x10(%ebp),%eax
c0108fe0:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c0108fe7:	00 00 00 
c0108fea:	8b 45 10             	mov    0x10(%ebp),%eax
c0108fed:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c0108ff4:	00 00 00 
c0108ff7:	8b 45 10             	mov    0x10(%ebp),%eax
c0108ffa:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c0109001:	00 00 00 
c0109004:	83 ec 0c             	sub    $0xc,%esp
c0109007:	ff 75 c4             	pushl  -0x3c(%ebp)
c010900a:	e8 46 03 00 00       	call   c0109355 <unblock>
c010900f:	83 c4 10             	add    $0x10,%esp
c0109012:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0109015:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c010901b:	85 c0                	test   %eax,%eax
c010901d:	74 1c                	je     c010903b <sys_receive_msg+0x47d>
c010901f:	68 1f 06 00 00       	push   $0x61f
c0109024:	68 14 ad 10 c0       	push   $0xc010ad14
c0109029:	68 14 ad 10 c0       	push   $0xc010ad14
c010902e:	68 bb b0 10 c0       	push   $0xc010b0bb
c0109033:	e8 76 f5 ff ff       	call   c01085ae <assertion_failure>
c0109038:	83 c4 10             	add    $0x10,%esp
c010903b:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c010903e:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109045:	84 c0                	test   %al,%al
c0109047:	74 1c                	je     c0109065 <sys_receive_msg+0x4a7>
c0109049:	68 20 06 00 00       	push   $0x620
c010904e:	68 14 ad 10 c0       	push   $0xc010ad14
c0109053:	68 14 ad 10 c0       	push   $0xc010ad14
c0109058:	68 d3 b0 10 c0       	push   $0xc010b0d3
c010905d:	e8 4c f5 ff ff       	call   c01085ae <assertion_failure>
c0109062:	83 c4 10             	add    $0x10,%esp
c0109065:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0109068:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c010906e:	83 f8 21             	cmp    $0x21,%eax
c0109071:	74 1c                	je     c010908f <sys_receive_msg+0x4d1>
c0109073:	68 21 06 00 00       	push   $0x621
c0109078:	68 14 ad 10 c0       	push   $0xc010ad14
c010907d:	68 14 ad 10 c0       	push   $0xc010ad14
c0109082:	68 ec b0 10 c0       	push   $0xc010b0ec
c0109087:	e8 22 f5 ff ff       	call   c01085ae <assertion_failure>
c010908c:	83 c4 10             	add    $0x10,%esp
c010908f:	8b 45 10             	mov    0x10(%ebp),%eax
c0109092:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0109098:	85 c0                	test   %eax,%eax
c010909a:	74 1c                	je     c01090b8 <sys_receive_msg+0x4fa>
c010909c:	68 23 06 00 00       	push   $0x623
c01090a1:	68 14 ad 10 c0       	push   $0xc010ad14
c01090a6:	68 14 ad 10 c0       	push   $0xc010ad14
c01090ab:	68 18 b0 10 c0       	push   $0xc010b018
c01090b0:	e8 f9 f4 ff ff       	call   c01085ae <assertion_failure>
c01090b5:	83 c4 10             	add    $0x10,%esp
c01090b8:	8b 45 10             	mov    0x10(%ebp),%eax
c01090bb:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01090c2:	84 c0                	test   %al,%al
c01090c4:	74 1c                	je     c01090e2 <sys_receive_msg+0x524>
c01090c6:	68 24 06 00 00       	push   $0x624
c01090cb:	68 14 ad 10 c0       	push   $0xc010ad14
c01090d0:	68 14 ad 10 c0       	push   $0xc010ad14
c01090d5:	68 2d b0 10 c0       	push   $0xc010b02d
c01090da:	e8 cf f4 ff ff       	call   c01085ae <assertion_failure>
c01090df:	83 c4 10             	add    $0x10,%esp
c01090e2:	8b 45 10             	mov    0x10(%ebp),%eax
c01090e5:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c01090eb:	83 f8 21             	cmp    $0x21,%eax
c01090ee:	74 1c                	je     c010910c <sys_receive_msg+0x54e>
c01090f0:	68 25 06 00 00       	push   $0x625
c01090f5:	68 14 ad 10 c0       	push   $0xc010ad14
c01090fa:	68 14 ad 10 c0       	push   $0xc010ad14
c01090ff:	68 44 b0 10 c0       	push   $0xc010b044
c0109104:	e8 a5 f4 ff ff       	call   c01085ae <assertion_failure>
c0109109:	83 c4 10             	add    $0x10,%esp
c010910c:	8b 45 10             	mov    0x10(%ebp),%eax
c010910f:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c0109115:	83 f8 21             	cmp    $0x21,%eax
c0109118:	0f 84 f5 00 00 00    	je     c0109213 <sys_receive_msg+0x655>
c010911e:	68 26 06 00 00       	push   $0x626
c0109123:	68 14 ad 10 c0       	push   $0xc010ad14
c0109128:	68 14 ad 10 c0       	push   $0xc010ad14
c010912d:	68 10 b1 10 c0       	push   $0xc010b110
c0109132:	e8 77 f4 ff ff       	call   c01085ae <assertion_failure>
c0109137:	83 c4 10             	add    $0x10,%esp
c010913a:	e9 d4 00 00 00       	jmp    c0109213 <sys_receive_msg+0x655>
c010913f:	8b 45 10             	mov    0x10(%ebp),%eax
c0109142:	c6 80 3c 02 00 00 02 	movb   $0x2,0x23c(%eax)
c0109149:	8b 45 10             	mov    0x10(%ebp),%eax
c010914c:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109153:	3c 02                	cmp    $0x2,%al
c0109155:	74 1c                	je     c0109173 <sys_receive_msg+0x5b5>
c0109157:	68 2b 06 00 00       	push   $0x62b
c010915c:	68 14 ad 10 c0       	push   $0xc010ad14
c0109161:	68 14 ad 10 c0       	push   $0xc010ad14
c0109166:	68 2f b1 10 c0       	push   $0xc010b12f
c010916b:	e8 3e f4 ff ff       	call   c01085ae <assertion_failure>
c0109170:	83 c4 10             	add    $0x10,%esp
c0109173:	8b 45 10             	mov    0x10(%ebp),%eax
c0109176:	8b 55 08             	mov    0x8(%ebp),%edx
c0109179:	89 90 40 02 00 00    	mov    %edx,0x240(%eax)
c010917f:	8b 45 10             	mov    0x10(%ebp),%eax
c0109182:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109189:	3c 02                	cmp    $0x2,%al
c010918b:	74 1c                	je     c01091a9 <sys_receive_msg+0x5eb>
c010918d:	68 2d 06 00 00       	push   $0x62d
c0109192:	68 14 ad 10 c0       	push   $0xc010ad14
c0109197:	68 14 ad 10 c0       	push   $0xc010ad14
c010919c:	68 2f b1 10 c0       	push   $0xc010b12f
c01091a1:	e8 08 f4 ff ff       	call   c01085ae <assertion_failure>
c01091a6:	83 c4 10             	add    $0x10,%esp
c01091a9:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c01091ad:	75 0f                	jne    c01091be <sys_receive_msg+0x600>
c01091af:	8b 45 10             	mov    0x10(%ebp),%eax
c01091b2:	c7 80 48 02 00 00 12 	movl   $0x12,0x248(%eax)
c01091b9:	00 00 00 
c01091bc:	eb 0c                	jmp    c01091ca <sys_receive_msg+0x60c>
c01091be:	8b 45 10             	mov    0x10(%ebp),%eax
c01091c1:	8b 55 0c             	mov    0xc(%ebp),%edx
c01091c4:	89 90 48 02 00 00    	mov    %edx,0x248(%eax)
c01091ca:	8b 45 10             	mov    0x10(%ebp),%eax
c01091cd:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01091d4:	3c 02                	cmp    $0x2,%al
c01091d6:	74 2d                	je     c0109205 <sys_receive_msg+0x647>
c01091d8:	8b 45 10             	mov    0x10(%ebp),%eax
c01091db:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01091e2:	0f be c0             	movsbl %al,%eax
c01091e5:	83 ec 0c             	sub    $0xc,%esp
c01091e8:	68 38 06 00 00       	push   $0x638
c01091ed:	68 14 ad 10 c0       	push   $0xc010ad14
c01091f2:	68 14 ad 10 c0       	push   $0xc010ad14
c01091f7:	50                   	push   %eax
c01091f8:	68 2f b1 10 c0       	push   $0xc010b12f
c01091fd:	e8 1e f4 ff ff       	call   c0108620 <assertion_failure2>
c0109202:	83 c4 20             	add    $0x20,%esp
c0109205:	83 ec 0c             	sub    $0xc,%esp
c0109208:	ff 75 10             	pushl  0x10(%ebp)
c010920b:	e8 09 01 00 00       	call   c0109319 <block>
c0109210:	83 c4 10             	add    $0x10,%esp
c0109213:	b8 00 00 00 00       	mov    $0x0,%eax
c0109218:	eb 02                	jmp    c010921c <sys_receive_msg+0x65e>
c010921a:	90                   	nop
c010921b:	90                   	nop
c010921c:	c9                   	leave  
c010921d:	c3                   	ret    

c010921e <send_rec>:
c010921e:	55                   	push   %ebp
c010921f:	89 e5                	mov    %esp,%ebp
c0109221:	83 ec 18             	sub    $0x18,%esp
c0109224:	8b 45 0c             	mov    0xc(%ebp),%eax
c0109227:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010922a:	c7 45 f0 7c 00 00 00 	movl   $0x7c,-0x10(%ebp)
c0109231:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c0109235:	74 28                	je     c010925f <send_rec+0x41>
c0109237:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c010923b:	74 22                	je     c010925f <send_rec+0x41>
c010923d:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c0109241:	74 1c                	je     c010925f <send_rec+0x41>
c0109243:	68 4a 06 00 00       	push   $0x64a
c0109248:	68 14 ad 10 c0       	push   $0xc010ad14
c010924d:	68 14 ad 10 c0       	push   $0xc010ad14
c0109252:	68 50 b1 10 c0       	push   $0xc010b150
c0109257:	e8 52 f3 ff ff       	call   c01085ae <assertion_failure>
c010925c:	83 c4 10             	add    $0x10,%esp
c010925f:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0109263:	75 14                	jne    c0109279 <send_rec+0x5b>
c0109265:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109268:	83 ec 04             	sub    $0x4,%esp
c010926b:	50                   	push   %eax
c010926c:	6a 00                	push   $0x0
c010926e:	ff 75 0c             	pushl  0xc(%ebp)
c0109271:	e8 b5 1f 00 00       	call   c010b22b <Memset>
c0109276:	83 c4 10             	add    $0x10,%esp
c0109279:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c010927d:	74 23                	je     c01092a2 <send_rec+0x84>
c010927f:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c0109283:	74 34                	je     c01092b9 <send_rec+0x9b>
c0109285:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c0109289:	75 74                	jne    c01092ff <send_rec+0xe1>
c010928b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010928e:	83 ec 08             	sub    $0x8,%esp
c0109291:	ff 75 10             	pushl  0x10(%ebp)
c0109294:	50                   	push   %eax
c0109295:	e8 66 82 ff ff       	call   c0101500 <send_msg>
c010929a:	83 c4 10             	add    $0x10,%esp
c010929d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01092a0:	eb 70                	jmp    c0109312 <send_rec+0xf4>
c01092a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01092a5:	83 ec 08             	sub    $0x8,%esp
c01092a8:	ff 75 10             	pushl  0x10(%ebp)
c01092ab:	50                   	push   %eax
c01092ac:	e8 65 82 ff ff       	call   c0101516 <receive_msg>
c01092b1:	83 c4 10             	add    $0x10,%esp
c01092b4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01092b7:	eb 59                	jmp    c0109312 <send_rec+0xf4>
c01092b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01092bc:	83 ec 08             	sub    $0x8,%esp
c01092bf:	ff 75 10             	pushl  0x10(%ebp)
c01092c2:	50                   	push   %eax
c01092c3:	e8 38 82 ff ff       	call   c0101500 <send_msg>
c01092c8:	83 c4 10             	add    $0x10,%esp
c01092cb:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01092ce:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c01092d2:	75 3d                	jne    c0109311 <send_rec+0xf3>
c01092d4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01092d7:	83 ec 04             	sub    $0x4,%esp
c01092da:	50                   	push   %eax
c01092db:	6a 00                	push   $0x0
c01092dd:	ff 75 0c             	pushl  0xc(%ebp)
c01092e0:	e8 46 1f 00 00       	call   c010b22b <Memset>
c01092e5:	83 c4 10             	add    $0x10,%esp
c01092e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01092eb:	83 ec 08             	sub    $0x8,%esp
c01092ee:	ff 75 10             	pushl  0x10(%ebp)
c01092f1:	50                   	push   %eax
c01092f2:	e8 1f 82 ff ff       	call   c0101516 <receive_msg>
c01092f7:	83 c4 10             	add    $0x10,%esp
c01092fa:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01092fd:	eb 12                	jmp    c0109311 <send_rec+0xf3>
c01092ff:	83 ec 0c             	sub    $0xc,%esp
c0109302:	68 8c b1 10 c0       	push   $0xc010b18c
c0109307:	e8 84 f2 ff ff       	call   c0108590 <panic>
c010930c:	83 c4 10             	add    $0x10,%esp
c010930f:	eb 01                	jmp    c0109312 <send_rec+0xf4>
c0109311:	90                   	nop
c0109312:	b8 00 00 00 00       	mov    $0x0,%eax
c0109317:	c9                   	leave  
c0109318:	c3                   	ret    

c0109319 <block>:
c0109319:	55                   	push   %ebp
c010931a:	89 e5                	mov    %esp,%ebp
c010931c:	83 ec 08             	sub    $0x8,%esp
c010931f:	8b 45 08             	mov    0x8(%ebp),%eax
c0109322:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109329:	84 c0                	test   %al,%al
c010932b:	75 1c                	jne    c0109349 <block+0x30>
c010932d:	68 79 06 00 00       	push   $0x679
c0109332:	68 14 ad 10 c0       	push   $0xc010ad14
c0109337:	68 14 ad 10 c0       	push   $0xc010ad14
c010933c:	68 a1 b1 10 c0       	push   $0xc010b1a1
c0109341:	e8 68 f2 ff ff       	call   c01085ae <assertion_failure>
c0109346:	83 c4 10             	add    $0x10,%esp
c0109349:	e8 3a a2 ff ff       	call   c0103588 <schedule_process>
c010934e:	b8 00 00 00 00       	mov    $0x0,%eax
c0109353:	c9                   	leave  
c0109354:	c3                   	ret    

c0109355 <unblock>:
c0109355:	55                   	push   %ebp
c0109356:	89 e5                	mov    %esp,%ebp
c0109358:	83 ec 08             	sub    $0x8,%esp
c010935b:	8b 45 08             	mov    0x8(%ebp),%eax
c010935e:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109365:	84 c0                	test   %al,%al
c0109367:	74 1c                	je     c0109385 <unblock+0x30>
c0109369:	68 82 06 00 00       	push   $0x682
c010936e:	68 14 ad 10 c0       	push   $0xc010ad14
c0109373:	68 14 ad 10 c0       	push   $0xc010ad14
c0109378:	68 b9 b1 10 c0       	push   $0xc010b1b9
c010937d:	e8 2c f2 ff ff       	call   c01085ae <assertion_failure>
c0109382:	83 c4 10             	add    $0x10,%esp
c0109385:	8b 45 08             	mov    0x8(%ebp),%eax
c0109388:	05 60 02 00 00       	add    $0x260,%eax
c010938d:	83 ec 08             	sub    $0x8,%esp
c0109390:	50                   	push   %eax
c0109391:	68 ec fd 10 c0       	push   $0xc010fdec
c0109396:	e8 d5 0a 00 00       	call   c0109e70 <appendToDoubleLinkList>
c010939b:	83 c4 10             	add    $0x10,%esp
c010939e:	b8 00 00 00 00       	mov    $0x0,%eax
c01093a3:	c9                   	leave  
c01093a4:	c3                   	ret    

c01093a5 <get_ticks_ipc>:
c01093a5:	55                   	push   %ebp
c01093a6:	89 e5                	mov    %esp,%ebp
c01093a8:	81 ec 98 00 00 00    	sub    $0x98,%esp
c01093ae:	83 ec 04             	sub    $0x4,%esp
c01093b1:	6a 7c                	push   $0x7c
c01093b3:	6a 00                	push   $0x0
c01093b5:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01093bb:	50                   	push   %eax
c01093bc:	e8 6a 1e 00 00       	call   c010b22b <Memset>
c01093c1:	83 c4 10             	add    $0x10,%esp
c01093c4:	c7 85 78 ff ff ff 01 	movl   $0x1,-0x88(%ebp)
c01093cb:	00 00 00 
c01093ce:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c01093d5:	83 ec 04             	sub    $0x4,%esp
c01093d8:	6a 01                	push   $0x1
c01093da:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01093e0:	50                   	push   %eax
c01093e1:	6a 03                	push   $0x3
c01093e3:	e8 36 fe ff ff       	call   c010921e <send_rec>
c01093e8:	83 c4 10             	add    $0x10,%esp
c01093eb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01093ee:	8b 85 7c ff ff ff    	mov    -0x84(%ebp),%eax
c01093f4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01093f7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01093fa:	c9                   	leave  
c01093fb:	c3                   	ret    

c01093fc <itoa>:
c01093fc:	55                   	push   %ebp
c01093fd:	89 e5                	mov    %esp,%ebp
c01093ff:	53                   	push   %ebx
c0109400:	83 ec 14             	sub    $0x14,%esp
c0109403:	8b 45 08             	mov    0x8(%ebp),%eax
c0109406:	99                   	cltd   
c0109407:	f7 7d 10             	idivl  0x10(%ebp)
c010940a:	89 55 f4             	mov    %edx,-0xc(%ebp)
c010940d:	8b 45 08             	mov    0x8(%ebp),%eax
c0109410:	99                   	cltd   
c0109411:	f7 7d 10             	idivl  0x10(%ebp)
c0109414:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109417:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010941b:	74 14                	je     c0109431 <itoa+0x35>
c010941d:	83 ec 04             	sub    $0x4,%esp
c0109420:	ff 75 10             	pushl  0x10(%ebp)
c0109423:	ff 75 0c             	pushl  0xc(%ebp)
c0109426:	ff 75 f0             	pushl  -0x10(%ebp)
c0109429:	e8 ce ff ff ff       	call   c01093fc <itoa>
c010942e:	83 c4 10             	add    $0x10,%esp
c0109431:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109434:	8d 58 30             	lea    0x30(%eax),%ebx
c0109437:	8b 45 0c             	mov    0xc(%ebp),%eax
c010943a:	8b 00                	mov    (%eax),%eax
c010943c:	8d 48 01             	lea    0x1(%eax),%ecx
c010943f:	8b 55 0c             	mov    0xc(%ebp),%edx
c0109442:	89 0a                	mov    %ecx,(%edx)
c0109444:	89 da                	mov    %ebx,%edx
c0109446:	88 10                	mov    %dl,(%eax)
c0109448:	8b 45 0c             	mov    0xc(%ebp),%eax
c010944b:	8b 00                	mov    (%eax),%eax
c010944d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0109450:	c9                   	leave  
c0109451:	c3                   	ret    

c0109452 <i2a>:
c0109452:	55                   	push   %ebp
c0109453:	89 e5                	mov    %esp,%ebp
c0109455:	53                   	push   %ebx
c0109456:	83 ec 14             	sub    $0x14,%esp
c0109459:	8b 45 08             	mov    0x8(%ebp),%eax
c010945c:	99                   	cltd   
c010945d:	f7 7d 0c             	idivl  0xc(%ebp)
c0109460:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0109463:	8b 45 08             	mov    0x8(%ebp),%eax
c0109466:	99                   	cltd   
c0109467:	f7 7d 0c             	idivl  0xc(%ebp)
c010946a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010946d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0109471:	74 14                	je     c0109487 <i2a+0x35>
c0109473:	83 ec 04             	sub    $0x4,%esp
c0109476:	ff 75 10             	pushl  0x10(%ebp)
c0109479:	ff 75 0c             	pushl  0xc(%ebp)
c010947c:	ff 75 f0             	pushl  -0x10(%ebp)
c010947f:	e8 ce ff ff ff       	call   c0109452 <i2a>
c0109484:	83 c4 10             	add    $0x10,%esp
c0109487:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c010948b:	7f 0a                	jg     c0109497 <i2a+0x45>
c010948d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109490:	83 c0 30             	add    $0x30,%eax
c0109493:	89 c3                	mov    %eax,%ebx
c0109495:	eb 08                	jmp    c010949f <i2a+0x4d>
c0109497:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010949a:	83 c0 37             	add    $0x37,%eax
c010949d:	89 c3                	mov    %eax,%ebx
c010949f:	8b 45 10             	mov    0x10(%ebp),%eax
c01094a2:	8b 00                	mov    (%eax),%eax
c01094a4:	8d 48 01             	lea    0x1(%eax),%ecx
c01094a7:	8b 55 10             	mov    0x10(%ebp),%edx
c01094aa:	89 0a                	mov    %ecx,(%edx)
c01094ac:	88 18                	mov    %bl,(%eax)
c01094ae:	8b 45 10             	mov    0x10(%ebp),%eax
c01094b1:	8b 00                	mov    (%eax),%eax
c01094b3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01094b6:	c9                   	leave  
c01094b7:	c3                   	ret    

c01094b8 <inform_int>:
c01094b8:	55                   	push   %ebp
c01094b9:	89 e5                	mov    %esp,%ebp
c01094bb:	83 ec 18             	sub    $0x18,%esp
c01094be:	83 ec 0c             	sub    $0xc,%esp
c01094c1:	ff 75 08             	pushl  0x8(%ebp)
c01094c4:	e8 3d a2 ff ff       	call   c0103706 <pid2proc>
c01094c9:	83 c4 10             	add    $0x10,%esp
c01094cc:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01094cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01094d2:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01094d9:	0f be c0             	movsbl %al,%eax
c01094dc:	83 e0 02             	and    $0x2,%eax
c01094df:	85 c0                	test   %eax,%eax
c01094e1:	0f 84 8e 00 00 00    	je     c0109575 <inform_int+0xbd>
c01094e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01094ea:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c01094f0:	3d 13 02 00 00       	cmp    $0x213,%eax
c01094f5:	74 0e                	je     c0109505 <inform_int+0x4d>
c01094f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01094fa:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0109500:	83 f8 12             	cmp    $0x12,%eax
c0109503:	75 7d                	jne    c0109582 <inform_int+0xca>
c0109505:	c7 45 f0 7c 00 00 00 	movl   $0x7c,-0x10(%ebp)
c010950c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010950f:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0109515:	83 ec 08             	sub    $0x8,%esp
c0109518:	ff 75 f0             	pushl  -0x10(%ebp)
c010951b:	50                   	push   %eax
c010951c:	e8 1b c8 ff ff       	call   c0105d3c <alloc_virtual_memory>
c0109521:	83 c4 10             	add    $0x10,%esp
c0109524:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109527:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010952a:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c0109530:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109533:	c7 40 78 d5 07 00 00 	movl   $0x7d5,0x78(%eax)
c010953a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010953d:	c7 80 54 02 00 00 00 	movl   $0x0,0x254(%eax)
c0109544:	00 00 00 
c0109547:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010954a:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c0109551:	00 00 00 
c0109554:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c010955b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010955e:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0109565:	83 ec 0c             	sub    $0xc,%esp
c0109568:	ff 75 f4             	pushl  -0xc(%ebp)
c010956b:	e8 e5 fd ff ff       	call   c0109355 <unblock>
c0109570:	83 c4 10             	add    $0x10,%esp
c0109573:	eb 0d                	jmp    c0109582 <inform_int+0xca>
c0109575:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109578:	c7 80 54 02 00 00 01 	movl   $0x1,0x254(%eax)
c010957f:	00 00 00 
c0109582:	90                   	nop
c0109583:	c9                   	leave  
c0109584:	c3                   	ret    

c0109585 <strcmp>:
c0109585:	55                   	push   %ebp
c0109586:	89 e5                	mov    %esp,%ebp
c0109588:	83 ec 10             	sub    $0x10,%esp
c010958b:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c010958f:	74 06                	je     c0109597 <strcmp+0x12>
c0109591:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0109595:	75 08                	jne    c010959f <strcmp+0x1a>
c0109597:	8b 45 08             	mov    0x8(%ebp),%eax
c010959a:	2b 45 0c             	sub    0xc(%ebp),%eax
c010959d:	eb 53                	jmp    c01095f2 <strcmp+0x6d>
c010959f:	8b 45 08             	mov    0x8(%ebp),%eax
c01095a2:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01095a5:	8b 45 0c             	mov    0xc(%ebp),%eax
c01095a8:	89 45 f8             	mov    %eax,-0x8(%ebp)
c01095ab:	eb 18                	jmp    c01095c5 <strcmp+0x40>
c01095ad:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01095b0:	0f b6 10             	movzbl (%eax),%edx
c01095b3:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01095b6:	0f b6 00             	movzbl (%eax),%eax
c01095b9:	38 c2                	cmp    %al,%dl
c01095bb:	75 1e                	jne    c01095db <strcmp+0x56>
c01095bd:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c01095c1:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c01095c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01095c8:	0f b6 00             	movzbl (%eax),%eax
c01095cb:	84 c0                	test   %al,%al
c01095cd:	74 0d                	je     c01095dc <strcmp+0x57>
c01095cf:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01095d2:	0f b6 00             	movzbl (%eax),%eax
c01095d5:	84 c0                	test   %al,%al
c01095d7:	75 d4                	jne    c01095ad <strcmp+0x28>
c01095d9:	eb 01                	jmp    c01095dc <strcmp+0x57>
c01095db:	90                   	nop
c01095dc:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01095df:	0f b6 00             	movzbl (%eax),%eax
c01095e2:	0f be d0             	movsbl %al,%edx
c01095e5:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01095e8:	0f b6 00             	movzbl (%eax),%eax
c01095eb:	0f be c0             	movsbl %al,%eax
c01095ee:	29 c2                	sub    %eax,%edx
c01095f0:	89 d0                	mov    %edx,%eax
c01095f2:	c9                   	leave  
c01095f3:	c3                   	ret    

c01095f4 <create_user_process_address_space>:
c01095f4:	55                   	push   %ebp
c01095f5:	89 e5                	mov    %esp,%ebp
c01095f7:	83 ec 18             	sub    $0x18,%esp
c01095fa:	83 ec 08             	sub    $0x8,%esp
c01095fd:	6a 00                	push   $0x0
c01095ff:	6a 01                	push   $0x1
c0109601:	e8 6e ca ff ff       	call   c0106074 <alloc_memory>
c0109606:	83 c4 10             	add    $0x10,%esp
c0109609:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010960c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010960f:	c7 40 08 00 80 04 08 	movl   $0x8048000,0x8(%eax)
c0109616:	c7 45 f0 00 80 fb b7 	movl   $0xb7fb8000,-0x10(%ebp)
c010961d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109620:	05 ff 0f 00 00       	add    $0xfff,%eax
c0109625:	c1 e8 0c             	shr    $0xc,%eax
c0109628:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010962b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010962e:	83 c0 07             	add    $0x7,%eax
c0109631:	c1 e8 03             	shr    $0x3,%eax
c0109634:	89 c2                	mov    %eax,%edx
c0109636:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109639:	89 50 04             	mov    %edx,0x4(%eax)
c010963c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010963f:	8b 40 04             	mov    0x4(%eax),%eax
c0109642:	05 ff 0f 00 00       	add    $0xfff,%eax
c0109647:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c010964d:	85 c0                	test   %eax,%eax
c010964f:	0f 48 c2             	cmovs  %edx,%eax
c0109652:	c1 f8 0c             	sar    $0xc,%eax
c0109655:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0109658:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010965b:	83 ec 08             	sub    $0x8,%esp
c010965e:	6a 00                	push   $0x0
c0109660:	50                   	push   %eax
c0109661:	e8 0e ca ff ff       	call   c0106074 <alloc_memory>
c0109666:	83 c4 10             	add    $0x10,%esp
c0109669:	89 c2                	mov    %eax,%edx
c010966b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010966e:	89 10                	mov    %edx,(%eax)
c0109670:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109673:	83 ec 0c             	sub    $0xc,%esp
c0109676:	50                   	push   %eax
c0109677:	e8 ca c1 ff ff       	call   c0105846 <init_bitmap>
c010967c:	83 c4 10             	add    $0x10,%esp
c010967f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109682:	c9                   	leave  
c0109683:	c3                   	ret    

c0109684 <user_process>:
c0109684:	55                   	push   %ebp
c0109685:	89 e5                	mov    %esp,%ebp
c0109687:	83 ec 38             	sub    $0x38,%esp
c010968a:	c7 45 f0 b2 0c 00 00 	movl   $0xcb2,-0x10(%ebp)
c0109691:	c7 45 ec ba 0c 00 00 	movl   $0xcba,-0x14(%ebp)
c0109698:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%ebp)
c010969f:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c01096a3:	75 0e                	jne    c01096b3 <user_process+0x2f>
c01096a5:	66 c7 45 f6 48 00    	movw   $0x48,-0xa(%ebp)
c01096ab:	66 c7 45 f4 50 00    	movw   $0x50,-0xc(%ebp)
c01096b1:	eb 0c                	jmp    c01096bf <user_process+0x3b>
c01096b3:	66 c7 45 f6 59 00    	movw   $0x59,-0xa(%ebp)
c01096b9:	66 c7 45 f4 61 00    	movw   $0x61,-0xc(%ebp)
c01096bf:	e8 df 6c ff ff       	call   c01003a3 <get_running_thread_pcb>
c01096c4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01096c7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01096ca:	8b 55 14             	mov    0x14(%ebp),%edx
c01096cd:	89 90 18 01 00 00    	mov    %edx,0x118(%eax)
c01096d3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01096d6:	8b 90 18 01 00 00    	mov    0x118(%eax),%edx
c01096dc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01096df:	89 90 1c 01 00 00    	mov    %edx,0x11c(%eax)
c01096e5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01096e8:	05 00 10 00 00       	add    $0x1000,%eax
c01096ed:	89 c2                	mov    %eax,%edx
c01096ef:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01096f2:	89 10                	mov    %edx,(%eax)
c01096f4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01096f7:	8b 00                	mov    (%eax),%eax
c01096f9:	83 e8 44             	sub    $0x44,%eax
c01096fc:	89 c2                	mov    %eax,%edx
c01096fe:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109701:	89 10                	mov    %edx,(%eax)
c0109703:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109706:	8b 00                	mov    (%eax),%eax
c0109708:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010970b:	c6 45 df 00          	movb   $0x0,-0x21(%ebp)
c010970f:	66 c7 45 dc 02 12    	movw   $0x1202,-0x24(%ebp)
c0109715:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0109719:	66 89 45 da          	mov    %ax,-0x26(%ebp)
c010971d:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0109721:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
c0109725:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0109729:	66 89 45 d6          	mov    %ax,-0x2a(%ebp)
c010972d:	66 c7 45 d4 38 00    	movw   $0x38,-0x2c(%ebp)
c0109733:	0f b7 55 f4          	movzwl -0xc(%ebp),%edx
c0109737:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010973a:	89 50 34             	mov    %edx,0x34(%eax)
c010973d:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c0109741:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109744:	89 50 0c             	mov    %edx,0xc(%eax)
c0109747:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c010974b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010974e:	89 50 04             	mov    %edx,0x4(%eax)
c0109751:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c0109755:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109758:	89 50 08             	mov    %edx,0x8(%eax)
c010975b:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c010975f:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109762:	89 50 40             	mov    %edx,0x40(%eax)
c0109765:	0f b7 55 d4          	movzwl -0x2c(%ebp),%edx
c0109769:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010976c:	89 10                	mov    %edx,(%eax)
c010976e:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109771:	8b 55 08             	mov    0x8(%ebp),%edx
c0109774:	89 50 30             	mov    %edx,0x30(%eax)
c0109777:	0f b7 55 dc          	movzwl -0x24(%ebp),%edx
c010977b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010977e:	89 50 38             	mov    %edx,0x38(%eax)
c0109781:	83 ec 08             	sub    $0x8,%esp
c0109784:	6a 01                	push   $0x1
c0109786:	68 00 f0 ff bf       	push   $0xbffff000
c010978b:	e8 1c c8 ff ff       	call   c0105fac <alloc_physical_memory>
c0109790:	83 c4 10             	add    $0x10,%esp
c0109793:	8d 90 00 10 00 00    	lea    0x1000(%eax),%edx
c0109799:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010979c:	89 50 3c             	mov    %edx,0x3c(%eax)
c010979f:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01097a2:	83 ec 0c             	sub    $0xc,%esp
c01097a5:	50                   	push   %eax
c01097a6:	e8 cb 6a ff ff       	call   c0100276 <restart>
c01097ab:	83 c4 10             	add    $0x10,%esp
c01097ae:	90                   	nop
c01097af:	c9                   	leave  
c01097b0:	c3                   	ret    

c01097b1 <clone_pcb>:
c01097b1:	55                   	push   %ebp
c01097b2:	89 e5                	mov    %esp,%ebp
c01097b4:	83 ec 38             	sub    $0x38,%esp
c01097b7:	83 ec 08             	sub    $0x8,%esp
c01097ba:	6a 00                	push   $0x0
c01097bc:	6a 01                	push   $0x1
c01097be:	e8 b1 c8 ff ff       	call   c0106074 <alloc_memory>
c01097c3:	83 c4 10             	add    $0x10,%esp
c01097c6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01097c9:	83 ec 04             	sub    $0x4,%esp
c01097cc:	68 00 10 00 00       	push   $0x1000
c01097d1:	6a 00                	push   $0x0
c01097d3:	ff 75 f4             	pushl  -0xc(%ebp)
c01097d6:	e8 50 1a 00 00       	call   c010b22b <Memset>
c01097db:	83 c4 10             	add    $0x10,%esp
c01097de:	83 ec 04             	sub    $0x4,%esp
c01097e1:	68 00 10 00 00       	push   $0x1000
c01097e6:	ff 75 08             	pushl  0x8(%ebp)
c01097e9:	ff 75 f4             	pushl  -0xc(%ebp)
c01097ec:	e8 b8 d3 ff ff       	call   c0106ba9 <Memcpy>
c01097f1:	83 c4 10             	add    $0x10,%esp
c01097f4:	a1 c4 06 11 c0       	mov    0xc01106c4,%eax
c01097f9:	8d 50 01             	lea    0x1(%eax),%edx
c01097fc:	89 15 c4 06 11 c0    	mov    %edx,0xc01106c4
c0109802:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0109805:	89 82 14 01 00 00    	mov    %eax,0x114(%edx)
c010980b:	8b 45 08             	mov    0x8(%ebp),%eax
c010980e:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c0109814:	89 c2                	mov    %eax,%edx
c0109816:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109819:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c010981f:	83 ec 08             	sub    $0x8,%esp
c0109822:	6a 00                	push   $0x0
c0109824:	6a 01                	push   $0x1
c0109826:	e8 49 c8 ff ff       	call   c0106074 <alloc_memory>
c010982b:	83 c4 10             	add    $0x10,%esp
c010982e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109831:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109834:	05 00 0c 00 00       	add    $0xc00,%eax
c0109839:	83 ec 04             	sub    $0x4,%esp
c010983c:	68 00 04 00 00       	push   $0x400
c0109841:	68 00 fc ff ff       	push   $0xfffffc00
c0109846:	50                   	push   %eax
c0109847:	e8 5d d3 ff ff       	call   c0106ba9 <Memcpy>
c010984c:	83 c4 10             	add    $0x10,%esp
c010984f:	83 ec 0c             	sub    $0xc,%esp
c0109852:	ff 75 f0             	pushl  -0x10(%ebp)
c0109855:	e8 31 c6 ff ff       	call   c0105e8b <get_physical_address>
c010985a:	83 c4 10             	add    $0x10,%esp
c010985d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109860:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109863:	05 fc 0f 00 00       	add    $0xffc,%eax
c0109868:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010986b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010986e:	83 c8 07             	or     $0x7,%eax
c0109871:	89 c2                	mov    %eax,%edx
c0109873:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109876:	89 10                	mov    %edx,(%eax)
c0109878:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010987b:	8b 55 ec             	mov    -0x14(%ebp),%edx
c010987e:	89 50 08             	mov    %edx,0x8(%eax)
c0109881:	e8 6e fd ff ff       	call   c01095f4 <create_user_process_address_space>
c0109886:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109889:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c010988c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010988f:	89 50 0c             	mov    %edx,0xc(%eax)
c0109892:	8b 45 08             	mov    0x8(%ebp),%eax
c0109895:	8b 40 0c             	mov    0xc(%eax),%eax
c0109898:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010989b:	83 ec 04             	sub    $0x4,%esp
c010989e:	6a 0c                	push   $0xc
c01098a0:	ff 75 e0             	pushl  -0x20(%ebp)
c01098a3:	ff 75 e4             	pushl  -0x1c(%ebp)
c01098a6:	e8 fe d2 ff ff       	call   c0106ba9 <Memcpy>
c01098ab:	83 c4 10             	add    $0x10,%esp
c01098ae:	c7 45 dc 00 80 fb b7 	movl   $0xb7fb8000,-0x24(%ebp)
c01098b5:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01098b8:	05 ff 0f 00 00       	add    $0xfff,%eax
c01098bd:	c1 e8 0c             	shr    $0xc,%eax
c01098c0:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01098c3:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01098c6:	83 c0 07             	add    $0x7,%eax
c01098c9:	c1 e8 03             	shr    $0x3,%eax
c01098cc:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01098cf:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01098d2:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01098d5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01098d8:	05 ff 0f 00 00       	add    $0xfff,%eax
c01098dd:	c1 e8 0c             	shr    $0xc,%eax
c01098e0:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01098e3:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01098e6:	83 ec 08             	sub    $0x8,%esp
c01098e9:	6a 00                	push   $0x0
c01098eb:	50                   	push   %eax
c01098ec:	e8 83 c7 ff ff       	call   c0106074 <alloc_memory>
c01098f1:	83 c4 10             	add    $0x10,%esp
c01098f4:	89 c2                	mov    %eax,%edx
c01098f6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01098f9:	89 10                	mov    %edx,(%eax)
c01098fb:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01098fe:	c1 e0 0c             	shl    $0xc,%eax
c0109901:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0109904:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109907:	8b 10                	mov    (%eax),%edx
c0109909:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010990c:	8b 00                	mov    (%eax),%eax
c010990e:	83 ec 04             	sub    $0x4,%esp
c0109911:	ff 75 cc             	pushl  -0x34(%ebp)
c0109914:	52                   	push   %edx
c0109915:	50                   	push   %eax
c0109916:	e8 8e d2 ff ff       	call   c0106ba9 <Memcpy>
c010991b:	83 c4 10             	add    $0x10,%esp
c010991e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109921:	c9                   	leave  
c0109922:	c3                   	ret    

c0109923 <build_body_stack>:
c0109923:	55                   	push   %ebp
c0109924:	89 e5                	mov    %esp,%ebp
c0109926:	83 ec 48             	sub    $0x48,%esp
c0109929:	8b 45 08             	mov    0x8(%ebp),%eax
c010992c:	8b 40 0c             	mov    0xc(%eax),%eax
c010992f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109932:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109935:	8b 50 04             	mov    0x4(%eax),%edx
c0109938:	8b 00                	mov    (%eax),%eax
c010993a:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c010993d:	89 55 c8             	mov    %edx,-0x38(%ebp)
c0109940:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0109943:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109946:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0109949:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010994c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010994f:	8b 40 08             	mov    0x8(%eax),%eax
c0109952:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0109955:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010995c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0109963:	e8 dd d1 ff ff       	call   c0106b45 <intr_disable>
c0109968:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010996b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0109972:	e9 c2 00 00 00       	jmp    c0109a39 <build_body_stack+0x116>
c0109977:	8b 55 ec             	mov    -0x14(%ebp),%edx
c010997a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010997d:	01 d0                	add    %edx,%eax
c010997f:	0f b6 00             	movzbl (%eax),%eax
c0109982:	88 45 d3             	mov    %al,-0x2d(%ebp)
c0109985:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010998c:	e9 9a 00 00 00       	jmp    c0109a2b <build_body_stack+0x108>
c0109991:	0f be 55 d3          	movsbl -0x2d(%ebp),%edx
c0109995:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109998:	89 c1                	mov    %eax,%ecx
c010999a:	d3 fa                	sar    %cl,%edx
c010999c:	89 d0                	mov    %edx,%eax
c010999e:	83 e0 01             	and    $0x1,%eax
c01099a1:	85 c0                	test   %eax,%eax
c01099a3:	75 06                	jne    c01099ab <build_body_stack+0x88>
c01099a5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01099a9:	eb 7c                	jmp    c0109a27 <build_body_stack+0x104>
c01099ab:	8b 45 08             	mov    0x8(%ebp),%eax
c01099ae:	8b 40 08             	mov    0x8(%eax),%eax
c01099b1:	83 ec 0c             	sub    $0xc,%esp
c01099b4:	50                   	push   %eax
c01099b5:	e8 cd 69 ff ff       	call   c0100387 <update_cr3>
c01099ba:	83 c4 10             	add    $0x10,%esp
c01099bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01099c0:	c1 e0 0c             	shl    $0xc,%eax
c01099c3:	89 c2                	mov    %eax,%edx
c01099c5:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01099c8:	01 d0                	add    %edx,%eax
c01099ca:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01099cd:	8b 55 cc             	mov    -0x34(%ebp),%edx
c01099d0:	8b 45 10             	mov    0x10(%ebp),%eax
c01099d3:	83 ec 04             	sub    $0x4,%esp
c01099d6:	68 00 10 00 00       	push   $0x1000
c01099db:	52                   	push   %edx
c01099dc:	50                   	push   %eax
c01099dd:	e8 c7 d1 ff ff       	call   c0106ba9 <Memcpy>
c01099e2:	83 c4 10             	add    $0x10,%esp
c01099e5:	8b 45 0c             	mov    0xc(%ebp),%eax
c01099e8:	8b 40 08             	mov    0x8(%eax),%eax
c01099eb:	83 ec 0c             	sub    $0xc,%esp
c01099ee:	50                   	push   %eax
c01099ef:	e8 93 69 ff ff       	call   c0100387 <update_cr3>
c01099f4:	83 c4 10             	add    $0x10,%esp
c01099f7:	83 ec 08             	sub    $0x8,%esp
c01099fa:	ff 75 cc             	pushl  -0x34(%ebp)
c01099fd:	6a 01                	push   $0x1
c01099ff:	e8 d2 c6 ff ff       	call   c01060d6 <get_a_virtual_page>
c0109a04:	83 c4 10             	add    $0x10,%esp
c0109a07:	8b 55 10             	mov    0x10(%ebp),%edx
c0109a0a:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0109a0d:	83 ec 04             	sub    $0x4,%esp
c0109a10:	68 00 10 00 00       	push   $0x1000
c0109a15:	52                   	push   %edx
c0109a16:	50                   	push   %eax
c0109a17:	e8 8d d1 ff ff       	call   c0106ba9 <Memcpy>
c0109a1c:	83 c4 10             	add    $0x10,%esp
c0109a1f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0109a23:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0109a27:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0109a2b:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0109a2f:	0f 8e 5c ff ff ff    	jle    c0109991 <build_body_stack+0x6e>
c0109a35:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0109a39:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109a3c:	39 45 dc             	cmp    %eax,-0x24(%ebp)
c0109a3f:	0f 87 32 ff ff ff    	ja     c0109977 <build_body_stack+0x54>
c0109a45:	83 ec 0c             	sub    $0xc,%esp
c0109a48:	ff 75 d4             	pushl  -0x2c(%ebp)
c0109a4b:	e8 1e d1 ff ff       	call   c0106b6e <intr_set_status>
c0109a50:	83 c4 10             	add    $0x10,%esp
c0109a53:	90                   	nop
c0109a54:	c9                   	leave  
c0109a55:	c3                   	ret    

c0109a56 <build_process_kernel_stack>:
c0109a56:	55                   	push   %ebp
c0109a57:	89 e5                	mov    %esp,%ebp
c0109a59:	83 ec 28             	sub    $0x28,%esp
c0109a5c:	e8 e4 d0 ff ff       	call   c0106b45 <intr_disable>
c0109a61:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109a64:	8b 45 08             	mov    0x8(%ebp),%eax
c0109a67:	05 00 10 00 00       	add    $0x1000,%eax
c0109a6c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109a6f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109a72:	8b 00                	mov    (%eax),%eax
c0109a74:	83 f8 38             	cmp    $0x38,%eax
c0109a77:	74 06                	je     c0109a7f <build_process_kernel_stack+0x29>
c0109a79:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c0109a7d:	eb f0                	jmp    c0109a6f <build_process_kernel_stack+0x19>
c0109a7f:	90                   	nop
c0109a80:	8b 45 08             	mov    0x8(%ebp),%eax
c0109a83:	05 00 10 00 00       	add    $0x1000,%eax
c0109a88:	89 c2                	mov    %eax,%edx
c0109a8a:	8b 45 08             	mov    0x8(%ebp),%eax
c0109a8d:	89 50 04             	mov    %edx,0x4(%eax)
c0109a90:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109a93:	83 c0 2c             	add    $0x2c,%eax
c0109a96:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109a99:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109a9c:	83 e8 04             	sub    $0x4,%eax
c0109a9f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0109aa2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109aa5:	83 e8 08             	sub    $0x8,%eax
c0109aa8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109aab:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109aae:	83 e8 0c             	sub    $0xc,%eax
c0109ab1:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109ab4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109ab7:	83 e8 10             	sub    $0x10,%eax
c0109aba:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0109abd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109ac0:	83 e8 14             	sub    $0x14,%eax
c0109ac3:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0109ac6:	ba 67 02 10 c0       	mov    $0xc0100267,%edx
c0109acb:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109ace:	89 10                	mov    %edx,(%eax)
c0109ad0:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109ad3:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0109ad9:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109adc:	8b 10                	mov    (%eax),%edx
c0109ade:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0109ae1:	89 10                	mov    %edx,(%eax)
c0109ae3:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0109ae6:	8b 10                	mov    (%eax),%edx
c0109ae8:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109aeb:	89 10                	mov    %edx,(%eax)
c0109aed:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109af0:	8b 10                	mov    (%eax),%edx
c0109af2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109af5:	89 10                	mov    %edx,(%eax)
c0109af7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109afa:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0109b00:	8b 45 08             	mov    0x8(%ebp),%eax
c0109b03:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0109b06:	89 10                	mov    %edx,(%eax)
c0109b08:	83 ec 0c             	sub    $0xc,%esp
c0109b0b:	ff 75 f0             	pushl  -0x10(%ebp)
c0109b0e:	e8 5b d0 ff ff       	call   c0106b6e <intr_set_status>
c0109b13:	83 c4 10             	add    $0x10,%esp
c0109b16:	90                   	nop
c0109b17:	c9                   	leave  
c0109b18:	c3                   	ret    

c0109b19 <fork_process>:
c0109b19:	55                   	push   %ebp
c0109b1a:	89 e5                	mov    %esp,%ebp
c0109b1c:	83 ec 18             	sub    $0x18,%esp
c0109b1f:	8b 45 08             	mov    0x8(%ebp),%eax
c0109b22:	83 ec 0c             	sub    $0xc,%esp
c0109b25:	50                   	push   %eax
c0109b26:	e8 db 9b ff ff       	call   c0103706 <pid2proc>
c0109b2b:	83 c4 10             	add    $0x10,%esp
c0109b2e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109b31:	83 ec 0c             	sub    $0xc,%esp
c0109b34:	ff 75 f4             	pushl  -0xc(%ebp)
c0109b37:	e8 75 fc ff ff       	call   c01097b1 <clone_pcb>
c0109b3c:	83 c4 10             	add    $0x10,%esp
c0109b3f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109b42:	83 ec 08             	sub    $0x8,%esp
c0109b45:	6a 00                	push   $0x0
c0109b47:	6a 01                	push   $0x1
c0109b49:	e8 26 c5 ff ff       	call   c0106074 <alloc_memory>
c0109b4e:	83 c4 10             	add    $0x10,%esp
c0109b51:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109b54:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109b57:	83 ec 04             	sub    $0x4,%esp
c0109b5a:	68 00 10 00 00       	push   $0x1000
c0109b5f:	6a 00                	push   $0x0
c0109b61:	50                   	push   %eax
c0109b62:	e8 c4 16 00 00       	call   c010b22b <Memset>
c0109b67:	83 c4 10             	add    $0x10,%esp
c0109b6a:	83 ec 04             	sub    $0x4,%esp
c0109b6d:	ff 75 ec             	pushl  -0x14(%ebp)
c0109b70:	ff 75 f0             	pushl  -0x10(%ebp)
c0109b73:	ff 75 f4             	pushl  -0xc(%ebp)
c0109b76:	e8 a8 fd ff ff       	call   c0109923 <build_body_stack>
c0109b7b:	83 c4 10             	add    $0x10,%esp
c0109b7e:	83 ec 0c             	sub    $0xc,%esp
c0109b81:	ff 75 f0             	pushl  -0x10(%ebp)
c0109b84:	e8 cd fe ff ff       	call   c0109a56 <build_process_kernel_stack>
c0109b89:	83 c4 10             	add    $0x10,%esp
c0109b8c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109b8f:	05 6a 02 00 00       	add    $0x26a,%eax
c0109b94:	83 ec 08             	sub    $0x8,%esp
c0109b97:	50                   	push   %eax
c0109b98:	68 04 0f 11 c0       	push   $0xc0110f04
c0109b9d:	e8 ce 02 00 00       	call   c0109e70 <appendToDoubleLinkList>
c0109ba2:	83 c4 10             	add    $0x10,%esp
c0109ba5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109ba8:	c9                   	leave  
c0109ba9:	c3                   	ret    

c0109baa <process_execute>:
c0109baa:	55                   	push   %ebp
c0109bab:	89 e5                	mov    %esp,%ebp
c0109bad:	83 ec 28             	sub    $0x28,%esp
c0109bb0:	e8 d1 04 00 00       	call   c010a086 <thread_init>
c0109bb5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109bb8:	83 ec 0c             	sub    $0xc,%esp
c0109bbb:	ff 75 f4             	pushl  -0xc(%ebp)
c0109bbe:	e8 70 05 00 00       	call   c010a133 <thread_create>
c0109bc3:	83 c4 10             	add    $0x10,%esp
c0109bc6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109bc9:	05 28 01 00 00       	add    $0x128,%eax
c0109bce:	83 ec 08             	sub    $0x8,%esp
c0109bd1:	ff 75 10             	pushl  0x10(%ebp)
c0109bd4:	50                   	push   %eax
c0109bd5:	e8 70 16 00 00       	call   c010b24a <Strcpy>
c0109bda:	83 c4 10             	add    $0x10,%esp
c0109bdd:	83 ec 08             	sub    $0x8,%esp
c0109be0:	6a 00                	push   $0x0
c0109be2:	6a 01                	push   $0x1
c0109be4:	e8 8b c4 ff ff       	call   c0106074 <alloc_memory>
c0109be9:	83 c4 10             	add    $0x10,%esp
c0109bec:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109bef:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109bf2:	05 00 0c 00 00       	add    $0xc00,%eax
c0109bf7:	83 ec 04             	sub    $0x4,%esp
c0109bfa:	68 00 04 00 00       	push   $0x400
c0109bff:	68 00 fc ff ff       	push   $0xfffffc00
c0109c04:	50                   	push   %eax
c0109c05:	e8 9f cf ff ff       	call   c0106ba9 <Memcpy>
c0109c0a:	83 c4 10             	add    $0x10,%esp
c0109c0d:	83 ec 0c             	sub    $0xc,%esp
c0109c10:	ff 75 f0             	pushl  -0x10(%ebp)
c0109c13:	e8 73 c2 ff ff       	call   c0105e8b <get_physical_address>
c0109c18:	83 c4 10             	add    $0x10,%esp
c0109c1b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109c1e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109c21:	05 fc 0f 00 00       	add    $0xffc,%eax
c0109c26:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0109c29:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109c2c:	83 c8 07             	or     $0x7,%eax
c0109c2f:	89 c2                	mov    %eax,%edx
c0109c31:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109c34:	89 10                	mov    %edx,(%eax)
c0109c36:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109c39:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0109c3c:	89 50 08             	mov    %edx,0x8(%eax)
c0109c3f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109c42:	83 c0 10             	add    $0x10,%eax
c0109c45:	83 ec 0c             	sub    $0xc,%esp
c0109c48:	50                   	push   %eax
c0109c49:	e8 dc c9 ff ff       	call   c010662a <init_memory_block_desc>
c0109c4e:	83 c4 10             	add    $0x10,%esp
c0109c51:	e8 9e f9 ff ff       	call   c01095f4 <create_user_process_address_space>
c0109c56:	89 c2                	mov    %eax,%edx
c0109c58:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109c5b:	89 50 0c             	mov    %edx,0xc(%eax)
c0109c5e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109c61:	8b 00                	mov    (%eax),%eax
c0109c63:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109c66:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109c69:	c7 40 10 84 96 10 c0 	movl   $0xc0109684,0x10(%eax)
c0109c70:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109c73:	8b 55 08             	mov    0x8(%ebp),%edx
c0109c76:	89 50 18             	mov    %edx,0x18(%eax)
c0109c79:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109c7c:	8b 55 0c             	mov    0xc(%ebp),%edx
c0109c7f:	89 50 1c             	mov    %edx,0x1c(%eax)
c0109c82:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109c85:	8b 55 14             	mov    0x14(%ebp),%edx
c0109c88:	89 50 20             	mov    %edx,0x20(%eax)
c0109c8b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109c8e:	8b 55 18             	mov    0x18(%ebp),%edx
c0109c91:	89 50 24             	mov    %edx,0x24(%eax)
c0109c94:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0109c97:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109c9a:	89 50 28             	mov    %edx,0x28(%eax)
c0109c9d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109ca0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0109ca6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109ca9:	8b 10                	mov    (%eax),%edx
c0109cab:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109cae:	89 50 04             	mov    %edx,0x4(%eax)
c0109cb1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109cb4:	8b 50 04             	mov    0x4(%eax),%edx
c0109cb7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109cba:	89 50 08             	mov    %edx,0x8(%eax)
c0109cbd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109cc0:	8b 50 08             	mov    0x8(%eax),%edx
c0109cc3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109cc6:	89 50 0c             	mov    %edx,0xc(%eax)
c0109cc9:	83 ec 0c             	sub    $0xc,%esp
c0109ccc:	68 ec fd 10 c0       	push   $0xc010fdec
c0109cd1:	e8 9d 00 00 00       	call   c0109d73 <isListEmpty>
c0109cd6:	83 c4 10             	add    $0x10,%esp
c0109cd9:	e8 67 ce ff ff       	call   c0106b45 <intr_disable>
c0109cde:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109ce1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109ce4:	05 60 02 00 00       	add    $0x260,%eax
c0109ce9:	83 ec 08             	sub    $0x8,%esp
c0109cec:	50                   	push   %eax
c0109ced:	68 ec fd 10 c0       	push   $0xc010fdec
c0109cf2:	e8 79 01 00 00       	call   c0109e70 <appendToDoubleLinkList>
c0109cf7:	83 c4 10             	add    $0x10,%esp
c0109cfa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109cfd:	05 6a 02 00 00       	add    $0x26a,%eax
c0109d02:	83 ec 08             	sub    $0x8,%esp
c0109d05:	50                   	push   %eax
c0109d06:	68 04 0f 11 c0       	push   $0xc0110f04
c0109d0b:	e8 60 01 00 00       	call   c0109e70 <appendToDoubleLinkList>
c0109d10:	83 c4 10             	add    $0x10,%esp
c0109d13:	83 ec 0c             	sub    $0xc,%esp
c0109d16:	ff 75 e0             	pushl  -0x20(%ebp)
c0109d19:	e8 50 ce ff ff       	call   c0106b6e <intr_set_status>
c0109d1e:	83 c4 10             	add    $0x10,%esp
c0109d21:	90                   	nop
c0109d22:	c9                   	leave  
c0109d23:	c3                   	ret    
c0109d24:	66 90                	xchg   %ax,%ax
c0109d26:	66 90                	xchg   %ax,%ax
c0109d28:	66 90                	xchg   %ax,%ax
c0109d2a:	66 90                	xchg   %ax,%ax
c0109d2c:	66 90                	xchg   %ax,%ax
c0109d2e:	66 90                	xchg   %ax,%ax

c0109d30 <switch_to>:
c0109d30:	56                   	push   %esi
c0109d31:	57                   	push   %edi
c0109d32:	53                   	push   %ebx
c0109d33:	55                   	push   %ebp
c0109d34:	89 e5                	mov    %esp,%ebp
c0109d36:	8b 45 14             	mov    0x14(%ebp),%eax
c0109d39:	89 20                	mov    %esp,(%eax)
c0109d3b:	8b 45 18             	mov    0x18(%ebp),%eax
c0109d3e:	8b 20                	mov    (%eax),%esp
c0109d40:	5d                   	pop    %ebp
c0109d41:	5b                   	pop    %ebx
c0109d42:	5f                   	pop    %edi
c0109d43:	5e                   	pop    %esi
c0109d44:	c3                   	ret    

c0109d45 <initDoubleLinkList>:
c0109d45:	55                   	push   %ebp
c0109d46:	89 e5                	mov    %esp,%ebp
c0109d48:	8b 45 08             	mov    0x8(%ebp),%eax
c0109d4b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0109d51:	8b 45 08             	mov    0x8(%ebp),%eax
c0109d54:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c0109d5b:	8b 45 08             	mov    0x8(%ebp),%eax
c0109d5e:	8d 50 08             	lea    0x8(%eax),%edx
c0109d61:	8b 45 08             	mov    0x8(%ebp),%eax
c0109d64:	89 50 04             	mov    %edx,0x4(%eax)
c0109d67:	8b 55 08             	mov    0x8(%ebp),%edx
c0109d6a:	8b 45 08             	mov    0x8(%ebp),%eax
c0109d6d:	89 50 08             	mov    %edx,0x8(%eax)
c0109d70:	90                   	nop
c0109d71:	5d                   	pop    %ebp
c0109d72:	c3                   	ret    

c0109d73 <isListEmpty>:
c0109d73:	55                   	push   %ebp
c0109d74:	89 e5                	mov    %esp,%ebp
c0109d76:	8b 45 08             	mov    0x8(%ebp),%eax
c0109d79:	8b 40 04             	mov    0x4(%eax),%eax
c0109d7c:	8b 55 08             	mov    0x8(%ebp),%edx
c0109d7f:	83 c2 08             	add    $0x8,%edx
c0109d82:	39 d0                	cmp    %edx,%eax
c0109d84:	75 07                	jne    c0109d8d <isListEmpty+0x1a>
c0109d86:	b8 01 00 00 00       	mov    $0x1,%eax
c0109d8b:	eb 05                	jmp    c0109d92 <isListEmpty+0x1f>
c0109d8d:	b8 00 00 00 00       	mov    $0x0,%eax
c0109d92:	5d                   	pop    %ebp
c0109d93:	c3                   	ret    

c0109d94 <findElementInList>:
c0109d94:	55                   	push   %ebp
c0109d95:	89 e5                	mov    %esp,%ebp
c0109d97:	83 ec 28             	sub    $0x28,%esp
c0109d9a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0109d9e:	75 19                	jne    c0109db9 <findElementInList+0x25>
c0109da0:	6a 60                	push   $0x60
c0109da2:	68 d1 b1 10 c0       	push   $0xc010b1d1
c0109da7:	68 d1 b1 10 c0       	push   $0xc010b1d1
c0109dac:	68 e4 b1 10 c0       	push   $0xc010b1e4
c0109db1:	e8 f8 e7 ff ff       	call   c01085ae <assertion_failure>
c0109db6:	83 c4 10             	add    $0x10,%esp
c0109db9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0109dbd:	75 19                	jne    c0109dd8 <findElementInList+0x44>
c0109dbf:	6a 61                	push   $0x61
c0109dc1:	68 d1 b1 10 c0       	push   $0xc010b1d1
c0109dc6:	68 d1 b1 10 c0       	push   $0xc010b1d1
c0109dcb:	68 f0 b1 10 c0       	push   $0xc010b1f0
c0109dd0:	e8 d9 e7 ff ff       	call   c01085ae <assertion_failure>
c0109dd5:	83 c4 10             	add    $0x10,%esp
c0109dd8:	e8 68 cd ff ff       	call   c0106b45 <intr_disable>
c0109ddd:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109de0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0109de7:	8b 45 08             	mov    0x8(%ebp),%eax
c0109dea:	8b 40 08             	mov    0x8(%eax),%eax
c0109ded:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0109df0:	8b 45 08             	mov    0x8(%ebp),%eax
c0109df3:	8b 40 04             	mov    0x4(%eax),%eax
c0109df6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109df9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0109dfd:	75 07                	jne    c0109e06 <findElementInList+0x72>
c0109dff:	b8 00 00 00 00       	mov    $0x0,%eax
c0109e04:	eb 68                	jmp    c0109e6e <findElementInList+0xda>
c0109e06:	8b 45 0c             	mov    0xc(%ebp),%eax
c0109e09:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109e0c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109e0f:	2b 45 f0             	sub    -0x10(%ebp),%eax
c0109e12:	c1 f8 03             	sar    $0x3,%eax
c0109e15:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109e18:	eb 36                	jmp    c0109e50 <findElementInList+0xbc>
c0109e1a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109e1d:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c0109e20:	75 07                	jne    c0109e29 <findElementInList+0x95>
c0109e22:	b8 01 00 00 00       	mov    $0x1,%eax
c0109e27:	eb 45                	jmp    c0109e6e <findElementInList+0xda>
c0109e29:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0109e2d:	75 07                	jne    c0109e36 <findElementInList+0xa2>
c0109e2f:	b8 00 00 00 00       	mov    $0x0,%eax
c0109e34:	eb 38                	jmp    c0109e6e <findElementInList+0xda>
c0109e36:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109e39:	8b 40 04             	mov    0x4(%eax),%eax
c0109e3c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109e3f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0109e43:	75 07                	jne    c0109e4c <findElementInList+0xb8>
c0109e45:	b8 00 00 00 00       	mov    $0x0,%eax
c0109e4a:	eb 22                	jmp    c0109e6e <findElementInList+0xda>
c0109e4c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0109e50:	8b 45 08             	mov    0x8(%ebp),%eax
c0109e53:	83 c0 08             	add    $0x8,%eax
c0109e56:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0109e59:	75 bf                	jne    c0109e1a <findElementInList+0x86>
c0109e5b:	83 ec 0c             	sub    $0xc,%esp
c0109e5e:	ff 75 ec             	pushl  -0x14(%ebp)
c0109e61:	e8 08 cd ff ff       	call   c0106b6e <intr_set_status>
c0109e66:	83 c4 10             	add    $0x10,%esp
c0109e69:	b8 00 00 00 00       	mov    $0x0,%eax
c0109e6e:	c9                   	leave  
c0109e6f:	c3                   	ret    

c0109e70 <appendToDoubleLinkList>:
c0109e70:	55                   	push   %ebp
c0109e71:	89 e5                	mov    %esp,%ebp
c0109e73:	83 ec 18             	sub    $0x18,%esp
c0109e76:	83 ec 08             	sub    $0x8,%esp
c0109e79:	ff 75 0c             	pushl  0xc(%ebp)
c0109e7c:	ff 75 08             	pushl  0x8(%ebp)
c0109e7f:	e8 10 ff ff ff       	call   c0109d94 <findElementInList>
c0109e84:	83 c4 10             	add    $0x10,%esp
c0109e87:	3c 01                	cmp    $0x1,%al
c0109e89:	0f 84 c2 00 00 00    	je     c0109f51 <appendToDoubleLinkList+0xe1>
c0109e8f:	e8 b1 cc ff ff       	call   c0106b45 <intr_disable>
c0109e94:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109e97:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0109e9b:	75 1c                	jne    c0109eb9 <appendToDoubleLinkList+0x49>
c0109e9d:	68 9e 00 00 00       	push   $0x9e
c0109ea2:	68 d1 b1 10 c0       	push   $0xc010b1d1
c0109ea7:	68 d1 b1 10 c0       	push   $0xc010b1d1
c0109eac:	68 e4 b1 10 c0       	push   $0xc010b1e4
c0109eb1:	e8 f8 e6 ff ff       	call   c01085ae <assertion_failure>
c0109eb6:	83 c4 10             	add    $0x10,%esp
c0109eb9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0109ebd:	75 1c                	jne    c0109edb <appendToDoubleLinkList+0x6b>
c0109ebf:	68 9f 00 00 00       	push   $0x9f
c0109ec4:	68 d1 b1 10 c0       	push   $0xc010b1d1
c0109ec9:	68 d1 b1 10 c0       	push   $0xc010b1d1
c0109ece:	68 f0 b1 10 c0       	push   $0xc010b1f0
c0109ed3:	e8 d6 e6 ff ff       	call   c01085ae <assertion_failure>
c0109ed8:	83 c4 10             	add    $0x10,%esp
c0109edb:	83 ec 08             	sub    $0x8,%esp
c0109ede:	ff 75 0c             	pushl  0xc(%ebp)
c0109ee1:	ff 75 08             	pushl  0x8(%ebp)
c0109ee4:	e8 ab fe ff ff       	call   c0109d94 <findElementInList>
c0109ee9:	83 c4 10             	add    $0x10,%esp
c0109eec:	3c 01                	cmp    $0x1,%al
c0109eee:	74 64                	je     c0109f54 <appendToDoubleLinkList+0xe4>
c0109ef0:	8b 45 0c             	mov    0xc(%ebp),%eax
c0109ef3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109ef6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109ef9:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0109f00:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109f03:	8b 50 04             	mov    0x4(%eax),%edx
c0109f06:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109f09:	89 10                	mov    %edx,(%eax)
c0109f0b:	8b 45 08             	mov    0x8(%ebp),%eax
c0109f0e:	8b 50 08             	mov    0x8(%eax),%edx
c0109f11:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109f14:	89 10                	mov    %edx,(%eax)
c0109f16:	8b 45 08             	mov    0x8(%ebp),%eax
c0109f19:	8b 40 08             	mov    0x8(%eax),%eax
c0109f1c:	85 c0                	test   %eax,%eax
c0109f1e:	74 0c                	je     c0109f2c <appendToDoubleLinkList+0xbc>
c0109f20:	8b 45 08             	mov    0x8(%ebp),%eax
c0109f23:	8b 40 08             	mov    0x8(%eax),%eax
c0109f26:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0109f29:	89 50 04             	mov    %edx,0x4(%eax)
c0109f2c:	8b 45 08             	mov    0x8(%ebp),%eax
c0109f2f:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0109f32:	89 50 08             	mov    %edx,0x8(%eax)
c0109f35:	8b 45 08             	mov    0x8(%ebp),%eax
c0109f38:	8d 50 08             	lea    0x8(%eax),%edx
c0109f3b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109f3e:	89 50 04             	mov    %edx,0x4(%eax)
c0109f41:	83 ec 0c             	sub    $0xc,%esp
c0109f44:	ff 75 f4             	pushl  -0xc(%ebp)
c0109f47:	e8 22 cc ff ff       	call   c0106b6e <intr_set_status>
c0109f4c:	83 c4 10             	add    $0x10,%esp
c0109f4f:	eb 04                	jmp    c0109f55 <appendToDoubleLinkList+0xe5>
c0109f51:	90                   	nop
c0109f52:	eb 01                	jmp    c0109f55 <appendToDoubleLinkList+0xe5>
c0109f54:	90                   	nop
c0109f55:	c9                   	leave  
c0109f56:	c3                   	ret    

c0109f57 <insertToDoubleLinkList>:
c0109f57:	55                   	push   %ebp
c0109f58:	89 e5                	mov    %esp,%ebp
c0109f5a:	83 ec 18             	sub    $0x18,%esp
c0109f5d:	83 ec 08             	sub    $0x8,%esp
c0109f60:	ff 75 0c             	pushl  0xc(%ebp)
c0109f63:	ff 75 08             	pushl  0x8(%ebp)
c0109f66:	e8 29 fe ff ff       	call   c0109d94 <findElementInList>
c0109f6b:	83 c4 10             	add    $0x10,%esp
c0109f6e:	3c 01                	cmp    $0x1,%al
c0109f70:	74 65                	je     c0109fd7 <insertToDoubleLinkList+0x80>
c0109f72:	e8 ce cb ff ff       	call   c0106b45 <intr_disable>
c0109f77:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109f7a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0109f7d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109f80:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109f83:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0109f8a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109f8d:	8b 50 04             	mov    0x4(%eax),%edx
c0109f90:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109f93:	89 10                	mov    %edx,(%eax)
c0109f95:	8b 45 08             	mov    0x8(%ebp),%eax
c0109f98:	8b 50 04             	mov    0x4(%eax),%edx
c0109f9b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109f9e:	89 50 04             	mov    %edx,0x4(%eax)
c0109fa1:	8b 45 08             	mov    0x8(%ebp),%eax
c0109fa4:	8b 40 04             	mov    0x4(%eax),%eax
c0109fa7:	85 c0                	test   %eax,%eax
c0109fa9:	74 0b                	je     c0109fb6 <insertToDoubleLinkList+0x5f>
c0109fab:	8b 45 08             	mov    0x8(%ebp),%eax
c0109fae:	8b 40 04             	mov    0x4(%eax),%eax
c0109fb1:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0109fb4:	89 10                	mov    %edx,(%eax)
c0109fb6:	8b 45 08             	mov    0x8(%ebp),%eax
c0109fb9:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0109fbc:	89 50 04             	mov    %edx,0x4(%eax)
c0109fbf:	8b 55 08             	mov    0x8(%ebp),%edx
c0109fc2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109fc5:	89 10                	mov    %edx,(%eax)
c0109fc7:	83 ec 0c             	sub    $0xc,%esp
c0109fca:	ff 75 f4             	pushl  -0xc(%ebp)
c0109fcd:	e8 9c cb ff ff       	call   c0106b6e <intr_set_status>
c0109fd2:	83 c4 10             	add    $0x10,%esp
c0109fd5:	eb 01                	jmp    c0109fd8 <insertToDoubleLinkList+0x81>
c0109fd7:	90                   	nop
c0109fd8:	c9                   	leave  
c0109fd9:	c3                   	ret    

c0109fda <popFromDoubleLinkList>:
c0109fda:	55                   	push   %ebp
c0109fdb:	89 e5                	mov    %esp,%ebp
c0109fdd:	83 ec 18             	sub    $0x18,%esp
c0109fe0:	e8 60 cb ff ff       	call   c0106b45 <intr_disable>
c0109fe5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109fe8:	83 ec 0c             	sub    $0xc,%esp
c0109feb:	ff 75 08             	pushl  0x8(%ebp)
c0109fee:	e8 80 fd ff ff       	call   c0109d73 <isListEmpty>
c0109ff3:	83 c4 10             	add    $0x10,%esp
c0109ff6:	3c 01                	cmp    $0x1,%al
c0109ff8:	75 07                	jne    c010a001 <popFromDoubleLinkList+0x27>
c0109ffa:	b8 00 00 00 00       	mov    $0x0,%eax
c0109fff:	eb 6b                	jmp    c010a06c <popFromDoubleLinkList+0x92>
c010a001:	8b 45 08             	mov    0x8(%ebp),%eax
c010a004:	8b 40 08             	mov    0x8(%eax),%eax
c010a007:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a00a:	8b 45 08             	mov    0x8(%ebp),%eax
c010a00d:	8b 40 08             	mov    0x8(%eax),%eax
c010a010:	85 c0                	test   %eax,%eax
c010a012:	75 07                	jne    c010a01b <popFromDoubleLinkList+0x41>
c010a014:	b8 00 00 00 00       	mov    $0x0,%eax
c010a019:	eb 51                	jmp    c010a06c <popFromDoubleLinkList+0x92>
c010a01b:	8b 45 08             	mov    0x8(%ebp),%eax
c010a01e:	8b 40 08             	mov    0x8(%eax),%eax
c010a021:	8b 00                	mov    (%eax),%eax
c010a023:	85 c0                	test   %eax,%eax
c010a025:	74 11                	je     c010a038 <popFromDoubleLinkList+0x5e>
c010a027:	8b 45 08             	mov    0x8(%ebp),%eax
c010a02a:	8b 40 08             	mov    0x8(%eax),%eax
c010a02d:	8b 00                	mov    (%eax),%eax
c010a02f:	8b 55 08             	mov    0x8(%ebp),%edx
c010a032:	83 c2 08             	add    $0x8,%edx
c010a035:	89 50 04             	mov    %edx,0x4(%eax)
c010a038:	8b 45 08             	mov    0x8(%ebp),%eax
c010a03b:	8b 40 08             	mov    0x8(%eax),%eax
c010a03e:	8b 10                	mov    (%eax),%edx
c010a040:	8b 45 08             	mov    0x8(%ebp),%eax
c010a043:	89 50 08             	mov    %edx,0x8(%eax)
c010a046:	83 ec 0c             	sub    $0xc,%esp
c010a049:	ff 75 f4             	pushl  -0xc(%ebp)
c010a04c:	e8 1d cb ff ff       	call   c0106b6e <intr_set_status>
c010a051:	83 c4 10             	add    $0x10,%esp
c010a054:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a057:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c010a05e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a061:	8b 50 04             	mov    0x4(%eax),%edx
c010a064:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a067:	89 10                	mov    %edx,(%eax)
c010a069:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a06c:	c9                   	leave  
c010a06d:	c3                   	ret    

c010a06e <kernel_thread>:
c010a06e:	55                   	push   %ebp
c010a06f:	89 e5                	mov    %esp,%ebp
c010a071:	83 ec 08             	sub    $0x8,%esp
c010a074:	fb                   	sti    
c010a075:	83 ec 0c             	sub    $0xc,%esp
c010a078:	ff 75 0c             	pushl  0xc(%ebp)
c010a07b:	8b 45 08             	mov    0x8(%ebp),%eax
c010a07e:	ff d0                	call   *%eax
c010a080:	83 c4 10             	add    $0x10,%esp
c010a083:	90                   	nop
c010a084:	c9                   	leave  
c010a085:	c3                   	ret    

c010a086 <thread_init>:
c010a086:	55                   	push   %ebp
c010a087:	89 e5                	mov    %esp,%ebp
c010a089:	83 ec 18             	sub    $0x18,%esp
c010a08c:	83 ec 08             	sub    $0x8,%esp
c010a08f:	6a 00                	push   $0x0
c010a091:	6a 01                	push   $0x1
c010a093:	e8 dc bf ff ff       	call   c0106074 <alloc_memory>
c010a098:	83 c4 10             	add    $0x10,%esp
c010a09b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a09e:	83 ec 04             	sub    $0x4,%esp
c010a0a1:	68 00 10 00 00       	push   $0x1000
c010a0a6:	6a 00                	push   $0x0
c010a0a8:	ff 75 f4             	pushl  -0xc(%ebp)
c010a0ab:	e8 7b 11 00 00       	call   c010b22b <Memset>
c010a0b0:	83 c4 10             	add    $0x10,%esp
c010a0b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a0b6:	05 00 10 00 00       	add    $0x1000,%eax
c010a0bb:	89 c2                	mov    %eax,%edx
c010a0bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a0c0:	89 10                	mov    %edx,(%eax)
c010a0c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a0c5:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c010a0cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a0cf:	c7 80 58 02 00 00 ff 	movl   $0xffffffff,0x258(%eax)
c010a0d6:	ff ff ff 
c010a0d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a0dc:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c010a0e3:	00 00 00 
c010a0e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a0e9:	8b 90 50 02 00 00    	mov    0x250(%eax),%edx
c010a0ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a0f2:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c010a0f8:	a1 90 f7 10 c0       	mov    0xc010f790,%eax
c010a0fd:	83 c0 01             	add    $0x1,%eax
c010a100:	a3 90 f7 10 c0       	mov    %eax,0xc010f790
c010a105:	8b 15 90 f7 10 c0    	mov    0xc010f790,%edx
c010a10b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a10e:	89 90 14 01 00 00    	mov    %edx,0x114(%eax)
c010a114:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a117:	c7 80 18 01 00 00 0f 	movl   $0xf,0x118(%eax)
c010a11e:	00 00 00 
c010a121:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a124:	c7 80 b8 02 00 00 e0 	movl   $0x99abcde0,0x2b8(%eax)
c010a12b:	cd ab 99 
c010a12e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a131:	c9                   	leave  
c010a132:	c3                   	ret    

c010a133 <thread_create>:
c010a133:	55                   	push   %ebp
c010a134:	89 e5                	mov    %esp,%ebp
c010a136:	83 ec 10             	sub    $0x10,%esp
c010a139:	c7 45 fc 44 00 00 00 	movl   $0x44,-0x4(%ebp)
c010a140:	c7 45 f8 30 00 00 00 	movl   $0x30,-0x8(%ebp)
c010a147:	8b 45 08             	mov    0x8(%ebp),%eax
c010a14a:	8b 00                	mov    (%eax),%eax
c010a14c:	2b 45 fc             	sub    -0x4(%ebp),%eax
c010a14f:	89 c2                	mov    %eax,%edx
c010a151:	8b 45 08             	mov    0x8(%ebp),%eax
c010a154:	89 10                	mov    %edx,(%eax)
c010a156:	8b 45 08             	mov    0x8(%ebp),%eax
c010a159:	8b 00                	mov    (%eax),%eax
c010a15b:	2b 45 f8             	sub    -0x8(%ebp),%eax
c010a15e:	89 c2                	mov    %eax,%edx
c010a160:	8b 45 08             	mov    0x8(%ebp),%eax
c010a163:	89 10                	mov    %edx,(%eax)
c010a165:	90                   	nop
c010a166:	c9                   	leave  
c010a167:	c3                   	ret    

c010a168 <thread_start>:
c010a168:	55                   	push   %ebp
c010a169:	89 e5                	mov    %esp,%ebp
c010a16b:	83 ec 18             	sub    $0x18,%esp
c010a16e:	e8 13 ff ff ff       	call   c010a086 <thread_init>
c010a173:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a176:	83 ec 0c             	sub    $0xc,%esp
c010a179:	ff 75 f4             	pushl  -0xc(%ebp)
c010a17c:	e8 b2 ff ff ff       	call   c010a133 <thread_create>
c010a181:	83 c4 10             	add    $0x10,%esp
c010a184:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a187:	05 28 01 00 00       	add    $0x128,%eax
c010a18c:	83 ec 08             	sub    $0x8,%esp
c010a18f:	ff 75 10             	pushl  0x10(%ebp)
c010a192:	50                   	push   %eax
c010a193:	e8 b2 10 00 00       	call   c010b24a <Strcpy>
c010a198:	83 c4 10             	add    $0x10,%esp
c010a19b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a19e:	8b 00                	mov    (%eax),%eax
c010a1a0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a1a3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a1a6:	c7 40 10 6e a0 10 c0 	movl   $0xc010a06e,0x10(%eax)
c010a1ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a1b0:	8b 55 08             	mov    0x8(%ebp),%edx
c010a1b3:	89 50 18             	mov    %edx,0x18(%eax)
c010a1b6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a1b9:	8b 55 0c             	mov    0xc(%ebp),%edx
c010a1bc:	89 50 1c             	mov    %edx,0x1c(%eax)
c010a1bf:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a1c2:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010a1c8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a1cb:	8b 10                	mov    (%eax),%edx
c010a1cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a1d0:	89 50 04             	mov    %edx,0x4(%eax)
c010a1d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a1d6:	8b 50 04             	mov    0x4(%eax),%edx
c010a1d9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a1dc:	89 50 08             	mov    %edx,0x8(%eax)
c010a1df:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a1e2:	8b 50 08             	mov    0x8(%eax),%edx
c010a1e5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a1e8:	89 50 0c             	mov    %edx,0xc(%eax)
c010a1eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a1ee:	05 60 02 00 00       	add    $0x260,%eax
c010a1f3:	83 ec 08             	sub    $0x8,%esp
c010a1f6:	50                   	push   %eax
c010a1f7:	68 ec fd 10 c0       	push   $0xc010fdec
c010a1fc:	e8 6f fc ff ff       	call   c0109e70 <appendToDoubleLinkList>
c010a201:	83 c4 10             	add    $0x10,%esp
c010a204:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a207:	05 6a 02 00 00       	add    $0x26a,%eax
c010a20c:	83 ec 08             	sub    $0x8,%esp
c010a20f:	50                   	push   %eax
c010a210:	68 04 0f 11 c0       	push   $0xc0110f04
c010a215:	e8 56 fc ff ff       	call   c0109e70 <appendToDoubleLinkList>
c010a21a:	83 c4 10             	add    $0x10,%esp
c010a21d:	90                   	nop
c010a21e:	c9                   	leave  
c010a21f:	c3                   	ret    
