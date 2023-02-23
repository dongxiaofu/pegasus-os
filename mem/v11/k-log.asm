
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
c0100025:	e8 ae 3a 00 00       	call   c0103ad8 <ReloadGDT>
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
c010014b:	e8 cd 6f 00 00       	call   c010711d <exception_handler>
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
c0100168:	e8 b0 6f 00 00       	call   c010711d <exception_handler>
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
c0100195:	e8 1b 35 00 00       	call   c01036b5 <clock_handler>
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
c01001c7:	e8 61 44 00 00       	call   c010462d <keyboard_handler>
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
c01002f5:	e8 bd 6c 00 00       	call   c0106fb7 <disp_int>
c01002fa:	83 c4 04             	add    $0x4,%esp
c01002fd:	58                   	pop    %eax
c01002fe:	5a                   	pop    %edx
c01002ff:	52                   	push   %edx
c0100300:	50                   	push   %eax
c0100301:	e8 b1 6c 00 00       	call   c0106fb7 <disp_int>
c0100306:	58                   	pop    %eax
c0100307:	5a                   	pop    %edx
c0100308:	52                   	push   %edx
c0100309:	50                   	push   %eax
c010030a:	ff 35 a8 f7 10 c0    	pushl  0xc010f7a8
c0100310:	e8 a2 6c 00 00       	call   c0106fb7 <disp_int>
c0100315:	83 c4 04             	add    $0x4,%esp
c0100318:	58                   	pop    %eax
c0100319:	5a                   	pop    %edx
c010031a:	52                   	push   %edx
c010031b:	50                   	push   %eax
c010031c:	ff 72 ec             	pushl  -0x14(%edx)
c010031f:	e8 93 6c 00 00       	call   c0106fb7 <disp_int>
c0100324:	83 c4 04             	add    $0x4,%esp
c0100327:	58                   	pop    %eax
c0100328:	5a                   	pop    %edx
c0100329:	52                   	push   %edx
c010032a:	50                   	push   %eax
c010032b:	ff 70 ec             	pushl  -0x14(%eax)
c010032e:	e8 84 6c 00 00       	call   c0106fb7 <disp_int>
c0100333:	83 c4 04             	add    $0x4,%esp
c0100336:	58                   	pop    %eax
c0100337:	5a                   	pop    %edx
c0100338:	52                   	push   %edx
c0100339:	50                   	push   %eax
c010033a:	ff 35 c0 fb 10 c0    	pushl  0xc010fbc0
c0100340:	e8 72 6c 00 00       	call   c0106fb7 <disp_int>
c0100345:	83 c4 04             	add    $0x4,%esp
c0100348:	58                   	pop    %eax
c0100349:	5a                   	pop    %edx
c010034a:	52                   	push   %edx
c010034b:	50                   	push   %eax
c010034c:	68 60 f7 10 c0       	push   $0xc010f760
c0100351:	e8 61 6c 00 00       	call   c0106fb7 <disp_int>
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
c010040b:	68 40 a4 10 c0       	push   $0xc010a440
c0100410:	50                   	push   %eax
c0100411:	e8 80 b1 00 00       	call   c010b596 <Strcpy>
c0100416:	83 c4 10             	add    $0x10,%esp
c0100419:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c010041e:	a3 c0 fb 10 c0       	mov    %eax,0xc010fbc0
c0100423:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c0100428:	05 60 02 00 00       	add    $0x260,%eax
c010042d:	83 ec 08             	sub    $0x8,%esp
c0100430:	50                   	push   %eax
c0100431:	68 ec fd 10 c0       	push   $0xc010fdec
c0100436:	e8 45 9c 00 00       	call   c010a080 <appendToDoubleLinkList>
c010043b:	83 c4 10             	add    $0x10,%esp
c010043e:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c0100443:	05 6a 02 00 00       	add    $0x26a,%eax
c0100448:	83 ec 08             	sub    $0x8,%esp
c010044b:	50                   	push   %eax
c010044c:	68 ec fd 10 c0       	push   $0xc010fdec
c0100451:	e8 2a 9c 00 00       	call   c010a080 <appendToDoubleLinkList>
c0100456:	83 c4 10             	add    $0x10,%esp
c0100459:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010045c:	83 ec 0c             	sub    $0xc,%esp
c010045f:	50                   	push   %eax
c0100460:	6a 00                	push   $0x0
c0100462:	68 4c a4 10 c0       	push   $0xc010a44c
c0100467:	68 53 a4 10 c0       	push   $0xc010a453
c010046c:	68 94 50 10 c0       	push   $0xc0105094
c0100471:	e8 43 99 00 00       	call   c0109db9 <process_execute>
c0100476:	83 c4 20             	add    $0x20,%esp
c0100479:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010047c:	83 ec 0c             	sub    $0xc,%esp
c010047f:	50                   	push   %eax
c0100480:	6a 00                	push   $0x0
c0100482:	68 5c a4 10 c0       	push   $0xc010a45c
c0100487:	68 64 a4 10 c0       	push   $0xc010a464
c010048c:	68 59 15 10 c0       	push   $0xc0101559
c0100491:	e8 23 99 00 00       	call   c0109db9 <process_execute>
c0100496:	83 c4 20             	add    $0x20,%esp
c0100499:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010049c:	83 ec 0c             	sub    $0xc,%esp
c010049f:	50                   	push   %eax
c01004a0:	6a 00                	push   $0x0
c01004a2:	68 6d a4 10 c0       	push   $0xc010a46d
c01004a7:	68 74 a4 10 c0       	push   $0xc010a474
c01004ac:	68 c6 06 10 c0       	push   $0xc01006c6
c01004b1:	e8 03 99 00 00       	call   c0109db9 <process_execute>
c01004b6:	83 c4 20             	add    $0x20,%esp
c01004b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01004bc:	83 ec 0c             	sub    $0xc,%esp
c01004bf:	50                   	push   %eax
c01004c0:	6a 00                	push   $0x0
c01004c2:	68 7d a4 10 c0       	push   $0xc010a47d
c01004c7:	68 85 a4 10 c0       	push   $0xc010a485
c01004cc:	68 2a 45 10 c0       	push   $0xc010452a
c01004d1:	e8 e3 98 00 00       	call   c0109db9 <process_execute>
c01004d6:	83 c4 20             	add    $0x20,%esp
c01004d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01004dc:	83 e8 02             	sub    $0x2,%eax
c01004df:	83 ec 0c             	sub    $0xc,%esp
c01004e2:	50                   	push   %eax
c01004e3:	6a 01                	push   $0x1
c01004e5:	68 8f a4 10 c0       	push   $0xc010a48f
c01004ea:	68 99 a4 10 c0       	push   $0xc010a499
c01004ef:	68 91 06 10 c0       	push   $0xc0100691
c01004f4:	e8 c0 98 00 00       	call   c0109db9 <process_execute>
c01004f9:	83 c4 20             	add    $0x20,%esp
c01004fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01004ff:	83 e8 03             	sub    $0x3,%eax
c0100502:	83 ec 0c             	sub    $0xc,%esp
c0100505:	50                   	push   %eax
c0100506:	6a 01                	push   $0x1
c0100508:	68 a6 a4 10 c0       	push   $0xc010a4a6
c010050d:	68 b0 a4 10 c0       	push   $0xc010a4b0
c0100512:	68 ae 06 10 c0       	push   $0xc01006ae
c0100517:	e8 9d 98 00 00       	call   c0109db9 <process_execute>
c010051c:	83 c4 20             	add    $0x20,%esp
c010051f:	83 ec 0c             	sub    $0xc,%esp
c0100522:	68 bd a4 10 c0       	push   $0xc010a4bd
c0100527:	e8 60 fb ff ff       	call   c010008c <disp_str>
c010052c:	83 c4 10             	add    $0x10,%esp
c010052f:	fb                   	sti    
c0100530:	e8 a6 65 00 00       	call   c0106adb <stop_here>
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
c0100586:	68 c7 a4 10 c0       	push   $0xc010a4c7
c010058b:	e8 fc fa ff ff       	call   c010008c <disp_str>
c0100590:	83 c4 10             	add    $0x10,%esp
c0100593:	e8 6f 6f 00 00       	call   c0107507 <init_keyboard>
c0100598:	83 ec 0c             	sub    $0xc,%esp
c010059b:	68 00 00 00 04       	push   $0x4000000
c01005a0:	e8 ed 63 00 00       	call   c0106992 <init_memory>
c01005a5:	83 c4 10             	add    $0x10,%esp
c01005a8:	83 ec 0c             	sub    $0xc,%esp
c01005ab:	68 ec fd 10 c0       	push   $0xc010fdec
c01005b0:	e8 a0 99 00 00       	call   c0109f55 <initDoubleLinkList>
c01005b5:	83 c4 10             	add    $0x10,%esp
c01005b8:	83 ec 0c             	sub    $0xc,%esp
c01005bb:	68 04 0f 11 c0       	push   $0xc0110f04
c01005c0:	e8 90 99 00 00       	call   c0109f55 <initDoubleLinkList>
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
c01005f9:	68 cd a4 10 c0       	push   $0xc010a4cd
c01005fe:	e8 89 fa ff ff       	call   c010008c <disp_str>
c0100603:	83 c4 10             	add    $0x10,%esp
c0100606:	83 ec 0c             	sub    $0xc,%esp
c0100609:	68 d6 a4 10 c0       	push   $0xc010a4d6
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
c0100646:	68 d8 a4 10 c0       	push   $0xc010a4d8
c010064b:	e8 3c fa ff ff       	call   c010008c <disp_str>
c0100650:	83 c4 10             	add    $0x10,%esp
c0100653:	83 ec 0c             	sub    $0xc,%esp
c0100656:	68 d6 a4 10 c0       	push   $0xc010a4d6
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
c010069a:	68 e4 a4 10 c0       	push   $0xc010a4e4
c010069f:	e8 e8 f9 ff ff       	call   c010008c <disp_str>
c01006a4:	83 c4 10             	add    $0x10,%esp
c01006a7:	e8 84 70 00 00       	call   c0107730 <TestFS2>
c01006ac:	eb fe                	jmp    c01006ac <user_proc_a+0x1b>

c01006ae <user_proc_b>:
c01006ae:	55                   	push   %ebp
c01006af:	89 e5                	mov    %esp,%ebp
c01006b1:	83 ec 08             	sub    $0x8,%esp
c01006b4:	83 ec 0c             	sub    $0xc,%esp
c01006b7:	68 04 a5 10 c0       	push   $0xc010a504
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
c01006f3:	e8 7f ae 00 00       	call   c010b577 <Memset>
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
c0100735:	e8 f3 8c 00 00       	call   c010942d <send_rec>
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
c01007a9:	68 24 a5 10 c0       	push   $0xc010a524
c01007ae:	68 24 a5 10 c0       	push   $0xc010a524
c01007b3:	68 2c a5 10 c0       	push   $0xc010a52c
c01007b8:	e8 00 80 00 00       	call   c01087bd <assertion_failure>
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
c0100814:	68 86 a5 10 c0       	push   $0xc010a586
c0100819:	e8 5b 7f 00 00       	call   c0108779 <spin>
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
c010084e:	68 98 a5 10 c0       	push   $0xc010a598
c0100853:	e8 47 7f 00 00       	call   c010879f <panic>
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
c01009af:	e8 c3 ab 00 00       	call   c010b577 <Memset>
c01009b4:	83 c4 10             	add    $0x10,%esp
c01009b7:	83 ec 04             	sub    $0x4,%esp
c01009ba:	ff 75 f4             	pushl  -0xc(%ebp)
c01009bd:	ff 75 ec             	pushl  -0x14(%ebp)
c01009c0:	68 f0 01 00 00       	push   $0x1f0
c01009c5:	e8 01 ac 00 00       	call   c010b5cb <read_port>
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
c0100b2d:	e8 64 aa 00 00       	call   c010b596 <Strcpy>
c0100b32:	83 c4 10             	add    $0x10,%esp
c0100b35:	eb 13                	jmp    c0100b4a <print_hdinfo+0x167>
c0100b37:	83 ec 08             	sub    $0x8,%esp
c0100b3a:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0100b3d:	50                   	push   %eax
c0100b3e:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0100b41:	50                   	push   %eax
c0100b42:	e8 4f aa 00 00       	call   c010b596 <Strcpy>
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
c0100b81:	68 a2 a5 10 c0       	push   $0xc010a5a2
c0100b86:	e8 d5 78 00 00       	call   c0108460 <Printf>
c0100b8b:	83 c4 10             	add    $0x10,%esp
c0100b8e:	8b 45 08             	mov    0x8(%ebp),%eax
c0100b91:	8b 40 0c             	mov    0xc(%eax),%eax
c0100b94:	83 ec 08             	sub    $0x8,%esp
c0100b97:	50                   	push   %eax
c0100b98:	68 aa a5 10 c0       	push   $0xc010a5aa
c0100b9d:	e8 be 78 00 00       	call   c0108460 <Printf>
c0100ba2:	83 c4 10             	add    $0x10,%esp
c0100ba5:	8b 45 08             	mov    0x8(%ebp),%eax
c0100ba8:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0100bac:	0f b6 c0             	movzbl %al,%eax
c0100baf:	83 ec 08             	sub    $0x8,%esp
c0100bb2:	50                   	push   %eax
c0100bb3:	68 bb a5 10 c0       	push   $0xc010a5bb
c0100bb8:	e8 a3 78 00 00       	call   c0108460 <Printf>
c0100bbd:	83 c4 10             	add    $0x10,%esp
c0100bc0:	8b 45 08             	mov    0x8(%ebp),%eax
c0100bc3:	0f b6 00             	movzbl (%eax),%eax
c0100bc6:	0f b6 c0             	movzbl %al,%eax
c0100bc9:	83 ec 08             	sub    $0x8,%esp
c0100bcc:	50                   	push   %eax
c0100bcd:	68 c9 a5 10 c0       	push   $0xc010a5c9
c0100bd2:	e8 89 78 00 00       	call   c0108460 <Printf>
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
c0100c76:	e8 fc a8 00 00       	call   c010b577 <Memset>
c0100c7b:	83 c4 10             	add    $0x10,%esp
c0100c7e:	83 ec 04             	sub    $0x4,%esp
c0100c81:	ff 75 f4             	pushl  -0xc(%ebp)
c0100c84:	ff 75 ec             	pushl  -0x14(%ebp)
c0100c87:	68 f0 01 00 00       	push   $0x1f0
c0100c8c:	e8 3a a9 00 00       	call   c010b5cb <read_port>
c0100c91:	83 c4 10             	add    $0x10,%esp
c0100c94:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100c97:	05 be 01 00 00       	add    $0x1be,%eax
c0100c9c:	83 ec 04             	sub    $0x4,%esp
c0100c9f:	6a 40                	push   $0x40
c0100ca1:	50                   	push   %eax
c0100ca2:	ff 75 10             	pushl  0x10(%ebp)
c0100ca5:	e8 1f 5f 00 00       	call   c0106bc9 <Memcpy>
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
c0100d13:	e8 5f a8 00 00       	call   c010b577 <Memset>
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
c0100e45:	e8 2d a7 00 00       	call   c010b577 <Memset>
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
c0100f3c:	e8 36 a6 00 00       	call   c010b577 <Memset>
c0100f41:	83 c4 10             	add    $0x10,%esp
c0100f44:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100f47:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0100f4e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100f51:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0100f58:	83 ec 04             	sub    $0x4,%esp
c0100f5b:	6a 02                	push   $0x2
c0100f5d:	ff 75 f0             	pushl  -0x10(%ebp)
c0100f60:	6a 01                	push   $0x1
c0100f62:	e8 c6 84 00 00       	call   c010942d <send_rec>
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
c0100feb:	e8 87 a5 00 00       	call   c010b577 <Memset>
c0100ff0:	83 c4 10             	add    $0x10,%esp
c0100ff3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100ff6:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0100ffd:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101000:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0101007:	83 ec 04             	sub    $0x4,%esp
c010100a:	6a 02                	push   $0x2
c010100c:	ff 75 ec             	pushl  -0x14(%ebp)
c010100f:	6a 01                	push   $0x1
c0101011:	e8 17 84 00 00       	call   c010942d <send_rec>
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
c010104f:	68 d4 a5 10 c0       	push   $0xc010a5d4
c0101054:	e8 46 77 00 00       	call   c010879f <panic>
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
c010107f:	e8 f3 a4 00 00       	call   c010b577 <Memset>
c0101084:	83 c4 10             	add    $0x10,%esp
c0101087:	83 ec 04             	sub    $0x4,%esp
c010108a:	68 13 02 00 00       	push   $0x213
c010108f:	ff 75 f4             	pushl  -0xc(%ebp)
c0101092:	6a 02                	push   $0x2
c0101094:	e8 94 83 00 00       	call   c010942d <send_rec>
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
c01011a6:	e8 b1 4b 00 00       	call   c0105d5c <alloc_virtual_memory>
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
c01011cb:	68 24 a5 10 c0       	push   $0xc010a524
c01011d0:	68 24 a5 10 c0       	push   $0xc010a524
c01011d5:	68 e6 a5 10 c0       	push   $0xc010a5e6
c01011da:	e8 de 75 00 00       	call   c01087bd <assertion_failure>
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
c010123d:	68 24 a5 10 c0       	push   $0xc010a524
c0101242:	68 24 a5 10 c0       	push   $0xc010a524
c0101247:	68 04 a6 10 c0       	push   $0xc010a604
c010124c:	e8 6c 75 00 00       	call   c01087bd <assertion_failure>
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
c0101298:	e8 da a2 00 00       	call   c010b577 <Memset>
c010129d:	83 c4 10             	add    $0x10,%esp
c01012a0:	83 ec 04             	sub    $0x4,%esp
c01012a3:	68 00 02 00 00       	push   $0x200
c01012a8:	68 80 11 11 c0       	push   $0xc0111180
c01012ad:	68 f0 01 00 00       	push   $0x1f0
c01012b2:	e8 14 a3 00 00       	call   c010b5cb <read_port>
c01012b7:	83 c4 10             	add    $0x10,%esp
c01012ba:	83 ec 04             	sub    $0x4,%esp
c01012bd:	ff 75 c4             	pushl  -0x3c(%ebp)
c01012c0:	68 80 11 11 c0       	push   $0xc0111180
c01012c5:	ff 75 f0             	pushl  -0x10(%ebp)
c01012c8:	e8 fc 58 00 00       	call   c0106bc9 <Memcpy>
c01012cd:	83 c4 10             	add    $0x10,%esp
c01012d0:	eb 26                	jmp    c01012f8 <hd_rdwt+0x249>
c01012d2:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c01012d6:	75 20                	jne    c01012f8 <hd_rdwt+0x249>
c01012d8:	e8 51 fd ff ff       	call   c010102e <wait_for>
c01012dd:	83 ec 04             	sub    $0x4,%esp
c01012e0:	ff 75 c4             	pushl  -0x3c(%ebp)
c01012e3:	ff 75 f0             	pushl  -0x10(%ebp)
c01012e6:	68 f0 01 00 00       	push   $0x1f0
c01012eb:	e8 ef a2 00 00       	call   c010b5df <write_port>
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
c010131c:	e8 56 a2 00 00       	call   c010b577 <Memset>
c0101321:	83 c4 10             	add    $0x10,%esp
c0101324:	c7 45 b8 65 00 00 00 	movl   $0x65,-0x48(%ebp)
c010132b:	c7 85 48 ff ff ff 00 	movl   $0x0,-0xb8(%ebp)
c0101332:	00 00 00 
c0101335:	83 ec 04             	sub    $0x4,%esp
c0101338:	6a 02                	push   $0x2
c010133a:	8d 85 40 ff ff ff    	lea    -0xc0(%ebp),%eax
c0101340:	50                   	push   %eax
c0101341:	6a 01                	push   $0x1
c0101343:	e8 e5 80 00 00       	call   c010942d <send_rec>
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
c010136f:	e8 53 83 00 00       	call   c01096c7 <inform_int>
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
c01013c7:	68 38 a6 10 c0       	push   $0xc010a638
c01013cc:	e8 8f 70 00 00       	call   c0108460 <Printf>
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
c0101404:	68 55 a6 10 c0       	push   $0xc010a655
c0101409:	e8 52 70 00 00       	call   c0108460 <Printf>
c010140e:	83 c4 10             	add    $0x10,%esp
c0101411:	eb 01                	jmp    c0101414 <print_hd_info+0x56>
c0101413:	90                   	nop
c0101414:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0101418:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c010141c:	7e bf                	jle    c01013dd <print_hd_info+0x1f>
c010141e:	83 ec 0c             	sub    $0xc,%esp
c0101421:	68 6d a6 10 c0       	push   $0xc010a66d
c0101426:	e8 35 70 00 00       	call   c0108460 <Printf>
c010142b:	83 c4 10             	add    $0x10,%esp
c010142e:	83 ec 0c             	sub    $0xc,%esp
c0101431:	68 88 a6 10 c0       	push   $0xc010a688
c0101436:	e8 25 70 00 00       	call   c0108460 <Printf>
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
c010147e:	68 55 a6 10 c0       	push   $0xc010a655
c0101483:	e8 d8 6f 00 00       	call   c0108460 <Printf>
c0101488:	83 c4 10             	add    $0x10,%esp
c010148b:	eb 01                	jmp    c010148e <print_hd_info+0xd0>
c010148d:	90                   	nop
c010148e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0101492:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c0101496:	7e b6                	jle    c010144e <print_hd_info+0x90>
c0101498:	83 ec 0c             	sub    $0xc,%esp
c010149b:	68 a5 a6 10 c0       	push   $0xc010a6a5
c01014a0:	e8 bb 6f 00 00       	call   c0108460 <Printf>
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
c010158e:	e8 e4 9f 00 00       	call   c010b577 <Memset>
c0101593:	83 c4 10             	add    $0x10,%esp
c0101596:	83 ec 04             	sub    $0x4,%esp
c0101599:	6a 12                	push   $0x12
c010159b:	ff 75 f4             	pushl  -0xc(%ebp)
c010159e:	6a 02                	push   $0x2
c01015a0:	e8 88 7e 00 00       	call   c010942d <send_rec>
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
c01015e8:	e8 39 21 00 00       	call   c0103726 <pid2proc>
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
c010161b:	68 c4 a6 10 c0       	push   $0xc010a6c4
c0101620:	68 c4 a6 10 c0       	push   $0xc010a6c4
c0101625:	68 d4 a6 10 c0       	push   $0xc010a6d4
c010162a:	e8 8e 71 00 00       	call   c01087bd <assertion_failure>
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
c01016a0:	e8 88 7d 00 00       	call   c010942d <send_rec>
c01016a5:	83 c4 10             	add    $0x10,%esp
c01016a8:	e9 b2 00 00 00       	jmp    c010175f <task_fs+0x206>
c01016ad:	83 ec 0c             	sub    $0xc,%esp
c01016b0:	ff 75 f4             	pushl  -0xc(%ebp)
c01016b3:	e8 19 19 00 00       	call   c0102fd1 <do_rdwt>
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
c01016e9:	e8 3f 7d 00 00       	call   c010942d <send_rec>
c01016ee:	83 c4 10             	add    $0x10,%esp
c01016f1:	eb 6b                	jmp    c010175e <task_fs+0x205>
c01016f3:	83 ec 0c             	sub    $0xc,%esp
c01016f6:	ff 75 e4             	pushl  -0x1c(%ebp)
c01016f9:	e8 f0 1d 00 00       	call   c01034ee <do_close>
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
c0101723:	e8 05 7d 00 00       	call   c010942d <send_rec>
c0101728:	83 c4 10             	add    $0x10,%esp
c010172b:	eb 32                	jmp    c010175f <task_fs+0x206>
c010172d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101730:	8b 40 68             	mov    0x68(%eax),%eax
c0101733:	83 ec 04             	sub    $0x4,%esp
c0101736:	50                   	push   %eax
c0101737:	ff 75 f4             	pushl  -0xc(%ebp)
c010173a:	6a 01                	push   $0x1
c010173c:	e8 ec 7c 00 00       	call   c010942d <send_rec>
c0101741:	83 c4 10             	add    $0x10,%esp
c0101744:	eb 19                	jmp    c010175f <task_fs+0x206>
c0101746:	83 ec 0c             	sub    $0xc,%esp
c0101749:	68 37 a7 10 c0       	push   $0xc010a737
c010174e:	e8 4c 70 00 00       	call   c010879f <panic>
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
c0101784:	e8 ee 9d 00 00       	call   c010b577 <Memset>
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
c01017cf:	68 c4 a6 10 c0       	push   $0xc010a6c4
c01017d4:	68 c4 a6 10 c0       	push   $0xc010a6c4
c01017d9:	68 4a a7 10 c0       	push   $0xc010a74a
c01017de:	e8 da 6f 00 00       	call   c01087bd <assertion_failure>
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
c0101801:	68 c4 a6 10 c0       	push   $0xc010a6c4
c0101806:	68 c4 a6 10 c0       	push   $0xc010a6c4
c010180b:	68 68 a7 10 c0       	push   $0xc010a768
c0101810:	e8 a8 6f 00 00       	call   c01087bd <assertion_failure>
c0101815:	83 c4 10             	add    $0x10,%esp
c0101818:	83 ec 04             	sub    $0x4,%esp
c010181b:	6a 03                	push   $0x3
c010181d:	ff 75 f4             	pushl  -0xc(%ebp)
c0101820:	6a 03                	push   $0x3
c0101822:	e8 06 7c 00 00       	call   c010942d <send_rec>
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
c0101877:	e8 2f 46 00 00       	call   c0105eab <get_physical_address>
c010187c:	83 c4 10             	add    $0x10,%esp
c010187f:	a3 84 17 11 c0       	mov    %eax,0xc0111784
c0101884:	a1 a0 21 11 c0       	mov    0xc01121a0,%eax
c0101889:	83 ec 0c             	sub    $0xc,%esp
c010188c:	50                   	push   %eax
c010188d:	e8 19 46 00 00       	call   c0105eab <get_physical_address>
c0101892:	83 c4 10             	add    $0x10,%esp
c0101895:	a3 80 17 11 c0       	mov    %eax,0xc0111780
c010189a:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c010189f:	83 ec 04             	sub    $0x4,%esp
c01018a2:	68 00 02 00 00       	push   $0x200
c01018a7:	6a 00                	push   $0x0
c01018a9:	50                   	push   %eax
c01018aa:	e8 c8 9c 00 00       	call   c010b577 <Memset>
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
c010193d:	e8 35 9c 00 00       	call   c010b577 <Memset>
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
c01019ad:	e8 c5 9b 00 00       	call   c010b577 <Memset>
c01019b2:	83 c4 10             	add    $0x10,%esp
c01019b5:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c01019ba:	83 c0 01             	add    $0x1,%eax
c01019bd:	83 ec 04             	sub    $0x4,%esp
c01019c0:	68 ff 01 00 00       	push   $0x1ff
c01019c5:	6a 80                	push   $0xffffff80
c01019c7:	50                   	push   %eax
c01019c8:	e8 aa 9b 00 00       	call   c010b577 <Memset>
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
c0101a03:	e8 6f 9b 00 00       	call   c010b577 <Memset>
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
c0101a35:	e8 3d 9b 00 00       	call   c010b577 <Memset>
c0101a3a:	83 c4 10             	add    $0x10,%esp
c0101a3d:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101a42:	83 c0 01             	add    $0x1,%eax
c0101a45:	83 ec 04             	sub    $0x4,%esp
c0101a48:	68 ff 01 00 00       	push   $0x1ff
c0101a4d:	6a 00                	push   $0x0
c0101a4f:	50                   	push   %eax
c0101a50:	e8 22 9b 00 00       	call   c010b577 <Memset>
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
c0101beb:	c7 85 70 ff ff ff 90 	movl   $0xc010a790,-0x90(%ebp)
c0101bf2:	a7 10 c0 
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
c0101ccb:	e8 e0 98 00 00       	call   c010b5b0 <Strlen>
c0101cd0:	83 c4 10             	add    $0x10,%esp
c0101cd3:	89 c1                	mov    %eax,%ecx
c0101cd5:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101cd8:	8d 50 04             	lea    0x4(%eax),%edx
c0101cdb:	83 ec 04             	sub    $0x4,%esp
c0101cde:	51                   	push   %ecx
c0101cdf:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0101ce5:	50                   	push   %eax
c0101ce6:	52                   	push   %edx
c0101ce7:	e8 dd 4e 00 00       	call   c0106bc9 <Memcpy>
c0101cec:	83 c4 10             	add    $0x10,%esp
c0101cef:	8d 95 34 ff ff ff    	lea    -0xcc(%ebp),%edx
c0101cf5:	b8 00 00 00 00       	mov    $0x0,%eax
c0101cfa:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0101cff:	89 d7                	mov    %edx,%edi
c0101d01:	f3 ab                	rep stos %eax,%es:(%edi)
c0101d03:	c7 85 34 ff ff ff 9c 	movl   $0xc010a79c,-0xcc(%ebp)
c0101d0a:	a7 10 c0 
c0101d0d:	c7 85 38 ff ff ff a5 	movl   $0xc010a7a5,-0xc8(%ebp)
c0101d14:	a7 10 c0 
c0101d17:	c7 85 3c ff ff ff ae 	movl   $0xc010a7ae,-0xc4(%ebp)
c0101d1e:	a7 10 c0 
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
c0101d4e:	e8 5d 98 00 00       	call   c010b5b0 <Strlen>
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
c0101d6e:	e8 56 4e 00 00       	call   c0106bc9 <Memcpy>
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
c0101d99:	e8 12 98 00 00       	call   c010b5b0 <Strlen>
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
c0101dc2:	e8 e9 97 00 00       	call   c010b5b0 <Strlen>
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
c0101de2:	e8 e2 4d 00 00       	call   c0106bc9 <Memcpy>
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
c0101e53:	e8 d5 75 00 00       	call   c010942d <send_rec>
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
c0101e84:	e8 ee 96 00 00       	call   c010b577 <Memset>
c0101e89:	83 c4 10             	add    $0x10,%esp
c0101e8c:	8b 45 08             	mov    0x8(%ebp),%eax
c0101e8f:	8b 40 44             	mov    0x44(%eax),%eax
c0101e92:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0101e95:	83 ec 08             	sub    $0x8,%esp
c0101e98:	6a 0c                	push   $0xc
c0101e9a:	ff 75 e4             	pushl  -0x1c(%ebp)
c0101e9d:	e8 ba 3e 00 00       	call   c0105d5c <alloc_virtual_memory>
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
c0101ebc:	e8 08 4d 00 00       	call   c0106bc9 <Memcpy>
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
c0101f18:	68 c4 a6 10 c0       	push   $0xc010a6c4
c0101f1d:	68 c4 a6 10 c0       	push   $0xc010a6c4
c0101f22:	68 b7 a7 10 c0       	push   $0xc010a7b7
c0101f27:	e8 91 68 00 00       	call   c01087bd <assertion_failure>
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
c0101f6d:	68 c4 a6 10 c0       	push   $0xc010a6c4
c0101f72:	68 c4 a6 10 c0       	push   $0xc010a6c4
c0101f77:	68 bf a7 10 c0       	push   $0xc010a7bf
c0101f7c:	e8 3c 68 00 00       	call   c01087bd <assertion_failure>
c0101f81:	83 c4 10             	add    $0x10,%esp
c0101f84:	83 ec 0c             	sub    $0xc,%esp
c0101f87:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0101f8a:	50                   	push   %eax
c0101f8b:	e8 d2 00 00 00       	call   c0102062 <search_file>
c0101f90:	83 c4 10             	add    $0x10,%esp
c0101f93:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0101f96:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c0101f9a:	75 2b                	jne    c0101fc7 <do_open+0x154>
c0101f9c:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0101fa0:	7e 10                	jle    c0101fb2 <do_open+0x13f>
c0101fa2:	83 ec 0c             	sub    $0xc,%esp
c0101fa5:	68 c7 a7 10 c0       	push   $0xc010a7c7
c0101faa:	e8 f0 67 00 00       	call   c010879f <panic>
c0101faf:	83 c4 10             	add    $0x10,%esp
c0101fb2:	83 ec 08             	sub    $0x8,%esp
c0101fb5:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0101fb8:	50                   	push   %eax
c0101fb9:	8d 45 9c             	lea    -0x64(%ebp),%eax
c0101fbc:	50                   	push   %eax
c0101fbd:	e8 60 04 00 00       	call   c0102422 <create_file>
c0101fc2:	83 c4 10             	add    $0x10,%esp
c0101fc5:	eb 25                	jmp    c0101fec <do_open+0x179>
c0101fc7:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
c0101fcb:	75 0a                	jne    c0101fd7 <do_open+0x164>
c0101fcd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0101fd2:	e9 89 00 00 00       	jmp    c0102060 <do_open+0x1ed>
c0101fd7:	83 ec 08             	sub    $0x8,%esp
c0101fda:	ff 75 d8             	pushl  -0x28(%ebp)
c0101fdd:	8d 45 9c             	lea    -0x64(%ebp),%eax
c0101fe0:	50                   	push   %eax
c0101fe1:	e8 7a 02 00 00       	call   c0102260 <get_inode>
c0101fe6:	83 c4 10             	add    $0x10,%esp
c0101fe9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0101fec:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c0101ff1:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0101ff4:	c1 e2 04             	shl    $0x4,%edx
c0101ff7:	8d 8a 80 13 11 c0    	lea    -0x3feeec80(%edx),%ecx
c0101ffd:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102000:	83 c2 4c             	add    $0x4c,%edx
c0102003:	89 4c 90 0c          	mov    %ecx,0xc(%eax,%edx,4)
c0102007:	8b 45 ac             	mov    -0x54(%ebp),%eax
c010200a:	8b 55 ec             	mov    -0x14(%ebp),%edx
c010200d:	c1 e2 04             	shl    $0x4,%edx
c0102010:	81 c2 88 13 11 c0    	add    $0xc0111388,%edx
c0102016:	89 02                	mov    %eax,(%edx)
c0102018:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010201b:	c1 e0 04             	shl    $0x4,%eax
c010201e:	05 84 13 11 c0       	add    $0xc0111384,%eax
c0102023:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0102029:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010202c:	c1 e0 04             	shl    $0x4,%eax
c010202f:	05 80 13 11 c0       	add    $0xc0111380,%eax
c0102034:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010203a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010203d:	c1 e0 04             	shl    $0x4,%eax
c0102040:	05 8c 13 11 c0       	add    $0xc011138c,%eax
c0102045:	8b 00                	mov    (%eax),%eax
c0102047:	8d 50 01             	lea    0x1(%eax),%edx
c010204a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010204d:	c1 e0 04             	shl    $0x4,%eax
c0102050:	05 8c 13 11 c0       	add    $0xc011138c,%eax
c0102055:	89 10                	mov    %edx,(%eax)
c0102057:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010205a:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010205d:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0102060:	c9                   	leave  
c0102061:	c3                   	ret    

c0102062 <search_file>:
c0102062:	55                   	push   %ebp
c0102063:	89 e5                	mov    %esp,%ebp
c0102065:	83 ec 68             	sub    $0x68,%esp
c0102068:	83 ec 04             	sub    $0x4,%esp
c010206b:	6a 0c                	push   $0xc
c010206d:	6a 00                	push   $0x0
c010206f:	8d 45 c0             	lea    -0x40(%ebp),%eax
c0102072:	50                   	push   %eax
c0102073:	e8 ff 94 00 00       	call   c010b577 <Memset>
c0102078:	83 c4 10             	add    $0x10,%esp
c010207b:	83 ec 04             	sub    $0x4,%esp
c010207e:	6a 28                	push   $0x28
c0102080:	6a 00                	push   $0x0
c0102082:	8d 45 98             	lea    -0x68(%ebp),%eax
c0102085:	50                   	push   %eax
c0102086:	e8 ec 94 00 00       	call   c010b577 <Memset>
c010208b:	83 c4 10             	add    $0x10,%esp
c010208e:	83 ec 04             	sub    $0x4,%esp
c0102091:	8d 45 98             	lea    -0x68(%ebp),%eax
c0102094:	50                   	push   %eax
c0102095:	ff 75 08             	pushl  0x8(%ebp)
c0102098:	8d 45 c0             	lea    -0x40(%ebp),%eax
c010209b:	50                   	push   %eax
c010209c:	e8 f3 00 00 00       	call   c0102194 <strip_path>
c01020a1:	83 c4 10             	add    $0x10,%esp
c01020a4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01020a7:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%ebp)
c01020ab:	75 0a                	jne    c01020b7 <search_file+0x55>
c01020ad:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01020b2:	e9 db 00 00 00       	jmp    c0102192 <search_file+0x130>
c01020b7:	8b 45 9c             	mov    -0x64(%ebp),%eax
c01020ba:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01020bd:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01020c0:	05 00 02 00 00       	add    $0x200,%eax
c01020c5:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c01020cb:	85 c0                	test   %eax,%eax
c01020cd:	0f 48 c2             	cmovs  %edx,%eax
c01020d0:	c1 f8 09             	sar    $0x9,%eax
c01020d3:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01020d6:	8b 45 9c             	mov    -0x64(%ebp),%eax
c01020d9:	c1 e8 04             	shr    $0x4,%eax
c01020dc:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01020df:	e8 5c 14 00 00       	call   c0103540 <get_super_block>
c01020e4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01020e7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01020ea:	8b 00                	mov    (%eax),%eax
c01020ec:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01020ef:	c7 45 cc 20 00 00 00 	movl   $0x20,-0x34(%ebp)
c01020f6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01020fd:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102104:	eb 7b                	jmp    c0102181 <search_file+0x11f>
c0102106:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010210b:	89 c1                	mov    %eax,%ecx
c010210d:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0102110:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102113:	01 d0                	add    %edx,%eax
c0102115:	83 ec 0c             	sub    $0xc,%esp
c0102118:	6a 07                	push   $0x7
c010211a:	68 00 02 00 00       	push   $0x200
c010211f:	51                   	push   %ecx
c0102120:	ff 75 cc             	pushl  -0x34(%ebp)
c0102123:	50                   	push   %eax
c0102124:	e8 3b f6 ff ff       	call   c0101764 <rd_wt>
c0102129:	83 c4 20             	add    $0x20,%esp
c010212c:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0102131:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102134:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010213b:	eb 35                	jmp    c0102172 <search_file+0x110>
c010213d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0102141:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102144:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0102147:	7f 33                	jg     c010217c <search_file+0x11a>
c0102149:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010214c:	83 c0 04             	add    $0x4,%eax
c010214f:	83 ec 08             	sub    $0x8,%esp
c0102152:	50                   	push   %eax
c0102153:	8d 45 c0             	lea    -0x40(%ebp),%eax
c0102156:	50                   	push   %eax
c0102157:	e8 38 76 00 00       	call   c0109794 <strcmp>
c010215c:	83 c4 10             	add    $0x10,%esp
c010215f:	85 c0                	test   %eax,%eax
c0102161:	75 07                	jne    c010216a <search_file+0x108>
c0102163:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102166:	8b 00                	mov    (%eax),%eax
c0102168:	eb 28                	jmp    c0102192 <search_file+0x130>
c010216a:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c010216e:	83 45 ec 10          	addl   $0x10,-0x14(%ebp)
c0102172:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102175:	83 f8 1f             	cmp    $0x1f,%eax
c0102178:	76 c3                	jbe    c010213d <search_file+0xdb>
c010217a:	eb 01                	jmp    c010217d <search_file+0x11b>
c010217c:	90                   	nop
c010217d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0102181:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102184:	3b 45 dc             	cmp    -0x24(%ebp),%eax
c0102187:	0f 8c 79 ff ff ff    	jl     c0102106 <search_file+0xa4>
c010218d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102192:	c9                   	leave  
c0102193:	c3                   	ret    

c0102194 <strip_path>:
c0102194:	55                   	push   %ebp
c0102195:	89 e5                	mov    %esp,%ebp
c0102197:	83 ec 10             	sub    $0x10,%esp
c010219a:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010219e:	75 0a                	jne    c01021aa <strip_path+0x16>
c01021a0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01021a5:	e9 b4 00 00 00       	jmp    c010225e <strip_path+0xca>
c01021aa:	8b 45 08             	mov    0x8(%ebp),%eax
c01021ad:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01021b0:	8b 45 0c             	mov    0xc(%ebp),%eax
c01021b3:	89 45 f8             	mov    %eax,-0x8(%ebp)
c01021b6:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01021b9:	0f b6 00             	movzbl (%eax),%eax
c01021bc:	3c 2f                	cmp    $0x2f,%al
c01021be:	75 2d                	jne    c01021ed <strip_path+0x59>
c01021c0:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c01021c4:	eb 27                	jmp    c01021ed <strip_path+0x59>
c01021c6:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01021c9:	0f b6 00             	movzbl (%eax),%eax
c01021cc:	3c 2f                	cmp    $0x2f,%al
c01021ce:	75 0a                	jne    c01021da <strip_path+0x46>
c01021d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01021d5:	e9 84 00 00 00       	jmp    c010225e <strip_path+0xca>
c01021da:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01021dd:	0f b6 10             	movzbl (%eax),%edx
c01021e0:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01021e3:	88 10                	mov    %dl,(%eax)
c01021e5:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c01021e9:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c01021ed:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01021f0:	0f b6 00             	movzbl (%eax),%eax
c01021f3:	84 c0                	test   %al,%al
c01021f5:	75 cf                	jne    c01021c6 <strip_path+0x32>
c01021f7:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01021fa:	c6 00 00             	movb   $0x0,(%eax)
c01021fd:	8b 45 10             	mov    0x10(%ebp),%eax
c0102200:	8b 15 c0 21 11 c0    	mov    0xc01121c0,%edx
c0102206:	89 10                	mov    %edx,(%eax)
c0102208:	8b 15 c4 21 11 c0    	mov    0xc01121c4,%edx
c010220e:	89 50 04             	mov    %edx,0x4(%eax)
c0102211:	8b 15 c8 21 11 c0    	mov    0xc01121c8,%edx
c0102217:	89 50 08             	mov    %edx,0x8(%eax)
c010221a:	8b 15 cc 21 11 c0    	mov    0xc01121cc,%edx
c0102220:	89 50 0c             	mov    %edx,0xc(%eax)
c0102223:	8b 15 d0 21 11 c0    	mov    0xc01121d0,%edx
c0102229:	89 50 10             	mov    %edx,0x10(%eax)
c010222c:	8b 15 d4 21 11 c0    	mov    0xc01121d4,%edx
c0102232:	89 50 14             	mov    %edx,0x14(%eax)
c0102235:	8b 15 d8 21 11 c0    	mov    0xc01121d8,%edx
c010223b:	89 50 18             	mov    %edx,0x18(%eax)
c010223e:	8b 15 dc 21 11 c0    	mov    0xc01121dc,%edx
c0102244:	89 50 1c             	mov    %edx,0x1c(%eax)
c0102247:	8b 15 e0 21 11 c0    	mov    0xc01121e0,%edx
c010224d:	89 50 20             	mov    %edx,0x20(%eax)
c0102250:	8b 15 e4 21 11 c0    	mov    0xc01121e4,%edx
c0102256:	89 50 24             	mov    %edx,0x24(%eax)
c0102259:	b8 00 00 00 00       	mov    $0x0,%eax
c010225e:	c9                   	leave  
c010225f:	c3                   	ret    

c0102260 <get_inode>:
c0102260:	55                   	push   %ebp
c0102261:	89 e5                	mov    %esp,%ebp
c0102263:	56                   	push   %esi
c0102264:	53                   	push   %ebx
c0102265:	83 ec 20             	sub    $0x20,%esp
c0102268:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010226c:	75 0a                	jne    c0102278 <get_inode+0x18>
c010226e:	b8 00 00 00 00       	mov    $0x0,%eax
c0102273:	e9 a3 01 00 00       	jmp    c010241b <get_inode+0x1bb>
c0102278:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010227f:	c7 45 f0 a0 17 11 c0 	movl   $0xc01117a0,-0x10(%ebp)
c0102286:	eb 69                	jmp    c01022f1 <get_inode+0x91>
c0102288:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010228b:	8b 40 24             	mov    0x24(%eax),%eax
c010228e:	85 c0                	test   %eax,%eax
c0102290:	7e 53                	jle    c01022e5 <get_inode+0x85>
c0102292:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102295:	8b 40 10             	mov    0x10(%eax),%eax
c0102298:	39 45 0c             	cmp    %eax,0xc(%ebp)
c010229b:	75 50                	jne    c01022ed <get_inode+0x8d>
c010229d:	8b 45 08             	mov    0x8(%ebp),%eax
c01022a0:	8b 55 f0             	mov    -0x10(%ebp),%edx
c01022a3:	8b 0a                	mov    (%edx),%ecx
c01022a5:	89 08                	mov    %ecx,(%eax)
c01022a7:	8b 4a 04             	mov    0x4(%edx),%ecx
c01022aa:	89 48 04             	mov    %ecx,0x4(%eax)
c01022ad:	8b 4a 08             	mov    0x8(%edx),%ecx
c01022b0:	89 48 08             	mov    %ecx,0x8(%eax)
c01022b3:	8b 4a 0c             	mov    0xc(%edx),%ecx
c01022b6:	89 48 0c             	mov    %ecx,0xc(%eax)
c01022b9:	8b 4a 10             	mov    0x10(%edx),%ecx
c01022bc:	89 48 10             	mov    %ecx,0x10(%eax)
c01022bf:	8b 4a 14             	mov    0x14(%edx),%ecx
c01022c2:	89 48 14             	mov    %ecx,0x14(%eax)
c01022c5:	8b 4a 18             	mov    0x18(%edx),%ecx
c01022c8:	89 48 18             	mov    %ecx,0x18(%eax)
c01022cb:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c01022ce:	89 48 1c             	mov    %ecx,0x1c(%eax)
c01022d1:	8b 4a 20             	mov    0x20(%edx),%ecx
c01022d4:	89 48 20             	mov    %ecx,0x20(%eax)
c01022d7:	8b 52 24             	mov    0x24(%edx),%edx
c01022da:	89 50 24             	mov    %edx,0x24(%eax)
c01022dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01022e0:	e9 36 01 00 00       	jmp    c010241b <get_inode+0x1bb>
c01022e5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01022e8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01022eb:	eb 0d                	jmp    c01022fa <get_inode+0x9a>
c01022ed:	83 45 f0 28          	addl   $0x28,-0x10(%ebp)
c01022f1:	81 7d f0 a0 21 11 c0 	cmpl   $0xc01121a0,-0x10(%ebp)
c01022f8:	76 8e                	jbe    c0102288 <get_inode+0x28>
c01022fa:	e8 41 12 00 00       	call   c0103540 <get_super_block>
c01022ff:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102302:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c0102309:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010230c:	8b 40 04             	mov    0x4(%eax),%eax
c010230f:	8d 50 02             	lea    0x2(%eax),%edx
c0102312:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102315:	8b 40 08             	mov    0x8(%eax),%eax
c0102318:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c010231b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010231e:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0102321:	b8 00 02 00 00       	mov    $0x200,%eax
c0102326:	99                   	cltd   
c0102327:	f7 7d e8             	idivl  -0x18(%ebp)
c010232a:	89 c6                	mov    %eax,%esi
c010232c:	89 c8                	mov    %ecx,%eax
c010232e:	99                   	cltd   
c010232f:	f7 fe                	idiv   %esi
c0102331:	01 d8                	add    %ebx,%eax
c0102333:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0102336:	c7 45 e0 20 00 00 00 	movl   $0x20,-0x20(%ebp)
c010233d:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102342:	83 ec 0c             	sub    $0xc,%esp
c0102345:	6a 07                	push   $0x7
c0102347:	68 00 02 00 00       	push   $0x200
c010234c:	50                   	push   %eax
c010234d:	ff 75 e0             	pushl  -0x20(%ebp)
c0102350:	ff 75 e4             	pushl  -0x1c(%ebp)
c0102353:	e8 0c f4 ff ff       	call   c0101764 <rd_wt>
c0102358:	83 c4 20             	add    $0x20,%esp
c010235b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010235e:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0102361:	b8 00 02 00 00       	mov    $0x200,%eax
c0102366:	99                   	cltd   
c0102367:	f7 7d e8             	idivl  -0x18(%ebp)
c010236a:	89 c3                	mov    %eax,%ebx
c010236c:	89 c8                	mov    %ecx,%eax
c010236e:	99                   	cltd   
c010236f:	f7 fb                	idiv   %ebx
c0102371:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0102374:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c010237a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010237d:	0f af 45 dc          	imul   -0x24(%ebp),%eax
c0102381:	01 d0                	add    %edx,%eax
c0102383:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0102386:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102389:	8b 55 d8             	mov    -0x28(%ebp),%edx
c010238c:	8b 0a                	mov    (%edx),%ecx
c010238e:	89 08                	mov    %ecx,(%eax)
c0102390:	8b 4a 04             	mov    0x4(%edx),%ecx
c0102393:	89 48 04             	mov    %ecx,0x4(%eax)
c0102396:	8b 4a 08             	mov    0x8(%edx),%ecx
c0102399:	89 48 08             	mov    %ecx,0x8(%eax)
c010239c:	8b 4a 0c             	mov    0xc(%edx),%ecx
c010239f:	89 48 0c             	mov    %ecx,0xc(%eax)
c01023a2:	8b 4a 10             	mov    0x10(%edx),%ecx
c01023a5:	89 48 10             	mov    %ecx,0x10(%eax)
c01023a8:	8b 4a 14             	mov    0x14(%edx),%ecx
c01023ab:	89 48 14             	mov    %ecx,0x14(%eax)
c01023ae:	8b 4a 18             	mov    0x18(%edx),%ecx
c01023b1:	89 48 18             	mov    %ecx,0x18(%eax)
c01023b4:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c01023b7:	89 48 1c             	mov    %ecx,0x1c(%eax)
c01023ba:	8b 4a 20             	mov    0x20(%edx),%ecx
c01023bd:	89 48 20             	mov    %ecx,0x20(%eax)
c01023c0:	8b 52 24             	mov    0x24(%edx),%edx
c01023c3:	89 50 24             	mov    %edx,0x24(%eax)
c01023c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01023c9:	8b 55 0c             	mov    0xc(%ebp),%edx
c01023cc:	89 50 10             	mov    %edx,0x10(%eax)
c01023cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01023d2:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01023d5:	89 50 20             	mov    %edx,0x20(%eax)
c01023d8:	8b 45 08             	mov    0x8(%ebp),%eax
c01023db:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01023de:	8b 0a                	mov    (%edx),%ecx
c01023e0:	89 08                	mov    %ecx,(%eax)
c01023e2:	8b 4a 04             	mov    0x4(%edx),%ecx
c01023e5:	89 48 04             	mov    %ecx,0x4(%eax)
c01023e8:	8b 4a 08             	mov    0x8(%edx),%ecx
c01023eb:	89 48 08             	mov    %ecx,0x8(%eax)
c01023ee:	8b 4a 0c             	mov    0xc(%edx),%ecx
c01023f1:	89 48 0c             	mov    %ecx,0xc(%eax)
c01023f4:	8b 4a 10             	mov    0x10(%edx),%ecx
c01023f7:	89 48 10             	mov    %ecx,0x10(%eax)
c01023fa:	8b 4a 14             	mov    0x14(%edx),%ecx
c01023fd:	89 48 14             	mov    %ecx,0x14(%eax)
c0102400:	8b 4a 18             	mov    0x18(%edx),%ecx
c0102403:	89 48 18             	mov    %ecx,0x18(%eax)
c0102406:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0102409:	89 48 1c             	mov    %ecx,0x1c(%eax)
c010240c:	8b 4a 20             	mov    0x20(%edx),%ecx
c010240f:	89 48 20             	mov    %ecx,0x20(%eax)
c0102412:	8b 52 24             	mov    0x24(%edx),%edx
c0102415:	89 50 24             	mov    %edx,0x24(%eax)
c0102418:	8b 45 08             	mov    0x8(%ebp),%eax
c010241b:	8d 65 f8             	lea    -0x8(%ebp),%esp
c010241e:	5b                   	pop    %ebx
c010241f:	5e                   	pop    %esi
c0102420:	5d                   	pop    %ebp
c0102421:	c3                   	ret    

c0102422 <create_file>:
c0102422:	55                   	push   %ebp
c0102423:	89 e5                	mov    %esp,%ebp
c0102425:	81 ec 98 00 00 00    	sub    $0x98,%esp
c010242b:	8d 45 b8             	lea    -0x48(%ebp),%eax
c010242e:	50                   	push   %eax
c010242f:	ff 75 0c             	pushl  0xc(%ebp)
c0102432:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0102435:	50                   	push   %eax
c0102436:	e8 59 fd ff ff       	call   c0102194 <strip_path>
c010243b:	83 c4 0c             	add    $0xc,%esp
c010243e:	83 f8 ff             	cmp    $0xffffffff,%eax
c0102441:	75 0a                	jne    c010244d <create_file+0x2b>
c0102443:	b8 00 00 00 00       	mov    $0x0,%eax
c0102448:	e9 de 00 00 00       	jmp    c010252b <create_file+0x109>
c010244d:	e8 db 00 00 00       	call   c010252d <alloc_imap_bit>
c0102452:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102455:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102459:	75 0a                	jne    c0102465 <create_file+0x43>
c010245b:	b8 00 00 00 00       	mov    $0x0,%eax
c0102460:	e9 c6 00 00 00       	jmp    c010252b <create_file+0x109>
c0102465:	e8 d6 10 00 00       	call   c0103540 <get_super_block>
c010246a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010246d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102470:	8b 40 10             	mov    0x10(%eax),%eax
c0102473:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102476:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102479:	83 ec 08             	sub    $0x8,%esp
c010247c:	50                   	push   %eax
c010247d:	ff 75 f4             	pushl  -0xc(%ebp)
c0102480:	e8 a5 01 00 00       	call   c010262a <alloc_smap_bit>
c0102485:	83 c4 10             	add    $0x10,%esp
c0102488:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010248b:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c010248f:	75 0a                	jne    c010249b <create_file+0x79>
c0102491:	b8 00 00 00 00       	mov    $0x0,%eax
c0102496:	e9 90 00 00 00       	jmp    c010252b <create_file+0x109>
c010249b:	83 ec 04             	sub    $0x4,%esp
c010249e:	ff 75 e8             	pushl  -0x18(%ebp)
c01024a1:	ff 75 f4             	pushl  -0xc(%ebp)
c01024a4:	8d 45 84             	lea    -0x7c(%ebp),%eax
c01024a7:	50                   	push   %eax
c01024a8:	e8 1e 03 00 00       	call   c01027cb <new_inode>
c01024ad:	83 c4 10             	add    $0x10,%esp
c01024b0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01024b3:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c01024b7:	75 07                	jne    c01024c0 <create_file+0x9e>
c01024b9:	b8 00 00 00 00       	mov    $0x0,%eax
c01024be:	eb 6b                	jmp    c010252b <create_file+0x109>
c01024c0:	ff 75 f4             	pushl  -0xc(%ebp)
c01024c3:	8d 45 ac             	lea    -0x54(%ebp),%eax
c01024c6:	50                   	push   %eax
c01024c7:	8d 45 b8             	lea    -0x48(%ebp),%eax
c01024ca:	50                   	push   %eax
c01024cb:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01024d1:	50                   	push   %eax
c01024d2:	e8 12 04 00 00       	call   c01028e9 <new_dir_entry>
c01024d7:	83 c4 10             	add    $0x10,%esp
c01024da:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01024dd:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c01024e1:	75 07                	jne    c01024ea <create_file+0xc8>
c01024e3:	b8 00 00 00 00       	mov    $0x0,%eax
c01024e8:	eb 41                	jmp    c010252b <create_file+0x109>
c01024ea:	8b 45 08             	mov    0x8(%ebp),%eax
c01024ed:	8b 55 84             	mov    -0x7c(%ebp),%edx
c01024f0:	89 10                	mov    %edx,(%eax)
c01024f2:	8b 55 88             	mov    -0x78(%ebp),%edx
c01024f5:	89 50 04             	mov    %edx,0x4(%eax)
c01024f8:	8b 55 8c             	mov    -0x74(%ebp),%edx
c01024fb:	89 50 08             	mov    %edx,0x8(%eax)
c01024fe:	8b 55 90             	mov    -0x70(%ebp),%edx
c0102501:	89 50 0c             	mov    %edx,0xc(%eax)
c0102504:	8b 55 94             	mov    -0x6c(%ebp),%edx
c0102507:	89 50 10             	mov    %edx,0x10(%eax)
c010250a:	8b 55 98             	mov    -0x68(%ebp),%edx
c010250d:	89 50 14             	mov    %edx,0x14(%eax)
c0102510:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0102513:	89 50 18             	mov    %edx,0x18(%eax)
c0102516:	8b 55 a0             	mov    -0x60(%ebp),%edx
c0102519:	89 50 1c             	mov    %edx,0x1c(%eax)
c010251c:	8b 55 a4             	mov    -0x5c(%ebp),%edx
c010251f:	89 50 20             	mov    %edx,0x20(%eax)
c0102522:	8b 55 a8             	mov    -0x58(%ebp),%edx
c0102525:	89 50 24             	mov    %edx,0x24(%eax)
c0102528:	8b 45 08             	mov    0x8(%ebp),%eax
c010252b:	c9                   	leave  
c010252c:	c3                   	ret    

c010252d <alloc_imap_bit>:
c010252d:	55                   	push   %ebp
c010252e:	89 e5                	mov    %esp,%ebp
c0102530:	53                   	push   %ebx
c0102531:	83 ec 24             	sub    $0x24,%esp
c0102534:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c010253b:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c0102542:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102547:	83 ec 0c             	sub    $0xc,%esp
c010254a:	6a 07                	push   $0x7
c010254c:	68 00 02 00 00       	push   $0x200
c0102551:	50                   	push   %eax
c0102552:	ff 75 e8             	pushl  -0x18(%ebp)
c0102555:	ff 75 ec             	pushl  -0x14(%ebp)
c0102558:	e8 07 f2 ff ff       	call   c0101764 <rd_wt>
c010255d:	83 c4 20             	add    $0x20,%esp
c0102560:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0102567:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010256e:	e9 a5 00 00 00       	jmp    c0102618 <alloc_imap_bit+0xeb>
c0102573:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c010257a:	e9 8b 00 00 00       	jmp    c010260a <alloc_imap_bit+0xdd>
c010257f:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102585:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102588:	01 d0                	add    %edx,%eax
c010258a:	0f b6 00             	movzbl (%eax),%eax
c010258d:	0f be d0             	movsbl %al,%edx
c0102590:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102593:	89 c1                	mov    %eax,%ecx
c0102595:	d3 fa                	sar    %cl,%edx
c0102597:	89 d0                	mov    %edx,%eax
c0102599:	83 e0 01             	and    $0x1,%eax
c010259c:	85 c0                	test   %eax,%eax
c010259e:	74 06                	je     c01025a6 <alloc_imap_bit+0x79>
c01025a0:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01025a4:	eb 64                	jmp    c010260a <alloc_imap_bit+0xdd>
c01025a6:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01025ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01025af:	01 d0                	add    %edx,%eax
c01025b1:	0f b6 18             	movzbl (%eax),%ebx
c01025b4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01025b7:	ba 01 00 00 00       	mov    $0x1,%edx
c01025bc:	89 c1                	mov    %eax,%ecx
c01025be:	d3 e2                	shl    %cl,%edx
c01025c0:	89 d0                	mov    %edx,%eax
c01025c2:	89 c1                	mov    %eax,%ecx
c01025c4:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01025ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01025cd:	01 d0                	add    %edx,%eax
c01025cf:	09 cb                	or     %ecx,%ebx
c01025d1:	89 da                	mov    %ebx,%edx
c01025d3:	88 10                	mov    %dl,(%eax)
c01025d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01025d8:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c01025df:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01025e2:	01 d0                	add    %edx,%eax
c01025e4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01025e7:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01025ec:	83 ec 0c             	sub    $0xc,%esp
c01025ef:	6a 0a                	push   $0xa
c01025f1:	68 00 02 00 00       	push   $0x200
c01025f6:	50                   	push   %eax
c01025f7:	ff 75 e8             	pushl  -0x18(%ebp)
c01025fa:	ff 75 ec             	pushl  -0x14(%ebp)
c01025fd:	e8 62 f1 ff ff       	call   c0101764 <rd_wt>
c0102602:	83 c4 20             	add    $0x20,%esp
c0102605:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102608:	eb 1b                	jmp    c0102625 <alloc_imap_bit+0xf8>
c010260a:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
c010260e:	0f 8e 6b ff ff ff    	jle    c010257f <alloc_imap_bit+0x52>
c0102614:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0102618:	81 7d f4 ff 01 00 00 	cmpl   $0x1ff,-0xc(%ebp)
c010261f:	0f 8e 4e ff ff ff    	jle    c0102573 <alloc_imap_bit+0x46>
c0102625:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0102628:	c9                   	leave  
c0102629:	c3                   	ret    

c010262a <alloc_smap_bit>:
c010262a:	55                   	push   %ebp
c010262b:	89 e5                	mov    %esp,%ebp
c010262d:	53                   	push   %ebx
c010262e:	83 ec 34             	sub    $0x34,%esp
c0102631:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102635:	75 1c                	jne    c0102653 <alloc_smap_bit+0x29>
c0102637:	68 fd 02 00 00       	push   $0x2fd
c010263c:	68 c4 a6 10 c0       	push   $0xc010a6c4
c0102641:	68 c4 a6 10 c0       	push   $0xc010a6c4
c0102646:	68 d4 a7 10 c0       	push   $0xc010a7d4
c010264b:	e8 6d 61 00 00       	call   c01087bd <assertion_failure>
c0102650:	83 c4 10             	add    $0x10,%esp
c0102653:	e8 e8 0e 00 00       	call   c0103540 <get_super_block>
c0102658:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010265b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010265e:	8b 40 08             	mov    0x8(%eax),%eax
c0102661:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0102664:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102667:	8b 40 04             	mov    0x4(%eax),%eax
c010266a:	83 c0 02             	add    $0x2,%eax
c010266d:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0102670:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0102677:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c010267e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102685:	e9 20 01 00 00       	jmp    c01027aa <alloc_smap_bit+0x180>
c010268a:	8b 55 dc             	mov    -0x24(%ebp),%edx
c010268d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102690:	01 d0                	add    %edx,%eax
c0102692:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0102695:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010269a:	83 ec 0c             	sub    $0xc,%esp
c010269d:	6a 07                	push   $0x7
c010269f:	68 00 02 00 00       	push   $0x200
c01026a4:	50                   	push   %eax
c01026a5:	ff 75 d8             	pushl  -0x28(%ebp)
c01026a8:	ff 75 d4             	pushl  -0x2c(%ebp)
c01026ab:	e8 b4 f0 ff ff       	call   c0101764 <rd_wt>
c01026b0:	83 c4 20             	add    $0x20,%esp
c01026b3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01026ba:	e9 b0 00 00 00       	jmp    c010276f <alloc_smap_bit+0x145>
c01026bf:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01026c6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01026ca:	0f 85 8c 00 00 00    	jne    c010275c <alloc_smap_bit+0x132>
c01026d0:	eb 45                	jmp    c0102717 <alloc_smap_bit+0xed>
c01026d2:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01026d8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01026db:	01 d0                	add    %edx,%eax
c01026dd:	0f b6 00             	movzbl (%eax),%eax
c01026e0:	0f be d0             	movsbl %al,%edx
c01026e3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01026e6:	89 c1                	mov    %eax,%ecx
c01026e8:	d3 fa                	sar    %cl,%edx
c01026ea:	89 d0                	mov    %edx,%eax
c01026ec:	83 e0 01             	and    $0x1,%eax
c01026ef:	85 c0                	test   %eax,%eax
c01026f1:	74 06                	je     c01026f9 <alloc_smap_bit+0xcf>
c01026f3:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c01026f7:	eb 1e                	jmp    c0102717 <alloc_smap_bit+0xed>
c01026f9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01026fc:	c1 e0 09             	shl    $0x9,%eax
c01026ff:	89 c2                	mov    %eax,%edx
c0102701:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102704:	01 d0                	add    %edx,%eax
c0102706:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c010270d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102710:	01 d0                	add    %edx,%eax
c0102712:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102715:	eb 06                	jmp    c010271d <alloc_smap_bit+0xf3>
c0102717:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c010271b:	7e b5                	jle    c01026d2 <alloc_smap_bit+0xa8>
c010271d:	eb 3d                	jmp    c010275c <alloc_smap_bit+0x132>
c010271f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102723:	74 45                	je     c010276a <alloc_smap_bit+0x140>
c0102725:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c010272b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010272e:	01 d0                	add    %edx,%eax
c0102730:	0f b6 18             	movzbl (%eax),%ebx
c0102733:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102736:	ba 01 00 00 00       	mov    $0x1,%edx
c010273b:	89 c1                	mov    %eax,%ecx
c010273d:	d3 e2                	shl    %cl,%edx
c010273f:	89 d0                	mov    %edx,%eax
c0102741:	89 c1                	mov    %eax,%ecx
c0102743:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102749:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010274c:	01 d0                	add    %edx,%eax
c010274e:	09 cb                	or     %ecx,%ebx
c0102750:	89 da                	mov    %ebx,%edx
c0102752:	88 10                	mov    %dl,(%eax)
c0102754:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0102758:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c010275c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102760:	74 09                	je     c010276b <alloc_smap_bit+0x141>
c0102762:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0102766:	7e b7                	jle    c010271f <alloc_smap_bit+0xf5>
c0102768:	eb 01                	jmp    c010276b <alloc_smap_bit+0x141>
c010276a:	90                   	nop
c010276b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c010276f:	81 7d ec ff 01 00 00 	cmpl   $0x1ff,-0x14(%ebp)
c0102776:	0f 8e 43 ff ff ff    	jle    c01026bf <alloc_smap_bit+0x95>
c010277c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102780:	74 1e                	je     c01027a0 <alloc_smap_bit+0x176>
c0102782:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102787:	83 ec 0c             	sub    $0xc,%esp
c010278a:	6a 0a                	push   $0xa
c010278c:	68 00 02 00 00       	push   $0x200
c0102791:	50                   	push   %eax
c0102792:	ff 75 d8             	pushl  -0x28(%ebp)
c0102795:	ff 75 d4             	pushl  -0x2c(%ebp)
c0102798:	e8 c7 ef ff ff       	call   c0101764 <rd_wt>
c010279d:	83 c4 20             	add    $0x20,%esp
c01027a0:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01027a4:	74 12                	je     c01027b8 <alloc_smap_bit+0x18e>
c01027a6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01027aa:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01027ad:	3b 45 e0             	cmp    -0x20(%ebp),%eax
c01027b0:	0f 8c d4 fe ff ff    	jl     c010268a <alloc_smap_bit+0x60>
c01027b6:	eb 01                	jmp    c01027b9 <alloc_smap_bit+0x18f>
c01027b8:	90                   	nop
c01027b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01027bc:	8d 50 ff             	lea    -0x1(%eax),%edx
c01027bf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01027c2:	8b 00                	mov    (%eax),%eax
c01027c4:	01 d0                	add    %edx,%eax
c01027c6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01027c9:	c9                   	leave  
c01027ca:	c3                   	ret    

c01027cb <new_inode>:
c01027cb:	55                   	push   %ebp
c01027cc:	89 e5                	mov    %esp,%ebp
c01027ce:	83 ec 38             	sub    $0x38,%esp
c01027d1:	83 ec 08             	sub    $0x8,%esp
c01027d4:	ff 75 0c             	pushl  0xc(%ebp)
c01027d7:	8d 45 c8             	lea    -0x38(%ebp),%eax
c01027da:	50                   	push   %eax
c01027db:	e8 80 fa ff ff       	call   c0102260 <get_inode>
c01027e0:	83 c4 10             	add    $0x10,%esp
c01027e3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01027e6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c01027ea:	75 0a                	jne    c01027f6 <new_inode+0x2b>
c01027ec:	b8 00 00 00 00       	mov    $0x0,%eax
c01027f1:	e9 f1 00 00 00       	jmp    c01028e7 <new_inode+0x11c>
c01027f6:	8b 45 10             	mov    0x10(%ebp),%eax
c01027f9:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01027fc:	c7 45 d4 00 08 00 00 	movl   $0x800,-0x2c(%ebp)
c0102803:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c010280a:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
c0102811:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102814:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0102817:	83 ec 0c             	sub    $0xc,%esp
c010281a:	8d 45 c8             	lea    -0x38(%ebp),%eax
c010281d:	50                   	push   %eax
c010281e:	e8 39 0b 00 00       	call   c010335c <sync_inode>
c0102823:	83 c4 10             	add    $0x10,%esp
c0102826:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c010282d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0102834:	eb 1d                	jmp    c0102853 <new_inode+0x88>
c0102836:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102839:	89 d0                	mov    %edx,%eax
c010283b:	c1 e0 02             	shl    $0x2,%eax
c010283e:	01 d0                	add    %edx,%eax
c0102840:	c1 e0 03             	shl    $0x3,%eax
c0102843:	05 b0 17 11 c0       	add    $0xc01117b0,%eax
c0102848:	8b 00                	mov    (%eax),%eax
c010284a:	39 45 0c             	cmp    %eax,0xc(%ebp)
c010284d:	74 0c                	je     c010285b <new_inode+0x90>
c010284f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0102853:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c0102857:	7e dd                	jle    c0102836 <new_inode+0x6b>
c0102859:	eb 01                	jmp    c010285c <new_inode+0x91>
c010285b:	90                   	nop
c010285c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010285f:	89 d0                	mov    %edx,%eax
c0102861:	c1 e0 02             	shl    $0x2,%eax
c0102864:	01 d0                	add    %edx,%eax
c0102866:	c1 e0 03             	shl    $0x3,%eax
c0102869:	05 a0 17 11 c0       	add    $0xc01117a0,%eax
c010286e:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0102871:	89 10                	mov    %edx,(%eax)
c0102873:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102876:	89 50 04             	mov    %edx,0x4(%eax)
c0102879:	8b 55 d0             	mov    -0x30(%ebp),%edx
c010287c:	89 50 08             	mov    %edx,0x8(%eax)
c010287f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0102882:	89 50 0c             	mov    %edx,0xc(%eax)
c0102885:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0102888:	89 50 10             	mov    %edx,0x10(%eax)
c010288b:	8b 55 dc             	mov    -0x24(%ebp),%edx
c010288e:	89 50 14             	mov    %edx,0x14(%eax)
c0102891:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0102894:	89 50 18             	mov    %edx,0x18(%eax)
c0102897:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c010289a:	89 50 1c             	mov    %edx,0x1c(%eax)
c010289d:	8b 55 e8             	mov    -0x18(%ebp),%edx
c01028a0:	89 50 20             	mov    %edx,0x20(%eax)
c01028a3:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01028a6:	89 50 24             	mov    %edx,0x24(%eax)
c01028a9:	8b 45 08             	mov    0x8(%ebp),%eax
c01028ac:	8b 55 c8             	mov    -0x38(%ebp),%edx
c01028af:	89 10                	mov    %edx,(%eax)
c01028b1:	8b 55 cc             	mov    -0x34(%ebp),%edx
c01028b4:	89 50 04             	mov    %edx,0x4(%eax)
c01028b7:	8b 55 d0             	mov    -0x30(%ebp),%edx
c01028ba:	89 50 08             	mov    %edx,0x8(%eax)
c01028bd:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c01028c0:	89 50 0c             	mov    %edx,0xc(%eax)
c01028c3:	8b 55 d8             	mov    -0x28(%ebp),%edx
c01028c6:	89 50 10             	mov    %edx,0x10(%eax)
c01028c9:	8b 55 dc             	mov    -0x24(%ebp),%edx
c01028cc:	89 50 14             	mov    %edx,0x14(%eax)
c01028cf:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01028d2:	89 50 18             	mov    %edx,0x18(%eax)
c01028d5:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01028d8:	89 50 1c             	mov    %edx,0x1c(%eax)
c01028db:	8b 55 e8             	mov    -0x18(%ebp),%edx
c01028de:	89 50 20             	mov    %edx,0x20(%eax)
c01028e1:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01028e4:	89 50 24             	mov    %edx,0x24(%eax)
c01028e7:	c9                   	leave  
c01028e8:	c3                   	ret    

c01028e9 <new_dir_entry>:
c01028e9:	55                   	push   %ebp
c01028ea:	89 e5                	mov    %esp,%ebp
c01028ec:	83 ec 48             	sub    $0x48,%esp
c01028ef:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
c01028f6:	8b 45 0c             	mov    0xc(%ebp),%eax
c01028f9:	8b 40 04             	mov    0x4(%eax),%eax
c01028fc:	99                   	cltd   
c01028fd:	f7 7d dc             	idivl  -0x24(%ebp)
c0102900:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0102903:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102906:	8b 40 0c             	mov    0xc(%eax),%eax
c0102909:	99                   	cltd   
c010290a:	f7 7d dc             	idivl  -0x24(%ebp)
c010290d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0102910:	e8 2b 0c 00 00       	call   c0103540 <get_super_block>
c0102915:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0102918:	8b 45 d0             	mov    -0x30(%ebp),%eax
c010291b:	8b 00                	mov    (%eax),%eax
c010291d:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0102920:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102923:	8b 40 0c             	mov    0xc(%eax),%eax
c0102926:	05 00 02 00 00       	add    $0x200,%eax
c010292b:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0102931:	85 c0                	test   %eax,%eax
c0102933:	0f 48 c2             	cmovs  %edx,%eax
c0102936:	c1 f8 09             	sar    $0x9,%eax
c0102939:	89 45 c8             	mov    %eax,-0x38(%ebp)
c010293c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0102943:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c010294a:	c7 45 c4 20 00 00 00 	movl   $0x20,-0x3c(%ebp)
c0102951:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0102958:	eb 7f                	jmp    c01029d9 <new_dir_entry+0xf0>
c010295a:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010295f:	89 c1                	mov    %eax,%ecx
c0102961:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102964:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102967:	01 d0                	add    %edx,%eax
c0102969:	83 ec 0c             	sub    $0xc,%esp
c010296c:	6a 07                	push   $0x7
c010296e:	68 00 02 00 00       	push   $0x200
c0102973:	51                   	push   %ecx
c0102974:	ff 75 c4             	pushl  -0x3c(%ebp)
c0102977:	50                   	push   %eax
c0102978:	e8 e7 ed ff ff       	call   c0101764 <rd_wt>
c010297d:	83 c4 20             	add    $0x20,%esp
c0102980:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0102985:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0102988:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c010298f:	eb 25                	jmp    c01029b6 <new_dir_entry+0xcd>
c0102991:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0102995:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102998:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c010299b:	7f 29                	jg     c01029c6 <new_dir_entry+0xdd>
c010299d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01029a0:	8b 00                	mov    (%eax),%eax
c01029a2:	85 c0                	test   %eax,%eax
c01029a4:	75 08                	jne    c01029ae <new_dir_entry+0xc5>
c01029a6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01029a9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01029ac:	eb 19                	jmp    c01029c7 <new_dir_entry+0xde>
c01029ae:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c01029b2:	83 45 f0 10          	addl   $0x10,-0x10(%ebp)
c01029b6:	b8 00 02 00 00       	mov    $0x200,%eax
c01029bb:	99                   	cltd   
c01029bc:	f7 7d dc             	idivl  -0x24(%ebp)
c01029bf:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c01029c2:	7c cd                	jl     c0102991 <new_dir_entry+0xa8>
c01029c4:	eb 01                	jmp    c01029c7 <new_dir_entry+0xde>
c01029c6:	90                   	nop
c01029c7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01029ca:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c01029cd:	7f 16                	jg     c01029e5 <new_dir_entry+0xfc>
c01029cf:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01029d3:	75 10                	jne    c01029e5 <new_dir_entry+0xfc>
c01029d5:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c01029d9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01029dc:	3b 45 c8             	cmp    -0x38(%ebp),%eax
c01029df:	0f 8c 75 ff ff ff    	jl     c010295a <new_dir_entry+0x71>
c01029e5:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01029e8:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
c01029eb:	75 0a                	jne    c01029f7 <new_dir_entry+0x10e>
c01029ed:	b8 00 00 00 00       	mov    $0x0,%eax
c01029f2:	e9 fc 00 00 00       	jmp    c0102af3 <new_dir_entry+0x20a>
c01029f7:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c01029fe:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102a02:	75 1e                	jne    c0102a22 <new_dir_entry+0x139>
c0102a04:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102a07:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102a0a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102a0d:	8b 50 04             	mov    0x4(%eax),%edx
c0102a10:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0102a13:	01 c2                	add    %eax,%edx
c0102a15:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102a18:	89 50 04             	mov    %edx,0x4(%eax)
c0102a1b:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0102a22:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102a25:	8b 55 14             	mov    0x14(%ebp),%edx
c0102a28:	89 10                	mov    %edx,(%eax)
c0102a2a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102a2d:	83 c0 04             	add    $0x4,%eax
c0102a30:	83 ec 08             	sub    $0x8,%esp
c0102a33:	ff 75 10             	pushl  0x10(%ebp)
c0102a36:	50                   	push   %eax
c0102a37:	e8 5a 8b 00 00       	call   c010b596 <Strcpy>
c0102a3c:	83 c4 10             	add    $0x10,%esp
c0102a3f:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a42:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102a45:	8b 0a                	mov    (%edx),%ecx
c0102a47:	89 08                	mov    %ecx,(%eax)
c0102a49:	8b 4a 04             	mov    0x4(%edx),%ecx
c0102a4c:	89 48 04             	mov    %ecx,0x4(%eax)
c0102a4f:	8b 4a 08             	mov    0x8(%edx),%ecx
c0102a52:	89 48 08             	mov    %ecx,0x8(%eax)
c0102a55:	8b 52 0c             	mov    0xc(%edx),%edx
c0102a58:	89 50 0c             	mov    %edx,0xc(%eax)
c0102a5b:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102a60:	89 c1                	mov    %eax,%ecx
c0102a62:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102a65:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102a68:	01 d0                	add    %edx,%eax
c0102a6a:	83 ec 0c             	sub    $0xc,%esp
c0102a6d:	6a 0a                	push   $0xa
c0102a6f:	68 00 02 00 00       	push   $0x200
c0102a74:	51                   	push   %ecx
c0102a75:	ff 75 c4             	pushl  -0x3c(%ebp)
c0102a78:	50                   	push   %eax
c0102a79:	e8 e6 ec ff ff       	call   c0101764 <rd_wt>
c0102a7e:	83 c4 20             	add    $0x20,%esp
c0102a81:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0102a85:	74 69                	je     c0102af0 <new_dir_entry+0x207>
c0102a87:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102a8a:	8b 10                	mov    (%eax),%edx
c0102a8c:	89 15 c0 21 11 c0    	mov    %edx,0xc01121c0
c0102a92:	8b 50 04             	mov    0x4(%eax),%edx
c0102a95:	89 15 c4 21 11 c0    	mov    %edx,0xc01121c4
c0102a9b:	8b 50 08             	mov    0x8(%eax),%edx
c0102a9e:	89 15 c8 21 11 c0    	mov    %edx,0xc01121c8
c0102aa4:	8b 50 0c             	mov    0xc(%eax),%edx
c0102aa7:	89 15 cc 21 11 c0    	mov    %edx,0xc01121cc
c0102aad:	8b 50 10             	mov    0x10(%eax),%edx
c0102ab0:	89 15 d0 21 11 c0    	mov    %edx,0xc01121d0
c0102ab6:	8b 50 14             	mov    0x14(%eax),%edx
c0102ab9:	89 15 d4 21 11 c0    	mov    %edx,0xc01121d4
c0102abf:	8b 50 18             	mov    0x18(%eax),%edx
c0102ac2:	89 15 d8 21 11 c0    	mov    %edx,0xc01121d8
c0102ac8:	8b 50 1c             	mov    0x1c(%eax),%edx
c0102acb:	89 15 dc 21 11 c0    	mov    %edx,0xc01121dc
c0102ad1:	8b 50 20             	mov    0x20(%eax),%edx
c0102ad4:	89 15 e0 21 11 c0    	mov    %edx,0xc01121e0
c0102ada:	8b 40 24             	mov    0x24(%eax),%eax
c0102add:	a3 e4 21 11 c0       	mov    %eax,0xc01121e4
c0102ae2:	83 ec 0c             	sub    $0xc,%esp
c0102ae5:	ff 75 0c             	pushl  0xc(%ebp)
c0102ae8:	e8 6f 08 00 00       	call   c010335c <sync_inode>
c0102aed:	83 c4 10             	add    $0x10,%esp
c0102af0:	8b 45 08             	mov    0x8(%ebp),%eax
c0102af3:	c9                   	leave  
c0102af4:	c3                   	ret    

c0102af5 <do_unlink>:
c0102af5:	55                   	push   %ebp
c0102af6:	89 e5                	mov    %esp,%ebp
c0102af8:	53                   	push   %ebx
c0102af9:	81 ec a4 00 00 00    	sub    $0xa4,%esp
c0102aff:	83 ec 08             	sub    $0x8,%esp
c0102b02:	ff 75 08             	pushl  0x8(%ebp)
c0102b05:	68 e9 a7 10 c0       	push   $0xc010a7e9
c0102b0a:	e8 85 6c 00 00       	call   c0109794 <strcmp>
c0102b0f:	83 c4 10             	add    $0x10,%esp
c0102b12:	85 c0                	test   %eax,%eax
c0102b14:	75 10                	jne    c0102b26 <do_unlink+0x31>
c0102b16:	83 ec 0c             	sub    $0xc,%esp
c0102b19:	68 eb a7 10 c0       	push   $0xc010a7eb
c0102b1e:	e8 7c 5c 00 00       	call   c010879f <panic>
c0102b23:	83 c4 10             	add    $0x10,%esp
c0102b26:	83 ec 0c             	sub    $0xc,%esp
c0102b29:	ff 75 08             	pushl  0x8(%ebp)
c0102b2c:	e8 31 f5 ff ff       	call   c0102062 <search_file>
c0102b31:	83 c4 10             	add    $0x10,%esp
c0102b34:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0102b37:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0102b3b:	75 10                	jne    c0102b4d <do_unlink+0x58>
c0102b3d:	83 ec 0c             	sub    $0xc,%esp
c0102b40:	68 07 a8 10 c0       	push   $0xc010a807
c0102b45:	e8 55 5c 00 00       	call   c010879f <panic>
c0102b4a:	83 c4 10             	add    $0x10,%esp
c0102b4d:	83 ec 08             	sub    $0x8,%esp
c0102b50:	ff 75 d0             	pushl  -0x30(%ebp)
c0102b53:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0102b59:	50                   	push   %eax
c0102b5a:	e8 01 f7 ff ff       	call   c0102260 <get_inode>
c0102b5f:	83 c4 10             	add    $0x10,%esp
c0102b62:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0102b65:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0102b69:	75 10                	jne    c0102b7b <do_unlink+0x86>
c0102b6b:	83 ec 0c             	sub    $0xc,%esp
c0102b6e:	68 07 a8 10 c0       	push   $0xc010a807
c0102b73:	e8 27 5c 00 00       	call   c010879f <panic>
c0102b78:	83 c4 10             	add    $0x10,%esp
c0102b7b:	8b 45 88             	mov    -0x78(%ebp),%eax
c0102b7e:	85 c0                	test   %eax,%eax
c0102b80:	7e 10                	jle    c0102b92 <do_unlink+0x9d>
c0102b82:	83 ec 0c             	sub    $0xc,%esp
c0102b85:	68 20 a8 10 c0       	push   $0xc010a820
c0102b8a:	e8 10 5c 00 00       	call   c010879f <panic>
c0102b8f:	83 c4 10             	add    $0x10,%esp
c0102b92:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0102b98:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0102b9b:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0102b9e:	8d 50 07             	lea    0x7(%eax),%edx
c0102ba1:	85 c0                	test   %eax,%eax
c0102ba3:	0f 48 c2             	cmovs  %edx,%eax
c0102ba6:	c1 f8 03             	sar    $0x3,%eax
c0102ba9:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0102bac:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0102baf:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0102bb5:	85 c0                	test   %eax,%eax
c0102bb7:	0f 48 c2             	cmovs  %edx,%eax
c0102bba:	c1 f8 09             	sar    $0x9,%eax
c0102bbd:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0102bc0:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0102bc3:	99                   	cltd   
c0102bc4:	c1 ea 1d             	shr    $0x1d,%edx
c0102bc7:	01 d0                	add    %edx,%eax
c0102bc9:	83 e0 07             	and    $0x7,%eax
c0102bcc:	29 d0                	sub    %edx,%eax
c0102bce:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0102bd1:	c7 45 b8 20 00 00 00 	movl   $0x20,-0x48(%ebp)
c0102bd8:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102bdd:	89 c2                	mov    %eax,%edx
c0102bdf:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0102be2:	83 c0 02             	add    $0x2,%eax
c0102be5:	83 ec 0c             	sub    $0xc,%esp
c0102be8:	6a 07                	push   $0x7
c0102bea:	68 00 02 00 00       	push   $0x200
c0102bef:	52                   	push   %edx
c0102bf0:	ff 75 b8             	pushl  -0x48(%ebp)
c0102bf3:	50                   	push   %eax
c0102bf4:	e8 6b eb ff ff       	call   c0101764 <rd_wt>
c0102bf9:	83 c4 20             	add    $0x20,%esp
c0102bfc:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102c02:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0102c05:	01 d0                	add    %edx,%eax
c0102c07:	0f b6 10             	movzbl (%eax),%edx
c0102c0a:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0102c0d:	bb 01 00 00 00       	mov    $0x1,%ebx
c0102c12:	89 c1                	mov    %eax,%ecx
c0102c14:	d3 e3                	shl    %cl,%ebx
c0102c16:	89 d8                	mov    %ebx,%eax
c0102c18:	f7 d0                	not    %eax
c0102c1a:	89 c3                	mov    %eax,%ebx
c0102c1c:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0102c22:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0102c25:	01 c8                	add    %ecx,%eax
c0102c27:	21 da                	and    %ebx,%edx
c0102c29:	88 10                	mov    %dl,(%eax)
c0102c2b:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102c30:	89 c2                	mov    %eax,%edx
c0102c32:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0102c35:	83 c0 02             	add    $0x2,%eax
c0102c38:	83 ec 0c             	sub    $0xc,%esp
c0102c3b:	6a 0a                	push   $0xa
c0102c3d:	68 00 02 00 00       	push   $0x200
c0102c42:	52                   	push   %edx
c0102c43:	ff 75 b8             	pushl  -0x48(%ebp)
c0102c46:	50                   	push   %eax
c0102c47:	e8 18 eb ff ff       	call   c0101764 <rd_wt>
c0102c4c:	83 c4 20             	add    $0x20,%esp
c0102c4f:	e8 ec 08 00 00       	call   c0103540 <get_super_block>
c0102c54:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0102c57:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0102c5d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0102c60:	8b 00                	mov    (%eax),%eax
c0102c62:	29 c2                	sub    %eax,%edx
c0102c64:	89 d0                	mov    %edx,%eax
c0102c66:	83 c0 01             	add    $0x1,%eax
c0102c69:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0102c6c:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0102c6f:	8d 50 07             	lea    0x7(%eax),%edx
c0102c72:	85 c0                	test   %eax,%eax
c0102c74:	0f 48 c2             	cmovs  %edx,%eax
c0102c77:	c1 f8 03             	sar    $0x3,%eax
c0102c7a:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0102c7d:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0102c80:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0102c86:	85 c0                	test   %eax,%eax
c0102c88:	0f 48 c2             	cmovs  %edx,%eax
c0102c8b:	c1 f8 09             	sar    $0x9,%eax
c0102c8e:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0102c91:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0102c94:	99                   	cltd   
c0102c95:	c1 ea 1d             	shr    $0x1d,%edx
c0102c98:	01 d0                	add    %edx,%eax
c0102c9a:	83 e0 07             	and    $0x7,%eax
c0102c9d:	29 d0                	sub    %edx,%eax
c0102c9f:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0102ca2:	b8 08 00 00 00       	mov    $0x8,%eax
c0102ca7:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c0102caa:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0102cad:	29 c2                	sub    %eax,%edx
c0102caf:	89 d0                	mov    %edx,%eax
c0102cb1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102cb4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102cb7:	8d 50 07             	lea    0x7(%eax),%edx
c0102cba:	85 c0                	test   %eax,%eax
c0102cbc:	0f 48 c2             	cmovs  %edx,%eax
c0102cbf:	c1 f8 03             	sar    $0x3,%eax
c0102cc2:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0102cc5:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102cca:	89 c1                	mov    %eax,%ecx
c0102ccc:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0102ccf:	8b 40 04             	mov    0x4(%eax),%eax
c0102cd2:	8d 50 02             	lea    0x2(%eax),%edx
c0102cd5:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0102cd8:	01 d0                	add    %edx,%eax
c0102cda:	83 ec 0c             	sub    $0xc,%esp
c0102cdd:	6a 07                	push   $0x7
c0102cdf:	68 00 02 00 00       	push   $0x200
c0102ce4:	51                   	push   %ecx
c0102ce5:	ff 75 b8             	pushl  -0x48(%ebp)
c0102ce8:	50                   	push   %eax
c0102ce9:	e8 76 ea ff ff       	call   c0101764 <rd_wt>
c0102cee:	83 c4 20             	add    $0x20,%esp
c0102cf1:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102cf7:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0102cfa:	01 d0                	add    %edx,%eax
c0102cfc:	0f b6 10             	movzbl (%eax),%edx
c0102cff:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0102d02:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0102d07:	89 c1                	mov    %eax,%ecx
c0102d09:	d3 e3                	shl    %cl,%ebx
c0102d0b:	89 d8                	mov    %ebx,%eax
c0102d0d:	f7 d0                	not    %eax
c0102d0f:	89 c3                	mov    %eax,%ebx
c0102d11:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0102d17:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0102d1a:	01 c8                	add    %ecx,%eax
c0102d1c:	21 da                	and    %ebx,%edx
c0102d1e:	88 10                	mov    %dl,(%eax)
c0102d20:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0102d27:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0102d2a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102d2d:	eb 6b                	jmp    c0102d9a <do_unlink+0x2a5>
c0102d2f:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0102d36:	75 4c                	jne    c0102d84 <do_unlink+0x28f>
c0102d38:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102d3f:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102d44:	83 ec 0c             	sub    $0xc,%esp
c0102d47:	6a 0a                	push   $0xa
c0102d49:	68 00 02 00 00       	push   $0x200
c0102d4e:	50                   	push   %eax
c0102d4f:	ff 75 b8             	pushl  -0x48(%ebp)
c0102d52:	ff 75 ec             	pushl  -0x14(%ebp)
c0102d55:	e8 0a ea ff ff       	call   c0101764 <rd_wt>
c0102d5a:	83 c4 20             	add    $0x20,%esp
c0102d5d:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102d62:	89 c1                	mov    %eax,%ecx
c0102d64:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102d67:	8d 50 01             	lea    0x1(%eax),%edx
c0102d6a:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0102d6d:	83 ec 0c             	sub    $0xc,%esp
c0102d70:	6a 07                	push   $0x7
c0102d72:	68 00 02 00 00       	push   $0x200
c0102d77:	51                   	push   %ecx
c0102d78:	ff 75 b8             	pushl  -0x48(%ebp)
c0102d7b:	50                   	push   %eax
c0102d7c:	e8 e3 e9 ff ff       	call   c0101764 <rd_wt>
c0102d81:	83 c4 20             	add    $0x20,%esp
c0102d84:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102d8a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102d8d:	01 d0                	add    %edx,%eax
c0102d8f:	c6 00 00             	movb   $0x0,(%eax)
c0102d92:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0102d96:	83 6d f4 08          	subl   $0x8,-0xc(%ebp)
c0102d9a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102d9d:	3b 45 a0             	cmp    -0x60(%ebp),%eax
c0102da0:	7c 8d                	jl     c0102d2f <do_unlink+0x23a>
c0102da2:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0102da9:	75 4c                	jne    c0102df7 <do_unlink+0x302>
c0102dab:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102db2:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102db7:	83 ec 0c             	sub    $0xc,%esp
c0102dba:	6a 0a                	push   $0xa
c0102dbc:	68 00 02 00 00       	push   $0x200
c0102dc1:	50                   	push   %eax
c0102dc2:	ff 75 b8             	pushl  -0x48(%ebp)
c0102dc5:	ff 75 ec             	pushl  -0x14(%ebp)
c0102dc8:	e8 97 e9 ff ff       	call   c0101764 <rd_wt>
c0102dcd:	83 c4 20             	add    $0x20,%esp
c0102dd0:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102dd5:	89 c1                	mov    %eax,%ecx
c0102dd7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102dda:	8d 50 01             	lea    0x1(%eax),%edx
c0102ddd:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0102de0:	83 ec 0c             	sub    $0xc,%esp
c0102de3:	6a 07                	push   $0x7
c0102de5:	68 00 02 00 00       	push   $0x200
c0102dea:	51                   	push   %ecx
c0102deb:	ff 75 b8             	pushl  -0x48(%ebp)
c0102dee:	50                   	push   %eax
c0102def:	e8 70 e9 ff ff       	call   c0101764 <rd_wt>
c0102df4:	83 c4 20             	add    $0x20,%esp
c0102df7:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102dfd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102e00:	01 d0                	add    %edx,%eax
c0102e02:	0f b6 10             	movzbl (%eax),%edx
c0102e05:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102e08:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0102e0d:	89 c1                	mov    %eax,%ecx
c0102e0f:	d3 e3                	shl    %cl,%ebx
c0102e11:	89 d8                	mov    %ebx,%eax
c0102e13:	89 c3                	mov    %eax,%ebx
c0102e15:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0102e1b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102e1e:	01 c8                	add    %ecx,%eax
c0102e20:	21 da                	and    %ebx,%edx
c0102e22:	88 10                	mov    %dl,(%eax)
c0102e24:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102e29:	83 ec 0c             	sub    $0xc,%esp
c0102e2c:	6a 0a                	push   $0xa
c0102e2e:	68 00 02 00 00       	push   $0x200
c0102e33:	50                   	push   %eax
c0102e34:	ff 75 b8             	pushl  -0x48(%ebp)
c0102e37:	ff 75 ec             	pushl  -0x14(%ebp)
c0102e3a:	e8 25 e9 ff ff       	call   c0101764 <rd_wt>
c0102e3f:	83 c4 20             	add    $0x20,%esp
c0102e42:	c7 85 6c ff ff ff 00 	movl   $0x0,-0x94(%ebp)
c0102e49:	00 00 00 
c0102e4c:	c7 85 68 ff ff ff 00 	movl   $0x0,-0x98(%ebp)
c0102e53:	00 00 00 
c0102e56:	c7 85 70 ff ff ff 00 	movl   $0x0,-0x90(%ebp)
c0102e5d:	00 00 00 
c0102e60:	83 ec 0c             	sub    $0xc,%esp
c0102e63:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0102e69:	50                   	push   %eax
c0102e6a:	e8 ed 04 00 00       	call   c010335c <sync_inode>
c0102e6f:	83 c4 10             	add    $0x10,%esp
c0102e72:	83 ec 0c             	sub    $0xc,%esp
c0102e75:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0102e7b:	50                   	push   %eax
c0102e7c:	e8 2f 06 00 00       	call   c01034b0 <put_inode>
c0102e81:	83 c4 10             	add    $0x10,%esp
c0102e84:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0102e87:	8b 00                	mov    (%eax),%eax
c0102e89:	89 45 9c             	mov    %eax,-0x64(%ebp)
c0102e8c:	c7 45 98 c0 21 11 c0 	movl   $0xc01121c0,-0x68(%ebp)
c0102e93:	8b 45 98             	mov    -0x68(%ebp),%eax
c0102e96:	8b 40 04             	mov    0x4(%eax),%eax
c0102e99:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0102e9c:	8b 45 98             	mov    -0x68(%ebp),%eax
c0102e9f:	8b 40 0c             	mov    0xc(%eax),%eax
c0102ea2:	89 45 90             	mov    %eax,-0x70(%ebp)
c0102ea5:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0102ea8:	c1 e8 04             	shr    $0x4,%eax
c0102eab:	89 45 8c             	mov    %eax,-0x74(%ebp)
c0102eae:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0102eb5:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0102ebc:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0102ec3:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0102eca:	e9 a5 00 00 00       	jmp    c0102f74 <do_unlink+0x47f>
c0102ecf:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102ed4:	89 c1                	mov    %eax,%ecx
c0102ed6:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0102ed9:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0102edc:	01 d0                	add    %edx,%eax
c0102ede:	83 ec 0c             	sub    $0xc,%esp
c0102ee1:	6a 07                	push   $0x7
c0102ee3:	68 00 02 00 00       	push   $0x200
c0102ee8:	51                   	push   %ecx
c0102ee9:	ff 75 b8             	pushl  -0x48(%ebp)
c0102eec:	50                   	push   %eax
c0102eed:	e8 72 e8 ff ff       	call   c0101764 <rd_wt>
c0102ef2:	83 c4 20             	add    $0x20,%esp
c0102ef5:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0102efa:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0102efd:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0102f04:	eb 51                	jmp    c0102f57 <do_unlink+0x462>
c0102f06:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0102f0a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102f0d:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0102f10:	7f 4f                	jg     c0102f61 <do_unlink+0x46c>
c0102f12:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0102f15:	83 c0 10             	add    $0x10,%eax
c0102f18:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0102f1b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0102f1e:	83 c0 04             	add    $0x4,%eax
c0102f21:	83 ec 08             	sub    $0x8,%esp
c0102f24:	ff 75 08             	pushl  0x8(%ebp)
c0102f27:	50                   	push   %eax
c0102f28:	e8 67 68 00 00       	call   c0109794 <strcmp>
c0102f2d:	83 c4 10             	add    $0x10,%esp
c0102f30:	85 c0                	test   %eax,%eax
c0102f32:	75 1b                	jne    c0102f4f <do_unlink+0x45a>
c0102f34:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c0102f3b:	83 ec 04             	sub    $0x4,%esp
c0102f3e:	6a 10                	push   $0x10
c0102f40:	6a 00                	push   $0x0
c0102f42:	ff 75 d4             	pushl  -0x2c(%ebp)
c0102f45:	e8 2d 86 00 00       	call   c010b577 <Memset>
c0102f4a:	83 c4 10             	add    $0x10,%esp
c0102f4d:	eb 13                	jmp    c0102f62 <do_unlink+0x46d>
c0102f4f:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
c0102f53:	83 45 d4 10          	addl   $0x10,-0x2c(%ebp)
c0102f57:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0102f5a:	3b 45 90             	cmp    -0x70(%ebp),%eax
c0102f5d:	7c a7                	jl     c0102f06 <do_unlink+0x411>
c0102f5f:	eb 01                	jmp    c0102f62 <do_unlink+0x46d>
c0102f61:	90                   	nop
c0102f62:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102f65:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0102f68:	7f 16                	jg     c0102f80 <do_unlink+0x48b>
c0102f6a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0102f6e:	75 10                	jne    c0102f80 <do_unlink+0x48b>
c0102f70:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
c0102f74:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0102f77:	3b 45 90             	cmp    -0x70(%ebp),%eax
c0102f7a:	0f 8c 4f ff ff ff    	jl     c0102ecf <do_unlink+0x3da>
c0102f80:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102f83:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0102f86:	75 17                	jne    c0102f9f <do_unlink+0x4aa>
c0102f88:	8b 45 98             	mov    -0x68(%ebp),%eax
c0102f8b:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0102f8e:	89 50 04             	mov    %edx,0x4(%eax)
c0102f91:	83 ec 0c             	sub    $0xc,%esp
c0102f94:	ff 75 98             	pushl  -0x68(%ebp)
c0102f97:	e8 c0 03 00 00       	call   c010335c <sync_inode>
c0102f9c:	83 c4 10             	add    $0x10,%esp
c0102f9f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0102fa3:	74 26                	je     c0102fcb <do_unlink+0x4d6>
c0102fa5:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102faa:	89 c1                	mov    %eax,%ecx
c0102fac:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0102faf:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102fb2:	01 d0                	add    %edx,%eax
c0102fb4:	83 ec 0c             	sub    $0xc,%esp
c0102fb7:	6a 0a                	push   $0xa
c0102fb9:	68 00 02 00 00       	push   $0x200
c0102fbe:	51                   	push   %ecx
c0102fbf:	ff 75 b8             	pushl  -0x48(%ebp)
c0102fc2:	50                   	push   %eax
c0102fc3:	e8 9c e7 ff ff       	call   c0101764 <rd_wt>
c0102fc8:	83 c4 20             	add    $0x20,%esp
c0102fcb:	90                   	nop
c0102fcc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0102fcf:	c9                   	leave  
c0102fd0:	c3                   	ret    

c0102fd1 <do_rdwt>:
c0102fd1:	55                   	push   %ebp
c0102fd2:	89 e5                	mov    %esp,%ebp
c0102fd4:	81 ec 98 00 00 00    	sub    $0x98,%esp
c0102fda:	8b 45 08             	mov    0x8(%ebp),%eax
c0102fdd:	8b 40 78             	mov    0x78(%eax),%eax
c0102fe0:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0102fe3:	8b 45 08             	mov    0x8(%ebp),%eax
c0102fe6:	8b 40 60             	mov    0x60(%eax),%eax
c0102fe9:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0102fec:	8b 45 08             	mov    0x8(%ebp),%eax
c0102fef:	8b 40 6c             	mov    0x6c(%eax),%eax
c0102ff2:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0102ff5:	8b 45 08             	mov    0x8(%ebp),%eax
c0102ff8:	8b 00                	mov    (%eax),%eax
c0102ffa:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0102ffd:	8b 45 08             	mov    0x8(%ebp),%eax
c0103000:	8b 40 10             	mov    0x10(%eax),%eax
c0103003:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0103006:	8b 45 08             	mov    0x8(%ebp),%eax
c0103009:	8b 40 50             	mov    0x50(%eax),%eax
c010300c:	89 45 c8             	mov    %eax,-0x38(%ebp)
c010300f:	83 ec 0c             	sub    $0xc,%esp
c0103012:	ff 75 d0             	pushl  -0x30(%ebp)
c0103015:	e8 0c 07 00 00       	call   c0103726 <pid2proc>
c010301a:	83 c4 10             	add    $0x10,%esp
c010301d:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0103020:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0103023:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0103026:	83 c2 4c             	add    $0x4c,%edx
c0103029:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c010302d:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0103030:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0103033:	8b 40 08             	mov    0x8(%eax),%eax
c0103036:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0103039:	8b 45 08             	mov    0x8(%ebp),%eax
c010303c:	8b 00                	mov    (%eax),%eax
c010303e:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0103041:	83 ec 08             	sub    $0x8,%esp
c0103044:	ff 75 bc             	pushl  -0x44(%ebp)
c0103047:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c010304d:	50                   	push   %eax
c010304e:	e8 0d f2 ff ff       	call   c0102260 <get_inode>
c0103053:	83 c4 10             	add    $0x10,%esp
c0103056:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0103059:	83 7d b4 00          	cmpl   $0x0,-0x4c(%ebp)
c010305d:	75 10                	jne    c010306f <do_rdwt+0x9e>
c010305f:	83 ec 0c             	sub    $0xc,%esp
c0103062:	68 58 a8 10 c0       	push   $0xc010a858
c0103067:	e8 33 57 00 00       	call   c010879f <panic>
c010306c:	83 c4 10             	add    $0x10,%esp
c010306f:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c0103075:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0103078:	8b 45 c0             	mov    -0x40(%ebp),%eax
c010307b:	8b 40 04             	mov    0x4(%eax),%eax
c010307e:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0103081:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c0103085:	74 22                	je     c01030a9 <do_rdwt+0xd8>
c0103087:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c010308b:	74 1c                	je     c01030a9 <do_rdwt+0xd8>
c010308d:	68 a8 04 00 00       	push   $0x4a8
c0103092:	68 c4 a6 10 c0       	push   $0xc010a6c4
c0103097:	68 c4 a6 10 c0       	push   $0xc010a6c4
c010309c:	68 68 a8 10 c0       	push   $0xc010a868
c01030a1:	e8 17 57 00 00       	call   c01087bd <assertion_failure>
c01030a6:	83 c4 10             	add    $0x10,%esp
c01030a9:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
c01030af:	83 f8 01             	cmp    $0x1,%eax
c01030b2:	0f 85 86 00 00 00    	jne    c010313e <do_rdwt+0x16d>
c01030b8:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c01030bc:	75 09                	jne    c01030c7 <do_rdwt+0xf6>
c01030be:	c7 45 f4 d2 07 00 00 	movl   $0x7d2,-0xc(%ebp)
c01030c5:	eb 0d                	jmp    c01030d4 <do_rdwt+0x103>
c01030c7:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c01030cb:	75 07                	jne    c01030d4 <do_rdwt+0x103>
c01030cd:	c7 45 f4 d3 07 00 00 	movl   $0x7d3,-0xc(%ebp)
c01030d4:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01030d7:	8b 45 08             	mov    0x8(%ebp),%eax
c01030da:	89 50 78             	mov    %edx,0x78(%eax)
c01030dd:	8b 55 b8             	mov    -0x48(%ebp),%edx
c01030e0:	8b 45 08             	mov    0x8(%ebp),%eax
c01030e3:	89 50 68             	mov    %edx,0x68(%eax)
c01030e6:	83 ec 04             	sub    $0x4,%esp
c01030e9:	6a 04                	push   $0x4
c01030eb:	ff 75 08             	pushl  0x8(%ebp)
c01030ee:	6a 03                	push   $0x3
c01030f0:	e8 38 63 00 00       	call   c010942d <send_rec>
c01030f5:	83 c4 10             	add    $0x10,%esp
c01030f8:	8b 45 08             	mov    0x8(%ebp),%eax
c01030fb:	8b 40 78             	mov    0x78(%eax),%eax
c01030fe:	83 f8 66             	cmp    $0x66,%eax
c0103101:	75 13                	jne    c0103116 <do_rdwt+0x145>
c0103103:	83 ec 04             	sub    $0x4,%esp
c0103106:	ff 75 b8             	pushl  -0x48(%ebp)
c0103109:	ff 75 08             	pushl  0x8(%ebp)
c010310c:	6a 01                	push   $0x1
c010310e:	e8 1a 63 00 00       	call   c010942d <send_rec>
c0103113:	83 c4 10             	add    $0x10,%esp
c0103116:	8b 45 08             	mov    0x8(%ebp),%eax
c0103119:	8b 40 78             	mov    0x78(%eax),%eax
c010311c:	83 f8 65             	cmp    $0x65,%eax
c010311f:	75 13                	jne    c0103134 <do_rdwt+0x163>
c0103121:	83 ec 04             	sub    $0x4,%esp
c0103124:	ff 75 b8             	pushl  -0x48(%ebp)
c0103127:	ff 75 08             	pushl  0x8(%ebp)
c010312a:	6a 01                	push   $0x1
c010312c:	e8 fc 62 00 00       	call   c010942d <send_rec>
c0103131:	83 c4 10             	add    $0x10,%esp
c0103134:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0103139:	e9 1c 02 00 00       	jmp    c010335a <do_rdwt+0x389>
c010313e:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c0103142:	75 18                	jne    c010315c <do_rdwt+0x18b>
c0103144:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c010314a:	c1 e0 09             	shl    $0x9,%eax
c010314d:	39 45 ac             	cmp    %eax,-0x54(%ebp)
c0103150:	75 0a                	jne    c010315c <do_rdwt+0x18b>
c0103152:	b8 00 00 00 00       	mov    $0x0,%eax
c0103157:	e9 fe 01 00 00       	jmp    c010335a <do_rdwt+0x389>
c010315c:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c0103160:	75 14                	jne    c0103176 <do_rdwt+0x1a5>
c0103162:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0103165:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0103168:	01 d0                	add    %edx,%eax
c010316a:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c010316d:	0f 4e 45 b0          	cmovle -0x50(%ebp),%eax
c0103171:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103174:	eb 19                	jmp    c010318f <do_rdwt+0x1be>
c0103176:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0103179:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010317c:	01 c2                	add    %eax,%edx
c010317e:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0103184:	c1 e0 09             	shl    $0x9,%eax
c0103187:	39 c2                	cmp    %eax,%edx
c0103189:	0f 4e c2             	cmovle %edx,%eax
c010318c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010318f:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0103192:	99                   	cltd   
c0103193:	c1 ea 17             	shr    $0x17,%edx
c0103196:	01 d0                	add    %edx,%eax
c0103198:	25 ff 01 00 00       	and    $0x1ff,%eax
c010319d:	29 d0                	sub    %edx,%eax
c010319f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01031a2:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c01031a8:	8b 45 ac             	mov    -0x54(%ebp),%eax
c01031ab:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c01031b1:	85 c0                	test   %eax,%eax
c01031b3:	0f 48 c1             	cmovs  %ecx,%eax
c01031b6:	c1 f8 09             	sar    $0x9,%eax
c01031b9:	01 d0                	add    %edx,%eax
c01031bb:	89 45 a8             	mov    %eax,-0x58(%ebp)
c01031be:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c01031c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01031c7:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c01031cd:	85 c0                	test   %eax,%eax
c01031cf:	0f 48 c1             	cmovs  %ecx,%eax
c01031d2:	c1 f8 09             	sar    $0x9,%eax
c01031d5:	01 d0                	add    %edx,%eax
c01031d7:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c01031da:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c01031dd:	2b 45 a8             	sub    -0x58(%ebp),%eax
c01031e0:	ba 00 00 10 00       	mov    $0x100000,%edx
c01031e5:	39 d0                	cmp    %edx,%eax
c01031e7:	7d 0b                	jge    c01031f4 <do_rdwt+0x223>
c01031e9:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c01031ec:	2b 45 a8             	sub    -0x58(%ebp),%eax
c01031ef:	83 c0 01             	add    $0x1,%eax
c01031f2:	eb 05                	jmp    c01031f9 <do_rdwt+0x228>
c01031f4:	b8 00 00 10 00       	mov    $0x100000,%eax
c01031f9:	89 45 a0             	mov    %eax,-0x60(%ebp)
c01031fc:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01031ff:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0103202:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0103209:	8b 45 08             	mov    0x8(%ebp),%eax
c010320c:	8b 00                	mov    (%eax),%eax
c010320e:	83 ec 0c             	sub    $0xc,%esp
c0103211:	50                   	push   %eax
c0103212:	e8 0f 05 00 00       	call   c0103726 <pid2proc>
c0103217:	83 c4 10             	add    $0x10,%esp
c010321a:	89 45 9c             	mov    %eax,-0x64(%ebp)
c010321d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0103220:	83 ec 08             	sub    $0x8,%esp
c0103223:	50                   	push   %eax
c0103224:	ff 75 cc             	pushl  -0x34(%ebp)
c0103227:	e8 30 2b 00 00       	call   c0105d5c <alloc_virtual_memory>
c010322c:	83 c4 10             	add    $0x10,%esp
c010322f:	89 45 98             	mov    %eax,-0x68(%ebp)
c0103232:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0103235:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0103238:	e9 c5 00 00 00       	jmp    c0103302 <do_rdwt+0x331>
c010323d:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0103240:	c1 e0 09             	shl    $0x9,%eax
c0103243:	2b 45 ec             	sub    -0x14(%ebp),%eax
c0103246:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c0103249:	0f 4e 45 e8          	cmovle -0x18(%ebp),%eax
c010324d:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0103250:	c7 45 90 20 00 00 00 	movl   $0x20,-0x70(%ebp)
c0103257:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c010325b:	75 46                	jne    c01032a3 <do_rdwt+0x2d2>
c010325d:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0103260:	c1 e0 09             	shl    $0x9,%eax
c0103263:	8b 15 84 17 11 c0    	mov    0xc0111784,%edx
c0103269:	83 ec 0c             	sub    $0xc,%esp
c010326c:	6a 07                	push   $0x7
c010326e:	50                   	push   %eax
c010326f:	52                   	push   %edx
c0103270:	ff 75 90             	pushl  -0x70(%ebp)
c0103273:	ff 75 e0             	pushl  -0x20(%ebp)
c0103276:	e8 e9 e4 ff ff       	call   c0101764 <rd_wt>
c010327b:	83 c4 20             	add    $0x20,%esp
c010327e:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0103284:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103287:	01 d0                	add    %edx,%eax
c0103289:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c010328c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c010328f:	01 ca                	add    %ecx,%edx
c0103291:	83 ec 04             	sub    $0x4,%esp
c0103294:	ff 75 94             	pushl  -0x6c(%ebp)
c0103297:	50                   	push   %eax
c0103298:	52                   	push   %edx
c0103299:	e8 2b 39 00 00       	call   c0106bc9 <Memcpy>
c010329e:	83 c4 10             	add    $0x10,%esp
c01032a1:	eb 46                	jmp    c01032e9 <do_rdwt+0x318>
c01032a3:	8b 55 98             	mov    -0x68(%ebp),%edx
c01032a6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01032a9:	01 d0                	add    %edx,%eax
c01032ab:	89 c1                	mov    %eax,%ecx
c01032ad:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01032b3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01032b6:	01 d0                	add    %edx,%eax
c01032b8:	83 ec 04             	sub    $0x4,%esp
c01032bb:	ff 75 94             	pushl  -0x6c(%ebp)
c01032be:	51                   	push   %ecx
c01032bf:	50                   	push   %eax
c01032c0:	e8 04 39 00 00       	call   c0106bc9 <Memcpy>
c01032c5:	83 c4 10             	add    $0x10,%esp
c01032c8:	8b 45 a0             	mov    -0x60(%ebp),%eax
c01032cb:	c1 e0 09             	shl    $0x9,%eax
c01032ce:	8b 15 84 17 11 c0    	mov    0xc0111784,%edx
c01032d4:	83 ec 0c             	sub    $0xc,%esp
c01032d7:	6a 0a                	push   $0xa
c01032d9:	50                   	push   %eax
c01032da:	52                   	push   %edx
c01032db:	ff 75 90             	pushl  -0x70(%ebp)
c01032de:	ff 75 e0             	pushl  -0x20(%ebp)
c01032e1:	e8 7e e4 ff ff       	call   c0101764 <rd_wt>
c01032e6:	83 c4 20             	add    $0x20,%esp
c01032e9:	8b 45 94             	mov    -0x6c(%ebp),%eax
c01032ec:	29 45 e8             	sub    %eax,-0x18(%ebp)
c01032ef:	8b 45 94             	mov    -0x6c(%ebp),%eax
c01032f2:	01 45 e4             	add    %eax,-0x1c(%ebp)
c01032f5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01032fc:	8b 45 a0             	mov    -0x60(%ebp),%eax
c01032ff:	01 45 e0             	add    %eax,-0x20(%ebp)
c0103302:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0103305:	3b 45 a4             	cmp    -0x5c(%ebp),%eax
c0103308:	7f 0a                	jg     c0103314 <do_rdwt+0x343>
c010330a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c010330e:	0f 85 29 ff ff ff    	jne    c010323d <do_rdwt+0x26c>
c0103314:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0103317:	8b 50 04             	mov    0x4(%eax),%edx
c010331a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010331d:	01 c2                	add    %eax,%edx
c010331f:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0103322:	89 50 04             	mov    %edx,0x4(%eax)
c0103325:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0103328:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010332b:	01 c2                	add    %eax,%edx
c010332d:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c0103333:	39 c2                	cmp    %eax,%edx
c0103335:	7e 20                	jle    c0103357 <do_rdwt+0x386>
c0103337:	8b 55 ac             	mov    -0x54(%ebp),%edx
c010333a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010333d:	01 d0                	add    %edx,%eax
c010333f:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c0103345:	83 ec 0c             	sub    $0xc,%esp
c0103348:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c010334e:	50                   	push   %eax
c010334f:	e8 08 00 00 00       	call   c010335c <sync_inode>
c0103354:	83 c4 10             	add    $0x10,%esp
c0103357:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010335a:	c9                   	leave  
c010335b:	c3                   	ret    

c010335c <sync_inode>:
c010335c:	55                   	push   %ebp
c010335d:	89 e5                	mov    %esp,%ebp
c010335f:	53                   	push   %ebx
c0103360:	83 ec 34             	sub    $0x34,%esp
c0103363:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010336a:	eb 74                	jmp    c01033e0 <sync_inode+0x84>
c010336c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010336f:	89 d0                	mov    %edx,%eax
c0103371:	c1 e0 02             	shl    $0x2,%eax
c0103374:	01 d0                	add    %edx,%eax
c0103376:	c1 e0 03             	shl    $0x3,%eax
c0103379:	05 b0 17 11 c0       	add    $0xc01117b0,%eax
c010337e:	8b 10                	mov    (%eax),%edx
c0103380:	8b 45 08             	mov    0x8(%ebp),%eax
c0103383:	8b 40 10             	mov    0x10(%eax),%eax
c0103386:	39 c2                	cmp    %eax,%edx
c0103388:	75 52                	jne    c01033dc <sync_inode+0x80>
c010338a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010338d:	89 d0                	mov    %edx,%eax
c010338f:	c1 e0 02             	shl    $0x2,%eax
c0103392:	01 d0                	add    %edx,%eax
c0103394:	c1 e0 03             	shl    $0x3,%eax
c0103397:	8d 90 a0 17 11 c0    	lea    -0x3feee860(%eax),%edx
c010339d:	8b 45 08             	mov    0x8(%ebp),%eax
c01033a0:	8b 08                	mov    (%eax),%ecx
c01033a2:	89 0a                	mov    %ecx,(%edx)
c01033a4:	8b 48 04             	mov    0x4(%eax),%ecx
c01033a7:	89 4a 04             	mov    %ecx,0x4(%edx)
c01033aa:	8b 48 08             	mov    0x8(%eax),%ecx
c01033ad:	89 4a 08             	mov    %ecx,0x8(%edx)
c01033b0:	8b 48 0c             	mov    0xc(%eax),%ecx
c01033b3:	89 4a 0c             	mov    %ecx,0xc(%edx)
c01033b6:	8b 48 10             	mov    0x10(%eax),%ecx
c01033b9:	89 4a 10             	mov    %ecx,0x10(%edx)
c01033bc:	8b 48 14             	mov    0x14(%eax),%ecx
c01033bf:	89 4a 14             	mov    %ecx,0x14(%edx)
c01033c2:	8b 48 18             	mov    0x18(%eax),%ecx
c01033c5:	89 4a 18             	mov    %ecx,0x18(%edx)
c01033c8:	8b 48 1c             	mov    0x1c(%eax),%ecx
c01033cb:	89 4a 1c             	mov    %ecx,0x1c(%edx)
c01033ce:	8b 48 20             	mov    0x20(%eax),%ecx
c01033d1:	89 4a 20             	mov    %ecx,0x20(%edx)
c01033d4:	8b 40 24             	mov    0x24(%eax),%eax
c01033d7:	89 42 24             	mov    %eax,0x24(%edx)
c01033da:	eb 0a                	jmp    c01033e6 <sync_inode+0x8a>
c01033dc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01033e0:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c01033e4:	7e 86                	jle    c010336c <sync_inode+0x10>
c01033e6:	c7 45 f0 20 00 00 00 	movl   $0x20,-0x10(%ebp)
c01033ed:	8b 45 08             	mov    0x8(%ebp),%eax
c01033f0:	8b 40 10             	mov    0x10(%eax),%eax
c01033f3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01033f6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01033f9:	8d 48 ff             	lea    -0x1(%eax),%ecx
c01033fc:	b8 00 02 00 00       	mov    $0x200,%eax
c0103401:	99                   	cltd   
c0103402:	f7 7d f0             	idivl  -0x10(%ebp)
c0103405:	89 c3                	mov    %eax,%ebx
c0103407:	89 c8                	mov    %ecx,%eax
c0103409:	99                   	cltd   
c010340a:	f7 fb                	idiv   %ebx
c010340c:	89 55 e8             	mov    %edx,-0x18(%ebp)
c010340f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103412:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0103415:	b8 00 02 00 00       	mov    $0x200,%eax
c010341a:	99                   	cltd   
c010341b:	f7 7d f0             	idivl  -0x10(%ebp)
c010341e:	89 c3                	mov    %eax,%ebx
c0103420:	89 c8                	mov    %ecx,%eax
c0103422:	99                   	cltd   
c0103423:	f7 fb                	idiv   %ebx
c0103425:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0103428:	8b 45 08             	mov    0x8(%ebp),%eax
c010342b:	8b 40 20             	mov    0x20(%eax),%eax
c010342e:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0103431:	e8 0a 01 00 00       	call   c0103540 <get_super_block>
c0103436:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0103439:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010343c:	8b 40 04             	mov    0x4(%eax),%eax
c010343f:	8d 50 02             	lea    0x2(%eax),%edx
c0103442:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0103445:	8b 40 08             	mov    0x8(%eax),%eax
c0103448:	01 c2                	add    %eax,%edx
c010344a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010344d:	01 d0                	add    %edx,%eax
c010344f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0103452:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0103457:	83 ec 0c             	sub    $0xc,%esp
c010345a:	6a 07                	push   $0x7
c010345c:	68 00 02 00 00       	push   $0x200
c0103461:	50                   	push   %eax
c0103462:	ff 75 e0             	pushl  -0x20(%ebp)
c0103465:	ff 75 d8             	pushl  -0x28(%ebp)
c0103468:	e8 f7 e2 ff ff       	call   c0101764 <rd_wt>
c010346d:	83 c4 20             	add    $0x20,%esp
c0103470:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0103475:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0103478:	83 ec 04             	sub    $0x4,%esp
c010347b:	ff 75 f0             	pushl  -0x10(%ebp)
c010347e:	ff 75 08             	pushl  0x8(%ebp)
c0103481:	ff 75 d4             	pushl  -0x2c(%ebp)
c0103484:	e8 40 37 00 00       	call   c0106bc9 <Memcpy>
c0103489:	83 c4 10             	add    $0x10,%esp
c010348c:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0103491:	83 ec 0c             	sub    $0xc,%esp
c0103494:	6a 0a                	push   $0xa
c0103496:	68 00 02 00 00       	push   $0x200
c010349b:	50                   	push   %eax
c010349c:	ff 75 e0             	pushl  -0x20(%ebp)
c010349f:	ff 75 d8             	pushl  -0x28(%ebp)
c01034a2:	e8 bd e2 ff ff       	call   c0101764 <rd_wt>
c01034a7:	83 c4 20             	add    $0x20,%esp
c01034aa:	90                   	nop
c01034ab:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01034ae:	c9                   	leave  
c01034af:	c3                   	ret    

c01034b0 <put_inode>:
c01034b0:	55                   	push   %ebp
c01034b1:	89 e5                	mov    %esp,%ebp
c01034b3:	83 ec 08             	sub    $0x8,%esp
c01034b6:	8b 45 08             	mov    0x8(%ebp),%eax
c01034b9:	8b 40 24             	mov    0x24(%eax),%eax
c01034bc:	85 c0                	test   %eax,%eax
c01034be:	7f 1c                	jg     c01034dc <put_inode+0x2c>
c01034c0:	68 4d 05 00 00       	push   $0x54d
c01034c5:	68 c4 a6 10 c0       	push   $0xc010a6c4
c01034ca:	68 c4 a6 10 c0       	push   $0xc010a6c4
c01034cf:	68 9c a8 10 c0       	push   $0xc010a89c
c01034d4:	e8 e4 52 00 00       	call   c01087bd <assertion_failure>
c01034d9:	83 c4 10             	add    $0x10,%esp
c01034dc:	8b 45 08             	mov    0x8(%ebp),%eax
c01034df:	8b 40 24             	mov    0x24(%eax),%eax
c01034e2:	8d 50 ff             	lea    -0x1(%eax),%edx
c01034e5:	8b 45 08             	mov    0x8(%ebp),%eax
c01034e8:	89 50 24             	mov    %edx,0x24(%eax)
c01034eb:	90                   	nop
c01034ec:	c9                   	leave  
c01034ed:	c3                   	ret    

c01034ee <do_close>:
c01034ee:	55                   	push   %ebp
c01034ef:	89 e5                	mov    %esp,%ebp
c01034f1:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c01034f6:	8b 55 08             	mov    0x8(%ebp),%edx
c01034f9:	83 c2 4c             	add    $0x4c,%edx
c01034fc:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c0103500:	8b 50 0c             	mov    0xc(%eax),%edx
c0103503:	83 ea 01             	sub    $0x1,%edx
c0103506:	89 50 0c             	mov    %edx,0xc(%eax)
c0103509:	8b 40 0c             	mov    0xc(%eax),%eax
c010350c:	85 c0                	test   %eax,%eax
c010350e:	75 16                	jne    c0103526 <do_close+0x38>
c0103510:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c0103515:	8b 55 08             	mov    0x8(%ebp),%edx
c0103518:	83 c2 4c             	add    $0x4c,%edx
c010351b:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
c010351f:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0103526:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c010352b:	8b 55 08             	mov    0x8(%ebp),%edx
c010352e:	83 c2 4c             	add    $0x4c,%edx
c0103531:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
c0103538:	00 
c0103539:	b8 00 00 00 00       	mov    $0x0,%eax
c010353e:	5d                   	pop    %ebp
c010353f:	c3                   	ret    

c0103540 <get_super_block>:
c0103540:	55                   	push   %ebp
c0103541:	89 e5                	mov    %esp,%ebp
c0103543:	83 ec 08             	sub    $0x8,%esp
c0103546:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010354b:	83 ec 0c             	sub    $0xc,%esp
c010354e:	6a 07                	push   $0x7
c0103550:	68 00 02 00 00       	push   $0x200
c0103555:	50                   	push   %eax
c0103556:	6a 20                	push   $0x20
c0103558:	6a 01                	push   $0x1
c010355a:	e8 05 e2 ff ff       	call   c0101764 <rd_wt>
c010355f:	83 c4 20             	add    $0x20,%esp
c0103562:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0103568:	a1 a0 21 11 c0       	mov    0xc01121a0,%eax
c010356d:	8b 0a                	mov    (%edx),%ecx
c010356f:	89 08                	mov    %ecx,(%eax)
c0103571:	8b 4a 04             	mov    0x4(%edx),%ecx
c0103574:	89 48 04             	mov    %ecx,0x4(%eax)
c0103577:	8b 4a 08             	mov    0x8(%edx),%ecx
c010357a:	89 48 08             	mov    %ecx,0x8(%eax)
c010357d:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0103580:	89 48 0c             	mov    %ecx,0xc(%eax)
c0103583:	8b 4a 10             	mov    0x10(%edx),%ecx
c0103586:	89 48 10             	mov    %ecx,0x10(%eax)
c0103589:	8b 4a 14             	mov    0x14(%edx),%ecx
c010358c:	89 48 14             	mov    %ecx,0x14(%eax)
c010358f:	8b 4a 18             	mov    0x18(%edx),%ecx
c0103592:	89 48 18             	mov    %ecx,0x18(%eax)
c0103595:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0103598:	89 48 1c             	mov    %ecx,0x1c(%eax)
c010359b:	8b 52 20             	mov    0x20(%edx),%edx
c010359e:	89 50 20             	mov    %edx,0x20(%eax)
c01035a1:	a1 a0 21 11 c0       	mov    0xc01121a0,%eax
c01035a6:	c9                   	leave  
c01035a7:	c3                   	ret    

c01035a8 <schedule_process>:
c01035a8:	55                   	push   %ebp
c01035a9:	89 e5                	mov    %esp,%ebp
c01035ab:	83 ec 18             	sub    $0x18,%esp
c01035ae:	c7 45 f4 00 00 40 00 	movl   $0x400000,-0xc(%ebp)
c01035b5:	e8 e9 cd ff ff       	call   c01003a3 <get_running_thread_pcb>
c01035ba:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01035bd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01035c0:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01035c7:	84 c0                	test   %al,%al
c01035c9:	75 35                	jne    c0103600 <schedule_process+0x58>
c01035cb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01035ce:	8b 90 1c 01 00 00    	mov    0x11c(%eax),%edx
c01035d4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01035d7:	89 90 18 01 00 00    	mov    %edx,0x118(%eax)
c01035dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01035e0:	c6 80 3c 02 00 00 03 	movb   $0x3,0x23c(%eax)
c01035e7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01035ea:	05 60 02 00 00       	add    $0x260,%eax
c01035ef:	83 ec 08             	sub    $0x8,%esp
c01035f2:	50                   	push   %eax
c01035f3:	68 ec fd 10 c0       	push   $0xc010fdec
c01035f8:	e8 6a 6b 00 00       	call   c010a167 <insertToDoubleLinkList>
c01035fd:	83 c4 10             	add    $0x10,%esp
c0103600:	83 ec 0c             	sub    $0xc,%esp
c0103603:	68 ec fd 10 c0       	push   $0xc010fdec
c0103608:	e8 76 69 00 00       	call   c0109f83 <isListEmpty>
c010360d:	83 c4 10             	add    $0x10,%esp
c0103610:	84 c0                	test   %al,%al
c0103612:	74 19                	je     c010362d <schedule_process+0x85>
c0103614:	6a 1e                	push   $0x1e
c0103616:	68 ab a8 10 c0       	push   $0xc010a8ab
c010361b:	68 ab a8 10 c0       	push   $0xc010a8ab
c0103620:	68 b5 a8 10 c0       	push   $0xc010a8b5
c0103625:	e8 93 51 00 00       	call   c01087bd <assertion_failure>
c010362a:	83 c4 10             	add    $0x10,%esp
c010362d:	83 ec 0c             	sub    $0xc,%esp
c0103630:	68 ec fd 10 c0       	push   $0xc010fdec
c0103635:	e8 b0 6b 00 00       	call   c010a1ea <popFromDoubleLinkList>
c010363a:	83 c4 10             	add    $0x10,%esp
c010363d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103640:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103643:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0103648:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010364b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010364e:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0103655:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103658:	8b 50 08             	mov    0x8(%eax),%edx
c010365b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010365e:	39 c2                	cmp    %eax,%edx
c0103660:	74 28                	je     c010368a <schedule_process+0xe2>
c0103662:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103665:	05 00 10 00 00       	add    $0x1000,%eax
c010366a:	83 ec 0c             	sub    $0xc,%esp
c010366d:	50                   	push   %eax
c010366e:	e8 21 cd ff ff       	call   c0100394 <update_tss>
c0103673:	83 c4 10             	add    $0x10,%esp
c0103676:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103679:	8b 40 08             	mov    0x8(%eax),%eax
c010367c:	83 ec 0c             	sub    $0xc,%esp
c010367f:	50                   	push   %eax
c0103680:	e8 02 cd ff ff       	call   c0100387 <update_cr3>
c0103685:	83 c4 10             	add    $0x10,%esp
c0103688:	eb 0f                	jmp    c0103699 <schedule_process+0xf1>
c010368a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010368d:	83 ec 0c             	sub    $0xc,%esp
c0103690:	50                   	push   %eax
c0103691:	e8 f1 cc ff ff       	call   c0100387 <update_cr3>
c0103696:	83 c4 10             	add    $0x10,%esp
c0103699:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010369c:	a3 c0 fb 10 c0       	mov    %eax,0xc010fbc0
c01036a1:	83 ec 08             	sub    $0x8,%esp
c01036a4:	ff 75 e8             	pushl  -0x18(%ebp)
c01036a7:	ff 75 f0             	pushl  -0x10(%ebp)
c01036aa:	e8 91 68 00 00       	call   c0109f40 <switch_to>
c01036af:	83 c4 10             	add    $0x10,%esp
c01036b2:	90                   	nop
c01036b3:	c9                   	leave  
c01036b4:	c3                   	ret    

c01036b5 <clock_handler>:
c01036b5:	55                   	push   %ebp
c01036b6:	89 e5                	mov    %esp,%ebp
c01036b8:	83 ec 18             	sub    $0x18,%esp
c01036bb:	e8 e3 cc ff ff       	call   c01003a3 <get_running_thread_pcb>
c01036c0:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01036c3:	a1 c0 06 11 c0       	mov    0xc01106c0,%eax
c01036c8:	85 c0                	test   %eax,%eax
c01036ca:	74 0d                	je     c01036d9 <clock_handler+0x24>
c01036cc:	83 ec 0c             	sub    $0xc,%esp
c01036cf:	6a 04                	push   $0x4
c01036d1:	e8 f1 5f 00 00       	call   c01096c7 <inform_int>
c01036d6:	83 c4 10             	add    $0x10,%esp
c01036d9:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c01036de:	83 f8 64             	cmp    $0x64,%eax
c01036e1:	75 0c                	jne    c01036ef <clock_handler+0x3a>
c01036e3:	c7 05 a8 f7 10 c0 01 	movl   $0x1,0xc010f7a8
c01036ea:	00 00 00 
c01036ed:	eb 0a                	jmp    c01036f9 <clock_handler+0x44>
c01036ef:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c01036f4:	83 f8 01             	cmp    $0x1,%eax
c01036f7:	75 2a                	jne    c0103723 <clock_handler+0x6e>
c01036f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01036fc:	8b 80 18 01 00 00    	mov    0x118(%eax),%eax
c0103702:	85 c0                	test   %eax,%eax
c0103704:	74 16                	je     c010371c <clock_handler+0x67>
c0103706:	a1 c0 fb 10 c0       	mov    0xc010fbc0,%eax
c010370b:	8b 90 18 01 00 00    	mov    0x118(%eax),%edx
c0103711:	83 ea 01             	sub    $0x1,%edx
c0103714:	89 90 18 01 00 00    	mov    %edx,0x118(%eax)
c010371a:	eb 08                	jmp    c0103724 <clock_handler+0x6f>
c010371c:	e8 87 fe ff ff       	call   c01035a8 <schedule_process>
c0103721:	eb 01                	jmp    c0103724 <clock_handler+0x6f>
c0103723:	90                   	nop
c0103724:	c9                   	leave  
c0103725:	c3                   	ret    

c0103726 <pid2proc>:
c0103726:	55                   	push   %ebp
c0103727:	89 e5                	mov    %esp,%ebp
c0103729:	83 ec 20             	sub    $0x20,%esp
c010372c:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0103733:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010373a:	a1 04 0f 11 c0       	mov    0xc0110f04,%eax
c010373f:	8b 15 08 0f 11 c0    	mov    0xc0110f08,%edx
c0103745:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103748:	89 55 f0             	mov    %edx,-0x10(%ebp)
c010374b:	a1 0c 0f 11 c0       	mov    0xc0110f0c,%eax
c0103750:	8b 15 10 0f 11 c0    	mov    0xc0110f10,%edx
c0103756:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0103759:	89 55 e8             	mov    %edx,-0x18(%ebp)
c010375c:	a1 08 0f 11 c0       	mov    0xc0110f08,%eax
c0103761:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103764:	eb 36                	jmp    c010379c <pid2proc+0x76>
c0103766:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103769:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010376e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103771:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0103775:	75 07                	jne    c010377e <pid2proc+0x58>
c0103777:	c7 45 f8 04 00 00 00 	movl   $0x4,-0x8(%ebp)
c010377e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103781:	8b 90 14 01 00 00    	mov    0x114(%eax),%edx
c0103787:	8b 45 08             	mov    0x8(%ebp),%eax
c010378a:	39 c2                	cmp    %eax,%edx
c010378c:	75 05                	jne    c0103793 <pid2proc+0x6d>
c010378e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103791:	eb 17                	jmp    c01037aa <pid2proc+0x84>
c0103793:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103796:	8b 40 04             	mov    0x4(%eax),%eax
c0103799:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010379c:	81 7d fc 0c 0f 11 c0 	cmpl   $0xc0110f0c,-0x4(%ebp)
c01037a3:	75 c1                	jne    c0103766 <pid2proc+0x40>
c01037a5:	b8 00 00 00 00       	mov    $0x0,%eax
c01037aa:	c9                   	leave  
c01037ab:	c3                   	ret    

c01037ac <proc2pid>:
c01037ac:	55                   	push   %ebp
c01037ad:	89 e5                	mov    %esp,%ebp
c01037af:	83 ec 10             	sub    $0x10,%esp
c01037b2:	8b 45 08             	mov    0x8(%ebp),%eax
c01037b5:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c01037bb:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01037be:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01037c1:	c9                   	leave  
c01037c2:	c3                   	ret    

c01037c3 <InitDescriptor>:
c01037c3:	55                   	push   %ebp
c01037c4:	89 e5                	mov    %esp,%ebp
c01037c6:	83 ec 04             	sub    $0x4,%esp
c01037c9:	8b 45 14             	mov    0x14(%ebp),%eax
c01037cc:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
c01037d0:	8b 45 10             	mov    0x10(%ebp),%eax
c01037d3:	89 c2                	mov    %eax,%edx
c01037d5:	8b 45 08             	mov    0x8(%ebp),%eax
c01037d8:	66 89 10             	mov    %dx,(%eax)
c01037db:	8b 45 0c             	mov    0xc(%ebp),%eax
c01037de:	89 c2                	mov    %eax,%edx
c01037e0:	8b 45 08             	mov    0x8(%ebp),%eax
c01037e3:	66 89 50 02          	mov    %dx,0x2(%eax)
c01037e7:	8b 45 0c             	mov    0xc(%ebp),%eax
c01037ea:	c1 e8 10             	shr    $0x10,%eax
c01037ed:	89 c2                	mov    %eax,%edx
c01037ef:	8b 45 08             	mov    0x8(%ebp),%eax
c01037f2:	88 50 04             	mov    %dl,0x4(%eax)
c01037f5:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c01037f9:	89 c2                	mov    %eax,%edx
c01037fb:	8b 45 08             	mov    0x8(%ebp),%eax
c01037fe:	88 50 05             	mov    %dl,0x5(%eax)
c0103801:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0103805:	66 c1 e8 08          	shr    $0x8,%ax
c0103809:	c1 e0 04             	shl    $0x4,%eax
c010380c:	89 c2                	mov    %eax,%edx
c010380e:	8b 45 10             	mov    0x10(%ebp),%eax
c0103811:	c1 e8 10             	shr    $0x10,%eax
c0103814:	83 e0 0f             	and    $0xf,%eax
c0103817:	09 c2                	or     %eax,%edx
c0103819:	8b 45 08             	mov    0x8(%ebp),%eax
c010381c:	88 50 06             	mov    %dl,0x6(%eax)
c010381f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103822:	c1 e8 18             	shr    $0x18,%eax
c0103825:	89 c2                	mov    %eax,%edx
c0103827:	8b 45 08             	mov    0x8(%ebp),%eax
c010382a:	88 50 07             	mov    %dl,0x7(%eax)
c010382d:	90                   	nop
c010382e:	c9                   	leave  
c010382f:	c3                   	ret    

c0103830 <Seg2PhyAddr>:
c0103830:	55                   	push   %ebp
c0103831:	89 e5                	mov    %esp,%ebp
c0103833:	83 ec 10             	sub    $0x10,%esp
c0103836:	8b 45 08             	mov    0x8(%ebp),%eax
c0103839:	c1 e8 03             	shr    $0x3,%eax
c010383c:	8b 14 c5 c4 f7 10 c0 	mov    -0x3fef083c(,%eax,8),%edx
c0103843:	8b 04 c5 c0 f7 10 c0 	mov    -0x3fef0840(,%eax,8),%eax
c010384a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010384d:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0103850:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0103854:	0f b7 c0             	movzwl %ax,%eax
c0103857:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c010385b:	0f b6 d2             	movzbl %dl,%edx
c010385e:	c1 e2 10             	shl    $0x10,%edx
c0103861:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c0103867:	09 d0                	or     %edx,%eax
c0103869:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010386c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010386f:	c9                   	leave  
c0103870:	c3                   	ret    

c0103871 <Seg2PhyAddrLDT>:
c0103871:	55                   	push   %ebp
c0103872:	89 e5                	mov    %esp,%ebp
c0103874:	83 ec 10             	sub    $0x10,%esp
c0103877:	8b 45 08             	mov    0x8(%ebp),%eax
c010387a:	c1 e8 03             	shr    $0x3,%eax
c010387d:	89 c2                	mov    %eax,%edx
c010387f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103882:	83 c2 20             	add    $0x20,%edx
c0103885:	8d 54 d0 02          	lea    0x2(%eax,%edx,8),%edx
c0103889:	8b 02                	mov    (%edx),%eax
c010388b:	8b 52 04             	mov    0x4(%edx),%edx
c010388e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103891:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0103894:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0103898:	0f b7 c0             	movzwl %ax,%eax
c010389b:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c010389f:	0f b6 d2             	movzbl %dl,%edx
c01038a2:	c1 e2 10             	shl    $0x10,%edx
c01038a5:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c01038ab:	09 d0                	or     %edx,%eax
c01038ad:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01038b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01038b3:	c9                   	leave  
c01038b4:	c3                   	ret    

c01038b5 <VirAddr2PhyAddr>:
c01038b5:	55                   	push   %ebp
c01038b6:	89 e5                	mov    %esp,%ebp
c01038b8:	83 ec 10             	sub    $0x10,%esp
c01038bb:	8b 55 0c             	mov    0xc(%ebp),%edx
c01038be:	8b 45 08             	mov    0x8(%ebp),%eax
c01038c1:	01 d0                	add    %edx,%eax
c01038c3:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01038c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01038c9:	c9                   	leave  
c01038ca:	c3                   	ret    

c01038cb <v2l>:
c01038cb:	55                   	push   %ebp
c01038cc:	89 e5                	mov    %esp,%ebp
c01038ce:	83 ec 18             	sub    $0x18,%esp
c01038d1:	83 ec 0c             	sub    $0xc,%esp
c01038d4:	ff 75 08             	pushl  0x8(%ebp)
c01038d7:	e8 4a fe ff ff       	call   c0103726 <pid2proc>
c01038dc:	83 c4 10             	add    $0x10,%esp
c01038df:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01038e2:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c01038e9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01038ec:	83 ec 08             	sub    $0x8,%esp
c01038ef:	ff 75 f4             	pushl  -0xc(%ebp)
c01038f2:	50                   	push   %eax
c01038f3:	e8 79 ff ff ff       	call   c0103871 <Seg2PhyAddrLDT>
c01038f8:	83 c4 10             	add    $0x10,%esp
c01038fb:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01038fe:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0103901:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103904:	01 d0                	add    %edx,%eax
c0103906:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0103909:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010390c:	c9                   	leave  
c010390d:	c3                   	ret    

c010390e <init_propt>:
c010390e:	55                   	push   %ebp
c010390f:	89 e5                	mov    %esp,%ebp
c0103911:	83 ec 38             	sub    $0x38,%esp
c0103914:	6a 0e                	push   $0xe
c0103916:	6a 08                	push   $0x8
c0103918:	68 71 01 10 c0       	push   $0xc0100171
c010391d:	6a 20                	push   $0x20
c010391f:	e8 58 01 00 00       	call   c0103a7c <InitInterruptDesc>
c0103924:	83 c4 10             	add    $0x10,%esp
c0103927:	6a 0e                	push   $0xe
c0103929:	6a 08                	push   $0x8
c010392b:	68 9f 01 10 c0       	push   $0xc010019f
c0103930:	6a 21                	push   $0x21
c0103932:	e8 45 01 00 00       	call   c0103a7c <InitInterruptDesc>
c0103937:	83 c4 10             	add    $0x10,%esp
c010393a:	6a 0e                	push   $0xe
c010393c:	6a 08                	push   $0x8
c010393e:	68 e2 01 10 c0       	push   $0xc01001e2
c0103943:	6a 2e                	push   $0x2e
c0103945:	e8 32 01 00 00       	call   c0103a7c <InitInterruptDesc>
c010394a:	83 c4 10             	add    $0x10,%esp
c010394d:	83 ec 04             	sub    $0x4,%esp
c0103950:	68 e0 15 00 00       	push   $0x15e0
c0103955:	6a 00                	push   $0x0
c0103957:	68 00 22 18 c0       	push   $0xc0182200
c010395c:	e8 16 7c 00 00       	call   c010b577 <Memset>
c0103961:	83 c4 10             	add    $0x10,%esp
c0103964:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c010396b:	83 ec 04             	sub    $0x4,%esp
c010396e:	ff 75 f4             	pushl  -0xc(%ebp)
c0103971:	6a 00                	push   $0x0
c0103973:	68 40 06 11 c0       	push   $0xc0110640
c0103978:	e8 fa 7b 00 00       	call   c010b577 <Memset>
c010397d:	83 c4 10             	add    $0x10,%esp
c0103980:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103983:	a3 a8 06 11 c0       	mov    %eax,0xc01106a8
c0103988:	c7 05 48 06 11 c0 30 	movl   $0x30,0xc0110648
c010398f:	00 00 00 
c0103992:	83 ec 0c             	sub    $0xc,%esp
c0103995:	6a 30                	push   $0x30
c0103997:	e8 94 fe ff ff       	call   c0103830 <Seg2PhyAddr>
c010399c:	83 c4 10             	add    $0x10,%esp
c010399f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01039a2:	c7 45 ec 40 06 11 c0 	movl   $0xc0110640,-0x14(%ebp)
c01039a9:	c7 45 e8 89 00 00 00 	movl   $0x89,-0x18(%ebp)
c01039b0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01039b3:	0f b7 d0             	movzwl %ax,%edx
c01039b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01039b9:	83 e8 01             	sub    $0x1,%eax
c01039bc:	89 c1                	mov    %eax,%ecx
c01039be:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01039c1:	52                   	push   %edx
c01039c2:	51                   	push   %ecx
c01039c3:	50                   	push   %eax
c01039c4:	68 00 f8 10 c0       	push   $0xc010f800
c01039c9:	e8 f5 fd ff ff       	call   c01037c3 <InitDescriptor>
c01039ce:	83 c4 10             	add    $0x10,%esp
c01039d1:	c7 45 e4 00 80 0b c0 	movl   $0xc00b8000,-0x1c(%ebp)
c01039d8:	68 f2 00 00 00       	push   $0xf2
c01039dd:	68 ff ff 00 00       	push   $0xffff
c01039e2:	ff 75 e4             	pushl  -0x1c(%ebp)
c01039e5:	68 f8 f7 10 c0       	push   $0xc010f7f8
c01039ea:	e8 d4 fd ff ff       	call   c01037c3 <InitDescriptor>
c01039ef:	83 c4 10             	add    $0x10,%esp
c01039f2:	c7 45 e0 b2 0c 00 00 	movl   $0xcb2,-0x20(%ebp)
c01039f9:	c7 45 dc 9a 0c 00 00 	movl   $0xc9a,-0x24(%ebp)
c0103a00:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%ebp)
c0103a07:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0103a0a:	0f b7 c0             	movzwl %ax,%eax
c0103a0d:	50                   	push   %eax
c0103a0e:	ff 75 d8             	pushl  -0x28(%ebp)
c0103a11:	6a 00                	push   $0x0
c0103a13:	68 08 f8 10 c0       	push   $0xc010f808
c0103a18:	e8 a6 fd ff ff       	call   c01037c3 <InitDescriptor>
c0103a1d:	83 c4 10             	add    $0x10,%esp
c0103a20:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0103a23:	0f b7 c0             	movzwl %ax,%eax
c0103a26:	50                   	push   %eax
c0103a27:	ff 75 d8             	pushl  -0x28(%ebp)
c0103a2a:	6a 00                	push   $0x0
c0103a2c:	68 10 f8 10 c0       	push   $0xc010f810
c0103a31:	e8 8d fd ff ff       	call   c01037c3 <InitDescriptor>
c0103a36:	83 c4 10             	add    $0x10,%esp
c0103a39:	c7 45 d4 b2 0c 00 00 	movl   $0xcb2,-0x2c(%ebp)
c0103a40:	c7 45 d0 ba 0c 00 00 	movl   $0xcba,-0x30(%ebp)
c0103a47:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0103a4a:	0f b7 c0             	movzwl %ax,%eax
c0103a4d:	50                   	push   %eax
c0103a4e:	ff 75 d8             	pushl  -0x28(%ebp)
c0103a51:	6a 00                	push   $0x0
c0103a53:	68 18 f8 10 c0       	push   $0xc010f818
c0103a58:	e8 66 fd ff ff       	call   c01037c3 <InitDescriptor>
c0103a5d:	83 c4 10             	add    $0x10,%esp
c0103a60:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0103a63:	0f b7 c0             	movzwl %ax,%eax
c0103a66:	50                   	push   %eax
c0103a67:	ff 75 d8             	pushl  -0x28(%ebp)
c0103a6a:	6a 00                	push   $0x0
c0103a6c:	68 20 f8 10 c0       	push   $0xc010f820
c0103a71:	e8 4d fd ff ff       	call   c01037c3 <InitDescriptor>
c0103a76:	83 c4 10             	add    $0x10,%esp
c0103a79:	90                   	nop
c0103a7a:	c9                   	leave  
c0103a7b:	c3                   	ret    

c0103a7c <InitInterruptDesc>:
c0103a7c:	55                   	push   %ebp
c0103a7d:	89 e5                	mov    %esp,%ebp
c0103a7f:	83 ec 10             	sub    $0x10,%esp
c0103a82:	8b 45 08             	mov    0x8(%ebp),%eax
c0103a85:	c1 e0 03             	shl    $0x3,%eax
c0103a88:	05 e0 06 11 c0       	add    $0xc01106e0,%eax
c0103a8d:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103a90:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103a93:	c6 40 04 00          	movb   $0x0,0x4(%eax)
c0103a97:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103a9a:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0103a9d:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0103aa0:	89 c2                	mov    %eax,%edx
c0103aa2:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103aa5:	66 89 10             	mov    %dx,(%eax)
c0103aa8:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103aab:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
c0103ab1:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0103ab4:	c1 f8 10             	sar    $0x10,%eax
c0103ab7:	89 c2                	mov    %eax,%edx
c0103ab9:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103abc:	66 89 50 06          	mov    %dx,0x6(%eax)
c0103ac0:	8b 45 10             	mov    0x10(%ebp),%eax
c0103ac3:	c1 e0 04             	shl    $0x4,%eax
c0103ac6:	89 c2                	mov    %eax,%edx
c0103ac8:	8b 45 14             	mov    0x14(%ebp),%eax
c0103acb:	09 d0                	or     %edx,%eax
c0103acd:	89 c2                	mov    %eax,%edx
c0103acf:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103ad2:	88 50 05             	mov    %dl,0x5(%eax)
c0103ad5:	90                   	nop
c0103ad6:	c9                   	leave  
c0103ad7:	c3                   	ret    

c0103ad8 <ReloadGDT>:
c0103ad8:	55                   	push   %ebp
c0103ad9:	89 e5                	mov    %esp,%ebp
c0103adb:	83 ec 28             	sub    $0x28,%esp
c0103ade:	b8 cc 06 11 c0       	mov    $0xc01106cc,%eax
c0103ae3:	0f b7 00             	movzwl (%eax),%eax
c0103ae6:	98                   	cwtl   
c0103ae7:	ba ce 06 11 c0       	mov    $0xc01106ce,%edx
c0103aec:	8b 12                	mov    (%edx),%edx
c0103aee:	83 ec 04             	sub    $0x4,%esp
c0103af1:	50                   	push   %eax
c0103af2:	52                   	push   %edx
c0103af3:	68 c0 f7 10 c0       	push   $0xc010f7c0
c0103af8:	e8 4c 7a 00 00       	call   c010b549 <Memcpy2>
c0103afd:	83 c4 10             	add    $0x10,%esp
c0103b00:	c7 45 f0 cc 06 11 c0 	movl   $0xc01106cc,-0x10(%ebp)
c0103b07:	c7 45 ec ce 06 11 c0 	movl   $0xc01106ce,-0x14(%ebp)
c0103b0e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103b11:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
c0103b16:	ba c0 f7 10 c0       	mov    $0xc010f7c0,%edx
c0103b1b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103b1e:	89 10                	mov    %edx,(%eax)
c0103b20:	c7 45 e8 88 f7 10 c0 	movl   $0xc010f788,-0x18(%ebp)
c0103b27:	c7 45 e4 8a f7 10 c0 	movl   $0xc010f78a,-0x1c(%ebp)
c0103b2e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103b31:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
c0103b36:	ba e0 06 11 c0       	mov    $0xc01106e0,%edx
c0103b3b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0103b3e:	89 10                	mov    %edx,(%eax)
c0103b40:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0103b47:	eb 04                	jmp    c0103b4d <ReloadGDT+0x75>
c0103b49:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0103b4d:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c0103b54:	7e f3                	jle    c0103b49 <ReloadGDT+0x71>
c0103b56:	e8 a9 37 00 00       	call   c0107304 <init_internal_interrupt>
c0103b5b:	e8 ae fd ff ff       	call   c010390e <init_propt>
c0103b60:	90                   	nop
c0103b61:	c9                   	leave  
c0103b62:	c3                   	ret    

c0103b63 <select_console>:
c0103b63:	55                   	push   %ebp
c0103b64:	89 e5                	mov    %esp,%ebp
c0103b66:	83 ec 18             	sub    $0x18,%esp
c0103b69:	8b 45 08             	mov    0x8(%ebp),%eax
c0103b6c:	88 45 f4             	mov    %al,-0xc(%ebp)
c0103b6f:	80 7d f4 00          	cmpb   $0x0,-0xc(%ebp)
c0103b73:	75 27                	jne    c0103b9c <select_console+0x39>
c0103b75:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
c0103b79:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0103b7f:	05 00 fe 10 c0       	add    $0xc010fe00,%eax
c0103b84:	a3 80 f7 10 c0       	mov    %eax,0xc010f780
c0103b89:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c0103b8e:	83 ec 0c             	sub    $0xc,%esp
c0103b91:	50                   	push   %eax
c0103b92:	e8 08 00 00 00       	call   c0103b9f <flush>
c0103b97:	83 c4 10             	add    $0x10,%esp
c0103b9a:	eb 01                	jmp    c0103b9d <select_console+0x3a>
c0103b9c:	90                   	nop
c0103b9d:	c9                   	leave  
c0103b9e:	c3                   	ret    

c0103b9f <flush>:
c0103b9f:	55                   	push   %ebp
c0103ba0:	89 e5                	mov    %esp,%ebp
c0103ba2:	83 ec 08             	sub    $0x8,%esp
c0103ba5:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ba8:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103bae:	8b 40 0c             	mov    0xc(%eax),%eax
c0103bb1:	83 ec 0c             	sub    $0xc,%esp
c0103bb4:	50                   	push   %eax
c0103bb5:	e8 1e 00 00 00       	call   c0103bd8 <set_cursor>
c0103bba:	83 c4 10             	add    $0x10,%esp
c0103bbd:	8b 45 08             	mov    0x8(%ebp),%eax
c0103bc0:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103bc6:	8b 40 08             	mov    0x8(%eax),%eax
c0103bc9:	83 ec 0c             	sub    $0xc,%esp
c0103bcc:	50                   	push   %eax
c0103bcd:	e8 64 00 00 00       	call   c0103c36 <set_console_start_video_addr>
c0103bd2:	83 c4 10             	add    $0x10,%esp
c0103bd5:	90                   	nop
c0103bd6:	c9                   	leave  
c0103bd7:	c3                   	ret    

c0103bd8 <set_cursor>:
c0103bd8:	55                   	push   %ebp
c0103bd9:	89 e5                	mov    %esp,%ebp
c0103bdb:	83 ec 08             	sub    $0x8,%esp
c0103bde:	83 ec 08             	sub    $0x8,%esp
c0103be1:	6a 0e                	push   $0xe
c0103be3:	68 d4 03 00 00       	push   $0x3d4
c0103be8:	e8 b8 c6 ff ff       	call   c01002a5 <out_byte>
c0103bed:	83 c4 10             	add    $0x10,%esp
c0103bf0:	8b 45 08             	mov    0x8(%ebp),%eax
c0103bf3:	c1 e8 08             	shr    $0x8,%eax
c0103bf6:	0f b7 c0             	movzwl %ax,%eax
c0103bf9:	83 ec 08             	sub    $0x8,%esp
c0103bfc:	50                   	push   %eax
c0103bfd:	68 d5 03 00 00       	push   $0x3d5
c0103c02:	e8 9e c6 ff ff       	call   c01002a5 <out_byte>
c0103c07:	83 c4 10             	add    $0x10,%esp
c0103c0a:	83 ec 08             	sub    $0x8,%esp
c0103c0d:	6a 0f                	push   $0xf
c0103c0f:	68 d4 03 00 00       	push   $0x3d4
c0103c14:	e8 8c c6 ff ff       	call   c01002a5 <out_byte>
c0103c19:	83 c4 10             	add    $0x10,%esp
c0103c1c:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c1f:	0f b7 c0             	movzwl %ax,%eax
c0103c22:	83 ec 08             	sub    $0x8,%esp
c0103c25:	50                   	push   %eax
c0103c26:	68 d5 03 00 00       	push   $0x3d5
c0103c2b:	e8 75 c6 ff ff       	call   c01002a5 <out_byte>
c0103c30:	83 c4 10             	add    $0x10,%esp
c0103c33:	90                   	nop
c0103c34:	c9                   	leave  
c0103c35:	c3                   	ret    

c0103c36 <set_console_start_video_addr>:
c0103c36:	55                   	push   %ebp
c0103c37:	89 e5                	mov    %esp,%ebp
c0103c39:	83 ec 08             	sub    $0x8,%esp
c0103c3c:	83 ec 08             	sub    $0x8,%esp
c0103c3f:	6a 0c                	push   $0xc
c0103c41:	68 d4 03 00 00       	push   $0x3d4
c0103c46:	e8 5a c6 ff ff       	call   c01002a5 <out_byte>
c0103c4b:	83 c4 10             	add    $0x10,%esp
c0103c4e:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c51:	c1 e8 08             	shr    $0x8,%eax
c0103c54:	0f b7 c0             	movzwl %ax,%eax
c0103c57:	83 ec 08             	sub    $0x8,%esp
c0103c5a:	50                   	push   %eax
c0103c5b:	68 d5 03 00 00       	push   $0x3d5
c0103c60:	e8 40 c6 ff ff       	call   c01002a5 <out_byte>
c0103c65:	83 c4 10             	add    $0x10,%esp
c0103c68:	83 ec 08             	sub    $0x8,%esp
c0103c6b:	6a 0d                	push   $0xd
c0103c6d:	68 d4 03 00 00       	push   $0x3d4
c0103c72:	e8 2e c6 ff ff       	call   c01002a5 <out_byte>
c0103c77:	83 c4 10             	add    $0x10,%esp
c0103c7a:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c7d:	0f b7 c0             	movzwl %ax,%eax
c0103c80:	83 ec 08             	sub    $0x8,%esp
c0103c83:	50                   	push   %eax
c0103c84:	68 d5 03 00 00       	push   $0x3d5
c0103c89:	e8 17 c6 ff ff       	call   c01002a5 <out_byte>
c0103c8e:	83 c4 10             	add    $0x10,%esp
c0103c91:	90                   	nop
c0103c92:	c9                   	leave  
c0103c93:	c3                   	ret    

c0103c94 <put_key>:
c0103c94:	55                   	push   %ebp
c0103c95:	89 e5                	mov    %esp,%ebp
c0103c97:	83 ec 04             	sub    $0x4,%esp
c0103c9a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103c9d:	88 45 fc             	mov    %al,-0x4(%ebp)
c0103ca0:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ca3:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0103ca9:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c0103cae:	77 4d                	ja     c0103cfd <put_key+0x69>
c0103cb0:	8b 45 08             	mov    0x8(%ebp),%eax
c0103cb3:	8b 00                	mov    (%eax),%eax
c0103cb5:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
c0103cb9:	89 10                	mov    %edx,(%eax)
c0103cbb:	8b 45 08             	mov    0x8(%ebp),%eax
c0103cbe:	8b 00                	mov    (%eax),%eax
c0103cc0:	8d 50 04             	lea    0x4(%eax),%edx
c0103cc3:	8b 45 08             	mov    0x8(%ebp),%eax
c0103cc6:	89 10                	mov    %edx,(%eax)
c0103cc8:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ccb:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0103cd1:	8d 50 01             	lea    0x1(%eax),%edx
c0103cd4:	8b 45 08             	mov    0x8(%ebp),%eax
c0103cd7:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0103cdd:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ce0:	8b 00                	mov    (%eax),%eax
c0103ce2:	8b 55 08             	mov    0x8(%ebp),%edx
c0103ce5:	83 c2 08             	add    $0x8,%edx
c0103ce8:	81 c2 00 08 00 00    	add    $0x800,%edx
c0103cee:	39 d0                	cmp    %edx,%eax
c0103cf0:	75 0b                	jne    c0103cfd <put_key+0x69>
c0103cf2:	8b 45 08             	mov    0x8(%ebp),%eax
c0103cf5:	8d 50 08             	lea    0x8(%eax),%edx
c0103cf8:	8b 45 08             	mov    0x8(%ebp),%eax
c0103cfb:	89 10                	mov    %edx,(%eax)
c0103cfd:	90                   	nop
c0103cfe:	c9                   	leave  
c0103cff:	c3                   	ret    

c0103d00 <scroll_up>:
c0103d00:	55                   	push   %ebp
c0103d01:	89 e5                	mov    %esp,%ebp
c0103d03:	83 ec 08             	sub    $0x8,%esp
c0103d06:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d09:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103d0f:	8b 40 08             	mov    0x8(%eax),%eax
c0103d12:	8d 50 b0             	lea    -0x50(%eax),%edx
c0103d15:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d18:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103d1e:	8b 00                	mov    (%eax),%eax
c0103d20:	39 c2                	cmp    %eax,%edx
c0103d22:	76 1b                	jbe    c0103d3f <scroll_up+0x3f>
c0103d24:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d27:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103d2d:	8b 40 08             	mov    0x8(%eax),%eax
c0103d30:	83 e8 50             	sub    $0x50,%eax
c0103d33:	83 ec 0c             	sub    $0xc,%esp
c0103d36:	50                   	push   %eax
c0103d37:	e8 fa fe ff ff       	call   c0103c36 <set_console_start_video_addr>
c0103d3c:	83 c4 10             	add    $0x10,%esp
c0103d3f:	90                   	nop
c0103d40:	c9                   	leave  
c0103d41:	c3                   	ret    

c0103d42 <scroll_down>:
c0103d42:	55                   	push   %ebp
c0103d43:	89 e5                	mov    %esp,%ebp
c0103d45:	83 ec 08             	sub    $0x8,%esp
c0103d48:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d4b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103d51:	8b 40 08             	mov    0x8(%eax),%eax
c0103d54:	8d 48 50             	lea    0x50(%eax),%ecx
c0103d57:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d5a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103d60:	8b 10                	mov    (%eax),%edx
c0103d62:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d65:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103d6b:	8b 40 04             	mov    0x4(%eax),%eax
c0103d6e:	01 d0                	add    %edx,%eax
c0103d70:	39 c1                	cmp    %eax,%ecx
c0103d72:	73 36                	jae    c0103daa <scroll_down+0x68>
c0103d74:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d77:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103d7d:	8b 40 08             	mov    0x8(%eax),%eax
c0103d80:	83 c0 50             	add    $0x50,%eax
c0103d83:	83 ec 0c             	sub    $0xc,%esp
c0103d86:	50                   	push   %eax
c0103d87:	e8 aa fe ff ff       	call   c0103c36 <set_console_start_video_addr>
c0103d8c:	83 c4 10             	add    $0x10,%esp
c0103d8f:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d92:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103d98:	8b 50 08             	mov    0x8(%eax),%edx
c0103d9b:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d9e:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103da4:	83 c2 50             	add    $0x50,%edx
c0103da7:	89 50 08             	mov    %edx,0x8(%eax)
c0103daa:	90                   	nop
c0103dab:	c9                   	leave  
c0103dac:	c3                   	ret    

c0103dad <out_char>:
c0103dad:	55                   	push   %ebp
c0103dae:	89 e5                	mov    %esp,%ebp
c0103db0:	83 ec 28             	sub    $0x28,%esp
c0103db3:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103db6:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0103db9:	e8 a7 2d 00 00       	call   c0106b65 <intr_disable>
c0103dbe:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103dc1:	8b 45 08             	mov    0x8(%ebp),%eax
c0103dc4:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103dca:	8b 40 0c             	mov    0xc(%eax),%eax
c0103dcd:	05 00 c0 05 60       	add    $0x6005c000,%eax
c0103dd2:	01 c0                	add    %eax,%eax
c0103dd4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103dd7:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
c0103ddb:	83 f8 08             	cmp    $0x8,%eax
c0103dde:	0f 84 8d 00 00 00    	je     c0103e71 <out_char+0xc4>
c0103de4:	83 f8 0a             	cmp    $0xa,%eax
c0103de7:	0f 85 c9 00 00 00    	jne    c0103eb6 <out_char+0x109>
c0103ded:	8b 45 08             	mov    0x8(%ebp),%eax
c0103df0:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103df6:	8b 50 0c             	mov    0xc(%eax),%edx
c0103df9:	8b 45 08             	mov    0x8(%ebp),%eax
c0103dfc:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e02:	8b 08                	mov    (%eax),%ecx
c0103e04:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e07:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e0d:	8b 40 04             	mov    0x4(%eax),%eax
c0103e10:	01 c8                	add    %ecx,%eax
c0103e12:	83 e8 50             	sub    $0x50,%eax
c0103e15:	39 c2                	cmp    %eax,%edx
c0103e17:	0f 83 f4 00 00 00    	jae    c0103f11 <out_char+0x164>
c0103e1d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e20:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e26:	8b 08                	mov    (%eax),%ecx
c0103e28:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e2b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e31:	8b 50 0c             	mov    0xc(%eax),%edx
c0103e34:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e37:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e3d:	8b 00                	mov    (%eax),%eax
c0103e3f:	29 c2                	sub    %eax,%edx
c0103e41:	89 d0                	mov    %edx,%eax
c0103e43:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
c0103e48:	f7 e2                	mul    %edx
c0103e4a:	89 d0                	mov    %edx,%eax
c0103e4c:	c1 e8 06             	shr    $0x6,%eax
c0103e4f:	8d 50 01             	lea    0x1(%eax),%edx
c0103e52:	89 d0                	mov    %edx,%eax
c0103e54:	c1 e0 02             	shl    $0x2,%eax
c0103e57:	01 d0                	add    %edx,%eax
c0103e59:	c1 e0 04             	shl    $0x4,%eax
c0103e5c:	89 c2                	mov    %eax,%edx
c0103e5e:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e61:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e67:	01 ca                	add    %ecx,%edx
c0103e69:	89 50 0c             	mov    %edx,0xc(%eax)
c0103e6c:	e9 a0 00 00 00       	jmp    c0103f11 <out_char+0x164>
c0103e71:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e74:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e7a:	8b 50 0c             	mov    0xc(%eax),%edx
c0103e7d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e80:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e86:	8b 00                	mov    (%eax),%eax
c0103e88:	39 c2                	cmp    %eax,%edx
c0103e8a:	0f 86 84 00 00 00    	jbe    c0103f14 <out_char+0x167>
c0103e90:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e93:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e99:	8b 50 0c             	mov    0xc(%eax),%edx
c0103e9c:	83 ea 01             	sub    $0x1,%edx
c0103e9f:	89 50 0c             	mov    %edx,0xc(%eax)
c0103ea2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103ea5:	83 e8 02             	sub    $0x2,%eax
c0103ea8:	c6 00 20             	movb   $0x20,(%eax)
c0103eab:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103eae:	83 e8 01             	sub    $0x1,%eax
c0103eb1:	c6 00 00             	movb   $0x0,(%eax)
c0103eb4:	eb 5e                	jmp    c0103f14 <out_char+0x167>
c0103eb6:	8b 45 08             	mov    0x8(%ebp),%eax
c0103eb9:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103ebf:	8b 40 0c             	mov    0xc(%eax),%eax
c0103ec2:	8d 48 01             	lea    0x1(%eax),%ecx
c0103ec5:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ec8:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103ece:	8b 10                	mov    (%eax),%edx
c0103ed0:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ed3:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103ed9:	8b 40 04             	mov    0x4(%eax),%eax
c0103edc:	01 d0                	add    %edx,%eax
c0103ede:	39 c1                	cmp    %eax,%ecx
c0103ee0:	73 35                	jae    c0103f17 <out_char+0x16a>
c0103ee2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103ee5:	8d 50 01             	lea    0x1(%eax),%edx
c0103ee8:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0103eeb:	0f b6 55 e4          	movzbl -0x1c(%ebp),%edx
c0103eef:	88 10                	mov    %dl,(%eax)
c0103ef1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103ef4:	8d 50 01             	lea    0x1(%eax),%edx
c0103ef7:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0103efa:	c6 00 0a             	movb   $0xa,(%eax)
c0103efd:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f00:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f06:	8b 50 0c             	mov    0xc(%eax),%edx
c0103f09:	83 c2 01             	add    $0x1,%edx
c0103f0c:	89 50 0c             	mov    %edx,0xc(%eax)
c0103f0f:	eb 06                	jmp    c0103f17 <out_char+0x16a>
c0103f11:	90                   	nop
c0103f12:	eb 14                	jmp    c0103f28 <out_char+0x17b>
c0103f14:	90                   	nop
c0103f15:	eb 11                	jmp    c0103f28 <out_char+0x17b>
c0103f17:	90                   	nop
c0103f18:	eb 0e                	jmp    c0103f28 <out_char+0x17b>
c0103f1a:	83 ec 0c             	sub    $0xc,%esp
c0103f1d:	ff 75 08             	pushl  0x8(%ebp)
c0103f20:	e8 1d fe ff ff       	call   c0103d42 <scroll_down>
c0103f25:	83 c4 10             	add    $0x10,%esp
c0103f28:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f2b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f31:	8b 50 0c             	mov    0xc(%eax),%edx
c0103f34:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f37:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103f3d:	8b 40 08             	mov    0x8(%eax),%eax
c0103f40:	29 c2                	sub    %eax,%edx
c0103f42:	89 d0                	mov    %edx,%eax
c0103f44:	3d d0 07 00 00       	cmp    $0x7d0,%eax
c0103f49:	77 cf                	ja     c0103f1a <out_char+0x16d>
c0103f4b:	83 ec 0c             	sub    $0xc,%esp
c0103f4e:	ff 75 08             	pushl  0x8(%ebp)
c0103f51:	e8 49 fc ff ff       	call   c0103b9f <flush>
c0103f56:	83 c4 10             	add    $0x10,%esp
c0103f59:	83 ec 0c             	sub    $0xc,%esp
c0103f5c:	ff 75 f4             	pushl  -0xc(%ebp)
c0103f5f:	e8 2a 2c 00 00       	call   c0106b8e <intr_set_status>
c0103f64:	83 c4 10             	add    $0x10,%esp
c0103f67:	90                   	nop
c0103f68:	c9                   	leave  
c0103f69:	c3                   	ret    

c0103f6a <tty_dev_read>:
c0103f6a:	55                   	push   %ebp
c0103f6b:	89 e5                	mov    %esp,%ebp
c0103f6d:	83 ec 08             	sub    $0x8,%esp
c0103f70:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c0103f75:	39 45 08             	cmp    %eax,0x8(%ebp)
c0103f78:	75 17                	jne    c0103f91 <tty_dev_read+0x27>
c0103f7a:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c0103f7f:	85 c0                	test   %eax,%eax
c0103f81:	7e 0e                	jle    c0103f91 <tty_dev_read+0x27>
c0103f83:	83 ec 0c             	sub    $0xc,%esp
c0103f86:	ff 75 08             	pushl  0x8(%ebp)
c0103f89:	e8 89 07 00 00       	call   c0104717 <keyboard_read>
c0103f8e:	83 c4 10             	add    $0x10,%esp
c0103f91:	90                   	nop
c0103f92:	c9                   	leave  
c0103f93:	c3                   	ret    

c0103f94 <tty_dev_write>:
c0103f94:	55                   	push   %ebp
c0103f95:	89 e5                	mov    %esp,%ebp
c0103f97:	83 ec 28             	sub    $0x28,%esp
c0103f9a:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f9d:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0103fa3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103fa6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0103fad:	e9 88 01 00 00       	jmp    c010413a <tty_dev_write+0x1a6>
c0103fb2:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fb5:	8b 40 04             	mov    0x4(%eax),%eax
c0103fb8:	8b 00                	mov    (%eax),%eax
c0103fba:	88 45 e7             	mov    %al,-0x19(%ebp)
c0103fbd:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fc0:	8b 40 04             	mov    0x4(%eax),%eax
c0103fc3:	8d 50 04             	lea    0x4(%eax),%edx
c0103fc6:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fc9:	89 50 04             	mov    %edx,0x4(%eax)
c0103fcc:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fcf:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0103fd5:	8d 50 ff             	lea    -0x1(%eax),%edx
c0103fd8:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fdb:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0103fe1:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fe4:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c0103fea:	8d 50 01             	lea    0x1(%eax),%edx
c0103fed:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ff0:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0103ff6:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ff9:	8b 40 04             	mov    0x4(%eax),%eax
c0103ffc:	8b 55 08             	mov    0x8(%ebp),%edx
c0103fff:	83 c2 08             	add    $0x8,%edx
c0104002:	81 c2 00 08 00 00    	add    $0x800,%edx
c0104008:	39 d0                	cmp    %edx,%eax
c010400a:	75 0c                	jne    c0104018 <tty_dev_write+0x84>
c010400c:	8b 45 08             	mov    0x8(%ebp),%eax
c010400f:	8d 50 08             	lea    0x8(%eax),%edx
c0104012:	8b 45 08             	mov    0x8(%ebp),%eax
c0104015:	89 50 04             	mov    %edx,0x4(%eax)
c0104018:	8b 45 08             	mov    0x8(%ebp),%eax
c010401b:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0104021:	85 c0                	test   %eax,%eax
c0104023:	0f 84 11 01 00 00    	je     c010413a <tty_dev_write+0x1a6>
c0104029:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c010402d:	3c 20                	cmp    $0x20,%al
c010402f:	76 08                	jbe    c0104039 <tty_dev_write+0xa5>
c0104031:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104035:	3c 7e                	cmp    $0x7e,%al
c0104037:	76 10                	jbe    c0104049 <tty_dev_write+0xb5>
c0104039:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c010403d:	3c 20                	cmp    $0x20,%al
c010403f:	74 08                	je     c0104049 <tty_dev_write+0xb5>
c0104041:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0104045:	84 c0                	test   %al,%al
c0104047:	75 58                	jne    c01040a1 <tty_dev_write+0x10d>
c0104049:	8b 45 08             	mov    0x8(%ebp),%eax
c010404c:	8b 90 18 08 00 00    	mov    0x818(%eax),%edx
c0104052:	8b 45 08             	mov    0x8(%ebp),%eax
c0104055:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c010405b:	01 d0                	add    %edx,%eax
c010405d:	83 e8 01             	sub    $0x1,%eax
c0104060:	89 c2                	mov    %eax,%edx
c0104062:	83 ec 04             	sub    $0x4,%esp
c0104065:	6a 01                	push   $0x1
c0104067:	8d 45 e7             	lea    -0x19(%ebp),%eax
c010406a:	50                   	push   %eax
c010406b:	52                   	push   %edx
c010406c:	e8 58 2b 00 00       	call   c0106bc9 <Memcpy>
c0104071:	83 c4 10             	add    $0x10,%esp
c0104074:	8b 45 08             	mov    0x8(%ebp),%eax
c0104077:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c010407d:	8d 50 ff             	lea    -0x1(%eax),%edx
c0104080:	8b 45 08             	mov    0x8(%ebp),%eax
c0104083:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c0104089:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c010408d:	0f b6 c0             	movzbl %al,%eax
c0104090:	83 ec 08             	sub    $0x8,%esp
c0104093:	50                   	push   %eax
c0104094:	ff 75 08             	pushl  0x8(%ebp)
c0104097:	e8 11 fd ff ff       	call   c0103dad <out_char>
c010409c:	83 c4 10             	add    $0x10,%esp
c010409f:	eb 7c                	jmp    c010411d <tty_dev_write+0x189>
c01040a1:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c01040a5:	3c 08                	cmp    $0x8,%al
c01040a7:	75 42                	jne    c01040eb <tty_dev_write+0x157>
c01040a9:	8b 45 08             	mov    0x8(%ebp),%eax
c01040ac:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c01040b2:	8d 50 01             	lea    0x1(%eax),%edx
c01040b5:	8b 45 08             	mov    0x8(%ebp),%eax
c01040b8:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c01040be:	8b 45 08             	mov    0x8(%ebp),%eax
c01040c1:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c01040c7:	8d 50 fe             	lea    -0x2(%eax),%edx
c01040ca:	8b 45 08             	mov    0x8(%ebp),%eax
c01040cd:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c01040d3:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c01040d7:	0f b6 c0             	movzbl %al,%eax
c01040da:	83 ec 08             	sub    $0x8,%esp
c01040dd:	50                   	push   %eax
c01040de:	ff 75 08             	pushl  0x8(%ebp)
c01040e1:	e8 c7 fc ff ff       	call   c0103dad <out_char>
c01040e6:	83 c4 10             	add    $0x10,%esp
c01040e9:	eb 32                	jmp    c010411d <tty_dev_write+0x189>
c01040eb:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c01040ef:	3c 0a                	cmp    $0xa,%al
c01040f1:	75 2a                	jne    c010411d <tty_dev_write+0x189>
c01040f3:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c01040f7:	0f b6 c0             	movzbl %al,%eax
c01040fa:	83 ec 08             	sub    $0x8,%esp
c01040fd:	50                   	push   %eax
c01040fe:	ff 75 08             	pushl  0x8(%ebp)
c0104101:	e8 a7 fc ff ff       	call   c0103dad <out_char>
c0104106:	83 c4 10             	add    $0x10,%esp
c0104109:	8b 45 08             	mov    0x8(%ebp),%eax
c010410c:	c7 80 0c 08 00 00 00 	movl   $0x0,0x80c(%eax)
c0104113:	00 00 00 
c0104116:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c010411d:	8b 45 08             	mov    0x8(%ebp),%eax
c0104120:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0104126:	8b 45 08             	mov    0x8(%ebp),%eax
c0104129:	8b 80 14 08 00 00    	mov    0x814(%eax),%eax
c010412f:	39 c2                	cmp    %eax,%edx
c0104131:	75 07                	jne    c010413a <tty_dev_write+0x1a6>
c0104133:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c010413a:	8b 45 08             	mov    0x8(%ebp),%eax
c010413d:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0104143:	85 c0                	test   %eax,%eax
c0104145:	0f 85 67 fe ff ff    	jne    c0103fb2 <tty_dev_write+0x1e>
c010414b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010414f:	74 6d                	je     c01041be <tty_dev_write+0x22a>
c0104151:	c7 45 ec 7c 00 00 00 	movl   $0x7c,-0x14(%ebp)
c0104158:	83 ec 0c             	sub    $0xc,%esp
c010415b:	ff 75 ec             	pushl  -0x14(%ebp)
c010415e:	e8 c9 d3 ff ff       	call   c010152c <sys_malloc>
c0104163:	83 c4 10             	add    $0x10,%esp
c0104166:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0104169:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010416c:	c7 40 78 66 00 00 00 	movl   $0x66,0x78(%eax)
c0104173:	8b 45 08             	mov    0x8(%ebp),%eax
c0104176:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c010417c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010417f:	89 50 60             	mov    %edx,0x60(%eax)
c0104182:	8b 45 08             	mov    0x8(%ebp),%eax
c0104185:	8b 90 20 08 00 00    	mov    0x820(%eax),%edx
c010418b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010418e:	89 50 68             	mov    %edx,0x68(%eax)
c0104191:	8b 45 08             	mov    0x8(%ebp),%eax
c0104194:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c010419a:	83 ec 04             	sub    $0x4,%esp
c010419d:	50                   	push   %eax
c010419e:	ff 75 e8             	pushl  -0x18(%ebp)
c01041a1:	6a 01                	push   $0x1
c01041a3:	e8 85 52 00 00       	call   c010942d <send_rec>
c01041a8:	83 c4 10             	add    $0x10,%esp
c01041ab:	83 ec 08             	sub    $0x8,%esp
c01041ae:	ff 75 ec             	pushl  -0x14(%ebp)
c01041b1:	ff 75 e8             	pushl  -0x18(%ebp)
c01041b4:	e8 88 d3 ff ff       	call   c0101541 <sys_free>
c01041b9:	83 c4 10             	add    $0x10,%esp
c01041bc:	eb 01                	jmp    c01041bf <tty_dev_write+0x22b>
c01041be:	90                   	nop
c01041bf:	c9                   	leave  
c01041c0:	c3                   	ret    

c01041c1 <tty_do_read>:
c01041c1:	55                   	push   %ebp
c01041c2:	89 e5                	mov    %esp,%ebp
c01041c4:	83 ec 08             	sub    $0x8,%esp
c01041c7:	8b 45 08             	mov    0x8(%ebp),%eax
c01041ca:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c01041d1:	00 00 00 
c01041d4:	8b 45 0c             	mov    0xc(%ebp),%eax
c01041d7:	8b 50 68             	mov    0x68(%eax),%edx
c01041da:	8b 45 08             	mov    0x8(%ebp),%eax
c01041dd:	89 90 20 08 00 00    	mov    %edx,0x820(%eax)
c01041e3:	8b 45 0c             	mov    0xc(%ebp),%eax
c01041e6:	8b 00                	mov    (%eax),%eax
c01041e8:	89 c2                	mov    %eax,%edx
c01041ea:	8b 45 08             	mov    0x8(%ebp),%eax
c01041ed:	89 90 1c 08 00 00    	mov    %edx,0x81c(%eax)
c01041f3:	8b 45 0c             	mov    0xc(%ebp),%eax
c01041f6:	8b 50 60             	mov    0x60(%eax),%edx
c01041f9:	8b 45 08             	mov    0x8(%ebp),%eax
c01041fc:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c0104202:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104205:	8b 50 60             	mov    0x60(%eax),%edx
c0104208:	8b 45 08             	mov    0x8(%ebp),%eax
c010420b:	89 90 14 08 00 00    	mov    %edx,0x814(%eax)
c0104211:	8b 45 08             	mov    0x8(%ebp),%eax
c0104214:	8b 90 0c 08 00 00    	mov    0x80c(%eax),%edx
c010421a:	8b 45 0c             	mov    0xc(%ebp),%eax
c010421d:	8b 40 10             	mov    0x10(%eax),%eax
c0104220:	83 ec 08             	sub    $0x8,%esp
c0104223:	52                   	push   %edx
c0104224:	50                   	push   %eax
c0104225:	e8 32 1b 00 00       	call   c0105d5c <alloc_virtual_memory>
c010422a:	83 c4 10             	add    $0x10,%esp
c010422d:	89 c2                	mov    %eax,%edx
c010422f:	8b 45 08             	mov    0x8(%ebp),%eax
c0104232:	89 90 18 08 00 00    	mov    %edx,0x818(%eax)
c0104238:	8b 45 08             	mov    0x8(%ebp),%eax
c010423b:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c0104241:	83 f8 02             	cmp    $0x2,%eax
c0104244:	74 1c                	je     c0104262 <tty_do_read+0xa1>
c0104246:	68 3b 01 00 00       	push   $0x13b
c010424b:	68 d1 a8 10 c0       	push   $0xc010a8d1
c0104250:	68 d1 a8 10 c0       	push   $0xc010a8d1
c0104255:	68 db a8 10 c0       	push   $0xc010a8db
c010425a:	e8 5e 45 00 00       	call   c01087bd <assertion_failure>
c010425f:	83 c4 10             	add    $0x10,%esp
c0104262:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104265:	c7 40 78 67 00 00 00 	movl   $0x67,0x78(%eax)
c010426c:	8b 45 08             	mov    0x8(%ebp),%eax
c010426f:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c0104275:	83 ec 04             	sub    $0x4,%esp
c0104278:	50                   	push   %eax
c0104279:	ff 75 0c             	pushl  0xc(%ebp)
c010427c:	6a 01                	push   $0x1
c010427e:	e8 aa 51 00 00       	call   c010942d <send_rec>
c0104283:	83 c4 10             	add    $0x10,%esp
c0104286:	90                   	nop
c0104287:	c9                   	leave  
c0104288:	c3                   	ret    

c0104289 <tty_do_write>:
c0104289:	55                   	push   %ebp
c010428a:	89 e5                	mov    %esp,%ebp
c010428c:	53                   	push   %ebx
c010428d:	83 ec 24             	sub    $0x24,%esp
c0104290:	89 e0                	mov    %esp,%eax
c0104292:	89 c3                	mov    %eax,%ebx
c0104294:	c7 45 e8 80 00 00 00 	movl   $0x80,-0x18(%ebp)
c010429b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010429e:	8d 50 ff             	lea    -0x1(%eax),%edx
c01042a1:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c01042a4:	89 c2                	mov    %eax,%edx
c01042a6:	b8 10 00 00 00       	mov    $0x10,%eax
c01042ab:	83 e8 01             	sub    $0x1,%eax
c01042ae:	01 d0                	add    %edx,%eax
c01042b0:	b9 10 00 00 00       	mov    $0x10,%ecx
c01042b5:	ba 00 00 00 00       	mov    $0x0,%edx
c01042ba:	f7 f1                	div    %ecx
c01042bc:	6b c0 10             	imul   $0x10,%eax,%eax
c01042bf:	29 c4                	sub    %eax,%esp
c01042c1:	89 e0                	mov    %esp,%eax
c01042c3:	83 c0 00             	add    $0x0,%eax
c01042c6:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01042c9:	83 ec 04             	sub    $0x4,%esp
c01042cc:	ff 75 e8             	pushl  -0x18(%ebp)
c01042cf:	6a 00                	push   $0x0
c01042d1:	ff 75 e0             	pushl  -0x20(%ebp)
c01042d4:	e8 9e 72 00 00       	call   c010b577 <Memset>
c01042d9:	83 c4 10             	add    $0x10,%esp
c01042dc:	8b 45 0c             	mov    0xc(%ebp),%eax
c01042df:	8b 40 60             	mov    0x60(%eax),%eax
c01042e2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01042e5:	8b 45 08             	mov    0x8(%ebp),%eax
c01042e8:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c01042ef:	00 00 00 
c01042f2:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01042f5:	8b 45 0c             	mov    0xc(%ebp),%eax
c01042f8:	8b 40 10             	mov    0x10(%eax),%eax
c01042fb:	83 ec 08             	sub    $0x8,%esp
c01042fe:	52                   	push   %edx
c01042ff:	50                   	push   %eax
c0104300:	e8 57 1a 00 00       	call   c0105d5c <alloc_virtual_memory>
c0104305:	83 c4 10             	add    $0x10,%esp
c0104308:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010430b:	eb 7e                	jmp    c010438b <tty_do_write+0x102>
c010430d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104310:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c0104313:	0f 4e 45 ec          	cmovle -0x14(%ebp),%eax
c0104317:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010431a:	8b 45 08             	mov    0x8(%ebp),%eax
c010431d:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0104323:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104326:	01 d0                	add    %edx,%eax
c0104328:	83 ec 04             	sub    $0x4,%esp
c010432b:	ff 75 f0             	pushl  -0x10(%ebp)
c010432e:	50                   	push   %eax
c010432f:	ff 75 e0             	pushl  -0x20(%ebp)
c0104332:	e8 92 28 00 00       	call   c0106bc9 <Memcpy>
c0104337:	83 c4 10             	add    $0x10,%esp
c010433a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010433d:	29 45 ec             	sub    %eax,-0x14(%ebp)
c0104340:	8b 45 08             	mov    0x8(%ebp),%eax
c0104343:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0104349:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010434c:	01 c2                	add    %eax,%edx
c010434e:	8b 45 08             	mov    0x8(%ebp),%eax
c0104351:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0104357:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010435e:	eb 25                	jmp    c0104385 <tty_do_write+0xfc>
c0104360:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0104363:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104366:	01 d0                	add    %edx,%eax
c0104368:	0f b6 00             	movzbl (%eax),%eax
c010436b:	0f b6 c0             	movzbl %al,%eax
c010436e:	83 ec 08             	sub    $0x8,%esp
c0104371:	50                   	push   %eax
c0104372:	ff 75 08             	pushl  0x8(%ebp)
c0104375:	e8 33 fa ff ff       	call   c0103dad <out_char>
c010437a:	83 c4 10             	add    $0x10,%esp
c010437d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0104381:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c0104385:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0104389:	75 d5                	jne    c0104360 <tty_do_write+0xd7>
c010438b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c010438f:	0f 85 78 ff ff ff    	jne    c010430d <tty_do_write+0x84>
c0104395:	83 ec 0c             	sub    $0xc,%esp
c0104398:	6a 7c                	push   $0x7c
c010439a:	e8 8d d1 ff ff       	call   c010152c <sys_malloc>
c010439f:	83 c4 10             	add    $0x10,%esp
c01043a2:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01043a5:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01043a8:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c01043af:	8b 45 08             	mov    0x8(%ebp),%eax
c01043b2:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c01043b8:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01043bb:	89 50 58             	mov    %edx,0x58(%eax)
c01043be:	8b 45 0c             	mov    0xc(%ebp),%eax
c01043c1:	8b 00                	mov    (%eax),%eax
c01043c3:	83 ec 04             	sub    $0x4,%esp
c01043c6:	50                   	push   %eax
c01043c7:	ff 75 d8             	pushl  -0x28(%ebp)
c01043ca:	6a 01                	push   $0x1
c01043cc:	e8 5c 50 00 00       	call   c010942d <send_rec>
c01043d1:	83 c4 10             	add    $0x10,%esp
c01043d4:	83 ec 08             	sub    $0x8,%esp
c01043d7:	6a 7c                	push   $0x7c
c01043d9:	ff 75 d8             	pushl  -0x28(%ebp)
c01043dc:	e8 60 d1 ff ff       	call   c0101541 <sys_free>
c01043e1:	83 c4 10             	add    $0x10,%esp
c01043e4:	89 dc                	mov    %ebx,%esp
c01043e6:	90                   	nop
c01043e7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01043ea:	c9                   	leave  
c01043eb:	c3                   	ret    

c01043ec <init_screen>:
c01043ec:	55                   	push   %ebp
c01043ed:	89 e5                	mov    %esp,%ebp
c01043ef:	83 ec 10             	sub    $0x10,%esp
c01043f2:	8b 45 08             	mov    0x8(%ebp),%eax
c01043f5:	2d 00 fe 10 c0       	sub    $0xc010fe00,%eax
c01043fa:	c1 f8 03             	sar    $0x3,%eax
c01043fd:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c0104403:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0104406:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0104409:	c1 e0 04             	shl    $0x4,%eax
c010440c:	8d 90 14 0f 11 c0    	lea    -0x3feef0ec(%eax),%edx
c0104412:	8b 45 08             	mov    0x8(%ebp),%eax
c0104415:	89 90 24 08 00 00    	mov    %edx,0x824(%eax)
c010441b:	c7 45 f8 ff 3f 00 00 	movl   $0x3fff,-0x8(%ebp)
c0104422:	8b 45 08             	mov    0x8(%ebp),%eax
c0104425:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c010442b:	8b 55 f8             	mov    -0x8(%ebp),%edx
c010442e:	89 50 04             	mov    %edx,0x4(%eax)
c0104431:	8b 45 08             	mov    0x8(%ebp),%eax
c0104434:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c010443a:	8b 50 04             	mov    0x4(%eax),%edx
c010443d:	8b 45 08             	mov    0x8(%ebp),%eax
c0104440:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104446:	0f af 55 fc          	imul   -0x4(%ebp),%edx
c010444a:	89 10                	mov    %edx,(%eax)
c010444c:	8b 45 08             	mov    0x8(%ebp),%eax
c010444f:	8b 90 24 08 00 00    	mov    0x824(%eax),%edx
c0104455:	8b 45 08             	mov    0x8(%ebp),%eax
c0104458:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c010445e:	8b 12                	mov    (%edx),%edx
c0104460:	89 50 08             	mov    %edx,0x8(%eax)
c0104463:	8b 55 08             	mov    0x8(%ebp),%edx
c0104466:	8b 92 24 08 00 00    	mov    0x824(%edx),%edx
c010446c:	8b 40 08             	mov    0x8(%eax),%eax
c010446f:	89 42 0c             	mov    %eax,0xc(%edx)
c0104472:	90                   	nop
c0104473:	c9                   	leave  
c0104474:	c3                   	ret    

c0104475 <init_tty>:
c0104475:	55                   	push   %ebp
c0104476:	89 e5                	mov    %esp,%ebp
c0104478:	83 ec 18             	sub    $0x18,%esp
c010447b:	c7 45 f4 00 fe 10 c0 	movl   $0xc010fe00,-0xc(%ebp)
c0104482:	e9 92 00 00 00       	jmp    c0104519 <init_tty+0xa4>
c0104487:	83 ec 04             	sub    $0x4,%esp
c010448a:	68 28 08 00 00       	push   $0x828
c010448f:	6a 00                	push   $0x0
c0104491:	ff 75 f4             	pushl  -0xc(%ebp)
c0104494:	e8 de 70 00 00       	call   c010b577 <Memset>
c0104499:	83 c4 10             	add    $0x10,%esp
c010449c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010449f:	8d 50 08             	lea    0x8(%eax),%edx
c01044a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01044a5:	89 50 04             	mov    %edx,0x4(%eax)
c01044a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01044ab:	8b 50 04             	mov    0x4(%eax),%edx
c01044ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01044b1:	89 10                	mov    %edx,(%eax)
c01044b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01044b6:	c7 80 08 08 00 00 00 	movl   $0x0,0x808(%eax)
c01044bd:	00 00 00 
c01044c0:	83 ec 0c             	sub    $0xc,%esp
c01044c3:	ff 75 f4             	pushl  -0xc(%ebp)
c01044c6:	e8 21 ff ff ff       	call   c01043ec <init_screen>
c01044cb:	83 c4 10             	add    $0x10,%esp
c01044ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01044d1:	2d 00 fe 10 c0       	sub    $0xc010fe00,%eax
c01044d6:	85 c0                	test   %eax,%eax
c01044d8:	7e 38                	jle    c0104512 <init_tty+0x9d>
c01044da:	83 ec 08             	sub    $0x8,%esp
c01044dd:	6a 23                	push   $0x23
c01044df:	ff 75 f4             	pushl  -0xc(%ebp)
c01044e2:	e8 c6 f8 ff ff       	call   c0103dad <out_char>
c01044e7:	83 c4 10             	add    $0x10,%esp
c01044ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01044ed:	05 a8 8f 01 00       	add    $0x18fa8,%eax
c01044f2:	2d 00 fe 10 c0       	sub    $0xc010fe00,%eax
c01044f7:	c1 f8 03             	sar    $0x3,%eax
c01044fa:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c0104500:	0f b6 c0             	movzbl %al,%eax
c0104503:	83 ec 08             	sub    $0x8,%esp
c0104506:	50                   	push   %eax
c0104507:	ff 75 f4             	pushl  -0xc(%ebp)
c010450a:	e8 9e f8 ff ff       	call   c0103dad <out_char>
c010450f:	83 c4 10             	add    $0x10,%esp
c0104512:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c0104519:	b8 28 06 11 c0       	mov    $0xc0110628,%eax
c010451e:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0104521:	0f 82 60 ff ff ff    	jb     c0104487 <init_tty+0x12>
c0104527:	90                   	nop
c0104528:	c9                   	leave  
c0104529:	c3                   	ret    

c010452a <TaskTTY>:
c010452a:	55                   	push   %ebp
c010452b:	89 e5                	mov    %esp,%ebp
c010452d:	83 ec 28             	sub    $0x28,%esp
c0104530:	e8 40 ff ff ff       	call   c0104475 <init_tty>
c0104535:	83 ec 0c             	sub    $0xc,%esp
c0104538:	6a 00                	push   $0x0
c010453a:	e8 24 f6 ff ff       	call   c0103b63 <select_console>
c010453f:	83 c4 10             	add    $0x10,%esp
c0104542:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0104549:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0104550:	83 ec 0c             	sub    $0xc,%esp
c0104553:	6a 7c                	push   $0x7c
c0104555:	e8 d2 cf ff ff       	call   c010152c <sys_malloc>
c010455a:	83 c4 10             	add    $0x10,%esp
c010455d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0104560:	c7 45 f4 00 fe 10 c0 	movl   $0xc010fe00,-0xc(%ebp)
c0104567:	eb 30                	jmp    c0104599 <TaskTTY+0x6f>
c0104569:	83 ec 0c             	sub    $0xc,%esp
c010456c:	ff 75 f4             	pushl  -0xc(%ebp)
c010456f:	e8 f6 f9 ff ff       	call   c0103f6a <tty_dev_read>
c0104574:	83 c4 10             	add    $0x10,%esp
c0104577:	83 ec 0c             	sub    $0xc,%esp
c010457a:	ff 75 f4             	pushl  -0xc(%ebp)
c010457d:	e8 12 fa ff ff       	call   c0103f94 <tty_dev_write>
c0104582:	83 c4 10             	add    $0x10,%esp
c0104585:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104588:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c010458e:	85 c0                	test   %eax,%eax
c0104590:	75 d7                	jne    c0104569 <TaskTTY+0x3f>
c0104592:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c0104599:	b8 28 06 11 c0       	mov    $0xc0110628,%eax
c010459e:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c01045a1:	72 c6                	jb     c0104569 <TaskTTY+0x3f>
c01045a3:	83 ec 04             	sub    $0x4,%esp
c01045a6:	6a 12                	push   $0x12
c01045a8:	ff 75 e8             	pushl  -0x18(%ebp)
c01045ab:	6a 02                	push   $0x2
c01045ad:	e8 7b 4e 00 00       	call   c010942d <send_rec>
c01045b2:	83 c4 10             	add    $0x10,%esp
c01045b5:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01045b8:	8b 40 78             	mov    0x78(%eax),%eax
c01045bb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01045be:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c01045c5:	74 28                	je     c01045ef <TaskTTY+0xc5>
c01045c7:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c01045ce:	7f 0b                	jg     c01045db <TaskTTY+0xb1>
c01045d0:	81 7d e4 d1 07 00 00 	cmpl   $0x7d1,-0x1c(%ebp)
c01045d7:	74 4e                	je     c0104627 <TaskTTY+0xfd>
c01045d9:	eb 4d                	jmp    c0104628 <TaskTTY+0xfe>
c01045db:	81 7d e4 d3 07 00 00 	cmpl   $0x7d3,-0x1c(%ebp)
c01045e2:	74 21                	je     c0104605 <TaskTTY+0xdb>
c01045e4:	81 7d e4 d5 07 00 00 	cmpl   $0x7d5,-0x1c(%ebp)
c01045eb:	74 2e                	je     c010461b <TaskTTY+0xf1>
c01045ed:	eb 39                	jmp    c0104628 <TaskTTY+0xfe>
c01045ef:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c01045f4:	83 ec 08             	sub    $0x8,%esp
c01045f7:	ff 75 e8             	pushl  -0x18(%ebp)
c01045fa:	50                   	push   %eax
c01045fb:	e8 c1 fb ff ff       	call   c01041c1 <tty_do_read>
c0104600:	83 c4 10             	add    $0x10,%esp
c0104603:	eb 23                	jmp    c0104628 <TaskTTY+0xfe>
c0104605:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c010460a:	83 ec 08             	sub    $0x8,%esp
c010460d:	ff 75 e8             	pushl  -0x18(%ebp)
c0104610:	50                   	push   %eax
c0104611:	e8 73 fc ff ff       	call   c0104289 <tty_do_write>
c0104616:	83 c4 10             	add    $0x10,%esp
c0104619:	eb 0d                	jmp    c0104628 <TaskTTY+0xfe>
c010461b:	c7 05 c0 06 11 c0 00 	movl   $0x0,0xc01106c0
c0104622:	00 00 00 
c0104625:	eb 01                	jmp    c0104628 <TaskTTY+0xfe>
c0104627:	90                   	nop
c0104628:	e9 33 ff ff ff       	jmp    c0104560 <TaskTTY+0x36>

c010462d <keyboard_handler>:
c010462d:	55                   	push   %ebp
c010462e:	89 e5                	mov    %esp,%ebp
c0104630:	83 ec 18             	sub    $0x18,%esp
c0104633:	c7 05 c0 06 11 c0 01 	movl   $0x1,0xc01106c0
c010463a:	00 00 00 
c010463d:	c7 45 f4 60 00 00 00 	movl   $0x60,-0xc(%ebp)
c0104644:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c0104649:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c010464e:	7f 5e                	jg     c01046ae <keyboard_handler+0x81>
c0104650:	e8 72 bc ff ff       	call   c01002c7 <disable_int>
c0104655:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104658:	0f b7 c0             	movzwl %ax,%eax
c010465b:	83 ec 0c             	sub    $0xc,%esp
c010465e:	50                   	push   %eax
c010465f:	e8 35 bc ff ff       	call   c0100299 <in_byte>
c0104664:	83 c4 10             	add    $0x10,%esp
c0104667:	88 45 f3             	mov    %al,-0xd(%ebp)
c010466a:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c010466f:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
c0104673:	88 10                	mov    %dl,(%eax)
c0104675:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c010467a:	83 c0 01             	add    $0x1,%eax
c010467d:	a3 e0 fb 10 c0       	mov    %eax,0xc010fbe0
c0104682:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c0104687:	83 c0 01             	add    $0x1,%eax
c010468a:	a3 e8 fb 10 c0       	mov    %eax,0xc010fbe8
c010468f:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c0104694:	ba ec fd 10 c0       	mov    $0xc010fdec,%edx
c0104699:	39 d0                	cmp    %edx,%eax
c010469b:	72 0a                	jb     c01046a7 <keyboard_handler+0x7a>
c010469d:	c7 05 e0 fb 10 c0 ec 	movl   $0xc010fbec,0xc010fbe0
c01046a4:	fb 10 c0 
c01046a7:	e8 1d bc ff ff       	call   c01002c9 <enable_int>
c01046ac:	eb 01                	jmp    c01046af <keyboard_handler+0x82>
c01046ae:	90                   	nop
c01046af:	c9                   	leave  
c01046b0:	c3                   	ret    

c01046b1 <read_from_keyboard_buf>:
c01046b1:	55                   	push   %ebp
c01046b2:	89 e5                	mov    %esp,%ebp
c01046b4:	83 ec 18             	sub    $0x18,%esp
c01046b7:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
c01046bb:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c01046c0:	85 c0                	test   %eax,%eax
c01046c2:	7f 06                	jg     c01046ca <read_from_keyboard_buf+0x19>
c01046c4:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c01046c8:	eb 4b                	jmp    c0104715 <read_from_keyboard_buf+0x64>
c01046ca:	e8 f8 bb ff ff       	call   c01002c7 <disable_int>
c01046cf:	a1 e4 fb 10 c0       	mov    0xc010fbe4,%eax
c01046d4:	0f b6 00             	movzbl (%eax),%eax
c01046d7:	88 45 f7             	mov    %al,-0x9(%ebp)
c01046da:	a1 e4 fb 10 c0       	mov    0xc010fbe4,%eax
c01046df:	83 c0 01             	add    $0x1,%eax
c01046e2:	a3 e4 fb 10 c0       	mov    %eax,0xc010fbe4
c01046e7:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c01046ec:	83 e8 01             	sub    $0x1,%eax
c01046ef:	a3 e8 fb 10 c0       	mov    %eax,0xc010fbe8
c01046f4:	a1 e4 fb 10 c0       	mov    0xc010fbe4,%eax
c01046f9:	ba ec fd 10 c0       	mov    $0xc010fdec,%edx
c01046fe:	39 d0                	cmp    %edx,%eax
c0104700:	72 0a                	jb     c010470c <read_from_keyboard_buf+0x5b>
c0104702:	c7 05 e4 fb 10 c0 ec 	movl   $0xc010fbec,0xc010fbe4
c0104709:	fb 10 c0 
c010470c:	e8 b8 bb ff ff       	call   c01002c9 <enable_int>
c0104711:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c0104715:	c9                   	leave  
c0104716:	c3                   	ret    

c0104717 <keyboard_read>:
c0104717:	55                   	push   %ebp
c0104718:	89 e5                	mov    %esp,%ebp
c010471a:	83 ec 28             	sub    $0x28,%esp
c010471d:	90                   	nop
c010471e:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c0104723:	85 c0                	test   %eax,%eax
c0104725:	7e f7                	jle    c010471e <keyboard_read+0x7>
c0104727:	e8 85 ff ff ff       	call   c01046b1 <read_from_keyboard_buf>
c010472c:	88 45 ea             	mov    %al,-0x16(%ebp)
c010472f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0104736:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c010473a:	80 7d ea e1          	cmpb   $0xe1,-0x16(%ebp)
c010473e:	75 5a                	jne    c010479a <keyboard_read+0x83>
c0104740:	c6 45 e3 e1          	movb   $0xe1,-0x1d(%ebp)
c0104744:	c6 45 e4 1d          	movb   $0x1d,-0x1c(%ebp)
c0104748:	c6 45 e5 45          	movb   $0x45,-0x1b(%ebp)
c010474c:	c6 45 e6 e1          	movb   $0xe1,-0x1a(%ebp)
c0104750:	c6 45 e7 9d          	movb   $0x9d,-0x19(%ebp)
c0104754:	c6 45 e8 c5          	movb   $0xc5,-0x18(%ebp)
c0104758:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
c010475c:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0104763:	eb 20                	jmp    c0104785 <keyboard_read+0x6e>
c0104765:	e8 47 ff ff ff       	call   c01046b1 <read_from_keyboard_buf>
c010476a:	89 c1                	mov    %eax,%ecx
c010476c:	8d 55 e3             	lea    -0x1d(%ebp),%edx
c010476f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104772:	01 d0                	add    %edx,%eax
c0104774:	0f b6 00             	movzbl (%eax),%eax
c0104777:	38 c1                	cmp    %al,%cl
c0104779:	74 06                	je     c0104781 <keyboard_read+0x6a>
c010477b:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
c010477f:	eb 0a                	jmp    c010478b <keyboard_read+0x74>
c0104781:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0104785:	83 7d ec 05          	cmpl   $0x5,-0x14(%ebp)
c0104789:	7e da                	jle    c0104765 <keyboard_read+0x4e>
c010478b:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
c010478f:	74 68                	je     c01047f9 <keyboard_read+0xe2>
c0104791:	c7 45 f4 80 01 00 00 	movl   $0x180,-0xc(%ebp)
c0104798:	eb 5f                	jmp    c01047f9 <keyboard_read+0xe2>
c010479a:	80 7d ea e0          	cmpb   $0xe0,-0x16(%ebp)
c010479e:	75 59                	jne    c01047f9 <keyboard_read+0xe2>
c01047a0:	e8 0c ff ff ff       	call   c01046b1 <read_from_keyboard_buf>
c01047a5:	3c 2a                	cmp    $0x2a,%al
c01047a7:	75 1d                	jne    c01047c6 <keyboard_read+0xaf>
c01047a9:	e8 03 ff ff ff       	call   c01046b1 <read_from_keyboard_buf>
c01047ae:	3c e0                	cmp    $0xe0,%al
c01047b0:	75 14                	jne    c01047c6 <keyboard_read+0xaf>
c01047b2:	e8 fa fe ff ff       	call   c01046b1 <read_from_keyboard_buf>
c01047b7:	3c 37                	cmp    $0x37,%al
c01047b9:	75 0b                	jne    c01047c6 <keyboard_read+0xaf>
c01047bb:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c01047c2:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
c01047c6:	e8 e6 fe ff ff       	call   c01046b1 <read_from_keyboard_buf>
c01047cb:	3c b7                	cmp    $0xb7,%al
c01047cd:	75 1d                	jne    c01047ec <keyboard_read+0xd5>
c01047cf:	e8 dd fe ff ff       	call   c01046b1 <read_from_keyboard_buf>
c01047d4:	3c e0                	cmp    $0xe0,%al
c01047d6:	75 14                	jne    c01047ec <keyboard_read+0xd5>
c01047d8:	e8 d4 fe ff ff       	call   c01046b1 <read_from_keyboard_buf>
c01047dd:	3c aa                	cmp    $0xaa,%al
c01047df:	75 0b                	jne    c01047ec <keyboard_read+0xd5>
c01047e1:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c01047e8:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c01047ec:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01047f0:	75 07                	jne    c01047f9 <keyboard_read+0xe2>
c01047f2:	c6 05 84 f7 10 c0 01 	movb   $0x1,0xc010f784
c01047f9:	81 7d f4 80 01 00 00 	cmpl   $0x180,-0xc(%ebp)
c0104800:	0f 84 8d 00 00 00    	je     c0104893 <keyboard_read+0x17c>
c0104806:	81 7d f4 81 01 00 00 	cmpl   $0x181,-0xc(%ebp)
c010480d:	0f 84 80 00 00 00    	je     c0104893 <keyboard_read+0x17c>
c0104813:	80 7d ea 36          	cmpb   $0x36,-0x16(%ebp)
c0104817:	0f 94 c2             	sete   %dl
c010481a:	80 7d ea 2a          	cmpb   $0x2a,-0x16(%ebp)
c010481e:	0f 94 c0             	sete   %al
c0104821:	09 d0                	or     %edx,%eax
c0104823:	84 c0                	test   %al,%al
c0104825:	74 07                	je     c010482e <keyboard_read+0x117>
c0104827:	c6 05 c8 06 11 c0 01 	movb   $0x1,0xc01106c8
c010482e:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
c0104832:	f7 d0                	not    %eax
c0104834:	c0 e8 07             	shr    $0x7,%al
c0104837:	88 45 e9             	mov    %al,-0x17(%ebp)
c010483a:	80 7d ea 00          	cmpb   $0x0,-0x16(%ebp)
c010483e:	74 53                	je     c0104893 <keyboard_read+0x17c>
c0104840:	80 7d e9 00          	cmpb   $0x0,-0x17(%ebp)
c0104844:	74 4d                	je     c0104893 <keyboard_read+0x17c>
c0104846:	c6 45 eb 00          	movb   $0x0,-0x15(%ebp)
c010484a:	0f b6 05 c8 06 11 c0 	movzbl 0xc01106c8,%eax
c0104851:	3c 01                	cmp    $0x1,%al
c0104853:	75 04                	jne    c0104859 <keyboard_read+0x142>
c0104855:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
c0104859:	0f b6 05 84 f7 10 c0 	movzbl 0xc010f784,%eax
c0104860:	84 c0                	test   %al,%al
c0104862:	74 04                	je     c0104868 <keyboard_read+0x151>
c0104864:	c6 45 eb 02          	movb   $0x2,-0x15(%ebp)
c0104868:	0f b6 55 ea          	movzbl -0x16(%ebp),%edx
c010486c:	89 d0                	mov    %edx,%eax
c010486e:	01 c0                	add    %eax,%eax
c0104870:	01 c2                	add    %eax,%edx
c0104872:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c0104876:	01 d0                	add    %edx,%eax
c0104878:	8b 04 85 60 e1 10 c0 	mov    -0x3fef1ea0(,%eax,4),%eax
c010487f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104882:	83 ec 08             	sub    $0x8,%esp
c0104885:	ff 75 f4             	pushl  -0xc(%ebp)
c0104888:	ff 75 08             	pushl  0x8(%ebp)
c010488b:	e8 1a 00 00 00       	call   c01048aa <in_process>
c0104890:	83 c4 10             	add    $0x10,%esp
c0104893:	90                   	nop
c0104894:	c9                   	leave  
c0104895:	c3                   	ret    

c0104896 <init_keyboard_handler>:
c0104896:	55                   	push   %ebp
c0104897:	89 e5                	mov    %esp,%ebp
c0104899:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c01048a0:	c6 05 c8 06 11 c0 00 	movb   $0x0,0xc01106c8
c01048a7:	90                   	nop
c01048a8:	5d                   	pop    %ebp
c01048a9:	c3                   	ret    

c01048aa <in_process>:
c01048aa:	55                   	push   %ebp
c01048ab:	89 e5                	mov    %esp,%ebp
c01048ad:	83 ec 18             	sub    $0x18,%esp
c01048b0:	83 ec 04             	sub    $0x4,%esp
c01048b3:	6a 02                	push   $0x2
c01048b5:	6a 00                	push   $0x0
c01048b7:	8d 45 f6             	lea    -0xa(%ebp),%eax
c01048ba:	50                   	push   %eax
c01048bb:	e8 b7 6c 00 00       	call   c010b577 <Memset>
c01048c0:	83 c4 10             	add    $0x10,%esp
c01048c3:	8b 45 0c             	mov    0xc(%ebp),%eax
c01048c6:	25 00 01 00 00       	and    $0x100,%eax
c01048cb:	85 c0                	test   %eax,%eax
c01048cd:	75 28                	jne    c01048f7 <in_process+0x4d>
c01048cf:	8b 45 0c             	mov    0xc(%ebp),%eax
c01048d2:	0f b6 c0             	movzbl %al,%eax
c01048d5:	83 ec 08             	sub    $0x8,%esp
c01048d8:	50                   	push   %eax
c01048d9:	ff 75 08             	pushl  0x8(%ebp)
c01048dc:	e8 b3 f3 ff ff       	call   c0103c94 <put_key>
c01048e1:	83 c4 10             	add    $0x10,%esp
c01048e4:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c01048eb:	c6 05 c8 06 11 c0 00 	movb   $0x0,0xc01106c8
c01048f2:	e9 42 01 00 00       	jmp    c0104a39 <in_process+0x18f>
c01048f7:	0f b6 05 c8 06 11 c0 	movzbl 0xc01106c8,%eax
c01048fe:	84 c0                	test   %al,%al
c0104900:	0f 84 a9 00 00 00    	je     c01049af <in_process+0x105>
c0104906:	83 7d 0c 2a          	cmpl   $0x2a,0xc(%ebp)
c010490a:	0f 84 9f 00 00 00    	je     c01049af <in_process+0x105>
c0104910:	83 7d 0c 36          	cmpl   $0x36,0xc(%ebp)
c0104914:	0f 84 95 00 00 00    	je     c01049af <in_process+0x105>
c010491a:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0104921:	74 64                	je     c0104987 <in_process+0xdd>
c0104923:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c010492a:	77 0b                	ja     c0104937 <in_process+0x8d>
c010492c:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0104933:	74 64                	je     c0104999 <in_process+0xef>
c0104935:	eb 73                	jmp    c01049aa <in_process+0x100>
c0104937:	81 7d 0c 55 01 00 00 	cmpl   $0x155,0xc(%ebp)
c010493e:	74 0b                	je     c010494b <in_process+0xa1>
c0104940:	81 7d 0c 68 01 00 00 	cmpl   $0x168,0xc(%ebp)
c0104947:	74 20                	je     c0104969 <in_process+0xbf>
c0104949:	eb 5f                	jmp    c01049aa <in_process+0x100>
c010494b:	83 ec 0c             	sub    $0xc,%esp
c010494e:	ff 75 08             	pushl  0x8(%ebp)
c0104951:	e8 aa f3 ff ff       	call   c0103d00 <scroll_up>
c0104956:	83 c4 10             	add    $0x10,%esp
c0104959:	c6 05 c8 06 11 c0 00 	movb   $0x0,0xc01106c8
c0104960:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c0104967:	eb 41                	jmp    c01049aa <in_process+0x100>
c0104969:	83 ec 0c             	sub    $0xc,%esp
c010496c:	ff 75 08             	pushl  0x8(%ebp)
c010496f:	e8 ce f3 ff ff       	call   c0103d42 <scroll_down>
c0104974:	83 c4 10             	add    $0x10,%esp
c0104977:	c6 05 c8 06 11 c0 00 	movb   $0x0,0xc01106c8
c010497e:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c0104985:	eb 23                	jmp    c01049aa <in_process+0x100>
c0104987:	83 ec 08             	sub    $0x8,%esp
c010498a:	6a 0a                	push   $0xa
c010498c:	ff 75 08             	pushl  0x8(%ebp)
c010498f:	e8 19 f4 ff ff       	call   c0103dad <out_char>
c0104994:	83 c4 10             	add    $0x10,%esp
c0104997:	eb 11                	jmp    c01049aa <in_process+0x100>
c0104999:	83 ec 08             	sub    $0x8,%esp
c010499c:	6a 08                	push   $0x8
c010499e:	ff 75 08             	pushl  0x8(%ebp)
c01049a1:	e8 07 f4 ff ff       	call   c0103dad <out_char>
c01049a6:	83 c4 10             	add    $0x10,%esp
c01049a9:	90                   	nop
c01049aa:	e9 8a 00 00 00       	jmp    c0104a39 <in_process+0x18f>
c01049af:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c01049b6:	74 55                	je     c0104a0d <in_process+0x163>
c01049b8:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c01049bf:	77 14                	ja     c01049d5 <in_process+0x12b>
c01049c1:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c01049c8:	74 31                	je     c01049fb <in_process+0x151>
c01049ca:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c01049d1:	74 16                	je     c01049e9 <in_process+0x13f>
c01049d3:	eb 64                	jmp    c0104a39 <in_process+0x18f>
c01049d5:	81 7d 0c 41 01 00 00 	cmpl   $0x141,0xc(%ebp)
c01049dc:	74 3e                	je     c0104a1c <in_process+0x172>
c01049de:	81 7d 0c 42 01 00 00 	cmpl   $0x142,0xc(%ebp)
c01049e5:	74 44                	je     c0104a2b <in_process+0x181>
c01049e7:	eb 50                	jmp    c0104a39 <in_process+0x18f>
c01049e9:	83 ec 08             	sub    $0x8,%esp
c01049ec:	6a 0a                	push   $0xa
c01049ee:	ff 75 08             	pushl  0x8(%ebp)
c01049f1:	e8 9e f2 ff ff       	call   c0103c94 <put_key>
c01049f6:	83 c4 10             	add    $0x10,%esp
c01049f9:	eb 3e                	jmp    c0104a39 <in_process+0x18f>
c01049fb:	83 ec 08             	sub    $0x8,%esp
c01049fe:	6a 08                	push   $0x8
c0104a00:	ff 75 08             	pushl  0x8(%ebp)
c0104a03:	e8 8c f2 ff ff       	call   c0103c94 <put_key>
c0104a08:	83 c4 10             	add    $0x10,%esp
c0104a0b:	eb 2c                	jmp    c0104a39 <in_process+0x18f>
c0104a0d:	83 ec 0c             	sub    $0xc,%esp
c0104a10:	6a 00                	push   $0x0
c0104a12:	e8 4c f1 ff ff       	call   c0103b63 <select_console>
c0104a17:	83 c4 10             	add    $0x10,%esp
c0104a1a:	eb 1d                	jmp    c0104a39 <in_process+0x18f>
c0104a1c:	83 ec 0c             	sub    $0xc,%esp
c0104a1f:	6a 01                	push   $0x1
c0104a21:	e8 3d f1 ff ff       	call   c0103b63 <select_console>
c0104a26:	83 c4 10             	add    $0x10,%esp
c0104a29:	eb 0e                	jmp    c0104a39 <in_process+0x18f>
c0104a2b:	83 ec 0c             	sub    $0xc,%esp
c0104a2e:	6a 02                	push   $0x2
c0104a30:	e8 2e f1 ff ff       	call   c0103b63 <select_console>
c0104a35:	83 c4 10             	add    $0x10,%esp
c0104a38:	90                   	nop
c0104a39:	90                   	nop
c0104a3a:	c9                   	leave  
c0104a3b:	c3                   	ret    

c0104a3c <open>:
c0104a3c:	55                   	push   %ebp
c0104a3d:	89 e5                	mov    %esp,%ebp
c0104a3f:	83 ec 18             	sub    $0x18,%esp
c0104a42:	83 ec 0c             	sub    $0xc,%esp
c0104a45:	6a 7c                	push   $0x7c
c0104a47:	e8 e0 ca ff ff       	call   c010152c <sys_malloc>
c0104a4c:	83 c4 10             	add    $0x10,%esp
c0104a4f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104a52:	83 ec 04             	sub    $0x4,%esp
c0104a55:	6a 7c                	push   $0x7c
c0104a57:	6a 00                	push   $0x0
c0104a59:	ff 75 f4             	pushl  -0xc(%ebp)
c0104a5c:	e8 16 6b 00 00       	call   c010b577 <Memset>
c0104a61:	83 c4 10             	add    $0x10,%esp
c0104a64:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104a67:	c7 40 78 06 00 00 00 	movl   $0x6,0x78(%eax)
c0104a6e:	83 ec 0c             	sub    $0xc,%esp
c0104a71:	ff 75 08             	pushl  0x8(%ebp)
c0104a74:	e8 32 14 00 00       	call   c0105eab <get_physical_address>
c0104a79:	83 c4 10             	add    $0x10,%esp
c0104a7c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104a7f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104a82:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104a85:	89 50 44             	mov    %edx,0x44(%eax)
c0104a88:	8b 55 0c             	mov    0xc(%ebp),%edx
c0104a8b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104a8e:	89 50 74             	mov    %edx,0x74(%eax)
c0104a91:	83 ec 0c             	sub    $0xc,%esp
c0104a94:	ff 75 08             	pushl  0x8(%ebp)
c0104a97:	e8 14 6b 00 00       	call   c010b5b0 <Strlen>
c0104a9c:	83 c4 10             	add    $0x10,%esp
c0104a9f:	89 c2                	mov    %eax,%edx
c0104aa1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104aa4:	89 50 40             	mov    %edx,0x40(%eax)
c0104aa7:	83 ec 04             	sub    $0x4,%esp
c0104aaa:	6a 02                	push   $0x2
c0104aac:	ff 75 f4             	pushl  -0xc(%ebp)
c0104aaf:	6a 03                	push   $0x3
c0104ab1:	e8 77 49 00 00       	call   c010942d <send_rec>
c0104ab6:	83 c4 10             	add    $0x10,%esp
c0104ab9:	83 ec 08             	sub    $0x8,%esp
c0104abc:	6a 7c                	push   $0x7c
c0104abe:	ff 75 f4             	pushl  -0xc(%ebp)
c0104ac1:	e8 7b ca ff ff       	call   c0101541 <sys_free>
c0104ac6:	83 c4 10             	add    $0x10,%esp
c0104ac9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104acc:	8b 40 50             	mov    0x50(%eax),%eax
c0104acf:	c9                   	leave  
c0104ad0:	c3                   	ret    

c0104ad1 <read>:
c0104ad1:	55                   	push   %ebp
c0104ad2:	89 e5                	mov    %esp,%ebp
c0104ad4:	83 ec 38             	sub    $0x38,%esp
c0104ad7:	c7 45 dc 7c 00 00 00 	movl   $0x7c,-0x24(%ebp)
c0104ade:	83 ec 0c             	sub    $0xc,%esp
c0104ae1:	ff 75 dc             	pushl  -0x24(%ebp)
c0104ae4:	e8 43 ca ff ff       	call   c010152c <sys_malloc>
c0104ae9:	83 c4 10             	add    $0x10,%esp
c0104aec:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0104aef:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104af2:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0104af7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104afa:	83 ec 0c             	sub    $0xc,%esp
c0104afd:	ff 75 0c             	pushl  0xc(%ebp)
c0104b00:	e8 a6 13 00 00       	call   c0105eab <get_physical_address>
c0104b05:	83 c4 10             	add    $0x10,%esp
c0104b08:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104b0b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104b0e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0104b13:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0104b16:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104b19:	05 ff 0f 00 00       	add    $0xfff,%eax
c0104b1e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0104b21:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0104b28:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0104b2f:	8b 55 10             	mov    0x10(%ebp),%edx
c0104b32:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104b35:	01 d0                	add    %edx,%eax
c0104b37:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
c0104b3a:	0f 83 a8 00 00 00    	jae    c0104be8 <read+0x117>
c0104b40:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104b43:	2b 45 f0             	sub    -0x10(%ebp),%eax
c0104b46:	05 00 10 00 00       	add    $0x1000,%eax
c0104b4b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0104b4e:	8b 45 10             	mov    0x10(%ebp),%eax
c0104b51:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0104b54:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104b57:	83 ec 04             	sub    $0x4,%esp
c0104b5a:	50                   	push   %eax
c0104b5b:	6a 00                	push   $0x0
c0104b5d:	ff 75 d8             	pushl  -0x28(%ebp)
c0104b60:	e8 12 6a 00 00       	call   c010b577 <Memset>
c0104b65:	83 c4 10             	add    $0x10,%esp
c0104b68:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104b6b:	c7 40 78 07 00 00 00 	movl   $0x7,0x78(%eax)
c0104b72:	8b 55 08             	mov    0x8(%ebp),%edx
c0104b75:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104b78:	89 50 50             	mov    %edx,0x50(%eax)
c0104b7b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104b7e:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104b81:	89 50 10             	mov    %edx,0x10(%eax)
c0104b84:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104b87:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0104b8a:	89 50 60             	mov    %edx,0x60(%eax)
c0104b8d:	83 ec 04             	sub    $0x4,%esp
c0104b90:	6a 02                	push   $0x2
c0104b92:	ff 75 d8             	pushl  -0x28(%ebp)
c0104b95:	6a 03                	push   $0x3
c0104b97:	e8 91 48 00 00       	call   c010942d <send_rec>
c0104b9c:	83 c4 10             	add    $0x10,%esp
c0104b9f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104ba2:	8b 40 60             	mov    0x60(%eax),%eax
c0104ba5:	01 45 e8             	add    %eax,-0x18(%ebp)
c0104ba8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0104bab:	29 45 e0             	sub    %eax,-0x20(%ebp)
c0104bae:	8b 45 10             	mov    0x10(%ebp),%eax
c0104bb1:	2b 45 e4             	sub    -0x1c(%ebp),%eax
c0104bb4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0104bb7:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0104bba:	89 45 10             	mov    %eax,0x10(%ebp)
c0104bbd:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
c0104bc4:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c0104bcb:	83 ec 0c             	sub    $0xc,%esp
c0104bce:	ff 75 f4             	pushl  -0xc(%ebp)
c0104bd1:	e8 d5 12 00 00       	call   c0105eab <get_physical_address>
c0104bd6:	83 c4 10             	add    $0x10,%esp
c0104bd9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104bdc:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0104be0:	0f 85 6e ff ff ff    	jne    c0104b54 <read+0x83>
c0104be6:	eb 54                	jmp    c0104c3c <read+0x16b>
c0104be8:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104beb:	83 ec 04             	sub    $0x4,%esp
c0104bee:	50                   	push   %eax
c0104bef:	6a 00                	push   $0x0
c0104bf1:	ff 75 d8             	pushl  -0x28(%ebp)
c0104bf4:	e8 7e 69 00 00       	call   c010b577 <Memset>
c0104bf9:	83 c4 10             	add    $0x10,%esp
c0104bfc:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104bff:	c7 40 78 07 00 00 00 	movl   $0x7,0x78(%eax)
c0104c06:	8b 55 08             	mov    0x8(%ebp),%edx
c0104c09:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104c0c:	89 50 50             	mov    %edx,0x50(%eax)
c0104c0f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104c12:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104c15:	89 50 10             	mov    %edx,0x10(%eax)
c0104c18:	8b 55 10             	mov    0x10(%ebp),%edx
c0104c1b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104c1e:	89 50 60             	mov    %edx,0x60(%eax)
c0104c21:	83 ec 04             	sub    $0x4,%esp
c0104c24:	6a 02                	push   $0x2
c0104c26:	ff 75 d8             	pushl  -0x28(%ebp)
c0104c29:	6a 03                	push   $0x3
c0104c2b:	e8 fd 47 00 00       	call   c010942d <send_rec>
c0104c30:	83 c4 10             	add    $0x10,%esp
c0104c33:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104c36:	8b 40 60             	mov    0x60(%eax),%eax
c0104c39:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0104c3c:	83 ec 08             	sub    $0x8,%esp
c0104c3f:	ff 75 dc             	pushl  -0x24(%ebp)
c0104c42:	ff 75 d8             	pushl  -0x28(%ebp)
c0104c45:	e8 f7 c8 ff ff       	call   c0101541 <sys_free>
c0104c4a:	83 c4 10             	add    $0x10,%esp
c0104c4d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104c50:	c9                   	leave  
c0104c51:	c3                   	ret    

c0104c52 <write>:
c0104c52:	55                   	push   %ebp
c0104c53:	89 e5                	mov    %esp,%ebp
c0104c55:	83 ec 18             	sub    $0x18,%esp
c0104c58:	c7 45 f4 7c 00 00 00 	movl   $0x7c,-0xc(%ebp)
c0104c5f:	83 ec 0c             	sub    $0xc,%esp
c0104c62:	ff 75 f4             	pushl  -0xc(%ebp)
c0104c65:	e8 c2 c8 ff ff       	call   c010152c <sys_malloc>
c0104c6a:	83 c4 10             	add    $0x10,%esp
c0104c6d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104c70:	83 ec 0c             	sub    $0xc,%esp
c0104c73:	ff 75 0c             	pushl  0xc(%ebp)
c0104c76:	e8 30 12 00 00       	call   c0105eab <get_physical_address>
c0104c7b:	83 c4 10             	add    $0x10,%esp
c0104c7e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0104c81:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104c84:	c7 40 78 0a 00 00 00 	movl   $0xa,0x78(%eax)
c0104c8b:	8b 55 08             	mov    0x8(%ebp),%edx
c0104c8e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104c91:	89 50 50             	mov    %edx,0x50(%eax)
c0104c94:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104c97:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0104c9a:	89 50 10             	mov    %edx,0x10(%eax)
c0104c9d:	8b 55 10             	mov    0x10(%ebp),%edx
c0104ca0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104ca3:	89 50 60             	mov    %edx,0x60(%eax)
c0104ca6:	83 ec 04             	sub    $0x4,%esp
c0104ca9:	6a 02                	push   $0x2
c0104cab:	ff 75 f0             	pushl  -0x10(%ebp)
c0104cae:	6a 03                	push   $0x3
c0104cb0:	e8 78 47 00 00       	call   c010942d <send_rec>
c0104cb5:	83 c4 10             	add    $0x10,%esp
c0104cb8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104cbb:	8b 40 60             	mov    0x60(%eax),%eax
c0104cbe:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0104cc1:	83 ec 08             	sub    $0x8,%esp
c0104cc4:	ff 75 f4             	pushl  -0xc(%ebp)
c0104cc7:	ff 75 f0             	pushl  -0x10(%ebp)
c0104cca:	e8 72 c8 ff ff       	call   c0101541 <sys_free>
c0104ccf:	83 c4 10             	add    $0x10,%esp
c0104cd2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104cd5:	c9                   	leave  
c0104cd6:	c3                   	ret    

c0104cd7 <close>:
c0104cd7:	55                   	push   %ebp
c0104cd8:	89 e5                	mov    %esp,%ebp
c0104cda:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104ce0:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0104ce7:	8b 45 08             	mov    0x8(%ebp),%eax
c0104cea:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0104ced:	83 ec 04             	sub    $0x4,%esp
c0104cf0:	6a 02                	push   $0x2
c0104cf2:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104cf8:	50                   	push   %eax
c0104cf9:	6a 03                	push   $0x3
c0104cfb:	e8 2d 47 00 00       	call   c010942d <send_rec>
c0104d00:	83 c4 10             	add    $0x10,%esp
c0104d03:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104d06:	83 f8 65             	cmp    $0x65,%eax
c0104d09:	74 19                	je     c0104d24 <close+0x4d>
c0104d0b:	6a 13                	push   $0x13
c0104d0d:	68 f3 a8 10 c0       	push   $0xc010a8f3
c0104d12:	68 f3 a8 10 c0       	push   $0xc010a8f3
c0104d17:	68 ff a8 10 c0       	push   $0xc010a8ff
c0104d1c:	e8 9c 3a 00 00       	call   c01087bd <assertion_failure>
c0104d21:	83 c4 10             	add    $0x10,%esp
c0104d24:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0104d27:	c9                   	leave  
c0104d28:	c3                   	ret    

c0104d29 <wait>:
c0104d29:	55                   	push   %ebp
c0104d2a:	89 e5                	mov    %esp,%ebp
c0104d2c:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104d32:	c7 45 f4 09 00 00 00 	movl   $0x9,-0xc(%ebp)
c0104d39:	83 ec 04             	sub    $0x4,%esp
c0104d3c:	6a 01                	push   $0x1
c0104d3e:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104d44:	50                   	push   %eax
c0104d45:	6a 03                	push   $0x3
c0104d47:	e8 e1 46 00 00       	call   c010942d <send_rec>
c0104d4c:	83 c4 10             	add    $0x10,%esp
c0104d4f:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0104d52:	89 c2                	mov    %eax,%edx
c0104d54:	8b 45 08             	mov    0x8(%ebp),%eax
c0104d57:	89 10                	mov    %edx,(%eax)
c0104d59:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104d5c:	83 f8 21             	cmp    $0x21,%eax
c0104d5f:	74 05                	je     c0104d66 <wait+0x3d>
c0104d61:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104d64:	eb 05                	jmp    c0104d6b <wait+0x42>
c0104d66:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0104d6b:	c9                   	leave  
c0104d6c:	c3                   	ret    

c0104d6d <exit>:
c0104d6d:	55                   	push   %ebp
c0104d6e:	89 e5                	mov    %esp,%ebp
c0104d70:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104d76:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
c0104d7d:	8b 45 08             	mov    0x8(%ebp),%eax
c0104d80:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0104d83:	83 ec 04             	sub    $0x4,%esp
c0104d86:	6a 01                	push   $0x1
c0104d88:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104d8e:	50                   	push   %eax
c0104d8f:	6a 03                	push   $0x3
c0104d91:	e8 97 46 00 00       	call   c010942d <send_rec>
c0104d96:	83 c4 10             	add    $0x10,%esp
c0104d99:	90                   	nop
c0104d9a:	c9                   	leave  
c0104d9b:	c3                   	ret    

c0104d9c <fork>:
c0104d9c:	55                   	push   %ebp
c0104d9d:	89 e5                	mov    %esp,%ebp
c0104d9f:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104da5:	83 ec 04             	sub    $0x4,%esp
c0104da8:	6a 7c                	push   $0x7c
c0104daa:	6a 00                	push   $0x0
c0104dac:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104db2:	50                   	push   %eax
c0104db3:	e8 bf 67 00 00       	call   c010b577 <Memset>
c0104db8:	83 c4 10             	add    $0x10,%esp
c0104dbb:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
c0104dc2:	83 ec 04             	sub    $0x4,%esp
c0104dc5:	6a 01                	push   $0x1
c0104dc7:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104dcd:	50                   	push   %eax
c0104dce:	6a 03                	push   $0x3
c0104dd0:	e8 58 46 00 00       	call   c010942d <send_rec>
c0104dd5:	83 c4 10             	add    $0x10,%esp
c0104dd8:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c0104ddf:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104de2:	c9                   	leave  
c0104de3:	c3                   	ret    

c0104de4 <getpid>:
c0104de4:	55                   	push   %ebp
c0104de5:	89 e5                	mov    %esp,%ebp
c0104de7:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104ded:	c7 45 f4 05 00 00 00 	movl   $0x5,-0xc(%ebp)
c0104df4:	83 ec 04             	sub    $0x4,%esp
c0104df7:	6a 05                	push   $0x5
c0104df9:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104dff:	50                   	push   %eax
c0104e00:	6a 03                	push   $0x3
c0104e02:	e8 26 46 00 00       	call   c010942d <send_rec>
c0104e07:	83 c4 10             	add    $0x10,%esp
c0104e0a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104e0d:	c9                   	leave  
c0104e0e:	c3                   	ret    

c0104e0f <exec>:
c0104e0f:	55                   	push   %ebp
c0104e10:	89 e5                	mov    %esp,%ebp
c0104e12:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104e18:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0104e1f:	8b 45 08             	mov    0x8(%ebp),%eax
c0104e22:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0104e25:	83 ec 0c             	sub    $0xc,%esp
c0104e28:	ff 75 08             	pushl  0x8(%ebp)
c0104e2b:	e8 80 67 00 00       	call   c010b5b0 <Strlen>
c0104e30:	83 c4 10             	add    $0x10,%esp
c0104e33:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0104e36:	c7 45 8c 00 00 00 00 	movl   $0x0,-0x74(%ebp)
c0104e3d:	c7 45 98 00 00 00 00 	movl   $0x0,-0x68(%ebp)
c0104e44:	83 ec 04             	sub    $0x4,%esp
c0104e47:	6a 01                	push   $0x1
c0104e49:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104e4f:	50                   	push   %eax
c0104e50:	6a 03                	push   $0x3
c0104e52:	e8 d6 45 00 00       	call   c010942d <send_rec>
c0104e57:	83 c4 10             	add    $0x10,%esp
c0104e5a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104e5d:	83 f8 65             	cmp    $0x65,%eax
c0104e60:	74 19                	je     c0104e7b <exec+0x6c>
c0104e62:	6a 19                	push   $0x19
c0104e64:	68 17 a9 10 c0       	push   $0xc010a917
c0104e69:	68 17 a9 10 c0       	push   $0xc010a917
c0104e6e:	68 22 a9 10 c0       	push   $0xc010a922
c0104e73:	e8 45 39 00 00       	call   c01087bd <assertion_failure>
c0104e78:	83 c4 10             	add    $0x10,%esp
c0104e7b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0104e7e:	c9                   	leave  
c0104e7f:	c3                   	ret    

c0104e80 <execv>:
c0104e80:	55                   	push   %ebp
c0104e81:	89 e5                	mov    %esp,%ebp
c0104e83:	81 ec b8 00 00 00    	sub    $0xb8,%esp
c0104e89:	c7 45 e0 00 01 00 00 	movl   $0x100,-0x20(%ebp)
c0104e90:	83 ec 0c             	sub    $0xc,%esp
c0104e93:	ff 75 e0             	pushl  -0x20(%ebp)
c0104e96:	e8 91 c6 ff ff       	call   c010152c <sys_malloc>
c0104e9b:	83 c4 10             	add    $0x10,%esp
c0104e9e:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0104ea1:	66 87 db             	xchg   %bx,%bx
c0104ea4:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0104ea7:	83 ec 04             	sub    $0x4,%esp
c0104eaa:	50                   	push   %eax
c0104eab:	6a 00                	push   $0x0
c0104ead:	ff 75 dc             	pushl  -0x24(%ebp)
c0104eb0:	e8 c2 66 00 00       	call   c010b577 <Memset>
c0104eb5:	83 c4 10             	add    $0x10,%esp
c0104eb8:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104ebb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104ebe:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0104ec5:	eb 23                	jmp    c0104eea <execv+0x6a>
c0104ec7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104eca:	8b 00                	mov    (%eax),%eax
c0104ecc:	83 ec 08             	sub    $0x8,%esp
c0104ecf:	50                   	push   %eax
c0104ed0:	68 3a a9 10 c0       	push   $0xc010a93a
c0104ed5:	e8 86 35 00 00       	call   c0108460 <Printf>
c0104eda:	83 c4 10             	add    $0x10,%esp
c0104edd:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
c0104ee1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104ee4:	83 c0 04             	add    $0x4,%eax
c0104ee7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104eea:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104eed:	8b 00                	mov    (%eax),%eax
c0104eef:	85 c0                	test   %eax,%eax
c0104ef1:	75 d4                	jne    c0104ec7 <execv+0x47>
c0104ef3:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104ef6:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104ef9:	01 d0                	add    %edx,%eax
c0104efb:	c6 00 00             	movb   $0x0,(%eax)
c0104efe:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104f01:	83 c0 04             	add    $0x4,%eax
c0104f04:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104f07:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104f0a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0104f0d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104f10:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0104f13:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0104f1a:	eb 5b                	jmp    c0104f77 <execv+0xf7>
c0104f1c:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104f1f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104f22:	01 c2                	add    %eax,%edx
c0104f24:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104f27:	89 10                	mov    %edx,(%eax)
c0104f29:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104f2c:	8b 00                	mov    (%eax),%eax
c0104f2e:	8b 4d f0             	mov    -0x10(%ebp),%ecx
c0104f31:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0104f34:	01 ca                	add    %ecx,%edx
c0104f36:	83 ec 08             	sub    $0x8,%esp
c0104f39:	50                   	push   %eax
c0104f3a:	52                   	push   %edx
c0104f3b:	e8 56 66 00 00       	call   c010b596 <Strcpy>
c0104f40:	83 c4 10             	add    $0x10,%esp
c0104f43:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104f46:	8b 00                	mov    (%eax),%eax
c0104f48:	83 ec 0c             	sub    $0xc,%esp
c0104f4b:	50                   	push   %eax
c0104f4c:	e8 5f 66 00 00       	call   c010b5b0 <Strlen>
c0104f51:	83 c4 10             	add    $0x10,%esp
c0104f54:	01 45 f0             	add    %eax,-0x10(%ebp)
c0104f57:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104f5a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104f5d:	01 d0                	add    %edx,%eax
c0104f5f:	c6 00 00             	movb   $0x0,(%eax)
c0104f62:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104f65:	83 c0 01             	add    $0x1,%eax
c0104f68:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104f6b:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
c0104f6f:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c0104f73:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0104f77:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104f7a:	8b 00                	mov    (%eax),%eax
c0104f7c:	85 c0                	test   %eax,%eax
c0104f7e:	75 9c                	jne    c0104f1c <execv+0x9c>
c0104f80:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104f83:	ba 00 00 00 c0       	mov    $0xc0000000,%edx
c0104f88:	29 c2                	sub    %eax,%edx
c0104f8a:	89 d0                	mov    %edx,%eax
c0104f8c:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0104f8f:	83 ec 0c             	sub    $0xc,%esp
c0104f92:	ff 75 08             	pushl  0x8(%ebp)
c0104f95:	e8 11 0f 00 00       	call   c0105eab <get_physical_address>
c0104f9a:	83 c4 10             	add    $0x10,%esp
c0104f9d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0104fa0:	83 ec 0c             	sub    $0xc,%esp
c0104fa3:	ff 75 dc             	pushl  -0x24(%ebp)
c0104fa6:	e8 00 0f 00 00       	call   c0105eab <get_physical_address>
c0104fab:	83 c4 10             	add    $0x10,%esp
c0104fae:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0104fb1:	83 ec 0c             	sub    $0xc,%esp
c0104fb4:	ff 75 d8             	pushl  -0x28(%ebp)
c0104fb7:	e8 ef 0e 00 00       	call   c0105eab <get_physical_address>
c0104fbc:	83 c4 10             	add    $0x10,%esp
c0104fbf:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0104fc2:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
c0104fc9:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0104fcc:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0104fcf:	83 ec 0c             	sub    $0xc,%esp
c0104fd2:	ff 75 08             	pushl  0x8(%ebp)
c0104fd5:	e8 d6 65 00 00       	call   c010b5b0 <Strlen>
c0104fda:	83 c4 10             	add    $0x10,%esp
c0104fdd:	89 45 90             	mov    %eax,-0x70(%ebp)
c0104fe0:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0104fe3:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
c0104fe9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104fec:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c0104ff2:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104ff5:	89 85 70 ff ff ff    	mov    %eax,-0x90(%ebp)
c0104ffb:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0104ffe:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
c0105004:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0105007:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c010500d:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105010:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0105013:	29 c2                	sub    %eax,%edx
c0105015:	89 d0                	mov    %edx,%eax
c0105017:	89 85 7c ff ff ff    	mov    %eax,-0x84(%ebp)
c010501d:	83 ec 04             	sub    $0x4,%esp
c0105020:	6a 01                	push   $0x1
c0105022:	8d 85 50 ff ff ff    	lea    -0xb0(%ebp),%eax
c0105028:	50                   	push   %eax
c0105029:	6a 03                	push   $0x3
c010502b:	e8 fd 43 00 00       	call   c010942d <send_rec>
c0105030:	83 c4 10             	add    $0x10,%esp
c0105033:	83 ec 08             	sub    $0x8,%esp
c0105036:	68 00 04 00 00       	push   $0x400
c010503b:	ff 75 dc             	pushl  -0x24(%ebp)
c010503e:	e8 fe c4 ff ff       	call   c0101541 <sys_free>
c0105043:	83 c4 10             	add    $0x10,%esp
c0105046:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0105049:	83 f8 65             	cmp    $0x65,%eax
c010504c:	74 1c                	je     c010506a <execv+0x1ea>
c010504e:	68 95 00 00 00       	push   $0x95
c0105053:	68 17 a9 10 c0       	push   $0xc010a917
c0105058:	68 17 a9 10 c0       	push   $0xc010a917
c010505d:	68 22 a9 10 c0       	push   $0xc010a922
c0105062:	e8 56 37 00 00       	call   c01087bd <assertion_failure>
c0105067:	83 c4 10             	add    $0x10,%esp
c010506a:	8b 45 a8             	mov    -0x58(%ebp),%eax
c010506d:	c9                   	leave  
c010506e:	c3                   	ret    

c010506f <execl>:
c010506f:	55                   	push   %ebp
c0105070:	89 e5                	mov    %esp,%ebp
c0105072:	83 ec 18             	sub    $0x18,%esp
c0105075:	8d 45 0c             	lea    0xc(%ebp),%eax
c0105078:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010507b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010507e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105081:	83 ec 08             	sub    $0x8,%esp
c0105084:	ff 75 f0             	pushl  -0x10(%ebp)
c0105087:	ff 75 08             	pushl  0x8(%ebp)
c010508a:	e8 f1 fd ff ff       	call   c0104e80 <execv>
c010508f:	83 c4 10             	add    $0x10,%esp
c0105092:	c9                   	leave  
c0105093:	c3                   	ret    

c0105094 <TaskMM>:
c0105094:	55                   	push   %ebp
c0105095:	89 e5                	mov    %esp,%ebp
c0105097:	83 ec 28             	sub    $0x28,%esp
c010509a:	83 ec 0c             	sub    $0xc,%esp
c010509d:	6a 7c                	push   $0x7c
c010509f:	e8 88 c4 ff ff       	call   c010152c <sys_malloc>
c01050a4:	83 c4 10             	add    $0x10,%esp
c01050a7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01050aa:	83 ec 0c             	sub    $0xc,%esp
c01050ad:	6a 7c                	push   $0x7c
c01050af:	e8 78 c4 ff ff       	call   c010152c <sys_malloc>
c01050b4:	83 c4 10             	add    $0x10,%esp
c01050b7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01050ba:	83 ec 04             	sub    $0x4,%esp
c01050bd:	6a 12                	push   $0x12
c01050bf:	ff 75 f0             	pushl  -0x10(%ebp)
c01050c2:	6a 02                	push   $0x2
c01050c4:	e8 64 43 00 00       	call   c010942d <send_rec>
c01050c9:	83 c4 10             	add    $0x10,%esp
c01050cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01050cf:	8b 40 78             	mov    0x78(%eax),%eax
c01050d2:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01050d5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01050d8:	8b 00                	mov    (%eax),%eax
c01050da:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01050dd:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c01050e4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01050e7:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c01050ee:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01050f1:	c7 40 58 00 00 00 00 	movl   $0x0,0x58(%eax)
c01050f8:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c01050fc:	74 4e                	je     c010514c <TaskMM+0xb8>
c01050fe:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c0105102:	7f 08                	jg     c010510c <TaskMM+0x78>
c0105104:	83 7d e8 02          	cmpl   $0x2,-0x18(%ebp)
c0105108:	74 28                	je     c0105132 <TaskMM+0x9e>
c010510a:	eb 71                	jmp    c010517d <TaskMM+0xe9>
c010510c:	83 7d e8 04          	cmpl   $0x4,-0x18(%ebp)
c0105110:	74 08                	je     c010511a <TaskMM+0x86>
c0105112:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c0105116:	74 4e                	je     c0105166 <TaskMM+0xd2>
c0105118:	eb 63                	jmp    c010517d <TaskMM+0xe9>
c010511a:	83 ec 0c             	sub    $0xc,%esp
c010511d:	ff 75 f0             	pushl  -0x10(%ebp)
c0105120:	e8 d0 04 00 00       	call   c01055f5 <do_fork>
c0105125:	83 c4 10             	add    $0x10,%esp
c0105128:	89 c2                	mov    %eax,%edx
c010512a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010512d:	89 50 5c             	mov    %edx,0x5c(%eax)
c0105130:	eb 5c                	jmp    c010518e <TaskMM+0xfa>
c0105132:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0105139:	66 87 db             	xchg   %bx,%bx
c010513c:	83 ec 0c             	sub    $0xc,%esp
c010513f:	ff 75 f0             	pushl  -0x10(%ebp)
c0105142:	e8 95 00 00 00       	call   c01051dc <do_exec>
c0105147:	83 c4 10             	add    $0x10,%esp
c010514a:	eb 42                	jmp    c010518e <TaskMM+0xfa>
c010514c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0105153:	83 ec 08             	sub    $0x8,%esp
c0105156:	ff 75 e0             	pushl  -0x20(%ebp)
c0105159:	ff 75 f0             	pushl  -0x10(%ebp)
c010515c:	e8 02 05 00 00       	call   c0105663 <do_exit>
c0105161:	83 c4 10             	add    $0x10,%esp
c0105164:	eb 28                	jmp    c010518e <TaskMM+0xfa>
c0105166:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010516d:	83 ec 0c             	sub    $0xc,%esp
c0105170:	ff 75 f0             	pushl  -0x10(%ebp)
c0105173:	e8 75 05 00 00       	call   c01056ed <do_wait>
c0105178:	83 c4 10             	add    $0x10,%esp
c010517b:	eb 11                	jmp    c010518e <TaskMM+0xfa>
c010517d:	83 ec 0c             	sub    $0xc,%esp
c0105180:	68 44 a9 10 c0       	push   $0xc010a944
c0105185:	e8 15 36 00 00       	call   c010879f <panic>
c010518a:	83 c4 10             	add    $0x10,%esp
c010518d:	90                   	nop
c010518e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0105192:	0f 84 22 ff ff ff    	je     c01050ba <TaskMM+0x26>
c0105198:	83 ec 0c             	sub    $0xc,%esp
c010519b:	6a 03                	push   $0x3
c010519d:	e8 8a 31 00 00       	call   c010832c <delay>
c01051a2:	83 c4 10             	add    $0x10,%esp
c01051a5:	83 ec 04             	sub    $0x4,%esp
c01051a8:	ff 75 e4             	pushl  -0x1c(%ebp)
c01051ab:	ff 75 ec             	pushl  -0x14(%ebp)
c01051ae:	6a 01                	push   $0x1
c01051b0:	e8 78 42 00 00       	call   c010942d <send_rec>
c01051b5:	83 c4 10             	add    $0x10,%esp
c01051b8:	e9 fd fe ff ff       	jmp    c01050ba <TaskMM+0x26>

c01051bd <alloc_mem>:
c01051bd:	55                   	push   %ebp
c01051be:	89 e5                	mov    %esp,%ebp
c01051c0:	83 ec 10             	sub    $0x10,%esp
c01051c3:	8b 45 08             	mov    0x8(%ebp),%eax
c01051c6:	83 e8 08             	sub    $0x8,%eax
c01051c9:	69 c0 00 10 10 00    	imul   $0x101000,%eax,%eax
c01051cf:	05 00 00 a0 00       	add    $0xa00000,%eax
c01051d4:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01051d7:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01051da:	c9                   	leave  
c01051db:	c3                   	ret    

c01051dc <do_exec>:
c01051dc:	55                   	push   %ebp
c01051dd:	89 e5                	mov    %esp,%ebp
c01051df:	81 ec 38 01 00 00    	sub    $0x138,%esp
c01051e5:	c7 85 56 ff ff ff 64 	movl   $0x5f766564,-0xaa(%ebp)
c01051ec:	65 76 5f 
c01051ef:	c7 85 5a ff ff ff 74 	movl   $0x31797474,-0xa6(%ebp)
c01051f6:	74 79 31 
c01051f9:	66 c7 85 5e ff ff ff 	movw   $0x0,-0xa2(%ebp)
c0105200:	00 00 
c0105202:	83 ec 08             	sub    $0x8,%esp
c0105205:	6a 00                	push   $0x0
c0105207:	8d 85 56 ff ff ff    	lea    -0xaa(%ebp),%eax
c010520d:	50                   	push   %eax
c010520e:	e8 29 f8 ff ff       	call   c0104a3c <open>
c0105213:	83 c4 10             	add    $0x10,%esp
c0105216:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105219:	8b 45 08             	mov    0x8(%ebp),%eax
c010521c:	8b 00                	mov    (%eax),%eax
c010521e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0105221:	c7 45 d0 00 40 03 00 	movl   $0x34000,-0x30(%ebp)
c0105228:	8b 45 d0             	mov    -0x30(%ebp),%eax
c010522b:	83 ec 0c             	sub    $0xc,%esp
c010522e:	50                   	push   %eax
c010522f:	e8 f8 c2 ff ff       	call   c010152c <sys_malloc>
c0105234:	83 c4 10             	add    $0x10,%esp
c0105237:	89 45 cc             	mov    %eax,-0x34(%ebp)
c010523a:	83 ec 04             	sub    $0x4,%esp
c010523d:	ff 75 d0             	pushl  -0x30(%ebp)
c0105240:	6a 00                	push   $0x0
c0105242:	ff 75 cc             	pushl  -0x34(%ebp)
c0105245:	e8 2d 63 00 00       	call   c010b577 <Memset>
c010524a:	83 c4 10             	add    $0x10,%esp
c010524d:	83 ec 04             	sub    $0x4,%esp
c0105250:	6a 0c                	push   $0xc
c0105252:	6a 00                	push   $0x0
c0105254:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c010525a:	50                   	push   %eax
c010525b:	e8 17 63 00 00       	call   c010b577 <Memset>
c0105260:	83 c4 10             	add    $0x10,%esp
c0105263:	8b 45 08             	mov    0x8(%ebp),%eax
c0105266:	8b 40 44             	mov    0x44(%eax),%eax
c0105269:	89 45 c8             	mov    %eax,-0x38(%ebp)
c010526c:	8b 45 08             	mov    0x8(%ebp),%eax
c010526f:	8b 40 40             	mov    0x40(%eax),%eax
c0105272:	83 ec 08             	sub    $0x8,%esp
c0105275:	50                   	push   %eax
c0105276:	ff 75 c8             	pushl  -0x38(%ebp)
c0105279:	e8 de 0a 00 00       	call   c0105d5c <alloc_virtual_memory>
c010527e:	83 c4 10             	add    $0x10,%esp
c0105281:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0105284:	8b 45 08             	mov    0x8(%ebp),%eax
c0105287:	8b 40 40             	mov    0x40(%eax),%eax
c010528a:	89 c2                	mov    %eax,%edx
c010528c:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c010528f:	83 ec 04             	sub    $0x4,%esp
c0105292:	52                   	push   %edx
c0105293:	50                   	push   %eax
c0105294:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c010529a:	50                   	push   %eax
c010529b:	e8 29 19 00 00       	call   c0106bc9 <Memcpy>
c01052a0:	83 c4 10             	add    $0x10,%esp
c01052a3:	8b 45 08             	mov    0x8(%ebp),%eax
c01052a6:	8b 40 40             	mov    0x40(%eax),%eax
c01052a9:	c6 84 05 4a ff ff ff 	movb   $0x0,-0xb6(%ebp,%eax,1)
c01052b0:	00 
c01052b1:	83 ec 08             	sub    $0x8,%esp
c01052b4:	6a 00                	push   $0x0
c01052b6:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c01052bc:	50                   	push   %eax
c01052bd:	e8 7a f7 ff ff       	call   c0104a3c <open>
c01052c2:	83 c4 10             	add    $0x10,%esp
c01052c5:	89 45 c0             	mov    %eax,-0x40(%ebp)
c01052c8:	83 7d c0 ff          	cmpl   $0xffffffff,-0x40(%ebp)
c01052cc:	75 15                	jne    c01052e3 <do_exec+0x107>
c01052ce:	83 ec 0c             	sub    $0xc,%esp
c01052d1:	68 55 a9 10 c0       	push   $0xc010a955
c01052d6:	e8 85 31 00 00       	call   c0108460 <Printf>
c01052db:	83 c4 10             	add    $0x10,%esp
c01052de:	e9 10 03 00 00       	jmp    c01055f3 <do_exec+0x417>
c01052e3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01052ea:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01052ed:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01052f0:	01 d0                	add    %edx,%eax
c01052f2:	83 ec 04             	sub    $0x4,%esp
c01052f5:	68 00 10 00 00       	push   $0x1000
c01052fa:	50                   	push   %eax
c01052fb:	ff 75 c0             	pushl  -0x40(%ebp)
c01052fe:	e8 ce f7 ff ff       	call   c0104ad1 <read>
c0105303:	83 c4 10             	add    $0x10,%esp
c0105306:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0105309:	8b 45 bc             	mov    -0x44(%ebp),%eax
c010530c:	01 45 f4             	add    %eax,-0xc(%ebp)
c010530f:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
c0105313:	74 0a                	je     c010531f <do_exec+0x143>
c0105315:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105318:	3b 45 d0             	cmp    -0x30(%ebp),%eax
c010531b:	7d 05                	jge    c0105322 <do_exec+0x146>
c010531d:	eb cb                	jmp    c01052ea <do_exec+0x10e>
c010531f:	90                   	nop
c0105320:	eb 01                	jmp    c0105323 <do_exec+0x147>
c0105322:	90                   	nop
c0105323:	83 ec 0c             	sub    $0xc,%esp
c0105326:	ff 75 c0             	pushl  -0x40(%ebp)
c0105329:	e8 a9 f9 ff ff       	call   c0104cd7 <close>
c010532e:	83 c4 10             	add    $0x10,%esp
c0105331:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0105334:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0105337:	8b 45 b8             	mov    -0x48(%ebp),%eax
c010533a:	8b 40 18             	mov    0x18(%eax),%eax
c010533d:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0105340:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0105347:	e9 04 01 00 00       	jmp    c0105450 <do_exec+0x274>
c010534c:	8b 45 b8             	mov    -0x48(%ebp),%eax
c010534f:	0f b7 40 28          	movzwl 0x28(%eax),%eax
c0105353:	0f b7 d0             	movzwl %ax,%edx
c0105356:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0105359:	0f b7 40 2a          	movzwl 0x2a(%eax),%eax
c010535d:	0f b7 c0             	movzwl %ax,%eax
c0105360:	0f af 45 f0          	imul   -0x10(%ebp),%eax
c0105364:	01 c2                	add    %eax,%edx
c0105366:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0105369:	01 d0                	add    %edx,%eax
c010536b:	89 45 b0             	mov    %eax,-0x50(%ebp)
c010536e:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0105371:	8b 40 10             	mov    0x10(%eax),%eax
c0105374:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0105377:	8b 45 ac             	mov    -0x54(%ebp),%eax
c010537a:	05 ff 0f 00 00       	add    $0xfff,%eax
c010537f:	c1 e8 0c             	shr    $0xc,%eax
c0105382:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0105385:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0105388:	8b 40 08             	mov    0x8(%eax),%eax
c010538b:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c010538e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0105395:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0105398:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c010539b:	89 45 a0             	mov    %eax,-0x60(%ebp)
c010539e:	8b 45 b0             	mov    -0x50(%ebp),%eax
c01053a1:	8b 50 04             	mov    0x4(%eax),%edx
c01053a4:	8b 45 a0             	mov    -0x60(%ebp),%eax
c01053a7:	01 d0                	add    %edx,%eax
c01053a9:	89 45 9c             	mov    %eax,-0x64(%ebp)
c01053ac:	83 7d ac 00          	cmpl   $0x0,-0x54(%ebp)
c01053b0:	0f 84 95 00 00 00    	je     c010544b <do_exec+0x26f>
c01053b6:	83 ec 04             	sub    $0x4,%esp
c01053b9:	ff 75 d4             	pushl  -0x2c(%ebp)
c01053bc:	ff 75 a8             	pushl  -0x58(%ebp)
c01053bf:	ff 75 a4             	pushl  -0x5c(%ebp)
c01053c2:	e8 a0 07 00 00       	call   c0105b67 <get_virtual_address_start_with_addr>
c01053c7:	83 c4 10             	add    $0x10,%esp
c01053ca:	89 45 98             	mov    %eax,-0x68(%ebp)
c01053cd:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c01053d0:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01053d3:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01053da:	eb 41                	jmp    c010541d <do_exec+0x241>
c01053dc:	83 ec 08             	sub    $0x8,%esp
c01053df:	ff 75 d4             	pushl  -0x2c(%ebp)
c01053e2:	ff 75 e8             	pushl  -0x18(%ebp)
c01053e5:	e8 f3 0a 00 00       	call   c0105edd <alloc_physical_memory_of_proc>
c01053ea:	83 c4 10             	add    $0x10,%esp
c01053ed:	89 45 94             	mov    %eax,-0x6c(%ebp)
c01053f0:	83 ec 08             	sub    $0x8,%esp
c01053f3:	68 00 10 00 00       	push   $0x1000
c01053f8:	ff 75 94             	pushl  -0x6c(%ebp)
c01053fb:	e8 5c 09 00 00       	call   c0105d5c <alloc_virtual_memory>
c0105400:	83 c4 10             	add    $0x10,%esp
c0105403:	89 45 90             	mov    %eax,-0x70(%ebp)
c0105406:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c010540a:	75 06                	jne    c0105412 <do_exec+0x236>
c010540c:	8b 45 90             	mov    -0x70(%ebp),%eax
c010540f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105412:	81 45 e8 00 10 00 00 	addl   $0x1000,-0x18(%ebp)
c0105419:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c010541d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105420:	39 45 a8             	cmp    %eax,-0x58(%ebp)
c0105423:	77 b7                	ja     c01053dc <do_exec+0x200>
c0105425:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0105428:	8b 40 10             	mov    0x10(%eax),%eax
c010542b:	89 c1                	mov    %eax,%ecx
c010542d:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0105430:	8b 50 04             	mov    0x4(%eax),%edx
c0105433:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0105436:	01 c2                	add    %eax,%edx
c0105438:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010543b:	83 ec 04             	sub    $0x4,%esp
c010543e:	51                   	push   %ecx
c010543f:	52                   	push   %edx
c0105440:	50                   	push   %eax
c0105441:	e8 83 17 00 00       	call   c0106bc9 <Memcpy>
c0105446:	83 c4 10             	add    $0x10,%esp
c0105449:	eb 01                	jmp    c010544c <do_exec+0x270>
c010544b:	90                   	nop
c010544c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0105450:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0105453:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
c0105457:	0f b7 c0             	movzwl %ax,%eax
c010545a:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c010545d:	0f 8c e9 fe ff ff    	jl     c010534c <do_exec+0x170>
c0105463:	8b 45 08             	mov    0x8(%ebp),%eax
c0105466:	8b 40 10             	mov    0x10(%eax),%eax
c0105469:	89 45 8c             	mov    %eax,-0x74(%ebp)
c010546c:	8b 45 08             	mov    0x8(%ebp),%eax
c010546f:	8b 40 1c             	mov    0x1c(%eax),%eax
c0105472:	89 45 88             	mov    %eax,-0x78(%ebp)
c0105475:	8b 45 08             	mov    0x8(%ebp),%eax
c0105478:	8b 40 24             	mov    0x24(%eax),%eax
c010547b:	89 45 84             	mov    %eax,-0x7c(%ebp)
c010547e:	83 ec 0c             	sub    $0xc,%esp
c0105481:	ff 75 d4             	pushl  -0x2c(%ebp)
c0105484:	e8 9d e2 ff ff       	call   c0103726 <pid2proc>
c0105489:	83 c4 10             	add    $0x10,%esp
c010548c:	89 45 80             	mov    %eax,-0x80(%ebp)
c010548f:	8b 45 08             	mov    0x8(%ebp),%eax
c0105492:	8b 40 10             	mov    0x10(%eax),%eax
c0105495:	89 85 7c ff ff ff    	mov    %eax,-0x84(%ebp)
c010549b:	83 ec 08             	sub    $0x8,%esp
c010549e:	ff 75 88             	pushl  -0x78(%ebp)
c01054a1:	ff b5 7c ff ff ff    	pushl  -0x84(%ebp)
c01054a7:	e8 b0 08 00 00       	call   c0105d5c <alloc_virtual_memory>
c01054ac:	83 c4 10             	add    $0x10,%esp
c01054af:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c01054b5:	8b 45 08             	mov    0x8(%ebp),%eax
c01054b8:	8b 40 2c             	mov    0x2c(%eax),%eax
c01054bb:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
c01054c1:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c01054c8:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01054ce:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01054d1:	eb 1a                	jmp    c01054ed <do_exec+0x311>
c01054d3:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c01054d7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01054da:	8b 10                	mov    (%eax),%edx
c01054dc:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c01054e2:	01 c2                	add    %eax,%edx
c01054e4:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01054e7:	89 10                	mov    %edx,(%eax)
c01054e9:	83 45 dc 04          	addl   $0x4,-0x24(%ebp)
c01054ed:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01054f0:	8b 00                	mov    (%eax),%eax
c01054f2:	85 c0                	test   %eax,%eax
c01054f4:	75 dd                	jne    c01054d3 <do_exec+0x2f7>
c01054f6:	83 ec 0c             	sub    $0xc,%esp
c01054f9:	ff 75 84             	pushl  -0x7c(%ebp)
c01054fc:	e8 5b 08 00 00       	call   c0105d5c <alloc_virtual_memory>
c0105501:	83 c4 10             	add    $0x10,%esp
c0105504:	89 85 70 ff ff ff    	mov    %eax,-0x90(%ebp)
c010550a:	8b 95 78 ff ff ff    	mov    -0x88(%ebp),%edx
c0105510:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
c0105516:	83 ec 04             	sub    $0x4,%esp
c0105519:	ff 75 88             	pushl  -0x78(%ebp)
c010551c:	52                   	push   %edx
c010551d:	50                   	push   %eax
c010551e:	e8 a6 16 00 00       	call   c0106bc9 <Memcpy>
c0105523:	83 c4 10             	add    $0x10,%esp
c0105526:	8b 45 08             	mov    0x8(%ebp),%eax
c0105529:	8b 40 28             	mov    0x28(%eax),%eax
c010552c:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c0105532:	83 ec 08             	sub    $0x8,%esp
c0105535:	ff 75 d4             	pushl  -0x2c(%ebp)
c0105538:	ff 75 80             	pushl  -0x80(%ebp)
c010553b:	e8 ef 08 00 00       	call   c0105e2f <get_physical_address_proc>
c0105540:	83 c4 10             	add    $0x10,%esp
c0105543:	89 85 68 ff ff ff    	mov    %eax,-0x98(%ebp)
c0105549:	83 ec 08             	sub    $0x8,%esp
c010554c:	68 00 10 00 00       	push   $0x1000
c0105551:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
c0105557:	e8 00 08 00 00       	call   c0105d5c <alloc_virtual_memory>
c010555c:	83 c4 10             	add    $0x10,%esp
c010555f:	89 85 64 ff ff ff    	mov    %eax,-0x9c(%ebp)
c0105565:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
c010556b:	05 bc 0f 00 00       	add    $0xfbc,%eax
c0105570:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
c0105576:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c010557c:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0105582:	89 50 20             	mov    %edx,0x20(%eax)
c0105585:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0105588:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c010558e:	89 50 28             	mov    %edx,0x28(%eax)
c0105591:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0105594:	8b 40 18             	mov    0x18(%eax),%eax
c0105597:	89 c2                	mov    %eax,%edx
c0105599:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c010559f:	89 50 30             	mov    %edx,0x30(%eax)
c01055a2:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c01055a8:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c01055ae:	89 50 3c             	mov    %edx,0x3c(%eax)
c01055b1:	8b 45 80             	mov    -0x80(%ebp),%eax
c01055b4:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c01055bb:	00 00 00 
c01055be:	c7 85 44 ff ff ff 65 	movl   $0x65,-0xbc(%ebp)
c01055c5:	00 00 00 
c01055c8:	c7 85 24 ff ff ff 00 	movl   $0x0,-0xdc(%ebp)
c01055cf:	00 00 00 
c01055d2:	c7 85 28 ff ff ff 00 	movl   $0x0,-0xd8(%ebp)
c01055d9:	00 00 00 
c01055dc:	83 ec 04             	sub    $0x4,%esp
c01055df:	ff 75 d4             	pushl  -0x2c(%ebp)
c01055e2:	8d 85 cc fe ff ff    	lea    -0x134(%ebp),%eax
c01055e8:	50                   	push   %eax
c01055e9:	6a 01                	push   $0x1
c01055eb:	e8 3d 3e 00 00       	call   c010942d <send_rec>
c01055f0:	83 c4 10             	add    $0x10,%esp
c01055f3:	c9                   	leave  
c01055f4:	c3                   	ret    

c01055f5 <do_fork>:
c01055f5:	55                   	push   %ebp
c01055f6:	89 e5                	mov    %esp,%ebp
c01055f8:	81 ec 98 00 00 00    	sub    $0x98,%esp
c01055fe:	8b 45 08             	mov    0x8(%ebp),%eax
c0105601:	8b 00                	mov    (%eax),%eax
c0105603:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105606:	83 ec 0c             	sub    $0xc,%esp
c0105609:	ff 75 f4             	pushl  -0xc(%ebp)
c010560c:	e8 17 47 00 00       	call   c0109d28 <fork_process>
c0105611:	83 c4 10             	add    $0x10,%esp
c0105614:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105617:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010561a:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c0105620:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105623:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105626:	8b 90 14 01 00 00    	mov    0x114(%eax),%edx
c010562c:	8b 45 08             	mov    0x8(%ebp),%eax
c010562f:	89 50 5c             	mov    %edx,0x5c(%eax)
c0105632:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c0105639:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0105640:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0105647:	83 ec 04             	sub    $0x4,%esp
c010564a:	ff 75 ec             	pushl  -0x14(%ebp)
c010564d:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
c0105653:	50                   	push   %eax
c0105654:	6a 01                	push   $0x1
c0105656:	e8 d2 3d 00 00       	call   c010942d <send_rec>
c010565b:	83 c4 10             	add    $0x10,%esp
c010565e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105661:	c9                   	leave  
c0105662:	c3                   	ret    

c0105663 <do_exit>:
c0105663:	55                   	push   %ebp
c0105664:	89 e5                	mov    %esp,%ebp
c0105666:	83 ec 18             	sub    $0x18,%esp
c0105669:	8b 45 08             	mov    0x8(%ebp),%eax
c010566c:	8b 00                	mov    (%eax),%eax
c010566e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105671:	83 ec 0c             	sub    $0xc,%esp
c0105674:	ff 75 f4             	pushl  -0xc(%ebp)
c0105677:	e8 aa e0 ff ff       	call   c0103726 <pid2proc>
c010567c:	83 c4 10             	add    $0x10,%esp
c010567f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105682:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105685:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c010568b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010568e:	83 ec 0c             	sub    $0xc,%esp
c0105691:	ff 75 ec             	pushl  -0x14(%ebp)
c0105694:	e8 8d e0 ff ff       	call   c0103726 <pid2proc>
c0105699:	83 c4 10             	add    $0x10,%esp
c010569c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010569f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c01056a3:	74 45                	je     c01056ea <do_exit+0x87>
c01056a5:	8b 45 08             	mov    0x8(%ebp),%eax
c01056a8:	8b 40 54             	mov    0x54(%eax),%eax
c01056ab:	89 c2                	mov    %eax,%edx
c01056ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01056b0:	89 90 5c 02 00 00    	mov    %edx,0x25c(%eax)
c01056b6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01056b9:	0f b6 80 3d 02 00 00 	movzbl 0x23d(%eax),%eax
c01056c0:	3c 04                	cmp    $0x4,%al
c01056c2:	75 1a                	jne    c01056de <do_exit+0x7b>
c01056c4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01056c7:	c6 80 3d 02 00 00 fb 	movb   $0xfb,0x23d(%eax)
c01056ce:	83 ec 0c             	sub    $0xc,%esp
c01056d1:	ff 75 f0             	pushl  -0x10(%ebp)
c01056d4:	e8 33 01 00 00       	call   c010580c <cleanup>
c01056d9:	83 c4 10             	add    $0x10,%esp
c01056dc:	eb 0d                	jmp    c01056eb <do_exit+0x88>
c01056de:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01056e1:	c6 80 3c 02 00 00 03 	movb   $0x3,0x23c(%eax)
c01056e8:	eb 01                	jmp    c01056eb <do_exit+0x88>
c01056ea:	90                   	nop
c01056eb:	c9                   	leave  
c01056ec:	c3                   	ret    

c01056ed <do_wait>:
c01056ed:	55                   	push   %ebp
c01056ee:	89 e5                	mov    %esp,%ebp
c01056f0:	81 ec a8 00 00 00    	sub    $0xa8,%esp
c01056f6:	8b 45 08             	mov    0x8(%ebp),%eax
c01056f9:	8b 00                	mov    (%eax),%eax
c01056fb:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01056fe:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0105705:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010570c:	83 ec 0c             	sub    $0xc,%esp
c010570f:	ff 75 ec             	pushl  -0x14(%ebp)
c0105712:	e8 0f e0 ff ff       	call   c0103726 <pid2proc>
c0105717:	83 c4 10             	add    $0x10,%esp
c010571a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010571d:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0105721:	75 19                	jne    c010573c <do_wait+0x4f>
c0105723:	6a 58                	push   $0x58
c0105725:	68 65 a9 10 c0       	push   $0xc010a965
c010572a:	68 65 a9 10 c0       	push   $0xc010a965
c010572f:	68 73 a9 10 c0       	push   $0xc010a973
c0105734:	e8 84 30 00 00       	call   c01087bd <assertion_failure>
c0105739:	83 c4 10             	add    $0x10,%esp
c010573c:	a1 ec fd 10 c0       	mov    0xc010fdec,%eax
c0105741:	8b 15 f0 fd 10 c0    	mov    0xc010fdf0,%edx
c0105747:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010574a:	89 55 e0             	mov    %edx,-0x20(%ebp)
c010574d:	a1 f4 fd 10 c0       	mov    0xc010fdf4,%eax
c0105752:	8b 15 f8 fd 10 c0    	mov    0xc010fdf8,%edx
c0105758:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010575b:	89 55 d8             	mov    %edx,-0x28(%ebp)
c010575e:	a1 f0 fd 10 c0       	mov    0xc010fdf0,%eax
c0105763:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105766:	eb 5b                	jmp    c01057c3 <do_wait+0xd6>
c0105768:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010576b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105770:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105773:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105776:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c010577c:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c010577f:	74 0b                	je     c010578c <do_wait+0x9f>
c0105781:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105784:	8b 40 04             	mov    0x4(%eax),%eax
c0105787:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010578a:	eb 37                	jmp    c01057c3 <do_wait+0xd6>
c010578c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0105790:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105793:	0f b6 80 3d 02 00 00 	movzbl 0x23d(%eax),%eax
c010579a:	3c 03                	cmp    $0x3,%al
c010579c:	74 0b                	je     c01057a9 <do_wait+0xbc>
c010579e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01057a1:	8b 40 04             	mov    0x4(%eax),%eax
c01057a4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01057a7:	eb 1a                	jmp    c01057c3 <do_wait+0xd6>
c01057a9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01057ac:	c6 80 3d 02 00 00 fb 	movb   $0xfb,0x23d(%eax)
c01057b3:	83 ec 0c             	sub    $0xc,%esp
c01057b6:	ff 75 e8             	pushl  -0x18(%ebp)
c01057b9:	e8 4e 00 00 00       	call   c010580c <cleanup>
c01057be:	83 c4 10             	add    $0x10,%esp
c01057c1:	eb 47                	jmp    c010580a <do_wait+0x11d>
c01057c3:	81 7d f0 f4 fd 10 c0 	cmpl   $0xc010fdf4,-0x10(%ebp)
c01057ca:	75 9c                	jne    c0105768 <do_wait+0x7b>
c01057cc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01057d0:	74 0c                	je     c01057de <do_wait+0xf1>
c01057d2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01057d5:	c6 80 3d 02 00 00 04 	movb   $0x4,0x23d(%eax)
c01057dc:	eb 2c                	jmp    c010580a <do_wait+0x11d>
c01057de:	c7 45 d0 65 00 00 00 	movl   $0x65,-0x30(%ebp)
c01057e5:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
c01057ec:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
c01057f3:	83 ec 04             	sub    $0x4,%esp
c01057f6:	ff 75 ec             	pushl  -0x14(%ebp)
c01057f9:	8d 85 58 ff ff ff    	lea    -0xa8(%ebp),%eax
c01057ff:	50                   	push   %eax
c0105800:	6a 01                	push   $0x1
c0105802:	e8 26 3c 00 00       	call   c010942d <send_rec>
c0105807:	83 c4 10             	add    $0x10,%esp
c010580a:	c9                   	leave  
c010580b:	c3                   	ret    

c010580c <cleanup>:
c010580c:	55                   	push   %ebp
c010580d:	89 e5                	mov    %esp,%ebp
c010580f:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0105815:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c010581c:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0105823:	8b 45 08             	mov    0x8(%ebp),%eax
c0105826:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c010582c:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010582f:	8b 45 08             	mov    0x8(%ebp),%eax
c0105832:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c0105838:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010583b:	8b 45 08             	mov    0x8(%ebp),%eax
c010583e:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0105844:	83 ec 04             	sub    $0x4,%esp
c0105847:	50                   	push   %eax
c0105848:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c010584e:	50                   	push   %eax
c010584f:	6a 01                	push   $0x1
c0105851:	e8 d7 3b 00 00       	call   c010942d <send_rec>
c0105856:	83 c4 10             	add    $0x10,%esp
c0105859:	8b 45 08             	mov    0x8(%ebp),%eax
c010585c:	c6 80 3c 02 00 00 ff 	movb   $0xff,0x23c(%eax)
c0105863:	90                   	nop
c0105864:	c9                   	leave  
c0105865:	c3                   	ret    

c0105866 <init_bitmap>:
c0105866:	55                   	push   %ebp
c0105867:	89 e5                	mov    %esp,%ebp
c0105869:	83 ec 08             	sub    $0x8,%esp
c010586c:	8b 45 08             	mov    0x8(%ebp),%eax
c010586f:	8b 50 04             	mov    0x4(%eax),%edx
c0105872:	8b 45 08             	mov    0x8(%ebp),%eax
c0105875:	8b 00                	mov    (%eax),%eax
c0105877:	83 ec 04             	sub    $0x4,%esp
c010587a:	52                   	push   %edx
c010587b:	6a 00                	push   $0x0
c010587d:	50                   	push   %eax
c010587e:	e8 f4 5c 00 00       	call   c010b577 <Memset>
c0105883:	83 c4 10             	add    $0x10,%esp
c0105886:	90                   	nop
c0105887:	c9                   	leave  
c0105888:	c3                   	ret    

c0105889 <test_bit_val>:
c0105889:	55                   	push   %ebp
c010588a:	89 e5                	mov    %esp,%ebp
c010588c:	53                   	push   %ebx
c010588d:	83 ec 10             	sub    $0x10,%esp
c0105890:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105893:	8d 50 07             	lea    0x7(%eax),%edx
c0105896:	85 c0                	test   %eax,%eax
c0105898:	0f 48 c2             	cmovs  %edx,%eax
c010589b:	c1 f8 03             	sar    $0x3,%eax
c010589e:	89 45 f8             	mov    %eax,-0x8(%ebp)
c01058a1:	8b 45 0c             	mov    0xc(%ebp),%eax
c01058a4:	99                   	cltd   
c01058a5:	c1 ea 1d             	shr    $0x1d,%edx
c01058a8:	01 d0                	add    %edx,%eax
c01058aa:	83 e0 07             	and    $0x7,%eax
c01058ad:	29 d0                	sub    %edx,%eax
c01058af:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01058b2:	8b 45 08             	mov    0x8(%ebp),%eax
c01058b5:	8b 10                	mov    (%eax),%edx
c01058b7:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01058ba:	01 d0                	add    %edx,%eax
c01058bc:	0f b6 00             	movzbl (%eax),%eax
c01058bf:	88 45 f3             	mov    %al,-0xd(%ebp)
c01058c2:	0f be 55 f3          	movsbl -0xd(%ebp),%edx
c01058c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01058c9:	bb 01 00 00 00       	mov    $0x1,%ebx
c01058ce:	89 c1                	mov    %eax,%ecx
c01058d0:	d3 e3                	shl    %cl,%ebx
c01058d2:	89 d8                	mov    %ebx,%eax
c01058d4:	21 c2                	and    %eax,%edx
c01058d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01058d9:	89 c1                	mov    %eax,%ecx
c01058db:	d3 fa                	sar    %cl,%edx
c01058dd:	89 d0                	mov    %edx,%eax
c01058df:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01058e2:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c01058e6:	0f 9f c0             	setg   %al
c01058e9:	0f b6 c0             	movzbl %al,%eax
c01058ec:	83 c4 10             	add    $0x10,%esp
c01058ef:	5b                   	pop    %ebx
c01058f0:	5d                   	pop    %ebp
c01058f1:	c3                   	ret    

c01058f2 <set_bit_val>:
c01058f2:	55                   	push   %ebp
c01058f3:	89 e5                	mov    %esp,%ebp
c01058f5:	83 ec 10             	sub    $0x10,%esp
c01058f8:	8b 45 0c             	mov    0xc(%ebp),%eax
c01058fb:	8d 50 07             	lea    0x7(%eax),%edx
c01058fe:	85 c0                	test   %eax,%eax
c0105900:	0f 48 c2             	cmovs  %edx,%eax
c0105903:	c1 f8 03             	sar    $0x3,%eax
c0105906:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105909:	8b 45 0c             	mov    0xc(%ebp),%eax
c010590c:	99                   	cltd   
c010590d:	c1 ea 1d             	shr    $0x1d,%edx
c0105910:	01 d0                	add    %edx,%eax
c0105912:	83 e0 07             	and    $0x7,%eax
c0105915:	29 d0                	sub    %edx,%eax
c0105917:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010591a:	8b 45 08             	mov    0x8(%ebp),%eax
c010591d:	8b 10                	mov    (%eax),%edx
c010591f:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105922:	01 d0                	add    %edx,%eax
c0105924:	0f b6 00             	movzbl (%eax),%eax
c0105927:	88 45 ff             	mov    %al,-0x1(%ebp)
c010592a:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c010592e:	7e 13                	jle    c0105943 <set_bit_val+0x51>
c0105930:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105933:	ba 01 00 00 00       	mov    $0x1,%edx
c0105938:	89 c1                	mov    %eax,%ecx
c010593a:	d3 e2                	shl    %cl,%edx
c010593c:	89 d0                	mov    %edx,%eax
c010593e:	08 45 ff             	or     %al,-0x1(%ebp)
c0105941:	eb 13                	jmp    c0105956 <set_bit_val+0x64>
c0105943:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105946:	ba 01 00 00 00       	mov    $0x1,%edx
c010594b:	89 c1                	mov    %eax,%ecx
c010594d:	d3 e2                	shl    %cl,%edx
c010594f:	89 d0                	mov    %edx,%eax
c0105951:	f7 d0                	not    %eax
c0105953:	20 45 ff             	and    %al,-0x1(%ebp)
c0105956:	8b 45 08             	mov    0x8(%ebp),%eax
c0105959:	8b 10                	mov    (%eax),%edx
c010595b:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010595e:	01 c2                	add    %eax,%edx
c0105960:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
c0105964:	88 02                	mov    %al,(%edx)
c0105966:	b8 01 00 00 00       	mov    $0x1,%eax
c010596b:	c9                   	leave  
c010596c:	c3                   	ret    

c010596d <set_bits>:
c010596d:	55                   	push   %ebp
c010596e:	89 e5                	mov    %esp,%ebp
c0105970:	83 ec 10             	sub    $0x10,%esp
c0105973:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c010597a:	eb 1c                	jmp    c0105998 <set_bits+0x2b>
c010597c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010597f:	8d 50 01             	lea    0x1(%eax),%edx
c0105982:	89 55 0c             	mov    %edx,0xc(%ebp)
c0105985:	ff 75 10             	pushl  0x10(%ebp)
c0105988:	50                   	push   %eax
c0105989:	ff 75 08             	pushl  0x8(%ebp)
c010598c:	e8 61 ff ff ff       	call   c01058f2 <set_bit_val>
c0105991:	83 c4 0c             	add    $0xc,%esp
c0105994:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0105998:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010599b:	3b 45 14             	cmp    0x14(%ebp),%eax
c010599e:	7c dc                	jl     c010597c <set_bits+0xf>
c01059a0:	b8 01 00 00 00       	mov    $0x1,%eax
c01059a5:	c9                   	leave  
c01059a6:	c3                   	ret    

c01059a7 <get_first_free_bit>:
c01059a7:	55                   	push   %ebp
c01059a8:	89 e5                	mov    %esp,%ebp
c01059aa:	83 ec 10             	sub    $0x10,%esp
c01059ad:	8b 45 08             	mov    0x8(%ebp),%eax
c01059b0:	8b 40 04             	mov    0x4(%eax),%eax
c01059b3:	c1 e0 03             	shl    $0x3,%eax
c01059b6:	89 45 f8             	mov    %eax,-0x8(%ebp)
c01059b9:	8b 45 0c             	mov    0xc(%ebp),%eax
c01059bc:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01059bf:	eb 1b                	jmp    c01059dc <get_first_free_bit+0x35>
c01059c1:	ff 75 fc             	pushl  -0x4(%ebp)
c01059c4:	ff 75 08             	pushl  0x8(%ebp)
c01059c7:	e8 bd fe ff ff       	call   c0105889 <test_bit_val>
c01059cc:	83 c4 08             	add    $0x8,%esp
c01059cf:	85 c0                	test   %eax,%eax
c01059d1:	75 05                	jne    c01059d8 <get_first_free_bit+0x31>
c01059d3:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01059d6:	eb 11                	jmp    c01059e9 <get_first_free_bit+0x42>
c01059d8:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c01059dc:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01059df:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c01059e2:	7c dd                	jl     c01059c1 <get_first_free_bit+0x1a>
c01059e4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01059e9:	c9                   	leave  
c01059ea:	c3                   	ret    

c01059eb <get_bits>:
c01059eb:	55                   	push   %ebp
c01059ec:	89 e5                	mov    %esp,%ebp
c01059ee:	83 ec 20             	sub    $0x20,%esp
c01059f1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01059f8:	ff 75 f0             	pushl  -0x10(%ebp)
c01059fb:	ff 75 08             	pushl  0x8(%ebp)
c01059fe:	e8 a4 ff ff ff       	call   c01059a7 <get_first_free_bit>
c0105a03:	83 c4 08             	add    $0x8,%esp
c0105a06:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105a09:	8b 45 08             	mov    0x8(%ebp),%eax
c0105a0c:	8b 40 04             	mov    0x4(%eax),%eax
c0105a0f:	c1 e0 03             	shl    $0x3,%eax
c0105a12:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105a15:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105a18:	83 e8 01             	sub    $0x1,%eax
c0105a1b:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105a1e:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c0105a22:	75 08                	jne    c0105a2c <get_bits+0x41>
c0105a24:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105a27:	e9 85 00 00 00       	jmp    c0105ab1 <get_bits+0xc6>
c0105a2c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105a2f:	83 c0 01             	add    $0x1,%eax
c0105a32:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105a35:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105a38:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105a3b:	eb 58                	jmp    c0105a95 <get_bits+0xaa>
c0105a3d:	ff 75 f8             	pushl  -0x8(%ebp)
c0105a40:	ff 75 08             	pushl  0x8(%ebp)
c0105a43:	e8 41 fe ff ff       	call   c0105889 <test_bit_val>
c0105a48:	83 c4 08             	add    $0x8,%esp
c0105a4b:	85 c0                	test   %eax,%eax
c0105a4d:	75 0a                	jne    c0105a59 <get_bits+0x6e>
c0105a4f:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0105a53:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0105a57:	eb 2b                	jmp    c0105a84 <get_bits+0x99>
c0105a59:	6a 00                	push   $0x0
c0105a5b:	ff 75 08             	pushl  0x8(%ebp)
c0105a5e:	e8 44 ff ff ff       	call   c01059a7 <get_first_free_bit>
c0105a63:	83 c4 08             	add    $0x8,%esp
c0105a66:	83 c0 01             	add    $0x1,%eax
c0105a69:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105a6c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105a6f:	83 c0 01             	add    $0x1,%eax
c0105a72:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105a75:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105a78:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105a7b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105a7e:	83 e8 01             	sub    $0x1,%eax
c0105a81:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105a84:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105a87:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c0105a8a:	7c 09                	jl     c0105a95 <get_bits+0xaa>
c0105a8c:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c0105a93:	eb 0d                	jmp    c0105aa2 <get_bits+0xb7>
c0105a95:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105a98:	8d 50 ff             	lea    -0x1(%eax),%edx
c0105a9b:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0105a9e:	85 c0                	test   %eax,%eax
c0105aa0:	7f 9b                	jg     c0105a3d <get_bits+0x52>
c0105aa2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105aa5:	2b 45 0c             	sub    0xc(%ebp),%eax
c0105aa8:	83 c0 01             	add    $0x1,%eax
c0105aab:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105aae:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105ab1:	c9                   	leave  
c0105ab2:	c3                   	ret    

c0105ab3 <get_a_page>:
c0105ab3:	55                   	push   %ebp
c0105ab4:	89 e5                	mov    %esp,%ebp
c0105ab6:	83 ec 28             	sub    $0x28,%esp
c0105ab9:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0105abd:	75 22                	jne    c0105ae1 <get_a_page+0x2e>
c0105abf:	a1 ac 06 11 c0       	mov    0xc01106ac,%eax
c0105ac4:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105ac7:	a1 b0 06 11 c0       	mov    0xc01106b0,%eax
c0105acc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105acf:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0105ad4:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105ad7:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c0105adc:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105adf:	eb 20                	jmp    c0105b01 <get_a_page+0x4e>
c0105ae1:	a1 f4 0e 11 c0       	mov    0xc0110ef4,%eax
c0105ae6:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105ae9:	a1 f8 0e 11 c0       	mov    0xc0110ef8,%eax
c0105aee:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105af1:	a1 fc 0e 11 c0       	mov    0xc0110efc,%eax
c0105af6:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105af9:	a1 00 0f 11 c0       	mov    0xc0110f00,%eax
c0105afe:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105b01:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105b04:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0105b07:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105b0a:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0105b0d:	6a 01                	push   $0x1
c0105b0f:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105b12:	50                   	push   %eax
c0105b13:	e8 d3 fe ff ff       	call   c01059eb <get_bits>
c0105b18:	83 c4 08             	add    $0x8,%esp
c0105b1b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105b1e:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c0105b22:	75 1c                	jne    c0105b40 <get_a_page+0x8d>
c0105b24:	68 84 00 00 00       	push   $0x84
c0105b29:	68 86 a9 10 c0       	push   $0xc010a986
c0105b2e:	68 86 a9 10 c0       	push   $0xc010a986
c0105b33:	68 90 a9 10 c0       	push   $0xc010a990
c0105b38:	e8 80 2c 00 00       	call   c01087bd <assertion_failure>
c0105b3d:	83 c4 10             	add    $0x10,%esp
c0105b40:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105b43:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0105b46:	c1 e2 0c             	shl    $0xc,%edx
c0105b49:	01 d0                	add    %edx,%eax
c0105b4b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105b4e:	83 ec 04             	sub    $0x4,%esp
c0105b51:	6a 01                	push   $0x1
c0105b53:	ff 75 f4             	pushl  -0xc(%ebp)
c0105b56:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105b59:	50                   	push   %eax
c0105b5a:	e8 93 fd ff ff       	call   c01058f2 <set_bit_val>
c0105b5f:	83 c4 10             	add    $0x10,%esp
c0105b62:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105b65:	c9                   	leave  
c0105b66:	c3                   	ret    

c0105b67 <get_virtual_address_start_with_addr>:
c0105b67:	55                   	push   %ebp
c0105b68:	89 e5                	mov    %esp,%ebp
c0105b6a:	83 ec 38             	sub    $0x38,%esp
c0105b6d:	e8 31 a8 ff ff       	call   c01003a3 <get_running_thread_pcb>
c0105b72:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105b75:	83 ec 0c             	sub    $0xc,%esp
c0105b78:	ff 75 10             	pushl  0x10(%ebp)
c0105b7b:	e8 a6 db ff ff       	call   c0103726 <pid2proc>
c0105b80:	83 c4 10             	add    $0x10,%esp
c0105b83:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105b86:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105b89:	8b 40 0c             	mov    0xc(%eax),%eax
c0105b8c:	83 ec 04             	sub    $0x4,%esp
c0105b8f:	6a 0c                	push   $0xc
c0105b91:	50                   	push   %eax
c0105b92:	8d 45 dc             	lea    -0x24(%ebp),%eax
c0105b95:	50                   	push   %eax
c0105b96:	e8 2e 10 00 00       	call   c0106bc9 <Memcpy>
c0105b9b:	83 c4 10             	add    $0x10,%esp
c0105b9e:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105ba1:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0105ba4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0105ba7:	89 55 d8             	mov    %edx,-0x28(%ebp)
c0105baa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105bad:	8b 55 08             	mov    0x8(%ebp),%edx
c0105bb0:	29 c2                	sub    %eax,%edx
c0105bb2:	89 d0                	mov    %edx,%eax
c0105bb4:	c1 e8 0c             	shr    $0xc,%eax
c0105bb7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105bba:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0105bbe:	79 1c                	jns    c0105bdc <get_virtual_address_start_with_addr+0x75>
c0105bc0:	68 97 00 00 00       	push   $0x97
c0105bc5:	68 86 a9 10 c0       	push   $0xc010a986
c0105bca:	68 86 a9 10 c0       	push   $0xc010a986
c0105bcf:	68 9c a9 10 c0       	push   $0xc010a99c
c0105bd4:	e8 e4 2b 00 00       	call   c01087bd <assertion_failure>
c0105bd9:	83 c4 10             	add    $0x10,%esp
c0105bdc:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105bdf:	50                   	push   %eax
c0105be0:	6a 01                	push   $0x1
c0105be2:	ff 75 ec             	pushl  -0x14(%ebp)
c0105be5:	8d 45 d4             	lea    -0x2c(%ebp),%eax
c0105be8:	50                   	push   %eax
c0105be9:	e8 7f fd ff ff       	call   c010596d <set_bits>
c0105bee:	83 c4 10             	add    $0x10,%esp
c0105bf1:	8b 45 08             	mov    0x8(%ebp),%eax
c0105bf4:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105bf9:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105bfc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105bff:	c9                   	leave  
c0105c00:	c3                   	ret    

c0105c01 <get_virtual_address>:
c0105c01:	55                   	push   %ebp
c0105c02:	89 e5                	mov    %esp,%ebp
c0105c04:	83 ec 28             	sub    $0x28,%esp
c0105c07:	e8 97 a7 ff ff       	call   c01003a3 <get_running_thread_pcb>
c0105c0c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105c0f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0105c13:	75 1a                	jne    c0105c2f <get_virtual_address+0x2e>
c0105c15:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0105c1a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105c1d:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0105c22:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105c25:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c0105c2a:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105c2d:	eb 18                	jmp    c0105c47 <get_virtual_address+0x46>
c0105c2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105c32:	8b 40 0c             	mov    0xc(%eax),%eax
c0105c35:	83 ec 04             	sub    $0x4,%esp
c0105c38:	6a 0c                	push   $0xc
c0105c3a:	50                   	push   %eax
c0105c3b:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0105c3e:	50                   	push   %eax
c0105c3f:	e8 85 0f 00 00       	call   c0106bc9 <Memcpy>
c0105c44:	83 c4 10             	add    $0x10,%esp
c0105c47:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105c4a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0105c4d:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105c50:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0105c53:	8b 45 08             	mov    0x8(%ebp),%eax
c0105c56:	83 ec 08             	sub    $0x8,%esp
c0105c59:	50                   	push   %eax
c0105c5a:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105c5d:	50                   	push   %eax
c0105c5e:	e8 88 fd ff ff       	call   c01059eb <get_bits>
c0105c63:	83 c4 10             	add    $0x10,%esp
c0105c66:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105c69:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105c6c:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0105c6f:	c1 e2 0c             	shl    $0xc,%edx
c0105c72:	01 d0                	add    %edx,%eax
c0105c74:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105c77:	8b 45 08             	mov    0x8(%ebp),%eax
c0105c7a:	50                   	push   %eax
c0105c7b:	6a 01                	push   $0x1
c0105c7d:	ff 75 f0             	pushl  -0x10(%ebp)
c0105c80:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105c83:	50                   	push   %eax
c0105c84:	e8 e4 fc ff ff       	call   c010596d <set_bits>
c0105c89:	83 c4 10             	add    $0x10,%esp
c0105c8c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105c8f:	c9                   	leave  
c0105c90:	c3                   	ret    

c0105c91 <ptr_pde>:
c0105c91:	55                   	push   %ebp
c0105c92:	89 e5                	mov    %esp,%ebp
c0105c94:	8b 45 08             	mov    0x8(%ebp),%eax
c0105c97:	c1 e8 16             	shr    $0x16,%eax
c0105c9a:	05 00 fc ff 3f       	add    $0x3ffffc00,%eax
c0105c9f:	c1 e0 02             	shl    $0x2,%eax
c0105ca2:	5d                   	pop    %ebp
c0105ca3:	c3                   	ret    

c0105ca4 <ptr_pte>:
c0105ca4:	55                   	push   %ebp
c0105ca5:	89 e5                	mov    %esp,%ebp
c0105ca7:	8b 45 08             	mov    0x8(%ebp),%eax
c0105caa:	c1 e8 0a             	shr    $0xa,%eax
c0105cad:	25 00 f0 3f 00       	and    $0x3ff000,%eax
c0105cb2:	89 c2                	mov    %eax,%edx
c0105cb4:	8b 45 08             	mov    0x8(%ebp),%eax
c0105cb7:	c1 e8 0c             	shr    $0xc,%eax
c0105cba:	25 ff 03 00 00       	and    $0x3ff,%eax
c0105cbf:	c1 e0 02             	shl    $0x2,%eax
c0105cc2:	01 d0                	add    %edx,%eax
c0105cc4:	2d 00 00 40 00       	sub    $0x400000,%eax
c0105cc9:	5d                   	pop    %ebp
c0105cca:	c3                   	ret    

c0105ccb <add_map_entry>:
c0105ccb:	55                   	push   %ebp
c0105ccc:	89 e5                	mov    %esp,%ebp
c0105cce:	83 ec 18             	sub    $0x18,%esp
c0105cd1:	ff 75 08             	pushl  0x8(%ebp)
c0105cd4:	e8 b8 ff ff ff       	call   c0105c91 <ptr_pde>
c0105cd9:	83 c4 04             	add    $0x4,%esp
c0105cdc:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105cdf:	ff 75 08             	pushl  0x8(%ebp)
c0105ce2:	e8 bd ff ff ff       	call   c0105ca4 <ptr_pte>
c0105ce7:	83 c4 04             	add    $0x4,%esp
c0105cea:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105ced:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105cf0:	8b 00                	mov    (%eax),%eax
c0105cf2:	83 e0 01             	and    $0x1,%eax
c0105cf5:	85 c0                	test   %eax,%eax
c0105cf7:	74 1b                	je     c0105d14 <add_map_entry+0x49>
c0105cf9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105cfc:	8b 00                	mov    (%eax),%eax
c0105cfe:	83 e0 01             	and    $0x1,%eax
c0105d01:	85 c0                	test   %eax,%eax
c0105d03:	75 54                	jne    c0105d59 <add_map_entry+0x8e>
c0105d05:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105d08:	83 c8 07             	or     $0x7,%eax
c0105d0b:	89 c2                	mov    %eax,%edx
c0105d0d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105d10:	89 10                	mov    %edx,(%eax)
c0105d12:	eb 45                	jmp    c0105d59 <add_map_entry+0x8e>
c0105d14:	83 ec 0c             	sub    $0xc,%esp
c0105d17:	6a 00                	push   $0x0
c0105d19:	e8 95 fd ff ff       	call   c0105ab3 <get_a_page>
c0105d1e:	83 c4 10             	add    $0x10,%esp
c0105d21:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105d24:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105d27:	83 c8 07             	or     $0x7,%eax
c0105d2a:	89 c2                	mov    %eax,%edx
c0105d2c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105d2f:	89 10                	mov    %edx,(%eax)
c0105d31:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105d34:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105d39:	83 ec 04             	sub    $0x4,%esp
c0105d3c:	68 00 10 00 00       	push   $0x1000
c0105d41:	6a 00                	push   $0x0
c0105d43:	50                   	push   %eax
c0105d44:	e8 2e 58 00 00       	call   c010b577 <Memset>
c0105d49:	83 c4 10             	add    $0x10,%esp
c0105d4c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105d4f:	83 c8 07             	or     $0x7,%eax
c0105d52:	89 c2                	mov    %eax,%edx
c0105d54:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105d57:	89 10                	mov    %edx,(%eax)
c0105d59:	90                   	nop
c0105d5a:	c9                   	leave  
c0105d5b:	c3                   	ret    

c0105d5c <alloc_virtual_memory>:
c0105d5c:	55                   	push   %ebp
c0105d5d:	89 e5                	mov    %esp,%ebp
c0105d5f:	83 ec 28             	sub    $0x28,%esp
c0105d62:	8b 45 08             	mov    0x8(%ebp),%eax
c0105d65:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105d6a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105d6d:	8b 45 08             	mov    0x8(%ebp),%eax
c0105d70:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0105d73:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105d76:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105d79:	01 45 e4             	add    %eax,-0x1c(%ebp)
c0105d7c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105d7f:	05 ff 0f 00 00       	add    $0xfff,%eax
c0105d84:	c1 e8 0c             	shr    $0xc,%eax
c0105d87:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105d8a:	e8 14 a6 ff ff       	call   c01003a3 <get_running_thread_pcb>
c0105d8f:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105d92:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105d95:	8b 50 08             	mov    0x8(%eax),%edx
c0105d98:	a1 28 0f 11 c0       	mov    0xc0110f28,%eax
c0105d9d:	39 c2                	cmp    %eax,%edx
c0105d9f:	75 09                	jne    c0105daa <alloc_virtual_memory+0x4e>
c0105da1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0105da8:	eb 07                	jmp    c0105db1 <alloc_virtual_memory+0x55>
c0105daa:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0105db1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0105db8:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0105dbf:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0105dc6:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0105dcd:	eb 47                	jmp    c0105e16 <alloc_virtual_memory+0xba>
c0105dcf:	83 ec 08             	sub    $0x8,%esp
c0105dd2:	ff 75 f0             	pushl  -0x10(%ebp)
c0105dd5:	6a 01                	push   $0x1
c0105dd7:	e8 25 fe ff ff       	call   c0105c01 <get_virtual_address>
c0105ddc:	83 c4 10             	add    $0x10,%esp
c0105ddf:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105de2:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0105de6:	74 13                	je     c0105dfb <alloc_virtual_memory+0x9f>
c0105de8:	83 ec 0c             	sub    $0xc,%esp
c0105deb:	ff 75 f0             	pushl  -0x10(%ebp)
c0105dee:	e8 c0 fc ff ff       	call   c0105ab3 <get_a_page>
c0105df3:	83 c4 10             	add    $0x10,%esp
c0105df6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105df9:	eb 06                	jmp    c0105e01 <alloc_virtual_memory+0xa5>
c0105dfb:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0105dfe:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105e01:	83 ec 08             	sub    $0x8,%esp
c0105e04:	ff 75 f4             	pushl  -0xc(%ebp)
c0105e07:	ff 75 d8             	pushl  -0x28(%ebp)
c0105e0a:	e8 bc fe ff ff       	call   c0105ccb <add_map_entry>
c0105e0f:	83 c4 10             	add    $0x10,%esp
c0105e12:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0105e16:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105e19:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c0105e1c:	72 b1                	jb     c0105dcf <alloc_virtual_memory+0x73>
c0105e1e:	8b 45 08             	mov    0x8(%ebp),%eax
c0105e21:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105e26:	89 c2                	mov    %eax,%edx
c0105e28:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105e2b:	01 d0                	add    %edx,%eax
c0105e2d:	c9                   	leave  
c0105e2e:	c3                   	ret    

c0105e2f <get_physical_address_proc>:
c0105e2f:	55                   	push   %ebp
c0105e30:	89 e5                	mov    %esp,%ebp
c0105e32:	83 ec 18             	sub    $0x18,%esp
c0105e35:	e8 8d a4 ff ff       	call   c01002c7 <disable_int>
c0105e3a:	e8 64 a5 ff ff       	call   c01003a3 <get_running_thread_pcb>
c0105e3f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105e42:	83 ec 0c             	sub    $0xc,%esp
c0105e45:	ff 75 0c             	pushl  0xc(%ebp)
c0105e48:	e8 d9 d8 ff ff       	call   c0103726 <pid2proc>
c0105e4d:	83 c4 10             	add    $0x10,%esp
c0105e50:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105e53:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105e56:	8b 40 08             	mov    0x8(%eax),%eax
c0105e59:	83 ec 0c             	sub    $0xc,%esp
c0105e5c:	50                   	push   %eax
c0105e5d:	e8 25 a5 ff ff       	call   c0100387 <update_cr3>
c0105e62:	83 c4 10             	add    $0x10,%esp
c0105e65:	83 ec 0c             	sub    $0xc,%esp
c0105e68:	ff 75 08             	pushl  0x8(%ebp)
c0105e6b:	e8 34 fe ff ff       	call   c0105ca4 <ptr_pte>
c0105e70:	83 c4 10             	add    $0x10,%esp
c0105e73:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105e76:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105e79:	8b 00                	mov    (%eax),%eax
c0105e7b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105e80:	89 c2                	mov    %eax,%edx
c0105e82:	8b 45 08             	mov    0x8(%ebp),%eax
c0105e85:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105e8a:	09 d0                	or     %edx,%eax
c0105e8c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105e8f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105e92:	8b 40 08             	mov    0x8(%eax),%eax
c0105e95:	83 ec 0c             	sub    $0xc,%esp
c0105e98:	50                   	push   %eax
c0105e99:	e8 e9 a4 ff ff       	call   c0100387 <update_cr3>
c0105e9e:	83 c4 10             	add    $0x10,%esp
c0105ea1:	e8 23 a4 ff ff       	call   c01002c9 <enable_int>
c0105ea6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105ea9:	c9                   	leave  
c0105eaa:	c3                   	ret    

c0105eab <get_physical_address>:
c0105eab:	55                   	push   %ebp
c0105eac:	89 e5                	mov    %esp,%ebp
c0105eae:	83 ec 10             	sub    $0x10,%esp
c0105eb1:	ff 75 08             	pushl  0x8(%ebp)
c0105eb4:	e8 eb fd ff ff       	call   c0105ca4 <ptr_pte>
c0105eb9:	83 c4 04             	add    $0x4,%esp
c0105ebc:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105ebf:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105ec2:	8b 00                	mov    (%eax),%eax
c0105ec4:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105ec9:	89 c2                	mov    %eax,%edx
c0105ecb:	8b 45 08             	mov    0x8(%ebp),%eax
c0105ece:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105ed3:	09 d0                	or     %edx,%eax
c0105ed5:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105ed8:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105edb:	c9                   	leave  
c0105edc:	c3                   	ret    

c0105edd <alloc_physical_memory_of_proc>:
c0105edd:	55                   	push   %ebp
c0105ede:	89 e5                	mov    %esp,%ebp
c0105ee0:	83 ec 48             	sub    $0x48,%esp
c0105ee3:	e8 df a3 ff ff       	call   c01002c7 <disable_int>
c0105ee8:	8b 45 08             	mov    0x8(%ebp),%eax
c0105eeb:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105ef0:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105ef3:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0105efa:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105efd:	83 ec 0c             	sub    $0xc,%esp
c0105f00:	50                   	push   %eax
c0105f01:	e8 20 d8 ff ff       	call   c0103726 <pid2proc>
c0105f06:	83 c4 10             	add    $0x10,%esp
c0105f09:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105f0c:	e8 92 a4 ff ff       	call   c01003a3 <get_running_thread_pcb>
c0105f11:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105f14:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105f17:	8b 40 0c             	mov    0xc(%eax),%eax
c0105f1a:	83 ec 04             	sub    $0x4,%esp
c0105f1d:	6a 0c                	push   $0xc
c0105f1f:	50                   	push   %eax
c0105f20:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0105f23:	50                   	push   %eax
c0105f24:	e8 a0 0c 00 00       	call   c0106bc9 <Memcpy>
c0105f29:	83 c4 10             	add    $0x10,%esp
c0105f2c:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0105f2f:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0105f32:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0105f35:	89 55 c8             	mov    %edx,-0x38(%ebp)
c0105f38:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0105f3b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0105f3e:	29 c2                	sub    %eax,%edx
c0105f40:	89 d0                	mov    %edx,%eax
c0105f42:	c1 e8 0c             	shr    $0xc,%eax
c0105f45:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105f48:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0105f4b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0105f4e:	c1 e2 0c             	shl    $0xc,%edx
c0105f51:	01 d0                	add    %edx,%eax
c0105f53:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105f56:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105f59:	6a 01                	push   $0x1
c0105f5b:	6a 01                	push   $0x1
c0105f5d:	50                   	push   %eax
c0105f5e:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0105f61:	50                   	push   %eax
c0105f62:	e8 06 fa ff ff       	call   c010596d <set_bits>
c0105f67:	83 c4 10             	add    $0x10,%esp
c0105f6a:	83 ec 0c             	sub    $0xc,%esp
c0105f6d:	ff 75 f0             	pushl  -0x10(%ebp)
c0105f70:	e8 3e fb ff ff       	call   c0105ab3 <get_a_page>
c0105f75:	83 c4 10             	add    $0x10,%esp
c0105f78:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105f7b:	8b 45 08             	mov    0x8(%ebp),%eax
c0105f7e:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105f83:	89 c2                	mov    %eax,%edx
c0105f85:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105f88:	01 d0                	add    %edx,%eax
c0105f8a:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105f8d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105f90:	8b 40 08             	mov    0x8(%eax),%eax
c0105f93:	83 ec 0c             	sub    $0xc,%esp
c0105f96:	50                   	push   %eax
c0105f97:	e8 eb a3 ff ff       	call   c0100387 <update_cr3>
c0105f9c:	83 c4 10             	add    $0x10,%esp
c0105f9f:	83 ec 08             	sub    $0x8,%esp
c0105fa2:	ff 75 dc             	pushl  -0x24(%ebp)
c0105fa5:	ff 75 f4             	pushl  -0xc(%ebp)
c0105fa8:	e8 1e fd ff ff       	call   c0105ccb <add_map_entry>
c0105fad:	83 c4 10             	add    $0x10,%esp
c0105fb0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105fb3:	8b 40 08             	mov    0x8(%eax),%eax
c0105fb6:	83 ec 0c             	sub    $0xc,%esp
c0105fb9:	50                   	push   %eax
c0105fba:	e8 c8 a3 ff ff       	call   c0100387 <update_cr3>
c0105fbf:	83 c4 10             	add    $0x10,%esp
c0105fc2:	e8 02 a3 ff ff       	call   c01002c9 <enable_int>
c0105fc7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0105fca:	c9                   	leave  
c0105fcb:	c3                   	ret    

c0105fcc <alloc_physical_memory>:
c0105fcc:	55                   	push   %ebp
c0105fcd:	89 e5                	mov    %esp,%ebp
c0105fcf:	83 ec 38             	sub    $0x38,%esp
c0105fd2:	8b 45 08             	mov    0x8(%ebp),%eax
c0105fd5:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105fda:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105fdd:	e8 c1 a3 ff ff       	call   c01003a3 <get_running_thread_pcb>
c0105fe2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105fe5:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0105fe9:	75 1a                	jne    c0106005 <alloc_physical_memory+0x39>
c0105feb:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0105ff0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0105ff3:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0105ff8:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105ffb:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c0106000:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0106003:	eb 18                	jmp    c010601d <alloc_physical_memory+0x51>
c0106005:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106008:	8b 40 0c             	mov    0xc(%eax),%eax
c010600b:	83 ec 04             	sub    $0x4,%esp
c010600e:	6a 0c                	push   $0xc
c0106010:	50                   	push   %eax
c0106011:	8d 45 d4             	lea    -0x2c(%ebp),%eax
c0106014:	50                   	push   %eax
c0106015:	e8 af 0b 00 00       	call   c0106bc9 <Memcpy>
c010601a:	83 c4 10             	add    $0x10,%esp
c010601d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106020:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0106023:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0106026:	89 55 d0             	mov    %edx,-0x30(%ebp)
c0106029:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010602c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010602f:	29 c2                	sub    %eax,%edx
c0106031:	89 d0                	mov    %edx,%eax
c0106033:	c1 e8 0c             	shr    $0xc,%eax
c0106036:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106039:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010603c:	8b 55 ec             	mov    -0x14(%ebp),%edx
c010603f:	c1 e2 0c             	shl    $0xc,%edx
c0106042:	01 d0                	add    %edx,%eax
c0106044:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106047:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010604a:	6a 01                	push   $0x1
c010604c:	6a 01                	push   $0x1
c010604e:	50                   	push   %eax
c010604f:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0106052:	50                   	push   %eax
c0106053:	e8 15 f9 ff ff       	call   c010596d <set_bits>
c0106058:	83 c4 10             	add    $0x10,%esp
c010605b:	83 ec 0c             	sub    $0xc,%esp
c010605e:	ff 75 0c             	pushl  0xc(%ebp)
c0106061:	e8 4d fa ff ff       	call   c0105ab3 <get_a_page>
c0106066:	83 c4 10             	add    $0x10,%esp
c0106069:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010606c:	8b 45 08             	mov    0x8(%ebp),%eax
c010606f:	25 ff 0f 00 00       	and    $0xfff,%eax
c0106074:	89 c2                	mov    %eax,%edx
c0106076:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106079:	01 d0                	add    %edx,%eax
c010607b:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010607e:	83 ec 08             	sub    $0x8,%esp
c0106081:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106084:	ff 75 f4             	pushl  -0xc(%ebp)
c0106087:	e8 3f fc ff ff       	call   c0105ccb <add_map_entry>
c010608c:	83 c4 10             	add    $0x10,%esp
c010608f:	8b 45 08             	mov    0x8(%ebp),%eax
c0106092:	c9                   	leave  
c0106093:	c3                   	ret    

c0106094 <alloc_memory>:
c0106094:	55                   	push   %ebp
c0106095:	89 e5                	mov    %esp,%ebp
c0106097:	83 ec 18             	sub    $0x18,%esp
c010609a:	83 ec 08             	sub    $0x8,%esp
c010609d:	ff 75 0c             	pushl  0xc(%ebp)
c01060a0:	ff 75 08             	pushl  0x8(%ebp)
c01060a3:	e8 59 fb ff ff       	call   c0105c01 <get_virtual_address>
c01060a8:	83 c4 10             	add    $0x10,%esp
c01060ab:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01060ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01060b1:	2d 00 10 00 00       	sub    $0x1000,%eax
c01060b6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01060b9:	eb 29                	jmp    c01060e4 <alloc_memory+0x50>
c01060bb:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c01060c2:	83 ec 0c             	sub    $0xc,%esp
c01060c5:	ff 75 0c             	pushl  0xc(%ebp)
c01060c8:	e8 e6 f9 ff ff       	call   c0105ab3 <get_a_page>
c01060cd:	83 c4 10             	add    $0x10,%esp
c01060d0:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01060d3:	83 ec 08             	sub    $0x8,%esp
c01060d6:	ff 75 ec             	pushl  -0x14(%ebp)
c01060d9:	ff 75 f4             	pushl  -0xc(%ebp)
c01060dc:	e8 ea fb ff ff       	call   c0105ccb <add_map_entry>
c01060e1:	83 c4 10             	add    $0x10,%esp
c01060e4:	8b 45 08             	mov    0x8(%ebp),%eax
c01060e7:	8d 50 ff             	lea    -0x1(%eax),%edx
c01060ea:	89 55 08             	mov    %edx,0x8(%ebp)
c01060ed:	85 c0                	test   %eax,%eax
c01060ef:	75 ca                	jne    c01060bb <alloc_memory+0x27>
c01060f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01060f4:	c9                   	leave  
c01060f5:	c3                   	ret    

c01060f6 <get_a_virtual_page>:
c01060f6:	55                   	push   %ebp
c01060f7:	89 e5                	mov    %esp,%ebp
c01060f9:	83 ec 18             	sub    $0x18,%esp
c01060fc:	83 ec 0c             	sub    $0xc,%esp
c01060ff:	ff 75 08             	pushl  0x8(%ebp)
c0106102:	e8 ac f9 ff ff       	call   c0105ab3 <get_a_page>
c0106107:	83 c4 10             	add    $0x10,%esp
c010610a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010610d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106110:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0106115:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0106118:	83 ec 08             	sub    $0x8,%esp
c010611b:	ff 75 f4             	pushl  -0xc(%ebp)
c010611e:	ff 75 f0             	pushl  -0x10(%ebp)
c0106121:	e8 a5 fb ff ff       	call   c0105ccb <add_map_entry>
c0106126:	83 c4 10             	add    $0x10,%esp
c0106129:	8b 45 0c             	mov    0xc(%ebp),%eax
c010612c:	c9                   	leave  
c010612d:	c3                   	ret    

c010612e <block2arena>:
c010612e:	55                   	push   %ebp
c010612f:	89 e5                	mov    %esp,%ebp
c0106131:	83 ec 10             	sub    $0x10,%esp
c0106134:	8b 45 08             	mov    0x8(%ebp),%eax
c0106137:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010613c:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010613f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106142:	c9                   	leave  
c0106143:	c3                   	ret    

c0106144 <sys_malloc2>:
c0106144:	55                   	push   %ebp
c0106145:	89 e5                	mov    %esp,%ebp
c0106147:	83 ec 68             	sub    $0x68,%esp
c010614a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106151:	e8 4d a2 ff ff       	call   c01003a3 <get_running_thread_pcb>
c0106156:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0106159:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010615c:	8b 50 08             	mov    0x8(%eax),%edx
c010615f:	a1 28 0f 11 c0       	mov    0xc0110f28,%eax
c0106164:	39 c2                	cmp    %eax,%edx
c0106166:	75 10                	jne    c0106178 <sys_malloc2+0x34>
c0106168:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c010616f:	c7 45 ec e0 37 18 c0 	movl   $0xc01837e0,-0x14(%ebp)
c0106176:	eb 10                	jmp    c0106188 <sys_malloc2+0x44>
c0106178:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c010617f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106182:	83 c0 10             	add    $0x10,%eax
c0106185:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106188:	81 7d 08 00 04 00 00 	cmpl   $0x400,0x8(%ebp)
c010618f:	76 52                	jbe    c01061e3 <sys_malloc2+0x9f>
c0106191:	8b 45 08             	mov    0x8(%ebp),%eax
c0106194:	05 0b 10 00 00       	add    $0x100b,%eax
c0106199:	c1 e8 0c             	shr    $0xc,%eax
c010619c:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010619f:	83 ec 08             	sub    $0x8,%esp
c01061a2:	ff 75 f0             	pushl  -0x10(%ebp)
c01061a5:	ff 75 d8             	pushl  -0x28(%ebp)
c01061a8:	e8 e7 fe ff ff       	call   c0106094 <alloc_memory>
c01061ad:	83 c4 10             	add    $0x10,%esp
c01061b0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01061b3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01061b6:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01061b9:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01061bc:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c01061c2:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01061c5:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c01061cc:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01061cf:	c6 40 08 01          	movb   $0x1,0x8(%eax)
c01061d3:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01061d6:	05 90 00 00 00       	add    $0x90,%eax
c01061db:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01061de:	e9 f0 01 00 00       	jmp    c01063d3 <sys_malloc2+0x28f>
c01061e3:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01061ea:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01061f1:	eb 26                	jmp    c0106219 <sys_malloc2+0xd5>
c01061f3:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01061f6:	89 d0                	mov    %edx,%eax
c01061f8:	01 c0                	add    %eax,%eax
c01061fa:	01 d0                	add    %edx,%eax
c01061fc:	c1 e0 03             	shl    $0x3,%eax
c01061ff:	89 c2                	mov    %eax,%edx
c0106201:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106204:	01 d0                	add    %edx,%eax
c0106206:	8b 00                	mov    (%eax),%eax
c0106208:	39 45 08             	cmp    %eax,0x8(%ebp)
c010620b:	77 08                	ja     c0106215 <sys_malloc2+0xd1>
c010620d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106210:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106213:	eb 0a                	jmp    c010621f <sys_malloc2+0xdb>
c0106215:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0106219:	83 7d e4 09          	cmpl   $0x9,-0x1c(%ebp)
c010621d:	7e d4                	jle    c01061f3 <sys_malloc2+0xaf>
c010621f:	83 ec 08             	sub    $0x8,%esp
c0106222:	ff 75 f0             	pushl  -0x10(%ebp)
c0106225:	6a 01                	push   $0x1
c0106227:	e8 68 fe ff ff       	call   c0106094 <alloc_memory>
c010622c:	83 c4 10             	add    $0x10,%esp
c010622f:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0106232:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0106235:	89 d0                	mov    %edx,%eax
c0106237:	01 c0                	add    %eax,%eax
c0106239:	01 d0                	add    %edx,%eax
c010623b:	c1 e0 03             	shl    $0x3,%eax
c010623e:	89 c2                	mov    %eax,%edx
c0106240:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106243:	01 d0                	add    %edx,%eax
c0106245:	83 ec 04             	sub    $0x4,%esp
c0106248:	6a 18                	push   $0x18
c010624a:	50                   	push   %eax
c010624b:	ff 75 cc             	pushl  -0x34(%ebp)
c010624e:	e8 76 09 00 00       	call   c0106bc9 <Memcpy>
c0106253:	83 c4 10             	add    $0x10,%esp
c0106256:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c010625d:	e8 03 09 00 00       	call   c0106b65 <intr_disable>
c0106262:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0106265:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0106268:	89 d0                	mov    %edx,%eax
c010626a:	01 c0                	add    %eax,%eax
c010626c:	01 d0                	add    %edx,%eax
c010626e:	c1 e0 03             	shl    $0x3,%eax
c0106271:	89 c2                	mov    %eax,%edx
c0106273:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106276:	01 d0                	add    %edx,%eax
c0106278:	83 c0 08             	add    $0x8,%eax
c010627b:	83 ec 0c             	sub    $0xc,%esp
c010627e:	50                   	push   %eax
c010627f:	e8 ff 3c 00 00       	call   c0109f83 <isListEmpty>
c0106284:	83 c4 10             	add    $0x10,%esp
c0106287:	3c 01                	cmp    $0x1,%al
c0106289:	0f 85 c1 00 00 00    	jne    c0106350 <sys_malloc2+0x20c>
c010628f:	c7 45 c8 01 00 00 00 	movl   $0x1,-0x38(%ebp)
c0106296:	83 ec 08             	sub    $0x8,%esp
c0106299:	ff 75 f0             	pushl  -0x10(%ebp)
c010629c:	6a 01                	push   $0x1
c010629e:	e8 f1 fd ff ff       	call   c0106094 <alloc_memory>
c01062a3:	83 c4 10             	add    $0x10,%esp
c01062a6:	89 45 c0             	mov    %eax,-0x40(%ebp)
c01062a9:	8b 45 c0             	mov    -0x40(%ebp),%eax
c01062ac:	83 ec 0c             	sub    $0xc,%esp
c01062af:	50                   	push   %eax
c01062b0:	e8 79 fe ff ff       	call   c010612e <block2arena>
c01062b5:	83 c4 10             	add    $0x10,%esp
c01062b8:	89 45 bc             	mov    %eax,-0x44(%ebp)
c01062bb:	8b 55 e8             	mov    -0x18(%ebp),%edx
c01062be:	89 d0                	mov    %edx,%eax
c01062c0:	01 c0                	add    %eax,%eax
c01062c2:	01 d0                	add    %edx,%eax
c01062c4:	c1 e0 03             	shl    $0x3,%eax
c01062c7:	89 c2                	mov    %eax,%edx
c01062c9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01062cc:	01 d0                	add    %edx,%eax
c01062ce:	8b 50 04             	mov    0x4(%eax),%edx
c01062d1:	8b 45 bc             	mov    -0x44(%ebp),%eax
c01062d4:	89 50 04             	mov    %edx,0x4(%eax)
c01062d7:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01062da:	8b 00                	mov    (%eax),%eax
c01062dc:	89 45 b8             	mov    %eax,-0x48(%ebp)
c01062df:	c7 45 b4 0c 00 00 00 	movl   $0xc,-0x4c(%ebp)
c01062e6:	b8 00 10 00 00       	mov    $0x1000,%eax
c01062eb:	2b 45 b4             	sub    -0x4c(%ebp),%eax
c01062ee:	ba 00 00 00 00       	mov    $0x0,%edx
c01062f3:	f7 75 b8             	divl   -0x48(%ebp)
c01062f6:	89 45 b0             	mov    %eax,-0x50(%ebp)
c01062f9:	8b 55 c0             	mov    -0x40(%ebp),%edx
c01062fc:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c01062ff:	01 d0                	add    %edx,%eax
c0106301:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0106304:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c010630b:	eb 3b                	jmp    c0106348 <sys_malloc2+0x204>
c010630d:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0106310:	0f af 45 b8          	imul   -0x48(%ebp),%eax
c0106314:	89 c2                	mov    %eax,%edx
c0106316:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0106319:	01 d0                	add    %edx,%eax
c010631b:	89 45 a8             	mov    %eax,-0x58(%ebp)
c010631e:	8b 4d a8             	mov    -0x58(%ebp),%ecx
c0106321:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0106324:	89 d0                	mov    %edx,%eax
c0106326:	01 c0                	add    %eax,%eax
c0106328:	01 d0                	add    %edx,%eax
c010632a:	c1 e0 03             	shl    $0x3,%eax
c010632d:	89 c2                	mov    %eax,%edx
c010632f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106332:	01 d0                	add    %edx,%eax
c0106334:	83 c0 08             	add    $0x8,%eax
c0106337:	83 ec 08             	sub    $0x8,%esp
c010633a:	51                   	push   %ecx
c010633b:	50                   	push   %eax
c010633c:	e8 3f 3d 00 00       	call   c010a080 <appendToDoubleLinkList>
c0106341:	83 c4 10             	add    $0x10,%esp
c0106344:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0106348:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010634b:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c010634e:	77 bd                	ja     c010630d <sys_malloc2+0x1c9>
c0106350:	83 ec 0c             	sub    $0xc,%esp
c0106353:	ff 75 c4             	pushl  -0x3c(%ebp)
c0106356:	e8 33 08 00 00       	call   c0106b8e <intr_set_status>
c010635b:	83 c4 10             	add    $0x10,%esp
c010635e:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0106361:	89 d0                	mov    %edx,%eax
c0106363:	01 c0                	add    %eax,%eax
c0106365:	01 d0                	add    %edx,%eax
c0106367:	c1 e0 03             	shl    $0x3,%eax
c010636a:	89 c2                	mov    %eax,%edx
c010636c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010636f:	01 d0                	add    %edx,%eax
c0106371:	83 c0 08             	add    $0x8,%eax
c0106374:	83 ec 0c             	sub    $0xc,%esp
c0106377:	50                   	push   %eax
c0106378:	e8 6d 3e 00 00       	call   c010a1ea <popFromDoubleLinkList>
c010637d:	83 c4 10             	add    $0x10,%esp
c0106380:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0106383:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0106386:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106389:	83 7d a8 00          	cmpl   $0x0,-0x58(%ebp)
c010638d:	75 1c                	jne    c01063ab <sys_malloc2+0x267>
c010638f:	68 ef 01 00 00       	push   $0x1ef
c0106394:	68 86 a9 10 c0       	push   $0xc010a986
c0106399:	68 86 a9 10 c0       	push   $0xc010a986
c010639e:	68 a7 a9 10 c0       	push   $0xc010a9a7
c01063a3:	e8 15 24 00 00       	call   c01087bd <assertion_failure>
c01063a8:	83 c4 10             	add    $0x10,%esp
c01063ab:	8b 45 a8             	mov    -0x58(%ebp),%eax
c01063ae:	83 ec 0c             	sub    $0xc,%esp
c01063b1:	50                   	push   %eax
c01063b2:	e8 77 fd ff ff       	call   c010612e <block2arena>
c01063b7:	83 c4 10             	add    $0x10,%esp
c01063ba:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c01063bd:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c01063c0:	8b 40 04             	mov    0x4(%eax),%eax
c01063c3:	8d 50 ff             	lea    -0x1(%eax),%edx
c01063c6:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c01063c9:	89 50 04             	mov    %edx,0x4(%eax)
c01063cc:	c7 45 c4 04 00 00 00 	movl   $0x4,-0x3c(%ebp)
c01063d3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01063d7:	75 1c                	jne    c01063f5 <sys_malloc2+0x2b1>
c01063d9:	68 f6 01 00 00       	push   $0x1f6
c01063de:	68 86 a9 10 c0       	push   $0xc010a986
c01063e3:	68 86 a9 10 c0       	push   $0xc010a986
c01063e8:	68 b9 a9 10 c0       	push   $0xc010a9b9
c01063ed:	e8 cb 23 00 00       	call   c01087bd <assertion_failure>
c01063f2:	83 c4 10             	add    $0x10,%esp
c01063f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01063f8:	c9                   	leave  
c01063f9:	c3                   	ret    

c01063fa <remove_map_entry>:
c01063fa:	55                   	push   %ebp
c01063fb:	89 e5                	mov    %esp,%ebp
c01063fd:	83 ec 10             	sub    $0x10,%esp
c0106400:	ff 75 08             	pushl  0x8(%ebp)
c0106403:	e8 9c f8 ff ff       	call   c0105ca4 <ptr_pte>
c0106408:	83 c4 04             	add    $0x4,%esp
c010640b:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010640e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106411:	8b 10                	mov    (%eax),%edx
c0106413:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106416:	89 10                	mov    %edx,(%eax)
c0106418:	90                   	nop
c0106419:	c9                   	leave  
c010641a:	c3                   	ret    

c010641b <free_a_page>:
c010641b:	55                   	push   %ebp
c010641c:	89 e5                	mov    %esp,%ebp
c010641e:	83 ec 20             	sub    $0x20,%esp
c0106421:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0106425:	75 21                	jne    c0106448 <free_a_page+0x2d>
c0106427:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c010642c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010642f:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0106434:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106437:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c010643c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010643f:	c7 45 fc ac 06 11 c0 	movl   $0xc01106ac,-0x4(%ebp)
c0106446:	eb 1f                	jmp    c0106467 <free_a_page+0x4c>
c0106448:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c010644d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106450:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0106455:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106458:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c010645d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106460:	c7 45 fc f4 0e 11 c0 	movl   $0xc0110ef4,-0x4(%ebp)
c0106467:	8b 45 08             	mov    0x8(%ebp),%eax
c010646a:	c1 e8 0c             	shr    $0xc,%eax
c010646d:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0106470:	6a 00                	push   $0x0
c0106472:	ff 75 f8             	pushl  -0x8(%ebp)
c0106475:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c0106478:	50                   	push   %eax
c0106479:	e8 74 f4 ff ff       	call   c01058f2 <set_bit_val>
c010647e:	83 c4 0c             	add    $0xc,%esp
c0106481:	ff 75 08             	pushl  0x8(%ebp)
c0106484:	e8 22 fa ff ff       	call   c0105eab <get_physical_address>
c0106489:	83 c4 04             	add    $0x4,%esp
c010648c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010648f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106492:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106498:	85 c0                	test   %eax,%eax
c010649a:	0f 48 c2             	cmovs  %edx,%eax
c010649d:	c1 f8 0c             	sar    $0xc,%eax
c01064a0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01064a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01064a6:	6a 00                	push   $0x0
c01064a8:	ff 75 f0             	pushl  -0x10(%ebp)
c01064ab:	50                   	push   %eax
c01064ac:	e8 41 f4 ff ff       	call   c01058f2 <set_bit_val>
c01064b1:	83 c4 0c             	add    $0xc,%esp
c01064b4:	ff 75 08             	pushl  0x8(%ebp)
c01064b7:	e8 3e ff ff ff       	call   c01063fa <remove_map_entry>
c01064bc:	83 c4 04             	add    $0x4,%esp
c01064bf:	90                   	nop
c01064c0:	c9                   	leave  
c01064c1:	c3                   	ret    

c01064c2 <sys_free2>:
c01064c2:	55                   	push   %ebp
c01064c3:	89 e5                	mov    %esp,%ebp
c01064c5:	83 ec 58             	sub    $0x58,%esp
c01064c8:	e8 d6 9e ff ff       	call   c01003a3 <get_running_thread_pcb>
c01064cd:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01064d0:	e8 90 06 00 00       	call   c0106b65 <intr_disable>
c01064d5:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01064d8:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01064db:	8b 50 08             	mov    0x8(%eax),%edx
c01064de:	a1 28 0f 11 c0       	mov    0xc0110f28,%eax
c01064e3:	39 c2                	cmp    %eax,%edx
c01064e5:	75 10                	jne    c01064f7 <sys_free2+0x35>
c01064e7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01064ee:	c7 45 f0 e0 37 18 c0 	movl   $0xc01837e0,-0x10(%ebp)
c01064f5:	eb 10                	jmp    c0106507 <sys_free2+0x45>
c01064f7:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c01064fe:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106501:	83 c0 10             	add    $0x10,%eax
c0106504:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0106507:	81 7d 0c 00 04 00 00 	cmpl   $0x400,0xc(%ebp)
c010650e:	76 4d                	jbe    c010655d <sys_free2+0x9b>
c0106510:	8b 45 08             	mov    0x8(%ebp),%eax
c0106513:	83 e8 0c             	sub    $0xc,%eax
c0106516:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106519:	83 45 0c 0c          	addl   $0xc,0xc(%ebp)
c010651d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106520:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106525:	c1 e8 0c             	shr    $0xc,%eax
c0106528:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010652b:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0106532:	eb 1c                	jmp    c0106550 <sys_free2+0x8e>
c0106534:	83 ec 08             	sub    $0x8,%esp
c0106537:	ff 75 f4             	pushl  -0xc(%ebp)
c010653a:	ff 75 ec             	pushl  -0x14(%ebp)
c010653d:	e8 d9 fe ff ff       	call   c010641b <free_a_page>
c0106542:	83 c4 10             	add    $0x10,%esp
c0106545:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
c010654c:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0106550:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106553:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
c0106556:	77 dc                	ja     c0106534 <sys_free2+0x72>
c0106558:	e9 dc 00 00 00       	jmp    c0106639 <sys_free2+0x177>
c010655d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0106564:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c010656b:	eb 26                	jmp    c0106593 <sys_free2+0xd1>
c010656d:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0106570:	89 d0                	mov    %edx,%eax
c0106572:	01 c0                	add    %eax,%eax
c0106574:	01 d0                	add    %edx,%eax
c0106576:	c1 e0 03             	shl    $0x3,%eax
c0106579:	89 c2                	mov    %eax,%edx
c010657b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010657e:	01 d0                	add    %edx,%eax
c0106580:	8b 00                	mov    (%eax),%eax
c0106582:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0106585:	77 08                	ja     c010658f <sys_free2+0xcd>
c0106587:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010658a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010658d:	eb 0a                	jmp    c0106599 <sys_free2+0xd7>
c010658f:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0106593:	83 7d e0 09          	cmpl   $0x9,-0x20(%ebp)
c0106597:	7e d4                	jle    c010656d <sys_free2+0xab>
c0106599:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c010659c:	89 d0                	mov    %edx,%eax
c010659e:	01 c0                	add    %eax,%eax
c01065a0:	01 d0                	add    %edx,%eax
c01065a2:	c1 e0 03             	shl    $0x3,%eax
c01065a5:	89 c2                	mov    %eax,%edx
c01065a7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01065aa:	01 d0                	add    %edx,%eax
c01065ac:	8b 10                	mov    (%eax),%edx
c01065ae:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c01065b1:	8b 50 04             	mov    0x4(%eax),%edx
c01065b4:	89 55 b8             	mov    %edx,-0x48(%ebp)
c01065b7:	8b 50 08             	mov    0x8(%eax),%edx
c01065ba:	89 55 bc             	mov    %edx,-0x44(%ebp)
c01065bd:	8b 50 0c             	mov    0xc(%eax),%edx
c01065c0:	89 55 c0             	mov    %edx,-0x40(%ebp)
c01065c3:	8b 50 10             	mov    0x10(%eax),%edx
c01065c6:	89 55 c4             	mov    %edx,-0x3c(%ebp)
c01065c9:	8b 40 14             	mov    0x14(%eax),%eax
c01065cc:	89 45 c8             	mov    %eax,-0x38(%ebp)
c01065cf:	8b 45 08             	mov    0x8(%ebp),%eax
c01065d2:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01065d5:	83 ec 0c             	sub    $0xc,%esp
c01065d8:	ff 75 d0             	pushl  -0x30(%ebp)
c01065db:	e8 4e fb ff ff       	call   c010612e <block2arena>
c01065e0:	83 c4 10             	add    $0x10,%esp
c01065e3:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01065e6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01065e9:	89 d0                	mov    %edx,%eax
c01065eb:	01 c0                	add    %eax,%eax
c01065ed:	01 d0                	add    %edx,%eax
c01065ef:	c1 e0 03             	shl    $0x3,%eax
c01065f2:	89 c2                	mov    %eax,%edx
c01065f4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01065f7:	01 d0                	add    %edx,%eax
c01065f9:	83 c0 08             	add    $0x8,%eax
c01065fc:	83 ec 08             	sub    $0x8,%esp
c01065ff:	ff 75 d0             	pushl  -0x30(%ebp)
c0106602:	50                   	push   %eax
c0106603:	e8 78 3a 00 00       	call   c010a080 <appendToDoubleLinkList>
c0106608:	83 c4 10             	add    $0x10,%esp
c010660b:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010660e:	8b 40 04             	mov    0x4(%eax),%eax
c0106611:	8d 50 01             	lea    0x1(%eax),%edx
c0106614:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0106617:	89 50 04             	mov    %edx,0x4(%eax)
c010661a:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010661d:	8b 50 04             	mov    0x4(%eax),%edx
c0106620:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0106623:	39 c2                	cmp    %eax,%edx
c0106625:	75 12                	jne    c0106639 <sys_free2+0x177>
c0106627:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010662a:	83 ec 08             	sub    $0x8,%esp
c010662d:	ff 75 f4             	pushl  -0xc(%ebp)
c0106630:	50                   	push   %eax
c0106631:	e8 e5 fd ff ff       	call   c010641b <free_a_page>
c0106636:	83 c4 10             	add    $0x10,%esp
c0106639:	83 ec 0c             	sub    $0xc,%esp
c010663c:	ff 75 d8             	pushl  -0x28(%ebp)
c010663f:	e8 4a 05 00 00       	call   c0106b8e <intr_set_status>
c0106644:	83 c4 10             	add    $0x10,%esp
c0106647:	90                   	nop
c0106648:	c9                   	leave  
c0106649:	c3                   	ret    

c010664a <init_memory_block_desc>:
c010664a:	55                   	push   %ebp
c010664b:	89 e5                	mov    %esp,%ebp
c010664d:	83 ec 18             	sub    $0x18,%esp
c0106650:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106657:	e9 b2 00 00 00       	jmp    c010670e <init_memory_block_desc+0xc4>
c010665c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0106660:	75 1b                	jne    c010667d <init_memory_block_desc+0x33>
c0106662:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106665:	89 d0                	mov    %edx,%eax
c0106667:	01 c0                	add    %eax,%eax
c0106669:	01 d0                	add    %edx,%eax
c010666b:	c1 e0 03             	shl    $0x3,%eax
c010666e:	89 c2                	mov    %eax,%edx
c0106670:	8b 45 08             	mov    0x8(%ebp),%eax
c0106673:	01 d0                	add    %edx,%eax
c0106675:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c010667b:	eb 2e                	jmp    c01066ab <init_memory_block_desc+0x61>
c010667d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106680:	89 d0                	mov    %edx,%eax
c0106682:	01 c0                	add    %eax,%eax
c0106684:	01 d0                	add    %edx,%eax
c0106686:	c1 e0 03             	shl    $0x3,%eax
c0106689:	8d 50 e8             	lea    -0x18(%eax),%edx
c010668c:	8b 45 08             	mov    0x8(%ebp),%eax
c010668f:	01 d0                	add    %edx,%eax
c0106691:	8b 08                	mov    (%eax),%ecx
c0106693:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106696:	89 d0                	mov    %edx,%eax
c0106698:	01 c0                	add    %eax,%eax
c010669a:	01 d0                	add    %edx,%eax
c010669c:	c1 e0 03             	shl    $0x3,%eax
c010669f:	89 c2                	mov    %eax,%edx
c01066a1:	8b 45 08             	mov    0x8(%ebp),%eax
c01066a4:	01 d0                	add    %edx,%eax
c01066a6:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
c01066a9:	89 10                	mov    %edx,(%eax)
c01066ab:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01066ae:	89 d0                	mov    %edx,%eax
c01066b0:	01 c0                	add    %eax,%eax
c01066b2:	01 d0                	add    %edx,%eax
c01066b4:	c1 e0 03             	shl    $0x3,%eax
c01066b7:	89 c2                	mov    %eax,%edx
c01066b9:	8b 45 08             	mov    0x8(%ebp),%eax
c01066bc:	01 d0                	add    %edx,%eax
c01066be:	8b 00                	mov    (%eax),%eax
c01066c0:	89 c1                	mov    %eax,%ecx
c01066c2:	b8 f4 0f 00 00       	mov    $0xff4,%eax
c01066c7:	ba 00 00 00 00       	mov    $0x0,%edx
c01066cc:	f7 f1                	div    %ecx
c01066ce:	89 c1                	mov    %eax,%ecx
c01066d0:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01066d3:	89 d0                	mov    %edx,%eax
c01066d5:	01 c0                	add    %eax,%eax
c01066d7:	01 d0                	add    %edx,%eax
c01066d9:	c1 e0 03             	shl    $0x3,%eax
c01066dc:	89 c2                	mov    %eax,%edx
c01066de:	8b 45 08             	mov    0x8(%ebp),%eax
c01066e1:	01 d0                	add    %edx,%eax
c01066e3:	89 ca                	mov    %ecx,%edx
c01066e5:	89 50 04             	mov    %edx,0x4(%eax)
c01066e8:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01066eb:	89 d0                	mov    %edx,%eax
c01066ed:	01 c0                	add    %eax,%eax
c01066ef:	01 d0                	add    %edx,%eax
c01066f1:	c1 e0 03             	shl    $0x3,%eax
c01066f4:	89 c2                	mov    %eax,%edx
c01066f6:	8b 45 08             	mov    0x8(%ebp),%eax
c01066f9:	01 d0                	add    %edx,%eax
c01066fb:	83 c0 08             	add    $0x8,%eax
c01066fe:	83 ec 0c             	sub    $0xc,%esp
c0106701:	50                   	push   %eax
c0106702:	e8 4e 38 00 00       	call   c0109f55 <initDoubleLinkList>
c0106707:	83 c4 10             	add    $0x10,%esp
c010670a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c010670e:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c0106712:	0f 8e 44 ff ff ff    	jle    c010665c <init_memory_block_desc+0x12>
c0106718:	90                   	nop
c0106719:	c9                   	leave  
c010671a:	c3                   	ret    

c010671b <init_memory2>:
c010671b:	55                   	push   %ebp
c010671c:	89 e5                	mov    %esp,%ebp
c010671e:	83 ec 38             	sub    $0x38,%esp
c0106721:	c7 45 f4 00 00 00 02 	movl   $0x2000000,-0xc(%ebp)
c0106728:	c7 45 f0 00 20 10 00 	movl   $0x102000,-0x10(%ebp)
c010672f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106732:	a3 b4 06 11 c0       	mov    %eax,0xc01106b4
c0106737:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010673a:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c010673f:	29 c2                	sub    %eax,%edx
c0106741:	89 d0                	mov    %edx,%eax
c0106743:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106746:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106749:	89 c2                	mov    %eax,%edx
c010674b:	c1 ea 1f             	shr    $0x1f,%edx
c010674e:	01 d0                	add    %edx,%eax
c0106750:	d1 f8                	sar    %eax
c0106752:	a3 b8 06 11 c0       	mov    %eax,0xc01106b8
c0106757:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c010675c:	83 ec 0c             	sub    $0xc,%esp
c010675f:	50                   	push   %eax
c0106760:	e8 52 08 00 00       	call   c0106fb7 <disp_int>
c0106765:	83 c4 10             	add    $0x10,%esp
c0106768:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c010676d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106770:	29 c2                	sub    %eax,%edx
c0106772:	89 d0                	mov    %edx,%eax
c0106774:	a3 00 0f 11 c0       	mov    %eax,0xc0110f00
c0106779:	83 ec 0c             	sub    $0xc,%esp
c010677c:	68 c5 a9 10 c0       	push   $0xc010a9c5
c0106781:	e8 06 99 ff ff       	call   c010008c <disp_str>
c0106786:	83 c4 10             	add    $0x10,%esp
c0106789:	a1 00 0f 11 c0       	mov    0xc0110f00,%eax
c010678e:	83 ec 0c             	sub    $0xc,%esp
c0106791:	50                   	push   %eax
c0106792:	e8 20 08 00 00       	call   c0106fb7 <disp_int>
c0106797:	83 c4 10             	add    $0x10,%esp
c010679a:	83 ec 0c             	sub    $0xc,%esp
c010679d:	68 c5 a9 10 c0       	push   $0xc010a9c5
c01067a2:	e8 e5 98 ff ff       	call   c010008c <disp_str>
c01067a7:	83 c4 10             	add    $0x10,%esp
c01067aa:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c01067af:	05 ff 0f 00 00       	add    $0xfff,%eax
c01067b4:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c01067ba:	85 c0                	test   %eax,%eax
c01067bc:	0f 48 c2             	cmovs  %edx,%eax
c01067bf:	c1 f8 0c             	sar    $0xc,%eax
c01067c2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01067c5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01067c8:	83 c0 07             	add    $0x7,%eax
c01067cb:	8d 50 07             	lea    0x7(%eax),%edx
c01067ce:	85 c0                	test   %eax,%eax
c01067d0:	0f 48 c2             	cmovs  %edx,%eax
c01067d3:	c1 f8 03             	sar    $0x3,%eax
c01067d6:	a3 b0 06 11 c0       	mov    %eax,0xc01106b0
c01067db:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c01067e0:	2d 00 00 00 40       	sub    $0x40000000,%eax
c01067e5:	a3 ac 06 11 c0       	mov    %eax,0xc01106ac
c01067ea:	8b 15 b0 06 11 c0    	mov    0xc01106b0,%edx
c01067f0:	a1 ac 06 11 c0       	mov    0xc01106ac,%eax
c01067f5:	83 ec 04             	sub    $0x4,%esp
c01067f8:	52                   	push   %edx
c01067f9:	6a 00                	push   $0x0
c01067fb:	50                   	push   %eax
c01067fc:	e8 76 4d 00 00       	call   c010b577 <Memset>
c0106801:	83 c4 10             	add    $0x10,%esp
c0106804:	a1 b0 06 11 c0       	mov    0xc01106b0,%eax
c0106809:	05 ff 0f 00 00       	add    $0xfff,%eax
c010680e:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106814:	85 c0                	test   %eax,%eax
c0106816:	0f 48 c2             	cmovs  %edx,%eax
c0106819:	c1 f8 0c             	sar    $0xc,%eax
c010681c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010681f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106822:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106825:	ff 75 e8             	pushl  -0x18(%ebp)
c0106828:	6a 01                	push   $0x1
c010682a:	6a 00                	push   $0x0
c010682c:	68 ac 06 11 c0       	push   $0xc01106ac
c0106831:	e8 37 f1 ff ff       	call   c010596d <set_bits>
c0106836:	83 c4 10             	add    $0x10,%esp
c0106839:	a1 00 0f 11 c0       	mov    0xc0110f00,%eax
c010683e:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106843:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106849:	85 c0                	test   %eax,%eax
c010684b:	0f 48 c2             	cmovs  %edx,%eax
c010684e:	c1 f8 0c             	sar    $0xc,%eax
c0106851:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106854:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106857:	83 c0 07             	add    $0x7,%eax
c010685a:	8d 50 07             	lea    0x7(%eax),%edx
c010685d:	85 c0                	test   %eax,%eax
c010685f:	0f 48 c2             	cmovs  %edx,%eax
c0106862:	c1 f8 03             	sar    $0x3,%eax
c0106865:	a3 f8 0e 11 c0       	mov    %eax,0xc0110ef8
c010686a:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c010686f:	8b 15 b0 06 11 c0    	mov    0xc01106b0,%edx
c0106875:	01 d0                	add    %edx,%eax
c0106877:	a3 f4 0e 11 c0       	mov    %eax,0xc0110ef4
c010687c:	8b 15 f8 0e 11 c0    	mov    0xc0110ef8,%edx
c0106882:	a1 f4 0e 11 c0       	mov    0xc0110ef4,%eax
c0106887:	83 ec 04             	sub    $0x4,%esp
c010688a:	52                   	push   %edx
c010688b:	6a 00                	push   $0x0
c010688d:	50                   	push   %eax
c010688e:	e8 e4 4c 00 00       	call   c010b577 <Memset>
c0106893:	83 c4 10             	add    $0x10,%esp
c0106896:	a1 f8 0e 11 c0       	mov    0xc0110ef8,%eax
c010689b:	05 ff 0f 00 00       	add    $0xfff,%eax
c01068a0:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c01068a6:	85 c0                	test   %eax,%eax
c01068a8:	0f 48 c2             	cmovs  %edx,%eax
c01068ab:	c1 f8 0c             	sar    $0xc,%eax
c01068ae:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01068b1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01068b4:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01068b7:	ff 75 e8             	pushl  -0x18(%ebp)
c01068ba:	6a 01                	push   $0x1
c01068bc:	ff 75 e0             	pushl  -0x20(%ebp)
c01068bf:	68 ac 06 11 c0       	push   $0xc01106ac
c01068c4:	e8 a4 f0 ff ff       	call   c010596d <set_bits>
c01068c9:	83 c4 10             	add    $0x10,%esp
c01068cc:	c7 45 dc 00 00 10 00 	movl   $0x100000,-0x24(%ebp)
c01068d3:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01068d6:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01068d9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01068dc:	83 c0 07             	add    $0x7,%eax
c01068df:	8d 50 07             	lea    0x7(%eax),%edx
c01068e2:	85 c0                	test   %eax,%eax
c01068e4:	0f 48 c2             	cmovs  %edx,%eax
c01068e7:	c1 f8 03             	sar    $0x3,%eax
c01068ea:	a3 98 f7 10 c0       	mov    %eax,0xc010f798
c01068ef:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c01068f4:	8b 15 b0 06 11 c0    	mov    0xc01106b0,%edx
c01068fa:	01 c2                	add    %eax,%edx
c01068fc:	a1 f8 0e 11 c0       	mov    0xc0110ef8,%eax
c0106901:	01 d0                	add    %edx,%eax
c0106903:	a3 94 f7 10 c0       	mov    %eax,0xc010f794
c0106908:	8b 15 98 f7 10 c0    	mov    0xc010f798,%edx
c010690e:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0106913:	83 ec 04             	sub    $0x4,%esp
c0106916:	52                   	push   %edx
c0106917:	6a 00                	push   $0x0
c0106919:	50                   	push   %eax
c010691a:	e8 58 4c 00 00       	call   c010b577 <Memset>
c010691f:	83 c4 10             	add    $0x10,%esp
c0106922:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0106925:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106928:	01 d0                	add    %edx,%eax
c010692a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010692d:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0106932:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106937:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c010693d:	85 c0                	test   %eax,%eax
c010693f:	0f 48 c2             	cmovs  %edx,%eax
c0106942:	c1 f8 0c             	sar    $0xc,%eax
c0106945:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106948:	ff 75 e8             	pushl  -0x18(%ebp)
c010694b:	6a 01                	push   $0x1
c010694d:	ff 75 e0             	pushl  -0x20(%ebp)
c0106950:	68 ac 06 11 c0       	push   $0xc01106ac
c0106955:	e8 13 f0 ff ff       	call   c010596d <set_bits>
c010695a:	83 c4 10             	add    $0x10,%esp
c010695d:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0106960:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106963:	01 d0                	add    %edx,%eax
c0106965:	c1 e0 0c             	shl    $0xc,%eax
c0106968:	a3 9c f7 10 c0       	mov    %eax,0xc010f79c
c010696d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106970:	83 c0 02             	add    $0x2,%eax
c0106973:	c1 e0 0c             	shl    $0xc,%eax
c0106976:	89 c2                	mov    %eax,%edx
c0106978:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010697b:	01 d0                	add    %edx,%eax
c010697d:	a3 9c f7 10 c0       	mov    %eax,0xc010f79c
c0106982:	c7 45 d8 05 00 00 00 	movl   $0x5,-0x28(%ebp)
c0106989:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010698c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010698f:	90                   	nop
c0106990:	c9                   	leave  
c0106991:	c3                   	ret    

c0106992 <init_memory>:
c0106992:	55                   	push   %ebp
c0106993:	89 e5                	mov    %esp,%ebp
c0106995:	83 ec 38             	sub    $0x38,%esp
c0106998:	c7 45 f4 00 00 02 c0 	movl   $0xc0020000,-0xc(%ebp)
c010699f:	c7 45 f0 00 00 40 c0 	movl   $0xc0400000,-0x10(%ebp)
c01069a6:	c7 45 ec 00 00 10 00 	movl   $0x100000,-0x14(%ebp)
c01069ad:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01069b0:	05 00 00 40 00       	add    $0x400000,%eax
c01069b5:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01069b8:	8b 45 08             	mov    0x8(%ebp),%eax
c01069bb:	2b 45 e8             	sub    -0x18(%ebp),%eax
c01069be:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c01069c4:	85 c0                	test   %eax,%eax
c01069c6:	0f 48 c2             	cmovs  %edx,%eax
c01069c9:	c1 f8 0c             	sar    $0xc,%eax
c01069cc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01069cf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01069d2:	89 c2                	mov    %eax,%edx
c01069d4:	c1 ea 1f             	shr    $0x1f,%edx
c01069d7:	01 d0                	add    %edx,%eax
c01069d9:	d1 f8                	sar    %eax
c01069db:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01069de:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01069e1:	2b 45 e0             	sub    -0x20(%ebp),%eax
c01069e4:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01069e7:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01069ea:	8d 50 07             	lea    0x7(%eax),%edx
c01069ed:	85 c0                	test   %eax,%eax
c01069ef:	0f 48 c2             	cmovs  %edx,%eax
c01069f2:	c1 f8 03             	sar    $0x3,%eax
c01069f5:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01069f8:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01069fb:	8d 50 07             	lea    0x7(%eax),%edx
c01069fe:	85 c0                	test   %eax,%eax
c0106a00:	0f 48 c2             	cmovs  %edx,%eax
c0106a03:	c1 f8 03             	sar    $0x3,%eax
c0106a06:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106a09:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106a0c:	a3 b4 06 11 c0       	mov    %eax,0xc01106b4
c0106a11:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106a16:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0106a19:	c1 e2 0c             	shl    $0xc,%edx
c0106a1c:	01 d0                	add    %edx,%eax
c0106a1e:	a3 fc 0e 11 c0       	mov    %eax,0xc0110efc
c0106a23:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106a26:	a3 ac 06 11 c0       	mov    %eax,0xc01106ac
c0106a2b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106a2e:	a3 b0 06 11 c0       	mov    %eax,0xc01106b0
c0106a33:	a1 ac 06 11 c0       	mov    0xc01106ac,%eax
c0106a38:	83 ec 04             	sub    $0x4,%esp
c0106a3b:	ff 75 d8             	pushl  -0x28(%ebp)
c0106a3e:	6a 00                	push   $0x0
c0106a40:	50                   	push   %eax
c0106a41:	e8 31 4b 00 00       	call   c010b577 <Memset>
c0106a46:	83 c4 10             	add    $0x10,%esp
c0106a49:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106a4c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106a4f:	01 d0                	add    %edx,%eax
c0106a51:	a3 f4 0e 11 c0       	mov    %eax,0xc0110ef4
c0106a56:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106a59:	a3 f8 0e 11 c0       	mov    %eax,0xc0110ef8
c0106a5e:	a1 f4 0e 11 c0       	mov    0xc0110ef4,%eax
c0106a63:	83 ec 04             	sub    $0x4,%esp
c0106a66:	ff 75 d4             	pushl  -0x2c(%ebp)
c0106a69:	6a 00                	push   $0x0
c0106a6b:	50                   	push   %eax
c0106a6c:	e8 06 4b 00 00       	call   c010b577 <Memset>
c0106a71:	83 c4 10             	add    $0x10,%esp
c0106a74:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106a77:	a3 98 f7 10 c0       	mov    %eax,0xc010f798
c0106a7c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106a7f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106a82:	01 c2                	add    %eax,%edx
c0106a84:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106a87:	01 d0                	add    %edx,%eax
c0106a89:	a3 94 f7 10 c0       	mov    %eax,0xc010f794
c0106a8e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106a91:	05 00 00 10 00       	add    $0x100000,%eax
c0106a96:	a3 9c f7 10 c0       	mov    %eax,0xc010f79c
c0106a9b:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0106aa0:	83 ec 04             	sub    $0x4,%esp
c0106aa3:	ff 75 d8             	pushl  -0x28(%ebp)
c0106aa6:	6a 00                	push   $0x0
c0106aa8:	50                   	push   %eax
c0106aa9:	e8 c9 4a 00 00       	call   c010b577 <Memset>
c0106aae:	83 c4 10             	add    $0x10,%esp
c0106ab1:	83 ec 04             	sub    $0x4,%esp
c0106ab4:	68 f0 00 00 00       	push   $0xf0
c0106ab9:	6a 00                	push   $0x0
c0106abb:	68 e0 37 18 c0       	push   $0xc01837e0
c0106ac0:	e8 b2 4a 00 00       	call   c010b577 <Memset>
c0106ac5:	83 c4 10             	add    $0x10,%esp
c0106ac8:	83 ec 0c             	sub    $0xc,%esp
c0106acb:	68 e0 37 18 c0       	push   $0xc01837e0
c0106ad0:	e8 75 fb ff ff       	call   c010664a <init_memory_block_desc>
c0106ad5:	83 c4 10             	add    $0x10,%esp
c0106ad8:	90                   	nop
c0106ad9:	c9                   	leave  
c0106ada:	c3                   	ret    

c0106adb <stop_here>:
c0106adb:	55                   	push   %ebp
c0106adc:	89 e5                	mov    %esp,%ebp
c0106ade:	83 ec 08             	sub    $0x8,%esp
c0106ae1:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0106ae8:	00 00 00 
c0106aeb:	83 ec 0c             	sub    $0xc,%esp
c0106aee:	68 e0 a9 10 c0       	push   $0xc010a9e0
c0106af3:	e8 94 95 ff ff       	call   c010008c <disp_str>
c0106af8:	83 c4 10             	add    $0x10,%esp
c0106afb:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0106b00:	83 ec 0c             	sub    $0xc,%esp
c0106b03:	50                   	push   %eax
c0106b04:	e8 ae 04 00 00       	call   c0106fb7 <disp_int>
c0106b09:	83 c4 10             	add    $0x10,%esp
c0106b0c:	83 ec 0c             	sub    $0xc,%esp
c0106b0f:	68 e2 a9 10 c0       	push   $0xc010a9e2
c0106b14:	e8 73 95 ff ff       	call   c010008c <disp_str>
c0106b19:	83 c4 10             	add    $0x10,%esp
c0106b1c:	90                   	nop
c0106b1d:	c9                   	leave  
c0106b1e:	c3                   	ret    

c0106b1f <catch_error>:
c0106b1f:	55                   	push   %ebp
c0106b20:	89 e5                	mov    %esp,%ebp
c0106b22:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0106b27:	83 c0 01             	add    $0x1,%eax
c0106b2a:	a3 c4 fb 10 c0       	mov    %eax,0xc010fbc4
c0106b2f:	a1 a4 f7 10 c0       	mov    0xc010f7a4,%eax
c0106b34:	a3 a0 f7 10 c0       	mov    %eax,0xc010f7a0
c0106b39:	90                   	nop
c0106b3a:	5d                   	pop    %ebp
c0106b3b:	c3                   	ret    

c0106b3c <intr_enable>:
c0106b3c:	55                   	push   %ebp
c0106b3d:	89 e5                	mov    %esp,%ebp
c0106b3f:	83 ec 18             	sub    $0x18,%esp
c0106b42:	e8 65 00 00 00       	call   c0106bac <intr_get_status>
c0106b47:	83 f8 01             	cmp    $0x1,%eax
c0106b4a:	75 0c                	jne    c0106b58 <intr_enable+0x1c>
c0106b4c:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0106b53:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106b56:	eb 0b                	jmp    c0106b63 <intr_enable+0x27>
c0106b58:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106b5f:	fb                   	sti    
c0106b60:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106b63:	c9                   	leave  
c0106b64:	c3                   	ret    

c0106b65 <intr_disable>:
c0106b65:	55                   	push   %ebp
c0106b66:	89 e5                	mov    %esp,%ebp
c0106b68:	83 ec 18             	sub    $0x18,%esp
c0106b6b:	e8 3c 00 00 00       	call   c0106bac <intr_get_status>
c0106b70:	83 f8 01             	cmp    $0x1,%eax
c0106b73:	75 0d                	jne    c0106b82 <intr_disable+0x1d>
c0106b75:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0106b7c:	fa                   	cli    
c0106b7d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106b80:	eb 0a                	jmp    c0106b8c <intr_disable+0x27>
c0106b82:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106b89:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106b8c:	c9                   	leave  
c0106b8d:	c3                   	ret    

c0106b8e <intr_set_status>:
c0106b8e:	55                   	push   %ebp
c0106b8f:	89 e5                	mov    %esp,%ebp
c0106b91:	83 ec 08             	sub    $0x8,%esp
c0106b94:	8b 45 08             	mov    0x8(%ebp),%eax
c0106b97:	83 e0 01             	and    $0x1,%eax
c0106b9a:	85 c0                	test   %eax,%eax
c0106b9c:	74 07                	je     c0106ba5 <intr_set_status+0x17>
c0106b9e:	e8 99 ff ff ff       	call   c0106b3c <intr_enable>
c0106ba3:	eb 05                	jmp    c0106baa <intr_set_status+0x1c>
c0106ba5:	e8 bb ff ff ff       	call   c0106b65 <intr_disable>
c0106baa:	c9                   	leave  
c0106bab:	c3                   	ret    

c0106bac <intr_get_status>:
c0106bac:	55                   	push   %ebp
c0106bad:	89 e5                	mov    %esp,%ebp
c0106baf:	83 ec 10             	sub    $0x10,%esp
c0106bb2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0106bb9:	9c                   	pushf  
c0106bba:	58                   	pop    %eax
c0106bbb:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0106bbe:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106bc1:	c1 e8 09             	shr    $0x9,%eax
c0106bc4:	83 e0 01             	and    $0x1,%eax
c0106bc7:	c9                   	leave  
c0106bc8:	c3                   	ret    

c0106bc9 <Memcpy>:
c0106bc9:	55                   	push   %ebp
c0106bca:	89 e5                	mov    %esp,%ebp
c0106bcc:	83 ec 18             	sub    $0x18,%esp
c0106bcf:	e8 91 ff ff ff       	call   c0106b65 <intr_disable>
c0106bd4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106bd7:	83 ec 04             	sub    $0x4,%esp
c0106bda:	ff 75 10             	pushl  0x10(%ebp)
c0106bdd:	ff 75 0c             	pushl  0xc(%ebp)
c0106be0:	ff 75 08             	pushl  0x8(%ebp)
c0106be3:	e8 61 49 00 00       	call   c010b549 <Memcpy2>
c0106be8:	83 c4 10             	add    $0x10,%esp
c0106beb:	83 ec 0c             	sub    $0xc,%esp
c0106bee:	ff 75 f4             	pushl  -0xc(%ebp)
c0106bf1:	e8 98 ff ff ff       	call   c0106b8e <intr_set_status>
c0106bf6:	83 c4 10             	add    $0x10,%esp
c0106bf9:	90                   	nop
c0106bfa:	c9                   	leave  
c0106bfb:	c3                   	ret    

c0106bfc <untar>:
c0106bfc:	55                   	push   %ebp
c0106bfd:	89 e5                	mov    %esp,%ebp
c0106bff:	81 ec 48 0a 00 00    	sub    $0xa48,%esp
c0106c05:	83 ec 08             	sub    $0x8,%esp
c0106c08:	6a 00                	push   $0x0
c0106c0a:	ff 75 08             	pushl  0x8(%ebp)
c0106c0d:	e8 2a de ff ff       	call   c0104a3c <open>
c0106c12:	83 c4 10             	add    $0x10,%esp
c0106c15:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106c18:	83 ec 0c             	sub    $0xc,%esp
c0106c1b:	68 e4 a9 10 c0       	push   $0xc010a9e4
c0106c20:	e8 3b 18 00 00       	call   c0108460 <Printf>
c0106c25:	83 c4 10             	add    $0x10,%esp
c0106c28:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0106c2f:	c7 45 dc 00 02 00 00 	movl   $0x200,-0x24(%ebp)
c0106c36:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106c3d:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0106c44:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0106c4b:	e9 63 02 00 00       	jmp    c0106eb3 <untar+0x2b7>
c0106c50:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0106c54:	7e 58                	jle    c0106cae <untar+0xb2>
c0106c56:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106c59:	05 ff 01 00 00       	add    $0x1ff,%eax
c0106c5e:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0106c64:	85 c0                	test   %eax,%eax
c0106c66:	0f 48 c2             	cmovs  %edx,%eax
c0106c69:	c1 f8 09             	sar    $0x9,%eax
c0106c6c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106c6f:	83 ec 04             	sub    $0x4,%esp
c0106c72:	68 00 02 00 00       	push   $0x200
c0106c77:	6a 00                	push   $0x0
c0106c79:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106c7f:	50                   	push   %eax
c0106c80:	e8 f2 48 00 00       	call   c010b577 <Memset>
c0106c85:	83 c4 10             	add    $0x10,%esp
c0106c88:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106c8b:	c1 e0 09             	shl    $0x9,%eax
c0106c8e:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0106c91:	83 ec 04             	sub    $0x4,%esp
c0106c94:	50                   	push   %eax
c0106c95:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106c9b:	50                   	push   %eax
c0106c9c:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106c9f:	e8 2d de ff ff       	call   c0104ad1 <read>
c0106ca4:	83 c4 10             	add    $0x10,%esp
c0106ca7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106cae:	83 ec 04             	sub    $0x4,%esp
c0106cb1:	68 00 02 00 00       	push   $0x200
c0106cb6:	6a 00                	push   $0x0
c0106cb8:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106cbe:	50                   	push   %eax
c0106cbf:	e8 b3 48 00 00       	call   c010b577 <Memset>
c0106cc4:	83 c4 10             	add    $0x10,%esp
c0106cc7:	83 ec 04             	sub    $0x4,%esp
c0106cca:	68 00 02 00 00       	push   $0x200
c0106ccf:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106cd5:	50                   	push   %eax
c0106cd6:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106cd9:	e8 f3 dd ff ff       	call   c0104ad1 <read>
c0106cde:	83 c4 10             	add    $0x10,%esp
c0106ce1:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0106ce4:	83 ec 0c             	sub    $0xc,%esp
c0106ce7:	68 f6 a9 10 c0       	push   $0xc010a9f6
c0106cec:	e8 6f 17 00 00       	call   c0108460 <Printf>
c0106cf1:	83 c4 10             	add    $0x10,%esp
c0106cf4:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0106cf8:	0f 84 c1 01 00 00    	je     c0106ebf <untar+0x2c3>
c0106cfe:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106d01:	01 45 f4             	add    %eax,-0xc(%ebp)
c0106d04:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0106d0b:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106d11:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0106d14:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106d17:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0106d1a:	83 ec 08             	sub    $0x8,%esp
c0106d1d:	6a 07                	push   $0x7
c0106d1f:	ff 75 cc             	pushl  -0x34(%ebp)
c0106d22:	e8 15 dd ff ff       	call   c0104a3c <open>
c0106d27:	83 c4 10             	add    $0x10,%esp
c0106d2a:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0106d2d:	83 ec 0c             	sub    $0xc,%esp
c0106d30:	68 08 aa 10 c0       	push   $0xc010aa08
c0106d35:	e8 26 17 00 00       	call   c0108460 <Printf>
c0106d3a:	83 c4 10             	add    $0x10,%esp
c0106d3d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0106d44:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106d47:	83 c0 7c             	add    $0x7c,%eax
c0106d4a:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0106d4d:	83 ec 0c             	sub    $0xc,%esp
c0106d50:	ff 75 cc             	pushl  -0x34(%ebp)
c0106d53:	e8 58 48 00 00       	call   c010b5b0 <Strlen>
c0106d58:	83 c4 10             	add    $0x10,%esp
c0106d5b:	85 c0                	test   %eax,%eax
c0106d5d:	75 28                	jne    c0106d87 <untar+0x18b>
c0106d5f:	83 ec 0c             	sub    $0xc,%esp
c0106d62:	ff 75 c4             	pushl  -0x3c(%ebp)
c0106d65:	e8 46 48 00 00       	call   c010b5b0 <Strlen>
c0106d6a:	83 c4 10             	add    $0x10,%esp
c0106d6d:	85 c0                	test   %eax,%eax
c0106d6f:	75 16                	jne    c0106d87 <untar+0x18b>
c0106d71:	83 ec 0c             	sub    $0xc,%esp
c0106d74:	68 1a aa 10 c0       	push   $0xc010aa1a
c0106d79:	e8 e2 16 00 00       	call   c0108460 <Printf>
c0106d7e:	83 c4 10             	add    $0x10,%esp
c0106d81:	90                   	nop
c0106d82:	e9 39 01 00 00       	jmp    c0106ec0 <untar+0x2c4>
c0106d87:	83 ec 0c             	sub    $0xc,%esp
c0106d8a:	68 21 aa 10 c0       	push   $0xc010aa21
c0106d8f:	e8 cc 16 00 00       	call   c0108460 <Printf>
c0106d94:	83 c4 10             	add    $0x10,%esp
c0106d97:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0106d9a:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106d9d:	eb 1f                	jmp    c0106dbe <untar+0x1c2>
c0106d9f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106da2:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0106da9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106dac:	0f b6 00             	movzbl (%eax),%eax
c0106daf:	0f be c0             	movsbl %al,%eax
c0106db2:	83 e8 30             	sub    $0x30,%eax
c0106db5:	01 d0                	add    %edx,%eax
c0106db7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106dba:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0106dbe:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106dc1:	0f b6 00             	movzbl (%eax),%eax
c0106dc4:	84 c0                	test   %al,%al
c0106dc6:	75 d7                	jne    c0106d9f <untar+0x1a3>
c0106dc8:	83 ec 0c             	sub    $0xc,%esp
c0106dcb:	68 2f aa 10 c0       	push   $0xc010aa2f
c0106dd0:	e8 8b 16 00 00       	call   c0108460 <Printf>
c0106dd5:	83 c4 10             	add    $0x10,%esp
c0106dd8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106ddb:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0106dde:	c7 45 bc 00 08 00 00 	movl   $0x800,-0x44(%ebp)
c0106de5:	83 ec 08             	sub    $0x8,%esp
c0106de8:	ff 75 c0             	pushl  -0x40(%ebp)
c0106deb:	68 3d aa 10 c0       	push   $0xc010aa3d
c0106df0:	e8 6b 16 00 00       	call   c0108460 <Printf>
c0106df5:	83 c4 10             	add    $0x10,%esp
c0106df8:	83 ec 08             	sub    $0x8,%esp
c0106dfb:	ff 75 c0             	pushl  -0x40(%ebp)
c0106dfe:	68 4f aa 10 c0       	push   $0xc010aa4f
c0106e03:	e8 58 16 00 00       	call   c0108460 <Printf>
c0106e08:	83 c4 10             	add    $0x10,%esp
c0106e0b:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0106e0e:	39 45 bc             	cmp    %eax,-0x44(%ebp)
c0106e11:	0f 4e 45 bc          	cmovle -0x44(%ebp),%eax
c0106e15:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0106e18:	e8 02 fd ff ff       	call   c0106b1f <catch_error>
c0106e1d:	83 ec 04             	sub    $0x4,%esp
c0106e20:	ff 75 b8             	pushl  -0x48(%ebp)
c0106e23:	8d 85 b8 f5 ff ff    	lea    -0xa48(%ebp),%eax
c0106e29:	50                   	push   %eax
c0106e2a:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106e2d:	e8 9f dc ff ff       	call   c0104ad1 <read>
c0106e32:	83 c4 10             	add    $0x10,%esp
c0106e35:	01 45 f4             	add    %eax,-0xc(%ebp)
c0106e38:	83 ec 04             	sub    $0x4,%esp
c0106e3b:	ff 75 b8             	pushl  -0x48(%ebp)
c0106e3e:	8d 85 b8 f5 ff ff    	lea    -0xa48(%ebp),%eax
c0106e44:	50                   	push   %eax
c0106e45:	ff 75 c8             	pushl  -0x38(%ebp)
c0106e48:	e8 05 de ff ff       	call   c0104c52 <write>
c0106e4d:	83 c4 10             	add    $0x10,%esp
c0106e50:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106e53:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0106e56:	7d 02                	jge    c0106e5a <untar+0x25e>
c0106e58:	eb be                	jmp    c0106e18 <untar+0x21c>
c0106e5a:	90                   	nop
c0106e5b:	83 ec 08             	sub    $0x8,%esp
c0106e5e:	ff 75 f4             	pushl  -0xc(%ebp)
c0106e61:	68 61 aa 10 c0       	push   $0xc010aa61
c0106e66:	e8 f5 15 00 00       	call   c0108460 <Printf>
c0106e6b:	83 c4 10             	add    $0x10,%esp
c0106e6e:	83 ec 08             	sub    $0x8,%esp
c0106e71:	ff 75 c0             	pushl  -0x40(%ebp)
c0106e74:	68 73 aa 10 c0       	push   $0xc010aa73
c0106e79:	e8 e2 15 00 00       	call   c0108460 <Printf>
c0106e7e:	83 c4 10             	add    $0x10,%esp
c0106e81:	83 ec 0c             	sub    $0xc,%esp
c0106e84:	68 84 aa 10 c0       	push   $0xc010aa84
c0106e89:	e8 d2 15 00 00       	call   c0108460 <Printf>
c0106e8e:	83 c4 10             	add    $0x10,%esp
c0106e91:	83 ec 0c             	sub    $0xc,%esp
c0106e94:	ff 75 c8             	pushl  -0x38(%ebp)
c0106e97:	e8 3b de ff ff       	call   c0104cd7 <close>
c0106e9c:	83 c4 10             	add    $0x10,%esp
c0106e9f:	83 ec 0c             	sub    $0xc,%esp
c0106ea2:	68 92 aa 10 c0       	push   $0xc010aa92
c0106ea7:	e8 b4 15 00 00       	call   c0108460 <Printf>
c0106eac:	83 c4 10             	add    $0x10,%esp
c0106eaf:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c0106eb3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0106eb7:	0f 8f 93 fd ff ff    	jg     c0106c50 <untar+0x54>
c0106ebd:	eb 01                	jmp    c0106ec0 <untar+0x2c4>
c0106ebf:	90                   	nop
c0106ec0:	83 ec 0c             	sub    $0xc,%esp
c0106ec3:	68 9f aa 10 c0       	push   $0xc010aa9f
c0106ec8:	e8 93 15 00 00       	call   c0108460 <Printf>
c0106ecd:	83 c4 10             	add    $0x10,%esp
c0106ed0:	83 ec 0c             	sub    $0xc,%esp
c0106ed3:	68 b1 aa 10 c0       	push   $0xc010aab1
c0106ed8:	e8 83 15 00 00       	call   c0108460 <Printf>
c0106edd:	83 c4 10             	add    $0x10,%esp
c0106ee0:	83 ec 0c             	sub    $0xc,%esp
c0106ee3:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106ee6:	e8 ec dd ff ff       	call   c0104cd7 <close>
c0106eeb:	83 c4 10             	add    $0x10,%esp
c0106eee:	83 ec 0c             	sub    $0xc,%esp
c0106ef1:	68 c1 aa 10 c0       	push   $0xc010aac1
c0106ef6:	e8 65 15 00 00       	call   c0108460 <Printf>
c0106efb:	83 c4 10             	add    $0x10,%esp
c0106efe:	83 ec 0c             	sub    $0xc,%esp
c0106f01:	68 d4 aa 10 c0       	push   $0xc010aad4
c0106f06:	e8 55 15 00 00       	call   c0108460 <Printf>
c0106f0b:	83 c4 10             	add    $0x10,%esp
c0106f0e:	90                   	nop
c0106f0f:	c9                   	leave  
c0106f10:	c3                   	ret    

c0106f11 <atoi>:
c0106f11:	55                   	push   %ebp
c0106f12:	89 e5                	mov    %esp,%ebp
c0106f14:	83 ec 10             	sub    $0x10,%esp
c0106f17:	8b 45 08             	mov    0x8(%ebp),%eax
c0106f1a:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0106f1d:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106f20:	8d 50 01             	lea    0x1(%eax),%edx
c0106f23:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0106f26:	c6 00 30             	movb   $0x30,(%eax)
c0106f29:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106f2c:	8d 50 01             	lea    0x1(%eax),%edx
c0106f2f:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0106f32:	c6 00 78             	movb   $0x78,(%eax)
c0106f35:	c6 45 fa 00          	movb   $0x0,-0x6(%ebp)
c0106f39:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0106f3d:	75 0e                	jne    c0106f4d <atoi+0x3c>
c0106f3f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106f42:	8d 50 01             	lea    0x1(%eax),%edx
c0106f45:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0106f48:	c6 00 30             	movb   $0x30,(%eax)
c0106f4b:	eb 61                	jmp    c0106fae <atoi+0x9d>
c0106f4d:	c7 45 f4 1c 00 00 00 	movl   $0x1c,-0xc(%ebp)
c0106f54:	eb 52                	jmp    c0106fa8 <atoi+0x97>
c0106f56:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106f59:	8b 55 0c             	mov    0xc(%ebp),%edx
c0106f5c:	89 c1                	mov    %eax,%ecx
c0106f5e:	d3 fa                	sar    %cl,%edx
c0106f60:	89 d0                	mov    %edx,%eax
c0106f62:	83 e0 0f             	and    $0xf,%eax
c0106f65:	88 45 fb             	mov    %al,-0x5(%ebp)
c0106f68:	80 7d fa 00          	cmpb   $0x0,-0x6(%ebp)
c0106f6c:	75 06                	jne    c0106f74 <atoi+0x63>
c0106f6e:	80 7d fb 00          	cmpb   $0x0,-0x5(%ebp)
c0106f72:	74 2f                	je     c0106fa3 <atoi+0x92>
c0106f74:	c6 45 fa 01          	movb   $0x1,-0x6(%ebp)
c0106f78:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0106f7c:	83 c0 30             	add    $0x30,%eax
c0106f7f:	88 45 fb             	mov    %al,-0x5(%ebp)
c0106f82:	80 7d fb 39          	cmpb   $0x39,-0x5(%ebp)
c0106f86:	7e 0a                	jle    c0106f92 <atoi+0x81>
c0106f88:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0106f8c:	83 c0 07             	add    $0x7,%eax
c0106f8f:	88 45 fb             	mov    %al,-0x5(%ebp)
c0106f92:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106f95:	8d 50 01             	lea    0x1(%eax),%edx
c0106f98:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0106f9b:	0f b6 55 fb          	movzbl -0x5(%ebp),%edx
c0106f9f:	88 10                	mov    %dl,(%eax)
c0106fa1:	eb 01                	jmp    c0106fa4 <atoi+0x93>
c0106fa3:	90                   	nop
c0106fa4:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c0106fa8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0106fac:	79 a8                	jns    c0106f56 <atoi+0x45>
c0106fae:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106fb1:	c6 00 00             	movb   $0x0,(%eax)
c0106fb4:	90                   	nop
c0106fb5:	c9                   	leave  
c0106fb6:	c3                   	ret    

c0106fb7 <disp_int>:
c0106fb7:	55                   	push   %ebp
c0106fb8:	89 e5                	mov    %esp,%ebp
c0106fba:	83 ec 18             	sub    $0x18,%esp
c0106fbd:	ff 75 08             	pushl  0x8(%ebp)
c0106fc0:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0106fc3:	50                   	push   %eax
c0106fc4:	e8 48 ff ff ff       	call   c0106f11 <atoi>
c0106fc9:	83 c4 08             	add    $0x8,%esp
c0106fcc:	83 ec 08             	sub    $0x8,%esp
c0106fcf:	6a 0b                	push   $0xb
c0106fd1:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0106fd4:	50                   	push   %eax
c0106fd5:	e8 ed 90 ff ff       	call   c01000c7 <disp_str_colour>
c0106fda:	83 c4 10             	add    $0x10,%esp
c0106fdd:	90                   	nop
c0106fde:	c9                   	leave  
c0106fdf:	c3                   	ret    

c0106fe0 <do_page_fault>:
c0106fe0:	55                   	push   %ebp
c0106fe1:	89 e5                	mov    %esp,%ebp
c0106fe3:	83 ec 28             	sub    $0x28,%esp
c0106fe6:	0f 20 d0             	mov    %cr2,%eax
c0106fe9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106fec:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0106ff3:	00 00 00 
c0106ff6:	83 ec 0c             	sub    $0xc,%esp
c0106ff9:	68 df aa 10 c0       	push   $0xc010aadf
c0106ffe:	e8 89 90 ff ff       	call   c010008c <disp_str>
c0107003:	83 c4 10             	add    $0x10,%esp
c0107006:	83 ec 0c             	sub    $0xc,%esp
c0107009:	68 ee aa 10 c0       	push   $0xc010aaee
c010700e:	e8 79 90 ff ff       	call   c010008c <disp_str>
c0107013:	83 c4 10             	add    $0x10,%esp
c0107016:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0107019:	83 ec 0c             	sub    $0xc,%esp
c010701c:	50                   	push   %eax
c010701d:	e8 95 ff ff ff       	call   c0106fb7 <disp_int>
c0107022:	83 c4 10             	add    $0x10,%esp
c0107025:	83 ec 0c             	sub    $0xc,%esp
c0107028:	68 f3 aa 10 c0       	push   $0xc010aaf3
c010702d:	e8 5a 90 ff ff       	call   c010008c <disp_str>
c0107032:	83 c4 10             	add    $0x10,%esp
c0107035:	83 ec 0c             	sub    $0xc,%esp
c0107038:	ff 75 f4             	pushl  -0xc(%ebp)
c010703b:	e8 51 ec ff ff       	call   c0105c91 <ptr_pde>
c0107040:	83 c4 10             	add    $0x10,%esp
c0107043:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107046:	83 ec 0c             	sub    $0xc,%esp
c0107049:	ff 75 f4             	pushl  -0xc(%ebp)
c010704c:	e8 53 ec ff ff       	call   c0105ca4 <ptr_pte>
c0107051:	83 c4 10             	add    $0x10,%esp
c0107054:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0107057:	83 ec 0c             	sub    $0xc,%esp
c010705a:	68 f5 aa 10 c0       	push   $0xc010aaf5
c010705f:	e8 28 90 ff ff       	call   c010008c <disp_str>
c0107064:	83 c4 10             	add    $0x10,%esp
c0107067:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010706a:	83 ec 0c             	sub    $0xc,%esp
c010706d:	50                   	push   %eax
c010706e:	e8 44 ff ff ff       	call   c0106fb7 <disp_int>
c0107073:	83 c4 10             	add    $0x10,%esp
c0107076:	83 ec 0c             	sub    $0xc,%esp
c0107079:	68 fa aa 10 c0       	push   $0xc010aafa
c010707e:	e8 09 90 ff ff       	call   c010008c <disp_str>
c0107083:	83 c4 10             	add    $0x10,%esp
c0107086:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0107089:	8b 00                	mov    (%eax),%eax
c010708b:	83 ec 0c             	sub    $0xc,%esp
c010708e:	50                   	push   %eax
c010708f:	e8 23 ff ff ff       	call   c0106fb7 <disp_int>
c0107094:	83 c4 10             	add    $0x10,%esp
c0107097:	83 ec 0c             	sub    $0xc,%esp
c010709a:	68 f3 aa 10 c0       	push   $0xc010aaf3
c010709f:	e8 e8 8f ff ff       	call   c010008c <disp_str>
c01070a4:	83 c4 10             	add    $0x10,%esp
c01070a7:	83 ec 0c             	sub    $0xc,%esp
c01070aa:	68 03 ab 10 c0       	push   $0xc010ab03
c01070af:	e8 d8 8f ff ff       	call   c010008c <disp_str>
c01070b4:	83 c4 10             	add    $0x10,%esp
c01070b7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01070ba:	83 ec 0c             	sub    $0xc,%esp
c01070bd:	50                   	push   %eax
c01070be:	e8 f4 fe ff ff       	call   c0106fb7 <disp_int>
c01070c3:	83 c4 10             	add    $0x10,%esp
c01070c6:	83 ec 0c             	sub    $0xc,%esp
c01070c9:	68 08 ab 10 c0       	push   $0xc010ab08
c01070ce:	e8 b9 8f ff ff       	call   c010008c <disp_str>
c01070d3:	83 c4 10             	add    $0x10,%esp
c01070d6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01070d9:	8b 00                	mov    (%eax),%eax
c01070db:	83 ec 0c             	sub    $0xc,%esp
c01070de:	50                   	push   %eax
c01070df:	e8 d3 fe ff ff       	call   c0106fb7 <disp_int>
c01070e4:	83 c4 10             	add    $0x10,%esp
c01070e7:	83 ec 0c             	sub    $0xc,%esp
c01070ea:	68 f3 aa 10 c0       	push   $0xc010aaf3
c01070ef:	e8 98 8f ff ff       	call   c010008c <disp_str>
c01070f4:	83 c4 10             	add    $0x10,%esp
c01070f7:	c7 45 e8 00 00 10 00 	movl   $0x100000,-0x18(%ebp)
c01070fe:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0107101:	8b 00                	mov    (%eax),%eax
c0107103:	83 e0 01             	and    $0x1,%eax
c0107106:	85 c0                	test   %eax,%eax
c0107108:	74 09                	je     c0107113 <do_page_fault+0x133>
c010710a:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
c0107111:	eb 07                	jmp    c010711a <do_page_fault+0x13a>
c0107113:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c010711a:	90                   	nop
c010711b:	c9                   	leave  
c010711c:	c3                   	ret    

c010711d <exception_handler>:
c010711d:	55                   	push   %ebp
c010711e:	89 e5                	mov    %esp,%ebp
c0107120:	57                   	push   %edi
c0107121:	56                   	push   %esi
c0107122:	53                   	push   %ebx
c0107123:	83 ec 6c             	sub    $0x6c,%esp
c0107126:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0107129:	bb 80 ad 10 c0       	mov    $0xc010ad80,%ebx
c010712e:	ba 13 00 00 00       	mov    $0x13,%edx
c0107133:	89 c7                	mov    %eax,%edi
c0107135:	89 de                	mov    %ebx,%esi
c0107137:	89 d1                	mov    %edx,%ecx
c0107139:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c010713b:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0107142:	eb 04                	jmp    c0107148 <exception_handler+0x2b>
c0107144:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0107148:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c010714f:	7e f3                	jle    c0107144 <exception_handler+0x27>
c0107151:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0107158:	00 00 00 
c010715b:	83 ec 0c             	sub    $0xc,%esp
c010715e:	68 11 ab 10 c0       	push   $0xc010ab11
c0107163:	e8 24 8f ff ff       	call   c010008c <disp_str>
c0107168:	83 c4 10             	add    $0x10,%esp
c010716b:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c0107172:	8b 45 08             	mov    0x8(%ebp),%eax
c0107175:	8b 44 85 8c          	mov    -0x74(%ebp,%eax,4),%eax
c0107179:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010717c:	83 ec 0c             	sub    $0xc,%esp
c010717f:	ff 75 dc             	pushl  -0x24(%ebp)
c0107182:	e8 05 8f ff ff       	call   c010008c <disp_str>
c0107187:	83 c4 10             	add    $0x10,%esp
c010718a:	83 ec 0c             	sub    $0xc,%esp
c010718d:	68 1f ab 10 c0       	push   $0xc010ab1f
c0107192:	e8 f5 8e ff ff       	call   c010008c <disp_str>
c0107197:	83 c4 10             	add    $0x10,%esp
c010719a:	83 ec 0c             	sub    $0xc,%esp
c010719d:	68 22 ab 10 c0       	push   $0xc010ab22
c01071a2:	e8 e5 8e ff ff       	call   c010008c <disp_str>
c01071a7:	83 c4 10             	add    $0x10,%esp
c01071aa:	8b 45 08             	mov    0x8(%ebp),%eax
c01071ad:	83 ec 0c             	sub    $0xc,%esp
c01071b0:	50                   	push   %eax
c01071b1:	e8 01 fe ff ff       	call   c0106fb7 <disp_int>
c01071b6:	83 c4 10             	add    $0x10,%esp
c01071b9:	83 ec 0c             	sub    $0xc,%esp
c01071bc:	68 1f ab 10 c0       	push   $0xc010ab1f
c01071c1:	e8 c6 8e ff ff       	call   c010008c <disp_str>
c01071c6:	83 c4 10             	add    $0x10,%esp
c01071c9:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c01071cd:	74 2f                	je     c01071fe <exception_handler+0xe1>
c01071cf:	83 ec 0c             	sub    $0xc,%esp
c01071d2:	68 2a ab 10 c0       	push   $0xc010ab2a
c01071d7:	e8 b0 8e ff ff       	call   c010008c <disp_str>
c01071dc:	83 c4 10             	add    $0x10,%esp
c01071df:	8b 45 0c             	mov    0xc(%ebp),%eax
c01071e2:	83 ec 0c             	sub    $0xc,%esp
c01071e5:	50                   	push   %eax
c01071e6:	e8 cc fd ff ff       	call   c0106fb7 <disp_int>
c01071eb:	83 c4 10             	add    $0x10,%esp
c01071ee:	83 ec 0c             	sub    $0xc,%esp
c01071f1:	68 1f ab 10 c0       	push   $0xc010ab1f
c01071f6:	e8 91 8e ff ff       	call   c010008c <disp_str>
c01071fb:	83 c4 10             	add    $0x10,%esp
c01071fe:	83 ec 0c             	sub    $0xc,%esp
c0107201:	68 34 ab 10 c0       	push   $0xc010ab34
c0107206:	e8 81 8e ff ff       	call   c010008c <disp_str>
c010720b:	83 c4 10             	add    $0x10,%esp
c010720e:	83 ec 0c             	sub    $0xc,%esp
c0107211:	ff 75 14             	pushl  0x14(%ebp)
c0107214:	e8 9e fd ff ff       	call   c0106fb7 <disp_int>
c0107219:	83 c4 10             	add    $0x10,%esp
c010721c:	83 ec 0c             	sub    $0xc,%esp
c010721f:	68 1f ab 10 c0       	push   $0xc010ab1f
c0107224:	e8 63 8e ff ff       	call   c010008c <disp_str>
c0107229:	83 c4 10             	add    $0x10,%esp
c010722c:	83 ec 0c             	sub    $0xc,%esp
c010722f:	68 38 ab 10 c0       	push   $0xc010ab38
c0107234:	e8 53 8e ff ff       	call   c010008c <disp_str>
c0107239:	83 c4 10             	add    $0x10,%esp
c010723c:	8b 45 10             	mov    0x10(%ebp),%eax
c010723f:	83 ec 0c             	sub    $0xc,%esp
c0107242:	50                   	push   %eax
c0107243:	e8 6f fd ff ff       	call   c0106fb7 <disp_int>
c0107248:	83 c4 10             	add    $0x10,%esp
c010724b:	83 ec 0c             	sub    $0xc,%esp
c010724e:	68 1f ab 10 c0       	push   $0xc010ab1f
c0107253:	e8 34 8e ff ff       	call   c010008c <disp_str>
c0107258:	83 c4 10             	add    $0x10,%esp
c010725b:	83 ec 0c             	sub    $0xc,%esp
c010725e:	68 3d ab 10 c0       	push   $0xc010ab3d
c0107263:	e8 24 8e ff ff       	call   c010008c <disp_str>
c0107268:	83 c4 10             	add    $0x10,%esp
c010726b:	83 ec 0c             	sub    $0xc,%esp
c010726e:	ff 75 18             	pushl  0x18(%ebp)
c0107271:	e8 41 fd ff ff       	call   c0106fb7 <disp_int>
c0107276:	83 c4 10             	add    $0x10,%esp
c0107279:	83 ec 0c             	sub    $0xc,%esp
c010727c:	68 1f ab 10 c0       	push   $0xc010ab1f
c0107281:	e8 06 8e ff ff       	call   c010008c <disp_str>
c0107286:	83 c4 10             	add    $0x10,%esp
c0107289:	83 ec 0c             	sub    $0xc,%esp
c010728c:	68 48 ab 10 c0       	push   $0xc010ab48
c0107291:	e8 f6 8d ff ff       	call   c010008c <disp_str>
c0107296:	83 c4 10             	add    $0x10,%esp
c0107299:	83 7d 08 0e          	cmpl   $0xe,0x8(%ebp)
c010729d:	75 45                	jne    c01072e4 <exception_handler+0x1c7>
c010729f:	0f 20 d0             	mov    %cr2,%eax
c01072a2:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01072a5:	83 ec 0c             	sub    $0xc,%esp
c01072a8:	68 67 ab 10 c0       	push   $0xc010ab67
c01072ad:	e8 da 8d ff ff       	call   c010008c <disp_str>
c01072b2:	83 c4 10             	add    $0x10,%esp
c01072b5:	83 ec 0c             	sub    $0xc,%esp
c01072b8:	68 ee aa 10 c0       	push   $0xc010aaee
c01072bd:	e8 ca 8d ff ff       	call   c010008c <disp_str>
c01072c2:	83 c4 10             	add    $0x10,%esp
c01072c5:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01072c8:	83 ec 0c             	sub    $0xc,%esp
c01072cb:	50                   	push   %eax
c01072cc:	e8 e6 fc ff ff       	call   c0106fb7 <disp_int>
c01072d1:	83 c4 10             	add    $0x10,%esp
c01072d4:	83 ec 0c             	sub    $0xc,%esp
c01072d7:	68 f3 aa 10 c0       	push   $0xc010aaf3
c01072dc:	e8 ab 8d ff ff       	call   c010008c <disp_str>
c01072e1:	83 c4 10             	add    $0x10,%esp
c01072e4:	83 7d 08 0d          	cmpl   $0xd,0x8(%ebp)
c01072e8:	75 11                	jne    c01072fb <exception_handler+0x1de>
c01072ea:	83 ec 0c             	sub    $0xc,%esp
c01072ed:	68 73 ab 10 c0       	push   $0xc010ab73
c01072f2:	e8 95 8d ff ff       	call   c010008c <disp_str>
c01072f7:	83 c4 10             	add    $0x10,%esp
c01072fa:	90                   	nop
c01072fb:	90                   	nop
c01072fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
c01072ff:	5b                   	pop    %ebx
c0107300:	5e                   	pop    %esi
c0107301:	5f                   	pop    %edi
c0107302:	5d                   	pop    %ebp
c0107303:	c3                   	ret    

c0107304 <init_internal_interrupt>:
c0107304:	55                   	push   %ebp
c0107305:	89 e5                	mov    %esp,%ebp
c0107307:	83 ec 08             	sub    $0x8,%esp
c010730a:	6a 0e                	push   $0xe
c010730c:	6a 08                	push   $0x8
c010730e:	68 03 01 10 c0       	push   $0xc0100103
c0107313:	6a 00                	push   $0x0
c0107315:	e8 62 c7 ff ff       	call   c0103a7c <InitInterruptDesc>
c010731a:	83 c4 10             	add    $0x10,%esp
c010731d:	6a 0e                	push   $0xe
c010731f:	6a 08                	push   $0x8
c0107321:	68 09 01 10 c0       	push   $0xc0100109
c0107326:	6a 01                	push   $0x1
c0107328:	e8 4f c7 ff ff       	call   c0103a7c <InitInterruptDesc>
c010732d:	83 c4 10             	add    $0x10,%esp
c0107330:	6a 0e                	push   $0xe
c0107332:	6a 08                	push   $0x8
c0107334:	68 0f 01 10 c0       	push   $0xc010010f
c0107339:	6a 02                	push   $0x2
c010733b:	e8 3c c7 ff ff       	call   c0103a7c <InitInterruptDesc>
c0107340:	83 c4 10             	add    $0x10,%esp
c0107343:	6a 0e                	push   $0xe
c0107345:	6a 08                	push   $0x8
c0107347:	68 15 01 10 c0       	push   $0xc0100115
c010734c:	6a 03                	push   $0x3
c010734e:	e8 29 c7 ff ff       	call   c0103a7c <InitInterruptDesc>
c0107353:	83 c4 10             	add    $0x10,%esp
c0107356:	6a 0e                	push   $0xe
c0107358:	6a 08                	push   $0x8
c010735a:	68 1b 01 10 c0       	push   $0xc010011b
c010735f:	6a 04                	push   $0x4
c0107361:	e8 16 c7 ff ff       	call   c0103a7c <InitInterruptDesc>
c0107366:	83 c4 10             	add    $0x10,%esp
c0107369:	6a 0e                	push   $0xe
c010736b:	6a 08                	push   $0x8
c010736d:	68 21 01 10 c0       	push   $0xc0100121
c0107372:	6a 05                	push   $0x5
c0107374:	e8 03 c7 ff ff       	call   c0103a7c <InitInterruptDesc>
c0107379:	83 c4 10             	add    $0x10,%esp
c010737c:	6a 0e                	push   $0xe
c010737e:	6a 08                	push   $0x8
c0107380:	68 27 01 10 c0       	push   $0xc0100127
c0107385:	6a 06                	push   $0x6
c0107387:	e8 f0 c6 ff ff       	call   c0103a7c <InitInterruptDesc>
c010738c:	83 c4 10             	add    $0x10,%esp
c010738f:	6a 0e                	push   $0xe
c0107391:	6a 08                	push   $0x8
c0107393:	68 2d 01 10 c0       	push   $0xc010012d
c0107398:	6a 07                	push   $0x7
c010739a:	e8 dd c6 ff ff       	call   c0103a7c <InitInterruptDesc>
c010739f:	83 c4 10             	add    $0x10,%esp
c01073a2:	6a 0e                	push   $0xe
c01073a4:	6a 08                	push   $0x8
c01073a6:	68 33 01 10 c0       	push   $0xc0100133
c01073ab:	6a 08                	push   $0x8
c01073ad:	e8 ca c6 ff ff       	call   c0103a7c <InitInterruptDesc>
c01073b2:	83 c4 10             	add    $0x10,%esp
c01073b5:	6a 0e                	push   $0xe
c01073b7:	6a 08                	push   $0x8
c01073b9:	68 37 01 10 c0       	push   $0xc0100137
c01073be:	6a 09                	push   $0x9
c01073c0:	e8 b7 c6 ff ff       	call   c0103a7c <InitInterruptDesc>
c01073c5:	83 c4 10             	add    $0x10,%esp
c01073c8:	6a 0e                	push   $0xe
c01073ca:	6a 08                	push   $0x8
c01073cc:	68 3d 01 10 c0       	push   $0xc010013d
c01073d1:	6a 0a                	push   $0xa
c01073d3:	e8 a4 c6 ff ff       	call   c0103a7c <InitInterruptDesc>
c01073d8:	83 c4 10             	add    $0x10,%esp
c01073db:	6a 0e                	push   $0xe
c01073dd:	6a 08                	push   $0x8
c01073df:	68 41 01 10 c0       	push   $0xc0100141
c01073e4:	6a 0b                	push   $0xb
c01073e6:	e8 91 c6 ff ff       	call   c0103a7c <InitInterruptDesc>
c01073eb:	83 c4 10             	add    $0x10,%esp
c01073ee:	6a 0e                	push   $0xe
c01073f0:	6a 08                	push   $0x8
c01073f2:	68 45 01 10 c0       	push   $0xc0100145
c01073f7:	6a 0c                	push   $0xc
c01073f9:	e8 7e c6 ff ff       	call   c0103a7c <InitInterruptDesc>
c01073fe:	83 c4 10             	add    $0x10,%esp
c0107401:	6a 0e                	push   $0xe
c0107403:	6a 08                	push   $0x8
c0107405:	68 49 01 10 c0       	push   $0xc0100149
c010740a:	6a 0d                	push   $0xd
c010740c:	e8 6b c6 ff ff       	call   c0103a7c <InitInterruptDesc>
c0107411:	83 c4 10             	add    $0x10,%esp
c0107414:	6a 0e                	push   $0xe
c0107416:	6a 08                	push   $0x8
c0107418:	68 54 01 10 c0       	push   $0xc0100154
c010741d:	6a 0e                	push   $0xe
c010741f:	e8 58 c6 ff ff       	call   c0103a7c <InitInterruptDesc>
c0107424:	83 c4 10             	add    $0x10,%esp
c0107427:	6a 0e                	push   $0xe
c0107429:	6a 08                	push   $0x8
c010742b:	68 58 01 10 c0       	push   $0xc0100158
c0107430:	6a 10                	push   $0x10
c0107432:	e8 45 c6 ff ff       	call   c0103a7c <InitInterruptDesc>
c0107437:	83 c4 10             	add    $0x10,%esp
c010743a:	6a 0e                	push   $0xe
c010743c:	6a 08                	push   $0x8
c010743e:	68 5e 01 10 c0       	push   $0xc010015e
c0107443:	6a 11                	push   $0x11
c0107445:	e8 32 c6 ff ff       	call   c0103a7c <InitInterruptDesc>
c010744a:	83 c4 10             	add    $0x10,%esp
c010744d:	6a 0e                	push   $0xe
c010744f:	6a 08                	push   $0x8
c0107451:	68 62 01 10 c0       	push   $0xc0100162
c0107456:	6a 12                	push   $0x12
c0107458:	e8 1f c6 ff ff       	call   c0103a7c <InitInterruptDesc>
c010745d:	83 c4 10             	add    $0x10,%esp
c0107460:	6a 0e                	push   $0xe
c0107462:	6a 0e                	push   $0xe
c0107464:	68 21 02 10 c0       	push   $0xc0100221
c0107469:	68 90 00 00 00       	push   $0x90
c010746e:	e8 09 c6 ff ff       	call   c0103a7c <InitInterruptDesc>
c0107473:	83 c4 10             	add    $0x10,%esp
c0107476:	90                   	nop
c0107477:	c9                   	leave  
c0107478:	c3                   	ret    

c0107479 <spurious_irq>:
c0107479:	55                   	push   %ebp
c010747a:	89 e5                	mov    %esp,%ebp
c010747c:	83 ec 08             	sub    $0x8,%esp
c010747f:	83 ec 08             	sub    $0x8,%esp
c0107482:	6a 0b                	push   $0xb
c0107484:	68 cc ad 10 c0       	push   $0xc010adcc
c0107489:	e8 39 8c ff ff       	call   c01000c7 <disp_str_colour>
c010748e:	83 c4 10             	add    $0x10,%esp
c0107491:	83 ec 0c             	sub    $0xc,%esp
c0107494:	ff 75 08             	pushl  0x8(%ebp)
c0107497:	e8 1b fb ff ff       	call   c0106fb7 <disp_int>
c010749c:	83 c4 10             	add    $0x10,%esp
c010749f:	a1 e8 0e 11 c0       	mov    0xc0110ee8,%eax
c01074a4:	8b 15 ec 0e 11 c0    	mov    0xc0110eec,%edx
c01074aa:	83 c0 01             	add    $0x1,%eax
c01074ad:	83 d2 00             	adc    $0x0,%edx
c01074b0:	a3 e8 0e 11 c0       	mov    %eax,0xc0110ee8
c01074b5:	89 15 ec 0e 11 c0    	mov    %edx,0xc0110eec
c01074bb:	83 ec 0c             	sub    $0xc,%esp
c01074be:	68 e0 a9 10 c0       	push   $0xc010a9e0
c01074c3:	e8 c4 8b ff ff       	call   c010008c <disp_str>
c01074c8:	83 c4 10             	add    $0x10,%esp
c01074cb:	a1 e8 0e 11 c0       	mov    0xc0110ee8,%eax
c01074d0:	8b 15 ec 0e 11 c0    	mov    0xc0110eec,%edx
c01074d6:	83 ec 0c             	sub    $0xc,%esp
c01074d9:	50                   	push   %eax
c01074da:	e8 d8 fa ff ff       	call   c0106fb7 <disp_int>
c01074df:	83 c4 10             	add    $0x10,%esp
c01074e2:	83 ec 0c             	sub    $0xc,%esp
c01074e5:	68 e2 a9 10 c0       	push   $0xc010a9e2
c01074ea:	e8 9d 8b ff ff       	call   c010008c <disp_str>
c01074ef:	83 c4 10             	add    $0x10,%esp
c01074f2:	83 ec 08             	sub    $0x8,%esp
c01074f5:	6a 0c                	push   $0xc
c01074f7:	68 f4 ad 10 c0       	push   $0xc010adf4
c01074fc:	e8 c6 8b ff ff       	call   c01000c7 <disp_str_colour>
c0107501:	83 c4 10             	add    $0x10,%esp
c0107504:	90                   	nop
c0107505:	c9                   	leave  
c0107506:	c3                   	ret    

c0107507 <init_keyboard>:
c0107507:	55                   	push   %ebp
c0107508:	89 e5                	mov    %esp,%ebp
c010750a:	83 ec 08             	sub    $0x8,%esp
c010750d:	83 ec 04             	sub    $0x4,%esp
c0107510:	68 00 02 00 00       	push   $0x200
c0107515:	6a 00                	push   $0x0
c0107517:	68 ec fb 10 c0       	push   $0xc010fbec
c010751c:	e8 56 40 00 00       	call   c010b577 <Memset>
c0107521:	83 c4 10             	add    $0x10,%esp
c0107524:	c7 05 e0 fb 10 c0 ec 	movl   $0xc010fbec,0xc010fbe0
c010752b:	fb 10 c0 
c010752e:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c0107533:	a3 e4 fb 10 c0       	mov    %eax,0xc010fbe4
c0107538:	c7 05 e8 fb 10 c0 00 	movl   $0x0,0xc010fbe8
c010753f:	00 00 00 
c0107542:	e8 4f d3 ff ff       	call   c0104896 <init_keyboard_handler>
c0107547:	90                   	nop
c0107548:	c9                   	leave  
c0107549:	c3                   	ret    

c010754a <TestTTY>:
c010754a:	55                   	push   %ebp
c010754b:	89 e5                	mov    %esp,%ebp
c010754d:	83 ec 28             	sub    $0x28,%esp
c0107550:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0107557:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c010755e:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0107564:	83 ec 08             	sub    $0x8,%esp
c0107567:	6a 02                	push   $0x2
c0107569:	8d 45 de             	lea    -0x22(%ebp),%eax
c010756c:	50                   	push   %eax
c010756d:	e8 ca d4 ff ff       	call   c0104a3c <open>
c0107572:	83 c4 10             	add    $0x10,%esp
c0107575:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0107578:	83 ec 08             	sub    $0x8,%esp
c010757b:	6a 02                	push   $0x2
c010757d:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107580:	50                   	push   %eax
c0107581:	e8 b6 d4 ff ff       	call   c0104a3c <open>
c0107586:	83 c4 10             	add    $0x10,%esp
c0107589:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010758c:	83 ec 0c             	sub    $0xc,%esp
c010758f:	68 19 ae 10 c0       	push   $0xc010ae19
c0107594:	e8 c7 0e 00 00       	call   c0108460 <Printf>
c0107599:	83 c4 10             	add    $0x10,%esp
c010759c:	83 ec 0c             	sub    $0xc,%esp
c010759f:	6a 0a                	push   $0xa
c01075a1:	e8 86 9f ff ff       	call   c010152c <sys_malloc>
c01075a6:	83 c4 10             	add    $0x10,%esp
c01075a9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01075ac:	83 ec 04             	sub    $0x4,%esp
c01075af:	6a 0a                	push   $0xa
c01075b1:	6a 00                	push   $0x0
c01075b3:	ff 75 ec             	pushl  -0x14(%ebp)
c01075b6:	e8 bc 3f 00 00       	call   c010b577 <Memset>
c01075bb:	83 c4 10             	add    $0x10,%esp
c01075be:	83 ec 04             	sub    $0x4,%esp
c01075c1:	6a 0a                	push   $0xa
c01075c3:	ff 75 ec             	pushl  -0x14(%ebp)
c01075c6:	ff 75 f0             	pushl  -0x10(%ebp)
c01075c9:	e8 03 d5 ff ff       	call   c0104ad1 <read>
c01075ce:	83 c4 10             	add    $0x10,%esp
c01075d1:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01075d4:	83 ec 08             	sub    $0x8,%esp
c01075d7:	ff 75 ec             	pushl  -0x14(%ebp)
c01075da:	68 2b ae 10 c0       	push   $0xc010ae2b
c01075df:	e8 7c 0e 00 00       	call   c0108460 <Printf>
c01075e4:	83 c4 10             	add    $0x10,%esp
c01075e7:	eb c3                	jmp    c01075ac <TestTTY+0x62>

c01075e9 <TestReadReturnValue>:
c01075e9:	55                   	push   %ebp
c01075ea:	89 e5                	mov    %esp,%ebp
c01075ec:	81 ec 18 02 00 00    	sub    $0x218,%esp
c01075f2:	c7 45 f4 35 ae 10 c0 	movl   $0xc010ae35,-0xc(%ebp)
c01075f9:	83 ec 08             	sub    $0x8,%esp
c01075fc:	6a 00                	push   $0x0
c01075fe:	ff 75 f4             	pushl  -0xc(%ebp)
c0107601:	e8 36 d4 ff ff       	call   c0104a3c <open>
c0107606:	83 c4 10             	add    $0x10,%esp
c0107609:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010760c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0107613:	83 ec 04             	sub    $0x4,%esp
c0107616:	68 cb 00 00 00       	push   $0xcb
c010761b:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0107621:	50                   	push   %eax
c0107622:	ff 75 f0             	pushl  -0x10(%ebp)
c0107625:	e8 a7 d4 ff ff       	call   c0104ad1 <read>
c010762a:	83 c4 10             	add    $0x10,%esp
c010762d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0107630:	81 7d e8 cb 00 00 00 	cmpl   $0xcb,-0x18(%ebp)
c0107637:	74 1c                	je     c0107655 <TestReadReturnValue+0x6c>
c0107639:	68 08 02 00 00       	push   $0x208
c010763e:	68 41 ae 10 c0       	push   $0xc010ae41
c0107643:	68 41 ae 10 c0       	push   $0xc010ae41
c0107648:	68 51 ae 10 c0       	push   $0xc010ae51
c010764d:	e8 6b 11 00 00       	call   c01087bd <assertion_failure>
c0107652:	83 c4 10             	add    $0x10,%esp
c0107655:	83 ec 0c             	sub    $0xc,%esp
c0107658:	ff 75 f0             	pushl  -0x10(%ebp)
c010765b:	e8 77 d6 ff ff       	call   c0104cd7 <close>
c0107660:	83 c4 10             	add    $0x10,%esp
c0107663:	90                   	nop
c0107664:	c9                   	leave  
c0107665:	c3                   	ret    

c0107666 <TestWriteReturnValue>:
c0107666:	55                   	push   %ebp
c0107667:	89 e5                	mov    %esp,%ebp
c0107669:	81 ec 28 02 00 00    	sub    $0x228,%esp
c010766f:	c7 45 f4 5c ae 10 c0 	movl   $0xc010ae5c,-0xc(%ebp)
c0107676:	83 ec 08             	sub    $0x8,%esp
c0107679:	6a 07                	push   $0x7
c010767b:	ff 75 f4             	pushl  -0xc(%ebp)
c010767e:	e8 b9 d3 ff ff       	call   c0104a3c <open>
c0107683:	83 c4 10             	add    $0x10,%esp
c0107686:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107689:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
c010768d:	75 1c                	jne    c01076ab <TestWriteReturnValue+0x45>
c010768f:	68 12 02 00 00       	push   $0x212
c0107694:	68 41 ae 10 c0       	push   $0xc010ae41
c0107699:	68 41 ae 10 c0       	push   $0xc010ae41
c010769e:	68 69 ae 10 c0       	push   $0xc010ae69
c01076a3:	e8 15 11 00 00       	call   c01087bd <assertion_failure>
c01076a8:	83 c4 10             	add    $0x10,%esp
c01076ab:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01076b2:	c7 45 e8 74 ae 10 c0 	movl   $0xc010ae74,-0x18(%ebp)
c01076b9:	83 ec 0c             	sub    $0xc,%esp
c01076bc:	ff 75 e8             	pushl  -0x18(%ebp)
c01076bf:	e8 ec 3e 00 00       	call   c010b5b0 <Strlen>
c01076c4:	83 c4 10             	add    $0x10,%esp
c01076c7:	83 ec 04             	sub    $0x4,%esp
c01076ca:	50                   	push   %eax
c01076cb:	ff 75 e8             	pushl  -0x18(%ebp)
c01076ce:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c01076d4:	50                   	push   %eax
c01076d5:	e8 ef f4 ff ff       	call   c0106bc9 <Memcpy>
c01076da:	83 c4 10             	add    $0x10,%esp
c01076dd:	83 ec 04             	sub    $0x4,%esp
c01076e0:	68 ff 01 00 00       	push   $0x1ff
c01076e5:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c01076eb:	50                   	push   %eax
c01076ec:	ff 75 f0             	pushl  -0x10(%ebp)
c01076ef:	e8 5e d5 ff ff       	call   c0104c52 <write>
c01076f4:	83 c4 10             	add    $0x10,%esp
c01076f7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01076fa:	81 7d e4 cb 00 00 00 	cmpl   $0xcb,-0x1c(%ebp)
c0107701:	74 1c                	je     c010771f <TestWriteReturnValue+0xb9>
c0107703:	68 1c 02 00 00       	push   $0x21c
c0107708:	68 41 ae 10 c0       	push   $0xc010ae41
c010770d:	68 41 ae 10 c0       	push   $0xc010ae41
c0107712:	68 51 ae 10 c0       	push   $0xc010ae51
c0107717:	e8 a1 10 00 00       	call   c01087bd <assertion_failure>
c010771c:	83 c4 10             	add    $0x10,%esp
c010771f:	83 ec 0c             	sub    $0xc,%esp
c0107722:	ff 75 f0             	pushl  -0x10(%ebp)
c0107725:	e8 ad d5 ff ff       	call   c0104cd7 <close>
c010772a:	83 c4 10             	add    $0x10,%esp
c010772d:	90                   	nop
c010772e:	c9                   	leave  
c010772f:	c3                   	ret    

c0107730 <TestFS2>:
c0107730:	55                   	push   %ebp
c0107731:	89 e5                	mov    %esp,%ebp
c0107733:	83 ec 08             	sub    $0x8,%esp
c0107736:	e8 2b ff ff ff       	call   c0107666 <TestWriteReturnValue>
c010773b:	90                   	nop
c010773c:	c9                   	leave  
c010773d:	c3                   	ret    

c010773e <TestFS>:
c010773e:	55                   	push   %ebp
c010773f:	89 e5                	mov    %esp,%ebp
c0107741:	57                   	push   %edi
c0107742:	56                   	push   %esi
c0107743:	53                   	push   %ebx
c0107744:	81 ec 8c 02 00 00    	sub    $0x28c,%esp
c010774a:	83 ec 0c             	sub    $0xc,%esp
c010774d:	68 a7 ae 10 c0       	push   $0xc010aea7
c0107752:	e8 35 89 ff ff       	call   c010008c <disp_str>
c0107757:	83 c4 10             	add    $0x10,%esp
c010775a:	c7 45 ae 64 65 76 5f 	movl   $0x5f766564,-0x52(%ebp)
c0107761:	c7 45 b2 74 74 79 31 	movl   $0x31797474,-0x4e(%ebp)
c0107768:	66 c7 45 b6 00 00    	movw   $0x0,-0x4a(%ebp)
c010776e:	83 ec 08             	sub    $0x8,%esp
c0107771:	6a 02                	push   $0x2
c0107773:	8d 45 ae             	lea    -0x52(%ebp),%eax
c0107776:	50                   	push   %eax
c0107777:	e8 c0 d2 ff ff       	call   c0104a3c <open>
c010777c:	83 c4 10             	add    $0x10,%esp
c010777f:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0107782:	83 ec 08             	sub    $0x8,%esp
c0107785:	6a 02                	push   $0x2
c0107787:	8d 45 ae             	lea    -0x52(%ebp),%eax
c010778a:	50                   	push   %eax
c010778b:	e8 ac d2 ff ff       	call   c0104a3c <open>
c0107790:	83 c4 10             	add    $0x10,%esp
c0107793:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0107796:	83 ec 0c             	sub    $0xc,%esp
c0107799:	68 19 ae 10 c0       	push   $0xc010ae19
c010779e:	e8 bd 0c 00 00       	call   c0108460 <Printf>
c01077a3:	83 c4 10             	add    $0x10,%esp
c01077a6:	c7 45 a9 41 43 00 00 	movl   $0x4341,-0x57(%ebp)
c01077ad:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
c01077b1:	c7 45 a4 63 41 42 00 	movl   $0x424163,-0x5c(%ebp)
c01077b8:	c6 45 a8 00          	movb   $0x0,-0x58(%ebp)
c01077bc:	c7 45 9a 49 4e 54 45 	movl   $0x45544e49,-0x66(%ebp)
c01077c3:	c7 45 9e 52 52 55 50 	movl   $0x50555252,-0x62(%ebp)
c01077ca:	66 c7 45 a2 54 00    	movw   $0x54,-0x5e(%ebp)
c01077d0:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
c01077d7:	83 ec 0c             	sub    $0xc,%esp
c01077da:	68 af ae 10 c0       	push   $0xc010aeaf
c01077df:	e8 7c 0c 00 00       	call   c0108460 <Printf>
c01077e4:	83 c4 10             	add    $0x10,%esp
c01077e7:	83 7d d4 01          	cmpl   $0x1,-0x2c(%ebp)
c01077eb:	0f 85 e6 03 00 00    	jne    c0107bd7 <TestFS+0x499>
c01077f1:	83 ec 08             	sub    $0x8,%esp
c01077f4:	6a 07                	push   $0x7
c01077f6:	8d 45 a9             	lea    -0x57(%ebp),%eax
c01077f9:	50                   	push   %eax
c01077fa:	e8 3d d2 ff ff       	call   c0104a3c <open>
c01077ff:	83 c4 10             	add    $0x10,%esp
c0107802:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0107805:	83 ec 08             	sub    $0x8,%esp
c0107808:	ff 75 d0             	pushl  -0x30(%ebp)
c010780b:	68 c7 ae 10 c0       	push   $0xc010aec7
c0107810:	e8 4b 0c 00 00       	call   c0108460 <Printf>
c0107815:	83 c4 10             	add    $0x10,%esp
c0107818:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c010781f:	c7 45 86 63 67 3a 68 	movl   $0x683a6763,-0x7a(%ebp)
c0107826:	c7 45 8a 65 6c 6c 6f 	movl   $0x6f6c6c65,-0x76(%ebp)
c010782d:	c7 45 8e 2c 77 6f 72 	movl   $0x726f772c,-0x72(%ebp)
c0107834:	c7 45 92 6c 64 21 00 	movl   $0x21646c,-0x6e(%ebp)
c010783b:	c7 45 96 00 00 00 00 	movl   $0x0,-0x6a(%ebp)
c0107842:	83 ec 0c             	sub    $0xc,%esp
c0107845:	8d 45 86             	lea    -0x7a(%ebp),%eax
c0107848:	50                   	push   %eax
c0107849:	e8 62 3d 00 00       	call   c010b5b0 <Strlen>
c010784e:	83 c4 10             	add    $0x10,%esp
c0107851:	83 ec 04             	sub    $0x4,%esp
c0107854:	50                   	push   %eax
c0107855:	8d 45 86             	lea    -0x7a(%ebp),%eax
c0107858:	50                   	push   %eax
c0107859:	ff 75 d0             	pushl  -0x30(%ebp)
c010785c:	e8 f1 d3 ff ff       	call   c0104c52 <write>
c0107861:	83 c4 10             	add    $0x10,%esp
c0107864:	83 ec 0c             	sub    $0xc,%esp
c0107867:	ff 75 d0             	pushl  -0x30(%ebp)
c010786a:	e8 68 d4 ff ff       	call   c0104cd7 <close>
c010786f:	83 c4 10             	add    $0x10,%esp
c0107872:	83 ec 08             	sub    $0x8,%esp
c0107875:	6a 00                	push   $0x0
c0107877:	8d 45 a9             	lea    -0x57(%ebp),%eax
c010787a:	50                   	push   %eax
c010787b:	e8 bc d1 ff ff       	call   c0104a3c <open>
c0107880:	83 c4 10             	add    $0x10,%esp
c0107883:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0107886:	83 ec 04             	sub    $0x4,%esp
c0107889:	6a 14                	push   $0x14
c010788b:	6a 00                	push   $0x0
c010788d:	8d 85 72 ff ff ff    	lea    -0x8e(%ebp),%eax
c0107893:	50                   	push   %eax
c0107894:	e8 de 3c 00 00       	call   c010b577 <Memset>
c0107899:	83 c4 10             	add    $0x10,%esp
c010789c:	83 ec 04             	sub    $0x4,%esp
c010789f:	6a 12                	push   $0x12
c01078a1:	8d 85 72 ff ff ff    	lea    -0x8e(%ebp),%eax
c01078a7:	50                   	push   %eax
c01078a8:	ff 75 d0             	pushl  -0x30(%ebp)
c01078ab:	e8 21 d2 ff ff       	call   c0104ad1 <read>
c01078b0:	83 c4 10             	add    $0x10,%esp
c01078b3:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01078b6:	83 ec 08             	sub    $0x8,%esp
c01078b9:	8d 85 72 ff ff ff    	lea    -0x8e(%ebp),%eax
c01078bf:	50                   	push   %eax
c01078c0:	68 d0 ae 10 c0       	push   $0xc010aed0
c01078c5:	e8 96 0b 00 00       	call   c0108460 <Printf>
c01078ca:	83 c4 10             	add    $0x10,%esp
c01078cd:	83 ec 0c             	sub    $0xc,%esp
c01078d0:	6a 0a                	push   $0xa
c01078d2:	e8 55 0a 00 00       	call   c010832c <delay>
c01078d7:	83 c4 10             	add    $0x10,%esp
c01078da:	83 ec 08             	sub    $0x8,%esp
c01078dd:	6a 07                	push   $0x7
c01078df:	8d 45 a4             	lea    -0x5c(%ebp),%eax
c01078e2:	50                   	push   %eax
c01078e3:	e8 54 d1 ff ff       	call   c0104a3c <open>
c01078e8:	83 c4 10             	add    $0x10,%esp
c01078eb:	89 45 c8             	mov    %eax,-0x38(%ebp)
c01078ee:	83 ec 08             	sub    $0x8,%esp
c01078f1:	ff 75 c8             	pushl  -0x38(%ebp)
c01078f4:	68 db ae 10 c0       	push   $0xc010aedb
c01078f9:	e8 62 0b 00 00       	call   c0108460 <Printf>
c01078fe:	83 c4 10             	add    $0x10,%esp
c0107901:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0107908:	8d 85 92 fd ff ff    	lea    -0x26e(%ebp),%eax
c010790e:	bb 10 af 10 c0       	mov    $0xc010af10,%ebx
c0107913:	ba bf 00 00 00       	mov    $0xbf,%edx
c0107918:	8b 0b                	mov    (%ebx),%ecx
c010791a:	89 08                	mov    %ecx,(%eax)
c010791c:	8b 4c 13 fc          	mov    -0x4(%ebx,%edx,1),%ecx
c0107920:	89 4c 10 fc          	mov    %ecx,-0x4(%eax,%edx,1)
c0107924:	8d 78 04             	lea    0x4(%eax),%edi
c0107927:	83 e7 fc             	and    $0xfffffffc,%edi
c010792a:	29 f8                	sub    %edi,%eax
c010792c:	29 c3                	sub    %eax,%ebx
c010792e:	01 c2                	add    %eax,%edx
c0107930:	83 e2 fc             	and    $0xfffffffc,%edx
c0107933:	89 d0                	mov    %edx,%eax
c0107935:	c1 e8 02             	shr    $0x2,%eax
c0107938:	89 de                	mov    %ebx,%esi
c010793a:	89 c1                	mov    %eax,%ecx
c010793c:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c010793e:	c7 85 51 fe ff ff 00 	movl   $0x0,-0x1af(%ebp)
c0107945:	00 00 00 
c0107948:	c7 85 55 fe ff ff 00 	movl   $0x0,-0x1ab(%ebp)
c010794f:	00 00 00 
c0107952:	c6 85 59 fe ff ff 00 	movb   $0x0,-0x1a7(%ebp)
c0107959:	83 ec 0c             	sub    $0xc,%esp
c010795c:	8d 85 92 fd ff ff    	lea    -0x26e(%ebp),%eax
c0107962:	50                   	push   %eax
c0107963:	e8 48 3c 00 00       	call   c010b5b0 <Strlen>
c0107968:	83 c4 10             	add    $0x10,%esp
c010796b:	83 ec 04             	sub    $0x4,%esp
c010796e:	50                   	push   %eax
c010796f:	8d 85 92 fd ff ff    	lea    -0x26e(%ebp),%eax
c0107975:	50                   	push   %eax
c0107976:	ff 75 c8             	pushl  -0x38(%ebp)
c0107979:	e8 d4 d2 ff ff       	call   c0104c52 <write>
c010797e:	83 c4 10             	add    $0x10,%esp
c0107981:	83 ec 0c             	sub    $0xc,%esp
c0107984:	ff 75 c8             	pushl  -0x38(%ebp)
c0107987:	e8 4b d3 ff ff       	call   c0104cd7 <close>
c010798c:	83 c4 10             	add    $0x10,%esp
c010798f:	83 ec 08             	sub    $0x8,%esp
c0107992:	6a 00                	push   $0x0
c0107994:	8d 45 a4             	lea    -0x5c(%ebp),%eax
c0107997:	50                   	push   %eax
c0107998:	e8 9f d0 ff ff       	call   c0104a3c <open>
c010799d:	83 c4 10             	add    $0x10,%esp
c01079a0:	89 45 c8             	mov    %eax,-0x38(%ebp)
c01079a3:	83 ec 04             	sub    $0x4,%esp
c01079a6:	68 c8 00 00 00       	push   $0xc8
c01079ab:	6a 00                	push   $0x0
c01079ad:	8d 85 5a fe ff ff    	lea    -0x1a6(%ebp),%eax
c01079b3:	50                   	push   %eax
c01079b4:	e8 be 3b 00 00       	call   c010b577 <Memset>
c01079b9:	83 c4 10             	add    $0x10,%esp
c01079bc:	83 ec 0c             	sub    $0xc,%esp
c01079bf:	8d 85 92 fd ff ff    	lea    -0x26e(%ebp),%eax
c01079c5:	50                   	push   %eax
c01079c6:	e8 e5 3b 00 00       	call   c010b5b0 <Strlen>
c01079cb:	83 c4 10             	add    $0x10,%esp
c01079ce:	83 ec 04             	sub    $0x4,%esp
c01079d1:	50                   	push   %eax
c01079d2:	8d 85 5a fe ff ff    	lea    -0x1a6(%ebp),%eax
c01079d8:	50                   	push   %eax
c01079d9:	ff 75 c8             	pushl  -0x38(%ebp)
c01079dc:	e8 f0 d0 ff ff       	call   c0104ad1 <read>
c01079e1:	83 c4 10             	add    $0x10,%esp
c01079e4:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c01079e7:	83 ec 08             	sub    $0x8,%esp
c01079ea:	8d 85 5a fe ff ff    	lea    -0x1a6(%ebp),%eax
c01079f0:	50                   	push   %eax
c01079f1:	68 e5 ae 10 c0       	push   $0xc010aee5
c01079f6:	e8 65 0a 00 00       	call   c0108460 <Printf>
c01079fb:	83 c4 10             	add    $0x10,%esp
c01079fe:	83 ec 08             	sub    $0x8,%esp
c0107a01:	6a 07                	push   $0x7
c0107a03:	8d 45 9a             	lea    -0x66(%ebp),%eax
c0107a06:	50                   	push   %eax
c0107a07:	e8 30 d0 ff ff       	call   c0104a3c <open>
c0107a0c:	83 c4 10             	add    $0x10,%esp
c0107a0f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0107a12:	83 ec 08             	sub    $0x8,%esp
c0107a15:	ff 75 c8             	pushl  -0x38(%ebp)
c0107a18:	68 db ae 10 c0       	push   $0xc010aedb
c0107a1d:	e8 3e 0a 00 00       	call   c0108460 <Printf>
c0107a22:	83 c4 10             	add    $0x10,%esp
c0107a25:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0107a2c:	c7 85 54 ff ff ff 49 	movl   $0x69772049,-0xac(%ebp)
c0107a33:	20 77 69 
c0107a36:	c7 85 58 ff ff ff 6c 	movl   $0x73206c6c,-0xa8(%ebp)
c0107a3d:	6c 20 73 
c0107a40:	c7 85 5c ff ff ff 75 	movl   $0x65636375,-0xa4(%ebp)
c0107a47:	63 63 65 
c0107a4a:	c7 85 60 ff ff ff 73 	movl   $0x61207373,-0xa0(%ebp)
c0107a51:	73 20 61 
c0107a54:	c7 85 64 ff ff ff 74 	movl   $0x616c2074,-0x9c(%ebp)
c0107a5b:	20 6c 61 
c0107a5e:	c7 85 68 ff ff ff 73 	movl   $0x2e7473,-0x98(%ebp)
c0107a65:	74 2e 00 
c0107a68:	c7 85 6c ff ff ff 00 	movl   $0x0,-0x94(%ebp)
c0107a6f:	00 00 00 
c0107a72:	66 c7 85 70 ff ff ff 	movw   $0x0,-0x90(%ebp)
c0107a79:	00 00 
c0107a7b:	83 ec 0c             	sub    $0xc,%esp
c0107a7e:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
c0107a84:	50                   	push   %eax
c0107a85:	e8 26 3b 00 00       	call   c010b5b0 <Strlen>
c0107a8a:	83 c4 10             	add    $0x10,%esp
c0107a8d:	83 ec 04             	sub    $0x4,%esp
c0107a90:	50                   	push   %eax
c0107a91:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
c0107a97:	50                   	push   %eax
c0107a98:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107a9b:	e8 b2 d1 ff ff       	call   c0104c52 <write>
c0107aa0:	83 c4 10             	add    $0x10,%esp
c0107aa3:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0107aaa:	eb 7e                	jmp    c0107b2a <TestFS+0x3ec>
c0107aac:	83 ec 0c             	sub    $0xc,%esp
c0107aaf:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107ab2:	e8 20 d2 ff ff       	call   c0104cd7 <close>
c0107ab7:	83 c4 10             	add    $0x10,%esp
c0107aba:	83 ec 08             	sub    $0x8,%esp
c0107abd:	6a 00                	push   $0x0
c0107abf:	8d 45 9a             	lea    -0x66(%ebp),%eax
c0107ac2:	50                   	push   %eax
c0107ac3:	e8 74 cf ff ff       	call   c0104a3c <open>
c0107ac8:	83 c4 10             	add    $0x10,%esp
c0107acb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0107ace:	83 ec 04             	sub    $0x4,%esp
c0107ad1:	6a 1e                	push   $0x1e
c0107ad3:	6a 00                	push   $0x0
c0107ad5:	8d 85 36 ff ff ff    	lea    -0xca(%ebp),%eax
c0107adb:	50                   	push   %eax
c0107adc:	e8 96 3a 00 00       	call   c010b577 <Memset>
c0107ae1:	83 c4 10             	add    $0x10,%esp
c0107ae4:	83 ec 0c             	sub    $0xc,%esp
c0107ae7:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
c0107aed:	50                   	push   %eax
c0107aee:	e8 bd 3a 00 00       	call   c010b5b0 <Strlen>
c0107af3:	83 c4 10             	add    $0x10,%esp
c0107af6:	83 ec 04             	sub    $0x4,%esp
c0107af9:	50                   	push   %eax
c0107afa:	8d 85 36 ff ff ff    	lea    -0xca(%ebp),%eax
c0107b00:	50                   	push   %eax
c0107b01:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107b04:	e8 c8 cf ff ff       	call   c0104ad1 <read>
c0107b09:	83 c4 10             	add    $0x10,%esp
c0107b0c:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0107b0f:	83 ec 08             	sub    $0x8,%esp
c0107b12:	8d 85 36 ff ff ff    	lea    -0xca(%ebp),%eax
c0107b18:	50                   	push   %eax
c0107b19:	68 f0 ae 10 c0       	push   $0xc010aef0
c0107b1e:	e8 3d 09 00 00       	call   c0108460 <Printf>
c0107b23:	83 c4 10             	add    $0x10,%esp
c0107b26:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0107b2a:	83 7d e0 02          	cmpl   $0x2,-0x20(%ebp)
c0107b2e:	0f 8e 78 ff ff ff    	jle    c0107aac <TestFS+0x36e>
c0107b34:	c7 85 22 ff ff ff 69 	movl   $0x74736e69,-0xde(%ebp)
c0107b3b:	6e 73 74 
c0107b3e:	c7 85 26 ff ff ff 61 	movl   $0x2e6c6c61,-0xda(%ebp)
c0107b45:	6c 6c 2e 
c0107b48:	c7 85 2a ff ff ff 74 	movl   $0x726174,-0xd6(%ebp)
c0107b4f:	61 72 00 
c0107b52:	c7 85 2e ff ff ff 00 	movl   $0x0,-0xd2(%ebp)
c0107b59:	00 00 00 
c0107b5c:	c7 85 32 ff ff ff 00 	movl   $0x0,-0xce(%ebp)
c0107b63:	00 00 00 
c0107b66:	83 ec 08             	sub    $0x8,%esp
c0107b69:	6a 00                	push   $0x0
c0107b6b:	8d 85 22 ff ff ff    	lea    -0xde(%ebp),%eax
c0107b71:	50                   	push   %eax
c0107b72:	e8 c5 ce ff ff       	call   c0104a3c <open>
c0107b77:	83 c4 10             	add    $0x10,%esp
c0107b7a:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0107b7d:	83 ec 08             	sub    $0x8,%esp
c0107b80:	ff 75 bc             	pushl  -0x44(%ebp)
c0107b83:	68 fb ae 10 c0       	push   $0xc010aefb
c0107b88:	e8 d3 08 00 00       	call   c0108460 <Printf>
c0107b8d:	83 c4 10             	add    $0x10,%esp
c0107b90:	83 ec 04             	sub    $0x4,%esp
c0107b93:	6a 28                	push   $0x28
c0107b95:	6a 00                	push   $0x0
c0107b97:	8d 85 6a fd ff ff    	lea    -0x296(%ebp),%eax
c0107b9d:	50                   	push   %eax
c0107b9e:	e8 d4 39 00 00       	call   c010b577 <Memset>
c0107ba3:	83 c4 10             	add    $0x10,%esp
c0107ba6:	83 ec 04             	sub    $0x4,%esp
c0107ba9:	6a 28                	push   $0x28
c0107bab:	8d 85 6a fd ff ff    	lea    -0x296(%ebp),%eax
c0107bb1:	50                   	push   %eax
c0107bb2:	ff 75 bc             	pushl  -0x44(%ebp)
c0107bb5:	e8 17 cf ff ff       	call   c0104ad1 <read>
c0107bba:	83 c4 10             	add    $0x10,%esp
c0107bbd:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0107bc0:	83 ec 08             	sub    $0x8,%esp
c0107bc3:	8d 85 6a fd ff ff    	lea    -0x296(%ebp),%eax
c0107bc9:	50                   	push   %eax
c0107bca:	68 05 af 10 c0       	push   $0xc010af05
c0107bcf:	e8 8c 08 00 00       	call   c0108460 <Printf>
c0107bd4:	83 c4 10             	add    $0x10,%esp
c0107bd7:	90                   	nop
c0107bd8:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0107bdb:	5b                   	pop    %ebx
c0107bdc:	5e                   	pop    %esi
c0107bdd:	5f                   	pop    %edi
c0107bde:	5d                   	pop    %ebp
c0107bdf:	c3                   	ret    

c0107be0 <wait_exit>:
c0107be0:	55                   	push   %ebp
c0107be1:	89 e5                	mov    %esp,%ebp
c0107be3:	83 ec 28             	sub    $0x28,%esp
c0107be6:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0107bed:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0107bf4:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0107bfa:	83 ec 08             	sub    $0x8,%esp
c0107bfd:	6a 02                	push   $0x2
c0107bff:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107c02:	50                   	push   %eax
c0107c03:	e8 34 ce ff ff       	call   c0104a3c <open>
c0107c08:	83 c4 10             	add    $0x10,%esp
c0107c0b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107c0e:	83 ec 08             	sub    $0x8,%esp
c0107c11:	6a 02                	push   $0x2
c0107c13:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107c16:	50                   	push   %eax
c0107c17:	e8 20 ce ff ff       	call   c0104a3c <open>
c0107c1c:	83 c4 10             	add    $0x10,%esp
c0107c1f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0107c22:	e8 75 d1 ff ff       	call   c0104d9c <fork>
c0107c27:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0107c2a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0107c2e:	7e 35                	jle    c0107c65 <wait_exit+0x85>
c0107c30:	83 ec 0c             	sub    $0xc,%esp
c0107c33:	68 d8 af 10 c0       	push   $0xc010afd8
c0107c38:	e8 23 08 00 00       	call   c0108460 <Printf>
c0107c3d:	83 c4 10             	add    $0x10,%esp
c0107c40:	83 ec 0c             	sub    $0xc,%esp
c0107c43:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0107c46:	50                   	push   %eax
c0107c47:	e8 dd d0 ff ff       	call   c0104d29 <wait>
c0107c4c:	83 c4 10             	add    $0x10,%esp
c0107c4f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0107c52:	83 ec 08             	sub    $0x8,%esp
c0107c55:	50                   	push   %eax
c0107c56:	68 f0 af 10 c0       	push   $0xc010aff0
c0107c5b:	e8 00 08 00 00       	call   c0108460 <Printf>
c0107c60:	83 c4 10             	add    $0x10,%esp
c0107c63:	eb fe                	jmp    c0107c63 <wait_exit+0x83>
c0107c65:	83 ec 0c             	sub    $0xc,%esp
c0107c68:	68 0b b0 10 c0       	push   $0xc010b00b
c0107c6d:	e8 ee 07 00 00       	call   c0108460 <Printf>
c0107c72:	83 c4 10             	add    $0x10,%esp
c0107c75:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0107c7c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0107c7f:	8d 50 01             	lea    0x1(%eax),%edx
c0107c82:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0107c85:	3d 50 c3 00 00       	cmp    $0xc350,%eax
c0107c8a:	7f 02                	jg     c0107c8e <wait_exit+0xae>
c0107c8c:	eb ee                	jmp    c0107c7c <wait_exit+0x9c>
c0107c8e:	90                   	nop
c0107c8f:	83 ec 0c             	sub    $0xc,%esp
c0107c92:	68 17 b0 10 c0       	push   $0xc010b017
c0107c97:	e8 c4 07 00 00       	call   c0108460 <Printf>
c0107c9c:	83 c4 10             	add    $0x10,%esp
c0107c9f:	83 ec 0c             	sub    $0xc,%esp
c0107ca2:	68 25 b0 10 c0       	push   $0xc010b025
c0107ca7:	e8 b4 07 00 00       	call   c0108460 <Printf>
c0107cac:	83 c4 10             	add    $0x10,%esp
c0107caf:	83 ec 0c             	sub    $0xc,%esp
c0107cb2:	68 34 b0 10 c0       	push   $0xc010b034
c0107cb7:	e8 a4 07 00 00       	call   c0108460 <Printf>
c0107cbc:	83 c4 10             	add    $0x10,%esp
c0107cbf:	83 ec 0c             	sub    $0xc,%esp
c0107cc2:	6a 5a                	push   $0x5a
c0107cc4:	e8 a4 d0 ff ff       	call   c0104d6d <exit>
c0107cc9:	83 c4 10             	add    $0x10,%esp
c0107ccc:	83 ec 0c             	sub    $0xc,%esp
c0107ccf:	68 43 b0 10 c0       	push   $0xc010b043
c0107cd4:	e8 87 07 00 00       	call   c0108460 <Printf>
c0107cd9:	83 c4 10             	add    $0x10,%esp
c0107cdc:	eb fe                	jmp    c0107cdc <wait_exit+0xfc>

c0107cde <INIT_fork>:
c0107cde:	55                   	push   %ebp
c0107cdf:	89 e5                	mov    %esp,%ebp
c0107ce1:	83 ec 78             	sub    $0x78,%esp
c0107ce4:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0107ceb:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0107cf2:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0107cf8:	83 ec 08             	sub    $0x8,%esp
c0107cfb:	6a 02                	push   $0x2
c0107cfd:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107d00:	50                   	push   %eax
c0107d01:	e8 36 cd ff ff       	call   c0104a3c <open>
c0107d06:	83 c4 10             	add    $0x10,%esp
c0107d09:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0107d0c:	83 ec 08             	sub    $0x8,%esp
c0107d0f:	6a 02                	push   $0x2
c0107d11:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107d14:	50                   	push   %eax
c0107d15:	e8 22 cd ff ff       	call   c0104a3c <open>
c0107d1a:	83 c4 10             	add    $0x10,%esp
c0107d1d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107d20:	c7 45 b6 49 4e 49 54 	movl   $0x54494e49,-0x4a(%ebp)
c0107d27:	c7 45 ba 20 69 73 20 	movl   $0x20736920,-0x46(%ebp)
c0107d2e:	c7 45 be 72 75 6e 6e 	movl   $0x6e6e7572,-0x42(%ebp)
c0107d35:	c7 45 c2 69 6e 67 0a 	movl   $0xa676e69,-0x3e(%ebp)
c0107d3c:	c7 45 c6 00 00 00 00 	movl   $0x0,-0x3a(%ebp)
c0107d43:	c7 45 ca 00 00 00 00 	movl   $0x0,-0x36(%ebp)
c0107d4a:	c7 45 ce 00 00 00 00 	movl   $0x0,-0x32(%ebp)
c0107d51:	c7 45 d2 00 00 00 00 	movl   $0x0,-0x2e(%ebp)
c0107d58:	c7 45 d6 00 00 00 00 	movl   $0x0,-0x2a(%ebp)
c0107d5f:	c7 45 da 00 00 00 00 	movl   $0x0,-0x26(%ebp)
c0107d66:	83 ec 0c             	sub    $0xc,%esp
c0107d69:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107d6c:	50                   	push   %eax
c0107d6d:	e8 ee 06 00 00       	call   c0108460 <Printf>
c0107d72:	83 c4 10             	add    $0x10,%esp
c0107d75:	83 ec 0c             	sub    $0xc,%esp
c0107d78:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107d7b:	50                   	push   %eax
c0107d7c:	e8 2f 38 00 00       	call   c010b5b0 <Strlen>
c0107d81:	83 c4 10             	add    $0x10,%esp
c0107d84:	83 ec 04             	sub    $0x4,%esp
c0107d87:	50                   	push   %eax
c0107d88:	6a 00                	push   $0x0
c0107d8a:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107d8d:	50                   	push   %eax
c0107d8e:	e8 e4 37 00 00       	call   c010b577 <Memset>
c0107d93:	83 c4 10             	add    $0x10,%esp
c0107d96:	83 ec 04             	sub    $0x4,%esp
c0107d99:	6a 28                	push   $0x28
c0107d9b:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107d9e:	50                   	push   %eax
c0107d9f:	ff 75 f0             	pushl  -0x10(%ebp)
c0107da2:	e8 2a cd ff ff       	call   c0104ad1 <read>
c0107da7:	83 c4 10             	add    $0x10,%esp
c0107daa:	83 ec 0c             	sub    $0xc,%esp
c0107dad:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107db0:	50                   	push   %eax
c0107db1:	e8 aa 06 00 00       	call   c0108460 <Printf>
c0107db6:	83 c4 10             	add    $0x10,%esp
c0107db9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0107dc0:	e8 d7 cf ff ff       	call   c0104d9c <fork>
c0107dc5:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0107dc8:	83 ec 0c             	sub    $0xc,%esp
c0107dcb:	6a 01                	push   $0x1
c0107dcd:	e8 5a 05 00 00       	call   c010832c <delay>
c0107dd2:	83 c4 10             	add    $0x10,%esp
c0107dd5:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0107dd9:	0f 8e cd 00 00 00    	jle    c0107eac <INIT_fork+0x1ce>
c0107ddf:	83 ec 08             	sub    $0x8,%esp
c0107de2:	ff 75 e8             	pushl  -0x18(%ebp)
c0107de5:	68 51 b0 10 c0       	push   $0xc010b051
c0107dea:	e8 71 06 00 00       	call   c0108460 <Printf>
c0107def:	83 c4 10             	add    $0x10,%esp
c0107df2:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0107df6:	c7 45 8e 50 61 72 65 	movl   $0x65726150,-0x72(%ebp)
c0107dfd:	c7 45 92 6e 74 2e 4e 	movl   $0x4e2e746e,-0x6e(%ebp)
c0107e04:	c7 45 96 69 63 65 20 	movl   $0x20656369,-0x6a(%ebp)
c0107e0b:	c7 45 9a 74 6f 20 6d 	movl   $0x6d206f74,-0x66(%ebp)
c0107e12:	c7 45 9e 65 65 74 20 	movl   $0x20746565,-0x62(%ebp)
c0107e19:	c7 45 a2 79 6f 75 21 	movl   $0x21756f79,-0x5e(%ebp)
c0107e20:	c7 45 a6 0a 00 00 00 	movl   $0xa,-0x5a(%ebp)
c0107e27:	c7 45 aa 00 00 00 00 	movl   $0x0,-0x56(%ebp)
c0107e2e:	c7 45 ae 00 00 00 00 	movl   $0x0,-0x52(%ebp)
c0107e35:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)
c0107e3c:	83 ec 0c             	sub    $0xc,%esp
c0107e3f:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107e42:	50                   	push   %eax
c0107e43:	e8 68 37 00 00       	call   c010b5b0 <Strlen>
c0107e48:	83 c4 10             	add    $0x10,%esp
c0107e4b:	83 ec 04             	sub    $0x4,%esp
c0107e4e:	50                   	push   %eax
c0107e4f:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107e52:	50                   	push   %eax
c0107e53:	ff 75 f4             	pushl  -0xc(%ebp)
c0107e56:	e8 f7 cd ff ff       	call   c0104c52 <write>
c0107e5b:	83 c4 10             	add    $0x10,%esp
c0107e5e:	e8 bc ec ff ff       	call   c0106b1f <catch_error>
c0107e63:	83 ec 0c             	sub    $0xc,%esp
c0107e66:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107e69:	50                   	push   %eax
c0107e6a:	e8 41 37 00 00       	call   c010b5b0 <Strlen>
c0107e6f:	83 c4 10             	add    $0x10,%esp
c0107e72:	83 ec 04             	sub    $0x4,%esp
c0107e75:	50                   	push   %eax
c0107e76:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107e79:	50                   	push   %eax
c0107e7a:	ff 75 f4             	pushl  -0xc(%ebp)
c0107e7d:	e8 d0 cd ff ff       	call   c0104c52 <write>
c0107e82:	83 c4 10             	add    $0x10,%esp
c0107e85:	83 ec 0c             	sub    $0xc,%esp
c0107e88:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107e8b:	50                   	push   %eax
c0107e8c:	e8 1f 37 00 00       	call   c010b5b0 <Strlen>
c0107e91:	83 c4 10             	add    $0x10,%esp
c0107e94:	83 ec 04             	sub    $0x4,%esp
c0107e97:	50                   	push   %eax
c0107e98:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107e9b:	50                   	push   %eax
c0107e9c:	ff 75 f4             	pushl  -0xc(%ebp)
c0107e9f:	e8 ae cd ff ff       	call   c0104c52 <write>
c0107ea4:	83 c4 10             	add    $0x10,%esp
c0107ea7:	e9 d6 00 00 00       	jmp    c0107f82 <INIT_fork+0x2a4>
c0107eac:	83 ec 08             	sub    $0x8,%esp
c0107eaf:	ff 75 e8             	pushl  -0x18(%ebp)
c0107eb2:	68 51 b0 10 c0       	push   $0xc010b051
c0107eb7:	e8 a4 05 00 00       	call   c0108460 <Printf>
c0107ebc:	83 c4 10             	add    $0x10,%esp
c0107ebf:	83 ec 0c             	sub    $0xc,%esp
c0107ec2:	6a 01                	push   $0x1
c0107ec4:	e8 63 04 00 00       	call   c010832c <delay>
c0107ec9:	83 c4 10             	add    $0x10,%esp
c0107ecc:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0107ed0:	83 45 ec 02          	addl   $0x2,-0x14(%ebp)
c0107ed4:	c7 45 8e 43 68 69 6c 	movl   $0x6c696843,-0x72(%ebp)
c0107edb:	c7 45 92 64 2e 53 65 	movl   $0x65532e64,-0x6e(%ebp)
c0107ee2:	c7 45 96 65 20 79 6f 	movl   $0x6f792065,-0x6a(%ebp)
c0107ee9:	c7 45 9a 75 20 61 67 	movl   $0x67612075,-0x66(%ebp)
c0107ef0:	c7 45 9e 61 69 6e 0a 	movl   $0xa6e6961,-0x62(%ebp)
c0107ef7:	c7 45 a2 00 00 00 00 	movl   $0x0,-0x5e(%ebp)
c0107efe:	c7 45 a6 00 00 00 00 	movl   $0x0,-0x5a(%ebp)
c0107f05:	c7 45 aa 00 00 00 00 	movl   $0x0,-0x56(%ebp)
c0107f0c:	c7 45 ae 00 00 00 00 	movl   $0x0,-0x52(%ebp)
c0107f13:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)
c0107f1a:	83 ec 0c             	sub    $0xc,%esp
c0107f1d:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107f20:	50                   	push   %eax
c0107f21:	e8 8a 36 00 00       	call   c010b5b0 <Strlen>
c0107f26:	83 c4 10             	add    $0x10,%esp
c0107f29:	83 ec 04             	sub    $0x4,%esp
c0107f2c:	50                   	push   %eax
c0107f2d:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107f30:	50                   	push   %eax
c0107f31:	ff 75 f4             	pushl  -0xc(%ebp)
c0107f34:	e8 19 cd ff ff       	call   c0104c52 <write>
c0107f39:	83 c4 10             	add    $0x10,%esp
c0107f3c:	83 ec 0c             	sub    $0xc,%esp
c0107f3f:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107f42:	50                   	push   %eax
c0107f43:	e8 68 36 00 00       	call   c010b5b0 <Strlen>
c0107f48:	83 c4 10             	add    $0x10,%esp
c0107f4b:	83 ec 04             	sub    $0x4,%esp
c0107f4e:	50                   	push   %eax
c0107f4f:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107f52:	50                   	push   %eax
c0107f53:	ff 75 f4             	pushl  -0xc(%ebp)
c0107f56:	e8 f7 cc ff ff       	call   c0104c52 <write>
c0107f5b:	83 c4 10             	add    $0x10,%esp
c0107f5e:	83 ec 0c             	sub    $0xc,%esp
c0107f61:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107f64:	50                   	push   %eax
c0107f65:	e8 46 36 00 00       	call   c010b5b0 <Strlen>
c0107f6a:	83 c4 10             	add    $0x10,%esp
c0107f6d:	83 ec 04             	sub    $0x4,%esp
c0107f70:	50                   	push   %eax
c0107f71:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107f74:	50                   	push   %eax
c0107f75:	ff 75 f4             	pushl  -0xc(%ebp)
c0107f78:	e8 d5 cc ff ff       	call   c0104c52 <write>
c0107f7d:	83 c4 10             	add    $0x10,%esp
c0107f80:	eb fe                	jmp    c0107f80 <INIT_fork+0x2a2>
c0107f82:	83 ec 04             	sub    $0x4,%esp
c0107f85:	6a 28                	push   $0x28
c0107f87:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107f8a:	50                   	push   %eax
c0107f8b:	ff 75 f0             	pushl  -0x10(%ebp)
c0107f8e:	e8 3e cb ff ff       	call   c0104ad1 <read>
c0107f93:	83 c4 10             	add    $0x10,%esp
c0107f96:	83 ec 0c             	sub    $0xc,%esp
c0107f99:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107f9c:	50                   	push   %eax
c0107f9d:	e8 be 04 00 00       	call   c0108460 <Printf>
c0107fa2:	83 c4 10             	add    $0x10,%esp
c0107fa5:	83 ec 0c             	sub    $0xc,%esp
c0107fa8:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107fab:	50                   	push   %eax
c0107fac:	e8 af 04 00 00       	call   c0108460 <Printf>
c0107fb1:	83 c4 10             	add    $0x10,%esp
c0107fb4:	83 ec 0c             	sub    $0xc,%esp
c0107fb7:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107fba:	50                   	push   %eax
c0107fbb:	e8 a0 04 00 00       	call   c0108460 <Printf>
c0107fc0:	83 c4 10             	add    $0x10,%esp
c0107fc3:	83 ec 0c             	sub    $0xc,%esp
c0107fc6:	68 5b b0 10 c0       	push   $0xc010b05b
c0107fcb:	e8 a9 07 00 00       	call   c0108779 <spin>
c0107fd0:	83 c4 10             	add    $0x10,%esp
c0107fd3:	90                   	nop
c0107fd4:	c9                   	leave  
c0107fd5:	c3                   	ret    

c0107fd6 <simple_shell>:
c0107fd6:	55                   	push   %ebp
c0107fd7:	89 e5                	mov    %esp,%ebp
c0107fd9:	57                   	push   %edi
c0107fda:	83 ec 64             	sub    $0x64,%esp
c0107fdd:	c7 45 d2 64 65 76 5f 	movl   $0x5f766564,-0x2e(%ebp)
c0107fe4:	c7 45 d6 74 74 79 31 	movl   $0x31797474,-0x2a(%ebp)
c0107feb:	66 c7 45 da 00 00    	movw   $0x0,-0x26(%ebp)
c0107ff1:	83 ec 08             	sub    $0x8,%esp
c0107ff4:	6a 02                	push   $0x2
c0107ff6:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c0107ff9:	50                   	push   %eax
c0107ffa:	e8 3d ca ff ff       	call   c0104a3c <open>
c0107fff:	83 c4 10             	add    $0x10,%esp
c0108002:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108005:	83 ec 08             	sub    $0x8,%esp
c0108008:	6a 02                	push   $0x2
c010800a:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c010800d:	50                   	push   %eax
c010800e:	e8 29 ca ff ff       	call   c0104a3c <open>
c0108013:	83 c4 10             	add    $0x10,%esp
c0108016:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108019:	8d 55 a8             	lea    -0x58(%ebp),%edx
c010801c:	b8 00 00 00 00       	mov    $0x0,%eax
c0108021:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0108026:	89 d7                	mov    %edx,%edi
c0108028:	f3 ab                	rep stos %eax,%es:(%edi)
c010802a:	c7 45 a8 63 b0 10 c0 	movl   $0xc010b063,-0x58(%ebp)
c0108031:	c7 45 ac 68 b0 10 c0 	movl   $0xc010b068,-0x54(%ebp)
c0108038:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010803f:	66 87 db             	xchg   %bx,%bx
c0108042:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
c0108049:	c7 45 e8 02 00 00 00 	movl   $0x2,-0x18(%ebp)
c0108050:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108053:	c7 44 85 a8 00 00 00 	movl   $0x0,-0x58(%ebp,%eax,4)
c010805a:	00 
c010805b:	8b 45 a8             	mov    -0x58(%ebp),%eax
c010805e:	85 c0                	test   %eax,%eax
c0108060:	75 1c                	jne    c010807e <simple_shell+0xa8>
c0108062:	68 0e 03 00 00       	push   $0x30e
c0108067:	68 41 ae 10 c0       	push   $0xc010ae41
c010806c:	68 41 ae 10 c0       	push   $0xc010ae41
c0108071:	68 6e b0 10 c0       	push   $0xc010b06e
c0108076:	e8 42 07 00 00       	call   c01087bd <assertion_failure>
c010807b:	83 c4 10             	add    $0x10,%esp
c010807e:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0108081:	83 ec 08             	sub    $0x8,%esp
c0108084:	6a 02                	push   $0x2
c0108086:	50                   	push   %eax
c0108087:	e8 b0 c9 ff ff       	call   c0104a3c <open>
c010808c:	83 c4 10             	add    $0x10,%esp
c010808f:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0108092:	66 87 db             	xchg   %bx,%bx
c0108095:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
c0108099:	75 4e                	jne    c01080e9 <simple_shell+0x113>
c010809b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01080a2:	eb 26                	jmp    c01080ca <simple_shell+0xf4>
c01080a4:	8b 55 a8             	mov    -0x58(%ebp),%edx
c01080a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01080aa:	01 d0                	add    %edx,%eax
c01080ac:	0f b6 00             	movzbl (%eax),%eax
c01080af:	0f be c0             	movsbl %al,%eax
c01080b2:	83 ec 04             	sub    $0x4,%esp
c01080b5:	50                   	push   %eax
c01080b6:	ff 75 f4             	pushl  -0xc(%ebp)
c01080b9:	68 7d b0 10 c0       	push   $0xc010b07d
c01080be:	e8 9d 03 00 00       	call   c0108460 <Printf>
c01080c3:	83 c4 10             	add    $0x10,%esp
c01080c6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01080ca:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
c01080ce:	7e d4                	jle    c01080a4 <simple_shell+0xce>
c01080d0:	8b 45 a8             	mov    -0x58(%ebp),%eax
c01080d3:	83 ec 08             	sub    $0x8,%esp
c01080d6:	50                   	push   %eax
c01080d7:	68 84 b0 10 c0       	push   $0xc010b084
c01080dc:	e8 7f 03 00 00       	call   c0108460 <Printf>
c01080e1:	83 c4 10             	add    $0x10,%esp
c01080e4:	e9 81 00 00 00       	jmp    c010816a <simple_shell+0x194>
c01080e9:	83 ec 0c             	sub    $0xc,%esp
c01080ec:	68 8a b0 10 c0       	push   $0xc010b08a
c01080f1:	e8 6a 03 00 00       	call   c0108460 <Printf>
c01080f6:	83 c4 10             	add    $0x10,%esp
c01080f9:	e8 9e cc ff ff       	call   c0104d9c <fork>
c01080fe:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0108101:	83 ec 0c             	sub    $0xc,%esp
c0108104:	68 9f b0 10 c0       	push   $0xc010b09f
c0108109:	e8 52 03 00 00       	call   c0108460 <Printf>
c010810e:	83 c4 10             	add    $0x10,%esp
c0108111:	66 87 db             	xchg   %bx,%bx
c0108114:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
c0108118:	7e 11                	jle    c010812b <simple_shell+0x155>
c010811a:	83 ec 0c             	sub    $0xc,%esp
c010811d:	8d 45 a4             	lea    -0x5c(%ebp),%eax
c0108120:	50                   	push   %eax
c0108121:	e8 03 cc ff ff       	call   c0104d29 <wait>
c0108126:	83 c4 10             	add    $0x10,%esp
c0108129:	eb 3f                	jmp    c010816a <simple_shell+0x194>
c010812b:	83 ec 0c             	sub    $0xc,%esp
c010812e:	68 b4 b0 10 c0       	push   $0xc010b0b4
c0108133:	e8 28 03 00 00       	call   c0108460 <Printf>
c0108138:	83 c4 10             	add    $0x10,%esp
c010813b:	83 ec 0c             	sub    $0xc,%esp
c010813e:	ff 75 e0             	pushl  -0x20(%ebp)
c0108141:	e8 91 cb ff ff       	call   c0104cd7 <close>
c0108146:	83 c4 10             	add    $0x10,%esp
c0108149:	66 87 db             	xchg   %bx,%bx
c010814c:	6a 00                	push   $0x0
c010814e:	68 68 b0 10 c0       	push   $0xc010b068
c0108153:	68 63 b0 10 c0       	push   $0xc010b063
c0108158:	68 d0 b0 10 c0       	push   $0xc010b0d0
c010815d:	e8 0d cf ff ff       	call   c010506f <execl>
c0108162:	83 c4 10             	add    $0x10,%esp
c0108165:	66 87 db             	xchg   %bx,%bx
c0108168:	eb fe                	jmp    c0108168 <simple_shell+0x192>
c010816a:	8b 7d fc             	mov    -0x4(%ebp),%edi
c010816d:	c9                   	leave  
c010816e:	c3                   	ret    

c010816f <test_shell>:
c010816f:	55                   	push   %ebp
c0108170:	89 e5                	mov    %esp,%ebp
c0108172:	83 ec 38             	sub    $0x38,%esp
c0108175:	c7 45 ea 64 65 76 5f 	movl   $0x5f766564,-0x16(%ebp)
c010817c:	c7 45 ee 74 74 79 31 	movl   $0x31797474,-0x12(%ebp)
c0108183:	66 c7 45 f2 00 00    	movw   $0x0,-0xe(%ebp)
c0108189:	83 ec 08             	sub    $0x8,%esp
c010818c:	6a 02                	push   $0x2
c010818e:	8d 45 ea             	lea    -0x16(%ebp),%eax
c0108191:	50                   	push   %eax
c0108192:	e8 a5 c8 ff ff       	call   c0104a3c <open>
c0108197:	83 c4 10             	add    $0x10,%esp
c010819a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010819d:	c7 45 d6 69 6e 73 74 	movl   $0x74736e69,-0x2a(%ebp)
c01081a4:	c7 45 da 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x26(%ebp)
c01081ab:	c7 45 de 74 61 72 00 	movl   $0x726174,-0x22(%ebp)
c01081b2:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c01081b9:	c7 45 e6 00 00 00 00 	movl   $0x0,-0x1a(%ebp)
c01081c0:	83 ec 0c             	sub    $0xc,%esp
c01081c3:	8d 45 d6             	lea    -0x2a(%ebp),%eax
c01081c6:	50                   	push   %eax
c01081c7:	e8 30 ea ff ff       	call   c0106bfc <untar>
c01081cc:	83 c4 10             	add    $0x10,%esp
c01081cf:	e8 02 fe ff ff       	call   c0107fd6 <simple_shell>
c01081d4:	90                   	nop
c01081d5:	c9                   	leave  
c01081d6:	c3                   	ret    

c01081d7 <test_exec>:
c01081d7:	55                   	push   %ebp
c01081d8:	89 e5                	mov    %esp,%ebp
c01081da:	83 ec 38             	sub    $0x38,%esp
c01081dd:	83 ec 0c             	sub    $0xc,%esp
c01081e0:	68 e0 a9 10 c0       	push   $0xc010a9e0
c01081e5:	e8 a2 7e ff ff       	call   c010008c <disp_str>
c01081ea:	83 c4 10             	add    $0x10,%esp
c01081ed:	83 ec 0c             	sub    $0xc,%esp
c01081f0:	68 e2 a9 10 c0       	push   $0xc010a9e2
c01081f5:	e8 92 7e ff ff       	call   c010008c <disp_str>
c01081fa:	83 c4 10             	add    $0x10,%esp
c01081fd:	c7 45 e6 64 65 76 5f 	movl   $0x5f766564,-0x1a(%ebp)
c0108204:	c7 45 ea 74 74 79 31 	movl   $0x31797474,-0x16(%ebp)
c010820b:	66 c7 45 ee 00 00    	movw   $0x0,-0x12(%ebp)
c0108211:	83 ec 08             	sub    $0x8,%esp
c0108214:	6a 02                	push   $0x2
c0108216:	8d 45 e6             	lea    -0x1a(%ebp),%eax
c0108219:	50                   	push   %eax
c010821a:	e8 1d c8 ff ff       	call   c0104a3c <open>
c010821f:	83 c4 10             	add    $0x10,%esp
c0108222:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108225:	c7 45 d2 69 6e 73 74 	movl   $0x74736e69,-0x2e(%ebp)
c010822c:	c7 45 d6 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x2a(%ebp)
c0108233:	c7 45 da 74 61 72 00 	movl   $0x726174,-0x26(%ebp)
c010823a:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
c0108241:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c0108248:	83 ec 0c             	sub    $0xc,%esp
c010824b:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c010824e:	50                   	push   %eax
c010824f:	e8 a8 e9 ff ff       	call   c0106bfc <untar>
c0108254:	83 c4 10             	add    $0x10,%esp
c0108257:	83 ec 08             	sub    $0x8,%esp
c010825a:	6a 00                	push   $0x0
c010825c:	68 d6 b0 10 c0       	push   $0xc010b0d6
c0108261:	68 da b0 10 c0       	push   $0xc010b0da
c0108266:	68 68 b0 10 c0       	push   $0xc010b068
c010826b:	68 63 b0 10 c0       	push   $0xc010b063
c0108270:	68 d0 b0 10 c0       	push   $0xc010b0d0
c0108275:	e8 f5 cd ff ff       	call   c010506f <execl>
c010827a:	83 c4 20             	add    $0x20,%esp
c010827d:	e8 59 e8 ff ff       	call   c0106adb <stop_here>
c0108282:	e8 15 cb ff ff       	call   c0104d9c <fork>
c0108287:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010828a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010828e:	7e 25                	jle    c01082b5 <test_exec+0xde>
c0108290:	83 ec 0c             	sub    $0xc,%esp
c0108293:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0108296:	50                   	push   %eax
c0108297:	e8 8d ca ff ff       	call   c0104d29 <wait>
c010829c:	83 c4 10             	add    $0x10,%esp
c010829f:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01082a2:	83 ec 08             	sub    $0x8,%esp
c01082a5:	50                   	push   %eax
c01082a6:	68 e0 b0 10 c0       	push   $0xc010b0e0
c01082ab:	e8 b0 01 00 00       	call   c0108460 <Printf>
c01082b0:	83 c4 10             	add    $0x10,%esp
c01082b3:	eb 33                	jmp    c01082e8 <test_exec+0x111>
c01082b5:	83 ec 0c             	sub    $0xc,%esp
c01082b8:	68 f2 b0 10 c0       	push   $0xc010b0f2
c01082bd:	e8 9e 01 00 00       	call   c0108460 <Printf>
c01082c2:	83 c4 10             	add    $0x10,%esp
c01082c5:	83 ec 0c             	sub    $0xc,%esp
c01082c8:	6a 00                	push   $0x0
c01082ca:	68 da b0 10 c0       	push   $0xc010b0da
c01082cf:	68 68 b0 10 c0       	push   $0xc010b068
c01082d4:	68 63 b0 10 c0       	push   $0xc010b063
c01082d9:	68 d0 b0 10 c0       	push   $0xc010b0d0
c01082de:	e8 8c cd ff ff       	call   c010506f <execl>
c01082e3:	83 c4 20             	add    $0x20,%esp
c01082e6:	eb fe                	jmp    c01082e6 <test_exec+0x10f>
c01082e8:	c9                   	leave  
c01082e9:	c3                   	ret    

c01082ea <INIT>:
c01082ea:	55                   	push   %ebp
c01082eb:	89 e5                	mov    %esp,%ebp
c01082ed:	83 ec 08             	sub    $0x8,%esp
c01082f0:	e8 7a fe ff ff       	call   c010816f <test_shell>
c01082f5:	eb fe                	jmp    c01082f5 <INIT+0xb>

c01082f7 <TestA>:
c01082f7:	55                   	push   %ebp
c01082f8:	89 e5                	mov    %esp,%ebp
c01082fa:	83 ec 08             	sub    $0x8,%esp
c01082fd:	83 ec 0c             	sub    $0xc,%esp
c0108300:	6a 05                	push   $0x5
c0108302:	e8 b0 ec ff ff       	call   c0106fb7 <disp_int>
c0108307:	83 c4 10             	add    $0x10,%esp
c010830a:	83 ec 0c             	sub    $0xc,%esp
c010830d:	68 f3 aa 10 c0       	push   $0xc010aaf3
c0108312:	e8 75 7d ff ff       	call   c010008c <disp_str>
c0108317:	83 c4 10             	add    $0x10,%esp
c010831a:	83 ec 0c             	sub    $0xc,%esp
c010831d:	68 00 b1 10 c0       	push   $0xc010b100
c0108322:	e8 65 7d ff ff       	call   c010008c <disp_str>
c0108327:	83 c4 10             	add    $0x10,%esp
c010832a:	eb fe                	jmp    c010832a <TestA+0x33>

c010832c <delay>:
c010832c:	55                   	push   %ebp
c010832d:	89 e5                	mov    %esp,%ebp
c010832f:	83 ec 10             	sub    $0x10,%esp
c0108332:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0108339:	eb 2a                	jmp    c0108365 <delay+0x39>
c010833b:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0108342:	eb 17                	jmp    c010835b <delay+0x2f>
c0108344:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010834b:	eb 04                	jmp    c0108351 <delay+0x25>
c010834d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0108351:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c0108355:	7e f6                	jle    c010834d <delay+0x21>
c0108357:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c010835b:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
c010835f:	7e e3                	jle    c0108344 <delay+0x18>
c0108361:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0108365:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0108368:	3b 45 08             	cmp    0x8(%ebp),%eax
c010836b:	7c ce                	jl     c010833b <delay+0xf>
c010836d:	90                   	nop
c010836e:	c9                   	leave  
c010836f:	c3                   	ret    

c0108370 <TestB>:
c0108370:	55                   	push   %ebp
c0108371:	89 e5                	mov    %esp,%ebp
c0108373:	83 ec 08             	sub    $0x8,%esp
c0108376:	83 ec 0c             	sub    $0xc,%esp
c0108379:	68 07 b1 10 c0       	push   $0xc010b107
c010837e:	e8 09 7d ff ff       	call   c010008c <disp_str>
c0108383:	83 c4 10             	add    $0x10,%esp
c0108386:	eb fe                	jmp    c0108386 <TestB+0x16>

c0108388 <TestC>:
c0108388:	55                   	push   %ebp
c0108389:	89 e5                	mov    %esp,%ebp
c010838b:	83 ec 18             	sub    $0x18,%esp
c010838e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108395:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c0108399:	77 1a                	ja     c01083b5 <TestC+0x2d>
c010839b:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
c01083a2:	83 ec 08             	sub    $0x8,%esp
c01083a5:	ff 75 f0             	pushl  -0x10(%ebp)
c01083a8:	68 0a b1 10 c0       	push   $0xc010b10a
c01083ad:	e8 ae 00 00 00       	call   c0108460 <Printf>
c01083b2:	83 c4 10             	add    $0x10,%esp
c01083b5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01083b9:	eb da                	jmp    c0108395 <TestC+0xd>

c01083bb <sys_get_ticks>:
c01083bb:	55                   	push   %ebp
c01083bc:	89 e5                	mov    %esp,%ebp
c01083be:	a1 e8 0e 11 c0       	mov    0xc0110ee8,%eax
c01083c3:	8b 15 ec 0e 11 c0    	mov    0xc0110eec,%edx
c01083c9:	5d                   	pop    %ebp
c01083ca:	c3                   	ret    

c01083cb <sys_write>:
c01083cb:	55                   	push   %ebp
c01083cc:	89 e5                	mov    %esp,%ebp
c01083ce:	83 ec 18             	sub    $0x18,%esp
c01083d1:	8b 45 10             	mov    0x10(%ebp),%eax
c01083d4:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c01083da:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c01083e0:	05 00 fe 10 c0       	add    $0xc010fe00,%eax
c01083e5:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01083e8:	8b 45 0c             	mov    0xc(%ebp),%eax
c01083eb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01083ee:	8b 45 08             	mov    0x8(%ebp),%eax
c01083f1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01083f4:	eb 20                	jmp    c0108416 <sys_write+0x4b>
c01083f6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01083f9:	0f b6 00             	movzbl (%eax),%eax
c01083fc:	0f b6 c0             	movzbl %al,%eax
c01083ff:	83 ec 08             	sub    $0x8,%esp
c0108402:	50                   	push   %eax
c0108403:	ff 75 ec             	pushl  -0x14(%ebp)
c0108406:	e8 a2 b9 ff ff       	call   c0103dad <out_char>
c010840b:	83 c4 10             	add    $0x10,%esp
c010840e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0108412:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
c0108416:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010841a:	7f da                	jg     c01083f6 <sys_write+0x2b>
c010841c:	90                   	nop
c010841d:	c9                   	leave  
c010841e:	c3                   	ret    

c010841f <milli_delay>:
c010841f:	55                   	push   %ebp
c0108420:	89 e5                	mov    %esp,%ebp
c0108422:	83 ec 18             	sub    $0x18,%esp
c0108425:	e8 8a 11 00 00       	call   c01095b4 <get_ticks_ipc>
c010842a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010842d:	90                   	nop
c010842e:	e8 81 11 00 00       	call   c01095b4 <get_ticks_ipc>
c0108433:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0108436:	89 c1                	mov    %eax,%ecx
c0108438:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
c010843d:	89 c8                	mov    %ecx,%eax
c010843f:	f7 ea                	imul   %edx
c0108441:	c1 fa 05             	sar    $0x5,%edx
c0108444:	89 c8                	mov    %ecx,%eax
c0108446:	c1 f8 1f             	sar    $0x1f,%eax
c0108449:	29 c2                	sub    %eax,%edx
c010844b:	89 d0                	mov    %edx,%eax
c010844d:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
c0108453:	39 45 08             	cmp    %eax,0x8(%ebp)
c0108456:	77 d6                	ja     c010842e <milli_delay+0xf>
c0108458:	90                   	nop
c0108459:	c9                   	leave  
c010845a:	c3                   	ret    

c010845b <TaskSys>:
c010845b:	55                   	push   %ebp
c010845c:	89 e5                	mov    %esp,%ebp
c010845e:	eb fe                	jmp    c010845e <TaskSys+0x3>

c0108460 <Printf>:
c0108460:	55                   	push   %ebp
c0108461:	89 e5                	mov    %esp,%ebp
c0108463:	81 ec 18 01 00 00    	sub    $0x118,%esp
c0108469:	83 ec 04             	sub    $0x4,%esp
c010846c:	68 00 01 00 00       	push   $0x100
c0108471:	6a 00                	push   $0x0
c0108473:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108479:	50                   	push   %eax
c010847a:	e8 f8 30 00 00       	call   c010b577 <Memset>
c010847f:	83 c4 10             	add    $0x10,%esp
c0108482:	8d 45 0c             	lea    0xc(%ebp),%eax
c0108485:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108488:	8b 45 08             	mov    0x8(%ebp),%eax
c010848b:	83 ec 04             	sub    $0x4,%esp
c010848e:	ff 75 f4             	pushl  -0xc(%ebp)
c0108491:	50                   	push   %eax
c0108492:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108498:	50                   	push   %eax
c0108499:	e8 20 00 00 00       	call   c01084be <vsprintf>
c010849e:	83 c4 10             	add    $0x10,%esp
c01084a1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01084a4:	83 ec 04             	sub    $0x4,%esp
c01084a7:	ff 75 f0             	pushl  -0x10(%ebp)
c01084aa:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c01084b0:	50                   	push   %eax
c01084b1:	6a 00                	push   $0x0
c01084b3:	e8 9a c7 ff ff       	call   c0104c52 <write>
c01084b8:	83 c4 10             	add    $0x10,%esp
c01084bb:	90                   	nop
c01084bc:	c9                   	leave  
c01084bd:	c3                   	ret    

c01084be <vsprintf>:
c01084be:	55                   	push   %ebp
c01084bf:	89 e5                	mov    %esp,%ebp
c01084c1:	81 ec 68 02 00 00    	sub    $0x268,%esp
c01084c7:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c01084cd:	89 85 e4 fd ff ff    	mov    %eax,-0x21c(%ebp)
c01084d3:	83 ec 04             	sub    $0x4,%esp
c01084d6:	6a 40                	push   $0x40
c01084d8:	6a 00                	push   $0x0
c01084da:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c01084e0:	50                   	push   %eax
c01084e1:	e8 91 30 00 00       	call   c010b577 <Memset>
c01084e6:	83 c4 10             	add    $0x10,%esp
c01084e9:	8b 45 10             	mov    0x10(%ebp),%eax
c01084ec:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01084ef:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01084f6:	8b 45 08             	mov    0x8(%ebp),%eax
c01084f9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01084fc:	e9 53 01 00 00       	jmp    c0108654 <vsprintf+0x196>
c0108501:	8b 45 0c             	mov    0xc(%ebp),%eax
c0108504:	0f b6 00             	movzbl (%eax),%eax
c0108507:	3c 25                	cmp    $0x25,%al
c0108509:	74 16                	je     c0108521 <vsprintf+0x63>
c010850b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010850e:	8d 50 01             	lea    0x1(%eax),%edx
c0108511:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0108514:	8b 55 0c             	mov    0xc(%ebp),%edx
c0108517:	0f b6 12             	movzbl (%edx),%edx
c010851a:	88 10                	mov    %dl,(%eax)
c010851c:	e9 2f 01 00 00       	jmp    c0108650 <vsprintf+0x192>
c0108521:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c0108525:	8b 45 0c             	mov    0xc(%ebp),%eax
c0108528:	0f b6 00             	movzbl (%eax),%eax
c010852b:	0f be c0             	movsbl %al,%eax
c010852e:	83 f8 64             	cmp    $0x64,%eax
c0108531:	74 26                	je     c0108559 <vsprintf+0x9b>
c0108533:	83 f8 64             	cmp    $0x64,%eax
c0108536:	7f 0e                	jg     c0108546 <vsprintf+0x88>
c0108538:	83 f8 63             	cmp    $0x63,%eax
c010853b:	0f 84 f2 00 00 00    	je     c0108633 <vsprintf+0x175>
c0108541:	e9 0a 01 00 00       	jmp    c0108650 <vsprintf+0x192>
c0108546:	83 f8 73             	cmp    $0x73,%eax
c0108549:	0f 84 b0 00 00 00    	je     c01085ff <vsprintf+0x141>
c010854f:	83 f8 78             	cmp    $0x78,%eax
c0108552:	74 5d                	je     c01085b1 <vsprintf+0xf3>
c0108554:	e9 f7 00 00 00       	jmp    c0108650 <vsprintf+0x192>
c0108559:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010855c:	8b 00                	mov    (%eax),%eax
c010855e:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0108561:	83 ec 04             	sub    $0x4,%esp
c0108564:	6a 0a                	push   $0xa
c0108566:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c010856c:	50                   	push   %eax
c010856d:	ff 75 e8             	pushl  -0x18(%ebp)
c0108570:	e8 96 10 00 00       	call   c010960b <itoa>
c0108575:	83 c4 10             	add    $0x10,%esp
c0108578:	83 ec 08             	sub    $0x8,%esp
c010857b:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0108581:	50                   	push   %eax
c0108582:	ff 75 f4             	pushl  -0xc(%ebp)
c0108585:	e8 0c 30 00 00       	call   c010b596 <Strcpy>
c010858a:	83 c4 10             	add    $0x10,%esp
c010858d:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0108591:	83 ec 0c             	sub    $0xc,%esp
c0108594:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c010859a:	50                   	push   %eax
c010859b:	e8 10 30 00 00       	call   c010b5b0 <Strlen>
c01085a0:	83 c4 10             	add    $0x10,%esp
c01085a3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01085a6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01085a9:	01 45 f4             	add    %eax,-0xc(%ebp)
c01085ac:	e9 9f 00 00 00       	jmp    c0108650 <vsprintf+0x192>
c01085b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01085b4:	8b 00                	mov    (%eax),%eax
c01085b6:	83 ec 08             	sub    $0x8,%esp
c01085b9:	50                   	push   %eax
c01085ba:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c01085c0:	50                   	push   %eax
c01085c1:	e8 4b e9 ff ff       	call   c0106f11 <atoi>
c01085c6:	83 c4 10             	add    $0x10,%esp
c01085c9:	83 ec 08             	sub    $0x8,%esp
c01085cc:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c01085d2:	50                   	push   %eax
c01085d3:	ff 75 f4             	pushl  -0xc(%ebp)
c01085d6:	e8 bb 2f 00 00       	call   c010b596 <Strcpy>
c01085db:	83 c4 10             	add    $0x10,%esp
c01085de:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c01085e2:	83 ec 0c             	sub    $0xc,%esp
c01085e5:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c01085eb:	50                   	push   %eax
c01085ec:	e8 bf 2f 00 00       	call   c010b5b0 <Strlen>
c01085f1:	83 c4 10             	add    $0x10,%esp
c01085f4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01085f7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01085fa:	01 45 f4             	add    %eax,-0xc(%ebp)
c01085fd:	eb 51                	jmp    c0108650 <vsprintf+0x192>
c01085ff:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108602:	8b 00                	mov    (%eax),%eax
c0108604:	83 ec 08             	sub    $0x8,%esp
c0108607:	50                   	push   %eax
c0108608:	ff 75 f4             	pushl  -0xc(%ebp)
c010860b:	e8 86 2f 00 00       	call   c010b596 <Strcpy>
c0108610:	83 c4 10             	add    $0x10,%esp
c0108613:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108616:	8b 00                	mov    (%eax),%eax
c0108618:	83 ec 0c             	sub    $0xc,%esp
c010861b:	50                   	push   %eax
c010861c:	e8 8f 2f 00 00       	call   c010b5b0 <Strlen>
c0108621:	83 c4 10             	add    $0x10,%esp
c0108624:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108627:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c010862b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010862e:	01 45 f4             	add    %eax,-0xc(%ebp)
c0108631:	eb 1d                	jmp    c0108650 <vsprintf+0x192>
c0108633:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108636:	0f b6 10             	movzbl (%eax),%edx
c0108639:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010863c:	88 10                	mov    %dl,(%eax)
c010863e:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0108642:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0108649:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010864c:	01 45 f4             	add    %eax,-0xc(%ebp)
c010864f:	90                   	nop
c0108650:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c0108654:	8b 45 0c             	mov    0xc(%ebp),%eax
c0108657:	0f b6 00             	movzbl (%eax),%eax
c010865a:	84 c0                	test   %al,%al
c010865c:	0f 85 9f fe ff ff    	jne    c0108501 <vsprintf+0x43>
c0108662:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108665:	2b 45 08             	sub    0x8(%ebp),%eax
c0108668:	c9                   	leave  
c0108669:	c3                   	ret    

c010866a <printx>:
c010866a:	55                   	push   %ebp
c010866b:	89 e5                	mov    %esp,%ebp
c010866d:	81 ec 18 01 00 00    	sub    $0x118,%esp
c0108673:	8d 45 0c             	lea    0xc(%ebp),%eax
c0108676:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108679:	8b 45 08             	mov    0x8(%ebp),%eax
c010867c:	83 ec 04             	sub    $0x4,%esp
c010867f:	ff 75 f4             	pushl  -0xc(%ebp)
c0108682:	50                   	push   %eax
c0108683:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108689:	50                   	push   %eax
c010868a:	e8 2f fe ff ff       	call   c01084be <vsprintf>
c010868f:	83 c4 10             	add    $0x10,%esp
c0108692:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108695:	83 ec 08             	sub    $0x8,%esp
c0108698:	ff 75 f0             	pushl  -0x10(%ebp)
c010869b:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c01086a1:	50                   	push   %eax
c01086a2:	e8 49 8e ff ff       	call   c01014f0 <write_debug>
c01086a7:	83 c4 10             	add    $0x10,%esp
c01086aa:	90                   	nop
c01086ab:	c9                   	leave  
c01086ac:	c3                   	ret    

c01086ad <sys_printx>:
c01086ad:	55                   	push   %ebp
c01086ae:	89 e5                	mov    %esp,%ebp
c01086b0:	83 ec 28             	sub    $0x28,%esp
c01086b3:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c01086b8:	85 c0                	test   %eax,%eax
c01086ba:	75 15                	jne    c01086d1 <sys_printx+0x24>
c01086bc:	8b 45 10             	mov    0x10(%ebp),%eax
c01086bf:	8b 80 80 02 00 00    	mov    0x280(%eax),%eax
c01086c5:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01086c8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01086cf:	eb 10                	jmp    c01086e1 <sys_printx+0x34>
c01086d1:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c01086d6:	85 c0                	test   %eax,%eax
c01086d8:	74 07                	je     c01086e1 <sys_printx+0x34>
c01086da:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01086e1:	8b 55 08             	mov    0x8(%ebp),%edx
c01086e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01086e7:	01 d0                	add    %edx,%eax
c01086e9:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01086ec:	8b 45 10             	mov    0x10(%ebp),%eax
c01086ef:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c01086f5:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c01086fb:	05 00 fe 10 c0       	add    $0xc010fe00,%eax
c0108700:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0108703:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108706:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108709:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010870c:	0f b6 00             	movzbl (%eax),%eax
c010870f:	88 45 e3             	mov    %al,-0x1d(%ebp)
c0108712:	eb 3a                	jmp    c010874e <sys_printx+0xa1>
c0108714:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108717:	0f b6 00             	movzbl (%eax),%eax
c010871a:	3c 3b                	cmp    $0x3b,%al
c010871c:	74 0a                	je     c0108728 <sys_printx+0x7b>
c010871e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108721:	0f b6 00             	movzbl (%eax),%eax
c0108724:	3c 3a                	cmp    $0x3a,%al
c0108726:	75 06                	jne    c010872e <sys_printx+0x81>
c0108728:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c010872c:	eb 20                	jmp    c010874e <sys_printx+0xa1>
c010872e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108731:	0f b6 00             	movzbl (%eax),%eax
c0108734:	0f b6 c0             	movzbl %al,%eax
c0108737:	83 ec 08             	sub    $0x8,%esp
c010873a:	50                   	push   %eax
c010873b:	ff 75 e4             	pushl  -0x1c(%ebp)
c010873e:	e8 6a b6 ff ff       	call   c0103dad <out_char>
c0108743:	83 c4 10             	add    $0x10,%esp
c0108746:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c010874a:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c010874e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0108752:	7f c0                	jg     c0108714 <sys_printx+0x67>
c0108754:	80 7d e3 3b          	cmpb   $0x3b,-0x1d(%ebp)
c0108758:	75 10                	jne    c010876a <sys_printx+0xbd>
c010875a:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c010875f:	85 c0                	test   %eax,%eax
c0108761:	74 13                	je     c0108776 <sys_printx+0xc9>
c0108763:	e8 5f 7b ff ff       	call   c01002c7 <disable_int>
c0108768:	eb 0c                	jmp    c0108776 <sys_printx+0xc9>
c010876a:	80 7d e3 3a          	cmpb   $0x3a,-0x1d(%ebp)
c010876e:	75 06                	jne    c0108776 <sys_printx+0xc9>
c0108770:	e8 52 7b ff ff       	call   c01002c7 <disable_int>
c0108775:	90                   	nop
c0108776:	90                   	nop
c0108777:	c9                   	leave  
c0108778:	c3                   	ret    

c0108779 <spin>:
c0108779:	55                   	push   %ebp
c010877a:	89 e5                	mov    %esp,%ebp
c010877c:	83 ec 08             	sub    $0x8,%esp
c010877f:	83 ec 0c             	sub    $0xc,%esp
c0108782:	ff 75 08             	pushl  0x8(%ebp)
c0108785:	e8 02 79 ff ff       	call   c010008c <disp_str>
c010878a:	83 c4 10             	add    $0x10,%esp
c010878d:	83 ec 0c             	sub    $0xc,%esp
c0108790:	68 f3 aa 10 c0       	push   $0xc010aaf3
c0108795:	e8 f2 78 ff ff       	call   c010008c <disp_str>
c010879a:	83 c4 10             	add    $0x10,%esp
c010879d:	eb fe                	jmp    c010879d <spin+0x24>

c010879f <panic>:
c010879f:	55                   	push   %ebp
c01087a0:	89 e5                	mov    %esp,%ebp
c01087a2:	83 ec 08             	sub    $0x8,%esp
c01087a5:	83 ec 04             	sub    $0x4,%esp
c01087a8:	ff 75 08             	pushl  0x8(%ebp)
c01087ab:	6a 3a                	push   $0x3a
c01087ad:	68 17 b1 10 c0       	push   $0xc010b117
c01087b2:	e8 b3 fe ff ff       	call   c010866a <printx>
c01087b7:	83 c4 10             	add    $0x10,%esp
c01087ba:	90                   	nop
c01087bb:	c9                   	leave  
c01087bc:	c3                   	ret    

c01087bd <assertion_failure>:
c01087bd:	55                   	push   %ebp
c01087be:	89 e5                	mov    %esp,%ebp
c01087c0:	83 ec 08             	sub    $0x8,%esp
c01087c3:	83 ec 08             	sub    $0x8,%esp
c01087c6:	ff 75 14             	pushl  0x14(%ebp)
c01087c9:	ff 75 10             	pushl  0x10(%ebp)
c01087cc:	ff 75 0c             	pushl  0xc(%ebp)
c01087cf:	ff 75 08             	pushl  0x8(%ebp)
c01087d2:	6a 3b                	push   $0x3b
c01087d4:	68 20 b1 10 c0       	push   $0xc010b120
c01087d9:	e8 8c fe ff ff       	call   c010866a <printx>
c01087de:	83 c4 20             	add    $0x20,%esp
c01087e1:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c01087e8:	00 00 00 
c01087eb:	83 ec 0c             	sub    $0xc,%esp
c01087ee:	68 e0 a9 10 c0       	push   $0xc010a9e0
c01087f3:	e8 94 78 ff ff       	call   c010008c <disp_str>
c01087f8:	83 c4 10             	add    $0x10,%esp
c01087fb:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0108800:	83 ec 0c             	sub    $0xc,%esp
c0108803:	50                   	push   %eax
c0108804:	e8 ae e7 ff ff       	call   c0106fb7 <disp_int>
c0108809:	83 c4 10             	add    $0x10,%esp
c010880c:	83 ec 0c             	sub    $0xc,%esp
c010880f:	68 e2 a9 10 c0       	push   $0xc010a9e2
c0108814:	e8 73 78 ff ff       	call   c010008c <disp_str>
c0108819:	83 c4 10             	add    $0x10,%esp
c010881c:	83 ec 0c             	sub    $0xc,%esp
c010881f:	68 53 b1 10 c0       	push   $0xc010b153
c0108824:	e8 50 ff ff ff       	call   c0108779 <spin>
c0108829:	83 c4 10             	add    $0x10,%esp
c010882c:	90                   	nop
c010882d:	c9                   	leave  
c010882e:	c3                   	ret    

c010882f <assertion_failure2>:
c010882f:	55                   	push   %ebp
c0108830:	89 e5                	mov    %esp,%ebp
c0108832:	83 ec 08             	sub    $0x8,%esp
c0108835:	83 ec 04             	sub    $0x4,%esp
c0108838:	ff 75 18             	pushl  0x18(%ebp)
c010883b:	ff 75 14             	pushl  0x14(%ebp)
c010883e:	ff 75 10             	pushl  0x10(%ebp)
c0108841:	ff 75 0c             	pushl  0xc(%ebp)
c0108844:	ff 75 08             	pushl  0x8(%ebp)
c0108847:	6a 3b                	push   $0x3b
c0108849:	68 60 b1 10 c0       	push   $0xc010b160
c010884e:	e8 17 fe ff ff       	call   c010866a <printx>
c0108853:	83 c4 20             	add    $0x20,%esp
c0108856:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c010885d:	00 00 00 
c0108860:	83 ec 0c             	sub    $0xc,%esp
c0108863:	68 e0 a9 10 c0       	push   $0xc010a9e0
c0108868:	e8 1f 78 ff ff       	call   c010008c <disp_str>
c010886d:	83 c4 10             	add    $0x10,%esp
c0108870:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0108875:	83 ec 0c             	sub    $0xc,%esp
c0108878:	50                   	push   %eax
c0108879:	e8 39 e7 ff ff       	call   c0106fb7 <disp_int>
c010887e:	83 c4 10             	add    $0x10,%esp
c0108881:	83 ec 0c             	sub    $0xc,%esp
c0108884:	68 e2 a9 10 c0       	push   $0xc010a9e2
c0108889:	e8 fe 77 ff ff       	call   c010008c <disp_str>
c010888e:	83 c4 10             	add    $0x10,%esp
c0108891:	83 ec 0c             	sub    $0xc,%esp
c0108894:	68 53 b1 10 c0       	push   $0xc010b153
c0108899:	e8 db fe ff ff       	call   c0108779 <spin>
c010889e:	83 c4 10             	add    $0x10,%esp
c01088a1:	90                   	nop
c01088a2:	c9                   	leave  
c01088a3:	c3                   	ret    

c01088a4 <dead_lock>:
c01088a4:	55                   	push   %ebp
c01088a5:	89 e5                	mov    %esp,%ebp
c01088a7:	b8 00 00 00 00       	mov    $0x0,%eax
c01088ac:	5d                   	pop    %ebp
c01088ad:	c3                   	ret    

c01088ae <sys_send_msg>:
c01088ae:	55                   	push   %ebp
c01088af:	89 e5                	mov    %esp,%ebp
c01088b1:	83 ec 58             	sub    $0x58,%esp
c01088b4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01088bb:	83 ec 0c             	sub    $0xc,%esp
c01088be:	ff 75 0c             	pushl  0xc(%ebp)
c01088c1:	e8 60 ae ff ff       	call   c0103726 <pid2proc>
c01088c6:	83 c4 10             	add    $0x10,%esp
c01088c9:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01088cc:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c01088d0:	74 2c                	je     c01088fe <sys_send_msg+0x50>
c01088d2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01088d5:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c01088db:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c01088e0:	74 1c                	je     c01088fe <sys_send_msg+0x50>
c01088e2:	68 59 05 00 00       	push   $0x559
c01088e7:	68 41 ae 10 c0       	push   $0xc010ae41
c01088ec:	68 41 ae 10 c0       	push   $0xc010ae41
c01088f1:	68 a0 b1 10 c0       	push   $0xc010b1a0
c01088f6:	e8 c2 fe ff ff       	call   c01087bd <assertion_failure>
c01088fb:	83 c4 10             	add    $0x10,%esp
c01088fe:	8b 45 10             	mov    0x10(%ebp),%eax
c0108901:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c0108907:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c010890c:	74 1c                	je     c010892a <sys_send_msg+0x7c>
c010890e:	68 5b 05 00 00       	push   $0x55b
c0108913:	68 41 ae 10 c0       	push   $0xc010ae41
c0108918:	68 41 ae 10 c0       	push   $0xc010ae41
c010891d:	68 c8 b1 10 c0       	push   $0xc010b1c8
c0108922:	e8 96 fe ff ff       	call   c01087bd <assertion_failure>
c0108927:	83 c4 10             	add    $0x10,%esp
c010892a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c010892e:	75 22                	jne    c0108952 <sys_send_msg+0xa4>
c0108930:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0108934:	75 1c                	jne    c0108952 <sys_send_msg+0xa4>
c0108936:	68 5e 05 00 00       	push   $0x55e
c010893b:	68 41 ae 10 c0       	push   $0xc010ae41
c0108940:	68 41 ae 10 c0       	push   $0xc010ae41
c0108945:	68 eb b1 10 c0       	push   $0xc010b1eb
c010894a:	e8 6e fe ff ff       	call   c01087bd <assertion_failure>
c010894f:	83 c4 10             	add    $0x10,%esp
c0108952:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108955:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010895c:	84 c0                	test   %al,%al
c010895e:	74 65                	je     c01089c5 <sys_send_msg+0x117>
c0108960:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108963:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c010896a:	3c 01                	cmp    $0x1,%al
c010896c:	74 57                	je     c01089c5 <sys_send_msg+0x117>
c010896e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108971:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108978:	3c 02                	cmp    $0x2,%al
c010897a:	74 49                	je     c01089c5 <sys_send_msg+0x117>
c010897c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010897f:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108986:	3c 03                	cmp    $0x3,%al
c0108988:	74 3b                	je     c01089c5 <sys_send_msg+0x117>
c010898a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010898d:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108994:	3c 04                	cmp    $0x4,%al
c0108996:	74 2d                	je     c01089c5 <sys_send_msg+0x117>
c0108998:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010899b:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01089a2:	0f be c0             	movsbl %al,%eax
c01089a5:	83 ec 0c             	sub    $0xc,%esp
c01089a8:	68 62 05 00 00       	push   $0x562
c01089ad:	68 41 ae 10 c0       	push   $0xc010ae41
c01089b2:	68 41 ae 10 c0       	push   $0xc010ae41
c01089b7:	50                   	push   %eax
c01089b8:	68 fc b1 10 c0       	push   $0xc010b1fc
c01089bd:	e8 6d fe ff ff       	call   c010882f <assertion_failure2>
c01089c2:	83 c4 20             	add    $0x20,%esp
c01089c5:	8b 45 10             	mov    0x10(%ebp),%eax
c01089c8:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01089cf:	84 c0                	test   %al,%al
c01089d1:	74 65                	je     c0108a38 <sys_send_msg+0x18a>
c01089d3:	8b 45 10             	mov    0x10(%ebp),%eax
c01089d6:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01089dd:	3c 01                	cmp    $0x1,%al
c01089df:	74 57                	je     c0108a38 <sys_send_msg+0x18a>
c01089e1:	8b 45 10             	mov    0x10(%ebp),%eax
c01089e4:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01089eb:	3c 02                	cmp    $0x2,%al
c01089ed:	74 49                	je     c0108a38 <sys_send_msg+0x18a>
c01089ef:	8b 45 10             	mov    0x10(%ebp),%eax
c01089f2:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01089f9:	3c 03                	cmp    $0x3,%al
c01089fb:	74 3b                	je     c0108a38 <sys_send_msg+0x18a>
c01089fd:	8b 45 10             	mov    0x10(%ebp),%eax
c0108a00:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108a07:	3c 04                	cmp    $0x4,%al
c0108a09:	74 2d                	je     c0108a38 <sys_send_msg+0x18a>
c0108a0b:	8b 45 10             	mov    0x10(%ebp),%eax
c0108a0e:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108a15:	0f be c0             	movsbl %al,%eax
c0108a18:	83 ec 0c             	sub    $0xc,%esp
c0108a1b:	68 65 05 00 00       	push   $0x565
c0108a20:	68 41 ae 10 c0       	push   $0xc010ae41
c0108a25:	68 41 ae 10 c0       	push   $0xc010ae41
c0108a2a:	50                   	push   %eax
c0108a2b:	68 98 b2 10 c0       	push   $0xc010b298
c0108a30:	e8 fa fd ff ff       	call   c010882f <assertion_failure2>
c0108a35:	83 c4 20             	add    $0x20,%esp
c0108a38:	83 ec 0c             	sub    $0xc,%esp
c0108a3b:	ff 75 10             	pushl  0x10(%ebp)
c0108a3e:	e8 69 ad ff ff       	call   c01037ac <proc2pid>
c0108a43:	83 c4 10             	add    $0x10,%esp
c0108a46:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0108a49:	c7 45 e0 7c 00 00 00 	movl   $0x7c,-0x20(%ebp)
c0108a50:	8b 45 08             	mov    0x8(%ebp),%eax
c0108a53:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0108a56:	83 ec 08             	sub    $0x8,%esp
c0108a59:	ff 75 e4             	pushl  -0x1c(%ebp)
c0108a5c:	ff 75 dc             	pushl  -0x24(%ebp)
c0108a5f:	e8 cb d3 ff ff       	call   c0105e2f <get_physical_address_proc>
c0108a64:	83 c4 10             	add    $0x10,%esp
c0108a67:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0108a6a:	83 ec 08             	sub    $0x8,%esp
c0108a6d:	ff 75 e0             	pushl  -0x20(%ebp)
c0108a70:	ff 75 d8             	pushl  -0x28(%ebp)
c0108a73:	e8 e4 d2 ff ff       	call   c0105d5c <alloc_virtual_memory>
c0108a78:	83 c4 10             	add    $0x10,%esp
c0108a7b:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0108a7e:	8b 45 10             	mov    0x10(%ebp),%eax
c0108a81:	8b 80 80 02 00 00    	mov    0x280(%eax),%eax
c0108a87:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0108a8a:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0108a91:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0108a94:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0108a97:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0108a9a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0108a9d:	89 10                	mov    %edx,(%eax)
c0108a9f:	83 ec 08             	sub    $0x8,%esp
c0108aa2:	ff 75 0c             	pushl  0xc(%ebp)
c0108aa5:	ff 75 e4             	pushl  -0x1c(%ebp)
c0108aa8:	e8 f7 fd ff ff       	call   c01088a4 <dead_lock>
c0108aad:	83 c4 10             	add    $0x10,%esp
c0108ab0:	83 f8 01             	cmp    $0x1,%eax
c0108ab3:	75 10                	jne    c0108ac5 <sys_send_msg+0x217>
c0108ab5:	83 ec 0c             	sub    $0xc,%esp
c0108ab8:	68 28 b3 10 c0       	push   $0xc010b328
c0108abd:	e8 dd fc ff ff       	call   c010879f <panic>
c0108ac2:	83 c4 10             	add    $0x10,%esp
c0108ac5:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108ac8:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108acf:	3c 02                	cmp    $0x2,%al
c0108ad1:	0f 85 ca 01 00 00    	jne    c0108ca1 <sys_send_msg+0x3f3>
c0108ad7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108ada:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0108ae0:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0108ae3:	74 12                	je     c0108af7 <sys_send_msg+0x249>
c0108ae5:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108ae8:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0108aee:	83 f8 12             	cmp    $0x12,%eax
c0108af1:	0f 85 aa 01 00 00    	jne    c0108ca1 <sys_send_msg+0x3f3>
c0108af7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108afa:	8b 80 80 02 00 00    	mov    0x280(%eax),%eax
c0108b00:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0108b03:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108b06:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0108b0c:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0108b0f:	83 ec 08             	sub    $0x8,%esp
c0108b12:	ff 75 0c             	pushl  0xc(%ebp)
c0108b15:	ff 75 c0             	pushl  -0x40(%ebp)
c0108b18:	e8 12 d3 ff ff       	call   c0105e2f <get_physical_address_proc>
c0108b1d:	83 c4 10             	add    $0x10,%esp
c0108b20:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0108b23:	83 ec 08             	sub    $0x8,%esp
c0108b26:	ff 75 e0             	pushl  -0x20(%ebp)
c0108b29:	ff 75 bc             	pushl  -0x44(%ebp)
c0108b2c:	e8 2b d2 ff ff       	call   c0105d5c <alloc_virtual_memory>
c0108b31:	83 c4 10             	add    $0x10,%esp
c0108b34:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0108b37:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0108b3a:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0108b3d:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0108b40:	83 ec 04             	sub    $0x4,%esp
c0108b43:	51                   	push   %ecx
c0108b44:	52                   	push   %edx
c0108b45:	50                   	push   %eax
c0108b46:	e8 7e e0 ff ff       	call   c0106bc9 <Memcpy>
c0108b4b:	83 c4 10             	add    $0x10,%esp
c0108b4e:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0108b53:	3d 41 05 00 00       	cmp    $0x541,%eax
c0108b58:	75 0a                	jne    c0108b64 <sys_send_msg+0x2b6>
c0108b5a:	c7 05 a0 f7 10 c0 04 	movl   $0x4,0xc010f7a0
c0108b61:	00 00 00 
c0108b64:	8b 45 10             	mov    0x10(%ebp),%eax
c0108b67:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c0108b6e:	00 00 00 
c0108b71:	8b 45 10             	mov    0x10(%ebp),%eax
c0108b74:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0108b7b:	8b 45 10             	mov    0x10(%ebp),%eax
c0108b7e:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c0108b85:	00 00 00 
c0108b88:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108b8b:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c0108b92:	00 00 00 
c0108b95:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108b98:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0108b9f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108ba2:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c0108ba9:	00 00 00 
c0108bac:	8b 45 10             	mov    0x10(%ebp),%eax
c0108baf:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c0108bb6:	00 00 00 
c0108bb9:	83 ec 0c             	sub    $0xc,%esp
c0108bbc:	ff 75 e8             	pushl  -0x18(%ebp)
c0108bbf:	e8 a0 09 00 00       	call   c0109564 <unblock>
c0108bc4:	83 c4 10             	add    $0x10,%esp
c0108bc7:	8b 45 10             	mov    0x10(%ebp),%eax
c0108bca:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108bd1:	84 c0                	test   %al,%al
c0108bd3:	74 1c                	je     c0108bf1 <sys_send_msg+0x343>
c0108bd5:	68 9d 05 00 00       	push   $0x59d
c0108bda:	68 41 ae 10 c0       	push   $0xc010ae41
c0108bdf:	68 41 ae 10 c0       	push   $0xc010ae41
c0108be4:	68 33 b3 10 c0       	push   $0xc010b333
c0108be9:	e8 cf fb ff ff       	call   c01087bd <assertion_failure>
c0108bee:	83 c4 10             	add    $0x10,%esp
c0108bf1:	8b 45 10             	mov    0x10(%ebp),%eax
c0108bf4:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c0108bfa:	83 f8 21             	cmp    $0x21,%eax
c0108bfd:	74 1c                	je     c0108c1b <sys_send_msg+0x36d>
c0108bff:	68 9e 05 00 00       	push   $0x59e
c0108c04:	68 41 ae 10 c0       	push   $0xc010ae41
c0108c09:	68 41 ae 10 c0       	push   $0xc010ae41
c0108c0e:	68 47 b3 10 c0       	push   $0xc010b347
c0108c13:	e8 a5 fb ff ff       	call   c01087bd <assertion_failure>
c0108c18:	83 c4 10             	add    $0x10,%esp
c0108c1b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108c1e:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0108c24:	85 c0                	test   %eax,%eax
c0108c26:	74 1c                	je     c0108c44 <sys_send_msg+0x396>
c0108c28:	68 a0 05 00 00       	push   $0x5a0
c0108c2d:	68 41 ae 10 c0       	push   $0xc010ae41
c0108c32:	68 41 ae 10 c0       	push   $0xc010ae41
c0108c37:	68 64 b3 10 c0       	push   $0xc010b364
c0108c3c:	e8 7c fb ff ff       	call   c01087bd <assertion_failure>
c0108c41:	83 c4 10             	add    $0x10,%esp
c0108c44:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108c47:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108c4e:	84 c0                	test   %al,%al
c0108c50:	74 1c                	je     c0108c6e <sys_send_msg+0x3c0>
c0108c52:	68 a1 05 00 00       	push   $0x5a1
c0108c57:	68 41 ae 10 c0       	push   $0xc010ae41
c0108c5c:	68 41 ae 10 c0       	push   $0xc010ae41
c0108c61:	68 79 b3 10 c0       	push   $0xc010b379
c0108c66:	e8 52 fb ff ff       	call   c01087bd <assertion_failure>
c0108c6b:	83 c4 10             	add    $0x10,%esp
c0108c6e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108c71:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0108c77:	83 f8 21             	cmp    $0x21,%eax
c0108c7a:	0f 84 45 01 00 00    	je     c0108dc5 <sys_send_msg+0x517>
c0108c80:	68 a2 05 00 00       	push   $0x5a2
c0108c85:	68 41 ae 10 c0       	push   $0xc010ae41
c0108c8a:	68 41 ae 10 c0       	push   $0xc010ae41
c0108c8f:	68 90 b3 10 c0       	push   $0xc010b390
c0108c94:	e8 24 fb ff ff       	call   c01087bd <assertion_failure>
c0108c99:	83 c4 10             	add    $0x10,%esp
c0108c9c:	e9 24 01 00 00       	jmp    c0108dc5 <sys_send_msg+0x517>
c0108ca1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108ca8:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108cab:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0108cae:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108cb1:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0108cb7:	85 c0                	test   %eax,%eax
c0108cb9:	75 1b                	jne    c0108cd6 <sys_send_msg+0x428>
c0108cbb:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108cbe:	8b 55 10             	mov    0x10(%ebp),%edx
c0108cc1:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c0108cc7:	8b 45 10             	mov    0x10(%ebp),%eax
c0108cca:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c0108cd1:	00 00 00 
c0108cd4:	eb 3f                	jmp    c0108d15 <sys_send_msg+0x467>
c0108cd6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108cd9:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0108cdf:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108ce2:	eb 12                	jmp    c0108cf6 <sys_send_msg+0x448>
c0108ce4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108ce7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108cea:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108ced:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0108cf3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108cf6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0108cfa:	75 e8                	jne    c0108ce4 <sys_send_msg+0x436>
c0108cfc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108cff:	8b 55 10             	mov    0x10(%ebp),%edx
c0108d02:	89 90 50 02 00 00    	mov    %edx,0x250(%eax)
c0108d08:	8b 45 10             	mov    0x10(%ebp),%eax
c0108d0b:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c0108d12:	00 00 00 
c0108d15:	8b 45 10             	mov    0x10(%ebp),%eax
c0108d18:	8b 55 08             	mov    0x8(%ebp),%edx
c0108d1b:	89 90 40 02 00 00    	mov    %edx,0x240(%eax)
c0108d21:	8b 45 10             	mov    0x10(%ebp),%eax
c0108d24:	8b 55 0c             	mov    0xc(%ebp),%edx
c0108d27:	89 90 44 02 00 00    	mov    %edx,0x244(%eax)
c0108d2d:	8b 45 10             	mov    0x10(%ebp),%eax
c0108d30:	c6 80 3c 02 00 00 01 	movb   $0x1,0x23c(%eax)
c0108d37:	8b 45 10             	mov    0x10(%ebp),%eax
c0108d3a:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108d41:	3c 01                	cmp    $0x1,%al
c0108d43:	74 1c                	je     c0108d61 <sys_send_msg+0x4b3>
c0108d45:	68 c4 05 00 00       	push   $0x5c4
c0108d4a:	68 41 ae 10 c0       	push   $0xc010ae41
c0108d4f:	68 41 ae 10 c0       	push   $0xc010ae41
c0108d54:	68 b4 b3 10 c0       	push   $0xc010b3b4
c0108d59:	e8 5f fa ff ff       	call   c01087bd <assertion_failure>
c0108d5e:	83 c4 10             	add    $0x10,%esp
c0108d61:	8b 45 10             	mov    0x10(%ebp),%eax
c0108d64:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c0108d6a:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0108d6d:	74 1c                	je     c0108d8b <sys_send_msg+0x4dd>
c0108d6f:	68 c5 05 00 00       	push   $0x5c5
c0108d74:	68 41 ae 10 c0       	push   $0xc010ae41
c0108d79:	68 41 ae 10 c0       	push   $0xc010ae41
c0108d7e:	68 d0 b3 10 c0       	push   $0xc010b3d0
c0108d83:	e8 35 fa ff ff       	call   c01087bd <assertion_failure>
c0108d88:	83 c4 10             	add    $0x10,%esp
c0108d8b:	8b 45 10             	mov    0x10(%ebp),%eax
c0108d8e:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0108d94:	39 45 08             	cmp    %eax,0x8(%ebp)
c0108d97:	74 1c                	je     c0108db5 <sys_send_msg+0x507>
c0108d99:	68 c6 05 00 00       	push   $0x5c6
c0108d9e:	68 41 ae 10 c0       	push   $0xc010ae41
c0108da3:	68 41 ae 10 c0       	push   $0xc010ae41
c0108da8:	68 f2 b3 10 c0       	push   $0xc010b3f2
c0108dad:	e8 0b fa ff ff       	call   c01087bd <assertion_failure>
c0108db2:	83 c4 10             	add    $0x10,%esp
c0108db5:	83 ec 0c             	sub    $0xc,%esp
c0108db8:	ff 75 10             	pushl  0x10(%ebp)
c0108dbb:	e8 68 07 00 00       	call   c0109528 <block>
c0108dc0:	83 c4 10             	add    $0x10,%esp
c0108dc3:	eb 01                	jmp    c0108dc6 <sys_send_msg+0x518>
c0108dc5:	90                   	nop
c0108dc6:	b8 00 00 00 00       	mov    $0x0,%eax
c0108dcb:	c9                   	leave  
c0108dcc:	c3                   	ret    

c0108dcd <sys_receive_msg>:
c0108dcd:	55                   	push   %ebp
c0108dce:	89 e5                	mov    %esp,%ebp
c0108dd0:	83 ec 58             	sub    $0x58,%esp
c0108dd3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108dda:	83 ec 0c             	sub    $0xc,%esp
c0108ddd:	ff 75 0c             	pushl  0xc(%ebp)
c0108de0:	e8 41 a9 ff ff       	call   c0103726 <pid2proc>
c0108de5:	83 c4 10             	add    $0x10,%esp
c0108de8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0108deb:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0108def:	74 2c                	je     c0108e1d <sys_receive_msg+0x50>
c0108df1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108df4:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c0108dfa:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0108dff:	74 1c                	je     c0108e1d <sys_receive_msg+0x50>
c0108e01:	68 da 05 00 00       	push   $0x5da
c0108e06:	68 41 ae 10 c0       	push   $0xc010ae41
c0108e0b:	68 41 ae 10 c0       	push   $0xc010ae41
c0108e10:	68 c8 b1 10 c0       	push   $0xc010b1c8
c0108e15:	e8 a3 f9 ff ff       	call   c01087bd <assertion_failure>
c0108e1a:	83 c4 10             	add    $0x10,%esp
c0108e1d:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e20:	8b 80 b8 02 00 00    	mov    0x2b8(%eax),%eax
c0108e26:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0108e2b:	74 1c                	je     c0108e49 <sys_receive_msg+0x7c>
c0108e2d:	68 dc 05 00 00       	push   $0x5dc
c0108e32:	68 41 ae 10 c0       	push   $0xc010ae41
c0108e37:	68 41 ae 10 c0       	push   $0xc010ae41
c0108e3c:	68 a0 b1 10 c0       	push   $0xc010b1a0
c0108e41:	e8 77 f9 ff ff       	call   c01087bd <assertion_failure>
c0108e46:	83 c4 10             	add    $0x10,%esp
c0108e49:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e4c:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108e53:	84 c0                	test   %al,%al
c0108e55:	74 65                	je     c0108ebc <sys_receive_msg+0xef>
c0108e57:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e5a:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108e61:	3c 01                	cmp    $0x1,%al
c0108e63:	74 57                	je     c0108ebc <sys_receive_msg+0xef>
c0108e65:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e68:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108e6f:	3c 02                	cmp    $0x2,%al
c0108e71:	74 49                	je     c0108ebc <sys_receive_msg+0xef>
c0108e73:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e76:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108e7d:	3c 03                	cmp    $0x3,%al
c0108e7f:	74 3b                	je     c0108ebc <sys_receive_msg+0xef>
c0108e81:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e84:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108e8b:	3c 04                	cmp    $0x4,%al
c0108e8d:	74 2d                	je     c0108ebc <sys_receive_msg+0xef>
c0108e8f:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e92:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108e99:	0f be c0             	movsbl %al,%eax
c0108e9c:	83 ec 0c             	sub    $0xc,%esp
c0108e9f:	68 df 05 00 00       	push   $0x5df
c0108ea4:	68 41 ae 10 c0       	push   $0xc010ae41
c0108ea9:	68 41 ae 10 c0       	push   $0xc010ae41
c0108eae:	50                   	push   %eax
c0108eaf:	68 fc b1 10 c0       	push   $0xc010b1fc
c0108eb4:	e8 76 f9 ff ff       	call   c010882f <assertion_failure2>
c0108eb9:	83 c4 20             	add    $0x20,%esp
c0108ebc:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0108ec0:	74 73                	je     c0108f35 <sys_receive_msg+0x168>
c0108ec2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108ec5:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108ecc:	84 c0                	test   %al,%al
c0108ece:	74 65                	je     c0108f35 <sys_receive_msg+0x168>
c0108ed0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108ed3:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108eda:	3c 01                	cmp    $0x1,%al
c0108edc:	74 57                	je     c0108f35 <sys_receive_msg+0x168>
c0108ede:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108ee1:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108ee8:	3c 02                	cmp    $0x2,%al
c0108eea:	74 49                	je     c0108f35 <sys_receive_msg+0x168>
c0108eec:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108eef:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108ef6:	3c 03                	cmp    $0x3,%al
c0108ef8:	74 3b                	je     c0108f35 <sys_receive_msg+0x168>
c0108efa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108efd:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108f04:	3c 04                	cmp    $0x4,%al
c0108f06:	74 2d                	je     c0108f35 <sys_receive_msg+0x168>
c0108f08:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108f0b:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0108f12:	0f be c0             	movsbl %al,%eax
c0108f15:	83 ec 0c             	sub    $0xc,%esp
c0108f18:	68 e3 05 00 00       	push   $0x5e3
c0108f1d:	68 41 ae 10 c0       	push   $0xc010ae41
c0108f22:	68 41 ae 10 c0       	push   $0xc010ae41
c0108f27:	50                   	push   %eax
c0108f28:	68 98 b2 10 c0       	push   $0xc010b298
c0108f2d:	e8 fd f8 ff ff       	call   c010882f <assertion_failure2>
c0108f32:	83 c4 20             	add    $0x20,%esp
c0108f35:	83 ec 0c             	sub    $0xc,%esp
c0108f38:	ff 75 10             	pushl  0x10(%ebp)
c0108f3b:	e8 6c a8 ff ff       	call   c01037ac <proc2pid>
c0108f40:	83 c4 10             	add    $0x10,%esp
c0108f43:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0108f46:	c7 45 dc 7c 00 00 00 	movl   $0x7c,-0x24(%ebp)
c0108f4d:	8b 45 08             	mov    0x8(%ebp),%eax
c0108f50:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0108f53:	8b 45 10             	mov    0x10(%ebp),%eax
c0108f56:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c0108f5c:	83 ec 08             	sub    $0x8,%esp
c0108f5f:	50                   	push   %eax
c0108f60:	ff 75 d8             	pushl  -0x28(%ebp)
c0108f63:	e8 c7 ce ff ff       	call   c0105e2f <get_physical_address_proc>
c0108f68:	83 c4 10             	add    $0x10,%esp
c0108f6b:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0108f6e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0108f75:	8b 45 10             	mov    0x10(%ebp),%eax
c0108f78:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0108f7e:	85 c0                	test   %eax,%eax
c0108f80:	0f 84 c5 00 00 00    	je     c010904b <sys_receive_msg+0x27e>
c0108f86:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0108f8a:	74 0d                	je     c0108f99 <sys_receive_msg+0x1cc>
c0108f8c:	81 7d 0c 13 02 00 00 	cmpl   $0x213,0xc(%ebp)
c0108f93:	0f 85 b2 00 00 00    	jne    c010904b <sys_receive_msg+0x27e>
c0108f99:	c7 45 d0 7c 00 00 00 	movl   $0x7c,-0x30(%ebp)
c0108fa0:	83 ec 0c             	sub    $0xc,%esp
c0108fa3:	ff 75 d0             	pushl  -0x30(%ebp)
c0108fa6:	e8 81 85 ff ff       	call   c010152c <sys_malloc>
c0108fab:	83 c4 10             	add    $0x10,%esp
c0108fae:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0108fb1:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0108fb4:	83 ec 04             	sub    $0x4,%esp
c0108fb7:	50                   	push   %eax
c0108fb8:	6a 00                	push   $0x0
c0108fba:	ff 75 cc             	pushl  -0x34(%ebp)
c0108fbd:	e8 b5 25 00 00       	call   c010b577 <Memset>
c0108fc2:	83 c4 10             	add    $0x10,%esp
c0108fc5:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0108fc8:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c0108fce:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0108fd1:	c7 40 78 d5 07 00 00 	movl   $0x7d5,0x78(%eax)
c0108fd8:	83 ec 08             	sub    $0x8,%esp
c0108fdb:	ff 75 d0             	pushl  -0x30(%ebp)
c0108fde:	ff 75 d4             	pushl  -0x2c(%ebp)
c0108fe1:	e8 76 cd ff ff       	call   c0105d5c <alloc_virtual_memory>
c0108fe6:	83 c4 10             	add    $0x10,%esp
c0108fe9:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0108fec:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0108fef:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0108ff2:	83 ec 04             	sub    $0x4,%esp
c0108ff5:	52                   	push   %edx
c0108ff6:	ff 75 cc             	pushl  -0x34(%ebp)
c0108ff9:	50                   	push   %eax
c0108ffa:	e8 ca db ff ff       	call   c0106bc9 <Memcpy>
c0108fff:	83 c4 10             	add    $0x10,%esp
c0109002:	8b 45 10             	mov    0x10(%ebp),%eax
c0109005:	c7 80 54 02 00 00 00 	movl   $0x0,0x254(%eax)
c010900c:	00 00 00 
c010900f:	8b 45 10             	mov    0x10(%ebp),%eax
c0109012:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c0109019:	00 00 00 
c010901c:	8b 45 10             	mov    0x10(%ebp),%eax
c010901f:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c0109026:	00 00 00 
c0109029:	8b 45 10             	mov    0x10(%ebp),%eax
c010902c:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0109033:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c010903a:	83 ec 08             	sub    $0x8,%esp
c010903d:	ff 75 d0             	pushl  -0x30(%ebp)
c0109040:	ff 75 cc             	pushl  -0x34(%ebp)
c0109043:	e8 f9 84 ff ff       	call   c0101541 <sys_free>
c0109048:	83 c4 10             	add    $0x10,%esp
c010904b:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c010904f:	0f 84 d4 03 00 00    	je     c0109429 <sys_receive_msg+0x65c>
c0109055:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0109059:	75 26                	jne    c0109081 <sys_receive_msg+0x2b4>
c010905b:	8b 45 10             	mov    0x10(%ebp),%eax
c010905e:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0109064:	85 c0                	test   %eax,%eax
c0109066:	0f 84 8a 00 00 00    	je     c01090f6 <sys_receive_msg+0x329>
c010906c:	8b 45 10             	mov    0x10(%ebp),%eax
c010906f:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0109075:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109078:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c010907f:	eb 75                	jmp    c01090f6 <sys_receive_msg+0x329>
c0109081:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0109085:	78 6f                	js     c01090f6 <sys_receive_msg+0x329>
c0109087:	83 7d 0c 07          	cmpl   $0x7,0xc(%ebp)
c010908b:	7f 69                	jg     c01090f6 <sys_receive_msg+0x329>
c010908d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109090:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109097:	3c 01                	cmp    $0x1,%al
c0109099:	75 5b                	jne    c01090f6 <sys_receive_msg+0x329>
c010909b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010909e:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c01090a4:	83 f8 12             	cmp    $0x12,%eax
c01090a7:	74 0e                	je     c01090b7 <sys_receive_msg+0x2ea>
c01090a9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01090ac:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c01090b2:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c01090b5:	75 3f                	jne    c01090f6 <sys_receive_msg+0x329>
c01090b7:	8b 45 10             	mov    0x10(%ebp),%eax
c01090ba:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c01090c0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01090c3:	eb 2b                	jmp    c01090f0 <sys_receive_msg+0x323>
c01090c5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01090c8:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01090cb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01090ce:	8b 90 14 01 00 00    	mov    0x114(%eax),%edx
c01090d4:	8b 45 0c             	mov    0xc(%ebp),%eax
c01090d7:	39 c2                	cmp    %eax,%edx
c01090d9:	75 09                	jne    c01090e4 <sys_receive_msg+0x317>
c01090db:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c01090e2:	eb 12                	jmp    c01090f6 <sys_receive_msg+0x329>
c01090e4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01090e7:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c01090ed:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01090f0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c01090f4:	75 cf                	jne    c01090c5 <sys_receive_msg+0x2f8>
c01090f6:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c01090fa:	0f 85 4e 02 00 00    	jne    c010934e <sys_receive_msg+0x581>
c0109100:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109103:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0109106:	83 ec 08             	sub    $0x8,%esp
c0109109:	ff 75 dc             	pushl  -0x24(%ebp)
c010910c:	ff 75 d4             	pushl  -0x2c(%ebp)
c010910f:	e8 48 cc ff ff       	call   c0105d5c <alloc_virtual_memory>
c0109114:	83 c4 10             	add    $0x10,%esp
c0109117:	89 45 c0             	mov    %eax,-0x40(%ebp)
c010911a:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c010911d:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0109123:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0109126:	83 ec 0c             	sub    $0xc,%esp
c0109129:	ff 75 c4             	pushl  -0x3c(%ebp)
c010912c:	e8 7b a6 ff ff       	call   c01037ac <proc2pid>
c0109131:	83 c4 10             	add    $0x10,%esp
c0109134:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0109137:	83 ec 08             	sub    $0x8,%esp
c010913a:	ff 75 b8             	pushl  -0x48(%ebp)
c010913d:	ff 75 bc             	pushl  -0x44(%ebp)
c0109140:	e8 ea cc ff ff       	call   c0105e2f <get_physical_address_proc>
c0109145:	83 c4 10             	add    $0x10,%esp
c0109148:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c010914b:	83 ec 08             	sub    $0x8,%esp
c010914e:	ff 75 dc             	pushl  -0x24(%ebp)
c0109151:	ff 75 b4             	pushl  -0x4c(%ebp)
c0109154:	e8 03 cc ff ff       	call   c0105d5c <alloc_virtual_memory>
c0109159:	83 c4 10             	add    $0x10,%esp
c010915c:	89 45 b0             	mov    %eax,-0x50(%ebp)
c010915f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0109162:	83 ec 04             	sub    $0x4,%esp
c0109165:	50                   	push   %eax
c0109166:	ff 75 b0             	pushl  -0x50(%ebp)
c0109169:	ff 75 c0             	pushl  -0x40(%ebp)
c010916c:	e8 58 da ff ff       	call   c0106bc9 <Memcpy>
c0109171:	83 c4 10             	add    $0x10,%esp
c0109174:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0109177:	89 45 ac             	mov    %eax,-0x54(%ebp)
c010917a:	8b 45 10             	mov    0x10(%ebp),%eax
c010917d:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0109183:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0109186:	75 21                	jne    c01091a9 <sys_receive_msg+0x3dc>
c0109188:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010918b:	8b 90 50 02 00 00    	mov    0x250(%eax),%edx
c0109191:	8b 45 10             	mov    0x10(%ebp),%eax
c0109194:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c010919a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010919d:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c01091a4:	00 00 00 
c01091a7:	eb 1f                	jmp    c01091c8 <sys_receive_msg+0x3fb>
c01091a9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01091ac:	8b 90 50 02 00 00    	mov    0x250(%eax),%edx
c01091b2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01091b5:	89 90 50 02 00 00    	mov    %edx,0x250(%eax)
c01091bb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01091be:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c01091c5:	00 00 00 
c01091c8:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01091cb:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c01091d2:	00 00 00 
c01091d5:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01091d8:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c01091df:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c01091e2:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c01091e9:	00 00 00 
c01091ec:	8b 45 10             	mov    0x10(%ebp),%eax
c01091ef:	c7 80 40 02 00 00 00 	movl   $0x0,0x240(%eax)
c01091f6:	00 00 00 
c01091f9:	8b 45 10             	mov    0x10(%ebp),%eax
c01091fc:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c0109203:	00 00 00 
c0109206:	8b 45 10             	mov    0x10(%ebp),%eax
c0109209:	c7 80 44 02 00 00 21 	movl   $0x21,0x244(%eax)
c0109210:	00 00 00 
c0109213:	83 ec 0c             	sub    $0xc,%esp
c0109216:	ff 75 c4             	pushl  -0x3c(%ebp)
c0109219:	e8 46 03 00 00       	call   c0109564 <unblock>
c010921e:	83 c4 10             	add    $0x10,%esp
c0109221:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0109224:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c010922a:	85 c0                	test   %eax,%eax
c010922c:	74 1c                	je     c010924a <sys_receive_msg+0x47d>
c010922e:	68 53 06 00 00       	push   $0x653
c0109233:	68 41 ae 10 c0       	push   $0xc010ae41
c0109238:	68 41 ae 10 c0       	push   $0xc010ae41
c010923d:	68 07 b4 10 c0       	push   $0xc010b407
c0109242:	e8 76 f5 ff ff       	call   c01087bd <assertion_failure>
c0109247:	83 c4 10             	add    $0x10,%esp
c010924a:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c010924d:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109254:	84 c0                	test   %al,%al
c0109256:	74 1c                	je     c0109274 <sys_receive_msg+0x4a7>
c0109258:	68 54 06 00 00       	push   $0x654
c010925d:	68 41 ae 10 c0       	push   $0xc010ae41
c0109262:	68 41 ae 10 c0       	push   $0xc010ae41
c0109267:	68 1f b4 10 c0       	push   $0xc010b41f
c010926c:	e8 4c f5 ff ff       	call   c01087bd <assertion_failure>
c0109271:	83 c4 10             	add    $0x10,%esp
c0109274:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0109277:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c010927d:	83 f8 21             	cmp    $0x21,%eax
c0109280:	74 1c                	je     c010929e <sys_receive_msg+0x4d1>
c0109282:	68 55 06 00 00       	push   $0x655
c0109287:	68 41 ae 10 c0       	push   $0xc010ae41
c010928c:	68 41 ae 10 c0       	push   $0xc010ae41
c0109291:	68 38 b4 10 c0       	push   $0xc010b438
c0109296:	e8 22 f5 ff ff       	call   c01087bd <assertion_failure>
c010929b:	83 c4 10             	add    $0x10,%esp
c010929e:	8b 45 10             	mov    0x10(%ebp),%eax
c01092a1:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c01092a7:	85 c0                	test   %eax,%eax
c01092a9:	74 1c                	je     c01092c7 <sys_receive_msg+0x4fa>
c01092ab:	68 57 06 00 00       	push   $0x657
c01092b0:	68 41 ae 10 c0       	push   $0xc010ae41
c01092b5:	68 41 ae 10 c0       	push   $0xc010ae41
c01092ba:	68 64 b3 10 c0       	push   $0xc010b364
c01092bf:	e8 f9 f4 ff ff       	call   c01087bd <assertion_failure>
c01092c4:	83 c4 10             	add    $0x10,%esp
c01092c7:	8b 45 10             	mov    0x10(%ebp),%eax
c01092ca:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01092d1:	84 c0                	test   %al,%al
c01092d3:	74 1c                	je     c01092f1 <sys_receive_msg+0x524>
c01092d5:	68 58 06 00 00       	push   $0x658
c01092da:	68 41 ae 10 c0       	push   $0xc010ae41
c01092df:	68 41 ae 10 c0       	push   $0xc010ae41
c01092e4:	68 79 b3 10 c0       	push   $0xc010b379
c01092e9:	e8 cf f4 ff ff       	call   c01087bd <assertion_failure>
c01092ee:	83 c4 10             	add    $0x10,%esp
c01092f1:	8b 45 10             	mov    0x10(%ebp),%eax
c01092f4:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c01092fa:	83 f8 21             	cmp    $0x21,%eax
c01092fd:	74 1c                	je     c010931b <sys_receive_msg+0x54e>
c01092ff:	68 59 06 00 00       	push   $0x659
c0109304:	68 41 ae 10 c0       	push   $0xc010ae41
c0109309:	68 41 ae 10 c0       	push   $0xc010ae41
c010930e:	68 90 b3 10 c0       	push   $0xc010b390
c0109313:	e8 a5 f4 ff ff       	call   c01087bd <assertion_failure>
c0109318:	83 c4 10             	add    $0x10,%esp
c010931b:	8b 45 10             	mov    0x10(%ebp),%eax
c010931e:	8b 80 44 02 00 00    	mov    0x244(%eax),%eax
c0109324:	83 f8 21             	cmp    $0x21,%eax
c0109327:	0f 84 f5 00 00 00    	je     c0109422 <sys_receive_msg+0x655>
c010932d:	68 5a 06 00 00       	push   $0x65a
c0109332:	68 41 ae 10 c0       	push   $0xc010ae41
c0109337:	68 41 ae 10 c0       	push   $0xc010ae41
c010933c:	68 5c b4 10 c0       	push   $0xc010b45c
c0109341:	e8 77 f4 ff ff       	call   c01087bd <assertion_failure>
c0109346:	83 c4 10             	add    $0x10,%esp
c0109349:	e9 d4 00 00 00       	jmp    c0109422 <sys_receive_msg+0x655>
c010934e:	8b 45 10             	mov    0x10(%ebp),%eax
c0109351:	c6 80 3c 02 00 00 02 	movb   $0x2,0x23c(%eax)
c0109358:	8b 45 10             	mov    0x10(%ebp),%eax
c010935b:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109362:	3c 02                	cmp    $0x2,%al
c0109364:	74 1c                	je     c0109382 <sys_receive_msg+0x5b5>
c0109366:	68 5f 06 00 00       	push   $0x65f
c010936b:	68 41 ae 10 c0       	push   $0xc010ae41
c0109370:	68 41 ae 10 c0       	push   $0xc010ae41
c0109375:	68 7b b4 10 c0       	push   $0xc010b47b
c010937a:	e8 3e f4 ff ff       	call   c01087bd <assertion_failure>
c010937f:	83 c4 10             	add    $0x10,%esp
c0109382:	8b 45 10             	mov    0x10(%ebp),%eax
c0109385:	8b 55 08             	mov    0x8(%ebp),%edx
c0109388:	89 90 40 02 00 00    	mov    %edx,0x240(%eax)
c010938e:	8b 45 10             	mov    0x10(%ebp),%eax
c0109391:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109398:	3c 02                	cmp    $0x2,%al
c010939a:	74 1c                	je     c01093b8 <sys_receive_msg+0x5eb>
c010939c:	68 61 06 00 00       	push   $0x661
c01093a1:	68 41 ae 10 c0       	push   $0xc010ae41
c01093a6:	68 41 ae 10 c0       	push   $0xc010ae41
c01093ab:	68 7b b4 10 c0       	push   $0xc010b47b
c01093b0:	e8 08 f4 ff ff       	call   c01087bd <assertion_failure>
c01093b5:	83 c4 10             	add    $0x10,%esp
c01093b8:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c01093bc:	75 0f                	jne    c01093cd <sys_receive_msg+0x600>
c01093be:	8b 45 10             	mov    0x10(%ebp),%eax
c01093c1:	c7 80 48 02 00 00 12 	movl   $0x12,0x248(%eax)
c01093c8:	00 00 00 
c01093cb:	eb 0c                	jmp    c01093d9 <sys_receive_msg+0x60c>
c01093cd:	8b 45 10             	mov    0x10(%ebp),%eax
c01093d0:	8b 55 0c             	mov    0xc(%ebp),%edx
c01093d3:	89 90 48 02 00 00    	mov    %edx,0x248(%eax)
c01093d9:	8b 45 10             	mov    0x10(%ebp),%eax
c01093dc:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01093e3:	3c 02                	cmp    $0x2,%al
c01093e5:	74 2d                	je     c0109414 <sys_receive_msg+0x647>
c01093e7:	8b 45 10             	mov    0x10(%ebp),%eax
c01093ea:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01093f1:	0f be c0             	movsbl %al,%eax
c01093f4:	83 ec 0c             	sub    $0xc,%esp
c01093f7:	68 6c 06 00 00       	push   $0x66c
c01093fc:	68 41 ae 10 c0       	push   $0xc010ae41
c0109401:	68 41 ae 10 c0       	push   $0xc010ae41
c0109406:	50                   	push   %eax
c0109407:	68 7b b4 10 c0       	push   $0xc010b47b
c010940c:	e8 1e f4 ff ff       	call   c010882f <assertion_failure2>
c0109411:	83 c4 20             	add    $0x20,%esp
c0109414:	83 ec 0c             	sub    $0xc,%esp
c0109417:	ff 75 10             	pushl  0x10(%ebp)
c010941a:	e8 09 01 00 00       	call   c0109528 <block>
c010941f:	83 c4 10             	add    $0x10,%esp
c0109422:	b8 00 00 00 00       	mov    $0x0,%eax
c0109427:	eb 02                	jmp    c010942b <sys_receive_msg+0x65e>
c0109429:	90                   	nop
c010942a:	90                   	nop
c010942b:	c9                   	leave  
c010942c:	c3                   	ret    

c010942d <send_rec>:
c010942d:	55                   	push   %ebp
c010942e:	89 e5                	mov    %esp,%ebp
c0109430:	83 ec 18             	sub    $0x18,%esp
c0109433:	8b 45 0c             	mov    0xc(%ebp),%eax
c0109436:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109439:	c7 45 f0 7c 00 00 00 	movl   $0x7c,-0x10(%ebp)
c0109440:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c0109444:	74 28                	je     c010946e <send_rec+0x41>
c0109446:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c010944a:	74 22                	je     c010946e <send_rec+0x41>
c010944c:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c0109450:	74 1c                	je     c010946e <send_rec+0x41>
c0109452:	68 7e 06 00 00       	push   $0x67e
c0109457:	68 41 ae 10 c0       	push   $0xc010ae41
c010945c:	68 41 ae 10 c0       	push   $0xc010ae41
c0109461:	68 9c b4 10 c0       	push   $0xc010b49c
c0109466:	e8 52 f3 ff ff       	call   c01087bd <assertion_failure>
c010946b:	83 c4 10             	add    $0x10,%esp
c010946e:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0109472:	75 14                	jne    c0109488 <send_rec+0x5b>
c0109474:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109477:	83 ec 04             	sub    $0x4,%esp
c010947a:	50                   	push   %eax
c010947b:	6a 00                	push   $0x0
c010947d:	ff 75 0c             	pushl  0xc(%ebp)
c0109480:	e8 f2 20 00 00       	call   c010b577 <Memset>
c0109485:	83 c4 10             	add    $0x10,%esp
c0109488:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c010948c:	74 23                	je     c01094b1 <send_rec+0x84>
c010948e:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c0109492:	74 34                	je     c01094c8 <send_rec+0x9b>
c0109494:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c0109498:	75 74                	jne    c010950e <send_rec+0xe1>
c010949a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010949d:	83 ec 08             	sub    $0x8,%esp
c01094a0:	ff 75 10             	pushl  0x10(%ebp)
c01094a3:	50                   	push   %eax
c01094a4:	e8 57 80 ff ff       	call   c0101500 <send_msg>
c01094a9:	83 c4 10             	add    $0x10,%esp
c01094ac:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01094af:	eb 70                	jmp    c0109521 <send_rec+0xf4>
c01094b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01094b4:	83 ec 08             	sub    $0x8,%esp
c01094b7:	ff 75 10             	pushl  0x10(%ebp)
c01094ba:	50                   	push   %eax
c01094bb:	e8 56 80 ff ff       	call   c0101516 <receive_msg>
c01094c0:	83 c4 10             	add    $0x10,%esp
c01094c3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01094c6:	eb 59                	jmp    c0109521 <send_rec+0xf4>
c01094c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01094cb:	83 ec 08             	sub    $0x8,%esp
c01094ce:	ff 75 10             	pushl  0x10(%ebp)
c01094d1:	50                   	push   %eax
c01094d2:	e8 29 80 ff ff       	call   c0101500 <send_msg>
c01094d7:	83 c4 10             	add    $0x10,%esp
c01094da:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01094dd:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c01094e1:	75 3d                	jne    c0109520 <send_rec+0xf3>
c01094e3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01094e6:	83 ec 04             	sub    $0x4,%esp
c01094e9:	50                   	push   %eax
c01094ea:	6a 00                	push   $0x0
c01094ec:	ff 75 0c             	pushl  0xc(%ebp)
c01094ef:	e8 83 20 00 00       	call   c010b577 <Memset>
c01094f4:	83 c4 10             	add    $0x10,%esp
c01094f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01094fa:	83 ec 08             	sub    $0x8,%esp
c01094fd:	ff 75 10             	pushl  0x10(%ebp)
c0109500:	50                   	push   %eax
c0109501:	e8 10 80 ff ff       	call   c0101516 <receive_msg>
c0109506:	83 c4 10             	add    $0x10,%esp
c0109509:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010950c:	eb 12                	jmp    c0109520 <send_rec+0xf3>
c010950e:	83 ec 0c             	sub    $0xc,%esp
c0109511:	68 d8 b4 10 c0       	push   $0xc010b4d8
c0109516:	e8 84 f2 ff ff       	call   c010879f <panic>
c010951b:	83 c4 10             	add    $0x10,%esp
c010951e:	eb 01                	jmp    c0109521 <send_rec+0xf4>
c0109520:	90                   	nop
c0109521:	b8 00 00 00 00       	mov    $0x0,%eax
c0109526:	c9                   	leave  
c0109527:	c3                   	ret    

c0109528 <block>:
c0109528:	55                   	push   %ebp
c0109529:	89 e5                	mov    %esp,%ebp
c010952b:	83 ec 08             	sub    $0x8,%esp
c010952e:	8b 45 08             	mov    0x8(%ebp),%eax
c0109531:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109538:	84 c0                	test   %al,%al
c010953a:	75 1c                	jne    c0109558 <block+0x30>
c010953c:	68 ad 06 00 00       	push   $0x6ad
c0109541:	68 41 ae 10 c0       	push   $0xc010ae41
c0109546:	68 41 ae 10 c0       	push   $0xc010ae41
c010954b:	68 ed b4 10 c0       	push   $0xc010b4ed
c0109550:	e8 68 f2 ff ff       	call   c01087bd <assertion_failure>
c0109555:	83 c4 10             	add    $0x10,%esp
c0109558:	e8 4b a0 ff ff       	call   c01035a8 <schedule_process>
c010955d:	b8 00 00 00 00       	mov    $0x0,%eax
c0109562:	c9                   	leave  
c0109563:	c3                   	ret    

c0109564 <unblock>:
c0109564:	55                   	push   %ebp
c0109565:	89 e5                	mov    %esp,%ebp
c0109567:	83 ec 08             	sub    $0x8,%esp
c010956a:	8b 45 08             	mov    0x8(%ebp),%eax
c010956d:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c0109574:	84 c0                	test   %al,%al
c0109576:	74 1c                	je     c0109594 <unblock+0x30>
c0109578:	68 b6 06 00 00       	push   $0x6b6
c010957d:	68 41 ae 10 c0       	push   $0xc010ae41
c0109582:	68 41 ae 10 c0       	push   $0xc010ae41
c0109587:	68 05 b5 10 c0       	push   $0xc010b505
c010958c:	e8 2c f2 ff ff       	call   c01087bd <assertion_failure>
c0109591:	83 c4 10             	add    $0x10,%esp
c0109594:	8b 45 08             	mov    0x8(%ebp),%eax
c0109597:	05 60 02 00 00       	add    $0x260,%eax
c010959c:	83 ec 08             	sub    $0x8,%esp
c010959f:	50                   	push   %eax
c01095a0:	68 ec fd 10 c0       	push   $0xc010fdec
c01095a5:	e8 d6 0a 00 00       	call   c010a080 <appendToDoubleLinkList>
c01095aa:	83 c4 10             	add    $0x10,%esp
c01095ad:	b8 00 00 00 00       	mov    $0x0,%eax
c01095b2:	c9                   	leave  
c01095b3:	c3                   	ret    

c01095b4 <get_ticks_ipc>:
c01095b4:	55                   	push   %ebp
c01095b5:	89 e5                	mov    %esp,%ebp
c01095b7:	81 ec 98 00 00 00    	sub    $0x98,%esp
c01095bd:	83 ec 04             	sub    $0x4,%esp
c01095c0:	6a 7c                	push   $0x7c
c01095c2:	6a 00                	push   $0x0
c01095c4:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01095ca:	50                   	push   %eax
c01095cb:	e8 a7 1f 00 00       	call   c010b577 <Memset>
c01095d0:	83 c4 10             	add    $0x10,%esp
c01095d3:	c7 85 78 ff ff ff 01 	movl   $0x1,-0x88(%ebp)
c01095da:	00 00 00 
c01095dd:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c01095e4:	83 ec 04             	sub    $0x4,%esp
c01095e7:	6a 01                	push   $0x1
c01095e9:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c01095ef:	50                   	push   %eax
c01095f0:	6a 03                	push   $0x3
c01095f2:	e8 36 fe ff ff       	call   c010942d <send_rec>
c01095f7:	83 c4 10             	add    $0x10,%esp
c01095fa:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01095fd:	8b 85 7c ff ff ff    	mov    -0x84(%ebp),%eax
c0109603:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109606:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109609:	c9                   	leave  
c010960a:	c3                   	ret    

c010960b <itoa>:
c010960b:	55                   	push   %ebp
c010960c:	89 e5                	mov    %esp,%ebp
c010960e:	53                   	push   %ebx
c010960f:	83 ec 14             	sub    $0x14,%esp
c0109612:	8b 45 08             	mov    0x8(%ebp),%eax
c0109615:	99                   	cltd   
c0109616:	f7 7d 10             	idivl  0x10(%ebp)
c0109619:	89 55 f4             	mov    %edx,-0xc(%ebp)
c010961c:	8b 45 08             	mov    0x8(%ebp),%eax
c010961f:	99                   	cltd   
c0109620:	f7 7d 10             	idivl  0x10(%ebp)
c0109623:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109626:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010962a:	74 14                	je     c0109640 <itoa+0x35>
c010962c:	83 ec 04             	sub    $0x4,%esp
c010962f:	ff 75 10             	pushl  0x10(%ebp)
c0109632:	ff 75 0c             	pushl  0xc(%ebp)
c0109635:	ff 75 f0             	pushl  -0x10(%ebp)
c0109638:	e8 ce ff ff ff       	call   c010960b <itoa>
c010963d:	83 c4 10             	add    $0x10,%esp
c0109640:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109643:	8d 58 30             	lea    0x30(%eax),%ebx
c0109646:	8b 45 0c             	mov    0xc(%ebp),%eax
c0109649:	8b 00                	mov    (%eax),%eax
c010964b:	8d 48 01             	lea    0x1(%eax),%ecx
c010964e:	8b 55 0c             	mov    0xc(%ebp),%edx
c0109651:	89 0a                	mov    %ecx,(%edx)
c0109653:	89 da                	mov    %ebx,%edx
c0109655:	88 10                	mov    %dl,(%eax)
c0109657:	8b 45 0c             	mov    0xc(%ebp),%eax
c010965a:	8b 00                	mov    (%eax),%eax
c010965c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c010965f:	c9                   	leave  
c0109660:	c3                   	ret    

c0109661 <i2a>:
c0109661:	55                   	push   %ebp
c0109662:	89 e5                	mov    %esp,%ebp
c0109664:	53                   	push   %ebx
c0109665:	83 ec 14             	sub    $0x14,%esp
c0109668:	8b 45 08             	mov    0x8(%ebp),%eax
c010966b:	99                   	cltd   
c010966c:	f7 7d 0c             	idivl  0xc(%ebp)
c010966f:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0109672:	8b 45 08             	mov    0x8(%ebp),%eax
c0109675:	99                   	cltd   
c0109676:	f7 7d 0c             	idivl  0xc(%ebp)
c0109679:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010967c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0109680:	74 14                	je     c0109696 <i2a+0x35>
c0109682:	83 ec 04             	sub    $0x4,%esp
c0109685:	ff 75 10             	pushl  0x10(%ebp)
c0109688:	ff 75 0c             	pushl  0xc(%ebp)
c010968b:	ff 75 f0             	pushl  -0x10(%ebp)
c010968e:	e8 ce ff ff ff       	call   c0109661 <i2a>
c0109693:	83 c4 10             	add    $0x10,%esp
c0109696:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c010969a:	7f 0a                	jg     c01096a6 <i2a+0x45>
c010969c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010969f:	83 c0 30             	add    $0x30,%eax
c01096a2:	89 c3                	mov    %eax,%ebx
c01096a4:	eb 08                	jmp    c01096ae <i2a+0x4d>
c01096a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01096a9:	83 c0 37             	add    $0x37,%eax
c01096ac:	89 c3                	mov    %eax,%ebx
c01096ae:	8b 45 10             	mov    0x10(%ebp),%eax
c01096b1:	8b 00                	mov    (%eax),%eax
c01096b3:	8d 48 01             	lea    0x1(%eax),%ecx
c01096b6:	8b 55 10             	mov    0x10(%ebp),%edx
c01096b9:	89 0a                	mov    %ecx,(%edx)
c01096bb:	88 18                	mov    %bl,(%eax)
c01096bd:	8b 45 10             	mov    0x10(%ebp),%eax
c01096c0:	8b 00                	mov    (%eax),%eax
c01096c2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01096c5:	c9                   	leave  
c01096c6:	c3                   	ret    

c01096c7 <inform_int>:
c01096c7:	55                   	push   %ebp
c01096c8:	89 e5                	mov    %esp,%ebp
c01096ca:	83 ec 18             	sub    $0x18,%esp
c01096cd:	83 ec 0c             	sub    $0xc,%esp
c01096d0:	ff 75 08             	pushl  0x8(%ebp)
c01096d3:	e8 4e a0 ff ff       	call   c0103726 <pid2proc>
c01096d8:	83 c4 10             	add    $0x10,%esp
c01096db:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01096de:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01096e1:	0f b6 80 3c 02 00 00 	movzbl 0x23c(%eax),%eax
c01096e8:	0f be c0             	movsbl %al,%eax
c01096eb:	83 e0 02             	and    $0x2,%eax
c01096ee:	85 c0                	test   %eax,%eax
c01096f0:	0f 84 8e 00 00 00    	je     c0109784 <inform_int+0xbd>
c01096f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01096f9:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c01096ff:	3d 13 02 00 00       	cmp    $0x213,%eax
c0109704:	74 0e                	je     c0109714 <inform_int+0x4d>
c0109706:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109709:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c010970f:	83 f8 12             	cmp    $0x12,%eax
c0109712:	75 7d                	jne    c0109791 <inform_int+0xca>
c0109714:	c7 45 f0 7c 00 00 00 	movl   $0x7c,-0x10(%ebp)
c010971b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010971e:	8b 80 40 02 00 00    	mov    0x240(%eax),%eax
c0109724:	83 ec 08             	sub    $0x8,%esp
c0109727:	ff 75 f0             	pushl  -0x10(%ebp)
c010972a:	50                   	push   %eax
c010972b:	e8 2c c6 ff ff       	call   c0105d5c <alloc_virtual_memory>
c0109730:	83 c4 10             	add    $0x10,%esp
c0109733:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109736:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109739:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c010973f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109742:	c7 40 78 d5 07 00 00 	movl   $0x7d5,0x78(%eax)
c0109749:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010974c:	c7 80 54 02 00 00 00 	movl   $0x0,0x254(%eax)
c0109753:	00 00 00 
c0109756:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109759:	c7 80 48 02 00 00 21 	movl   $0x21,0x248(%eax)
c0109760:	00 00 00 
c0109763:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c010976a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010976d:	c6 80 3c 02 00 00 00 	movb   $0x0,0x23c(%eax)
c0109774:	83 ec 0c             	sub    $0xc,%esp
c0109777:	ff 75 f4             	pushl  -0xc(%ebp)
c010977a:	e8 e5 fd ff ff       	call   c0109564 <unblock>
c010977f:	83 c4 10             	add    $0x10,%esp
c0109782:	eb 0d                	jmp    c0109791 <inform_int+0xca>
c0109784:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109787:	c7 80 54 02 00 00 01 	movl   $0x1,0x254(%eax)
c010978e:	00 00 00 
c0109791:	90                   	nop
c0109792:	c9                   	leave  
c0109793:	c3                   	ret    

c0109794 <strcmp>:
c0109794:	55                   	push   %ebp
c0109795:	89 e5                	mov    %esp,%ebp
c0109797:	83 ec 10             	sub    $0x10,%esp
c010979a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c010979e:	74 06                	je     c01097a6 <strcmp+0x12>
c01097a0:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01097a4:	75 08                	jne    c01097ae <strcmp+0x1a>
c01097a6:	8b 45 08             	mov    0x8(%ebp),%eax
c01097a9:	2b 45 0c             	sub    0xc(%ebp),%eax
c01097ac:	eb 53                	jmp    c0109801 <strcmp+0x6d>
c01097ae:	8b 45 08             	mov    0x8(%ebp),%eax
c01097b1:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01097b4:	8b 45 0c             	mov    0xc(%ebp),%eax
c01097b7:	89 45 f8             	mov    %eax,-0x8(%ebp)
c01097ba:	eb 18                	jmp    c01097d4 <strcmp+0x40>
c01097bc:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01097bf:	0f b6 10             	movzbl (%eax),%edx
c01097c2:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01097c5:	0f b6 00             	movzbl (%eax),%eax
c01097c8:	38 c2                	cmp    %al,%dl
c01097ca:	75 1e                	jne    c01097ea <strcmp+0x56>
c01097cc:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c01097d0:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c01097d4:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01097d7:	0f b6 00             	movzbl (%eax),%eax
c01097da:	84 c0                	test   %al,%al
c01097dc:	74 0d                	je     c01097eb <strcmp+0x57>
c01097de:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01097e1:	0f b6 00             	movzbl (%eax),%eax
c01097e4:	84 c0                	test   %al,%al
c01097e6:	75 d4                	jne    c01097bc <strcmp+0x28>
c01097e8:	eb 01                	jmp    c01097eb <strcmp+0x57>
c01097ea:	90                   	nop
c01097eb:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01097ee:	0f b6 00             	movzbl (%eax),%eax
c01097f1:	0f be d0             	movsbl %al,%edx
c01097f4:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01097f7:	0f b6 00             	movzbl (%eax),%eax
c01097fa:	0f be c0             	movsbl %al,%eax
c01097fd:	29 c2                	sub    %eax,%edx
c01097ff:	89 d0                	mov    %edx,%eax
c0109801:	c9                   	leave  
c0109802:	c3                   	ret    

c0109803 <create_user_process_address_space>:
c0109803:	55                   	push   %ebp
c0109804:	89 e5                	mov    %esp,%ebp
c0109806:	83 ec 18             	sub    $0x18,%esp
c0109809:	83 ec 08             	sub    $0x8,%esp
c010980c:	6a 00                	push   $0x0
c010980e:	6a 01                	push   $0x1
c0109810:	e8 7f c8 ff ff       	call   c0106094 <alloc_memory>
c0109815:	83 c4 10             	add    $0x10,%esp
c0109818:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010981b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010981e:	c7 40 08 00 80 04 08 	movl   $0x8048000,0x8(%eax)
c0109825:	c7 45 f0 00 80 fb b7 	movl   $0xb7fb8000,-0x10(%ebp)
c010982c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010982f:	05 ff 0f 00 00       	add    $0xfff,%eax
c0109834:	c1 e8 0c             	shr    $0xc,%eax
c0109837:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010983a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010983d:	83 c0 07             	add    $0x7,%eax
c0109840:	c1 e8 03             	shr    $0x3,%eax
c0109843:	89 c2                	mov    %eax,%edx
c0109845:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109848:	89 50 04             	mov    %edx,0x4(%eax)
c010984b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010984e:	8b 40 04             	mov    0x4(%eax),%eax
c0109851:	05 ff 0f 00 00       	add    $0xfff,%eax
c0109856:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c010985c:	85 c0                	test   %eax,%eax
c010985e:	0f 48 c2             	cmovs  %edx,%eax
c0109861:	c1 f8 0c             	sar    $0xc,%eax
c0109864:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0109867:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010986a:	83 ec 08             	sub    $0x8,%esp
c010986d:	6a 00                	push   $0x0
c010986f:	50                   	push   %eax
c0109870:	e8 1f c8 ff ff       	call   c0106094 <alloc_memory>
c0109875:	83 c4 10             	add    $0x10,%esp
c0109878:	89 c2                	mov    %eax,%edx
c010987a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010987d:	89 10                	mov    %edx,(%eax)
c010987f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109882:	83 ec 0c             	sub    $0xc,%esp
c0109885:	50                   	push   %eax
c0109886:	e8 db bf ff ff       	call   c0105866 <init_bitmap>
c010988b:	83 c4 10             	add    $0x10,%esp
c010988e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109891:	c9                   	leave  
c0109892:	c3                   	ret    

c0109893 <user_process>:
c0109893:	55                   	push   %ebp
c0109894:	89 e5                	mov    %esp,%ebp
c0109896:	83 ec 38             	sub    $0x38,%esp
c0109899:	c7 45 f0 b2 0c 00 00 	movl   $0xcb2,-0x10(%ebp)
c01098a0:	c7 45 ec ba 0c 00 00 	movl   $0xcba,-0x14(%ebp)
c01098a7:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%ebp)
c01098ae:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c01098b2:	75 0e                	jne    c01098c2 <user_process+0x2f>
c01098b4:	66 c7 45 f6 48 00    	movw   $0x48,-0xa(%ebp)
c01098ba:	66 c7 45 f4 50 00    	movw   $0x50,-0xc(%ebp)
c01098c0:	eb 0c                	jmp    c01098ce <user_process+0x3b>
c01098c2:	66 c7 45 f6 59 00    	movw   $0x59,-0xa(%ebp)
c01098c8:	66 c7 45 f4 61 00    	movw   $0x61,-0xc(%ebp)
c01098ce:	e8 d0 6a ff ff       	call   c01003a3 <get_running_thread_pcb>
c01098d3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01098d6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01098d9:	8b 55 14             	mov    0x14(%ebp),%edx
c01098dc:	89 90 18 01 00 00    	mov    %edx,0x118(%eax)
c01098e2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01098e5:	8b 90 18 01 00 00    	mov    0x118(%eax),%edx
c01098eb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01098ee:	89 90 1c 01 00 00    	mov    %edx,0x11c(%eax)
c01098f4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01098f7:	05 00 10 00 00       	add    $0x1000,%eax
c01098fc:	89 c2                	mov    %eax,%edx
c01098fe:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109901:	89 10                	mov    %edx,(%eax)
c0109903:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109906:	8b 00                	mov    (%eax),%eax
c0109908:	83 e8 44             	sub    $0x44,%eax
c010990b:	89 c2                	mov    %eax,%edx
c010990d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109910:	89 10                	mov    %edx,(%eax)
c0109912:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109915:	8b 00                	mov    (%eax),%eax
c0109917:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010991a:	c6 45 df 00          	movb   $0x0,-0x21(%ebp)
c010991e:	66 c7 45 dc 02 12    	movw   $0x1202,-0x24(%ebp)
c0109924:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0109928:	66 89 45 da          	mov    %ax,-0x26(%ebp)
c010992c:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0109930:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
c0109934:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0109938:	66 89 45 d6          	mov    %ax,-0x2a(%ebp)
c010993c:	66 c7 45 d4 38 00    	movw   $0x38,-0x2c(%ebp)
c0109942:	0f b7 55 f4          	movzwl -0xc(%ebp),%edx
c0109946:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109949:	89 50 34             	mov    %edx,0x34(%eax)
c010994c:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c0109950:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109953:	89 50 0c             	mov    %edx,0xc(%eax)
c0109956:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c010995a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010995d:	89 50 04             	mov    %edx,0x4(%eax)
c0109960:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c0109964:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109967:	89 50 08             	mov    %edx,0x8(%eax)
c010996a:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c010996e:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109971:	89 50 40             	mov    %edx,0x40(%eax)
c0109974:	0f b7 55 d4          	movzwl -0x2c(%ebp),%edx
c0109978:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010997b:	89 10                	mov    %edx,(%eax)
c010997d:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109980:	8b 55 08             	mov    0x8(%ebp),%edx
c0109983:	89 50 30             	mov    %edx,0x30(%eax)
c0109986:	0f b7 55 dc          	movzwl -0x24(%ebp),%edx
c010998a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010998d:	89 50 38             	mov    %edx,0x38(%eax)
c0109990:	83 ec 08             	sub    $0x8,%esp
c0109993:	6a 01                	push   $0x1
c0109995:	68 00 f0 ff bf       	push   $0xbffff000
c010999a:	e8 2d c6 ff ff       	call   c0105fcc <alloc_physical_memory>
c010999f:	83 c4 10             	add    $0x10,%esp
c01099a2:	8d 90 00 10 00 00    	lea    0x1000(%eax),%edx
c01099a8:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01099ab:	89 50 3c             	mov    %edx,0x3c(%eax)
c01099ae:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01099b1:	83 ec 0c             	sub    $0xc,%esp
c01099b4:	50                   	push   %eax
c01099b5:	e8 bc 68 ff ff       	call   c0100276 <restart>
c01099ba:	83 c4 10             	add    $0x10,%esp
c01099bd:	90                   	nop
c01099be:	c9                   	leave  
c01099bf:	c3                   	ret    

c01099c0 <clone_pcb>:
c01099c0:	55                   	push   %ebp
c01099c1:	89 e5                	mov    %esp,%ebp
c01099c3:	83 ec 38             	sub    $0x38,%esp
c01099c6:	83 ec 08             	sub    $0x8,%esp
c01099c9:	6a 00                	push   $0x0
c01099cb:	6a 01                	push   $0x1
c01099cd:	e8 c2 c6 ff ff       	call   c0106094 <alloc_memory>
c01099d2:	83 c4 10             	add    $0x10,%esp
c01099d5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01099d8:	83 ec 04             	sub    $0x4,%esp
c01099db:	68 00 10 00 00       	push   $0x1000
c01099e0:	6a 00                	push   $0x0
c01099e2:	ff 75 f4             	pushl  -0xc(%ebp)
c01099e5:	e8 8d 1b 00 00       	call   c010b577 <Memset>
c01099ea:	83 c4 10             	add    $0x10,%esp
c01099ed:	83 ec 04             	sub    $0x4,%esp
c01099f0:	68 00 10 00 00       	push   $0x1000
c01099f5:	ff 75 08             	pushl  0x8(%ebp)
c01099f8:	ff 75 f4             	pushl  -0xc(%ebp)
c01099fb:	e8 c9 d1 ff ff       	call   c0106bc9 <Memcpy>
c0109a00:	83 c4 10             	add    $0x10,%esp
c0109a03:	a1 c4 06 11 c0       	mov    0xc01106c4,%eax
c0109a08:	8d 50 01             	lea    0x1(%eax),%edx
c0109a0b:	89 15 c4 06 11 c0    	mov    %edx,0xc01106c4
c0109a11:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0109a14:	89 82 14 01 00 00    	mov    %eax,0x114(%edx)
c0109a1a:	8b 45 08             	mov    0x8(%ebp),%eax
c0109a1d:	8b 80 14 01 00 00    	mov    0x114(%eax),%eax
c0109a23:	89 c2                	mov    %eax,%edx
c0109a25:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109a28:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c0109a2e:	83 ec 08             	sub    $0x8,%esp
c0109a31:	6a 00                	push   $0x0
c0109a33:	6a 01                	push   $0x1
c0109a35:	e8 5a c6 ff ff       	call   c0106094 <alloc_memory>
c0109a3a:	83 c4 10             	add    $0x10,%esp
c0109a3d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109a40:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109a43:	05 00 0c 00 00       	add    $0xc00,%eax
c0109a48:	83 ec 04             	sub    $0x4,%esp
c0109a4b:	68 00 04 00 00       	push   $0x400
c0109a50:	68 00 fc ff ff       	push   $0xfffffc00
c0109a55:	50                   	push   %eax
c0109a56:	e8 6e d1 ff ff       	call   c0106bc9 <Memcpy>
c0109a5b:	83 c4 10             	add    $0x10,%esp
c0109a5e:	83 ec 0c             	sub    $0xc,%esp
c0109a61:	ff 75 f0             	pushl  -0x10(%ebp)
c0109a64:	e8 42 c4 ff ff       	call   c0105eab <get_physical_address>
c0109a69:	83 c4 10             	add    $0x10,%esp
c0109a6c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109a6f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109a72:	05 fc 0f 00 00       	add    $0xffc,%eax
c0109a77:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0109a7a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109a7d:	83 c8 07             	or     $0x7,%eax
c0109a80:	89 c2                	mov    %eax,%edx
c0109a82:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109a85:	89 10                	mov    %edx,(%eax)
c0109a87:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109a8a:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0109a8d:	89 50 08             	mov    %edx,0x8(%eax)
c0109a90:	e8 6e fd ff ff       	call   c0109803 <create_user_process_address_space>
c0109a95:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109a98:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0109a9b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109a9e:	89 50 0c             	mov    %edx,0xc(%eax)
c0109aa1:	8b 45 08             	mov    0x8(%ebp),%eax
c0109aa4:	8b 40 0c             	mov    0xc(%eax),%eax
c0109aa7:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109aaa:	83 ec 04             	sub    $0x4,%esp
c0109aad:	6a 0c                	push   $0xc
c0109aaf:	ff 75 e0             	pushl  -0x20(%ebp)
c0109ab2:	ff 75 e4             	pushl  -0x1c(%ebp)
c0109ab5:	e8 0f d1 ff ff       	call   c0106bc9 <Memcpy>
c0109aba:	83 c4 10             	add    $0x10,%esp
c0109abd:	c7 45 dc 00 80 fb b7 	movl   $0xb7fb8000,-0x24(%ebp)
c0109ac4:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0109ac7:	05 ff 0f 00 00       	add    $0xfff,%eax
c0109acc:	c1 e8 0c             	shr    $0xc,%eax
c0109acf:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0109ad2:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109ad5:	83 c0 07             	add    $0x7,%eax
c0109ad8:	c1 e8 03             	shr    $0x3,%eax
c0109adb:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0109ade:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0109ae1:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0109ae4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0109ae7:	05 ff 0f 00 00       	add    $0xfff,%eax
c0109aec:	c1 e8 0c             	shr    $0xc,%eax
c0109aef:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0109af2:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0109af5:	83 ec 08             	sub    $0x8,%esp
c0109af8:	6a 00                	push   $0x0
c0109afa:	50                   	push   %eax
c0109afb:	e8 94 c5 ff ff       	call   c0106094 <alloc_memory>
c0109b00:	83 c4 10             	add    $0x10,%esp
c0109b03:	89 c2                	mov    %eax,%edx
c0109b05:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109b08:	89 10                	mov    %edx,(%eax)
c0109b0a:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0109b0d:	c1 e0 0c             	shl    $0xc,%eax
c0109b10:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0109b13:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109b16:	8b 10                	mov    (%eax),%edx
c0109b18:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109b1b:	8b 00                	mov    (%eax),%eax
c0109b1d:	83 ec 04             	sub    $0x4,%esp
c0109b20:	ff 75 cc             	pushl  -0x34(%ebp)
c0109b23:	52                   	push   %edx
c0109b24:	50                   	push   %eax
c0109b25:	e8 9f d0 ff ff       	call   c0106bc9 <Memcpy>
c0109b2a:	83 c4 10             	add    $0x10,%esp
c0109b2d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109b30:	c9                   	leave  
c0109b31:	c3                   	ret    

c0109b32 <build_body_stack>:
c0109b32:	55                   	push   %ebp
c0109b33:	89 e5                	mov    %esp,%ebp
c0109b35:	83 ec 48             	sub    $0x48,%esp
c0109b38:	8b 45 08             	mov    0x8(%ebp),%eax
c0109b3b:	8b 40 0c             	mov    0xc(%eax),%eax
c0109b3e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109b41:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109b44:	8b 50 04             	mov    0x4(%eax),%edx
c0109b47:	8b 00                	mov    (%eax),%eax
c0109b49:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0109b4c:	89 55 c8             	mov    %edx,-0x38(%ebp)
c0109b4f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0109b52:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109b55:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0109b58:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0109b5b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109b5e:	8b 40 08             	mov    0x8(%eax),%eax
c0109b61:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0109b64:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0109b6b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0109b72:	e8 ee cf ff ff       	call   c0106b65 <intr_disable>
c0109b77:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0109b7a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0109b81:	e9 c2 00 00 00       	jmp    c0109c48 <build_body_stack+0x116>
c0109b86:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0109b89:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109b8c:	01 d0                	add    %edx,%eax
c0109b8e:	0f b6 00             	movzbl (%eax),%eax
c0109b91:	88 45 d3             	mov    %al,-0x2d(%ebp)
c0109b94:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0109b9b:	e9 9a 00 00 00       	jmp    c0109c3a <build_body_stack+0x108>
c0109ba0:	0f be 55 d3          	movsbl -0x2d(%ebp),%edx
c0109ba4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109ba7:	89 c1                	mov    %eax,%ecx
c0109ba9:	d3 fa                	sar    %cl,%edx
c0109bab:	89 d0                	mov    %edx,%eax
c0109bad:	83 e0 01             	and    $0x1,%eax
c0109bb0:	85 c0                	test   %eax,%eax
c0109bb2:	75 06                	jne    c0109bba <build_body_stack+0x88>
c0109bb4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0109bb8:	eb 7c                	jmp    c0109c36 <build_body_stack+0x104>
c0109bba:	8b 45 08             	mov    0x8(%ebp),%eax
c0109bbd:	8b 40 08             	mov    0x8(%eax),%eax
c0109bc0:	83 ec 0c             	sub    $0xc,%esp
c0109bc3:	50                   	push   %eax
c0109bc4:	e8 be 67 ff ff       	call   c0100387 <update_cr3>
c0109bc9:	83 c4 10             	add    $0x10,%esp
c0109bcc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109bcf:	c1 e0 0c             	shl    $0xc,%eax
c0109bd2:	89 c2                	mov    %eax,%edx
c0109bd4:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109bd7:	01 d0                	add    %edx,%eax
c0109bd9:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0109bdc:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0109bdf:	8b 45 10             	mov    0x10(%ebp),%eax
c0109be2:	83 ec 04             	sub    $0x4,%esp
c0109be5:	68 00 10 00 00       	push   $0x1000
c0109bea:	52                   	push   %edx
c0109beb:	50                   	push   %eax
c0109bec:	e8 d8 cf ff ff       	call   c0106bc9 <Memcpy>
c0109bf1:	83 c4 10             	add    $0x10,%esp
c0109bf4:	8b 45 0c             	mov    0xc(%ebp),%eax
c0109bf7:	8b 40 08             	mov    0x8(%eax),%eax
c0109bfa:	83 ec 0c             	sub    $0xc,%esp
c0109bfd:	50                   	push   %eax
c0109bfe:	e8 84 67 ff ff       	call   c0100387 <update_cr3>
c0109c03:	83 c4 10             	add    $0x10,%esp
c0109c06:	83 ec 08             	sub    $0x8,%esp
c0109c09:	ff 75 cc             	pushl  -0x34(%ebp)
c0109c0c:	6a 01                	push   $0x1
c0109c0e:	e8 e3 c4 ff ff       	call   c01060f6 <get_a_virtual_page>
c0109c13:	83 c4 10             	add    $0x10,%esp
c0109c16:	8b 55 10             	mov    0x10(%ebp),%edx
c0109c19:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0109c1c:	83 ec 04             	sub    $0x4,%esp
c0109c1f:	68 00 10 00 00       	push   $0x1000
c0109c24:	52                   	push   %edx
c0109c25:	50                   	push   %eax
c0109c26:	e8 9e cf ff ff       	call   c0106bc9 <Memcpy>
c0109c2b:	83 c4 10             	add    $0x10,%esp
c0109c2e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0109c32:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0109c36:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0109c3a:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0109c3e:	0f 8e 5c ff ff ff    	jle    c0109ba0 <build_body_stack+0x6e>
c0109c44:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0109c48:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109c4b:	39 45 dc             	cmp    %eax,-0x24(%ebp)
c0109c4e:	0f 87 32 ff ff ff    	ja     c0109b86 <build_body_stack+0x54>
c0109c54:	83 ec 0c             	sub    $0xc,%esp
c0109c57:	ff 75 d4             	pushl  -0x2c(%ebp)
c0109c5a:	e8 2f cf ff ff       	call   c0106b8e <intr_set_status>
c0109c5f:	83 c4 10             	add    $0x10,%esp
c0109c62:	90                   	nop
c0109c63:	c9                   	leave  
c0109c64:	c3                   	ret    

c0109c65 <build_process_kernel_stack>:
c0109c65:	55                   	push   %ebp
c0109c66:	89 e5                	mov    %esp,%ebp
c0109c68:	83 ec 28             	sub    $0x28,%esp
c0109c6b:	e8 f5 ce ff ff       	call   c0106b65 <intr_disable>
c0109c70:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109c73:	8b 45 08             	mov    0x8(%ebp),%eax
c0109c76:	05 00 10 00 00       	add    $0x1000,%eax
c0109c7b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109c7e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109c81:	8b 00                	mov    (%eax),%eax
c0109c83:	83 f8 38             	cmp    $0x38,%eax
c0109c86:	74 06                	je     c0109c8e <build_process_kernel_stack+0x29>
c0109c88:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c0109c8c:	eb f0                	jmp    c0109c7e <build_process_kernel_stack+0x19>
c0109c8e:	90                   	nop
c0109c8f:	8b 45 08             	mov    0x8(%ebp),%eax
c0109c92:	05 00 10 00 00       	add    $0x1000,%eax
c0109c97:	89 c2                	mov    %eax,%edx
c0109c99:	8b 45 08             	mov    0x8(%ebp),%eax
c0109c9c:	89 50 04             	mov    %edx,0x4(%eax)
c0109c9f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109ca2:	83 c0 2c             	add    $0x2c,%eax
c0109ca5:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109ca8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109cab:	83 e8 04             	sub    $0x4,%eax
c0109cae:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0109cb1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109cb4:	83 e8 08             	sub    $0x8,%eax
c0109cb7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109cba:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109cbd:	83 e8 0c             	sub    $0xc,%eax
c0109cc0:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109cc3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109cc6:	83 e8 10             	sub    $0x10,%eax
c0109cc9:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0109ccc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109ccf:	83 e8 14             	sub    $0x14,%eax
c0109cd2:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0109cd5:	ba 67 02 10 c0       	mov    $0xc0100267,%edx
c0109cda:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109cdd:	89 10                	mov    %edx,(%eax)
c0109cdf:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109ce2:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0109ce8:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109ceb:	8b 10                	mov    (%eax),%edx
c0109ced:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0109cf0:	89 10                	mov    %edx,(%eax)
c0109cf2:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0109cf5:	8b 10                	mov    (%eax),%edx
c0109cf7:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109cfa:	89 10                	mov    %edx,(%eax)
c0109cfc:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109cff:	8b 10                	mov    (%eax),%edx
c0109d01:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109d04:	89 10                	mov    %edx,(%eax)
c0109d06:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109d09:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0109d0f:	8b 45 08             	mov    0x8(%ebp),%eax
c0109d12:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0109d15:	89 10                	mov    %edx,(%eax)
c0109d17:	83 ec 0c             	sub    $0xc,%esp
c0109d1a:	ff 75 f0             	pushl  -0x10(%ebp)
c0109d1d:	e8 6c ce ff ff       	call   c0106b8e <intr_set_status>
c0109d22:	83 c4 10             	add    $0x10,%esp
c0109d25:	90                   	nop
c0109d26:	c9                   	leave  
c0109d27:	c3                   	ret    

c0109d28 <fork_process>:
c0109d28:	55                   	push   %ebp
c0109d29:	89 e5                	mov    %esp,%ebp
c0109d2b:	83 ec 18             	sub    $0x18,%esp
c0109d2e:	8b 45 08             	mov    0x8(%ebp),%eax
c0109d31:	83 ec 0c             	sub    $0xc,%esp
c0109d34:	50                   	push   %eax
c0109d35:	e8 ec 99 ff ff       	call   c0103726 <pid2proc>
c0109d3a:	83 c4 10             	add    $0x10,%esp
c0109d3d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109d40:	83 ec 0c             	sub    $0xc,%esp
c0109d43:	ff 75 f4             	pushl  -0xc(%ebp)
c0109d46:	e8 75 fc ff ff       	call   c01099c0 <clone_pcb>
c0109d4b:	83 c4 10             	add    $0x10,%esp
c0109d4e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109d51:	83 ec 08             	sub    $0x8,%esp
c0109d54:	6a 00                	push   $0x0
c0109d56:	6a 01                	push   $0x1
c0109d58:	e8 37 c3 ff ff       	call   c0106094 <alloc_memory>
c0109d5d:	83 c4 10             	add    $0x10,%esp
c0109d60:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109d63:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109d66:	83 ec 04             	sub    $0x4,%esp
c0109d69:	68 00 10 00 00       	push   $0x1000
c0109d6e:	6a 00                	push   $0x0
c0109d70:	50                   	push   %eax
c0109d71:	e8 01 18 00 00       	call   c010b577 <Memset>
c0109d76:	83 c4 10             	add    $0x10,%esp
c0109d79:	83 ec 04             	sub    $0x4,%esp
c0109d7c:	ff 75 ec             	pushl  -0x14(%ebp)
c0109d7f:	ff 75 f0             	pushl  -0x10(%ebp)
c0109d82:	ff 75 f4             	pushl  -0xc(%ebp)
c0109d85:	e8 a8 fd ff ff       	call   c0109b32 <build_body_stack>
c0109d8a:	83 c4 10             	add    $0x10,%esp
c0109d8d:	83 ec 0c             	sub    $0xc,%esp
c0109d90:	ff 75 f0             	pushl  -0x10(%ebp)
c0109d93:	e8 cd fe ff ff       	call   c0109c65 <build_process_kernel_stack>
c0109d98:	83 c4 10             	add    $0x10,%esp
c0109d9b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109d9e:	05 6a 02 00 00       	add    $0x26a,%eax
c0109da3:	83 ec 08             	sub    $0x8,%esp
c0109da6:	50                   	push   %eax
c0109da7:	68 04 0f 11 c0       	push   $0xc0110f04
c0109dac:	e8 cf 02 00 00       	call   c010a080 <appendToDoubleLinkList>
c0109db1:	83 c4 10             	add    $0x10,%esp
c0109db4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109db7:	c9                   	leave  
c0109db8:	c3                   	ret    

c0109db9 <process_execute>:
c0109db9:	55                   	push   %ebp
c0109dba:	89 e5                	mov    %esp,%ebp
c0109dbc:	83 ec 28             	sub    $0x28,%esp
c0109dbf:	e8 d2 04 00 00       	call   c010a296 <thread_init>
c0109dc4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109dc7:	83 ec 0c             	sub    $0xc,%esp
c0109dca:	ff 75 f4             	pushl  -0xc(%ebp)
c0109dcd:	e8 71 05 00 00       	call   c010a343 <thread_create>
c0109dd2:	83 c4 10             	add    $0x10,%esp
c0109dd5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109dd8:	05 28 01 00 00       	add    $0x128,%eax
c0109ddd:	83 ec 08             	sub    $0x8,%esp
c0109de0:	ff 75 10             	pushl  0x10(%ebp)
c0109de3:	50                   	push   %eax
c0109de4:	e8 ad 17 00 00       	call   c010b596 <Strcpy>
c0109de9:	83 c4 10             	add    $0x10,%esp
c0109dec:	83 ec 08             	sub    $0x8,%esp
c0109def:	6a 00                	push   $0x0
c0109df1:	6a 01                	push   $0x1
c0109df3:	e8 9c c2 ff ff       	call   c0106094 <alloc_memory>
c0109df8:	83 c4 10             	add    $0x10,%esp
c0109dfb:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109dfe:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109e01:	05 00 0c 00 00       	add    $0xc00,%eax
c0109e06:	83 ec 04             	sub    $0x4,%esp
c0109e09:	68 00 04 00 00       	push   $0x400
c0109e0e:	68 00 fc ff ff       	push   $0xfffffc00
c0109e13:	50                   	push   %eax
c0109e14:	e8 b0 cd ff ff       	call   c0106bc9 <Memcpy>
c0109e19:	83 c4 10             	add    $0x10,%esp
c0109e1c:	83 ec 0c             	sub    $0xc,%esp
c0109e1f:	ff 75 f0             	pushl  -0x10(%ebp)
c0109e22:	e8 84 c0 ff ff       	call   c0105eab <get_physical_address>
c0109e27:	83 c4 10             	add    $0x10,%esp
c0109e2a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109e2d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109e30:	05 fc 0f 00 00       	add    $0xffc,%eax
c0109e35:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0109e38:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109e3b:	83 c8 07             	or     $0x7,%eax
c0109e3e:	89 c2                	mov    %eax,%edx
c0109e40:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109e43:	89 10                	mov    %edx,(%eax)
c0109e45:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109e48:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0109e4b:	89 50 08             	mov    %edx,0x8(%eax)
c0109e4e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109e51:	83 c0 10             	add    $0x10,%eax
c0109e54:	83 ec 0c             	sub    $0xc,%esp
c0109e57:	50                   	push   %eax
c0109e58:	e8 ed c7 ff ff       	call   c010664a <init_memory_block_desc>
c0109e5d:	83 c4 10             	add    $0x10,%esp
c0109e60:	e8 9e f9 ff ff       	call   c0109803 <create_user_process_address_space>
c0109e65:	89 c2                	mov    %eax,%edx
c0109e67:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109e6a:	89 50 0c             	mov    %edx,0xc(%eax)
c0109e6d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109e70:	8b 00                	mov    (%eax),%eax
c0109e72:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109e75:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109e78:	c7 40 10 93 98 10 c0 	movl   $0xc0109893,0x10(%eax)
c0109e7f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109e82:	8b 55 08             	mov    0x8(%ebp),%edx
c0109e85:	89 50 18             	mov    %edx,0x18(%eax)
c0109e88:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109e8b:	8b 55 0c             	mov    0xc(%ebp),%edx
c0109e8e:	89 50 1c             	mov    %edx,0x1c(%eax)
c0109e91:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109e94:	8b 55 14             	mov    0x14(%ebp),%edx
c0109e97:	89 50 20             	mov    %edx,0x20(%eax)
c0109e9a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109e9d:	8b 55 18             	mov    0x18(%ebp),%edx
c0109ea0:	89 50 24             	mov    %edx,0x24(%eax)
c0109ea3:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0109ea6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109ea9:	89 50 28             	mov    %edx,0x28(%eax)
c0109eac:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109eaf:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0109eb5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109eb8:	8b 10                	mov    (%eax),%edx
c0109eba:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109ebd:	89 50 04             	mov    %edx,0x4(%eax)
c0109ec0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109ec3:	8b 50 04             	mov    0x4(%eax),%edx
c0109ec6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109ec9:	89 50 08             	mov    %edx,0x8(%eax)
c0109ecc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109ecf:	8b 50 08             	mov    0x8(%eax),%edx
c0109ed2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109ed5:	89 50 0c             	mov    %edx,0xc(%eax)
c0109ed8:	83 ec 0c             	sub    $0xc,%esp
c0109edb:	68 ec fd 10 c0       	push   $0xc010fdec
c0109ee0:	e8 9e 00 00 00       	call   c0109f83 <isListEmpty>
c0109ee5:	83 c4 10             	add    $0x10,%esp
c0109ee8:	e8 78 cc ff ff       	call   c0106b65 <intr_disable>
c0109eed:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109ef0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109ef3:	05 60 02 00 00       	add    $0x260,%eax
c0109ef8:	83 ec 08             	sub    $0x8,%esp
c0109efb:	50                   	push   %eax
c0109efc:	68 ec fd 10 c0       	push   $0xc010fdec
c0109f01:	e8 7a 01 00 00       	call   c010a080 <appendToDoubleLinkList>
c0109f06:	83 c4 10             	add    $0x10,%esp
c0109f09:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109f0c:	05 6a 02 00 00       	add    $0x26a,%eax
c0109f11:	83 ec 08             	sub    $0x8,%esp
c0109f14:	50                   	push   %eax
c0109f15:	68 04 0f 11 c0       	push   $0xc0110f04
c0109f1a:	e8 61 01 00 00       	call   c010a080 <appendToDoubleLinkList>
c0109f1f:	83 c4 10             	add    $0x10,%esp
c0109f22:	83 ec 0c             	sub    $0xc,%esp
c0109f25:	ff 75 e0             	pushl  -0x20(%ebp)
c0109f28:	e8 61 cc ff ff       	call   c0106b8e <intr_set_status>
c0109f2d:	83 c4 10             	add    $0x10,%esp
c0109f30:	90                   	nop
c0109f31:	c9                   	leave  
c0109f32:	c3                   	ret    
c0109f33:	66 90                	xchg   %ax,%ax
c0109f35:	66 90                	xchg   %ax,%ax
c0109f37:	66 90                	xchg   %ax,%ax
c0109f39:	66 90                	xchg   %ax,%ax
c0109f3b:	66 90                	xchg   %ax,%ax
c0109f3d:	66 90                	xchg   %ax,%ax
c0109f3f:	90                   	nop

c0109f40 <switch_to>:
c0109f40:	56                   	push   %esi
c0109f41:	57                   	push   %edi
c0109f42:	53                   	push   %ebx
c0109f43:	55                   	push   %ebp
c0109f44:	89 e5                	mov    %esp,%ebp
c0109f46:	8b 45 14             	mov    0x14(%ebp),%eax
c0109f49:	89 20                	mov    %esp,(%eax)
c0109f4b:	8b 45 18             	mov    0x18(%ebp),%eax
c0109f4e:	8b 20                	mov    (%eax),%esp
c0109f50:	5d                   	pop    %ebp
c0109f51:	5b                   	pop    %ebx
c0109f52:	5f                   	pop    %edi
c0109f53:	5e                   	pop    %esi
c0109f54:	c3                   	ret    

c0109f55 <initDoubleLinkList>:
c0109f55:	55                   	push   %ebp
c0109f56:	89 e5                	mov    %esp,%ebp
c0109f58:	8b 45 08             	mov    0x8(%ebp),%eax
c0109f5b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0109f61:	8b 45 08             	mov    0x8(%ebp),%eax
c0109f64:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c0109f6b:	8b 45 08             	mov    0x8(%ebp),%eax
c0109f6e:	8d 50 08             	lea    0x8(%eax),%edx
c0109f71:	8b 45 08             	mov    0x8(%ebp),%eax
c0109f74:	89 50 04             	mov    %edx,0x4(%eax)
c0109f77:	8b 55 08             	mov    0x8(%ebp),%edx
c0109f7a:	8b 45 08             	mov    0x8(%ebp),%eax
c0109f7d:	89 50 08             	mov    %edx,0x8(%eax)
c0109f80:	90                   	nop
c0109f81:	5d                   	pop    %ebp
c0109f82:	c3                   	ret    

c0109f83 <isListEmpty>:
c0109f83:	55                   	push   %ebp
c0109f84:	89 e5                	mov    %esp,%ebp
c0109f86:	8b 45 08             	mov    0x8(%ebp),%eax
c0109f89:	8b 40 04             	mov    0x4(%eax),%eax
c0109f8c:	8b 55 08             	mov    0x8(%ebp),%edx
c0109f8f:	83 c2 08             	add    $0x8,%edx
c0109f92:	39 d0                	cmp    %edx,%eax
c0109f94:	75 07                	jne    c0109f9d <isListEmpty+0x1a>
c0109f96:	b8 01 00 00 00       	mov    $0x1,%eax
c0109f9b:	eb 05                	jmp    c0109fa2 <isListEmpty+0x1f>
c0109f9d:	b8 00 00 00 00       	mov    $0x0,%eax
c0109fa2:	5d                   	pop    %ebp
c0109fa3:	c3                   	ret    

c0109fa4 <findElementInList>:
c0109fa4:	55                   	push   %ebp
c0109fa5:	89 e5                	mov    %esp,%ebp
c0109fa7:	83 ec 28             	sub    $0x28,%esp
c0109faa:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0109fae:	75 19                	jne    c0109fc9 <findElementInList+0x25>
c0109fb0:	6a 60                	push   $0x60
c0109fb2:	68 1d b5 10 c0       	push   $0xc010b51d
c0109fb7:	68 1d b5 10 c0       	push   $0xc010b51d
c0109fbc:	68 30 b5 10 c0       	push   $0xc010b530
c0109fc1:	e8 f7 e7 ff ff       	call   c01087bd <assertion_failure>
c0109fc6:	83 c4 10             	add    $0x10,%esp
c0109fc9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0109fcd:	75 19                	jne    c0109fe8 <findElementInList+0x44>
c0109fcf:	6a 61                	push   $0x61
c0109fd1:	68 1d b5 10 c0       	push   $0xc010b51d
c0109fd6:	68 1d b5 10 c0       	push   $0xc010b51d
c0109fdb:	68 3c b5 10 c0       	push   $0xc010b53c
c0109fe0:	e8 d8 e7 ff ff       	call   c01087bd <assertion_failure>
c0109fe5:	83 c4 10             	add    $0x10,%esp
c0109fe8:	e8 78 cb ff ff       	call   c0106b65 <intr_disable>
c0109fed:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109ff0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0109ff7:	8b 45 08             	mov    0x8(%ebp),%eax
c0109ffa:	8b 40 08             	mov    0x8(%eax),%eax
c0109ffd:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010a000:	8b 45 08             	mov    0x8(%ebp),%eax
c010a003:	8b 40 04             	mov    0x4(%eax),%eax
c010a006:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a009:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010a00d:	75 07                	jne    c010a016 <findElementInList+0x72>
c010a00f:	b8 00 00 00 00       	mov    $0x0,%eax
c010a014:	eb 68                	jmp    c010a07e <findElementInList+0xda>
c010a016:	8b 45 0c             	mov    0xc(%ebp),%eax
c010a019:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010a01c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010a01f:	2b 45 f0             	sub    -0x10(%ebp),%eax
c010a022:	c1 f8 03             	sar    $0x3,%eax
c010a025:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010a028:	eb 36                	jmp    c010a060 <findElementInList+0xbc>
c010a02a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010a02d:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c010a030:	75 07                	jne    c010a039 <findElementInList+0x95>
c010a032:	b8 01 00 00 00       	mov    $0x1,%eax
c010a037:	eb 45                	jmp    c010a07e <findElementInList+0xda>
c010a039:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010a03d:	75 07                	jne    c010a046 <findElementInList+0xa2>
c010a03f:	b8 00 00 00 00       	mov    $0x0,%eax
c010a044:	eb 38                	jmp    c010a07e <findElementInList+0xda>
c010a046:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a049:	8b 40 04             	mov    0x4(%eax),%eax
c010a04c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a04f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010a053:	75 07                	jne    c010a05c <findElementInList+0xb8>
c010a055:	b8 00 00 00 00       	mov    $0x0,%eax
c010a05a:	eb 22                	jmp    c010a07e <findElementInList+0xda>
c010a05c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c010a060:	8b 45 08             	mov    0x8(%ebp),%eax
c010a063:	83 c0 08             	add    $0x8,%eax
c010a066:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c010a069:	75 bf                	jne    c010a02a <findElementInList+0x86>
c010a06b:	83 ec 0c             	sub    $0xc,%esp
c010a06e:	ff 75 ec             	pushl  -0x14(%ebp)
c010a071:	e8 18 cb ff ff       	call   c0106b8e <intr_set_status>
c010a076:	83 c4 10             	add    $0x10,%esp
c010a079:	b8 00 00 00 00       	mov    $0x0,%eax
c010a07e:	c9                   	leave  
c010a07f:	c3                   	ret    

c010a080 <appendToDoubleLinkList>:
c010a080:	55                   	push   %ebp
c010a081:	89 e5                	mov    %esp,%ebp
c010a083:	83 ec 18             	sub    $0x18,%esp
c010a086:	83 ec 08             	sub    $0x8,%esp
c010a089:	ff 75 0c             	pushl  0xc(%ebp)
c010a08c:	ff 75 08             	pushl  0x8(%ebp)
c010a08f:	e8 10 ff ff ff       	call   c0109fa4 <findElementInList>
c010a094:	83 c4 10             	add    $0x10,%esp
c010a097:	3c 01                	cmp    $0x1,%al
c010a099:	0f 84 c2 00 00 00    	je     c010a161 <appendToDoubleLinkList+0xe1>
c010a09f:	e8 c1 ca ff ff       	call   c0106b65 <intr_disable>
c010a0a4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a0a7:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c010a0ab:	75 1c                	jne    c010a0c9 <appendToDoubleLinkList+0x49>
c010a0ad:	68 9e 00 00 00       	push   $0x9e
c010a0b2:	68 1d b5 10 c0       	push   $0xc010b51d
c010a0b7:	68 1d b5 10 c0       	push   $0xc010b51d
c010a0bc:	68 30 b5 10 c0       	push   $0xc010b530
c010a0c1:	e8 f7 e6 ff ff       	call   c01087bd <assertion_failure>
c010a0c6:	83 c4 10             	add    $0x10,%esp
c010a0c9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010a0cd:	75 1c                	jne    c010a0eb <appendToDoubleLinkList+0x6b>
c010a0cf:	68 9f 00 00 00       	push   $0x9f
c010a0d4:	68 1d b5 10 c0       	push   $0xc010b51d
c010a0d9:	68 1d b5 10 c0       	push   $0xc010b51d
c010a0de:	68 3c b5 10 c0       	push   $0xc010b53c
c010a0e3:	e8 d5 e6 ff ff       	call   c01087bd <assertion_failure>
c010a0e8:	83 c4 10             	add    $0x10,%esp
c010a0eb:	83 ec 08             	sub    $0x8,%esp
c010a0ee:	ff 75 0c             	pushl  0xc(%ebp)
c010a0f1:	ff 75 08             	pushl  0x8(%ebp)
c010a0f4:	e8 ab fe ff ff       	call   c0109fa4 <findElementInList>
c010a0f9:	83 c4 10             	add    $0x10,%esp
c010a0fc:	3c 01                	cmp    $0x1,%al
c010a0fe:	74 64                	je     c010a164 <appendToDoubleLinkList+0xe4>
c010a100:	8b 45 0c             	mov    0xc(%ebp),%eax
c010a103:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a106:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a109:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c010a110:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a113:	8b 50 04             	mov    0x4(%eax),%edx
c010a116:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a119:	89 10                	mov    %edx,(%eax)
c010a11b:	8b 45 08             	mov    0x8(%ebp),%eax
c010a11e:	8b 50 08             	mov    0x8(%eax),%edx
c010a121:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a124:	89 10                	mov    %edx,(%eax)
c010a126:	8b 45 08             	mov    0x8(%ebp),%eax
c010a129:	8b 40 08             	mov    0x8(%eax),%eax
c010a12c:	85 c0                	test   %eax,%eax
c010a12e:	74 0c                	je     c010a13c <appendToDoubleLinkList+0xbc>
c010a130:	8b 45 08             	mov    0x8(%ebp),%eax
c010a133:	8b 40 08             	mov    0x8(%eax),%eax
c010a136:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010a139:	89 50 04             	mov    %edx,0x4(%eax)
c010a13c:	8b 45 08             	mov    0x8(%ebp),%eax
c010a13f:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010a142:	89 50 08             	mov    %edx,0x8(%eax)
c010a145:	8b 45 08             	mov    0x8(%ebp),%eax
c010a148:	8d 50 08             	lea    0x8(%eax),%edx
c010a14b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a14e:	89 50 04             	mov    %edx,0x4(%eax)
c010a151:	83 ec 0c             	sub    $0xc,%esp
c010a154:	ff 75 f4             	pushl  -0xc(%ebp)
c010a157:	e8 32 ca ff ff       	call   c0106b8e <intr_set_status>
c010a15c:	83 c4 10             	add    $0x10,%esp
c010a15f:	eb 04                	jmp    c010a165 <appendToDoubleLinkList+0xe5>
c010a161:	90                   	nop
c010a162:	eb 01                	jmp    c010a165 <appendToDoubleLinkList+0xe5>
c010a164:	90                   	nop
c010a165:	c9                   	leave  
c010a166:	c3                   	ret    

c010a167 <insertToDoubleLinkList>:
c010a167:	55                   	push   %ebp
c010a168:	89 e5                	mov    %esp,%ebp
c010a16a:	83 ec 18             	sub    $0x18,%esp
c010a16d:	83 ec 08             	sub    $0x8,%esp
c010a170:	ff 75 0c             	pushl  0xc(%ebp)
c010a173:	ff 75 08             	pushl  0x8(%ebp)
c010a176:	e8 29 fe ff ff       	call   c0109fa4 <findElementInList>
c010a17b:	83 c4 10             	add    $0x10,%esp
c010a17e:	3c 01                	cmp    $0x1,%al
c010a180:	74 65                	je     c010a1e7 <insertToDoubleLinkList+0x80>
c010a182:	e8 de c9 ff ff       	call   c0106b65 <intr_disable>
c010a187:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a18a:	8b 45 0c             	mov    0xc(%ebp),%eax
c010a18d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a190:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a193:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c010a19a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a19d:	8b 50 04             	mov    0x4(%eax),%edx
c010a1a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a1a3:	89 10                	mov    %edx,(%eax)
c010a1a5:	8b 45 08             	mov    0x8(%ebp),%eax
c010a1a8:	8b 50 04             	mov    0x4(%eax),%edx
c010a1ab:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a1ae:	89 50 04             	mov    %edx,0x4(%eax)
c010a1b1:	8b 45 08             	mov    0x8(%ebp),%eax
c010a1b4:	8b 40 04             	mov    0x4(%eax),%eax
c010a1b7:	85 c0                	test   %eax,%eax
c010a1b9:	74 0b                	je     c010a1c6 <insertToDoubleLinkList+0x5f>
c010a1bb:	8b 45 08             	mov    0x8(%ebp),%eax
c010a1be:	8b 40 04             	mov    0x4(%eax),%eax
c010a1c1:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010a1c4:	89 10                	mov    %edx,(%eax)
c010a1c6:	8b 45 08             	mov    0x8(%ebp),%eax
c010a1c9:	8b 55 f0             	mov    -0x10(%ebp),%edx
c010a1cc:	89 50 04             	mov    %edx,0x4(%eax)
c010a1cf:	8b 55 08             	mov    0x8(%ebp),%edx
c010a1d2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a1d5:	89 10                	mov    %edx,(%eax)
c010a1d7:	83 ec 0c             	sub    $0xc,%esp
c010a1da:	ff 75 f4             	pushl  -0xc(%ebp)
c010a1dd:	e8 ac c9 ff ff       	call   c0106b8e <intr_set_status>
c010a1e2:	83 c4 10             	add    $0x10,%esp
c010a1e5:	eb 01                	jmp    c010a1e8 <insertToDoubleLinkList+0x81>
c010a1e7:	90                   	nop
c010a1e8:	c9                   	leave  
c010a1e9:	c3                   	ret    

c010a1ea <popFromDoubleLinkList>:
c010a1ea:	55                   	push   %ebp
c010a1eb:	89 e5                	mov    %esp,%ebp
c010a1ed:	83 ec 18             	sub    $0x18,%esp
c010a1f0:	e8 70 c9 ff ff       	call   c0106b65 <intr_disable>
c010a1f5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a1f8:	83 ec 0c             	sub    $0xc,%esp
c010a1fb:	ff 75 08             	pushl  0x8(%ebp)
c010a1fe:	e8 80 fd ff ff       	call   c0109f83 <isListEmpty>
c010a203:	83 c4 10             	add    $0x10,%esp
c010a206:	3c 01                	cmp    $0x1,%al
c010a208:	75 07                	jne    c010a211 <popFromDoubleLinkList+0x27>
c010a20a:	b8 00 00 00 00       	mov    $0x0,%eax
c010a20f:	eb 6b                	jmp    c010a27c <popFromDoubleLinkList+0x92>
c010a211:	8b 45 08             	mov    0x8(%ebp),%eax
c010a214:	8b 40 08             	mov    0x8(%eax),%eax
c010a217:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a21a:	8b 45 08             	mov    0x8(%ebp),%eax
c010a21d:	8b 40 08             	mov    0x8(%eax),%eax
c010a220:	85 c0                	test   %eax,%eax
c010a222:	75 07                	jne    c010a22b <popFromDoubleLinkList+0x41>
c010a224:	b8 00 00 00 00       	mov    $0x0,%eax
c010a229:	eb 51                	jmp    c010a27c <popFromDoubleLinkList+0x92>
c010a22b:	8b 45 08             	mov    0x8(%ebp),%eax
c010a22e:	8b 40 08             	mov    0x8(%eax),%eax
c010a231:	8b 00                	mov    (%eax),%eax
c010a233:	85 c0                	test   %eax,%eax
c010a235:	74 11                	je     c010a248 <popFromDoubleLinkList+0x5e>
c010a237:	8b 45 08             	mov    0x8(%ebp),%eax
c010a23a:	8b 40 08             	mov    0x8(%eax),%eax
c010a23d:	8b 00                	mov    (%eax),%eax
c010a23f:	8b 55 08             	mov    0x8(%ebp),%edx
c010a242:	83 c2 08             	add    $0x8,%edx
c010a245:	89 50 04             	mov    %edx,0x4(%eax)
c010a248:	8b 45 08             	mov    0x8(%ebp),%eax
c010a24b:	8b 40 08             	mov    0x8(%eax),%eax
c010a24e:	8b 10                	mov    (%eax),%edx
c010a250:	8b 45 08             	mov    0x8(%ebp),%eax
c010a253:	89 50 08             	mov    %edx,0x8(%eax)
c010a256:	83 ec 0c             	sub    $0xc,%esp
c010a259:	ff 75 f4             	pushl  -0xc(%ebp)
c010a25c:	e8 2d c9 ff ff       	call   c0106b8e <intr_set_status>
c010a261:	83 c4 10             	add    $0x10,%esp
c010a264:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a267:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c010a26e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a271:	8b 50 04             	mov    0x4(%eax),%edx
c010a274:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a277:	89 10                	mov    %edx,(%eax)
c010a279:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a27c:	c9                   	leave  
c010a27d:	c3                   	ret    

c010a27e <kernel_thread>:
c010a27e:	55                   	push   %ebp
c010a27f:	89 e5                	mov    %esp,%ebp
c010a281:	83 ec 08             	sub    $0x8,%esp
c010a284:	fb                   	sti    
c010a285:	83 ec 0c             	sub    $0xc,%esp
c010a288:	ff 75 0c             	pushl  0xc(%ebp)
c010a28b:	8b 45 08             	mov    0x8(%ebp),%eax
c010a28e:	ff d0                	call   *%eax
c010a290:	83 c4 10             	add    $0x10,%esp
c010a293:	90                   	nop
c010a294:	c9                   	leave  
c010a295:	c3                   	ret    

c010a296 <thread_init>:
c010a296:	55                   	push   %ebp
c010a297:	89 e5                	mov    %esp,%ebp
c010a299:	83 ec 18             	sub    $0x18,%esp
c010a29c:	83 ec 08             	sub    $0x8,%esp
c010a29f:	6a 00                	push   $0x0
c010a2a1:	6a 01                	push   $0x1
c010a2a3:	e8 ec bd ff ff       	call   c0106094 <alloc_memory>
c010a2a8:	83 c4 10             	add    $0x10,%esp
c010a2ab:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a2ae:	83 ec 04             	sub    $0x4,%esp
c010a2b1:	68 00 10 00 00       	push   $0x1000
c010a2b6:	6a 00                	push   $0x0
c010a2b8:	ff 75 f4             	pushl  -0xc(%ebp)
c010a2bb:	e8 b7 12 00 00       	call   c010b577 <Memset>
c010a2c0:	83 c4 10             	add    $0x10,%esp
c010a2c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a2c6:	05 00 10 00 00       	add    $0x1000,%eax
c010a2cb:	89 c2                	mov    %eax,%edx
c010a2cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a2d0:	89 10                	mov    %edx,(%eax)
c010a2d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a2d5:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c010a2dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a2df:	c7 80 58 02 00 00 ff 	movl   $0xffffffff,0x258(%eax)
c010a2e6:	ff ff ff 
c010a2e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a2ec:	c7 80 50 02 00 00 00 	movl   $0x0,0x250(%eax)
c010a2f3:	00 00 00 
c010a2f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a2f9:	8b 90 50 02 00 00    	mov    0x250(%eax),%edx
c010a2ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a302:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c010a308:	a1 90 f7 10 c0       	mov    0xc010f790,%eax
c010a30d:	83 c0 01             	add    $0x1,%eax
c010a310:	a3 90 f7 10 c0       	mov    %eax,0xc010f790
c010a315:	8b 15 90 f7 10 c0    	mov    0xc010f790,%edx
c010a31b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a31e:	89 90 14 01 00 00    	mov    %edx,0x114(%eax)
c010a324:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a327:	c7 80 18 01 00 00 0f 	movl   $0xf,0x118(%eax)
c010a32e:	00 00 00 
c010a331:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a334:	c7 80 b8 02 00 00 e0 	movl   $0x99abcde0,0x2b8(%eax)
c010a33b:	cd ab 99 
c010a33e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a341:	c9                   	leave  
c010a342:	c3                   	ret    

c010a343 <thread_create>:
c010a343:	55                   	push   %ebp
c010a344:	89 e5                	mov    %esp,%ebp
c010a346:	83 ec 10             	sub    $0x10,%esp
c010a349:	c7 45 fc 44 00 00 00 	movl   $0x44,-0x4(%ebp)
c010a350:	c7 45 f8 30 00 00 00 	movl   $0x30,-0x8(%ebp)
c010a357:	8b 45 08             	mov    0x8(%ebp),%eax
c010a35a:	8b 00                	mov    (%eax),%eax
c010a35c:	2b 45 fc             	sub    -0x4(%ebp),%eax
c010a35f:	89 c2                	mov    %eax,%edx
c010a361:	8b 45 08             	mov    0x8(%ebp),%eax
c010a364:	89 10                	mov    %edx,(%eax)
c010a366:	8b 45 08             	mov    0x8(%ebp),%eax
c010a369:	8b 00                	mov    (%eax),%eax
c010a36b:	2b 45 f8             	sub    -0x8(%ebp),%eax
c010a36e:	89 c2                	mov    %eax,%edx
c010a370:	8b 45 08             	mov    0x8(%ebp),%eax
c010a373:	89 10                	mov    %edx,(%eax)
c010a375:	90                   	nop
c010a376:	c9                   	leave  
c010a377:	c3                   	ret    

c010a378 <thread_start>:
c010a378:	55                   	push   %ebp
c010a379:	89 e5                	mov    %esp,%ebp
c010a37b:	83 ec 18             	sub    $0x18,%esp
c010a37e:	e8 13 ff ff ff       	call   c010a296 <thread_init>
c010a383:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010a386:	83 ec 0c             	sub    $0xc,%esp
c010a389:	ff 75 f4             	pushl  -0xc(%ebp)
c010a38c:	e8 b2 ff ff ff       	call   c010a343 <thread_create>
c010a391:	83 c4 10             	add    $0x10,%esp
c010a394:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a397:	05 28 01 00 00       	add    $0x128,%eax
c010a39c:	83 ec 08             	sub    $0x8,%esp
c010a39f:	ff 75 10             	pushl  0x10(%ebp)
c010a3a2:	50                   	push   %eax
c010a3a3:	e8 ee 11 00 00       	call   c010b596 <Strcpy>
c010a3a8:	83 c4 10             	add    $0x10,%esp
c010a3ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a3ae:	8b 00                	mov    (%eax),%eax
c010a3b0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010a3b3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a3b6:	c7 40 10 7e a2 10 c0 	movl   $0xc010a27e,0x10(%eax)
c010a3bd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a3c0:	8b 55 08             	mov    0x8(%ebp),%edx
c010a3c3:	89 50 18             	mov    %edx,0x18(%eax)
c010a3c6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a3c9:	8b 55 0c             	mov    0xc(%ebp),%edx
c010a3cc:	89 50 1c             	mov    %edx,0x1c(%eax)
c010a3cf:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a3d2:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010a3d8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a3db:	8b 10                	mov    (%eax),%edx
c010a3dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a3e0:	89 50 04             	mov    %edx,0x4(%eax)
c010a3e3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a3e6:	8b 50 04             	mov    0x4(%eax),%edx
c010a3e9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a3ec:	89 50 08             	mov    %edx,0x8(%eax)
c010a3ef:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a3f2:	8b 50 08             	mov    0x8(%eax),%edx
c010a3f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010a3f8:	89 50 0c             	mov    %edx,0xc(%eax)
c010a3fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a3fe:	05 60 02 00 00       	add    $0x260,%eax
c010a403:	83 ec 08             	sub    $0x8,%esp
c010a406:	50                   	push   %eax
c010a407:	68 ec fd 10 c0       	push   $0xc010fdec
c010a40c:	e8 6f fc ff ff       	call   c010a080 <appendToDoubleLinkList>
c010a411:	83 c4 10             	add    $0x10,%esp
c010a414:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010a417:	05 6a 02 00 00       	add    $0x26a,%eax
c010a41c:	83 ec 08             	sub    $0x8,%esp
c010a41f:	50                   	push   %eax
c010a420:	68 04 0f 11 c0       	push   $0xc0110f04
c010a425:	e8 56 fc ff ff       	call   c010a080 <appendToDoubleLinkList>
c010a42a:	83 c4 10             	add    $0x10,%esp
c010a42d:	90                   	nop
c010a42e:	c9                   	leave  
c010a42f:	c3                   	ret    
