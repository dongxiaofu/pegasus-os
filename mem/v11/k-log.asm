
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
c0100025:	e8 6e 3a 00 00       	call   c0103a98 <ReloadGDT>
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
c010014b:	e8 8d 6f 00 00       	call   c01070dd <exception_handler>
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
c0100168:	e8 70 6f 00 00       	call   c01070dd <exception_handler>
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
c0100195:	e8 db 34 00 00       	call   c0103675 <clock_handler>
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
c01001c7:	e8 21 44 00 00       	call   c01045ed <keyboard_handler>
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
c010020d:	e8 1f 11 00 00       	call   c0101331 <hd_handler>
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
c01002f5:	e8 7d 6c 00 00       	call   c0106f77 <disp_int>
c01002fa:	83 c4 04             	add    $0x4,%esp
c01002fd:	58                   	pop    %eax
c01002fe:	5a                   	pop    %edx
c01002ff:	52                   	push   %edx
c0100300:	50                   	push   %eax
c0100301:	e8 71 6c 00 00       	call   c0106f77 <disp_int>
c0100306:	58                   	pop    %eax
c0100307:	5a                   	pop    %edx
c0100308:	52                   	push   %edx
c0100309:	50                   	push   %eax
c010030a:	ff 35 a8 f7 10 c0    	pushl  0xc010f7a8
c0100310:	e8 62 6c 00 00       	call   c0106f77 <disp_int>
c0100315:	83 c4 04             	add    $0x4,%esp
c0100318:	58                   	pop    %eax
c0100319:	5a                   	pop    %edx
c010031a:	52                   	push   %edx
c010031b:	50                   	push   %eax
c010031c:	ff 72 ec             	pushl  -0x14(%edx)
c010031f:	e8 53 6c 00 00       	call   c0106f77 <disp_int>
c0100324:	83 c4 04             	add    $0x4,%esp
c0100327:	58                   	pop    %eax
c0100328:	5a                   	pop    %edx
c0100329:	52                   	push   %edx
c010032a:	50                   	push   %eax
c010032b:	ff 70 ec             	pushl  -0x14(%eax)
c010032e:	e8 44 6c 00 00       	call   c0106f77 <disp_int>
c0100333:	83 c4 04             	add    $0x4,%esp
c0100336:	58                   	pop    %eax
c0100337:	5a                   	pop    %edx
c0100338:	52                   	push   %edx
c0100339:	50                   	push   %eax
c010033a:	ff 35 c0 fb 10 c0    	pushl  0xc010fbc0
c0100340:	e8 32 6c 00 00       	call   c0106f77 <disp_int>
c0100345:	83 c4 04             	add    $0x4,%esp
c0100348:	58                   	pop    %eax
c0100349:	5a                   	pop    %edx
c010034a:	52                   	push   %edx
c010034b:	50                   	push   %eax
c010034c:	68 60 f7 10 c0       	push   $0xc010f760
c0100351:	e8 21 6c 00 00       	call   c0106f77 <disp_int>
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
c010040b:	68 20 a2 10 c0       	push   $0xc010a220
c0100410:	50                   	push   %eax
c0100411:	e8 f4 ad 00 00       	call   c010b20a <Strcpy>
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
c010046c:	68 54 50 10 c0       	push   $0xc0105054
c0100471:	e8 3e 97 00 00       	call   c0109bb4 <process_execute>
c0100476:	83 c4 20             	add    $0x20,%esp
c0100479:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010047c:	83 ec 0c             	sub    $0xc,%esp
c010047f:	50                   	push   %eax
c0100480:	6a 00                	push   $0x0
c0100482:	68 3c a2 10 c0       	push   $0xc010a23c
c0100487:	68 44 a2 10 c0       	push   $0xc010a244
c010048c:	68 39 15 10 c0       	push   $0xc0101539
c0100491:	e8 1e 97 00 00       	call   c0109bb4 <process_execute>
c0100496:	83 c4 20             	add    $0x20,%esp
c0100499:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010049c:	83 ec 0c             	sub    $0xc,%esp
c010049f:	50                   	push   %eax
c01004a0:	6a 00                	push   $0x0
c01004a2:	68 4d a2 10 c0       	push   $0xc010a24d
c01004a7:	68 54 a2 10 c0       	push   $0xc010a254
c01004ac:	68 a9 06 10 c0       	push   $0xc01006a9
c01004b1:	e8 fe 96 00 00       	call   c0109bb4 <process_execute>
c01004b6:	83 c4 20             	add    $0x20,%esp
c01004b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01004bc:	83 ec 0c             	sub    $0xc,%esp
c01004bf:	50                   	push   %eax
c01004c0:	6a 00                	push   $0x0
c01004c2:	68 5d a2 10 c0       	push   $0xc010a25d
c01004c7:	68 65 a2 10 c0       	push   $0xc010a265
c01004cc:	68 ea 44 10 c0       	push   $0xc01044ea
c01004d1:	e8 de 96 00 00       	call   c0109bb4 <process_execute>
c01004d6:	83 c4 20             	add    $0x20,%esp
c01004d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01004dc:	83 e8 02             	sub    $0x2,%eax
c01004df:	83 ec 0c             	sub    $0xc,%esp
c01004e2:	50                   	push   %eax
c01004e3:	6a 01                	push   $0x1
c01004e5:	68 6f a2 10 c0       	push   $0xc010a26f
c01004ea:	68 79 a2 10 c0       	push   $0xc010a279
c01004ef:	68 6e 06 10 c0       	push   $0xc010066e
c01004f4:	e8 bb 96 00 00       	call   c0109bb4 <process_execute>
c01004f9:	83 c4 20             	add    $0x20,%esp
c01004fc:	83 ec 0c             	sub    $0xc,%esp
c01004ff:	68 86 a2 10 c0       	push   $0xc010a286
c0100504:	e8 83 fb ff ff       	call   c010008c <disp_str>
c0100509:	83 c4 10             	add    $0x10,%esp
c010050c:	fb                   	sti    
c010050d:	e8 89 65 00 00       	call   c0106a9b <stop_here>
c0100512:	eb f9                	jmp    c010050d <kernel_main+0x15c>

c0100514 <init>:
c0100514:	55                   	push   %ebp
c0100515:	89 e5                	mov    %esp,%ebp
c0100517:	83 ec 08             	sub    $0x8,%esp
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
c0100563:	68 90 a2 10 c0       	push   $0xc010a290
c0100568:	e8 1f fb ff ff       	call   c010008c <disp_str>
c010056d:	83 c4 10             	add    $0x10,%esp
c0100570:	e8 52 6f 00 00       	call   c01074c7 <init_keyboard>
c0100575:	83 ec 0c             	sub    $0xc,%esp
c0100578:	68 00 00 00 04       	push   $0x4000000
c010057d:	e8 d0 63 00 00       	call   c0106952 <init_memory>
c0100582:	83 c4 10             	add    $0x10,%esp
c0100585:	83 ec 0c             	sub    $0xc,%esp
c0100588:	68 ec fd 10 c0       	push   $0xc010fdec
c010058d:	e8 b3 97 00 00       	call   c0109d45 <initDoubleLinkList>
c0100592:	83 c4 10             	add    $0x10,%esp
c0100595:	83 ec 0c             	sub    $0xc,%esp
c0100598:	68 04 0f 11 c0       	push   $0xc0110f04
c010059d:	e8 a3 97 00 00       	call   c0109d45 <initDoubleLinkList>
c01005a2:	83 c4 10             	add    $0x10,%esp
c01005a5:	90                   	nop
c01005a6:	c9                   	leave  
c01005a7:	c3                   	ret    

c01005a8 <kernel_thread_a>:
c01005a8:	55                   	push   %ebp
c01005a9:	89 e5                	mov    %esp,%ebp
c01005ab:	83 ec 18             	sub    $0x18,%esp
c01005ae:	83 ec 0c             	sub    $0xc,%esp
c01005b1:	ff 75 08             	pushl  0x8(%ebp)
c01005b4:	e8 d3 fa ff ff       	call   c010008c <disp_str>
c01005b9:	83 c4 10             	add    $0x10,%esp
c01005bc:	a1 a4 f7 10 c0       	mov    0xc010f7a4,%eax
c01005c1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01005c4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01005cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01005ce:	a3 a4 f7 10 c0       	mov    %eax,0xc010f7a4
c01005d3:	83 ec 0c             	sub    $0xc,%esp
c01005d6:	68 96 a2 10 c0       	push   $0xc010a296
c01005db:	e8 ac fa ff ff       	call   c010008c <disp_str>
c01005e0:	83 c4 10             	add    $0x10,%esp
c01005e3:	83 ec 0c             	sub    $0xc,%esp
c01005e6:	68 9f a2 10 c0       	push   $0xc010a29f
c01005eb:	e8 9c fa ff ff       	call   c010008c <disp_str>
c01005f0:	83 c4 10             	add    $0x10,%esp
c01005f3:	eb d6                	jmp    c01005cb <kernel_thread_a+0x23>

c01005f5 <kernel_thread_b>:
c01005f5:	55                   	push   %ebp
c01005f6:	89 e5                	mov    %esp,%ebp
c01005f8:	83 ec 18             	sub    $0x18,%esp
c01005fb:	83 ec 0c             	sub    $0xc,%esp
c01005fe:	ff 75 08             	pushl  0x8(%ebp)
c0100601:	e8 86 fa ff ff       	call   c010008c <disp_str>
c0100606:	83 c4 10             	add    $0x10,%esp
c0100609:	a1 a4 f7 10 c0       	mov    0xc010f7a4,%eax
c010060e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0100611:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0100618:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010061b:	a3 a4 f7 10 c0       	mov    %eax,0xc010f7a4
c0100620:	83 ec 0c             	sub    $0xc,%esp
c0100623:	68 a1 a2 10 c0       	push   $0xc010a2a1
c0100628:	e8 5f fa ff ff       	call   c010008c <disp_str>
c010062d:	83 c4 10             	add    $0x10,%esp
c0100630:	83 ec 0c             	sub    $0xc,%esp
c0100633:	68 9f a2 10 c0       	push   $0xc010a29f
c0100638:	e8 4f fa ff ff       	call   c010008c <disp_str>
c010063d:	83 c4 10             	add    $0x10,%esp
c0100640:	eb d6                	jmp    c0100618 <kernel_thread_b+0x23>

c0100642 <kernel_thread_c>:
c0100642:	55                   	push   %ebp
c0100643:	89 e5                	mov    %esp,%ebp
c0100645:	83 ec 08             	sub    $0x8,%esp
c0100648:	83 ec 0c             	sub    $0xc,%esp
c010064b:	ff 75 08             	pushl  0x8(%ebp)
c010064e:	e8 39 fa ff ff       	call   c010008c <disp_str>
c0100653:	83 c4 10             	add    $0x10,%esp
c0100656:	eb fe                	jmp    c0100656 <kernel_thread_c+0x14>

c0100658 <kernel_thread_d>:
c0100658:	55                   	push   %ebp
c0100659:	89 e5                	mov    %esp,%ebp
c010065b:	83 ec 08             	sub    $0x8,%esp
c010065e:	83 ec 0c             	sub    $0xc,%esp
c0100661:	ff 75 08             	pushl  0x8(%ebp)
c0100664:	e8 23 fa ff ff       	call   c010008c <disp_str>
c0100669:	83 c4 10             	add    $0x10,%esp
c010066c:	eb fe                	jmp    c010066c <kernel_thread_d+0x14>

c010066e <user_proc_a>:
c010066e:	55                   	push   %ebp
c010066f:	89 e5                	mov    %esp,%ebp
c0100671:	83 ec 08             	sub    $0x8,%esp
c0100674:	83 ec 0c             	sub    $0xc,%esp
c0100677:	68 aa a2 10 c0       	push   $0xc010a2aa
c010067c:	e8 0b fa ff ff       	call   c010008c <disp_str>
c0100681:	83 c4 10             	add    $0x10,%esp
c0100684:	e8 ab 6e 00 00       	call   c0107534 <TestTTY>
c0100689:	e8 0d 64 00 00       	call   c0106a9b <stop_here>
c010068e:	90                   	nop
c010068f:	c9                   	leave  
c0100690:	c3                   	ret    

c0100691 <user_proc_b>:
c0100691:	55                   	push   %ebp
c0100692:	89 e5                	mov    %esp,%ebp
c0100694:	83 ec 08             	sub    $0x8,%esp
c0100697:	83 ec 0c             	sub    $0xc,%esp
c010069a:	68 bc a2 10 c0       	push   $0xc010a2bc
c010069f:	e8 e8 f9 ff ff       	call   c010008c <disp_str>
c01006a4:	83 c4 10             	add    $0x10,%esp
c01006a7:	eb fe                	jmp    c01006a7 <user_proc_b+0x16>

c01006a9 <TaskHD>:
c01006a9:	55                   	push   %ebp
c01006aa:	89 e5                	mov    %esp,%ebp
c01006ac:	83 ec 18             	sub    $0x18,%esp
c01006af:	e8 ef fc ff ff       	call   c01003a3 <get_running_thread_pcb>
c01006b4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01006b7:	e8 32 00 00 00       	call   c01006ee <init_hd>
c01006bc:	83 ec 0c             	sub    $0xc,%esp
c01006bf:	6a 7c                	push   $0x7c
c01006c1:	e8 46 0e 00 00       	call   c010150c <sys_malloc>
c01006c6:	83 c4 10             	add    $0x10,%esp
c01006c9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01006cc:	83 ec 04             	sub    $0x4,%esp
c01006cf:	6a 7c                	push   $0x7c
c01006d1:	6a 00                	push   $0x0
c01006d3:	ff 75 f0             	pushl  -0x10(%ebp)
c01006d6:	e8 10 ab 00 00       	call   c010b1eb <Memset>
c01006db:	83 c4 10             	add    $0x10,%esp
c01006de:	83 ec 0c             	sub    $0xc,%esp
c01006e1:	ff 75 f0             	pushl  -0x10(%ebp)
c01006e4:	e8 1f 00 00 00       	call   c0100708 <hd_handle>
c01006e9:	83 c4 10             	add    $0x10,%esp
c01006ec:	eb de                	jmp    c01006cc <TaskHD+0x23>

c01006ee <init_hd>:
c01006ee:	55                   	push   %ebp
c01006ef:	89 e5                	mov    %esp,%ebp
c01006f1:	83 ec 18             	sub    $0x18,%esp
c01006f4:	c7 45 f4 75 04 00 00 	movl   $0x475,-0xc(%ebp)
c01006fb:	e8 5f fc ff ff       	call   c010035f <enable_8259A_casecade_irq>
c0100700:	e8 6e fc ff ff       	call   c0100373 <enable_8259A_slave_winchester_irq>
c0100705:	90                   	nop
c0100706:	c9                   	leave  
c0100707:	c3                   	ret    

c0100708 <hd_handle>:
c0100708:	55                   	push   %ebp
c0100709:	89 e5                	mov    %esp,%ebp
c010070b:	83 ec 18             	sub    $0x18,%esp
c010070e:	83 ec 04             	sub    $0x4,%esp
c0100711:	6a 12                	push   $0x12
c0100713:	ff 75 08             	pushl  0x8(%ebp)
c0100716:	6a 02                	push   $0x2
c0100718:	e8 0b 8b 00 00       	call   c0109228 <send_rec>
c010071d:	83 c4 10             	add    $0x10,%esp
c0100720:	8b 45 08             	mov    0x8(%ebp),%eax
c0100723:	8b 40 78             	mov    0x78(%eax),%eax
c0100726:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0100729:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010072d:	0f 84 d4 00 00 00    	je     c0100807 <hd_handle+0xff>
c0100733:	8b 45 08             	mov    0x8(%ebp),%eax
c0100736:	8b 00                	mov    (%eax),%eax
c0100738:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010073b:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c010073f:	74 28                	je     c0100769 <hd_handle+0x61>
c0100741:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c0100745:	74 22                	je     c0100769 <hd_handle+0x61>
c0100747:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c010074b:	74 1c                	je     c0100769 <hd_handle+0x61>
c010074d:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c0100751:	74 16                	je     c0100769 <hd_handle+0x61>
c0100753:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c010075a:	74 0d                	je     c0100769 <hd_handle+0x61>
c010075c:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c0100763:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100766:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0100769:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c010076d:	74 34                	je     c01007a3 <hd_handle+0x9b>
c010076f:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c0100773:	74 2e                	je     c01007a3 <hd_handle+0x9b>
c0100775:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c0100779:	74 28                	je     c01007a3 <hd_handle+0x9b>
c010077b:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c010077f:	74 22                	je     c01007a3 <hd_handle+0x9b>
c0100781:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c0100788:	74 19                	je     c01007a3 <hd_handle+0x9b>
c010078a:	6a 6d                	push   $0x6d
c010078c:	68 d0 a2 10 c0       	push   $0xc010a2d0
c0100791:	68 d0 a2 10 c0       	push   $0xc010a2d0
c0100796:	68 d8 a2 10 c0       	push   $0xc010a2d8
c010079b:	e8 18 7e 00 00       	call   c01085b8 <assertion_failure>
c01007a0:	83 c4 10             	add    $0x10,%esp
c01007a3:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c01007a7:	74 2c                	je     c01007d5 <hd_handle+0xcd>
c01007a9:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c01007ad:	77 0e                	ja     c01007bd <hd_handle+0xb5>
c01007af:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c01007b3:	74 19                	je     c01007ce <hd_handle+0xc6>
c01007b5:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c01007b9:	74 1a                	je     c01007d5 <hd_handle+0xcd>
c01007bb:	eb 37                	jmp    c01007f4 <hd_handle+0xec>
c01007bd:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c01007c1:	74 22                	je     c01007e5 <hd_handle+0xdd>
c01007c3:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c01007ca:	74 3e                	je     c010080a <hd_handle+0x102>
c01007cc:	eb 26                	jmp    c01007f4 <hd_handle+0xec>
c01007ce:	e8 e6 06 00 00       	call   c0100eb9 <hd_open>
c01007d3:	eb 36                	jmp    c010080b <hd_handle+0x103>
c01007d5:	83 ec 0c             	sub    $0xc,%esp
c01007d8:	ff 75 08             	pushl  0x8(%ebp)
c01007db:	e8 b2 08 00 00       	call   c0101092 <hd_rdwt>
c01007e0:	83 c4 10             	add    $0x10,%esp
c01007e3:	eb 26                	jmp    c010080b <hd_handle+0x103>
c01007e5:	83 ec 0c             	sub    $0xc,%esp
c01007e8:	6a 00                	push   $0x0
c01007ea:	e8 71 07 00 00       	call   c0100f60 <get_hd_ioctl>
c01007ef:	83 c4 10             	add    $0x10,%esp
c01007f2:	eb 17                	jmp    c010080b <hd_handle+0x103>
c01007f4:	83 ec 0c             	sub    $0xc,%esp
c01007f7:	68 32 a3 10 c0       	push   $0xc010a332
c01007fc:	e8 73 7d 00 00       	call   c0108574 <spin>
c0100801:	83 c4 10             	add    $0x10,%esp
c0100804:	90                   	nop
c0100805:	eb 04                	jmp    c010080b <hd_handle+0x103>
c0100807:	90                   	nop
c0100808:	eb 01                	jmp    c010080b <hd_handle+0x103>
c010080a:	90                   	nop
c010080b:	c9                   	leave  
c010080c:	c3                   	ret    

c010080d <hd_cmd_out>:
c010080d:	55                   	push   %ebp
c010080e:	89 e5                	mov    %esp,%ebp
c0100810:	83 ec 08             	sub    $0x8,%esp
c0100813:	83 ec 04             	sub    $0x4,%esp
c0100816:	68 18 73 01 00       	push   $0x17318
c010081b:	6a 00                	push   $0x0
c010081d:	68 80 00 00 00       	push   $0x80
c0100822:	e8 36 0b 00 00       	call   c010135d <waitfor>
c0100827:	83 c4 10             	add    $0x10,%esp
c010082a:	85 c0                	test   %eax,%eax
c010082c:	75 10                	jne    c010083e <hd_cmd_out+0x31>
c010082e:	83 ec 0c             	sub    $0xc,%esp
c0100831:	68 44 a3 10 c0       	push   $0xc010a344
c0100836:	e8 5f 7d 00 00       	call   c010859a <panic>
c010083b:	83 c4 10             	add    $0x10,%esp
c010083e:	83 ec 08             	sub    $0x8,%esp
c0100841:	6a 00                	push   $0x0
c0100843:	68 f6 03 00 00       	push   $0x3f6
c0100848:	e8 58 fa ff ff       	call   c01002a5 <out_byte>
c010084d:	83 c4 10             	add    $0x10,%esp
c0100850:	8b 45 08             	mov    0x8(%ebp),%eax
c0100853:	0f b6 00             	movzbl (%eax),%eax
c0100856:	0f b6 c0             	movzbl %al,%eax
c0100859:	83 ec 08             	sub    $0x8,%esp
c010085c:	50                   	push   %eax
c010085d:	68 f1 01 00 00       	push   $0x1f1
c0100862:	e8 3e fa ff ff       	call   c01002a5 <out_byte>
c0100867:	83 c4 10             	add    $0x10,%esp
c010086a:	8b 45 08             	mov    0x8(%ebp),%eax
c010086d:	0f b6 40 01          	movzbl 0x1(%eax),%eax
c0100871:	0f b6 c0             	movzbl %al,%eax
c0100874:	83 ec 08             	sub    $0x8,%esp
c0100877:	50                   	push   %eax
c0100878:	68 f2 01 00 00       	push   $0x1f2
c010087d:	e8 23 fa ff ff       	call   c01002a5 <out_byte>
c0100882:	83 c4 10             	add    $0x10,%esp
c0100885:	8b 45 08             	mov    0x8(%ebp),%eax
c0100888:	0f b6 40 02          	movzbl 0x2(%eax),%eax
c010088c:	0f b6 c0             	movzbl %al,%eax
c010088f:	83 ec 08             	sub    $0x8,%esp
c0100892:	50                   	push   %eax
c0100893:	68 f3 01 00 00       	push   $0x1f3
c0100898:	e8 08 fa ff ff       	call   c01002a5 <out_byte>
c010089d:	83 c4 10             	add    $0x10,%esp
c01008a0:	8b 45 08             	mov    0x8(%ebp),%eax
c01008a3:	0f b6 40 03          	movzbl 0x3(%eax),%eax
c01008a7:	0f b6 c0             	movzbl %al,%eax
c01008aa:	83 ec 08             	sub    $0x8,%esp
c01008ad:	50                   	push   %eax
c01008ae:	68 f4 01 00 00       	push   $0x1f4
c01008b3:	e8 ed f9 ff ff       	call   c01002a5 <out_byte>
c01008b8:	83 c4 10             	add    $0x10,%esp
c01008bb:	8b 45 08             	mov    0x8(%ebp),%eax
c01008be:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c01008c2:	0f b6 c0             	movzbl %al,%eax
c01008c5:	83 ec 08             	sub    $0x8,%esp
c01008c8:	50                   	push   %eax
c01008c9:	68 f5 01 00 00       	push   $0x1f5
c01008ce:	e8 d2 f9 ff ff       	call   c01002a5 <out_byte>
c01008d3:	83 c4 10             	add    $0x10,%esp
c01008d6:	8b 45 08             	mov    0x8(%ebp),%eax
c01008d9:	0f b6 40 05          	movzbl 0x5(%eax),%eax
c01008dd:	0f b6 c0             	movzbl %al,%eax
c01008e0:	83 ec 08             	sub    $0x8,%esp
c01008e3:	50                   	push   %eax
c01008e4:	68 f6 01 00 00       	push   $0x1f6
c01008e9:	e8 b7 f9 ff ff       	call   c01002a5 <out_byte>
c01008ee:	83 c4 10             	add    $0x10,%esp
c01008f1:	8b 45 08             	mov    0x8(%ebp),%eax
c01008f4:	0f b6 40 06          	movzbl 0x6(%eax),%eax
c01008f8:	0f b6 c0             	movzbl %al,%eax
c01008fb:	83 ec 08             	sub    $0x8,%esp
c01008fe:	50                   	push   %eax
c01008ff:	68 f7 01 00 00       	push   $0x1f7
c0100904:	e8 9c f9 ff ff       	call   c01002a5 <out_byte>
c0100909:	83 c4 10             	add    $0x10,%esp
c010090c:	90                   	nop
c010090d:	c9                   	leave  
c010090e:	c3                   	ret    

c010090f <hd_identify>:
c010090f:	55                   	push   %ebp
c0100910:	89 e5                	mov    %esp,%ebp
c0100912:	53                   	push   %ebx
c0100913:	83 ec 24             	sub    $0x24,%esp
c0100916:	89 e0                	mov    %esp,%eax
c0100918:	89 c3                	mov    %eax,%ebx
c010091a:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
c010091e:	c6 45 e6 01          	movb   $0x1,-0x1a(%ebp)
c0100922:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
c0100926:	c6 45 e8 00          	movb   $0x0,-0x18(%ebp)
c010092a:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c010092e:	8b 45 08             	mov    0x8(%ebp),%eax
c0100931:	c1 e0 04             	shl    $0x4,%eax
c0100934:	83 c8 e0             	or     $0xffffffe0,%eax
c0100937:	88 45 ea             	mov    %al,-0x16(%ebp)
c010093a:	c6 45 eb ec          	movb   $0xec,-0x15(%ebp)
c010093e:	83 ec 0c             	sub    $0xc,%esp
c0100941:	8d 45 e5             	lea    -0x1b(%ebp),%eax
c0100944:	50                   	push   %eax
c0100945:	e8 c3 fe ff ff       	call   c010080d <hd_cmd_out>
c010094a:	83 c4 10             	add    $0x10,%esp
c010094d:	e8 f0 06 00 00       	call   c0101042 <interrupt_wait>
c0100952:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c0100959:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010095c:	8d 50 ff             	lea    -0x1(%eax),%edx
c010095f:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0100962:	89 c2                	mov    %eax,%edx
c0100964:	b8 10 00 00 00       	mov    $0x10,%eax
c0100969:	83 e8 01             	sub    $0x1,%eax
c010096c:	01 d0                	add    %edx,%eax
c010096e:	b9 10 00 00 00       	mov    $0x10,%ecx
c0100973:	ba 00 00 00 00       	mov    $0x0,%edx
c0100978:	f7 f1                	div    %ecx
c010097a:	6b c0 10             	imul   $0x10,%eax,%eax
c010097d:	29 c4                	sub    %eax,%esp
c010097f:	89 e0                	mov    %esp,%eax
c0100981:	83 c0 00             	add    $0x0,%eax
c0100984:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0100987:	83 ec 04             	sub    $0x4,%esp
c010098a:	ff 75 f4             	pushl  -0xc(%ebp)
c010098d:	6a 00                	push   $0x0
c010098f:	ff 75 ec             	pushl  -0x14(%ebp)
c0100992:	e8 54 a8 00 00       	call   c010b1eb <Memset>
c0100997:	83 c4 10             	add    $0x10,%esp
c010099a:	83 ec 04             	sub    $0x4,%esp
c010099d:	ff 75 f4             	pushl  -0xc(%ebp)
c01009a0:	ff 75 ec             	pushl  -0x14(%ebp)
c01009a3:	68 f0 01 00 00       	push   $0x1f0
c01009a8:	e8 92 a8 00 00       	call   c010b23f <read_port>
c01009ad:	83 c4 10             	add    $0x10,%esp
c01009b0:	83 ec 0c             	sub    $0xc,%esp
c01009b3:	ff 75 ec             	pushl  -0x14(%ebp)
c01009b6:	e8 0b 00 00 00       	call   c01009c6 <print_hdinfo>
c01009bb:	83 c4 10             	add    $0x10,%esp
c01009be:	89 dc                	mov    %ebx,%esp
c01009c0:	90                   	nop
c01009c1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01009c4:	c9                   	leave  
c01009c5:	c3                   	ret    

c01009c6 <print_hdinfo>:
c01009c6:	55                   	push   %ebp
c01009c7:	89 e5                	mov    %esp,%ebp
c01009c9:	81 ec 88 00 00 00    	sub    $0x88,%esp
c01009cf:	66 c7 45 b4 0a 00    	movw   $0xa,-0x4c(%ebp)
c01009d5:	66 c7 45 b6 14 00    	movw   $0x14,-0x4a(%ebp)
c01009db:	c7 45 b8 53 65 72 69 	movl   $0x69726553,-0x48(%ebp)
c01009e2:	c7 45 bc 61 6c 20 4e 	movl   $0x4e206c61,-0x44(%ebp)
c01009e9:	c7 45 c0 75 6d 62 65 	movl   $0x65626d75,-0x40(%ebp)
c01009f0:	c7 45 c4 72 00 00 00 	movl   $0x72,-0x3c(%ebp)
c01009f7:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c01009fe:	66 c7 45 cc 1b 00    	movw   $0x1b,-0x34(%ebp)
c0100a04:	66 c7 45 ce 28 00    	movw   $0x28,-0x32(%ebp)
c0100a0a:	c7 45 d0 4d 6f 64 65 	movl   $0x65646f4d,-0x30(%ebp)
c0100a11:	c7 45 d4 6c 20 4e 75 	movl   $0x754e206c,-0x2c(%ebp)
c0100a18:	c7 45 d8 6d 62 65 72 	movl   $0x7265626d,-0x28(%ebp)
c0100a1f:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0100a26:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0100a2d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100a34:	e9 8f 00 00 00       	jmp    c0100ac8 <print_hdinfo+0x102>
c0100a39:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0100a40:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100a43:	89 d0                	mov    %edx,%eax
c0100a45:	01 c0                	add    %eax,%eax
c0100a47:	01 d0                	add    %edx,%eax
c0100a49:	c1 e0 03             	shl    $0x3,%eax
c0100a4c:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100a4f:	01 c8                	add    %ecx,%eax
c0100a51:	83 e8 44             	sub    $0x44,%eax
c0100a54:	0f b7 00             	movzwl (%eax),%eax
c0100a57:	0f b7 c0             	movzwl %ax,%eax
c0100a5a:	8d 14 00             	lea    (%eax,%eax,1),%edx
c0100a5d:	8b 45 08             	mov    0x8(%ebp),%eax
c0100a60:	01 d0                	add    %edx,%eax
c0100a62:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0100a65:	eb 30                	jmp    c0100a97 <print_hdinfo+0xd1>
c0100a67:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100a6a:	8d 50 01             	lea    0x1(%eax),%edx
c0100a6d:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0100a70:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0100a73:	83 c2 01             	add    $0x1,%edx
c0100a76:	0f b6 00             	movzbl (%eax),%eax
c0100a79:	88 44 15 81          	mov    %al,-0x7f(%ebp,%edx,1)
c0100a7d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100a80:	8d 50 01             	lea    0x1(%eax),%edx
c0100a83:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0100a86:	0f b6 00             	movzbl (%eax),%eax
c0100a89:	8d 4d 81             	lea    -0x7f(%ebp),%ecx
c0100a8c:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0100a8f:	01 ca                	add    %ecx,%edx
c0100a91:	88 02                	mov    %al,(%edx)
c0100a93:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0100a97:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100a9a:	89 d0                	mov    %edx,%eax
c0100a9c:	01 c0                	add    %eax,%eax
c0100a9e:	01 d0                	add    %edx,%eax
c0100aa0:	c1 e0 03             	shl    $0x3,%eax
c0100aa3:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100aa6:	01 c8                	add    %ecx,%eax
c0100aa8:	83 e8 42             	sub    $0x42,%eax
c0100aab:	0f b7 00             	movzwl (%eax),%eax
c0100aae:	66 d1 e8             	shr    %ax
c0100ab1:	0f b7 c0             	movzwl %ax,%eax
c0100ab4:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0100ab7:	7c ae                	jl     c0100a67 <print_hdinfo+0xa1>
c0100ab9:	8d 55 81             	lea    -0x7f(%ebp),%edx
c0100abc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100abf:	01 d0                	add    %edx,%eax
c0100ac1:	c6 00 00             	movb   $0x0,(%eax)
c0100ac4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0100ac8:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0100acc:	0f 8e 67 ff ff ff    	jle    c0100a39 <print_hdinfo+0x73>
c0100ad2:	8b 45 08             	mov    0x8(%ebp),%eax
c0100ad5:	0f b7 40 62          	movzwl 0x62(%eax),%eax
c0100ad9:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
c0100add:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0100ae1:	66 c1 e8 08          	shr    $0x8,%ax
c0100ae5:	66 85 c0             	test   %ax,%ax
c0100ae8:	0f 95 c0             	setne  %al
c0100aeb:	88 45 e9             	mov    %al,-0x17(%ebp)
c0100aee:	c7 45 ac 59 65 73 00 	movl   $0x736559,-0x54(%ebp)
c0100af5:	66 c7 45 a9 4e 6f    	movw   $0x6f4e,-0x57(%ebp)
c0100afb:	c6 45 ab 00          	movb   $0x0,-0x55(%ebp)
c0100aff:	80 7d e9 01          	cmpb   $0x1,-0x17(%ebp)
c0100b03:	75 15                	jne    c0100b1a <print_hdinfo+0x154>
c0100b05:	83 ec 08             	sub    $0x8,%esp
c0100b08:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0100b0b:	50                   	push   %eax
c0100b0c:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0100b0f:	50                   	push   %eax
c0100b10:	e8 f5 a6 00 00       	call   c010b20a <Strcpy>
c0100b15:	83 c4 10             	add    $0x10,%esp
c0100b18:	eb 13                	jmp    c0100b2d <print_hdinfo+0x167>
c0100b1a:	83 ec 08             	sub    $0x8,%esp
c0100b1d:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0100b20:	50                   	push   %eax
c0100b21:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0100b24:	50                   	push   %eax
c0100b25:	e8 e0 a6 00 00       	call   c010b20a <Strcpy>
c0100b2a:	83 c4 10             	add    $0x10,%esp
c0100b2d:	8b 45 08             	mov    0x8(%ebp),%eax
c0100b30:	83 c0 7a             	add    $0x7a,%eax
c0100b33:	0f b7 00             	movzwl (%eax),%eax
c0100b36:	0f b7 d0             	movzwl %ax,%edx
c0100b39:	8b 45 08             	mov    0x8(%ebp),%eax
c0100b3c:	83 c0 78             	add    $0x78,%eax
c0100b3f:	0f b7 00             	movzwl (%eax),%eax
c0100b42:	0f b7 c0             	movzwl %ax,%eax
c0100b45:	83 c0 10             	add    $0x10,%eax
c0100b48:	89 c1                	mov    %eax,%ecx
c0100b4a:	d3 e2                	shl    %cl,%edx
c0100b4c:	89 d0                	mov    %edx,%eax
c0100b4e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0100b51:	90                   	nop
c0100b52:	c9                   	leave  
c0100b53:	c3                   	ret    

c0100b54 <print_dpt_entry>:
c0100b54:	55                   	push   %ebp
c0100b55:	89 e5                	mov    %esp,%ebp
c0100b57:	83 ec 08             	sub    $0x8,%esp
c0100b5a:	8b 45 08             	mov    0x8(%ebp),%eax
c0100b5d:	8b 40 08             	mov    0x8(%eax),%eax
c0100b60:	83 ec 08             	sub    $0x8,%esp
c0100b63:	50                   	push   %eax
c0100b64:	68 4e a3 10 c0       	push   $0xc010a34e
c0100b69:	e8 ed 76 00 00       	call   c010825b <Printf>
c0100b6e:	83 c4 10             	add    $0x10,%esp
c0100b71:	8b 45 08             	mov    0x8(%ebp),%eax
c0100b74:	8b 40 0c             	mov    0xc(%eax),%eax
c0100b77:	83 ec 08             	sub    $0x8,%esp
c0100b7a:	50                   	push   %eax
c0100b7b:	68 56 a3 10 c0       	push   $0xc010a356
c0100b80:	e8 d6 76 00 00       	call   c010825b <Printf>
c0100b85:	83 c4 10             	add    $0x10,%esp
c0100b88:	8b 45 08             	mov    0x8(%ebp),%eax
c0100b8b:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0100b8f:	0f b6 c0             	movzbl %al,%eax
c0100b92:	83 ec 08             	sub    $0x8,%esp
c0100b95:	50                   	push   %eax
c0100b96:	68 67 a3 10 c0       	push   $0xc010a367
c0100b9b:	e8 bb 76 00 00       	call   c010825b <Printf>
c0100ba0:	83 c4 10             	add    $0x10,%esp
c0100ba3:	8b 45 08             	mov    0x8(%ebp),%eax
c0100ba6:	0f b6 00             	movzbl (%eax),%eax
c0100ba9:	0f b6 c0             	movzbl %al,%eax
c0100bac:	83 ec 08             	sub    $0x8,%esp
c0100baf:	50                   	push   %eax
c0100bb0:	68 75 a3 10 c0       	push   $0xc010a375
c0100bb5:	e8 a1 76 00 00       	call   c010825b <Printf>
c0100bba:	83 c4 10             	add    $0x10,%esp
c0100bbd:	90                   	nop
c0100bbe:	c9                   	leave  
c0100bbf:	c3                   	ret    

c0100bc0 <get_partition_table>:
c0100bc0:	55                   	push   %ebp
c0100bc1:	89 e5                	mov    %esp,%ebp
c0100bc3:	53                   	push   %ebx
c0100bc4:	83 ec 24             	sub    $0x24,%esp
c0100bc7:	89 e0                	mov    %esp,%eax
c0100bc9:	89 c3                	mov    %eax,%ebx
c0100bcb:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
c0100bcf:	c6 45 e2 01          	movb   $0x1,-0x1e(%ebp)
c0100bd3:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100bd6:	88 45 e3             	mov    %al,-0x1d(%ebp)
c0100bd9:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100bdc:	c1 f8 08             	sar    $0x8,%eax
c0100bdf:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0100be2:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100be5:	c1 f8 10             	sar    $0x10,%eax
c0100be8:	88 45 e5             	mov    %al,-0x1b(%ebp)
c0100beb:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100bee:	c1 f8 18             	sar    $0x18,%eax
c0100bf1:	89 c2                	mov    %eax,%edx
c0100bf3:	8b 45 08             	mov    0x8(%ebp),%eax
c0100bf6:	c1 e0 04             	shl    $0x4,%eax
c0100bf9:	09 d0                	or     %edx,%eax
c0100bfb:	83 c8 e0             	or     $0xffffffe0,%eax
c0100bfe:	88 45 e6             	mov    %al,-0x1a(%ebp)
c0100c01:	c6 45 e7 20          	movb   $0x20,-0x19(%ebp)
c0100c05:	83 ec 0c             	sub    $0xc,%esp
c0100c08:	8d 45 e1             	lea    -0x1f(%ebp),%eax
c0100c0b:	50                   	push   %eax
c0100c0c:	e8 fc fb ff ff       	call   c010080d <hd_cmd_out>
c0100c11:	83 c4 10             	add    $0x10,%esp
c0100c14:	e8 29 04 00 00       	call   c0101042 <interrupt_wait>
c0100c19:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c0100c20:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100c23:	8d 50 ff             	lea    -0x1(%eax),%edx
c0100c26:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0100c29:	89 c2                	mov    %eax,%edx
c0100c2b:	b8 10 00 00 00       	mov    $0x10,%eax
c0100c30:	83 e8 01             	sub    $0x1,%eax
c0100c33:	01 d0                	add    %edx,%eax
c0100c35:	b9 10 00 00 00       	mov    $0x10,%ecx
c0100c3a:	ba 00 00 00 00       	mov    $0x0,%edx
c0100c3f:	f7 f1                	div    %ecx
c0100c41:	6b c0 10             	imul   $0x10,%eax,%eax
c0100c44:	29 c4                	sub    %eax,%esp
c0100c46:	89 e0                	mov    %esp,%eax
c0100c48:	83 c0 00             	add    $0x0,%eax
c0100c4b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0100c4e:	83 ec 04             	sub    $0x4,%esp
c0100c51:	ff 75 f4             	pushl  -0xc(%ebp)
c0100c54:	6a 00                	push   $0x0
c0100c56:	ff 75 ec             	pushl  -0x14(%ebp)
c0100c59:	e8 8d a5 00 00       	call   c010b1eb <Memset>
c0100c5e:	83 c4 10             	add    $0x10,%esp
c0100c61:	83 ec 04             	sub    $0x4,%esp
c0100c64:	ff 75 f4             	pushl  -0xc(%ebp)
c0100c67:	ff 75 ec             	pushl  -0x14(%ebp)
c0100c6a:	68 f0 01 00 00       	push   $0x1f0
c0100c6f:	e8 cb a5 00 00       	call   c010b23f <read_port>
c0100c74:	83 c4 10             	add    $0x10,%esp
c0100c77:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100c7a:	05 be 01 00 00       	add    $0x1be,%eax
c0100c7f:	83 ec 04             	sub    $0x4,%esp
c0100c82:	6a 40                	push   $0x40
c0100c84:	50                   	push   %eax
c0100c85:	ff 75 10             	pushl  0x10(%ebp)
c0100c88:	e8 fc 5e 00 00       	call   c0106b89 <Memcpy>
c0100c8d:	83 c4 10             	add    $0x10,%esp
c0100c90:	c7 45 e8 05 00 00 00 	movl   $0x5,-0x18(%ebp)
c0100c97:	89 dc                	mov    %ebx,%esp
c0100c99:	90                   	nop
c0100c9a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100c9d:	c9                   	leave  
c0100c9e:	c3                   	ret    

c0100c9f <partition>:
c0100c9f:	55                   	push   %ebp
c0100ca0:	89 e5                	mov    %esp,%ebp
c0100ca2:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0100ca8:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100cab:	88 45 84             	mov    %al,-0x7c(%ebp)
c0100cae:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c0100cb2:	7f 19                	jg     c0100ccd <partition+0x2e>
c0100cb4:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0100cb7:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0100cbc:	89 c8                	mov    %ecx,%eax
c0100cbe:	f7 ea                	imul   %edx
c0100cc0:	d1 fa                	sar    %edx
c0100cc2:	89 c8                	mov    %ecx,%eax
c0100cc4:	c1 f8 1f             	sar    $0x1f,%eax
c0100cc7:	29 c2                	sub    %eax,%edx
c0100cc9:	89 d0                	mov    %edx,%eax
c0100ccb:	eb 11                	jmp    c0100cde <partition+0x3f>
c0100ccd:	8b 45 08             	mov    0x8(%ebp),%eax
c0100cd0:	83 e8 10             	sub    $0x10,%eax
c0100cd3:	8d 50 3f             	lea    0x3f(%eax),%edx
c0100cd6:	85 c0                	test   %eax,%eax
c0100cd8:	0f 48 c2             	cmovs  %edx,%eax
c0100cdb:	c1 f8 06             	sar    $0x6,%eax
c0100cde:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0100ce1:	80 7d 84 00          	cmpb   $0x0,-0x7c(%ebp)
c0100ce5:	0f 85 cc 00 00 00    	jne    c0100db7 <partition+0x118>
c0100ceb:	83 ec 04             	sub    $0x4,%esp
c0100cee:	6a 40                	push   $0x40
c0100cf0:	6a 00                	push   $0x0
c0100cf2:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100cf5:	50                   	push   %eax
c0100cf6:	e8 f0 a4 00 00       	call   c010b1eb <Memset>
c0100cfb:	83 c4 10             	add    $0x10,%esp
c0100cfe:	83 ec 04             	sub    $0x4,%esp
c0100d01:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100d04:	50                   	push   %eax
c0100d05:	6a 00                	push   $0x0
c0100d07:	ff 75 e8             	pushl  -0x18(%ebp)
c0100d0a:	e8 b1 fe ff ff       	call   c0100bc0 <get_partition_table>
c0100d0f:	83 c4 10             	add    $0x10,%esp
c0100d12:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100d19:	e9 8a 00 00 00       	jmp    c0100da8 <partition+0x109>
c0100d1e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100d21:	83 c0 01             	add    $0x1,%eax
c0100d24:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0100d27:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100d2a:	c1 e0 04             	shl    $0x4,%eax
c0100d2d:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100d30:	01 c8                	add    %ecx,%eax
c0100d32:	83 e8 5c             	sub    $0x5c,%eax
c0100d35:	8b 00                	mov    (%eax),%eax
c0100d37:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0100d3a:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0100d3d:	c1 e1 03             	shl    $0x3,%ecx
c0100d40:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0100d46:	01 ca                	add    %ecx,%edx
c0100d48:	81 c2 44 0f 11 c0    	add    $0xc0110f44,%edx
c0100d4e:	89 02                	mov    %eax,(%edx)
c0100d50:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100d53:	c1 e0 04             	shl    $0x4,%eax
c0100d56:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100d59:	01 c8                	add    %ecx,%eax
c0100d5b:	83 e8 58             	sub    $0x58,%eax
c0100d5e:	8b 00                	mov    (%eax),%eax
c0100d60:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0100d63:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0100d66:	c1 e1 03             	shl    $0x3,%ecx
c0100d69:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0100d6f:	01 ca                	add    %ecx,%edx
c0100d71:	81 c2 48 0f 11 c0    	add    $0xc0110f48,%edx
c0100d77:	89 02                	mov    %eax,(%edx)
c0100d79:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100d7c:	c1 e0 04             	shl    $0x4,%eax
c0100d7f:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100d82:	01 c8                	add    %ecx,%eax
c0100d84:	83 e8 60             	sub    $0x60,%eax
c0100d87:	0f b6 00             	movzbl (%eax),%eax
c0100d8a:	3c 05                	cmp    $0x5,%al
c0100d8c:	75 16                	jne    c0100da4 <partition+0x105>
c0100d8e:	8b 55 08             	mov    0x8(%ebp),%edx
c0100d91:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100d94:	01 d0                	add    %edx,%eax
c0100d96:	83 ec 08             	sub    $0x8,%esp
c0100d99:	6a 01                	push   $0x1
c0100d9b:	50                   	push   %eax
c0100d9c:	e8 fe fe ff ff       	call   c0100c9f <partition>
c0100da1:	83 c4 10             	add    $0x10,%esp
c0100da4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0100da8:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c0100dac:	0f 8e 6c ff ff ff    	jle    c0100d1e <partition+0x7f>
c0100db2:	e9 ff 00 00 00       	jmp    c0100eb6 <partition+0x217>
c0100db7:	80 7d 84 01          	cmpb   $0x1,-0x7c(%ebp)
c0100dbb:	0f 85 f5 00 00 00    	jne    c0100eb6 <partition+0x217>
c0100dc1:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0100dc4:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0100dc9:	89 c8                	mov    %ecx,%eax
c0100dcb:	f7 ea                	imul   %edx
c0100dcd:	d1 fa                	sar    %edx
c0100dcf:	89 c8                	mov    %ecx,%eax
c0100dd1:	c1 f8 1f             	sar    $0x1f,%eax
c0100dd4:	29 c2                	sub    %eax,%edx
c0100dd6:	89 d0                	mov    %edx,%eax
c0100dd8:	c1 e0 02             	shl    $0x2,%eax
c0100ddb:	01 d0                	add    %edx,%eax
c0100ddd:	29 c1                	sub    %eax,%ecx
c0100ddf:	89 c8                	mov    %ecx,%eax
c0100de1:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0100de4:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0100de7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100dea:	c1 e2 03             	shl    $0x3,%edx
c0100ded:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0100df3:	01 d0                	add    %edx,%eax
c0100df5:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c0100dfa:	8b 00                	mov    (%eax),%eax
c0100dfc:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0100dff:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0100e02:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100e05:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0100e08:	83 e8 01             	sub    $0x1,%eax
c0100e0b:	c1 e0 04             	shl    $0x4,%eax
c0100e0e:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0100e11:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0100e18:	e9 8c 00 00 00       	jmp    c0100ea9 <partition+0x20a>
c0100e1d:	83 ec 04             	sub    $0x4,%esp
c0100e20:	6a 40                	push   $0x40
c0100e22:	6a 00                	push   $0x0
c0100e24:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100e27:	50                   	push   %eax
c0100e28:	e8 be a3 00 00       	call   c010b1eb <Memset>
c0100e2d:	83 c4 10             	add    $0x10,%esp
c0100e30:	83 ec 04             	sub    $0x4,%esp
c0100e33:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100e36:	50                   	push   %eax
c0100e37:	ff 75 f0             	pushl  -0x10(%ebp)
c0100e3a:	ff 75 e8             	pushl  -0x18(%ebp)
c0100e3d:	e8 7e fd ff ff       	call   c0100bc0 <get_partition_table>
c0100e42:	83 c4 10             	add    $0x10,%esp
c0100e45:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0100e48:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100e4b:	01 d0                	add    %edx,%eax
c0100e4d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0100e50:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0100e53:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100e56:	01 c2                	add    %eax,%edx
c0100e58:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0100e5b:	8d 48 04             	lea    0x4(%eax),%ecx
c0100e5e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100e61:	c1 e1 03             	shl    $0x3,%ecx
c0100e64:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0100e6a:	01 c8                	add    %ecx,%eax
c0100e6c:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c0100e71:	89 10                	mov    %edx,(%eax)
c0100e73:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0100e76:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0100e79:	8d 4a 04             	lea    0x4(%edx),%ecx
c0100e7c:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0100e7f:	c1 e1 03             	shl    $0x3,%ecx
c0100e82:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0100e88:	01 ca                	add    %ecx,%edx
c0100e8a:	81 c2 48 0f 11 c0    	add    $0xc0110f48,%edx
c0100e90:	89 02                	mov    %eax,(%edx)
c0100e92:	0f b6 45 a8          	movzbl -0x58(%ebp),%eax
c0100e96:	84 c0                	test   %al,%al
c0100e98:	74 1b                	je     c0100eb5 <partition+0x216>
c0100e9a:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0100e9d:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0100ea0:	01 d0                	add    %edx,%eax
c0100ea2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100ea5:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0100ea9:	83 7d ec 0f          	cmpl   $0xf,-0x14(%ebp)
c0100ead:	0f 8e 6a ff ff ff    	jle    c0100e1d <partition+0x17e>
c0100eb3:	eb 01                	jmp    c0100eb6 <partition+0x217>
c0100eb5:	90                   	nop
c0100eb6:	90                   	nop
c0100eb7:	c9                   	leave  
c0100eb8:	c3                   	ret    

c0100eb9 <hd_open>:
c0100eb9:	55                   	push   %ebp
c0100eba:	89 e5                	mov    %esp,%ebp
c0100ebc:	83 ec 18             	sub    $0x18,%esp
c0100ebf:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100ec6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100ec9:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0100ecf:	05 40 0f 11 c0       	add    $0xc0110f40,%eax
c0100ed4:	8b 00                	mov    (%eax),%eax
c0100ed6:	8d 50 01             	lea    0x1(%eax),%edx
c0100ed9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100edc:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0100ee2:	05 40 0f 11 c0       	add    $0xc0110f40,%eax
c0100ee7:	89 10                	mov    %edx,(%eax)
c0100ee9:	83 ec 0c             	sub    $0xc,%esp
c0100eec:	6a 00                	push   $0x0
c0100eee:	e8 1c fa ff ff       	call   c010090f <hd_identify>
c0100ef3:	83 c4 10             	add    $0x10,%esp
c0100ef6:	83 ec 08             	sub    $0x8,%esp
c0100ef9:	6a 00                	push   $0x0
c0100efb:	6a 00                	push   $0x0
c0100efd:	e8 9d fd ff ff       	call   c0100c9f <partition>
c0100f02:	83 c4 10             	add    $0x10,%esp
c0100f05:	83 ec 0c             	sub    $0xc,%esp
c0100f08:	6a 7c                	push   $0x7c
c0100f0a:	e8 fd 05 00 00       	call   c010150c <sys_malloc>
c0100f0f:	83 c4 10             	add    $0x10,%esp
c0100f12:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100f15:	83 ec 04             	sub    $0x4,%esp
c0100f18:	6a 7c                	push   $0x7c
c0100f1a:	6a 00                	push   $0x0
c0100f1c:	ff 75 f0             	pushl  -0x10(%ebp)
c0100f1f:	e8 c7 a2 00 00       	call   c010b1eb <Memset>
c0100f24:	83 c4 10             	add    $0x10,%esp
c0100f27:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100f2a:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0100f31:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100f34:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0100f3b:	83 ec 04             	sub    $0x4,%esp
c0100f3e:	6a 02                	push   $0x2
c0100f40:	ff 75 f0             	pushl  -0x10(%ebp)
c0100f43:	6a 01                	push   $0x1
c0100f45:	e8 de 82 00 00       	call   c0109228 <send_rec>
c0100f4a:	83 c4 10             	add    $0x10,%esp
c0100f4d:	83 ec 08             	sub    $0x8,%esp
c0100f50:	6a 7c                	push   $0x7c
c0100f52:	ff 75 f0             	pushl  -0x10(%ebp)
c0100f55:	e8 c7 05 00 00       	call   c0101521 <sys_free>
c0100f5a:	83 c4 10             	add    $0x10,%esp
c0100f5d:	90                   	nop
c0100f5e:	c9                   	leave  
c0100f5f:	c3                   	ret    

c0100f60 <get_hd_ioctl>:
c0100f60:	55                   	push   %ebp
c0100f61:	89 e5                	mov    %esp,%ebp
c0100f63:	83 ec 18             	sub    $0x18,%esp
c0100f66:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c0100f6a:	7f 19                	jg     c0100f85 <get_hd_ioctl+0x25>
c0100f6c:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0100f6f:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0100f74:	89 c8                	mov    %ecx,%eax
c0100f76:	f7 ea                	imul   %edx
c0100f78:	d1 fa                	sar    %edx
c0100f7a:	89 c8                	mov    %ecx,%eax
c0100f7c:	c1 f8 1f             	sar    $0x1f,%eax
c0100f7f:	29 c2                	sub    %eax,%edx
c0100f81:	89 d0                	mov    %edx,%eax
c0100f83:	eb 11                	jmp    c0100f96 <get_hd_ioctl+0x36>
c0100f85:	8b 45 08             	mov    0x8(%ebp),%eax
c0100f88:	83 e8 10             	sub    $0x10,%eax
c0100f8b:	8d 50 3f             	lea    0x3f(%eax),%edx
c0100f8e:	85 c0                	test   %eax,%eax
c0100f90:	0f 48 c2             	cmovs  %edx,%eax
c0100f93:	c1 f8 06             	sar    $0x6,%eax
c0100f96:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0100f99:	8b 55 08             	mov    0x8(%ebp),%edx
c0100f9c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100f9f:	c1 e2 03             	shl    $0x3,%edx
c0100fa2:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0100fa8:	01 d0                	add    %edx,%eax
c0100faa:	05 48 0f 11 c0       	add    $0xc0110f48,%eax
c0100faf:	8b 00                	mov    (%eax),%eax
c0100fb1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100fb4:	83 ec 0c             	sub    $0xc,%esp
c0100fb7:	6a 7c                	push   $0x7c
c0100fb9:	e8 4e 05 00 00       	call   c010150c <sys_malloc>
c0100fbe:	83 c4 10             	add    $0x10,%esp
c0100fc1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0100fc4:	83 ec 04             	sub    $0x4,%esp
c0100fc7:	6a 7c                	push   $0x7c
c0100fc9:	6a 00                	push   $0x0
c0100fcb:	ff 75 ec             	pushl  -0x14(%ebp)
c0100fce:	e8 18 a2 00 00       	call   c010b1eb <Memset>
c0100fd3:	83 c4 10             	add    $0x10,%esp
c0100fd6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100fd9:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0100fe0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100fe3:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0100fea:	83 ec 04             	sub    $0x4,%esp
c0100fed:	6a 02                	push   $0x2
c0100fef:	ff 75 ec             	pushl  -0x14(%ebp)
c0100ff2:	6a 01                	push   $0x1
c0100ff4:	e8 2f 82 00 00       	call   c0109228 <send_rec>
c0100ff9:	83 c4 10             	add    $0x10,%esp
c0100ffc:	83 ec 08             	sub    $0x8,%esp
c0100fff:	6a 7c                	push   $0x7c
c0101001:	ff 75 ec             	pushl  -0x14(%ebp)
c0101004:	e8 18 05 00 00       	call   c0101521 <sys_free>
c0101009:	83 c4 10             	add    $0x10,%esp
c010100c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010100f:	c9                   	leave  
c0101010:	c3                   	ret    

c0101011 <wait_for>:
c0101011:	55                   	push   %ebp
c0101012:	89 e5                	mov    %esp,%ebp
c0101014:	83 ec 08             	sub    $0x8,%esp
c0101017:	83 ec 04             	sub    $0x4,%esp
c010101a:	68 50 c3 00 00       	push   $0xc350
c010101f:	6a 08                	push   $0x8
c0101021:	6a 08                	push   $0x8
c0101023:	e8 35 03 00 00       	call   c010135d <waitfor>
c0101028:	83 c4 10             	add    $0x10,%esp
c010102b:	85 c0                	test   %eax,%eax
c010102d:	75 10                	jne    c010103f <wait_for+0x2e>
c010102f:	83 ec 0c             	sub    $0xc,%esp
c0101032:	68 80 a3 10 c0       	push   $0xc010a380
c0101037:	e8 5e 75 00 00       	call   c010859a <panic>
c010103c:	83 c4 10             	add    $0x10,%esp
c010103f:	90                   	nop
c0101040:	c9                   	leave  
c0101041:	c3                   	ret    

c0101042 <interrupt_wait>:
c0101042:	55                   	push   %ebp
c0101043:	89 e5                	mov    %esp,%ebp
c0101045:	83 ec 18             	sub    $0x18,%esp
c0101048:	83 ec 0c             	sub    $0xc,%esp
c010104b:	6a 7c                	push   $0x7c
c010104d:	e8 ba 04 00 00       	call   c010150c <sys_malloc>
c0101052:	83 c4 10             	add    $0x10,%esp
c0101055:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101058:	83 ec 04             	sub    $0x4,%esp
c010105b:	6a 7c                	push   $0x7c
c010105d:	6a 00                	push   $0x0
c010105f:	ff 75 f4             	pushl  -0xc(%ebp)
c0101062:	e8 84 a1 00 00       	call   c010b1eb <Memset>
c0101067:	83 c4 10             	add    $0x10,%esp
c010106a:	83 ec 04             	sub    $0x4,%esp
c010106d:	68 13 02 00 00       	push   $0x213
c0101072:	ff 75 f4             	pushl  -0xc(%ebp)
c0101075:	6a 02                	push   $0x2
c0101077:	e8 ac 81 00 00       	call   c0109228 <send_rec>
c010107c:	83 c4 10             	add    $0x10,%esp
c010107f:	83 ec 08             	sub    $0x8,%esp
c0101082:	6a 7c                	push   $0x7c
c0101084:	ff 75 f4             	pushl  -0xc(%ebp)
c0101087:	e8 95 04 00 00       	call   c0101521 <sys_free>
c010108c:	83 c4 10             	add    $0x10,%esp
c010108f:	90                   	nop
c0101090:	c9                   	leave  
c0101091:	c3                   	ret    

c0101092 <hd_rdwt>:
c0101092:	55                   	push   %ebp
c0101093:	89 e5                	mov    %esp,%ebp
c0101095:	81 ec c8 00 00 00    	sub    $0xc8,%esp
c010109b:	8b 45 08             	mov    0x8(%ebp),%eax
c010109e:	8b 40 18             	mov    0x18(%eax),%eax
c01010a1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01010a4:	8b 45 08             	mov    0x8(%ebp),%eax
c01010a7:	8b 40 14             	mov    0x14(%eax),%eax
c01010aa:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01010ad:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c01010b1:	7f 19                	jg     c01010cc <hd_rdwt+0x3a>
c01010b3:	8b 4d e8             	mov    -0x18(%ebp),%ecx
c01010b6:	ba 67 66 66 66       	mov    $0x66666667,%edx
c01010bb:	89 c8                	mov    %ecx,%eax
c01010bd:	f7 ea                	imul   %edx
c01010bf:	d1 fa                	sar    %edx
c01010c1:	89 c8                	mov    %ecx,%eax
c01010c3:	c1 f8 1f             	sar    $0x1f,%eax
c01010c6:	29 c2                	sub    %eax,%edx
c01010c8:	89 d0                	mov    %edx,%eax
c01010ca:	eb 11                	jmp    c01010dd <hd_rdwt+0x4b>
c01010cc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01010cf:	83 e8 10             	sub    $0x10,%eax
c01010d2:	8d 50 3f             	lea    0x3f(%eax),%edx
c01010d5:	85 c0                	test   %eax,%eax
c01010d7:	0f 48 c2             	cmovs  %edx,%eax
c01010da:	c1 f8 06             	sar    $0x6,%eax
c01010dd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01010e0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01010e3:	8d 50 f0             	lea    -0x10(%eax),%edx
c01010e6:	89 d0                	mov    %edx,%eax
c01010e8:	c1 f8 1f             	sar    $0x1f,%eax
c01010eb:	c1 e8 1a             	shr    $0x1a,%eax
c01010ee:	01 c2                	add    %eax,%edx
c01010f0:	83 e2 3f             	and    $0x3f,%edx
c01010f3:	29 c2                	sub    %eax,%edx
c01010f5:	89 d0                	mov    %edx,%eax
c01010f7:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01010fa:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01010fd:	c1 e8 09             	shr    $0x9,%eax
c0101100:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0101103:	83 7d e8 08          	cmpl   $0x8,-0x18(%ebp)
c0101107:	7f 1a                	jg     c0101123 <hd_rdwt+0x91>
c0101109:	8b 55 e8             	mov    -0x18(%ebp),%edx
c010110c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010110f:	c1 e2 03             	shl    $0x3,%edx
c0101112:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0101118:	01 d0                	add    %edx,%eax
c010111a:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c010111f:	8b 00                	mov    (%eax),%eax
c0101121:	eb 1b                	jmp    c010113e <hd_rdwt+0xac>
c0101123:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101126:	8d 50 04             	lea    0x4(%eax),%edx
c0101129:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010112c:	c1 e2 03             	shl    $0x3,%edx
c010112f:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0101135:	01 d0                	add    %edx,%eax
c0101137:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c010113c:	8b 00                	mov    (%eax),%eax
c010113e:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0101141:	01 d0                	add    %edx,%eax
c0101143:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0101146:	8b 45 08             	mov    0x8(%ebp),%eax
c0101149:	8b 40 0c             	mov    0xc(%eax),%eax
c010114c:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010114f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0101152:	05 ff 01 00 00       	add    $0x1ff,%eax
c0101157:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c010115d:	85 c0                	test   %eax,%eax
c010115f:	0f 48 c2             	cmovs  %edx,%eax
c0101162:	c1 f8 09             	sar    $0x9,%eax
c0101165:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0101168:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010116b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010116e:	8b 45 08             	mov    0x8(%ebp),%eax
c0101171:	8b 40 10             	mov    0x10(%eax),%eax
c0101174:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0101177:	8b 45 08             	mov    0x8(%ebp),%eax
c010117a:	8b 00                	mov    (%eax),%eax
c010117c:	89 45 cc             	mov    %eax,-0x34(%ebp)
c010117f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0101182:	83 ec 08             	sub    $0x8,%esp
c0101185:	50                   	push   %eax
c0101186:	ff 75 d0             	pushl  -0x30(%ebp)
c0101189:	e8 8e 4b 00 00       	call   c0105d1c <alloc_virtual_memory>
c010118e:	83 c4 10             	add    $0x10,%esp
c0101191:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0101194:	8b 45 08             	mov    0x8(%ebp),%eax
c0101197:	8b 40 78             	mov    0x78(%eax),%eax
c010119a:	89 45 c8             	mov    %eax,-0x38(%ebp)
c010119d:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c01011a1:	74 22                	je     c01011c5 <hd_rdwt+0x133>
c01011a3:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c01011a7:	74 1c                	je     c01011c5 <hd_rdwt+0x133>
c01011a9:	68 b7 01 00 00       	push   $0x1b7
c01011ae:	68 d0 a2 10 c0       	push   $0xc010a2d0
c01011b3:	68 d0 a2 10 c0       	push   $0xc010a2d0
c01011b8:	68 92 a3 10 c0       	push   $0xc010a392
c01011bd:	e8 f6 73 00 00       	call   c01085b8 <assertion_failure>
c01011c2:	83 c4 10             	add    $0x10,%esp
c01011c5:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
c01011c9:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01011cc:	88 45 be             	mov    %al,-0x42(%ebp)
c01011cf:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01011d2:	88 45 bf             	mov    %al,-0x41(%ebp)
c01011d5:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01011d8:	c1 f8 08             	sar    $0x8,%eax
c01011db:	88 45 c0             	mov    %al,-0x40(%ebp)
c01011de:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01011e1:	c1 f8 10             	sar    $0x10,%eax
c01011e4:	88 45 c1             	mov    %al,-0x3f(%ebp)
c01011e7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01011ea:	c1 f8 18             	sar    $0x18,%eax
c01011ed:	83 e0 0f             	and    $0xf,%eax
c01011f0:	83 c8 e0             	or     $0xffffffe0,%eax
c01011f3:	88 45 c2             	mov    %al,-0x3e(%ebp)
c01011f6:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c01011fa:	75 07                	jne    c0101203 <hd_rdwt+0x171>
c01011fc:	b8 20 00 00 00       	mov    $0x20,%eax
c0101201:	eb 05                	jmp    c0101208 <hd_rdwt+0x176>
c0101203:	b8 30 00 00 00       	mov    $0x30,%eax
c0101208:	88 45 c3             	mov    %al,-0x3d(%ebp)
c010120b:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c010120f:	3c 20                	cmp    $0x20,%al
c0101211:	74 24                	je     c0101237 <hd_rdwt+0x1a5>
c0101213:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c0101217:	3c 30                	cmp    $0x30,%al
c0101219:	74 1c                	je     c0101237 <hd_rdwt+0x1a5>
c010121b:	68 c5 01 00 00       	push   $0x1c5
c0101220:	68 d0 a2 10 c0       	push   $0xc010a2d0
c0101225:	68 d0 a2 10 c0       	push   $0xc010a2d0
c010122a:	68 b0 a3 10 c0       	push   $0xc010a3b0
c010122f:	e8 84 73 00 00       	call   c01085b8 <assertion_failure>
c0101234:	83 c4 10             	add    $0x10,%esp
c0101237:	83 ec 0c             	sub    $0xc,%esp
c010123a:	8d 45 bd             	lea    -0x43(%ebp),%eax
c010123d:	50                   	push   %eax
c010123e:	e8 ca f5 ff ff       	call   c010080d <hd_cmd_out>
c0101243:	83 c4 10             	add    $0x10,%esp
c0101246:	e9 9c 00 00 00       	jmp    c01012e7 <hd_rdwt+0x255>
c010124b:	b8 00 02 00 00       	mov    $0x200,%eax
c0101250:	81 7d f4 00 02 00 00 	cmpl   $0x200,-0xc(%ebp)
c0101257:	0f 4e 45 f4          	cmovle -0xc(%ebp),%eax
c010125b:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c010125e:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c0101262:	75 51                	jne    c01012b5 <hd_rdwt+0x223>
c0101264:	e8 a8 fd ff ff       	call   c0101011 <wait_for>
c0101269:	e8 d4 fd ff ff       	call   c0101042 <interrupt_wait>
c010126e:	83 ec 04             	sub    $0x4,%esp
c0101271:	ff 75 c4             	pushl  -0x3c(%ebp)
c0101274:	6a 00                	push   $0x0
c0101276:	68 80 11 11 c0       	push   $0xc0111180
c010127b:	e8 6b 9f 00 00       	call   c010b1eb <Memset>
c0101280:	83 c4 10             	add    $0x10,%esp
c0101283:	83 ec 04             	sub    $0x4,%esp
c0101286:	68 00 02 00 00       	push   $0x200
c010128b:	68 80 11 11 c0       	push   $0xc0111180
c0101290:	68 f0 01 00 00       	push   $0x1f0
c0101295:	e8 a5 9f 00 00       	call   c010b23f <read_port>
c010129a:	83 c4 10             	add    $0x10,%esp
c010129d:	83 ec 04             	sub    $0x4,%esp
c01012a0:	ff 75 c4             	pushl  -0x3c(%ebp)
c01012a3:	68 80 11 11 c0       	push   $0xc0111180
c01012a8:	ff 75 f0             	pushl  -0x10(%ebp)
c01012ab:	e8 d9 58 00 00       	call   c0106b89 <Memcpy>
c01012b0:	83 c4 10             	add    $0x10,%esp
c01012b3:	eb 26                	jmp    c01012db <hd_rdwt+0x249>
c01012b5:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c01012b9:	75 20                	jne    c01012db <hd_rdwt+0x249>
c01012bb:	e8 51 fd ff ff       	call   c0101011 <wait_for>
c01012c0:	83 ec 04             	sub    $0x4,%esp
c01012c3:	ff 75 c4             	pushl  -0x3c(%ebp)
c01012c6:	ff 75 f0             	pushl  -0x10(%ebp)
c01012c9:	68 f0 01 00 00       	push   $0x1f0
c01012ce:	e8 80 9f 00 00       	call   c010b253 <write_port>
c01012d3:	83 c4 10             	add    $0x10,%esp
c01012d6:	e8 67 fd ff ff       	call   c0101042 <interrupt_wait>
c01012db:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01012de:	29 45 f4             	sub    %eax,-0xc(%ebp)
c01012e1:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01012e4:	01 45 f0             	add    %eax,-0x10(%ebp)
c01012e7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01012eb:	0f 85 5a ff ff ff    	jne    c010124b <hd_rdwt+0x1b9>
c01012f1:	83 ec 04             	sub    $0x4,%esp
c01012f4:	6a 7c                	push   $0x7c
c01012f6:	6a 00                	push   $0x0
c01012f8:	8d 85 40 ff ff ff    	lea    -0xc0(%ebp),%eax
c01012fe:	50                   	push   %eax
c01012ff:	e8 e7 9e 00 00       	call   c010b1eb <Memset>
c0101304:	83 c4 10             	add    $0x10,%esp
c0101307:	c7 45 b8 65 00 00 00 	movl   $0x65,-0x48(%ebp)
c010130e:	c7 85 48 ff ff ff 00 	movl   $0x0,-0xb8(%ebp)
c0101315:	00 00 00 
c0101318:	83 ec 04             	sub    $0x4,%esp
c010131b:	6a 02                	push   $0x2
c010131d:	8d 85 40 ff ff ff    	lea    -0xc0(%ebp),%eax
c0101323:	50                   	push   %eax
c0101324:	6a 01                	push   $0x1
c0101326:	e8 fd 7e 00 00       	call   c0109228 <send_rec>
c010132b:	83 c4 10             	add    $0x10,%esp
c010132e:	90                   	nop
c010132f:	c9                   	leave  
c0101330:	c3                   	ret    

c0101331 <hd_handler>:
c0101331:	55                   	push   %ebp
c0101332:	89 e5                	mov    %esp,%ebp
c0101334:	83 ec 18             	sub    $0x18,%esp
c0101337:	83 ec 0c             	sub    $0xc,%esp
c010133a:	68 f7 01 00 00       	push   $0x1f7
c010133f:	e8 55 ef ff ff       	call   c0100299 <in_byte>
c0101344:	83 c4 10             	add    $0x10,%esp
c0101347:	0f b6 c0             	movzbl %al,%eax
c010134a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010134d:	83 ec 0c             	sub    $0xc,%esp
c0101350:	6a 03                	push   $0x3
c0101352:	e8 6b 81 00 00       	call   c01094c2 <inform_int>
c0101357:	83 c4 10             	add    $0x10,%esp
c010135a:	90                   	nop
c010135b:	c9                   	leave  
c010135c:	c3                   	ret    

c010135d <waitfor>:
c010135d:	55                   	push   %ebp
c010135e:	89 e5                	mov    %esp,%ebp
c0101360:	83 ec 18             	sub    $0x18,%esp
c0101363:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010136a:	eb 26                	jmp    c0101392 <waitfor+0x35>
c010136c:	83 ec 0c             	sub    $0xc,%esp
c010136f:	68 f7 01 00 00       	push   $0x1f7
c0101374:	e8 20 ef ff ff       	call   c0100299 <in_byte>
c0101379:	83 c4 10             	add    $0x10,%esp
c010137c:	0f b6 c0             	movzbl %al,%eax
c010137f:	23 45 08             	and    0x8(%ebp),%eax
c0101382:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0101385:	75 07                	jne    c010138e <waitfor+0x31>
c0101387:	b8 01 00 00 00       	mov    $0x1,%eax
c010138c:	eb 11                	jmp    c010139f <waitfor+0x42>
c010138e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0101392:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101395:	3b 45 10             	cmp    0x10(%ebp),%eax
c0101398:	7c d2                	jl     c010136c <waitfor+0xf>
c010139a:	b8 00 00 00 00       	mov    $0x0,%eax
c010139f:	c9                   	leave  
c01013a0:	c3                   	ret    

c01013a1 <print_hd_info>:
c01013a1:	55                   	push   %ebp
c01013a2:	89 e5                	mov    %esp,%ebp
c01013a4:	83 ec 18             	sub    $0x18,%esp
c01013a7:	83 ec 0c             	sub    $0xc,%esp
c01013aa:	68 e4 a3 10 c0       	push   $0xc010a3e4
c01013af:	e8 a7 6e 00 00       	call   c010825b <Printf>
c01013b4:	83 c4 10             	add    $0x10,%esp
c01013b7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01013be:	eb 3b                	jmp    c01013fb <print_hd_info+0x5a>
c01013c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01013c3:	8b 04 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%eax
c01013ca:	85 c0                	test   %eax,%eax
c01013cc:	74 28                	je     c01013f6 <print_hd_info+0x55>
c01013ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01013d1:	8b 14 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%edx
c01013d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01013db:	8b 04 c5 44 0f 11 c0 	mov    -0x3feef0bc(,%eax,8),%eax
c01013e2:	ff 75 f4             	pushl  -0xc(%ebp)
c01013e5:	52                   	push   %edx
c01013e6:	50                   	push   %eax
c01013e7:	68 01 a4 10 c0       	push   $0xc010a401
c01013ec:	e8 6a 6e 00 00       	call   c010825b <Printf>
c01013f1:	83 c4 10             	add    $0x10,%esp
c01013f4:	eb 01                	jmp    c01013f7 <print_hd_info+0x56>
c01013f6:	90                   	nop
c01013f7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01013fb:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c01013ff:	7e bf                	jle    c01013c0 <print_hd_info+0x1f>
c0101401:	83 ec 0c             	sub    $0xc,%esp
c0101404:	68 19 a4 10 c0       	push   $0xc010a419
c0101409:	e8 4d 6e 00 00       	call   c010825b <Printf>
c010140e:	83 c4 10             	add    $0x10,%esp
c0101411:	83 ec 0c             	sub    $0xc,%esp
c0101414:	68 34 a4 10 c0       	push   $0xc010a434
c0101419:	e8 3d 6e 00 00       	call   c010825b <Printf>
c010141e:	83 c4 10             	add    $0x10,%esp
c0101421:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%ebp)
c0101428:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c010142f:	eb 44                	jmp    c0101475 <print_hd_info+0xd4>
c0101431:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101434:	83 c0 04             	add    $0x4,%eax
c0101437:	8b 04 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%eax
c010143e:	85 c0                	test   %eax,%eax
c0101440:	74 2e                	je     c0101470 <print_hd_info+0xcf>
c0101442:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101445:	83 c0 04             	add    $0x4,%eax
c0101448:	8b 14 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%edx
c010144f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101452:	83 c0 04             	add    $0x4,%eax
c0101455:	8b 04 c5 44 0f 11 c0 	mov    -0x3feef0bc(,%eax,8),%eax
c010145c:	ff 75 f0             	pushl  -0x10(%ebp)
c010145f:	52                   	push   %edx
c0101460:	50                   	push   %eax
c0101461:	68 01 a4 10 c0       	push   $0xc010a401
c0101466:	e8 f0 6d 00 00       	call   c010825b <Printf>
c010146b:	83 c4 10             	add    $0x10,%esp
c010146e:	eb 01                	jmp    c0101471 <print_hd_info+0xd0>
c0101470:	90                   	nop
c0101471:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0101475:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c0101479:	7e b6                	jle    c0101431 <print_hd_info+0x90>
c010147b:	83 ec 0c             	sub    $0xc,%esp
c010147e:	68 51 a4 10 c0       	push   $0xc010a451
c0101483:	e8 d3 6d 00 00       	call   c010825b <Printf>
c0101488:	83 c4 10             	add    $0x10,%esp
c010148b:	90                   	nop
c010148c:	c9                   	leave  
c010148d:	c3                   	ret    

c010148e <is_empty>:
c010148e:	55                   	push   %ebp
c010148f:	89 e5                	mov    %esp,%ebp
c0101491:	83 ec 10             	sub    $0x10,%esp
c0101494:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c010149b:	eb 1a                	jmp    c01014b7 <is_empty+0x29>
c010149d:	8b 55 fc             	mov    -0x4(%ebp),%edx
c01014a0:	8b 45 08             	mov    0x8(%ebp),%eax
c01014a3:	01 d0                	add    %edx,%eax
c01014a5:	0f b6 00             	movzbl (%eax),%eax
c01014a8:	84 c0                	test   %al,%al
c01014aa:	74 07                	je     c01014b3 <is_empty+0x25>
c01014ac:	b8 00 00 00 00       	mov    $0x0,%eax
c01014b1:	eb 11                	jmp    c01014c4 <is_empty+0x36>
c01014b3:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c01014b7:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01014ba:	3b 45 0c             	cmp    0xc(%ebp),%eax
c01014bd:	7c de                	jl     c010149d <is_empty+0xf>
c01014bf:	b8 01 00 00 00       	mov    $0x1,%eax
c01014c4:	c9                   	leave  
c01014c5:	c3                   	ret    
c01014c6:	66 90                	xchg   %ax,%ax
c01014c8:	66 90                	xchg   %ax,%ax
c01014ca:	66 90                	xchg   %ax,%ax
c01014cc:	66 90                	xchg   %ax,%ax
c01014ce:	66 90                	xchg   %ax,%ax

c01014d0 <write_debug>:
c01014d0:	b8 02 00 00 00       	mov    $0x2,%eax
c01014d5:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c01014d9:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c01014dd:	cd 90                	int    $0x90
c01014df:	c3                   	ret    

c01014e0 <send_msg>:
c01014e0:	55                   	push   %ebp
c01014e1:	89 e5                	mov    %esp,%ebp
c01014e3:	53                   	push   %ebx
c01014e4:	51                   	push   %ecx
c01014e5:	b8 03 00 00 00       	mov    $0x3,%eax
c01014ea:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c01014ed:	8b 4d 08             	mov    0x8(%ebp),%ecx
c01014f0:	cd 90                	int    $0x90
c01014f2:	59                   	pop    %ecx
c01014f3:	5b                   	pop    %ebx
c01014f4:	5d                   	pop    %ebp
c01014f5:	c3                   	ret    

c01014f6 <receive_msg>:
c01014f6:	55                   	push   %ebp
c01014f7:	89 e5                	mov    %esp,%ebp
c01014f9:	53                   	push   %ebx
c01014fa:	51                   	push   %ecx
c01014fb:	b8 04 00 00 00       	mov    $0x4,%eax
c0101500:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c0101503:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0101506:	cd 90                	int    $0x90
c0101508:	59                   	pop    %ecx
c0101509:	5b                   	pop    %ebx
c010150a:	5d                   	pop    %ebp
c010150b:	c3                   	ret    

c010150c <sys_malloc>:
c010150c:	56                   	push   %esi
c010150d:	57                   	push   %edi
c010150e:	53                   	push   %ebx
c010150f:	55                   	push   %ebp
c0101510:	89 e5                	mov    %esp,%ebp
c0101512:	b8 05 00 00 00       	mov    $0x5,%eax
c0101517:	8b 4d 14             	mov    0x14(%ebp),%ecx
c010151a:	cd 90                	int    $0x90
c010151c:	5d                   	pop    %ebp
c010151d:	5b                   	pop    %ebx
c010151e:	5f                   	pop    %edi
c010151f:	5e                   	pop    %esi
c0101520:	c3                   	ret    

c0101521 <sys_free>:
c0101521:	56                   	push   %esi
c0101522:	57                   	push   %edi
c0101523:	53                   	push   %ebx
c0101524:	55                   	push   %ebp
c0101525:	89 e5                	mov    %esp,%ebp
c0101527:	b8 06 00 00 00       	mov    $0x6,%eax
c010152c:	8b 4d 14             	mov    0x14(%ebp),%ecx
c010152f:	8b 5d 18             	mov    0x18(%ebp),%ebx
c0101532:	cd 90                	int    $0x90
c0101534:	5d                   	pop    %ebp
c0101535:	5b                   	pop    %ebx
c0101536:	5f                   	pop    %edi
c0101537:	5e                   	pop    %esi
c0101538:	c3                   	ret    

c0101539 <task_fs>:
c0101539:	55                   	push   %ebp
c010153a:	89 e5                	mov    %esp,%ebp
c010153c:	83 ec 28             	sub    $0x28,%esp
c010153f:	e8 bb 08 00 00       	call   c0101dff <init_fs>
c0101544:	83 ec 0c             	sub    $0xc,%esp
c0101547:	6a 7c                	push   $0x7c
c0101549:	e8 be ff ff ff       	call   c010150c <sys_malloc>
c010154e:	83 c4 10             	add    $0x10,%esp
c0101551:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101554:	83 ec 0c             	sub    $0xc,%esp
c0101557:	6a 7c                	push   $0x7c
c0101559:	e8 ae ff ff ff       	call   c010150c <sys_malloc>
c010155e:	83 c4 10             	add    $0x10,%esp
c0101561:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0101564:	83 ec 04             	sub    $0x4,%esp
c0101567:	6a 7c                	push   $0x7c
c0101569:	6a 00                	push   $0x0
c010156b:	ff 75 f4             	pushl  -0xc(%ebp)
c010156e:	e8 78 9c 00 00       	call   c010b1eb <Memset>
c0101573:	83 c4 10             	add    $0x10,%esp
c0101576:	83 ec 04             	sub    $0x4,%esp
c0101579:	6a 12                	push   $0x12
c010157b:	ff 75 f4             	pushl  -0xc(%ebp)
c010157e:	6a 02                	push   $0x2
c0101580:	e8 a3 7c 00 00       	call   c0109228 <send_rec>
c0101585:	83 c4 10             	add    $0x10,%esp
c0101588:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010158b:	8b 40 78             	mov    0x78(%eax),%eax
c010158e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0101591:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101594:	8b 00                	mov    (%eax),%eax
c0101596:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0101599:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010159c:	8b 40 50             	mov    0x50(%eax),%eax
c010159f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01015a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01015a5:	8b 40 68             	mov    0x68(%eax),%eax
c01015a8:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01015ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01015ae:	8b 00                	mov    (%eax),%eax
c01015b0:	85 c0                	test   %eax,%eax
c01015b2:	75 07                	jne    c01015bb <task_fs+0x82>
c01015b4:	c7 45 dc 05 00 00 00 	movl   $0x5,-0x24(%ebp)
c01015bb:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c01015c2:	83 ec 0c             	sub    $0xc,%esp
c01015c5:	ff 75 e8             	pushl  -0x18(%ebp)
c01015c8:	e8 19 21 00 00       	call   c01036e6 <pid2proc>
c01015cd:	83 c4 10             	add    $0x10,%esp
c01015d0:	a3 c8 fb 10 c0       	mov    %eax,0xc010fbc8
c01015d5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c01015d9:	74 37                	je     c0101612 <task_fs+0xd9>
c01015db:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
c01015df:	74 31                	je     c0101612 <task_fs+0xd9>
c01015e1:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c01015e5:	74 2b                	je     c0101612 <task_fs+0xd9>
c01015e7:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
c01015eb:	74 25                	je     c0101612 <task_fs+0xd9>
c01015ed:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
c01015f1:	74 1f                	je     c0101612 <task_fs+0xd9>
c01015f3:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
c01015f7:	74 19                	je     c0101612 <task_fs+0xd9>
c01015f9:	6a 7a                	push   $0x7a
c01015fb:	68 70 a4 10 c0       	push   $0xc010a470
c0101600:	68 70 a4 10 c0       	push   $0xc010a470
c0101605:	68 80 a4 10 c0       	push   $0xc010a480
c010160a:	e8 a9 6f 00 00       	call   c01085b8 <assertion_failure>
c010160f:	83 c4 10             	add    $0x10,%esp
c0101612:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c0101616:	74 3a                	je     c0101652 <task_fs+0x119>
c0101618:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c010161c:	7f 19                	jg     c0101637 <task_fs+0xfe>
c010161e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0101622:	0f 84 10 01 00 00    	je     c0101738 <task_fs+0x1ff>
c0101628:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
c010162c:	0f 84 a1 00 00 00    	je     c01016d3 <task_fs+0x19a>
c0101632:	e9 ef 00 00 00       	jmp    c0101726 <task_fs+0x1ed>
c0101637:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
c010163b:	74 50                	je     c010168d <task_fs+0x154>
c010163d:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
c0101641:	0f 84 c6 00 00 00    	je     c010170d <task_fs+0x1d4>
c0101647:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
c010164b:	74 40                	je     c010168d <task_fs+0x154>
c010164d:	e9 d4 00 00 00       	jmp    c0101726 <task_fs+0x1ed>
c0101652:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101655:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c010165c:	83 ec 0c             	sub    $0xc,%esp
c010165f:	ff 75 f4             	pushl  -0xc(%ebp)
c0101662:	e8 ec 07 00 00       	call   c0101e53 <do_open>
c0101667:	83 c4 10             	add    $0x10,%esp
c010166a:	89 c2                	mov    %eax,%edx
c010166c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010166f:	89 50 50             	mov    %edx,0x50(%eax)
c0101672:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101675:	8b 00                	mov    (%eax),%eax
c0101677:	83 ec 04             	sub    $0x4,%esp
c010167a:	50                   	push   %eax
c010167b:	ff 75 f4             	pushl  -0xc(%ebp)
c010167e:	6a 01                	push   $0x1
c0101680:	e8 a3 7b 00 00       	call   c0109228 <send_rec>
c0101685:	83 c4 10             	add    $0x10,%esp
c0101688:	e9 b2 00 00 00       	jmp    c010173f <task_fs+0x206>
c010168d:	83 ec 0c             	sub    $0xc,%esp
c0101690:	ff 75 f4             	pushl  -0xc(%ebp)
c0101693:	e8 f9 18 00 00       	call   c0102f91 <do_rdwt>
c0101698:	83 c4 10             	add    $0x10,%esp
c010169b:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010169e:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
c01016a2:	0f 84 96 00 00 00    	je     c010173e <task_fs+0x205>
c01016a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01016ab:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c01016b2:	8b 55 d8             	mov    -0x28(%ebp),%edx
c01016b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01016b8:	89 50 60             	mov    %edx,0x60(%eax)
c01016bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01016be:	8b 00                	mov    (%eax),%eax
c01016c0:	83 ec 04             	sub    $0x4,%esp
c01016c3:	50                   	push   %eax
c01016c4:	ff 75 f4             	pushl  -0xc(%ebp)
c01016c7:	6a 01                	push   $0x1
c01016c9:	e8 5a 7b 00 00       	call   c0109228 <send_rec>
c01016ce:	83 c4 10             	add    $0x10,%esp
c01016d1:	eb 6b                	jmp    c010173e <task_fs+0x205>
c01016d3:	83 ec 0c             	sub    $0xc,%esp
c01016d6:	ff 75 e4             	pushl  -0x1c(%ebp)
c01016d9:	e8 d0 1d 00 00       	call   c01034ae <do_close>
c01016de:	83 c4 10             	add    $0x10,%esp
c01016e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01016e4:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c01016eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01016ee:	c7 40 58 00 00 00 00 	movl   $0x0,0x58(%eax)
c01016f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01016f8:	8b 00                	mov    (%eax),%eax
c01016fa:	83 ec 04             	sub    $0x4,%esp
c01016fd:	50                   	push   %eax
c01016fe:	ff 75 f4             	pushl  -0xc(%ebp)
c0101701:	6a 01                	push   $0x1
c0101703:	e8 20 7b 00 00       	call   c0109228 <send_rec>
c0101708:	83 c4 10             	add    $0x10,%esp
c010170b:	eb 32                	jmp    c010173f <task_fs+0x206>
c010170d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101710:	8b 40 68             	mov    0x68(%eax),%eax
c0101713:	83 ec 04             	sub    $0x4,%esp
c0101716:	50                   	push   %eax
c0101717:	ff 75 f4             	pushl  -0xc(%ebp)
c010171a:	6a 01                	push   $0x1
c010171c:	e8 07 7b 00 00       	call   c0109228 <send_rec>
c0101721:	83 c4 10             	add    $0x10,%esp
c0101724:	eb 19                	jmp    c010173f <task_fs+0x206>
c0101726:	83 ec 0c             	sub    $0xc,%esp
c0101729:	68 e3 a4 10 c0       	push   $0xc010a4e3
c010172e:	e8 67 6e 00 00       	call   c010859a <panic>
c0101733:	83 c4 10             	add    $0x10,%esp
c0101736:	eb 07                	jmp    c010173f <task_fs+0x206>
c0101738:	90                   	nop
c0101739:	e9 26 fe ff ff       	jmp    c0101564 <task_fs+0x2b>
c010173e:	90                   	nop
c010173f:	e9 20 fe ff ff       	jmp    c0101564 <task_fs+0x2b>

c0101744 <rd_wt>:
c0101744:	55                   	push   %ebp
c0101745:	89 e5                	mov    %esp,%ebp
c0101747:	83 ec 18             	sub    $0x18,%esp
c010174a:	83 ec 0c             	sub    $0xc,%esp
c010174d:	6a 7c                	push   $0x7c
c010174f:	e8 b8 fd ff ff       	call   c010150c <sys_malloc>
c0101754:	83 c4 10             	add    $0x10,%esp
c0101757:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010175a:	83 ec 04             	sub    $0x4,%esp
c010175d:	6a 7c                	push   $0x7c
c010175f:	6a 00                	push   $0x0
c0101761:	ff 75 f4             	pushl  -0xc(%ebp)
c0101764:	e8 82 9a 00 00       	call   c010b1eb <Memset>
c0101769:	83 c4 10             	add    $0x10,%esp
c010176c:	8b 55 18             	mov    0x18(%ebp),%edx
c010176f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101772:	89 50 78             	mov    %edx,0x78(%eax)
c0101775:	8b 55 0c             	mov    0xc(%ebp),%edx
c0101778:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010177b:	89 50 14             	mov    %edx,0x14(%eax)
c010177e:	8b 55 10             	mov    0x10(%ebp),%edx
c0101781:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101784:	89 50 10             	mov    %edx,0x10(%eax)
c0101787:	8b 55 14             	mov    0x14(%ebp),%edx
c010178a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010178d:	89 50 0c             	mov    %edx,0xc(%eax)
c0101790:	8b 45 08             	mov    0x8(%ebp),%eax
c0101793:	c1 e0 09             	shl    $0x9,%eax
c0101796:	89 c2                	mov    %eax,%edx
c0101798:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010179b:	89 50 18             	mov    %edx,0x18(%eax)
c010179e:	83 7d 18 07          	cmpl   $0x7,0x18(%ebp)
c01017a2:	74 22                	je     c01017c6 <rd_wt+0x82>
c01017a4:	83 7d 18 0a          	cmpl   $0xa,0x18(%ebp)
c01017a8:	74 1c                	je     c01017c6 <rd_wt+0x82>
c01017aa:	68 b1 00 00 00       	push   $0xb1
c01017af:	68 70 a4 10 c0       	push   $0xc010a470
c01017b4:	68 70 a4 10 c0       	push   $0xc010a470
c01017b9:	68 f6 a4 10 c0       	push   $0xc010a4f6
c01017be:	e8 f5 6d 00 00       	call   c01085b8 <assertion_failure>
c01017c3:	83 c4 10             	add    $0x10,%esp
c01017c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01017c9:	8b 40 78             	mov    0x78(%eax),%eax
c01017cc:	83 f8 07             	cmp    $0x7,%eax
c01017cf:	74 27                	je     c01017f8 <rd_wt+0xb4>
c01017d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01017d4:	8b 40 78             	mov    0x78(%eax),%eax
c01017d7:	83 f8 0a             	cmp    $0xa,%eax
c01017da:	74 1c                	je     c01017f8 <rd_wt+0xb4>
c01017dc:	68 b2 00 00 00       	push   $0xb2
c01017e1:	68 70 a4 10 c0       	push   $0xc010a470
c01017e6:	68 70 a4 10 c0       	push   $0xc010a470
c01017eb:	68 14 a5 10 c0       	push   $0xc010a514
c01017f0:	e8 c3 6d 00 00       	call   c01085b8 <assertion_failure>
c01017f5:	83 c4 10             	add    $0x10,%esp
c01017f8:	83 ec 04             	sub    $0x4,%esp
c01017fb:	6a 03                	push   $0x3
c01017fd:	ff 75 f4             	pushl  -0xc(%ebp)
c0101800:	6a 03                	push   $0x3
c0101802:	e8 21 7a 00 00       	call   c0109228 <send_rec>
c0101807:	83 c4 10             	add    $0x10,%esp
c010180a:	83 ec 08             	sub    $0x8,%esp
c010180d:	6a 7c                	push   $0x7c
c010180f:	ff 75 f4             	pushl  -0xc(%ebp)
c0101812:	e8 0a fd ff ff       	call   c0101521 <sys_free>
c0101817:	83 c4 10             	add    $0x10,%esp
c010181a:	90                   	nop
c010181b:	c9                   	leave  
c010181c:	c3                   	ret    

c010181d <mkfs>:
c010181d:	55                   	push   %ebp
c010181e:	89 e5                	mov    %esp,%ebp
c0101820:	57                   	push   %edi
c0101821:	81 ec d4 00 00 00    	sub    $0xd4,%esp
c0101827:	83 ec 0c             	sub    $0xc,%esp
c010182a:	68 00 80 00 00       	push   $0x8000
c010182f:	e8 d8 fc ff ff       	call   c010150c <sys_malloc>
c0101834:	83 c4 10             	add    $0x10,%esp
c0101837:	a3 a4 21 11 c0       	mov    %eax,0xc01121a4
c010183c:	83 ec 0c             	sub    $0xc,%esp
c010183f:	6a 24                	push   $0x24
c0101841:	e8 c6 fc ff ff       	call   c010150c <sys_malloc>
c0101846:	83 c4 10             	add    $0x10,%esp
c0101849:	a3 a0 21 11 c0       	mov    %eax,0xc01121a0
c010184e:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101853:	83 ec 0c             	sub    $0xc,%esp
c0101856:	50                   	push   %eax
c0101857:	e8 0f 46 00 00       	call   c0105e6b <get_physical_address>
c010185c:	83 c4 10             	add    $0x10,%esp
c010185f:	a3 84 17 11 c0       	mov    %eax,0xc0111784
c0101864:	a1 a0 21 11 c0       	mov    0xc01121a0,%eax
c0101869:	83 ec 0c             	sub    $0xc,%esp
c010186c:	50                   	push   %eax
c010186d:	e8 f9 45 00 00       	call   c0105e6b <get_physical_address>
c0101872:	83 c4 10             	add    $0x10,%esp
c0101875:	a3 80 17 11 c0       	mov    %eax,0xc0111780
c010187a:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c010187f:	83 ec 04             	sub    $0x4,%esp
c0101882:	68 00 02 00 00       	push   $0x200
c0101887:	6a 00                	push   $0x0
c0101889:	50                   	push   %eax
c010188a:	e8 5c 99 00 00       	call   c010b1eb <Memset>
c010188f:	83 c4 10             	add    $0x10,%esp
c0101892:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101897:	83 ec 0c             	sub    $0xc,%esp
c010189a:	6a 0a                	push   $0xa
c010189c:	68 00 02 00 00       	push   $0x200
c01018a1:	50                   	push   %eax
c01018a2:	6a 20                	push   $0x20
c01018a4:	6a 00                	push   $0x0
c01018a6:	e8 99 fe ff ff       	call   c0101744 <rd_wt>
c01018ab:	83 c4 20             	add    $0x20,%esp
c01018ae:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c01018b3:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01018b6:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01018b9:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c01018c0:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01018c3:	c7 40 10 00 08 00 00 	movl   $0x800,0x10(%eax)
c01018ca:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01018cd:	c7 40 08 00 08 00 00 	movl   $0x800,0x8(%eax)
c01018d4:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01018d7:	c7 40 0c 00 01 00 00 	movl   $0x100,0xc(%eax)
c01018de:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01018e1:	8b 40 04             	mov    0x4(%eax),%eax
c01018e4:	8d 50 02             	lea    0x2(%eax),%edx
c01018e7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01018ea:	8b 40 08             	mov    0x8(%eax),%eax
c01018ed:	01 c2                	add    %eax,%edx
c01018ef:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01018f2:	8b 40 0c             	mov    0xc(%eax),%eax
c01018f5:	01 c2                	add    %eax,%edx
c01018f7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01018fa:	89 10                	mov    %edx,(%eax)
c01018fc:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c0101903:	b8 00 02 00 00       	mov    $0x200,%eax
c0101908:	2b 45 d8             	sub    -0x28(%ebp),%eax
c010190b:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0101911:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0101914:	01 ca                	add    %ecx,%edx
c0101916:	83 ec 04             	sub    $0x4,%esp
c0101919:	50                   	push   %eax
c010191a:	6a 80                	push   $0xffffff80
c010191c:	52                   	push   %edx
c010191d:	e8 c9 98 00 00       	call   c010b1eb <Memset>
c0101922:	83 c4 10             	add    $0x10,%esp
c0101925:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010192a:	83 ec 0c             	sub    $0xc,%esp
c010192d:	6a 0a                	push   $0xa
c010192f:	68 00 02 00 00       	push   $0x200
c0101934:	50                   	push   %eax
c0101935:	6a 20                	push   $0x20
c0101937:	6a 01                	push   $0x1
c0101939:	e8 06 fe ff ff       	call   c0101744 <rd_wt>
c010193e:	83 c4 20             	add    $0x20,%esp
c0101941:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101944:	8b 10                	mov    (%eax),%edx
c0101946:	89 55 98             	mov    %edx,-0x68(%ebp)
c0101949:	8b 50 04             	mov    0x4(%eax),%edx
c010194c:	89 55 9c             	mov    %edx,-0x64(%ebp)
c010194f:	8b 50 08             	mov    0x8(%eax),%edx
c0101952:	89 55 a0             	mov    %edx,-0x60(%ebp)
c0101955:	8b 50 0c             	mov    0xc(%eax),%edx
c0101958:	89 55 a4             	mov    %edx,-0x5c(%ebp)
c010195b:	8b 50 10             	mov    0x10(%eax),%edx
c010195e:	89 55 a8             	mov    %edx,-0x58(%ebp)
c0101961:	8b 50 14             	mov    0x14(%eax),%edx
c0101964:	89 55 ac             	mov    %edx,-0x54(%ebp)
c0101967:	8b 50 18             	mov    0x18(%eax),%edx
c010196a:	89 55 b0             	mov    %edx,-0x50(%ebp)
c010196d:	8b 50 1c             	mov    0x1c(%eax),%edx
c0101970:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c0101973:	8b 40 20             	mov    0x20(%eax),%eax
c0101976:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0101979:	c6 45 d7 3f          	movb   $0x3f,-0x29(%ebp)
c010197d:	0f be 55 d7          	movsbl -0x29(%ebp),%edx
c0101981:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101986:	83 ec 04             	sub    $0x4,%esp
c0101989:	6a 01                	push   $0x1
c010198b:	52                   	push   %edx
c010198c:	50                   	push   %eax
c010198d:	e8 59 98 00 00       	call   c010b1eb <Memset>
c0101992:	83 c4 10             	add    $0x10,%esp
c0101995:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c010199a:	83 c0 01             	add    $0x1,%eax
c010199d:	83 ec 04             	sub    $0x4,%esp
c01019a0:	68 ff 01 00 00       	push   $0x1ff
c01019a5:	6a 80                	push   $0xffffff80
c01019a7:	50                   	push   %eax
c01019a8:	e8 3e 98 00 00       	call   c010b1eb <Memset>
c01019ad:	83 c4 10             	add    $0x10,%esp
c01019b0:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01019b5:	83 ec 0c             	sub    $0xc,%esp
c01019b8:	6a 0a                	push   $0xa
c01019ba:	68 00 02 00 00       	push   $0x200
c01019bf:	50                   	push   %eax
c01019c0:	6a 20                	push   $0x20
c01019c2:	6a 02                	push   $0x2
c01019c4:	e8 7b fd ff ff       	call   c0101744 <rd_wt>
c01019c9:	83 c4 20             	add    $0x20,%esp
c01019cc:	c7 45 d0 03 00 00 00 	movl   $0x3,-0x30(%ebp)
c01019d3:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c01019d8:	83 ec 04             	sub    $0x4,%esp
c01019db:	68 00 02 00 00       	push   $0x200
c01019e0:	6a ff                	push   $0xffffffff
c01019e2:	50                   	push   %eax
c01019e3:	e8 03 98 00 00       	call   c010b1eb <Memset>
c01019e8:	83 c4 10             	add    $0x10,%esp
c01019eb:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01019f0:	83 ec 0c             	sub    $0xc,%esp
c01019f3:	6a 0a                	push   $0xa
c01019f5:	68 00 02 00 00       	push   $0x200
c01019fa:	50                   	push   %eax
c01019fb:	6a 20                	push   $0x20
c01019fd:	ff 75 d0             	pushl  -0x30(%ebp)
c0101a00:	e8 3f fd ff ff       	call   c0101744 <rd_wt>
c0101a05:	83 c4 20             	add    $0x20,%esp
c0101a08:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101a0d:	83 ec 04             	sub    $0x4,%esp
c0101a10:	6a 01                	push   $0x1
c0101a12:	6a 01                	push   $0x1
c0101a14:	50                   	push   %eax
c0101a15:	e8 d1 97 00 00       	call   c010b1eb <Memset>
c0101a1a:	83 c4 10             	add    $0x10,%esp
c0101a1d:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101a22:	83 c0 01             	add    $0x1,%eax
c0101a25:	83 ec 04             	sub    $0x4,%esp
c0101a28:	68 ff 01 00 00       	push   $0x1ff
c0101a2d:	6a 00                	push   $0x0
c0101a2f:	50                   	push   %eax
c0101a30:	e8 b6 97 00 00       	call   c010b1eb <Memset>
c0101a35:	83 c4 10             	add    $0x10,%esp
c0101a38:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101a3d:	89 c2                	mov    %eax,%edx
c0101a3f:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0101a42:	83 c0 01             	add    $0x1,%eax
c0101a45:	83 ec 0c             	sub    $0xc,%esp
c0101a48:	6a 0a                	push   $0xa
c0101a4a:	68 00 02 00 00       	push   $0x200
c0101a4f:	52                   	push   %edx
c0101a50:	6a 20                	push   $0x20
c0101a52:	50                   	push   %eax
c0101a53:	e8 ec fc ff ff       	call   c0101744 <rd_wt>
c0101a58:	83 c4 20             	add    $0x20,%esp
c0101a5b:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101a5e:	83 e8 02             	sub    $0x2,%eax
c0101a61:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0101a64:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0101a6b:	eb 04                	jmp    c0101a71 <mkfs+0x254>
c0101a6d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0101a71:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0101a74:	83 c0 01             	add    $0x1,%eax
c0101a77:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0101a7a:	7e f1                	jle    c0101a6d <mkfs+0x250>
c0101a7c:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101a81:	89 c2                	mov    %eax,%edx
c0101a83:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101a86:	83 c0 03             	add    $0x3,%eax
c0101a89:	83 ec 0c             	sub    $0xc,%esp
c0101a8c:	6a 0a                	push   $0xa
c0101a8e:	68 00 02 00 00       	push   $0x200
c0101a93:	52                   	push   %edx
c0101a94:	6a 20                	push   $0x20
c0101a96:	50                   	push   %eax
c0101a97:	e8 a8 fc ff ff       	call   c0101744 <rd_wt>
c0101a9c:	83 c4 20             	add    $0x20,%esp
c0101a9f:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101aa4:	89 c2                	mov    %eax,%edx
c0101aa6:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101aa9:	83 c0 03             	add    $0x3,%eax
c0101aac:	83 ec 0c             	sub    $0xc,%esp
c0101aaf:	6a 07                	push   $0x7
c0101ab1:	68 00 02 00 00       	push   $0x200
c0101ab6:	52                   	push   %edx
c0101ab7:	6a 20                	push   $0x20
c0101ab9:	50                   	push   %eax
c0101aba:	e8 85 fc ff ff       	call   c0101744 <rd_wt>
c0101abf:	83 c4 20             	add    $0x20,%esp
c0101ac2:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101ac7:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0101aca:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101acd:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0101ad3:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101ad6:	c7 40 04 50 00 00 00 	movl   $0x50,0x4(%eax)
c0101add:	8b 55 98             	mov    -0x68(%ebp),%edx
c0101ae0:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101ae3:	89 50 08             	mov    %edx,0x8(%eax)
c0101ae6:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101ae9:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0101af0:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101af3:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c0101afa:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101afd:	8b 10                	mov    (%eax),%edx
c0101aff:	89 15 c0 21 11 c0    	mov    %edx,0xc01121c0
c0101b05:	8b 50 04             	mov    0x4(%eax),%edx
c0101b08:	89 15 c4 21 11 c0    	mov    %edx,0xc01121c4
c0101b0e:	8b 50 08             	mov    0x8(%eax),%edx
c0101b11:	89 15 c8 21 11 c0    	mov    %edx,0xc01121c8
c0101b17:	8b 50 0c             	mov    0xc(%eax),%edx
c0101b1a:	89 15 cc 21 11 c0    	mov    %edx,0xc01121cc
c0101b20:	8b 50 10             	mov    0x10(%eax),%edx
c0101b23:	89 15 d0 21 11 c0    	mov    %edx,0xc01121d0
c0101b29:	8b 50 14             	mov    0x14(%eax),%edx
c0101b2c:	89 15 d4 21 11 c0    	mov    %edx,0xc01121d4
c0101b32:	8b 50 18             	mov    0x18(%eax),%edx
c0101b35:	89 15 d8 21 11 c0    	mov    %edx,0xc01121d8
c0101b3b:	8b 50 1c             	mov    0x1c(%eax),%edx
c0101b3e:	89 15 dc 21 11 c0    	mov    %edx,0xc01121dc
c0101b44:	8b 50 20             	mov    0x20(%eax),%edx
c0101b47:	89 15 e0 21 11 c0    	mov    %edx,0xc01121e0
c0101b4d:	8b 40 24             	mov    0x24(%eax),%eax
c0101b50:	a3 e4 21 11 c0       	mov    %eax,0xc01121e4
c0101b55:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0101b5c:	eb 4c                	jmp    c0101baa <mkfs+0x38d>
c0101b5e:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101b63:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0101b66:	83 c2 01             	add    $0x1,%edx
c0101b69:	c1 e2 05             	shl    $0x5,%edx
c0101b6c:	01 d0                	add    %edx,%eax
c0101b6e:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0101b71:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101b74:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0101b7a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101b7d:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0101b84:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101b87:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c0101b8e:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
c0101b95:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0101b98:	c1 e0 08             	shl    $0x8,%eax
c0101b9b:	0b 45 f0             	or     -0x10(%ebp),%eax
c0101b9e:	89 c2                	mov    %eax,%edx
c0101ba0:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101ba3:	89 50 08             	mov    %edx,0x8(%eax)
c0101ba6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0101baa:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
c0101bae:	7e ae                	jle    c0101b5e <mkfs+0x341>
c0101bb0:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
c0101bb7:	8d 95 70 ff ff ff    	lea    -0x90(%ebp),%edx
c0101bbd:	b8 00 00 00 00       	mov    $0x0,%eax
c0101bc2:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0101bc7:	89 d7                	mov    %edx,%edi
c0101bc9:	f3 ab                	rep stos %eax,%es:(%edi)
c0101bcb:	c7 85 70 ff ff ff 3c 	movl   $0xc010a53c,-0x90(%ebp)
c0101bd2:	a5 10 c0 
c0101bd5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0101bdc:	eb 54                	jmp    c0101c32 <mkfs+0x415>
c0101bde:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101be3:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0101be6:	83 c2 04             	add    $0x4,%edx
c0101be9:	c1 e2 05             	shl    $0x5,%edx
c0101bec:	01 d0                	add    %edx,%eax
c0101bee:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0101bf1:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101bf4:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0101bfa:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101bfd:	c7 40 04 00 e8 08 00 	movl   $0x8e800,0x4(%eax)
c0101c04:	8b 45 98             	mov    -0x68(%ebp),%eax
c0101c07:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0101c0a:	83 c2 01             	add    $0x1,%edx
c0101c0d:	c1 e2 0b             	shl    $0xb,%edx
c0101c10:	01 c2                	add    %eax,%edx
c0101c12:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101c15:	89 50 08             	mov    %edx,0x8(%eax)
c0101c18:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101c1b:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0101c22:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101c25:	8d 50 05             	lea    0x5(%eax),%edx
c0101c28:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101c2b:	89 50 10             	mov    %edx,0x10(%eax)
c0101c2e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0101c32:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101c35:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0101c38:	7c a4                	jl     c0101bde <mkfs+0x3c1>
c0101c3a:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101c3f:	89 c2                	mov    %eax,%edx
c0101c41:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101c44:	83 c0 03             	add    $0x3,%eax
c0101c47:	83 ec 0c             	sub    $0xc,%esp
c0101c4a:	6a 0a                	push   $0xa
c0101c4c:	68 00 02 00 00       	push   $0x200
c0101c51:	52                   	push   %edx
c0101c52:	6a 20                	push   $0x20
c0101c54:	50                   	push   %eax
c0101c55:	e8 ea fa ff ff       	call   c0101744 <rd_wt>
c0101c5a:	83 c4 20             	add    $0x20,%esp
c0101c5d:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101c62:	89 c2                	mov    %eax,%edx
c0101c64:	8b 45 98             	mov    -0x68(%ebp),%eax
c0101c67:	83 ec 0c             	sub    $0xc,%esp
c0101c6a:	6a 07                	push   $0x7
c0101c6c:	68 00 02 00 00       	push   $0x200
c0101c71:	52                   	push   %edx
c0101c72:	6a 20                	push   $0x20
c0101c74:	50                   	push   %eax
c0101c75:	e8 ca fa ff ff       	call   c0101744 <rd_wt>
c0101c7a:	83 c4 20             	add    $0x20,%esp
c0101c7d:	c7 85 60 ff ff ff cc 	movl   $0xcc,-0xa0(%ebp)
c0101c84:	00 00 00 
c0101c87:	66 c7 85 5e ff ff ff 	movw   $0x2e,-0xa2(%ebp)
c0101c8e:	2e 00 
c0101c90:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101c95:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0101c98:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101c9b:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0101ca1:	83 ec 0c             	sub    $0xc,%esp
c0101ca4:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0101caa:	50                   	push   %eax
c0101cab:	e8 74 95 00 00       	call   c010b224 <Strlen>
c0101cb0:	83 c4 10             	add    $0x10,%esp
c0101cb3:	89 c1                	mov    %eax,%ecx
c0101cb5:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101cb8:	8d 50 04             	lea    0x4(%eax),%edx
c0101cbb:	83 ec 04             	sub    $0x4,%esp
c0101cbe:	51                   	push   %ecx
c0101cbf:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0101cc5:	50                   	push   %eax
c0101cc6:	52                   	push   %edx
c0101cc7:	e8 bd 4e 00 00       	call   c0106b89 <Memcpy>
c0101ccc:	83 c4 10             	add    $0x10,%esp
c0101ccf:	8d 95 34 ff ff ff    	lea    -0xcc(%ebp),%edx
c0101cd5:	b8 00 00 00 00       	mov    $0x0,%eax
c0101cda:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0101cdf:	89 d7                	mov    %edx,%edi
c0101ce1:	f3 ab                	rep stos %eax,%es:(%edi)
c0101ce3:	c7 85 34 ff ff ff 48 	movl   $0xc010a548,-0xcc(%ebp)
c0101cea:	a5 10 c0 
c0101ced:	c7 85 38 ff ff ff 51 	movl   $0xc010a551,-0xc8(%ebp)
c0101cf4:	a5 10 c0 
c0101cf7:	c7 85 3c ff ff ff 5a 	movl   $0xc010a55a,-0xc4(%ebp)
c0101cfe:	a5 10 c0 
c0101d01:	c7 45 bc 03 00 00 00 	movl   $0x3,-0x44(%ebp)
c0101d08:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0101d0f:	eb 49                	jmp    c0101d5a <mkfs+0x53d>
c0101d11:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0101d15:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101d18:	8d 50 02             	lea    0x2(%eax),%edx
c0101d1b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101d1e:	89 10                	mov    %edx,(%eax)
c0101d20:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101d23:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0101d2a:	83 ec 0c             	sub    $0xc,%esp
c0101d2d:	50                   	push   %eax
c0101d2e:	e8 f1 94 00 00       	call   c010b224 <Strlen>
c0101d33:	83 c4 10             	add    $0x10,%esp
c0101d36:	89 c1                	mov    %eax,%ecx
c0101d38:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101d3b:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0101d42:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0101d45:	83 c2 04             	add    $0x4,%edx
c0101d48:	83 ec 04             	sub    $0x4,%esp
c0101d4b:	51                   	push   %ecx
c0101d4c:	50                   	push   %eax
c0101d4d:	52                   	push   %edx
c0101d4e:	e8 36 4e 00 00       	call   c0106b89 <Memcpy>
c0101d53:	83 c4 10             	add    $0x10,%esp
c0101d56:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0101d5a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101d5d:	3b 45 bc             	cmp    -0x44(%ebp),%eax
c0101d60:	7c af                	jl     c0101d11 <mkfs+0x4f4>
c0101d62:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0101d69:	eb 66                	jmp    c0101dd1 <mkfs+0x5b4>
c0101d6b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101d6e:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0101d75:	83 ec 0c             	sub    $0xc,%esp
c0101d78:	50                   	push   %eax
c0101d79:	e8 a6 94 00 00       	call   c010b224 <Strlen>
c0101d7e:	83 c4 10             	add    $0x10,%esp
c0101d81:	85 c0                	test   %eax,%eax
c0101d83:	74 47                	je     c0101dcc <mkfs+0x5af>
c0101d85:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0101d89:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101d8c:	8d 50 05             	lea    0x5(%eax),%edx
c0101d8f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101d92:	89 10                	mov    %edx,(%eax)
c0101d94:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101d97:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0101d9e:	83 ec 0c             	sub    $0xc,%esp
c0101da1:	50                   	push   %eax
c0101da2:	e8 7d 94 00 00       	call   c010b224 <Strlen>
c0101da7:	83 c4 10             	add    $0x10,%esp
c0101daa:	89 c1                	mov    %eax,%ecx
c0101dac:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101daf:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0101db6:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0101db9:	83 c2 04             	add    $0x4,%edx
c0101dbc:	83 ec 04             	sub    $0x4,%esp
c0101dbf:	51                   	push   %ecx
c0101dc0:	50                   	push   %eax
c0101dc1:	52                   	push   %edx
c0101dc2:	e8 c2 4d 00 00       	call   c0106b89 <Memcpy>
c0101dc7:	83 c4 10             	add    $0x10,%esp
c0101dca:	eb 01                	jmp    c0101dcd <mkfs+0x5b0>
c0101dcc:	90                   	nop
c0101dcd:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0101dd1:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101dd4:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0101dd7:	7c 92                	jl     c0101d6b <mkfs+0x54e>
c0101dd9:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101dde:	89 c2                	mov    %eax,%edx
c0101de0:	8b 45 98             	mov    -0x68(%ebp),%eax
c0101de3:	83 ec 0c             	sub    $0xc,%esp
c0101de6:	6a 0a                	push   $0xa
c0101de8:	68 00 02 00 00       	push   $0x200
c0101ded:	52                   	push   %edx
c0101dee:	6a 20                	push   $0x20
c0101df0:	50                   	push   %eax
c0101df1:	e8 4e f9 ff ff       	call   c0101744 <rd_wt>
c0101df6:	83 c4 20             	add    $0x20,%esp
c0101df9:	90                   	nop
c0101dfa:	8b 7d fc             	mov    -0x4(%ebp),%edi
c0101dfd:	c9                   	leave  
c0101dfe:	c3                   	ret    

c0101dff <init_fs>:
c0101dff:	55                   	push   %ebp
c0101e00:	89 e5                	mov    %esp,%ebp
c0101e02:	83 ec 18             	sub    $0x18,%esp
c0101e05:	83 ec 0c             	sub    $0xc,%esp
c0101e08:	6a 7c                	push   $0x7c
c0101e0a:	e8 fd f6 ff ff       	call   c010150c <sys_malloc>
c0101e0f:	83 c4 10             	add    $0x10,%esp
c0101e12:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101e15:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101e18:	c7 40 78 06 00 00 00 	movl   $0x6,0x78(%eax)
c0101e1f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101e22:	c7 40 14 20 00 00 00 	movl   $0x20,0x14(%eax)
c0101e29:	83 ec 04             	sub    $0x4,%esp
c0101e2c:	6a 03                	push   $0x3
c0101e2e:	ff 75 f4             	pushl  -0xc(%ebp)
c0101e31:	6a 03                	push   $0x3
c0101e33:	e8 f0 73 00 00       	call   c0109228 <send_rec>
c0101e38:	83 c4 10             	add    $0x10,%esp
c0101e3b:	e8 dd f9 ff ff       	call   c010181d <mkfs>
c0101e40:	83 ec 08             	sub    $0x8,%esp
c0101e43:	6a 7c                	push   $0x7c
c0101e45:	ff 75 f4             	pushl  -0xc(%ebp)
c0101e48:	e8 d4 f6 ff ff       	call   c0101521 <sys_free>
c0101e4d:	83 c4 10             	add    $0x10,%esp
c0101e50:	90                   	nop
c0101e51:	c9                   	leave  
c0101e52:	c3                   	ret    

c0101e53 <do_open>:
c0101e53:	55                   	push   %ebp
c0101e54:	89 e5                	mov    %esp,%ebp
c0101e56:	83 ec 68             	sub    $0x68,%esp
c0101e59:	83 ec 04             	sub    $0x4,%esp
c0101e5c:	6a 0c                	push   $0xc
c0101e5e:	6a 00                	push   $0x0
c0101e60:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0101e63:	50                   	push   %eax
c0101e64:	e8 82 93 00 00       	call   c010b1eb <Memset>
c0101e69:	83 c4 10             	add    $0x10,%esp
c0101e6c:	8b 45 08             	mov    0x8(%ebp),%eax
c0101e6f:	8b 40 44             	mov    0x44(%eax),%eax
c0101e72:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0101e75:	83 ec 08             	sub    $0x8,%esp
c0101e78:	6a 0c                	push   $0xc
c0101e7a:	ff 75 e4             	pushl  -0x1c(%ebp)
c0101e7d:	e8 9a 3e 00 00       	call   c0105d1c <alloc_virtual_memory>
c0101e82:	83 c4 10             	add    $0x10,%esp
c0101e85:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0101e88:	8b 45 08             	mov    0x8(%ebp),%eax
c0101e8b:	8b 40 40             	mov    0x40(%eax),%eax
c0101e8e:	89 c2                	mov    %eax,%edx
c0101e90:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101e93:	83 ec 04             	sub    $0x4,%esp
c0101e96:	52                   	push   %edx
c0101e97:	50                   	push   %eax
c0101e98:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0101e9b:	50                   	push   %eax
c0101e9c:	e8 e8 4c 00 00       	call   c0106b89 <Memcpy>
c0101ea1:	83 c4 10             	add    $0x10,%esp
c0101ea4:	8b 45 08             	mov    0x8(%ebp),%eax
c0101ea7:	8b 40 40             	mov    0x40(%eax),%eax
c0101eaa:	c6 44 05 c4 00       	movb   $0x0,-0x3c(%ebp,%eax,1)
c0101eaf:	8b 45 08             	mov    0x8(%ebp),%eax
c0101eb2:	8b 40 74             	mov    0x74(%eax),%eax
c0101eb5:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0101eb8:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c0101ebf:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0101ec6:	eb 1f                	jmp    c0101ee7 <do_open+0x94>
c0101ec8:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c0101ecd:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0101ed0:	83 c2 4c             	add    $0x4c,%edx
c0101ed3:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c0101ed7:	85 c0                	test   %eax,%eax
c0101ed9:	75 08                	jne    c0101ee3 <do_open+0x90>
c0101edb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101ede:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101ee1:	eb 0a                	jmp    c0101eed <do_open+0x9a>
c0101ee3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0101ee7:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c0101eeb:	7e db                	jle    c0101ec8 <do_open+0x75>
c0101eed:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c0101ef1:	75 1c                	jne    c0101f0f <do_open+0xbc>
c0101ef3:	68 c6 01 00 00       	push   $0x1c6
c0101ef8:	68 70 a4 10 c0       	push   $0xc010a470
c0101efd:	68 70 a4 10 c0       	push   $0xc010a470
c0101f02:	68 63 a5 10 c0       	push   $0xc010a563
c0101f07:	e8 ac 66 00 00       	call   c01085b8 <assertion_failure>
c0101f0c:	83 c4 10             	add    $0x10,%esp
c0101f0f:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%ebp)
c0101f16:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0101f1d:	eb 1d                	jmp    c0101f3c <do_open+0xe9>
c0101f1f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101f22:	c1 e0 04             	shl    $0x4,%eax
c0101f25:	05 88 13 11 c0       	add    $0xc0111388,%eax
c0101f2a:	8b 00                	mov    (%eax),%eax
c0101f2c:	85 c0                	test   %eax,%eax
c0101f2e:	75 08                	jne    c0101f38 <do_open+0xe5>
c0101f30:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101f33:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0101f36:	eb 0a                	jmp    c0101f42 <do_open+0xef>
c0101f38:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0101f3c:	83 7d e8 3f          	cmpl   $0x3f,-0x18(%ebp)
c0101f40:	7e dd                	jle    c0101f1f <do_open+0xcc>
c0101f42:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
c0101f46:	75 1c                	jne    c0101f64 <do_open+0x111>
c0101f48:	68 d2 01 00 00       	push   $0x1d2
c0101f4d:	68 70 a4 10 c0       	push   $0xc010a470
c0101f52:	68 70 a4 10 c0       	push   $0xc010a470
c0101f57:	68 6b a5 10 c0       	push   $0xc010a56b
c0101f5c:	e8 57 66 00 00       	call   c01085b8 <assertion_failure>
c0101f61:	83 c4 10             	add    $0x10,%esp
c0101f64:	83 ec 0c             	sub    $0xc,%esp
c0101f67:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0101f6a:	50                   	push   %eax
c0101f6b:	e8 b2 00 00 00       	call   c0102022 <search_file>
c0101f70:	83 c4 10             	add    $0x10,%esp
c0101f73:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0101f76:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c0101f7a:	75 2b                	jne    c0101fa7 <do_open+0x154>
c0101f7c:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0101f80:	7e 10                	jle    c0101f92 <do_open+0x13f>
c0101f82:	83 ec 0c             	sub    $0xc,%esp
c0101f85:	68 73 a5 10 c0       	push   $0xc010a573
c0101f8a:	e8 0b 66 00 00       	call   c010859a <panic>
c0101f8f:	83 c4 10             	add    $0x10,%esp
c0101f92:	83 ec 08             	sub    $0x8,%esp
c0101f95:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0101f98:	50                   	push   %eax
c0101f99:	8d 45 9c             	lea    -0x64(%ebp),%eax
c0101f9c:	50                   	push   %eax
c0101f9d:	e8 40 04 00 00       	call   c01023e2 <create_file>
c0101fa2:	83 c4 10             	add    $0x10,%esp
c0101fa5:	eb 22                	jmp    c0101fc9 <do_open+0x176>
c0101fa7:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
c0101fab:	75 07                	jne    c0101fb4 <do_open+0x161>
c0101fad:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0101fb2:	eb 6c                	jmp    c0102020 <do_open+0x1cd>
c0101fb4:	83 ec 08             	sub    $0x8,%esp
c0101fb7:	ff 75 d8             	pushl  -0x28(%ebp)
c0101fba:	8d 45 9c             	lea    -0x64(%ebp),%eax
c0101fbd:	50                   	push   %eax
c0101fbe:	e8 5d 02 00 00       	call   c0102220 <get_inode>
c0101fc3:	83 c4 10             	add    $0x10,%esp
c0101fc6:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0101fc9:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c0101fce:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0101fd1:	c1 e2 04             	shl    $0x4,%edx
c0101fd4:	8d 8a 80 13 11 c0    	lea    -0x3feeec80(%edx),%ecx
c0101fda:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0101fdd:	83 c2 4c             	add    $0x4c,%edx
c0101fe0:	89 4c 90 0c          	mov    %ecx,0xc(%eax,%edx,4)
c0101fe4:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0101fe7:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0101fea:	c1 e2 04             	shl    $0x4,%edx
c0101fed:	81 c2 88 13 11 c0    	add    $0xc0111388,%edx
c0101ff3:	89 02                	mov    %eax,(%edx)
c0101ff5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101ff8:	c1 e0 04             	shl    $0x4,%eax
c0101ffb:	05 84 13 11 c0       	add    $0xc0111384,%eax
c0102000:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0102006:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102009:	c1 e0 04             	shl    $0x4,%eax
c010200c:	05 80 13 11 c0       	add    $0xc0111380,%eax
c0102011:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0102017:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010201a:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010201d:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0102020:	c9                   	leave  
c0102021:	c3                   	ret    

c0102022 <search_file>:
c0102022:	55                   	push   %ebp
c0102023:	89 e5                	mov    %esp,%ebp
c0102025:	83 ec 68             	sub    $0x68,%esp
c0102028:	83 ec 04             	sub    $0x4,%esp
c010202b:	6a 0c                	push   $0xc
c010202d:	6a 00                	push   $0x0
c010202f:	8d 45 c0             	lea    -0x40(%ebp),%eax
c0102032:	50                   	push   %eax
c0102033:	e8 b3 91 00 00       	call   c010b1eb <Memset>
c0102038:	83 c4 10             	add    $0x10,%esp
c010203b:	83 ec 04             	sub    $0x4,%esp
c010203e:	6a 28                	push   $0x28
c0102040:	6a 00                	push   $0x0
c0102042:	8d 45 98             	lea    -0x68(%ebp),%eax
c0102045:	50                   	push   %eax
c0102046:	e8 a0 91 00 00       	call   c010b1eb <Memset>
c010204b:	83 c4 10             	add    $0x10,%esp
c010204e:	83 ec 04             	sub    $0x4,%esp
c0102051:	8d 45 98             	lea    -0x68(%ebp),%eax
c0102054:	50                   	push   %eax
c0102055:	ff 75 08             	pushl  0x8(%ebp)
c0102058:	8d 45 c0             	lea    -0x40(%ebp),%eax
c010205b:	50                   	push   %eax
c010205c:	e8 f3 00 00 00       	call   c0102154 <strip_path>
c0102061:	83 c4 10             	add    $0x10,%esp
c0102064:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0102067:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%ebp)
c010206b:	75 0a                	jne    c0102077 <search_file+0x55>
c010206d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102072:	e9 db 00 00 00       	jmp    c0102152 <search_file+0x130>
c0102077:	8b 45 9c             	mov    -0x64(%ebp),%eax
c010207a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010207d:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0102080:	05 00 02 00 00       	add    $0x200,%eax
c0102085:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c010208b:	85 c0                	test   %eax,%eax
c010208d:	0f 48 c2             	cmovs  %edx,%eax
c0102090:	c1 f8 09             	sar    $0x9,%eax
c0102093:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0102096:	8b 45 9c             	mov    -0x64(%ebp),%eax
c0102099:	c1 e8 04             	shr    $0x4,%eax
c010209c:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010209f:	e8 5c 14 00 00       	call   c0103500 <get_super_block>
c01020a4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01020a7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01020aa:	8b 00                	mov    (%eax),%eax
c01020ac:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01020af:	c7 45 cc 20 00 00 00 	movl   $0x20,-0x34(%ebp)
c01020b6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01020bd:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01020c4:	eb 7b                	jmp    c0102141 <search_file+0x11f>
c01020c6:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01020cb:	89 c1                	mov    %eax,%ecx
c01020cd:	8b 55 d0             	mov    -0x30(%ebp),%edx
c01020d0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01020d3:	01 d0                	add    %edx,%eax
c01020d5:	83 ec 0c             	sub    $0xc,%esp
c01020d8:	6a 07                	push   $0x7
c01020da:	68 00 02 00 00       	push   $0x200
c01020df:	51                   	push   %ecx
c01020e0:	ff 75 cc             	pushl  -0x34(%ebp)
c01020e3:	50                   	push   %eax
c01020e4:	e8 5b f6 ff ff       	call   c0101744 <rd_wt>
c01020e9:	83 c4 20             	add    $0x20,%esp
c01020ec:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c01020f1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01020f4:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01020fb:	eb 35                	jmp    c0102132 <search_file+0x110>
c01020fd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0102101:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102104:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0102107:	7f 33                	jg     c010213c <search_file+0x11a>
c0102109:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010210c:	83 c0 04             	add    $0x4,%eax
c010210f:	83 ec 08             	sub    $0x8,%esp
c0102112:	50                   	push   %eax
c0102113:	8d 45 c0             	lea    -0x40(%ebp),%eax
c0102116:	50                   	push   %eax
c0102117:	e8 73 74 00 00       	call   c010958f <strcmp>
c010211c:	83 c4 10             	add    $0x10,%esp
c010211f:	85 c0                	test   %eax,%eax
c0102121:	75 07                	jne    c010212a <search_file+0x108>
c0102123:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102126:	8b 00                	mov    (%eax),%eax
c0102128:	eb 28                	jmp    c0102152 <search_file+0x130>
c010212a:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c010212e:	83 45 ec 10          	addl   $0x10,-0x14(%ebp)
c0102132:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102135:	83 f8 1f             	cmp    $0x1f,%eax
c0102138:	76 c3                	jbe    c01020fd <search_file+0xdb>
c010213a:	eb 01                	jmp    c010213d <search_file+0x11b>
c010213c:	90                   	nop
c010213d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0102141:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102144:	3b 45 dc             	cmp    -0x24(%ebp),%eax
c0102147:	0f 8c 79 ff ff ff    	jl     c01020c6 <search_file+0xa4>
c010214d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102152:	c9                   	leave  
c0102153:	c3                   	ret    

c0102154 <strip_path>:
c0102154:	55                   	push   %ebp
c0102155:	89 e5                	mov    %esp,%ebp
c0102157:	83 ec 10             	sub    $0x10,%esp
c010215a:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010215e:	75 0a                	jne    c010216a <strip_path+0x16>
c0102160:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102165:	e9 b4 00 00 00       	jmp    c010221e <strip_path+0xca>
c010216a:	8b 45 08             	mov    0x8(%ebp),%eax
c010216d:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0102170:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102173:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0102176:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102179:	0f b6 00             	movzbl (%eax),%eax
c010217c:	3c 2f                	cmp    $0x2f,%al
c010217e:	75 2d                	jne    c01021ad <strip_path+0x59>
c0102180:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0102184:	eb 27                	jmp    c01021ad <strip_path+0x59>
c0102186:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102189:	0f b6 00             	movzbl (%eax),%eax
c010218c:	3c 2f                	cmp    $0x2f,%al
c010218e:	75 0a                	jne    c010219a <strip_path+0x46>
c0102190:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102195:	e9 84 00 00 00       	jmp    c010221e <strip_path+0xca>
c010219a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010219d:	0f b6 10             	movzbl (%eax),%edx
c01021a0:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01021a3:	88 10                	mov    %dl,(%eax)
c01021a5:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c01021a9:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c01021ad:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01021b0:	0f b6 00             	movzbl (%eax),%eax
c01021b3:	84 c0                	test   %al,%al
c01021b5:	75 cf                	jne    c0102186 <strip_path+0x32>
c01021b7:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01021ba:	c6 00 00             	movb   $0x0,(%eax)
c01021bd:	8b 45 10             	mov    0x10(%ebp),%eax
c01021c0:	8b 15 c0 21 11 c0    	mov    0xc01121c0,%edx
c01021c6:	89 10                	mov    %edx,(%eax)
c01021c8:	8b 15 c4 21 11 c0    	mov    0xc01121c4,%edx
c01021ce:	89 50 04             	mov    %edx,0x4(%eax)
c01021d1:	8b 15 c8 21 11 c0    	mov    0xc01121c8,%edx
c01021d7:	89 50 08             	mov    %edx,0x8(%eax)
c01021da:	8b 15 cc 21 11 c0    	mov    0xc01121cc,%edx
c01021e0:	89 50 0c             	mov    %edx,0xc(%eax)
c01021e3:	8b 15 d0 21 11 c0    	mov    0xc01121d0,%edx
c01021e9:	89 50 10             	mov    %edx,0x10(%eax)
c01021ec:	8b 15 d4 21 11 c0    	mov    0xc01121d4,%edx
c01021f2:	89 50 14             	mov    %edx,0x14(%eax)
c01021f5:	8b 15 d8 21 11 c0    	mov    0xc01121d8,%edx
c01021fb:	89 50 18             	mov    %edx,0x18(%eax)
c01021fe:	8b 15 dc 21 11 c0    	mov    0xc01121dc,%edx
c0102204:	89 50 1c             	mov    %edx,0x1c(%eax)
c0102207:	8b 15 e0 21 11 c0    	mov    0xc01121e0,%edx
c010220d:	89 50 20             	mov    %edx,0x20(%eax)
c0102210:	8b 15 e4 21 11 c0    	mov    0xc01121e4,%edx
c0102216:	89 50 24             	mov    %edx,0x24(%eax)
c0102219:	b8 00 00 00 00       	mov    $0x0,%eax
c010221e:	c9                   	leave  
c010221f:	c3                   	ret    

c0102220 <get_inode>:
c0102220:	55                   	push   %ebp
c0102221:	89 e5                	mov    %esp,%ebp
c0102223:	56                   	push   %esi
c0102224:	53                   	push   %ebx
c0102225:	83 ec 20             	sub    $0x20,%esp
c0102228:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010222c:	75 0a                	jne    c0102238 <get_inode+0x18>
c010222e:	b8 00 00 00 00       	mov    $0x0,%eax
c0102233:	e9 a3 01 00 00       	jmp    c01023db <get_inode+0x1bb>
c0102238:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010223f:	c7 45 f0 a0 17 11 c0 	movl   $0xc01117a0,-0x10(%ebp)
c0102246:	eb 69                	jmp    c01022b1 <get_inode+0x91>
c0102248:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010224b:	8b 40 24             	mov    0x24(%eax),%eax
c010224e:	85 c0                	test   %eax,%eax
c0102250:	7e 53                	jle    c01022a5 <get_inode+0x85>
c0102252:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102255:	8b 40 10             	mov    0x10(%eax),%eax
c0102258:	39 45 0c             	cmp    %eax,0xc(%ebp)
c010225b:	75 50                	jne    c01022ad <get_inode+0x8d>
c010225d:	8b 45 08             	mov    0x8(%ebp),%eax
c0102260:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0102263:	8b 0a                	mov    (%edx),%ecx
c0102265:	89 08                	mov    %ecx,(%eax)
c0102267:	8b 4a 04             	mov    0x4(%edx),%ecx
c010226a:	89 48 04             	mov    %ecx,0x4(%eax)
c010226d:	8b 4a 08             	mov    0x8(%edx),%ecx
c0102270:	89 48 08             	mov    %ecx,0x8(%eax)
c0102273:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0102276:	89 48 0c             	mov    %ecx,0xc(%eax)
c0102279:	8b 4a 10             	mov    0x10(%edx),%ecx
c010227c:	89 48 10             	mov    %ecx,0x10(%eax)
c010227f:	8b 4a 14             	mov    0x14(%edx),%ecx
c0102282:	89 48 14             	mov    %ecx,0x14(%eax)
c0102285:	8b 4a 18             	mov    0x18(%edx),%ecx
c0102288:	89 48 18             	mov    %ecx,0x18(%eax)
c010228b:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c010228e:	89 48 1c             	mov    %ecx,0x1c(%eax)
c0102291:	8b 4a 20             	mov    0x20(%edx),%ecx
c0102294:	89 48 20             	mov    %ecx,0x20(%eax)
c0102297:	8b 52 24             	mov    0x24(%edx),%edx
c010229a:	89 50 24             	mov    %edx,0x24(%eax)
c010229d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01022a0:	e9 36 01 00 00       	jmp    c01023db <get_inode+0x1bb>
c01022a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01022a8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01022ab:	eb 0d                	jmp    c01022ba <get_inode+0x9a>
c01022ad:	83 45 f0 28          	addl   $0x28,-0x10(%ebp)
c01022b1:	81 7d f0 a0 21 11 c0 	cmpl   $0xc01121a0,-0x10(%ebp)
c01022b8:	76 8e                	jbe    c0102248 <get_inode+0x28>
c01022ba:	e8 41 12 00 00       	call   c0103500 <get_super_block>
c01022bf:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01022c2:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c01022c9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01022cc:	8b 40 04             	mov    0x4(%eax),%eax
c01022cf:	8d 50 02             	lea    0x2(%eax),%edx
c01022d2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01022d5:	8b 40 08             	mov    0x8(%eax),%eax
c01022d8:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c01022db:	8b 45 0c             	mov    0xc(%ebp),%eax
c01022de:	8d 48 ff             	lea    -0x1(%eax),%ecx
c01022e1:	b8 00 02 00 00       	mov    $0x200,%eax
c01022e6:	99                   	cltd   
c01022e7:	f7 7d e8             	idivl  -0x18(%ebp)
c01022ea:	89 c6                	mov    %eax,%esi
c01022ec:	89 c8                	mov    %ecx,%eax
c01022ee:	99                   	cltd   
c01022ef:	f7 fe                	idiv   %esi
c01022f1:	01 d8                	add    %ebx,%eax
c01022f3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01022f6:	c7 45 e0 20 00 00 00 	movl   $0x20,-0x20(%ebp)
c01022fd:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102302:	83 ec 0c             	sub    $0xc,%esp
c0102305:	6a 07                	push   $0x7
c0102307:	68 00 02 00 00       	push   $0x200
c010230c:	50                   	push   %eax
c010230d:	ff 75 e0             	pushl  -0x20(%ebp)
c0102310:	ff 75 e4             	pushl  -0x1c(%ebp)
c0102313:	e8 2c f4 ff ff       	call   c0101744 <rd_wt>
c0102318:	83 c4 20             	add    $0x20,%esp
c010231b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010231e:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0102321:	b8 00 02 00 00       	mov    $0x200,%eax
c0102326:	99                   	cltd   
c0102327:	f7 7d e8             	idivl  -0x18(%ebp)
c010232a:	89 c3                	mov    %eax,%ebx
c010232c:	89 c8                	mov    %ecx,%eax
c010232e:	99                   	cltd   
c010232f:	f7 fb                	idiv   %ebx
c0102331:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0102334:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c010233a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010233d:	0f af 45 dc          	imul   -0x24(%ebp),%eax
c0102341:	01 d0                	add    %edx,%eax
c0102343:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0102346:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102349:	8b 55 d8             	mov    -0x28(%ebp),%edx
c010234c:	8b 0a                	mov    (%edx),%ecx
c010234e:	89 08                	mov    %ecx,(%eax)
c0102350:	8b 4a 04             	mov    0x4(%edx),%ecx
c0102353:	89 48 04             	mov    %ecx,0x4(%eax)
c0102356:	8b 4a 08             	mov    0x8(%edx),%ecx
c0102359:	89 48 08             	mov    %ecx,0x8(%eax)
c010235c:	8b 4a 0c             	mov    0xc(%edx),%ecx
c010235f:	89 48 0c             	mov    %ecx,0xc(%eax)
c0102362:	8b 4a 10             	mov    0x10(%edx),%ecx
c0102365:	89 48 10             	mov    %ecx,0x10(%eax)
c0102368:	8b 4a 14             	mov    0x14(%edx),%ecx
c010236b:	89 48 14             	mov    %ecx,0x14(%eax)
c010236e:	8b 4a 18             	mov    0x18(%edx),%ecx
c0102371:	89 48 18             	mov    %ecx,0x18(%eax)
c0102374:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0102377:	89 48 1c             	mov    %ecx,0x1c(%eax)
c010237a:	8b 4a 20             	mov    0x20(%edx),%ecx
c010237d:	89 48 20             	mov    %ecx,0x20(%eax)
c0102380:	8b 52 24             	mov    0x24(%edx),%edx
c0102383:	89 50 24             	mov    %edx,0x24(%eax)
c0102386:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102389:	8b 55 0c             	mov    0xc(%ebp),%edx
c010238c:	89 50 10             	mov    %edx,0x10(%eax)
c010238f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102392:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0102395:	89 50 20             	mov    %edx,0x20(%eax)
c0102398:	8b 45 08             	mov    0x8(%ebp),%eax
c010239b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010239e:	8b 0a                	mov    (%edx),%ecx
c01023a0:	89 08                	mov    %ecx,(%eax)
c01023a2:	8b 4a 04             	mov    0x4(%edx),%ecx
c01023a5:	89 48 04             	mov    %ecx,0x4(%eax)
c01023a8:	8b 4a 08             	mov    0x8(%edx),%ecx
c01023ab:	89 48 08             	mov    %ecx,0x8(%eax)
c01023ae:	8b 4a 0c             	mov    0xc(%edx),%ecx
c01023b1:	89 48 0c             	mov    %ecx,0xc(%eax)
c01023b4:	8b 4a 10             	mov    0x10(%edx),%ecx
c01023b7:	89 48 10             	mov    %ecx,0x10(%eax)
c01023ba:	8b 4a 14             	mov    0x14(%edx),%ecx
c01023bd:	89 48 14             	mov    %ecx,0x14(%eax)
c01023c0:	8b 4a 18             	mov    0x18(%edx),%ecx
c01023c3:	89 48 18             	mov    %ecx,0x18(%eax)
c01023c6:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c01023c9:	89 48 1c             	mov    %ecx,0x1c(%eax)
c01023cc:	8b 4a 20             	mov    0x20(%edx),%ecx
c01023cf:	89 48 20             	mov    %ecx,0x20(%eax)
c01023d2:	8b 52 24             	mov    0x24(%edx),%edx
c01023d5:	89 50 24             	mov    %edx,0x24(%eax)
c01023d8:	8b 45 08             	mov    0x8(%ebp),%eax
c01023db:	8d 65 f8             	lea    -0x8(%ebp),%esp
c01023de:	5b                   	pop    %ebx
c01023df:	5e                   	pop    %esi
c01023e0:	5d                   	pop    %ebp
c01023e1:	c3                   	ret    

c01023e2 <create_file>:
c01023e2:	55                   	push   %ebp
c01023e3:	89 e5                	mov    %esp,%ebp
c01023e5:	81 ec 98 00 00 00    	sub    $0x98,%esp
c01023eb:	8d 45 b8             	lea    -0x48(%ebp),%eax
c01023ee:	50                   	push   %eax
c01023ef:	ff 75 0c             	pushl  0xc(%ebp)
c01023f2:	8d 45 ac             	lea    -0x54(%ebp),%eax
c01023f5:	50                   	push   %eax
c01023f6:	e8 59 fd ff ff       	call   c0102154 <strip_path>
c01023fb:	83 c4 0c             	add    $0xc,%esp
c01023fe:	83 f8 ff             	cmp    $0xffffffff,%eax
c0102401:	75 0a                	jne    c010240d <create_file+0x2b>
c0102403:	b8 00 00 00 00       	mov    $0x0,%eax
c0102408:	e9 de 00 00 00       	jmp    c01024eb <create_file+0x109>
c010240d:	e8 db 00 00 00       	call   c01024ed <alloc_imap_bit>
c0102412:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102415:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102419:	75 0a                	jne    c0102425 <create_file+0x43>
c010241b:	b8 00 00 00 00       	mov    $0x0,%eax
c0102420:	e9 c6 00 00 00       	jmp    c01024eb <create_file+0x109>
c0102425:	e8 d6 10 00 00       	call   c0103500 <get_super_block>
c010242a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010242d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102430:	8b 40 10             	mov    0x10(%eax),%eax
c0102433:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102436:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102439:	83 ec 08             	sub    $0x8,%esp
c010243c:	50                   	push   %eax
c010243d:	ff 75 f4             	pushl  -0xc(%ebp)
c0102440:	e8 a5 01 00 00       	call   c01025ea <alloc_smap_bit>
c0102445:	83 c4 10             	add    $0x10,%esp
c0102448:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010244b:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c010244f:	75 0a                	jne    c010245b <create_file+0x79>
c0102451:	b8 00 00 00 00       	mov    $0x0,%eax
c0102456:	e9 90 00 00 00       	jmp    c01024eb <create_file+0x109>
c010245b:	83 ec 04             	sub    $0x4,%esp
c010245e:	ff 75 e8             	pushl  -0x18(%ebp)
c0102461:	ff 75 f4             	pushl  -0xc(%ebp)
c0102464:	8d 45 84             	lea    -0x7c(%ebp),%eax
c0102467:	50                   	push   %eax
c0102468:	e8 1e 03 00 00       	call   c010278b <new_inode>
c010246d:	83 c4 10             	add    $0x10,%esp
c0102470:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0102473:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0102477:	75 07                	jne    c0102480 <create_file+0x9e>
c0102479:	b8 00 00 00 00       	mov    $0x0,%eax
c010247e:	eb 6b                	jmp    c01024eb <create_file+0x109>
c0102480:	ff 75 f4             	pushl  -0xc(%ebp)
c0102483:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0102486:	50                   	push   %eax
c0102487:	8d 45 b8             	lea    -0x48(%ebp),%eax
c010248a:	50                   	push   %eax
c010248b:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102491:	50                   	push   %eax
c0102492:	e8 12 04 00 00       	call   c01028a9 <new_dir_entry>
c0102497:	83 c4 10             	add    $0x10,%esp
c010249a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010249d:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c01024a1:	75 07                	jne    c01024aa <create_file+0xc8>
c01024a3:	b8 00 00 00 00       	mov    $0x0,%eax
c01024a8:	eb 41                	jmp    c01024eb <create_file+0x109>
c01024aa:	8b 45 08             	mov    0x8(%ebp),%eax
c01024ad:	8b 55 84             	mov    -0x7c(%ebp),%edx
c01024b0:	89 10                	mov    %edx,(%eax)
c01024b2:	8b 55 88             	mov    -0x78(%ebp),%edx
c01024b5:	89 50 04             	mov    %edx,0x4(%eax)
c01024b8:	8b 55 8c             	mov    -0x74(%ebp),%edx
c01024bb:	89 50 08             	mov    %edx,0x8(%eax)
c01024be:	8b 55 90             	mov    -0x70(%ebp),%edx
c01024c1:	89 50 0c             	mov    %edx,0xc(%eax)
c01024c4:	8b 55 94             	mov    -0x6c(%ebp),%edx
c01024c7:	89 50 10             	mov    %edx,0x10(%eax)
c01024ca:	8b 55 98             	mov    -0x68(%ebp),%edx
c01024cd:	89 50 14             	mov    %edx,0x14(%eax)
c01024d0:	8b 55 9c             	mov    -0x64(%ebp),%edx
c01024d3:	89 50 18             	mov    %edx,0x18(%eax)
c01024d6:	8b 55 a0             	mov    -0x60(%ebp),%edx
c01024d9:	89 50 1c             	mov    %edx,0x1c(%eax)
c01024dc:	8b 55 a4             	mov    -0x5c(%ebp),%edx
c01024df:	89 50 20             	mov    %edx,0x20(%eax)
c01024e2:	8b 55 a8             	mov    -0x58(%ebp),%edx
c01024e5:	89 50 24             	mov    %edx,0x24(%eax)
c01024e8:	8b 45 08             	mov    0x8(%ebp),%eax
c01024eb:	c9                   	leave  
c01024ec:	c3                   	ret    

c01024ed <alloc_imap_bit>:
c01024ed:	55                   	push   %ebp
c01024ee:	89 e5                	mov    %esp,%ebp
c01024f0:	53                   	push   %ebx
c01024f1:	83 ec 24             	sub    $0x24,%esp
c01024f4:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c01024fb:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c0102502:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102507:	83 ec 0c             	sub    $0xc,%esp
c010250a:	6a 07                	push   $0x7
c010250c:	68 00 02 00 00       	push   $0x200
c0102511:	50                   	push   %eax
c0102512:	ff 75 e8             	pushl  -0x18(%ebp)
c0102515:	ff 75 ec             	pushl  -0x14(%ebp)
c0102518:	e8 27 f2 ff ff       	call   c0101744 <rd_wt>
c010251d:	83 c4 20             	add    $0x20,%esp
c0102520:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0102527:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010252e:	e9 a5 00 00 00       	jmp    c01025d8 <alloc_imap_bit+0xeb>
c0102533:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c010253a:	e9 8b 00 00 00       	jmp    c01025ca <alloc_imap_bit+0xdd>
c010253f:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102545:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102548:	01 d0                	add    %edx,%eax
c010254a:	0f b6 00             	movzbl (%eax),%eax
c010254d:	0f be d0             	movsbl %al,%edx
c0102550:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102553:	89 c1                	mov    %eax,%ecx
c0102555:	d3 fa                	sar    %cl,%edx
c0102557:	89 d0                	mov    %edx,%eax
c0102559:	83 e0 01             	and    $0x1,%eax
c010255c:	85 c0                	test   %eax,%eax
c010255e:	74 06                	je     c0102566 <alloc_imap_bit+0x79>
c0102560:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0102564:	eb 64                	jmp    c01025ca <alloc_imap_bit+0xdd>
c0102566:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c010256c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010256f:	01 d0                	add    %edx,%eax
c0102571:	0f b6 18             	movzbl (%eax),%ebx
c0102574:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102577:	ba 01 00 00 00       	mov    $0x1,%edx
c010257c:	89 c1                	mov    %eax,%ecx
c010257e:	d3 e2                	shl    %cl,%edx
c0102580:	89 d0                	mov    %edx,%eax
c0102582:	89 c1                	mov    %eax,%ecx
c0102584:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c010258a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010258d:	01 d0                	add    %edx,%eax
c010258f:	09 cb                	or     %ecx,%ebx
c0102591:	89 da                	mov    %ebx,%edx
c0102593:	88 10                	mov    %dl,(%eax)
c0102595:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102598:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c010259f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01025a2:	01 d0                	add    %edx,%eax
c01025a4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01025a7:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01025ac:	83 ec 0c             	sub    $0xc,%esp
c01025af:	6a 0a                	push   $0xa
c01025b1:	68 00 02 00 00       	push   $0x200
c01025b6:	50                   	push   %eax
c01025b7:	ff 75 e8             	pushl  -0x18(%ebp)
c01025ba:	ff 75 ec             	pushl  -0x14(%ebp)
c01025bd:	e8 82 f1 ff ff       	call   c0101744 <rd_wt>
c01025c2:	83 c4 20             	add    $0x20,%esp
c01025c5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01025c8:	eb 1b                	jmp    c01025e5 <alloc_imap_bit+0xf8>
c01025ca:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
c01025ce:	0f 8e 6b ff ff ff    	jle    c010253f <alloc_imap_bit+0x52>
c01025d4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01025d8:	81 7d f4 ff 01 00 00 	cmpl   $0x1ff,-0xc(%ebp)
c01025df:	0f 8e 4e ff ff ff    	jle    c0102533 <alloc_imap_bit+0x46>
c01025e5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01025e8:	c9                   	leave  
c01025e9:	c3                   	ret    

c01025ea <alloc_smap_bit>:
c01025ea:	55                   	push   %ebp
c01025eb:	89 e5                	mov    %esp,%ebp
c01025ed:	53                   	push   %ebx
c01025ee:	83 ec 34             	sub    $0x34,%esp
c01025f1:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01025f5:	75 1c                	jne    c0102613 <alloc_smap_bit+0x29>
c01025f7:	68 fc 02 00 00       	push   $0x2fc
c01025fc:	68 70 a4 10 c0       	push   $0xc010a470
c0102601:	68 70 a4 10 c0       	push   $0xc010a470
c0102606:	68 80 a5 10 c0       	push   $0xc010a580
c010260b:	e8 a8 5f 00 00       	call   c01085b8 <assertion_failure>
c0102610:	83 c4 10             	add    $0x10,%esp
c0102613:	e8 e8 0e 00 00       	call   c0103500 <get_super_block>
c0102618:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010261b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010261e:	8b 40 08             	mov    0x8(%eax),%eax
c0102621:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0102624:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102627:	8b 40 04             	mov    0x4(%eax),%eax
c010262a:	83 c0 02             	add    $0x2,%eax
c010262d:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0102630:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0102637:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c010263e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102645:	e9 20 01 00 00       	jmp    c010276a <alloc_smap_bit+0x180>
c010264a:	8b 55 dc             	mov    -0x24(%ebp),%edx
c010264d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102650:	01 d0                	add    %edx,%eax
c0102652:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0102655:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010265a:	83 ec 0c             	sub    $0xc,%esp
c010265d:	6a 07                	push   $0x7
c010265f:	68 00 02 00 00       	push   $0x200
c0102664:	50                   	push   %eax
c0102665:	ff 75 d8             	pushl  -0x28(%ebp)
c0102668:	ff 75 d4             	pushl  -0x2c(%ebp)
c010266b:	e8 d4 f0 ff ff       	call   c0101744 <rd_wt>
c0102670:	83 c4 20             	add    $0x20,%esp
c0102673:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c010267a:	e9 b0 00 00 00       	jmp    c010272f <alloc_smap_bit+0x145>
c010267f:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0102686:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010268a:	0f 85 8c 00 00 00    	jne    c010271c <alloc_smap_bit+0x132>
c0102690:	eb 45                	jmp    c01026d7 <alloc_smap_bit+0xed>
c0102692:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102698:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010269b:	01 d0                	add    %edx,%eax
c010269d:	0f b6 00             	movzbl (%eax),%eax
c01026a0:	0f be d0             	movsbl %al,%edx
c01026a3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01026a6:	89 c1                	mov    %eax,%ecx
c01026a8:	d3 fa                	sar    %cl,%edx
c01026aa:	89 d0                	mov    %edx,%eax
c01026ac:	83 e0 01             	and    $0x1,%eax
c01026af:	85 c0                	test   %eax,%eax
c01026b1:	74 06                	je     c01026b9 <alloc_smap_bit+0xcf>
c01026b3:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c01026b7:	eb 1e                	jmp    c01026d7 <alloc_smap_bit+0xed>
c01026b9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01026bc:	c1 e0 09             	shl    $0x9,%eax
c01026bf:	89 c2                	mov    %eax,%edx
c01026c1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01026c4:	01 d0                	add    %edx,%eax
c01026c6:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c01026cd:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01026d0:	01 d0                	add    %edx,%eax
c01026d2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01026d5:	eb 06                	jmp    c01026dd <alloc_smap_bit+0xf3>
c01026d7:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c01026db:	7e b5                	jle    c0102692 <alloc_smap_bit+0xa8>
c01026dd:	eb 3d                	jmp    c010271c <alloc_smap_bit+0x132>
c01026df:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01026e3:	74 45                	je     c010272a <alloc_smap_bit+0x140>
c01026e5:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01026eb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01026ee:	01 d0                	add    %edx,%eax
c01026f0:	0f b6 18             	movzbl (%eax),%ebx
c01026f3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01026f6:	ba 01 00 00 00       	mov    $0x1,%edx
c01026fb:	89 c1                	mov    %eax,%ecx
c01026fd:	d3 e2                	shl    %cl,%edx
c01026ff:	89 d0                	mov    %edx,%eax
c0102701:	89 c1                	mov    %eax,%ecx
c0102703:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102709:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010270c:	01 d0                	add    %edx,%eax
c010270e:	09 cb                	or     %ecx,%ebx
c0102710:	89 da                	mov    %ebx,%edx
c0102712:	88 10                	mov    %dl,(%eax)
c0102714:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0102718:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c010271c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102720:	74 09                	je     c010272b <alloc_smap_bit+0x141>
c0102722:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0102726:	7e b7                	jle    c01026df <alloc_smap_bit+0xf5>
c0102728:	eb 01                	jmp    c010272b <alloc_smap_bit+0x141>
c010272a:	90                   	nop
c010272b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c010272f:	81 7d ec ff 01 00 00 	cmpl   $0x1ff,-0x14(%ebp)
c0102736:	0f 8e 43 ff ff ff    	jle    c010267f <alloc_smap_bit+0x95>
c010273c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102740:	74 1e                	je     c0102760 <alloc_smap_bit+0x176>
c0102742:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102747:	83 ec 0c             	sub    $0xc,%esp
c010274a:	6a 0a                	push   $0xa
c010274c:	68 00 02 00 00       	push   $0x200
c0102751:	50                   	push   %eax
c0102752:	ff 75 d8             	pushl  -0x28(%ebp)
c0102755:	ff 75 d4             	pushl  -0x2c(%ebp)
c0102758:	e8 e7 ef ff ff       	call   c0101744 <rd_wt>
c010275d:	83 c4 20             	add    $0x20,%esp
c0102760:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102764:	74 12                	je     c0102778 <alloc_smap_bit+0x18e>
c0102766:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c010276a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010276d:	3b 45 e0             	cmp    -0x20(%ebp),%eax
c0102770:	0f 8c d4 fe ff ff    	jl     c010264a <alloc_smap_bit+0x60>
c0102776:	eb 01                	jmp    c0102779 <alloc_smap_bit+0x18f>
c0102778:	90                   	nop
c0102779:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010277c:	8d 50 ff             	lea    -0x1(%eax),%edx
c010277f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102782:	8b 00                	mov    (%eax),%eax
c0102784:	01 d0                	add    %edx,%eax
c0102786:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0102789:	c9                   	leave  
c010278a:	c3                   	ret    

c010278b <new_inode>:
c010278b:	55                   	push   %ebp
c010278c:	89 e5                	mov    %esp,%ebp
c010278e:	83 ec 38             	sub    $0x38,%esp
c0102791:	83 ec 08             	sub    $0x8,%esp
c0102794:	ff 75 0c             	pushl  0xc(%ebp)
c0102797:	8d 45 c8             	lea    -0x38(%ebp),%eax
c010279a:	50                   	push   %eax
c010279b:	e8 80 fa ff ff       	call   c0102220 <get_inode>
c01027a0:	83 c4 10             	add    $0x10,%esp
c01027a3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01027a6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c01027aa:	75 0a                	jne    c01027b6 <new_inode+0x2b>
c01027ac:	b8 00 00 00 00       	mov    $0x0,%eax
c01027b1:	e9 f1 00 00 00       	jmp    c01028a7 <new_inode+0x11c>
c01027b6:	8b 45 10             	mov    0x10(%ebp),%eax
c01027b9:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01027bc:	c7 45 d4 00 08 00 00 	movl   $0x800,-0x2c(%ebp)
c01027c3:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c01027ca:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
c01027d1:	8b 45 0c             	mov    0xc(%ebp),%eax
c01027d4:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01027d7:	83 ec 0c             	sub    $0xc,%esp
c01027da:	8d 45 c8             	lea    -0x38(%ebp),%eax
c01027dd:	50                   	push   %eax
c01027de:	e8 39 0b 00 00       	call   c010331c <sync_inode>
c01027e3:	83 c4 10             	add    $0x10,%esp
c01027e6:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c01027ed:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01027f4:	eb 1d                	jmp    c0102813 <new_inode+0x88>
c01027f6:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01027f9:	89 d0                	mov    %edx,%eax
c01027fb:	c1 e0 02             	shl    $0x2,%eax
c01027fe:	01 d0                	add    %edx,%eax
c0102800:	c1 e0 03             	shl    $0x3,%eax
c0102803:	05 b0 17 11 c0       	add    $0xc01117b0,%eax
c0102808:	8b 00                	mov    (%eax),%eax
c010280a:	39 45 0c             	cmp    %eax,0xc(%ebp)
c010280d:	74 0c                	je     c010281b <new_inode+0x90>
c010280f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0102813:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c0102817:	7e dd                	jle    c01027f6 <new_inode+0x6b>
c0102819:	eb 01                	jmp    c010281c <new_inode+0x91>
c010281b:	90                   	nop
c010281c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010281f:	89 d0                	mov    %edx,%eax
c0102821:	c1 e0 02             	shl    $0x2,%eax
c0102824:	01 d0                	add    %edx,%eax
c0102826:	c1 e0 03             	shl    $0x3,%eax
c0102829:	05 a0 17 11 c0       	add    $0xc01117a0,%eax
c010282e:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0102831:	89 10                	mov    %edx,(%eax)
c0102833:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102836:	89 50 04             	mov    %edx,0x4(%eax)
c0102839:	8b 55 d0             	mov    -0x30(%ebp),%edx
c010283c:	89 50 08             	mov    %edx,0x8(%eax)
c010283f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0102842:	89 50 0c             	mov    %edx,0xc(%eax)
c0102845:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0102848:	89 50 10             	mov    %edx,0x10(%eax)
c010284b:	8b 55 dc             	mov    -0x24(%ebp),%edx
c010284e:	89 50 14             	mov    %edx,0x14(%eax)
c0102851:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0102854:	89 50 18             	mov    %edx,0x18(%eax)
c0102857:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c010285a:	89 50 1c             	mov    %edx,0x1c(%eax)
c010285d:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0102860:	89 50 20             	mov    %edx,0x20(%eax)
c0102863:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0102866:	89 50 24             	mov    %edx,0x24(%eax)
c0102869:	8b 45 08             	mov    0x8(%ebp),%eax
c010286c:	8b 55 c8             	mov    -0x38(%ebp),%edx
c010286f:	89 10                	mov    %edx,(%eax)
c0102871:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102874:	89 50 04             	mov    %edx,0x4(%eax)
c0102877:	8b 55 d0             	mov    -0x30(%ebp),%edx
c010287a:	89 50 08             	mov    %edx,0x8(%eax)
c010287d:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0102880:	89 50 0c             	mov    %edx,0xc(%eax)
c0102883:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0102886:	89 50 10             	mov    %edx,0x10(%eax)
c0102889:	8b 55 dc             	mov    -0x24(%ebp),%edx
c010288c:	89 50 14             	mov    %edx,0x14(%eax)
c010288f:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0102892:	89 50 18             	mov    %edx,0x18(%eax)
c0102895:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0102898:	89 50 1c             	mov    %edx,0x1c(%eax)
c010289b:	8b 55 e8             	mov    -0x18(%ebp),%edx
c010289e:	89 50 20             	mov    %edx,0x20(%eax)
c01028a1:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01028a4:	89 50 24             	mov    %edx,0x24(%eax)
c01028a7:	c9                   	leave  
c01028a8:	c3                   	ret    

c01028a9 <new_dir_entry>:
c01028a9:	55                   	push   %ebp
c01028aa:	89 e5                	mov    %esp,%ebp
c01028ac:	83 ec 48             	sub    $0x48,%esp
c01028af:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
c01028b6:	8b 45 0c             	mov    0xc(%ebp),%eax
c01028b9:	8b 40 04             	mov    0x4(%eax),%eax
c01028bc:	99                   	cltd   
c01028bd:	f7 7d dc             	idivl  -0x24(%ebp)
c01028c0:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01028c3:	8b 45 0c             	mov    0xc(%ebp),%eax
c01028c6:	8b 40 0c             	mov    0xc(%eax),%eax
c01028c9:	99                   	cltd   
c01028ca:	f7 7d dc             	idivl  -0x24(%ebp)
c01028cd:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01028d0:	e8 2b 0c 00 00       	call   c0103500 <get_super_block>
c01028d5:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01028d8:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01028db:	8b 00                	mov    (%eax),%eax
c01028dd:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01028e0:	8b 45 0c             	mov    0xc(%ebp),%eax
c01028e3:	8b 40 0c             	mov    0xc(%eax),%eax
c01028e6:	05 00 02 00 00       	add    $0x200,%eax
c01028eb:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c01028f1:	85 c0                	test   %eax,%eax
c01028f3:	0f 48 c2             	cmovs  %edx,%eax
c01028f6:	c1 f8 09             	sar    $0x9,%eax
c01028f9:	89 45 c8             	mov    %eax,-0x38(%ebp)
c01028fc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0102903:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c010290a:	c7 45 c4 20 00 00 00 	movl   $0x20,-0x3c(%ebp)
c0102911:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0102918:	eb 7f                	jmp    c0102999 <new_dir_entry+0xf0>
c010291a:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010291f:	89 c1                	mov    %eax,%ecx
c0102921:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102924:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102927:	01 d0                	add    %edx,%eax
c0102929:	83 ec 0c             	sub    $0xc,%esp
c010292c:	6a 07                	push   $0x7
c010292e:	68 00 02 00 00       	push   $0x200
c0102933:	51                   	push   %ecx
c0102934:	ff 75 c4             	pushl  -0x3c(%ebp)
c0102937:	50                   	push   %eax
c0102938:	e8 07 ee ff ff       	call   c0101744 <rd_wt>
c010293d:	83 c4 20             	add    $0x20,%esp
c0102940:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0102945:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0102948:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c010294f:	eb 25                	jmp    c0102976 <new_dir_entry+0xcd>
c0102951:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0102955:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102958:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c010295b:	7f 29                	jg     c0102986 <new_dir_entry+0xdd>
c010295d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102960:	8b 00                	mov    (%eax),%eax
c0102962:	85 c0                	test   %eax,%eax
c0102964:	75 08                	jne    c010296e <new_dir_entry+0xc5>
c0102966:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102969:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010296c:	eb 19                	jmp    c0102987 <new_dir_entry+0xde>
c010296e:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0102972:	83 45 f0 10          	addl   $0x10,-0x10(%ebp)
c0102976:	b8 00 02 00 00       	mov    $0x200,%eax
c010297b:	99                   	cltd   
c010297c:	f7 7d dc             	idivl  -0x24(%ebp)
c010297f:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0102982:	7c cd                	jl     c0102951 <new_dir_entry+0xa8>
c0102984:	eb 01                	jmp    c0102987 <new_dir_entry+0xde>
c0102986:	90                   	nop
c0102987:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010298a:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c010298d:	7f 16                	jg     c01029a5 <new_dir_entry+0xfc>
c010298f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102993:	75 10                	jne    c01029a5 <new_dir_entry+0xfc>
c0102995:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0102999:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010299c:	3b 45 c8             	cmp    -0x38(%ebp),%eax
c010299f:	0f 8c 75 ff ff ff    	jl     c010291a <new_dir_entry+0x71>
c01029a5:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01029a8:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
c01029ab:	75 0a                	jne    c01029b7 <new_dir_entry+0x10e>
c01029ad:	b8 00 00 00 00       	mov    $0x0,%eax
c01029b2:	e9 fc 00 00 00       	jmp    c0102ab3 <new_dir_entry+0x20a>
c01029b7:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c01029be:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01029c2:	75 1e                	jne    c01029e2 <new_dir_entry+0x139>
c01029c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01029c7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01029ca:	8b 45 0c             	mov    0xc(%ebp),%eax
c01029cd:	8b 50 04             	mov    0x4(%eax),%edx
c01029d0:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01029d3:	01 c2                	add    %eax,%edx
c01029d5:	8b 45 0c             	mov    0xc(%ebp),%eax
c01029d8:	89 50 04             	mov    %edx,0x4(%eax)
c01029db:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c01029e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01029e5:	8b 55 14             	mov    0x14(%ebp),%edx
c01029e8:	89 10                	mov    %edx,(%eax)
c01029ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01029ed:	83 c0 04             	add    $0x4,%eax
c01029f0:	83 ec 08             	sub    $0x8,%esp
c01029f3:	ff 75 10             	pushl  0x10(%ebp)
c01029f6:	50                   	push   %eax
c01029f7:	e8 0e 88 00 00       	call   c010b20a <Strcpy>
c01029fc:	83 c4 10             	add    $0x10,%esp
c01029ff:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a02:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102a05:	8b 0a                	mov    (%edx),%ecx
c0102a07:	89 08                	mov    %ecx,(%eax)
c0102a09:	8b 4a 04             	mov    0x4(%edx),%ecx
c0102a0c:	89 48 04             	mov    %ecx,0x4(%eax)
c0102a0f:	8b 4a 08             	mov    0x8(%edx),%ecx
c0102a12:	89 48 08             	mov    %ecx,0x8(%eax)
c0102a15:	8b 52 0c             	mov    0xc(%edx),%edx
c0102a18:	89 50 0c             	mov    %edx,0xc(%eax)
c0102a1b:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102a20:	89 c1                	mov    %eax,%ecx
c0102a22:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102a25:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102a28:	01 d0                	add    %edx,%eax
c0102a2a:	83 ec 0c             	sub    $0xc,%esp
c0102a2d:	6a 0a                	push   $0xa
c0102a2f:	68 00 02 00 00       	push   $0x200
c0102a34:	51                   	push   %ecx
c0102a35:	ff 75 c4             	pushl  -0x3c(%ebp)
c0102a38:	50                   	push   %eax
c0102a39:	e8 06 ed ff ff       	call   c0101744 <rd_wt>
c0102a3e:	83 c4 20             	add    $0x20,%esp
c0102a41:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0102a45:	74 69                	je     c0102ab0 <new_dir_entry+0x207>
c0102a47:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102a4a:	8b 10                	mov    (%eax),%edx
c0102a4c:	89 15 c0 21 11 c0    	mov    %edx,0xc01121c0
c0102a52:	8b 50 04             	mov    0x4(%eax),%edx
c0102a55:	89 15 c4 21 11 c0    	mov    %edx,0xc01121c4
c0102a5b:	8b 50 08             	mov    0x8(%eax),%edx
c0102a5e:	89 15 c8 21 11 c0    	mov    %edx,0xc01121c8
c0102a64:	8b 50 0c             	mov    0xc(%eax),%edx
c0102a67:	89 15 cc 21 11 c0    	mov    %edx,0xc01121cc
c0102a6d:	8b 50 10             	mov    0x10(%eax),%edx
c0102a70:	89 15 d0 21 11 c0    	mov    %edx,0xc01121d0
c0102a76:	8b 50 14             	mov    0x14(%eax),%edx
c0102a79:	89 15 d4 21 11 c0    	mov    %edx,0xc01121d4
c0102a7f:	8b 50 18             	mov    0x18(%eax),%edx
c0102a82:	89 15 d8 21 11 c0    	mov    %edx,0xc01121d8
c0102a88:	8b 50 1c             	mov    0x1c(%eax),%edx
c0102a8b:	89 15 dc 21 11 c0    	mov    %edx,0xc01121dc
c0102a91:	8b 50 20             	mov    0x20(%eax),%edx
c0102a94:	89 15 e0 21 11 c0    	mov    %edx,0xc01121e0
c0102a9a:	8b 40 24             	mov    0x24(%eax),%eax
c0102a9d:	a3 e4 21 11 c0       	mov    %eax,0xc01121e4
c0102aa2:	83 ec 0c             	sub    $0xc,%esp
c0102aa5:	ff 75 0c             	pushl  0xc(%ebp)
c0102aa8:	e8 6f 08 00 00       	call   c010331c <sync_inode>
c0102aad:	83 c4 10             	add    $0x10,%esp
c0102ab0:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ab3:	c9                   	leave  
c0102ab4:	c3                   	ret    

c0102ab5 <do_unlink>:
c0102ab5:	55                   	push   %ebp
c0102ab6:	89 e5                	mov    %esp,%ebp
c0102ab8:	53                   	push   %ebx
c0102ab9:	81 ec a4 00 00 00    	sub    $0xa4,%esp
c0102abf:	83 ec 08             	sub    $0x8,%esp
c0102ac2:	ff 75 08             	pushl  0x8(%ebp)
c0102ac5:	68 95 a5 10 c0       	push   $0xc010a595
c0102aca:	e8 c0 6a 00 00       	call   c010958f <strcmp>
c0102acf:	83 c4 10             	add    $0x10,%esp
c0102ad2:	85 c0                	test   %eax,%eax
c0102ad4:	75 10                	jne    c0102ae6 <do_unlink+0x31>
c0102ad6:	83 ec 0c             	sub    $0xc,%esp
c0102ad9:	68 97 a5 10 c0       	push   $0xc010a597
c0102ade:	e8 b7 5a 00 00       	call   c010859a <panic>
c0102ae3:	83 c4 10             	add    $0x10,%esp
c0102ae6:	83 ec 0c             	sub    $0xc,%esp
c0102ae9:	ff 75 08             	pushl  0x8(%ebp)
c0102aec:	e8 31 f5 ff ff       	call   c0102022 <search_file>
c0102af1:	83 c4 10             	add    $0x10,%esp
c0102af4:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0102af7:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0102afb:	75 10                	jne    c0102b0d <do_unlink+0x58>
c0102afd:	83 ec 0c             	sub    $0xc,%esp
c0102b00:	68 b3 a5 10 c0       	push   $0xc010a5b3
c0102b05:	e8 90 5a 00 00       	call   c010859a <panic>
c0102b0a:	83 c4 10             	add    $0x10,%esp
c0102b0d:	83 ec 08             	sub    $0x8,%esp
c0102b10:	ff 75 d0             	pushl  -0x30(%ebp)
c0102b13:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0102b19:	50                   	push   %eax
c0102b1a:	e8 01 f7 ff ff       	call   c0102220 <get_inode>
c0102b1f:	83 c4 10             	add    $0x10,%esp
c0102b22:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0102b25:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0102b29:	75 10                	jne    c0102b3b <do_unlink+0x86>
c0102b2b:	83 ec 0c             	sub    $0xc,%esp
c0102b2e:	68 b3 a5 10 c0       	push   $0xc010a5b3
c0102b33:	e8 62 5a 00 00       	call   c010859a <panic>
c0102b38:	83 c4 10             	add    $0x10,%esp
c0102b3b:	8b 45 88             	mov    -0x78(%ebp),%eax
c0102b3e:	85 c0                	test   %eax,%eax
c0102b40:	7e 10                	jle    c0102b52 <do_unlink+0x9d>
c0102b42:	83 ec 0c             	sub    $0xc,%esp
c0102b45:	68 cc a5 10 c0       	push   $0xc010a5cc
c0102b4a:	e8 4b 5a 00 00       	call   c010859a <panic>
c0102b4f:	83 c4 10             	add    $0x10,%esp
c0102b52:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0102b58:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0102b5b:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0102b5e:	8d 50 07             	lea    0x7(%eax),%edx
c0102b61:	85 c0                	test   %eax,%eax
c0102b63:	0f 48 c2             	cmovs  %edx,%eax
c0102b66:	c1 f8 03             	sar    $0x3,%eax
c0102b69:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0102b6c:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0102b6f:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0102b75:	85 c0                	test   %eax,%eax
c0102b77:	0f 48 c2             	cmovs  %edx,%eax
c0102b7a:	c1 f8 09             	sar    $0x9,%eax
c0102b7d:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0102b80:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0102b83:	99                   	cltd   
c0102b84:	c1 ea 1d             	shr    $0x1d,%edx
c0102b87:	01 d0                	add    %edx,%eax
c0102b89:	83 e0 07             	and    $0x7,%eax
c0102b8c:	29 d0                	sub    %edx,%eax
c0102b8e:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0102b91:	c7 45 b8 20 00 00 00 	movl   $0x20,-0x48(%ebp)
c0102b98:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102b9d:	89 c2                	mov    %eax,%edx
c0102b9f:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0102ba2:	83 c0 02             	add    $0x2,%eax
c0102ba5:	83 ec 0c             	sub    $0xc,%esp
c0102ba8:	6a 07                	push   $0x7
c0102baa:	68 00 02 00 00       	push   $0x200
c0102baf:	52                   	push   %edx
c0102bb0:	ff 75 b8             	pushl  -0x48(%ebp)
c0102bb3:	50                   	push   %eax
c0102bb4:	e8 8b eb ff ff       	call   c0101744 <rd_wt>
c0102bb9:	83 c4 20             	add    $0x20,%esp
c0102bbc:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102bc2:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0102bc5:	01 d0                	add    %edx,%eax
c0102bc7:	0f b6 10             	movzbl (%eax),%edx
c0102bca:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0102bcd:	bb 01 00 00 00       	mov    $0x1,%ebx
c0102bd2:	89 c1                	mov    %eax,%ecx
c0102bd4:	d3 e3                	shl    %cl,%ebx
c0102bd6:	89 d8                	mov    %ebx,%eax
c0102bd8:	f7 d0                	not    %eax
c0102bda:	89 c3                	mov    %eax,%ebx
c0102bdc:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0102be2:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0102be5:	01 c8                	add    %ecx,%eax
c0102be7:	21 da                	and    %ebx,%edx
c0102be9:	88 10                	mov    %dl,(%eax)
c0102beb:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102bf0:	89 c2                	mov    %eax,%edx
c0102bf2:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0102bf5:	83 c0 02             	add    $0x2,%eax
c0102bf8:	83 ec 0c             	sub    $0xc,%esp
c0102bfb:	6a 0a                	push   $0xa
c0102bfd:	68 00 02 00 00       	push   $0x200
c0102c02:	52                   	push   %edx
c0102c03:	ff 75 b8             	pushl  -0x48(%ebp)
c0102c06:	50                   	push   %eax
c0102c07:	e8 38 eb ff ff       	call   c0101744 <rd_wt>
c0102c0c:	83 c4 20             	add    $0x20,%esp
c0102c0f:	e8 ec 08 00 00       	call   c0103500 <get_super_block>
c0102c14:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0102c17:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0102c1d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0102c20:	8b 00                	mov    (%eax),%eax
c0102c22:	29 c2                	sub    %eax,%edx
c0102c24:	89 d0                	mov    %edx,%eax
c0102c26:	83 c0 01             	add    $0x1,%eax
c0102c29:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0102c2c:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0102c2f:	8d 50 07             	lea    0x7(%eax),%edx
c0102c32:	85 c0                	test   %eax,%eax
c0102c34:	0f 48 c2             	cmovs  %edx,%eax
c0102c37:	c1 f8 03             	sar    $0x3,%eax
c0102c3a:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0102c3d:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0102c40:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0102c46:	85 c0                	test   %eax,%eax
c0102c48:	0f 48 c2             	cmovs  %edx,%eax
c0102c4b:	c1 f8 09             	sar    $0x9,%eax
c0102c4e:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0102c51:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0102c54:	99                   	cltd   
c0102c55:	c1 ea 1d             	shr    $0x1d,%edx
c0102c58:	01 d0                	add    %edx,%eax
c0102c5a:	83 e0 07             	and    $0x7,%eax
c0102c5d:	29 d0                	sub    %edx,%eax
c0102c5f:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0102c62:	b8 08 00 00 00       	mov    $0x8,%eax
c0102c67:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c0102c6a:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0102c6d:	29 c2                	sub    %eax,%edx
c0102c6f:	89 d0                	mov    %edx,%eax
c0102c71:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102c74:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102c77:	8d 50 07             	lea    0x7(%eax),%edx
c0102c7a:	85 c0                	test   %eax,%eax
c0102c7c:	0f 48 c2             	cmovs  %edx,%eax
c0102c7f:	c1 f8 03             	sar    $0x3,%eax
c0102c82:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0102c85:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102c8a:	89 c1                	mov    %eax,%ecx
c0102c8c:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0102c8f:	8b 40 04             	mov    0x4(%eax),%eax
c0102c92:	8d 50 02             	lea    0x2(%eax),%edx
c0102c95:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0102c98:	01 d0                	add    %edx,%eax
c0102c9a:	83 ec 0c             	sub    $0xc,%esp
c0102c9d:	6a 07                	push   $0x7
c0102c9f:	68 00 02 00 00       	push   $0x200
c0102ca4:	51                   	push   %ecx
c0102ca5:	ff 75 b8             	pushl  -0x48(%ebp)
c0102ca8:	50                   	push   %eax
c0102ca9:	e8 96 ea ff ff       	call   c0101744 <rd_wt>
c0102cae:	83 c4 20             	add    $0x20,%esp
c0102cb1:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102cb7:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0102cba:	01 d0                	add    %edx,%eax
c0102cbc:	0f b6 10             	movzbl (%eax),%edx
c0102cbf:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0102cc2:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0102cc7:	89 c1                	mov    %eax,%ecx
c0102cc9:	d3 e3                	shl    %cl,%ebx
c0102ccb:	89 d8                	mov    %ebx,%eax
c0102ccd:	f7 d0                	not    %eax
c0102ccf:	89 c3                	mov    %eax,%ebx
c0102cd1:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0102cd7:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0102cda:	01 c8                	add    %ecx,%eax
c0102cdc:	21 da                	and    %ebx,%edx
c0102cde:	88 10                	mov    %dl,(%eax)
c0102ce0:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0102ce7:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0102cea:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102ced:	eb 6b                	jmp    c0102d5a <do_unlink+0x2a5>
c0102cef:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0102cf6:	75 4c                	jne    c0102d44 <do_unlink+0x28f>
c0102cf8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102cff:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102d04:	83 ec 0c             	sub    $0xc,%esp
c0102d07:	6a 0a                	push   $0xa
c0102d09:	68 00 02 00 00       	push   $0x200
c0102d0e:	50                   	push   %eax
c0102d0f:	ff 75 b8             	pushl  -0x48(%ebp)
c0102d12:	ff 75 ec             	pushl  -0x14(%ebp)
c0102d15:	e8 2a ea ff ff       	call   c0101744 <rd_wt>
c0102d1a:	83 c4 20             	add    $0x20,%esp
c0102d1d:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102d22:	89 c1                	mov    %eax,%ecx
c0102d24:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102d27:	8d 50 01             	lea    0x1(%eax),%edx
c0102d2a:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0102d2d:	83 ec 0c             	sub    $0xc,%esp
c0102d30:	6a 07                	push   $0x7
c0102d32:	68 00 02 00 00       	push   $0x200
c0102d37:	51                   	push   %ecx
c0102d38:	ff 75 b8             	pushl  -0x48(%ebp)
c0102d3b:	50                   	push   %eax
c0102d3c:	e8 03 ea ff ff       	call   c0101744 <rd_wt>
c0102d41:	83 c4 20             	add    $0x20,%esp
c0102d44:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102d4a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102d4d:	01 d0                	add    %edx,%eax
c0102d4f:	c6 00 00             	movb   $0x0,(%eax)
c0102d52:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0102d56:	83 6d f4 08          	subl   $0x8,-0xc(%ebp)
c0102d5a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102d5d:	3b 45 a0             	cmp    -0x60(%ebp),%eax
c0102d60:	7c 8d                	jl     c0102cef <do_unlink+0x23a>
c0102d62:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0102d69:	75 4c                	jne    c0102db7 <do_unlink+0x302>
c0102d6b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102d72:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102d77:	83 ec 0c             	sub    $0xc,%esp
c0102d7a:	6a 0a                	push   $0xa
c0102d7c:	68 00 02 00 00       	push   $0x200
c0102d81:	50                   	push   %eax
c0102d82:	ff 75 b8             	pushl  -0x48(%ebp)
c0102d85:	ff 75 ec             	pushl  -0x14(%ebp)
c0102d88:	e8 b7 e9 ff ff       	call   c0101744 <rd_wt>
c0102d8d:	83 c4 20             	add    $0x20,%esp
c0102d90:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102d95:	89 c1                	mov    %eax,%ecx
c0102d97:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102d9a:	8d 50 01             	lea    0x1(%eax),%edx
c0102d9d:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0102da0:	83 ec 0c             	sub    $0xc,%esp
c0102da3:	6a 07                	push   $0x7
c0102da5:	68 00 02 00 00       	push   $0x200
c0102daa:	51                   	push   %ecx
c0102dab:	ff 75 b8             	pushl  -0x48(%ebp)
c0102dae:	50                   	push   %eax
c0102daf:	e8 90 e9 ff ff       	call   c0101744 <rd_wt>
c0102db4:	83 c4 20             	add    $0x20,%esp
c0102db7:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102dbd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102dc0:	01 d0                	add    %edx,%eax
c0102dc2:	0f b6 10             	movzbl (%eax),%edx
c0102dc5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102dc8:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0102dcd:	89 c1                	mov    %eax,%ecx
c0102dcf:	d3 e3                	shl    %cl,%ebx
c0102dd1:	89 d8                	mov    %ebx,%eax
c0102dd3:	89 c3                	mov    %eax,%ebx
c0102dd5:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0102ddb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102dde:	01 c8                	add    %ecx,%eax
c0102de0:	21 da                	and    %ebx,%edx
c0102de2:	88 10                	mov    %dl,(%eax)
c0102de4:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102de9:	83 ec 0c             	sub    $0xc,%esp
c0102dec:	6a 0a                	push   $0xa
c0102dee:	68 00 02 00 00       	push   $0x200
c0102df3:	50                   	push   %eax
c0102df4:	ff 75 b8             	pushl  -0x48(%ebp)
c0102df7:	ff 75 ec             	pushl  -0x14(%ebp)
c0102dfa:	e8 45 e9 ff ff       	call   c0101744 <rd_wt>
c0102dff:	83 c4 20             	add    $0x20,%esp
c0102e02:	c7 85 6c ff ff ff 00 	movl   $0x0,-0x94(%ebp)
c0102e09:	00 00 00 
c0102e0c:	c7 85 68 ff ff ff 00 	movl   $0x0,-0x98(%ebp)
c0102e13:	00 00 00 
c0102e16:	c7 85 70 ff ff ff 00 	movl   $0x0,-0x90(%ebp)
c0102e1d:	00 00 00 
c0102e20:	83 ec 0c             	sub    $0xc,%esp
c0102e23:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0102e29:	50                   	push   %eax
c0102e2a:	e8 ed 04 00 00       	call   c010331c <sync_inode>
c0102e2f:	83 c4 10             	add    $0x10,%esp
c0102e32:	83 ec 0c             	sub    $0xc,%esp
c0102e35:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0102e3b:	50                   	push   %eax
c0102e3c:	e8 2f 06 00 00       	call   c0103470 <put_inode>
c0102e41:	83 c4 10             	add    $0x10,%esp
c0102e44:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0102e47:	8b 00                	mov    (%eax),%eax
c0102e49:	89 45 9c             	mov    %eax,-0x64(%ebp)
c0102e4c:	c7 45 98 c0 21 11 c0 	movl   $0xc01121c0,-0x68(%ebp)
c0102e53:	8b 45 98             	mov    -0x68(%ebp),%eax
c0102e56:	8b 40 04             	mov    0x4(%eax),%eax
c0102e59:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0102e5c:	8b 45 98             	mov    -0x68(%ebp),%eax
c0102e5f:	8b 40 0c             	mov    0xc(%eax),%eax
c0102e62:	89 45 90             	mov    %eax,-0x70(%ebp)
c0102e65:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0102e68:	c1 e8 04             	shr    $0x4,%eax
c0102e6b:	89 45 8c             	mov    %eax,-0x74(%ebp)
c0102e6e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0102e75:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0102e7c:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0102e83:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0102e8a:	e9 a5 00 00 00       	jmp    c0102f34 <do_unlink+0x47f>
c0102e8f:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102e94:	89 c1                	mov    %eax,%ecx
c0102e96:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0102e99:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0102e9c:	01 d0                	add    %edx,%eax
c0102e9e:	83 ec 0c             	sub    $0xc,%esp
c0102ea1:	6a 07                	push   $0x7
c0102ea3:	68 00 02 00 00       	push   $0x200
c0102ea8:	51                   	push   %ecx
c0102ea9:	ff 75 b8             	pushl  -0x48(%ebp)
c0102eac:	50                   	push   %eax
c0102ead:	e8 92 e8 ff ff       	call   c0101744 <rd_wt>
c0102eb2:	83 c4 20             	add    $0x20,%esp
c0102eb5:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0102eba:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0102ebd:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0102ec4:	eb 51                	jmp    c0102f17 <do_unlink+0x462>
c0102ec6:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0102eca:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102ecd:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0102ed0:	7f 4f                	jg     c0102f21 <do_unlink+0x46c>
c0102ed2:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0102ed5:	83 c0 10             	add    $0x10,%eax
c0102ed8:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0102edb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0102ede:	83 c0 04             	add    $0x4,%eax
c0102ee1:	83 ec 08             	sub    $0x8,%esp
c0102ee4:	ff 75 08             	pushl  0x8(%ebp)
c0102ee7:	50                   	push   %eax
c0102ee8:	e8 a2 66 00 00       	call   c010958f <strcmp>
c0102eed:	83 c4 10             	add    $0x10,%esp
c0102ef0:	85 c0                	test   %eax,%eax
c0102ef2:	75 1b                	jne    c0102f0f <do_unlink+0x45a>
c0102ef4:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c0102efb:	83 ec 04             	sub    $0x4,%esp
c0102efe:	6a 10                	push   $0x10
c0102f00:	6a 00                	push   $0x0
c0102f02:	ff 75 d4             	pushl  -0x2c(%ebp)
c0102f05:	e8 e1 82 00 00       	call   c010b1eb <Memset>
c0102f0a:	83 c4 10             	add    $0x10,%esp
c0102f0d:	eb 13                	jmp    c0102f22 <do_unlink+0x46d>
c0102f0f:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
c0102f13:	83 45 d4 10          	addl   $0x10,-0x2c(%ebp)
c0102f17:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0102f1a:	3b 45 90             	cmp    -0x70(%ebp),%eax
c0102f1d:	7c a7                	jl     c0102ec6 <do_unlink+0x411>
c0102f1f:	eb 01                	jmp    c0102f22 <do_unlink+0x46d>
c0102f21:	90                   	nop
c0102f22:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102f25:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0102f28:	7f 16                	jg     c0102f40 <do_unlink+0x48b>
c0102f2a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0102f2e:	75 10                	jne    c0102f40 <do_unlink+0x48b>
c0102f30:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
c0102f34:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0102f37:	3b 45 90             	cmp    -0x70(%ebp),%eax
c0102f3a:	0f 8c 4f ff ff ff    	jl     c0102e8f <do_unlink+0x3da>
c0102f40:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102f43:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0102f46:	75 17                	jne    c0102f5f <do_unlink+0x4aa>
c0102f48:	8b 45 98             	mov    -0x68(%ebp),%eax
c0102f4b:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0102f4e:	89 50 04             	mov    %edx,0x4(%eax)
c0102f51:	83 ec 0c             	sub    $0xc,%esp
c0102f54:	ff 75 98             	pushl  -0x68(%ebp)
c0102f57:	e8 c0 03 00 00       	call   c010331c <sync_inode>
c0102f5c:	83 c4 10             	add    $0x10,%esp
c0102f5f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0102f63:	74 26                	je     c0102f8b <do_unlink+0x4d6>
c0102f65:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102f6a:	89 c1                	mov    %eax,%ecx
c0102f6c:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0102f6f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102f72:	01 d0                	add    %edx,%eax
c0102f74:	83 ec 0c             	sub    $0xc,%esp
c0102f77:	6a 0a                	push   $0xa
c0102f79:	68 00 02 00 00       	push   $0x200
c0102f7e:	51                   	push   %ecx
c0102f7f:	ff 75 b8             	pushl  -0x48(%ebp)
c0102f82:	50                   	push   %eax
c0102f83:	e8 bc e7 ff ff       	call   c0101744 <rd_wt>
c0102f88:	83 c4 20             	add    $0x20,%esp
c0102f8b:	90                   	nop
c0102f8c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0102f8f:	c9                   	leave  
c0102f90:	c3                   	ret    

c0102f91 <do_rdwt>:
c0102f91:	55                   	push   %ebp
c0102f92:	89 e5                	mov    %esp,%ebp
c0102f94:	81 ec 98 00 00 00    	sub    $0x98,%esp
c0102f9a:	8b 45 08             	mov    0x8(%ebp),%eax
c0102f9d:	8b 40 78             	mov    0x78(%eax),%eax
c0102fa0:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0102fa3:	8b 45 08             	mov    0x8(%ebp),%eax
c0102fa6:	8b 40 60             	mov    0x60(%eax),%eax
c0102fa9:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0102fac:	8b 45 08             	mov    0x8(%ebp),%eax
c0102faf:	8b 40 6c             	mov    0x6c(%eax),%eax
c0102fb2:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0102fb5:	8b 45 08             	mov    0x8(%ebp),%eax
c0102fb8:	8b 00                	mov    (%eax),%eax
c0102fba:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0102fbd:	8b 45 08             	mov    0x8(%ebp),%eax
c0102fc0:	8b 40 10             	mov    0x10(%eax),%eax
c0102fc3:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0102fc6:	8b 45 08             	mov    0x8(%ebp),%eax
c0102fc9:	8b 40 50             	mov    0x50(%eax),%eax
c0102fcc:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0102fcf:	83 ec 0c             	sub    $0xc,%esp
c0102fd2:	ff 75 d0             	pushl  -0x30(%ebp)
c0102fd5:	e8 0c 07 00 00       	call   c01036e6 <pid2proc>
c0102fda:	83 c4 10             	add    $0x10,%esp
c0102fdd:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0102fe0:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0102fe3:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0102fe6:	83 c2 4c             	add    $0x4c,%edx
c0102fe9:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c0102fed:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0102ff0:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0102ff3:	8b 40 08             	mov    0x8(%eax),%eax
c0102ff6:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0102ff9:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ffc:	8b 00                	mov    (%eax),%eax
c0102ffe:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0103001:	83 ec 08             	sub    $0x8,%esp
c0103004:	ff 75 bc             	pushl  -0x44(%ebp)
c0103007:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c010300d:	50                   	push   %eax
c010300e:	e8 0d f2 ff ff       	call   c0102220 <get_inode>
c0103013:	83 c4 10             	add    $0x10,%esp
c0103016:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0103019:	83 7d b4 00          	cmpl   $0x0,-0x4c(%ebp)
c010301d:	75 10                	jne    c010302f <do_rdwt+0x9e>
c010301f:	83 ec 0c             	sub    $0xc,%esp
c0103022:	68 04 a6 10 c0       	push   $0xc010a604
c0103027:	e8 6e 55 00 00       	call   c010859a <panic>
c010302c:	83 c4 10             	add    $0x10,%esp
c010302f:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c0103035:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0103038:	8b 45 c0             	mov    -0x40(%ebp),%eax
c010303b:	8b 40 04             	mov    0x4(%eax),%eax
c010303e:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0103041:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c0103045:	74 22                	je     c0103069 <do_rdwt+0xd8>
c0103047:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c010304b:	74 1c                	je     c0103069 <do_rdwt+0xd8>
c010304d:	68 a7 04 00 00       	push   $0x4a7
c0103052:	68 70 a4 10 c0       	push   $0xc010a470
c0103057:	68 70 a4 10 c0       	push   $0xc010a470
c010305c:	68 14 a6 10 c0       	push   $0xc010a614
c0103061:	e8 52 55 00 00       	call   c01085b8 <assertion_failure>
c0103066:	83 c4 10             	add    $0x10,%esp
c0103069:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
c010306f:	83 f8 01             	cmp    $0x1,%eax
c0103072:	0f 85 86 00 00 00    	jne    c01030fe <do_rdwt+0x16d>
c0103078:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c010307c:	75 09                	jne    c0103087 <do_rdwt+0xf6>
c010307e:	c7 45 f4 d2 07 00 00 	movl   $0x7d2,-0xc(%ebp)
c0103085:	eb 0d                	jmp    c0103094 <do_rdwt+0x103>
c0103087:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c010308b:	75 07                	jne    c0103094 <do_rdwt+0x103>
c010308d:	c7 45 f4 d3 07 00 00 	movl   $0x7d3,-0xc(%ebp)
c0103094:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0103097:	8b 45 08             	mov    0x8(%ebp),%eax
c010309a:	89 50 78             	mov    %edx,0x78(%eax)
c010309d:	8b 55 b8             	mov    -0x48(%ebp),%edx
c01030a0:	8b 45 08             	mov    0x8(%ebp),%eax
c01030a3:	89 50 68             	mov    %edx,0x68(%eax)
c01030a6:	83 ec 04             	sub    $0x4,%esp
c01030a9:	6a 04                	push   $0x4
c01030ab:	ff 75 08             	pushl  0x8(%ebp)
c01030ae:	6a 03                	push   $0x3
c01030b0:	e8 73 61 00 00       	call   c0109228 <send_rec>
c01030b5:	83 c4 10             	add    $0x10,%esp
c01030b8:	8b 45 08             	mov    0x8(%ebp),%eax
c01030bb:	8b 40 78             	mov    0x78(%eax),%eax
c01030be:	83 f8 66             	cmp    $0x66,%eax
c01030c1:	75 13                	jne    c01030d6 <do_rdwt+0x145>
c01030c3:	83 ec 04             	sub    $0x4,%esp
c01030c6:	ff 75 b8             	pushl  -0x48(%ebp)
c01030c9:	ff 75 08             	pushl  0x8(%ebp)
c01030cc:	6a 01                	push   $0x1
c01030ce:	e8 55 61 00 00       	call   c0109228 <send_rec>
c01030d3:	83 c4 10             	add    $0x10,%esp
c01030d6:	8b 45 08             	mov    0x8(%ebp),%eax
c01030d9:	8b 40 78             	mov    0x78(%eax),%eax
c01030dc:	83 f8 65             	cmp    $0x65,%eax
c01030df:	75 13                	jne    c01030f4 <do_rdwt+0x163>
c01030e1:	83 ec 04             	sub    $0x4,%esp
c01030e4:	ff 75 b8             	pushl  -0x48(%ebp)
c01030e7:	ff 75 08             	pushl  0x8(%ebp)
c01030ea:	6a 01                	push   $0x1
c01030ec:	e8 37 61 00 00       	call   c0109228 <send_rec>
c01030f1:	83 c4 10             	add    $0x10,%esp
c01030f4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01030f9:	e9 1c 02 00 00       	jmp    c010331a <do_rdwt+0x389>
c01030fe:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c0103102:	75 18                	jne    c010311c <do_rdwt+0x18b>
c0103104:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c010310a:	c1 e0 09             	shl    $0x9,%eax
c010310d:	39 45 ac             	cmp    %eax,-0x54(%ebp)
c0103110:	75 0a                	jne    c010311c <do_rdwt+0x18b>
c0103112:	b8 00 00 00 00       	mov    $0x0,%eax
c0103117:	e9 fe 01 00 00       	jmp    c010331a <do_rdwt+0x389>
c010311c:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c0103120:	75 14                	jne    c0103136 <do_rdwt+0x1a5>
c0103122:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0103125:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0103128:	01 d0                	add    %edx,%eax
c010312a:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c010312d:	0f 4e 45 b0          	cmovle -0x50(%ebp),%eax
c0103131:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103134:	eb 19                	jmp    c010314f <do_rdwt+0x1be>
c0103136:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0103139:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010313c:	01 c2                	add    %eax,%edx
c010313e:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0103144:	c1 e0 09             	shl    $0x9,%eax
c0103147:	39 c2                	cmp    %eax,%edx
c0103149:	0f 4e c2             	cmovle %edx,%eax
c010314c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010314f:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0103152:	99                   	cltd   
c0103153:	c1 ea 17             	shr    $0x17,%edx
c0103156:	01 d0                	add    %edx,%eax
c0103158:	25 ff 01 00 00       	and    $0x1ff,%eax
c010315d:	29 d0                	sub    %edx,%eax
c010315f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103162:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c0103168:	8b 45 ac             	mov    -0x54(%ebp),%eax
c010316b:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c0103171:	85 c0                	test   %eax,%eax
c0103173:	0f 48 c1             	cmovs  %ecx,%eax
c0103176:	c1 f8 09             	sar    $0x9,%eax
c0103179:	01 d0                	add    %edx,%eax
c010317b:	89 45 a8             	mov    %eax,-0x58(%ebp)
c010317e:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c0103184:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103187:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c010318d:	85 c0                	test   %eax,%eax
c010318f:	0f 48 c1             	cmovs  %ecx,%eax
c0103192:	c1 f8 09             	sar    $0x9,%eax
c0103195:	01 d0                	add    %edx,%eax
c0103197:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c010319a:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c010319d:	2b 45 a8             	sub    -0x58(%ebp),%eax
c01031a0:	ba 00 00 10 00       	mov    $0x100000,%edx
c01031a5:	39 d0                	cmp    %edx,%eax
c01031a7:	7d 0b                	jge    c01031b4 <do_rdwt+0x223>
c01031a9:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c01031ac:	2b 45 a8             	sub    -0x58(%ebp),%eax
c01031af:	83 c0 01             	add    $0x1,%eax
c01031b2:	eb 05                	jmp    c01031b9 <do_rdwt+0x228>
c01031b4:	b8 00 00 10 00       	mov    $0x100000,%eax
c01031b9:	89 45 a0             	mov    %eax,-0x60(%ebp)
c01031bc:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01031bf:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01031c2:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01031c9:	8b 45 08             	mov    0x8(%ebp),%eax
c01031cc:	8b 00                	mov    (%eax),%eax
c01031ce:	83 ec 0c             	sub    $0xc,%esp
c01031d1:	50                   	push   %eax
c01031d2:	e8 0f 05 00 00       	call   c01036e6 <pid2proc>
c01031d7:	83 c4 10             	add    $0x10,%esp
c01031da:	89 45 9c             	mov    %eax,-0x64(%ebp)
c01031dd:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01031e0:	83 ec 08             	sub    $0x8,%esp
c01031e3:	50                   	push   %eax
c01031e4:	ff 75 cc             	pushl  -0x34(%ebp)
c01031e7:	e8 30 2b 00 00       	call   c0105d1c <alloc_virtual_memory>
c01031ec:	83 c4 10             	add    $0x10,%esp
c01031ef:	89 45 98             	mov    %eax,-0x68(%ebp)
c01031f2:	8b 45 a8             	mov    -0x58(%ebp),%eax
c01031f5:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01031f8:	e9 c5 00 00 00       	jmp    c01032c2 <do_rdwt+0x331>
c01031fd:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0103200:	c1 e0 09             	shl    $0x9,%eax
c0103203:	2b 45 ec             	sub    -0x14(%ebp),%eax
c0103206:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c0103209:	0f 4e 45 e8          	cmovle -0x18(%ebp),%eax
c010320d:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0103210:	c7 45 90 20 00 00 00 	movl   $0x20,-0x70(%ebp)
c0103217:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c010321b:	75 46                	jne    c0103263 <do_rdwt+0x2d2>
c010321d:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0103220:	c1 e0 09             	shl    $0x9,%eax
c0103223:	8b 15 84 17 11 c0    	mov    0xc0111784,%edx
c0103229:	83 ec 0c             	sub    $0xc,%esp
c010322c:	6a 07                	push   $0x7
c010322e:	50                   	push   %eax
c010322f:	52                   	push   %edx
c0103230:	ff 75 90             	pushl  -0x70(%ebp)
c0103233:	ff 75 e0             	pushl  -0x20(%ebp)
c0103236:	e8 09 e5 ff ff       	call   c0101744 <rd_wt>
c010323b:	83 c4 20             	add    $0x20,%esp
c010323e:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0103244:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103247:	01 d0                	add    %edx,%eax
c0103249:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c010324c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c010324f:	01 ca                	add    %ecx,%edx
c0103251:	83 ec 04             	sub    $0x4,%esp
c0103254:	ff 75 94             	pushl  -0x6c(%ebp)
c0103257:	50                   	push   %eax
c0103258:	52                   	push   %edx
c0103259:	e8 2b 39 00 00       	call   c0106b89 <Memcpy>
c010325e:	83 c4 10             	add    $0x10,%esp
c0103261:	eb 46                	jmp    c01032a9 <do_rdwt+0x318>
c0103263:	8b 55 98             	mov    -0x68(%ebp),%edx
c0103266:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0103269:	01 d0                	add    %edx,%eax
c010326b:	89 c1                	mov    %eax,%ecx
c010326d:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0103273:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103276:	01 d0                	add    %edx,%eax
c0103278:	83 ec 04             	sub    $0x4,%esp
c010327b:	ff 75 94             	pushl  -0x6c(%ebp)
c010327e:	51                   	push   %ecx
c010327f:	50                   	push   %eax
c0103280:	e8 04 39 00 00       	call   c0106b89 <Memcpy>
c0103285:	83 c4 10             	add    $0x10,%esp
c0103288:	8b 45 a0             	mov    -0x60(%ebp),%eax
c010328b:	c1 e0 09             	shl    $0x9,%eax
c010328e:	8b 15 84 17 11 c0    	mov    0xc0111784,%edx
c0103294:	83 ec 0c             	sub    $0xc,%esp
c0103297:	6a 0a                	push   $0xa
c0103299:	50                   	push   %eax
c010329a:	52                   	push   %edx
c010329b:	ff 75 90             	pushl  -0x70(%ebp)
c010329e:	ff 75 e0             	pushl  -0x20(%ebp)
c01032a1:	e8 9e e4 ff ff       	call   c0101744 <rd_wt>
c01032a6:	83 c4 20             	add    $0x20,%esp
c01032a9:	8b 45 94             	mov    -0x6c(%ebp),%eax
c01032ac:	29 45 e8             	sub    %eax,-0x18(%ebp)
c01032af:	8b 45 94             	mov    -0x6c(%ebp),%eax
c01032b2:	01 45 e4             	add    %eax,-0x1c(%ebp)
c01032b5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01032bc:	8b 45 a0             	mov    -0x60(%ebp),%eax
c01032bf:	01 45 e0             	add    %eax,-0x20(%ebp)
c01032c2:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01032c5:	3b 45 a4             	cmp    -0x5c(%ebp),%eax
c01032c8:	7f 0a                	jg     c01032d4 <do_rdwt+0x343>
c01032ca:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c01032ce:	0f 85 29 ff ff ff    	jne    c01031fd <do_rdwt+0x26c>
c01032d4:	8b 45 c0             	mov    -0x40(%ebp),%eax
c01032d7:	8b 50 04             	mov    0x4(%eax),%edx
c01032da:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01032dd:	01 c2                	add    %eax,%edx
c01032df:	8b 45 c0             	mov    -0x40(%ebp),%eax
c01032e2:	89 50 04             	mov    %edx,0x4(%eax)
c01032e5:	8b 55 ac             	mov    -0x54(%ebp),%edx
c01032e8:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01032eb:	01 c2                	add    %eax,%edx
c01032ed:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c01032f3:	39 c2                	cmp    %eax,%edx
c01032f5:	7e 20                	jle    c0103317 <do_rdwt+0x386>
c01032f7:	8b 55 ac             	mov    -0x54(%ebp),%edx
c01032fa:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01032fd:	01 d0                	add    %edx,%eax
c01032ff:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c0103305:	83 ec 0c             	sub    $0xc,%esp
c0103308:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c010330e:	50                   	push   %eax
c010330f:	e8 08 00 00 00       	call   c010331c <sync_inode>
c0103314:	83 c4 10             	add    $0x10,%esp
c0103317:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010331a:	c9                   	leave  
c010331b:	c3                   	ret    

c010331c <sync_inode>:
c010331c:	55                   	push   %ebp
c010331d:	89 e5                	mov    %esp,%ebp
c010331f:	53                   	push   %ebx
c0103320:	83 ec 34             	sub    $0x34,%esp
c0103323:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010332a:	eb 74                	jmp    c01033a0 <sync_inode+0x84>
c010332c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010332f:	89 d0                	mov    %edx,%eax
c0103331:	c1 e0 02             	shl    $0x2,%eax
c0103334:	01 d0                	add    %edx,%eax
c0103336:	c1 e0 03             	shl    $0x3,%eax
c0103339:	05 b0 17 11 c0       	add    $0xc01117b0,%eax
c010333e:	8b 10                	mov    (%eax),%edx
c0103340:	8b 45 08             	mov    0x8(%ebp),%eax
c0103343:	8b 40 10             	mov    0x10(%eax),%eax
c0103346:	39 c2                	cmp    %eax,%edx
c0103348:	75 52                	jne    c010339c <sync_inode+0x80>
c010334a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010334d:	89 d0                	mov    %edx,%eax
c010334f:	c1 e0 02             	shl    $0x2,%eax
c0103352:	01 d0                	add    %edx,%eax
c0103354:	c1 e0 03             	shl    $0x3,%eax
c0103357:	8d 90 a0 17 11 c0    	lea    -0x3feee860(%eax),%edx
c010335d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103360:	8b 08                	mov    (%eax),%ecx
c0103362:	89 0a                	mov    %ecx,(%edx)
c0103364:	8b 48 04             	mov    0x4(%eax),%ecx
c0103367:	89 4a 04             	mov    %ecx,0x4(%edx)
c010336a:	8b 48 08             	mov    0x8(%eax),%ecx
c010336d:	89 4a 08             	mov    %ecx,0x8(%edx)
c0103370:	8b 48 0c             	mov    0xc(%eax),%ecx
c0103373:	89 4a 0c             	mov    %ecx,0xc(%edx)
c0103376:	8b 48 10             	mov    0x10(%eax),%ecx
c0103379:	89 4a 10             	mov    %ecx,0x10(%edx)
c010337c:	8b 48 14             	mov    0x14(%eax),%ecx
c010337f:	89 4a 14             	mov    %ecx,0x14(%edx)
c0103382:	8b 48 18             	mov    0x18(%eax),%ecx
c0103385:	89 4a 18             	mov    %ecx,0x18(%edx)
c0103388:	8b 48 1c             	mov    0x1c(%eax),%ecx
c010338b:	89 4a 1c             	mov    %ecx,0x1c(%edx)
c010338e:	8b 48 20             	mov    0x20(%eax),%ecx
c0103391:	89 4a 20             	mov    %ecx,0x20(%edx)
c0103394:	8b 40 24             	mov    0x24(%eax),%eax
c0103397:	89 42 24             	mov    %eax,0x24(%edx)
c010339a:	eb 0a                	jmp    c01033a6 <sync_inode+0x8a>
c010339c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01033a0:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c01033a4:	7e 86                	jle    c010332c <sync_inode+0x10>
c01033a6:	c7 45 f0 20 00 00 00 	movl   $0x20,-0x10(%ebp)
c01033ad:	8b 45 08             	mov    0x8(%ebp),%eax
c01033b0:	8b 40 10             	mov    0x10(%eax),%eax
c01033b3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01033b6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01033b9:	8d 48 ff             	lea    -0x1(%eax),%ecx
c01033bc:	b8 00 02 00 00       	mov    $0x200,%eax
c01033c1:	99                   	cltd   
c01033c2:	f7 7d f0             	idivl  -0x10(%ebp)
c01033c5:	89 c3                	mov    %eax,%ebx
c01033c7:	89 c8                	mov    %ecx,%eax
c01033c9:	99                   	cltd   
c01033ca:	f7 fb                	idiv   %ebx
c01033cc:	89 55 e8             	mov    %edx,-0x18(%ebp)
c01033cf:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01033d2:	8d 48 ff             	lea    -0x1(%eax),%ecx
c01033d5:	b8 00 02 00 00       	mov    $0x200,%eax
c01033da:	99                   	cltd   
c01033db:	f7 7d f0             	idivl  -0x10(%ebp)
c01033de:	89 c3                	mov    %eax,%ebx
c01033e0:	89 c8                	mov    %ecx,%eax
c01033e2:	99                   	cltd   
c01033e3:	f7 fb                	idiv   %ebx
c01033e5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01033e8:	8b 45 08             	mov    0x8(%ebp),%eax
c01033eb:	8b 40 20             	mov    0x20(%eax),%eax
c01033ee:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01033f1:	e8 0a 01 00 00       	call   c0103500 <get_super_block>
c01033f6:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01033f9:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01033fc:	8b 40 04             	mov    0x4(%eax),%eax
c01033ff:	8d 50 02             	lea    0x2(%eax),%edx
c0103402:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0103405:	8b 40 08             	mov    0x8(%eax),%eax
c0103408:	01 c2                	add    %eax,%edx
c010340a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010340d:	01 d0                	add    %edx,%eax
c010340f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0103412:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0103417:	83 ec 0c             	sub    $0xc,%esp
c010341a:	6a 07                	push   $0x7
c010341c:	68 00 02 00 00       	push   $0x200
c0103421:	50                   	push   %eax
c0103422:	ff 75 e0             	pushl  -0x20(%ebp)
c0103425:	ff 75 d8             	pushl  -0x28(%ebp)
c0103428:	e8 17 e3 ff ff       	call   c0101744 <rd_wt>
c010342d:	83 c4 20             	add    $0x20,%esp
c0103430:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0103435:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0103438:	83 ec 04             	sub    $0x4,%esp
c010343b:	ff 75 f0             	pushl  -0x10(%ebp)
c010343e:	ff 75 08             	pushl  0x8(%ebp)
c0103441:	ff 75 d4             	pushl  -0x2c(%ebp)
c0103444:	e8 40 37 00 00       	call   c0106b89 <Memcpy>
c0103449:	83 c4 10             	add    $0x10,%esp
c010344c:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0103451:	83 ec 0c             	sub    $0xc,%esp
c0103454:	6a 0a                	push   $0xa
c0103456:	68 00 02 00 00       	push   $0x200
c010345b:	50                   	push   %eax
c010345c:	ff 75 e0             	pushl  -0x20(%ebp)
c010345f:	ff 75 d8             	pushl  -0x28(%ebp)
c0103462:	e8 dd e2 ff ff       	call   c0101744 <rd_wt>
c0103467:	83 c4 20             	add    $0x20,%esp
c010346a:	90                   	nop
c010346b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c010346e:	c9                   	leave  
c010346f:	c3                   	ret    

c0103470 <put_inode>:
c0103470:	55                   	push   %ebp
c0103471:	89 e5                	mov    %esp,%ebp
c0103473:	83 ec 08             	sub    $0x8,%esp
c0103476:	8b 45 08             	mov    0x8(%ebp),%eax
c0103479:	8b 40 24             	mov    0x24(%eax),%eax
c010347c:	85 c0                	test   %eax,%eax
c010347e:	7f 1c                	jg     c010349c <put_inode+0x2c>
c0103480:	68 4c 05 00 00       	push   $0x54c
c0103485:	68 70 a4 10 c0       	push   $0xc010a470
c010348a:	68 70 a4 10 c0       	push   $0xc010a470
c010348f:	68 48 a6 10 c0       	push   $0xc010a648
c0103494:	e8 1f 51 00 00       	call   c01085b8 <assertion_failure>
c0103499:	83 c4 10             	add    $0x10,%esp
c010349c:	8b 45 08             	mov    0x8(%ebp),%eax
c010349f:	8b 40 24             	mov    0x24(%eax),%eax
c01034a2:	8d 50 ff             	lea    -0x1(%eax),%edx
c01034a5:	8b 45 08             	mov    0x8(%ebp),%eax
c01034a8:	89 50 24             	mov    %edx,0x24(%eax)
c01034ab:	90                   	nop
c01034ac:	c9                   	leave  
c01034ad:	c3                   	ret    

c01034ae <do_close>:
c01034ae:	55                   	push   %ebp
c01034af:	89 e5                	mov    %esp,%ebp
c01034b1:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c01034b6:	8b 55 08             	mov    0x8(%ebp),%edx
c01034b9:	83 c2 4c             	add    $0x4c,%edx
c01034bc:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c01034c0:	8b 50 0c             	mov    0xc(%eax),%edx
c01034c3:	83 ea 01             	sub    $0x1,%edx
c01034c6:	89 50 0c             	mov    %edx,0xc(%eax)
c01034c9:	8b 40 0c             	mov    0xc(%eax),%eax
c01034cc:	85 c0                	test   %eax,%eax
c01034ce:	75 16                	jne    c01034e6 <do_close+0x38>
c01034d0:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c01034d5:	8b 55 08             	mov    0x8(%ebp),%edx
c01034d8:	83 c2 4c             	add    $0x4c,%edx
c01034db:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c01034df:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c01034e6:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c01034eb:	8b 55 08             	mov    0x8(%ebp),%edx
c01034ee:	83 c2 4c             	add    $0x4c,%edx
c01034f1:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
c01034f8:	00 
c01034f9:	b8 00 00 00 00       	mov    $0x0,%eax
c01034fe:	5d                   	pop    %ebp
c01034ff:	c3                   	ret    

c0103500 <get_super_block>:
c0103500:	55                   	push   %ebp
c0103501:	89 e5                	mov    %esp,%ebp
c0103503:	83 ec 08             	sub    $0x8,%esp
c0103506:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010350b:	83 ec 0c             	sub    $0xc,%esp
c010350e:	6a 07                	push   $0x7
c0103510:	68 00 02 00 00       	push   $0x200
c0103515:	50                   	push   %eax
c0103516:	6a 20                	push   $0x20
c0103518:	6a 01                	push   $0x1
c010351a:	e8 25 e2 ff ff       	call   c0101744 <rd_wt>
c010351f:	83 c4 20             	add    $0x20,%esp
c0103522:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0103528:	a1 a0 21 11 c0       	mov    0xc01121a0,%eax
c010352d:	8b 0a                	mov    (%edx),%ecx
c010352f:	89 08                	mov    %ecx,(%eax)
c0103531:	8b 4a 04             	mov    0x4(%edx),%ecx
c0103534:	89 48 04             	mov    %ecx,0x4(%eax)
c0103537:	8b 4a 08             	mov    0x8(%edx),%ecx
c010353a:	89 48 08             	mov    %ecx,0x8(%eax)
c010353d:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0103540:	89 48 0c             	mov    %ecx,0xc(%eax)
c0103543:	8b 4a 10             	mov    0x10(%edx),%ecx
c0103546:	89 48 10             	mov    %ecx,0x10(%eax)
c0103549:	8b 4a 14             	mov    0x14(%edx),%ecx
c010354c:	89 48 14             	mov    %ecx,0x14(%eax)
c010354f:	8b 4a 18             	mov    0x18(%edx),%ecx
c0103552:	89 48 18             	mov    %ecx,0x18(%eax)
c0103555:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0103558:	89 48 1c             	mov    %ecx,0x1c(%eax)
c010355b:	8b 52 20             	mov    0x20(%edx),%edx
c010355e:	89 50 20             	mov    %edx,0x20(%eax)
c0103561:	a1 a0 21 11 c0       	mov    0xc01121a0,%eax
c0103566:	c9                   	leave  
c0103567:	c3                   	ret    

c0103568 <schedule_process>:
c0103568:	55                   	push   %ebp
c0103569:	89 e5                	mov    %esp,%ebp
c010356b:	83 ec 18             	sub    $0x18,%esp
c010356e:	c7 45 f4 00 00 40 00 	movl   $0x400000,-0xc(%ebp)
c0103575:	e8 29 ce ff ff       	call   c01003a3 <get_running_thread_pcb>
c010357a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010357d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103580:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0103587:	84 c0                	test   %al,%al
c0103589:	75 35                	jne    c01035c0 <schedule_process+0x58>
c010358b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010358e:	8b 90 1c 01 00 00    	mov    0x11c(%eax),%edx
c0103594:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103597:	89 90 18 01 00 00    	mov    %edx,0x118(%eax)
c010359d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01035a0:	c6 80 3c 02 00 00 03 	movb   $0x3,0x23c(%eax)
c01035a7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01035aa:	05 60 02 00 00       	add    $0x260,%eax
c01035af:	83 ec 08             	sub    $0x8,%esp
c01035b2:	50                   	push   %eax
c01035b3:	68 ec fd 10 c0       	push   $0xc010fdec
c01035b8:	e8 9a 69 00 00       	call   c0109f57 <insertToDoubleLinkList>
c01035bd:	83 c4 10             	add    $0x10,%esp
c01035c0:	83 ec 0c             	sub    $0xc,%esp
c01035c3:	68 ec fd 10 c0       	push   $0xc010fdec
c01035c8:	e8 a6 67 00 00       	call   c0109d73 <isListEmpty>
c01035cd:	83 c4 10             	add    $0x10,%esp
c01035d0:	84 c0                	test   %al,%al
c01035d2:	74 19                	je     c01035ed <schedule_process+0x85>
c01035d4:	6a 1e                	push   $0x1e
c01035d6:	68 57 a6 10 c0       	push   $0xc010a657
c01035db:	68 57 a6 10 c0       	push   $0xc010a657
c01035e0:	68 61 a6 10 c0       	push   $0xc010a661
c01035e5:	e8 ce 4f 00 00       	call   c01085b8 <assertion_failure>
c01035ea:	83 c4 10             	add    $0x10,%esp
c01035ed:	83 ec 0c             	sub    $0xc,%esp
c01035f0:	68 ec fd 10 c0       	push   $0xc010fdec
c01035f5:	e8 e0 69 00 00       	call   c0109fda <popFromDoubleLinkList>
c01035fa:	83 c4 10             	add    $0x10,%esp
c01035fd:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103600:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103603:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0103608:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010360b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010360e:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0103615:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103618:	8b 50 08             	mov    0x8(%eax),%edx
c010361b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010361e:	39 c2                	cmp    %eax,%edx
c0103620:	74 28                	je     c010364a <schedule_process+0xe2>
c0103622:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103625:	05 00 10 00 00       	add    $0x1000,%eax
c010362a:	83 ec 0c             	sub    $0xc,%esp
c010362d:	50                   	push   %eax
c010362e:	e8 61 cd ff ff       	call   c0100394 <update_tss>
c0103633:	83 c4 10             	add    $0x10,%esp
c0103636:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103639:	8b 40 08             	mov    0x8(%eax),%eax
c010363c:	83 ec 0c             	sub    $0xc,%esp
c010363f:	50                   	push   %eax
c0103640:	e8 42 cd ff ff       	call   c0100387 <update_cr3>
c0103645:	83 c4 10             	add    $0x10,%esp
c0103648:	eb 0f                	jmp    c0103659 <schedule_process+0xf1>
c010364a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010364d:	83 ec 0c             	sub    $0xc,%esp
c0103650:	50                   	push   %eax
c0103651:	e8 31 cd ff ff       	call   c0100387 <update_cr3>
c0103656:	83 c4 10             	add    $0x10,%esp
c0103659:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010365c:	a3 c0 fb 10 c0       	mov    %eax,0xc010fbc0
c0103661:	83 ec 08             	sub    $0x8,%esp
c0103664:	ff 75 e8             	pushl  -0x18(%ebp)
c0103667:	ff 75 f0             	pushl  -0x10(%ebp)
c010366a:	e8 c1 66 00 00       	call   c0109d30 <switch_to>
c010366f:	83 c4 10             	add    $0x10,%esp
c0103672:	90                   	nop
c0103673:	c9                   	leave  
c0103674:	c3                   	ret    

c0103675 <clock_handler>:
c0103675:	55                   	push   %ebp
c0103676:	89 e5                	mov    %esp,%ebp
c0103678:	83 ec 18             	sub    $0x18,%esp
c010367b:	e8 23 cd ff ff       	call   c01003a3 <get_running_thread_pcb>
c0103680:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103683:	a1 c0 06 11 c0       	mov    0xc01106c0,%eax
c0103688:	85 c0                	test   %eax,%eax
c010368a:	74 0d                	je     c0103699 <clock_handler+0x24>
c010368c:	83 ec 0c             	sub    $0xc,%esp
c010368f:	6a 04                	push   $0x4
c0103691:	e8 2c 5e 00 00       	call   c01094c2 <inform_int>
c0103696:	83 c4 10             	add    $0x10,%esp
c0103699:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c010369e:	83 f8 64             	cmp    $0x64,%eax
c01036a1:	75 0c                	jne    c01036af <clock_handler+0x3a>
c01036a3:	c7 05 a8 f7 10 c0 01 	movl   $0x1,0xc010f7a8
c01036aa:	00 00 00 
c01036ad:	eb 0a                	jmp    c01036b9 <clock_handler+0x44>
c01036af:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c01036b4:	83 f8 01             	cmp    $0x1,%eax
c01036b7:	75 2a                	jne    c01036e3 <clock_handler+0x6e>
c01036b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01036bc:	8b 80 18 01 00 00    	mov    0x118(%eax),%eax
c01036c2:	85 c0                	test   %eax,%eax
c01036c4:	74 16                	je     c01036dc <clock_handler+0x67>
c01036c6:	a1 c0 fb 10 c0       	mov    0xc010fbc0,%eax
c01036cb:	8b 90 18 01 00 00    	mov    0x118(%eax),%edx
c01036d1:	83 ea 01             	sub    $0x1,%edx
c01036d4:	89 90 18 01 00 00    	mov    %edx,0x118(%eax)
c01036da:	eb 08                	jmp    c01036e4 <clock_handler+0x6f>
c01036dc:	e8 87 fe ff ff       	call   c0103568 <schedule_process>
c01036e1:	eb 01                	jmp    c01036e4 <clock_handler+0x6f>
c01036e3:	90                   	nop
c01036e4:	c9                   	leave  
c01036e5:	c3                   	ret    

c01036e6 <pid2proc>:
c01036e6:	55                   	push   %ebp
c01036e7:	89 e5                	mov    %esp,%ebp
c01036e9:	83 ec 20             	sub    $0x20,%esp
c01036ec:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c01036f3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01036fa:	a1 04 0f 11 c0       	mov    0xc0110f04,%eax
c01036ff:	8b 15 08 0f 11 c0    	mov    0xc0110f08,%edx
c0103705:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103708:	89 55 f0             	mov    %edx,-0x10(%ebp)
c010370b:	a1 0c 0f 11 c0       	mov    0xc0110f0c,%eax
c0103710:	8b 15 10 0f 11 c0    	mov    0xc0110f10,%edx
c0103716:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0103719:	89 55 e8             	mov    %edx,-0x18(%ebp)
c010371c:	a1 08 0f 11 c0       	mov    0xc0110f08,%eax
c0103721:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103724:	eb 36                	jmp    c010375c <pid2proc+0x76>
c0103726:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103729:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010372e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103731:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0103735:	75 07                	jne    c010373e <pid2proc+0x58>
c0103737:	c7 45 f8 04 00 00 00 	movl   $0x4,-0x8(%ebp)
c010373e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103741:	8b 90 14 01 00 00    	mov    0x114(%eax),%edx
c0103747:	8b 45 08             	mov    0x8(%ebp),%eax
c010374a:	39 c2                	cmp    %eax,%edx
c010374c:	75 05                	jne    c0103753 <pid2proc+0x6d>
c010374e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103751:	eb 17                	jmp    c010376a <pid2proc+0x84>
c0103753:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103756:	8b 40 04             	mov    0x4(%eax),%eax
c0103759:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010375c:	81 7d fc 0c 0f 11 c0 	cmpl   $0xc0110f0c,-0x4(%ebp)
c0103763:	75 c1                	jne    c0103726 <pid2proc+0x40>
c0103765:	b8 00 00 00 00       	mov    $0x0,%eax
c010376a:	c9                   	leave  
c010376b:	c3                   	ret    

c010376c <proc2pid>:
c010376c:	55                   	push   %ebp
c010376d:	89 e5                	mov    %esp,%ebp
c010376f:	83 ec 10             	sub    $0x10,%esp
c0103772:	8b 45 08             	mov    0x8(%ebp),%eax
c0103775:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c010377b:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010377e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103781:	c9                   	leave  
c0103782:	c3                   	ret    

c0103783 <InitDescriptor>:
c0103783:	55                   	push   %ebp
c0103784:	89 e5                	mov    %esp,%ebp
c0103786:	83 ec 04             	sub    $0x4,%esp
c0103789:	8b 45 14             	mov    0x14(%ebp),%eax
c010378c:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
c0103790:	8b 45 10             	mov    0x10(%ebp),%eax
c0103793:	89 c2                	mov    %eax,%edx
c0103795:	8b 45 08             	mov    0x8(%ebp),%eax
c0103798:	66 89 10             	mov    %dx,(%eax)
c010379b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010379e:	89 c2                	mov    %eax,%edx
c01037a0:	8b 45 08             	mov    0x8(%ebp),%eax
c01037a3:	66 89 50 02          	mov    %dx,0x2(%eax)
c01037a7:	8b 45 0c             	mov    0xc(%ebp),%eax
c01037aa:	c1 e8 10             	shr    $0x10,%eax
c01037ad:	89 c2                	mov    %eax,%edx
c01037af:	8b 45 08             	mov    0x8(%ebp),%eax
c01037b2:	88 50 04             	mov    %dl,0x4(%eax)
c01037b5:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c01037b9:	89 c2                	mov    %eax,%edx
c01037bb:	8b 45 08             	mov    0x8(%ebp),%eax
c01037be:	88 50 05             	mov    %dl,0x5(%eax)
c01037c1:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c01037c5:	66 c1 e8 08          	shr    $0x8,%ax
c01037c9:	c1 e0 04             	shl    $0x4,%eax
c01037cc:	89 c2                	mov    %eax,%edx
c01037ce:	8b 45 10             	mov    0x10(%ebp),%eax
c01037d1:	c1 e8 10             	shr    $0x10,%eax
c01037d4:	83 e0 0f             	and    $0xf,%eax
c01037d7:	09 c2                	or     %eax,%edx
c01037d9:	8b 45 08             	mov    0x8(%ebp),%eax
c01037dc:	88 50 06             	mov    %dl,0x6(%eax)
c01037df:	8b 45 0c             	mov    0xc(%ebp),%eax
c01037e2:	c1 e8 18             	shr    $0x18,%eax
c01037e5:	89 c2                	mov    %eax,%edx
c01037e7:	8b 45 08             	mov    0x8(%ebp),%eax
c01037ea:	88 50 07             	mov    %dl,0x7(%eax)
c01037ed:	90                   	nop
c01037ee:	c9                   	leave  
c01037ef:	c3                   	ret    

c01037f0 <Seg2PhyAddr>:
c01037f0:	55                   	push   %ebp
c01037f1:	89 e5                	mov    %esp,%ebp
c01037f3:	83 ec 10             	sub    $0x10,%esp
c01037f6:	8b 45 08             	mov    0x8(%ebp),%eax
c01037f9:	c1 e8 03             	shr    $0x3,%eax
c01037fc:	8b 14 c5 c4 f7 10 c0 	mov    -0x3fef083c(,%eax,8),%edx
c0103803:	8b 04 c5 c0 f7 10 c0 	mov    -0x3fef0840(,%eax,8),%eax
c010380a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010380d:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0103810:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0103814:	0f b7 c0             	movzwl %ax,%eax
c0103817:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c010381b:	0f b6 d2             	movzbl %dl,%edx
c010381e:	c1 e2 10             	shl    $0x10,%edx
c0103821:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c0103827:	09 d0                	or     %edx,%eax
c0103829:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010382c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010382f:	c9                   	leave  
c0103830:	c3                   	ret    

c0103831 <Seg2PhyAddrLDT>:
c0103831:	55                   	push   %ebp
c0103832:	89 e5                	mov    %esp,%ebp
c0103834:	83 ec 10             	sub    $0x10,%esp
c0103837:	8b 45 08             	mov    0x8(%ebp),%eax
c010383a:	c1 e8 03             	shr    $0x3,%eax
c010383d:	89 c2                	mov    %eax,%edx
c010383f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103842:	83 c2 20             	add    $0x20,%edx
c0103845:	8d 54 d0 02          	lea    0x2(%eax,%edx,8),%edx
c0103849:	8b 02                	mov    (%edx),%eax
c010384b:	8b 52 04             	mov    0x4(%edx),%edx
c010384e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103851:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0103854:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0103858:	0f b7 c0             	movzwl %ax,%eax
c010385b:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c010385f:	0f b6 d2             	movzbl %dl,%edx
c0103862:	c1 e2 10             	shl    $0x10,%edx
c0103865:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c010386b:	09 d0                	or     %edx,%eax
c010386d:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103870:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103873:	c9                   	leave  
c0103874:	c3                   	ret    

c0103875 <VirAddr2PhyAddr>:
c0103875:	55                   	push   %ebp
c0103876:	89 e5                	mov    %esp,%ebp
c0103878:	83 ec 10             	sub    $0x10,%esp
c010387b:	8b 55 0c             	mov    0xc(%ebp),%edx
c010387e:	8b 45 08             	mov    0x8(%ebp),%eax
c0103881:	01 d0                	add    %edx,%eax
c0103883:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103886:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103889:	c9                   	leave  
c010388a:	c3                   	ret    

c010388b <v2l>:
c010388b:	55                   	push   %ebp
c010388c:	89 e5                	mov    %esp,%ebp
c010388e:	83 ec 18             	sub    $0x18,%esp
c0103891:	83 ec 0c             	sub    $0xc,%esp
c0103894:	ff 75 08             	pushl  0x8(%ebp)
c0103897:	e8 4a fe ff ff       	call   c01036e6 <pid2proc>
c010389c:	83 c4 10             	add    $0x10,%esp
c010389f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01038a2:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c01038a9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01038ac:	83 ec 08             	sub    $0x8,%esp
c01038af:	ff 75 f4             	pushl  -0xc(%ebp)
c01038b2:	50                   	push   %eax
c01038b3:	e8 79 ff ff ff       	call   c0103831 <Seg2PhyAddrLDT>
c01038b8:	83 c4 10             	add    $0x10,%esp
c01038bb:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01038be:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01038c1:	8b 45 0c             	mov    0xc(%ebp),%eax
c01038c4:	01 d0                	add    %edx,%eax
c01038c6:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01038c9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01038cc:	c9                   	leave  
c01038cd:	c3                   	ret    

c01038ce <init_propt>:
c01038ce:	55                   	push   %ebp
c01038cf:	89 e5                	mov    %esp,%ebp
c01038d1:	83 ec 38             	sub    $0x38,%esp
c01038d4:	6a 0e                	push   $0xe
c01038d6:	6a 08                	push   $0x8
c01038d8:	68 71 01 10 c0       	push   $0xc0100171
c01038dd:	6a 20                	push   $0x20
c01038df:	e8 58 01 00 00       	call   c0103a3c <InitInterruptDesc>
c01038e4:	83 c4 10             	add    $0x10,%esp
c01038e7:	6a 0e                	push   $0xe
c01038e9:	6a 08                	push   $0x8
c01038eb:	68 9f 01 10 c0       	push   $0xc010019f
c01038f0:	6a 21                	push   $0x21
c01038f2:	e8 45 01 00 00       	call   c0103a3c <InitInterruptDesc>
c01038f7:	83 c4 10             	add    $0x10,%esp
c01038fa:	6a 0e                	push   $0xe
c01038fc:	6a 08                	push   $0x8
c01038fe:	68 e2 01 10 c0       	push   $0xc01001e2
c0103903:	6a 2e                	push   $0x2e
c0103905:	e8 32 01 00 00       	call   c0103a3c <InitInterruptDesc>
c010390a:	83 c4 10             	add    $0x10,%esp
c010390d:	83 ec 04             	sub    $0x4,%esp
c0103910:	68 e0 15 00 00       	push   $0x15e0
c0103915:	6a 00                	push   $0x0
c0103917:	68 00 22 18 c0       	push   $0xc0182200
c010391c:	e8 ca 78 00 00       	call   c010b1eb <Memset>
c0103921:	83 c4 10             	add    $0x10,%esp
c0103924:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c010392b:	83 ec 04             	sub    $0x4,%esp
c010392e:	ff 75 f4             	pushl  -0xc(%ebp)
c0103931:	6a 00                	push   $0x0
c0103933:	68 40 06 11 c0       	push   $0xc0110640
c0103938:	e8 ae 78 00 00       	call   c010b1eb <Memset>
c010393d:	83 c4 10             	add    $0x10,%esp
c0103940:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103943:	a3 a8 06 11 c0       	mov    %eax,0xc01106a8
c0103948:	c7 05 48 06 11 c0 30 	movl   $0x30,0xc0110648
c010394f:	00 00 00 
c0103952:	83 ec 0c             	sub    $0xc,%esp
c0103955:	6a 30                	push   $0x30
c0103957:	e8 94 fe ff ff       	call   c01037f0 <Seg2PhyAddr>
c010395c:	83 c4 10             	add    $0x10,%esp
c010395f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103962:	c7 45 ec 40 06 11 c0 	movl   $0xc0110640,-0x14(%ebp)
c0103969:	c7 45 e8 89 00 00 00 	movl   $0x89,-0x18(%ebp)
c0103970:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103973:	0f b7 d0             	movzwl %ax,%edx
c0103976:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103979:	83 e8 01             	sub    $0x1,%eax
c010397c:	89 c1                	mov    %eax,%ecx
c010397e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103981:	52                   	push   %edx
c0103982:	51                   	push   %ecx
c0103983:	50                   	push   %eax
c0103984:	68 00 f8 10 c0       	push   $0xc010f800
c0103989:	e8 f5 fd ff ff       	call   c0103783 <InitDescriptor>
c010398e:	83 c4 10             	add    $0x10,%esp
c0103991:	c7 45 e4 00 80 0b c0 	movl   $0xc00b8000,-0x1c(%ebp)
c0103998:	68 f2 00 00 00       	push   $0xf2
c010399d:	68 ff ff 00 00       	push   $0xffff
c01039a2:	ff 75 e4             	pushl  -0x1c(%ebp)
c01039a5:	68 f8 f7 10 c0       	push   $0xc010f7f8
c01039aa:	e8 d4 fd ff ff       	call   c0103783 <InitDescriptor>
c01039af:	83 c4 10             	add    $0x10,%esp
c01039b2:	c7 45 e0 b2 0c 00 00 	movl   $0xcb2,-0x20(%ebp)
c01039b9:	c7 45 dc 9a 0c 00 00 	movl   $0xc9a,-0x24(%ebp)
c01039c0:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%ebp)
c01039c7:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01039ca:	0f b7 c0             	movzwl %ax,%eax
c01039cd:	50                   	push   %eax
c01039ce:	ff 75 d8             	pushl  -0x28(%ebp)
c01039d1:	6a 00                	push   $0x0
c01039d3:	68 08 f8 10 c0       	push   $0xc010f808
c01039d8:	e8 a6 fd ff ff       	call   c0103783 <InitDescriptor>
c01039dd:	83 c4 10             	add    $0x10,%esp
c01039e0:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01039e3:	0f b7 c0             	movzwl %ax,%eax
c01039e6:	50                   	push   %eax
c01039e7:	ff 75 d8             	pushl  -0x28(%ebp)
c01039ea:	6a 00                	push   $0x0
c01039ec:	68 10 f8 10 c0       	push   $0xc010f810
c01039f1:	e8 8d fd ff ff       	call   c0103783 <InitDescriptor>
c01039f6:	83 c4 10             	add    $0x10,%esp
c01039f9:	c7 45 d4 b2 0c 00 00 	movl   $0xcb2,-0x2c(%ebp)
c0103a00:	c7 45 d0 ba 0c 00 00 	movl   $0xcba,-0x30(%ebp)
c0103a07:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0103a0a:	0f b7 c0             	movzwl %ax,%eax
c0103a0d:	50                   	push   %eax
c0103a0e:	ff 75 d8             	pushl  -0x28(%ebp)
c0103a11:	6a 00                	push   $0x0
c0103a13:	68 18 f8 10 c0       	push   $0xc010f818
c0103a18:	e8 66 fd ff ff       	call   c0103783 <InitDescriptor>
c0103a1d:	83 c4 10             	add    $0x10,%esp
c0103a20:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0103a23:	0f b7 c0             	movzwl %ax,%eax
c0103a26:	50                   	push   %eax
c0103a27:	ff 75 d8             	pushl  -0x28(%ebp)
c0103a2a:	6a 00                	push   $0x0
c0103a2c:	68 20 f8 10 c0       	push   $0xc010f820
c0103a31:	e8 4d fd ff ff       	call   c0103783 <InitDescriptor>
c0103a36:	83 c4 10             	add    $0x10,%esp
c0103a39:	90                   	nop
c0103a3a:	c9                   	leave  
c0103a3b:	c3                   	ret    

c0103a3c <InitInterruptDesc>:
c0103a3c:	55                   	push   %ebp
c0103a3d:	89 e5                	mov    %esp,%ebp
c0103a3f:	83 ec 10             	sub    $0x10,%esp
c0103a42:	8b 45 08             	mov    0x8(%ebp),%eax
c0103a45:	c1 e0 03             	shl    $0x3,%eax
c0103a48:	05 e0 06 11 c0       	add    $0xc01106e0,%eax
c0103a4d:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103a50:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103a53:	c6 40 04 00          	movb   $0x0,0x4(%eax)
c0103a57:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103a5a:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0103a5d:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0103a60:	89 c2                	mov    %eax,%edx
c0103a62:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103a65:	66 89 10             	mov    %dx,(%eax)
c0103a68:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103a6b:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
c0103a71:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0103a74:	c1 f8 10             	sar    $0x10,%eax
c0103a77:	89 c2                	mov    %eax,%edx
c0103a79:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103a7c:	66 89 50 06          	mov    %dx,0x6(%eax)
c0103a80:	8b 45 10             	mov    0x10(%ebp),%eax
c0103a83:	c1 e0 04             	shl    $0x4,%eax
c0103a86:	89 c2                	mov    %eax,%edx
c0103a88:	8b 45 14             	mov    0x14(%ebp),%eax
c0103a8b:	09 d0                	or     %edx,%eax
c0103a8d:	89 c2                	mov    %eax,%edx
c0103a8f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103a92:	88 50 05             	mov    %dl,0x5(%eax)
c0103a95:	90                   	nop
c0103a96:	c9                   	leave  
c0103a97:	c3                   	ret    

c0103a98 <ReloadGDT>:
c0103a98:	55                   	push   %ebp
c0103a99:	89 e5                	mov    %esp,%ebp
c0103a9b:	83 ec 28             	sub    $0x28,%esp
c0103a9e:	b8 cc 06 11 c0       	mov    $0xc01106cc,%eax
c0103aa3:	0f b7 00             	movzwl (%eax),%eax
c0103aa6:	98                   	cwtl   
c0103aa7:	ba ce 06 11 c0       	mov    $0xc01106ce,%edx
c0103aac:	8b 12                	mov    (%edx),%edx
c0103aae:	83 ec 04             	sub    $0x4,%esp
c0103ab1:	50                   	push   %eax
c0103ab2:	52                   	push   %edx
c0103ab3:	68 c0 f7 10 c0       	push   $0xc010f7c0
c0103ab8:	e8 00 77 00 00       	call   c010b1bd <Memcpy2>
c0103abd:	83 c4 10             	add    $0x10,%esp
c0103ac0:	c7 45 f0 cc 06 11 c0 	movl   $0xc01106cc,-0x10(%ebp)
c0103ac7:	c7 45 ec ce 06 11 c0 	movl   $0xc01106ce,-0x14(%ebp)
c0103ace:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103ad1:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
c0103ad6:	ba c0 f7 10 c0       	mov    $0xc010f7c0,%edx
c0103adb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103ade:	89 10                	mov    %edx,(%eax)
c0103ae0:	c7 45 e8 88 f7 10 c0 	movl   $0xc010f788,-0x18(%ebp)
c0103ae7:	c7 45 e4 8a f7 10 c0 	movl   $0xc010f78a,-0x1c(%ebp)
c0103aee:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103af1:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
c0103af6:	ba e0 06 11 c0       	mov    $0xc01106e0,%edx
c0103afb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0103afe:	89 10                	mov    %edx,(%eax)
c0103b00:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0103b07:	eb 04                	jmp    c0103b0d <ReloadGDT+0x75>
c0103b09:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0103b0d:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c0103b14:	7e f3                	jle    c0103b09 <ReloadGDT+0x71>
c0103b16:	e8 a9 37 00 00       	call   c01072c4 <init_internal_interrupt>
c0103b1b:	e8 ae fd ff ff       	call   c01038ce <init_propt>
c0103b20:	90                   	nop
c0103b21:	c9                   	leave  
c0103b22:	c3                   	ret    

c0103b23 <select_console>:
c0103b23:	55                   	push   %ebp
c0103b24:	89 e5                	mov    %esp,%ebp
c0103b26:	83 ec 18             	sub    $0x18,%esp
c0103b29:	8b 45 08             	mov    0x8(%ebp),%eax
c0103b2c:	88 45 f4             	mov    %al,-0xc(%ebp)
c0103b2f:	80 7d f4 00          	cmpb   $0x0,-0xc(%ebp)
c0103b33:	75 27                	jne    c0103b5c <select_console+0x39>
c0103b35:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
c0103b39:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0103b3f:	05 00 fe 10 c0       	add    $0xc010fe00,%eax
c0103b44:	a3 80 f7 10 c0       	mov    %eax,0xc010f780
c0103b49:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c0103b4e:	83 ec 0c             	sub    $0xc,%esp
c0103b51:	50                   	push   %eax
c0103b52:	e8 08 00 00 00       	call   c0103b5f <flush>
c0103b57:	83 c4 10             	add    $0x10,%esp
c0103b5a:	eb 01                	jmp    c0103b5d <select_console+0x3a>
c0103b5c:	90                   	nop
c0103b5d:	c9                   	leave  
c0103b5e:	c3                   	ret    

c0103b5f <flush>:
c0103b5f:	55                   	push   %ebp
c0103b60:	89 e5                	mov    %esp,%ebp
c0103b62:	83 ec 08             	sub    $0x8,%esp
c0103b65:	8b 45 08             	mov    0x8(%ebp),%eax
c0103b68:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103b6e:	8b 40 0c             	mov    0xc(%eax),%eax
c0103b71:	83 ec 0c             	sub    $0xc,%esp
c0103b74:	50                   	push   %eax
c0103b75:	e8 1e 00 00 00       	call   c0103b98 <set_cursor>
c0103b7a:	83 c4 10             	add    $0x10,%esp
c0103b7d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103b80:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103b86:	8b 40 08             	mov    0x8(%eax),%eax
c0103b89:	83 ec 0c             	sub    $0xc,%esp
c0103b8c:	50                   	push   %eax
c0103b8d:	e8 64 00 00 00       	call   c0103bf6 <set_console_start_video_addr>
c0103b92:	83 c4 10             	add    $0x10,%esp
c0103b95:	90                   	nop
c0103b96:	c9                   	leave  
c0103b97:	c3                   	ret    

c0103b98 <set_cursor>:
c0103b98:	55                   	push   %ebp
c0103b99:	89 e5                	mov    %esp,%ebp
c0103b9b:	83 ec 08             	sub    $0x8,%esp
c0103b9e:	83 ec 08             	sub    $0x8,%esp
c0103ba1:	6a 0e                	push   $0xe
c0103ba3:	68 d4 03 00 00       	push   $0x3d4
c0103ba8:	e8 f8 c6 ff ff       	call   c01002a5 <out_byte>
c0103bad:	83 c4 10             	add    $0x10,%esp
c0103bb0:	8b 45 08             	mov    0x8(%ebp),%eax
c0103bb3:	c1 e8 08             	shr    $0x8,%eax
c0103bb6:	0f b7 c0             	movzwl %ax,%eax
c0103bb9:	83 ec 08             	sub    $0x8,%esp
c0103bbc:	50                   	push   %eax
c0103bbd:	68 d5 03 00 00       	push   $0x3d5
c0103bc2:	e8 de c6 ff ff       	call   c01002a5 <out_byte>
c0103bc7:	83 c4 10             	add    $0x10,%esp
c0103bca:	83 ec 08             	sub    $0x8,%esp
c0103bcd:	6a 0f                	push   $0xf
c0103bcf:	68 d4 03 00 00       	push   $0x3d4
c0103bd4:	e8 cc c6 ff ff       	call   c01002a5 <out_byte>
c0103bd9:	83 c4 10             	add    $0x10,%esp
c0103bdc:	8b 45 08             	mov    0x8(%ebp),%eax
c0103bdf:	0f b7 c0             	movzwl %ax,%eax
c0103be2:	83 ec 08             	sub    $0x8,%esp
c0103be5:	50                   	push   %eax
c0103be6:	68 d5 03 00 00       	push   $0x3d5
c0103beb:	e8 b5 c6 ff ff       	call   c01002a5 <out_byte>
c0103bf0:	83 c4 10             	add    $0x10,%esp
c0103bf3:	90                   	nop
c0103bf4:	c9                   	leave  
c0103bf5:	c3                   	ret    

c0103bf6 <set_console_start_video_addr>:
c0103bf6:	55                   	push   %ebp
c0103bf7:	89 e5                	mov    %esp,%ebp
c0103bf9:	83 ec 08             	sub    $0x8,%esp
c0103bfc:	83 ec 08             	sub    $0x8,%esp
c0103bff:	6a 0c                	push   $0xc
c0103c01:	68 d4 03 00 00       	push   $0x3d4
c0103c06:	e8 9a c6 ff ff       	call   c01002a5 <out_byte>
c0103c0b:	83 c4 10             	add    $0x10,%esp
c0103c0e:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c11:	c1 e8 08             	shr    $0x8,%eax
c0103c14:	0f b7 c0             	movzwl %ax,%eax
c0103c17:	83 ec 08             	sub    $0x8,%esp
c0103c1a:	50                   	push   %eax
c0103c1b:	68 d5 03 00 00       	push   $0x3d5
c0103c20:	e8 80 c6 ff ff       	call   c01002a5 <out_byte>
c0103c25:	83 c4 10             	add    $0x10,%esp
c0103c28:	83 ec 08             	sub    $0x8,%esp
c0103c2b:	6a 0d                	push   $0xd
c0103c2d:	68 d4 03 00 00       	push   $0x3d4
c0103c32:	e8 6e c6 ff ff       	call   c01002a5 <out_byte>
c0103c37:	83 c4 10             	add    $0x10,%esp
c0103c3a:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c3d:	0f b7 c0             	movzwl %ax,%eax
c0103c40:	83 ec 08             	sub    $0x8,%esp
c0103c43:	50                   	push   %eax
c0103c44:	68 d5 03 00 00       	push   $0x3d5
c0103c49:	e8 57 c6 ff ff       	call   c01002a5 <out_byte>
c0103c4e:	83 c4 10             	add    $0x10,%esp
c0103c51:	90                   	nop
c0103c52:	c9                   	leave  
c0103c53:	c3                   	ret    

c0103c54 <put_key>:
c0103c54:	55                   	push   %ebp
c0103c55:	89 e5                	mov    %esp,%ebp
c0103c57:	83 ec 04             	sub    $0x4,%esp
c0103c5a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103c5d:	88 45 fc             	mov    %al,-0x4(%ebp)
c0103c60:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c63:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0103c69:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c0103c6e:	77 4d                	ja     c0103cbd <put_key+0x69>
c0103c70:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c73:	8b 00                	mov    (%eax),%eax
c0103c75:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
c0103c79:	89 10                	mov    %edx,(%eax)
c0103c7b:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c7e:	8b 00                	mov    (%eax),%eax
c0103c80:	8d 50 04             	lea    0x4(%eax),%edx
c0103c83:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c86:	89 10                	mov    %edx,(%eax)
c0103c88:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c8b:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0103c91:	8d 50 01             	lea    0x1(%eax),%edx
c0103c94:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c97:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0103c9d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ca0:	8b 00                	mov    (%eax),%eax
c0103ca2:	8b 55 08             	mov    0x8(%ebp),%edx
c0103ca5:	83 c2 08             	add    $0x8,%edx
c0103ca8:	81 c2 00 08 00 00    	add    $0x800,%edx
c0103cae:	39 d0                	cmp    %edx,%eax
c0103cb0:	75 0b                	jne    c0103cbd <put_key+0x69>
c0103cb2:	8b 45 08             	mov    0x8(%ebp),%eax
c0103cb5:	8d 50 08             	lea    0x8(%eax),%edx
c0103cb8:	8b 45 08             	mov    0x8(%ebp),%eax
c0103cbb:	89 10                	mov    %edx,(%eax)
c0103cbd:	90                   	nop
c0103cbe:	c9                   	leave  
c0103cbf:	c3                   	ret    

c0103cc0 <scroll_up>:
c0103cc0:	55                   	push   %ebp
c0103cc1:	89 e5                	mov    %esp,%ebp
c0103cc3:	83 ec 08             	sub    $0x8,%esp
c0103cc6:	8b 45 08             	mov    0x8(%ebp),%eax
c0103cc9:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103ccf:	8b 40 08             	mov    0x8(%eax),%eax
c0103cd2:	8d 50 b0             	lea    -0x50(%eax),%edx
c0103cd5:	8b 45 08             	mov    0x8(%ebp),%eax
c0103cd8:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103cde:	8b 00                	mov    (%eax),%eax
c0103ce0:	39 c2                	cmp    %eax,%edx
c0103ce2:	76 1b                	jbe    c0103cff <scroll_up+0x3f>
c0103ce4:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ce7:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103ced:	8b 40 08             	mov    0x8(%eax),%eax
c0103cf0:	83 e8 50             	sub    $0x50,%eax
c0103cf3:	83 ec 0c             	sub    $0xc,%esp
c0103cf6:	50                   	push   %eax
c0103cf7:	e8 fa fe ff ff       	call   c0103bf6 <set_console_start_video_addr>
c0103cfc:	83 c4 10             	add    $0x10,%esp
c0103cff:	90                   	nop
c0103d00:	c9                   	leave  
c0103d01:	c3                   	ret    

c0103d02 <scroll_down>:
c0103d02:	55                   	push   %ebp
c0103d03:	89 e5                	mov    %esp,%ebp
c0103d05:	83 ec 08             	sub    $0x8,%esp
c0103d08:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d0b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103d11:	8b 40 08             	mov    0x8(%eax),%eax
c0103d14:	8d 48 50             	lea    0x50(%eax),%ecx
c0103d17:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d1a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103d20:	8b 10                	mov    (%eax),%edx
c0103d22:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d25:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103d2b:	8b 40 04             	mov    0x4(%eax),%eax
c0103d2e:	01 d0                	add    %edx,%eax
c0103d30:	39 c1                	cmp    %eax,%ecx
c0103d32:	73 36                	jae    c0103d6a <scroll_down+0x68>
c0103d34:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d37:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103d3d:	8b 40 08             	mov    0x8(%eax),%eax
c0103d40:	83 c0 50             	add    $0x50,%eax
c0103d43:	83 ec 0c             	sub    $0xc,%esp
c0103d46:	50                   	push   %eax
c0103d47:	e8 aa fe ff ff       	call   c0103bf6 <set_console_start_video_addr>
c0103d4c:	83 c4 10             	add    $0x10,%esp
c0103d4f:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d52:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103d58:	8b 50 08             	mov    0x8(%eax),%edx
c0103d5b:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d5e:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103d64:	83 c2 50             	add    $0x50,%edx
c0103d67:	89 50 08             	mov    %edx,0x8(%eax)
c0103d6a:	90                   	nop
c0103d6b:	c9                   	leave  
c0103d6c:	c3                   	ret    

c0103d6d <out_char>:
c0103d6d:	55                   	push   %ebp
c0103d6e:	89 e5                	mov    %esp,%ebp
c0103d70:	83 ec 28             	sub    $0x28,%esp
c0103d73:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103d76:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0103d79:	e8 a7 2d 00 00       	call   c0106b25 <intr_disable>
c0103d7e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103d81:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d84:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103d8a:	8b 40 0c             	mov    0xc(%eax),%eax
c0103d8d:	05 00 c0 05 60       	add    $0x6005c000,%eax
c0103d92:	01 c0                	add    %eax,%eax
c0103d94:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103d97:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
c0103d9b:	83 f8 08             	cmp    $0x8,%eax
c0103d9e:	0f 84 8d 00 00 00    	je     c0103e31 <out_char+0xc4>
c0103da4:	83 f8 0a             	cmp    $0xa,%eax
c0103da7:	0f 85 c9 00 00 00    	jne    c0103e76 <out_char+0x109>
c0103dad:	8b 45 08             	mov    0x8(%ebp),%eax
c0103db0:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103db6:	8b 50 0c             	mov    0xc(%eax),%edx
c0103db9:	8b 45 08             	mov    0x8(%ebp),%eax
c0103dbc:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103dc2:	8b 08                	mov    (%eax),%ecx
c0103dc4:	8b 45 08             	mov    0x8(%ebp),%eax
c0103dc7:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103dcd:	8b 40 04             	mov    0x4(%eax),%eax
c0103dd0:	01 c8                	add    %ecx,%eax
c0103dd2:	83 e8 50             	sub    $0x50,%eax
c0103dd5:	39 c2                	cmp    %eax,%edx
c0103dd7:	0f 83 f4 00 00 00    	jae    c0103ed1 <out_char+0x164>
c0103ddd:	8b 45 08             	mov    0x8(%ebp),%eax
c0103de0:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103de6:	8b 08                	mov    (%eax),%ecx
c0103de8:	8b 45 08             	mov    0x8(%ebp),%eax
c0103deb:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103df1:	8b 50 0c             	mov    0xc(%eax),%edx
c0103df4:	8b 45 08             	mov    0x8(%ebp),%eax
c0103df7:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103dfd:	8b 00                	mov    (%eax),%eax
c0103dff:	29 c2                	sub    %eax,%edx
c0103e01:	89 d0                	mov    %edx,%eax
c0103e03:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
c0103e08:	f7 e2                	mul    %edx
c0103e0a:	89 d0                	mov    %edx,%eax
c0103e0c:	c1 e8 06             	shr    $0x6,%eax
c0103e0f:	8d 50 01             	lea    0x1(%eax),%edx
c0103e12:	89 d0                	mov    %edx,%eax
c0103e14:	c1 e0 02             	shl    $0x2,%eax
c0103e17:	01 d0                	add    %edx,%eax
c0103e19:	c1 e0 04             	shl    $0x4,%eax
c0103e1c:	89 c2                	mov    %eax,%edx
c0103e1e:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e21:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e27:	01 ca                	add    %ecx,%edx
c0103e29:	89 50 0c             	mov    %edx,0xc(%eax)
c0103e2c:	e9 a0 00 00 00       	jmp    c0103ed1 <out_char+0x164>
c0103e31:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e34:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e3a:	8b 50 0c             	mov    0xc(%eax),%edx
c0103e3d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e40:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e46:	8b 00                	mov    (%eax),%eax
c0103e48:	39 c2                	cmp    %eax,%edx
c0103e4a:	0f 86 84 00 00 00    	jbe    c0103ed4 <out_char+0x167>
c0103e50:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e53:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e59:	8b 50 0c             	mov    0xc(%eax),%edx
c0103e5c:	83 ea 01             	sub    $0x1,%edx
c0103e5f:	89 50 0c             	mov    %edx,0xc(%eax)
c0103e62:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103e65:	83 e8 02             	sub    $0x2,%eax
c0103e68:	c6 00 20             	movb   $0x20,(%eax)
c0103e6b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103e6e:	83 e8 01             	sub    $0x1,%eax
c0103e71:	c6 00 00             	movb   $0x0,(%eax)
c0103e74:	eb 5e                	jmp    c0103ed4 <out_char+0x167>
c0103e76:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e79:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e7f:	8b 40 0c             	mov    0xc(%eax),%eax
c0103e82:	8d 48 01             	lea    0x1(%eax),%ecx
c0103e85:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e88:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e8e:	8b 10                	mov    (%eax),%edx
c0103e90:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e93:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e99:	8b 40 04             	mov    0x4(%eax),%eax
c0103e9c:	01 d0                	add    %edx,%eax
c0103e9e:	39 c1                	cmp    %eax,%ecx
c0103ea0:	73 35                	jae    c0103ed7 <out_char+0x16a>
c0103ea2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103ea5:	8d 50 01             	lea    0x1(%eax),%edx
c0103ea8:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0103eab:	0f b6 55 e4          	movzbl -0x1c(%ebp),%edx
c0103eaf:	88 10                	mov    %dl,(%eax)
c0103eb1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103eb4:	8d 50 01             	lea    0x1(%eax),%edx
c0103eb7:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0103eba:	c6 00 0a             	movb   $0xa,(%eax)
c0103ebd:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ec0:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103ec6:	8b 50 0c             	mov    0xc(%eax),%edx
c0103ec9:	83 c2 01             	add    $0x1,%edx
c0103ecc:	89 50 0c             	mov    %edx,0xc(%eax)
c0103ecf:	eb 06                	jmp    c0103ed7 <out_char+0x16a>
c0103ed1:	90                   	nop
c0103ed2:	eb 14                	jmp    c0103ee8 <out_char+0x17b>
c0103ed4:	90                   	nop
c0103ed5:	eb 11                	jmp    c0103ee8 <out_char+0x17b>
c0103ed7:	90                   	nop
c0103ed8:	eb 0e                	jmp    c0103ee8 <out_char+0x17b>
c0103eda:	83 ec 0c             	sub    $0xc,%esp
c0103edd:	ff 75 08             	pushl  0x8(%ebp)
c0103ee0:	e8 1d fe ff ff       	call   c0103d02 <scroll_down>
c0103ee5:	83 c4 10             	add    $0x10,%esp
c0103ee8:	8b 45 08             	mov    0x8(%ebp),%eax
c0103eeb:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103ef1:	8b 50 0c             	mov    0xc(%eax),%edx
c0103ef4:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ef7:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103efd:	8b 40 08             	mov    0x8(%eax),%eax
c0103f00:	29 c2                	sub    %eax,%edx
c0103f02:	89 d0                	mov    %edx,%eax
c0103f04:	3d d0 07 00 00       	cmp    $0x7d0,%eax
c0103f09:	77 cf                	ja     c0103eda <out_char+0x16d>
c0103f0b:	83 ec 0c             	sub    $0xc,%esp
c0103f0e:	ff 75 08             	pushl  0x8(%ebp)
c0103f11:	e8 49 fc ff ff       	call   c0103b5f <flush>
c0103f16:	83 c4 10             	add    $0x10,%esp
c0103f19:	83 ec 0c             	sub    $0xc,%esp
c0103f1c:	ff 75 f4             	pushl  -0xc(%ebp)
c0103f1f:	e8 2a 2c 00 00       	call   c0106b4e <intr_set_status>
c0103f24:	83 c4 10             	add    $0x10,%esp
c0103f27:	90                   	nop
c0103f28:	c9                   	leave  
c0103f29:	c3                   	ret    

c0103f2a <tty_dev_read>:
c0103f2a:	55                   	push   %ebp
c0103f2b:	89 e5                	mov    %esp,%ebp
c0103f2d:	83 ec 08             	sub    $0x8,%esp
c0103f30:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c0103f35:	39 45 08             	cmp    %eax,0x8(%ebp)
c0103f38:	75 17                	jne    c0103f51 <tty_dev_read+0x27>
c0103f3a:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c0103f3f:	85 c0                	test   %eax,%eax
c0103f41:	7e 0e                	jle    c0103f51 <tty_dev_read+0x27>
c0103f43:	83 ec 0c             	sub    $0xc,%esp
c0103f46:	ff 75 08             	pushl  0x8(%ebp)
c0103f49:	e8 89 07 00 00       	call   c01046d7 <keyboard_read>
c0103f4e:	83 c4 10             	add    $0x10,%esp
c0103f51:	90                   	nop
c0103f52:	c9                   	leave  
c0103f53:	c3                   	ret    

c0103f54 <tty_dev_write>:
c0103f54:	55                   	push   %ebp
c0103f55:	89 e5                	mov    %esp,%ebp
c0103f57:	83 ec 28             	sub    $0x28,%esp
c0103f5a:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f5d:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0103f63:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103f66:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0103f6d:	e9 88 01 00 00       	jmp    c01040fa <tty_dev_write+0x1a6>
c0103f72:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f75:	8b 40 04             	mov    0x4(%eax),%eax
c0103f78:	8b 00                	mov    (%eax),%eax
c0103f7a:	88 45 e7             	mov    %al,-0x19(%ebp)
c0103f7d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f80:	8b 40 04             	mov    0x4(%eax),%eax
c0103f83:	8d 50 04             	lea    0x4(%eax),%edx
c0103f86:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f89:	89 50 04             	mov    %edx,0x4(%eax)
c0103f8c:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f8f:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0103f95:	8d 50 ff             	lea    -0x1(%eax),%edx
c0103f98:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f9b:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0103fa1:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fa4:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c0103faa:	8d 50 01             	lea    0x1(%eax),%edx
c0103fad:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fb0:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0103fb6:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fb9:	8b 40 04             	mov    0x4(%eax),%eax
c0103fbc:	8b 55 08             	mov    0x8(%ebp),%edx
c0103fbf:	83 c2 08             	add    $0x8,%edx
c0103fc2:	81 c2 00 08 00 00    	add    $0x800,%edx
c0103fc8:	39 d0                	cmp    %edx,%eax
c0103fca:	75 0c                	jne    c0103fd8 <tty_dev_write+0x84>
c0103fcc:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fcf:	8d 50 08             	lea    0x8(%eax),%edx
c0103fd2:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fd5:	89 50 04             	mov    %edx,0x4(%eax)
c0103fd8:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fdb:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0103fe1:	85 c0                	test   %eax,%eax
c0103fe3:	0f 84 11 01 00 00    	je     c01040fa <tty_dev_write+0x1a6>
c0103fe9:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0103fed:	3c 20                	cmp    $0x20,%al
c0103fef:	76 08                	jbe    c0103ff9 <tty_dev_write+0xa5>
c0103ff1:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0103ff5:	3c 7e                	cmp    $0x7e,%al
c0103ff7:	76 10                	jbe    c0104009 <tty_dev_write+0xb5>
c0103ff9:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0103ffd:	3c 20                	cmp    $0x20,%al
c0103fff:	74 08                	je     c0104009 <tty_dev_write+0xb5>
c0104001:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104005:	84 c0                	test   %al,%al
c0104007:	75 58                	jne    c0104061 <tty_dev_write+0x10d>
c0104009:	8b 45 08             	mov    0x8(%ebp),%eax
c010400c:	8b 90 18 08 00 00    	mov    0x818(%eax),%edx
c0104012:	8b 45 08             	mov    0x8(%ebp),%eax
c0104015:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c010401b:	01 d0                	add    %edx,%eax
c010401d:	83 e8 01             	sub    $0x1,%eax
c0104020:	89 c2                	mov    %eax,%edx
c0104022:	83 ec 04             	sub    $0x4,%esp
c0104025:	6a 01                	push   $0x1
c0104027:	8d 45 e7             	lea    -0x19(%ebp),%eax
c010402a:	50                   	push   %eax
c010402b:	52                   	push   %edx
c010402c:	e8 58 2b 00 00       	call   c0106b89 <Memcpy>
c0104031:	83 c4 10             	add    $0x10,%esp
c0104034:	8b 45 08             	mov    0x8(%ebp),%eax
c0104037:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c010403d:	8d 50 ff             	lea    -0x1(%eax),%edx
c0104040:	8b 45 08             	mov    0x8(%ebp),%eax
c0104043:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c0104049:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c010404d:	0f b6 c0             	movzbl %al,%eax
c0104050:	83 ec 08             	sub    $0x8,%esp
c0104053:	50                   	push   %eax
c0104054:	ff 75 08             	pushl  0x8(%ebp)
c0104057:	e8 11 fd ff ff       	call   c0103d6d <out_char>
c010405c:	83 c4 10             	add    $0x10,%esp
c010405f:	eb 7c                	jmp    c01040dd <tty_dev_write+0x189>
c0104061:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104065:	3c 08                	cmp    $0x8,%al
c0104067:	75 42                	jne    c01040ab <tty_dev_write+0x157>
c0104069:	8b 45 08             	mov    0x8(%ebp),%eax
c010406c:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0104072:	8d 50 01             	lea    0x1(%eax),%edx
c0104075:	8b 45 08             	mov    0x8(%ebp),%eax
c0104078:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c010407e:	8b 45 08             	mov    0x8(%ebp),%eax
c0104081:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c0104087:	8d 50 fe             	lea    -0x2(%eax),%edx
c010408a:	8b 45 08             	mov    0x8(%ebp),%eax
c010408d:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0104093:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104097:	0f b6 c0             	movzbl %al,%eax
c010409a:	83 ec 08             	sub    $0x8,%esp
c010409d:	50                   	push   %eax
c010409e:	ff 75 08             	pushl  0x8(%ebp)
c01040a1:	e8 c7 fc ff ff       	call   c0103d6d <out_char>
c01040a6:	83 c4 10             	add    $0x10,%esp
c01040a9:	eb 32                	jmp    c01040dd <tty_dev_write+0x189>
c01040ab:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c01040af:	3c 0a                	cmp    $0xa,%al
c01040b1:	75 2a                	jne    c01040dd <tty_dev_write+0x189>
c01040b3:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c01040b7:	0f b6 c0             	movzbl %al,%eax
c01040ba:	83 ec 08             	sub    $0x8,%esp
c01040bd:	50                   	push   %eax
c01040be:	ff 75 08             	pushl  0x8(%ebp)
c01040c1:	e8 a7 fc ff ff       	call   c0103d6d <out_char>
c01040c6:	83 c4 10             	add    $0x10,%esp
c01040c9:	8b 45 08             	mov    0x8(%ebp),%eax
c01040cc:	c7 80 0c 08 00 00 00 	movl   $0x0,0x80c(%eax)
c01040d3:	00 00 00 
c01040d6:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c01040dd:	8b 45 08             	mov    0x8(%ebp),%eax
c01040e0:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c01040e6:	8b 45 08             	mov    0x8(%ebp),%eax
c01040e9:	8b 80 14 08 00 00    	mov    0x814(%eax),%eax
c01040ef:	39 c2                	cmp    %eax,%edx
c01040f1:	75 07                	jne    c01040fa <tty_dev_write+0x1a6>
c01040f3:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c01040fa:	8b 45 08             	mov    0x8(%ebp),%eax
c01040fd:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0104103:	85 c0                	test   %eax,%eax
c0104105:	0f 85 67 fe ff ff    	jne    c0103f72 <tty_dev_write+0x1e>
c010410b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010410f:	74 6d                	je     c010417e <tty_dev_write+0x22a>
c0104111:	c7 45 ec 7c 00 00 00 	movl   $0x7c,-0x14(%ebp)
c0104118:	83 ec 0c             	sub    $0xc,%esp
c010411b:	ff 75 ec             	pushl  -0x14(%ebp)
c010411e:	e8 e9 d3 ff ff       	call   c010150c <sys_malloc>
c0104123:	83 c4 10             	add    $0x10,%esp
c0104126:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0104129:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010412c:	c7 40 78 66 00 00 00 	movl   $0x66,0x78(%eax)
c0104133:	8b 45 08             	mov    0x8(%ebp),%eax
c0104136:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c010413c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010413f:	89 50 60             	mov    %edx,0x60(%eax)
c0104142:	8b 45 08             	mov    0x8(%ebp),%eax
c0104145:	8b 90 20 08 00 00    	mov    0x820(%eax),%edx
c010414b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010414e:	89 50 68             	mov    %edx,0x68(%eax)
c0104151:	8b 45 08             	mov    0x8(%ebp),%eax
c0104154:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c010415a:	83 ec 04             	sub    $0x4,%esp
c010415d:	50                   	push   %eax
c010415e:	ff 75 e8             	pushl  -0x18(%ebp)
c0104161:	6a 01                	push   $0x1
c0104163:	e8 c0 50 00 00       	call   c0109228 <send_rec>
c0104168:	83 c4 10             	add    $0x10,%esp
c010416b:	83 ec 08             	sub    $0x8,%esp
c010416e:	ff 75 ec             	pushl  -0x14(%ebp)
c0104171:	ff 75 e8             	pushl  -0x18(%ebp)
c0104174:	e8 a8 d3 ff ff       	call   c0101521 <sys_free>
c0104179:	83 c4 10             	add    $0x10,%esp
c010417c:	eb 01                	jmp    c010417f <tty_dev_write+0x22b>
c010417e:	90                   	nop
c010417f:	c9                   	leave  
c0104180:	c3                   	ret    

c0104181 <tty_do_read>:
c0104181:	55                   	push   %ebp
c0104182:	89 e5                	mov    %esp,%ebp
c0104184:	83 ec 08             	sub    $0x8,%esp
c0104187:	8b 45 08             	mov    0x8(%ebp),%eax
c010418a:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c0104191:	00 00 00 
c0104194:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104197:	8b 50 68             	mov    0x68(%eax),%edx
c010419a:	8b 45 08             	mov    0x8(%ebp),%eax
c010419d:	89 90 20 08 00 00    	mov    %edx,0x820(%eax)
c01041a3:	8b 45 0c             	mov    0xc(%ebp),%eax
c01041a6:	8b 00                	mov    (%eax),%eax
c01041a8:	89 c2                	mov    %eax,%edx
c01041aa:	8b 45 08             	mov    0x8(%ebp),%eax
c01041ad:	89 90 1c 08 00 00    	mov    %edx,0x81c(%eax)
c01041b3:	8b 45 0c             	mov    0xc(%ebp),%eax
c01041b6:	8b 50 60             	mov    0x60(%eax),%edx
c01041b9:	8b 45 08             	mov    0x8(%ebp),%eax
c01041bc:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c01041c2:	8b 45 0c             	mov    0xc(%ebp),%eax
c01041c5:	8b 50 60             	mov    0x60(%eax),%edx
c01041c8:	8b 45 08             	mov    0x8(%ebp),%eax
c01041cb:	89 90 14 08 00 00    	mov    %edx,0x814(%eax)
c01041d1:	8b 45 08             	mov    0x8(%ebp),%eax
c01041d4:	8b 90 0c 08 00 00    	mov    0x80c(%eax),%edx
c01041da:	8b 45 0c             	mov    0xc(%ebp),%eax
c01041dd:	8b 40 10             	mov    0x10(%eax),%eax
c01041e0:	83 ec 08             	sub    $0x8,%esp
c01041e3:	52                   	push   %edx
c01041e4:	50                   	push   %eax
c01041e5:	e8 32 1b 00 00       	call   c0105d1c <alloc_virtual_memory>
c01041ea:	83 c4 10             	add    $0x10,%esp
c01041ed:	89 c2                	mov    %eax,%edx
c01041ef:	8b 45 08             	mov    0x8(%ebp),%eax
c01041f2:	89 90 18 08 00 00    	mov    %edx,0x818(%eax)
c01041f8:	8b 45 08             	mov    0x8(%ebp),%eax
c01041fb:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c0104201:	83 f8 02             	cmp    $0x2,%eax
c0104204:	74 1c                	je     c0104222 <tty_do_read+0xa1>
c0104206:	68 3b 01 00 00       	push   $0x13b
c010420b:	68 7d a6 10 c0       	push   $0xc010a67d
c0104210:	68 7d a6 10 c0       	push   $0xc010a67d
c0104215:	68 87 a6 10 c0       	push   $0xc010a687
c010421a:	e8 99 43 00 00       	call   c01085b8 <assertion_failure>
c010421f:	83 c4 10             	add    $0x10,%esp
c0104222:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104225:	c7 40 78 67 00 00 00 	movl   $0x67,0x78(%eax)
c010422c:	8b 45 08             	mov    0x8(%ebp),%eax
c010422f:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c0104235:	83 ec 04             	sub    $0x4,%esp
c0104238:	50                   	push   %eax
c0104239:	ff 75 0c             	pushl  0xc(%ebp)
c010423c:	6a 01                	push   $0x1
c010423e:	e8 e5 4f 00 00       	call   c0109228 <send_rec>
c0104243:	83 c4 10             	add    $0x10,%esp
c0104246:	90                   	nop
c0104247:	c9                   	leave  
c0104248:	c3                   	ret    

c0104249 <tty_do_write>:
c0104249:	55                   	push   %ebp
c010424a:	89 e5                	mov    %esp,%ebp
c010424c:	53                   	push   %ebx
c010424d:	83 ec 24             	sub    $0x24,%esp
c0104250:	89 e0                	mov    %esp,%eax
c0104252:	89 c3                	mov    %eax,%ebx
c0104254:	c7 45 e8 80 00 00 00 	movl   $0x80,-0x18(%ebp)
c010425b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010425e:	8d 50 ff             	lea    -0x1(%eax),%edx
c0104261:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c0104264:	89 c2                	mov    %eax,%edx
c0104266:	b8 10 00 00 00       	mov    $0x10,%eax
c010426b:	83 e8 01             	sub    $0x1,%eax
c010426e:	01 d0                	add    %edx,%eax
c0104270:	b9 10 00 00 00       	mov    $0x10,%ecx
c0104275:	ba 00 00 00 00       	mov    $0x0,%edx
c010427a:	f7 f1                	div    %ecx
c010427c:	6b c0 10             	imul   $0x10,%eax,%eax
c010427f:	29 c4                	sub    %eax,%esp
c0104281:	89 e0                	mov    %esp,%eax
c0104283:	83 c0 00             	add    $0x0,%eax
c0104286:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0104289:	83 ec 04             	sub    $0x4,%esp
c010428c:	ff 75 e8             	pushl  -0x18(%ebp)
c010428f:	6a 00                	push   $0x0
c0104291:	ff 75 e0             	pushl  -0x20(%ebp)
c0104294:	e8 52 6f 00 00       	call   c010b1eb <Memset>
c0104299:	83 c4 10             	add    $0x10,%esp
c010429c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010429f:	8b 40 60             	mov    0x60(%eax),%eax
c01042a2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01042a5:	8b 45 08             	mov    0x8(%ebp),%eax
c01042a8:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c01042af:	00 00 00 
c01042b2:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01042b5:	8b 45 0c             	mov    0xc(%ebp),%eax
c01042b8:	8b 40 10             	mov    0x10(%eax),%eax
c01042bb:	83 ec 08             	sub    $0x8,%esp
c01042be:	52                   	push   %edx
c01042bf:	50                   	push   %eax
c01042c0:	e8 57 1a 00 00       	call   c0105d1c <alloc_virtual_memory>
c01042c5:	83 c4 10             	add    $0x10,%esp
c01042c8:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01042cb:	eb 7e                	jmp    c010434b <tty_do_write+0x102>
c01042cd:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01042d0:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c01042d3:	0f 4e 45 ec          	cmovle -0x14(%ebp),%eax
c01042d7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01042da:	8b 45 08             	mov    0x8(%ebp),%eax
c01042dd:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c01042e3:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01042e6:	01 d0                	add    %edx,%eax
c01042e8:	83 ec 04             	sub    $0x4,%esp
c01042eb:	ff 75 f0             	pushl  -0x10(%ebp)
c01042ee:	50                   	push   %eax
c01042ef:	ff 75 e0             	pushl  -0x20(%ebp)
c01042f2:	e8 92 28 00 00       	call   c0106b89 <Memcpy>
c01042f7:	83 c4 10             	add    $0x10,%esp
c01042fa:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01042fd:	29 45 ec             	sub    %eax,-0x14(%ebp)
c0104300:	8b 45 08             	mov    0x8(%ebp),%eax
c0104303:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0104309:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010430c:	01 c2                	add    %eax,%edx
c010430e:	8b 45 08             	mov    0x8(%ebp),%eax
c0104311:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0104317:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010431e:	eb 25                	jmp    c0104345 <tty_do_write+0xfc>
c0104320:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0104323:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104326:	01 d0                	add    %edx,%eax
c0104328:	0f b6 00             	movzbl (%eax),%eax
c010432b:	0f b6 c0             	movzbl %al,%eax
c010432e:	83 ec 08             	sub    $0x8,%esp
c0104331:	50                   	push   %eax
c0104332:	ff 75 08             	pushl  0x8(%ebp)
c0104335:	e8 33 fa ff ff       	call   c0103d6d <out_char>
c010433a:	83 c4 10             	add    $0x10,%esp
c010433d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0104341:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c0104345:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0104349:	75 d5                	jne    c0104320 <tty_do_write+0xd7>
c010434b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c010434f:	0f 85 78 ff ff ff    	jne    c01042cd <tty_do_write+0x84>
c0104355:	83 ec 0c             	sub    $0xc,%esp
c0104358:	6a 7c                	push   $0x7c
c010435a:	e8 ad d1 ff ff       	call   c010150c <sys_malloc>
c010435f:	83 c4 10             	add    $0x10,%esp
c0104362:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0104365:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104368:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c010436f:	8b 45 08             	mov    0x8(%ebp),%eax
c0104372:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0104378:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010437b:	89 50 58             	mov    %edx,0x58(%eax)
c010437e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104381:	8b 00                	mov    (%eax),%eax
c0104383:	83 ec 04             	sub    $0x4,%esp
c0104386:	50                   	push   %eax
c0104387:	ff 75 d8             	pushl  -0x28(%ebp)
c010438a:	6a 01                	push   $0x1
c010438c:	e8 97 4e 00 00       	call   c0109228 <send_rec>
c0104391:	83 c4 10             	add    $0x10,%esp
c0104394:	83 ec 08             	sub    $0x8,%esp
c0104397:	6a 7c                	push   $0x7c
c0104399:	ff 75 d8             	pushl  -0x28(%ebp)
c010439c:	e8 80 d1 ff ff       	call   c0101521 <sys_free>
c01043a1:	83 c4 10             	add    $0x10,%esp
c01043a4:	89 dc                	mov    %ebx,%esp
c01043a6:	90                   	nop
c01043a7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01043aa:	c9                   	leave  
c01043ab:	c3                   	ret    

c01043ac <init_screen>:
c01043ac:	55                   	push   %ebp
c01043ad:	89 e5                	mov    %esp,%ebp
c01043af:	83 ec 10             	sub    $0x10,%esp
c01043b2:	8b 45 08             	mov    0x8(%ebp),%eax
c01043b5:	2d 00 fe 10 c0       	sub    $0xc010fe00,%eax
c01043ba:	c1 f8 03             	sar    $0x3,%eax
c01043bd:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c01043c3:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01043c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01043c9:	c1 e0 04             	shl    $0x4,%eax
c01043cc:	8d 90 14 0f 11 c0    	lea    -0x3feef0ec(%eax),%edx
c01043d2:	8b 45 08             	mov    0x8(%ebp),%eax
c01043d5:	89 90 24 08 00 00    	mov    %edx,0x824(%eax)
c01043db:	c7 45 f8 ff 3f 00 00 	movl   $0x3fff,-0x8(%ebp)
c01043e2:	8b 45 08             	mov    0x8(%ebp),%eax
c01043e5:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01043eb:	8b 55 f8             	mov    -0x8(%ebp),%edx
c01043ee:	89 50 04             	mov    %edx,0x4(%eax)
c01043f1:	8b 45 08             	mov    0x8(%ebp),%eax
c01043f4:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c01043fa:	8b 50 04             	mov    0x4(%eax),%edx
c01043fd:	8b 45 08             	mov    0x8(%ebp),%eax
c0104400:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104406:	0f af 55 fc          	imul   -0x4(%ebp),%edx
c010440a:	89 10                	mov    %edx,(%eax)
c010440c:	8b 45 08             	mov    0x8(%ebp),%eax
c010440f:	8b 90 24 08 00 00    	mov    0x824(%eax),%edx
c0104415:	8b 45 08             	mov    0x8(%ebp),%eax
c0104418:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c010441e:	8b 12                	mov    (%edx),%edx
c0104420:	89 50 08             	mov    %edx,0x8(%eax)
c0104423:	8b 55 08             	mov    0x8(%ebp),%edx
c0104426:	8b 92 24 08 00 00    	mov    0x824(%edx),%edx
c010442c:	8b 40 08             	mov    0x8(%eax),%eax
c010442f:	89 42 0c             	mov    %eax,0xc(%edx)
c0104432:	90                   	nop
c0104433:	c9                   	leave  
c0104434:	c3                   	ret    

c0104435 <init_tty>:
c0104435:	55                   	push   %ebp
c0104436:	89 e5                	mov    %esp,%ebp
c0104438:	83 ec 18             	sub    $0x18,%esp
c010443b:	c7 45 f4 00 fe 10 c0 	movl   $0xc010fe00,-0xc(%ebp)
c0104442:	e9 92 00 00 00       	jmp    c01044d9 <init_tty+0xa4>
c0104447:	83 ec 04             	sub    $0x4,%esp
c010444a:	68 28 08 00 00       	push   $0x828
c010444f:	6a 00                	push   $0x0
c0104451:	ff 75 f4             	pushl  -0xc(%ebp)
c0104454:	e8 92 6d 00 00       	call   c010b1eb <Memset>
c0104459:	83 c4 10             	add    $0x10,%esp
c010445c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010445f:	8d 50 08             	lea    0x8(%eax),%edx
c0104462:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104465:	89 50 04             	mov    %edx,0x4(%eax)
c0104468:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010446b:	8b 50 04             	mov    0x4(%eax),%edx
c010446e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104471:	89 10                	mov    %edx,(%eax)
c0104473:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104476:	c7 80 08 08 00 00 00 	movl   $0x0,0x808(%eax)
c010447d:	00 00 00 
c0104480:	83 ec 0c             	sub    $0xc,%esp
c0104483:	ff 75 f4             	pushl  -0xc(%ebp)
c0104486:	e8 21 ff ff ff       	call   c01043ac <init_screen>
c010448b:	83 c4 10             	add    $0x10,%esp
c010448e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104491:	2d 00 fe 10 c0       	sub    $0xc010fe00,%eax
c0104496:	85 c0                	test   %eax,%eax
c0104498:	7e 38                	jle    c01044d2 <init_tty+0x9d>
c010449a:	83 ec 08             	sub    $0x8,%esp
c010449d:	6a 23                	push   $0x23
c010449f:	ff 75 f4             	pushl  -0xc(%ebp)
c01044a2:	e8 c6 f8 ff ff       	call   c0103d6d <out_char>
c01044a7:	83 c4 10             	add    $0x10,%esp
c01044aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01044ad:	05 a8 8f 01 00       	add    $0x18fa8,%eax
c01044b2:	2d 00 fe 10 c0       	sub    $0xc010fe00,%eax
c01044b7:	c1 f8 03             	sar    $0x3,%eax
c01044ba:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c01044c0:	0f b6 c0             	movzbl %al,%eax
c01044c3:	83 ec 08             	sub    $0x8,%esp
c01044c6:	50                   	push   %eax
c01044c7:	ff 75 f4             	pushl  -0xc(%ebp)
c01044ca:	e8 9e f8 ff ff       	call   c0103d6d <out_char>
c01044cf:	83 c4 10             	add    $0x10,%esp
c01044d2:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c01044d9:	b8 28 06 11 c0       	mov    $0xc0110628,%eax
c01044de:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c01044e1:	0f 82 60 ff ff ff    	jb     c0104447 <init_tty+0x12>
c01044e7:	90                   	nop
c01044e8:	c9                   	leave  
c01044e9:	c3                   	ret    

c01044ea <TaskTTY>:
c01044ea:	55                   	push   %ebp
c01044eb:	89 e5                	mov    %esp,%ebp
c01044ed:	83 ec 28             	sub    $0x28,%esp
c01044f0:	e8 40 ff ff ff       	call   c0104435 <init_tty>
c01044f5:	83 ec 0c             	sub    $0xc,%esp
c01044f8:	6a 00                	push   $0x0
c01044fa:	e8 24 f6 ff ff       	call   c0103b23 <select_console>
c01044ff:	83 c4 10             	add    $0x10,%esp
c0104502:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0104509:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0104510:	83 ec 0c             	sub    $0xc,%esp
c0104513:	6a 7c                	push   $0x7c
c0104515:	e8 f2 cf ff ff       	call   c010150c <sys_malloc>
c010451a:	83 c4 10             	add    $0x10,%esp
c010451d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0104520:	c7 45 f4 00 fe 10 c0 	movl   $0xc010fe00,-0xc(%ebp)
c0104527:	eb 30                	jmp    c0104559 <TaskTTY+0x6f>
c0104529:	83 ec 0c             	sub    $0xc,%esp
c010452c:	ff 75 f4             	pushl  -0xc(%ebp)
c010452f:	e8 f6 f9 ff ff       	call   c0103f2a <tty_dev_read>
c0104534:	83 c4 10             	add    $0x10,%esp
c0104537:	83 ec 0c             	sub    $0xc,%esp
c010453a:	ff 75 f4             	pushl  -0xc(%ebp)
c010453d:	e8 12 fa ff ff       	call   c0103f54 <tty_dev_write>
c0104542:	83 c4 10             	add    $0x10,%esp
c0104545:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104548:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c010454e:	85 c0                	test   %eax,%eax
c0104550:	75 d7                	jne    c0104529 <TaskTTY+0x3f>
c0104552:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c0104559:	b8 28 06 11 c0       	mov    $0xc0110628,%eax
c010455e:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0104561:	72 c6                	jb     c0104529 <TaskTTY+0x3f>
c0104563:	83 ec 04             	sub    $0x4,%esp
c0104566:	6a 12                	push   $0x12
c0104568:	ff 75 e8             	pushl  -0x18(%ebp)
c010456b:	6a 02                	push   $0x2
c010456d:	e8 b6 4c 00 00       	call   c0109228 <send_rec>
c0104572:	83 c4 10             	add    $0x10,%esp
c0104575:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104578:	8b 40 78             	mov    0x78(%eax),%eax
c010457b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010457e:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c0104585:	74 28                	je     c01045af <TaskTTY+0xc5>
c0104587:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c010458e:	7f 0b                	jg     c010459b <TaskTTY+0xb1>
c0104590:	81 7d e4 d1 07 00 00 	cmpl   $0x7d1,-0x1c(%ebp)
c0104597:	74 4e                	je     c01045e7 <TaskTTY+0xfd>
c0104599:	eb 4d                	jmp    c01045e8 <TaskTTY+0xfe>
c010459b:	81 7d e4 d3 07 00 00 	cmpl   $0x7d3,-0x1c(%ebp)
c01045a2:	74 21                	je     c01045c5 <TaskTTY+0xdb>
c01045a4:	81 7d e4 d5 07 00 00 	cmpl   $0x7d5,-0x1c(%ebp)
c01045ab:	74 2e                	je     c01045db <TaskTTY+0xf1>
c01045ad:	eb 39                	jmp    c01045e8 <TaskTTY+0xfe>
c01045af:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c01045b4:	83 ec 08             	sub    $0x8,%esp
c01045b7:	ff 75 e8             	pushl  -0x18(%ebp)
c01045ba:	50                   	push   %eax
c01045bb:	e8 c1 fb ff ff       	call   c0104181 <tty_do_read>
c01045c0:	83 c4 10             	add    $0x10,%esp
c01045c3:	eb 23                	jmp    c01045e8 <TaskTTY+0xfe>
c01045c5:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c01045ca:	83 ec 08             	sub    $0x8,%esp
c01045cd:	ff 75 e8             	pushl  -0x18(%ebp)
c01045d0:	50                   	push   %eax
c01045d1:	e8 73 fc ff ff       	call   c0104249 <tty_do_write>
c01045d6:	83 c4 10             	add    $0x10,%esp
c01045d9:	eb 0d                	jmp    c01045e8 <TaskTTY+0xfe>
c01045db:	c7 05 c0 06 11 c0 00 	movl   $0x0,0xc01106c0
c01045e2:	00 00 00 
c01045e5:	eb 01                	jmp    c01045e8 <TaskTTY+0xfe>
c01045e7:	90                   	nop
c01045e8:	e9 33 ff ff ff       	jmp    c0104520 <TaskTTY+0x36>

c01045ed <keyboard_handler>:
c01045ed:	55                   	push   %ebp
c01045ee:	89 e5                	mov    %esp,%ebp
c01045f0:	83 ec 18             	sub    $0x18,%esp
c01045f3:	c7 05 c0 06 11 c0 01 	movl   $0x1,0xc01106c0
c01045fa:	00 00 00 
c01045fd:	c7 45 f4 60 00 00 00 	movl   $0x60,-0xc(%ebp)
c0104604:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c0104609:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c010460e:	7f 5e                	jg     c010466e <keyboard_handler+0x81>
c0104610:	e8 b2 bc ff ff       	call   c01002c7 <disable_int>
c0104615:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104618:	0f b7 c0             	movzwl %ax,%eax
c010461b:	83 ec 0c             	sub    $0xc,%esp
c010461e:	50                   	push   %eax
c010461f:	e8 75 bc ff ff       	call   c0100299 <in_byte>
c0104624:	83 c4 10             	add    $0x10,%esp
c0104627:	88 45 f3             	mov    %al,-0xd(%ebp)
c010462a:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c010462f:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
c0104633:	88 10                	mov    %dl,(%eax)
c0104635:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c010463a:	83 c0 01             	add    $0x1,%eax
c010463d:	a3 e0 fb 10 c0       	mov    %eax,0xc010fbe0
c0104642:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c0104647:	83 c0 01             	add    $0x1,%eax
c010464a:	a3 e8 fb 10 c0       	mov    %eax,0xc010fbe8
c010464f:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c0104654:	ba ec fd 10 c0       	mov    $0xc010fdec,%edx
c0104659:	39 d0                	cmp    %edx,%eax
c010465b:	72 0a                	jb     c0104667 <keyboard_handler+0x7a>
c010465d:	c7 05 e0 fb 10 c0 ec 	movl   $0xc010fbec,0xc010fbe0
c0104664:	fb 10 c0 
c0104667:	e8 5d bc ff ff       	call   c01002c9 <enable_int>
c010466c:	eb 01                	jmp    c010466f <keyboard_handler+0x82>
c010466e:	90                   	nop
c010466f:	c9                   	leave  
c0104670:	c3                   	ret    

c0104671 <read_from_keyboard_buf>:
c0104671:	55                   	push   %ebp
c0104672:	89 e5                	mov    %esp,%ebp
c0104674:	83 ec 18             	sub    $0x18,%esp
c0104677:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
c010467b:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c0104680:	85 c0                	test   %eax,%eax
c0104682:	7f 06                	jg     c010468a <read_from_keyboard_buf+0x19>
c0104684:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c0104688:	eb 4b                	jmp    c01046d5 <read_from_keyboard_buf+0x64>
c010468a:	e8 38 bc ff ff       	call   c01002c7 <disable_int>
c010468f:	a1 e4 fb 10 c0       	mov    0xc010fbe4,%eax
c0104694:	0f b6 00             	movzbl (%eax),%eax
c0104697:	88 45 f7             	mov    %al,-0x9(%ebp)
c010469a:	a1 e4 fb 10 c0       	mov    0xc010fbe4,%eax
c010469f:	83 c0 01             	add    $0x1,%eax
c01046a2:	a3 e4 fb 10 c0       	mov    %eax,0xc010fbe4
c01046a7:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c01046ac:	83 e8 01             	sub    $0x1,%eax
c01046af:	a3 e8 fb 10 c0       	mov    %eax,0xc010fbe8
c01046b4:	a1 e4 fb 10 c0       	mov    0xc010fbe4,%eax
c01046b9:	ba ec fd 10 c0       	mov    $0xc010fdec,%edx
c01046be:	39 d0                	cmp    %edx,%eax
c01046c0:	72 0a                	jb     c01046cc <read_from_keyboard_buf+0x5b>
c01046c2:	c7 05 e4 fb 10 c0 ec 	movl   $0xc010fbec,0xc010fbe4
c01046c9:	fb 10 c0 
c01046cc:	e8 f8 bb ff ff       	call   c01002c9 <enable_int>
c01046d1:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c01046d5:	c9                   	leave  
c01046d6:	c3                   	ret    

c01046d7 <keyboard_read>:
c01046d7:	55                   	push   %ebp
c01046d8:	89 e5                	mov    %esp,%ebp
c01046da:	83 ec 28             	sub    $0x28,%esp
c01046dd:	90                   	nop
c01046de:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c01046e3:	85 c0                	test   %eax,%eax
c01046e5:	7e f7                	jle    c01046de <keyboard_read+0x7>
c01046e7:	e8 85 ff ff ff       	call   c0104671 <read_from_keyboard_buf>
c01046ec:	88 45 ea             	mov    %al,-0x16(%ebp)
c01046ef:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01046f6:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c01046fa:	80 7d ea e1          	cmpb   $0xe1,-0x16(%ebp)
c01046fe:	75 5a                	jne    c010475a <keyboard_read+0x83>
c0104700:	c6 45 e3 e1          	movb   $0xe1,-0x1d(%ebp)
c0104704:	c6 45 e4 1d          	movb   $0x1d,-0x1c(%ebp)
c0104708:	c6 45 e5 45          	movb   $0x45,-0x1b(%ebp)
c010470c:	c6 45 e6 e1          	movb   $0xe1,-0x1a(%ebp)
c0104710:	c6 45 e7 9d          	movb   $0x9d,-0x19(%ebp)
c0104714:	c6 45 e8 c5          	movb   $0xc5,-0x18(%ebp)
c0104718:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
c010471c:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0104723:	eb 20                	jmp    c0104745 <keyboard_read+0x6e>
c0104725:	e8 47 ff ff ff       	call   c0104671 <read_from_keyboard_buf>
c010472a:	89 c1                	mov    %eax,%ecx
c010472c:	8d 55 e3             	lea    -0x1d(%ebp),%edx
c010472f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104732:	01 d0                	add    %edx,%eax
c0104734:	0f b6 00             	movzbl (%eax),%eax
c0104737:	38 c1                	cmp    %al,%cl
c0104739:	74 06                	je     c0104741 <keyboard_read+0x6a>
c010473b:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
c010473f:	eb 0a                	jmp    c010474b <keyboard_read+0x74>
c0104741:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0104745:	83 7d ec 05          	cmpl   $0x5,-0x14(%ebp)
c0104749:	7e da                	jle    c0104725 <keyboard_read+0x4e>
c010474b:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
c010474f:	74 68                	je     c01047b9 <keyboard_read+0xe2>
c0104751:	c7 45 f4 80 01 00 00 	movl   $0x180,-0xc(%ebp)
c0104758:	eb 5f                	jmp    c01047b9 <keyboard_read+0xe2>
c010475a:	80 7d ea e0          	cmpb   $0xe0,-0x16(%ebp)
c010475e:	75 59                	jne    c01047b9 <keyboard_read+0xe2>
c0104760:	e8 0c ff ff ff       	call   c0104671 <read_from_keyboard_buf>
c0104765:	3c 2a                	cmp    $0x2a,%al
c0104767:	75 1d                	jne    c0104786 <keyboard_read+0xaf>
c0104769:	e8 03 ff ff ff       	call   c0104671 <read_from_keyboard_buf>
c010476e:	3c e0                	cmp    $0xe0,%al
c0104770:	75 14                	jne    c0104786 <keyboard_read+0xaf>
c0104772:	e8 fa fe ff ff       	call   c0104671 <read_from_keyboard_buf>
c0104777:	3c 37                	cmp    $0x37,%al
c0104779:	75 0b                	jne    c0104786 <keyboard_read+0xaf>
c010477b:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c0104782:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
c0104786:	e8 e6 fe ff ff       	call   c0104671 <read_from_keyboard_buf>
c010478b:	3c b7                	cmp    $0xb7,%al
c010478d:	75 1d                	jne    c01047ac <keyboard_read+0xd5>
c010478f:	e8 dd fe ff ff       	call   c0104671 <read_from_keyboard_buf>
c0104794:	3c e0                	cmp    $0xe0,%al
c0104796:	75 14                	jne    c01047ac <keyboard_read+0xd5>
c0104798:	e8 d4 fe ff ff       	call   c0104671 <read_from_keyboard_buf>
c010479d:	3c aa                	cmp    $0xaa,%al
c010479f:	75 0b                	jne    c01047ac <keyboard_read+0xd5>
c01047a1:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c01047a8:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c01047ac:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01047b0:	75 07                	jne    c01047b9 <keyboard_read+0xe2>
c01047b2:	c6 05 84 f7 10 c0 01 	movb   $0x1,0xc010f784
c01047b9:	81 7d f4 80 01 00 00 	cmpl   $0x180,-0xc(%ebp)
c01047c0:	0f 84 8d 00 00 00    	je     c0104853 <keyboard_read+0x17c>
c01047c6:	81 7d f4 81 01 00 00 	cmpl   $0x181,-0xc(%ebp)
c01047cd:	0f 84 80 00 00 00    	je     c0104853 <keyboard_read+0x17c>
c01047d3:	80 7d ea 36          	cmpb   $0x36,-0x16(%ebp)
c01047d7:	0f 94 c2             	sete   %dl
c01047da:	80 7d ea 2a          	cmpb   $0x2a,-0x16(%ebp)
c01047de:	0f 94 c0             	sete   %al
c01047e1:	09 d0                	or     %edx,%eax
c01047e3:	84 c0                	test   %al,%al
c01047e5:	74 07                	je     c01047ee <keyboard_read+0x117>
c01047e7:	c6 05 c8 06 11 c0 01 	movb   $0x1,0xc01106c8
c01047ee:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
c01047f2:	f7 d0                	not    %eax
c01047f4:	c0 e8 07             	shr    $0x7,%al
c01047f7:	88 45 e9             	mov    %al,-0x17(%ebp)
c01047fa:	80 7d ea 00          	cmpb   $0x0,-0x16(%ebp)
c01047fe:	74 53                	je     c0104853 <keyboard_read+0x17c>
c0104800:	80 7d e9 00          	cmpb   $0x0,-0x17(%ebp)
c0104804:	74 4d                	je     c0104853 <keyboard_read+0x17c>
c0104806:	c6 45 eb 00          	movb   $0x0,-0x15(%ebp)
c010480a:	0f b6 05 c8 06 11 c0 	movzbl 0xc01106c8,%eax
c0104811:	3c 01                	cmp    $0x1,%al
c0104813:	75 04                	jne    c0104819 <keyboard_read+0x142>
c0104815:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
c0104819:	0f b6 05 84 f7 10 c0 	movzbl 0xc010f784,%eax
c0104820:	84 c0                	test   %al,%al
c0104822:	74 04                	je     c0104828 <keyboard_read+0x151>
c0104824:	c6 45 eb 02          	movb   $0x2,-0x15(%ebp)
c0104828:	0f b6 55 ea          	movzbl -0x16(%ebp),%edx
c010482c:	89 d0                	mov    %edx,%eax
c010482e:	01 c0                	add    %eax,%eax
c0104830:	01 c2                	add    %eax,%edx
c0104832:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c0104836:	01 d0                	add    %edx,%eax
c0104838:	8b 04 85 60 e1 10 c0 	mov    -0x3fef1ea0(,%eax,4),%eax
c010483f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104842:	83 ec 08             	sub    $0x8,%esp
c0104845:	ff 75 f4             	pushl  -0xc(%ebp)
c0104848:	ff 75 08             	pushl  0x8(%ebp)
c010484b:	e8 1a 00 00 00       	call   c010486a <in_process>
c0104850:	83 c4 10             	add    $0x10,%esp
c0104853:	90                   	nop
c0104854:	c9                   	leave  
c0104855:	c3                   	ret    

c0104856 <init_keyboard_handler>:
c0104856:	55                   	push   %ebp
c0104857:	89 e5                	mov    %esp,%ebp
c0104859:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c0104860:	c6 05 c8 06 11 c0 00 	movb   $0x0,0xc01106c8
c0104867:	90                   	nop
c0104868:	5d                   	pop    %ebp
c0104869:	c3                   	ret    

c010486a <in_process>:
c010486a:	55                   	push   %ebp
c010486b:	89 e5                	mov    %esp,%ebp
c010486d:	83 ec 18             	sub    $0x18,%esp
c0104870:	83 ec 04             	sub    $0x4,%esp
c0104873:	6a 02                	push   $0x2
c0104875:	6a 00                	push   $0x0
c0104877:	8d 45 f6             	lea    -0xa(%ebp),%eax
c010487a:	50                   	push   %eax
c010487b:	e8 6b 69 00 00       	call   c010b1eb <Memset>
c0104880:	83 c4 10             	add    $0x10,%esp
c0104883:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104886:	25 00 01 00 00       	and    $0x100,%eax
c010488b:	85 c0                	test   %eax,%eax
c010488d:	75 28                	jne    c01048b7 <in_process+0x4d>
c010488f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104892:	0f b6 c0             	movzbl %al,%eax
c0104895:	83 ec 08             	sub    $0x8,%esp
c0104898:	50                   	push   %eax
c0104899:	ff 75 08             	pushl  0x8(%ebp)
c010489c:	e8 b3 f3 ff ff       	call   c0103c54 <put_key>
c01048a1:	83 c4 10             	add    $0x10,%esp
c01048a4:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c01048ab:	c6 05 c8 06 11 c0 00 	movb   $0x0,0xc01106c8
c01048b2:	e9 42 01 00 00       	jmp    c01049f9 <in_process+0x18f>
c01048b7:	0f b6 05 c8 06 11 c0 	movzbl 0xc01106c8,%eax
c01048be:	84 c0                	test   %al,%al
c01048c0:	0f 84 a9 00 00 00    	je     c010496f <in_process+0x105>
c01048c6:	83 7d 0c 2a          	cmpl   $0x2a,0xc(%ebp)
c01048ca:	0f 84 9f 00 00 00    	je     c010496f <in_process+0x105>
c01048d0:	83 7d 0c 36          	cmpl   $0x36,0xc(%ebp)
c01048d4:	0f 84 95 00 00 00    	je     c010496f <in_process+0x105>
c01048da:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c01048e1:	74 64                	je     c0104947 <in_process+0xdd>
c01048e3:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c01048ea:	77 0b                	ja     c01048f7 <in_process+0x8d>
c01048ec:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c01048f3:	74 64                	je     c0104959 <in_process+0xef>
c01048f5:	eb 73                	jmp    c010496a <in_process+0x100>
c01048f7:	81 7d 0c 55 01 00 00 	cmpl   $0x155,0xc(%ebp)
c01048fe:	74 0b                	je     c010490b <in_process+0xa1>
c0104900:	81 7d 0c 68 01 00 00 	cmpl   $0x168,0xc(%ebp)
c0104907:	74 20                	je     c0104929 <in_process+0xbf>
c0104909:	eb 5f                	jmp    c010496a <in_process+0x100>
c010490b:	83 ec 0c             	sub    $0xc,%esp
c010490e:	ff 75 08             	pushl  0x8(%ebp)
c0104911:	e8 aa f3 ff ff       	call   c0103cc0 <scroll_up>
c0104916:	83 c4 10             	add    $0x10,%esp
c0104919:	c6 05 c8 06 11 c0 00 	movb   $0x0,0xc01106c8
c0104920:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c0104927:	eb 41                	jmp    c010496a <in_process+0x100>
c0104929:	83 ec 0c             	sub    $0xc,%esp
c010492c:	ff 75 08             	pushl  0x8(%ebp)
c010492f:	e8 ce f3 ff ff       	call   c0103d02 <scroll_down>
c0104934:	83 c4 10             	add    $0x10,%esp
c0104937:	c6 05 c8 06 11 c0 00 	movb   $0x0,0xc01106c8
c010493e:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c0104945:	eb 23                	jmp    c010496a <in_process+0x100>
c0104947:	83 ec 08             	sub    $0x8,%esp
c010494a:	6a 0a                	push   $0xa
c010494c:	ff 75 08             	pushl  0x8(%ebp)
c010494f:	e8 19 f4 ff ff       	call   c0103d6d <out_char>
c0104954:	83 c4 10             	add    $0x10,%esp
c0104957:	eb 11                	jmp    c010496a <in_process+0x100>
c0104959:	83 ec 08             	sub    $0x8,%esp
c010495c:	6a 08                	push   $0x8
c010495e:	ff 75 08             	pushl  0x8(%ebp)
c0104961:	e8 07 f4 ff ff       	call   c0103d6d <out_char>
c0104966:	83 c4 10             	add    $0x10,%esp
c0104969:	90                   	nop
c010496a:	e9 8a 00 00 00       	jmp    c01049f9 <in_process+0x18f>
c010496f:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0104976:	74 55                	je     c01049cd <in_process+0x163>
c0104978:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c010497f:	77 14                	ja     c0104995 <in_process+0x12b>
c0104981:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0104988:	74 31                	je     c01049bb <in_process+0x151>
c010498a:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0104991:	74 16                	je     c01049a9 <in_process+0x13f>
c0104993:	eb 64                	jmp    c01049f9 <in_process+0x18f>
c0104995:	81 7d 0c 41 01 00 00 	cmpl   $0x141,0xc(%ebp)
c010499c:	74 3e                	je     c01049dc <in_process+0x172>
c010499e:	81 7d 0c 42 01 00 00 	cmpl   $0x142,0xc(%ebp)
c01049a5:	74 44                	je     c01049eb <in_process+0x181>
c01049a7:	eb 50                	jmp    c01049f9 <in_process+0x18f>
c01049a9:	83 ec 08             	sub    $0x8,%esp
c01049ac:	6a 0a                	push   $0xa
c01049ae:	ff 75 08             	pushl  0x8(%ebp)
c01049b1:	e8 9e f2 ff ff       	call   c0103c54 <put_key>
c01049b6:	83 c4 10             	add    $0x10,%esp
c01049b9:	eb 3e                	jmp    c01049f9 <in_process+0x18f>
c01049bb:	83 ec 08             	sub    $0x8,%esp
c01049be:	6a 08                	push   $0x8
c01049c0:	ff 75 08             	pushl  0x8(%ebp)
c01049c3:	e8 8c f2 ff ff       	call   c0103c54 <put_key>
c01049c8:	83 c4 10             	add    $0x10,%esp
c01049cb:	eb 2c                	jmp    c01049f9 <in_process+0x18f>
c01049cd:	83 ec 0c             	sub    $0xc,%esp
c01049d0:	6a 00                	push   $0x0
c01049d2:	e8 4c f1 ff ff       	call   c0103b23 <select_console>
c01049d7:	83 c4 10             	add    $0x10,%esp
c01049da:	eb 1d                	jmp    c01049f9 <in_process+0x18f>
c01049dc:	83 ec 0c             	sub    $0xc,%esp
c01049df:	6a 01                	push   $0x1
c01049e1:	e8 3d f1 ff ff       	call   c0103b23 <select_console>
c01049e6:	83 c4 10             	add    $0x10,%esp
c01049e9:	eb 0e                	jmp    c01049f9 <in_process+0x18f>
c01049eb:	83 ec 0c             	sub    $0xc,%esp
c01049ee:	6a 02                	push   $0x2
c01049f0:	e8 2e f1 ff ff       	call   c0103b23 <select_console>
c01049f5:	83 c4 10             	add    $0x10,%esp
c01049f8:	90                   	nop
c01049f9:	90                   	nop
c01049fa:	c9                   	leave  
c01049fb:	c3                   	ret    

c01049fc <open>:
c01049fc:	55                   	push   %ebp
c01049fd:	89 e5                	mov    %esp,%ebp
c01049ff:	83 ec 18             	sub    $0x18,%esp
c0104a02:	83 ec 0c             	sub    $0xc,%esp
c0104a05:	6a 7c                	push   $0x7c
c0104a07:	e8 00 cb ff ff       	call   c010150c <sys_malloc>
c0104a0c:	83 c4 10             	add    $0x10,%esp
c0104a0f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104a12:	83 ec 04             	sub    $0x4,%esp
c0104a15:	6a 7c                	push   $0x7c
c0104a17:	6a 00                	push   $0x0
c0104a19:	ff 75 f4             	pushl  -0xc(%ebp)
c0104a1c:	e8 ca 67 00 00       	call   c010b1eb <Memset>
c0104a21:	83 c4 10             	add    $0x10,%esp
c0104a24:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104a27:	c7 40 78 06 00 00 00 	movl   $0x6,0x78(%eax)
c0104a2e:	83 ec 0c             	sub    $0xc,%esp
c0104a31:	ff 75 08             	pushl  0x8(%ebp)
c0104a34:	e8 32 14 00 00       	call   c0105e6b <get_physical_address>
c0104a39:	83 c4 10             	add    $0x10,%esp
c0104a3c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104a3f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104a42:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104a45:	89 50 44             	mov    %edx,0x44(%eax)
c0104a48:	8b 55 0c             	mov    0xc(%ebp),%edx
c0104a4b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104a4e:	89 50 74             	mov    %edx,0x74(%eax)
c0104a51:	83 ec 0c             	sub    $0xc,%esp
c0104a54:	ff 75 08             	pushl  0x8(%ebp)
c0104a57:	e8 c8 67 00 00       	call   c010b224 <Strlen>
c0104a5c:	83 c4 10             	add    $0x10,%esp
c0104a5f:	89 c2                	mov    %eax,%edx
c0104a61:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104a64:	89 50 40             	mov    %edx,0x40(%eax)
c0104a67:	83 ec 04             	sub    $0x4,%esp
c0104a6a:	6a 02                	push   $0x2
c0104a6c:	ff 75 f4             	pushl  -0xc(%ebp)
c0104a6f:	6a 03                	push   $0x3
c0104a71:	e8 b2 47 00 00       	call   c0109228 <send_rec>
c0104a76:	83 c4 10             	add    $0x10,%esp
c0104a79:	83 ec 08             	sub    $0x8,%esp
c0104a7c:	6a 7c                	push   $0x7c
c0104a7e:	ff 75 f4             	pushl  -0xc(%ebp)
c0104a81:	e8 9b ca ff ff       	call   c0101521 <sys_free>
c0104a86:	83 c4 10             	add    $0x10,%esp
c0104a89:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104a8c:	8b 40 50             	mov    0x50(%eax),%eax
c0104a8f:	c9                   	leave  
c0104a90:	c3                   	ret    

c0104a91 <read>:
c0104a91:	55                   	push   %ebp
c0104a92:	89 e5                	mov    %esp,%ebp
c0104a94:	83 ec 38             	sub    $0x38,%esp
c0104a97:	c7 45 dc 7c 00 00 00 	movl   $0x7c,-0x24(%ebp)
c0104a9e:	83 ec 0c             	sub    $0xc,%esp
c0104aa1:	ff 75 dc             	pushl  -0x24(%ebp)
c0104aa4:	e8 63 ca ff ff       	call   c010150c <sys_malloc>
c0104aa9:	83 c4 10             	add    $0x10,%esp
c0104aac:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0104aaf:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104ab2:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0104ab7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104aba:	83 ec 0c             	sub    $0xc,%esp
c0104abd:	ff 75 0c             	pushl  0xc(%ebp)
c0104ac0:	e8 a6 13 00 00       	call   c0105e6b <get_physical_address>
c0104ac5:	83 c4 10             	add    $0x10,%esp
c0104ac8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104acb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104ace:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0104ad3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0104ad6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104ad9:	05 ff 0f 00 00       	add    $0xfff,%eax
c0104ade:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0104ae1:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0104ae8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0104aef:	8b 55 10             	mov    0x10(%ebp),%edx
c0104af2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104af5:	01 d0                	add    %edx,%eax
c0104af7:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
c0104afa:	0f 83 a8 00 00 00    	jae    c0104ba8 <read+0x117>
c0104b00:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104b03:	2b 45 f0             	sub    -0x10(%ebp),%eax
c0104b06:	05 00 10 00 00       	add    $0x1000,%eax
c0104b0b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0104b0e:	8b 45 10             	mov    0x10(%ebp),%eax
c0104b11:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0104b14:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104b17:	83 ec 04             	sub    $0x4,%esp
c0104b1a:	50                   	push   %eax
c0104b1b:	6a 00                	push   $0x0
c0104b1d:	ff 75 d8             	pushl  -0x28(%ebp)
c0104b20:	e8 c6 66 00 00       	call   c010b1eb <Memset>
c0104b25:	83 c4 10             	add    $0x10,%esp
c0104b28:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104b2b:	c7 40 78 07 00 00 00 	movl   $0x7,0x78(%eax)
c0104b32:	8b 55 08             	mov    0x8(%ebp),%edx
c0104b35:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104b38:	89 50 50             	mov    %edx,0x50(%eax)
c0104b3b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104b3e:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104b41:	89 50 10             	mov    %edx,0x10(%eax)
c0104b44:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104b47:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0104b4a:	89 50 60             	mov    %edx,0x60(%eax)
c0104b4d:	83 ec 04             	sub    $0x4,%esp
c0104b50:	6a 02                	push   $0x2
c0104b52:	ff 75 d8             	pushl  -0x28(%ebp)
c0104b55:	6a 03                	push   $0x3
c0104b57:	e8 cc 46 00 00       	call   c0109228 <send_rec>
c0104b5c:	83 c4 10             	add    $0x10,%esp
c0104b5f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104b62:	8b 40 60             	mov    0x60(%eax),%eax
c0104b65:	01 45 e8             	add    %eax,-0x18(%ebp)
c0104b68:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0104b6b:	29 45 e0             	sub    %eax,-0x20(%ebp)
c0104b6e:	8b 45 10             	mov    0x10(%ebp),%eax
c0104b71:	2b 45 e4             	sub    -0x1c(%ebp),%eax
c0104b74:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0104b77:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0104b7a:	89 45 10             	mov    %eax,0x10(%ebp)
c0104b7d:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
c0104b84:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c0104b8b:	83 ec 0c             	sub    $0xc,%esp
c0104b8e:	ff 75 f4             	pushl  -0xc(%ebp)
c0104b91:	e8 d5 12 00 00       	call   c0105e6b <get_physical_address>
c0104b96:	83 c4 10             	add    $0x10,%esp
c0104b99:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104b9c:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0104ba0:	0f 85 6e ff ff ff    	jne    c0104b14 <read+0x83>
c0104ba6:	eb 54                	jmp    c0104bfc <read+0x16b>
c0104ba8:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104bab:	83 ec 04             	sub    $0x4,%esp
c0104bae:	50                   	push   %eax
c0104baf:	6a 00                	push   $0x0
c0104bb1:	ff 75 d8             	pushl  -0x28(%ebp)
c0104bb4:	e8 32 66 00 00       	call   c010b1eb <Memset>
c0104bb9:	83 c4 10             	add    $0x10,%esp
c0104bbc:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104bbf:	c7 40 78 07 00 00 00 	movl   $0x7,0x78(%eax)
c0104bc6:	8b 55 08             	mov    0x8(%ebp),%edx
c0104bc9:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104bcc:	89 50 50             	mov    %edx,0x50(%eax)
c0104bcf:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104bd2:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104bd5:	89 50 10             	mov    %edx,0x10(%eax)
c0104bd8:	8b 55 10             	mov    0x10(%ebp),%edx
c0104bdb:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104bde:	89 50 60             	mov    %edx,0x60(%eax)
c0104be1:	83 ec 04             	sub    $0x4,%esp
c0104be4:	6a 02                	push   $0x2
c0104be6:	ff 75 d8             	pushl  -0x28(%ebp)
c0104be9:	6a 03                	push   $0x3
c0104beb:	e8 38 46 00 00       	call   c0109228 <send_rec>
c0104bf0:	83 c4 10             	add    $0x10,%esp
c0104bf3:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104bf6:	8b 40 60             	mov    0x60(%eax),%eax
c0104bf9:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0104bfc:	83 ec 08             	sub    $0x8,%esp
c0104bff:	ff 75 dc             	pushl  -0x24(%ebp)
c0104c02:	ff 75 d8             	pushl  -0x28(%ebp)
c0104c05:	e8 17 c9 ff ff       	call   c0101521 <sys_free>
c0104c0a:	83 c4 10             	add    $0x10,%esp
c0104c0d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104c10:	c9                   	leave  
c0104c11:	c3                   	ret    

c0104c12 <write>:
c0104c12:	55                   	push   %ebp
c0104c13:	89 e5                	mov    %esp,%ebp
c0104c15:	83 ec 18             	sub    $0x18,%esp
c0104c18:	c7 45 f4 7c 00 00 00 	movl   $0x7c,-0xc(%ebp)
c0104c1f:	83 ec 0c             	sub    $0xc,%esp
c0104c22:	ff 75 f4             	pushl  -0xc(%ebp)
c0104c25:	e8 e2 c8 ff ff       	call   c010150c <sys_malloc>
c0104c2a:	83 c4 10             	add    $0x10,%esp
c0104c2d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104c30:	83 ec 0c             	sub    $0xc,%esp
c0104c33:	ff 75 0c             	pushl  0xc(%ebp)
c0104c36:	e8 30 12 00 00       	call   c0105e6b <get_physical_address>
c0104c3b:	83 c4 10             	add    $0x10,%esp
c0104c3e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0104c41:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104c44:	c7 40 78 0a 00 00 00 	movl   $0xa,0x78(%eax)
c0104c4b:	8b 55 08             	mov    0x8(%ebp),%edx
c0104c4e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104c51:	89 50 50             	mov    %edx,0x50(%eax)
c0104c54:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104c57:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0104c5a:	89 50 10             	mov    %edx,0x10(%eax)
c0104c5d:	8b 55 10             	mov    0x10(%ebp),%edx
c0104c60:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104c63:	89 50 60             	mov    %edx,0x60(%eax)
c0104c66:	83 ec 04             	sub    $0x4,%esp
c0104c69:	6a 02                	push   $0x2
c0104c6b:	ff 75 f0             	pushl  -0x10(%ebp)
c0104c6e:	6a 03                	push   $0x3
c0104c70:	e8 b3 45 00 00       	call   c0109228 <send_rec>
c0104c75:	83 c4 10             	add    $0x10,%esp
c0104c78:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104c7b:	8b 40 60             	mov    0x60(%eax),%eax
c0104c7e:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0104c81:	83 ec 08             	sub    $0x8,%esp
c0104c84:	ff 75 f4             	pushl  -0xc(%ebp)
c0104c87:	ff 75 f0             	pushl  -0x10(%ebp)
c0104c8a:	e8 92 c8 ff ff       	call   c0101521 <sys_free>
c0104c8f:	83 c4 10             	add    $0x10,%esp
c0104c92:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104c95:	c9                   	leave  
c0104c96:	c3                   	ret    

c0104c97 <close>:
c0104c97:	55                   	push   %ebp
c0104c98:	89 e5                	mov    %esp,%ebp
c0104c9a:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104ca0:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0104ca7:	8b 45 08             	mov    0x8(%ebp),%eax
c0104caa:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0104cad:	83 ec 04             	sub    $0x4,%esp
c0104cb0:	6a 02                	push   $0x2
c0104cb2:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104cb8:	50                   	push   %eax
c0104cb9:	6a 03                	push   $0x3
c0104cbb:	e8 68 45 00 00       	call   c0109228 <send_rec>
c0104cc0:	83 c4 10             	add    $0x10,%esp
c0104cc3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104cc6:	83 f8 65             	cmp    $0x65,%eax
c0104cc9:	74 19                	je     c0104ce4 <close+0x4d>
c0104ccb:	6a 13                	push   $0x13
c0104ccd:	68 9f a6 10 c0       	push   $0xc010a69f
c0104cd2:	68 9f a6 10 c0       	push   $0xc010a69f
c0104cd7:	68 ab a6 10 c0       	push   $0xc010a6ab
c0104cdc:	e8 d7 38 00 00       	call   c01085b8 <assertion_failure>
c0104ce1:	83 c4 10             	add    $0x10,%esp
c0104ce4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0104ce7:	c9                   	leave  
c0104ce8:	c3                   	ret    

c0104ce9 <wait>:
c0104ce9:	55                   	push   %ebp
c0104cea:	89 e5                	mov    %esp,%ebp
c0104cec:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104cf2:	c7 45 f4 09 00 00 00 	movl   $0x9,-0xc(%ebp)
c0104cf9:	83 ec 04             	sub    $0x4,%esp
c0104cfc:	6a 01                	push   $0x1
c0104cfe:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104d04:	50                   	push   %eax
c0104d05:	6a 03                	push   $0x3
c0104d07:	e8 1c 45 00 00       	call   c0109228 <send_rec>
c0104d0c:	83 c4 10             	add    $0x10,%esp
c0104d0f:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0104d12:	89 c2                	mov    %eax,%edx
c0104d14:	8b 45 08             	mov    0x8(%ebp),%eax
c0104d17:	89 10                	mov    %edx,(%eax)
c0104d19:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104d1c:	83 f8 21             	cmp    $0x21,%eax
c0104d1f:	74 05                	je     c0104d26 <wait+0x3d>
c0104d21:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104d24:	eb 05                	jmp    c0104d2b <wait+0x42>
c0104d26:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0104d2b:	c9                   	leave  
c0104d2c:	c3                   	ret    

c0104d2d <exit>:
c0104d2d:	55                   	push   %ebp
c0104d2e:	89 e5                	mov    %esp,%ebp
c0104d30:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104d36:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
c0104d3d:	8b 45 08             	mov    0x8(%ebp),%eax
c0104d40:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0104d43:	83 ec 04             	sub    $0x4,%esp
c0104d46:	6a 01                	push   $0x1
c0104d48:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104d4e:	50                   	push   %eax
c0104d4f:	6a 03                	push   $0x3
c0104d51:	e8 d2 44 00 00       	call   c0109228 <send_rec>
c0104d56:	83 c4 10             	add    $0x10,%esp
c0104d59:	90                   	nop
c0104d5a:	c9                   	leave  
c0104d5b:	c3                   	ret    

c0104d5c <fork>:
c0104d5c:	55                   	push   %ebp
c0104d5d:	89 e5                	mov    %esp,%ebp
c0104d5f:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104d65:	83 ec 04             	sub    $0x4,%esp
c0104d68:	6a 7c                	push   $0x7c
c0104d6a:	6a 00                	push   $0x0
c0104d6c:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104d72:	50                   	push   %eax
c0104d73:	e8 73 64 00 00       	call   c010b1eb <Memset>
c0104d78:	83 c4 10             	add    $0x10,%esp
c0104d7b:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
c0104d82:	83 ec 04             	sub    $0x4,%esp
c0104d85:	6a 01                	push   $0x1
c0104d87:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104d8d:	50                   	push   %eax
c0104d8e:	6a 03                	push   $0x3
c0104d90:	e8 93 44 00 00       	call   c0109228 <send_rec>
c0104d95:	83 c4 10             	add    $0x10,%esp
c0104d98:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c0104d9f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104da2:	c9                   	leave  
c0104da3:	c3                   	ret    

c0104da4 <getpid>:
c0104da4:	55                   	push   %ebp
c0104da5:	89 e5                	mov    %esp,%ebp
c0104da7:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104dad:	c7 45 f4 05 00 00 00 	movl   $0x5,-0xc(%ebp)
c0104db4:	83 ec 04             	sub    $0x4,%esp
c0104db7:	6a 05                	push   $0x5
c0104db9:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104dbf:	50                   	push   %eax
c0104dc0:	6a 03                	push   $0x3
c0104dc2:	e8 61 44 00 00       	call   c0109228 <send_rec>
c0104dc7:	83 c4 10             	add    $0x10,%esp
c0104dca:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104dcd:	c9                   	leave  
c0104dce:	c3                   	ret    

c0104dcf <exec>:
c0104dcf:	55                   	push   %ebp
c0104dd0:	89 e5                	mov    %esp,%ebp
c0104dd2:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104dd8:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0104ddf:	8b 45 08             	mov    0x8(%ebp),%eax
c0104de2:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0104de5:	83 ec 0c             	sub    $0xc,%esp
c0104de8:	ff 75 08             	pushl  0x8(%ebp)
c0104deb:	e8 34 64 00 00       	call   c010b224 <Strlen>
c0104df0:	83 c4 10             	add    $0x10,%esp
c0104df3:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0104df6:	c7 45 8c 00 00 00 00 	movl   $0x0,-0x74(%ebp)
c0104dfd:	c7 45 98 00 00 00 00 	movl   $0x0,-0x68(%ebp)
c0104e04:	83 ec 04             	sub    $0x4,%esp
c0104e07:	6a 01                	push   $0x1
c0104e09:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104e0f:	50                   	push   %eax
c0104e10:	6a 03                	push   $0x3
c0104e12:	e8 11 44 00 00       	call   c0109228 <send_rec>
c0104e17:	83 c4 10             	add    $0x10,%esp
c0104e1a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104e1d:	83 f8 65             	cmp    $0x65,%eax
c0104e20:	74 19                	je     c0104e3b <exec+0x6c>
c0104e22:	6a 19                	push   $0x19
c0104e24:	68 c3 a6 10 c0       	push   $0xc010a6c3
c0104e29:	68 c3 a6 10 c0       	push   $0xc010a6c3
c0104e2e:	68 ce a6 10 c0       	push   $0xc010a6ce
c0104e33:	e8 80 37 00 00       	call   c01085b8 <assertion_failure>
c0104e38:	83 c4 10             	add    $0x10,%esp
c0104e3b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0104e3e:	c9                   	leave  
c0104e3f:	c3                   	ret    

c0104e40 <execv>:
c0104e40:	55                   	push   %ebp
c0104e41:	89 e5                	mov    %esp,%ebp
c0104e43:	81 ec b8 00 00 00    	sub    $0xb8,%esp
c0104e49:	c7 45 e0 00 01 00 00 	movl   $0x100,-0x20(%ebp)
c0104e50:	83 ec 0c             	sub    $0xc,%esp
c0104e53:	ff 75 e0             	pushl  -0x20(%ebp)
c0104e56:	e8 b1 c6 ff ff       	call   c010150c <sys_malloc>
c0104e5b:	83 c4 10             	add    $0x10,%esp
c0104e5e:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0104e61:	66 87 db             	xchg   %bx,%bx
c0104e64:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0104e67:	83 ec 04             	sub    $0x4,%esp
c0104e6a:	50                   	push   %eax
c0104e6b:	6a 00                	push   $0x0
c0104e6d:	ff 75 dc             	pushl  -0x24(%ebp)
c0104e70:	e8 76 63 00 00       	call   c010b1eb <Memset>
c0104e75:	83 c4 10             	add    $0x10,%esp
c0104e78:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104e7b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104e7e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0104e85:	eb 23                	jmp    c0104eaa <execv+0x6a>
c0104e87:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104e8a:	8b 00                	mov    (%eax),%eax
c0104e8c:	83 ec 08             	sub    $0x8,%esp
c0104e8f:	50                   	push   %eax
c0104e90:	68 e6 a6 10 c0       	push   $0xc010a6e6
c0104e95:	e8 c1 33 00 00       	call   c010825b <Printf>
c0104e9a:	83 c4 10             	add    $0x10,%esp
c0104e9d:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
c0104ea1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104ea4:	83 c0 04             	add    $0x4,%eax
c0104ea7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104eaa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104ead:	8b 00                	mov    (%eax),%eax
c0104eaf:	85 c0                	test   %eax,%eax
c0104eb1:	75 d4                	jne    c0104e87 <execv+0x47>
c0104eb3:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104eb6:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104eb9:	01 d0                	add    %edx,%eax
c0104ebb:	c6 00 00             	movb   $0x0,(%eax)
c0104ebe:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104ec1:	83 c0 04             	add    $0x4,%eax
c0104ec4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104ec7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104eca:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0104ecd:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104ed0:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0104ed3:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0104eda:	eb 5b                	jmp    c0104f37 <execv+0xf7>
c0104edc:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104edf:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104ee2:	01 c2                	add    %eax,%edx
c0104ee4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104ee7:	89 10                	mov    %edx,(%eax)
c0104ee9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104eec:	8b 00                	mov    (%eax),%eax
c0104eee:	8b 4d f0             	mov    -0x10(%ebp),%ecx
c0104ef1:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0104ef4:	01 ca                	add    %ecx,%edx
c0104ef6:	83 ec 08             	sub    $0x8,%esp
c0104ef9:	50                   	push   %eax
c0104efa:	52                   	push   %edx
c0104efb:	e8 0a 63 00 00       	call   c010b20a <Strcpy>
c0104f00:	83 c4 10             	add    $0x10,%esp
c0104f03:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104f06:	8b 00                	mov    (%eax),%eax
c0104f08:	83 ec 0c             	sub    $0xc,%esp
c0104f0b:	50                   	push   %eax
c0104f0c:	e8 13 63 00 00       	call   c010b224 <Strlen>
c0104f11:	83 c4 10             	add    $0x10,%esp
c0104f14:	01 45 f0             	add    %eax,-0x10(%ebp)
c0104f17:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104f1a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104f1d:	01 d0                	add    %edx,%eax
c0104f1f:	c6 00 00             	movb   $0x0,(%eax)
c0104f22:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104f25:	83 c0 01             	add    $0x1,%eax
c0104f28:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104f2b:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
c0104f2f:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c0104f33:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0104f37:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104f3a:	8b 00                	mov    (%eax),%eax
c0104f3c:	85 c0                	test   %eax,%eax
c0104f3e:	75 9c                	jne    c0104edc <execv+0x9c>
c0104f40:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104f43:	ba 00 00 00 c0       	mov    $0xc0000000,%edx
c0104f48:	29 c2                	sub    %eax,%edx
c0104f4a:	89 d0                	mov    %edx,%eax
c0104f4c:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0104f4f:	83 ec 0c             	sub    $0xc,%esp
c0104f52:	ff 75 08             	pushl  0x8(%ebp)
c0104f55:	e8 11 0f 00 00       	call   c0105e6b <get_physical_address>
c0104f5a:	83 c4 10             	add    $0x10,%esp
c0104f5d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0104f60:	83 ec 0c             	sub    $0xc,%esp
c0104f63:	ff 75 dc             	pushl  -0x24(%ebp)
c0104f66:	e8 00 0f 00 00       	call   c0105e6b <get_physical_address>
c0104f6b:	83 c4 10             	add    $0x10,%esp
c0104f6e:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0104f71:	83 ec 0c             	sub    $0xc,%esp
c0104f74:	ff 75 d8             	pushl  -0x28(%ebp)
c0104f77:	e8 ef 0e 00 00       	call   c0105e6b <get_physical_address>
c0104f7c:	83 c4 10             	add    $0x10,%esp
c0104f7f:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0104f82:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
c0104f89:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0104f8c:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0104f8f:	83 ec 0c             	sub    $0xc,%esp
c0104f92:	ff 75 08             	pushl  0x8(%ebp)
c0104f95:	e8 8a 62 00 00       	call   c010b224 <Strlen>
c0104f9a:	83 c4 10             	add    $0x10,%esp
c0104f9d:	89 45 90             	mov    %eax,-0x70(%ebp)
c0104fa0:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0104fa3:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
c0104fa9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104fac:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c0104fb2:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104fb5:	89 85 70 ff ff ff    	mov    %eax,-0x90(%ebp)
c0104fbb:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0104fbe:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
c0104fc4:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104fc7:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0104fcd:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104fd0:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0104fd3:	29 c2                	sub    %eax,%edx
c0104fd5:	89 d0                	mov    %edx,%eax
c0104fd7:	89 85 7c ff ff ff    	mov    %eax,-0x84(%ebp)
c0104fdd:	83 ec 04             	sub    $0x4,%esp
c0104fe0:	6a 01                	push   $0x1
c0104fe2:	8d 85 50 ff ff ff    	lea    -0xb0(%ebp),%eax
c0104fe8:	50                   	push   %eax
c0104fe9:	6a 03                	push   $0x3
c0104feb:	e8 38 42 00 00       	call   c0109228 <send_rec>
c0104ff0:	83 c4 10             	add    $0x10,%esp
c0104ff3:	83 ec 08             	sub    $0x8,%esp
c0104ff6:	68 00 04 00 00       	push   $0x400
c0104ffb:	ff 75 dc             	pushl  -0x24(%ebp)
c0104ffe:	e8 1e c5 ff ff       	call   c0101521 <sys_free>
c0105003:	83 c4 10             	add    $0x10,%esp
c0105006:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0105009:	83 f8 65             	cmp    $0x65,%eax
c010500c:	74 1c                	je     c010502a <execv+0x1ea>
c010500e:	68 95 00 00 00       	push   $0x95
c0105013:	68 c3 a6 10 c0       	push   $0xc010a6c3
c0105018:	68 c3 a6 10 c0       	push   $0xc010a6c3
c010501d:	68 ce a6 10 c0       	push   $0xc010a6ce
c0105022:	e8 91 35 00 00       	call   c01085b8 <assertion_failure>
c0105027:	83 c4 10             	add    $0x10,%esp
c010502a:	8b 45 a8             	mov    -0x58(%ebp),%eax
c010502d:	c9                   	leave  
c010502e:	c3                   	ret    

c010502f <execl>:
c010502f:	55                   	push   %ebp
c0105030:	89 e5                	mov    %esp,%ebp
c0105032:	83 ec 18             	sub    $0x18,%esp
c0105035:	8d 45 0c             	lea    0xc(%ebp),%eax
c0105038:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010503b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010503e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105041:	83 ec 08             	sub    $0x8,%esp
c0105044:	ff 75 f0             	pushl  -0x10(%ebp)
c0105047:	ff 75 08             	pushl  0x8(%ebp)
c010504a:	e8 f1 fd ff ff       	call   c0104e40 <execv>
c010504f:	83 c4 10             	add    $0x10,%esp
c0105052:	c9                   	leave  
c0105053:	c3                   	ret    

c0105054 <TaskMM>:
c0105054:	55                   	push   %ebp
c0105055:	89 e5                	mov    %esp,%ebp
c0105057:	83 ec 28             	sub    $0x28,%esp
c010505a:	83 ec 0c             	sub    $0xc,%esp
c010505d:	6a 7c                	push   $0x7c
c010505f:	e8 a8 c4 ff ff       	call   c010150c <sys_malloc>
c0105064:	83 c4 10             	add    $0x10,%esp
c0105067:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010506a:	83 ec 0c             	sub    $0xc,%esp
c010506d:	6a 7c                	push   $0x7c
c010506f:	e8 98 c4 ff ff       	call   c010150c <sys_malloc>
c0105074:	83 c4 10             	add    $0x10,%esp
c0105077:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010507a:	83 ec 04             	sub    $0x4,%esp
c010507d:	6a 12                	push   $0x12
c010507f:	ff 75 f0             	pushl  -0x10(%ebp)
c0105082:	6a 02                	push   $0x2
c0105084:	e8 9f 41 00 00       	call   c0109228 <send_rec>
c0105089:	83 c4 10             	add    $0x10,%esp
c010508c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010508f:	8b 40 78             	mov    0x78(%eax),%eax
c0105092:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105095:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105098:	8b 00                	mov    (%eax),%eax
c010509a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010509d:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c01050a4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01050a7:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c01050ae:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01050b1:	c7 40 58 00 00 00 00 	movl   $0x0,0x58(%eax)
c01050b8:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c01050bc:	74 4e                	je     c010510c <TaskMM+0xb8>
c01050be:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c01050c2:	7f 08                	jg     c01050cc <TaskMM+0x78>
c01050c4:	83 7d e8 02          	cmpl   $0x2,-0x18(%ebp)
c01050c8:	74 28                	je     c01050f2 <TaskMM+0x9e>
c01050ca:	eb 71                	jmp    c010513d <TaskMM+0xe9>
c01050cc:	83 7d e8 04          	cmpl   $0x4,-0x18(%ebp)
c01050d0:	74 08                	je     c01050da <TaskMM+0x86>
c01050d2:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c01050d6:	74 4e                	je     c0105126 <TaskMM+0xd2>
c01050d8:	eb 63                	jmp    c010513d <TaskMM+0xe9>
c01050da:	83 ec 0c             	sub    $0xc,%esp
c01050dd:	ff 75 f0             	pushl  -0x10(%ebp)
c01050e0:	e8 d0 04 00 00       	call   c01055b5 <do_fork>
c01050e5:	83 c4 10             	add    $0x10,%esp
c01050e8:	89 c2                	mov    %eax,%edx
c01050ea:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01050ed:	89 50 5c             	mov    %edx,0x5c(%eax)
c01050f0:	eb 5c                	jmp    c010514e <TaskMM+0xfa>
c01050f2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01050f9:	66 87 db             	xchg   %bx,%bx
c01050fc:	83 ec 0c             	sub    $0xc,%esp
c01050ff:	ff 75 f0             	pushl  -0x10(%ebp)
c0105102:	e8 95 00 00 00       	call   c010519c <do_exec>
c0105107:	83 c4 10             	add    $0x10,%esp
c010510a:	eb 42                	jmp    c010514e <TaskMM+0xfa>
c010510c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0105113:	83 ec 08             	sub    $0x8,%esp
c0105116:	ff 75 e0             	pushl  -0x20(%ebp)
c0105119:	ff 75 f0             	pushl  -0x10(%ebp)
c010511c:	e8 02 05 00 00       	call   c0105623 <do_exit>
c0105121:	83 c4 10             	add    $0x10,%esp
c0105124:	eb 28                	jmp    c010514e <TaskMM+0xfa>
c0105126:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010512d:	83 ec 0c             	sub    $0xc,%esp
c0105130:	ff 75 f0             	pushl  -0x10(%ebp)
c0105133:	e8 75 05 00 00       	call   c01056ad <do_wait>
c0105138:	83 c4 10             	add    $0x10,%esp
c010513b:	eb 11                	jmp    c010514e <TaskMM+0xfa>
c010513d:	83 ec 0c             	sub    $0xc,%esp
c0105140:	68 f0 a6 10 c0       	push   $0xc010a6f0
c0105145:	e8 50 34 00 00       	call   c010859a <panic>
c010514a:	83 c4 10             	add    $0x10,%esp
c010514d:	90                   	nop
c010514e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0105152:	0f 84 22 ff ff ff    	je     c010507a <TaskMM+0x26>
c0105158:	83 ec 0c             	sub    $0xc,%esp
c010515b:	6a 03                	push   $0x3
c010515d:	e8 c5 2f 00 00       	call   c0108127 <delay>
c0105162:	83 c4 10             	add    $0x10,%esp
c0105165:	83 ec 04             	sub    $0x4,%esp
c0105168:	ff 75 e4             	pushl  -0x1c(%ebp)
c010516b:	ff 75 ec             	pushl  -0x14(%ebp)
c010516e:	6a 01                	push   $0x1
c0105170:	e8 b3 40 00 00       	call   c0109228 <send_rec>
c0105175:	83 c4 10             	add    $0x10,%esp
c0105178:	e9 fd fe ff ff       	jmp    c010507a <TaskMM+0x26>

c010517d <alloc_mem>:
c010517d:	55                   	push   %ebp
c010517e:	89 e5                	mov    %esp,%ebp
c0105180:	83 ec 10             	sub    $0x10,%esp
c0105183:	8b 45 08             	mov    0x8(%ebp),%eax
c0105186:	83 e8 08             	sub    $0x8,%eax
c0105189:	69 c0 00 10 10 00    	imul   $0x101000,%eax,%eax
c010518f:	05 00 00 a0 00       	add    $0xa00000,%eax
c0105194:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105197:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010519a:	c9                   	leave  
c010519b:	c3                   	ret    

c010519c <do_exec>:
c010519c:	55                   	push   %ebp
c010519d:	89 e5                	mov    %esp,%ebp
c010519f:	81 ec 38 01 00 00    	sub    $0x138,%esp
c01051a5:	c7 85 56 ff ff ff 64 	movl   $0x5f766564,-0xaa(%ebp)
c01051ac:	65 76 5f 
c01051af:	c7 85 5a ff ff ff 74 	movl   $0x31797474,-0xa6(%ebp)
c01051b6:	74 79 31 
c01051b9:	66 c7 85 5e ff ff ff 	movw   $0x0,-0xa2(%ebp)
c01051c0:	00 00 
c01051c2:	83 ec 08             	sub    $0x8,%esp
c01051c5:	6a 00                	push   $0x0
c01051c7:	8d 85 56 ff ff ff    	lea    -0xaa(%ebp),%eax
c01051cd:	50                   	push   %eax
c01051ce:	e8 29 f8 ff ff       	call   c01049fc <open>
c01051d3:	83 c4 10             	add    $0x10,%esp
c01051d6:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01051d9:	8b 45 08             	mov    0x8(%ebp),%eax
c01051dc:	8b 00                	mov    (%eax),%eax
c01051de:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01051e1:	c7 45 d0 00 40 03 00 	movl   $0x34000,-0x30(%ebp)
c01051e8:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01051eb:	83 ec 0c             	sub    $0xc,%esp
c01051ee:	50                   	push   %eax
c01051ef:	e8 18 c3 ff ff       	call   c010150c <sys_malloc>
c01051f4:	83 c4 10             	add    $0x10,%esp
c01051f7:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01051fa:	83 ec 04             	sub    $0x4,%esp
c01051fd:	ff 75 d0             	pushl  -0x30(%ebp)
c0105200:	6a 00                	push   $0x0
c0105202:	ff 75 cc             	pushl  -0x34(%ebp)
c0105205:	e8 e1 5f 00 00       	call   c010b1eb <Memset>
c010520a:	83 c4 10             	add    $0x10,%esp
c010520d:	83 ec 04             	sub    $0x4,%esp
c0105210:	6a 0c                	push   $0xc
c0105212:	6a 00                	push   $0x0
c0105214:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c010521a:	50                   	push   %eax
c010521b:	e8 cb 5f 00 00       	call   c010b1eb <Memset>
c0105220:	83 c4 10             	add    $0x10,%esp
c0105223:	8b 45 08             	mov    0x8(%ebp),%eax
c0105226:	8b 40 44             	mov    0x44(%eax),%eax
c0105229:	89 45 c8             	mov    %eax,-0x38(%ebp)
c010522c:	8b 45 08             	mov    0x8(%ebp),%eax
c010522f:	8b 40 40             	mov    0x40(%eax),%eax
c0105232:	83 ec 08             	sub    $0x8,%esp
c0105235:	50                   	push   %eax
c0105236:	ff 75 c8             	pushl  -0x38(%ebp)
c0105239:	e8 de 0a 00 00       	call   c0105d1c <alloc_virtual_memory>
c010523e:	83 c4 10             	add    $0x10,%esp
c0105241:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0105244:	8b 45 08             	mov    0x8(%ebp),%eax
c0105247:	8b 40 40             	mov    0x40(%eax),%eax
c010524a:	89 c2                	mov    %eax,%edx
c010524c:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c010524f:	83 ec 04             	sub    $0x4,%esp
c0105252:	52                   	push   %edx
c0105253:	50                   	push   %eax
c0105254:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c010525a:	50                   	push   %eax
c010525b:	e8 29 19 00 00       	call   c0106b89 <Memcpy>
c0105260:	83 c4 10             	add    $0x10,%esp
c0105263:	8b 45 08             	mov    0x8(%ebp),%eax
c0105266:	8b 40 40             	mov    0x40(%eax),%eax
c0105269:	c6 84 05 4a ff ff ff 	movb   $0x0,-0xb6(%ebp,%eax,1)
c0105270:	00 
c0105271:	83 ec 08             	sub    $0x8,%esp
c0105274:	6a 00                	push   $0x0
c0105276:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c010527c:	50                   	push   %eax
c010527d:	e8 7a f7 ff ff       	call   c01049fc <open>
c0105282:	83 c4 10             	add    $0x10,%esp
c0105285:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0105288:	83 7d c0 ff          	cmpl   $0xffffffff,-0x40(%ebp)
c010528c:	75 15                	jne    c01052a3 <do_exec+0x107>
c010528e:	83 ec 0c             	sub    $0xc,%esp
c0105291:	68 01 a7 10 c0       	push   $0xc010a701
c0105296:	e8 c0 2f 00 00       	call   c010825b <Printf>
c010529b:	83 c4 10             	add    $0x10,%esp
c010529e:	e9 10 03 00 00       	jmp    c01055b3 <do_exec+0x417>
c01052a3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01052aa:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01052ad:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01052b0:	01 d0                	add    %edx,%eax
c01052b2:	83 ec 04             	sub    $0x4,%esp
c01052b5:	68 00 10 00 00       	push   $0x1000
c01052ba:	50                   	push   %eax
c01052bb:	ff 75 c0             	pushl  -0x40(%ebp)
c01052be:	e8 ce f7 ff ff       	call   c0104a91 <read>
c01052c3:	83 c4 10             	add    $0x10,%esp
c01052c6:	89 45 bc             	mov    %eax,-0x44(%ebp)
c01052c9:	8b 45 bc             	mov    -0x44(%ebp),%eax
c01052cc:	01 45 f4             	add    %eax,-0xc(%ebp)
c01052cf:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
c01052d3:	74 0a                	je     c01052df <do_exec+0x143>
c01052d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01052d8:	3b 45 d0             	cmp    -0x30(%ebp),%eax
c01052db:	7d 05                	jge    c01052e2 <do_exec+0x146>
c01052dd:	eb cb                	jmp    c01052aa <do_exec+0x10e>
c01052df:	90                   	nop
c01052e0:	eb 01                	jmp    c01052e3 <do_exec+0x147>
c01052e2:	90                   	nop
c01052e3:	83 ec 0c             	sub    $0xc,%esp
c01052e6:	ff 75 c0             	pushl  -0x40(%ebp)
c01052e9:	e8 a9 f9 ff ff       	call   c0104c97 <close>
c01052ee:	83 c4 10             	add    $0x10,%esp
c01052f1:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01052f4:	89 45 b8             	mov    %eax,-0x48(%ebp)
c01052f7:	8b 45 b8             	mov    -0x48(%ebp),%eax
c01052fa:	8b 40 18             	mov    0x18(%eax),%eax
c01052fd:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0105300:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0105307:	e9 04 01 00 00       	jmp    c0105410 <do_exec+0x274>
c010530c:	8b 45 b8             	mov    -0x48(%ebp),%eax
c010530f:	0f b7 40 28          	movzwl 0x28(%eax),%eax
c0105313:	0f b7 d0             	movzwl %ax,%edx
c0105316:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0105319:	0f b7 40 2a          	movzwl 0x2a(%eax),%eax
c010531d:	0f b7 c0             	movzwl %ax,%eax
c0105320:	0f af 45 f0          	imul   -0x10(%ebp),%eax
c0105324:	01 c2                	add    %eax,%edx
c0105326:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0105329:	01 d0                	add    %edx,%eax
c010532b:	89 45 b0             	mov    %eax,-0x50(%ebp)
c010532e:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0105331:	8b 40 10             	mov    0x10(%eax),%eax
c0105334:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0105337:	8b 45 ac             	mov    -0x54(%ebp),%eax
c010533a:	05 ff 0f 00 00       	add    $0xfff,%eax
c010533f:	c1 e8 0c             	shr    $0xc,%eax
c0105342:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0105345:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0105348:	8b 40 08             	mov    0x8(%eax),%eax
c010534b:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c010534e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0105355:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0105358:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c010535b:	89 45 a0             	mov    %eax,-0x60(%ebp)
c010535e:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0105361:	8b 50 04             	mov    0x4(%eax),%edx
c0105364:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0105367:	01 d0                	add    %edx,%eax
c0105369:	89 45 9c             	mov    %eax,-0x64(%ebp)
c010536c:	83 7d ac 00          	cmpl   $0x0,-0x54(%ebp)
c0105370:	0f 84 95 00 00 00    	je     c010540b <do_exec+0x26f>
c0105376:	83 ec 04             	sub    $0x4,%esp
c0105379:	ff 75 d4             	pushl  -0x2c(%ebp)
c010537c:	ff 75 a8             	pushl  -0x58(%ebp)
c010537f:	ff 75 a4             	pushl  -0x5c(%ebp)
c0105382:	e8 a0 07 00 00       	call   c0105b27 <get_virtual_address_start_with_addr>
c0105387:	83 c4 10             	add    $0x10,%esp
c010538a:	89 45 98             	mov    %eax,-0x68(%ebp)
c010538d:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0105390:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105393:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c010539a:	eb 41                	jmp    c01053dd <do_exec+0x241>
c010539c:	83 ec 08             	sub    $0x8,%esp
c010539f:	ff 75 d4             	pushl  -0x2c(%ebp)
c01053a2:	ff 75 e8             	pushl  -0x18(%ebp)
c01053a5:	e8 f3 0a 00 00       	call   c0105e9d <alloc_physical_memory_of_proc>
c01053aa:	83 c4 10             	add    $0x10,%esp
c01053ad:	89 45 94             	mov    %eax,-0x6c(%ebp)
c01053b0:	83 ec 08             	sub    $0x8,%esp
c01053b3:	68 00 10 00 00       	push   $0x1000
c01053b8:	ff 75 94             	pushl  -0x6c(%ebp)
c01053bb:	e8 5c 09 00 00       	call   c0105d1c <alloc_virtual_memory>
c01053c0:	83 c4 10             	add    $0x10,%esp
c01053c3:	89 45 90             	mov    %eax,-0x70(%ebp)
c01053c6:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c01053ca:	75 06                	jne    c01053d2 <do_exec+0x236>
c01053cc:	8b 45 90             	mov    -0x70(%ebp),%eax
c01053cf:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01053d2:	81 45 e8 00 10 00 00 	addl   $0x1000,-0x18(%ebp)
c01053d9:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c01053dd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01053e0:	39 45 a8             	cmp    %eax,-0x58(%ebp)
c01053e3:	77 b7                	ja     c010539c <do_exec+0x200>
c01053e5:	8b 45 b0             	mov    -0x50(%ebp),%eax
c01053e8:	8b 40 10             	mov    0x10(%eax),%eax
c01053eb:	89 c1                	mov    %eax,%ecx
c01053ed:	8b 45 b0             	mov    -0x50(%ebp),%eax
c01053f0:	8b 50 04             	mov    0x4(%eax),%edx
c01053f3:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01053f6:	01 c2                	add    %eax,%edx
c01053f8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01053fb:	83 ec 04             	sub    $0x4,%esp
c01053fe:	51                   	push   %ecx
c01053ff:	52                   	push   %edx
c0105400:	50                   	push   %eax
c0105401:	e8 83 17 00 00       	call   c0106b89 <Memcpy>
c0105406:	83 c4 10             	add    $0x10,%esp
c0105409:	eb 01                	jmp    c010540c <do_exec+0x270>
c010540b:	90                   	nop
c010540c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0105410:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0105413:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
c0105417:	0f b7 c0             	movzwl %ax,%eax
c010541a:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c010541d:	0f 8c e9 fe ff ff    	jl     c010530c <do_exec+0x170>
c0105423:	8b 45 08             	mov    0x8(%ebp),%eax
c0105426:	8b 40 10             	mov    0x10(%eax),%eax
c0105429:	89 45 8c             	mov    %eax,-0x74(%ebp)
c010542c:	8b 45 08             	mov    0x8(%ebp),%eax
c010542f:	8b 40 1c             	mov    0x1c(%eax),%eax
c0105432:	89 45 88             	mov    %eax,-0x78(%ebp)
c0105435:	8b 45 08             	mov    0x8(%ebp),%eax
c0105438:	8b 40 24             	mov    0x24(%eax),%eax
c010543b:	89 45 84             	mov    %eax,-0x7c(%ebp)
c010543e:	83 ec 0c             	sub    $0xc,%esp
c0105441:	ff 75 d4             	pushl  -0x2c(%ebp)
c0105444:	e8 9d e2 ff ff       	call   c01036e6 <pid2proc>
c0105449:	83 c4 10             	add    $0x10,%esp
c010544c:	89 45 80             	mov    %eax,-0x80(%ebp)
c010544f:	8b 45 08             	mov    0x8(%ebp),%eax
c0105452:	8b 40 10             	mov    0x10(%eax),%eax
c0105455:	89 85 7c ff ff ff    	mov    %eax,-0x84(%ebp)
c010545b:	83 ec 08             	sub    $0x8,%esp
c010545e:	ff 75 88             	pushl  -0x78(%ebp)
c0105461:	ff b5 7c ff ff ff    	pushl  -0x84(%ebp)
c0105467:	e8 b0 08 00 00       	call   c0105d1c <alloc_virtual_memory>
c010546c:	83 c4 10             	add    $0x10,%esp
c010546f:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0105475:	8b 45 08             	mov    0x8(%ebp),%eax
c0105478:	8b 40 2c             	mov    0x2c(%eax),%eax
c010547b:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
c0105481:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0105488:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c010548e:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105491:	eb 1a                	jmp    c01054ad <do_exec+0x311>
c0105493:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0105497:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010549a:	8b 10                	mov    (%eax),%edx
c010549c:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c01054a2:	01 c2                	add    %eax,%edx
c01054a4:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01054a7:	89 10                	mov    %edx,(%eax)
c01054a9:	83 45 dc 04          	addl   $0x4,-0x24(%ebp)
c01054ad:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01054b0:	8b 00                	mov    (%eax),%eax
c01054b2:	85 c0                	test   %eax,%eax
c01054b4:	75 dd                	jne    c0105493 <do_exec+0x2f7>
c01054b6:	83 ec 0c             	sub    $0xc,%esp
c01054b9:	ff 75 84             	pushl  -0x7c(%ebp)
c01054bc:	e8 5b 08 00 00       	call   c0105d1c <alloc_virtual_memory>
c01054c1:	83 c4 10             	add    $0x10,%esp
c01054c4:	89 85 70 ff ff ff    	mov    %eax,-0x90(%ebp)
c01054ca:	8b 95 78 ff ff ff    	mov    -0x88(%ebp),%edx
c01054d0:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
c01054d6:	83 ec 04             	sub    $0x4,%esp
c01054d9:	ff 75 88             	pushl  -0x78(%ebp)
c01054dc:	52                   	push   %edx
c01054dd:	50                   	push   %eax
c01054de:	e8 a6 16 00 00       	call   c0106b89 <Memcpy>
c01054e3:	83 c4 10             	add    $0x10,%esp
c01054e6:	8b 45 08             	mov    0x8(%ebp),%eax
c01054e9:	8b 40 28             	mov    0x28(%eax),%eax
c01054ec:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c01054f2:	83 ec 08             	sub    $0x8,%esp
c01054f5:	ff 75 d4             	pushl  -0x2c(%ebp)
c01054f8:	ff 75 80             	pushl  -0x80(%ebp)
c01054fb:	e8 ef 08 00 00       	call   c0105def <get_physical_address_proc>
c0105500:	83 c4 10             	add    $0x10,%esp
c0105503:	89 85 68 ff ff ff    	mov    %eax,-0x98(%ebp)
c0105509:	83 ec 08             	sub    $0x8,%esp
c010550c:	68 00 10 00 00       	push   $0x1000
c0105511:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
c0105517:	e8 00 08 00 00       	call   c0105d1c <alloc_virtual_memory>
c010551c:	83 c4 10             	add    $0x10,%esp
c010551f:	89 85 64 ff ff ff    	mov    %eax,-0x9c(%ebp)
c0105525:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
c010552b:	05 bc 0f 00 00       	add    $0xfbc,%eax
c0105530:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
c0105536:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c010553c:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0105542:	89 50 20             	mov    %edx,0x20(%eax)
c0105545:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0105548:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c010554e:	89 50 28             	mov    %edx,0x28(%eax)
c0105551:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0105554:	8b 40 18             	mov    0x18(%eax),%eax
c0105557:	89 c2                	mov    %eax,%edx
c0105559:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c010555f:	89 50 30             	mov    %edx,0x30(%eax)
c0105562:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c0105568:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c010556e:	89 50 3c             	mov    %edx,0x3c(%eax)
c0105571:	8b 45 80             	mov    -0x80(%ebp),%eax
c0105574:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c010557b:	00 00 00 
c010557e:	c7 85 44 ff ff ff 65 	movl   $0x65,-0xbc(%ebp)
c0105585:	00 00 00 
c0105588:	c7 85 24 ff ff ff 00 	movl   $0x0,-0xdc(%ebp)
c010558f:	00 00 00 
c0105592:	c7 85 28 ff ff ff 00 	movl   $0x0,-0xd8(%ebp)
c0105599:	00 00 00 
c010559c:	83 ec 04             	sub    $0x4,%esp
c010559f:	ff 75 d4             	pushl  -0x2c(%ebp)
c01055a2:	8d 85 cc fe ff ff    	lea    -0x134(%ebp),%eax
c01055a8:	50                   	push   %eax
c01055a9:	6a 01                	push   $0x1
c01055ab:	e8 78 3c 00 00       	call   c0109228 <send_rec>
c01055b0:	83 c4 10             	add    $0x10,%esp
c01055b3:	c9                   	leave  
c01055b4:	c3                   	ret    

c01055b5 <do_fork>:
c01055b5:	55                   	push   %ebp
c01055b6:	89 e5                	mov    %esp,%ebp
c01055b8:	81 ec 98 00 00 00    	sub    $0x98,%esp
c01055be:	8b 45 08             	mov    0x8(%ebp),%eax
c01055c1:	8b 00                	mov    (%eax),%eax
c01055c3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01055c6:	83 ec 0c             	sub    $0xc,%esp
c01055c9:	ff 75 f4             	pushl  -0xc(%ebp)
c01055cc:	e8 52 45 00 00       	call   c0109b23 <fork_process>
c01055d1:	83 c4 10             	add    $0x10,%esp
c01055d4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01055d7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01055da:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c01055e0:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01055e3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01055e6:	8b 90 14 01 00 00    	mov    0x114(%eax),%edx
c01055ec:	8b 45 08             	mov    0x8(%ebp),%eax
c01055ef:	89 50 5c             	mov    %edx,0x5c(%eax)
c01055f2:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c01055f9:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0105600:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0105607:	83 ec 04             	sub    $0x4,%esp
c010560a:	ff 75 ec             	pushl  -0x14(%ebp)
c010560d:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
c0105613:	50                   	push   %eax
c0105614:	6a 01                	push   $0x1
c0105616:	e8 0d 3c 00 00       	call   c0109228 <send_rec>
c010561b:	83 c4 10             	add    $0x10,%esp
c010561e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105621:	c9                   	leave  
c0105622:	c3                   	ret    

c0105623 <do_exit>:
c0105623:	55                   	push   %ebp
c0105624:	89 e5                	mov    %esp,%ebp
c0105626:	83 ec 18             	sub    $0x18,%esp
c0105629:	8b 45 08             	mov    0x8(%ebp),%eax
c010562c:	8b 00                	mov    (%eax),%eax
c010562e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105631:	83 ec 0c             	sub    $0xc,%esp
c0105634:	ff 75 f4             	pushl  -0xc(%ebp)
c0105637:	e8 aa e0 ff ff       	call   c01036e6 <pid2proc>
c010563c:	83 c4 10             	add    $0x10,%esp
c010563f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105642:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105645:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c010564b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010564e:	83 ec 0c             	sub    $0xc,%esp
c0105651:	ff 75 ec             	pushl  -0x14(%ebp)
c0105654:	e8 8d e0 ff ff       	call   c01036e6 <pid2proc>
c0105659:	83 c4 10             	add    $0x10,%esp
c010565c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010565f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0105663:	74 45                	je     c01056aa <do_exit+0x87>
c0105665:	8b 45 08             	mov    0x8(%ebp),%eax
c0105668:	8b 40 54             	mov    0x54(%eax),%eax
c010566b:	89 c2                	mov    %eax,%edx
c010566d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105670:	89 90 5c 02 00 00    	mov    %edx,0x25c(%eax)
c0105676:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105679:	0f b6 80 3d 02 00 00 	movzbl 0x23d(%eax),%eax
c0105680:	3c 04                	cmp    $0x4,%al
c0105682:	75 1a                	jne    c010569e <do_exit+0x7b>
c0105684:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105687:	c6 80 3d 02 00 00 fb 	movb   $0xfb,0x23d(%eax)
c010568e:	83 ec 0c             	sub    $0xc,%esp
c0105691:	ff 75 f0             	pushl  -0x10(%ebp)
c0105694:	e8 33 01 00 00       	call   c01057cc <cleanup>
c0105699:	83 c4 10             	add    $0x10,%esp
c010569c:	eb 0d                	jmp    c01056ab <do_exit+0x88>
c010569e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01056a1:	c6 80 3c 02 00 00 03 	movb   $0x3,0x23c(%eax)
c01056a8:	eb 01                	jmp    c01056ab <do_exit+0x88>
c01056aa:	90                   	nop
c01056ab:	c9                   	leave  
c01056ac:	c3                   	ret    

c01056ad <do_wait>:
c01056ad:	55                   	push   %ebp
c01056ae:	89 e5                	mov    %esp,%ebp
c01056b0:	81 ec a8 00 00 00    	sub    $0xa8,%esp
c01056b6:	8b 45 08             	mov    0x8(%ebp),%eax
c01056b9:	8b 00                	mov    (%eax),%eax
c01056bb:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01056be:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01056c5:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01056cc:	83 ec 0c             	sub    $0xc,%esp
c01056cf:	ff 75 ec             	pushl  -0x14(%ebp)
c01056d2:	e8 0f e0 ff ff       	call   c01036e6 <pid2proc>
c01056d7:	83 c4 10             	add    $0x10,%esp
c01056da:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01056dd:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c01056e1:	75 19                	jne    c01056fc <do_wait+0x4f>
c01056e3:	6a 58                	push   $0x58
c01056e5:	68 11 a7 10 c0       	push   $0xc010a711
c01056ea:	68 11 a7 10 c0       	push   $0xc010a711
c01056ef:	68 1f a7 10 c0       	push   $0xc010a71f
c01056f4:	e8 bf 2e 00 00       	call   c01085b8 <assertion_failure>
c01056f9:	83 c4 10             	add    $0x10,%esp
c01056fc:	a1 ec fd 10 c0       	mov    0xc010fdec,%eax
c0105701:	8b 15 f0 fd 10 c0    	mov    0xc010fdf0,%edx
c0105707:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010570a:	89 55 e0             	mov    %edx,-0x20(%ebp)
c010570d:	a1 f4 fd 10 c0       	mov    0xc010fdf4,%eax
c0105712:	8b 15 f8 fd 10 c0    	mov    0xc010fdf8,%edx
c0105718:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010571b:	89 55 d8             	mov    %edx,-0x28(%ebp)
c010571e:	a1 f0 fd 10 c0       	mov    0xc010fdf0,%eax
c0105723:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105726:	eb 5b                	jmp    c0105783 <do_wait+0xd6>
c0105728:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010572b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105730:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105733:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105736:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c010573c:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c010573f:	74 0b                	je     c010574c <do_wait+0x9f>
c0105741:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105744:	8b 40 04             	mov    0x4(%eax),%eax
c0105747:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010574a:	eb 37                	jmp    c0105783 <do_wait+0xd6>
c010574c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0105750:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105753:	0f b6 80 3d 02 00 00 	movzbl 0x23d(%eax),%eax
c010575a:	3c 03                	cmp    $0x3,%al
c010575c:	74 0b                	je     c0105769 <do_wait+0xbc>
c010575e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105761:	8b 40 04             	mov    0x4(%eax),%eax
c0105764:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105767:	eb 1a                	jmp    c0105783 <do_wait+0xd6>
c0105769:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010576c:	c6 80 3d 02 00 00 fb 	movb   $0xfb,0x23d(%eax)
c0105773:	83 ec 0c             	sub    $0xc,%esp
c0105776:	ff 75 e8             	pushl  -0x18(%ebp)
c0105779:	e8 4e 00 00 00       	call   c01057cc <cleanup>
c010577e:	83 c4 10             	add    $0x10,%esp
c0105781:	eb 47                	jmp    c01057ca <do_wait+0x11d>
c0105783:	81 7d f0 f4 fd 10 c0 	cmpl   $0xc010fdf4,-0x10(%ebp)
c010578a:	75 9c                	jne    c0105728 <do_wait+0x7b>
c010578c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0105790:	74 0c                	je     c010579e <do_wait+0xf1>
c0105792:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105795:	c6 80 3d 02 00 00 04 	movb   $0x4,0x23d(%eax)
c010579c:	eb 2c                	jmp    c01057ca <do_wait+0x11d>
c010579e:	c7 45 d0 65 00 00 00 	movl   $0x65,-0x30(%ebp)
c01057a5:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
c01057ac:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
c01057b3:	83 ec 04             	sub    $0x4,%esp
c01057b6:	ff 75 ec             	pushl  -0x14(%ebp)
c01057b9:	8d 85 58 ff ff ff    	lea    -0xa8(%ebp),%eax
c01057bf:	50                   	push   %eax
c01057c0:	6a 01                	push   $0x1
c01057c2:	e8 61 3a 00 00       	call   c0109228 <send_rec>
c01057c7:	83 c4 10             	add    $0x10,%esp
c01057ca:	c9                   	leave  
c01057cb:	c3                   	ret    

c01057cc <cleanup>:
c01057cc:	55                   	push   %ebp
c01057cd:	89 e5                	mov    %esp,%ebp
c01057cf:	81 ec 88 00 00 00    	sub    $0x88,%esp
c01057d5:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c01057dc:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c01057e3:	8b 45 08             	mov    0x8(%ebp),%eax
c01057e6:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c01057ec:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01057ef:	8b 45 08             	mov    0x8(%ebp),%eax
c01057f2:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c01057f8:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01057fb:	8b 45 08             	mov    0x8(%ebp),%eax
c01057fe:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0105804:	83 ec 04             	sub    $0x4,%esp
c0105807:	50                   	push   %eax
c0105808:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c010580e:	50                   	push   %eax
c010580f:	6a 01                	push   $0x1
c0105811:	e8 12 3a 00 00       	call   c0109228 <send_rec>
c0105816:	83 c4 10             	add    $0x10,%esp
c0105819:	8b 45 08             	mov    0x8(%ebp),%eax
c010581c:	c6 80 3c 02 00 00 ff 	movb   $0xff,0x23c(%eax)
c0105823:	90                   	nop
c0105824:	c9                   	leave  
c0105825:	c3                   	ret    

c0105826 <init_bitmap>:
c0105826:	55                   	push   %ebp
c0105827:	89 e5                	mov    %esp,%ebp
c0105829:	83 ec 08             	sub    $0x8,%esp
c010582c:	8b 45 08             	mov    0x8(%ebp),%eax
c010582f:	8b 50 04             	mov    0x4(%eax),%edx
c0105832:	8b 45 08             	mov    0x8(%ebp),%eax
c0105835:	8b 00                	mov    (%eax),%eax
c0105837:	83 ec 04             	sub    $0x4,%esp
c010583a:	52                   	push   %edx
c010583b:	6a 00                	push   $0x0
c010583d:	50                   	push   %eax
c010583e:	e8 a8 59 00 00       	call   c010b1eb <Memset>
c0105843:	83 c4 10             	add    $0x10,%esp
c0105846:	90                   	nop
c0105847:	c9                   	leave  
c0105848:	c3                   	ret    

c0105849 <test_bit_val>:
c0105849:	55                   	push   %ebp
c010584a:	89 e5                	mov    %esp,%ebp
c010584c:	53                   	push   %ebx
c010584d:	83 ec 10             	sub    $0x10,%esp
c0105850:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105853:	8d 50 07             	lea    0x7(%eax),%edx
c0105856:	85 c0                	test   %eax,%eax
c0105858:	0f 48 c2             	cmovs  %edx,%eax
c010585b:	c1 f8 03             	sar    $0x3,%eax
c010585e:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105861:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105864:	99                   	cltd   
c0105865:	c1 ea 1d             	shr    $0x1d,%edx
c0105868:	01 d0                	add    %edx,%eax
c010586a:	83 e0 07             	and    $0x7,%eax
c010586d:	29 d0                	sub    %edx,%eax
c010586f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105872:	8b 45 08             	mov    0x8(%ebp),%eax
c0105875:	8b 10                	mov    (%eax),%edx
c0105877:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010587a:	01 d0                	add    %edx,%eax
c010587c:	0f b6 00             	movzbl (%eax),%eax
c010587f:	88 45 f3             	mov    %al,-0xd(%ebp)
c0105882:	0f be 55 f3          	movsbl -0xd(%ebp),%edx
c0105886:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105889:	bb 01 00 00 00       	mov    $0x1,%ebx
c010588e:	89 c1                	mov    %eax,%ecx
c0105890:	d3 e3                	shl    %cl,%ebx
c0105892:	89 d8                	mov    %ebx,%eax
c0105894:	21 c2                	and    %eax,%edx
c0105896:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105899:	89 c1                	mov    %eax,%ecx
c010589b:	d3 fa                	sar    %cl,%edx
c010589d:	89 d0                	mov    %edx,%eax
c010589f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01058a2:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c01058a6:	0f 9f c0             	setg   %al
c01058a9:	0f b6 c0             	movzbl %al,%eax
c01058ac:	83 c4 10             	add    $0x10,%esp
c01058af:	5b                   	pop    %ebx
c01058b0:	5d                   	pop    %ebp
c01058b1:	c3                   	ret    

c01058b2 <set_bit_val>:
c01058b2:	55                   	push   %ebp
c01058b3:	89 e5                	mov    %esp,%ebp
c01058b5:	83 ec 10             	sub    $0x10,%esp
c01058b8:	8b 45 0c             	mov    0xc(%ebp),%eax
c01058bb:	8d 50 07             	lea    0x7(%eax),%edx
c01058be:	85 c0                	test   %eax,%eax
c01058c0:	0f 48 c2             	cmovs  %edx,%eax
c01058c3:	c1 f8 03             	sar    $0x3,%eax
c01058c6:	89 45 f8             	mov    %eax,-0x8(%ebp)
c01058c9:	8b 45 0c             	mov    0xc(%ebp),%eax
c01058cc:	99                   	cltd   
c01058cd:	c1 ea 1d             	shr    $0x1d,%edx
c01058d0:	01 d0                	add    %edx,%eax
c01058d2:	83 e0 07             	and    $0x7,%eax
c01058d5:	29 d0                	sub    %edx,%eax
c01058d7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01058da:	8b 45 08             	mov    0x8(%ebp),%eax
c01058dd:	8b 10                	mov    (%eax),%edx
c01058df:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01058e2:	01 d0                	add    %edx,%eax
c01058e4:	0f b6 00             	movzbl (%eax),%eax
c01058e7:	88 45 ff             	mov    %al,-0x1(%ebp)
c01058ea:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c01058ee:	7e 13                	jle    c0105903 <set_bit_val+0x51>
c01058f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01058f3:	ba 01 00 00 00       	mov    $0x1,%edx
c01058f8:	89 c1                	mov    %eax,%ecx
c01058fa:	d3 e2                	shl    %cl,%edx
c01058fc:	89 d0                	mov    %edx,%eax
c01058fe:	08 45 ff             	or     %al,-0x1(%ebp)
c0105901:	eb 13                	jmp    c0105916 <set_bit_val+0x64>
c0105903:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105906:	ba 01 00 00 00       	mov    $0x1,%edx
c010590b:	89 c1                	mov    %eax,%ecx
c010590d:	d3 e2                	shl    %cl,%edx
c010590f:	89 d0                	mov    %edx,%eax
c0105911:	f7 d0                	not    %eax
c0105913:	20 45 ff             	and    %al,-0x1(%ebp)
c0105916:	8b 45 08             	mov    0x8(%ebp),%eax
c0105919:	8b 10                	mov    (%eax),%edx
c010591b:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010591e:	01 c2                	add    %eax,%edx
c0105920:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
c0105924:	88 02                	mov    %al,(%edx)
c0105926:	b8 01 00 00 00       	mov    $0x1,%eax
c010592b:	c9                   	leave  
c010592c:	c3                   	ret    

c010592d <set_bits>:
c010592d:	55                   	push   %ebp
c010592e:	89 e5                	mov    %esp,%ebp
c0105930:	83 ec 10             	sub    $0x10,%esp
c0105933:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c010593a:	eb 1c                	jmp    c0105958 <set_bits+0x2b>
c010593c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010593f:	8d 50 01             	lea    0x1(%eax),%edx
c0105942:	89 55 0c             	mov    %edx,0xc(%ebp)
c0105945:	ff 75 10             	pushl  0x10(%ebp)
c0105948:	50                   	push   %eax
c0105949:	ff 75 08             	pushl  0x8(%ebp)
c010594c:	e8 61 ff ff ff       	call   c01058b2 <set_bit_val>
c0105951:	83 c4 0c             	add    $0xc,%esp
c0105954:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0105958:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010595b:	3b 45 14             	cmp    0x14(%ebp),%eax
c010595e:	7c dc                	jl     c010593c <set_bits+0xf>
c0105960:	b8 01 00 00 00       	mov    $0x1,%eax
c0105965:	c9                   	leave  
c0105966:	c3                   	ret    

c0105967 <get_first_free_bit>:
c0105967:	55                   	push   %ebp
c0105968:	89 e5                	mov    %esp,%ebp
c010596a:	83 ec 10             	sub    $0x10,%esp
c010596d:	8b 45 08             	mov    0x8(%ebp),%eax
c0105970:	8b 40 04             	mov    0x4(%eax),%eax
c0105973:	c1 e0 03             	shl    $0x3,%eax
c0105976:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105979:	8b 45 0c             	mov    0xc(%ebp),%eax
c010597c:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010597f:	eb 1b                	jmp    c010599c <get_first_free_bit+0x35>
c0105981:	ff 75 fc             	pushl  -0x4(%ebp)
c0105984:	ff 75 08             	pushl  0x8(%ebp)
c0105987:	e8 bd fe ff ff       	call   c0105849 <test_bit_val>
c010598c:	83 c4 08             	add    $0x8,%esp
c010598f:	85 c0                	test   %eax,%eax
c0105991:	75 05                	jne    c0105998 <get_first_free_bit+0x31>
c0105993:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105996:	eb 11                	jmp    c01059a9 <get_first_free_bit+0x42>
c0105998:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c010599c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010599f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c01059a2:	7c dd                	jl     c0105981 <get_first_free_bit+0x1a>
c01059a4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01059a9:	c9                   	leave  
c01059aa:	c3                   	ret    

c01059ab <get_bits>:
c01059ab:	55                   	push   %ebp
c01059ac:	89 e5                	mov    %esp,%ebp
c01059ae:	83 ec 20             	sub    $0x20,%esp
c01059b1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01059b8:	ff 75 f0             	pushl  -0x10(%ebp)
c01059bb:	ff 75 08             	pushl  0x8(%ebp)
c01059be:	e8 a4 ff ff ff       	call   c0105967 <get_first_free_bit>
c01059c3:	83 c4 08             	add    $0x8,%esp
c01059c6:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01059c9:	8b 45 08             	mov    0x8(%ebp),%eax
c01059cc:	8b 40 04             	mov    0x4(%eax),%eax
c01059cf:	c1 e0 03             	shl    $0x3,%eax
c01059d2:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01059d5:	8b 45 0c             	mov    0xc(%ebp),%eax
c01059d8:	83 e8 01             	sub    $0x1,%eax
c01059db:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01059de:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c01059e2:	75 08                	jne    c01059ec <get_bits+0x41>
c01059e4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01059e7:	e9 85 00 00 00       	jmp    c0105a71 <get_bits+0xc6>
c01059ec:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01059ef:	83 c0 01             	add    $0x1,%eax
c01059f2:	89 45 f8             	mov    %eax,-0x8(%ebp)
c01059f5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01059f8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01059fb:	eb 58                	jmp    c0105a55 <get_bits+0xaa>
c01059fd:	ff 75 f8             	pushl  -0x8(%ebp)
c0105a00:	ff 75 08             	pushl  0x8(%ebp)
c0105a03:	e8 41 fe ff ff       	call   c0105849 <test_bit_val>
c0105a08:	83 c4 08             	add    $0x8,%esp
c0105a0b:	85 c0                	test   %eax,%eax
c0105a0d:	75 0a                	jne    c0105a19 <get_bits+0x6e>
c0105a0f:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0105a13:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0105a17:	eb 2b                	jmp    c0105a44 <get_bits+0x99>
c0105a19:	6a 00                	push   $0x0
c0105a1b:	ff 75 08             	pushl  0x8(%ebp)
c0105a1e:	e8 44 ff ff ff       	call   c0105967 <get_first_free_bit>
c0105a23:	83 c4 08             	add    $0x8,%esp
c0105a26:	83 c0 01             	add    $0x1,%eax
c0105a29:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105a2c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105a2f:	83 c0 01             	add    $0x1,%eax
c0105a32:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105a35:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105a38:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105a3b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105a3e:	83 e8 01             	sub    $0x1,%eax
c0105a41:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105a44:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105a47:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c0105a4a:	7c 09                	jl     c0105a55 <get_bits+0xaa>
c0105a4c:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c0105a53:	eb 0d                	jmp    c0105a62 <get_bits+0xb7>
c0105a55:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105a58:	8d 50 ff             	lea    -0x1(%eax),%edx
c0105a5b:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0105a5e:	85 c0                	test   %eax,%eax
c0105a60:	7f 9b                	jg     c01059fd <get_bits+0x52>
c0105a62:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105a65:	2b 45 0c             	sub    0xc(%ebp),%eax
c0105a68:	83 c0 01             	add    $0x1,%eax
c0105a6b:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105a6e:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105a71:	c9                   	leave  
c0105a72:	c3                   	ret    

c0105a73 <get_a_page>:
c0105a73:	55                   	push   %ebp
c0105a74:	89 e5                	mov    %esp,%ebp
c0105a76:	83 ec 28             	sub    $0x28,%esp
c0105a79:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0105a7d:	75 22                	jne    c0105aa1 <get_a_page+0x2e>
c0105a7f:	a1 ac 06 11 c0       	mov    0xc01106ac,%eax
c0105a84:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105a87:	a1 b0 06 11 c0       	mov    0xc01106b0,%eax
c0105a8c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105a8f:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0105a94:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105a97:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c0105a9c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105a9f:	eb 20                	jmp    c0105ac1 <get_a_page+0x4e>
c0105aa1:	a1 f4 0e 11 c0       	mov    0xc0110ef4,%eax
c0105aa6:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105aa9:	a1 f8 0e 11 c0       	mov    0xc0110ef8,%eax
c0105aae:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105ab1:	a1 fc 0e 11 c0       	mov    0xc0110efc,%eax
c0105ab6:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105ab9:	a1 00 0f 11 c0       	mov    0xc0110f00,%eax
c0105abe:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105ac1:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105ac4:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0105ac7:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105aca:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0105acd:	6a 01                	push   $0x1
c0105acf:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105ad2:	50                   	push   %eax
c0105ad3:	e8 d3 fe ff ff       	call   c01059ab <get_bits>
c0105ad8:	83 c4 08             	add    $0x8,%esp
c0105adb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105ade:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c0105ae2:	75 1c                	jne    c0105b00 <get_a_page+0x8d>
c0105ae4:	68 84 00 00 00       	push   $0x84
c0105ae9:	68 32 a7 10 c0       	push   $0xc010a732
c0105aee:	68 32 a7 10 c0       	push   $0xc010a732
c0105af3:	68 3c a7 10 c0       	push   $0xc010a73c
c0105af8:	e8 bb 2a 00 00       	call   c01085b8 <assertion_failure>
c0105afd:	83 c4 10             	add    $0x10,%esp
c0105b00:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105b03:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0105b06:	c1 e2 0c             	shl    $0xc,%edx
c0105b09:	01 d0                	add    %edx,%eax
c0105b0b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105b0e:	83 ec 04             	sub    $0x4,%esp
c0105b11:	6a 01                	push   $0x1
c0105b13:	ff 75 f4             	pushl  -0xc(%ebp)
c0105b16:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105b19:	50                   	push   %eax
c0105b1a:	e8 93 fd ff ff       	call   c01058b2 <set_bit_val>
c0105b1f:	83 c4 10             	add    $0x10,%esp
c0105b22:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105b25:	c9                   	leave  
c0105b26:	c3                   	ret    

c0105b27 <get_virtual_address_start_with_addr>:
c0105b27:	55                   	push   %ebp
c0105b28:	89 e5                	mov    %esp,%ebp
c0105b2a:	83 ec 38             	sub    $0x38,%esp
c0105b2d:	e8 71 a8 ff ff       	call   c01003a3 <get_running_thread_pcb>
c0105b32:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105b35:	83 ec 0c             	sub    $0xc,%esp
c0105b38:	ff 75 10             	pushl  0x10(%ebp)
c0105b3b:	e8 a6 db ff ff       	call   c01036e6 <pid2proc>
c0105b40:	83 c4 10             	add    $0x10,%esp
c0105b43:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105b46:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105b49:	8b 40 0c             	mov    0xc(%eax),%eax
c0105b4c:	83 ec 04             	sub    $0x4,%esp
c0105b4f:	6a 0c                	push   $0xc
c0105b51:	50                   	push   %eax
c0105b52:	8d 45 dc             	lea    -0x24(%ebp),%eax
c0105b55:	50                   	push   %eax
c0105b56:	e8 2e 10 00 00       	call   c0106b89 <Memcpy>
c0105b5b:	83 c4 10             	add    $0x10,%esp
c0105b5e:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105b61:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0105b64:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0105b67:	89 55 d8             	mov    %edx,-0x28(%ebp)
c0105b6a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105b6d:	8b 55 08             	mov    0x8(%ebp),%edx
c0105b70:	29 c2                	sub    %eax,%edx
c0105b72:	89 d0                	mov    %edx,%eax
c0105b74:	c1 e8 0c             	shr    $0xc,%eax
c0105b77:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105b7a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0105b7e:	79 1c                	jns    c0105b9c <get_virtual_address_start_with_addr+0x75>
c0105b80:	68 97 00 00 00       	push   $0x97
c0105b85:	68 32 a7 10 c0       	push   $0xc010a732
c0105b8a:	68 32 a7 10 c0       	push   $0xc010a732
c0105b8f:	68 48 a7 10 c0       	push   $0xc010a748
c0105b94:	e8 1f 2a 00 00       	call   c01085b8 <assertion_failure>
c0105b99:	83 c4 10             	add    $0x10,%esp
c0105b9c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105b9f:	50                   	push   %eax
c0105ba0:	6a 01                	push   $0x1
c0105ba2:	ff 75 ec             	pushl  -0x14(%ebp)
c0105ba5:	8d 45 d4             	lea    -0x2c(%ebp),%eax
c0105ba8:	50                   	push   %eax
c0105ba9:	e8 7f fd ff ff       	call   c010592d <set_bits>
c0105bae:	83 c4 10             	add    $0x10,%esp
c0105bb1:	8b 45 08             	mov    0x8(%ebp),%eax
c0105bb4:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105bb9:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105bbc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105bbf:	c9                   	leave  
c0105bc0:	c3                   	ret    

c0105bc1 <get_virtual_address>:
c0105bc1:	55                   	push   %ebp
c0105bc2:	89 e5                	mov    %esp,%ebp
c0105bc4:	83 ec 28             	sub    $0x28,%esp
c0105bc7:	e8 d7 a7 ff ff       	call   c01003a3 <get_running_thread_pcb>
c0105bcc:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105bcf:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0105bd3:	75 1a                	jne    c0105bef <get_virtual_address+0x2e>
c0105bd5:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0105bda:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105bdd:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0105be2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105be5:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c0105bea:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105bed:	eb 18                	jmp    c0105c07 <get_virtual_address+0x46>
c0105bef:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105bf2:	8b 40 0c             	mov    0xc(%eax),%eax
c0105bf5:	83 ec 04             	sub    $0x4,%esp
c0105bf8:	6a 0c                	push   $0xc
c0105bfa:	50                   	push   %eax
c0105bfb:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0105bfe:	50                   	push   %eax
c0105bff:	e8 85 0f 00 00       	call   c0106b89 <Memcpy>
c0105c04:	83 c4 10             	add    $0x10,%esp
c0105c07:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105c0a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0105c0d:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105c10:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0105c13:	8b 45 08             	mov    0x8(%ebp),%eax
c0105c16:	83 ec 08             	sub    $0x8,%esp
c0105c19:	50                   	push   %eax
c0105c1a:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105c1d:	50                   	push   %eax
c0105c1e:	e8 88 fd ff ff       	call   c01059ab <get_bits>
c0105c23:	83 c4 10             	add    $0x10,%esp
c0105c26:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105c29:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105c2c:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0105c2f:	c1 e2 0c             	shl    $0xc,%edx
c0105c32:	01 d0                	add    %edx,%eax
c0105c34:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105c37:	8b 45 08             	mov    0x8(%ebp),%eax
c0105c3a:	50                   	push   %eax
c0105c3b:	6a 01                	push   $0x1
c0105c3d:	ff 75 f0             	pushl  -0x10(%ebp)
c0105c40:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105c43:	50                   	push   %eax
c0105c44:	e8 e4 fc ff ff       	call   c010592d <set_bits>
c0105c49:	83 c4 10             	add    $0x10,%esp
c0105c4c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105c4f:	c9                   	leave  
c0105c50:	c3                   	ret    

c0105c51 <ptr_pde>:
c0105c51:	55                   	push   %ebp
c0105c52:	89 e5                	mov    %esp,%ebp
c0105c54:	8b 45 08             	mov    0x8(%ebp),%eax
c0105c57:	c1 e8 16             	shr    $0x16,%eax
c0105c5a:	05 00 fc ff 3f       	add    $0x3ffffc00,%eax
c0105c5f:	c1 e0 02             	shl    $0x2,%eax
c0105c62:	5d                   	pop    %ebp
c0105c63:	c3                   	ret    

c0105c64 <ptr_pte>:
c0105c64:	55                   	push   %ebp
c0105c65:	89 e5                	mov    %esp,%ebp
c0105c67:	8b 45 08             	mov    0x8(%ebp),%eax
c0105c6a:	c1 e8 0a             	shr    $0xa,%eax
c0105c6d:	25 00 f0 3f 00       	and    $0x3ff000,%eax
c0105c72:	89 c2                	mov    %eax,%edx
c0105c74:	8b 45 08             	mov    0x8(%ebp),%eax
c0105c77:	c1 e8 0c             	shr    $0xc,%eax
c0105c7a:	25 ff 03 00 00       	and    $0x3ff,%eax
c0105c7f:	c1 e0 02             	shl    $0x2,%eax
c0105c82:	01 d0                	add    %edx,%eax
c0105c84:	2d 00 00 40 00       	sub    $0x400000,%eax
c0105c89:	5d                   	pop    %ebp
c0105c8a:	c3                   	ret    

c0105c8b <add_map_entry>:
c0105c8b:	55                   	push   %ebp
c0105c8c:	89 e5                	mov    %esp,%ebp
c0105c8e:	83 ec 18             	sub    $0x18,%esp
c0105c91:	ff 75 08             	pushl  0x8(%ebp)
c0105c94:	e8 b8 ff ff ff       	call   c0105c51 <ptr_pde>
c0105c99:	83 c4 04             	add    $0x4,%esp
c0105c9c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105c9f:	ff 75 08             	pushl  0x8(%ebp)
c0105ca2:	e8 bd ff ff ff       	call   c0105c64 <ptr_pte>
c0105ca7:	83 c4 04             	add    $0x4,%esp
c0105caa:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105cad:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105cb0:	8b 00                	mov    (%eax),%eax
c0105cb2:	83 e0 01             	and    $0x1,%eax
c0105cb5:	85 c0                	test   %eax,%eax
c0105cb7:	74 1b                	je     c0105cd4 <add_map_entry+0x49>
c0105cb9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105cbc:	8b 00                	mov    (%eax),%eax
c0105cbe:	83 e0 01             	and    $0x1,%eax
c0105cc1:	85 c0                	test   %eax,%eax
c0105cc3:	75 54                	jne    c0105d19 <add_map_entry+0x8e>
c0105cc5:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105cc8:	83 c8 07             	or     $0x7,%eax
c0105ccb:	89 c2                	mov    %eax,%edx
c0105ccd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105cd0:	89 10                	mov    %edx,(%eax)
c0105cd2:	eb 45                	jmp    c0105d19 <add_map_entry+0x8e>
c0105cd4:	83 ec 0c             	sub    $0xc,%esp
c0105cd7:	6a 00                	push   $0x0
c0105cd9:	e8 95 fd ff ff       	call   c0105a73 <get_a_page>
c0105cde:	83 c4 10             	add    $0x10,%esp
c0105ce1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105ce4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105ce7:	83 c8 07             	or     $0x7,%eax
c0105cea:	89 c2                	mov    %eax,%edx
c0105cec:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105cef:	89 10                	mov    %edx,(%eax)
c0105cf1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105cf4:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105cf9:	83 ec 04             	sub    $0x4,%esp
c0105cfc:	68 00 10 00 00       	push   $0x1000
c0105d01:	6a 00                	push   $0x0
c0105d03:	50                   	push   %eax
c0105d04:	e8 e2 54 00 00       	call   c010b1eb <Memset>
c0105d09:	83 c4 10             	add    $0x10,%esp
c0105d0c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105d0f:	83 c8 07             	or     $0x7,%eax
c0105d12:	89 c2                	mov    %eax,%edx
c0105d14:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105d17:	89 10                	mov    %edx,(%eax)
c0105d19:	90                   	nop
c0105d1a:	c9                   	leave  
c0105d1b:	c3                   	ret    

c0105d1c <alloc_virtual_memory>:
c0105d1c:	55                   	push   %ebp
c0105d1d:	89 e5                	mov    %esp,%ebp
c0105d1f:	83 ec 28             	sub    $0x28,%esp
c0105d22:	8b 45 08             	mov    0x8(%ebp),%eax
c0105d25:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105d2a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105d2d:	8b 45 08             	mov    0x8(%ebp),%eax
c0105d30:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0105d33:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105d36:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105d39:	01 45 e4             	add    %eax,-0x1c(%ebp)
c0105d3c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105d3f:	05 ff 0f 00 00       	add    $0xfff,%eax
c0105d44:	c1 e8 0c             	shr    $0xc,%eax
c0105d47:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105d4a:	e8 54 a6 ff ff       	call   c01003a3 <get_running_thread_pcb>
c0105d4f:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105d52:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105d55:	8b 50 08             	mov    0x8(%eax),%edx
c0105d58:	a1 28 0f 11 c0       	mov    0xc0110f28,%eax
c0105d5d:	39 c2                	cmp    %eax,%edx
c0105d5f:	75 09                	jne    c0105d6a <alloc_virtual_memory+0x4e>
c0105d61:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0105d68:	eb 07                	jmp    c0105d71 <alloc_virtual_memory+0x55>
c0105d6a:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0105d71:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0105d78:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0105d7f:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0105d86:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0105d8d:	eb 47                	jmp    c0105dd6 <alloc_virtual_memory+0xba>
c0105d8f:	83 ec 08             	sub    $0x8,%esp
c0105d92:	ff 75 f0             	pushl  -0x10(%ebp)
c0105d95:	6a 01                	push   $0x1
c0105d97:	e8 25 fe ff ff       	call   c0105bc1 <get_virtual_address>
c0105d9c:	83 c4 10             	add    $0x10,%esp
c0105d9f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105da2:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0105da6:	74 13                	je     c0105dbb <alloc_virtual_memory+0x9f>
c0105da8:	83 ec 0c             	sub    $0xc,%esp
c0105dab:	ff 75 f0             	pushl  -0x10(%ebp)
c0105dae:	e8 c0 fc ff ff       	call   c0105a73 <get_a_page>
c0105db3:	83 c4 10             	add    $0x10,%esp
c0105db6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105db9:	eb 06                	jmp    c0105dc1 <alloc_virtual_memory+0xa5>
c0105dbb:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0105dbe:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105dc1:	83 ec 08             	sub    $0x8,%esp
c0105dc4:	ff 75 f4             	pushl  -0xc(%ebp)
c0105dc7:	ff 75 d8             	pushl  -0x28(%ebp)
c0105dca:	e8 bc fe ff ff       	call   c0105c8b <add_map_entry>
c0105dcf:	83 c4 10             	add    $0x10,%esp
c0105dd2:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0105dd6:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105dd9:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c0105ddc:	72 b1                	jb     c0105d8f <alloc_virtual_memory+0x73>
c0105dde:	8b 45 08             	mov    0x8(%ebp),%eax
c0105de1:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105de6:	89 c2                	mov    %eax,%edx
c0105de8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105deb:	01 d0                	add    %edx,%eax
c0105ded:	c9                   	leave  
c0105dee:	c3                   	ret    

c0105def <get_physical_address_proc>:
c0105def:	55                   	push   %ebp
c0105df0:	89 e5                	mov    %esp,%ebp
c0105df2:	83 ec 18             	sub    $0x18,%esp
c0105df5:	e8 cd a4 ff ff       	call   c01002c7 <disable_int>
c0105dfa:	e8 a4 a5 ff ff       	call   c01003a3 <get_running_thread_pcb>
c0105dff:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105e02:	83 ec 0c             	sub    $0xc,%esp
c0105e05:	ff 75 0c             	pushl  0xc(%ebp)
c0105e08:	e8 d9 d8 ff ff       	call   c01036e6 <pid2proc>
c0105e0d:	83 c4 10             	add    $0x10,%esp
c0105e10:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105e13:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105e16:	8b 40 08             	mov    0x8(%eax),%eax
c0105e19:	83 ec 0c             	sub    $0xc,%esp
c0105e1c:	50                   	push   %eax
c0105e1d:	e8 65 a5 ff ff       	call   c0100387 <update_cr3>
c0105e22:	83 c4 10             	add    $0x10,%esp
c0105e25:	83 ec 0c             	sub    $0xc,%esp
c0105e28:	ff 75 08             	pushl  0x8(%ebp)
c0105e2b:	e8 34 fe ff ff       	call   c0105c64 <ptr_pte>
c0105e30:	83 c4 10             	add    $0x10,%esp
c0105e33:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105e36:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105e39:	8b 00                	mov    (%eax),%eax
c0105e3b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105e40:	89 c2                	mov    %eax,%edx
c0105e42:	8b 45 08             	mov    0x8(%ebp),%eax
c0105e45:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105e4a:	09 d0                	or     %edx,%eax
c0105e4c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105e4f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105e52:	8b 40 08             	mov    0x8(%eax),%eax
c0105e55:	83 ec 0c             	sub    $0xc,%esp
c0105e58:	50                   	push   %eax
c0105e59:	e8 29 a5 ff ff       	call   c0100387 <update_cr3>
c0105e5e:	83 c4 10             	add    $0x10,%esp
c0105e61:	e8 63 a4 ff ff       	call   c01002c9 <enable_int>
c0105e66:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105e69:	c9                   	leave  
c0105e6a:	c3                   	ret    

c0105e6b <get_physical_address>:
c0105e6b:	55                   	push   %ebp
c0105e6c:	89 e5                	mov    %esp,%ebp
c0105e6e:	83 ec 10             	sub    $0x10,%esp
c0105e71:	ff 75 08             	pushl  0x8(%ebp)
c0105e74:	e8 eb fd ff ff       	call   c0105c64 <ptr_pte>
c0105e79:	83 c4 04             	add    $0x4,%esp
c0105e7c:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105e7f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105e82:	8b 00                	mov    (%eax),%eax
c0105e84:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105e89:	89 c2                	mov    %eax,%edx
c0105e8b:	8b 45 08             	mov    0x8(%ebp),%eax
c0105e8e:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105e93:	09 d0                	or     %edx,%eax
c0105e95:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105e98:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105e9b:	c9                   	leave  
c0105e9c:	c3                   	ret    

c0105e9d <alloc_physical_memory_of_proc>:
c0105e9d:	55                   	push   %ebp
c0105e9e:	89 e5                	mov    %esp,%ebp
c0105ea0:	83 ec 48             	sub    $0x48,%esp
c0105ea3:	e8 1f a4 ff ff       	call   c01002c7 <disable_int>
c0105ea8:	8b 45 08             	mov    0x8(%ebp),%eax
c0105eab:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105eb0:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105eb3:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0105eba:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105ebd:	83 ec 0c             	sub    $0xc,%esp
c0105ec0:	50                   	push   %eax
c0105ec1:	e8 20 d8 ff ff       	call   c01036e6 <pid2proc>
c0105ec6:	83 c4 10             	add    $0x10,%esp
c0105ec9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105ecc:	e8 d2 a4 ff ff       	call   c01003a3 <get_running_thread_pcb>
c0105ed1:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105ed4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105ed7:	8b 40 0c             	mov    0xc(%eax),%eax
c0105eda:	83 ec 04             	sub    $0x4,%esp
c0105edd:	6a 0c                	push   $0xc
c0105edf:	50                   	push   %eax
c0105ee0:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0105ee3:	50                   	push   %eax
c0105ee4:	e8 a0 0c 00 00       	call   c0106b89 <Memcpy>
c0105ee9:	83 c4 10             	add    $0x10,%esp
c0105eec:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0105eef:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0105ef2:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0105ef5:	89 55 c8             	mov    %edx,-0x38(%ebp)
c0105ef8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0105efb:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0105efe:	29 c2                	sub    %eax,%edx
c0105f00:	89 d0                	mov    %edx,%eax
c0105f02:	c1 e8 0c             	shr    $0xc,%eax
c0105f05:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105f08:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0105f0b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0105f0e:	c1 e2 0c             	shl    $0xc,%edx
c0105f11:	01 d0                	add    %edx,%eax
c0105f13:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105f16:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105f19:	6a 01                	push   $0x1
c0105f1b:	6a 01                	push   $0x1
c0105f1d:	50                   	push   %eax
c0105f1e:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0105f21:	50                   	push   %eax
c0105f22:	e8 06 fa ff ff       	call   c010592d <set_bits>
c0105f27:	83 c4 10             	add    $0x10,%esp
c0105f2a:	83 ec 0c             	sub    $0xc,%esp
c0105f2d:	ff 75 f0             	pushl  -0x10(%ebp)
c0105f30:	e8 3e fb ff ff       	call   c0105a73 <get_a_page>
c0105f35:	83 c4 10             	add    $0x10,%esp
c0105f38:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105f3b:	8b 45 08             	mov    0x8(%ebp),%eax
c0105f3e:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105f43:	89 c2                	mov    %eax,%edx
c0105f45:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105f48:	01 d0                	add    %edx,%eax
c0105f4a:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105f4d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105f50:	8b 40 08             	mov    0x8(%eax),%eax
c0105f53:	83 ec 0c             	sub    $0xc,%esp
c0105f56:	50                   	push   %eax
c0105f57:	e8 2b a4 ff ff       	call   c0100387 <update_cr3>
c0105f5c:	83 c4 10             	add    $0x10,%esp
c0105f5f:	83 ec 08             	sub    $0x8,%esp
c0105f62:	ff 75 dc             	pushl  -0x24(%ebp)
c0105f65:	ff 75 f4             	pushl  -0xc(%ebp)
c0105f68:	e8 1e fd ff ff       	call   c0105c8b <add_map_entry>
c0105f6d:	83 c4 10             	add    $0x10,%esp
c0105f70:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105f73:	8b 40 08             	mov    0x8(%eax),%eax
c0105f76:	83 ec 0c             	sub    $0xc,%esp
c0105f79:	50                   	push   %eax
c0105f7a:	e8 08 a4 ff ff       	call   c0100387 <update_cr3>
c0105f7f:	83 c4 10             	add    $0x10,%esp
c0105f82:	e8 42 a3 ff ff       	call   c01002c9 <enable_int>
c0105f87:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0105f8a:	c9                   	leave  
c0105f8b:	c3                   	ret    

c0105f8c <alloc_physical_memory>:
c0105f8c:	55                   	push   %ebp
c0105f8d:	89 e5                	mov    %esp,%ebp
c0105f8f:	83 ec 38             	sub    $0x38,%esp
c0105f92:	8b 45 08             	mov    0x8(%ebp),%eax
c0105f95:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105f9a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105f9d:	e8 01 a4 ff ff       	call   c01003a3 <get_running_thread_pcb>
c0105fa2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105fa5:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0105fa9:	75 1a                	jne    c0105fc5 <alloc_physical_memory+0x39>
c0105fab:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0105fb0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0105fb3:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0105fb8:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105fbb:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c0105fc0:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105fc3:	eb 18                	jmp    c0105fdd <alloc_physical_memory+0x51>
c0105fc5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105fc8:	8b 40 0c             	mov    0xc(%eax),%eax
c0105fcb:	83 ec 04             	sub    $0x4,%esp
c0105fce:	6a 0c                	push   $0xc
c0105fd0:	50                   	push   %eax
c0105fd1:	8d 45 d4             	lea    -0x2c(%ebp),%eax
c0105fd4:	50                   	push   %eax
c0105fd5:	e8 af 0b 00 00       	call   c0106b89 <Memcpy>
c0105fda:	83 c4 10             	add    $0x10,%esp
c0105fdd:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0105fe0:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0105fe3:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0105fe6:	89 55 d0             	mov    %edx,-0x30(%ebp)
c0105fe9:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105fec:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0105fef:	29 c2                	sub    %eax,%edx
c0105ff1:	89 d0                	mov    %edx,%eax
c0105ff3:	c1 e8 0c             	shr    $0xc,%eax
c0105ff6:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105ff9:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105ffc:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0105fff:	c1 e2 0c             	shl    $0xc,%edx
c0106002:	01 d0                	add    %edx,%eax
c0106004:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106007:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010600a:	6a 01                	push   $0x1
c010600c:	6a 01                	push   $0x1
c010600e:	50                   	push   %eax
c010600f:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0106012:	50                   	push   %eax
c0106013:	e8 15 f9 ff ff       	call   c010592d <set_bits>
c0106018:	83 c4 10             	add    $0x10,%esp
c010601b:	83 ec 0c             	sub    $0xc,%esp
c010601e:	ff 75 0c             	pushl  0xc(%ebp)
c0106021:	e8 4d fa ff ff       	call   c0105a73 <get_a_page>
c0106026:	83 c4 10             	add    $0x10,%esp
c0106029:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010602c:	8b 45 08             	mov    0x8(%ebp),%eax
c010602f:	25 ff 0f 00 00       	and    $0xfff,%eax
c0106034:	89 c2                	mov    %eax,%edx
c0106036:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106039:	01 d0                	add    %edx,%eax
c010603b:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010603e:	83 ec 08             	sub    $0x8,%esp
c0106041:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106044:	ff 75 f4             	pushl  -0xc(%ebp)
c0106047:	e8 3f fc ff ff       	call   c0105c8b <add_map_entry>
c010604c:	83 c4 10             	add    $0x10,%esp
c010604f:	8b 45 08             	mov    0x8(%ebp),%eax
c0106052:	c9                   	leave  
c0106053:	c3                   	ret    

c0106054 <alloc_memory>:
c0106054:	55                   	push   %ebp
c0106055:	89 e5                	mov    %esp,%ebp
c0106057:	83 ec 18             	sub    $0x18,%esp
c010605a:	83 ec 08             	sub    $0x8,%esp
c010605d:	ff 75 0c             	pushl  0xc(%ebp)
c0106060:	ff 75 08             	pushl  0x8(%ebp)
c0106063:	e8 59 fb ff ff       	call   c0105bc1 <get_virtual_address>
c0106068:	83 c4 10             	add    $0x10,%esp
c010606b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010606e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106071:	2d 00 10 00 00       	sub    $0x1000,%eax
c0106076:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106079:	eb 29                	jmp    c01060a4 <alloc_memory+0x50>
c010607b:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c0106082:	83 ec 0c             	sub    $0xc,%esp
c0106085:	ff 75 0c             	pushl  0xc(%ebp)
c0106088:	e8 e6 f9 ff ff       	call   c0105a73 <get_a_page>
c010608d:	83 c4 10             	add    $0x10,%esp
c0106090:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106093:	83 ec 08             	sub    $0x8,%esp
c0106096:	ff 75 ec             	pushl  -0x14(%ebp)
c0106099:	ff 75 f4             	pushl  -0xc(%ebp)
c010609c:	e8 ea fb ff ff       	call   c0105c8b <add_map_entry>
c01060a1:	83 c4 10             	add    $0x10,%esp
c01060a4:	8b 45 08             	mov    0x8(%ebp),%eax
c01060a7:	8d 50 ff             	lea    -0x1(%eax),%edx
c01060aa:	89 55 08             	mov    %edx,0x8(%ebp)
c01060ad:	85 c0                	test   %eax,%eax
c01060af:	75 ca                	jne    c010607b <alloc_memory+0x27>
c01060b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01060b4:	c9                   	leave  
c01060b5:	c3                   	ret    

c01060b6 <get_a_virtual_page>:
c01060b6:	55                   	push   %ebp
c01060b7:	89 e5                	mov    %esp,%ebp
c01060b9:	83 ec 18             	sub    $0x18,%esp
c01060bc:	83 ec 0c             	sub    $0xc,%esp
c01060bf:	ff 75 08             	pushl  0x8(%ebp)
c01060c2:	e8 ac f9 ff ff       	call   c0105a73 <get_a_page>
c01060c7:	83 c4 10             	add    $0x10,%esp
c01060ca:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01060cd:	8b 45 0c             	mov    0xc(%ebp),%eax
c01060d0:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01060d5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01060d8:	83 ec 08             	sub    $0x8,%esp
c01060db:	ff 75 f4             	pushl  -0xc(%ebp)
c01060de:	ff 75 f0             	pushl  -0x10(%ebp)
c01060e1:	e8 a5 fb ff ff       	call   c0105c8b <add_map_entry>
c01060e6:	83 c4 10             	add    $0x10,%esp
c01060e9:	8b 45 0c             	mov    0xc(%ebp),%eax
c01060ec:	c9                   	leave  
c01060ed:	c3                   	ret    

c01060ee <block2arena>:
c01060ee:	55                   	push   %ebp
c01060ef:	89 e5                	mov    %esp,%ebp
c01060f1:	83 ec 10             	sub    $0x10,%esp
c01060f4:	8b 45 08             	mov    0x8(%ebp),%eax
c01060f7:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01060fc:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01060ff:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106102:	c9                   	leave  
c0106103:	c3                   	ret    

c0106104 <sys_malloc2>:
c0106104:	55                   	push   %ebp
c0106105:	89 e5                	mov    %esp,%ebp
c0106107:	83 ec 68             	sub    $0x68,%esp
c010610a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106111:	e8 8d a2 ff ff       	call   c01003a3 <get_running_thread_pcb>
c0106116:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0106119:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010611c:	8b 50 08             	mov    0x8(%eax),%edx
c010611f:	a1 28 0f 11 c0       	mov    0xc0110f28,%eax
c0106124:	39 c2                	cmp    %eax,%edx
c0106126:	75 10                	jne    c0106138 <sys_malloc2+0x34>
c0106128:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c010612f:	c7 45 ec e0 37 18 c0 	movl   $0xc01837e0,-0x14(%ebp)
c0106136:	eb 10                	jmp    c0106148 <sys_malloc2+0x44>
c0106138:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c010613f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106142:	83 c0 10             	add    $0x10,%eax
c0106145:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106148:	81 7d 08 00 04 00 00 	cmpl   $0x400,0x8(%ebp)
c010614f:	76 52                	jbe    c01061a3 <sys_malloc2+0x9f>
c0106151:	8b 45 08             	mov    0x8(%ebp),%eax
c0106154:	05 0b 10 00 00       	add    $0x100b,%eax
c0106159:	c1 e8 0c             	shr    $0xc,%eax
c010615c:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010615f:	83 ec 08             	sub    $0x8,%esp
c0106162:	ff 75 f0             	pushl  -0x10(%ebp)
c0106165:	ff 75 d8             	pushl  -0x28(%ebp)
c0106168:	e8 e7 fe ff ff       	call   c0106054 <alloc_memory>
c010616d:	83 c4 10             	add    $0x10,%esp
c0106170:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106173:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106176:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0106179:	8b 45 d0             	mov    -0x30(%ebp),%eax
c010617c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0106182:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106185:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c010618c:	8b 45 d0             	mov    -0x30(%ebp),%eax
c010618f:	c6 40 08 01          	movb   $0x1,0x8(%eax)
c0106193:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106196:	05 90 00 00 00       	add    $0x90,%eax
c010619b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010619e:	e9 f0 01 00 00       	jmp    c0106393 <sys_malloc2+0x28f>
c01061a3:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01061aa:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01061b1:	eb 26                	jmp    c01061d9 <sys_malloc2+0xd5>
c01061b3:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01061b6:	89 d0                	mov    %edx,%eax
c01061b8:	01 c0                	add    %eax,%eax
c01061ba:	01 d0                	add    %edx,%eax
c01061bc:	c1 e0 03             	shl    $0x3,%eax
c01061bf:	89 c2                	mov    %eax,%edx
c01061c1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01061c4:	01 d0                	add    %edx,%eax
c01061c6:	8b 00                	mov    (%eax),%eax
c01061c8:	39 45 08             	cmp    %eax,0x8(%ebp)
c01061cb:	77 08                	ja     c01061d5 <sys_malloc2+0xd1>
c01061cd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01061d0:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01061d3:	eb 0a                	jmp    c01061df <sys_malloc2+0xdb>
c01061d5:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c01061d9:	83 7d e4 09          	cmpl   $0x9,-0x1c(%ebp)
c01061dd:	7e d4                	jle    c01061b3 <sys_malloc2+0xaf>
c01061df:	83 ec 08             	sub    $0x8,%esp
c01061e2:	ff 75 f0             	pushl  -0x10(%ebp)
c01061e5:	6a 01                	push   $0x1
c01061e7:	e8 68 fe ff ff       	call   c0106054 <alloc_memory>
c01061ec:	83 c4 10             	add    $0x10,%esp
c01061ef:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01061f2:	8b 55 e8             	mov    -0x18(%ebp),%edx
c01061f5:	89 d0                	mov    %edx,%eax
c01061f7:	01 c0                	add    %eax,%eax
c01061f9:	01 d0                	add    %edx,%eax
c01061fb:	c1 e0 03             	shl    $0x3,%eax
c01061fe:	89 c2                	mov    %eax,%edx
c0106200:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106203:	01 d0                	add    %edx,%eax
c0106205:	83 ec 04             	sub    $0x4,%esp
c0106208:	6a 18                	push   $0x18
c010620a:	50                   	push   %eax
c010620b:	ff 75 cc             	pushl  -0x34(%ebp)
c010620e:	e8 76 09 00 00       	call   c0106b89 <Memcpy>
c0106213:	83 c4 10             	add    $0x10,%esp
c0106216:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c010621d:	e8 03 09 00 00       	call   c0106b25 <intr_disable>
c0106222:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0106225:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0106228:	89 d0                	mov    %edx,%eax
c010622a:	01 c0                	add    %eax,%eax
c010622c:	01 d0                	add    %edx,%eax
c010622e:	c1 e0 03             	shl    $0x3,%eax
c0106231:	89 c2                	mov    %eax,%edx
c0106233:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106236:	01 d0                	add    %edx,%eax
c0106238:	83 c0 08             	add    $0x8,%eax
c010623b:	83 ec 0c             	sub    $0xc,%esp
c010623e:	50                   	push   %eax
c010623f:	e8 2f 3b 00 00       	call   c0109d73 <isListEmpty>
c0106244:	83 c4 10             	add    $0x10,%esp
c0106247:	3c 01                	cmp    $0x1,%al
c0106249:	0f 85 c1 00 00 00    	jne    c0106310 <sys_malloc2+0x20c>
c010624f:	c7 45 c8 01 00 00 00 	movl   $0x1,-0x38(%ebp)
c0106256:	83 ec 08             	sub    $0x8,%esp
c0106259:	ff 75 f0             	pushl  -0x10(%ebp)
c010625c:	6a 01                	push   $0x1
c010625e:	e8 f1 fd ff ff       	call   c0106054 <alloc_memory>
c0106263:	83 c4 10             	add    $0x10,%esp
c0106266:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0106269:	8b 45 c0             	mov    -0x40(%ebp),%eax
c010626c:	83 ec 0c             	sub    $0xc,%esp
c010626f:	50                   	push   %eax
c0106270:	e8 79 fe ff ff       	call   c01060ee <block2arena>
c0106275:	83 c4 10             	add    $0x10,%esp
c0106278:	89 45 bc             	mov    %eax,-0x44(%ebp)
c010627b:	8b 55 e8             	mov    -0x18(%ebp),%edx
c010627e:	89 d0                	mov    %edx,%eax
c0106280:	01 c0                	add    %eax,%eax
c0106282:	01 d0                	add    %edx,%eax
c0106284:	c1 e0 03             	shl    $0x3,%eax
c0106287:	89 c2                	mov    %eax,%edx
c0106289:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010628c:	01 d0                	add    %edx,%eax
c010628e:	8b 50 04             	mov    0x4(%eax),%edx
c0106291:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0106294:	89 50 04             	mov    %edx,0x4(%eax)
c0106297:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010629a:	8b 00                	mov    (%eax),%eax
c010629c:	89 45 b8             	mov    %eax,-0x48(%ebp)
c010629f:	c7 45 b4 0c 00 00 00 	movl   $0xc,-0x4c(%ebp)
c01062a6:	b8 00 10 00 00       	mov    $0x1000,%eax
c01062ab:	2b 45 b4             	sub    -0x4c(%ebp),%eax
c01062ae:	ba 00 00 00 00       	mov    $0x0,%edx
c01062b3:	f7 75 b8             	divl   -0x48(%ebp)
c01062b6:	89 45 b0             	mov    %eax,-0x50(%ebp)
c01062b9:	8b 55 c0             	mov    -0x40(%ebp),%edx
c01062bc:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c01062bf:	01 d0                	add    %edx,%eax
c01062c1:	89 45 ac             	mov    %eax,-0x54(%ebp)
c01062c4:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c01062cb:	eb 3b                	jmp    c0106308 <sys_malloc2+0x204>
c01062cd:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01062d0:	0f af 45 b8          	imul   -0x48(%ebp),%eax
c01062d4:	89 c2                	mov    %eax,%edx
c01062d6:	8b 45 ac             	mov    -0x54(%ebp),%eax
c01062d9:	01 d0                	add    %edx,%eax
c01062db:	89 45 a8             	mov    %eax,-0x58(%ebp)
c01062de:	8b 4d a8             	mov    -0x58(%ebp),%ecx
c01062e1:	8b 55 e8             	mov    -0x18(%ebp),%edx
c01062e4:	89 d0                	mov    %edx,%eax
c01062e6:	01 c0                	add    %eax,%eax
c01062e8:	01 d0                	add    %edx,%eax
c01062ea:	c1 e0 03             	shl    $0x3,%eax
c01062ed:	89 c2                	mov    %eax,%edx
c01062ef:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01062f2:	01 d0                	add    %edx,%eax
c01062f4:	83 c0 08             	add    $0x8,%eax
c01062f7:	83 ec 08             	sub    $0x8,%esp
c01062fa:	51                   	push   %ecx
c01062fb:	50                   	push   %eax
c01062fc:	e8 6f 3b 00 00       	call   c0109e70 <appendToDoubleLinkList>
c0106301:	83 c4 10             	add    $0x10,%esp
c0106304:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0106308:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010630b:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c010630e:	77 bd                	ja     c01062cd <sys_malloc2+0x1c9>
c0106310:	83 ec 0c             	sub    $0xc,%esp
c0106313:	ff 75 c4             	pushl  -0x3c(%ebp)
c0106316:	e8 33 08 00 00       	call   c0106b4e <intr_set_status>
c010631b:	83 c4 10             	add    $0x10,%esp
c010631e:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0106321:	89 d0                	mov    %edx,%eax
c0106323:	01 c0                	add    %eax,%eax
c0106325:	01 d0                	add    %edx,%eax
c0106327:	c1 e0 03             	shl    $0x3,%eax
c010632a:	89 c2                	mov    %eax,%edx
c010632c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010632f:	01 d0                	add    %edx,%eax
c0106331:	83 c0 08             	add    $0x8,%eax
c0106334:	83 ec 0c             	sub    $0xc,%esp
c0106337:	50                   	push   %eax
c0106338:	e8 9d 3c 00 00       	call   c0109fda <popFromDoubleLinkList>
c010633d:	83 c4 10             	add    $0x10,%esp
c0106340:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0106343:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0106346:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106349:	83 7d a8 00          	cmpl   $0x0,-0x58(%ebp)
c010634d:	75 1c                	jne    c010636b <sys_malloc2+0x267>
c010634f:	68 ef 01 00 00       	push   $0x1ef
c0106354:	68 32 a7 10 c0       	push   $0xc010a732
c0106359:	68 32 a7 10 c0       	push   $0xc010a732
c010635e:	68 53 a7 10 c0       	push   $0xc010a753
c0106363:	e8 50 22 00 00       	call   c01085b8 <assertion_failure>
c0106368:	83 c4 10             	add    $0x10,%esp
c010636b:	8b 45 a8             	mov    -0x58(%ebp),%eax
c010636e:	83 ec 0c             	sub    $0xc,%esp
c0106371:	50                   	push   %eax
c0106372:	e8 77 fd ff ff       	call   c01060ee <block2arena>
c0106377:	83 c4 10             	add    $0x10,%esp
c010637a:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c010637d:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0106380:	8b 40 04             	mov    0x4(%eax),%eax
c0106383:	8d 50 ff             	lea    -0x1(%eax),%edx
c0106386:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0106389:	89 50 04             	mov    %edx,0x4(%eax)
c010638c:	c7 45 c4 04 00 00 00 	movl   $0x4,-0x3c(%ebp)
c0106393:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0106397:	75 1c                	jne    c01063b5 <sys_malloc2+0x2b1>
c0106399:	68 f6 01 00 00       	push   $0x1f6
c010639e:	68 32 a7 10 c0       	push   $0xc010a732
c01063a3:	68 32 a7 10 c0       	push   $0xc010a732
c01063a8:	68 65 a7 10 c0       	push   $0xc010a765
c01063ad:	e8 06 22 00 00       	call   c01085b8 <assertion_failure>
c01063b2:	83 c4 10             	add    $0x10,%esp
c01063b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01063b8:	c9                   	leave  
c01063b9:	c3                   	ret    

c01063ba <remove_map_entry>:
c01063ba:	55                   	push   %ebp
c01063bb:	89 e5                	mov    %esp,%ebp
c01063bd:	83 ec 10             	sub    $0x10,%esp
c01063c0:	ff 75 08             	pushl  0x8(%ebp)
c01063c3:	e8 9c f8 ff ff       	call   c0105c64 <ptr_pte>
c01063c8:	83 c4 04             	add    $0x4,%esp
c01063cb:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01063ce:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01063d1:	8b 10                	mov    (%eax),%edx
c01063d3:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01063d6:	89 10                	mov    %edx,(%eax)
c01063d8:	90                   	nop
c01063d9:	c9                   	leave  
c01063da:	c3                   	ret    

c01063db <free_a_page>:
c01063db:	55                   	push   %ebp
c01063dc:	89 e5                	mov    %esp,%ebp
c01063de:	83 ec 20             	sub    $0x20,%esp
c01063e1:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01063e5:	75 21                	jne    c0106408 <free_a_page+0x2d>
c01063e7:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c01063ec:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01063ef:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c01063f4:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01063f7:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c01063fc:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01063ff:	c7 45 fc ac 06 11 c0 	movl   $0xc01106ac,-0x4(%ebp)
c0106406:	eb 1f                	jmp    c0106427 <free_a_page+0x4c>
c0106408:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c010640d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106410:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0106415:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106418:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c010641d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106420:	c7 45 fc f4 0e 11 c0 	movl   $0xc0110ef4,-0x4(%ebp)
c0106427:	8b 45 08             	mov    0x8(%ebp),%eax
c010642a:	c1 e8 0c             	shr    $0xc,%eax
c010642d:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0106430:	6a 00                	push   $0x0
c0106432:	ff 75 f8             	pushl  -0x8(%ebp)
c0106435:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c0106438:	50                   	push   %eax
c0106439:	e8 74 f4 ff ff       	call   c01058b2 <set_bit_val>
c010643e:	83 c4 0c             	add    $0xc,%esp
c0106441:	ff 75 08             	pushl  0x8(%ebp)
c0106444:	e8 22 fa ff ff       	call   c0105e6b <get_physical_address>
c0106449:	83 c4 04             	add    $0x4,%esp
c010644c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010644f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106452:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106458:	85 c0                	test   %eax,%eax
c010645a:	0f 48 c2             	cmovs  %edx,%eax
c010645d:	c1 f8 0c             	sar    $0xc,%eax
c0106460:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0106463:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106466:	6a 00                	push   $0x0
c0106468:	ff 75 f0             	pushl  -0x10(%ebp)
c010646b:	50                   	push   %eax
c010646c:	e8 41 f4 ff ff       	call   c01058b2 <set_bit_val>
c0106471:	83 c4 0c             	add    $0xc,%esp
c0106474:	ff 75 08             	pushl  0x8(%ebp)
c0106477:	e8 3e ff ff ff       	call   c01063ba <remove_map_entry>
c010647c:	83 c4 04             	add    $0x4,%esp
c010647f:	90                   	nop
c0106480:	c9                   	leave  
c0106481:	c3                   	ret    

c0106482 <sys_free2>:
c0106482:	55                   	push   %ebp
c0106483:	89 e5                	mov    %esp,%ebp
c0106485:	83 ec 58             	sub    $0x58,%esp
c0106488:	e8 16 9f ff ff       	call   c01003a3 <get_running_thread_pcb>
c010648d:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0106490:	e8 90 06 00 00       	call   c0106b25 <intr_disable>
c0106495:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0106498:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010649b:	8b 50 08             	mov    0x8(%eax),%edx
c010649e:	a1 28 0f 11 c0       	mov    0xc0110f28,%eax
c01064a3:	39 c2                	cmp    %eax,%edx
c01064a5:	75 10                	jne    c01064b7 <sys_free2+0x35>
c01064a7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01064ae:	c7 45 f0 e0 37 18 c0 	movl   $0xc01837e0,-0x10(%ebp)
c01064b5:	eb 10                	jmp    c01064c7 <sys_free2+0x45>
c01064b7:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c01064be:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01064c1:	83 c0 10             	add    $0x10,%eax
c01064c4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01064c7:	81 7d 0c 00 04 00 00 	cmpl   $0x400,0xc(%ebp)
c01064ce:	76 4d                	jbe    c010651d <sys_free2+0x9b>
c01064d0:	8b 45 08             	mov    0x8(%ebp),%eax
c01064d3:	83 e8 0c             	sub    $0xc,%eax
c01064d6:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01064d9:	83 45 0c 0c          	addl   $0xc,0xc(%ebp)
c01064dd:	8b 45 0c             	mov    0xc(%ebp),%eax
c01064e0:	05 ff 0f 00 00       	add    $0xfff,%eax
c01064e5:	c1 e8 0c             	shr    $0xc,%eax
c01064e8:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01064eb:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01064f2:	eb 1c                	jmp    c0106510 <sys_free2+0x8e>
c01064f4:	83 ec 08             	sub    $0x8,%esp
c01064f7:	ff 75 f4             	pushl  -0xc(%ebp)
c01064fa:	ff 75 ec             	pushl  -0x14(%ebp)
c01064fd:	e8 d9 fe ff ff       	call   c01063db <free_a_page>
c0106502:	83 c4 10             	add    $0x10,%esp
c0106505:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
c010650c:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0106510:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106513:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
c0106516:	77 dc                	ja     c01064f4 <sys_free2+0x72>
c0106518:	e9 dc 00 00 00       	jmp    c01065f9 <sys_free2+0x177>
c010651d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0106524:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c010652b:	eb 26                	jmp    c0106553 <sys_free2+0xd1>
c010652d:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0106530:	89 d0                	mov    %edx,%eax
c0106532:	01 c0                	add    %eax,%eax
c0106534:	01 d0                	add    %edx,%eax
c0106536:	c1 e0 03             	shl    $0x3,%eax
c0106539:	89 c2                	mov    %eax,%edx
c010653b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010653e:	01 d0                	add    %edx,%eax
c0106540:	8b 00                	mov    (%eax),%eax
c0106542:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0106545:	77 08                	ja     c010654f <sys_free2+0xcd>
c0106547:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010654a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010654d:	eb 0a                	jmp    c0106559 <sys_free2+0xd7>
c010654f:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0106553:	83 7d e0 09          	cmpl   $0x9,-0x20(%ebp)
c0106557:	7e d4                	jle    c010652d <sys_free2+0xab>
c0106559:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c010655c:	89 d0                	mov    %edx,%eax
c010655e:	01 c0                	add    %eax,%eax
c0106560:	01 d0                	add    %edx,%eax
c0106562:	c1 e0 03             	shl    $0x3,%eax
c0106565:	89 c2                	mov    %eax,%edx
c0106567:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010656a:	01 d0                	add    %edx,%eax
c010656c:	8b 10                	mov    (%eax),%edx
c010656e:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c0106571:	8b 50 04             	mov    0x4(%eax),%edx
c0106574:	89 55 b8             	mov    %edx,-0x48(%ebp)
c0106577:	8b 50 08             	mov    0x8(%eax),%edx
c010657a:	89 55 bc             	mov    %edx,-0x44(%ebp)
c010657d:	8b 50 0c             	mov    0xc(%eax),%edx
c0106580:	89 55 c0             	mov    %edx,-0x40(%ebp)
c0106583:	8b 50 10             	mov    0x10(%eax),%edx
c0106586:	89 55 c4             	mov    %edx,-0x3c(%ebp)
c0106589:	8b 40 14             	mov    0x14(%eax),%eax
c010658c:	89 45 c8             	mov    %eax,-0x38(%ebp)
c010658f:	8b 45 08             	mov    0x8(%ebp),%eax
c0106592:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0106595:	83 ec 0c             	sub    $0xc,%esp
c0106598:	ff 75 d0             	pushl  -0x30(%ebp)
c010659b:	e8 4e fb ff ff       	call   c01060ee <block2arena>
c01065a0:	83 c4 10             	add    $0x10,%esp
c01065a3:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01065a6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01065a9:	89 d0                	mov    %edx,%eax
c01065ab:	01 c0                	add    %eax,%eax
c01065ad:	01 d0                	add    %edx,%eax
c01065af:	c1 e0 03             	shl    $0x3,%eax
c01065b2:	89 c2                	mov    %eax,%edx
c01065b4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01065b7:	01 d0                	add    %edx,%eax
c01065b9:	83 c0 08             	add    $0x8,%eax
c01065bc:	83 ec 08             	sub    $0x8,%esp
c01065bf:	ff 75 d0             	pushl  -0x30(%ebp)
c01065c2:	50                   	push   %eax
c01065c3:	e8 a8 38 00 00       	call   c0109e70 <appendToDoubleLinkList>
c01065c8:	83 c4 10             	add    $0x10,%esp
c01065cb:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01065ce:	8b 40 04             	mov    0x4(%eax),%eax
c01065d1:	8d 50 01             	lea    0x1(%eax),%edx
c01065d4:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01065d7:	89 50 04             	mov    %edx,0x4(%eax)
c01065da:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01065dd:	8b 50 04             	mov    0x4(%eax),%edx
c01065e0:	8b 45 b8             	mov    -0x48(%ebp),%eax
c01065e3:	39 c2                	cmp    %eax,%edx
c01065e5:	75 12                	jne    c01065f9 <sys_free2+0x177>
c01065e7:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01065ea:	83 ec 08             	sub    $0x8,%esp
c01065ed:	ff 75 f4             	pushl  -0xc(%ebp)
c01065f0:	50                   	push   %eax
c01065f1:	e8 e5 fd ff ff       	call   c01063db <free_a_page>
c01065f6:	83 c4 10             	add    $0x10,%esp
c01065f9:	83 ec 0c             	sub    $0xc,%esp
c01065fc:	ff 75 d8             	pushl  -0x28(%ebp)
c01065ff:	e8 4a 05 00 00       	call   c0106b4e <intr_set_status>
c0106604:	83 c4 10             	add    $0x10,%esp
c0106607:	90                   	nop
c0106608:	c9                   	leave  
c0106609:	c3                   	ret    

c010660a <init_memory_block_desc>:
c010660a:	55                   	push   %ebp
c010660b:	89 e5                	mov    %esp,%ebp
c010660d:	83 ec 18             	sub    $0x18,%esp
c0106610:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106617:	e9 b2 00 00 00       	jmp    c01066ce <init_memory_block_desc+0xc4>
c010661c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0106620:	75 1b                	jne    c010663d <init_memory_block_desc+0x33>
c0106622:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106625:	89 d0                	mov    %edx,%eax
c0106627:	01 c0                	add    %eax,%eax
c0106629:	01 d0                	add    %edx,%eax
c010662b:	c1 e0 03             	shl    $0x3,%eax
c010662e:	89 c2                	mov    %eax,%edx
c0106630:	8b 45 08             	mov    0x8(%ebp),%eax
c0106633:	01 d0                	add    %edx,%eax
c0106635:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c010663b:	eb 2e                	jmp    c010666b <init_memory_block_desc+0x61>
c010663d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106640:	89 d0                	mov    %edx,%eax
c0106642:	01 c0                	add    %eax,%eax
c0106644:	01 d0                	add    %edx,%eax
c0106646:	c1 e0 03             	shl    $0x3,%eax
c0106649:	8d 50 e8             	lea    -0x18(%eax),%edx
c010664c:	8b 45 08             	mov    0x8(%ebp),%eax
c010664f:	01 d0                	add    %edx,%eax
c0106651:	8b 08                	mov    (%eax),%ecx
c0106653:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106656:	89 d0                	mov    %edx,%eax
c0106658:	01 c0                	add    %eax,%eax
c010665a:	01 d0                	add    %edx,%eax
c010665c:	c1 e0 03             	shl    $0x3,%eax
c010665f:	89 c2                	mov    %eax,%edx
c0106661:	8b 45 08             	mov    0x8(%ebp),%eax
c0106664:	01 d0                	add    %edx,%eax
c0106666:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
c0106669:	89 10                	mov    %edx,(%eax)
c010666b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010666e:	89 d0                	mov    %edx,%eax
c0106670:	01 c0                	add    %eax,%eax
c0106672:	01 d0                	add    %edx,%eax
c0106674:	c1 e0 03             	shl    $0x3,%eax
c0106677:	89 c2                	mov    %eax,%edx
c0106679:	8b 45 08             	mov    0x8(%ebp),%eax
c010667c:	01 d0                	add    %edx,%eax
c010667e:	8b 00                	mov    (%eax),%eax
c0106680:	89 c1                	mov    %eax,%ecx
c0106682:	b8 f4 0f 00 00       	mov    $0xff4,%eax
c0106687:	ba 00 00 00 00       	mov    $0x0,%edx
c010668c:	f7 f1                	div    %ecx
c010668e:	89 c1                	mov    %eax,%ecx
c0106690:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106693:	89 d0                	mov    %edx,%eax
c0106695:	01 c0                	add    %eax,%eax
c0106697:	01 d0                	add    %edx,%eax
c0106699:	c1 e0 03             	shl    $0x3,%eax
c010669c:	89 c2                	mov    %eax,%edx
c010669e:	8b 45 08             	mov    0x8(%ebp),%eax
c01066a1:	01 d0                	add    %edx,%eax
c01066a3:	89 ca                	mov    %ecx,%edx
c01066a5:	89 50 04             	mov    %edx,0x4(%eax)
c01066a8:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01066ab:	89 d0                	mov    %edx,%eax
c01066ad:	01 c0                	add    %eax,%eax
c01066af:	01 d0                	add    %edx,%eax
c01066b1:	c1 e0 03             	shl    $0x3,%eax
c01066b4:	89 c2                	mov    %eax,%edx
c01066b6:	8b 45 08             	mov    0x8(%ebp),%eax
c01066b9:	01 d0                	add    %edx,%eax
c01066bb:	83 c0 08             	add    $0x8,%eax
c01066be:	83 ec 0c             	sub    $0xc,%esp
c01066c1:	50                   	push   %eax
c01066c2:	e8 7e 36 00 00       	call   c0109d45 <initDoubleLinkList>
c01066c7:	83 c4 10             	add    $0x10,%esp
c01066ca:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01066ce:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c01066d2:	0f 8e 44 ff ff ff    	jle    c010661c <init_memory_block_desc+0x12>
c01066d8:	90                   	nop
c01066d9:	c9                   	leave  
c01066da:	c3                   	ret    

c01066db <init_memory2>:
c01066db:	55                   	push   %ebp
c01066dc:	89 e5                	mov    %esp,%ebp
c01066de:	83 ec 38             	sub    $0x38,%esp
c01066e1:	c7 45 f4 00 00 00 02 	movl   $0x2000000,-0xc(%ebp)
c01066e8:	c7 45 f0 00 20 10 00 	movl   $0x102000,-0x10(%ebp)
c01066ef:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01066f2:	a3 b4 06 11 c0       	mov    %eax,0xc01106b4
c01066f7:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01066fa:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c01066ff:	29 c2                	sub    %eax,%edx
c0106701:	89 d0                	mov    %edx,%eax
c0106703:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106706:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106709:	89 c2                	mov    %eax,%edx
c010670b:	c1 ea 1f             	shr    $0x1f,%edx
c010670e:	01 d0                	add    %edx,%eax
c0106710:	d1 f8                	sar    %eax
c0106712:	a3 b8 06 11 c0       	mov    %eax,0xc01106b8
c0106717:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c010671c:	83 ec 0c             	sub    $0xc,%esp
c010671f:	50                   	push   %eax
c0106720:	e8 52 08 00 00       	call   c0106f77 <disp_int>
c0106725:	83 c4 10             	add    $0x10,%esp
c0106728:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c010672d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106730:	29 c2                	sub    %eax,%edx
c0106732:	89 d0                	mov    %edx,%eax
c0106734:	a3 00 0f 11 c0       	mov    %eax,0xc0110f00
c0106739:	83 ec 0c             	sub    $0xc,%esp
c010673c:	68 71 a7 10 c0       	push   $0xc010a771
c0106741:	e8 46 99 ff ff       	call   c010008c <disp_str>
c0106746:	83 c4 10             	add    $0x10,%esp
c0106749:	a1 00 0f 11 c0       	mov    0xc0110f00,%eax
c010674e:	83 ec 0c             	sub    $0xc,%esp
c0106751:	50                   	push   %eax
c0106752:	e8 20 08 00 00       	call   c0106f77 <disp_int>
c0106757:	83 c4 10             	add    $0x10,%esp
c010675a:	83 ec 0c             	sub    $0xc,%esp
c010675d:	68 71 a7 10 c0       	push   $0xc010a771
c0106762:	e8 25 99 ff ff       	call   c010008c <disp_str>
c0106767:	83 c4 10             	add    $0x10,%esp
c010676a:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c010676f:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106774:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c010677a:	85 c0                	test   %eax,%eax
c010677c:	0f 48 c2             	cmovs  %edx,%eax
c010677f:	c1 f8 0c             	sar    $0xc,%eax
c0106782:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106785:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106788:	83 c0 07             	add    $0x7,%eax
c010678b:	8d 50 07             	lea    0x7(%eax),%edx
c010678e:	85 c0                	test   %eax,%eax
c0106790:	0f 48 c2             	cmovs  %edx,%eax
c0106793:	c1 f8 03             	sar    $0x3,%eax
c0106796:	a3 b0 06 11 c0       	mov    %eax,0xc01106b0
c010679b:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c01067a0:	2d 00 00 00 40       	sub    $0x40000000,%eax
c01067a5:	a3 ac 06 11 c0       	mov    %eax,0xc01106ac
c01067aa:	8b 15 b0 06 11 c0    	mov    0xc01106b0,%edx
c01067b0:	a1 ac 06 11 c0       	mov    0xc01106ac,%eax
c01067b5:	83 ec 04             	sub    $0x4,%esp
c01067b8:	52                   	push   %edx
c01067b9:	6a 00                	push   $0x0
c01067bb:	50                   	push   %eax
c01067bc:	e8 2a 4a 00 00       	call   c010b1eb <Memset>
c01067c1:	83 c4 10             	add    $0x10,%esp
c01067c4:	a1 b0 06 11 c0       	mov    0xc01106b0,%eax
c01067c9:	05 ff 0f 00 00       	add    $0xfff,%eax
c01067ce:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c01067d4:	85 c0                	test   %eax,%eax
c01067d6:	0f 48 c2             	cmovs  %edx,%eax
c01067d9:	c1 f8 0c             	sar    $0xc,%eax
c01067dc:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01067df:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01067e2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01067e5:	ff 75 e8             	pushl  -0x18(%ebp)
c01067e8:	6a 01                	push   $0x1
c01067ea:	6a 00                	push   $0x0
c01067ec:	68 ac 06 11 c0       	push   $0xc01106ac
c01067f1:	e8 37 f1 ff ff       	call   c010592d <set_bits>
c01067f6:	83 c4 10             	add    $0x10,%esp
c01067f9:	a1 00 0f 11 c0       	mov    0xc0110f00,%eax
c01067fe:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106803:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106809:	85 c0                	test   %eax,%eax
c010680b:	0f 48 c2             	cmovs  %edx,%eax
c010680e:	c1 f8 0c             	sar    $0xc,%eax
c0106811:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106814:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106817:	83 c0 07             	add    $0x7,%eax
c010681a:	8d 50 07             	lea    0x7(%eax),%edx
c010681d:	85 c0                	test   %eax,%eax
c010681f:	0f 48 c2             	cmovs  %edx,%eax
c0106822:	c1 f8 03             	sar    $0x3,%eax
c0106825:	a3 f8 0e 11 c0       	mov    %eax,0xc0110ef8
c010682a:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c010682f:	8b 15 b0 06 11 c0    	mov    0xc01106b0,%edx
c0106835:	01 d0                	add    %edx,%eax
c0106837:	a3 f4 0e 11 c0       	mov    %eax,0xc0110ef4
c010683c:	8b 15 f8 0e 11 c0    	mov    0xc0110ef8,%edx
c0106842:	a1 f4 0e 11 c0       	mov    0xc0110ef4,%eax
c0106847:	83 ec 04             	sub    $0x4,%esp
c010684a:	52                   	push   %edx
c010684b:	6a 00                	push   $0x0
c010684d:	50                   	push   %eax
c010684e:	e8 98 49 00 00       	call   c010b1eb <Memset>
c0106853:	83 c4 10             	add    $0x10,%esp
c0106856:	a1 f8 0e 11 c0       	mov    0xc0110ef8,%eax
c010685b:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106860:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106866:	85 c0                	test   %eax,%eax
c0106868:	0f 48 c2             	cmovs  %edx,%eax
c010686b:	c1 f8 0c             	sar    $0xc,%eax
c010686e:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106871:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106874:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106877:	ff 75 e8             	pushl  -0x18(%ebp)
c010687a:	6a 01                	push   $0x1
c010687c:	ff 75 e0             	pushl  -0x20(%ebp)
c010687f:	68 ac 06 11 c0       	push   $0xc01106ac
c0106884:	e8 a4 f0 ff ff       	call   c010592d <set_bits>
c0106889:	83 c4 10             	add    $0x10,%esp
c010688c:	c7 45 dc 00 00 10 00 	movl   $0x100000,-0x24(%ebp)
c0106893:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106896:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106899:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010689c:	83 c0 07             	add    $0x7,%eax
c010689f:	8d 50 07             	lea    0x7(%eax),%edx
c01068a2:	85 c0                	test   %eax,%eax
c01068a4:	0f 48 c2             	cmovs  %edx,%eax
c01068a7:	c1 f8 03             	sar    $0x3,%eax
c01068aa:	a3 98 f7 10 c0       	mov    %eax,0xc010f798
c01068af:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c01068b4:	8b 15 b0 06 11 c0    	mov    0xc01106b0,%edx
c01068ba:	01 c2                	add    %eax,%edx
c01068bc:	a1 f8 0e 11 c0       	mov    0xc0110ef8,%eax
c01068c1:	01 d0                	add    %edx,%eax
c01068c3:	a3 94 f7 10 c0       	mov    %eax,0xc010f794
c01068c8:	8b 15 98 f7 10 c0    	mov    0xc010f798,%edx
c01068ce:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c01068d3:	83 ec 04             	sub    $0x4,%esp
c01068d6:	52                   	push   %edx
c01068d7:	6a 00                	push   $0x0
c01068d9:	50                   	push   %eax
c01068da:	e8 0c 49 00 00       	call   c010b1eb <Memset>
c01068df:	83 c4 10             	add    $0x10,%esp
c01068e2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01068e5:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01068e8:	01 d0                	add    %edx,%eax
c01068ea:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01068ed:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c01068f2:	05 ff 0f 00 00       	add    $0xfff,%eax
c01068f7:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c01068fd:	85 c0                	test   %eax,%eax
c01068ff:	0f 48 c2             	cmovs  %edx,%eax
c0106902:	c1 f8 0c             	sar    $0xc,%eax
c0106905:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106908:	ff 75 e8             	pushl  -0x18(%ebp)
c010690b:	6a 01                	push   $0x1
c010690d:	ff 75 e0             	pushl  -0x20(%ebp)
c0106910:	68 ac 06 11 c0       	push   $0xc01106ac
c0106915:	e8 13 f0 ff ff       	call   c010592d <set_bits>
c010691a:	83 c4 10             	add    $0x10,%esp
c010691d:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0106920:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106923:	01 d0                	add    %edx,%eax
c0106925:	c1 e0 0c             	shl    $0xc,%eax
c0106928:	a3 9c f7 10 c0       	mov    %eax,0xc010f79c
c010692d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106930:	83 c0 02             	add    $0x2,%eax
c0106933:	c1 e0 0c             	shl    $0xc,%eax
c0106936:	89 c2                	mov    %eax,%edx
c0106938:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010693b:	01 d0                	add    %edx,%eax
c010693d:	a3 9c f7 10 c0       	mov    %eax,0xc010f79c
c0106942:	c7 45 d8 05 00 00 00 	movl   $0x5,-0x28(%ebp)
c0106949:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010694c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010694f:	90                   	nop
c0106950:	c9                   	leave  
c0106951:	c3                   	ret    

c0106952 <init_memory>:
c0106952:	55                   	push   %ebp
c0106953:	89 e5                	mov    %esp,%ebp
c0106955:	83 ec 38             	sub    $0x38,%esp
c0106958:	c7 45 f4 00 00 02 c0 	movl   $0xc0020000,-0xc(%ebp)
c010695f:	c7 45 f0 00 00 40 c0 	movl   $0xc0400000,-0x10(%ebp)
c0106966:	c7 45 ec 00 00 10 00 	movl   $0x100000,-0x14(%ebp)
c010696d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106970:	05 00 00 40 00       	add    $0x400000,%eax
c0106975:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106978:	8b 45 08             	mov    0x8(%ebp),%eax
c010697b:	2b 45 e8             	sub    -0x18(%ebp),%eax
c010697e:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106984:	85 c0                	test   %eax,%eax
c0106986:	0f 48 c2             	cmovs  %edx,%eax
c0106989:	c1 f8 0c             	sar    $0xc,%eax
c010698c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010698f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106992:	89 c2                	mov    %eax,%edx
c0106994:	c1 ea 1f             	shr    $0x1f,%edx
c0106997:	01 d0                	add    %edx,%eax
c0106999:	d1 f8                	sar    %eax
c010699b:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010699e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01069a1:	2b 45 e0             	sub    -0x20(%ebp),%eax
c01069a4:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01069a7:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01069aa:	8d 50 07             	lea    0x7(%eax),%edx
c01069ad:	85 c0                	test   %eax,%eax
c01069af:	0f 48 c2             	cmovs  %edx,%eax
c01069b2:	c1 f8 03             	sar    $0x3,%eax
c01069b5:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01069b8:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01069bb:	8d 50 07             	lea    0x7(%eax),%edx
c01069be:	85 c0                	test   %eax,%eax
c01069c0:	0f 48 c2             	cmovs  %edx,%eax
c01069c3:	c1 f8 03             	sar    $0x3,%eax
c01069c6:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01069c9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01069cc:	a3 b4 06 11 c0       	mov    %eax,0xc01106b4
c01069d1:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c01069d6:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01069d9:	c1 e2 0c             	shl    $0xc,%edx
c01069dc:	01 d0                	add    %edx,%eax
c01069de:	a3 fc 0e 11 c0       	mov    %eax,0xc0110efc
c01069e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01069e6:	a3 ac 06 11 c0       	mov    %eax,0xc01106ac
c01069eb:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01069ee:	a3 b0 06 11 c0       	mov    %eax,0xc01106b0
c01069f3:	a1 ac 06 11 c0       	mov    0xc01106ac,%eax
c01069f8:	83 ec 04             	sub    $0x4,%esp
c01069fb:	ff 75 d8             	pushl  -0x28(%ebp)
c01069fe:	6a 00                	push   $0x0
c0106a00:	50                   	push   %eax
c0106a01:	e8 e5 47 00 00       	call   c010b1eb <Memset>
c0106a06:	83 c4 10             	add    $0x10,%esp
c0106a09:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106a0c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106a0f:	01 d0                	add    %edx,%eax
c0106a11:	a3 f4 0e 11 c0       	mov    %eax,0xc0110ef4
c0106a16:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106a19:	a3 f8 0e 11 c0       	mov    %eax,0xc0110ef8
c0106a1e:	a1 f4 0e 11 c0       	mov    0xc0110ef4,%eax
c0106a23:	83 ec 04             	sub    $0x4,%esp
c0106a26:	ff 75 d4             	pushl  -0x2c(%ebp)
c0106a29:	6a 00                	push   $0x0
c0106a2b:	50                   	push   %eax
c0106a2c:	e8 ba 47 00 00       	call   c010b1eb <Memset>
c0106a31:	83 c4 10             	add    $0x10,%esp
c0106a34:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106a37:	a3 98 f7 10 c0       	mov    %eax,0xc010f798
c0106a3c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106a3f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106a42:	01 c2                	add    %eax,%edx
c0106a44:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106a47:	01 d0                	add    %edx,%eax
c0106a49:	a3 94 f7 10 c0       	mov    %eax,0xc010f794
c0106a4e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106a51:	05 00 00 10 00       	add    $0x100000,%eax
c0106a56:	a3 9c f7 10 c0       	mov    %eax,0xc010f79c
c0106a5b:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0106a60:	83 ec 04             	sub    $0x4,%esp
c0106a63:	ff 75 d8             	pushl  -0x28(%ebp)
c0106a66:	6a 00                	push   $0x0
c0106a68:	50                   	push   %eax
c0106a69:	e8 7d 47 00 00       	call   c010b1eb <Memset>
c0106a6e:	83 c4 10             	add    $0x10,%esp
c0106a71:	83 ec 04             	sub    $0x4,%esp
c0106a74:	68 f0 00 00 00       	push   $0xf0
c0106a79:	6a 00                	push   $0x0
c0106a7b:	68 e0 37 18 c0       	push   $0xc01837e0
c0106a80:	e8 66 47 00 00       	call   c010b1eb <Memset>
c0106a85:	83 c4 10             	add    $0x10,%esp
c0106a88:	83 ec 0c             	sub    $0xc,%esp
c0106a8b:	68 e0 37 18 c0       	push   $0xc01837e0
c0106a90:	e8 75 fb ff ff       	call   c010660a <init_memory_block_desc>
c0106a95:	83 c4 10             	add    $0x10,%esp
c0106a98:	90                   	nop
c0106a99:	c9                   	leave  
c0106a9a:	c3                   	ret    

c0106a9b <stop_here>:
c0106a9b:	55                   	push   %ebp
c0106a9c:	89 e5                	mov    %esp,%ebp
c0106a9e:	83 ec 08             	sub    $0x8,%esp
c0106aa1:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0106aa8:	00 00 00 
c0106aab:	83 ec 0c             	sub    $0xc,%esp
c0106aae:	68 80 a7 10 c0       	push   $0xc010a780
c0106ab3:	e8 d4 95 ff ff       	call   c010008c <disp_str>
c0106ab8:	83 c4 10             	add    $0x10,%esp
c0106abb:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0106ac0:	83 ec 0c             	sub    $0xc,%esp
c0106ac3:	50                   	push   %eax
c0106ac4:	e8 ae 04 00 00       	call   c0106f77 <disp_int>
c0106ac9:	83 c4 10             	add    $0x10,%esp
c0106acc:	83 ec 0c             	sub    $0xc,%esp
c0106acf:	68 82 a7 10 c0       	push   $0xc010a782
c0106ad4:	e8 b3 95 ff ff       	call   c010008c <disp_str>
c0106ad9:	83 c4 10             	add    $0x10,%esp
c0106adc:	90                   	nop
c0106add:	c9                   	leave  
c0106ade:	c3                   	ret    

c0106adf <catch_error>:
c0106adf:	55                   	push   %ebp
c0106ae0:	89 e5                	mov    %esp,%ebp
c0106ae2:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0106ae7:	83 c0 01             	add    $0x1,%eax
c0106aea:	a3 c4 fb 10 c0       	mov    %eax,0xc010fbc4
c0106aef:	a1 a4 f7 10 c0       	mov    0xc010f7a4,%eax
c0106af4:	a3 a0 f7 10 c0       	mov    %eax,0xc010f7a0
c0106af9:	90                   	nop
c0106afa:	5d                   	pop    %ebp
c0106afb:	c3                   	ret    

c0106afc <intr_enable>:
c0106afc:	55                   	push   %ebp
c0106afd:	89 e5                	mov    %esp,%ebp
c0106aff:	83 ec 18             	sub    $0x18,%esp
c0106b02:	e8 65 00 00 00       	call   c0106b6c <intr_get_status>
c0106b07:	83 f8 01             	cmp    $0x1,%eax
c0106b0a:	75 0c                	jne    c0106b18 <intr_enable+0x1c>
c0106b0c:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0106b13:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106b16:	eb 0b                	jmp    c0106b23 <intr_enable+0x27>
c0106b18:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106b1f:	fb                   	sti    
c0106b20:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106b23:	c9                   	leave  
c0106b24:	c3                   	ret    

c0106b25 <intr_disable>:
c0106b25:	55                   	push   %ebp
c0106b26:	89 e5                	mov    %esp,%ebp
c0106b28:	83 ec 18             	sub    $0x18,%esp
c0106b2b:	e8 3c 00 00 00       	call   c0106b6c <intr_get_status>
c0106b30:	83 f8 01             	cmp    $0x1,%eax
c0106b33:	75 0d                	jne    c0106b42 <intr_disable+0x1d>
c0106b35:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0106b3c:	fa                   	cli    
c0106b3d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106b40:	eb 0a                	jmp    c0106b4c <intr_disable+0x27>
c0106b42:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106b49:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106b4c:	c9                   	leave  
c0106b4d:	c3                   	ret    

c0106b4e <intr_set_status>:
c0106b4e:	55                   	push   %ebp
c0106b4f:	89 e5                	mov    %esp,%ebp
c0106b51:	83 ec 08             	sub    $0x8,%esp
c0106b54:	8b 45 08             	mov    0x8(%ebp),%eax
c0106b57:	83 e0 01             	and    $0x1,%eax
c0106b5a:	85 c0                	test   %eax,%eax
c0106b5c:	74 07                	je     c0106b65 <intr_set_status+0x17>
c0106b5e:	e8 99 ff ff ff       	call   c0106afc <intr_enable>
c0106b63:	eb 05                	jmp    c0106b6a <intr_set_status+0x1c>
c0106b65:	e8 bb ff ff ff       	call   c0106b25 <intr_disable>
c0106b6a:	c9                   	leave  
c0106b6b:	c3                   	ret    

c0106b6c <intr_get_status>:
c0106b6c:	55                   	push   %ebp
c0106b6d:	89 e5                	mov    %esp,%ebp
c0106b6f:	83 ec 10             	sub    $0x10,%esp
c0106b72:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0106b79:	9c                   	pushf  
c0106b7a:	58                   	pop    %eax
c0106b7b:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0106b7e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106b81:	c1 e8 09             	shr    $0x9,%eax
c0106b84:	83 e0 01             	and    $0x1,%eax
c0106b87:	c9                   	leave  
c0106b88:	c3                   	ret    

c0106b89 <Memcpy>:
c0106b89:	55                   	push   %ebp
c0106b8a:	89 e5                	mov    %esp,%ebp
c0106b8c:	83 ec 18             	sub    $0x18,%esp
c0106b8f:	e8 91 ff ff ff       	call   c0106b25 <intr_disable>
c0106b94:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106b97:	83 ec 04             	sub    $0x4,%esp
c0106b9a:	ff 75 10             	pushl  0x10(%ebp)
c0106b9d:	ff 75 0c             	pushl  0xc(%ebp)
c0106ba0:	ff 75 08             	pushl  0x8(%ebp)
c0106ba3:	e8 15 46 00 00       	call   c010b1bd <Memcpy2>
c0106ba8:	83 c4 10             	add    $0x10,%esp
c0106bab:	83 ec 0c             	sub    $0xc,%esp
c0106bae:	ff 75 f4             	pushl  -0xc(%ebp)
c0106bb1:	e8 98 ff ff ff       	call   c0106b4e <intr_set_status>
c0106bb6:	83 c4 10             	add    $0x10,%esp
c0106bb9:	90                   	nop
c0106bba:	c9                   	leave  
c0106bbb:	c3                   	ret    

c0106bbc <untar>:
c0106bbc:	55                   	push   %ebp
c0106bbd:	89 e5                	mov    %esp,%ebp
c0106bbf:	81 ec 48 0a 00 00    	sub    $0xa48,%esp
c0106bc5:	83 ec 08             	sub    $0x8,%esp
c0106bc8:	6a 00                	push   $0x0
c0106bca:	ff 75 08             	pushl  0x8(%ebp)
c0106bcd:	e8 2a de ff ff       	call   c01049fc <open>
c0106bd2:	83 c4 10             	add    $0x10,%esp
c0106bd5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106bd8:	83 ec 0c             	sub    $0xc,%esp
c0106bdb:	68 84 a7 10 c0       	push   $0xc010a784
c0106be0:	e8 76 16 00 00       	call   c010825b <Printf>
c0106be5:	83 c4 10             	add    $0x10,%esp
c0106be8:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0106bef:	c7 45 dc 00 02 00 00 	movl   $0x200,-0x24(%ebp)
c0106bf6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106bfd:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0106c04:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0106c0b:	e9 63 02 00 00       	jmp    c0106e73 <untar+0x2b7>
c0106c10:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0106c14:	7e 58                	jle    c0106c6e <untar+0xb2>
c0106c16:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106c19:	05 ff 01 00 00       	add    $0x1ff,%eax
c0106c1e:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0106c24:	85 c0                	test   %eax,%eax
c0106c26:	0f 48 c2             	cmovs  %edx,%eax
c0106c29:	c1 f8 09             	sar    $0x9,%eax
c0106c2c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106c2f:	83 ec 04             	sub    $0x4,%esp
c0106c32:	68 00 02 00 00       	push   $0x200
c0106c37:	6a 00                	push   $0x0
c0106c39:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106c3f:	50                   	push   %eax
c0106c40:	e8 a6 45 00 00       	call   c010b1eb <Memset>
c0106c45:	83 c4 10             	add    $0x10,%esp
c0106c48:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106c4b:	c1 e0 09             	shl    $0x9,%eax
c0106c4e:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0106c51:	83 ec 04             	sub    $0x4,%esp
c0106c54:	50                   	push   %eax
c0106c55:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106c5b:	50                   	push   %eax
c0106c5c:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106c5f:	e8 2d de ff ff       	call   c0104a91 <read>
c0106c64:	83 c4 10             	add    $0x10,%esp
c0106c67:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106c6e:	83 ec 04             	sub    $0x4,%esp
c0106c71:	68 00 02 00 00       	push   $0x200
c0106c76:	6a 00                	push   $0x0
c0106c78:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106c7e:	50                   	push   %eax
c0106c7f:	e8 67 45 00 00       	call   c010b1eb <Memset>
c0106c84:	83 c4 10             	add    $0x10,%esp
c0106c87:	83 ec 04             	sub    $0x4,%esp
c0106c8a:	68 00 02 00 00       	push   $0x200
c0106c8f:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106c95:	50                   	push   %eax
c0106c96:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106c99:	e8 f3 dd ff ff       	call   c0104a91 <read>
c0106c9e:	83 c4 10             	add    $0x10,%esp
c0106ca1:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0106ca4:	83 ec 0c             	sub    $0xc,%esp
c0106ca7:	68 96 a7 10 c0       	push   $0xc010a796
c0106cac:	e8 aa 15 00 00       	call   c010825b <Printf>
c0106cb1:	83 c4 10             	add    $0x10,%esp
c0106cb4:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0106cb8:	0f 84 c1 01 00 00    	je     c0106e7f <untar+0x2c3>
c0106cbe:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106cc1:	01 45 f4             	add    %eax,-0xc(%ebp)
c0106cc4:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0106ccb:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106cd1:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0106cd4:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106cd7:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0106cda:	83 ec 08             	sub    $0x8,%esp
c0106cdd:	6a 07                	push   $0x7
c0106cdf:	ff 75 cc             	pushl  -0x34(%ebp)
c0106ce2:	e8 15 dd ff ff       	call   c01049fc <open>
c0106ce7:	83 c4 10             	add    $0x10,%esp
c0106cea:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0106ced:	83 ec 0c             	sub    $0xc,%esp
c0106cf0:	68 a8 a7 10 c0       	push   $0xc010a7a8
c0106cf5:	e8 61 15 00 00       	call   c010825b <Printf>
c0106cfa:	83 c4 10             	add    $0x10,%esp
c0106cfd:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0106d04:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106d07:	83 c0 7c             	add    $0x7c,%eax
c0106d0a:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0106d0d:	83 ec 0c             	sub    $0xc,%esp
c0106d10:	ff 75 cc             	pushl  -0x34(%ebp)
c0106d13:	e8 0c 45 00 00       	call   c010b224 <Strlen>
c0106d18:	83 c4 10             	add    $0x10,%esp
c0106d1b:	85 c0                	test   %eax,%eax
c0106d1d:	75 28                	jne    c0106d47 <untar+0x18b>
c0106d1f:	83 ec 0c             	sub    $0xc,%esp
c0106d22:	ff 75 c4             	pushl  -0x3c(%ebp)
c0106d25:	e8 fa 44 00 00       	call   c010b224 <Strlen>
c0106d2a:	83 c4 10             	add    $0x10,%esp
c0106d2d:	85 c0                	test   %eax,%eax
c0106d2f:	75 16                	jne    c0106d47 <untar+0x18b>
c0106d31:	83 ec 0c             	sub    $0xc,%esp
c0106d34:	68 ba a7 10 c0       	push   $0xc010a7ba
c0106d39:	e8 1d 15 00 00       	call   c010825b <Printf>
c0106d3e:	83 c4 10             	add    $0x10,%esp
c0106d41:	90                   	nop
c0106d42:	e9 39 01 00 00       	jmp    c0106e80 <untar+0x2c4>
c0106d47:	83 ec 0c             	sub    $0xc,%esp
c0106d4a:	68 c1 a7 10 c0       	push   $0xc010a7c1
c0106d4f:	e8 07 15 00 00       	call   c010825b <Printf>
c0106d54:	83 c4 10             	add    $0x10,%esp
c0106d57:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0106d5a:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106d5d:	eb 1f                	jmp    c0106d7e <untar+0x1c2>
c0106d5f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106d62:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0106d69:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106d6c:	0f b6 00             	movzbl (%eax),%eax
c0106d6f:	0f be c0             	movsbl %al,%eax
c0106d72:	83 e8 30             	sub    $0x30,%eax
c0106d75:	01 d0                	add    %edx,%eax
c0106d77:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106d7a:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0106d7e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106d81:	0f b6 00             	movzbl (%eax),%eax
c0106d84:	84 c0                	test   %al,%al
c0106d86:	75 d7                	jne    c0106d5f <untar+0x1a3>
c0106d88:	83 ec 0c             	sub    $0xc,%esp
c0106d8b:	68 cf a7 10 c0       	push   $0xc010a7cf
c0106d90:	e8 c6 14 00 00       	call   c010825b <Printf>
c0106d95:	83 c4 10             	add    $0x10,%esp
c0106d98:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106d9b:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0106d9e:	c7 45 bc 00 08 00 00 	movl   $0x800,-0x44(%ebp)
c0106da5:	83 ec 08             	sub    $0x8,%esp
c0106da8:	ff 75 c0             	pushl  -0x40(%ebp)
c0106dab:	68 dd a7 10 c0       	push   $0xc010a7dd
c0106db0:	e8 a6 14 00 00       	call   c010825b <Printf>
c0106db5:	83 c4 10             	add    $0x10,%esp
c0106db8:	83 ec 08             	sub    $0x8,%esp
c0106dbb:	ff 75 c0             	pushl  -0x40(%ebp)
c0106dbe:	68 ef a7 10 c0       	push   $0xc010a7ef
c0106dc3:	e8 93 14 00 00       	call   c010825b <Printf>
c0106dc8:	83 c4 10             	add    $0x10,%esp
c0106dcb:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0106dce:	39 45 bc             	cmp    %eax,-0x44(%ebp)
c0106dd1:	0f 4e 45 bc          	cmovle -0x44(%ebp),%eax
c0106dd5:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0106dd8:	e8 02 fd ff ff       	call   c0106adf <catch_error>
c0106ddd:	83 ec 04             	sub    $0x4,%esp
c0106de0:	ff 75 b8             	pushl  -0x48(%ebp)
c0106de3:	8d 85 b8 f5 ff ff    	lea    -0xa48(%ebp),%eax
c0106de9:	50                   	push   %eax
c0106dea:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106ded:	e8 9f dc ff ff       	call   c0104a91 <read>
c0106df2:	83 c4 10             	add    $0x10,%esp
c0106df5:	01 45 f4             	add    %eax,-0xc(%ebp)
c0106df8:	83 ec 04             	sub    $0x4,%esp
c0106dfb:	ff 75 b8             	pushl  -0x48(%ebp)
c0106dfe:	8d 85 b8 f5 ff ff    	lea    -0xa48(%ebp),%eax
c0106e04:	50                   	push   %eax
c0106e05:	ff 75 c8             	pushl  -0x38(%ebp)
c0106e08:	e8 05 de ff ff       	call   c0104c12 <write>
c0106e0d:	83 c4 10             	add    $0x10,%esp
c0106e10:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106e13:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0106e16:	7d 02                	jge    c0106e1a <untar+0x25e>
c0106e18:	eb be                	jmp    c0106dd8 <untar+0x21c>
c0106e1a:	90                   	nop
c0106e1b:	83 ec 08             	sub    $0x8,%esp
c0106e1e:	ff 75 f4             	pushl  -0xc(%ebp)
c0106e21:	68 01 a8 10 c0       	push   $0xc010a801
c0106e26:	e8 30 14 00 00       	call   c010825b <Printf>
c0106e2b:	83 c4 10             	add    $0x10,%esp
c0106e2e:	83 ec 08             	sub    $0x8,%esp
c0106e31:	ff 75 c0             	pushl  -0x40(%ebp)
c0106e34:	68 13 a8 10 c0       	push   $0xc010a813
c0106e39:	e8 1d 14 00 00       	call   c010825b <Printf>
c0106e3e:	83 c4 10             	add    $0x10,%esp
c0106e41:	83 ec 0c             	sub    $0xc,%esp
c0106e44:	68 24 a8 10 c0       	push   $0xc010a824
c0106e49:	e8 0d 14 00 00       	call   c010825b <Printf>
c0106e4e:	83 c4 10             	add    $0x10,%esp
c0106e51:	83 ec 0c             	sub    $0xc,%esp
c0106e54:	ff 75 c8             	pushl  -0x38(%ebp)
c0106e57:	e8 3b de ff ff       	call   c0104c97 <close>
c0106e5c:	83 c4 10             	add    $0x10,%esp
c0106e5f:	83 ec 0c             	sub    $0xc,%esp
c0106e62:	68 32 a8 10 c0       	push   $0xc010a832
c0106e67:	e8 ef 13 00 00       	call   c010825b <Printf>
c0106e6c:	83 c4 10             	add    $0x10,%esp
c0106e6f:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c0106e73:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0106e77:	0f 8f 93 fd ff ff    	jg     c0106c10 <untar+0x54>
c0106e7d:	eb 01                	jmp    c0106e80 <untar+0x2c4>
c0106e7f:	90                   	nop
c0106e80:	83 ec 0c             	sub    $0xc,%esp
c0106e83:	68 3f a8 10 c0       	push   $0xc010a83f
c0106e88:	e8 ce 13 00 00       	call   c010825b <Printf>
c0106e8d:	83 c4 10             	add    $0x10,%esp
c0106e90:	83 ec 0c             	sub    $0xc,%esp
c0106e93:	68 51 a8 10 c0       	push   $0xc010a851
c0106e98:	e8 be 13 00 00       	call   c010825b <Printf>
c0106e9d:	83 c4 10             	add    $0x10,%esp
c0106ea0:	83 ec 0c             	sub    $0xc,%esp
c0106ea3:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106ea6:	e8 ec dd ff ff       	call   c0104c97 <close>
c0106eab:	83 c4 10             	add    $0x10,%esp
c0106eae:	83 ec 0c             	sub    $0xc,%esp
c0106eb1:	68 61 a8 10 c0       	push   $0xc010a861
c0106eb6:	e8 a0 13 00 00       	call   c010825b <Printf>
c0106ebb:	83 c4 10             	add    $0x10,%esp
c0106ebe:	83 ec 0c             	sub    $0xc,%esp
c0106ec1:	68 74 a8 10 c0       	push   $0xc010a874
c0106ec6:	e8 90 13 00 00       	call   c010825b <Printf>
c0106ecb:	83 c4 10             	add    $0x10,%esp
c0106ece:	90                   	nop
c0106ecf:	c9                   	leave  
c0106ed0:	c3                   	ret    

c0106ed1 <atoi>:
c0106ed1:	55                   	push   %ebp
c0106ed2:	89 e5                	mov    %esp,%ebp
c0106ed4:	83 ec 10             	sub    $0x10,%esp
c0106ed7:	8b 45 08             	mov    0x8(%ebp),%eax
c0106eda:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0106edd:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106ee0:	8d 50 01             	lea    0x1(%eax),%edx
c0106ee3:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0106ee6:	c6 00 30             	movb   $0x30,(%eax)
c0106ee9:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106eec:	8d 50 01             	lea    0x1(%eax),%edx
c0106eef:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0106ef2:	c6 00 78             	movb   $0x78,(%eax)
c0106ef5:	c6 45 fa 00          	movb   $0x0,-0x6(%ebp)
c0106ef9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0106efd:	75 0e                	jne    c0106f0d <atoi+0x3c>
c0106eff:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106f02:	8d 50 01             	lea    0x1(%eax),%edx
c0106f05:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0106f08:	c6 00 30             	movb   $0x30,(%eax)
c0106f0b:	eb 61                	jmp    c0106f6e <atoi+0x9d>
c0106f0d:	c7 45 f4 1c 00 00 00 	movl   $0x1c,-0xc(%ebp)
c0106f14:	eb 52                	jmp    c0106f68 <atoi+0x97>
c0106f16:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106f19:	8b 55 0c             	mov    0xc(%ebp),%edx
c0106f1c:	89 c1                	mov    %eax,%ecx
c0106f1e:	d3 fa                	sar    %cl,%edx
c0106f20:	89 d0                	mov    %edx,%eax
c0106f22:	83 e0 0f             	and    $0xf,%eax
c0106f25:	88 45 fb             	mov    %al,-0x5(%ebp)
c0106f28:	80 7d fa 00          	cmpb   $0x0,-0x6(%ebp)
c0106f2c:	75 06                	jne    c0106f34 <atoi+0x63>
c0106f2e:	80 7d fb 00          	cmpb   $0x0,-0x5(%ebp)
c0106f32:	74 2f                	je     c0106f63 <atoi+0x92>
c0106f34:	c6 45 fa 01          	movb   $0x1,-0x6(%ebp)
c0106f38:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0106f3c:	83 c0 30             	add    $0x30,%eax
c0106f3f:	88 45 fb             	mov    %al,-0x5(%ebp)
c0106f42:	80 7d fb 39          	cmpb   $0x39,-0x5(%ebp)
c0106f46:	7e 0a                	jle    c0106f52 <atoi+0x81>
c0106f48:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0106f4c:	83 c0 07             	add    $0x7,%eax
c0106f4f:	88 45 fb             	mov    %al,-0x5(%ebp)
c0106f52:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106f55:	8d 50 01             	lea    0x1(%eax),%edx
c0106f58:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0106f5b:	0f b6 55 fb          	movzbl -0x5(%ebp),%edx
c0106f5f:	88 10                	mov    %dl,(%eax)
c0106f61:	eb 01                	jmp    c0106f64 <atoi+0x93>
c0106f63:	90                   	nop
c0106f64:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c0106f68:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0106f6c:	79 a8                	jns    c0106f16 <atoi+0x45>
c0106f6e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106f71:	c6 00 00             	movb   $0x0,(%eax)
c0106f74:	90                   	nop
c0106f75:	c9                   	leave  
c0106f76:	c3                   	ret    

c0106f77 <disp_int>:
c0106f77:	55                   	push   %ebp
c0106f78:	89 e5                	mov    %esp,%ebp
c0106f7a:	83 ec 18             	sub    $0x18,%esp
c0106f7d:	ff 75 08             	pushl  0x8(%ebp)
c0106f80:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0106f83:	50                   	push   %eax
c0106f84:	e8 48 ff ff ff       	call   c0106ed1 <atoi>
c0106f89:	83 c4 08             	add    $0x8,%esp
c0106f8c:	83 ec 08             	sub    $0x8,%esp
c0106f8f:	6a 0b                	push   $0xb
c0106f91:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0106f94:	50                   	push   %eax
c0106f95:	e8 2d 91 ff ff       	call   c01000c7 <disp_str_colour>
c0106f9a:	83 c4 10             	add    $0x10,%esp
c0106f9d:	90                   	nop
c0106f9e:	c9                   	leave  
c0106f9f:	c3                   	ret    

c0106fa0 <do_page_fault>:
c0106fa0:	55                   	push   %ebp
c0106fa1:	89 e5                	mov    %esp,%ebp
c0106fa3:	83 ec 28             	sub    $0x28,%esp
c0106fa6:	0f 20 d0             	mov    %cr2,%eax
c0106fa9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106fac:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0106fb3:	00 00 00 
c0106fb6:	83 ec 0c             	sub    $0xc,%esp
c0106fb9:	68 7f a8 10 c0       	push   $0xc010a87f
c0106fbe:	e8 c9 90 ff ff       	call   c010008c <disp_str>
c0106fc3:	83 c4 10             	add    $0x10,%esp
c0106fc6:	83 ec 0c             	sub    $0xc,%esp
c0106fc9:	68 8e a8 10 c0       	push   $0xc010a88e
c0106fce:	e8 b9 90 ff ff       	call   c010008c <disp_str>
c0106fd3:	83 c4 10             	add    $0x10,%esp
c0106fd6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106fd9:	83 ec 0c             	sub    $0xc,%esp
c0106fdc:	50                   	push   %eax
c0106fdd:	e8 95 ff ff ff       	call   c0106f77 <disp_int>
c0106fe2:	83 c4 10             	add    $0x10,%esp
c0106fe5:	83 ec 0c             	sub    $0xc,%esp
c0106fe8:	68 93 a8 10 c0       	push   $0xc010a893
c0106fed:	e8 9a 90 ff ff       	call   c010008c <disp_str>
c0106ff2:	83 c4 10             	add    $0x10,%esp
c0106ff5:	83 ec 0c             	sub    $0xc,%esp
c0106ff8:	ff 75 f4             	pushl  -0xc(%ebp)
c0106ffb:	e8 51 ec ff ff       	call   c0105c51 <ptr_pde>
c0107000:	83 c4 10             	add    $0x10,%esp
c0107003:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107006:	83 ec 0c             	sub    $0xc,%esp
c0107009:	ff 75 f4             	pushl  -0xc(%ebp)
c010700c:	e8 53 ec ff ff       	call   c0105c64 <ptr_pte>
c0107011:	83 c4 10             	add    $0x10,%esp
c0107014:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0107017:	83 ec 0c             	sub    $0xc,%esp
c010701a:	68 95 a8 10 c0       	push   $0xc010a895
c010701f:	e8 68 90 ff ff       	call   c010008c <disp_str>
c0107024:	83 c4 10             	add    $0x10,%esp
c0107027:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010702a:	83 ec 0c             	sub    $0xc,%esp
c010702d:	50                   	push   %eax
c010702e:	e8 44 ff ff ff       	call   c0106f77 <disp_int>
c0107033:	83 c4 10             	add    $0x10,%esp
c0107036:	83 ec 0c             	sub    $0xc,%esp
c0107039:	68 9a a8 10 c0       	push   $0xc010a89a
c010703e:	e8 49 90 ff ff       	call   c010008c <disp_str>
c0107043:	83 c4 10             	add    $0x10,%esp
c0107046:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0107049:	8b 00                	mov    (%eax),%eax
c010704b:	83 ec 0c             	sub    $0xc,%esp
c010704e:	50                   	push   %eax
c010704f:	e8 23 ff ff ff       	call   c0106f77 <disp_int>
c0107054:	83 c4 10             	add    $0x10,%esp
c0107057:	83 ec 0c             	sub    $0xc,%esp
c010705a:	68 93 a8 10 c0       	push   $0xc010a893
c010705f:	e8 28 90 ff ff       	call   c010008c <disp_str>
c0107064:	83 c4 10             	add    $0x10,%esp
c0107067:	83 ec 0c             	sub    $0xc,%esp
c010706a:	68 a3 a8 10 c0       	push   $0xc010a8a3
c010706f:	e8 18 90 ff ff       	call   c010008c <disp_str>
c0107074:	83 c4 10             	add    $0x10,%esp
c0107077:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010707a:	83 ec 0c             	sub    $0xc,%esp
c010707d:	50                   	push   %eax
c010707e:	e8 f4 fe ff ff       	call   c0106f77 <disp_int>
c0107083:	83 c4 10             	add    $0x10,%esp
c0107086:	83 ec 0c             	sub    $0xc,%esp
c0107089:	68 a8 a8 10 c0       	push   $0xc010a8a8
c010708e:	e8 f9 8f ff ff       	call   c010008c <disp_str>
c0107093:	83 c4 10             	add    $0x10,%esp
c0107096:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0107099:	8b 00                	mov    (%eax),%eax
c010709b:	83 ec 0c             	sub    $0xc,%esp
c010709e:	50                   	push   %eax
c010709f:	e8 d3 fe ff ff       	call   c0106f77 <disp_int>
c01070a4:	83 c4 10             	add    $0x10,%esp
c01070a7:	83 ec 0c             	sub    $0xc,%esp
c01070aa:	68 93 a8 10 c0       	push   $0xc010a893
c01070af:	e8 d8 8f ff ff       	call   c010008c <disp_str>
c01070b4:	83 c4 10             	add    $0x10,%esp
c01070b7:	c7 45 e8 00 00 10 00 	movl   $0x100000,-0x18(%ebp)
c01070be:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01070c1:	8b 00                	mov    (%eax),%eax
c01070c3:	83 e0 01             	and    $0x1,%eax
c01070c6:	85 c0                	test   %eax,%eax
c01070c8:	74 09                	je     c01070d3 <do_page_fault+0x133>
c01070ca:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
c01070d1:	eb 07                	jmp    c01070da <do_page_fault+0x13a>
c01070d3:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01070da:	90                   	nop
c01070db:	c9                   	leave  
c01070dc:	c3                   	ret    

c01070dd <exception_handler>:
c01070dd:	55                   	push   %ebp
c01070de:	89 e5                	mov    %esp,%ebp
c01070e0:	57                   	push   %edi
c01070e1:	56                   	push   %esi
c01070e2:	53                   	push   %ebx
c01070e3:	83 ec 6c             	sub    $0x6c,%esp
c01070e6:	8d 45 8c             	lea    -0x74(%ebp),%eax
c01070e9:	bb 20 ab 10 c0       	mov    $0xc010ab20,%ebx
c01070ee:	ba 13 00 00 00       	mov    $0x13,%edx
c01070f3:	89 c7                	mov    %eax,%edi
c01070f5:	89 de                	mov    %ebx,%esi
c01070f7:	89 d1                	mov    %edx,%ecx
c01070f9:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c01070fb:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0107102:	eb 04                	jmp    c0107108 <exception_handler+0x2b>
c0107104:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0107108:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c010710f:	7e f3                	jle    c0107104 <exception_handler+0x27>
c0107111:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0107118:	00 00 00 
c010711b:	83 ec 0c             	sub    $0xc,%esp
c010711e:	68 b1 a8 10 c0       	push   $0xc010a8b1
c0107123:	e8 64 8f ff ff       	call   c010008c <disp_str>
c0107128:	83 c4 10             	add    $0x10,%esp
c010712b:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c0107132:	8b 45 08             	mov    0x8(%ebp),%eax
c0107135:	8b 44 85 8c          	mov    -0x74(%ebp,%eax,4),%eax
c0107139:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010713c:	83 ec 0c             	sub    $0xc,%esp
c010713f:	ff 75 dc             	pushl  -0x24(%ebp)
c0107142:	e8 45 8f ff ff       	call   c010008c <disp_str>
c0107147:	83 c4 10             	add    $0x10,%esp
c010714a:	83 ec 0c             	sub    $0xc,%esp
c010714d:	68 bf a8 10 c0       	push   $0xc010a8bf
c0107152:	e8 35 8f ff ff       	call   c010008c <disp_str>
c0107157:	83 c4 10             	add    $0x10,%esp
c010715a:	83 ec 0c             	sub    $0xc,%esp
c010715d:	68 c2 a8 10 c0       	push   $0xc010a8c2
c0107162:	e8 25 8f ff ff       	call   c010008c <disp_str>
c0107167:	83 c4 10             	add    $0x10,%esp
c010716a:	8b 45 08             	mov    0x8(%ebp),%eax
c010716d:	83 ec 0c             	sub    $0xc,%esp
c0107170:	50                   	push   %eax
c0107171:	e8 01 fe ff ff       	call   c0106f77 <disp_int>
c0107176:	83 c4 10             	add    $0x10,%esp
c0107179:	83 ec 0c             	sub    $0xc,%esp
c010717c:	68 bf a8 10 c0       	push   $0xc010a8bf
c0107181:	e8 06 8f ff ff       	call   c010008c <disp_str>
c0107186:	83 c4 10             	add    $0x10,%esp
c0107189:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c010718d:	74 2f                	je     c01071be <exception_handler+0xe1>
c010718f:	83 ec 0c             	sub    $0xc,%esp
c0107192:	68 ca a8 10 c0       	push   $0xc010a8ca
c0107197:	e8 f0 8e ff ff       	call   c010008c <disp_str>
c010719c:	83 c4 10             	add    $0x10,%esp
c010719f:	8b 45 0c             	mov    0xc(%ebp),%eax
c01071a2:	83 ec 0c             	sub    $0xc,%esp
c01071a5:	50                   	push   %eax
c01071a6:	e8 cc fd ff ff       	call   c0106f77 <disp_int>
c01071ab:	83 c4 10             	add    $0x10,%esp
c01071ae:	83 ec 0c             	sub    $0xc,%esp
c01071b1:	68 bf a8 10 c0       	push   $0xc010a8bf
c01071b6:	e8 d1 8e ff ff       	call   c010008c <disp_str>
c01071bb:	83 c4 10             	add    $0x10,%esp
c01071be:	83 ec 0c             	sub    $0xc,%esp
c01071c1:	68 d4 a8 10 c0       	push   $0xc010a8d4
c01071c6:	e8 c1 8e ff ff       	call   c010008c <disp_str>
c01071cb:	83 c4 10             	add    $0x10,%esp
c01071ce:	83 ec 0c             	sub    $0xc,%esp
c01071d1:	ff 75 14             	pushl  0x14(%ebp)
c01071d4:	e8 9e fd ff ff       	call   c0106f77 <disp_int>
c01071d9:	83 c4 10             	add    $0x10,%esp
c01071dc:	83 ec 0c             	sub    $0xc,%esp
c01071df:	68 bf a8 10 c0       	push   $0xc010a8bf
c01071e4:	e8 a3 8e ff ff       	call   c010008c <disp_str>
c01071e9:	83 c4 10             	add    $0x10,%esp
c01071ec:	83 ec 0c             	sub    $0xc,%esp
c01071ef:	68 d8 a8 10 c0       	push   $0xc010a8d8
c01071f4:	e8 93 8e ff ff       	call   c010008c <disp_str>
c01071f9:	83 c4 10             	add    $0x10,%esp
c01071fc:	8b 45 10             	mov    0x10(%ebp),%eax
c01071ff:	83 ec 0c             	sub    $0xc,%esp
c0107202:	50                   	push   %eax
c0107203:	e8 6f fd ff ff       	call   c0106f77 <disp_int>
c0107208:	83 c4 10             	add    $0x10,%esp
c010720b:	83 ec 0c             	sub    $0xc,%esp
c010720e:	68 bf a8 10 c0       	push   $0xc010a8bf
c0107213:	e8 74 8e ff ff       	call   c010008c <disp_str>
c0107218:	83 c4 10             	add    $0x10,%esp
c010721b:	83 ec 0c             	sub    $0xc,%esp
c010721e:	68 dd a8 10 c0       	push   $0xc010a8dd
c0107223:	e8 64 8e ff ff       	call   c010008c <disp_str>
c0107228:	83 c4 10             	add    $0x10,%esp
c010722b:	83 ec 0c             	sub    $0xc,%esp
c010722e:	ff 75 18             	pushl  0x18(%ebp)
c0107231:	e8 41 fd ff ff       	call   c0106f77 <disp_int>
c0107236:	83 c4 10             	add    $0x10,%esp
c0107239:	83 ec 0c             	sub    $0xc,%esp
c010723c:	68 bf a8 10 c0       	push   $0xc010a8bf
c0107241:	e8 46 8e ff ff       	call   c010008c <disp_str>
c0107246:	83 c4 10             	add    $0x10,%esp
c0107249:	83 ec 0c             	sub    $0xc,%esp
c010724c:	68 e8 a8 10 c0       	push   $0xc010a8e8
c0107251:	e8 36 8e ff ff       	call   c010008c <disp_str>
c0107256:	83 c4 10             	add    $0x10,%esp
c0107259:	83 7d 08 0e          	cmpl   $0xe,0x8(%ebp)
c010725d:	75 45                	jne    c01072a4 <exception_handler+0x1c7>
c010725f:	0f 20 d0             	mov    %cr2,%eax
c0107262:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0107265:	83 ec 0c             	sub    $0xc,%esp
c0107268:	68 07 a9 10 c0       	push   $0xc010a907
c010726d:	e8 1a 8e ff ff       	call   c010008c <disp_str>
c0107272:	83 c4 10             	add    $0x10,%esp
c0107275:	83 ec 0c             	sub    $0xc,%esp
c0107278:	68 8e a8 10 c0       	push   $0xc010a88e
c010727d:	e8 0a 8e ff ff       	call   c010008c <disp_str>
c0107282:	83 c4 10             	add    $0x10,%esp
c0107285:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0107288:	83 ec 0c             	sub    $0xc,%esp
c010728b:	50                   	push   %eax
c010728c:	e8 e6 fc ff ff       	call   c0106f77 <disp_int>
c0107291:	83 c4 10             	add    $0x10,%esp
c0107294:	83 ec 0c             	sub    $0xc,%esp
c0107297:	68 93 a8 10 c0       	push   $0xc010a893
c010729c:	e8 eb 8d ff ff       	call   c010008c <disp_str>
c01072a1:	83 c4 10             	add    $0x10,%esp
c01072a4:	83 7d 08 0d          	cmpl   $0xd,0x8(%ebp)
c01072a8:	75 11                	jne    c01072bb <exception_handler+0x1de>
c01072aa:	83 ec 0c             	sub    $0xc,%esp
c01072ad:	68 13 a9 10 c0       	push   $0xc010a913
c01072b2:	e8 d5 8d ff ff       	call   c010008c <disp_str>
c01072b7:	83 c4 10             	add    $0x10,%esp
c01072ba:	90                   	nop
c01072bb:	90                   	nop
c01072bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
c01072bf:	5b                   	pop    %ebx
c01072c0:	5e                   	pop    %esi
c01072c1:	5f                   	pop    %edi
c01072c2:	5d                   	pop    %ebp
c01072c3:	c3                   	ret    

c01072c4 <init_internal_interrupt>:
c01072c4:	55                   	push   %ebp
c01072c5:	89 e5                	mov    %esp,%ebp
c01072c7:	83 ec 08             	sub    $0x8,%esp
c01072ca:	6a 0e                	push   $0xe
c01072cc:	6a 08                	push   $0x8
c01072ce:	68 03 01 10 c0       	push   $0xc0100103
c01072d3:	6a 00                	push   $0x0
c01072d5:	e8 62 c7 ff ff       	call   c0103a3c <InitInterruptDesc>
c01072da:	83 c4 10             	add    $0x10,%esp
c01072dd:	6a 0e                	push   $0xe
c01072df:	6a 08                	push   $0x8
c01072e1:	68 09 01 10 c0       	push   $0xc0100109
c01072e6:	6a 01                	push   $0x1
c01072e8:	e8 4f c7 ff ff       	call   c0103a3c <InitInterruptDesc>
c01072ed:	83 c4 10             	add    $0x10,%esp
c01072f0:	6a 0e                	push   $0xe
c01072f2:	6a 08                	push   $0x8
c01072f4:	68 0f 01 10 c0       	push   $0xc010010f
c01072f9:	6a 02                	push   $0x2
c01072fb:	e8 3c c7 ff ff       	call   c0103a3c <InitInterruptDesc>
c0107300:	83 c4 10             	add    $0x10,%esp
c0107303:	6a 0e                	push   $0xe
c0107305:	6a 08                	push   $0x8
c0107307:	68 15 01 10 c0       	push   $0xc0100115
c010730c:	6a 03                	push   $0x3
c010730e:	e8 29 c7 ff ff       	call   c0103a3c <InitInterruptDesc>
c0107313:	83 c4 10             	add    $0x10,%esp
c0107316:	6a 0e                	push   $0xe
c0107318:	6a 08                	push   $0x8
c010731a:	68 1b 01 10 c0       	push   $0xc010011b
c010731f:	6a 04                	push   $0x4
c0107321:	e8 16 c7 ff ff       	call   c0103a3c <InitInterruptDesc>
c0107326:	83 c4 10             	add    $0x10,%esp
c0107329:	6a 0e                	push   $0xe
c010732b:	6a 08                	push   $0x8
c010732d:	68 21 01 10 c0       	push   $0xc0100121
c0107332:	6a 05                	push   $0x5
c0107334:	e8 03 c7 ff ff       	call   c0103a3c <InitInterruptDesc>
c0107339:	83 c4 10             	add    $0x10,%esp
c010733c:	6a 0e                	push   $0xe
c010733e:	6a 08                	push   $0x8
c0107340:	68 27 01 10 c0       	push   $0xc0100127
c0107345:	6a 06                	push   $0x6
c0107347:	e8 f0 c6 ff ff       	call   c0103a3c <InitInterruptDesc>
c010734c:	83 c4 10             	add    $0x10,%esp
c010734f:	6a 0e                	push   $0xe
c0107351:	6a 08                	push   $0x8
c0107353:	68 2d 01 10 c0       	push   $0xc010012d
c0107358:	6a 07                	push   $0x7
c010735a:	e8 dd c6 ff ff       	call   c0103a3c <InitInterruptDesc>
c010735f:	83 c4 10             	add    $0x10,%esp
c0107362:	6a 0e                	push   $0xe
c0107364:	6a 08                	push   $0x8
c0107366:	68 33 01 10 c0       	push   $0xc0100133
c010736b:	6a 08                	push   $0x8
c010736d:	e8 ca c6 ff ff       	call   c0103a3c <InitInterruptDesc>
c0107372:	83 c4 10             	add    $0x10,%esp
c0107375:	6a 0e                	push   $0xe
c0107377:	6a 08                	push   $0x8
c0107379:	68 37 01 10 c0       	push   $0xc0100137
c010737e:	6a 09                	push   $0x9
c0107380:	e8 b7 c6 ff ff       	call   c0103a3c <InitInterruptDesc>
c0107385:	83 c4 10             	add    $0x10,%esp
c0107388:	6a 0e                	push   $0xe
c010738a:	6a 08                	push   $0x8
c010738c:	68 3d 01 10 c0       	push   $0xc010013d
c0107391:	6a 0a                	push   $0xa
c0107393:	e8 a4 c6 ff ff       	call   c0103a3c <InitInterruptDesc>
c0107398:	83 c4 10             	add    $0x10,%esp
c010739b:	6a 0e                	push   $0xe
c010739d:	6a 08                	push   $0x8
c010739f:	68 41 01 10 c0       	push   $0xc0100141
c01073a4:	6a 0b                	push   $0xb
c01073a6:	e8 91 c6 ff ff       	call   c0103a3c <InitInterruptDesc>
c01073ab:	83 c4 10             	add    $0x10,%esp
c01073ae:	6a 0e                	push   $0xe
c01073b0:	6a 08                	push   $0x8
c01073b2:	68 45 01 10 c0       	push   $0xc0100145
c01073b7:	6a 0c                	push   $0xc
c01073b9:	e8 7e c6 ff ff       	call   c0103a3c <InitInterruptDesc>
c01073be:	83 c4 10             	add    $0x10,%esp
c01073c1:	6a 0e                	push   $0xe
c01073c3:	6a 08                	push   $0x8
c01073c5:	68 49 01 10 c0       	push   $0xc0100149
c01073ca:	6a 0d                	push   $0xd
c01073cc:	e8 6b c6 ff ff       	call   c0103a3c <InitInterruptDesc>
c01073d1:	83 c4 10             	add    $0x10,%esp
c01073d4:	6a 0e                	push   $0xe
c01073d6:	6a 08                	push   $0x8
c01073d8:	68 54 01 10 c0       	push   $0xc0100154
c01073dd:	6a 0e                	push   $0xe
c01073df:	e8 58 c6 ff ff       	call   c0103a3c <InitInterruptDesc>
c01073e4:	83 c4 10             	add    $0x10,%esp
c01073e7:	6a 0e                	push   $0xe
c01073e9:	6a 08                	push   $0x8
c01073eb:	68 58 01 10 c0       	push   $0xc0100158
c01073f0:	6a 10                	push   $0x10
c01073f2:	e8 45 c6 ff ff       	call   c0103a3c <InitInterruptDesc>
c01073f7:	83 c4 10             	add    $0x10,%esp
c01073fa:	6a 0e                	push   $0xe
c01073fc:	6a 08                	push   $0x8
c01073fe:	68 5e 01 10 c0       	push   $0xc010015e
c0107403:	6a 11                	push   $0x11
c0107405:	e8 32 c6 ff ff       	call   c0103a3c <InitInterruptDesc>
c010740a:	83 c4 10             	add    $0x10,%esp
c010740d:	6a 0e                	push   $0xe
c010740f:	6a 08                	push   $0x8
c0107411:	68 62 01 10 c0       	push   $0xc0100162
c0107416:	6a 12                	push   $0x12
c0107418:	e8 1f c6 ff ff       	call   c0103a3c <InitInterruptDesc>
c010741d:	83 c4 10             	add    $0x10,%esp
c0107420:	6a 0e                	push   $0xe
c0107422:	6a 0e                	push   $0xe
c0107424:	68 21 02 10 c0       	push   $0xc0100221
c0107429:	68 90 00 00 00       	push   $0x90
c010742e:	e8 09 c6 ff ff       	call   c0103a3c <InitInterruptDesc>
c0107433:	83 c4 10             	add    $0x10,%esp
c0107436:	90                   	nop
c0107437:	c9                   	leave  
c0107438:	c3                   	ret    

c0107439 <spurious_irq>:
c0107439:	55                   	push   %ebp
c010743a:	89 e5                	mov    %esp,%ebp
c010743c:	83 ec 08             	sub    $0x8,%esp
c010743f:	83 ec 08             	sub    $0x8,%esp
c0107442:	6a 0b                	push   $0xb
c0107444:	68 6c ab 10 c0       	push   $0xc010ab6c
c0107449:	e8 79 8c ff ff       	call   c01000c7 <disp_str_colour>
c010744e:	83 c4 10             	add    $0x10,%esp
c0107451:	83 ec 0c             	sub    $0xc,%esp
c0107454:	ff 75 08             	pushl  0x8(%ebp)
c0107457:	e8 1b fb ff ff       	call   c0106f77 <disp_int>
c010745c:	83 c4 10             	add    $0x10,%esp
c010745f:	a1 e8 0e 11 c0       	mov    0xc0110ee8,%eax
c0107464:	8b 15 ec 0e 11 c0    	mov    0xc0110eec,%edx
c010746a:	83 c0 01             	add    $0x1,%eax
c010746d:	83 d2 00             	adc    $0x0,%edx
c0107470:	a3 e8 0e 11 c0       	mov    %eax,0xc0110ee8
c0107475:	89 15 ec 0e 11 c0    	mov    %edx,0xc0110eec
c010747b:	83 ec 0c             	sub    $0xc,%esp
c010747e:	68 80 a7 10 c0       	push   $0xc010a780
c0107483:	e8 04 8c ff ff       	call   c010008c <disp_str>
c0107488:	83 c4 10             	add    $0x10,%esp
c010748b:	a1 e8 0e 11 c0       	mov    0xc0110ee8,%eax
c0107490:	8b 15 ec 0e 11 c0    	mov    0xc0110eec,%edx
c0107496:	83 ec 0c             	sub    $0xc,%esp
c0107499:	50                   	push   %eax
c010749a:	e8 d8 fa ff ff       	call   c0106f77 <disp_int>
c010749f:	83 c4 10             	add    $0x10,%esp
c01074a2:	83 ec 0c             	sub    $0xc,%esp
c01074a5:	68 82 a7 10 c0       	push   $0xc010a782
c01074aa:	e8 dd 8b ff ff       	call   c010008c <disp_str>
c01074af:	83 c4 10             	add    $0x10,%esp
c01074b2:	83 ec 08             	sub    $0x8,%esp
c01074b5:	6a 0c                	push   $0xc
c01074b7:	68 94 ab 10 c0       	push   $0xc010ab94
c01074bc:	e8 06 8c ff ff       	call   c01000c7 <disp_str_colour>
c01074c1:	83 c4 10             	add    $0x10,%esp
c01074c4:	90                   	nop
c01074c5:	c9                   	leave  
c01074c6:	c3                   	ret    

c01074c7 <init_keyboard>:
c01074c7:	55                   	push   %ebp
c01074c8:	89 e5                	mov    %esp,%ebp
c01074ca:	83 ec 18             	sub    $0x18,%esp
c01074cd:	83 ec 04             	sub    $0x4,%esp
c01074d0:	68 00 02 00 00       	push   $0x200
c01074d5:	6a 00                	push   $0x0
c01074d7:	68 ec fb 10 c0       	push   $0xc010fbec
c01074dc:	e8 0a 3d 00 00       	call   c010b1eb <Memset>
c01074e1:	83 c4 10             	add    $0x10,%esp
c01074e4:	c7 05 e0 fb 10 c0 ec 	movl   $0xc010fbec,0xc010fbe0
c01074eb:	fb 10 c0 
c01074ee:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c01074f3:	a3 e4 fb 10 c0       	mov    %eax,0xc010fbe4
c01074f8:	c7 05 e8 fb 10 c0 00 	movl   $0x0,0xc010fbe8
c01074ff:	00 00 00 
c0107502:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0107509:	00 00 00 
c010750c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0107513:	eb 04                	jmp    c0107519 <init_keyboard+0x52>
c0107515:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0107519:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c0107520:	7e f3                	jle    c0107515 <init_keyboard+0x4e>
c0107522:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0107529:	00 00 00 
c010752c:	e8 25 d3 ff ff       	call   c0104856 <init_keyboard_handler>
c0107531:	90                   	nop
c0107532:	c9                   	leave  
c0107533:	c3                   	ret    

c0107534 <TestTTY>:
c0107534:	55                   	push   %ebp
c0107535:	89 e5                	mov    %esp,%ebp
c0107537:	83 ec 28             	sub    $0x28,%esp
c010753a:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0107541:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0107548:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c010754e:	83 ec 08             	sub    $0x8,%esp
c0107551:	6a 02                	push   $0x2
c0107553:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107556:	50                   	push   %eax
c0107557:	e8 a0 d4 ff ff       	call   c01049fc <open>
c010755c:	83 c4 10             	add    $0x10,%esp
c010755f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0107562:	83 ec 08             	sub    $0x8,%esp
c0107565:	6a 02                	push   $0x2
c0107567:	8d 45 de             	lea    -0x22(%ebp),%eax
c010756a:	50                   	push   %eax
c010756b:	e8 8c d4 ff ff       	call   c01049fc <open>
c0107570:	83 c4 10             	add    $0x10,%esp
c0107573:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107576:	83 ec 0c             	sub    $0xc,%esp
c0107579:	68 b9 ab 10 c0       	push   $0xc010abb9
c010757e:	e8 d8 0c 00 00       	call   c010825b <Printf>
c0107583:	83 c4 10             	add    $0x10,%esp
c0107586:	83 ec 0c             	sub    $0xc,%esp
c0107589:	6a 0a                	push   $0xa
c010758b:	e8 7c 9f ff ff       	call   c010150c <sys_malloc>
c0107590:	83 c4 10             	add    $0x10,%esp
c0107593:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0107596:	83 ec 04             	sub    $0x4,%esp
c0107599:	6a 0a                	push   $0xa
c010759b:	6a 00                	push   $0x0
c010759d:	ff 75 ec             	pushl  -0x14(%ebp)
c01075a0:	e8 46 3c 00 00       	call   c010b1eb <Memset>
c01075a5:	83 c4 10             	add    $0x10,%esp
c01075a8:	83 ec 04             	sub    $0x4,%esp
c01075ab:	6a 0a                	push   $0xa
c01075ad:	ff 75 ec             	pushl  -0x14(%ebp)
c01075b0:	ff 75 f0             	pushl  -0x10(%ebp)
c01075b3:	e8 d9 d4 ff ff       	call   c0104a91 <read>
c01075b8:	83 c4 10             	add    $0x10,%esp
c01075bb:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01075be:	83 ec 08             	sub    $0x8,%esp
c01075c1:	ff 75 ec             	pushl  -0x14(%ebp)
c01075c4:	68 cb ab 10 c0       	push   $0xc010abcb
c01075c9:	e8 8d 0c 00 00       	call   c010825b <Printf>
c01075ce:	83 c4 10             	add    $0x10,%esp
c01075d1:	eb c3                	jmp    c0107596 <TestTTY+0x62>

c01075d3 <TestFS>:
c01075d3:	55                   	push   %ebp
c01075d4:	89 e5                	mov    %esp,%ebp
c01075d6:	81 ec 28 01 00 00    	sub    $0x128,%esp
c01075dc:	83 ec 0c             	sub    $0xc,%esp
c01075df:	68 d5 ab 10 c0       	push   $0xc010abd5
c01075e4:	e8 a3 8a ff ff       	call   c010008c <disp_str>
c01075e9:	83 c4 10             	add    $0x10,%esp
c01075ec:	c7 45 be 64 65 76 5f 	movl   $0x5f766564,-0x42(%ebp)
c01075f3:	c7 45 c2 74 74 79 31 	movl   $0x31797474,-0x3e(%ebp)
c01075fa:	66 c7 45 c6 00 00    	movw   $0x0,-0x3a(%ebp)
c0107600:	66 87 db             	xchg   %bx,%bx
c0107603:	83 ec 08             	sub    $0x8,%esp
c0107606:	6a 02                	push   $0x2
c0107608:	8d 45 be             	lea    -0x42(%ebp),%eax
c010760b:	50                   	push   %eax
c010760c:	e8 eb d3 ff ff       	call   c01049fc <open>
c0107611:	83 c4 10             	add    $0x10,%esp
c0107614:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107617:	66 87 db             	xchg   %bx,%bx
c010761a:	83 ec 08             	sub    $0x8,%esp
c010761d:	6a 02                	push   $0x2
c010761f:	8d 45 be             	lea    -0x42(%ebp),%eax
c0107622:	50                   	push   %eax
c0107623:	e8 d4 d3 ff ff       	call   c01049fc <open>
c0107628:	83 c4 10             	add    $0x10,%esp
c010762b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010762e:	66 87 db             	xchg   %bx,%bx
c0107631:	83 ec 0c             	sub    $0xc,%esp
c0107634:	68 b9 ab 10 c0       	push   $0xc010abb9
c0107639:	e8 1d 0c 00 00       	call   c010825b <Printf>
c010763e:	83 c4 10             	add    $0x10,%esp
c0107641:	66 87 db             	xchg   %bx,%bx
c0107644:	c7 45 b9 41 43 00 00 	movl   $0x4341,-0x47(%ebp)
c010764b:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
c010764f:	c7 45 b4 63 41 42 00 	movl   $0x424163,-0x4c(%ebp)
c0107656:	c6 45 b8 00          	movb   $0x0,-0x48(%ebp)
c010765a:	c7 45 aa 49 4e 54 45 	movl   $0x45544e49,-0x56(%ebp)
c0107661:	c7 45 ae 52 52 55 50 	movl   $0x50555252,-0x52(%ebp)
c0107668:	66 c7 45 b2 54 00    	movw   $0x54,-0x4e(%ebp)
c010766e:	66 87 db             	xchg   %bx,%bx
c0107671:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c0107678:	66 87 db             	xchg   %bx,%bx
c010767b:	83 ec 0c             	sub    $0xc,%esp
c010767e:	68 dd ab 10 c0       	push   $0xc010abdd
c0107683:	e8 d3 0b 00 00       	call   c010825b <Printf>
c0107688:	83 c4 10             	add    $0x10,%esp
c010768b:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c010768f:	0f 85 43 03 00 00    	jne    c01079d8 <TestFS+0x405>
c0107695:	83 ec 08             	sub    $0x8,%esp
c0107698:	6a 07                	push   $0x7
c010769a:	8d 45 b9             	lea    -0x47(%ebp),%eax
c010769d:	50                   	push   %eax
c010769e:	e8 59 d3 ff ff       	call   c01049fc <open>
c01076a3:	83 c4 10             	add    $0x10,%esp
c01076a6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01076a9:	83 ec 08             	sub    $0x8,%esp
c01076ac:	ff 75 e4             	pushl  -0x1c(%ebp)
c01076af:	68 f5 ab 10 c0       	push   $0xc010abf5
c01076b4:	e8 a2 0b 00 00       	call   c010825b <Printf>
c01076b9:	83 c4 10             	add    $0x10,%esp
c01076bc:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01076c3:	c7 45 96 63 67 3a 68 	movl   $0x683a6763,-0x6a(%ebp)
c01076ca:	c7 45 9a 65 6c 6c 6f 	movl   $0x6f6c6c65,-0x66(%ebp)
c01076d1:	c7 45 9e 2c 77 6f 72 	movl   $0x726f772c,-0x62(%ebp)
c01076d8:	c7 45 a2 6c 64 21 00 	movl   $0x21646c,-0x5e(%ebp)
c01076df:	c7 45 a6 00 00 00 00 	movl   $0x0,-0x5a(%ebp)
c01076e6:	83 ec 0c             	sub    $0xc,%esp
c01076e9:	8d 45 96             	lea    -0x6a(%ebp),%eax
c01076ec:	50                   	push   %eax
c01076ed:	e8 32 3b 00 00       	call   c010b224 <Strlen>
c01076f2:	83 c4 10             	add    $0x10,%esp
c01076f5:	83 ec 04             	sub    $0x4,%esp
c01076f8:	50                   	push   %eax
c01076f9:	8d 45 96             	lea    -0x6a(%ebp),%eax
c01076fc:	50                   	push   %eax
c01076fd:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107700:	e8 0d d5 ff ff       	call   c0104c12 <write>
c0107705:	83 c4 10             	add    $0x10,%esp
c0107708:	83 ec 04             	sub    $0x4,%esp
c010770b:	6a 14                	push   $0x14
c010770d:	6a 00                	push   $0x0
c010770f:	8d 45 82             	lea    -0x7e(%ebp),%eax
c0107712:	50                   	push   %eax
c0107713:	e8 d3 3a 00 00       	call   c010b1eb <Memset>
c0107718:	83 c4 10             	add    $0x10,%esp
c010771b:	83 ec 04             	sub    $0x4,%esp
c010771e:	6a 12                	push   $0x12
c0107720:	8d 45 82             	lea    -0x7e(%ebp),%eax
c0107723:	50                   	push   %eax
c0107724:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107727:	e8 65 d3 ff ff       	call   c0104a91 <read>
c010772c:	83 c4 10             	add    $0x10,%esp
c010772f:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0107732:	83 ec 08             	sub    $0x8,%esp
c0107735:	8d 45 82             	lea    -0x7e(%ebp),%eax
c0107738:	50                   	push   %eax
c0107739:	68 fe ab 10 c0       	push   $0xc010abfe
c010773e:	e8 18 0b 00 00       	call   c010825b <Printf>
c0107743:	83 c4 10             	add    $0x10,%esp
c0107746:	66 87 db             	xchg   %bx,%bx
c0107749:	83 ec 0c             	sub    $0xc,%esp
c010774c:	6a 0a                	push   $0xa
c010774e:	e8 d4 09 00 00       	call   c0108127 <delay>
c0107753:	83 c4 10             	add    $0x10,%esp
c0107756:	83 ec 08             	sub    $0x8,%esp
c0107759:	6a 07                	push   $0x7
c010775b:	8d 45 b4             	lea    -0x4c(%ebp),%eax
c010775e:	50                   	push   %eax
c010775f:	e8 98 d2 ff ff       	call   c01049fc <open>
c0107764:	83 c4 10             	add    $0x10,%esp
c0107767:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010776a:	83 ec 08             	sub    $0x8,%esp
c010776d:	ff 75 dc             	pushl  -0x24(%ebp)
c0107770:	68 09 ac 10 c0       	push   $0xc010ac09
c0107775:	e8 e1 0a 00 00       	call   c010825b <Printf>
c010777a:	83 c4 10             	add    $0x10,%esp
c010777d:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0107784:	c7 85 6e ff ff ff 63 	movl   $0x683a6763,-0x92(%ebp)
c010778b:	67 3a 68 
c010778e:	c7 85 72 ff ff ff 6f 	movl   $0x6120776f,-0x8e(%ebp)
c0107795:	77 20 61 
c0107798:	c7 85 76 ff ff ff 72 	movl   $0x79206572,-0x8a(%ebp)
c010779f:	65 20 79 
c01077a2:	c7 85 7a ff ff ff 6f 	movl   $0x3f756f,-0x86(%ebp)
c01077a9:	75 3f 00 
c01077ac:	c7 85 7e ff ff ff 00 	movl   $0x0,-0x82(%ebp)
c01077b3:	00 00 00 
c01077b6:	83 ec 0c             	sub    $0xc,%esp
c01077b9:	8d 85 6e ff ff ff    	lea    -0x92(%ebp),%eax
c01077bf:	50                   	push   %eax
c01077c0:	e8 5f 3a 00 00       	call   c010b224 <Strlen>
c01077c5:	83 c4 10             	add    $0x10,%esp
c01077c8:	83 ec 04             	sub    $0x4,%esp
c01077cb:	50                   	push   %eax
c01077cc:	8d 85 6e ff ff ff    	lea    -0x92(%ebp),%eax
c01077d2:	50                   	push   %eax
c01077d3:	ff 75 dc             	pushl  -0x24(%ebp)
c01077d6:	e8 37 d4 ff ff       	call   c0104c12 <write>
c01077db:	83 c4 10             	add    $0x10,%esp
c01077de:	83 ec 04             	sub    $0x4,%esp
c01077e1:	6a 14                	push   $0x14
c01077e3:	6a 00                	push   $0x0
c01077e5:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c01077eb:	50                   	push   %eax
c01077ec:	e8 fa 39 00 00       	call   c010b1eb <Memset>
c01077f1:	83 c4 10             	add    $0x10,%esp
c01077f4:	83 ec 04             	sub    $0x4,%esp
c01077f7:	6a 12                	push   $0x12
c01077f9:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c01077ff:	50                   	push   %eax
c0107800:	ff 75 dc             	pushl  -0x24(%ebp)
c0107803:	e8 89 d2 ff ff       	call   c0104a91 <read>
c0107808:	83 c4 10             	add    $0x10,%esp
c010780b:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010780e:	83 ec 08             	sub    $0x8,%esp
c0107811:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c0107817:	50                   	push   %eax
c0107818:	68 13 ac 10 c0       	push   $0xc010ac13
c010781d:	e8 39 0a 00 00       	call   c010825b <Printf>
c0107822:	83 c4 10             	add    $0x10,%esp
c0107825:	83 ec 08             	sub    $0x8,%esp
c0107828:	6a 07                	push   $0x7
c010782a:	8d 45 aa             	lea    -0x56(%ebp),%eax
c010782d:	50                   	push   %eax
c010782e:	e8 c9 d1 ff ff       	call   c01049fc <open>
c0107833:	83 c4 10             	add    $0x10,%esp
c0107836:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0107839:	83 ec 08             	sub    $0x8,%esp
c010783c:	ff 75 dc             	pushl  -0x24(%ebp)
c010783f:	68 09 ac 10 c0       	push   $0xc010ac09
c0107844:	e8 12 0a 00 00       	call   c010825b <Printf>
c0107849:	83 c4 10             	add    $0x10,%esp
c010784c:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0107853:	c7 85 3c ff ff ff 49 	movl   $0x69772049,-0xc4(%ebp)
c010785a:	20 77 69 
c010785d:	c7 85 40 ff ff ff 6c 	movl   $0x73206c6c,-0xc0(%ebp)
c0107864:	6c 20 73 
c0107867:	c7 85 44 ff ff ff 75 	movl   $0x65636375,-0xbc(%ebp)
c010786e:	63 63 65 
c0107871:	c7 85 48 ff ff ff 73 	movl   $0x61207373,-0xb8(%ebp)
c0107878:	73 20 61 
c010787b:	c7 85 4c ff ff ff 74 	movl   $0x616c2074,-0xb4(%ebp)
c0107882:	20 6c 61 
c0107885:	c7 85 50 ff ff ff 73 	movl   $0x2e7473,-0xb0(%ebp)
c010788c:	74 2e 00 
c010788f:	c7 85 54 ff ff ff 00 	movl   $0x0,-0xac(%ebp)
c0107896:	00 00 00 
c0107899:	66 c7 85 58 ff ff ff 	movw   $0x0,-0xa8(%ebp)
c01078a0:	00 00 
c01078a2:	83 ec 0c             	sub    $0xc,%esp
c01078a5:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c01078ab:	50                   	push   %eax
c01078ac:	e8 73 39 00 00       	call   c010b224 <Strlen>
c01078b1:	83 c4 10             	add    $0x10,%esp
c01078b4:	83 ec 04             	sub    $0x4,%esp
c01078b7:	50                   	push   %eax
c01078b8:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c01078be:	50                   	push   %eax
c01078bf:	ff 75 d4             	pushl  -0x2c(%ebp)
c01078c2:	e8 4b d3 ff ff       	call   c0104c12 <write>
c01078c7:	83 c4 10             	add    $0x10,%esp
c01078ca:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01078d1:	eb 5c                	jmp    c010792f <TestFS+0x35c>
c01078d3:	83 ec 04             	sub    $0x4,%esp
c01078d6:	6a 1e                	push   $0x1e
c01078d8:	6a 00                	push   $0x0
c01078da:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c01078e0:	50                   	push   %eax
c01078e1:	e8 05 39 00 00       	call   c010b1eb <Memset>
c01078e6:	83 c4 10             	add    $0x10,%esp
c01078e9:	83 ec 0c             	sub    $0xc,%esp
c01078ec:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c01078f2:	50                   	push   %eax
c01078f3:	e8 2c 39 00 00       	call   c010b224 <Strlen>
c01078f8:	83 c4 10             	add    $0x10,%esp
c01078fb:	83 ec 04             	sub    $0x4,%esp
c01078fe:	50                   	push   %eax
c01078ff:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c0107905:	50                   	push   %eax
c0107906:	ff 75 d4             	pushl  -0x2c(%ebp)
c0107909:	e8 83 d1 ff ff       	call   c0104a91 <read>
c010790e:	83 c4 10             	add    $0x10,%esp
c0107911:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0107914:	83 ec 08             	sub    $0x8,%esp
c0107917:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c010791d:	50                   	push   %eax
c010791e:	68 1e ac 10 c0       	push   $0xc010ac1e
c0107923:	e8 33 09 00 00       	call   c010825b <Printf>
c0107928:	83 c4 10             	add    $0x10,%esp
c010792b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c010792f:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c0107933:	7e 9e                	jle    c01078d3 <TestFS+0x300>
c0107935:	c7 85 0a ff ff ff 69 	movl   $0x74736e69,-0xf6(%ebp)
c010793c:	6e 73 74 
c010793f:	c7 85 0e ff ff ff 61 	movl   $0x2e6c6c61,-0xf2(%ebp)
c0107946:	6c 6c 2e 
c0107949:	c7 85 12 ff ff ff 74 	movl   $0x726174,-0xee(%ebp)
c0107950:	61 72 00 
c0107953:	c7 85 16 ff ff ff 00 	movl   $0x0,-0xea(%ebp)
c010795a:	00 00 00 
c010795d:	c7 85 1a ff ff ff 00 	movl   $0x0,-0xe6(%ebp)
c0107964:	00 00 00 
c0107967:	83 ec 08             	sub    $0x8,%esp
c010796a:	6a 00                	push   $0x0
c010796c:	8d 85 0a ff ff ff    	lea    -0xf6(%ebp),%eax
c0107972:	50                   	push   %eax
c0107973:	e8 84 d0 ff ff       	call   c01049fc <open>
c0107978:	83 c4 10             	add    $0x10,%esp
c010797b:	89 45 cc             	mov    %eax,-0x34(%ebp)
c010797e:	83 ec 08             	sub    $0x8,%esp
c0107981:	ff 75 cc             	pushl  -0x34(%ebp)
c0107984:	68 29 ac 10 c0       	push   $0xc010ac29
c0107989:	e8 cd 08 00 00       	call   c010825b <Printf>
c010798e:	83 c4 10             	add    $0x10,%esp
c0107991:	83 ec 04             	sub    $0x4,%esp
c0107994:	6a 28                	push   $0x28
c0107996:	6a 00                	push   $0x0
c0107998:	8d 85 e2 fe ff ff    	lea    -0x11e(%ebp),%eax
c010799e:	50                   	push   %eax
c010799f:	e8 47 38 00 00       	call   c010b1eb <Memset>
c01079a4:	83 c4 10             	add    $0x10,%esp
c01079a7:	83 ec 04             	sub    $0x4,%esp
c01079aa:	6a 28                	push   $0x28
c01079ac:	8d 85 e2 fe ff ff    	lea    -0x11e(%ebp),%eax
c01079b2:	50                   	push   %eax
c01079b3:	ff 75 cc             	pushl  -0x34(%ebp)
c01079b6:	e8 d6 d0 ff ff       	call   c0104a91 <read>
c01079bb:	83 c4 10             	add    $0x10,%esp
c01079be:	89 45 c8             	mov    %eax,-0x38(%ebp)
c01079c1:	83 ec 08             	sub    $0x8,%esp
c01079c4:	8d 85 e2 fe ff ff    	lea    -0x11e(%ebp),%eax
c01079ca:	50                   	push   %eax
c01079cb:	68 33 ac 10 c0       	push   $0xc010ac33
c01079d0:	e8 86 08 00 00       	call   c010825b <Printf>
c01079d5:	83 c4 10             	add    $0x10,%esp
c01079d8:	90                   	nop
c01079d9:	c9                   	leave  
c01079da:	c3                   	ret    

c01079db <wait_exit>:
c01079db:	55                   	push   %ebp
c01079dc:	89 e5                	mov    %esp,%ebp
c01079de:	83 ec 28             	sub    $0x28,%esp
c01079e1:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c01079e8:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c01079ef:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c01079f5:	83 ec 08             	sub    $0x8,%esp
c01079f8:	6a 02                	push   $0x2
c01079fa:	8d 45 de             	lea    -0x22(%ebp),%eax
c01079fd:	50                   	push   %eax
c01079fe:	e8 f9 cf ff ff       	call   c01049fc <open>
c0107a03:	83 c4 10             	add    $0x10,%esp
c0107a06:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107a09:	83 ec 08             	sub    $0x8,%esp
c0107a0c:	6a 02                	push   $0x2
c0107a0e:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107a11:	50                   	push   %eax
c0107a12:	e8 e5 cf ff ff       	call   c01049fc <open>
c0107a17:	83 c4 10             	add    $0x10,%esp
c0107a1a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0107a1d:	e8 3a d3 ff ff       	call   c0104d5c <fork>
c0107a22:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0107a25:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0107a29:	7e 35                	jle    c0107a60 <wait_exit+0x85>
c0107a2b:	83 ec 0c             	sub    $0xc,%esp
c0107a2e:	68 3e ac 10 c0       	push   $0xc010ac3e
c0107a33:	e8 23 08 00 00       	call   c010825b <Printf>
c0107a38:	83 c4 10             	add    $0x10,%esp
c0107a3b:	83 ec 0c             	sub    $0xc,%esp
c0107a3e:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0107a41:	50                   	push   %eax
c0107a42:	e8 a2 d2 ff ff       	call   c0104ce9 <wait>
c0107a47:	83 c4 10             	add    $0x10,%esp
c0107a4a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0107a4d:	83 ec 08             	sub    $0x8,%esp
c0107a50:	50                   	push   %eax
c0107a51:	68 56 ac 10 c0       	push   $0xc010ac56
c0107a56:	e8 00 08 00 00       	call   c010825b <Printf>
c0107a5b:	83 c4 10             	add    $0x10,%esp
c0107a5e:	eb fe                	jmp    c0107a5e <wait_exit+0x83>
c0107a60:	83 ec 0c             	sub    $0xc,%esp
c0107a63:	68 71 ac 10 c0       	push   $0xc010ac71
c0107a68:	e8 ee 07 00 00       	call   c010825b <Printf>
c0107a6d:	83 c4 10             	add    $0x10,%esp
c0107a70:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0107a77:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0107a7a:	8d 50 01             	lea    0x1(%eax),%edx
c0107a7d:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0107a80:	3d 50 c3 00 00       	cmp    $0xc350,%eax
c0107a85:	7f 02                	jg     c0107a89 <wait_exit+0xae>
c0107a87:	eb ee                	jmp    c0107a77 <wait_exit+0x9c>
c0107a89:	90                   	nop
c0107a8a:	83 ec 0c             	sub    $0xc,%esp
c0107a8d:	68 7d ac 10 c0       	push   $0xc010ac7d
c0107a92:	e8 c4 07 00 00       	call   c010825b <Printf>
c0107a97:	83 c4 10             	add    $0x10,%esp
c0107a9a:	83 ec 0c             	sub    $0xc,%esp
c0107a9d:	68 8b ac 10 c0       	push   $0xc010ac8b
c0107aa2:	e8 b4 07 00 00       	call   c010825b <Printf>
c0107aa7:	83 c4 10             	add    $0x10,%esp
c0107aaa:	83 ec 0c             	sub    $0xc,%esp
c0107aad:	68 9a ac 10 c0       	push   $0xc010ac9a
c0107ab2:	e8 a4 07 00 00       	call   c010825b <Printf>
c0107ab7:	83 c4 10             	add    $0x10,%esp
c0107aba:	83 ec 0c             	sub    $0xc,%esp
c0107abd:	6a 5a                	push   $0x5a
c0107abf:	e8 69 d2 ff ff       	call   c0104d2d <exit>
c0107ac4:	83 c4 10             	add    $0x10,%esp
c0107ac7:	83 ec 0c             	sub    $0xc,%esp
c0107aca:	68 a9 ac 10 c0       	push   $0xc010aca9
c0107acf:	e8 87 07 00 00       	call   c010825b <Printf>
c0107ad4:	83 c4 10             	add    $0x10,%esp
c0107ad7:	eb fe                	jmp    c0107ad7 <wait_exit+0xfc>

c0107ad9 <INIT_fork>:
c0107ad9:	55                   	push   %ebp
c0107ada:	89 e5                	mov    %esp,%ebp
c0107adc:	83 ec 78             	sub    $0x78,%esp
c0107adf:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0107ae6:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0107aed:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0107af3:	83 ec 08             	sub    $0x8,%esp
c0107af6:	6a 02                	push   $0x2
c0107af8:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107afb:	50                   	push   %eax
c0107afc:	e8 fb ce ff ff       	call   c01049fc <open>
c0107b01:	83 c4 10             	add    $0x10,%esp
c0107b04:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0107b07:	83 ec 08             	sub    $0x8,%esp
c0107b0a:	6a 02                	push   $0x2
c0107b0c:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107b0f:	50                   	push   %eax
c0107b10:	e8 e7 ce ff ff       	call   c01049fc <open>
c0107b15:	83 c4 10             	add    $0x10,%esp
c0107b18:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107b1b:	c7 45 b6 49 4e 49 54 	movl   $0x54494e49,-0x4a(%ebp)
c0107b22:	c7 45 ba 20 69 73 20 	movl   $0x20736920,-0x46(%ebp)
c0107b29:	c7 45 be 72 75 6e 6e 	movl   $0x6e6e7572,-0x42(%ebp)
c0107b30:	c7 45 c2 69 6e 67 0a 	movl   $0xa676e69,-0x3e(%ebp)
c0107b37:	c7 45 c6 00 00 00 00 	movl   $0x0,-0x3a(%ebp)
c0107b3e:	c7 45 ca 00 00 00 00 	movl   $0x0,-0x36(%ebp)
c0107b45:	c7 45 ce 00 00 00 00 	movl   $0x0,-0x32(%ebp)
c0107b4c:	c7 45 d2 00 00 00 00 	movl   $0x0,-0x2e(%ebp)
c0107b53:	c7 45 d6 00 00 00 00 	movl   $0x0,-0x2a(%ebp)
c0107b5a:	c7 45 da 00 00 00 00 	movl   $0x0,-0x26(%ebp)
c0107b61:	83 ec 0c             	sub    $0xc,%esp
c0107b64:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107b67:	50                   	push   %eax
c0107b68:	e8 ee 06 00 00       	call   c010825b <Printf>
c0107b6d:	83 c4 10             	add    $0x10,%esp
c0107b70:	83 ec 0c             	sub    $0xc,%esp
c0107b73:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107b76:	50                   	push   %eax
c0107b77:	e8 a8 36 00 00       	call   c010b224 <Strlen>
c0107b7c:	83 c4 10             	add    $0x10,%esp
c0107b7f:	83 ec 04             	sub    $0x4,%esp
c0107b82:	50                   	push   %eax
c0107b83:	6a 00                	push   $0x0
c0107b85:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107b88:	50                   	push   %eax
c0107b89:	e8 5d 36 00 00       	call   c010b1eb <Memset>
c0107b8e:	83 c4 10             	add    $0x10,%esp
c0107b91:	83 ec 04             	sub    $0x4,%esp
c0107b94:	6a 28                	push   $0x28
c0107b96:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107b99:	50                   	push   %eax
c0107b9a:	ff 75 f0             	pushl  -0x10(%ebp)
c0107b9d:	e8 ef ce ff ff       	call   c0104a91 <read>
c0107ba2:	83 c4 10             	add    $0x10,%esp
c0107ba5:	83 ec 0c             	sub    $0xc,%esp
c0107ba8:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107bab:	50                   	push   %eax
c0107bac:	e8 aa 06 00 00       	call   c010825b <Printf>
c0107bb1:	83 c4 10             	add    $0x10,%esp
c0107bb4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0107bbb:	e8 9c d1 ff ff       	call   c0104d5c <fork>
c0107bc0:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0107bc3:	83 ec 0c             	sub    $0xc,%esp
c0107bc6:	6a 01                	push   $0x1
c0107bc8:	e8 5a 05 00 00       	call   c0108127 <delay>
c0107bcd:	83 c4 10             	add    $0x10,%esp
c0107bd0:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0107bd4:	0f 8e cd 00 00 00    	jle    c0107ca7 <INIT_fork+0x1ce>
c0107bda:	83 ec 08             	sub    $0x8,%esp
c0107bdd:	ff 75 e8             	pushl  -0x18(%ebp)
c0107be0:	68 b7 ac 10 c0       	push   $0xc010acb7
c0107be5:	e8 71 06 00 00       	call   c010825b <Printf>
c0107bea:	83 c4 10             	add    $0x10,%esp
c0107bed:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0107bf1:	c7 45 8e 50 61 72 65 	movl   $0x65726150,-0x72(%ebp)
c0107bf8:	c7 45 92 6e 74 2e 4e 	movl   $0x4e2e746e,-0x6e(%ebp)
c0107bff:	c7 45 96 69 63 65 20 	movl   $0x20656369,-0x6a(%ebp)
c0107c06:	c7 45 9a 74 6f 20 6d 	movl   $0x6d206f74,-0x66(%ebp)
c0107c0d:	c7 45 9e 65 65 74 20 	movl   $0x20746565,-0x62(%ebp)
c0107c14:	c7 45 a2 79 6f 75 21 	movl   $0x21756f79,-0x5e(%ebp)
c0107c1b:	c7 45 a6 0a 00 00 00 	movl   $0xa,-0x5a(%ebp)
c0107c22:	c7 45 aa 00 00 00 00 	movl   $0x0,-0x56(%ebp)
c0107c29:	c7 45 ae 00 00 00 00 	movl   $0x0,-0x52(%ebp)
c0107c30:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)
c0107c37:	83 ec 0c             	sub    $0xc,%esp
c0107c3a:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107c3d:	50                   	push   %eax
c0107c3e:	e8 e1 35 00 00       	call   c010b224 <Strlen>
c0107c43:	83 c4 10             	add    $0x10,%esp
c0107c46:	83 ec 04             	sub    $0x4,%esp
c0107c49:	50                   	push   %eax
c0107c4a:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107c4d:	50                   	push   %eax
c0107c4e:	ff 75 f4             	pushl  -0xc(%ebp)
c0107c51:	e8 bc cf ff ff       	call   c0104c12 <write>
c0107c56:	83 c4 10             	add    $0x10,%esp
c0107c59:	e8 81 ee ff ff       	call   c0106adf <catch_error>
c0107c5e:	83 ec 0c             	sub    $0xc,%esp
c0107c61:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107c64:	50                   	push   %eax
c0107c65:	e8 ba 35 00 00       	call   c010b224 <Strlen>
c0107c6a:	83 c4 10             	add    $0x10,%esp
c0107c6d:	83 ec 04             	sub    $0x4,%esp
c0107c70:	50                   	push   %eax
c0107c71:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107c74:	50                   	push   %eax
c0107c75:	ff 75 f4             	pushl  -0xc(%ebp)
c0107c78:	e8 95 cf ff ff       	call   c0104c12 <write>
c0107c7d:	83 c4 10             	add    $0x10,%esp
c0107c80:	83 ec 0c             	sub    $0xc,%esp
c0107c83:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107c86:	50                   	push   %eax
c0107c87:	e8 98 35 00 00       	call   c010b224 <Strlen>
c0107c8c:	83 c4 10             	add    $0x10,%esp
c0107c8f:	83 ec 04             	sub    $0x4,%esp
c0107c92:	50                   	push   %eax
c0107c93:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107c96:	50                   	push   %eax
c0107c97:	ff 75 f4             	pushl  -0xc(%ebp)
c0107c9a:	e8 73 cf ff ff       	call   c0104c12 <write>
c0107c9f:	83 c4 10             	add    $0x10,%esp
c0107ca2:	e9 d6 00 00 00       	jmp    c0107d7d <INIT_fork+0x2a4>
c0107ca7:	83 ec 08             	sub    $0x8,%esp
c0107caa:	ff 75 e8             	pushl  -0x18(%ebp)
c0107cad:	68 b7 ac 10 c0       	push   $0xc010acb7
c0107cb2:	e8 a4 05 00 00       	call   c010825b <Printf>
c0107cb7:	83 c4 10             	add    $0x10,%esp
c0107cba:	83 ec 0c             	sub    $0xc,%esp
c0107cbd:	6a 01                	push   $0x1
c0107cbf:	e8 63 04 00 00       	call   c0108127 <delay>
c0107cc4:	83 c4 10             	add    $0x10,%esp
c0107cc7:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0107ccb:	83 45 ec 02          	addl   $0x2,-0x14(%ebp)
c0107ccf:	c7 45 8e 43 68 69 6c 	movl   $0x6c696843,-0x72(%ebp)
c0107cd6:	c7 45 92 64 2e 53 65 	movl   $0x65532e64,-0x6e(%ebp)
c0107cdd:	c7 45 96 65 20 79 6f 	movl   $0x6f792065,-0x6a(%ebp)
c0107ce4:	c7 45 9a 75 20 61 67 	movl   $0x67612075,-0x66(%ebp)
c0107ceb:	c7 45 9e 61 69 6e 0a 	movl   $0xa6e6961,-0x62(%ebp)
c0107cf2:	c7 45 a2 00 00 00 00 	movl   $0x0,-0x5e(%ebp)
c0107cf9:	c7 45 a6 00 00 00 00 	movl   $0x0,-0x5a(%ebp)
c0107d00:	c7 45 aa 00 00 00 00 	movl   $0x0,-0x56(%ebp)
c0107d07:	c7 45 ae 00 00 00 00 	movl   $0x0,-0x52(%ebp)
c0107d0e:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)
c0107d15:	83 ec 0c             	sub    $0xc,%esp
c0107d18:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107d1b:	50                   	push   %eax
c0107d1c:	e8 03 35 00 00       	call   c010b224 <Strlen>
c0107d21:	83 c4 10             	add    $0x10,%esp
c0107d24:	83 ec 04             	sub    $0x4,%esp
c0107d27:	50                   	push   %eax
c0107d28:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107d2b:	50                   	push   %eax
c0107d2c:	ff 75 f4             	pushl  -0xc(%ebp)
c0107d2f:	e8 de ce ff ff       	call   c0104c12 <write>
c0107d34:	83 c4 10             	add    $0x10,%esp
c0107d37:	83 ec 0c             	sub    $0xc,%esp
c0107d3a:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107d3d:	50                   	push   %eax
c0107d3e:	e8 e1 34 00 00       	call   c010b224 <Strlen>
c0107d43:	83 c4 10             	add    $0x10,%esp
c0107d46:	83 ec 04             	sub    $0x4,%esp
c0107d49:	50                   	push   %eax
c0107d4a:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107d4d:	50                   	push   %eax
c0107d4e:	ff 75 f4             	pushl  -0xc(%ebp)
c0107d51:	e8 bc ce ff ff       	call   c0104c12 <write>
c0107d56:	83 c4 10             	add    $0x10,%esp
c0107d59:	83 ec 0c             	sub    $0xc,%esp
c0107d5c:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107d5f:	50                   	push   %eax
c0107d60:	e8 bf 34 00 00       	call   c010b224 <Strlen>
c0107d65:	83 c4 10             	add    $0x10,%esp
c0107d68:	83 ec 04             	sub    $0x4,%esp
c0107d6b:	50                   	push   %eax
c0107d6c:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107d6f:	50                   	push   %eax
c0107d70:	ff 75 f4             	pushl  -0xc(%ebp)
c0107d73:	e8 9a ce ff ff       	call   c0104c12 <write>
c0107d78:	83 c4 10             	add    $0x10,%esp
c0107d7b:	eb fe                	jmp    c0107d7b <INIT_fork+0x2a2>
c0107d7d:	83 ec 04             	sub    $0x4,%esp
c0107d80:	6a 28                	push   $0x28
c0107d82:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107d85:	50                   	push   %eax
c0107d86:	ff 75 f0             	pushl  -0x10(%ebp)
c0107d89:	e8 03 cd ff ff       	call   c0104a91 <read>
c0107d8e:	83 c4 10             	add    $0x10,%esp
c0107d91:	83 ec 0c             	sub    $0xc,%esp
c0107d94:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107d97:	50                   	push   %eax
c0107d98:	e8 be 04 00 00       	call   c010825b <Printf>
c0107d9d:	83 c4 10             	add    $0x10,%esp
c0107da0:	83 ec 0c             	sub    $0xc,%esp
c0107da3:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107da6:	50                   	push   %eax
c0107da7:	e8 af 04 00 00       	call   c010825b <Printf>
c0107dac:	83 c4 10             	add    $0x10,%esp
c0107daf:	83 ec 0c             	sub    $0xc,%esp
c0107db2:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107db5:	50                   	push   %eax
c0107db6:	e8 a0 04 00 00       	call   c010825b <Printf>
c0107dbb:	83 c4 10             	add    $0x10,%esp
c0107dbe:	83 ec 0c             	sub    $0xc,%esp
c0107dc1:	68 c1 ac 10 c0       	push   $0xc010acc1
c0107dc6:	e8 a9 07 00 00       	call   c0108574 <spin>
c0107dcb:	83 c4 10             	add    $0x10,%esp
c0107dce:	90                   	nop
c0107dcf:	c9                   	leave  
c0107dd0:	c3                   	ret    

c0107dd1 <simple_shell>:
c0107dd1:	55                   	push   %ebp
c0107dd2:	89 e5                	mov    %esp,%ebp
c0107dd4:	57                   	push   %edi
c0107dd5:	83 ec 64             	sub    $0x64,%esp
c0107dd8:	c7 45 d2 64 65 76 5f 	movl   $0x5f766564,-0x2e(%ebp)
c0107ddf:	c7 45 d6 74 74 79 31 	movl   $0x31797474,-0x2a(%ebp)
c0107de6:	66 c7 45 da 00 00    	movw   $0x0,-0x26(%ebp)
c0107dec:	83 ec 08             	sub    $0x8,%esp
c0107def:	6a 02                	push   $0x2
c0107df1:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c0107df4:	50                   	push   %eax
c0107df5:	e8 02 cc ff ff       	call   c01049fc <open>
c0107dfa:	83 c4 10             	add    $0x10,%esp
c0107dfd:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107e00:	83 ec 08             	sub    $0x8,%esp
c0107e03:	6a 02                	push   $0x2
c0107e05:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c0107e08:	50                   	push   %eax
c0107e09:	e8 ee cb ff ff       	call   c01049fc <open>
c0107e0e:	83 c4 10             	add    $0x10,%esp
c0107e11:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0107e14:	8d 55 a8             	lea    -0x58(%ebp),%edx
c0107e17:	b8 00 00 00 00       	mov    $0x0,%eax
c0107e1c:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0107e21:	89 d7                	mov    %edx,%edi
c0107e23:	f3 ab                	rep stos %eax,%es:(%edi)
c0107e25:	c7 45 a8 c9 ac 10 c0 	movl   $0xc010acc9,-0x58(%ebp)
c0107e2c:	c7 45 ac ce ac 10 c0 	movl   $0xc010acce,-0x54(%ebp)
c0107e33:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0107e3a:	66 87 db             	xchg   %bx,%bx
c0107e3d:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
c0107e44:	c7 45 e8 02 00 00 00 	movl   $0x2,-0x18(%ebp)
c0107e4b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0107e4e:	c7 44 85 a8 00 00 00 	movl   $0x0,-0x58(%ebp,%eax,4)
c0107e55:	00 
c0107e56:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0107e59:	85 c0                	test   %eax,%eax
c0107e5b:	75 1c                	jne    c0107e79 <simple_shell+0xa8>
c0107e5d:	68 da 02 00 00       	push   $0x2da
c0107e62:	68 d4 ac 10 c0       	push   $0xc010acd4
c0107e67:	68 d4 ac 10 c0       	push   $0xc010acd4
c0107e6c:	68 e4 ac 10 c0       	push   $0xc010ace4
c0107e71:	e8 42 07 00 00       	call   c01085b8 <assertion_failure>
c0107e76:	83 c4 10             	add    $0x10,%esp
c0107e79:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0107e7c:	83 ec 08             	sub    $0x8,%esp
c0107e7f:	6a 02                	push   $0x2
c0107e81:	50                   	push   %eax
c0107e82:	e8 75 cb ff ff       	call   c01049fc <open>
c0107e87:	83 c4 10             	add    $0x10,%esp
c0107e8a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0107e8d:	66 87 db             	xchg   %bx,%bx
c0107e90:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
c0107e94:	75 4e                	jne    c0107ee4 <simple_shell+0x113>
c0107e96:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0107e9d:	eb 26                	jmp    c0107ec5 <simple_shell+0xf4>
c0107e9f:	8b 55 a8             	mov    -0x58(%ebp),%edx
c0107ea2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0107ea5:	01 d0                	add    %edx,%eax
c0107ea7:	0f b6 00             	movzbl (%eax),%eax
c0107eaa:	0f be c0             	movsbl %al,%eax
c0107ead:	83 ec 04             	sub    $0x4,%esp
c0107eb0:	50                   	push   %eax
c0107eb1:	ff 75 f4             	pushl  -0xc(%ebp)
c0107eb4:	68 f3 ac 10 c0       	push   $0xc010acf3
c0107eb9:	e8 9d 03 00 00       	call   c010825b <Printf>
c0107ebe:	83 c4 10             	add    $0x10,%esp
c0107ec1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0107ec5:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
c0107ec9:	7e d4                	jle    c0107e9f <simple_shell+0xce>
c0107ecb:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0107ece:	83 ec 08             	sub    $0x8,%esp
c0107ed1:	50                   	push   %eax
c0107ed2:	68 fa ac 10 c0       	push   $0xc010acfa
c0107ed7:	e8 7f 03 00 00       	call   c010825b <Printf>
c0107edc:	83 c4 10             	add    $0x10,%esp
c0107edf:	e9 81 00 00 00       	jmp    c0107f65 <simple_shell+0x194>
c0107ee4:	83 ec 0c             	sub    $0xc,%esp
c0107ee7:	68 00 ad 10 c0       	push   $0xc010ad00
c0107eec:	e8 6a 03 00 00       	call   c010825b <Printf>
c0107ef1:	83 c4 10             	add    $0x10,%esp
c0107ef4:	e8 63 ce ff ff       	call   c0104d5c <fork>
c0107ef9:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0107efc:	83 ec 0c             	sub    $0xc,%esp
c0107eff:	68 15 ad 10 c0       	push   $0xc010ad15
c0107f04:	e8 52 03 00 00       	call   c010825b <Printf>
c0107f09:	83 c4 10             	add    $0x10,%esp
c0107f0c:	66 87 db             	xchg   %bx,%bx
c0107f0f:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
c0107f13:	7e 11                	jle    c0107f26 <simple_shell+0x155>
c0107f15:	83 ec 0c             	sub    $0xc,%esp
c0107f18:	8d 45 a4             	lea    -0x5c(%ebp),%eax
c0107f1b:	50                   	push   %eax
c0107f1c:	e8 c8 cd ff ff       	call   c0104ce9 <wait>
c0107f21:	83 c4 10             	add    $0x10,%esp
c0107f24:	eb 3f                	jmp    c0107f65 <simple_shell+0x194>
c0107f26:	83 ec 0c             	sub    $0xc,%esp
c0107f29:	68 2a ad 10 c0       	push   $0xc010ad2a
c0107f2e:	e8 28 03 00 00       	call   c010825b <Printf>
c0107f33:	83 c4 10             	add    $0x10,%esp
c0107f36:	83 ec 0c             	sub    $0xc,%esp
c0107f39:	ff 75 e0             	pushl  -0x20(%ebp)
c0107f3c:	e8 56 cd ff ff       	call   c0104c97 <close>
c0107f41:	83 c4 10             	add    $0x10,%esp
c0107f44:	66 87 db             	xchg   %bx,%bx
c0107f47:	6a 00                	push   $0x0
c0107f49:	68 ce ac 10 c0       	push   $0xc010acce
c0107f4e:	68 c9 ac 10 c0       	push   $0xc010acc9
c0107f53:	68 46 ad 10 c0       	push   $0xc010ad46
c0107f58:	e8 d2 d0 ff ff       	call   c010502f <execl>
c0107f5d:	83 c4 10             	add    $0x10,%esp
c0107f60:	66 87 db             	xchg   %bx,%bx
c0107f63:	eb fe                	jmp    c0107f63 <simple_shell+0x192>
c0107f65:	8b 7d fc             	mov    -0x4(%ebp),%edi
c0107f68:	c9                   	leave  
c0107f69:	c3                   	ret    

c0107f6a <test_shell>:
c0107f6a:	55                   	push   %ebp
c0107f6b:	89 e5                	mov    %esp,%ebp
c0107f6d:	83 ec 38             	sub    $0x38,%esp
c0107f70:	c7 45 ea 64 65 76 5f 	movl   $0x5f766564,-0x16(%ebp)
c0107f77:	c7 45 ee 74 74 79 31 	movl   $0x31797474,-0x12(%ebp)
c0107f7e:	66 c7 45 f2 00 00    	movw   $0x0,-0xe(%ebp)
c0107f84:	83 ec 08             	sub    $0x8,%esp
c0107f87:	6a 02                	push   $0x2
c0107f89:	8d 45 ea             	lea    -0x16(%ebp),%eax
c0107f8c:	50                   	push   %eax
c0107f8d:	e8 6a ca ff ff       	call   c01049fc <open>
c0107f92:	83 c4 10             	add    $0x10,%esp
c0107f95:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0107f98:	c7 45 d6 69 6e 73 74 	movl   $0x74736e69,-0x2a(%ebp)
c0107f9f:	c7 45 da 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x26(%ebp)
c0107fa6:	c7 45 de 74 61 72 00 	movl   $0x726174,-0x22(%ebp)
c0107fad:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c0107fb4:	c7 45 e6 00 00 00 00 	movl   $0x0,-0x1a(%ebp)
c0107fbb:	83 ec 0c             	sub    $0xc,%esp
c0107fbe:	8d 45 d6             	lea    -0x2a(%ebp),%eax
c0107fc1:	50                   	push   %eax
c0107fc2:	e8 f5 eb ff ff       	call   c0106bbc <untar>
c0107fc7:	83 c4 10             	add    $0x10,%esp
c0107fca:	e8 02 fe ff ff       	call   c0107dd1 <simple_shell>
c0107fcf:	90                   	nop
c0107fd0:	c9                   	leave  
c0107fd1:	c3                   	ret    

c0107fd2 <test_exec>:
c0107fd2:	55                   	push   %ebp
c0107fd3:	89 e5                	mov    %esp,%ebp
c0107fd5:	83 ec 38             	sub    $0x38,%esp
c0107fd8:	83 ec 0c             	sub    $0xc,%esp
c0107fdb:	68 80 a7 10 c0       	push   $0xc010a780
c0107fe0:	e8 a7 80 ff ff       	call   c010008c <disp_str>
c0107fe5:	83 c4 10             	add    $0x10,%esp
c0107fe8:	83 ec 0c             	sub    $0xc,%esp
c0107feb:	68 82 a7 10 c0       	push   $0xc010a782
c0107ff0:	e8 97 80 ff ff       	call   c010008c <disp_str>
c0107ff5:	83 c4 10             	add    $0x10,%esp
c0107ff8:	c7 45 e6 64 65 76 5f 	movl   $0x5f766564,-0x1a(%ebp)
c0107fff:	c7 45 ea 74 74 79 31 	movl   $0x31797474,-0x16(%ebp)
c0108006:	66 c7 45 ee 00 00    	movw   $0x0,-0x12(%ebp)
c010800c:	83 ec 08             	sub    $0x8,%esp
c010800f:	6a 02                	push   $0x2
c0108011:	8d 45 e6             	lea    -0x1a(%ebp),%eax
c0108014:	50                   	push   %eax
c0108015:	e8 e2 c9 ff ff       	call   c01049fc <open>
c010801a:	83 c4 10             	add    $0x10,%esp
c010801d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108020:	c7 45 d2 69 6e 73 74 	movl   $0x74736e69,-0x2e(%ebp)
c0108027:	c7 45 d6 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x2a(%ebp)
c010802e:	c7 45 da 74 61 72 00 	movl   $0x726174,-0x26(%ebp)
c0108035:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
c010803c:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c0108043:	83 ec 0c             	sub    $0xc,%esp
c0108046:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c0108049:	50                   	push   %eax
c010804a:	e8 6d eb ff ff       	call   c0106bbc <untar>
c010804f:	83 c4 10             	add    $0x10,%esp
c0108052:	83 ec 08             	sub    $0x8,%esp
c0108055:	6a 00                	push   $0x0
c0108057:	68 4c ad 10 c0       	push   $0xc010ad4c
c010805c:	68 50 ad 10 c0       	push   $0xc010ad50
c0108061:	68 ce ac 10 c0       	push   $0xc010acce
c0108066:	68 c9 ac 10 c0       	push   $0xc010acc9
c010806b:	68 46 ad 10 c0       	push   $0xc010ad46
c0108070:	e8 ba cf ff ff       	call   c010502f <execl>
c0108075:	83 c4 20             	add    $0x20,%esp
c0108078:	e8 1e ea ff ff       	call   c0106a9b <stop_here>
c010807d:	e8 da cc ff ff       	call   c0104d5c <fork>
c0108082:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108085:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0108089:	7e 25                	jle    c01080b0 <test_exec+0xde>
c010808b:	83 ec 0c             	sub    $0xc,%esp
c010808e:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0108091:	50                   	push   %eax
c0108092:	e8 52 cc ff ff       	call   c0104ce9 <wait>
c0108097:	83 c4 10             	add    $0x10,%esp
c010809a:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010809d:	83 ec 08             	sub    $0x8,%esp
c01080a0:	50                   	push   %eax
c01080a1:	68 56 ad 10 c0       	push   $0xc010ad56
c01080a6:	e8 b0 01 00 00       	call   c010825b <Printf>
c01080ab:	83 c4 10             	add    $0x10,%esp
c01080ae:	eb 33                	jmp    c01080e3 <test_exec+0x111>
c01080b0:	83 ec 0c             	sub    $0xc,%esp
c01080b3:	68 68 ad 10 c0       	push   $0xc010ad68
c01080b8:	e8 9e 01 00 00       	call   c010825b <Printf>
c01080bd:	83 c4 10             	add    $0x10,%esp
c01080c0:	83 ec 0c             	sub    $0xc,%esp
c01080c3:	6a 00                	push   $0x0
c01080c5:	68 50 ad 10 c0       	push   $0xc010ad50
c01080ca:	68 ce ac 10 c0       	push   $0xc010acce
c01080cf:	68 c9 ac 10 c0       	push   $0xc010acc9
c01080d4:	68 46 ad 10 c0       	push   $0xc010ad46
c01080d9:	e8 51 cf ff ff       	call   c010502f <execl>
c01080de:	83 c4 20             	add    $0x20,%esp
c01080e1:	eb fe                	jmp    c01080e1 <test_exec+0x10f>
c01080e3:	c9                   	leave  
c01080e4:	c3                   	ret    

c01080e5 <INIT>:
c01080e5:	55                   	push   %ebp
c01080e6:	89 e5                	mov    %esp,%ebp
c01080e8:	83 ec 08             	sub    $0x8,%esp
c01080eb:	e8 7a fe ff ff       	call   c0107f6a <test_shell>
c01080f0:	eb fe                	jmp    c01080f0 <INIT+0xb>

c01080f2 <TestA>:
c01080f2:	55                   	push   %ebp
c01080f3:	89 e5                	mov    %esp,%ebp
c01080f5:	83 ec 08             	sub    $0x8,%esp
c01080f8:	83 ec 0c             	sub    $0xc,%esp
c01080fb:	6a 05                	push   $0x5
c01080fd:	e8 75 ee ff ff       	call   c0106f77 <disp_int>
c0108102:	83 c4 10             	add    $0x10,%esp
c0108105:	83 ec 0c             	sub    $0xc,%esp
c0108108:	68 93 a8 10 c0       	push   $0xc010a893
c010810d:	e8 7a 7f ff ff       	call   c010008c <disp_str>
c0108112:	83 c4 10             	add    $0x10,%esp
c0108115:	83 ec 0c             	sub    $0xc,%esp
c0108118:	68 76 ad 10 c0       	push   $0xc010ad76
c010811d:	e8 6a 7f ff ff       	call   c010008c <disp_str>
c0108122:	83 c4 10             	add    $0x10,%esp
c0108125:	eb fe                	jmp    c0108125 <TestA+0x33>

c0108127 <delay>:
c0108127:	55                   	push   %ebp
c0108128:	89 e5                	mov    %esp,%ebp
c010812a:	83 ec 10             	sub    $0x10,%esp
c010812d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0108134:	eb 2a                	jmp    c0108160 <delay+0x39>
c0108136:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c010813d:	eb 17                	jmp    c0108156 <delay+0x2f>
c010813f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108146:	eb 04                	jmp    c010814c <delay+0x25>
c0108148:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c010814c:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c0108150:	7e f6                	jle    c0108148 <delay+0x21>
c0108152:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0108156:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
c010815a:	7e e3                	jle    c010813f <delay+0x18>
c010815c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0108160:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0108163:	3b 45 08             	cmp    0x8(%ebp),%eax
c0108166:	7c ce                	jl     c0108136 <delay+0xf>
c0108168:	90                   	nop
c0108169:	c9                   	leave  
c010816a:	c3                   	ret    

c010816b <TestB>:
c010816b:	55                   	push   %ebp
c010816c:	89 e5                	mov    %esp,%ebp
c010816e:	83 ec 08             	sub    $0x8,%esp
c0108171:	83 ec 0c             	sub    $0xc,%esp
c0108174:	68 7d ad 10 c0       	push   $0xc010ad7d
c0108179:	e8 0e 7f ff ff       	call   c010008c <disp_str>
c010817e:	83 c4 10             	add    $0x10,%esp
c0108181:	eb fe                	jmp    c0108181 <TestB+0x16>

c0108183 <TestC>:
c0108183:	55                   	push   %ebp
c0108184:	89 e5                	mov    %esp,%ebp
c0108186:	83 ec 18             	sub    $0x18,%esp
c0108189:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108190:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c0108194:	77 1a                	ja     c01081b0 <TestC+0x2d>
c0108196:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
c010819d:	83 ec 08             	sub    $0x8,%esp
c01081a0:	ff 75 f0             	pushl  -0x10(%ebp)
c01081a3:	68 80 ad 10 c0       	push   $0xc010ad80
c01081a8:	e8 ae 00 00 00       	call   c010825b <Printf>
c01081ad:	83 c4 10             	add    $0x10,%esp
c01081b0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01081b4:	eb da                	jmp    c0108190 <TestC+0xd>

c01081b6 <sys_get_ticks>:
c01081b6:	55                   	push   %ebp
c01081b7:	89 e5                	mov    %esp,%ebp
c01081b9:	a1 e8 0e 11 c0       	mov    0xc0110ee8,%eax
c01081be:	8b 15 ec 0e 11 c0    	mov    0xc0110eec,%edx
c01081c4:	5d                   	pop    %ebp
c01081c5:	c3                   	ret    

c01081c6 <sys_write>:
c01081c6:	55                   	push   %ebp
c01081c7:	89 e5                	mov    %esp,%ebp
c01081c9:	83 ec 18             	sub    $0x18,%esp
c01081cc:	8b 45 10             	mov    0x10(%ebp),%eax
c01081cf:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c01081d5:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c01081db:	05 00 fe 10 c0       	add    $0xc010fe00,%eax
c01081e0:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01081e3:	8b 45 0c             	mov    0xc(%ebp),%eax
c01081e6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01081e9:	8b 45 08             	mov    0x8(%ebp),%eax
c01081ec:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01081ef:	eb 20                	jmp    c0108211 <sys_write+0x4b>
c01081f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01081f4:	0f b6 00             	movzbl (%eax),%eax
c01081f7:	0f b6 c0             	movzbl %al,%eax
c01081fa:	83 ec 08             	sub    $0x8,%esp
c01081fd:	50                   	push   %eax
c01081fe:	ff 75 ec             	pushl  -0x14(%ebp)
c0108201:	e8 67 bb ff ff       	call   c0103d6d <out_char>
c0108206:	83 c4 10             	add    $0x10,%esp
c0108209:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c010820d:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
c0108211:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0108215:	7f da                	jg     c01081f1 <sys_write+0x2b>
c0108217:	90                   	nop
c0108218:	c9                   	leave  
c0108219:	c3                   	ret    

c010821a <milli_delay>:
c010821a:	55                   	push   %ebp
c010821b:	89 e5                	mov    %esp,%ebp
c010821d:	83 ec 18             	sub    $0x18,%esp
c0108220:	e8 8a 11 00 00       	call   c01093af <get_ticks_ipc>
c0108225:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108228:	90                   	nop
c0108229:	e8 81 11 00 00       	call   c01093af <get_ticks_ipc>
c010822e:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0108231:	89 c1                	mov    %eax,%ecx
c0108233:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
c0108238:	89 c8                	mov    %ecx,%eax
c010823a:	f7 ea                	imul   %edx
c010823c:	c1 fa 05             	sar    $0x5,%edx
c010823f:	89 c8                	mov    %ecx,%eax
c0108241:	c1 f8 1f             	sar    $0x1f,%eax
c0108244:	29 c2                	sub    %eax,%edx
c0108246:	89 d0                	mov    %edx,%eax
c0108248:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
c010824e:	39 45 08             	cmp    %eax,0x8(%ebp)
c0108251:	77 d6                	ja     c0108229 <milli_delay+0xf>
c0108253:	90                   	nop
c0108254:	c9                   	leave  
c0108255:	c3                   	ret    

c0108256 <TaskSys>:
c0108256:	55                   	push   %ebp
c0108257:	89 e5                	mov    %esp,%ebp
c0108259:	eb fe                	jmp    c0108259 <TaskSys+0x3>

c010825b <Printf>:
c010825b:	55                   	push   %ebp
c010825c:	89 e5                	mov    %esp,%ebp
c010825e:	81 ec 18 01 00 00    	sub    $0x118,%esp
c0108264:	83 ec 04             	sub    $0x4,%esp
c0108267:	68 00 01 00 00       	push   $0x100
c010826c:	6a 00                	push   $0x0
c010826e:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108274:	50                   	push   %eax
c0108275:	e8 71 2f 00 00       	call   c010b1eb <Memset>
c010827a:	83 c4 10             	add    $0x10,%esp
c010827d:	8d 45 0c             	lea    0xc(%ebp),%eax
c0108280:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108283:	8b 45 08             	mov    0x8(%ebp),%eax
c0108286:	83 ec 04             	sub    $0x4,%esp
c0108289:	ff 75 f4             	pushl  -0xc(%ebp)
c010828c:	50                   	push   %eax
c010828d:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108293:	50                   	push   %eax
c0108294:	e8 20 00 00 00       	call   c01082b9 <vsprintf>
c0108299:	83 c4 10             	add    $0x10,%esp
c010829c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010829f:	83 ec 04             	sub    $0x4,%esp
c01082a2:	ff 75 f0             	pushl  -0x10(%ebp)
c01082a5:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c01082ab:	50                   	push   %eax
c01082ac:	6a 00                	push   $0x0
c01082ae:	e8 5f c9 ff ff       	call   c0104c12 <write>
c01082b3:	83 c4 10             	add    $0x10,%esp
c01082b6:	90                   	nop
c01082b7:	c9                   	leave  
c01082b8:	c3                   	ret    

c01082b9 <vsprintf>:
c01082b9:	55                   	push   %ebp
c01082ba:	89 e5                	mov    %esp,%ebp
c01082bc:	81 ec 68 02 00 00    	sub    $0x268,%esp
c01082c2:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c01082c8:	89 85 e4 fd ff ff    	mov    %eax,-0x21c(%ebp)
c01082ce:	83 ec 04             	sub    $0x4,%esp
c01082d1:	6a 40                	push   $0x40
c01082d3:	6a 00                	push   $0x0
c01082d5:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c01082db:	50                   	push   %eax
c01082dc:	e8 0a 2f 00 00       	call   c010b1eb <Memset>
c01082e1:	83 c4 10             	add    $0x10,%esp
c01082e4:	8b 45 10             	mov    0x10(%ebp),%eax
c01082e7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01082ea:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01082f1:	8b 45 08             	mov    0x8(%ebp),%eax
c01082f4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01082f7:	e9 53 01 00 00       	jmp    c010844f <vsprintf+0x196>
c01082fc:	8b 45 0c             	mov    0xc(%ebp),%eax
c01082ff:	0f b6 00             	movzbl (%eax),%eax
c0108302:	3c 25                	cmp    $0x25,%al
c0108304:	74 16                	je     c010831c <vsprintf+0x63>
c0108306:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108309:	8d 50 01             	lea    0x1(%eax),%edx
c010830c:	89 55 f4             	mov    %edx,-0xc(%ebp)
c010830f:	8b 55 0c             	mov    0xc(%ebp),%edx
c0108312:	0f b6 12             	movzbl (%edx),%edx
c0108315:	88 10                	mov    %dl,(%eax)
c0108317:	e9 2f 01 00 00       	jmp    c010844b <vsprintf+0x192>
c010831c:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c0108320:	8b 45 0c             	mov    0xc(%ebp),%eax
c0108323:	0f b6 00             	movzbl (%eax),%eax
c0108326:	0f be c0             	movsbl %al,%eax
c0108329:	83 f8 64             	cmp    $0x64,%eax
c010832c:	74 26                	je     c0108354 <vsprintf+0x9b>
c010832e:	83 f8 64             	cmp    $0x64,%eax
c0108331:	7f 0e                	jg     c0108341 <vsprintf+0x88>
c0108333:	83 f8 63             	cmp    $0x63,%eax
c0108336:	0f 84 f2 00 00 00    	je     c010842e <vsprintf+0x175>
c010833c:	e9 0a 01 00 00       	jmp    c010844b <vsprintf+0x192>
c0108341:	83 f8 73             	cmp    $0x73,%eax
c0108344:	0f 84 b0 00 00 00    	je     c01083fa <vsprintf+0x141>
c010834a:	83 f8 78             	cmp    $0x78,%eax
c010834d:	74 5d                	je     c01083ac <vsprintf+0xf3>
c010834f:	e9 f7 00 00 00       	jmp    c010844b <vsprintf+0x192>
c0108354:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108357:	8b 00                	mov    (%eax),%eax
c0108359:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010835c:	83 ec 04             	sub    $0x4,%esp
c010835f:	6a 0a                	push   $0xa
c0108361:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c0108367:	50                   	push   %eax
c0108368:	ff 75 e8             	pushl  -0x18(%ebp)
c010836b:	e8 96 10 00 00       	call   c0109406 <itoa>
c0108370:	83 c4 10             	add    $0x10,%esp
c0108373:	83 ec 08             	sub    $0x8,%esp
c0108376:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c010837c:	50                   	push   %eax
c010837d:	ff 75 f4             	pushl  -0xc(%ebp)
c0108380:	e8 85 2e 00 00       	call   c010b20a <Strcpy>
c0108385:	83 c4 10             	add    $0x10,%esp
c0108388:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c010838c:	83 ec 0c             	sub    $0xc,%esp
c010838f:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0108395:	50                   	push   %eax
c0108396:	e8 89 2e 00 00       	call   c010b224 <Strlen>
c010839b:	83 c4 10             	add    $0x10,%esp
c010839e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01083a1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01083a4:	01 45 f4             	add    %eax,-0xc(%ebp)
c01083a7:	e9 9f 00 00 00       	jmp    c010844b <vsprintf+0x192>
c01083ac:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01083af:	8b 00                	mov    (%eax),%eax
c01083b1:	83 ec 08             	sub    $0x8,%esp
c01083b4:	50                   	push   %eax
c01083b5:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c01083bb:	50                   	push   %eax
c01083bc:	e8 10 eb ff ff       	call   c0106ed1 <atoi>
c01083c1:	83 c4 10             	add    $0x10,%esp
c01083c4:	83 ec 08             	sub    $0x8,%esp
c01083c7:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c01083cd:	50                   	push   %eax
c01083ce:	ff 75 f4             	pushl  -0xc(%ebp)
c01083d1:	e8 34 2e 00 00       	call   c010b20a <Strcpy>
c01083d6:	83 c4 10             	add    $0x10,%esp
c01083d9:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c01083dd:	83 ec 0c             	sub    $0xc,%esp
c01083e0:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c01083e6:	50                   	push   %eax
c01083e7:	e8 38 2e 00 00       	call   c010b224 <Strlen>
c01083ec:	83 c4 10             	add    $0x10,%esp
c01083ef:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01083f2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01083f5:	01 45 f4             	add    %eax,-0xc(%ebp)
c01083f8:	eb 51                	jmp    c010844b <vsprintf+0x192>
c01083fa:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01083fd:	8b 00                	mov    (%eax),%eax
c01083ff:	83 ec 08             	sub    $0x8,%esp
c0108402:	50                   	push   %eax
c0108403:	ff 75 f4             	pushl  -0xc(%ebp)
c0108406:	e8 ff 2d 00 00       	call   c010b20a <Strcpy>
c010840b:	83 c4 10             	add    $0x10,%esp
c010840e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108411:	8b 00                	mov    (%eax),%eax
c0108413:	83 ec 0c             	sub    $0xc,%esp
c0108416:	50                   	push   %eax
c0108417:	e8 08 2e 00 00       	call   c010b224 <Strlen>
c010841c:	83 c4 10             	add    $0x10,%esp
c010841f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108422:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0108426:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0108429:	01 45 f4             	add    %eax,-0xc(%ebp)
c010842c:	eb 1d                	jmp    c010844b <vsprintf+0x192>
c010842e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108431:	0f b6 10             	movzbl (%eax),%edx
c0108434:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108437:	88 10                	mov    %dl,(%eax)
c0108439:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c010843d:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0108444:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0108447:	01 45 f4             	add    %eax,-0xc(%ebp)
c010844a:	90                   	nop
c010844b:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c010844f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0108452:	0f b6 00             	movzbl (%eax),%eax
c0108455:	84 c0                	test   %al,%al
c0108457:	0f 85 9f fe ff ff    	jne    c01082fc <vsprintf+0x43>
c010845d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108460:	2b 45 08             	sub    0x8(%ebp),%eax
c0108463:	c9                   	leave  
c0108464:	c3                   	ret    

c0108465 <printx>:
c0108465:	55                   	push   %ebp
c0108466:	89 e5                	mov    %esp,%ebp
c0108468:	81 ec 18 01 00 00    	sub    $0x118,%esp
c010846e:	8d 45 0c             	lea    0xc(%ebp),%eax
c0108471:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108474:	8b 45 08             	mov    0x8(%ebp),%eax
c0108477:	83 ec 04             	sub    $0x4,%esp
c010847a:	ff 75 f4             	pushl  -0xc(%ebp)
c010847d:	50                   	push   %eax
c010847e:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108484:	50                   	push   %eax
c0108485:	e8 2f fe ff ff       	call   c01082b9 <vsprintf>
c010848a:	83 c4 10             	add    $0x10,%esp
c010848d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108490:	83 ec 08             	sub    $0x8,%esp
c0108493:	ff 75 f0             	pushl  -0x10(%ebp)
c0108496:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c010849c:	50                   	push   %eax
c010849d:	e8 2e 90 ff ff       	call   c01014d0 <write_debug>
c01084a2:	83 c4 10             	add    $0x10,%esp
c01084a5:	90                   	nop
c01084a6:	c9                   	leave  
c01084a7:	c3                   	ret    

c01084a8 <sys_printx>:
c01084a8:	55                   	push   %ebp
c01084a9:	89 e5                	mov    %esp,%ebp
c01084ab:	83 ec 28             	sub    $0x28,%esp
c01084ae:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c01084b3:	85 c0                	test   %eax,%eax
c01084b5:	75 15                	jne    c01084cc <sys_printx+0x24>
c01084b7:	8b 45 10             	mov    0x10(%ebp),%eax
c01084ba:	8b 80 80 02 00 00    	mov    0x280(%eax),%eax
c01084c0:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01084c3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01084ca:	eb 10                	jmp    c01084dc <sys_printx+0x34>
c01084cc:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c01084d1:	85 c0                	test   %eax,%eax
c01084d3:	74 07                	je     c01084dc <sys_printx+0x34>
c01084d5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01084dc:	8b 55 08             	mov    0x8(%ebp),%edx
c01084df:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01084e2:	01 d0                	add    %edx,%eax
c01084e4:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01084e7:	8b 45 10             	mov    0x10(%ebp),%eax
c01084ea:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c01084f0:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c01084f6:	05 00 fe 10 c0       	add    $0xc010fe00,%eax
c01084fb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01084fe:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108501:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108504:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108507:	0f b6 00             	movzbl (%eax),%eax
c010850a:	88 45 e3             	mov    %al,-0x1d(%ebp)
c010850d:	eb 3a                	jmp    c0108549 <sys_printx+0xa1>
c010850f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108512:	0f b6 00             	movzbl (%eax),%eax
c0108515:	3c 3b                	cmp    $0x3b,%al
c0108517:	74 0a                	je     c0108523 <sys_printx+0x7b>
c0108519:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010851c:	0f b6 00             	movzbl (%eax),%eax
c010851f:	3c 3a                	cmp    $0x3a,%al
c0108521:	75 06                	jne    c0108529 <sys_printx+0x81>
c0108523:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0108527:	eb 20                	jmp    c0108549 <sys_printx+0xa1>
c0108529:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010852c:	0f b6 00             	movzbl (%eax),%eax
c010852f:	0f b6 c0             	movzbl %al,%eax
c0108532:	83 ec 08             	sub    $0x8,%esp
c0108535:	50                   	push   %eax
c0108536:	ff 75 e4             	pushl  -0x1c(%ebp)
c0108539:	e8 2f b8 ff ff       	call   c0103d6d <out_char>
c010853e:	83 c4 10             	add    $0x10,%esp
c0108541:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0108545:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0108549:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010854d:	7f c0                	jg     c010850f <sys_printx+0x67>
c010854f:	80 7d e3 3b          	cmpb   $0x3b,-0x1d(%ebp)
c0108553:	75 10                	jne    c0108565 <sys_printx+0xbd>
c0108555:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c010855a:	85 c0                	test   %eax,%eax
c010855c:	74 13                	je     c0108571 <sys_printx+0xc9>
c010855e:	e8 64 7d ff ff       	call   c01002c7 <disable_int>
c0108563:	eb 0c                	jmp    c0108571 <sys_printx+0xc9>
c0108565:	80 7d e3 3a          	cmpb   $0x3a,-0x1d(%ebp)
c0108569:	75 06                	jne    c0108571 <sys_printx+0xc9>
c010856b:	e8 57 7d ff ff       	call   c01002c7 <disable_int>
c0108570:	90                   	nop
c0108571:	90                   	nop
c0108572:	c9                   	leave  
c0108573:	c3                   	ret    

c0108574 <spin>:
c0108574:	55                   	push   %ebp
c0108575:	89 e5                	mov    %esp,%ebp
c0108577:	83 ec 08             	sub    $0x8,%esp
c010857a:	83 ec 0c             	sub    $0xc,%esp
c010857d:	ff 75 08             	pushl  0x8(%ebp)
c0108580:	e8 07 7b ff ff       	call   c010008c <disp_str>
c0108585:	83 c4 10             	add    $0x10,%esp
c0108588:	83 ec 0c             	sub    $0xc,%esp
c010858b:	68 93 a8 10 c0       	push   $0xc010a893
c0108590:	e8 f7 7a ff ff       	call   c010008c <disp_str>
c0108595:	83 c4 10             	add    $0x10,%esp
c0108598:	eb fe                	jmp    c0108598 <spin+0x24>

c010859a <panic>:
c010859a:	55                   	push   %ebp
c010859b:	89 e5                	mov    %esp,%ebp
c010859d:	83 ec 08             	sub    $0x8,%esp
c01085a0:	83 ec 04             	sub    $0x4,%esp
c01085a3:	ff 75 08             	pushl  0x8(%ebp)
c01085a6:	6a 3a                	push   $0x3a
c01085a8:	68 8d ad 10 c0       	push   $0xc010ad8d
c01085ad:	e8 b3 fe ff ff       	call   c0108465 <printx>
c01085b2:	83 c4 10             	add    $0x10,%esp
c01085b5:	90                   	nop
c01085b6:	c9                   	leave  
c01085b7:	c3                   	ret    

c01085b8 <assertion_failure>:
c01085b8:	55                   	push   %ebp
c01085b9:	89 e5                	mov    %esp,%ebp
c01085bb:	83 ec 08             	sub    $0x8,%esp
c01085be:	83 ec 08             	sub    $0x8,%esp
c01085c1:	ff 75 14             	pushl  0x14(%ebp)
c01085c4:	ff 75 10             	pushl  0x10(%ebp)
c01085c7:	ff 75 0c             	pushl  0xc(%ebp)
c01085ca:	ff 75 08             	pushl  0x8(%ebp)
c01085cd:	6a 3b                	push   $0x3b
c01085cf:	68 94 ad 10 c0       	push   $0xc010ad94
c01085d4:	e8 8c fe ff ff       	call   c0108465 <printx>
c01085d9:	83 c4 20             	add    $0x20,%esp
c01085dc:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c01085e3:	00 00 00 
c01085e6:	83 ec 0c             	sub    $0xc,%esp
c01085e9:	68 80 a7 10 c0       	push   $0xc010a780
c01085ee:	e8 99 7a ff ff       	call   c010008c <disp_str>
c01085f3:	83 c4 10             	add    $0x10,%esp
c01085f6:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c01085fb:	83 ec 0c             	sub    $0xc,%esp
c01085fe:	50                   	push   %eax
c01085ff:	e8 73 e9 ff ff       	call   c0106f77 <disp_int>
c0108604:	83 c4 10             	add    $0x10,%esp
c0108607:	83 ec 0c             	sub    $0xc,%esp
c010860a:	68 82 a7 10 c0       	push   $0xc010a782
c010860f:	e8 78 7a ff ff       	call   c010008c <disp_str>
c0108614:	83 c4 10             	add    $0x10,%esp
c0108617:	83 ec 0c             	sub    $0xc,%esp
c010861a:	68 c7 ad 10 c0       	push   $0xc010adc7
c010861f:	e8 50 ff ff ff       	call   c0108574 <spin>
c0108624:	83 c4 10             	add    $0x10,%esp
c0108627:	90                   	nop
c0108628:	c9                   	leave  
c0108629:	c3                   	ret    

c010862a <assertion_failure2>:
c010862a:	55                   	push   %ebp
c010862b:	89 e5                	mov    %esp,%ebp
c010862d:	83 ec 08             	sub    $0x8,%esp
c0108630:	83 ec 04             	sub    $0x4,%esp
c0108633:	ff 75 18             	pushl  0x18(%ebp)
c0108636:	ff 75 14             	pushl  0x14(%ebp)
c0108639:	ff 75 10             	pushl  0x10(%ebp)
c010863c:	ff 75 0c             	pushl  0xc(%ebp)
c010863f:	ff 75 08             	pushl  0x8(%ebp)
c0108642:	6a 3b                	push   $0x3b
c0108644:	68 d4 ad 10 c0       	push   $0xc010add4
c0108649:	e8 17 fe ff ff       	call   c0108465 <printx>
c010864e:	83 c4 20             	add    $0x20,%esp
c0108651:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0108658:	00 00 00 
c010865b:	83 ec 0c             	sub    $0xc,%esp
c010865e:	68 80 a7 10 c0       	push   $0xc010a780
c0108663:	e8 24 7a ff ff       	call   c010008c <disp_str>
c0108668:	83 c4 10             	add    $0x10,%esp
c010866b:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0108670:	83 ec 0c             	sub    $0xc,%esp
c0108673:	50                   	push   %eax
c0108674:	e8 fe e8 ff ff       	call   c0106f77 <disp_int>
c0108679:	83 c4 10             	add    $0x10,%esp
c010867c:	83 ec 0c             	sub    $0xc,%esp
c010867f:	68 82 a7 10 c0       	push   $0xc010a782
c0108684:	e8 03 7a ff ff       	call   c010008c <disp_str>
c0108689:	83 c4 10             	add    $0x10,%esp
c010868c:	83 ec 0c             	sub    $0xc,%esp
c010868f:	68 c7 ad 10 c0       	push   $0xc010adc7
c0108694:	e8 db fe ff ff       	call   c0108574 <spin>
c0108699:	83 c4 10             	add    $0x10,%esp
c010869c:	90                   	nop
c010869d:	c9                   	leave  
c010869e:	c3                   	ret    

c010869f <dead_lock>:
c010869f:	55                   	push   %ebp
c01086a0:	89 e5                	mov    %esp,%ebp
c01086a2:	b8 00 00 00 00       	mov    $0x0,%eax
c01086a7:	5d                   	pop    %ebp
c01086a8:	c3                   	ret    

c01086a9 <sys_send_msg>:
c01086a9:	55                   	push   %ebp
c01086aa:	89 e5                	mov    %esp,%ebp
c01086ac:	83 ec 58             	sub    $0x58,%esp
c01086af:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01086b6:	83 ec 0c             	sub    $0xc,%esp
c01086b9:	ff 75 0c             	pushl  0xc(%ebp)
c01086bc:	e8 25 b0 ff ff       	call   c01036e6 <pid2proc>
c01086c1:	83 c4 10             	add    $0x10,%esp
c01086c4:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01086c7:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c01086cb:	74 2c                	je     c01086f9 <sys_send_msg+0x50>
c01086cd:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01086d0:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c01086d6:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c01086db:	74 1c                	je     c01086f9 <sys_send_msg+0x50>
c01086dd:	68 25 05 00 00       	push   $0x525
c01086e2:	68 d4 ac 10 c0       	push   $0xc010acd4
c01086e7:	68 d4 ac 10 c0       	push   $0xc010acd4
c01086ec:	68 14 ae 10 c0       	push   $0xc010ae14
c01086f1:	e8 c2 fe ff ff       	call   c01085b8 <assertion_failure>
c01086f6:	83 c4 10             	add    $0x10,%esp
c01086f9:	8b 45 10             	mov    0x10(%ebp),%eax
c01086fc:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c0108702:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0108707:	74 1c                	je     c0108725 <sys_send_msg+0x7c>
c0108709:	68 27 05 00 00       	push   $0x527
c010870e:	68 d4 ac 10 c0       	push   $0xc010acd4
c0108713:	68 d4 ac 10 c0       	push   $0xc010acd4
c0108718:	68 3c ae 10 c0       	push   $0xc010ae3c
c010871d:	e8 96 fe ff ff       	call   c01085b8 <assertion_failure>
c0108722:	83 c4 10             	add    $0x10,%esp
c0108725:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0108729:	75 22                	jne    c010874d <sys_send_msg+0xa4>
c010872b:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c010872f:	75 1c                	jne    c010874d <sys_send_msg+0xa4>
c0108731:	68 2a 05 00 00       	push   $0x52a
c0108736:	68 d4 ac 10 c0       	push   $0xc010acd4
c010873b:	68 d4 ac 10 c0       	push   $0xc010acd4
c0108740:	68 5f ae 10 c0       	push   $0xc010ae5f
c0108745:	e8 6e fe ff ff       	call   c01085b8 <assertion_failure>
c010874a:	83 c4 10             	add    $0x10,%esp
c010874d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108750:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108757:	84 c0                	test   %al,%al
c0108759:	74 65                	je     c01087c0 <sys_send_msg+0x117>
c010875b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010875e:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108765:	3c 01                	cmp    $0x1,%al
c0108767:	74 57                	je     c01087c0 <sys_send_msg+0x117>
c0108769:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010876c:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108773:	3c 02                	cmp    $0x2,%al
c0108775:	74 49                	je     c01087c0 <sys_send_msg+0x117>
c0108777:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010877a:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108781:	3c 03                	cmp    $0x3,%al
c0108783:	74 3b                	je     c01087c0 <sys_send_msg+0x117>
c0108785:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108788:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010878f:	3c 04                	cmp    $0x4,%al
c0108791:	74 2d                	je     c01087c0 <sys_send_msg+0x117>
c0108793:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108796:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010879d:	0f be c0             	movsbl %al,%eax
c01087a0:	83 ec 0c             	sub    $0xc,%esp
c01087a3:	68 2e 05 00 00       	push   $0x52e
c01087a8:	68 d4 ac 10 c0       	push   $0xc010acd4
c01087ad:	68 d4 ac 10 c0       	push   $0xc010acd4
c01087b2:	50                   	push   %eax
c01087b3:	68 70 ae 10 c0       	push   $0xc010ae70
c01087b8:	e8 6d fe ff ff       	call   c010862a <assertion_failure2>
c01087bd:	83 c4 20             	add    $0x20,%esp
c01087c0:	8b 45 10             	mov    0x10(%ebp),%eax
c01087c3:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01087ca:	84 c0                	test   %al,%al
c01087cc:	74 65                	je     c0108833 <sys_send_msg+0x18a>
c01087ce:	8b 45 10             	mov    0x10(%ebp),%eax
c01087d1:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01087d8:	3c 01                	cmp    $0x1,%al
c01087da:	74 57                	je     c0108833 <sys_send_msg+0x18a>
c01087dc:	8b 45 10             	mov    0x10(%ebp),%eax
c01087df:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01087e6:	3c 02                	cmp    $0x2,%al
c01087e8:	74 49                	je     c0108833 <sys_send_msg+0x18a>
c01087ea:	8b 45 10             	mov    0x10(%ebp),%eax
c01087ed:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01087f4:	3c 03                	cmp    $0x3,%al
c01087f6:	74 3b                	je     c0108833 <sys_send_msg+0x18a>
c01087f8:	8b 45 10             	mov    0x10(%ebp),%eax
c01087fb:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108802:	3c 04                	cmp    $0x4,%al
c0108804:	74 2d                	je     c0108833 <sys_send_msg+0x18a>
c0108806:	8b 45 10             	mov    0x10(%ebp),%eax
c0108809:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108810:	0f be c0             	movsbl %al,%eax
c0108813:	83 ec 0c             	sub    $0xc,%esp
c0108816:	68 31 05 00 00       	push   $0x531
c010881b:	68 d4 ac 10 c0       	push   $0xc010acd4
c0108820:	68 d4 ac 10 c0       	push   $0xc010acd4
c0108825:	50                   	push   %eax
c0108826:	68 0c af 10 c0       	push   $0xc010af0c
c010882b:	e8 fa fd ff ff       	call   c010862a <assertion_failure2>
c0108830:	83 c4 20             	add    $0x20,%esp
c0108833:	83 ec 0c             	sub    $0xc,%esp
c0108836:	ff 75 10             	pushl  0x10(%ebp)
c0108839:	e8 2e af ff ff       	call   c010376c <proc2pid>
c010883e:	83 c4 10             	add    $0x10,%esp
c0108841:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0108844:	c7 45 e0 7c 00 00 00 	movl   $0x7c,-0x20(%ebp)
c010884b:	8b 45 08             	mov    0x8(%ebp),%eax
c010884e:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0108851:	83 ec 08             	sub    $0x8,%esp
c0108854:	ff 75 e4             	pushl  -0x1c(%ebp)
c0108857:	ff 75 dc             	pushl  -0x24(%ebp)
c010885a:	e8 90 d5 ff ff       	call   c0105def <get_physical_address_proc>
c010885f:	83 c4 10             	add    $0x10,%esp
c0108862:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0108865:	83 ec 08             	sub    $0x8,%esp
c0108868:	ff 75 e0             	pushl  -0x20(%ebp)
c010886b:	ff 75 d8             	pushl  -0x28(%ebp)
c010886e:	e8 a9 d4 ff ff       	call   c0105d1c <alloc_virtual_memory>
c0108873:	83 c4 10             	add    $0x10,%esp
c0108876:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0108879:	8b 45 10             	mov    0x10(%ebp),%eax
c010887c:	8b 80 80 02 00 00    	mov    0x280(%eax),%eax
c0108882:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0108885:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c010888c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010888f:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0108892:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0108895:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0108898:	89 10                	mov    %edx,(%eax)
c010889a:	83 ec 08             	sub    $0x8,%esp
c010889d:	ff 75 0c             	pushl  0xc(%ebp)
c01088a0:	ff 75 e4             	pushl  -0x1c(%ebp)
c01088a3:	e8 f7 fd ff ff       	call   c010869f <dead_lock>
c01088a8:	83 c4 10             	add    $0x10,%esp
c01088ab:	83 f8 01             	cmp    $0x1,%eax
c01088ae:	75 10                	jne    c01088c0 <sys_send_msg+0x217>
c01088b0:	83 ec 0c             	sub    $0xc,%esp
c01088b3:	68 9c af 10 c0       	push   $0xc010af9c
c01088b8:	e8 dd fc ff ff       	call   c010859a <panic>
c01088bd:	83 c4 10             	add    $0x10,%esp
c01088c0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01088c3:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01088ca:	3c 02                	cmp    $0x2,%al
c01088cc:	0f 85 ca 01 00 00    	jne    c0108a9c <sys_send_msg+0x3f3>
c01088d2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01088d5:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c01088db:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c01088de:	74 12                	je     c01088f2 <sys_send_msg+0x249>
c01088e0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01088e3:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c01088e9:	83 f8 12             	cmp    $0x12,%eax
c01088ec:	0f 85 aa 01 00 00    	jne    c0108a9c <sys_send_msg+0x3f3>
c01088f2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01088f5:	8b 80 80 02 00 00    	mov    0x280(%eax),%eax
c01088fb:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c01088fe:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108901:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0108907:	89 45 c0             	mov    %eax,-0x40(%ebp)
c010890a:	83 ec 08             	sub    $0x8,%esp
c010890d:	ff 75 0c             	pushl  0xc(%ebp)
c0108910:	ff 75 c0             	pushl  -0x40(%ebp)
c0108913:	e8 d7 d4 ff ff       	call   c0105def <get_physical_address_proc>
c0108918:	83 c4 10             	add    $0x10,%esp
c010891b:	89 45 bc             	mov    %eax,-0x44(%ebp)
c010891e:	83 ec 08             	sub    $0x8,%esp
c0108921:	ff 75 e0             	pushl  -0x20(%ebp)
c0108924:	ff 75 bc             	pushl  -0x44(%ebp)
c0108927:	e8 f0 d3 ff ff       	call   c0105d1c <alloc_virtual_memory>
c010892c:	83 c4 10             	add    $0x10,%esp
c010892f:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0108932:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0108935:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0108938:	8b 45 b8             	mov    -0x48(%ebp),%eax
c010893b:	83 ec 04             	sub    $0x4,%esp
c010893e:	51                   	push   %ecx
c010893f:	52                   	push   %edx
c0108940:	50                   	push   %eax
c0108941:	e8 43 e2 ff ff       	call   c0106b89 <Memcpy>
c0108946:	83 c4 10             	add    $0x10,%esp
c0108949:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c010894e:	3d 41 05 00 00       	cmp    $0x541,%eax
c0108953:	75 0a                	jne    c010895f <sys_send_msg+0x2b6>
c0108955:	c7 05 a0 f7 10 c0 04 	movl   $0x4,0xc010f7a0
c010895c:	00 00 00 
c010895f:	8b 45 10             	mov    0x10(%ebp),%eax
c0108962:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c0108969:	00 00 00 
c010896c:	8b 45 10             	mov    0x10(%ebp),%eax
c010896f:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0108976:	8b 45 10             	mov    0x10(%ebp),%eax
c0108979:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c0108980:	00 00 00 
c0108983:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108986:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c010898d:	00 00 00 
c0108990:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108993:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c010899a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010899d:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c01089a4:	00 00 00 
c01089a7:	8b 45 10             	mov    0x10(%ebp),%eax
c01089aa:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c01089b1:	00 00 00 
c01089b4:	83 ec 0c             	sub    $0xc,%esp
c01089b7:	ff 75 e8             	pushl  -0x18(%ebp)
c01089ba:	e8 a0 09 00 00       	call   c010935f <unblock>
c01089bf:	83 c4 10             	add    $0x10,%esp
c01089c2:	8b 45 10             	mov    0x10(%ebp),%eax
c01089c5:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01089cc:	84 c0                	test   %al,%al
c01089ce:	74 1c                	je     c01089ec <sys_send_msg+0x343>
c01089d0:	68 69 05 00 00       	push   $0x569
c01089d5:	68 d4 ac 10 c0       	push   $0xc010acd4
c01089da:	68 d4 ac 10 c0       	push   $0xc010acd4
c01089df:	68 a7 af 10 c0       	push   $0xc010afa7
c01089e4:	e8 cf fb ff ff       	call   c01085b8 <assertion_failure>
c01089e9:	83 c4 10             	add    $0x10,%esp
c01089ec:	8b 45 10             	mov    0x10(%ebp),%eax
c01089ef:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c01089f5:	83 f8 21             	cmp    $0x21,%eax
c01089f8:	74 1c                	je     c0108a16 <sys_send_msg+0x36d>
c01089fa:	68 6a 05 00 00       	push   $0x56a
c01089ff:	68 d4 ac 10 c0       	push   $0xc010acd4
c0108a04:	68 d4 ac 10 c0       	push   $0xc010acd4
c0108a09:	68 bb af 10 c0       	push   $0xc010afbb
c0108a0e:	e8 a5 fb ff ff       	call   c01085b8 <assertion_failure>
c0108a13:	83 c4 10             	add    $0x10,%esp
c0108a16:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108a19:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0108a1f:	85 c0                	test   %eax,%eax
c0108a21:	74 1c                	je     c0108a3f <sys_send_msg+0x396>
c0108a23:	68 6c 05 00 00       	push   $0x56c
c0108a28:	68 d4 ac 10 c0       	push   $0xc010acd4
c0108a2d:	68 d4 ac 10 c0       	push   $0xc010acd4
c0108a32:	68 d8 af 10 c0       	push   $0xc010afd8
c0108a37:	e8 7c fb ff ff       	call   c01085b8 <assertion_failure>
c0108a3c:	83 c4 10             	add    $0x10,%esp
c0108a3f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108a42:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108a49:	84 c0                	test   %al,%al
c0108a4b:	74 1c                	je     c0108a69 <sys_send_msg+0x3c0>
c0108a4d:	68 6d 05 00 00       	push   $0x56d
c0108a52:	68 d4 ac 10 c0       	push   $0xc010acd4
c0108a57:	68 d4 ac 10 c0       	push   $0xc010acd4
c0108a5c:	68 ed af 10 c0       	push   $0xc010afed
c0108a61:	e8 52 fb ff ff       	call   c01085b8 <assertion_failure>
c0108a66:	83 c4 10             	add    $0x10,%esp
c0108a69:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108a6c:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0108a72:	83 f8 21             	cmp    $0x21,%eax
c0108a75:	0f 84 45 01 00 00    	je     c0108bc0 <sys_send_msg+0x517>
c0108a7b:	68 6e 05 00 00       	push   $0x56e
c0108a80:	68 d4 ac 10 c0       	push   $0xc010acd4
c0108a85:	68 d4 ac 10 c0       	push   $0xc010acd4
c0108a8a:	68 04 b0 10 c0       	push   $0xc010b004
c0108a8f:	e8 24 fb ff ff       	call   c01085b8 <assertion_failure>
c0108a94:	83 c4 10             	add    $0x10,%esp
c0108a97:	e9 24 01 00 00       	jmp    c0108bc0 <sys_send_msg+0x517>
c0108a9c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108aa3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108aa6:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0108aa9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108aac:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0108ab2:	85 c0                	test   %eax,%eax
c0108ab4:	75 1b                	jne    c0108ad1 <sys_send_msg+0x428>
c0108ab6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108ab9:	8b 55 10             	mov    0x10(%ebp),%edx
c0108abc:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c0108ac2:	8b 45 10             	mov    0x10(%ebp),%eax
c0108ac5:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c0108acc:	00 00 00 
c0108acf:	eb 3f                	jmp    c0108b10 <sys_send_msg+0x467>
c0108ad1:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108ad4:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0108ada:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108add:	eb 12                	jmp    c0108af1 <sys_send_msg+0x448>
c0108adf:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108ae2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108ae5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108ae8:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0108aee:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108af1:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0108af5:	75 e8                	jne    c0108adf <sys_send_msg+0x436>
c0108af7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108afa:	8b 55 10             	mov    0x10(%ebp),%edx
c0108afd:	89 90 50 02 00 00    	mov    %edx,0x250(%eax)
c0108b03:	8b 45 10             	mov    0x10(%ebp),%eax
c0108b06:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c0108b0d:	00 00 00 
c0108b10:	8b 45 10             	mov    0x10(%ebp),%eax
c0108b13:	8b 55 08             	mov    0x8(%ebp),%edx
c0108b16:	89 90 40 02 00 00    	mov    %edx,0x240(%eax)
c0108b1c:	8b 45 10             	mov    0x10(%ebp),%eax
c0108b1f:	8b 55 0c             	mov    0xc(%ebp),%edx
c0108b22:	89 90 44 02 00 00    	mov    %edx,0x244(%eax)
c0108b28:	8b 45 10             	mov    0x10(%ebp),%eax
c0108b2b:	c6 80 3c 02 00 00 01 	movb   $0x1,0x23c(%eax)
c0108b32:	8b 45 10             	mov    0x10(%ebp),%eax
c0108b35:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108b3c:	3c 01                	cmp    $0x1,%al
c0108b3e:	74 1c                	je     c0108b5c <sys_send_msg+0x4b3>
c0108b40:	68 90 05 00 00       	push   $0x590
c0108b45:	68 d4 ac 10 c0       	push   $0xc010acd4
c0108b4a:	68 d4 ac 10 c0       	push   $0xc010acd4
c0108b4f:	68 28 b0 10 c0       	push   $0xc010b028
c0108b54:	e8 5f fa ff ff       	call   c01085b8 <assertion_failure>
c0108b59:	83 c4 10             	add    $0x10,%esp
c0108b5c:	8b 45 10             	mov    0x10(%ebp),%eax
c0108b5f:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c0108b65:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0108b68:	74 1c                	je     c0108b86 <sys_send_msg+0x4dd>
c0108b6a:	68 91 05 00 00       	push   $0x591
c0108b6f:	68 d4 ac 10 c0       	push   $0xc010acd4
c0108b74:	68 d4 ac 10 c0       	push   $0xc010acd4
c0108b79:	68 44 b0 10 c0       	push   $0xc010b044
c0108b7e:	e8 35 fa ff ff       	call   c01085b8 <assertion_failure>
c0108b83:	83 c4 10             	add    $0x10,%esp
c0108b86:	8b 45 10             	mov    0x10(%ebp),%eax
c0108b89:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0108b8f:	39 45 08             	cmp    %eax,0x8(%ebp)
c0108b92:	74 1c                	je     c0108bb0 <sys_send_msg+0x507>
c0108b94:	68 92 05 00 00       	push   $0x592
c0108b99:	68 d4 ac 10 c0       	push   $0xc010acd4
c0108b9e:	68 d4 ac 10 c0       	push   $0xc010acd4
c0108ba3:	68 66 b0 10 c0       	push   $0xc010b066
c0108ba8:	e8 0b fa ff ff       	call   c01085b8 <assertion_failure>
c0108bad:	83 c4 10             	add    $0x10,%esp
c0108bb0:	83 ec 0c             	sub    $0xc,%esp
c0108bb3:	ff 75 10             	pushl  0x10(%ebp)
c0108bb6:	e8 68 07 00 00       	call   c0109323 <block>
c0108bbb:	83 c4 10             	add    $0x10,%esp
c0108bbe:	eb 01                	jmp    c0108bc1 <sys_send_msg+0x518>
c0108bc0:	90                   	nop
c0108bc1:	b8 00 00 00 00       	mov    $0x0,%eax
c0108bc6:	c9                   	leave  
c0108bc7:	c3                   	ret    

c0108bc8 <sys_receive_msg>:
c0108bc8:	55                   	push   %ebp
c0108bc9:	89 e5                	mov    %esp,%ebp
c0108bcb:	83 ec 58             	sub    $0x58,%esp
c0108bce:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108bd5:	83 ec 0c             	sub    $0xc,%esp
c0108bd8:	ff 75 0c             	pushl  0xc(%ebp)
c0108bdb:	e8 06 ab ff ff       	call   c01036e6 <pid2proc>
c0108be0:	83 c4 10             	add    $0x10,%esp
c0108be3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0108be6:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0108bea:	74 2c                	je     c0108c18 <sys_receive_msg+0x50>
c0108bec:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108bef:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c0108bf5:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0108bfa:	74 1c                	je     c0108c18 <sys_receive_msg+0x50>
c0108bfc:	68 a6 05 00 00       	push   $0x5a6
c0108c01:	68 d4 ac 10 c0       	push   $0xc010acd4
c0108c06:	68 d4 ac 10 c0       	push   $0xc010acd4
c0108c0b:	68 3c ae 10 c0       	push   $0xc010ae3c
c0108c10:	e8 a3 f9 ff ff       	call   c01085b8 <assertion_failure>
c0108c15:	83 c4 10             	add    $0x10,%esp
c0108c18:	8b 45 10             	mov    0x10(%ebp),%eax
c0108c1b:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c0108c21:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0108c26:	74 1c                	je     c0108c44 <sys_receive_msg+0x7c>
c0108c28:	68 a8 05 00 00       	push   $0x5a8
c0108c2d:	68 d4 ac 10 c0       	push   $0xc010acd4
c0108c32:	68 d4 ac 10 c0       	push   $0xc010acd4
c0108c37:	68 14 ae 10 c0       	push   $0xc010ae14
c0108c3c:	e8 77 f9 ff ff       	call   c01085b8 <assertion_failure>
c0108c41:	83 c4 10             	add    $0x10,%esp
c0108c44:	8b 45 10             	mov    0x10(%ebp),%eax
c0108c47:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108c4e:	84 c0                	test   %al,%al
c0108c50:	74 65                	je     c0108cb7 <sys_receive_msg+0xef>
c0108c52:	8b 45 10             	mov    0x10(%ebp),%eax
c0108c55:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108c5c:	3c 01                	cmp    $0x1,%al
c0108c5e:	74 57                	je     c0108cb7 <sys_receive_msg+0xef>
c0108c60:	8b 45 10             	mov    0x10(%ebp),%eax
c0108c63:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108c6a:	3c 02                	cmp    $0x2,%al
c0108c6c:	74 49                	je     c0108cb7 <sys_receive_msg+0xef>
c0108c6e:	8b 45 10             	mov    0x10(%ebp),%eax
c0108c71:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108c78:	3c 03                	cmp    $0x3,%al
c0108c7a:	74 3b                	je     c0108cb7 <sys_receive_msg+0xef>
c0108c7c:	8b 45 10             	mov    0x10(%ebp),%eax
c0108c7f:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108c86:	3c 04                	cmp    $0x4,%al
c0108c88:	74 2d                	je     c0108cb7 <sys_receive_msg+0xef>
c0108c8a:	8b 45 10             	mov    0x10(%ebp),%eax
c0108c8d:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108c94:	0f be c0             	movsbl %al,%eax
c0108c97:	83 ec 0c             	sub    $0xc,%esp
c0108c9a:	68 ab 05 00 00       	push   $0x5ab
c0108c9f:	68 d4 ac 10 c0       	push   $0xc010acd4
c0108ca4:	68 d4 ac 10 c0       	push   $0xc010acd4
c0108ca9:	50                   	push   %eax
c0108caa:	68 70 ae 10 c0       	push   $0xc010ae70
c0108caf:	e8 76 f9 ff ff       	call   c010862a <assertion_failure2>
c0108cb4:	83 c4 20             	add    $0x20,%esp
c0108cb7:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0108cbb:	74 73                	je     c0108d30 <sys_receive_msg+0x168>
c0108cbd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108cc0:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108cc7:	84 c0                	test   %al,%al
c0108cc9:	74 65                	je     c0108d30 <sys_receive_msg+0x168>
c0108ccb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108cce:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108cd5:	3c 01                	cmp    $0x1,%al
c0108cd7:	74 57                	je     c0108d30 <sys_receive_msg+0x168>
c0108cd9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108cdc:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108ce3:	3c 02                	cmp    $0x2,%al
c0108ce5:	74 49                	je     c0108d30 <sys_receive_msg+0x168>
c0108ce7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108cea:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108cf1:	3c 03                	cmp    $0x3,%al
c0108cf3:	74 3b                	je     c0108d30 <sys_receive_msg+0x168>
c0108cf5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108cf8:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108cff:	3c 04                	cmp    $0x4,%al
c0108d01:	74 2d                	je     c0108d30 <sys_receive_msg+0x168>
c0108d03:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108d06:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108d0d:	0f be c0             	movsbl %al,%eax
c0108d10:	83 ec 0c             	sub    $0xc,%esp
c0108d13:	68 af 05 00 00       	push   $0x5af
c0108d18:	68 d4 ac 10 c0       	push   $0xc010acd4
c0108d1d:	68 d4 ac 10 c0       	push   $0xc010acd4
c0108d22:	50                   	push   %eax
c0108d23:	68 0c af 10 c0       	push   $0xc010af0c
c0108d28:	e8 fd f8 ff ff       	call   c010862a <assertion_failure2>
c0108d2d:	83 c4 20             	add    $0x20,%esp
c0108d30:	83 ec 0c             	sub    $0xc,%esp
c0108d33:	ff 75 10             	pushl  0x10(%ebp)
c0108d36:	e8 31 aa ff ff       	call   c010376c <proc2pid>
c0108d3b:	83 c4 10             	add    $0x10,%esp
c0108d3e:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0108d41:	c7 45 dc 7c 00 00 00 	movl   $0x7c,-0x24(%ebp)
c0108d48:	8b 45 08             	mov    0x8(%ebp),%eax
c0108d4b:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0108d4e:	8b 45 10             	mov    0x10(%ebp),%eax
c0108d51:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c0108d57:	83 ec 08             	sub    $0x8,%esp
c0108d5a:	50                   	push   %eax
c0108d5b:	ff 75 d8             	pushl  -0x28(%ebp)
c0108d5e:	e8 8c d0 ff ff       	call   c0105def <get_physical_address_proc>
c0108d63:	83 c4 10             	add    $0x10,%esp
c0108d66:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0108d69:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0108d70:	8b 45 10             	mov    0x10(%ebp),%eax
c0108d73:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0108d79:	85 c0                	test   %eax,%eax
c0108d7b:	0f 84 c5 00 00 00    	je     c0108e46 <sys_receive_msg+0x27e>
c0108d81:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0108d85:	74 0d                	je     c0108d94 <sys_receive_msg+0x1cc>
c0108d87:	81 7d 0c 13 02 00 00 	cmpl   $0x213,0xc(%ebp)
c0108d8e:	0f 85 b2 00 00 00    	jne    c0108e46 <sys_receive_msg+0x27e>
c0108d94:	c7 45 d0 7c 00 00 00 	movl   $0x7c,-0x30(%ebp)
c0108d9b:	83 ec 0c             	sub    $0xc,%esp
c0108d9e:	ff 75 d0             	pushl  -0x30(%ebp)
c0108da1:	e8 66 87 ff ff       	call   c010150c <sys_malloc>
c0108da6:	83 c4 10             	add    $0x10,%esp
c0108da9:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0108dac:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0108daf:	83 ec 04             	sub    $0x4,%esp
c0108db2:	50                   	push   %eax
c0108db3:	6a 00                	push   $0x0
c0108db5:	ff 75 cc             	pushl  -0x34(%ebp)
c0108db8:	e8 2e 24 00 00       	call   c010b1eb <Memset>
c0108dbd:	83 c4 10             	add    $0x10,%esp
c0108dc0:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0108dc3:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c0108dc9:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0108dcc:	c7 40 78 d5 07 00 00 	movl   $0x7d5,0x78(%eax)
c0108dd3:	83 ec 08             	sub    $0x8,%esp
c0108dd6:	ff 75 d0             	pushl  -0x30(%ebp)
c0108dd9:	ff 75 d4             	pushl  -0x2c(%ebp)
c0108ddc:	e8 3b cf ff ff       	call   c0105d1c <alloc_virtual_memory>
c0108de1:	83 c4 10             	add    $0x10,%esp
c0108de4:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0108de7:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0108dea:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0108ded:	83 ec 04             	sub    $0x4,%esp
c0108df0:	52                   	push   %edx
c0108df1:	ff 75 cc             	pushl  -0x34(%ebp)
c0108df4:	50                   	push   %eax
c0108df5:	e8 8f dd ff ff       	call   c0106b89 <Memcpy>
c0108dfa:	83 c4 10             	add    $0x10,%esp
c0108dfd:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e00:	c7 80 54 02 00 00 00 	movl   $0x0,0x254(%eax)
c0108e07:	00 00 00 
c0108e0a:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e0d:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c0108e14:	00 00 00 
c0108e17:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e1a:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c0108e21:	00 00 00 
c0108e24:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e27:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0108e2e:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c0108e35:	83 ec 08             	sub    $0x8,%esp
c0108e38:	ff 75 d0             	pushl  -0x30(%ebp)
c0108e3b:	ff 75 cc             	pushl  -0x34(%ebp)
c0108e3e:	e8 de 86 ff ff       	call   c0101521 <sys_free>
c0108e43:	83 c4 10             	add    $0x10,%esp
c0108e46:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c0108e4a:	0f 84 d4 03 00 00    	je     c0109224 <sys_receive_msg+0x65c>
c0108e50:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0108e54:	75 26                	jne    c0108e7c <sys_receive_msg+0x2b4>
c0108e56:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e59:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0108e5f:	85 c0                	test   %eax,%eax
c0108e61:	0f 84 8a 00 00 00    	je     c0108ef1 <sys_receive_msg+0x329>
c0108e67:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e6a:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0108e70:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108e73:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0108e7a:	eb 75                	jmp    c0108ef1 <sys_receive_msg+0x329>
c0108e7c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0108e80:	78 6f                	js     c0108ef1 <sys_receive_msg+0x329>
c0108e82:	83 7d 0c 07          	cmpl   $0x7,0xc(%ebp)
c0108e86:	7f 69                	jg     c0108ef1 <sys_receive_msg+0x329>
c0108e88:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108e8b:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108e92:	3c 01                	cmp    $0x1,%al
c0108e94:	75 5b                	jne    c0108ef1 <sys_receive_msg+0x329>
c0108e96:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108e99:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c0108e9f:	83 f8 12             	cmp    $0x12,%eax
c0108ea2:	74 0e                	je     c0108eb2 <sys_receive_msg+0x2ea>
c0108ea4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108ea7:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c0108ead:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c0108eb0:	75 3f                	jne    c0108ef1 <sys_receive_msg+0x329>
c0108eb2:	8b 45 10             	mov    0x10(%ebp),%eax
c0108eb5:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0108ebb:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108ebe:	eb 2b                	jmp    c0108eeb <sys_receive_msg+0x323>
c0108ec0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108ec3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108ec6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108ec9:	8b 90 14 01 00 00    	mov    0x114(%eax),%edx
c0108ecf:	8b 45 0c             	mov    0xc(%ebp),%eax
c0108ed2:	39 c2                	cmp    %eax,%edx
c0108ed4:	75 09                	jne    c0108edf <sys_receive_msg+0x317>
c0108ed6:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0108edd:	eb 12                	jmp    c0108ef1 <sys_receive_msg+0x329>
c0108edf:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108ee2:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0108ee8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108eeb:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0108eef:	75 cf                	jne    c0108ec0 <sys_receive_msg+0x2f8>
c0108ef1:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0108ef5:	0f 85 4e 02 00 00    	jne    c0109149 <sys_receive_msg+0x581>
c0108efb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108efe:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0108f01:	83 ec 08             	sub    $0x8,%esp
c0108f04:	ff 75 dc             	pushl  -0x24(%ebp)
c0108f07:	ff 75 d4             	pushl  -0x2c(%ebp)
c0108f0a:	e8 0d ce ff ff       	call   c0105d1c <alloc_virtual_memory>
c0108f0f:	83 c4 10             	add    $0x10,%esp
c0108f12:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0108f15:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0108f18:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0108f1e:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0108f21:	83 ec 0c             	sub    $0xc,%esp
c0108f24:	ff 75 c4             	pushl  -0x3c(%ebp)
c0108f27:	e8 40 a8 ff ff       	call   c010376c <proc2pid>
c0108f2c:	83 c4 10             	add    $0x10,%esp
c0108f2f:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0108f32:	83 ec 08             	sub    $0x8,%esp
c0108f35:	ff 75 b8             	pushl  -0x48(%ebp)
c0108f38:	ff 75 bc             	pushl  -0x44(%ebp)
c0108f3b:	e8 af ce ff ff       	call   c0105def <get_physical_address_proc>
c0108f40:	83 c4 10             	add    $0x10,%esp
c0108f43:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0108f46:	83 ec 08             	sub    $0x8,%esp
c0108f49:	ff 75 dc             	pushl  -0x24(%ebp)
c0108f4c:	ff 75 b4             	pushl  -0x4c(%ebp)
c0108f4f:	e8 c8 cd ff ff       	call   c0105d1c <alloc_virtual_memory>
c0108f54:	83 c4 10             	add    $0x10,%esp
c0108f57:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0108f5a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0108f5d:	83 ec 04             	sub    $0x4,%esp
c0108f60:	50                   	push   %eax
c0108f61:	ff 75 b0             	pushl  -0x50(%ebp)
c0108f64:	ff 75 c0             	pushl  -0x40(%ebp)
c0108f67:	e8 1d dc ff ff       	call   c0106b89 <Memcpy>
c0108f6c:	83 c4 10             	add    $0x10,%esp
c0108f6f:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0108f72:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0108f75:	8b 45 10             	mov    0x10(%ebp),%eax
c0108f78:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0108f7e:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0108f81:	75 21                	jne    c0108fa4 <sys_receive_msg+0x3dc>
c0108f83:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108f86:	8b 90 50 02 00 00    	mov    0x250(%eax),%edx
c0108f8c:	8b 45 10             	mov    0x10(%ebp),%eax
c0108f8f:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c0108f95:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108f98:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c0108f9f:	00 00 00 
c0108fa2:	eb 1f                	jmp    c0108fc3 <sys_receive_msg+0x3fb>
c0108fa4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108fa7:	8b 90 50 02 00 00    	mov    0x250(%eax),%edx
c0108fad:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0108fb0:	89 90 50 02 00 00    	mov    %edx,0x250(%eax)
c0108fb6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108fb9:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c0108fc0:	00 00 00 
c0108fc3:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0108fc6:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c0108fcd:	00 00 00 
c0108fd0:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0108fd3:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0108fda:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0108fdd:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c0108fe4:	00 00 00 
c0108fe7:	8b 45 10             	mov    0x10(%ebp),%eax
c0108fea:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c0108ff1:	00 00 00 
c0108ff4:	8b 45 10             	mov    0x10(%ebp),%eax
c0108ff7:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c0108ffe:	00 00 00 
c0109001:	8b 45 10             	mov    0x10(%ebp),%eax
c0109004:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c010900b:	00 00 00 
c010900e:	83 ec 0c             	sub    $0xc,%esp
c0109011:	ff 75 c4             	pushl  -0x3c(%ebp)
c0109014:	e8 46 03 00 00       	call   c010935f <unblock>
c0109019:	83 c4 10             	add    $0x10,%esp
c010901c:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c010901f:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0109025:	85 c0                	test   %eax,%eax
c0109027:	74 1c                	je     c0109045 <sys_receive_msg+0x47d>
c0109029:	68 1f 06 00 00       	push   $0x61f
c010902e:	68 d4 ac 10 c0       	push   $0xc010acd4
c0109033:	68 d4 ac 10 c0       	push   $0xc010acd4
c0109038:	68 7b b0 10 c0       	push   $0xc010b07b
c010903d:	e8 76 f5 ff ff       	call   c01085b8 <assertion_failure>
c0109042:	83 c4 10             	add    $0x10,%esp
c0109045:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0109048:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010904f:	84 c0                	test   %al,%al
c0109051:	74 1c                	je     c010906f <sys_receive_msg+0x4a7>
c0109053:	68 20 06 00 00       	push   $0x620
c0109058:	68 d4 ac 10 c0       	push   $0xc010acd4
c010905d:	68 d4 ac 10 c0       	push   $0xc010acd4
c0109062:	68 93 b0 10 c0       	push   $0xc010b093
c0109067:	e8 4c f5 ff ff       	call   c01085b8 <assertion_failure>
c010906c:	83 c4 10             	add    $0x10,%esp
c010906f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0109072:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c0109078:	83 f8 21             	cmp    $0x21,%eax
c010907b:	74 1c                	je     c0109099 <sys_receive_msg+0x4d1>
c010907d:	68 21 06 00 00       	push   $0x621
c0109082:	68 d4 ac 10 c0       	push   $0xc010acd4
c0109087:	68 d4 ac 10 c0       	push   $0xc010acd4
c010908c:	68 ac b0 10 c0       	push   $0xc010b0ac
c0109091:	e8 22 f5 ff ff       	call   c01085b8 <assertion_failure>
c0109096:	83 c4 10             	add    $0x10,%esp
c0109099:	8b 45 10             	mov    0x10(%ebp),%eax
c010909c:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c01090a2:	85 c0                	test   %eax,%eax
c01090a4:	74 1c                	je     c01090c2 <sys_receive_msg+0x4fa>
c01090a6:	68 23 06 00 00       	push   $0x623
c01090ab:	68 d4 ac 10 c0       	push   $0xc010acd4
c01090b0:	68 d4 ac 10 c0       	push   $0xc010acd4
c01090b5:	68 d8 af 10 c0       	push   $0xc010afd8
c01090ba:	e8 f9 f4 ff ff       	call   c01085b8 <assertion_failure>
c01090bf:	83 c4 10             	add    $0x10,%esp
c01090c2:	8b 45 10             	mov    0x10(%ebp),%eax
c01090c5:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01090cc:	84 c0                	test   %al,%al
c01090ce:	74 1c                	je     c01090ec <sys_receive_msg+0x524>
c01090d0:	68 24 06 00 00       	push   $0x624
c01090d5:	68 d4 ac 10 c0       	push   $0xc010acd4
c01090da:	68 d4 ac 10 c0       	push   $0xc010acd4
c01090df:	68 ed af 10 c0       	push   $0xc010afed
c01090e4:	e8 cf f4 ff ff       	call   c01085b8 <assertion_failure>
c01090e9:	83 c4 10             	add    $0x10,%esp
c01090ec:	8b 45 10             	mov    0x10(%ebp),%eax
c01090ef:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c01090f5:	83 f8 21             	cmp    $0x21,%eax
c01090f8:	74 1c                	je     c0109116 <sys_receive_msg+0x54e>
c01090fa:	68 25 06 00 00       	push   $0x625
c01090ff:	68 d4 ac 10 c0       	push   $0xc010acd4
c0109104:	68 d4 ac 10 c0       	push   $0xc010acd4
c0109109:	68 04 b0 10 c0       	push   $0xc010b004
c010910e:	e8 a5 f4 ff ff       	call   c01085b8 <assertion_failure>
c0109113:	83 c4 10             	add    $0x10,%esp
c0109116:	8b 45 10             	mov    0x10(%ebp),%eax
c0109119:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c010911f:	83 f8 21             	cmp    $0x21,%eax
c0109122:	0f 84 f5 00 00 00    	je     c010921d <sys_receive_msg+0x655>
c0109128:	68 26 06 00 00       	push   $0x626
c010912d:	68 d4 ac 10 c0       	push   $0xc010acd4
c0109132:	68 d4 ac 10 c0       	push   $0xc010acd4
c0109137:	68 d0 b0 10 c0       	push   $0xc010b0d0
c010913c:	e8 77 f4 ff ff       	call   c01085b8 <assertion_failure>
c0109141:	83 c4 10             	add    $0x10,%esp
c0109144:	e9 d4 00 00 00       	jmp    c010921d <sys_receive_msg+0x655>
c0109149:	8b 45 10             	mov    0x10(%ebp),%eax
c010914c:	c6 80 3c 02 00 00 02 	movb   $0x2,0x23c(%eax)
c0109153:	8b 45 10             	mov    0x10(%ebp),%eax
c0109156:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010915d:	3c 02                	cmp    $0x2,%al
c010915f:	74 1c                	je     c010917d <sys_receive_msg+0x5b5>
c0109161:	68 2b 06 00 00       	push   $0x62b
c0109166:	68 d4 ac 10 c0       	push   $0xc010acd4
c010916b:	68 d4 ac 10 c0       	push   $0xc010acd4
c0109170:	68 ef b0 10 c0       	push   $0xc010b0ef
c0109175:	e8 3e f4 ff ff       	call   c01085b8 <assertion_failure>
c010917a:	83 c4 10             	add    $0x10,%esp
c010917d:	8b 45 10             	mov    0x10(%ebp),%eax
c0109180:	8b 55 08             	mov    0x8(%ebp),%edx
c0109183:	89 90 40 02 00 00    	mov    %edx,0x240(%eax)
c0109189:	8b 45 10             	mov    0x10(%ebp),%eax
c010918c:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109193:	3c 02                	cmp    $0x2,%al
c0109195:	74 1c                	je     c01091b3 <sys_receive_msg+0x5eb>
c0109197:	68 2d 06 00 00       	push   $0x62d
c010919c:	68 d4 ac 10 c0       	push   $0xc010acd4
c01091a1:	68 d4 ac 10 c0       	push   $0xc010acd4
c01091a6:	68 ef b0 10 c0       	push   $0xc010b0ef
c01091ab:	e8 08 f4 ff ff       	call   c01085b8 <assertion_failure>
c01091b0:	83 c4 10             	add    $0x10,%esp
c01091b3:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c01091b7:	75 0f                	jne    c01091c8 <sys_receive_msg+0x600>
c01091b9:	8b 45 10             	mov    0x10(%ebp),%eax
c01091bc:	c7 80 48 02 00 00 12 	movl   $0x12,0x248(%eax)
c01091c3:	00 00 00 
c01091c6:	eb 0c                	jmp    c01091d4 <sys_receive_msg+0x60c>
c01091c8:	8b 45 10             	mov    0x10(%ebp),%eax
c01091cb:	8b 55 0c             	mov    0xc(%ebp),%edx
c01091ce:	89 90 48 02 00 00    	mov    %edx,0x248(%eax)
c01091d4:	8b 45 10             	mov    0x10(%ebp),%eax
c01091d7:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01091de:	3c 02                	cmp    $0x2,%al
c01091e0:	74 2d                	je     c010920f <sys_receive_msg+0x647>
c01091e2:	8b 45 10             	mov    0x10(%ebp),%eax
c01091e5:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01091ec:	0f be c0             	movsbl %al,%eax
c01091ef:	83 ec 0c             	sub    $0xc,%esp
c01091f2:	68 38 06 00 00       	push   $0x638
c01091f7:	68 d4 ac 10 c0       	push   $0xc010acd4
c01091fc:	68 d4 ac 10 c0       	push   $0xc010acd4
c0109201:	50                   	push   %eax
c0109202:	68 ef b0 10 c0       	push   $0xc010b0ef
c0109207:	e8 1e f4 ff ff       	call   c010862a <assertion_failure2>
c010920c:	83 c4 20             	add    $0x20,%esp
c010920f:	83 ec 0c             	sub    $0xc,%esp
c0109212:	ff 75 10             	pushl  0x10(%ebp)
c0109215:	e8 09 01 00 00       	call   c0109323 <block>
c010921a:	83 c4 10             	add    $0x10,%esp
c010921d:	b8 00 00 00 00       	mov    $0x0,%eax
c0109222:	eb 02                	jmp    c0109226 <sys_receive_msg+0x65e>
c0109224:	90                   	nop
c0109225:	90                   	nop
c0109226:	c9                   	leave  
c0109227:	c3                   	ret    

c0109228 <send_rec>:
c0109228:	55                   	push   %ebp
c0109229:	89 e5                	mov    %esp,%ebp
c010922b:	83 ec 18             	sub    $0x18,%esp
c010922e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0109231:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109234:	c7 45 f0 7c 00 00 00 	movl   $0x7c,-0x10(%ebp)
c010923b:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c010923f:	74 28                	je     c0109269 <send_rec+0x41>
c0109241:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0109245:	74 22                	je     c0109269 <send_rec+0x41>
c0109247:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c010924b:	74 1c                	je     c0109269 <send_rec+0x41>
c010924d:	68 4a 06 00 00       	push   $0x64a
c0109252:	68 d4 ac 10 c0       	push   $0xc010acd4
c0109257:	68 d4 ac 10 c0       	push   $0xc010acd4
c010925c:	68 10 b1 10 c0       	push   $0xc010b110
c0109261:	e8 52 f3 ff ff       	call   c01085b8 <assertion_failure>
c0109266:	83 c4 10             	add    $0x10,%esp
c0109269:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c010926d:	75 14                	jne    c0109283 <send_rec+0x5b>
c010926f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109272:	83 ec 04             	sub    $0x4,%esp
c0109275:	50                   	push   %eax
c0109276:	6a 00                	push   $0x0
c0109278:	ff 75 0c             	pushl  0xc(%ebp)
c010927b:	e8 6b 1f 00 00       	call   c010b1eb <Memset>
c0109280:	83 c4 10             	add    $0x10,%esp
c0109283:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0109287:	74 23                	je     c01092ac <send_rec+0x84>
c0109289:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c010928d:	74 34                	je     c01092c3 <send_rec+0x9b>
c010928f:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c0109293:	75 74                	jne    c0109309 <send_rec+0xe1>
c0109295:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109298:	83 ec 08             	sub    $0x8,%esp
c010929b:	ff 75 10             	pushl  0x10(%ebp)
c010929e:	50                   	push   %eax
c010929f:	e8 3c 82 ff ff       	call   c01014e0 <send_msg>
c01092a4:	83 c4 10             	add    $0x10,%esp
c01092a7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01092aa:	eb 70                	jmp    c010931c <send_rec+0xf4>
c01092ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01092af:	83 ec 08             	sub    $0x8,%esp
c01092b2:	ff 75 10             	pushl  0x10(%ebp)
c01092b5:	50                   	push   %eax
c01092b6:	e8 3b 82 ff ff       	call   c01014f6 <receive_msg>
c01092bb:	83 c4 10             	add    $0x10,%esp
c01092be:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01092c1:	eb 59                	jmp    c010931c <send_rec+0xf4>
c01092c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01092c6:	83 ec 08             	sub    $0x8,%esp
c01092c9:	ff 75 10             	pushl  0x10(%ebp)
c01092cc:	50                   	push   %eax
c01092cd:	e8 0e 82 ff ff       	call   c01014e0 <send_msg>
c01092d2:	83 c4 10             	add    $0x10,%esp
c01092d5:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01092d8:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c01092dc:	75 3d                	jne    c010931b <send_rec+0xf3>
c01092de:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01092e1:	83 ec 04             	sub    $0x4,%esp
c01092e4:	50                   	push   %eax
c01092e5:	6a 00                	push   $0x0
c01092e7:	ff 75 0c             	pushl  0xc(%ebp)
c01092ea:	e8 fc 1e 00 00       	call   c010b1eb <Memset>
c01092ef:	83 c4 10             	add    $0x10,%esp
c01092f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01092f5:	83 ec 08             	sub    $0x8,%esp
c01092f8:	ff 75 10             	pushl  0x10(%ebp)
c01092fb:	50                   	push   %eax
c01092fc:	e8 f5 81 ff ff       	call   c01014f6 <receive_msg>
c0109301:	83 c4 10             	add    $0x10,%esp
c0109304:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109307:	eb 12                	jmp    c010931b <send_rec+0xf3>
c0109309:	83 ec 0c             	sub    $0xc,%esp
c010930c:	68 4c b1 10 c0       	push   $0xc010b14c
c0109311:	e8 84 f2 ff ff       	call   c010859a <panic>
c0109316:	83 c4 10             	add    $0x10,%esp
c0109319:	eb 01                	jmp    c010931c <send_rec+0xf4>
c010931b:	90                   	nop
c010931c:	b8 00 00 00 00       	mov    $0x0,%eax
c0109321:	c9                   	leave  
c0109322:	c3                   	ret    

c0109323 <block>:
c0109323:	55                   	push   %ebp
c0109324:	89 e5                	mov    %esp,%ebp
c0109326:	83 ec 08             	sub    $0x8,%esp
c0109329:	8b 45 08             	mov    0x8(%ebp),%eax
c010932c:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109333:	84 c0                	test   %al,%al
c0109335:	75 1c                	jne    c0109353 <block+0x30>
c0109337:	68 79 06 00 00       	push   $0x679
c010933c:	68 d4 ac 10 c0       	push   $0xc010acd4
c0109341:	68 d4 ac 10 c0       	push   $0xc010acd4
c0109346:	68 61 b1 10 c0       	push   $0xc010b161
c010934b:	e8 68 f2 ff ff       	call   c01085b8 <assertion_failure>
c0109350:	83 c4 10             	add    $0x10,%esp
c0109353:	e8 10 a2 ff ff       	call   c0103568 <schedule_process>
c0109358:	b8 00 00 00 00       	mov    $0x0,%eax
c010935d:	c9                   	leave  
c010935e:	c3                   	ret    

c010935f <unblock>:
c010935f:	55                   	push   %ebp
c0109360:	89 e5                	mov    %esp,%ebp
c0109362:	83 ec 08             	sub    $0x8,%esp
c0109365:	8b 45 08             	mov    0x8(%ebp),%eax
c0109368:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010936f:	84 c0                	test   %al,%al
c0109371:	74 1c                	je     c010938f <unblock+0x30>
c0109373:	68 82 06 00 00       	push   $0x682
c0109378:	68 d4 ac 10 c0       	push   $0xc010acd4
c010937d:	68 d4 ac 10 c0       	push   $0xc010acd4
c0109382:	68 79 b1 10 c0       	push   $0xc010b179
c0109387:	e8 2c f2 ff ff       	call   c01085b8 <assertion_failure>
c010938c:	83 c4 10             	add    $0x10,%esp
c010938f:	8b 45 08             	mov    0x8(%ebp),%eax
c0109392:	05 60 02 00 00       	add    $0x260,%eax
c0109397:	83 ec 08             	sub    $0x8,%esp
c010939a:	50                   	push   %eax
c010939b:	68 ec fd 10 c0       	push   $0xc010fdec
c01093a0:	e8 cb 0a 00 00       	call   c0109e70 <appendToDoubleLinkList>
c01093a5:	83 c4 10             	add    $0x10,%esp
c01093a8:	b8 00 00 00 00       	mov    $0x0,%eax
c01093ad:	c9                   	leave  
c01093ae:	c3                   	ret    

c01093af <get_ticks_ipc>:
c01093af:	55                   	push   %ebp
c01093b0:	89 e5                	mov    %esp,%ebp
c01093b2:	81 ec 98 00 00 00    	sub    $0x98,%esp
c01093b8:	83 ec 04             	sub    $0x4,%esp
c01093bb:	6a 7c                	push   $0x7c
c01093bd:	6a 00                	push   $0x0
c01093bf:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01093c5:	50                   	push   %eax
c01093c6:	e8 20 1e 00 00       	call   c010b1eb <Memset>
c01093cb:	83 c4 10             	add    $0x10,%esp
c01093ce:	c7 85 78 ff ff ff 01 	movl   $0x1,-0x88(%ebp)
c01093d5:	00 00 00 
c01093d8:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c01093df:	83 ec 04             	sub    $0x4,%esp
c01093e2:	6a 01                	push   $0x1
c01093e4:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01093ea:	50                   	push   %eax
c01093eb:	6a 03                	push   $0x3
c01093ed:	e8 36 fe ff ff       	call   c0109228 <send_rec>
c01093f2:	83 c4 10             	add    $0x10,%esp
c01093f5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01093f8:	8b 85 7c ff ff ff    	mov    -0x84(%ebp),%eax
c01093fe:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109401:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109404:	c9                   	leave  
c0109405:	c3                   	ret    

c0109406 <itoa>:
c0109406:	55                   	push   %ebp
c0109407:	89 e5                	mov    %esp,%ebp
c0109409:	53                   	push   %ebx
c010940a:	83 ec 14             	sub    $0x14,%esp
c010940d:	8b 45 08             	mov    0x8(%ebp),%eax
c0109410:	99                   	cltd   
c0109411:	f7 7d 10             	idivl  0x10(%ebp)
c0109414:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0109417:	8b 45 08             	mov    0x8(%ebp),%eax
c010941a:	99                   	cltd   
c010941b:	f7 7d 10             	idivl  0x10(%ebp)
c010941e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109421:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0109425:	74 14                	je     c010943b <itoa+0x35>
c0109427:	83 ec 04             	sub    $0x4,%esp
c010942a:	ff 75 10             	pushl  0x10(%ebp)
c010942d:	ff 75 0c             	pushl  0xc(%ebp)
c0109430:	ff 75 f0             	pushl  -0x10(%ebp)
c0109433:	e8 ce ff ff ff       	call   c0109406 <itoa>
c0109438:	83 c4 10             	add    $0x10,%esp
c010943b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010943e:	8d 58 30             	lea    0x30(%eax),%ebx
c0109441:	8b 45 0c             	mov    0xc(%ebp),%eax
c0109444:	8b 00                	mov    (%eax),%eax
c0109446:	8d 48 01             	lea    0x1(%eax),%ecx
c0109449:	8b 55 0c             	mov    0xc(%ebp),%edx
c010944c:	89 0a                	mov    %ecx,(%edx)
c010944e:	89 da                	mov    %ebx,%edx
c0109450:	88 10                	mov    %dl,(%eax)
c0109452:	8b 45 0c             	mov    0xc(%ebp),%eax
c0109455:	8b 00                	mov    (%eax),%eax
c0109457:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c010945a:	c9                   	leave  
c010945b:	c3                   	ret    

c010945c <i2a>:
c010945c:	55                   	push   %ebp
c010945d:	89 e5                	mov    %esp,%ebp
c010945f:	53                   	push   %ebx
c0109460:	83 ec 14             	sub    $0x14,%esp
c0109463:	8b 45 08             	mov    0x8(%ebp),%eax
c0109466:	99                   	cltd   
c0109467:	f7 7d 0c             	idivl  0xc(%ebp)
c010946a:	89 55 f4             	mov    %edx,-0xc(%ebp)
c010946d:	8b 45 08             	mov    0x8(%ebp),%eax
c0109470:	99                   	cltd   
c0109471:	f7 7d 0c             	idivl  0xc(%ebp)
c0109474:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109477:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010947b:	74 14                	je     c0109491 <i2a+0x35>
c010947d:	83 ec 04             	sub    $0x4,%esp
c0109480:	ff 75 10             	pushl  0x10(%ebp)
c0109483:	ff 75 0c             	pushl  0xc(%ebp)
c0109486:	ff 75 f0             	pushl  -0x10(%ebp)
c0109489:	e8 ce ff ff ff       	call   c010945c <i2a>
c010948e:	83 c4 10             	add    $0x10,%esp
c0109491:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c0109495:	7f 0a                	jg     c01094a1 <i2a+0x45>
c0109497:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010949a:	83 c0 30             	add    $0x30,%eax
c010949d:	89 c3                	mov    %eax,%ebx
c010949f:	eb 08                	jmp    c01094a9 <i2a+0x4d>
c01094a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01094a4:	83 c0 37             	add    $0x37,%eax
c01094a7:	89 c3                	mov    %eax,%ebx
c01094a9:	8b 45 10             	mov    0x10(%ebp),%eax
c01094ac:	8b 00                	mov    (%eax),%eax
c01094ae:	8d 48 01             	lea    0x1(%eax),%ecx
c01094b1:	8b 55 10             	mov    0x10(%ebp),%edx
c01094b4:	89 0a                	mov    %ecx,(%edx)
c01094b6:	88 18                	mov    %bl,(%eax)
c01094b8:	8b 45 10             	mov    0x10(%ebp),%eax
c01094bb:	8b 00                	mov    (%eax),%eax
c01094bd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01094c0:	c9                   	leave  
c01094c1:	c3                   	ret    

c01094c2 <inform_int>:
c01094c2:	55                   	push   %ebp
c01094c3:	89 e5                	mov    %esp,%ebp
c01094c5:	83 ec 18             	sub    $0x18,%esp
c01094c8:	83 ec 0c             	sub    $0xc,%esp
c01094cb:	ff 75 08             	pushl  0x8(%ebp)
c01094ce:	e8 13 a2 ff ff       	call   c01036e6 <pid2proc>
c01094d3:	83 c4 10             	add    $0x10,%esp
c01094d6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01094d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01094dc:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01094e3:	0f be c0             	movsbl %al,%eax
c01094e6:	83 e0 02             	and    $0x2,%eax
c01094e9:	85 c0                	test   %eax,%eax
c01094eb:	0f 84 8e 00 00 00    	je     c010957f <inform_int+0xbd>
c01094f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01094f4:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c01094fa:	3d 13 02 00 00       	cmp    $0x213,%eax
c01094ff:	74 0e                	je     c010950f <inform_int+0x4d>
c0109501:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109504:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c010950a:	83 f8 12             	cmp    $0x12,%eax
c010950d:	75 7d                	jne    c010958c <inform_int+0xca>
c010950f:	c7 45 f0 7c 00 00 00 	movl   $0x7c,-0x10(%ebp)
c0109516:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109519:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c010951f:	83 ec 08             	sub    $0x8,%esp
c0109522:	ff 75 f0             	pushl  -0x10(%ebp)
c0109525:	50                   	push   %eax
c0109526:	e8 f1 c7 ff ff       	call   c0105d1c <alloc_virtual_memory>
c010952b:	83 c4 10             	add    $0x10,%esp
c010952e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109531:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109534:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c010953a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010953d:	c7 40 78 d5 07 00 00 	movl   $0x7d5,0x78(%eax)
c0109544:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109547:	c7 80 54 02 00 00 00 	movl   $0x0,0x254(%eax)
c010954e:	00 00 00 
c0109551:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109554:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c010955b:	00 00 00 
c010955e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0109565:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109568:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c010956f:	83 ec 0c             	sub    $0xc,%esp
c0109572:	ff 75 f4             	pushl  -0xc(%ebp)
c0109575:	e8 e5 fd ff ff       	call   c010935f <unblock>
c010957a:	83 c4 10             	add    $0x10,%esp
c010957d:	eb 0d                	jmp    c010958c <inform_int+0xca>
c010957f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109582:	c7 80 54 02 00 00 01 	movl   $0x1,0x254(%eax)
c0109589:	00 00 00 
c010958c:	90                   	nop
c010958d:	c9                   	leave  
c010958e:	c3                   	ret    

c010958f <strcmp>:
c010958f:	55                   	push   %ebp
c0109590:	89 e5                	mov    %esp,%ebp
c0109592:	83 ec 10             	sub    $0x10,%esp
c0109595:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0109599:	74 06                	je     c01095a1 <strcmp+0x12>
c010959b:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010959f:	75 08                	jne    c01095a9 <strcmp+0x1a>
c01095a1:	8b 45 08             	mov    0x8(%ebp),%eax
c01095a4:	2b 45 0c             	sub    0xc(%ebp),%eax
c01095a7:	eb 53                	jmp    c01095fc <strcmp+0x6d>
c01095a9:	8b 45 08             	mov    0x8(%ebp),%eax
c01095ac:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01095af:	8b 45 0c             	mov    0xc(%ebp),%eax
c01095b2:	89 45 f8             	mov    %eax,-0x8(%ebp)
c01095b5:	eb 18                	jmp    c01095cf <strcmp+0x40>
c01095b7:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01095ba:	0f b6 10             	movzbl (%eax),%edx
c01095bd:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01095c0:	0f b6 00             	movzbl (%eax),%eax
c01095c3:	38 c2                	cmp    %al,%dl
c01095c5:	75 1e                	jne    c01095e5 <strcmp+0x56>
c01095c7:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c01095cb:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c01095cf:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01095d2:	0f b6 00             	movzbl (%eax),%eax
c01095d5:	84 c0                	test   %al,%al
c01095d7:	74 0d                	je     c01095e6 <strcmp+0x57>
c01095d9:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01095dc:	0f b6 00             	movzbl (%eax),%eax
c01095df:	84 c0                	test   %al,%al
c01095e1:	75 d4                	jne    c01095b7 <strcmp+0x28>
c01095e3:	eb 01                	jmp    c01095e6 <strcmp+0x57>
c01095e5:	90                   	nop
c01095e6:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01095e9:	0f b6 00             	movzbl (%eax),%eax
c01095ec:	0f be d0             	movsbl %al,%edx
c01095ef:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01095f2:	0f b6 00             	movzbl (%eax),%eax
c01095f5:	0f be c0             	movsbl %al,%eax
c01095f8:	29 c2                	sub    %eax,%edx
c01095fa:	89 d0                	mov    %edx,%eax
c01095fc:	c9                   	leave  
c01095fd:	c3                   	ret    

c01095fe <create_user_process_address_space>:
c01095fe:	55                   	push   %ebp
c01095ff:	89 e5                	mov    %esp,%ebp
c0109601:	83 ec 18             	sub    $0x18,%esp
c0109604:	83 ec 08             	sub    $0x8,%esp
c0109607:	6a 00                	push   $0x0
c0109609:	6a 01                	push   $0x1
c010960b:	e8 44 ca ff ff       	call   c0106054 <alloc_memory>
c0109610:	83 c4 10             	add    $0x10,%esp
c0109613:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109616:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109619:	c7 40 08 00 80 04 08 	movl   $0x8048000,0x8(%eax)
c0109620:	c7 45 f0 00 80 fb b7 	movl   $0xb7fb8000,-0x10(%ebp)
c0109627:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010962a:	05 ff 0f 00 00       	add    $0xfff,%eax
c010962f:	c1 e8 0c             	shr    $0xc,%eax
c0109632:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109635:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109638:	83 c0 07             	add    $0x7,%eax
c010963b:	c1 e8 03             	shr    $0x3,%eax
c010963e:	89 c2                	mov    %eax,%edx
c0109640:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109643:	89 50 04             	mov    %edx,0x4(%eax)
c0109646:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109649:	8b 40 04             	mov    0x4(%eax),%eax
c010964c:	05 ff 0f 00 00       	add    $0xfff,%eax
c0109651:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0109657:	85 c0                	test   %eax,%eax
c0109659:	0f 48 c2             	cmovs  %edx,%eax
c010965c:	c1 f8 0c             	sar    $0xc,%eax
c010965f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0109662:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109665:	83 ec 08             	sub    $0x8,%esp
c0109668:	6a 00                	push   $0x0
c010966a:	50                   	push   %eax
c010966b:	e8 e4 c9 ff ff       	call   c0106054 <alloc_memory>
c0109670:	83 c4 10             	add    $0x10,%esp
c0109673:	89 c2                	mov    %eax,%edx
c0109675:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109678:	89 10                	mov    %edx,(%eax)
c010967a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010967d:	83 ec 0c             	sub    $0xc,%esp
c0109680:	50                   	push   %eax
c0109681:	e8 a0 c1 ff ff       	call   c0105826 <init_bitmap>
c0109686:	83 c4 10             	add    $0x10,%esp
c0109689:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010968c:	c9                   	leave  
c010968d:	c3                   	ret    

c010968e <user_process>:
c010968e:	55                   	push   %ebp
c010968f:	89 e5                	mov    %esp,%ebp
c0109691:	83 ec 38             	sub    $0x38,%esp
c0109694:	c7 45 f0 b2 0c 00 00 	movl   $0xcb2,-0x10(%ebp)
c010969b:	c7 45 ec ba 0c 00 00 	movl   $0xcba,-0x14(%ebp)
c01096a2:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%ebp)
c01096a9:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c01096ad:	75 0e                	jne    c01096bd <user_process+0x2f>
c01096af:	66 c7 45 f6 48 00    	movw   $0x48,-0xa(%ebp)
c01096b5:	66 c7 45 f4 50 00    	movw   $0x50,-0xc(%ebp)
c01096bb:	eb 0c                	jmp    c01096c9 <user_process+0x3b>
c01096bd:	66 c7 45 f6 59 00    	movw   $0x59,-0xa(%ebp)
c01096c3:	66 c7 45 f4 61 00    	movw   $0x61,-0xc(%ebp)
c01096c9:	e8 d5 6c ff ff       	call   c01003a3 <get_running_thread_pcb>
c01096ce:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01096d1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01096d4:	8b 55 14             	mov    0x14(%ebp),%edx
c01096d7:	89 90 18 01 00 00    	mov    %edx,0x118(%eax)
c01096dd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01096e0:	8b 90 18 01 00 00    	mov    0x118(%eax),%edx
c01096e6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01096e9:	89 90 1c 01 00 00    	mov    %edx,0x11c(%eax)
c01096ef:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01096f2:	05 00 10 00 00       	add    $0x1000,%eax
c01096f7:	89 c2                	mov    %eax,%edx
c01096f9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01096fc:	89 10                	mov    %edx,(%eax)
c01096fe:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109701:	8b 00                	mov    (%eax),%eax
c0109703:	83 e8 44             	sub    $0x44,%eax
c0109706:	89 c2                	mov    %eax,%edx
c0109708:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010970b:	89 10                	mov    %edx,(%eax)
c010970d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109710:	8b 00                	mov    (%eax),%eax
c0109712:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109715:	c6 45 df 00          	movb   $0x0,-0x21(%ebp)
c0109719:	66 c7 45 dc 02 12    	movw   $0x1202,-0x24(%ebp)
c010971f:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0109723:	66 89 45 da          	mov    %ax,-0x26(%ebp)
c0109727:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c010972b:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
c010972f:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0109733:	66 89 45 d6          	mov    %ax,-0x2a(%ebp)
c0109737:	66 c7 45 d4 38 00    	movw   $0x38,-0x2c(%ebp)
c010973d:	0f b7 55 f4          	movzwl -0xc(%ebp),%edx
c0109741:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109744:	89 50 34             	mov    %edx,0x34(%eax)
c0109747:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c010974b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010974e:	89 50 0c             	mov    %edx,0xc(%eax)
c0109751:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c0109755:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109758:	89 50 04             	mov    %edx,0x4(%eax)
c010975b:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c010975f:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109762:	89 50 08             	mov    %edx,0x8(%eax)
c0109765:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c0109769:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010976c:	89 50 40             	mov    %edx,0x40(%eax)
c010976f:	0f b7 55 d4          	movzwl -0x2c(%ebp),%edx
c0109773:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109776:	89 10                	mov    %edx,(%eax)
c0109778:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010977b:	8b 55 08             	mov    0x8(%ebp),%edx
c010977e:	89 50 30             	mov    %edx,0x30(%eax)
c0109781:	0f b7 55 dc          	movzwl -0x24(%ebp),%edx
c0109785:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109788:	89 50 38             	mov    %edx,0x38(%eax)
c010978b:	83 ec 08             	sub    $0x8,%esp
c010978e:	6a 01                	push   $0x1
c0109790:	68 00 f0 ff bf       	push   $0xbffff000
c0109795:	e8 f2 c7 ff ff       	call   c0105f8c <alloc_physical_memory>
c010979a:	83 c4 10             	add    $0x10,%esp
c010979d:	8d 90 00 10 00 00    	lea    0x1000(%eax),%edx
c01097a3:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01097a6:	89 50 3c             	mov    %edx,0x3c(%eax)
c01097a9:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01097ac:	83 ec 0c             	sub    $0xc,%esp
c01097af:	50                   	push   %eax
c01097b0:	e8 c1 6a ff ff       	call   c0100276 <restart>
c01097b5:	83 c4 10             	add    $0x10,%esp
c01097b8:	90                   	nop
c01097b9:	c9                   	leave  
c01097ba:	c3                   	ret    

c01097bb <clone_pcb>:
c01097bb:	55                   	push   %ebp
c01097bc:	89 e5                	mov    %esp,%ebp
c01097be:	83 ec 38             	sub    $0x38,%esp
c01097c1:	83 ec 08             	sub    $0x8,%esp
c01097c4:	6a 00                	push   $0x0
c01097c6:	6a 01                	push   $0x1
c01097c8:	e8 87 c8 ff ff       	call   c0106054 <alloc_memory>
c01097cd:	83 c4 10             	add    $0x10,%esp
c01097d0:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01097d3:	83 ec 04             	sub    $0x4,%esp
c01097d6:	68 00 10 00 00       	push   $0x1000
c01097db:	6a 00                	push   $0x0
c01097dd:	ff 75 f4             	pushl  -0xc(%ebp)
c01097e0:	e8 06 1a 00 00       	call   c010b1eb <Memset>
c01097e5:	83 c4 10             	add    $0x10,%esp
c01097e8:	83 ec 04             	sub    $0x4,%esp
c01097eb:	68 00 10 00 00       	push   $0x1000
c01097f0:	ff 75 08             	pushl  0x8(%ebp)
c01097f3:	ff 75 f4             	pushl  -0xc(%ebp)
c01097f6:	e8 8e d3 ff ff       	call   c0106b89 <Memcpy>
c01097fb:	83 c4 10             	add    $0x10,%esp
c01097fe:	a1 c4 06 11 c0       	mov    0xc01106c4,%eax
c0109803:	8d 50 01             	lea    0x1(%eax),%edx
c0109806:	89 15 c4 06 11 c0    	mov    %edx,0xc01106c4
c010980c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010980f:	89 82 14 01 00 00    	mov    %eax,0x114(%edx)
c0109815:	8b 45 08             	mov    0x8(%ebp),%eax
c0109818:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c010981e:	89 c2                	mov    %eax,%edx
c0109820:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109823:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c0109829:	83 ec 08             	sub    $0x8,%esp
c010982c:	6a 00                	push   $0x0
c010982e:	6a 01                	push   $0x1
c0109830:	e8 1f c8 ff ff       	call   c0106054 <alloc_memory>
c0109835:	83 c4 10             	add    $0x10,%esp
c0109838:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010983b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010983e:	05 00 0c 00 00       	add    $0xc00,%eax
c0109843:	83 ec 04             	sub    $0x4,%esp
c0109846:	68 00 04 00 00       	push   $0x400
c010984b:	68 00 fc ff ff       	push   $0xfffffc00
c0109850:	50                   	push   %eax
c0109851:	e8 33 d3 ff ff       	call   c0106b89 <Memcpy>
c0109856:	83 c4 10             	add    $0x10,%esp
c0109859:	83 ec 0c             	sub    $0xc,%esp
c010985c:	ff 75 f0             	pushl  -0x10(%ebp)
c010985f:	e8 07 c6 ff ff       	call   c0105e6b <get_physical_address>
c0109864:	83 c4 10             	add    $0x10,%esp
c0109867:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010986a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010986d:	05 fc 0f 00 00       	add    $0xffc,%eax
c0109872:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0109875:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109878:	83 c8 07             	or     $0x7,%eax
c010987b:	89 c2                	mov    %eax,%edx
c010987d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109880:	89 10                	mov    %edx,(%eax)
c0109882:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109885:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0109888:	89 50 08             	mov    %edx,0x8(%eax)
c010988b:	e8 6e fd ff ff       	call   c01095fe <create_user_process_address_space>
c0109890:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109893:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0109896:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109899:	89 50 0c             	mov    %edx,0xc(%eax)
c010989c:	8b 45 08             	mov    0x8(%ebp),%eax
c010989f:	8b 40 0c             	mov    0xc(%eax),%eax
c01098a2:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01098a5:	83 ec 04             	sub    $0x4,%esp
c01098a8:	6a 0c                	push   $0xc
c01098aa:	ff 75 e0             	pushl  -0x20(%ebp)
c01098ad:	ff 75 e4             	pushl  -0x1c(%ebp)
c01098b0:	e8 d4 d2 ff ff       	call   c0106b89 <Memcpy>
c01098b5:	83 c4 10             	add    $0x10,%esp
c01098b8:	c7 45 dc 00 80 fb b7 	movl   $0xb7fb8000,-0x24(%ebp)
c01098bf:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01098c2:	05 ff 0f 00 00       	add    $0xfff,%eax
c01098c7:	c1 e8 0c             	shr    $0xc,%eax
c01098ca:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01098cd:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01098d0:	83 c0 07             	add    $0x7,%eax
c01098d3:	c1 e8 03             	shr    $0x3,%eax
c01098d6:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01098d9:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01098dc:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01098df:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01098e2:	05 ff 0f 00 00       	add    $0xfff,%eax
c01098e7:	c1 e8 0c             	shr    $0xc,%eax
c01098ea:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01098ed:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01098f0:	83 ec 08             	sub    $0x8,%esp
c01098f3:	6a 00                	push   $0x0
c01098f5:	50                   	push   %eax
c01098f6:	e8 59 c7 ff ff       	call   c0106054 <alloc_memory>
c01098fb:	83 c4 10             	add    $0x10,%esp
c01098fe:	89 c2                	mov    %eax,%edx
c0109900:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109903:	89 10                	mov    %edx,(%eax)
c0109905:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0109908:	c1 e0 0c             	shl    $0xc,%eax
c010990b:	89 45 cc             	mov    %eax,-0x34(%ebp)
c010990e:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109911:	8b 10                	mov    (%eax),%edx
c0109913:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109916:	8b 00                	mov    (%eax),%eax
c0109918:	83 ec 04             	sub    $0x4,%esp
c010991b:	ff 75 cc             	pushl  -0x34(%ebp)
c010991e:	52                   	push   %edx
c010991f:	50                   	push   %eax
c0109920:	e8 64 d2 ff ff       	call   c0106b89 <Memcpy>
c0109925:	83 c4 10             	add    $0x10,%esp
c0109928:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010992b:	c9                   	leave  
c010992c:	c3                   	ret    

c010992d <build_body_stack>:
c010992d:	55                   	push   %ebp
c010992e:	89 e5                	mov    %esp,%ebp
c0109930:	83 ec 48             	sub    $0x48,%esp
c0109933:	8b 45 08             	mov    0x8(%ebp),%eax
c0109936:	8b 40 0c             	mov    0xc(%eax),%eax
c0109939:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010993c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010993f:	8b 50 04             	mov    0x4(%eax),%edx
c0109942:	8b 00                	mov    (%eax),%eax
c0109944:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0109947:	89 55 c8             	mov    %edx,-0x38(%ebp)
c010994a:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c010994d:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109950:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0109953:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0109956:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109959:	8b 40 08             	mov    0x8(%eax),%eax
c010995c:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010995f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0109966:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c010996d:	e8 b3 d1 ff ff       	call   c0106b25 <intr_disable>
c0109972:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0109975:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c010997c:	e9 c2 00 00 00       	jmp    c0109a43 <build_body_stack+0x116>
c0109981:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0109984:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109987:	01 d0                	add    %edx,%eax
c0109989:	0f b6 00             	movzbl (%eax),%eax
c010998c:	88 45 d3             	mov    %al,-0x2d(%ebp)
c010998f:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0109996:	e9 9a 00 00 00       	jmp    c0109a35 <build_body_stack+0x108>
c010999b:	0f be 55 d3          	movsbl -0x2d(%ebp),%edx
c010999f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01099a2:	89 c1                	mov    %eax,%ecx
c01099a4:	d3 fa                	sar    %cl,%edx
c01099a6:	89 d0                	mov    %edx,%eax
c01099a8:	83 e0 01             	and    $0x1,%eax
c01099ab:	85 c0                	test   %eax,%eax
c01099ad:	75 06                	jne    c01099b5 <build_body_stack+0x88>
c01099af:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01099b3:	eb 7c                	jmp    c0109a31 <build_body_stack+0x104>
c01099b5:	8b 45 08             	mov    0x8(%ebp),%eax
c01099b8:	8b 40 08             	mov    0x8(%eax),%eax
c01099bb:	83 ec 0c             	sub    $0xc,%esp
c01099be:	50                   	push   %eax
c01099bf:	e8 c3 69 ff ff       	call   c0100387 <update_cr3>
c01099c4:	83 c4 10             	add    $0x10,%esp
c01099c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01099ca:	c1 e0 0c             	shl    $0xc,%eax
c01099cd:	89 c2                	mov    %eax,%edx
c01099cf:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01099d2:	01 d0                	add    %edx,%eax
c01099d4:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01099d7:	8b 55 cc             	mov    -0x34(%ebp),%edx
c01099da:	8b 45 10             	mov    0x10(%ebp),%eax
c01099dd:	83 ec 04             	sub    $0x4,%esp
c01099e0:	68 00 10 00 00       	push   $0x1000
c01099e5:	52                   	push   %edx
c01099e6:	50                   	push   %eax
c01099e7:	e8 9d d1 ff ff       	call   c0106b89 <Memcpy>
c01099ec:	83 c4 10             	add    $0x10,%esp
c01099ef:	8b 45 0c             	mov    0xc(%ebp),%eax
c01099f2:	8b 40 08             	mov    0x8(%eax),%eax
c01099f5:	83 ec 0c             	sub    $0xc,%esp
c01099f8:	50                   	push   %eax
c01099f9:	e8 89 69 ff ff       	call   c0100387 <update_cr3>
c01099fe:	83 c4 10             	add    $0x10,%esp
c0109a01:	83 ec 08             	sub    $0x8,%esp
c0109a04:	ff 75 cc             	pushl  -0x34(%ebp)
c0109a07:	6a 01                	push   $0x1
c0109a09:	e8 a8 c6 ff ff       	call   c01060b6 <get_a_virtual_page>
c0109a0e:	83 c4 10             	add    $0x10,%esp
c0109a11:	8b 55 10             	mov    0x10(%ebp),%edx
c0109a14:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0109a17:	83 ec 04             	sub    $0x4,%esp
c0109a1a:	68 00 10 00 00       	push   $0x1000
c0109a1f:	52                   	push   %edx
c0109a20:	50                   	push   %eax
c0109a21:	e8 63 d1 ff ff       	call   c0106b89 <Memcpy>
c0109a26:	83 c4 10             	add    $0x10,%esp
c0109a29:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0109a2d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0109a31:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0109a35:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0109a39:	0f 8e 5c ff ff ff    	jle    c010999b <build_body_stack+0x6e>
c0109a3f:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0109a43:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109a46:	39 45 dc             	cmp    %eax,-0x24(%ebp)
c0109a49:	0f 87 32 ff ff ff    	ja     c0109981 <build_body_stack+0x54>
c0109a4f:	83 ec 0c             	sub    $0xc,%esp
c0109a52:	ff 75 d4             	pushl  -0x2c(%ebp)
c0109a55:	e8 f4 d0 ff ff       	call   c0106b4e <intr_set_status>
c0109a5a:	83 c4 10             	add    $0x10,%esp
c0109a5d:	90                   	nop
c0109a5e:	c9                   	leave  
c0109a5f:	c3                   	ret    

c0109a60 <build_process_kernel_stack>:
c0109a60:	55                   	push   %ebp
c0109a61:	89 e5                	mov    %esp,%ebp
c0109a63:	83 ec 28             	sub    $0x28,%esp
c0109a66:	e8 ba d0 ff ff       	call   c0106b25 <intr_disable>
c0109a6b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109a6e:	8b 45 08             	mov    0x8(%ebp),%eax
c0109a71:	05 00 10 00 00       	add    $0x1000,%eax
c0109a76:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109a79:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109a7c:	8b 00                	mov    (%eax),%eax
c0109a7e:	83 f8 38             	cmp    $0x38,%eax
c0109a81:	74 06                	je     c0109a89 <build_process_kernel_stack+0x29>
c0109a83:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c0109a87:	eb f0                	jmp    c0109a79 <build_process_kernel_stack+0x19>
c0109a89:	90                   	nop
c0109a8a:	8b 45 08             	mov    0x8(%ebp),%eax
c0109a8d:	05 00 10 00 00       	add    $0x1000,%eax
c0109a92:	89 c2                	mov    %eax,%edx
c0109a94:	8b 45 08             	mov    0x8(%ebp),%eax
c0109a97:	89 50 04             	mov    %edx,0x4(%eax)
c0109a9a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109a9d:	83 c0 2c             	add    $0x2c,%eax
c0109aa0:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109aa3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109aa6:	83 e8 04             	sub    $0x4,%eax
c0109aa9:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0109aac:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109aaf:	83 e8 08             	sub    $0x8,%eax
c0109ab2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109ab5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109ab8:	83 e8 0c             	sub    $0xc,%eax
c0109abb:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109abe:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109ac1:	83 e8 10             	sub    $0x10,%eax
c0109ac4:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0109ac7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109aca:	83 e8 14             	sub    $0x14,%eax
c0109acd:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0109ad0:	ba 67 02 10 c0       	mov    $0xc0100267,%edx
c0109ad5:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109ad8:	89 10                	mov    %edx,(%eax)
c0109ada:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109add:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0109ae3:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109ae6:	8b 10                	mov    (%eax),%edx
c0109ae8:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0109aeb:	89 10                	mov    %edx,(%eax)
c0109aed:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0109af0:	8b 10                	mov    (%eax),%edx
c0109af2:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109af5:	89 10                	mov    %edx,(%eax)
c0109af7:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109afa:	8b 10                	mov    (%eax),%edx
c0109afc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109aff:	89 10                	mov    %edx,(%eax)
c0109b01:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109b04:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0109b0a:	8b 45 08             	mov    0x8(%ebp),%eax
c0109b0d:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0109b10:	89 10                	mov    %edx,(%eax)
c0109b12:	83 ec 0c             	sub    $0xc,%esp
c0109b15:	ff 75 f0             	pushl  -0x10(%ebp)
c0109b18:	e8 31 d0 ff ff       	call   c0106b4e <intr_set_status>
c0109b1d:	83 c4 10             	add    $0x10,%esp
c0109b20:	90                   	nop
c0109b21:	c9                   	leave  
c0109b22:	c3                   	ret    

c0109b23 <fork_process>:
c0109b23:	55                   	push   %ebp
c0109b24:	89 e5                	mov    %esp,%ebp
c0109b26:	83 ec 18             	sub    $0x18,%esp
c0109b29:	8b 45 08             	mov    0x8(%ebp),%eax
c0109b2c:	83 ec 0c             	sub    $0xc,%esp
c0109b2f:	50                   	push   %eax
c0109b30:	e8 b1 9b ff ff       	call   c01036e6 <pid2proc>
c0109b35:	83 c4 10             	add    $0x10,%esp
c0109b38:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109b3b:	83 ec 0c             	sub    $0xc,%esp
c0109b3e:	ff 75 f4             	pushl  -0xc(%ebp)
c0109b41:	e8 75 fc ff ff       	call   c01097bb <clone_pcb>
c0109b46:	83 c4 10             	add    $0x10,%esp
c0109b49:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109b4c:	83 ec 08             	sub    $0x8,%esp
c0109b4f:	6a 00                	push   $0x0
c0109b51:	6a 01                	push   $0x1
c0109b53:	e8 fc c4 ff ff       	call   c0106054 <alloc_memory>
c0109b58:	83 c4 10             	add    $0x10,%esp
c0109b5b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109b5e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109b61:	83 ec 04             	sub    $0x4,%esp
c0109b64:	68 00 10 00 00       	push   $0x1000
c0109b69:	6a 00                	push   $0x0
c0109b6b:	50                   	push   %eax
c0109b6c:	e8 7a 16 00 00       	call   c010b1eb <Memset>
c0109b71:	83 c4 10             	add    $0x10,%esp
c0109b74:	83 ec 04             	sub    $0x4,%esp
c0109b77:	ff 75 ec             	pushl  -0x14(%ebp)
c0109b7a:	ff 75 f0             	pushl  -0x10(%ebp)
c0109b7d:	ff 75 f4             	pushl  -0xc(%ebp)
c0109b80:	e8 a8 fd ff ff       	call   c010992d <build_body_stack>
c0109b85:	83 c4 10             	add    $0x10,%esp
c0109b88:	83 ec 0c             	sub    $0xc,%esp
c0109b8b:	ff 75 f0             	pushl  -0x10(%ebp)
c0109b8e:	e8 cd fe ff ff       	call   c0109a60 <build_process_kernel_stack>
c0109b93:	83 c4 10             	add    $0x10,%esp
c0109b96:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109b99:	05 6a 02 00 00       	add    $0x26a,%eax
c0109b9e:	83 ec 08             	sub    $0x8,%esp
c0109ba1:	50                   	push   %eax
c0109ba2:	68 04 0f 11 c0       	push   $0xc0110f04
c0109ba7:	e8 c4 02 00 00       	call   c0109e70 <appendToDoubleLinkList>
c0109bac:	83 c4 10             	add    $0x10,%esp
c0109baf:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109bb2:	c9                   	leave  
c0109bb3:	c3                   	ret    

c0109bb4 <process_execute>:
c0109bb4:	55                   	push   %ebp
c0109bb5:	89 e5                	mov    %esp,%ebp
c0109bb7:	83 ec 28             	sub    $0x28,%esp
c0109bba:	e8 c7 04 00 00       	call   c010a086 <thread_init>
c0109bbf:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109bc2:	83 ec 0c             	sub    $0xc,%esp
c0109bc5:	ff 75 f4             	pushl  -0xc(%ebp)
c0109bc8:	e8 66 05 00 00       	call   c010a133 <thread_create>
c0109bcd:	83 c4 10             	add    $0x10,%esp
c0109bd0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109bd3:	05 28 01 00 00       	add    $0x128,%eax
c0109bd8:	83 ec 08             	sub    $0x8,%esp
c0109bdb:	ff 75 10             	pushl  0x10(%ebp)
c0109bde:	50                   	push   %eax
c0109bdf:	e8 26 16 00 00       	call   c010b20a <Strcpy>
c0109be4:	83 c4 10             	add    $0x10,%esp
c0109be7:	83 ec 08             	sub    $0x8,%esp
c0109bea:	6a 00                	push   $0x0
c0109bec:	6a 01                	push   $0x1
c0109bee:	e8 61 c4 ff ff       	call   c0106054 <alloc_memory>
c0109bf3:	83 c4 10             	add    $0x10,%esp
c0109bf6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109bf9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109bfc:	05 00 0c 00 00       	add    $0xc00,%eax
c0109c01:	83 ec 04             	sub    $0x4,%esp
c0109c04:	68 00 04 00 00       	push   $0x400
c0109c09:	68 00 fc ff ff       	push   $0xfffffc00
c0109c0e:	50                   	push   %eax
c0109c0f:	e8 75 cf ff ff       	call   c0106b89 <Memcpy>
c0109c14:	83 c4 10             	add    $0x10,%esp
c0109c17:	83 ec 0c             	sub    $0xc,%esp
c0109c1a:	ff 75 f0             	pushl  -0x10(%ebp)
c0109c1d:	e8 49 c2 ff ff       	call   c0105e6b <get_physical_address>
c0109c22:	83 c4 10             	add    $0x10,%esp
c0109c25:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109c28:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109c2b:	05 fc 0f 00 00       	add    $0xffc,%eax
c0109c30:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0109c33:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109c36:	83 c8 07             	or     $0x7,%eax
c0109c39:	89 c2                	mov    %eax,%edx
c0109c3b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109c3e:	89 10                	mov    %edx,(%eax)
c0109c40:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109c43:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0109c46:	89 50 08             	mov    %edx,0x8(%eax)
c0109c49:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109c4c:	83 c0 10             	add    $0x10,%eax
c0109c4f:	83 ec 0c             	sub    $0xc,%esp
c0109c52:	50                   	push   %eax
c0109c53:	e8 b2 c9 ff ff       	call   c010660a <init_memory_block_desc>
c0109c58:	83 c4 10             	add    $0x10,%esp
c0109c5b:	e8 9e f9 ff ff       	call   c01095fe <create_user_process_address_space>
c0109c60:	89 c2                	mov    %eax,%edx
c0109c62:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109c65:	89 50 0c             	mov    %edx,0xc(%eax)
c0109c68:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109c6b:	8b 00                	mov    (%eax),%eax
c0109c6d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109c70:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109c73:	c7 40 10 8e 96 10 c0 	movl   $0xc010968e,0x10(%eax)
c0109c7a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109c7d:	8b 55 08             	mov    0x8(%ebp),%edx
c0109c80:	89 50 18             	mov    %edx,0x18(%eax)
c0109c83:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109c86:	8b 55 0c             	mov    0xc(%ebp),%edx
c0109c89:	89 50 1c             	mov    %edx,0x1c(%eax)
c0109c8c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109c8f:	8b 55 14             	mov    0x14(%ebp),%edx
c0109c92:	89 50 20             	mov    %edx,0x20(%eax)
c0109c95:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109c98:	8b 55 18             	mov    0x18(%ebp),%edx
c0109c9b:	89 50 24             	mov    %edx,0x24(%eax)
c0109c9e:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0109ca1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109ca4:	89 50 28             	mov    %edx,0x28(%eax)
c0109ca7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109caa:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0109cb0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109cb3:	8b 10                	mov    (%eax),%edx
c0109cb5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109cb8:	89 50 04             	mov    %edx,0x4(%eax)
c0109cbb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109cbe:	8b 50 04             	mov    0x4(%eax),%edx
c0109cc1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109cc4:	89 50 08             	mov    %edx,0x8(%eax)
c0109cc7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109cca:	8b 50 08             	mov    0x8(%eax),%edx
c0109ccd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109cd0:	89 50 0c             	mov    %edx,0xc(%eax)
c0109cd3:	83 ec 0c             	sub    $0xc,%esp
c0109cd6:	68 ec fd 10 c0       	push   $0xc010fdec
c0109cdb:	e8 93 00 00 00       	call   c0109d73 <isListEmpty>
c0109ce0:	83 c4 10             	add    $0x10,%esp
c0109ce3:	e8 3d ce ff ff       	call   c0106b25 <intr_disable>
c0109ce8:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109ceb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109cee:	05 60 02 00 00       	add    $0x260,%eax
c0109cf3:	83 ec 08             	sub    $0x8,%esp
c0109cf6:	50                   	push   %eax
c0109cf7:	68 ec fd 10 c0       	push   $0xc010fdec
c0109cfc:	e8 6f 01 00 00       	call   c0109e70 <appendToDoubleLinkList>
c0109d01:	83 c4 10             	add    $0x10,%esp
c0109d04:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109d07:	05 6a 02 00 00       	add    $0x26a,%eax
c0109d0c:	83 ec 08             	sub    $0x8,%esp
c0109d0f:	50                   	push   %eax
c0109d10:	68 04 0f 11 c0       	push   $0xc0110f04
c0109d15:	e8 56 01 00 00       	call   c0109e70 <appendToDoubleLinkList>
c0109d1a:	83 c4 10             	add    $0x10,%esp
c0109d1d:	83 ec 0c             	sub    $0xc,%esp
c0109d20:	ff 75 e0             	pushl  -0x20(%ebp)
c0109d23:	e8 26 ce ff ff       	call   c0106b4e <intr_set_status>
c0109d28:	83 c4 10             	add    $0x10,%esp
c0109d2b:	90                   	nop
c0109d2c:	c9                   	leave  
c0109d2d:	c3                   	ret    
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
c0109da2:	68 91 b1 10 c0       	push   $0xc010b191
c0109da7:	68 91 b1 10 c0       	push   $0xc010b191
c0109dac:	68 a4 b1 10 c0       	push   $0xc010b1a4
c0109db1:	e8 02 e8 ff ff       	call   c01085b8 <assertion_failure>
c0109db6:	83 c4 10             	add    $0x10,%esp
c0109db9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0109dbd:	75 19                	jne    c0109dd8 <findElementInList+0x44>
c0109dbf:	6a 61                	push   $0x61
c0109dc1:	68 91 b1 10 c0       	push   $0xc010b191
c0109dc6:	68 91 b1 10 c0       	push   $0xc010b191
c0109dcb:	68 b0 b1 10 c0       	push   $0xc010b1b0
c0109dd0:	e8 e3 e7 ff ff       	call   c01085b8 <assertion_failure>
c0109dd5:	83 c4 10             	add    $0x10,%esp
c0109dd8:	e8 48 cd ff ff       	call   c0106b25 <intr_disable>
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
c0109e61:	e8 e8 cc ff ff       	call   c0106b4e <intr_set_status>
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
c0109e8f:	e8 91 cc ff ff       	call   c0106b25 <intr_disable>
c0109e94:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109e97:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0109e9b:	75 1c                	jne    c0109eb9 <appendToDoubleLinkList+0x49>
c0109e9d:	68 9e 00 00 00       	push   $0x9e
c0109ea2:	68 91 b1 10 c0       	push   $0xc010b191
c0109ea7:	68 91 b1 10 c0       	push   $0xc010b191
c0109eac:	68 a4 b1 10 c0       	push   $0xc010b1a4
c0109eb1:	e8 02 e7 ff ff       	call   c01085b8 <assertion_failure>
c0109eb6:	83 c4 10             	add    $0x10,%esp
c0109eb9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0109ebd:	75 1c                	jne    c0109edb <appendToDoubleLinkList+0x6b>
c0109ebf:	68 9f 00 00 00       	push   $0x9f
c0109ec4:	68 91 b1 10 c0       	push   $0xc010b191
c0109ec9:	68 91 b1 10 c0       	push   $0xc010b191
c0109ece:	68 b0 b1 10 c0       	push   $0xc010b1b0
c0109ed3:	e8 e0 e6 ff ff       	call   c01085b8 <assertion_failure>
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
c0109f47:	e8 02 cc ff ff       	call   c0106b4e <intr_set_status>
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
c0109f72:	e8 ae cb ff ff       	call   c0106b25 <intr_disable>
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
c0109fcd:	e8 7c cb ff ff       	call   c0106b4e <intr_set_status>
c0109fd2:	83 c4 10             	add    $0x10,%esp
c0109fd5:	eb 01                	jmp    c0109fd8 <insertToDoubleLinkList+0x81>
c0109fd7:	90                   	nop
c0109fd8:	c9                   	leave  
c0109fd9:	c3                   	ret    

c0109fda <popFromDoubleLinkList>:
c0109fda:	55                   	push   %ebp
c0109fdb:	89 e5                	mov    %esp,%ebp
c0109fdd:	83 ec 18             	sub    $0x18,%esp
c0109fe0:	e8 40 cb ff ff       	call   c0106b25 <intr_disable>
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
c010a04c:	e8 fd ca ff ff       	call   c0106b4e <intr_set_status>
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
c010a093:	e8 bc bf ff ff       	call   c0106054 <alloc_memory>
c010a098:	83 c4 10             	add    $0x10,%esp
c010a09b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a09e:	83 ec 04             	sub    $0x4,%esp
c010a0a1:	68 00 10 00 00       	push   $0x1000
c010a0a6:	6a 00                	push   $0x0
c010a0a8:	ff 75 f4             	pushl  -0xc(%ebp)
c010a0ab:	e8 3b 11 00 00       	call   c010b1eb <Memset>
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
c010a193:	e8 72 10 00 00       	call   c010b20a <Strcpy>
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
