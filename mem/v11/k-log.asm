
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
c010001e:	0f 01 05 c8 06 11 c0 	sgdtl  0xc01106c8
c0100025:	e8 a0 39 00 00       	call   c01039ca <ReloadGDT>
c010002a:	0f 01 15 c8 06 11 c0 	lgdtl  0xc01106c8
c0100031:	0f 01 1d 88 f7 10 c0 	lidtl  0xc010f788
c0100038:	0f a8                	push   %gs
c010003a:	0f a9                	pop    %gs
c010003c:	ea 43 00 10 c0 08 00 	ljmp   $0x8,$0xc0100043

c0100043 <csinit>:
c0100043:	31 c0                	xor    %eax,%eax
c0100045:	66 b8 40 00          	mov    $0x40,%ax
c0100049:	0f 00 d8             	ltr    %ax
c010004c:	31 c0                	xor    %eax,%eax
c010004e:	e9 52 03 00 00       	jmp    c01003a5 <kernel_main>
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
c010014b:	e8 7d 6e 00 00       	call   c0106fcd <exception_handler>
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
c0100168:	e8 60 6e 00 00       	call   c0106fcd <exception_handler>
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
c0100194:	e8 44 34 00 00       	call   c01035dd <clock_handler>
c0100199:	e9 e1 00 00 00       	jmp    c010027f <reenter_restore>

c010019e <hwint1>:
c010019e:	60                   	pusha  
c010019f:	1e                   	push   %ds
c01001a0:	06                   	push   %es
c01001a1:	0f a0                	push   %fs
c01001a3:	0f a8                	push   %gs
c01001a5:	66 8c d2             	mov    %ss,%dx
c01001a8:	8e da                	mov    %edx,%ds
c01001aa:	8e c2                	mov    %edx,%es
c01001ac:	8e e2                	mov    %edx,%fs
c01001ae:	b0 fa                	mov    $0xfa,%al
c01001b0:	e6 21                	out    %al,$0x21
c01001b2:	b0 20                	mov    $0x20,%al
c01001b4:	e6 20                	out    %al,$0x20
c01001b6:	ff 05 a8 f7 10 c0    	incl   0xc010f7a8
c01001bc:	83 3d a8 f7 10 c0 00 	cmpl   $0x0,0xc010f7a8
c01001c3:	75 00                	jne    c01001c5 <hwint1.1>

c01001c5 <hwint1.1>:
c01001c5:	e8 55 43 00 00       	call   c010451f <keyboard_handler>
c01001ca:	b0 f8                	mov    $0xf8,%al
c01001cc:	e6 21                	out    %al,$0x21
c01001ce:	83 3d a8 f7 10 c0 00 	cmpl   $0x0,0xc010f7a8
c01001d5:	0f 85 a4 00 00 00    	jne    c010027f <reenter_restore>
c01001db:	e9 9f 00 00 00       	jmp    c010027f <reenter_restore>

c01001e0 <hwint14>:
c01001e0:	60                   	pusha  
c01001e1:	1e                   	push   %ds
c01001e2:	06                   	push   %es
c01001e3:	0f a0                	push   %fs
c01001e5:	0f a8                	push   %gs
c01001e7:	66 8c d2             	mov    %ss,%dx
c01001ea:	8e da                	mov    %edx,%ds
c01001ec:	8e c2                	mov    %edx,%es
c01001ee:	8e e2                	mov    %edx,%fs
c01001f0:	b0 ff                	mov    $0xff,%al
c01001f2:	e6 a1                	out    %al,$0xa1
c01001f4:	b0 20                	mov    $0x20,%al
c01001f6:	e6 20                	out    %al,$0x20
c01001f8:	90                   	nop
c01001f9:	e6 a0                	out    %al,$0xa0
c01001fb:	ff 05 a8 f7 10 c0    	incl   0xc010f7a8
c0100201:	83 3d a8 f7 10 c0 00 	cmpl   $0x0,0xc010f7a8
c0100208:	75 00                	jne    c010020a <hwint14.1>

c010020a <hwint14.1>:
c010020a:	e8 99 10 00 00       	call   c01012a8 <hd_handler>
c010020f:	b0 bf                	mov    $0xbf,%al
c0100211:	e6 a1                	out    %al,$0xa1
c0100213:	83 3d a8 f7 10 c0 00 	cmpl   $0x0,0xc010f7a8
c010021a:	75 63                	jne    c010027f <reenter_restore>
c010021c:	eb 61                	jmp    c010027f <reenter_restore>

c010021e <sys_call>:
c010021e:	60                   	pusha  
c010021f:	1e                   	push   %ds
c0100220:	06                   	push   %es
c0100221:	0f a0                	push   %fs
c0100223:	0f a8                	push   %gs
c0100225:	89 e6                	mov    %esp,%esi
c0100227:	89 e5                	mov    %esp,%ebp
c0100229:	66 8c d2             	mov    %ss,%dx
c010022c:	8e da                	mov    %edx,%ds
c010022e:	8e c2                	mov    %edx,%es
c0100230:	8e e2                	mov    %edx,%fs
c0100232:	ff 05 a8 f7 10 c0    	incl   0xc010f7a8
c0100238:	83 3d a8 f7 10 c0 00 	cmpl   $0x0,0xc010f7a8
c010023f:	75 00                	jne    c0100241 <sys_call.1>

c0100241 <sys_call.1>:
c0100241:	56                   	push   %esi
c0100242:	ff 35 c0 fb 10 c0    	pushl  0xc010fbc0
c0100248:	53                   	push   %ebx
c0100249:	51                   	push   %ecx
c010024a:	ff 14 85 2c e1 10 c0 	call   *-0x3fef1ed4(,%eax,4)
c0100251:	83 c4 0c             	add    $0xc,%esp
c0100254:	5e                   	pop    %esi
c0100255:	89 45 2c             	mov    %eax,0x2c(%ebp)
c0100258:	83 3d a8 f7 10 c0 00 	cmpl   $0x0,0xc010f7a8
c010025f:	75 1e                	jne    c010027f <reenter_restore>
c0100261:	eb 1c                	jmp    c010027f <reenter_restore>

c0100263 <fork_restart>:
c0100263:	fa                   	cli    
c0100264:	0f a9                	pop    %gs
c0100266:	0f a1                	pop    %fs
c0100268:	07                   	pop    %es
c0100269:	1f                   	pop    %ds
c010026a:	61                   	popa   
c010026b:	cf                   	iret   

c010026c <restart>:
c010026c:	ff 0d a8 f7 10 c0    	decl   0xc010f7a8
c0100272:	89 e5                	mov    %esp,%ebp
c0100274:	8b 65 04             	mov    0x4(%ebp),%esp
c0100277:	0f a9                	pop    %gs
c0100279:	0f a1                	pop    %fs
c010027b:	07                   	pop    %es
c010027c:	1f                   	pop    %ds
c010027d:	61                   	popa   
c010027e:	cf                   	iret   

c010027f <reenter_restore>:
c010027f:	ff 0d a8 f7 10 c0    	decl   0xc010f7a8
c0100285:	0f a9                	pop    %gs
c0100287:	0f a1                	pop    %fs
c0100289:	07                   	pop    %es
c010028a:	1f                   	pop    %ds
c010028b:	61                   	popa   
c010028c:	cf                   	iret   

c010028d <in_byte>:
c010028d:	31 d2                	xor    %edx,%edx
c010028f:	8b 54 24 04          	mov    0x4(%esp),%edx
c0100293:	31 c0                	xor    %eax,%eax
c0100295:	ec                   	in     (%dx),%al
c0100296:	90                   	nop
c0100297:	90                   	nop
c0100298:	c3                   	ret    

c0100299 <out_byte>:
c0100299:	31 d2                	xor    %edx,%edx
c010029b:	31 c0                	xor    %eax,%eax
c010029d:	8b 54 24 04          	mov    0x4(%esp),%edx
c01002a1:	8a 44 24 08          	mov    0x8(%esp),%al
c01002a5:	ee                   	out    %al,(%dx)
c01002a6:	90                   	nop
c01002a7:	90                   	nop
c01002a8:	c3                   	ret    

c01002a9 <in_byte2>:
c01002a9:	55                   	push   %ebp
c01002aa:	89 e5                	mov    %esp,%ebp
c01002ac:	52                   	push   %edx
c01002ad:	31 d2                	xor    %edx,%edx
c01002af:	66 8b 55 08          	mov    0x8(%ebp),%dx
c01002b3:	31 c0                	xor    %eax,%eax
c01002b5:	ec                   	in     (%dx),%al
c01002b6:	90                   	nop
c01002b7:	90                   	nop
c01002b8:	5b                   	pop    %ebx
c01002b9:	5d                   	pop    %ebp
c01002ba:	c3                   	ret    

c01002bb <disable_int>:
c01002bb:	fa                   	cli    
c01002bc:	c3                   	ret    

c01002bd <enable_int>:
c01002bd:	fb                   	sti    
c01002be:	c3                   	ret    

c01002bf <check_tss_esp0>:
c01002bf:	55                   	push   %ebp
c01002c0:	89 e5                	mov    %esp,%ebp
c01002c2:	8b 45 08             	mov    0x8(%ebp),%eax
c01002c5:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c01002c8:	83 c0 44             	add    $0x44,%eax
c01002cb:	8b 15 44 06 11 c0    	mov    0xc0110644,%edx
c01002d1:	39 d0                	cmp    %edx,%eax
c01002d3:	74 7c                	je     c0100351 <check_tss_esp0.2>

c01002d5 <check_tss_esp0.1>:
c01002d5:	50                   	push   %eax
c01002d6:	52                   	push   %edx
c01002d7:	68 10 e0 10 c0       	push   $0xc010e010
c01002dc:	e8 ab fd ff ff       	call   c010008c <disp_str>
c01002e1:	83 c4 04             	add    $0x4,%esp
c01002e4:	5a                   	pop    %edx
c01002e5:	58                   	pop    %eax
c01002e6:	52                   	push   %edx
c01002e7:	50                   	push   %eax
c01002e8:	53                   	push   %ebx
c01002e9:	e8 79 6b 00 00       	call   c0106e67 <disp_int>
c01002ee:	83 c4 04             	add    $0x4,%esp
c01002f1:	58                   	pop    %eax
c01002f2:	5a                   	pop    %edx
c01002f3:	52                   	push   %edx
c01002f4:	50                   	push   %eax
c01002f5:	e8 6d 6b 00 00       	call   c0106e67 <disp_int>
c01002fa:	58                   	pop    %eax
c01002fb:	5a                   	pop    %edx
c01002fc:	52                   	push   %edx
c01002fd:	50                   	push   %eax
c01002fe:	ff 35 a8 f7 10 c0    	pushl  0xc010f7a8
c0100304:	e8 5e 6b 00 00       	call   c0106e67 <disp_int>
c0100309:	83 c4 04             	add    $0x4,%esp
c010030c:	58                   	pop    %eax
c010030d:	5a                   	pop    %edx
c010030e:	52                   	push   %edx
c010030f:	50                   	push   %eax
c0100310:	ff 72 ec             	pushl  -0x14(%edx)
c0100313:	e8 4f 6b 00 00       	call   c0106e67 <disp_int>
c0100318:	83 c4 04             	add    $0x4,%esp
c010031b:	58                   	pop    %eax
c010031c:	5a                   	pop    %edx
c010031d:	52                   	push   %edx
c010031e:	50                   	push   %eax
c010031f:	ff 70 ec             	pushl  -0x14(%eax)
c0100322:	e8 40 6b 00 00       	call   c0106e67 <disp_int>
c0100327:	83 c4 04             	add    $0x4,%esp
c010032a:	58                   	pop    %eax
c010032b:	5a                   	pop    %edx
c010032c:	52                   	push   %edx
c010032d:	50                   	push   %eax
c010032e:	ff 35 c0 fb 10 c0    	pushl  0xc010fbc0
c0100334:	e8 2e 6b 00 00       	call   c0106e67 <disp_int>
c0100339:	83 c4 04             	add    $0x4,%esp
c010033c:	58                   	pop    %eax
c010033d:	5a                   	pop    %edx
c010033e:	52                   	push   %edx
c010033f:	50                   	push   %eax
c0100340:	68 60 f7 10 c0       	push   $0xc010f760
c0100345:	e8 1d 6b 00 00       	call   c0106e67 <disp_int>
c010034a:	83 c4 04             	add    $0x4,%esp
c010034d:	58                   	pop    %eax
c010034e:	5a                   	pop    %edx
c010034f:	5d                   	pop    %ebp
c0100350:	c3                   	ret    

c0100351 <check_tss_esp0.2>:
c0100351:	5d                   	pop    %ebp
c0100352:	c3                   	ret    

c0100353 <enable_8259A_casecade_irq>:
c0100353:	9c                   	pushf  
c0100354:	fa                   	cli    
c0100355:	e4 21                	in     $0x21,%al
c0100357:	24 fb                	and    $0xfb,%al
c0100359:	e6 21                	out    %al,$0x21
c010035b:	9d                   	popf   
c010035c:	c3                   	ret    

c010035d <disable_8259A_casecade_irq>:
c010035d:	9c                   	pushf  
c010035e:	fa                   	cli    
c010035f:	e4 21                	in     $0x21,%al
c0100361:	0c 04                	or     $0x4,%al
c0100363:	e6 21                	out    %al,$0x21
c0100365:	9c                   	pushf  
c0100366:	c3                   	ret    

c0100367 <enable_8259A_slave_winchester_irq>:
c0100367:	9c                   	pushf  
c0100368:	fa                   	cli    
c0100369:	e4 a1                	in     $0xa1,%al
c010036b:	24 bf                	and    $0xbf,%al
c010036d:	e6 a1                	out    %al,$0xa1
c010036f:	9d                   	popf   
c0100370:	c3                   	ret    

c0100371 <disable_8259A_slave_winchester_irq>:
c0100371:	9c                   	pushf  
c0100372:	fa                   	cli    
c0100373:	e4 a1                	in     $0xa1,%al
c0100375:	0c 40                	or     $0x40,%al
c0100377:	e6 a1                	out    %al,$0xa1
c0100379:	9d                   	popf   
c010037a:	c3                   	ret    

c010037b <update_cr3>:
c010037b:	55                   	push   %ebp
c010037c:	89 e5                	mov    %esp,%ebp
c010037e:	8b 45 08             	mov    0x8(%ebp),%eax
c0100381:	0f 22 d8             	mov    %eax,%cr3
c0100384:	89 ec                	mov    %ebp,%esp
c0100386:	5d                   	pop    %ebp
c0100387:	c3                   	ret    

c0100388 <update_tss>:
c0100388:	55                   	push   %ebp
c0100389:	89 e5                	mov    %esp,%ebp
c010038b:	8b 45 08             	mov    0x8(%ebp),%eax
c010038e:	a3 44 06 11 c0       	mov    %eax,0xc0110644
c0100393:	89 ec                	mov    %ebp,%esp
c0100395:	5d                   	pop    %ebp
c0100396:	c3                   	ret    

c0100397 <get_running_thread_pcb>:
c0100397:	89 e0                	mov    %esp,%eax
c0100399:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010039e:	c3                   	ret    

c010039f <sys_call_test>:
c010039f:	9c                   	pushf  
c01003a0:	66 87 db             	xchg   %bx,%bx
c01003a3:	9d                   	popf   
c01003a4:	c3                   	ret    

c01003a5 <kernel_main>:
c01003a5:	55                   	push   %ebp
c01003a6:	89 e5                	mov    %esp,%ebp
c01003a8:	83 ec 08             	sub    $0x8,%esp
c01003ab:	e8 d0 00 00 00       	call   c0100480 <init>
c01003b0:	e8 e2 ff ff ff       	call   c0100397 <get_running_thread_pcb>
c01003b5:	a3 e0 0e 11 c0       	mov    %eax,0xc0110ee0
c01003ba:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c01003bf:	05 00 01 00 00       	add    $0x100,%eax
c01003c4:	83 ec 08             	sub    $0x8,%esp
c01003c7:	50                   	push   %eax
c01003c8:	68 ec fd 10 c0       	push   $0xc010fdec
c01003cd:	e8 fe 96 00 00       	call   c0109ad0 <appendToDoubleLinkList>
c01003d2:	83 c4 10             	add    $0x10,%esp
c01003d5:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c01003da:	05 08 01 00 00       	add    $0x108,%eax
c01003df:	83 ec 08             	sub    $0x8,%esp
c01003e2:	50                   	push   %eax
c01003e3:	68 ec fd 10 c0       	push   $0xc010fdec
c01003e8:	e8 e3 96 00 00       	call   c0109ad0 <appendToDoubleLinkList>
c01003ed:	83 c4 10             	add    $0x10,%esp
c01003f0:	6a 00                	push   $0x0
c01003f2:	68 80 9e 10 c0       	push   $0xc0109e80
c01003f7:	68 87 9e 10 c0       	push   $0xc0109e87
c01003fc:	68 7c 4f 10 c0       	push   $0xc0104f7c
c0100401:	e8 11 94 00 00       	call   c0109817 <process_execute>
c0100406:	83 c4 10             	add    $0x10,%esp
c0100409:	6a 00                	push   $0x0
c010040b:	68 90 9e 10 c0       	push   $0xc0109e90
c0100410:	68 98 9e 10 c0       	push   $0xc0109e98
c0100415:	68 a9 14 10 c0       	push   $0xc01014a9
c010041a:	e8 f8 93 00 00       	call   c0109817 <process_execute>
c010041f:	83 c4 10             	add    $0x10,%esp
c0100422:	6a 00                	push   $0x0
c0100424:	68 a1 9e 10 c0       	push   $0xc0109ea1
c0100429:	68 a8 9e 10 c0       	push   $0xc0109ea8
c010042e:	68 20 06 10 c0       	push   $0xc0100620
c0100433:	e8 df 93 00 00       	call   c0109817 <process_execute>
c0100438:	83 c4 10             	add    $0x10,%esp
c010043b:	6a 00                	push   $0x0
c010043d:	68 b1 9e 10 c0       	push   $0xc0109eb1
c0100442:	68 b9 9e 10 c0       	push   $0xc0109eb9
c0100447:	68 1c 44 10 c0       	push   $0xc010441c
c010044c:	e8 c6 93 00 00       	call   c0109817 <process_execute>
c0100451:	83 c4 10             	add    $0x10,%esp
c0100454:	6a 01                	push   $0x1
c0100456:	68 c3 9e 10 c0       	push   $0xc0109ec3
c010045b:	68 cd 9e 10 c0       	push   $0xc0109ecd
c0100460:	68 f6 05 10 c0       	push   $0xc01005f6
c0100465:	e8 ad 93 00 00       	call   c0109817 <process_execute>
c010046a:	83 c4 10             	add    $0x10,%esp
c010046d:	83 ec 0c             	sub    $0xc,%esp
c0100470:	68 da 9e 10 c0       	push   $0xc0109eda
c0100475:	e8 12 fc ff ff       	call   c010008c <disp_str>
c010047a:	83 c4 10             	add    $0x10,%esp
c010047d:	fb                   	sti    
c010047e:	eb fe                	jmp    c010047e <kernel_main+0xd9>

c0100480 <init>:
c0100480:	55                   	push   %ebp
c0100481:	89 e5                	mov    %esp,%ebp
c0100483:	83 ec 18             	sub    $0x18,%esp
c0100486:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c010048d:	00 00 00 
c0100490:	c7 05 90 f7 10 c0 00 	movl   $0x0,0xc010f790
c0100497:	00 00 00 
c010049a:	c7 05 fc fd 10 c0 09 	movl   $0x9,0xc010fdfc
c01004a1:	00 00 00 
c01004a4:	c7 05 c0 fb 10 c0 00 	movl   $0x0,0xc010fbc0
c01004ab:	00 00 00 
c01004ae:	83 ec 0c             	sub    $0xc,%esp
c01004b1:	68 e4 9e 10 c0       	push   $0xc0109ee4
c01004b6:	e8 d1 fb ff ff       	call   c010008c <disp_str>
c01004bb:	83 c4 10             	add    $0x10,%esp
c01004be:	e8 f4 6e 00 00       	call   c01073b7 <init_keyboard>
c01004c3:	83 ec 0c             	sub    $0xc,%esp
c01004c6:	68 00 00 00 04       	push   $0x4000000
c01004cb:	e8 bb 63 00 00       	call   c010688b <init_memory>
c01004d0:	83 c4 10             	add    $0x10,%esp
c01004d3:	83 ec 0c             	sub    $0xc,%esp
c01004d6:	68 ec fd 10 c0       	push   $0xc010fdec
c01004db:	e8 c5 94 00 00       	call   c01099a5 <initDoubleLinkList>
c01004e0:	83 c4 10             	add    $0x10,%esp
c01004e3:	83 ec 0c             	sub    $0xc,%esp
c01004e6:	68 04 0f 11 c0       	push   $0xc0110f04
c01004eb:	e8 b5 94 00 00       	call   c01099a5 <initDoubleLinkList>
c01004f0:	83 c4 10             	add    $0x10,%esp
c01004f3:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c01004fa:	00 00 00 
c01004fd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100504:	eb 14                	jmp    c010051a <init+0x9a>
c0100506:	83 ec 0c             	sub    $0xc,%esp
c0100509:	68 ea 9e 10 c0       	push   $0xc0109eea
c010050e:	e8 79 fb ff ff       	call   c010008c <disp_str>
c0100513:	83 c4 10             	add    $0x10,%esp
c0100516:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c010051a:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c0100521:	7e e3                	jle    c0100506 <init+0x86>
c0100523:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c010052a:	00 00 00 
c010052d:	90                   	nop
c010052e:	c9                   	leave  
c010052f:	c3                   	ret    

c0100530 <kernel_thread_a>:
c0100530:	55                   	push   %ebp
c0100531:	89 e5                	mov    %esp,%ebp
c0100533:	83 ec 18             	sub    $0x18,%esp
c0100536:	83 ec 0c             	sub    $0xc,%esp
c0100539:	ff 75 08             	pushl  0x8(%ebp)
c010053c:	e8 4b fb ff ff       	call   c010008c <disp_str>
c0100541:	83 c4 10             	add    $0x10,%esp
c0100544:	a1 a4 f7 10 c0       	mov    0xc010f7a4,%eax
c0100549:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010054c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0100553:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100556:	a3 a4 f7 10 c0       	mov    %eax,0xc010f7a4
c010055b:	83 ec 0c             	sub    $0xc,%esp
c010055e:	68 eb 9e 10 c0       	push   $0xc0109eeb
c0100563:	e8 24 fb ff ff       	call   c010008c <disp_str>
c0100568:	83 c4 10             	add    $0x10,%esp
c010056b:	83 ec 0c             	sub    $0xc,%esp
c010056e:	68 f4 9e 10 c0       	push   $0xc0109ef4
c0100573:	e8 14 fb ff ff       	call   c010008c <disp_str>
c0100578:	83 c4 10             	add    $0x10,%esp
c010057b:	eb d6                	jmp    c0100553 <kernel_thread_a+0x23>

c010057d <kernel_thread_b>:
c010057d:	55                   	push   %ebp
c010057e:	89 e5                	mov    %esp,%ebp
c0100580:	83 ec 18             	sub    $0x18,%esp
c0100583:	83 ec 0c             	sub    $0xc,%esp
c0100586:	ff 75 08             	pushl  0x8(%ebp)
c0100589:	e8 fe fa ff ff       	call   c010008c <disp_str>
c010058e:	83 c4 10             	add    $0x10,%esp
c0100591:	a1 a4 f7 10 c0       	mov    0xc010f7a4,%eax
c0100596:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0100599:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01005a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01005a3:	a3 a4 f7 10 c0       	mov    %eax,0xc010f7a4
c01005a8:	83 ec 0c             	sub    $0xc,%esp
c01005ab:	68 f6 9e 10 c0       	push   $0xc0109ef6
c01005b0:	e8 d7 fa ff ff       	call   c010008c <disp_str>
c01005b5:	83 c4 10             	add    $0x10,%esp
c01005b8:	83 ec 0c             	sub    $0xc,%esp
c01005bb:	68 f4 9e 10 c0       	push   $0xc0109ef4
c01005c0:	e8 c7 fa ff ff       	call   c010008c <disp_str>
c01005c5:	83 c4 10             	add    $0x10,%esp
c01005c8:	eb d6                	jmp    c01005a0 <kernel_thread_b+0x23>

c01005ca <kernel_thread_c>:
c01005ca:	55                   	push   %ebp
c01005cb:	89 e5                	mov    %esp,%ebp
c01005cd:	83 ec 08             	sub    $0x8,%esp
c01005d0:	83 ec 0c             	sub    $0xc,%esp
c01005d3:	ff 75 08             	pushl  0x8(%ebp)
c01005d6:	e8 b1 fa ff ff       	call   c010008c <disp_str>
c01005db:	83 c4 10             	add    $0x10,%esp
c01005de:	eb fe                	jmp    c01005de <kernel_thread_c+0x14>

c01005e0 <kernel_thread_d>:
c01005e0:	55                   	push   %ebp
c01005e1:	89 e5                	mov    %esp,%ebp
c01005e3:	83 ec 08             	sub    $0x8,%esp
c01005e6:	83 ec 0c             	sub    $0xc,%esp
c01005e9:	ff 75 08             	pushl  0x8(%ebp)
c01005ec:	e8 9b fa ff ff       	call   c010008c <disp_str>
c01005f1:	83 c4 10             	add    $0x10,%esp
c01005f4:	eb fe                	jmp    c01005f4 <kernel_thread_d+0x14>

c01005f6 <user_proc_a>:
c01005f6:	55                   	push   %ebp
c01005f7:	89 e5                	mov    %esp,%ebp
c01005f9:	83 ec 18             	sub    $0x18,%esp
c01005fc:	c7 45 f4 05 00 00 00 	movl   $0x5,-0xc(%ebp)
c0100603:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100606:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100609:	83 ec 0c             	sub    $0xc,%esp
c010060c:	68 ff 9e 10 c0       	push   $0xc0109eff
c0100611:	e8 76 fa ff ff       	call   c010008c <disp_str>
c0100616:	83 c4 10             	add    $0x10,%esp
c0100619:	e8 7b 73 00 00       	call   c0107999 <INIT_fork>
c010061e:	eb fe                	jmp    c010061e <user_proc_a+0x28>

c0100620 <TaskHD>:
c0100620:	55                   	push   %ebp
c0100621:	89 e5                	mov    %esp,%ebp
c0100623:	83 ec 18             	sub    $0x18,%esp
c0100626:	e8 6c fd ff ff       	call   c0100397 <get_running_thread_pcb>
c010062b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010062e:	e8 32 00 00 00       	call   c0100665 <init_hd>
c0100633:	83 ec 0c             	sub    $0xc,%esp
c0100636:	6a 7c                	push   $0x7c
c0100638:	e8 3f 0e 00 00       	call   c010147c <sys_malloc>
c010063d:	83 c4 10             	add    $0x10,%esp
c0100640:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100643:	83 ec 04             	sub    $0x4,%esp
c0100646:	6a 7c                	push   $0x7c
c0100648:	6a 00                	push   $0x0
c010064a:	ff 75 f0             	pushl  -0x10(%ebp)
c010064d:	e8 cd a5 00 00       	call   c010ac1f <Memset>
c0100652:	83 c4 10             	add    $0x10,%esp
c0100655:	83 ec 0c             	sub    $0xc,%esp
c0100658:	ff 75 f0             	pushl  -0x10(%ebp)
c010065b:	e8 1f 00 00 00       	call   c010067f <hd_handle>
c0100660:	83 c4 10             	add    $0x10,%esp
c0100663:	eb de                	jmp    c0100643 <TaskHD+0x23>

c0100665 <init_hd>:
c0100665:	55                   	push   %ebp
c0100666:	89 e5                	mov    %esp,%ebp
c0100668:	83 ec 18             	sub    $0x18,%esp
c010066b:	c7 45 f4 75 04 00 00 	movl   $0x475,-0xc(%ebp)
c0100672:	e8 dc fc ff ff       	call   c0100353 <enable_8259A_casecade_irq>
c0100677:	e8 eb fc ff ff       	call   c0100367 <enable_8259A_slave_winchester_irq>
c010067c:	90                   	nop
c010067d:	c9                   	leave  
c010067e:	c3                   	ret    

c010067f <hd_handle>:
c010067f:	55                   	push   %ebp
c0100680:	89 e5                	mov    %esp,%ebp
c0100682:	83 ec 18             	sub    $0x18,%esp
c0100685:	83 ec 04             	sub    $0x4,%esp
c0100688:	6a 12                	push   $0x12
c010068a:	ff 75 08             	pushl  0x8(%ebp)
c010068d:	6a 02                	push   $0x2
c010068f:	e8 e0 87 00 00       	call   c0108e74 <send_rec>
c0100694:	83 c4 10             	add    $0x10,%esp
c0100697:	8b 45 08             	mov    0x8(%ebp),%eax
c010069a:	8b 40 78             	mov    0x78(%eax),%eax
c010069d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01006a0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01006a4:	0f 84 d4 00 00 00    	je     c010077e <hd_handle+0xff>
c01006aa:	8b 45 08             	mov    0x8(%ebp),%eax
c01006ad:	8b 00                	mov    (%eax),%eax
c01006af:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01006b2:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c01006b6:	74 28                	je     c01006e0 <hd_handle+0x61>
c01006b8:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c01006bc:	74 22                	je     c01006e0 <hd_handle+0x61>
c01006be:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c01006c2:	74 1c                	je     c01006e0 <hd_handle+0x61>
c01006c4:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c01006c8:	74 16                	je     c01006e0 <hd_handle+0x61>
c01006ca:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c01006d1:	74 0d                	je     c01006e0 <hd_handle+0x61>
c01006d3:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c01006da:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01006dd:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01006e0:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c01006e4:	74 34                	je     c010071a <hd_handle+0x9b>
c01006e6:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c01006ea:	74 2e                	je     c010071a <hd_handle+0x9b>
c01006ec:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c01006f0:	74 28                	je     c010071a <hd_handle+0x9b>
c01006f2:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c01006f6:	74 22                	je     c010071a <hd_handle+0x9b>
c01006f8:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c01006ff:	74 19                	je     c010071a <hd_handle+0x9b>
c0100701:	6a 6d                	push   $0x6d
c0100703:	68 14 9f 10 c0       	push   $0xc0109f14
c0100708:	68 14 9f 10 c0       	push   $0xc0109f14
c010070d:	68 1c 9f 10 c0       	push   $0xc0109f1c
c0100712:	e8 40 7d 00 00       	call   c0108457 <assertion_failure>
c0100717:	83 c4 10             	add    $0x10,%esp
c010071a:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c010071e:	74 2c                	je     c010074c <hd_handle+0xcd>
c0100720:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c0100724:	77 0e                	ja     c0100734 <hd_handle+0xb5>
c0100726:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c010072a:	74 19                	je     c0100745 <hd_handle+0xc6>
c010072c:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c0100730:	74 1a                	je     c010074c <hd_handle+0xcd>
c0100732:	eb 37                	jmp    c010076b <hd_handle+0xec>
c0100734:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c0100738:	74 22                	je     c010075c <hd_handle+0xdd>
c010073a:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c0100741:	74 3e                	je     c0100781 <hd_handle+0x102>
c0100743:	eb 26                	jmp    c010076b <hd_handle+0xec>
c0100745:	e8 e6 06 00 00       	call   c0100e30 <hd_open>
c010074a:	eb 36                	jmp    c0100782 <hd_handle+0x103>
c010074c:	83 ec 0c             	sub    $0xc,%esp
c010074f:	ff 75 08             	pushl  0x8(%ebp)
c0100752:	e8 b2 08 00 00       	call   c0101009 <hd_rdwt>
c0100757:	83 c4 10             	add    $0x10,%esp
c010075a:	eb 26                	jmp    c0100782 <hd_handle+0x103>
c010075c:	83 ec 0c             	sub    $0xc,%esp
c010075f:	6a 00                	push   $0x0
c0100761:	e8 71 07 00 00       	call   c0100ed7 <get_hd_ioctl>
c0100766:	83 c4 10             	add    $0x10,%esp
c0100769:	eb 17                	jmp    c0100782 <hd_handle+0x103>
c010076b:	83 ec 0c             	sub    $0xc,%esp
c010076e:	68 76 9f 10 c0       	push   $0xc0109f76
c0100773:	e8 9b 7c 00 00       	call   c0108413 <spin>
c0100778:	83 c4 10             	add    $0x10,%esp
c010077b:	90                   	nop
c010077c:	eb 04                	jmp    c0100782 <hd_handle+0x103>
c010077e:	90                   	nop
c010077f:	eb 01                	jmp    c0100782 <hd_handle+0x103>
c0100781:	90                   	nop
c0100782:	c9                   	leave  
c0100783:	c3                   	ret    

c0100784 <hd_cmd_out>:
c0100784:	55                   	push   %ebp
c0100785:	89 e5                	mov    %esp,%ebp
c0100787:	83 ec 08             	sub    $0x8,%esp
c010078a:	83 ec 04             	sub    $0x4,%esp
c010078d:	68 18 73 01 00       	push   $0x17318
c0100792:	6a 00                	push   $0x0
c0100794:	68 80 00 00 00       	push   $0x80
c0100799:	e8 36 0b 00 00       	call   c01012d4 <waitfor>
c010079e:	83 c4 10             	add    $0x10,%esp
c01007a1:	85 c0                	test   %eax,%eax
c01007a3:	75 10                	jne    c01007b5 <hd_cmd_out+0x31>
c01007a5:	83 ec 0c             	sub    $0xc,%esp
c01007a8:	68 88 9f 10 c0       	push   $0xc0109f88
c01007ad:	e8 87 7c 00 00       	call   c0108439 <panic>
c01007b2:	83 c4 10             	add    $0x10,%esp
c01007b5:	83 ec 08             	sub    $0x8,%esp
c01007b8:	6a 00                	push   $0x0
c01007ba:	68 f6 03 00 00       	push   $0x3f6
c01007bf:	e8 d5 fa ff ff       	call   c0100299 <out_byte>
c01007c4:	83 c4 10             	add    $0x10,%esp
c01007c7:	8b 45 08             	mov    0x8(%ebp),%eax
c01007ca:	0f b6 00             	movzbl (%eax),%eax
c01007cd:	0f b6 c0             	movzbl %al,%eax
c01007d0:	83 ec 08             	sub    $0x8,%esp
c01007d3:	50                   	push   %eax
c01007d4:	68 f1 01 00 00       	push   $0x1f1
c01007d9:	e8 bb fa ff ff       	call   c0100299 <out_byte>
c01007de:	83 c4 10             	add    $0x10,%esp
c01007e1:	8b 45 08             	mov    0x8(%ebp),%eax
c01007e4:	0f b6 40 01          	movzbl 0x1(%eax),%eax
c01007e8:	0f b6 c0             	movzbl %al,%eax
c01007eb:	83 ec 08             	sub    $0x8,%esp
c01007ee:	50                   	push   %eax
c01007ef:	68 f2 01 00 00       	push   $0x1f2
c01007f4:	e8 a0 fa ff ff       	call   c0100299 <out_byte>
c01007f9:	83 c4 10             	add    $0x10,%esp
c01007fc:	8b 45 08             	mov    0x8(%ebp),%eax
c01007ff:	0f b6 40 02          	movzbl 0x2(%eax),%eax
c0100803:	0f b6 c0             	movzbl %al,%eax
c0100806:	83 ec 08             	sub    $0x8,%esp
c0100809:	50                   	push   %eax
c010080a:	68 f3 01 00 00       	push   $0x1f3
c010080f:	e8 85 fa ff ff       	call   c0100299 <out_byte>
c0100814:	83 c4 10             	add    $0x10,%esp
c0100817:	8b 45 08             	mov    0x8(%ebp),%eax
c010081a:	0f b6 40 03          	movzbl 0x3(%eax),%eax
c010081e:	0f b6 c0             	movzbl %al,%eax
c0100821:	83 ec 08             	sub    $0x8,%esp
c0100824:	50                   	push   %eax
c0100825:	68 f4 01 00 00       	push   $0x1f4
c010082a:	e8 6a fa ff ff       	call   c0100299 <out_byte>
c010082f:	83 c4 10             	add    $0x10,%esp
c0100832:	8b 45 08             	mov    0x8(%ebp),%eax
c0100835:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0100839:	0f b6 c0             	movzbl %al,%eax
c010083c:	83 ec 08             	sub    $0x8,%esp
c010083f:	50                   	push   %eax
c0100840:	68 f5 01 00 00       	push   $0x1f5
c0100845:	e8 4f fa ff ff       	call   c0100299 <out_byte>
c010084a:	83 c4 10             	add    $0x10,%esp
c010084d:	8b 45 08             	mov    0x8(%ebp),%eax
c0100850:	0f b6 40 05          	movzbl 0x5(%eax),%eax
c0100854:	0f b6 c0             	movzbl %al,%eax
c0100857:	83 ec 08             	sub    $0x8,%esp
c010085a:	50                   	push   %eax
c010085b:	68 f6 01 00 00       	push   $0x1f6
c0100860:	e8 34 fa ff ff       	call   c0100299 <out_byte>
c0100865:	83 c4 10             	add    $0x10,%esp
c0100868:	8b 45 08             	mov    0x8(%ebp),%eax
c010086b:	0f b6 40 06          	movzbl 0x6(%eax),%eax
c010086f:	0f b6 c0             	movzbl %al,%eax
c0100872:	83 ec 08             	sub    $0x8,%esp
c0100875:	50                   	push   %eax
c0100876:	68 f7 01 00 00       	push   $0x1f7
c010087b:	e8 19 fa ff ff       	call   c0100299 <out_byte>
c0100880:	83 c4 10             	add    $0x10,%esp
c0100883:	90                   	nop
c0100884:	c9                   	leave  
c0100885:	c3                   	ret    

c0100886 <hd_identify>:
c0100886:	55                   	push   %ebp
c0100887:	89 e5                	mov    %esp,%ebp
c0100889:	53                   	push   %ebx
c010088a:	83 ec 24             	sub    $0x24,%esp
c010088d:	89 e0                	mov    %esp,%eax
c010088f:	89 c3                	mov    %eax,%ebx
c0100891:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
c0100895:	c6 45 e6 01          	movb   $0x1,-0x1a(%ebp)
c0100899:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
c010089d:	c6 45 e8 00          	movb   $0x0,-0x18(%ebp)
c01008a1:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c01008a5:	8b 45 08             	mov    0x8(%ebp),%eax
c01008a8:	c1 e0 04             	shl    $0x4,%eax
c01008ab:	83 c8 e0             	or     $0xffffffe0,%eax
c01008ae:	88 45 ea             	mov    %al,-0x16(%ebp)
c01008b1:	c6 45 eb ec          	movb   $0xec,-0x15(%ebp)
c01008b5:	83 ec 0c             	sub    $0xc,%esp
c01008b8:	8d 45 e5             	lea    -0x1b(%ebp),%eax
c01008bb:	50                   	push   %eax
c01008bc:	e8 c3 fe ff ff       	call   c0100784 <hd_cmd_out>
c01008c1:	83 c4 10             	add    $0x10,%esp
c01008c4:	e8 f0 06 00 00       	call   c0100fb9 <interrupt_wait>
c01008c9:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c01008d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01008d3:	8d 50 ff             	lea    -0x1(%eax),%edx
c01008d6:	89 55 f0             	mov    %edx,-0x10(%ebp)
c01008d9:	89 c2                	mov    %eax,%edx
c01008db:	b8 10 00 00 00       	mov    $0x10,%eax
c01008e0:	83 e8 01             	sub    $0x1,%eax
c01008e3:	01 d0                	add    %edx,%eax
c01008e5:	b9 10 00 00 00       	mov    $0x10,%ecx
c01008ea:	ba 00 00 00 00       	mov    $0x0,%edx
c01008ef:	f7 f1                	div    %ecx
c01008f1:	6b c0 10             	imul   $0x10,%eax,%eax
c01008f4:	29 c4                	sub    %eax,%esp
c01008f6:	89 e0                	mov    %esp,%eax
c01008f8:	83 c0 00             	add    $0x0,%eax
c01008fb:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01008fe:	83 ec 04             	sub    $0x4,%esp
c0100901:	ff 75 f4             	pushl  -0xc(%ebp)
c0100904:	6a 00                	push   $0x0
c0100906:	ff 75 ec             	pushl  -0x14(%ebp)
c0100909:	e8 11 a3 00 00       	call   c010ac1f <Memset>
c010090e:	83 c4 10             	add    $0x10,%esp
c0100911:	83 ec 04             	sub    $0x4,%esp
c0100914:	ff 75 f4             	pushl  -0xc(%ebp)
c0100917:	ff 75 ec             	pushl  -0x14(%ebp)
c010091a:	68 f0 01 00 00       	push   $0x1f0
c010091f:	e8 4f a3 00 00       	call   c010ac73 <read_port>
c0100924:	83 c4 10             	add    $0x10,%esp
c0100927:	83 ec 0c             	sub    $0xc,%esp
c010092a:	ff 75 ec             	pushl  -0x14(%ebp)
c010092d:	e8 0b 00 00 00       	call   c010093d <print_hdinfo>
c0100932:	83 c4 10             	add    $0x10,%esp
c0100935:	89 dc                	mov    %ebx,%esp
c0100937:	90                   	nop
c0100938:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c010093b:	c9                   	leave  
c010093c:	c3                   	ret    

c010093d <print_hdinfo>:
c010093d:	55                   	push   %ebp
c010093e:	89 e5                	mov    %esp,%ebp
c0100940:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0100946:	66 c7 45 b4 0a 00    	movw   $0xa,-0x4c(%ebp)
c010094c:	66 c7 45 b6 14 00    	movw   $0x14,-0x4a(%ebp)
c0100952:	c7 45 b8 53 65 72 69 	movl   $0x69726553,-0x48(%ebp)
c0100959:	c7 45 bc 61 6c 20 4e 	movl   $0x4e206c61,-0x44(%ebp)
c0100960:	c7 45 c0 75 6d 62 65 	movl   $0x65626d75,-0x40(%ebp)
c0100967:	c7 45 c4 72 00 00 00 	movl   $0x72,-0x3c(%ebp)
c010096e:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0100975:	66 c7 45 cc 1b 00    	movw   $0x1b,-0x34(%ebp)
c010097b:	66 c7 45 ce 28 00    	movw   $0x28,-0x32(%ebp)
c0100981:	c7 45 d0 4d 6f 64 65 	movl   $0x65646f4d,-0x30(%ebp)
c0100988:	c7 45 d4 6c 20 4e 75 	movl   $0x754e206c,-0x2c(%ebp)
c010098f:	c7 45 d8 6d 62 65 72 	movl   $0x7265626d,-0x28(%ebp)
c0100996:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c010099d:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c01009a4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01009ab:	e9 8f 00 00 00       	jmp    c0100a3f <print_hdinfo+0x102>
c01009b0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01009b7:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01009ba:	89 d0                	mov    %edx,%eax
c01009bc:	01 c0                	add    %eax,%eax
c01009be:	01 d0                	add    %edx,%eax
c01009c0:	c1 e0 03             	shl    $0x3,%eax
c01009c3:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c01009c6:	01 c8                	add    %ecx,%eax
c01009c8:	83 e8 44             	sub    $0x44,%eax
c01009cb:	0f b7 00             	movzwl (%eax),%eax
c01009ce:	0f b7 c0             	movzwl %ax,%eax
c01009d1:	8d 14 00             	lea    (%eax,%eax,1),%edx
c01009d4:	8b 45 08             	mov    0x8(%ebp),%eax
c01009d7:	01 d0                	add    %edx,%eax
c01009d9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01009dc:	eb 30                	jmp    c0100a0e <print_hdinfo+0xd1>
c01009de:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01009e1:	8d 50 01             	lea    0x1(%eax),%edx
c01009e4:	89 55 ec             	mov    %edx,-0x14(%ebp)
c01009e7:	8b 55 f0             	mov    -0x10(%ebp),%edx
c01009ea:	83 c2 01             	add    $0x1,%edx
c01009ed:	0f b6 00             	movzbl (%eax),%eax
c01009f0:	88 44 15 81          	mov    %al,-0x7f(%ebp,%edx,1)
c01009f4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01009f7:	8d 50 01             	lea    0x1(%eax),%edx
c01009fa:	89 55 ec             	mov    %edx,-0x14(%ebp)
c01009fd:	0f b6 00             	movzbl (%eax),%eax
c0100a00:	8d 4d 81             	lea    -0x7f(%ebp),%ecx
c0100a03:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0100a06:	01 ca                	add    %ecx,%edx
c0100a08:	88 02                	mov    %al,(%edx)
c0100a0a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0100a0e:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100a11:	89 d0                	mov    %edx,%eax
c0100a13:	01 c0                	add    %eax,%eax
c0100a15:	01 d0                	add    %edx,%eax
c0100a17:	c1 e0 03             	shl    $0x3,%eax
c0100a1a:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100a1d:	01 c8                	add    %ecx,%eax
c0100a1f:	83 e8 42             	sub    $0x42,%eax
c0100a22:	0f b7 00             	movzwl (%eax),%eax
c0100a25:	66 d1 e8             	shr    %ax
c0100a28:	0f b7 c0             	movzwl %ax,%eax
c0100a2b:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0100a2e:	7c ae                	jl     c01009de <print_hdinfo+0xa1>
c0100a30:	8d 55 81             	lea    -0x7f(%ebp),%edx
c0100a33:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100a36:	01 d0                	add    %edx,%eax
c0100a38:	c6 00 00             	movb   $0x0,(%eax)
c0100a3b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0100a3f:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0100a43:	0f 8e 67 ff ff ff    	jle    c01009b0 <print_hdinfo+0x73>
c0100a49:	8b 45 08             	mov    0x8(%ebp),%eax
c0100a4c:	0f b7 40 62          	movzwl 0x62(%eax),%eax
c0100a50:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
c0100a54:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0100a58:	66 c1 e8 08          	shr    $0x8,%ax
c0100a5c:	66 85 c0             	test   %ax,%ax
c0100a5f:	0f 95 c0             	setne  %al
c0100a62:	88 45 e9             	mov    %al,-0x17(%ebp)
c0100a65:	c7 45 ac 59 65 73 00 	movl   $0x736559,-0x54(%ebp)
c0100a6c:	66 c7 45 a9 4e 6f    	movw   $0x6f4e,-0x57(%ebp)
c0100a72:	c6 45 ab 00          	movb   $0x0,-0x55(%ebp)
c0100a76:	80 7d e9 01          	cmpb   $0x1,-0x17(%ebp)
c0100a7a:	75 15                	jne    c0100a91 <print_hdinfo+0x154>
c0100a7c:	83 ec 08             	sub    $0x8,%esp
c0100a7f:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0100a82:	50                   	push   %eax
c0100a83:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0100a86:	50                   	push   %eax
c0100a87:	e8 b2 a1 00 00       	call   c010ac3e <Strcpy>
c0100a8c:	83 c4 10             	add    $0x10,%esp
c0100a8f:	eb 13                	jmp    c0100aa4 <print_hdinfo+0x167>
c0100a91:	83 ec 08             	sub    $0x8,%esp
c0100a94:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0100a97:	50                   	push   %eax
c0100a98:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0100a9b:	50                   	push   %eax
c0100a9c:	e8 9d a1 00 00       	call   c010ac3e <Strcpy>
c0100aa1:	83 c4 10             	add    $0x10,%esp
c0100aa4:	8b 45 08             	mov    0x8(%ebp),%eax
c0100aa7:	83 c0 7a             	add    $0x7a,%eax
c0100aaa:	0f b7 00             	movzwl (%eax),%eax
c0100aad:	0f b7 d0             	movzwl %ax,%edx
c0100ab0:	8b 45 08             	mov    0x8(%ebp),%eax
c0100ab3:	83 c0 78             	add    $0x78,%eax
c0100ab6:	0f b7 00             	movzwl (%eax),%eax
c0100ab9:	0f b7 c0             	movzwl %ax,%eax
c0100abc:	83 c0 10             	add    $0x10,%eax
c0100abf:	89 c1                	mov    %eax,%ecx
c0100ac1:	d3 e2                	shl    %cl,%edx
c0100ac3:	89 d0                	mov    %edx,%eax
c0100ac5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0100ac8:	90                   	nop
c0100ac9:	c9                   	leave  
c0100aca:	c3                   	ret    

c0100acb <print_dpt_entry>:
c0100acb:	55                   	push   %ebp
c0100acc:	89 e5                	mov    %esp,%ebp
c0100ace:	83 ec 08             	sub    $0x8,%esp
c0100ad1:	8b 45 08             	mov    0x8(%ebp),%eax
c0100ad4:	8b 40 08             	mov    0x8(%eax),%eax
c0100ad7:	83 ec 08             	sub    $0x8,%esp
c0100ada:	50                   	push   %eax
c0100adb:	68 92 9f 10 c0       	push   $0xc0109f92
c0100ae0:	e8 15 76 00 00       	call   c01080fa <Printf>
c0100ae5:	83 c4 10             	add    $0x10,%esp
c0100ae8:	8b 45 08             	mov    0x8(%ebp),%eax
c0100aeb:	8b 40 0c             	mov    0xc(%eax),%eax
c0100aee:	83 ec 08             	sub    $0x8,%esp
c0100af1:	50                   	push   %eax
c0100af2:	68 9a 9f 10 c0       	push   $0xc0109f9a
c0100af7:	e8 fe 75 00 00       	call   c01080fa <Printf>
c0100afc:	83 c4 10             	add    $0x10,%esp
c0100aff:	8b 45 08             	mov    0x8(%ebp),%eax
c0100b02:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0100b06:	0f b6 c0             	movzbl %al,%eax
c0100b09:	83 ec 08             	sub    $0x8,%esp
c0100b0c:	50                   	push   %eax
c0100b0d:	68 ab 9f 10 c0       	push   $0xc0109fab
c0100b12:	e8 e3 75 00 00       	call   c01080fa <Printf>
c0100b17:	83 c4 10             	add    $0x10,%esp
c0100b1a:	8b 45 08             	mov    0x8(%ebp),%eax
c0100b1d:	0f b6 00             	movzbl (%eax),%eax
c0100b20:	0f b6 c0             	movzbl %al,%eax
c0100b23:	83 ec 08             	sub    $0x8,%esp
c0100b26:	50                   	push   %eax
c0100b27:	68 b9 9f 10 c0       	push   $0xc0109fb9
c0100b2c:	e8 c9 75 00 00       	call   c01080fa <Printf>
c0100b31:	83 c4 10             	add    $0x10,%esp
c0100b34:	90                   	nop
c0100b35:	c9                   	leave  
c0100b36:	c3                   	ret    

c0100b37 <get_partition_table>:
c0100b37:	55                   	push   %ebp
c0100b38:	89 e5                	mov    %esp,%ebp
c0100b3a:	53                   	push   %ebx
c0100b3b:	83 ec 24             	sub    $0x24,%esp
c0100b3e:	89 e0                	mov    %esp,%eax
c0100b40:	89 c3                	mov    %eax,%ebx
c0100b42:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
c0100b46:	c6 45 e2 01          	movb   $0x1,-0x1e(%ebp)
c0100b4a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100b4d:	88 45 e3             	mov    %al,-0x1d(%ebp)
c0100b50:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100b53:	c1 f8 08             	sar    $0x8,%eax
c0100b56:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0100b59:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100b5c:	c1 f8 10             	sar    $0x10,%eax
c0100b5f:	88 45 e5             	mov    %al,-0x1b(%ebp)
c0100b62:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100b65:	c1 f8 18             	sar    $0x18,%eax
c0100b68:	89 c2                	mov    %eax,%edx
c0100b6a:	8b 45 08             	mov    0x8(%ebp),%eax
c0100b6d:	c1 e0 04             	shl    $0x4,%eax
c0100b70:	09 d0                	or     %edx,%eax
c0100b72:	83 c8 e0             	or     $0xffffffe0,%eax
c0100b75:	88 45 e6             	mov    %al,-0x1a(%ebp)
c0100b78:	c6 45 e7 20          	movb   $0x20,-0x19(%ebp)
c0100b7c:	83 ec 0c             	sub    $0xc,%esp
c0100b7f:	8d 45 e1             	lea    -0x1f(%ebp),%eax
c0100b82:	50                   	push   %eax
c0100b83:	e8 fc fb ff ff       	call   c0100784 <hd_cmd_out>
c0100b88:	83 c4 10             	add    $0x10,%esp
c0100b8b:	e8 29 04 00 00       	call   c0100fb9 <interrupt_wait>
c0100b90:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c0100b97:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100b9a:	8d 50 ff             	lea    -0x1(%eax),%edx
c0100b9d:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0100ba0:	89 c2                	mov    %eax,%edx
c0100ba2:	b8 10 00 00 00       	mov    $0x10,%eax
c0100ba7:	83 e8 01             	sub    $0x1,%eax
c0100baa:	01 d0                	add    %edx,%eax
c0100bac:	b9 10 00 00 00       	mov    $0x10,%ecx
c0100bb1:	ba 00 00 00 00       	mov    $0x0,%edx
c0100bb6:	f7 f1                	div    %ecx
c0100bb8:	6b c0 10             	imul   $0x10,%eax,%eax
c0100bbb:	29 c4                	sub    %eax,%esp
c0100bbd:	89 e0                	mov    %esp,%eax
c0100bbf:	83 c0 00             	add    $0x0,%eax
c0100bc2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0100bc5:	83 ec 04             	sub    $0x4,%esp
c0100bc8:	ff 75 f4             	pushl  -0xc(%ebp)
c0100bcb:	6a 00                	push   $0x0
c0100bcd:	ff 75 ec             	pushl  -0x14(%ebp)
c0100bd0:	e8 4a a0 00 00       	call   c010ac1f <Memset>
c0100bd5:	83 c4 10             	add    $0x10,%esp
c0100bd8:	83 ec 04             	sub    $0x4,%esp
c0100bdb:	ff 75 f4             	pushl  -0xc(%ebp)
c0100bde:	ff 75 ec             	pushl  -0x14(%ebp)
c0100be1:	68 f0 01 00 00       	push   $0x1f0
c0100be6:	e8 88 a0 00 00       	call   c010ac73 <read_port>
c0100beb:	83 c4 10             	add    $0x10,%esp
c0100bee:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100bf1:	05 be 01 00 00       	add    $0x1be,%eax
c0100bf6:	83 ec 04             	sub    $0x4,%esp
c0100bf9:	6a 40                	push   $0x40
c0100bfb:	50                   	push   %eax
c0100bfc:	ff 75 10             	pushl  0x10(%ebp)
c0100bff:	e8 7a 5e 00 00       	call   c0106a7e <Memcpy>
c0100c04:	83 c4 10             	add    $0x10,%esp
c0100c07:	c7 45 e8 05 00 00 00 	movl   $0x5,-0x18(%ebp)
c0100c0e:	89 dc                	mov    %ebx,%esp
c0100c10:	90                   	nop
c0100c11:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100c14:	c9                   	leave  
c0100c15:	c3                   	ret    

c0100c16 <partition>:
c0100c16:	55                   	push   %ebp
c0100c17:	89 e5                	mov    %esp,%ebp
c0100c19:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0100c1f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100c22:	88 45 84             	mov    %al,-0x7c(%ebp)
c0100c25:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c0100c29:	7f 19                	jg     c0100c44 <partition+0x2e>
c0100c2b:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0100c2e:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0100c33:	89 c8                	mov    %ecx,%eax
c0100c35:	f7 ea                	imul   %edx
c0100c37:	d1 fa                	sar    %edx
c0100c39:	89 c8                	mov    %ecx,%eax
c0100c3b:	c1 f8 1f             	sar    $0x1f,%eax
c0100c3e:	29 c2                	sub    %eax,%edx
c0100c40:	89 d0                	mov    %edx,%eax
c0100c42:	eb 11                	jmp    c0100c55 <partition+0x3f>
c0100c44:	8b 45 08             	mov    0x8(%ebp),%eax
c0100c47:	83 e8 10             	sub    $0x10,%eax
c0100c4a:	8d 50 3f             	lea    0x3f(%eax),%edx
c0100c4d:	85 c0                	test   %eax,%eax
c0100c4f:	0f 48 c2             	cmovs  %edx,%eax
c0100c52:	c1 f8 06             	sar    $0x6,%eax
c0100c55:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0100c58:	80 7d 84 00          	cmpb   $0x0,-0x7c(%ebp)
c0100c5c:	0f 85 cc 00 00 00    	jne    c0100d2e <partition+0x118>
c0100c62:	83 ec 04             	sub    $0x4,%esp
c0100c65:	6a 40                	push   $0x40
c0100c67:	6a 00                	push   $0x0
c0100c69:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100c6c:	50                   	push   %eax
c0100c6d:	e8 ad 9f 00 00       	call   c010ac1f <Memset>
c0100c72:	83 c4 10             	add    $0x10,%esp
c0100c75:	83 ec 04             	sub    $0x4,%esp
c0100c78:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100c7b:	50                   	push   %eax
c0100c7c:	6a 00                	push   $0x0
c0100c7e:	ff 75 e8             	pushl  -0x18(%ebp)
c0100c81:	e8 b1 fe ff ff       	call   c0100b37 <get_partition_table>
c0100c86:	83 c4 10             	add    $0x10,%esp
c0100c89:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100c90:	e9 8a 00 00 00       	jmp    c0100d1f <partition+0x109>
c0100c95:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100c98:	83 c0 01             	add    $0x1,%eax
c0100c9b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0100c9e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100ca1:	c1 e0 04             	shl    $0x4,%eax
c0100ca4:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100ca7:	01 c8                	add    %ecx,%eax
c0100ca9:	83 e8 5c             	sub    $0x5c,%eax
c0100cac:	8b 00                	mov    (%eax),%eax
c0100cae:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0100cb1:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0100cb4:	c1 e1 03             	shl    $0x3,%ecx
c0100cb7:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0100cbd:	01 ca                	add    %ecx,%edx
c0100cbf:	81 c2 44 0f 11 c0    	add    $0xc0110f44,%edx
c0100cc5:	89 02                	mov    %eax,(%edx)
c0100cc7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100cca:	c1 e0 04             	shl    $0x4,%eax
c0100ccd:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100cd0:	01 c8                	add    %ecx,%eax
c0100cd2:	83 e8 58             	sub    $0x58,%eax
c0100cd5:	8b 00                	mov    (%eax),%eax
c0100cd7:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0100cda:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0100cdd:	c1 e1 03             	shl    $0x3,%ecx
c0100ce0:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0100ce6:	01 ca                	add    %ecx,%edx
c0100ce8:	81 c2 48 0f 11 c0    	add    $0xc0110f48,%edx
c0100cee:	89 02                	mov    %eax,(%edx)
c0100cf0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100cf3:	c1 e0 04             	shl    $0x4,%eax
c0100cf6:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100cf9:	01 c8                	add    %ecx,%eax
c0100cfb:	83 e8 60             	sub    $0x60,%eax
c0100cfe:	0f b6 00             	movzbl (%eax),%eax
c0100d01:	3c 05                	cmp    $0x5,%al
c0100d03:	75 16                	jne    c0100d1b <partition+0x105>
c0100d05:	8b 55 08             	mov    0x8(%ebp),%edx
c0100d08:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100d0b:	01 d0                	add    %edx,%eax
c0100d0d:	83 ec 08             	sub    $0x8,%esp
c0100d10:	6a 01                	push   $0x1
c0100d12:	50                   	push   %eax
c0100d13:	e8 fe fe ff ff       	call   c0100c16 <partition>
c0100d18:	83 c4 10             	add    $0x10,%esp
c0100d1b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0100d1f:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c0100d23:	0f 8e 6c ff ff ff    	jle    c0100c95 <partition+0x7f>
c0100d29:	e9 ff 00 00 00       	jmp    c0100e2d <partition+0x217>
c0100d2e:	80 7d 84 01          	cmpb   $0x1,-0x7c(%ebp)
c0100d32:	0f 85 f5 00 00 00    	jne    c0100e2d <partition+0x217>
c0100d38:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0100d3b:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0100d40:	89 c8                	mov    %ecx,%eax
c0100d42:	f7 ea                	imul   %edx
c0100d44:	d1 fa                	sar    %edx
c0100d46:	89 c8                	mov    %ecx,%eax
c0100d48:	c1 f8 1f             	sar    $0x1f,%eax
c0100d4b:	29 c2                	sub    %eax,%edx
c0100d4d:	89 d0                	mov    %edx,%eax
c0100d4f:	c1 e0 02             	shl    $0x2,%eax
c0100d52:	01 d0                	add    %edx,%eax
c0100d54:	29 c1                	sub    %eax,%ecx
c0100d56:	89 c8                	mov    %ecx,%eax
c0100d58:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0100d5b:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0100d5e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100d61:	c1 e2 03             	shl    $0x3,%edx
c0100d64:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0100d6a:	01 d0                	add    %edx,%eax
c0100d6c:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c0100d71:	8b 00                	mov    (%eax),%eax
c0100d73:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0100d76:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0100d79:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100d7c:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0100d7f:	83 e8 01             	sub    $0x1,%eax
c0100d82:	c1 e0 04             	shl    $0x4,%eax
c0100d85:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0100d88:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0100d8f:	e9 8c 00 00 00       	jmp    c0100e20 <partition+0x20a>
c0100d94:	83 ec 04             	sub    $0x4,%esp
c0100d97:	6a 40                	push   $0x40
c0100d99:	6a 00                	push   $0x0
c0100d9b:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100d9e:	50                   	push   %eax
c0100d9f:	e8 7b 9e 00 00       	call   c010ac1f <Memset>
c0100da4:	83 c4 10             	add    $0x10,%esp
c0100da7:	83 ec 04             	sub    $0x4,%esp
c0100daa:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100dad:	50                   	push   %eax
c0100dae:	ff 75 f0             	pushl  -0x10(%ebp)
c0100db1:	ff 75 e8             	pushl  -0x18(%ebp)
c0100db4:	e8 7e fd ff ff       	call   c0100b37 <get_partition_table>
c0100db9:	83 c4 10             	add    $0x10,%esp
c0100dbc:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0100dbf:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100dc2:	01 d0                	add    %edx,%eax
c0100dc4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0100dc7:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0100dca:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100dcd:	01 c2                	add    %eax,%edx
c0100dcf:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0100dd2:	8d 48 04             	lea    0x4(%eax),%ecx
c0100dd5:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100dd8:	c1 e1 03             	shl    $0x3,%ecx
c0100ddb:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0100de1:	01 c8                	add    %ecx,%eax
c0100de3:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c0100de8:	89 10                	mov    %edx,(%eax)
c0100dea:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0100ded:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0100df0:	8d 4a 04             	lea    0x4(%edx),%ecx
c0100df3:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0100df6:	c1 e1 03             	shl    $0x3,%ecx
c0100df9:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0100dff:	01 ca                	add    %ecx,%edx
c0100e01:	81 c2 48 0f 11 c0    	add    $0xc0110f48,%edx
c0100e07:	89 02                	mov    %eax,(%edx)
c0100e09:	0f b6 45 a8          	movzbl -0x58(%ebp),%eax
c0100e0d:	84 c0                	test   %al,%al
c0100e0f:	74 1b                	je     c0100e2c <partition+0x216>
c0100e11:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0100e14:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0100e17:	01 d0                	add    %edx,%eax
c0100e19:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100e1c:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0100e20:	83 7d ec 0f          	cmpl   $0xf,-0x14(%ebp)
c0100e24:	0f 8e 6a ff ff ff    	jle    c0100d94 <partition+0x17e>
c0100e2a:	eb 01                	jmp    c0100e2d <partition+0x217>
c0100e2c:	90                   	nop
c0100e2d:	90                   	nop
c0100e2e:	c9                   	leave  
c0100e2f:	c3                   	ret    

c0100e30 <hd_open>:
c0100e30:	55                   	push   %ebp
c0100e31:	89 e5                	mov    %esp,%ebp
c0100e33:	83 ec 18             	sub    $0x18,%esp
c0100e36:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100e3d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100e40:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0100e46:	05 40 0f 11 c0       	add    $0xc0110f40,%eax
c0100e4b:	8b 00                	mov    (%eax),%eax
c0100e4d:	8d 50 01             	lea    0x1(%eax),%edx
c0100e50:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100e53:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0100e59:	05 40 0f 11 c0       	add    $0xc0110f40,%eax
c0100e5e:	89 10                	mov    %edx,(%eax)
c0100e60:	83 ec 0c             	sub    $0xc,%esp
c0100e63:	6a 00                	push   $0x0
c0100e65:	e8 1c fa ff ff       	call   c0100886 <hd_identify>
c0100e6a:	83 c4 10             	add    $0x10,%esp
c0100e6d:	83 ec 08             	sub    $0x8,%esp
c0100e70:	6a 00                	push   $0x0
c0100e72:	6a 00                	push   $0x0
c0100e74:	e8 9d fd ff ff       	call   c0100c16 <partition>
c0100e79:	83 c4 10             	add    $0x10,%esp
c0100e7c:	83 ec 0c             	sub    $0xc,%esp
c0100e7f:	6a 7c                	push   $0x7c
c0100e81:	e8 f6 05 00 00       	call   c010147c <sys_malloc>
c0100e86:	83 c4 10             	add    $0x10,%esp
c0100e89:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100e8c:	83 ec 04             	sub    $0x4,%esp
c0100e8f:	6a 7c                	push   $0x7c
c0100e91:	6a 00                	push   $0x0
c0100e93:	ff 75 f0             	pushl  -0x10(%ebp)
c0100e96:	e8 84 9d 00 00       	call   c010ac1f <Memset>
c0100e9b:	83 c4 10             	add    $0x10,%esp
c0100e9e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100ea1:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0100ea8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100eab:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0100eb2:	83 ec 04             	sub    $0x4,%esp
c0100eb5:	6a 02                	push   $0x2
c0100eb7:	ff 75 f0             	pushl  -0x10(%ebp)
c0100eba:	6a 01                	push   $0x1
c0100ebc:	e8 b3 7f 00 00       	call   c0108e74 <send_rec>
c0100ec1:	83 c4 10             	add    $0x10,%esp
c0100ec4:	83 ec 08             	sub    $0x8,%esp
c0100ec7:	6a 7c                	push   $0x7c
c0100ec9:	ff 75 f0             	pushl  -0x10(%ebp)
c0100ecc:	e8 c0 05 00 00       	call   c0101491 <sys_free>
c0100ed1:	83 c4 10             	add    $0x10,%esp
c0100ed4:	90                   	nop
c0100ed5:	c9                   	leave  
c0100ed6:	c3                   	ret    

c0100ed7 <get_hd_ioctl>:
c0100ed7:	55                   	push   %ebp
c0100ed8:	89 e5                	mov    %esp,%ebp
c0100eda:	83 ec 18             	sub    $0x18,%esp
c0100edd:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c0100ee1:	7f 19                	jg     c0100efc <get_hd_ioctl+0x25>
c0100ee3:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0100ee6:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0100eeb:	89 c8                	mov    %ecx,%eax
c0100eed:	f7 ea                	imul   %edx
c0100eef:	d1 fa                	sar    %edx
c0100ef1:	89 c8                	mov    %ecx,%eax
c0100ef3:	c1 f8 1f             	sar    $0x1f,%eax
c0100ef6:	29 c2                	sub    %eax,%edx
c0100ef8:	89 d0                	mov    %edx,%eax
c0100efa:	eb 11                	jmp    c0100f0d <get_hd_ioctl+0x36>
c0100efc:	8b 45 08             	mov    0x8(%ebp),%eax
c0100eff:	83 e8 10             	sub    $0x10,%eax
c0100f02:	8d 50 3f             	lea    0x3f(%eax),%edx
c0100f05:	85 c0                	test   %eax,%eax
c0100f07:	0f 48 c2             	cmovs  %edx,%eax
c0100f0a:	c1 f8 06             	sar    $0x6,%eax
c0100f0d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0100f10:	8b 55 08             	mov    0x8(%ebp),%edx
c0100f13:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100f16:	c1 e2 03             	shl    $0x3,%edx
c0100f19:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0100f1f:	01 d0                	add    %edx,%eax
c0100f21:	05 48 0f 11 c0       	add    $0xc0110f48,%eax
c0100f26:	8b 00                	mov    (%eax),%eax
c0100f28:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100f2b:	83 ec 0c             	sub    $0xc,%esp
c0100f2e:	6a 7c                	push   $0x7c
c0100f30:	e8 47 05 00 00       	call   c010147c <sys_malloc>
c0100f35:	83 c4 10             	add    $0x10,%esp
c0100f38:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0100f3b:	83 ec 04             	sub    $0x4,%esp
c0100f3e:	6a 7c                	push   $0x7c
c0100f40:	6a 00                	push   $0x0
c0100f42:	ff 75 ec             	pushl  -0x14(%ebp)
c0100f45:	e8 d5 9c 00 00       	call   c010ac1f <Memset>
c0100f4a:	83 c4 10             	add    $0x10,%esp
c0100f4d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100f50:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0100f57:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100f5a:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0100f61:	83 ec 04             	sub    $0x4,%esp
c0100f64:	6a 02                	push   $0x2
c0100f66:	ff 75 ec             	pushl  -0x14(%ebp)
c0100f69:	6a 01                	push   $0x1
c0100f6b:	e8 04 7f 00 00       	call   c0108e74 <send_rec>
c0100f70:	83 c4 10             	add    $0x10,%esp
c0100f73:	83 ec 08             	sub    $0x8,%esp
c0100f76:	6a 7c                	push   $0x7c
c0100f78:	ff 75 ec             	pushl  -0x14(%ebp)
c0100f7b:	e8 11 05 00 00       	call   c0101491 <sys_free>
c0100f80:	83 c4 10             	add    $0x10,%esp
c0100f83:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100f86:	c9                   	leave  
c0100f87:	c3                   	ret    

c0100f88 <wait_for>:
c0100f88:	55                   	push   %ebp
c0100f89:	89 e5                	mov    %esp,%ebp
c0100f8b:	83 ec 08             	sub    $0x8,%esp
c0100f8e:	83 ec 04             	sub    $0x4,%esp
c0100f91:	68 50 c3 00 00       	push   $0xc350
c0100f96:	6a 08                	push   $0x8
c0100f98:	6a 08                	push   $0x8
c0100f9a:	e8 35 03 00 00       	call   c01012d4 <waitfor>
c0100f9f:	83 c4 10             	add    $0x10,%esp
c0100fa2:	85 c0                	test   %eax,%eax
c0100fa4:	75 10                	jne    c0100fb6 <wait_for+0x2e>
c0100fa6:	83 ec 0c             	sub    $0xc,%esp
c0100fa9:	68 c4 9f 10 c0       	push   $0xc0109fc4
c0100fae:	e8 86 74 00 00       	call   c0108439 <panic>
c0100fb3:	83 c4 10             	add    $0x10,%esp
c0100fb6:	90                   	nop
c0100fb7:	c9                   	leave  
c0100fb8:	c3                   	ret    

c0100fb9 <interrupt_wait>:
c0100fb9:	55                   	push   %ebp
c0100fba:	89 e5                	mov    %esp,%ebp
c0100fbc:	83 ec 18             	sub    $0x18,%esp
c0100fbf:	83 ec 0c             	sub    $0xc,%esp
c0100fc2:	6a 7c                	push   $0x7c
c0100fc4:	e8 b3 04 00 00       	call   c010147c <sys_malloc>
c0100fc9:	83 c4 10             	add    $0x10,%esp
c0100fcc:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0100fcf:	83 ec 04             	sub    $0x4,%esp
c0100fd2:	6a 7c                	push   $0x7c
c0100fd4:	6a 00                	push   $0x0
c0100fd6:	ff 75 f4             	pushl  -0xc(%ebp)
c0100fd9:	e8 41 9c 00 00       	call   c010ac1f <Memset>
c0100fde:	83 c4 10             	add    $0x10,%esp
c0100fe1:	83 ec 04             	sub    $0x4,%esp
c0100fe4:	68 13 02 00 00       	push   $0x213
c0100fe9:	ff 75 f4             	pushl  -0xc(%ebp)
c0100fec:	6a 02                	push   $0x2
c0100fee:	e8 81 7e 00 00       	call   c0108e74 <send_rec>
c0100ff3:	83 c4 10             	add    $0x10,%esp
c0100ff6:	83 ec 08             	sub    $0x8,%esp
c0100ff9:	6a 7c                	push   $0x7c
c0100ffb:	ff 75 f4             	pushl  -0xc(%ebp)
c0100ffe:	e8 8e 04 00 00       	call   c0101491 <sys_free>
c0101003:	83 c4 10             	add    $0x10,%esp
c0101006:	90                   	nop
c0101007:	c9                   	leave  
c0101008:	c3                   	ret    

c0101009 <hd_rdwt>:
c0101009:	55                   	push   %ebp
c010100a:	89 e5                	mov    %esp,%ebp
c010100c:	81 ec c8 00 00 00    	sub    $0xc8,%esp
c0101012:	8b 45 08             	mov    0x8(%ebp),%eax
c0101015:	8b 40 18             	mov    0x18(%eax),%eax
c0101018:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010101b:	8b 45 08             	mov    0x8(%ebp),%eax
c010101e:	8b 40 14             	mov    0x14(%eax),%eax
c0101021:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0101024:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c0101028:	7f 19                	jg     c0101043 <hd_rdwt+0x3a>
c010102a:	8b 4d e8             	mov    -0x18(%ebp),%ecx
c010102d:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0101032:	89 c8                	mov    %ecx,%eax
c0101034:	f7 ea                	imul   %edx
c0101036:	d1 fa                	sar    %edx
c0101038:	89 c8                	mov    %ecx,%eax
c010103a:	c1 f8 1f             	sar    $0x1f,%eax
c010103d:	29 c2                	sub    %eax,%edx
c010103f:	89 d0                	mov    %edx,%eax
c0101041:	eb 11                	jmp    c0101054 <hd_rdwt+0x4b>
c0101043:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101046:	83 e8 10             	sub    $0x10,%eax
c0101049:	8d 50 3f             	lea    0x3f(%eax),%edx
c010104c:	85 c0                	test   %eax,%eax
c010104e:	0f 48 c2             	cmovs  %edx,%eax
c0101051:	c1 f8 06             	sar    $0x6,%eax
c0101054:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0101057:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010105a:	8d 50 f0             	lea    -0x10(%eax),%edx
c010105d:	89 d0                	mov    %edx,%eax
c010105f:	c1 f8 1f             	sar    $0x1f,%eax
c0101062:	c1 e8 1a             	shr    $0x1a,%eax
c0101065:	01 c2                	add    %eax,%edx
c0101067:	83 e2 3f             	and    $0x3f,%edx
c010106a:	29 c2                	sub    %eax,%edx
c010106c:	89 d0                	mov    %edx,%eax
c010106e:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0101071:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101074:	c1 e8 09             	shr    $0x9,%eax
c0101077:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010107a:	83 7d e8 08          	cmpl   $0x8,-0x18(%ebp)
c010107e:	7f 1a                	jg     c010109a <hd_rdwt+0x91>
c0101080:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0101083:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101086:	c1 e2 03             	shl    $0x3,%edx
c0101089:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c010108f:	01 d0                	add    %edx,%eax
c0101091:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c0101096:	8b 00                	mov    (%eax),%eax
c0101098:	eb 1b                	jmp    c01010b5 <hd_rdwt+0xac>
c010109a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010109d:	8d 50 04             	lea    0x4(%eax),%edx
c01010a0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01010a3:	c1 e2 03             	shl    $0x3,%edx
c01010a6:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c01010ac:	01 d0                	add    %edx,%eax
c01010ae:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c01010b3:	8b 00                	mov    (%eax),%eax
c01010b5:	8b 55 dc             	mov    -0x24(%ebp),%edx
c01010b8:	01 d0                	add    %edx,%eax
c01010ba:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01010bd:	8b 45 08             	mov    0x8(%ebp),%eax
c01010c0:	8b 40 0c             	mov    0xc(%eax),%eax
c01010c3:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01010c6:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01010c9:	05 ff 01 00 00       	add    $0x1ff,%eax
c01010ce:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c01010d4:	85 c0                	test   %eax,%eax
c01010d6:	0f 48 c2             	cmovs  %edx,%eax
c01010d9:	c1 f8 09             	sar    $0x9,%eax
c01010dc:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01010df:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01010e2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01010e5:	8b 45 08             	mov    0x8(%ebp),%eax
c01010e8:	8b 40 10             	mov    0x10(%eax),%eax
c01010eb:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01010ee:	8b 45 08             	mov    0x8(%ebp),%eax
c01010f1:	8b 00                	mov    (%eax),%eax
c01010f3:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01010f6:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01010f9:	83 ec 08             	sub    $0x8,%esp
c01010fc:	50                   	push   %eax
c01010fd:	ff 75 d0             	pushl  -0x30(%ebp)
c0101100:	e8 5f 4b 00 00       	call   c0105c64 <alloc_virtual_memory>
c0101105:	83 c4 10             	add    $0x10,%esp
c0101108:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010110b:	8b 45 08             	mov    0x8(%ebp),%eax
c010110e:	8b 40 78             	mov    0x78(%eax),%eax
c0101111:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0101114:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c0101118:	74 22                	je     c010113c <hd_rdwt+0x133>
c010111a:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c010111e:	74 1c                	je     c010113c <hd_rdwt+0x133>
c0101120:	68 b7 01 00 00       	push   $0x1b7
c0101125:	68 14 9f 10 c0       	push   $0xc0109f14
c010112a:	68 14 9f 10 c0       	push   $0xc0109f14
c010112f:	68 d6 9f 10 c0       	push   $0xc0109fd6
c0101134:	e8 1e 73 00 00       	call   c0108457 <assertion_failure>
c0101139:	83 c4 10             	add    $0x10,%esp
c010113c:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
c0101140:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0101143:	88 45 be             	mov    %al,-0x42(%ebp)
c0101146:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101149:	88 45 bf             	mov    %al,-0x41(%ebp)
c010114c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010114f:	c1 f8 08             	sar    $0x8,%eax
c0101152:	88 45 c0             	mov    %al,-0x40(%ebp)
c0101155:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101158:	c1 f8 10             	sar    $0x10,%eax
c010115b:	88 45 c1             	mov    %al,-0x3f(%ebp)
c010115e:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101161:	c1 f8 18             	sar    $0x18,%eax
c0101164:	83 e0 0f             	and    $0xf,%eax
c0101167:	83 c8 e0             	or     $0xffffffe0,%eax
c010116a:	88 45 c2             	mov    %al,-0x3e(%ebp)
c010116d:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c0101171:	75 07                	jne    c010117a <hd_rdwt+0x171>
c0101173:	b8 20 00 00 00       	mov    $0x20,%eax
c0101178:	eb 05                	jmp    c010117f <hd_rdwt+0x176>
c010117a:	b8 30 00 00 00       	mov    $0x30,%eax
c010117f:	88 45 c3             	mov    %al,-0x3d(%ebp)
c0101182:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c0101186:	3c 20                	cmp    $0x20,%al
c0101188:	74 24                	je     c01011ae <hd_rdwt+0x1a5>
c010118a:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c010118e:	3c 30                	cmp    $0x30,%al
c0101190:	74 1c                	je     c01011ae <hd_rdwt+0x1a5>
c0101192:	68 c5 01 00 00       	push   $0x1c5
c0101197:	68 14 9f 10 c0       	push   $0xc0109f14
c010119c:	68 14 9f 10 c0       	push   $0xc0109f14
c01011a1:	68 f4 9f 10 c0       	push   $0xc0109ff4
c01011a6:	e8 ac 72 00 00       	call   c0108457 <assertion_failure>
c01011ab:	83 c4 10             	add    $0x10,%esp
c01011ae:	83 ec 0c             	sub    $0xc,%esp
c01011b1:	8d 45 bd             	lea    -0x43(%ebp),%eax
c01011b4:	50                   	push   %eax
c01011b5:	e8 ca f5 ff ff       	call   c0100784 <hd_cmd_out>
c01011ba:	83 c4 10             	add    $0x10,%esp
c01011bd:	e9 9c 00 00 00       	jmp    c010125e <hd_rdwt+0x255>
c01011c2:	b8 00 02 00 00       	mov    $0x200,%eax
c01011c7:	81 7d f4 00 02 00 00 	cmpl   $0x200,-0xc(%ebp)
c01011ce:	0f 4e 45 f4          	cmovle -0xc(%ebp),%eax
c01011d2:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c01011d5:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c01011d9:	75 51                	jne    c010122c <hd_rdwt+0x223>
c01011db:	e8 a8 fd ff ff       	call   c0100f88 <wait_for>
c01011e0:	e8 d4 fd ff ff       	call   c0100fb9 <interrupt_wait>
c01011e5:	83 ec 04             	sub    $0x4,%esp
c01011e8:	ff 75 c4             	pushl  -0x3c(%ebp)
c01011eb:	6a 00                	push   $0x0
c01011ed:	68 80 11 11 c0       	push   $0xc0111180
c01011f2:	e8 28 9a 00 00       	call   c010ac1f <Memset>
c01011f7:	83 c4 10             	add    $0x10,%esp
c01011fa:	83 ec 04             	sub    $0x4,%esp
c01011fd:	68 00 02 00 00       	push   $0x200
c0101202:	68 80 11 11 c0       	push   $0xc0111180
c0101207:	68 f0 01 00 00       	push   $0x1f0
c010120c:	e8 62 9a 00 00       	call   c010ac73 <read_port>
c0101211:	83 c4 10             	add    $0x10,%esp
c0101214:	83 ec 04             	sub    $0x4,%esp
c0101217:	ff 75 c4             	pushl  -0x3c(%ebp)
c010121a:	68 80 11 11 c0       	push   $0xc0111180
c010121f:	ff 75 f0             	pushl  -0x10(%ebp)
c0101222:	e8 57 58 00 00       	call   c0106a7e <Memcpy>
c0101227:	83 c4 10             	add    $0x10,%esp
c010122a:	eb 26                	jmp    c0101252 <hd_rdwt+0x249>
c010122c:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c0101230:	75 20                	jne    c0101252 <hd_rdwt+0x249>
c0101232:	e8 51 fd ff ff       	call   c0100f88 <wait_for>
c0101237:	83 ec 04             	sub    $0x4,%esp
c010123a:	ff 75 c4             	pushl  -0x3c(%ebp)
c010123d:	ff 75 f0             	pushl  -0x10(%ebp)
c0101240:	68 f0 01 00 00       	push   $0x1f0
c0101245:	e8 3d 9a 00 00       	call   c010ac87 <write_port>
c010124a:	83 c4 10             	add    $0x10,%esp
c010124d:	e8 67 fd ff ff       	call   c0100fb9 <interrupt_wait>
c0101252:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0101255:	29 45 f4             	sub    %eax,-0xc(%ebp)
c0101258:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c010125b:	01 45 f0             	add    %eax,-0x10(%ebp)
c010125e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0101262:	0f 85 5a ff ff ff    	jne    c01011c2 <hd_rdwt+0x1b9>
c0101268:	83 ec 04             	sub    $0x4,%esp
c010126b:	6a 7c                	push   $0x7c
c010126d:	6a 00                	push   $0x0
c010126f:	8d 85 40 ff ff ff    	lea    -0xc0(%ebp),%eax
c0101275:	50                   	push   %eax
c0101276:	e8 a4 99 00 00       	call   c010ac1f <Memset>
c010127b:	83 c4 10             	add    $0x10,%esp
c010127e:	c7 45 b8 65 00 00 00 	movl   $0x65,-0x48(%ebp)
c0101285:	c7 85 48 ff ff ff 00 	movl   $0x0,-0xb8(%ebp)
c010128c:	00 00 00 
c010128f:	83 ec 04             	sub    $0x4,%esp
c0101292:	6a 02                	push   $0x2
c0101294:	8d 85 40 ff ff ff    	lea    -0xc0(%ebp),%eax
c010129a:	50                   	push   %eax
c010129b:	6a 01                	push   $0x1
c010129d:	e8 d2 7b 00 00       	call   c0108e74 <send_rec>
c01012a2:	83 c4 10             	add    $0x10,%esp
c01012a5:	90                   	nop
c01012a6:	c9                   	leave  
c01012a7:	c3                   	ret    

c01012a8 <hd_handler>:
c01012a8:	55                   	push   %ebp
c01012a9:	89 e5                	mov    %esp,%ebp
c01012ab:	83 ec 18             	sub    $0x18,%esp
c01012ae:	83 ec 0c             	sub    $0xc,%esp
c01012b1:	68 f7 01 00 00       	push   $0x1f7
c01012b6:	e8 d2 ef ff ff       	call   c010028d <in_byte>
c01012bb:	83 c4 10             	add    $0x10,%esp
c01012be:	0f b6 c0             	movzbl %al,%eax
c01012c1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01012c4:	83 ec 0c             	sub    $0xc,%esp
c01012c7:	6a 03                	push   $0x3
c01012c9:	e8 40 7e 00 00       	call   c010910e <inform_int>
c01012ce:	83 c4 10             	add    $0x10,%esp
c01012d1:	90                   	nop
c01012d2:	c9                   	leave  
c01012d3:	c3                   	ret    

c01012d4 <waitfor>:
c01012d4:	55                   	push   %ebp
c01012d5:	89 e5                	mov    %esp,%ebp
c01012d7:	83 ec 18             	sub    $0x18,%esp
c01012da:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01012e1:	eb 26                	jmp    c0101309 <waitfor+0x35>
c01012e3:	83 ec 0c             	sub    $0xc,%esp
c01012e6:	68 f7 01 00 00       	push   $0x1f7
c01012eb:	e8 9d ef ff ff       	call   c010028d <in_byte>
c01012f0:	83 c4 10             	add    $0x10,%esp
c01012f3:	0f b6 c0             	movzbl %al,%eax
c01012f6:	23 45 08             	and    0x8(%ebp),%eax
c01012f9:	39 45 0c             	cmp    %eax,0xc(%ebp)
c01012fc:	75 07                	jne    c0101305 <waitfor+0x31>
c01012fe:	b8 01 00 00 00       	mov    $0x1,%eax
c0101303:	eb 11                	jmp    c0101316 <waitfor+0x42>
c0101305:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0101309:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010130c:	3b 45 10             	cmp    0x10(%ebp),%eax
c010130f:	7c d2                	jl     c01012e3 <waitfor+0xf>
c0101311:	b8 00 00 00 00       	mov    $0x0,%eax
c0101316:	c9                   	leave  
c0101317:	c3                   	ret    

c0101318 <print_hd_info>:
c0101318:	55                   	push   %ebp
c0101319:	89 e5                	mov    %esp,%ebp
c010131b:	83 ec 18             	sub    $0x18,%esp
c010131e:	83 ec 0c             	sub    $0xc,%esp
c0101321:	68 28 a0 10 c0       	push   $0xc010a028
c0101326:	e8 cf 6d 00 00       	call   c01080fa <Printf>
c010132b:	83 c4 10             	add    $0x10,%esp
c010132e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0101335:	eb 3b                	jmp    c0101372 <print_hd_info+0x5a>
c0101337:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010133a:	8b 04 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%eax
c0101341:	85 c0                	test   %eax,%eax
c0101343:	74 28                	je     c010136d <print_hd_info+0x55>
c0101345:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101348:	8b 14 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%edx
c010134f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101352:	8b 04 c5 44 0f 11 c0 	mov    -0x3feef0bc(,%eax,8),%eax
c0101359:	ff 75 f4             	pushl  -0xc(%ebp)
c010135c:	52                   	push   %edx
c010135d:	50                   	push   %eax
c010135e:	68 45 a0 10 c0       	push   $0xc010a045
c0101363:	e8 92 6d 00 00       	call   c01080fa <Printf>
c0101368:	83 c4 10             	add    $0x10,%esp
c010136b:	eb 01                	jmp    c010136e <print_hd_info+0x56>
c010136d:	90                   	nop
c010136e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0101372:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c0101376:	7e bf                	jle    c0101337 <print_hd_info+0x1f>
c0101378:	83 ec 0c             	sub    $0xc,%esp
c010137b:	68 5d a0 10 c0       	push   $0xc010a05d
c0101380:	e8 75 6d 00 00       	call   c01080fa <Printf>
c0101385:	83 c4 10             	add    $0x10,%esp
c0101388:	83 ec 0c             	sub    $0xc,%esp
c010138b:	68 78 a0 10 c0       	push   $0xc010a078
c0101390:	e8 65 6d 00 00       	call   c01080fa <Printf>
c0101395:	83 c4 10             	add    $0x10,%esp
c0101398:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%ebp)
c010139f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01013a6:	eb 44                	jmp    c01013ec <print_hd_info+0xd4>
c01013a8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01013ab:	83 c0 04             	add    $0x4,%eax
c01013ae:	8b 04 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%eax
c01013b5:	85 c0                	test   %eax,%eax
c01013b7:	74 2e                	je     c01013e7 <print_hd_info+0xcf>
c01013b9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01013bc:	83 c0 04             	add    $0x4,%eax
c01013bf:	8b 14 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%edx
c01013c6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01013c9:	83 c0 04             	add    $0x4,%eax
c01013cc:	8b 04 c5 44 0f 11 c0 	mov    -0x3feef0bc(,%eax,8),%eax
c01013d3:	ff 75 f0             	pushl  -0x10(%ebp)
c01013d6:	52                   	push   %edx
c01013d7:	50                   	push   %eax
c01013d8:	68 45 a0 10 c0       	push   $0xc010a045
c01013dd:	e8 18 6d 00 00       	call   c01080fa <Printf>
c01013e2:	83 c4 10             	add    $0x10,%esp
c01013e5:	eb 01                	jmp    c01013e8 <print_hd_info+0xd0>
c01013e7:	90                   	nop
c01013e8:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01013ec:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c01013f0:	7e b6                	jle    c01013a8 <print_hd_info+0x90>
c01013f2:	83 ec 0c             	sub    $0xc,%esp
c01013f5:	68 95 a0 10 c0       	push   $0xc010a095
c01013fa:	e8 fb 6c 00 00       	call   c01080fa <Printf>
c01013ff:	83 c4 10             	add    $0x10,%esp
c0101402:	90                   	nop
c0101403:	c9                   	leave  
c0101404:	c3                   	ret    

c0101405 <is_empty>:
c0101405:	55                   	push   %ebp
c0101406:	89 e5                	mov    %esp,%ebp
c0101408:	83 ec 10             	sub    $0x10,%esp
c010140b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0101412:	eb 1a                	jmp    c010142e <is_empty+0x29>
c0101414:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0101417:	8b 45 08             	mov    0x8(%ebp),%eax
c010141a:	01 d0                	add    %edx,%eax
c010141c:	0f b6 00             	movzbl (%eax),%eax
c010141f:	84 c0                	test   %al,%al
c0101421:	74 07                	je     c010142a <is_empty+0x25>
c0101423:	b8 00 00 00 00       	mov    $0x0,%eax
c0101428:	eb 11                	jmp    c010143b <is_empty+0x36>
c010142a:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c010142e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0101431:	3b 45 0c             	cmp    0xc(%ebp),%eax
c0101434:	7c de                	jl     c0101414 <is_empty+0xf>
c0101436:	b8 01 00 00 00       	mov    $0x1,%eax
c010143b:	c9                   	leave  
c010143c:	c3                   	ret    
c010143d:	66 90                	xchg   %ax,%ax
c010143f:	90                   	nop

c0101440 <write_debug>:
c0101440:	b8 02 00 00 00       	mov    $0x2,%eax
c0101445:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0101449:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c010144d:	cd 90                	int    $0x90
c010144f:	c3                   	ret    

c0101450 <send_msg>:
c0101450:	55                   	push   %ebp
c0101451:	89 e5                	mov    %esp,%ebp
c0101453:	53                   	push   %ebx
c0101454:	51                   	push   %ecx
c0101455:	b8 03 00 00 00       	mov    $0x3,%eax
c010145a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c010145d:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0101460:	cd 90                	int    $0x90
c0101462:	59                   	pop    %ecx
c0101463:	5b                   	pop    %ebx
c0101464:	5d                   	pop    %ebp
c0101465:	c3                   	ret    

c0101466 <receive_msg>:
c0101466:	55                   	push   %ebp
c0101467:	89 e5                	mov    %esp,%ebp
c0101469:	53                   	push   %ebx
c010146a:	51                   	push   %ecx
c010146b:	b8 04 00 00 00       	mov    $0x4,%eax
c0101470:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c0101473:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0101476:	cd 90                	int    $0x90
c0101478:	59                   	pop    %ecx
c0101479:	5b                   	pop    %ebx
c010147a:	5d                   	pop    %ebp
c010147b:	c3                   	ret    

c010147c <sys_malloc>:
c010147c:	56                   	push   %esi
c010147d:	57                   	push   %edi
c010147e:	53                   	push   %ebx
c010147f:	55                   	push   %ebp
c0101480:	89 e5                	mov    %esp,%ebp
c0101482:	b8 05 00 00 00       	mov    $0x5,%eax
c0101487:	8b 4d 14             	mov    0x14(%ebp),%ecx
c010148a:	cd 90                	int    $0x90
c010148c:	5d                   	pop    %ebp
c010148d:	5b                   	pop    %ebx
c010148e:	5f                   	pop    %edi
c010148f:	5e                   	pop    %esi
c0101490:	c3                   	ret    

c0101491 <sys_free>:
c0101491:	56                   	push   %esi
c0101492:	57                   	push   %edi
c0101493:	53                   	push   %ebx
c0101494:	55                   	push   %ebp
c0101495:	89 e5                	mov    %esp,%ebp
c0101497:	b8 06 00 00 00       	mov    $0x6,%eax
c010149c:	8b 4d 14             	mov    0x14(%ebp),%ecx
c010149f:	8b 5d 18             	mov    0x18(%ebp),%ebx
c01014a2:	cd 90                	int    $0x90
c01014a4:	5d                   	pop    %ebp
c01014a5:	5b                   	pop    %ebx
c01014a6:	5f                   	pop    %edi
c01014a7:	5e                   	pop    %esi
c01014a8:	c3                   	ret    

c01014a9 <task_fs>:
c01014a9:	55                   	push   %ebp
c01014aa:	89 e5                	mov    %esp,%ebp
c01014ac:	83 ec 28             	sub    $0x28,%esp
c01014af:	e8 bb 08 00 00       	call   c0101d6f <init_fs>
c01014b4:	83 ec 0c             	sub    $0xc,%esp
c01014b7:	6a 7c                	push   $0x7c
c01014b9:	e8 be ff ff ff       	call   c010147c <sys_malloc>
c01014be:	83 c4 10             	add    $0x10,%esp
c01014c1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01014c4:	83 ec 0c             	sub    $0xc,%esp
c01014c7:	6a 7c                	push   $0x7c
c01014c9:	e8 ae ff ff ff       	call   c010147c <sys_malloc>
c01014ce:	83 c4 10             	add    $0x10,%esp
c01014d1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01014d4:	83 ec 04             	sub    $0x4,%esp
c01014d7:	6a 7c                	push   $0x7c
c01014d9:	6a 00                	push   $0x0
c01014db:	ff 75 f4             	pushl  -0xc(%ebp)
c01014de:	e8 3c 97 00 00       	call   c010ac1f <Memset>
c01014e3:	83 c4 10             	add    $0x10,%esp
c01014e6:	83 ec 04             	sub    $0x4,%esp
c01014e9:	6a 12                	push   $0x12
c01014eb:	ff 75 f4             	pushl  -0xc(%ebp)
c01014ee:	6a 02                	push   $0x2
c01014f0:	e8 7f 79 00 00       	call   c0108e74 <send_rec>
c01014f5:	83 c4 10             	add    $0x10,%esp
c01014f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01014fb:	8b 40 78             	mov    0x78(%eax),%eax
c01014fe:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0101501:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101504:	8b 00                	mov    (%eax),%eax
c0101506:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0101509:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010150c:	8b 40 50             	mov    0x50(%eax),%eax
c010150f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0101512:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101515:	8b 40 68             	mov    0x68(%eax),%eax
c0101518:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010151b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010151e:	8b 00                	mov    (%eax),%eax
c0101520:	85 c0                	test   %eax,%eax
c0101522:	75 07                	jne    c010152b <task_fs+0x82>
c0101524:	c7 45 dc 05 00 00 00 	movl   $0x5,-0x24(%ebp)
c010152b:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0101532:	83 ec 0c             	sub    $0xc,%esp
c0101535:	ff 75 e8             	pushl  -0x18(%ebp)
c0101538:	e8 ef 20 00 00       	call   c010362c <pid2proc>
c010153d:	83 c4 10             	add    $0x10,%esp
c0101540:	a3 c8 fb 10 c0       	mov    %eax,0xc010fbc8
c0101545:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0101549:	74 37                	je     c0101582 <task_fs+0xd9>
c010154b:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
c010154f:	74 31                	je     c0101582 <task_fs+0xd9>
c0101551:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c0101555:	74 2b                	je     c0101582 <task_fs+0xd9>
c0101557:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
c010155b:	74 25                	je     c0101582 <task_fs+0xd9>
c010155d:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
c0101561:	74 1f                	je     c0101582 <task_fs+0xd9>
c0101563:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
c0101567:	74 19                	je     c0101582 <task_fs+0xd9>
c0101569:	6a 7a                	push   $0x7a
c010156b:	68 b4 a0 10 c0       	push   $0xc010a0b4
c0101570:	68 b4 a0 10 c0       	push   $0xc010a0b4
c0101575:	68 c4 a0 10 c0       	push   $0xc010a0c4
c010157a:	e8 d8 6e 00 00       	call   c0108457 <assertion_failure>
c010157f:	83 c4 10             	add    $0x10,%esp
c0101582:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c0101586:	74 3a                	je     c01015c2 <task_fs+0x119>
c0101588:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c010158c:	7f 19                	jg     c01015a7 <task_fs+0xfe>
c010158e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0101592:	0f 84 10 01 00 00    	je     c01016a8 <task_fs+0x1ff>
c0101598:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
c010159c:	0f 84 a1 00 00 00    	je     c0101643 <task_fs+0x19a>
c01015a2:	e9 ef 00 00 00       	jmp    c0101696 <task_fs+0x1ed>
c01015a7:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
c01015ab:	74 50                	je     c01015fd <task_fs+0x154>
c01015ad:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
c01015b1:	0f 84 c6 00 00 00    	je     c010167d <task_fs+0x1d4>
c01015b7:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
c01015bb:	74 40                	je     c01015fd <task_fs+0x154>
c01015bd:	e9 d4 00 00 00       	jmp    c0101696 <task_fs+0x1ed>
c01015c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01015c5:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c01015cc:	83 ec 0c             	sub    $0xc,%esp
c01015cf:	ff 75 f4             	pushl  -0xc(%ebp)
c01015d2:	e8 ec 07 00 00       	call   c0101dc3 <do_open>
c01015d7:	83 c4 10             	add    $0x10,%esp
c01015da:	89 c2                	mov    %eax,%edx
c01015dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01015df:	89 50 50             	mov    %edx,0x50(%eax)
c01015e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01015e5:	8b 00                	mov    (%eax),%eax
c01015e7:	83 ec 04             	sub    $0x4,%esp
c01015ea:	50                   	push   %eax
c01015eb:	ff 75 f4             	pushl  -0xc(%ebp)
c01015ee:	6a 01                	push   $0x1
c01015f0:	e8 7f 78 00 00       	call   c0108e74 <send_rec>
c01015f5:	83 c4 10             	add    $0x10,%esp
c01015f8:	e9 b2 00 00 00       	jmp    c01016af <task_fs+0x206>
c01015fd:	83 ec 0c             	sub    $0xc,%esp
c0101600:	ff 75 f4             	pushl  -0xc(%ebp)
c0101603:	e8 f9 18 00 00       	call   c0102f01 <do_rdwt>
c0101608:	83 c4 10             	add    $0x10,%esp
c010160b:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010160e:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
c0101612:	0f 84 96 00 00 00    	je     c01016ae <task_fs+0x205>
c0101618:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010161b:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0101622:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0101625:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101628:	89 50 60             	mov    %edx,0x60(%eax)
c010162b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010162e:	8b 00                	mov    (%eax),%eax
c0101630:	83 ec 04             	sub    $0x4,%esp
c0101633:	50                   	push   %eax
c0101634:	ff 75 f4             	pushl  -0xc(%ebp)
c0101637:	6a 01                	push   $0x1
c0101639:	e8 36 78 00 00       	call   c0108e74 <send_rec>
c010163e:	83 c4 10             	add    $0x10,%esp
c0101641:	eb 6b                	jmp    c01016ae <task_fs+0x205>
c0101643:	83 ec 0c             	sub    $0xc,%esp
c0101646:	ff 75 e4             	pushl  -0x1c(%ebp)
c0101649:	e8 d0 1d 00 00       	call   c010341e <do_close>
c010164e:	83 c4 10             	add    $0x10,%esp
c0101651:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101654:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c010165b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010165e:	c7 40 58 00 00 00 00 	movl   $0x0,0x58(%eax)
c0101665:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101668:	8b 00                	mov    (%eax),%eax
c010166a:	83 ec 04             	sub    $0x4,%esp
c010166d:	50                   	push   %eax
c010166e:	ff 75 f4             	pushl  -0xc(%ebp)
c0101671:	6a 01                	push   $0x1
c0101673:	e8 fc 77 00 00       	call   c0108e74 <send_rec>
c0101678:	83 c4 10             	add    $0x10,%esp
c010167b:	eb 32                	jmp    c01016af <task_fs+0x206>
c010167d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101680:	8b 40 68             	mov    0x68(%eax),%eax
c0101683:	83 ec 04             	sub    $0x4,%esp
c0101686:	50                   	push   %eax
c0101687:	ff 75 f4             	pushl  -0xc(%ebp)
c010168a:	6a 01                	push   $0x1
c010168c:	e8 e3 77 00 00       	call   c0108e74 <send_rec>
c0101691:	83 c4 10             	add    $0x10,%esp
c0101694:	eb 19                	jmp    c01016af <task_fs+0x206>
c0101696:	83 ec 0c             	sub    $0xc,%esp
c0101699:	68 27 a1 10 c0       	push   $0xc010a127
c010169e:	e8 96 6d 00 00       	call   c0108439 <panic>
c01016a3:	83 c4 10             	add    $0x10,%esp
c01016a6:	eb 07                	jmp    c01016af <task_fs+0x206>
c01016a8:	90                   	nop
c01016a9:	e9 26 fe ff ff       	jmp    c01014d4 <task_fs+0x2b>
c01016ae:	90                   	nop
c01016af:	e9 20 fe ff ff       	jmp    c01014d4 <task_fs+0x2b>

c01016b4 <rd_wt>:
c01016b4:	55                   	push   %ebp
c01016b5:	89 e5                	mov    %esp,%ebp
c01016b7:	83 ec 18             	sub    $0x18,%esp
c01016ba:	83 ec 0c             	sub    $0xc,%esp
c01016bd:	6a 7c                	push   $0x7c
c01016bf:	e8 b8 fd ff ff       	call   c010147c <sys_malloc>
c01016c4:	83 c4 10             	add    $0x10,%esp
c01016c7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01016ca:	83 ec 04             	sub    $0x4,%esp
c01016cd:	6a 7c                	push   $0x7c
c01016cf:	6a 00                	push   $0x0
c01016d1:	ff 75 f4             	pushl  -0xc(%ebp)
c01016d4:	e8 46 95 00 00       	call   c010ac1f <Memset>
c01016d9:	83 c4 10             	add    $0x10,%esp
c01016dc:	8b 55 18             	mov    0x18(%ebp),%edx
c01016df:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01016e2:	89 50 78             	mov    %edx,0x78(%eax)
c01016e5:	8b 55 0c             	mov    0xc(%ebp),%edx
c01016e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01016eb:	89 50 14             	mov    %edx,0x14(%eax)
c01016ee:	8b 55 10             	mov    0x10(%ebp),%edx
c01016f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01016f4:	89 50 10             	mov    %edx,0x10(%eax)
c01016f7:	8b 55 14             	mov    0x14(%ebp),%edx
c01016fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01016fd:	89 50 0c             	mov    %edx,0xc(%eax)
c0101700:	8b 45 08             	mov    0x8(%ebp),%eax
c0101703:	c1 e0 09             	shl    $0x9,%eax
c0101706:	89 c2                	mov    %eax,%edx
c0101708:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010170b:	89 50 18             	mov    %edx,0x18(%eax)
c010170e:	83 7d 18 07          	cmpl   $0x7,0x18(%ebp)
c0101712:	74 22                	je     c0101736 <rd_wt+0x82>
c0101714:	83 7d 18 0a          	cmpl   $0xa,0x18(%ebp)
c0101718:	74 1c                	je     c0101736 <rd_wt+0x82>
c010171a:	68 b1 00 00 00       	push   $0xb1
c010171f:	68 b4 a0 10 c0       	push   $0xc010a0b4
c0101724:	68 b4 a0 10 c0       	push   $0xc010a0b4
c0101729:	68 3a a1 10 c0       	push   $0xc010a13a
c010172e:	e8 24 6d 00 00       	call   c0108457 <assertion_failure>
c0101733:	83 c4 10             	add    $0x10,%esp
c0101736:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101739:	8b 40 78             	mov    0x78(%eax),%eax
c010173c:	83 f8 07             	cmp    $0x7,%eax
c010173f:	74 27                	je     c0101768 <rd_wt+0xb4>
c0101741:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101744:	8b 40 78             	mov    0x78(%eax),%eax
c0101747:	83 f8 0a             	cmp    $0xa,%eax
c010174a:	74 1c                	je     c0101768 <rd_wt+0xb4>
c010174c:	68 b2 00 00 00       	push   $0xb2
c0101751:	68 b4 a0 10 c0       	push   $0xc010a0b4
c0101756:	68 b4 a0 10 c0       	push   $0xc010a0b4
c010175b:	68 58 a1 10 c0       	push   $0xc010a158
c0101760:	e8 f2 6c 00 00       	call   c0108457 <assertion_failure>
c0101765:	83 c4 10             	add    $0x10,%esp
c0101768:	83 ec 04             	sub    $0x4,%esp
c010176b:	6a 03                	push   $0x3
c010176d:	ff 75 f4             	pushl  -0xc(%ebp)
c0101770:	6a 03                	push   $0x3
c0101772:	e8 fd 76 00 00       	call   c0108e74 <send_rec>
c0101777:	83 c4 10             	add    $0x10,%esp
c010177a:	83 ec 08             	sub    $0x8,%esp
c010177d:	6a 7c                	push   $0x7c
c010177f:	ff 75 f4             	pushl  -0xc(%ebp)
c0101782:	e8 0a fd ff ff       	call   c0101491 <sys_free>
c0101787:	83 c4 10             	add    $0x10,%esp
c010178a:	90                   	nop
c010178b:	c9                   	leave  
c010178c:	c3                   	ret    

c010178d <mkfs>:
c010178d:	55                   	push   %ebp
c010178e:	89 e5                	mov    %esp,%ebp
c0101790:	57                   	push   %edi
c0101791:	81 ec d4 00 00 00    	sub    $0xd4,%esp
c0101797:	83 ec 0c             	sub    $0xc,%esp
c010179a:	68 00 80 00 00       	push   $0x8000
c010179f:	e8 d8 fc ff ff       	call   c010147c <sys_malloc>
c01017a4:	83 c4 10             	add    $0x10,%esp
c01017a7:	a3 a4 21 11 c0       	mov    %eax,0xc01121a4
c01017ac:	83 ec 0c             	sub    $0xc,%esp
c01017af:	6a 24                	push   $0x24
c01017b1:	e8 c6 fc ff ff       	call   c010147c <sys_malloc>
c01017b6:	83 c4 10             	add    $0x10,%esp
c01017b9:	a3 a0 21 11 c0       	mov    %eax,0xc01121a0
c01017be:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c01017c3:	83 ec 0c             	sub    $0xc,%esp
c01017c6:	50                   	push   %eax
c01017c7:	e8 e2 45 00 00       	call   c0105dae <get_physical_address>
c01017cc:	83 c4 10             	add    $0x10,%esp
c01017cf:	a3 84 17 11 c0       	mov    %eax,0xc0111784
c01017d4:	a1 a0 21 11 c0       	mov    0xc01121a0,%eax
c01017d9:	83 ec 0c             	sub    $0xc,%esp
c01017dc:	50                   	push   %eax
c01017dd:	e8 cc 45 00 00       	call   c0105dae <get_physical_address>
c01017e2:	83 c4 10             	add    $0x10,%esp
c01017e5:	a3 80 17 11 c0       	mov    %eax,0xc0111780
c01017ea:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c01017ef:	83 ec 04             	sub    $0x4,%esp
c01017f2:	68 00 02 00 00       	push   $0x200
c01017f7:	6a 00                	push   $0x0
c01017f9:	50                   	push   %eax
c01017fa:	e8 20 94 00 00       	call   c010ac1f <Memset>
c01017ff:	83 c4 10             	add    $0x10,%esp
c0101802:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101807:	83 ec 0c             	sub    $0xc,%esp
c010180a:	6a 0a                	push   $0xa
c010180c:	68 00 02 00 00       	push   $0x200
c0101811:	50                   	push   %eax
c0101812:	6a 20                	push   $0x20
c0101814:	6a 00                	push   $0x0
c0101816:	e8 99 fe ff ff       	call   c01016b4 <rd_wt>
c010181b:	83 c4 20             	add    $0x20,%esp
c010181e:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101823:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0101826:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101829:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c0101830:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101833:	c7 40 10 00 08 00 00 	movl   $0x800,0x10(%eax)
c010183a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010183d:	c7 40 08 00 08 00 00 	movl   $0x800,0x8(%eax)
c0101844:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101847:	c7 40 0c 00 01 00 00 	movl   $0x100,0xc(%eax)
c010184e:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101851:	8b 40 04             	mov    0x4(%eax),%eax
c0101854:	8d 50 02             	lea    0x2(%eax),%edx
c0101857:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010185a:	8b 40 08             	mov    0x8(%eax),%eax
c010185d:	01 c2                	add    %eax,%edx
c010185f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101862:	8b 40 0c             	mov    0xc(%eax),%eax
c0101865:	01 c2                	add    %eax,%edx
c0101867:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010186a:	89 10                	mov    %edx,(%eax)
c010186c:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c0101873:	b8 00 02 00 00       	mov    $0x200,%eax
c0101878:	2b 45 d8             	sub    -0x28(%ebp),%eax
c010187b:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0101881:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0101884:	01 ca                	add    %ecx,%edx
c0101886:	83 ec 04             	sub    $0x4,%esp
c0101889:	50                   	push   %eax
c010188a:	6a 80                	push   $0xffffff80
c010188c:	52                   	push   %edx
c010188d:	e8 8d 93 00 00       	call   c010ac1f <Memset>
c0101892:	83 c4 10             	add    $0x10,%esp
c0101895:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010189a:	83 ec 0c             	sub    $0xc,%esp
c010189d:	6a 0a                	push   $0xa
c010189f:	68 00 02 00 00       	push   $0x200
c01018a4:	50                   	push   %eax
c01018a5:	6a 20                	push   $0x20
c01018a7:	6a 01                	push   $0x1
c01018a9:	e8 06 fe ff ff       	call   c01016b4 <rd_wt>
c01018ae:	83 c4 20             	add    $0x20,%esp
c01018b1:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01018b4:	8b 10                	mov    (%eax),%edx
c01018b6:	89 55 98             	mov    %edx,-0x68(%ebp)
c01018b9:	8b 50 04             	mov    0x4(%eax),%edx
c01018bc:	89 55 9c             	mov    %edx,-0x64(%ebp)
c01018bf:	8b 50 08             	mov    0x8(%eax),%edx
c01018c2:	89 55 a0             	mov    %edx,-0x60(%ebp)
c01018c5:	8b 50 0c             	mov    0xc(%eax),%edx
c01018c8:	89 55 a4             	mov    %edx,-0x5c(%ebp)
c01018cb:	8b 50 10             	mov    0x10(%eax),%edx
c01018ce:	89 55 a8             	mov    %edx,-0x58(%ebp)
c01018d1:	8b 50 14             	mov    0x14(%eax),%edx
c01018d4:	89 55 ac             	mov    %edx,-0x54(%ebp)
c01018d7:	8b 50 18             	mov    0x18(%eax),%edx
c01018da:	89 55 b0             	mov    %edx,-0x50(%ebp)
c01018dd:	8b 50 1c             	mov    0x1c(%eax),%edx
c01018e0:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c01018e3:	8b 40 20             	mov    0x20(%eax),%eax
c01018e6:	89 45 b8             	mov    %eax,-0x48(%ebp)
c01018e9:	c6 45 d7 3f          	movb   $0x3f,-0x29(%ebp)
c01018ed:	0f be 55 d7          	movsbl -0x29(%ebp),%edx
c01018f1:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c01018f6:	83 ec 04             	sub    $0x4,%esp
c01018f9:	6a 01                	push   $0x1
c01018fb:	52                   	push   %edx
c01018fc:	50                   	push   %eax
c01018fd:	e8 1d 93 00 00       	call   c010ac1f <Memset>
c0101902:	83 c4 10             	add    $0x10,%esp
c0101905:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c010190a:	83 c0 01             	add    $0x1,%eax
c010190d:	83 ec 04             	sub    $0x4,%esp
c0101910:	68 ff 01 00 00       	push   $0x1ff
c0101915:	6a 80                	push   $0xffffff80
c0101917:	50                   	push   %eax
c0101918:	e8 02 93 00 00       	call   c010ac1f <Memset>
c010191d:	83 c4 10             	add    $0x10,%esp
c0101920:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101925:	83 ec 0c             	sub    $0xc,%esp
c0101928:	6a 0a                	push   $0xa
c010192a:	68 00 02 00 00       	push   $0x200
c010192f:	50                   	push   %eax
c0101930:	6a 20                	push   $0x20
c0101932:	6a 02                	push   $0x2
c0101934:	e8 7b fd ff ff       	call   c01016b4 <rd_wt>
c0101939:	83 c4 20             	add    $0x20,%esp
c010193c:	c7 45 d0 03 00 00 00 	movl   $0x3,-0x30(%ebp)
c0101943:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101948:	83 ec 04             	sub    $0x4,%esp
c010194b:	68 00 02 00 00       	push   $0x200
c0101950:	6a ff                	push   $0xffffffff
c0101952:	50                   	push   %eax
c0101953:	e8 c7 92 00 00       	call   c010ac1f <Memset>
c0101958:	83 c4 10             	add    $0x10,%esp
c010195b:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101960:	83 ec 0c             	sub    $0xc,%esp
c0101963:	6a 0a                	push   $0xa
c0101965:	68 00 02 00 00       	push   $0x200
c010196a:	50                   	push   %eax
c010196b:	6a 20                	push   $0x20
c010196d:	ff 75 d0             	pushl  -0x30(%ebp)
c0101970:	e8 3f fd ff ff       	call   c01016b4 <rd_wt>
c0101975:	83 c4 20             	add    $0x20,%esp
c0101978:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c010197d:	83 ec 04             	sub    $0x4,%esp
c0101980:	6a 01                	push   $0x1
c0101982:	6a 01                	push   $0x1
c0101984:	50                   	push   %eax
c0101985:	e8 95 92 00 00       	call   c010ac1f <Memset>
c010198a:	83 c4 10             	add    $0x10,%esp
c010198d:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101992:	83 c0 01             	add    $0x1,%eax
c0101995:	83 ec 04             	sub    $0x4,%esp
c0101998:	68 ff 01 00 00       	push   $0x1ff
c010199d:	6a 00                	push   $0x0
c010199f:	50                   	push   %eax
c01019a0:	e8 7a 92 00 00       	call   c010ac1f <Memset>
c01019a5:	83 c4 10             	add    $0x10,%esp
c01019a8:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01019ad:	89 c2                	mov    %eax,%edx
c01019af:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01019b2:	83 c0 01             	add    $0x1,%eax
c01019b5:	83 ec 0c             	sub    $0xc,%esp
c01019b8:	6a 0a                	push   $0xa
c01019ba:	68 00 02 00 00       	push   $0x200
c01019bf:	52                   	push   %edx
c01019c0:	6a 20                	push   $0x20
c01019c2:	50                   	push   %eax
c01019c3:	e8 ec fc ff ff       	call   c01016b4 <rd_wt>
c01019c8:	83 c4 20             	add    $0x20,%esp
c01019cb:	8b 45 a0             	mov    -0x60(%ebp),%eax
c01019ce:	83 e8 02             	sub    $0x2,%eax
c01019d1:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01019d4:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c01019db:	eb 04                	jmp    c01019e1 <mkfs+0x254>
c01019dd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01019e1:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01019e4:	83 c0 01             	add    $0x1,%eax
c01019e7:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c01019ea:	7e f1                	jle    c01019dd <mkfs+0x250>
c01019ec:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01019f1:	89 c2                	mov    %eax,%edx
c01019f3:	8b 45 a0             	mov    -0x60(%ebp),%eax
c01019f6:	83 c0 03             	add    $0x3,%eax
c01019f9:	83 ec 0c             	sub    $0xc,%esp
c01019fc:	6a 0a                	push   $0xa
c01019fe:	68 00 02 00 00       	push   $0x200
c0101a03:	52                   	push   %edx
c0101a04:	6a 20                	push   $0x20
c0101a06:	50                   	push   %eax
c0101a07:	e8 a8 fc ff ff       	call   c01016b4 <rd_wt>
c0101a0c:	83 c4 20             	add    $0x20,%esp
c0101a0f:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101a14:	89 c2                	mov    %eax,%edx
c0101a16:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101a19:	83 c0 03             	add    $0x3,%eax
c0101a1c:	83 ec 0c             	sub    $0xc,%esp
c0101a1f:	6a 07                	push   $0x7
c0101a21:	68 00 02 00 00       	push   $0x200
c0101a26:	52                   	push   %edx
c0101a27:	6a 20                	push   $0x20
c0101a29:	50                   	push   %eax
c0101a2a:	e8 85 fc ff ff       	call   c01016b4 <rd_wt>
c0101a2f:	83 c4 20             	add    $0x20,%esp
c0101a32:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101a37:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0101a3a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101a3d:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0101a43:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101a46:	c7 40 04 50 00 00 00 	movl   $0x50,0x4(%eax)
c0101a4d:	8b 55 98             	mov    -0x68(%ebp),%edx
c0101a50:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101a53:	89 50 08             	mov    %edx,0x8(%eax)
c0101a56:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101a59:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0101a60:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101a63:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c0101a6a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101a6d:	8b 10                	mov    (%eax),%edx
c0101a6f:	89 15 c0 21 11 c0    	mov    %edx,0xc01121c0
c0101a75:	8b 50 04             	mov    0x4(%eax),%edx
c0101a78:	89 15 c4 21 11 c0    	mov    %edx,0xc01121c4
c0101a7e:	8b 50 08             	mov    0x8(%eax),%edx
c0101a81:	89 15 c8 21 11 c0    	mov    %edx,0xc01121c8
c0101a87:	8b 50 0c             	mov    0xc(%eax),%edx
c0101a8a:	89 15 cc 21 11 c0    	mov    %edx,0xc01121cc
c0101a90:	8b 50 10             	mov    0x10(%eax),%edx
c0101a93:	89 15 d0 21 11 c0    	mov    %edx,0xc01121d0
c0101a99:	8b 50 14             	mov    0x14(%eax),%edx
c0101a9c:	89 15 d4 21 11 c0    	mov    %edx,0xc01121d4
c0101aa2:	8b 50 18             	mov    0x18(%eax),%edx
c0101aa5:	89 15 d8 21 11 c0    	mov    %edx,0xc01121d8
c0101aab:	8b 50 1c             	mov    0x1c(%eax),%edx
c0101aae:	89 15 dc 21 11 c0    	mov    %edx,0xc01121dc
c0101ab4:	8b 50 20             	mov    0x20(%eax),%edx
c0101ab7:	89 15 e0 21 11 c0    	mov    %edx,0xc01121e0
c0101abd:	8b 40 24             	mov    0x24(%eax),%eax
c0101ac0:	a3 e4 21 11 c0       	mov    %eax,0xc01121e4
c0101ac5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0101acc:	eb 4c                	jmp    c0101b1a <mkfs+0x38d>
c0101ace:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101ad3:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0101ad6:	83 c2 01             	add    $0x1,%edx
c0101ad9:	c1 e2 05             	shl    $0x5,%edx
c0101adc:	01 d0                	add    %edx,%eax
c0101ade:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0101ae1:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101ae4:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0101aea:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101aed:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0101af4:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101af7:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c0101afe:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
c0101b05:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0101b08:	c1 e0 08             	shl    $0x8,%eax
c0101b0b:	0b 45 f0             	or     -0x10(%ebp),%eax
c0101b0e:	89 c2                	mov    %eax,%edx
c0101b10:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101b13:	89 50 08             	mov    %edx,0x8(%eax)
c0101b16:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0101b1a:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
c0101b1e:	7e ae                	jle    c0101ace <mkfs+0x341>
c0101b20:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
c0101b27:	8d 95 70 ff ff ff    	lea    -0x90(%ebp),%edx
c0101b2d:	b8 00 00 00 00       	mov    $0x0,%eax
c0101b32:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0101b37:	89 d7                	mov    %edx,%edi
c0101b39:	f3 ab                	rep stos %eax,%es:(%edi)
c0101b3b:	c7 85 70 ff ff ff 80 	movl   $0xc010a180,-0x90(%ebp)
c0101b42:	a1 10 c0 
c0101b45:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0101b4c:	eb 54                	jmp    c0101ba2 <mkfs+0x415>
c0101b4e:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101b53:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0101b56:	83 c2 04             	add    $0x4,%edx
c0101b59:	c1 e2 05             	shl    $0x5,%edx
c0101b5c:	01 d0                	add    %edx,%eax
c0101b5e:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0101b61:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101b64:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0101b6a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101b6d:	c7 40 04 00 e8 08 00 	movl   $0x8e800,0x4(%eax)
c0101b74:	8b 45 98             	mov    -0x68(%ebp),%eax
c0101b77:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0101b7a:	83 c2 01             	add    $0x1,%edx
c0101b7d:	c1 e2 0b             	shl    $0xb,%edx
c0101b80:	01 c2                	add    %eax,%edx
c0101b82:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101b85:	89 50 08             	mov    %edx,0x8(%eax)
c0101b88:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101b8b:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0101b92:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101b95:	8d 50 05             	lea    0x5(%eax),%edx
c0101b98:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0101b9b:	89 50 10             	mov    %edx,0x10(%eax)
c0101b9e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0101ba2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101ba5:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0101ba8:	7c a4                	jl     c0101b4e <mkfs+0x3c1>
c0101baa:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101baf:	89 c2                	mov    %eax,%edx
c0101bb1:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0101bb4:	83 c0 03             	add    $0x3,%eax
c0101bb7:	83 ec 0c             	sub    $0xc,%esp
c0101bba:	6a 0a                	push   $0xa
c0101bbc:	68 00 02 00 00       	push   $0x200
c0101bc1:	52                   	push   %edx
c0101bc2:	6a 20                	push   $0x20
c0101bc4:	50                   	push   %eax
c0101bc5:	e8 ea fa ff ff       	call   c01016b4 <rd_wt>
c0101bca:	83 c4 20             	add    $0x20,%esp
c0101bcd:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101bd2:	89 c2                	mov    %eax,%edx
c0101bd4:	8b 45 98             	mov    -0x68(%ebp),%eax
c0101bd7:	83 ec 0c             	sub    $0xc,%esp
c0101bda:	6a 07                	push   $0x7
c0101bdc:	68 00 02 00 00       	push   $0x200
c0101be1:	52                   	push   %edx
c0101be2:	6a 20                	push   $0x20
c0101be4:	50                   	push   %eax
c0101be5:	e8 ca fa ff ff       	call   c01016b4 <rd_wt>
c0101bea:	83 c4 20             	add    $0x20,%esp
c0101bed:	c7 85 60 ff ff ff cc 	movl   $0xcc,-0xa0(%ebp)
c0101bf4:	00 00 00 
c0101bf7:	66 c7 85 5e ff ff ff 	movw   $0x2e,-0xa2(%ebp)
c0101bfe:	2e 00 
c0101c00:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0101c05:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0101c08:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101c0b:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0101c11:	83 ec 0c             	sub    $0xc,%esp
c0101c14:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0101c1a:	50                   	push   %eax
c0101c1b:	e8 38 90 00 00       	call   c010ac58 <Strlen>
c0101c20:	83 c4 10             	add    $0x10,%esp
c0101c23:	89 c1                	mov    %eax,%ecx
c0101c25:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101c28:	8d 50 04             	lea    0x4(%eax),%edx
c0101c2b:	83 ec 04             	sub    $0x4,%esp
c0101c2e:	51                   	push   %ecx
c0101c2f:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0101c35:	50                   	push   %eax
c0101c36:	52                   	push   %edx
c0101c37:	e8 42 4e 00 00       	call   c0106a7e <Memcpy>
c0101c3c:	83 c4 10             	add    $0x10,%esp
c0101c3f:	8d 95 34 ff ff ff    	lea    -0xcc(%ebp),%edx
c0101c45:	b8 00 00 00 00       	mov    $0x0,%eax
c0101c4a:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0101c4f:	89 d7                	mov    %edx,%edi
c0101c51:	f3 ab                	rep stos %eax,%es:(%edi)
c0101c53:	c7 85 34 ff ff ff 8c 	movl   $0xc010a18c,-0xcc(%ebp)
c0101c5a:	a1 10 c0 
c0101c5d:	c7 85 38 ff ff ff 95 	movl   $0xc010a195,-0xc8(%ebp)
c0101c64:	a1 10 c0 
c0101c67:	c7 85 3c ff ff ff 9e 	movl   $0xc010a19e,-0xc4(%ebp)
c0101c6e:	a1 10 c0 
c0101c71:	c7 45 bc 03 00 00 00 	movl   $0x3,-0x44(%ebp)
c0101c78:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0101c7f:	eb 49                	jmp    c0101cca <mkfs+0x53d>
c0101c81:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0101c85:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101c88:	8d 50 02             	lea    0x2(%eax),%edx
c0101c8b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101c8e:	89 10                	mov    %edx,(%eax)
c0101c90:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101c93:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0101c9a:	83 ec 0c             	sub    $0xc,%esp
c0101c9d:	50                   	push   %eax
c0101c9e:	e8 b5 8f 00 00       	call   c010ac58 <Strlen>
c0101ca3:	83 c4 10             	add    $0x10,%esp
c0101ca6:	89 c1                	mov    %eax,%ecx
c0101ca8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101cab:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0101cb2:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0101cb5:	83 c2 04             	add    $0x4,%edx
c0101cb8:	83 ec 04             	sub    $0x4,%esp
c0101cbb:	51                   	push   %ecx
c0101cbc:	50                   	push   %eax
c0101cbd:	52                   	push   %edx
c0101cbe:	e8 bb 4d 00 00       	call   c0106a7e <Memcpy>
c0101cc3:	83 c4 10             	add    $0x10,%esp
c0101cc6:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0101cca:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0101ccd:	3b 45 bc             	cmp    -0x44(%ebp),%eax
c0101cd0:	7c af                	jl     c0101c81 <mkfs+0x4f4>
c0101cd2:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0101cd9:	eb 66                	jmp    c0101d41 <mkfs+0x5b4>
c0101cdb:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101cde:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0101ce5:	83 ec 0c             	sub    $0xc,%esp
c0101ce8:	50                   	push   %eax
c0101ce9:	e8 6a 8f 00 00       	call   c010ac58 <Strlen>
c0101cee:	83 c4 10             	add    $0x10,%esp
c0101cf1:	85 c0                	test   %eax,%eax
c0101cf3:	74 47                	je     c0101d3c <mkfs+0x5af>
c0101cf5:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0101cf9:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101cfc:	8d 50 05             	lea    0x5(%eax),%edx
c0101cff:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101d02:	89 10                	mov    %edx,(%eax)
c0101d04:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101d07:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0101d0e:	83 ec 0c             	sub    $0xc,%esp
c0101d11:	50                   	push   %eax
c0101d12:	e8 41 8f 00 00       	call   c010ac58 <Strlen>
c0101d17:	83 c4 10             	add    $0x10,%esp
c0101d1a:	89 c1                	mov    %eax,%ecx
c0101d1c:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101d1f:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0101d26:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0101d29:	83 c2 04             	add    $0x4,%edx
c0101d2c:	83 ec 04             	sub    $0x4,%esp
c0101d2f:	51                   	push   %ecx
c0101d30:	50                   	push   %eax
c0101d31:	52                   	push   %edx
c0101d32:	e8 47 4d 00 00       	call   c0106a7e <Memcpy>
c0101d37:	83 c4 10             	add    $0x10,%esp
c0101d3a:	eb 01                	jmp    c0101d3d <mkfs+0x5b0>
c0101d3c:	90                   	nop
c0101d3d:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0101d41:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101d44:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0101d47:	7c 92                	jl     c0101cdb <mkfs+0x54e>
c0101d49:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0101d4e:	89 c2                	mov    %eax,%edx
c0101d50:	8b 45 98             	mov    -0x68(%ebp),%eax
c0101d53:	83 ec 0c             	sub    $0xc,%esp
c0101d56:	6a 0a                	push   $0xa
c0101d58:	68 00 02 00 00       	push   $0x200
c0101d5d:	52                   	push   %edx
c0101d5e:	6a 20                	push   $0x20
c0101d60:	50                   	push   %eax
c0101d61:	e8 4e f9 ff ff       	call   c01016b4 <rd_wt>
c0101d66:	83 c4 20             	add    $0x20,%esp
c0101d69:	90                   	nop
c0101d6a:	8b 7d fc             	mov    -0x4(%ebp),%edi
c0101d6d:	c9                   	leave  
c0101d6e:	c3                   	ret    

c0101d6f <init_fs>:
c0101d6f:	55                   	push   %ebp
c0101d70:	89 e5                	mov    %esp,%ebp
c0101d72:	83 ec 18             	sub    $0x18,%esp
c0101d75:	83 ec 0c             	sub    $0xc,%esp
c0101d78:	6a 7c                	push   $0x7c
c0101d7a:	e8 fd f6 ff ff       	call   c010147c <sys_malloc>
c0101d7f:	83 c4 10             	add    $0x10,%esp
c0101d82:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101d85:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101d88:	c7 40 78 06 00 00 00 	movl   $0x6,0x78(%eax)
c0101d8f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101d92:	c7 40 14 20 00 00 00 	movl   $0x20,0x14(%eax)
c0101d99:	83 ec 04             	sub    $0x4,%esp
c0101d9c:	6a 03                	push   $0x3
c0101d9e:	ff 75 f4             	pushl  -0xc(%ebp)
c0101da1:	6a 03                	push   $0x3
c0101da3:	e8 cc 70 00 00       	call   c0108e74 <send_rec>
c0101da8:	83 c4 10             	add    $0x10,%esp
c0101dab:	e8 dd f9 ff ff       	call   c010178d <mkfs>
c0101db0:	83 ec 08             	sub    $0x8,%esp
c0101db3:	6a 7c                	push   $0x7c
c0101db5:	ff 75 f4             	pushl  -0xc(%ebp)
c0101db8:	e8 d4 f6 ff ff       	call   c0101491 <sys_free>
c0101dbd:	83 c4 10             	add    $0x10,%esp
c0101dc0:	90                   	nop
c0101dc1:	c9                   	leave  
c0101dc2:	c3                   	ret    

c0101dc3 <do_open>:
c0101dc3:	55                   	push   %ebp
c0101dc4:	89 e5                	mov    %esp,%ebp
c0101dc6:	83 ec 68             	sub    $0x68,%esp
c0101dc9:	83 ec 04             	sub    $0x4,%esp
c0101dcc:	6a 0c                	push   $0xc
c0101dce:	6a 00                	push   $0x0
c0101dd0:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0101dd3:	50                   	push   %eax
c0101dd4:	e8 46 8e 00 00       	call   c010ac1f <Memset>
c0101dd9:	83 c4 10             	add    $0x10,%esp
c0101ddc:	8b 45 08             	mov    0x8(%ebp),%eax
c0101ddf:	8b 40 44             	mov    0x44(%eax),%eax
c0101de2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0101de5:	83 ec 08             	sub    $0x8,%esp
c0101de8:	6a 0c                	push   $0xc
c0101dea:	ff 75 e4             	pushl  -0x1c(%ebp)
c0101ded:	e8 72 3e 00 00       	call   c0105c64 <alloc_virtual_memory>
c0101df2:	83 c4 10             	add    $0x10,%esp
c0101df5:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0101df8:	8b 45 08             	mov    0x8(%ebp),%eax
c0101dfb:	8b 40 40             	mov    0x40(%eax),%eax
c0101dfe:	89 c2                	mov    %eax,%edx
c0101e00:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101e03:	83 ec 04             	sub    $0x4,%esp
c0101e06:	52                   	push   %edx
c0101e07:	50                   	push   %eax
c0101e08:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0101e0b:	50                   	push   %eax
c0101e0c:	e8 6d 4c 00 00       	call   c0106a7e <Memcpy>
c0101e11:	83 c4 10             	add    $0x10,%esp
c0101e14:	8b 45 08             	mov    0x8(%ebp),%eax
c0101e17:	8b 40 40             	mov    0x40(%eax),%eax
c0101e1a:	c6 44 05 c4 00       	movb   $0x0,-0x3c(%ebp,%eax,1)
c0101e1f:	8b 45 08             	mov    0x8(%ebp),%eax
c0101e22:	8b 40 74             	mov    0x74(%eax),%eax
c0101e25:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0101e28:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c0101e2f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0101e36:	eb 1f                	jmp    c0101e57 <do_open+0x94>
c0101e38:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c0101e3d:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0101e40:	83 c2 50             	add    $0x50,%edx
c0101e43:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
c0101e47:	85 c0                	test   %eax,%eax
c0101e49:	75 08                	jne    c0101e53 <do_open+0x90>
c0101e4b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0101e4e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0101e51:	eb 0a                	jmp    c0101e5d <do_open+0x9a>
c0101e53:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0101e57:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c0101e5b:	7e db                	jle    c0101e38 <do_open+0x75>
c0101e5d:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c0101e61:	75 1c                	jne    c0101e7f <do_open+0xbc>
c0101e63:	68 c6 01 00 00       	push   $0x1c6
c0101e68:	68 b4 a0 10 c0       	push   $0xc010a0b4
c0101e6d:	68 b4 a0 10 c0       	push   $0xc010a0b4
c0101e72:	68 a7 a1 10 c0       	push   $0xc010a1a7
c0101e77:	e8 db 65 00 00       	call   c0108457 <assertion_failure>
c0101e7c:	83 c4 10             	add    $0x10,%esp
c0101e7f:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%ebp)
c0101e86:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0101e8d:	eb 1d                	jmp    c0101eac <do_open+0xe9>
c0101e8f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101e92:	c1 e0 04             	shl    $0x4,%eax
c0101e95:	05 88 13 11 c0       	add    $0xc0111388,%eax
c0101e9a:	8b 00                	mov    (%eax),%eax
c0101e9c:	85 c0                	test   %eax,%eax
c0101e9e:	75 08                	jne    c0101ea8 <do_open+0xe5>
c0101ea0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101ea3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0101ea6:	eb 0a                	jmp    c0101eb2 <do_open+0xef>
c0101ea8:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0101eac:	83 7d e8 3f          	cmpl   $0x3f,-0x18(%ebp)
c0101eb0:	7e dd                	jle    c0101e8f <do_open+0xcc>
c0101eb2:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
c0101eb6:	75 1c                	jne    c0101ed4 <do_open+0x111>
c0101eb8:	68 d2 01 00 00       	push   $0x1d2
c0101ebd:	68 b4 a0 10 c0       	push   $0xc010a0b4
c0101ec2:	68 b4 a0 10 c0       	push   $0xc010a0b4
c0101ec7:	68 af a1 10 c0       	push   $0xc010a1af
c0101ecc:	e8 86 65 00 00       	call   c0108457 <assertion_failure>
c0101ed1:	83 c4 10             	add    $0x10,%esp
c0101ed4:	83 ec 0c             	sub    $0xc,%esp
c0101ed7:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0101eda:	50                   	push   %eax
c0101edb:	e8 b2 00 00 00       	call   c0101f92 <search_file>
c0101ee0:	83 c4 10             	add    $0x10,%esp
c0101ee3:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0101ee6:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c0101eea:	75 2b                	jne    c0101f17 <do_open+0x154>
c0101eec:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0101ef0:	7e 10                	jle    c0101f02 <do_open+0x13f>
c0101ef2:	83 ec 0c             	sub    $0xc,%esp
c0101ef5:	68 b7 a1 10 c0       	push   $0xc010a1b7
c0101efa:	e8 3a 65 00 00       	call   c0108439 <panic>
c0101eff:	83 c4 10             	add    $0x10,%esp
c0101f02:	83 ec 08             	sub    $0x8,%esp
c0101f05:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0101f08:	50                   	push   %eax
c0101f09:	8d 45 9c             	lea    -0x64(%ebp),%eax
c0101f0c:	50                   	push   %eax
c0101f0d:	e8 40 04 00 00       	call   c0102352 <create_file>
c0101f12:	83 c4 10             	add    $0x10,%esp
c0101f15:	eb 22                	jmp    c0101f39 <do_open+0x176>
c0101f17:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
c0101f1b:	75 07                	jne    c0101f24 <do_open+0x161>
c0101f1d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0101f22:	eb 6c                	jmp    c0101f90 <do_open+0x1cd>
c0101f24:	83 ec 08             	sub    $0x8,%esp
c0101f27:	ff 75 d8             	pushl  -0x28(%ebp)
c0101f2a:	8d 45 9c             	lea    -0x64(%ebp),%eax
c0101f2d:	50                   	push   %eax
c0101f2e:	e8 5d 02 00 00       	call   c0102190 <get_inode>
c0101f33:	83 c4 10             	add    $0x10,%esp
c0101f36:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0101f39:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c0101f3e:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0101f41:	c1 e2 04             	shl    $0x4,%edx
c0101f44:	8d 8a 80 13 11 c0    	lea    -0x3feeec80(%edx),%ecx
c0101f4a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0101f4d:	83 c2 50             	add    $0x50,%edx
c0101f50:	89 4c 90 08          	mov    %ecx,0x8(%eax,%edx,4)
c0101f54:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0101f57:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0101f5a:	c1 e2 04             	shl    $0x4,%edx
c0101f5d:	81 c2 88 13 11 c0    	add    $0xc0111388,%edx
c0101f63:	89 02                	mov    %eax,(%edx)
c0101f65:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101f68:	c1 e0 04             	shl    $0x4,%eax
c0101f6b:	05 84 13 11 c0       	add    $0xc0111384,%eax
c0101f70:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0101f76:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0101f79:	c1 e0 04             	shl    $0x4,%eax
c0101f7c:	05 80 13 11 c0       	add    $0xc0111380,%eax
c0101f81:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0101f87:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101f8a:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0101f8d:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0101f90:	c9                   	leave  
c0101f91:	c3                   	ret    

c0101f92 <search_file>:
c0101f92:	55                   	push   %ebp
c0101f93:	89 e5                	mov    %esp,%ebp
c0101f95:	83 ec 68             	sub    $0x68,%esp
c0101f98:	83 ec 04             	sub    $0x4,%esp
c0101f9b:	6a 0c                	push   $0xc
c0101f9d:	6a 00                	push   $0x0
c0101f9f:	8d 45 c0             	lea    -0x40(%ebp),%eax
c0101fa2:	50                   	push   %eax
c0101fa3:	e8 77 8c 00 00       	call   c010ac1f <Memset>
c0101fa8:	83 c4 10             	add    $0x10,%esp
c0101fab:	83 ec 04             	sub    $0x4,%esp
c0101fae:	6a 28                	push   $0x28
c0101fb0:	6a 00                	push   $0x0
c0101fb2:	8d 45 98             	lea    -0x68(%ebp),%eax
c0101fb5:	50                   	push   %eax
c0101fb6:	e8 64 8c 00 00       	call   c010ac1f <Memset>
c0101fbb:	83 c4 10             	add    $0x10,%esp
c0101fbe:	83 ec 04             	sub    $0x4,%esp
c0101fc1:	8d 45 98             	lea    -0x68(%ebp),%eax
c0101fc4:	50                   	push   %eax
c0101fc5:	ff 75 08             	pushl  0x8(%ebp)
c0101fc8:	8d 45 c0             	lea    -0x40(%ebp),%eax
c0101fcb:	50                   	push   %eax
c0101fcc:	e8 f3 00 00 00       	call   c01020c4 <strip_path>
c0101fd1:	83 c4 10             	add    $0x10,%esp
c0101fd4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0101fd7:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%ebp)
c0101fdb:	75 0a                	jne    c0101fe7 <search_file+0x55>
c0101fdd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0101fe2:	e9 db 00 00 00       	jmp    c01020c2 <search_file+0x130>
c0101fe7:	8b 45 9c             	mov    -0x64(%ebp),%eax
c0101fea:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0101fed:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101ff0:	05 00 02 00 00       	add    $0x200,%eax
c0101ff5:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0101ffb:	85 c0                	test   %eax,%eax
c0101ffd:	0f 48 c2             	cmovs  %edx,%eax
c0102000:	c1 f8 09             	sar    $0x9,%eax
c0102003:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0102006:	8b 45 9c             	mov    -0x64(%ebp),%eax
c0102009:	c1 e8 04             	shr    $0x4,%eax
c010200c:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010200f:	e8 5c 14 00 00       	call   c0103470 <get_super_block>
c0102014:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0102017:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010201a:	8b 00                	mov    (%eax),%eax
c010201c:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010201f:	c7 45 cc 20 00 00 00 	movl   $0x20,-0x34(%ebp)
c0102026:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010202d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102034:	eb 7b                	jmp    c01020b1 <search_file+0x11f>
c0102036:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010203b:	89 c1                	mov    %eax,%ecx
c010203d:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0102040:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102043:	01 d0                	add    %edx,%eax
c0102045:	83 ec 0c             	sub    $0xc,%esp
c0102048:	6a 07                	push   $0x7
c010204a:	68 00 02 00 00       	push   $0x200
c010204f:	51                   	push   %ecx
c0102050:	ff 75 cc             	pushl  -0x34(%ebp)
c0102053:	50                   	push   %eax
c0102054:	e8 5b f6 ff ff       	call   c01016b4 <rd_wt>
c0102059:	83 c4 20             	add    $0x20,%esp
c010205c:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0102061:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102064:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010206b:	eb 35                	jmp    c01020a2 <search_file+0x110>
c010206d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0102071:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102074:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0102077:	7f 33                	jg     c01020ac <search_file+0x11a>
c0102079:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010207c:	83 c0 04             	add    $0x4,%eax
c010207f:	83 ec 08             	sub    $0x8,%esp
c0102082:	50                   	push   %eax
c0102083:	8d 45 c0             	lea    -0x40(%ebp),%eax
c0102086:	50                   	push   %eax
c0102087:	e8 4f 71 00 00       	call   c01091db <strcmp>
c010208c:	83 c4 10             	add    $0x10,%esp
c010208f:	85 c0                	test   %eax,%eax
c0102091:	75 07                	jne    c010209a <search_file+0x108>
c0102093:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102096:	8b 00                	mov    (%eax),%eax
c0102098:	eb 28                	jmp    c01020c2 <search_file+0x130>
c010209a:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c010209e:	83 45 ec 10          	addl   $0x10,-0x14(%ebp)
c01020a2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01020a5:	83 f8 1f             	cmp    $0x1f,%eax
c01020a8:	76 c3                	jbe    c010206d <search_file+0xdb>
c01020aa:	eb 01                	jmp    c01020ad <search_file+0x11b>
c01020ac:	90                   	nop
c01020ad:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01020b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01020b4:	3b 45 dc             	cmp    -0x24(%ebp),%eax
c01020b7:	0f 8c 79 ff ff ff    	jl     c0102036 <search_file+0xa4>
c01020bd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01020c2:	c9                   	leave  
c01020c3:	c3                   	ret    

c01020c4 <strip_path>:
c01020c4:	55                   	push   %ebp
c01020c5:	89 e5                	mov    %esp,%ebp
c01020c7:	83 ec 10             	sub    $0x10,%esp
c01020ca:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01020ce:	75 0a                	jne    c01020da <strip_path+0x16>
c01020d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01020d5:	e9 b4 00 00 00       	jmp    c010218e <strip_path+0xca>
c01020da:	8b 45 08             	mov    0x8(%ebp),%eax
c01020dd:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01020e0:	8b 45 0c             	mov    0xc(%ebp),%eax
c01020e3:	89 45 f8             	mov    %eax,-0x8(%ebp)
c01020e6:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01020e9:	0f b6 00             	movzbl (%eax),%eax
c01020ec:	3c 2f                	cmp    $0x2f,%al
c01020ee:	75 2d                	jne    c010211d <strip_path+0x59>
c01020f0:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c01020f4:	eb 27                	jmp    c010211d <strip_path+0x59>
c01020f6:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01020f9:	0f b6 00             	movzbl (%eax),%eax
c01020fc:	3c 2f                	cmp    $0x2f,%al
c01020fe:	75 0a                	jne    c010210a <strip_path+0x46>
c0102100:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0102105:	e9 84 00 00 00       	jmp    c010218e <strip_path+0xca>
c010210a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010210d:	0f b6 10             	movzbl (%eax),%edx
c0102110:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0102113:	88 10                	mov    %dl,(%eax)
c0102115:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0102119:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c010211d:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0102120:	0f b6 00             	movzbl (%eax),%eax
c0102123:	84 c0                	test   %al,%al
c0102125:	75 cf                	jne    c01020f6 <strip_path+0x32>
c0102127:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010212a:	c6 00 00             	movb   $0x0,(%eax)
c010212d:	8b 45 10             	mov    0x10(%ebp),%eax
c0102130:	8b 15 c0 21 11 c0    	mov    0xc01121c0,%edx
c0102136:	89 10                	mov    %edx,(%eax)
c0102138:	8b 15 c4 21 11 c0    	mov    0xc01121c4,%edx
c010213e:	89 50 04             	mov    %edx,0x4(%eax)
c0102141:	8b 15 c8 21 11 c0    	mov    0xc01121c8,%edx
c0102147:	89 50 08             	mov    %edx,0x8(%eax)
c010214a:	8b 15 cc 21 11 c0    	mov    0xc01121cc,%edx
c0102150:	89 50 0c             	mov    %edx,0xc(%eax)
c0102153:	8b 15 d0 21 11 c0    	mov    0xc01121d0,%edx
c0102159:	89 50 10             	mov    %edx,0x10(%eax)
c010215c:	8b 15 d4 21 11 c0    	mov    0xc01121d4,%edx
c0102162:	89 50 14             	mov    %edx,0x14(%eax)
c0102165:	8b 15 d8 21 11 c0    	mov    0xc01121d8,%edx
c010216b:	89 50 18             	mov    %edx,0x18(%eax)
c010216e:	8b 15 dc 21 11 c0    	mov    0xc01121dc,%edx
c0102174:	89 50 1c             	mov    %edx,0x1c(%eax)
c0102177:	8b 15 e0 21 11 c0    	mov    0xc01121e0,%edx
c010217d:	89 50 20             	mov    %edx,0x20(%eax)
c0102180:	8b 15 e4 21 11 c0    	mov    0xc01121e4,%edx
c0102186:	89 50 24             	mov    %edx,0x24(%eax)
c0102189:	b8 00 00 00 00       	mov    $0x0,%eax
c010218e:	c9                   	leave  
c010218f:	c3                   	ret    

c0102190 <get_inode>:
c0102190:	55                   	push   %ebp
c0102191:	89 e5                	mov    %esp,%ebp
c0102193:	56                   	push   %esi
c0102194:	53                   	push   %ebx
c0102195:	83 ec 20             	sub    $0x20,%esp
c0102198:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c010219c:	75 0a                	jne    c01021a8 <get_inode+0x18>
c010219e:	b8 00 00 00 00       	mov    $0x0,%eax
c01021a3:	e9 a3 01 00 00       	jmp    c010234b <get_inode+0x1bb>
c01021a8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01021af:	c7 45 f0 a0 17 11 c0 	movl   $0xc01117a0,-0x10(%ebp)
c01021b6:	eb 69                	jmp    c0102221 <get_inode+0x91>
c01021b8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01021bb:	8b 40 24             	mov    0x24(%eax),%eax
c01021be:	85 c0                	test   %eax,%eax
c01021c0:	7e 53                	jle    c0102215 <get_inode+0x85>
c01021c2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01021c5:	8b 40 10             	mov    0x10(%eax),%eax
c01021c8:	39 45 0c             	cmp    %eax,0xc(%ebp)
c01021cb:	75 50                	jne    c010221d <get_inode+0x8d>
c01021cd:	8b 45 08             	mov    0x8(%ebp),%eax
c01021d0:	8b 55 f0             	mov    -0x10(%ebp),%edx
c01021d3:	8b 0a                	mov    (%edx),%ecx
c01021d5:	89 08                	mov    %ecx,(%eax)
c01021d7:	8b 4a 04             	mov    0x4(%edx),%ecx
c01021da:	89 48 04             	mov    %ecx,0x4(%eax)
c01021dd:	8b 4a 08             	mov    0x8(%edx),%ecx
c01021e0:	89 48 08             	mov    %ecx,0x8(%eax)
c01021e3:	8b 4a 0c             	mov    0xc(%edx),%ecx
c01021e6:	89 48 0c             	mov    %ecx,0xc(%eax)
c01021e9:	8b 4a 10             	mov    0x10(%edx),%ecx
c01021ec:	89 48 10             	mov    %ecx,0x10(%eax)
c01021ef:	8b 4a 14             	mov    0x14(%edx),%ecx
c01021f2:	89 48 14             	mov    %ecx,0x14(%eax)
c01021f5:	8b 4a 18             	mov    0x18(%edx),%ecx
c01021f8:	89 48 18             	mov    %ecx,0x18(%eax)
c01021fb:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c01021fe:	89 48 1c             	mov    %ecx,0x1c(%eax)
c0102201:	8b 4a 20             	mov    0x20(%edx),%ecx
c0102204:	89 48 20             	mov    %ecx,0x20(%eax)
c0102207:	8b 52 24             	mov    0x24(%edx),%edx
c010220a:	89 50 24             	mov    %edx,0x24(%eax)
c010220d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102210:	e9 36 01 00 00       	jmp    c010234b <get_inode+0x1bb>
c0102215:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102218:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010221b:	eb 0d                	jmp    c010222a <get_inode+0x9a>
c010221d:	83 45 f0 28          	addl   $0x28,-0x10(%ebp)
c0102221:	81 7d f0 a0 21 11 c0 	cmpl   $0xc01121a0,-0x10(%ebp)
c0102228:	76 8e                	jbe    c01021b8 <get_inode+0x28>
c010222a:	e8 41 12 00 00       	call   c0103470 <get_super_block>
c010222f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102232:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c0102239:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010223c:	8b 40 04             	mov    0x4(%eax),%eax
c010223f:	8d 50 02             	lea    0x2(%eax),%edx
c0102242:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102245:	8b 40 08             	mov    0x8(%eax),%eax
c0102248:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c010224b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010224e:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0102251:	b8 00 02 00 00       	mov    $0x200,%eax
c0102256:	99                   	cltd   
c0102257:	f7 7d e8             	idivl  -0x18(%ebp)
c010225a:	89 c6                	mov    %eax,%esi
c010225c:	89 c8                	mov    %ecx,%eax
c010225e:	99                   	cltd   
c010225f:	f7 fe                	idiv   %esi
c0102261:	01 d8                	add    %ebx,%eax
c0102263:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0102266:	c7 45 e0 20 00 00 00 	movl   $0x20,-0x20(%ebp)
c010226d:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102272:	83 ec 0c             	sub    $0xc,%esp
c0102275:	6a 07                	push   $0x7
c0102277:	68 00 02 00 00       	push   $0x200
c010227c:	50                   	push   %eax
c010227d:	ff 75 e0             	pushl  -0x20(%ebp)
c0102280:	ff 75 e4             	pushl  -0x1c(%ebp)
c0102283:	e8 2c f4 ff ff       	call   c01016b4 <rd_wt>
c0102288:	83 c4 20             	add    $0x20,%esp
c010228b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010228e:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0102291:	b8 00 02 00 00       	mov    $0x200,%eax
c0102296:	99                   	cltd   
c0102297:	f7 7d e8             	idivl  -0x18(%ebp)
c010229a:	89 c3                	mov    %eax,%ebx
c010229c:	89 c8                	mov    %ecx,%eax
c010229e:	99                   	cltd   
c010229f:	f7 fb                	idiv   %ebx
c01022a1:	89 55 dc             	mov    %edx,-0x24(%ebp)
c01022a4:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01022aa:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01022ad:	0f af 45 dc          	imul   -0x24(%ebp),%eax
c01022b1:	01 d0                	add    %edx,%eax
c01022b3:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01022b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01022b9:	8b 55 d8             	mov    -0x28(%ebp),%edx
c01022bc:	8b 0a                	mov    (%edx),%ecx
c01022be:	89 08                	mov    %ecx,(%eax)
c01022c0:	8b 4a 04             	mov    0x4(%edx),%ecx
c01022c3:	89 48 04             	mov    %ecx,0x4(%eax)
c01022c6:	8b 4a 08             	mov    0x8(%edx),%ecx
c01022c9:	89 48 08             	mov    %ecx,0x8(%eax)
c01022cc:	8b 4a 0c             	mov    0xc(%edx),%ecx
c01022cf:	89 48 0c             	mov    %ecx,0xc(%eax)
c01022d2:	8b 4a 10             	mov    0x10(%edx),%ecx
c01022d5:	89 48 10             	mov    %ecx,0x10(%eax)
c01022d8:	8b 4a 14             	mov    0x14(%edx),%ecx
c01022db:	89 48 14             	mov    %ecx,0x14(%eax)
c01022de:	8b 4a 18             	mov    0x18(%edx),%ecx
c01022e1:	89 48 18             	mov    %ecx,0x18(%eax)
c01022e4:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c01022e7:	89 48 1c             	mov    %ecx,0x1c(%eax)
c01022ea:	8b 4a 20             	mov    0x20(%edx),%ecx
c01022ed:	89 48 20             	mov    %ecx,0x20(%eax)
c01022f0:	8b 52 24             	mov    0x24(%edx),%edx
c01022f3:	89 50 24             	mov    %edx,0x24(%eax)
c01022f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01022f9:	8b 55 0c             	mov    0xc(%ebp),%edx
c01022fc:	89 50 10             	mov    %edx,0x10(%eax)
c01022ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102302:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0102305:	89 50 20             	mov    %edx,0x20(%eax)
c0102308:	8b 45 08             	mov    0x8(%ebp),%eax
c010230b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010230e:	8b 0a                	mov    (%edx),%ecx
c0102310:	89 08                	mov    %ecx,(%eax)
c0102312:	8b 4a 04             	mov    0x4(%edx),%ecx
c0102315:	89 48 04             	mov    %ecx,0x4(%eax)
c0102318:	8b 4a 08             	mov    0x8(%edx),%ecx
c010231b:	89 48 08             	mov    %ecx,0x8(%eax)
c010231e:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0102321:	89 48 0c             	mov    %ecx,0xc(%eax)
c0102324:	8b 4a 10             	mov    0x10(%edx),%ecx
c0102327:	89 48 10             	mov    %ecx,0x10(%eax)
c010232a:	8b 4a 14             	mov    0x14(%edx),%ecx
c010232d:	89 48 14             	mov    %ecx,0x14(%eax)
c0102330:	8b 4a 18             	mov    0x18(%edx),%ecx
c0102333:	89 48 18             	mov    %ecx,0x18(%eax)
c0102336:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0102339:	89 48 1c             	mov    %ecx,0x1c(%eax)
c010233c:	8b 4a 20             	mov    0x20(%edx),%ecx
c010233f:	89 48 20             	mov    %ecx,0x20(%eax)
c0102342:	8b 52 24             	mov    0x24(%edx),%edx
c0102345:	89 50 24             	mov    %edx,0x24(%eax)
c0102348:	8b 45 08             	mov    0x8(%ebp),%eax
c010234b:	8d 65 f8             	lea    -0x8(%ebp),%esp
c010234e:	5b                   	pop    %ebx
c010234f:	5e                   	pop    %esi
c0102350:	5d                   	pop    %ebp
c0102351:	c3                   	ret    

c0102352 <create_file>:
c0102352:	55                   	push   %ebp
c0102353:	89 e5                	mov    %esp,%ebp
c0102355:	81 ec 98 00 00 00    	sub    $0x98,%esp
c010235b:	8d 45 b8             	lea    -0x48(%ebp),%eax
c010235e:	50                   	push   %eax
c010235f:	ff 75 0c             	pushl  0xc(%ebp)
c0102362:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0102365:	50                   	push   %eax
c0102366:	e8 59 fd ff ff       	call   c01020c4 <strip_path>
c010236b:	83 c4 0c             	add    $0xc,%esp
c010236e:	83 f8 ff             	cmp    $0xffffffff,%eax
c0102371:	75 0a                	jne    c010237d <create_file+0x2b>
c0102373:	b8 00 00 00 00       	mov    $0x0,%eax
c0102378:	e9 de 00 00 00       	jmp    c010245b <create_file+0x109>
c010237d:	e8 db 00 00 00       	call   c010245d <alloc_imap_bit>
c0102382:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102385:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102389:	75 0a                	jne    c0102395 <create_file+0x43>
c010238b:	b8 00 00 00 00       	mov    $0x0,%eax
c0102390:	e9 c6 00 00 00       	jmp    c010245b <create_file+0x109>
c0102395:	e8 d6 10 00 00       	call   c0103470 <get_super_block>
c010239a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010239d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01023a0:	8b 40 10             	mov    0x10(%eax),%eax
c01023a3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01023a6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01023a9:	83 ec 08             	sub    $0x8,%esp
c01023ac:	50                   	push   %eax
c01023ad:	ff 75 f4             	pushl  -0xc(%ebp)
c01023b0:	e8 a5 01 00 00       	call   c010255a <alloc_smap_bit>
c01023b5:	83 c4 10             	add    $0x10,%esp
c01023b8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01023bb:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c01023bf:	75 0a                	jne    c01023cb <create_file+0x79>
c01023c1:	b8 00 00 00 00       	mov    $0x0,%eax
c01023c6:	e9 90 00 00 00       	jmp    c010245b <create_file+0x109>
c01023cb:	83 ec 04             	sub    $0x4,%esp
c01023ce:	ff 75 e8             	pushl  -0x18(%ebp)
c01023d1:	ff 75 f4             	pushl  -0xc(%ebp)
c01023d4:	8d 45 84             	lea    -0x7c(%ebp),%eax
c01023d7:	50                   	push   %eax
c01023d8:	e8 1e 03 00 00       	call   c01026fb <new_inode>
c01023dd:	83 c4 10             	add    $0x10,%esp
c01023e0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01023e3:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c01023e7:	75 07                	jne    c01023f0 <create_file+0x9e>
c01023e9:	b8 00 00 00 00       	mov    $0x0,%eax
c01023ee:	eb 6b                	jmp    c010245b <create_file+0x109>
c01023f0:	ff 75 f4             	pushl  -0xc(%ebp)
c01023f3:	8d 45 ac             	lea    -0x54(%ebp),%eax
c01023f6:	50                   	push   %eax
c01023f7:	8d 45 b8             	lea    -0x48(%ebp),%eax
c01023fa:	50                   	push   %eax
c01023fb:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0102401:	50                   	push   %eax
c0102402:	e8 12 04 00 00       	call   c0102819 <new_dir_entry>
c0102407:	83 c4 10             	add    $0x10,%esp
c010240a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010240d:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0102411:	75 07                	jne    c010241a <create_file+0xc8>
c0102413:	b8 00 00 00 00       	mov    $0x0,%eax
c0102418:	eb 41                	jmp    c010245b <create_file+0x109>
c010241a:	8b 45 08             	mov    0x8(%ebp),%eax
c010241d:	8b 55 84             	mov    -0x7c(%ebp),%edx
c0102420:	89 10                	mov    %edx,(%eax)
c0102422:	8b 55 88             	mov    -0x78(%ebp),%edx
c0102425:	89 50 04             	mov    %edx,0x4(%eax)
c0102428:	8b 55 8c             	mov    -0x74(%ebp),%edx
c010242b:	89 50 08             	mov    %edx,0x8(%eax)
c010242e:	8b 55 90             	mov    -0x70(%ebp),%edx
c0102431:	89 50 0c             	mov    %edx,0xc(%eax)
c0102434:	8b 55 94             	mov    -0x6c(%ebp),%edx
c0102437:	89 50 10             	mov    %edx,0x10(%eax)
c010243a:	8b 55 98             	mov    -0x68(%ebp),%edx
c010243d:	89 50 14             	mov    %edx,0x14(%eax)
c0102440:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0102443:	89 50 18             	mov    %edx,0x18(%eax)
c0102446:	8b 55 a0             	mov    -0x60(%ebp),%edx
c0102449:	89 50 1c             	mov    %edx,0x1c(%eax)
c010244c:	8b 55 a4             	mov    -0x5c(%ebp),%edx
c010244f:	89 50 20             	mov    %edx,0x20(%eax)
c0102452:	8b 55 a8             	mov    -0x58(%ebp),%edx
c0102455:	89 50 24             	mov    %edx,0x24(%eax)
c0102458:	8b 45 08             	mov    0x8(%ebp),%eax
c010245b:	c9                   	leave  
c010245c:	c3                   	ret    

c010245d <alloc_imap_bit>:
c010245d:	55                   	push   %ebp
c010245e:	89 e5                	mov    %esp,%ebp
c0102460:	53                   	push   %ebx
c0102461:	83 ec 24             	sub    $0x24,%esp
c0102464:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c010246b:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c0102472:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102477:	83 ec 0c             	sub    $0xc,%esp
c010247a:	6a 07                	push   $0x7
c010247c:	68 00 02 00 00       	push   $0x200
c0102481:	50                   	push   %eax
c0102482:	ff 75 e8             	pushl  -0x18(%ebp)
c0102485:	ff 75 ec             	pushl  -0x14(%ebp)
c0102488:	e8 27 f2 ff ff       	call   c01016b4 <rd_wt>
c010248d:	83 c4 20             	add    $0x20,%esp
c0102490:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0102497:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010249e:	e9 a5 00 00 00       	jmp    c0102548 <alloc_imap_bit+0xeb>
c01024a3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01024aa:	e9 8b 00 00 00       	jmp    c010253a <alloc_imap_bit+0xdd>
c01024af:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01024b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01024b8:	01 d0                	add    %edx,%eax
c01024ba:	0f b6 00             	movzbl (%eax),%eax
c01024bd:	0f be d0             	movsbl %al,%edx
c01024c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01024c3:	89 c1                	mov    %eax,%ecx
c01024c5:	d3 fa                	sar    %cl,%edx
c01024c7:	89 d0                	mov    %edx,%eax
c01024c9:	83 e0 01             	and    $0x1,%eax
c01024cc:	85 c0                	test   %eax,%eax
c01024ce:	74 06                	je     c01024d6 <alloc_imap_bit+0x79>
c01024d0:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01024d4:	eb 64                	jmp    c010253a <alloc_imap_bit+0xdd>
c01024d6:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01024dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01024df:	01 d0                	add    %edx,%eax
c01024e1:	0f b6 18             	movzbl (%eax),%ebx
c01024e4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01024e7:	ba 01 00 00 00       	mov    $0x1,%edx
c01024ec:	89 c1                	mov    %eax,%ecx
c01024ee:	d3 e2                	shl    %cl,%edx
c01024f0:	89 d0                	mov    %edx,%eax
c01024f2:	89 c1                	mov    %eax,%ecx
c01024f4:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01024fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01024fd:	01 d0                	add    %edx,%eax
c01024ff:	09 cb                	or     %ecx,%ebx
c0102501:	89 da                	mov    %ebx,%edx
c0102503:	88 10                	mov    %dl,(%eax)
c0102505:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102508:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c010250f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102512:	01 d0                	add    %edx,%eax
c0102514:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0102517:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010251c:	83 ec 0c             	sub    $0xc,%esp
c010251f:	6a 0a                	push   $0xa
c0102521:	68 00 02 00 00       	push   $0x200
c0102526:	50                   	push   %eax
c0102527:	ff 75 e8             	pushl  -0x18(%ebp)
c010252a:	ff 75 ec             	pushl  -0x14(%ebp)
c010252d:	e8 82 f1 ff ff       	call   c01016b4 <rd_wt>
c0102532:	83 c4 20             	add    $0x20,%esp
c0102535:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102538:	eb 1b                	jmp    c0102555 <alloc_imap_bit+0xf8>
c010253a:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
c010253e:	0f 8e 6b ff ff ff    	jle    c01024af <alloc_imap_bit+0x52>
c0102544:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0102548:	81 7d f4 ff 01 00 00 	cmpl   $0x1ff,-0xc(%ebp)
c010254f:	0f 8e 4e ff ff ff    	jle    c01024a3 <alloc_imap_bit+0x46>
c0102555:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0102558:	c9                   	leave  
c0102559:	c3                   	ret    

c010255a <alloc_smap_bit>:
c010255a:	55                   	push   %ebp
c010255b:	89 e5                	mov    %esp,%ebp
c010255d:	53                   	push   %ebx
c010255e:	83 ec 34             	sub    $0x34,%esp
c0102561:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102565:	75 1c                	jne    c0102583 <alloc_smap_bit+0x29>
c0102567:	68 fc 02 00 00       	push   $0x2fc
c010256c:	68 b4 a0 10 c0       	push   $0xc010a0b4
c0102571:	68 b4 a0 10 c0       	push   $0xc010a0b4
c0102576:	68 c4 a1 10 c0       	push   $0xc010a1c4
c010257b:	e8 d7 5e 00 00       	call   c0108457 <assertion_failure>
c0102580:	83 c4 10             	add    $0x10,%esp
c0102583:	e8 e8 0e 00 00       	call   c0103470 <get_super_block>
c0102588:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010258b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010258e:	8b 40 08             	mov    0x8(%eax),%eax
c0102591:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0102594:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102597:	8b 40 04             	mov    0x4(%eax),%eax
c010259a:	83 c0 02             	add    $0x2,%eax
c010259d:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01025a0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01025a7:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c01025ae:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01025b5:	e9 20 01 00 00       	jmp    c01026da <alloc_smap_bit+0x180>
c01025ba:	8b 55 dc             	mov    -0x24(%ebp),%edx
c01025bd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01025c0:	01 d0                	add    %edx,%eax
c01025c2:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01025c5:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01025ca:	83 ec 0c             	sub    $0xc,%esp
c01025cd:	6a 07                	push   $0x7
c01025cf:	68 00 02 00 00       	push   $0x200
c01025d4:	50                   	push   %eax
c01025d5:	ff 75 d8             	pushl  -0x28(%ebp)
c01025d8:	ff 75 d4             	pushl  -0x2c(%ebp)
c01025db:	e8 d4 f0 ff ff       	call   c01016b4 <rd_wt>
c01025e0:	83 c4 20             	add    $0x20,%esp
c01025e3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01025ea:	e9 b0 00 00 00       	jmp    c010269f <alloc_smap_bit+0x145>
c01025ef:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01025f6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01025fa:	0f 85 8c 00 00 00    	jne    c010268c <alloc_smap_bit+0x132>
c0102600:	eb 45                	jmp    c0102647 <alloc_smap_bit+0xed>
c0102602:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102608:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010260b:	01 d0                	add    %edx,%eax
c010260d:	0f b6 00             	movzbl (%eax),%eax
c0102610:	0f be d0             	movsbl %al,%edx
c0102613:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102616:	89 c1                	mov    %eax,%ecx
c0102618:	d3 fa                	sar    %cl,%edx
c010261a:	89 d0                	mov    %edx,%eax
c010261c:	83 e0 01             	and    $0x1,%eax
c010261f:	85 c0                	test   %eax,%eax
c0102621:	74 06                	je     c0102629 <alloc_smap_bit+0xcf>
c0102623:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0102627:	eb 1e                	jmp    c0102647 <alloc_smap_bit+0xed>
c0102629:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010262c:	c1 e0 09             	shl    $0x9,%eax
c010262f:	89 c2                	mov    %eax,%edx
c0102631:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102634:	01 d0                	add    %edx,%eax
c0102636:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c010263d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102640:	01 d0                	add    %edx,%eax
c0102642:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102645:	eb 06                	jmp    c010264d <alloc_smap_bit+0xf3>
c0102647:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c010264b:	7e b5                	jle    c0102602 <alloc_smap_bit+0xa8>
c010264d:	eb 3d                	jmp    c010268c <alloc_smap_bit+0x132>
c010264f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102653:	74 45                	je     c010269a <alloc_smap_bit+0x140>
c0102655:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c010265b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010265e:	01 d0                	add    %edx,%eax
c0102660:	0f b6 18             	movzbl (%eax),%ebx
c0102663:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102666:	ba 01 00 00 00       	mov    $0x1,%edx
c010266b:	89 c1                	mov    %eax,%ecx
c010266d:	d3 e2                	shl    %cl,%edx
c010266f:	89 d0                	mov    %edx,%eax
c0102671:	89 c1                	mov    %eax,%ecx
c0102673:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102679:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010267c:	01 d0                	add    %edx,%eax
c010267e:	09 cb                	or     %ecx,%ebx
c0102680:	89 da                	mov    %ebx,%edx
c0102682:	88 10                	mov    %dl,(%eax)
c0102684:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0102688:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c010268c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0102690:	74 09                	je     c010269b <alloc_smap_bit+0x141>
c0102692:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0102696:	7e b7                	jle    c010264f <alloc_smap_bit+0xf5>
c0102698:	eb 01                	jmp    c010269b <alloc_smap_bit+0x141>
c010269a:	90                   	nop
c010269b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c010269f:	81 7d ec ff 01 00 00 	cmpl   $0x1ff,-0x14(%ebp)
c01026a6:	0f 8e 43 ff ff ff    	jle    c01025ef <alloc_smap_bit+0x95>
c01026ac:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01026b0:	74 1e                	je     c01026d0 <alloc_smap_bit+0x176>
c01026b2:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01026b7:	83 ec 0c             	sub    $0xc,%esp
c01026ba:	6a 0a                	push   $0xa
c01026bc:	68 00 02 00 00       	push   $0x200
c01026c1:	50                   	push   %eax
c01026c2:	ff 75 d8             	pushl  -0x28(%ebp)
c01026c5:	ff 75 d4             	pushl  -0x2c(%ebp)
c01026c8:	e8 e7 ef ff ff       	call   c01016b4 <rd_wt>
c01026cd:	83 c4 20             	add    $0x20,%esp
c01026d0:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01026d4:	74 12                	je     c01026e8 <alloc_smap_bit+0x18e>
c01026d6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01026da:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01026dd:	3b 45 e0             	cmp    -0x20(%ebp),%eax
c01026e0:	0f 8c d4 fe ff ff    	jl     c01025ba <alloc_smap_bit+0x60>
c01026e6:	eb 01                	jmp    c01026e9 <alloc_smap_bit+0x18f>
c01026e8:	90                   	nop
c01026e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01026ec:	8d 50 ff             	lea    -0x1(%eax),%edx
c01026ef:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01026f2:	8b 00                	mov    (%eax),%eax
c01026f4:	01 d0                	add    %edx,%eax
c01026f6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01026f9:	c9                   	leave  
c01026fa:	c3                   	ret    

c01026fb <new_inode>:
c01026fb:	55                   	push   %ebp
c01026fc:	89 e5                	mov    %esp,%ebp
c01026fe:	83 ec 38             	sub    $0x38,%esp
c0102701:	83 ec 08             	sub    $0x8,%esp
c0102704:	ff 75 0c             	pushl  0xc(%ebp)
c0102707:	8d 45 c8             	lea    -0x38(%ebp),%eax
c010270a:	50                   	push   %eax
c010270b:	e8 80 fa ff ff       	call   c0102190 <get_inode>
c0102710:	83 c4 10             	add    $0x10,%esp
c0102713:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0102716:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010271a:	75 0a                	jne    c0102726 <new_inode+0x2b>
c010271c:	b8 00 00 00 00       	mov    $0x0,%eax
c0102721:	e9 f1 00 00 00       	jmp    c0102817 <new_inode+0x11c>
c0102726:	8b 45 10             	mov    0x10(%ebp),%eax
c0102729:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010272c:	c7 45 d4 00 08 00 00 	movl   $0x800,-0x2c(%ebp)
c0102733:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c010273a:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
c0102741:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102744:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0102747:	83 ec 0c             	sub    $0xc,%esp
c010274a:	8d 45 c8             	lea    -0x38(%ebp),%eax
c010274d:	50                   	push   %eax
c010274e:	e8 39 0b 00 00       	call   c010328c <sync_inode>
c0102753:	83 c4 10             	add    $0x10,%esp
c0102756:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c010275d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0102764:	eb 1d                	jmp    c0102783 <new_inode+0x88>
c0102766:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102769:	89 d0                	mov    %edx,%eax
c010276b:	c1 e0 02             	shl    $0x2,%eax
c010276e:	01 d0                	add    %edx,%eax
c0102770:	c1 e0 03             	shl    $0x3,%eax
c0102773:	05 b0 17 11 c0       	add    $0xc01117b0,%eax
c0102778:	8b 00                	mov    (%eax),%eax
c010277a:	39 45 0c             	cmp    %eax,0xc(%ebp)
c010277d:	74 0c                	je     c010278b <new_inode+0x90>
c010277f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0102783:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c0102787:	7e dd                	jle    c0102766 <new_inode+0x6b>
c0102789:	eb 01                	jmp    c010278c <new_inode+0x91>
c010278b:	90                   	nop
c010278c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010278f:	89 d0                	mov    %edx,%eax
c0102791:	c1 e0 02             	shl    $0x2,%eax
c0102794:	01 d0                	add    %edx,%eax
c0102796:	c1 e0 03             	shl    $0x3,%eax
c0102799:	05 a0 17 11 c0       	add    $0xc01117a0,%eax
c010279e:	8b 55 c8             	mov    -0x38(%ebp),%edx
c01027a1:	89 10                	mov    %edx,(%eax)
c01027a3:	8b 55 cc             	mov    -0x34(%ebp),%edx
c01027a6:	89 50 04             	mov    %edx,0x4(%eax)
c01027a9:	8b 55 d0             	mov    -0x30(%ebp),%edx
c01027ac:	89 50 08             	mov    %edx,0x8(%eax)
c01027af:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c01027b2:	89 50 0c             	mov    %edx,0xc(%eax)
c01027b5:	8b 55 d8             	mov    -0x28(%ebp),%edx
c01027b8:	89 50 10             	mov    %edx,0x10(%eax)
c01027bb:	8b 55 dc             	mov    -0x24(%ebp),%edx
c01027be:	89 50 14             	mov    %edx,0x14(%eax)
c01027c1:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01027c4:	89 50 18             	mov    %edx,0x18(%eax)
c01027c7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01027ca:	89 50 1c             	mov    %edx,0x1c(%eax)
c01027cd:	8b 55 e8             	mov    -0x18(%ebp),%edx
c01027d0:	89 50 20             	mov    %edx,0x20(%eax)
c01027d3:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01027d6:	89 50 24             	mov    %edx,0x24(%eax)
c01027d9:	8b 45 08             	mov    0x8(%ebp),%eax
c01027dc:	8b 55 c8             	mov    -0x38(%ebp),%edx
c01027df:	89 10                	mov    %edx,(%eax)
c01027e1:	8b 55 cc             	mov    -0x34(%ebp),%edx
c01027e4:	89 50 04             	mov    %edx,0x4(%eax)
c01027e7:	8b 55 d0             	mov    -0x30(%ebp),%edx
c01027ea:	89 50 08             	mov    %edx,0x8(%eax)
c01027ed:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c01027f0:	89 50 0c             	mov    %edx,0xc(%eax)
c01027f3:	8b 55 d8             	mov    -0x28(%ebp),%edx
c01027f6:	89 50 10             	mov    %edx,0x10(%eax)
c01027f9:	8b 55 dc             	mov    -0x24(%ebp),%edx
c01027fc:	89 50 14             	mov    %edx,0x14(%eax)
c01027ff:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0102802:	89 50 18             	mov    %edx,0x18(%eax)
c0102805:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0102808:	89 50 1c             	mov    %edx,0x1c(%eax)
c010280b:	8b 55 e8             	mov    -0x18(%ebp),%edx
c010280e:	89 50 20             	mov    %edx,0x20(%eax)
c0102811:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0102814:	89 50 24             	mov    %edx,0x24(%eax)
c0102817:	c9                   	leave  
c0102818:	c3                   	ret    

c0102819 <new_dir_entry>:
c0102819:	55                   	push   %ebp
c010281a:	89 e5                	mov    %esp,%ebp
c010281c:	83 ec 48             	sub    $0x48,%esp
c010281f:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
c0102826:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102829:	8b 40 04             	mov    0x4(%eax),%eax
c010282c:	99                   	cltd   
c010282d:	f7 7d dc             	idivl  -0x24(%ebp)
c0102830:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0102833:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102836:	8b 40 0c             	mov    0xc(%eax),%eax
c0102839:	99                   	cltd   
c010283a:	f7 7d dc             	idivl  -0x24(%ebp)
c010283d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0102840:	e8 2b 0c 00 00       	call   c0103470 <get_super_block>
c0102845:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0102848:	8b 45 d0             	mov    -0x30(%ebp),%eax
c010284b:	8b 00                	mov    (%eax),%eax
c010284d:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0102850:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102853:	8b 40 0c             	mov    0xc(%eax),%eax
c0102856:	05 00 02 00 00       	add    $0x200,%eax
c010285b:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0102861:	85 c0                	test   %eax,%eax
c0102863:	0f 48 c2             	cmovs  %edx,%eax
c0102866:	c1 f8 09             	sar    $0x9,%eax
c0102869:	89 45 c8             	mov    %eax,-0x38(%ebp)
c010286c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0102873:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c010287a:	c7 45 c4 20 00 00 00 	movl   $0x20,-0x3c(%ebp)
c0102881:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0102888:	eb 7f                	jmp    c0102909 <new_dir_entry+0xf0>
c010288a:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010288f:	89 c1                	mov    %eax,%ecx
c0102891:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102894:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102897:	01 d0                	add    %edx,%eax
c0102899:	83 ec 0c             	sub    $0xc,%esp
c010289c:	6a 07                	push   $0x7
c010289e:	68 00 02 00 00       	push   $0x200
c01028a3:	51                   	push   %ecx
c01028a4:	ff 75 c4             	pushl  -0x3c(%ebp)
c01028a7:	50                   	push   %eax
c01028a8:	e8 07 ee ff ff       	call   c01016b4 <rd_wt>
c01028ad:	83 c4 20             	add    $0x20,%esp
c01028b0:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c01028b5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01028b8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01028bf:	eb 25                	jmp    c01028e6 <new_dir_entry+0xcd>
c01028c1:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c01028c5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01028c8:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c01028cb:	7f 29                	jg     c01028f6 <new_dir_entry+0xdd>
c01028cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01028d0:	8b 00                	mov    (%eax),%eax
c01028d2:	85 c0                	test   %eax,%eax
c01028d4:	75 08                	jne    c01028de <new_dir_entry+0xc5>
c01028d6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01028d9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01028dc:	eb 19                	jmp    c01028f7 <new_dir_entry+0xde>
c01028de:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c01028e2:	83 45 f0 10          	addl   $0x10,-0x10(%ebp)
c01028e6:	b8 00 02 00 00       	mov    $0x200,%eax
c01028eb:	99                   	cltd   
c01028ec:	f7 7d dc             	idivl  -0x24(%ebp)
c01028ef:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c01028f2:	7c cd                	jl     c01028c1 <new_dir_entry+0xa8>
c01028f4:	eb 01                	jmp    c01028f7 <new_dir_entry+0xde>
c01028f6:	90                   	nop
c01028f7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01028fa:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c01028fd:	7f 16                	jg     c0102915 <new_dir_entry+0xfc>
c01028ff:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102903:	75 10                	jne    c0102915 <new_dir_entry+0xfc>
c0102905:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0102909:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010290c:	3b 45 c8             	cmp    -0x38(%ebp),%eax
c010290f:	0f 8c 75 ff ff ff    	jl     c010288a <new_dir_entry+0x71>
c0102915:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0102918:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
c010291b:	75 0a                	jne    c0102927 <new_dir_entry+0x10e>
c010291d:	b8 00 00 00 00       	mov    $0x0,%eax
c0102922:	e9 fc 00 00 00       	jmp    c0102a23 <new_dir_entry+0x20a>
c0102927:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c010292e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0102932:	75 1e                	jne    c0102952 <new_dir_entry+0x139>
c0102934:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102937:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010293a:	8b 45 0c             	mov    0xc(%ebp),%eax
c010293d:	8b 50 04             	mov    0x4(%eax),%edx
c0102940:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0102943:	01 c2                	add    %eax,%edx
c0102945:	8b 45 0c             	mov    0xc(%ebp),%eax
c0102948:	89 50 04             	mov    %edx,0x4(%eax)
c010294b:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0102952:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102955:	8b 55 14             	mov    0x14(%ebp),%edx
c0102958:	89 10                	mov    %edx,(%eax)
c010295a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010295d:	83 c0 04             	add    $0x4,%eax
c0102960:	83 ec 08             	sub    $0x8,%esp
c0102963:	ff 75 10             	pushl  0x10(%ebp)
c0102966:	50                   	push   %eax
c0102967:	e8 d2 82 00 00       	call   c010ac3e <Strcpy>
c010296c:	83 c4 10             	add    $0x10,%esp
c010296f:	8b 45 08             	mov    0x8(%ebp),%eax
c0102972:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0102975:	8b 0a                	mov    (%edx),%ecx
c0102977:	89 08                	mov    %ecx,(%eax)
c0102979:	8b 4a 04             	mov    0x4(%edx),%ecx
c010297c:	89 48 04             	mov    %ecx,0x4(%eax)
c010297f:	8b 4a 08             	mov    0x8(%edx),%ecx
c0102982:	89 48 08             	mov    %ecx,0x8(%eax)
c0102985:	8b 52 0c             	mov    0xc(%edx),%edx
c0102988:	89 50 0c             	mov    %edx,0xc(%eax)
c010298b:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102990:	89 c1                	mov    %eax,%ecx
c0102992:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0102995:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0102998:	01 d0                	add    %edx,%eax
c010299a:	83 ec 0c             	sub    $0xc,%esp
c010299d:	6a 0a                	push   $0xa
c010299f:	68 00 02 00 00       	push   $0x200
c01029a4:	51                   	push   %ecx
c01029a5:	ff 75 c4             	pushl  -0x3c(%ebp)
c01029a8:	50                   	push   %eax
c01029a9:	e8 06 ed ff ff       	call   c01016b4 <rd_wt>
c01029ae:	83 c4 20             	add    $0x20,%esp
c01029b1:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c01029b5:	74 69                	je     c0102a20 <new_dir_entry+0x207>
c01029b7:	8b 45 0c             	mov    0xc(%ebp),%eax
c01029ba:	8b 10                	mov    (%eax),%edx
c01029bc:	89 15 c0 21 11 c0    	mov    %edx,0xc01121c0
c01029c2:	8b 50 04             	mov    0x4(%eax),%edx
c01029c5:	89 15 c4 21 11 c0    	mov    %edx,0xc01121c4
c01029cb:	8b 50 08             	mov    0x8(%eax),%edx
c01029ce:	89 15 c8 21 11 c0    	mov    %edx,0xc01121c8
c01029d4:	8b 50 0c             	mov    0xc(%eax),%edx
c01029d7:	89 15 cc 21 11 c0    	mov    %edx,0xc01121cc
c01029dd:	8b 50 10             	mov    0x10(%eax),%edx
c01029e0:	89 15 d0 21 11 c0    	mov    %edx,0xc01121d0
c01029e6:	8b 50 14             	mov    0x14(%eax),%edx
c01029e9:	89 15 d4 21 11 c0    	mov    %edx,0xc01121d4
c01029ef:	8b 50 18             	mov    0x18(%eax),%edx
c01029f2:	89 15 d8 21 11 c0    	mov    %edx,0xc01121d8
c01029f8:	8b 50 1c             	mov    0x1c(%eax),%edx
c01029fb:	89 15 dc 21 11 c0    	mov    %edx,0xc01121dc
c0102a01:	8b 50 20             	mov    0x20(%eax),%edx
c0102a04:	89 15 e0 21 11 c0    	mov    %edx,0xc01121e0
c0102a0a:	8b 40 24             	mov    0x24(%eax),%eax
c0102a0d:	a3 e4 21 11 c0       	mov    %eax,0xc01121e4
c0102a12:	83 ec 0c             	sub    $0xc,%esp
c0102a15:	ff 75 0c             	pushl  0xc(%ebp)
c0102a18:	e8 6f 08 00 00       	call   c010328c <sync_inode>
c0102a1d:	83 c4 10             	add    $0x10,%esp
c0102a20:	8b 45 08             	mov    0x8(%ebp),%eax
c0102a23:	c9                   	leave  
c0102a24:	c3                   	ret    

c0102a25 <do_unlink>:
c0102a25:	55                   	push   %ebp
c0102a26:	89 e5                	mov    %esp,%ebp
c0102a28:	53                   	push   %ebx
c0102a29:	81 ec a4 00 00 00    	sub    $0xa4,%esp
c0102a2f:	83 ec 08             	sub    $0x8,%esp
c0102a32:	ff 75 08             	pushl  0x8(%ebp)
c0102a35:	68 d9 a1 10 c0       	push   $0xc010a1d9
c0102a3a:	e8 9c 67 00 00       	call   c01091db <strcmp>
c0102a3f:	83 c4 10             	add    $0x10,%esp
c0102a42:	85 c0                	test   %eax,%eax
c0102a44:	75 10                	jne    c0102a56 <do_unlink+0x31>
c0102a46:	83 ec 0c             	sub    $0xc,%esp
c0102a49:	68 db a1 10 c0       	push   $0xc010a1db
c0102a4e:	e8 e6 59 00 00       	call   c0108439 <panic>
c0102a53:	83 c4 10             	add    $0x10,%esp
c0102a56:	83 ec 0c             	sub    $0xc,%esp
c0102a59:	ff 75 08             	pushl  0x8(%ebp)
c0102a5c:	e8 31 f5 ff ff       	call   c0101f92 <search_file>
c0102a61:	83 c4 10             	add    $0x10,%esp
c0102a64:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0102a67:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0102a6b:	75 10                	jne    c0102a7d <do_unlink+0x58>
c0102a6d:	83 ec 0c             	sub    $0xc,%esp
c0102a70:	68 f7 a1 10 c0       	push   $0xc010a1f7
c0102a75:	e8 bf 59 00 00       	call   c0108439 <panic>
c0102a7a:	83 c4 10             	add    $0x10,%esp
c0102a7d:	83 ec 08             	sub    $0x8,%esp
c0102a80:	ff 75 d0             	pushl  -0x30(%ebp)
c0102a83:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0102a89:	50                   	push   %eax
c0102a8a:	e8 01 f7 ff ff       	call   c0102190 <get_inode>
c0102a8f:	83 c4 10             	add    $0x10,%esp
c0102a92:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0102a95:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0102a99:	75 10                	jne    c0102aab <do_unlink+0x86>
c0102a9b:	83 ec 0c             	sub    $0xc,%esp
c0102a9e:	68 f7 a1 10 c0       	push   $0xc010a1f7
c0102aa3:	e8 91 59 00 00       	call   c0108439 <panic>
c0102aa8:	83 c4 10             	add    $0x10,%esp
c0102aab:	8b 45 88             	mov    -0x78(%ebp),%eax
c0102aae:	85 c0                	test   %eax,%eax
c0102ab0:	7e 10                	jle    c0102ac2 <do_unlink+0x9d>
c0102ab2:	83 ec 0c             	sub    $0xc,%esp
c0102ab5:	68 10 a2 10 c0       	push   $0xc010a210
c0102aba:	e8 7a 59 00 00       	call   c0108439 <panic>
c0102abf:	83 c4 10             	add    $0x10,%esp
c0102ac2:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0102ac8:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0102acb:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0102ace:	8d 50 07             	lea    0x7(%eax),%edx
c0102ad1:	85 c0                	test   %eax,%eax
c0102ad3:	0f 48 c2             	cmovs  %edx,%eax
c0102ad6:	c1 f8 03             	sar    $0x3,%eax
c0102ad9:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0102adc:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0102adf:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0102ae5:	85 c0                	test   %eax,%eax
c0102ae7:	0f 48 c2             	cmovs  %edx,%eax
c0102aea:	c1 f8 09             	sar    $0x9,%eax
c0102aed:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0102af0:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0102af3:	99                   	cltd   
c0102af4:	c1 ea 1d             	shr    $0x1d,%edx
c0102af7:	01 d0                	add    %edx,%eax
c0102af9:	83 e0 07             	and    $0x7,%eax
c0102afc:	29 d0                	sub    %edx,%eax
c0102afe:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0102b01:	c7 45 b8 20 00 00 00 	movl   $0x20,-0x48(%ebp)
c0102b08:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102b0d:	89 c2                	mov    %eax,%edx
c0102b0f:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0102b12:	83 c0 02             	add    $0x2,%eax
c0102b15:	83 ec 0c             	sub    $0xc,%esp
c0102b18:	6a 07                	push   $0x7
c0102b1a:	68 00 02 00 00       	push   $0x200
c0102b1f:	52                   	push   %edx
c0102b20:	ff 75 b8             	pushl  -0x48(%ebp)
c0102b23:	50                   	push   %eax
c0102b24:	e8 8b eb ff ff       	call   c01016b4 <rd_wt>
c0102b29:	83 c4 20             	add    $0x20,%esp
c0102b2c:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102b32:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0102b35:	01 d0                	add    %edx,%eax
c0102b37:	0f b6 10             	movzbl (%eax),%edx
c0102b3a:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0102b3d:	bb 01 00 00 00       	mov    $0x1,%ebx
c0102b42:	89 c1                	mov    %eax,%ecx
c0102b44:	d3 e3                	shl    %cl,%ebx
c0102b46:	89 d8                	mov    %ebx,%eax
c0102b48:	f7 d0                	not    %eax
c0102b4a:	89 c3                	mov    %eax,%ebx
c0102b4c:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0102b52:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0102b55:	01 c8                	add    %ecx,%eax
c0102b57:	21 da                	and    %ebx,%edx
c0102b59:	88 10                	mov    %dl,(%eax)
c0102b5b:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102b60:	89 c2                	mov    %eax,%edx
c0102b62:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0102b65:	83 c0 02             	add    $0x2,%eax
c0102b68:	83 ec 0c             	sub    $0xc,%esp
c0102b6b:	6a 0a                	push   $0xa
c0102b6d:	68 00 02 00 00       	push   $0x200
c0102b72:	52                   	push   %edx
c0102b73:	ff 75 b8             	pushl  -0x48(%ebp)
c0102b76:	50                   	push   %eax
c0102b77:	e8 38 eb ff ff       	call   c01016b4 <rd_wt>
c0102b7c:	83 c4 20             	add    $0x20,%esp
c0102b7f:	e8 ec 08 00 00       	call   c0103470 <get_super_block>
c0102b84:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0102b87:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0102b8d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0102b90:	8b 00                	mov    (%eax),%eax
c0102b92:	29 c2                	sub    %eax,%edx
c0102b94:	89 d0                	mov    %edx,%eax
c0102b96:	83 c0 01             	add    $0x1,%eax
c0102b99:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0102b9c:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0102b9f:	8d 50 07             	lea    0x7(%eax),%edx
c0102ba2:	85 c0                	test   %eax,%eax
c0102ba4:	0f 48 c2             	cmovs  %edx,%eax
c0102ba7:	c1 f8 03             	sar    $0x3,%eax
c0102baa:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0102bad:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0102bb0:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0102bb6:	85 c0                	test   %eax,%eax
c0102bb8:	0f 48 c2             	cmovs  %edx,%eax
c0102bbb:	c1 f8 09             	sar    $0x9,%eax
c0102bbe:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0102bc1:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0102bc4:	99                   	cltd   
c0102bc5:	c1 ea 1d             	shr    $0x1d,%edx
c0102bc8:	01 d0                	add    %edx,%eax
c0102bca:	83 e0 07             	and    $0x7,%eax
c0102bcd:	29 d0                	sub    %edx,%eax
c0102bcf:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0102bd2:	b8 08 00 00 00       	mov    $0x8,%eax
c0102bd7:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c0102bda:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0102bdd:	29 c2                	sub    %eax,%edx
c0102bdf:	89 d0                	mov    %edx,%eax
c0102be1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0102be4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102be7:	8d 50 07             	lea    0x7(%eax),%edx
c0102bea:	85 c0                	test   %eax,%eax
c0102bec:	0f 48 c2             	cmovs  %edx,%eax
c0102bef:	c1 f8 03             	sar    $0x3,%eax
c0102bf2:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0102bf5:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102bfa:	89 c1                	mov    %eax,%ecx
c0102bfc:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0102bff:	8b 40 04             	mov    0x4(%eax),%eax
c0102c02:	8d 50 02             	lea    0x2(%eax),%edx
c0102c05:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0102c08:	01 d0                	add    %edx,%eax
c0102c0a:	83 ec 0c             	sub    $0xc,%esp
c0102c0d:	6a 07                	push   $0x7
c0102c0f:	68 00 02 00 00       	push   $0x200
c0102c14:	51                   	push   %ecx
c0102c15:	ff 75 b8             	pushl  -0x48(%ebp)
c0102c18:	50                   	push   %eax
c0102c19:	e8 96 ea ff ff       	call   c01016b4 <rd_wt>
c0102c1e:	83 c4 20             	add    $0x20,%esp
c0102c21:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102c27:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0102c2a:	01 d0                	add    %edx,%eax
c0102c2c:	0f b6 10             	movzbl (%eax),%edx
c0102c2f:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0102c32:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0102c37:	89 c1                	mov    %eax,%ecx
c0102c39:	d3 e3                	shl    %cl,%ebx
c0102c3b:	89 d8                	mov    %ebx,%eax
c0102c3d:	f7 d0                	not    %eax
c0102c3f:	89 c3                	mov    %eax,%ebx
c0102c41:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0102c47:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0102c4a:	01 c8                	add    %ecx,%eax
c0102c4c:	21 da                	and    %ebx,%edx
c0102c4e:	88 10                	mov    %dl,(%eax)
c0102c50:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0102c57:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0102c5a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0102c5d:	eb 6b                	jmp    c0102cca <do_unlink+0x2a5>
c0102c5f:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0102c66:	75 4c                	jne    c0102cb4 <do_unlink+0x28f>
c0102c68:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102c6f:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102c74:	83 ec 0c             	sub    $0xc,%esp
c0102c77:	6a 0a                	push   $0xa
c0102c79:	68 00 02 00 00       	push   $0x200
c0102c7e:	50                   	push   %eax
c0102c7f:	ff 75 b8             	pushl  -0x48(%ebp)
c0102c82:	ff 75 ec             	pushl  -0x14(%ebp)
c0102c85:	e8 2a ea ff ff       	call   c01016b4 <rd_wt>
c0102c8a:	83 c4 20             	add    $0x20,%esp
c0102c8d:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102c92:	89 c1                	mov    %eax,%ecx
c0102c94:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102c97:	8d 50 01             	lea    0x1(%eax),%edx
c0102c9a:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0102c9d:	83 ec 0c             	sub    $0xc,%esp
c0102ca0:	6a 07                	push   $0x7
c0102ca2:	68 00 02 00 00       	push   $0x200
c0102ca7:	51                   	push   %ecx
c0102ca8:	ff 75 b8             	pushl  -0x48(%ebp)
c0102cab:	50                   	push   %eax
c0102cac:	e8 03 ea ff ff       	call   c01016b4 <rd_wt>
c0102cb1:	83 c4 20             	add    $0x20,%esp
c0102cb4:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102cba:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102cbd:	01 d0                	add    %edx,%eax
c0102cbf:	c6 00 00             	movb   $0x0,(%eax)
c0102cc2:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0102cc6:	83 6d f4 08          	subl   $0x8,-0xc(%ebp)
c0102cca:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102ccd:	3b 45 a0             	cmp    -0x60(%ebp),%eax
c0102cd0:	7c 8d                	jl     c0102c5f <do_unlink+0x23a>
c0102cd2:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0102cd9:	75 4c                	jne    c0102d27 <do_unlink+0x302>
c0102cdb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0102ce2:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102ce7:	83 ec 0c             	sub    $0xc,%esp
c0102cea:	6a 0a                	push   $0xa
c0102cec:	68 00 02 00 00       	push   $0x200
c0102cf1:	50                   	push   %eax
c0102cf2:	ff 75 b8             	pushl  -0x48(%ebp)
c0102cf5:	ff 75 ec             	pushl  -0x14(%ebp)
c0102cf8:	e8 b7 e9 ff ff       	call   c01016b4 <rd_wt>
c0102cfd:	83 c4 20             	add    $0x20,%esp
c0102d00:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102d05:	89 c1                	mov    %eax,%ecx
c0102d07:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0102d0a:	8d 50 01             	lea    0x1(%eax),%edx
c0102d0d:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0102d10:	83 ec 0c             	sub    $0xc,%esp
c0102d13:	6a 07                	push   $0x7
c0102d15:	68 00 02 00 00       	push   $0x200
c0102d1a:	51                   	push   %ecx
c0102d1b:	ff 75 b8             	pushl  -0x48(%ebp)
c0102d1e:	50                   	push   %eax
c0102d1f:	e8 90 e9 ff ff       	call   c01016b4 <rd_wt>
c0102d24:	83 c4 20             	add    $0x20,%esp
c0102d27:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0102d2d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102d30:	01 d0                	add    %edx,%eax
c0102d32:	0f b6 10             	movzbl (%eax),%edx
c0102d35:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0102d38:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0102d3d:	89 c1                	mov    %eax,%ecx
c0102d3f:	d3 e3                	shl    %cl,%ebx
c0102d41:	89 d8                	mov    %ebx,%eax
c0102d43:	89 c3                	mov    %eax,%ebx
c0102d45:	8b 0d a4 21 11 c0    	mov    0xc01121a4,%ecx
c0102d4b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102d4e:	01 c8                	add    %ecx,%eax
c0102d50:	21 da                	and    %ebx,%edx
c0102d52:	88 10                	mov    %dl,(%eax)
c0102d54:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102d59:	83 ec 0c             	sub    $0xc,%esp
c0102d5c:	6a 0a                	push   $0xa
c0102d5e:	68 00 02 00 00       	push   $0x200
c0102d63:	50                   	push   %eax
c0102d64:	ff 75 b8             	pushl  -0x48(%ebp)
c0102d67:	ff 75 ec             	pushl  -0x14(%ebp)
c0102d6a:	e8 45 e9 ff ff       	call   c01016b4 <rd_wt>
c0102d6f:	83 c4 20             	add    $0x20,%esp
c0102d72:	c7 85 6c ff ff ff 00 	movl   $0x0,-0x94(%ebp)
c0102d79:	00 00 00 
c0102d7c:	c7 85 68 ff ff ff 00 	movl   $0x0,-0x98(%ebp)
c0102d83:	00 00 00 
c0102d86:	c7 85 70 ff ff ff 00 	movl   $0x0,-0x90(%ebp)
c0102d8d:	00 00 00 
c0102d90:	83 ec 0c             	sub    $0xc,%esp
c0102d93:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0102d99:	50                   	push   %eax
c0102d9a:	e8 ed 04 00 00       	call   c010328c <sync_inode>
c0102d9f:	83 c4 10             	add    $0x10,%esp
c0102da2:	83 ec 0c             	sub    $0xc,%esp
c0102da5:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0102dab:	50                   	push   %eax
c0102dac:	e8 2f 06 00 00       	call   c01033e0 <put_inode>
c0102db1:	83 c4 10             	add    $0x10,%esp
c0102db4:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0102db7:	8b 00                	mov    (%eax),%eax
c0102db9:	89 45 9c             	mov    %eax,-0x64(%ebp)
c0102dbc:	c7 45 98 c0 21 11 c0 	movl   $0xc01121c0,-0x68(%ebp)
c0102dc3:	8b 45 98             	mov    -0x68(%ebp),%eax
c0102dc6:	8b 40 04             	mov    0x4(%eax),%eax
c0102dc9:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0102dcc:	8b 45 98             	mov    -0x68(%ebp),%eax
c0102dcf:	8b 40 0c             	mov    0xc(%eax),%eax
c0102dd2:	89 45 90             	mov    %eax,-0x70(%ebp)
c0102dd5:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0102dd8:	c1 e8 04             	shr    $0x4,%eax
c0102ddb:	89 45 8c             	mov    %eax,-0x74(%ebp)
c0102dde:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0102de5:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0102dec:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0102df3:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0102dfa:	e9 a5 00 00 00       	jmp    c0102ea4 <do_unlink+0x47f>
c0102dff:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102e04:	89 c1                	mov    %eax,%ecx
c0102e06:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0102e09:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0102e0c:	01 d0                	add    %edx,%eax
c0102e0e:	83 ec 0c             	sub    $0xc,%esp
c0102e11:	6a 07                	push   $0x7
c0102e13:	68 00 02 00 00       	push   $0x200
c0102e18:	51                   	push   %ecx
c0102e19:	ff 75 b8             	pushl  -0x48(%ebp)
c0102e1c:	50                   	push   %eax
c0102e1d:	e8 92 e8 ff ff       	call   c01016b4 <rd_wt>
c0102e22:	83 c4 20             	add    $0x20,%esp
c0102e25:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c0102e2a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0102e2d:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0102e34:	eb 51                	jmp    c0102e87 <do_unlink+0x462>
c0102e36:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0102e3a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102e3d:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0102e40:	7f 4f                	jg     c0102e91 <do_unlink+0x46c>
c0102e42:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0102e45:	83 c0 10             	add    $0x10,%eax
c0102e48:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0102e4b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0102e4e:	83 c0 04             	add    $0x4,%eax
c0102e51:	83 ec 08             	sub    $0x8,%esp
c0102e54:	ff 75 08             	pushl  0x8(%ebp)
c0102e57:	50                   	push   %eax
c0102e58:	e8 7e 63 00 00       	call   c01091db <strcmp>
c0102e5d:	83 c4 10             	add    $0x10,%esp
c0102e60:	85 c0                	test   %eax,%eax
c0102e62:	75 1b                	jne    c0102e7f <do_unlink+0x45a>
c0102e64:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c0102e6b:	83 ec 04             	sub    $0x4,%esp
c0102e6e:	6a 10                	push   $0x10
c0102e70:	6a 00                	push   $0x0
c0102e72:	ff 75 d4             	pushl  -0x2c(%ebp)
c0102e75:	e8 a5 7d 00 00       	call   c010ac1f <Memset>
c0102e7a:	83 c4 10             	add    $0x10,%esp
c0102e7d:	eb 13                	jmp    c0102e92 <do_unlink+0x46d>
c0102e7f:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
c0102e83:	83 45 d4 10          	addl   $0x10,-0x2c(%ebp)
c0102e87:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0102e8a:	3b 45 90             	cmp    -0x70(%ebp),%eax
c0102e8d:	7c a7                	jl     c0102e36 <do_unlink+0x411>
c0102e8f:	eb 01                	jmp    c0102e92 <do_unlink+0x46d>
c0102e91:	90                   	nop
c0102e92:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102e95:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0102e98:	7f 16                	jg     c0102eb0 <do_unlink+0x48b>
c0102e9a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0102e9e:	75 10                	jne    c0102eb0 <do_unlink+0x48b>
c0102ea0:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
c0102ea4:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0102ea7:	3b 45 90             	cmp    -0x70(%ebp),%eax
c0102eaa:	0f 8c 4f ff ff ff    	jl     c0102dff <do_unlink+0x3da>
c0102eb0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0102eb3:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0102eb6:	75 17                	jne    c0102ecf <do_unlink+0x4aa>
c0102eb8:	8b 45 98             	mov    -0x68(%ebp),%eax
c0102ebb:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0102ebe:	89 50 04             	mov    %edx,0x4(%eax)
c0102ec1:	83 ec 0c             	sub    $0xc,%esp
c0102ec4:	ff 75 98             	pushl  -0x68(%ebp)
c0102ec7:	e8 c0 03 00 00       	call   c010328c <sync_inode>
c0102ecc:	83 c4 10             	add    $0x10,%esp
c0102ecf:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0102ed3:	74 26                	je     c0102efb <do_unlink+0x4d6>
c0102ed5:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0102eda:	89 c1                	mov    %eax,%ecx
c0102edc:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0102edf:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0102ee2:	01 d0                	add    %edx,%eax
c0102ee4:	83 ec 0c             	sub    $0xc,%esp
c0102ee7:	6a 0a                	push   $0xa
c0102ee9:	68 00 02 00 00       	push   $0x200
c0102eee:	51                   	push   %ecx
c0102eef:	ff 75 b8             	pushl  -0x48(%ebp)
c0102ef2:	50                   	push   %eax
c0102ef3:	e8 bc e7 ff ff       	call   c01016b4 <rd_wt>
c0102ef8:	83 c4 20             	add    $0x20,%esp
c0102efb:	90                   	nop
c0102efc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0102eff:	c9                   	leave  
c0102f00:	c3                   	ret    

c0102f01 <do_rdwt>:
c0102f01:	55                   	push   %ebp
c0102f02:	89 e5                	mov    %esp,%ebp
c0102f04:	81 ec 98 00 00 00    	sub    $0x98,%esp
c0102f0a:	8b 45 08             	mov    0x8(%ebp),%eax
c0102f0d:	8b 40 78             	mov    0x78(%eax),%eax
c0102f10:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0102f13:	8b 45 08             	mov    0x8(%ebp),%eax
c0102f16:	8b 40 60             	mov    0x60(%eax),%eax
c0102f19:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0102f1c:	8b 45 08             	mov    0x8(%ebp),%eax
c0102f1f:	8b 40 6c             	mov    0x6c(%eax),%eax
c0102f22:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0102f25:	8b 45 08             	mov    0x8(%ebp),%eax
c0102f28:	8b 00                	mov    (%eax),%eax
c0102f2a:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0102f2d:	8b 45 08             	mov    0x8(%ebp),%eax
c0102f30:	8b 40 10             	mov    0x10(%eax),%eax
c0102f33:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0102f36:	8b 45 08             	mov    0x8(%ebp),%eax
c0102f39:	8b 40 50             	mov    0x50(%eax),%eax
c0102f3c:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0102f3f:	83 ec 0c             	sub    $0xc,%esp
c0102f42:	ff 75 d0             	pushl  -0x30(%ebp)
c0102f45:	e8 e2 06 00 00       	call   c010362c <pid2proc>
c0102f4a:	83 c4 10             	add    $0x10,%esp
c0102f4d:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0102f50:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0102f53:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0102f56:	83 c2 50             	add    $0x50,%edx
c0102f59:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
c0102f5d:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0102f60:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0102f63:	8b 40 08             	mov    0x8(%eax),%eax
c0102f66:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0102f69:	8b 45 08             	mov    0x8(%ebp),%eax
c0102f6c:	8b 00                	mov    (%eax),%eax
c0102f6e:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0102f71:	83 ec 08             	sub    $0x8,%esp
c0102f74:	ff 75 bc             	pushl  -0x44(%ebp)
c0102f77:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c0102f7d:	50                   	push   %eax
c0102f7e:	e8 0d f2 ff ff       	call   c0102190 <get_inode>
c0102f83:	83 c4 10             	add    $0x10,%esp
c0102f86:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0102f89:	83 7d b4 00          	cmpl   $0x0,-0x4c(%ebp)
c0102f8d:	75 10                	jne    c0102f9f <do_rdwt+0x9e>
c0102f8f:	83 ec 0c             	sub    $0xc,%esp
c0102f92:	68 48 a2 10 c0       	push   $0xc010a248
c0102f97:	e8 9d 54 00 00       	call   c0108439 <panic>
c0102f9c:	83 c4 10             	add    $0x10,%esp
c0102f9f:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c0102fa5:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0102fa8:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0102fab:	8b 40 04             	mov    0x4(%eax),%eax
c0102fae:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0102fb1:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c0102fb5:	74 22                	je     c0102fd9 <do_rdwt+0xd8>
c0102fb7:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c0102fbb:	74 1c                	je     c0102fd9 <do_rdwt+0xd8>
c0102fbd:	68 a7 04 00 00       	push   $0x4a7
c0102fc2:	68 b4 a0 10 c0       	push   $0xc010a0b4
c0102fc7:	68 b4 a0 10 c0       	push   $0xc010a0b4
c0102fcc:	68 58 a2 10 c0       	push   $0xc010a258
c0102fd1:	e8 81 54 00 00       	call   c0108457 <assertion_failure>
c0102fd6:	83 c4 10             	add    $0x10,%esp
c0102fd9:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
c0102fdf:	83 f8 01             	cmp    $0x1,%eax
c0102fe2:	0f 85 86 00 00 00    	jne    c010306e <do_rdwt+0x16d>
c0102fe8:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c0102fec:	75 09                	jne    c0102ff7 <do_rdwt+0xf6>
c0102fee:	c7 45 f4 d2 07 00 00 	movl   $0x7d2,-0xc(%ebp)
c0102ff5:	eb 0d                	jmp    c0103004 <do_rdwt+0x103>
c0102ff7:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c0102ffb:	75 07                	jne    c0103004 <do_rdwt+0x103>
c0102ffd:	c7 45 f4 d3 07 00 00 	movl   $0x7d3,-0xc(%ebp)
c0103004:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0103007:	8b 45 08             	mov    0x8(%ebp),%eax
c010300a:	89 50 78             	mov    %edx,0x78(%eax)
c010300d:	8b 55 b8             	mov    -0x48(%ebp),%edx
c0103010:	8b 45 08             	mov    0x8(%ebp),%eax
c0103013:	89 50 68             	mov    %edx,0x68(%eax)
c0103016:	83 ec 04             	sub    $0x4,%esp
c0103019:	6a 04                	push   $0x4
c010301b:	ff 75 08             	pushl  0x8(%ebp)
c010301e:	6a 03                	push   $0x3
c0103020:	e8 4f 5e 00 00       	call   c0108e74 <send_rec>
c0103025:	83 c4 10             	add    $0x10,%esp
c0103028:	8b 45 08             	mov    0x8(%ebp),%eax
c010302b:	8b 40 78             	mov    0x78(%eax),%eax
c010302e:	83 f8 66             	cmp    $0x66,%eax
c0103031:	75 13                	jne    c0103046 <do_rdwt+0x145>
c0103033:	83 ec 04             	sub    $0x4,%esp
c0103036:	ff 75 b8             	pushl  -0x48(%ebp)
c0103039:	ff 75 08             	pushl  0x8(%ebp)
c010303c:	6a 01                	push   $0x1
c010303e:	e8 31 5e 00 00       	call   c0108e74 <send_rec>
c0103043:	83 c4 10             	add    $0x10,%esp
c0103046:	8b 45 08             	mov    0x8(%ebp),%eax
c0103049:	8b 40 78             	mov    0x78(%eax),%eax
c010304c:	83 f8 65             	cmp    $0x65,%eax
c010304f:	75 13                	jne    c0103064 <do_rdwt+0x163>
c0103051:	83 ec 04             	sub    $0x4,%esp
c0103054:	ff 75 b8             	pushl  -0x48(%ebp)
c0103057:	ff 75 08             	pushl  0x8(%ebp)
c010305a:	6a 01                	push   $0x1
c010305c:	e8 13 5e 00 00       	call   c0108e74 <send_rec>
c0103061:	83 c4 10             	add    $0x10,%esp
c0103064:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0103069:	e9 1c 02 00 00       	jmp    c010328a <do_rdwt+0x389>
c010306e:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c0103072:	75 18                	jne    c010308c <do_rdwt+0x18b>
c0103074:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c010307a:	c1 e0 09             	shl    $0x9,%eax
c010307d:	39 45 ac             	cmp    %eax,-0x54(%ebp)
c0103080:	75 0a                	jne    c010308c <do_rdwt+0x18b>
c0103082:	b8 00 00 00 00       	mov    $0x0,%eax
c0103087:	e9 fe 01 00 00       	jmp    c010328a <do_rdwt+0x389>
c010308c:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c0103090:	75 14                	jne    c01030a6 <do_rdwt+0x1a5>
c0103092:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0103095:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0103098:	01 d0                	add    %edx,%eax
c010309a:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c010309d:	0f 4e 45 b0          	cmovle -0x50(%ebp),%eax
c01030a1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01030a4:	eb 19                	jmp    c01030bf <do_rdwt+0x1be>
c01030a6:	8b 55 ac             	mov    -0x54(%ebp),%edx
c01030a9:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01030ac:	01 c2                	add    %eax,%edx
c01030ae:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c01030b4:	c1 e0 09             	shl    $0x9,%eax
c01030b7:	39 c2                	cmp    %eax,%edx
c01030b9:	0f 4e c2             	cmovle %edx,%eax
c01030bc:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01030bf:	8b 45 ac             	mov    -0x54(%ebp),%eax
c01030c2:	99                   	cltd   
c01030c3:	c1 ea 17             	shr    $0x17,%edx
c01030c6:	01 d0                	add    %edx,%eax
c01030c8:	25 ff 01 00 00       	and    $0x1ff,%eax
c01030cd:	29 d0                	sub    %edx,%eax
c01030cf:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01030d2:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c01030d8:	8b 45 ac             	mov    -0x54(%ebp),%eax
c01030db:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c01030e1:	85 c0                	test   %eax,%eax
c01030e3:	0f 48 c1             	cmovs  %ecx,%eax
c01030e6:	c1 f8 09             	sar    $0x9,%eax
c01030e9:	01 d0                	add    %edx,%eax
c01030eb:	89 45 a8             	mov    %eax,-0x58(%ebp)
c01030ee:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c01030f4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01030f7:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c01030fd:	85 c0                	test   %eax,%eax
c01030ff:	0f 48 c1             	cmovs  %ecx,%eax
c0103102:	c1 f8 09             	sar    $0x9,%eax
c0103105:	01 d0                	add    %edx,%eax
c0103107:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c010310a:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c010310d:	2b 45 a8             	sub    -0x58(%ebp),%eax
c0103110:	ba 00 00 10 00       	mov    $0x100000,%edx
c0103115:	39 d0                	cmp    %edx,%eax
c0103117:	7d 0b                	jge    c0103124 <do_rdwt+0x223>
c0103119:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c010311c:	2b 45 a8             	sub    -0x58(%ebp),%eax
c010311f:	83 c0 01             	add    $0x1,%eax
c0103122:	eb 05                	jmp    c0103129 <do_rdwt+0x228>
c0103124:	b8 00 00 10 00       	mov    $0x100000,%eax
c0103129:	89 45 a0             	mov    %eax,-0x60(%ebp)
c010312c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010312f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0103132:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0103139:	8b 45 08             	mov    0x8(%ebp),%eax
c010313c:	8b 00                	mov    (%eax),%eax
c010313e:	83 ec 0c             	sub    $0xc,%esp
c0103141:	50                   	push   %eax
c0103142:	e8 e5 04 00 00       	call   c010362c <pid2proc>
c0103147:	83 c4 10             	add    $0x10,%esp
c010314a:	89 45 9c             	mov    %eax,-0x64(%ebp)
c010314d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0103150:	83 ec 08             	sub    $0x8,%esp
c0103153:	50                   	push   %eax
c0103154:	ff 75 cc             	pushl  -0x34(%ebp)
c0103157:	e8 08 2b 00 00       	call   c0105c64 <alloc_virtual_memory>
c010315c:	83 c4 10             	add    $0x10,%esp
c010315f:	89 45 98             	mov    %eax,-0x68(%ebp)
c0103162:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0103165:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0103168:	e9 c5 00 00 00       	jmp    c0103232 <do_rdwt+0x331>
c010316d:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0103170:	c1 e0 09             	shl    $0x9,%eax
c0103173:	2b 45 ec             	sub    -0x14(%ebp),%eax
c0103176:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c0103179:	0f 4e 45 e8          	cmovle -0x18(%ebp),%eax
c010317d:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0103180:	c7 45 90 20 00 00 00 	movl   $0x20,-0x70(%ebp)
c0103187:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c010318b:	75 46                	jne    c01031d3 <do_rdwt+0x2d2>
c010318d:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0103190:	c1 e0 09             	shl    $0x9,%eax
c0103193:	8b 15 84 17 11 c0    	mov    0xc0111784,%edx
c0103199:	83 ec 0c             	sub    $0xc,%esp
c010319c:	6a 07                	push   $0x7
c010319e:	50                   	push   %eax
c010319f:	52                   	push   %edx
c01031a0:	ff 75 90             	pushl  -0x70(%ebp)
c01031a3:	ff 75 e0             	pushl  -0x20(%ebp)
c01031a6:	e8 09 e5 ff ff       	call   c01016b4 <rd_wt>
c01031ab:	83 c4 20             	add    $0x20,%esp
c01031ae:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01031b4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01031b7:	01 d0                	add    %edx,%eax
c01031b9:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c01031bc:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01031bf:	01 ca                	add    %ecx,%edx
c01031c1:	83 ec 04             	sub    $0x4,%esp
c01031c4:	ff 75 94             	pushl  -0x6c(%ebp)
c01031c7:	50                   	push   %eax
c01031c8:	52                   	push   %edx
c01031c9:	e8 b0 38 00 00       	call   c0106a7e <Memcpy>
c01031ce:	83 c4 10             	add    $0x10,%esp
c01031d1:	eb 46                	jmp    c0103219 <do_rdwt+0x318>
c01031d3:	8b 55 98             	mov    -0x68(%ebp),%edx
c01031d6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01031d9:	01 d0                	add    %edx,%eax
c01031db:	89 c1                	mov    %eax,%ecx
c01031dd:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c01031e3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01031e6:	01 d0                	add    %edx,%eax
c01031e8:	83 ec 04             	sub    $0x4,%esp
c01031eb:	ff 75 94             	pushl  -0x6c(%ebp)
c01031ee:	51                   	push   %ecx
c01031ef:	50                   	push   %eax
c01031f0:	e8 89 38 00 00       	call   c0106a7e <Memcpy>
c01031f5:	83 c4 10             	add    $0x10,%esp
c01031f8:	8b 45 a0             	mov    -0x60(%ebp),%eax
c01031fb:	c1 e0 09             	shl    $0x9,%eax
c01031fe:	8b 15 84 17 11 c0    	mov    0xc0111784,%edx
c0103204:	83 ec 0c             	sub    $0xc,%esp
c0103207:	6a 0a                	push   $0xa
c0103209:	50                   	push   %eax
c010320a:	52                   	push   %edx
c010320b:	ff 75 90             	pushl  -0x70(%ebp)
c010320e:	ff 75 e0             	pushl  -0x20(%ebp)
c0103211:	e8 9e e4 ff ff       	call   c01016b4 <rd_wt>
c0103216:	83 c4 20             	add    $0x20,%esp
c0103219:	8b 45 94             	mov    -0x6c(%ebp),%eax
c010321c:	29 45 e8             	sub    %eax,-0x18(%ebp)
c010321f:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0103222:	01 45 e4             	add    %eax,-0x1c(%ebp)
c0103225:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c010322c:	8b 45 a0             	mov    -0x60(%ebp),%eax
c010322f:	01 45 e0             	add    %eax,-0x20(%ebp)
c0103232:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0103235:	3b 45 a4             	cmp    -0x5c(%ebp),%eax
c0103238:	7f 0a                	jg     c0103244 <do_rdwt+0x343>
c010323a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c010323e:	0f 85 29 ff ff ff    	jne    c010316d <do_rdwt+0x26c>
c0103244:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0103247:	8b 50 04             	mov    0x4(%eax),%edx
c010324a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010324d:	01 c2                	add    %eax,%edx
c010324f:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0103252:	89 50 04             	mov    %edx,0x4(%eax)
c0103255:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0103258:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010325b:	01 c2                	add    %eax,%edx
c010325d:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c0103263:	39 c2                	cmp    %eax,%edx
c0103265:	7e 20                	jle    c0103287 <do_rdwt+0x386>
c0103267:	8b 55 ac             	mov    -0x54(%ebp),%edx
c010326a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010326d:	01 d0                	add    %edx,%eax
c010326f:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c0103275:	83 ec 0c             	sub    $0xc,%esp
c0103278:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c010327e:	50                   	push   %eax
c010327f:	e8 08 00 00 00       	call   c010328c <sync_inode>
c0103284:	83 c4 10             	add    $0x10,%esp
c0103287:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010328a:	c9                   	leave  
c010328b:	c3                   	ret    

c010328c <sync_inode>:
c010328c:	55                   	push   %ebp
c010328d:	89 e5                	mov    %esp,%ebp
c010328f:	53                   	push   %ebx
c0103290:	83 ec 34             	sub    $0x34,%esp
c0103293:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010329a:	eb 74                	jmp    c0103310 <sync_inode+0x84>
c010329c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010329f:	89 d0                	mov    %edx,%eax
c01032a1:	c1 e0 02             	shl    $0x2,%eax
c01032a4:	01 d0                	add    %edx,%eax
c01032a6:	c1 e0 03             	shl    $0x3,%eax
c01032a9:	05 b0 17 11 c0       	add    $0xc01117b0,%eax
c01032ae:	8b 10                	mov    (%eax),%edx
c01032b0:	8b 45 08             	mov    0x8(%ebp),%eax
c01032b3:	8b 40 10             	mov    0x10(%eax),%eax
c01032b6:	39 c2                	cmp    %eax,%edx
c01032b8:	75 52                	jne    c010330c <sync_inode+0x80>
c01032ba:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01032bd:	89 d0                	mov    %edx,%eax
c01032bf:	c1 e0 02             	shl    $0x2,%eax
c01032c2:	01 d0                	add    %edx,%eax
c01032c4:	c1 e0 03             	shl    $0x3,%eax
c01032c7:	8d 90 a0 17 11 c0    	lea    -0x3feee860(%eax),%edx
c01032cd:	8b 45 08             	mov    0x8(%ebp),%eax
c01032d0:	8b 08                	mov    (%eax),%ecx
c01032d2:	89 0a                	mov    %ecx,(%edx)
c01032d4:	8b 48 04             	mov    0x4(%eax),%ecx
c01032d7:	89 4a 04             	mov    %ecx,0x4(%edx)
c01032da:	8b 48 08             	mov    0x8(%eax),%ecx
c01032dd:	89 4a 08             	mov    %ecx,0x8(%edx)
c01032e0:	8b 48 0c             	mov    0xc(%eax),%ecx
c01032e3:	89 4a 0c             	mov    %ecx,0xc(%edx)
c01032e6:	8b 48 10             	mov    0x10(%eax),%ecx
c01032e9:	89 4a 10             	mov    %ecx,0x10(%edx)
c01032ec:	8b 48 14             	mov    0x14(%eax),%ecx
c01032ef:	89 4a 14             	mov    %ecx,0x14(%edx)
c01032f2:	8b 48 18             	mov    0x18(%eax),%ecx
c01032f5:	89 4a 18             	mov    %ecx,0x18(%edx)
c01032f8:	8b 48 1c             	mov    0x1c(%eax),%ecx
c01032fb:	89 4a 1c             	mov    %ecx,0x1c(%edx)
c01032fe:	8b 48 20             	mov    0x20(%eax),%ecx
c0103301:	89 4a 20             	mov    %ecx,0x20(%edx)
c0103304:	8b 40 24             	mov    0x24(%eax),%eax
c0103307:	89 42 24             	mov    %eax,0x24(%edx)
c010330a:	eb 0a                	jmp    c0103316 <sync_inode+0x8a>
c010330c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0103310:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c0103314:	7e 86                	jle    c010329c <sync_inode+0x10>
c0103316:	c7 45 f0 20 00 00 00 	movl   $0x20,-0x10(%ebp)
c010331d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103320:	8b 40 10             	mov    0x10(%eax),%eax
c0103323:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0103326:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103329:	8d 48 ff             	lea    -0x1(%eax),%ecx
c010332c:	b8 00 02 00 00       	mov    $0x200,%eax
c0103331:	99                   	cltd   
c0103332:	f7 7d f0             	idivl  -0x10(%ebp)
c0103335:	89 c3                	mov    %eax,%ebx
c0103337:	89 c8                	mov    %ecx,%eax
c0103339:	99                   	cltd   
c010333a:	f7 fb                	idiv   %ebx
c010333c:	89 55 e8             	mov    %edx,-0x18(%ebp)
c010333f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103342:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0103345:	b8 00 02 00 00       	mov    $0x200,%eax
c010334a:	99                   	cltd   
c010334b:	f7 7d f0             	idivl  -0x10(%ebp)
c010334e:	89 c3                	mov    %eax,%ebx
c0103350:	89 c8                	mov    %ecx,%eax
c0103352:	99                   	cltd   
c0103353:	f7 fb                	idiv   %ebx
c0103355:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0103358:	8b 45 08             	mov    0x8(%ebp),%eax
c010335b:	8b 40 20             	mov    0x20(%eax),%eax
c010335e:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0103361:	e8 0a 01 00 00       	call   c0103470 <get_super_block>
c0103366:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0103369:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010336c:	8b 40 04             	mov    0x4(%eax),%eax
c010336f:	8d 50 02             	lea    0x2(%eax),%edx
c0103372:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0103375:	8b 40 08             	mov    0x8(%eax),%eax
c0103378:	01 c2                	add    %eax,%edx
c010337a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010337d:	01 d0                	add    %edx,%eax
c010337f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0103382:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c0103387:	83 ec 0c             	sub    $0xc,%esp
c010338a:	6a 07                	push   $0x7
c010338c:	68 00 02 00 00       	push   $0x200
c0103391:	50                   	push   %eax
c0103392:	ff 75 e0             	pushl  -0x20(%ebp)
c0103395:	ff 75 d8             	pushl  -0x28(%ebp)
c0103398:	e8 17 e3 ff ff       	call   c01016b4 <rd_wt>
c010339d:	83 c4 20             	add    $0x20,%esp
c01033a0:	a1 a4 21 11 c0       	mov    0xc01121a4,%eax
c01033a5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01033a8:	83 ec 04             	sub    $0x4,%esp
c01033ab:	ff 75 f0             	pushl  -0x10(%ebp)
c01033ae:	ff 75 08             	pushl  0x8(%ebp)
c01033b1:	ff 75 d4             	pushl  -0x2c(%ebp)
c01033b4:	e8 c5 36 00 00       	call   c0106a7e <Memcpy>
c01033b9:	83 c4 10             	add    $0x10,%esp
c01033bc:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c01033c1:	83 ec 0c             	sub    $0xc,%esp
c01033c4:	6a 0a                	push   $0xa
c01033c6:	68 00 02 00 00       	push   $0x200
c01033cb:	50                   	push   %eax
c01033cc:	ff 75 e0             	pushl  -0x20(%ebp)
c01033cf:	ff 75 d8             	pushl  -0x28(%ebp)
c01033d2:	e8 dd e2 ff ff       	call   c01016b4 <rd_wt>
c01033d7:	83 c4 20             	add    $0x20,%esp
c01033da:	90                   	nop
c01033db:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01033de:	c9                   	leave  
c01033df:	c3                   	ret    

c01033e0 <put_inode>:
c01033e0:	55                   	push   %ebp
c01033e1:	89 e5                	mov    %esp,%ebp
c01033e3:	83 ec 08             	sub    $0x8,%esp
c01033e6:	8b 45 08             	mov    0x8(%ebp),%eax
c01033e9:	8b 40 24             	mov    0x24(%eax),%eax
c01033ec:	85 c0                	test   %eax,%eax
c01033ee:	7f 1c                	jg     c010340c <put_inode+0x2c>
c01033f0:	68 4c 05 00 00       	push   $0x54c
c01033f5:	68 b4 a0 10 c0       	push   $0xc010a0b4
c01033fa:	68 b4 a0 10 c0       	push   $0xc010a0b4
c01033ff:	68 8c a2 10 c0       	push   $0xc010a28c
c0103404:	e8 4e 50 00 00       	call   c0108457 <assertion_failure>
c0103409:	83 c4 10             	add    $0x10,%esp
c010340c:	8b 45 08             	mov    0x8(%ebp),%eax
c010340f:	8b 40 24             	mov    0x24(%eax),%eax
c0103412:	8d 50 ff             	lea    -0x1(%eax),%edx
c0103415:	8b 45 08             	mov    0x8(%ebp),%eax
c0103418:	89 50 24             	mov    %edx,0x24(%eax)
c010341b:	90                   	nop
c010341c:	c9                   	leave  
c010341d:	c3                   	ret    

c010341e <do_close>:
c010341e:	55                   	push   %ebp
c010341f:	89 e5                	mov    %esp,%ebp
c0103421:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c0103426:	8b 55 08             	mov    0x8(%ebp),%edx
c0103429:	83 c2 50             	add    $0x50,%edx
c010342c:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
c0103430:	8b 50 0c             	mov    0xc(%eax),%edx
c0103433:	83 ea 01             	sub    $0x1,%edx
c0103436:	89 50 0c             	mov    %edx,0xc(%eax)
c0103439:	8b 40 0c             	mov    0xc(%eax),%eax
c010343c:	85 c0                	test   %eax,%eax
c010343e:	75 16                	jne    c0103456 <do_close+0x38>
c0103440:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c0103445:	8b 55 08             	mov    0x8(%ebp),%edx
c0103448:	83 c2 50             	add    $0x50,%edx
c010344b:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
c010344f:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0103456:	a1 c8 fb 10 c0       	mov    0xc010fbc8,%eax
c010345b:	8b 55 08             	mov    0x8(%ebp),%edx
c010345e:	83 c2 50             	add    $0x50,%edx
c0103461:	c7 44 90 08 00 00 00 	movl   $0x0,0x8(%eax,%edx,4)
c0103468:	00 
c0103469:	b8 00 00 00 00       	mov    $0x0,%eax
c010346e:	5d                   	pop    %ebp
c010346f:	c3                   	ret    

c0103470 <get_super_block>:
c0103470:	55                   	push   %ebp
c0103471:	89 e5                	mov    %esp,%ebp
c0103473:	83 ec 08             	sub    $0x8,%esp
c0103476:	a1 84 17 11 c0       	mov    0xc0111784,%eax
c010347b:	83 ec 0c             	sub    $0xc,%esp
c010347e:	6a 07                	push   $0x7
c0103480:	68 00 02 00 00       	push   $0x200
c0103485:	50                   	push   %eax
c0103486:	6a 20                	push   $0x20
c0103488:	6a 01                	push   $0x1
c010348a:	e8 25 e2 ff ff       	call   c01016b4 <rd_wt>
c010348f:	83 c4 20             	add    $0x20,%esp
c0103492:	8b 15 a4 21 11 c0    	mov    0xc01121a4,%edx
c0103498:	a1 a0 21 11 c0       	mov    0xc01121a0,%eax
c010349d:	8b 0a                	mov    (%edx),%ecx
c010349f:	89 08                	mov    %ecx,(%eax)
c01034a1:	8b 4a 04             	mov    0x4(%edx),%ecx
c01034a4:	89 48 04             	mov    %ecx,0x4(%eax)
c01034a7:	8b 4a 08             	mov    0x8(%edx),%ecx
c01034aa:	89 48 08             	mov    %ecx,0x8(%eax)
c01034ad:	8b 4a 0c             	mov    0xc(%edx),%ecx
c01034b0:	89 48 0c             	mov    %ecx,0xc(%eax)
c01034b3:	8b 4a 10             	mov    0x10(%edx),%ecx
c01034b6:	89 48 10             	mov    %ecx,0x10(%eax)
c01034b9:	8b 4a 14             	mov    0x14(%edx),%ecx
c01034bc:	89 48 14             	mov    %ecx,0x14(%eax)
c01034bf:	8b 4a 18             	mov    0x18(%edx),%ecx
c01034c2:	89 48 18             	mov    %ecx,0x18(%eax)
c01034c5:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c01034c8:	89 48 1c             	mov    %ecx,0x1c(%eax)
c01034cb:	8b 52 20             	mov    0x20(%edx),%edx
c01034ce:	89 50 20             	mov    %edx,0x20(%eax)
c01034d1:	a1 a0 21 11 c0       	mov    0xc01121a0,%eax
c01034d6:	c9                   	leave  
c01034d7:	c3                   	ret    

c01034d8 <schedule_process>:
c01034d8:	55                   	push   %ebp
c01034d9:	89 e5                	mov    %esp,%ebp
c01034db:	83 ec 18             	sub    $0x18,%esp
c01034de:	c7 45 f4 00 00 40 00 	movl   $0x400000,-0xc(%ebp)
c01034e5:	e8 ad ce ff ff       	call   c0100397 <get_running_thread_pcb>
c01034ea:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01034ed:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01034f0:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c01034f7:	84 c0                	test   %al,%al
c01034f9:	75 30                	jne    c010352b <schedule_process+0x53>
c01034fb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01034fe:	c7 80 28 01 00 00 0f 	movl   $0xf,0x128(%eax)
c0103505:	00 00 00 
c0103508:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010350b:	c6 80 48 02 00 00 03 	movb   $0x3,0x248(%eax)
c0103512:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103515:	05 00 01 00 00       	add    $0x100,%eax
c010351a:	83 ec 08             	sub    $0x8,%esp
c010351d:	50                   	push   %eax
c010351e:	68 ec fd 10 c0       	push   $0xc010fdec
c0103523:	e8 8f 66 00 00       	call   c0109bb7 <insertToDoubleLinkList>
c0103528:	83 c4 10             	add    $0x10,%esp
c010352b:	83 ec 0c             	sub    $0xc,%esp
c010352e:	68 ec fd 10 c0       	push   $0xc010fdec
c0103533:	e8 9b 64 00 00       	call   c01099d3 <isListEmpty>
c0103538:	83 c4 10             	add    $0x10,%esp
c010353b:	84 c0                	test   %al,%al
c010353d:	74 19                	je     c0103558 <schedule_process+0x80>
c010353f:	6a 1e                	push   $0x1e
c0103541:	68 9b a2 10 c0       	push   $0xc010a29b
c0103546:	68 9b a2 10 c0       	push   $0xc010a29b
c010354b:	68 a5 a2 10 c0       	push   $0xc010a2a5
c0103550:	e8 02 4f 00 00       	call   c0108457 <assertion_failure>
c0103555:	83 c4 10             	add    $0x10,%esp
c0103558:	83 ec 0c             	sub    $0xc,%esp
c010355b:	68 ec fd 10 c0       	push   $0xc010fdec
c0103560:	e8 d5 66 00 00       	call   c0109c3a <popFromDoubleLinkList>
c0103565:	83 c4 10             	add    $0x10,%esp
c0103568:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010356b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010356e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0103573:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0103576:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103579:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0103580:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103583:	8b 40 08             	mov    0x8(%eax),%eax
c0103586:	85 c0                	test   %eax,%eax
c0103588:	74 28                	je     c01035b2 <schedule_process+0xda>
c010358a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010358d:	05 00 10 00 00       	add    $0x1000,%eax
c0103592:	83 ec 0c             	sub    $0xc,%esp
c0103595:	50                   	push   %eax
c0103596:	e8 ed cd ff ff       	call   c0100388 <update_tss>
c010359b:	83 c4 10             	add    $0x10,%esp
c010359e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01035a1:	8b 40 08             	mov    0x8(%eax),%eax
c01035a4:	83 ec 0c             	sub    $0xc,%esp
c01035a7:	50                   	push   %eax
c01035a8:	e8 ce cd ff ff       	call   c010037b <update_cr3>
c01035ad:	83 c4 10             	add    $0x10,%esp
c01035b0:	eb 0f                	jmp    c01035c1 <schedule_process+0xe9>
c01035b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01035b5:	83 ec 0c             	sub    $0xc,%esp
c01035b8:	50                   	push   %eax
c01035b9:	e8 bd cd ff ff       	call   c010037b <update_cr3>
c01035be:	83 c4 10             	add    $0x10,%esp
c01035c1:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01035c4:	a3 c0 fb 10 c0       	mov    %eax,0xc010fbc0
c01035c9:	83 ec 08             	sub    $0x8,%esp
c01035cc:	ff 75 e8             	pushl  -0x18(%ebp)
c01035cf:	ff 75 f0             	pushl  -0x10(%ebp)
c01035d2:	e8 b9 63 00 00       	call   c0109990 <switch_to>
c01035d7:	83 c4 10             	add    $0x10,%esp
c01035da:	90                   	nop
c01035db:	c9                   	leave  
c01035dc:	c3                   	ret    

c01035dd <clock_handler>:
c01035dd:	55                   	push   %ebp
c01035de:	89 e5                	mov    %esp,%ebp
c01035e0:	83 ec 18             	sub    $0x18,%esp
c01035e3:	e8 af cd ff ff       	call   c0100397 <get_running_thread_pcb>
c01035e8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01035eb:	a1 c0 06 11 c0       	mov    0xc01106c0,%eax
c01035f0:	85 c0                	test   %eax,%eax
c01035f2:	74 0d                	je     c0103601 <clock_handler+0x24>
c01035f4:	83 ec 0c             	sub    $0xc,%esp
c01035f7:	6a 04                	push   $0x4
c01035f9:	e8 10 5b 00 00       	call   c010910e <inform_int>
c01035fe:	83 c4 10             	add    $0x10,%esp
c0103601:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103604:	8b 80 28 01 00 00    	mov    0x128(%eax),%eax
c010360a:	85 c0                	test   %eax,%eax
c010360c:	74 16                	je     c0103624 <clock_handler+0x47>
c010360e:	a1 c0 fb 10 c0       	mov    0xc010fbc0,%eax
c0103613:	8b 90 28 01 00 00    	mov    0x128(%eax),%edx
c0103619:	83 ea 01             	sub    $0x1,%edx
c010361c:	89 90 28 01 00 00    	mov    %edx,0x128(%eax)
c0103622:	eb 05                	jmp    c0103629 <clock_handler+0x4c>
c0103624:	e8 af fe ff ff       	call   c01034d8 <schedule_process>
c0103629:	90                   	nop
c010362a:	c9                   	leave  
c010362b:	c3                   	ret    

c010362c <pid2proc>:
c010362c:	55                   	push   %ebp
c010362d:	89 e5                	mov    %esp,%ebp
c010362f:	83 ec 20             	sub    $0x20,%esp
c0103632:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0103639:	a1 04 0f 11 c0       	mov    0xc0110f04,%eax
c010363e:	8b 15 08 0f 11 c0    	mov    0xc0110f08,%edx
c0103644:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103647:	89 55 f4             	mov    %edx,-0xc(%ebp)
c010364a:	a1 0c 0f 11 c0       	mov    0xc0110f0c,%eax
c010364f:	8b 15 10 0f 11 c0    	mov    0xc0110f10,%edx
c0103655:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0103658:	89 55 ec             	mov    %edx,-0x14(%ebp)
c010365b:	a1 08 0f 11 c0       	mov    0xc0110f08,%eax
c0103660:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103663:	eb 29                	jmp    c010368e <pid2proc+0x62>
c0103665:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103668:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010366d:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0103670:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0103673:	8b 90 24 01 00 00    	mov    0x124(%eax),%edx
c0103679:	8b 45 08             	mov    0x8(%ebp),%eax
c010367c:	39 c2                	cmp    %eax,%edx
c010367e:	75 05                	jne    c0103685 <pid2proc+0x59>
c0103680:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0103683:	eb 17                	jmp    c010369c <pid2proc+0x70>
c0103685:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103688:	8b 40 04             	mov    0x4(%eax),%eax
c010368b:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010368e:	81 7d fc 0c 0f 11 c0 	cmpl   $0xc0110f0c,-0x4(%ebp)
c0103695:	75 ce                	jne    c0103665 <pid2proc+0x39>
c0103697:	b8 00 00 00 00       	mov    $0x0,%eax
c010369c:	c9                   	leave  
c010369d:	c3                   	ret    

c010369e <proc2pid>:
c010369e:	55                   	push   %ebp
c010369f:	89 e5                	mov    %esp,%ebp
c01036a1:	83 ec 10             	sub    $0x10,%esp
c01036a4:	8b 45 08             	mov    0x8(%ebp),%eax
c01036a7:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c01036ad:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01036b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01036b3:	c9                   	leave  
c01036b4:	c3                   	ret    

c01036b5 <InitDescriptor>:
c01036b5:	55                   	push   %ebp
c01036b6:	89 e5                	mov    %esp,%ebp
c01036b8:	83 ec 04             	sub    $0x4,%esp
c01036bb:	8b 45 14             	mov    0x14(%ebp),%eax
c01036be:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
c01036c2:	8b 45 10             	mov    0x10(%ebp),%eax
c01036c5:	89 c2                	mov    %eax,%edx
c01036c7:	8b 45 08             	mov    0x8(%ebp),%eax
c01036ca:	66 89 10             	mov    %dx,(%eax)
c01036cd:	8b 45 0c             	mov    0xc(%ebp),%eax
c01036d0:	89 c2                	mov    %eax,%edx
c01036d2:	8b 45 08             	mov    0x8(%ebp),%eax
c01036d5:	66 89 50 02          	mov    %dx,0x2(%eax)
c01036d9:	8b 45 0c             	mov    0xc(%ebp),%eax
c01036dc:	c1 e8 10             	shr    $0x10,%eax
c01036df:	89 c2                	mov    %eax,%edx
c01036e1:	8b 45 08             	mov    0x8(%ebp),%eax
c01036e4:	88 50 04             	mov    %dl,0x4(%eax)
c01036e7:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c01036eb:	89 c2                	mov    %eax,%edx
c01036ed:	8b 45 08             	mov    0x8(%ebp),%eax
c01036f0:	88 50 05             	mov    %dl,0x5(%eax)
c01036f3:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c01036f7:	66 c1 e8 08          	shr    $0x8,%ax
c01036fb:	c1 e0 04             	shl    $0x4,%eax
c01036fe:	89 c2                	mov    %eax,%edx
c0103700:	8b 45 10             	mov    0x10(%ebp),%eax
c0103703:	c1 e8 10             	shr    $0x10,%eax
c0103706:	83 e0 0f             	and    $0xf,%eax
c0103709:	09 c2                	or     %eax,%edx
c010370b:	8b 45 08             	mov    0x8(%ebp),%eax
c010370e:	88 50 06             	mov    %dl,0x6(%eax)
c0103711:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103714:	c1 e8 18             	shr    $0x18,%eax
c0103717:	89 c2                	mov    %eax,%edx
c0103719:	8b 45 08             	mov    0x8(%ebp),%eax
c010371c:	88 50 07             	mov    %dl,0x7(%eax)
c010371f:	90                   	nop
c0103720:	c9                   	leave  
c0103721:	c3                   	ret    

c0103722 <Seg2PhyAddr>:
c0103722:	55                   	push   %ebp
c0103723:	89 e5                	mov    %esp,%ebp
c0103725:	83 ec 10             	sub    $0x10,%esp
c0103728:	8b 45 08             	mov    0x8(%ebp),%eax
c010372b:	c1 e8 03             	shr    $0x3,%eax
c010372e:	8b 14 c5 c4 f7 10 c0 	mov    -0x3fef083c(,%eax,8),%edx
c0103735:	8b 04 c5 c0 f7 10 c0 	mov    -0x3fef0840(,%eax,8),%eax
c010373c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010373f:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0103742:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0103746:	0f b7 c0             	movzwl %ax,%eax
c0103749:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c010374d:	0f b6 d2             	movzbl %dl,%edx
c0103750:	c1 e2 10             	shl    $0x10,%edx
c0103753:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c0103759:	09 d0                	or     %edx,%eax
c010375b:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010375e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103761:	c9                   	leave  
c0103762:	c3                   	ret    

c0103763 <Seg2PhyAddrLDT>:
c0103763:	55                   	push   %ebp
c0103764:	89 e5                	mov    %esp,%ebp
c0103766:	83 ec 10             	sub    $0x10,%esp
c0103769:	8b 45 08             	mov    0x8(%ebp),%eax
c010376c:	c1 e8 03             	shr    $0x3,%eax
c010376f:	89 c2                	mov    %eax,%edx
c0103771:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103774:	83 c2 22             	add    $0x22,%edx
c0103777:	8d 54 d0 02          	lea    0x2(%eax,%edx,8),%edx
c010377b:	8b 02                	mov    (%edx),%eax
c010377d:	8b 52 04             	mov    0x4(%edx),%edx
c0103780:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103783:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0103786:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c010378a:	0f b7 c0             	movzwl %ax,%eax
c010378d:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c0103791:	0f b6 d2             	movzbl %dl,%edx
c0103794:	c1 e2 10             	shl    $0x10,%edx
c0103797:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c010379d:	09 d0                	or     %edx,%eax
c010379f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01037a2:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01037a5:	c9                   	leave  
c01037a6:	c3                   	ret    

c01037a7 <VirAddr2PhyAddr>:
c01037a7:	55                   	push   %ebp
c01037a8:	89 e5                	mov    %esp,%ebp
c01037aa:	83 ec 10             	sub    $0x10,%esp
c01037ad:	8b 55 0c             	mov    0xc(%ebp),%edx
c01037b0:	8b 45 08             	mov    0x8(%ebp),%eax
c01037b3:	01 d0                	add    %edx,%eax
c01037b5:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01037b8:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01037bb:	c9                   	leave  
c01037bc:	c3                   	ret    

c01037bd <v2l>:
c01037bd:	55                   	push   %ebp
c01037be:	89 e5                	mov    %esp,%ebp
c01037c0:	83 ec 18             	sub    $0x18,%esp
c01037c3:	83 ec 0c             	sub    $0xc,%esp
c01037c6:	ff 75 08             	pushl  0x8(%ebp)
c01037c9:	e8 5e fe ff ff       	call   c010362c <pid2proc>
c01037ce:	83 c4 10             	add    $0x10,%esp
c01037d1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01037d4:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c01037db:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01037de:	83 ec 08             	sub    $0x8,%esp
c01037e1:	ff 75 f4             	pushl  -0xc(%ebp)
c01037e4:	50                   	push   %eax
c01037e5:	e8 79 ff ff ff       	call   c0103763 <Seg2PhyAddrLDT>
c01037ea:	83 c4 10             	add    $0x10,%esp
c01037ed:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01037f0:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01037f3:	8b 45 0c             	mov    0xc(%ebp),%eax
c01037f6:	01 d0                	add    %edx,%eax
c01037f8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01037fb:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01037fe:	c9                   	leave  
c01037ff:	c3                   	ret    

c0103800 <init_propt>:
c0103800:	55                   	push   %ebp
c0103801:	89 e5                	mov    %esp,%ebp
c0103803:	83 ec 38             	sub    $0x38,%esp
c0103806:	6a 0e                	push   $0xe
c0103808:	6a 08                	push   $0x8
c010380a:	68 71 01 10 c0       	push   $0xc0100171
c010380f:	6a 20                	push   $0x20
c0103811:	e8 58 01 00 00       	call   c010396e <InitInterruptDesc>
c0103816:	83 c4 10             	add    $0x10,%esp
c0103819:	6a 0e                	push   $0xe
c010381b:	6a 08                	push   $0x8
c010381d:	68 9e 01 10 c0       	push   $0xc010019e
c0103822:	6a 21                	push   $0x21
c0103824:	e8 45 01 00 00       	call   c010396e <InitInterruptDesc>
c0103829:	83 c4 10             	add    $0x10,%esp
c010382c:	6a 0e                	push   $0xe
c010382e:	6a 08                	push   $0x8
c0103830:	68 e0 01 10 c0       	push   $0xc01001e0
c0103835:	6a 2e                	push   $0x2e
c0103837:	e8 32 01 00 00       	call   c010396e <InitInterruptDesc>
c010383c:	83 c4 10             	add    $0x10,%esp
c010383f:	83 ec 04             	sub    $0x4,%esp
c0103842:	68 a0 15 00 00       	push   $0x15a0
c0103847:	6a 00                	push   $0x0
c0103849:	68 00 22 18 c0       	push   $0xc0182200
c010384e:	e8 cc 73 00 00       	call   c010ac1f <Memset>
c0103853:	83 c4 10             	add    $0x10,%esp
c0103856:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c010385d:	83 ec 04             	sub    $0x4,%esp
c0103860:	ff 75 f4             	pushl  -0xc(%ebp)
c0103863:	6a 00                	push   $0x0
c0103865:	68 40 06 11 c0       	push   $0xc0110640
c010386a:	e8 b0 73 00 00       	call   c010ac1f <Memset>
c010386f:	83 c4 10             	add    $0x10,%esp
c0103872:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0103875:	a3 a8 06 11 c0       	mov    %eax,0xc01106a8
c010387a:	c7 05 48 06 11 c0 30 	movl   $0x30,0xc0110648
c0103881:	00 00 00 
c0103884:	83 ec 0c             	sub    $0xc,%esp
c0103887:	6a 30                	push   $0x30
c0103889:	e8 94 fe ff ff       	call   c0103722 <Seg2PhyAddr>
c010388e:	83 c4 10             	add    $0x10,%esp
c0103891:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103894:	c7 45 ec 40 06 11 c0 	movl   $0xc0110640,-0x14(%ebp)
c010389b:	c7 45 e8 89 00 00 00 	movl   $0x89,-0x18(%ebp)
c01038a2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01038a5:	0f b7 d0             	movzwl %ax,%edx
c01038a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01038ab:	83 e8 01             	sub    $0x1,%eax
c01038ae:	89 c1                	mov    %eax,%ecx
c01038b0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01038b3:	52                   	push   %edx
c01038b4:	51                   	push   %ecx
c01038b5:	50                   	push   %eax
c01038b6:	68 00 f8 10 c0       	push   $0xc010f800
c01038bb:	e8 f5 fd ff ff       	call   c01036b5 <InitDescriptor>
c01038c0:	83 c4 10             	add    $0x10,%esp
c01038c3:	c7 45 e4 00 80 0b c0 	movl   $0xc00b8000,-0x1c(%ebp)
c01038ca:	68 f2 00 00 00       	push   $0xf2
c01038cf:	68 ff ff 00 00       	push   $0xffff
c01038d4:	ff 75 e4             	pushl  -0x1c(%ebp)
c01038d7:	68 f8 f7 10 c0       	push   $0xc010f7f8
c01038dc:	e8 d4 fd ff ff       	call   c01036b5 <InitDescriptor>
c01038e1:	83 c4 10             	add    $0x10,%esp
c01038e4:	c7 45 e0 b2 0c 00 00 	movl   $0xcb2,-0x20(%ebp)
c01038eb:	c7 45 dc 9a 0c 00 00 	movl   $0xc9a,-0x24(%ebp)
c01038f2:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%ebp)
c01038f9:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01038fc:	0f b7 c0             	movzwl %ax,%eax
c01038ff:	50                   	push   %eax
c0103900:	ff 75 d8             	pushl  -0x28(%ebp)
c0103903:	6a 00                	push   $0x0
c0103905:	68 08 f8 10 c0       	push   $0xc010f808
c010390a:	e8 a6 fd ff ff       	call   c01036b5 <InitDescriptor>
c010390f:	83 c4 10             	add    $0x10,%esp
c0103912:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0103915:	0f b7 c0             	movzwl %ax,%eax
c0103918:	50                   	push   %eax
c0103919:	ff 75 d8             	pushl  -0x28(%ebp)
c010391c:	6a 00                	push   $0x0
c010391e:	68 10 f8 10 c0       	push   $0xc010f810
c0103923:	e8 8d fd ff ff       	call   c01036b5 <InitDescriptor>
c0103928:	83 c4 10             	add    $0x10,%esp
c010392b:	c7 45 d4 b2 0c 00 00 	movl   $0xcb2,-0x2c(%ebp)
c0103932:	c7 45 d0 ba 0c 00 00 	movl   $0xcba,-0x30(%ebp)
c0103939:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010393c:	0f b7 c0             	movzwl %ax,%eax
c010393f:	50                   	push   %eax
c0103940:	ff 75 d8             	pushl  -0x28(%ebp)
c0103943:	6a 00                	push   $0x0
c0103945:	68 18 f8 10 c0       	push   $0xc010f818
c010394a:	e8 66 fd ff ff       	call   c01036b5 <InitDescriptor>
c010394f:	83 c4 10             	add    $0x10,%esp
c0103952:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0103955:	0f b7 c0             	movzwl %ax,%eax
c0103958:	50                   	push   %eax
c0103959:	ff 75 d8             	pushl  -0x28(%ebp)
c010395c:	6a 00                	push   $0x0
c010395e:	68 20 f8 10 c0       	push   $0xc010f820
c0103963:	e8 4d fd ff ff       	call   c01036b5 <InitDescriptor>
c0103968:	83 c4 10             	add    $0x10,%esp
c010396b:	90                   	nop
c010396c:	c9                   	leave  
c010396d:	c3                   	ret    

c010396e <InitInterruptDesc>:
c010396e:	55                   	push   %ebp
c010396f:	89 e5                	mov    %esp,%ebp
c0103971:	83 ec 10             	sub    $0x10,%esp
c0103974:	8b 45 08             	mov    0x8(%ebp),%eax
c0103977:	c1 e0 03             	shl    $0x3,%eax
c010397a:	05 e0 06 11 c0       	add    $0xc01106e0,%eax
c010397f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0103982:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103985:	c6 40 04 00          	movb   $0x0,0x4(%eax)
c0103989:	8b 45 0c             	mov    0xc(%ebp),%eax
c010398c:	89 45 f8             	mov    %eax,-0x8(%ebp)
c010398f:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0103992:	89 c2                	mov    %eax,%edx
c0103994:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0103997:	66 89 10             	mov    %dx,(%eax)
c010399a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010399d:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
c01039a3:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01039a6:	c1 f8 10             	sar    $0x10,%eax
c01039a9:	89 c2                	mov    %eax,%edx
c01039ab:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01039ae:	66 89 50 06          	mov    %dx,0x6(%eax)
c01039b2:	8b 45 10             	mov    0x10(%ebp),%eax
c01039b5:	c1 e0 04             	shl    $0x4,%eax
c01039b8:	89 c2                	mov    %eax,%edx
c01039ba:	8b 45 14             	mov    0x14(%ebp),%eax
c01039bd:	09 d0                	or     %edx,%eax
c01039bf:	89 c2                	mov    %eax,%edx
c01039c1:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01039c4:	88 50 05             	mov    %dl,0x5(%eax)
c01039c7:	90                   	nop
c01039c8:	c9                   	leave  
c01039c9:	c3                   	ret    

c01039ca <ReloadGDT>:
c01039ca:	55                   	push   %ebp
c01039cb:	89 e5                	mov    %esp,%ebp
c01039cd:	83 ec 28             	sub    $0x28,%esp
c01039d0:	b8 c8 06 11 c0       	mov    $0xc01106c8,%eax
c01039d5:	0f b7 00             	movzwl (%eax),%eax
c01039d8:	98                   	cwtl   
c01039d9:	ba ca 06 11 c0       	mov    $0xc01106ca,%edx
c01039de:	8b 12                	mov    (%edx),%edx
c01039e0:	83 ec 04             	sub    $0x4,%esp
c01039e3:	50                   	push   %eax
c01039e4:	52                   	push   %edx
c01039e5:	68 c0 f7 10 c0       	push   $0xc010f7c0
c01039ea:	e8 02 72 00 00       	call   c010abf1 <Memcpy2>
c01039ef:	83 c4 10             	add    $0x10,%esp
c01039f2:	c7 45 f0 c8 06 11 c0 	movl   $0xc01106c8,-0x10(%ebp)
c01039f9:	c7 45 ec ca 06 11 c0 	movl   $0xc01106ca,-0x14(%ebp)
c0103a00:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103a03:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
c0103a08:	ba c0 f7 10 c0       	mov    $0xc010f7c0,%edx
c0103a0d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0103a10:	89 10                	mov    %edx,(%eax)
c0103a12:	c7 45 e8 88 f7 10 c0 	movl   $0xc010f788,-0x18(%ebp)
c0103a19:	c7 45 e4 8a f7 10 c0 	movl   $0xc010f78a,-0x1c(%ebp)
c0103a20:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0103a23:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
c0103a28:	ba e0 06 11 c0       	mov    $0xc01106e0,%edx
c0103a2d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0103a30:	89 10                	mov    %edx,(%eax)
c0103a32:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0103a39:	eb 04                	jmp    c0103a3f <ReloadGDT+0x75>
c0103a3b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0103a3f:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c0103a46:	7e f3                	jle    c0103a3b <ReloadGDT+0x71>
c0103a48:	e8 67 37 00 00       	call   c01071b4 <init_internal_interrupt>
c0103a4d:	e8 ae fd ff ff       	call   c0103800 <init_propt>
c0103a52:	90                   	nop
c0103a53:	c9                   	leave  
c0103a54:	c3                   	ret    

c0103a55 <select_console>:
c0103a55:	55                   	push   %ebp
c0103a56:	89 e5                	mov    %esp,%ebp
c0103a58:	83 ec 18             	sub    $0x18,%esp
c0103a5b:	8b 45 08             	mov    0x8(%ebp),%eax
c0103a5e:	88 45 f4             	mov    %al,-0xc(%ebp)
c0103a61:	80 7d f4 00          	cmpb   $0x0,-0xc(%ebp)
c0103a65:	75 27                	jne    c0103a8e <select_console+0x39>
c0103a67:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
c0103a6b:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0103a71:	05 00 fe 10 c0       	add    $0xc010fe00,%eax
c0103a76:	a3 80 f7 10 c0       	mov    %eax,0xc010f780
c0103a7b:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c0103a80:	83 ec 0c             	sub    $0xc,%esp
c0103a83:	50                   	push   %eax
c0103a84:	e8 08 00 00 00       	call   c0103a91 <flush>
c0103a89:	83 c4 10             	add    $0x10,%esp
c0103a8c:	eb 01                	jmp    c0103a8f <select_console+0x3a>
c0103a8e:	90                   	nop
c0103a8f:	c9                   	leave  
c0103a90:	c3                   	ret    

c0103a91 <flush>:
c0103a91:	55                   	push   %ebp
c0103a92:	89 e5                	mov    %esp,%ebp
c0103a94:	83 ec 08             	sub    $0x8,%esp
c0103a97:	8b 45 08             	mov    0x8(%ebp),%eax
c0103a9a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103aa0:	8b 40 0c             	mov    0xc(%eax),%eax
c0103aa3:	83 ec 0c             	sub    $0xc,%esp
c0103aa6:	50                   	push   %eax
c0103aa7:	e8 1e 00 00 00       	call   c0103aca <set_cursor>
c0103aac:	83 c4 10             	add    $0x10,%esp
c0103aaf:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ab2:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103ab8:	8b 40 08             	mov    0x8(%eax),%eax
c0103abb:	83 ec 0c             	sub    $0xc,%esp
c0103abe:	50                   	push   %eax
c0103abf:	e8 64 00 00 00       	call   c0103b28 <set_console_start_video_addr>
c0103ac4:	83 c4 10             	add    $0x10,%esp
c0103ac7:	90                   	nop
c0103ac8:	c9                   	leave  
c0103ac9:	c3                   	ret    

c0103aca <set_cursor>:
c0103aca:	55                   	push   %ebp
c0103acb:	89 e5                	mov    %esp,%ebp
c0103acd:	83 ec 08             	sub    $0x8,%esp
c0103ad0:	83 ec 08             	sub    $0x8,%esp
c0103ad3:	6a 0e                	push   $0xe
c0103ad5:	68 d4 03 00 00       	push   $0x3d4
c0103ada:	e8 ba c7 ff ff       	call   c0100299 <out_byte>
c0103adf:	83 c4 10             	add    $0x10,%esp
c0103ae2:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ae5:	c1 e8 08             	shr    $0x8,%eax
c0103ae8:	0f b7 c0             	movzwl %ax,%eax
c0103aeb:	83 ec 08             	sub    $0x8,%esp
c0103aee:	50                   	push   %eax
c0103aef:	68 d5 03 00 00       	push   $0x3d5
c0103af4:	e8 a0 c7 ff ff       	call   c0100299 <out_byte>
c0103af9:	83 c4 10             	add    $0x10,%esp
c0103afc:	83 ec 08             	sub    $0x8,%esp
c0103aff:	6a 0f                	push   $0xf
c0103b01:	68 d4 03 00 00       	push   $0x3d4
c0103b06:	e8 8e c7 ff ff       	call   c0100299 <out_byte>
c0103b0b:	83 c4 10             	add    $0x10,%esp
c0103b0e:	8b 45 08             	mov    0x8(%ebp),%eax
c0103b11:	0f b7 c0             	movzwl %ax,%eax
c0103b14:	83 ec 08             	sub    $0x8,%esp
c0103b17:	50                   	push   %eax
c0103b18:	68 d5 03 00 00       	push   $0x3d5
c0103b1d:	e8 77 c7 ff ff       	call   c0100299 <out_byte>
c0103b22:	83 c4 10             	add    $0x10,%esp
c0103b25:	90                   	nop
c0103b26:	c9                   	leave  
c0103b27:	c3                   	ret    

c0103b28 <set_console_start_video_addr>:
c0103b28:	55                   	push   %ebp
c0103b29:	89 e5                	mov    %esp,%ebp
c0103b2b:	83 ec 08             	sub    $0x8,%esp
c0103b2e:	83 ec 08             	sub    $0x8,%esp
c0103b31:	6a 0c                	push   $0xc
c0103b33:	68 d4 03 00 00       	push   $0x3d4
c0103b38:	e8 5c c7 ff ff       	call   c0100299 <out_byte>
c0103b3d:	83 c4 10             	add    $0x10,%esp
c0103b40:	8b 45 08             	mov    0x8(%ebp),%eax
c0103b43:	c1 e8 08             	shr    $0x8,%eax
c0103b46:	0f b7 c0             	movzwl %ax,%eax
c0103b49:	83 ec 08             	sub    $0x8,%esp
c0103b4c:	50                   	push   %eax
c0103b4d:	68 d5 03 00 00       	push   $0x3d5
c0103b52:	e8 42 c7 ff ff       	call   c0100299 <out_byte>
c0103b57:	83 c4 10             	add    $0x10,%esp
c0103b5a:	83 ec 08             	sub    $0x8,%esp
c0103b5d:	6a 0d                	push   $0xd
c0103b5f:	68 d4 03 00 00       	push   $0x3d4
c0103b64:	e8 30 c7 ff ff       	call   c0100299 <out_byte>
c0103b69:	83 c4 10             	add    $0x10,%esp
c0103b6c:	8b 45 08             	mov    0x8(%ebp),%eax
c0103b6f:	0f b7 c0             	movzwl %ax,%eax
c0103b72:	83 ec 08             	sub    $0x8,%esp
c0103b75:	50                   	push   %eax
c0103b76:	68 d5 03 00 00       	push   $0x3d5
c0103b7b:	e8 19 c7 ff ff       	call   c0100299 <out_byte>
c0103b80:	83 c4 10             	add    $0x10,%esp
c0103b83:	90                   	nop
c0103b84:	c9                   	leave  
c0103b85:	c3                   	ret    

c0103b86 <put_key>:
c0103b86:	55                   	push   %ebp
c0103b87:	89 e5                	mov    %esp,%ebp
c0103b89:	83 ec 04             	sub    $0x4,%esp
c0103b8c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103b8f:	88 45 fc             	mov    %al,-0x4(%ebp)
c0103b92:	8b 45 08             	mov    0x8(%ebp),%eax
c0103b95:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0103b9b:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c0103ba0:	77 4d                	ja     c0103bef <put_key+0x69>
c0103ba2:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ba5:	8b 00                	mov    (%eax),%eax
c0103ba7:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
c0103bab:	89 10                	mov    %edx,(%eax)
c0103bad:	8b 45 08             	mov    0x8(%ebp),%eax
c0103bb0:	8b 00                	mov    (%eax),%eax
c0103bb2:	8d 50 04             	lea    0x4(%eax),%edx
c0103bb5:	8b 45 08             	mov    0x8(%ebp),%eax
c0103bb8:	89 10                	mov    %edx,(%eax)
c0103bba:	8b 45 08             	mov    0x8(%ebp),%eax
c0103bbd:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0103bc3:	8d 50 01             	lea    0x1(%eax),%edx
c0103bc6:	8b 45 08             	mov    0x8(%ebp),%eax
c0103bc9:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0103bcf:	8b 45 08             	mov    0x8(%ebp),%eax
c0103bd2:	8b 00                	mov    (%eax),%eax
c0103bd4:	8b 55 08             	mov    0x8(%ebp),%edx
c0103bd7:	83 c2 08             	add    $0x8,%edx
c0103bda:	81 c2 00 08 00 00    	add    $0x800,%edx
c0103be0:	39 d0                	cmp    %edx,%eax
c0103be2:	75 0b                	jne    c0103bef <put_key+0x69>
c0103be4:	8b 45 08             	mov    0x8(%ebp),%eax
c0103be7:	8d 50 08             	lea    0x8(%eax),%edx
c0103bea:	8b 45 08             	mov    0x8(%ebp),%eax
c0103bed:	89 10                	mov    %edx,(%eax)
c0103bef:	90                   	nop
c0103bf0:	c9                   	leave  
c0103bf1:	c3                   	ret    

c0103bf2 <scroll_up>:
c0103bf2:	55                   	push   %ebp
c0103bf3:	89 e5                	mov    %esp,%ebp
c0103bf5:	83 ec 08             	sub    $0x8,%esp
c0103bf8:	8b 45 08             	mov    0x8(%ebp),%eax
c0103bfb:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103c01:	8b 40 08             	mov    0x8(%eax),%eax
c0103c04:	8d 50 b0             	lea    -0x50(%eax),%edx
c0103c07:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c0a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103c10:	8b 00                	mov    (%eax),%eax
c0103c12:	39 c2                	cmp    %eax,%edx
c0103c14:	76 1b                	jbe    c0103c31 <scroll_up+0x3f>
c0103c16:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c19:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103c1f:	8b 40 08             	mov    0x8(%eax),%eax
c0103c22:	83 e8 50             	sub    $0x50,%eax
c0103c25:	83 ec 0c             	sub    $0xc,%esp
c0103c28:	50                   	push   %eax
c0103c29:	e8 fa fe ff ff       	call   c0103b28 <set_console_start_video_addr>
c0103c2e:	83 c4 10             	add    $0x10,%esp
c0103c31:	90                   	nop
c0103c32:	c9                   	leave  
c0103c33:	c3                   	ret    

c0103c34 <scroll_down>:
c0103c34:	55                   	push   %ebp
c0103c35:	89 e5                	mov    %esp,%ebp
c0103c37:	83 ec 08             	sub    $0x8,%esp
c0103c3a:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c3d:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103c43:	8b 40 08             	mov    0x8(%eax),%eax
c0103c46:	8d 48 50             	lea    0x50(%eax),%ecx
c0103c49:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c4c:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103c52:	8b 10                	mov    (%eax),%edx
c0103c54:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c57:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103c5d:	8b 40 04             	mov    0x4(%eax),%eax
c0103c60:	01 d0                	add    %edx,%eax
c0103c62:	39 c1                	cmp    %eax,%ecx
c0103c64:	73 36                	jae    c0103c9c <scroll_down+0x68>
c0103c66:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c69:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103c6f:	8b 40 08             	mov    0x8(%eax),%eax
c0103c72:	83 c0 50             	add    $0x50,%eax
c0103c75:	83 ec 0c             	sub    $0xc,%esp
c0103c78:	50                   	push   %eax
c0103c79:	e8 aa fe ff ff       	call   c0103b28 <set_console_start_video_addr>
c0103c7e:	83 c4 10             	add    $0x10,%esp
c0103c81:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c84:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103c8a:	8b 50 08             	mov    0x8(%eax),%edx
c0103c8d:	8b 45 08             	mov    0x8(%ebp),%eax
c0103c90:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103c96:	83 c2 50             	add    $0x50,%edx
c0103c99:	89 50 08             	mov    %edx,0x8(%eax)
c0103c9c:	90                   	nop
c0103c9d:	c9                   	leave  
c0103c9e:	c3                   	ret    

c0103c9f <out_char>:
c0103c9f:	55                   	push   %ebp
c0103ca0:	89 e5                	mov    %esp,%ebp
c0103ca2:	83 ec 28             	sub    $0x28,%esp
c0103ca5:	8b 45 0c             	mov    0xc(%ebp),%eax
c0103ca8:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0103cab:	e8 6a 2d 00 00       	call   c0106a1a <intr_disable>
c0103cb0:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0103cb3:	8b 45 08             	mov    0x8(%ebp),%eax
c0103cb6:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103cbc:	8b 40 0c             	mov    0xc(%eax),%eax
c0103cbf:	05 00 c0 05 60       	add    $0x6005c000,%eax
c0103cc4:	01 c0                	add    %eax,%eax
c0103cc6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103cc9:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
c0103ccd:	83 f8 08             	cmp    $0x8,%eax
c0103cd0:	0f 84 8d 00 00 00    	je     c0103d63 <out_char+0xc4>
c0103cd6:	83 f8 0a             	cmp    $0xa,%eax
c0103cd9:	0f 85 c9 00 00 00    	jne    c0103da8 <out_char+0x109>
c0103cdf:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ce2:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103ce8:	8b 50 0c             	mov    0xc(%eax),%edx
c0103ceb:	8b 45 08             	mov    0x8(%ebp),%eax
c0103cee:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103cf4:	8b 08                	mov    (%eax),%ecx
c0103cf6:	8b 45 08             	mov    0x8(%ebp),%eax
c0103cf9:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103cff:	8b 40 04             	mov    0x4(%eax),%eax
c0103d02:	01 c8                	add    %ecx,%eax
c0103d04:	83 e8 50             	sub    $0x50,%eax
c0103d07:	39 c2                	cmp    %eax,%edx
c0103d09:	0f 83 f4 00 00 00    	jae    c0103e03 <out_char+0x164>
c0103d0f:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d12:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103d18:	8b 08                	mov    (%eax),%ecx
c0103d1a:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d1d:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103d23:	8b 50 0c             	mov    0xc(%eax),%edx
c0103d26:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d29:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103d2f:	8b 00                	mov    (%eax),%eax
c0103d31:	29 c2                	sub    %eax,%edx
c0103d33:	89 d0                	mov    %edx,%eax
c0103d35:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
c0103d3a:	f7 e2                	mul    %edx
c0103d3c:	89 d0                	mov    %edx,%eax
c0103d3e:	c1 e8 06             	shr    $0x6,%eax
c0103d41:	8d 50 01             	lea    0x1(%eax),%edx
c0103d44:	89 d0                	mov    %edx,%eax
c0103d46:	c1 e0 02             	shl    $0x2,%eax
c0103d49:	01 d0                	add    %edx,%eax
c0103d4b:	c1 e0 04             	shl    $0x4,%eax
c0103d4e:	89 c2                	mov    %eax,%edx
c0103d50:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d53:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103d59:	01 ca                	add    %ecx,%edx
c0103d5b:	89 50 0c             	mov    %edx,0xc(%eax)
c0103d5e:	e9 a0 00 00 00       	jmp    c0103e03 <out_char+0x164>
c0103d63:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d66:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103d6c:	8b 50 0c             	mov    0xc(%eax),%edx
c0103d6f:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d72:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103d78:	8b 00                	mov    (%eax),%eax
c0103d7a:	39 c2                	cmp    %eax,%edx
c0103d7c:	0f 86 84 00 00 00    	jbe    c0103e06 <out_char+0x167>
c0103d82:	8b 45 08             	mov    0x8(%ebp),%eax
c0103d85:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103d8b:	8b 50 0c             	mov    0xc(%eax),%edx
c0103d8e:	83 ea 01             	sub    $0x1,%edx
c0103d91:	89 50 0c             	mov    %edx,0xc(%eax)
c0103d94:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103d97:	83 e8 02             	sub    $0x2,%eax
c0103d9a:	c6 00 20             	movb   $0x20,(%eax)
c0103d9d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103da0:	83 e8 01             	sub    $0x1,%eax
c0103da3:	c6 00 00             	movb   $0x0,(%eax)
c0103da6:	eb 5e                	jmp    c0103e06 <out_char+0x167>
c0103da8:	8b 45 08             	mov    0x8(%ebp),%eax
c0103dab:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103db1:	8b 40 0c             	mov    0xc(%eax),%eax
c0103db4:	8d 48 01             	lea    0x1(%eax),%ecx
c0103db7:	8b 45 08             	mov    0x8(%ebp),%eax
c0103dba:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103dc0:	8b 10                	mov    (%eax),%edx
c0103dc2:	8b 45 08             	mov    0x8(%ebp),%eax
c0103dc5:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103dcb:	8b 40 04             	mov    0x4(%eax),%eax
c0103dce:	01 d0                	add    %edx,%eax
c0103dd0:	39 c1                	cmp    %eax,%ecx
c0103dd2:	73 35                	jae    c0103e09 <out_char+0x16a>
c0103dd4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103dd7:	8d 50 01             	lea    0x1(%eax),%edx
c0103dda:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0103ddd:	0f b6 55 e4          	movzbl -0x1c(%ebp),%edx
c0103de1:	88 10                	mov    %dl,(%eax)
c0103de3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0103de6:	8d 50 01             	lea    0x1(%eax),%edx
c0103de9:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0103dec:	c6 00 0a             	movb   $0xa,(%eax)
c0103def:	8b 45 08             	mov    0x8(%ebp),%eax
c0103df2:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103df8:	8b 50 0c             	mov    0xc(%eax),%edx
c0103dfb:	83 c2 01             	add    $0x1,%edx
c0103dfe:	89 50 0c             	mov    %edx,0xc(%eax)
c0103e01:	eb 06                	jmp    c0103e09 <out_char+0x16a>
c0103e03:	90                   	nop
c0103e04:	eb 14                	jmp    c0103e1a <out_char+0x17b>
c0103e06:	90                   	nop
c0103e07:	eb 11                	jmp    c0103e1a <out_char+0x17b>
c0103e09:	90                   	nop
c0103e0a:	eb 0e                	jmp    c0103e1a <out_char+0x17b>
c0103e0c:	83 ec 0c             	sub    $0xc,%esp
c0103e0f:	ff 75 08             	pushl  0x8(%ebp)
c0103e12:	e8 1d fe ff ff       	call   c0103c34 <scroll_down>
c0103e17:	83 c4 10             	add    $0x10,%esp
c0103e1a:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e1d:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e23:	8b 50 0c             	mov    0xc(%eax),%edx
c0103e26:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e29:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0103e2f:	8b 40 08             	mov    0x8(%eax),%eax
c0103e32:	29 c2                	sub    %eax,%edx
c0103e34:	89 d0                	mov    %edx,%eax
c0103e36:	3d d0 07 00 00       	cmp    $0x7d0,%eax
c0103e3b:	77 cf                	ja     c0103e0c <out_char+0x16d>
c0103e3d:	83 ec 0c             	sub    $0xc,%esp
c0103e40:	ff 75 08             	pushl  0x8(%ebp)
c0103e43:	e8 49 fc ff ff       	call   c0103a91 <flush>
c0103e48:	83 c4 10             	add    $0x10,%esp
c0103e4b:	83 ec 0c             	sub    $0xc,%esp
c0103e4e:	ff 75 f4             	pushl  -0xc(%ebp)
c0103e51:	e8 ed 2b 00 00       	call   c0106a43 <intr_set_status>
c0103e56:	83 c4 10             	add    $0x10,%esp
c0103e59:	90                   	nop
c0103e5a:	c9                   	leave  
c0103e5b:	c3                   	ret    

c0103e5c <tty_dev_read>:
c0103e5c:	55                   	push   %ebp
c0103e5d:	89 e5                	mov    %esp,%ebp
c0103e5f:	83 ec 08             	sub    $0x8,%esp
c0103e62:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c0103e67:	39 45 08             	cmp    %eax,0x8(%ebp)
c0103e6a:	75 17                	jne    c0103e83 <tty_dev_read+0x27>
c0103e6c:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c0103e71:	85 c0                	test   %eax,%eax
c0103e73:	7e 0e                	jle    c0103e83 <tty_dev_read+0x27>
c0103e75:	83 ec 0c             	sub    $0xc,%esp
c0103e78:	ff 75 08             	pushl  0x8(%ebp)
c0103e7b:	e8 89 07 00 00       	call   c0104609 <keyboard_read>
c0103e80:	83 c4 10             	add    $0x10,%esp
c0103e83:	90                   	nop
c0103e84:	c9                   	leave  
c0103e85:	c3                   	ret    

c0103e86 <tty_dev_write>:
c0103e86:	55                   	push   %ebp
c0103e87:	89 e5                	mov    %esp,%ebp
c0103e89:	83 ec 28             	sub    $0x28,%esp
c0103e8c:	8b 45 08             	mov    0x8(%ebp),%eax
c0103e8f:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0103e95:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0103e98:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0103e9f:	e9 88 01 00 00       	jmp    c010402c <tty_dev_write+0x1a6>
c0103ea4:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ea7:	8b 40 04             	mov    0x4(%eax),%eax
c0103eaa:	8b 00                	mov    (%eax),%eax
c0103eac:	88 45 e7             	mov    %al,-0x19(%ebp)
c0103eaf:	8b 45 08             	mov    0x8(%ebp),%eax
c0103eb2:	8b 40 04             	mov    0x4(%eax),%eax
c0103eb5:	8d 50 04             	lea    0x4(%eax),%edx
c0103eb8:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ebb:	89 50 04             	mov    %edx,0x4(%eax)
c0103ebe:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ec1:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0103ec7:	8d 50 ff             	lea    -0x1(%eax),%edx
c0103eca:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ecd:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0103ed3:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ed6:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c0103edc:	8d 50 01             	lea    0x1(%eax),%edx
c0103edf:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ee2:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0103ee8:	8b 45 08             	mov    0x8(%ebp),%eax
c0103eeb:	8b 40 04             	mov    0x4(%eax),%eax
c0103eee:	8b 55 08             	mov    0x8(%ebp),%edx
c0103ef1:	83 c2 08             	add    $0x8,%edx
c0103ef4:	81 c2 00 08 00 00    	add    $0x800,%edx
c0103efa:	39 d0                	cmp    %edx,%eax
c0103efc:	75 0c                	jne    c0103f0a <tty_dev_write+0x84>
c0103efe:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f01:	8d 50 08             	lea    0x8(%eax),%edx
c0103f04:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f07:	89 50 04             	mov    %edx,0x4(%eax)
c0103f0a:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f0d:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0103f13:	85 c0                	test   %eax,%eax
c0103f15:	0f 84 11 01 00 00    	je     c010402c <tty_dev_write+0x1a6>
c0103f1b:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0103f1f:	3c 20                	cmp    $0x20,%al
c0103f21:	76 08                	jbe    c0103f2b <tty_dev_write+0xa5>
c0103f23:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0103f27:	3c 7e                	cmp    $0x7e,%al
c0103f29:	76 10                	jbe    c0103f3b <tty_dev_write+0xb5>
c0103f2b:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0103f2f:	3c 20                	cmp    $0x20,%al
c0103f31:	74 08                	je     c0103f3b <tty_dev_write+0xb5>
c0103f33:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0103f37:	84 c0                	test   %al,%al
c0103f39:	75 58                	jne    c0103f93 <tty_dev_write+0x10d>
c0103f3b:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f3e:	8b 90 18 08 00 00    	mov    0x818(%eax),%edx
c0103f44:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f47:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c0103f4d:	01 d0                	add    %edx,%eax
c0103f4f:	83 e8 01             	sub    $0x1,%eax
c0103f52:	89 c2                	mov    %eax,%edx
c0103f54:	83 ec 04             	sub    $0x4,%esp
c0103f57:	6a 01                	push   $0x1
c0103f59:	8d 45 e7             	lea    -0x19(%ebp),%eax
c0103f5c:	50                   	push   %eax
c0103f5d:	52                   	push   %edx
c0103f5e:	e8 1b 2b 00 00       	call   c0106a7e <Memcpy>
c0103f63:	83 c4 10             	add    $0x10,%esp
c0103f66:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f69:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0103f6f:	8d 50 ff             	lea    -0x1(%eax),%edx
c0103f72:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f75:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c0103f7b:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0103f7f:	0f b6 c0             	movzbl %al,%eax
c0103f82:	83 ec 08             	sub    $0x8,%esp
c0103f85:	50                   	push   %eax
c0103f86:	ff 75 08             	pushl  0x8(%ebp)
c0103f89:	e8 11 fd ff ff       	call   c0103c9f <out_char>
c0103f8e:	83 c4 10             	add    $0x10,%esp
c0103f91:	eb 7c                	jmp    c010400f <tty_dev_write+0x189>
c0103f93:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0103f97:	3c 08                	cmp    $0x8,%al
c0103f99:	75 42                	jne    c0103fdd <tty_dev_write+0x157>
c0103f9b:	8b 45 08             	mov    0x8(%ebp),%eax
c0103f9e:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0103fa4:	8d 50 01             	lea    0x1(%eax),%edx
c0103fa7:	8b 45 08             	mov    0x8(%ebp),%eax
c0103faa:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c0103fb0:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fb3:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c0103fb9:	8d 50 fe             	lea    -0x2(%eax),%edx
c0103fbc:	8b 45 08             	mov    0x8(%ebp),%eax
c0103fbf:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0103fc5:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0103fc9:	0f b6 c0             	movzbl %al,%eax
c0103fcc:	83 ec 08             	sub    $0x8,%esp
c0103fcf:	50                   	push   %eax
c0103fd0:	ff 75 08             	pushl  0x8(%ebp)
c0103fd3:	e8 c7 fc ff ff       	call   c0103c9f <out_char>
c0103fd8:	83 c4 10             	add    $0x10,%esp
c0103fdb:	eb 32                	jmp    c010400f <tty_dev_write+0x189>
c0103fdd:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0103fe1:	3c 0a                	cmp    $0xa,%al
c0103fe3:	75 2a                	jne    c010400f <tty_dev_write+0x189>
c0103fe5:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0103fe9:	0f b6 c0             	movzbl %al,%eax
c0103fec:	83 ec 08             	sub    $0x8,%esp
c0103fef:	50                   	push   %eax
c0103ff0:	ff 75 08             	pushl  0x8(%ebp)
c0103ff3:	e8 a7 fc ff ff       	call   c0103c9f <out_char>
c0103ff8:	83 c4 10             	add    $0x10,%esp
c0103ffb:	8b 45 08             	mov    0x8(%ebp),%eax
c0103ffe:	c7 80 0c 08 00 00 00 	movl   $0x0,0x80c(%eax)
c0104005:	00 00 00 
c0104008:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c010400f:	8b 45 08             	mov    0x8(%ebp),%eax
c0104012:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0104018:	8b 45 08             	mov    0x8(%ebp),%eax
c010401b:	8b 80 14 08 00 00    	mov    0x814(%eax),%eax
c0104021:	39 c2                	cmp    %eax,%edx
c0104023:	75 07                	jne    c010402c <tty_dev_write+0x1a6>
c0104025:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c010402c:	8b 45 08             	mov    0x8(%ebp),%eax
c010402f:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0104035:	85 c0                	test   %eax,%eax
c0104037:	0f 85 67 fe ff ff    	jne    c0103ea4 <tty_dev_write+0x1e>
c010403d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0104041:	74 6d                	je     c01040b0 <tty_dev_write+0x22a>
c0104043:	c7 45 ec 7c 00 00 00 	movl   $0x7c,-0x14(%ebp)
c010404a:	83 ec 0c             	sub    $0xc,%esp
c010404d:	ff 75 ec             	pushl  -0x14(%ebp)
c0104050:	e8 27 d4 ff ff       	call   c010147c <sys_malloc>
c0104055:	83 c4 10             	add    $0x10,%esp
c0104058:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010405b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010405e:	c7 40 78 66 00 00 00 	movl   $0x66,0x78(%eax)
c0104065:	8b 45 08             	mov    0x8(%ebp),%eax
c0104068:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c010406e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104071:	89 50 60             	mov    %edx,0x60(%eax)
c0104074:	8b 45 08             	mov    0x8(%ebp),%eax
c0104077:	8b 90 20 08 00 00    	mov    0x820(%eax),%edx
c010407d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104080:	89 50 68             	mov    %edx,0x68(%eax)
c0104083:	8b 45 08             	mov    0x8(%ebp),%eax
c0104086:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c010408c:	83 ec 04             	sub    $0x4,%esp
c010408f:	50                   	push   %eax
c0104090:	ff 75 e8             	pushl  -0x18(%ebp)
c0104093:	6a 01                	push   $0x1
c0104095:	e8 da 4d 00 00       	call   c0108e74 <send_rec>
c010409a:	83 c4 10             	add    $0x10,%esp
c010409d:	83 ec 08             	sub    $0x8,%esp
c01040a0:	ff 75 ec             	pushl  -0x14(%ebp)
c01040a3:	ff 75 e8             	pushl  -0x18(%ebp)
c01040a6:	e8 e6 d3 ff ff       	call   c0101491 <sys_free>
c01040ab:	83 c4 10             	add    $0x10,%esp
c01040ae:	eb 01                	jmp    c01040b1 <tty_dev_write+0x22b>
c01040b0:	90                   	nop
c01040b1:	c9                   	leave  
c01040b2:	c3                   	ret    

c01040b3 <tty_do_read>:
c01040b3:	55                   	push   %ebp
c01040b4:	89 e5                	mov    %esp,%ebp
c01040b6:	83 ec 08             	sub    $0x8,%esp
c01040b9:	8b 45 08             	mov    0x8(%ebp),%eax
c01040bc:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c01040c3:	00 00 00 
c01040c6:	8b 45 0c             	mov    0xc(%ebp),%eax
c01040c9:	8b 50 68             	mov    0x68(%eax),%edx
c01040cc:	8b 45 08             	mov    0x8(%ebp),%eax
c01040cf:	89 90 20 08 00 00    	mov    %edx,0x820(%eax)
c01040d5:	8b 45 0c             	mov    0xc(%ebp),%eax
c01040d8:	8b 00                	mov    (%eax),%eax
c01040da:	89 c2                	mov    %eax,%edx
c01040dc:	8b 45 08             	mov    0x8(%ebp),%eax
c01040df:	89 90 1c 08 00 00    	mov    %edx,0x81c(%eax)
c01040e5:	8b 45 0c             	mov    0xc(%ebp),%eax
c01040e8:	8b 50 60             	mov    0x60(%eax),%edx
c01040eb:	8b 45 08             	mov    0x8(%ebp),%eax
c01040ee:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c01040f4:	8b 45 0c             	mov    0xc(%ebp),%eax
c01040f7:	8b 50 60             	mov    0x60(%eax),%edx
c01040fa:	8b 45 08             	mov    0x8(%ebp),%eax
c01040fd:	89 90 14 08 00 00    	mov    %edx,0x814(%eax)
c0104103:	8b 45 08             	mov    0x8(%ebp),%eax
c0104106:	8b 90 0c 08 00 00    	mov    0x80c(%eax),%edx
c010410c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010410f:	8b 40 10             	mov    0x10(%eax),%eax
c0104112:	83 ec 08             	sub    $0x8,%esp
c0104115:	52                   	push   %edx
c0104116:	50                   	push   %eax
c0104117:	e8 48 1b 00 00       	call   c0105c64 <alloc_virtual_memory>
c010411c:	83 c4 10             	add    $0x10,%esp
c010411f:	89 c2                	mov    %eax,%edx
c0104121:	8b 45 08             	mov    0x8(%ebp),%eax
c0104124:	89 90 18 08 00 00    	mov    %edx,0x818(%eax)
c010412a:	8b 45 08             	mov    0x8(%ebp),%eax
c010412d:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c0104133:	83 f8 02             	cmp    $0x2,%eax
c0104136:	74 1c                	je     c0104154 <tty_do_read+0xa1>
c0104138:	68 3b 01 00 00       	push   $0x13b
c010413d:	68 c1 a2 10 c0       	push   $0xc010a2c1
c0104142:	68 c1 a2 10 c0       	push   $0xc010a2c1
c0104147:	68 cb a2 10 c0       	push   $0xc010a2cb
c010414c:	e8 06 43 00 00       	call   c0108457 <assertion_failure>
c0104151:	83 c4 10             	add    $0x10,%esp
c0104154:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104157:	c7 40 78 67 00 00 00 	movl   $0x67,0x78(%eax)
c010415e:	8b 45 08             	mov    0x8(%ebp),%eax
c0104161:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c0104167:	83 ec 04             	sub    $0x4,%esp
c010416a:	50                   	push   %eax
c010416b:	ff 75 0c             	pushl  0xc(%ebp)
c010416e:	6a 01                	push   $0x1
c0104170:	e8 ff 4c 00 00       	call   c0108e74 <send_rec>
c0104175:	83 c4 10             	add    $0x10,%esp
c0104178:	90                   	nop
c0104179:	c9                   	leave  
c010417a:	c3                   	ret    

c010417b <tty_do_write>:
c010417b:	55                   	push   %ebp
c010417c:	89 e5                	mov    %esp,%ebp
c010417e:	53                   	push   %ebx
c010417f:	83 ec 24             	sub    $0x24,%esp
c0104182:	89 e0                	mov    %esp,%eax
c0104184:	89 c3                	mov    %eax,%ebx
c0104186:	c7 45 e8 80 00 00 00 	movl   $0x80,-0x18(%ebp)
c010418d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104190:	8d 50 ff             	lea    -0x1(%eax),%edx
c0104193:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c0104196:	89 c2                	mov    %eax,%edx
c0104198:	b8 10 00 00 00       	mov    $0x10,%eax
c010419d:	83 e8 01             	sub    $0x1,%eax
c01041a0:	01 d0                	add    %edx,%eax
c01041a2:	b9 10 00 00 00       	mov    $0x10,%ecx
c01041a7:	ba 00 00 00 00       	mov    $0x0,%edx
c01041ac:	f7 f1                	div    %ecx
c01041ae:	6b c0 10             	imul   $0x10,%eax,%eax
c01041b1:	29 c4                	sub    %eax,%esp
c01041b3:	89 e0                	mov    %esp,%eax
c01041b5:	83 c0 00             	add    $0x0,%eax
c01041b8:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01041bb:	83 ec 04             	sub    $0x4,%esp
c01041be:	ff 75 e8             	pushl  -0x18(%ebp)
c01041c1:	6a 00                	push   $0x0
c01041c3:	ff 75 e0             	pushl  -0x20(%ebp)
c01041c6:	e8 54 6a 00 00       	call   c010ac1f <Memset>
c01041cb:	83 c4 10             	add    $0x10,%esp
c01041ce:	8b 45 0c             	mov    0xc(%ebp),%eax
c01041d1:	8b 40 60             	mov    0x60(%eax),%eax
c01041d4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01041d7:	8b 45 08             	mov    0x8(%ebp),%eax
c01041da:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c01041e1:	00 00 00 
c01041e4:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01041e7:	8b 45 0c             	mov    0xc(%ebp),%eax
c01041ea:	8b 40 10             	mov    0x10(%eax),%eax
c01041ed:	83 ec 08             	sub    $0x8,%esp
c01041f0:	52                   	push   %edx
c01041f1:	50                   	push   %eax
c01041f2:	e8 6d 1a 00 00       	call   c0105c64 <alloc_virtual_memory>
c01041f7:	83 c4 10             	add    $0x10,%esp
c01041fa:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01041fd:	eb 7e                	jmp    c010427d <tty_do_write+0x102>
c01041ff:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104202:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c0104205:	0f 4e 45 ec          	cmovle -0x14(%ebp),%eax
c0104209:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010420c:	8b 45 08             	mov    0x8(%ebp),%eax
c010420f:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0104215:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104218:	01 d0                	add    %edx,%eax
c010421a:	83 ec 04             	sub    $0x4,%esp
c010421d:	ff 75 f0             	pushl  -0x10(%ebp)
c0104220:	50                   	push   %eax
c0104221:	ff 75 e0             	pushl  -0x20(%ebp)
c0104224:	e8 55 28 00 00       	call   c0106a7e <Memcpy>
c0104229:	83 c4 10             	add    $0x10,%esp
c010422c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010422f:	29 45 ec             	sub    %eax,-0x14(%ebp)
c0104232:	8b 45 08             	mov    0x8(%ebp),%eax
c0104235:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c010423b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010423e:	01 c2                	add    %eax,%edx
c0104240:	8b 45 08             	mov    0x8(%ebp),%eax
c0104243:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0104249:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0104250:	eb 25                	jmp    c0104277 <tty_do_write+0xfc>
c0104252:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0104255:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104258:	01 d0                	add    %edx,%eax
c010425a:	0f b6 00             	movzbl (%eax),%eax
c010425d:	0f b6 c0             	movzbl %al,%eax
c0104260:	83 ec 08             	sub    $0x8,%esp
c0104263:	50                   	push   %eax
c0104264:	ff 75 08             	pushl  0x8(%ebp)
c0104267:	e8 33 fa ff ff       	call   c0103c9f <out_char>
c010426c:	83 c4 10             	add    $0x10,%esp
c010426f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0104273:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c0104277:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010427b:	75 d5                	jne    c0104252 <tty_do_write+0xd7>
c010427d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0104281:	0f 85 78 ff ff ff    	jne    c01041ff <tty_do_write+0x84>
c0104287:	83 ec 0c             	sub    $0xc,%esp
c010428a:	6a 7c                	push   $0x7c
c010428c:	e8 eb d1 ff ff       	call   c010147c <sys_malloc>
c0104291:	83 c4 10             	add    $0x10,%esp
c0104294:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0104297:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010429a:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c01042a1:	8b 45 08             	mov    0x8(%ebp),%eax
c01042a4:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c01042aa:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01042ad:	89 50 58             	mov    %edx,0x58(%eax)
c01042b0:	8b 45 0c             	mov    0xc(%ebp),%eax
c01042b3:	8b 00                	mov    (%eax),%eax
c01042b5:	83 ec 04             	sub    $0x4,%esp
c01042b8:	50                   	push   %eax
c01042b9:	ff 75 d8             	pushl  -0x28(%ebp)
c01042bc:	6a 01                	push   $0x1
c01042be:	e8 b1 4b 00 00       	call   c0108e74 <send_rec>
c01042c3:	83 c4 10             	add    $0x10,%esp
c01042c6:	83 ec 08             	sub    $0x8,%esp
c01042c9:	6a 7c                	push   $0x7c
c01042cb:	ff 75 d8             	pushl  -0x28(%ebp)
c01042ce:	e8 be d1 ff ff       	call   c0101491 <sys_free>
c01042d3:	83 c4 10             	add    $0x10,%esp
c01042d6:	89 dc                	mov    %ebx,%esp
c01042d8:	90                   	nop
c01042d9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01042dc:	c9                   	leave  
c01042dd:	c3                   	ret    

c01042de <init_screen>:
c01042de:	55                   	push   %ebp
c01042df:	89 e5                	mov    %esp,%ebp
c01042e1:	83 ec 10             	sub    $0x10,%esp
c01042e4:	8b 45 08             	mov    0x8(%ebp),%eax
c01042e7:	2d 00 fe 10 c0       	sub    $0xc010fe00,%eax
c01042ec:	c1 f8 03             	sar    $0x3,%eax
c01042ef:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c01042f5:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01042f8:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01042fb:	c1 e0 04             	shl    $0x4,%eax
c01042fe:	8d 90 14 0f 11 c0    	lea    -0x3feef0ec(%eax),%edx
c0104304:	8b 45 08             	mov    0x8(%ebp),%eax
c0104307:	89 90 24 08 00 00    	mov    %edx,0x824(%eax)
c010430d:	c7 45 f8 ff 3f 00 00 	movl   $0x3fff,-0x8(%ebp)
c0104314:	8b 45 08             	mov    0x8(%ebp),%eax
c0104317:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c010431d:	8b 55 f8             	mov    -0x8(%ebp),%edx
c0104320:	89 50 04             	mov    %edx,0x4(%eax)
c0104323:	8b 45 08             	mov    0x8(%ebp),%eax
c0104326:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c010432c:	8b 50 04             	mov    0x4(%eax),%edx
c010432f:	8b 45 08             	mov    0x8(%ebp),%eax
c0104332:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104338:	0f af 55 fc          	imul   -0x4(%ebp),%edx
c010433c:	89 10                	mov    %edx,(%eax)
c010433e:	8b 45 08             	mov    0x8(%ebp),%eax
c0104341:	8b 90 24 08 00 00    	mov    0x824(%eax),%edx
c0104347:	8b 45 08             	mov    0x8(%ebp),%eax
c010434a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0104350:	8b 12                	mov    (%edx),%edx
c0104352:	89 50 08             	mov    %edx,0x8(%eax)
c0104355:	8b 55 08             	mov    0x8(%ebp),%edx
c0104358:	8b 92 24 08 00 00    	mov    0x824(%edx),%edx
c010435e:	8b 40 08             	mov    0x8(%eax),%eax
c0104361:	89 42 0c             	mov    %eax,0xc(%edx)
c0104364:	90                   	nop
c0104365:	c9                   	leave  
c0104366:	c3                   	ret    

c0104367 <init_tty>:
c0104367:	55                   	push   %ebp
c0104368:	89 e5                	mov    %esp,%ebp
c010436a:	83 ec 18             	sub    $0x18,%esp
c010436d:	c7 45 f4 00 fe 10 c0 	movl   $0xc010fe00,-0xc(%ebp)
c0104374:	e9 92 00 00 00       	jmp    c010440b <init_tty+0xa4>
c0104379:	83 ec 04             	sub    $0x4,%esp
c010437c:	68 28 08 00 00       	push   $0x828
c0104381:	6a 00                	push   $0x0
c0104383:	ff 75 f4             	pushl  -0xc(%ebp)
c0104386:	e8 94 68 00 00       	call   c010ac1f <Memset>
c010438b:	83 c4 10             	add    $0x10,%esp
c010438e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104391:	8d 50 08             	lea    0x8(%eax),%edx
c0104394:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104397:	89 50 04             	mov    %edx,0x4(%eax)
c010439a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010439d:	8b 50 04             	mov    0x4(%eax),%edx
c01043a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01043a3:	89 10                	mov    %edx,(%eax)
c01043a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01043a8:	c7 80 08 08 00 00 00 	movl   $0x0,0x808(%eax)
c01043af:	00 00 00 
c01043b2:	83 ec 0c             	sub    $0xc,%esp
c01043b5:	ff 75 f4             	pushl  -0xc(%ebp)
c01043b8:	e8 21 ff ff ff       	call   c01042de <init_screen>
c01043bd:	83 c4 10             	add    $0x10,%esp
c01043c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01043c3:	2d 00 fe 10 c0       	sub    $0xc010fe00,%eax
c01043c8:	85 c0                	test   %eax,%eax
c01043ca:	7e 38                	jle    c0104404 <init_tty+0x9d>
c01043cc:	83 ec 08             	sub    $0x8,%esp
c01043cf:	6a 23                	push   $0x23
c01043d1:	ff 75 f4             	pushl  -0xc(%ebp)
c01043d4:	e8 c6 f8 ff ff       	call   c0103c9f <out_char>
c01043d9:	83 c4 10             	add    $0x10,%esp
c01043dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01043df:	05 a8 8f 01 00       	add    $0x18fa8,%eax
c01043e4:	2d 00 fe 10 c0       	sub    $0xc010fe00,%eax
c01043e9:	c1 f8 03             	sar    $0x3,%eax
c01043ec:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c01043f2:	0f b6 c0             	movzbl %al,%eax
c01043f5:	83 ec 08             	sub    $0x8,%esp
c01043f8:	50                   	push   %eax
c01043f9:	ff 75 f4             	pushl  -0xc(%ebp)
c01043fc:	e8 9e f8 ff ff       	call   c0103c9f <out_char>
c0104401:	83 c4 10             	add    $0x10,%esp
c0104404:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c010440b:	b8 28 06 11 c0       	mov    $0xc0110628,%eax
c0104410:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0104413:	0f 82 60 ff ff ff    	jb     c0104379 <init_tty+0x12>
c0104419:	90                   	nop
c010441a:	c9                   	leave  
c010441b:	c3                   	ret    

c010441c <TaskTTY>:
c010441c:	55                   	push   %ebp
c010441d:	89 e5                	mov    %esp,%ebp
c010441f:	83 ec 28             	sub    $0x28,%esp
c0104422:	e8 40 ff ff ff       	call   c0104367 <init_tty>
c0104427:	83 ec 0c             	sub    $0xc,%esp
c010442a:	6a 00                	push   $0x0
c010442c:	e8 24 f6 ff ff       	call   c0103a55 <select_console>
c0104431:	83 c4 10             	add    $0x10,%esp
c0104434:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c010443b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0104442:	83 ec 0c             	sub    $0xc,%esp
c0104445:	6a 7c                	push   $0x7c
c0104447:	e8 30 d0 ff ff       	call   c010147c <sys_malloc>
c010444c:	83 c4 10             	add    $0x10,%esp
c010444f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0104452:	c7 45 f4 00 fe 10 c0 	movl   $0xc010fe00,-0xc(%ebp)
c0104459:	eb 30                	jmp    c010448b <TaskTTY+0x6f>
c010445b:	83 ec 0c             	sub    $0xc,%esp
c010445e:	ff 75 f4             	pushl  -0xc(%ebp)
c0104461:	e8 f6 f9 ff ff       	call   c0103e5c <tty_dev_read>
c0104466:	83 c4 10             	add    $0x10,%esp
c0104469:	83 ec 0c             	sub    $0xc,%esp
c010446c:	ff 75 f4             	pushl  -0xc(%ebp)
c010446f:	e8 12 fa ff ff       	call   c0103e86 <tty_dev_write>
c0104474:	83 c4 10             	add    $0x10,%esp
c0104477:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010447a:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0104480:	85 c0                	test   %eax,%eax
c0104482:	75 d7                	jne    c010445b <TaskTTY+0x3f>
c0104484:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c010448b:	b8 28 06 11 c0       	mov    $0xc0110628,%eax
c0104490:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0104493:	72 c6                	jb     c010445b <TaskTTY+0x3f>
c0104495:	83 ec 04             	sub    $0x4,%esp
c0104498:	6a 12                	push   $0x12
c010449a:	ff 75 e8             	pushl  -0x18(%ebp)
c010449d:	6a 02                	push   $0x2
c010449f:	e8 d0 49 00 00       	call   c0108e74 <send_rec>
c01044a4:	83 c4 10             	add    $0x10,%esp
c01044a7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01044aa:	8b 40 78             	mov    0x78(%eax),%eax
c01044ad:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01044b0:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c01044b7:	74 28                	je     c01044e1 <TaskTTY+0xc5>
c01044b9:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c01044c0:	7f 0b                	jg     c01044cd <TaskTTY+0xb1>
c01044c2:	81 7d e4 d1 07 00 00 	cmpl   $0x7d1,-0x1c(%ebp)
c01044c9:	74 4e                	je     c0104519 <TaskTTY+0xfd>
c01044cb:	eb 4d                	jmp    c010451a <TaskTTY+0xfe>
c01044cd:	81 7d e4 d3 07 00 00 	cmpl   $0x7d3,-0x1c(%ebp)
c01044d4:	74 21                	je     c01044f7 <TaskTTY+0xdb>
c01044d6:	81 7d e4 d5 07 00 00 	cmpl   $0x7d5,-0x1c(%ebp)
c01044dd:	74 2e                	je     c010450d <TaskTTY+0xf1>
c01044df:	eb 39                	jmp    c010451a <TaskTTY+0xfe>
c01044e1:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c01044e6:	83 ec 08             	sub    $0x8,%esp
c01044e9:	ff 75 e8             	pushl  -0x18(%ebp)
c01044ec:	50                   	push   %eax
c01044ed:	e8 c1 fb ff ff       	call   c01040b3 <tty_do_read>
c01044f2:	83 c4 10             	add    $0x10,%esp
c01044f5:	eb 23                	jmp    c010451a <TaskTTY+0xfe>
c01044f7:	a1 80 f7 10 c0       	mov    0xc010f780,%eax
c01044fc:	83 ec 08             	sub    $0x8,%esp
c01044ff:	ff 75 e8             	pushl  -0x18(%ebp)
c0104502:	50                   	push   %eax
c0104503:	e8 73 fc ff ff       	call   c010417b <tty_do_write>
c0104508:	83 c4 10             	add    $0x10,%esp
c010450b:	eb 0d                	jmp    c010451a <TaskTTY+0xfe>
c010450d:	c7 05 c0 06 11 c0 00 	movl   $0x0,0xc01106c0
c0104514:	00 00 00 
c0104517:	eb 01                	jmp    c010451a <TaskTTY+0xfe>
c0104519:	90                   	nop
c010451a:	e9 33 ff ff ff       	jmp    c0104452 <TaskTTY+0x36>

c010451f <keyboard_handler>:
c010451f:	55                   	push   %ebp
c0104520:	89 e5                	mov    %esp,%ebp
c0104522:	83 ec 18             	sub    $0x18,%esp
c0104525:	c7 05 c0 06 11 c0 01 	movl   $0x1,0xc01106c0
c010452c:	00 00 00 
c010452f:	c7 45 f4 60 00 00 00 	movl   $0x60,-0xc(%ebp)
c0104536:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c010453b:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c0104540:	7f 5e                	jg     c01045a0 <keyboard_handler+0x81>
c0104542:	e8 74 bd ff ff       	call   c01002bb <disable_int>
c0104547:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010454a:	0f b7 c0             	movzwl %ax,%eax
c010454d:	83 ec 0c             	sub    $0xc,%esp
c0104550:	50                   	push   %eax
c0104551:	e8 37 bd ff ff       	call   c010028d <in_byte>
c0104556:	83 c4 10             	add    $0x10,%esp
c0104559:	88 45 f3             	mov    %al,-0xd(%ebp)
c010455c:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c0104561:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
c0104565:	88 10                	mov    %dl,(%eax)
c0104567:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c010456c:	83 c0 01             	add    $0x1,%eax
c010456f:	a3 e0 fb 10 c0       	mov    %eax,0xc010fbe0
c0104574:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c0104579:	83 c0 01             	add    $0x1,%eax
c010457c:	a3 e8 fb 10 c0       	mov    %eax,0xc010fbe8
c0104581:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c0104586:	ba ec fd 10 c0       	mov    $0xc010fdec,%edx
c010458b:	39 d0                	cmp    %edx,%eax
c010458d:	72 0a                	jb     c0104599 <keyboard_handler+0x7a>
c010458f:	c7 05 e0 fb 10 c0 ec 	movl   $0xc010fbec,0xc010fbe0
c0104596:	fb 10 c0 
c0104599:	e8 1f bd ff ff       	call   c01002bd <enable_int>
c010459e:	eb 01                	jmp    c01045a1 <keyboard_handler+0x82>
c01045a0:	90                   	nop
c01045a1:	c9                   	leave  
c01045a2:	c3                   	ret    

c01045a3 <read_from_keyboard_buf>:
c01045a3:	55                   	push   %ebp
c01045a4:	89 e5                	mov    %esp,%ebp
c01045a6:	83 ec 18             	sub    $0x18,%esp
c01045a9:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
c01045ad:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c01045b2:	85 c0                	test   %eax,%eax
c01045b4:	7f 06                	jg     c01045bc <read_from_keyboard_buf+0x19>
c01045b6:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c01045ba:	eb 4b                	jmp    c0104607 <read_from_keyboard_buf+0x64>
c01045bc:	e8 fa bc ff ff       	call   c01002bb <disable_int>
c01045c1:	a1 e4 fb 10 c0       	mov    0xc010fbe4,%eax
c01045c6:	0f b6 00             	movzbl (%eax),%eax
c01045c9:	88 45 f7             	mov    %al,-0x9(%ebp)
c01045cc:	a1 e4 fb 10 c0       	mov    0xc010fbe4,%eax
c01045d1:	83 c0 01             	add    $0x1,%eax
c01045d4:	a3 e4 fb 10 c0       	mov    %eax,0xc010fbe4
c01045d9:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c01045de:	83 e8 01             	sub    $0x1,%eax
c01045e1:	a3 e8 fb 10 c0       	mov    %eax,0xc010fbe8
c01045e6:	a1 e4 fb 10 c0       	mov    0xc010fbe4,%eax
c01045eb:	ba ec fd 10 c0       	mov    $0xc010fdec,%edx
c01045f0:	39 d0                	cmp    %edx,%eax
c01045f2:	72 0a                	jb     c01045fe <read_from_keyboard_buf+0x5b>
c01045f4:	c7 05 e4 fb 10 c0 ec 	movl   $0xc010fbec,0xc010fbe4
c01045fb:	fb 10 c0 
c01045fe:	e8 ba bc ff ff       	call   c01002bd <enable_int>
c0104603:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c0104607:	c9                   	leave  
c0104608:	c3                   	ret    

c0104609 <keyboard_read>:
c0104609:	55                   	push   %ebp
c010460a:	89 e5                	mov    %esp,%ebp
c010460c:	83 ec 28             	sub    $0x28,%esp
c010460f:	90                   	nop
c0104610:	a1 e8 fb 10 c0       	mov    0xc010fbe8,%eax
c0104615:	85 c0                	test   %eax,%eax
c0104617:	7e f7                	jle    c0104610 <keyboard_read+0x7>
c0104619:	e8 85 ff ff ff       	call   c01045a3 <read_from_keyboard_buf>
c010461e:	88 45 ea             	mov    %al,-0x16(%ebp)
c0104621:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0104628:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c010462c:	80 7d ea e1          	cmpb   $0xe1,-0x16(%ebp)
c0104630:	75 5a                	jne    c010468c <keyboard_read+0x83>
c0104632:	c6 45 e3 e1          	movb   $0xe1,-0x1d(%ebp)
c0104636:	c6 45 e4 1d          	movb   $0x1d,-0x1c(%ebp)
c010463a:	c6 45 e5 45          	movb   $0x45,-0x1b(%ebp)
c010463e:	c6 45 e6 e1          	movb   $0xe1,-0x1a(%ebp)
c0104642:	c6 45 e7 9d          	movb   $0x9d,-0x19(%ebp)
c0104646:	c6 45 e8 c5          	movb   $0xc5,-0x18(%ebp)
c010464a:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
c010464e:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0104655:	eb 20                	jmp    c0104677 <keyboard_read+0x6e>
c0104657:	e8 47 ff ff ff       	call   c01045a3 <read_from_keyboard_buf>
c010465c:	89 c1                	mov    %eax,%ecx
c010465e:	8d 55 e3             	lea    -0x1d(%ebp),%edx
c0104661:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104664:	01 d0                	add    %edx,%eax
c0104666:	0f b6 00             	movzbl (%eax),%eax
c0104669:	38 c1                	cmp    %al,%cl
c010466b:	74 06                	je     c0104673 <keyboard_read+0x6a>
c010466d:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
c0104671:	eb 0a                	jmp    c010467d <keyboard_read+0x74>
c0104673:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0104677:	83 7d ec 05          	cmpl   $0x5,-0x14(%ebp)
c010467b:	7e da                	jle    c0104657 <keyboard_read+0x4e>
c010467d:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
c0104681:	74 68                	je     c01046eb <keyboard_read+0xe2>
c0104683:	c7 45 f4 80 01 00 00 	movl   $0x180,-0xc(%ebp)
c010468a:	eb 5f                	jmp    c01046eb <keyboard_read+0xe2>
c010468c:	80 7d ea e0          	cmpb   $0xe0,-0x16(%ebp)
c0104690:	75 59                	jne    c01046eb <keyboard_read+0xe2>
c0104692:	e8 0c ff ff ff       	call   c01045a3 <read_from_keyboard_buf>
c0104697:	3c 2a                	cmp    $0x2a,%al
c0104699:	75 1d                	jne    c01046b8 <keyboard_read+0xaf>
c010469b:	e8 03 ff ff ff       	call   c01045a3 <read_from_keyboard_buf>
c01046a0:	3c e0                	cmp    $0xe0,%al
c01046a2:	75 14                	jne    c01046b8 <keyboard_read+0xaf>
c01046a4:	e8 fa fe ff ff       	call   c01045a3 <read_from_keyboard_buf>
c01046a9:	3c 37                	cmp    $0x37,%al
c01046ab:	75 0b                	jne    c01046b8 <keyboard_read+0xaf>
c01046ad:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c01046b4:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
c01046b8:	e8 e6 fe ff ff       	call   c01045a3 <read_from_keyboard_buf>
c01046bd:	3c b7                	cmp    $0xb7,%al
c01046bf:	75 1d                	jne    c01046de <keyboard_read+0xd5>
c01046c1:	e8 dd fe ff ff       	call   c01045a3 <read_from_keyboard_buf>
c01046c6:	3c e0                	cmp    $0xe0,%al
c01046c8:	75 14                	jne    c01046de <keyboard_read+0xd5>
c01046ca:	e8 d4 fe ff ff       	call   c01045a3 <read_from_keyboard_buf>
c01046cf:	3c aa                	cmp    $0xaa,%al
c01046d1:	75 0b                	jne    c01046de <keyboard_read+0xd5>
c01046d3:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c01046da:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c01046de:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01046e2:	75 07                	jne    c01046eb <keyboard_read+0xe2>
c01046e4:	c6 05 84 f7 10 c0 01 	movb   $0x1,0xc010f784
c01046eb:	81 7d f4 80 01 00 00 	cmpl   $0x180,-0xc(%ebp)
c01046f2:	0f 84 8d 00 00 00    	je     c0104785 <keyboard_read+0x17c>
c01046f8:	81 7d f4 81 01 00 00 	cmpl   $0x181,-0xc(%ebp)
c01046ff:	0f 84 80 00 00 00    	je     c0104785 <keyboard_read+0x17c>
c0104705:	80 7d ea 36          	cmpb   $0x36,-0x16(%ebp)
c0104709:	0f 94 c2             	sete   %dl
c010470c:	80 7d ea 2a          	cmpb   $0x2a,-0x16(%ebp)
c0104710:	0f 94 c0             	sete   %al
c0104713:	09 d0                	or     %edx,%eax
c0104715:	84 c0                	test   %al,%al
c0104717:	74 07                	je     c0104720 <keyboard_read+0x117>
c0104719:	c6 05 c4 06 11 c0 01 	movb   $0x1,0xc01106c4
c0104720:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
c0104724:	f7 d0                	not    %eax
c0104726:	c0 e8 07             	shr    $0x7,%al
c0104729:	88 45 e9             	mov    %al,-0x17(%ebp)
c010472c:	80 7d ea 00          	cmpb   $0x0,-0x16(%ebp)
c0104730:	74 53                	je     c0104785 <keyboard_read+0x17c>
c0104732:	80 7d e9 00          	cmpb   $0x0,-0x17(%ebp)
c0104736:	74 4d                	je     c0104785 <keyboard_read+0x17c>
c0104738:	c6 45 eb 00          	movb   $0x0,-0x15(%ebp)
c010473c:	0f b6 05 c4 06 11 c0 	movzbl 0xc01106c4,%eax
c0104743:	3c 01                	cmp    $0x1,%al
c0104745:	75 04                	jne    c010474b <keyboard_read+0x142>
c0104747:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
c010474b:	0f b6 05 84 f7 10 c0 	movzbl 0xc010f784,%eax
c0104752:	84 c0                	test   %al,%al
c0104754:	74 04                	je     c010475a <keyboard_read+0x151>
c0104756:	c6 45 eb 02          	movb   $0x2,-0x15(%ebp)
c010475a:	0f b6 55 ea          	movzbl -0x16(%ebp),%edx
c010475e:	89 d0                	mov    %edx,%eax
c0104760:	01 c0                	add    %eax,%eax
c0104762:	01 c2                	add    %eax,%edx
c0104764:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c0104768:	01 d0                	add    %edx,%eax
c010476a:	8b 04 85 60 e1 10 c0 	mov    -0x3fef1ea0(,%eax,4),%eax
c0104771:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104774:	83 ec 08             	sub    $0x8,%esp
c0104777:	ff 75 f4             	pushl  -0xc(%ebp)
c010477a:	ff 75 08             	pushl  0x8(%ebp)
c010477d:	e8 1a 00 00 00       	call   c010479c <in_process>
c0104782:	83 c4 10             	add    $0x10,%esp
c0104785:	90                   	nop
c0104786:	c9                   	leave  
c0104787:	c3                   	ret    

c0104788 <init_keyboard_handler>:
c0104788:	55                   	push   %ebp
c0104789:	89 e5                	mov    %esp,%ebp
c010478b:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c0104792:	c6 05 c4 06 11 c0 00 	movb   $0x0,0xc01106c4
c0104799:	90                   	nop
c010479a:	5d                   	pop    %ebp
c010479b:	c3                   	ret    

c010479c <in_process>:
c010479c:	55                   	push   %ebp
c010479d:	89 e5                	mov    %esp,%ebp
c010479f:	83 ec 18             	sub    $0x18,%esp
c01047a2:	83 ec 04             	sub    $0x4,%esp
c01047a5:	6a 02                	push   $0x2
c01047a7:	6a 00                	push   $0x0
c01047a9:	8d 45 f6             	lea    -0xa(%ebp),%eax
c01047ac:	50                   	push   %eax
c01047ad:	e8 6d 64 00 00       	call   c010ac1f <Memset>
c01047b2:	83 c4 10             	add    $0x10,%esp
c01047b5:	8b 45 0c             	mov    0xc(%ebp),%eax
c01047b8:	25 00 01 00 00       	and    $0x100,%eax
c01047bd:	85 c0                	test   %eax,%eax
c01047bf:	75 28                	jne    c01047e9 <in_process+0x4d>
c01047c1:	8b 45 0c             	mov    0xc(%ebp),%eax
c01047c4:	0f b6 c0             	movzbl %al,%eax
c01047c7:	83 ec 08             	sub    $0x8,%esp
c01047ca:	50                   	push   %eax
c01047cb:	ff 75 08             	pushl  0x8(%ebp)
c01047ce:	e8 b3 f3 ff ff       	call   c0103b86 <put_key>
c01047d3:	83 c4 10             	add    $0x10,%esp
c01047d6:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c01047dd:	c6 05 c4 06 11 c0 00 	movb   $0x0,0xc01106c4
c01047e4:	e9 42 01 00 00       	jmp    c010492b <in_process+0x18f>
c01047e9:	0f b6 05 c4 06 11 c0 	movzbl 0xc01106c4,%eax
c01047f0:	84 c0                	test   %al,%al
c01047f2:	0f 84 a9 00 00 00    	je     c01048a1 <in_process+0x105>
c01047f8:	83 7d 0c 2a          	cmpl   $0x2a,0xc(%ebp)
c01047fc:	0f 84 9f 00 00 00    	je     c01048a1 <in_process+0x105>
c0104802:	83 7d 0c 36          	cmpl   $0x36,0xc(%ebp)
c0104806:	0f 84 95 00 00 00    	je     c01048a1 <in_process+0x105>
c010480c:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0104813:	74 64                	je     c0104879 <in_process+0xdd>
c0104815:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c010481c:	77 0b                	ja     c0104829 <in_process+0x8d>
c010481e:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0104825:	74 64                	je     c010488b <in_process+0xef>
c0104827:	eb 73                	jmp    c010489c <in_process+0x100>
c0104829:	81 7d 0c 55 01 00 00 	cmpl   $0x155,0xc(%ebp)
c0104830:	74 0b                	je     c010483d <in_process+0xa1>
c0104832:	81 7d 0c 68 01 00 00 	cmpl   $0x168,0xc(%ebp)
c0104839:	74 20                	je     c010485b <in_process+0xbf>
c010483b:	eb 5f                	jmp    c010489c <in_process+0x100>
c010483d:	83 ec 0c             	sub    $0xc,%esp
c0104840:	ff 75 08             	pushl  0x8(%ebp)
c0104843:	e8 aa f3 ff ff       	call   c0103bf2 <scroll_up>
c0104848:	83 c4 10             	add    $0x10,%esp
c010484b:	c6 05 c4 06 11 c0 00 	movb   $0x0,0xc01106c4
c0104852:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c0104859:	eb 41                	jmp    c010489c <in_process+0x100>
c010485b:	83 ec 0c             	sub    $0xc,%esp
c010485e:	ff 75 08             	pushl  0x8(%ebp)
c0104861:	e8 ce f3 ff ff       	call   c0103c34 <scroll_down>
c0104866:	83 c4 10             	add    $0x10,%esp
c0104869:	c6 05 c4 06 11 c0 00 	movb   $0x0,0xc01106c4
c0104870:	c6 05 84 f7 10 c0 00 	movb   $0x0,0xc010f784
c0104877:	eb 23                	jmp    c010489c <in_process+0x100>
c0104879:	83 ec 08             	sub    $0x8,%esp
c010487c:	6a 0a                	push   $0xa
c010487e:	ff 75 08             	pushl  0x8(%ebp)
c0104881:	e8 19 f4 ff ff       	call   c0103c9f <out_char>
c0104886:	83 c4 10             	add    $0x10,%esp
c0104889:	eb 11                	jmp    c010489c <in_process+0x100>
c010488b:	83 ec 08             	sub    $0x8,%esp
c010488e:	6a 08                	push   $0x8
c0104890:	ff 75 08             	pushl  0x8(%ebp)
c0104893:	e8 07 f4 ff ff       	call   c0103c9f <out_char>
c0104898:	83 c4 10             	add    $0x10,%esp
c010489b:	90                   	nop
c010489c:	e9 8a 00 00 00       	jmp    c010492b <in_process+0x18f>
c01048a1:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c01048a8:	74 55                	je     c01048ff <in_process+0x163>
c01048aa:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c01048b1:	77 14                	ja     c01048c7 <in_process+0x12b>
c01048b3:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c01048ba:	74 31                	je     c01048ed <in_process+0x151>
c01048bc:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c01048c3:	74 16                	je     c01048db <in_process+0x13f>
c01048c5:	eb 64                	jmp    c010492b <in_process+0x18f>
c01048c7:	81 7d 0c 41 01 00 00 	cmpl   $0x141,0xc(%ebp)
c01048ce:	74 3e                	je     c010490e <in_process+0x172>
c01048d0:	81 7d 0c 42 01 00 00 	cmpl   $0x142,0xc(%ebp)
c01048d7:	74 44                	je     c010491d <in_process+0x181>
c01048d9:	eb 50                	jmp    c010492b <in_process+0x18f>
c01048db:	83 ec 08             	sub    $0x8,%esp
c01048de:	6a 0a                	push   $0xa
c01048e0:	ff 75 08             	pushl  0x8(%ebp)
c01048e3:	e8 9e f2 ff ff       	call   c0103b86 <put_key>
c01048e8:	83 c4 10             	add    $0x10,%esp
c01048eb:	eb 3e                	jmp    c010492b <in_process+0x18f>
c01048ed:	83 ec 08             	sub    $0x8,%esp
c01048f0:	6a 08                	push   $0x8
c01048f2:	ff 75 08             	pushl  0x8(%ebp)
c01048f5:	e8 8c f2 ff ff       	call   c0103b86 <put_key>
c01048fa:	83 c4 10             	add    $0x10,%esp
c01048fd:	eb 2c                	jmp    c010492b <in_process+0x18f>
c01048ff:	83 ec 0c             	sub    $0xc,%esp
c0104902:	6a 00                	push   $0x0
c0104904:	e8 4c f1 ff ff       	call   c0103a55 <select_console>
c0104909:	83 c4 10             	add    $0x10,%esp
c010490c:	eb 1d                	jmp    c010492b <in_process+0x18f>
c010490e:	83 ec 0c             	sub    $0xc,%esp
c0104911:	6a 01                	push   $0x1
c0104913:	e8 3d f1 ff ff       	call   c0103a55 <select_console>
c0104918:	83 c4 10             	add    $0x10,%esp
c010491b:	eb 0e                	jmp    c010492b <in_process+0x18f>
c010491d:	83 ec 0c             	sub    $0xc,%esp
c0104920:	6a 02                	push   $0x2
c0104922:	e8 2e f1 ff ff       	call   c0103a55 <select_console>
c0104927:	83 c4 10             	add    $0x10,%esp
c010492a:	90                   	nop
c010492b:	90                   	nop
c010492c:	c9                   	leave  
c010492d:	c3                   	ret    

c010492e <open>:
c010492e:	55                   	push   %ebp
c010492f:	89 e5                	mov    %esp,%ebp
c0104931:	83 ec 18             	sub    $0x18,%esp
c0104934:	83 ec 0c             	sub    $0xc,%esp
c0104937:	6a 7c                	push   $0x7c
c0104939:	e8 3e cb ff ff       	call   c010147c <sys_malloc>
c010493e:	83 c4 10             	add    $0x10,%esp
c0104941:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104944:	83 ec 04             	sub    $0x4,%esp
c0104947:	6a 7c                	push   $0x7c
c0104949:	6a 00                	push   $0x0
c010494b:	ff 75 f4             	pushl  -0xc(%ebp)
c010494e:	e8 cc 62 00 00       	call   c010ac1f <Memset>
c0104953:	83 c4 10             	add    $0x10,%esp
c0104956:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104959:	c7 40 78 06 00 00 00 	movl   $0x6,0x78(%eax)
c0104960:	83 ec 0c             	sub    $0xc,%esp
c0104963:	ff 75 08             	pushl  0x8(%ebp)
c0104966:	e8 43 14 00 00       	call   c0105dae <get_physical_address>
c010496b:	83 c4 10             	add    $0x10,%esp
c010496e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104971:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104974:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104977:	89 50 44             	mov    %edx,0x44(%eax)
c010497a:	8b 55 0c             	mov    0xc(%ebp),%edx
c010497d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104980:	89 50 74             	mov    %edx,0x74(%eax)
c0104983:	83 ec 0c             	sub    $0xc,%esp
c0104986:	ff 75 08             	pushl  0x8(%ebp)
c0104989:	e8 ca 62 00 00       	call   c010ac58 <Strlen>
c010498e:	83 c4 10             	add    $0x10,%esp
c0104991:	89 c2                	mov    %eax,%edx
c0104993:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104996:	89 50 40             	mov    %edx,0x40(%eax)
c0104999:	83 ec 04             	sub    $0x4,%esp
c010499c:	6a 02                	push   $0x2
c010499e:	ff 75 f4             	pushl  -0xc(%ebp)
c01049a1:	6a 03                	push   $0x3
c01049a3:	e8 cc 44 00 00       	call   c0108e74 <send_rec>
c01049a8:	83 c4 10             	add    $0x10,%esp
c01049ab:	83 ec 08             	sub    $0x8,%esp
c01049ae:	6a 7c                	push   $0x7c
c01049b0:	ff 75 f4             	pushl  -0xc(%ebp)
c01049b3:	e8 d9 ca ff ff       	call   c0101491 <sys_free>
c01049b8:	83 c4 10             	add    $0x10,%esp
c01049bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01049be:	8b 40 50             	mov    0x50(%eax),%eax
c01049c1:	c9                   	leave  
c01049c2:	c3                   	ret    

c01049c3 <read>:
c01049c3:	55                   	push   %ebp
c01049c4:	89 e5                	mov    %esp,%ebp
c01049c6:	83 ec 38             	sub    $0x38,%esp
c01049c9:	c7 45 dc 7c 00 00 00 	movl   $0x7c,-0x24(%ebp)
c01049d0:	83 ec 0c             	sub    $0xc,%esp
c01049d3:	ff 75 dc             	pushl  -0x24(%ebp)
c01049d6:	e8 a1 ca ff ff       	call   c010147c <sys_malloc>
c01049db:	83 c4 10             	add    $0x10,%esp
c01049de:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01049e1:	8b 45 0c             	mov    0xc(%ebp),%eax
c01049e4:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c01049e9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01049ec:	83 ec 0c             	sub    $0xc,%esp
c01049ef:	ff 75 0c             	pushl  0xc(%ebp)
c01049f2:	e8 b7 13 00 00       	call   c0105dae <get_physical_address>
c01049f7:	83 c4 10             	add    $0x10,%esp
c01049fa:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01049fd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104a00:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0104a05:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0104a08:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104a0b:	05 ff 0f 00 00       	add    $0xfff,%eax
c0104a10:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0104a13:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0104a1a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0104a21:	8b 55 10             	mov    0x10(%ebp),%edx
c0104a24:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104a27:	01 d0                	add    %edx,%eax
c0104a29:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
c0104a2c:	0f 83 a8 00 00 00    	jae    c0104ada <read+0x117>
c0104a32:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104a35:	2b 45 f0             	sub    -0x10(%ebp),%eax
c0104a38:	05 00 10 00 00       	add    $0x1000,%eax
c0104a3d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0104a40:	8b 45 10             	mov    0x10(%ebp),%eax
c0104a43:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0104a46:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104a49:	83 ec 04             	sub    $0x4,%esp
c0104a4c:	50                   	push   %eax
c0104a4d:	6a 00                	push   $0x0
c0104a4f:	ff 75 d8             	pushl  -0x28(%ebp)
c0104a52:	e8 c8 61 00 00       	call   c010ac1f <Memset>
c0104a57:	83 c4 10             	add    $0x10,%esp
c0104a5a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104a5d:	c7 40 78 07 00 00 00 	movl   $0x7,0x78(%eax)
c0104a64:	8b 55 08             	mov    0x8(%ebp),%edx
c0104a67:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104a6a:	89 50 50             	mov    %edx,0x50(%eax)
c0104a6d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104a70:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104a73:	89 50 10             	mov    %edx,0x10(%eax)
c0104a76:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104a79:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0104a7c:	89 50 60             	mov    %edx,0x60(%eax)
c0104a7f:	83 ec 04             	sub    $0x4,%esp
c0104a82:	6a 02                	push   $0x2
c0104a84:	ff 75 d8             	pushl  -0x28(%ebp)
c0104a87:	6a 03                	push   $0x3
c0104a89:	e8 e6 43 00 00       	call   c0108e74 <send_rec>
c0104a8e:	83 c4 10             	add    $0x10,%esp
c0104a91:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104a94:	8b 40 60             	mov    0x60(%eax),%eax
c0104a97:	01 45 e8             	add    %eax,-0x18(%ebp)
c0104a9a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0104a9d:	29 45 e0             	sub    %eax,-0x20(%ebp)
c0104aa0:	8b 45 10             	mov    0x10(%ebp),%eax
c0104aa3:	2b 45 e4             	sub    -0x1c(%ebp),%eax
c0104aa6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0104aa9:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0104aac:	89 45 10             	mov    %eax,0x10(%ebp)
c0104aaf:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
c0104ab6:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c0104abd:	83 ec 0c             	sub    $0xc,%esp
c0104ac0:	ff 75 f4             	pushl  -0xc(%ebp)
c0104ac3:	e8 e6 12 00 00       	call   c0105dae <get_physical_address>
c0104ac8:	83 c4 10             	add    $0x10,%esp
c0104acb:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104ace:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0104ad2:	0f 85 6e ff ff ff    	jne    c0104a46 <read+0x83>
c0104ad8:	eb 54                	jmp    c0104b2e <read+0x16b>
c0104ada:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104add:	83 ec 04             	sub    $0x4,%esp
c0104ae0:	50                   	push   %eax
c0104ae1:	6a 00                	push   $0x0
c0104ae3:	ff 75 d8             	pushl  -0x28(%ebp)
c0104ae6:	e8 34 61 00 00       	call   c010ac1f <Memset>
c0104aeb:	83 c4 10             	add    $0x10,%esp
c0104aee:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104af1:	c7 40 78 07 00 00 00 	movl   $0x7,0x78(%eax)
c0104af8:	8b 55 08             	mov    0x8(%ebp),%edx
c0104afb:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104afe:	89 50 50             	mov    %edx,0x50(%eax)
c0104b01:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104b04:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104b07:	89 50 10             	mov    %edx,0x10(%eax)
c0104b0a:	8b 55 10             	mov    0x10(%ebp),%edx
c0104b0d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104b10:	89 50 60             	mov    %edx,0x60(%eax)
c0104b13:	83 ec 04             	sub    $0x4,%esp
c0104b16:	6a 02                	push   $0x2
c0104b18:	ff 75 d8             	pushl  -0x28(%ebp)
c0104b1b:	6a 03                	push   $0x3
c0104b1d:	e8 52 43 00 00       	call   c0108e74 <send_rec>
c0104b22:	83 c4 10             	add    $0x10,%esp
c0104b25:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104b28:	8b 40 60             	mov    0x60(%eax),%eax
c0104b2b:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0104b2e:	83 ec 08             	sub    $0x8,%esp
c0104b31:	ff 75 dc             	pushl  -0x24(%ebp)
c0104b34:	ff 75 d8             	pushl  -0x28(%ebp)
c0104b37:	e8 55 c9 ff ff       	call   c0101491 <sys_free>
c0104b3c:	83 c4 10             	add    $0x10,%esp
c0104b3f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104b42:	c9                   	leave  
c0104b43:	c3                   	ret    

c0104b44 <write>:
c0104b44:	55                   	push   %ebp
c0104b45:	89 e5                	mov    %esp,%ebp
c0104b47:	83 ec 18             	sub    $0x18,%esp
c0104b4a:	c7 45 f4 7c 00 00 00 	movl   $0x7c,-0xc(%ebp)
c0104b51:	83 ec 0c             	sub    $0xc,%esp
c0104b54:	ff 75 f4             	pushl  -0xc(%ebp)
c0104b57:	e8 20 c9 ff ff       	call   c010147c <sys_malloc>
c0104b5c:	83 c4 10             	add    $0x10,%esp
c0104b5f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104b62:	83 ec 0c             	sub    $0xc,%esp
c0104b65:	ff 75 0c             	pushl  0xc(%ebp)
c0104b68:	e8 41 12 00 00       	call   c0105dae <get_physical_address>
c0104b6d:	83 c4 10             	add    $0x10,%esp
c0104b70:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0104b73:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104b76:	c7 40 78 0a 00 00 00 	movl   $0xa,0x78(%eax)
c0104b7d:	8b 55 08             	mov    0x8(%ebp),%edx
c0104b80:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104b83:	89 50 50             	mov    %edx,0x50(%eax)
c0104b86:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104b89:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0104b8c:	89 50 10             	mov    %edx,0x10(%eax)
c0104b8f:	8b 55 10             	mov    0x10(%ebp),%edx
c0104b92:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104b95:	89 50 60             	mov    %edx,0x60(%eax)
c0104b98:	83 ec 04             	sub    $0x4,%esp
c0104b9b:	6a 02                	push   $0x2
c0104b9d:	ff 75 f0             	pushl  -0x10(%ebp)
c0104ba0:	6a 03                	push   $0x3
c0104ba2:	e8 cd 42 00 00       	call   c0108e74 <send_rec>
c0104ba7:	83 c4 10             	add    $0x10,%esp
c0104baa:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104bad:	8b 40 60             	mov    0x60(%eax),%eax
c0104bb0:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0104bb3:	83 ec 08             	sub    $0x8,%esp
c0104bb6:	ff 75 f4             	pushl  -0xc(%ebp)
c0104bb9:	ff 75 f0             	pushl  -0x10(%ebp)
c0104bbc:	e8 d0 c8 ff ff       	call   c0101491 <sys_free>
c0104bc1:	83 c4 10             	add    $0x10,%esp
c0104bc4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104bc7:	c9                   	leave  
c0104bc8:	c3                   	ret    

c0104bc9 <close>:
c0104bc9:	55                   	push   %ebp
c0104bca:	89 e5                	mov    %esp,%ebp
c0104bcc:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104bd2:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0104bd9:	8b 45 08             	mov    0x8(%ebp),%eax
c0104bdc:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0104bdf:	83 ec 04             	sub    $0x4,%esp
c0104be2:	6a 02                	push   $0x2
c0104be4:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104bea:	50                   	push   %eax
c0104beb:	6a 03                	push   $0x3
c0104bed:	e8 82 42 00 00       	call   c0108e74 <send_rec>
c0104bf2:	83 c4 10             	add    $0x10,%esp
c0104bf5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104bf8:	83 f8 65             	cmp    $0x65,%eax
c0104bfb:	74 19                	je     c0104c16 <close+0x4d>
c0104bfd:	6a 13                	push   $0x13
c0104bff:	68 e3 a2 10 c0       	push   $0xc010a2e3
c0104c04:	68 e3 a2 10 c0       	push   $0xc010a2e3
c0104c09:	68 ef a2 10 c0       	push   $0xc010a2ef
c0104c0e:	e8 44 38 00 00       	call   c0108457 <assertion_failure>
c0104c13:	83 c4 10             	add    $0x10,%esp
c0104c16:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0104c19:	c9                   	leave  
c0104c1a:	c3                   	ret    

c0104c1b <wait>:
c0104c1b:	55                   	push   %ebp
c0104c1c:	89 e5                	mov    %esp,%ebp
c0104c1e:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104c24:	c7 45 f4 09 00 00 00 	movl   $0x9,-0xc(%ebp)
c0104c2b:	83 ec 04             	sub    $0x4,%esp
c0104c2e:	6a 01                	push   $0x1
c0104c30:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104c36:	50                   	push   %eax
c0104c37:	6a 03                	push   $0x3
c0104c39:	e8 36 42 00 00       	call   c0108e74 <send_rec>
c0104c3e:	83 c4 10             	add    $0x10,%esp
c0104c41:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0104c44:	89 c2                	mov    %eax,%edx
c0104c46:	8b 45 08             	mov    0x8(%ebp),%eax
c0104c49:	89 10                	mov    %edx,(%eax)
c0104c4b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104c4e:	83 f8 21             	cmp    $0x21,%eax
c0104c51:	74 05                	je     c0104c58 <wait+0x3d>
c0104c53:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104c56:	eb 05                	jmp    c0104c5d <wait+0x42>
c0104c58:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0104c5d:	c9                   	leave  
c0104c5e:	c3                   	ret    

c0104c5f <exit>:
c0104c5f:	55                   	push   %ebp
c0104c60:	89 e5                	mov    %esp,%ebp
c0104c62:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104c68:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
c0104c6f:	8b 45 08             	mov    0x8(%ebp),%eax
c0104c72:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0104c75:	83 ec 04             	sub    $0x4,%esp
c0104c78:	6a 01                	push   $0x1
c0104c7a:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104c80:	50                   	push   %eax
c0104c81:	6a 03                	push   $0x3
c0104c83:	e8 ec 41 00 00       	call   c0108e74 <send_rec>
c0104c88:	83 c4 10             	add    $0x10,%esp
c0104c8b:	90                   	nop
c0104c8c:	c9                   	leave  
c0104c8d:	c3                   	ret    

c0104c8e <fork>:
c0104c8e:	55                   	push   %ebp
c0104c8f:	89 e5                	mov    %esp,%ebp
c0104c91:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104c97:	83 ec 04             	sub    $0x4,%esp
c0104c9a:	6a 7c                	push   $0x7c
c0104c9c:	6a 00                	push   $0x0
c0104c9e:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104ca4:	50                   	push   %eax
c0104ca5:	e8 75 5f 00 00       	call   c010ac1f <Memset>
c0104caa:	83 c4 10             	add    $0x10,%esp
c0104cad:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
c0104cb4:	83 ec 04             	sub    $0x4,%esp
c0104cb7:	6a 01                	push   $0x1
c0104cb9:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104cbf:	50                   	push   %eax
c0104cc0:	6a 03                	push   $0x3
c0104cc2:	e8 ad 41 00 00       	call   c0108e74 <send_rec>
c0104cc7:	83 c4 10             	add    $0x10,%esp
c0104cca:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c0104cd1:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104cd4:	c9                   	leave  
c0104cd5:	c3                   	ret    

c0104cd6 <getpid>:
c0104cd6:	55                   	push   %ebp
c0104cd7:	89 e5                	mov    %esp,%ebp
c0104cd9:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104cdf:	c7 45 f4 05 00 00 00 	movl   $0x5,-0xc(%ebp)
c0104ce6:	83 ec 04             	sub    $0x4,%esp
c0104ce9:	6a 05                	push   $0x5
c0104ceb:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104cf1:	50                   	push   %eax
c0104cf2:	6a 03                	push   $0x3
c0104cf4:	e8 7b 41 00 00       	call   c0108e74 <send_rec>
c0104cf9:	83 c4 10             	add    $0x10,%esp
c0104cfc:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104cff:	c9                   	leave  
c0104d00:	c3                   	ret    

c0104d01 <exec>:
c0104d01:	55                   	push   %ebp
c0104d02:	89 e5                	mov    %esp,%ebp
c0104d04:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0104d0a:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0104d11:	8b 45 08             	mov    0x8(%ebp),%eax
c0104d14:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0104d17:	83 ec 0c             	sub    $0xc,%esp
c0104d1a:	ff 75 08             	pushl  0x8(%ebp)
c0104d1d:	e8 36 5f 00 00       	call   c010ac58 <Strlen>
c0104d22:	83 c4 10             	add    $0x10,%esp
c0104d25:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0104d28:	c7 45 8c 00 00 00 00 	movl   $0x0,-0x74(%ebp)
c0104d2f:	c7 45 98 00 00 00 00 	movl   $0x0,-0x68(%ebp)
c0104d36:	83 ec 04             	sub    $0x4,%esp
c0104d39:	6a 01                	push   $0x1
c0104d3b:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0104d41:	50                   	push   %eax
c0104d42:	6a 03                	push   $0x3
c0104d44:	e8 2b 41 00 00       	call   c0108e74 <send_rec>
c0104d49:	83 c4 10             	add    $0x10,%esp
c0104d4c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104d4f:	83 f8 65             	cmp    $0x65,%eax
c0104d52:	74 19                	je     c0104d6d <exec+0x6c>
c0104d54:	6a 19                	push   $0x19
c0104d56:	68 07 a3 10 c0       	push   $0xc010a307
c0104d5b:	68 07 a3 10 c0       	push   $0xc010a307
c0104d60:	68 12 a3 10 c0       	push   $0xc010a312
c0104d65:	e8 ed 36 00 00       	call   c0108457 <assertion_failure>
c0104d6a:	83 c4 10             	add    $0x10,%esp
c0104d6d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0104d70:	c9                   	leave  
c0104d71:	c3                   	ret    

c0104d72 <execv>:
c0104d72:	55                   	push   %ebp
c0104d73:	89 e5                	mov    %esp,%ebp
c0104d75:	81 ec b8 00 00 00    	sub    $0xb8,%esp
c0104d7b:	83 ec 0c             	sub    $0xc,%esp
c0104d7e:	68 00 04 00 00       	push   $0x400
c0104d83:	e8 f4 c6 ff ff       	call   c010147c <sys_malloc>
c0104d88:	83 c4 10             	add    $0x10,%esp
c0104d8b:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0104d8e:	83 ec 04             	sub    $0x4,%esp
c0104d91:	68 00 04 00 00       	push   $0x400
c0104d96:	6a 00                	push   $0x0
c0104d98:	ff 75 e0             	pushl  -0x20(%ebp)
c0104d9b:	e8 7f 5e 00 00       	call   c010ac1f <Memset>
c0104da0:	83 c4 10             	add    $0x10,%esp
c0104da3:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104da6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104da9:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0104db0:	eb 23                	jmp    c0104dd5 <execv+0x63>
c0104db2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104db5:	8b 00                	mov    (%eax),%eax
c0104db7:	83 ec 08             	sub    $0x8,%esp
c0104dba:	50                   	push   %eax
c0104dbb:	68 2a a3 10 c0       	push   $0xc010a32a
c0104dc0:	e8 35 33 00 00       	call   c01080fa <Printf>
c0104dc5:	83 c4 10             	add    $0x10,%esp
c0104dc8:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
c0104dcc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104dcf:	83 c0 04             	add    $0x4,%eax
c0104dd2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104dd5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104dd8:	8b 00                	mov    (%eax),%eax
c0104dda:	85 c0                	test   %eax,%eax
c0104ddc:	75 d4                	jne    c0104db2 <execv+0x40>
c0104dde:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104de1:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0104de4:	01 d0                	add    %edx,%eax
c0104de6:	c6 00 00             	movb   $0x0,(%eax)
c0104de9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104dec:	83 c0 04             	add    $0x4,%eax
c0104def:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104df2:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0104df5:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0104df8:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104dfb:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0104dfe:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0104e05:	eb 5b                	jmp    c0104e62 <execv+0xf0>
c0104e07:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104e0a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0104e0d:	01 c2                	add    %eax,%edx
c0104e0f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104e12:	89 10                	mov    %edx,(%eax)
c0104e14:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104e17:	8b 00                	mov    (%eax),%eax
c0104e19:	8b 4d f0             	mov    -0x10(%ebp),%ecx
c0104e1c:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0104e1f:	01 ca                	add    %ecx,%edx
c0104e21:	83 ec 08             	sub    $0x8,%esp
c0104e24:	50                   	push   %eax
c0104e25:	52                   	push   %edx
c0104e26:	e8 13 5e 00 00       	call   c010ac3e <Strcpy>
c0104e2b:	83 c4 10             	add    $0x10,%esp
c0104e2e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104e31:	8b 00                	mov    (%eax),%eax
c0104e33:	83 ec 0c             	sub    $0xc,%esp
c0104e36:	50                   	push   %eax
c0104e37:	e8 1c 5e 00 00       	call   c010ac58 <Strlen>
c0104e3c:	83 c4 10             	add    $0x10,%esp
c0104e3f:	01 45 f0             	add    %eax,-0x10(%ebp)
c0104e42:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0104e45:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0104e48:	01 d0                	add    %edx,%eax
c0104e4a:	c6 00 00             	movb   $0x0,(%eax)
c0104e4d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104e50:	83 c0 01             	add    $0x1,%eax
c0104e53:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104e56:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
c0104e5a:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c0104e5e:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0104e62:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0104e65:	8b 00                	mov    (%eax),%eax
c0104e67:	85 c0                	test   %eax,%eax
c0104e69:	75 9c                	jne    c0104e07 <execv+0x95>
c0104e6b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104e6e:	ba 00 00 00 c0       	mov    $0xc0000000,%edx
c0104e73:	29 c2                	sub    %eax,%edx
c0104e75:	89 d0                	mov    %edx,%eax
c0104e77:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0104e7a:	83 ec 0c             	sub    $0xc,%esp
c0104e7d:	ff 75 08             	pushl  0x8(%ebp)
c0104e80:	e8 29 0f 00 00       	call   c0105dae <get_physical_address>
c0104e85:	83 c4 10             	add    $0x10,%esp
c0104e88:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0104e8b:	83 ec 0c             	sub    $0xc,%esp
c0104e8e:	ff 75 e0             	pushl  -0x20(%ebp)
c0104e91:	e8 18 0f 00 00       	call   c0105dae <get_physical_address>
c0104e96:	83 c4 10             	add    $0x10,%esp
c0104e99:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0104e9c:	83 ec 0c             	sub    $0xc,%esp
c0104e9f:	ff 75 dc             	pushl  -0x24(%ebp)
c0104ea2:	e8 07 0f 00 00       	call   c0105dae <get_physical_address>
c0104ea7:	83 c4 10             	add    $0x10,%esp
c0104eaa:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0104ead:	c7 45 cc 02 00 00 00 	movl   $0x2,-0x34(%ebp)
c0104eb4:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0104eb7:	89 45 98             	mov    %eax,-0x68(%ebp)
c0104eba:	83 ec 0c             	sub    $0xc,%esp
c0104ebd:	ff 75 08             	pushl  0x8(%ebp)
c0104ec0:	e8 93 5d 00 00       	call   c010ac58 <Strlen>
c0104ec5:	83 c4 10             	add    $0x10,%esp
c0104ec8:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0104ecb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0104ece:	89 85 64 ff ff ff    	mov    %eax,-0x9c(%ebp)
c0104ed4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104ed7:	89 85 70 ff ff ff    	mov    %eax,-0x90(%ebp)
c0104edd:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0104ee0:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
c0104ee6:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0104ee9:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0104eef:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0104ef2:	89 85 7c ff ff ff    	mov    %eax,-0x84(%ebp)
c0104ef8:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0104efb:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0104efe:	29 c2                	sub    %eax,%edx
c0104f00:	89 d0                	mov    %edx,%eax
c0104f02:	89 45 80             	mov    %eax,-0x80(%ebp)
c0104f05:	83 ec 04             	sub    $0x4,%esp
c0104f08:	6a 01                	push   $0x1
c0104f0a:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
c0104f10:	50                   	push   %eax
c0104f11:	6a 03                	push   $0x3
c0104f13:	e8 5c 3f 00 00       	call   c0108e74 <send_rec>
c0104f18:	83 c4 10             	add    $0x10,%esp
c0104f1b:	83 ec 08             	sub    $0x8,%esp
c0104f1e:	68 00 04 00 00       	push   $0x400
c0104f23:	ff 75 e0             	pushl  -0x20(%ebp)
c0104f26:	e8 66 c5 ff ff       	call   c0101491 <sys_free>
c0104f2b:	83 c4 10             	add    $0x10,%esp
c0104f2e:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0104f31:	83 f8 65             	cmp    $0x65,%eax
c0104f34:	74 1c                	je     c0104f52 <execv+0x1e0>
c0104f36:	68 93 00 00 00       	push   $0x93
c0104f3b:	68 07 a3 10 c0       	push   $0xc010a307
c0104f40:	68 07 a3 10 c0       	push   $0xc010a307
c0104f45:	68 12 a3 10 c0       	push   $0xc010a312
c0104f4a:	e8 08 35 00 00       	call   c0108457 <assertion_failure>
c0104f4f:	83 c4 10             	add    $0x10,%esp
c0104f52:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0104f55:	c9                   	leave  
c0104f56:	c3                   	ret    

c0104f57 <execl>:
c0104f57:	55                   	push   %ebp
c0104f58:	89 e5                	mov    %esp,%ebp
c0104f5a:	83 ec 18             	sub    $0x18,%esp
c0104f5d:	8d 45 0c             	lea    0xc(%ebp),%eax
c0104f60:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0104f63:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104f66:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104f69:	83 ec 08             	sub    $0x8,%esp
c0104f6c:	ff 75 f0             	pushl  -0x10(%ebp)
c0104f6f:	ff 75 08             	pushl  0x8(%ebp)
c0104f72:	e8 fb fd ff ff       	call   c0104d72 <execv>
c0104f77:	83 c4 10             	add    $0x10,%esp
c0104f7a:	c9                   	leave  
c0104f7b:	c3                   	ret    

c0104f7c <TaskMM>:
c0104f7c:	55                   	push   %ebp
c0104f7d:	89 e5                	mov    %esp,%ebp
c0104f7f:	83 ec 28             	sub    $0x28,%esp
c0104f82:	83 ec 0c             	sub    $0xc,%esp
c0104f85:	6a 7c                	push   $0x7c
c0104f87:	e8 f0 c4 ff ff       	call   c010147c <sys_malloc>
c0104f8c:	83 c4 10             	add    $0x10,%esp
c0104f8f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0104f92:	83 ec 0c             	sub    $0xc,%esp
c0104f95:	6a 7c                	push   $0x7c
c0104f97:	e8 e0 c4 ff ff       	call   c010147c <sys_malloc>
c0104f9c:	83 c4 10             	add    $0x10,%esp
c0104f9f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0104fa2:	83 ec 04             	sub    $0x4,%esp
c0104fa5:	6a 12                	push   $0x12
c0104fa7:	ff 75 f0             	pushl  -0x10(%ebp)
c0104faa:	6a 02                	push   $0x2
c0104fac:	e8 c3 3e 00 00       	call   c0108e74 <send_rec>
c0104fb1:	83 c4 10             	add    $0x10,%esp
c0104fb4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104fb7:	8b 40 78             	mov    0x78(%eax),%eax
c0104fba:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0104fbd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0104fc0:	8b 00                	mov    (%eax),%eax
c0104fc2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0104fc5:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0104fcc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104fcf:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0104fd6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0104fd9:	c7 40 58 00 00 00 00 	movl   $0x0,0x58(%eax)
c0104fe0:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c0104fe4:	74 4e                	je     c0105034 <TaskMM+0xb8>
c0104fe6:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c0104fea:	7f 08                	jg     c0104ff4 <TaskMM+0x78>
c0104fec:	83 7d e8 02          	cmpl   $0x2,-0x18(%ebp)
c0104ff0:	74 28                	je     c010501a <TaskMM+0x9e>
c0104ff2:	eb 71                	jmp    c0105065 <TaskMM+0xe9>
c0104ff4:	83 7d e8 04          	cmpl   $0x4,-0x18(%ebp)
c0104ff8:	74 08                	je     c0105002 <TaskMM+0x86>
c0104ffa:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c0104ffe:	74 4e                	je     c010504e <TaskMM+0xd2>
c0105000:	eb 63                	jmp    c0105065 <TaskMM+0xe9>
c0105002:	83 ec 0c             	sub    $0xc,%esp
c0105005:	ff 75 f0             	pushl  -0x10(%ebp)
c0105008:	e8 d0 04 00 00       	call   c01054dd <do_fork>
c010500d:	83 c4 10             	add    $0x10,%esp
c0105010:	89 c2                	mov    %eax,%edx
c0105012:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105015:	89 50 5c             	mov    %edx,0x5c(%eax)
c0105018:	eb 5c                	jmp    c0105076 <TaskMM+0xfa>
c010501a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0105021:	66 87 db             	xchg   %bx,%bx
c0105024:	83 ec 0c             	sub    $0xc,%esp
c0105027:	ff 75 f0             	pushl  -0x10(%ebp)
c010502a:	e8 95 00 00 00       	call   c01050c4 <do_exec>
c010502f:	83 c4 10             	add    $0x10,%esp
c0105032:	eb 42                	jmp    c0105076 <TaskMM+0xfa>
c0105034:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010503b:	83 ec 08             	sub    $0x8,%esp
c010503e:	ff 75 e0             	pushl  -0x20(%ebp)
c0105041:	ff 75 f0             	pushl  -0x10(%ebp)
c0105044:	e8 02 05 00 00       	call   c010554b <do_exit>
c0105049:	83 c4 10             	add    $0x10,%esp
c010504c:	eb 28                	jmp    c0105076 <TaskMM+0xfa>
c010504e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0105055:	83 ec 0c             	sub    $0xc,%esp
c0105058:	ff 75 f0             	pushl  -0x10(%ebp)
c010505b:	e8 e7 05 00 00       	call   c0105647 <do_wait>
c0105060:	83 c4 10             	add    $0x10,%esp
c0105063:	eb 11                	jmp    c0105076 <TaskMM+0xfa>
c0105065:	83 ec 0c             	sub    $0xc,%esp
c0105068:	68 34 a3 10 c0       	push   $0xc010a334
c010506d:	e8 c7 33 00 00       	call   c0108439 <panic>
c0105072:	83 c4 10             	add    $0x10,%esp
c0105075:	90                   	nop
c0105076:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010507a:	0f 84 22 ff ff ff    	je     c0104fa2 <TaskMM+0x26>
c0105080:	83 ec 0c             	sub    $0xc,%esp
c0105083:	6a 03                	push   $0x3
c0105085:	e8 3c 2f 00 00       	call   c0107fc6 <delay>
c010508a:	83 c4 10             	add    $0x10,%esp
c010508d:	83 ec 04             	sub    $0x4,%esp
c0105090:	ff 75 e4             	pushl  -0x1c(%ebp)
c0105093:	ff 75 ec             	pushl  -0x14(%ebp)
c0105096:	6a 01                	push   $0x1
c0105098:	e8 d7 3d 00 00       	call   c0108e74 <send_rec>
c010509d:	83 c4 10             	add    $0x10,%esp
c01050a0:	e9 fd fe ff ff       	jmp    c0104fa2 <TaskMM+0x26>

c01050a5 <alloc_mem>:
c01050a5:	55                   	push   %ebp
c01050a6:	89 e5                	mov    %esp,%ebp
c01050a8:	83 ec 10             	sub    $0x10,%esp
c01050ab:	8b 45 08             	mov    0x8(%ebp),%eax
c01050ae:	83 e8 08             	sub    $0x8,%eax
c01050b1:	69 c0 00 10 10 00    	imul   $0x101000,%eax,%eax
c01050b7:	05 00 00 a0 00       	add    $0xa00000,%eax
c01050bc:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01050bf:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01050c2:	c9                   	leave  
c01050c3:	c3                   	ret    

c01050c4 <do_exec>:
c01050c4:	55                   	push   %ebp
c01050c5:	89 e5                	mov    %esp,%ebp
c01050c7:	81 ec 38 01 00 00    	sub    $0x138,%esp
c01050cd:	c7 85 56 ff ff ff 64 	movl   $0x5f766564,-0xaa(%ebp)
c01050d4:	65 76 5f 
c01050d7:	c7 85 5a ff ff ff 74 	movl   $0x31797474,-0xa6(%ebp)
c01050de:	74 79 31 
c01050e1:	66 c7 85 5e ff ff ff 	movw   $0x0,-0xa2(%ebp)
c01050e8:	00 00 
c01050ea:	83 ec 08             	sub    $0x8,%esp
c01050ed:	6a 00                	push   $0x0
c01050ef:	8d 85 56 ff ff ff    	lea    -0xaa(%ebp),%eax
c01050f5:	50                   	push   %eax
c01050f6:	e8 33 f8 ff ff       	call   c010492e <open>
c01050fb:	83 c4 10             	add    $0x10,%esp
c01050fe:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105101:	8b 45 08             	mov    0x8(%ebp),%eax
c0105104:	8b 00                	mov    (%eax),%eax
c0105106:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0105109:	c7 45 d0 00 40 03 00 	movl   $0x34000,-0x30(%ebp)
c0105110:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0105113:	83 ec 0c             	sub    $0xc,%esp
c0105116:	50                   	push   %eax
c0105117:	e8 60 c3 ff ff       	call   c010147c <sys_malloc>
c010511c:	83 c4 10             	add    $0x10,%esp
c010511f:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0105122:	83 ec 04             	sub    $0x4,%esp
c0105125:	ff 75 d0             	pushl  -0x30(%ebp)
c0105128:	6a 00                	push   $0x0
c010512a:	ff 75 cc             	pushl  -0x34(%ebp)
c010512d:	e8 ed 5a 00 00       	call   c010ac1f <Memset>
c0105132:	83 c4 10             	add    $0x10,%esp
c0105135:	83 ec 04             	sub    $0x4,%esp
c0105138:	6a 0c                	push   $0xc
c010513a:	6a 00                	push   $0x0
c010513c:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c0105142:	50                   	push   %eax
c0105143:	e8 d7 5a 00 00       	call   c010ac1f <Memset>
c0105148:	83 c4 10             	add    $0x10,%esp
c010514b:	8b 45 08             	mov    0x8(%ebp),%eax
c010514e:	8b 40 44             	mov    0x44(%eax),%eax
c0105151:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0105154:	8b 45 08             	mov    0x8(%ebp),%eax
c0105157:	8b 40 40             	mov    0x40(%eax),%eax
c010515a:	83 ec 08             	sub    $0x8,%esp
c010515d:	50                   	push   %eax
c010515e:	ff 75 c8             	pushl  -0x38(%ebp)
c0105161:	e8 fe 0a 00 00       	call   c0105c64 <alloc_virtual_memory>
c0105166:	83 c4 10             	add    $0x10,%esp
c0105169:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c010516c:	8b 45 08             	mov    0x8(%ebp),%eax
c010516f:	8b 40 40             	mov    0x40(%eax),%eax
c0105172:	89 c2                	mov    %eax,%edx
c0105174:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0105177:	83 ec 04             	sub    $0x4,%esp
c010517a:	52                   	push   %edx
c010517b:	50                   	push   %eax
c010517c:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c0105182:	50                   	push   %eax
c0105183:	e8 f6 18 00 00       	call   c0106a7e <Memcpy>
c0105188:	83 c4 10             	add    $0x10,%esp
c010518b:	8b 45 08             	mov    0x8(%ebp),%eax
c010518e:	8b 40 40             	mov    0x40(%eax),%eax
c0105191:	c6 84 05 4a ff ff ff 	movb   $0x0,-0xb6(%ebp,%eax,1)
c0105198:	00 
c0105199:	83 ec 08             	sub    $0x8,%esp
c010519c:	6a 00                	push   $0x0
c010519e:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c01051a4:	50                   	push   %eax
c01051a5:	e8 84 f7 ff ff       	call   c010492e <open>
c01051aa:	83 c4 10             	add    $0x10,%esp
c01051ad:	89 45 c0             	mov    %eax,-0x40(%ebp)
c01051b0:	83 7d c0 ff          	cmpl   $0xffffffff,-0x40(%ebp)
c01051b4:	75 15                	jne    c01051cb <do_exec+0x107>
c01051b6:	83 ec 0c             	sub    $0xc,%esp
c01051b9:	68 45 a3 10 c0       	push   $0xc010a345
c01051be:	e8 37 2f 00 00       	call   c01080fa <Printf>
c01051c3:	83 c4 10             	add    $0x10,%esp
c01051c6:	e9 10 03 00 00       	jmp    c01054db <do_exec+0x417>
c01051cb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01051d2:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01051d5:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01051d8:	01 d0                	add    %edx,%eax
c01051da:	83 ec 04             	sub    $0x4,%esp
c01051dd:	68 00 10 00 00       	push   $0x1000
c01051e2:	50                   	push   %eax
c01051e3:	ff 75 c0             	pushl  -0x40(%ebp)
c01051e6:	e8 d8 f7 ff ff       	call   c01049c3 <read>
c01051eb:	83 c4 10             	add    $0x10,%esp
c01051ee:	89 45 bc             	mov    %eax,-0x44(%ebp)
c01051f1:	8b 45 bc             	mov    -0x44(%ebp),%eax
c01051f4:	01 45 f4             	add    %eax,-0xc(%ebp)
c01051f7:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
c01051fb:	74 0a                	je     c0105207 <do_exec+0x143>
c01051fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105200:	3b 45 d0             	cmp    -0x30(%ebp),%eax
c0105203:	7d 05                	jge    c010520a <do_exec+0x146>
c0105205:	eb cb                	jmp    c01051d2 <do_exec+0x10e>
c0105207:	90                   	nop
c0105208:	eb 01                	jmp    c010520b <do_exec+0x147>
c010520a:	90                   	nop
c010520b:	83 ec 0c             	sub    $0xc,%esp
c010520e:	ff 75 c0             	pushl  -0x40(%ebp)
c0105211:	e8 b3 f9 ff ff       	call   c0104bc9 <close>
c0105216:	83 c4 10             	add    $0x10,%esp
c0105219:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010521c:	89 45 b8             	mov    %eax,-0x48(%ebp)
c010521f:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0105222:	8b 40 18             	mov    0x18(%eax),%eax
c0105225:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0105228:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c010522f:	e9 04 01 00 00       	jmp    c0105338 <do_exec+0x274>
c0105234:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0105237:	0f b7 40 28          	movzwl 0x28(%eax),%eax
c010523b:	0f b7 d0             	movzwl %ax,%edx
c010523e:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0105241:	0f b7 40 2a          	movzwl 0x2a(%eax),%eax
c0105245:	0f b7 c0             	movzwl %ax,%eax
c0105248:	0f af 45 f0          	imul   -0x10(%ebp),%eax
c010524c:	01 c2                	add    %eax,%edx
c010524e:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0105251:	01 d0                	add    %edx,%eax
c0105253:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0105256:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0105259:	8b 40 10             	mov    0x10(%eax),%eax
c010525c:	89 45 ac             	mov    %eax,-0x54(%ebp)
c010525f:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0105262:	05 ff 0f 00 00       	add    $0xfff,%eax
c0105267:	c1 e8 0c             	shr    $0xc,%eax
c010526a:	89 45 a8             	mov    %eax,-0x58(%ebp)
c010526d:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0105270:	8b 40 08             	mov    0x8(%eax),%eax
c0105273:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0105276:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c010527d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0105280:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c0105283:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0105286:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0105289:	8b 50 04             	mov    0x4(%eax),%edx
c010528c:	8b 45 a0             	mov    -0x60(%ebp),%eax
c010528f:	01 d0                	add    %edx,%eax
c0105291:	89 45 9c             	mov    %eax,-0x64(%ebp)
c0105294:	83 7d ac 00          	cmpl   $0x0,-0x54(%ebp)
c0105298:	0f 84 95 00 00 00    	je     c0105333 <do_exec+0x26f>
c010529e:	83 ec 04             	sub    $0x4,%esp
c01052a1:	ff 75 d4             	pushl  -0x2c(%ebp)
c01052a4:	ff 75 a8             	pushl  -0x58(%ebp)
c01052a7:	ff 75 a4             	pushl  -0x5c(%ebp)
c01052aa:	e8 c0 07 00 00       	call   c0105a6f <get_virtual_address_start_with_addr>
c01052af:	83 c4 10             	add    $0x10,%esp
c01052b2:	89 45 98             	mov    %eax,-0x68(%ebp)
c01052b5:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c01052b8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01052bb:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01052c2:	eb 41                	jmp    c0105305 <do_exec+0x241>
c01052c4:	83 ec 08             	sub    $0x8,%esp
c01052c7:	ff 75 d4             	pushl  -0x2c(%ebp)
c01052ca:	ff 75 e8             	pushl  -0x18(%ebp)
c01052cd:	e8 0e 0b 00 00       	call   c0105de0 <alloc_physical_memory_of_proc>
c01052d2:	83 c4 10             	add    $0x10,%esp
c01052d5:	89 45 94             	mov    %eax,-0x6c(%ebp)
c01052d8:	83 ec 08             	sub    $0x8,%esp
c01052db:	68 00 10 00 00       	push   $0x1000
c01052e0:	ff 75 94             	pushl  -0x6c(%ebp)
c01052e3:	e8 7c 09 00 00       	call   c0105c64 <alloc_virtual_memory>
c01052e8:	83 c4 10             	add    $0x10,%esp
c01052eb:	89 45 90             	mov    %eax,-0x70(%ebp)
c01052ee:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c01052f2:	75 06                	jne    c01052fa <do_exec+0x236>
c01052f4:	8b 45 90             	mov    -0x70(%ebp),%eax
c01052f7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01052fa:	81 45 e8 00 10 00 00 	addl   $0x1000,-0x18(%ebp)
c0105301:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0105305:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105308:	39 45 a8             	cmp    %eax,-0x58(%ebp)
c010530b:	77 b7                	ja     c01052c4 <do_exec+0x200>
c010530d:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0105310:	8b 40 10             	mov    0x10(%eax),%eax
c0105313:	89 c1                	mov    %eax,%ecx
c0105315:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0105318:	8b 50 04             	mov    0x4(%eax),%edx
c010531b:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010531e:	01 c2                	add    %eax,%edx
c0105320:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105323:	83 ec 04             	sub    $0x4,%esp
c0105326:	51                   	push   %ecx
c0105327:	52                   	push   %edx
c0105328:	50                   	push   %eax
c0105329:	e8 50 17 00 00       	call   c0106a7e <Memcpy>
c010532e:	83 c4 10             	add    $0x10,%esp
c0105331:	eb 01                	jmp    c0105334 <do_exec+0x270>
c0105333:	90                   	nop
c0105334:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0105338:	8b 45 b8             	mov    -0x48(%ebp),%eax
c010533b:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
c010533f:	0f b7 c0             	movzwl %ax,%eax
c0105342:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0105345:	0f 8c e9 fe ff ff    	jl     c0105234 <do_exec+0x170>
c010534b:	8b 45 08             	mov    0x8(%ebp),%eax
c010534e:	8b 40 10             	mov    0x10(%eax),%eax
c0105351:	89 45 8c             	mov    %eax,-0x74(%ebp)
c0105354:	8b 45 08             	mov    0x8(%ebp),%eax
c0105357:	8b 40 1c             	mov    0x1c(%eax),%eax
c010535a:	89 45 88             	mov    %eax,-0x78(%ebp)
c010535d:	8b 45 08             	mov    0x8(%ebp),%eax
c0105360:	8b 40 24             	mov    0x24(%eax),%eax
c0105363:	89 45 84             	mov    %eax,-0x7c(%ebp)
c0105366:	83 ec 0c             	sub    $0xc,%esp
c0105369:	ff 75 d4             	pushl  -0x2c(%ebp)
c010536c:	e8 bb e2 ff ff       	call   c010362c <pid2proc>
c0105371:	83 c4 10             	add    $0x10,%esp
c0105374:	89 45 80             	mov    %eax,-0x80(%ebp)
c0105377:	8b 45 08             	mov    0x8(%ebp),%eax
c010537a:	8b 40 10             	mov    0x10(%eax),%eax
c010537d:	89 85 7c ff ff ff    	mov    %eax,-0x84(%ebp)
c0105383:	83 ec 08             	sub    $0x8,%esp
c0105386:	ff 75 88             	pushl  -0x78(%ebp)
c0105389:	ff b5 7c ff ff ff    	pushl  -0x84(%ebp)
c010538f:	e8 d0 08 00 00       	call   c0105c64 <alloc_virtual_memory>
c0105394:	83 c4 10             	add    $0x10,%esp
c0105397:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c010539d:	8b 45 08             	mov    0x8(%ebp),%eax
c01053a0:	8b 40 2c             	mov    0x2c(%eax),%eax
c01053a3:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
c01053a9:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c01053b0:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c01053b6:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01053b9:	eb 1a                	jmp    c01053d5 <do_exec+0x311>
c01053bb:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c01053bf:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01053c2:	8b 10                	mov    (%eax),%edx
c01053c4:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c01053ca:	01 c2                	add    %eax,%edx
c01053cc:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01053cf:	89 10                	mov    %edx,(%eax)
c01053d1:	83 45 dc 04          	addl   $0x4,-0x24(%ebp)
c01053d5:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01053d8:	8b 00                	mov    (%eax),%eax
c01053da:	85 c0                	test   %eax,%eax
c01053dc:	75 dd                	jne    c01053bb <do_exec+0x2f7>
c01053de:	83 ec 0c             	sub    $0xc,%esp
c01053e1:	ff 75 84             	pushl  -0x7c(%ebp)
c01053e4:	e8 7b 08 00 00       	call   c0105c64 <alloc_virtual_memory>
c01053e9:	83 c4 10             	add    $0x10,%esp
c01053ec:	89 85 70 ff ff ff    	mov    %eax,-0x90(%ebp)
c01053f2:	8b 95 78 ff ff ff    	mov    -0x88(%ebp),%edx
c01053f8:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
c01053fe:	83 ec 04             	sub    $0x4,%esp
c0105401:	ff 75 88             	pushl  -0x78(%ebp)
c0105404:	52                   	push   %edx
c0105405:	50                   	push   %eax
c0105406:	e8 73 16 00 00       	call   c0106a7e <Memcpy>
c010540b:	83 c4 10             	add    $0x10,%esp
c010540e:	8b 45 08             	mov    0x8(%ebp),%eax
c0105411:	8b 40 28             	mov    0x28(%eax),%eax
c0105414:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c010541a:	83 ec 08             	sub    $0x8,%esp
c010541d:	ff 75 d4             	pushl  -0x2c(%ebp)
c0105420:	ff 75 80             	pushl  -0x80(%ebp)
c0105423:	e8 0a 09 00 00       	call   c0105d32 <get_physical_address_proc>
c0105428:	83 c4 10             	add    $0x10,%esp
c010542b:	89 85 68 ff ff ff    	mov    %eax,-0x98(%ebp)
c0105431:	83 ec 08             	sub    $0x8,%esp
c0105434:	68 00 10 00 00       	push   $0x1000
c0105439:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
c010543f:	e8 20 08 00 00       	call   c0105c64 <alloc_virtual_memory>
c0105444:	83 c4 10             	add    $0x10,%esp
c0105447:	89 85 64 ff ff ff    	mov    %eax,-0x9c(%ebp)
c010544d:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
c0105453:	05 bc 0f 00 00       	add    $0xfbc,%eax
c0105458:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
c010545e:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c0105464:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c010546a:	89 50 20             	mov    %edx,0x20(%eax)
c010546d:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0105470:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c0105476:	89 50 28             	mov    %edx,0x28(%eax)
c0105479:	8b 45 b8             	mov    -0x48(%ebp),%eax
c010547c:	8b 40 18             	mov    0x18(%eax),%eax
c010547f:	89 c2                	mov    %eax,%edx
c0105481:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c0105487:	89 50 30             	mov    %edx,0x30(%eax)
c010548a:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c0105490:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0105496:	89 50 3c             	mov    %edx,0x3c(%eax)
c0105499:	8b 45 80             	mov    -0x80(%ebp),%eax
c010549c:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c01054a3:	00 00 00 
c01054a6:	c7 85 44 ff ff ff 65 	movl   $0x65,-0xbc(%ebp)
c01054ad:	00 00 00 
c01054b0:	c7 85 24 ff ff ff 00 	movl   $0x0,-0xdc(%ebp)
c01054b7:	00 00 00 
c01054ba:	c7 85 28 ff ff ff 00 	movl   $0x0,-0xd8(%ebp)
c01054c1:	00 00 00 
c01054c4:	83 ec 04             	sub    $0x4,%esp
c01054c7:	ff 75 d4             	pushl  -0x2c(%ebp)
c01054ca:	8d 85 cc fe ff ff    	lea    -0x134(%ebp),%eax
c01054d0:	50                   	push   %eax
c01054d1:	6a 01                	push   $0x1
c01054d3:	e8 9c 39 00 00       	call   c0108e74 <send_rec>
c01054d8:	83 c4 10             	add    $0x10,%esp
c01054db:	c9                   	leave  
c01054dc:	c3                   	ret    

c01054dd <do_fork>:
c01054dd:	55                   	push   %ebp
c01054de:	89 e5                	mov    %esp,%ebp
c01054e0:	81 ec 98 00 00 00    	sub    $0x98,%esp
c01054e6:	8b 45 08             	mov    0x8(%ebp),%eax
c01054e9:	8b 00                	mov    (%eax),%eax
c01054eb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01054ee:	83 ec 0c             	sub    $0xc,%esp
c01054f1:	ff 75 f4             	pushl  -0xc(%ebp)
c01054f4:	e8 5d 42 00 00       	call   c0109756 <fork_process>
c01054f9:	83 c4 10             	add    $0x10,%esp
c01054fc:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01054ff:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105502:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0105508:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010550b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010550e:	8b 90 24 01 00 00    	mov    0x124(%eax),%edx
c0105514:	8b 45 08             	mov    0x8(%ebp),%eax
c0105517:	89 50 5c             	mov    %edx,0x5c(%eax)
c010551a:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c0105521:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0105528:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c010552f:	83 ec 04             	sub    $0x4,%esp
c0105532:	ff 75 ec             	pushl  -0x14(%ebp)
c0105535:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
c010553b:	50                   	push   %eax
c010553c:	6a 01                	push   $0x1
c010553e:	e8 31 39 00 00       	call   c0108e74 <send_rec>
c0105543:	83 c4 10             	add    $0x10,%esp
c0105546:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105549:	c9                   	leave  
c010554a:	c3                   	ret    

c010554b <do_exit>:
c010554b:	55                   	push   %ebp
c010554c:	89 e5                	mov    %esp,%ebp
c010554e:	83 ec 18             	sub    $0x18,%esp
c0105551:	8b 45 08             	mov    0x8(%ebp),%eax
c0105554:	8b 00                	mov    (%eax),%eax
c0105556:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105559:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010555c:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0105562:	05 00 22 18 c0       	add    $0xc0182200,%eax
c0105567:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010556a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010556d:	8b 80 64 02 00 00    	mov    0x264(%eax),%eax
c0105573:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105576:	8b 45 08             	mov    0x8(%ebp),%eax
c0105579:	8b 40 54             	mov    0x54(%eax),%eax
c010557c:	89 c2                	mov    %eax,%edx
c010557e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105581:	89 90 68 02 00 00    	mov    %edx,0x268(%eax)
c0105587:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010558a:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0105590:	05 49 24 18 c0       	add    $0xc0182449,%eax
c0105595:	0f b6 00             	movzbl (%eax),%eax
c0105598:	3c 04                	cmp    $0x4,%al
c010559a:	75 21                	jne    c01055bd <do_exit+0x72>
c010559c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010559f:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c01055a5:	05 49 24 18 c0       	add    $0xc0182449,%eax
c01055aa:	c6 00 fb             	movb   $0xfb,(%eax)
c01055ad:	83 ec 0c             	sub    $0xc,%esp
c01055b0:	ff 75 ec             	pushl  -0x14(%ebp)
c01055b3:	e8 5c 01 00 00       	call   c0105714 <cleanup>
c01055b8:	83 c4 10             	add    $0x10,%esp
c01055bb:	eb 0a                	jmp    c01055c7 <do_exit+0x7c>
c01055bd:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01055c0:	c6 80 48 02 00 00 03 	movb   $0x3,0x248(%eax)
c01055c7:	c7 45 f4 08 00 00 00 	movl   $0x8,-0xc(%ebp)
c01055ce:	eb 6e                	jmp    c010563e <do_exit+0xf3>
c01055d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01055d3:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c01055d9:	05 64 24 18 c0       	add    $0xc0182464,%eax
c01055de:	8b 00                	mov    (%eax),%eax
c01055e0:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c01055e3:	75 55                	jne    c010563a <do_exit+0xef>
c01055e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01055e8:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c01055ee:	05 64 24 18 c0       	add    $0xc0182464,%eax
c01055f3:	c7 00 06 00 00 00    	movl   $0x6,(%eax)
c01055f9:	0f b6 05 81 34 18 c0 	movzbl 0xc0183481,%eax
c0105600:	3c 04                	cmp    $0x4,%al
c0105602:	75 36                	jne    c010563a <do_exit+0xef>
c0105604:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105607:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c010560d:	05 49 24 18 c0       	add    $0xc0182449,%eax
c0105612:	0f b6 00             	movzbl (%eax),%eax
c0105615:	3c 03                	cmp    $0x3,%al
c0105617:	75 21                	jne    c010563a <do_exit+0xef>
c0105619:	c6 05 81 34 18 c0 fb 	movb   $0xfb,0xc0183481
c0105620:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105623:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0105629:	05 00 22 18 c0       	add    $0xc0182200,%eax
c010562e:	83 ec 0c             	sub    $0xc,%esp
c0105631:	50                   	push   %eax
c0105632:	e8 dd 00 00 00       	call   c0105714 <cleanup>
c0105637:	83 c4 10             	add    $0x10,%esp
c010563a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c010563e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0105642:	7e 8c                	jle    c01055d0 <do_exit+0x85>
c0105644:	90                   	nop
c0105645:	c9                   	leave  
c0105646:	c3                   	ret    

c0105647 <do_wait>:
c0105647:	55                   	push   %ebp
c0105648:	89 e5                	mov    %esp,%ebp
c010564a:	81 ec 98 00 00 00    	sub    $0x98,%esp
c0105650:	8b 45 08             	mov    0x8(%ebp),%eax
c0105653:	8b 00                	mov    (%eax),%eax
c0105655:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105658:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010565f:	c7 45 f0 08 00 00 00 	movl   $0x8,-0x10(%ebp)
c0105666:	eb 5f                	jmp    c01056c7 <do_wait+0x80>
c0105668:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010566b:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0105671:	05 64 24 18 c0       	add    $0xc0182464,%eax
c0105676:	8b 00                	mov    (%eax),%eax
c0105678:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c010567b:	75 46                	jne    c01056c3 <do_wait+0x7c>
c010567d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0105681:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105684:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c010568a:	05 49 24 18 c0       	add    $0xc0182449,%eax
c010568f:	0f b6 00             	movzbl (%eax),%eax
c0105692:	3c 03                	cmp    $0x3,%al
c0105694:	75 2d                	jne    c01056c3 <do_wait+0x7c>
c0105696:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105699:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c010569f:	05 49 24 18 c0       	add    $0xc0182449,%eax
c01056a4:	c6 00 fb             	movb   $0xfb,(%eax)
c01056a7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01056aa:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c01056b0:	05 00 22 18 c0       	add    $0xc0182200,%eax
c01056b5:	83 ec 0c             	sub    $0xc,%esp
c01056b8:	50                   	push   %eax
c01056b9:	e8 56 00 00 00       	call   c0105714 <cleanup>
c01056be:	83 c4 10             	add    $0x10,%esp
c01056c1:	eb 4f                	jmp    c0105712 <do_wait+0xcb>
c01056c3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01056c7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c01056cb:	7e 9b                	jle    c0105668 <do_wait+0x21>
c01056cd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01056d1:	74 13                	je     c01056e6 <do_wait+0x9f>
c01056d3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01056d6:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c01056dc:	05 49 24 18 c0       	add    $0xc0182449,%eax
c01056e1:	c6 00 04             	movb   $0x4,(%eax)
c01056e4:	eb 2c                	jmp    c0105712 <do_wait+0xcb>
c01056e6:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c01056ed:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c01056f4:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c01056fb:	83 ec 04             	sub    $0x4,%esp
c01056fe:	ff 75 ec             	pushl  -0x14(%ebp)
c0105701:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
c0105707:	50                   	push   %eax
c0105708:	6a 01                	push   $0x1
c010570a:	e8 65 37 00 00       	call   c0108e74 <send_rec>
c010570f:	83 c4 10             	add    $0x10,%esp
c0105712:	c9                   	leave  
c0105713:	c3                   	ret    

c0105714 <cleanup>:
c0105714:	55                   	push   %ebp
c0105715:	89 e5                	mov    %esp,%ebp
c0105717:	81 ec 88 00 00 00    	sub    $0x88,%esp
c010571d:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c0105724:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c010572b:	8b 45 08             	mov    0x8(%ebp),%eax
c010572e:	8b 80 64 02 00 00    	mov    0x264(%eax),%eax
c0105734:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105737:	8b 45 08             	mov    0x8(%ebp),%eax
c010573a:	8b 80 68 02 00 00    	mov    0x268(%eax),%eax
c0105740:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0105743:	8b 45 08             	mov    0x8(%ebp),%eax
c0105746:	8b 80 64 02 00 00    	mov    0x264(%eax),%eax
c010574c:	83 ec 04             	sub    $0x4,%esp
c010574f:	50                   	push   %eax
c0105750:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0105756:	50                   	push   %eax
c0105757:	6a 01                	push   $0x1
c0105759:	e8 16 37 00 00       	call   c0108e74 <send_rec>
c010575e:	83 c4 10             	add    $0x10,%esp
c0105761:	8b 45 08             	mov    0x8(%ebp),%eax
c0105764:	c6 80 48 02 00 00 ff 	movb   $0xff,0x248(%eax)
c010576b:	90                   	nop
c010576c:	c9                   	leave  
c010576d:	c3                   	ret    

c010576e <init_bitmap>:
c010576e:	55                   	push   %ebp
c010576f:	89 e5                	mov    %esp,%ebp
c0105771:	83 ec 08             	sub    $0x8,%esp
c0105774:	8b 45 08             	mov    0x8(%ebp),%eax
c0105777:	8b 50 04             	mov    0x4(%eax),%edx
c010577a:	8b 45 08             	mov    0x8(%ebp),%eax
c010577d:	8b 00                	mov    (%eax),%eax
c010577f:	83 ec 04             	sub    $0x4,%esp
c0105782:	52                   	push   %edx
c0105783:	6a 00                	push   $0x0
c0105785:	50                   	push   %eax
c0105786:	e8 94 54 00 00       	call   c010ac1f <Memset>
c010578b:	83 c4 10             	add    $0x10,%esp
c010578e:	90                   	nop
c010578f:	c9                   	leave  
c0105790:	c3                   	ret    

c0105791 <test_bit_val>:
c0105791:	55                   	push   %ebp
c0105792:	89 e5                	mov    %esp,%ebp
c0105794:	53                   	push   %ebx
c0105795:	83 ec 10             	sub    $0x10,%esp
c0105798:	8b 45 0c             	mov    0xc(%ebp),%eax
c010579b:	8d 50 07             	lea    0x7(%eax),%edx
c010579e:	85 c0                	test   %eax,%eax
c01057a0:	0f 48 c2             	cmovs  %edx,%eax
c01057a3:	c1 f8 03             	sar    $0x3,%eax
c01057a6:	89 45 f8             	mov    %eax,-0x8(%ebp)
c01057a9:	8b 45 0c             	mov    0xc(%ebp),%eax
c01057ac:	99                   	cltd   
c01057ad:	c1 ea 1d             	shr    $0x1d,%edx
c01057b0:	01 d0                	add    %edx,%eax
c01057b2:	83 e0 07             	and    $0x7,%eax
c01057b5:	29 d0                	sub    %edx,%eax
c01057b7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01057ba:	8b 45 08             	mov    0x8(%ebp),%eax
c01057bd:	8b 10                	mov    (%eax),%edx
c01057bf:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01057c2:	01 d0                	add    %edx,%eax
c01057c4:	0f b6 00             	movzbl (%eax),%eax
c01057c7:	88 45 f3             	mov    %al,-0xd(%ebp)
c01057ca:	0f be 55 f3          	movsbl -0xd(%ebp),%edx
c01057ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01057d1:	bb 01 00 00 00       	mov    $0x1,%ebx
c01057d6:	89 c1                	mov    %eax,%ecx
c01057d8:	d3 e3                	shl    %cl,%ebx
c01057da:	89 d8                	mov    %ebx,%eax
c01057dc:	21 c2                	and    %eax,%edx
c01057de:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01057e1:	89 c1                	mov    %eax,%ecx
c01057e3:	d3 fa                	sar    %cl,%edx
c01057e5:	89 d0                	mov    %edx,%eax
c01057e7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01057ea:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c01057ee:	0f 9f c0             	setg   %al
c01057f1:	0f b6 c0             	movzbl %al,%eax
c01057f4:	83 c4 10             	add    $0x10,%esp
c01057f7:	5b                   	pop    %ebx
c01057f8:	5d                   	pop    %ebp
c01057f9:	c3                   	ret    

c01057fa <set_bit_val>:
c01057fa:	55                   	push   %ebp
c01057fb:	89 e5                	mov    %esp,%ebp
c01057fd:	83 ec 10             	sub    $0x10,%esp
c0105800:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105803:	8d 50 07             	lea    0x7(%eax),%edx
c0105806:	85 c0                	test   %eax,%eax
c0105808:	0f 48 c2             	cmovs  %edx,%eax
c010580b:	c1 f8 03             	sar    $0x3,%eax
c010580e:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105811:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105814:	99                   	cltd   
c0105815:	c1 ea 1d             	shr    $0x1d,%edx
c0105818:	01 d0                	add    %edx,%eax
c010581a:	83 e0 07             	and    $0x7,%eax
c010581d:	29 d0                	sub    %edx,%eax
c010581f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105822:	8b 45 08             	mov    0x8(%ebp),%eax
c0105825:	8b 10                	mov    (%eax),%edx
c0105827:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010582a:	01 d0                	add    %edx,%eax
c010582c:	0f b6 00             	movzbl (%eax),%eax
c010582f:	88 45 ff             	mov    %al,-0x1(%ebp)
c0105832:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0105836:	7e 13                	jle    c010584b <set_bit_val+0x51>
c0105838:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010583b:	ba 01 00 00 00       	mov    $0x1,%edx
c0105840:	89 c1                	mov    %eax,%ecx
c0105842:	d3 e2                	shl    %cl,%edx
c0105844:	89 d0                	mov    %edx,%eax
c0105846:	08 45 ff             	or     %al,-0x1(%ebp)
c0105849:	eb 13                	jmp    c010585e <set_bit_val+0x64>
c010584b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010584e:	ba 01 00 00 00       	mov    $0x1,%edx
c0105853:	89 c1                	mov    %eax,%ecx
c0105855:	d3 e2                	shl    %cl,%edx
c0105857:	89 d0                	mov    %edx,%eax
c0105859:	f7 d0                	not    %eax
c010585b:	20 45 ff             	and    %al,-0x1(%ebp)
c010585e:	8b 45 08             	mov    0x8(%ebp),%eax
c0105861:	8b 10                	mov    (%eax),%edx
c0105863:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105866:	01 c2                	add    %eax,%edx
c0105868:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
c010586c:	88 02                	mov    %al,(%edx)
c010586e:	b8 01 00 00 00       	mov    $0x1,%eax
c0105873:	c9                   	leave  
c0105874:	c3                   	ret    

c0105875 <set_bits>:
c0105875:	55                   	push   %ebp
c0105876:	89 e5                	mov    %esp,%ebp
c0105878:	83 ec 10             	sub    $0x10,%esp
c010587b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0105882:	eb 1c                	jmp    c01058a0 <set_bits+0x2b>
c0105884:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105887:	8d 50 01             	lea    0x1(%eax),%edx
c010588a:	89 55 0c             	mov    %edx,0xc(%ebp)
c010588d:	ff 75 10             	pushl  0x10(%ebp)
c0105890:	50                   	push   %eax
c0105891:	ff 75 08             	pushl  0x8(%ebp)
c0105894:	e8 61 ff ff ff       	call   c01057fa <set_bit_val>
c0105899:	83 c4 0c             	add    $0xc,%esp
c010589c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c01058a0:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01058a3:	3b 45 14             	cmp    0x14(%ebp),%eax
c01058a6:	7c dc                	jl     c0105884 <set_bits+0xf>
c01058a8:	b8 01 00 00 00       	mov    $0x1,%eax
c01058ad:	c9                   	leave  
c01058ae:	c3                   	ret    

c01058af <get_first_free_bit>:
c01058af:	55                   	push   %ebp
c01058b0:	89 e5                	mov    %esp,%ebp
c01058b2:	83 ec 10             	sub    $0x10,%esp
c01058b5:	8b 45 08             	mov    0x8(%ebp),%eax
c01058b8:	8b 40 04             	mov    0x4(%eax),%eax
c01058bb:	c1 e0 03             	shl    $0x3,%eax
c01058be:	89 45 f8             	mov    %eax,-0x8(%ebp)
c01058c1:	8b 45 0c             	mov    0xc(%ebp),%eax
c01058c4:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01058c7:	eb 1b                	jmp    c01058e4 <get_first_free_bit+0x35>
c01058c9:	ff 75 fc             	pushl  -0x4(%ebp)
c01058cc:	ff 75 08             	pushl  0x8(%ebp)
c01058cf:	e8 bd fe ff ff       	call   c0105791 <test_bit_val>
c01058d4:	83 c4 08             	add    $0x8,%esp
c01058d7:	85 c0                	test   %eax,%eax
c01058d9:	75 05                	jne    c01058e0 <get_first_free_bit+0x31>
c01058db:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01058de:	eb 11                	jmp    c01058f1 <get_first_free_bit+0x42>
c01058e0:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c01058e4:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01058e7:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c01058ea:	7c dd                	jl     c01058c9 <get_first_free_bit+0x1a>
c01058ec:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01058f1:	c9                   	leave  
c01058f2:	c3                   	ret    

c01058f3 <get_bits>:
c01058f3:	55                   	push   %ebp
c01058f4:	89 e5                	mov    %esp,%ebp
c01058f6:	83 ec 20             	sub    $0x20,%esp
c01058f9:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0105900:	ff 75 f0             	pushl  -0x10(%ebp)
c0105903:	ff 75 08             	pushl  0x8(%ebp)
c0105906:	e8 a4 ff ff ff       	call   c01058af <get_first_free_bit>
c010590b:	83 c4 08             	add    $0x8,%esp
c010590e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105911:	8b 45 08             	mov    0x8(%ebp),%eax
c0105914:	8b 40 04             	mov    0x4(%eax),%eax
c0105917:	c1 e0 03             	shl    $0x3,%eax
c010591a:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010591d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105920:	83 e8 01             	sub    $0x1,%eax
c0105923:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105926:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c010592a:	75 08                	jne    c0105934 <get_bits+0x41>
c010592c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010592f:	e9 85 00 00 00       	jmp    c01059b9 <get_bits+0xc6>
c0105934:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105937:	83 c0 01             	add    $0x1,%eax
c010593a:	89 45 f8             	mov    %eax,-0x8(%ebp)
c010593d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105940:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105943:	eb 58                	jmp    c010599d <get_bits+0xaa>
c0105945:	ff 75 f8             	pushl  -0x8(%ebp)
c0105948:	ff 75 08             	pushl  0x8(%ebp)
c010594b:	e8 41 fe ff ff       	call   c0105791 <test_bit_val>
c0105950:	83 c4 08             	add    $0x8,%esp
c0105953:	85 c0                	test   %eax,%eax
c0105955:	75 0a                	jne    c0105961 <get_bits+0x6e>
c0105957:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c010595b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c010595f:	eb 2b                	jmp    c010598c <get_bits+0x99>
c0105961:	6a 00                	push   $0x0
c0105963:	ff 75 08             	pushl  0x8(%ebp)
c0105966:	e8 44 ff ff ff       	call   c01058af <get_first_free_bit>
c010596b:	83 c4 08             	add    $0x8,%esp
c010596e:	83 c0 01             	add    $0x1,%eax
c0105971:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105974:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105977:	83 c0 01             	add    $0x1,%eax
c010597a:	89 45 f8             	mov    %eax,-0x8(%ebp)
c010597d:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105980:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105983:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105986:	83 e8 01             	sub    $0x1,%eax
c0105989:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010598c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010598f:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c0105992:	7c 09                	jl     c010599d <get_bits+0xaa>
c0105994:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c010599b:	eb 0d                	jmp    c01059aa <get_bits+0xb7>
c010599d:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01059a0:	8d 50 ff             	lea    -0x1(%eax),%edx
c01059a3:	89 55 fc             	mov    %edx,-0x4(%ebp)
c01059a6:	85 c0                	test   %eax,%eax
c01059a8:	7f 9b                	jg     c0105945 <get_bits+0x52>
c01059aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01059ad:	2b 45 0c             	sub    0xc(%ebp),%eax
c01059b0:	83 c0 01             	add    $0x1,%eax
c01059b3:	89 45 f8             	mov    %eax,-0x8(%ebp)
c01059b6:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01059b9:	c9                   	leave  
c01059ba:	c3                   	ret    

c01059bb <get_a_page>:
c01059bb:	55                   	push   %ebp
c01059bc:	89 e5                	mov    %esp,%ebp
c01059be:	83 ec 28             	sub    $0x28,%esp
c01059c1:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c01059c5:	75 22                	jne    c01059e9 <get_a_page+0x2e>
c01059c7:	a1 ac 06 11 c0       	mov    0xc01106ac,%eax
c01059cc:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01059cf:	a1 b0 06 11 c0       	mov    0xc01106b0,%eax
c01059d4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01059d7:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c01059dc:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01059df:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c01059e4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01059e7:	eb 20                	jmp    c0105a09 <get_a_page+0x4e>
c01059e9:	a1 f4 0e 11 c0       	mov    0xc0110ef4,%eax
c01059ee:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01059f1:	a1 f8 0e 11 c0       	mov    0xc0110ef8,%eax
c01059f6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01059f9:	a1 fc 0e 11 c0       	mov    0xc0110efc,%eax
c01059fe:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105a01:	a1 00 0f 11 c0       	mov    0xc0110f00,%eax
c0105a06:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105a09:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105a0c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0105a0f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105a12:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0105a15:	6a 01                	push   $0x1
c0105a17:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105a1a:	50                   	push   %eax
c0105a1b:	e8 d3 fe ff ff       	call   c01058f3 <get_bits>
c0105a20:	83 c4 08             	add    $0x8,%esp
c0105a23:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105a26:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c0105a2a:	75 1c                	jne    c0105a48 <get_a_page+0x8d>
c0105a2c:	68 84 00 00 00       	push   $0x84
c0105a31:	68 55 a3 10 c0       	push   $0xc010a355
c0105a36:	68 55 a3 10 c0       	push   $0xc010a355
c0105a3b:	68 5f a3 10 c0       	push   $0xc010a35f
c0105a40:	e8 12 2a 00 00       	call   c0108457 <assertion_failure>
c0105a45:	83 c4 10             	add    $0x10,%esp
c0105a48:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105a4b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0105a4e:	c1 e2 0c             	shl    $0xc,%edx
c0105a51:	01 d0                	add    %edx,%eax
c0105a53:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105a56:	83 ec 04             	sub    $0x4,%esp
c0105a59:	6a 01                	push   $0x1
c0105a5b:	ff 75 f4             	pushl  -0xc(%ebp)
c0105a5e:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105a61:	50                   	push   %eax
c0105a62:	e8 93 fd ff ff       	call   c01057fa <set_bit_val>
c0105a67:	83 c4 10             	add    $0x10,%esp
c0105a6a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105a6d:	c9                   	leave  
c0105a6e:	c3                   	ret    

c0105a6f <get_virtual_address_start_with_addr>:
c0105a6f:	55                   	push   %ebp
c0105a70:	89 e5                	mov    %esp,%ebp
c0105a72:	83 ec 38             	sub    $0x38,%esp
c0105a75:	e8 1d a9 ff ff       	call   c0100397 <get_running_thread_pcb>
c0105a7a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105a7d:	83 ec 0c             	sub    $0xc,%esp
c0105a80:	ff 75 10             	pushl  0x10(%ebp)
c0105a83:	e8 a4 db ff ff       	call   c010362c <pid2proc>
c0105a88:	83 c4 10             	add    $0x10,%esp
c0105a8b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105a8e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105a91:	8b 40 0c             	mov    0xc(%eax),%eax
c0105a94:	83 ec 04             	sub    $0x4,%esp
c0105a97:	6a 0c                	push   $0xc
c0105a99:	50                   	push   %eax
c0105a9a:	8d 45 dc             	lea    -0x24(%ebp),%eax
c0105a9d:	50                   	push   %eax
c0105a9e:	e8 db 0f 00 00       	call   c0106a7e <Memcpy>
c0105aa3:	83 c4 10             	add    $0x10,%esp
c0105aa6:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105aa9:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0105aac:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0105aaf:	89 55 d8             	mov    %edx,-0x28(%ebp)
c0105ab2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105ab5:	8b 55 08             	mov    0x8(%ebp),%edx
c0105ab8:	29 c2                	sub    %eax,%edx
c0105aba:	89 d0                	mov    %edx,%eax
c0105abc:	c1 e8 0c             	shr    $0xc,%eax
c0105abf:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105ac2:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0105ac6:	79 1c                	jns    c0105ae4 <get_virtual_address_start_with_addr+0x75>
c0105ac8:	68 97 00 00 00       	push   $0x97
c0105acd:	68 55 a3 10 c0       	push   $0xc010a355
c0105ad2:	68 55 a3 10 c0       	push   $0xc010a355
c0105ad7:	68 6b a3 10 c0       	push   $0xc010a36b
c0105adc:	e8 76 29 00 00       	call   c0108457 <assertion_failure>
c0105ae1:	83 c4 10             	add    $0x10,%esp
c0105ae4:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105ae7:	50                   	push   %eax
c0105ae8:	6a 01                	push   $0x1
c0105aea:	ff 75 ec             	pushl  -0x14(%ebp)
c0105aed:	8d 45 d4             	lea    -0x2c(%ebp),%eax
c0105af0:	50                   	push   %eax
c0105af1:	e8 7f fd ff ff       	call   c0105875 <set_bits>
c0105af6:	83 c4 10             	add    $0x10,%esp
c0105af9:	8b 45 08             	mov    0x8(%ebp),%eax
c0105afc:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105b01:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105b04:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105b07:	c9                   	leave  
c0105b08:	c3                   	ret    

c0105b09 <get_virtual_address>:
c0105b09:	55                   	push   %ebp
c0105b0a:	89 e5                	mov    %esp,%ebp
c0105b0c:	83 ec 28             	sub    $0x28,%esp
c0105b0f:	e8 83 a8 ff ff       	call   c0100397 <get_running_thread_pcb>
c0105b14:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105b17:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0105b1b:	75 1a                	jne    c0105b37 <get_virtual_address+0x2e>
c0105b1d:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0105b22:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105b25:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0105b2a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105b2d:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c0105b32:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105b35:	eb 18                	jmp    c0105b4f <get_virtual_address+0x46>
c0105b37:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105b3a:	8b 40 0c             	mov    0xc(%eax),%eax
c0105b3d:	83 ec 04             	sub    $0x4,%esp
c0105b40:	6a 0c                	push   $0xc
c0105b42:	50                   	push   %eax
c0105b43:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0105b46:	50                   	push   %eax
c0105b47:	e8 32 0f 00 00       	call   c0106a7e <Memcpy>
c0105b4c:	83 c4 10             	add    $0x10,%esp
c0105b4f:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105b52:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0105b55:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105b58:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0105b5b:	8b 45 08             	mov    0x8(%ebp),%eax
c0105b5e:	83 ec 08             	sub    $0x8,%esp
c0105b61:	50                   	push   %eax
c0105b62:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105b65:	50                   	push   %eax
c0105b66:	e8 88 fd ff ff       	call   c01058f3 <get_bits>
c0105b6b:	83 c4 10             	add    $0x10,%esp
c0105b6e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105b71:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105b74:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0105b77:	c1 e2 0c             	shl    $0xc,%edx
c0105b7a:	01 d0                	add    %edx,%eax
c0105b7c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105b7f:	8b 45 08             	mov    0x8(%ebp),%eax
c0105b82:	50                   	push   %eax
c0105b83:	6a 01                	push   $0x1
c0105b85:	ff 75 f0             	pushl  -0x10(%ebp)
c0105b88:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105b8b:	50                   	push   %eax
c0105b8c:	e8 e4 fc ff ff       	call   c0105875 <set_bits>
c0105b91:	83 c4 10             	add    $0x10,%esp
c0105b94:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105b97:	c9                   	leave  
c0105b98:	c3                   	ret    

c0105b99 <ptr_pde>:
c0105b99:	55                   	push   %ebp
c0105b9a:	89 e5                	mov    %esp,%ebp
c0105b9c:	8b 45 08             	mov    0x8(%ebp),%eax
c0105b9f:	c1 e8 16             	shr    $0x16,%eax
c0105ba2:	05 00 fc ff 3f       	add    $0x3ffffc00,%eax
c0105ba7:	c1 e0 02             	shl    $0x2,%eax
c0105baa:	5d                   	pop    %ebp
c0105bab:	c3                   	ret    

c0105bac <ptr_pte>:
c0105bac:	55                   	push   %ebp
c0105bad:	89 e5                	mov    %esp,%ebp
c0105baf:	8b 45 08             	mov    0x8(%ebp),%eax
c0105bb2:	c1 e8 0a             	shr    $0xa,%eax
c0105bb5:	25 00 f0 3f 00       	and    $0x3ff000,%eax
c0105bba:	89 c2                	mov    %eax,%edx
c0105bbc:	8b 45 08             	mov    0x8(%ebp),%eax
c0105bbf:	c1 e8 0c             	shr    $0xc,%eax
c0105bc2:	25 ff 03 00 00       	and    $0x3ff,%eax
c0105bc7:	c1 e0 02             	shl    $0x2,%eax
c0105bca:	01 d0                	add    %edx,%eax
c0105bcc:	2d 00 00 40 00       	sub    $0x400000,%eax
c0105bd1:	5d                   	pop    %ebp
c0105bd2:	c3                   	ret    

c0105bd3 <add_map_entry>:
c0105bd3:	55                   	push   %ebp
c0105bd4:	89 e5                	mov    %esp,%ebp
c0105bd6:	83 ec 18             	sub    $0x18,%esp
c0105bd9:	ff 75 08             	pushl  0x8(%ebp)
c0105bdc:	e8 b8 ff ff ff       	call   c0105b99 <ptr_pde>
c0105be1:	83 c4 04             	add    $0x4,%esp
c0105be4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105be7:	ff 75 08             	pushl  0x8(%ebp)
c0105bea:	e8 bd ff ff ff       	call   c0105bac <ptr_pte>
c0105bef:	83 c4 04             	add    $0x4,%esp
c0105bf2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105bf5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105bf8:	8b 00                	mov    (%eax),%eax
c0105bfa:	83 e0 01             	and    $0x1,%eax
c0105bfd:	85 c0                	test   %eax,%eax
c0105bff:	74 1b                	je     c0105c1c <add_map_entry+0x49>
c0105c01:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105c04:	8b 00                	mov    (%eax),%eax
c0105c06:	83 e0 01             	and    $0x1,%eax
c0105c09:	85 c0                	test   %eax,%eax
c0105c0b:	75 54                	jne    c0105c61 <add_map_entry+0x8e>
c0105c0d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105c10:	83 c8 07             	or     $0x7,%eax
c0105c13:	89 c2                	mov    %eax,%edx
c0105c15:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105c18:	89 10                	mov    %edx,(%eax)
c0105c1a:	eb 45                	jmp    c0105c61 <add_map_entry+0x8e>
c0105c1c:	83 ec 0c             	sub    $0xc,%esp
c0105c1f:	6a 00                	push   $0x0
c0105c21:	e8 95 fd ff ff       	call   c01059bb <get_a_page>
c0105c26:	83 c4 10             	add    $0x10,%esp
c0105c29:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105c2c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105c2f:	83 c8 07             	or     $0x7,%eax
c0105c32:	89 c2                	mov    %eax,%edx
c0105c34:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105c37:	89 10                	mov    %edx,(%eax)
c0105c39:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105c3c:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105c41:	83 ec 04             	sub    $0x4,%esp
c0105c44:	68 00 10 00 00       	push   $0x1000
c0105c49:	6a 00                	push   $0x0
c0105c4b:	50                   	push   %eax
c0105c4c:	e8 ce 4f 00 00       	call   c010ac1f <Memset>
c0105c51:	83 c4 10             	add    $0x10,%esp
c0105c54:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105c57:	83 c8 07             	or     $0x7,%eax
c0105c5a:	89 c2                	mov    %eax,%edx
c0105c5c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105c5f:	89 10                	mov    %edx,(%eax)
c0105c61:	90                   	nop
c0105c62:	c9                   	leave  
c0105c63:	c3                   	ret    

c0105c64 <alloc_virtual_memory>:
c0105c64:	55                   	push   %ebp
c0105c65:	89 e5                	mov    %esp,%ebp
c0105c67:	83 ec 28             	sub    $0x28,%esp
c0105c6a:	8b 45 08             	mov    0x8(%ebp),%eax
c0105c6d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105c72:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105c75:	8b 45 08             	mov    0x8(%ebp),%eax
c0105c78:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0105c7b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105c7e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105c81:	01 45 e4             	add    %eax,-0x1c(%ebp)
c0105c84:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105c87:	05 ff 0f 00 00       	add    $0xfff,%eax
c0105c8c:	c1 e8 0c             	shr    $0xc,%eax
c0105c8f:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105c92:	e8 00 a7 ff ff       	call   c0100397 <get_running_thread_pcb>
c0105c97:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105c9a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105c9d:	8b 40 08             	mov    0x8(%eax),%eax
c0105ca0:	85 c0                	test   %eax,%eax
c0105ca2:	75 09                	jne    c0105cad <alloc_virtual_memory+0x49>
c0105ca4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0105cab:	eb 07                	jmp    c0105cb4 <alloc_virtual_memory+0x50>
c0105cad:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0105cb4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0105cbb:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0105cc2:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0105cc9:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0105cd0:	eb 47                	jmp    c0105d19 <alloc_virtual_memory+0xb5>
c0105cd2:	83 ec 08             	sub    $0x8,%esp
c0105cd5:	ff 75 f0             	pushl  -0x10(%ebp)
c0105cd8:	6a 01                	push   $0x1
c0105cda:	e8 2a fe ff ff       	call   c0105b09 <get_virtual_address>
c0105cdf:	83 c4 10             	add    $0x10,%esp
c0105ce2:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105ce5:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0105ce9:	74 13                	je     c0105cfe <alloc_virtual_memory+0x9a>
c0105ceb:	83 ec 0c             	sub    $0xc,%esp
c0105cee:	ff 75 f0             	pushl  -0x10(%ebp)
c0105cf1:	e8 c5 fc ff ff       	call   c01059bb <get_a_page>
c0105cf6:	83 c4 10             	add    $0x10,%esp
c0105cf9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105cfc:	eb 06                	jmp    c0105d04 <alloc_virtual_memory+0xa0>
c0105cfe:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0105d01:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105d04:	83 ec 08             	sub    $0x8,%esp
c0105d07:	ff 75 f4             	pushl  -0xc(%ebp)
c0105d0a:	ff 75 d8             	pushl  -0x28(%ebp)
c0105d0d:	e8 c1 fe ff ff       	call   c0105bd3 <add_map_entry>
c0105d12:	83 c4 10             	add    $0x10,%esp
c0105d15:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0105d19:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105d1c:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c0105d1f:	72 b1                	jb     c0105cd2 <alloc_virtual_memory+0x6e>
c0105d21:	8b 45 08             	mov    0x8(%ebp),%eax
c0105d24:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105d29:	89 c2                	mov    %eax,%edx
c0105d2b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105d2e:	01 d0                	add    %edx,%eax
c0105d30:	c9                   	leave  
c0105d31:	c3                   	ret    

c0105d32 <get_physical_address_proc>:
c0105d32:	55                   	push   %ebp
c0105d33:	89 e5                	mov    %esp,%ebp
c0105d35:	83 ec 18             	sub    $0x18,%esp
c0105d38:	e8 7e a5 ff ff       	call   c01002bb <disable_int>
c0105d3d:	e8 55 a6 ff ff       	call   c0100397 <get_running_thread_pcb>
c0105d42:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105d45:	83 ec 0c             	sub    $0xc,%esp
c0105d48:	ff 75 0c             	pushl  0xc(%ebp)
c0105d4b:	e8 dc d8 ff ff       	call   c010362c <pid2proc>
c0105d50:	83 c4 10             	add    $0x10,%esp
c0105d53:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105d56:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105d59:	8b 40 08             	mov    0x8(%eax),%eax
c0105d5c:	83 ec 0c             	sub    $0xc,%esp
c0105d5f:	50                   	push   %eax
c0105d60:	e8 16 a6 ff ff       	call   c010037b <update_cr3>
c0105d65:	83 c4 10             	add    $0x10,%esp
c0105d68:	83 ec 0c             	sub    $0xc,%esp
c0105d6b:	ff 75 08             	pushl  0x8(%ebp)
c0105d6e:	e8 39 fe ff ff       	call   c0105bac <ptr_pte>
c0105d73:	83 c4 10             	add    $0x10,%esp
c0105d76:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105d79:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105d7c:	8b 00                	mov    (%eax),%eax
c0105d7e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105d83:	89 c2                	mov    %eax,%edx
c0105d85:	8b 45 08             	mov    0x8(%ebp),%eax
c0105d88:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105d8d:	09 d0                	or     %edx,%eax
c0105d8f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105d92:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105d95:	8b 40 08             	mov    0x8(%eax),%eax
c0105d98:	83 ec 0c             	sub    $0xc,%esp
c0105d9b:	50                   	push   %eax
c0105d9c:	e8 da a5 ff ff       	call   c010037b <update_cr3>
c0105da1:	83 c4 10             	add    $0x10,%esp
c0105da4:	e8 14 a5 ff ff       	call   c01002bd <enable_int>
c0105da9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105dac:	c9                   	leave  
c0105dad:	c3                   	ret    

c0105dae <get_physical_address>:
c0105dae:	55                   	push   %ebp
c0105daf:	89 e5                	mov    %esp,%ebp
c0105db1:	83 ec 10             	sub    $0x10,%esp
c0105db4:	ff 75 08             	pushl  0x8(%ebp)
c0105db7:	e8 f0 fd ff ff       	call   c0105bac <ptr_pte>
c0105dbc:	83 c4 04             	add    $0x4,%esp
c0105dbf:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105dc2:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105dc5:	8b 00                	mov    (%eax),%eax
c0105dc7:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105dcc:	89 c2                	mov    %eax,%edx
c0105dce:	8b 45 08             	mov    0x8(%ebp),%eax
c0105dd1:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105dd6:	09 d0                	or     %edx,%eax
c0105dd8:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105ddb:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105dde:	c9                   	leave  
c0105ddf:	c3                   	ret    

c0105de0 <alloc_physical_memory_of_proc>:
c0105de0:	55                   	push   %ebp
c0105de1:	89 e5                	mov    %esp,%ebp
c0105de3:	83 ec 48             	sub    $0x48,%esp
c0105de6:	e8 d0 a4 ff ff       	call   c01002bb <disable_int>
c0105deb:	8b 45 08             	mov    0x8(%ebp),%eax
c0105dee:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105df3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105df6:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0105dfd:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105e00:	83 ec 0c             	sub    $0xc,%esp
c0105e03:	50                   	push   %eax
c0105e04:	e8 23 d8 ff ff       	call   c010362c <pid2proc>
c0105e09:	83 c4 10             	add    $0x10,%esp
c0105e0c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105e0f:	e8 83 a5 ff ff       	call   c0100397 <get_running_thread_pcb>
c0105e14:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105e17:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105e1a:	8b 40 0c             	mov    0xc(%eax),%eax
c0105e1d:	83 ec 04             	sub    $0x4,%esp
c0105e20:	6a 0c                	push   $0xc
c0105e22:	50                   	push   %eax
c0105e23:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0105e26:	50                   	push   %eax
c0105e27:	e8 52 0c 00 00       	call   c0106a7e <Memcpy>
c0105e2c:	83 c4 10             	add    $0x10,%esp
c0105e2f:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0105e32:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0105e35:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0105e38:	89 55 c8             	mov    %edx,-0x38(%ebp)
c0105e3b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0105e3e:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0105e41:	29 c2                	sub    %eax,%edx
c0105e43:	89 d0                	mov    %edx,%eax
c0105e45:	c1 e8 0c             	shr    $0xc,%eax
c0105e48:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105e4b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0105e4e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0105e51:	c1 e2 0c             	shl    $0xc,%edx
c0105e54:	01 d0                	add    %edx,%eax
c0105e56:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105e59:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105e5c:	6a 01                	push   $0x1
c0105e5e:	6a 01                	push   $0x1
c0105e60:	50                   	push   %eax
c0105e61:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0105e64:	50                   	push   %eax
c0105e65:	e8 0b fa ff ff       	call   c0105875 <set_bits>
c0105e6a:	83 c4 10             	add    $0x10,%esp
c0105e6d:	83 ec 0c             	sub    $0xc,%esp
c0105e70:	ff 75 f0             	pushl  -0x10(%ebp)
c0105e73:	e8 43 fb ff ff       	call   c01059bb <get_a_page>
c0105e78:	83 c4 10             	add    $0x10,%esp
c0105e7b:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105e7e:	8b 45 08             	mov    0x8(%ebp),%eax
c0105e81:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105e86:	89 c2                	mov    %eax,%edx
c0105e88:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105e8b:	01 d0                	add    %edx,%eax
c0105e8d:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105e90:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105e93:	8b 40 08             	mov    0x8(%eax),%eax
c0105e96:	83 ec 0c             	sub    $0xc,%esp
c0105e99:	50                   	push   %eax
c0105e9a:	e8 dc a4 ff ff       	call   c010037b <update_cr3>
c0105e9f:	83 c4 10             	add    $0x10,%esp
c0105ea2:	83 ec 08             	sub    $0x8,%esp
c0105ea5:	ff 75 dc             	pushl  -0x24(%ebp)
c0105ea8:	ff 75 f4             	pushl  -0xc(%ebp)
c0105eab:	e8 23 fd ff ff       	call   c0105bd3 <add_map_entry>
c0105eb0:	83 c4 10             	add    $0x10,%esp
c0105eb3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105eb6:	8b 40 08             	mov    0x8(%eax),%eax
c0105eb9:	83 ec 0c             	sub    $0xc,%esp
c0105ebc:	50                   	push   %eax
c0105ebd:	e8 b9 a4 ff ff       	call   c010037b <update_cr3>
c0105ec2:	83 c4 10             	add    $0x10,%esp
c0105ec5:	e8 f3 a3 ff ff       	call   c01002bd <enable_int>
c0105eca:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0105ecd:	c9                   	leave  
c0105ece:	c3                   	ret    

c0105ecf <alloc_physical_memory>:
c0105ecf:	55                   	push   %ebp
c0105ed0:	89 e5                	mov    %esp,%ebp
c0105ed2:	83 ec 38             	sub    $0x38,%esp
c0105ed5:	8b 45 08             	mov    0x8(%ebp),%eax
c0105ed8:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105edd:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105ee0:	e8 b2 a4 ff ff       	call   c0100397 <get_running_thread_pcb>
c0105ee5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105ee8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0105eec:	75 1a                	jne    c0105f08 <alloc_physical_memory+0x39>
c0105eee:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0105ef3:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0105ef6:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0105efb:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105efe:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c0105f03:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105f06:	eb 18                	jmp    c0105f20 <alloc_physical_memory+0x51>
c0105f08:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105f0b:	8b 40 0c             	mov    0xc(%eax),%eax
c0105f0e:	83 ec 04             	sub    $0x4,%esp
c0105f11:	6a 0c                	push   $0xc
c0105f13:	50                   	push   %eax
c0105f14:	8d 45 d4             	lea    -0x2c(%ebp),%eax
c0105f17:	50                   	push   %eax
c0105f18:	e8 61 0b 00 00       	call   c0106a7e <Memcpy>
c0105f1d:	83 c4 10             	add    $0x10,%esp
c0105f20:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0105f23:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0105f26:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0105f29:	89 55 d0             	mov    %edx,-0x30(%ebp)
c0105f2c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105f2f:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0105f32:	29 c2                	sub    %eax,%edx
c0105f34:	89 d0                	mov    %edx,%eax
c0105f36:	c1 e8 0c             	shr    $0xc,%eax
c0105f39:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105f3c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105f3f:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0105f42:	c1 e2 0c             	shl    $0xc,%edx
c0105f45:	01 d0                	add    %edx,%eax
c0105f47:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105f4a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105f4d:	6a 01                	push   $0x1
c0105f4f:	6a 01                	push   $0x1
c0105f51:	50                   	push   %eax
c0105f52:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0105f55:	50                   	push   %eax
c0105f56:	e8 1a f9 ff ff       	call   c0105875 <set_bits>
c0105f5b:	83 c4 10             	add    $0x10,%esp
c0105f5e:	83 ec 0c             	sub    $0xc,%esp
c0105f61:	ff 75 0c             	pushl  0xc(%ebp)
c0105f64:	e8 52 fa ff ff       	call   c01059bb <get_a_page>
c0105f69:	83 c4 10             	add    $0x10,%esp
c0105f6c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105f6f:	8b 45 08             	mov    0x8(%ebp),%eax
c0105f72:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105f77:	89 c2                	mov    %eax,%edx
c0105f79:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105f7c:	01 d0                	add    %edx,%eax
c0105f7e:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105f81:	83 ec 08             	sub    $0x8,%esp
c0105f84:	ff 75 e4             	pushl  -0x1c(%ebp)
c0105f87:	ff 75 f4             	pushl  -0xc(%ebp)
c0105f8a:	e8 44 fc ff ff       	call   c0105bd3 <add_map_entry>
c0105f8f:	83 c4 10             	add    $0x10,%esp
c0105f92:	8b 45 08             	mov    0x8(%ebp),%eax
c0105f95:	c9                   	leave  
c0105f96:	c3                   	ret    

c0105f97 <alloc_memory>:
c0105f97:	55                   	push   %ebp
c0105f98:	89 e5                	mov    %esp,%ebp
c0105f9a:	83 ec 18             	sub    $0x18,%esp
c0105f9d:	83 ec 08             	sub    $0x8,%esp
c0105fa0:	ff 75 0c             	pushl  0xc(%ebp)
c0105fa3:	ff 75 08             	pushl  0x8(%ebp)
c0105fa6:	e8 5e fb ff ff       	call   c0105b09 <get_virtual_address>
c0105fab:	83 c4 10             	add    $0x10,%esp
c0105fae:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105fb1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105fb4:	2d 00 10 00 00       	sub    $0x1000,%eax
c0105fb9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105fbc:	eb 29                	jmp    c0105fe7 <alloc_memory+0x50>
c0105fbe:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c0105fc5:	83 ec 0c             	sub    $0xc,%esp
c0105fc8:	ff 75 0c             	pushl  0xc(%ebp)
c0105fcb:	e8 eb f9 ff ff       	call   c01059bb <get_a_page>
c0105fd0:	83 c4 10             	add    $0x10,%esp
c0105fd3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105fd6:	83 ec 08             	sub    $0x8,%esp
c0105fd9:	ff 75 ec             	pushl  -0x14(%ebp)
c0105fdc:	ff 75 f4             	pushl  -0xc(%ebp)
c0105fdf:	e8 ef fb ff ff       	call   c0105bd3 <add_map_entry>
c0105fe4:	83 c4 10             	add    $0x10,%esp
c0105fe7:	8b 45 08             	mov    0x8(%ebp),%eax
c0105fea:	8d 50 ff             	lea    -0x1(%eax),%edx
c0105fed:	89 55 08             	mov    %edx,0x8(%ebp)
c0105ff0:	85 c0                	test   %eax,%eax
c0105ff2:	75 ca                	jne    c0105fbe <alloc_memory+0x27>
c0105ff4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105ff7:	c9                   	leave  
c0105ff8:	c3                   	ret    

c0105ff9 <get_a_virtual_page>:
c0105ff9:	55                   	push   %ebp
c0105ffa:	89 e5                	mov    %esp,%ebp
c0105ffc:	83 ec 18             	sub    $0x18,%esp
c0105fff:	83 ec 0c             	sub    $0xc,%esp
c0106002:	ff 75 08             	pushl  0x8(%ebp)
c0106005:	e8 b1 f9 ff ff       	call   c01059bb <get_a_page>
c010600a:	83 c4 10             	add    $0x10,%esp
c010600d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106010:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106013:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0106018:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010601b:	83 ec 08             	sub    $0x8,%esp
c010601e:	ff 75 f4             	pushl  -0xc(%ebp)
c0106021:	ff 75 f0             	pushl  -0x10(%ebp)
c0106024:	e8 aa fb ff ff       	call   c0105bd3 <add_map_entry>
c0106029:	83 c4 10             	add    $0x10,%esp
c010602c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010602f:	c9                   	leave  
c0106030:	c3                   	ret    

c0106031 <block2arena>:
c0106031:	55                   	push   %ebp
c0106032:	89 e5                	mov    %esp,%ebp
c0106034:	83 ec 10             	sub    $0x10,%esp
c0106037:	8b 45 08             	mov    0x8(%ebp),%eax
c010603a:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c010603f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0106042:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106045:	c9                   	leave  
c0106046:	c3                   	ret    

c0106047 <sys_malloc2>:
c0106047:	55                   	push   %ebp
c0106048:	89 e5                	mov    %esp,%ebp
c010604a:	83 ec 68             	sub    $0x68,%esp
c010604d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106054:	e8 3e a3 ff ff       	call   c0100397 <get_running_thread_pcb>
c0106059:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010605c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010605f:	8b 40 08             	mov    0x8(%eax),%eax
c0106062:	85 c0                	test   %eax,%eax
c0106064:	75 10                	jne    c0106076 <sys_malloc2+0x2f>
c0106066:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c010606d:	c7 45 ec a0 37 18 c0 	movl   $0xc01837a0,-0x14(%ebp)
c0106074:	eb 10                	jmp    c0106086 <sys_malloc2+0x3f>
c0106076:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c010607d:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106080:	83 c0 10             	add    $0x10,%eax
c0106083:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106086:	81 7d 08 00 04 00 00 	cmpl   $0x400,0x8(%ebp)
c010608d:	76 52                	jbe    c01060e1 <sys_malloc2+0x9a>
c010608f:	8b 45 08             	mov    0x8(%ebp),%eax
c0106092:	05 0b 10 00 00       	add    $0x100b,%eax
c0106097:	c1 e8 0c             	shr    $0xc,%eax
c010609a:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010609d:	83 ec 08             	sub    $0x8,%esp
c01060a0:	ff 75 f0             	pushl  -0x10(%ebp)
c01060a3:	ff 75 d8             	pushl  -0x28(%ebp)
c01060a6:	e8 ec fe ff ff       	call   c0105f97 <alloc_memory>
c01060ab:	83 c4 10             	add    $0x10,%esp
c01060ae:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01060b1:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01060b4:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01060b7:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01060ba:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c01060c0:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01060c3:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c01060ca:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01060cd:	c6 40 08 01          	movb   $0x1,0x8(%eax)
c01060d1:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01060d4:	05 90 00 00 00       	add    $0x90,%eax
c01060d9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01060dc:	e9 f0 01 00 00       	jmp    c01062d1 <sys_malloc2+0x28a>
c01060e1:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01060e8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01060ef:	eb 26                	jmp    c0106117 <sys_malloc2+0xd0>
c01060f1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01060f4:	89 d0                	mov    %edx,%eax
c01060f6:	01 c0                	add    %eax,%eax
c01060f8:	01 d0                	add    %edx,%eax
c01060fa:	c1 e0 03             	shl    $0x3,%eax
c01060fd:	89 c2                	mov    %eax,%edx
c01060ff:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106102:	01 d0                	add    %edx,%eax
c0106104:	8b 00                	mov    (%eax),%eax
c0106106:	39 45 08             	cmp    %eax,0x8(%ebp)
c0106109:	77 08                	ja     c0106113 <sys_malloc2+0xcc>
c010610b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010610e:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106111:	eb 0a                	jmp    c010611d <sys_malloc2+0xd6>
c0106113:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0106117:	83 7d e4 09          	cmpl   $0x9,-0x1c(%ebp)
c010611b:	7e d4                	jle    c01060f1 <sys_malloc2+0xaa>
c010611d:	83 ec 08             	sub    $0x8,%esp
c0106120:	ff 75 f0             	pushl  -0x10(%ebp)
c0106123:	6a 01                	push   $0x1
c0106125:	e8 6d fe ff ff       	call   c0105f97 <alloc_memory>
c010612a:	83 c4 10             	add    $0x10,%esp
c010612d:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0106130:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0106133:	89 d0                	mov    %edx,%eax
c0106135:	01 c0                	add    %eax,%eax
c0106137:	01 d0                	add    %edx,%eax
c0106139:	c1 e0 03             	shl    $0x3,%eax
c010613c:	89 c2                	mov    %eax,%edx
c010613e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106141:	01 d0                	add    %edx,%eax
c0106143:	83 ec 04             	sub    $0x4,%esp
c0106146:	6a 18                	push   $0x18
c0106148:	50                   	push   %eax
c0106149:	ff 75 cc             	pushl  -0x34(%ebp)
c010614c:	e8 2d 09 00 00       	call   c0106a7e <Memcpy>
c0106151:	83 c4 10             	add    $0x10,%esp
c0106154:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c010615b:	e8 ba 08 00 00       	call   c0106a1a <intr_disable>
c0106160:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0106163:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0106166:	89 d0                	mov    %edx,%eax
c0106168:	01 c0                	add    %eax,%eax
c010616a:	01 d0                	add    %edx,%eax
c010616c:	c1 e0 03             	shl    $0x3,%eax
c010616f:	89 c2                	mov    %eax,%edx
c0106171:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106174:	01 d0                	add    %edx,%eax
c0106176:	83 c0 08             	add    $0x8,%eax
c0106179:	83 ec 0c             	sub    $0xc,%esp
c010617c:	50                   	push   %eax
c010617d:	e8 51 38 00 00       	call   c01099d3 <isListEmpty>
c0106182:	83 c4 10             	add    $0x10,%esp
c0106185:	3c 01                	cmp    $0x1,%al
c0106187:	0f 85 c1 00 00 00    	jne    c010624e <sys_malloc2+0x207>
c010618d:	c7 45 c8 01 00 00 00 	movl   $0x1,-0x38(%ebp)
c0106194:	83 ec 08             	sub    $0x8,%esp
c0106197:	ff 75 f0             	pushl  -0x10(%ebp)
c010619a:	6a 01                	push   $0x1
c010619c:	e8 f6 fd ff ff       	call   c0105f97 <alloc_memory>
c01061a1:	83 c4 10             	add    $0x10,%esp
c01061a4:	89 45 c0             	mov    %eax,-0x40(%ebp)
c01061a7:	8b 45 c0             	mov    -0x40(%ebp),%eax
c01061aa:	83 ec 0c             	sub    $0xc,%esp
c01061ad:	50                   	push   %eax
c01061ae:	e8 7e fe ff ff       	call   c0106031 <block2arena>
c01061b3:	83 c4 10             	add    $0x10,%esp
c01061b6:	89 45 bc             	mov    %eax,-0x44(%ebp)
c01061b9:	8b 55 e8             	mov    -0x18(%ebp),%edx
c01061bc:	89 d0                	mov    %edx,%eax
c01061be:	01 c0                	add    %eax,%eax
c01061c0:	01 d0                	add    %edx,%eax
c01061c2:	c1 e0 03             	shl    $0x3,%eax
c01061c5:	89 c2                	mov    %eax,%edx
c01061c7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01061ca:	01 d0                	add    %edx,%eax
c01061cc:	8b 50 04             	mov    0x4(%eax),%edx
c01061cf:	8b 45 bc             	mov    -0x44(%ebp),%eax
c01061d2:	89 50 04             	mov    %edx,0x4(%eax)
c01061d5:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01061d8:	8b 00                	mov    (%eax),%eax
c01061da:	89 45 b8             	mov    %eax,-0x48(%ebp)
c01061dd:	c7 45 b4 0c 00 00 00 	movl   $0xc,-0x4c(%ebp)
c01061e4:	b8 00 10 00 00       	mov    $0x1000,%eax
c01061e9:	2b 45 b4             	sub    -0x4c(%ebp),%eax
c01061ec:	ba 00 00 00 00       	mov    $0x0,%edx
c01061f1:	f7 75 b8             	divl   -0x48(%ebp)
c01061f4:	89 45 b0             	mov    %eax,-0x50(%ebp)
c01061f7:	8b 55 c0             	mov    -0x40(%ebp),%edx
c01061fa:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c01061fd:	01 d0                	add    %edx,%eax
c01061ff:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0106202:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0106209:	eb 3b                	jmp    c0106246 <sys_malloc2+0x1ff>
c010620b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010620e:	0f af 45 b8          	imul   -0x48(%ebp),%eax
c0106212:	89 c2                	mov    %eax,%edx
c0106214:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0106217:	01 d0                	add    %edx,%eax
c0106219:	89 45 a8             	mov    %eax,-0x58(%ebp)
c010621c:	8b 4d a8             	mov    -0x58(%ebp),%ecx
c010621f:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0106222:	89 d0                	mov    %edx,%eax
c0106224:	01 c0                	add    %eax,%eax
c0106226:	01 d0                	add    %edx,%eax
c0106228:	c1 e0 03             	shl    $0x3,%eax
c010622b:	89 c2                	mov    %eax,%edx
c010622d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106230:	01 d0                	add    %edx,%eax
c0106232:	83 c0 08             	add    $0x8,%eax
c0106235:	83 ec 08             	sub    $0x8,%esp
c0106238:	51                   	push   %ecx
c0106239:	50                   	push   %eax
c010623a:	e8 91 38 00 00       	call   c0109ad0 <appendToDoubleLinkList>
c010623f:	83 c4 10             	add    $0x10,%esp
c0106242:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0106246:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0106249:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c010624c:	77 bd                	ja     c010620b <sys_malloc2+0x1c4>
c010624e:	83 ec 0c             	sub    $0xc,%esp
c0106251:	ff 75 c4             	pushl  -0x3c(%ebp)
c0106254:	e8 ea 07 00 00       	call   c0106a43 <intr_set_status>
c0106259:	83 c4 10             	add    $0x10,%esp
c010625c:	8b 55 e8             	mov    -0x18(%ebp),%edx
c010625f:	89 d0                	mov    %edx,%eax
c0106261:	01 c0                	add    %eax,%eax
c0106263:	01 d0                	add    %edx,%eax
c0106265:	c1 e0 03             	shl    $0x3,%eax
c0106268:	89 c2                	mov    %eax,%edx
c010626a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010626d:	01 d0                	add    %edx,%eax
c010626f:	83 c0 08             	add    $0x8,%eax
c0106272:	83 ec 0c             	sub    $0xc,%esp
c0106275:	50                   	push   %eax
c0106276:	e8 bf 39 00 00       	call   c0109c3a <popFromDoubleLinkList>
c010627b:	83 c4 10             	add    $0x10,%esp
c010627e:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0106281:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0106284:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106287:	83 7d a8 00          	cmpl   $0x0,-0x58(%ebp)
c010628b:	75 1c                	jne    c01062a9 <sys_malloc2+0x262>
c010628d:	68 ef 01 00 00       	push   $0x1ef
c0106292:	68 55 a3 10 c0       	push   $0xc010a355
c0106297:	68 55 a3 10 c0       	push   $0xc010a355
c010629c:	68 76 a3 10 c0       	push   $0xc010a376
c01062a1:	e8 b1 21 00 00       	call   c0108457 <assertion_failure>
c01062a6:	83 c4 10             	add    $0x10,%esp
c01062a9:	8b 45 a8             	mov    -0x58(%ebp),%eax
c01062ac:	83 ec 0c             	sub    $0xc,%esp
c01062af:	50                   	push   %eax
c01062b0:	e8 7c fd ff ff       	call   c0106031 <block2arena>
c01062b5:	83 c4 10             	add    $0x10,%esp
c01062b8:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c01062bb:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c01062be:	8b 40 04             	mov    0x4(%eax),%eax
c01062c1:	8d 50 ff             	lea    -0x1(%eax),%edx
c01062c4:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c01062c7:	89 50 04             	mov    %edx,0x4(%eax)
c01062ca:	c7 45 c4 04 00 00 00 	movl   $0x4,-0x3c(%ebp)
c01062d1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01062d5:	75 1c                	jne    c01062f3 <sys_malloc2+0x2ac>
c01062d7:	68 f6 01 00 00       	push   $0x1f6
c01062dc:	68 55 a3 10 c0       	push   $0xc010a355
c01062e1:	68 55 a3 10 c0       	push   $0xc010a355
c01062e6:	68 88 a3 10 c0       	push   $0xc010a388
c01062eb:	e8 67 21 00 00       	call   c0108457 <assertion_failure>
c01062f0:	83 c4 10             	add    $0x10,%esp
c01062f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01062f6:	c9                   	leave  
c01062f7:	c3                   	ret    

c01062f8 <remove_map_entry>:
c01062f8:	55                   	push   %ebp
c01062f9:	89 e5                	mov    %esp,%ebp
c01062fb:	83 ec 10             	sub    $0x10,%esp
c01062fe:	ff 75 08             	pushl  0x8(%ebp)
c0106301:	e8 a6 f8 ff ff       	call   c0105bac <ptr_pte>
c0106306:	83 c4 04             	add    $0x4,%esp
c0106309:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010630c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010630f:	8b 10                	mov    (%eax),%edx
c0106311:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106314:	89 10                	mov    %edx,(%eax)
c0106316:	90                   	nop
c0106317:	c9                   	leave  
c0106318:	c3                   	ret    

c0106319 <free_a_page>:
c0106319:	55                   	push   %ebp
c010631a:	89 e5                	mov    %esp,%ebp
c010631c:	83 ec 20             	sub    $0x20,%esp
c010631f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0106323:	75 21                	jne    c0106346 <free_a_page+0x2d>
c0106325:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c010632a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010632d:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0106332:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106335:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c010633a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010633d:	c7 45 fc ac 06 11 c0 	movl   $0xc01106ac,-0x4(%ebp)
c0106344:	eb 1f                	jmp    c0106365 <free_a_page+0x4c>
c0106346:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c010634b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010634e:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0106353:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106356:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c010635b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010635e:	c7 45 fc f4 0e 11 c0 	movl   $0xc0110ef4,-0x4(%ebp)
c0106365:	8b 45 08             	mov    0x8(%ebp),%eax
c0106368:	c1 e8 0c             	shr    $0xc,%eax
c010636b:	89 45 f8             	mov    %eax,-0x8(%ebp)
c010636e:	6a 00                	push   $0x0
c0106370:	ff 75 f8             	pushl  -0x8(%ebp)
c0106373:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c0106376:	50                   	push   %eax
c0106377:	e8 7e f4 ff ff       	call   c01057fa <set_bit_val>
c010637c:	83 c4 0c             	add    $0xc,%esp
c010637f:	ff 75 08             	pushl  0x8(%ebp)
c0106382:	e8 27 fa ff ff       	call   c0105dae <get_physical_address>
c0106387:	83 c4 04             	add    $0x4,%esp
c010638a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010638d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106390:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106396:	85 c0                	test   %eax,%eax
c0106398:	0f 48 c2             	cmovs  %edx,%eax
c010639b:	c1 f8 0c             	sar    $0xc,%eax
c010639e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01063a1:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01063a4:	6a 00                	push   $0x0
c01063a6:	ff 75 f0             	pushl  -0x10(%ebp)
c01063a9:	50                   	push   %eax
c01063aa:	e8 4b f4 ff ff       	call   c01057fa <set_bit_val>
c01063af:	83 c4 0c             	add    $0xc,%esp
c01063b2:	ff 75 08             	pushl  0x8(%ebp)
c01063b5:	e8 3e ff ff ff       	call   c01062f8 <remove_map_entry>
c01063ba:	83 c4 04             	add    $0x4,%esp
c01063bd:	90                   	nop
c01063be:	c9                   	leave  
c01063bf:	c3                   	ret    

c01063c0 <sys_free2>:
c01063c0:	55                   	push   %ebp
c01063c1:	89 e5                	mov    %esp,%ebp
c01063c3:	83 ec 58             	sub    $0x58,%esp
c01063c6:	e8 cc 9f ff ff       	call   c0100397 <get_running_thread_pcb>
c01063cb:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01063ce:	e8 47 06 00 00       	call   c0106a1a <intr_disable>
c01063d3:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01063d6:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01063d9:	8b 40 08             	mov    0x8(%eax),%eax
c01063dc:	85 c0                	test   %eax,%eax
c01063de:	75 10                	jne    c01063f0 <sys_free2+0x30>
c01063e0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01063e7:	c7 45 f0 a0 37 18 c0 	movl   $0xc01837a0,-0x10(%ebp)
c01063ee:	eb 10                	jmp    c0106400 <sys_free2+0x40>
c01063f0:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c01063f7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01063fa:	83 c0 10             	add    $0x10,%eax
c01063fd:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0106400:	81 7d 0c 00 04 00 00 	cmpl   $0x400,0xc(%ebp)
c0106407:	76 4d                	jbe    c0106456 <sys_free2+0x96>
c0106409:	8b 45 08             	mov    0x8(%ebp),%eax
c010640c:	83 e8 0c             	sub    $0xc,%eax
c010640f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106412:	83 45 0c 0c          	addl   $0xc,0xc(%ebp)
c0106416:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106419:	05 ff 0f 00 00       	add    $0xfff,%eax
c010641e:	c1 e8 0c             	shr    $0xc,%eax
c0106421:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106424:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010642b:	eb 1c                	jmp    c0106449 <sys_free2+0x89>
c010642d:	83 ec 08             	sub    $0x8,%esp
c0106430:	ff 75 f4             	pushl  -0xc(%ebp)
c0106433:	ff 75 ec             	pushl  -0x14(%ebp)
c0106436:	e8 de fe ff ff       	call   c0106319 <free_a_page>
c010643b:	83 c4 10             	add    $0x10,%esp
c010643e:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
c0106445:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0106449:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010644c:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
c010644f:	77 dc                	ja     c010642d <sys_free2+0x6d>
c0106451:	e9 dc 00 00 00       	jmp    c0106532 <sys_free2+0x172>
c0106456:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c010645d:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0106464:	eb 26                	jmp    c010648c <sys_free2+0xcc>
c0106466:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0106469:	89 d0                	mov    %edx,%eax
c010646b:	01 c0                	add    %eax,%eax
c010646d:	01 d0                	add    %edx,%eax
c010646f:	c1 e0 03             	shl    $0x3,%eax
c0106472:	89 c2                	mov    %eax,%edx
c0106474:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106477:	01 d0                	add    %edx,%eax
c0106479:	8b 00                	mov    (%eax),%eax
c010647b:	39 45 0c             	cmp    %eax,0xc(%ebp)
c010647e:	77 08                	ja     c0106488 <sys_free2+0xc8>
c0106480:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0106483:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106486:	eb 0a                	jmp    c0106492 <sys_free2+0xd2>
c0106488:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c010648c:	83 7d e0 09          	cmpl   $0x9,-0x20(%ebp)
c0106490:	7e d4                	jle    c0106466 <sys_free2+0xa6>
c0106492:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0106495:	89 d0                	mov    %edx,%eax
c0106497:	01 c0                	add    %eax,%eax
c0106499:	01 d0                	add    %edx,%eax
c010649b:	c1 e0 03             	shl    $0x3,%eax
c010649e:	89 c2                	mov    %eax,%edx
c01064a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01064a3:	01 d0                	add    %edx,%eax
c01064a5:	8b 10                	mov    (%eax),%edx
c01064a7:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c01064aa:	8b 50 04             	mov    0x4(%eax),%edx
c01064ad:	89 55 b8             	mov    %edx,-0x48(%ebp)
c01064b0:	8b 50 08             	mov    0x8(%eax),%edx
c01064b3:	89 55 bc             	mov    %edx,-0x44(%ebp)
c01064b6:	8b 50 0c             	mov    0xc(%eax),%edx
c01064b9:	89 55 c0             	mov    %edx,-0x40(%ebp)
c01064bc:	8b 50 10             	mov    0x10(%eax),%edx
c01064bf:	89 55 c4             	mov    %edx,-0x3c(%ebp)
c01064c2:	8b 40 14             	mov    0x14(%eax),%eax
c01064c5:	89 45 c8             	mov    %eax,-0x38(%ebp)
c01064c8:	8b 45 08             	mov    0x8(%ebp),%eax
c01064cb:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01064ce:	83 ec 0c             	sub    $0xc,%esp
c01064d1:	ff 75 d0             	pushl  -0x30(%ebp)
c01064d4:	e8 58 fb ff ff       	call   c0106031 <block2arena>
c01064d9:	83 c4 10             	add    $0x10,%esp
c01064dc:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01064df:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01064e2:	89 d0                	mov    %edx,%eax
c01064e4:	01 c0                	add    %eax,%eax
c01064e6:	01 d0                	add    %edx,%eax
c01064e8:	c1 e0 03             	shl    $0x3,%eax
c01064eb:	89 c2                	mov    %eax,%edx
c01064ed:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01064f0:	01 d0                	add    %edx,%eax
c01064f2:	83 c0 08             	add    $0x8,%eax
c01064f5:	83 ec 08             	sub    $0x8,%esp
c01064f8:	ff 75 d0             	pushl  -0x30(%ebp)
c01064fb:	50                   	push   %eax
c01064fc:	e8 cf 35 00 00       	call   c0109ad0 <appendToDoubleLinkList>
c0106501:	83 c4 10             	add    $0x10,%esp
c0106504:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0106507:	8b 40 04             	mov    0x4(%eax),%eax
c010650a:	8d 50 01             	lea    0x1(%eax),%edx
c010650d:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0106510:	89 50 04             	mov    %edx,0x4(%eax)
c0106513:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0106516:	8b 50 04             	mov    0x4(%eax),%edx
c0106519:	8b 45 b8             	mov    -0x48(%ebp),%eax
c010651c:	39 c2                	cmp    %eax,%edx
c010651e:	75 12                	jne    c0106532 <sys_free2+0x172>
c0106520:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0106523:	83 ec 08             	sub    $0x8,%esp
c0106526:	ff 75 f4             	pushl  -0xc(%ebp)
c0106529:	50                   	push   %eax
c010652a:	e8 ea fd ff ff       	call   c0106319 <free_a_page>
c010652f:	83 c4 10             	add    $0x10,%esp
c0106532:	83 ec 0c             	sub    $0xc,%esp
c0106535:	ff 75 d8             	pushl  -0x28(%ebp)
c0106538:	e8 06 05 00 00       	call   c0106a43 <intr_set_status>
c010653d:	83 c4 10             	add    $0x10,%esp
c0106540:	90                   	nop
c0106541:	c9                   	leave  
c0106542:	c3                   	ret    

c0106543 <init_memory_block_desc>:
c0106543:	55                   	push   %ebp
c0106544:	89 e5                	mov    %esp,%ebp
c0106546:	83 ec 18             	sub    $0x18,%esp
c0106549:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106550:	e9 b2 00 00 00       	jmp    c0106607 <init_memory_block_desc+0xc4>
c0106555:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0106559:	75 1b                	jne    c0106576 <init_memory_block_desc+0x33>
c010655b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010655e:	89 d0                	mov    %edx,%eax
c0106560:	01 c0                	add    %eax,%eax
c0106562:	01 d0                	add    %edx,%eax
c0106564:	c1 e0 03             	shl    $0x3,%eax
c0106567:	89 c2                	mov    %eax,%edx
c0106569:	8b 45 08             	mov    0x8(%ebp),%eax
c010656c:	01 d0                	add    %edx,%eax
c010656e:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0106574:	eb 2e                	jmp    c01065a4 <init_memory_block_desc+0x61>
c0106576:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106579:	89 d0                	mov    %edx,%eax
c010657b:	01 c0                	add    %eax,%eax
c010657d:	01 d0                	add    %edx,%eax
c010657f:	c1 e0 03             	shl    $0x3,%eax
c0106582:	8d 50 e8             	lea    -0x18(%eax),%edx
c0106585:	8b 45 08             	mov    0x8(%ebp),%eax
c0106588:	01 d0                	add    %edx,%eax
c010658a:	8b 08                	mov    (%eax),%ecx
c010658c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010658f:	89 d0                	mov    %edx,%eax
c0106591:	01 c0                	add    %eax,%eax
c0106593:	01 d0                	add    %edx,%eax
c0106595:	c1 e0 03             	shl    $0x3,%eax
c0106598:	89 c2                	mov    %eax,%edx
c010659a:	8b 45 08             	mov    0x8(%ebp),%eax
c010659d:	01 d0                	add    %edx,%eax
c010659f:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
c01065a2:	89 10                	mov    %edx,(%eax)
c01065a4:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01065a7:	89 d0                	mov    %edx,%eax
c01065a9:	01 c0                	add    %eax,%eax
c01065ab:	01 d0                	add    %edx,%eax
c01065ad:	c1 e0 03             	shl    $0x3,%eax
c01065b0:	89 c2                	mov    %eax,%edx
c01065b2:	8b 45 08             	mov    0x8(%ebp),%eax
c01065b5:	01 d0                	add    %edx,%eax
c01065b7:	8b 00                	mov    (%eax),%eax
c01065b9:	89 c1                	mov    %eax,%ecx
c01065bb:	b8 f4 0f 00 00       	mov    $0xff4,%eax
c01065c0:	ba 00 00 00 00       	mov    $0x0,%edx
c01065c5:	f7 f1                	div    %ecx
c01065c7:	89 c1                	mov    %eax,%ecx
c01065c9:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01065cc:	89 d0                	mov    %edx,%eax
c01065ce:	01 c0                	add    %eax,%eax
c01065d0:	01 d0                	add    %edx,%eax
c01065d2:	c1 e0 03             	shl    $0x3,%eax
c01065d5:	89 c2                	mov    %eax,%edx
c01065d7:	8b 45 08             	mov    0x8(%ebp),%eax
c01065da:	01 d0                	add    %edx,%eax
c01065dc:	89 ca                	mov    %ecx,%edx
c01065de:	89 50 04             	mov    %edx,0x4(%eax)
c01065e1:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01065e4:	89 d0                	mov    %edx,%eax
c01065e6:	01 c0                	add    %eax,%eax
c01065e8:	01 d0                	add    %edx,%eax
c01065ea:	c1 e0 03             	shl    $0x3,%eax
c01065ed:	89 c2                	mov    %eax,%edx
c01065ef:	8b 45 08             	mov    0x8(%ebp),%eax
c01065f2:	01 d0                	add    %edx,%eax
c01065f4:	83 c0 08             	add    $0x8,%eax
c01065f7:	83 ec 0c             	sub    $0xc,%esp
c01065fa:	50                   	push   %eax
c01065fb:	e8 a5 33 00 00       	call   c01099a5 <initDoubleLinkList>
c0106600:	83 c4 10             	add    $0x10,%esp
c0106603:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0106607:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c010660b:	0f 8e 44 ff ff ff    	jle    c0106555 <init_memory_block_desc+0x12>
c0106611:	90                   	nop
c0106612:	c9                   	leave  
c0106613:	c3                   	ret    

c0106614 <init_memory2>:
c0106614:	55                   	push   %ebp
c0106615:	89 e5                	mov    %esp,%ebp
c0106617:	83 ec 38             	sub    $0x38,%esp
c010661a:	c7 45 f4 00 00 00 02 	movl   $0x2000000,-0xc(%ebp)
c0106621:	c7 45 f0 00 20 10 00 	movl   $0x102000,-0x10(%ebp)
c0106628:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010662b:	a3 b4 06 11 c0       	mov    %eax,0xc01106b4
c0106630:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106633:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106638:	29 c2                	sub    %eax,%edx
c010663a:	89 d0                	mov    %edx,%eax
c010663c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010663f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106642:	89 c2                	mov    %eax,%edx
c0106644:	c1 ea 1f             	shr    $0x1f,%edx
c0106647:	01 d0                	add    %edx,%eax
c0106649:	d1 f8                	sar    %eax
c010664b:	a3 b8 06 11 c0       	mov    %eax,0xc01106b8
c0106650:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c0106655:	83 ec 0c             	sub    $0xc,%esp
c0106658:	50                   	push   %eax
c0106659:	e8 09 08 00 00       	call   c0106e67 <disp_int>
c010665e:	83 c4 10             	add    $0x10,%esp
c0106661:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c0106666:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106669:	29 c2                	sub    %eax,%edx
c010666b:	89 d0                	mov    %edx,%eax
c010666d:	a3 00 0f 11 c0       	mov    %eax,0xc0110f00
c0106672:	83 ec 0c             	sub    $0xc,%esp
c0106675:	68 94 a3 10 c0       	push   $0xc010a394
c010667a:	e8 0d 9a ff ff       	call   c010008c <disp_str>
c010667f:	83 c4 10             	add    $0x10,%esp
c0106682:	a1 00 0f 11 c0       	mov    0xc0110f00,%eax
c0106687:	83 ec 0c             	sub    $0xc,%esp
c010668a:	50                   	push   %eax
c010668b:	e8 d7 07 00 00       	call   c0106e67 <disp_int>
c0106690:	83 c4 10             	add    $0x10,%esp
c0106693:	83 ec 0c             	sub    $0xc,%esp
c0106696:	68 94 a3 10 c0       	push   $0xc010a394
c010669b:	e8 ec 99 ff ff       	call   c010008c <disp_str>
c01066a0:	83 c4 10             	add    $0x10,%esp
c01066a3:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c01066a8:	05 ff 0f 00 00       	add    $0xfff,%eax
c01066ad:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c01066b3:	85 c0                	test   %eax,%eax
c01066b5:	0f 48 c2             	cmovs  %edx,%eax
c01066b8:	c1 f8 0c             	sar    $0xc,%eax
c01066bb:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01066be:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01066c1:	83 c0 07             	add    $0x7,%eax
c01066c4:	8d 50 07             	lea    0x7(%eax),%edx
c01066c7:	85 c0                	test   %eax,%eax
c01066c9:	0f 48 c2             	cmovs  %edx,%eax
c01066cc:	c1 f8 03             	sar    $0x3,%eax
c01066cf:	a3 b0 06 11 c0       	mov    %eax,0xc01106b0
c01066d4:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c01066d9:	2d 00 00 00 40       	sub    $0x40000000,%eax
c01066de:	a3 ac 06 11 c0       	mov    %eax,0xc01106ac
c01066e3:	8b 15 b0 06 11 c0    	mov    0xc01106b0,%edx
c01066e9:	a1 ac 06 11 c0       	mov    0xc01106ac,%eax
c01066ee:	83 ec 04             	sub    $0x4,%esp
c01066f1:	52                   	push   %edx
c01066f2:	6a 00                	push   $0x0
c01066f4:	50                   	push   %eax
c01066f5:	e8 25 45 00 00       	call   c010ac1f <Memset>
c01066fa:	83 c4 10             	add    $0x10,%esp
c01066fd:	a1 b0 06 11 c0       	mov    0xc01106b0,%eax
c0106702:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106707:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c010670d:	85 c0                	test   %eax,%eax
c010670f:	0f 48 c2             	cmovs  %edx,%eax
c0106712:	c1 f8 0c             	sar    $0xc,%eax
c0106715:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106718:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010671b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010671e:	ff 75 e8             	pushl  -0x18(%ebp)
c0106721:	6a 01                	push   $0x1
c0106723:	6a 00                	push   $0x0
c0106725:	68 ac 06 11 c0       	push   $0xc01106ac
c010672a:	e8 46 f1 ff ff       	call   c0105875 <set_bits>
c010672f:	83 c4 10             	add    $0x10,%esp
c0106732:	a1 00 0f 11 c0       	mov    0xc0110f00,%eax
c0106737:	05 ff 0f 00 00       	add    $0xfff,%eax
c010673c:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106742:	85 c0                	test   %eax,%eax
c0106744:	0f 48 c2             	cmovs  %edx,%eax
c0106747:	c1 f8 0c             	sar    $0xc,%eax
c010674a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010674d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106750:	83 c0 07             	add    $0x7,%eax
c0106753:	8d 50 07             	lea    0x7(%eax),%edx
c0106756:	85 c0                	test   %eax,%eax
c0106758:	0f 48 c2             	cmovs  %edx,%eax
c010675b:	c1 f8 03             	sar    $0x3,%eax
c010675e:	a3 f8 0e 11 c0       	mov    %eax,0xc0110ef8
c0106763:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106768:	8b 15 b0 06 11 c0    	mov    0xc01106b0,%edx
c010676e:	01 d0                	add    %edx,%eax
c0106770:	a3 f4 0e 11 c0       	mov    %eax,0xc0110ef4
c0106775:	8b 15 f8 0e 11 c0    	mov    0xc0110ef8,%edx
c010677b:	a1 f4 0e 11 c0       	mov    0xc0110ef4,%eax
c0106780:	83 ec 04             	sub    $0x4,%esp
c0106783:	52                   	push   %edx
c0106784:	6a 00                	push   $0x0
c0106786:	50                   	push   %eax
c0106787:	e8 93 44 00 00       	call   c010ac1f <Memset>
c010678c:	83 c4 10             	add    $0x10,%esp
c010678f:	a1 f8 0e 11 c0       	mov    0xc0110ef8,%eax
c0106794:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106799:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c010679f:	85 c0                	test   %eax,%eax
c01067a1:	0f 48 c2             	cmovs  %edx,%eax
c01067a4:	c1 f8 0c             	sar    $0xc,%eax
c01067a7:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01067aa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01067ad:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01067b0:	ff 75 e8             	pushl  -0x18(%ebp)
c01067b3:	6a 01                	push   $0x1
c01067b5:	ff 75 e0             	pushl  -0x20(%ebp)
c01067b8:	68 ac 06 11 c0       	push   $0xc01106ac
c01067bd:	e8 b3 f0 ff ff       	call   c0105875 <set_bits>
c01067c2:	83 c4 10             	add    $0x10,%esp
c01067c5:	c7 45 dc 00 00 10 00 	movl   $0x100000,-0x24(%ebp)
c01067cc:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01067cf:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01067d2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01067d5:	83 c0 07             	add    $0x7,%eax
c01067d8:	8d 50 07             	lea    0x7(%eax),%edx
c01067db:	85 c0                	test   %eax,%eax
c01067dd:	0f 48 c2             	cmovs  %edx,%eax
c01067e0:	c1 f8 03             	sar    $0x3,%eax
c01067e3:	a3 98 f7 10 c0       	mov    %eax,0xc010f798
c01067e8:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c01067ed:	8b 15 b0 06 11 c0    	mov    0xc01106b0,%edx
c01067f3:	01 c2                	add    %eax,%edx
c01067f5:	a1 f8 0e 11 c0       	mov    0xc0110ef8,%eax
c01067fa:	01 d0                	add    %edx,%eax
c01067fc:	a3 94 f7 10 c0       	mov    %eax,0xc010f794
c0106801:	8b 15 98 f7 10 c0    	mov    0xc010f798,%edx
c0106807:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c010680c:	83 ec 04             	sub    $0x4,%esp
c010680f:	52                   	push   %edx
c0106810:	6a 00                	push   $0x0
c0106812:	50                   	push   %eax
c0106813:	e8 07 44 00 00       	call   c010ac1f <Memset>
c0106818:	83 c4 10             	add    $0x10,%esp
c010681b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c010681e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106821:	01 d0                	add    %edx,%eax
c0106823:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106826:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c010682b:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106830:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106836:	85 c0                	test   %eax,%eax
c0106838:	0f 48 c2             	cmovs  %edx,%eax
c010683b:	c1 f8 0c             	sar    $0xc,%eax
c010683e:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106841:	ff 75 e8             	pushl  -0x18(%ebp)
c0106844:	6a 01                	push   $0x1
c0106846:	ff 75 e0             	pushl  -0x20(%ebp)
c0106849:	68 ac 06 11 c0       	push   $0xc01106ac
c010684e:	e8 22 f0 ff ff       	call   c0105875 <set_bits>
c0106853:	83 c4 10             	add    $0x10,%esp
c0106856:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0106859:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010685c:	01 d0                	add    %edx,%eax
c010685e:	c1 e0 0c             	shl    $0xc,%eax
c0106861:	a3 9c f7 10 c0       	mov    %eax,0xc010f79c
c0106866:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106869:	83 c0 02             	add    $0x2,%eax
c010686c:	c1 e0 0c             	shl    $0xc,%eax
c010686f:	89 c2                	mov    %eax,%edx
c0106871:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106874:	01 d0                	add    %edx,%eax
c0106876:	a3 9c f7 10 c0       	mov    %eax,0xc010f79c
c010687b:	c7 45 d8 05 00 00 00 	movl   $0x5,-0x28(%ebp)
c0106882:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106885:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106888:	90                   	nop
c0106889:	c9                   	leave  
c010688a:	c3                   	ret    

c010688b <init_memory>:
c010688b:	55                   	push   %ebp
c010688c:	89 e5                	mov    %esp,%ebp
c010688e:	83 ec 38             	sub    $0x38,%esp
c0106891:	c7 45 f4 00 00 02 c0 	movl   $0xc0020000,-0xc(%ebp)
c0106898:	c7 45 f0 00 00 40 c0 	movl   $0xc0400000,-0x10(%ebp)
c010689f:	c7 45 ec 00 00 10 00 	movl   $0x100000,-0x14(%ebp)
c01068a6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01068a9:	05 00 00 40 00       	add    $0x400000,%eax
c01068ae:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01068b1:	8b 45 08             	mov    0x8(%ebp),%eax
c01068b4:	2b 45 e8             	sub    -0x18(%ebp),%eax
c01068b7:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c01068bd:	85 c0                	test   %eax,%eax
c01068bf:	0f 48 c2             	cmovs  %edx,%eax
c01068c2:	c1 f8 0c             	sar    $0xc,%eax
c01068c5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01068c8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01068cb:	89 c2                	mov    %eax,%edx
c01068cd:	c1 ea 1f             	shr    $0x1f,%edx
c01068d0:	01 d0                	add    %edx,%eax
c01068d2:	d1 f8                	sar    %eax
c01068d4:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01068d7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01068da:	2b 45 e0             	sub    -0x20(%ebp),%eax
c01068dd:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01068e0:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01068e3:	8d 50 07             	lea    0x7(%eax),%edx
c01068e6:	85 c0                	test   %eax,%eax
c01068e8:	0f 48 c2             	cmovs  %edx,%eax
c01068eb:	c1 f8 03             	sar    $0x3,%eax
c01068ee:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01068f1:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01068f4:	8d 50 07             	lea    0x7(%eax),%edx
c01068f7:	85 c0                	test   %eax,%eax
c01068f9:	0f 48 c2             	cmovs  %edx,%eax
c01068fc:	c1 f8 03             	sar    $0x3,%eax
c01068ff:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106902:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106905:	a3 b4 06 11 c0       	mov    %eax,0xc01106b4
c010690a:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c010690f:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0106912:	c1 e2 0c             	shl    $0xc,%edx
c0106915:	01 d0                	add    %edx,%eax
c0106917:	a3 fc 0e 11 c0       	mov    %eax,0xc0110efc
c010691c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010691f:	a3 ac 06 11 c0       	mov    %eax,0xc01106ac
c0106924:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106927:	a3 b0 06 11 c0       	mov    %eax,0xc01106b0
c010692c:	a1 ac 06 11 c0       	mov    0xc01106ac,%eax
c0106931:	83 ec 04             	sub    $0x4,%esp
c0106934:	ff 75 d8             	pushl  -0x28(%ebp)
c0106937:	6a 00                	push   $0x0
c0106939:	50                   	push   %eax
c010693a:	e8 e0 42 00 00       	call   c010ac1f <Memset>
c010693f:	83 c4 10             	add    $0x10,%esp
c0106942:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106945:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106948:	01 d0                	add    %edx,%eax
c010694a:	a3 f4 0e 11 c0       	mov    %eax,0xc0110ef4
c010694f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106952:	a3 f8 0e 11 c0       	mov    %eax,0xc0110ef8
c0106957:	a1 f4 0e 11 c0       	mov    0xc0110ef4,%eax
c010695c:	83 ec 04             	sub    $0x4,%esp
c010695f:	ff 75 d4             	pushl  -0x2c(%ebp)
c0106962:	6a 00                	push   $0x0
c0106964:	50                   	push   %eax
c0106965:	e8 b5 42 00 00       	call   c010ac1f <Memset>
c010696a:	83 c4 10             	add    $0x10,%esp
c010696d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106970:	a3 98 f7 10 c0       	mov    %eax,0xc010f798
c0106975:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106978:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010697b:	01 c2                	add    %eax,%edx
c010697d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106980:	01 d0                	add    %edx,%eax
c0106982:	a3 94 f7 10 c0       	mov    %eax,0xc010f794
c0106987:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010698a:	05 00 00 10 00       	add    $0x100000,%eax
c010698f:	a3 9c f7 10 c0       	mov    %eax,0xc010f79c
c0106994:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0106999:	83 ec 04             	sub    $0x4,%esp
c010699c:	ff 75 d8             	pushl  -0x28(%ebp)
c010699f:	6a 00                	push   $0x0
c01069a1:	50                   	push   %eax
c01069a2:	e8 78 42 00 00       	call   c010ac1f <Memset>
c01069a7:	83 c4 10             	add    $0x10,%esp
c01069aa:	83 ec 04             	sub    $0x4,%esp
c01069ad:	68 f0 00 00 00       	push   $0xf0
c01069b2:	6a 00                	push   $0x0
c01069b4:	68 a0 37 18 c0       	push   $0xc01837a0
c01069b9:	e8 61 42 00 00       	call   c010ac1f <Memset>
c01069be:	83 c4 10             	add    $0x10,%esp
c01069c1:	83 ec 0c             	sub    $0xc,%esp
c01069c4:	68 a0 37 18 c0       	push   $0xc01837a0
c01069c9:	e8 75 fb ff ff       	call   c0106543 <init_memory_block_desc>
c01069ce:	83 c4 10             	add    $0x10,%esp
c01069d1:	90                   	nop
c01069d2:	c9                   	leave  
c01069d3:	c3                   	ret    

c01069d4 <catch_error>:
c01069d4:	55                   	push   %ebp
c01069d5:	89 e5                	mov    %esp,%ebp
c01069d7:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c01069dc:	83 c0 01             	add    $0x1,%eax
c01069df:	a3 c4 fb 10 c0       	mov    %eax,0xc010fbc4
c01069e4:	a1 a4 f7 10 c0       	mov    0xc010f7a4,%eax
c01069e9:	a3 a0 f7 10 c0       	mov    %eax,0xc010f7a0
c01069ee:	90                   	nop
c01069ef:	5d                   	pop    %ebp
c01069f0:	c3                   	ret    

c01069f1 <intr_enable>:
c01069f1:	55                   	push   %ebp
c01069f2:	89 e5                	mov    %esp,%ebp
c01069f4:	83 ec 18             	sub    $0x18,%esp
c01069f7:	e8 65 00 00 00       	call   c0106a61 <intr_get_status>
c01069fc:	83 f8 01             	cmp    $0x1,%eax
c01069ff:	75 0c                	jne    c0106a0d <intr_enable+0x1c>
c0106a01:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0106a08:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106a0b:	eb 0b                	jmp    c0106a18 <intr_enable+0x27>
c0106a0d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106a14:	fb                   	sti    
c0106a15:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106a18:	c9                   	leave  
c0106a19:	c3                   	ret    

c0106a1a <intr_disable>:
c0106a1a:	55                   	push   %ebp
c0106a1b:	89 e5                	mov    %esp,%ebp
c0106a1d:	83 ec 18             	sub    $0x18,%esp
c0106a20:	e8 3c 00 00 00       	call   c0106a61 <intr_get_status>
c0106a25:	83 f8 01             	cmp    $0x1,%eax
c0106a28:	75 0d                	jne    c0106a37 <intr_disable+0x1d>
c0106a2a:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0106a31:	fa                   	cli    
c0106a32:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106a35:	eb 0a                	jmp    c0106a41 <intr_disable+0x27>
c0106a37:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106a3e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106a41:	c9                   	leave  
c0106a42:	c3                   	ret    

c0106a43 <intr_set_status>:
c0106a43:	55                   	push   %ebp
c0106a44:	89 e5                	mov    %esp,%ebp
c0106a46:	83 ec 08             	sub    $0x8,%esp
c0106a49:	8b 45 08             	mov    0x8(%ebp),%eax
c0106a4c:	83 e0 01             	and    $0x1,%eax
c0106a4f:	85 c0                	test   %eax,%eax
c0106a51:	74 07                	je     c0106a5a <intr_set_status+0x17>
c0106a53:	e8 99 ff ff ff       	call   c01069f1 <intr_enable>
c0106a58:	eb 05                	jmp    c0106a5f <intr_set_status+0x1c>
c0106a5a:	e8 bb ff ff ff       	call   c0106a1a <intr_disable>
c0106a5f:	c9                   	leave  
c0106a60:	c3                   	ret    

c0106a61 <intr_get_status>:
c0106a61:	55                   	push   %ebp
c0106a62:	89 e5                	mov    %esp,%ebp
c0106a64:	83 ec 10             	sub    $0x10,%esp
c0106a67:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0106a6e:	9c                   	pushf  
c0106a6f:	58                   	pop    %eax
c0106a70:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0106a73:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106a76:	c1 e8 09             	shr    $0x9,%eax
c0106a79:	83 e0 01             	and    $0x1,%eax
c0106a7c:	c9                   	leave  
c0106a7d:	c3                   	ret    

c0106a7e <Memcpy>:
c0106a7e:	55                   	push   %ebp
c0106a7f:	89 e5                	mov    %esp,%ebp
c0106a81:	83 ec 18             	sub    $0x18,%esp
c0106a84:	e8 91 ff ff ff       	call   c0106a1a <intr_disable>
c0106a89:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106a8c:	83 ec 04             	sub    $0x4,%esp
c0106a8f:	ff 75 10             	pushl  0x10(%ebp)
c0106a92:	ff 75 0c             	pushl  0xc(%ebp)
c0106a95:	ff 75 08             	pushl  0x8(%ebp)
c0106a98:	e8 54 41 00 00       	call   c010abf1 <Memcpy2>
c0106a9d:	83 c4 10             	add    $0x10,%esp
c0106aa0:	83 ec 0c             	sub    $0xc,%esp
c0106aa3:	ff 75 f4             	pushl  -0xc(%ebp)
c0106aa6:	e8 98 ff ff ff       	call   c0106a43 <intr_set_status>
c0106aab:	83 c4 10             	add    $0x10,%esp
c0106aae:	90                   	nop
c0106aaf:	c9                   	leave  
c0106ab0:	c3                   	ret    

c0106ab1 <untar>:
c0106ab1:	55                   	push   %ebp
c0106ab2:	89 e5                	mov    %esp,%ebp
c0106ab4:	81 ec 48 0a 00 00    	sub    $0xa48,%esp
c0106aba:	83 ec 08             	sub    $0x8,%esp
c0106abd:	6a 00                	push   $0x0
c0106abf:	ff 75 08             	pushl  0x8(%ebp)
c0106ac2:	e8 67 de ff ff       	call   c010492e <open>
c0106ac7:	83 c4 10             	add    $0x10,%esp
c0106aca:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106acd:	83 ec 0c             	sub    $0xc,%esp
c0106ad0:	68 a0 a3 10 c0       	push   $0xc010a3a0
c0106ad5:	e8 20 16 00 00       	call   c01080fa <Printf>
c0106ada:	83 c4 10             	add    $0x10,%esp
c0106add:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0106ae4:	c7 45 dc 00 02 00 00 	movl   $0x200,-0x24(%ebp)
c0106aeb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106af2:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0106af9:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0106b00:	e9 5e 02 00 00       	jmp    c0106d63 <untar+0x2b2>
c0106b05:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0106b09:	7e 58                	jle    c0106b63 <untar+0xb2>
c0106b0b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106b0e:	05 ff 01 00 00       	add    $0x1ff,%eax
c0106b13:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0106b19:	85 c0                	test   %eax,%eax
c0106b1b:	0f 48 c2             	cmovs  %edx,%eax
c0106b1e:	c1 f8 09             	sar    $0x9,%eax
c0106b21:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106b24:	83 ec 04             	sub    $0x4,%esp
c0106b27:	68 00 02 00 00       	push   $0x200
c0106b2c:	6a 00                	push   $0x0
c0106b2e:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106b34:	50                   	push   %eax
c0106b35:	e8 e5 40 00 00       	call   c010ac1f <Memset>
c0106b3a:	83 c4 10             	add    $0x10,%esp
c0106b3d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106b40:	c1 e0 09             	shl    $0x9,%eax
c0106b43:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0106b46:	83 ec 04             	sub    $0x4,%esp
c0106b49:	50                   	push   %eax
c0106b4a:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106b50:	50                   	push   %eax
c0106b51:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106b54:	e8 6a de ff ff       	call   c01049c3 <read>
c0106b59:	83 c4 10             	add    $0x10,%esp
c0106b5c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106b63:	83 ec 04             	sub    $0x4,%esp
c0106b66:	68 00 02 00 00       	push   $0x200
c0106b6b:	6a 00                	push   $0x0
c0106b6d:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106b73:	50                   	push   %eax
c0106b74:	e8 a6 40 00 00       	call   c010ac1f <Memset>
c0106b79:	83 c4 10             	add    $0x10,%esp
c0106b7c:	83 ec 04             	sub    $0x4,%esp
c0106b7f:	68 00 02 00 00       	push   $0x200
c0106b84:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106b8a:	50                   	push   %eax
c0106b8b:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106b8e:	e8 30 de ff ff       	call   c01049c3 <read>
c0106b93:	83 c4 10             	add    $0x10,%esp
c0106b96:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0106b99:	83 ec 0c             	sub    $0xc,%esp
c0106b9c:	68 b2 a3 10 c0       	push   $0xc010a3b2
c0106ba1:	e8 54 15 00 00       	call   c01080fa <Printf>
c0106ba6:	83 c4 10             	add    $0x10,%esp
c0106ba9:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0106bad:	0f 84 bc 01 00 00    	je     c0106d6f <untar+0x2be>
c0106bb3:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106bb6:	01 45 f4             	add    %eax,-0xc(%ebp)
c0106bb9:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0106bc0:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106bc6:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0106bc9:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106bcc:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0106bcf:	83 ec 08             	sub    $0x8,%esp
c0106bd2:	6a 07                	push   $0x7
c0106bd4:	ff 75 cc             	pushl  -0x34(%ebp)
c0106bd7:	e8 52 dd ff ff       	call   c010492e <open>
c0106bdc:	83 c4 10             	add    $0x10,%esp
c0106bdf:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0106be2:	83 ec 0c             	sub    $0xc,%esp
c0106be5:	68 c4 a3 10 c0       	push   $0xc010a3c4
c0106bea:	e8 0b 15 00 00       	call   c01080fa <Printf>
c0106bef:	83 c4 10             	add    $0x10,%esp
c0106bf2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0106bf9:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106bfc:	83 c0 7c             	add    $0x7c,%eax
c0106bff:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0106c02:	83 ec 0c             	sub    $0xc,%esp
c0106c05:	ff 75 cc             	pushl  -0x34(%ebp)
c0106c08:	e8 4b 40 00 00       	call   c010ac58 <Strlen>
c0106c0d:	83 c4 10             	add    $0x10,%esp
c0106c10:	85 c0                	test   %eax,%eax
c0106c12:	75 28                	jne    c0106c3c <untar+0x18b>
c0106c14:	83 ec 0c             	sub    $0xc,%esp
c0106c17:	ff 75 c4             	pushl  -0x3c(%ebp)
c0106c1a:	e8 39 40 00 00       	call   c010ac58 <Strlen>
c0106c1f:	83 c4 10             	add    $0x10,%esp
c0106c22:	85 c0                	test   %eax,%eax
c0106c24:	75 16                	jne    c0106c3c <untar+0x18b>
c0106c26:	83 ec 0c             	sub    $0xc,%esp
c0106c29:	68 d6 a3 10 c0       	push   $0xc010a3d6
c0106c2e:	e8 c7 14 00 00       	call   c01080fa <Printf>
c0106c33:	83 c4 10             	add    $0x10,%esp
c0106c36:	90                   	nop
c0106c37:	e9 34 01 00 00       	jmp    c0106d70 <untar+0x2bf>
c0106c3c:	83 ec 0c             	sub    $0xc,%esp
c0106c3f:	68 dd a3 10 c0       	push   $0xc010a3dd
c0106c44:	e8 b1 14 00 00       	call   c01080fa <Printf>
c0106c49:	83 c4 10             	add    $0x10,%esp
c0106c4c:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0106c4f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106c52:	eb 1f                	jmp    c0106c73 <untar+0x1c2>
c0106c54:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106c57:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0106c5e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106c61:	0f b6 00             	movzbl (%eax),%eax
c0106c64:	0f be c0             	movsbl %al,%eax
c0106c67:	83 e8 30             	sub    $0x30,%eax
c0106c6a:	01 d0                	add    %edx,%eax
c0106c6c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106c6f:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0106c73:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106c76:	0f b6 00             	movzbl (%eax),%eax
c0106c79:	84 c0                	test   %al,%al
c0106c7b:	75 d7                	jne    c0106c54 <untar+0x1a3>
c0106c7d:	83 ec 0c             	sub    $0xc,%esp
c0106c80:	68 eb a3 10 c0       	push   $0xc010a3eb
c0106c85:	e8 70 14 00 00       	call   c01080fa <Printf>
c0106c8a:	83 c4 10             	add    $0x10,%esp
c0106c8d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106c90:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0106c93:	c7 45 bc 00 08 00 00 	movl   $0x800,-0x44(%ebp)
c0106c9a:	83 ec 08             	sub    $0x8,%esp
c0106c9d:	ff 75 c0             	pushl  -0x40(%ebp)
c0106ca0:	68 f9 a3 10 c0       	push   $0xc010a3f9
c0106ca5:	e8 50 14 00 00       	call   c01080fa <Printf>
c0106caa:	83 c4 10             	add    $0x10,%esp
c0106cad:	83 ec 08             	sub    $0x8,%esp
c0106cb0:	ff 75 c0             	pushl  -0x40(%ebp)
c0106cb3:	68 0b a4 10 c0       	push   $0xc010a40b
c0106cb8:	e8 3d 14 00 00       	call   c01080fa <Printf>
c0106cbd:	83 c4 10             	add    $0x10,%esp
c0106cc0:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0106cc3:	39 45 bc             	cmp    %eax,-0x44(%ebp)
c0106cc6:	0f 4e 45 bc          	cmovle -0x44(%ebp),%eax
c0106cca:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0106ccd:	83 ec 04             	sub    $0x4,%esp
c0106cd0:	ff 75 b8             	pushl  -0x48(%ebp)
c0106cd3:	8d 85 b8 f5 ff ff    	lea    -0xa48(%ebp),%eax
c0106cd9:	50                   	push   %eax
c0106cda:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106cdd:	e8 e1 dc ff ff       	call   c01049c3 <read>
c0106ce2:	83 c4 10             	add    $0x10,%esp
c0106ce5:	01 45 f4             	add    %eax,-0xc(%ebp)
c0106ce8:	83 ec 04             	sub    $0x4,%esp
c0106ceb:	ff 75 b8             	pushl  -0x48(%ebp)
c0106cee:	8d 85 b8 f5 ff ff    	lea    -0xa48(%ebp),%eax
c0106cf4:	50                   	push   %eax
c0106cf5:	ff 75 c8             	pushl  -0x38(%ebp)
c0106cf8:	e8 47 de ff ff       	call   c0104b44 <write>
c0106cfd:	83 c4 10             	add    $0x10,%esp
c0106d00:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106d03:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0106d06:	7d 02                	jge    c0106d0a <untar+0x259>
c0106d08:	eb c3                	jmp    c0106ccd <untar+0x21c>
c0106d0a:	90                   	nop
c0106d0b:	83 ec 08             	sub    $0x8,%esp
c0106d0e:	ff 75 f4             	pushl  -0xc(%ebp)
c0106d11:	68 1d a4 10 c0       	push   $0xc010a41d
c0106d16:	e8 df 13 00 00       	call   c01080fa <Printf>
c0106d1b:	83 c4 10             	add    $0x10,%esp
c0106d1e:	83 ec 08             	sub    $0x8,%esp
c0106d21:	ff 75 c0             	pushl  -0x40(%ebp)
c0106d24:	68 2f a4 10 c0       	push   $0xc010a42f
c0106d29:	e8 cc 13 00 00       	call   c01080fa <Printf>
c0106d2e:	83 c4 10             	add    $0x10,%esp
c0106d31:	83 ec 0c             	sub    $0xc,%esp
c0106d34:	68 40 a4 10 c0       	push   $0xc010a440
c0106d39:	e8 bc 13 00 00       	call   c01080fa <Printf>
c0106d3e:	83 c4 10             	add    $0x10,%esp
c0106d41:	83 ec 0c             	sub    $0xc,%esp
c0106d44:	ff 75 c8             	pushl  -0x38(%ebp)
c0106d47:	e8 7d de ff ff       	call   c0104bc9 <close>
c0106d4c:	83 c4 10             	add    $0x10,%esp
c0106d4f:	83 ec 0c             	sub    $0xc,%esp
c0106d52:	68 4e a4 10 c0       	push   $0xc010a44e
c0106d57:	e8 9e 13 00 00       	call   c01080fa <Printf>
c0106d5c:	83 c4 10             	add    $0x10,%esp
c0106d5f:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c0106d63:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0106d67:	0f 8f 98 fd ff ff    	jg     c0106b05 <untar+0x54>
c0106d6d:	eb 01                	jmp    c0106d70 <untar+0x2bf>
c0106d6f:	90                   	nop
c0106d70:	83 ec 0c             	sub    $0xc,%esp
c0106d73:	68 5b a4 10 c0       	push   $0xc010a45b
c0106d78:	e8 7d 13 00 00       	call   c01080fa <Printf>
c0106d7d:	83 c4 10             	add    $0x10,%esp
c0106d80:	83 ec 0c             	sub    $0xc,%esp
c0106d83:	68 6d a4 10 c0       	push   $0xc010a46d
c0106d88:	e8 6d 13 00 00       	call   c01080fa <Printf>
c0106d8d:	83 c4 10             	add    $0x10,%esp
c0106d90:	83 ec 0c             	sub    $0xc,%esp
c0106d93:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106d96:	e8 2e de ff ff       	call   c0104bc9 <close>
c0106d9b:	83 c4 10             	add    $0x10,%esp
c0106d9e:	83 ec 0c             	sub    $0xc,%esp
c0106da1:	68 7d a4 10 c0       	push   $0xc010a47d
c0106da6:	e8 4f 13 00 00       	call   c01080fa <Printf>
c0106dab:	83 c4 10             	add    $0x10,%esp
c0106dae:	83 ec 0c             	sub    $0xc,%esp
c0106db1:	68 90 a4 10 c0       	push   $0xc010a490
c0106db6:	e8 3f 13 00 00       	call   c01080fa <Printf>
c0106dbb:	83 c4 10             	add    $0x10,%esp
c0106dbe:	90                   	nop
c0106dbf:	c9                   	leave  
c0106dc0:	c3                   	ret    

c0106dc1 <atoi>:
c0106dc1:	55                   	push   %ebp
c0106dc2:	89 e5                	mov    %esp,%ebp
c0106dc4:	83 ec 10             	sub    $0x10,%esp
c0106dc7:	8b 45 08             	mov    0x8(%ebp),%eax
c0106dca:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0106dcd:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106dd0:	8d 50 01             	lea    0x1(%eax),%edx
c0106dd3:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0106dd6:	c6 00 30             	movb   $0x30,(%eax)
c0106dd9:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106ddc:	8d 50 01             	lea    0x1(%eax),%edx
c0106ddf:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0106de2:	c6 00 78             	movb   $0x78,(%eax)
c0106de5:	c6 45 fa 00          	movb   $0x0,-0x6(%ebp)
c0106de9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0106ded:	75 0e                	jne    c0106dfd <atoi+0x3c>
c0106def:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106df2:	8d 50 01             	lea    0x1(%eax),%edx
c0106df5:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0106df8:	c6 00 30             	movb   $0x30,(%eax)
c0106dfb:	eb 61                	jmp    c0106e5e <atoi+0x9d>
c0106dfd:	c7 45 f4 1c 00 00 00 	movl   $0x1c,-0xc(%ebp)
c0106e04:	eb 52                	jmp    c0106e58 <atoi+0x97>
c0106e06:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106e09:	8b 55 0c             	mov    0xc(%ebp),%edx
c0106e0c:	89 c1                	mov    %eax,%ecx
c0106e0e:	d3 fa                	sar    %cl,%edx
c0106e10:	89 d0                	mov    %edx,%eax
c0106e12:	83 e0 0f             	and    $0xf,%eax
c0106e15:	88 45 fb             	mov    %al,-0x5(%ebp)
c0106e18:	80 7d fa 00          	cmpb   $0x0,-0x6(%ebp)
c0106e1c:	75 06                	jne    c0106e24 <atoi+0x63>
c0106e1e:	80 7d fb 00          	cmpb   $0x0,-0x5(%ebp)
c0106e22:	74 2f                	je     c0106e53 <atoi+0x92>
c0106e24:	c6 45 fa 01          	movb   $0x1,-0x6(%ebp)
c0106e28:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0106e2c:	83 c0 30             	add    $0x30,%eax
c0106e2f:	88 45 fb             	mov    %al,-0x5(%ebp)
c0106e32:	80 7d fb 39          	cmpb   $0x39,-0x5(%ebp)
c0106e36:	7e 0a                	jle    c0106e42 <atoi+0x81>
c0106e38:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0106e3c:	83 c0 07             	add    $0x7,%eax
c0106e3f:	88 45 fb             	mov    %al,-0x5(%ebp)
c0106e42:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106e45:	8d 50 01             	lea    0x1(%eax),%edx
c0106e48:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0106e4b:	0f b6 55 fb          	movzbl -0x5(%ebp),%edx
c0106e4f:	88 10                	mov    %dl,(%eax)
c0106e51:	eb 01                	jmp    c0106e54 <atoi+0x93>
c0106e53:	90                   	nop
c0106e54:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c0106e58:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0106e5c:	79 a8                	jns    c0106e06 <atoi+0x45>
c0106e5e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106e61:	c6 00 00             	movb   $0x0,(%eax)
c0106e64:	90                   	nop
c0106e65:	c9                   	leave  
c0106e66:	c3                   	ret    

c0106e67 <disp_int>:
c0106e67:	55                   	push   %ebp
c0106e68:	89 e5                	mov    %esp,%ebp
c0106e6a:	83 ec 18             	sub    $0x18,%esp
c0106e6d:	ff 75 08             	pushl  0x8(%ebp)
c0106e70:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0106e73:	50                   	push   %eax
c0106e74:	e8 48 ff ff ff       	call   c0106dc1 <atoi>
c0106e79:	83 c4 08             	add    $0x8,%esp
c0106e7c:	83 ec 08             	sub    $0x8,%esp
c0106e7f:	6a 0b                	push   $0xb
c0106e81:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0106e84:	50                   	push   %eax
c0106e85:	e8 3d 92 ff ff       	call   c01000c7 <disp_str_colour>
c0106e8a:	83 c4 10             	add    $0x10,%esp
c0106e8d:	90                   	nop
c0106e8e:	c9                   	leave  
c0106e8f:	c3                   	ret    

c0106e90 <do_page_fault>:
c0106e90:	55                   	push   %ebp
c0106e91:	89 e5                	mov    %esp,%ebp
c0106e93:	83 ec 28             	sub    $0x28,%esp
c0106e96:	0f 20 d0             	mov    %cr2,%eax
c0106e99:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106e9c:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0106ea3:	00 00 00 
c0106ea6:	83 ec 0c             	sub    $0xc,%esp
c0106ea9:	68 9b a4 10 c0       	push   $0xc010a49b
c0106eae:	e8 d9 91 ff ff       	call   c010008c <disp_str>
c0106eb3:	83 c4 10             	add    $0x10,%esp
c0106eb6:	83 ec 0c             	sub    $0xc,%esp
c0106eb9:	68 aa a4 10 c0       	push   $0xc010a4aa
c0106ebe:	e8 c9 91 ff ff       	call   c010008c <disp_str>
c0106ec3:	83 c4 10             	add    $0x10,%esp
c0106ec6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106ec9:	83 ec 0c             	sub    $0xc,%esp
c0106ecc:	50                   	push   %eax
c0106ecd:	e8 95 ff ff ff       	call   c0106e67 <disp_int>
c0106ed2:	83 c4 10             	add    $0x10,%esp
c0106ed5:	83 ec 0c             	sub    $0xc,%esp
c0106ed8:	68 af a4 10 c0       	push   $0xc010a4af
c0106edd:	e8 aa 91 ff ff       	call   c010008c <disp_str>
c0106ee2:	83 c4 10             	add    $0x10,%esp
c0106ee5:	83 ec 0c             	sub    $0xc,%esp
c0106ee8:	ff 75 f4             	pushl  -0xc(%ebp)
c0106eeb:	e8 a9 ec ff ff       	call   c0105b99 <ptr_pde>
c0106ef0:	83 c4 10             	add    $0x10,%esp
c0106ef3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0106ef6:	83 ec 0c             	sub    $0xc,%esp
c0106ef9:	ff 75 f4             	pushl  -0xc(%ebp)
c0106efc:	e8 ab ec ff ff       	call   c0105bac <ptr_pte>
c0106f01:	83 c4 10             	add    $0x10,%esp
c0106f04:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106f07:	83 ec 0c             	sub    $0xc,%esp
c0106f0a:	68 b1 a4 10 c0       	push   $0xc010a4b1
c0106f0f:	e8 78 91 ff ff       	call   c010008c <disp_str>
c0106f14:	83 c4 10             	add    $0x10,%esp
c0106f17:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106f1a:	83 ec 0c             	sub    $0xc,%esp
c0106f1d:	50                   	push   %eax
c0106f1e:	e8 44 ff ff ff       	call   c0106e67 <disp_int>
c0106f23:	83 c4 10             	add    $0x10,%esp
c0106f26:	83 ec 0c             	sub    $0xc,%esp
c0106f29:	68 b6 a4 10 c0       	push   $0xc010a4b6
c0106f2e:	e8 59 91 ff ff       	call   c010008c <disp_str>
c0106f33:	83 c4 10             	add    $0x10,%esp
c0106f36:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106f39:	8b 00                	mov    (%eax),%eax
c0106f3b:	83 ec 0c             	sub    $0xc,%esp
c0106f3e:	50                   	push   %eax
c0106f3f:	e8 23 ff ff ff       	call   c0106e67 <disp_int>
c0106f44:	83 c4 10             	add    $0x10,%esp
c0106f47:	83 ec 0c             	sub    $0xc,%esp
c0106f4a:	68 af a4 10 c0       	push   $0xc010a4af
c0106f4f:	e8 38 91 ff ff       	call   c010008c <disp_str>
c0106f54:	83 c4 10             	add    $0x10,%esp
c0106f57:	83 ec 0c             	sub    $0xc,%esp
c0106f5a:	68 bf a4 10 c0       	push   $0xc010a4bf
c0106f5f:	e8 28 91 ff ff       	call   c010008c <disp_str>
c0106f64:	83 c4 10             	add    $0x10,%esp
c0106f67:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106f6a:	83 ec 0c             	sub    $0xc,%esp
c0106f6d:	50                   	push   %eax
c0106f6e:	e8 f4 fe ff ff       	call   c0106e67 <disp_int>
c0106f73:	83 c4 10             	add    $0x10,%esp
c0106f76:	83 ec 0c             	sub    $0xc,%esp
c0106f79:	68 c4 a4 10 c0       	push   $0xc010a4c4
c0106f7e:	e8 09 91 ff ff       	call   c010008c <disp_str>
c0106f83:	83 c4 10             	add    $0x10,%esp
c0106f86:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106f89:	8b 00                	mov    (%eax),%eax
c0106f8b:	83 ec 0c             	sub    $0xc,%esp
c0106f8e:	50                   	push   %eax
c0106f8f:	e8 d3 fe ff ff       	call   c0106e67 <disp_int>
c0106f94:	83 c4 10             	add    $0x10,%esp
c0106f97:	83 ec 0c             	sub    $0xc,%esp
c0106f9a:	68 af a4 10 c0       	push   $0xc010a4af
c0106f9f:	e8 e8 90 ff ff       	call   c010008c <disp_str>
c0106fa4:	83 c4 10             	add    $0x10,%esp
c0106fa7:	c7 45 e8 00 00 10 00 	movl   $0x100000,-0x18(%ebp)
c0106fae:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106fb1:	8b 00                	mov    (%eax),%eax
c0106fb3:	83 e0 01             	and    $0x1,%eax
c0106fb6:	85 c0                	test   %eax,%eax
c0106fb8:	74 09                	je     c0106fc3 <do_page_fault+0x133>
c0106fba:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
c0106fc1:	eb 07                	jmp    c0106fca <do_page_fault+0x13a>
c0106fc3:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0106fca:	90                   	nop
c0106fcb:	c9                   	leave  
c0106fcc:	c3                   	ret    

c0106fcd <exception_handler>:
c0106fcd:	55                   	push   %ebp
c0106fce:	89 e5                	mov    %esp,%ebp
c0106fd0:	57                   	push   %edi
c0106fd1:	56                   	push   %esi
c0106fd2:	53                   	push   %ebx
c0106fd3:	83 ec 6c             	sub    $0x6c,%esp
c0106fd6:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0106fd9:	bb 40 a7 10 c0       	mov    $0xc010a740,%ebx
c0106fde:	ba 13 00 00 00       	mov    $0x13,%edx
c0106fe3:	89 c7                	mov    %eax,%edi
c0106fe5:	89 de                	mov    %ebx,%esi
c0106fe7:	89 d1                	mov    %edx,%ecx
c0106fe9:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0106feb:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0106ff2:	eb 04                	jmp    c0106ff8 <exception_handler+0x2b>
c0106ff4:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0106ff8:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c0106fff:	7e f3                	jle    c0106ff4 <exception_handler+0x27>
c0107001:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0107008:	00 00 00 
c010700b:	83 ec 0c             	sub    $0xc,%esp
c010700e:	68 cd a4 10 c0       	push   $0xc010a4cd
c0107013:	e8 74 90 ff ff       	call   c010008c <disp_str>
c0107018:	83 c4 10             	add    $0x10,%esp
c010701b:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c0107022:	8b 45 08             	mov    0x8(%ebp),%eax
c0107025:	8b 44 85 8c          	mov    -0x74(%ebp,%eax,4),%eax
c0107029:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010702c:	83 ec 0c             	sub    $0xc,%esp
c010702f:	ff 75 dc             	pushl  -0x24(%ebp)
c0107032:	e8 55 90 ff ff       	call   c010008c <disp_str>
c0107037:	83 c4 10             	add    $0x10,%esp
c010703a:	83 ec 0c             	sub    $0xc,%esp
c010703d:	68 db a4 10 c0       	push   $0xc010a4db
c0107042:	e8 45 90 ff ff       	call   c010008c <disp_str>
c0107047:	83 c4 10             	add    $0x10,%esp
c010704a:	83 ec 0c             	sub    $0xc,%esp
c010704d:	68 de a4 10 c0       	push   $0xc010a4de
c0107052:	e8 35 90 ff ff       	call   c010008c <disp_str>
c0107057:	83 c4 10             	add    $0x10,%esp
c010705a:	8b 45 08             	mov    0x8(%ebp),%eax
c010705d:	83 ec 0c             	sub    $0xc,%esp
c0107060:	50                   	push   %eax
c0107061:	e8 01 fe ff ff       	call   c0106e67 <disp_int>
c0107066:	83 c4 10             	add    $0x10,%esp
c0107069:	83 ec 0c             	sub    $0xc,%esp
c010706c:	68 db a4 10 c0       	push   $0xc010a4db
c0107071:	e8 16 90 ff ff       	call   c010008c <disp_str>
c0107076:	83 c4 10             	add    $0x10,%esp
c0107079:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c010707d:	74 2f                	je     c01070ae <exception_handler+0xe1>
c010707f:	83 ec 0c             	sub    $0xc,%esp
c0107082:	68 e6 a4 10 c0       	push   $0xc010a4e6
c0107087:	e8 00 90 ff ff       	call   c010008c <disp_str>
c010708c:	83 c4 10             	add    $0x10,%esp
c010708f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0107092:	83 ec 0c             	sub    $0xc,%esp
c0107095:	50                   	push   %eax
c0107096:	e8 cc fd ff ff       	call   c0106e67 <disp_int>
c010709b:	83 c4 10             	add    $0x10,%esp
c010709e:	83 ec 0c             	sub    $0xc,%esp
c01070a1:	68 db a4 10 c0       	push   $0xc010a4db
c01070a6:	e8 e1 8f ff ff       	call   c010008c <disp_str>
c01070ab:	83 c4 10             	add    $0x10,%esp
c01070ae:	83 ec 0c             	sub    $0xc,%esp
c01070b1:	68 f0 a4 10 c0       	push   $0xc010a4f0
c01070b6:	e8 d1 8f ff ff       	call   c010008c <disp_str>
c01070bb:	83 c4 10             	add    $0x10,%esp
c01070be:	83 ec 0c             	sub    $0xc,%esp
c01070c1:	ff 75 14             	pushl  0x14(%ebp)
c01070c4:	e8 9e fd ff ff       	call   c0106e67 <disp_int>
c01070c9:	83 c4 10             	add    $0x10,%esp
c01070cc:	83 ec 0c             	sub    $0xc,%esp
c01070cf:	68 db a4 10 c0       	push   $0xc010a4db
c01070d4:	e8 b3 8f ff ff       	call   c010008c <disp_str>
c01070d9:	83 c4 10             	add    $0x10,%esp
c01070dc:	83 ec 0c             	sub    $0xc,%esp
c01070df:	68 f4 a4 10 c0       	push   $0xc010a4f4
c01070e4:	e8 a3 8f ff ff       	call   c010008c <disp_str>
c01070e9:	83 c4 10             	add    $0x10,%esp
c01070ec:	8b 45 10             	mov    0x10(%ebp),%eax
c01070ef:	83 ec 0c             	sub    $0xc,%esp
c01070f2:	50                   	push   %eax
c01070f3:	e8 6f fd ff ff       	call   c0106e67 <disp_int>
c01070f8:	83 c4 10             	add    $0x10,%esp
c01070fb:	83 ec 0c             	sub    $0xc,%esp
c01070fe:	68 db a4 10 c0       	push   $0xc010a4db
c0107103:	e8 84 8f ff ff       	call   c010008c <disp_str>
c0107108:	83 c4 10             	add    $0x10,%esp
c010710b:	83 ec 0c             	sub    $0xc,%esp
c010710e:	68 f9 a4 10 c0       	push   $0xc010a4f9
c0107113:	e8 74 8f ff ff       	call   c010008c <disp_str>
c0107118:	83 c4 10             	add    $0x10,%esp
c010711b:	83 ec 0c             	sub    $0xc,%esp
c010711e:	ff 75 18             	pushl  0x18(%ebp)
c0107121:	e8 41 fd ff ff       	call   c0106e67 <disp_int>
c0107126:	83 c4 10             	add    $0x10,%esp
c0107129:	83 ec 0c             	sub    $0xc,%esp
c010712c:	68 db a4 10 c0       	push   $0xc010a4db
c0107131:	e8 56 8f ff ff       	call   c010008c <disp_str>
c0107136:	83 c4 10             	add    $0x10,%esp
c0107139:	83 ec 0c             	sub    $0xc,%esp
c010713c:	68 04 a5 10 c0       	push   $0xc010a504
c0107141:	e8 46 8f ff ff       	call   c010008c <disp_str>
c0107146:	83 c4 10             	add    $0x10,%esp
c0107149:	83 7d 08 0e          	cmpl   $0xe,0x8(%ebp)
c010714d:	75 45                	jne    c0107194 <exception_handler+0x1c7>
c010714f:	0f 20 d0             	mov    %cr2,%eax
c0107152:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0107155:	83 ec 0c             	sub    $0xc,%esp
c0107158:	68 23 a5 10 c0       	push   $0xc010a523
c010715d:	e8 2a 8f ff ff       	call   c010008c <disp_str>
c0107162:	83 c4 10             	add    $0x10,%esp
c0107165:	83 ec 0c             	sub    $0xc,%esp
c0107168:	68 aa a4 10 c0       	push   $0xc010a4aa
c010716d:	e8 1a 8f ff ff       	call   c010008c <disp_str>
c0107172:	83 c4 10             	add    $0x10,%esp
c0107175:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0107178:	83 ec 0c             	sub    $0xc,%esp
c010717b:	50                   	push   %eax
c010717c:	e8 e6 fc ff ff       	call   c0106e67 <disp_int>
c0107181:	83 c4 10             	add    $0x10,%esp
c0107184:	83 ec 0c             	sub    $0xc,%esp
c0107187:	68 af a4 10 c0       	push   $0xc010a4af
c010718c:	e8 fb 8e ff ff       	call   c010008c <disp_str>
c0107191:	83 c4 10             	add    $0x10,%esp
c0107194:	83 7d 08 0d          	cmpl   $0xd,0x8(%ebp)
c0107198:	75 11                	jne    c01071ab <exception_handler+0x1de>
c010719a:	83 ec 0c             	sub    $0xc,%esp
c010719d:	68 2f a5 10 c0       	push   $0xc010a52f
c01071a2:	e8 e5 8e ff ff       	call   c010008c <disp_str>
c01071a7:	83 c4 10             	add    $0x10,%esp
c01071aa:	90                   	nop
c01071ab:	90                   	nop
c01071ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
c01071af:	5b                   	pop    %ebx
c01071b0:	5e                   	pop    %esi
c01071b1:	5f                   	pop    %edi
c01071b2:	5d                   	pop    %ebp
c01071b3:	c3                   	ret    

c01071b4 <init_internal_interrupt>:
c01071b4:	55                   	push   %ebp
c01071b5:	89 e5                	mov    %esp,%ebp
c01071b7:	83 ec 08             	sub    $0x8,%esp
c01071ba:	6a 0e                	push   $0xe
c01071bc:	6a 08                	push   $0x8
c01071be:	68 03 01 10 c0       	push   $0xc0100103
c01071c3:	6a 00                	push   $0x0
c01071c5:	e8 a4 c7 ff ff       	call   c010396e <InitInterruptDesc>
c01071ca:	83 c4 10             	add    $0x10,%esp
c01071cd:	6a 0e                	push   $0xe
c01071cf:	6a 08                	push   $0x8
c01071d1:	68 09 01 10 c0       	push   $0xc0100109
c01071d6:	6a 01                	push   $0x1
c01071d8:	e8 91 c7 ff ff       	call   c010396e <InitInterruptDesc>
c01071dd:	83 c4 10             	add    $0x10,%esp
c01071e0:	6a 0e                	push   $0xe
c01071e2:	6a 08                	push   $0x8
c01071e4:	68 0f 01 10 c0       	push   $0xc010010f
c01071e9:	6a 02                	push   $0x2
c01071eb:	e8 7e c7 ff ff       	call   c010396e <InitInterruptDesc>
c01071f0:	83 c4 10             	add    $0x10,%esp
c01071f3:	6a 0e                	push   $0xe
c01071f5:	6a 08                	push   $0x8
c01071f7:	68 15 01 10 c0       	push   $0xc0100115
c01071fc:	6a 03                	push   $0x3
c01071fe:	e8 6b c7 ff ff       	call   c010396e <InitInterruptDesc>
c0107203:	83 c4 10             	add    $0x10,%esp
c0107206:	6a 0e                	push   $0xe
c0107208:	6a 08                	push   $0x8
c010720a:	68 1b 01 10 c0       	push   $0xc010011b
c010720f:	6a 04                	push   $0x4
c0107211:	e8 58 c7 ff ff       	call   c010396e <InitInterruptDesc>
c0107216:	83 c4 10             	add    $0x10,%esp
c0107219:	6a 0e                	push   $0xe
c010721b:	6a 08                	push   $0x8
c010721d:	68 21 01 10 c0       	push   $0xc0100121
c0107222:	6a 05                	push   $0x5
c0107224:	e8 45 c7 ff ff       	call   c010396e <InitInterruptDesc>
c0107229:	83 c4 10             	add    $0x10,%esp
c010722c:	6a 0e                	push   $0xe
c010722e:	6a 08                	push   $0x8
c0107230:	68 27 01 10 c0       	push   $0xc0100127
c0107235:	6a 06                	push   $0x6
c0107237:	e8 32 c7 ff ff       	call   c010396e <InitInterruptDesc>
c010723c:	83 c4 10             	add    $0x10,%esp
c010723f:	6a 0e                	push   $0xe
c0107241:	6a 08                	push   $0x8
c0107243:	68 2d 01 10 c0       	push   $0xc010012d
c0107248:	6a 07                	push   $0x7
c010724a:	e8 1f c7 ff ff       	call   c010396e <InitInterruptDesc>
c010724f:	83 c4 10             	add    $0x10,%esp
c0107252:	6a 0e                	push   $0xe
c0107254:	6a 08                	push   $0x8
c0107256:	68 33 01 10 c0       	push   $0xc0100133
c010725b:	6a 08                	push   $0x8
c010725d:	e8 0c c7 ff ff       	call   c010396e <InitInterruptDesc>
c0107262:	83 c4 10             	add    $0x10,%esp
c0107265:	6a 0e                	push   $0xe
c0107267:	6a 08                	push   $0x8
c0107269:	68 37 01 10 c0       	push   $0xc0100137
c010726e:	6a 09                	push   $0x9
c0107270:	e8 f9 c6 ff ff       	call   c010396e <InitInterruptDesc>
c0107275:	83 c4 10             	add    $0x10,%esp
c0107278:	6a 0e                	push   $0xe
c010727a:	6a 08                	push   $0x8
c010727c:	68 3d 01 10 c0       	push   $0xc010013d
c0107281:	6a 0a                	push   $0xa
c0107283:	e8 e6 c6 ff ff       	call   c010396e <InitInterruptDesc>
c0107288:	83 c4 10             	add    $0x10,%esp
c010728b:	6a 0e                	push   $0xe
c010728d:	6a 08                	push   $0x8
c010728f:	68 41 01 10 c0       	push   $0xc0100141
c0107294:	6a 0b                	push   $0xb
c0107296:	e8 d3 c6 ff ff       	call   c010396e <InitInterruptDesc>
c010729b:	83 c4 10             	add    $0x10,%esp
c010729e:	6a 0e                	push   $0xe
c01072a0:	6a 08                	push   $0x8
c01072a2:	68 45 01 10 c0       	push   $0xc0100145
c01072a7:	6a 0c                	push   $0xc
c01072a9:	e8 c0 c6 ff ff       	call   c010396e <InitInterruptDesc>
c01072ae:	83 c4 10             	add    $0x10,%esp
c01072b1:	6a 0e                	push   $0xe
c01072b3:	6a 08                	push   $0x8
c01072b5:	68 49 01 10 c0       	push   $0xc0100149
c01072ba:	6a 0d                	push   $0xd
c01072bc:	e8 ad c6 ff ff       	call   c010396e <InitInterruptDesc>
c01072c1:	83 c4 10             	add    $0x10,%esp
c01072c4:	6a 0e                	push   $0xe
c01072c6:	6a 08                	push   $0x8
c01072c8:	68 54 01 10 c0       	push   $0xc0100154
c01072cd:	6a 0e                	push   $0xe
c01072cf:	e8 9a c6 ff ff       	call   c010396e <InitInterruptDesc>
c01072d4:	83 c4 10             	add    $0x10,%esp
c01072d7:	6a 0e                	push   $0xe
c01072d9:	6a 08                	push   $0x8
c01072db:	68 58 01 10 c0       	push   $0xc0100158
c01072e0:	6a 10                	push   $0x10
c01072e2:	e8 87 c6 ff ff       	call   c010396e <InitInterruptDesc>
c01072e7:	83 c4 10             	add    $0x10,%esp
c01072ea:	6a 0e                	push   $0xe
c01072ec:	6a 08                	push   $0x8
c01072ee:	68 5e 01 10 c0       	push   $0xc010015e
c01072f3:	6a 11                	push   $0x11
c01072f5:	e8 74 c6 ff ff       	call   c010396e <InitInterruptDesc>
c01072fa:	83 c4 10             	add    $0x10,%esp
c01072fd:	6a 0e                	push   $0xe
c01072ff:	6a 08                	push   $0x8
c0107301:	68 62 01 10 c0       	push   $0xc0100162
c0107306:	6a 12                	push   $0x12
c0107308:	e8 61 c6 ff ff       	call   c010396e <InitInterruptDesc>
c010730d:	83 c4 10             	add    $0x10,%esp
c0107310:	6a 0e                	push   $0xe
c0107312:	6a 0e                	push   $0xe
c0107314:	68 1e 02 10 c0       	push   $0xc010021e
c0107319:	68 90 00 00 00       	push   $0x90
c010731e:	e8 4b c6 ff ff       	call   c010396e <InitInterruptDesc>
c0107323:	83 c4 10             	add    $0x10,%esp
c0107326:	90                   	nop
c0107327:	c9                   	leave  
c0107328:	c3                   	ret    

c0107329 <spurious_irq>:
c0107329:	55                   	push   %ebp
c010732a:	89 e5                	mov    %esp,%ebp
c010732c:	83 ec 08             	sub    $0x8,%esp
c010732f:	83 ec 08             	sub    $0x8,%esp
c0107332:	6a 0b                	push   $0xb
c0107334:	68 8c a7 10 c0       	push   $0xc010a78c
c0107339:	e8 89 8d ff ff       	call   c01000c7 <disp_str_colour>
c010733e:	83 c4 10             	add    $0x10,%esp
c0107341:	83 ec 0c             	sub    $0xc,%esp
c0107344:	ff 75 08             	pushl  0x8(%ebp)
c0107347:	e8 1b fb ff ff       	call   c0106e67 <disp_int>
c010734c:	83 c4 10             	add    $0x10,%esp
c010734f:	a1 e8 0e 11 c0       	mov    0xc0110ee8,%eax
c0107354:	8b 15 ec 0e 11 c0    	mov    0xc0110eec,%edx
c010735a:	83 c0 01             	add    $0x1,%eax
c010735d:	83 d2 00             	adc    $0x0,%edx
c0107360:	a3 e8 0e 11 c0       	mov    %eax,0xc0110ee8
c0107365:	89 15 ec 0e 11 c0    	mov    %edx,0xc0110eec
c010736b:	83 ec 0c             	sub    $0xc,%esp
c010736e:	68 b3 a7 10 c0       	push   $0xc010a7b3
c0107373:	e8 14 8d ff ff       	call   c010008c <disp_str>
c0107378:	83 c4 10             	add    $0x10,%esp
c010737b:	a1 e8 0e 11 c0       	mov    0xc0110ee8,%eax
c0107380:	8b 15 ec 0e 11 c0    	mov    0xc0110eec,%edx
c0107386:	83 ec 0c             	sub    $0xc,%esp
c0107389:	50                   	push   %eax
c010738a:	e8 d8 fa ff ff       	call   c0106e67 <disp_int>
c010738f:	83 c4 10             	add    $0x10,%esp
c0107392:	83 ec 0c             	sub    $0xc,%esp
c0107395:	68 b5 a7 10 c0       	push   $0xc010a7b5
c010739a:	e8 ed 8c ff ff       	call   c010008c <disp_str>
c010739f:	83 c4 10             	add    $0x10,%esp
c01073a2:	83 ec 08             	sub    $0x8,%esp
c01073a5:	6a 0c                	push   $0xc
c01073a7:	68 b8 a7 10 c0       	push   $0xc010a7b8
c01073ac:	e8 16 8d ff ff       	call   c01000c7 <disp_str_colour>
c01073b1:	83 c4 10             	add    $0x10,%esp
c01073b4:	90                   	nop
c01073b5:	c9                   	leave  
c01073b6:	c3                   	ret    

c01073b7 <init_keyboard>:
c01073b7:	55                   	push   %ebp
c01073b8:	89 e5                	mov    %esp,%ebp
c01073ba:	83 ec 18             	sub    $0x18,%esp
c01073bd:	83 ec 04             	sub    $0x4,%esp
c01073c0:	68 00 02 00 00       	push   $0x200
c01073c5:	6a 00                	push   $0x0
c01073c7:	68 ec fb 10 c0       	push   $0xc010fbec
c01073cc:	e8 4e 38 00 00       	call   c010ac1f <Memset>
c01073d1:	83 c4 10             	add    $0x10,%esp
c01073d4:	c7 05 e0 fb 10 c0 ec 	movl   $0xc010fbec,0xc010fbe0
c01073db:	fb 10 c0 
c01073de:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c01073e3:	a3 e4 fb 10 c0       	mov    %eax,0xc010fbe4
c01073e8:	c7 05 e8 fb 10 c0 00 	movl   $0x0,0xc010fbe8
c01073ef:	00 00 00 
c01073f2:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c01073f9:	00 00 00 
c01073fc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0107403:	eb 04                	jmp    c0107409 <init_keyboard+0x52>
c0107405:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0107409:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c0107410:	7e f3                	jle    c0107405 <init_keyboard+0x4e>
c0107412:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0107419:	00 00 00 
c010741c:	e8 67 d3 ff ff       	call   c0104788 <init_keyboard_handler>
c0107421:	90                   	nop
c0107422:	c9                   	leave  
c0107423:	c3                   	ret    

c0107424 <TestTTY>:
c0107424:	55                   	push   %ebp
c0107425:	89 e5                	mov    %esp,%ebp
c0107427:	83 ec 28             	sub    $0x28,%esp
c010742a:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0107431:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0107438:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c010743e:	83 ec 08             	sub    $0x8,%esp
c0107441:	6a 02                	push   $0x2
c0107443:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107446:	50                   	push   %eax
c0107447:	e8 e2 d4 ff ff       	call   c010492e <open>
c010744c:	83 c4 10             	add    $0x10,%esp
c010744f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0107452:	83 ec 08             	sub    $0x8,%esp
c0107455:	6a 02                	push   $0x2
c0107457:	8d 45 de             	lea    -0x22(%ebp),%eax
c010745a:	50                   	push   %eax
c010745b:	e8 ce d4 ff ff       	call   c010492e <open>
c0107460:	83 c4 10             	add    $0x10,%esp
c0107463:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107466:	83 ec 0c             	sub    $0xc,%esp
c0107469:	68 dd a7 10 c0       	push   $0xc010a7dd
c010746e:	e8 87 0c 00 00       	call   c01080fa <Printf>
c0107473:	83 c4 10             	add    $0x10,%esp
c0107476:	83 ec 0c             	sub    $0xc,%esp
c0107479:	6a 0a                	push   $0xa
c010747b:	e8 fc 9f ff ff       	call   c010147c <sys_malloc>
c0107480:	83 c4 10             	add    $0x10,%esp
c0107483:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0107486:	83 ec 04             	sub    $0x4,%esp
c0107489:	6a 0a                	push   $0xa
c010748b:	6a 00                	push   $0x0
c010748d:	ff 75 ec             	pushl  -0x14(%ebp)
c0107490:	e8 8a 37 00 00       	call   c010ac1f <Memset>
c0107495:	83 c4 10             	add    $0x10,%esp
c0107498:	83 ec 04             	sub    $0x4,%esp
c010749b:	6a 0a                	push   $0xa
c010749d:	ff 75 ec             	pushl  -0x14(%ebp)
c01074a0:	ff 75 f0             	pushl  -0x10(%ebp)
c01074a3:	e8 1b d5 ff ff       	call   c01049c3 <read>
c01074a8:	83 c4 10             	add    $0x10,%esp
c01074ab:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01074ae:	83 ec 08             	sub    $0x8,%esp
c01074b1:	ff 75 ec             	pushl  -0x14(%ebp)
c01074b4:	68 ef a7 10 c0       	push   $0xc010a7ef
c01074b9:	e8 3c 0c 00 00       	call   c01080fa <Printf>
c01074be:	83 c4 10             	add    $0x10,%esp
c01074c1:	eb c3                	jmp    c0107486 <TestTTY+0x62>

c01074c3 <TestFS>:
c01074c3:	55                   	push   %ebp
c01074c4:	89 e5                	mov    %esp,%ebp
c01074c6:	81 ec 28 01 00 00    	sub    $0x128,%esp
c01074cc:	83 ec 0c             	sub    $0xc,%esp
c01074cf:	68 f9 a7 10 c0       	push   $0xc010a7f9
c01074d4:	e8 b3 8b ff ff       	call   c010008c <disp_str>
c01074d9:	83 c4 10             	add    $0x10,%esp
c01074dc:	c7 45 be 64 65 76 5f 	movl   $0x5f766564,-0x42(%ebp)
c01074e3:	c7 45 c2 74 74 79 31 	movl   $0x31797474,-0x3e(%ebp)
c01074ea:	66 c7 45 c6 00 00    	movw   $0x0,-0x3a(%ebp)
c01074f0:	66 87 db             	xchg   %bx,%bx
c01074f3:	83 ec 08             	sub    $0x8,%esp
c01074f6:	6a 02                	push   $0x2
c01074f8:	8d 45 be             	lea    -0x42(%ebp),%eax
c01074fb:	50                   	push   %eax
c01074fc:	e8 2d d4 ff ff       	call   c010492e <open>
c0107501:	83 c4 10             	add    $0x10,%esp
c0107504:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0107507:	66 87 db             	xchg   %bx,%bx
c010750a:	83 ec 08             	sub    $0x8,%esp
c010750d:	6a 02                	push   $0x2
c010750f:	8d 45 be             	lea    -0x42(%ebp),%eax
c0107512:	50                   	push   %eax
c0107513:	e8 16 d4 ff ff       	call   c010492e <open>
c0107518:	83 c4 10             	add    $0x10,%esp
c010751b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010751e:	66 87 db             	xchg   %bx,%bx
c0107521:	83 ec 0c             	sub    $0xc,%esp
c0107524:	68 dd a7 10 c0       	push   $0xc010a7dd
c0107529:	e8 cc 0b 00 00       	call   c01080fa <Printf>
c010752e:	83 c4 10             	add    $0x10,%esp
c0107531:	66 87 db             	xchg   %bx,%bx
c0107534:	c7 45 b9 41 43 00 00 	movl   $0x4341,-0x47(%ebp)
c010753b:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
c010753f:	c7 45 b4 63 41 42 00 	movl   $0x424163,-0x4c(%ebp)
c0107546:	c6 45 b8 00          	movb   $0x0,-0x48(%ebp)
c010754a:	c7 45 aa 49 4e 54 45 	movl   $0x45544e49,-0x56(%ebp)
c0107551:	c7 45 ae 52 52 55 50 	movl   $0x50555252,-0x52(%ebp)
c0107558:	66 c7 45 b2 54 00    	movw   $0x54,-0x4e(%ebp)
c010755e:	66 87 db             	xchg   %bx,%bx
c0107561:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c0107568:	66 87 db             	xchg   %bx,%bx
c010756b:	83 ec 0c             	sub    $0xc,%esp
c010756e:	68 01 a8 10 c0       	push   $0xc010a801
c0107573:	e8 82 0b 00 00       	call   c01080fa <Printf>
c0107578:	83 c4 10             	add    $0x10,%esp
c010757b:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c010757f:	0f 85 43 03 00 00    	jne    c01078c8 <TestFS+0x405>
c0107585:	83 ec 08             	sub    $0x8,%esp
c0107588:	6a 07                	push   $0x7
c010758a:	8d 45 b9             	lea    -0x47(%ebp),%eax
c010758d:	50                   	push   %eax
c010758e:	e8 9b d3 ff ff       	call   c010492e <open>
c0107593:	83 c4 10             	add    $0x10,%esp
c0107596:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0107599:	83 ec 08             	sub    $0x8,%esp
c010759c:	ff 75 e4             	pushl  -0x1c(%ebp)
c010759f:	68 19 a8 10 c0       	push   $0xc010a819
c01075a4:	e8 51 0b 00 00       	call   c01080fa <Printf>
c01075a9:	83 c4 10             	add    $0x10,%esp
c01075ac:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01075b3:	c7 45 96 63 67 3a 68 	movl   $0x683a6763,-0x6a(%ebp)
c01075ba:	c7 45 9a 65 6c 6c 6f 	movl   $0x6f6c6c65,-0x66(%ebp)
c01075c1:	c7 45 9e 2c 77 6f 72 	movl   $0x726f772c,-0x62(%ebp)
c01075c8:	c7 45 a2 6c 64 21 00 	movl   $0x21646c,-0x5e(%ebp)
c01075cf:	c7 45 a6 00 00 00 00 	movl   $0x0,-0x5a(%ebp)
c01075d6:	83 ec 0c             	sub    $0xc,%esp
c01075d9:	8d 45 96             	lea    -0x6a(%ebp),%eax
c01075dc:	50                   	push   %eax
c01075dd:	e8 76 36 00 00       	call   c010ac58 <Strlen>
c01075e2:	83 c4 10             	add    $0x10,%esp
c01075e5:	83 ec 04             	sub    $0x4,%esp
c01075e8:	50                   	push   %eax
c01075e9:	8d 45 96             	lea    -0x6a(%ebp),%eax
c01075ec:	50                   	push   %eax
c01075ed:	ff 75 e4             	pushl  -0x1c(%ebp)
c01075f0:	e8 4f d5 ff ff       	call   c0104b44 <write>
c01075f5:	83 c4 10             	add    $0x10,%esp
c01075f8:	83 ec 04             	sub    $0x4,%esp
c01075fb:	6a 14                	push   $0x14
c01075fd:	6a 00                	push   $0x0
c01075ff:	8d 45 82             	lea    -0x7e(%ebp),%eax
c0107602:	50                   	push   %eax
c0107603:	e8 17 36 00 00       	call   c010ac1f <Memset>
c0107608:	83 c4 10             	add    $0x10,%esp
c010760b:	83 ec 04             	sub    $0x4,%esp
c010760e:	6a 12                	push   $0x12
c0107610:	8d 45 82             	lea    -0x7e(%ebp),%eax
c0107613:	50                   	push   %eax
c0107614:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107617:	e8 a7 d3 ff ff       	call   c01049c3 <read>
c010761c:	83 c4 10             	add    $0x10,%esp
c010761f:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0107622:	83 ec 08             	sub    $0x8,%esp
c0107625:	8d 45 82             	lea    -0x7e(%ebp),%eax
c0107628:	50                   	push   %eax
c0107629:	68 22 a8 10 c0       	push   $0xc010a822
c010762e:	e8 c7 0a 00 00       	call   c01080fa <Printf>
c0107633:	83 c4 10             	add    $0x10,%esp
c0107636:	66 87 db             	xchg   %bx,%bx
c0107639:	83 ec 0c             	sub    $0xc,%esp
c010763c:	6a 0a                	push   $0xa
c010763e:	e8 83 09 00 00       	call   c0107fc6 <delay>
c0107643:	83 c4 10             	add    $0x10,%esp
c0107646:	83 ec 08             	sub    $0x8,%esp
c0107649:	6a 07                	push   $0x7
c010764b:	8d 45 b4             	lea    -0x4c(%ebp),%eax
c010764e:	50                   	push   %eax
c010764f:	e8 da d2 ff ff       	call   c010492e <open>
c0107654:	83 c4 10             	add    $0x10,%esp
c0107657:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010765a:	83 ec 08             	sub    $0x8,%esp
c010765d:	ff 75 dc             	pushl  -0x24(%ebp)
c0107660:	68 2d a8 10 c0       	push   $0xc010a82d
c0107665:	e8 90 0a 00 00       	call   c01080fa <Printf>
c010766a:	83 c4 10             	add    $0x10,%esp
c010766d:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0107674:	c7 85 6e ff ff ff 63 	movl   $0x683a6763,-0x92(%ebp)
c010767b:	67 3a 68 
c010767e:	c7 85 72 ff ff ff 6f 	movl   $0x6120776f,-0x8e(%ebp)
c0107685:	77 20 61 
c0107688:	c7 85 76 ff ff ff 72 	movl   $0x79206572,-0x8a(%ebp)
c010768f:	65 20 79 
c0107692:	c7 85 7a ff ff ff 6f 	movl   $0x3f756f,-0x86(%ebp)
c0107699:	75 3f 00 
c010769c:	c7 85 7e ff ff ff 00 	movl   $0x0,-0x82(%ebp)
c01076a3:	00 00 00 
c01076a6:	83 ec 0c             	sub    $0xc,%esp
c01076a9:	8d 85 6e ff ff ff    	lea    -0x92(%ebp),%eax
c01076af:	50                   	push   %eax
c01076b0:	e8 a3 35 00 00       	call   c010ac58 <Strlen>
c01076b5:	83 c4 10             	add    $0x10,%esp
c01076b8:	83 ec 04             	sub    $0x4,%esp
c01076bb:	50                   	push   %eax
c01076bc:	8d 85 6e ff ff ff    	lea    -0x92(%ebp),%eax
c01076c2:	50                   	push   %eax
c01076c3:	ff 75 dc             	pushl  -0x24(%ebp)
c01076c6:	e8 79 d4 ff ff       	call   c0104b44 <write>
c01076cb:	83 c4 10             	add    $0x10,%esp
c01076ce:	83 ec 04             	sub    $0x4,%esp
c01076d1:	6a 14                	push   $0x14
c01076d3:	6a 00                	push   $0x0
c01076d5:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c01076db:	50                   	push   %eax
c01076dc:	e8 3e 35 00 00       	call   c010ac1f <Memset>
c01076e1:	83 c4 10             	add    $0x10,%esp
c01076e4:	83 ec 04             	sub    $0x4,%esp
c01076e7:	6a 12                	push   $0x12
c01076e9:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c01076ef:	50                   	push   %eax
c01076f0:	ff 75 dc             	pushl  -0x24(%ebp)
c01076f3:	e8 cb d2 ff ff       	call   c01049c3 <read>
c01076f8:	83 c4 10             	add    $0x10,%esp
c01076fb:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01076fe:	83 ec 08             	sub    $0x8,%esp
c0107701:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c0107707:	50                   	push   %eax
c0107708:	68 37 a8 10 c0       	push   $0xc010a837
c010770d:	e8 e8 09 00 00       	call   c01080fa <Printf>
c0107712:	83 c4 10             	add    $0x10,%esp
c0107715:	83 ec 08             	sub    $0x8,%esp
c0107718:	6a 07                	push   $0x7
c010771a:	8d 45 aa             	lea    -0x56(%ebp),%eax
c010771d:	50                   	push   %eax
c010771e:	e8 0b d2 ff ff       	call   c010492e <open>
c0107723:	83 c4 10             	add    $0x10,%esp
c0107726:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0107729:	83 ec 08             	sub    $0x8,%esp
c010772c:	ff 75 dc             	pushl  -0x24(%ebp)
c010772f:	68 2d a8 10 c0       	push   $0xc010a82d
c0107734:	e8 c1 09 00 00       	call   c01080fa <Printf>
c0107739:	83 c4 10             	add    $0x10,%esp
c010773c:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0107743:	c7 85 3c ff ff ff 49 	movl   $0x69772049,-0xc4(%ebp)
c010774a:	20 77 69 
c010774d:	c7 85 40 ff ff ff 6c 	movl   $0x73206c6c,-0xc0(%ebp)
c0107754:	6c 20 73 
c0107757:	c7 85 44 ff ff ff 75 	movl   $0x65636375,-0xbc(%ebp)
c010775e:	63 63 65 
c0107761:	c7 85 48 ff ff ff 73 	movl   $0x61207373,-0xb8(%ebp)
c0107768:	73 20 61 
c010776b:	c7 85 4c ff ff ff 74 	movl   $0x616c2074,-0xb4(%ebp)
c0107772:	20 6c 61 
c0107775:	c7 85 50 ff ff ff 73 	movl   $0x2e7473,-0xb0(%ebp)
c010777c:	74 2e 00 
c010777f:	c7 85 54 ff ff ff 00 	movl   $0x0,-0xac(%ebp)
c0107786:	00 00 00 
c0107789:	66 c7 85 58 ff ff ff 	movw   $0x0,-0xa8(%ebp)
c0107790:	00 00 
c0107792:	83 ec 0c             	sub    $0xc,%esp
c0107795:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c010779b:	50                   	push   %eax
c010779c:	e8 b7 34 00 00       	call   c010ac58 <Strlen>
c01077a1:	83 c4 10             	add    $0x10,%esp
c01077a4:	83 ec 04             	sub    $0x4,%esp
c01077a7:	50                   	push   %eax
c01077a8:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c01077ae:	50                   	push   %eax
c01077af:	ff 75 d4             	pushl  -0x2c(%ebp)
c01077b2:	e8 8d d3 ff ff       	call   c0104b44 <write>
c01077b7:	83 c4 10             	add    $0x10,%esp
c01077ba:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01077c1:	eb 5c                	jmp    c010781f <TestFS+0x35c>
c01077c3:	83 ec 04             	sub    $0x4,%esp
c01077c6:	6a 1e                	push   $0x1e
c01077c8:	6a 00                	push   $0x0
c01077ca:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c01077d0:	50                   	push   %eax
c01077d1:	e8 49 34 00 00       	call   c010ac1f <Memset>
c01077d6:	83 c4 10             	add    $0x10,%esp
c01077d9:	83 ec 0c             	sub    $0xc,%esp
c01077dc:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c01077e2:	50                   	push   %eax
c01077e3:	e8 70 34 00 00       	call   c010ac58 <Strlen>
c01077e8:	83 c4 10             	add    $0x10,%esp
c01077eb:	83 ec 04             	sub    $0x4,%esp
c01077ee:	50                   	push   %eax
c01077ef:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c01077f5:	50                   	push   %eax
c01077f6:	ff 75 d4             	pushl  -0x2c(%ebp)
c01077f9:	e8 c5 d1 ff ff       	call   c01049c3 <read>
c01077fe:	83 c4 10             	add    $0x10,%esp
c0107801:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0107804:	83 ec 08             	sub    $0x8,%esp
c0107807:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c010780d:	50                   	push   %eax
c010780e:	68 42 a8 10 c0       	push   $0xc010a842
c0107813:	e8 e2 08 00 00       	call   c01080fa <Printf>
c0107818:	83 c4 10             	add    $0x10,%esp
c010781b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c010781f:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c0107823:	7e 9e                	jle    c01077c3 <TestFS+0x300>
c0107825:	c7 85 0a ff ff ff 69 	movl   $0x74736e69,-0xf6(%ebp)
c010782c:	6e 73 74 
c010782f:	c7 85 0e ff ff ff 61 	movl   $0x2e6c6c61,-0xf2(%ebp)
c0107836:	6c 6c 2e 
c0107839:	c7 85 12 ff ff ff 74 	movl   $0x726174,-0xee(%ebp)
c0107840:	61 72 00 
c0107843:	c7 85 16 ff ff ff 00 	movl   $0x0,-0xea(%ebp)
c010784a:	00 00 00 
c010784d:	c7 85 1a ff ff ff 00 	movl   $0x0,-0xe6(%ebp)
c0107854:	00 00 00 
c0107857:	83 ec 08             	sub    $0x8,%esp
c010785a:	6a 00                	push   $0x0
c010785c:	8d 85 0a ff ff ff    	lea    -0xf6(%ebp),%eax
c0107862:	50                   	push   %eax
c0107863:	e8 c6 d0 ff ff       	call   c010492e <open>
c0107868:	83 c4 10             	add    $0x10,%esp
c010786b:	89 45 cc             	mov    %eax,-0x34(%ebp)
c010786e:	83 ec 08             	sub    $0x8,%esp
c0107871:	ff 75 cc             	pushl  -0x34(%ebp)
c0107874:	68 4d a8 10 c0       	push   $0xc010a84d
c0107879:	e8 7c 08 00 00       	call   c01080fa <Printf>
c010787e:	83 c4 10             	add    $0x10,%esp
c0107881:	83 ec 04             	sub    $0x4,%esp
c0107884:	6a 28                	push   $0x28
c0107886:	6a 00                	push   $0x0
c0107888:	8d 85 e2 fe ff ff    	lea    -0x11e(%ebp),%eax
c010788e:	50                   	push   %eax
c010788f:	e8 8b 33 00 00       	call   c010ac1f <Memset>
c0107894:	83 c4 10             	add    $0x10,%esp
c0107897:	83 ec 04             	sub    $0x4,%esp
c010789a:	6a 28                	push   $0x28
c010789c:	8d 85 e2 fe ff ff    	lea    -0x11e(%ebp),%eax
c01078a2:	50                   	push   %eax
c01078a3:	ff 75 cc             	pushl  -0x34(%ebp)
c01078a6:	e8 18 d1 ff ff       	call   c01049c3 <read>
c01078ab:	83 c4 10             	add    $0x10,%esp
c01078ae:	89 45 c8             	mov    %eax,-0x38(%ebp)
c01078b1:	83 ec 08             	sub    $0x8,%esp
c01078b4:	8d 85 e2 fe ff ff    	lea    -0x11e(%ebp),%eax
c01078ba:	50                   	push   %eax
c01078bb:	68 57 a8 10 c0       	push   $0xc010a857
c01078c0:	e8 35 08 00 00       	call   c01080fa <Printf>
c01078c5:	83 c4 10             	add    $0x10,%esp
c01078c8:	90                   	nop
c01078c9:	c9                   	leave  
c01078ca:	c3                   	ret    

c01078cb <wait_exit>:
c01078cb:	55                   	push   %ebp
c01078cc:	89 e5                	mov    %esp,%ebp
c01078ce:	83 ec 28             	sub    $0x28,%esp
c01078d1:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c01078d8:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c01078df:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c01078e5:	83 ec 08             	sub    $0x8,%esp
c01078e8:	6a 02                	push   $0x2
c01078ea:	8d 45 de             	lea    -0x22(%ebp),%eax
c01078ed:	50                   	push   %eax
c01078ee:	e8 3b d0 ff ff       	call   c010492e <open>
c01078f3:	83 c4 10             	add    $0x10,%esp
c01078f6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01078f9:	83 ec 08             	sub    $0x8,%esp
c01078fc:	6a 02                	push   $0x2
c01078fe:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107901:	50                   	push   %eax
c0107902:	e8 27 d0 ff ff       	call   c010492e <open>
c0107907:	83 c4 10             	add    $0x10,%esp
c010790a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010790d:	e8 7c d3 ff ff       	call   c0104c8e <fork>
c0107912:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0107915:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0107919:	7e 25                	jle    c0107940 <wait_exit+0x75>
c010791b:	83 ec 0c             	sub    $0xc,%esp
c010791e:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0107921:	50                   	push   %eax
c0107922:	e8 f4 d2 ff ff       	call   c0104c1b <wait>
c0107927:	83 c4 10             	add    $0x10,%esp
c010792a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010792d:	83 ec 08             	sub    $0x8,%esp
c0107930:	50                   	push   %eax
c0107931:	68 62 a8 10 c0       	push   $0xc010a862
c0107936:	e8 bf 07 00 00       	call   c01080fa <Printf>
c010793b:	83 c4 10             	add    $0x10,%esp
c010793e:	eb fe                	jmp    c010793e <wait_exit+0x73>
c0107940:	83 ec 0c             	sub    $0xc,%esp
c0107943:	68 7d a8 10 c0       	push   $0xc010a87d
c0107948:	e8 ad 07 00 00       	call   c01080fa <Printf>
c010794d:	83 c4 10             	add    $0x10,%esp
c0107950:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0107957:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010795a:	8d 50 01             	lea    0x1(%eax),%edx
c010795d:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0107960:	3d 50 c3 00 00       	cmp    $0xc350,%eax
c0107965:	7f 02                	jg     c0107969 <wait_exit+0x9e>
c0107967:	eb ee                	jmp    c0107957 <wait_exit+0x8c>
c0107969:	90                   	nop
c010796a:	83 ec 0c             	sub    $0xc,%esp
c010796d:	68 89 a8 10 c0       	push   $0xc010a889
c0107972:	e8 83 07 00 00       	call   c01080fa <Printf>
c0107977:	83 c4 10             	add    $0x10,%esp
c010797a:	83 ec 0c             	sub    $0xc,%esp
c010797d:	6a 09                	push   $0x9
c010797f:	e8 db d2 ff ff       	call   c0104c5f <exit>
c0107984:	83 c4 10             	add    $0x10,%esp
c0107987:	83 ec 0c             	sub    $0xc,%esp
c010798a:	68 97 a8 10 c0       	push   $0xc010a897
c010798f:	e8 66 07 00 00       	call   c01080fa <Printf>
c0107994:	83 c4 10             	add    $0x10,%esp
c0107997:	eb fe                	jmp    c0107997 <wait_exit+0xcc>

c0107999 <INIT_fork>:
c0107999:	55                   	push   %ebp
c010799a:	89 e5                	mov    %esp,%ebp
c010799c:	83 ec 78             	sub    $0x78,%esp
c010799f:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c01079a6:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c01079ad:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c01079b3:	83 ec 08             	sub    $0x8,%esp
c01079b6:	6a 02                	push   $0x2
c01079b8:	8d 45 de             	lea    -0x22(%ebp),%eax
c01079bb:	50                   	push   %eax
c01079bc:	e8 6d cf ff ff       	call   c010492e <open>
c01079c1:	83 c4 10             	add    $0x10,%esp
c01079c4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01079c7:	83 ec 08             	sub    $0x8,%esp
c01079ca:	6a 02                	push   $0x2
c01079cc:	8d 45 de             	lea    -0x22(%ebp),%eax
c01079cf:	50                   	push   %eax
c01079d0:	e8 59 cf ff ff       	call   c010492e <open>
c01079d5:	83 c4 10             	add    $0x10,%esp
c01079d8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01079db:	c7 45 b6 49 4e 49 54 	movl   $0x54494e49,-0x4a(%ebp)
c01079e2:	c7 45 ba 20 69 73 20 	movl   $0x20736920,-0x46(%ebp)
c01079e9:	c7 45 be 72 75 6e 6e 	movl   $0x6e6e7572,-0x42(%ebp)
c01079f0:	c7 45 c2 69 6e 67 0a 	movl   $0xa676e69,-0x3e(%ebp)
c01079f7:	c7 45 c6 00 00 00 00 	movl   $0x0,-0x3a(%ebp)
c01079fe:	c7 45 ca 00 00 00 00 	movl   $0x0,-0x36(%ebp)
c0107a05:	c7 45 ce 00 00 00 00 	movl   $0x0,-0x32(%ebp)
c0107a0c:	c7 45 d2 00 00 00 00 	movl   $0x0,-0x2e(%ebp)
c0107a13:	c7 45 d6 00 00 00 00 	movl   $0x0,-0x2a(%ebp)
c0107a1a:	c7 45 da 00 00 00 00 	movl   $0x0,-0x26(%ebp)
c0107a21:	83 ec 0c             	sub    $0xc,%esp
c0107a24:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107a27:	50                   	push   %eax
c0107a28:	e8 cd 06 00 00       	call   c01080fa <Printf>
c0107a2d:	83 c4 10             	add    $0x10,%esp
c0107a30:	83 ec 0c             	sub    $0xc,%esp
c0107a33:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107a36:	50                   	push   %eax
c0107a37:	e8 1c 32 00 00       	call   c010ac58 <Strlen>
c0107a3c:	83 c4 10             	add    $0x10,%esp
c0107a3f:	83 ec 04             	sub    $0x4,%esp
c0107a42:	50                   	push   %eax
c0107a43:	6a 00                	push   $0x0
c0107a45:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107a48:	50                   	push   %eax
c0107a49:	e8 d1 31 00 00       	call   c010ac1f <Memset>
c0107a4e:	83 c4 10             	add    $0x10,%esp
c0107a51:	83 ec 04             	sub    $0x4,%esp
c0107a54:	6a 28                	push   $0x28
c0107a56:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107a59:	50                   	push   %eax
c0107a5a:	ff 75 f0             	pushl  -0x10(%ebp)
c0107a5d:	e8 61 cf ff ff       	call   c01049c3 <read>
c0107a62:	83 c4 10             	add    $0x10,%esp
c0107a65:	83 ec 0c             	sub    $0xc,%esp
c0107a68:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107a6b:	50                   	push   %eax
c0107a6c:	e8 89 06 00 00       	call   c01080fa <Printf>
c0107a71:	83 c4 10             	add    $0x10,%esp
c0107a74:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0107a7b:	e8 0e d2 ff ff       	call   c0104c8e <fork>
c0107a80:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0107a83:	83 ec 0c             	sub    $0xc,%esp
c0107a86:	6a 01                	push   $0x1
c0107a88:	e8 39 05 00 00       	call   c0107fc6 <delay>
c0107a8d:	83 c4 10             	add    $0x10,%esp
c0107a90:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0107a94:	0f 8e c5 00 00 00    	jle    c0107b5f <INIT_fork+0x1c6>
c0107a9a:	83 ec 0c             	sub    $0xc,%esp
c0107a9d:	68 a5 a8 10 c0       	push   $0xc010a8a5
c0107aa2:	e8 53 06 00 00       	call   c01080fa <Printf>
c0107aa7:	83 c4 10             	add    $0x10,%esp
c0107aaa:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0107aae:	c7 45 8e 50 61 72 65 	movl   $0x65726150,-0x72(%ebp)
c0107ab5:	c7 45 92 6e 74 2e 4e 	movl   $0x4e2e746e,-0x6e(%ebp)
c0107abc:	c7 45 96 69 63 65 20 	movl   $0x20656369,-0x6a(%ebp)
c0107ac3:	c7 45 9a 74 6f 20 6d 	movl   $0x6d206f74,-0x66(%ebp)
c0107aca:	c7 45 9e 65 65 74 20 	movl   $0x20746565,-0x62(%ebp)
c0107ad1:	c7 45 a2 79 6f 75 21 	movl   $0x21756f79,-0x5e(%ebp)
c0107ad8:	c7 45 a6 0a 00 00 00 	movl   $0xa,-0x5a(%ebp)
c0107adf:	c7 45 aa 00 00 00 00 	movl   $0x0,-0x56(%ebp)
c0107ae6:	c7 45 ae 00 00 00 00 	movl   $0x0,-0x52(%ebp)
c0107aed:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)
c0107af4:	83 ec 0c             	sub    $0xc,%esp
c0107af7:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107afa:	50                   	push   %eax
c0107afb:	e8 58 31 00 00       	call   c010ac58 <Strlen>
c0107b00:	83 c4 10             	add    $0x10,%esp
c0107b03:	83 ec 04             	sub    $0x4,%esp
c0107b06:	50                   	push   %eax
c0107b07:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107b0a:	50                   	push   %eax
c0107b0b:	ff 75 f4             	pushl  -0xc(%ebp)
c0107b0e:	e8 31 d0 ff ff       	call   c0104b44 <write>
c0107b13:	83 c4 10             	add    $0x10,%esp
c0107b16:	83 ec 0c             	sub    $0xc,%esp
c0107b19:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107b1c:	50                   	push   %eax
c0107b1d:	e8 36 31 00 00       	call   c010ac58 <Strlen>
c0107b22:	83 c4 10             	add    $0x10,%esp
c0107b25:	83 ec 04             	sub    $0x4,%esp
c0107b28:	50                   	push   %eax
c0107b29:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107b2c:	50                   	push   %eax
c0107b2d:	ff 75 f4             	pushl  -0xc(%ebp)
c0107b30:	e8 0f d0 ff ff       	call   c0104b44 <write>
c0107b35:	83 c4 10             	add    $0x10,%esp
c0107b38:	83 ec 0c             	sub    $0xc,%esp
c0107b3b:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107b3e:	50                   	push   %eax
c0107b3f:	e8 14 31 00 00       	call   c010ac58 <Strlen>
c0107b44:	83 c4 10             	add    $0x10,%esp
c0107b47:	83 ec 04             	sub    $0x4,%esp
c0107b4a:	50                   	push   %eax
c0107b4b:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107b4e:	50                   	push   %eax
c0107b4f:	ff 75 f4             	pushl  -0xc(%ebp)
c0107b52:	e8 ed cf ff ff       	call   c0104b44 <write>
c0107b57:	83 c4 10             	add    $0x10,%esp
c0107b5a:	e9 c3 00 00 00       	jmp    c0107c22 <INIT_fork+0x289>
c0107b5f:	83 ec 0c             	sub    $0xc,%esp
c0107b62:	6a 01                	push   $0x1
c0107b64:	e8 5d 04 00 00       	call   c0107fc6 <delay>
c0107b69:	83 c4 10             	add    $0x10,%esp
c0107b6c:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0107b70:	83 45 ec 02          	addl   $0x2,-0x14(%ebp)
c0107b74:	c7 45 8e 43 68 69 6c 	movl   $0x6c696843,-0x72(%ebp)
c0107b7b:	c7 45 92 64 2e 53 65 	movl   $0x65532e64,-0x6e(%ebp)
c0107b82:	c7 45 96 65 20 79 6f 	movl   $0x6f792065,-0x6a(%ebp)
c0107b89:	c7 45 9a 75 20 61 67 	movl   $0x67612075,-0x66(%ebp)
c0107b90:	c7 45 9e 61 69 6e 0a 	movl   $0xa6e6961,-0x62(%ebp)
c0107b97:	c7 45 a2 00 00 00 00 	movl   $0x0,-0x5e(%ebp)
c0107b9e:	c7 45 a6 00 00 00 00 	movl   $0x0,-0x5a(%ebp)
c0107ba5:	c7 45 aa 00 00 00 00 	movl   $0x0,-0x56(%ebp)
c0107bac:	c7 45 ae 00 00 00 00 	movl   $0x0,-0x52(%ebp)
c0107bb3:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)
c0107bba:	83 ec 0c             	sub    $0xc,%esp
c0107bbd:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107bc0:	50                   	push   %eax
c0107bc1:	e8 92 30 00 00       	call   c010ac58 <Strlen>
c0107bc6:	83 c4 10             	add    $0x10,%esp
c0107bc9:	83 ec 04             	sub    $0x4,%esp
c0107bcc:	50                   	push   %eax
c0107bcd:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107bd0:	50                   	push   %eax
c0107bd1:	ff 75 f4             	pushl  -0xc(%ebp)
c0107bd4:	e8 6b cf ff ff       	call   c0104b44 <write>
c0107bd9:	83 c4 10             	add    $0x10,%esp
c0107bdc:	83 ec 0c             	sub    $0xc,%esp
c0107bdf:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107be2:	50                   	push   %eax
c0107be3:	e8 70 30 00 00       	call   c010ac58 <Strlen>
c0107be8:	83 c4 10             	add    $0x10,%esp
c0107beb:	83 ec 04             	sub    $0x4,%esp
c0107bee:	50                   	push   %eax
c0107bef:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107bf2:	50                   	push   %eax
c0107bf3:	ff 75 f4             	pushl  -0xc(%ebp)
c0107bf6:	e8 49 cf ff ff       	call   c0104b44 <write>
c0107bfb:	83 c4 10             	add    $0x10,%esp
c0107bfe:	83 ec 0c             	sub    $0xc,%esp
c0107c01:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107c04:	50                   	push   %eax
c0107c05:	e8 4e 30 00 00       	call   c010ac58 <Strlen>
c0107c0a:	83 c4 10             	add    $0x10,%esp
c0107c0d:	83 ec 04             	sub    $0x4,%esp
c0107c10:	50                   	push   %eax
c0107c11:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107c14:	50                   	push   %eax
c0107c15:	ff 75 f4             	pushl  -0xc(%ebp)
c0107c18:	e8 27 cf ff ff       	call   c0104b44 <write>
c0107c1d:	83 c4 10             	add    $0x10,%esp
c0107c20:	eb fe                	jmp    c0107c20 <INIT_fork+0x287>
c0107c22:	83 ec 04             	sub    $0x4,%esp
c0107c25:	6a 28                	push   $0x28
c0107c27:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107c2a:	50                   	push   %eax
c0107c2b:	ff 75 f0             	pushl  -0x10(%ebp)
c0107c2e:	e8 90 cd ff ff       	call   c01049c3 <read>
c0107c33:	83 c4 10             	add    $0x10,%esp
c0107c36:	83 ec 0c             	sub    $0xc,%esp
c0107c39:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107c3c:	50                   	push   %eax
c0107c3d:	e8 b8 04 00 00       	call   c01080fa <Printf>
c0107c42:	83 c4 10             	add    $0x10,%esp
c0107c45:	83 ec 0c             	sub    $0xc,%esp
c0107c48:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107c4b:	50                   	push   %eax
c0107c4c:	e8 a9 04 00 00       	call   c01080fa <Printf>
c0107c51:	83 c4 10             	add    $0x10,%esp
c0107c54:	83 ec 0c             	sub    $0xc,%esp
c0107c57:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107c5a:	50                   	push   %eax
c0107c5b:	e8 9a 04 00 00       	call   c01080fa <Printf>
c0107c60:	83 c4 10             	add    $0x10,%esp
c0107c63:	83 ec 0c             	sub    $0xc,%esp
c0107c66:	68 ab a8 10 c0       	push   $0xc010a8ab
c0107c6b:	e8 a3 07 00 00       	call   c0108413 <spin>
c0107c70:	83 c4 10             	add    $0x10,%esp
c0107c73:	90                   	nop
c0107c74:	c9                   	leave  
c0107c75:	c3                   	ret    

c0107c76 <simple_shell>:
c0107c76:	55                   	push   %ebp
c0107c77:	89 e5                	mov    %esp,%ebp
c0107c79:	81 ec f8 00 00 00    	sub    $0xf8,%esp
c0107c7f:	c7 45 c2 64 65 76 5f 	movl   $0x5f766564,-0x3e(%ebp)
c0107c86:	c7 45 c6 74 74 79 31 	movl   $0x31797474,-0x3a(%ebp)
c0107c8d:	66 c7 45 ca 00 00    	movw   $0x0,-0x36(%ebp)
c0107c93:	83 ec 08             	sub    $0x8,%esp
c0107c96:	6a 02                	push   $0x2
c0107c98:	8d 45 c2             	lea    -0x3e(%ebp),%eax
c0107c9b:	50                   	push   %eax
c0107c9c:	e8 8d cc ff ff       	call   c010492e <open>
c0107ca1:	83 c4 10             	add    $0x10,%esp
c0107ca4:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0107ca7:	83 ec 08             	sub    $0x8,%esp
c0107caa:	6a 02                	push   $0x2
c0107cac:	8d 45 c2             	lea    -0x3e(%ebp),%eax
c0107caf:	50                   	push   %eax
c0107cb0:	e8 79 cc ff ff       	call   c010492e <open>
c0107cb5:	83 c4 10             	add    $0x10,%esp
c0107cb8:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0107cbb:	83 ec 04             	sub    $0x4,%esp
c0107cbe:	68 80 00 00 00       	push   $0x80
c0107cc3:	6a 00                	push   $0x0
c0107cc5:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c0107ccb:	50                   	push   %eax
c0107ccc:	e8 4e 2f 00 00       	call   c010ac1f <Memset>
c0107cd1:	83 c4 10             	add    $0x10,%esp
c0107cd4:	83 ec 04             	sub    $0x4,%esp
c0107cd7:	68 80 00 00 00       	push   $0x80
c0107cdc:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c0107ce2:	50                   	push   %eax
c0107ce3:	ff 75 e0             	pushl  -0x20(%ebp)
c0107ce6:	e8 d8 cc ff ff       	call   c01049c3 <read>
c0107ceb:	83 c4 10             	add    $0x10,%esp
c0107cee:	83 ec 08             	sub    $0x8,%esp
c0107cf1:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c0107cf7:	50                   	push   %eax
c0107cf8:	68 b3 a8 10 c0       	push   $0xc010a8b3
c0107cfd:	e8 f8 03 00 00       	call   c01080fa <Printf>
c0107d02:	83 c4 10             	add    $0x10,%esp
c0107d05:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0107d0c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0107d13:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c0107d19:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0107d1c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0107d1f:	0f b6 00             	movzbl (%eax),%eax
c0107d22:	88 45 db             	mov    %al,-0x25(%ebp)
c0107d25:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0107d28:	0f b6 00             	movzbl (%eax),%eax
c0107d2b:	3c 20                	cmp    $0x20,%al
c0107d2d:	74 1d                	je     c0107d4c <simple_shell+0xd6>
c0107d2f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0107d32:	0f b6 00             	movzbl (%eax),%eax
c0107d35:	84 c0                	test   %al,%al
c0107d37:	74 13                	je     c0107d4c <simple_shell+0xd6>
c0107d39:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0107d3d:	75 0d                	jne    c0107d4c <simple_shell+0xd6>
c0107d3f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0107d42:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0107d45:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0107d4c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0107d4f:	0f b6 00             	movzbl (%eax),%eax
c0107d52:	3c 20                	cmp    $0x20,%al
c0107d54:	74 0a                	je     c0107d60 <simple_shell+0xea>
c0107d56:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0107d59:	0f b6 00             	movzbl (%eax),%eax
c0107d5c:	84 c0                	test   %al,%al
c0107d5e:	75 26                	jne    c0107d86 <simple_shell+0x110>
c0107d60:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
c0107d64:	75 20                	jne    c0107d86 <simple_shell+0x110>
c0107d66:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0107d69:	8d 50 01             	lea    0x1(%eax),%edx
c0107d6c:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0107d6f:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0107d72:	89 94 85 14 ff ff ff 	mov    %edx,-0xec(%ebp,%eax,4)
c0107d79:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0107d7c:	c6 00 00             	movb   $0x0,(%eax)
c0107d7f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0107d86:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0107d8a:	80 7d db 00          	cmpb   $0x0,-0x25(%ebp)
c0107d8e:	75 8c                	jne    c0107d1c <simple_shell+0xa6>
c0107d90:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0107d93:	c7 84 85 14 ff ff ff 	movl   $0x0,-0xec(%ebp,%eax,4)
c0107d9a:	00 00 00 00 
c0107d9e:	c7 45 d4 ff ff ff ff 	movl   $0xffffffff,-0x2c(%ebp)
c0107da5:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0107dab:	83 ec 08             	sub    $0x8,%esp
c0107dae:	6a 02                	push   $0x2
c0107db0:	50                   	push   %eax
c0107db1:	e8 78 cb ff ff       	call   c010492e <open>
c0107db6:	83 c4 10             	add    $0x10,%esp
c0107db9:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0107dbc:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0107dc0:	75 54                	jne    c0107e16 <simple_shell+0x1a0>
c0107dc2:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0107dc9:	eb 29                	jmp    c0107df4 <simple_shell+0x17e>
c0107dcb:	8b 95 14 ff ff ff    	mov    -0xec(%ebp),%edx
c0107dd1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0107dd4:	01 d0                	add    %edx,%eax
c0107dd6:	0f b6 00             	movzbl (%eax),%eax
c0107dd9:	0f be c0             	movsbl %al,%eax
c0107ddc:	83 ec 04             	sub    $0x4,%esp
c0107ddf:	50                   	push   %eax
c0107de0:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107de3:	68 c2 a8 10 c0       	push   $0xc010a8c2
c0107de8:	e8 0d 03 00 00       	call   c01080fa <Printf>
c0107ded:	83 c4 10             	add    $0x10,%esp
c0107df0:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0107df4:	83 7d e4 05          	cmpl   $0x5,-0x1c(%ebp)
c0107df8:	7e d1                	jle    c0107dcb <simple_shell+0x155>
c0107dfa:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0107e00:	83 ec 08             	sub    $0x8,%esp
c0107e03:	50                   	push   %eax
c0107e04:	68 c9 a8 10 c0       	push   $0xc010a8c9
c0107e09:	e8 ec 02 00 00       	call   c01080fa <Printf>
c0107e0e:	83 c4 10             	add    $0x10,%esp
c0107e11:	e9 a5 fe ff ff       	jmp    c0107cbb <simple_shell+0x45>
c0107e16:	e8 73 ce ff ff       	call   c0104c8e <fork>
c0107e1b:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0107e1e:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0107e22:	7e 17                	jle    c0107e3b <simple_shell+0x1c5>
c0107e24:	83 ec 0c             	sub    $0xc,%esp
c0107e27:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c0107e2d:	50                   	push   %eax
c0107e2e:	e8 e8 cd ff ff       	call   c0104c1b <wait>
c0107e33:	83 c4 10             	add    $0x10,%esp
c0107e36:	e9 80 fe ff ff       	jmp    c0107cbb <simple_shell+0x45>
c0107e3b:	83 ec 0c             	sub    $0xc,%esp
c0107e3e:	68 cf a8 10 c0       	push   $0xc010a8cf
c0107e43:	e8 b2 02 00 00       	call   c01080fa <Printf>
c0107e48:	83 c4 10             	add    $0x10,%esp
c0107e4b:	83 ec 0c             	sub    $0xc,%esp
c0107e4e:	ff 75 d0             	pushl  -0x30(%ebp)
c0107e51:	e8 73 cd ff ff       	call   c0104bc9 <close>
c0107e56:	83 c4 10             	add    $0x10,%esp
c0107e59:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0107e5f:	83 ec 08             	sub    $0x8,%esp
c0107e62:	8d 95 14 ff ff ff    	lea    -0xec(%ebp),%edx
c0107e68:	52                   	push   %edx
c0107e69:	50                   	push   %eax
c0107e6a:	e8 03 cf ff ff       	call   c0104d72 <execv>
c0107e6f:	83 c4 10             	add    $0x10,%esp
c0107e72:	eb fe                	jmp    c0107e72 <simple_shell+0x1fc>

c0107e74 <test_shell>:
c0107e74:	55                   	push   %ebp
c0107e75:	89 e5                	mov    %esp,%ebp
c0107e77:	83 ec 38             	sub    $0x38,%esp
c0107e7a:	c7 45 ea 64 65 76 5f 	movl   $0x5f766564,-0x16(%ebp)
c0107e81:	c7 45 ee 74 74 79 31 	movl   $0x31797474,-0x12(%ebp)
c0107e88:	66 c7 45 f2 00 00    	movw   $0x0,-0xe(%ebp)
c0107e8e:	83 ec 08             	sub    $0x8,%esp
c0107e91:	6a 02                	push   $0x2
c0107e93:	8d 45 ea             	lea    -0x16(%ebp),%eax
c0107e96:	50                   	push   %eax
c0107e97:	e8 92 ca ff ff       	call   c010492e <open>
c0107e9c:	83 c4 10             	add    $0x10,%esp
c0107e9f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0107ea2:	c7 45 d6 69 6e 73 74 	movl   $0x74736e69,-0x2a(%ebp)
c0107ea9:	c7 45 da 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x26(%ebp)
c0107eb0:	c7 45 de 74 61 72 00 	movl   $0x726174,-0x22(%ebp)
c0107eb7:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c0107ebe:	c7 45 e6 00 00 00 00 	movl   $0x0,-0x1a(%ebp)
c0107ec5:	83 ec 0c             	sub    $0xc,%esp
c0107ec8:	8d 45 d6             	lea    -0x2a(%ebp),%eax
c0107ecb:	50                   	push   %eax
c0107ecc:	e8 e0 eb ff ff       	call   c0106ab1 <untar>
c0107ed1:	83 c4 10             	add    $0x10,%esp
c0107ed4:	e8 9d fd ff ff       	call   c0107c76 <simple_shell>
c0107ed9:	90                   	nop
c0107eda:	c9                   	leave  
c0107edb:	c3                   	ret    

c0107edc <test_exec>:
c0107edc:	55                   	push   %ebp
c0107edd:	89 e5                	mov    %esp,%ebp
c0107edf:	83 ec 38             	sub    $0x38,%esp
c0107ee2:	83 ec 0c             	sub    $0xc,%esp
c0107ee5:	68 b3 a7 10 c0       	push   $0xc010a7b3
c0107eea:	e8 9d 81 ff ff       	call   c010008c <disp_str>
c0107eef:	83 c4 10             	add    $0x10,%esp
c0107ef2:	83 ec 0c             	sub    $0xc,%esp
c0107ef5:	68 b5 a7 10 c0       	push   $0xc010a7b5
c0107efa:	e8 8d 81 ff ff       	call   c010008c <disp_str>
c0107eff:	83 c4 10             	add    $0x10,%esp
c0107f02:	c7 45 ea 64 65 76 5f 	movl   $0x5f766564,-0x16(%ebp)
c0107f09:	c7 45 ee 74 74 79 31 	movl   $0x31797474,-0x12(%ebp)
c0107f10:	66 c7 45 f2 00 00    	movw   $0x0,-0xe(%ebp)
c0107f16:	83 ec 08             	sub    $0x8,%esp
c0107f19:	6a 02                	push   $0x2
c0107f1b:	8d 45 ea             	lea    -0x16(%ebp),%eax
c0107f1e:	50                   	push   %eax
c0107f1f:	e8 0a ca ff ff       	call   c010492e <open>
c0107f24:	83 c4 10             	add    $0x10,%esp
c0107f27:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0107f2a:	c7 45 d6 69 6e 73 74 	movl   $0x74736e69,-0x2a(%ebp)
c0107f31:	c7 45 da 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x26(%ebp)
c0107f38:	c7 45 de 74 61 72 00 	movl   $0x726174,-0x22(%ebp)
c0107f3f:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c0107f46:	c7 45 e6 00 00 00 00 	movl   $0x0,-0x1a(%ebp)
c0107f4d:	83 ec 0c             	sub    $0xc,%esp
c0107f50:	8d 45 d6             	lea    -0x2a(%ebp),%eax
c0107f53:	50                   	push   %eax
c0107f54:	e8 58 eb ff ff       	call   c0106ab1 <untar>
c0107f59:	83 c4 10             	add    $0x10,%esp
c0107f5c:	83 ec 08             	sub    $0x8,%esp
c0107f5f:	6a 00                	push   $0x0
c0107f61:	68 eb a8 10 c0       	push   $0xc010a8eb
c0107f66:	68 ef a8 10 c0       	push   $0xc010a8ef
c0107f6b:	68 f5 a8 10 c0       	push   $0xc010a8f5
c0107f70:	68 fb a8 10 c0       	push   $0xc010a8fb
c0107f75:	68 00 a9 10 c0       	push   $0xc010a900
c0107f7a:	e8 d8 cf ff ff       	call   c0104f57 <execl>
c0107f7f:	83 c4 20             	add    $0x20,%esp
c0107f82:	eb fe                	jmp    c0107f82 <test_exec+0xa6>

c0107f84 <INIT>:
c0107f84:	55                   	push   %ebp
c0107f85:	89 e5                	mov    %esp,%ebp
c0107f87:	83 ec 08             	sub    $0x8,%esp
c0107f8a:	e8 e5 fe ff ff       	call   c0107e74 <test_shell>
c0107f8f:	eb fe                	jmp    c0107f8f <INIT+0xb>

c0107f91 <TestA>:
c0107f91:	55                   	push   %ebp
c0107f92:	89 e5                	mov    %esp,%ebp
c0107f94:	83 ec 08             	sub    $0x8,%esp
c0107f97:	83 ec 0c             	sub    $0xc,%esp
c0107f9a:	6a 05                	push   $0x5
c0107f9c:	e8 c6 ee ff ff       	call   c0106e67 <disp_int>
c0107fa1:	83 c4 10             	add    $0x10,%esp
c0107fa4:	83 ec 0c             	sub    $0xc,%esp
c0107fa7:	68 af a4 10 c0       	push   $0xc010a4af
c0107fac:	e8 db 80 ff ff       	call   c010008c <disp_str>
c0107fb1:	83 c4 10             	add    $0x10,%esp
c0107fb4:	83 ec 0c             	sub    $0xc,%esp
c0107fb7:	68 06 a9 10 c0       	push   $0xc010a906
c0107fbc:	e8 cb 80 ff ff       	call   c010008c <disp_str>
c0107fc1:	83 c4 10             	add    $0x10,%esp
c0107fc4:	eb fe                	jmp    c0107fc4 <TestA+0x33>

c0107fc6 <delay>:
c0107fc6:	55                   	push   %ebp
c0107fc7:	89 e5                	mov    %esp,%ebp
c0107fc9:	83 ec 10             	sub    $0x10,%esp
c0107fcc:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0107fd3:	eb 2a                	jmp    c0107fff <delay+0x39>
c0107fd5:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0107fdc:	eb 17                	jmp    c0107ff5 <delay+0x2f>
c0107fde:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0107fe5:	eb 04                	jmp    c0107feb <delay+0x25>
c0107fe7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0107feb:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c0107fef:	7e f6                	jle    c0107fe7 <delay+0x21>
c0107ff1:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0107ff5:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
c0107ff9:	7e e3                	jle    c0107fde <delay+0x18>
c0107ffb:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0107fff:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0108002:	3b 45 08             	cmp    0x8(%ebp),%eax
c0108005:	7c ce                	jl     c0107fd5 <delay+0xf>
c0108007:	90                   	nop
c0108008:	c9                   	leave  
c0108009:	c3                   	ret    

c010800a <TestB>:
c010800a:	55                   	push   %ebp
c010800b:	89 e5                	mov    %esp,%ebp
c010800d:	83 ec 08             	sub    $0x8,%esp
c0108010:	83 ec 0c             	sub    $0xc,%esp
c0108013:	68 0d a9 10 c0       	push   $0xc010a90d
c0108018:	e8 6f 80 ff ff       	call   c010008c <disp_str>
c010801d:	83 c4 10             	add    $0x10,%esp
c0108020:	eb fe                	jmp    c0108020 <TestB+0x16>

c0108022 <TestC>:
c0108022:	55                   	push   %ebp
c0108023:	89 e5                	mov    %esp,%ebp
c0108025:	83 ec 18             	sub    $0x18,%esp
c0108028:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010802f:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c0108033:	77 1a                	ja     c010804f <TestC+0x2d>
c0108035:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
c010803c:	83 ec 08             	sub    $0x8,%esp
c010803f:	ff 75 f0             	pushl  -0x10(%ebp)
c0108042:	68 10 a9 10 c0       	push   $0xc010a910
c0108047:	e8 ae 00 00 00       	call   c01080fa <Printf>
c010804c:	83 c4 10             	add    $0x10,%esp
c010804f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0108053:	eb da                	jmp    c010802f <TestC+0xd>

c0108055 <sys_get_ticks>:
c0108055:	55                   	push   %ebp
c0108056:	89 e5                	mov    %esp,%ebp
c0108058:	a1 e8 0e 11 c0       	mov    0xc0110ee8,%eax
c010805d:	8b 15 ec 0e 11 c0    	mov    0xc0110eec,%edx
c0108063:	5d                   	pop    %ebp
c0108064:	c3                   	ret    

c0108065 <sys_write>:
c0108065:	55                   	push   %ebp
c0108066:	89 e5                	mov    %esp,%ebp
c0108068:	83 ec 18             	sub    $0x18,%esp
c010806b:	8b 45 10             	mov    0x10(%ebp),%eax
c010806e:	8b 80 30 01 00 00    	mov    0x130(%eax),%eax
c0108074:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c010807a:	05 00 fe 10 c0       	add    $0xc010fe00,%eax
c010807f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108082:	8b 45 0c             	mov    0xc(%ebp),%eax
c0108085:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108088:	8b 45 08             	mov    0x8(%ebp),%eax
c010808b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010808e:	eb 20                	jmp    c01080b0 <sys_write+0x4b>
c0108090:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108093:	0f b6 00             	movzbl (%eax),%eax
c0108096:	0f b6 c0             	movzbl %al,%eax
c0108099:	83 ec 08             	sub    $0x8,%esp
c010809c:	50                   	push   %eax
c010809d:	ff 75 ec             	pushl  -0x14(%ebp)
c01080a0:	e8 fa bb ff ff       	call   c0103c9f <out_char>
c01080a5:	83 c4 10             	add    $0x10,%esp
c01080a8:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01080ac:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
c01080b0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01080b4:	7f da                	jg     c0108090 <sys_write+0x2b>
c01080b6:	90                   	nop
c01080b7:	c9                   	leave  
c01080b8:	c3                   	ret    

c01080b9 <milli_delay>:
c01080b9:	55                   	push   %ebp
c01080ba:	89 e5                	mov    %esp,%ebp
c01080bc:	83 ec 18             	sub    $0x18,%esp
c01080bf:	e8 37 0f 00 00       	call   c0108ffb <get_ticks_ipc>
c01080c4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01080c7:	90                   	nop
c01080c8:	e8 2e 0f 00 00       	call   c0108ffb <get_ticks_ipc>
c01080cd:	2b 45 f4             	sub    -0xc(%ebp),%eax
c01080d0:	89 c1                	mov    %eax,%ecx
c01080d2:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
c01080d7:	89 c8                	mov    %ecx,%eax
c01080d9:	f7 ea                	imul   %edx
c01080db:	c1 fa 05             	sar    $0x5,%edx
c01080de:	89 c8                	mov    %ecx,%eax
c01080e0:	c1 f8 1f             	sar    $0x1f,%eax
c01080e3:	29 c2                	sub    %eax,%edx
c01080e5:	89 d0                	mov    %edx,%eax
c01080e7:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
c01080ed:	39 45 08             	cmp    %eax,0x8(%ebp)
c01080f0:	77 d6                	ja     c01080c8 <milli_delay+0xf>
c01080f2:	90                   	nop
c01080f3:	c9                   	leave  
c01080f4:	c3                   	ret    

c01080f5 <TaskSys>:
c01080f5:	55                   	push   %ebp
c01080f6:	89 e5                	mov    %esp,%ebp
c01080f8:	eb fe                	jmp    c01080f8 <TaskSys+0x3>

c01080fa <Printf>:
c01080fa:	55                   	push   %ebp
c01080fb:	89 e5                	mov    %esp,%ebp
c01080fd:	81 ec 18 01 00 00    	sub    $0x118,%esp
c0108103:	83 ec 04             	sub    $0x4,%esp
c0108106:	68 00 01 00 00       	push   $0x100
c010810b:	6a 00                	push   $0x0
c010810d:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108113:	50                   	push   %eax
c0108114:	e8 06 2b 00 00       	call   c010ac1f <Memset>
c0108119:	83 c4 10             	add    $0x10,%esp
c010811c:	8d 45 0c             	lea    0xc(%ebp),%eax
c010811f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108122:	8b 45 08             	mov    0x8(%ebp),%eax
c0108125:	83 ec 04             	sub    $0x4,%esp
c0108128:	ff 75 f4             	pushl  -0xc(%ebp)
c010812b:	50                   	push   %eax
c010812c:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108132:	50                   	push   %eax
c0108133:	e8 20 00 00 00       	call   c0108158 <vsprintf>
c0108138:	83 c4 10             	add    $0x10,%esp
c010813b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010813e:	83 ec 04             	sub    $0x4,%esp
c0108141:	ff 75 f0             	pushl  -0x10(%ebp)
c0108144:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c010814a:	50                   	push   %eax
c010814b:	6a 00                	push   $0x0
c010814d:	e8 f2 c9 ff ff       	call   c0104b44 <write>
c0108152:	83 c4 10             	add    $0x10,%esp
c0108155:	90                   	nop
c0108156:	c9                   	leave  
c0108157:	c3                   	ret    

c0108158 <vsprintf>:
c0108158:	55                   	push   %ebp
c0108159:	89 e5                	mov    %esp,%ebp
c010815b:	81 ec 68 02 00 00    	sub    $0x268,%esp
c0108161:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0108167:	89 85 e4 fd ff ff    	mov    %eax,-0x21c(%ebp)
c010816d:	83 ec 04             	sub    $0x4,%esp
c0108170:	6a 40                	push   $0x40
c0108172:	6a 00                	push   $0x0
c0108174:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c010817a:	50                   	push   %eax
c010817b:	e8 9f 2a 00 00       	call   c010ac1f <Memset>
c0108180:	83 c4 10             	add    $0x10,%esp
c0108183:	8b 45 10             	mov    0x10(%ebp),%eax
c0108186:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108189:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0108190:	8b 45 08             	mov    0x8(%ebp),%eax
c0108193:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108196:	e9 53 01 00 00       	jmp    c01082ee <vsprintf+0x196>
c010819b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010819e:	0f b6 00             	movzbl (%eax),%eax
c01081a1:	3c 25                	cmp    $0x25,%al
c01081a3:	74 16                	je     c01081bb <vsprintf+0x63>
c01081a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01081a8:	8d 50 01             	lea    0x1(%eax),%edx
c01081ab:	89 55 f4             	mov    %edx,-0xc(%ebp)
c01081ae:	8b 55 0c             	mov    0xc(%ebp),%edx
c01081b1:	0f b6 12             	movzbl (%edx),%edx
c01081b4:	88 10                	mov    %dl,(%eax)
c01081b6:	e9 2f 01 00 00       	jmp    c01082ea <vsprintf+0x192>
c01081bb:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c01081bf:	8b 45 0c             	mov    0xc(%ebp),%eax
c01081c2:	0f b6 00             	movzbl (%eax),%eax
c01081c5:	0f be c0             	movsbl %al,%eax
c01081c8:	83 f8 64             	cmp    $0x64,%eax
c01081cb:	74 26                	je     c01081f3 <vsprintf+0x9b>
c01081cd:	83 f8 64             	cmp    $0x64,%eax
c01081d0:	7f 0e                	jg     c01081e0 <vsprintf+0x88>
c01081d2:	83 f8 63             	cmp    $0x63,%eax
c01081d5:	0f 84 f2 00 00 00    	je     c01082cd <vsprintf+0x175>
c01081db:	e9 0a 01 00 00       	jmp    c01082ea <vsprintf+0x192>
c01081e0:	83 f8 73             	cmp    $0x73,%eax
c01081e3:	0f 84 b0 00 00 00    	je     c0108299 <vsprintf+0x141>
c01081e9:	83 f8 78             	cmp    $0x78,%eax
c01081ec:	74 5d                	je     c010824b <vsprintf+0xf3>
c01081ee:	e9 f7 00 00 00       	jmp    c01082ea <vsprintf+0x192>
c01081f3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01081f6:	8b 00                	mov    (%eax),%eax
c01081f8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01081fb:	83 ec 04             	sub    $0x4,%esp
c01081fe:	6a 0a                	push   $0xa
c0108200:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c0108206:	50                   	push   %eax
c0108207:	ff 75 e8             	pushl  -0x18(%ebp)
c010820a:	e8 43 0e 00 00       	call   c0109052 <itoa>
c010820f:	83 c4 10             	add    $0x10,%esp
c0108212:	83 ec 08             	sub    $0x8,%esp
c0108215:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c010821b:	50                   	push   %eax
c010821c:	ff 75 f4             	pushl  -0xc(%ebp)
c010821f:	e8 1a 2a 00 00       	call   c010ac3e <Strcpy>
c0108224:	83 c4 10             	add    $0x10,%esp
c0108227:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c010822b:	83 ec 0c             	sub    $0xc,%esp
c010822e:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0108234:	50                   	push   %eax
c0108235:	e8 1e 2a 00 00       	call   c010ac58 <Strlen>
c010823a:	83 c4 10             	add    $0x10,%esp
c010823d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108240:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0108243:	01 45 f4             	add    %eax,-0xc(%ebp)
c0108246:	e9 9f 00 00 00       	jmp    c01082ea <vsprintf+0x192>
c010824b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010824e:	8b 00                	mov    (%eax),%eax
c0108250:	83 ec 08             	sub    $0x8,%esp
c0108253:	50                   	push   %eax
c0108254:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c010825a:	50                   	push   %eax
c010825b:	e8 61 eb ff ff       	call   c0106dc1 <atoi>
c0108260:	83 c4 10             	add    $0x10,%esp
c0108263:	83 ec 08             	sub    $0x8,%esp
c0108266:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c010826c:	50                   	push   %eax
c010826d:	ff 75 f4             	pushl  -0xc(%ebp)
c0108270:	e8 c9 29 00 00       	call   c010ac3e <Strcpy>
c0108275:	83 c4 10             	add    $0x10,%esp
c0108278:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c010827c:	83 ec 0c             	sub    $0xc,%esp
c010827f:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0108285:	50                   	push   %eax
c0108286:	e8 cd 29 00 00       	call   c010ac58 <Strlen>
c010828b:	83 c4 10             	add    $0x10,%esp
c010828e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108291:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0108294:	01 45 f4             	add    %eax,-0xc(%ebp)
c0108297:	eb 51                	jmp    c01082ea <vsprintf+0x192>
c0108299:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010829c:	8b 00                	mov    (%eax),%eax
c010829e:	83 ec 08             	sub    $0x8,%esp
c01082a1:	50                   	push   %eax
c01082a2:	ff 75 f4             	pushl  -0xc(%ebp)
c01082a5:	e8 94 29 00 00       	call   c010ac3e <Strcpy>
c01082aa:	83 c4 10             	add    $0x10,%esp
c01082ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01082b0:	8b 00                	mov    (%eax),%eax
c01082b2:	83 ec 0c             	sub    $0xc,%esp
c01082b5:	50                   	push   %eax
c01082b6:	e8 9d 29 00 00       	call   c010ac58 <Strlen>
c01082bb:	83 c4 10             	add    $0x10,%esp
c01082be:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01082c1:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c01082c5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01082c8:	01 45 f4             	add    %eax,-0xc(%ebp)
c01082cb:	eb 1d                	jmp    c01082ea <vsprintf+0x192>
c01082cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01082d0:	0f b6 10             	movzbl (%eax),%edx
c01082d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01082d6:	88 10                	mov    %dl,(%eax)
c01082d8:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c01082dc:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c01082e3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01082e6:	01 45 f4             	add    %eax,-0xc(%ebp)
c01082e9:	90                   	nop
c01082ea:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c01082ee:	8b 45 0c             	mov    0xc(%ebp),%eax
c01082f1:	0f b6 00             	movzbl (%eax),%eax
c01082f4:	84 c0                	test   %al,%al
c01082f6:	0f 85 9f fe ff ff    	jne    c010819b <vsprintf+0x43>
c01082fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01082ff:	2b 45 08             	sub    0x8(%ebp),%eax
c0108302:	c9                   	leave  
c0108303:	c3                   	ret    

c0108304 <printx>:
c0108304:	55                   	push   %ebp
c0108305:	89 e5                	mov    %esp,%ebp
c0108307:	81 ec 18 01 00 00    	sub    $0x118,%esp
c010830d:	8d 45 0c             	lea    0xc(%ebp),%eax
c0108310:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108313:	8b 45 08             	mov    0x8(%ebp),%eax
c0108316:	83 ec 04             	sub    $0x4,%esp
c0108319:	ff 75 f4             	pushl  -0xc(%ebp)
c010831c:	50                   	push   %eax
c010831d:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108323:	50                   	push   %eax
c0108324:	e8 2f fe ff ff       	call   c0108158 <vsprintf>
c0108329:	83 c4 10             	add    $0x10,%esp
c010832c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010832f:	83 ec 08             	sub    $0x8,%esp
c0108332:	ff 75 f0             	pushl  -0x10(%ebp)
c0108335:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c010833b:	50                   	push   %eax
c010833c:	e8 ff 90 ff ff       	call   c0101440 <write_debug>
c0108341:	83 c4 10             	add    $0x10,%esp
c0108344:	90                   	nop
c0108345:	c9                   	leave  
c0108346:	c3                   	ret    

c0108347 <sys_printx>:
c0108347:	55                   	push   %ebp
c0108348:	89 e5                	mov    %esp,%ebp
c010834a:	83 ec 28             	sub    $0x28,%esp
c010834d:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c0108352:	85 c0                	test   %eax,%eax
c0108354:	75 15                	jne    c010836b <sys_printx+0x24>
c0108356:	8b 45 10             	mov    0x10(%ebp),%eax
c0108359:	8b 80 78 02 00 00    	mov    0x278(%eax),%eax
c010835f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108362:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108369:	eb 10                	jmp    c010837b <sys_printx+0x34>
c010836b:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c0108370:	85 c0                	test   %eax,%eax
c0108372:	74 07                	je     c010837b <sys_printx+0x34>
c0108374:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010837b:	8b 55 08             	mov    0x8(%ebp),%edx
c010837e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108381:	01 d0                	add    %edx,%eax
c0108383:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0108386:	8b 45 10             	mov    0x10(%ebp),%eax
c0108389:	8b 80 30 01 00 00    	mov    0x130(%eax),%eax
c010838f:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0108395:	05 00 fe 10 c0       	add    $0xc010fe00,%eax
c010839a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010839d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01083a0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01083a3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01083a6:	0f b6 00             	movzbl (%eax),%eax
c01083a9:	88 45 e3             	mov    %al,-0x1d(%ebp)
c01083ac:	eb 3a                	jmp    c01083e8 <sys_printx+0xa1>
c01083ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01083b1:	0f b6 00             	movzbl (%eax),%eax
c01083b4:	3c 3b                	cmp    $0x3b,%al
c01083b6:	74 0a                	je     c01083c2 <sys_printx+0x7b>
c01083b8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01083bb:	0f b6 00             	movzbl (%eax),%eax
c01083be:	3c 3a                	cmp    $0x3a,%al
c01083c0:	75 06                	jne    c01083c8 <sys_printx+0x81>
c01083c2:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01083c6:	eb 20                	jmp    c01083e8 <sys_printx+0xa1>
c01083c8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01083cb:	0f b6 00             	movzbl (%eax),%eax
c01083ce:	0f b6 c0             	movzbl %al,%eax
c01083d1:	83 ec 08             	sub    $0x8,%esp
c01083d4:	50                   	push   %eax
c01083d5:	ff 75 e4             	pushl  -0x1c(%ebp)
c01083d8:	e8 c2 b8 ff ff       	call   c0103c9f <out_char>
c01083dd:	83 c4 10             	add    $0x10,%esp
c01083e0:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01083e4:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c01083e8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01083ec:	7f c0                	jg     c01083ae <sys_printx+0x67>
c01083ee:	80 7d e3 3b          	cmpb   $0x3b,-0x1d(%ebp)
c01083f2:	75 10                	jne    c0108404 <sys_printx+0xbd>
c01083f4:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c01083f9:	85 c0                	test   %eax,%eax
c01083fb:	74 13                	je     c0108410 <sys_printx+0xc9>
c01083fd:	e8 b9 7e ff ff       	call   c01002bb <disable_int>
c0108402:	eb 0c                	jmp    c0108410 <sys_printx+0xc9>
c0108404:	80 7d e3 3a          	cmpb   $0x3a,-0x1d(%ebp)
c0108408:	75 06                	jne    c0108410 <sys_printx+0xc9>
c010840a:	e8 ac 7e ff ff       	call   c01002bb <disable_int>
c010840f:	90                   	nop
c0108410:	90                   	nop
c0108411:	c9                   	leave  
c0108412:	c3                   	ret    

c0108413 <spin>:
c0108413:	55                   	push   %ebp
c0108414:	89 e5                	mov    %esp,%ebp
c0108416:	83 ec 08             	sub    $0x8,%esp
c0108419:	83 ec 0c             	sub    $0xc,%esp
c010841c:	ff 75 08             	pushl  0x8(%ebp)
c010841f:	e8 68 7c ff ff       	call   c010008c <disp_str>
c0108424:	83 c4 10             	add    $0x10,%esp
c0108427:	83 ec 0c             	sub    $0xc,%esp
c010842a:	68 af a4 10 c0       	push   $0xc010a4af
c010842f:	e8 58 7c ff ff       	call   c010008c <disp_str>
c0108434:	83 c4 10             	add    $0x10,%esp
c0108437:	eb fe                	jmp    c0108437 <spin+0x24>

c0108439 <panic>:
c0108439:	55                   	push   %ebp
c010843a:	89 e5                	mov    %esp,%ebp
c010843c:	83 ec 08             	sub    $0x8,%esp
c010843f:	83 ec 04             	sub    $0x4,%esp
c0108442:	ff 75 08             	pushl  0x8(%ebp)
c0108445:	6a 3a                	push   $0x3a
c0108447:	68 1d a9 10 c0       	push   $0xc010a91d
c010844c:	e8 b3 fe ff ff       	call   c0108304 <printx>
c0108451:	83 c4 10             	add    $0x10,%esp
c0108454:	90                   	nop
c0108455:	c9                   	leave  
c0108456:	c3                   	ret    

c0108457 <assertion_failure>:
c0108457:	55                   	push   %ebp
c0108458:	89 e5                	mov    %esp,%ebp
c010845a:	83 ec 08             	sub    $0x8,%esp
c010845d:	83 ec 08             	sub    $0x8,%esp
c0108460:	ff 75 14             	pushl  0x14(%ebp)
c0108463:	ff 75 10             	pushl  0x10(%ebp)
c0108466:	ff 75 0c             	pushl  0xc(%ebp)
c0108469:	ff 75 08             	pushl  0x8(%ebp)
c010846c:	6a 3b                	push   $0x3b
c010846e:	68 24 a9 10 c0       	push   $0xc010a924
c0108473:	e8 8c fe ff ff       	call   c0108304 <printx>
c0108478:	83 c4 20             	add    $0x20,%esp
c010847b:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0108482:	00 00 00 
c0108485:	83 ec 0c             	sub    $0xc,%esp
c0108488:	68 b3 a7 10 c0       	push   $0xc010a7b3
c010848d:	e8 fa 7b ff ff       	call   c010008c <disp_str>
c0108492:	83 c4 10             	add    $0x10,%esp
c0108495:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c010849a:	83 ec 0c             	sub    $0xc,%esp
c010849d:	50                   	push   %eax
c010849e:	e8 c4 e9 ff ff       	call   c0106e67 <disp_int>
c01084a3:	83 c4 10             	add    $0x10,%esp
c01084a6:	83 ec 0c             	sub    $0xc,%esp
c01084a9:	68 b5 a7 10 c0       	push   $0xc010a7b5
c01084ae:	e8 d9 7b ff ff       	call   c010008c <disp_str>
c01084b3:	83 c4 10             	add    $0x10,%esp
c01084b6:	83 ec 0c             	sub    $0xc,%esp
c01084b9:	68 57 a9 10 c0       	push   $0xc010a957
c01084be:	e8 50 ff ff ff       	call   c0108413 <spin>
c01084c3:	83 c4 10             	add    $0x10,%esp
c01084c6:	90                   	nop
c01084c7:	c9                   	leave  
c01084c8:	c3                   	ret    

c01084c9 <dead_lock>:
c01084c9:	55                   	push   %ebp
c01084ca:	89 e5                	mov    %esp,%ebp
c01084cc:	b8 00 00 00 00       	mov    $0x0,%eax
c01084d1:	5d                   	pop    %ebp
c01084d2:	c3                   	ret    

c01084d3 <sys_send_msg>:
c01084d3:	55                   	push   %ebp
c01084d4:	89 e5                	mov    %esp,%ebp
c01084d6:	83 ec 58             	sub    $0x58,%esp
c01084d9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01084e0:	83 ec 0c             	sub    $0xc,%esp
c01084e3:	ff 75 0c             	pushl  0xc(%ebp)
c01084e6:	e8 41 b1 ff ff       	call   c010362c <pid2proc>
c01084eb:	83 c4 10             	add    $0x10,%esp
c01084ee:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01084f1:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c01084f5:	74 2c                	je     c0108523 <sys_send_msg+0x50>
c01084f7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01084fa:	8b 80 b0 02 00 00    	mov    0x2b0(%eax),%eax
c0108500:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0108505:	74 1c                	je     c0108523 <sys_send_msg+0x50>
c0108507:	68 03 05 00 00       	push   $0x503
c010850c:	68 63 a9 10 c0       	push   $0xc010a963
c0108511:	68 63 a9 10 c0       	push   $0xc010a963
c0108516:	68 74 a9 10 c0       	push   $0xc010a974
c010851b:	e8 37 ff ff ff       	call   c0108457 <assertion_failure>
c0108520:	83 c4 10             	add    $0x10,%esp
c0108523:	8b 45 10             	mov    0x10(%ebp),%eax
c0108526:	8b 80 b0 02 00 00    	mov    0x2b0(%eax),%eax
c010852c:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0108531:	74 1c                	je     c010854f <sys_send_msg+0x7c>
c0108533:	68 05 05 00 00       	push   $0x505
c0108538:	68 63 a9 10 c0       	push   $0xc010a963
c010853d:	68 63 a9 10 c0       	push   $0xc010a963
c0108542:	68 9c a9 10 c0       	push   $0xc010a99c
c0108547:	e8 0b ff ff ff       	call   c0108457 <assertion_failure>
c010854c:	83 c4 10             	add    $0x10,%esp
c010854f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0108553:	75 22                	jne    c0108577 <sys_send_msg+0xa4>
c0108555:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0108559:	75 1c                	jne    c0108577 <sys_send_msg+0xa4>
c010855b:	68 08 05 00 00       	push   $0x508
c0108560:	68 63 a9 10 c0       	push   $0xc010a963
c0108565:	68 63 a9 10 c0       	push   $0xc010a963
c010856a:	68 bf a9 10 c0       	push   $0xc010a9bf
c010856f:	e8 e3 fe ff ff       	call   c0108457 <assertion_failure>
c0108574:	83 c4 10             	add    $0x10,%esp
c0108577:	83 ec 0c             	sub    $0xc,%esp
c010857a:	ff 75 10             	pushl  0x10(%ebp)
c010857d:	e8 1c b1 ff ff       	call   c010369e <proc2pid>
c0108582:	83 c4 10             	add    $0x10,%esp
c0108585:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0108588:	c7 45 e0 7c 00 00 00 	movl   $0x7c,-0x20(%ebp)
c010858f:	8b 45 08             	mov    0x8(%ebp),%eax
c0108592:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0108595:	83 ec 08             	sub    $0x8,%esp
c0108598:	ff 75 e4             	pushl  -0x1c(%ebp)
c010859b:	ff 75 dc             	pushl  -0x24(%ebp)
c010859e:	e8 8f d7 ff ff       	call   c0105d32 <get_physical_address_proc>
c01085a3:	83 c4 10             	add    $0x10,%esp
c01085a6:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01085a9:	83 ec 08             	sub    $0x8,%esp
c01085ac:	ff 75 e0             	pushl  -0x20(%ebp)
c01085af:	ff 75 d8             	pushl  -0x28(%ebp)
c01085b2:	e8 ad d6 ff ff       	call   c0105c64 <alloc_virtual_memory>
c01085b7:	83 c4 10             	add    $0x10,%esp
c01085ba:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01085bd:	8b 45 10             	mov    0x10(%ebp),%eax
c01085c0:	8b 80 78 02 00 00    	mov    0x278(%eax),%eax
c01085c6:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01085c9:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c01085d0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01085d3:	89 45 c8             	mov    %eax,-0x38(%ebp)
c01085d6:	8b 45 c8             	mov    -0x38(%ebp),%eax
c01085d9:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01085dc:	89 10                	mov    %edx,(%eax)
c01085de:	83 ec 08             	sub    $0x8,%esp
c01085e1:	ff 75 0c             	pushl  0xc(%ebp)
c01085e4:	ff 75 e4             	pushl  -0x1c(%ebp)
c01085e7:	e8 dd fe ff ff       	call   c01084c9 <dead_lock>
c01085ec:	83 c4 10             	add    $0x10,%esp
c01085ef:	83 f8 01             	cmp    $0x1,%eax
c01085f2:	75 10                	jne    c0108604 <sys_send_msg+0x131>
c01085f4:	83 ec 0c             	sub    $0xc,%esp
c01085f7:	68 cf a9 10 c0       	push   $0xc010a9cf
c01085fc:	e8 38 fe ff ff       	call   c0108439 <panic>
c0108601:	83 c4 10             	add    $0x10,%esp
c0108604:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108607:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c010860e:	3c 02                	cmp    $0x2,%al
c0108610:	0f 85 cf 01 00 00    	jne    c01087e5 <sys_send_msg+0x312>
c0108616:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108619:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c010861f:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0108622:	74 12                	je     c0108636 <sys_send_msg+0x163>
c0108624:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108627:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c010862d:	83 f8 12             	cmp    $0x12,%eax
c0108630:	0f 85 af 01 00 00    	jne    c01087e5 <sys_send_msg+0x312>
c0108636:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108639:	8b 80 78 02 00 00    	mov    0x278(%eax),%eax
c010863f:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0108642:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108645:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c010864b:	89 45 c0             	mov    %eax,-0x40(%ebp)
c010864e:	83 ec 08             	sub    $0x8,%esp
c0108651:	ff 75 0c             	pushl  0xc(%ebp)
c0108654:	ff 75 c0             	pushl  -0x40(%ebp)
c0108657:	e8 d6 d6 ff ff       	call   c0105d32 <get_physical_address_proc>
c010865c:	83 c4 10             	add    $0x10,%esp
c010865f:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0108662:	83 ec 08             	sub    $0x8,%esp
c0108665:	ff 75 e0             	pushl  -0x20(%ebp)
c0108668:	ff 75 bc             	pushl  -0x44(%ebp)
c010866b:	e8 f4 d5 ff ff       	call   c0105c64 <alloc_virtual_memory>
c0108670:	83 c4 10             	add    $0x10,%esp
c0108673:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0108676:	e8 59 e3 ff ff       	call   c01069d4 <catch_error>
c010867b:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c010867e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0108681:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0108684:	83 ec 04             	sub    $0x4,%esp
c0108687:	51                   	push   %ecx
c0108688:	52                   	push   %edx
c0108689:	50                   	push   %eax
c010868a:	e8 ef e3 ff ff       	call   c0106a7e <Memcpy>
c010868f:	83 c4 10             	add    $0x10,%esp
c0108692:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0108697:	3d 41 05 00 00       	cmp    $0x541,%eax
c010869c:	75 0a                	jne    c01086a8 <sys_send_msg+0x1d5>
c010869e:	c7 05 a0 f7 10 c0 04 	movl   $0x4,0xc010f7a0
c01086a5:	00 00 00 
c01086a8:	8b 45 10             	mov    0x10(%ebp),%eax
c01086ab:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c01086b2:	00 00 00 
c01086b5:	8b 45 10             	mov    0x10(%ebp),%eax
c01086b8:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c01086bf:	8b 45 10             	mov    0x10(%ebp),%eax
c01086c2:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c01086c9:	00 00 00 
c01086cc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01086cf:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c01086d6:	00 00 00 
c01086d9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01086dc:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c01086e3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01086e6:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c01086ed:	00 00 00 
c01086f0:	8b 45 10             	mov    0x10(%ebp),%eax
c01086f3:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c01086fa:	00 00 00 
c01086fd:	83 ec 0c             	sub    $0xc,%esp
c0108700:	ff 75 e8             	pushl  -0x18(%ebp)
c0108703:	e8 a3 08 00 00       	call   c0108fab <unblock>
c0108708:	83 c4 10             	add    $0x10,%esp
c010870b:	8b 45 10             	mov    0x10(%ebp),%eax
c010870e:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0108715:	84 c0                	test   %al,%al
c0108717:	74 1c                	je     c0108735 <sys_send_msg+0x262>
c0108719:	68 41 05 00 00       	push   $0x541
c010871e:	68 63 a9 10 c0       	push   $0xc010a963
c0108723:	68 63 a9 10 c0       	push   $0xc010a963
c0108728:	68 da a9 10 c0       	push   $0xc010a9da
c010872d:	e8 25 fd ff ff       	call   c0108457 <assertion_failure>
c0108732:	83 c4 10             	add    $0x10,%esp
c0108735:	8b 45 10             	mov    0x10(%ebp),%eax
c0108738:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c010873e:	83 f8 21             	cmp    $0x21,%eax
c0108741:	74 1c                	je     c010875f <sys_send_msg+0x28c>
c0108743:	68 42 05 00 00       	push   $0x542
c0108748:	68 63 a9 10 c0       	push   $0xc010a963
c010874d:	68 63 a9 10 c0       	push   $0xc010a963
c0108752:	68 ee a9 10 c0       	push   $0xc010a9ee
c0108757:	e8 fb fc ff ff       	call   c0108457 <assertion_failure>
c010875c:	83 c4 10             	add    $0x10,%esp
c010875f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108762:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0108768:	85 c0                	test   %eax,%eax
c010876a:	74 1c                	je     c0108788 <sys_send_msg+0x2b5>
c010876c:	68 44 05 00 00       	push   $0x544
c0108771:	68 63 a9 10 c0       	push   $0xc010a963
c0108776:	68 63 a9 10 c0       	push   $0xc010a963
c010877b:	68 0b aa 10 c0       	push   $0xc010aa0b
c0108780:	e8 d2 fc ff ff       	call   c0108457 <assertion_failure>
c0108785:	83 c4 10             	add    $0x10,%esp
c0108788:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010878b:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0108792:	84 c0                	test   %al,%al
c0108794:	74 1c                	je     c01087b2 <sys_send_msg+0x2df>
c0108796:	68 45 05 00 00       	push   $0x545
c010879b:	68 63 a9 10 c0       	push   $0xc010a963
c01087a0:	68 63 a9 10 c0       	push   $0xc010a963
c01087a5:	68 20 aa 10 c0       	push   $0xc010aa20
c01087aa:	e8 a8 fc ff ff       	call   c0108457 <assertion_failure>
c01087af:	83 c4 10             	add    $0x10,%esp
c01087b2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01087b5:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c01087bb:	83 f8 21             	cmp    $0x21,%eax
c01087be:	0f 84 45 01 00 00    	je     c0108909 <sys_send_msg+0x436>
c01087c4:	68 46 05 00 00       	push   $0x546
c01087c9:	68 63 a9 10 c0       	push   $0xc010a963
c01087ce:	68 63 a9 10 c0       	push   $0xc010a963
c01087d3:	68 38 aa 10 c0       	push   $0xc010aa38
c01087d8:	e8 7a fc ff ff       	call   c0108457 <assertion_failure>
c01087dd:	83 c4 10             	add    $0x10,%esp
c01087e0:	e9 24 01 00 00       	jmp    c0108909 <sys_send_msg+0x436>
c01087e5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01087ec:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01087ef:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c01087f2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01087f5:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c01087fb:	85 c0                	test   %eax,%eax
c01087fd:	75 1b                	jne    c010881a <sys_send_msg+0x347>
c01087ff:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108802:	8b 55 10             	mov    0x10(%ebp),%edx
c0108805:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c010880b:	8b 45 10             	mov    0x10(%ebp),%eax
c010880e:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c0108815:	00 00 00 
c0108818:	eb 3f                	jmp    c0108859 <sys_send_msg+0x386>
c010881a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010881d:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0108823:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108826:	eb 12                	jmp    c010883a <sys_send_msg+0x367>
c0108828:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010882b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010882e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108831:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c0108837:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010883a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010883e:	75 e8                	jne    c0108828 <sys_send_msg+0x355>
c0108840:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108843:	8b 55 10             	mov    0x10(%ebp),%edx
c0108846:	89 90 5c 02 00 00    	mov    %edx,0x25c(%eax)
c010884c:	8b 45 10             	mov    0x10(%ebp),%eax
c010884f:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c0108856:	00 00 00 
c0108859:	8b 45 10             	mov    0x10(%ebp),%eax
c010885c:	8b 55 08             	mov    0x8(%ebp),%edx
c010885f:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c0108865:	8b 45 10             	mov    0x10(%ebp),%eax
c0108868:	8b 55 0c             	mov    0xc(%ebp),%edx
c010886b:	89 90 50 02 00 00    	mov    %edx,0x250(%eax)
c0108871:	8b 45 10             	mov    0x10(%ebp),%eax
c0108874:	c6 80 48 02 00 00 01 	movb   $0x1,0x248(%eax)
c010887b:	8b 45 10             	mov    0x10(%ebp),%eax
c010887e:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0108885:	3c 01                	cmp    $0x1,%al
c0108887:	74 1c                	je     c01088a5 <sys_send_msg+0x3d2>
c0108889:	68 68 05 00 00       	push   $0x568
c010888e:	68 63 a9 10 c0       	push   $0xc010a963
c0108893:	68 63 a9 10 c0       	push   $0xc010a963
c0108898:	68 5c aa 10 c0       	push   $0xc010aa5c
c010889d:	e8 b5 fb ff ff       	call   c0108457 <assertion_failure>
c01088a2:	83 c4 10             	add    $0x10,%esp
c01088a5:	8b 45 10             	mov    0x10(%ebp),%eax
c01088a8:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c01088ae:	39 45 0c             	cmp    %eax,0xc(%ebp)
c01088b1:	74 1c                	je     c01088cf <sys_send_msg+0x3fc>
c01088b3:	68 69 05 00 00       	push   $0x569
c01088b8:	68 63 a9 10 c0       	push   $0xc010a963
c01088bd:	68 63 a9 10 c0       	push   $0xc010a963
c01088c2:	68 78 aa 10 c0       	push   $0xc010aa78
c01088c7:	e8 8b fb ff ff       	call   c0108457 <assertion_failure>
c01088cc:	83 c4 10             	add    $0x10,%esp
c01088cf:	8b 45 10             	mov    0x10(%ebp),%eax
c01088d2:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c01088d8:	39 45 08             	cmp    %eax,0x8(%ebp)
c01088db:	74 1c                	je     c01088f9 <sys_send_msg+0x426>
c01088dd:	68 6a 05 00 00       	push   $0x56a
c01088e2:	68 63 a9 10 c0       	push   $0xc010a963
c01088e7:	68 63 a9 10 c0       	push   $0xc010a963
c01088ec:	68 9a aa 10 c0       	push   $0xc010aa9a
c01088f1:	e8 61 fb ff ff       	call   c0108457 <assertion_failure>
c01088f6:	83 c4 10             	add    $0x10,%esp
c01088f9:	83 ec 0c             	sub    $0xc,%esp
c01088fc:	ff 75 10             	pushl  0x10(%ebp)
c01088ff:	e8 6b 06 00 00       	call   c0108f6f <block>
c0108904:	83 c4 10             	add    $0x10,%esp
c0108907:	eb 01                	jmp    c010890a <sys_send_msg+0x437>
c0108909:	90                   	nop
c010890a:	b8 00 00 00 00       	mov    $0x0,%eax
c010890f:	c9                   	leave  
c0108910:	c3                   	ret    

c0108911 <sys_receive_msg>:
c0108911:	55                   	push   %ebp
c0108912:	89 e5                	mov    %esp,%ebp
c0108914:	83 ec 58             	sub    $0x58,%esp
c0108917:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010891e:	83 ec 0c             	sub    $0xc,%esp
c0108921:	ff 75 0c             	pushl  0xc(%ebp)
c0108924:	e8 03 ad ff ff       	call   c010362c <pid2proc>
c0108929:	83 c4 10             	add    $0x10,%esp
c010892c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010892f:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0108933:	74 2c                	je     c0108961 <sys_receive_msg+0x50>
c0108935:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108938:	8b 80 b0 02 00 00    	mov    0x2b0(%eax),%eax
c010893e:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0108943:	74 1c                	je     c0108961 <sys_receive_msg+0x50>
c0108945:	68 7e 05 00 00       	push   $0x57e
c010894a:	68 63 a9 10 c0       	push   $0xc010a963
c010894f:	68 63 a9 10 c0       	push   $0xc010a963
c0108954:	68 9c a9 10 c0       	push   $0xc010a99c
c0108959:	e8 f9 fa ff ff       	call   c0108457 <assertion_failure>
c010895e:	83 c4 10             	add    $0x10,%esp
c0108961:	8b 45 10             	mov    0x10(%ebp),%eax
c0108964:	8b 80 b0 02 00 00    	mov    0x2b0(%eax),%eax
c010896a:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c010896f:	74 1c                	je     c010898d <sys_receive_msg+0x7c>
c0108971:	68 80 05 00 00       	push   $0x580
c0108976:	68 63 a9 10 c0       	push   $0xc010a963
c010897b:	68 63 a9 10 c0       	push   $0xc010a963
c0108980:	68 74 a9 10 c0       	push   $0xc010a974
c0108985:	e8 cd fa ff ff       	call   c0108457 <assertion_failure>
c010898a:	83 c4 10             	add    $0x10,%esp
c010898d:	83 ec 0c             	sub    $0xc,%esp
c0108990:	ff 75 10             	pushl  0x10(%ebp)
c0108993:	e8 06 ad ff ff       	call   c010369e <proc2pid>
c0108998:	83 c4 10             	add    $0x10,%esp
c010899b:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010899e:	c7 45 dc 7c 00 00 00 	movl   $0x7c,-0x24(%ebp)
c01089a5:	8b 45 08             	mov    0x8(%ebp),%eax
c01089a8:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01089ab:	8b 45 10             	mov    0x10(%ebp),%eax
c01089ae:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c01089b4:	83 ec 08             	sub    $0x8,%esp
c01089b7:	50                   	push   %eax
c01089b8:	ff 75 d8             	pushl  -0x28(%ebp)
c01089bb:	e8 72 d3 ff ff       	call   c0105d32 <get_physical_address_proc>
c01089c0:	83 c4 10             	add    $0x10,%esp
c01089c3:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01089c6:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01089cd:	8b 45 10             	mov    0x10(%ebp),%eax
c01089d0:	8b 80 60 02 00 00    	mov    0x260(%eax),%eax
c01089d6:	85 c0                	test   %eax,%eax
c01089d8:	0f 84 c5 00 00 00    	je     c0108aa3 <sys_receive_msg+0x192>
c01089de:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c01089e2:	74 0d                	je     c01089f1 <sys_receive_msg+0xe0>
c01089e4:	81 7d 0c 13 02 00 00 	cmpl   $0x213,0xc(%ebp)
c01089eb:	0f 85 b2 00 00 00    	jne    c0108aa3 <sys_receive_msg+0x192>
c01089f1:	c7 45 d0 7c 00 00 00 	movl   $0x7c,-0x30(%ebp)
c01089f8:	83 ec 0c             	sub    $0xc,%esp
c01089fb:	ff 75 d0             	pushl  -0x30(%ebp)
c01089fe:	e8 79 8a ff ff       	call   c010147c <sys_malloc>
c0108a03:	83 c4 10             	add    $0x10,%esp
c0108a06:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0108a09:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0108a0c:	83 ec 04             	sub    $0x4,%esp
c0108a0f:	50                   	push   %eax
c0108a10:	6a 00                	push   $0x0
c0108a12:	ff 75 cc             	pushl  -0x34(%ebp)
c0108a15:	e8 05 22 00 00       	call   c010ac1f <Memset>
c0108a1a:	83 c4 10             	add    $0x10,%esp
c0108a1d:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0108a20:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c0108a26:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0108a29:	c7 40 78 d5 07 00 00 	movl   $0x7d5,0x78(%eax)
c0108a30:	83 ec 08             	sub    $0x8,%esp
c0108a33:	ff 75 d0             	pushl  -0x30(%ebp)
c0108a36:	ff 75 d4             	pushl  -0x2c(%ebp)
c0108a39:	e8 26 d2 ff ff       	call   c0105c64 <alloc_virtual_memory>
c0108a3e:	83 c4 10             	add    $0x10,%esp
c0108a41:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0108a44:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0108a47:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0108a4a:	83 ec 04             	sub    $0x4,%esp
c0108a4d:	52                   	push   %edx
c0108a4e:	ff 75 cc             	pushl  -0x34(%ebp)
c0108a51:	50                   	push   %eax
c0108a52:	e8 27 e0 ff ff       	call   c0106a7e <Memcpy>
c0108a57:	83 c4 10             	add    $0x10,%esp
c0108a5a:	8b 45 10             	mov    0x10(%ebp),%eax
c0108a5d:	c7 80 60 02 00 00 00 	movl   $0x0,0x260(%eax)
c0108a64:	00 00 00 
c0108a67:	8b 45 10             	mov    0x10(%ebp),%eax
c0108a6a:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c0108a71:	00 00 00 
c0108a74:	8b 45 10             	mov    0x10(%ebp),%eax
c0108a77:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c0108a7e:	00 00 00 
c0108a81:	8b 45 10             	mov    0x10(%ebp),%eax
c0108a84:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0108a8b:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c0108a92:	83 ec 08             	sub    $0x8,%esp
c0108a95:	ff 75 d0             	pushl  -0x30(%ebp)
c0108a98:	ff 75 cc             	pushl  -0x34(%ebp)
c0108a9b:	e8 f1 89 ff ff       	call   c0101491 <sys_free>
c0108aa0:	83 c4 10             	add    $0x10,%esp
c0108aa3:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c0108aa7:	0f 84 c3 03 00 00    	je     c0108e70 <sys_receive_msg+0x55f>
c0108aad:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0108ab1:	75 26                	jne    c0108ad9 <sys_receive_msg+0x1c8>
c0108ab3:	8b 45 10             	mov    0x10(%ebp),%eax
c0108ab6:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0108abc:	85 c0                	test   %eax,%eax
c0108abe:	0f 84 8a 00 00 00    	je     c0108b4e <sys_receive_msg+0x23d>
c0108ac4:	8b 45 10             	mov    0x10(%ebp),%eax
c0108ac7:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0108acd:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108ad0:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0108ad7:	eb 75                	jmp    c0108b4e <sys_receive_msg+0x23d>
c0108ad9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0108add:	78 6f                	js     c0108b4e <sys_receive_msg+0x23d>
c0108adf:	83 7d 0c 07          	cmpl   $0x7,0xc(%ebp)
c0108ae3:	7f 69                	jg     c0108b4e <sys_receive_msg+0x23d>
c0108ae5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108ae8:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0108aef:	3c 01                	cmp    $0x1,%al
c0108af1:	75 5b                	jne    c0108b4e <sys_receive_msg+0x23d>
c0108af3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108af6:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0108afc:	83 f8 12             	cmp    $0x12,%eax
c0108aff:	74 0e                	je     c0108b0f <sys_receive_msg+0x1fe>
c0108b01:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108b04:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0108b0a:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c0108b0d:	75 3f                	jne    c0108b4e <sys_receive_msg+0x23d>
c0108b0f:	8b 45 10             	mov    0x10(%ebp),%eax
c0108b12:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0108b18:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108b1b:	eb 2b                	jmp    c0108b48 <sys_receive_msg+0x237>
c0108b1d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108b20:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108b23:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108b26:	8b 90 24 01 00 00    	mov    0x124(%eax),%edx
c0108b2c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0108b2f:	39 c2                	cmp    %eax,%edx
c0108b31:	75 09                	jne    c0108b3c <sys_receive_msg+0x22b>
c0108b33:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0108b3a:	eb 12                	jmp    c0108b4e <sys_receive_msg+0x23d>
c0108b3c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108b3f:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c0108b45:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108b48:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0108b4c:	75 cf                	jne    c0108b1d <sys_receive_msg+0x20c>
c0108b4e:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0108b52:	0f 85 4e 02 00 00    	jne    c0108da6 <sys_receive_msg+0x495>
c0108b58:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108b5b:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0108b5e:	83 ec 08             	sub    $0x8,%esp
c0108b61:	ff 75 dc             	pushl  -0x24(%ebp)
c0108b64:	ff 75 d4             	pushl  -0x2c(%ebp)
c0108b67:	e8 f8 d0 ff ff       	call   c0105c64 <alloc_virtual_memory>
c0108b6c:	83 c4 10             	add    $0x10,%esp
c0108b6f:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0108b72:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0108b75:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0108b7b:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0108b7e:	83 ec 0c             	sub    $0xc,%esp
c0108b81:	ff 75 c4             	pushl  -0x3c(%ebp)
c0108b84:	e8 15 ab ff ff       	call   c010369e <proc2pid>
c0108b89:	83 c4 10             	add    $0x10,%esp
c0108b8c:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0108b8f:	83 ec 08             	sub    $0x8,%esp
c0108b92:	ff 75 b8             	pushl  -0x48(%ebp)
c0108b95:	ff 75 bc             	pushl  -0x44(%ebp)
c0108b98:	e8 95 d1 ff ff       	call   c0105d32 <get_physical_address_proc>
c0108b9d:	83 c4 10             	add    $0x10,%esp
c0108ba0:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0108ba3:	83 ec 08             	sub    $0x8,%esp
c0108ba6:	ff 75 dc             	pushl  -0x24(%ebp)
c0108ba9:	ff 75 b4             	pushl  -0x4c(%ebp)
c0108bac:	e8 b3 d0 ff ff       	call   c0105c64 <alloc_virtual_memory>
c0108bb1:	83 c4 10             	add    $0x10,%esp
c0108bb4:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0108bb7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0108bba:	83 ec 04             	sub    $0x4,%esp
c0108bbd:	50                   	push   %eax
c0108bbe:	ff 75 b0             	pushl  -0x50(%ebp)
c0108bc1:	ff 75 c0             	pushl  -0x40(%ebp)
c0108bc4:	e8 b5 de ff ff       	call   c0106a7e <Memcpy>
c0108bc9:	83 c4 10             	add    $0x10,%esp
c0108bcc:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0108bcf:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0108bd2:	8b 45 10             	mov    0x10(%ebp),%eax
c0108bd5:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0108bdb:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0108bde:	75 21                	jne    c0108c01 <sys_receive_msg+0x2f0>
c0108be0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108be3:	8b 90 5c 02 00 00    	mov    0x25c(%eax),%edx
c0108be9:	8b 45 10             	mov    0x10(%ebp),%eax
c0108bec:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c0108bf2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108bf5:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c0108bfc:	00 00 00 
c0108bff:	eb 1f                	jmp    c0108c20 <sys_receive_msg+0x30f>
c0108c01:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108c04:	8b 90 5c 02 00 00    	mov    0x25c(%eax),%edx
c0108c0a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0108c0d:	89 90 5c 02 00 00    	mov    %edx,0x25c(%eax)
c0108c13:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108c16:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c0108c1d:	00 00 00 
c0108c20:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0108c23:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c0108c2a:	00 00 00 
c0108c2d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0108c30:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0108c37:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0108c3a:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c0108c41:	00 00 00 
c0108c44:	8b 45 10             	mov    0x10(%ebp),%eax
c0108c47:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c0108c4e:	00 00 00 
c0108c51:	8b 45 10             	mov    0x10(%ebp),%eax
c0108c54:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c0108c5b:	00 00 00 
c0108c5e:	8b 45 10             	mov    0x10(%ebp),%eax
c0108c61:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c0108c68:	00 00 00 
c0108c6b:	83 ec 0c             	sub    $0xc,%esp
c0108c6e:	ff 75 c4             	pushl  -0x3c(%ebp)
c0108c71:	e8 35 03 00 00       	call   c0108fab <unblock>
c0108c76:	83 c4 10             	add    $0x10,%esp
c0108c79:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0108c7c:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0108c82:	85 c0                	test   %eax,%eax
c0108c84:	74 1c                	je     c0108ca2 <sys_receive_msg+0x391>
c0108c86:	68 ef 05 00 00       	push   $0x5ef
c0108c8b:	68 63 a9 10 c0       	push   $0xc010a963
c0108c90:	68 63 a9 10 c0       	push   $0xc010a963
c0108c95:	68 af aa 10 c0       	push   $0xc010aaaf
c0108c9a:	e8 b8 f7 ff ff       	call   c0108457 <assertion_failure>
c0108c9f:	83 c4 10             	add    $0x10,%esp
c0108ca2:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0108ca5:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0108cac:	84 c0                	test   %al,%al
c0108cae:	74 1c                	je     c0108ccc <sys_receive_msg+0x3bb>
c0108cb0:	68 f0 05 00 00       	push   $0x5f0
c0108cb5:	68 63 a9 10 c0       	push   $0xc010a963
c0108cba:	68 63 a9 10 c0       	push   $0xc010a963
c0108cbf:	68 c7 aa 10 c0       	push   $0xc010aac7
c0108cc4:	e8 8e f7 ff ff       	call   c0108457 <assertion_failure>
c0108cc9:	83 c4 10             	add    $0x10,%esp
c0108ccc:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0108ccf:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0108cd5:	83 f8 21             	cmp    $0x21,%eax
c0108cd8:	74 1c                	je     c0108cf6 <sys_receive_msg+0x3e5>
c0108cda:	68 f1 05 00 00       	push   $0x5f1
c0108cdf:	68 63 a9 10 c0       	push   $0xc010a963
c0108ce4:	68 63 a9 10 c0       	push   $0xc010a963
c0108ce9:	68 e0 aa 10 c0       	push   $0xc010aae0
c0108cee:	e8 64 f7 ff ff       	call   c0108457 <assertion_failure>
c0108cf3:	83 c4 10             	add    $0x10,%esp
c0108cf6:	8b 45 10             	mov    0x10(%ebp),%eax
c0108cf9:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0108cff:	85 c0                	test   %eax,%eax
c0108d01:	74 1c                	je     c0108d1f <sys_receive_msg+0x40e>
c0108d03:	68 f3 05 00 00       	push   $0x5f3
c0108d08:	68 63 a9 10 c0       	push   $0xc010a963
c0108d0d:	68 63 a9 10 c0       	push   $0xc010a963
c0108d12:	68 0b aa 10 c0       	push   $0xc010aa0b
c0108d17:	e8 3b f7 ff ff       	call   c0108457 <assertion_failure>
c0108d1c:	83 c4 10             	add    $0x10,%esp
c0108d1f:	8b 45 10             	mov    0x10(%ebp),%eax
c0108d22:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0108d29:	84 c0                	test   %al,%al
c0108d2b:	74 1c                	je     c0108d49 <sys_receive_msg+0x438>
c0108d2d:	68 f4 05 00 00       	push   $0x5f4
c0108d32:	68 63 a9 10 c0       	push   $0xc010a963
c0108d37:	68 63 a9 10 c0       	push   $0xc010a963
c0108d3c:	68 20 aa 10 c0       	push   $0xc010aa20
c0108d41:	e8 11 f7 ff ff       	call   c0108457 <assertion_failure>
c0108d46:	83 c4 10             	add    $0x10,%esp
c0108d49:	8b 45 10             	mov    0x10(%ebp),%eax
c0108d4c:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0108d52:	83 f8 21             	cmp    $0x21,%eax
c0108d55:	74 1c                	je     c0108d73 <sys_receive_msg+0x462>
c0108d57:	68 f5 05 00 00       	push   $0x5f5
c0108d5c:	68 63 a9 10 c0       	push   $0xc010a963
c0108d61:	68 63 a9 10 c0       	push   $0xc010a963
c0108d66:	68 38 aa 10 c0       	push   $0xc010aa38
c0108d6b:	e8 e7 f6 ff ff       	call   c0108457 <assertion_failure>
c0108d70:	83 c4 10             	add    $0x10,%esp
c0108d73:	8b 45 10             	mov    0x10(%ebp),%eax
c0108d76:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0108d7c:	83 f8 21             	cmp    $0x21,%eax
c0108d7f:	0f 84 e4 00 00 00    	je     c0108e69 <sys_receive_msg+0x558>
c0108d85:	68 f6 05 00 00       	push   $0x5f6
c0108d8a:	68 63 a9 10 c0       	push   $0xc010a963
c0108d8f:	68 63 a9 10 c0       	push   $0xc010a963
c0108d94:	68 04 ab 10 c0       	push   $0xc010ab04
c0108d99:	e8 b9 f6 ff ff       	call   c0108457 <assertion_failure>
c0108d9e:	83 c4 10             	add    $0x10,%esp
c0108da1:	e9 c3 00 00 00       	jmp    c0108e69 <sys_receive_msg+0x558>
c0108da6:	8b 45 10             	mov    0x10(%ebp),%eax
c0108da9:	c6 80 48 02 00 00 02 	movb   $0x2,0x248(%eax)
c0108db0:	8b 45 10             	mov    0x10(%ebp),%eax
c0108db3:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0108dba:	3c 02                	cmp    $0x2,%al
c0108dbc:	74 1c                	je     c0108dda <sys_receive_msg+0x4c9>
c0108dbe:	68 fb 05 00 00       	push   $0x5fb
c0108dc3:	68 63 a9 10 c0       	push   $0xc010a963
c0108dc8:	68 63 a9 10 c0       	push   $0xc010a963
c0108dcd:	68 23 ab 10 c0       	push   $0xc010ab23
c0108dd2:	e8 80 f6 ff ff       	call   c0108457 <assertion_failure>
c0108dd7:	83 c4 10             	add    $0x10,%esp
c0108dda:	8b 45 10             	mov    0x10(%ebp),%eax
c0108ddd:	8b 55 08             	mov    0x8(%ebp),%edx
c0108de0:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c0108de6:	8b 45 10             	mov    0x10(%ebp),%eax
c0108de9:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0108df0:	3c 02                	cmp    $0x2,%al
c0108df2:	74 1c                	je     c0108e10 <sys_receive_msg+0x4ff>
c0108df4:	68 fd 05 00 00       	push   $0x5fd
c0108df9:	68 63 a9 10 c0       	push   $0xc010a963
c0108dfe:	68 63 a9 10 c0       	push   $0xc010a963
c0108e03:	68 23 ab 10 c0       	push   $0xc010ab23
c0108e08:	e8 4a f6 ff ff       	call   c0108457 <assertion_failure>
c0108e0d:	83 c4 10             	add    $0x10,%esp
c0108e10:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0108e14:	75 0f                	jne    c0108e25 <sys_receive_msg+0x514>
c0108e16:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e19:	c7 80 54 02 00 00 12 	movl   $0x12,0x254(%eax)
c0108e20:	00 00 00 
c0108e23:	eb 0c                	jmp    c0108e31 <sys_receive_msg+0x520>
c0108e25:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e28:	8b 55 0c             	mov    0xc(%ebp),%edx
c0108e2b:	89 90 54 02 00 00    	mov    %edx,0x254(%eax)
c0108e31:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e34:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0108e3b:	3c 02                	cmp    $0x2,%al
c0108e3d:	74 1c                	je     c0108e5b <sys_receive_msg+0x54a>
c0108e3f:	68 08 06 00 00       	push   $0x608
c0108e44:	68 63 a9 10 c0       	push   $0xc010a963
c0108e49:	68 63 a9 10 c0       	push   $0xc010a963
c0108e4e:	68 23 ab 10 c0       	push   $0xc010ab23
c0108e53:	e8 ff f5 ff ff       	call   c0108457 <assertion_failure>
c0108e58:	83 c4 10             	add    $0x10,%esp
c0108e5b:	83 ec 0c             	sub    $0xc,%esp
c0108e5e:	ff 75 10             	pushl  0x10(%ebp)
c0108e61:	e8 09 01 00 00       	call   c0108f6f <block>
c0108e66:	83 c4 10             	add    $0x10,%esp
c0108e69:	b8 00 00 00 00       	mov    $0x0,%eax
c0108e6e:	eb 02                	jmp    c0108e72 <sys_receive_msg+0x561>
c0108e70:	90                   	nop
c0108e71:	90                   	nop
c0108e72:	c9                   	leave  
c0108e73:	c3                   	ret    

c0108e74 <send_rec>:
c0108e74:	55                   	push   %ebp
c0108e75:	89 e5                	mov    %esp,%ebp
c0108e77:	83 ec 18             	sub    $0x18,%esp
c0108e7a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0108e7d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108e80:	c7 45 f0 7c 00 00 00 	movl   $0x7c,-0x10(%ebp)
c0108e87:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c0108e8b:	74 28                	je     c0108eb5 <send_rec+0x41>
c0108e8d:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0108e91:	74 22                	je     c0108eb5 <send_rec+0x41>
c0108e93:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c0108e97:	74 1c                	je     c0108eb5 <send_rec+0x41>
c0108e99:	68 1a 06 00 00       	push   $0x61a
c0108e9e:	68 63 a9 10 c0       	push   $0xc010a963
c0108ea3:	68 63 a9 10 c0       	push   $0xc010a963
c0108ea8:	68 44 ab 10 c0       	push   $0xc010ab44
c0108ead:	e8 a5 f5 ff ff       	call   c0108457 <assertion_failure>
c0108eb2:	83 c4 10             	add    $0x10,%esp
c0108eb5:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0108eb9:	75 14                	jne    c0108ecf <send_rec+0x5b>
c0108ebb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108ebe:	83 ec 04             	sub    $0x4,%esp
c0108ec1:	50                   	push   %eax
c0108ec2:	6a 00                	push   $0x0
c0108ec4:	ff 75 0c             	pushl  0xc(%ebp)
c0108ec7:	e8 53 1d 00 00       	call   c010ac1f <Memset>
c0108ecc:	83 c4 10             	add    $0x10,%esp
c0108ecf:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0108ed3:	74 23                	je     c0108ef8 <send_rec+0x84>
c0108ed5:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c0108ed9:	74 34                	je     c0108f0f <send_rec+0x9b>
c0108edb:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c0108edf:	75 74                	jne    c0108f55 <send_rec+0xe1>
c0108ee1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108ee4:	83 ec 08             	sub    $0x8,%esp
c0108ee7:	ff 75 10             	pushl  0x10(%ebp)
c0108eea:	50                   	push   %eax
c0108eeb:	e8 60 85 ff ff       	call   c0101450 <send_msg>
c0108ef0:	83 c4 10             	add    $0x10,%esp
c0108ef3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108ef6:	eb 70                	jmp    c0108f68 <send_rec+0xf4>
c0108ef8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108efb:	83 ec 08             	sub    $0x8,%esp
c0108efe:	ff 75 10             	pushl  0x10(%ebp)
c0108f01:	50                   	push   %eax
c0108f02:	e8 5f 85 ff ff       	call   c0101466 <receive_msg>
c0108f07:	83 c4 10             	add    $0x10,%esp
c0108f0a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108f0d:	eb 59                	jmp    c0108f68 <send_rec+0xf4>
c0108f0f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108f12:	83 ec 08             	sub    $0x8,%esp
c0108f15:	ff 75 10             	pushl  0x10(%ebp)
c0108f18:	50                   	push   %eax
c0108f19:	e8 32 85 ff ff       	call   c0101450 <send_msg>
c0108f1e:	83 c4 10             	add    $0x10,%esp
c0108f21:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108f24:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0108f28:	75 3d                	jne    c0108f67 <send_rec+0xf3>
c0108f2a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108f2d:	83 ec 04             	sub    $0x4,%esp
c0108f30:	50                   	push   %eax
c0108f31:	6a 00                	push   $0x0
c0108f33:	ff 75 0c             	pushl  0xc(%ebp)
c0108f36:	e8 e4 1c 00 00       	call   c010ac1f <Memset>
c0108f3b:	83 c4 10             	add    $0x10,%esp
c0108f3e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108f41:	83 ec 08             	sub    $0x8,%esp
c0108f44:	ff 75 10             	pushl  0x10(%ebp)
c0108f47:	50                   	push   %eax
c0108f48:	e8 19 85 ff ff       	call   c0101466 <receive_msg>
c0108f4d:	83 c4 10             	add    $0x10,%esp
c0108f50:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108f53:	eb 12                	jmp    c0108f67 <send_rec+0xf3>
c0108f55:	83 ec 0c             	sub    $0xc,%esp
c0108f58:	68 80 ab 10 c0       	push   $0xc010ab80
c0108f5d:	e8 d7 f4 ff ff       	call   c0108439 <panic>
c0108f62:	83 c4 10             	add    $0x10,%esp
c0108f65:	eb 01                	jmp    c0108f68 <send_rec+0xf4>
c0108f67:	90                   	nop
c0108f68:	b8 00 00 00 00       	mov    $0x0,%eax
c0108f6d:	c9                   	leave  
c0108f6e:	c3                   	ret    

c0108f6f <block>:
c0108f6f:	55                   	push   %ebp
c0108f70:	89 e5                	mov    %esp,%ebp
c0108f72:	83 ec 08             	sub    $0x8,%esp
c0108f75:	8b 45 08             	mov    0x8(%ebp),%eax
c0108f78:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0108f7f:	84 c0                	test   %al,%al
c0108f81:	75 1c                	jne    c0108f9f <block+0x30>
c0108f83:	68 49 06 00 00       	push   $0x649
c0108f88:	68 63 a9 10 c0       	push   $0xc010a963
c0108f8d:	68 63 a9 10 c0       	push   $0xc010a963
c0108f92:	68 95 ab 10 c0       	push   $0xc010ab95
c0108f97:	e8 bb f4 ff ff       	call   c0108457 <assertion_failure>
c0108f9c:	83 c4 10             	add    $0x10,%esp
c0108f9f:	e8 34 a5 ff ff       	call   c01034d8 <schedule_process>
c0108fa4:	b8 00 00 00 00       	mov    $0x0,%eax
c0108fa9:	c9                   	leave  
c0108faa:	c3                   	ret    

c0108fab <unblock>:
c0108fab:	55                   	push   %ebp
c0108fac:	89 e5                	mov    %esp,%ebp
c0108fae:	83 ec 08             	sub    $0x8,%esp
c0108fb1:	8b 45 08             	mov    0x8(%ebp),%eax
c0108fb4:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0108fbb:	84 c0                	test   %al,%al
c0108fbd:	74 1c                	je     c0108fdb <unblock+0x30>
c0108fbf:	68 52 06 00 00       	push   $0x652
c0108fc4:	68 63 a9 10 c0       	push   $0xc010a963
c0108fc9:	68 63 a9 10 c0       	push   $0xc010a963
c0108fce:	68 ad ab 10 c0       	push   $0xc010abad
c0108fd3:	e8 7f f4 ff ff       	call   c0108457 <assertion_failure>
c0108fd8:	83 c4 10             	add    $0x10,%esp
c0108fdb:	8b 45 08             	mov    0x8(%ebp),%eax
c0108fde:	05 00 01 00 00       	add    $0x100,%eax
c0108fe3:	83 ec 08             	sub    $0x8,%esp
c0108fe6:	50                   	push   %eax
c0108fe7:	68 ec fd 10 c0       	push   $0xc010fdec
c0108fec:	e8 df 0a 00 00       	call   c0109ad0 <appendToDoubleLinkList>
c0108ff1:	83 c4 10             	add    $0x10,%esp
c0108ff4:	b8 00 00 00 00       	mov    $0x0,%eax
c0108ff9:	c9                   	leave  
c0108ffa:	c3                   	ret    

c0108ffb <get_ticks_ipc>:
c0108ffb:	55                   	push   %ebp
c0108ffc:	89 e5                	mov    %esp,%ebp
c0108ffe:	81 ec 98 00 00 00    	sub    $0x98,%esp
c0109004:	83 ec 04             	sub    $0x4,%esp
c0109007:	6a 7c                	push   $0x7c
c0109009:	6a 00                	push   $0x0
c010900b:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0109011:	50                   	push   %eax
c0109012:	e8 08 1c 00 00       	call   c010ac1f <Memset>
c0109017:	83 c4 10             	add    $0x10,%esp
c010901a:	c7 85 78 ff ff ff 01 	movl   $0x1,-0x88(%ebp)
c0109021:	00 00 00 
c0109024:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c010902b:	83 ec 04             	sub    $0x4,%esp
c010902e:	6a 01                	push   $0x1
c0109030:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0109036:	50                   	push   %eax
c0109037:	6a 03                	push   $0x3
c0109039:	e8 36 fe ff ff       	call   c0108e74 <send_rec>
c010903e:	83 c4 10             	add    $0x10,%esp
c0109041:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109044:	8b 85 7c ff ff ff    	mov    -0x84(%ebp),%eax
c010904a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010904d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109050:	c9                   	leave  
c0109051:	c3                   	ret    

c0109052 <itoa>:
c0109052:	55                   	push   %ebp
c0109053:	89 e5                	mov    %esp,%ebp
c0109055:	53                   	push   %ebx
c0109056:	83 ec 14             	sub    $0x14,%esp
c0109059:	8b 45 08             	mov    0x8(%ebp),%eax
c010905c:	99                   	cltd   
c010905d:	f7 7d 10             	idivl  0x10(%ebp)
c0109060:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0109063:	8b 45 08             	mov    0x8(%ebp),%eax
c0109066:	99                   	cltd   
c0109067:	f7 7d 10             	idivl  0x10(%ebp)
c010906a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010906d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0109071:	74 14                	je     c0109087 <itoa+0x35>
c0109073:	83 ec 04             	sub    $0x4,%esp
c0109076:	ff 75 10             	pushl  0x10(%ebp)
c0109079:	ff 75 0c             	pushl  0xc(%ebp)
c010907c:	ff 75 f0             	pushl  -0x10(%ebp)
c010907f:	e8 ce ff ff ff       	call   c0109052 <itoa>
c0109084:	83 c4 10             	add    $0x10,%esp
c0109087:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010908a:	8d 58 30             	lea    0x30(%eax),%ebx
c010908d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0109090:	8b 00                	mov    (%eax),%eax
c0109092:	8d 48 01             	lea    0x1(%eax),%ecx
c0109095:	8b 55 0c             	mov    0xc(%ebp),%edx
c0109098:	89 0a                	mov    %ecx,(%edx)
c010909a:	89 da                	mov    %ebx,%edx
c010909c:	88 10                	mov    %dl,(%eax)
c010909e:	8b 45 0c             	mov    0xc(%ebp),%eax
c01090a1:	8b 00                	mov    (%eax),%eax
c01090a3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01090a6:	c9                   	leave  
c01090a7:	c3                   	ret    

c01090a8 <i2a>:
c01090a8:	55                   	push   %ebp
c01090a9:	89 e5                	mov    %esp,%ebp
c01090ab:	53                   	push   %ebx
c01090ac:	83 ec 14             	sub    $0x14,%esp
c01090af:	8b 45 08             	mov    0x8(%ebp),%eax
c01090b2:	99                   	cltd   
c01090b3:	f7 7d 0c             	idivl  0xc(%ebp)
c01090b6:	89 55 f4             	mov    %edx,-0xc(%ebp)
c01090b9:	8b 45 08             	mov    0x8(%ebp),%eax
c01090bc:	99                   	cltd   
c01090bd:	f7 7d 0c             	idivl  0xc(%ebp)
c01090c0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01090c3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c01090c7:	74 14                	je     c01090dd <i2a+0x35>
c01090c9:	83 ec 04             	sub    $0x4,%esp
c01090cc:	ff 75 10             	pushl  0x10(%ebp)
c01090cf:	ff 75 0c             	pushl  0xc(%ebp)
c01090d2:	ff 75 f0             	pushl  -0x10(%ebp)
c01090d5:	e8 ce ff ff ff       	call   c01090a8 <i2a>
c01090da:	83 c4 10             	add    $0x10,%esp
c01090dd:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c01090e1:	7f 0a                	jg     c01090ed <i2a+0x45>
c01090e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01090e6:	83 c0 30             	add    $0x30,%eax
c01090e9:	89 c3                	mov    %eax,%ebx
c01090eb:	eb 08                	jmp    c01090f5 <i2a+0x4d>
c01090ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01090f0:	83 c0 37             	add    $0x37,%eax
c01090f3:	89 c3                	mov    %eax,%ebx
c01090f5:	8b 45 10             	mov    0x10(%ebp),%eax
c01090f8:	8b 00                	mov    (%eax),%eax
c01090fa:	8d 48 01             	lea    0x1(%eax),%ecx
c01090fd:	8b 55 10             	mov    0x10(%ebp),%edx
c0109100:	89 0a                	mov    %ecx,(%edx)
c0109102:	88 18                	mov    %bl,(%eax)
c0109104:	8b 45 10             	mov    0x10(%ebp),%eax
c0109107:	8b 00                	mov    (%eax),%eax
c0109109:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c010910c:	c9                   	leave  
c010910d:	c3                   	ret    

c010910e <inform_int>:
c010910e:	55                   	push   %ebp
c010910f:	89 e5                	mov    %esp,%ebp
c0109111:	83 ec 18             	sub    $0x18,%esp
c0109114:	83 ec 0c             	sub    $0xc,%esp
c0109117:	ff 75 08             	pushl  0x8(%ebp)
c010911a:	e8 0d a5 ff ff       	call   c010362c <pid2proc>
c010911f:	83 c4 10             	add    $0x10,%esp
c0109122:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109125:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109128:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c010912f:	0f be c0             	movsbl %al,%eax
c0109132:	83 e0 02             	and    $0x2,%eax
c0109135:	85 c0                	test   %eax,%eax
c0109137:	0f 84 8e 00 00 00    	je     c01091cb <inform_int+0xbd>
c010913d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109140:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0109146:	3d 13 02 00 00       	cmp    $0x213,%eax
c010914b:	74 0e                	je     c010915b <inform_int+0x4d>
c010914d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109150:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0109156:	83 f8 12             	cmp    $0x12,%eax
c0109159:	75 7d                	jne    c01091d8 <inform_int+0xca>
c010915b:	c7 45 f0 7c 00 00 00 	movl   $0x7c,-0x10(%ebp)
c0109162:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109165:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c010916b:	83 ec 08             	sub    $0x8,%esp
c010916e:	ff 75 f0             	pushl  -0x10(%ebp)
c0109171:	50                   	push   %eax
c0109172:	e8 ed ca ff ff       	call   c0105c64 <alloc_virtual_memory>
c0109177:	83 c4 10             	add    $0x10,%esp
c010917a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010917d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109180:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c0109186:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109189:	c7 40 78 d5 07 00 00 	movl   $0x7d5,0x78(%eax)
c0109190:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109193:	c7 80 60 02 00 00 00 	movl   $0x0,0x260(%eax)
c010919a:	00 00 00 
c010919d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01091a0:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c01091a7:	00 00 00 
c01091aa:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01091b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01091b4:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c01091bb:	83 ec 0c             	sub    $0xc,%esp
c01091be:	ff 75 f4             	pushl  -0xc(%ebp)
c01091c1:	e8 e5 fd ff ff       	call   c0108fab <unblock>
c01091c6:	83 c4 10             	add    $0x10,%esp
c01091c9:	eb 0d                	jmp    c01091d8 <inform_int+0xca>
c01091cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01091ce:	c7 80 60 02 00 00 01 	movl   $0x1,0x260(%eax)
c01091d5:	00 00 00 
c01091d8:	90                   	nop
c01091d9:	c9                   	leave  
c01091da:	c3                   	ret    

c01091db <strcmp>:
c01091db:	55                   	push   %ebp
c01091dc:	89 e5                	mov    %esp,%ebp
c01091de:	83 ec 10             	sub    $0x10,%esp
c01091e1:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c01091e5:	74 06                	je     c01091ed <strcmp+0x12>
c01091e7:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01091eb:	75 08                	jne    c01091f5 <strcmp+0x1a>
c01091ed:	8b 45 08             	mov    0x8(%ebp),%eax
c01091f0:	2b 45 0c             	sub    0xc(%ebp),%eax
c01091f3:	eb 53                	jmp    c0109248 <strcmp+0x6d>
c01091f5:	8b 45 08             	mov    0x8(%ebp),%eax
c01091f8:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01091fb:	8b 45 0c             	mov    0xc(%ebp),%eax
c01091fe:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0109201:	eb 18                	jmp    c010921b <strcmp+0x40>
c0109203:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0109206:	0f b6 10             	movzbl (%eax),%edx
c0109209:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010920c:	0f b6 00             	movzbl (%eax),%eax
c010920f:	38 c2                	cmp    %al,%dl
c0109211:	75 1e                	jne    c0109231 <strcmp+0x56>
c0109213:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0109217:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c010921b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010921e:	0f b6 00             	movzbl (%eax),%eax
c0109221:	84 c0                	test   %al,%al
c0109223:	74 0d                	je     c0109232 <strcmp+0x57>
c0109225:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0109228:	0f b6 00             	movzbl (%eax),%eax
c010922b:	84 c0                	test   %al,%al
c010922d:	75 d4                	jne    c0109203 <strcmp+0x28>
c010922f:	eb 01                	jmp    c0109232 <strcmp+0x57>
c0109231:	90                   	nop
c0109232:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0109235:	0f b6 00             	movzbl (%eax),%eax
c0109238:	0f be d0             	movsbl %al,%edx
c010923b:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010923e:	0f b6 00             	movzbl (%eax),%eax
c0109241:	0f be c0             	movsbl %al,%eax
c0109244:	29 c2                	sub    %eax,%edx
c0109246:	89 d0                	mov    %edx,%eax
c0109248:	c9                   	leave  
c0109249:	c3                   	ret    

c010924a <create_user_process_address_space>:
c010924a:	55                   	push   %ebp
c010924b:	89 e5                	mov    %esp,%ebp
c010924d:	83 ec 18             	sub    $0x18,%esp
c0109250:	83 ec 08             	sub    $0x8,%esp
c0109253:	6a 00                	push   $0x0
c0109255:	6a 01                	push   $0x1
c0109257:	e8 3b cd ff ff       	call   c0105f97 <alloc_memory>
c010925c:	83 c4 10             	add    $0x10,%esp
c010925f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109262:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109265:	c7 40 08 00 80 04 08 	movl   $0x8048000,0x8(%eax)
c010926c:	c7 45 f0 00 80 fb b7 	movl   $0xb7fb8000,-0x10(%ebp)
c0109273:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109276:	05 ff 0f 00 00       	add    $0xfff,%eax
c010927b:	c1 e8 0c             	shr    $0xc,%eax
c010927e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109281:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109284:	83 c0 07             	add    $0x7,%eax
c0109287:	c1 e8 03             	shr    $0x3,%eax
c010928a:	89 c2                	mov    %eax,%edx
c010928c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010928f:	89 50 04             	mov    %edx,0x4(%eax)
c0109292:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109295:	8b 40 04             	mov    0x4(%eax),%eax
c0109298:	05 ff 0f 00 00       	add    $0xfff,%eax
c010929d:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c01092a3:	85 c0                	test   %eax,%eax
c01092a5:	0f 48 c2             	cmovs  %edx,%eax
c01092a8:	c1 f8 0c             	sar    $0xc,%eax
c01092ab:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01092ae:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01092b1:	83 ec 08             	sub    $0x8,%esp
c01092b4:	6a 00                	push   $0x0
c01092b6:	50                   	push   %eax
c01092b7:	e8 db cc ff ff       	call   c0105f97 <alloc_memory>
c01092bc:	83 c4 10             	add    $0x10,%esp
c01092bf:	89 c2                	mov    %eax,%edx
c01092c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01092c4:	89 10                	mov    %edx,(%eax)
c01092c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01092c9:	83 ec 0c             	sub    $0xc,%esp
c01092cc:	50                   	push   %eax
c01092cd:	e8 9c c4 ff ff       	call   c010576e <init_bitmap>
c01092d2:	83 c4 10             	add    $0x10,%esp
c01092d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01092d8:	c9                   	leave  
c01092d9:	c3                   	ret    

c01092da <user_process>:
c01092da:	55                   	push   %ebp
c01092db:	89 e5                	mov    %esp,%ebp
c01092dd:	83 ec 38             	sub    $0x38,%esp
c01092e0:	c7 45 f0 b2 0c 00 00 	movl   $0xcb2,-0x10(%ebp)
c01092e7:	c7 45 ec ba 0c 00 00 	movl   $0xcba,-0x14(%ebp)
c01092ee:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%ebp)
c01092f5:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c01092f9:	75 0e                	jne    c0109309 <user_process+0x2f>
c01092fb:	66 c7 45 f6 48 00    	movw   $0x48,-0xa(%ebp)
c0109301:	66 c7 45 f4 50 00    	movw   $0x50,-0xc(%ebp)
c0109307:	eb 0c                	jmp    c0109315 <user_process+0x3b>
c0109309:	66 c7 45 f6 59 00    	movw   $0x59,-0xa(%ebp)
c010930f:	66 c7 45 f4 61 00    	movw   $0x61,-0xc(%ebp)
c0109315:	e8 7d 70 ff ff       	call   c0100397 <get_running_thread_pcb>
c010931a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010931d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109320:	05 00 10 00 00       	add    $0x1000,%eax
c0109325:	89 c2                	mov    %eax,%edx
c0109327:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010932a:	89 10                	mov    %edx,(%eax)
c010932c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010932f:	8b 00                	mov    (%eax),%eax
c0109331:	83 e8 44             	sub    $0x44,%eax
c0109334:	89 c2                	mov    %eax,%edx
c0109336:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109339:	89 10                	mov    %edx,(%eax)
c010933b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010933e:	8b 00                	mov    (%eax),%eax
c0109340:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109343:	c6 45 df 00          	movb   $0x0,-0x21(%ebp)
c0109347:	66 c7 45 dc 02 12    	movw   $0x1202,-0x24(%ebp)
c010934d:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0109351:	66 89 45 da          	mov    %ax,-0x26(%ebp)
c0109355:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0109359:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
c010935d:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0109361:	66 89 45 d6          	mov    %ax,-0x2a(%ebp)
c0109365:	66 c7 45 d4 38 00    	movw   $0x38,-0x2c(%ebp)
c010936b:	0f b7 55 f4          	movzwl -0xc(%ebp),%edx
c010936f:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109372:	89 50 34             	mov    %edx,0x34(%eax)
c0109375:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c0109379:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010937c:	89 50 0c             	mov    %edx,0xc(%eax)
c010937f:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c0109383:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109386:	89 50 04             	mov    %edx,0x4(%eax)
c0109389:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c010938d:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109390:	89 50 08             	mov    %edx,0x8(%eax)
c0109393:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c0109397:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010939a:	89 50 40             	mov    %edx,0x40(%eax)
c010939d:	0f b7 55 d4          	movzwl -0x2c(%ebp),%edx
c01093a1:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01093a4:	89 10                	mov    %edx,(%eax)
c01093a6:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01093a9:	8b 55 08             	mov    0x8(%ebp),%edx
c01093ac:	89 50 30             	mov    %edx,0x30(%eax)
c01093af:	0f b7 55 dc          	movzwl -0x24(%ebp),%edx
c01093b3:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01093b6:	89 50 38             	mov    %edx,0x38(%eax)
c01093b9:	83 ec 08             	sub    $0x8,%esp
c01093bc:	6a 01                	push   $0x1
c01093be:	68 00 f0 ff bf       	push   $0xbffff000
c01093c3:	e8 07 cb ff ff       	call   c0105ecf <alloc_physical_memory>
c01093c8:	83 c4 10             	add    $0x10,%esp
c01093cb:	8d 90 00 10 00 00    	lea    0x1000(%eax),%edx
c01093d1:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01093d4:	89 50 3c             	mov    %edx,0x3c(%eax)
c01093d7:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01093da:	83 ec 0c             	sub    $0xc,%esp
c01093dd:	50                   	push   %eax
c01093de:	e8 89 6e ff ff       	call   c010026c <restart>
c01093e3:	83 c4 10             	add    $0x10,%esp
c01093e6:	90                   	nop
c01093e7:	c9                   	leave  
c01093e8:	c3                   	ret    

c01093e9 <clone_pcb>:
c01093e9:	55                   	push   %ebp
c01093ea:	89 e5                	mov    %esp,%ebp
c01093ec:	83 ec 38             	sub    $0x38,%esp
c01093ef:	83 ec 08             	sub    $0x8,%esp
c01093f2:	6a 00                	push   $0x0
c01093f4:	6a 01                	push   $0x1
c01093f6:	e8 9c cb ff ff       	call   c0105f97 <alloc_memory>
c01093fb:	83 c4 10             	add    $0x10,%esp
c01093fe:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109401:	83 ec 04             	sub    $0x4,%esp
c0109404:	68 00 10 00 00       	push   $0x1000
c0109409:	6a 00                	push   $0x0
c010940b:	ff 75 f4             	pushl  -0xc(%ebp)
c010940e:	e8 0c 18 00 00       	call   c010ac1f <Memset>
c0109413:	83 c4 10             	add    $0x10,%esp
c0109416:	83 ec 04             	sub    $0x4,%esp
c0109419:	68 00 10 00 00       	push   $0x1000
c010941e:	ff 75 08             	pushl  0x8(%ebp)
c0109421:	ff 75 f4             	pushl  -0xc(%ebp)
c0109424:	e8 55 d6 ff ff       	call   c0106a7e <Memcpy>
c0109429:	83 c4 10             	add    $0x10,%esp
c010942c:	a1 90 f7 10 c0       	mov    0xc010f790,%eax
c0109431:	83 c0 01             	add    $0x1,%eax
c0109434:	a3 90 f7 10 c0       	mov    %eax,0xc010f790
c0109439:	8b 15 90 f7 10 c0    	mov    0xc010f790,%edx
c010943f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109442:	89 90 24 01 00 00    	mov    %edx,0x124(%eax)
c0109448:	8b 45 08             	mov    0x8(%ebp),%eax
c010944b:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0109451:	89 c2                	mov    %eax,%edx
c0109453:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109456:	89 90 64 02 00 00    	mov    %edx,0x264(%eax)
c010945c:	83 ec 08             	sub    $0x8,%esp
c010945f:	6a 00                	push   $0x0
c0109461:	6a 01                	push   $0x1
c0109463:	e8 2f cb ff ff       	call   c0105f97 <alloc_memory>
c0109468:	83 c4 10             	add    $0x10,%esp
c010946b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010946e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109471:	05 00 0c 00 00       	add    $0xc00,%eax
c0109476:	83 ec 04             	sub    $0x4,%esp
c0109479:	68 00 04 00 00       	push   $0x400
c010947e:	68 00 fc ff ff       	push   $0xfffffc00
c0109483:	50                   	push   %eax
c0109484:	e8 f5 d5 ff ff       	call   c0106a7e <Memcpy>
c0109489:	83 c4 10             	add    $0x10,%esp
c010948c:	83 ec 0c             	sub    $0xc,%esp
c010948f:	ff 75 f0             	pushl  -0x10(%ebp)
c0109492:	e8 17 c9 ff ff       	call   c0105dae <get_physical_address>
c0109497:	83 c4 10             	add    $0x10,%esp
c010949a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010949d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01094a0:	05 fc 0f 00 00       	add    $0xffc,%eax
c01094a5:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01094a8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01094ab:	83 c8 07             	or     $0x7,%eax
c01094ae:	89 c2                	mov    %eax,%edx
c01094b0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01094b3:	89 10                	mov    %edx,(%eax)
c01094b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01094b8:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01094bb:	89 50 08             	mov    %edx,0x8(%eax)
c01094be:	e8 87 fd ff ff       	call   c010924a <create_user_process_address_space>
c01094c3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01094c6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01094c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01094cc:	89 50 0c             	mov    %edx,0xc(%eax)
c01094cf:	8b 45 08             	mov    0x8(%ebp),%eax
c01094d2:	8b 40 0c             	mov    0xc(%eax),%eax
c01094d5:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01094d8:	83 ec 04             	sub    $0x4,%esp
c01094db:	6a 0c                	push   $0xc
c01094dd:	ff 75 e0             	pushl  -0x20(%ebp)
c01094e0:	ff 75 e4             	pushl  -0x1c(%ebp)
c01094e3:	e8 96 d5 ff ff       	call   c0106a7e <Memcpy>
c01094e8:	83 c4 10             	add    $0x10,%esp
c01094eb:	c7 45 dc 00 80 fb b7 	movl   $0xb7fb8000,-0x24(%ebp)
c01094f2:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01094f5:	05 ff 0f 00 00       	add    $0xfff,%eax
c01094fa:	c1 e8 0c             	shr    $0xc,%eax
c01094fd:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0109500:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109503:	83 c0 07             	add    $0x7,%eax
c0109506:	c1 e8 03             	shr    $0x3,%eax
c0109509:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010950c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010950f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0109512:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0109515:	05 ff 0f 00 00       	add    $0xfff,%eax
c010951a:	c1 e8 0c             	shr    $0xc,%eax
c010951d:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0109520:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0109523:	83 ec 08             	sub    $0x8,%esp
c0109526:	6a 00                	push   $0x0
c0109528:	50                   	push   %eax
c0109529:	e8 69 ca ff ff       	call   c0105f97 <alloc_memory>
c010952e:	83 c4 10             	add    $0x10,%esp
c0109531:	89 c2                	mov    %eax,%edx
c0109533:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109536:	89 10                	mov    %edx,(%eax)
c0109538:	8b 45 d0             	mov    -0x30(%ebp),%eax
c010953b:	c1 e0 0c             	shl    $0xc,%eax
c010953e:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0109541:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109544:	8b 10                	mov    (%eax),%edx
c0109546:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109549:	8b 00                	mov    (%eax),%eax
c010954b:	83 ec 04             	sub    $0x4,%esp
c010954e:	ff 75 cc             	pushl  -0x34(%ebp)
c0109551:	52                   	push   %edx
c0109552:	50                   	push   %eax
c0109553:	e8 26 d5 ff ff       	call   c0106a7e <Memcpy>
c0109558:	83 c4 10             	add    $0x10,%esp
c010955b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010955e:	c9                   	leave  
c010955f:	c3                   	ret    

c0109560 <build_body_stack>:
c0109560:	55                   	push   %ebp
c0109561:	89 e5                	mov    %esp,%ebp
c0109563:	83 ec 48             	sub    $0x48,%esp
c0109566:	8b 45 08             	mov    0x8(%ebp),%eax
c0109569:	8b 40 0c             	mov    0xc(%eax),%eax
c010956c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010956f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109572:	8b 50 04             	mov    0x4(%eax),%edx
c0109575:	8b 00                	mov    (%eax),%eax
c0109577:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c010957a:	89 55 c8             	mov    %edx,-0x38(%ebp)
c010957d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0109580:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109583:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0109586:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0109589:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010958c:	8b 40 08             	mov    0x8(%eax),%eax
c010958f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0109592:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0109599:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01095a0:	e8 75 d4 ff ff       	call   c0106a1a <intr_disable>
c01095a5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01095a8:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01095af:	e9 c2 00 00 00       	jmp    c0109676 <build_body_stack+0x116>
c01095b4:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01095b7:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01095ba:	01 d0                	add    %edx,%eax
c01095bc:	0f b6 00             	movzbl (%eax),%eax
c01095bf:	88 45 d3             	mov    %al,-0x2d(%ebp)
c01095c2:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01095c9:	e9 9a 00 00 00       	jmp    c0109668 <build_body_stack+0x108>
c01095ce:	0f be 55 d3          	movsbl -0x2d(%ebp),%edx
c01095d2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01095d5:	89 c1                	mov    %eax,%ecx
c01095d7:	d3 fa                	sar    %cl,%edx
c01095d9:	89 d0                	mov    %edx,%eax
c01095db:	83 e0 01             	and    $0x1,%eax
c01095de:	85 c0                	test   %eax,%eax
c01095e0:	75 06                	jne    c01095e8 <build_body_stack+0x88>
c01095e2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01095e6:	eb 7c                	jmp    c0109664 <build_body_stack+0x104>
c01095e8:	8b 45 08             	mov    0x8(%ebp),%eax
c01095eb:	8b 40 08             	mov    0x8(%eax),%eax
c01095ee:	83 ec 0c             	sub    $0xc,%esp
c01095f1:	50                   	push   %eax
c01095f2:	e8 84 6d ff ff       	call   c010037b <update_cr3>
c01095f7:	83 c4 10             	add    $0x10,%esp
c01095fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01095fd:	c1 e0 0c             	shl    $0xc,%eax
c0109600:	89 c2                	mov    %eax,%edx
c0109602:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109605:	01 d0                	add    %edx,%eax
c0109607:	89 45 cc             	mov    %eax,-0x34(%ebp)
c010960a:	8b 55 cc             	mov    -0x34(%ebp),%edx
c010960d:	8b 45 10             	mov    0x10(%ebp),%eax
c0109610:	83 ec 04             	sub    $0x4,%esp
c0109613:	68 00 10 00 00       	push   $0x1000
c0109618:	52                   	push   %edx
c0109619:	50                   	push   %eax
c010961a:	e8 5f d4 ff ff       	call   c0106a7e <Memcpy>
c010961f:	83 c4 10             	add    $0x10,%esp
c0109622:	8b 45 0c             	mov    0xc(%ebp),%eax
c0109625:	8b 40 08             	mov    0x8(%eax),%eax
c0109628:	83 ec 0c             	sub    $0xc,%esp
c010962b:	50                   	push   %eax
c010962c:	e8 4a 6d ff ff       	call   c010037b <update_cr3>
c0109631:	83 c4 10             	add    $0x10,%esp
c0109634:	83 ec 08             	sub    $0x8,%esp
c0109637:	ff 75 cc             	pushl  -0x34(%ebp)
c010963a:	6a 01                	push   $0x1
c010963c:	e8 b8 c9 ff ff       	call   c0105ff9 <get_a_virtual_page>
c0109641:	83 c4 10             	add    $0x10,%esp
c0109644:	8b 55 10             	mov    0x10(%ebp),%edx
c0109647:	8b 45 cc             	mov    -0x34(%ebp),%eax
c010964a:	83 ec 04             	sub    $0x4,%esp
c010964d:	68 00 10 00 00       	push   $0x1000
c0109652:	52                   	push   %edx
c0109653:	50                   	push   %eax
c0109654:	e8 25 d4 ff ff       	call   c0106a7e <Memcpy>
c0109659:	83 c4 10             	add    $0x10,%esp
c010965c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0109660:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0109664:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0109668:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c010966c:	0f 8e 5c ff ff ff    	jle    c01095ce <build_body_stack+0x6e>
c0109672:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0109676:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109679:	39 45 dc             	cmp    %eax,-0x24(%ebp)
c010967c:	0f 87 32 ff ff ff    	ja     c01095b4 <build_body_stack+0x54>
c0109682:	83 ec 0c             	sub    $0xc,%esp
c0109685:	ff 75 d4             	pushl  -0x2c(%ebp)
c0109688:	e8 b6 d3 ff ff       	call   c0106a43 <intr_set_status>
c010968d:	83 c4 10             	add    $0x10,%esp
c0109690:	90                   	nop
c0109691:	c9                   	leave  
c0109692:	c3                   	ret    

c0109693 <build_process_kernel_stack>:
c0109693:	55                   	push   %ebp
c0109694:	89 e5                	mov    %esp,%ebp
c0109696:	83 ec 28             	sub    $0x28,%esp
c0109699:	e8 7c d3 ff ff       	call   c0106a1a <intr_disable>
c010969e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01096a1:	8b 45 08             	mov    0x8(%ebp),%eax
c01096a4:	05 00 10 00 00       	add    $0x1000,%eax
c01096a9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01096ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01096af:	8b 00                	mov    (%eax),%eax
c01096b1:	83 f8 38             	cmp    $0x38,%eax
c01096b4:	74 06                	je     c01096bc <build_process_kernel_stack+0x29>
c01096b6:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c01096ba:	eb f0                	jmp    c01096ac <build_process_kernel_stack+0x19>
c01096bc:	90                   	nop
c01096bd:	8b 45 08             	mov    0x8(%ebp),%eax
c01096c0:	05 00 10 00 00       	add    $0x1000,%eax
c01096c5:	89 c2                	mov    %eax,%edx
c01096c7:	8b 45 08             	mov    0x8(%ebp),%eax
c01096ca:	89 50 04             	mov    %edx,0x4(%eax)
c01096cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01096d0:	83 c0 2c             	add    $0x2c,%eax
c01096d3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01096d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01096d9:	83 e8 04             	sub    $0x4,%eax
c01096dc:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01096df:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01096e2:	83 e8 08             	sub    $0x8,%eax
c01096e5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01096e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01096eb:	83 e8 0c             	sub    $0xc,%eax
c01096ee:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01096f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01096f4:	83 e8 10             	sub    $0x10,%eax
c01096f7:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01096fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01096fd:	83 e8 14             	sub    $0x14,%eax
c0109700:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0109703:	ba 63 02 10 c0       	mov    $0xc0100263,%edx
c0109708:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010970b:	89 10                	mov    %edx,(%eax)
c010970d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109710:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0109716:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0109719:	8b 10                	mov    (%eax),%edx
c010971b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c010971e:	89 10                	mov    %edx,(%eax)
c0109720:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0109723:	8b 10                	mov    (%eax),%edx
c0109725:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109728:	89 10                	mov    %edx,(%eax)
c010972a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010972d:	8b 10                	mov    (%eax),%edx
c010972f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109732:	89 10                	mov    %edx,(%eax)
c0109734:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109737:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010973d:	8b 45 08             	mov    0x8(%ebp),%eax
c0109740:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0109743:	89 10                	mov    %edx,(%eax)
c0109745:	83 ec 0c             	sub    $0xc,%esp
c0109748:	ff 75 f0             	pushl  -0x10(%ebp)
c010974b:	e8 f3 d2 ff ff       	call   c0106a43 <intr_set_status>
c0109750:	83 c4 10             	add    $0x10,%esp
c0109753:	90                   	nop
c0109754:	c9                   	leave  
c0109755:	c3                   	ret    

c0109756 <fork_process>:
c0109756:	55                   	push   %ebp
c0109757:	89 e5                	mov    %esp,%ebp
c0109759:	83 ec 18             	sub    $0x18,%esp
c010975c:	8b 45 08             	mov    0x8(%ebp),%eax
c010975f:	83 ec 0c             	sub    $0xc,%esp
c0109762:	50                   	push   %eax
c0109763:	e8 c4 9e ff ff       	call   c010362c <pid2proc>
c0109768:	83 c4 10             	add    $0x10,%esp
c010976b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010976e:	83 ec 0c             	sub    $0xc,%esp
c0109771:	ff 75 f4             	pushl  -0xc(%ebp)
c0109774:	e8 70 fc ff ff       	call   c01093e9 <clone_pcb>
c0109779:	83 c4 10             	add    $0x10,%esp
c010977c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010977f:	83 ec 08             	sub    $0x8,%esp
c0109782:	6a 00                	push   $0x0
c0109784:	6a 01                	push   $0x1
c0109786:	e8 0c c8 ff ff       	call   c0105f97 <alloc_memory>
c010978b:	83 c4 10             	add    $0x10,%esp
c010978e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109791:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109794:	83 ec 04             	sub    $0x4,%esp
c0109797:	68 00 10 00 00       	push   $0x1000
c010979c:	6a 00                	push   $0x0
c010979e:	50                   	push   %eax
c010979f:	e8 7b 14 00 00       	call   c010ac1f <Memset>
c01097a4:	83 c4 10             	add    $0x10,%esp
c01097a7:	83 ec 04             	sub    $0x4,%esp
c01097aa:	ff 75 ec             	pushl  -0x14(%ebp)
c01097ad:	ff 75 f0             	pushl  -0x10(%ebp)
c01097b0:	ff 75 f4             	pushl  -0xc(%ebp)
c01097b3:	e8 a8 fd ff ff       	call   c0109560 <build_body_stack>
c01097b8:	83 c4 10             	add    $0x10,%esp
c01097bb:	83 ec 0c             	sub    $0xc,%esp
c01097be:	ff 75 f0             	pushl  -0x10(%ebp)
c01097c1:	e8 cd fe ff ff       	call   c0109693 <build_process_kernel_stack>
c01097c6:	83 c4 10             	add    $0x10,%esp
c01097c9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01097cc:	05 00 01 00 00       	add    $0x100,%eax
c01097d1:	83 ec 04             	sub    $0x4,%esp
c01097d4:	6a 08                	push   $0x8
c01097d6:	6a 00                	push   $0x0
c01097d8:	50                   	push   %eax
c01097d9:	e8 41 14 00 00       	call   c010ac1f <Memset>
c01097de:	83 c4 10             	add    $0x10,%esp
c01097e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01097e4:	05 08 01 00 00       	add    $0x108,%eax
c01097e9:	83 ec 04             	sub    $0x4,%esp
c01097ec:	6a 08                	push   $0x8
c01097ee:	6a 00                	push   $0x0
c01097f0:	50                   	push   %eax
c01097f1:	e8 29 14 00 00       	call   c010ac1f <Memset>
c01097f6:	83 c4 10             	add    $0x10,%esp
c01097f9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01097fc:	05 08 01 00 00       	add    $0x108,%eax
c0109801:	83 ec 08             	sub    $0x8,%esp
c0109804:	50                   	push   %eax
c0109805:	68 04 0f 11 c0       	push   $0xc0110f04
c010980a:	e8 c1 02 00 00       	call   c0109ad0 <appendToDoubleLinkList>
c010980f:	83 c4 10             	add    $0x10,%esp
c0109812:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109815:	c9                   	leave  
c0109816:	c3                   	ret    

c0109817 <process_execute>:
c0109817:	55                   	push   %ebp
c0109818:	89 e5                	mov    %esp,%ebp
c010981a:	83 ec 28             	sub    $0x28,%esp
c010981d:	e8 c4 04 00 00       	call   c0109ce6 <thread_init>
c0109822:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109825:	83 ec 0c             	sub    $0xc,%esp
c0109828:	ff 75 f4             	pushl  -0xc(%ebp)
c010982b:	e8 63 05 00 00       	call   c0109d93 <thread_create>
c0109830:	83 c4 10             	add    $0x10,%esp
c0109833:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109836:	05 34 01 00 00       	add    $0x134,%eax
c010983b:	83 ec 08             	sub    $0x8,%esp
c010983e:	ff 75 10             	pushl  0x10(%ebp)
c0109841:	50                   	push   %eax
c0109842:	e8 f7 13 00 00       	call   c010ac3e <Strcpy>
c0109847:	83 c4 10             	add    $0x10,%esp
c010984a:	83 ec 08             	sub    $0x8,%esp
c010984d:	6a 00                	push   $0x0
c010984f:	6a 01                	push   $0x1
c0109851:	e8 41 c7 ff ff       	call   c0105f97 <alloc_memory>
c0109856:	83 c4 10             	add    $0x10,%esp
c0109859:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010985c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010985f:	05 00 0c 00 00       	add    $0xc00,%eax
c0109864:	83 ec 04             	sub    $0x4,%esp
c0109867:	68 00 04 00 00       	push   $0x400
c010986c:	68 00 fc ff ff       	push   $0xfffffc00
c0109871:	50                   	push   %eax
c0109872:	e8 07 d2 ff ff       	call   c0106a7e <Memcpy>
c0109877:	83 c4 10             	add    $0x10,%esp
c010987a:	83 ec 0c             	sub    $0xc,%esp
c010987d:	ff 75 f0             	pushl  -0x10(%ebp)
c0109880:	e8 29 c5 ff ff       	call   c0105dae <get_physical_address>
c0109885:	83 c4 10             	add    $0x10,%esp
c0109888:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010988b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010988e:	05 fc 0f 00 00       	add    $0xffc,%eax
c0109893:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0109896:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109899:	83 c8 07             	or     $0x7,%eax
c010989c:	89 c2                	mov    %eax,%edx
c010989e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01098a1:	89 10                	mov    %edx,(%eax)
c01098a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01098a6:	8b 55 ec             	mov    -0x14(%ebp),%edx
c01098a9:	89 50 08             	mov    %edx,0x8(%eax)
c01098ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01098af:	83 c0 10             	add    $0x10,%eax
c01098b2:	83 ec 0c             	sub    $0xc,%esp
c01098b5:	50                   	push   %eax
c01098b6:	e8 88 cc ff ff       	call   c0106543 <init_memory_block_desc>
c01098bb:	83 c4 10             	add    $0x10,%esp
c01098be:	e8 87 f9 ff ff       	call   c010924a <create_user_process_address_space>
c01098c3:	89 c2                	mov    %eax,%edx
c01098c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01098c8:	89 50 0c             	mov    %edx,0xc(%eax)
c01098cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01098ce:	8b 00                	mov    (%eax),%eax
c01098d0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01098d3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01098d6:	c7 40 10 da 92 10 c0 	movl   $0xc01092da,0x10(%eax)
c01098dd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01098e0:	8b 55 08             	mov    0x8(%ebp),%edx
c01098e3:	89 50 18             	mov    %edx,0x18(%eax)
c01098e6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01098e9:	8b 55 0c             	mov    0xc(%ebp),%edx
c01098ec:	89 50 1c             	mov    %edx,0x1c(%eax)
c01098ef:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01098f2:	8b 55 14             	mov    0x14(%ebp),%edx
c01098f5:	89 50 20             	mov    %edx,0x20(%eax)
c01098f8:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01098fb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01098fe:	89 50 24             	mov    %edx,0x24(%eax)
c0109901:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109904:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c010990a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010990d:	8b 10                	mov    (%eax),%edx
c010990f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109912:	89 50 04             	mov    %edx,0x4(%eax)
c0109915:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109918:	8b 50 04             	mov    0x4(%eax),%edx
c010991b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010991e:	89 50 08             	mov    %edx,0x8(%eax)
c0109921:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109924:	8b 50 08             	mov    0x8(%eax),%edx
c0109927:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010992a:	89 50 0c             	mov    %edx,0xc(%eax)
c010992d:	83 ec 0c             	sub    $0xc,%esp
c0109930:	68 ec fd 10 c0       	push   $0xc010fdec
c0109935:	e8 99 00 00 00       	call   c01099d3 <isListEmpty>
c010993a:	83 c4 10             	add    $0x10,%esp
c010993d:	e8 d8 d0 ff ff       	call   c0106a1a <intr_disable>
c0109942:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109945:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109948:	05 00 01 00 00       	add    $0x100,%eax
c010994d:	83 ec 08             	sub    $0x8,%esp
c0109950:	50                   	push   %eax
c0109951:	68 ec fd 10 c0       	push   $0xc010fdec
c0109956:	e8 75 01 00 00       	call   c0109ad0 <appendToDoubleLinkList>
c010995b:	83 c4 10             	add    $0x10,%esp
c010995e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109961:	05 08 01 00 00       	add    $0x108,%eax
c0109966:	83 ec 08             	sub    $0x8,%esp
c0109969:	50                   	push   %eax
c010996a:	68 04 0f 11 c0       	push   $0xc0110f04
c010996f:	e8 5c 01 00 00       	call   c0109ad0 <appendToDoubleLinkList>
c0109974:	83 c4 10             	add    $0x10,%esp
c0109977:	83 ec 0c             	sub    $0xc,%esp
c010997a:	ff 75 e0             	pushl  -0x20(%ebp)
c010997d:	e8 c1 d0 ff ff       	call   c0106a43 <intr_set_status>
c0109982:	83 c4 10             	add    $0x10,%esp
c0109985:	90                   	nop
c0109986:	c9                   	leave  
c0109987:	c3                   	ret    
c0109988:	66 90                	xchg   %ax,%ax
c010998a:	66 90                	xchg   %ax,%ax
c010998c:	66 90                	xchg   %ax,%ax
c010998e:	66 90                	xchg   %ax,%ax

c0109990 <switch_to>:
c0109990:	56                   	push   %esi
c0109991:	57                   	push   %edi
c0109992:	53                   	push   %ebx
c0109993:	55                   	push   %ebp
c0109994:	89 e5                	mov    %esp,%ebp
c0109996:	8b 45 14             	mov    0x14(%ebp),%eax
c0109999:	89 20                	mov    %esp,(%eax)
c010999b:	8b 45 18             	mov    0x18(%ebp),%eax
c010999e:	8b 20                	mov    (%eax),%esp
c01099a0:	5d                   	pop    %ebp
c01099a1:	5b                   	pop    %ebx
c01099a2:	5f                   	pop    %edi
c01099a3:	5e                   	pop    %esi
c01099a4:	c3                   	ret    

c01099a5 <initDoubleLinkList>:
c01099a5:	55                   	push   %ebp
c01099a6:	89 e5                	mov    %esp,%ebp
c01099a8:	8b 45 08             	mov    0x8(%ebp),%eax
c01099ab:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c01099b1:	8b 45 08             	mov    0x8(%ebp),%eax
c01099b4:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c01099bb:	8b 45 08             	mov    0x8(%ebp),%eax
c01099be:	8d 50 08             	lea    0x8(%eax),%edx
c01099c1:	8b 45 08             	mov    0x8(%ebp),%eax
c01099c4:	89 50 04             	mov    %edx,0x4(%eax)
c01099c7:	8b 55 08             	mov    0x8(%ebp),%edx
c01099ca:	8b 45 08             	mov    0x8(%ebp),%eax
c01099cd:	89 50 08             	mov    %edx,0x8(%eax)
c01099d0:	90                   	nop
c01099d1:	5d                   	pop    %ebp
c01099d2:	c3                   	ret    

c01099d3 <isListEmpty>:
c01099d3:	55                   	push   %ebp
c01099d4:	89 e5                	mov    %esp,%ebp
c01099d6:	8b 45 08             	mov    0x8(%ebp),%eax
c01099d9:	8b 40 04             	mov    0x4(%eax),%eax
c01099dc:	8b 55 08             	mov    0x8(%ebp),%edx
c01099df:	83 c2 08             	add    $0x8,%edx
c01099e2:	39 d0                	cmp    %edx,%eax
c01099e4:	75 07                	jne    c01099ed <isListEmpty+0x1a>
c01099e6:	b8 01 00 00 00       	mov    $0x1,%eax
c01099eb:	eb 05                	jmp    c01099f2 <isListEmpty+0x1f>
c01099ed:	b8 00 00 00 00       	mov    $0x0,%eax
c01099f2:	5d                   	pop    %ebp
c01099f3:	c3                   	ret    

c01099f4 <findElementInList>:
c01099f4:	55                   	push   %ebp
c01099f5:	89 e5                	mov    %esp,%ebp
c01099f7:	83 ec 28             	sub    $0x28,%esp
c01099fa:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c01099fe:	75 19                	jne    c0109a19 <findElementInList+0x25>
c0109a00:	6a 60                	push   $0x60
c0109a02:	68 c5 ab 10 c0       	push   $0xc010abc5
c0109a07:	68 c5 ab 10 c0       	push   $0xc010abc5
c0109a0c:	68 d8 ab 10 c0       	push   $0xc010abd8
c0109a11:	e8 41 ea ff ff       	call   c0108457 <assertion_failure>
c0109a16:	83 c4 10             	add    $0x10,%esp
c0109a19:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0109a1d:	75 19                	jne    c0109a38 <findElementInList+0x44>
c0109a1f:	6a 61                	push   $0x61
c0109a21:	68 c5 ab 10 c0       	push   $0xc010abc5
c0109a26:	68 c5 ab 10 c0       	push   $0xc010abc5
c0109a2b:	68 e4 ab 10 c0       	push   $0xc010abe4
c0109a30:	e8 22 ea ff ff       	call   c0108457 <assertion_failure>
c0109a35:	83 c4 10             	add    $0x10,%esp
c0109a38:	e8 dd cf ff ff       	call   c0106a1a <intr_disable>
c0109a3d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109a40:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0109a47:	8b 45 08             	mov    0x8(%ebp),%eax
c0109a4a:	8b 40 08             	mov    0x8(%eax),%eax
c0109a4d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0109a50:	8b 45 08             	mov    0x8(%ebp),%eax
c0109a53:	8b 40 04             	mov    0x4(%eax),%eax
c0109a56:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109a59:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0109a5d:	75 07                	jne    c0109a66 <findElementInList+0x72>
c0109a5f:	b8 00 00 00 00       	mov    $0x0,%eax
c0109a64:	eb 68                	jmp    c0109ace <findElementInList+0xda>
c0109a66:	8b 45 0c             	mov    0xc(%ebp),%eax
c0109a69:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109a6c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109a6f:	2b 45 f0             	sub    -0x10(%ebp),%eax
c0109a72:	c1 f8 03             	sar    $0x3,%eax
c0109a75:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109a78:	eb 36                	jmp    c0109ab0 <findElementInList+0xbc>
c0109a7a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109a7d:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c0109a80:	75 07                	jne    c0109a89 <findElementInList+0x95>
c0109a82:	b8 01 00 00 00       	mov    $0x1,%eax
c0109a87:	eb 45                	jmp    c0109ace <findElementInList+0xda>
c0109a89:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0109a8d:	75 07                	jne    c0109a96 <findElementInList+0xa2>
c0109a8f:	b8 00 00 00 00       	mov    $0x0,%eax
c0109a94:	eb 38                	jmp    c0109ace <findElementInList+0xda>
c0109a96:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109a99:	8b 40 04             	mov    0x4(%eax),%eax
c0109a9c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109a9f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0109aa3:	75 07                	jne    c0109aac <findElementInList+0xb8>
c0109aa5:	b8 00 00 00 00       	mov    $0x0,%eax
c0109aaa:	eb 22                	jmp    c0109ace <findElementInList+0xda>
c0109aac:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0109ab0:	8b 45 08             	mov    0x8(%ebp),%eax
c0109ab3:	83 c0 08             	add    $0x8,%eax
c0109ab6:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0109ab9:	75 bf                	jne    c0109a7a <findElementInList+0x86>
c0109abb:	83 ec 0c             	sub    $0xc,%esp
c0109abe:	ff 75 ec             	pushl  -0x14(%ebp)
c0109ac1:	e8 7d cf ff ff       	call   c0106a43 <intr_set_status>
c0109ac6:	83 c4 10             	add    $0x10,%esp
c0109ac9:	b8 00 00 00 00       	mov    $0x0,%eax
c0109ace:	c9                   	leave  
c0109acf:	c3                   	ret    

c0109ad0 <appendToDoubleLinkList>:
c0109ad0:	55                   	push   %ebp
c0109ad1:	89 e5                	mov    %esp,%ebp
c0109ad3:	83 ec 18             	sub    $0x18,%esp
c0109ad6:	83 ec 08             	sub    $0x8,%esp
c0109ad9:	ff 75 0c             	pushl  0xc(%ebp)
c0109adc:	ff 75 08             	pushl  0x8(%ebp)
c0109adf:	e8 10 ff ff ff       	call   c01099f4 <findElementInList>
c0109ae4:	83 c4 10             	add    $0x10,%esp
c0109ae7:	3c 01                	cmp    $0x1,%al
c0109ae9:	0f 84 c2 00 00 00    	je     c0109bb1 <appendToDoubleLinkList+0xe1>
c0109aef:	e8 26 cf ff ff       	call   c0106a1a <intr_disable>
c0109af4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109af7:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0109afb:	75 1c                	jne    c0109b19 <appendToDoubleLinkList+0x49>
c0109afd:	68 9e 00 00 00       	push   $0x9e
c0109b02:	68 c5 ab 10 c0       	push   $0xc010abc5
c0109b07:	68 c5 ab 10 c0       	push   $0xc010abc5
c0109b0c:	68 d8 ab 10 c0       	push   $0xc010abd8
c0109b11:	e8 41 e9 ff ff       	call   c0108457 <assertion_failure>
c0109b16:	83 c4 10             	add    $0x10,%esp
c0109b19:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0109b1d:	75 1c                	jne    c0109b3b <appendToDoubleLinkList+0x6b>
c0109b1f:	68 9f 00 00 00       	push   $0x9f
c0109b24:	68 c5 ab 10 c0       	push   $0xc010abc5
c0109b29:	68 c5 ab 10 c0       	push   $0xc010abc5
c0109b2e:	68 e4 ab 10 c0       	push   $0xc010abe4
c0109b33:	e8 1f e9 ff ff       	call   c0108457 <assertion_failure>
c0109b38:	83 c4 10             	add    $0x10,%esp
c0109b3b:	83 ec 08             	sub    $0x8,%esp
c0109b3e:	ff 75 0c             	pushl  0xc(%ebp)
c0109b41:	ff 75 08             	pushl  0x8(%ebp)
c0109b44:	e8 ab fe ff ff       	call   c01099f4 <findElementInList>
c0109b49:	83 c4 10             	add    $0x10,%esp
c0109b4c:	3c 01                	cmp    $0x1,%al
c0109b4e:	74 64                	je     c0109bb4 <appendToDoubleLinkList+0xe4>
c0109b50:	8b 45 0c             	mov    0xc(%ebp),%eax
c0109b53:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109b56:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109b59:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0109b60:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109b63:	8b 50 04             	mov    0x4(%eax),%edx
c0109b66:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109b69:	89 10                	mov    %edx,(%eax)
c0109b6b:	8b 45 08             	mov    0x8(%ebp),%eax
c0109b6e:	8b 50 08             	mov    0x8(%eax),%edx
c0109b71:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109b74:	89 10                	mov    %edx,(%eax)
c0109b76:	8b 45 08             	mov    0x8(%ebp),%eax
c0109b79:	8b 40 08             	mov    0x8(%eax),%eax
c0109b7c:	85 c0                	test   %eax,%eax
c0109b7e:	74 0c                	je     c0109b8c <appendToDoubleLinkList+0xbc>
c0109b80:	8b 45 08             	mov    0x8(%ebp),%eax
c0109b83:	8b 40 08             	mov    0x8(%eax),%eax
c0109b86:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0109b89:	89 50 04             	mov    %edx,0x4(%eax)
c0109b8c:	8b 45 08             	mov    0x8(%ebp),%eax
c0109b8f:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0109b92:	89 50 08             	mov    %edx,0x8(%eax)
c0109b95:	8b 45 08             	mov    0x8(%ebp),%eax
c0109b98:	8d 50 08             	lea    0x8(%eax),%edx
c0109b9b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109b9e:	89 50 04             	mov    %edx,0x4(%eax)
c0109ba1:	83 ec 0c             	sub    $0xc,%esp
c0109ba4:	ff 75 f4             	pushl  -0xc(%ebp)
c0109ba7:	e8 97 ce ff ff       	call   c0106a43 <intr_set_status>
c0109bac:	83 c4 10             	add    $0x10,%esp
c0109baf:	eb 04                	jmp    c0109bb5 <appendToDoubleLinkList+0xe5>
c0109bb1:	90                   	nop
c0109bb2:	eb 01                	jmp    c0109bb5 <appendToDoubleLinkList+0xe5>
c0109bb4:	90                   	nop
c0109bb5:	c9                   	leave  
c0109bb6:	c3                   	ret    

c0109bb7 <insertToDoubleLinkList>:
c0109bb7:	55                   	push   %ebp
c0109bb8:	89 e5                	mov    %esp,%ebp
c0109bba:	83 ec 18             	sub    $0x18,%esp
c0109bbd:	83 ec 08             	sub    $0x8,%esp
c0109bc0:	ff 75 0c             	pushl  0xc(%ebp)
c0109bc3:	ff 75 08             	pushl  0x8(%ebp)
c0109bc6:	e8 29 fe ff ff       	call   c01099f4 <findElementInList>
c0109bcb:	83 c4 10             	add    $0x10,%esp
c0109bce:	3c 01                	cmp    $0x1,%al
c0109bd0:	74 65                	je     c0109c37 <insertToDoubleLinkList+0x80>
c0109bd2:	e8 43 ce ff ff       	call   c0106a1a <intr_disable>
c0109bd7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109bda:	8b 45 0c             	mov    0xc(%ebp),%eax
c0109bdd:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109be0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109be3:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0109bea:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109bed:	8b 50 04             	mov    0x4(%eax),%edx
c0109bf0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109bf3:	89 10                	mov    %edx,(%eax)
c0109bf5:	8b 45 08             	mov    0x8(%ebp),%eax
c0109bf8:	8b 50 04             	mov    0x4(%eax),%edx
c0109bfb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109bfe:	89 50 04             	mov    %edx,0x4(%eax)
c0109c01:	8b 45 08             	mov    0x8(%ebp),%eax
c0109c04:	8b 40 04             	mov    0x4(%eax),%eax
c0109c07:	85 c0                	test   %eax,%eax
c0109c09:	74 0b                	je     c0109c16 <insertToDoubleLinkList+0x5f>
c0109c0b:	8b 45 08             	mov    0x8(%ebp),%eax
c0109c0e:	8b 40 04             	mov    0x4(%eax),%eax
c0109c11:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0109c14:	89 10                	mov    %edx,(%eax)
c0109c16:	8b 45 08             	mov    0x8(%ebp),%eax
c0109c19:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0109c1c:	89 50 04             	mov    %edx,0x4(%eax)
c0109c1f:	8b 55 08             	mov    0x8(%ebp),%edx
c0109c22:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109c25:	89 10                	mov    %edx,(%eax)
c0109c27:	83 ec 0c             	sub    $0xc,%esp
c0109c2a:	ff 75 f4             	pushl  -0xc(%ebp)
c0109c2d:	e8 11 ce ff ff       	call   c0106a43 <intr_set_status>
c0109c32:	83 c4 10             	add    $0x10,%esp
c0109c35:	eb 01                	jmp    c0109c38 <insertToDoubleLinkList+0x81>
c0109c37:	90                   	nop
c0109c38:	c9                   	leave  
c0109c39:	c3                   	ret    

c0109c3a <popFromDoubleLinkList>:
c0109c3a:	55                   	push   %ebp
c0109c3b:	89 e5                	mov    %esp,%ebp
c0109c3d:	83 ec 18             	sub    $0x18,%esp
c0109c40:	e8 d5 cd ff ff       	call   c0106a1a <intr_disable>
c0109c45:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109c48:	83 ec 0c             	sub    $0xc,%esp
c0109c4b:	ff 75 08             	pushl  0x8(%ebp)
c0109c4e:	e8 80 fd ff ff       	call   c01099d3 <isListEmpty>
c0109c53:	83 c4 10             	add    $0x10,%esp
c0109c56:	3c 01                	cmp    $0x1,%al
c0109c58:	75 07                	jne    c0109c61 <popFromDoubleLinkList+0x27>
c0109c5a:	b8 00 00 00 00       	mov    $0x0,%eax
c0109c5f:	eb 6b                	jmp    c0109ccc <popFromDoubleLinkList+0x92>
c0109c61:	8b 45 08             	mov    0x8(%ebp),%eax
c0109c64:	8b 40 08             	mov    0x8(%eax),%eax
c0109c67:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109c6a:	8b 45 08             	mov    0x8(%ebp),%eax
c0109c6d:	8b 40 08             	mov    0x8(%eax),%eax
c0109c70:	85 c0                	test   %eax,%eax
c0109c72:	75 07                	jne    c0109c7b <popFromDoubleLinkList+0x41>
c0109c74:	b8 00 00 00 00       	mov    $0x0,%eax
c0109c79:	eb 51                	jmp    c0109ccc <popFromDoubleLinkList+0x92>
c0109c7b:	8b 45 08             	mov    0x8(%ebp),%eax
c0109c7e:	8b 40 08             	mov    0x8(%eax),%eax
c0109c81:	8b 00                	mov    (%eax),%eax
c0109c83:	85 c0                	test   %eax,%eax
c0109c85:	74 11                	je     c0109c98 <popFromDoubleLinkList+0x5e>
c0109c87:	8b 45 08             	mov    0x8(%ebp),%eax
c0109c8a:	8b 40 08             	mov    0x8(%eax),%eax
c0109c8d:	8b 00                	mov    (%eax),%eax
c0109c8f:	8b 55 08             	mov    0x8(%ebp),%edx
c0109c92:	83 c2 08             	add    $0x8,%edx
c0109c95:	89 50 04             	mov    %edx,0x4(%eax)
c0109c98:	8b 45 08             	mov    0x8(%ebp),%eax
c0109c9b:	8b 40 08             	mov    0x8(%eax),%eax
c0109c9e:	8b 10                	mov    (%eax),%edx
c0109ca0:	8b 45 08             	mov    0x8(%ebp),%eax
c0109ca3:	89 50 08             	mov    %edx,0x8(%eax)
c0109ca6:	83 ec 0c             	sub    $0xc,%esp
c0109ca9:	ff 75 f4             	pushl  -0xc(%ebp)
c0109cac:	e8 92 cd ff ff       	call   c0106a43 <intr_set_status>
c0109cb1:	83 c4 10             	add    $0x10,%esp
c0109cb4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109cb7:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0109cbe:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109cc1:	8b 50 04             	mov    0x4(%eax),%edx
c0109cc4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109cc7:	89 10                	mov    %edx,(%eax)
c0109cc9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109ccc:	c9                   	leave  
c0109ccd:	c3                   	ret    

c0109cce <kernel_thread>:
c0109cce:	55                   	push   %ebp
c0109ccf:	89 e5                	mov    %esp,%ebp
c0109cd1:	83 ec 08             	sub    $0x8,%esp
c0109cd4:	fb                   	sti    
c0109cd5:	83 ec 0c             	sub    $0xc,%esp
c0109cd8:	ff 75 0c             	pushl  0xc(%ebp)
c0109cdb:	8b 45 08             	mov    0x8(%ebp),%eax
c0109cde:	ff d0                	call   *%eax
c0109ce0:	83 c4 10             	add    $0x10,%esp
c0109ce3:	90                   	nop
c0109ce4:	c9                   	leave  
c0109ce5:	c3                   	ret    

c0109ce6 <thread_init>:
c0109ce6:	55                   	push   %ebp
c0109ce7:	89 e5                	mov    %esp,%ebp
c0109ce9:	83 ec 18             	sub    $0x18,%esp
c0109cec:	83 ec 08             	sub    $0x8,%esp
c0109cef:	6a 00                	push   $0x0
c0109cf1:	6a 01                	push   $0x1
c0109cf3:	e8 9f c2 ff ff       	call   c0105f97 <alloc_memory>
c0109cf8:	83 c4 10             	add    $0x10,%esp
c0109cfb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109cfe:	83 ec 04             	sub    $0x4,%esp
c0109d01:	68 00 10 00 00       	push   $0x1000
c0109d06:	6a 00                	push   $0x0
c0109d08:	ff 75 f4             	pushl  -0xc(%ebp)
c0109d0b:	e8 0f 0f 00 00       	call   c010ac1f <Memset>
c0109d10:	83 c4 10             	add    $0x10,%esp
c0109d13:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109d16:	05 00 10 00 00       	add    $0x1000,%eax
c0109d1b:	89 c2                	mov    %eax,%edx
c0109d1d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109d20:	89 10                	mov    %edx,(%eax)
c0109d22:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109d25:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0109d2c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109d2f:	c7 80 64 02 00 00 ff 	movl   $0xffffffff,0x264(%eax)
c0109d36:	ff ff ff 
c0109d39:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109d3c:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c0109d43:	00 00 00 
c0109d46:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109d49:	8b 90 5c 02 00 00    	mov    0x25c(%eax),%edx
c0109d4f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109d52:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c0109d58:	a1 90 f7 10 c0       	mov    0xc010f790,%eax
c0109d5d:	83 c0 01             	add    $0x1,%eax
c0109d60:	a3 90 f7 10 c0       	mov    %eax,0xc010f790
c0109d65:	8b 15 90 f7 10 c0    	mov    0xc010f790,%edx
c0109d6b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109d6e:	89 90 24 01 00 00    	mov    %edx,0x124(%eax)
c0109d74:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109d77:	c7 80 28 01 00 00 0f 	movl   $0xf,0x128(%eax)
c0109d7e:	00 00 00 
c0109d81:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109d84:	c7 80 b0 02 00 00 e0 	movl   $0x99abcde0,0x2b0(%eax)
c0109d8b:	cd ab 99 
c0109d8e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109d91:	c9                   	leave  
c0109d92:	c3                   	ret    

c0109d93 <thread_create>:
c0109d93:	55                   	push   %ebp
c0109d94:	89 e5                	mov    %esp,%ebp
c0109d96:	83 ec 10             	sub    $0x10,%esp
c0109d99:	c7 45 fc 44 00 00 00 	movl   $0x44,-0x4(%ebp)
c0109da0:	c7 45 f8 2c 00 00 00 	movl   $0x2c,-0x8(%ebp)
c0109da7:	8b 45 08             	mov    0x8(%ebp),%eax
c0109daa:	8b 00                	mov    (%eax),%eax
c0109dac:	2b 45 fc             	sub    -0x4(%ebp),%eax
c0109daf:	89 c2                	mov    %eax,%edx
c0109db1:	8b 45 08             	mov    0x8(%ebp),%eax
c0109db4:	89 10                	mov    %edx,(%eax)
c0109db6:	8b 45 08             	mov    0x8(%ebp),%eax
c0109db9:	8b 00                	mov    (%eax),%eax
c0109dbb:	2b 45 f8             	sub    -0x8(%ebp),%eax
c0109dbe:	89 c2                	mov    %eax,%edx
c0109dc0:	8b 45 08             	mov    0x8(%ebp),%eax
c0109dc3:	89 10                	mov    %edx,(%eax)
c0109dc5:	90                   	nop
c0109dc6:	c9                   	leave  
c0109dc7:	c3                   	ret    

c0109dc8 <thread_start>:
c0109dc8:	55                   	push   %ebp
c0109dc9:	89 e5                	mov    %esp,%ebp
c0109dcb:	83 ec 18             	sub    $0x18,%esp
c0109dce:	e8 13 ff ff ff       	call   c0109ce6 <thread_init>
c0109dd3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109dd6:	83 ec 0c             	sub    $0xc,%esp
c0109dd9:	ff 75 f4             	pushl  -0xc(%ebp)
c0109ddc:	e8 b2 ff ff ff       	call   c0109d93 <thread_create>
c0109de1:	83 c4 10             	add    $0x10,%esp
c0109de4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109de7:	05 34 01 00 00       	add    $0x134,%eax
c0109dec:	83 ec 08             	sub    $0x8,%esp
c0109def:	ff 75 10             	pushl  0x10(%ebp)
c0109df2:	50                   	push   %eax
c0109df3:	e8 46 0e 00 00       	call   c010ac3e <Strcpy>
c0109df8:	83 c4 10             	add    $0x10,%esp
c0109dfb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109dfe:	8b 00                	mov    (%eax),%eax
c0109e00:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109e03:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109e06:	c7 40 10 ce 9c 10 c0 	movl   $0xc0109cce,0x10(%eax)
c0109e0d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109e10:	8b 55 08             	mov    0x8(%ebp),%edx
c0109e13:	89 50 18             	mov    %edx,0x18(%eax)
c0109e16:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109e19:	8b 55 0c             	mov    0xc(%ebp),%edx
c0109e1c:	89 50 1c             	mov    %edx,0x1c(%eax)
c0109e1f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109e22:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0109e28:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109e2b:	8b 10                	mov    (%eax),%edx
c0109e2d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109e30:	89 50 04             	mov    %edx,0x4(%eax)
c0109e33:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109e36:	8b 50 04             	mov    0x4(%eax),%edx
c0109e39:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109e3c:	89 50 08             	mov    %edx,0x8(%eax)
c0109e3f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109e42:	8b 50 08             	mov    0x8(%eax),%edx
c0109e45:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109e48:	89 50 0c             	mov    %edx,0xc(%eax)
c0109e4b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109e4e:	05 00 01 00 00       	add    $0x100,%eax
c0109e53:	83 ec 08             	sub    $0x8,%esp
c0109e56:	50                   	push   %eax
c0109e57:	68 ec fd 10 c0       	push   $0xc010fdec
c0109e5c:	e8 6f fc ff ff       	call   c0109ad0 <appendToDoubleLinkList>
c0109e61:	83 c4 10             	add    $0x10,%esp
c0109e64:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109e67:	05 08 01 00 00       	add    $0x108,%eax
c0109e6c:	83 ec 08             	sub    $0x8,%esp
c0109e6f:	50                   	push   %eax
c0109e70:	68 04 0f 11 c0       	push   $0xc0110f04
c0109e75:	e8 56 fc ff ff       	call   c0109ad0 <appendToDoubleLinkList>
c0109e7a:	83 c4 10             	add    $0x10,%esp
c0109e7d:	90                   	nop
c0109e7e:	c9                   	leave  
c0109e7f:	c3                   	ret    
