
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
c010014b:	e8 55 6e 00 00       	call   c0106fa5 <exception_handler>
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
c0100168:	e8 38 6e 00 00       	call   c0106fa5 <exception_handler>
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
c010020a:	e8 91 10 00 00       	call   c01012a0 <hd_handler>
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
c01002e9:	e8 51 6b 00 00       	call   c0106e3f <disp_int>
c01002ee:	83 c4 04             	add    $0x4,%esp
c01002f1:	58                   	pop    %eax
c01002f2:	5a                   	pop    %edx
c01002f3:	52                   	push   %edx
c01002f4:	50                   	push   %eax
c01002f5:	e8 45 6b 00 00       	call   c0106e3f <disp_int>
c01002fa:	58                   	pop    %eax
c01002fb:	5a                   	pop    %edx
c01002fc:	52                   	push   %edx
c01002fd:	50                   	push   %eax
c01002fe:	ff 35 a8 f7 10 c0    	pushl  0xc010f7a8
c0100304:	e8 36 6b 00 00       	call   c0106e3f <disp_int>
c0100309:	83 c4 04             	add    $0x4,%esp
c010030c:	58                   	pop    %eax
c010030d:	5a                   	pop    %edx
c010030e:	52                   	push   %edx
c010030f:	50                   	push   %eax
c0100310:	ff 72 ec             	pushl  -0x14(%edx)
c0100313:	e8 27 6b 00 00       	call   c0106e3f <disp_int>
c0100318:	83 c4 04             	add    $0x4,%esp
c010031b:	58                   	pop    %eax
c010031c:	5a                   	pop    %edx
c010031d:	52                   	push   %edx
c010031e:	50                   	push   %eax
c010031f:	ff 70 ec             	pushl  -0x14(%eax)
c0100322:	e8 18 6b 00 00       	call   c0106e3f <disp_int>
c0100327:	83 c4 04             	add    $0x4,%esp
c010032a:	58                   	pop    %eax
c010032b:	5a                   	pop    %edx
c010032c:	52                   	push   %edx
c010032d:	50                   	push   %eax
c010032e:	ff 35 c0 fb 10 c0    	pushl  0xc010fbc0
c0100334:	e8 06 6b 00 00       	call   c0106e3f <disp_int>
c0100339:	83 c4 04             	add    $0x4,%esp
c010033c:	58                   	pop    %eax
c010033d:	5a                   	pop    %edx
c010033e:	52                   	push   %edx
c010033f:	50                   	push   %eax
c0100340:	68 60 f7 10 c0       	push   $0xc010f760
c0100345:	e8 f5 6a 00 00       	call   c0106e3f <disp_int>
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
c01003cd:	e8 ce 96 00 00       	call   c0109aa0 <appendToDoubleLinkList>
c01003d2:	83 c4 10             	add    $0x10,%esp
c01003d5:	a1 e0 0e 11 c0       	mov    0xc0110ee0,%eax
c01003da:	05 08 01 00 00       	add    $0x108,%eax
c01003df:	83 ec 08             	sub    $0x8,%esp
c01003e2:	50                   	push   %eax
c01003e3:	68 ec fd 10 c0       	push   $0xc010fdec
c01003e8:	e8 b3 96 00 00       	call   c0109aa0 <appendToDoubleLinkList>
c01003ed:	83 c4 10             	add    $0x10,%esp
c01003f0:	6a 00                	push   $0x0
c01003f2:	68 60 9e 10 c0       	push   $0xc0109e60
c01003f7:	68 67 9e 10 c0       	push   $0xc0109e67
c01003fc:	68 7c 4f 10 c0       	push   $0xc0104f7c
c0100401:	e8 e9 93 00 00       	call   c01097ef <process_execute>
c0100406:	83 c4 10             	add    $0x10,%esp
c0100409:	6a 00                	push   $0x0
c010040b:	68 70 9e 10 c0       	push   $0xc0109e70
c0100410:	68 78 9e 10 c0       	push   $0xc0109e78
c0100415:	68 a9 14 10 c0       	push   $0xc01014a9
c010041a:	e8 d0 93 00 00       	call   c01097ef <process_execute>
c010041f:	83 c4 10             	add    $0x10,%esp
c0100422:	6a 00                	push   $0x0
c0100424:	68 81 9e 10 c0       	push   $0xc0109e81
c0100429:	68 88 9e 10 c0       	push   $0xc0109e88
c010042e:	68 18 06 10 c0       	push   $0xc0100618
c0100433:	e8 b7 93 00 00       	call   c01097ef <process_execute>
c0100438:	83 c4 10             	add    $0x10,%esp
c010043b:	6a 00                	push   $0x0
c010043d:	68 91 9e 10 c0       	push   $0xc0109e91
c0100442:	68 99 9e 10 c0       	push   $0xc0109e99
c0100447:	68 1c 44 10 c0       	push   $0xc010441c
c010044c:	e8 9e 93 00 00       	call   c01097ef <process_execute>
c0100451:	83 c4 10             	add    $0x10,%esp
c0100454:	6a 01                	push   $0x1
c0100456:	68 a3 9e 10 c0       	push   $0xc0109ea3
c010045b:	68 ad 9e 10 c0       	push   $0xc0109ead
c0100460:	68 f6 05 10 c0       	push   $0xc01005f6
c0100465:	e8 85 93 00 00       	call   c01097ef <process_execute>
c010046a:	83 c4 10             	add    $0x10,%esp
c010046d:	83 ec 0c             	sub    $0xc,%esp
c0100470:	68 ba 9e 10 c0       	push   $0xc0109eba
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
c01004b1:	68 c4 9e 10 c0       	push   $0xc0109ec4
c01004b6:	e8 d1 fb ff ff       	call   c010008c <disp_str>
c01004bb:	83 c4 10             	add    $0x10,%esp
c01004be:	e8 cc 6e 00 00       	call   c010738f <init_keyboard>
c01004c3:	83 ec 0c             	sub    $0xc,%esp
c01004c6:	68 00 00 00 04       	push   $0x4000000
c01004cb:	e8 93 63 00 00       	call   c0106863 <init_memory>
c01004d0:	83 c4 10             	add    $0x10,%esp
c01004d3:	83 ec 0c             	sub    $0xc,%esp
c01004d6:	68 ec fd 10 c0       	push   $0xc010fdec
c01004db:	e8 95 94 00 00       	call   c0109975 <initDoubleLinkList>
c01004e0:	83 c4 10             	add    $0x10,%esp
c01004e3:	83 ec 0c             	sub    $0xc,%esp
c01004e6:	68 04 0f 11 c0       	push   $0xc0110f04
c01004eb:	e8 85 94 00 00       	call   c0109975 <initDoubleLinkList>
c01004f0:	83 c4 10             	add    $0x10,%esp
c01004f3:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c01004fa:	00 00 00 
c01004fd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100504:	eb 14                	jmp    c010051a <init+0x9a>
c0100506:	83 ec 0c             	sub    $0xc,%esp
c0100509:	68 ca 9e 10 c0       	push   $0xc0109eca
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
c010055e:	68 cb 9e 10 c0       	push   $0xc0109ecb
c0100563:	e8 24 fb ff ff       	call   c010008c <disp_str>
c0100568:	83 c4 10             	add    $0x10,%esp
c010056b:	83 ec 0c             	sub    $0xc,%esp
c010056e:	68 d4 9e 10 c0       	push   $0xc0109ed4
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
c01005ab:	68 d6 9e 10 c0       	push   $0xc0109ed6
c01005b0:	e8 d7 fa ff ff       	call   c010008c <disp_str>
c01005b5:	83 c4 10             	add    $0x10,%esp
c01005b8:	83 ec 0c             	sub    $0xc,%esp
c01005bb:	68 d4 9e 10 c0       	push   $0xc0109ed4
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
c01005f9:	83 ec 08             	sub    $0x8,%esp
c01005fc:	83 ec 0c             	sub    $0xc,%esp
c01005ff:	68 df 9e 10 c0       	push   $0xc0109edf
c0100604:	e8 83 fa ff ff       	call   c010008c <disp_str>
c0100609:	83 c4 10             	add    $0x10,%esp
c010060c:	e8 92 72 00 00       	call   c01078a3 <wait_exit>
c0100611:	e8 5b 73 00 00       	call   c0107971 <INIT_fork>
c0100616:	eb fe                	jmp    c0100616 <user_proc_a+0x20>

c0100618 <TaskHD>:
c0100618:	55                   	push   %ebp
c0100619:	89 e5                	mov    %esp,%ebp
c010061b:	83 ec 18             	sub    $0x18,%esp
c010061e:	e8 74 fd ff ff       	call   c0100397 <get_running_thread_pcb>
c0100623:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0100626:	e8 32 00 00 00       	call   c010065d <init_hd>
c010062b:	83 ec 0c             	sub    $0xc,%esp
c010062e:	6a 7c                	push   $0x7c
c0100630:	e8 47 0e 00 00       	call   c010147c <sys_malloc>
c0100635:	83 c4 10             	add    $0x10,%esp
c0100638:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010063b:	83 ec 04             	sub    $0x4,%esp
c010063e:	6a 7c                	push   $0x7c
c0100640:	6a 00                	push   $0x0
c0100642:	ff 75 f0             	pushl  -0x10(%ebp)
c0100645:	e8 d5 a5 00 00       	call   c010ac1f <Memset>
c010064a:	83 c4 10             	add    $0x10,%esp
c010064d:	83 ec 0c             	sub    $0xc,%esp
c0100650:	ff 75 f0             	pushl  -0x10(%ebp)
c0100653:	e8 1f 00 00 00       	call   c0100677 <hd_handle>
c0100658:	83 c4 10             	add    $0x10,%esp
c010065b:	eb de                	jmp    c010063b <TaskHD+0x23>

c010065d <init_hd>:
c010065d:	55                   	push   %ebp
c010065e:	89 e5                	mov    %esp,%ebp
c0100660:	83 ec 18             	sub    $0x18,%esp
c0100663:	c7 45 f4 75 04 00 00 	movl   $0x475,-0xc(%ebp)
c010066a:	e8 e4 fc ff ff       	call   c0100353 <enable_8259A_casecade_irq>
c010066f:	e8 f3 fc ff ff       	call   c0100367 <enable_8259A_slave_winchester_irq>
c0100674:	90                   	nop
c0100675:	c9                   	leave  
c0100676:	c3                   	ret    

c0100677 <hd_handle>:
c0100677:	55                   	push   %ebp
c0100678:	89 e5                	mov    %esp,%ebp
c010067a:	83 ec 18             	sub    $0x18,%esp
c010067d:	83 ec 04             	sub    $0x4,%esp
c0100680:	6a 12                	push   $0x12
c0100682:	ff 75 08             	pushl  0x8(%ebp)
c0100685:	6a 02                	push   $0x2
c0100687:	e8 c0 87 00 00       	call   c0108e4c <send_rec>
c010068c:	83 c4 10             	add    $0x10,%esp
c010068f:	8b 45 08             	mov    0x8(%ebp),%eax
c0100692:	8b 40 78             	mov    0x78(%eax),%eax
c0100695:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0100698:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010069c:	0f 84 d4 00 00 00    	je     c0100776 <hd_handle+0xff>
c01006a2:	8b 45 08             	mov    0x8(%ebp),%eax
c01006a5:	8b 00                	mov    (%eax),%eax
c01006a7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01006aa:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c01006ae:	74 28                	je     c01006d8 <hd_handle+0x61>
c01006b0:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c01006b4:	74 22                	je     c01006d8 <hd_handle+0x61>
c01006b6:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c01006ba:	74 1c                	je     c01006d8 <hd_handle+0x61>
c01006bc:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c01006c0:	74 16                	je     c01006d8 <hd_handle+0x61>
c01006c2:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c01006c9:	74 0d                	je     c01006d8 <hd_handle+0x61>
c01006cb:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c01006d2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01006d5:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01006d8:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c01006dc:	74 34                	je     c0100712 <hd_handle+0x9b>
c01006de:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c01006e2:	74 2e                	je     c0100712 <hd_handle+0x9b>
c01006e4:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c01006e8:	74 28                	je     c0100712 <hd_handle+0x9b>
c01006ea:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c01006ee:	74 22                	je     c0100712 <hd_handle+0x9b>
c01006f0:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c01006f7:	74 19                	je     c0100712 <hd_handle+0x9b>
c01006f9:	6a 6d                	push   $0x6d
c01006fb:	68 f4 9e 10 c0       	push   $0xc0109ef4
c0100700:	68 f4 9e 10 c0       	push   $0xc0109ef4
c0100705:	68 fc 9e 10 c0       	push   $0xc0109efc
c010070a:	e8 20 7d 00 00       	call   c010842f <assertion_failure>
c010070f:	83 c4 10             	add    $0x10,%esp
c0100712:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c0100716:	74 2c                	je     c0100744 <hd_handle+0xcd>
c0100718:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c010071c:	77 0e                	ja     c010072c <hd_handle+0xb5>
c010071e:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c0100722:	74 19                	je     c010073d <hd_handle+0xc6>
c0100724:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c0100728:	74 1a                	je     c0100744 <hd_handle+0xcd>
c010072a:	eb 37                	jmp    c0100763 <hd_handle+0xec>
c010072c:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c0100730:	74 22                	je     c0100754 <hd_handle+0xdd>
c0100732:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c0100739:	74 3e                	je     c0100779 <hd_handle+0x102>
c010073b:	eb 26                	jmp    c0100763 <hd_handle+0xec>
c010073d:	e8 e6 06 00 00       	call   c0100e28 <hd_open>
c0100742:	eb 36                	jmp    c010077a <hd_handle+0x103>
c0100744:	83 ec 0c             	sub    $0xc,%esp
c0100747:	ff 75 08             	pushl  0x8(%ebp)
c010074a:	e8 b2 08 00 00       	call   c0101001 <hd_rdwt>
c010074f:	83 c4 10             	add    $0x10,%esp
c0100752:	eb 26                	jmp    c010077a <hd_handle+0x103>
c0100754:	83 ec 0c             	sub    $0xc,%esp
c0100757:	6a 00                	push   $0x0
c0100759:	e8 71 07 00 00       	call   c0100ecf <get_hd_ioctl>
c010075e:	83 c4 10             	add    $0x10,%esp
c0100761:	eb 17                	jmp    c010077a <hd_handle+0x103>
c0100763:	83 ec 0c             	sub    $0xc,%esp
c0100766:	68 56 9f 10 c0       	push   $0xc0109f56
c010076b:	e8 7b 7c 00 00       	call   c01083eb <spin>
c0100770:	83 c4 10             	add    $0x10,%esp
c0100773:	90                   	nop
c0100774:	eb 04                	jmp    c010077a <hd_handle+0x103>
c0100776:	90                   	nop
c0100777:	eb 01                	jmp    c010077a <hd_handle+0x103>
c0100779:	90                   	nop
c010077a:	c9                   	leave  
c010077b:	c3                   	ret    

c010077c <hd_cmd_out>:
c010077c:	55                   	push   %ebp
c010077d:	89 e5                	mov    %esp,%ebp
c010077f:	83 ec 08             	sub    $0x8,%esp
c0100782:	83 ec 04             	sub    $0x4,%esp
c0100785:	68 18 73 01 00       	push   $0x17318
c010078a:	6a 00                	push   $0x0
c010078c:	68 80 00 00 00       	push   $0x80
c0100791:	e8 36 0b 00 00       	call   c01012cc <waitfor>
c0100796:	83 c4 10             	add    $0x10,%esp
c0100799:	85 c0                	test   %eax,%eax
c010079b:	75 10                	jne    c01007ad <hd_cmd_out+0x31>
c010079d:	83 ec 0c             	sub    $0xc,%esp
c01007a0:	68 68 9f 10 c0       	push   $0xc0109f68
c01007a5:	e8 67 7c 00 00       	call   c0108411 <panic>
c01007aa:	83 c4 10             	add    $0x10,%esp
c01007ad:	83 ec 08             	sub    $0x8,%esp
c01007b0:	6a 00                	push   $0x0
c01007b2:	68 f6 03 00 00       	push   $0x3f6
c01007b7:	e8 dd fa ff ff       	call   c0100299 <out_byte>
c01007bc:	83 c4 10             	add    $0x10,%esp
c01007bf:	8b 45 08             	mov    0x8(%ebp),%eax
c01007c2:	0f b6 00             	movzbl (%eax),%eax
c01007c5:	0f b6 c0             	movzbl %al,%eax
c01007c8:	83 ec 08             	sub    $0x8,%esp
c01007cb:	50                   	push   %eax
c01007cc:	68 f1 01 00 00       	push   $0x1f1
c01007d1:	e8 c3 fa ff ff       	call   c0100299 <out_byte>
c01007d6:	83 c4 10             	add    $0x10,%esp
c01007d9:	8b 45 08             	mov    0x8(%ebp),%eax
c01007dc:	0f b6 40 01          	movzbl 0x1(%eax),%eax
c01007e0:	0f b6 c0             	movzbl %al,%eax
c01007e3:	83 ec 08             	sub    $0x8,%esp
c01007e6:	50                   	push   %eax
c01007e7:	68 f2 01 00 00       	push   $0x1f2
c01007ec:	e8 a8 fa ff ff       	call   c0100299 <out_byte>
c01007f1:	83 c4 10             	add    $0x10,%esp
c01007f4:	8b 45 08             	mov    0x8(%ebp),%eax
c01007f7:	0f b6 40 02          	movzbl 0x2(%eax),%eax
c01007fb:	0f b6 c0             	movzbl %al,%eax
c01007fe:	83 ec 08             	sub    $0x8,%esp
c0100801:	50                   	push   %eax
c0100802:	68 f3 01 00 00       	push   $0x1f3
c0100807:	e8 8d fa ff ff       	call   c0100299 <out_byte>
c010080c:	83 c4 10             	add    $0x10,%esp
c010080f:	8b 45 08             	mov    0x8(%ebp),%eax
c0100812:	0f b6 40 03          	movzbl 0x3(%eax),%eax
c0100816:	0f b6 c0             	movzbl %al,%eax
c0100819:	83 ec 08             	sub    $0x8,%esp
c010081c:	50                   	push   %eax
c010081d:	68 f4 01 00 00       	push   $0x1f4
c0100822:	e8 72 fa ff ff       	call   c0100299 <out_byte>
c0100827:	83 c4 10             	add    $0x10,%esp
c010082a:	8b 45 08             	mov    0x8(%ebp),%eax
c010082d:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0100831:	0f b6 c0             	movzbl %al,%eax
c0100834:	83 ec 08             	sub    $0x8,%esp
c0100837:	50                   	push   %eax
c0100838:	68 f5 01 00 00       	push   $0x1f5
c010083d:	e8 57 fa ff ff       	call   c0100299 <out_byte>
c0100842:	83 c4 10             	add    $0x10,%esp
c0100845:	8b 45 08             	mov    0x8(%ebp),%eax
c0100848:	0f b6 40 05          	movzbl 0x5(%eax),%eax
c010084c:	0f b6 c0             	movzbl %al,%eax
c010084f:	83 ec 08             	sub    $0x8,%esp
c0100852:	50                   	push   %eax
c0100853:	68 f6 01 00 00       	push   $0x1f6
c0100858:	e8 3c fa ff ff       	call   c0100299 <out_byte>
c010085d:	83 c4 10             	add    $0x10,%esp
c0100860:	8b 45 08             	mov    0x8(%ebp),%eax
c0100863:	0f b6 40 06          	movzbl 0x6(%eax),%eax
c0100867:	0f b6 c0             	movzbl %al,%eax
c010086a:	83 ec 08             	sub    $0x8,%esp
c010086d:	50                   	push   %eax
c010086e:	68 f7 01 00 00       	push   $0x1f7
c0100873:	e8 21 fa ff ff       	call   c0100299 <out_byte>
c0100878:	83 c4 10             	add    $0x10,%esp
c010087b:	90                   	nop
c010087c:	c9                   	leave  
c010087d:	c3                   	ret    

c010087e <hd_identify>:
c010087e:	55                   	push   %ebp
c010087f:	89 e5                	mov    %esp,%ebp
c0100881:	53                   	push   %ebx
c0100882:	83 ec 24             	sub    $0x24,%esp
c0100885:	89 e0                	mov    %esp,%eax
c0100887:	89 c3                	mov    %eax,%ebx
c0100889:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
c010088d:	c6 45 e6 01          	movb   $0x1,-0x1a(%ebp)
c0100891:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
c0100895:	c6 45 e8 00          	movb   $0x0,-0x18(%ebp)
c0100899:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c010089d:	8b 45 08             	mov    0x8(%ebp),%eax
c01008a0:	c1 e0 04             	shl    $0x4,%eax
c01008a3:	83 c8 e0             	or     $0xffffffe0,%eax
c01008a6:	88 45 ea             	mov    %al,-0x16(%ebp)
c01008a9:	c6 45 eb ec          	movb   $0xec,-0x15(%ebp)
c01008ad:	83 ec 0c             	sub    $0xc,%esp
c01008b0:	8d 45 e5             	lea    -0x1b(%ebp),%eax
c01008b3:	50                   	push   %eax
c01008b4:	e8 c3 fe ff ff       	call   c010077c <hd_cmd_out>
c01008b9:	83 c4 10             	add    $0x10,%esp
c01008bc:	e8 f0 06 00 00       	call   c0100fb1 <interrupt_wait>
c01008c1:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c01008c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01008cb:	8d 50 ff             	lea    -0x1(%eax),%edx
c01008ce:	89 55 f0             	mov    %edx,-0x10(%ebp)
c01008d1:	89 c2                	mov    %eax,%edx
c01008d3:	b8 10 00 00 00       	mov    $0x10,%eax
c01008d8:	83 e8 01             	sub    $0x1,%eax
c01008db:	01 d0                	add    %edx,%eax
c01008dd:	b9 10 00 00 00       	mov    $0x10,%ecx
c01008e2:	ba 00 00 00 00       	mov    $0x0,%edx
c01008e7:	f7 f1                	div    %ecx
c01008e9:	6b c0 10             	imul   $0x10,%eax,%eax
c01008ec:	29 c4                	sub    %eax,%esp
c01008ee:	89 e0                	mov    %esp,%eax
c01008f0:	83 c0 00             	add    $0x0,%eax
c01008f3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01008f6:	83 ec 04             	sub    $0x4,%esp
c01008f9:	ff 75 f4             	pushl  -0xc(%ebp)
c01008fc:	6a 00                	push   $0x0
c01008fe:	ff 75 ec             	pushl  -0x14(%ebp)
c0100901:	e8 19 a3 00 00       	call   c010ac1f <Memset>
c0100906:	83 c4 10             	add    $0x10,%esp
c0100909:	83 ec 04             	sub    $0x4,%esp
c010090c:	ff 75 f4             	pushl  -0xc(%ebp)
c010090f:	ff 75 ec             	pushl  -0x14(%ebp)
c0100912:	68 f0 01 00 00       	push   $0x1f0
c0100917:	e8 57 a3 00 00       	call   c010ac73 <read_port>
c010091c:	83 c4 10             	add    $0x10,%esp
c010091f:	83 ec 0c             	sub    $0xc,%esp
c0100922:	ff 75 ec             	pushl  -0x14(%ebp)
c0100925:	e8 0b 00 00 00       	call   c0100935 <print_hdinfo>
c010092a:	83 c4 10             	add    $0x10,%esp
c010092d:	89 dc                	mov    %ebx,%esp
c010092f:	90                   	nop
c0100930:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100933:	c9                   	leave  
c0100934:	c3                   	ret    

c0100935 <print_hdinfo>:
c0100935:	55                   	push   %ebp
c0100936:	89 e5                	mov    %esp,%ebp
c0100938:	81 ec 88 00 00 00    	sub    $0x88,%esp
c010093e:	66 c7 45 b4 0a 00    	movw   $0xa,-0x4c(%ebp)
c0100944:	66 c7 45 b6 14 00    	movw   $0x14,-0x4a(%ebp)
c010094a:	c7 45 b8 53 65 72 69 	movl   $0x69726553,-0x48(%ebp)
c0100951:	c7 45 bc 61 6c 20 4e 	movl   $0x4e206c61,-0x44(%ebp)
c0100958:	c7 45 c0 75 6d 62 65 	movl   $0x65626d75,-0x40(%ebp)
c010095f:	c7 45 c4 72 00 00 00 	movl   $0x72,-0x3c(%ebp)
c0100966:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c010096d:	66 c7 45 cc 1b 00    	movw   $0x1b,-0x34(%ebp)
c0100973:	66 c7 45 ce 28 00    	movw   $0x28,-0x32(%ebp)
c0100979:	c7 45 d0 4d 6f 64 65 	movl   $0x65646f4d,-0x30(%ebp)
c0100980:	c7 45 d4 6c 20 4e 75 	movl   $0x754e206c,-0x2c(%ebp)
c0100987:	c7 45 d8 6d 62 65 72 	movl   $0x7265626d,-0x28(%ebp)
c010098e:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0100995:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c010099c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01009a3:	e9 8f 00 00 00       	jmp    c0100a37 <print_hdinfo+0x102>
c01009a8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01009af:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01009b2:	89 d0                	mov    %edx,%eax
c01009b4:	01 c0                	add    %eax,%eax
c01009b6:	01 d0                	add    %edx,%eax
c01009b8:	c1 e0 03             	shl    $0x3,%eax
c01009bb:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c01009be:	01 c8                	add    %ecx,%eax
c01009c0:	83 e8 44             	sub    $0x44,%eax
c01009c3:	0f b7 00             	movzwl (%eax),%eax
c01009c6:	0f b7 c0             	movzwl %ax,%eax
c01009c9:	8d 14 00             	lea    (%eax,%eax,1),%edx
c01009cc:	8b 45 08             	mov    0x8(%ebp),%eax
c01009cf:	01 d0                	add    %edx,%eax
c01009d1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01009d4:	eb 30                	jmp    c0100a06 <print_hdinfo+0xd1>
c01009d6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01009d9:	8d 50 01             	lea    0x1(%eax),%edx
c01009dc:	89 55 ec             	mov    %edx,-0x14(%ebp)
c01009df:	8b 55 f0             	mov    -0x10(%ebp),%edx
c01009e2:	83 c2 01             	add    $0x1,%edx
c01009e5:	0f b6 00             	movzbl (%eax),%eax
c01009e8:	88 44 15 81          	mov    %al,-0x7f(%ebp,%edx,1)
c01009ec:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01009ef:	8d 50 01             	lea    0x1(%eax),%edx
c01009f2:	89 55 ec             	mov    %edx,-0x14(%ebp)
c01009f5:	0f b6 00             	movzbl (%eax),%eax
c01009f8:	8d 4d 81             	lea    -0x7f(%ebp),%ecx
c01009fb:	8b 55 f0             	mov    -0x10(%ebp),%edx
c01009fe:	01 ca                	add    %ecx,%edx
c0100a00:	88 02                	mov    %al,(%edx)
c0100a02:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0100a06:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0100a09:	89 d0                	mov    %edx,%eax
c0100a0b:	01 c0                	add    %eax,%eax
c0100a0d:	01 d0                	add    %edx,%eax
c0100a0f:	c1 e0 03             	shl    $0x3,%eax
c0100a12:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100a15:	01 c8                	add    %ecx,%eax
c0100a17:	83 e8 42             	sub    $0x42,%eax
c0100a1a:	0f b7 00             	movzwl (%eax),%eax
c0100a1d:	66 d1 e8             	shr    %ax
c0100a20:	0f b7 c0             	movzwl %ax,%eax
c0100a23:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0100a26:	7c ae                	jl     c01009d6 <print_hdinfo+0xa1>
c0100a28:	8d 55 81             	lea    -0x7f(%ebp),%edx
c0100a2b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100a2e:	01 d0                	add    %edx,%eax
c0100a30:	c6 00 00             	movb   $0x0,(%eax)
c0100a33:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0100a37:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0100a3b:	0f 8e 67 ff ff ff    	jle    c01009a8 <print_hdinfo+0x73>
c0100a41:	8b 45 08             	mov    0x8(%ebp),%eax
c0100a44:	0f b7 40 62          	movzwl 0x62(%eax),%eax
c0100a48:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
c0100a4c:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0100a50:	66 c1 e8 08          	shr    $0x8,%ax
c0100a54:	66 85 c0             	test   %ax,%ax
c0100a57:	0f 95 c0             	setne  %al
c0100a5a:	88 45 e9             	mov    %al,-0x17(%ebp)
c0100a5d:	c7 45 ac 59 65 73 00 	movl   $0x736559,-0x54(%ebp)
c0100a64:	66 c7 45 a9 4e 6f    	movw   $0x6f4e,-0x57(%ebp)
c0100a6a:	c6 45 ab 00          	movb   $0x0,-0x55(%ebp)
c0100a6e:	80 7d e9 01          	cmpb   $0x1,-0x17(%ebp)
c0100a72:	75 15                	jne    c0100a89 <print_hdinfo+0x154>
c0100a74:	83 ec 08             	sub    $0x8,%esp
c0100a77:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0100a7a:	50                   	push   %eax
c0100a7b:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0100a7e:	50                   	push   %eax
c0100a7f:	e8 ba a1 00 00       	call   c010ac3e <Strcpy>
c0100a84:	83 c4 10             	add    $0x10,%esp
c0100a87:	eb 13                	jmp    c0100a9c <print_hdinfo+0x167>
c0100a89:	83 ec 08             	sub    $0x8,%esp
c0100a8c:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0100a8f:	50                   	push   %eax
c0100a90:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0100a93:	50                   	push   %eax
c0100a94:	e8 a5 a1 00 00       	call   c010ac3e <Strcpy>
c0100a99:	83 c4 10             	add    $0x10,%esp
c0100a9c:	8b 45 08             	mov    0x8(%ebp),%eax
c0100a9f:	83 c0 7a             	add    $0x7a,%eax
c0100aa2:	0f b7 00             	movzwl (%eax),%eax
c0100aa5:	0f b7 d0             	movzwl %ax,%edx
c0100aa8:	8b 45 08             	mov    0x8(%ebp),%eax
c0100aab:	83 c0 78             	add    $0x78,%eax
c0100aae:	0f b7 00             	movzwl (%eax),%eax
c0100ab1:	0f b7 c0             	movzwl %ax,%eax
c0100ab4:	83 c0 10             	add    $0x10,%eax
c0100ab7:	89 c1                	mov    %eax,%ecx
c0100ab9:	d3 e2                	shl    %cl,%edx
c0100abb:	89 d0                	mov    %edx,%eax
c0100abd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0100ac0:	90                   	nop
c0100ac1:	c9                   	leave  
c0100ac2:	c3                   	ret    

c0100ac3 <print_dpt_entry>:
c0100ac3:	55                   	push   %ebp
c0100ac4:	89 e5                	mov    %esp,%ebp
c0100ac6:	83 ec 08             	sub    $0x8,%esp
c0100ac9:	8b 45 08             	mov    0x8(%ebp),%eax
c0100acc:	8b 40 08             	mov    0x8(%eax),%eax
c0100acf:	83 ec 08             	sub    $0x8,%esp
c0100ad2:	50                   	push   %eax
c0100ad3:	68 72 9f 10 c0       	push   $0xc0109f72
c0100ad8:	e8 f5 75 00 00       	call   c01080d2 <Printf>
c0100add:	83 c4 10             	add    $0x10,%esp
c0100ae0:	8b 45 08             	mov    0x8(%ebp),%eax
c0100ae3:	8b 40 0c             	mov    0xc(%eax),%eax
c0100ae6:	83 ec 08             	sub    $0x8,%esp
c0100ae9:	50                   	push   %eax
c0100aea:	68 7a 9f 10 c0       	push   $0xc0109f7a
c0100aef:	e8 de 75 00 00       	call   c01080d2 <Printf>
c0100af4:	83 c4 10             	add    $0x10,%esp
c0100af7:	8b 45 08             	mov    0x8(%ebp),%eax
c0100afa:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0100afe:	0f b6 c0             	movzbl %al,%eax
c0100b01:	83 ec 08             	sub    $0x8,%esp
c0100b04:	50                   	push   %eax
c0100b05:	68 8b 9f 10 c0       	push   $0xc0109f8b
c0100b0a:	e8 c3 75 00 00       	call   c01080d2 <Printf>
c0100b0f:	83 c4 10             	add    $0x10,%esp
c0100b12:	8b 45 08             	mov    0x8(%ebp),%eax
c0100b15:	0f b6 00             	movzbl (%eax),%eax
c0100b18:	0f b6 c0             	movzbl %al,%eax
c0100b1b:	83 ec 08             	sub    $0x8,%esp
c0100b1e:	50                   	push   %eax
c0100b1f:	68 99 9f 10 c0       	push   $0xc0109f99
c0100b24:	e8 a9 75 00 00       	call   c01080d2 <Printf>
c0100b29:	83 c4 10             	add    $0x10,%esp
c0100b2c:	90                   	nop
c0100b2d:	c9                   	leave  
c0100b2e:	c3                   	ret    

c0100b2f <get_partition_table>:
c0100b2f:	55                   	push   %ebp
c0100b30:	89 e5                	mov    %esp,%ebp
c0100b32:	53                   	push   %ebx
c0100b33:	83 ec 24             	sub    $0x24,%esp
c0100b36:	89 e0                	mov    %esp,%eax
c0100b38:	89 c3                	mov    %eax,%ebx
c0100b3a:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
c0100b3e:	c6 45 e2 01          	movb   $0x1,-0x1e(%ebp)
c0100b42:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100b45:	88 45 e3             	mov    %al,-0x1d(%ebp)
c0100b48:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100b4b:	c1 f8 08             	sar    $0x8,%eax
c0100b4e:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0100b51:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100b54:	c1 f8 10             	sar    $0x10,%eax
c0100b57:	88 45 e5             	mov    %al,-0x1b(%ebp)
c0100b5a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100b5d:	c1 f8 18             	sar    $0x18,%eax
c0100b60:	89 c2                	mov    %eax,%edx
c0100b62:	8b 45 08             	mov    0x8(%ebp),%eax
c0100b65:	c1 e0 04             	shl    $0x4,%eax
c0100b68:	09 d0                	or     %edx,%eax
c0100b6a:	83 c8 e0             	or     $0xffffffe0,%eax
c0100b6d:	88 45 e6             	mov    %al,-0x1a(%ebp)
c0100b70:	c6 45 e7 20          	movb   $0x20,-0x19(%ebp)
c0100b74:	83 ec 0c             	sub    $0xc,%esp
c0100b77:	8d 45 e1             	lea    -0x1f(%ebp),%eax
c0100b7a:	50                   	push   %eax
c0100b7b:	e8 fc fb ff ff       	call   c010077c <hd_cmd_out>
c0100b80:	83 c4 10             	add    $0x10,%esp
c0100b83:	e8 29 04 00 00       	call   c0100fb1 <interrupt_wait>
c0100b88:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c0100b8f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100b92:	8d 50 ff             	lea    -0x1(%eax),%edx
c0100b95:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0100b98:	89 c2                	mov    %eax,%edx
c0100b9a:	b8 10 00 00 00       	mov    $0x10,%eax
c0100b9f:	83 e8 01             	sub    $0x1,%eax
c0100ba2:	01 d0                	add    %edx,%eax
c0100ba4:	b9 10 00 00 00       	mov    $0x10,%ecx
c0100ba9:	ba 00 00 00 00       	mov    $0x0,%edx
c0100bae:	f7 f1                	div    %ecx
c0100bb0:	6b c0 10             	imul   $0x10,%eax,%eax
c0100bb3:	29 c4                	sub    %eax,%esp
c0100bb5:	89 e0                	mov    %esp,%eax
c0100bb7:	83 c0 00             	add    $0x0,%eax
c0100bba:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0100bbd:	83 ec 04             	sub    $0x4,%esp
c0100bc0:	ff 75 f4             	pushl  -0xc(%ebp)
c0100bc3:	6a 00                	push   $0x0
c0100bc5:	ff 75 ec             	pushl  -0x14(%ebp)
c0100bc8:	e8 52 a0 00 00       	call   c010ac1f <Memset>
c0100bcd:	83 c4 10             	add    $0x10,%esp
c0100bd0:	83 ec 04             	sub    $0x4,%esp
c0100bd3:	ff 75 f4             	pushl  -0xc(%ebp)
c0100bd6:	ff 75 ec             	pushl  -0x14(%ebp)
c0100bd9:	68 f0 01 00 00       	push   $0x1f0
c0100bde:	e8 90 a0 00 00       	call   c010ac73 <read_port>
c0100be3:	83 c4 10             	add    $0x10,%esp
c0100be6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100be9:	05 be 01 00 00       	add    $0x1be,%eax
c0100bee:	83 ec 04             	sub    $0x4,%esp
c0100bf1:	6a 40                	push   $0x40
c0100bf3:	50                   	push   %eax
c0100bf4:	ff 75 10             	pushl  0x10(%ebp)
c0100bf7:	e8 5a 5e 00 00       	call   c0106a56 <Memcpy>
c0100bfc:	83 c4 10             	add    $0x10,%esp
c0100bff:	c7 45 e8 05 00 00 00 	movl   $0x5,-0x18(%ebp)
c0100c06:	89 dc                	mov    %ebx,%esp
c0100c08:	90                   	nop
c0100c09:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0100c0c:	c9                   	leave  
c0100c0d:	c3                   	ret    

c0100c0e <partition>:
c0100c0e:	55                   	push   %ebp
c0100c0f:	89 e5                	mov    %esp,%ebp
c0100c11:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0100c17:	8b 45 0c             	mov    0xc(%ebp),%eax
c0100c1a:	88 45 84             	mov    %al,-0x7c(%ebp)
c0100c1d:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c0100c21:	7f 19                	jg     c0100c3c <partition+0x2e>
c0100c23:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0100c26:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0100c2b:	89 c8                	mov    %ecx,%eax
c0100c2d:	f7 ea                	imul   %edx
c0100c2f:	d1 fa                	sar    %edx
c0100c31:	89 c8                	mov    %ecx,%eax
c0100c33:	c1 f8 1f             	sar    $0x1f,%eax
c0100c36:	29 c2                	sub    %eax,%edx
c0100c38:	89 d0                	mov    %edx,%eax
c0100c3a:	eb 11                	jmp    c0100c4d <partition+0x3f>
c0100c3c:	8b 45 08             	mov    0x8(%ebp),%eax
c0100c3f:	83 e8 10             	sub    $0x10,%eax
c0100c42:	8d 50 3f             	lea    0x3f(%eax),%edx
c0100c45:	85 c0                	test   %eax,%eax
c0100c47:	0f 48 c2             	cmovs  %edx,%eax
c0100c4a:	c1 f8 06             	sar    $0x6,%eax
c0100c4d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0100c50:	80 7d 84 00          	cmpb   $0x0,-0x7c(%ebp)
c0100c54:	0f 85 cc 00 00 00    	jne    c0100d26 <partition+0x118>
c0100c5a:	83 ec 04             	sub    $0x4,%esp
c0100c5d:	6a 40                	push   $0x40
c0100c5f:	6a 00                	push   $0x0
c0100c61:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100c64:	50                   	push   %eax
c0100c65:	e8 b5 9f 00 00       	call   c010ac1f <Memset>
c0100c6a:	83 c4 10             	add    $0x10,%esp
c0100c6d:	83 ec 04             	sub    $0x4,%esp
c0100c70:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100c73:	50                   	push   %eax
c0100c74:	6a 00                	push   $0x0
c0100c76:	ff 75 e8             	pushl  -0x18(%ebp)
c0100c79:	e8 b1 fe ff ff       	call   c0100b2f <get_partition_table>
c0100c7e:	83 c4 10             	add    $0x10,%esp
c0100c81:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100c88:	e9 8a 00 00 00       	jmp    c0100d17 <partition+0x109>
c0100c8d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100c90:	83 c0 01             	add    $0x1,%eax
c0100c93:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0100c96:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100c99:	c1 e0 04             	shl    $0x4,%eax
c0100c9c:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100c9f:	01 c8                	add    %ecx,%eax
c0100ca1:	83 e8 5c             	sub    $0x5c,%eax
c0100ca4:	8b 00                	mov    (%eax),%eax
c0100ca6:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0100ca9:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0100cac:	c1 e1 03             	shl    $0x3,%ecx
c0100caf:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0100cb5:	01 ca                	add    %ecx,%edx
c0100cb7:	81 c2 44 0f 11 c0    	add    $0xc0110f44,%edx
c0100cbd:	89 02                	mov    %eax,(%edx)
c0100cbf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100cc2:	c1 e0 04             	shl    $0x4,%eax
c0100cc5:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100cc8:	01 c8                	add    %ecx,%eax
c0100cca:	83 e8 58             	sub    $0x58,%eax
c0100ccd:	8b 00                	mov    (%eax),%eax
c0100ccf:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0100cd2:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0100cd5:	c1 e1 03             	shl    $0x3,%ecx
c0100cd8:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0100cde:	01 ca                	add    %ecx,%edx
c0100ce0:	81 c2 48 0f 11 c0    	add    $0xc0110f48,%edx
c0100ce6:	89 02                	mov    %eax,(%edx)
c0100ce8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100ceb:	c1 e0 04             	shl    $0x4,%eax
c0100cee:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0100cf1:	01 c8                	add    %ecx,%eax
c0100cf3:	83 e8 60             	sub    $0x60,%eax
c0100cf6:	0f b6 00             	movzbl (%eax),%eax
c0100cf9:	3c 05                	cmp    $0x5,%al
c0100cfb:	75 16                	jne    c0100d13 <partition+0x105>
c0100cfd:	8b 55 08             	mov    0x8(%ebp),%edx
c0100d00:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0100d03:	01 d0                	add    %edx,%eax
c0100d05:	83 ec 08             	sub    $0x8,%esp
c0100d08:	6a 01                	push   $0x1
c0100d0a:	50                   	push   %eax
c0100d0b:	e8 fe fe ff ff       	call   c0100c0e <partition>
c0100d10:	83 c4 10             	add    $0x10,%esp
c0100d13:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0100d17:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c0100d1b:	0f 8e 6c ff ff ff    	jle    c0100c8d <partition+0x7f>
c0100d21:	e9 ff 00 00 00       	jmp    c0100e25 <partition+0x217>
c0100d26:	80 7d 84 01          	cmpb   $0x1,-0x7c(%ebp)
c0100d2a:	0f 85 f5 00 00 00    	jne    c0100e25 <partition+0x217>
c0100d30:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0100d33:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0100d38:	89 c8                	mov    %ecx,%eax
c0100d3a:	f7 ea                	imul   %edx
c0100d3c:	d1 fa                	sar    %edx
c0100d3e:	89 c8                	mov    %ecx,%eax
c0100d40:	c1 f8 1f             	sar    $0x1f,%eax
c0100d43:	29 c2                	sub    %eax,%edx
c0100d45:	89 d0                	mov    %edx,%eax
c0100d47:	c1 e0 02             	shl    $0x2,%eax
c0100d4a:	01 d0                	add    %edx,%eax
c0100d4c:	29 c1                	sub    %eax,%ecx
c0100d4e:	89 c8                	mov    %ecx,%eax
c0100d50:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0100d53:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0100d56:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100d59:	c1 e2 03             	shl    $0x3,%edx
c0100d5c:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0100d62:	01 d0                	add    %edx,%eax
c0100d64:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c0100d69:	8b 00                	mov    (%eax),%eax
c0100d6b:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0100d6e:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0100d71:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100d74:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0100d77:	83 e8 01             	sub    $0x1,%eax
c0100d7a:	c1 e0 04             	shl    $0x4,%eax
c0100d7d:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0100d80:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0100d87:	e9 8c 00 00 00       	jmp    c0100e18 <partition+0x20a>
c0100d8c:	83 ec 04             	sub    $0x4,%esp
c0100d8f:	6a 40                	push   $0x40
c0100d91:	6a 00                	push   $0x0
c0100d93:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100d96:	50                   	push   %eax
c0100d97:	e8 83 9e 00 00       	call   c010ac1f <Memset>
c0100d9c:	83 c4 10             	add    $0x10,%esp
c0100d9f:	83 ec 04             	sub    $0x4,%esp
c0100da2:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0100da5:	50                   	push   %eax
c0100da6:	ff 75 f0             	pushl  -0x10(%ebp)
c0100da9:	ff 75 e8             	pushl  -0x18(%ebp)
c0100dac:	e8 7e fd ff ff       	call   c0100b2f <get_partition_table>
c0100db1:	83 c4 10             	add    $0x10,%esp
c0100db4:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0100db7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100dba:	01 d0                	add    %edx,%eax
c0100dbc:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0100dbf:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0100dc2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100dc5:	01 c2                	add    %eax,%edx
c0100dc7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0100dca:	8d 48 04             	lea    0x4(%eax),%ecx
c0100dcd:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0100dd0:	c1 e1 03             	shl    $0x3,%ecx
c0100dd3:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0100dd9:	01 c8                	add    %ecx,%eax
c0100ddb:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c0100de0:	89 10                	mov    %edx,(%eax)
c0100de2:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0100de5:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0100de8:	8d 4a 04             	lea    0x4(%edx),%ecx
c0100deb:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0100dee:	c1 e1 03             	shl    $0x3,%ecx
c0100df1:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0100df7:	01 ca                	add    %ecx,%edx
c0100df9:	81 c2 48 0f 11 c0    	add    $0xc0110f48,%edx
c0100dff:	89 02                	mov    %eax,(%edx)
c0100e01:	0f b6 45 a8          	movzbl -0x58(%ebp),%eax
c0100e05:	84 c0                	test   %al,%al
c0100e07:	74 1b                	je     c0100e24 <partition+0x216>
c0100e09:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0100e0c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0100e0f:	01 d0                	add    %edx,%eax
c0100e11:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100e14:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0100e18:	83 7d ec 0f          	cmpl   $0xf,-0x14(%ebp)
c0100e1c:	0f 8e 6a ff ff ff    	jle    c0100d8c <partition+0x17e>
c0100e22:	eb 01                	jmp    c0100e25 <partition+0x217>
c0100e24:	90                   	nop
c0100e25:	90                   	nop
c0100e26:	c9                   	leave  
c0100e27:	c3                   	ret    

c0100e28 <hd_open>:
c0100e28:	55                   	push   %ebp
c0100e29:	89 e5                	mov    %esp,%ebp
c0100e2b:	83 ec 18             	sub    $0x18,%esp
c0100e2e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0100e35:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100e38:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0100e3e:	05 40 0f 11 c0       	add    $0xc0110f40,%eax
c0100e43:	8b 00                	mov    (%eax),%eax
c0100e45:	8d 50 01             	lea    0x1(%eax),%edx
c0100e48:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100e4b:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0100e51:	05 40 0f 11 c0       	add    $0xc0110f40,%eax
c0100e56:	89 10                	mov    %edx,(%eax)
c0100e58:	83 ec 0c             	sub    $0xc,%esp
c0100e5b:	6a 00                	push   $0x0
c0100e5d:	e8 1c fa ff ff       	call   c010087e <hd_identify>
c0100e62:	83 c4 10             	add    $0x10,%esp
c0100e65:	83 ec 08             	sub    $0x8,%esp
c0100e68:	6a 00                	push   $0x0
c0100e6a:	6a 00                	push   $0x0
c0100e6c:	e8 9d fd ff ff       	call   c0100c0e <partition>
c0100e71:	83 c4 10             	add    $0x10,%esp
c0100e74:	83 ec 0c             	sub    $0xc,%esp
c0100e77:	6a 7c                	push   $0x7c
c0100e79:	e8 fe 05 00 00       	call   c010147c <sys_malloc>
c0100e7e:	83 c4 10             	add    $0x10,%esp
c0100e81:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100e84:	83 ec 04             	sub    $0x4,%esp
c0100e87:	6a 7c                	push   $0x7c
c0100e89:	6a 00                	push   $0x0
c0100e8b:	ff 75 f0             	pushl  -0x10(%ebp)
c0100e8e:	e8 8c 9d 00 00       	call   c010ac1f <Memset>
c0100e93:	83 c4 10             	add    $0x10,%esp
c0100e96:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100e99:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0100ea0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100ea3:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0100eaa:	83 ec 04             	sub    $0x4,%esp
c0100ead:	6a 02                	push   $0x2
c0100eaf:	ff 75 f0             	pushl  -0x10(%ebp)
c0100eb2:	6a 01                	push   $0x1
c0100eb4:	e8 93 7f 00 00       	call   c0108e4c <send_rec>
c0100eb9:	83 c4 10             	add    $0x10,%esp
c0100ebc:	83 ec 08             	sub    $0x8,%esp
c0100ebf:	6a 7c                	push   $0x7c
c0100ec1:	ff 75 f0             	pushl  -0x10(%ebp)
c0100ec4:	e8 c8 05 00 00       	call   c0101491 <sys_free>
c0100ec9:	83 c4 10             	add    $0x10,%esp
c0100ecc:	90                   	nop
c0100ecd:	c9                   	leave  
c0100ece:	c3                   	ret    

c0100ecf <get_hd_ioctl>:
c0100ecf:	55                   	push   %ebp
c0100ed0:	89 e5                	mov    %esp,%ebp
c0100ed2:	83 ec 18             	sub    $0x18,%esp
c0100ed5:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c0100ed9:	7f 19                	jg     c0100ef4 <get_hd_ioctl+0x25>
c0100edb:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0100ede:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0100ee3:	89 c8                	mov    %ecx,%eax
c0100ee5:	f7 ea                	imul   %edx
c0100ee7:	d1 fa                	sar    %edx
c0100ee9:	89 c8                	mov    %ecx,%eax
c0100eeb:	c1 f8 1f             	sar    $0x1f,%eax
c0100eee:	29 c2                	sub    %eax,%edx
c0100ef0:	89 d0                	mov    %edx,%eax
c0100ef2:	eb 11                	jmp    c0100f05 <get_hd_ioctl+0x36>
c0100ef4:	8b 45 08             	mov    0x8(%ebp),%eax
c0100ef7:	83 e8 10             	sub    $0x10,%eax
c0100efa:	8d 50 3f             	lea    0x3f(%eax),%edx
c0100efd:	85 c0                	test   %eax,%eax
c0100eff:	0f 48 c2             	cmovs  %edx,%eax
c0100f02:	c1 f8 06             	sar    $0x6,%eax
c0100f05:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0100f08:	8b 55 08             	mov    0x8(%ebp),%edx
c0100f0b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0100f0e:	c1 e2 03             	shl    $0x3,%edx
c0100f11:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0100f17:	01 d0                	add    %edx,%eax
c0100f19:	05 48 0f 11 c0       	add    $0xc0110f48,%eax
c0100f1e:	8b 00                	mov    (%eax),%eax
c0100f20:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0100f23:	83 ec 0c             	sub    $0xc,%esp
c0100f26:	6a 7c                	push   $0x7c
c0100f28:	e8 4f 05 00 00       	call   c010147c <sys_malloc>
c0100f2d:	83 c4 10             	add    $0x10,%esp
c0100f30:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0100f33:	83 ec 04             	sub    $0x4,%esp
c0100f36:	6a 7c                	push   $0x7c
c0100f38:	6a 00                	push   $0x0
c0100f3a:	ff 75 ec             	pushl  -0x14(%ebp)
c0100f3d:	e8 dd 9c 00 00       	call   c010ac1f <Memset>
c0100f42:	83 c4 10             	add    $0x10,%esp
c0100f45:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100f48:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0100f4f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0100f52:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0100f59:	83 ec 04             	sub    $0x4,%esp
c0100f5c:	6a 02                	push   $0x2
c0100f5e:	ff 75 ec             	pushl  -0x14(%ebp)
c0100f61:	6a 01                	push   $0x1
c0100f63:	e8 e4 7e 00 00       	call   c0108e4c <send_rec>
c0100f68:	83 c4 10             	add    $0x10,%esp
c0100f6b:	83 ec 08             	sub    $0x8,%esp
c0100f6e:	6a 7c                	push   $0x7c
c0100f70:	ff 75 ec             	pushl  -0x14(%ebp)
c0100f73:	e8 19 05 00 00       	call   c0101491 <sys_free>
c0100f78:	83 c4 10             	add    $0x10,%esp
c0100f7b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0100f7e:	c9                   	leave  
c0100f7f:	c3                   	ret    

c0100f80 <wait_for>:
c0100f80:	55                   	push   %ebp
c0100f81:	89 e5                	mov    %esp,%ebp
c0100f83:	83 ec 08             	sub    $0x8,%esp
c0100f86:	83 ec 04             	sub    $0x4,%esp
c0100f89:	68 50 c3 00 00       	push   $0xc350
c0100f8e:	6a 08                	push   $0x8
c0100f90:	6a 08                	push   $0x8
c0100f92:	e8 35 03 00 00       	call   c01012cc <waitfor>
c0100f97:	83 c4 10             	add    $0x10,%esp
c0100f9a:	85 c0                	test   %eax,%eax
c0100f9c:	75 10                	jne    c0100fae <wait_for+0x2e>
c0100f9e:	83 ec 0c             	sub    $0xc,%esp
c0100fa1:	68 a4 9f 10 c0       	push   $0xc0109fa4
c0100fa6:	e8 66 74 00 00       	call   c0108411 <panic>
c0100fab:	83 c4 10             	add    $0x10,%esp
c0100fae:	90                   	nop
c0100faf:	c9                   	leave  
c0100fb0:	c3                   	ret    

c0100fb1 <interrupt_wait>:
c0100fb1:	55                   	push   %ebp
c0100fb2:	89 e5                	mov    %esp,%ebp
c0100fb4:	83 ec 18             	sub    $0x18,%esp
c0100fb7:	83 ec 0c             	sub    $0xc,%esp
c0100fba:	6a 7c                	push   $0x7c
c0100fbc:	e8 bb 04 00 00       	call   c010147c <sys_malloc>
c0100fc1:	83 c4 10             	add    $0x10,%esp
c0100fc4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0100fc7:	83 ec 04             	sub    $0x4,%esp
c0100fca:	6a 7c                	push   $0x7c
c0100fcc:	6a 00                	push   $0x0
c0100fce:	ff 75 f4             	pushl  -0xc(%ebp)
c0100fd1:	e8 49 9c 00 00       	call   c010ac1f <Memset>
c0100fd6:	83 c4 10             	add    $0x10,%esp
c0100fd9:	83 ec 04             	sub    $0x4,%esp
c0100fdc:	68 13 02 00 00       	push   $0x213
c0100fe1:	ff 75 f4             	pushl  -0xc(%ebp)
c0100fe4:	6a 02                	push   $0x2
c0100fe6:	e8 61 7e 00 00       	call   c0108e4c <send_rec>
c0100feb:	83 c4 10             	add    $0x10,%esp
c0100fee:	83 ec 08             	sub    $0x8,%esp
c0100ff1:	6a 7c                	push   $0x7c
c0100ff3:	ff 75 f4             	pushl  -0xc(%ebp)
c0100ff6:	e8 96 04 00 00       	call   c0101491 <sys_free>
c0100ffb:	83 c4 10             	add    $0x10,%esp
c0100ffe:	90                   	nop
c0100fff:	c9                   	leave  
c0101000:	c3                   	ret    

c0101001 <hd_rdwt>:
c0101001:	55                   	push   %ebp
c0101002:	89 e5                	mov    %esp,%ebp
c0101004:	81 ec c8 00 00 00    	sub    $0xc8,%esp
c010100a:	8b 45 08             	mov    0x8(%ebp),%eax
c010100d:	8b 40 18             	mov    0x18(%eax),%eax
c0101010:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0101013:	8b 45 08             	mov    0x8(%ebp),%eax
c0101016:	8b 40 14             	mov    0x14(%eax),%eax
c0101019:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010101c:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c0101020:	7f 19                	jg     c010103b <hd_rdwt+0x3a>
c0101022:	8b 4d e8             	mov    -0x18(%ebp),%ecx
c0101025:	ba 67 66 66 66       	mov    $0x66666667,%edx
c010102a:	89 c8                	mov    %ecx,%eax
c010102c:	f7 ea                	imul   %edx
c010102e:	d1 fa                	sar    %edx
c0101030:	89 c8                	mov    %ecx,%eax
c0101032:	c1 f8 1f             	sar    $0x1f,%eax
c0101035:	29 c2                	sub    %eax,%edx
c0101037:	89 d0                	mov    %edx,%eax
c0101039:	eb 11                	jmp    c010104c <hd_rdwt+0x4b>
c010103b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010103e:	83 e8 10             	sub    $0x10,%eax
c0101041:	8d 50 3f             	lea    0x3f(%eax),%edx
c0101044:	85 c0                	test   %eax,%eax
c0101046:	0f 48 c2             	cmovs  %edx,%eax
c0101049:	c1 f8 06             	sar    $0x6,%eax
c010104c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010104f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0101052:	8d 50 f0             	lea    -0x10(%eax),%edx
c0101055:	89 d0                	mov    %edx,%eax
c0101057:	c1 f8 1f             	sar    $0x1f,%eax
c010105a:	c1 e8 1a             	shr    $0x1a,%eax
c010105d:	01 c2                	add    %eax,%edx
c010105f:	83 e2 3f             	and    $0x3f,%edx
c0101062:	29 c2                	sub    %eax,%edx
c0101064:	89 d0                	mov    %edx,%eax
c0101066:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0101069:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010106c:	c1 e8 09             	shr    $0x9,%eax
c010106f:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0101072:	83 7d e8 08          	cmpl   $0x8,-0x18(%ebp)
c0101076:	7f 1a                	jg     c0101092 <hd_rdwt+0x91>
c0101078:	8b 55 e8             	mov    -0x18(%ebp),%edx
c010107b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010107e:	c1 e2 03             	shl    $0x3,%edx
c0101081:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0101087:	01 d0                	add    %edx,%eax
c0101089:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c010108e:	8b 00                	mov    (%eax),%eax
c0101090:	eb 1b                	jmp    c01010ad <hd_rdwt+0xac>
c0101092:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0101095:	8d 50 04             	lea    0x4(%eax),%edx
c0101098:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010109b:	c1 e2 03             	shl    $0x3,%edx
c010109e:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c01010a4:	01 d0                	add    %edx,%eax
c01010a6:	05 44 0f 11 c0       	add    $0xc0110f44,%eax
c01010ab:	8b 00                	mov    (%eax),%eax
c01010ad:	8b 55 dc             	mov    -0x24(%ebp),%edx
c01010b0:	01 d0                	add    %edx,%eax
c01010b2:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01010b5:	8b 45 08             	mov    0x8(%ebp),%eax
c01010b8:	8b 40 0c             	mov    0xc(%eax),%eax
c01010bb:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01010be:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01010c1:	05 ff 01 00 00       	add    $0x1ff,%eax
c01010c6:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c01010cc:	85 c0                	test   %eax,%eax
c01010ce:	0f 48 c2             	cmovs  %edx,%eax
c01010d1:	c1 f8 09             	sar    $0x9,%eax
c01010d4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01010d7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01010da:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01010dd:	8b 45 08             	mov    0x8(%ebp),%eax
c01010e0:	8b 40 10             	mov    0x10(%eax),%eax
c01010e3:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01010e6:	8b 45 08             	mov    0x8(%ebp),%eax
c01010e9:	8b 00                	mov    (%eax),%eax
c01010eb:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01010ee:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01010f1:	83 ec 08             	sub    $0x8,%esp
c01010f4:	50                   	push   %eax
c01010f5:	ff 75 d0             	pushl  -0x30(%ebp)
c01010f8:	e8 3f 4b 00 00       	call   c0105c3c <alloc_virtual_memory>
c01010fd:	83 c4 10             	add    $0x10,%esp
c0101100:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0101103:	8b 45 08             	mov    0x8(%ebp),%eax
c0101106:	8b 40 78             	mov    0x78(%eax),%eax
c0101109:	89 45 c8             	mov    %eax,-0x38(%ebp)
c010110c:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c0101110:	74 22                	je     c0101134 <hd_rdwt+0x133>
c0101112:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c0101116:	74 1c                	je     c0101134 <hd_rdwt+0x133>
c0101118:	68 b7 01 00 00       	push   $0x1b7
c010111d:	68 f4 9e 10 c0       	push   $0xc0109ef4
c0101122:	68 f4 9e 10 c0       	push   $0xc0109ef4
c0101127:	68 b6 9f 10 c0       	push   $0xc0109fb6
c010112c:	e8 fe 72 00 00       	call   c010842f <assertion_failure>
c0101131:	83 c4 10             	add    $0x10,%esp
c0101134:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
c0101138:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010113b:	88 45 be             	mov    %al,-0x42(%ebp)
c010113e:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101141:	88 45 bf             	mov    %al,-0x41(%ebp)
c0101144:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101147:	c1 f8 08             	sar    $0x8,%eax
c010114a:	88 45 c0             	mov    %al,-0x40(%ebp)
c010114d:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101150:	c1 f8 10             	sar    $0x10,%eax
c0101153:	88 45 c1             	mov    %al,-0x3f(%ebp)
c0101156:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0101159:	c1 f8 18             	sar    $0x18,%eax
c010115c:	83 e0 0f             	and    $0xf,%eax
c010115f:	83 c8 e0             	or     $0xffffffe0,%eax
c0101162:	88 45 c2             	mov    %al,-0x3e(%ebp)
c0101165:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c0101169:	75 07                	jne    c0101172 <hd_rdwt+0x171>
c010116b:	b8 20 00 00 00       	mov    $0x20,%eax
c0101170:	eb 05                	jmp    c0101177 <hd_rdwt+0x176>
c0101172:	b8 30 00 00 00       	mov    $0x30,%eax
c0101177:	88 45 c3             	mov    %al,-0x3d(%ebp)
c010117a:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c010117e:	3c 20                	cmp    $0x20,%al
c0101180:	74 24                	je     c01011a6 <hd_rdwt+0x1a5>
c0101182:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c0101186:	3c 30                	cmp    $0x30,%al
c0101188:	74 1c                	je     c01011a6 <hd_rdwt+0x1a5>
c010118a:	68 c5 01 00 00       	push   $0x1c5
c010118f:	68 f4 9e 10 c0       	push   $0xc0109ef4
c0101194:	68 f4 9e 10 c0       	push   $0xc0109ef4
c0101199:	68 d4 9f 10 c0       	push   $0xc0109fd4
c010119e:	e8 8c 72 00 00       	call   c010842f <assertion_failure>
c01011a3:	83 c4 10             	add    $0x10,%esp
c01011a6:	83 ec 0c             	sub    $0xc,%esp
c01011a9:	8d 45 bd             	lea    -0x43(%ebp),%eax
c01011ac:	50                   	push   %eax
c01011ad:	e8 ca f5 ff ff       	call   c010077c <hd_cmd_out>
c01011b2:	83 c4 10             	add    $0x10,%esp
c01011b5:	e9 9c 00 00 00       	jmp    c0101256 <hd_rdwt+0x255>
c01011ba:	b8 00 02 00 00       	mov    $0x200,%eax
c01011bf:	81 7d f4 00 02 00 00 	cmpl   $0x200,-0xc(%ebp)
c01011c6:	0f 4e 45 f4          	cmovle -0xc(%ebp),%eax
c01011ca:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c01011cd:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c01011d1:	75 51                	jne    c0101224 <hd_rdwt+0x223>
c01011d3:	e8 a8 fd ff ff       	call   c0100f80 <wait_for>
c01011d8:	e8 d4 fd ff ff       	call   c0100fb1 <interrupt_wait>
c01011dd:	83 ec 04             	sub    $0x4,%esp
c01011e0:	ff 75 c4             	pushl  -0x3c(%ebp)
c01011e3:	6a 00                	push   $0x0
c01011e5:	68 80 11 11 c0       	push   $0xc0111180
c01011ea:	e8 30 9a 00 00       	call   c010ac1f <Memset>
c01011ef:	83 c4 10             	add    $0x10,%esp
c01011f2:	83 ec 04             	sub    $0x4,%esp
c01011f5:	68 00 02 00 00       	push   $0x200
c01011fa:	68 80 11 11 c0       	push   $0xc0111180
c01011ff:	68 f0 01 00 00       	push   $0x1f0
c0101204:	e8 6a 9a 00 00       	call   c010ac73 <read_port>
c0101209:	83 c4 10             	add    $0x10,%esp
c010120c:	83 ec 04             	sub    $0x4,%esp
c010120f:	ff 75 c4             	pushl  -0x3c(%ebp)
c0101212:	68 80 11 11 c0       	push   $0xc0111180
c0101217:	ff 75 f0             	pushl  -0x10(%ebp)
c010121a:	e8 37 58 00 00       	call   c0106a56 <Memcpy>
c010121f:	83 c4 10             	add    $0x10,%esp
c0101222:	eb 26                	jmp    c010124a <hd_rdwt+0x249>
c0101224:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c0101228:	75 20                	jne    c010124a <hd_rdwt+0x249>
c010122a:	e8 51 fd ff ff       	call   c0100f80 <wait_for>
c010122f:	83 ec 04             	sub    $0x4,%esp
c0101232:	ff 75 c4             	pushl  -0x3c(%ebp)
c0101235:	ff 75 f0             	pushl  -0x10(%ebp)
c0101238:	68 f0 01 00 00       	push   $0x1f0
c010123d:	e8 45 9a 00 00       	call   c010ac87 <write_port>
c0101242:	83 c4 10             	add    $0x10,%esp
c0101245:	e8 67 fd ff ff       	call   c0100fb1 <interrupt_wait>
c010124a:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c010124d:	29 45 f4             	sub    %eax,-0xc(%ebp)
c0101250:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0101253:	01 45 f0             	add    %eax,-0x10(%ebp)
c0101256:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010125a:	0f 85 5a ff ff ff    	jne    c01011ba <hd_rdwt+0x1b9>
c0101260:	83 ec 04             	sub    $0x4,%esp
c0101263:	6a 7c                	push   $0x7c
c0101265:	6a 00                	push   $0x0
c0101267:	8d 85 40 ff ff ff    	lea    -0xc0(%ebp),%eax
c010126d:	50                   	push   %eax
c010126e:	e8 ac 99 00 00       	call   c010ac1f <Memset>
c0101273:	83 c4 10             	add    $0x10,%esp
c0101276:	c7 45 b8 65 00 00 00 	movl   $0x65,-0x48(%ebp)
c010127d:	c7 85 48 ff ff ff 00 	movl   $0x0,-0xb8(%ebp)
c0101284:	00 00 00 
c0101287:	83 ec 04             	sub    $0x4,%esp
c010128a:	6a 02                	push   $0x2
c010128c:	8d 85 40 ff ff ff    	lea    -0xc0(%ebp),%eax
c0101292:	50                   	push   %eax
c0101293:	6a 01                	push   $0x1
c0101295:	e8 b2 7b 00 00       	call   c0108e4c <send_rec>
c010129a:	83 c4 10             	add    $0x10,%esp
c010129d:	90                   	nop
c010129e:	c9                   	leave  
c010129f:	c3                   	ret    

c01012a0 <hd_handler>:
c01012a0:	55                   	push   %ebp
c01012a1:	89 e5                	mov    %esp,%ebp
c01012a3:	83 ec 18             	sub    $0x18,%esp
c01012a6:	83 ec 0c             	sub    $0xc,%esp
c01012a9:	68 f7 01 00 00       	push   $0x1f7
c01012ae:	e8 da ef ff ff       	call   c010028d <in_byte>
c01012b3:	83 c4 10             	add    $0x10,%esp
c01012b6:	0f b6 c0             	movzbl %al,%eax
c01012b9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01012bc:	83 ec 0c             	sub    $0xc,%esp
c01012bf:	6a 03                	push   $0x3
c01012c1:	e8 20 7e 00 00       	call   c01090e6 <inform_int>
c01012c6:	83 c4 10             	add    $0x10,%esp
c01012c9:	90                   	nop
c01012ca:	c9                   	leave  
c01012cb:	c3                   	ret    

c01012cc <waitfor>:
c01012cc:	55                   	push   %ebp
c01012cd:	89 e5                	mov    %esp,%ebp
c01012cf:	83 ec 18             	sub    $0x18,%esp
c01012d2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01012d9:	eb 26                	jmp    c0101301 <waitfor+0x35>
c01012db:	83 ec 0c             	sub    $0xc,%esp
c01012de:	68 f7 01 00 00       	push   $0x1f7
c01012e3:	e8 a5 ef ff ff       	call   c010028d <in_byte>
c01012e8:	83 c4 10             	add    $0x10,%esp
c01012eb:	0f b6 c0             	movzbl %al,%eax
c01012ee:	23 45 08             	and    0x8(%ebp),%eax
c01012f1:	39 45 0c             	cmp    %eax,0xc(%ebp)
c01012f4:	75 07                	jne    c01012fd <waitfor+0x31>
c01012f6:	b8 01 00 00 00       	mov    $0x1,%eax
c01012fb:	eb 11                	jmp    c010130e <waitfor+0x42>
c01012fd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0101301:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101304:	3b 45 10             	cmp    0x10(%ebp),%eax
c0101307:	7c d2                	jl     c01012db <waitfor+0xf>
c0101309:	b8 00 00 00 00       	mov    $0x0,%eax
c010130e:	c9                   	leave  
c010130f:	c3                   	ret    

c0101310 <print_hd_info>:
c0101310:	55                   	push   %ebp
c0101311:	89 e5                	mov    %esp,%ebp
c0101313:	83 ec 18             	sub    $0x18,%esp
c0101316:	83 ec 0c             	sub    $0xc,%esp
c0101319:	68 08 a0 10 c0       	push   $0xc010a008
c010131e:	e8 af 6d 00 00       	call   c01080d2 <Printf>
c0101323:	83 c4 10             	add    $0x10,%esp
c0101326:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010132d:	eb 3b                	jmp    c010136a <print_hd_info+0x5a>
c010132f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101332:	8b 04 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%eax
c0101339:	85 c0                	test   %eax,%eax
c010133b:	74 28                	je     c0101365 <print_hd_info+0x55>
c010133d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101340:	8b 14 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%edx
c0101347:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010134a:	8b 04 c5 44 0f 11 c0 	mov    -0x3feef0bc(,%eax,8),%eax
c0101351:	ff 75 f4             	pushl  -0xc(%ebp)
c0101354:	52                   	push   %edx
c0101355:	50                   	push   %eax
c0101356:	68 25 a0 10 c0       	push   $0xc010a025
c010135b:	e8 72 6d 00 00       	call   c01080d2 <Printf>
c0101360:	83 c4 10             	add    $0x10,%esp
c0101363:	eb 01                	jmp    c0101366 <print_hd_info+0x56>
c0101365:	90                   	nop
c0101366:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c010136a:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c010136e:	7e bf                	jle    c010132f <print_hd_info+0x1f>
c0101370:	83 ec 0c             	sub    $0xc,%esp
c0101373:	68 3d a0 10 c0       	push   $0xc010a03d
c0101378:	e8 55 6d 00 00       	call   c01080d2 <Printf>
c010137d:	83 c4 10             	add    $0x10,%esp
c0101380:	83 ec 0c             	sub    $0xc,%esp
c0101383:	68 58 a0 10 c0       	push   $0xc010a058
c0101388:	e8 45 6d 00 00       	call   c01080d2 <Printf>
c010138d:	83 c4 10             	add    $0x10,%esp
c0101390:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%ebp)
c0101397:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c010139e:	eb 44                	jmp    c01013e4 <print_hd_info+0xd4>
c01013a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01013a3:	83 c0 04             	add    $0x4,%eax
c01013a6:	8b 04 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%eax
c01013ad:	85 c0                	test   %eax,%eax
c01013af:	74 2e                	je     c01013df <print_hd_info+0xcf>
c01013b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01013b4:	83 c0 04             	add    $0x4,%eax
c01013b7:	8b 14 c5 48 0f 11 c0 	mov    -0x3feef0b8(,%eax,8),%edx
c01013be:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01013c1:	83 c0 04             	add    $0x4,%eax
c01013c4:	8b 04 c5 44 0f 11 c0 	mov    -0x3feef0bc(,%eax,8),%eax
c01013cb:	ff 75 f0             	pushl  -0x10(%ebp)
c01013ce:	52                   	push   %edx
c01013cf:	50                   	push   %eax
c01013d0:	68 25 a0 10 c0       	push   $0xc010a025
c01013d5:	e8 f8 6c 00 00       	call   c01080d2 <Printf>
c01013da:	83 c4 10             	add    $0x10,%esp
c01013dd:	eb 01                	jmp    c01013e0 <print_hd_info+0xd0>
c01013df:	90                   	nop
c01013e0:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01013e4:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c01013e8:	7e b6                	jle    c01013a0 <print_hd_info+0x90>
c01013ea:	83 ec 0c             	sub    $0xc,%esp
c01013ed:	68 75 a0 10 c0       	push   $0xc010a075
c01013f2:	e8 db 6c 00 00       	call   c01080d2 <Printf>
c01013f7:	83 c4 10             	add    $0x10,%esp
c01013fa:	90                   	nop
c01013fb:	c9                   	leave  
c01013fc:	c3                   	ret    

c01013fd <is_empty>:
c01013fd:	55                   	push   %ebp
c01013fe:	89 e5                	mov    %esp,%ebp
c0101400:	83 ec 10             	sub    $0x10,%esp
c0101403:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c010140a:	eb 1a                	jmp    c0101426 <is_empty+0x29>
c010140c:	8b 55 fc             	mov    -0x4(%ebp),%edx
c010140f:	8b 45 08             	mov    0x8(%ebp),%eax
c0101412:	01 d0                	add    %edx,%eax
c0101414:	0f b6 00             	movzbl (%eax),%eax
c0101417:	84 c0                	test   %al,%al
c0101419:	74 07                	je     c0101422 <is_empty+0x25>
c010141b:	b8 00 00 00 00       	mov    $0x0,%eax
c0101420:	eb 11                	jmp    c0101433 <is_empty+0x36>
c0101422:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0101426:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0101429:	3b 45 0c             	cmp    0xc(%ebp),%eax
c010142c:	7c de                	jl     c010140c <is_empty+0xf>
c010142e:	b8 01 00 00 00       	mov    $0x1,%eax
c0101433:	c9                   	leave  
c0101434:	c3                   	ret    
c0101435:	66 90                	xchg   %ax,%ax
c0101437:	66 90                	xchg   %ax,%ax
c0101439:	66 90                	xchg   %ax,%ax
c010143b:	66 90                	xchg   %ax,%ax
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
c01014f0:	e8 57 79 00 00       	call   c0108e4c <send_rec>
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
c010156b:	68 94 a0 10 c0       	push   $0xc010a094
c0101570:	68 94 a0 10 c0       	push   $0xc010a094
c0101575:	68 a4 a0 10 c0       	push   $0xc010a0a4
c010157a:	e8 b0 6e 00 00       	call   c010842f <assertion_failure>
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
c01015f0:	e8 57 78 00 00       	call   c0108e4c <send_rec>
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
c0101639:	e8 0e 78 00 00       	call   c0108e4c <send_rec>
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
c0101673:	e8 d4 77 00 00       	call   c0108e4c <send_rec>
c0101678:	83 c4 10             	add    $0x10,%esp
c010167b:	eb 32                	jmp    c01016af <task_fs+0x206>
c010167d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0101680:	8b 40 68             	mov    0x68(%eax),%eax
c0101683:	83 ec 04             	sub    $0x4,%esp
c0101686:	50                   	push   %eax
c0101687:	ff 75 f4             	pushl  -0xc(%ebp)
c010168a:	6a 01                	push   $0x1
c010168c:	e8 bb 77 00 00       	call   c0108e4c <send_rec>
c0101691:	83 c4 10             	add    $0x10,%esp
c0101694:	eb 19                	jmp    c01016af <task_fs+0x206>
c0101696:	83 ec 0c             	sub    $0xc,%esp
c0101699:	68 07 a1 10 c0       	push   $0xc010a107
c010169e:	e8 6e 6d 00 00       	call   c0108411 <panic>
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
c010171f:	68 94 a0 10 c0       	push   $0xc010a094
c0101724:	68 94 a0 10 c0       	push   $0xc010a094
c0101729:	68 1a a1 10 c0       	push   $0xc010a11a
c010172e:	e8 fc 6c 00 00       	call   c010842f <assertion_failure>
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
c0101751:	68 94 a0 10 c0       	push   $0xc010a094
c0101756:	68 94 a0 10 c0       	push   $0xc010a094
c010175b:	68 38 a1 10 c0       	push   $0xc010a138
c0101760:	e8 ca 6c 00 00       	call   c010842f <assertion_failure>
c0101765:	83 c4 10             	add    $0x10,%esp
c0101768:	83 ec 04             	sub    $0x4,%esp
c010176b:	6a 03                	push   $0x3
c010176d:	ff 75 f4             	pushl  -0xc(%ebp)
c0101770:	6a 03                	push   $0x3
c0101772:	e8 d5 76 00 00       	call   c0108e4c <send_rec>
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
c01017c7:	e8 ba 45 00 00       	call   c0105d86 <get_physical_address>
c01017cc:	83 c4 10             	add    $0x10,%esp
c01017cf:	a3 84 17 11 c0       	mov    %eax,0xc0111784
c01017d4:	a1 a0 21 11 c0       	mov    0xc01121a0,%eax
c01017d9:	83 ec 0c             	sub    $0xc,%esp
c01017dc:	50                   	push   %eax
c01017dd:	e8 a4 45 00 00       	call   c0105d86 <get_physical_address>
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
c0101b3b:	c7 85 70 ff ff ff 60 	movl   $0xc010a160,-0x90(%ebp)
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
c0101c37:	e8 1a 4e 00 00       	call   c0106a56 <Memcpy>
c0101c3c:	83 c4 10             	add    $0x10,%esp
c0101c3f:	8d 95 34 ff ff ff    	lea    -0xcc(%ebp),%edx
c0101c45:	b8 00 00 00 00       	mov    $0x0,%eax
c0101c4a:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0101c4f:	89 d7                	mov    %edx,%edi
c0101c51:	f3 ab                	rep stos %eax,%es:(%edi)
c0101c53:	c7 85 34 ff ff ff 6c 	movl   $0xc010a16c,-0xcc(%ebp)
c0101c5a:	a1 10 c0 
c0101c5d:	c7 85 38 ff ff ff 75 	movl   $0xc010a175,-0xc8(%ebp)
c0101c64:	a1 10 c0 
c0101c67:	c7 85 3c ff ff ff 7e 	movl   $0xc010a17e,-0xc4(%ebp)
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
c0101cbe:	e8 93 4d 00 00       	call   c0106a56 <Memcpy>
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
c0101d32:	e8 1f 4d 00 00       	call   c0106a56 <Memcpy>
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
c0101da3:	e8 a4 70 00 00       	call   c0108e4c <send_rec>
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
c0101ded:	e8 4a 3e 00 00       	call   c0105c3c <alloc_virtual_memory>
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
c0101e0c:	e8 45 4c 00 00       	call   c0106a56 <Memcpy>
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
c0101e68:	68 94 a0 10 c0       	push   $0xc010a094
c0101e6d:	68 94 a0 10 c0       	push   $0xc010a094
c0101e72:	68 87 a1 10 c0       	push   $0xc010a187
c0101e77:	e8 b3 65 00 00       	call   c010842f <assertion_failure>
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
c0101ebd:	68 94 a0 10 c0       	push   $0xc010a094
c0101ec2:	68 94 a0 10 c0       	push   $0xc010a094
c0101ec7:	68 8f a1 10 c0       	push   $0xc010a18f
c0101ecc:	e8 5e 65 00 00       	call   c010842f <assertion_failure>
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
c0101ef5:	68 97 a1 10 c0       	push   $0xc010a197
c0101efa:	e8 12 65 00 00       	call   c0108411 <panic>
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
c0102087:	e8 27 71 00 00       	call   c01091b3 <strcmp>
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
c010256c:	68 94 a0 10 c0       	push   $0xc010a094
c0102571:	68 94 a0 10 c0       	push   $0xc010a094
c0102576:	68 a4 a1 10 c0       	push   $0xc010a1a4
c010257b:	e8 af 5e 00 00       	call   c010842f <assertion_failure>
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
c0102a35:	68 b9 a1 10 c0       	push   $0xc010a1b9
c0102a3a:	e8 74 67 00 00       	call   c01091b3 <strcmp>
c0102a3f:	83 c4 10             	add    $0x10,%esp
c0102a42:	85 c0                	test   %eax,%eax
c0102a44:	75 10                	jne    c0102a56 <do_unlink+0x31>
c0102a46:	83 ec 0c             	sub    $0xc,%esp
c0102a49:	68 bb a1 10 c0       	push   $0xc010a1bb
c0102a4e:	e8 be 59 00 00       	call   c0108411 <panic>
c0102a53:	83 c4 10             	add    $0x10,%esp
c0102a56:	83 ec 0c             	sub    $0xc,%esp
c0102a59:	ff 75 08             	pushl  0x8(%ebp)
c0102a5c:	e8 31 f5 ff ff       	call   c0101f92 <search_file>
c0102a61:	83 c4 10             	add    $0x10,%esp
c0102a64:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0102a67:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0102a6b:	75 10                	jne    c0102a7d <do_unlink+0x58>
c0102a6d:	83 ec 0c             	sub    $0xc,%esp
c0102a70:	68 d7 a1 10 c0       	push   $0xc010a1d7
c0102a75:	e8 97 59 00 00       	call   c0108411 <panic>
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
c0102a9e:	68 d7 a1 10 c0       	push   $0xc010a1d7
c0102aa3:	e8 69 59 00 00       	call   c0108411 <panic>
c0102aa8:	83 c4 10             	add    $0x10,%esp
c0102aab:	8b 45 88             	mov    -0x78(%ebp),%eax
c0102aae:	85 c0                	test   %eax,%eax
c0102ab0:	7e 10                	jle    c0102ac2 <do_unlink+0x9d>
c0102ab2:	83 ec 0c             	sub    $0xc,%esp
c0102ab5:	68 f0 a1 10 c0       	push   $0xc010a1f0
c0102aba:	e8 52 59 00 00       	call   c0108411 <panic>
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
c0102e58:	e8 56 63 00 00       	call   c01091b3 <strcmp>
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
c0102f92:	68 28 a2 10 c0       	push   $0xc010a228
c0102f97:	e8 75 54 00 00       	call   c0108411 <panic>
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
c0102fc2:	68 94 a0 10 c0       	push   $0xc010a094
c0102fc7:	68 94 a0 10 c0       	push   $0xc010a094
c0102fcc:	68 38 a2 10 c0       	push   $0xc010a238
c0102fd1:	e8 59 54 00 00       	call   c010842f <assertion_failure>
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
c0103020:	e8 27 5e 00 00       	call   c0108e4c <send_rec>
c0103025:	83 c4 10             	add    $0x10,%esp
c0103028:	8b 45 08             	mov    0x8(%ebp),%eax
c010302b:	8b 40 78             	mov    0x78(%eax),%eax
c010302e:	83 f8 66             	cmp    $0x66,%eax
c0103031:	75 13                	jne    c0103046 <do_rdwt+0x145>
c0103033:	83 ec 04             	sub    $0x4,%esp
c0103036:	ff 75 b8             	pushl  -0x48(%ebp)
c0103039:	ff 75 08             	pushl  0x8(%ebp)
c010303c:	6a 01                	push   $0x1
c010303e:	e8 09 5e 00 00       	call   c0108e4c <send_rec>
c0103043:	83 c4 10             	add    $0x10,%esp
c0103046:	8b 45 08             	mov    0x8(%ebp),%eax
c0103049:	8b 40 78             	mov    0x78(%eax),%eax
c010304c:	83 f8 65             	cmp    $0x65,%eax
c010304f:	75 13                	jne    c0103064 <do_rdwt+0x163>
c0103051:	83 ec 04             	sub    $0x4,%esp
c0103054:	ff 75 b8             	pushl  -0x48(%ebp)
c0103057:	ff 75 08             	pushl  0x8(%ebp)
c010305a:	6a 01                	push   $0x1
c010305c:	e8 eb 5d 00 00       	call   c0108e4c <send_rec>
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
c0103157:	e8 e0 2a 00 00       	call   c0105c3c <alloc_virtual_memory>
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
c01031c9:	e8 88 38 00 00       	call   c0106a56 <Memcpy>
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
c01031f0:	e8 61 38 00 00       	call   c0106a56 <Memcpy>
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
c01033b4:	e8 9d 36 00 00       	call   c0106a56 <Memcpy>
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
c01033f5:	68 94 a0 10 c0       	push   $0xc010a094
c01033fa:	68 94 a0 10 c0       	push   $0xc010a094
c01033ff:	68 6c a2 10 c0       	push   $0xc010a26c
c0103404:	e8 26 50 00 00       	call   c010842f <assertion_failure>
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
c0103523:	e8 5f 66 00 00       	call   c0109b87 <insertToDoubleLinkList>
c0103528:	83 c4 10             	add    $0x10,%esp
c010352b:	83 ec 0c             	sub    $0xc,%esp
c010352e:	68 ec fd 10 c0       	push   $0xc010fdec
c0103533:	e8 6b 64 00 00       	call   c01099a3 <isListEmpty>
c0103538:	83 c4 10             	add    $0x10,%esp
c010353b:	84 c0                	test   %al,%al
c010353d:	74 19                	je     c0103558 <schedule_process+0x80>
c010353f:	6a 1e                	push   $0x1e
c0103541:	68 7b a2 10 c0       	push   $0xc010a27b
c0103546:	68 7b a2 10 c0       	push   $0xc010a27b
c010354b:	68 85 a2 10 c0       	push   $0xc010a285
c0103550:	e8 da 4e 00 00       	call   c010842f <assertion_failure>
c0103555:	83 c4 10             	add    $0x10,%esp
c0103558:	83 ec 0c             	sub    $0xc,%esp
c010355b:	68 ec fd 10 c0       	push   $0xc010fdec
c0103560:	e8 a5 66 00 00       	call   c0109c0a <popFromDoubleLinkList>
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
c01035d2:	e8 89 63 00 00       	call   c0109960 <switch_to>
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
c01035f9:	e8 e8 5a 00 00       	call   c01090e6 <inform_int>
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
c0103a48:	e8 3f 37 00 00       	call   c010718c <init_internal_interrupt>
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
c0103cab:	e8 42 2d 00 00       	call   c01069f2 <intr_disable>
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
c0103e51:	e8 c5 2b 00 00       	call   c0106a1b <intr_set_status>
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
c0103f5e:	e8 f3 2a 00 00       	call   c0106a56 <Memcpy>
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
c0104095:	e8 b2 4d 00 00       	call   c0108e4c <send_rec>
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
c0104117:	e8 20 1b 00 00       	call   c0105c3c <alloc_virtual_memory>
c010411c:	83 c4 10             	add    $0x10,%esp
c010411f:	89 c2                	mov    %eax,%edx
c0104121:	8b 45 08             	mov    0x8(%ebp),%eax
c0104124:	89 90 18 08 00 00    	mov    %edx,0x818(%eax)
c010412a:	8b 45 08             	mov    0x8(%ebp),%eax
c010412d:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c0104133:	83 f8 02             	cmp    $0x2,%eax
c0104136:	74 1c                	je     c0104154 <tty_do_read+0xa1>
c0104138:	68 3b 01 00 00       	push   $0x13b
c010413d:	68 a1 a2 10 c0       	push   $0xc010a2a1
c0104142:	68 a1 a2 10 c0       	push   $0xc010a2a1
c0104147:	68 ab a2 10 c0       	push   $0xc010a2ab
c010414c:	e8 de 42 00 00       	call   c010842f <assertion_failure>
c0104151:	83 c4 10             	add    $0x10,%esp
c0104154:	8b 45 0c             	mov    0xc(%ebp),%eax
c0104157:	c7 40 78 67 00 00 00 	movl   $0x67,0x78(%eax)
c010415e:	8b 45 08             	mov    0x8(%ebp),%eax
c0104161:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c0104167:	83 ec 04             	sub    $0x4,%esp
c010416a:	50                   	push   %eax
c010416b:	ff 75 0c             	pushl  0xc(%ebp)
c010416e:	6a 01                	push   $0x1
c0104170:	e8 d7 4c 00 00       	call   c0108e4c <send_rec>
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
c01041f2:	e8 45 1a 00 00       	call   c0105c3c <alloc_virtual_memory>
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
c0104224:	e8 2d 28 00 00       	call   c0106a56 <Memcpy>
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
c01042be:	e8 89 4b 00 00       	call   c0108e4c <send_rec>
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
c010449f:	e8 a8 49 00 00       	call   c0108e4c <send_rec>
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
c0104966:	e8 1b 14 00 00       	call   c0105d86 <get_physical_address>
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
c01049a3:	e8 a4 44 00 00       	call   c0108e4c <send_rec>
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
c01049f2:	e8 8f 13 00 00       	call   c0105d86 <get_physical_address>
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
c0104a89:	e8 be 43 00 00       	call   c0108e4c <send_rec>
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
c0104ac3:	e8 be 12 00 00       	call   c0105d86 <get_physical_address>
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
c0104b1d:	e8 2a 43 00 00       	call   c0108e4c <send_rec>
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
c0104b68:	e8 19 12 00 00       	call   c0105d86 <get_physical_address>
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
c0104ba2:	e8 a5 42 00 00       	call   c0108e4c <send_rec>
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
c0104bed:	e8 5a 42 00 00       	call   c0108e4c <send_rec>
c0104bf2:	83 c4 10             	add    $0x10,%esp
c0104bf5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104bf8:	83 f8 65             	cmp    $0x65,%eax
c0104bfb:	74 19                	je     c0104c16 <close+0x4d>
c0104bfd:	6a 13                	push   $0x13
c0104bff:	68 c3 a2 10 c0       	push   $0xc010a2c3
c0104c04:	68 c3 a2 10 c0       	push   $0xc010a2c3
c0104c09:	68 cf a2 10 c0       	push   $0xc010a2cf
c0104c0e:	e8 1c 38 00 00       	call   c010842f <assertion_failure>
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
c0104c39:	e8 0e 42 00 00       	call   c0108e4c <send_rec>
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
c0104c83:	e8 c4 41 00 00       	call   c0108e4c <send_rec>
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
c0104cc2:	e8 85 41 00 00       	call   c0108e4c <send_rec>
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
c0104cf4:	e8 53 41 00 00       	call   c0108e4c <send_rec>
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
c0104d44:	e8 03 41 00 00       	call   c0108e4c <send_rec>
c0104d49:	83 c4 10             	add    $0x10,%esp
c0104d4c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0104d4f:	83 f8 65             	cmp    $0x65,%eax
c0104d52:	74 19                	je     c0104d6d <exec+0x6c>
c0104d54:	6a 19                	push   $0x19
c0104d56:	68 e7 a2 10 c0       	push   $0xc010a2e7
c0104d5b:	68 e7 a2 10 c0       	push   $0xc010a2e7
c0104d60:	68 f2 a2 10 c0       	push   $0xc010a2f2
c0104d65:	e8 c5 36 00 00       	call   c010842f <assertion_failure>
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
c0104dbb:	68 0a a3 10 c0       	push   $0xc010a30a
c0104dc0:	e8 0d 33 00 00       	call   c01080d2 <Printf>
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
c0104e80:	e8 01 0f 00 00       	call   c0105d86 <get_physical_address>
c0104e85:	83 c4 10             	add    $0x10,%esp
c0104e88:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0104e8b:	83 ec 0c             	sub    $0xc,%esp
c0104e8e:	ff 75 e0             	pushl  -0x20(%ebp)
c0104e91:	e8 f0 0e 00 00       	call   c0105d86 <get_physical_address>
c0104e96:	83 c4 10             	add    $0x10,%esp
c0104e99:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0104e9c:	83 ec 0c             	sub    $0xc,%esp
c0104e9f:	ff 75 dc             	pushl  -0x24(%ebp)
c0104ea2:	e8 df 0e 00 00       	call   c0105d86 <get_physical_address>
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
c0104f13:	e8 34 3f 00 00       	call   c0108e4c <send_rec>
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
c0104f3b:	68 e7 a2 10 c0       	push   $0xc010a2e7
c0104f40:	68 e7 a2 10 c0       	push   $0xc010a2e7
c0104f45:	68 f2 a2 10 c0       	push   $0xc010a2f2
c0104f4a:	e8 e0 34 00 00       	call   c010842f <assertion_failure>
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
c0104fac:	e8 9b 3e 00 00       	call   c0108e4c <send_rec>
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
c010505b:	e8 6d 05 00 00       	call   c01055cd <do_wait>
c0105060:	83 c4 10             	add    $0x10,%esp
c0105063:	eb 11                	jmp    c0105076 <TaskMM+0xfa>
c0105065:	83 ec 0c             	sub    $0xc,%esp
c0105068:	68 14 a3 10 c0       	push   $0xc010a314
c010506d:	e8 9f 33 00 00       	call   c0108411 <panic>
c0105072:	83 c4 10             	add    $0x10,%esp
c0105075:	90                   	nop
c0105076:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010507a:	0f 84 22 ff ff ff    	je     c0104fa2 <TaskMM+0x26>
c0105080:	83 ec 0c             	sub    $0xc,%esp
c0105083:	6a 03                	push   $0x3
c0105085:	e8 14 2f 00 00       	call   c0107f9e <delay>
c010508a:	83 c4 10             	add    $0x10,%esp
c010508d:	83 ec 04             	sub    $0x4,%esp
c0105090:	ff 75 e4             	pushl  -0x1c(%ebp)
c0105093:	ff 75 ec             	pushl  -0x14(%ebp)
c0105096:	6a 01                	push   $0x1
c0105098:	e8 af 3d 00 00       	call   c0108e4c <send_rec>
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
c0105161:	e8 d6 0a 00 00       	call   c0105c3c <alloc_virtual_memory>
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
c0105183:	e8 ce 18 00 00       	call   c0106a56 <Memcpy>
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
c01051b9:	68 25 a3 10 c0       	push   $0xc010a325
c01051be:	e8 0f 2f 00 00       	call   c01080d2 <Printf>
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
c01052aa:	e8 98 07 00 00       	call   c0105a47 <get_virtual_address_start_with_addr>
c01052af:	83 c4 10             	add    $0x10,%esp
c01052b2:	89 45 98             	mov    %eax,-0x68(%ebp)
c01052b5:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c01052b8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01052bb:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01052c2:	eb 41                	jmp    c0105305 <do_exec+0x241>
c01052c4:	83 ec 08             	sub    $0x8,%esp
c01052c7:	ff 75 d4             	pushl  -0x2c(%ebp)
c01052ca:	ff 75 e8             	pushl  -0x18(%ebp)
c01052cd:	e8 e6 0a 00 00       	call   c0105db8 <alloc_physical_memory_of_proc>
c01052d2:	83 c4 10             	add    $0x10,%esp
c01052d5:	89 45 94             	mov    %eax,-0x6c(%ebp)
c01052d8:	83 ec 08             	sub    $0x8,%esp
c01052db:	68 00 10 00 00       	push   $0x1000
c01052e0:	ff 75 94             	pushl  -0x6c(%ebp)
c01052e3:	e8 54 09 00 00       	call   c0105c3c <alloc_virtual_memory>
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
c0105329:	e8 28 17 00 00       	call   c0106a56 <Memcpy>
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
c010538f:	e8 a8 08 00 00       	call   c0105c3c <alloc_virtual_memory>
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
c01053e4:	e8 53 08 00 00       	call   c0105c3c <alloc_virtual_memory>
c01053e9:	83 c4 10             	add    $0x10,%esp
c01053ec:	89 85 70 ff ff ff    	mov    %eax,-0x90(%ebp)
c01053f2:	8b 95 78 ff ff ff    	mov    -0x88(%ebp),%edx
c01053f8:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
c01053fe:	83 ec 04             	sub    $0x4,%esp
c0105401:	ff 75 88             	pushl  -0x78(%ebp)
c0105404:	52                   	push   %edx
c0105405:	50                   	push   %eax
c0105406:	e8 4b 16 00 00       	call   c0106a56 <Memcpy>
c010540b:	83 c4 10             	add    $0x10,%esp
c010540e:	8b 45 08             	mov    0x8(%ebp),%eax
c0105411:	8b 40 28             	mov    0x28(%eax),%eax
c0105414:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c010541a:	83 ec 08             	sub    $0x8,%esp
c010541d:	ff 75 d4             	pushl  -0x2c(%ebp)
c0105420:	ff 75 80             	pushl  -0x80(%ebp)
c0105423:	e8 e2 08 00 00       	call   c0105d0a <get_physical_address_proc>
c0105428:	83 c4 10             	add    $0x10,%esp
c010542b:	89 85 68 ff ff ff    	mov    %eax,-0x98(%ebp)
c0105431:	83 ec 08             	sub    $0x8,%esp
c0105434:	68 00 10 00 00       	push   $0x1000
c0105439:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
c010543f:	e8 f8 07 00 00       	call   c0105c3c <alloc_virtual_memory>
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
c01054d3:	e8 74 39 00 00       	call   c0108e4c <send_rec>
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
c01054f4:	e8 35 42 00 00       	call   c010972e <fork_process>
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
c010553e:	e8 09 39 00 00       	call   c0108e4c <send_rec>
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
c0105556:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105559:	83 ec 0c             	sub    $0xc,%esp
c010555c:	ff 75 f4             	pushl  -0xc(%ebp)
c010555f:	e8 c8 e0 ff ff       	call   c010362c <pid2proc>
c0105564:	83 c4 10             	add    $0x10,%esp
c0105567:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010556a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010556d:	8b 80 64 02 00 00    	mov    0x264(%eax),%eax
c0105573:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105576:	83 ec 0c             	sub    $0xc,%esp
c0105579:	ff 75 ec             	pushl  -0x14(%ebp)
c010557c:	e8 ab e0 ff ff       	call   c010362c <pid2proc>
c0105581:	83 c4 10             	add    $0x10,%esp
c0105584:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105587:	8b 45 08             	mov    0x8(%ebp),%eax
c010558a:	8b 40 54             	mov    0x54(%eax),%eax
c010558d:	89 c2                	mov    %eax,%edx
c010558f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105592:	89 90 68 02 00 00    	mov    %edx,0x268(%eax)
c0105598:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010559b:	0f b6 80 49 02 00 00 	movzbl 0x249(%eax),%eax
c01055a2:	3c 04                	cmp    $0x4,%al
c01055a4:	75 1a                	jne    c01055c0 <do_exit+0x75>
c01055a6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01055a9:	c6 80 49 02 00 00 fb 	movb   $0xfb,0x249(%eax)
c01055b0:	83 ec 0c             	sub    $0xc,%esp
c01055b3:	ff 75 f0             	pushl  -0x10(%ebp)
c01055b6:	e8 31 01 00 00       	call   c01056ec <cleanup>
c01055bb:	83 c4 10             	add    $0x10,%esp
c01055be:	eb 0a                	jmp    c01055ca <do_exit+0x7f>
c01055c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01055c3:	c6 80 48 02 00 00 03 	movb   $0x3,0x248(%eax)
c01055ca:	90                   	nop
c01055cb:	c9                   	leave  
c01055cc:	c3                   	ret    

c01055cd <do_wait>:
c01055cd:	55                   	push   %ebp
c01055ce:	89 e5                	mov    %esp,%ebp
c01055d0:	81 ec a8 00 00 00    	sub    $0xa8,%esp
c01055d6:	8b 45 08             	mov    0x8(%ebp),%eax
c01055d9:	8b 00                	mov    (%eax),%eax
c01055db:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01055de:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01055e5:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01055ec:	83 ec 0c             	sub    $0xc,%esp
c01055ef:	ff 75 ec             	pushl  -0x14(%ebp)
c01055f2:	e8 35 e0 ff ff       	call   c010362c <pid2proc>
c01055f7:	83 c4 10             	add    $0x10,%esp
c01055fa:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01055fd:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0105601:	75 19                	jne    c010561c <do_wait+0x4f>
c0105603:	6a 56                	push   $0x56
c0105605:	68 35 a3 10 c0       	push   $0xc010a335
c010560a:	68 35 a3 10 c0       	push   $0xc010a335
c010560f:	68 43 a3 10 c0       	push   $0xc010a343
c0105614:	e8 16 2e 00 00       	call   c010842f <assertion_failure>
c0105619:	83 c4 10             	add    $0x10,%esp
c010561c:	a1 ec fd 10 c0       	mov    0xc010fdec,%eax
c0105621:	8b 15 f0 fd 10 c0    	mov    0xc010fdf0,%edx
c0105627:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010562a:	89 55 e0             	mov    %edx,-0x20(%ebp)
c010562d:	a1 f4 fd 10 c0       	mov    0xc010fdf4,%eax
c0105632:	8b 15 f8 fd 10 c0    	mov    0xc010fdf8,%edx
c0105638:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010563b:	89 55 d8             	mov    %edx,-0x28(%ebp)
c010563e:	a1 f0 fd 10 c0       	mov    0xc010fdf0,%eax
c0105643:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105646:	eb 5b                	jmp    c01056a3 <do_wait+0xd6>
c0105648:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010564b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105650:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105653:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105656:	8b 80 64 02 00 00    	mov    0x264(%eax),%eax
c010565c:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c010565f:	74 0b                	je     c010566c <do_wait+0x9f>
c0105661:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105664:	8b 40 04             	mov    0x4(%eax),%eax
c0105667:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010566a:	eb 37                	jmp    c01056a3 <do_wait+0xd6>
c010566c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0105670:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105673:	0f b6 80 49 02 00 00 	movzbl 0x249(%eax),%eax
c010567a:	3c 03                	cmp    $0x3,%al
c010567c:	74 0b                	je     c0105689 <do_wait+0xbc>
c010567e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105681:	8b 40 04             	mov    0x4(%eax),%eax
c0105684:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105687:	eb 1a                	jmp    c01056a3 <do_wait+0xd6>
c0105689:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010568c:	c6 80 49 02 00 00 fb 	movb   $0xfb,0x249(%eax)
c0105693:	83 ec 0c             	sub    $0xc,%esp
c0105696:	ff 75 e8             	pushl  -0x18(%ebp)
c0105699:	e8 4e 00 00 00       	call   c01056ec <cleanup>
c010569e:	83 c4 10             	add    $0x10,%esp
c01056a1:	eb 47                	jmp    c01056ea <do_wait+0x11d>
c01056a3:	81 7d f0 f4 fd 10 c0 	cmpl   $0xc010fdf4,-0x10(%ebp)
c01056aa:	75 9c                	jne    c0105648 <do_wait+0x7b>
c01056ac:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01056b0:	74 0c                	je     c01056be <do_wait+0xf1>
c01056b2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01056b5:	c6 80 49 02 00 00 04 	movb   $0x4,0x249(%eax)
c01056bc:	eb 2c                	jmp    c01056ea <do_wait+0x11d>
c01056be:	c7 45 d0 65 00 00 00 	movl   $0x65,-0x30(%ebp)
c01056c5:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
c01056cc:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
c01056d3:	83 ec 04             	sub    $0x4,%esp
c01056d6:	ff 75 ec             	pushl  -0x14(%ebp)
c01056d9:	8d 85 58 ff ff ff    	lea    -0xa8(%ebp),%eax
c01056df:	50                   	push   %eax
c01056e0:	6a 01                	push   $0x1
c01056e2:	e8 65 37 00 00       	call   c0108e4c <send_rec>
c01056e7:	83 c4 10             	add    $0x10,%esp
c01056ea:	c9                   	leave  
c01056eb:	c3                   	ret    

c01056ec <cleanup>:
c01056ec:	55                   	push   %ebp
c01056ed:	89 e5                	mov    %esp,%ebp
c01056ef:	81 ec 88 00 00 00    	sub    $0x88,%esp
c01056f5:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c01056fc:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0105703:	8b 45 08             	mov    0x8(%ebp),%eax
c0105706:	8b 80 64 02 00 00    	mov    0x264(%eax),%eax
c010570c:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010570f:	8b 45 08             	mov    0x8(%ebp),%eax
c0105712:	8b 80 68 02 00 00    	mov    0x268(%eax),%eax
c0105718:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010571b:	8b 45 08             	mov    0x8(%ebp),%eax
c010571e:	8b 80 64 02 00 00    	mov    0x264(%eax),%eax
c0105724:	83 ec 04             	sub    $0x4,%esp
c0105727:	50                   	push   %eax
c0105728:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c010572e:	50                   	push   %eax
c010572f:	6a 01                	push   $0x1
c0105731:	e8 16 37 00 00       	call   c0108e4c <send_rec>
c0105736:	83 c4 10             	add    $0x10,%esp
c0105739:	8b 45 08             	mov    0x8(%ebp),%eax
c010573c:	c6 80 48 02 00 00 ff 	movb   $0xff,0x248(%eax)
c0105743:	90                   	nop
c0105744:	c9                   	leave  
c0105745:	c3                   	ret    

c0105746 <init_bitmap>:
c0105746:	55                   	push   %ebp
c0105747:	89 e5                	mov    %esp,%ebp
c0105749:	83 ec 08             	sub    $0x8,%esp
c010574c:	8b 45 08             	mov    0x8(%ebp),%eax
c010574f:	8b 50 04             	mov    0x4(%eax),%edx
c0105752:	8b 45 08             	mov    0x8(%ebp),%eax
c0105755:	8b 00                	mov    (%eax),%eax
c0105757:	83 ec 04             	sub    $0x4,%esp
c010575a:	52                   	push   %edx
c010575b:	6a 00                	push   $0x0
c010575d:	50                   	push   %eax
c010575e:	e8 bc 54 00 00       	call   c010ac1f <Memset>
c0105763:	83 c4 10             	add    $0x10,%esp
c0105766:	90                   	nop
c0105767:	c9                   	leave  
c0105768:	c3                   	ret    

c0105769 <test_bit_val>:
c0105769:	55                   	push   %ebp
c010576a:	89 e5                	mov    %esp,%ebp
c010576c:	53                   	push   %ebx
c010576d:	83 ec 10             	sub    $0x10,%esp
c0105770:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105773:	8d 50 07             	lea    0x7(%eax),%edx
c0105776:	85 c0                	test   %eax,%eax
c0105778:	0f 48 c2             	cmovs  %edx,%eax
c010577b:	c1 f8 03             	sar    $0x3,%eax
c010577e:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105781:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105784:	99                   	cltd   
c0105785:	c1 ea 1d             	shr    $0x1d,%edx
c0105788:	01 d0                	add    %edx,%eax
c010578a:	83 e0 07             	and    $0x7,%eax
c010578d:	29 d0                	sub    %edx,%eax
c010578f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105792:	8b 45 08             	mov    0x8(%ebp),%eax
c0105795:	8b 10                	mov    (%eax),%edx
c0105797:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010579a:	01 d0                	add    %edx,%eax
c010579c:	0f b6 00             	movzbl (%eax),%eax
c010579f:	88 45 f3             	mov    %al,-0xd(%ebp)
c01057a2:	0f be 55 f3          	movsbl -0xd(%ebp),%edx
c01057a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01057a9:	bb 01 00 00 00       	mov    $0x1,%ebx
c01057ae:	89 c1                	mov    %eax,%ecx
c01057b0:	d3 e3                	shl    %cl,%ebx
c01057b2:	89 d8                	mov    %ebx,%eax
c01057b4:	21 c2                	and    %eax,%edx
c01057b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01057b9:	89 c1                	mov    %eax,%ecx
c01057bb:	d3 fa                	sar    %cl,%edx
c01057bd:	89 d0                	mov    %edx,%eax
c01057bf:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01057c2:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c01057c6:	0f 9f c0             	setg   %al
c01057c9:	0f b6 c0             	movzbl %al,%eax
c01057cc:	83 c4 10             	add    $0x10,%esp
c01057cf:	5b                   	pop    %ebx
c01057d0:	5d                   	pop    %ebp
c01057d1:	c3                   	ret    

c01057d2 <set_bit_val>:
c01057d2:	55                   	push   %ebp
c01057d3:	89 e5                	mov    %esp,%ebp
c01057d5:	83 ec 10             	sub    $0x10,%esp
c01057d8:	8b 45 0c             	mov    0xc(%ebp),%eax
c01057db:	8d 50 07             	lea    0x7(%eax),%edx
c01057de:	85 c0                	test   %eax,%eax
c01057e0:	0f 48 c2             	cmovs  %edx,%eax
c01057e3:	c1 f8 03             	sar    $0x3,%eax
c01057e6:	89 45 f8             	mov    %eax,-0x8(%ebp)
c01057e9:	8b 45 0c             	mov    0xc(%ebp),%eax
c01057ec:	99                   	cltd   
c01057ed:	c1 ea 1d             	shr    $0x1d,%edx
c01057f0:	01 d0                	add    %edx,%eax
c01057f2:	83 e0 07             	and    $0x7,%eax
c01057f5:	29 d0                	sub    %edx,%eax
c01057f7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01057fa:	8b 45 08             	mov    0x8(%ebp),%eax
c01057fd:	8b 10                	mov    (%eax),%edx
c01057ff:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105802:	01 d0                	add    %edx,%eax
c0105804:	0f b6 00             	movzbl (%eax),%eax
c0105807:	88 45 ff             	mov    %al,-0x1(%ebp)
c010580a:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c010580e:	7e 13                	jle    c0105823 <set_bit_val+0x51>
c0105810:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105813:	ba 01 00 00 00       	mov    $0x1,%edx
c0105818:	89 c1                	mov    %eax,%ecx
c010581a:	d3 e2                	shl    %cl,%edx
c010581c:	89 d0                	mov    %edx,%eax
c010581e:	08 45 ff             	or     %al,-0x1(%ebp)
c0105821:	eb 13                	jmp    c0105836 <set_bit_val+0x64>
c0105823:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105826:	ba 01 00 00 00       	mov    $0x1,%edx
c010582b:	89 c1                	mov    %eax,%ecx
c010582d:	d3 e2                	shl    %cl,%edx
c010582f:	89 d0                	mov    %edx,%eax
c0105831:	f7 d0                	not    %eax
c0105833:	20 45 ff             	and    %al,-0x1(%ebp)
c0105836:	8b 45 08             	mov    0x8(%ebp),%eax
c0105839:	8b 10                	mov    (%eax),%edx
c010583b:	8b 45 f8             	mov    -0x8(%ebp),%eax
c010583e:	01 c2                	add    %eax,%edx
c0105840:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
c0105844:	88 02                	mov    %al,(%edx)
c0105846:	b8 01 00 00 00       	mov    $0x1,%eax
c010584b:	c9                   	leave  
c010584c:	c3                   	ret    

c010584d <set_bits>:
c010584d:	55                   	push   %ebp
c010584e:	89 e5                	mov    %esp,%ebp
c0105850:	83 ec 10             	sub    $0x10,%esp
c0105853:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c010585a:	eb 1c                	jmp    c0105878 <set_bits+0x2b>
c010585c:	8b 45 0c             	mov    0xc(%ebp),%eax
c010585f:	8d 50 01             	lea    0x1(%eax),%edx
c0105862:	89 55 0c             	mov    %edx,0xc(%ebp)
c0105865:	ff 75 10             	pushl  0x10(%ebp)
c0105868:	50                   	push   %eax
c0105869:	ff 75 08             	pushl  0x8(%ebp)
c010586c:	e8 61 ff ff ff       	call   c01057d2 <set_bit_val>
c0105871:	83 c4 0c             	add    $0xc,%esp
c0105874:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0105878:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010587b:	3b 45 14             	cmp    0x14(%ebp),%eax
c010587e:	7c dc                	jl     c010585c <set_bits+0xf>
c0105880:	b8 01 00 00 00       	mov    $0x1,%eax
c0105885:	c9                   	leave  
c0105886:	c3                   	ret    

c0105887 <get_first_free_bit>:
c0105887:	55                   	push   %ebp
c0105888:	89 e5                	mov    %esp,%ebp
c010588a:	83 ec 10             	sub    $0x10,%esp
c010588d:	8b 45 08             	mov    0x8(%ebp),%eax
c0105890:	8b 40 04             	mov    0x4(%eax),%eax
c0105893:	c1 e0 03             	shl    $0x3,%eax
c0105896:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105899:	8b 45 0c             	mov    0xc(%ebp),%eax
c010589c:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010589f:	eb 1b                	jmp    c01058bc <get_first_free_bit+0x35>
c01058a1:	ff 75 fc             	pushl  -0x4(%ebp)
c01058a4:	ff 75 08             	pushl  0x8(%ebp)
c01058a7:	e8 bd fe ff ff       	call   c0105769 <test_bit_val>
c01058ac:	83 c4 08             	add    $0x8,%esp
c01058af:	85 c0                	test   %eax,%eax
c01058b1:	75 05                	jne    c01058b8 <get_first_free_bit+0x31>
c01058b3:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01058b6:	eb 11                	jmp    c01058c9 <get_first_free_bit+0x42>
c01058b8:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c01058bc:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01058bf:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c01058c2:	7c dd                	jl     c01058a1 <get_first_free_bit+0x1a>
c01058c4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c01058c9:	c9                   	leave  
c01058ca:	c3                   	ret    

c01058cb <get_bits>:
c01058cb:	55                   	push   %ebp
c01058cc:	89 e5                	mov    %esp,%ebp
c01058ce:	83 ec 20             	sub    $0x20,%esp
c01058d1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c01058d8:	ff 75 f0             	pushl  -0x10(%ebp)
c01058db:	ff 75 08             	pushl  0x8(%ebp)
c01058de:	e8 a4 ff ff ff       	call   c0105887 <get_first_free_bit>
c01058e3:	83 c4 08             	add    $0x8,%esp
c01058e6:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01058e9:	8b 45 08             	mov    0x8(%ebp),%eax
c01058ec:	8b 40 04             	mov    0x4(%eax),%eax
c01058ef:	c1 e0 03             	shl    $0x3,%eax
c01058f2:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01058f5:	8b 45 0c             	mov    0xc(%ebp),%eax
c01058f8:	83 e8 01             	sub    $0x1,%eax
c01058fb:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01058fe:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c0105902:	75 08                	jne    c010590c <get_bits+0x41>
c0105904:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105907:	e9 85 00 00 00       	jmp    c0105991 <get_bits+0xc6>
c010590c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010590f:	83 c0 01             	add    $0x1,%eax
c0105912:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105915:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105918:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010591b:	eb 58                	jmp    c0105975 <get_bits+0xaa>
c010591d:	ff 75 f8             	pushl  -0x8(%ebp)
c0105920:	ff 75 08             	pushl  0x8(%ebp)
c0105923:	e8 41 fe ff ff       	call   c0105769 <test_bit_val>
c0105928:	83 c4 08             	add    $0x8,%esp
c010592b:	85 c0                	test   %eax,%eax
c010592d:	75 0a                	jne    c0105939 <get_bits+0x6e>
c010592f:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0105933:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0105937:	eb 2b                	jmp    c0105964 <get_bits+0x99>
c0105939:	6a 00                	push   $0x0
c010593b:	ff 75 08             	pushl  0x8(%ebp)
c010593e:	e8 44 ff ff ff       	call   c0105887 <get_first_free_bit>
c0105943:	83 c4 08             	add    $0x8,%esp
c0105946:	83 c0 01             	add    $0x1,%eax
c0105949:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010594c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010594f:	83 c0 01             	add    $0x1,%eax
c0105952:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105955:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105958:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010595b:	8b 45 0c             	mov    0xc(%ebp),%eax
c010595e:	83 e8 01             	sub    $0x1,%eax
c0105961:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105964:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105967:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c010596a:	7c 09                	jl     c0105975 <get_bits+0xaa>
c010596c:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c0105973:	eb 0d                	jmp    c0105982 <get_bits+0xb7>
c0105975:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105978:	8d 50 ff             	lea    -0x1(%eax),%edx
c010597b:	89 55 fc             	mov    %edx,-0x4(%ebp)
c010597e:	85 c0                	test   %eax,%eax
c0105980:	7f 9b                	jg     c010591d <get_bits+0x52>
c0105982:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105985:	2b 45 0c             	sub    0xc(%ebp),%eax
c0105988:	83 c0 01             	add    $0x1,%eax
c010598b:	89 45 f8             	mov    %eax,-0x8(%ebp)
c010598e:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105991:	c9                   	leave  
c0105992:	c3                   	ret    

c0105993 <get_a_page>:
c0105993:	55                   	push   %ebp
c0105994:	89 e5                	mov    %esp,%ebp
c0105996:	83 ec 28             	sub    $0x28,%esp
c0105999:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c010599d:	75 22                	jne    c01059c1 <get_a_page+0x2e>
c010599f:	a1 ac 06 11 c0       	mov    0xc01106ac,%eax
c01059a4:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01059a7:	a1 b0 06 11 c0       	mov    0xc01106b0,%eax
c01059ac:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01059af:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c01059b4:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01059b7:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c01059bc:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01059bf:	eb 20                	jmp    c01059e1 <get_a_page+0x4e>
c01059c1:	a1 f4 0e 11 c0       	mov    0xc0110ef4,%eax
c01059c6:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01059c9:	a1 f8 0e 11 c0       	mov    0xc0110ef8,%eax
c01059ce:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01059d1:	a1 fc 0e 11 c0       	mov    0xc0110efc,%eax
c01059d6:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01059d9:	a1 00 0f 11 c0       	mov    0xc0110f00,%eax
c01059de:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01059e1:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01059e4:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01059e7:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01059ea:	89 55 dc             	mov    %edx,-0x24(%ebp)
c01059ed:	6a 01                	push   $0x1
c01059ef:	8d 45 d8             	lea    -0x28(%ebp),%eax
c01059f2:	50                   	push   %eax
c01059f3:	e8 d3 fe ff ff       	call   c01058cb <get_bits>
c01059f8:	83 c4 08             	add    $0x8,%esp
c01059fb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01059fe:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c0105a02:	75 1c                	jne    c0105a20 <get_a_page+0x8d>
c0105a04:	68 84 00 00 00       	push   $0x84
c0105a09:	68 56 a3 10 c0       	push   $0xc010a356
c0105a0e:	68 56 a3 10 c0       	push   $0xc010a356
c0105a13:	68 60 a3 10 c0       	push   $0xc010a360
c0105a18:	e8 12 2a 00 00       	call   c010842f <assertion_failure>
c0105a1d:	83 c4 10             	add    $0x10,%esp
c0105a20:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105a23:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0105a26:	c1 e2 0c             	shl    $0xc,%edx
c0105a29:	01 d0                	add    %edx,%eax
c0105a2b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105a2e:	83 ec 04             	sub    $0x4,%esp
c0105a31:	6a 01                	push   $0x1
c0105a33:	ff 75 f4             	pushl  -0xc(%ebp)
c0105a36:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105a39:	50                   	push   %eax
c0105a3a:	e8 93 fd ff ff       	call   c01057d2 <set_bit_val>
c0105a3f:	83 c4 10             	add    $0x10,%esp
c0105a42:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105a45:	c9                   	leave  
c0105a46:	c3                   	ret    

c0105a47 <get_virtual_address_start_with_addr>:
c0105a47:	55                   	push   %ebp
c0105a48:	89 e5                	mov    %esp,%ebp
c0105a4a:	83 ec 38             	sub    $0x38,%esp
c0105a4d:	e8 45 a9 ff ff       	call   c0100397 <get_running_thread_pcb>
c0105a52:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105a55:	83 ec 0c             	sub    $0xc,%esp
c0105a58:	ff 75 10             	pushl  0x10(%ebp)
c0105a5b:	e8 cc db ff ff       	call   c010362c <pid2proc>
c0105a60:	83 c4 10             	add    $0x10,%esp
c0105a63:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105a66:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105a69:	8b 40 0c             	mov    0xc(%eax),%eax
c0105a6c:	83 ec 04             	sub    $0x4,%esp
c0105a6f:	6a 0c                	push   $0xc
c0105a71:	50                   	push   %eax
c0105a72:	8d 45 dc             	lea    -0x24(%ebp),%eax
c0105a75:	50                   	push   %eax
c0105a76:	e8 db 0f 00 00       	call   c0106a56 <Memcpy>
c0105a7b:	83 c4 10             	add    $0x10,%esp
c0105a7e:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105a81:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0105a84:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0105a87:	89 55 d8             	mov    %edx,-0x28(%ebp)
c0105a8a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105a8d:	8b 55 08             	mov    0x8(%ebp),%edx
c0105a90:	29 c2                	sub    %eax,%edx
c0105a92:	89 d0                	mov    %edx,%eax
c0105a94:	c1 e8 0c             	shr    $0xc,%eax
c0105a97:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105a9a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0105a9e:	79 1c                	jns    c0105abc <get_virtual_address_start_with_addr+0x75>
c0105aa0:	68 97 00 00 00       	push   $0x97
c0105aa5:	68 56 a3 10 c0       	push   $0xc010a356
c0105aaa:	68 56 a3 10 c0       	push   $0xc010a356
c0105aaf:	68 6c a3 10 c0       	push   $0xc010a36c
c0105ab4:	e8 76 29 00 00       	call   c010842f <assertion_failure>
c0105ab9:	83 c4 10             	add    $0x10,%esp
c0105abc:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105abf:	50                   	push   %eax
c0105ac0:	6a 01                	push   $0x1
c0105ac2:	ff 75 ec             	pushl  -0x14(%ebp)
c0105ac5:	8d 45 d4             	lea    -0x2c(%ebp),%eax
c0105ac8:	50                   	push   %eax
c0105ac9:	e8 7f fd ff ff       	call   c010584d <set_bits>
c0105ace:	83 c4 10             	add    $0x10,%esp
c0105ad1:	8b 45 08             	mov    0x8(%ebp),%eax
c0105ad4:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105ad9:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105adc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105adf:	c9                   	leave  
c0105ae0:	c3                   	ret    

c0105ae1 <get_virtual_address>:
c0105ae1:	55                   	push   %ebp
c0105ae2:	89 e5                	mov    %esp,%ebp
c0105ae4:	83 ec 28             	sub    $0x28,%esp
c0105ae7:	e8 ab a8 ff ff       	call   c0100397 <get_running_thread_pcb>
c0105aec:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105aef:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0105af3:	75 1a                	jne    c0105b0f <get_virtual_address+0x2e>
c0105af5:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0105afa:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105afd:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0105b02:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105b05:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c0105b0a:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105b0d:	eb 18                	jmp    c0105b27 <get_virtual_address+0x46>
c0105b0f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105b12:	8b 40 0c             	mov    0xc(%eax),%eax
c0105b15:	83 ec 04             	sub    $0x4,%esp
c0105b18:	6a 0c                	push   $0xc
c0105b1a:	50                   	push   %eax
c0105b1b:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0105b1e:	50                   	push   %eax
c0105b1f:	e8 32 0f 00 00       	call   c0106a56 <Memcpy>
c0105b24:	83 c4 10             	add    $0x10,%esp
c0105b27:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105b2a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0105b2d:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105b30:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0105b33:	8b 45 08             	mov    0x8(%ebp),%eax
c0105b36:	83 ec 08             	sub    $0x8,%esp
c0105b39:	50                   	push   %eax
c0105b3a:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105b3d:	50                   	push   %eax
c0105b3e:	e8 88 fd ff ff       	call   c01058cb <get_bits>
c0105b43:	83 c4 10             	add    $0x10,%esp
c0105b46:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105b49:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105b4c:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0105b4f:	c1 e2 0c             	shl    $0xc,%edx
c0105b52:	01 d0                	add    %edx,%eax
c0105b54:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105b57:	8b 45 08             	mov    0x8(%ebp),%eax
c0105b5a:	50                   	push   %eax
c0105b5b:	6a 01                	push   $0x1
c0105b5d:	ff 75 f0             	pushl  -0x10(%ebp)
c0105b60:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0105b63:	50                   	push   %eax
c0105b64:	e8 e4 fc ff ff       	call   c010584d <set_bits>
c0105b69:	83 c4 10             	add    $0x10,%esp
c0105b6c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105b6f:	c9                   	leave  
c0105b70:	c3                   	ret    

c0105b71 <ptr_pde>:
c0105b71:	55                   	push   %ebp
c0105b72:	89 e5                	mov    %esp,%ebp
c0105b74:	8b 45 08             	mov    0x8(%ebp),%eax
c0105b77:	c1 e8 16             	shr    $0x16,%eax
c0105b7a:	05 00 fc ff 3f       	add    $0x3ffffc00,%eax
c0105b7f:	c1 e0 02             	shl    $0x2,%eax
c0105b82:	5d                   	pop    %ebp
c0105b83:	c3                   	ret    

c0105b84 <ptr_pte>:
c0105b84:	55                   	push   %ebp
c0105b85:	89 e5                	mov    %esp,%ebp
c0105b87:	8b 45 08             	mov    0x8(%ebp),%eax
c0105b8a:	c1 e8 0a             	shr    $0xa,%eax
c0105b8d:	25 00 f0 3f 00       	and    $0x3ff000,%eax
c0105b92:	89 c2                	mov    %eax,%edx
c0105b94:	8b 45 08             	mov    0x8(%ebp),%eax
c0105b97:	c1 e8 0c             	shr    $0xc,%eax
c0105b9a:	25 ff 03 00 00       	and    $0x3ff,%eax
c0105b9f:	c1 e0 02             	shl    $0x2,%eax
c0105ba2:	01 d0                	add    %edx,%eax
c0105ba4:	2d 00 00 40 00       	sub    $0x400000,%eax
c0105ba9:	5d                   	pop    %ebp
c0105baa:	c3                   	ret    

c0105bab <add_map_entry>:
c0105bab:	55                   	push   %ebp
c0105bac:	89 e5                	mov    %esp,%ebp
c0105bae:	83 ec 18             	sub    $0x18,%esp
c0105bb1:	ff 75 08             	pushl  0x8(%ebp)
c0105bb4:	e8 b8 ff ff ff       	call   c0105b71 <ptr_pde>
c0105bb9:	83 c4 04             	add    $0x4,%esp
c0105bbc:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105bbf:	ff 75 08             	pushl  0x8(%ebp)
c0105bc2:	e8 bd ff ff ff       	call   c0105b84 <ptr_pte>
c0105bc7:	83 c4 04             	add    $0x4,%esp
c0105bca:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105bcd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105bd0:	8b 00                	mov    (%eax),%eax
c0105bd2:	83 e0 01             	and    $0x1,%eax
c0105bd5:	85 c0                	test   %eax,%eax
c0105bd7:	74 1b                	je     c0105bf4 <add_map_entry+0x49>
c0105bd9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105bdc:	8b 00                	mov    (%eax),%eax
c0105bde:	83 e0 01             	and    $0x1,%eax
c0105be1:	85 c0                	test   %eax,%eax
c0105be3:	75 54                	jne    c0105c39 <add_map_entry+0x8e>
c0105be5:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105be8:	83 c8 07             	or     $0x7,%eax
c0105beb:	89 c2                	mov    %eax,%edx
c0105bed:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105bf0:	89 10                	mov    %edx,(%eax)
c0105bf2:	eb 45                	jmp    c0105c39 <add_map_entry+0x8e>
c0105bf4:	83 ec 0c             	sub    $0xc,%esp
c0105bf7:	6a 00                	push   $0x0
c0105bf9:	e8 95 fd ff ff       	call   c0105993 <get_a_page>
c0105bfe:	83 c4 10             	add    $0x10,%esp
c0105c01:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105c04:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105c07:	83 c8 07             	or     $0x7,%eax
c0105c0a:	89 c2                	mov    %eax,%edx
c0105c0c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105c0f:	89 10                	mov    %edx,(%eax)
c0105c11:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105c14:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105c19:	83 ec 04             	sub    $0x4,%esp
c0105c1c:	68 00 10 00 00       	push   $0x1000
c0105c21:	6a 00                	push   $0x0
c0105c23:	50                   	push   %eax
c0105c24:	e8 f6 4f 00 00       	call   c010ac1f <Memset>
c0105c29:	83 c4 10             	add    $0x10,%esp
c0105c2c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105c2f:	83 c8 07             	or     $0x7,%eax
c0105c32:	89 c2                	mov    %eax,%edx
c0105c34:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105c37:	89 10                	mov    %edx,(%eax)
c0105c39:	90                   	nop
c0105c3a:	c9                   	leave  
c0105c3b:	c3                   	ret    

c0105c3c <alloc_virtual_memory>:
c0105c3c:	55                   	push   %ebp
c0105c3d:	89 e5                	mov    %esp,%ebp
c0105c3f:	83 ec 28             	sub    $0x28,%esp
c0105c42:	8b 45 08             	mov    0x8(%ebp),%eax
c0105c45:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105c4a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105c4d:	8b 45 08             	mov    0x8(%ebp),%eax
c0105c50:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0105c53:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105c56:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105c59:	01 45 e4             	add    %eax,-0x1c(%ebp)
c0105c5c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105c5f:	05 ff 0f 00 00       	add    $0xfff,%eax
c0105c64:	c1 e8 0c             	shr    $0xc,%eax
c0105c67:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105c6a:	e8 28 a7 ff ff       	call   c0100397 <get_running_thread_pcb>
c0105c6f:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105c72:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105c75:	8b 40 08             	mov    0x8(%eax),%eax
c0105c78:	85 c0                	test   %eax,%eax
c0105c7a:	75 09                	jne    c0105c85 <alloc_virtual_memory+0x49>
c0105c7c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0105c83:	eb 07                	jmp    c0105c8c <alloc_virtual_memory+0x50>
c0105c85:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0105c8c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0105c93:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0105c9a:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0105ca1:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0105ca8:	eb 47                	jmp    c0105cf1 <alloc_virtual_memory+0xb5>
c0105caa:	83 ec 08             	sub    $0x8,%esp
c0105cad:	ff 75 f0             	pushl  -0x10(%ebp)
c0105cb0:	6a 01                	push   $0x1
c0105cb2:	e8 2a fe ff ff       	call   c0105ae1 <get_virtual_address>
c0105cb7:	83 c4 10             	add    $0x10,%esp
c0105cba:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105cbd:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0105cc1:	74 13                	je     c0105cd6 <alloc_virtual_memory+0x9a>
c0105cc3:	83 ec 0c             	sub    $0xc,%esp
c0105cc6:	ff 75 f0             	pushl  -0x10(%ebp)
c0105cc9:	e8 c5 fc ff ff       	call   c0105993 <get_a_page>
c0105cce:	83 c4 10             	add    $0x10,%esp
c0105cd1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105cd4:	eb 06                	jmp    c0105cdc <alloc_virtual_memory+0xa0>
c0105cd6:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0105cd9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105cdc:	83 ec 08             	sub    $0x8,%esp
c0105cdf:	ff 75 f4             	pushl  -0xc(%ebp)
c0105ce2:	ff 75 d8             	pushl  -0x28(%ebp)
c0105ce5:	e8 c1 fe ff ff       	call   c0105bab <add_map_entry>
c0105cea:	83 c4 10             	add    $0x10,%esp
c0105ced:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0105cf1:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0105cf4:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c0105cf7:	72 b1                	jb     c0105caa <alloc_virtual_memory+0x6e>
c0105cf9:	8b 45 08             	mov    0x8(%ebp),%eax
c0105cfc:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105d01:	89 c2                	mov    %eax,%edx
c0105d03:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105d06:	01 d0                	add    %edx,%eax
c0105d08:	c9                   	leave  
c0105d09:	c3                   	ret    

c0105d0a <get_physical_address_proc>:
c0105d0a:	55                   	push   %ebp
c0105d0b:	89 e5                	mov    %esp,%ebp
c0105d0d:	83 ec 18             	sub    $0x18,%esp
c0105d10:	e8 a6 a5 ff ff       	call   c01002bb <disable_int>
c0105d15:	e8 7d a6 ff ff       	call   c0100397 <get_running_thread_pcb>
c0105d1a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105d1d:	83 ec 0c             	sub    $0xc,%esp
c0105d20:	ff 75 0c             	pushl  0xc(%ebp)
c0105d23:	e8 04 d9 ff ff       	call   c010362c <pid2proc>
c0105d28:	83 c4 10             	add    $0x10,%esp
c0105d2b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105d2e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105d31:	8b 40 08             	mov    0x8(%eax),%eax
c0105d34:	83 ec 0c             	sub    $0xc,%esp
c0105d37:	50                   	push   %eax
c0105d38:	e8 3e a6 ff ff       	call   c010037b <update_cr3>
c0105d3d:	83 c4 10             	add    $0x10,%esp
c0105d40:	83 ec 0c             	sub    $0xc,%esp
c0105d43:	ff 75 08             	pushl  0x8(%ebp)
c0105d46:	e8 39 fe ff ff       	call   c0105b84 <ptr_pte>
c0105d4b:	83 c4 10             	add    $0x10,%esp
c0105d4e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105d51:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105d54:	8b 00                	mov    (%eax),%eax
c0105d56:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105d5b:	89 c2                	mov    %eax,%edx
c0105d5d:	8b 45 08             	mov    0x8(%ebp),%eax
c0105d60:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105d65:	09 d0                	or     %edx,%eax
c0105d67:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105d6a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0105d6d:	8b 40 08             	mov    0x8(%eax),%eax
c0105d70:	83 ec 0c             	sub    $0xc,%esp
c0105d73:	50                   	push   %eax
c0105d74:	e8 02 a6 ff ff       	call   c010037b <update_cr3>
c0105d79:	83 c4 10             	add    $0x10,%esp
c0105d7c:	e8 3c a5 ff ff       	call   c01002bd <enable_int>
c0105d81:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105d84:	c9                   	leave  
c0105d85:	c3                   	ret    

c0105d86 <get_physical_address>:
c0105d86:	55                   	push   %ebp
c0105d87:	89 e5                	mov    %esp,%ebp
c0105d89:	83 ec 10             	sub    $0x10,%esp
c0105d8c:	ff 75 08             	pushl  0x8(%ebp)
c0105d8f:	e8 f0 fd ff ff       	call   c0105b84 <ptr_pte>
c0105d94:	83 c4 04             	add    $0x4,%esp
c0105d97:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0105d9a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0105d9d:	8b 00                	mov    (%eax),%eax
c0105d9f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105da4:	89 c2                	mov    %eax,%edx
c0105da6:	8b 45 08             	mov    0x8(%ebp),%eax
c0105da9:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105dae:	09 d0                	or     %edx,%eax
c0105db0:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0105db3:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0105db6:	c9                   	leave  
c0105db7:	c3                   	ret    

c0105db8 <alloc_physical_memory_of_proc>:
c0105db8:	55                   	push   %ebp
c0105db9:	89 e5                	mov    %esp,%ebp
c0105dbb:	83 ec 48             	sub    $0x48,%esp
c0105dbe:	e8 f8 a4 ff ff       	call   c01002bb <disable_int>
c0105dc3:	8b 45 08             	mov    0x8(%ebp),%eax
c0105dc6:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105dcb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105dce:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0105dd5:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105dd8:	83 ec 0c             	sub    $0xc,%esp
c0105ddb:	50                   	push   %eax
c0105ddc:	e8 4b d8 ff ff       	call   c010362c <pid2proc>
c0105de1:	83 c4 10             	add    $0x10,%esp
c0105de4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105de7:	e8 ab a5 ff ff       	call   c0100397 <get_running_thread_pcb>
c0105dec:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105def:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105df2:	8b 40 0c             	mov    0xc(%eax),%eax
c0105df5:	83 ec 04             	sub    $0x4,%esp
c0105df8:	6a 0c                	push   $0xc
c0105dfa:	50                   	push   %eax
c0105dfb:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0105dfe:	50                   	push   %eax
c0105dff:	e8 52 0c 00 00       	call   c0106a56 <Memcpy>
c0105e04:	83 c4 10             	add    $0x10,%esp
c0105e07:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0105e0a:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0105e0d:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0105e10:	89 55 c8             	mov    %edx,-0x38(%ebp)
c0105e13:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0105e16:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0105e19:	29 c2                	sub    %eax,%edx
c0105e1b:	89 d0                	mov    %edx,%eax
c0105e1d:	c1 e8 0c             	shr    $0xc,%eax
c0105e20:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105e23:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0105e26:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0105e29:	c1 e2 0c             	shl    $0xc,%edx
c0105e2c:	01 d0                	add    %edx,%eax
c0105e2e:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105e31:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105e34:	6a 01                	push   $0x1
c0105e36:	6a 01                	push   $0x1
c0105e38:	50                   	push   %eax
c0105e39:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0105e3c:	50                   	push   %eax
c0105e3d:	e8 0b fa ff ff       	call   c010584d <set_bits>
c0105e42:	83 c4 10             	add    $0x10,%esp
c0105e45:	83 ec 0c             	sub    $0xc,%esp
c0105e48:	ff 75 f0             	pushl  -0x10(%ebp)
c0105e4b:	e8 43 fb ff ff       	call   c0105993 <get_a_page>
c0105e50:	83 c4 10             	add    $0x10,%esp
c0105e53:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105e56:	8b 45 08             	mov    0x8(%ebp),%eax
c0105e59:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105e5e:	89 c2                	mov    %eax,%edx
c0105e60:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105e63:	01 d0                	add    %edx,%eax
c0105e65:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105e68:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105e6b:	8b 40 08             	mov    0x8(%eax),%eax
c0105e6e:	83 ec 0c             	sub    $0xc,%esp
c0105e71:	50                   	push   %eax
c0105e72:	e8 04 a5 ff ff       	call   c010037b <update_cr3>
c0105e77:	83 c4 10             	add    $0x10,%esp
c0105e7a:	83 ec 08             	sub    $0x8,%esp
c0105e7d:	ff 75 dc             	pushl  -0x24(%ebp)
c0105e80:	ff 75 f4             	pushl  -0xc(%ebp)
c0105e83:	e8 23 fd ff ff       	call   c0105bab <add_map_entry>
c0105e88:	83 c4 10             	add    $0x10,%esp
c0105e8b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0105e8e:	8b 40 08             	mov    0x8(%eax),%eax
c0105e91:	83 ec 0c             	sub    $0xc,%esp
c0105e94:	50                   	push   %eax
c0105e95:	e8 e1 a4 ff ff       	call   c010037b <update_cr3>
c0105e9a:	83 c4 10             	add    $0x10,%esp
c0105e9d:	e8 1b a4 ff ff       	call   c01002bd <enable_int>
c0105ea2:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0105ea5:	c9                   	leave  
c0105ea6:	c3                   	ret    

c0105ea7 <alloc_physical_memory>:
c0105ea7:	55                   	push   %ebp
c0105ea8:	89 e5                	mov    %esp,%ebp
c0105eaa:	83 ec 38             	sub    $0x38,%esp
c0105ead:	8b 45 08             	mov    0x8(%ebp),%eax
c0105eb0:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105eb5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105eb8:	e8 da a4 ff ff       	call   c0100397 <get_running_thread_pcb>
c0105ebd:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105ec0:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0105ec4:	75 1a                	jne    c0105ee0 <alloc_physical_memory+0x39>
c0105ec6:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0105ecb:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0105ece:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0105ed3:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0105ed6:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c0105edb:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0105ede:	eb 18                	jmp    c0105ef8 <alloc_physical_memory+0x51>
c0105ee0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105ee3:	8b 40 0c             	mov    0xc(%eax),%eax
c0105ee6:	83 ec 04             	sub    $0x4,%esp
c0105ee9:	6a 0c                	push   $0xc
c0105eeb:	50                   	push   %eax
c0105eec:	8d 45 d4             	lea    -0x2c(%ebp),%eax
c0105eef:	50                   	push   %eax
c0105ef0:	e8 61 0b 00 00       	call   c0106a56 <Memcpy>
c0105ef5:	83 c4 10             	add    $0x10,%esp
c0105ef8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0105efb:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0105efe:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0105f01:	89 55 d0             	mov    %edx,-0x30(%ebp)
c0105f04:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105f07:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0105f0a:	29 c2                	sub    %eax,%edx
c0105f0c:	89 d0                	mov    %edx,%eax
c0105f0e:	c1 e8 0c             	shr    $0xc,%eax
c0105f11:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105f14:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0105f17:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0105f1a:	c1 e2 0c             	shl    $0xc,%edx
c0105f1d:	01 d0                	add    %edx,%eax
c0105f1f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0105f22:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0105f25:	6a 01                	push   $0x1
c0105f27:	6a 01                	push   $0x1
c0105f29:	50                   	push   %eax
c0105f2a:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0105f2d:	50                   	push   %eax
c0105f2e:	e8 1a f9 ff ff       	call   c010584d <set_bits>
c0105f33:	83 c4 10             	add    $0x10,%esp
c0105f36:	83 ec 0c             	sub    $0xc,%esp
c0105f39:	ff 75 0c             	pushl  0xc(%ebp)
c0105f3c:	e8 52 fa ff ff       	call   c0105993 <get_a_page>
c0105f41:	83 c4 10             	add    $0x10,%esp
c0105f44:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0105f47:	8b 45 08             	mov    0x8(%ebp),%eax
c0105f4a:	25 ff 0f 00 00       	and    $0xfff,%eax
c0105f4f:	89 c2                	mov    %eax,%edx
c0105f51:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0105f54:	01 d0                	add    %edx,%eax
c0105f56:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0105f59:	83 ec 08             	sub    $0x8,%esp
c0105f5c:	ff 75 e4             	pushl  -0x1c(%ebp)
c0105f5f:	ff 75 f4             	pushl  -0xc(%ebp)
c0105f62:	e8 44 fc ff ff       	call   c0105bab <add_map_entry>
c0105f67:	83 c4 10             	add    $0x10,%esp
c0105f6a:	8b 45 08             	mov    0x8(%ebp),%eax
c0105f6d:	c9                   	leave  
c0105f6e:	c3                   	ret    

c0105f6f <alloc_memory>:
c0105f6f:	55                   	push   %ebp
c0105f70:	89 e5                	mov    %esp,%ebp
c0105f72:	83 ec 18             	sub    $0x18,%esp
c0105f75:	83 ec 08             	sub    $0x8,%esp
c0105f78:	ff 75 0c             	pushl  0xc(%ebp)
c0105f7b:	ff 75 08             	pushl  0x8(%ebp)
c0105f7e:	e8 5e fb ff ff       	call   c0105ae1 <get_virtual_address>
c0105f83:	83 c4 10             	add    $0x10,%esp
c0105f86:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105f89:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105f8c:	2d 00 10 00 00       	sub    $0x1000,%eax
c0105f91:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105f94:	eb 29                	jmp    c0105fbf <alloc_memory+0x50>
c0105f96:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c0105f9d:	83 ec 0c             	sub    $0xc,%esp
c0105fa0:	ff 75 0c             	pushl  0xc(%ebp)
c0105fa3:	e8 eb f9 ff ff       	call   c0105993 <get_a_page>
c0105fa8:	83 c4 10             	add    $0x10,%esp
c0105fab:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0105fae:	83 ec 08             	sub    $0x8,%esp
c0105fb1:	ff 75 ec             	pushl  -0x14(%ebp)
c0105fb4:	ff 75 f4             	pushl  -0xc(%ebp)
c0105fb7:	e8 ef fb ff ff       	call   c0105bab <add_map_entry>
c0105fbc:	83 c4 10             	add    $0x10,%esp
c0105fbf:	8b 45 08             	mov    0x8(%ebp),%eax
c0105fc2:	8d 50 ff             	lea    -0x1(%eax),%edx
c0105fc5:	89 55 08             	mov    %edx,0x8(%ebp)
c0105fc8:	85 c0                	test   %eax,%eax
c0105fca:	75 ca                	jne    c0105f96 <alloc_memory+0x27>
c0105fcc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0105fcf:	c9                   	leave  
c0105fd0:	c3                   	ret    

c0105fd1 <get_a_virtual_page>:
c0105fd1:	55                   	push   %ebp
c0105fd2:	89 e5                	mov    %esp,%ebp
c0105fd4:	83 ec 18             	sub    $0x18,%esp
c0105fd7:	83 ec 0c             	sub    $0xc,%esp
c0105fda:	ff 75 08             	pushl  0x8(%ebp)
c0105fdd:	e8 b1 f9 ff ff       	call   c0105993 <get_a_page>
c0105fe2:	83 c4 10             	add    $0x10,%esp
c0105fe5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0105fe8:	8b 45 0c             	mov    0xc(%ebp),%eax
c0105feb:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0105ff0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0105ff3:	83 ec 08             	sub    $0x8,%esp
c0105ff6:	ff 75 f4             	pushl  -0xc(%ebp)
c0105ff9:	ff 75 f0             	pushl  -0x10(%ebp)
c0105ffc:	e8 aa fb ff ff       	call   c0105bab <add_map_entry>
c0106001:	83 c4 10             	add    $0x10,%esp
c0106004:	8b 45 0c             	mov    0xc(%ebp),%eax
c0106007:	c9                   	leave  
c0106008:	c3                   	ret    

c0106009 <block2arena>:
c0106009:	55                   	push   %ebp
c010600a:	89 e5                	mov    %esp,%ebp
c010600c:	83 ec 10             	sub    $0x10,%esp
c010600f:	8b 45 08             	mov    0x8(%ebp),%eax
c0106012:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0106017:	89 45 fc             	mov    %eax,-0x4(%ebp)
c010601a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010601d:	c9                   	leave  
c010601e:	c3                   	ret    

c010601f <sys_malloc2>:
c010601f:	55                   	push   %ebp
c0106020:	89 e5                	mov    %esp,%ebp
c0106022:	83 ec 68             	sub    $0x68,%esp
c0106025:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010602c:	e8 66 a3 ff ff       	call   c0100397 <get_running_thread_pcb>
c0106031:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0106034:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106037:	8b 40 08             	mov    0x8(%eax),%eax
c010603a:	85 c0                	test   %eax,%eax
c010603c:	75 10                	jne    c010604e <sys_malloc2+0x2f>
c010603e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0106045:	c7 45 ec a0 37 18 c0 	movl   $0xc01837a0,-0x14(%ebp)
c010604c:	eb 10                	jmp    c010605e <sys_malloc2+0x3f>
c010604e:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0106055:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0106058:	83 c0 10             	add    $0x10,%eax
c010605b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010605e:	81 7d 08 00 04 00 00 	cmpl   $0x400,0x8(%ebp)
c0106065:	76 52                	jbe    c01060b9 <sys_malloc2+0x9a>
c0106067:	8b 45 08             	mov    0x8(%ebp),%eax
c010606a:	05 0b 10 00 00       	add    $0x100b,%eax
c010606f:	c1 e8 0c             	shr    $0xc,%eax
c0106072:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0106075:	83 ec 08             	sub    $0x8,%esp
c0106078:	ff 75 f0             	pushl  -0x10(%ebp)
c010607b:	ff 75 d8             	pushl  -0x28(%ebp)
c010607e:	e8 ec fe ff ff       	call   c0105f6f <alloc_memory>
c0106083:	83 c4 10             	add    $0x10,%esp
c0106086:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106089:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010608c:	89 45 d0             	mov    %eax,-0x30(%ebp)
c010608f:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106092:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0106098:	8b 45 d0             	mov    -0x30(%ebp),%eax
c010609b:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c01060a2:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01060a5:	c6 40 08 01          	movb   $0x1,0x8(%eax)
c01060a9:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01060ac:	05 90 00 00 00       	add    $0x90,%eax
c01060b1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01060b4:	e9 f0 01 00 00       	jmp    c01062a9 <sys_malloc2+0x28a>
c01060b9:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01060c0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c01060c7:	eb 26                	jmp    c01060ef <sys_malloc2+0xd0>
c01060c9:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01060cc:	89 d0                	mov    %edx,%eax
c01060ce:	01 c0                	add    %eax,%eax
c01060d0:	01 d0                	add    %edx,%eax
c01060d2:	c1 e0 03             	shl    $0x3,%eax
c01060d5:	89 c2                	mov    %eax,%edx
c01060d7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01060da:	01 d0                	add    %edx,%eax
c01060dc:	8b 00                	mov    (%eax),%eax
c01060de:	39 45 08             	cmp    %eax,0x8(%ebp)
c01060e1:	77 08                	ja     c01060eb <sys_malloc2+0xcc>
c01060e3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01060e6:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01060e9:	eb 0a                	jmp    c01060f5 <sys_malloc2+0xd6>
c01060eb:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c01060ef:	83 7d e4 09          	cmpl   $0x9,-0x1c(%ebp)
c01060f3:	7e d4                	jle    c01060c9 <sys_malloc2+0xaa>
c01060f5:	83 ec 08             	sub    $0x8,%esp
c01060f8:	ff 75 f0             	pushl  -0x10(%ebp)
c01060fb:	6a 01                	push   $0x1
c01060fd:	e8 6d fe ff ff       	call   c0105f6f <alloc_memory>
c0106102:	83 c4 10             	add    $0x10,%esp
c0106105:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0106108:	8b 55 e8             	mov    -0x18(%ebp),%edx
c010610b:	89 d0                	mov    %edx,%eax
c010610d:	01 c0                	add    %eax,%eax
c010610f:	01 d0                	add    %edx,%eax
c0106111:	c1 e0 03             	shl    $0x3,%eax
c0106114:	89 c2                	mov    %eax,%edx
c0106116:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106119:	01 d0                	add    %edx,%eax
c010611b:	83 ec 04             	sub    $0x4,%esp
c010611e:	6a 18                	push   $0x18
c0106120:	50                   	push   %eax
c0106121:	ff 75 cc             	pushl  -0x34(%ebp)
c0106124:	e8 2d 09 00 00       	call   c0106a56 <Memcpy>
c0106129:	83 c4 10             	add    $0x10,%esp
c010612c:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0106133:	e8 ba 08 00 00       	call   c01069f2 <intr_disable>
c0106138:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c010613b:	8b 55 e8             	mov    -0x18(%ebp),%edx
c010613e:	89 d0                	mov    %edx,%eax
c0106140:	01 c0                	add    %eax,%eax
c0106142:	01 d0                	add    %edx,%eax
c0106144:	c1 e0 03             	shl    $0x3,%eax
c0106147:	89 c2                	mov    %eax,%edx
c0106149:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010614c:	01 d0                	add    %edx,%eax
c010614e:	83 c0 08             	add    $0x8,%eax
c0106151:	83 ec 0c             	sub    $0xc,%esp
c0106154:	50                   	push   %eax
c0106155:	e8 49 38 00 00       	call   c01099a3 <isListEmpty>
c010615a:	83 c4 10             	add    $0x10,%esp
c010615d:	3c 01                	cmp    $0x1,%al
c010615f:	0f 85 c1 00 00 00    	jne    c0106226 <sys_malloc2+0x207>
c0106165:	c7 45 c8 01 00 00 00 	movl   $0x1,-0x38(%ebp)
c010616c:	83 ec 08             	sub    $0x8,%esp
c010616f:	ff 75 f0             	pushl  -0x10(%ebp)
c0106172:	6a 01                	push   $0x1
c0106174:	e8 f6 fd ff ff       	call   c0105f6f <alloc_memory>
c0106179:	83 c4 10             	add    $0x10,%esp
c010617c:	89 45 c0             	mov    %eax,-0x40(%ebp)
c010617f:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0106182:	83 ec 0c             	sub    $0xc,%esp
c0106185:	50                   	push   %eax
c0106186:	e8 7e fe ff ff       	call   c0106009 <block2arena>
c010618b:	83 c4 10             	add    $0x10,%esp
c010618e:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0106191:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0106194:	89 d0                	mov    %edx,%eax
c0106196:	01 c0                	add    %eax,%eax
c0106198:	01 d0                	add    %edx,%eax
c010619a:	c1 e0 03             	shl    $0x3,%eax
c010619d:	89 c2                	mov    %eax,%edx
c010619f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01061a2:	01 d0                	add    %edx,%eax
c01061a4:	8b 50 04             	mov    0x4(%eax),%edx
c01061a7:	8b 45 bc             	mov    -0x44(%ebp),%eax
c01061aa:	89 50 04             	mov    %edx,0x4(%eax)
c01061ad:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01061b0:	8b 00                	mov    (%eax),%eax
c01061b2:	89 45 b8             	mov    %eax,-0x48(%ebp)
c01061b5:	c7 45 b4 0c 00 00 00 	movl   $0xc,-0x4c(%ebp)
c01061bc:	b8 00 10 00 00       	mov    $0x1000,%eax
c01061c1:	2b 45 b4             	sub    -0x4c(%ebp),%eax
c01061c4:	ba 00 00 00 00       	mov    $0x0,%edx
c01061c9:	f7 75 b8             	divl   -0x48(%ebp)
c01061cc:	89 45 b0             	mov    %eax,-0x50(%ebp)
c01061cf:	8b 55 c0             	mov    -0x40(%ebp),%edx
c01061d2:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c01061d5:	01 d0                	add    %edx,%eax
c01061d7:	89 45 ac             	mov    %eax,-0x54(%ebp)
c01061da:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c01061e1:	eb 3b                	jmp    c010621e <sys_malloc2+0x1ff>
c01061e3:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01061e6:	0f af 45 b8          	imul   -0x48(%ebp),%eax
c01061ea:	89 c2                	mov    %eax,%edx
c01061ec:	8b 45 ac             	mov    -0x54(%ebp),%eax
c01061ef:	01 d0                	add    %edx,%eax
c01061f1:	89 45 a8             	mov    %eax,-0x58(%ebp)
c01061f4:	8b 4d a8             	mov    -0x58(%ebp),%ecx
c01061f7:	8b 55 e8             	mov    -0x18(%ebp),%edx
c01061fa:	89 d0                	mov    %edx,%eax
c01061fc:	01 c0                	add    %eax,%eax
c01061fe:	01 d0                	add    %edx,%eax
c0106200:	c1 e0 03             	shl    $0x3,%eax
c0106203:	89 c2                	mov    %eax,%edx
c0106205:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106208:	01 d0                	add    %edx,%eax
c010620a:	83 c0 08             	add    $0x8,%eax
c010620d:	83 ec 08             	sub    $0x8,%esp
c0106210:	51                   	push   %ecx
c0106211:	50                   	push   %eax
c0106212:	e8 89 38 00 00       	call   c0109aa0 <appendToDoubleLinkList>
c0106217:	83 c4 10             	add    $0x10,%esp
c010621a:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c010621e:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0106221:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c0106224:	77 bd                	ja     c01061e3 <sys_malloc2+0x1c4>
c0106226:	83 ec 0c             	sub    $0xc,%esp
c0106229:	ff 75 c4             	pushl  -0x3c(%ebp)
c010622c:	e8 ea 07 00 00       	call   c0106a1b <intr_set_status>
c0106231:	83 c4 10             	add    $0x10,%esp
c0106234:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0106237:	89 d0                	mov    %edx,%eax
c0106239:	01 c0                	add    %eax,%eax
c010623b:	01 d0                	add    %edx,%eax
c010623d:	c1 e0 03             	shl    $0x3,%eax
c0106240:	89 c2                	mov    %eax,%edx
c0106242:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106245:	01 d0                	add    %edx,%eax
c0106247:	83 c0 08             	add    $0x8,%eax
c010624a:	83 ec 0c             	sub    $0xc,%esp
c010624d:	50                   	push   %eax
c010624e:	e8 b7 39 00 00       	call   c0109c0a <popFromDoubleLinkList>
c0106253:	83 c4 10             	add    $0x10,%esp
c0106256:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0106259:	8b 45 a8             	mov    -0x58(%ebp),%eax
c010625c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010625f:	83 7d a8 00          	cmpl   $0x0,-0x58(%ebp)
c0106263:	75 1c                	jne    c0106281 <sys_malloc2+0x262>
c0106265:	68 ef 01 00 00       	push   $0x1ef
c010626a:	68 56 a3 10 c0       	push   $0xc010a356
c010626f:	68 56 a3 10 c0       	push   $0xc010a356
c0106274:	68 77 a3 10 c0       	push   $0xc010a377
c0106279:	e8 b1 21 00 00       	call   c010842f <assertion_failure>
c010627e:	83 c4 10             	add    $0x10,%esp
c0106281:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0106284:	83 ec 0c             	sub    $0xc,%esp
c0106287:	50                   	push   %eax
c0106288:	e8 7c fd ff ff       	call   c0106009 <block2arena>
c010628d:	83 c4 10             	add    $0x10,%esp
c0106290:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0106293:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0106296:	8b 40 04             	mov    0x4(%eax),%eax
c0106299:	8d 50 ff             	lea    -0x1(%eax),%edx
c010629c:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c010629f:	89 50 04             	mov    %edx,0x4(%eax)
c01062a2:	c7 45 c4 04 00 00 00 	movl   $0x4,-0x3c(%ebp)
c01062a9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c01062ad:	75 1c                	jne    c01062cb <sys_malloc2+0x2ac>
c01062af:	68 f6 01 00 00       	push   $0x1f6
c01062b4:	68 56 a3 10 c0       	push   $0xc010a356
c01062b9:	68 56 a3 10 c0       	push   $0xc010a356
c01062be:	68 89 a3 10 c0       	push   $0xc010a389
c01062c3:	e8 67 21 00 00       	call   c010842f <assertion_failure>
c01062c8:	83 c4 10             	add    $0x10,%esp
c01062cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01062ce:	c9                   	leave  
c01062cf:	c3                   	ret    

c01062d0 <remove_map_entry>:
c01062d0:	55                   	push   %ebp
c01062d1:	89 e5                	mov    %esp,%ebp
c01062d3:	83 ec 10             	sub    $0x10,%esp
c01062d6:	ff 75 08             	pushl  0x8(%ebp)
c01062d9:	e8 a6 f8 ff ff       	call   c0105b84 <ptr_pte>
c01062de:	83 c4 04             	add    $0x4,%esp
c01062e1:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01062e4:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01062e7:	8b 10                	mov    (%eax),%edx
c01062e9:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01062ec:	89 10                	mov    %edx,(%eax)
c01062ee:	90                   	nop
c01062ef:	c9                   	leave  
c01062f0:	c3                   	ret    

c01062f1 <free_a_page>:
c01062f1:	55                   	push   %ebp
c01062f2:	89 e5                	mov    %esp,%ebp
c01062f4:	83 ec 20             	sub    $0x20,%esp
c01062f7:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01062fb:	75 21                	jne    c010631e <free_a_page+0x2d>
c01062fd:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0106302:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106305:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c010630a:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010630d:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c0106312:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106315:	c7 45 fc ac 06 11 c0 	movl   $0xc01106ac,-0x4(%ebp)
c010631c:	eb 1f                	jmp    c010633d <free_a_page+0x4c>
c010631e:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0106323:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106326:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c010632b:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010632e:	a1 9c f7 10 c0       	mov    0xc010f79c,%eax
c0106333:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106336:	c7 45 fc f4 0e 11 c0 	movl   $0xc0110ef4,-0x4(%ebp)
c010633d:	8b 45 08             	mov    0x8(%ebp),%eax
c0106340:	c1 e8 0c             	shr    $0xc,%eax
c0106343:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0106346:	6a 00                	push   $0x0
c0106348:	ff 75 f8             	pushl  -0x8(%ebp)
c010634b:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c010634e:	50                   	push   %eax
c010634f:	e8 7e f4 ff ff       	call   c01057d2 <set_bit_val>
c0106354:	83 c4 0c             	add    $0xc,%esp
c0106357:	ff 75 08             	pushl  0x8(%ebp)
c010635a:	e8 27 fa ff ff       	call   c0105d86 <get_physical_address>
c010635f:	83 c4 04             	add    $0x4,%esp
c0106362:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106365:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106368:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c010636e:	85 c0                	test   %eax,%eax
c0106370:	0f 48 c2             	cmovs  %edx,%eax
c0106373:	c1 f8 0c             	sar    $0xc,%eax
c0106376:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0106379:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010637c:	6a 00                	push   $0x0
c010637e:	ff 75 f0             	pushl  -0x10(%ebp)
c0106381:	50                   	push   %eax
c0106382:	e8 4b f4 ff ff       	call   c01057d2 <set_bit_val>
c0106387:	83 c4 0c             	add    $0xc,%esp
c010638a:	ff 75 08             	pushl  0x8(%ebp)
c010638d:	e8 3e ff ff ff       	call   c01062d0 <remove_map_entry>
c0106392:	83 c4 04             	add    $0x4,%esp
c0106395:	90                   	nop
c0106396:	c9                   	leave  
c0106397:	c3                   	ret    

c0106398 <sys_free2>:
c0106398:	55                   	push   %ebp
c0106399:	89 e5                	mov    %esp,%ebp
c010639b:	83 ec 58             	sub    $0x58,%esp
c010639e:	e8 f4 9f ff ff       	call   c0100397 <get_running_thread_pcb>
c01063a3:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01063a6:	e8 47 06 00 00       	call   c01069f2 <intr_disable>
c01063ab:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01063ae:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01063b1:	8b 40 08             	mov    0x8(%eax),%eax
c01063b4:	85 c0                	test   %eax,%eax
c01063b6:	75 10                	jne    c01063c8 <sys_free2+0x30>
c01063b8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01063bf:	c7 45 f0 a0 37 18 c0 	movl   $0xc01837a0,-0x10(%ebp)
c01063c6:	eb 10                	jmp    c01063d8 <sys_free2+0x40>
c01063c8:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c01063cf:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01063d2:	83 c0 10             	add    $0x10,%eax
c01063d5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01063d8:	81 7d 0c 00 04 00 00 	cmpl   $0x400,0xc(%ebp)
c01063df:	76 4d                	jbe    c010642e <sys_free2+0x96>
c01063e1:	8b 45 08             	mov    0x8(%ebp),%eax
c01063e4:	83 e8 0c             	sub    $0xc,%eax
c01063e7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01063ea:	83 45 0c 0c          	addl   $0xc,0xc(%ebp)
c01063ee:	8b 45 0c             	mov    0xc(%ebp),%eax
c01063f1:	05 ff 0f 00 00       	add    $0xfff,%eax
c01063f6:	c1 e8 0c             	shr    $0xc,%eax
c01063f9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01063fc:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0106403:	eb 1c                	jmp    c0106421 <sys_free2+0x89>
c0106405:	83 ec 08             	sub    $0x8,%esp
c0106408:	ff 75 f4             	pushl  -0xc(%ebp)
c010640b:	ff 75 ec             	pushl  -0x14(%ebp)
c010640e:	e8 de fe ff ff       	call   c01062f1 <free_a_page>
c0106413:	83 c4 10             	add    $0x10,%esp
c0106416:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
c010641d:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0106421:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106424:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
c0106427:	77 dc                	ja     c0106405 <sys_free2+0x6d>
c0106429:	e9 dc 00 00 00       	jmp    c010650a <sys_free2+0x172>
c010642e:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0106435:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c010643c:	eb 26                	jmp    c0106464 <sys_free2+0xcc>
c010643e:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0106441:	89 d0                	mov    %edx,%eax
c0106443:	01 c0                	add    %eax,%eax
c0106445:	01 d0                	add    %edx,%eax
c0106447:	c1 e0 03             	shl    $0x3,%eax
c010644a:	89 c2                	mov    %eax,%edx
c010644c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010644f:	01 d0                	add    %edx,%eax
c0106451:	8b 00                	mov    (%eax),%eax
c0106453:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0106456:	77 08                	ja     c0106460 <sys_free2+0xc8>
c0106458:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010645b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010645e:	eb 0a                	jmp    c010646a <sys_free2+0xd2>
c0106460:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0106464:	83 7d e0 09          	cmpl   $0x9,-0x20(%ebp)
c0106468:	7e d4                	jle    c010643e <sys_free2+0xa6>
c010646a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c010646d:	89 d0                	mov    %edx,%eax
c010646f:	01 c0                	add    %eax,%eax
c0106471:	01 d0                	add    %edx,%eax
c0106473:	c1 e0 03             	shl    $0x3,%eax
c0106476:	89 c2                	mov    %eax,%edx
c0106478:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010647b:	01 d0                	add    %edx,%eax
c010647d:	8b 10                	mov    (%eax),%edx
c010647f:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c0106482:	8b 50 04             	mov    0x4(%eax),%edx
c0106485:	89 55 b8             	mov    %edx,-0x48(%ebp)
c0106488:	8b 50 08             	mov    0x8(%eax),%edx
c010648b:	89 55 bc             	mov    %edx,-0x44(%ebp)
c010648e:	8b 50 0c             	mov    0xc(%eax),%edx
c0106491:	89 55 c0             	mov    %edx,-0x40(%ebp)
c0106494:	8b 50 10             	mov    0x10(%eax),%edx
c0106497:	89 55 c4             	mov    %edx,-0x3c(%ebp)
c010649a:	8b 40 14             	mov    0x14(%eax),%eax
c010649d:	89 45 c8             	mov    %eax,-0x38(%ebp)
c01064a0:	8b 45 08             	mov    0x8(%ebp),%eax
c01064a3:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01064a6:	83 ec 0c             	sub    $0xc,%esp
c01064a9:	ff 75 d0             	pushl  -0x30(%ebp)
c01064ac:	e8 58 fb ff ff       	call   c0106009 <block2arena>
c01064b1:	83 c4 10             	add    $0x10,%esp
c01064b4:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01064b7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01064ba:	89 d0                	mov    %edx,%eax
c01064bc:	01 c0                	add    %eax,%eax
c01064be:	01 d0                	add    %edx,%eax
c01064c0:	c1 e0 03             	shl    $0x3,%eax
c01064c3:	89 c2                	mov    %eax,%edx
c01064c5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01064c8:	01 d0                	add    %edx,%eax
c01064ca:	83 c0 08             	add    $0x8,%eax
c01064cd:	83 ec 08             	sub    $0x8,%esp
c01064d0:	ff 75 d0             	pushl  -0x30(%ebp)
c01064d3:	50                   	push   %eax
c01064d4:	e8 c7 35 00 00       	call   c0109aa0 <appendToDoubleLinkList>
c01064d9:	83 c4 10             	add    $0x10,%esp
c01064dc:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01064df:	8b 40 04             	mov    0x4(%eax),%eax
c01064e2:	8d 50 01             	lea    0x1(%eax),%edx
c01064e5:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01064e8:	89 50 04             	mov    %edx,0x4(%eax)
c01064eb:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01064ee:	8b 50 04             	mov    0x4(%eax),%edx
c01064f1:	8b 45 b8             	mov    -0x48(%ebp),%eax
c01064f4:	39 c2                	cmp    %eax,%edx
c01064f6:	75 12                	jne    c010650a <sys_free2+0x172>
c01064f8:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01064fb:	83 ec 08             	sub    $0x8,%esp
c01064fe:	ff 75 f4             	pushl  -0xc(%ebp)
c0106501:	50                   	push   %eax
c0106502:	e8 ea fd ff ff       	call   c01062f1 <free_a_page>
c0106507:	83 c4 10             	add    $0x10,%esp
c010650a:	83 ec 0c             	sub    $0xc,%esp
c010650d:	ff 75 d8             	pushl  -0x28(%ebp)
c0106510:	e8 06 05 00 00       	call   c0106a1b <intr_set_status>
c0106515:	83 c4 10             	add    $0x10,%esp
c0106518:	90                   	nop
c0106519:	c9                   	leave  
c010651a:	c3                   	ret    

c010651b <init_memory_block_desc>:
c010651b:	55                   	push   %ebp
c010651c:	89 e5                	mov    %esp,%ebp
c010651e:	83 ec 18             	sub    $0x18,%esp
c0106521:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106528:	e9 b2 00 00 00       	jmp    c01065df <init_memory_block_desc+0xc4>
c010652d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0106531:	75 1b                	jne    c010654e <init_memory_block_desc+0x33>
c0106533:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106536:	89 d0                	mov    %edx,%eax
c0106538:	01 c0                	add    %eax,%eax
c010653a:	01 d0                	add    %edx,%eax
c010653c:	c1 e0 03             	shl    $0x3,%eax
c010653f:	89 c2                	mov    %eax,%edx
c0106541:	8b 45 08             	mov    0x8(%ebp),%eax
c0106544:	01 d0                	add    %edx,%eax
c0106546:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c010654c:	eb 2e                	jmp    c010657c <init_memory_block_desc+0x61>
c010654e:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106551:	89 d0                	mov    %edx,%eax
c0106553:	01 c0                	add    %eax,%eax
c0106555:	01 d0                	add    %edx,%eax
c0106557:	c1 e0 03             	shl    $0x3,%eax
c010655a:	8d 50 e8             	lea    -0x18(%eax),%edx
c010655d:	8b 45 08             	mov    0x8(%ebp),%eax
c0106560:	01 d0                	add    %edx,%eax
c0106562:	8b 08                	mov    (%eax),%ecx
c0106564:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106567:	89 d0                	mov    %edx,%eax
c0106569:	01 c0                	add    %eax,%eax
c010656b:	01 d0                	add    %edx,%eax
c010656d:	c1 e0 03             	shl    $0x3,%eax
c0106570:	89 c2                	mov    %eax,%edx
c0106572:	8b 45 08             	mov    0x8(%ebp),%eax
c0106575:	01 d0                	add    %edx,%eax
c0106577:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
c010657a:	89 10                	mov    %edx,(%eax)
c010657c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010657f:	89 d0                	mov    %edx,%eax
c0106581:	01 c0                	add    %eax,%eax
c0106583:	01 d0                	add    %edx,%eax
c0106585:	c1 e0 03             	shl    $0x3,%eax
c0106588:	89 c2                	mov    %eax,%edx
c010658a:	8b 45 08             	mov    0x8(%ebp),%eax
c010658d:	01 d0                	add    %edx,%eax
c010658f:	8b 00                	mov    (%eax),%eax
c0106591:	89 c1                	mov    %eax,%ecx
c0106593:	b8 f4 0f 00 00       	mov    $0xff4,%eax
c0106598:	ba 00 00 00 00       	mov    $0x0,%edx
c010659d:	f7 f1                	div    %ecx
c010659f:	89 c1                	mov    %eax,%ecx
c01065a1:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01065a4:	89 d0                	mov    %edx,%eax
c01065a6:	01 c0                	add    %eax,%eax
c01065a8:	01 d0                	add    %edx,%eax
c01065aa:	c1 e0 03             	shl    $0x3,%eax
c01065ad:	89 c2                	mov    %eax,%edx
c01065af:	8b 45 08             	mov    0x8(%ebp),%eax
c01065b2:	01 d0                	add    %edx,%eax
c01065b4:	89 ca                	mov    %ecx,%edx
c01065b6:	89 50 04             	mov    %edx,0x4(%eax)
c01065b9:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01065bc:	89 d0                	mov    %edx,%eax
c01065be:	01 c0                	add    %eax,%eax
c01065c0:	01 d0                	add    %edx,%eax
c01065c2:	c1 e0 03             	shl    $0x3,%eax
c01065c5:	89 c2                	mov    %eax,%edx
c01065c7:	8b 45 08             	mov    0x8(%ebp),%eax
c01065ca:	01 d0                	add    %edx,%eax
c01065cc:	83 c0 08             	add    $0x8,%eax
c01065cf:	83 ec 0c             	sub    $0xc,%esp
c01065d2:	50                   	push   %eax
c01065d3:	e8 9d 33 00 00       	call   c0109975 <initDoubleLinkList>
c01065d8:	83 c4 10             	add    $0x10,%esp
c01065db:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01065df:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c01065e3:	0f 8e 44 ff ff ff    	jle    c010652d <init_memory_block_desc+0x12>
c01065e9:	90                   	nop
c01065ea:	c9                   	leave  
c01065eb:	c3                   	ret    

c01065ec <init_memory2>:
c01065ec:	55                   	push   %ebp
c01065ed:	89 e5                	mov    %esp,%ebp
c01065ef:	83 ec 38             	sub    $0x38,%esp
c01065f2:	c7 45 f4 00 00 00 02 	movl   $0x2000000,-0xc(%ebp)
c01065f9:	c7 45 f0 00 20 10 00 	movl   $0x102000,-0x10(%ebp)
c0106600:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106603:	a3 b4 06 11 c0       	mov    %eax,0xc01106b4
c0106608:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010660b:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106610:	29 c2                	sub    %eax,%edx
c0106612:	89 d0                	mov    %edx,%eax
c0106614:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106617:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010661a:	89 c2                	mov    %eax,%edx
c010661c:	c1 ea 1f             	shr    $0x1f,%edx
c010661f:	01 d0                	add    %edx,%eax
c0106621:	d1 f8                	sar    %eax
c0106623:	a3 b8 06 11 c0       	mov    %eax,0xc01106b8
c0106628:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c010662d:	83 ec 0c             	sub    $0xc,%esp
c0106630:	50                   	push   %eax
c0106631:	e8 09 08 00 00       	call   c0106e3f <disp_int>
c0106636:	83 c4 10             	add    $0x10,%esp
c0106639:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c010663e:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106641:	29 c2                	sub    %eax,%edx
c0106643:	89 d0                	mov    %edx,%eax
c0106645:	a3 00 0f 11 c0       	mov    %eax,0xc0110f00
c010664a:	83 ec 0c             	sub    $0xc,%esp
c010664d:	68 95 a3 10 c0       	push   $0xc010a395
c0106652:	e8 35 9a ff ff       	call   c010008c <disp_str>
c0106657:	83 c4 10             	add    $0x10,%esp
c010665a:	a1 00 0f 11 c0       	mov    0xc0110f00,%eax
c010665f:	83 ec 0c             	sub    $0xc,%esp
c0106662:	50                   	push   %eax
c0106663:	e8 d7 07 00 00       	call   c0106e3f <disp_int>
c0106668:	83 c4 10             	add    $0x10,%esp
c010666b:	83 ec 0c             	sub    $0xc,%esp
c010666e:	68 95 a3 10 c0       	push   $0xc010a395
c0106673:	e8 14 9a ff ff       	call   c010008c <disp_str>
c0106678:	83 c4 10             	add    $0x10,%esp
c010667b:	a1 b8 06 11 c0       	mov    0xc01106b8,%eax
c0106680:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106685:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c010668b:	85 c0                	test   %eax,%eax
c010668d:	0f 48 c2             	cmovs  %edx,%eax
c0106690:	c1 f8 0c             	sar    $0xc,%eax
c0106693:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106696:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106699:	83 c0 07             	add    $0x7,%eax
c010669c:	8d 50 07             	lea    0x7(%eax),%edx
c010669f:	85 c0                	test   %eax,%eax
c01066a1:	0f 48 c2             	cmovs  %edx,%eax
c01066a4:	c1 f8 03             	sar    $0x3,%eax
c01066a7:	a3 b0 06 11 c0       	mov    %eax,0xc01106b0
c01066ac:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c01066b1:	2d 00 00 00 40       	sub    $0x40000000,%eax
c01066b6:	a3 ac 06 11 c0       	mov    %eax,0xc01106ac
c01066bb:	8b 15 b0 06 11 c0    	mov    0xc01106b0,%edx
c01066c1:	a1 ac 06 11 c0       	mov    0xc01106ac,%eax
c01066c6:	83 ec 04             	sub    $0x4,%esp
c01066c9:	52                   	push   %edx
c01066ca:	6a 00                	push   $0x0
c01066cc:	50                   	push   %eax
c01066cd:	e8 4d 45 00 00       	call   c010ac1f <Memset>
c01066d2:	83 c4 10             	add    $0x10,%esp
c01066d5:	a1 b0 06 11 c0       	mov    0xc01106b0,%eax
c01066da:	05 ff 0f 00 00       	add    $0xfff,%eax
c01066df:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c01066e5:	85 c0                	test   %eax,%eax
c01066e7:	0f 48 c2             	cmovs  %edx,%eax
c01066ea:	c1 f8 0c             	sar    $0xc,%eax
c01066ed:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01066f0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01066f3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01066f6:	ff 75 e8             	pushl  -0x18(%ebp)
c01066f9:	6a 01                	push   $0x1
c01066fb:	6a 00                	push   $0x0
c01066fd:	68 ac 06 11 c0       	push   $0xc01106ac
c0106702:	e8 46 f1 ff ff       	call   c010584d <set_bits>
c0106707:	83 c4 10             	add    $0x10,%esp
c010670a:	a1 00 0f 11 c0       	mov    0xc0110f00,%eax
c010670f:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106714:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c010671a:	85 c0                	test   %eax,%eax
c010671c:	0f 48 c2             	cmovs  %edx,%eax
c010671f:	c1 f8 0c             	sar    $0xc,%eax
c0106722:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106725:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106728:	83 c0 07             	add    $0x7,%eax
c010672b:	8d 50 07             	lea    0x7(%eax),%edx
c010672e:	85 c0                	test   %eax,%eax
c0106730:	0f 48 c2             	cmovs  %edx,%eax
c0106733:	c1 f8 03             	sar    $0x3,%eax
c0106736:	a3 f8 0e 11 c0       	mov    %eax,0xc0110ef8
c010673b:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c0106740:	8b 15 b0 06 11 c0    	mov    0xc01106b0,%edx
c0106746:	01 d0                	add    %edx,%eax
c0106748:	a3 f4 0e 11 c0       	mov    %eax,0xc0110ef4
c010674d:	8b 15 f8 0e 11 c0    	mov    0xc0110ef8,%edx
c0106753:	a1 f4 0e 11 c0       	mov    0xc0110ef4,%eax
c0106758:	83 ec 04             	sub    $0x4,%esp
c010675b:	52                   	push   %edx
c010675c:	6a 00                	push   $0x0
c010675e:	50                   	push   %eax
c010675f:	e8 bb 44 00 00       	call   c010ac1f <Memset>
c0106764:	83 c4 10             	add    $0x10,%esp
c0106767:	a1 f8 0e 11 c0       	mov    0xc0110ef8,%eax
c010676c:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106771:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106777:	85 c0                	test   %eax,%eax
c0106779:	0f 48 c2             	cmovs  %edx,%eax
c010677c:	c1 f8 0c             	sar    $0xc,%eax
c010677f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106782:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0106785:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0106788:	ff 75 e8             	pushl  -0x18(%ebp)
c010678b:	6a 01                	push   $0x1
c010678d:	ff 75 e0             	pushl  -0x20(%ebp)
c0106790:	68 ac 06 11 c0       	push   $0xc01106ac
c0106795:	e8 b3 f0 ff ff       	call   c010584d <set_bits>
c010679a:	83 c4 10             	add    $0x10,%esp
c010679d:	c7 45 dc 00 00 10 00 	movl   $0x100000,-0x24(%ebp)
c01067a4:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01067a7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01067aa:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01067ad:	83 c0 07             	add    $0x7,%eax
c01067b0:	8d 50 07             	lea    0x7(%eax),%edx
c01067b3:	85 c0                	test   %eax,%eax
c01067b5:	0f 48 c2             	cmovs  %edx,%eax
c01067b8:	c1 f8 03             	sar    $0x3,%eax
c01067bb:	a3 98 f7 10 c0       	mov    %eax,0xc010f798
c01067c0:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c01067c5:	8b 15 b0 06 11 c0    	mov    0xc01106b0,%edx
c01067cb:	01 c2                	add    %eax,%edx
c01067cd:	a1 f8 0e 11 c0       	mov    0xc0110ef8,%eax
c01067d2:	01 d0                	add    %edx,%eax
c01067d4:	a3 94 f7 10 c0       	mov    %eax,0xc010f794
c01067d9:	8b 15 98 f7 10 c0    	mov    0xc010f798,%edx
c01067df:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c01067e4:	83 ec 04             	sub    $0x4,%esp
c01067e7:	52                   	push   %edx
c01067e8:	6a 00                	push   $0x0
c01067ea:	50                   	push   %eax
c01067eb:	e8 2f 44 00 00       	call   c010ac1f <Memset>
c01067f0:	83 c4 10             	add    $0x10,%esp
c01067f3:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01067f6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01067f9:	01 d0                	add    %edx,%eax
c01067fb:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01067fe:	a1 98 f7 10 c0       	mov    0xc010f798,%eax
c0106803:	05 ff 0f 00 00       	add    $0xfff,%eax
c0106808:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c010680e:	85 c0                	test   %eax,%eax
c0106810:	0f 48 c2             	cmovs  %edx,%eax
c0106813:	c1 f8 0c             	sar    $0xc,%eax
c0106816:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106819:	ff 75 e8             	pushl  -0x18(%ebp)
c010681c:	6a 01                	push   $0x1
c010681e:	ff 75 e0             	pushl  -0x20(%ebp)
c0106821:	68 ac 06 11 c0       	push   $0xc01106ac
c0106826:	e8 22 f0 ff ff       	call   c010584d <set_bits>
c010682b:	83 c4 10             	add    $0x10,%esp
c010682e:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0106831:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106834:	01 d0                	add    %edx,%eax
c0106836:	c1 e0 0c             	shl    $0xc,%eax
c0106839:	a3 9c f7 10 c0       	mov    %eax,0xc010f79c
c010683e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106841:	83 c0 02             	add    $0x2,%eax
c0106844:	c1 e0 0c             	shl    $0xc,%eax
c0106847:	89 c2                	mov    %eax,%edx
c0106849:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010684c:	01 d0                	add    %edx,%eax
c010684e:	a3 9c f7 10 c0       	mov    %eax,0xc010f79c
c0106853:	c7 45 d8 05 00 00 00 	movl   $0x5,-0x28(%ebp)
c010685a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c010685d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106860:	90                   	nop
c0106861:	c9                   	leave  
c0106862:	c3                   	ret    

c0106863 <init_memory>:
c0106863:	55                   	push   %ebp
c0106864:	89 e5                	mov    %esp,%ebp
c0106866:	83 ec 38             	sub    $0x38,%esp
c0106869:	c7 45 f4 00 00 02 c0 	movl   $0xc0020000,-0xc(%ebp)
c0106870:	c7 45 f0 00 00 40 c0 	movl   $0xc0400000,-0x10(%ebp)
c0106877:	c7 45 ec 00 00 10 00 	movl   $0x100000,-0x14(%ebp)
c010687e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106881:	05 00 00 40 00       	add    $0x400000,%eax
c0106886:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106889:	8b 45 08             	mov    0x8(%ebp),%eax
c010688c:	2b 45 e8             	sub    -0x18(%ebp),%eax
c010688f:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0106895:	85 c0                	test   %eax,%eax
c0106897:	0f 48 c2             	cmovs  %edx,%eax
c010689a:	c1 f8 0c             	sar    $0xc,%eax
c010689d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01068a0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01068a3:	89 c2                	mov    %eax,%edx
c01068a5:	c1 ea 1f             	shr    $0x1f,%edx
c01068a8:	01 d0                	add    %edx,%eax
c01068aa:	d1 f8                	sar    %eax
c01068ac:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01068af:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01068b2:	2b 45 e0             	sub    -0x20(%ebp),%eax
c01068b5:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01068b8:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01068bb:	8d 50 07             	lea    0x7(%eax),%edx
c01068be:	85 c0                	test   %eax,%eax
c01068c0:	0f 48 c2             	cmovs  %edx,%eax
c01068c3:	c1 f8 03             	sar    $0x3,%eax
c01068c6:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01068c9:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01068cc:	8d 50 07             	lea    0x7(%eax),%edx
c01068cf:	85 c0                	test   %eax,%eax
c01068d1:	0f 48 c2             	cmovs  %edx,%eax
c01068d4:	c1 f8 03             	sar    $0x3,%eax
c01068d7:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01068da:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01068dd:	a3 b4 06 11 c0       	mov    %eax,0xc01106b4
c01068e2:	a1 b4 06 11 c0       	mov    0xc01106b4,%eax
c01068e7:	8b 55 e0             	mov    -0x20(%ebp),%edx
c01068ea:	c1 e2 0c             	shl    $0xc,%edx
c01068ed:	01 d0                	add    %edx,%eax
c01068ef:	a3 fc 0e 11 c0       	mov    %eax,0xc0110efc
c01068f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01068f7:	a3 ac 06 11 c0       	mov    %eax,0xc01106ac
c01068fc:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01068ff:	a3 b0 06 11 c0       	mov    %eax,0xc01106b0
c0106904:	a1 ac 06 11 c0       	mov    0xc01106ac,%eax
c0106909:	83 ec 04             	sub    $0x4,%esp
c010690c:	ff 75 d8             	pushl  -0x28(%ebp)
c010690f:	6a 00                	push   $0x0
c0106911:	50                   	push   %eax
c0106912:	e8 08 43 00 00       	call   c010ac1f <Memset>
c0106917:	83 c4 10             	add    $0x10,%esp
c010691a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c010691d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106920:	01 d0                	add    %edx,%eax
c0106922:	a3 f4 0e 11 c0       	mov    %eax,0xc0110ef4
c0106927:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c010692a:	a3 f8 0e 11 c0       	mov    %eax,0xc0110ef8
c010692f:	a1 f4 0e 11 c0       	mov    0xc0110ef4,%eax
c0106934:	83 ec 04             	sub    $0x4,%esp
c0106937:	ff 75 d4             	pushl  -0x2c(%ebp)
c010693a:	6a 00                	push   $0x0
c010693c:	50                   	push   %eax
c010693d:	e8 dd 42 00 00       	call   c010ac1f <Memset>
c0106942:	83 c4 10             	add    $0x10,%esp
c0106945:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106948:	a3 98 f7 10 c0       	mov    %eax,0xc010f798
c010694d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0106950:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106953:	01 c2                	add    %eax,%edx
c0106955:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106958:	01 d0                	add    %edx,%eax
c010695a:	a3 94 f7 10 c0       	mov    %eax,0xc010f794
c010695f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106962:	05 00 00 10 00       	add    $0x100000,%eax
c0106967:	a3 9c f7 10 c0       	mov    %eax,0xc010f79c
c010696c:	a1 94 f7 10 c0       	mov    0xc010f794,%eax
c0106971:	83 ec 04             	sub    $0x4,%esp
c0106974:	ff 75 d8             	pushl  -0x28(%ebp)
c0106977:	6a 00                	push   $0x0
c0106979:	50                   	push   %eax
c010697a:	e8 a0 42 00 00       	call   c010ac1f <Memset>
c010697f:	83 c4 10             	add    $0x10,%esp
c0106982:	83 ec 04             	sub    $0x4,%esp
c0106985:	68 f0 00 00 00       	push   $0xf0
c010698a:	6a 00                	push   $0x0
c010698c:	68 a0 37 18 c0       	push   $0xc01837a0
c0106991:	e8 89 42 00 00       	call   c010ac1f <Memset>
c0106996:	83 c4 10             	add    $0x10,%esp
c0106999:	83 ec 0c             	sub    $0xc,%esp
c010699c:	68 a0 37 18 c0       	push   $0xc01837a0
c01069a1:	e8 75 fb ff ff       	call   c010651b <init_memory_block_desc>
c01069a6:	83 c4 10             	add    $0x10,%esp
c01069a9:	90                   	nop
c01069aa:	c9                   	leave  
c01069ab:	c3                   	ret    

c01069ac <catch_error>:
c01069ac:	55                   	push   %ebp
c01069ad:	89 e5                	mov    %esp,%ebp
c01069af:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c01069b4:	83 c0 01             	add    $0x1,%eax
c01069b7:	a3 c4 fb 10 c0       	mov    %eax,0xc010fbc4
c01069bc:	a1 a4 f7 10 c0       	mov    0xc010f7a4,%eax
c01069c1:	a3 a0 f7 10 c0       	mov    %eax,0xc010f7a0
c01069c6:	90                   	nop
c01069c7:	5d                   	pop    %ebp
c01069c8:	c3                   	ret    

c01069c9 <intr_enable>:
c01069c9:	55                   	push   %ebp
c01069ca:	89 e5                	mov    %esp,%ebp
c01069cc:	83 ec 18             	sub    $0x18,%esp
c01069cf:	e8 65 00 00 00       	call   c0106a39 <intr_get_status>
c01069d4:	83 f8 01             	cmp    $0x1,%eax
c01069d7:	75 0c                	jne    c01069e5 <intr_enable+0x1c>
c01069d9:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c01069e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01069e3:	eb 0b                	jmp    c01069f0 <intr_enable+0x27>
c01069e5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01069ec:	fb                   	sti    
c01069ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01069f0:	c9                   	leave  
c01069f1:	c3                   	ret    

c01069f2 <intr_disable>:
c01069f2:	55                   	push   %ebp
c01069f3:	89 e5                	mov    %esp,%ebp
c01069f5:	83 ec 18             	sub    $0x18,%esp
c01069f8:	e8 3c 00 00 00       	call   c0106a39 <intr_get_status>
c01069fd:	83 f8 01             	cmp    $0x1,%eax
c0106a00:	75 0d                	jne    c0106a0f <intr_disable+0x1d>
c0106a02:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0106a09:	fa                   	cli    
c0106a0a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106a0d:	eb 0a                	jmp    c0106a19 <intr_disable+0x27>
c0106a0f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106a16:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106a19:	c9                   	leave  
c0106a1a:	c3                   	ret    

c0106a1b <intr_set_status>:
c0106a1b:	55                   	push   %ebp
c0106a1c:	89 e5                	mov    %esp,%ebp
c0106a1e:	83 ec 08             	sub    $0x8,%esp
c0106a21:	8b 45 08             	mov    0x8(%ebp),%eax
c0106a24:	83 e0 01             	and    $0x1,%eax
c0106a27:	85 c0                	test   %eax,%eax
c0106a29:	74 07                	je     c0106a32 <intr_set_status+0x17>
c0106a2b:	e8 99 ff ff ff       	call   c01069c9 <intr_enable>
c0106a30:	eb 05                	jmp    c0106a37 <intr_set_status+0x1c>
c0106a32:	e8 bb ff ff ff       	call   c01069f2 <intr_disable>
c0106a37:	c9                   	leave  
c0106a38:	c3                   	ret    

c0106a39 <intr_get_status>:
c0106a39:	55                   	push   %ebp
c0106a3a:	89 e5                	mov    %esp,%ebp
c0106a3c:	83 ec 10             	sub    $0x10,%esp
c0106a3f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0106a46:	9c                   	pushf  
c0106a47:	58                   	pop    %eax
c0106a48:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0106a4b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106a4e:	c1 e8 09             	shr    $0x9,%eax
c0106a51:	83 e0 01             	and    $0x1,%eax
c0106a54:	c9                   	leave  
c0106a55:	c3                   	ret    

c0106a56 <Memcpy>:
c0106a56:	55                   	push   %ebp
c0106a57:	89 e5                	mov    %esp,%ebp
c0106a59:	83 ec 18             	sub    $0x18,%esp
c0106a5c:	e8 91 ff ff ff       	call   c01069f2 <intr_disable>
c0106a61:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106a64:	83 ec 04             	sub    $0x4,%esp
c0106a67:	ff 75 10             	pushl  0x10(%ebp)
c0106a6a:	ff 75 0c             	pushl  0xc(%ebp)
c0106a6d:	ff 75 08             	pushl  0x8(%ebp)
c0106a70:	e8 7c 41 00 00       	call   c010abf1 <Memcpy2>
c0106a75:	83 c4 10             	add    $0x10,%esp
c0106a78:	83 ec 0c             	sub    $0xc,%esp
c0106a7b:	ff 75 f4             	pushl  -0xc(%ebp)
c0106a7e:	e8 98 ff ff ff       	call   c0106a1b <intr_set_status>
c0106a83:	83 c4 10             	add    $0x10,%esp
c0106a86:	90                   	nop
c0106a87:	c9                   	leave  
c0106a88:	c3                   	ret    

c0106a89 <untar>:
c0106a89:	55                   	push   %ebp
c0106a8a:	89 e5                	mov    %esp,%ebp
c0106a8c:	81 ec 48 0a 00 00    	sub    $0xa48,%esp
c0106a92:	83 ec 08             	sub    $0x8,%esp
c0106a95:	6a 00                	push   $0x0
c0106a97:	ff 75 08             	pushl  0x8(%ebp)
c0106a9a:	e8 8f de ff ff       	call   c010492e <open>
c0106a9f:	83 c4 10             	add    $0x10,%esp
c0106aa2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0106aa5:	83 ec 0c             	sub    $0xc,%esp
c0106aa8:	68 a0 a3 10 c0       	push   $0xc010a3a0
c0106aad:	e8 20 16 00 00       	call   c01080d2 <Printf>
c0106ab2:	83 c4 10             	add    $0x10,%esp
c0106ab5:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0106abc:	c7 45 dc 00 02 00 00 	movl   $0x200,-0x24(%ebp)
c0106ac3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106aca:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0106ad1:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0106ad8:	e9 5e 02 00 00       	jmp    c0106d3b <untar+0x2b2>
c0106add:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0106ae1:	7e 58                	jle    c0106b3b <untar+0xb2>
c0106ae3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106ae6:	05 ff 01 00 00       	add    $0x1ff,%eax
c0106aeb:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0106af1:	85 c0                	test   %eax,%eax
c0106af3:	0f 48 c2             	cmovs  %edx,%eax
c0106af6:	c1 f8 09             	sar    $0x9,%eax
c0106af9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0106afc:	83 ec 04             	sub    $0x4,%esp
c0106aff:	68 00 02 00 00       	push   $0x200
c0106b04:	6a 00                	push   $0x0
c0106b06:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106b0c:	50                   	push   %eax
c0106b0d:	e8 0d 41 00 00       	call   c010ac1f <Memset>
c0106b12:	83 c4 10             	add    $0x10,%esp
c0106b15:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0106b18:	c1 e0 09             	shl    $0x9,%eax
c0106b1b:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0106b1e:	83 ec 04             	sub    $0x4,%esp
c0106b21:	50                   	push   %eax
c0106b22:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106b28:	50                   	push   %eax
c0106b29:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106b2c:	e8 92 de ff ff       	call   c01049c3 <read>
c0106b31:	83 c4 10             	add    $0x10,%esp
c0106b34:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0106b3b:	83 ec 04             	sub    $0x4,%esp
c0106b3e:	68 00 02 00 00       	push   $0x200
c0106b43:	6a 00                	push   $0x0
c0106b45:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106b4b:	50                   	push   %eax
c0106b4c:	e8 ce 40 00 00       	call   c010ac1f <Memset>
c0106b51:	83 c4 10             	add    $0x10,%esp
c0106b54:	83 ec 04             	sub    $0x4,%esp
c0106b57:	68 00 02 00 00       	push   $0x200
c0106b5c:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106b62:	50                   	push   %eax
c0106b63:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106b66:	e8 58 de ff ff       	call   c01049c3 <read>
c0106b6b:	83 c4 10             	add    $0x10,%esp
c0106b6e:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0106b71:	83 ec 0c             	sub    $0xc,%esp
c0106b74:	68 b2 a3 10 c0       	push   $0xc010a3b2
c0106b79:	e8 54 15 00 00       	call   c01080d2 <Printf>
c0106b7e:	83 c4 10             	add    $0x10,%esp
c0106b81:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0106b85:	0f 84 bc 01 00 00    	je     c0106d47 <untar+0x2be>
c0106b8b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0106b8e:	01 45 f4             	add    %eax,-0xc(%ebp)
c0106b91:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0106b98:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0106b9e:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0106ba1:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106ba4:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0106ba7:	83 ec 08             	sub    $0x8,%esp
c0106baa:	6a 07                	push   $0x7
c0106bac:	ff 75 cc             	pushl  -0x34(%ebp)
c0106baf:	e8 7a dd ff ff       	call   c010492e <open>
c0106bb4:	83 c4 10             	add    $0x10,%esp
c0106bb7:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0106bba:	83 ec 0c             	sub    $0xc,%esp
c0106bbd:	68 c4 a3 10 c0       	push   $0xc010a3c4
c0106bc2:	e8 0b 15 00 00       	call   c01080d2 <Printf>
c0106bc7:	83 c4 10             	add    $0x10,%esp
c0106bca:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0106bd1:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0106bd4:	83 c0 7c             	add    $0x7c,%eax
c0106bd7:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0106bda:	83 ec 0c             	sub    $0xc,%esp
c0106bdd:	ff 75 cc             	pushl  -0x34(%ebp)
c0106be0:	e8 73 40 00 00       	call   c010ac58 <Strlen>
c0106be5:	83 c4 10             	add    $0x10,%esp
c0106be8:	85 c0                	test   %eax,%eax
c0106bea:	75 28                	jne    c0106c14 <untar+0x18b>
c0106bec:	83 ec 0c             	sub    $0xc,%esp
c0106bef:	ff 75 c4             	pushl  -0x3c(%ebp)
c0106bf2:	e8 61 40 00 00       	call   c010ac58 <Strlen>
c0106bf7:	83 c4 10             	add    $0x10,%esp
c0106bfa:	85 c0                	test   %eax,%eax
c0106bfc:	75 16                	jne    c0106c14 <untar+0x18b>
c0106bfe:	83 ec 0c             	sub    $0xc,%esp
c0106c01:	68 d6 a3 10 c0       	push   $0xc010a3d6
c0106c06:	e8 c7 14 00 00       	call   c01080d2 <Printf>
c0106c0b:	83 c4 10             	add    $0x10,%esp
c0106c0e:	90                   	nop
c0106c0f:	e9 34 01 00 00       	jmp    c0106d48 <untar+0x2bf>
c0106c14:	83 ec 0c             	sub    $0xc,%esp
c0106c17:	68 dd a3 10 c0       	push   $0xc010a3dd
c0106c1c:	e8 b1 14 00 00       	call   c01080d2 <Printf>
c0106c21:	83 c4 10             	add    $0x10,%esp
c0106c24:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0106c27:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0106c2a:	eb 1f                	jmp    c0106c4b <untar+0x1c2>
c0106c2c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106c2f:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0106c36:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106c39:	0f b6 00             	movzbl (%eax),%eax
c0106c3c:	0f be c0             	movsbl %al,%eax
c0106c3f:	83 e8 30             	sub    $0x30,%eax
c0106c42:	01 d0                	add    %edx,%eax
c0106c44:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106c47:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0106c4b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0106c4e:	0f b6 00             	movzbl (%eax),%eax
c0106c51:	84 c0                	test   %al,%al
c0106c53:	75 d7                	jne    c0106c2c <untar+0x1a3>
c0106c55:	83 ec 0c             	sub    $0xc,%esp
c0106c58:	68 eb a3 10 c0       	push   $0xc010a3eb
c0106c5d:	e8 70 14 00 00       	call   c01080d2 <Printf>
c0106c62:	83 c4 10             	add    $0x10,%esp
c0106c65:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106c68:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0106c6b:	c7 45 bc 00 08 00 00 	movl   $0x800,-0x44(%ebp)
c0106c72:	83 ec 08             	sub    $0x8,%esp
c0106c75:	ff 75 c0             	pushl  -0x40(%ebp)
c0106c78:	68 f9 a3 10 c0       	push   $0xc010a3f9
c0106c7d:	e8 50 14 00 00       	call   c01080d2 <Printf>
c0106c82:	83 c4 10             	add    $0x10,%esp
c0106c85:	83 ec 08             	sub    $0x8,%esp
c0106c88:	ff 75 c0             	pushl  -0x40(%ebp)
c0106c8b:	68 0b a4 10 c0       	push   $0xc010a40b
c0106c90:	e8 3d 14 00 00       	call   c01080d2 <Printf>
c0106c95:	83 c4 10             	add    $0x10,%esp
c0106c98:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0106c9b:	39 45 bc             	cmp    %eax,-0x44(%ebp)
c0106c9e:	0f 4e 45 bc          	cmovle -0x44(%ebp),%eax
c0106ca2:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0106ca5:	83 ec 04             	sub    $0x4,%esp
c0106ca8:	ff 75 b8             	pushl  -0x48(%ebp)
c0106cab:	8d 85 b8 f5 ff ff    	lea    -0xa48(%ebp),%eax
c0106cb1:	50                   	push   %eax
c0106cb2:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106cb5:	e8 09 dd ff ff       	call   c01049c3 <read>
c0106cba:	83 c4 10             	add    $0x10,%esp
c0106cbd:	01 45 f4             	add    %eax,-0xc(%ebp)
c0106cc0:	83 ec 04             	sub    $0x4,%esp
c0106cc3:	ff 75 b8             	pushl  -0x48(%ebp)
c0106cc6:	8d 85 b8 f5 ff ff    	lea    -0xa48(%ebp),%eax
c0106ccc:	50                   	push   %eax
c0106ccd:	ff 75 c8             	pushl  -0x38(%ebp)
c0106cd0:	e8 6f de ff ff       	call   c0104b44 <write>
c0106cd5:	83 c4 10             	add    $0x10,%esp
c0106cd8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106cdb:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0106cde:	7d 02                	jge    c0106ce2 <untar+0x259>
c0106ce0:	eb c3                	jmp    c0106ca5 <untar+0x21c>
c0106ce2:	90                   	nop
c0106ce3:	83 ec 08             	sub    $0x8,%esp
c0106ce6:	ff 75 f4             	pushl  -0xc(%ebp)
c0106ce9:	68 1d a4 10 c0       	push   $0xc010a41d
c0106cee:	e8 df 13 00 00       	call   c01080d2 <Printf>
c0106cf3:	83 c4 10             	add    $0x10,%esp
c0106cf6:	83 ec 08             	sub    $0x8,%esp
c0106cf9:	ff 75 c0             	pushl  -0x40(%ebp)
c0106cfc:	68 2f a4 10 c0       	push   $0xc010a42f
c0106d01:	e8 cc 13 00 00       	call   c01080d2 <Printf>
c0106d06:	83 c4 10             	add    $0x10,%esp
c0106d09:	83 ec 0c             	sub    $0xc,%esp
c0106d0c:	68 40 a4 10 c0       	push   $0xc010a440
c0106d11:	e8 bc 13 00 00       	call   c01080d2 <Printf>
c0106d16:	83 c4 10             	add    $0x10,%esp
c0106d19:	83 ec 0c             	sub    $0xc,%esp
c0106d1c:	ff 75 c8             	pushl  -0x38(%ebp)
c0106d1f:	e8 a5 de ff ff       	call   c0104bc9 <close>
c0106d24:	83 c4 10             	add    $0x10,%esp
c0106d27:	83 ec 0c             	sub    $0xc,%esp
c0106d2a:	68 4e a4 10 c0       	push   $0xc010a44e
c0106d2f:	e8 9e 13 00 00       	call   c01080d2 <Printf>
c0106d34:	83 c4 10             	add    $0x10,%esp
c0106d37:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c0106d3b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0106d3f:	0f 8f 98 fd ff ff    	jg     c0106add <untar+0x54>
c0106d45:	eb 01                	jmp    c0106d48 <untar+0x2bf>
c0106d47:	90                   	nop
c0106d48:	83 ec 0c             	sub    $0xc,%esp
c0106d4b:	68 5b a4 10 c0       	push   $0xc010a45b
c0106d50:	e8 7d 13 00 00       	call   c01080d2 <Printf>
c0106d55:	83 c4 10             	add    $0x10,%esp
c0106d58:	83 ec 0c             	sub    $0xc,%esp
c0106d5b:	68 6d a4 10 c0       	push   $0xc010a46d
c0106d60:	e8 6d 13 00 00       	call   c01080d2 <Printf>
c0106d65:	83 c4 10             	add    $0x10,%esp
c0106d68:	83 ec 0c             	sub    $0xc,%esp
c0106d6b:	ff 75 e4             	pushl  -0x1c(%ebp)
c0106d6e:	e8 56 de ff ff       	call   c0104bc9 <close>
c0106d73:	83 c4 10             	add    $0x10,%esp
c0106d76:	83 ec 0c             	sub    $0xc,%esp
c0106d79:	68 7d a4 10 c0       	push   $0xc010a47d
c0106d7e:	e8 4f 13 00 00       	call   c01080d2 <Printf>
c0106d83:	83 c4 10             	add    $0x10,%esp
c0106d86:	83 ec 0c             	sub    $0xc,%esp
c0106d89:	68 90 a4 10 c0       	push   $0xc010a490
c0106d8e:	e8 3f 13 00 00       	call   c01080d2 <Printf>
c0106d93:	83 c4 10             	add    $0x10,%esp
c0106d96:	90                   	nop
c0106d97:	c9                   	leave  
c0106d98:	c3                   	ret    

c0106d99 <atoi>:
c0106d99:	55                   	push   %ebp
c0106d9a:	89 e5                	mov    %esp,%ebp
c0106d9c:	83 ec 10             	sub    $0x10,%esp
c0106d9f:	8b 45 08             	mov    0x8(%ebp),%eax
c0106da2:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0106da5:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106da8:	8d 50 01             	lea    0x1(%eax),%edx
c0106dab:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0106dae:	c6 00 30             	movb   $0x30,(%eax)
c0106db1:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106db4:	8d 50 01             	lea    0x1(%eax),%edx
c0106db7:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0106dba:	c6 00 78             	movb   $0x78,(%eax)
c0106dbd:	c6 45 fa 00          	movb   $0x0,-0x6(%ebp)
c0106dc1:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0106dc5:	75 0e                	jne    c0106dd5 <atoi+0x3c>
c0106dc7:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106dca:	8d 50 01             	lea    0x1(%eax),%edx
c0106dcd:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0106dd0:	c6 00 30             	movb   $0x30,(%eax)
c0106dd3:	eb 61                	jmp    c0106e36 <atoi+0x9d>
c0106dd5:	c7 45 f4 1c 00 00 00 	movl   $0x1c,-0xc(%ebp)
c0106ddc:	eb 52                	jmp    c0106e30 <atoi+0x97>
c0106dde:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106de1:	8b 55 0c             	mov    0xc(%ebp),%edx
c0106de4:	89 c1                	mov    %eax,%ecx
c0106de6:	d3 fa                	sar    %cl,%edx
c0106de8:	89 d0                	mov    %edx,%eax
c0106dea:	83 e0 0f             	and    $0xf,%eax
c0106ded:	88 45 fb             	mov    %al,-0x5(%ebp)
c0106df0:	80 7d fa 00          	cmpb   $0x0,-0x6(%ebp)
c0106df4:	75 06                	jne    c0106dfc <atoi+0x63>
c0106df6:	80 7d fb 00          	cmpb   $0x0,-0x5(%ebp)
c0106dfa:	74 2f                	je     c0106e2b <atoi+0x92>
c0106dfc:	c6 45 fa 01          	movb   $0x1,-0x6(%ebp)
c0106e00:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0106e04:	83 c0 30             	add    $0x30,%eax
c0106e07:	88 45 fb             	mov    %al,-0x5(%ebp)
c0106e0a:	80 7d fb 39          	cmpb   $0x39,-0x5(%ebp)
c0106e0e:	7e 0a                	jle    c0106e1a <atoi+0x81>
c0106e10:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0106e14:	83 c0 07             	add    $0x7,%eax
c0106e17:	88 45 fb             	mov    %al,-0x5(%ebp)
c0106e1a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106e1d:	8d 50 01             	lea    0x1(%eax),%edx
c0106e20:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0106e23:	0f b6 55 fb          	movzbl -0x5(%ebp),%edx
c0106e27:	88 10                	mov    %dl,(%eax)
c0106e29:	eb 01                	jmp    c0106e2c <atoi+0x93>
c0106e2b:	90                   	nop
c0106e2c:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c0106e30:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0106e34:	79 a8                	jns    c0106dde <atoi+0x45>
c0106e36:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0106e39:	c6 00 00             	movb   $0x0,(%eax)
c0106e3c:	90                   	nop
c0106e3d:	c9                   	leave  
c0106e3e:	c3                   	ret    

c0106e3f <disp_int>:
c0106e3f:	55                   	push   %ebp
c0106e40:	89 e5                	mov    %esp,%ebp
c0106e42:	83 ec 18             	sub    $0x18,%esp
c0106e45:	ff 75 08             	pushl  0x8(%ebp)
c0106e48:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0106e4b:	50                   	push   %eax
c0106e4c:	e8 48 ff ff ff       	call   c0106d99 <atoi>
c0106e51:	83 c4 08             	add    $0x8,%esp
c0106e54:	83 ec 08             	sub    $0x8,%esp
c0106e57:	6a 0b                	push   $0xb
c0106e59:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0106e5c:	50                   	push   %eax
c0106e5d:	e8 65 92 ff ff       	call   c01000c7 <disp_str_colour>
c0106e62:	83 c4 10             	add    $0x10,%esp
c0106e65:	90                   	nop
c0106e66:	c9                   	leave  
c0106e67:	c3                   	ret    

c0106e68 <do_page_fault>:
c0106e68:	55                   	push   %ebp
c0106e69:	89 e5                	mov    %esp,%ebp
c0106e6b:	83 ec 28             	sub    $0x28,%esp
c0106e6e:	0f 20 d0             	mov    %cr2,%eax
c0106e71:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0106e74:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0106e7b:	00 00 00 
c0106e7e:	83 ec 0c             	sub    $0xc,%esp
c0106e81:	68 9b a4 10 c0       	push   $0xc010a49b
c0106e86:	e8 01 92 ff ff       	call   c010008c <disp_str>
c0106e8b:	83 c4 10             	add    $0x10,%esp
c0106e8e:	83 ec 0c             	sub    $0xc,%esp
c0106e91:	68 aa a4 10 c0       	push   $0xc010a4aa
c0106e96:	e8 f1 91 ff ff       	call   c010008c <disp_str>
c0106e9b:	83 c4 10             	add    $0x10,%esp
c0106e9e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0106ea1:	83 ec 0c             	sub    $0xc,%esp
c0106ea4:	50                   	push   %eax
c0106ea5:	e8 95 ff ff ff       	call   c0106e3f <disp_int>
c0106eaa:	83 c4 10             	add    $0x10,%esp
c0106ead:	83 ec 0c             	sub    $0xc,%esp
c0106eb0:	68 af a4 10 c0       	push   $0xc010a4af
c0106eb5:	e8 d2 91 ff ff       	call   c010008c <disp_str>
c0106eba:	83 c4 10             	add    $0x10,%esp
c0106ebd:	83 ec 0c             	sub    $0xc,%esp
c0106ec0:	ff 75 f4             	pushl  -0xc(%ebp)
c0106ec3:	e8 a9 ec ff ff       	call   c0105b71 <ptr_pde>
c0106ec8:	83 c4 10             	add    $0x10,%esp
c0106ecb:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0106ece:	83 ec 0c             	sub    $0xc,%esp
c0106ed1:	ff 75 f4             	pushl  -0xc(%ebp)
c0106ed4:	e8 ab ec ff ff       	call   c0105b84 <ptr_pte>
c0106ed9:	83 c4 10             	add    $0x10,%esp
c0106edc:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0106edf:	83 ec 0c             	sub    $0xc,%esp
c0106ee2:	68 b1 a4 10 c0       	push   $0xc010a4b1
c0106ee7:	e8 a0 91 ff ff       	call   c010008c <disp_str>
c0106eec:	83 c4 10             	add    $0x10,%esp
c0106eef:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106ef2:	83 ec 0c             	sub    $0xc,%esp
c0106ef5:	50                   	push   %eax
c0106ef6:	e8 44 ff ff ff       	call   c0106e3f <disp_int>
c0106efb:	83 c4 10             	add    $0x10,%esp
c0106efe:	83 ec 0c             	sub    $0xc,%esp
c0106f01:	68 b6 a4 10 c0       	push   $0xc010a4b6
c0106f06:	e8 81 91 ff ff       	call   c010008c <disp_str>
c0106f0b:	83 c4 10             	add    $0x10,%esp
c0106f0e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0106f11:	8b 00                	mov    (%eax),%eax
c0106f13:	83 ec 0c             	sub    $0xc,%esp
c0106f16:	50                   	push   %eax
c0106f17:	e8 23 ff ff ff       	call   c0106e3f <disp_int>
c0106f1c:	83 c4 10             	add    $0x10,%esp
c0106f1f:	83 ec 0c             	sub    $0xc,%esp
c0106f22:	68 af a4 10 c0       	push   $0xc010a4af
c0106f27:	e8 60 91 ff ff       	call   c010008c <disp_str>
c0106f2c:	83 c4 10             	add    $0x10,%esp
c0106f2f:	83 ec 0c             	sub    $0xc,%esp
c0106f32:	68 bf a4 10 c0       	push   $0xc010a4bf
c0106f37:	e8 50 91 ff ff       	call   c010008c <disp_str>
c0106f3c:	83 c4 10             	add    $0x10,%esp
c0106f3f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106f42:	83 ec 0c             	sub    $0xc,%esp
c0106f45:	50                   	push   %eax
c0106f46:	e8 f4 fe ff ff       	call   c0106e3f <disp_int>
c0106f4b:	83 c4 10             	add    $0x10,%esp
c0106f4e:	83 ec 0c             	sub    $0xc,%esp
c0106f51:	68 c4 a4 10 c0       	push   $0xc010a4c4
c0106f56:	e8 31 91 ff ff       	call   c010008c <disp_str>
c0106f5b:	83 c4 10             	add    $0x10,%esp
c0106f5e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106f61:	8b 00                	mov    (%eax),%eax
c0106f63:	83 ec 0c             	sub    $0xc,%esp
c0106f66:	50                   	push   %eax
c0106f67:	e8 d3 fe ff ff       	call   c0106e3f <disp_int>
c0106f6c:	83 c4 10             	add    $0x10,%esp
c0106f6f:	83 ec 0c             	sub    $0xc,%esp
c0106f72:	68 af a4 10 c0       	push   $0xc010a4af
c0106f77:	e8 10 91 ff ff       	call   c010008c <disp_str>
c0106f7c:	83 c4 10             	add    $0x10,%esp
c0106f7f:	c7 45 e8 00 00 10 00 	movl   $0x100000,-0x18(%ebp)
c0106f86:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0106f89:	8b 00                	mov    (%eax),%eax
c0106f8b:	83 e0 01             	and    $0x1,%eax
c0106f8e:	85 c0                	test   %eax,%eax
c0106f90:	74 09                	je     c0106f9b <do_page_fault+0x133>
c0106f92:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
c0106f99:	eb 07                	jmp    c0106fa2 <do_page_fault+0x13a>
c0106f9b:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0106fa2:	90                   	nop
c0106fa3:	c9                   	leave  
c0106fa4:	c3                   	ret    

c0106fa5 <exception_handler>:
c0106fa5:	55                   	push   %ebp
c0106fa6:	89 e5                	mov    %esp,%ebp
c0106fa8:	57                   	push   %edi
c0106fa9:	56                   	push   %esi
c0106faa:	53                   	push   %ebx
c0106fab:	83 ec 6c             	sub    $0x6c,%esp
c0106fae:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0106fb1:	bb 40 a7 10 c0       	mov    $0xc010a740,%ebx
c0106fb6:	ba 13 00 00 00       	mov    $0x13,%edx
c0106fbb:	89 c7                	mov    %eax,%edi
c0106fbd:	89 de                	mov    %ebx,%esi
c0106fbf:	89 d1                	mov    %edx,%ecx
c0106fc1:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0106fc3:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0106fca:	eb 04                	jmp    c0106fd0 <exception_handler+0x2b>
c0106fcc:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0106fd0:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c0106fd7:	7e f3                	jle    c0106fcc <exception_handler+0x27>
c0106fd9:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c0106fe0:	00 00 00 
c0106fe3:	83 ec 0c             	sub    $0xc,%esp
c0106fe6:	68 cd a4 10 c0       	push   $0xc010a4cd
c0106feb:	e8 9c 90 ff ff       	call   c010008c <disp_str>
c0106ff0:	83 c4 10             	add    $0x10,%esp
c0106ff3:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c0106ffa:	8b 45 08             	mov    0x8(%ebp),%eax
c0106ffd:	8b 44 85 8c          	mov    -0x74(%ebp,%eax,4),%eax
c0107001:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0107004:	83 ec 0c             	sub    $0xc,%esp
c0107007:	ff 75 dc             	pushl  -0x24(%ebp)
c010700a:	e8 7d 90 ff ff       	call   c010008c <disp_str>
c010700f:	83 c4 10             	add    $0x10,%esp
c0107012:	83 ec 0c             	sub    $0xc,%esp
c0107015:	68 db a4 10 c0       	push   $0xc010a4db
c010701a:	e8 6d 90 ff ff       	call   c010008c <disp_str>
c010701f:	83 c4 10             	add    $0x10,%esp
c0107022:	83 ec 0c             	sub    $0xc,%esp
c0107025:	68 de a4 10 c0       	push   $0xc010a4de
c010702a:	e8 5d 90 ff ff       	call   c010008c <disp_str>
c010702f:	83 c4 10             	add    $0x10,%esp
c0107032:	8b 45 08             	mov    0x8(%ebp),%eax
c0107035:	83 ec 0c             	sub    $0xc,%esp
c0107038:	50                   	push   %eax
c0107039:	e8 01 fe ff ff       	call   c0106e3f <disp_int>
c010703e:	83 c4 10             	add    $0x10,%esp
c0107041:	83 ec 0c             	sub    $0xc,%esp
c0107044:	68 db a4 10 c0       	push   $0xc010a4db
c0107049:	e8 3e 90 ff ff       	call   c010008c <disp_str>
c010704e:	83 c4 10             	add    $0x10,%esp
c0107051:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c0107055:	74 2f                	je     c0107086 <exception_handler+0xe1>
c0107057:	83 ec 0c             	sub    $0xc,%esp
c010705a:	68 e6 a4 10 c0       	push   $0xc010a4e6
c010705f:	e8 28 90 ff ff       	call   c010008c <disp_str>
c0107064:	83 c4 10             	add    $0x10,%esp
c0107067:	8b 45 0c             	mov    0xc(%ebp),%eax
c010706a:	83 ec 0c             	sub    $0xc,%esp
c010706d:	50                   	push   %eax
c010706e:	e8 cc fd ff ff       	call   c0106e3f <disp_int>
c0107073:	83 c4 10             	add    $0x10,%esp
c0107076:	83 ec 0c             	sub    $0xc,%esp
c0107079:	68 db a4 10 c0       	push   $0xc010a4db
c010707e:	e8 09 90 ff ff       	call   c010008c <disp_str>
c0107083:	83 c4 10             	add    $0x10,%esp
c0107086:	83 ec 0c             	sub    $0xc,%esp
c0107089:	68 f0 a4 10 c0       	push   $0xc010a4f0
c010708e:	e8 f9 8f ff ff       	call   c010008c <disp_str>
c0107093:	83 c4 10             	add    $0x10,%esp
c0107096:	83 ec 0c             	sub    $0xc,%esp
c0107099:	ff 75 14             	pushl  0x14(%ebp)
c010709c:	e8 9e fd ff ff       	call   c0106e3f <disp_int>
c01070a1:	83 c4 10             	add    $0x10,%esp
c01070a4:	83 ec 0c             	sub    $0xc,%esp
c01070a7:	68 db a4 10 c0       	push   $0xc010a4db
c01070ac:	e8 db 8f ff ff       	call   c010008c <disp_str>
c01070b1:	83 c4 10             	add    $0x10,%esp
c01070b4:	83 ec 0c             	sub    $0xc,%esp
c01070b7:	68 f4 a4 10 c0       	push   $0xc010a4f4
c01070bc:	e8 cb 8f ff ff       	call   c010008c <disp_str>
c01070c1:	83 c4 10             	add    $0x10,%esp
c01070c4:	8b 45 10             	mov    0x10(%ebp),%eax
c01070c7:	83 ec 0c             	sub    $0xc,%esp
c01070ca:	50                   	push   %eax
c01070cb:	e8 6f fd ff ff       	call   c0106e3f <disp_int>
c01070d0:	83 c4 10             	add    $0x10,%esp
c01070d3:	83 ec 0c             	sub    $0xc,%esp
c01070d6:	68 db a4 10 c0       	push   $0xc010a4db
c01070db:	e8 ac 8f ff ff       	call   c010008c <disp_str>
c01070e0:	83 c4 10             	add    $0x10,%esp
c01070e3:	83 ec 0c             	sub    $0xc,%esp
c01070e6:	68 f9 a4 10 c0       	push   $0xc010a4f9
c01070eb:	e8 9c 8f ff ff       	call   c010008c <disp_str>
c01070f0:	83 c4 10             	add    $0x10,%esp
c01070f3:	83 ec 0c             	sub    $0xc,%esp
c01070f6:	ff 75 18             	pushl  0x18(%ebp)
c01070f9:	e8 41 fd ff ff       	call   c0106e3f <disp_int>
c01070fe:	83 c4 10             	add    $0x10,%esp
c0107101:	83 ec 0c             	sub    $0xc,%esp
c0107104:	68 db a4 10 c0       	push   $0xc010a4db
c0107109:	e8 7e 8f ff ff       	call   c010008c <disp_str>
c010710e:	83 c4 10             	add    $0x10,%esp
c0107111:	83 ec 0c             	sub    $0xc,%esp
c0107114:	68 04 a5 10 c0       	push   $0xc010a504
c0107119:	e8 6e 8f ff ff       	call   c010008c <disp_str>
c010711e:	83 c4 10             	add    $0x10,%esp
c0107121:	83 7d 08 0e          	cmpl   $0xe,0x8(%ebp)
c0107125:	75 45                	jne    c010716c <exception_handler+0x1c7>
c0107127:	0f 20 d0             	mov    %cr2,%eax
c010712a:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010712d:	83 ec 0c             	sub    $0xc,%esp
c0107130:	68 23 a5 10 c0       	push   $0xc010a523
c0107135:	e8 52 8f ff ff       	call   c010008c <disp_str>
c010713a:	83 c4 10             	add    $0x10,%esp
c010713d:	83 ec 0c             	sub    $0xc,%esp
c0107140:	68 aa a4 10 c0       	push   $0xc010a4aa
c0107145:	e8 42 8f ff ff       	call   c010008c <disp_str>
c010714a:	83 c4 10             	add    $0x10,%esp
c010714d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0107150:	83 ec 0c             	sub    $0xc,%esp
c0107153:	50                   	push   %eax
c0107154:	e8 e6 fc ff ff       	call   c0106e3f <disp_int>
c0107159:	83 c4 10             	add    $0x10,%esp
c010715c:	83 ec 0c             	sub    $0xc,%esp
c010715f:	68 af a4 10 c0       	push   $0xc010a4af
c0107164:	e8 23 8f ff ff       	call   c010008c <disp_str>
c0107169:	83 c4 10             	add    $0x10,%esp
c010716c:	83 7d 08 0d          	cmpl   $0xd,0x8(%ebp)
c0107170:	75 11                	jne    c0107183 <exception_handler+0x1de>
c0107172:	83 ec 0c             	sub    $0xc,%esp
c0107175:	68 2f a5 10 c0       	push   $0xc010a52f
c010717a:	e8 0d 8f ff ff       	call   c010008c <disp_str>
c010717f:	83 c4 10             	add    $0x10,%esp
c0107182:	90                   	nop
c0107183:	90                   	nop
c0107184:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0107187:	5b                   	pop    %ebx
c0107188:	5e                   	pop    %esi
c0107189:	5f                   	pop    %edi
c010718a:	5d                   	pop    %ebp
c010718b:	c3                   	ret    

c010718c <init_internal_interrupt>:
c010718c:	55                   	push   %ebp
c010718d:	89 e5                	mov    %esp,%ebp
c010718f:	83 ec 08             	sub    $0x8,%esp
c0107192:	6a 0e                	push   $0xe
c0107194:	6a 08                	push   $0x8
c0107196:	68 03 01 10 c0       	push   $0xc0100103
c010719b:	6a 00                	push   $0x0
c010719d:	e8 cc c7 ff ff       	call   c010396e <InitInterruptDesc>
c01071a2:	83 c4 10             	add    $0x10,%esp
c01071a5:	6a 0e                	push   $0xe
c01071a7:	6a 08                	push   $0x8
c01071a9:	68 09 01 10 c0       	push   $0xc0100109
c01071ae:	6a 01                	push   $0x1
c01071b0:	e8 b9 c7 ff ff       	call   c010396e <InitInterruptDesc>
c01071b5:	83 c4 10             	add    $0x10,%esp
c01071b8:	6a 0e                	push   $0xe
c01071ba:	6a 08                	push   $0x8
c01071bc:	68 0f 01 10 c0       	push   $0xc010010f
c01071c1:	6a 02                	push   $0x2
c01071c3:	e8 a6 c7 ff ff       	call   c010396e <InitInterruptDesc>
c01071c8:	83 c4 10             	add    $0x10,%esp
c01071cb:	6a 0e                	push   $0xe
c01071cd:	6a 08                	push   $0x8
c01071cf:	68 15 01 10 c0       	push   $0xc0100115
c01071d4:	6a 03                	push   $0x3
c01071d6:	e8 93 c7 ff ff       	call   c010396e <InitInterruptDesc>
c01071db:	83 c4 10             	add    $0x10,%esp
c01071de:	6a 0e                	push   $0xe
c01071e0:	6a 08                	push   $0x8
c01071e2:	68 1b 01 10 c0       	push   $0xc010011b
c01071e7:	6a 04                	push   $0x4
c01071e9:	e8 80 c7 ff ff       	call   c010396e <InitInterruptDesc>
c01071ee:	83 c4 10             	add    $0x10,%esp
c01071f1:	6a 0e                	push   $0xe
c01071f3:	6a 08                	push   $0x8
c01071f5:	68 21 01 10 c0       	push   $0xc0100121
c01071fa:	6a 05                	push   $0x5
c01071fc:	e8 6d c7 ff ff       	call   c010396e <InitInterruptDesc>
c0107201:	83 c4 10             	add    $0x10,%esp
c0107204:	6a 0e                	push   $0xe
c0107206:	6a 08                	push   $0x8
c0107208:	68 27 01 10 c0       	push   $0xc0100127
c010720d:	6a 06                	push   $0x6
c010720f:	e8 5a c7 ff ff       	call   c010396e <InitInterruptDesc>
c0107214:	83 c4 10             	add    $0x10,%esp
c0107217:	6a 0e                	push   $0xe
c0107219:	6a 08                	push   $0x8
c010721b:	68 2d 01 10 c0       	push   $0xc010012d
c0107220:	6a 07                	push   $0x7
c0107222:	e8 47 c7 ff ff       	call   c010396e <InitInterruptDesc>
c0107227:	83 c4 10             	add    $0x10,%esp
c010722a:	6a 0e                	push   $0xe
c010722c:	6a 08                	push   $0x8
c010722e:	68 33 01 10 c0       	push   $0xc0100133
c0107233:	6a 08                	push   $0x8
c0107235:	e8 34 c7 ff ff       	call   c010396e <InitInterruptDesc>
c010723a:	83 c4 10             	add    $0x10,%esp
c010723d:	6a 0e                	push   $0xe
c010723f:	6a 08                	push   $0x8
c0107241:	68 37 01 10 c0       	push   $0xc0100137
c0107246:	6a 09                	push   $0x9
c0107248:	e8 21 c7 ff ff       	call   c010396e <InitInterruptDesc>
c010724d:	83 c4 10             	add    $0x10,%esp
c0107250:	6a 0e                	push   $0xe
c0107252:	6a 08                	push   $0x8
c0107254:	68 3d 01 10 c0       	push   $0xc010013d
c0107259:	6a 0a                	push   $0xa
c010725b:	e8 0e c7 ff ff       	call   c010396e <InitInterruptDesc>
c0107260:	83 c4 10             	add    $0x10,%esp
c0107263:	6a 0e                	push   $0xe
c0107265:	6a 08                	push   $0x8
c0107267:	68 41 01 10 c0       	push   $0xc0100141
c010726c:	6a 0b                	push   $0xb
c010726e:	e8 fb c6 ff ff       	call   c010396e <InitInterruptDesc>
c0107273:	83 c4 10             	add    $0x10,%esp
c0107276:	6a 0e                	push   $0xe
c0107278:	6a 08                	push   $0x8
c010727a:	68 45 01 10 c0       	push   $0xc0100145
c010727f:	6a 0c                	push   $0xc
c0107281:	e8 e8 c6 ff ff       	call   c010396e <InitInterruptDesc>
c0107286:	83 c4 10             	add    $0x10,%esp
c0107289:	6a 0e                	push   $0xe
c010728b:	6a 08                	push   $0x8
c010728d:	68 49 01 10 c0       	push   $0xc0100149
c0107292:	6a 0d                	push   $0xd
c0107294:	e8 d5 c6 ff ff       	call   c010396e <InitInterruptDesc>
c0107299:	83 c4 10             	add    $0x10,%esp
c010729c:	6a 0e                	push   $0xe
c010729e:	6a 08                	push   $0x8
c01072a0:	68 54 01 10 c0       	push   $0xc0100154
c01072a5:	6a 0e                	push   $0xe
c01072a7:	e8 c2 c6 ff ff       	call   c010396e <InitInterruptDesc>
c01072ac:	83 c4 10             	add    $0x10,%esp
c01072af:	6a 0e                	push   $0xe
c01072b1:	6a 08                	push   $0x8
c01072b3:	68 58 01 10 c0       	push   $0xc0100158
c01072b8:	6a 10                	push   $0x10
c01072ba:	e8 af c6 ff ff       	call   c010396e <InitInterruptDesc>
c01072bf:	83 c4 10             	add    $0x10,%esp
c01072c2:	6a 0e                	push   $0xe
c01072c4:	6a 08                	push   $0x8
c01072c6:	68 5e 01 10 c0       	push   $0xc010015e
c01072cb:	6a 11                	push   $0x11
c01072cd:	e8 9c c6 ff ff       	call   c010396e <InitInterruptDesc>
c01072d2:	83 c4 10             	add    $0x10,%esp
c01072d5:	6a 0e                	push   $0xe
c01072d7:	6a 08                	push   $0x8
c01072d9:	68 62 01 10 c0       	push   $0xc0100162
c01072de:	6a 12                	push   $0x12
c01072e0:	e8 89 c6 ff ff       	call   c010396e <InitInterruptDesc>
c01072e5:	83 c4 10             	add    $0x10,%esp
c01072e8:	6a 0e                	push   $0xe
c01072ea:	6a 0e                	push   $0xe
c01072ec:	68 1e 02 10 c0       	push   $0xc010021e
c01072f1:	68 90 00 00 00       	push   $0x90
c01072f6:	e8 73 c6 ff ff       	call   c010396e <InitInterruptDesc>
c01072fb:	83 c4 10             	add    $0x10,%esp
c01072fe:	90                   	nop
c01072ff:	c9                   	leave  
c0107300:	c3                   	ret    

c0107301 <spurious_irq>:
c0107301:	55                   	push   %ebp
c0107302:	89 e5                	mov    %esp,%ebp
c0107304:	83 ec 08             	sub    $0x8,%esp
c0107307:	83 ec 08             	sub    $0x8,%esp
c010730a:	6a 0b                	push   $0xb
c010730c:	68 8c a7 10 c0       	push   $0xc010a78c
c0107311:	e8 b1 8d ff ff       	call   c01000c7 <disp_str_colour>
c0107316:	83 c4 10             	add    $0x10,%esp
c0107319:	83 ec 0c             	sub    $0xc,%esp
c010731c:	ff 75 08             	pushl  0x8(%ebp)
c010731f:	e8 1b fb ff ff       	call   c0106e3f <disp_int>
c0107324:	83 c4 10             	add    $0x10,%esp
c0107327:	a1 e8 0e 11 c0       	mov    0xc0110ee8,%eax
c010732c:	8b 15 ec 0e 11 c0    	mov    0xc0110eec,%edx
c0107332:	83 c0 01             	add    $0x1,%eax
c0107335:	83 d2 00             	adc    $0x0,%edx
c0107338:	a3 e8 0e 11 c0       	mov    %eax,0xc0110ee8
c010733d:	89 15 ec 0e 11 c0    	mov    %edx,0xc0110eec
c0107343:	83 ec 0c             	sub    $0xc,%esp
c0107346:	68 b3 a7 10 c0       	push   $0xc010a7b3
c010734b:	e8 3c 8d ff ff       	call   c010008c <disp_str>
c0107350:	83 c4 10             	add    $0x10,%esp
c0107353:	a1 e8 0e 11 c0       	mov    0xc0110ee8,%eax
c0107358:	8b 15 ec 0e 11 c0    	mov    0xc0110eec,%edx
c010735e:	83 ec 0c             	sub    $0xc,%esp
c0107361:	50                   	push   %eax
c0107362:	e8 d8 fa ff ff       	call   c0106e3f <disp_int>
c0107367:	83 c4 10             	add    $0x10,%esp
c010736a:	83 ec 0c             	sub    $0xc,%esp
c010736d:	68 b5 a7 10 c0       	push   $0xc010a7b5
c0107372:	e8 15 8d ff ff       	call   c010008c <disp_str>
c0107377:	83 c4 10             	add    $0x10,%esp
c010737a:	83 ec 08             	sub    $0x8,%esp
c010737d:	6a 0c                	push   $0xc
c010737f:	68 b8 a7 10 c0       	push   $0xc010a7b8
c0107384:	e8 3e 8d ff ff       	call   c01000c7 <disp_str_colour>
c0107389:	83 c4 10             	add    $0x10,%esp
c010738c:	90                   	nop
c010738d:	c9                   	leave  
c010738e:	c3                   	ret    

c010738f <init_keyboard>:
c010738f:	55                   	push   %ebp
c0107390:	89 e5                	mov    %esp,%ebp
c0107392:	83 ec 18             	sub    $0x18,%esp
c0107395:	83 ec 04             	sub    $0x4,%esp
c0107398:	68 00 02 00 00       	push   $0x200
c010739d:	6a 00                	push   $0x0
c010739f:	68 ec fb 10 c0       	push   $0xc010fbec
c01073a4:	e8 76 38 00 00       	call   c010ac1f <Memset>
c01073a9:	83 c4 10             	add    $0x10,%esp
c01073ac:	c7 05 e0 fb 10 c0 ec 	movl   $0xc010fbec,0xc010fbe0
c01073b3:	fb 10 c0 
c01073b6:	a1 e0 fb 10 c0       	mov    0xc010fbe0,%eax
c01073bb:	a3 e4 fb 10 c0       	mov    %eax,0xc010fbe4
c01073c0:	c7 05 e8 fb 10 c0 00 	movl   $0x0,0xc010fbe8
c01073c7:	00 00 00 
c01073ca:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c01073d1:	00 00 00 
c01073d4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01073db:	eb 04                	jmp    c01073e1 <init_keyboard+0x52>
c01073dd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01073e1:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c01073e8:	7e f3                	jle    c01073dd <init_keyboard+0x4e>
c01073ea:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c01073f1:	00 00 00 
c01073f4:	e8 8f d3 ff ff       	call   c0104788 <init_keyboard_handler>
c01073f9:	90                   	nop
c01073fa:	c9                   	leave  
c01073fb:	c3                   	ret    

c01073fc <TestTTY>:
c01073fc:	55                   	push   %ebp
c01073fd:	89 e5                	mov    %esp,%ebp
c01073ff:	83 ec 28             	sub    $0x28,%esp
c0107402:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0107409:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0107410:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0107416:	83 ec 08             	sub    $0x8,%esp
c0107419:	6a 02                	push   $0x2
c010741b:	8d 45 de             	lea    -0x22(%ebp),%eax
c010741e:	50                   	push   %eax
c010741f:	e8 0a d5 ff ff       	call   c010492e <open>
c0107424:	83 c4 10             	add    $0x10,%esp
c0107427:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010742a:	83 ec 08             	sub    $0x8,%esp
c010742d:	6a 02                	push   $0x2
c010742f:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107432:	50                   	push   %eax
c0107433:	e8 f6 d4 ff ff       	call   c010492e <open>
c0107438:	83 c4 10             	add    $0x10,%esp
c010743b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010743e:	83 ec 0c             	sub    $0xc,%esp
c0107441:	68 dd a7 10 c0       	push   $0xc010a7dd
c0107446:	e8 87 0c 00 00       	call   c01080d2 <Printf>
c010744b:	83 c4 10             	add    $0x10,%esp
c010744e:	83 ec 0c             	sub    $0xc,%esp
c0107451:	6a 0a                	push   $0xa
c0107453:	e8 24 a0 ff ff       	call   c010147c <sys_malloc>
c0107458:	83 c4 10             	add    $0x10,%esp
c010745b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010745e:	83 ec 04             	sub    $0x4,%esp
c0107461:	6a 0a                	push   $0xa
c0107463:	6a 00                	push   $0x0
c0107465:	ff 75 ec             	pushl  -0x14(%ebp)
c0107468:	e8 b2 37 00 00       	call   c010ac1f <Memset>
c010746d:	83 c4 10             	add    $0x10,%esp
c0107470:	83 ec 04             	sub    $0x4,%esp
c0107473:	6a 0a                	push   $0xa
c0107475:	ff 75 ec             	pushl  -0x14(%ebp)
c0107478:	ff 75 f0             	pushl  -0x10(%ebp)
c010747b:	e8 43 d5 ff ff       	call   c01049c3 <read>
c0107480:	83 c4 10             	add    $0x10,%esp
c0107483:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0107486:	83 ec 08             	sub    $0x8,%esp
c0107489:	ff 75 ec             	pushl  -0x14(%ebp)
c010748c:	68 ef a7 10 c0       	push   $0xc010a7ef
c0107491:	e8 3c 0c 00 00       	call   c01080d2 <Printf>
c0107496:	83 c4 10             	add    $0x10,%esp
c0107499:	eb c3                	jmp    c010745e <TestTTY+0x62>

c010749b <TestFS>:
c010749b:	55                   	push   %ebp
c010749c:	89 e5                	mov    %esp,%ebp
c010749e:	81 ec 28 01 00 00    	sub    $0x128,%esp
c01074a4:	83 ec 0c             	sub    $0xc,%esp
c01074a7:	68 f9 a7 10 c0       	push   $0xc010a7f9
c01074ac:	e8 db 8b ff ff       	call   c010008c <disp_str>
c01074b1:	83 c4 10             	add    $0x10,%esp
c01074b4:	c7 45 be 64 65 76 5f 	movl   $0x5f766564,-0x42(%ebp)
c01074bb:	c7 45 c2 74 74 79 31 	movl   $0x31797474,-0x3e(%ebp)
c01074c2:	66 c7 45 c6 00 00    	movw   $0x0,-0x3a(%ebp)
c01074c8:	66 87 db             	xchg   %bx,%bx
c01074cb:	83 ec 08             	sub    $0x8,%esp
c01074ce:	6a 02                	push   $0x2
c01074d0:	8d 45 be             	lea    -0x42(%ebp),%eax
c01074d3:	50                   	push   %eax
c01074d4:	e8 55 d4 ff ff       	call   c010492e <open>
c01074d9:	83 c4 10             	add    $0x10,%esp
c01074dc:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01074df:	66 87 db             	xchg   %bx,%bx
c01074e2:	83 ec 08             	sub    $0x8,%esp
c01074e5:	6a 02                	push   $0x2
c01074e7:	8d 45 be             	lea    -0x42(%ebp),%eax
c01074ea:	50                   	push   %eax
c01074eb:	e8 3e d4 ff ff       	call   c010492e <open>
c01074f0:	83 c4 10             	add    $0x10,%esp
c01074f3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01074f6:	66 87 db             	xchg   %bx,%bx
c01074f9:	83 ec 0c             	sub    $0xc,%esp
c01074fc:	68 dd a7 10 c0       	push   $0xc010a7dd
c0107501:	e8 cc 0b 00 00       	call   c01080d2 <Printf>
c0107506:	83 c4 10             	add    $0x10,%esp
c0107509:	66 87 db             	xchg   %bx,%bx
c010750c:	c7 45 b9 41 43 00 00 	movl   $0x4341,-0x47(%ebp)
c0107513:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
c0107517:	c7 45 b4 63 41 42 00 	movl   $0x424163,-0x4c(%ebp)
c010751e:	c6 45 b8 00          	movb   $0x0,-0x48(%ebp)
c0107522:	c7 45 aa 49 4e 54 45 	movl   $0x45544e49,-0x56(%ebp)
c0107529:	c7 45 ae 52 52 55 50 	movl   $0x50555252,-0x52(%ebp)
c0107530:	66 c7 45 b2 54 00    	movw   $0x54,-0x4e(%ebp)
c0107536:	66 87 db             	xchg   %bx,%bx
c0107539:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c0107540:	66 87 db             	xchg   %bx,%bx
c0107543:	83 ec 0c             	sub    $0xc,%esp
c0107546:	68 01 a8 10 c0       	push   $0xc010a801
c010754b:	e8 82 0b 00 00       	call   c01080d2 <Printf>
c0107550:	83 c4 10             	add    $0x10,%esp
c0107553:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c0107557:	0f 85 43 03 00 00    	jne    c01078a0 <TestFS+0x405>
c010755d:	83 ec 08             	sub    $0x8,%esp
c0107560:	6a 07                	push   $0x7
c0107562:	8d 45 b9             	lea    -0x47(%ebp),%eax
c0107565:	50                   	push   %eax
c0107566:	e8 c3 d3 ff ff       	call   c010492e <open>
c010756b:	83 c4 10             	add    $0x10,%esp
c010756e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0107571:	83 ec 08             	sub    $0x8,%esp
c0107574:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107577:	68 19 a8 10 c0       	push   $0xc010a819
c010757c:	e8 51 0b 00 00       	call   c01080d2 <Printf>
c0107581:	83 c4 10             	add    $0x10,%esp
c0107584:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010758b:	c7 45 96 63 67 3a 68 	movl   $0x683a6763,-0x6a(%ebp)
c0107592:	c7 45 9a 65 6c 6c 6f 	movl   $0x6f6c6c65,-0x66(%ebp)
c0107599:	c7 45 9e 2c 77 6f 72 	movl   $0x726f772c,-0x62(%ebp)
c01075a0:	c7 45 a2 6c 64 21 00 	movl   $0x21646c,-0x5e(%ebp)
c01075a7:	c7 45 a6 00 00 00 00 	movl   $0x0,-0x5a(%ebp)
c01075ae:	83 ec 0c             	sub    $0xc,%esp
c01075b1:	8d 45 96             	lea    -0x6a(%ebp),%eax
c01075b4:	50                   	push   %eax
c01075b5:	e8 9e 36 00 00       	call   c010ac58 <Strlen>
c01075ba:	83 c4 10             	add    $0x10,%esp
c01075bd:	83 ec 04             	sub    $0x4,%esp
c01075c0:	50                   	push   %eax
c01075c1:	8d 45 96             	lea    -0x6a(%ebp),%eax
c01075c4:	50                   	push   %eax
c01075c5:	ff 75 e4             	pushl  -0x1c(%ebp)
c01075c8:	e8 77 d5 ff ff       	call   c0104b44 <write>
c01075cd:	83 c4 10             	add    $0x10,%esp
c01075d0:	83 ec 04             	sub    $0x4,%esp
c01075d3:	6a 14                	push   $0x14
c01075d5:	6a 00                	push   $0x0
c01075d7:	8d 45 82             	lea    -0x7e(%ebp),%eax
c01075da:	50                   	push   %eax
c01075db:	e8 3f 36 00 00       	call   c010ac1f <Memset>
c01075e0:	83 c4 10             	add    $0x10,%esp
c01075e3:	83 ec 04             	sub    $0x4,%esp
c01075e6:	6a 12                	push   $0x12
c01075e8:	8d 45 82             	lea    -0x7e(%ebp),%eax
c01075eb:	50                   	push   %eax
c01075ec:	ff 75 e4             	pushl  -0x1c(%ebp)
c01075ef:	e8 cf d3 ff ff       	call   c01049c3 <read>
c01075f4:	83 c4 10             	add    $0x10,%esp
c01075f7:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01075fa:	83 ec 08             	sub    $0x8,%esp
c01075fd:	8d 45 82             	lea    -0x7e(%ebp),%eax
c0107600:	50                   	push   %eax
c0107601:	68 22 a8 10 c0       	push   $0xc010a822
c0107606:	e8 c7 0a 00 00       	call   c01080d2 <Printf>
c010760b:	83 c4 10             	add    $0x10,%esp
c010760e:	66 87 db             	xchg   %bx,%bx
c0107611:	83 ec 0c             	sub    $0xc,%esp
c0107614:	6a 0a                	push   $0xa
c0107616:	e8 83 09 00 00       	call   c0107f9e <delay>
c010761b:	83 c4 10             	add    $0x10,%esp
c010761e:	83 ec 08             	sub    $0x8,%esp
c0107621:	6a 07                	push   $0x7
c0107623:	8d 45 b4             	lea    -0x4c(%ebp),%eax
c0107626:	50                   	push   %eax
c0107627:	e8 02 d3 ff ff       	call   c010492e <open>
c010762c:	83 c4 10             	add    $0x10,%esp
c010762f:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0107632:	83 ec 08             	sub    $0x8,%esp
c0107635:	ff 75 dc             	pushl  -0x24(%ebp)
c0107638:	68 2d a8 10 c0       	push   $0xc010a82d
c010763d:	e8 90 0a 00 00       	call   c01080d2 <Printf>
c0107642:	83 c4 10             	add    $0x10,%esp
c0107645:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010764c:	c7 85 6e ff ff ff 63 	movl   $0x683a6763,-0x92(%ebp)
c0107653:	67 3a 68 
c0107656:	c7 85 72 ff ff ff 6f 	movl   $0x6120776f,-0x8e(%ebp)
c010765d:	77 20 61 
c0107660:	c7 85 76 ff ff ff 72 	movl   $0x79206572,-0x8a(%ebp)
c0107667:	65 20 79 
c010766a:	c7 85 7a ff ff ff 6f 	movl   $0x3f756f,-0x86(%ebp)
c0107671:	75 3f 00 
c0107674:	c7 85 7e ff ff ff 00 	movl   $0x0,-0x82(%ebp)
c010767b:	00 00 00 
c010767e:	83 ec 0c             	sub    $0xc,%esp
c0107681:	8d 85 6e ff ff ff    	lea    -0x92(%ebp),%eax
c0107687:	50                   	push   %eax
c0107688:	e8 cb 35 00 00       	call   c010ac58 <Strlen>
c010768d:	83 c4 10             	add    $0x10,%esp
c0107690:	83 ec 04             	sub    $0x4,%esp
c0107693:	50                   	push   %eax
c0107694:	8d 85 6e ff ff ff    	lea    -0x92(%ebp),%eax
c010769a:	50                   	push   %eax
c010769b:	ff 75 dc             	pushl  -0x24(%ebp)
c010769e:	e8 a1 d4 ff ff       	call   c0104b44 <write>
c01076a3:	83 c4 10             	add    $0x10,%esp
c01076a6:	83 ec 04             	sub    $0x4,%esp
c01076a9:	6a 14                	push   $0x14
c01076ab:	6a 00                	push   $0x0
c01076ad:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c01076b3:	50                   	push   %eax
c01076b4:	e8 66 35 00 00       	call   c010ac1f <Memset>
c01076b9:	83 c4 10             	add    $0x10,%esp
c01076bc:	83 ec 04             	sub    $0x4,%esp
c01076bf:	6a 12                	push   $0x12
c01076c1:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c01076c7:	50                   	push   %eax
c01076c8:	ff 75 dc             	pushl  -0x24(%ebp)
c01076cb:	e8 f3 d2 ff ff       	call   c01049c3 <read>
c01076d0:	83 c4 10             	add    $0x10,%esp
c01076d3:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01076d6:	83 ec 08             	sub    $0x8,%esp
c01076d9:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c01076df:	50                   	push   %eax
c01076e0:	68 37 a8 10 c0       	push   $0xc010a837
c01076e5:	e8 e8 09 00 00       	call   c01080d2 <Printf>
c01076ea:	83 c4 10             	add    $0x10,%esp
c01076ed:	83 ec 08             	sub    $0x8,%esp
c01076f0:	6a 07                	push   $0x7
c01076f2:	8d 45 aa             	lea    -0x56(%ebp),%eax
c01076f5:	50                   	push   %eax
c01076f6:	e8 33 d2 ff ff       	call   c010492e <open>
c01076fb:	83 c4 10             	add    $0x10,%esp
c01076fe:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0107701:	83 ec 08             	sub    $0x8,%esp
c0107704:	ff 75 dc             	pushl  -0x24(%ebp)
c0107707:	68 2d a8 10 c0       	push   $0xc010a82d
c010770c:	e8 c1 09 00 00       	call   c01080d2 <Printf>
c0107711:	83 c4 10             	add    $0x10,%esp
c0107714:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c010771b:	c7 85 3c ff ff ff 49 	movl   $0x69772049,-0xc4(%ebp)
c0107722:	20 77 69 
c0107725:	c7 85 40 ff ff ff 6c 	movl   $0x73206c6c,-0xc0(%ebp)
c010772c:	6c 20 73 
c010772f:	c7 85 44 ff ff ff 75 	movl   $0x65636375,-0xbc(%ebp)
c0107736:	63 63 65 
c0107739:	c7 85 48 ff ff ff 73 	movl   $0x61207373,-0xb8(%ebp)
c0107740:	73 20 61 
c0107743:	c7 85 4c ff ff ff 74 	movl   $0x616c2074,-0xb4(%ebp)
c010774a:	20 6c 61 
c010774d:	c7 85 50 ff ff ff 73 	movl   $0x2e7473,-0xb0(%ebp)
c0107754:	74 2e 00 
c0107757:	c7 85 54 ff ff ff 00 	movl   $0x0,-0xac(%ebp)
c010775e:	00 00 00 
c0107761:	66 c7 85 58 ff ff ff 	movw   $0x0,-0xa8(%ebp)
c0107768:	00 00 
c010776a:	83 ec 0c             	sub    $0xc,%esp
c010776d:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c0107773:	50                   	push   %eax
c0107774:	e8 df 34 00 00       	call   c010ac58 <Strlen>
c0107779:	83 c4 10             	add    $0x10,%esp
c010777c:	83 ec 04             	sub    $0x4,%esp
c010777f:	50                   	push   %eax
c0107780:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c0107786:	50                   	push   %eax
c0107787:	ff 75 d4             	pushl  -0x2c(%ebp)
c010778a:	e8 b5 d3 ff ff       	call   c0104b44 <write>
c010778f:	83 c4 10             	add    $0x10,%esp
c0107792:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0107799:	eb 5c                	jmp    c01077f7 <TestFS+0x35c>
c010779b:	83 ec 04             	sub    $0x4,%esp
c010779e:	6a 1e                	push   $0x1e
c01077a0:	6a 00                	push   $0x0
c01077a2:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c01077a8:	50                   	push   %eax
c01077a9:	e8 71 34 00 00       	call   c010ac1f <Memset>
c01077ae:	83 c4 10             	add    $0x10,%esp
c01077b1:	83 ec 0c             	sub    $0xc,%esp
c01077b4:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c01077ba:	50                   	push   %eax
c01077bb:	e8 98 34 00 00       	call   c010ac58 <Strlen>
c01077c0:	83 c4 10             	add    $0x10,%esp
c01077c3:	83 ec 04             	sub    $0x4,%esp
c01077c6:	50                   	push   %eax
c01077c7:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c01077cd:	50                   	push   %eax
c01077ce:	ff 75 d4             	pushl  -0x2c(%ebp)
c01077d1:	e8 ed d1 ff ff       	call   c01049c3 <read>
c01077d6:	83 c4 10             	add    $0x10,%esp
c01077d9:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01077dc:	83 ec 08             	sub    $0x8,%esp
c01077df:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c01077e5:	50                   	push   %eax
c01077e6:	68 42 a8 10 c0       	push   $0xc010a842
c01077eb:	e8 e2 08 00 00       	call   c01080d2 <Printf>
c01077f0:	83 c4 10             	add    $0x10,%esp
c01077f3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01077f7:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c01077fb:	7e 9e                	jle    c010779b <TestFS+0x300>
c01077fd:	c7 85 0a ff ff ff 69 	movl   $0x74736e69,-0xf6(%ebp)
c0107804:	6e 73 74 
c0107807:	c7 85 0e ff ff ff 61 	movl   $0x2e6c6c61,-0xf2(%ebp)
c010780e:	6c 6c 2e 
c0107811:	c7 85 12 ff ff ff 74 	movl   $0x726174,-0xee(%ebp)
c0107818:	61 72 00 
c010781b:	c7 85 16 ff ff ff 00 	movl   $0x0,-0xea(%ebp)
c0107822:	00 00 00 
c0107825:	c7 85 1a ff ff ff 00 	movl   $0x0,-0xe6(%ebp)
c010782c:	00 00 00 
c010782f:	83 ec 08             	sub    $0x8,%esp
c0107832:	6a 00                	push   $0x0
c0107834:	8d 85 0a ff ff ff    	lea    -0xf6(%ebp),%eax
c010783a:	50                   	push   %eax
c010783b:	e8 ee d0 ff ff       	call   c010492e <open>
c0107840:	83 c4 10             	add    $0x10,%esp
c0107843:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0107846:	83 ec 08             	sub    $0x8,%esp
c0107849:	ff 75 cc             	pushl  -0x34(%ebp)
c010784c:	68 4d a8 10 c0       	push   $0xc010a84d
c0107851:	e8 7c 08 00 00       	call   c01080d2 <Printf>
c0107856:	83 c4 10             	add    $0x10,%esp
c0107859:	83 ec 04             	sub    $0x4,%esp
c010785c:	6a 28                	push   $0x28
c010785e:	6a 00                	push   $0x0
c0107860:	8d 85 e2 fe ff ff    	lea    -0x11e(%ebp),%eax
c0107866:	50                   	push   %eax
c0107867:	e8 b3 33 00 00       	call   c010ac1f <Memset>
c010786c:	83 c4 10             	add    $0x10,%esp
c010786f:	83 ec 04             	sub    $0x4,%esp
c0107872:	6a 28                	push   $0x28
c0107874:	8d 85 e2 fe ff ff    	lea    -0x11e(%ebp),%eax
c010787a:	50                   	push   %eax
c010787b:	ff 75 cc             	pushl  -0x34(%ebp)
c010787e:	e8 40 d1 ff ff       	call   c01049c3 <read>
c0107883:	83 c4 10             	add    $0x10,%esp
c0107886:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0107889:	83 ec 08             	sub    $0x8,%esp
c010788c:	8d 85 e2 fe ff ff    	lea    -0x11e(%ebp),%eax
c0107892:	50                   	push   %eax
c0107893:	68 57 a8 10 c0       	push   $0xc010a857
c0107898:	e8 35 08 00 00       	call   c01080d2 <Printf>
c010789d:	83 c4 10             	add    $0x10,%esp
c01078a0:	90                   	nop
c01078a1:	c9                   	leave  
c01078a2:	c3                   	ret    

c01078a3 <wait_exit>:
c01078a3:	55                   	push   %ebp
c01078a4:	89 e5                	mov    %esp,%ebp
c01078a6:	83 ec 28             	sub    $0x28,%esp
c01078a9:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c01078b0:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c01078b7:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c01078bd:	83 ec 08             	sub    $0x8,%esp
c01078c0:	6a 02                	push   $0x2
c01078c2:	8d 45 de             	lea    -0x22(%ebp),%eax
c01078c5:	50                   	push   %eax
c01078c6:	e8 63 d0 ff ff       	call   c010492e <open>
c01078cb:	83 c4 10             	add    $0x10,%esp
c01078ce:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01078d1:	83 ec 08             	sub    $0x8,%esp
c01078d4:	6a 02                	push   $0x2
c01078d6:	8d 45 de             	lea    -0x22(%ebp),%eax
c01078d9:	50                   	push   %eax
c01078da:	e8 4f d0 ff ff       	call   c010492e <open>
c01078df:	83 c4 10             	add    $0x10,%esp
c01078e2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01078e5:	e8 a4 d3 ff ff       	call   c0104c8e <fork>
c01078ea:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01078ed:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c01078f1:	7e 25                	jle    c0107918 <wait_exit+0x75>
c01078f3:	83 ec 0c             	sub    $0xc,%esp
c01078f6:	8d 45 d8             	lea    -0x28(%ebp),%eax
c01078f9:	50                   	push   %eax
c01078fa:	e8 1c d3 ff ff       	call   c0104c1b <wait>
c01078ff:	83 c4 10             	add    $0x10,%esp
c0107902:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0107905:	83 ec 08             	sub    $0x8,%esp
c0107908:	50                   	push   %eax
c0107909:	68 62 a8 10 c0       	push   $0xc010a862
c010790e:	e8 bf 07 00 00       	call   c01080d2 <Printf>
c0107913:	83 c4 10             	add    $0x10,%esp
c0107916:	eb fe                	jmp    c0107916 <wait_exit+0x73>
c0107918:	83 ec 0c             	sub    $0xc,%esp
c010791b:	68 7d a8 10 c0       	push   $0xc010a87d
c0107920:	e8 ad 07 00 00       	call   c01080d2 <Printf>
c0107925:	83 c4 10             	add    $0x10,%esp
c0107928:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c010792f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0107932:	8d 50 01             	lea    0x1(%eax),%edx
c0107935:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0107938:	3d 50 c3 00 00       	cmp    $0xc350,%eax
c010793d:	7f 02                	jg     c0107941 <wait_exit+0x9e>
c010793f:	eb ee                	jmp    c010792f <wait_exit+0x8c>
c0107941:	90                   	nop
c0107942:	83 ec 0c             	sub    $0xc,%esp
c0107945:	68 89 a8 10 c0       	push   $0xc010a889
c010794a:	e8 83 07 00 00       	call   c01080d2 <Printf>
c010794f:	83 c4 10             	add    $0x10,%esp
c0107952:	83 ec 0c             	sub    $0xc,%esp
c0107955:	6a 5a                	push   $0x5a
c0107957:	e8 03 d3 ff ff       	call   c0104c5f <exit>
c010795c:	83 c4 10             	add    $0x10,%esp
c010795f:	83 ec 0c             	sub    $0xc,%esp
c0107962:	68 97 a8 10 c0       	push   $0xc010a897
c0107967:	e8 66 07 00 00       	call   c01080d2 <Printf>
c010796c:	83 c4 10             	add    $0x10,%esp
c010796f:	eb fe                	jmp    c010796f <wait_exit+0xcc>

c0107971 <INIT_fork>:
c0107971:	55                   	push   %ebp
c0107972:	89 e5                	mov    %esp,%ebp
c0107974:	83 ec 78             	sub    $0x78,%esp
c0107977:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c010797e:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0107985:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c010798b:	83 ec 08             	sub    $0x8,%esp
c010798e:	6a 02                	push   $0x2
c0107990:	8d 45 de             	lea    -0x22(%ebp),%eax
c0107993:	50                   	push   %eax
c0107994:	e8 95 cf ff ff       	call   c010492e <open>
c0107999:	83 c4 10             	add    $0x10,%esp
c010799c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010799f:	83 ec 08             	sub    $0x8,%esp
c01079a2:	6a 02                	push   $0x2
c01079a4:	8d 45 de             	lea    -0x22(%ebp),%eax
c01079a7:	50                   	push   %eax
c01079a8:	e8 81 cf ff ff       	call   c010492e <open>
c01079ad:	83 c4 10             	add    $0x10,%esp
c01079b0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01079b3:	c7 45 b6 49 4e 49 54 	movl   $0x54494e49,-0x4a(%ebp)
c01079ba:	c7 45 ba 20 69 73 20 	movl   $0x20736920,-0x46(%ebp)
c01079c1:	c7 45 be 72 75 6e 6e 	movl   $0x6e6e7572,-0x42(%ebp)
c01079c8:	c7 45 c2 69 6e 67 0a 	movl   $0xa676e69,-0x3e(%ebp)
c01079cf:	c7 45 c6 00 00 00 00 	movl   $0x0,-0x3a(%ebp)
c01079d6:	c7 45 ca 00 00 00 00 	movl   $0x0,-0x36(%ebp)
c01079dd:	c7 45 ce 00 00 00 00 	movl   $0x0,-0x32(%ebp)
c01079e4:	c7 45 d2 00 00 00 00 	movl   $0x0,-0x2e(%ebp)
c01079eb:	c7 45 d6 00 00 00 00 	movl   $0x0,-0x2a(%ebp)
c01079f2:	c7 45 da 00 00 00 00 	movl   $0x0,-0x26(%ebp)
c01079f9:	83 ec 0c             	sub    $0xc,%esp
c01079fc:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c01079ff:	50                   	push   %eax
c0107a00:	e8 cd 06 00 00       	call   c01080d2 <Printf>
c0107a05:	83 c4 10             	add    $0x10,%esp
c0107a08:	83 ec 0c             	sub    $0xc,%esp
c0107a0b:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107a0e:	50                   	push   %eax
c0107a0f:	e8 44 32 00 00       	call   c010ac58 <Strlen>
c0107a14:	83 c4 10             	add    $0x10,%esp
c0107a17:	83 ec 04             	sub    $0x4,%esp
c0107a1a:	50                   	push   %eax
c0107a1b:	6a 00                	push   $0x0
c0107a1d:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107a20:	50                   	push   %eax
c0107a21:	e8 f9 31 00 00       	call   c010ac1f <Memset>
c0107a26:	83 c4 10             	add    $0x10,%esp
c0107a29:	83 ec 04             	sub    $0x4,%esp
c0107a2c:	6a 28                	push   $0x28
c0107a2e:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107a31:	50                   	push   %eax
c0107a32:	ff 75 f0             	pushl  -0x10(%ebp)
c0107a35:	e8 89 cf ff ff       	call   c01049c3 <read>
c0107a3a:	83 c4 10             	add    $0x10,%esp
c0107a3d:	83 ec 0c             	sub    $0xc,%esp
c0107a40:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107a43:	50                   	push   %eax
c0107a44:	e8 89 06 00 00       	call   c01080d2 <Printf>
c0107a49:	83 c4 10             	add    $0x10,%esp
c0107a4c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0107a53:	e8 36 d2 ff ff       	call   c0104c8e <fork>
c0107a58:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0107a5b:	83 ec 0c             	sub    $0xc,%esp
c0107a5e:	6a 01                	push   $0x1
c0107a60:	e8 39 05 00 00       	call   c0107f9e <delay>
c0107a65:	83 c4 10             	add    $0x10,%esp
c0107a68:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0107a6c:	0f 8e c5 00 00 00    	jle    c0107b37 <INIT_fork+0x1c6>
c0107a72:	83 ec 0c             	sub    $0xc,%esp
c0107a75:	68 a5 a8 10 c0       	push   $0xc010a8a5
c0107a7a:	e8 53 06 00 00       	call   c01080d2 <Printf>
c0107a7f:	83 c4 10             	add    $0x10,%esp
c0107a82:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0107a86:	c7 45 8e 50 61 72 65 	movl   $0x65726150,-0x72(%ebp)
c0107a8d:	c7 45 92 6e 74 2e 4e 	movl   $0x4e2e746e,-0x6e(%ebp)
c0107a94:	c7 45 96 69 63 65 20 	movl   $0x20656369,-0x6a(%ebp)
c0107a9b:	c7 45 9a 74 6f 20 6d 	movl   $0x6d206f74,-0x66(%ebp)
c0107aa2:	c7 45 9e 65 65 74 20 	movl   $0x20746565,-0x62(%ebp)
c0107aa9:	c7 45 a2 79 6f 75 21 	movl   $0x21756f79,-0x5e(%ebp)
c0107ab0:	c7 45 a6 0a 00 00 00 	movl   $0xa,-0x5a(%ebp)
c0107ab7:	c7 45 aa 00 00 00 00 	movl   $0x0,-0x56(%ebp)
c0107abe:	c7 45 ae 00 00 00 00 	movl   $0x0,-0x52(%ebp)
c0107ac5:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)
c0107acc:	83 ec 0c             	sub    $0xc,%esp
c0107acf:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107ad2:	50                   	push   %eax
c0107ad3:	e8 80 31 00 00       	call   c010ac58 <Strlen>
c0107ad8:	83 c4 10             	add    $0x10,%esp
c0107adb:	83 ec 04             	sub    $0x4,%esp
c0107ade:	50                   	push   %eax
c0107adf:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107ae2:	50                   	push   %eax
c0107ae3:	ff 75 f4             	pushl  -0xc(%ebp)
c0107ae6:	e8 59 d0 ff ff       	call   c0104b44 <write>
c0107aeb:	83 c4 10             	add    $0x10,%esp
c0107aee:	83 ec 0c             	sub    $0xc,%esp
c0107af1:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107af4:	50                   	push   %eax
c0107af5:	e8 5e 31 00 00       	call   c010ac58 <Strlen>
c0107afa:	83 c4 10             	add    $0x10,%esp
c0107afd:	83 ec 04             	sub    $0x4,%esp
c0107b00:	50                   	push   %eax
c0107b01:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107b04:	50                   	push   %eax
c0107b05:	ff 75 f4             	pushl  -0xc(%ebp)
c0107b08:	e8 37 d0 ff ff       	call   c0104b44 <write>
c0107b0d:	83 c4 10             	add    $0x10,%esp
c0107b10:	83 ec 0c             	sub    $0xc,%esp
c0107b13:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107b16:	50                   	push   %eax
c0107b17:	e8 3c 31 00 00       	call   c010ac58 <Strlen>
c0107b1c:	83 c4 10             	add    $0x10,%esp
c0107b1f:	83 ec 04             	sub    $0x4,%esp
c0107b22:	50                   	push   %eax
c0107b23:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107b26:	50                   	push   %eax
c0107b27:	ff 75 f4             	pushl  -0xc(%ebp)
c0107b2a:	e8 15 d0 ff ff       	call   c0104b44 <write>
c0107b2f:	83 c4 10             	add    $0x10,%esp
c0107b32:	e9 c3 00 00 00       	jmp    c0107bfa <INIT_fork+0x289>
c0107b37:	83 ec 0c             	sub    $0xc,%esp
c0107b3a:	6a 01                	push   $0x1
c0107b3c:	e8 5d 04 00 00       	call   c0107f9e <delay>
c0107b41:	83 c4 10             	add    $0x10,%esp
c0107b44:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0107b48:	83 45 ec 02          	addl   $0x2,-0x14(%ebp)
c0107b4c:	c7 45 8e 43 68 69 6c 	movl   $0x6c696843,-0x72(%ebp)
c0107b53:	c7 45 92 64 2e 53 65 	movl   $0x65532e64,-0x6e(%ebp)
c0107b5a:	c7 45 96 65 20 79 6f 	movl   $0x6f792065,-0x6a(%ebp)
c0107b61:	c7 45 9a 75 20 61 67 	movl   $0x67612075,-0x66(%ebp)
c0107b68:	c7 45 9e 61 69 6e 0a 	movl   $0xa6e6961,-0x62(%ebp)
c0107b6f:	c7 45 a2 00 00 00 00 	movl   $0x0,-0x5e(%ebp)
c0107b76:	c7 45 a6 00 00 00 00 	movl   $0x0,-0x5a(%ebp)
c0107b7d:	c7 45 aa 00 00 00 00 	movl   $0x0,-0x56(%ebp)
c0107b84:	c7 45 ae 00 00 00 00 	movl   $0x0,-0x52(%ebp)
c0107b8b:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)
c0107b92:	83 ec 0c             	sub    $0xc,%esp
c0107b95:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107b98:	50                   	push   %eax
c0107b99:	e8 ba 30 00 00       	call   c010ac58 <Strlen>
c0107b9e:	83 c4 10             	add    $0x10,%esp
c0107ba1:	83 ec 04             	sub    $0x4,%esp
c0107ba4:	50                   	push   %eax
c0107ba5:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107ba8:	50                   	push   %eax
c0107ba9:	ff 75 f4             	pushl  -0xc(%ebp)
c0107bac:	e8 93 cf ff ff       	call   c0104b44 <write>
c0107bb1:	83 c4 10             	add    $0x10,%esp
c0107bb4:	83 ec 0c             	sub    $0xc,%esp
c0107bb7:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107bba:	50                   	push   %eax
c0107bbb:	e8 98 30 00 00       	call   c010ac58 <Strlen>
c0107bc0:	83 c4 10             	add    $0x10,%esp
c0107bc3:	83 ec 04             	sub    $0x4,%esp
c0107bc6:	50                   	push   %eax
c0107bc7:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107bca:	50                   	push   %eax
c0107bcb:	ff 75 f4             	pushl  -0xc(%ebp)
c0107bce:	e8 71 cf ff ff       	call   c0104b44 <write>
c0107bd3:	83 c4 10             	add    $0x10,%esp
c0107bd6:	83 ec 0c             	sub    $0xc,%esp
c0107bd9:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107bdc:	50                   	push   %eax
c0107bdd:	e8 76 30 00 00       	call   c010ac58 <Strlen>
c0107be2:	83 c4 10             	add    $0x10,%esp
c0107be5:	83 ec 04             	sub    $0x4,%esp
c0107be8:	50                   	push   %eax
c0107be9:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0107bec:	50                   	push   %eax
c0107bed:	ff 75 f4             	pushl  -0xc(%ebp)
c0107bf0:	e8 4f cf ff ff       	call   c0104b44 <write>
c0107bf5:	83 c4 10             	add    $0x10,%esp
c0107bf8:	eb fe                	jmp    c0107bf8 <INIT_fork+0x287>
c0107bfa:	83 ec 04             	sub    $0x4,%esp
c0107bfd:	6a 28                	push   $0x28
c0107bff:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107c02:	50                   	push   %eax
c0107c03:	ff 75 f0             	pushl  -0x10(%ebp)
c0107c06:	e8 b8 cd ff ff       	call   c01049c3 <read>
c0107c0b:	83 c4 10             	add    $0x10,%esp
c0107c0e:	83 ec 0c             	sub    $0xc,%esp
c0107c11:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107c14:	50                   	push   %eax
c0107c15:	e8 b8 04 00 00       	call   c01080d2 <Printf>
c0107c1a:	83 c4 10             	add    $0x10,%esp
c0107c1d:	83 ec 0c             	sub    $0xc,%esp
c0107c20:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107c23:	50                   	push   %eax
c0107c24:	e8 a9 04 00 00       	call   c01080d2 <Printf>
c0107c29:	83 c4 10             	add    $0x10,%esp
c0107c2c:	83 ec 0c             	sub    $0xc,%esp
c0107c2f:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0107c32:	50                   	push   %eax
c0107c33:	e8 9a 04 00 00       	call   c01080d2 <Printf>
c0107c38:	83 c4 10             	add    $0x10,%esp
c0107c3b:	83 ec 0c             	sub    $0xc,%esp
c0107c3e:	68 ab a8 10 c0       	push   $0xc010a8ab
c0107c43:	e8 a3 07 00 00       	call   c01083eb <spin>
c0107c48:	83 c4 10             	add    $0x10,%esp
c0107c4b:	90                   	nop
c0107c4c:	c9                   	leave  
c0107c4d:	c3                   	ret    

c0107c4e <simple_shell>:
c0107c4e:	55                   	push   %ebp
c0107c4f:	89 e5                	mov    %esp,%ebp
c0107c51:	81 ec f8 00 00 00    	sub    $0xf8,%esp
c0107c57:	c7 45 c2 64 65 76 5f 	movl   $0x5f766564,-0x3e(%ebp)
c0107c5e:	c7 45 c6 74 74 79 31 	movl   $0x31797474,-0x3a(%ebp)
c0107c65:	66 c7 45 ca 00 00    	movw   $0x0,-0x36(%ebp)
c0107c6b:	83 ec 08             	sub    $0x8,%esp
c0107c6e:	6a 02                	push   $0x2
c0107c70:	8d 45 c2             	lea    -0x3e(%ebp),%eax
c0107c73:	50                   	push   %eax
c0107c74:	e8 b5 cc ff ff       	call   c010492e <open>
c0107c79:	83 c4 10             	add    $0x10,%esp
c0107c7c:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0107c7f:	83 ec 08             	sub    $0x8,%esp
c0107c82:	6a 02                	push   $0x2
c0107c84:	8d 45 c2             	lea    -0x3e(%ebp),%eax
c0107c87:	50                   	push   %eax
c0107c88:	e8 a1 cc ff ff       	call   c010492e <open>
c0107c8d:	83 c4 10             	add    $0x10,%esp
c0107c90:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0107c93:	83 ec 04             	sub    $0x4,%esp
c0107c96:	68 80 00 00 00       	push   $0x80
c0107c9b:	6a 00                	push   $0x0
c0107c9d:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c0107ca3:	50                   	push   %eax
c0107ca4:	e8 76 2f 00 00       	call   c010ac1f <Memset>
c0107ca9:	83 c4 10             	add    $0x10,%esp
c0107cac:	83 ec 04             	sub    $0x4,%esp
c0107caf:	68 80 00 00 00       	push   $0x80
c0107cb4:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c0107cba:	50                   	push   %eax
c0107cbb:	ff 75 e0             	pushl  -0x20(%ebp)
c0107cbe:	e8 00 cd ff ff       	call   c01049c3 <read>
c0107cc3:	83 c4 10             	add    $0x10,%esp
c0107cc6:	83 ec 08             	sub    $0x8,%esp
c0107cc9:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c0107ccf:	50                   	push   %eax
c0107cd0:	68 b3 a8 10 c0       	push   $0xc010a8b3
c0107cd5:	e8 f8 03 00 00       	call   c01080d2 <Printf>
c0107cda:	83 c4 10             	add    $0x10,%esp
c0107cdd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0107ce4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0107ceb:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c0107cf1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0107cf4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0107cf7:	0f b6 00             	movzbl (%eax),%eax
c0107cfa:	88 45 db             	mov    %al,-0x25(%ebp)
c0107cfd:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0107d00:	0f b6 00             	movzbl (%eax),%eax
c0107d03:	3c 20                	cmp    $0x20,%al
c0107d05:	74 1d                	je     c0107d24 <simple_shell+0xd6>
c0107d07:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0107d0a:	0f b6 00             	movzbl (%eax),%eax
c0107d0d:	84 c0                	test   %al,%al
c0107d0f:	74 13                	je     c0107d24 <simple_shell+0xd6>
c0107d11:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0107d15:	75 0d                	jne    c0107d24 <simple_shell+0xd6>
c0107d17:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0107d1a:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0107d1d:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0107d24:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0107d27:	0f b6 00             	movzbl (%eax),%eax
c0107d2a:	3c 20                	cmp    $0x20,%al
c0107d2c:	74 0a                	je     c0107d38 <simple_shell+0xea>
c0107d2e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0107d31:	0f b6 00             	movzbl (%eax),%eax
c0107d34:	84 c0                	test   %al,%al
c0107d36:	75 26                	jne    c0107d5e <simple_shell+0x110>
c0107d38:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
c0107d3c:	75 20                	jne    c0107d5e <simple_shell+0x110>
c0107d3e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0107d41:	8d 50 01             	lea    0x1(%eax),%edx
c0107d44:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0107d47:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0107d4a:	89 94 85 14 ff ff ff 	mov    %edx,-0xec(%ebp,%eax,4)
c0107d51:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0107d54:	c6 00 00             	movb   $0x0,(%eax)
c0107d57:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0107d5e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0107d62:	80 7d db 00          	cmpb   $0x0,-0x25(%ebp)
c0107d66:	75 8c                	jne    c0107cf4 <simple_shell+0xa6>
c0107d68:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0107d6b:	c7 84 85 14 ff ff ff 	movl   $0x0,-0xec(%ebp,%eax,4)
c0107d72:	00 00 00 00 
c0107d76:	c7 45 d4 ff ff ff ff 	movl   $0xffffffff,-0x2c(%ebp)
c0107d7d:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0107d83:	83 ec 08             	sub    $0x8,%esp
c0107d86:	6a 02                	push   $0x2
c0107d88:	50                   	push   %eax
c0107d89:	e8 a0 cb ff ff       	call   c010492e <open>
c0107d8e:	83 c4 10             	add    $0x10,%esp
c0107d91:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0107d94:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0107d98:	75 54                	jne    c0107dee <simple_shell+0x1a0>
c0107d9a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0107da1:	eb 29                	jmp    c0107dcc <simple_shell+0x17e>
c0107da3:	8b 95 14 ff ff ff    	mov    -0xec(%ebp),%edx
c0107da9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0107dac:	01 d0                	add    %edx,%eax
c0107dae:	0f b6 00             	movzbl (%eax),%eax
c0107db1:	0f be c0             	movsbl %al,%eax
c0107db4:	83 ec 04             	sub    $0x4,%esp
c0107db7:	50                   	push   %eax
c0107db8:	ff 75 e4             	pushl  -0x1c(%ebp)
c0107dbb:	68 c2 a8 10 c0       	push   $0xc010a8c2
c0107dc0:	e8 0d 03 00 00       	call   c01080d2 <Printf>
c0107dc5:	83 c4 10             	add    $0x10,%esp
c0107dc8:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0107dcc:	83 7d e4 05          	cmpl   $0x5,-0x1c(%ebp)
c0107dd0:	7e d1                	jle    c0107da3 <simple_shell+0x155>
c0107dd2:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0107dd8:	83 ec 08             	sub    $0x8,%esp
c0107ddb:	50                   	push   %eax
c0107ddc:	68 c9 a8 10 c0       	push   $0xc010a8c9
c0107de1:	e8 ec 02 00 00       	call   c01080d2 <Printf>
c0107de6:	83 c4 10             	add    $0x10,%esp
c0107de9:	e9 a5 fe ff ff       	jmp    c0107c93 <simple_shell+0x45>
c0107dee:	e8 9b ce ff ff       	call   c0104c8e <fork>
c0107df3:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0107df6:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0107dfa:	7e 17                	jle    c0107e13 <simple_shell+0x1c5>
c0107dfc:	83 ec 0c             	sub    $0xc,%esp
c0107dff:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c0107e05:	50                   	push   %eax
c0107e06:	e8 10 ce ff ff       	call   c0104c1b <wait>
c0107e0b:	83 c4 10             	add    $0x10,%esp
c0107e0e:	e9 80 fe ff ff       	jmp    c0107c93 <simple_shell+0x45>
c0107e13:	83 ec 0c             	sub    $0xc,%esp
c0107e16:	68 cf a8 10 c0       	push   $0xc010a8cf
c0107e1b:	e8 b2 02 00 00       	call   c01080d2 <Printf>
c0107e20:	83 c4 10             	add    $0x10,%esp
c0107e23:	83 ec 0c             	sub    $0xc,%esp
c0107e26:	ff 75 d0             	pushl  -0x30(%ebp)
c0107e29:	e8 9b cd ff ff       	call   c0104bc9 <close>
c0107e2e:	83 c4 10             	add    $0x10,%esp
c0107e31:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0107e37:	83 ec 08             	sub    $0x8,%esp
c0107e3a:	8d 95 14 ff ff ff    	lea    -0xec(%ebp),%edx
c0107e40:	52                   	push   %edx
c0107e41:	50                   	push   %eax
c0107e42:	e8 2b cf ff ff       	call   c0104d72 <execv>
c0107e47:	83 c4 10             	add    $0x10,%esp
c0107e4a:	eb fe                	jmp    c0107e4a <simple_shell+0x1fc>

c0107e4c <test_shell>:
c0107e4c:	55                   	push   %ebp
c0107e4d:	89 e5                	mov    %esp,%ebp
c0107e4f:	83 ec 38             	sub    $0x38,%esp
c0107e52:	c7 45 ea 64 65 76 5f 	movl   $0x5f766564,-0x16(%ebp)
c0107e59:	c7 45 ee 74 74 79 31 	movl   $0x31797474,-0x12(%ebp)
c0107e60:	66 c7 45 f2 00 00    	movw   $0x0,-0xe(%ebp)
c0107e66:	83 ec 08             	sub    $0x8,%esp
c0107e69:	6a 02                	push   $0x2
c0107e6b:	8d 45 ea             	lea    -0x16(%ebp),%eax
c0107e6e:	50                   	push   %eax
c0107e6f:	e8 ba ca ff ff       	call   c010492e <open>
c0107e74:	83 c4 10             	add    $0x10,%esp
c0107e77:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0107e7a:	c7 45 d6 69 6e 73 74 	movl   $0x74736e69,-0x2a(%ebp)
c0107e81:	c7 45 da 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x26(%ebp)
c0107e88:	c7 45 de 74 61 72 00 	movl   $0x726174,-0x22(%ebp)
c0107e8f:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c0107e96:	c7 45 e6 00 00 00 00 	movl   $0x0,-0x1a(%ebp)
c0107e9d:	83 ec 0c             	sub    $0xc,%esp
c0107ea0:	8d 45 d6             	lea    -0x2a(%ebp),%eax
c0107ea3:	50                   	push   %eax
c0107ea4:	e8 e0 eb ff ff       	call   c0106a89 <untar>
c0107ea9:	83 c4 10             	add    $0x10,%esp
c0107eac:	e8 9d fd ff ff       	call   c0107c4e <simple_shell>
c0107eb1:	90                   	nop
c0107eb2:	c9                   	leave  
c0107eb3:	c3                   	ret    

c0107eb4 <test_exec>:
c0107eb4:	55                   	push   %ebp
c0107eb5:	89 e5                	mov    %esp,%ebp
c0107eb7:	83 ec 38             	sub    $0x38,%esp
c0107eba:	83 ec 0c             	sub    $0xc,%esp
c0107ebd:	68 b3 a7 10 c0       	push   $0xc010a7b3
c0107ec2:	e8 c5 81 ff ff       	call   c010008c <disp_str>
c0107ec7:	83 c4 10             	add    $0x10,%esp
c0107eca:	83 ec 0c             	sub    $0xc,%esp
c0107ecd:	68 b5 a7 10 c0       	push   $0xc010a7b5
c0107ed2:	e8 b5 81 ff ff       	call   c010008c <disp_str>
c0107ed7:	83 c4 10             	add    $0x10,%esp
c0107eda:	c7 45 ea 64 65 76 5f 	movl   $0x5f766564,-0x16(%ebp)
c0107ee1:	c7 45 ee 74 74 79 31 	movl   $0x31797474,-0x12(%ebp)
c0107ee8:	66 c7 45 f2 00 00    	movw   $0x0,-0xe(%ebp)
c0107eee:	83 ec 08             	sub    $0x8,%esp
c0107ef1:	6a 02                	push   $0x2
c0107ef3:	8d 45 ea             	lea    -0x16(%ebp),%eax
c0107ef6:	50                   	push   %eax
c0107ef7:	e8 32 ca ff ff       	call   c010492e <open>
c0107efc:	83 c4 10             	add    $0x10,%esp
c0107eff:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0107f02:	c7 45 d6 69 6e 73 74 	movl   $0x74736e69,-0x2a(%ebp)
c0107f09:	c7 45 da 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x26(%ebp)
c0107f10:	c7 45 de 74 61 72 00 	movl   $0x726174,-0x22(%ebp)
c0107f17:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c0107f1e:	c7 45 e6 00 00 00 00 	movl   $0x0,-0x1a(%ebp)
c0107f25:	83 ec 0c             	sub    $0xc,%esp
c0107f28:	8d 45 d6             	lea    -0x2a(%ebp),%eax
c0107f2b:	50                   	push   %eax
c0107f2c:	e8 58 eb ff ff       	call   c0106a89 <untar>
c0107f31:	83 c4 10             	add    $0x10,%esp
c0107f34:	83 ec 08             	sub    $0x8,%esp
c0107f37:	6a 00                	push   $0x0
c0107f39:	68 eb a8 10 c0       	push   $0xc010a8eb
c0107f3e:	68 ef a8 10 c0       	push   $0xc010a8ef
c0107f43:	68 f5 a8 10 c0       	push   $0xc010a8f5
c0107f48:	68 fb a8 10 c0       	push   $0xc010a8fb
c0107f4d:	68 00 a9 10 c0       	push   $0xc010a900
c0107f52:	e8 00 d0 ff ff       	call   c0104f57 <execl>
c0107f57:	83 c4 20             	add    $0x20,%esp
c0107f5a:	eb fe                	jmp    c0107f5a <test_exec+0xa6>

c0107f5c <INIT>:
c0107f5c:	55                   	push   %ebp
c0107f5d:	89 e5                	mov    %esp,%ebp
c0107f5f:	83 ec 08             	sub    $0x8,%esp
c0107f62:	e8 e5 fe ff ff       	call   c0107e4c <test_shell>
c0107f67:	eb fe                	jmp    c0107f67 <INIT+0xb>

c0107f69 <TestA>:
c0107f69:	55                   	push   %ebp
c0107f6a:	89 e5                	mov    %esp,%ebp
c0107f6c:	83 ec 08             	sub    $0x8,%esp
c0107f6f:	83 ec 0c             	sub    $0xc,%esp
c0107f72:	6a 05                	push   $0x5
c0107f74:	e8 c6 ee ff ff       	call   c0106e3f <disp_int>
c0107f79:	83 c4 10             	add    $0x10,%esp
c0107f7c:	83 ec 0c             	sub    $0xc,%esp
c0107f7f:	68 af a4 10 c0       	push   $0xc010a4af
c0107f84:	e8 03 81 ff ff       	call   c010008c <disp_str>
c0107f89:	83 c4 10             	add    $0x10,%esp
c0107f8c:	83 ec 0c             	sub    $0xc,%esp
c0107f8f:	68 06 a9 10 c0       	push   $0xc010a906
c0107f94:	e8 f3 80 ff ff       	call   c010008c <disp_str>
c0107f99:	83 c4 10             	add    $0x10,%esp
c0107f9c:	eb fe                	jmp    c0107f9c <TestA+0x33>

c0107f9e <delay>:
c0107f9e:	55                   	push   %ebp
c0107f9f:	89 e5                	mov    %esp,%ebp
c0107fa1:	83 ec 10             	sub    $0x10,%esp
c0107fa4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0107fab:	eb 2a                	jmp    c0107fd7 <delay+0x39>
c0107fad:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0107fb4:	eb 17                	jmp    c0107fcd <delay+0x2f>
c0107fb6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0107fbd:	eb 04                	jmp    c0107fc3 <delay+0x25>
c0107fbf:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0107fc3:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c0107fc7:	7e f6                	jle    c0107fbf <delay+0x21>
c0107fc9:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0107fcd:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
c0107fd1:	7e e3                	jle    c0107fb6 <delay+0x18>
c0107fd3:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0107fd7:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0107fda:	3b 45 08             	cmp    0x8(%ebp),%eax
c0107fdd:	7c ce                	jl     c0107fad <delay+0xf>
c0107fdf:	90                   	nop
c0107fe0:	c9                   	leave  
c0107fe1:	c3                   	ret    

c0107fe2 <TestB>:
c0107fe2:	55                   	push   %ebp
c0107fe3:	89 e5                	mov    %esp,%ebp
c0107fe5:	83 ec 08             	sub    $0x8,%esp
c0107fe8:	83 ec 0c             	sub    $0xc,%esp
c0107feb:	68 0d a9 10 c0       	push   $0xc010a90d
c0107ff0:	e8 97 80 ff ff       	call   c010008c <disp_str>
c0107ff5:	83 c4 10             	add    $0x10,%esp
c0107ff8:	eb fe                	jmp    c0107ff8 <TestB+0x16>

c0107ffa <TestC>:
c0107ffa:	55                   	push   %ebp
c0107ffb:	89 e5                	mov    %esp,%ebp
c0107ffd:	83 ec 18             	sub    $0x18,%esp
c0108000:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108007:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c010800b:	77 1a                	ja     c0108027 <TestC+0x2d>
c010800d:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
c0108014:	83 ec 08             	sub    $0x8,%esp
c0108017:	ff 75 f0             	pushl  -0x10(%ebp)
c010801a:	68 10 a9 10 c0       	push   $0xc010a910
c010801f:	e8 ae 00 00 00       	call   c01080d2 <Printf>
c0108024:	83 c4 10             	add    $0x10,%esp
c0108027:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c010802b:	eb da                	jmp    c0108007 <TestC+0xd>

c010802d <sys_get_ticks>:
c010802d:	55                   	push   %ebp
c010802e:	89 e5                	mov    %esp,%ebp
c0108030:	a1 e8 0e 11 c0       	mov    0xc0110ee8,%eax
c0108035:	8b 15 ec 0e 11 c0    	mov    0xc0110eec,%edx
c010803b:	5d                   	pop    %ebp
c010803c:	c3                   	ret    

c010803d <sys_write>:
c010803d:	55                   	push   %ebp
c010803e:	89 e5                	mov    %esp,%ebp
c0108040:	83 ec 18             	sub    $0x18,%esp
c0108043:	8b 45 10             	mov    0x10(%ebp),%eax
c0108046:	8b 80 30 01 00 00    	mov    0x130(%eax),%eax
c010804c:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0108052:	05 00 fe 10 c0       	add    $0xc010fe00,%eax
c0108057:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010805a:	8b 45 0c             	mov    0xc(%ebp),%eax
c010805d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108060:	8b 45 08             	mov    0x8(%ebp),%eax
c0108063:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108066:	eb 20                	jmp    c0108088 <sys_write+0x4b>
c0108068:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010806b:	0f b6 00             	movzbl (%eax),%eax
c010806e:	0f b6 c0             	movzbl %al,%eax
c0108071:	83 ec 08             	sub    $0x8,%esp
c0108074:	50                   	push   %eax
c0108075:	ff 75 ec             	pushl  -0x14(%ebp)
c0108078:	e8 22 bc ff ff       	call   c0103c9f <out_char>
c010807d:	83 c4 10             	add    $0x10,%esp
c0108080:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0108084:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
c0108088:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c010808c:	7f da                	jg     c0108068 <sys_write+0x2b>
c010808e:	90                   	nop
c010808f:	c9                   	leave  
c0108090:	c3                   	ret    

c0108091 <milli_delay>:
c0108091:	55                   	push   %ebp
c0108092:	89 e5                	mov    %esp,%ebp
c0108094:	83 ec 18             	sub    $0x18,%esp
c0108097:	e8 37 0f 00 00       	call   c0108fd3 <get_ticks_ipc>
c010809c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010809f:	90                   	nop
c01080a0:	e8 2e 0f 00 00       	call   c0108fd3 <get_ticks_ipc>
c01080a5:	2b 45 f4             	sub    -0xc(%ebp),%eax
c01080a8:	89 c1                	mov    %eax,%ecx
c01080aa:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
c01080af:	89 c8                	mov    %ecx,%eax
c01080b1:	f7 ea                	imul   %edx
c01080b3:	c1 fa 05             	sar    $0x5,%edx
c01080b6:	89 c8                	mov    %ecx,%eax
c01080b8:	c1 f8 1f             	sar    $0x1f,%eax
c01080bb:	29 c2                	sub    %eax,%edx
c01080bd:	89 d0                	mov    %edx,%eax
c01080bf:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
c01080c5:	39 45 08             	cmp    %eax,0x8(%ebp)
c01080c8:	77 d6                	ja     c01080a0 <milli_delay+0xf>
c01080ca:	90                   	nop
c01080cb:	c9                   	leave  
c01080cc:	c3                   	ret    

c01080cd <TaskSys>:
c01080cd:	55                   	push   %ebp
c01080ce:	89 e5                	mov    %esp,%ebp
c01080d0:	eb fe                	jmp    c01080d0 <TaskSys+0x3>

c01080d2 <Printf>:
c01080d2:	55                   	push   %ebp
c01080d3:	89 e5                	mov    %esp,%ebp
c01080d5:	81 ec 18 01 00 00    	sub    $0x118,%esp
c01080db:	83 ec 04             	sub    $0x4,%esp
c01080de:	68 00 01 00 00       	push   $0x100
c01080e3:	6a 00                	push   $0x0
c01080e5:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c01080eb:	50                   	push   %eax
c01080ec:	e8 2e 2b 00 00       	call   c010ac1f <Memset>
c01080f1:	83 c4 10             	add    $0x10,%esp
c01080f4:	8d 45 0c             	lea    0xc(%ebp),%eax
c01080f7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01080fa:	8b 45 08             	mov    0x8(%ebp),%eax
c01080fd:	83 ec 04             	sub    $0x4,%esp
c0108100:	ff 75 f4             	pushl  -0xc(%ebp)
c0108103:	50                   	push   %eax
c0108104:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c010810a:	50                   	push   %eax
c010810b:	e8 20 00 00 00       	call   c0108130 <vsprintf>
c0108110:	83 c4 10             	add    $0x10,%esp
c0108113:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108116:	83 ec 04             	sub    $0x4,%esp
c0108119:	ff 75 f0             	pushl  -0x10(%ebp)
c010811c:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108122:	50                   	push   %eax
c0108123:	6a 00                	push   $0x0
c0108125:	e8 1a ca ff ff       	call   c0104b44 <write>
c010812a:	83 c4 10             	add    $0x10,%esp
c010812d:	90                   	nop
c010812e:	c9                   	leave  
c010812f:	c3                   	ret    

c0108130 <vsprintf>:
c0108130:	55                   	push   %ebp
c0108131:	89 e5                	mov    %esp,%ebp
c0108133:	81 ec 68 02 00 00    	sub    $0x268,%esp
c0108139:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c010813f:	89 85 e4 fd ff ff    	mov    %eax,-0x21c(%ebp)
c0108145:	83 ec 04             	sub    $0x4,%esp
c0108148:	6a 40                	push   $0x40
c010814a:	6a 00                	push   $0x0
c010814c:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0108152:	50                   	push   %eax
c0108153:	e8 c7 2a 00 00       	call   c010ac1f <Memset>
c0108158:	83 c4 10             	add    $0x10,%esp
c010815b:	8b 45 10             	mov    0x10(%ebp),%eax
c010815e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108161:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0108168:	8b 45 08             	mov    0x8(%ebp),%eax
c010816b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010816e:	e9 53 01 00 00       	jmp    c01082c6 <vsprintf+0x196>
c0108173:	8b 45 0c             	mov    0xc(%ebp),%eax
c0108176:	0f b6 00             	movzbl (%eax),%eax
c0108179:	3c 25                	cmp    $0x25,%al
c010817b:	74 16                	je     c0108193 <vsprintf+0x63>
c010817d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108180:	8d 50 01             	lea    0x1(%eax),%edx
c0108183:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0108186:	8b 55 0c             	mov    0xc(%ebp),%edx
c0108189:	0f b6 12             	movzbl (%edx),%edx
c010818c:	88 10                	mov    %dl,(%eax)
c010818e:	e9 2f 01 00 00       	jmp    c01082c2 <vsprintf+0x192>
c0108193:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c0108197:	8b 45 0c             	mov    0xc(%ebp),%eax
c010819a:	0f b6 00             	movzbl (%eax),%eax
c010819d:	0f be c0             	movsbl %al,%eax
c01081a0:	83 f8 64             	cmp    $0x64,%eax
c01081a3:	74 26                	je     c01081cb <vsprintf+0x9b>
c01081a5:	83 f8 64             	cmp    $0x64,%eax
c01081a8:	7f 0e                	jg     c01081b8 <vsprintf+0x88>
c01081aa:	83 f8 63             	cmp    $0x63,%eax
c01081ad:	0f 84 f2 00 00 00    	je     c01082a5 <vsprintf+0x175>
c01081b3:	e9 0a 01 00 00       	jmp    c01082c2 <vsprintf+0x192>
c01081b8:	83 f8 73             	cmp    $0x73,%eax
c01081bb:	0f 84 b0 00 00 00    	je     c0108271 <vsprintf+0x141>
c01081c1:	83 f8 78             	cmp    $0x78,%eax
c01081c4:	74 5d                	je     c0108223 <vsprintf+0xf3>
c01081c6:	e9 f7 00 00 00       	jmp    c01082c2 <vsprintf+0x192>
c01081cb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01081ce:	8b 00                	mov    (%eax),%eax
c01081d0:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01081d3:	83 ec 04             	sub    $0x4,%esp
c01081d6:	6a 0a                	push   $0xa
c01081d8:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c01081de:	50                   	push   %eax
c01081df:	ff 75 e8             	pushl  -0x18(%ebp)
c01081e2:	e8 43 0e 00 00       	call   c010902a <itoa>
c01081e7:	83 c4 10             	add    $0x10,%esp
c01081ea:	83 ec 08             	sub    $0x8,%esp
c01081ed:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c01081f3:	50                   	push   %eax
c01081f4:	ff 75 f4             	pushl  -0xc(%ebp)
c01081f7:	e8 42 2a 00 00       	call   c010ac3e <Strcpy>
c01081fc:	83 c4 10             	add    $0x10,%esp
c01081ff:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0108203:	83 ec 0c             	sub    $0xc,%esp
c0108206:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c010820c:	50                   	push   %eax
c010820d:	e8 46 2a 00 00       	call   c010ac58 <Strlen>
c0108212:	83 c4 10             	add    $0x10,%esp
c0108215:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108218:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010821b:	01 45 f4             	add    %eax,-0xc(%ebp)
c010821e:	e9 9f 00 00 00       	jmp    c01082c2 <vsprintf+0x192>
c0108223:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108226:	8b 00                	mov    (%eax),%eax
c0108228:	83 ec 08             	sub    $0x8,%esp
c010822b:	50                   	push   %eax
c010822c:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0108232:	50                   	push   %eax
c0108233:	e8 61 eb ff ff       	call   c0106d99 <atoi>
c0108238:	83 c4 10             	add    $0x10,%esp
c010823b:	83 ec 08             	sub    $0x8,%esp
c010823e:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0108244:	50                   	push   %eax
c0108245:	ff 75 f4             	pushl  -0xc(%ebp)
c0108248:	e8 f1 29 00 00       	call   c010ac3e <Strcpy>
c010824d:	83 c4 10             	add    $0x10,%esp
c0108250:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0108254:	83 ec 0c             	sub    $0xc,%esp
c0108257:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c010825d:	50                   	push   %eax
c010825e:	e8 f5 29 00 00       	call   c010ac58 <Strlen>
c0108263:	83 c4 10             	add    $0x10,%esp
c0108266:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108269:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010826c:	01 45 f4             	add    %eax,-0xc(%ebp)
c010826f:	eb 51                	jmp    c01082c2 <vsprintf+0x192>
c0108271:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108274:	8b 00                	mov    (%eax),%eax
c0108276:	83 ec 08             	sub    $0x8,%esp
c0108279:	50                   	push   %eax
c010827a:	ff 75 f4             	pushl  -0xc(%ebp)
c010827d:	e8 bc 29 00 00       	call   c010ac3e <Strcpy>
c0108282:	83 c4 10             	add    $0x10,%esp
c0108285:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108288:	8b 00                	mov    (%eax),%eax
c010828a:	83 ec 0c             	sub    $0xc,%esp
c010828d:	50                   	push   %eax
c010828e:	e8 c5 29 00 00       	call   c010ac58 <Strlen>
c0108293:	83 c4 10             	add    $0x10,%esp
c0108296:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108299:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c010829d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01082a0:	01 45 f4             	add    %eax,-0xc(%ebp)
c01082a3:	eb 1d                	jmp    c01082c2 <vsprintf+0x192>
c01082a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01082a8:	0f b6 10             	movzbl (%eax),%edx
c01082ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01082ae:	88 10                	mov    %dl,(%eax)
c01082b0:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c01082b4:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c01082bb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c01082be:	01 45 f4             	add    %eax,-0xc(%ebp)
c01082c1:	90                   	nop
c01082c2:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c01082c6:	8b 45 0c             	mov    0xc(%ebp),%eax
c01082c9:	0f b6 00             	movzbl (%eax),%eax
c01082cc:	84 c0                	test   %al,%al
c01082ce:	0f 85 9f fe ff ff    	jne    c0108173 <vsprintf+0x43>
c01082d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01082d7:	2b 45 08             	sub    0x8(%ebp),%eax
c01082da:	c9                   	leave  
c01082db:	c3                   	ret    

c01082dc <printx>:
c01082dc:	55                   	push   %ebp
c01082dd:	89 e5                	mov    %esp,%ebp
c01082df:	81 ec 18 01 00 00    	sub    $0x118,%esp
c01082e5:	8d 45 0c             	lea    0xc(%ebp),%eax
c01082e8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01082eb:	8b 45 08             	mov    0x8(%ebp),%eax
c01082ee:	83 ec 04             	sub    $0x4,%esp
c01082f1:	ff 75 f4             	pushl  -0xc(%ebp)
c01082f4:	50                   	push   %eax
c01082f5:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c01082fb:	50                   	push   %eax
c01082fc:	e8 2f fe ff ff       	call   c0108130 <vsprintf>
c0108301:	83 c4 10             	add    $0x10,%esp
c0108304:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108307:	83 ec 08             	sub    $0x8,%esp
c010830a:	ff 75 f0             	pushl  -0x10(%ebp)
c010830d:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0108313:	50                   	push   %eax
c0108314:	e8 27 91 ff ff       	call   c0101440 <write_debug>
c0108319:	83 c4 10             	add    $0x10,%esp
c010831c:	90                   	nop
c010831d:	c9                   	leave  
c010831e:	c3                   	ret    

c010831f <sys_printx>:
c010831f:	55                   	push   %ebp
c0108320:	89 e5                	mov    %esp,%ebp
c0108322:	83 ec 28             	sub    $0x28,%esp
c0108325:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c010832a:	85 c0                	test   %eax,%eax
c010832c:	75 15                	jne    c0108343 <sys_printx+0x24>
c010832e:	8b 45 10             	mov    0x10(%ebp),%eax
c0108331:	8b 80 78 02 00 00    	mov    0x278(%eax),%eax
c0108337:	89 45 ec             	mov    %eax,-0x14(%ebp)
c010833a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108341:	eb 10                	jmp    c0108353 <sys_printx+0x34>
c0108343:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c0108348:	85 c0                	test   %eax,%eax
c010834a:	74 07                	je     c0108353 <sys_printx+0x34>
c010834c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0108353:	8b 55 08             	mov    0x8(%ebp),%edx
c0108356:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108359:	01 d0                	add    %edx,%eax
c010835b:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010835e:	8b 45 10             	mov    0x10(%ebp),%eax
c0108361:	8b 80 30 01 00 00    	mov    0x130(%eax),%eax
c0108367:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c010836d:	05 00 fe 10 c0       	add    $0xc010fe00,%eax
c0108372:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0108375:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108378:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010837b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010837e:	0f b6 00             	movzbl (%eax),%eax
c0108381:	88 45 e3             	mov    %al,-0x1d(%ebp)
c0108384:	eb 3a                	jmp    c01083c0 <sys_printx+0xa1>
c0108386:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108389:	0f b6 00             	movzbl (%eax),%eax
c010838c:	3c 3b                	cmp    $0x3b,%al
c010838e:	74 0a                	je     c010839a <sys_printx+0x7b>
c0108390:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108393:	0f b6 00             	movzbl (%eax),%eax
c0108396:	3c 3a                	cmp    $0x3a,%al
c0108398:	75 06                	jne    c01083a0 <sys_printx+0x81>
c010839a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c010839e:	eb 20                	jmp    c01083c0 <sys_printx+0xa1>
c01083a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01083a3:	0f b6 00             	movzbl (%eax),%eax
c01083a6:	0f b6 c0             	movzbl %al,%eax
c01083a9:	83 ec 08             	sub    $0x8,%esp
c01083ac:	50                   	push   %eax
c01083ad:	ff 75 e4             	pushl  -0x1c(%ebp)
c01083b0:	e8 ea b8 ff ff       	call   c0103c9f <out_char>
c01083b5:	83 c4 10             	add    $0x10,%esp
c01083b8:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c01083bc:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c01083c0:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01083c4:	7f c0                	jg     c0108386 <sys_printx+0x67>
c01083c6:	80 7d e3 3b          	cmpb   $0x3b,-0x1d(%ebp)
c01083ca:	75 10                	jne    c01083dc <sys_printx+0xbd>
c01083cc:	a1 a8 f7 10 c0       	mov    0xc010f7a8,%eax
c01083d1:	85 c0                	test   %eax,%eax
c01083d3:	74 13                	je     c01083e8 <sys_printx+0xc9>
c01083d5:	e8 e1 7e ff ff       	call   c01002bb <disable_int>
c01083da:	eb 0c                	jmp    c01083e8 <sys_printx+0xc9>
c01083dc:	80 7d e3 3a          	cmpb   $0x3a,-0x1d(%ebp)
c01083e0:	75 06                	jne    c01083e8 <sys_printx+0xc9>
c01083e2:	e8 d4 7e ff ff       	call   c01002bb <disable_int>
c01083e7:	90                   	nop
c01083e8:	90                   	nop
c01083e9:	c9                   	leave  
c01083ea:	c3                   	ret    

c01083eb <spin>:
c01083eb:	55                   	push   %ebp
c01083ec:	89 e5                	mov    %esp,%ebp
c01083ee:	83 ec 08             	sub    $0x8,%esp
c01083f1:	83 ec 0c             	sub    $0xc,%esp
c01083f4:	ff 75 08             	pushl  0x8(%ebp)
c01083f7:	e8 90 7c ff ff       	call   c010008c <disp_str>
c01083fc:	83 c4 10             	add    $0x10,%esp
c01083ff:	83 ec 0c             	sub    $0xc,%esp
c0108402:	68 af a4 10 c0       	push   $0xc010a4af
c0108407:	e8 80 7c ff ff       	call   c010008c <disp_str>
c010840c:	83 c4 10             	add    $0x10,%esp
c010840f:	eb fe                	jmp    c010840f <spin+0x24>

c0108411 <panic>:
c0108411:	55                   	push   %ebp
c0108412:	89 e5                	mov    %esp,%ebp
c0108414:	83 ec 08             	sub    $0x8,%esp
c0108417:	83 ec 04             	sub    $0x4,%esp
c010841a:	ff 75 08             	pushl  0x8(%ebp)
c010841d:	6a 3a                	push   $0x3a
c010841f:	68 1d a9 10 c0       	push   $0xc010a91d
c0108424:	e8 b3 fe ff ff       	call   c01082dc <printx>
c0108429:	83 c4 10             	add    $0x10,%esp
c010842c:	90                   	nop
c010842d:	c9                   	leave  
c010842e:	c3                   	ret    

c010842f <assertion_failure>:
c010842f:	55                   	push   %ebp
c0108430:	89 e5                	mov    %esp,%ebp
c0108432:	83 ec 08             	sub    $0x8,%esp
c0108435:	83 ec 08             	sub    $0x8,%esp
c0108438:	ff 75 14             	pushl  0x14(%ebp)
c010843b:	ff 75 10             	pushl  0x10(%ebp)
c010843e:	ff 75 0c             	pushl  0xc(%ebp)
c0108441:	ff 75 08             	pushl  0x8(%ebp)
c0108444:	6a 3b                	push   $0x3b
c0108446:	68 24 a9 10 c0       	push   $0xc010a924
c010844b:	e8 8c fe ff ff       	call   c01082dc <printx>
c0108450:	83 c4 20             	add    $0x20,%esp
c0108453:	c7 05 a4 f7 10 c0 00 	movl   $0x0,0xc010f7a4
c010845a:	00 00 00 
c010845d:	83 ec 0c             	sub    $0xc,%esp
c0108460:	68 b3 a7 10 c0       	push   $0xc010a7b3
c0108465:	e8 22 7c ff ff       	call   c010008c <disp_str>
c010846a:	83 c4 10             	add    $0x10,%esp
c010846d:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c0108472:	83 ec 0c             	sub    $0xc,%esp
c0108475:	50                   	push   %eax
c0108476:	e8 c4 e9 ff ff       	call   c0106e3f <disp_int>
c010847b:	83 c4 10             	add    $0x10,%esp
c010847e:	83 ec 0c             	sub    $0xc,%esp
c0108481:	68 b5 a7 10 c0       	push   $0xc010a7b5
c0108486:	e8 01 7c ff ff       	call   c010008c <disp_str>
c010848b:	83 c4 10             	add    $0x10,%esp
c010848e:	83 ec 0c             	sub    $0xc,%esp
c0108491:	68 57 a9 10 c0       	push   $0xc010a957
c0108496:	e8 50 ff ff ff       	call   c01083eb <spin>
c010849b:	83 c4 10             	add    $0x10,%esp
c010849e:	90                   	nop
c010849f:	c9                   	leave  
c01084a0:	c3                   	ret    

c01084a1 <dead_lock>:
c01084a1:	55                   	push   %ebp
c01084a2:	89 e5                	mov    %esp,%ebp
c01084a4:	b8 00 00 00 00       	mov    $0x0,%eax
c01084a9:	5d                   	pop    %ebp
c01084aa:	c3                   	ret    

c01084ab <sys_send_msg>:
c01084ab:	55                   	push   %ebp
c01084ac:	89 e5                	mov    %esp,%ebp
c01084ae:	83 ec 58             	sub    $0x58,%esp
c01084b1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c01084b8:	83 ec 0c             	sub    $0xc,%esp
c01084bb:	ff 75 0c             	pushl  0xc(%ebp)
c01084be:	e8 69 b1 ff ff       	call   c010362c <pid2proc>
c01084c3:	83 c4 10             	add    $0x10,%esp
c01084c6:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01084c9:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c01084cd:	74 2c                	je     c01084fb <sys_send_msg+0x50>
c01084cf:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01084d2:	8b 80 b0 02 00 00    	mov    0x2b0(%eax),%eax
c01084d8:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c01084dd:	74 1c                	je     c01084fb <sys_send_msg+0x50>
c01084df:	68 03 05 00 00       	push   $0x503
c01084e4:	68 63 a9 10 c0       	push   $0xc010a963
c01084e9:	68 63 a9 10 c0       	push   $0xc010a963
c01084ee:	68 74 a9 10 c0       	push   $0xc010a974
c01084f3:	e8 37 ff ff ff       	call   c010842f <assertion_failure>
c01084f8:	83 c4 10             	add    $0x10,%esp
c01084fb:	8b 45 10             	mov    0x10(%ebp),%eax
c01084fe:	8b 80 b0 02 00 00    	mov    0x2b0(%eax),%eax
c0108504:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0108509:	74 1c                	je     c0108527 <sys_send_msg+0x7c>
c010850b:	68 05 05 00 00       	push   $0x505
c0108510:	68 63 a9 10 c0       	push   $0xc010a963
c0108515:	68 63 a9 10 c0       	push   $0xc010a963
c010851a:	68 9c a9 10 c0       	push   $0xc010a99c
c010851f:	e8 0b ff ff ff       	call   c010842f <assertion_failure>
c0108524:	83 c4 10             	add    $0x10,%esp
c0108527:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c010852b:	75 22                	jne    c010854f <sys_send_msg+0xa4>
c010852d:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0108531:	75 1c                	jne    c010854f <sys_send_msg+0xa4>
c0108533:	68 08 05 00 00       	push   $0x508
c0108538:	68 63 a9 10 c0       	push   $0xc010a963
c010853d:	68 63 a9 10 c0       	push   $0xc010a963
c0108542:	68 bf a9 10 c0       	push   $0xc010a9bf
c0108547:	e8 e3 fe ff ff       	call   c010842f <assertion_failure>
c010854c:	83 c4 10             	add    $0x10,%esp
c010854f:	83 ec 0c             	sub    $0xc,%esp
c0108552:	ff 75 10             	pushl  0x10(%ebp)
c0108555:	e8 44 b1 ff ff       	call   c010369e <proc2pid>
c010855a:	83 c4 10             	add    $0x10,%esp
c010855d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0108560:	c7 45 e0 7c 00 00 00 	movl   $0x7c,-0x20(%ebp)
c0108567:	8b 45 08             	mov    0x8(%ebp),%eax
c010856a:	89 45 dc             	mov    %eax,-0x24(%ebp)
c010856d:	83 ec 08             	sub    $0x8,%esp
c0108570:	ff 75 e4             	pushl  -0x1c(%ebp)
c0108573:	ff 75 dc             	pushl  -0x24(%ebp)
c0108576:	e8 8f d7 ff ff       	call   c0105d0a <get_physical_address_proc>
c010857b:	83 c4 10             	add    $0x10,%esp
c010857e:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0108581:	83 ec 08             	sub    $0x8,%esp
c0108584:	ff 75 e0             	pushl  -0x20(%ebp)
c0108587:	ff 75 d8             	pushl  -0x28(%ebp)
c010858a:	e8 ad d6 ff ff       	call   c0105c3c <alloc_virtual_memory>
c010858f:	83 c4 10             	add    $0x10,%esp
c0108592:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0108595:	8b 45 10             	mov    0x10(%ebp),%eax
c0108598:	8b 80 78 02 00 00    	mov    0x278(%eax),%eax
c010859e:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01085a1:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c01085a8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01085ab:	89 45 c8             	mov    %eax,-0x38(%ebp)
c01085ae:	8b 45 c8             	mov    -0x38(%ebp),%eax
c01085b1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01085b4:	89 10                	mov    %edx,(%eax)
c01085b6:	83 ec 08             	sub    $0x8,%esp
c01085b9:	ff 75 0c             	pushl  0xc(%ebp)
c01085bc:	ff 75 e4             	pushl  -0x1c(%ebp)
c01085bf:	e8 dd fe ff ff       	call   c01084a1 <dead_lock>
c01085c4:	83 c4 10             	add    $0x10,%esp
c01085c7:	83 f8 01             	cmp    $0x1,%eax
c01085ca:	75 10                	jne    c01085dc <sys_send_msg+0x131>
c01085cc:	83 ec 0c             	sub    $0xc,%esp
c01085cf:	68 cf a9 10 c0       	push   $0xc010a9cf
c01085d4:	e8 38 fe ff ff       	call   c0108411 <panic>
c01085d9:	83 c4 10             	add    $0x10,%esp
c01085dc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01085df:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c01085e6:	3c 02                	cmp    $0x2,%al
c01085e8:	0f 85 cf 01 00 00    	jne    c01087bd <sys_send_msg+0x312>
c01085ee:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01085f1:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c01085f7:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c01085fa:	74 12                	je     c010860e <sys_send_msg+0x163>
c01085fc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01085ff:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0108605:	83 f8 12             	cmp    $0x12,%eax
c0108608:	0f 85 af 01 00 00    	jne    c01087bd <sys_send_msg+0x312>
c010860e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108611:	8b 80 78 02 00 00    	mov    0x278(%eax),%eax
c0108617:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c010861a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010861d:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0108623:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0108626:	83 ec 08             	sub    $0x8,%esp
c0108629:	ff 75 0c             	pushl  0xc(%ebp)
c010862c:	ff 75 c0             	pushl  -0x40(%ebp)
c010862f:	e8 d6 d6 ff ff       	call   c0105d0a <get_physical_address_proc>
c0108634:	83 c4 10             	add    $0x10,%esp
c0108637:	89 45 bc             	mov    %eax,-0x44(%ebp)
c010863a:	83 ec 08             	sub    $0x8,%esp
c010863d:	ff 75 e0             	pushl  -0x20(%ebp)
c0108640:	ff 75 bc             	pushl  -0x44(%ebp)
c0108643:	e8 f4 d5 ff ff       	call   c0105c3c <alloc_virtual_memory>
c0108648:	83 c4 10             	add    $0x10,%esp
c010864b:	89 45 b8             	mov    %eax,-0x48(%ebp)
c010864e:	e8 59 e3 ff ff       	call   c01069ac <catch_error>
c0108653:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c0108656:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0108659:	8b 45 b8             	mov    -0x48(%ebp),%eax
c010865c:	83 ec 04             	sub    $0x4,%esp
c010865f:	51                   	push   %ecx
c0108660:	52                   	push   %edx
c0108661:	50                   	push   %eax
c0108662:	e8 ef e3 ff ff       	call   c0106a56 <Memcpy>
c0108667:	83 c4 10             	add    $0x10,%esp
c010866a:	a1 c4 fb 10 c0       	mov    0xc010fbc4,%eax
c010866f:	3d 41 05 00 00       	cmp    $0x541,%eax
c0108674:	75 0a                	jne    c0108680 <sys_send_msg+0x1d5>
c0108676:	c7 05 a0 f7 10 c0 04 	movl   $0x4,0xc010f7a0
c010867d:	00 00 00 
c0108680:	8b 45 10             	mov    0x10(%ebp),%eax
c0108683:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c010868a:	00 00 00 
c010868d:	8b 45 10             	mov    0x10(%ebp),%eax
c0108690:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0108697:	8b 45 10             	mov    0x10(%ebp),%eax
c010869a:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c01086a1:	00 00 00 
c01086a4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01086a7:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c01086ae:	00 00 00 
c01086b1:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01086b4:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c01086bb:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01086be:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c01086c5:	00 00 00 
c01086c8:	8b 45 10             	mov    0x10(%ebp),%eax
c01086cb:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c01086d2:	00 00 00 
c01086d5:	83 ec 0c             	sub    $0xc,%esp
c01086d8:	ff 75 e8             	pushl  -0x18(%ebp)
c01086db:	e8 a3 08 00 00       	call   c0108f83 <unblock>
c01086e0:	83 c4 10             	add    $0x10,%esp
c01086e3:	8b 45 10             	mov    0x10(%ebp),%eax
c01086e6:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c01086ed:	84 c0                	test   %al,%al
c01086ef:	74 1c                	je     c010870d <sys_send_msg+0x262>
c01086f1:	68 41 05 00 00       	push   $0x541
c01086f6:	68 63 a9 10 c0       	push   $0xc010a963
c01086fb:	68 63 a9 10 c0       	push   $0xc010a963
c0108700:	68 da a9 10 c0       	push   $0xc010a9da
c0108705:	e8 25 fd ff ff       	call   c010842f <assertion_failure>
c010870a:	83 c4 10             	add    $0x10,%esp
c010870d:	8b 45 10             	mov    0x10(%ebp),%eax
c0108710:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0108716:	83 f8 21             	cmp    $0x21,%eax
c0108719:	74 1c                	je     c0108737 <sys_send_msg+0x28c>
c010871b:	68 42 05 00 00       	push   $0x542
c0108720:	68 63 a9 10 c0       	push   $0xc010a963
c0108725:	68 63 a9 10 c0       	push   $0xc010a963
c010872a:	68 ee a9 10 c0       	push   $0xc010a9ee
c010872f:	e8 fb fc ff ff       	call   c010842f <assertion_failure>
c0108734:	83 c4 10             	add    $0x10,%esp
c0108737:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010873a:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0108740:	85 c0                	test   %eax,%eax
c0108742:	74 1c                	je     c0108760 <sys_send_msg+0x2b5>
c0108744:	68 44 05 00 00       	push   $0x544
c0108749:	68 63 a9 10 c0       	push   $0xc010a963
c010874e:	68 63 a9 10 c0       	push   $0xc010a963
c0108753:	68 0b aa 10 c0       	push   $0xc010aa0b
c0108758:	e8 d2 fc ff ff       	call   c010842f <assertion_failure>
c010875d:	83 c4 10             	add    $0x10,%esp
c0108760:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0108763:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c010876a:	84 c0                	test   %al,%al
c010876c:	74 1c                	je     c010878a <sys_send_msg+0x2df>
c010876e:	68 45 05 00 00       	push   $0x545
c0108773:	68 63 a9 10 c0       	push   $0xc010a963
c0108778:	68 63 a9 10 c0       	push   $0xc010a963
c010877d:	68 20 aa 10 c0       	push   $0xc010aa20
c0108782:	e8 a8 fc ff ff       	call   c010842f <assertion_failure>
c0108787:	83 c4 10             	add    $0x10,%esp
c010878a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010878d:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0108793:	83 f8 21             	cmp    $0x21,%eax
c0108796:	0f 84 45 01 00 00    	je     c01088e1 <sys_send_msg+0x436>
c010879c:	68 46 05 00 00       	push   $0x546
c01087a1:	68 63 a9 10 c0       	push   $0xc010a963
c01087a6:	68 63 a9 10 c0       	push   $0xc010a963
c01087ab:	68 38 aa 10 c0       	push   $0xc010aa38
c01087b0:	e8 7a fc ff ff       	call   c010842f <assertion_failure>
c01087b5:	83 c4 10             	add    $0x10,%esp
c01087b8:	e9 24 01 00 00       	jmp    c01088e1 <sys_send_msg+0x436>
c01087bd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01087c4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01087c7:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c01087ca:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01087cd:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c01087d3:	85 c0                	test   %eax,%eax
c01087d5:	75 1b                	jne    c01087f2 <sys_send_msg+0x347>
c01087d7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01087da:	8b 55 10             	mov    0x10(%ebp),%edx
c01087dd:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c01087e3:	8b 45 10             	mov    0x10(%ebp),%eax
c01087e6:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c01087ed:	00 00 00 
c01087f0:	eb 3f                	jmp    c0108831 <sys_send_msg+0x386>
c01087f2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01087f5:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c01087fb:	89 45 f0             	mov    %eax,-0x10(%ebp)
c01087fe:	eb 12                	jmp    c0108812 <sys_send_msg+0x367>
c0108800:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108803:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108806:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108809:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c010880f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108812:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0108816:	75 e8                	jne    c0108800 <sys_send_msg+0x355>
c0108818:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010881b:	8b 55 10             	mov    0x10(%ebp),%edx
c010881e:	89 90 5c 02 00 00    	mov    %edx,0x25c(%eax)
c0108824:	8b 45 10             	mov    0x10(%ebp),%eax
c0108827:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c010882e:	00 00 00 
c0108831:	8b 45 10             	mov    0x10(%ebp),%eax
c0108834:	8b 55 08             	mov    0x8(%ebp),%edx
c0108837:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c010883d:	8b 45 10             	mov    0x10(%ebp),%eax
c0108840:	8b 55 0c             	mov    0xc(%ebp),%edx
c0108843:	89 90 50 02 00 00    	mov    %edx,0x250(%eax)
c0108849:	8b 45 10             	mov    0x10(%ebp),%eax
c010884c:	c6 80 48 02 00 00 01 	movb   $0x1,0x248(%eax)
c0108853:	8b 45 10             	mov    0x10(%ebp),%eax
c0108856:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c010885d:	3c 01                	cmp    $0x1,%al
c010885f:	74 1c                	je     c010887d <sys_send_msg+0x3d2>
c0108861:	68 68 05 00 00       	push   $0x568
c0108866:	68 63 a9 10 c0       	push   $0xc010a963
c010886b:	68 63 a9 10 c0       	push   $0xc010a963
c0108870:	68 5c aa 10 c0       	push   $0xc010aa5c
c0108875:	e8 b5 fb ff ff       	call   c010842f <assertion_failure>
c010887a:	83 c4 10             	add    $0x10,%esp
c010887d:	8b 45 10             	mov    0x10(%ebp),%eax
c0108880:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0108886:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0108889:	74 1c                	je     c01088a7 <sys_send_msg+0x3fc>
c010888b:	68 69 05 00 00       	push   $0x569
c0108890:	68 63 a9 10 c0       	push   $0xc010a963
c0108895:	68 63 a9 10 c0       	push   $0xc010a963
c010889a:	68 78 aa 10 c0       	push   $0xc010aa78
c010889f:	e8 8b fb ff ff       	call   c010842f <assertion_failure>
c01088a4:	83 c4 10             	add    $0x10,%esp
c01088a7:	8b 45 10             	mov    0x10(%ebp),%eax
c01088aa:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c01088b0:	39 45 08             	cmp    %eax,0x8(%ebp)
c01088b3:	74 1c                	je     c01088d1 <sys_send_msg+0x426>
c01088b5:	68 6a 05 00 00       	push   $0x56a
c01088ba:	68 63 a9 10 c0       	push   $0xc010a963
c01088bf:	68 63 a9 10 c0       	push   $0xc010a963
c01088c4:	68 9a aa 10 c0       	push   $0xc010aa9a
c01088c9:	e8 61 fb ff ff       	call   c010842f <assertion_failure>
c01088ce:	83 c4 10             	add    $0x10,%esp
c01088d1:	83 ec 0c             	sub    $0xc,%esp
c01088d4:	ff 75 10             	pushl  0x10(%ebp)
c01088d7:	e8 6b 06 00 00       	call   c0108f47 <block>
c01088dc:	83 c4 10             	add    $0x10,%esp
c01088df:	eb 01                	jmp    c01088e2 <sys_send_msg+0x437>
c01088e1:	90                   	nop
c01088e2:	b8 00 00 00 00       	mov    $0x0,%eax
c01088e7:	c9                   	leave  
c01088e8:	c3                   	ret    

c01088e9 <sys_receive_msg>:
c01088e9:	55                   	push   %ebp
c01088ea:	89 e5                	mov    %esp,%ebp
c01088ec:	83 ec 58             	sub    $0x58,%esp
c01088ef:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c01088f6:	83 ec 0c             	sub    $0xc,%esp
c01088f9:	ff 75 0c             	pushl  0xc(%ebp)
c01088fc:	e8 2b ad ff ff       	call   c010362c <pid2proc>
c0108901:	83 c4 10             	add    $0x10,%esp
c0108904:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0108907:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c010890b:	74 2c                	je     c0108939 <sys_receive_msg+0x50>
c010890d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108910:	8b 80 b0 02 00 00    	mov    0x2b0(%eax),%eax
c0108916:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c010891b:	74 1c                	je     c0108939 <sys_receive_msg+0x50>
c010891d:	68 7e 05 00 00       	push   $0x57e
c0108922:	68 63 a9 10 c0       	push   $0xc010a963
c0108927:	68 63 a9 10 c0       	push   $0xc010a963
c010892c:	68 9c a9 10 c0       	push   $0xc010a99c
c0108931:	e8 f9 fa ff ff       	call   c010842f <assertion_failure>
c0108936:	83 c4 10             	add    $0x10,%esp
c0108939:	8b 45 10             	mov    0x10(%ebp),%eax
c010893c:	8b 80 b0 02 00 00    	mov    0x2b0(%eax),%eax
c0108942:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0108947:	74 1c                	je     c0108965 <sys_receive_msg+0x7c>
c0108949:	68 80 05 00 00       	push   $0x580
c010894e:	68 63 a9 10 c0       	push   $0xc010a963
c0108953:	68 63 a9 10 c0       	push   $0xc010a963
c0108958:	68 74 a9 10 c0       	push   $0xc010a974
c010895d:	e8 cd fa ff ff       	call   c010842f <assertion_failure>
c0108962:	83 c4 10             	add    $0x10,%esp
c0108965:	83 ec 0c             	sub    $0xc,%esp
c0108968:	ff 75 10             	pushl  0x10(%ebp)
c010896b:	e8 2e ad ff ff       	call   c010369e <proc2pid>
c0108970:	83 c4 10             	add    $0x10,%esp
c0108973:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0108976:	c7 45 dc 7c 00 00 00 	movl   $0x7c,-0x24(%ebp)
c010897d:	8b 45 08             	mov    0x8(%ebp),%eax
c0108980:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0108983:	8b 45 10             	mov    0x10(%ebp),%eax
c0108986:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c010898c:	83 ec 08             	sub    $0x8,%esp
c010898f:	50                   	push   %eax
c0108990:	ff 75 d8             	pushl  -0x28(%ebp)
c0108993:	e8 72 d3 ff ff       	call   c0105d0a <get_physical_address_proc>
c0108998:	83 c4 10             	add    $0x10,%esp
c010899b:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c010899e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01089a5:	8b 45 10             	mov    0x10(%ebp),%eax
c01089a8:	8b 80 60 02 00 00    	mov    0x260(%eax),%eax
c01089ae:	85 c0                	test   %eax,%eax
c01089b0:	0f 84 c5 00 00 00    	je     c0108a7b <sys_receive_msg+0x192>
c01089b6:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c01089ba:	74 0d                	je     c01089c9 <sys_receive_msg+0xe0>
c01089bc:	81 7d 0c 13 02 00 00 	cmpl   $0x213,0xc(%ebp)
c01089c3:	0f 85 b2 00 00 00    	jne    c0108a7b <sys_receive_msg+0x192>
c01089c9:	c7 45 d0 7c 00 00 00 	movl   $0x7c,-0x30(%ebp)
c01089d0:	83 ec 0c             	sub    $0xc,%esp
c01089d3:	ff 75 d0             	pushl  -0x30(%ebp)
c01089d6:	e8 a1 8a ff ff       	call   c010147c <sys_malloc>
c01089db:	83 c4 10             	add    $0x10,%esp
c01089de:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01089e1:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01089e4:	83 ec 04             	sub    $0x4,%esp
c01089e7:	50                   	push   %eax
c01089e8:	6a 00                	push   $0x0
c01089ea:	ff 75 cc             	pushl  -0x34(%ebp)
c01089ed:	e8 2d 22 00 00       	call   c010ac1f <Memset>
c01089f2:	83 c4 10             	add    $0x10,%esp
c01089f5:	8b 45 cc             	mov    -0x34(%ebp),%eax
c01089f8:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c01089fe:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0108a01:	c7 40 78 d5 07 00 00 	movl   $0x7d5,0x78(%eax)
c0108a08:	83 ec 08             	sub    $0x8,%esp
c0108a0b:	ff 75 d0             	pushl  -0x30(%ebp)
c0108a0e:	ff 75 d4             	pushl  -0x2c(%ebp)
c0108a11:	e8 26 d2 ff ff       	call   c0105c3c <alloc_virtual_memory>
c0108a16:	83 c4 10             	add    $0x10,%esp
c0108a19:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0108a1c:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0108a1f:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0108a22:	83 ec 04             	sub    $0x4,%esp
c0108a25:	52                   	push   %edx
c0108a26:	ff 75 cc             	pushl  -0x34(%ebp)
c0108a29:	50                   	push   %eax
c0108a2a:	e8 27 e0 ff ff       	call   c0106a56 <Memcpy>
c0108a2f:	83 c4 10             	add    $0x10,%esp
c0108a32:	8b 45 10             	mov    0x10(%ebp),%eax
c0108a35:	c7 80 60 02 00 00 00 	movl   $0x0,0x260(%eax)
c0108a3c:	00 00 00 
c0108a3f:	8b 45 10             	mov    0x10(%ebp),%eax
c0108a42:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c0108a49:	00 00 00 
c0108a4c:	8b 45 10             	mov    0x10(%ebp),%eax
c0108a4f:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c0108a56:	00 00 00 
c0108a59:	8b 45 10             	mov    0x10(%ebp),%eax
c0108a5c:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0108a63:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c0108a6a:	83 ec 08             	sub    $0x8,%esp
c0108a6d:	ff 75 d0             	pushl  -0x30(%ebp)
c0108a70:	ff 75 cc             	pushl  -0x34(%ebp)
c0108a73:	e8 19 8a ff ff       	call   c0101491 <sys_free>
c0108a78:	83 c4 10             	add    $0x10,%esp
c0108a7b:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c0108a7f:	0f 84 c3 03 00 00    	je     c0108e48 <sys_receive_msg+0x55f>
c0108a85:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0108a89:	75 26                	jne    c0108ab1 <sys_receive_msg+0x1c8>
c0108a8b:	8b 45 10             	mov    0x10(%ebp),%eax
c0108a8e:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0108a94:	85 c0                	test   %eax,%eax
c0108a96:	0f 84 8a 00 00 00    	je     c0108b26 <sys_receive_msg+0x23d>
c0108a9c:	8b 45 10             	mov    0x10(%ebp),%eax
c0108a9f:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0108aa5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108aa8:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0108aaf:	eb 75                	jmp    c0108b26 <sys_receive_msg+0x23d>
c0108ab1:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0108ab5:	78 6f                	js     c0108b26 <sys_receive_msg+0x23d>
c0108ab7:	83 7d 0c 07          	cmpl   $0x7,0xc(%ebp)
c0108abb:	7f 69                	jg     c0108b26 <sys_receive_msg+0x23d>
c0108abd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108ac0:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0108ac7:	3c 01                	cmp    $0x1,%al
c0108ac9:	75 5b                	jne    c0108b26 <sys_receive_msg+0x23d>
c0108acb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108ace:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0108ad4:	83 f8 12             	cmp    $0x12,%eax
c0108ad7:	74 0e                	je     c0108ae7 <sys_receive_msg+0x1fe>
c0108ad9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0108adc:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0108ae2:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c0108ae5:	75 3f                	jne    c0108b26 <sys_receive_msg+0x23d>
c0108ae7:	8b 45 10             	mov    0x10(%ebp),%eax
c0108aea:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0108af0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108af3:	eb 2b                	jmp    c0108b20 <sys_receive_msg+0x237>
c0108af5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108af8:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108afb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108afe:	8b 90 24 01 00 00    	mov    0x124(%eax),%edx
c0108b04:	8b 45 0c             	mov    0xc(%ebp),%eax
c0108b07:	39 c2                	cmp    %eax,%edx
c0108b09:	75 09                	jne    c0108b14 <sys_receive_msg+0x22b>
c0108b0b:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0108b12:	eb 12                	jmp    c0108b26 <sys_receive_msg+0x23d>
c0108b14:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108b17:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c0108b1d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0108b20:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0108b24:	75 cf                	jne    c0108af5 <sys_receive_msg+0x20c>
c0108b26:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0108b2a:	0f 85 4e 02 00 00    	jne    c0108d7e <sys_receive_msg+0x495>
c0108b30:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108b33:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0108b36:	83 ec 08             	sub    $0x8,%esp
c0108b39:	ff 75 dc             	pushl  -0x24(%ebp)
c0108b3c:	ff 75 d4             	pushl  -0x2c(%ebp)
c0108b3f:	e8 f8 d0 ff ff       	call   c0105c3c <alloc_virtual_memory>
c0108b44:	83 c4 10             	add    $0x10,%esp
c0108b47:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0108b4a:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0108b4d:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0108b53:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0108b56:	83 ec 0c             	sub    $0xc,%esp
c0108b59:	ff 75 c4             	pushl  -0x3c(%ebp)
c0108b5c:	e8 3d ab ff ff       	call   c010369e <proc2pid>
c0108b61:	83 c4 10             	add    $0x10,%esp
c0108b64:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0108b67:	83 ec 08             	sub    $0x8,%esp
c0108b6a:	ff 75 b8             	pushl  -0x48(%ebp)
c0108b6d:	ff 75 bc             	pushl  -0x44(%ebp)
c0108b70:	e8 95 d1 ff ff       	call   c0105d0a <get_physical_address_proc>
c0108b75:	83 c4 10             	add    $0x10,%esp
c0108b78:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0108b7b:	83 ec 08             	sub    $0x8,%esp
c0108b7e:	ff 75 dc             	pushl  -0x24(%ebp)
c0108b81:	ff 75 b4             	pushl  -0x4c(%ebp)
c0108b84:	e8 b3 d0 ff ff       	call   c0105c3c <alloc_virtual_memory>
c0108b89:	83 c4 10             	add    $0x10,%esp
c0108b8c:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0108b8f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0108b92:	83 ec 04             	sub    $0x4,%esp
c0108b95:	50                   	push   %eax
c0108b96:	ff 75 b0             	pushl  -0x50(%ebp)
c0108b99:	ff 75 c0             	pushl  -0x40(%ebp)
c0108b9c:	e8 b5 de ff ff       	call   c0106a56 <Memcpy>
c0108ba1:	83 c4 10             	add    $0x10,%esp
c0108ba4:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0108ba7:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0108baa:	8b 45 10             	mov    0x10(%ebp),%eax
c0108bad:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0108bb3:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0108bb6:	75 21                	jne    c0108bd9 <sys_receive_msg+0x2f0>
c0108bb8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108bbb:	8b 90 5c 02 00 00    	mov    0x25c(%eax),%edx
c0108bc1:	8b 45 10             	mov    0x10(%ebp),%eax
c0108bc4:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c0108bca:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108bcd:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c0108bd4:	00 00 00 
c0108bd7:	eb 1f                	jmp    c0108bf8 <sys_receive_msg+0x30f>
c0108bd9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108bdc:	8b 90 5c 02 00 00    	mov    0x25c(%eax),%edx
c0108be2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0108be5:	89 90 5c 02 00 00    	mov    %edx,0x25c(%eax)
c0108beb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108bee:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c0108bf5:	00 00 00 
c0108bf8:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0108bfb:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c0108c02:	00 00 00 
c0108c05:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0108c08:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0108c0f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0108c12:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c0108c19:	00 00 00 
c0108c1c:	8b 45 10             	mov    0x10(%ebp),%eax
c0108c1f:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c0108c26:	00 00 00 
c0108c29:	8b 45 10             	mov    0x10(%ebp),%eax
c0108c2c:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c0108c33:	00 00 00 
c0108c36:	8b 45 10             	mov    0x10(%ebp),%eax
c0108c39:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c0108c40:	00 00 00 
c0108c43:	83 ec 0c             	sub    $0xc,%esp
c0108c46:	ff 75 c4             	pushl  -0x3c(%ebp)
c0108c49:	e8 35 03 00 00       	call   c0108f83 <unblock>
c0108c4e:	83 c4 10             	add    $0x10,%esp
c0108c51:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0108c54:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0108c5a:	85 c0                	test   %eax,%eax
c0108c5c:	74 1c                	je     c0108c7a <sys_receive_msg+0x391>
c0108c5e:	68 ef 05 00 00       	push   $0x5ef
c0108c63:	68 63 a9 10 c0       	push   $0xc010a963
c0108c68:	68 63 a9 10 c0       	push   $0xc010a963
c0108c6d:	68 af aa 10 c0       	push   $0xc010aaaf
c0108c72:	e8 b8 f7 ff ff       	call   c010842f <assertion_failure>
c0108c77:	83 c4 10             	add    $0x10,%esp
c0108c7a:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0108c7d:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0108c84:	84 c0                	test   %al,%al
c0108c86:	74 1c                	je     c0108ca4 <sys_receive_msg+0x3bb>
c0108c88:	68 f0 05 00 00       	push   $0x5f0
c0108c8d:	68 63 a9 10 c0       	push   $0xc010a963
c0108c92:	68 63 a9 10 c0       	push   $0xc010a963
c0108c97:	68 c7 aa 10 c0       	push   $0xc010aac7
c0108c9c:	e8 8e f7 ff ff       	call   c010842f <assertion_failure>
c0108ca1:	83 c4 10             	add    $0x10,%esp
c0108ca4:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0108ca7:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0108cad:	83 f8 21             	cmp    $0x21,%eax
c0108cb0:	74 1c                	je     c0108cce <sys_receive_msg+0x3e5>
c0108cb2:	68 f1 05 00 00       	push   $0x5f1
c0108cb7:	68 63 a9 10 c0       	push   $0xc010a963
c0108cbc:	68 63 a9 10 c0       	push   $0xc010a963
c0108cc1:	68 e0 aa 10 c0       	push   $0xc010aae0
c0108cc6:	e8 64 f7 ff ff       	call   c010842f <assertion_failure>
c0108ccb:	83 c4 10             	add    $0x10,%esp
c0108cce:	8b 45 10             	mov    0x10(%ebp),%eax
c0108cd1:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0108cd7:	85 c0                	test   %eax,%eax
c0108cd9:	74 1c                	je     c0108cf7 <sys_receive_msg+0x40e>
c0108cdb:	68 f3 05 00 00       	push   $0x5f3
c0108ce0:	68 63 a9 10 c0       	push   $0xc010a963
c0108ce5:	68 63 a9 10 c0       	push   $0xc010a963
c0108cea:	68 0b aa 10 c0       	push   $0xc010aa0b
c0108cef:	e8 3b f7 ff ff       	call   c010842f <assertion_failure>
c0108cf4:	83 c4 10             	add    $0x10,%esp
c0108cf7:	8b 45 10             	mov    0x10(%ebp),%eax
c0108cfa:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0108d01:	84 c0                	test   %al,%al
c0108d03:	74 1c                	je     c0108d21 <sys_receive_msg+0x438>
c0108d05:	68 f4 05 00 00       	push   $0x5f4
c0108d0a:	68 63 a9 10 c0       	push   $0xc010a963
c0108d0f:	68 63 a9 10 c0       	push   $0xc010a963
c0108d14:	68 20 aa 10 c0       	push   $0xc010aa20
c0108d19:	e8 11 f7 ff ff       	call   c010842f <assertion_failure>
c0108d1e:	83 c4 10             	add    $0x10,%esp
c0108d21:	8b 45 10             	mov    0x10(%ebp),%eax
c0108d24:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0108d2a:	83 f8 21             	cmp    $0x21,%eax
c0108d2d:	74 1c                	je     c0108d4b <sys_receive_msg+0x462>
c0108d2f:	68 f5 05 00 00       	push   $0x5f5
c0108d34:	68 63 a9 10 c0       	push   $0xc010a963
c0108d39:	68 63 a9 10 c0       	push   $0xc010a963
c0108d3e:	68 38 aa 10 c0       	push   $0xc010aa38
c0108d43:	e8 e7 f6 ff ff       	call   c010842f <assertion_failure>
c0108d48:	83 c4 10             	add    $0x10,%esp
c0108d4b:	8b 45 10             	mov    0x10(%ebp),%eax
c0108d4e:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0108d54:	83 f8 21             	cmp    $0x21,%eax
c0108d57:	0f 84 e4 00 00 00    	je     c0108e41 <sys_receive_msg+0x558>
c0108d5d:	68 f6 05 00 00       	push   $0x5f6
c0108d62:	68 63 a9 10 c0       	push   $0xc010a963
c0108d67:	68 63 a9 10 c0       	push   $0xc010a963
c0108d6c:	68 04 ab 10 c0       	push   $0xc010ab04
c0108d71:	e8 b9 f6 ff ff       	call   c010842f <assertion_failure>
c0108d76:	83 c4 10             	add    $0x10,%esp
c0108d79:	e9 c3 00 00 00       	jmp    c0108e41 <sys_receive_msg+0x558>
c0108d7e:	8b 45 10             	mov    0x10(%ebp),%eax
c0108d81:	c6 80 48 02 00 00 02 	movb   $0x2,0x248(%eax)
c0108d88:	8b 45 10             	mov    0x10(%ebp),%eax
c0108d8b:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0108d92:	3c 02                	cmp    $0x2,%al
c0108d94:	74 1c                	je     c0108db2 <sys_receive_msg+0x4c9>
c0108d96:	68 fb 05 00 00       	push   $0x5fb
c0108d9b:	68 63 a9 10 c0       	push   $0xc010a963
c0108da0:	68 63 a9 10 c0       	push   $0xc010a963
c0108da5:	68 23 ab 10 c0       	push   $0xc010ab23
c0108daa:	e8 80 f6 ff ff       	call   c010842f <assertion_failure>
c0108daf:	83 c4 10             	add    $0x10,%esp
c0108db2:	8b 45 10             	mov    0x10(%ebp),%eax
c0108db5:	8b 55 08             	mov    0x8(%ebp),%edx
c0108db8:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c0108dbe:	8b 45 10             	mov    0x10(%ebp),%eax
c0108dc1:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0108dc8:	3c 02                	cmp    $0x2,%al
c0108dca:	74 1c                	je     c0108de8 <sys_receive_msg+0x4ff>
c0108dcc:	68 fd 05 00 00       	push   $0x5fd
c0108dd1:	68 63 a9 10 c0       	push   $0xc010a963
c0108dd6:	68 63 a9 10 c0       	push   $0xc010a963
c0108ddb:	68 23 ab 10 c0       	push   $0xc010ab23
c0108de0:	e8 4a f6 ff ff       	call   c010842f <assertion_failure>
c0108de5:	83 c4 10             	add    $0x10,%esp
c0108de8:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0108dec:	75 0f                	jne    c0108dfd <sys_receive_msg+0x514>
c0108dee:	8b 45 10             	mov    0x10(%ebp),%eax
c0108df1:	c7 80 54 02 00 00 12 	movl   $0x12,0x254(%eax)
c0108df8:	00 00 00 
c0108dfb:	eb 0c                	jmp    c0108e09 <sys_receive_msg+0x520>
c0108dfd:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e00:	8b 55 0c             	mov    0xc(%ebp),%edx
c0108e03:	89 90 54 02 00 00    	mov    %edx,0x254(%eax)
c0108e09:	8b 45 10             	mov    0x10(%ebp),%eax
c0108e0c:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0108e13:	3c 02                	cmp    $0x2,%al
c0108e15:	74 1c                	je     c0108e33 <sys_receive_msg+0x54a>
c0108e17:	68 08 06 00 00       	push   $0x608
c0108e1c:	68 63 a9 10 c0       	push   $0xc010a963
c0108e21:	68 63 a9 10 c0       	push   $0xc010a963
c0108e26:	68 23 ab 10 c0       	push   $0xc010ab23
c0108e2b:	e8 ff f5 ff ff       	call   c010842f <assertion_failure>
c0108e30:	83 c4 10             	add    $0x10,%esp
c0108e33:	83 ec 0c             	sub    $0xc,%esp
c0108e36:	ff 75 10             	pushl  0x10(%ebp)
c0108e39:	e8 09 01 00 00       	call   c0108f47 <block>
c0108e3e:	83 c4 10             	add    $0x10,%esp
c0108e41:	b8 00 00 00 00       	mov    $0x0,%eax
c0108e46:	eb 02                	jmp    c0108e4a <sys_receive_msg+0x561>
c0108e48:	90                   	nop
c0108e49:	90                   	nop
c0108e4a:	c9                   	leave  
c0108e4b:	c3                   	ret    

c0108e4c <send_rec>:
c0108e4c:	55                   	push   %ebp
c0108e4d:	89 e5                	mov    %esp,%ebp
c0108e4f:	83 ec 18             	sub    $0x18,%esp
c0108e52:	8b 45 0c             	mov    0xc(%ebp),%eax
c0108e55:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0108e58:	c7 45 f0 7c 00 00 00 	movl   $0x7c,-0x10(%ebp)
c0108e5f:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c0108e63:	74 28                	je     c0108e8d <send_rec+0x41>
c0108e65:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0108e69:	74 22                	je     c0108e8d <send_rec+0x41>
c0108e6b:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c0108e6f:	74 1c                	je     c0108e8d <send_rec+0x41>
c0108e71:	68 1a 06 00 00       	push   $0x61a
c0108e76:	68 63 a9 10 c0       	push   $0xc010a963
c0108e7b:	68 63 a9 10 c0       	push   $0xc010a963
c0108e80:	68 44 ab 10 c0       	push   $0xc010ab44
c0108e85:	e8 a5 f5 ff ff       	call   c010842f <assertion_failure>
c0108e8a:	83 c4 10             	add    $0x10,%esp
c0108e8d:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0108e91:	75 14                	jne    c0108ea7 <send_rec+0x5b>
c0108e93:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108e96:	83 ec 04             	sub    $0x4,%esp
c0108e99:	50                   	push   %eax
c0108e9a:	6a 00                	push   $0x0
c0108e9c:	ff 75 0c             	pushl  0xc(%ebp)
c0108e9f:	e8 7b 1d 00 00       	call   c010ac1f <Memset>
c0108ea4:	83 c4 10             	add    $0x10,%esp
c0108ea7:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0108eab:	74 23                	je     c0108ed0 <send_rec+0x84>
c0108ead:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c0108eb1:	74 34                	je     c0108ee7 <send_rec+0x9b>
c0108eb3:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c0108eb7:	75 74                	jne    c0108f2d <send_rec+0xe1>
c0108eb9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108ebc:	83 ec 08             	sub    $0x8,%esp
c0108ebf:	ff 75 10             	pushl  0x10(%ebp)
c0108ec2:	50                   	push   %eax
c0108ec3:	e8 88 85 ff ff       	call   c0101450 <send_msg>
c0108ec8:	83 c4 10             	add    $0x10,%esp
c0108ecb:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108ece:	eb 70                	jmp    c0108f40 <send_rec+0xf4>
c0108ed0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108ed3:	83 ec 08             	sub    $0x8,%esp
c0108ed6:	ff 75 10             	pushl  0x10(%ebp)
c0108ed9:	50                   	push   %eax
c0108eda:	e8 87 85 ff ff       	call   c0101466 <receive_msg>
c0108edf:	83 c4 10             	add    $0x10,%esp
c0108ee2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108ee5:	eb 59                	jmp    c0108f40 <send_rec+0xf4>
c0108ee7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108eea:	83 ec 08             	sub    $0x8,%esp
c0108eed:	ff 75 10             	pushl  0x10(%ebp)
c0108ef0:	50                   	push   %eax
c0108ef1:	e8 5a 85 ff ff       	call   c0101450 <send_msg>
c0108ef6:	83 c4 10             	add    $0x10,%esp
c0108ef9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108efc:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0108f00:	75 3d                	jne    c0108f3f <send_rec+0xf3>
c0108f02:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0108f05:	83 ec 04             	sub    $0x4,%esp
c0108f08:	50                   	push   %eax
c0108f09:	6a 00                	push   $0x0
c0108f0b:	ff 75 0c             	pushl  0xc(%ebp)
c0108f0e:	e8 0c 1d 00 00       	call   c010ac1f <Memset>
c0108f13:	83 c4 10             	add    $0x10,%esp
c0108f16:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0108f19:	83 ec 08             	sub    $0x8,%esp
c0108f1c:	ff 75 10             	pushl  0x10(%ebp)
c0108f1f:	50                   	push   %eax
c0108f20:	e8 41 85 ff ff       	call   c0101466 <receive_msg>
c0108f25:	83 c4 10             	add    $0x10,%esp
c0108f28:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0108f2b:	eb 12                	jmp    c0108f3f <send_rec+0xf3>
c0108f2d:	83 ec 0c             	sub    $0xc,%esp
c0108f30:	68 80 ab 10 c0       	push   $0xc010ab80
c0108f35:	e8 d7 f4 ff ff       	call   c0108411 <panic>
c0108f3a:	83 c4 10             	add    $0x10,%esp
c0108f3d:	eb 01                	jmp    c0108f40 <send_rec+0xf4>
c0108f3f:	90                   	nop
c0108f40:	b8 00 00 00 00       	mov    $0x0,%eax
c0108f45:	c9                   	leave  
c0108f46:	c3                   	ret    

c0108f47 <block>:
c0108f47:	55                   	push   %ebp
c0108f48:	89 e5                	mov    %esp,%ebp
c0108f4a:	83 ec 08             	sub    $0x8,%esp
c0108f4d:	8b 45 08             	mov    0x8(%ebp),%eax
c0108f50:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0108f57:	84 c0                	test   %al,%al
c0108f59:	75 1c                	jne    c0108f77 <block+0x30>
c0108f5b:	68 49 06 00 00       	push   $0x649
c0108f60:	68 63 a9 10 c0       	push   $0xc010a963
c0108f65:	68 63 a9 10 c0       	push   $0xc010a963
c0108f6a:	68 95 ab 10 c0       	push   $0xc010ab95
c0108f6f:	e8 bb f4 ff ff       	call   c010842f <assertion_failure>
c0108f74:	83 c4 10             	add    $0x10,%esp
c0108f77:	e8 5c a5 ff ff       	call   c01034d8 <schedule_process>
c0108f7c:	b8 00 00 00 00       	mov    $0x0,%eax
c0108f81:	c9                   	leave  
c0108f82:	c3                   	ret    

c0108f83 <unblock>:
c0108f83:	55                   	push   %ebp
c0108f84:	89 e5                	mov    %esp,%ebp
c0108f86:	83 ec 08             	sub    $0x8,%esp
c0108f89:	8b 45 08             	mov    0x8(%ebp),%eax
c0108f8c:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0108f93:	84 c0                	test   %al,%al
c0108f95:	74 1c                	je     c0108fb3 <unblock+0x30>
c0108f97:	68 52 06 00 00       	push   $0x652
c0108f9c:	68 63 a9 10 c0       	push   $0xc010a963
c0108fa1:	68 63 a9 10 c0       	push   $0xc010a963
c0108fa6:	68 ad ab 10 c0       	push   $0xc010abad
c0108fab:	e8 7f f4 ff ff       	call   c010842f <assertion_failure>
c0108fb0:	83 c4 10             	add    $0x10,%esp
c0108fb3:	8b 45 08             	mov    0x8(%ebp),%eax
c0108fb6:	05 00 01 00 00       	add    $0x100,%eax
c0108fbb:	83 ec 08             	sub    $0x8,%esp
c0108fbe:	50                   	push   %eax
c0108fbf:	68 ec fd 10 c0       	push   $0xc010fdec
c0108fc4:	e8 d7 0a 00 00       	call   c0109aa0 <appendToDoubleLinkList>
c0108fc9:	83 c4 10             	add    $0x10,%esp
c0108fcc:	b8 00 00 00 00       	mov    $0x0,%eax
c0108fd1:	c9                   	leave  
c0108fd2:	c3                   	ret    

c0108fd3 <get_ticks_ipc>:
c0108fd3:	55                   	push   %ebp
c0108fd4:	89 e5                	mov    %esp,%ebp
c0108fd6:	81 ec 98 00 00 00    	sub    $0x98,%esp
c0108fdc:	83 ec 04             	sub    $0x4,%esp
c0108fdf:	6a 7c                	push   $0x7c
c0108fe1:	6a 00                	push   $0x0
c0108fe3:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0108fe9:	50                   	push   %eax
c0108fea:	e8 30 1c 00 00       	call   c010ac1f <Memset>
c0108fef:	83 c4 10             	add    $0x10,%esp
c0108ff2:	c7 85 78 ff ff ff 01 	movl   $0x1,-0x88(%ebp)
c0108ff9:	00 00 00 
c0108ffc:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0109003:	83 ec 04             	sub    $0x4,%esp
c0109006:	6a 01                	push   $0x1
c0109008:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c010900e:	50                   	push   %eax
c010900f:	6a 03                	push   $0x3
c0109011:	e8 36 fe ff ff       	call   c0108e4c <send_rec>
c0109016:	83 c4 10             	add    $0x10,%esp
c0109019:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010901c:	8b 85 7c ff ff ff    	mov    -0x84(%ebp),%eax
c0109022:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109025:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109028:	c9                   	leave  
c0109029:	c3                   	ret    

c010902a <itoa>:
c010902a:	55                   	push   %ebp
c010902b:	89 e5                	mov    %esp,%ebp
c010902d:	53                   	push   %ebx
c010902e:	83 ec 14             	sub    $0x14,%esp
c0109031:	8b 45 08             	mov    0x8(%ebp),%eax
c0109034:	99                   	cltd   
c0109035:	f7 7d 10             	idivl  0x10(%ebp)
c0109038:	89 55 f4             	mov    %edx,-0xc(%ebp)
c010903b:	8b 45 08             	mov    0x8(%ebp),%eax
c010903e:	99                   	cltd   
c010903f:	f7 7d 10             	idivl  0x10(%ebp)
c0109042:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109045:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0109049:	74 14                	je     c010905f <itoa+0x35>
c010904b:	83 ec 04             	sub    $0x4,%esp
c010904e:	ff 75 10             	pushl  0x10(%ebp)
c0109051:	ff 75 0c             	pushl  0xc(%ebp)
c0109054:	ff 75 f0             	pushl  -0x10(%ebp)
c0109057:	e8 ce ff ff ff       	call   c010902a <itoa>
c010905c:	83 c4 10             	add    $0x10,%esp
c010905f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109062:	8d 58 30             	lea    0x30(%eax),%ebx
c0109065:	8b 45 0c             	mov    0xc(%ebp),%eax
c0109068:	8b 00                	mov    (%eax),%eax
c010906a:	8d 48 01             	lea    0x1(%eax),%ecx
c010906d:	8b 55 0c             	mov    0xc(%ebp),%edx
c0109070:	89 0a                	mov    %ecx,(%edx)
c0109072:	89 da                	mov    %ebx,%edx
c0109074:	88 10                	mov    %dl,(%eax)
c0109076:	8b 45 0c             	mov    0xc(%ebp),%eax
c0109079:	8b 00                	mov    (%eax),%eax
c010907b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c010907e:	c9                   	leave  
c010907f:	c3                   	ret    

c0109080 <i2a>:
c0109080:	55                   	push   %ebp
c0109081:	89 e5                	mov    %esp,%ebp
c0109083:	53                   	push   %ebx
c0109084:	83 ec 14             	sub    $0x14,%esp
c0109087:	8b 45 08             	mov    0x8(%ebp),%eax
c010908a:	99                   	cltd   
c010908b:	f7 7d 0c             	idivl  0xc(%ebp)
c010908e:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0109091:	8b 45 08             	mov    0x8(%ebp),%eax
c0109094:	99                   	cltd   
c0109095:	f7 7d 0c             	idivl  0xc(%ebp)
c0109098:	89 45 f0             	mov    %eax,-0x10(%ebp)
c010909b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c010909f:	74 14                	je     c01090b5 <i2a+0x35>
c01090a1:	83 ec 04             	sub    $0x4,%esp
c01090a4:	ff 75 10             	pushl  0x10(%ebp)
c01090a7:	ff 75 0c             	pushl  0xc(%ebp)
c01090aa:	ff 75 f0             	pushl  -0x10(%ebp)
c01090ad:	e8 ce ff ff ff       	call   c0109080 <i2a>
c01090b2:	83 c4 10             	add    $0x10,%esp
c01090b5:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c01090b9:	7f 0a                	jg     c01090c5 <i2a+0x45>
c01090bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01090be:	83 c0 30             	add    $0x30,%eax
c01090c1:	89 c3                	mov    %eax,%ebx
c01090c3:	eb 08                	jmp    c01090cd <i2a+0x4d>
c01090c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01090c8:	83 c0 37             	add    $0x37,%eax
c01090cb:	89 c3                	mov    %eax,%ebx
c01090cd:	8b 45 10             	mov    0x10(%ebp),%eax
c01090d0:	8b 00                	mov    (%eax),%eax
c01090d2:	8d 48 01             	lea    0x1(%eax),%ecx
c01090d5:	8b 55 10             	mov    0x10(%ebp),%edx
c01090d8:	89 0a                	mov    %ecx,(%edx)
c01090da:	88 18                	mov    %bl,(%eax)
c01090dc:	8b 45 10             	mov    0x10(%ebp),%eax
c01090df:	8b 00                	mov    (%eax),%eax
c01090e1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c01090e4:	c9                   	leave  
c01090e5:	c3                   	ret    

c01090e6 <inform_int>:
c01090e6:	55                   	push   %ebp
c01090e7:	89 e5                	mov    %esp,%ebp
c01090e9:	83 ec 18             	sub    $0x18,%esp
c01090ec:	83 ec 0c             	sub    $0xc,%esp
c01090ef:	ff 75 08             	pushl  0x8(%ebp)
c01090f2:	e8 35 a5 ff ff       	call   c010362c <pid2proc>
c01090f7:	83 c4 10             	add    $0x10,%esp
c01090fa:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01090fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109100:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0109107:	0f be c0             	movsbl %al,%eax
c010910a:	83 e0 02             	and    $0x2,%eax
c010910d:	85 c0                	test   %eax,%eax
c010910f:	0f 84 8e 00 00 00    	je     c01091a3 <inform_int+0xbd>
c0109115:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109118:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c010911e:	3d 13 02 00 00       	cmp    $0x213,%eax
c0109123:	74 0e                	je     c0109133 <inform_int+0x4d>
c0109125:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109128:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c010912e:	83 f8 12             	cmp    $0x12,%eax
c0109131:	75 7d                	jne    c01091b0 <inform_int+0xca>
c0109133:	c7 45 f0 7c 00 00 00 	movl   $0x7c,-0x10(%ebp)
c010913a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010913d:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0109143:	83 ec 08             	sub    $0x8,%esp
c0109146:	ff 75 f0             	pushl  -0x10(%ebp)
c0109149:	50                   	push   %eax
c010914a:	e8 ed ca ff ff       	call   c0105c3c <alloc_virtual_memory>
c010914f:	83 c4 10             	add    $0x10,%esp
c0109152:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109155:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109158:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c010915e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109161:	c7 40 78 d5 07 00 00 	movl   $0x7d5,0x78(%eax)
c0109168:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010916b:	c7 80 60 02 00 00 00 	movl   $0x0,0x260(%eax)
c0109172:	00 00 00 
c0109175:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109178:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c010917f:	00 00 00 
c0109182:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0109189:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010918c:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0109193:	83 ec 0c             	sub    $0xc,%esp
c0109196:	ff 75 f4             	pushl  -0xc(%ebp)
c0109199:	e8 e5 fd ff ff       	call   c0108f83 <unblock>
c010919e:	83 c4 10             	add    $0x10,%esp
c01091a1:	eb 0d                	jmp    c01091b0 <inform_int+0xca>
c01091a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01091a6:	c7 80 60 02 00 00 01 	movl   $0x1,0x260(%eax)
c01091ad:	00 00 00 
c01091b0:	90                   	nop
c01091b1:	c9                   	leave  
c01091b2:	c3                   	ret    

c01091b3 <strcmp>:
c01091b3:	55                   	push   %ebp
c01091b4:	89 e5                	mov    %esp,%ebp
c01091b6:	83 ec 10             	sub    $0x10,%esp
c01091b9:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c01091bd:	74 06                	je     c01091c5 <strcmp+0x12>
c01091bf:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01091c3:	75 08                	jne    c01091cd <strcmp+0x1a>
c01091c5:	8b 45 08             	mov    0x8(%ebp),%eax
c01091c8:	2b 45 0c             	sub    0xc(%ebp),%eax
c01091cb:	eb 53                	jmp    c0109220 <strcmp+0x6d>
c01091cd:	8b 45 08             	mov    0x8(%ebp),%eax
c01091d0:	89 45 fc             	mov    %eax,-0x4(%ebp)
c01091d3:	8b 45 0c             	mov    0xc(%ebp),%eax
c01091d6:	89 45 f8             	mov    %eax,-0x8(%ebp)
c01091d9:	eb 18                	jmp    c01091f3 <strcmp+0x40>
c01091db:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01091de:	0f b6 10             	movzbl (%eax),%edx
c01091e1:	8b 45 f8             	mov    -0x8(%ebp),%eax
c01091e4:	0f b6 00             	movzbl (%eax),%eax
c01091e7:	38 c2                	cmp    %al,%dl
c01091e9:	75 1e                	jne    c0109209 <strcmp+0x56>
c01091eb:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c01091ef:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c01091f3:	8b 45 fc             	mov    -0x4(%ebp),%eax
c01091f6:	0f b6 00             	movzbl (%eax),%eax
c01091f9:	84 c0                	test   %al,%al
c01091fb:	74 0d                	je     c010920a <strcmp+0x57>
c01091fd:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0109200:	0f b6 00             	movzbl (%eax),%eax
c0109203:	84 c0                	test   %al,%al
c0109205:	75 d4                	jne    c01091db <strcmp+0x28>
c0109207:	eb 01                	jmp    c010920a <strcmp+0x57>
c0109209:	90                   	nop
c010920a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c010920d:	0f b6 00             	movzbl (%eax),%eax
c0109210:	0f be d0             	movsbl %al,%edx
c0109213:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0109216:	0f b6 00             	movzbl (%eax),%eax
c0109219:	0f be c0             	movsbl %al,%eax
c010921c:	29 c2                	sub    %eax,%edx
c010921e:	89 d0                	mov    %edx,%eax
c0109220:	c9                   	leave  
c0109221:	c3                   	ret    

c0109222 <create_user_process_address_space>:
c0109222:	55                   	push   %ebp
c0109223:	89 e5                	mov    %esp,%ebp
c0109225:	83 ec 18             	sub    $0x18,%esp
c0109228:	83 ec 08             	sub    $0x8,%esp
c010922b:	6a 00                	push   $0x0
c010922d:	6a 01                	push   $0x1
c010922f:	e8 3b cd ff ff       	call   c0105f6f <alloc_memory>
c0109234:	83 c4 10             	add    $0x10,%esp
c0109237:	89 45 f4             	mov    %eax,-0xc(%ebp)
c010923a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010923d:	c7 40 08 00 80 04 08 	movl   $0x8048000,0x8(%eax)
c0109244:	c7 45 f0 00 80 fb b7 	movl   $0xb7fb8000,-0x10(%ebp)
c010924b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c010924e:	05 ff 0f 00 00       	add    $0xfff,%eax
c0109253:	c1 e8 0c             	shr    $0xc,%eax
c0109256:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109259:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010925c:	83 c0 07             	add    $0x7,%eax
c010925f:	c1 e8 03             	shr    $0x3,%eax
c0109262:	89 c2                	mov    %eax,%edx
c0109264:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109267:	89 50 04             	mov    %edx,0x4(%eax)
c010926a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010926d:	8b 40 04             	mov    0x4(%eax),%eax
c0109270:	05 ff 0f 00 00       	add    $0xfff,%eax
c0109275:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c010927b:	85 c0                	test   %eax,%eax
c010927d:	0f 48 c2             	cmovs  %edx,%eax
c0109280:	c1 f8 0c             	sar    $0xc,%eax
c0109283:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0109286:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109289:	83 ec 08             	sub    $0x8,%esp
c010928c:	6a 00                	push   $0x0
c010928e:	50                   	push   %eax
c010928f:	e8 db cc ff ff       	call   c0105f6f <alloc_memory>
c0109294:	83 c4 10             	add    $0x10,%esp
c0109297:	89 c2                	mov    %eax,%edx
c0109299:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010929c:	89 10                	mov    %edx,(%eax)
c010929e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01092a1:	83 ec 0c             	sub    $0xc,%esp
c01092a4:	50                   	push   %eax
c01092a5:	e8 9c c4 ff ff       	call   c0105746 <init_bitmap>
c01092aa:	83 c4 10             	add    $0x10,%esp
c01092ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01092b0:	c9                   	leave  
c01092b1:	c3                   	ret    

c01092b2 <user_process>:
c01092b2:	55                   	push   %ebp
c01092b3:	89 e5                	mov    %esp,%ebp
c01092b5:	83 ec 38             	sub    $0x38,%esp
c01092b8:	c7 45 f0 b2 0c 00 00 	movl   $0xcb2,-0x10(%ebp)
c01092bf:	c7 45 ec ba 0c 00 00 	movl   $0xcba,-0x14(%ebp)
c01092c6:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%ebp)
c01092cd:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c01092d1:	75 0e                	jne    c01092e1 <user_process+0x2f>
c01092d3:	66 c7 45 f6 48 00    	movw   $0x48,-0xa(%ebp)
c01092d9:	66 c7 45 f4 50 00    	movw   $0x50,-0xc(%ebp)
c01092df:	eb 0c                	jmp    c01092ed <user_process+0x3b>
c01092e1:	66 c7 45 f6 59 00    	movw   $0x59,-0xa(%ebp)
c01092e7:	66 c7 45 f4 61 00    	movw   $0x61,-0xc(%ebp)
c01092ed:	e8 a5 70 ff ff       	call   c0100397 <get_running_thread_pcb>
c01092f2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01092f5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01092f8:	05 00 10 00 00       	add    $0x1000,%eax
c01092fd:	89 c2                	mov    %eax,%edx
c01092ff:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109302:	89 10                	mov    %edx,(%eax)
c0109304:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109307:	8b 00                	mov    (%eax),%eax
c0109309:	83 e8 44             	sub    $0x44,%eax
c010930c:	89 c2                	mov    %eax,%edx
c010930e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109311:	89 10                	mov    %edx,(%eax)
c0109313:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109316:	8b 00                	mov    (%eax),%eax
c0109318:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010931b:	c6 45 df 00          	movb   $0x0,-0x21(%ebp)
c010931f:	66 c7 45 dc 02 12    	movw   $0x1202,-0x24(%ebp)
c0109325:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0109329:	66 89 45 da          	mov    %ax,-0x26(%ebp)
c010932d:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0109331:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
c0109335:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0109339:	66 89 45 d6          	mov    %ax,-0x2a(%ebp)
c010933d:	66 c7 45 d4 38 00    	movw   $0x38,-0x2c(%ebp)
c0109343:	0f b7 55 f4          	movzwl -0xc(%ebp),%edx
c0109347:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010934a:	89 50 34             	mov    %edx,0x34(%eax)
c010934d:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c0109351:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109354:	89 50 0c             	mov    %edx,0xc(%eax)
c0109357:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c010935b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010935e:	89 50 04             	mov    %edx,0x4(%eax)
c0109361:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c0109365:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109368:	89 50 08             	mov    %edx,0x8(%eax)
c010936b:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c010936f:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109372:	89 50 40             	mov    %edx,0x40(%eax)
c0109375:	0f b7 55 d4          	movzwl -0x2c(%ebp),%edx
c0109379:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010937c:	89 10                	mov    %edx,(%eax)
c010937e:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109381:	8b 55 08             	mov    0x8(%ebp),%edx
c0109384:	89 50 30             	mov    %edx,0x30(%eax)
c0109387:	0f b7 55 dc          	movzwl -0x24(%ebp),%edx
c010938b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010938e:	89 50 38             	mov    %edx,0x38(%eax)
c0109391:	83 ec 08             	sub    $0x8,%esp
c0109394:	6a 01                	push   $0x1
c0109396:	68 00 f0 ff bf       	push   $0xbffff000
c010939b:	e8 07 cb ff ff       	call   c0105ea7 <alloc_physical_memory>
c01093a0:	83 c4 10             	add    $0x10,%esp
c01093a3:	8d 90 00 10 00 00    	lea    0x1000(%eax),%edx
c01093a9:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01093ac:	89 50 3c             	mov    %edx,0x3c(%eax)
c01093af:	8b 45 e0             	mov    -0x20(%ebp),%eax
c01093b2:	83 ec 0c             	sub    $0xc,%esp
c01093b5:	50                   	push   %eax
c01093b6:	e8 b1 6e ff ff       	call   c010026c <restart>
c01093bb:	83 c4 10             	add    $0x10,%esp
c01093be:	90                   	nop
c01093bf:	c9                   	leave  
c01093c0:	c3                   	ret    

c01093c1 <clone_pcb>:
c01093c1:	55                   	push   %ebp
c01093c2:	89 e5                	mov    %esp,%ebp
c01093c4:	83 ec 38             	sub    $0x38,%esp
c01093c7:	83 ec 08             	sub    $0x8,%esp
c01093ca:	6a 00                	push   $0x0
c01093cc:	6a 01                	push   $0x1
c01093ce:	e8 9c cb ff ff       	call   c0105f6f <alloc_memory>
c01093d3:	83 c4 10             	add    $0x10,%esp
c01093d6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01093d9:	83 ec 04             	sub    $0x4,%esp
c01093dc:	68 00 10 00 00       	push   $0x1000
c01093e1:	6a 00                	push   $0x0
c01093e3:	ff 75 f4             	pushl  -0xc(%ebp)
c01093e6:	e8 34 18 00 00       	call   c010ac1f <Memset>
c01093eb:	83 c4 10             	add    $0x10,%esp
c01093ee:	83 ec 04             	sub    $0x4,%esp
c01093f1:	68 00 10 00 00       	push   $0x1000
c01093f6:	ff 75 08             	pushl  0x8(%ebp)
c01093f9:	ff 75 f4             	pushl  -0xc(%ebp)
c01093fc:	e8 55 d6 ff ff       	call   c0106a56 <Memcpy>
c0109401:	83 c4 10             	add    $0x10,%esp
c0109404:	a1 90 f7 10 c0       	mov    0xc010f790,%eax
c0109409:	83 c0 01             	add    $0x1,%eax
c010940c:	a3 90 f7 10 c0       	mov    %eax,0xc010f790
c0109411:	8b 15 90 f7 10 c0    	mov    0xc010f790,%edx
c0109417:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010941a:	89 90 24 01 00 00    	mov    %edx,0x124(%eax)
c0109420:	8b 45 08             	mov    0x8(%ebp),%eax
c0109423:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0109429:	89 c2                	mov    %eax,%edx
c010942b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010942e:	89 90 64 02 00 00    	mov    %edx,0x264(%eax)
c0109434:	83 ec 08             	sub    $0x8,%esp
c0109437:	6a 00                	push   $0x0
c0109439:	6a 01                	push   $0x1
c010943b:	e8 2f cb ff ff       	call   c0105f6f <alloc_memory>
c0109440:	83 c4 10             	add    $0x10,%esp
c0109443:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109446:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109449:	05 00 0c 00 00       	add    $0xc00,%eax
c010944e:	83 ec 04             	sub    $0x4,%esp
c0109451:	68 00 04 00 00       	push   $0x400
c0109456:	68 00 fc ff ff       	push   $0xfffffc00
c010945b:	50                   	push   %eax
c010945c:	e8 f5 d5 ff ff       	call   c0106a56 <Memcpy>
c0109461:	83 c4 10             	add    $0x10,%esp
c0109464:	83 ec 0c             	sub    $0xc,%esp
c0109467:	ff 75 f0             	pushl  -0x10(%ebp)
c010946a:	e8 17 c9 ff ff       	call   c0105d86 <get_physical_address>
c010946f:	83 c4 10             	add    $0x10,%esp
c0109472:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109475:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109478:	05 fc 0f 00 00       	add    $0xffc,%eax
c010947d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0109480:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109483:	83 c8 07             	or     $0x7,%eax
c0109486:	89 c2                	mov    %eax,%edx
c0109488:	8b 45 e8             	mov    -0x18(%ebp),%eax
c010948b:	89 10                	mov    %edx,(%eax)
c010948d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109490:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0109493:	89 50 08             	mov    %edx,0x8(%eax)
c0109496:	e8 87 fd ff ff       	call   c0109222 <create_user_process_address_space>
c010949b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c010949e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c01094a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01094a4:	89 50 0c             	mov    %edx,0xc(%eax)
c01094a7:	8b 45 08             	mov    0x8(%ebp),%eax
c01094aa:	8b 40 0c             	mov    0xc(%eax),%eax
c01094ad:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01094b0:	83 ec 04             	sub    $0x4,%esp
c01094b3:	6a 0c                	push   $0xc
c01094b5:	ff 75 e0             	pushl  -0x20(%ebp)
c01094b8:	ff 75 e4             	pushl  -0x1c(%ebp)
c01094bb:	e8 96 d5 ff ff       	call   c0106a56 <Memcpy>
c01094c0:	83 c4 10             	add    $0x10,%esp
c01094c3:	c7 45 dc 00 80 fb b7 	movl   $0xb7fb8000,-0x24(%ebp)
c01094ca:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01094cd:	05 ff 0f 00 00       	add    $0xfff,%eax
c01094d2:	c1 e8 0c             	shr    $0xc,%eax
c01094d5:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01094d8:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01094db:	83 c0 07             	add    $0x7,%eax
c01094de:	c1 e8 03             	shr    $0x3,%eax
c01094e1:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01094e4:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01094e7:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c01094ea:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c01094ed:	05 ff 0f 00 00       	add    $0xfff,%eax
c01094f2:	c1 e8 0c             	shr    $0xc,%eax
c01094f5:	89 45 d0             	mov    %eax,-0x30(%ebp)
c01094f8:	8b 45 d0             	mov    -0x30(%ebp),%eax
c01094fb:	83 ec 08             	sub    $0x8,%esp
c01094fe:	6a 00                	push   $0x0
c0109500:	50                   	push   %eax
c0109501:	e8 69 ca ff ff       	call   c0105f6f <alloc_memory>
c0109506:	83 c4 10             	add    $0x10,%esp
c0109509:	89 c2                	mov    %eax,%edx
c010950b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010950e:	89 10                	mov    %edx,(%eax)
c0109510:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0109513:	c1 e0 0c             	shl    $0xc,%eax
c0109516:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0109519:	8b 45 e0             	mov    -0x20(%ebp),%eax
c010951c:	8b 10                	mov    (%eax),%edx
c010951e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109521:	8b 00                	mov    (%eax),%eax
c0109523:	83 ec 04             	sub    $0x4,%esp
c0109526:	ff 75 cc             	pushl  -0x34(%ebp)
c0109529:	52                   	push   %edx
c010952a:	50                   	push   %eax
c010952b:	e8 26 d5 ff ff       	call   c0106a56 <Memcpy>
c0109530:	83 c4 10             	add    $0x10,%esp
c0109533:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109536:	c9                   	leave  
c0109537:	c3                   	ret    

c0109538 <build_body_stack>:
c0109538:	55                   	push   %ebp
c0109539:	89 e5                	mov    %esp,%ebp
c010953b:	83 ec 48             	sub    $0x48,%esp
c010953e:	8b 45 08             	mov    0x8(%ebp),%eax
c0109541:	8b 40 0c             	mov    0xc(%eax),%eax
c0109544:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109547:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010954a:	8b 50 04             	mov    0x4(%eax),%edx
c010954d:	8b 00                	mov    (%eax),%eax
c010954f:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0109552:	89 55 c8             	mov    %edx,-0x38(%ebp)
c0109555:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0109558:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010955b:	8b 45 c8             	mov    -0x38(%ebp),%eax
c010955e:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0109561:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109564:	8b 40 08             	mov    0x8(%eax),%eax
c0109567:	89 45 d8             	mov    %eax,-0x28(%ebp)
c010956a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0109571:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0109578:	e8 75 d4 ff ff       	call   c01069f2 <intr_disable>
c010957d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0109580:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0109587:	e9 c2 00 00 00       	jmp    c010964e <build_body_stack+0x116>
c010958c:	8b 55 ec             	mov    -0x14(%ebp),%edx
c010958f:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109592:	01 d0                	add    %edx,%eax
c0109594:	0f b6 00             	movzbl (%eax),%eax
c0109597:	88 45 d3             	mov    %al,-0x2d(%ebp)
c010959a:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c01095a1:	e9 9a 00 00 00       	jmp    c0109640 <build_body_stack+0x108>
c01095a6:	0f be 55 d3          	movsbl -0x2d(%ebp),%edx
c01095aa:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01095ad:	89 c1                	mov    %eax,%ecx
c01095af:	d3 fa                	sar    %cl,%edx
c01095b1:	89 d0                	mov    %edx,%eax
c01095b3:	83 e0 01             	and    $0x1,%eax
c01095b6:	85 c0                	test   %eax,%eax
c01095b8:	75 06                	jne    c01095c0 <build_body_stack+0x88>
c01095ba:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c01095be:	eb 7c                	jmp    c010963c <build_body_stack+0x104>
c01095c0:	8b 45 08             	mov    0x8(%ebp),%eax
c01095c3:	8b 40 08             	mov    0x8(%eax),%eax
c01095c6:	83 ec 0c             	sub    $0xc,%esp
c01095c9:	50                   	push   %eax
c01095ca:	e8 ac 6d ff ff       	call   c010037b <update_cr3>
c01095cf:	83 c4 10             	add    $0x10,%esp
c01095d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01095d5:	c1 e0 0c             	shl    $0xc,%eax
c01095d8:	89 c2                	mov    %eax,%edx
c01095da:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01095dd:	01 d0                	add    %edx,%eax
c01095df:	89 45 cc             	mov    %eax,-0x34(%ebp)
c01095e2:	8b 55 cc             	mov    -0x34(%ebp),%edx
c01095e5:	8b 45 10             	mov    0x10(%ebp),%eax
c01095e8:	83 ec 04             	sub    $0x4,%esp
c01095eb:	68 00 10 00 00       	push   $0x1000
c01095f0:	52                   	push   %edx
c01095f1:	50                   	push   %eax
c01095f2:	e8 5f d4 ff ff       	call   c0106a56 <Memcpy>
c01095f7:	83 c4 10             	add    $0x10,%esp
c01095fa:	8b 45 0c             	mov    0xc(%ebp),%eax
c01095fd:	8b 40 08             	mov    0x8(%eax),%eax
c0109600:	83 ec 0c             	sub    $0xc,%esp
c0109603:	50                   	push   %eax
c0109604:	e8 72 6d ff ff       	call   c010037b <update_cr3>
c0109609:	83 c4 10             	add    $0x10,%esp
c010960c:	83 ec 08             	sub    $0x8,%esp
c010960f:	ff 75 cc             	pushl  -0x34(%ebp)
c0109612:	6a 01                	push   $0x1
c0109614:	e8 b8 c9 ff ff       	call   c0105fd1 <get_a_virtual_page>
c0109619:	83 c4 10             	add    $0x10,%esp
c010961c:	8b 55 10             	mov    0x10(%ebp),%edx
c010961f:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0109622:	83 ec 04             	sub    $0x4,%esp
c0109625:	68 00 10 00 00       	push   $0x1000
c010962a:	52                   	push   %edx
c010962b:	50                   	push   %eax
c010962c:	e8 25 d4 ff ff       	call   c0106a56 <Memcpy>
c0109631:	83 c4 10             	add    $0x10,%esp
c0109634:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0109638:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c010963c:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0109640:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0109644:	0f 8e 5c ff ff ff    	jle    c01095a6 <build_body_stack+0x6e>
c010964a:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c010964e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109651:	39 45 dc             	cmp    %eax,-0x24(%ebp)
c0109654:	0f 87 32 ff ff ff    	ja     c010958c <build_body_stack+0x54>
c010965a:	83 ec 0c             	sub    $0xc,%esp
c010965d:	ff 75 d4             	pushl  -0x2c(%ebp)
c0109660:	e8 b6 d3 ff ff       	call   c0106a1b <intr_set_status>
c0109665:	83 c4 10             	add    $0x10,%esp
c0109668:	90                   	nop
c0109669:	c9                   	leave  
c010966a:	c3                   	ret    

c010966b <build_process_kernel_stack>:
c010966b:	55                   	push   %ebp
c010966c:	89 e5                	mov    %esp,%ebp
c010966e:	83 ec 28             	sub    $0x28,%esp
c0109671:	e8 7c d3 ff ff       	call   c01069f2 <intr_disable>
c0109676:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109679:	8b 45 08             	mov    0x8(%ebp),%eax
c010967c:	05 00 10 00 00       	add    $0x1000,%eax
c0109681:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109684:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109687:	8b 00                	mov    (%eax),%eax
c0109689:	83 f8 38             	cmp    $0x38,%eax
c010968c:	74 06                	je     c0109694 <build_process_kernel_stack+0x29>
c010968e:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c0109692:	eb f0                	jmp    c0109684 <build_process_kernel_stack+0x19>
c0109694:	90                   	nop
c0109695:	8b 45 08             	mov    0x8(%ebp),%eax
c0109698:	05 00 10 00 00       	add    $0x1000,%eax
c010969d:	89 c2                	mov    %eax,%edx
c010969f:	8b 45 08             	mov    0x8(%ebp),%eax
c01096a2:	89 50 04             	mov    %edx,0x4(%eax)
c01096a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01096a8:	83 c0 2c             	add    $0x2c,%eax
c01096ab:	89 45 ec             	mov    %eax,-0x14(%ebp)
c01096ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01096b1:	83 e8 04             	sub    $0x4,%eax
c01096b4:	89 45 e8             	mov    %eax,-0x18(%ebp)
c01096b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01096ba:	83 e8 08             	sub    $0x8,%eax
c01096bd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01096c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01096c3:	83 e8 0c             	sub    $0xc,%eax
c01096c6:	89 45 e0             	mov    %eax,-0x20(%ebp)
c01096c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01096cc:	83 e8 10             	sub    $0x10,%eax
c01096cf:	89 45 dc             	mov    %eax,-0x24(%ebp)
c01096d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01096d5:	83 e8 14             	sub    $0x14,%eax
c01096d8:	89 45 d8             	mov    %eax,-0x28(%ebp)
c01096db:	ba 63 02 10 c0       	mov    $0xc0100263,%edx
c01096e0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c01096e3:	89 10                	mov    %edx,(%eax)
c01096e5:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01096e8:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c01096ee:	8b 45 d8             	mov    -0x28(%ebp),%eax
c01096f1:	8b 10                	mov    (%eax),%edx
c01096f3:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01096f6:	89 10                	mov    %edx,(%eax)
c01096f8:	8b 45 dc             	mov    -0x24(%ebp),%eax
c01096fb:	8b 10                	mov    (%eax),%edx
c01096fd:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109700:	89 10                	mov    %edx,(%eax)
c0109702:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0109705:	8b 10                	mov    (%eax),%edx
c0109707:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c010970a:	89 10                	mov    %edx,(%eax)
c010970c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010970f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0109715:	8b 45 08             	mov    0x8(%ebp),%eax
c0109718:	8b 55 d8             	mov    -0x28(%ebp),%edx
c010971b:	89 10                	mov    %edx,(%eax)
c010971d:	83 ec 0c             	sub    $0xc,%esp
c0109720:	ff 75 f0             	pushl  -0x10(%ebp)
c0109723:	e8 f3 d2 ff ff       	call   c0106a1b <intr_set_status>
c0109728:	83 c4 10             	add    $0x10,%esp
c010972b:	90                   	nop
c010972c:	c9                   	leave  
c010972d:	c3                   	ret    

c010972e <fork_process>:
c010972e:	55                   	push   %ebp
c010972f:	89 e5                	mov    %esp,%ebp
c0109731:	83 ec 18             	sub    $0x18,%esp
c0109734:	8b 45 08             	mov    0x8(%ebp),%eax
c0109737:	83 ec 0c             	sub    $0xc,%esp
c010973a:	50                   	push   %eax
c010973b:	e8 ec 9e ff ff       	call   c010362c <pid2proc>
c0109740:	83 c4 10             	add    $0x10,%esp
c0109743:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109746:	83 ec 0c             	sub    $0xc,%esp
c0109749:	ff 75 f4             	pushl  -0xc(%ebp)
c010974c:	e8 70 fc ff ff       	call   c01093c1 <clone_pcb>
c0109751:	83 c4 10             	add    $0x10,%esp
c0109754:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109757:	83 ec 08             	sub    $0x8,%esp
c010975a:	6a 00                	push   $0x0
c010975c:	6a 01                	push   $0x1
c010975e:	e8 0c c8 ff ff       	call   c0105f6f <alloc_memory>
c0109763:	83 c4 10             	add    $0x10,%esp
c0109766:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109769:	8b 45 ec             	mov    -0x14(%ebp),%eax
c010976c:	83 ec 04             	sub    $0x4,%esp
c010976f:	68 00 10 00 00       	push   $0x1000
c0109774:	6a 00                	push   $0x0
c0109776:	50                   	push   %eax
c0109777:	e8 a3 14 00 00       	call   c010ac1f <Memset>
c010977c:	83 c4 10             	add    $0x10,%esp
c010977f:	83 ec 04             	sub    $0x4,%esp
c0109782:	ff 75 ec             	pushl  -0x14(%ebp)
c0109785:	ff 75 f0             	pushl  -0x10(%ebp)
c0109788:	ff 75 f4             	pushl  -0xc(%ebp)
c010978b:	e8 a8 fd ff ff       	call   c0109538 <build_body_stack>
c0109790:	83 c4 10             	add    $0x10,%esp
c0109793:	83 ec 0c             	sub    $0xc,%esp
c0109796:	ff 75 f0             	pushl  -0x10(%ebp)
c0109799:	e8 cd fe ff ff       	call   c010966b <build_process_kernel_stack>
c010979e:	83 c4 10             	add    $0x10,%esp
c01097a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01097a4:	05 00 01 00 00       	add    $0x100,%eax
c01097a9:	83 ec 04             	sub    $0x4,%esp
c01097ac:	6a 08                	push   $0x8
c01097ae:	6a 00                	push   $0x0
c01097b0:	50                   	push   %eax
c01097b1:	e8 69 14 00 00       	call   c010ac1f <Memset>
c01097b6:	83 c4 10             	add    $0x10,%esp
c01097b9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01097bc:	05 08 01 00 00       	add    $0x108,%eax
c01097c1:	83 ec 04             	sub    $0x4,%esp
c01097c4:	6a 08                	push   $0x8
c01097c6:	6a 00                	push   $0x0
c01097c8:	50                   	push   %eax
c01097c9:	e8 51 14 00 00       	call   c010ac1f <Memset>
c01097ce:	83 c4 10             	add    $0x10,%esp
c01097d1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01097d4:	05 08 01 00 00       	add    $0x108,%eax
c01097d9:	83 ec 08             	sub    $0x8,%esp
c01097dc:	50                   	push   %eax
c01097dd:	68 04 0f 11 c0       	push   $0xc0110f04
c01097e2:	e8 b9 02 00 00       	call   c0109aa0 <appendToDoubleLinkList>
c01097e7:	83 c4 10             	add    $0x10,%esp
c01097ea:	8b 45 f0             	mov    -0x10(%ebp),%eax
c01097ed:	c9                   	leave  
c01097ee:	c3                   	ret    

c01097ef <process_execute>:
c01097ef:	55                   	push   %ebp
c01097f0:	89 e5                	mov    %esp,%ebp
c01097f2:	83 ec 28             	sub    $0x28,%esp
c01097f5:	e8 bc 04 00 00       	call   c0109cb6 <thread_init>
c01097fa:	89 45 f4             	mov    %eax,-0xc(%ebp)
c01097fd:	83 ec 0c             	sub    $0xc,%esp
c0109800:	ff 75 f4             	pushl  -0xc(%ebp)
c0109803:	e8 5b 05 00 00       	call   c0109d63 <thread_create>
c0109808:	83 c4 10             	add    $0x10,%esp
c010980b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010980e:	05 34 01 00 00       	add    $0x134,%eax
c0109813:	83 ec 08             	sub    $0x8,%esp
c0109816:	ff 75 10             	pushl  0x10(%ebp)
c0109819:	50                   	push   %eax
c010981a:	e8 1f 14 00 00       	call   c010ac3e <Strcpy>
c010981f:	83 c4 10             	add    $0x10,%esp
c0109822:	83 ec 08             	sub    $0x8,%esp
c0109825:	6a 00                	push   $0x0
c0109827:	6a 01                	push   $0x1
c0109829:	e8 41 c7 ff ff       	call   c0105f6f <alloc_memory>
c010982e:	83 c4 10             	add    $0x10,%esp
c0109831:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109834:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109837:	05 00 0c 00 00       	add    $0xc00,%eax
c010983c:	83 ec 04             	sub    $0x4,%esp
c010983f:	68 00 04 00 00       	push   $0x400
c0109844:	68 00 fc ff ff       	push   $0xfffffc00
c0109849:	50                   	push   %eax
c010984a:	e8 07 d2 ff ff       	call   c0106a56 <Memcpy>
c010984f:	83 c4 10             	add    $0x10,%esp
c0109852:	83 ec 0c             	sub    $0xc,%esp
c0109855:	ff 75 f0             	pushl  -0x10(%ebp)
c0109858:	e8 29 c5 ff ff       	call   c0105d86 <get_physical_address>
c010985d:	83 c4 10             	add    $0x10,%esp
c0109860:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109863:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109866:	05 fc 0f 00 00       	add    $0xffc,%eax
c010986b:	89 45 e8             	mov    %eax,-0x18(%ebp)
c010986e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0109871:	83 c8 07             	or     $0x7,%eax
c0109874:	89 c2                	mov    %eax,%edx
c0109876:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109879:	89 10                	mov    %edx,(%eax)
c010987b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c010987e:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0109881:	89 50 08             	mov    %edx,0x8(%eax)
c0109884:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109887:	83 c0 10             	add    $0x10,%eax
c010988a:	83 ec 0c             	sub    $0xc,%esp
c010988d:	50                   	push   %eax
c010988e:	e8 88 cc ff ff       	call   c010651b <init_memory_block_desc>
c0109893:	83 c4 10             	add    $0x10,%esp
c0109896:	e8 87 f9 ff ff       	call   c0109222 <create_user_process_address_space>
c010989b:	89 c2                	mov    %eax,%edx
c010989d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01098a0:	89 50 0c             	mov    %edx,0xc(%eax)
c01098a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c01098a6:	8b 00                	mov    (%eax),%eax
c01098a8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c01098ab:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01098ae:	c7 40 10 b2 92 10 c0 	movl   $0xc01092b2,0x10(%eax)
c01098b5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01098b8:	8b 55 08             	mov    0x8(%ebp),%edx
c01098bb:	89 50 18             	mov    %edx,0x18(%eax)
c01098be:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01098c1:	8b 55 0c             	mov    0xc(%ebp),%edx
c01098c4:	89 50 1c             	mov    %edx,0x1c(%eax)
c01098c7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01098ca:	8b 55 14             	mov    0x14(%ebp),%edx
c01098cd:	89 50 20             	mov    %edx,0x20(%eax)
c01098d0:	8b 55 f4             	mov    -0xc(%ebp),%edx
c01098d3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01098d6:	89 50 24             	mov    %edx,0x24(%eax)
c01098d9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01098dc:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c01098e2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01098e5:	8b 10                	mov    (%eax),%edx
c01098e7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01098ea:	89 50 04             	mov    %edx,0x4(%eax)
c01098ed:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01098f0:	8b 50 04             	mov    0x4(%eax),%edx
c01098f3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01098f6:	89 50 08             	mov    %edx,0x8(%eax)
c01098f9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c01098fc:	8b 50 08             	mov    0x8(%eax),%edx
c01098ff:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109902:	89 50 0c             	mov    %edx,0xc(%eax)
c0109905:	83 ec 0c             	sub    $0xc,%esp
c0109908:	68 ec fd 10 c0       	push   $0xc010fdec
c010990d:	e8 91 00 00 00       	call   c01099a3 <isListEmpty>
c0109912:	83 c4 10             	add    $0x10,%esp
c0109915:	e8 d8 d0 ff ff       	call   c01069f2 <intr_disable>
c010991a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c010991d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109920:	05 00 01 00 00       	add    $0x100,%eax
c0109925:	83 ec 08             	sub    $0x8,%esp
c0109928:	50                   	push   %eax
c0109929:	68 ec fd 10 c0       	push   $0xc010fdec
c010992e:	e8 6d 01 00 00       	call   c0109aa0 <appendToDoubleLinkList>
c0109933:	83 c4 10             	add    $0x10,%esp
c0109936:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109939:	05 08 01 00 00       	add    $0x108,%eax
c010993e:	83 ec 08             	sub    $0x8,%esp
c0109941:	50                   	push   %eax
c0109942:	68 04 0f 11 c0       	push   $0xc0110f04
c0109947:	e8 54 01 00 00       	call   c0109aa0 <appendToDoubleLinkList>
c010994c:	83 c4 10             	add    $0x10,%esp
c010994f:	83 ec 0c             	sub    $0xc,%esp
c0109952:	ff 75 e0             	pushl  -0x20(%ebp)
c0109955:	e8 c1 d0 ff ff       	call   c0106a1b <intr_set_status>
c010995a:	83 c4 10             	add    $0x10,%esp
c010995d:	90                   	nop
c010995e:	c9                   	leave  
c010995f:	c3                   	ret    

c0109960 <switch_to>:
c0109960:	56                   	push   %esi
c0109961:	57                   	push   %edi
c0109962:	53                   	push   %ebx
c0109963:	55                   	push   %ebp
c0109964:	89 e5                	mov    %esp,%ebp
c0109966:	8b 45 14             	mov    0x14(%ebp),%eax
c0109969:	89 20                	mov    %esp,(%eax)
c010996b:	8b 45 18             	mov    0x18(%ebp),%eax
c010996e:	8b 20                	mov    (%eax),%esp
c0109970:	5d                   	pop    %ebp
c0109971:	5b                   	pop    %ebx
c0109972:	5f                   	pop    %edi
c0109973:	5e                   	pop    %esi
c0109974:	c3                   	ret    

c0109975 <initDoubleLinkList>:
c0109975:	55                   	push   %ebp
c0109976:	89 e5                	mov    %esp,%ebp
c0109978:	8b 45 08             	mov    0x8(%ebp),%eax
c010997b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0109981:	8b 45 08             	mov    0x8(%ebp),%eax
c0109984:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c010998b:	8b 45 08             	mov    0x8(%ebp),%eax
c010998e:	8d 50 08             	lea    0x8(%eax),%edx
c0109991:	8b 45 08             	mov    0x8(%ebp),%eax
c0109994:	89 50 04             	mov    %edx,0x4(%eax)
c0109997:	8b 55 08             	mov    0x8(%ebp),%edx
c010999a:	8b 45 08             	mov    0x8(%ebp),%eax
c010999d:	89 50 08             	mov    %edx,0x8(%eax)
c01099a0:	90                   	nop
c01099a1:	5d                   	pop    %ebp
c01099a2:	c3                   	ret    

c01099a3 <isListEmpty>:
c01099a3:	55                   	push   %ebp
c01099a4:	89 e5                	mov    %esp,%ebp
c01099a6:	8b 45 08             	mov    0x8(%ebp),%eax
c01099a9:	8b 40 04             	mov    0x4(%eax),%eax
c01099ac:	8b 55 08             	mov    0x8(%ebp),%edx
c01099af:	83 c2 08             	add    $0x8,%edx
c01099b2:	39 d0                	cmp    %edx,%eax
c01099b4:	75 07                	jne    c01099bd <isListEmpty+0x1a>
c01099b6:	b8 01 00 00 00       	mov    $0x1,%eax
c01099bb:	eb 05                	jmp    c01099c2 <isListEmpty+0x1f>
c01099bd:	b8 00 00 00 00       	mov    $0x0,%eax
c01099c2:	5d                   	pop    %ebp
c01099c3:	c3                   	ret    

c01099c4 <findElementInList>:
c01099c4:	55                   	push   %ebp
c01099c5:	89 e5                	mov    %esp,%ebp
c01099c7:	83 ec 28             	sub    $0x28,%esp
c01099ca:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c01099ce:	75 19                	jne    c01099e9 <findElementInList+0x25>
c01099d0:	6a 60                	push   $0x60
c01099d2:	68 c5 ab 10 c0       	push   $0xc010abc5
c01099d7:	68 c5 ab 10 c0       	push   $0xc010abc5
c01099dc:	68 d8 ab 10 c0       	push   $0xc010abd8
c01099e1:	e8 49 ea ff ff       	call   c010842f <assertion_failure>
c01099e6:	83 c4 10             	add    $0x10,%esp
c01099e9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c01099ed:	75 19                	jne    c0109a08 <findElementInList+0x44>
c01099ef:	6a 61                	push   $0x61
c01099f1:	68 c5 ab 10 c0       	push   $0xc010abc5
c01099f6:	68 c5 ab 10 c0       	push   $0xc010abc5
c01099fb:	68 e4 ab 10 c0       	push   $0xc010abe4
c0109a00:	e8 2a ea ff ff       	call   c010842f <assertion_failure>
c0109a05:	83 c4 10             	add    $0x10,%esp
c0109a08:	e8 e5 cf ff ff       	call   c01069f2 <intr_disable>
c0109a0d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0109a10:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0109a17:	8b 45 08             	mov    0x8(%ebp),%eax
c0109a1a:	8b 40 08             	mov    0x8(%eax),%eax
c0109a1d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0109a20:	8b 45 08             	mov    0x8(%ebp),%eax
c0109a23:	8b 40 04             	mov    0x4(%eax),%eax
c0109a26:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109a29:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0109a2d:	75 07                	jne    c0109a36 <findElementInList+0x72>
c0109a2f:	b8 00 00 00 00       	mov    $0x0,%eax
c0109a34:	eb 68                	jmp    c0109a9e <findElementInList+0xda>
c0109a36:	8b 45 0c             	mov    0xc(%ebp),%eax
c0109a39:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0109a3c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0109a3f:	2b 45 f0             	sub    -0x10(%ebp),%eax
c0109a42:	c1 f8 03             	sar    $0x3,%eax
c0109a45:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0109a48:	eb 36                	jmp    c0109a80 <findElementInList+0xbc>
c0109a4a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0109a4d:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c0109a50:	75 07                	jne    c0109a59 <findElementInList+0x95>
c0109a52:	b8 01 00 00 00       	mov    $0x1,%eax
c0109a57:	eb 45                	jmp    c0109a9e <findElementInList+0xda>
c0109a59:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0109a5d:	75 07                	jne    c0109a66 <findElementInList+0xa2>
c0109a5f:	b8 00 00 00 00       	mov    $0x0,%eax
c0109a64:	eb 38                	jmp    c0109a9e <findElementInList+0xda>
c0109a66:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109a69:	8b 40 04             	mov    0x4(%eax),%eax
c0109a6c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109a6f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0109a73:	75 07                	jne    c0109a7c <findElementInList+0xb8>
c0109a75:	b8 00 00 00 00       	mov    $0x0,%eax
c0109a7a:	eb 22                	jmp    c0109a9e <findElementInList+0xda>
c0109a7c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0109a80:	8b 45 08             	mov    0x8(%ebp),%eax
c0109a83:	83 c0 08             	add    $0x8,%eax
c0109a86:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0109a89:	75 bf                	jne    c0109a4a <findElementInList+0x86>
c0109a8b:	83 ec 0c             	sub    $0xc,%esp
c0109a8e:	ff 75 ec             	pushl  -0x14(%ebp)
c0109a91:	e8 85 cf ff ff       	call   c0106a1b <intr_set_status>
c0109a96:	83 c4 10             	add    $0x10,%esp
c0109a99:	b8 00 00 00 00       	mov    $0x0,%eax
c0109a9e:	c9                   	leave  
c0109a9f:	c3                   	ret    

c0109aa0 <appendToDoubleLinkList>:
c0109aa0:	55                   	push   %ebp
c0109aa1:	89 e5                	mov    %esp,%ebp
c0109aa3:	83 ec 18             	sub    $0x18,%esp
c0109aa6:	83 ec 08             	sub    $0x8,%esp
c0109aa9:	ff 75 0c             	pushl  0xc(%ebp)
c0109aac:	ff 75 08             	pushl  0x8(%ebp)
c0109aaf:	e8 10 ff ff ff       	call   c01099c4 <findElementInList>
c0109ab4:	83 c4 10             	add    $0x10,%esp
c0109ab7:	3c 01                	cmp    $0x1,%al
c0109ab9:	0f 84 c2 00 00 00    	je     c0109b81 <appendToDoubleLinkList+0xe1>
c0109abf:	e8 2e cf ff ff       	call   c01069f2 <intr_disable>
c0109ac4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109ac7:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0109acb:	75 1c                	jne    c0109ae9 <appendToDoubleLinkList+0x49>
c0109acd:	68 9e 00 00 00       	push   $0x9e
c0109ad2:	68 c5 ab 10 c0       	push   $0xc010abc5
c0109ad7:	68 c5 ab 10 c0       	push   $0xc010abc5
c0109adc:	68 d8 ab 10 c0       	push   $0xc010abd8
c0109ae1:	e8 49 e9 ff ff       	call   c010842f <assertion_failure>
c0109ae6:	83 c4 10             	add    $0x10,%esp
c0109ae9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0109aed:	75 1c                	jne    c0109b0b <appendToDoubleLinkList+0x6b>
c0109aef:	68 9f 00 00 00       	push   $0x9f
c0109af4:	68 c5 ab 10 c0       	push   $0xc010abc5
c0109af9:	68 c5 ab 10 c0       	push   $0xc010abc5
c0109afe:	68 e4 ab 10 c0       	push   $0xc010abe4
c0109b03:	e8 27 e9 ff ff       	call   c010842f <assertion_failure>
c0109b08:	83 c4 10             	add    $0x10,%esp
c0109b0b:	83 ec 08             	sub    $0x8,%esp
c0109b0e:	ff 75 0c             	pushl  0xc(%ebp)
c0109b11:	ff 75 08             	pushl  0x8(%ebp)
c0109b14:	e8 ab fe ff ff       	call   c01099c4 <findElementInList>
c0109b19:	83 c4 10             	add    $0x10,%esp
c0109b1c:	3c 01                	cmp    $0x1,%al
c0109b1e:	74 64                	je     c0109b84 <appendToDoubleLinkList+0xe4>
c0109b20:	8b 45 0c             	mov    0xc(%ebp),%eax
c0109b23:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109b26:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109b29:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0109b30:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109b33:	8b 50 04             	mov    0x4(%eax),%edx
c0109b36:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109b39:	89 10                	mov    %edx,(%eax)
c0109b3b:	8b 45 08             	mov    0x8(%ebp),%eax
c0109b3e:	8b 50 08             	mov    0x8(%eax),%edx
c0109b41:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109b44:	89 10                	mov    %edx,(%eax)
c0109b46:	8b 45 08             	mov    0x8(%ebp),%eax
c0109b49:	8b 40 08             	mov    0x8(%eax),%eax
c0109b4c:	85 c0                	test   %eax,%eax
c0109b4e:	74 0c                	je     c0109b5c <appendToDoubleLinkList+0xbc>
c0109b50:	8b 45 08             	mov    0x8(%ebp),%eax
c0109b53:	8b 40 08             	mov    0x8(%eax),%eax
c0109b56:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0109b59:	89 50 04             	mov    %edx,0x4(%eax)
c0109b5c:	8b 45 08             	mov    0x8(%ebp),%eax
c0109b5f:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0109b62:	89 50 08             	mov    %edx,0x8(%eax)
c0109b65:	8b 45 08             	mov    0x8(%ebp),%eax
c0109b68:	8d 50 08             	lea    0x8(%eax),%edx
c0109b6b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109b6e:	89 50 04             	mov    %edx,0x4(%eax)
c0109b71:	83 ec 0c             	sub    $0xc,%esp
c0109b74:	ff 75 f4             	pushl  -0xc(%ebp)
c0109b77:	e8 9f ce ff ff       	call   c0106a1b <intr_set_status>
c0109b7c:	83 c4 10             	add    $0x10,%esp
c0109b7f:	eb 04                	jmp    c0109b85 <appendToDoubleLinkList+0xe5>
c0109b81:	90                   	nop
c0109b82:	eb 01                	jmp    c0109b85 <appendToDoubleLinkList+0xe5>
c0109b84:	90                   	nop
c0109b85:	c9                   	leave  
c0109b86:	c3                   	ret    

c0109b87 <insertToDoubleLinkList>:
c0109b87:	55                   	push   %ebp
c0109b88:	89 e5                	mov    %esp,%ebp
c0109b8a:	83 ec 18             	sub    $0x18,%esp
c0109b8d:	83 ec 08             	sub    $0x8,%esp
c0109b90:	ff 75 0c             	pushl  0xc(%ebp)
c0109b93:	ff 75 08             	pushl  0x8(%ebp)
c0109b96:	e8 29 fe ff ff       	call   c01099c4 <findElementInList>
c0109b9b:	83 c4 10             	add    $0x10,%esp
c0109b9e:	3c 01                	cmp    $0x1,%al
c0109ba0:	74 65                	je     c0109c07 <insertToDoubleLinkList+0x80>
c0109ba2:	e8 4b ce ff ff       	call   c01069f2 <intr_disable>
c0109ba7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109baa:	8b 45 0c             	mov    0xc(%ebp),%eax
c0109bad:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109bb0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109bb3:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0109bba:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109bbd:	8b 50 04             	mov    0x4(%eax),%edx
c0109bc0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109bc3:	89 10                	mov    %edx,(%eax)
c0109bc5:	8b 45 08             	mov    0x8(%ebp),%eax
c0109bc8:	8b 50 04             	mov    0x4(%eax),%edx
c0109bcb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109bce:	89 50 04             	mov    %edx,0x4(%eax)
c0109bd1:	8b 45 08             	mov    0x8(%ebp),%eax
c0109bd4:	8b 40 04             	mov    0x4(%eax),%eax
c0109bd7:	85 c0                	test   %eax,%eax
c0109bd9:	74 0b                	je     c0109be6 <insertToDoubleLinkList+0x5f>
c0109bdb:	8b 45 08             	mov    0x8(%ebp),%eax
c0109bde:	8b 40 04             	mov    0x4(%eax),%eax
c0109be1:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0109be4:	89 10                	mov    %edx,(%eax)
c0109be6:	8b 45 08             	mov    0x8(%ebp),%eax
c0109be9:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0109bec:	89 50 04             	mov    %edx,0x4(%eax)
c0109bef:	8b 55 08             	mov    0x8(%ebp),%edx
c0109bf2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109bf5:	89 10                	mov    %edx,(%eax)
c0109bf7:	83 ec 0c             	sub    $0xc,%esp
c0109bfa:	ff 75 f4             	pushl  -0xc(%ebp)
c0109bfd:	e8 19 ce ff ff       	call   c0106a1b <intr_set_status>
c0109c02:	83 c4 10             	add    $0x10,%esp
c0109c05:	eb 01                	jmp    c0109c08 <insertToDoubleLinkList+0x81>
c0109c07:	90                   	nop
c0109c08:	c9                   	leave  
c0109c09:	c3                   	ret    

c0109c0a <popFromDoubleLinkList>:
c0109c0a:	55                   	push   %ebp
c0109c0b:	89 e5                	mov    %esp,%ebp
c0109c0d:	83 ec 18             	sub    $0x18,%esp
c0109c10:	e8 dd cd ff ff       	call   c01069f2 <intr_disable>
c0109c15:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109c18:	83 ec 0c             	sub    $0xc,%esp
c0109c1b:	ff 75 08             	pushl  0x8(%ebp)
c0109c1e:	e8 80 fd ff ff       	call   c01099a3 <isListEmpty>
c0109c23:	83 c4 10             	add    $0x10,%esp
c0109c26:	3c 01                	cmp    $0x1,%al
c0109c28:	75 07                	jne    c0109c31 <popFromDoubleLinkList+0x27>
c0109c2a:	b8 00 00 00 00       	mov    $0x0,%eax
c0109c2f:	eb 6b                	jmp    c0109c9c <popFromDoubleLinkList+0x92>
c0109c31:	8b 45 08             	mov    0x8(%ebp),%eax
c0109c34:	8b 40 08             	mov    0x8(%eax),%eax
c0109c37:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109c3a:	8b 45 08             	mov    0x8(%ebp),%eax
c0109c3d:	8b 40 08             	mov    0x8(%eax),%eax
c0109c40:	85 c0                	test   %eax,%eax
c0109c42:	75 07                	jne    c0109c4b <popFromDoubleLinkList+0x41>
c0109c44:	b8 00 00 00 00       	mov    $0x0,%eax
c0109c49:	eb 51                	jmp    c0109c9c <popFromDoubleLinkList+0x92>
c0109c4b:	8b 45 08             	mov    0x8(%ebp),%eax
c0109c4e:	8b 40 08             	mov    0x8(%eax),%eax
c0109c51:	8b 00                	mov    (%eax),%eax
c0109c53:	85 c0                	test   %eax,%eax
c0109c55:	74 11                	je     c0109c68 <popFromDoubleLinkList+0x5e>
c0109c57:	8b 45 08             	mov    0x8(%ebp),%eax
c0109c5a:	8b 40 08             	mov    0x8(%eax),%eax
c0109c5d:	8b 00                	mov    (%eax),%eax
c0109c5f:	8b 55 08             	mov    0x8(%ebp),%edx
c0109c62:	83 c2 08             	add    $0x8,%edx
c0109c65:	89 50 04             	mov    %edx,0x4(%eax)
c0109c68:	8b 45 08             	mov    0x8(%ebp),%eax
c0109c6b:	8b 40 08             	mov    0x8(%eax),%eax
c0109c6e:	8b 10                	mov    (%eax),%edx
c0109c70:	8b 45 08             	mov    0x8(%ebp),%eax
c0109c73:	89 50 08             	mov    %edx,0x8(%eax)
c0109c76:	83 ec 0c             	sub    $0xc,%esp
c0109c79:	ff 75 f4             	pushl  -0xc(%ebp)
c0109c7c:	e8 9a cd ff ff       	call   c0106a1b <intr_set_status>
c0109c81:	83 c4 10             	add    $0x10,%esp
c0109c84:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109c87:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0109c8e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109c91:	8b 50 04             	mov    0x4(%eax),%edx
c0109c94:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109c97:	89 10                	mov    %edx,(%eax)
c0109c99:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109c9c:	c9                   	leave  
c0109c9d:	c3                   	ret    

c0109c9e <kernel_thread>:
c0109c9e:	55                   	push   %ebp
c0109c9f:	89 e5                	mov    %esp,%ebp
c0109ca1:	83 ec 08             	sub    $0x8,%esp
c0109ca4:	fb                   	sti    
c0109ca5:	83 ec 0c             	sub    $0xc,%esp
c0109ca8:	ff 75 0c             	pushl  0xc(%ebp)
c0109cab:	8b 45 08             	mov    0x8(%ebp),%eax
c0109cae:	ff d0                	call   *%eax
c0109cb0:	83 c4 10             	add    $0x10,%esp
c0109cb3:	90                   	nop
c0109cb4:	c9                   	leave  
c0109cb5:	c3                   	ret    

c0109cb6 <thread_init>:
c0109cb6:	55                   	push   %ebp
c0109cb7:	89 e5                	mov    %esp,%ebp
c0109cb9:	83 ec 18             	sub    $0x18,%esp
c0109cbc:	83 ec 08             	sub    $0x8,%esp
c0109cbf:	6a 00                	push   $0x0
c0109cc1:	6a 01                	push   $0x1
c0109cc3:	e8 a7 c2 ff ff       	call   c0105f6f <alloc_memory>
c0109cc8:	83 c4 10             	add    $0x10,%esp
c0109ccb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109cce:	83 ec 04             	sub    $0x4,%esp
c0109cd1:	68 00 10 00 00       	push   $0x1000
c0109cd6:	6a 00                	push   $0x0
c0109cd8:	ff 75 f4             	pushl  -0xc(%ebp)
c0109cdb:	e8 3f 0f 00 00       	call   c010ac1f <Memset>
c0109ce0:	83 c4 10             	add    $0x10,%esp
c0109ce3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109ce6:	05 00 10 00 00       	add    $0x1000,%eax
c0109ceb:	89 c2                	mov    %eax,%edx
c0109ced:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109cf0:	89 10                	mov    %edx,(%eax)
c0109cf2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109cf5:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0109cfc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109cff:	c7 80 64 02 00 00 ff 	movl   $0xffffffff,0x264(%eax)
c0109d06:	ff ff ff 
c0109d09:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109d0c:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c0109d13:	00 00 00 
c0109d16:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109d19:	8b 90 5c 02 00 00    	mov    0x25c(%eax),%edx
c0109d1f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109d22:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c0109d28:	a1 90 f7 10 c0       	mov    0xc010f790,%eax
c0109d2d:	83 c0 01             	add    $0x1,%eax
c0109d30:	a3 90 f7 10 c0       	mov    %eax,0xc010f790
c0109d35:	8b 15 90 f7 10 c0    	mov    0xc010f790,%edx
c0109d3b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109d3e:	89 90 24 01 00 00    	mov    %edx,0x124(%eax)
c0109d44:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109d47:	c7 80 28 01 00 00 0f 	movl   $0xf,0x128(%eax)
c0109d4e:	00 00 00 
c0109d51:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109d54:	c7 80 b0 02 00 00 e0 	movl   $0x99abcde0,0x2b0(%eax)
c0109d5b:	cd ab 99 
c0109d5e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109d61:	c9                   	leave  
c0109d62:	c3                   	ret    

c0109d63 <thread_create>:
c0109d63:	55                   	push   %ebp
c0109d64:	89 e5                	mov    %esp,%ebp
c0109d66:	83 ec 10             	sub    $0x10,%esp
c0109d69:	c7 45 fc 44 00 00 00 	movl   $0x44,-0x4(%ebp)
c0109d70:	c7 45 f8 2c 00 00 00 	movl   $0x2c,-0x8(%ebp)
c0109d77:	8b 45 08             	mov    0x8(%ebp),%eax
c0109d7a:	8b 00                	mov    (%eax),%eax
c0109d7c:	2b 45 fc             	sub    -0x4(%ebp),%eax
c0109d7f:	89 c2                	mov    %eax,%edx
c0109d81:	8b 45 08             	mov    0x8(%ebp),%eax
c0109d84:	89 10                	mov    %edx,(%eax)
c0109d86:	8b 45 08             	mov    0x8(%ebp),%eax
c0109d89:	8b 00                	mov    (%eax),%eax
c0109d8b:	2b 45 f8             	sub    -0x8(%ebp),%eax
c0109d8e:	89 c2                	mov    %eax,%edx
c0109d90:	8b 45 08             	mov    0x8(%ebp),%eax
c0109d93:	89 10                	mov    %edx,(%eax)
c0109d95:	90                   	nop
c0109d96:	c9                   	leave  
c0109d97:	c3                   	ret    

c0109d98 <thread_start>:
c0109d98:	55                   	push   %ebp
c0109d99:	89 e5                	mov    %esp,%ebp
c0109d9b:	83 ec 18             	sub    $0x18,%esp
c0109d9e:	e8 13 ff ff ff       	call   c0109cb6 <thread_init>
c0109da3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0109da6:	83 ec 0c             	sub    $0xc,%esp
c0109da9:	ff 75 f4             	pushl  -0xc(%ebp)
c0109dac:	e8 b2 ff ff ff       	call   c0109d63 <thread_create>
c0109db1:	83 c4 10             	add    $0x10,%esp
c0109db4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109db7:	05 34 01 00 00       	add    $0x134,%eax
c0109dbc:	83 ec 08             	sub    $0x8,%esp
c0109dbf:	ff 75 10             	pushl  0x10(%ebp)
c0109dc2:	50                   	push   %eax
c0109dc3:	e8 76 0e 00 00       	call   c010ac3e <Strcpy>
c0109dc8:	83 c4 10             	add    $0x10,%esp
c0109dcb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109dce:	8b 00                	mov    (%eax),%eax
c0109dd0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0109dd3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109dd6:	c7 40 10 9e 9c 10 c0 	movl   $0xc0109c9e,0x10(%eax)
c0109ddd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109de0:	8b 55 08             	mov    0x8(%ebp),%edx
c0109de3:	89 50 18             	mov    %edx,0x18(%eax)
c0109de6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109de9:	8b 55 0c             	mov    0xc(%ebp),%edx
c0109dec:	89 50 1c             	mov    %edx,0x1c(%eax)
c0109def:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109df2:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0109df8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109dfb:	8b 10                	mov    (%eax),%edx
c0109dfd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109e00:	89 50 04             	mov    %edx,0x4(%eax)
c0109e03:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109e06:	8b 50 04             	mov    0x4(%eax),%edx
c0109e09:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109e0c:	89 50 08             	mov    %edx,0x8(%eax)
c0109e0f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109e12:	8b 50 08             	mov    0x8(%eax),%edx
c0109e15:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0109e18:	89 50 0c             	mov    %edx,0xc(%eax)
c0109e1b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109e1e:	05 00 01 00 00       	add    $0x100,%eax
c0109e23:	83 ec 08             	sub    $0x8,%esp
c0109e26:	50                   	push   %eax
c0109e27:	68 ec fd 10 c0       	push   $0xc010fdec
c0109e2c:	e8 6f fc ff ff       	call   c0109aa0 <appendToDoubleLinkList>
c0109e31:	83 c4 10             	add    $0x10,%esp
c0109e34:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0109e37:	05 08 01 00 00       	add    $0x108,%eax
c0109e3c:	83 ec 08             	sub    $0x8,%esp
c0109e3f:	50                   	push   %eax
c0109e40:	68 04 0f 11 c0       	push   $0xc0110f04
c0109e45:	e8 56 fc ff ff       	call   c0109aa0 <appendToDoubleLinkList>
c0109e4a:	83 c4 10             	add    $0x10,%esp
c0109e4d:	90                   	nop
c0109e4e:	c9                   	leave  
c0109e4f:	c3                   	ret    
