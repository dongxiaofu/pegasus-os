
kernel.bin:     file format elf32-i386


Disassembly of section .text:

c0001000 <_start>:
c0001000:	c7 05 a4 07 01 c0 00 	movl   $0x0,0xc00107a4
c0001007:	00 00 00 
c000100a:	b4 0b                	mov    $0xb,%ah
c000100c:	b0 4c                	mov    $0x4c,%al
c000100e:	65 66 a3 d0 0c 00 00 	mov    %ax,%gs:0xcd0
c0001015:	66 c7 05 a4 07 01 c0 	movw   $0x0,0xc00107a4
c000101c:	00 00 
c000101e:	0f 01 05 c8 16 01 c0 	sgdtl  0xc00116c8
c0001025:	e8 90 39 00 00       	call   c00049ba <ReloadGDT>
c000102a:	0f 01 15 c8 16 01 c0 	lgdtl  0xc00116c8
c0001031:	0f 01 1d 88 07 01 c0 	lidtl  0xc0010788
c0001038:	0f a8                	push   %gs
c000103a:	0f a9                	pop    %gs
c000103c:	ea 43 10 00 c0 08 00 	ljmp   $0x8,$0xc0001043

c0001043 <csinit>:
c0001043:	31 c0                	xor    %eax,%eax
c0001045:	66 b8 40 00          	mov    $0x40,%ax
c0001049:	0f 00 d8             	ltr    %ax
c000104c:	31 c0                	xor    %eax,%eax
c000104e:	e9 52 03 00 00       	jmp    c00013a5 <kernel_main>
c0001053:	f4                   	hlt    
c0001054:	eb fe                	jmp    c0001054 <csinit+0x11>
c0001056:	fb                   	sti    
c0001057:	b4 0b                	mov    $0xb,%ah
c0001059:	b0 4d                	mov    $0x4d,%al
c000105b:	65 66 a3 d2 0c 00 00 	mov    %ax,%gs:0xcd2
c0001062:	eb fe                	jmp    c0001062 <csinit+0x1f>
c0001064:	f4                   	hlt    
c0001065:	6a 00                	push   $0x0
c0001067:	9d                   	popf   
c0001068:	eb fe                	jmp    c0001068 <csinit+0x25>
c000106a:	6a 01                	push   $0x1
c000106c:	6a 02                	push   $0x2
c000106e:	6a 03                	push   $0x3
c0001070:	f4                   	hlt    
c0001071:	66 90                	xchg   %ax,%ax
c0001073:	66 90                	xchg   %ax,%ax
c0001075:	66 90                	xchg   %ax,%ax
c0001077:	66 90                	xchg   %ax,%ax
c0001079:	66 90                	xchg   %ax,%ax
c000107b:	66 90                	xchg   %ax,%ax
c000107d:	66 90                	xchg   %ax,%ax
c000107f:	90                   	nop

c0001080 <InterruptTest>:
c0001080:	b4 0d                	mov    $0xd,%ah
c0001082:	b0 54                	mov    $0x54,%al
c0001084:	65 66 a3 d4 0c 00 00 	mov    %ax,%gs:0xcd4
c000108b:	c3                   	ret    

c000108c <disp_str>:
c000108c:	55                   	push   %ebp
c000108d:	89 e5                	mov    %esp,%ebp
c000108f:	b4 0d                	mov    $0xd,%ah
c0001091:	8b 75 08             	mov    0x8(%ebp),%esi
c0001094:	8b 3d a4 07 01 c0    	mov    0xc00107a4,%edi

c000109a <disp_str.1>:
c000109a:	ac                   	lods   %ds:(%esi),%al
c000109b:	84 c0                	test   %al,%al
c000109d:	74 1e                	je     c00010bd <disp_str.4>
c000109f:	3c 0a                	cmp    $0xa,%al
c00010a1:	75 11                	jne    c00010b4 <disp_str.3>
c00010a3:	50                   	push   %eax
c00010a4:	89 f8                	mov    %edi,%eax
c00010a6:	b3 a0                	mov    $0xa0,%bl
c00010a8:	f6 f3                	div    %bl
c00010aa:	40                   	inc    %eax
c00010ab:	b3 a0                	mov    $0xa0,%bl
c00010ad:	f6 e3                	mul    %bl
c00010af:	89 c7                	mov    %eax,%edi
c00010b1:	58                   	pop    %eax
c00010b2:	eb e6                	jmp    c000109a <disp_str.1>

c00010b4 <disp_str.3>:
c00010b4:	65 66 89 07          	mov    %ax,%gs:(%edi)
c00010b8:	83 c7 02             	add    $0x2,%edi
c00010bb:	eb dd                	jmp    c000109a <disp_str.1>

c00010bd <disp_str.4>:
c00010bd:	89 3d a4 07 01 c0    	mov    %edi,0xc00107a4
c00010c3:	89 ec                	mov    %ebp,%esp
c00010c5:	5d                   	pop    %ebp
c00010c6:	c3                   	ret    

c00010c7 <disp_str_colour>:
c00010c7:	55                   	push   %ebp
c00010c8:	89 e5                	mov    %esp,%ebp
c00010ca:	8b 75 08             	mov    0x8(%ebp),%esi
c00010cd:	8a 65 0c             	mov    0xc(%ebp),%ah
c00010d0:	8b 3d a4 07 01 c0    	mov    0xc00107a4,%edi

c00010d6 <disp_str_colour.1>:
c00010d6:	ac                   	lods   %ds:(%esi),%al
c00010d7:	84 c0                	test   %al,%al
c00010d9:	74 1e                	je     c00010f9 <disp_str_colour.4>
c00010db:	3c 0a                	cmp    $0xa,%al
c00010dd:	75 11                	jne    c00010f0 <disp_str_colour.3>
c00010df:	50                   	push   %eax
c00010e0:	89 f8                	mov    %edi,%eax
c00010e2:	b3 a0                	mov    $0xa0,%bl
c00010e4:	f6 f3                	div    %bl
c00010e6:	40                   	inc    %eax
c00010e7:	b3 a0                	mov    $0xa0,%bl
c00010e9:	f6 e3                	mul    %bl
c00010eb:	89 c7                	mov    %eax,%edi
c00010ed:	58                   	pop    %eax
c00010ee:	eb e6                	jmp    c00010d6 <disp_str_colour.1>

c00010f0 <disp_str_colour.3>:
c00010f0:	65 66 89 07          	mov    %ax,%gs:(%edi)
c00010f4:	83 c7 02             	add    $0x2,%edi
c00010f7:	eb dd                	jmp    c00010d6 <disp_str_colour.1>

c00010f9 <disp_str_colour.4>:
c00010f9:	89 3d a4 07 01 c0    	mov    %edi,0xc00107a4
c00010ff:	89 ec                	mov    %ebp,%esp
c0001101:	5d                   	pop    %ebp
c0001102:	c3                   	ret    

c0001103 <divide_zero_fault>:
c0001103:	6a ff                	push   $0xffffffff
c0001105:	6a 00                	push   $0x0
c0001107:	eb 5f                	jmp    c0001168 <exception>

c0001109 <single_step_fault>:
c0001109:	6a ff                	push   $0xffffffff
c000110b:	6a 01                	push   $0x1
c000110d:	eb 59                	jmp    c0001168 <exception>

c000110f <non_maskable_interrupt>:
c000110f:	6a ff                	push   $0xffffffff
c0001111:	6a 02                	push   $0x2
c0001113:	eb 53                	jmp    c0001168 <exception>

c0001115 <breakpoint_trap>:
c0001115:	6a ff                	push   $0xffffffff
c0001117:	6a 03                	push   $0x3
c0001119:	eb 4d                	jmp    c0001168 <exception>

c000111b <overflow_trap>:
c000111b:	6a ff                	push   $0xffffffff
c000111d:	6a 04                	push   $0x4
c000111f:	eb 47                	jmp    c0001168 <exception>

c0001121 <bound_range_exceeded_fault>:
c0001121:	6a ff                	push   $0xffffffff
c0001123:	6a 05                	push   $0x5
c0001125:	eb 41                	jmp    c0001168 <exception>

c0001127 <invalid_opcode_fault>:
c0001127:	6a ff                	push   $0xffffffff
c0001129:	6a 06                	push   $0x6
c000112b:	eb 3b                	jmp    c0001168 <exception>

c000112d <coprocessor_not_available_fault>:
c000112d:	6a ff                	push   $0xffffffff
c000112f:	6a 07                	push   $0x7
c0001131:	eb 35                	jmp    c0001168 <exception>

c0001133 <double_fault_exception_abort>:
c0001133:	6a 08                	push   $0x8
c0001135:	eb 31                	jmp    c0001168 <exception>

c0001137 <coprocessor_segment_overrun>:
c0001137:	6a ff                	push   $0xffffffff
c0001139:	6a 09                	push   $0x9
c000113b:	eb 2b                	jmp    c0001168 <exception>

c000113d <invalid_task_state_segment_fault>:
c000113d:	6a 0a                	push   $0xa
c000113f:	eb 27                	jmp    c0001168 <exception>

c0001141 <segment_not_present_fault>:
c0001141:	6a 0b                	push   $0xb
c0001143:	eb 23                	jmp    c0001168 <exception>

c0001145 <stack_exception_fault>:
c0001145:	6a 0c                	push   $0xc
c0001147:	eb 1f                	jmp    c0001168 <exception>

c0001149 <general_protection_exception_fault>:
c0001149:	6a 0d                	push   $0xd
c000114b:	e8 6d 6e 00 00       	call   c0007fbd <exception_handler>
c0001150:	83 c4 08             	add    $0x8,%esp
c0001153:	cf                   	iret   

c0001154 <page_fault>:
c0001154:	6a 0e                	push   $0xe
c0001156:	eb 10                	jmp    c0001168 <exception>

c0001158 <coprocessor_error_fault>:
c0001158:	6a ff                	push   $0xffffffff
c000115a:	6a 10                	push   $0x10
c000115c:	eb 0a                	jmp    c0001168 <exception>

c000115e <align_check_fault>:
c000115e:	6a 11                	push   $0x11
c0001160:	eb 06                	jmp    c0001168 <exception>

c0001162 <simd_float_exception_fault>:
c0001162:	6a ff                	push   $0xffffffff
c0001164:	6a 12                	push   $0x12
c0001166:	eb 00                	jmp    c0001168 <exception>

c0001168 <exception>:
c0001168:	e8 50 6e 00 00       	call   c0007fbd <exception_handler>
c000116d:	83 c4 08             	add    $0x8,%esp
c0001170:	f4                   	hlt    

c0001171 <hwint0>:
c0001171:	60                   	pusha  
c0001172:	1e                   	push   %ds
c0001173:	06                   	push   %es
c0001174:	0f a0                	push   %fs
c0001176:	0f a8                	push   %gs
c0001178:	66 8c d2             	mov    %ss,%dx
c000117b:	8e da                	mov    %edx,%ds
c000117d:	8e c2                	mov    %edx,%es
c000117f:	8e e2                	mov    %edx,%fs
c0001181:	b0 20                	mov    $0x20,%al
c0001183:	e6 20                	out    %al,$0x20
c0001185:	ff 05 a8 07 01 c0    	incl   0xc00107a8
c000118b:	83 3d a8 07 01 c0 00 	cmpl   $0x0,0xc00107a8
c0001192:	75 00                	jne    c0001194 <hwint0.1>

c0001194 <hwint0.1>:
c0001194:	e8 34 34 00 00       	call   c00045cd <clock_handler>
c0001199:	e9 e1 00 00 00       	jmp    c000127f <reenter_restore>

c000119e <hwint1>:
c000119e:	60                   	pusha  
c000119f:	1e                   	push   %ds
c00011a0:	06                   	push   %es
c00011a1:	0f a0                	push   %fs
c00011a3:	0f a8                	push   %gs
c00011a5:	66 8c d2             	mov    %ss,%dx
c00011a8:	8e da                	mov    %edx,%ds
c00011aa:	8e c2                	mov    %edx,%es
c00011ac:	8e e2                	mov    %edx,%fs
c00011ae:	b0 fa                	mov    $0xfa,%al
c00011b0:	e6 21                	out    %al,$0x21
c00011b2:	b0 20                	mov    $0x20,%al
c00011b4:	e6 20                	out    %al,$0x20
c00011b6:	ff 05 a8 07 01 c0    	incl   0xc00107a8
c00011bc:	83 3d a8 07 01 c0 00 	cmpl   $0x0,0xc00107a8
c00011c3:	75 00                	jne    c00011c5 <hwint1.1>

c00011c5 <hwint1.1>:
c00011c5:	e8 45 43 00 00       	call   c000550f <keyboard_handler>
c00011ca:	b0 f8                	mov    $0xf8,%al
c00011cc:	e6 21                	out    %al,$0x21
c00011ce:	83 3d a8 07 01 c0 00 	cmpl   $0x0,0xc00107a8
c00011d5:	0f 85 a4 00 00 00    	jne    c000127f <reenter_restore>
c00011db:	e9 9f 00 00 00       	jmp    c000127f <reenter_restore>

c00011e0 <hwint14>:
c00011e0:	60                   	pusha  
c00011e1:	1e                   	push   %ds
c00011e2:	06                   	push   %es
c00011e3:	0f a0                	push   %fs
c00011e5:	0f a8                	push   %gs
c00011e7:	66 8c d2             	mov    %ss,%dx
c00011ea:	8e da                	mov    %edx,%ds
c00011ec:	8e c2                	mov    %edx,%es
c00011ee:	8e e2                	mov    %edx,%fs
c00011f0:	b0 ff                	mov    $0xff,%al
c00011f2:	e6 a1                	out    %al,$0xa1
c00011f4:	b0 20                	mov    $0x20,%al
c00011f6:	e6 20                	out    %al,$0x20
c00011f8:	90                   	nop
c00011f9:	e6 a0                	out    %al,$0xa0
c00011fb:	ff 05 a8 07 01 c0    	incl   0xc00107a8
c0001201:	83 3d a8 07 01 c0 00 	cmpl   $0x0,0xc00107a8
c0001208:	75 00                	jne    c000120a <hwint14.1>

c000120a <hwint14.1>:
c000120a:	e8 8c 10 00 00       	call   c000229b <hd_handler>
c000120f:	b0 bf                	mov    $0xbf,%al
c0001211:	e6 a1                	out    %al,$0xa1
c0001213:	83 3d a8 07 01 c0 00 	cmpl   $0x0,0xc00107a8
c000121a:	75 63                	jne    c000127f <reenter_restore>
c000121c:	eb 61                	jmp    c000127f <reenter_restore>

c000121e <sys_call>:
c000121e:	60                   	pusha  
c000121f:	1e                   	push   %ds
c0001220:	06                   	push   %es
c0001221:	0f a0                	push   %fs
c0001223:	0f a8                	push   %gs
c0001225:	89 e6                	mov    %esp,%esi
c0001227:	89 e5                	mov    %esp,%ebp
c0001229:	66 8c d2             	mov    %ss,%dx
c000122c:	8e da                	mov    %edx,%ds
c000122e:	8e c2                	mov    %edx,%es
c0001230:	8e e2                	mov    %edx,%fs
c0001232:	ff 05 a8 07 01 c0    	incl   0xc00107a8
c0001238:	83 3d a8 07 01 c0 00 	cmpl   $0x0,0xc00107a8
c000123f:	75 00                	jne    c0001241 <sys_call.1>

c0001241 <sys_call.1>:
c0001241:	56                   	push   %esi
c0001242:	ff 35 c0 0b 01 c0    	pushl  0xc0010bc0
c0001248:	53                   	push   %ebx
c0001249:	51                   	push   %ecx
c000124a:	ff 14 85 2c f1 00 c0 	call   *-0x3fff0ed4(,%eax,4)
c0001251:	83 c4 0c             	add    $0xc,%esp
c0001254:	5e                   	pop    %esi
c0001255:	89 45 2c             	mov    %eax,0x2c(%ebp)
c0001258:	83 3d a8 07 01 c0 00 	cmpl   $0x0,0xc00107a8
c000125f:	75 1e                	jne    c000127f <reenter_restore>
c0001261:	eb 1c                	jmp    c000127f <reenter_restore>

c0001263 <fork_restart>:
c0001263:	fa                   	cli    
c0001264:	0f a9                	pop    %gs
c0001266:	0f a1                	pop    %fs
c0001268:	07                   	pop    %es
c0001269:	1f                   	pop    %ds
c000126a:	61                   	popa   
c000126b:	cf                   	iret   

c000126c <restart>:
c000126c:	ff 0d a8 07 01 c0    	decl   0xc00107a8
c0001272:	89 e5                	mov    %esp,%ebp
c0001274:	8b 65 04             	mov    0x4(%ebp),%esp
c0001277:	0f a9                	pop    %gs
c0001279:	0f a1                	pop    %fs
c000127b:	07                   	pop    %es
c000127c:	1f                   	pop    %ds
c000127d:	61                   	popa   
c000127e:	cf                   	iret   

c000127f <reenter_restore>:
c000127f:	ff 0d a8 07 01 c0    	decl   0xc00107a8
c0001285:	0f a9                	pop    %gs
c0001287:	0f a1                	pop    %fs
c0001289:	07                   	pop    %es
c000128a:	1f                   	pop    %ds
c000128b:	61                   	popa   
c000128c:	cf                   	iret   

c000128d <in_byte>:
c000128d:	31 d2                	xor    %edx,%edx
c000128f:	8b 54 24 04          	mov    0x4(%esp),%edx
c0001293:	31 c0                	xor    %eax,%eax
c0001295:	ec                   	in     (%dx),%al
c0001296:	90                   	nop
c0001297:	90                   	nop
c0001298:	c3                   	ret    

c0001299 <out_byte>:
c0001299:	31 d2                	xor    %edx,%edx
c000129b:	31 c0                	xor    %eax,%eax
c000129d:	8b 54 24 04          	mov    0x4(%esp),%edx
c00012a1:	8a 44 24 08          	mov    0x8(%esp),%al
c00012a5:	ee                   	out    %al,(%dx)
c00012a6:	90                   	nop
c00012a7:	90                   	nop
c00012a8:	c3                   	ret    

c00012a9 <in_byte2>:
c00012a9:	55                   	push   %ebp
c00012aa:	89 e5                	mov    %esp,%ebp
c00012ac:	52                   	push   %edx
c00012ad:	31 d2                	xor    %edx,%edx
c00012af:	66 8b 55 08          	mov    0x8(%ebp),%dx
c00012b3:	31 c0                	xor    %eax,%eax
c00012b5:	ec                   	in     (%dx),%al
c00012b6:	90                   	nop
c00012b7:	90                   	nop
c00012b8:	5b                   	pop    %ebx
c00012b9:	5d                   	pop    %ebp
c00012ba:	c3                   	ret    

c00012bb <disable_int>:
c00012bb:	fa                   	cli    
c00012bc:	c3                   	ret    

c00012bd <enable_int>:
c00012bd:	fb                   	sti    
c00012be:	c3                   	ret    

c00012bf <check_tss_esp0>:
c00012bf:	55                   	push   %ebp
c00012c0:	89 e5                	mov    %esp,%ebp
c00012c2:	8b 45 08             	mov    0x8(%ebp),%eax
c00012c5:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c00012c8:	83 c0 44             	add    $0x44,%eax
c00012cb:	8b 15 44 16 01 c0    	mov    0xc0011644,%edx
c00012d1:	39 d0                	cmp    %edx,%eax
c00012d3:	74 7c                	je     c0001351 <check_tss_esp0.2>

c00012d5 <check_tss_esp0.1>:
c00012d5:	50                   	push   %eax
c00012d6:	52                   	push   %edx
c00012d7:	68 10 f0 00 c0       	push   $0xc000f010
c00012dc:	e8 ab fd ff ff       	call   c000108c <disp_str>
c00012e1:	83 c4 04             	add    $0x4,%esp
c00012e4:	5a                   	pop    %edx
c00012e5:	58                   	pop    %eax
c00012e6:	52                   	push   %edx
c00012e7:	50                   	push   %eax
c00012e8:	53                   	push   %ebx
c00012e9:	e8 69 6b 00 00       	call   c0007e57 <disp_int>
c00012ee:	83 c4 04             	add    $0x4,%esp
c00012f1:	58                   	pop    %eax
c00012f2:	5a                   	pop    %edx
c00012f3:	52                   	push   %edx
c00012f4:	50                   	push   %eax
c00012f5:	e8 5d 6b 00 00       	call   c0007e57 <disp_int>
c00012fa:	58                   	pop    %eax
c00012fb:	5a                   	pop    %edx
c00012fc:	52                   	push   %edx
c00012fd:	50                   	push   %eax
c00012fe:	ff 35 a8 07 01 c0    	pushl  0xc00107a8
c0001304:	e8 4e 6b 00 00       	call   c0007e57 <disp_int>
c0001309:	83 c4 04             	add    $0x4,%esp
c000130c:	58                   	pop    %eax
c000130d:	5a                   	pop    %edx
c000130e:	52                   	push   %edx
c000130f:	50                   	push   %eax
c0001310:	ff 72 ec             	pushl  -0x14(%edx)
c0001313:	e8 3f 6b 00 00       	call   c0007e57 <disp_int>
c0001318:	83 c4 04             	add    $0x4,%esp
c000131b:	58                   	pop    %eax
c000131c:	5a                   	pop    %edx
c000131d:	52                   	push   %edx
c000131e:	50                   	push   %eax
c000131f:	ff 70 ec             	pushl  -0x14(%eax)
c0001322:	e8 30 6b 00 00       	call   c0007e57 <disp_int>
c0001327:	83 c4 04             	add    $0x4,%esp
c000132a:	58                   	pop    %eax
c000132b:	5a                   	pop    %edx
c000132c:	52                   	push   %edx
c000132d:	50                   	push   %eax
c000132e:	ff 35 c0 0b 01 c0    	pushl  0xc0010bc0
c0001334:	e8 1e 6b 00 00       	call   c0007e57 <disp_int>
c0001339:	83 c4 04             	add    $0x4,%esp
c000133c:	58                   	pop    %eax
c000133d:	5a                   	pop    %edx
c000133e:	52                   	push   %edx
c000133f:	50                   	push   %eax
c0001340:	68 60 07 01 c0       	push   $0xc0010760
c0001345:	e8 0d 6b 00 00       	call   c0007e57 <disp_int>
c000134a:	83 c4 04             	add    $0x4,%esp
c000134d:	58                   	pop    %eax
c000134e:	5a                   	pop    %edx
c000134f:	5d                   	pop    %ebp
c0001350:	c3                   	ret    

c0001351 <check_tss_esp0.2>:
c0001351:	5d                   	pop    %ebp
c0001352:	c3                   	ret    

c0001353 <enable_8259A_casecade_irq>:
c0001353:	9c                   	pushf  
c0001354:	fa                   	cli    
c0001355:	e4 21                	in     $0x21,%al
c0001357:	24 fb                	and    $0xfb,%al
c0001359:	e6 21                	out    %al,$0x21
c000135b:	9d                   	popf   
c000135c:	c3                   	ret    

c000135d <disable_8259A_casecade_irq>:
c000135d:	9c                   	pushf  
c000135e:	fa                   	cli    
c000135f:	e4 21                	in     $0x21,%al
c0001361:	0c 04                	or     $0x4,%al
c0001363:	e6 21                	out    %al,$0x21
c0001365:	9c                   	pushf  
c0001366:	c3                   	ret    

c0001367 <enable_8259A_slave_winchester_irq>:
c0001367:	9c                   	pushf  
c0001368:	fa                   	cli    
c0001369:	e4 a1                	in     $0xa1,%al
c000136b:	24 bf                	and    $0xbf,%al
c000136d:	e6 a1                	out    %al,$0xa1
c000136f:	9d                   	popf   
c0001370:	c3                   	ret    

c0001371 <disable_8259A_slave_winchester_irq>:
c0001371:	9c                   	pushf  
c0001372:	fa                   	cli    
c0001373:	e4 a1                	in     $0xa1,%al
c0001375:	0c 40                	or     $0x40,%al
c0001377:	e6 a1                	out    %al,$0xa1
c0001379:	9d                   	popf   
c000137a:	c3                   	ret    

c000137b <update_cr3>:
c000137b:	55                   	push   %ebp
c000137c:	89 e5                	mov    %esp,%ebp
c000137e:	8b 45 08             	mov    0x8(%ebp),%eax
c0001381:	0f 22 d8             	mov    %eax,%cr3
c0001384:	89 ec                	mov    %ebp,%esp
c0001386:	5d                   	pop    %ebp
c0001387:	c3                   	ret    

c0001388 <update_tss>:
c0001388:	55                   	push   %ebp
c0001389:	89 e5                	mov    %esp,%ebp
c000138b:	8b 45 08             	mov    0x8(%ebp),%eax
c000138e:	a3 44 16 01 c0       	mov    %eax,0xc0011644
c0001393:	89 ec                	mov    %ebp,%esp
c0001395:	5d                   	pop    %ebp
c0001396:	c3                   	ret    

c0001397 <get_running_thread_pcb>:
c0001397:	89 e0                	mov    %esp,%eax
c0001399:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c000139e:	c3                   	ret    

c000139f <sys_call_test>:
c000139f:	9c                   	pushf  
c00013a0:	66 87 db             	xchg   %bx,%bx
c00013a3:	9d                   	popf   
c00013a4:	c3                   	ret    

c00013a5 <kernel_main>:
c00013a5:	55                   	push   %ebp
c00013a6:	89 e5                	mov    %esp,%ebp
c00013a8:	83 ec 08             	sub    $0x8,%esp
c00013ab:	e8 d0 00 00 00       	call   c0001480 <init>
c00013b0:	e8 e2 ff ff ff       	call   c0001397 <get_running_thread_pcb>
c00013b5:	a3 e0 1e 01 c0       	mov    %eax,0xc0011ee0
c00013ba:	a1 e0 1e 01 c0       	mov    0xc0011ee0,%eax
c00013bf:	05 00 01 00 00       	add    $0x100,%eax
c00013c4:	83 ec 08             	sub    $0x8,%esp
c00013c7:	50                   	push   %eax
c00013c8:	68 ec 0d 01 c0       	push   $0xc0010dec
c00013cd:	e8 ee 96 00 00       	call   c000aac0 <appendToDoubleLinkList>
c00013d2:	83 c4 10             	add    $0x10,%esp
c00013d5:	a1 e0 1e 01 c0       	mov    0xc0011ee0,%eax
c00013da:	05 08 01 00 00       	add    $0x108,%eax
c00013df:	83 ec 08             	sub    $0x8,%esp
c00013e2:	50                   	push   %eax
c00013e3:	68 ec 0d 01 c0       	push   $0xc0010dec
c00013e8:	e8 d3 96 00 00       	call   c000aac0 <appendToDoubleLinkList>
c00013ed:	83 c4 10             	add    $0x10,%esp
c00013f0:	6a 00                	push   $0x0
c00013f2:	68 80 ae 00 c0       	push   $0xc000ae80
c00013f7:	68 87 ae 00 c0       	push   $0xc000ae87
c00013fc:	68 6c 5f 00 c0       	push   $0xc0005f6c
c0001401:	e8 01 94 00 00       	call   c000a807 <process_execute>
c0001406:	83 c4 10             	add    $0x10,%esp
c0001409:	6a 00                	push   $0x0
c000140b:	68 90 ae 00 c0       	push   $0xc000ae90
c0001410:	68 98 ae 00 c0       	push   $0xc000ae98
c0001415:	68 99 24 00 c0       	push   $0xc0002499
c000141a:	e8 e8 93 00 00       	call   c000a807 <process_execute>
c000141f:	83 c4 10             	add    $0x10,%esp
c0001422:	6a 00                	push   $0x0
c0001424:	68 a1 ae 00 c0       	push   $0xc000aea1
c0001429:	68 a8 ae 00 c0       	push   $0xc000aea8
c000142e:	68 13 16 00 c0       	push   $0xc0001613
c0001433:	e8 cf 93 00 00       	call   c000a807 <process_execute>
c0001438:	83 c4 10             	add    $0x10,%esp
c000143b:	6a 00                	push   $0x0
c000143d:	68 b1 ae 00 c0       	push   $0xc000aeb1
c0001442:	68 b9 ae 00 c0       	push   $0xc000aeb9
c0001447:	68 0c 54 00 c0       	push   $0xc000540c
c000144c:	e8 b6 93 00 00       	call   c000a807 <process_execute>
c0001451:	83 c4 10             	add    $0x10,%esp
c0001454:	6a 01                	push   $0x1
c0001456:	68 c3 ae 00 c0       	push   $0xc000aec3
c000145b:	68 cd ae 00 c0       	push   $0xc000aecd
c0001460:	68 f6 15 00 c0       	push   $0xc00015f6
c0001465:	e8 9d 93 00 00       	call   c000a807 <process_execute>
c000146a:	83 c4 10             	add    $0x10,%esp
c000146d:	83 ec 0c             	sub    $0xc,%esp
c0001470:	68 da ae 00 c0       	push   $0xc000aeda
c0001475:	e8 12 fc ff ff       	call   c000108c <disp_str>
c000147a:	83 c4 10             	add    $0x10,%esp
c000147d:	fb                   	sti    
c000147e:	eb fe                	jmp    c000147e <kernel_main+0xd9>

c0001480 <init>:
c0001480:	55                   	push   %ebp
c0001481:	89 e5                	mov    %esp,%ebp
c0001483:	83 ec 18             	sub    $0x18,%esp
c0001486:	c7 05 a4 07 01 c0 00 	movl   $0x0,0xc00107a4
c000148d:	00 00 00 
c0001490:	c7 05 90 07 01 c0 00 	movl   $0x0,0xc0010790
c0001497:	00 00 00 
c000149a:	c7 05 fc 0d 01 c0 09 	movl   $0x9,0xc0010dfc
c00014a1:	00 00 00 
c00014a4:	c7 05 c0 0b 01 c0 00 	movl   $0x0,0xc0010bc0
c00014ab:	00 00 00 
c00014ae:	83 ec 0c             	sub    $0xc,%esp
c00014b1:	68 e4 ae 00 c0       	push   $0xc000aee4
c00014b6:	e8 d1 fb ff ff       	call   c000108c <disp_str>
c00014bb:	83 c4 10             	add    $0x10,%esp
c00014be:	e8 e4 6e 00 00       	call   c00083a7 <init_keyboard>
c00014c3:	83 ec 0c             	sub    $0xc,%esp
c00014c6:	68 00 00 00 04       	push   $0x4000000
c00014cb:	e8 ab 63 00 00       	call   c000787b <init_memory>
c00014d0:	83 c4 10             	add    $0x10,%esp
c00014d3:	83 ec 0c             	sub    $0xc,%esp
c00014d6:	68 ec 0d 01 c0       	push   $0xc0010dec
c00014db:	e8 b5 94 00 00       	call   c000a995 <initDoubleLinkList>
c00014e0:	83 c4 10             	add    $0x10,%esp
c00014e3:	83 ec 0c             	sub    $0xc,%esp
c00014e6:	68 04 1f 01 c0       	push   $0xc0011f04
c00014eb:	e8 a5 94 00 00       	call   c000a995 <initDoubleLinkList>
c00014f0:	83 c4 10             	add    $0x10,%esp
c00014f3:	c7 05 a4 07 01 c0 00 	movl   $0x0,0xc00107a4
c00014fa:	00 00 00 
c00014fd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0001504:	eb 14                	jmp    c000151a <init+0x9a>
c0001506:	83 ec 0c             	sub    $0xc,%esp
c0001509:	68 ea ae 00 c0       	push   $0xc000aeea
c000150e:	e8 79 fb ff ff       	call   c000108c <disp_str>
c0001513:	83 c4 10             	add    $0x10,%esp
c0001516:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000151a:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c0001521:	7e e3                	jle    c0001506 <init+0x86>
c0001523:	c7 05 a4 07 01 c0 00 	movl   $0x0,0xc00107a4
c000152a:	00 00 00 
c000152d:	90                   	nop
c000152e:	c9                   	leave  
c000152f:	c3                   	ret    

c0001530 <kernel_thread_a>:
c0001530:	55                   	push   %ebp
c0001531:	89 e5                	mov    %esp,%ebp
c0001533:	83 ec 18             	sub    $0x18,%esp
c0001536:	83 ec 0c             	sub    $0xc,%esp
c0001539:	ff 75 08             	pushl  0x8(%ebp)
c000153c:	e8 4b fb ff ff       	call   c000108c <disp_str>
c0001541:	83 c4 10             	add    $0x10,%esp
c0001544:	a1 a4 07 01 c0       	mov    0xc00107a4,%eax
c0001549:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000154c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0001553:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001556:	a3 a4 07 01 c0       	mov    %eax,0xc00107a4
c000155b:	83 ec 0c             	sub    $0xc,%esp
c000155e:	68 eb ae 00 c0       	push   $0xc000aeeb
c0001563:	e8 24 fb ff ff       	call   c000108c <disp_str>
c0001568:	83 c4 10             	add    $0x10,%esp
c000156b:	83 ec 0c             	sub    $0xc,%esp
c000156e:	68 f4 ae 00 c0       	push   $0xc000aef4
c0001573:	e8 14 fb ff ff       	call   c000108c <disp_str>
c0001578:	83 c4 10             	add    $0x10,%esp
c000157b:	eb d6                	jmp    c0001553 <kernel_thread_a+0x23>

c000157d <kernel_thread_b>:
c000157d:	55                   	push   %ebp
c000157e:	89 e5                	mov    %esp,%ebp
c0001580:	83 ec 18             	sub    $0x18,%esp
c0001583:	83 ec 0c             	sub    $0xc,%esp
c0001586:	ff 75 08             	pushl  0x8(%ebp)
c0001589:	e8 fe fa ff ff       	call   c000108c <disp_str>
c000158e:	83 c4 10             	add    $0x10,%esp
c0001591:	a1 a4 07 01 c0       	mov    0xc00107a4,%eax
c0001596:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0001599:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00015a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00015a3:	a3 a4 07 01 c0       	mov    %eax,0xc00107a4
c00015a8:	83 ec 0c             	sub    $0xc,%esp
c00015ab:	68 f6 ae 00 c0       	push   $0xc000aef6
c00015b0:	e8 d7 fa ff ff       	call   c000108c <disp_str>
c00015b5:	83 c4 10             	add    $0x10,%esp
c00015b8:	83 ec 0c             	sub    $0xc,%esp
c00015bb:	68 f4 ae 00 c0       	push   $0xc000aef4
c00015c0:	e8 c7 fa ff ff       	call   c000108c <disp_str>
c00015c5:	83 c4 10             	add    $0x10,%esp
c00015c8:	eb d6                	jmp    c00015a0 <kernel_thread_b+0x23>

c00015ca <kernel_thread_c>:
c00015ca:	55                   	push   %ebp
c00015cb:	89 e5                	mov    %esp,%ebp
c00015cd:	83 ec 08             	sub    $0x8,%esp
c00015d0:	83 ec 0c             	sub    $0xc,%esp
c00015d3:	ff 75 08             	pushl  0x8(%ebp)
c00015d6:	e8 b1 fa ff ff       	call   c000108c <disp_str>
c00015db:	83 c4 10             	add    $0x10,%esp
c00015de:	eb fe                	jmp    c00015de <kernel_thread_c+0x14>

c00015e0 <kernel_thread_d>:
c00015e0:	55                   	push   %ebp
c00015e1:	89 e5                	mov    %esp,%ebp
c00015e3:	83 ec 08             	sub    $0x8,%esp
c00015e6:	83 ec 0c             	sub    $0xc,%esp
c00015e9:	ff 75 08             	pushl  0x8(%ebp)
c00015ec:	e8 9b fa ff ff       	call   c000108c <disp_str>
c00015f1:	83 c4 10             	add    $0x10,%esp
c00015f4:	eb fe                	jmp    c00015f4 <kernel_thread_d+0x14>

c00015f6 <user_proc_a>:
c00015f6:	55                   	push   %ebp
c00015f7:	89 e5                	mov    %esp,%ebp
c00015f9:	83 ec 08             	sub    $0x8,%esp
c00015fc:	83 ec 0c             	sub    $0xc,%esp
c00015ff:	68 ff ae 00 c0       	push   $0xc000aeff
c0001604:	e8 83 fa ff ff       	call   c000108c <disp_str>
c0001609:	83 c4 10             	add    $0x10,%esp
c000160c:	e8 78 73 00 00       	call   c0008989 <INIT_fork>
c0001611:	eb fe                	jmp    c0001611 <user_proc_a+0x1b>

c0001613 <TaskHD>:
c0001613:	55                   	push   %ebp
c0001614:	89 e5                	mov    %esp,%ebp
c0001616:	83 ec 18             	sub    $0x18,%esp
c0001619:	e8 79 fd ff ff       	call   c0001397 <get_running_thread_pcb>
c000161e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0001621:	e8 32 00 00 00       	call   c0001658 <init_hd>
c0001626:	83 ec 0c             	sub    $0xc,%esp
c0001629:	6a 7c                	push   $0x7c
c000162b:	e8 3c 0e 00 00       	call   c000246c <sys_malloc>
c0001630:	83 c4 10             	add    $0x10,%esp
c0001633:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0001636:	83 ec 04             	sub    $0x4,%esp
c0001639:	6a 7c                	push   $0x7c
c000163b:	6a 00                	push   $0x0
c000163d:	ff 75 f0             	pushl  -0x10(%ebp)
c0001640:	e8 da a5 00 00       	call   c000bc1f <Memset>
c0001645:	83 c4 10             	add    $0x10,%esp
c0001648:	83 ec 0c             	sub    $0xc,%esp
c000164b:	ff 75 f0             	pushl  -0x10(%ebp)
c000164e:	e8 1f 00 00 00       	call   c0001672 <hd_handle>
c0001653:	83 c4 10             	add    $0x10,%esp
c0001656:	eb de                	jmp    c0001636 <TaskHD+0x23>

c0001658 <init_hd>:
c0001658:	55                   	push   %ebp
c0001659:	89 e5                	mov    %esp,%ebp
c000165b:	83 ec 18             	sub    $0x18,%esp
c000165e:	c7 45 f4 75 04 00 00 	movl   $0x475,-0xc(%ebp)
c0001665:	e8 e9 fc ff ff       	call   c0001353 <enable_8259A_casecade_irq>
c000166a:	e8 f8 fc ff ff       	call   c0001367 <enable_8259A_slave_winchester_irq>
c000166f:	90                   	nop
c0001670:	c9                   	leave  
c0001671:	c3                   	ret    

c0001672 <hd_handle>:
c0001672:	55                   	push   %ebp
c0001673:	89 e5                	mov    %esp,%ebp
c0001675:	83 ec 18             	sub    $0x18,%esp
c0001678:	83 ec 04             	sub    $0x4,%esp
c000167b:	6a 12                	push   $0x12
c000167d:	ff 75 08             	pushl  0x8(%ebp)
c0001680:	6a 02                	push   $0x2
c0001682:	e8 dd 87 00 00       	call   c0009e64 <send_rec>
c0001687:	83 c4 10             	add    $0x10,%esp
c000168a:	8b 45 08             	mov    0x8(%ebp),%eax
c000168d:	8b 40 78             	mov    0x78(%eax),%eax
c0001690:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0001693:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0001697:	0f 84 d4 00 00 00    	je     c0001771 <hd_handle+0xff>
c000169d:	8b 45 08             	mov    0x8(%ebp),%eax
c00016a0:	8b 00                	mov    (%eax),%eax
c00016a2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00016a5:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c00016a9:	74 28                	je     c00016d3 <hd_handle+0x61>
c00016ab:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c00016af:	74 22                	je     c00016d3 <hd_handle+0x61>
c00016b1:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c00016b5:	74 1c                	je     c00016d3 <hd_handle+0x61>
c00016b7:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c00016bb:	74 16                	je     c00016d3 <hd_handle+0x61>
c00016bd:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c00016c4:	74 0d                	je     c00016d3 <hd_handle+0x61>
c00016c6:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c00016cd:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00016d0:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00016d3:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c00016d7:	74 34                	je     c000170d <hd_handle+0x9b>
c00016d9:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c00016dd:	74 2e                	je     c000170d <hd_handle+0x9b>
c00016df:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c00016e3:	74 28                	je     c000170d <hd_handle+0x9b>
c00016e5:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c00016e9:	74 22                	je     c000170d <hd_handle+0x9b>
c00016eb:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c00016f2:	74 19                	je     c000170d <hd_handle+0x9b>
c00016f4:	6a 6d                	push   $0x6d
c00016f6:	68 14 af 00 c0       	push   $0xc000af14
c00016fb:	68 14 af 00 c0       	push   $0xc000af14
c0001700:	68 1c af 00 c0       	push   $0xc000af1c
c0001705:	e8 3d 7d 00 00       	call   c0009447 <assertion_failure>
c000170a:	83 c4 10             	add    $0x10,%esp
c000170d:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c0001711:	74 2c                	je     c000173f <hd_handle+0xcd>
c0001713:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c0001717:	77 0e                	ja     c0001727 <hd_handle+0xb5>
c0001719:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c000171d:	74 19                	je     c0001738 <hd_handle+0xc6>
c000171f:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c0001723:	74 1a                	je     c000173f <hd_handle+0xcd>
c0001725:	eb 37                	jmp    c000175e <hd_handle+0xec>
c0001727:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c000172b:	74 22                	je     c000174f <hd_handle+0xdd>
c000172d:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c0001734:	74 3e                	je     c0001774 <hd_handle+0x102>
c0001736:	eb 26                	jmp    c000175e <hd_handle+0xec>
c0001738:	e8 e6 06 00 00       	call   c0001e23 <hd_open>
c000173d:	eb 36                	jmp    c0001775 <hd_handle+0x103>
c000173f:	83 ec 0c             	sub    $0xc,%esp
c0001742:	ff 75 08             	pushl  0x8(%ebp)
c0001745:	e8 b2 08 00 00       	call   c0001ffc <hd_rdwt>
c000174a:	83 c4 10             	add    $0x10,%esp
c000174d:	eb 26                	jmp    c0001775 <hd_handle+0x103>
c000174f:	83 ec 0c             	sub    $0xc,%esp
c0001752:	6a 00                	push   $0x0
c0001754:	e8 71 07 00 00       	call   c0001eca <get_hd_ioctl>
c0001759:	83 c4 10             	add    $0x10,%esp
c000175c:	eb 17                	jmp    c0001775 <hd_handle+0x103>
c000175e:	83 ec 0c             	sub    $0xc,%esp
c0001761:	68 76 af 00 c0       	push   $0xc000af76
c0001766:	e8 98 7c 00 00       	call   c0009403 <spin>
c000176b:	83 c4 10             	add    $0x10,%esp
c000176e:	90                   	nop
c000176f:	eb 04                	jmp    c0001775 <hd_handle+0x103>
c0001771:	90                   	nop
c0001772:	eb 01                	jmp    c0001775 <hd_handle+0x103>
c0001774:	90                   	nop
c0001775:	c9                   	leave  
c0001776:	c3                   	ret    

c0001777 <hd_cmd_out>:
c0001777:	55                   	push   %ebp
c0001778:	89 e5                	mov    %esp,%ebp
c000177a:	83 ec 08             	sub    $0x8,%esp
c000177d:	83 ec 04             	sub    $0x4,%esp
c0001780:	68 18 73 01 00       	push   $0x17318
c0001785:	6a 00                	push   $0x0
c0001787:	68 80 00 00 00       	push   $0x80
c000178c:	e8 36 0b 00 00       	call   c00022c7 <waitfor>
c0001791:	83 c4 10             	add    $0x10,%esp
c0001794:	85 c0                	test   %eax,%eax
c0001796:	75 10                	jne    c00017a8 <hd_cmd_out+0x31>
c0001798:	83 ec 0c             	sub    $0xc,%esp
c000179b:	68 88 af 00 c0       	push   $0xc000af88
c00017a0:	e8 84 7c 00 00       	call   c0009429 <panic>
c00017a5:	83 c4 10             	add    $0x10,%esp
c00017a8:	83 ec 08             	sub    $0x8,%esp
c00017ab:	6a 00                	push   $0x0
c00017ad:	68 f6 03 00 00       	push   $0x3f6
c00017b2:	e8 e2 fa ff ff       	call   c0001299 <out_byte>
c00017b7:	83 c4 10             	add    $0x10,%esp
c00017ba:	8b 45 08             	mov    0x8(%ebp),%eax
c00017bd:	0f b6 00             	movzbl (%eax),%eax
c00017c0:	0f b6 c0             	movzbl %al,%eax
c00017c3:	83 ec 08             	sub    $0x8,%esp
c00017c6:	50                   	push   %eax
c00017c7:	68 f1 01 00 00       	push   $0x1f1
c00017cc:	e8 c8 fa ff ff       	call   c0001299 <out_byte>
c00017d1:	83 c4 10             	add    $0x10,%esp
c00017d4:	8b 45 08             	mov    0x8(%ebp),%eax
c00017d7:	0f b6 40 01          	movzbl 0x1(%eax),%eax
c00017db:	0f b6 c0             	movzbl %al,%eax
c00017de:	83 ec 08             	sub    $0x8,%esp
c00017e1:	50                   	push   %eax
c00017e2:	68 f2 01 00 00       	push   $0x1f2
c00017e7:	e8 ad fa ff ff       	call   c0001299 <out_byte>
c00017ec:	83 c4 10             	add    $0x10,%esp
c00017ef:	8b 45 08             	mov    0x8(%ebp),%eax
c00017f2:	0f b6 40 02          	movzbl 0x2(%eax),%eax
c00017f6:	0f b6 c0             	movzbl %al,%eax
c00017f9:	83 ec 08             	sub    $0x8,%esp
c00017fc:	50                   	push   %eax
c00017fd:	68 f3 01 00 00       	push   $0x1f3
c0001802:	e8 92 fa ff ff       	call   c0001299 <out_byte>
c0001807:	83 c4 10             	add    $0x10,%esp
c000180a:	8b 45 08             	mov    0x8(%ebp),%eax
c000180d:	0f b6 40 03          	movzbl 0x3(%eax),%eax
c0001811:	0f b6 c0             	movzbl %al,%eax
c0001814:	83 ec 08             	sub    $0x8,%esp
c0001817:	50                   	push   %eax
c0001818:	68 f4 01 00 00       	push   $0x1f4
c000181d:	e8 77 fa ff ff       	call   c0001299 <out_byte>
c0001822:	83 c4 10             	add    $0x10,%esp
c0001825:	8b 45 08             	mov    0x8(%ebp),%eax
c0001828:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c000182c:	0f b6 c0             	movzbl %al,%eax
c000182f:	83 ec 08             	sub    $0x8,%esp
c0001832:	50                   	push   %eax
c0001833:	68 f5 01 00 00       	push   $0x1f5
c0001838:	e8 5c fa ff ff       	call   c0001299 <out_byte>
c000183d:	83 c4 10             	add    $0x10,%esp
c0001840:	8b 45 08             	mov    0x8(%ebp),%eax
c0001843:	0f b6 40 05          	movzbl 0x5(%eax),%eax
c0001847:	0f b6 c0             	movzbl %al,%eax
c000184a:	83 ec 08             	sub    $0x8,%esp
c000184d:	50                   	push   %eax
c000184e:	68 f6 01 00 00       	push   $0x1f6
c0001853:	e8 41 fa ff ff       	call   c0001299 <out_byte>
c0001858:	83 c4 10             	add    $0x10,%esp
c000185b:	8b 45 08             	mov    0x8(%ebp),%eax
c000185e:	0f b6 40 06          	movzbl 0x6(%eax),%eax
c0001862:	0f b6 c0             	movzbl %al,%eax
c0001865:	83 ec 08             	sub    $0x8,%esp
c0001868:	50                   	push   %eax
c0001869:	68 f7 01 00 00       	push   $0x1f7
c000186e:	e8 26 fa ff ff       	call   c0001299 <out_byte>
c0001873:	83 c4 10             	add    $0x10,%esp
c0001876:	90                   	nop
c0001877:	c9                   	leave  
c0001878:	c3                   	ret    

c0001879 <hd_identify>:
c0001879:	55                   	push   %ebp
c000187a:	89 e5                	mov    %esp,%ebp
c000187c:	53                   	push   %ebx
c000187d:	83 ec 24             	sub    $0x24,%esp
c0001880:	89 e0                	mov    %esp,%eax
c0001882:	89 c3                	mov    %eax,%ebx
c0001884:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
c0001888:	c6 45 e6 01          	movb   $0x1,-0x1a(%ebp)
c000188c:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
c0001890:	c6 45 e8 00          	movb   $0x0,-0x18(%ebp)
c0001894:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c0001898:	8b 45 08             	mov    0x8(%ebp),%eax
c000189b:	c1 e0 04             	shl    $0x4,%eax
c000189e:	83 c8 e0             	or     $0xffffffe0,%eax
c00018a1:	88 45 ea             	mov    %al,-0x16(%ebp)
c00018a4:	c6 45 eb ec          	movb   $0xec,-0x15(%ebp)
c00018a8:	83 ec 0c             	sub    $0xc,%esp
c00018ab:	8d 45 e5             	lea    -0x1b(%ebp),%eax
c00018ae:	50                   	push   %eax
c00018af:	e8 c3 fe ff ff       	call   c0001777 <hd_cmd_out>
c00018b4:	83 c4 10             	add    $0x10,%esp
c00018b7:	e8 f0 06 00 00       	call   c0001fac <interrupt_wait>
c00018bc:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c00018c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00018c6:	8d 50 ff             	lea    -0x1(%eax),%edx
c00018c9:	89 55 f0             	mov    %edx,-0x10(%ebp)
c00018cc:	89 c2                	mov    %eax,%edx
c00018ce:	b8 10 00 00 00       	mov    $0x10,%eax
c00018d3:	83 e8 01             	sub    $0x1,%eax
c00018d6:	01 d0                	add    %edx,%eax
c00018d8:	b9 10 00 00 00       	mov    $0x10,%ecx
c00018dd:	ba 00 00 00 00       	mov    $0x0,%edx
c00018e2:	f7 f1                	div    %ecx
c00018e4:	6b c0 10             	imul   $0x10,%eax,%eax
c00018e7:	29 c4                	sub    %eax,%esp
c00018e9:	89 e0                	mov    %esp,%eax
c00018eb:	83 c0 00             	add    $0x0,%eax
c00018ee:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00018f1:	83 ec 04             	sub    $0x4,%esp
c00018f4:	ff 75 f4             	pushl  -0xc(%ebp)
c00018f7:	6a 00                	push   $0x0
c00018f9:	ff 75 ec             	pushl  -0x14(%ebp)
c00018fc:	e8 1e a3 00 00       	call   c000bc1f <Memset>
c0001901:	83 c4 10             	add    $0x10,%esp
c0001904:	83 ec 04             	sub    $0x4,%esp
c0001907:	ff 75 f4             	pushl  -0xc(%ebp)
c000190a:	ff 75 ec             	pushl  -0x14(%ebp)
c000190d:	68 f0 01 00 00       	push   $0x1f0
c0001912:	e8 5c a3 00 00       	call   c000bc73 <read_port>
c0001917:	83 c4 10             	add    $0x10,%esp
c000191a:	83 ec 0c             	sub    $0xc,%esp
c000191d:	ff 75 ec             	pushl  -0x14(%ebp)
c0001920:	e8 0b 00 00 00       	call   c0001930 <print_hdinfo>
c0001925:	83 c4 10             	add    $0x10,%esp
c0001928:	89 dc                	mov    %ebx,%esp
c000192a:	90                   	nop
c000192b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c000192e:	c9                   	leave  
c000192f:	c3                   	ret    

c0001930 <print_hdinfo>:
c0001930:	55                   	push   %ebp
c0001931:	89 e5                	mov    %esp,%ebp
c0001933:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0001939:	66 c7 45 b4 0a 00    	movw   $0xa,-0x4c(%ebp)
c000193f:	66 c7 45 b6 14 00    	movw   $0x14,-0x4a(%ebp)
c0001945:	c7 45 b8 53 65 72 69 	movl   $0x69726553,-0x48(%ebp)
c000194c:	c7 45 bc 61 6c 20 4e 	movl   $0x4e206c61,-0x44(%ebp)
c0001953:	c7 45 c0 75 6d 62 65 	movl   $0x65626d75,-0x40(%ebp)
c000195a:	c7 45 c4 72 00 00 00 	movl   $0x72,-0x3c(%ebp)
c0001961:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0001968:	66 c7 45 cc 1b 00    	movw   $0x1b,-0x34(%ebp)
c000196e:	66 c7 45 ce 28 00    	movw   $0x28,-0x32(%ebp)
c0001974:	c7 45 d0 4d 6f 64 65 	movl   $0x65646f4d,-0x30(%ebp)
c000197b:	c7 45 d4 6c 20 4e 75 	movl   $0x754e206c,-0x2c(%ebp)
c0001982:	c7 45 d8 6d 62 65 72 	movl   $0x7265626d,-0x28(%ebp)
c0001989:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0001990:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0001997:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000199e:	e9 8f 00 00 00       	jmp    c0001a32 <print_hdinfo+0x102>
c00019a3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00019aa:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00019ad:	89 d0                	mov    %edx,%eax
c00019af:	01 c0                	add    %eax,%eax
c00019b1:	01 d0                	add    %edx,%eax
c00019b3:	c1 e0 03             	shl    $0x3,%eax
c00019b6:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c00019b9:	01 c8                	add    %ecx,%eax
c00019bb:	83 e8 44             	sub    $0x44,%eax
c00019be:	0f b7 00             	movzwl (%eax),%eax
c00019c1:	0f b7 c0             	movzwl %ax,%eax
c00019c4:	8d 14 00             	lea    (%eax,%eax,1),%edx
c00019c7:	8b 45 08             	mov    0x8(%ebp),%eax
c00019ca:	01 d0                	add    %edx,%eax
c00019cc:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00019cf:	eb 30                	jmp    c0001a01 <print_hdinfo+0xd1>
c00019d1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00019d4:	8d 50 01             	lea    0x1(%eax),%edx
c00019d7:	89 55 ec             	mov    %edx,-0x14(%ebp)
c00019da:	8b 55 f0             	mov    -0x10(%ebp),%edx
c00019dd:	83 c2 01             	add    $0x1,%edx
c00019e0:	0f b6 00             	movzbl (%eax),%eax
c00019e3:	88 44 15 81          	mov    %al,-0x7f(%ebp,%edx,1)
c00019e7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00019ea:	8d 50 01             	lea    0x1(%eax),%edx
c00019ed:	89 55 ec             	mov    %edx,-0x14(%ebp)
c00019f0:	0f b6 00             	movzbl (%eax),%eax
c00019f3:	8d 4d 81             	lea    -0x7f(%ebp),%ecx
c00019f6:	8b 55 f0             	mov    -0x10(%ebp),%edx
c00019f9:	01 ca                	add    %ecx,%edx
c00019fb:	88 02                	mov    %al,(%edx)
c00019fd:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0001a01:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0001a04:	89 d0                	mov    %edx,%eax
c0001a06:	01 c0                	add    %eax,%eax
c0001a08:	01 d0                	add    %edx,%eax
c0001a0a:	c1 e0 03             	shl    $0x3,%eax
c0001a0d:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0001a10:	01 c8                	add    %ecx,%eax
c0001a12:	83 e8 42             	sub    $0x42,%eax
c0001a15:	0f b7 00             	movzwl (%eax),%eax
c0001a18:	66 d1 e8             	shr    %ax
c0001a1b:	0f b7 c0             	movzwl %ax,%eax
c0001a1e:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0001a21:	7c ae                	jl     c00019d1 <print_hdinfo+0xa1>
c0001a23:	8d 55 81             	lea    -0x7f(%ebp),%edx
c0001a26:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0001a29:	01 d0                	add    %edx,%eax
c0001a2b:	c6 00 00             	movb   $0x0,(%eax)
c0001a2e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0001a32:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0001a36:	0f 8e 67 ff ff ff    	jle    c00019a3 <print_hdinfo+0x73>
c0001a3c:	8b 45 08             	mov    0x8(%ebp),%eax
c0001a3f:	0f b7 40 62          	movzwl 0x62(%eax),%eax
c0001a43:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
c0001a47:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0001a4b:	66 c1 e8 08          	shr    $0x8,%ax
c0001a4f:	66 85 c0             	test   %ax,%ax
c0001a52:	0f 95 c0             	setne  %al
c0001a55:	88 45 e9             	mov    %al,-0x17(%ebp)
c0001a58:	c7 45 ac 59 65 73 00 	movl   $0x736559,-0x54(%ebp)
c0001a5f:	66 c7 45 a9 4e 6f    	movw   $0x6f4e,-0x57(%ebp)
c0001a65:	c6 45 ab 00          	movb   $0x0,-0x55(%ebp)
c0001a69:	80 7d e9 01          	cmpb   $0x1,-0x17(%ebp)
c0001a6d:	75 15                	jne    c0001a84 <print_hdinfo+0x154>
c0001a6f:	83 ec 08             	sub    $0x8,%esp
c0001a72:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0001a75:	50                   	push   %eax
c0001a76:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0001a79:	50                   	push   %eax
c0001a7a:	e8 bf a1 00 00       	call   c000bc3e <Strcpy>
c0001a7f:	83 c4 10             	add    $0x10,%esp
c0001a82:	eb 13                	jmp    c0001a97 <print_hdinfo+0x167>
c0001a84:	83 ec 08             	sub    $0x8,%esp
c0001a87:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0001a8a:	50                   	push   %eax
c0001a8b:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0001a8e:	50                   	push   %eax
c0001a8f:	e8 aa a1 00 00       	call   c000bc3e <Strcpy>
c0001a94:	83 c4 10             	add    $0x10,%esp
c0001a97:	8b 45 08             	mov    0x8(%ebp),%eax
c0001a9a:	83 c0 7a             	add    $0x7a,%eax
c0001a9d:	0f b7 00             	movzwl (%eax),%eax
c0001aa0:	0f b7 d0             	movzwl %ax,%edx
c0001aa3:	8b 45 08             	mov    0x8(%ebp),%eax
c0001aa6:	83 c0 78             	add    $0x78,%eax
c0001aa9:	0f b7 00             	movzwl (%eax),%eax
c0001aac:	0f b7 c0             	movzwl %ax,%eax
c0001aaf:	83 c0 10             	add    $0x10,%eax
c0001ab2:	89 c1                	mov    %eax,%ecx
c0001ab4:	d3 e2                	shl    %cl,%edx
c0001ab6:	89 d0                	mov    %edx,%eax
c0001ab8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0001abb:	90                   	nop
c0001abc:	c9                   	leave  
c0001abd:	c3                   	ret    

c0001abe <print_dpt_entry>:
c0001abe:	55                   	push   %ebp
c0001abf:	89 e5                	mov    %esp,%ebp
c0001ac1:	83 ec 08             	sub    $0x8,%esp
c0001ac4:	8b 45 08             	mov    0x8(%ebp),%eax
c0001ac7:	8b 40 08             	mov    0x8(%eax),%eax
c0001aca:	83 ec 08             	sub    $0x8,%esp
c0001acd:	50                   	push   %eax
c0001ace:	68 92 af 00 c0       	push   $0xc000af92
c0001ad3:	e8 12 76 00 00       	call   c00090ea <Printf>
c0001ad8:	83 c4 10             	add    $0x10,%esp
c0001adb:	8b 45 08             	mov    0x8(%ebp),%eax
c0001ade:	8b 40 0c             	mov    0xc(%eax),%eax
c0001ae1:	83 ec 08             	sub    $0x8,%esp
c0001ae4:	50                   	push   %eax
c0001ae5:	68 9a af 00 c0       	push   $0xc000af9a
c0001aea:	e8 fb 75 00 00       	call   c00090ea <Printf>
c0001aef:	83 c4 10             	add    $0x10,%esp
c0001af2:	8b 45 08             	mov    0x8(%ebp),%eax
c0001af5:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0001af9:	0f b6 c0             	movzbl %al,%eax
c0001afc:	83 ec 08             	sub    $0x8,%esp
c0001aff:	50                   	push   %eax
c0001b00:	68 ab af 00 c0       	push   $0xc000afab
c0001b05:	e8 e0 75 00 00       	call   c00090ea <Printf>
c0001b0a:	83 c4 10             	add    $0x10,%esp
c0001b0d:	8b 45 08             	mov    0x8(%ebp),%eax
c0001b10:	0f b6 00             	movzbl (%eax),%eax
c0001b13:	0f b6 c0             	movzbl %al,%eax
c0001b16:	83 ec 08             	sub    $0x8,%esp
c0001b19:	50                   	push   %eax
c0001b1a:	68 b9 af 00 c0       	push   $0xc000afb9
c0001b1f:	e8 c6 75 00 00       	call   c00090ea <Printf>
c0001b24:	83 c4 10             	add    $0x10,%esp
c0001b27:	90                   	nop
c0001b28:	c9                   	leave  
c0001b29:	c3                   	ret    

c0001b2a <get_partition_table>:
c0001b2a:	55                   	push   %ebp
c0001b2b:	89 e5                	mov    %esp,%ebp
c0001b2d:	53                   	push   %ebx
c0001b2e:	83 ec 24             	sub    $0x24,%esp
c0001b31:	89 e0                	mov    %esp,%eax
c0001b33:	89 c3                	mov    %eax,%ebx
c0001b35:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
c0001b39:	c6 45 e2 01          	movb   $0x1,-0x1e(%ebp)
c0001b3d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0001b40:	88 45 e3             	mov    %al,-0x1d(%ebp)
c0001b43:	8b 45 0c             	mov    0xc(%ebp),%eax
c0001b46:	c1 f8 08             	sar    $0x8,%eax
c0001b49:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0001b4c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0001b4f:	c1 f8 10             	sar    $0x10,%eax
c0001b52:	88 45 e5             	mov    %al,-0x1b(%ebp)
c0001b55:	8b 45 0c             	mov    0xc(%ebp),%eax
c0001b58:	c1 f8 18             	sar    $0x18,%eax
c0001b5b:	89 c2                	mov    %eax,%edx
c0001b5d:	8b 45 08             	mov    0x8(%ebp),%eax
c0001b60:	c1 e0 04             	shl    $0x4,%eax
c0001b63:	09 d0                	or     %edx,%eax
c0001b65:	83 c8 e0             	or     $0xffffffe0,%eax
c0001b68:	88 45 e6             	mov    %al,-0x1a(%ebp)
c0001b6b:	c6 45 e7 20          	movb   $0x20,-0x19(%ebp)
c0001b6f:	83 ec 0c             	sub    $0xc,%esp
c0001b72:	8d 45 e1             	lea    -0x1f(%ebp),%eax
c0001b75:	50                   	push   %eax
c0001b76:	e8 fc fb ff ff       	call   c0001777 <hd_cmd_out>
c0001b7b:	83 c4 10             	add    $0x10,%esp
c0001b7e:	e8 29 04 00 00       	call   c0001fac <interrupt_wait>
c0001b83:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c0001b8a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001b8d:	8d 50 ff             	lea    -0x1(%eax),%edx
c0001b90:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0001b93:	89 c2                	mov    %eax,%edx
c0001b95:	b8 10 00 00 00       	mov    $0x10,%eax
c0001b9a:	83 e8 01             	sub    $0x1,%eax
c0001b9d:	01 d0                	add    %edx,%eax
c0001b9f:	b9 10 00 00 00       	mov    $0x10,%ecx
c0001ba4:	ba 00 00 00 00       	mov    $0x0,%edx
c0001ba9:	f7 f1                	div    %ecx
c0001bab:	6b c0 10             	imul   $0x10,%eax,%eax
c0001bae:	29 c4                	sub    %eax,%esp
c0001bb0:	89 e0                	mov    %esp,%eax
c0001bb2:	83 c0 00             	add    $0x0,%eax
c0001bb5:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0001bb8:	83 ec 04             	sub    $0x4,%esp
c0001bbb:	ff 75 f4             	pushl  -0xc(%ebp)
c0001bbe:	6a 00                	push   $0x0
c0001bc0:	ff 75 ec             	pushl  -0x14(%ebp)
c0001bc3:	e8 57 a0 00 00       	call   c000bc1f <Memset>
c0001bc8:	83 c4 10             	add    $0x10,%esp
c0001bcb:	83 ec 04             	sub    $0x4,%esp
c0001bce:	ff 75 f4             	pushl  -0xc(%ebp)
c0001bd1:	ff 75 ec             	pushl  -0x14(%ebp)
c0001bd4:	68 f0 01 00 00       	push   $0x1f0
c0001bd9:	e8 95 a0 00 00       	call   c000bc73 <read_port>
c0001bde:	83 c4 10             	add    $0x10,%esp
c0001be1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0001be4:	05 be 01 00 00       	add    $0x1be,%eax
c0001be9:	83 ec 04             	sub    $0x4,%esp
c0001bec:	6a 40                	push   $0x40
c0001bee:	50                   	push   %eax
c0001bef:	ff 75 10             	pushl  0x10(%ebp)
c0001bf2:	e8 77 5e 00 00       	call   c0007a6e <Memcpy>
c0001bf7:	83 c4 10             	add    $0x10,%esp
c0001bfa:	c7 45 e8 05 00 00 00 	movl   $0x5,-0x18(%ebp)
c0001c01:	89 dc                	mov    %ebx,%esp
c0001c03:	90                   	nop
c0001c04:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0001c07:	c9                   	leave  
c0001c08:	c3                   	ret    

c0001c09 <partition>:
c0001c09:	55                   	push   %ebp
c0001c0a:	89 e5                	mov    %esp,%ebp
c0001c0c:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0001c12:	8b 45 0c             	mov    0xc(%ebp),%eax
c0001c15:	88 45 84             	mov    %al,-0x7c(%ebp)
c0001c18:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c0001c1c:	7f 19                	jg     c0001c37 <partition+0x2e>
c0001c1e:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0001c21:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0001c26:	89 c8                	mov    %ecx,%eax
c0001c28:	f7 ea                	imul   %edx
c0001c2a:	d1 fa                	sar    %edx
c0001c2c:	89 c8                	mov    %ecx,%eax
c0001c2e:	c1 f8 1f             	sar    $0x1f,%eax
c0001c31:	29 c2                	sub    %eax,%edx
c0001c33:	89 d0                	mov    %edx,%eax
c0001c35:	eb 11                	jmp    c0001c48 <partition+0x3f>
c0001c37:	8b 45 08             	mov    0x8(%ebp),%eax
c0001c3a:	83 e8 10             	sub    $0x10,%eax
c0001c3d:	8d 50 3f             	lea    0x3f(%eax),%edx
c0001c40:	85 c0                	test   %eax,%eax
c0001c42:	0f 48 c2             	cmovs  %edx,%eax
c0001c45:	c1 f8 06             	sar    $0x6,%eax
c0001c48:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0001c4b:	80 7d 84 00          	cmpb   $0x0,-0x7c(%ebp)
c0001c4f:	0f 85 cc 00 00 00    	jne    c0001d21 <partition+0x118>
c0001c55:	83 ec 04             	sub    $0x4,%esp
c0001c58:	6a 40                	push   $0x40
c0001c5a:	6a 00                	push   $0x0
c0001c5c:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0001c5f:	50                   	push   %eax
c0001c60:	e8 ba 9f 00 00       	call   c000bc1f <Memset>
c0001c65:	83 c4 10             	add    $0x10,%esp
c0001c68:	83 ec 04             	sub    $0x4,%esp
c0001c6b:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0001c6e:	50                   	push   %eax
c0001c6f:	6a 00                	push   $0x0
c0001c71:	ff 75 e8             	pushl  -0x18(%ebp)
c0001c74:	e8 b1 fe ff ff       	call   c0001b2a <get_partition_table>
c0001c79:	83 c4 10             	add    $0x10,%esp
c0001c7c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0001c83:	e9 8a 00 00 00       	jmp    c0001d12 <partition+0x109>
c0001c88:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001c8b:	83 c0 01             	add    $0x1,%eax
c0001c8e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0001c91:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001c94:	c1 e0 04             	shl    $0x4,%eax
c0001c97:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0001c9a:	01 c8                	add    %ecx,%eax
c0001c9c:	83 e8 5c             	sub    $0x5c,%eax
c0001c9f:	8b 00                	mov    (%eax),%eax
c0001ca1:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0001ca4:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0001ca7:	c1 e1 03             	shl    $0x3,%ecx
c0001caa:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0001cb0:	01 ca                	add    %ecx,%edx
c0001cb2:	81 c2 44 1f 01 c0    	add    $0xc0011f44,%edx
c0001cb8:	89 02                	mov    %eax,(%edx)
c0001cba:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001cbd:	c1 e0 04             	shl    $0x4,%eax
c0001cc0:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0001cc3:	01 c8                	add    %ecx,%eax
c0001cc5:	83 e8 58             	sub    $0x58,%eax
c0001cc8:	8b 00                	mov    (%eax),%eax
c0001cca:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0001ccd:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0001cd0:	c1 e1 03             	shl    $0x3,%ecx
c0001cd3:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0001cd9:	01 ca                	add    %ecx,%edx
c0001cdb:	81 c2 48 1f 01 c0    	add    $0xc0011f48,%edx
c0001ce1:	89 02                	mov    %eax,(%edx)
c0001ce3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001ce6:	c1 e0 04             	shl    $0x4,%eax
c0001ce9:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0001cec:	01 c8                	add    %ecx,%eax
c0001cee:	83 e8 60             	sub    $0x60,%eax
c0001cf1:	0f b6 00             	movzbl (%eax),%eax
c0001cf4:	3c 05                	cmp    $0x5,%al
c0001cf6:	75 16                	jne    c0001d0e <partition+0x105>
c0001cf8:	8b 55 08             	mov    0x8(%ebp),%edx
c0001cfb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0001cfe:	01 d0                	add    %edx,%eax
c0001d00:	83 ec 08             	sub    $0x8,%esp
c0001d03:	6a 01                	push   $0x1
c0001d05:	50                   	push   %eax
c0001d06:	e8 fe fe ff ff       	call   c0001c09 <partition>
c0001d0b:	83 c4 10             	add    $0x10,%esp
c0001d0e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0001d12:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c0001d16:	0f 8e 6c ff ff ff    	jle    c0001c88 <partition+0x7f>
c0001d1c:	e9 ff 00 00 00       	jmp    c0001e20 <partition+0x217>
c0001d21:	80 7d 84 01          	cmpb   $0x1,-0x7c(%ebp)
c0001d25:	0f 85 f5 00 00 00    	jne    c0001e20 <partition+0x217>
c0001d2b:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0001d2e:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0001d33:	89 c8                	mov    %ecx,%eax
c0001d35:	f7 ea                	imul   %edx
c0001d37:	d1 fa                	sar    %edx
c0001d39:	89 c8                	mov    %ecx,%eax
c0001d3b:	c1 f8 1f             	sar    $0x1f,%eax
c0001d3e:	29 c2                	sub    %eax,%edx
c0001d40:	89 d0                	mov    %edx,%eax
c0001d42:	c1 e0 02             	shl    $0x2,%eax
c0001d45:	01 d0                	add    %edx,%eax
c0001d47:	29 c1                	sub    %eax,%ecx
c0001d49:	89 c8                	mov    %ecx,%eax
c0001d4b:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0001d4e:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0001d51:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0001d54:	c1 e2 03             	shl    $0x3,%edx
c0001d57:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0001d5d:	01 d0                	add    %edx,%eax
c0001d5f:	05 44 1f 01 c0       	add    $0xc0011f44,%eax
c0001d64:	8b 00                	mov    (%eax),%eax
c0001d66:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0001d69:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0001d6c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0001d6f:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0001d72:	83 e8 01             	sub    $0x1,%eax
c0001d75:	c1 e0 04             	shl    $0x4,%eax
c0001d78:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0001d7b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0001d82:	e9 8c 00 00 00       	jmp    c0001e13 <partition+0x20a>
c0001d87:	83 ec 04             	sub    $0x4,%esp
c0001d8a:	6a 40                	push   $0x40
c0001d8c:	6a 00                	push   $0x0
c0001d8e:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0001d91:	50                   	push   %eax
c0001d92:	e8 88 9e 00 00       	call   c000bc1f <Memset>
c0001d97:	83 c4 10             	add    $0x10,%esp
c0001d9a:	83 ec 04             	sub    $0x4,%esp
c0001d9d:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0001da0:	50                   	push   %eax
c0001da1:	ff 75 f0             	pushl  -0x10(%ebp)
c0001da4:	ff 75 e8             	pushl  -0x18(%ebp)
c0001da7:	e8 7e fd ff ff       	call   c0001b2a <get_partition_table>
c0001dac:	83 c4 10             	add    $0x10,%esp
c0001daf:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0001db2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0001db5:	01 d0                	add    %edx,%eax
c0001db7:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0001dba:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0001dbd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0001dc0:	01 c2                	add    %eax,%edx
c0001dc2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0001dc5:	8d 48 04             	lea    0x4(%eax),%ecx
c0001dc8:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0001dcb:	c1 e1 03             	shl    $0x3,%ecx
c0001dce:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0001dd4:	01 c8                	add    %ecx,%eax
c0001dd6:	05 44 1f 01 c0       	add    $0xc0011f44,%eax
c0001ddb:	89 10                	mov    %edx,(%eax)
c0001ddd:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0001de0:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0001de3:	8d 4a 04             	lea    0x4(%edx),%ecx
c0001de6:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0001de9:	c1 e1 03             	shl    $0x3,%ecx
c0001dec:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0001df2:	01 ca                	add    %ecx,%edx
c0001df4:	81 c2 48 1f 01 c0    	add    $0xc0011f48,%edx
c0001dfa:	89 02                	mov    %eax,(%edx)
c0001dfc:	0f b6 45 a8          	movzbl -0x58(%ebp),%eax
c0001e00:	84 c0                	test   %al,%al
c0001e02:	74 1b                	je     c0001e1f <partition+0x216>
c0001e04:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0001e07:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0001e0a:	01 d0                	add    %edx,%eax
c0001e0c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0001e0f:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0001e13:	83 7d ec 0f          	cmpl   $0xf,-0x14(%ebp)
c0001e17:	0f 8e 6a ff ff ff    	jle    c0001d87 <partition+0x17e>
c0001e1d:	eb 01                	jmp    c0001e20 <partition+0x217>
c0001e1f:	90                   	nop
c0001e20:	90                   	nop
c0001e21:	c9                   	leave  
c0001e22:	c3                   	ret    

c0001e23 <hd_open>:
c0001e23:	55                   	push   %ebp
c0001e24:	89 e5                	mov    %esp,%ebp
c0001e26:	83 ec 18             	sub    $0x18,%esp
c0001e29:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0001e30:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001e33:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0001e39:	05 40 1f 01 c0       	add    $0xc0011f40,%eax
c0001e3e:	8b 00                	mov    (%eax),%eax
c0001e40:	8d 50 01             	lea    0x1(%eax),%edx
c0001e43:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001e46:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0001e4c:	05 40 1f 01 c0       	add    $0xc0011f40,%eax
c0001e51:	89 10                	mov    %edx,(%eax)
c0001e53:	83 ec 0c             	sub    $0xc,%esp
c0001e56:	6a 00                	push   $0x0
c0001e58:	e8 1c fa ff ff       	call   c0001879 <hd_identify>
c0001e5d:	83 c4 10             	add    $0x10,%esp
c0001e60:	83 ec 08             	sub    $0x8,%esp
c0001e63:	6a 00                	push   $0x0
c0001e65:	6a 00                	push   $0x0
c0001e67:	e8 9d fd ff ff       	call   c0001c09 <partition>
c0001e6c:	83 c4 10             	add    $0x10,%esp
c0001e6f:	83 ec 0c             	sub    $0xc,%esp
c0001e72:	6a 7c                	push   $0x7c
c0001e74:	e8 f3 05 00 00       	call   c000246c <sys_malloc>
c0001e79:	83 c4 10             	add    $0x10,%esp
c0001e7c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0001e7f:	83 ec 04             	sub    $0x4,%esp
c0001e82:	6a 7c                	push   $0x7c
c0001e84:	6a 00                	push   $0x0
c0001e86:	ff 75 f0             	pushl  -0x10(%ebp)
c0001e89:	e8 91 9d 00 00       	call   c000bc1f <Memset>
c0001e8e:	83 c4 10             	add    $0x10,%esp
c0001e91:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0001e94:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0001e9b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0001e9e:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0001ea5:	83 ec 04             	sub    $0x4,%esp
c0001ea8:	6a 02                	push   $0x2
c0001eaa:	ff 75 f0             	pushl  -0x10(%ebp)
c0001ead:	6a 01                	push   $0x1
c0001eaf:	e8 b0 7f 00 00       	call   c0009e64 <send_rec>
c0001eb4:	83 c4 10             	add    $0x10,%esp
c0001eb7:	83 ec 08             	sub    $0x8,%esp
c0001eba:	6a 7c                	push   $0x7c
c0001ebc:	ff 75 f0             	pushl  -0x10(%ebp)
c0001ebf:	e8 bd 05 00 00       	call   c0002481 <sys_free>
c0001ec4:	83 c4 10             	add    $0x10,%esp
c0001ec7:	90                   	nop
c0001ec8:	c9                   	leave  
c0001ec9:	c3                   	ret    

c0001eca <get_hd_ioctl>:
c0001eca:	55                   	push   %ebp
c0001ecb:	89 e5                	mov    %esp,%ebp
c0001ecd:	83 ec 18             	sub    $0x18,%esp
c0001ed0:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c0001ed4:	7f 19                	jg     c0001eef <get_hd_ioctl+0x25>
c0001ed6:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0001ed9:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0001ede:	89 c8                	mov    %ecx,%eax
c0001ee0:	f7 ea                	imul   %edx
c0001ee2:	d1 fa                	sar    %edx
c0001ee4:	89 c8                	mov    %ecx,%eax
c0001ee6:	c1 f8 1f             	sar    $0x1f,%eax
c0001ee9:	29 c2                	sub    %eax,%edx
c0001eeb:	89 d0                	mov    %edx,%eax
c0001eed:	eb 11                	jmp    c0001f00 <get_hd_ioctl+0x36>
c0001eef:	8b 45 08             	mov    0x8(%ebp),%eax
c0001ef2:	83 e8 10             	sub    $0x10,%eax
c0001ef5:	8d 50 3f             	lea    0x3f(%eax),%edx
c0001ef8:	85 c0                	test   %eax,%eax
c0001efa:	0f 48 c2             	cmovs  %edx,%eax
c0001efd:	c1 f8 06             	sar    $0x6,%eax
c0001f00:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0001f03:	8b 55 08             	mov    0x8(%ebp),%edx
c0001f06:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001f09:	c1 e2 03             	shl    $0x3,%edx
c0001f0c:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0001f12:	01 d0                	add    %edx,%eax
c0001f14:	05 48 1f 01 c0       	add    $0xc0011f48,%eax
c0001f19:	8b 00                	mov    (%eax),%eax
c0001f1b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0001f1e:	83 ec 0c             	sub    $0xc,%esp
c0001f21:	6a 7c                	push   $0x7c
c0001f23:	e8 44 05 00 00       	call   c000246c <sys_malloc>
c0001f28:	83 c4 10             	add    $0x10,%esp
c0001f2b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0001f2e:	83 ec 04             	sub    $0x4,%esp
c0001f31:	6a 7c                	push   $0x7c
c0001f33:	6a 00                	push   $0x0
c0001f35:	ff 75 ec             	pushl  -0x14(%ebp)
c0001f38:	e8 e2 9c 00 00       	call   c000bc1f <Memset>
c0001f3d:	83 c4 10             	add    $0x10,%esp
c0001f40:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0001f43:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0001f4a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0001f4d:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0001f54:	83 ec 04             	sub    $0x4,%esp
c0001f57:	6a 02                	push   $0x2
c0001f59:	ff 75 ec             	pushl  -0x14(%ebp)
c0001f5c:	6a 01                	push   $0x1
c0001f5e:	e8 01 7f 00 00       	call   c0009e64 <send_rec>
c0001f63:	83 c4 10             	add    $0x10,%esp
c0001f66:	83 ec 08             	sub    $0x8,%esp
c0001f69:	6a 7c                	push   $0x7c
c0001f6b:	ff 75 ec             	pushl  -0x14(%ebp)
c0001f6e:	e8 0e 05 00 00       	call   c0002481 <sys_free>
c0001f73:	83 c4 10             	add    $0x10,%esp
c0001f76:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0001f79:	c9                   	leave  
c0001f7a:	c3                   	ret    

c0001f7b <wait_for>:
c0001f7b:	55                   	push   %ebp
c0001f7c:	89 e5                	mov    %esp,%ebp
c0001f7e:	83 ec 08             	sub    $0x8,%esp
c0001f81:	83 ec 04             	sub    $0x4,%esp
c0001f84:	68 50 c3 00 00       	push   $0xc350
c0001f89:	6a 08                	push   $0x8
c0001f8b:	6a 08                	push   $0x8
c0001f8d:	e8 35 03 00 00       	call   c00022c7 <waitfor>
c0001f92:	83 c4 10             	add    $0x10,%esp
c0001f95:	85 c0                	test   %eax,%eax
c0001f97:	75 10                	jne    c0001fa9 <wait_for+0x2e>
c0001f99:	83 ec 0c             	sub    $0xc,%esp
c0001f9c:	68 c4 af 00 c0       	push   $0xc000afc4
c0001fa1:	e8 83 74 00 00       	call   c0009429 <panic>
c0001fa6:	83 c4 10             	add    $0x10,%esp
c0001fa9:	90                   	nop
c0001faa:	c9                   	leave  
c0001fab:	c3                   	ret    

c0001fac <interrupt_wait>:
c0001fac:	55                   	push   %ebp
c0001fad:	89 e5                	mov    %esp,%ebp
c0001faf:	83 ec 18             	sub    $0x18,%esp
c0001fb2:	83 ec 0c             	sub    $0xc,%esp
c0001fb5:	6a 7c                	push   $0x7c
c0001fb7:	e8 b0 04 00 00       	call   c000246c <sys_malloc>
c0001fbc:	83 c4 10             	add    $0x10,%esp
c0001fbf:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0001fc2:	83 ec 04             	sub    $0x4,%esp
c0001fc5:	6a 7c                	push   $0x7c
c0001fc7:	6a 00                	push   $0x0
c0001fc9:	ff 75 f4             	pushl  -0xc(%ebp)
c0001fcc:	e8 4e 9c 00 00       	call   c000bc1f <Memset>
c0001fd1:	83 c4 10             	add    $0x10,%esp
c0001fd4:	83 ec 04             	sub    $0x4,%esp
c0001fd7:	68 13 02 00 00       	push   $0x213
c0001fdc:	ff 75 f4             	pushl  -0xc(%ebp)
c0001fdf:	6a 02                	push   $0x2
c0001fe1:	e8 7e 7e 00 00       	call   c0009e64 <send_rec>
c0001fe6:	83 c4 10             	add    $0x10,%esp
c0001fe9:	83 ec 08             	sub    $0x8,%esp
c0001fec:	6a 7c                	push   $0x7c
c0001fee:	ff 75 f4             	pushl  -0xc(%ebp)
c0001ff1:	e8 8b 04 00 00       	call   c0002481 <sys_free>
c0001ff6:	83 c4 10             	add    $0x10,%esp
c0001ff9:	90                   	nop
c0001ffa:	c9                   	leave  
c0001ffb:	c3                   	ret    

c0001ffc <hd_rdwt>:
c0001ffc:	55                   	push   %ebp
c0001ffd:	89 e5                	mov    %esp,%ebp
c0001fff:	81 ec c8 00 00 00    	sub    $0xc8,%esp
c0002005:	8b 45 08             	mov    0x8(%ebp),%eax
c0002008:	8b 40 18             	mov    0x18(%eax),%eax
c000200b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000200e:	8b 45 08             	mov    0x8(%ebp),%eax
c0002011:	8b 40 14             	mov    0x14(%eax),%eax
c0002014:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0002017:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c000201b:	7f 19                	jg     c0002036 <hd_rdwt+0x3a>
c000201d:	8b 4d e8             	mov    -0x18(%ebp),%ecx
c0002020:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0002025:	89 c8                	mov    %ecx,%eax
c0002027:	f7 ea                	imul   %edx
c0002029:	d1 fa                	sar    %edx
c000202b:	89 c8                	mov    %ecx,%eax
c000202d:	c1 f8 1f             	sar    $0x1f,%eax
c0002030:	29 c2                	sub    %eax,%edx
c0002032:	89 d0                	mov    %edx,%eax
c0002034:	eb 11                	jmp    c0002047 <hd_rdwt+0x4b>
c0002036:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002039:	83 e8 10             	sub    $0x10,%eax
c000203c:	8d 50 3f             	lea    0x3f(%eax),%edx
c000203f:	85 c0                	test   %eax,%eax
c0002041:	0f 48 c2             	cmovs  %edx,%eax
c0002044:	c1 f8 06             	sar    $0x6,%eax
c0002047:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000204a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000204d:	8d 50 f0             	lea    -0x10(%eax),%edx
c0002050:	89 d0                	mov    %edx,%eax
c0002052:	c1 f8 1f             	sar    $0x1f,%eax
c0002055:	c1 e8 1a             	shr    $0x1a,%eax
c0002058:	01 c2                	add    %eax,%edx
c000205a:	83 e2 3f             	and    $0x3f,%edx
c000205d:	29 c2                	sub    %eax,%edx
c000205f:	89 d0                	mov    %edx,%eax
c0002061:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0002064:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002067:	c1 e8 09             	shr    $0x9,%eax
c000206a:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000206d:	83 7d e8 08          	cmpl   $0x8,-0x18(%ebp)
c0002071:	7f 1a                	jg     c000208d <hd_rdwt+0x91>
c0002073:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0002076:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002079:	c1 e2 03             	shl    $0x3,%edx
c000207c:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0002082:	01 d0                	add    %edx,%eax
c0002084:	05 44 1f 01 c0       	add    $0xc0011f44,%eax
c0002089:	8b 00                	mov    (%eax),%eax
c000208b:	eb 1b                	jmp    c00020a8 <hd_rdwt+0xac>
c000208d:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002090:	8d 50 04             	lea    0x4(%eax),%edx
c0002093:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002096:	c1 e2 03             	shl    $0x3,%edx
c0002099:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c000209f:	01 d0                	add    %edx,%eax
c00020a1:	05 44 1f 01 c0       	add    $0xc0011f44,%eax
c00020a6:	8b 00                	mov    (%eax),%eax
c00020a8:	8b 55 dc             	mov    -0x24(%ebp),%edx
c00020ab:	01 d0                	add    %edx,%eax
c00020ad:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00020b0:	8b 45 08             	mov    0x8(%ebp),%eax
c00020b3:	8b 40 0c             	mov    0xc(%eax),%eax
c00020b6:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00020b9:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00020bc:	05 ff 01 00 00       	add    $0x1ff,%eax
c00020c1:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c00020c7:	85 c0                	test   %eax,%eax
c00020c9:	0f 48 c2             	cmovs  %edx,%eax
c00020cc:	c1 f8 09             	sar    $0x9,%eax
c00020cf:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00020d2:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00020d5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00020d8:	8b 45 08             	mov    0x8(%ebp),%eax
c00020db:	8b 40 10             	mov    0x10(%eax),%eax
c00020de:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00020e1:	8b 45 08             	mov    0x8(%ebp),%eax
c00020e4:	8b 00                	mov    (%eax),%eax
c00020e6:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00020e9:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00020ec:	83 ec 08             	sub    $0x8,%esp
c00020ef:	50                   	push   %eax
c00020f0:	ff 75 d0             	pushl  -0x30(%ebp)
c00020f3:	e8 5c 4b 00 00       	call   c0006c54 <alloc_virtual_memory>
c00020f8:	83 c4 10             	add    $0x10,%esp
c00020fb:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00020fe:	8b 45 08             	mov    0x8(%ebp),%eax
c0002101:	8b 40 78             	mov    0x78(%eax),%eax
c0002104:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0002107:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c000210b:	74 22                	je     c000212f <hd_rdwt+0x133>
c000210d:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c0002111:	74 1c                	je     c000212f <hd_rdwt+0x133>
c0002113:	68 b7 01 00 00       	push   $0x1b7
c0002118:	68 14 af 00 c0       	push   $0xc000af14
c000211d:	68 14 af 00 c0       	push   $0xc000af14
c0002122:	68 d6 af 00 c0       	push   $0xc000afd6
c0002127:	e8 1b 73 00 00       	call   c0009447 <assertion_failure>
c000212c:	83 c4 10             	add    $0x10,%esp
c000212f:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
c0002133:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0002136:	88 45 be             	mov    %al,-0x42(%ebp)
c0002139:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000213c:	88 45 bf             	mov    %al,-0x41(%ebp)
c000213f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002142:	c1 f8 08             	sar    $0x8,%eax
c0002145:	88 45 c0             	mov    %al,-0x40(%ebp)
c0002148:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000214b:	c1 f8 10             	sar    $0x10,%eax
c000214e:	88 45 c1             	mov    %al,-0x3f(%ebp)
c0002151:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002154:	c1 f8 18             	sar    $0x18,%eax
c0002157:	83 e0 0f             	and    $0xf,%eax
c000215a:	83 c8 e0             	or     $0xffffffe0,%eax
c000215d:	88 45 c2             	mov    %al,-0x3e(%ebp)
c0002160:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c0002164:	75 07                	jne    c000216d <hd_rdwt+0x171>
c0002166:	b8 20 00 00 00       	mov    $0x20,%eax
c000216b:	eb 05                	jmp    c0002172 <hd_rdwt+0x176>
c000216d:	b8 30 00 00 00       	mov    $0x30,%eax
c0002172:	88 45 c3             	mov    %al,-0x3d(%ebp)
c0002175:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c0002179:	3c 20                	cmp    $0x20,%al
c000217b:	74 24                	je     c00021a1 <hd_rdwt+0x1a5>
c000217d:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c0002181:	3c 30                	cmp    $0x30,%al
c0002183:	74 1c                	je     c00021a1 <hd_rdwt+0x1a5>
c0002185:	68 c5 01 00 00       	push   $0x1c5
c000218a:	68 14 af 00 c0       	push   $0xc000af14
c000218f:	68 14 af 00 c0       	push   $0xc000af14
c0002194:	68 f4 af 00 c0       	push   $0xc000aff4
c0002199:	e8 a9 72 00 00       	call   c0009447 <assertion_failure>
c000219e:	83 c4 10             	add    $0x10,%esp
c00021a1:	83 ec 0c             	sub    $0xc,%esp
c00021a4:	8d 45 bd             	lea    -0x43(%ebp),%eax
c00021a7:	50                   	push   %eax
c00021a8:	e8 ca f5 ff ff       	call   c0001777 <hd_cmd_out>
c00021ad:	83 c4 10             	add    $0x10,%esp
c00021b0:	e9 9c 00 00 00       	jmp    c0002251 <hd_rdwt+0x255>
c00021b5:	b8 00 02 00 00       	mov    $0x200,%eax
c00021ba:	81 7d f4 00 02 00 00 	cmpl   $0x200,-0xc(%ebp)
c00021c1:	0f 4e 45 f4          	cmovle -0xc(%ebp),%eax
c00021c5:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c00021c8:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c00021cc:	75 51                	jne    c000221f <hd_rdwt+0x223>
c00021ce:	e8 a8 fd ff ff       	call   c0001f7b <wait_for>
c00021d3:	e8 d4 fd ff ff       	call   c0001fac <interrupt_wait>
c00021d8:	83 ec 04             	sub    $0x4,%esp
c00021db:	ff 75 c4             	pushl  -0x3c(%ebp)
c00021de:	6a 00                	push   $0x0
c00021e0:	68 80 21 01 c0       	push   $0xc0012180
c00021e5:	e8 35 9a 00 00       	call   c000bc1f <Memset>
c00021ea:	83 c4 10             	add    $0x10,%esp
c00021ed:	83 ec 04             	sub    $0x4,%esp
c00021f0:	68 00 02 00 00       	push   $0x200
c00021f5:	68 80 21 01 c0       	push   $0xc0012180
c00021fa:	68 f0 01 00 00       	push   $0x1f0
c00021ff:	e8 6f 9a 00 00       	call   c000bc73 <read_port>
c0002204:	83 c4 10             	add    $0x10,%esp
c0002207:	83 ec 04             	sub    $0x4,%esp
c000220a:	ff 75 c4             	pushl  -0x3c(%ebp)
c000220d:	68 80 21 01 c0       	push   $0xc0012180
c0002212:	ff 75 f0             	pushl  -0x10(%ebp)
c0002215:	e8 54 58 00 00       	call   c0007a6e <Memcpy>
c000221a:	83 c4 10             	add    $0x10,%esp
c000221d:	eb 26                	jmp    c0002245 <hd_rdwt+0x249>
c000221f:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c0002223:	75 20                	jne    c0002245 <hd_rdwt+0x249>
c0002225:	e8 51 fd ff ff       	call   c0001f7b <wait_for>
c000222a:	83 ec 04             	sub    $0x4,%esp
c000222d:	ff 75 c4             	pushl  -0x3c(%ebp)
c0002230:	ff 75 f0             	pushl  -0x10(%ebp)
c0002233:	68 f0 01 00 00       	push   $0x1f0
c0002238:	e8 4a 9a 00 00       	call   c000bc87 <write_port>
c000223d:	83 c4 10             	add    $0x10,%esp
c0002240:	e8 67 fd ff ff       	call   c0001fac <interrupt_wait>
c0002245:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0002248:	29 45 f4             	sub    %eax,-0xc(%ebp)
c000224b:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c000224e:	01 45 f0             	add    %eax,-0x10(%ebp)
c0002251:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0002255:	0f 85 5a ff ff ff    	jne    c00021b5 <hd_rdwt+0x1b9>
c000225b:	83 ec 04             	sub    $0x4,%esp
c000225e:	6a 7c                	push   $0x7c
c0002260:	6a 00                	push   $0x0
c0002262:	8d 85 40 ff ff ff    	lea    -0xc0(%ebp),%eax
c0002268:	50                   	push   %eax
c0002269:	e8 b1 99 00 00       	call   c000bc1f <Memset>
c000226e:	83 c4 10             	add    $0x10,%esp
c0002271:	c7 45 b8 65 00 00 00 	movl   $0x65,-0x48(%ebp)
c0002278:	c7 85 48 ff ff ff 00 	movl   $0x0,-0xb8(%ebp)
c000227f:	00 00 00 
c0002282:	83 ec 04             	sub    $0x4,%esp
c0002285:	6a 02                	push   $0x2
c0002287:	8d 85 40 ff ff ff    	lea    -0xc0(%ebp),%eax
c000228d:	50                   	push   %eax
c000228e:	6a 01                	push   $0x1
c0002290:	e8 cf 7b 00 00       	call   c0009e64 <send_rec>
c0002295:	83 c4 10             	add    $0x10,%esp
c0002298:	90                   	nop
c0002299:	c9                   	leave  
c000229a:	c3                   	ret    

c000229b <hd_handler>:
c000229b:	55                   	push   %ebp
c000229c:	89 e5                	mov    %esp,%ebp
c000229e:	83 ec 18             	sub    $0x18,%esp
c00022a1:	83 ec 0c             	sub    $0xc,%esp
c00022a4:	68 f7 01 00 00       	push   $0x1f7
c00022a9:	e8 df ef ff ff       	call   c000128d <in_byte>
c00022ae:	83 c4 10             	add    $0x10,%esp
c00022b1:	0f b6 c0             	movzbl %al,%eax
c00022b4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00022b7:	83 ec 0c             	sub    $0xc,%esp
c00022ba:	6a 03                	push   $0x3
c00022bc:	e8 3d 7e 00 00       	call   c000a0fe <inform_int>
c00022c1:	83 c4 10             	add    $0x10,%esp
c00022c4:	90                   	nop
c00022c5:	c9                   	leave  
c00022c6:	c3                   	ret    

c00022c7 <waitfor>:
c00022c7:	55                   	push   %ebp
c00022c8:	89 e5                	mov    %esp,%ebp
c00022ca:	83 ec 18             	sub    $0x18,%esp
c00022cd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00022d4:	eb 26                	jmp    c00022fc <waitfor+0x35>
c00022d6:	83 ec 0c             	sub    $0xc,%esp
c00022d9:	68 f7 01 00 00       	push   $0x1f7
c00022de:	e8 aa ef ff ff       	call   c000128d <in_byte>
c00022e3:	83 c4 10             	add    $0x10,%esp
c00022e6:	0f b6 c0             	movzbl %al,%eax
c00022e9:	23 45 08             	and    0x8(%ebp),%eax
c00022ec:	39 45 0c             	cmp    %eax,0xc(%ebp)
c00022ef:	75 07                	jne    c00022f8 <waitfor+0x31>
c00022f1:	b8 01 00 00 00       	mov    $0x1,%eax
c00022f6:	eb 11                	jmp    c0002309 <waitfor+0x42>
c00022f8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00022fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00022ff:	3b 45 10             	cmp    0x10(%ebp),%eax
c0002302:	7c d2                	jl     c00022d6 <waitfor+0xf>
c0002304:	b8 00 00 00 00       	mov    $0x0,%eax
c0002309:	c9                   	leave  
c000230a:	c3                   	ret    

c000230b <print_hd_info>:
c000230b:	55                   	push   %ebp
c000230c:	89 e5                	mov    %esp,%ebp
c000230e:	83 ec 18             	sub    $0x18,%esp
c0002311:	83 ec 0c             	sub    $0xc,%esp
c0002314:	68 28 b0 00 c0       	push   $0xc000b028
c0002319:	e8 cc 6d 00 00       	call   c00090ea <Printf>
c000231e:	83 c4 10             	add    $0x10,%esp
c0002321:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0002328:	eb 3b                	jmp    c0002365 <print_hd_info+0x5a>
c000232a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000232d:	8b 04 c5 48 1f 01 c0 	mov    -0x3ffee0b8(,%eax,8),%eax
c0002334:	85 c0                	test   %eax,%eax
c0002336:	74 28                	je     c0002360 <print_hd_info+0x55>
c0002338:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000233b:	8b 14 c5 48 1f 01 c0 	mov    -0x3ffee0b8(,%eax,8),%edx
c0002342:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002345:	8b 04 c5 44 1f 01 c0 	mov    -0x3ffee0bc(,%eax,8),%eax
c000234c:	ff 75 f4             	pushl  -0xc(%ebp)
c000234f:	52                   	push   %edx
c0002350:	50                   	push   %eax
c0002351:	68 45 b0 00 c0       	push   $0xc000b045
c0002356:	e8 8f 6d 00 00       	call   c00090ea <Printf>
c000235b:	83 c4 10             	add    $0x10,%esp
c000235e:	eb 01                	jmp    c0002361 <print_hd_info+0x56>
c0002360:	90                   	nop
c0002361:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0002365:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c0002369:	7e bf                	jle    c000232a <print_hd_info+0x1f>
c000236b:	83 ec 0c             	sub    $0xc,%esp
c000236e:	68 5d b0 00 c0       	push   $0xc000b05d
c0002373:	e8 72 6d 00 00       	call   c00090ea <Printf>
c0002378:	83 c4 10             	add    $0x10,%esp
c000237b:	83 ec 0c             	sub    $0xc,%esp
c000237e:	68 78 b0 00 c0       	push   $0xc000b078
c0002383:	e8 62 6d 00 00       	call   c00090ea <Printf>
c0002388:	83 c4 10             	add    $0x10,%esp
c000238b:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%ebp)
c0002392:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0002399:	eb 44                	jmp    c00023df <print_hd_info+0xd4>
c000239b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000239e:	83 c0 04             	add    $0x4,%eax
c00023a1:	8b 04 c5 48 1f 01 c0 	mov    -0x3ffee0b8(,%eax,8),%eax
c00023a8:	85 c0                	test   %eax,%eax
c00023aa:	74 2e                	je     c00023da <print_hd_info+0xcf>
c00023ac:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00023af:	83 c0 04             	add    $0x4,%eax
c00023b2:	8b 14 c5 48 1f 01 c0 	mov    -0x3ffee0b8(,%eax,8),%edx
c00023b9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00023bc:	83 c0 04             	add    $0x4,%eax
c00023bf:	8b 04 c5 44 1f 01 c0 	mov    -0x3ffee0bc(,%eax,8),%eax
c00023c6:	ff 75 f0             	pushl  -0x10(%ebp)
c00023c9:	52                   	push   %edx
c00023ca:	50                   	push   %eax
c00023cb:	68 45 b0 00 c0       	push   $0xc000b045
c00023d0:	e8 15 6d 00 00       	call   c00090ea <Printf>
c00023d5:	83 c4 10             	add    $0x10,%esp
c00023d8:	eb 01                	jmp    c00023db <print_hd_info+0xd0>
c00023da:	90                   	nop
c00023db:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00023df:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c00023e3:	7e b6                	jle    c000239b <print_hd_info+0x90>
c00023e5:	83 ec 0c             	sub    $0xc,%esp
c00023e8:	68 95 b0 00 c0       	push   $0xc000b095
c00023ed:	e8 f8 6c 00 00       	call   c00090ea <Printf>
c00023f2:	83 c4 10             	add    $0x10,%esp
c00023f5:	90                   	nop
c00023f6:	c9                   	leave  
c00023f7:	c3                   	ret    

c00023f8 <is_empty>:
c00023f8:	55                   	push   %ebp
c00023f9:	89 e5                	mov    %esp,%ebp
c00023fb:	83 ec 10             	sub    $0x10,%esp
c00023fe:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0002405:	eb 1a                	jmp    c0002421 <is_empty+0x29>
c0002407:	8b 55 fc             	mov    -0x4(%ebp),%edx
c000240a:	8b 45 08             	mov    0x8(%ebp),%eax
c000240d:	01 d0                	add    %edx,%eax
c000240f:	0f b6 00             	movzbl (%eax),%eax
c0002412:	84 c0                	test   %al,%al
c0002414:	74 07                	je     c000241d <is_empty+0x25>
c0002416:	b8 00 00 00 00       	mov    $0x0,%eax
c000241b:	eb 11                	jmp    c000242e <is_empty+0x36>
c000241d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0002421:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0002424:	3b 45 0c             	cmp    0xc(%ebp),%eax
c0002427:	7c de                	jl     c0002407 <is_empty+0xf>
c0002429:	b8 01 00 00 00       	mov    $0x1,%eax
c000242e:	c9                   	leave  
c000242f:	c3                   	ret    

c0002430 <write_debug>:
c0002430:	b8 02 00 00 00       	mov    $0x2,%eax
c0002435:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0002439:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c000243d:	cd 90                	int    $0x90
c000243f:	c3                   	ret    

c0002440 <send_msg>:
c0002440:	55                   	push   %ebp
c0002441:	89 e5                	mov    %esp,%ebp
c0002443:	53                   	push   %ebx
c0002444:	51                   	push   %ecx
c0002445:	b8 03 00 00 00       	mov    $0x3,%eax
c000244a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c000244d:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0002450:	cd 90                	int    $0x90
c0002452:	59                   	pop    %ecx
c0002453:	5b                   	pop    %ebx
c0002454:	5d                   	pop    %ebp
c0002455:	c3                   	ret    

c0002456 <receive_msg>:
c0002456:	55                   	push   %ebp
c0002457:	89 e5                	mov    %esp,%ebp
c0002459:	53                   	push   %ebx
c000245a:	51                   	push   %ecx
c000245b:	b8 04 00 00 00       	mov    $0x4,%eax
c0002460:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c0002463:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0002466:	cd 90                	int    $0x90
c0002468:	59                   	pop    %ecx
c0002469:	5b                   	pop    %ebx
c000246a:	5d                   	pop    %ebp
c000246b:	c3                   	ret    

c000246c <sys_malloc>:
c000246c:	56                   	push   %esi
c000246d:	57                   	push   %edi
c000246e:	53                   	push   %ebx
c000246f:	55                   	push   %ebp
c0002470:	89 e5                	mov    %esp,%ebp
c0002472:	b8 05 00 00 00       	mov    $0x5,%eax
c0002477:	8b 4d 14             	mov    0x14(%ebp),%ecx
c000247a:	cd 90                	int    $0x90
c000247c:	5d                   	pop    %ebp
c000247d:	5b                   	pop    %ebx
c000247e:	5f                   	pop    %edi
c000247f:	5e                   	pop    %esi
c0002480:	c3                   	ret    

c0002481 <sys_free>:
c0002481:	56                   	push   %esi
c0002482:	57                   	push   %edi
c0002483:	53                   	push   %ebx
c0002484:	55                   	push   %ebp
c0002485:	89 e5                	mov    %esp,%ebp
c0002487:	b8 06 00 00 00       	mov    $0x6,%eax
c000248c:	8b 4d 14             	mov    0x14(%ebp),%ecx
c000248f:	8b 5d 18             	mov    0x18(%ebp),%ebx
c0002492:	cd 90                	int    $0x90
c0002494:	5d                   	pop    %ebp
c0002495:	5b                   	pop    %ebx
c0002496:	5f                   	pop    %edi
c0002497:	5e                   	pop    %esi
c0002498:	c3                   	ret    

c0002499 <task_fs>:
c0002499:	55                   	push   %ebp
c000249a:	89 e5                	mov    %esp,%ebp
c000249c:	83 ec 28             	sub    $0x28,%esp
c000249f:	e8 bb 08 00 00       	call   c0002d5f <init_fs>
c00024a4:	83 ec 0c             	sub    $0xc,%esp
c00024a7:	6a 7c                	push   $0x7c
c00024a9:	e8 be ff ff ff       	call   c000246c <sys_malloc>
c00024ae:	83 c4 10             	add    $0x10,%esp
c00024b1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00024b4:	83 ec 0c             	sub    $0xc,%esp
c00024b7:	6a 7c                	push   $0x7c
c00024b9:	e8 ae ff ff ff       	call   c000246c <sys_malloc>
c00024be:	83 c4 10             	add    $0x10,%esp
c00024c1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00024c4:	83 ec 04             	sub    $0x4,%esp
c00024c7:	6a 7c                	push   $0x7c
c00024c9:	6a 00                	push   $0x0
c00024cb:	ff 75 f4             	pushl  -0xc(%ebp)
c00024ce:	e8 4c 97 00 00       	call   c000bc1f <Memset>
c00024d3:	83 c4 10             	add    $0x10,%esp
c00024d6:	83 ec 04             	sub    $0x4,%esp
c00024d9:	6a 12                	push   $0x12
c00024db:	ff 75 f4             	pushl  -0xc(%ebp)
c00024de:	6a 02                	push   $0x2
c00024e0:	e8 7f 79 00 00       	call   c0009e64 <send_rec>
c00024e5:	83 c4 10             	add    $0x10,%esp
c00024e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00024eb:	8b 40 78             	mov    0x78(%eax),%eax
c00024ee:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00024f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00024f4:	8b 00                	mov    (%eax),%eax
c00024f6:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00024f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00024fc:	8b 40 50             	mov    0x50(%eax),%eax
c00024ff:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0002502:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002505:	8b 40 68             	mov    0x68(%eax),%eax
c0002508:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000250b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000250e:	8b 00                	mov    (%eax),%eax
c0002510:	85 c0                	test   %eax,%eax
c0002512:	75 07                	jne    c000251b <task_fs+0x82>
c0002514:	c7 45 dc 05 00 00 00 	movl   $0x5,-0x24(%ebp)
c000251b:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0002522:	83 ec 0c             	sub    $0xc,%esp
c0002525:	ff 75 e8             	pushl  -0x18(%ebp)
c0002528:	e8 ef 20 00 00       	call   c000461c <pid2proc>
c000252d:	83 c4 10             	add    $0x10,%esp
c0002530:	a3 c8 0b 01 c0       	mov    %eax,0xc0010bc8
c0002535:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0002539:	74 37                	je     c0002572 <task_fs+0xd9>
c000253b:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
c000253f:	74 31                	je     c0002572 <task_fs+0xd9>
c0002541:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c0002545:	74 2b                	je     c0002572 <task_fs+0xd9>
c0002547:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
c000254b:	74 25                	je     c0002572 <task_fs+0xd9>
c000254d:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
c0002551:	74 1f                	je     c0002572 <task_fs+0xd9>
c0002553:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
c0002557:	74 19                	je     c0002572 <task_fs+0xd9>
c0002559:	6a 7a                	push   $0x7a
c000255b:	68 b4 b0 00 c0       	push   $0xc000b0b4
c0002560:	68 b4 b0 00 c0       	push   $0xc000b0b4
c0002565:	68 c4 b0 00 c0       	push   $0xc000b0c4
c000256a:	e8 d8 6e 00 00       	call   c0009447 <assertion_failure>
c000256f:	83 c4 10             	add    $0x10,%esp
c0002572:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c0002576:	74 3a                	je     c00025b2 <task_fs+0x119>
c0002578:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c000257c:	7f 19                	jg     c0002597 <task_fs+0xfe>
c000257e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0002582:	0f 84 10 01 00 00    	je     c0002698 <task_fs+0x1ff>
c0002588:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
c000258c:	0f 84 a1 00 00 00    	je     c0002633 <task_fs+0x19a>
c0002592:	e9 ef 00 00 00       	jmp    c0002686 <task_fs+0x1ed>
c0002597:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
c000259b:	74 50                	je     c00025ed <task_fs+0x154>
c000259d:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
c00025a1:	0f 84 c6 00 00 00    	je     c000266d <task_fs+0x1d4>
c00025a7:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
c00025ab:	74 40                	je     c00025ed <task_fs+0x154>
c00025ad:	e9 d4 00 00 00       	jmp    c0002686 <task_fs+0x1ed>
c00025b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00025b5:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c00025bc:	83 ec 0c             	sub    $0xc,%esp
c00025bf:	ff 75 f4             	pushl  -0xc(%ebp)
c00025c2:	e8 ec 07 00 00       	call   c0002db3 <do_open>
c00025c7:	83 c4 10             	add    $0x10,%esp
c00025ca:	89 c2                	mov    %eax,%edx
c00025cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00025cf:	89 50 50             	mov    %edx,0x50(%eax)
c00025d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00025d5:	8b 00                	mov    (%eax),%eax
c00025d7:	83 ec 04             	sub    $0x4,%esp
c00025da:	50                   	push   %eax
c00025db:	ff 75 f4             	pushl  -0xc(%ebp)
c00025de:	6a 01                	push   $0x1
c00025e0:	e8 7f 78 00 00       	call   c0009e64 <send_rec>
c00025e5:	83 c4 10             	add    $0x10,%esp
c00025e8:	e9 b2 00 00 00       	jmp    c000269f <task_fs+0x206>
c00025ed:	83 ec 0c             	sub    $0xc,%esp
c00025f0:	ff 75 f4             	pushl  -0xc(%ebp)
c00025f3:	e8 f9 18 00 00       	call   c0003ef1 <do_rdwt>
c00025f8:	83 c4 10             	add    $0x10,%esp
c00025fb:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00025fe:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
c0002602:	0f 84 96 00 00 00    	je     c000269e <task_fs+0x205>
c0002608:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000260b:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0002612:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0002615:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002618:	89 50 60             	mov    %edx,0x60(%eax)
c000261b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000261e:	8b 00                	mov    (%eax),%eax
c0002620:	83 ec 04             	sub    $0x4,%esp
c0002623:	50                   	push   %eax
c0002624:	ff 75 f4             	pushl  -0xc(%ebp)
c0002627:	6a 01                	push   $0x1
c0002629:	e8 36 78 00 00       	call   c0009e64 <send_rec>
c000262e:	83 c4 10             	add    $0x10,%esp
c0002631:	eb 6b                	jmp    c000269e <task_fs+0x205>
c0002633:	83 ec 0c             	sub    $0xc,%esp
c0002636:	ff 75 e4             	pushl  -0x1c(%ebp)
c0002639:	e8 d0 1d 00 00       	call   c000440e <do_close>
c000263e:	83 c4 10             	add    $0x10,%esp
c0002641:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002644:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c000264b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000264e:	c7 40 58 00 00 00 00 	movl   $0x0,0x58(%eax)
c0002655:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002658:	8b 00                	mov    (%eax),%eax
c000265a:	83 ec 04             	sub    $0x4,%esp
c000265d:	50                   	push   %eax
c000265e:	ff 75 f4             	pushl  -0xc(%ebp)
c0002661:	6a 01                	push   $0x1
c0002663:	e8 fc 77 00 00       	call   c0009e64 <send_rec>
c0002668:	83 c4 10             	add    $0x10,%esp
c000266b:	eb 32                	jmp    c000269f <task_fs+0x206>
c000266d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002670:	8b 40 68             	mov    0x68(%eax),%eax
c0002673:	83 ec 04             	sub    $0x4,%esp
c0002676:	50                   	push   %eax
c0002677:	ff 75 f4             	pushl  -0xc(%ebp)
c000267a:	6a 01                	push   $0x1
c000267c:	e8 e3 77 00 00       	call   c0009e64 <send_rec>
c0002681:	83 c4 10             	add    $0x10,%esp
c0002684:	eb 19                	jmp    c000269f <task_fs+0x206>
c0002686:	83 ec 0c             	sub    $0xc,%esp
c0002689:	68 27 b1 00 c0       	push   $0xc000b127
c000268e:	e8 96 6d 00 00       	call   c0009429 <panic>
c0002693:	83 c4 10             	add    $0x10,%esp
c0002696:	eb 07                	jmp    c000269f <task_fs+0x206>
c0002698:	90                   	nop
c0002699:	e9 26 fe ff ff       	jmp    c00024c4 <task_fs+0x2b>
c000269e:	90                   	nop
c000269f:	e9 20 fe ff ff       	jmp    c00024c4 <task_fs+0x2b>

c00026a4 <rd_wt>:
c00026a4:	55                   	push   %ebp
c00026a5:	89 e5                	mov    %esp,%ebp
c00026a7:	83 ec 18             	sub    $0x18,%esp
c00026aa:	83 ec 0c             	sub    $0xc,%esp
c00026ad:	6a 7c                	push   $0x7c
c00026af:	e8 b8 fd ff ff       	call   c000246c <sys_malloc>
c00026b4:	83 c4 10             	add    $0x10,%esp
c00026b7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00026ba:	83 ec 04             	sub    $0x4,%esp
c00026bd:	6a 7c                	push   $0x7c
c00026bf:	6a 00                	push   $0x0
c00026c1:	ff 75 f4             	pushl  -0xc(%ebp)
c00026c4:	e8 56 95 00 00       	call   c000bc1f <Memset>
c00026c9:	83 c4 10             	add    $0x10,%esp
c00026cc:	8b 55 18             	mov    0x18(%ebp),%edx
c00026cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00026d2:	89 50 78             	mov    %edx,0x78(%eax)
c00026d5:	8b 55 0c             	mov    0xc(%ebp),%edx
c00026d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00026db:	89 50 14             	mov    %edx,0x14(%eax)
c00026de:	8b 55 10             	mov    0x10(%ebp),%edx
c00026e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00026e4:	89 50 10             	mov    %edx,0x10(%eax)
c00026e7:	8b 55 14             	mov    0x14(%ebp),%edx
c00026ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00026ed:	89 50 0c             	mov    %edx,0xc(%eax)
c00026f0:	8b 45 08             	mov    0x8(%ebp),%eax
c00026f3:	c1 e0 09             	shl    $0x9,%eax
c00026f6:	89 c2                	mov    %eax,%edx
c00026f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00026fb:	89 50 18             	mov    %edx,0x18(%eax)
c00026fe:	83 7d 18 07          	cmpl   $0x7,0x18(%ebp)
c0002702:	74 22                	je     c0002726 <rd_wt+0x82>
c0002704:	83 7d 18 0a          	cmpl   $0xa,0x18(%ebp)
c0002708:	74 1c                	je     c0002726 <rd_wt+0x82>
c000270a:	68 b1 00 00 00       	push   $0xb1
c000270f:	68 b4 b0 00 c0       	push   $0xc000b0b4
c0002714:	68 b4 b0 00 c0       	push   $0xc000b0b4
c0002719:	68 3a b1 00 c0       	push   $0xc000b13a
c000271e:	e8 24 6d 00 00       	call   c0009447 <assertion_failure>
c0002723:	83 c4 10             	add    $0x10,%esp
c0002726:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002729:	8b 40 78             	mov    0x78(%eax),%eax
c000272c:	83 f8 07             	cmp    $0x7,%eax
c000272f:	74 27                	je     c0002758 <rd_wt+0xb4>
c0002731:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002734:	8b 40 78             	mov    0x78(%eax),%eax
c0002737:	83 f8 0a             	cmp    $0xa,%eax
c000273a:	74 1c                	je     c0002758 <rd_wt+0xb4>
c000273c:	68 b2 00 00 00       	push   $0xb2
c0002741:	68 b4 b0 00 c0       	push   $0xc000b0b4
c0002746:	68 b4 b0 00 c0       	push   $0xc000b0b4
c000274b:	68 58 b1 00 c0       	push   $0xc000b158
c0002750:	e8 f2 6c 00 00       	call   c0009447 <assertion_failure>
c0002755:	83 c4 10             	add    $0x10,%esp
c0002758:	83 ec 04             	sub    $0x4,%esp
c000275b:	6a 03                	push   $0x3
c000275d:	ff 75 f4             	pushl  -0xc(%ebp)
c0002760:	6a 03                	push   $0x3
c0002762:	e8 fd 76 00 00       	call   c0009e64 <send_rec>
c0002767:	83 c4 10             	add    $0x10,%esp
c000276a:	83 ec 08             	sub    $0x8,%esp
c000276d:	6a 7c                	push   $0x7c
c000276f:	ff 75 f4             	pushl  -0xc(%ebp)
c0002772:	e8 0a fd ff ff       	call   c0002481 <sys_free>
c0002777:	83 c4 10             	add    $0x10,%esp
c000277a:	90                   	nop
c000277b:	c9                   	leave  
c000277c:	c3                   	ret    

c000277d <mkfs>:
c000277d:	55                   	push   %ebp
c000277e:	89 e5                	mov    %esp,%ebp
c0002780:	57                   	push   %edi
c0002781:	81 ec d4 00 00 00    	sub    $0xd4,%esp
c0002787:	83 ec 0c             	sub    $0xc,%esp
c000278a:	68 00 80 00 00       	push   $0x8000
c000278f:	e8 d8 fc ff ff       	call   c000246c <sys_malloc>
c0002794:	83 c4 10             	add    $0x10,%esp
c0002797:	a3 a4 31 01 c0       	mov    %eax,0xc00131a4
c000279c:	83 ec 0c             	sub    $0xc,%esp
c000279f:	6a 24                	push   $0x24
c00027a1:	e8 c6 fc ff ff       	call   c000246c <sys_malloc>
c00027a6:	83 c4 10             	add    $0x10,%esp
c00027a9:	a3 a0 31 01 c0       	mov    %eax,0xc00131a0
c00027ae:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c00027b3:	83 ec 0c             	sub    $0xc,%esp
c00027b6:	50                   	push   %eax
c00027b7:	e8 e2 45 00 00       	call   c0006d9e <get_physical_address>
c00027bc:	83 c4 10             	add    $0x10,%esp
c00027bf:	a3 84 27 01 c0       	mov    %eax,0xc0012784
c00027c4:	a1 a0 31 01 c0       	mov    0xc00131a0,%eax
c00027c9:	83 ec 0c             	sub    $0xc,%esp
c00027cc:	50                   	push   %eax
c00027cd:	e8 cc 45 00 00       	call   c0006d9e <get_physical_address>
c00027d2:	83 c4 10             	add    $0x10,%esp
c00027d5:	a3 80 27 01 c0       	mov    %eax,0xc0012780
c00027da:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c00027df:	83 ec 04             	sub    $0x4,%esp
c00027e2:	68 00 02 00 00       	push   $0x200
c00027e7:	6a 00                	push   $0x0
c00027e9:	50                   	push   %eax
c00027ea:	e8 30 94 00 00       	call   c000bc1f <Memset>
c00027ef:	83 c4 10             	add    $0x10,%esp
c00027f2:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00027f7:	83 ec 0c             	sub    $0xc,%esp
c00027fa:	6a 0a                	push   $0xa
c00027fc:	68 00 02 00 00       	push   $0x200
c0002801:	50                   	push   %eax
c0002802:	6a 20                	push   $0x20
c0002804:	6a 00                	push   $0x0
c0002806:	e8 99 fe ff ff       	call   c00026a4 <rd_wt>
c000280b:	83 c4 20             	add    $0x20,%esp
c000280e:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002813:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0002816:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002819:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c0002820:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002823:	c7 40 10 00 08 00 00 	movl   $0x800,0x10(%eax)
c000282a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000282d:	c7 40 08 00 08 00 00 	movl   $0x800,0x8(%eax)
c0002834:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002837:	c7 40 0c 00 01 00 00 	movl   $0x100,0xc(%eax)
c000283e:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002841:	8b 40 04             	mov    0x4(%eax),%eax
c0002844:	8d 50 02             	lea    0x2(%eax),%edx
c0002847:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000284a:	8b 40 08             	mov    0x8(%eax),%eax
c000284d:	01 c2                	add    %eax,%edx
c000284f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002852:	8b 40 0c             	mov    0xc(%eax),%eax
c0002855:	01 c2                	add    %eax,%edx
c0002857:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000285a:	89 10                	mov    %edx,(%eax)
c000285c:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c0002863:	b8 00 02 00 00       	mov    $0x200,%eax
c0002868:	2b 45 d8             	sub    -0x28(%ebp),%eax
c000286b:	8b 0d a4 31 01 c0    	mov    0xc00131a4,%ecx
c0002871:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0002874:	01 ca                	add    %ecx,%edx
c0002876:	83 ec 04             	sub    $0x4,%esp
c0002879:	50                   	push   %eax
c000287a:	6a 80                	push   $0xffffff80
c000287c:	52                   	push   %edx
c000287d:	e8 9d 93 00 00       	call   c000bc1f <Memset>
c0002882:	83 c4 10             	add    $0x10,%esp
c0002885:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c000288a:	83 ec 0c             	sub    $0xc,%esp
c000288d:	6a 0a                	push   $0xa
c000288f:	68 00 02 00 00       	push   $0x200
c0002894:	50                   	push   %eax
c0002895:	6a 20                	push   $0x20
c0002897:	6a 01                	push   $0x1
c0002899:	e8 06 fe ff ff       	call   c00026a4 <rd_wt>
c000289e:	83 c4 20             	add    $0x20,%esp
c00028a1:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00028a4:	8b 10                	mov    (%eax),%edx
c00028a6:	89 55 98             	mov    %edx,-0x68(%ebp)
c00028a9:	8b 50 04             	mov    0x4(%eax),%edx
c00028ac:	89 55 9c             	mov    %edx,-0x64(%ebp)
c00028af:	8b 50 08             	mov    0x8(%eax),%edx
c00028b2:	89 55 a0             	mov    %edx,-0x60(%ebp)
c00028b5:	8b 50 0c             	mov    0xc(%eax),%edx
c00028b8:	89 55 a4             	mov    %edx,-0x5c(%ebp)
c00028bb:	8b 50 10             	mov    0x10(%eax),%edx
c00028be:	89 55 a8             	mov    %edx,-0x58(%ebp)
c00028c1:	8b 50 14             	mov    0x14(%eax),%edx
c00028c4:	89 55 ac             	mov    %edx,-0x54(%ebp)
c00028c7:	8b 50 18             	mov    0x18(%eax),%edx
c00028ca:	89 55 b0             	mov    %edx,-0x50(%ebp)
c00028cd:	8b 50 1c             	mov    0x1c(%eax),%edx
c00028d0:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c00028d3:	8b 40 20             	mov    0x20(%eax),%eax
c00028d6:	89 45 b8             	mov    %eax,-0x48(%ebp)
c00028d9:	c6 45 d7 3f          	movb   $0x3f,-0x29(%ebp)
c00028dd:	0f be 55 d7          	movsbl -0x29(%ebp),%edx
c00028e1:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c00028e6:	83 ec 04             	sub    $0x4,%esp
c00028e9:	6a 01                	push   $0x1
c00028eb:	52                   	push   %edx
c00028ec:	50                   	push   %eax
c00028ed:	e8 2d 93 00 00       	call   c000bc1f <Memset>
c00028f2:	83 c4 10             	add    $0x10,%esp
c00028f5:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c00028fa:	83 c0 01             	add    $0x1,%eax
c00028fd:	83 ec 04             	sub    $0x4,%esp
c0002900:	68 ff 01 00 00       	push   $0x1ff
c0002905:	6a 80                	push   $0xffffff80
c0002907:	50                   	push   %eax
c0002908:	e8 12 93 00 00       	call   c000bc1f <Memset>
c000290d:	83 c4 10             	add    $0x10,%esp
c0002910:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002915:	83 ec 0c             	sub    $0xc,%esp
c0002918:	6a 0a                	push   $0xa
c000291a:	68 00 02 00 00       	push   $0x200
c000291f:	50                   	push   %eax
c0002920:	6a 20                	push   $0x20
c0002922:	6a 02                	push   $0x2
c0002924:	e8 7b fd ff ff       	call   c00026a4 <rd_wt>
c0002929:	83 c4 20             	add    $0x20,%esp
c000292c:	c7 45 d0 03 00 00 00 	movl   $0x3,-0x30(%ebp)
c0002933:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002938:	83 ec 04             	sub    $0x4,%esp
c000293b:	68 00 02 00 00       	push   $0x200
c0002940:	6a ff                	push   $0xffffffff
c0002942:	50                   	push   %eax
c0002943:	e8 d7 92 00 00       	call   c000bc1f <Memset>
c0002948:	83 c4 10             	add    $0x10,%esp
c000294b:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002950:	83 ec 0c             	sub    $0xc,%esp
c0002953:	6a 0a                	push   $0xa
c0002955:	68 00 02 00 00       	push   $0x200
c000295a:	50                   	push   %eax
c000295b:	6a 20                	push   $0x20
c000295d:	ff 75 d0             	pushl  -0x30(%ebp)
c0002960:	e8 3f fd ff ff       	call   c00026a4 <rd_wt>
c0002965:	83 c4 20             	add    $0x20,%esp
c0002968:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c000296d:	83 ec 04             	sub    $0x4,%esp
c0002970:	6a 01                	push   $0x1
c0002972:	6a 01                	push   $0x1
c0002974:	50                   	push   %eax
c0002975:	e8 a5 92 00 00       	call   c000bc1f <Memset>
c000297a:	83 c4 10             	add    $0x10,%esp
c000297d:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002982:	83 c0 01             	add    $0x1,%eax
c0002985:	83 ec 04             	sub    $0x4,%esp
c0002988:	68 ff 01 00 00       	push   $0x1ff
c000298d:	6a 00                	push   $0x0
c000298f:	50                   	push   %eax
c0002990:	e8 8a 92 00 00       	call   c000bc1f <Memset>
c0002995:	83 c4 10             	add    $0x10,%esp
c0002998:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c000299d:	89 c2                	mov    %eax,%edx
c000299f:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00029a2:	83 c0 01             	add    $0x1,%eax
c00029a5:	83 ec 0c             	sub    $0xc,%esp
c00029a8:	6a 0a                	push   $0xa
c00029aa:	68 00 02 00 00       	push   $0x200
c00029af:	52                   	push   %edx
c00029b0:	6a 20                	push   $0x20
c00029b2:	50                   	push   %eax
c00029b3:	e8 ec fc ff ff       	call   c00026a4 <rd_wt>
c00029b8:	83 c4 20             	add    $0x20,%esp
c00029bb:	8b 45 a0             	mov    -0x60(%ebp),%eax
c00029be:	83 e8 02             	sub    $0x2,%eax
c00029c1:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00029c4:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c00029cb:	eb 04                	jmp    c00029d1 <mkfs+0x254>
c00029cd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00029d1:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00029d4:	83 c0 01             	add    $0x1,%eax
c00029d7:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c00029da:	7e f1                	jle    c00029cd <mkfs+0x250>
c00029dc:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00029e1:	89 c2                	mov    %eax,%edx
c00029e3:	8b 45 a0             	mov    -0x60(%ebp),%eax
c00029e6:	83 c0 03             	add    $0x3,%eax
c00029e9:	83 ec 0c             	sub    $0xc,%esp
c00029ec:	6a 0a                	push   $0xa
c00029ee:	68 00 02 00 00       	push   $0x200
c00029f3:	52                   	push   %edx
c00029f4:	6a 20                	push   $0x20
c00029f6:	50                   	push   %eax
c00029f7:	e8 a8 fc ff ff       	call   c00026a4 <rd_wt>
c00029fc:	83 c4 20             	add    $0x20,%esp
c00029ff:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002a04:	89 c2                	mov    %eax,%edx
c0002a06:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002a09:	83 c0 03             	add    $0x3,%eax
c0002a0c:	83 ec 0c             	sub    $0xc,%esp
c0002a0f:	6a 07                	push   $0x7
c0002a11:	68 00 02 00 00       	push   $0x200
c0002a16:	52                   	push   %edx
c0002a17:	6a 20                	push   $0x20
c0002a19:	50                   	push   %eax
c0002a1a:	e8 85 fc ff ff       	call   c00026a4 <rd_wt>
c0002a1f:	83 c4 20             	add    $0x20,%esp
c0002a22:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002a27:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0002a2a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002a2d:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0002a33:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002a36:	c7 40 04 50 00 00 00 	movl   $0x50,0x4(%eax)
c0002a3d:	8b 55 98             	mov    -0x68(%ebp),%edx
c0002a40:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002a43:	89 50 08             	mov    %edx,0x8(%eax)
c0002a46:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002a49:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0002a50:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002a53:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c0002a5a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002a5d:	8b 10                	mov    (%eax),%edx
c0002a5f:	89 15 c0 31 01 c0    	mov    %edx,0xc00131c0
c0002a65:	8b 50 04             	mov    0x4(%eax),%edx
c0002a68:	89 15 c4 31 01 c0    	mov    %edx,0xc00131c4
c0002a6e:	8b 50 08             	mov    0x8(%eax),%edx
c0002a71:	89 15 c8 31 01 c0    	mov    %edx,0xc00131c8
c0002a77:	8b 50 0c             	mov    0xc(%eax),%edx
c0002a7a:	89 15 cc 31 01 c0    	mov    %edx,0xc00131cc
c0002a80:	8b 50 10             	mov    0x10(%eax),%edx
c0002a83:	89 15 d0 31 01 c0    	mov    %edx,0xc00131d0
c0002a89:	8b 50 14             	mov    0x14(%eax),%edx
c0002a8c:	89 15 d4 31 01 c0    	mov    %edx,0xc00131d4
c0002a92:	8b 50 18             	mov    0x18(%eax),%edx
c0002a95:	89 15 d8 31 01 c0    	mov    %edx,0xc00131d8
c0002a9b:	8b 50 1c             	mov    0x1c(%eax),%edx
c0002a9e:	89 15 dc 31 01 c0    	mov    %edx,0xc00131dc
c0002aa4:	8b 50 20             	mov    0x20(%eax),%edx
c0002aa7:	89 15 e0 31 01 c0    	mov    %edx,0xc00131e0
c0002aad:	8b 40 24             	mov    0x24(%eax),%eax
c0002ab0:	a3 e4 31 01 c0       	mov    %eax,0xc00131e4
c0002ab5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0002abc:	eb 4c                	jmp    c0002b0a <mkfs+0x38d>
c0002abe:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002ac3:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0002ac6:	83 c2 01             	add    $0x1,%edx
c0002ac9:	c1 e2 05             	shl    $0x5,%edx
c0002acc:	01 d0                	add    %edx,%eax
c0002ace:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0002ad1:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002ad4:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0002ada:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002add:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0002ae4:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002ae7:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c0002aee:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
c0002af5:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0002af8:	c1 e0 08             	shl    $0x8,%eax
c0002afb:	0b 45 f0             	or     -0x10(%ebp),%eax
c0002afe:	89 c2                	mov    %eax,%edx
c0002b00:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002b03:	89 50 08             	mov    %edx,0x8(%eax)
c0002b06:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0002b0a:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
c0002b0e:	7e ae                	jle    c0002abe <mkfs+0x341>
c0002b10:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
c0002b17:	8d 95 70 ff ff ff    	lea    -0x90(%ebp),%edx
c0002b1d:	b8 00 00 00 00       	mov    $0x0,%eax
c0002b22:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0002b27:	89 d7                	mov    %edx,%edi
c0002b29:	f3 ab                	rep stos %eax,%es:(%edi)
c0002b2b:	c7 85 70 ff ff ff 80 	movl   $0xc000b180,-0x90(%ebp)
c0002b32:	b1 00 c0 
c0002b35:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0002b3c:	eb 54                	jmp    c0002b92 <mkfs+0x415>
c0002b3e:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002b43:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0002b46:	83 c2 04             	add    $0x4,%edx
c0002b49:	c1 e2 05             	shl    $0x5,%edx
c0002b4c:	01 d0                	add    %edx,%eax
c0002b4e:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0002b51:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002b54:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0002b5a:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002b5d:	c7 40 04 00 e8 08 00 	movl   $0x8e800,0x4(%eax)
c0002b64:	8b 45 98             	mov    -0x68(%ebp),%eax
c0002b67:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0002b6a:	83 c2 01             	add    $0x1,%edx
c0002b6d:	c1 e2 0b             	shl    $0xb,%edx
c0002b70:	01 c2                	add    %eax,%edx
c0002b72:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002b75:	89 50 08             	mov    %edx,0x8(%eax)
c0002b78:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002b7b:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0002b82:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002b85:	8d 50 05             	lea    0x5(%eax),%edx
c0002b88:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002b8b:	89 50 10             	mov    %edx,0x10(%eax)
c0002b8e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0002b92:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002b95:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0002b98:	7c a4                	jl     c0002b3e <mkfs+0x3c1>
c0002b9a:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002b9f:	89 c2                	mov    %eax,%edx
c0002ba1:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002ba4:	83 c0 03             	add    $0x3,%eax
c0002ba7:	83 ec 0c             	sub    $0xc,%esp
c0002baa:	6a 0a                	push   $0xa
c0002bac:	68 00 02 00 00       	push   $0x200
c0002bb1:	52                   	push   %edx
c0002bb2:	6a 20                	push   $0x20
c0002bb4:	50                   	push   %eax
c0002bb5:	e8 ea fa ff ff       	call   c00026a4 <rd_wt>
c0002bba:	83 c4 20             	add    $0x20,%esp
c0002bbd:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002bc2:	89 c2                	mov    %eax,%edx
c0002bc4:	8b 45 98             	mov    -0x68(%ebp),%eax
c0002bc7:	83 ec 0c             	sub    $0xc,%esp
c0002bca:	6a 07                	push   $0x7
c0002bcc:	68 00 02 00 00       	push   $0x200
c0002bd1:	52                   	push   %edx
c0002bd2:	6a 20                	push   $0x20
c0002bd4:	50                   	push   %eax
c0002bd5:	e8 ca fa ff ff       	call   c00026a4 <rd_wt>
c0002bda:	83 c4 20             	add    $0x20,%esp
c0002bdd:	c7 85 60 ff ff ff cc 	movl   $0xcc,-0xa0(%ebp)
c0002be4:	00 00 00 
c0002be7:	66 c7 85 5e ff ff ff 	movw   $0x2e,-0xa2(%ebp)
c0002bee:	2e 00 
c0002bf0:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002bf5:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0002bf8:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002bfb:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0002c01:	83 ec 0c             	sub    $0xc,%esp
c0002c04:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0002c0a:	50                   	push   %eax
c0002c0b:	e8 48 90 00 00       	call   c000bc58 <Strlen>
c0002c10:	83 c4 10             	add    $0x10,%esp
c0002c13:	89 c1                	mov    %eax,%ecx
c0002c15:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002c18:	8d 50 04             	lea    0x4(%eax),%edx
c0002c1b:	83 ec 04             	sub    $0x4,%esp
c0002c1e:	51                   	push   %ecx
c0002c1f:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0002c25:	50                   	push   %eax
c0002c26:	52                   	push   %edx
c0002c27:	e8 42 4e 00 00       	call   c0007a6e <Memcpy>
c0002c2c:	83 c4 10             	add    $0x10,%esp
c0002c2f:	8d 95 34 ff ff ff    	lea    -0xcc(%ebp),%edx
c0002c35:	b8 00 00 00 00       	mov    $0x0,%eax
c0002c3a:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0002c3f:	89 d7                	mov    %edx,%edi
c0002c41:	f3 ab                	rep stos %eax,%es:(%edi)
c0002c43:	c7 85 34 ff ff ff 8c 	movl   $0xc000b18c,-0xcc(%ebp)
c0002c4a:	b1 00 c0 
c0002c4d:	c7 85 38 ff ff ff 95 	movl   $0xc000b195,-0xc8(%ebp)
c0002c54:	b1 00 c0 
c0002c57:	c7 85 3c ff ff ff 9e 	movl   $0xc000b19e,-0xc4(%ebp)
c0002c5e:	b1 00 c0 
c0002c61:	c7 45 bc 03 00 00 00 	movl   $0x3,-0x44(%ebp)
c0002c68:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0002c6f:	eb 49                	jmp    c0002cba <mkfs+0x53d>
c0002c71:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0002c75:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002c78:	8d 50 02             	lea    0x2(%eax),%edx
c0002c7b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002c7e:	89 10                	mov    %edx,(%eax)
c0002c80:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002c83:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0002c8a:	83 ec 0c             	sub    $0xc,%esp
c0002c8d:	50                   	push   %eax
c0002c8e:	e8 c5 8f 00 00       	call   c000bc58 <Strlen>
c0002c93:	83 c4 10             	add    $0x10,%esp
c0002c96:	89 c1                	mov    %eax,%ecx
c0002c98:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002c9b:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0002ca2:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0002ca5:	83 c2 04             	add    $0x4,%edx
c0002ca8:	83 ec 04             	sub    $0x4,%esp
c0002cab:	51                   	push   %ecx
c0002cac:	50                   	push   %eax
c0002cad:	52                   	push   %edx
c0002cae:	e8 bb 4d 00 00       	call   c0007a6e <Memcpy>
c0002cb3:	83 c4 10             	add    $0x10,%esp
c0002cb6:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0002cba:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002cbd:	3b 45 bc             	cmp    -0x44(%ebp),%eax
c0002cc0:	7c af                	jl     c0002c71 <mkfs+0x4f4>
c0002cc2:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0002cc9:	eb 66                	jmp    c0002d31 <mkfs+0x5b4>
c0002ccb:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002cce:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0002cd5:	83 ec 0c             	sub    $0xc,%esp
c0002cd8:	50                   	push   %eax
c0002cd9:	e8 7a 8f 00 00       	call   c000bc58 <Strlen>
c0002cde:	83 c4 10             	add    $0x10,%esp
c0002ce1:	85 c0                	test   %eax,%eax
c0002ce3:	74 47                	je     c0002d2c <mkfs+0x5af>
c0002ce5:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0002ce9:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002cec:	8d 50 05             	lea    0x5(%eax),%edx
c0002cef:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002cf2:	89 10                	mov    %edx,(%eax)
c0002cf4:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002cf7:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0002cfe:	83 ec 0c             	sub    $0xc,%esp
c0002d01:	50                   	push   %eax
c0002d02:	e8 51 8f 00 00       	call   c000bc58 <Strlen>
c0002d07:	83 c4 10             	add    $0x10,%esp
c0002d0a:	89 c1                	mov    %eax,%ecx
c0002d0c:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002d0f:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0002d16:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0002d19:	83 c2 04             	add    $0x4,%edx
c0002d1c:	83 ec 04             	sub    $0x4,%esp
c0002d1f:	51                   	push   %ecx
c0002d20:	50                   	push   %eax
c0002d21:	52                   	push   %edx
c0002d22:	e8 47 4d 00 00       	call   c0007a6e <Memcpy>
c0002d27:	83 c4 10             	add    $0x10,%esp
c0002d2a:	eb 01                	jmp    c0002d2d <mkfs+0x5b0>
c0002d2c:	90                   	nop
c0002d2d:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0002d31:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002d34:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0002d37:	7c 92                	jl     c0002ccb <mkfs+0x54e>
c0002d39:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002d3e:	89 c2                	mov    %eax,%edx
c0002d40:	8b 45 98             	mov    -0x68(%ebp),%eax
c0002d43:	83 ec 0c             	sub    $0xc,%esp
c0002d46:	6a 0a                	push   $0xa
c0002d48:	68 00 02 00 00       	push   $0x200
c0002d4d:	52                   	push   %edx
c0002d4e:	6a 20                	push   $0x20
c0002d50:	50                   	push   %eax
c0002d51:	e8 4e f9 ff ff       	call   c00026a4 <rd_wt>
c0002d56:	83 c4 20             	add    $0x20,%esp
c0002d59:	90                   	nop
c0002d5a:	8b 7d fc             	mov    -0x4(%ebp),%edi
c0002d5d:	c9                   	leave  
c0002d5e:	c3                   	ret    

c0002d5f <init_fs>:
c0002d5f:	55                   	push   %ebp
c0002d60:	89 e5                	mov    %esp,%ebp
c0002d62:	83 ec 18             	sub    $0x18,%esp
c0002d65:	83 ec 0c             	sub    $0xc,%esp
c0002d68:	6a 7c                	push   $0x7c
c0002d6a:	e8 fd f6 ff ff       	call   c000246c <sys_malloc>
c0002d6f:	83 c4 10             	add    $0x10,%esp
c0002d72:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0002d75:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002d78:	c7 40 78 06 00 00 00 	movl   $0x6,0x78(%eax)
c0002d7f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002d82:	c7 40 14 20 00 00 00 	movl   $0x20,0x14(%eax)
c0002d89:	83 ec 04             	sub    $0x4,%esp
c0002d8c:	6a 03                	push   $0x3
c0002d8e:	ff 75 f4             	pushl  -0xc(%ebp)
c0002d91:	6a 03                	push   $0x3
c0002d93:	e8 cc 70 00 00       	call   c0009e64 <send_rec>
c0002d98:	83 c4 10             	add    $0x10,%esp
c0002d9b:	e8 dd f9 ff ff       	call   c000277d <mkfs>
c0002da0:	83 ec 08             	sub    $0x8,%esp
c0002da3:	6a 7c                	push   $0x7c
c0002da5:	ff 75 f4             	pushl  -0xc(%ebp)
c0002da8:	e8 d4 f6 ff ff       	call   c0002481 <sys_free>
c0002dad:	83 c4 10             	add    $0x10,%esp
c0002db0:	90                   	nop
c0002db1:	c9                   	leave  
c0002db2:	c3                   	ret    

c0002db3 <do_open>:
c0002db3:	55                   	push   %ebp
c0002db4:	89 e5                	mov    %esp,%ebp
c0002db6:	83 ec 68             	sub    $0x68,%esp
c0002db9:	83 ec 04             	sub    $0x4,%esp
c0002dbc:	6a 0c                	push   $0xc
c0002dbe:	6a 00                	push   $0x0
c0002dc0:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0002dc3:	50                   	push   %eax
c0002dc4:	e8 56 8e 00 00       	call   c000bc1f <Memset>
c0002dc9:	83 c4 10             	add    $0x10,%esp
c0002dcc:	8b 45 08             	mov    0x8(%ebp),%eax
c0002dcf:	8b 40 44             	mov    0x44(%eax),%eax
c0002dd2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0002dd5:	83 ec 08             	sub    $0x8,%esp
c0002dd8:	6a 0c                	push   $0xc
c0002dda:	ff 75 e4             	pushl  -0x1c(%ebp)
c0002ddd:	e8 72 3e 00 00       	call   c0006c54 <alloc_virtual_memory>
c0002de2:	83 c4 10             	add    $0x10,%esp
c0002de5:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0002de8:	8b 45 08             	mov    0x8(%ebp),%eax
c0002deb:	8b 40 40             	mov    0x40(%eax),%eax
c0002dee:	89 c2                	mov    %eax,%edx
c0002df0:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002df3:	83 ec 04             	sub    $0x4,%esp
c0002df6:	52                   	push   %edx
c0002df7:	50                   	push   %eax
c0002df8:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0002dfb:	50                   	push   %eax
c0002dfc:	e8 6d 4c 00 00       	call   c0007a6e <Memcpy>
c0002e01:	83 c4 10             	add    $0x10,%esp
c0002e04:	8b 45 08             	mov    0x8(%ebp),%eax
c0002e07:	8b 40 40             	mov    0x40(%eax),%eax
c0002e0a:	c6 44 05 c4 00       	movb   $0x0,-0x3c(%ebp,%eax,1)
c0002e0f:	8b 45 08             	mov    0x8(%ebp),%eax
c0002e12:	8b 40 74             	mov    0x74(%eax),%eax
c0002e15:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0002e18:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c0002e1f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0002e26:	eb 1f                	jmp    c0002e47 <do_open+0x94>
c0002e28:	a1 c8 0b 01 c0       	mov    0xc0010bc8,%eax
c0002e2d:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0002e30:	83 c2 50             	add    $0x50,%edx
c0002e33:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
c0002e37:	85 c0                	test   %eax,%eax
c0002e39:	75 08                	jne    c0002e43 <do_open+0x90>
c0002e3b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0002e3e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0002e41:	eb 0a                	jmp    c0002e4d <do_open+0x9a>
c0002e43:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0002e47:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c0002e4b:	7e db                	jle    c0002e28 <do_open+0x75>
c0002e4d:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c0002e51:	75 1c                	jne    c0002e6f <do_open+0xbc>
c0002e53:	68 c6 01 00 00       	push   $0x1c6
c0002e58:	68 b4 b0 00 c0       	push   $0xc000b0b4
c0002e5d:	68 b4 b0 00 c0       	push   $0xc000b0b4
c0002e62:	68 a7 b1 00 c0       	push   $0xc000b1a7
c0002e67:	e8 db 65 00 00       	call   c0009447 <assertion_failure>
c0002e6c:	83 c4 10             	add    $0x10,%esp
c0002e6f:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%ebp)
c0002e76:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0002e7d:	eb 1d                	jmp    c0002e9c <do_open+0xe9>
c0002e7f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002e82:	c1 e0 04             	shl    $0x4,%eax
c0002e85:	05 88 23 01 c0       	add    $0xc0012388,%eax
c0002e8a:	8b 00                	mov    (%eax),%eax
c0002e8c:	85 c0                	test   %eax,%eax
c0002e8e:	75 08                	jne    c0002e98 <do_open+0xe5>
c0002e90:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002e93:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0002e96:	eb 0a                	jmp    c0002ea2 <do_open+0xef>
c0002e98:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0002e9c:	83 7d e8 3f          	cmpl   $0x3f,-0x18(%ebp)
c0002ea0:	7e dd                	jle    c0002e7f <do_open+0xcc>
c0002ea2:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
c0002ea6:	75 1c                	jne    c0002ec4 <do_open+0x111>
c0002ea8:	68 d2 01 00 00       	push   $0x1d2
c0002ead:	68 b4 b0 00 c0       	push   $0xc000b0b4
c0002eb2:	68 b4 b0 00 c0       	push   $0xc000b0b4
c0002eb7:	68 af b1 00 c0       	push   $0xc000b1af
c0002ebc:	e8 86 65 00 00       	call   c0009447 <assertion_failure>
c0002ec1:	83 c4 10             	add    $0x10,%esp
c0002ec4:	83 ec 0c             	sub    $0xc,%esp
c0002ec7:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0002eca:	50                   	push   %eax
c0002ecb:	e8 b2 00 00 00       	call   c0002f82 <search_file>
c0002ed0:	83 c4 10             	add    $0x10,%esp
c0002ed3:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0002ed6:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c0002eda:	75 2b                	jne    c0002f07 <do_open+0x154>
c0002edc:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0002ee0:	7e 10                	jle    c0002ef2 <do_open+0x13f>
c0002ee2:	83 ec 0c             	sub    $0xc,%esp
c0002ee5:	68 b7 b1 00 c0       	push   $0xc000b1b7
c0002eea:	e8 3a 65 00 00       	call   c0009429 <panic>
c0002eef:	83 c4 10             	add    $0x10,%esp
c0002ef2:	83 ec 08             	sub    $0x8,%esp
c0002ef5:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0002ef8:	50                   	push   %eax
c0002ef9:	8d 45 9c             	lea    -0x64(%ebp),%eax
c0002efc:	50                   	push   %eax
c0002efd:	e8 40 04 00 00       	call   c0003342 <create_file>
c0002f02:	83 c4 10             	add    $0x10,%esp
c0002f05:	eb 22                	jmp    c0002f29 <do_open+0x176>
c0002f07:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
c0002f0b:	75 07                	jne    c0002f14 <do_open+0x161>
c0002f0d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0002f12:	eb 6c                	jmp    c0002f80 <do_open+0x1cd>
c0002f14:	83 ec 08             	sub    $0x8,%esp
c0002f17:	ff 75 d8             	pushl  -0x28(%ebp)
c0002f1a:	8d 45 9c             	lea    -0x64(%ebp),%eax
c0002f1d:	50                   	push   %eax
c0002f1e:	e8 5d 02 00 00       	call   c0003180 <get_inode>
c0002f23:	83 c4 10             	add    $0x10,%esp
c0002f26:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0002f29:	a1 c8 0b 01 c0       	mov    0xc0010bc8,%eax
c0002f2e:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0002f31:	c1 e2 04             	shl    $0x4,%edx
c0002f34:	8d 8a 80 23 01 c0    	lea    -0x3ffedc80(%edx),%ecx
c0002f3a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0002f3d:	83 c2 50             	add    $0x50,%edx
c0002f40:	89 4c 90 08          	mov    %ecx,0x8(%eax,%edx,4)
c0002f44:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0002f47:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0002f4a:	c1 e2 04             	shl    $0x4,%edx
c0002f4d:	81 c2 88 23 01 c0    	add    $0xc0012388,%edx
c0002f53:	89 02                	mov    %eax,(%edx)
c0002f55:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002f58:	c1 e0 04             	shl    $0x4,%eax
c0002f5b:	05 84 23 01 c0       	add    $0xc0012384,%eax
c0002f60:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0002f66:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002f69:	c1 e0 04             	shl    $0x4,%eax
c0002f6c:	05 80 23 01 c0       	add    $0xc0012380,%eax
c0002f71:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0002f77:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002f7a:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0002f7d:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0002f80:	c9                   	leave  
c0002f81:	c3                   	ret    

c0002f82 <search_file>:
c0002f82:	55                   	push   %ebp
c0002f83:	89 e5                	mov    %esp,%ebp
c0002f85:	83 ec 68             	sub    $0x68,%esp
c0002f88:	83 ec 04             	sub    $0x4,%esp
c0002f8b:	6a 0c                	push   $0xc
c0002f8d:	6a 00                	push   $0x0
c0002f8f:	8d 45 c0             	lea    -0x40(%ebp),%eax
c0002f92:	50                   	push   %eax
c0002f93:	e8 87 8c 00 00       	call   c000bc1f <Memset>
c0002f98:	83 c4 10             	add    $0x10,%esp
c0002f9b:	83 ec 04             	sub    $0x4,%esp
c0002f9e:	6a 28                	push   $0x28
c0002fa0:	6a 00                	push   $0x0
c0002fa2:	8d 45 98             	lea    -0x68(%ebp),%eax
c0002fa5:	50                   	push   %eax
c0002fa6:	e8 74 8c 00 00       	call   c000bc1f <Memset>
c0002fab:	83 c4 10             	add    $0x10,%esp
c0002fae:	83 ec 04             	sub    $0x4,%esp
c0002fb1:	8d 45 98             	lea    -0x68(%ebp),%eax
c0002fb4:	50                   	push   %eax
c0002fb5:	ff 75 08             	pushl  0x8(%ebp)
c0002fb8:	8d 45 c0             	lea    -0x40(%ebp),%eax
c0002fbb:	50                   	push   %eax
c0002fbc:	e8 f3 00 00 00       	call   c00030b4 <strip_path>
c0002fc1:	83 c4 10             	add    $0x10,%esp
c0002fc4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0002fc7:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%ebp)
c0002fcb:	75 0a                	jne    c0002fd7 <search_file+0x55>
c0002fcd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0002fd2:	e9 db 00 00 00       	jmp    c00030b2 <search_file+0x130>
c0002fd7:	8b 45 9c             	mov    -0x64(%ebp),%eax
c0002fda:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0002fdd:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002fe0:	05 00 02 00 00       	add    $0x200,%eax
c0002fe5:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0002feb:	85 c0                	test   %eax,%eax
c0002fed:	0f 48 c2             	cmovs  %edx,%eax
c0002ff0:	c1 f8 09             	sar    $0x9,%eax
c0002ff3:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0002ff6:	8b 45 9c             	mov    -0x64(%ebp),%eax
c0002ff9:	c1 e8 04             	shr    $0x4,%eax
c0002ffc:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0002fff:	e8 5c 14 00 00       	call   c0004460 <get_super_block>
c0003004:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0003007:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000300a:	8b 00                	mov    (%eax),%eax
c000300c:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000300f:	c7 45 cc 20 00 00 00 	movl   $0x20,-0x34(%ebp)
c0003016:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000301d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0003024:	eb 7b                	jmp    c00030a1 <search_file+0x11f>
c0003026:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c000302b:	89 c1                	mov    %eax,%ecx
c000302d:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0003030:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003033:	01 d0                	add    %edx,%eax
c0003035:	83 ec 0c             	sub    $0xc,%esp
c0003038:	6a 07                	push   $0x7
c000303a:	68 00 02 00 00       	push   $0x200
c000303f:	51                   	push   %ecx
c0003040:	ff 75 cc             	pushl  -0x34(%ebp)
c0003043:	50                   	push   %eax
c0003044:	e8 5b f6 ff ff       	call   c00026a4 <rd_wt>
c0003049:	83 c4 20             	add    $0x20,%esp
c000304c:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0003051:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0003054:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000305b:	eb 35                	jmp    c0003092 <search_file+0x110>
c000305d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0003061:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003064:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0003067:	7f 33                	jg     c000309c <search_file+0x11a>
c0003069:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000306c:	83 c0 04             	add    $0x4,%eax
c000306f:	83 ec 08             	sub    $0x8,%esp
c0003072:	50                   	push   %eax
c0003073:	8d 45 c0             	lea    -0x40(%ebp),%eax
c0003076:	50                   	push   %eax
c0003077:	e8 4f 71 00 00       	call   c000a1cb <strcmp>
c000307c:	83 c4 10             	add    $0x10,%esp
c000307f:	85 c0                	test   %eax,%eax
c0003081:	75 07                	jne    c000308a <search_file+0x108>
c0003083:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003086:	8b 00                	mov    (%eax),%eax
c0003088:	eb 28                	jmp    c00030b2 <search_file+0x130>
c000308a:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c000308e:	83 45 ec 10          	addl   $0x10,-0x14(%ebp)
c0003092:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003095:	83 f8 1f             	cmp    $0x1f,%eax
c0003098:	76 c3                	jbe    c000305d <search_file+0xdb>
c000309a:	eb 01                	jmp    c000309d <search_file+0x11b>
c000309c:	90                   	nop
c000309d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00030a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00030a4:	3b 45 dc             	cmp    -0x24(%ebp),%eax
c00030a7:	0f 8c 79 ff ff ff    	jl     c0003026 <search_file+0xa4>
c00030ad:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c00030b2:	c9                   	leave  
c00030b3:	c3                   	ret    

c00030b4 <strip_path>:
c00030b4:	55                   	push   %ebp
c00030b5:	89 e5                	mov    %esp,%ebp
c00030b7:	83 ec 10             	sub    $0x10,%esp
c00030ba:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00030be:	75 0a                	jne    c00030ca <strip_path+0x16>
c00030c0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c00030c5:	e9 b4 00 00 00       	jmp    c000317e <strip_path+0xca>
c00030ca:	8b 45 08             	mov    0x8(%ebp),%eax
c00030cd:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00030d0:	8b 45 0c             	mov    0xc(%ebp),%eax
c00030d3:	89 45 f8             	mov    %eax,-0x8(%ebp)
c00030d6:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00030d9:	0f b6 00             	movzbl (%eax),%eax
c00030dc:	3c 2f                	cmp    $0x2f,%al
c00030de:	75 2d                	jne    c000310d <strip_path+0x59>
c00030e0:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c00030e4:	eb 27                	jmp    c000310d <strip_path+0x59>
c00030e6:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00030e9:	0f b6 00             	movzbl (%eax),%eax
c00030ec:	3c 2f                	cmp    $0x2f,%al
c00030ee:	75 0a                	jne    c00030fa <strip_path+0x46>
c00030f0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c00030f5:	e9 84 00 00 00       	jmp    c000317e <strip_path+0xca>
c00030fa:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00030fd:	0f b6 10             	movzbl (%eax),%edx
c0003100:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0003103:	88 10                	mov    %dl,(%eax)
c0003105:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0003109:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c000310d:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0003110:	0f b6 00             	movzbl (%eax),%eax
c0003113:	84 c0                	test   %al,%al
c0003115:	75 cf                	jne    c00030e6 <strip_path+0x32>
c0003117:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000311a:	c6 00 00             	movb   $0x0,(%eax)
c000311d:	8b 45 10             	mov    0x10(%ebp),%eax
c0003120:	8b 15 c0 31 01 c0    	mov    0xc00131c0,%edx
c0003126:	89 10                	mov    %edx,(%eax)
c0003128:	8b 15 c4 31 01 c0    	mov    0xc00131c4,%edx
c000312e:	89 50 04             	mov    %edx,0x4(%eax)
c0003131:	8b 15 c8 31 01 c0    	mov    0xc00131c8,%edx
c0003137:	89 50 08             	mov    %edx,0x8(%eax)
c000313a:	8b 15 cc 31 01 c0    	mov    0xc00131cc,%edx
c0003140:	89 50 0c             	mov    %edx,0xc(%eax)
c0003143:	8b 15 d0 31 01 c0    	mov    0xc00131d0,%edx
c0003149:	89 50 10             	mov    %edx,0x10(%eax)
c000314c:	8b 15 d4 31 01 c0    	mov    0xc00131d4,%edx
c0003152:	89 50 14             	mov    %edx,0x14(%eax)
c0003155:	8b 15 d8 31 01 c0    	mov    0xc00131d8,%edx
c000315b:	89 50 18             	mov    %edx,0x18(%eax)
c000315e:	8b 15 dc 31 01 c0    	mov    0xc00131dc,%edx
c0003164:	89 50 1c             	mov    %edx,0x1c(%eax)
c0003167:	8b 15 e0 31 01 c0    	mov    0xc00131e0,%edx
c000316d:	89 50 20             	mov    %edx,0x20(%eax)
c0003170:	8b 15 e4 31 01 c0    	mov    0xc00131e4,%edx
c0003176:	89 50 24             	mov    %edx,0x24(%eax)
c0003179:	b8 00 00 00 00       	mov    $0x0,%eax
c000317e:	c9                   	leave  
c000317f:	c3                   	ret    

c0003180 <get_inode>:
c0003180:	55                   	push   %ebp
c0003181:	89 e5                	mov    %esp,%ebp
c0003183:	56                   	push   %esi
c0003184:	53                   	push   %ebx
c0003185:	83 ec 20             	sub    $0x20,%esp
c0003188:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000318c:	75 0a                	jne    c0003198 <get_inode+0x18>
c000318e:	b8 00 00 00 00       	mov    $0x0,%eax
c0003193:	e9 a3 01 00 00       	jmp    c000333b <get_inode+0x1bb>
c0003198:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000319f:	c7 45 f0 a0 27 01 c0 	movl   $0xc00127a0,-0x10(%ebp)
c00031a6:	eb 69                	jmp    c0003211 <get_inode+0x91>
c00031a8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00031ab:	8b 40 24             	mov    0x24(%eax),%eax
c00031ae:	85 c0                	test   %eax,%eax
c00031b0:	7e 53                	jle    c0003205 <get_inode+0x85>
c00031b2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00031b5:	8b 40 10             	mov    0x10(%eax),%eax
c00031b8:	39 45 0c             	cmp    %eax,0xc(%ebp)
c00031bb:	75 50                	jne    c000320d <get_inode+0x8d>
c00031bd:	8b 45 08             	mov    0x8(%ebp),%eax
c00031c0:	8b 55 f0             	mov    -0x10(%ebp),%edx
c00031c3:	8b 0a                	mov    (%edx),%ecx
c00031c5:	89 08                	mov    %ecx,(%eax)
c00031c7:	8b 4a 04             	mov    0x4(%edx),%ecx
c00031ca:	89 48 04             	mov    %ecx,0x4(%eax)
c00031cd:	8b 4a 08             	mov    0x8(%edx),%ecx
c00031d0:	89 48 08             	mov    %ecx,0x8(%eax)
c00031d3:	8b 4a 0c             	mov    0xc(%edx),%ecx
c00031d6:	89 48 0c             	mov    %ecx,0xc(%eax)
c00031d9:	8b 4a 10             	mov    0x10(%edx),%ecx
c00031dc:	89 48 10             	mov    %ecx,0x10(%eax)
c00031df:	8b 4a 14             	mov    0x14(%edx),%ecx
c00031e2:	89 48 14             	mov    %ecx,0x14(%eax)
c00031e5:	8b 4a 18             	mov    0x18(%edx),%ecx
c00031e8:	89 48 18             	mov    %ecx,0x18(%eax)
c00031eb:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c00031ee:	89 48 1c             	mov    %ecx,0x1c(%eax)
c00031f1:	8b 4a 20             	mov    0x20(%edx),%ecx
c00031f4:	89 48 20             	mov    %ecx,0x20(%eax)
c00031f7:	8b 52 24             	mov    0x24(%edx),%edx
c00031fa:	89 50 24             	mov    %edx,0x24(%eax)
c00031fd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003200:	e9 36 01 00 00       	jmp    c000333b <get_inode+0x1bb>
c0003205:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003208:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000320b:	eb 0d                	jmp    c000321a <get_inode+0x9a>
c000320d:	83 45 f0 28          	addl   $0x28,-0x10(%ebp)
c0003211:	81 7d f0 a0 31 01 c0 	cmpl   $0xc00131a0,-0x10(%ebp)
c0003218:	76 8e                	jbe    c00031a8 <get_inode+0x28>
c000321a:	e8 41 12 00 00       	call   c0004460 <get_super_block>
c000321f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0003222:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c0003229:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000322c:	8b 40 04             	mov    0x4(%eax),%eax
c000322f:	8d 50 02             	lea    0x2(%eax),%edx
c0003232:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003235:	8b 40 08             	mov    0x8(%eax),%eax
c0003238:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c000323b:	8b 45 0c             	mov    0xc(%ebp),%eax
c000323e:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0003241:	b8 00 02 00 00       	mov    $0x200,%eax
c0003246:	99                   	cltd   
c0003247:	f7 7d e8             	idivl  -0x18(%ebp)
c000324a:	89 c6                	mov    %eax,%esi
c000324c:	89 c8                	mov    %ecx,%eax
c000324e:	99                   	cltd   
c000324f:	f7 fe                	idiv   %esi
c0003251:	01 d8                	add    %ebx,%eax
c0003253:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0003256:	c7 45 e0 20 00 00 00 	movl   $0x20,-0x20(%ebp)
c000325d:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003262:	83 ec 0c             	sub    $0xc,%esp
c0003265:	6a 07                	push   $0x7
c0003267:	68 00 02 00 00       	push   $0x200
c000326c:	50                   	push   %eax
c000326d:	ff 75 e0             	pushl  -0x20(%ebp)
c0003270:	ff 75 e4             	pushl  -0x1c(%ebp)
c0003273:	e8 2c f4 ff ff       	call   c00026a4 <rd_wt>
c0003278:	83 c4 20             	add    $0x20,%esp
c000327b:	8b 45 0c             	mov    0xc(%ebp),%eax
c000327e:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0003281:	b8 00 02 00 00       	mov    $0x200,%eax
c0003286:	99                   	cltd   
c0003287:	f7 7d e8             	idivl  -0x18(%ebp)
c000328a:	89 c3                	mov    %eax,%ebx
c000328c:	89 c8                	mov    %ecx,%eax
c000328e:	99                   	cltd   
c000328f:	f7 fb                	idiv   %ebx
c0003291:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0003294:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c000329a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000329d:	0f af 45 dc          	imul   -0x24(%ebp),%eax
c00032a1:	01 d0                	add    %edx,%eax
c00032a3:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00032a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00032a9:	8b 55 d8             	mov    -0x28(%ebp),%edx
c00032ac:	8b 0a                	mov    (%edx),%ecx
c00032ae:	89 08                	mov    %ecx,(%eax)
c00032b0:	8b 4a 04             	mov    0x4(%edx),%ecx
c00032b3:	89 48 04             	mov    %ecx,0x4(%eax)
c00032b6:	8b 4a 08             	mov    0x8(%edx),%ecx
c00032b9:	89 48 08             	mov    %ecx,0x8(%eax)
c00032bc:	8b 4a 0c             	mov    0xc(%edx),%ecx
c00032bf:	89 48 0c             	mov    %ecx,0xc(%eax)
c00032c2:	8b 4a 10             	mov    0x10(%edx),%ecx
c00032c5:	89 48 10             	mov    %ecx,0x10(%eax)
c00032c8:	8b 4a 14             	mov    0x14(%edx),%ecx
c00032cb:	89 48 14             	mov    %ecx,0x14(%eax)
c00032ce:	8b 4a 18             	mov    0x18(%edx),%ecx
c00032d1:	89 48 18             	mov    %ecx,0x18(%eax)
c00032d4:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c00032d7:	89 48 1c             	mov    %ecx,0x1c(%eax)
c00032da:	8b 4a 20             	mov    0x20(%edx),%ecx
c00032dd:	89 48 20             	mov    %ecx,0x20(%eax)
c00032e0:	8b 52 24             	mov    0x24(%edx),%edx
c00032e3:	89 50 24             	mov    %edx,0x24(%eax)
c00032e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00032e9:	8b 55 0c             	mov    0xc(%ebp),%edx
c00032ec:	89 50 10             	mov    %edx,0x10(%eax)
c00032ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00032f2:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00032f5:	89 50 20             	mov    %edx,0x20(%eax)
c00032f8:	8b 45 08             	mov    0x8(%ebp),%eax
c00032fb:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00032fe:	8b 0a                	mov    (%edx),%ecx
c0003300:	89 08                	mov    %ecx,(%eax)
c0003302:	8b 4a 04             	mov    0x4(%edx),%ecx
c0003305:	89 48 04             	mov    %ecx,0x4(%eax)
c0003308:	8b 4a 08             	mov    0x8(%edx),%ecx
c000330b:	89 48 08             	mov    %ecx,0x8(%eax)
c000330e:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0003311:	89 48 0c             	mov    %ecx,0xc(%eax)
c0003314:	8b 4a 10             	mov    0x10(%edx),%ecx
c0003317:	89 48 10             	mov    %ecx,0x10(%eax)
c000331a:	8b 4a 14             	mov    0x14(%edx),%ecx
c000331d:	89 48 14             	mov    %ecx,0x14(%eax)
c0003320:	8b 4a 18             	mov    0x18(%edx),%ecx
c0003323:	89 48 18             	mov    %ecx,0x18(%eax)
c0003326:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0003329:	89 48 1c             	mov    %ecx,0x1c(%eax)
c000332c:	8b 4a 20             	mov    0x20(%edx),%ecx
c000332f:	89 48 20             	mov    %ecx,0x20(%eax)
c0003332:	8b 52 24             	mov    0x24(%edx),%edx
c0003335:	89 50 24             	mov    %edx,0x24(%eax)
c0003338:	8b 45 08             	mov    0x8(%ebp),%eax
c000333b:	8d 65 f8             	lea    -0x8(%ebp),%esp
c000333e:	5b                   	pop    %ebx
c000333f:	5e                   	pop    %esi
c0003340:	5d                   	pop    %ebp
c0003341:	c3                   	ret    

c0003342 <create_file>:
c0003342:	55                   	push   %ebp
c0003343:	89 e5                	mov    %esp,%ebp
c0003345:	81 ec 98 00 00 00    	sub    $0x98,%esp
c000334b:	8d 45 b8             	lea    -0x48(%ebp),%eax
c000334e:	50                   	push   %eax
c000334f:	ff 75 0c             	pushl  0xc(%ebp)
c0003352:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0003355:	50                   	push   %eax
c0003356:	e8 59 fd ff ff       	call   c00030b4 <strip_path>
c000335b:	83 c4 0c             	add    $0xc,%esp
c000335e:	83 f8 ff             	cmp    $0xffffffff,%eax
c0003361:	75 0a                	jne    c000336d <create_file+0x2b>
c0003363:	b8 00 00 00 00       	mov    $0x0,%eax
c0003368:	e9 de 00 00 00       	jmp    c000344b <create_file+0x109>
c000336d:	e8 db 00 00 00       	call   c000344d <alloc_imap_bit>
c0003372:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003375:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003379:	75 0a                	jne    c0003385 <create_file+0x43>
c000337b:	b8 00 00 00 00       	mov    $0x0,%eax
c0003380:	e9 c6 00 00 00       	jmp    c000344b <create_file+0x109>
c0003385:	e8 d6 10 00 00       	call   c0004460 <get_super_block>
c000338a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000338d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003390:	8b 40 10             	mov    0x10(%eax),%eax
c0003393:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0003396:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003399:	83 ec 08             	sub    $0x8,%esp
c000339c:	50                   	push   %eax
c000339d:	ff 75 f4             	pushl  -0xc(%ebp)
c00033a0:	e8 a5 01 00 00       	call   c000354a <alloc_smap_bit>
c00033a5:	83 c4 10             	add    $0x10,%esp
c00033a8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00033ab:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c00033af:	75 0a                	jne    c00033bb <create_file+0x79>
c00033b1:	b8 00 00 00 00       	mov    $0x0,%eax
c00033b6:	e9 90 00 00 00       	jmp    c000344b <create_file+0x109>
c00033bb:	83 ec 04             	sub    $0x4,%esp
c00033be:	ff 75 e8             	pushl  -0x18(%ebp)
c00033c1:	ff 75 f4             	pushl  -0xc(%ebp)
c00033c4:	8d 45 84             	lea    -0x7c(%ebp),%eax
c00033c7:	50                   	push   %eax
c00033c8:	e8 1e 03 00 00       	call   c00036eb <new_inode>
c00033cd:	83 c4 10             	add    $0x10,%esp
c00033d0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00033d3:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c00033d7:	75 07                	jne    c00033e0 <create_file+0x9e>
c00033d9:	b8 00 00 00 00       	mov    $0x0,%eax
c00033de:	eb 6b                	jmp    c000344b <create_file+0x109>
c00033e0:	ff 75 f4             	pushl  -0xc(%ebp)
c00033e3:	8d 45 ac             	lea    -0x54(%ebp),%eax
c00033e6:	50                   	push   %eax
c00033e7:	8d 45 b8             	lea    -0x48(%ebp),%eax
c00033ea:	50                   	push   %eax
c00033eb:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c00033f1:	50                   	push   %eax
c00033f2:	e8 12 04 00 00       	call   c0003809 <new_dir_entry>
c00033f7:	83 c4 10             	add    $0x10,%esp
c00033fa:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00033fd:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0003401:	75 07                	jne    c000340a <create_file+0xc8>
c0003403:	b8 00 00 00 00       	mov    $0x0,%eax
c0003408:	eb 41                	jmp    c000344b <create_file+0x109>
c000340a:	8b 45 08             	mov    0x8(%ebp),%eax
c000340d:	8b 55 84             	mov    -0x7c(%ebp),%edx
c0003410:	89 10                	mov    %edx,(%eax)
c0003412:	8b 55 88             	mov    -0x78(%ebp),%edx
c0003415:	89 50 04             	mov    %edx,0x4(%eax)
c0003418:	8b 55 8c             	mov    -0x74(%ebp),%edx
c000341b:	89 50 08             	mov    %edx,0x8(%eax)
c000341e:	8b 55 90             	mov    -0x70(%ebp),%edx
c0003421:	89 50 0c             	mov    %edx,0xc(%eax)
c0003424:	8b 55 94             	mov    -0x6c(%ebp),%edx
c0003427:	89 50 10             	mov    %edx,0x10(%eax)
c000342a:	8b 55 98             	mov    -0x68(%ebp),%edx
c000342d:	89 50 14             	mov    %edx,0x14(%eax)
c0003430:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0003433:	89 50 18             	mov    %edx,0x18(%eax)
c0003436:	8b 55 a0             	mov    -0x60(%ebp),%edx
c0003439:	89 50 1c             	mov    %edx,0x1c(%eax)
c000343c:	8b 55 a4             	mov    -0x5c(%ebp),%edx
c000343f:	89 50 20             	mov    %edx,0x20(%eax)
c0003442:	8b 55 a8             	mov    -0x58(%ebp),%edx
c0003445:	89 50 24             	mov    %edx,0x24(%eax)
c0003448:	8b 45 08             	mov    0x8(%ebp),%eax
c000344b:	c9                   	leave  
c000344c:	c3                   	ret    

c000344d <alloc_imap_bit>:
c000344d:	55                   	push   %ebp
c000344e:	89 e5                	mov    %esp,%ebp
c0003450:	53                   	push   %ebx
c0003451:	83 ec 24             	sub    $0x24,%esp
c0003454:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c000345b:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c0003462:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003467:	83 ec 0c             	sub    $0xc,%esp
c000346a:	6a 07                	push   $0x7
c000346c:	68 00 02 00 00       	push   $0x200
c0003471:	50                   	push   %eax
c0003472:	ff 75 e8             	pushl  -0x18(%ebp)
c0003475:	ff 75 ec             	pushl  -0x14(%ebp)
c0003478:	e8 27 f2 ff ff       	call   c00026a4 <rd_wt>
c000347d:	83 c4 20             	add    $0x20,%esp
c0003480:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0003487:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000348e:	e9 a5 00 00 00       	jmp    c0003538 <alloc_imap_bit+0xeb>
c0003493:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000349a:	e9 8b 00 00 00       	jmp    c000352a <alloc_imap_bit+0xdd>
c000349f:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c00034a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00034a8:	01 d0                	add    %edx,%eax
c00034aa:	0f b6 00             	movzbl (%eax),%eax
c00034ad:	0f be d0             	movsbl %al,%edx
c00034b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00034b3:	89 c1                	mov    %eax,%ecx
c00034b5:	d3 fa                	sar    %cl,%edx
c00034b7:	89 d0                	mov    %edx,%eax
c00034b9:	83 e0 01             	and    $0x1,%eax
c00034bc:	85 c0                	test   %eax,%eax
c00034be:	74 06                	je     c00034c6 <alloc_imap_bit+0x79>
c00034c0:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00034c4:	eb 64                	jmp    c000352a <alloc_imap_bit+0xdd>
c00034c6:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c00034cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00034cf:	01 d0                	add    %edx,%eax
c00034d1:	0f b6 18             	movzbl (%eax),%ebx
c00034d4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00034d7:	ba 01 00 00 00       	mov    $0x1,%edx
c00034dc:	89 c1                	mov    %eax,%ecx
c00034de:	d3 e2                	shl    %cl,%edx
c00034e0:	89 d0                	mov    %edx,%eax
c00034e2:	89 c1                	mov    %eax,%ecx
c00034e4:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c00034ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00034ed:	01 d0                	add    %edx,%eax
c00034ef:	09 cb                	or     %ecx,%ebx
c00034f1:	89 da                	mov    %ebx,%edx
c00034f3:	88 10                	mov    %dl,(%eax)
c00034f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00034f8:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c00034ff:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003502:	01 d0                	add    %edx,%eax
c0003504:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0003507:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c000350c:	83 ec 0c             	sub    $0xc,%esp
c000350f:	6a 0a                	push   $0xa
c0003511:	68 00 02 00 00       	push   $0x200
c0003516:	50                   	push   %eax
c0003517:	ff 75 e8             	pushl  -0x18(%ebp)
c000351a:	ff 75 ec             	pushl  -0x14(%ebp)
c000351d:	e8 82 f1 ff ff       	call   c00026a4 <rd_wt>
c0003522:	83 c4 20             	add    $0x20,%esp
c0003525:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003528:	eb 1b                	jmp    c0003545 <alloc_imap_bit+0xf8>
c000352a:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
c000352e:	0f 8e 6b ff ff ff    	jle    c000349f <alloc_imap_bit+0x52>
c0003534:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0003538:	81 7d f4 ff 01 00 00 	cmpl   $0x1ff,-0xc(%ebp)
c000353f:	0f 8e 4e ff ff ff    	jle    c0003493 <alloc_imap_bit+0x46>
c0003545:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0003548:	c9                   	leave  
c0003549:	c3                   	ret    

c000354a <alloc_smap_bit>:
c000354a:	55                   	push   %ebp
c000354b:	89 e5                	mov    %esp,%ebp
c000354d:	53                   	push   %ebx
c000354e:	83 ec 34             	sub    $0x34,%esp
c0003551:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0003555:	75 1c                	jne    c0003573 <alloc_smap_bit+0x29>
c0003557:	68 fc 02 00 00       	push   $0x2fc
c000355c:	68 b4 b0 00 c0       	push   $0xc000b0b4
c0003561:	68 b4 b0 00 c0       	push   $0xc000b0b4
c0003566:	68 c4 b1 00 c0       	push   $0xc000b1c4
c000356b:	e8 d7 5e 00 00       	call   c0009447 <assertion_failure>
c0003570:	83 c4 10             	add    $0x10,%esp
c0003573:	e8 e8 0e 00 00       	call   c0004460 <get_super_block>
c0003578:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000357b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000357e:	8b 40 08             	mov    0x8(%eax),%eax
c0003581:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0003584:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003587:	8b 40 04             	mov    0x4(%eax),%eax
c000358a:	83 c0 02             	add    $0x2,%eax
c000358d:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0003590:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003597:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c000359e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00035a5:	e9 20 01 00 00       	jmp    c00036ca <alloc_smap_bit+0x180>
c00035aa:	8b 55 dc             	mov    -0x24(%ebp),%edx
c00035ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00035b0:	01 d0                	add    %edx,%eax
c00035b2:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00035b5:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00035ba:	83 ec 0c             	sub    $0xc,%esp
c00035bd:	6a 07                	push   $0x7
c00035bf:	68 00 02 00 00       	push   $0x200
c00035c4:	50                   	push   %eax
c00035c5:	ff 75 d8             	pushl  -0x28(%ebp)
c00035c8:	ff 75 d4             	pushl  -0x2c(%ebp)
c00035cb:	e8 d4 f0 ff ff       	call   c00026a4 <rd_wt>
c00035d0:	83 c4 20             	add    $0x20,%esp
c00035d3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c00035da:	e9 b0 00 00 00       	jmp    c000368f <alloc_smap_bit+0x145>
c00035df:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00035e6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00035ea:	0f 85 8c 00 00 00    	jne    c000367c <alloc_smap_bit+0x132>
c00035f0:	eb 45                	jmp    c0003637 <alloc_smap_bit+0xed>
c00035f2:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c00035f8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00035fb:	01 d0                	add    %edx,%eax
c00035fd:	0f b6 00             	movzbl (%eax),%eax
c0003600:	0f be d0             	movsbl %al,%edx
c0003603:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003606:	89 c1                	mov    %eax,%ecx
c0003608:	d3 fa                	sar    %cl,%edx
c000360a:	89 d0                	mov    %edx,%eax
c000360c:	83 e0 01             	and    $0x1,%eax
c000360f:	85 c0                	test   %eax,%eax
c0003611:	74 06                	je     c0003619 <alloc_smap_bit+0xcf>
c0003613:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0003617:	eb 1e                	jmp    c0003637 <alloc_smap_bit+0xed>
c0003619:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000361c:	c1 e0 09             	shl    $0x9,%eax
c000361f:	89 c2                	mov    %eax,%edx
c0003621:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003624:	01 d0                	add    %edx,%eax
c0003626:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c000362d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003630:	01 d0                	add    %edx,%eax
c0003632:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003635:	eb 06                	jmp    c000363d <alloc_smap_bit+0xf3>
c0003637:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c000363b:	7e b5                	jle    c00035f2 <alloc_smap_bit+0xa8>
c000363d:	eb 3d                	jmp    c000367c <alloc_smap_bit+0x132>
c000363f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0003643:	74 45                	je     c000368a <alloc_smap_bit+0x140>
c0003645:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c000364b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000364e:	01 d0                	add    %edx,%eax
c0003650:	0f b6 18             	movzbl (%eax),%ebx
c0003653:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003656:	ba 01 00 00 00       	mov    $0x1,%edx
c000365b:	89 c1                	mov    %eax,%ecx
c000365d:	d3 e2                	shl    %cl,%edx
c000365f:	89 d0                	mov    %edx,%eax
c0003661:	89 c1                	mov    %eax,%ecx
c0003663:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003669:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000366c:	01 d0                	add    %edx,%eax
c000366e:	09 cb                	or     %ecx,%ebx
c0003670:	89 da                	mov    %ebx,%edx
c0003672:	88 10                	mov    %dl,(%eax)
c0003674:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0003678:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c000367c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0003680:	74 09                	je     c000368b <alloc_smap_bit+0x141>
c0003682:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0003686:	7e b7                	jle    c000363f <alloc_smap_bit+0xf5>
c0003688:	eb 01                	jmp    c000368b <alloc_smap_bit+0x141>
c000368a:	90                   	nop
c000368b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c000368f:	81 7d ec ff 01 00 00 	cmpl   $0x1ff,-0x14(%ebp)
c0003696:	0f 8e 43 ff ff ff    	jle    c00035df <alloc_smap_bit+0x95>
c000369c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00036a0:	74 1e                	je     c00036c0 <alloc_smap_bit+0x176>
c00036a2:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00036a7:	83 ec 0c             	sub    $0xc,%esp
c00036aa:	6a 0a                	push   $0xa
c00036ac:	68 00 02 00 00       	push   $0x200
c00036b1:	50                   	push   %eax
c00036b2:	ff 75 d8             	pushl  -0x28(%ebp)
c00036b5:	ff 75 d4             	pushl  -0x2c(%ebp)
c00036b8:	e8 e7 ef ff ff       	call   c00026a4 <rd_wt>
c00036bd:	83 c4 20             	add    $0x20,%esp
c00036c0:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00036c4:	74 12                	je     c00036d8 <alloc_smap_bit+0x18e>
c00036c6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00036ca:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00036cd:	3b 45 e0             	cmp    -0x20(%ebp),%eax
c00036d0:	0f 8c d4 fe ff ff    	jl     c00035aa <alloc_smap_bit+0x60>
c00036d6:	eb 01                	jmp    c00036d9 <alloc_smap_bit+0x18f>
c00036d8:	90                   	nop
c00036d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00036dc:	8d 50 ff             	lea    -0x1(%eax),%edx
c00036df:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00036e2:	8b 00                	mov    (%eax),%eax
c00036e4:	01 d0                	add    %edx,%eax
c00036e6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c00036e9:	c9                   	leave  
c00036ea:	c3                   	ret    

c00036eb <new_inode>:
c00036eb:	55                   	push   %ebp
c00036ec:	89 e5                	mov    %esp,%ebp
c00036ee:	83 ec 38             	sub    $0x38,%esp
c00036f1:	83 ec 08             	sub    $0x8,%esp
c00036f4:	ff 75 0c             	pushl  0xc(%ebp)
c00036f7:	8d 45 c8             	lea    -0x38(%ebp),%eax
c00036fa:	50                   	push   %eax
c00036fb:	e8 80 fa ff ff       	call   c0003180 <get_inode>
c0003700:	83 c4 10             	add    $0x10,%esp
c0003703:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0003706:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000370a:	75 0a                	jne    c0003716 <new_inode+0x2b>
c000370c:	b8 00 00 00 00       	mov    $0x0,%eax
c0003711:	e9 f1 00 00 00       	jmp    c0003807 <new_inode+0x11c>
c0003716:	8b 45 10             	mov    0x10(%ebp),%eax
c0003719:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000371c:	c7 45 d4 00 08 00 00 	movl   $0x800,-0x2c(%ebp)
c0003723:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c000372a:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
c0003731:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003734:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0003737:	83 ec 0c             	sub    $0xc,%esp
c000373a:	8d 45 c8             	lea    -0x38(%ebp),%eax
c000373d:	50                   	push   %eax
c000373e:	e8 39 0b 00 00       	call   c000427c <sync_inode>
c0003743:	83 c4 10             	add    $0x10,%esp
c0003746:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c000374d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003754:	eb 1d                	jmp    c0003773 <new_inode+0x88>
c0003756:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0003759:	89 d0                	mov    %edx,%eax
c000375b:	c1 e0 02             	shl    $0x2,%eax
c000375e:	01 d0                	add    %edx,%eax
c0003760:	c1 e0 03             	shl    $0x3,%eax
c0003763:	05 b0 27 01 c0       	add    $0xc00127b0,%eax
c0003768:	8b 00                	mov    (%eax),%eax
c000376a:	39 45 0c             	cmp    %eax,0xc(%ebp)
c000376d:	74 0c                	je     c000377b <new_inode+0x90>
c000376f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0003773:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c0003777:	7e dd                	jle    c0003756 <new_inode+0x6b>
c0003779:	eb 01                	jmp    c000377c <new_inode+0x91>
c000377b:	90                   	nop
c000377c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000377f:	89 d0                	mov    %edx,%eax
c0003781:	c1 e0 02             	shl    $0x2,%eax
c0003784:	01 d0                	add    %edx,%eax
c0003786:	c1 e0 03             	shl    $0x3,%eax
c0003789:	05 a0 27 01 c0       	add    $0xc00127a0,%eax
c000378e:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0003791:	89 10                	mov    %edx,(%eax)
c0003793:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0003796:	89 50 04             	mov    %edx,0x4(%eax)
c0003799:	8b 55 d0             	mov    -0x30(%ebp),%edx
c000379c:	89 50 08             	mov    %edx,0x8(%eax)
c000379f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c00037a2:	89 50 0c             	mov    %edx,0xc(%eax)
c00037a5:	8b 55 d8             	mov    -0x28(%ebp),%edx
c00037a8:	89 50 10             	mov    %edx,0x10(%eax)
c00037ab:	8b 55 dc             	mov    -0x24(%ebp),%edx
c00037ae:	89 50 14             	mov    %edx,0x14(%eax)
c00037b1:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00037b4:	89 50 18             	mov    %edx,0x18(%eax)
c00037b7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c00037ba:	89 50 1c             	mov    %edx,0x1c(%eax)
c00037bd:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00037c0:	89 50 20             	mov    %edx,0x20(%eax)
c00037c3:	8b 55 ec             	mov    -0x14(%ebp),%edx
c00037c6:	89 50 24             	mov    %edx,0x24(%eax)
c00037c9:	8b 45 08             	mov    0x8(%ebp),%eax
c00037cc:	8b 55 c8             	mov    -0x38(%ebp),%edx
c00037cf:	89 10                	mov    %edx,(%eax)
c00037d1:	8b 55 cc             	mov    -0x34(%ebp),%edx
c00037d4:	89 50 04             	mov    %edx,0x4(%eax)
c00037d7:	8b 55 d0             	mov    -0x30(%ebp),%edx
c00037da:	89 50 08             	mov    %edx,0x8(%eax)
c00037dd:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c00037e0:	89 50 0c             	mov    %edx,0xc(%eax)
c00037e3:	8b 55 d8             	mov    -0x28(%ebp),%edx
c00037e6:	89 50 10             	mov    %edx,0x10(%eax)
c00037e9:	8b 55 dc             	mov    -0x24(%ebp),%edx
c00037ec:	89 50 14             	mov    %edx,0x14(%eax)
c00037ef:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00037f2:	89 50 18             	mov    %edx,0x18(%eax)
c00037f5:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c00037f8:	89 50 1c             	mov    %edx,0x1c(%eax)
c00037fb:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00037fe:	89 50 20             	mov    %edx,0x20(%eax)
c0003801:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0003804:	89 50 24             	mov    %edx,0x24(%eax)
c0003807:	c9                   	leave  
c0003808:	c3                   	ret    

c0003809 <new_dir_entry>:
c0003809:	55                   	push   %ebp
c000380a:	89 e5                	mov    %esp,%ebp
c000380c:	83 ec 48             	sub    $0x48,%esp
c000380f:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
c0003816:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003819:	8b 40 04             	mov    0x4(%eax),%eax
c000381c:	99                   	cltd   
c000381d:	f7 7d dc             	idivl  -0x24(%ebp)
c0003820:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0003823:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003826:	8b 40 0c             	mov    0xc(%eax),%eax
c0003829:	99                   	cltd   
c000382a:	f7 7d dc             	idivl  -0x24(%ebp)
c000382d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0003830:	e8 2b 0c 00 00       	call   c0004460 <get_super_block>
c0003835:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003838:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000383b:	8b 00                	mov    (%eax),%eax
c000383d:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0003840:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003843:	8b 40 0c             	mov    0xc(%eax),%eax
c0003846:	05 00 02 00 00       	add    $0x200,%eax
c000384b:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0003851:	85 c0                	test   %eax,%eax
c0003853:	0f 48 c2             	cmovs  %edx,%eax
c0003856:	c1 f8 09             	sar    $0x9,%eax
c0003859:	89 45 c8             	mov    %eax,-0x38(%ebp)
c000385c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003863:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000386a:	c7 45 c4 20 00 00 00 	movl   $0x20,-0x3c(%ebp)
c0003871:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0003878:	eb 7f                	jmp    c00038f9 <new_dir_entry+0xf0>
c000387a:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c000387f:	89 c1                	mov    %eax,%ecx
c0003881:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0003884:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003887:	01 d0                	add    %edx,%eax
c0003889:	83 ec 0c             	sub    $0xc,%esp
c000388c:	6a 07                	push   $0x7
c000388e:	68 00 02 00 00       	push   $0x200
c0003893:	51                   	push   %ecx
c0003894:	ff 75 c4             	pushl  -0x3c(%ebp)
c0003897:	50                   	push   %eax
c0003898:	e8 07 ee ff ff       	call   c00026a4 <rd_wt>
c000389d:	83 c4 20             	add    $0x20,%esp
c00038a0:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c00038a5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00038a8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00038af:	eb 25                	jmp    c00038d6 <new_dir_entry+0xcd>
c00038b1:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c00038b5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00038b8:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c00038bb:	7f 29                	jg     c00038e6 <new_dir_entry+0xdd>
c00038bd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00038c0:	8b 00                	mov    (%eax),%eax
c00038c2:	85 c0                	test   %eax,%eax
c00038c4:	75 08                	jne    c00038ce <new_dir_entry+0xc5>
c00038c6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00038c9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00038cc:	eb 19                	jmp    c00038e7 <new_dir_entry+0xde>
c00038ce:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c00038d2:	83 45 f0 10          	addl   $0x10,-0x10(%ebp)
c00038d6:	b8 00 02 00 00       	mov    $0x200,%eax
c00038db:	99                   	cltd   
c00038dc:	f7 7d dc             	idivl  -0x24(%ebp)
c00038df:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c00038e2:	7c cd                	jl     c00038b1 <new_dir_entry+0xa8>
c00038e4:	eb 01                	jmp    c00038e7 <new_dir_entry+0xde>
c00038e6:	90                   	nop
c00038e7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00038ea:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c00038ed:	7f 16                	jg     c0003905 <new_dir_entry+0xfc>
c00038ef:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00038f3:	75 10                	jne    c0003905 <new_dir_entry+0xfc>
c00038f5:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c00038f9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00038fc:	3b 45 c8             	cmp    -0x38(%ebp),%eax
c00038ff:	0f 8c 75 ff ff ff    	jl     c000387a <new_dir_entry+0x71>
c0003905:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0003908:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
c000390b:	75 0a                	jne    c0003917 <new_dir_entry+0x10e>
c000390d:	b8 00 00 00 00       	mov    $0x0,%eax
c0003912:	e9 fc 00 00 00       	jmp    c0003a13 <new_dir_entry+0x20a>
c0003917:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c000391e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003922:	75 1e                	jne    c0003942 <new_dir_entry+0x139>
c0003924:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003927:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000392a:	8b 45 0c             	mov    0xc(%ebp),%eax
c000392d:	8b 50 04             	mov    0x4(%eax),%edx
c0003930:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0003933:	01 c2                	add    %eax,%edx
c0003935:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003938:	89 50 04             	mov    %edx,0x4(%eax)
c000393b:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0003942:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003945:	8b 55 14             	mov    0x14(%ebp),%edx
c0003948:	89 10                	mov    %edx,(%eax)
c000394a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000394d:	83 c0 04             	add    $0x4,%eax
c0003950:	83 ec 08             	sub    $0x8,%esp
c0003953:	ff 75 10             	pushl  0x10(%ebp)
c0003956:	50                   	push   %eax
c0003957:	e8 e2 82 00 00       	call   c000bc3e <Strcpy>
c000395c:	83 c4 10             	add    $0x10,%esp
c000395f:	8b 45 08             	mov    0x8(%ebp),%eax
c0003962:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0003965:	8b 0a                	mov    (%edx),%ecx
c0003967:	89 08                	mov    %ecx,(%eax)
c0003969:	8b 4a 04             	mov    0x4(%edx),%ecx
c000396c:	89 48 04             	mov    %ecx,0x4(%eax)
c000396f:	8b 4a 08             	mov    0x8(%edx),%ecx
c0003972:	89 48 08             	mov    %ecx,0x8(%eax)
c0003975:	8b 52 0c             	mov    0xc(%edx),%edx
c0003978:	89 50 0c             	mov    %edx,0xc(%eax)
c000397b:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003980:	89 c1                	mov    %eax,%ecx
c0003982:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0003985:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003988:	01 d0                	add    %edx,%eax
c000398a:	83 ec 0c             	sub    $0xc,%esp
c000398d:	6a 0a                	push   $0xa
c000398f:	68 00 02 00 00       	push   $0x200
c0003994:	51                   	push   %ecx
c0003995:	ff 75 c4             	pushl  -0x3c(%ebp)
c0003998:	50                   	push   %eax
c0003999:	e8 06 ed ff ff       	call   c00026a4 <rd_wt>
c000399e:	83 c4 20             	add    $0x20,%esp
c00039a1:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c00039a5:	74 69                	je     c0003a10 <new_dir_entry+0x207>
c00039a7:	8b 45 0c             	mov    0xc(%ebp),%eax
c00039aa:	8b 10                	mov    (%eax),%edx
c00039ac:	89 15 c0 31 01 c0    	mov    %edx,0xc00131c0
c00039b2:	8b 50 04             	mov    0x4(%eax),%edx
c00039b5:	89 15 c4 31 01 c0    	mov    %edx,0xc00131c4
c00039bb:	8b 50 08             	mov    0x8(%eax),%edx
c00039be:	89 15 c8 31 01 c0    	mov    %edx,0xc00131c8
c00039c4:	8b 50 0c             	mov    0xc(%eax),%edx
c00039c7:	89 15 cc 31 01 c0    	mov    %edx,0xc00131cc
c00039cd:	8b 50 10             	mov    0x10(%eax),%edx
c00039d0:	89 15 d0 31 01 c0    	mov    %edx,0xc00131d0
c00039d6:	8b 50 14             	mov    0x14(%eax),%edx
c00039d9:	89 15 d4 31 01 c0    	mov    %edx,0xc00131d4
c00039df:	8b 50 18             	mov    0x18(%eax),%edx
c00039e2:	89 15 d8 31 01 c0    	mov    %edx,0xc00131d8
c00039e8:	8b 50 1c             	mov    0x1c(%eax),%edx
c00039eb:	89 15 dc 31 01 c0    	mov    %edx,0xc00131dc
c00039f1:	8b 50 20             	mov    0x20(%eax),%edx
c00039f4:	89 15 e0 31 01 c0    	mov    %edx,0xc00131e0
c00039fa:	8b 40 24             	mov    0x24(%eax),%eax
c00039fd:	a3 e4 31 01 c0       	mov    %eax,0xc00131e4
c0003a02:	83 ec 0c             	sub    $0xc,%esp
c0003a05:	ff 75 0c             	pushl  0xc(%ebp)
c0003a08:	e8 6f 08 00 00       	call   c000427c <sync_inode>
c0003a0d:	83 c4 10             	add    $0x10,%esp
c0003a10:	8b 45 08             	mov    0x8(%ebp),%eax
c0003a13:	c9                   	leave  
c0003a14:	c3                   	ret    

c0003a15 <do_unlink>:
c0003a15:	55                   	push   %ebp
c0003a16:	89 e5                	mov    %esp,%ebp
c0003a18:	53                   	push   %ebx
c0003a19:	81 ec a4 00 00 00    	sub    $0xa4,%esp
c0003a1f:	83 ec 08             	sub    $0x8,%esp
c0003a22:	ff 75 08             	pushl  0x8(%ebp)
c0003a25:	68 d9 b1 00 c0       	push   $0xc000b1d9
c0003a2a:	e8 9c 67 00 00       	call   c000a1cb <strcmp>
c0003a2f:	83 c4 10             	add    $0x10,%esp
c0003a32:	85 c0                	test   %eax,%eax
c0003a34:	75 10                	jne    c0003a46 <do_unlink+0x31>
c0003a36:	83 ec 0c             	sub    $0xc,%esp
c0003a39:	68 db b1 00 c0       	push   $0xc000b1db
c0003a3e:	e8 e6 59 00 00       	call   c0009429 <panic>
c0003a43:	83 c4 10             	add    $0x10,%esp
c0003a46:	83 ec 0c             	sub    $0xc,%esp
c0003a49:	ff 75 08             	pushl  0x8(%ebp)
c0003a4c:	e8 31 f5 ff ff       	call   c0002f82 <search_file>
c0003a51:	83 c4 10             	add    $0x10,%esp
c0003a54:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003a57:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0003a5b:	75 10                	jne    c0003a6d <do_unlink+0x58>
c0003a5d:	83 ec 0c             	sub    $0xc,%esp
c0003a60:	68 f7 b1 00 c0       	push   $0xc000b1f7
c0003a65:	e8 bf 59 00 00       	call   c0009429 <panic>
c0003a6a:	83 c4 10             	add    $0x10,%esp
c0003a6d:	83 ec 08             	sub    $0x8,%esp
c0003a70:	ff 75 d0             	pushl  -0x30(%ebp)
c0003a73:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0003a79:	50                   	push   %eax
c0003a7a:	e8 01 f7 ff ff       	call   c0003180 <get_inode>
c0003a7f:	83 c4 10             	add    $0x10,%esp
c0003a82:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0003a85:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0003a89:	75 10                	jne    c0003a9b <do_unlink+0x86>
c0003a8b:	83 ec 0c             	sub    $0xc,%esp
c0003a8e:	68 f7 b1 00 c0       	push   $0xc000b1f7
c0003a93:	e8 91 59 00 00       	call   c0009429 <panic>
c0003a98:	83 c4 10             	add    $0x10,%esp
c0003a9b:	8b 45 88             	mov    -0x78(%ebp),%eax
c0003a9e:	85 c0                	test   %eax,%eax
c0003aa0:	7e 10                	jle    c0003ab2 <do_unlink+0x9d>
c0003aa2:	83 ec 0c             	sub    $0xc,%esp
c0003aa5:	68 10 b2 00 c0       	push   $0xc000b210
c0003aaa:	e8 7a 59 00 00       	call   c0009429 <panic>
c0003aaf:	83 c4 10             	add    $0x10,%esp
c0003ab2:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0003ab8:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0003abb:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0003abe:	8d 50 07             	lea    0x7(%eax),%edx
c0003ac1:	85 c0                	test   %eax,%eax
c0003ac3:	0f 48 c2             	cmovs  %edx,%eax
c0003ac6:	c1 f8 03             	sar    $0x3,%eax
c0003ac9:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0003acc:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0003acf:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0003ad5:	85 c0                	test   %eax,%eax
c0003ad7:	0f 48 c2             	cmovs  %edx,%eax
c0003ada:	c1 f8 09             	sar    $0x9,%eax
c0003add:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0003ae0:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0003ae3:	99                   	cltd   
c0003ae4:	c1 ea 1d             	shr    $0x1d,%edx
c0003ae7:	01 d0                	add    %edx,%eax
c0003ae9:	83 e0 07             	and    $0x7,%eax
c0003aec:	29 d0                	sub    %edx,%eax
c0003aee:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0003af1:	c7 45 b8 20 00 00 00 	movl   $0x20,-0x48(%ebp)
c0003af8:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003afd:	89 c2                	mov    %eax,%edx
c0003aff:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0003b02:	83 c0 02             	add    $0x2,%eax
c0003b05:	83 ec 0c             	sub    $0xc,%esp
c0003b08:	6a 07                	push   $0x7
c0003b0a:	68 00 02 00 00       	push   $0x200
c0003b0f:	52                   	push   %edx
c0003b10:	ff 75 b8             	pushl  -0x48(%ebp)
c0003b13:	50                   	push   %eax
c0003b14:	e8 8b eb ff ff       	call   c00026a4 <rd_wt>
c0003b19:	83 c4 20             	add    $0x20,%esp
c0003b1c:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003b22:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0003b25:	01 d0                	add    %edx,%eax
c0003b27:	0f b6 10             	movzbl (%eax),%edx
c0003b2a:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0003b2d:	bb 01 00 00 00       	mov    $0x1,%ebx
c0003b32:	89 c1                	mov    %eax,%ecx
c0003b34:	d3 e3                	shl    %cl,%ebx
c0003b36:	89 d8                	mov    %ebx,%eax
c0003b38:	f7 d0                	not    %eax
c0003b3a:	89 c3                	mov    %eax,%ebx
c0003b3c:	8b 0d a4 31 01 c0    	mov    0xc00131a4,%ecx
c0003b42:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0003b45:	01 c8                	add    %ecx,%eax
c0003b47:	21 da                	and    %ebx,%edx
c0003b49:	88 10                	mov    %dl,(%eax)
c0003b4b:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003b50:	89 c2                	mov    %eax,%edx
c0003b52:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0003b55:	83 c0 02             	add    $0x2,%eax
c0003b58:	83 ec 0c             	sub    $0xc,%esp
c0003b5b:	6a 0a                	push   $0xa
c0003b5d:	68 00 02 00 00       	push   $0x200
c0003b62:	52                   	push   %edx
c0003b63:	ff 75 b8             	pushl  -0x48(%ebp)
c0003b66:	50                   	push   %eax
c0003b67:	e8 38 eb ff ff       	call   c00026a4 <rd_wt>
c0003b6c:	83 c4 20             	add    $0x20,%esp
c0003b6f:	e8 ec 08 00 00       	call   c0004460 <get_super_block>
c0003b74:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0003b77:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0003b7d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0003b80:	8b 00                	mov    (%eax),%eax
c0003b82:	29 c2                	sub    %eax,%edx
c0003b84:	89 d0                	mov    %edx,%eax
c0003b86:	83 c0 01             	add    $0x1,%eax
c0003b89:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0003b8c:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0003b8f:	8d 50 07             	lea    0x7(%eax),%edx
c0003b92:	85 c0                	test   %eax,%eax
c0003b94:	0f 48 c2             	cmovs  %edx,%eax
c0003b97:	c1 f8 03             	sar    $0x3,%eax
c0003b9a:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0003b9d:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0003ba0:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0003ba6:	85 c0                	test   %eax,%eax
c0003ba8:	0f 48 c2             	cmovs  %edx,%eax
c0003bab:	c1 f8 09             	sar    $0x9,%eax
c0003bae:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0003bb1:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0003bb4:	99                   	cltd   
c0003bb5:	c1 ea 1d             	shr    $0x1d,%edx
c0003bb8:	01 d0                	add    %edx,%eax
c0003bba:	83 e0 07             	and    $0x7,%eax
c0003bbd:	29 d0                	sub    %edx,%eax
c0003bbf:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0003bc2:	b8 08 00 00 00       	mov    $0x8,%eax
c0003bc7:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c0003bca:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0003bcd:	29 c2                	sub    %eax,%edx
c0003bcf:	89 d0                	mov    %edx,%eax
c0003bd1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003bd4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003bd7:	8d 50 07             	lea    0x7(%eax),%edx
c0003bda:	85 c0                	test   %eax,%eax
c0003bdc:	0f 48 c2             	cmovs  %edx,%eax
c0003bdf:	c1 f8 03             	sar    $0x3,%eax
c0003be2:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0003be5:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003bea:	89 c1                	mov    %eax,%ecx
c0003bec:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0003bef:	8b 40 04             	mov    0x4(%eax),%eax
c0003bf2:	8d 50 02             	lea    0x2(%eax),%edx
c0003bf5:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0003bf8:	01 d0                	add    %edx,%eax
c0003bfa:	83 ec 0c             	sub    $0xc,%esp
c0003bfd:	6a 07                	push   $0x7
c0003bff:	68 00 02 00 00       	push   $0x200
c0003c04:	51                   	push   %ecx
c0003c05:	ff 75 b8             	pushl  -0x48(%ebp)
c0003c08:	50                   	push   %eax
c0003c09:	e8 96 ea ff ff       	call   c00026a4 <rd_wt>
c0003c0e:	83 c4 20             	add    $0x20,%esp
c0003c11:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003c17:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0003c1a:	01 d0                	add    %edx,%eax
c0003c1c:	0f b6 10             	movzbl (%eax),%edx
c0003c1f:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0003c22:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0003c27:	89 c1                	mov    %eax,%ecx
c0003c29:	d3 e3                	shl    %cl,%ebx
c0003c2b:	89 d8                	mov    %ebx,%eax
c0003c2d:	f7 d0                	not    %eax
c0003c2f:	89 c3                	mov    %eax,%ebx
c0003c31:	8b 0d a4 31 01 c0    	mov    0xc00131a4,%ecx
c0003c37:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0003c3a:	01 c8                	add    %ecx,%eax
c0003c3c:	21 da                	and    %ebx,%edx
c0003c3e:	88 10                	mov    %dl,(%eax)
c0003c40:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0003c47:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0003c4a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0003c4d:	eb 6b                	jmp    c0003cba <do_unlink+0x2a5>
c0003c4f:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0003c56:	75 4c                	jne    c0003ca4 <do_unlink+0x28f>
c0003c58:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0003c5f:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003c64:	83 ec 0c             	sub    $0xc,%esp
c0003c67:	6a 0a                	push   $0xa
c0003c69:	68 00 02 00 00       	push   $0x200
c0003c6e:	50                   	push   %eax
c0003c6f:	ff 75 b8             	pushl  -0x48(%ebp)
c0003c72:	ff 75 ec             	pushl  -0x14(%ebp)
c0003c75:	e8 2a ea ff ff       	call   c00026a4 <rd_wt>
c0003c7a:	83 c4 20             	add    $0x20,%esp
c0003c7d:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003c82:	89 c1                	mov    %eax,%ecx
c0003c84:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003c87:	8d 50 01             	lea    0x1(%eax),%edx
c0003c8a:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0003c8d:	83 ec 0c             	sub    $0xc,%esp
c0003c90:	6a 07                	push   $0x7
c0003c92:	68 00 02 00 00       	push   $0x200
c0003c97:	51                   	push   %ecx
c0003c98:	ff 75 b8             	pushl  -0x48(%ebp)
c0003c9b:	50                   	push   %eax
c0003c9c:	e8 03 ea ff ff       	call   c00026a4 <rd_wt>
c0003ca1:	83 c4 20             	add    $0x20,%esp
c0003ca4:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003caa:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003cad:	01 d0                	add    %edx,%eax
c0003caf:	c6 00 00             	movb   $0x0,(%eax)
c0003cb2:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0003cb6:	83 6d f4 08          	subl   $0x8,-0xc(%ebp)
c0003cba:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003cbd:	3b 45 a0             	cmp    -0x60(%ebp),%eax
c0003cc0:	7c 8d                	jl     c0003c4f <do_unlink+0x23a>
c0003cc2:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0003cc9:	75 4c                	jne    c0003d17 <do_unlink+0x302>
c0003ccb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0003cd2:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003cd7:	83 ec 0c             	sub    $0xc,%esp
c0003cda:	6a 0a                	push   $0xa
c0003cdc:	68 00 02 00 00       	push   $0x200
c0003ce1:	50                   	push   %eax
c0003ce2:	ff 75 b8             	pushl  -0x48(%ebp)
c0003ce5:	ff 75 ec             	pushl  -0x14(%ebp)
c0003ce8:	e8 b7 e9 ff ff       	call   c00026a4 <rd_wt>
c0003ced:	83 c4 20             	add    $0x20,%esp
c0003cf0:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003cf5:	89 c1                	mov    %eax,%ecx
c0003cf7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003cfa:	8d 50 01             	lea    0x1(%eax),%edx
c0003cfd:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0003d00:	83 ec 0c             	sub    $0xc,%esp
c0003d03:	6a 07                	push   $0x7
c0003d05:	68 00 02 00 00       	push   $0x200
c0003d0a:	51                   	push   %ecx
c0003d0b:	ff 75 b8             	pushl  -0x48(%ebp)
c0003d0e:	50                   	push   %eax
c0003d0f:	e8 90 e9 ff ff       	call   c00026a4 <rd_wt>
c0003d14:	83 c4 20             	add    $0x20,%esp
c0003d17:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003d1d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003d20:	01 d0                	add    %edx,%eax
c0003d22:	0f b6 10             	movzbl (%eax),%edx
c0003d25:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003d28:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0003d2d:	89 c1                	mov    %eax,%ecx
c0003d2f:	d3 e3                	shl    %cl,%ebx
c0003d31:	89 d8                	mov    %ebx,%eax
c0003d33:	89 c3                	mov    %eax,%ebx
c0003d35:	8b 0d a4 31 01 c0    	mov    0xc00131a4,%ecx
c0003d3b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003d3e:	01 c8                	add    %ecx,%eax
c0003d40:	21 da                	and    %ebx,%edx
c0003d42:	88 10                	mov    %dl,(%eax)
c0003d44:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003d49:	83 ec 0c             	sub    $0xc,%esp
c0003d4c:	6a 0a                	push   $0xa
c0003d4e:	68 00 02 00 00       	push   $0x200
c0003d53:	50                   	push   %eax
c0003d54:	ff 75 b8             	pushl  -0x48(%ebp)
c0003d57:	ff 75 ec             	pushl  -0x14(%ebp)
c0003d5a:	e8 45 e9 ff ff       	call   c00026a4 <rd_wt>
c0003d5f:	83 c4 20             	add    $0x20,%esp
c0003d62:	c7 85 6c ff ff ff 00 	movl   $0x0,-0x94(%ebp)
c0003d69:	00 00 00 
c0003d6c:	c7 85 68 ff ff ff 00 	movl   $0x0,-0x98(%ebp)
c0003d73:	00 00 00 
c0003d76:	c7 85 70 ff ff ff 00 	movl   $0x0,-0x90(%ebp)
c0003d7d:	00 00 00 
c0003d80:	83 ec 0c             	sub    $0xc,%esp
c0003d83:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0003d89:	50                   	push   %eax
c0003d8a:	e8 ed 04 00 00       	call   c000427c <sync_inode>
c0003d8f:	83 c4 10             	add    $0x10,%esp
c0003d92:	83 ec 0c             	sub    $0xc,%esp
c0003d95:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0003d9b:	50                   	push   %eax
c0003d9c:	e8 2f 06 00 00       	call   c00043d0 <put_inode>
c0003da1:	83 c4 10             	add    $0x10,%esp
c0003da4:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0003da7:	8b 00                	mov    (%eax),%eax
c0003da9:	89 45 9c             	mov    %eax,-0x64(%ebp)
c0003dac:	c7 45 98 c0 31 01 c0 	movl   $0xc00131c0,-0x68(%ebp)
c0003db3:	8b 45 98             	mov    -0x68(%ebp),%eax
c0003db6:	8b 40 04             	mov    0x4(%eax),%eax
c0003db9:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0003dbc:	8b 45 98             	mov    -0x68(%ebp),%eax
c0003dbf:	8b 40 0c             	mov    0xc(%eax),%eax
c0003dc2:	89 45 90             	mov    %eax,-0x70(%ebp)
c0003dc5:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0003dc8:	c1 e8 04             	shr    $0x4,%eax
c0003dcb:	89 45 8c             	mov    %eax,-0x74(%ebp)
c0003dce:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0003dd5:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0003ddc:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0003de3:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0003dea:	e9 a5 00 00 00       	jmp    c0003e94 <do_unlink+0x47f>
c0003def:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003df4:	89 c1                	mov    %eax,%ecx
c0003df6:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0003df9:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0003dfc:	01 d0                	add    %edx,%eax
c0003dfe:	83 ec 0c             	sub    $0xc,%esp
c0003e01:	6a 07                	push   $0x7
c0003e03:	68 00 02 00 00       	push   $0x200
c0003e08:	51                   	push   %ecx
c0003e09:	ff 75 b8             	pushl  -0x48(%ebp)
c0003e0c:	50                   	push   %eax
c0003e0d:	e8 92 e8 ff ff       	call   c00026a4 <rd_wt>
c0003e12:	83 c4 20             	add    $0x20,%esp
c0003e15:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0003e1a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0003e1d:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0003e24:	eb 51                	jmp    c0003e77 <do_unlink+0x462>
c0003e26:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0003e2a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003e2d:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0003e30:	7f 4f                	jg     c0003e81 <do_unlink+0x46c>
c0003e32:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0003e35:	83 c0 10             	add    $0x10,%eax
c0003e38:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0003e3b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0003e3e:	83 c0 04             	add    $0x4,%eax
c0003e41:	83 ec 08             	sub    $0x8,%esp
c0003e44:	ff 75 08             	pushl  0x8(%ebp)
c0003e47:	50                   	push   %eax
c0003e48:	e8 7e 63 00 00       	call   c000a1cb <strcmp>
c0003e4d:	83 c4 10             	add    $0x10,%esp
c0003e50:	85 c0                	test   %eax,%eax
c0003e52:	75 1b                	jne    c0003e6f <do_unlink+0x45a>
c0003e54:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c0003e5b:	83 ec 04             	sub    $0x4,%esp
c0003e5e:	6a 10                	push   $0x10
c0003e60:	6a 00                	push   $0x0
c0003e62:	ff 75 d4             	pushl  -0x2c(%ebp)
c0003e65:	e8 b5 7d 00 00       	call   c000bc1f <Memset>
c0003e6a:	83 c4 10             	add    $0x10,%esp
c0003e6d:	eb 13                	jmp    c0003e82 <do_unlink+0x46d>
c0003e6f:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
c0003e73:	83 45 d4 10          	addl   $0x10,-0x2c(%ebp)
c0003e77:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0003e7a:	3b 45 90             	cmp    -0x70(%ebp),%eax
c0003e7d:	7c a7                	jl     c0003e26 <do_unlink+0x411>
c0003e7f:	eb 01                	jmp    c0003e82 <do_unlink+0x46d>
c0003e81:	90                   	nop
c0003e82:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003e85:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0003e88:	7f 16                	jg     c0003ea0 <do_unlink+0x48b>
c0003e8a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0003e8e:	75 10                	jne    c0003ea0 <do_unlink+0x48b>
c0003e90:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
c0003e94:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0003e97:	3b 45 90             	cmp    -0x70(%ebp),%eax
c0003e9a:	0f 8c 4f ff ff ff    	jl     c0003def <do_unlink+0x3da>
c0003ea0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003ea3:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0003ea6:	75 17                	jne    c0003ebf <do_unlink+0x4aa>
c0003ea8:	8b 45 98             	mov    -0x68(%ebp),%eax
c0003eab:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0003eae:	89 50 04             	mov    %edx,0x4(%eax)
c0003eb1:	83 ec 0c             	sub    $0xc,%esp
c0003eb4:	ff 75 98             	pushl  -0x68(%ebp)
c0003eb7:	e8 c0 03 00 00       	call   c000427c <sync_inode>
c0003ebc:	83 c4 10             	add    $0x10,%esp
c0003ebf:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0003ec3:	74 26                	je     c0003eeb <do_unlink+0x4d6>
c0003ec5:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003eca:	89 c1                	mov    %eax,%ecx
c0003ecc:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0003ecf:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003ed2:	01 d0                	add    %edx,%eax
c0003ed4:	83 ec 0c             	sub    $0xc,%esp
c0003ed7:	6a 0a                	push   $0xa
c0003ed9:	68 00 02 00 00       	push   $0x200
c0003ede:	51                   	push   %ecx
c0003edf:	ff 75 b8             	pushl  -0x48(%ebp)
c0003ee2:	50                   	push   %eax
c0003ee3:	e8 bc e7 ff ff       	call   c00026a4 <rd_wt>
c0003ee8:	83 c4 20             	add    $0x20,%esp
c0003eeb:	90                   	nop
c0003eec:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0003eef:	c9                   	leave  
c0003ef0:	c3                   	ret    

c0003ef1 <do_rdwt>:
c0003ef1:	55                   	push   %ebp
c0003ef2:	89 e5                	mov    %esp,%ebp
c0003ef4:	81 ec 98 00 00 00    	sub    $0x98,%esp
c0003efa:	8b 45 08             	mov    0x8(%ebp),%eax
c0003efd:	8b 40 78             	mov    0x78(%eax),%eax
c0003f00:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0003f03:	8b 45 08             	mov    0x8(%ebp),%eax
c0003f06:	8b 40 60             	mov    0x60(%eax),%eax
c0003f09:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0003f0c:	8b 45 08             	mov    0x8(%ebp),%eax
c0003f0f:	8b 40 6c             	mov    0x6c(%eax),%eax
c0003f12:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0003f15:	8b 45 08             	mov    0x8(%ebp),%eax
c0003f18:	8b 00                	mov    (%eax),%eax
c0003f1a:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003f1d:	8b 45 08             	mov    0x8(%ebp),%eax
c0003f20:	8b 40 10             	mov    0x10(%eax),%eax
c0003f23:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0003f26:	8b 45 08             	mov    0x8(%ebp),%eax
c0003f29:	8b 40 50             	mov    0x50(%eax),%eax
c0003f2c:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0003f2f:	83 ec 0c             	sub    $0xc,%esp
c0003f32:	ff 75 d0             	pushl  -0x30(%ebp)
c0003f35:	e8 e2 06 00 00       	call   c000461c <pid2proc>
c0003f3a:	83 c4 10             	add    $0x10,%esp
c0003f3d:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0003f40:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0003f43:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0003f46:	83 c2 50             	add    $0x50,%edx
c0003f49:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
c0003f4d:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0003f50:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0003f53:	8b 40 08             	mov    0x8(%eax),%eax
c0003f56:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0003f59:	8b 45 08             	mov    0x8(%ebp),%eax
c0003f5c:	8b 00                	mov    (%eax),%eax
c0003f5e:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0003f61:	83 ec 08             	sub    $0x8,%esp
c0003f64:	ff 75 bc             	pushl  -0x44(%ebp)
c0003f67:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c0003f6d:	50                   	push   %eax
c0003f6e:	e8 0d f2 ff ff       	call   c0003180 <get_inode>
c0003f73:	83 c4 10             	add    $0x10,%esp
c0003f76:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0003f79:	83 7d b4 00          	cmpl   $0x0,-0x4c(%ebp)
c0003f7d:	75 10                	jne    c0003f8f <do_rdwt+0x9e>
c0003f7f:	83 ec 0c             	sub    $0xc,%esp
c0003f82:	68 48 b2 00 c0       	push   $0xc000b248
c0003f87:	e8 9d 54 00 00       	call   c0009429 <panic>
c0003f8c:	83 c4 10             	add    $0x10,%esp
c0003f8f:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c0003f95:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0003f98:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0003f9b:	8b 40 04             	mov    0x4(%eax),%eax
c0003f9e:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0003fa1:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c0003fa5:	74 22                	je     c0003fc9 <do_rdwt+0xd8>
c0003fa7:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c0003fab:	74 1c                	je     c0003fc9 <do_rdwt+0xd8>
c0003fad:	68 a7 04 00 00       	push   $0x4a7
c0003fb2:	68 b4 b0 00 c0       	push   $0xc000b0b4
c0003fb7:	68 b4 b0 00 c0       	push   $0xc000b0b4
c0003fbc:	68 58 b2 00 c0       	push   $0xc000b258
c0003fc1:	e8 81 54 00 00       	call   c0009447 <assertion_failure>
c0003fc6:	83 c4 10             	add    $0x10,%esp
c0003fc9:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
c0003fcf:	83 f8 01             	cmp    $0x1,%eax
c0003fd2:	0f 85 86 00 00 00    	jne    c000405e <do_rdwt+0x16d>
c0003fd8:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c0003fdc:	75 09                	jne    c0003fe7 <do_rdwt+0xf6>
c0003fde:	c7 45 f4 d2 07 00 00 	movl   $0x7d2,-0xc(%ebp)
c0003fe5:	eb 0d                	jmp    c0003ff4 <do_rdwt+0x103>
c0003fe7:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c0003feb:	75 07                	jne    c0003ff4 <do_rdwt+0x103>
c0003fed:	c7 45 f4 d3 07 00 00 	movl   $0x7d3,-0xc(%ebp)
c0003ff4:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0003ff7:	8b 45 08             	mov    0x8(%ebp),%eax
c0003ffa:	89 50 78             	mov    %edx,0x78(%eax)
c0003ffd:	8b 55 b8             	mov    -0x48(%ebp),%edx
c0004000:	8b 45 08             	mov    0x8(%ebp),%eax
c0004003:	89 50 68             	mov    %edx,0x68(%eax)
c0004006:	83 ec 04             	sub    $0x4,%esp
c0004009:	6a 04                	push   $0x4
c000400b:	ff 75 08             	pushl  0x8(%ebp)
c000400e:	6a 03                	push   $0x3
c0004010:	e8 4f 5e 00 00       	call   c0009e64 <send_rec>
c0004015:	83 c4 10             	add    $0x10,%esp
c0004018:	8b 45 08             	mov    0x8(%ebp),%eax
c000401b:	8b 40 78             	mov    0x78(%eax),%eax
c000401e:	83 f8 66             	cmp    $0x66,%eax
c0004021:	75 13                	jne    c0004036 <do_rdwt+0x145>
c0004023:	83 ec 04             	sub    $0x4,%esp
c0004026:	ff 75 b8             	pushl  -0x48(%ebp)
c0004029:	ff 75 08             	pushl  0x8(%ebp)
c000402c:	6a 01                	push   $0x1
c000402e:	e8 31 5e 00 00       	call   c0009e64 <send_rec>
c0004033:	83 c4 10             	add    $0x10,%esp
c0004036:	8b 45 08             	mov    0x8(%ebp),%eax
c0004039:	8b 40 78             	mov    0x78(%eax),%eax
c000403c:	83 f8 65             	cmp    $0x65,%eax
c000403f:	75 13                	jne    c0004054 <do_rdwt+0x163>
c0004041:	83 ec 04             	sub    $0x4,%esp
c0004044:	ff 75 b8             	pushl  -0x48(%ebp)
c0004047:	ff 75 08             	pushl  0x8(%ebp)
c000404a:	6a 01                	push   $0x1
c000404c:	e8 13 5e 00 00       	call   c0009e64 <send_rec>
c0004051:	83 c4 10             	add    $0x10,%esp
c0004054:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0004059:	e9 1c 02 00 00       	jmp    c000427a <do_rdwt+0x389>
c000405e:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c0004062:	75 18                	jne    c000407c <do_rdwt+0x18b>
c0004064:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c000406a:	c1 e0 09             	shl    $0x9,%eax
c000406d:	39 45 ac             	cmp    %eax,-0x54(%ebp)
c0004070:	75 0a                	jne    c000407c <do_rdwt+0x18b>
c0004072:	b8 00 00 00 00       	mov    $0x0,%eax
c0004077:	e9 fe 01 00 00       	jmp    c000427a <do_rdwt+0x389>
c000407c:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c0004080:	75 14                	jne    c0004096 <do_rdwt+0x1a5>
c0004082:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0004085:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0004088:	01 d0                	add    %edx,%eax
c000408a:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c000408d:	0f 4e 45 b0          	cmovle -0x50(%ebp),%eax
c0004091:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0004094:	eb 19                	jmp    c00040af <do_rdwt+0x1be>
c0004096:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0004099:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000409c:	01 c2                	add    %eax,%edx
c000409e:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c00040a4:	c1 e0 09             	shl    $0x9,%eax
c00040a7:	39 c2                	cmp    %eax,%edx
c00040a9:	0f 4e c2             	cmovle %edx,%eax
c00040ac:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00040af:	8b 45 ac             	mov    -0x54(%ebp),%eax
c00040b2:	99                   	cltd   
c00040b3:	c1 ea 17             	shr    $0x17,%edx
c00040b6:	01 d0                	add    %edx,%eax
c00040b8:	25 ff 01 00 00       	and    $0x1ff,%eax
c00040bd:	29 d0                	sub    %edx,%eax
c00040bf:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00040c2:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c00040c8:	8b 45 ac             	mov    -0x54(%ebp),%eax
c00040cb:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c00040d1:	85 c0                	test   %eax,%eax
c00040d3:	0f 48 c1             	cmovs  %ecx,%eax
c00040d6:	c1 f8 09             	sar    $0x9,%eax
c00040d9:	01 d0                	add    %edx,%eax
c00040db:	89 45 a8             	mov    %eax,-0x58(%ebp)
c00040de:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c00040e4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00040e7:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c00040ed:	85 c0                	test   %eax,%eax
c00040ef:	0f 48 c1             	cmovs  %ecx,%eax
c00040f2:	c1 f8 09             	sar    $0x9,%eax
c00040f5:	01 d0                	add    %edx,%eax
c00040f7:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c00040fa:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c00040fd:	2b 45 a8             	sub    -0x58(%ebp),%eax
c0004100:	ba 00 00 10 00       	mov    $0x100000,%edx
c0004105:	39 d0                	cmp    %edx,%eax
c0004107:	7d 0b                	jge    c0004114 <do_rdwt+0x223>
c0004109:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c000410c:	2b 45 a8             	sub    -0x58(%ebp),%eax
c000410f:	83 c0 01             	add    $0x1,%eax
c0004112:	eb 05                	jmp    c0004119 <do_rdwt+0x228>
c0004114:	b8 00 00 10 00       	mov    $0x100000,%eax
c0004119:	89 45 a0             	mov    %eax,-0x60(%ebp)
c000411c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000411f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0004122:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0004129:	8b 45 08             	mov    0x8(%ebp),%eax
c000412c:	8b 00                	mov    (%eax),%eax
c000412e:	83 ec 0c             	sub    $0xc,%esp
c0004131:	50                   	push   %eax
c0004132:	e8 e5 04 00 00       	call   c000461c <pid2proc>
c0004137:	83 c4 10             	add    $0x10,%esp
c000413a:	89 45 9c             	mov    %eax,-0x64(%ebp)
c000413d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0004140:	83 ec 08             	sub    $0x8,%esp
c0004143:	50                   	push   %eax
c0004144:	ff 75 cc             	pushl  -0x34(%ebp)
c0004147:	e8 08 2b 00 00       	call   c0006c54 <alloc_virtual_memory>
c000414c:	83 c4 10             	add    $0x10,%esp
c000414f:	89 45 98             	mov    %eax,-0x68(%ebp)
c0004152:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0004155:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0004158:	e9 c5 00 00 00       	jmp    c0004222 <do_rdwt+0x331>
c000415d:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0004160:	c1 e0 09             	shl    $0x9,%eax
c0004163:	2b 45 ec             	sub    -0x14(%ebp),%eax
c0004166:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c0004169:	0f 4e 45 e8          	cmovle -0x18(%ebp),%eax
c000416d:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0004170:	c7 45 90 20 00 00 00 	movl   $0x20,-0x70(%ebp)
c0004177:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c000417b:	75 46                	jne    c00041c3 <do_rdwt+0x2d2>
c000417d:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0004180:	c1 e0 09             	shl    $0x9,%eax
c0004183:	8b 15 84 27 01 c0    	mov    0xc0012784,%edx
c0004189:	83 ec 0c             	sub    $0xc,%esp
c000418c:	6a 07                	push   $0x7
c000418e:	50                   	push   %eax
c000418f:	52                   	push   %edx
c0004190:	ff 75 90             	pushl  -0x70(%ebp)
c0004193:	ff 75 e0             	pushl  -0x20(%ebp)
c0004196:	e8 09 e5 ff ff       	call   c00026a4 <rd_wt>
c000419b:	83 c4 20             	add    $0x20,%esp
c000419e:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c00041a4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00041a7:	01 d0                	add    %edx,%eax
c00041a9:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c00041ac:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c00041af:	01 ca                	add    %ecx,%edx
c00041b1:	83 ec 04             	sub    $0x4,%esp
c00041b4:	ff 75 94             	pushl  -0x6c(%ebp)
c00041b7:	50                   	push   %eax
c00041b8:	52                   	push   %edx
c00041b9:	e8 b0 38 00 00       	call   c0007a6e <Memcpy>
c00041be:	83 c4 10             	add    $0x10,%esp
c00041c1:	eb 46                	jmp    c0004209 <do_rdwt+0x318>
c00041c3:	8b 55 98             	mov    -0x68(%ebp),%edx
c00041c6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00041c9:	01 d0                	add    %edx,%eax
c00041cb:	89 c1                	mov    %eax,%ecx
c00041cd:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c00041d3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00041d6:	01 d0                	add    %edx,%eax
c00041d8:	83 ec 04             	sub    $0x4,%esp
c00041db:	ff 75 94             	pushl  -0x6c(%ebp)
c00041de:	51                   	push   %ecx
c00041df:	50                   	push   %eax
c00041e0:	e8 89 38 00 00       	call   c0007a6e <Memcpy>
c00041e5:	83 c4 10             	add    $0x10,%esp
c00041e8:	8b 45 a0             	mov    -0x60(%ebp),%eax
c00041eb:	c1 e0 09             	shl    $0x9,%eax
c00041ee:	8b 15 84 27 01 c0    	mov    0xc0012784,%edx
c00041f4:	83 ec 0c             	sub    $0xc,%esp
c00041f7:	6a 0a                	push   $0xa
c00041f9:	50                   	push   %eax
c00041fa:	52                   	push   %edx
c00041fb:	ff 75 90             	pushl  -0x70(%ebp)
c00041fe:	ff 75 e0             	pushl  -0x20(%ebp)
c0004201:	e8 9e e4 ff ff       	call   c00026a4 <rd_wt>
c0004206:	83 c4 20             	add    $0x20,%esp
c0004209:	8b 45 94             	mov    -0x6c(%ebp),%eax
c000420c:	29 45 e8             	sub    %eax,-0x18(%ebp)
c000420f:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0004212:	01 45 e4             	add    %eax,-0x1c(%ebp)
c0004215:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000421c:	8b 45 a0             	mov    -0x60(%ebp),%eax
c000421f:	01 45 e0             	add    %eax,-0x20(%ebp)
c0004222:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004225:	3b 45 a4             	cmp    -0x5c(%ebp),%eax
c0004228:	7f 0a                	jg     c0004234 <do_rdwt+0x343>
c000422a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c000422e:	0f 85 29 ff ff ff    	jne    c000415d <do_rdwt+0x26c>
c0004234:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0004237:	8b 50 04             	mov    0x4(%eax),%edx
c000423a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000423d:	01 c2                	add    %eax,%edx
c000423f:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0004242:	89 50 04             	mov    %edx,0x4(%eax)
c0004245:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0004248:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000424b:	01 c2                	add    %eax,%edx
c000424d:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c0004253:	39 c2                	cmp    %eax,%edx
c0004255:	7e 20                	jle    c0004277 <do_rdwt+0x386>
c0004257:	8b 55 ac             	mov    -0x54(%ebp),%edx
c000425a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000425d:	01 d0                	add    %edx,%eax
c000425f:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c0004265:	83 ec 0c             	sub    $0xc,%esp
c0004268:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c000426e:	50                   	push   %eax
c000426f:	e8 08 00 00 00       	call   c000427c <sync_inode>
c0004274:	83 c4 10             	add    $0x10,%esp
c0004277:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000427a:	c9                   	leave  
c000427b:	c3                   	ret    

c000427c <sync_inode>:
c000427c:	55                   	push   %ebp
c000427d:	89 e5                	mov    %esp,%ebp
c000427f:	53                   	push   %ebx
c0004280:	83 ec 34             	sub    $0x34,%esp
c0004283:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000428a:	eb 74                	jmp    c0004300 <sync_inode+0x84>
c000428c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000428f:	89 d0                	mov    %edx,%eax
c0004291:	c1 e0 02             	shl    $0x2,%eax
c0004294:	01 d0                	add    %edx,%eax
c0004296:	c1 e0 03             	shl    $0x3,%eax
c0004299:	05 b0 27 01 c0       	add    $0xc00127b0,%eax
c000429e:	8b 10                	mov    (%eax),%edx
c00042a0:	8b 45 08             	mov    0x8(%ebp),%eax
c00042a3:	8b 40 10             	mov    0x10(%eax),%eax
c00042a6:	39 c2                	cmp    %eax,%edx
c00042a8:	75 52                	jne    c00042fc <sync_inode+0x80>
c00042aa:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00042ad:	89 d0                	mov    %edx,%eax
c00042af:	c1 e0 02             	shl    $0x2,%eax
c00042b2:	01 d0                	add    %edx,%eax
c00042b4:	c1 e0 03             	shl    $0x3,%eax
c00042b7:	8d 90 a0 27 01 c0    	lea    -0x3ffed860(%eax),%edx
c00042bd:	8b 45 08             	mov    0x8(%ebp),%eax
c00042c0:	8b 08                	mov    (%eax),%ecx
c00042c2:	89 0a                	mov    %ecx,(%edx)
c00042c4:	8b 48 04             	mov    0x4(%eax),%ecx
c00042c7:	89 4a 04             	mov    %ecx,0x4(%edx)
c00042ca:	8b 48 08             	mov    0x8(%eax),%ecx
c00042cd:	89 4a 08             	mov    %ecx,0x8(%edx)
c00042d0:	8b 48 0c             	mov    0xc(%eax),%ecx
c00042d3:	89 4a 0c             	mov    %ecx,0xc(%edx)
c00042d6:	8b 48 10             	mov    0x10(%eax),%ecx
c00042d9:	89 4a 10             	mov    %ecx,0x10(%edx)
c00042dc:	8b 48 14             	mov    0x14(%eax),%ecx
c00042df:	89 4a 14             	mov    %ecx,0x14(%edx)
c00042e2:	8b 48 18             	mov    0x18(%eax),%ecx
c00042e5:	89 4a 18             	mov    %ecx,0x18(%edx)
c00042e8:	8b 48 1c             	mov    0x1c(%eax),%ecx
c00042eb:	89 4a 1c             	mov    %ecx,0x1c(%edx)
c00042ee:	8b 48 20             	mov    0x20(%eax),%ecx
c00042f1:	89 4a 20             	mov    %ecx,0x20(%edx)
c00042f4:	8b 40 24             	mov    0x24(%eax),%eax
c00042f7:	89 42 24             	mov    %eax,0x24(%edx)
c00042fa:	eb 0a                	jmp    c0004306 <sync_inode+0x8a>
c00042fc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0004300:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c0004304:	7e 86                	jle    c000428c <sync_inode+0x10>
c0004306:	c7 45 f0 20 00 00 00 	movl   $0x20,-0x10(%ebp)
c000430d:	8b 45 08             	mov    0x8(%ebp),%eax
c0004310:	8b 40 10             	mov    0x10(%eax),%eax
c0004313:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0004316:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004319:	8d 48 ff             	lea    -0x1(%eax),%ecx
c000431c:	b8 00 02 00 00       	mov    $0x200,%eax
c0004321:	99                   	cltd   
c0004322:	f7 7d f0             	idivl  -0x10(%ebp)
c0004325:	89 c3                	mov    %eax,%ebx
c0004327:	89 c8                	mov    %ecx,%eax
c0004329:	99                   	cltd   
c000432a:	f7 fb                	idiv   %ebx
c000432c:	89 55 e8             	mov    %edx,-0x18(%ebp)
c000432f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004332:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0004335:	b8 00 02 00 00       	mov    $0x200,%eax
c000433a:	99                   	cltd   
c000433b:	f7 7d f0             	idivl  -0x10(%ebp)
c000433e:	89 c3                	mov    %eax,%ebx
c0004340:	89 c8                	mov    %ecx,%eax
c0004342:	99                   	cltd   
c0004343:	f7 fb                	idiv   %ebx
c0004345:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0004348:	8b 45 08             	mov    0x8(%ebp),%eax
c000434b:	8b 40 20             	mov    0x20(%eax),%eax
c000434e:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0004351:	e8 0a 01 00 00       	call   c0004460 <get_super_block>
c0004356:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0004359:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000435c:	8b 40 04             	mov    0x4(%eax),%eax
c000435f:	8d 50 02             	lea    0x2(%eax),%edx
c0004362:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0004365:	8b 40 08             	mov    0x8(%eax),%eax
c0004368:	01 c2                	add    %eax,%edx
c000436a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000436d:	01 d0                	add    %edx,%eax
c000436f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0004372:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0004377:	83 ec 0c             	sub    $0xc,%esp
c000437a:	6a 07                	push   $0x7
c000437c:	68 00 02 00 00       	push   $0x200
c0004381:	50                   	push   %eax
c0004382:	ff 75 e0             	pushl  -0x20(%ebp)
c0004385:	ff 75 d8             	pushl  -0x28(%ebp)
c0004388:	e8 17 e3 ff ff       	call   c00026a4 <rd_wt>
c000438d:	83 c4 20             	add    $0x20,%esp
c0004390:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0004395:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0004398:	83 ec 04             	sub    $0x4,%esp
c000439b:	ff 75 f0             	pushl  -0x10(%ebp)
c000439e:	ff 75 08             	pushl  0x8(%ebp)
c00043a1:	ff 75 d4             	pushl  -0x2c(%ebp)
c00043a4:	e8 c5 36 00 00       	call   c0007a6e <Memcpy>
c00043a9:	83 c4 10             	add    $0x10,%esp
c00043ac:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00043b1:	83 ec 0c             	sub    $0xc,%esp
c00043b4:	6a 0a                	push   $0xa
c00043b6:	68 00 02 00 00       	push   $0x200
c00043bb:	50                   	push   %eax
c00043bc:	ff 75 e0             	pushl  -0x20(%ebp)
c00043bf:	ff 75 d8             	pushl  -0x28(%ebp)
c00043c2:	e8 dd e2 ff ff       	call   c00026a4 <rd_wt>
c00043c7:	83 c4 20             	add    $0x20,%esp
c00043ca:	90                   	nop
c00043cb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c00043ce:	c9                   	leave  
c00043cf:	c3                   	ret    

c00043d0 <put_inode>:
c00043d0:	55                   	push   %ebp
c00043d1:	89 e5                	mov    %esp,%ebp
c00043d3:	83 ec 08             	sub    $0x8,%esp
c00043d6:	8b 45 08             	mov    0x8(%ebp),%eax
c00043d9:	8b 40 24             	mov    0x24(%eax),%eax
c00043dc:	85 c0                	test   %eax,%eax
c00043de:	7f 1c                	jg     c00043fc <put_inode+0x2c>
c00043e0:	68 4c 05 00 00       	push   $0x54c
c00043e5:	68 b4 b0 00 c0       	push   $0xc000b0b4
c00043ea:	68 b4 b0 00 c0       	push   $0xc000b0b4
c00043ef:	68 8c b2 00 c0       	push   $0xc000b28c
c00043f4:	e8 4e 50 00 00       	call   c0009447 <assertion_failure>
c00043f9:	83 c4 10             	add    $0x10,%esp
c00043fc:	8b 45 08             	mov    0x8(%ebp),%eax
c00043ff:	8b 40 24             	mov    0x24(%eax),%eax
c0004402:	8d 50 ff             	lea    -0x1(%eax),%edx
c0004405:	8b 45 08             	mov    0x8(%ebp),%eax
c0004408:	89 50 24             	mov    %edx,0x24(%eax)
c000440b:	90                   	nop
c000440c:	c9                   	leave  
c000440d:	c3                   	ret    

c000440e <do_close>:
c000440e:	55                   	push   %ebp
c000440f:	89 e5                	mov    %esp,%ebp
c0004411:	a1 c8 0b 01 c0       	mov    0xc0010bc8,%eax
c0004416:	8b 55 08             	mov    0x8(%ebp),%edx
c0004419:	83 c2 50             	add    $0x50,%edx
c000441c:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
c0004420:	8b 50 0c             	mov    0xc(%eax),%edx
c0004423:	83 ea 01             	sub    $0x1,%edx
c0004426:	89 50 0c             	mov    %edx,0xc(%eax)
c0004429:	8b 40 0c             	mov    0xc(%eax),%eax
c000442c:	85 c0                	test   %eax,%eax
c000442e:	75 16                	jne    c0004446 <do_close+0x38>
c0004430:	a1 c8 0b 01 c0       	mov    0xc0010bc8,%eax
c0004435:	8b 55 08             	mov    0x8(%ebp),%edx
c0004438:	83 c2 50             	add    $0x50,%edx
c000443b:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
c000443f:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0004446:	a1 c8 0b 01 c0       	mov    0xc0010bc8,%eax
c000444b:	8b 55 08             	mov    0x8(%ebp),%edx
c000444e:	83 c2 50             	add    $0x50,%edx
c0004451:	c7 44 90 08 00 00 00 	movl   $0x0,0x8(%eax,%edx,4)
c0004458:	00 
c0004459:	b8 00 00 00 00       	mov    $0x0,%eax
c000445e:	5d                   	pop    %ebp
c000445f:	c3                   	ret    

c0004460 <get_super_block>:
c0004460:	55                   	push   %ebp
c0004461:	89 e5                	mov    %esp,%ebp
c0004463:	83 ec 08             	sub    $0x8,%esp
c0004466:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c000446b:	83 ec 0c             	sub    $0xc,%esp
c000446e:	6a 07                	push   $0x7
c0004470:	68 00 02 00 00       	push   $0x200
c0004475:	50                   	push   %eax
c0004476:	6a 20                	push   $0x20
c0004478:	6a 01                	push   $0x1
c000447a:	e8 25 e2 ff ff       	call   c00026a4 <rd_wt>
c000447f:	83 c4 20             	add    $0x20,%esp
c0004482:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0004488:	a1 a0 31 01 c0       	mov    0xc00131a0,%eax
c000448d:	8b 0a                	mov    (%edx),%ecx
c000448f:	89 08                	mov    %ecx,(%eax)
c0004491:	8b 4a 04             	mov    0x4(%edx),%ecx
c0004494:	89 48 04             	mov    %ecx,0x4(%eax)
c0004497:	8b 4a 08             	mov    0x8(%edx),%ecx
c000449a:	89 48 08             	mov    %ecx,0x8(%eax)
c000449d:	8b 4a 0c             	mov    0xc(%edx),%ecx
c00044a0:	89 48 0c             	mov    %ecx,0xc(%eax)
c00044a3:	8b 4a 10             	mov    0x10(%edx),%ecx
c00044a6:	89 48 10             	mov    %ecx,0x10(%eax)
c00044a9:	8b 4a 14             	mov    0x14(%edx),%ecx
c00044ac:	89 48 14             	mov    %ecx,0x14(%eax)
c00044af:	8b 4a 18             	mov    0x18(%edx),%ecx
c00044b2:	89 48 18             	mov    %ecx,0x18(%eax)
c00044b5:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c00044b8:	89 48 1c             	mov    %ecx,0x1c(%eax)
c00044bb:	8b 52 20             	mov    0x20(%edx),%edx
c00044be:	89 50 20             	mov    %edx,0x20(%eax)
c00044c1:	a1 a0 31 01 c0       	mov    0xc00131a0,%eax
c00044c6:	c9                   	leave  
c00044c7:	c3                   	ret    

c00044c8 <schedule_process>:
c00044c8:	55                   	push   %ebp
c00044c9:	89 e5                	mov    %esp,%ebp
c00044cb:	83 ec 18             	sub    $0x18,%esp
c00044ce:	c7 45 f4 00 00 10 00 	movl   $0x100000,-0xc(%ebp)
c00044d5:	e8 bd ce ff ff       	call   c0001397 <get_running_thread_pcb>
c00044da:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00044dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00044e0:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c00044e7:	84 c0                	test   %al,%al
c00044e9:	75 30                	jne    c000451b <schedule_process+0x53>
c00044eb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00044ee:	c7 80 28 01 00 00 0a 	movl   $0xa,0x128(%eax)
c00044f5:	00 00 00 
c00044f8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00044fb:	c6 80 48 02 00 00 03 	movb   $0x3,0x248(%eax)
c0004502:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004505:	05 00 01 00 00       	add    $0x100,%eax
c000450a:	83 ec 08             	sub    $0x8,%esp
c000450d:	50                   	push   %eax
c000450e:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004513:	e8 8f 66 00 00       	call   c000aba7 <insertToDoubleLinkList>
c0004518:	83 c4 10             	add    $0x10,%esp
c000451b:	83 ec 0c             	sub    $0xc,%esp
c000451e:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004523:	e8 9b 64 00 00       	call   c000a9c3 <isListEmpty>
c0004528:	83 c4 10             	add    $0x10,%esp
c000452b:	84 c0                	test   %al,%al
c000452d:	74 19                	je     c0004548 <schedule_process+0x80>
c000452f:	6a 1e                	push   $0x1e
c0004531:	68 9b b2 00 c0       	push   $0xc000b29b
c0004536:	68 9b b2 00 c0       	push   $0xc000b29b
c000453b:	68 a5 b2 00 c0       	push   $0xc000b2a5
c0004540:	e8 02 4f 00 00       	call   c0009447 <assertion_failure>
c0004545:	83 c4 10             	add    $0x10,%esp
c0004548:	83 ec 0c             	sub    $0xc,%esp
c000454b:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004550:	e8 d5 66 00 00       	call   c000ac2a <popFromDoubleLinkList>
c0004555:	83 c4 10             	add    $0x10,%esp
c0004558:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000455b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000455e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0004563:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0004566:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004569:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0004570:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004573:	8b 40 08             	mov    0x8(%eax),%eax
c0004576:	85 c0                	test   %eax,%eax
c0004578:	74 28                	je     c00045a2 <schedule_process+0xda>
c000457a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000457d:	05 00 10 00 00       	add    $0x1000,%eax
c0004582:	83 ec 0c             	sub    $0xc,%esp
c0004585:	50                   	push   %eax
c0004586:	e8 fd cd ff ff       	call   c0001388 <update_tss>
c000458b:	83 c4 10             	add    $0x10,%esp
c000458e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004591:	8b 40 08             	mov    0x8(%eax),%eax
c0004594:	83 ec 0c             	sub    $0xc,%esp
c0004597:	50                   	push   %eax
c0004598:	e8 de cd ff ff       	call   c000137b <update_cr3>
c000459d:	83 c4 10             	add    $0x10,%esp
c00045a0:	eb 0f                	jmp    c00045b1 <schedule_process+0xe9>
c00045a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00045a5:	83 ec 0c             	sub    $0xc,%esp
c00045a8:	50                   	push   %eax
c00045a9:	e8 cd cd ff ff       	call   c000137b <update_cr3>
c00045ae:	83 c4 10             	add    $0x10,%esp
c00045b1:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00045b4:	a3 c0 0b 01 c0       	mov    %eax,0xc0010bc0
c00045b9:	83 ec 08             	sub    $0x8,%esp
c00045bc:	ff 75 e8             	pushl  -0x18(%ebp)
c00045bf:	ff 75 f0             	pushl  -0x10(%ebp)
c00045c2:	e8 b9 63 00 00       	call   c000a980 <switch_to>
c00045c7:	83 c4 10             	add    $0x10,%esp
c00045ca:	90                   	nop
c00045cb:	c9                   	leave  
c00045cc:	c3                   	ret    

c00045cd <clock_handler>:
c00045cd:	55                   	push   %ebp
c00045ce:	89 e5                	mov    %esp,%ebp
c00045d0:	83 ec 18             	sub    $0x18,%esp
c00045d3:	e8 bf cd ff ff       	call   c0001397 <get_running_thread_pcb>
c00045d8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00045db:	a1 c0 16 01 c0       	mov    0xc00116c0,%eax
c00045e0:	85 c0                	test   %eax,%eax
c00045e2:	74 0d                	je     c00045f1 <clock_handler+0x24>
c00045e4:	83 ec 0c             	sub    $0xc,%esp
c00045e7:	6a 04                	push   $0x4
c00045e9:	e8 10 5b 00 00       	call   c000a0fe <inform_int>
c00045ee:	83 c4 10             	add    $0x10,%esp
c00045f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00045f4:	8b 80 28 01 00 00    	mov    0x128(%eax),%eax
c00045fa:	85 c0                	test   %eax,%eax
c00045fc:	74 16                	je     c0004614 <clock_handler+0x47>
c00045fe:	a1 c0 0b 01 c0       	mov    0xc0010bc0,%eax
c0004603:	8b 90 28 01 00 00    	mov    0x128(%eax),%edx
c0004609:	83 ea 01             	sub    $0x1,%edx
c000460c:	89 90 28 01 00 00    	mov    %edx,0x128(%eax)
c0004612:	eb 05                	jmp    c0004619 <clock_handler+0x4c>
c0004614:	e8 af fe ff ff       	call   c00044c8 <schedule_process>
c0004619:	90                   	nop
c000461a:	c9                   	leave  
c000461b:	c3                   	ret    

c000461c <pid2proc>:
c000461c:	55                   	push   %ebp
c000461d:	89 e5                	mov    %esp,%ebp
c000461f:	83 ec 20             	sub    $0x20,%esp
c0004622:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0004629:	a1 04 1f 01 c0       	mov    0xc0011f04,%eax
c000462e:	8b 15 08 1f 01 c0    	mov    0xc0011f08,%edx
c0004634:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0004637:	89 55 f4             	mov    %edx,-0xc(%ebp)
c000463a:	a1 0c 1f 01 c0       	mov    0xc0011f0c,%eax
c000463f:	8b 15 10 1f 01 c0    	mov    0xc0011f10,%edx
c0004645:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0004648:	89 55 ec             	mov    %edx,-0x14(%ebp)
c000464b:	a1 08 1f 01 c0       	mov    0xc0011f08,%eax
c0004650:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004653:	eb 29                	jmp    c000467e <pid2proc+0x62>
c0004655:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004658:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c000465d:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0004660:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004663:	8b 90 24 01 00 00    	mov    0x124(%eax),%edx
c0004669:	8b 45 08             	mov    0x8(%ebp),%eax
c000466c:	39 c2                	cmp    %eax,%edx
c000466e:	75 05                	jne    c0004675 <pid2proc+0x59>
c0004670:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004673:	eb 17                	jmp    c000468c <pid2proc+0x70>
c0004675:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004678:	8b 40 04             	mov    0x4(%eax),%eax
c000467b:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000467e:	81 7d fc 0c 1f 01 c0 	cmpl   $0xc0011f0c,-0x4(%ebp)
c0004685:	75 ce                	jne    c0004655 <pid2proc+0x39>
c0004687:	b8 00 00 00 00       	mov    $0x0,%eax
c000468c:	c9                   	leave  
c000468d:	c3                   	ret    

c000468e <proc2pid>:
c000468e:	55                   	push   %ebp
c000468f:	89 e5                	mov    %esp,%ebp
c0004691:	83 ec 10             	sub    $0x10,%esp
c0004694:	8b 45 08             	mov    0x8(%ebp),%eax
c0004697:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c000469d:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00046a0:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00046a3:	c9                   	leave  
c00046a4:	c3                   	ret    

c00046a5 <InitDescriptor>:
c00046a5:	55                   	push   %ebp
c00046a6:	89 e5                	mov    %esp,%ebp
c00046a8:	83 ec 04             	sub    $0x4,%esp
c00046ab:	8b 45 14             	mov    0x14(%ebp),%eax
c00046ae:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
c00046b2:	8b 45 10             	mov    0x10(%ebp),%eax
c00046b5:	89 c2                	mov    %eax,%edx
c00046b7:	8b 45 08             	mov    0x8(%ebp),%eax
c00046ba:	66 89 10             	mov    %dx,(%eax)
c00046bd:	8b 45 0c             	mov    0xc(%ebp),%eax
c00046c0:	89 c2                	mov    %eax,%edx
c00046c2:	8b 45 08             	mov    0x8(%ebp),%eax
c00046c5:	66 89 50 02          	mov    %dx,0x2(%eax)
c00046c9:	8b 45 0c             	mov    0xc(%ebp),%eax
c00046cc:	c1 e8 10             	shr    $0x10,%eax
c00046cf:	89 c2                	mov    %eax,%edx
c00046d1:	8b 45 08             	mov    0x8(%ebp),%eax
c00046d4:	88 50 04             	mov    %dl,0x4(%eax)
c00046d7:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c00046db:	89 c2                	mov    %eax,%edx
c00046dd:	8b 45 08             	mov    0x8(%ebp),%eax
c00046e0:	88 50 05             	mov    %dl,0x5(%eax)
c00046e3:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c00046e7:	66 c1 e8 08          	shr    $0x8,%ax
c00046eb:	c1 e0 04             	shl    $0x4,%eax
c00046ee:	89 c2                	mov    %eax,%edx
c00046f0:	8b 45 10             	mov    0x10(%ebp),%eax
c00046f3:	c1 e8 10             	shr    $0x10,%eax
c00046f6:	83 e0 0f             	and    $0xf,%eax
c00046f9:	09 c2                	or     %eax,%edx
c00046fb:	8b 45 08             	mov    0x8(%ebp),%eax
c00046fe:	88 50 06             	mov    %dl,0x6(%eax)
c0004701:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004704:	c1 e8 18             	shr    $0x18,%eax
c0004707:	89 c2                	mov    %eax,%edx
c0004709:	8b 45 08             	mov    0x8(%ebp),%eax
c000470c:	88 50 07             	mov    %dl,0x7(%eax)
c000470f:	90                   	nop
c0004710:	c9                   	leave  
c0004711:	c3                   	ret    

c0004712 <Seg2PhyAddr>:
c0004712:	55                   	push   %ebp
c0004713:	89 e5                	mov    %esp,%ebp
c0004715:	83 ec 10             	sub    $0x10,%esp
c0004718:	8b 45 08             	mov    0x8(%ebp),%eax
c000471b:	c1 e8 03             	shr    $0x3,%eax
c000471e:	8b 14 c5 c4 07 01 c0 	mov    -0x3ffef83c(,%eax,8),%edx
c0004725:	8b 04 c5 c0 07 01 c0 	mov    -0x3ffef840(,%eax,8),%eax
c000472c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000472f:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0004732:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0004736:	0f b7 c0             	movzwl %ax,%eax
c0004739:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c000473d:	0f b6 d2             	movzbl %dl,%edx
c0004740:	c1 e2 10             	shl    $0x10,%edx
c0004743:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c0004749:	09 d0                	or     %edx,%eax
c000474b:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000474e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004751:	c9                   	leave  
c0004752:	c3                   	ret    

c0004753 <Seg2PhyAddrLDT>:
c0004753:	55                   	push   %ebp
c0004754:	89 e5                	mov    %esp,%ebp
c0004756:	83 ec 10             	sub    $0x10,%esp
c0004759:	8b 45 08             	mov    0x8(%ebp),%eax
c000475c:	c1 e8 03             	shr    $0x3,%eax
c000475f:	89 c2                	mov    %eax,%edx
c0004761:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004764:	83 c2 22             	add    $0x22,%edx
c0004767:	8d 54 d0 02          	lea    0x2(%eax,%edx,8),%edx
c000476b:	8b 02                	mov    (%edx),%eax
c000476d:	8b 52 04             	mov    0x4(%edx),%edx
c0004770:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004773:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0004776:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c000477a:	0f b7 c0             	movzwl %ax,%eax
c000477d:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c0004781:	0f b6 d2             	movzbl %dl,%edx
c0004784:	c1 e2 10             	shl    $0x10,%edx
c0004787:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c000478d:	09 d0                	or     %edx,%eax
c000478f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004792:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004795:	c9                   	leave  
c0004796:	c3                   	ret    

c0004797 <VirAddr2PhyAddr>:
c0004797:	55                   	push   %ebp
c0004798:	89 e5                	mov    %esp,%ebp
c000479a:	83 ec 10             	sub    $0x10,%esp
c000479d:	8b 55 0c             	mov    0xc(%ebp),%edx
c00047a0:	8b 45 08             	mov    0x8(%ebp),%eax
c00047a3:	01 d0                	add    %edx,%eax
c00047a5:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00047a8:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00047ab:	c9                   	leave  
c00047ac:	c3                   	ret    

c00047ad <v2l>:
c00047ad:	55                   	push   %ebp
c00047ae:	89 e5                	mov    %esp,%ebp
c00047b0:	83 ec 18             	sub    $0x18,%esp
c00047b3:	83 ec 0c             	sub    $0xc,%esp
c00047b6:	ff 75 08             	pushl  0x8(%ebp)
c00047b9:	e8 5e fe ff ff       	call   c000461c <pid2proc>
c00047be:	83 c4 10             	add    $0x10,%esp
c00047c1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00047c4:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c00047cb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00047ce:	83 ec 08             	sub    $0x8,%esp
c00047d1:	ff 75 f4             	pushl  -0xc(%ebp)
c00047d4:	50                   	push   %eax
c00047d5:	e8 79 ff ff ff       	call   c0004753 <Seg2PhyAddrLDT>
c00047da:	83 c4 10             	add    $0x10,%esp
c00047dd:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00047e0:	8b 55 ec             	mov    -0x14(%ebp),%edx
c00047e3:	8b 45 0c             	mov    0xc(%ebp),%eax
c00047e6:	01 d0                	add    %edx,%eax
c00047e8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00047eb:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00047ee:	c9                   	leave  
c00047ef:	c3                   	ret    

c00047f0 <init_propt>:
c00047f0:	55                   	push   %ebp
c00047f1:	89 e5                	mov    %esp,%ebp
c00047f3:	83 ec 38             	sub    $0x38,%esp
c00047f6:	6a 0e                	push   $0xe
c00047f8:	6a 08                	push   $0x8
c00047fa:	68 71 11 00 c0       	push   $0xc0001171
c00047ff:	6a 20                	push   $0x20
c0004801:	e8 58 01 00 00       	call   c000495e <InitInterruptDesc>
c0004806:	83 c4 10             	add    $0x10,%esp
c0004809:	6a 0e                	push   $0xe
c000480b:	6a 08                	push   $0x8
c000480d:	68 9e 11 00 c0       	push   $0xc000119e
c0004812:	6a 21                	push   $0x21
c0004814:	e8 45 01 00 00       	call   c000495e <InitInterruptDesc>
c0004819:	83 c4 10             	add    $0x10,%esp
c000481c:	6a 0e                	push   $0xe
c000481e:	6a 08                	push   $0x8
c0004820:	68 e0 11 00 c0       	push   $0xc00011e0
c0004825:	6a 2e                	push   $0x2e
c0004827:	e8 32 01 00 00       	call   c000495e <InitInterruptDesc>
c000482c:	83 c4 10             	add    $0x10,%esp
c000482f:	83 ec 04             	sub    $0x4,%esp
c0004832:	68 a0 15 00 00       	push   $0x15a0
c0004837:	6a 00                	push   $0x0
c0004839:	68 00 32 08 c0       	push   $0xc0083200
c000483e:	e8 dc 73 00 00       	call   c000bc1f <Memset>
c0004843:	83 c4 10             	add    $0x10,%esp
c0004846:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c000484d:	83 ec 04             	sub    $0x4,%esp
c0004850:	ff 75 f4             	pushl  -0xc(%ebp)
c0004853:	6a 00                	push   $0x0
c0004855:	68 40 16 01 c0       	push   $0xc0011640
c000485a:	e8 c0 73 00 00       	call   c000bc1f <Memset>
c000485f:	83 c4 10             	add    $0x10,%esp
c0004862:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004865:	a3 a8 16 01 c0       	mov    %eax,0xc00116a8
c000486a:	c7 05 48 16 01 c0 30 	movl   $0x30,0xc0011648
c0004871:	00 00 00 
c0004874:	83 ec 0c             	sub    $0xc,%esp
c0004877:	6a 30                	push   $0x30
c0004879:	e8 94 fe ff ff       	call   c0004712 <Seg2PhyAddr>
c000487e:	83 c4 10             	add    $0x10,%esp
c0004881:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0004884:	c7 45 ec 40 16 01 c0 	movl   $0xc0011640,-0x14(%ebp)
c000488b:	c7 45 e8 89 00 00 00 	movl   $0x89,-0x18(%ebp)
c0004892:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004895:	0f b7 d0             	movzwl %ax,%edx
c0004898:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000489b:	83 e8 01             	sub    $0x1,%eax
c000489e:	89 c1                	mov    %eax,%ecx
c00048a0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00048a3:	52                   	push   %edx
c00048a4:	51                   	push   %ecx
c00048a5:	50                   	push   %eax
c00048a6:	68 00 08 01 c0       	push   $0xc0010800
c00048ab:	e8 f5 fd ff ff       	call   c00046a5 <InitDescriptor>
c00048b0:	83 c4 10             	add    $0x10,%esp
c00048b3:	c7 45 e4 00 80 0b c0 	movl   $0xc00b8000,-0x1c(%ebp)
c00048ba:	68 f2 00 00 00       	push   $0xf2
c00048bf:	68 ff ff 00 00       	push   $0xffff
c00048c4:	ff 75 e4             	pushl  -0x1c(%ebp)
c00048c7:	68 f8 07 01 c0       	push   $0xc00107f8
c00048cc:	e8 d4 fd ff ff       	call   c00046a5 <InitDescriptor>
c00048d1:	83 c4 10             	add    $0x10,%esp
c00048d4:	c7 45 e0 b2 0c 00 00 	movl   $0xcb2,-0x20(%ebp)
c00048db:	c7 45 dc 9a 0c 00 00 	movl   $0xc9a,-0x24(%ebp)
c00048e2:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%ebp)
c00048e9:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00048ec:	0f b7 c0             	movzwl %ax,%eax
c00048ef:	50                   	push   %eax
c00048f0:	ff 75 d8             	pushl  -0x28(%ebp)
c00048f3:	6a 00                	push   $0x0
c00048f5:	68 08 08 01 c0       	push   $0xc0010808
c00048fa:	e8 a6 fd ff ff       	call   c00046a5 <InitDescriptor>
c00048ff:	83 c4 10             	add    $0x10,%esp
c0004902:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0004905:	0f b7 c0             	movzwl %ax,%eax
c0004908:	50                   	push   %eax
c0004909:	ff 75 d8             	pushl  -0x28(%ebp)
c000490c:	6a 00                	push   $0x0
c000490e:	68 10 08 01 c0       	push   $0xc0010810
c0004913:	e8 8d fd ff ff       	call   c00046a5 <InitDescriptor>
c0004918:	83 c4 10             	add    $0x10,%esp
c000491b:	c7 45 d4 b2 0c 00 00 	movl   $0xcb2,-0x2c(%ebp)
c0004922:	c7 45 d0 ba 0c 00 00 	movl   $0xcba,-0x30(%ebp)
c0004929:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000492c:	0f b7 c0             	movzwl %ax,%eax
c000492f:	50                   	push   %eax
c0004930:	ff 75 d8             	pushl  -0x28(%ebp)
c0004933:	6a 00                	push   $0x0
c0004935:	68 18 08 01 c0       	push   $0xc0010818
c000493a:	e8 66 fd ff ff       	call   c00046a5 <InitDescriptor>
c000493f:	83 c4 10             	add    $0x10,%esp
c0004942:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0004945:	0f b7 c0             	movzwl %ax,%eax
c0004948:	50                   	push   %eax
c0004949:	ff 75 d8             	pushl  -0x28(%ebp)
c000494c:	6a 00                	push   $0x0
c000494e:	68 20 08 01 c0       	push   $0xc0010820
c0004953:	e8 4d fd ff ff       	call   c00046a5 <InitDescriptor>
c0004958:	83 c4 10             	add    $0x10,%esp
c000495b:	90                   	nop
c000495c:	c9                   	leave  
c000495d:	c3                   	ret    

c000495e <InitInterruptDesc>:
c000495e:	55                   	push   %ebp
c000495f:	89 e5                	mov    %esp,%ebp
c0004961:	83 ec 10             	sub    $0x10,%esp
c0004964:	8b 45 08             	mov    0x8(%ebp),%eax
c0004967:	c1 e0 03             	shl    $0x3,%eax
c000496a:	05 e0 16 01 c0       	add    $0xc00116e0,%eax
c000496f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004972:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004975:	c6 40 04 00          	movb   $0x0,0x4(%eax)
c0004979:	8b 45 0c             	mov    0xc(%ebp),%eax
c000497c:	89 45 f8             	mov    %eax,-0x8(%ebp)
c000497f:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004982:	89 c2                	mov    %eax,%edx
c0004984:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004987:	66 89 10             	mov    %dx,(%eax)
c000498a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000498d:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
c0004993:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004996:	c1 f8 10             	sar    $0x10,%eax
c0004999:	89 c2                	mov    %eax,%edx
c000499b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000499e:	66 89 50 06          	mov    %dx,0x6(%eax)
c00049a2:	8b 45 10             	mov    0x10(%ebp),%eax
c00049a5:	c1 e0 04             	shl    $0x4,%eax
c00049a8:	89 c2                	mov    %eax,%edx
c00049aa:	8b 45 14             	mov    0x14(%ebp),%eax
c00049ad:	09 d0                	or     %edx,%eax
c00049af:	89 c2                	mov    %eax,%edx
c00049b1:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00049b4:	88 50 05             	mov    %dl,0x5(%eax)
c00049b7:	90                   	nop
c00049b8:	c9                   	leave  
c00049b9:	c3                   	ret    

c00049ba <ReloadGDT>:
c00049ba:	55                   	push   %ebp
c00049bb:	89 e5                	mov    %esp,%ebp
c00049bd:	83 ec 28             	sub    $0x28,%esp
c00049c0:	b8 c8 16 01 c0       	mov    $0xc00116c8,%eax
c00049c5:	0f b7 00             	movzwl (%eax),%eax
c00049c8:	98                   	cwtl   
c00049c9:	ba ca 16 01 c0       	mov    $0xc00116ca,%edx
c00049ce:	8b 12                	mov    (%edx),%edx
c00049d0:	83 ec 04             	sub    $0x4,%esp
c00049d3:	50                   	push   %eax
c00049d4:	52                   	push   %edx
c00049d5:	68 c0 07 01 c0       	push   $0xc00107c0
c00049da:	e8 12 72 00 00       	call   c000bbf1 <Memcpy2>
c00049df:	83 c4 10             	add    $0x10,%esp
c00049e2:	c7 45 f0 c8 16 01 c0 	movl   $0xc00116c8,-0x10(%ebp)
c00049e9:	c7 45 ec ca 16 01 c0 	movl   $0xc00116ca,-0x14(%ebp)
c00049f0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00049f3:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
c00049f8:	ba c0 07 01 c0       	mov    $0xc00107c0,%edx
c00049fd:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004a00:	89 10                	mov    %edx,(%eax)
c0004a02:	c7 45 e8 88 07 01 c0 	movl   $0xc0010788,-0x18(%ebp)
c0004a09:	c7 45 e4 8a 07 01 c0 	movl   $0xc001078a,-0x1c(%ebp)
c0004a10:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004a13:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
c0004a18:	ba e0 16 01 c0       	mov    $0xc00116e0,%edx
c0004a1d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004a20:	89 10                	mov    %edx,(%eax)
c0004a22:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0004a29:	eb 04                	jmp    c0004a2f <ReloadGDT+0x75>
c0004a2b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0004a2f:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c0004a36:	7e f3                	jle    c0004a2b <ReloadGDT+0x71>
c0004a38:	e8 67 37 00 00       	call   c00081a4 <init_internal_interrupt>
c0004a3d:	e8 ae fd ff ff       	call   c00047f0 <init_propt>
c0004a42:	90                   	nop
c0004a43:	c9                   	leave  
c0004a44:	c3                   	ret    

c0004a45 <select_console>:
c0004a45:	55                   	push   %ebp
c0004a46:	89 e5                	mov    %esp,%ebp
c0004a48:	83 ec 18             	sub    $0x18,%esp
c0004a4b:	8b 45 08             	mov    0x8(%ebp),%eax
c0004a4e:	88 45 f4             	mov    %al,-0xc(%ebp)
c0004a51:	80 7d f4 00          	cmpb   $0x0,-0xc(%ebp)
c0004a55:	75 27                	jne    c0004a7e <select_console+0x39>
c0004a57:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
c0004a5b:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0004a61:	05 00 0e 01 c0       	add    $0xc0010e00,%eax
c0004a66:	a3 80 07 01 c0       	mov    %eax,0xc0010780
c0004a6b:	a1 80 07 01 c0       	mov    0xc0010780,%eax
c0004a70:	83 ec 0c             	sub    $0xc,%esp
c0004a73:	50                   	push   %eax
c0004a74:	e8 08 00 00 00       	call   c0004a81 <flush>
c0004a79:	83 c4 10             	add    $0x10,%esp
c0004a7c:	eb 01                	jmp    c0004a7f <select_console+0x3a>
c0004a7e:	90                   	nop
c0004a7f:	c9                   	leave  
c0004a80:	c3                   	ret    

c0004a81 <flush>:
c0004a81:	55                   	push   %ebp
c0004a82:	89 e5                	mov    %esp,%ebp
c0004a84:	83 ec 08             	sub    $0x8,%esp
c0004a87:	8b 45 08             	mov    0x8(%ebp),%eax
c0004a8a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004a90:	8b 40 0c             	mov    0xc(%eax),%eax
c0004a93:	83 ec 0c             	sub    $0xc,%esp
c0004a96:	50                   	push   %eax
c0004a97:	e8 1e 00 00 00       	call   c0004aba <set_cursor>
c0004a9c:	83 c4 10             	add    $0x10,%esp
c0004a9f:	8b 45 08             	mov    0x8(%ebp),%eax
c0004aa2:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004aa8:	8b 40 08             	mov    0x8(%eax),%eax
c0004aab:	83 ec 0c             	sub    $0xc,%esp
c0004aae:	50                   	push   %eax
c0004aaf:	e8 64 00 00 00       	call   c0004b18 <set_console_start_video_addr>
c0004ab4:	83 c4 10             	add    $0x10,%esp
c0004ab7:	90                   	nop
c0004ab8:	c9                   	leave  
c0004ab9:	c3                   	ret    

c0004aba <set_cursor>:
c0004aba:	55                   	push   %ebp
c0004abb:	89 e5                	mov    %esp,%ebp
c0004abd:	83 ec 08             	sub    $0x8,%esp
c0004ac0:	83 ec 08             	sub    $0x8,%esp
c0004ac3:	6a 0e                	push   $0xe
c0004ac5:	68 d4 03 00 00       	push   $0x3d4
c0004aca:	e8 ca c7 ff ff       	call   c0001299 <out_byte>
c0004acf:	83 c4 10             	add    $0x10,%esp
c0004ad2:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ad5:	c1 e8 08             	shr    $0x8,%eax
c0004ad8:	0f b7 c0             	movzwl %ax,%eax
c0004adb:	83 ec 08             	sub    $0x8,%esp
c0004ade:	50                   	push   %eax
c0004adf:	68 d5 03 00 00       	push   $0x3d5
c0004ae4:	e8 b0 c7 ff ff       	call   c0001299 <out_byte>
c0004ae9:	83 c4 10             	add    $0x10,%esp
c0004aec:	83 ec 08             	sub    $0x8,%esp
c0004aef:	6a 0f                	push   $0xf
c0004af1:	68 d4 03 00 00       	push   $0x3d4
c0004af6:	e8 9e c7 ff ff       	call   c0001299 <out_byte>
c0004afb:	83 c4 10             	add    $0x10,%esp
c0004afe:	8b 45 08             	mov    0x8(%ebp),%eax
c0004b01:	0f b7 c0             	movzwl %ax,%eax
c0004b04:	83 ec 08             	sub    $0x8,%esp
c0004b07:	50                   	push   %eax
c0004b08:	68 d5 03 00 00       	push   $0x3d5
c0004b0d:	e8 87 c7 ff ff       	call   c0001299 <out_byte>
c0004b12:	83 c4 10             	add    $0x10,%esp
c0004b15:	90                   	nop
c0004b16:	c9                   	leave  
c0004b17:	c3                   	ret    

c0004b18 <set_console_start_video_addr>:
c0004b18:	55                   	push   %ebp
c0004b19:	89 e5                	mov    %esp,%ebp
c0004b1b:	83 ec 08             	sub    $0x8,%esp
c0004b1e:	83 ec 08             	sub    $0x8,%esp
c0004b21:	6a 0c                	push   $0xc
c0004b23:	68 d4 03 00 00       	push   $0x3d4
c0004b28:	e8 6c c7 ff ff       	call   c0001299 <out_byte>
c0004b2d:	83 c4 10             	add    $0x10,%esp
c0004b30:	8b 45 08             	mov    0x8(%ebp),%eax
c0004b33:	c1 e8 08             	shr    $0x8,%eax
c0004b36:	0f b7 c0             	movzwl %ax,%eax
c0004b39:	83 ec 08             	sub    $0x8,%esp
c0004b3c:	50                   	push   %eax
c0004b3d:	68 d5 03 00 00       	push   $0x3d5
c0004b42:	e8 52 c7 ff ff       	call   c0001299 <out_byte>
c0004b47:	83 c4 10             	add    $0x10,%esp
c0004b4a:	83 ec 08             	sub    $0x8,%esp
c0004b4d:	6a 0d                	push   $0xd
c0004b4f:	68 d4 03 00 00       	push   $0x3d4
c0004b54:	e8 40 c7 ff ff       	call   c0001299 <out_byte>
c0004b59:	83 c4 10             	add    $0x10,%esp
c0004b5c:	8b 45 08             	mov    0x8(%ebp),%eax
c0004b5f:	0f b7 c0             	movzwl %ax,%eax
c0004b62:	83 ec 08             	sub    $0x8,%esp
c0004b65:	50                   	push   %eax
c0004b66:	68 d5 03 00 00       	push   $0x3d5
c0004b6b:	e8 29 c7 ff ff       	call   c0001299 <out_byte>
c0004b70:	83 c4 10             	add    $0x10,%esp
c0004b73:	90                   	nop
c0004b74:	c9                   	leave  
c0004b75:	c3                   	ret    

c0004b76 <put_key>:
c0004b76:	55                   	push   %ebp
c0004b77:	89 e5                	mov    %esp,%ebp
c0004b79:	83 ec 04             	sub    $0x4,%esp
c0004b7c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004b7f:	88 45 fc             	mov    %al,-0x4(%ebp)
c0004b82:	8b 45 08             	mov    0x8(%ebp),%eax
c0004b85:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0004b8b:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c0004b90:	77 4d                	ja     c0004bdf <put_key+0x69>
c0004b92:	8b 45 08             	mov    0x8(%ebp),%eax
c0004b95:	8b 00                	mov    (%eax),%eax
c0004b97:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
c0004b9b:	89 10                	mov    %edx,(%eax)
c0004b9d:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ba0:	8b 00                	mov    (%eax),%eax
c0004ba2:	8d 50 04             	lea    0x4(%eax),%edx
c0004ba5:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ba8:	89 10                	mov    %edx,(%eax)
c0004baa:	8b 45 08             	mov    0x8(%ebp),%eax
c0004bad:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0004bb3:	8d 50 01             	lea    0x1(%eax),%edx
c0004bb6:	8b 45 08             	mov    0x8(%ebp),%eax
c0004bb9:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0004bbf:	8b 45 08             	mov    0x8(%ebp),%eax
c0004bc2:	8b 00                	mov    (%eax),%eax
c0004bc4:	8b 55 08             	mov    0x8(%ebp),%edx
c0004bc7:	83 c2 08             	add    $0x8,%edx
c0004bca:	81 c2 00 08 00 00    	add    $0x800,%edx
c0004bd0:	39 d0                	cmp    %edx,%eax
c0004bd2:	75 0b                	jne    c0004bdf <put_key+0x69>
c0004bd4:	8b 45 08             	mov    0x8(%ebp),%eax
c0004bd7:	8d 50 08             	lea    0x8(%eax),%edx
c0004bda:	8b 45 08             	mov    0x8(%ebp),%eax
c0004bdd:	89 10                	mov    %edx,(%eax)
c0004bdf:	90                   	nop
c0004be0:	c9                   	leave  
c0004be1:	c3                   	ret    

c0004be2 <scroll_up>:
c0004be2:	55                   	push   %ebp
c0004be3:	89 e5                	mov    %esp,%ebp
c0004be5:	83 ec 08             	sub    $0x8,%esp
c0004be8:	8b 45 08             	mov    0x8(%ebp),%eax
c0004beb:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004bf1:	8b 40 08             	mov    0x8(%eax),%eax
c0004bf4:	8d 50 b0             	lea    -0x50(%eax),%edx
c0004bf7:	8b 45 08             	mov    0x8(%ebp),%eax
c0004bfa:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004c00:	8b 00                	mov    (%eax),%eax
c0004c02:	39 c2                	cmp    %eax,%edx
c0004c04:	76 1b                	jbe    c0004c21 <scroll_up+0x3f>
c0004c06:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c09:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004c0f:	8b 40 08             	mov    0x8(%eax),%eax
c0004c12:	83 e8 50             	sub    $0x50,%eax
c0004c15:	83 ec 0c             	sub    $0xc,%esp
c0004c18:	50                   	push   %eax
c0004c19:	e8 fa fe ff ff       	call   c0004b18 <set_console_start_video_addr>
c0004c1e:	83 c4 10             	add    $0x10,%esp
c0004c21:	90                   	nop
c0004c22:	c9                   	leave  
c0004c23:	c3                   	ret    

c0004c24 <scroll_down>:
c0004c24:	55                   	push   %ebp
c0004c25:	89 e5                	mov    %esp,%ebp
c0004c27:	83 ec 08             	sub    $0x8,%esp
c0004c2a:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c2d:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004c33:	8b 40 08             	mov    0x8(%eax),%eax
c0004c36:	8d 48 50             	lea    0x50(%eax),%ecx
c0004c39:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c3c:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004c42:	8b 10                	mov    (%eax),%edx
c0004c44:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c47:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004c4d:	8b 40 04             	mov    0x4(%eax),%eax
c0004c50:	01 d0                	add    %edx,%eax
c0004c52:	39 c1                	cmp    %eax,%ecx
c0004c54:	73 36                	jae    c0004c8c <scroll_down+0x68>
c0004c56:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c59:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004c5f:	8b 40 08             	mov    0x8(%eax),%eax
c0004c62:	83 c0 50             	add    $0x50,%eax
c0004c65:	83 ec 0c             	sub    $0xc,%esp
c0004c68:	50                   	push   %eax
c0004c69:	e8 aa fe ff ff       	call   c0004b18 <set_console_start_video_addr>
c0004c6e:	83 c4 10             	add    $0x10,%esp
c0004c71:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c74:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004c7a:	8b 50 08             	mov    0x8(%eax),%edx
c0004c7d:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c80:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004c86:	83 c2 50             	add    $0x50,%edx
c0004c89:	89 50 08             	mov    %edx,0x8(%eax)
c0004c8c:	90                   	nop
c0004c8d:	c9                   	leave  
c0004c8e:	c3                   	ret    

c0004c8f <out_char>:
c0004c8f:	55                   	push   %ebp
c0004c90:	89 e5                	mov    %esp,%ebp
c0004c92:	83 ec 28             	sub    $0x28,%esp
c0004c95:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004c98:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0004c9b:	e8 6a 2d 00 00       	call   c0007a0a <intr_disable>
c0004ca0:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004ca3:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ca6:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004cac:	8b 40 0c             	mov    0xc(%eax),%eax
c0004caf:	05 00 c0 05 60       	add    $0x6005c000,%eax
c0004cb4:	01 c0                	add    %eax,%eax
c0004cb6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0004cb9:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
c0004cbd:	83 f8 08             	cmp    $0x8,%eax
c0004cc0:	0f 84 8d 00 00 00    	je     c0004d53 <out_char+0xc4>
c0004cc6:	83 f8 0a             	cmp    $0xa,%eax
c0004cc9:	0f 85 c9 00 00 00    	jne    c0004d98 <out_char+0x109>
c0004ccf:	8b 45 08             	mov    0x8(%ebp),%eax
c0004cd2:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004cd8:	8b 50 0c             	mov    0xc(%eax),%edx
c0004cdb:	8b 45 08             	mov    0x8(%ebp),%eax
c0004cde:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004ce4:	8b 08                	mov    (%eax),%ecx
c0004ce6:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ce9:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004cef:	8b 40 04             	mov    0x4(%eax),%eax
c0004cf2:	01 c8                	add    %ecx,%eax
c0004cf4:	83 e8 50             	sub    $0x50,%eax
c0004cf7:	39 c2                	cmp    %eax,%edx
c0004cf9:	0f 83 f4 00 00 00    	jae    c0004df3 <out_char+0x164>
c0004cff:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d02:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004d08:	8b 08                	mov    (%eax),%ecx
c0004d0a:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d0d:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004d13:	8b 50 0c             	mov    0xc(%eax),%edx
c0004d16:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d19:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004d1f:	8b 00                	mov    (%eax),%eax
c0004d21:	29 c2                	sub    %eax,%edx
c0004d23:	89 d0                	mov    %edx,%eax
c0004d25:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
c0004d2a:	f7 e2                	mul    %edx
c0004d2c:	89 d0                	mov    %edx,%eax
c0004d2e:	c1 e8 06             	shr    $0x6,%eax
c0004d31:	8d 50 01             	lea    0x1(%eax),%edx
c0004d34:	89 d0                	mov    %edx,%eax
c0004d36:	c1 e0 02             	shl    $0x2,%eax
c0004d39:	01 d0                	add    %edx,%eax
c0004d3b:	c1 e0 04             	shl    $0x4,%eax
c0004d3e:	89 c2                	mov    %eax,%edx
c0004d40:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d43:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004d49:	01 ca                	add    %ecx,%edx
c0004d4b:	89 50 0c             	mov    %edx,0xc(%eax)
c0004d4e:	e9 a0 00 00 00       	jmp    c0004df3 <out_char+0x164>
c0004d53:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d56:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004d5c:	8b 50 0c             	mov    0xc(%eax),%edx
c0004d5f:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d62:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004d68:	8b 00                	mov    (%eax),%eax
c0004d6a:	39 c2                	cmp    %eax,%edx
c0004d6c:	0f 86 84 00 00 00    	jbe    c0004df6 <out_char+0x167>
c0004d72:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d75:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004d7b:	8b 50 0c             	mov    0xc(%eax),%edx
c0004d7e:	83 ea 01             	sub    $0x1,%edx
c0004d81:	89 50 0c             	mov    %edx,0xc(%eax)
c0004d84:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004d87:	83 e8 02             	sub    $0x2,%eax
c0004d8a:	c6 00 20             	movb   $0x20,(%eax)
c0004d8d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004d90:	83 e8 01             	sub    $0x1,%eax
c0004d93:	c6 00 00             	movb   $0x0,(%eax)
c0004d96:	eb 5e                	jmp    c0004df6 <out_char+0x167>
c0004d98:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d9b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004da1:	8b 40 0c             	mov    0xc(%eax),%eax
c0004da4:	8d 48 01             	lea    0x1(%eax),%ecx
c0004da7:	8b 45 08             	mov    0x8(%ebp),%eax
c0004daa:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004db0:	8b 10                	mov    (%eax),%edx
c0004db2:	8b 45 08             	mov    0x8(%ebp),%eax
c0004db5:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004dbb:	8b 40 04             	mov    0x4(%eax),%eax
c0004dbe:	01 d0                	add    %edx,%eax
c0004dc0:	39 c1                	cmp    %eax,%ecx
c0004dc2:	73 35                	jae    c0004df9 <out_char+0x16a>
c0004dc4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004dc7:	8d 50 01             	lea    0x1(%eax),%edx
c0004dca:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0004dcd:	0f b6 55 e4          	movzbl -0x1c(%ebp),%edx
c0004dd1:	88 10                	mov    %dl,(%eax)
c0004dd3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004dd6:	8d 50 01             	lea    0x1(%eax),%edx
c0004dd9:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0004ddc:	c6 00 0a             	movb   $0xa,(%eax)
c0004ddf:	8b 45 08             	mov    0x8(%ebp),%eax
c0004de2:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004de8:	8b 50 0c             	mov    0xc(%eax),%edx
c0004deb:	83 c2 01             	add    $0x1,%edx
c0004dee:	89 50 0c             	mov    %edx,0xc(%eax)
c0004df1:	eb 06                	jmp    c0004df9 <out_char+0x16a>
c0004df3:	90                   	nop
c0004df4:	eb 14                	jmp    c0004e0a <out_char+0x17b>
c0004df6:	90                   	nop
c0004df7:	eb 11                	jmp    c0004e0a <out_char+0x17b>
c0004df9:	90                   	nop
c0004dfa:	eb 0e                	jmp    c0004e0a <out_char+0x17b>
c0004dfc:	83 ec 0c             	sub    $0xc,%esp
c0004dff:	ff 75 08             	pushl  0x8(%ebp)
c0004e02:	e8 1d fe ff ff       	call   c0004c24 <scroll_down>
c0004e07:	83 c4 10             	add    $0x10,%esp
c0004e0a:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e0d:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004e13:	8b 50 0c             	mov    0xc(%eax),%edx
c0004e16:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e19:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004e1f:	8b 40 08             	mov    0x8(%eax),%eax
c0004e22:	29 c2                	sub    %eax,%edx
c0004e24:	89 d0                	mov    %edx,%eax
c0004e26:	3d d0 07 00 00       	cmp    $0x7d0,%eax
c0004e2b:	77 cf                	ja     c0004dfc <out_char+0x16d>
c0004e2d:	83 ec 0c             	sub    $0xc,%esp
c0004e30:	ff 75 08             	pushl  0x8(%ebp)
c0004e33:	e8 49 fc ff ff       	call   c0004a81 <flush>
c0004e38:	83 c4 10             	add    $0x10,%esp
c0004e3b:	83 ec 0c             	sub    $0xc,%esp
c0004e3e:	ff 75 f4             	pushl  -0xc(%ebp)
c0004e41:	e8 ed 2b 00 00       	call   c0007a33 <intr_set_status>
c0004e46:	83 c4 10             	add    $0x10,%esp
c0004e49:	90                   	nop
c0004e4a:	c9                   	leave  
c0004e4b:	c3                   	ret    

c0004e4c <tty_dev_read>:
c0004e4c:	55                   	push   %ebp
c0004e4d:	89 e5                	mov    %esp,%ebp
c0004e4f:	83 ec 08             	sub    $0x8,%esp
c0004e52:	a1 80 07 01 c0       	mov    0xc0010780,%eax
c0004e57:	39 45 08             	cmp    %eax,0x8(%ebp)
c0004e5a:	75 17                	jne    c0004e73 <tty_dev_read+0x27>
c0004e5c:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c0004e61:	85 c0                	test   %eax,%eax
c0004e63:	7e 0e                	jle    c0004e73 <tty_dev_read+0x27>
c0004e65:	83 ec 0c             	sub    $0xc,%esp
c0004e68:	ff 75 08             	pushl  0x8(%ebp)
c0004e6b:	e8 89 07 00 00       	call   c00055f9 <keyboard_read>
c0004e70:	83 c4 10             	add    $0x10,%esp
c0004e73:	90                   	nop
c0004e74:	c9                   	leave  
c0004e75:	c3                   	ret    

c0004e76 <tty_dev_write>:
c0004e76:	55                   	push   %ebp
c0004e77:	89 e5                	mov    %esp,%ebp
c0004e79:	83 ec 28             	sub    $0x28,%esp
c0004e7c:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e7f:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0004e85:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0004e88:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0004e8f:	e9 88 01 00 00       	jmp    c000501c <tty_dev_write+0x1a6>
c0004e94:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e97:	8b 40 04             	mov    0x4(%eax),%eax
c0004e9a:	8b 00                	mov    (%eax),%eax
c0004e9c:	88 45 e7             	mov    %al,-0x19(%ebp)
c0004e9f:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ea2:	8b 40 04             	mov    0x4(%eax),%eax
c0004ea5:	8d 50 04             	lea    0x4(%eax),%edx
c0004ea8:	8b 45 08             	mov    0x8(%ebp),%eax
c0004eab:	89 50 04             	mov    %edx,0x4(%eax)
c0004eae:	8b 45 08             	mov    0x8(%ebp),%eax
c0004eb1:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0004eb7:	8d 50 ff             	lea    -0x1(%eax),%edx
c0004eba:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ebd:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0004ec3:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ec6:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c0004ecc:	8d 50 01             	lea    0x1(%eax),%edx
c0004ecf:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ed2:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0004ed8:	8b 45 08             	mov    0x8(%ebp),%eax
c0004edb:	8b 40 04             	mov    0x4(%eax),%eax
c0004ede:	8b 55 08             	mov    0x8(%ebp),%edx
c0004ee1:	83 c2 08             	add    $0x8,%edx
c0004ee4:	81 c2 00 08 00 00    	add    $0x800,%edx
c0004eea:	39 d0                	cmp    %edx,%eax
c0004eec:	75 0c                	jne    c0004efa <tty_dev_write+0x84>
c0004eee:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ef1:	8d 50 08             	lea    0x8(%eax),%edx
c0004ef4:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ef7:	89 50 04             	mov    %edx,0x4(%eax)
c0004efa:	8b 45 08             	mov    0x8(%ebp),%eax
c0004efd:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0004f03:	85 c0                	test   %eax,%eax
c0004f05:	0f 84 11 01 00 00    	je     c000501c <tty_dev_write+0x1a6>
c0004f0b:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0004f0f:	3c 20                	cmp    $0x20,%al
c0004f11:	76 08                	jbe    c0004f1b <tty_dev_write+0xa5>
c0004f13:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0004f17:	3c 7e                	cmp    $0x7e,%al
c0004f19:	76 10                	jbe    c0004f2b <tty_dev_write+0xb5>
c0004f1b:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0004f1f:	3c 20                	cmp    $0x20,%al
c0004f21:	74 08                	je     c0004f2b <tty_dev_write+0xb5>
c0004f23:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0004f27:	84 c0                	test   %al,%al
c0004f29:	75 58                	jne    c0004f83 <tty_dev_write+0x10d>
c0004f2b:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f2e:	8b 90 18 08 00 00    	mov    0x818(%eax),%edx
c0004f34:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f37:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c0004f3d:	01 d0                	add    %edx,%eax
c0004f3f:	83 e8 01             	sub    $0x1,%eax
c0004f42:	89 c2                	mov    %eax,%edx
c0004f44:	83 ec 04             	sub    $0x4,%esp
c0004f47:	6a 01                	push   $0x1
c0004f49:	8d 45 e7             	lea    -0x19(%ebp),%eax
c0004f4c:	50                   	push   %eax
c0004f4d:	52                   	push   %edx
c0004f4e:	e8 1b 2b 00 00       	call   c0007a6e <Memcpy>
c0004f53:	83 c4 10             	add    $0x10,%esp
c0004f56:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f59:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0004f5f:	8d 50 ff             	lea    -0x1(%eax),%edx
c0004f62:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f65:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c0004f6b:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0004f6f:	0f b6 c0             	movzbl %al,%eax
c0004f72:	83 ec 08             	sub    $0x8,%esp
c0004f75:	50                   	push   %eax
c0004f76:	ff 75 08             	pushl  0x8(%ebp)
c0004f79:	e8 11 fd ff ff       	call   c0004c8f <out_char>
c0004f7e:	83 c4 10             	add    $0x10,%esp
c0004f81:	eb 7c                	jmp    c0004fff <tty_dev_write+0x189>
c0004f83:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0004f87:	3c 08                	cmp    $0x8,%al
c0004f89:	75 42                	jne    c0004fcd <tty_dev_write+0x157>
c0004f8b:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f8e:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0004f94:	8d 50 01             	lea    0x1(%eax),%edx
c0004f97:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f9a:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c0004fa0:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fa3:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c0004fa9:	8d 50 fe             	lea    -0x2(%eax),%edx
c0004fac:	8b 45 08             	mov    0x8(%ebp),%eax
c0004faf:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0004fb5:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0004fb9:	0f b6 c0             	movzbl %al,%eax
c0004fbc:	83 ec 08             	sub    $0x8,%esp
c0004fbf:	50                   	push   %eax
c0004fc0:	ff 75 08             	pushl  0x8(%ebp)
c0004fc3:	e8 c7 fc ff ff       	call   c0004c8f <out_char>
c0004fc8:	83 c4 10             	add    $0x10,%esp
c0004fcb:	eb 32                	jmp    c0004fff <tty_dev_write+0x189>
c0004fcd:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0004fd1:	3c 0a                	cmp    $0xa,%al
c0004fd3:	75 2a                	jne    c0004fff <tty_dev_write+0x189>
c0004fd5:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0004fd9:	0f b6 c0             	movzbl %al,%eax
c0004fdc:	83 ec 08             	sub    $0x8,%esp
c0004fdf:	50                   	push   %eax
c0004fe0:	ff 75 08             	pushl  0x8(%ebp)
c0004fe3:	e8 a7 fc ff ff       	call   c0004c8f <out_char>
c0004fe8:	83 c4 10             	add    $0x10,%esp
c0004feb:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fee:	c7 80 0c 08 00 00 00 	movl   $0x0,0x80c(%eax)
c0004ff5:	00 00 00 
c0004ff8:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0004fff:	8b 45 08             	mov    0x8(%ebp),%eax
c0005002:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0005008:	8b 45 08             	mov    0x8(%ebp),%eax
c000500b:	8b 80 14 08 00 00    	mov    0x814(%eax),%eax
c0005011:	39 c2                	cmp    %eax,%edx
c0005013:	75 07                	jne    c000501c <tty_dev_write+0x1a6>
c0005015:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c000501c:	8b 45 08             	mov    0x8(%ebp),%eax
c000501f:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0005025:	85 c0                	test   %eax,%eax
c0005027:	0f 85 67 fe ff ff    	jne    c0004e94 <tty_dev_write+0x1e>
c000502d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0005031:	74 6d                	je     c00050a0 <tty_dev_write+0x22a>
c0005033:	c7 45 ec 7c 00 00 00 	movl   $0x7c,-0x14(%ebp)
c000503a:	83 ec 0c             	sub    $0xc,%esp
c000503d:	ff 75 ec             	pushl  -0x14(%ebp)
c0005040:	e8 27 d4 ff ff       	call   c000246c <sys_malloc>
c0005045:	83 c4 10             	add    $0x10,%esp
c0005048:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000504b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000504e:	c7 40 78 66 00 00 00 	movl   $0x66,0x78(%eax)
c0005055:	8b 45 08             	mov    0x8(%ebp),%eax
c0005058:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c000505e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005061:	89 50 60             	mov    %edx,0x60(%eax)
c0005064:	8b 45 08             	mov    0x8(%ebp),%eax
c0005067:	8b 90 20 08 00 00    	mov    0x820(%eax),%edx
c000506d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005070:	89 50 68             	mov    %edx,0x68(%eax)
c0005073:	8b 45 08             	mov    0x8(%ebp),%eax
c0005076:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c000507c:	83 ec 04             	sub    $0x4,%esp
c000507f:	50                   	push   %eax
c0005080:	ff 75 e8             	pushl  -0x18(%ebp)
c0005083:	6a 01                	push   $0x1
c0005085:	e8 da 4d 00 00       	call   c0009e64 <send_rec>
c000508a:	83 c4 10             	add    $0x10,%esp
c000508d:	83 ec 08             	sub    $0x8,%esp
c0005090:	ff 75 ec             	pushl  -0x14(%ebp)
c0005093:	ff 75 e8             	pushl  -0x18(%ebp)
c0005096:	e8 e6 d3 ff ff       	call   c0002481 <sys_free>
c000509b:	83 c4 10             	add    $0x10,%esp
c000509e:	eb 01                	jmp    c00050a1 <tty_dev_write+0x22b>
c00050a0:	90                   	nop
c00050a1:	c9                   	leave  
c00050a2:	c3                   	ret    

c00050a3 <tty_do_read>:
c00050a3:	55                   	push   %ebp
c00050a4:	89 e5                	mov    %esp,%ebp
c00050a6:	83 ec 08             	sub    $0x8,%esp
c00050a9:	8b 45 08             	mov    0x8(%ebp),%eax
c00050ac:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c00050b3:	00 00 00 
c00050b6:	8b 45 0c             	mov    0xc(%ebp),%eax
c00050b9:	8b 50 68             	mov    0x68(%eax),%edx
c00050bc:	8b 45 08             	mov    0x8(%ebp),%eax
c00050bf:	89 90 20 08 00 00    	mov    %edx,0x820(%eax)
c00050c5:	8b 45 0c             	mov    0xc(%ebp),%eax
c00050c8:	8b 00                	mov    (%eax),%eax
c00050ca:	89 c2                	mov    %eax,%edx
c00050cc:	8b 45 08             	mov    0x8(%ebp),%eax
c00050cf:	89 90 1c 08 00 00    	mov    %edx,0x81c(%eax)
c00050d5:	8b 45 0c             	mov    0xc(%ebp),%eax
c00050d8:	8b 50 60             	mov    0x60(%eax),%edx
c00050db:	8b 45 08             	mov    0x8(%ebp),%eax
c00050de:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c00050e4:	8b 45 0c             	mov    0xc(%ebp),%eax
c00050e7:	8b 50 60             	mov    0x60(%eax),%edx
c00050ea:	8b 45 08             	mov    0x8(%ebp),%eax
c00050ed:	89 90 14 08 00 00    	mov    %edx,0x814(%eax)
c00050f3:	8b 45 08             	mov    0x8(%ebp),%eax
c00050f6:	8b 90 0c 08 00 00    	mov    0x80c(%eax),%edx
c00050fc:	8b 45 0c             	mov    0xc(%ebp),%eax
c00050ff:	8b 40 10             	mov    0x10(%eax),%eax
c0005102:	83 ec 08             	sub    $0x8,%esp
c0005105:	52                   	push   %edx
c0005106:	50                   	push   %eax
c0005107:	e8 48 1b 00 00       	call   c0006c54 <alloc_virtual_memory>
c000510c:	83 c4 10             	add    $0x10,%esp
c000510f:	89 c2                	mov    %eax,%edx
c0005111:	8b 45 08             	mov    0x8(%ebp),%eax
c0005114:	89 90 18 08 00 00    	mov    %edx,0x818(%eax)
c000511a:	8b 45 08             	mov    0x8(%ebp),%eax
c000511d:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c0005123:	83 f8 02             	cmp    $0x2,%eax
c0005126:	74 1c                	je     c0005144 <tty_do_read+0xa1>
c0005128:	68 3b 01 00 00       	push   $0x13b
c000512d:	68 c1 b2 00 c0       	push   $0xc000b2c1
c0005132:	68 c1 b2 00 c0       	push   $0xc000b2c1
c0005137:	68 cb b2 00 c0       	push   $0xc000b2cb
c000513c:	e8 06 43 00 00       	call   c0009447 <assertion_failure>
c0005141:	83 c4 10             	add    $0x10,%esp
c0005144:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005147:	c7 40 78 67 00 00 00 	movl   $0x67,0x78(%eax)
c000514e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005151:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c0005157:	83 ec 04             	sub    $0x4,%esp
c000515a:	50                   	push   %eax
c000515b:	ff 75 0c             	pushl  0xc(%ebp)
c000515e:	6a 01                	push   $0x1
c0005160:	e8 ff 4c 00 00       	call   c0009e64 <send_rec>
c0005165:	83 c4 10             	add    $0x10,%esp
c0005168:	90                   	nop
c0005169:	c9                   	leave  
c000516a:	c3                   	ret    

c000516b <tty_do_write>:
c000516b:	55                   	push   %ebp
c000516c:	89 e5                	mov    %esp,%ebp
c000516e:	53                   	push   %ebx
c000516f:	83 ec 24             	sub    $0x24,%esp
c0005172:	89 e0                	mov    %esp,%eax
c0005174:	89 c3                	mov    %eax,%ebx
c0005176:	c7 45 e8 80 00 00 00 	movl   $0x80,-0x18(%ebp)
c000517d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005180:	8d 50 ff             	lea    -0x1(%eax),%edx
c0005183:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c0005186:	89 c2                	mov    %eax,%edx
c0005188:	b8 10 00 00 00       	mov    $0x10,%eax
c000518d:	83 e8 01             	sub    $0x1,%eax
c0005190:	01 d0                	add    %edx,%eax
c0005192:	b9 10 00 00 00       	mov    $0x10,%ecx
c0005197:	ba 00 00 00 00       	mov    $0x0,%edx
c000519c:	f7 f1                	div    %ecx
c000519e:	6b c0 10             	imul   $0x10,%eax,%eax
c00051a1:	29 c4                	sub    %eax,%esp
c00051a3:	89 e0                	mov    %esp,%eax
c00051a5:	83 c0 00             	add    $0x0,%eax
c00051a8:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00051ab:	83 ec 04             	sub    $0x4,%esp
c00051ae:	ff 75 e8             	pushl  -0x18(%ebp)
c00051b1:	6a 00                	push   $0x0
c00051b3:	ff 75 e0             	pushl  -0x20(%ebp)
c00051b6:	e8 64 6a 00 00       	call   c000bc1f <Memset>
c00051bb:	83 c4 10             	add    $0x10,%esp
c00051be:	8b 45 0c             	mov    0xc(%ebp),%eax
c00051c1:	8b 40 60             	mov    0x60(%eax),%eax
c00051c4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00051c7:	8b 45 08             	mov    0x8(%ebp),%eax
c00051ca:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c00051d1:	00 00 00 
c00051d4:	8b 55 ec             	mov    -0x14(%ebp),%edx
c00051d7:	8b 45 0c             	mov    0xc(%ebp),%eax
c00051da:	8b 40 10             	mov    0x10(%eax),%eax
c00051dd:	83 ec 08             	sub    $0x8,%esp
c00051e0:	52                   	push   %edx
c00051e1:	50                   	push   %eax
c00051e2:	e8 6d 1a 00 00       	call   c0006c54 <alloc_virtual_memory>
c00051e7:	83 c4 10             	add    $0x10,%esp
c00051ea:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00051ed:	eb 7e                	jmp    c000526d <tty_do_write+0x102>
c00051ef:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00051f2:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c00051f5:	0f 4e 45 ec          	cmovle -0x14(%ebp),%eax
c00051f9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00051fc:	8b 45 08             	mov    0x8(%ebp),%eax
c00051ff:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0005205:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0005208:	01 d0                	add    %edx,%eax
c000520a:	83 ec 04             	sub    $0x4,%esp
c000520d:	ff 75 f0             	pushl  -0x10(%ebp)
c0005210:	50                   	push   %eax
c0005211:	ff 75 e0             	pushl  -0x20(%ebp)
c0005214:	e8 55 28 00 00       	call   c0007a6e <Memcpy>
c0005219:	83 c4 10             	add    $0x10,%esp
c000521c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000521f:	29 45 ec             	sub    %eax,-0x14(%ebp)
c0005222:	8b 45 08             	mov    0x8(%ebp),%eax
c0005225:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c000522b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000522e:	01 c2                	add    %eax,%edx
c0005230:	8b 45 08             	mov    0x8(%ebp),%eax
c0005233:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0005239:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0005240:	eb 25                	jmp    c0005267 <tty_do_write+0xfc>
c0005242:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0005245:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005248:	01 d0                	add    %edx,%eax
c000524a:	0f b6 00             	movzbl (%eax),%eax
c000524d:	0f b6 c0             	movzbl %al,%eax
c0005250:	83 ec 08             	sub    $0x8,%esp
c0005253:	50                   	push   %eax
c0005254:	ff 75 08             	pushl  0x8(%ebp)
c0005257:	e8 33 fa ff ff       	call   c0004c8f <out_char>
c000525c:	83 c4 10             	add    $0x10,%esp
c000525f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0005263:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c0005267:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000526b:	75 d5                	jne    c0005242 <tty_do_write+0xd7>
c000526d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0005271:	0f 85 78 ff ff ff    	jne    c00051ef <tty_do_write+0x84>
c0005277:	83 ec 0c             	sub    $0xc,%esp
c000527a:	6a 7c                	push   $0x7c
c000527c:	e8 eb d1 ff ff       	call   c000246c <sys_malloc>
c0005281:	83 c4 10             	add    $0x10,%esp
c0005284:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0005287:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000528a:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0005291:	8b 45 08             	mov    0x8(%ebp),%eax
c0005294:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c000529a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000529d:	89 50 58             	mov    %edx,0x58(%eax)
c00052a0:	8b 45 0c             	mov    0xc(%ebp),%eax
c00052a3:	8b 00                	mov    (%eax),%eax
c00052a5:	83 ec 04             	sub    $0x4,%esp
c00052a8:	50                   	push   %eax
c00052a9:	ff 75 d8             	pushl  -0x28(%ebp)
c00052ac:	6a 01                	push   $0x1
c00052ae:	e8 b1 4b 00 00       	call   c0009e64 <send_rec>
c00052b3:	83 c4 10             	add    $0x10,%esp
c00052b6:	83 ec 08             	sub    $0x8,%esp
c00052b9:	6a 7c                	push   $0x7c
c00052bb:	ff 75 d8             	pushl  -0x28(%ebp)
c00052be:	e8 be d1 ff ff       	call   c0002481 <sys_free>
c00052c3:	83 c4 10             	add    $0x10,%esp
c00052c6:	89 dc                	mov    %ebx,%esp
c00052c8:	90                   	nop
c00052c9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c00052cc:	c9                   	leave  
c00052cd:	c3                   	ret    

c00052ce <init_screen>:
c00052ce:	55                   	push   %ebp
c00052cf:	89 e5                	mov    %esp,%ebp
c00052d1:	83 ec 10             	sub    $0x10,%esp
c00052d4:	8b 45 08             	mov    0x8(%ebp),%eax
c00052d7:	2d 00 0e 01 c0       	sub    $0xc0010e00,%eax
c00052dc:	c1 f8 03             	sar    $0x3,%eax
c00052df:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c00052e5:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00052e8:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00052eb:	c1 e0 04             	shl    $0x4,%eax
c00052ee:	8d 90 14 1f 01 c0    	lea    -0x3ffee0ec(%eax),%edx
c00052f4:	8b 45 08             	mov    0x8(%ebp),%eax
c00052f7:	89 90 24 08 00 00    	mov    %edx,0x824(%eax)
c00052fd:	c7 45 f8 ff 3f 00 00 	movl   $0x3fff,-0x8(%ebp)
c0005304:	8b 45 08             	mov    0x8(%ebp),%eax
c0005307:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000530d:	8b 55 f8             	mov    -0x8(%ebp),%edx
c0005310:	89 50 04             	mov    %edx,0x4(%eax)
c0005313:	8b 45 08             	mov    0x8(%ebp),%eax
c0005316:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000531c:	8b 50 04             	mov    0x4(%eax),%edx
c000531f:	8b 45 08             	mov    0x8(%ebp),%eax
c0005322:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005328:	0f af 55 fc          	imul   -0x4(%ebp),%edx
c000532c:	89 10                	mov    %edx,(%eax)
c000532e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005331:	8b 90 24 08 00 00    	mov    0x824(%eax),%edx
c0005337:	8b 45 08             	mov    0x8(%ebp),%eax
c000533a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005340:	8b 12                	mov    (%edx),%edx
c0005342:	89 50 08             	mov    %edx,0x8(%eax)
c0005345:	8b 55 08             	mov    0x8(%ebp),%edx
c0005348:	8b 92 24 08 00 00    	mov    0x824(%edx),%edx
c000534e:	8b 40 08             	mov    0x8(%eax),%eax
c0005351:	89 42 0c             	mov    %eax,0xc(%edx)
c0005354:	90                   	nop
c0005355:	c9                   	leave  
c0005356:	c3                   	ret    

c0005357 <init_tty>:
c0005357:	55                   	push   %ebp
c0005358:	89 e5                	mov    %esp,%ebp
c000535a:	83 ec 18             	sub    $0x18,%esp
c000535d:	c7 45 f4 00 0e 01 c0 	movl   $0xc0010e00,-0xc(%ebp)
c0005364:	e9 92 00 00 00       	jmp    c00053fb <init_tty+0xa4>
c0005369:	83 ec 04             	sub    $0x4,%esp
c000536c:	68 28 08 00 00       	push   $0x828
c0005371:	6a 00                	push   $0x0
c0005373:	ff 75 f4             	pushl  -0xc(%ebp)
c0005376:	e8 a4 68 00 00       	call   c000bc1f <Memset>
c000537b:	83 c4 10             	add    $0x10,%esp
c000537e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005381:	8d 50 08             	lea    0x8(%eax),%edx
c0005384:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005387:	89 50 04             	mov    %edx,0x4(%eax)
c000538a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000538d:	8b 50 04             	mov    0x4(%eax),%edx
c0005390:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005393:	89 10                	mov    %edx,(%eax)
c0005395:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005398:	c7 80 08 08 00 00 00 	movl   $0x0,0x808(%eax)
c000539f:	00 00 00 
c00053a2:	83 ec 0c             	sub    $0xc,%esp
c00053a5:	ff 75 f4             	pushl  -0xc(%ebp)
c00053a8:	e8 21 ff ff ff       	call   c00052ce <init_screen>
c00053ad:	83 c4 10             	add    $0x10,%esp
c00053b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00053b3:	2d 00 0e 01 c0       	sub    $0xc0010e00,%eax
c00053b8:	85 c0                	test   %eax,%eax
c00053ba:	7e 38                	jle    c00053f4 <init_tty+0x9d>
c00053bc:	83 ec 08             	sub    $0x8,%esp
c00053bf:	6a 23                	push   $0x23
c00053c1:	ff 75 f4             	pushl  -0xc(%ebp)
c00053c4:	e8 c6 f8 ff ff       	call   c0004c8f <out_char>
c00053c9:	83 c4 10             	add    $0x10,%esp
c00053cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00053cf:	05 a8 8f 01 00       	add    $0x18fa8,%eax
c00053d4:	2d 00 0e 01 c0       	sub    $0xc0010e00,%eax
c00053d9:	c1 f8 03             	sar    $0x3,%eax
c00053dc:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c00053e2:	0f b6 c0             	movzbl %al,%eax
c00053e5:	83 ec 08             	sub    $0x8,%esp
c00053e8:	50                   	push   %eax
c00053e9:	ff 75 f4             	pushl  -0xc(%ebp)
c00053ec:	e8 9e f8 ff ff       	call   c0004c8f <out_char>
c00053f1:	83 c4 10             	add    $0x10,%esp
c00053f4:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c00053fb:	b8 28 16 01 c0       	mov    $0xc0011628,%eax
c0005400:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0005403:	0f 82 60 ff ff ff    	jb     c0005369 <init_tty+0x12>
c0005409:	90                   	nop
c000540a:	c9                   	leave  
c000540b:	c3                   	ret    

c000540c <TaskTTY>:
c000540c:	55                   	push   %ebp
c000540d:	89 e5                	mov    %esp,%ebp
c000540f:	83 ec 28             	sub    $0x28,%esp
c0005412:	e8 40 ff ff ff       	call   c0005357 <init_tty>
c0005417:	83 ec 0c             	sub    $0xc,%esp
c000541a:	6a 00                	push   $0x0
c000541c:	e8 24 f6 ff ff       	call   c0004a45 <select_console>
c0005421:	83 c4 10             	add    $0x10,%esp
c0005424:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000542b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0005432:	83 ec 0c             	sub    $0xc,%esp
c0005435:	6a 7c                	push   $0x7c
c0005437:	e8 30 d0 ff ff       	call   c000246c <sys_malloc>
c000543c:	83 c4 10             	add    $0x10,%esp
c000543f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0005442:	c7 45 f4 00 0e 01 c0 	movl   $0xc0010e00,-0xc(%ebp)
c0005449:	eb 30                	jmp    c000547b <TaskTTY+0x6f>
c000544b:	83 ec 0c             	sub    $0xc,%esp
c000544e:	ff 75 f4             	pushl  -0xc(%ebp)
c0005451:	e8 f6 f9 ff ff       	call   c0004e4c <tty_dev_read>
c0005456:	83 c4 10             	add    $0x10,%esp
c0005459:	83 ec 0c             	sub    $0xc,%esp
c000545c:	ff 75 f4             	pushl  -0xc(%ebp)
c000545f:	e8 12 fa ff ff       	call   c0004e76 <tty_dev_write>
c0005464:	83 c4 10             	add    $0x10,%esp
c0005467:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000546a:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0005470:	85 c0                	test   %eax,%eax
c0005472:	75 d7                	jne    c000544b <TaskTTY+0x3f>
c0005474:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c000547b:	b8 28 16 01 c0       	mov    $0xc0011628,%eax
c0005480:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0005483:	72 c6                	jb     c000544b <TaskTTY+0x3f>
c0005485:	83 ec 04             	sub    $0x4,%esp
c0005488:	6a 12                	push   $0x12
c000548a:	ff 75 e8             	pushl  -0x18(%ebp)
c000548d:	6a 02                	push   $0x2
c000548f:	e8 d0 49 00 00       	call   c0009e64 <send_rec>
c0005494:	83 c4 10             	add    $0x10,%esp
c0005497:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000549a:	8b 40 78             	mov    0x78(%eax),%eax
c000549d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00054a0:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c00054a7:	74 28                	je     c00054d1 <TaskTTY+0xc5>
c00054a9:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c00054b0:	7f 0b                	jg     c00054bd <TaskTTY+0xb1>
c00054b2:	81 7d e4 d1 07 00 00 	cmpl   $0x7d1,-0x1c(%ebp)
c00054b9:	74 4e                	je     c0005509 <TaskTTY+0xfd>
c00054bb:	eb 4d                	jmp    c000550a <TaskTTY+0xfe>
c00054bd:	81 7d e4 d3 07 00 00 	cmpl   $0x7d3,-0x1c(%ebp)
c00054c4:	74 21                	je     c00054e7 <TaskTTY+0xdb>
c00054c6:	81 7d e4 d5 07 00 00 	cmpl   $0x7d5,-0x1c(%ebp)
c00054cd:	74 2e                	je     c00054fd <TaskTTY+0xf1>
c00054cf:	eb 39                	jmp    c000550a <TaskTTY+0xfe>
c00054d1:	a1 80 07 01 c0       	mov    0xc0010780,%eax
c00054d6:	83 ec 08             	sub    $0x8,%esp
c00054d9:	ff 75 e8             	pushl  -0x18(%ebp)
c00054dc:	50                   	push   %eax
c00054dd:	e8 c1 fb ff ff       	call   c00050a3 <tty_do_read>
c00054e2:	83 c4 10             	add    $0x10,%esp
c00054e5:	eb 23                	jmp    c000550a <TaskTTY+0xfe>
c00054e7:	a1 80 07 01 c0       	mov    0xc0010780,%eax
c00054ec:	83 ec 08             	sub    $0x8,%esp
c00054ef:	ff 75 e8             	pushl  -0x18(%ebp)
c00054f2:	50                   	push   %eax
c00054f3:	e8 73 fc ff ff       	call   c000516b <tty_do_write>
c00054f8:	83 c4 10             	add    $0x10,%esp
c00054fb:	eb 0d                	jmp    c000550a <TaskTTY+0xfe>
c00054fd:	c7 05 c0 16 01 c0 00 	movl   $0x0,0xc00116c0
c0005504:	00 00 00 
c0005507:	eb 01                	jmp    c000550a <TaskTTY+0xfe>
c0005509:	90                   	nop
c000550a:	e9 33 ff ff ff       	jmp    c0005442 <TaskTTY+0x36>

c000550f <keyboard_handler>:
c000550f:	55                   	push   %ebp
c0005510:	89 e5                	mov    %esp,%ebp
c0005512:	83 ec 18             	sub    $0x18,%esp
c0005515:	c7 05 c0 16 01 c0 01 	movl   $0x1,0xc00116c0
c000551c:	00 00 00 
c000551f:	c7 45 f4 60 00 00 00 	movl   $0x60,-0xc(%ebp)
c0005526:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c000552b:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c0005530:	7f 5e                	jg     c0005590 <keyboard_handler+0x81>
c0005532:	e8 84 bd ff ff       	call   c00012bb <disable_int>
c0005537:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000553a:	0f b7 c0             	movzwl %ax,%eax
c000553d:	83 ec 0c             	sub    $0xc,%esp
c0005540:	50                   	push   %eax
c0005541:	e8 47 bd ff ff       	call   c000128d <in_byte>
c0005546:	83 c4 10             	add    $0x10,%esp
c0005549:	88 45 f3             	mov    %al,-0xd(%ebp)
c000554c:	a1 e0 0b 01 c0       	mov    0xc0010be0,%eax
c0005551:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
c0005555:	88 10                	mov    %dl,(%eax)
c0005557:	a1 e0 0b 01 c0       	mov    0xc0010be0,%eax
c000555c:	83 c0 01             	add    $0x1,%eax
c000555f:	a3 e0 0b 01 c0       	mov    %eax,0xc0010be0
c0005564:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c0005569:	83 c0 01             	add    $0x1,%eax
c000556c:	a3 e8 0b 01 c0       	mov    %eax,0xc0010be8
c0005571:	a1 e0 0b 01 c0       	mov    0xc0010be0,%eax
c0005576:	ba ec 0d 01 c0       	mov    $0xc0010dec,%edx
c000557b:	39 d0                	cmp    %edx,%eax
c000557d:	72 0a                	jb     c0005589 <keyboard_handler+0x7a>
c000557f:	c7 05 e0 0b 01 c0 ec 	movl   $0xc0010bec,0xc0010be0
c0005586:	0b 01 c0 
c0005589:	e8 2f bd ff ff       	call   c00012bd <enable_int>
c000558e:	eb 01                	jmp    c0005591 <keyboard_handler+0x82>
c0005590:	90                   	nop
c0005591:	c9                   	leave  
c0005592:	c3                   	ret    

c0005593 <read_from_keyboard_buf>:
c0005593:	55                   	push   %ebp
c0005594:	89 e5                	mov    %esp,%ebp
c0005596:	83 ec 18             	sub    $0x18,%esp
c0005599:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
c000559d:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c00055a2:	85 c0                	test   %eax,%eax
c00055a4:	7f 06                	jg     c00055ac <read_from_keyboard_buf+0x19>
c00055a6:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c00055aa:	eb 4b                	jmp    c00055f7 <read_from_keyboard_buf+0x64>
c00055ac:	e8 0a bd ff ff       	call   c00012bb <disable_int>
c00055b1:	a1 e4 0b 01 c0       	mov    0xc0010be4,%eax
c00055b6:	0f b6 00             	movzbl (%eax),%eax
c00055b9:	88 45 f7             	mov    %al,-0x9(%ebp)
c00055bc:	a1 e4 0b 01 c0       	mov    0xc0010be4,%eax
c00055c1:	83 c0 01             	add    $0x1,%eax
c00055c4:	a3 e4 0b 01 c0       	mov    %eax,0xc0010be4
c00055c9:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c00055ce:	83 e8 01             	sub    $0x1,%eax
c00055d1:	a3 e8 0b 01 c0       	mov    %eax,0xc0010be8
c00055d6:	a1 e4 0b 01 c0       	mov    0xc0010be4,%eax
c00055db:	ba ec 0d 01 c0       	mov    $0xc0010dec,%edx
c00055e0:	39 d0                	cmp    %edx,%eax
c00055e2:	72 0a                	jb     c00055ee <read_from_keyboard_buf+0x5b>
c00055e4:	c7 05 e4 0b 01 c0 ec 	movl   $0xc0010bec,0xc0010be4
c00055eb:	0b 01 c0 
c00055ee:	e8 ca bc ff ff       	call   c00012bd <enable_int>
c00055f3:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c00055f7:	c9                   	leave  
c00055f8:	c3                   	ret    

c00055f9 <keyboard_read>:
c00055f9:	55                   	push   %ebp
c00055fa:	89 e5                	mov    %esp,%ebp
c00055fc:	83 ec 28             	sub    $0x28,%esp
c00055ff:	90                   	nop
c0005600:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c0005605:	85 c0                	test   %eax,%eax
c0005607:	7e f7                	jle    c0005600 <keyboard_read+0x7>
c0005609:	e8 85 ff ff ff       	call   c0005593 <read_from_keyboard_buf>
c000560e:	88 45 ea             	mov    %al,-0x16(%ebp)
c0005611:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0005618:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c000561c:	80 7d ea e1          	cmpb   $0xe1,-0x16(%ebp)
c0005620:	75 5a                	jne    c000567c <keyboard_read+0x83>
c0005622:	c6 45 e3 e1          	movb   $0xe1,-0x1d(%ebp)
c0005626:	c6 45 e4 1d          	movb   $0x1d,-0x1c(%ebp)
c000562a:	c6 45 e5 45          	movb   $0x45,-0x1b(%ebp)
c000562e:	c6 45 e6 e1          	movb   $0xe1,-0x1a(%ebp)
c0005632:	c6 45 e7 9d          	movb   $0x9d,-0x19(%ebp)
c0005636:	c6 45 e8 c5          	movb   $0xc5,-0x18(%ebp)
c000563a:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
c000563e:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0005645:	eb 20                	jmp    c0005667 <keyboard_read+0x6e>
c0005647:	e8 47 ff ff ff       	call   c0005593 <read_from_keyboard_buf>
c000564c:	89 c1                	mov    %eax,%ecx
c000564e:	8d 55 e3             	lea    -0x1d(%ebp),%edx
c0005651:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005654:	01 d0                	add    %edx,%eax
c0005656:	0f b6 00             	movzbl (%eax),%eax
c0005659:	38 c1                	cmp    %al,%cl
c000565b:	74 06                	je     c0005663 <keyboard_read+0x6a>
c000565d:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
c0005661:	eb 0a                	jmp    c000566d <keyboard_read+0x74>
c0005663:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0005667:	83 7d ec 05          	cmpl   $0x5,-0x14(%ebp)
c000566b:	7e da                	jle    c0005647 <keyboard_read+0x4e>
c000566d:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
c0005671:	74 68                	je     c00056db <keyboard_read+0xe2>
c0005673:	c7 45 f4 80 01 00 00 	movl   $0x180,-0xc(%ebp)
c000567a:	eb 5f                	jmp    c00056db <keyboard_read+0xe2>
c000567c:	80 7d ea e0          	cmpb   $0xe0,-0x16(%ebp)
c0005680:	75 59                	jne    c00056db <keyboard_read+0xe2>
c0005682:	e8 0c ff ff ff       	call   c0005593 <read_from_keyboard_buf>
c0005687:	3c 2a                	cmp    $0x2a,%al
c0005689:	75 1d                	jne    c00056a8 <keyboard_read+0xaf>
c000568b:	e8 03 ff ff ff       	call   c0005593 <read_from_keyboard_buf>
c0005690:	3c e0                	cmp    $0xe0,%al
c0005692:	75 14                	jne    c00056a8 <keyboard_read+0xaf>
c0005694:	e8 fa fe ff ff       	call   c0005593 <read_from_keyboard_buf>
c0005699:	3c 37                	cmp    $0x37,%al
c000569b:	75 0b                	jne    c00056a8 <keyboard_read+0xaf>
c000569d:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c00056a4:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
c00056a8:	e8 e6 fe ff ff       	call   c0005593 <read_from_keyboard_buf>
c00056ad:	3c b7                	cmp    $0xb7,%al
c00056af:	75 1d                	jne    c00056ce <keyboard_read+0xd5>
c00056b1:	e8 dd fe ff ff       	call   c0005593 <read_from_keyboard_buf>
c00056b6:	3c e0                	cmp    $0xe0,%al
c00056b8:	75 14                	jne    c00056ce <keyboard_read+0xd5>
c00056ba:	e8 d4 fe ff ff       	call   c0005593 <read_from_keyboard_buf>
c00056bf:	3c aa                	cmp    $0xaa,%al
c00056c1:	75 0b                	jne    c00056ce <keyboard_read+0xd5>
c00056c3:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c00056ca:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c00056ce:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00056d2:	75 07                	jne    c00056db <keyboard_read+0xe2>
c00056d4:	c6 05 84 07 01 c0 01 	movb   $0x1,0xc0010784
c00056db:	81 7d f4 80 01 00 00 	cmpl   $0x180,-0xc(%ebp)
c00056e2:	0f 84 8d 00 00 00    	je     c0005775 <keyboard_read+0x17c>
c00056e8:	81 7d f4 81 01 00 00 	cmpl   $0x181,-0xc(%ebp)
c00056ef:	0f 84 80 00 00 00    	je     c0005775 <keyboard_read+0x17c>
c00056f5:	80 7d ea 36          	cmpb   $0x36,-0x16(%ebp)
c00056f9:	0f 94 c2             	sete   %dl
c00056fc:	80 7d ea 2a          	cmpb   $0x2a,-0x16(%ebp)
c0005700:	0f 94 c0             	sete   %al
c0005703:	09 d0                	or     %edx,%eax
c0005705:	84 c0                	test   %al,%al
c0005707:	74 07                	je     c0005710 <keyboard_read+0x117>
c0005709:	c6 05 c4 16 01 c0 01 	movb   $0x1,0xc00116c4
c0005710:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
c0005714:	f7 d0                	not    %eax
c0005716:	c0 e8 07             	shr    $0x7,%al
c0005719:	88 45 e9             	mov    %al,-0x17(%ebp)
c000571c:	80 7d ea 00          	cmpb   $0x0,-0x16(%ebp)
c0005720:	74 53                	je     c0005775 <keyboard_read+0x17c>
c0005722:	80 7d e9 00          	cmpb   $0x0,-0x17(%ebp)
c0005726:	74 4d                	je     c0005775 <keyboard_read+0x17c>
c0005728:	c6 45 eb 00          	movb   $0x0,-0x15(%ebp)
c000572c:	0f b6 05 c4 16 01 c0 	movzbl 0xc00116c4,%eax
c0005733:	3c 01                	cmp    $0x1,%al
c0005735:	75 04                	jne    c000573b <keyboard_read+0x142>
c0005737:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
c000573b:	0f b6 05 84 07 01 c0 	movzbl 0xc0010784,%eax
c0005742:	84 c0                	test   %al,%al
c0005744:	74 04                	je     c000574a <keyboard_read+0x151>
c0005746:	c6 45 eb 02          	movb   $0x2,-0x15(%ebp)
c000574a:	0f b6 55 ea          	movzbl -0x16(%ebp),%edx
c000574e:	89 d0                	mov    %edx,%eax
c0005750:	01 c0                	add    %eax,%eax
c0005752:	01 c2                	add    %eax,%edx
c0005754:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c0005758:	01 d0                	add    %edx,%eax
c000575a:	8b 04 85 60 f1 00 c0 	mov    -0x3fff0ea0(,%eax,4),%eax
c0005761:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005764:	83 ec 08             	sub    $0x8,%esp
c0005767:	ff 75 f4             	pushl  -0xc(%ebp)
c000576a:	ff 75 08             	pushl  0x8(%ebp)
c000576d:	e8 1a 00 00 00       	call   c000578c <in_process>
c0005772:	83 c4 10             	add    $0x10,%esp
c0005775:	90                   	nop
c0005776:	c9                   	leave  
c0005777:	c3                   	ret    

c0005778 <init_keyboard_handler>:
c0005778:	55                   	push   %ebp
c0005779:	89 e5                	mov    %esp,%ebp
c000577b:	c6 05 84 07 01 c0 00 	movb   $0x0,0xc0010784
c0005782:	c6 05 c4 16 01 c0 00 	movb   $0x0,0xc00116c4
c0005789:	90                   	nop
c000578a:	5d                   	pop    %ebp
c000578b:	c3                   	ret    

c000578c <in_process>:
c000578c:	55                   	push   %ebp
c000578d:	89 e5                	mov    %esp,%ebp
c000578f:	83 ec 18             	sub    $0x18,%esp
c0005792:	83 ec 04             	sub    $0x4,%esp
c0005795:	6a 02                	push   $0x2
c0005797:	6a 00                	push   $0x0
c0005799:	8d 45 f6             	lea    -0xa(%ebp),%eax
c000579c:	50                   	push   %eax
c000579d:	e8 7d 64 00 00       	call   c000bc1f <Memset>
c00057a2:	83 c4 10             	add    $0x10,%esp
c00057a5:	8b 45 0c             	mov    0xc(%ebp),%eax
c00057a8:	25 00 01 00 00       	and    $0x100,%eax
c00057ad:	85 c0                	test   %eax,%eax
c00057af:	75 28                	jne    c00057d9 <in_process+0x4d>
c00057b1:	8b 45 0c             	mov    0xc(%ebp),%eax
c00057b4:	0f b6 c0             	movzbl %al,%eax
c00057b7:	83 ec 08             	sub    $0x8,%esp
c00057ba:	50                   	push   %eax
c00057bb:	ff 75 08             	pushl  0x8(%ebp)
c00057be:	e8 b3 f3 ff ff       	call   c0004b76 <put_key>
c00057c3:	83 c4 10             	add    $0x10,%esp
c00057c6:	c6 05 84 07 01 c0 00 	movb   $0x0,0xc0010784
c00057cd:	c6 05 c4 16 01 c0 00 	movb   $0x0,0xc00116c4
c00057d4:	e9 42 01 00 00       	jmp    c000591b <in_process+0x18f>
c00057d9:	0f b6 05 c4 16 01 c0 	movzbl 0xc00116c4,%eax
c00057e0:	84 c0                	test   %al,%al
c00057e2:	0f 84 a9 00 00 00    	je     c0005891 <in_process+0x105>
c00057e8:	83 7d 0c 2a          	cmpl   $0x2a,0xc(%ebp)
c00057ec:	0f 84 9f 00 00 00    	je     c0005891 <in_process+0x105>
c00057f2:	83 7d 0c 36          	cmpl   $0x36,0xc(%ebp)
c00057f6:	0f 84 95 00 00 00    	je     c0005891 <in_process+0x105>
c00057fc:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0005803:	74 64                	je     c0005869 <in_process+0xdd>
c0005805:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c000580c:	77 0b                	ja     c0005819 <in_process+0x8d>
c000580e:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0005815:	74 64                	je     c000587b <in_process+0xef>
c0005817:	eb 73                	jmp    c000588c <in_process+0x100>
c0005819:	81 7d 0c 55 01 00 00 	cmpl   $0x155,0xc(%ebp)
c0005820:	74 0b                	je     c000582d <in_process+0xa1>
c0005822:	81 7d 0c 68 01 00 00 	cmpl   $0x168,0xc(%ebp)
c0005829:	74 20                	je     c000584b <in_process+0xbf>
c000582b:	eb 5f                	jmp    c000588c <in_process+0x100>
c000582d:	83 ec 0c             	sub    $0xc,%esp
c0005830:	ff 75 08             	pushl  0x8(%ebp)
c0005833:	e8 aa f3 ff ff       	call   c0004be2 <scroll_up>
c0005838:	83 c4 10             	add    $0x10,%esp
c000583b:	c6 05 c4 16 01 c0 00 	movb   $0x0,0xc00116c4
c0005842:	c6 05 84 07 01 c0 00 	movb   $0x0,0xc0010784
c0005849:	eb 41                	jmp    c000588c <in_process+0x100>
c000584b:	83 ec 0c             	sub    $0xc,%esp
c000584e:	ff 75 08             	pushl  0x8(%ebp)
c0005851:	e8 ce f3 ff ff       	call   c0004c24 <scroll_down>
c0005856:	83 c4 10             	add    $0x10,%esp
c0005859:	c6 05 c4 16 01 c0 00 	movb   $0x0,0xc00116c4
c0005860:	c6 05 84 07 01 c0 00 	movb   $0x0,0xc0010784
c0005867:	eb 23                	jmp    c000588c <in_process+0x100>
c0005869:	83 ec 08             	sub    $0x8,%esp
c000586c:	6a 0a                	push   $0xa
c000586e:	ff 75 08             	pushl  0x8(%ebp)
c0005871:	e8 19 f4 ff ff       	call   c0004c8f <out_char>
c0005876:	83 c4 10             	add    $0x10,%esp
c0005879:	eb 11                	jmp    c000588c <in_process+0x100>
c000587b:	83 ec 08             	sub    $0x8,%esp
c000587e:	6a 08                	push   $0x8
c0005880:	ff 75 08             	pushl  0x8(%ebp)
c0005883:	e8 07 f4 ff ff       	call   c0004c8f <out_char>
c0005888:	83 c4 10             	add    $0x10,%esp
c000588b:	90                   	nop
c000588c:	e9 8a 00 00 00       	jmp    c000591b <in_process+0x18f>
c0005891:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0005898:	74 55                	je     c00058ef <in_process+0x163>
c000589a:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c00058a1:	77 14                	ja     c00058b7 <in_process+0x12b>
c00058a3:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c00058aa:	74 31                	je     c00058dd <in_process+0x151>
c00058ac:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c00058b3:	74 16                	je     c00058cb <in_process+0x13f>
c00058b5:	eb 64                	jmp    c000591b <in_process+0x18f>
c00058b7:	81 7d 0c 41 01 00 00 	cmpl   $0x141,0xc(%ebp)
c00058be:	74 3e                	je     c00058fe <in_process+0x172>
c00058c0:	81 7d 0c 42 01 00 00 	cmpl   $0x142,0xc(%ebp)
c00058c7:	74 44                	je     c000590d <in_process+0x181>
c00058c9:	eb 50                	jmp    c000591b <in_process+0x18f>
c00058cb:	83 ec 08             	sub    $0x8,%esp
c00058ce:	6a 0a                	push   $0xa
c00058d0:	ff 75 08             	pushl  0x8(%ebp)
c00058d3:	e8 9e f2 ff ff       	call   c0004b76 <put_key>
c00058d8:	83 c4 10             	add    $0x10,%esp
c00058db:	eb 3e                	jmp    c000591b <in_process+0x18f>
c00058dd:	83 ec 08             	sub    $0x8,%esp
c00058e0:	6a 08                	push   $0x8
c00058e2:	ff 75 08             	pushl  0x8(%ebp)
c00058e5:	e8 8c f2 ff ff       	call   c0004b76 <put_key>
c00058ea:	83 c4 10             	add    $0x10,%esp
c00058ed:	eb 2c                	jmp    c000591b <in_process+0x18f>
c00058ef:	83 ec 0c             	sub    $0xc,%esp
c00058f2:	6a 00                	push   $0x0
c00058f4:	e8 4c f1 ff ff       	call   c0004a45 <select_console>
c00058f9:	83 c4 10             	add    $0x10,%esp
c00058fc:	eb 1d                	jmp    c000591b <in_process+0x18f>
c00058fe:	83 ec 0c             	sub    $0xc,%esp
c0005901:	6a 01                	push   $0x1
c0005903:	e8 3d f1 ff ff       	call   c0004a45 <select_console>
c0005908:	83 c4 10             	add    $0x10,%esp
c000590b:	eb 0e                	jmp    c000591b <in_process+0x18f>
c000590d:	83 ec 0c             	sub    $0xc,%esp
c0005910:	6a 02                	push   $0x2
c0005912:	e8 2e f1 ff ff       	call   c0004a45 <select_console>
c0005917:	83 c4 10             	add    $0x10,%esp
c000591a:	90                   	nop
c000591b:	90                   	nop
c000591c:	c9                   	leave  
c000591d:	c3                   	ret    

c000591e <open>:
c000591e:	55                   	push   %ebp
c000591f:	89 e5                	mov    %esp,%ebp
c0005921:	83 ec 18             	sub    $0x18,%esp
c0005924:	83 ec 0c             	sub    $0xc,%esp
c0005927:	6a 7c                	push   $0x7c
c0005929:	e8 3e cb ff ff       	call   c000246c <sys_malloc>
c000592e:	83 c4 10             	add    $0x10,%esp
c0005931:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005934:	83 ec 04             	sub    $0x4,%esp
c0005937:	6a 7c                	push   $0x7c
c0005939:	6a 00                	push   $0x0
c000593b:	ff 75 f4             	pushl  -0xc(%ebp)
c000593e:	e8 dc 62 00 00       	call   c000bc1f <Memset>
c0005943:	83 c4 10             	add    $0x10,%esp
c0005946:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005949:	c7 40 78 06 00 00 00 	movl   $0x6,0x78(%eax)
c0005950:	83 ec 0c             	sub    $0xc,%esp
c0005953:	ff 75 08             	pushl  0x8(%ebp)
c0005956:	e8 43 14 00 00       	call   c0006d9e <get_physical_address>
c000595b:	83 c4 10             	add    $0x10,%esp
c000595e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005961:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005964:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0005967:	89 50 44             	mov    %edx,0x44(%eax)
c000596a:	8b 55 0c             	mov    0xc(%ebp),%edx
c000596d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005970:	89 50 74             	mov    %edx,0x74(%eax)
c0005973:	83 ec 0c             	sub    $0xc,%esp
c0005976:	ff 75 08             	pushl  0x8(%ebp)
c0005979:	e8 da 62 00 00       	call   c000bc58 <Strlen>
c000597e:	83 c4 10             	add    $0x10,%esp
c0005981:	89 c2                	mov    %eax,%edx
c0005983:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005986:	89 50 40             	mov    %edx,0x40(%eax)
c0005989:	83 ec 04             	sub    $0x4,%esp
c000598c:	6a 02                	push   $0x2
c000598e:	ff 75 f4             	pushl  -0xc(%ebp)
c0005991:	6a 03                	push   $0x3
c0005993:	e8 cc 44 00 00       	call   c0009e64 <send_rec>
c0005998:	83 c4 10             	add    $0x10,%esp
c000599b:	83 ec 08             	sub    $0x8,%esp
c000599e:	6a 7c                	push   $0x7c
c00059a0:	ff 75 f4             	pushl  -0xc(%ebp)
c00059a3:	e8 d9 ca ff ff       	call   c0002481 <sys_free>
c00059a8:	83 c4 10             	add    $0x10,%esp
c00059ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00059ae:	8b 40 50             	mov    0x50(%eax),%eax
c00059b1:	c9                   	leave  
c00059b2:	c3                   	ret    

c00059b3 <read>:
c00059b3:	55                   	push   %ebp
c00059b4:	89 e5                	mov    %esp,%ebp
c00059b6:	83 ec 38             	sub    $0x38,%esp
c00059b9:	c7 45 dc 7c 00 00 00 	movl   $0x7c,-0x24(%ebp)
c00059c0:	83 ec 0c             	sub    $0xc,%esp
c00059c3:	ff 75 dc             	pushl  -0x24(%ebp)
c00059c6:	e8 a1 ca ff ff       	call   c000246c <sys_malloc>
c00059cb:	83 c4 10             	add    $0x10,%esp
c00059ce:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00059d1:	8b 45 0c             	mov    0xc(%ebp),%eax
c00059d4:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c00059d9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00059dc:	83 ec 0c             	sub    $0xc,%esp
c00059df:	ff 75 0c             	pushl  0xc(%ebp)
c00059e2:	e8 b7 13 00 00       	call   c0006d9e <get_physical_address>
c00059e7:	83 c4 10             	add    $0x10,%esp
c00059ea:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00059ed:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00059f0:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c00059f5:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00059f8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00059fb:	05 ff 0f 00 00       	add    $0xfff,%eax
c0005a00:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0005a03:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0005a0a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0005a11:	8b 55 10             	mov    0x10(%ebp),%edx
c0005a14:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005a17:	01 d0                	add    %edx,%eax
c0005a19:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
c0005a1c:	0f 83 a8 00 00 00    	jae    c0005aca <read+0x117>
c0005a22:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005a25:	2b 45 f0             	sub    -0x10(%ebp),%eax
c0005a28:	05 00 10 00 00       	add    $0x1000,%eax
c0005a2d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0005a30:	8b 45 10             	mov    0x10(%ebp),%eax
c0005a33:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0005a36:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0005a39:	83 ec 04             	sub    $0x4,%esp
c0005a3c:	50                   	push   %eax
c0005a3d:	6a 00                	push   $0x0
c0005a3f:	ff 75 d8             	pushl  -0x28(%ebp)
c0005a42:	e8 d8 61 00 00       	call   c000bc1f <Memset>
c0005a47:	83 c4 10             	add    $0x10,%esp
c0005a4a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005a4d:	c7 40 78 07 00 00 00 	movl   $0x7,0x78(%eax)
c0005a54:	8b 55 08             	mov    0x8(%ebp),%edx
c0005a57:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005a5a:	89 50 50             	mov    %edx,0x50(%eax)
c0005a5d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005a60:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0005a63:	89 50 10             	mov    %edx,0x10(%eax)
c0005a66:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005a69:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0005a6c:	89 50 60             	mov    %edx,0x60(%eax)
c0005a6f:	83 ec 04             	sub    $0x4,%esp
c0005a72:	6a 02                	push   $0x2
c0005a74:	ff 75 d8             	pushl  -0x28(%ebp)
c0005a77:	6a 03                	push   $0x3
c0005a79:	e8 e6 43 00 00       	call   c0009e64 <send_rec>
c0005a7e:	83 c4 10             	add    $0x10,%esp
c0005a81:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005a84:	8b 40 60             	mov    0x60(%eax),%eax
c0005a87:	01 45 e8             	add    %eax,-0x18(%ebp)
c0005a8a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0005a8d:	29 45 e0             	sub    %eax,-0x20(%ebp)
c0005a90:	8b 45 10             	mov    0x10(%ebp),%eax
c0005a93:	2b 45 e4             	sub    -0x1c(%ebp),%eax
c0005a96:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0005a99:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0005a9c:	89 45 10             	mov    %eax,0x10(%ebp)
c0005a9f:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
c0005aa6:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c0005aad:	83 ec 0c             	sub    $0xc,%esp
c0005ab0:	ff 75 f4             	pushl  -0xc(%ebp)
c0005ab3:	e8 e6 12 00 00       	call   c0006d9e <get_physical_address>
c0005ab8:	83 c4 10             	add    $0x10,%esp
c0005abb:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005abe:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0005ac2:	0f 85 6e ff ff ff    	jne    c0005a36 <read+0x83>
c0005ac8:	eb 54                	jmp    c0005b1e <read+0x16b>
c0005aca:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0005acd:	83 ec 04             	sub    $0x4,%esp
c0005ad0:	50                   	push   %eax
c0005ad1:	6a 00                	push   $0x0
c0005ad3:	ff 75 d8             	pushl  -0x28(%ebp)
c0005ad6:	e8 44 61 00 00       	call   c000bc1f <Memset>
c0005adb:	83 c4 10             	add    $0x10,%esp
c0005ade:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005ae1:	c7 40 78 07 00 00 00 	movl   $0x7,0x78(%eax)
c0005ae8:	8b 55 08             	mov    0x8(%ebp),%edx
c0005aeb:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005aee:	89 50 50             	mov    %edx,0x50(%eax)
c0005af1:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005af4:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0005af7:	89 50 10             	mov    %edx,0x10(%eax)
c0005afa:	8b 55 10             	mov    0x10(%ebp),%edx
c0005afd:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005b00:	89 50 60             	mov    %edx,0x60(%eax)
c0005b03:	83 ec 04             	sub    $0x4,%esp
c0005b06:	6a 02                	push   $0x2
c0005b08:	ff 75 d8             	pushl  -0x28(%ebp)
c0005b0b:	6a 03                	push   $0x3
c0005b0d:	e8 52 43 00 00       	call   c0009e64 <send_rec>
c0005b12:	83 c4 10             	add    $0x10,%esp
c0005b15:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005b18:	8b 40 60             	mov    0x60(%eax),%eax
c0005b1b:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0005b1e:	83 ec 08             	sub    $0x8,%esp
c0005b21:	ff 75 dc             	pushl  -0x24(%ebp)
c0005b24:	ff 75 d8             	pushl  -0x28(%ebp)
c0005b27:	e8 55 c9 ff ff       	call   c0002481 <sys_free>
c0005b2c:	83 c4 10             	add    $0x10,%esp
c0005b2f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005b32:	c9                   	leave  
c0005b33:	c3                   	ret    

c0005b34 <write>:
c0005b34:	55                   	push   %ebp
c0005b35:	89 e5                	mov    %esp,%ebp
c0005b37:	83 ec 18             	sub    $0x18,%esp
c0005b3a:	c7 45 f4 7c 00 00 00 	movl   $0x7c,-0xc(%ebp)
c0005b41:	83 ec 0c             	sub    $0xc,%esp
c0005b44:	ff 75 f4             	pushl  -0xc(%ebp)
c0005b47:	e8 20 c9 ff ff       	call   c000246c <sys_malloc>
c0005b4c:	83 c4 10             	add    $0x10,%esp
c0005b4f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005b52:	83 ec 0c             	sub    $0xc,%esp
c0005b55:	ff 75 0c             	pushl  0xc(%ebp)
c0005b58:	e8 41 12 00 00       	call   c0006d9e <get_physical_address>
c0005b5d:	83 c4 10             	add    $0x10,%esp
c0005b60:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005b63:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005b66:	c7 40 78 0a 00 00 00 	movl   $0xa,0x78(%eax)
c0005b6d:	8b 55 08             	mov    0x8(%ebp),%edx
c0005b70:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005b73:	89 50 50             	mov    %edx,0x50(%eax)
c0005b76:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005b79:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0005b7c:	89 50 10             	mov    %edx,0x10(%eax)
c0005b7f:	8b 55 10             	mov    0x10(%ebp),%edx
c0005b82:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005b85:	89 50 60             	mov    %edx,0x60(%eax)
c0005b88:	83 ec 04             	sub    $0x4,%esp
c0005b8b:	6a 02                	push   $0x2
c0005b8d:	ff 75 f0             	pushl  -0x10(%ebp)
c0005b90:	6a 03                	push   $0x3
c0005b92:	e8 cd 42 00 00       	call   c0009e64 <send_rec>
c0005b97:	83 c4 10             	add    $0x10,%esp
c0005b9a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005b9d:	8b 40 60             	mov    0x60(%eax),%eax
c0005ba0:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0005ba3:	83 ec 08             	sub    $0x8,%esp
c0005ba6:	ff 75 f4             	pushl  -0xc(%ebp)
c0005ba9:	ff 75 f0             	pushl  -0x10(%ebp)
c0005bac:	e8 d0 c8 ff ff       	call   c0002481 <sys_free>
c0005bb1:	83 c4 10             	add    $0x10,%esp
c0005bb4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005bb7:	c9                   	leave  
c0005bb8:	c3                   	ret    

c0005bb9 <close>:
c0005bb9:	55                   	push   %ebp
c0005bba:	89 e5                	mov    %esp,%ebp
c0005bbc:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0005bc2:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0005bc9:	8b 45 08             	mov    0x8(%ebp),%eax
c0005bcc:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0005bcf:	83 ec 04             	sub    $0x4,%esp
c0005bd2:	6a 02                	push   $0x2
c0005bd4:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0005bda:	50                   	push   %eax
c0005bdb:	6a 03                	push   $0x3
c0005bdd:	e8 82 42 00 00       	call   c0009e64 <send_rec>
c0005be2:	83 c4 10             	add    $0x10,%esp
c0005be5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005be8:	83 f8 65             	cmp    $0x65,%eax
c0005beb:	74 19                	je     c0005c06 <close+0x4d>
c0005bed:	6a 13                	push   $0x13
c0005bef:	68 e3 b2 00 c0       	push   $0xc000b2e3
c0005bf4:	68 e3 b2 00 c0       	push   $0xc000b2e3
c0005bf9:	68 ef b2 00 c0       	push   $0xc000b2ef
c0005bfe:	e8 44 38 00 00       	call   c0009447 <assertion_failure>
c0005c03:	83 c4 10             	add    $0x10,%esp
c0005c06:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0005c09:	c9                   	leave  
c0005c0a:	c3                   	ret    

c0005c0b <wait>:
c0005c0b:	55                   	push   %ebp
c0005c0c:	89 e5                	mov    %esp,%ebp
c0005c0e:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0005c14:	c7 45 f4 09 00 00 00 	movl   $0x9,-0xc(%ebp)
c0005c1b:	83 ec 04             	sub    $0x4,%esp
c0005c1e:	6a 01                	push   $0x1
c0005c20:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0005c26:	50                   	push   %eax
c0005c27:	6a 03                	push   $0x3
c0005c29:	e8 36 42 00 00       	call   c0009e64 <send_rec>
c0005c2e:	83 c4 10             	add    $0x10,%esp
c0005c31:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0005c34:	89 c2                	mov    %eax,%edx
c0005c36:	8b 45 08             	mov    0x8(%ebp),%eax
c0005c39:	89 10                	mov    %edx,(%eax)
c0005c3b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005c3e:	83 f8 21             	cmp    $0x21,%eax
c0005c41:	74 05                	je     c0005c48 <wait+0x3d>
c0005c43:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005c46:	eb 05                	jmp    c0005c4d <wait+0x42>
c0005c48:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0005c4d:	c9                   	leave  
c0005c4e:	c3                   	ret    

c0005c4f <exit>:
c0005c4f:	55                   	push   %ebp
c0005c50:	89 e5                	mov    %esp,%ebp
c0005c52:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0005c58:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
c0005c5f:	8b 45 08             	mov    0x8(%ebp),%eax
c0005c62:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0005c65:	83 ec 04             	sub    $0x4,%esp
c0005c68:	6a 01                	push   $0x1
c0005c6a:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0005c70:	50                   	push   %eax
c0005c71:	6a 03                	push   $0x3
c0005c73:	e8 ec 41 00 00       	call   c0009e64 <send_rec>
c0005c78:	83 c4 10             	add    $0x10,%esp
c0005c7b:	90                   	nop
c0005c7c:	c9                   	leave  
c0005c7d:	c3                   	ret    

c0005c7e <fork>:
c0005c7e:	55                   	push   %ebp
c0005c7f:	89 e5                	mov    %esp,%ebp
c0005c81:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0005c87:	83 ec 04             	sub    $0x4,%esp
c0005c8a:	6a 7c                	push   $0x7c
c0005c8c:	6a 00                	push   $0x0
c0005c8e:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0005c94:	50                   	push   %eax
c0005c95:	e8 85 5f 00 00       	call   c000bc1f <Memset>
c0005c9a:	83 c4 10             	add    $0x10,%esp
c0005c9d:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
c0005ca4:	83 ec 04             	sub    $0x4,%esp
c0005ca7:	6a 01                	push   $0x1
c0005ca9:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0005caf:	50                   	push   %eax
c0005cb0:	6a 03                	push   $0x3
c0005cb2:	e8 ad 41 00 00       	call   c0009e64 <send_rec>
c0005cb7:	83 c4 10             	add    $0x10,%esp
c0005cba:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c0005cc1:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005cc4:	c9                   	leave  
c0005cc5:	c3                   	ret    

c0005cc6 <getpid>:
c0005cc6:	55                   	push   %ebp
c0005cc7:	89 e5                	mov    %esp,%ebp
c0005cc9:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0005ccf:	c7 45 f4 05 00 00 00 	movl   $0x5,-0xc(%ebp)
c0005cd6:	83 ec 04             	sub    $0x4,%esp
c0005cd9:	6a 05                	push   $0x5
c0005cdb:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0005ce1:	50                   	push   %eax
c0005ce2:	6a 03                	push   $0x3
c0005ce4:	e8 7b 41 00 00       	call   c0009e64 <send_rec>
c0005ce9:	83 c4 10             	add    $0x10,%esp
c0005cec:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005cef:	c9                   	leave  
c0005cf0:	c3                   	ret    

c0005cf1 <exec>:
c0005cf1:	55                   	push   %ebp
c0005cf2:	89 e5                	mov    %esp,%ebp
c0005cf4:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0005cfa:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0005d01:	8b 45 08             	mov    0x8(%ebp),%eax
c0005d04:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0005d07:	83 ec 0c             	sub    $0xc,%esp
c0005d0a:	ff 75 08             	pushl  0x8(%ebp)
c0005d0d:	e8 46 5f 00 00       	call   c000bc58 <Strlen>
c0005d12:	83 c4 10             	add    $0x10,%esp
c0005d15:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0005d18:	c7 45 8c 00 00 00 00 	movl   $0x0,-0x74(%ebp)
c0005d1f:	c7 45 98 00 00 00 00 	movl   $0x0,-0x68(%ebp)
c0005d26:	83 ec 04             	sub    $0x4,%esp
c0005d29:	6a 01                	push   $0x1
c0005d2b:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0005d31:	50                   	push   %eax
c0005d32:	6a 03                	push   $0x3
c0005d34:	e8 2b 41 00 00       	call   c0009e64 <send_rec>
c0005d39:	83 c4 10             	add    $0x10,%esp
c0005d3c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005d3f:	83 f8 65             	cmp    $0x65,%eax
c0005d42:	74 19                	je     c0005d5d <exec+0x6c>
c0005d44:	6a 19                	push   $0x19
c0005d46:	68 07 b3 00 c0       	push   $0xc000b307
c0005d4b:	68 07 b3 00 c0       	push   $0xc000b307
c0005d50:	68 12 b3 00 c0       	push   $0xc000b312
c0005d55:	e8 ed 36 00 00       	call   c0009447 <assertion_failure>
c0005d5a:	83 c4 10             	add    $0x10,%esp
c0005d5d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0005d60:	c9                   	leave  
c0005d61:	c3                   	ret    

c0005d62 <execv>:
c0005d62:	55                   	push   %ebp
c0005d63:	89 e5                	mov    %esp,%ebp
c0005d65:	81 ec b8 00 00 00    	sub    $0xb8,%esp
c0005d6b:	83 ec 0c             	sub    $0xc,%esp
c0005d6e:	68 00 04 00 00       	push   $0x400
c0005d73:	e8 f4 c6 ff ff       	call   c000246c <sys_malloc>
c0005d78:	83 c4 10             	add    $0x10,%esp
c0005d7b:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0005d7e:	83 ec 04             	sub    $0x4,%esp
c0005d81:	68 00 04 00 00       	push   $0x400
c0005d86:	6a 00                	push   $0x0
c0005d88:	ff 75 e0             	pushl  -0x20(%ebp)
c0005d8b:	e8 8f 5e 00 00       	call   c000bc1f <Memset>
c0005d90:	83 c4 10             	add    $0x10,%esp
c0005d93:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005d96:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005d99:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0005da0:	eb 23                	jmp    c0005dc5 <execv+0x63>
c0005da2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005da5:	8b 00                	mov    (%eax),%eax
c0005da7:	83 ec 08             	sub    $0x8,%esp
c0005daa:	50                   	push   %eax
c0005dab:	68 2a b3 00 c0       	push   $0xc000b32a
c0005db0:	e8 35 33 00 00       	call   c00090ea <Printf>
c0005db5:	83 c4 10             	add    $0x10,%esp
c0005db8:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
c0005dbc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005dbf:	83 c0 04             	add    $0x4,%eax
c0005dc2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005dc5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005dc8:	8b 00                	mov    (%eax),%eax
c0005dca:	85 c0                	test   %eax,%eax
c0005dcc:	75 d4                	jne    c0005da2 <execv+0x40>
c0005dce:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0005dd1:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0005dd4:	01 d0                	add    %edx,%eax
c0005dd6:	c6 00 00             	movb   $0x0,(%eax)
c0005dd9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005ddc:	83 c0 04             	add    $0x4,%eax
c0005ddf:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005de2:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0005de5:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005de8:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005deb:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0005dee:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0005df5:	eb 5b                	jmp    c0005e52 <execv+0xf0>
c0005df7:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0005dfa:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0005dfd:	01 c2                	add    %eax,%edx
c0005dff:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005e02:	89 10                	mov    %edx,(%eax)
c0005e04:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005e07:	8b 00                	mov    (%eax),%eax
c0005e09:	8b 4d f0             	mov    -0x10(%ebp),%ecx
c0005e0c:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0005e0f:	01 ca                	add    %ecx,%edx
c0005e11:	83 ec 08             	sub    $0x8,%esp
c0005e14:	50                   	push   %eax
c0005e15:	52                   	push   %edx
c0005e16:	e8 23 5e 00 00       	call   c000bc3e <Strcpy>
c0005e1b:	83 c4 10             	add    $0x10,%esp
c0005e1e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005e21:	8b 00                	mov    (%eax),%eax
c0005e23:	83 ec 0c             	sub    $0xc,%esp
c0005e26:	50                   	push   %eax
c0005e27:	e8 2c 5e 00 00       	call   c000bc58 <Strlen>
c0005e2c:	83 c4 10             	add    $0x10,%esp
c0005e2f:	01 45 f0             	add    %eax,-0x10(%ebp)
c0005e32:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0005e35:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0005e38:	01 d0                	add    %edx,%eax
c0005e3a:	c6 00 00             	movb   $0x0,(%eax)
c0005e3d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005e40:	83 c0 01             	add    $0x1,%eax
c0005e43:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005e46:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
c0005e4a:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c0005e4e:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0005e52:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005e55:	8b 00                	mov    (%eax),%eax
c0005e57:	85 c0                	test   %eax,%eax
c0005e59:	75 9c                	jne    c0005df7 <execv+0x95>
c0005e5b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005e5e:	ba 00 00 00 c0       	mov    $0xc0000000,%edx
c0005e63:	29 c2                	sub    %eax,%edx
c0005e65:	89 d0                	mov    %edx,%eax
c0005e67:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0005e6a:	83 ec 0c             	sub    $0xc,%esp
c0005e6d:	ff 75 08             	pushl  0x8(%ebp)
c0005e70:	e8 29 0f 00 00       	call   c0006d9e <get_physical_address>
c0005e75:	83 c4 10             	add    $0x10,%esp
c0005e78:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0005e7b:	83 ec 0c             	sub    $0xc,%esp
c0005e7e:	ff 75 e0             	pushl  -0x20(%ebp)
c0005e81:	e8 18 0f 00 00       	call   c0006d9e <get_physical_address>
c0005e86:	83 c4 10             	add    $0x10,%esp
c0005e89:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0005e8c:	83 ec 0c             	sub    $0xc,%esp
c0005e8f:	ff 75 dc             	pushl  -0x24(%ebp)
c0005e92:	e8 07 0f 00 00       	call   c0006d9e <get_physical_address>
c0005e97:	83 c4 10             	add    $0x10,%esp
c0005e9a:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0005e9d:	c7 45 cc 02 00 00 00 	movl   $0x2,-0x34(%ebp)
c0005ea4:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005ea7:	89 45 98             	mov    %eax,-0x68(%ebp)
c0005eaa:	83 ec 0c             	sub    $0xc,%esp
c0005ead:	ff 75 08             	pushl  0x8(%ebp)
c0005eb0:	e8 a3 5d 00 00       	call   c000bc58 <Strlen>
c0005eb5:	83 c4 10             	add    $0x10,%esp
c0005eb8:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0005ebb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0005ebe:	89 85 64 ff ff ff    	mov    %eax,-0x9c(%ebp)
c0005ec4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005ec7:	89 85 70 ff ff ff    	mov    %eax,-0x90(%ebp)
c0005ecd:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0005ed0:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
c0005ed6:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0005ed9:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0005edf:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0005ee2:	89 85 7c ff ff ff    	mov    %eax,-0x84(%ebp)
c0005ee8:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0005eeb:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0005eee:	29 c2                	sub    %eax,%edx
c0005ef0:	89 d0                	mov    %edx,%eax
c0005ef2:	89 45 80             	mov    %eax,-0x80(%ebp)
c0005ef5:	83 ec 04             	sub    $0x4,%esp
c0005ef8:	6a 01                	push   $0x1
c0005efa:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
c0005f00:	50                   	push   %eax
c0005f01:	6a 03                	push   $0x3
c0005f03:	e8 5c 3f 00 00       	call   c0009e64 <send_rec>
c0005f08:	83 c4 10             	add    $0x10,%esp
c0005f0b:	83 ec 08             	sub    $0x8,%esp
c0005f0e:	68 00 04 00 00       	push   $0x400
c0005f13:	ff 75 e0             	pushl  -0x20(%ebp)
c0005f16:	e8 66 c5 ff ff       	call   c0002481 <sys_free>
c0005f1b:	83 c4 10             	add    $0x10,%esp
c0005f1e:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0005f21:	83 f8 65             	cmp    $0x65,%eax
c0005f24:	74 1c                	je     c0005f42 <execv+0x1e0>
c0005f26:	68 93 00 00 00       	push   $0x93
c0005f2b:	68 07 b3 00 c0       	push   $0xc000b307
c0005f30:	68 07 b3 00 c0       	push   $0xc000b307
c0005f35:	68 12 b3 00 c0       	push   $0xc000b312
c0005f3a:	e8 08 35 00 00       	call   c0009447 <assertion_failure>
c0005f3f:	83 c4 10             	add    $0x10,%esp
c0005f42:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0005f45:	c9                   	leave  
c0005f46:	c3                   	ret    

c0005f47 <execl>:
c0005f47:	55                   	push   %ebp
c0005f48:	89 e5                	mov    %esp,%ebp
c0005f4a:	83 ec 18             	sub    $0x18,%esp
c0005f4d:	8d 45 0c             	lea    0xc(%ebp),%eax
c0005f50:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005f53:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005f56:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005f59:	83 ec 08             	sub    $0x8,%esp
c0005f5c:	ff 75 f0             	pushl  -0x10(%ebp)
c0005f5f:	ff 75 08             	pushl  0x8(%ebp)
c0005f62:	e8 fb fd ff ff       	call   c0005d62 <execv>
c0005f67:	83 c4 10             	add    $0x10,%esp
c0005f6a:	c9                   	leave  
c0005f6b:	c3                   	ret    

c0005f6c <TaskMM>:
c0005f6c:	55                   	push   %ebp
c0005f6d:	89 e5                	mov    %esp,%ebp
c0005f6f:	83 ec 28             	sub    $0x28,%esp
c0005f72:	83 ec 0c             	sub    $0xc,%esp
c0005f75:	6a 7c                	push   $0x7c
c0005f77:	e8 f0 c4 ff ff       	call   c000246c <sys_malloc>
c0005f7c:	83 c4 10             	add    $0x10,%esp
c0005f7f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005f82:	83 ec 0c             	sub    $0xc,%esp
c0005f85:	6a 7c                	push   $0x7c
c0005f87:	e8 e0 c4 ff ff       	call   c000246c <sys_malloc>
c0005f8c:	83 c4 10             	add    $0x10,%esp
c0005f8f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005f92:	83 ec 04             	sub    $0x4,%esp
c0005f95:	6a 12                	push   $0x12
c0005f97:	ff 75 f0             	pushl  -0x10(%ebp)
c0005f9a:	6a 02                	push   $0x2
c0005f9c:	e8 c3 3e 00 00       	call   c0009e64 <send_rec>
c0005fa1:	83 c4 10             	add    $0x10,%esp
c0005fa4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005fa7:	8b 40 78             	mov    0x78(%eax),%eax
c0005faa:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0005fad:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005fb0:	8b 00                	mov    (%eax),%eax
c0005fb2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0005fb5:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0005fbc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005fbf:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0005fc6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005fc9:	c7 40 58 00 00 00 00 	movl   $0x0,0x58(%eax)
c0005fd0:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c0005fd4:	74 4e                	je     c0006024 <TaskMM+0xb8>
c0005fd6:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c0005fda:	7f 08                	jg     c0005fe4 <TaskMM+0x78>
c0005fdc:	83 7d e8 02          	cmpl   $0x2,-0x18(%ebp)
c0005fe0:	74 28                	je     c000600a <TaskMM+0x9e>
c0005fe2:	eb 71                	jmp    c0006055 <TaskMM+0xe9>
c0005fe4:	83 7d e8 04          	cmpl   $0x4,-0x18(%ebp)
c0005fe8:	74 08                	je     c0005ff2 <TaskMM+0x86>
c0005fea:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c0005fee:	74 4e                	je     c000603e <TaskMM+0xd2>
c0005ff0:	eb 63                	jmp    c0006055 <TaskMM+0xe9>
c0005ff2:	83 ec 0c             	sub    $0xc,%esp
c0005ff5:	ff 75 f0             	pushl  -0x10(%ebp)
c0005ff8:	e8 d0 04 00 00       	call   c00064cd <do_fork>
c0005ffd:	83 c4 10             	add    $0x10,%esp
c0006000:	89 c2                	mov    %eax,%edx
c0006002:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006005:	89 50 5c             	mov    %edx,0x5c(%eax)
c0006008:	eb 5c                	jmp    c0006066 <TaskMM+0xfa>
c000600a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006011:	66 87 db             	xchg   %bx,%bx
c0006014:	83 ec 0c             	sub    $0xc,%esp
c0006017:	ff 75 f0             	pushl  -0x10(%ebp)
c000601a:	e8 95 00 00 00       	call   c00060b4 <do_exec>
c000601f:	83 c4 10             	add    $0x10,%esp
c0006022:	eb 42                	jmp    c0006066 <TaskMM+0xfa>
c0006024:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000602b:	83 ec 08             	sub    $0x8,%esp
c000602e:	ff 75 e0             	pushl  -0x20(%ebp)
c0006031:	ff 75 f0             	pushl  -0x10(%ebp)
c0006034:	e8 02 05 00 00       	call   c000653b <do_exit>
c0006039:	83 c4 10             	add    $0x10,%esp
c000603c:	eb 28                	jmp    c0006066 <TaskMM+0xfa>
c000603e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006045:	83 ec 0c             	sub    $0xc,%esp
c0006048:	ff 75 f0             	pushl  -0x10(%ebp)
c000604b:	e8 e7 05 00 00       	call   c0006637 <do_wait>
c0006050:	83 c4 10             	add    $0x10,%esp
c0006053:	eb 11                	jmp    c0006066 <TaskMM+0xfa>
c0006055:	83 ec 0c             	sub    $0xc,%esp
c0006058:	68 34 b3 00 c0       	push   $0xc000b334
c000605d:	e8 c7 33 00 00       	call   c0009429 <panic>
c0006062:	83 c4 10             	add    $0x10,%esp
c0006065:	90                   	nop
c0006066:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000606a:	0f 84 22 ff ff ff    	je     c0005f92 <TaskMM+0x26>
c0006070:	83 ec 0c             	sub    $0xc,%esp
c0006073:	6a 03                	push   $0x3
c0006075:	e8 3c 2f 00 00       	call   c0008fb6 <delay>
c000607a:	83 c4 10             	add    $0x10,%esp
c000607d:	83 ec 04             	sub    $0x4,%esp
c0006080:	ff 75 e4             	pushl  -0x1c(%ebp)
c0006083:	ff 75 ec             	pushl  -0x14(%ebp)
c0006086:	6a 01                	push   $0x1
c0006088:	e8 d7 3d 00 00       	call   c0009e64 <send_rec>
c000608d:	83 c4 10             	add    $0x10,%esp
c0006090:	e9 fd fe ff ff       	jmp    c0005f92 <TaskMM+0x26>

c0006095 <alloc_mem>:
c0006095:	55                   	push   %ebp
c0006096:	89 e5                	mov    %esp,%ebp
c0006098:	83 ec 10             	sub    $0x10,%esp
c000609b:	8b 45 08             	mov    0x8(%ebp),%eax
c000609e:	83 e8 08             	sub    $0x8,%eax
c00060a1:	69 c0 00 10 10 00    	imul   $0x101000,%eax,%eax
c00060a7:	05 00 00 a0 00       	add    $0xa00000,%eax
c00060ac:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00060af:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00060b2:	c9                   	leave  
c00060b3:	c3                   	ret    

c00060b4 <do_exec>:
c00060b4:	55                   	push   %ebp
c00060b5:	89 e5                	mov    %esp,%ebp
c00060b7:	81 ec 38 01 00 00    	sub    $0x138,%esp
c00060bd:	c7 85 56 ff ff ff 64 	movl   $0x5f766564,-0xaa(%ebp)
c00060c4:	65 76 5f 
c00060c7:	c7 85 5a ff ff ff 74 	movl   $0x31797474,-0xa6(%ebp)
c00060ce:	74 79 31 
c00060d1:	66 c7 85 5e ff ff ff 	movw   $0x0,-0xa2(%ebp)
c00060d8:	00 00 
c00060da:	83 ec 08             	sub    $0x8,%esp
c00060dd:	6a 00                	push   $0x0
c00060df:	8d 85 56 ff ff ff    	lea    -0xaa(%ebp),%eax
c00060e5:	50                   	push   %eax
c00060e6:	e8 33 f8 ff ff       	call   c000591e <open>
c00060eb:	83 c4 10             	add    $0x10,%esp
c00060ee:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00060f1:	8b 45 08             	mov    0x8(%ebp),%eax
c00060f4:	8b 00                	mov    (%eax),%eax
c00060f6:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00060f9:	c7 45 d0 00 30 03 00 	movl   $0x33000,-0x30(%ebp)
c0006100:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0006103:	83 ec 0c             	sub    $0xc,%esp
c0006106:	50                   	push   %eax
c0006107:	e8 60 c3 ff ff       	call   c000246c <sys_malloc>
c000610c:	83 c4 10             	add    $0x10,%esp
c000610f:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0006112:	83 ec 04             	sub    $0x4,%esp
c0006115:	ff 75 d0             	pushl  -0x30(%ebp)
c0006118:	6a 00                	push   $0x0
c000611a:	ff 75 cc             	pushl  -0x34(%ebp)
c000611d:	e8 fd 5a 00 00       	call   c000bc1f <Memset>
c0006122:	83 c4 10             	add    $0x10,%esp
c0006125:	83 ec 04             	sub    $0x4,%esp
c0006128:	6a 0c                	push   $0xc
c000612a:	6a 00                	push   $0x0
c000612c:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c0006132:	50                   	push   %eax
c0006133:	e8 e7 5a 00 00       	call   c000bc1f <Memset>
c0006138:	83 c4 10             	add    $0x10,%esp
c000613b:	8b 45 08             	mov    0x8(%ebp),%eax
c000613e:	8b 40 44             	mov    0x44(%eax),%eax
c0006141:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0006144:	8b 45 08             	mov    0x8(%ebp),%eax
c0006147:	8b 40 40             	mov    0x40(%eax),%eax
c000614a:	83 ec 08             	sub    $0x8,%esp
c000614d:	50                   	push   %eax
c000614e:	ff 75 c8             	pushl  -0x38(%ebp)
c0006151:	e8 fe 0a 00 00       	call   c0006c54 <alloc_virtual_memory>
c0006156:	83 c4 10             	add    $0x10,%esp
c0006159:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c000615c:	8b 45 08             	mov    0x8(%ebp),%eax
c000615f:	8b 40 40             	mov    0x40(%eax),%eax
c0006162:	89 c2                	mov    %eax,%edx
c0006164:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0006167:	83 ec 04             	sub    $0x4,%esp
c000616a:	52                   	push   %edx
c000616b:	50                   	push   %eax
c000616c:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c0006172:	50                   	push   %eax
c0006173:	e8 f6 18 00 00       	call   c0007a6e <Memcpy>
c0006178:	83 c4 10             	add    $0x10,%esp
c000617b:	8b 45 08             	mov    0x8(%ebp),%eax
c000617e:	8b 40 40             	mov    0x40(%eax),%eax
c0006181:	c6 84 05 4a ff ff ff 	movb   $0x0,-0xb6(%ebp,%eax,1)
c0006188:	00 
c0006189:	83 ec 08             	sub    $0x8,%esp
c000618c:	6a 00                	push   $0x0
c000618e:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c0006194:	50                   	push   %eax
c0006195:	e8 84 f7 ff ff       	call   c000591e <open>
c000619a:	83 c4 10             	add    $0x10,%esp
c000619d:	89 45 c0             	mov    %eax,-0x40(%ebp)
c00061a0:	83 7d c0 ff          	cmpl   $0xffffffff,-0x40(%ebp)
c00061a4:	75 15                	jne    c00061bb <do_exec+0x107>
c00061a6:	83 ec 0c             	sub    $0xc,%esp
c00061a9:	68 45 b3 00 c0       	push   $0xc000b345
c00061ae:	e8 37 2f 00 00       	call   c00090ea <Printf>
c00061b3:	83 c4 10             	add    $0x10,%esp
c00061b6:	e9 10 03 00 00       	jmp    c00064cb <do_exec+0x417>
c00061bb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00061c2:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00061c5:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00061c8:	01 d0                	add    %edx,%eax
c00061ca:	83 ec 04             	sub    $0x4,%esp
c00061cd:	68 00 10 00 00       	push   $0x1000
c00061d2:	50                   	push   %eax
c00061d3:	ff 75 c0             	pushl  -0x40(%ebp)
c00061d6:	e8 d8 f7 ff ff       	call   c00059b3 <read>
c00061db:	83 c4 10             	add    $0x10,%esp
c00061de:	89 45 bc             	mov    %eax,-0x44(%ebp)
c00061e1:	8b 45 bc             	mov    -0x44(%ebp),%eax
c00061e4:	01 45 f4             	add    %eax,-0xc(%ebp)
c00061e7:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
c00061eb:	74 0a                	je     c00061f7 <do_exec+0x143>
c00061ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00061f0:	3b 45 d0             	cmp    -0x30(%ebp),%eax
c00061f3:	7d 05                	jge    c00061fa <do_exec+0x146>
c00061f5:	eb cb                	jmp    c00061c2 <do_exec+0x10e>
c00061f7:	90                   	nop
c00061f8:	eb 01                	jmp    c00061fb <do_exec+0x147>
c00061fa:	90                   	nop
c00061fb:	83 ec 0c             	sub    $0xc,%esp
c00061fe:	ff 75 c0             	pushl  -0x40(%ebp)
c0006201:	e8 b3 f9 ff ff       	call   c0005bb9 <close>
c0006206:	83 c4 10             	add    $0x10,%esp
c0006209:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000620c:	89 45 b8             	mov    %eax,-0x48(%ebp)
c000620f:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0006212:	8b 40 18             	mov    0x18(%eax),%eax
c0006215:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0006218:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000621f:	e9 04 01 00 00       	jmp    c0006328 <do_exec+0x274>
c0006224:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0006227:	0f b7 40 28          	movzwl 0x28(%eax),%eax
c000622b:	0f b7 d0             	movzwl %ax,%edx
c000622e:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0006231:	0f b7 40 2a          	movzwl 0x2a(%eax),%eax
c0006235:	0f b7 c0             	movzwl %ax,%eax
c0006238:	0f af 45 f0          	imul   -0x10(%ebp),%eax
c000623c:	01 c2                	add    %eax,%edx
c000623e:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0006241:	01 d0                	add    %edx,%eax
c0006243:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0006246:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0006249:	8b 40 10             	mov    0x10(%eax),%eax
c000624c:	89 45 ac             	mov    %eax,-0x54(%ebp)
c000624f:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0006252:	05 ff 0f 00 00       	add    $0xfff,%eax
c0006257:	c1 e8 0c             	shr    $0xc,%eax
c000625a:	89 45 a8             	mov    %eax,-0x58(%ebp)
c000625d:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0006260:	8b 40 08             	mov    0x8(%eax),%eax
c0006263:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0006266:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000626d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0006270:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c0006273:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0006276:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0006279:	8b 50 04             	mov    0x4(%eax),%edx
c000627c:	8b 45 a0             	mov    -0x60(%ebp),%eax
c000627f:	01 d0                	add    %edx,%eax
c0006281:	89 45 9c             	mov    %eax,-0x64(%ebp)
c0006284:	83 7d ac 00          	cmpl   $0x0,-0x54(%ebp)
c0006288:	0f 84 95 00 00 00    	je     c0006323 <do_exec+0x26f>
c000628e:	83 ec 04             	sub    $0x4,%esp
c0006291:	ff 75 d4             	pushl  -0x2c(%ebp)
c0006294:	ff 75 a8             	pushl  -0x58(%ebp)
c0006297:	ff 75 a4             	pushl  -0x5c(%ebp)
c000629a:	e8 c0 07 00 00       	call   c0006a5f <get_virtual_address_start_with_addr>
c000629f:	83 c4 10             	add    $0x10,%esp
c00062a2:	89 45 98             	mov    %eax,-0x68(%ebp)
c00062a5:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c00062a8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00062ab:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00062b2:	eb 41                	jmp    c00062f5 <do_exec+0x241>
c00062b4:	83 ec 08             	sub    $0x8,%esp
c00062b7:	ff 75 d4             	pushl  -0x2c(%ebp)
c00062ba:	ff 75 e8             	pushl  -0x18(%ebp)
c00062bd:	e8 0e 0b 00 00       	call   c0006dd0 <alloc_physical_memory_of_proc>
c00062c2:	83 c4 10             	add    $0x10,%esp
c00062c5:	89 45 94             	mov    %eax,-0x6c(%ebp)
c00062c8:	83 ec 08             	sub    $0x8,%esp
c00062cb:	68 00 10 00 00       	push   $0x1000
c00062d0:	ff 75 94             	pushl  -0x6c(%ebp)
c00062d3:	e8 7c 09 00 00       	call   c0006c54 <alloc_virtual_memory>
c00062d8:	83 c4 10             	add    $0x10,%esp
c00062db:	89 45 90             	mov    %eax,-0x70(%ebp)
c00062de:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c00062e2:	75 06                	jne    c00062ea <do_exec+0x236>
c00062e4:	8b 45 90             	mov    -0x70(%ebp),%eax
c00062e7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00062ea:	81 45 e8 00 10 00 00 	addl   $0x1000,-0x18(%ebp)
c00062f1:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c00062f5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00062f8:	39 45 a8             	cmp    %eax,-0x58(%ebp)
c00062fb:	77 b7                	ja     c00062b4 <do_exec+0x200>
c00062fd:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0006300:	8b 40 10             	mov    0x10(%eax),%eax
c0006303:	89 c1                	mov    %eax,%ecx
c0006305:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0006308:	8b 50 04             	mov    0x4(%eax),%edx
c000630b:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000630e:	01 c2                	add    %eax,%edx
c0006310:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006313:	83 ec 04             	sub    $0x4,%esp
c0006316:	51                   	push   %ecx
c0006317:	52                   	push   %edx
c0006318:	50                   	push   %eax
c0006319:	e8 50 17 00 00       	call   c0007a6e <Memcpy>
c000631e:	83 c4 10             	add    $0x10,%esp
c0006321:	eb 01                	jmp    c0006324 <do_exec+0x270>
c0006323:	90                   	nop
c0006324:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0006328:	8b 45 b8             	mov    -0x48(%ebp),%eax
c000632b:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
c000632f:	0f b7 c0             	movzwl %ax,%eax
c0006332:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0006335:	0f 8c e9 fe ff ff    	jl     c0006224 <do_exec+0x170>
c000633b:	8b 45 08             	mov    0x8(%ebp),%eax
c000633e:	8b 40 10             	mov    0x10(%eax),%eax
c0006341:	89 45 8c             	mov    %eax,-0x74(%ebp)
c0006344:	8b 45 08             	mov    0x8(%ebp),%eax
c0006347:	8b 40 1c             	mov    0x1c(%eax),%eax
c000634a:	89 45 88             	mov    %eax,-0x78(%ebp)
c000634d:	8b 45 08             	mov    0x8(%ebp),%eax
c0006350:	8b 40 24             	mov    0x24(%eax),%eax
c0006353:	89 45 84             	mov    %eax,-0x7c(%ebp)
c0006356:	83 ec 0c             	sub    $0xc,%esp
c0006359:	ff 75 d4             	pushl  -0x2c(%ebp)
c000635c:	e8 bb e2 ff ff       	call   c000461c <pid2proc>
c0006361:	83 c4 10             	add    $0x10,%esp
c0006364:	89 45 80             	mov    %eax,-0x80(%ebp)
c0006367:	8b 45 08             	mov    0x8(%ebp),%eax
c000636a:	8b 40 10             	mov    0x10(%eax),%eax
c000636d:	89 85 7c ff ff ff    	mov    %eax,-0x84(%ebp)
c0006373:	83 ec 08             	sub    $0x8,%esp
c0006376:	ff 75 88             	pushl  -0x78(%ebp)
c0006379:	ff b5 7c ff ff ff    	pushl  -0x84(%ebp)
c000637f:	e8 d0 08 00 00       	call   c0006c54 <alloc_virtual_memory>
c0006384:	83 c4 10             	add    $0x10,%esp
c0006387:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c000638d:	8b 45 08             	mov    0x8(%ebp),%eax
c0006390:	8b 40 2c             	mov    0x2c(%eax),%eax
c0006393:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
c0006399:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c00063a0:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c00063a6:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00063a9:	eb 1a                	jmp    c00063c5 <do_exec+0x311>
c00063ab:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c00063af:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00063b2:	8b 10                	mov    (%eax),%edx
c00063b4:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c00063ba:	01 c2                	add    %eax,%edx
c00063bc:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00063bf:	89 10                	mov    %edx,(%eax)
c00063c1:	83 45 dc 04          	addl   $0x4,-0x24(%ebp)
c00063c5:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00063c8:	8b 00                	mov    (%eax),%eax
c00063ca:	85 c0                	test   %eax,%eax
c00063cc:	75 dd                	jne    c00063ab <do_exec+0x2f7>
c00063ce:	83 ec 0c             	sub    $0xc,%esp
c00063d1:	ff 75 84             	pushl  -0x7c(%ebp)
c00063d4:	e8 7b 08 00 00       	call   c0006c54 <alloc_virtual_memory>
c00063d9:	83 c4 10             	add    $0x10,%esp
c00063dc:	89 85 70 ff ff ff    	mov    %eax,-0x90(%ebp)
c00063e2:	8b 95 78 ff ff ff    	mov    -0x88(%ebp),%edx
c00063e8:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
c00063ee:	83 ec 04             	sub    $0x4,%esp
c00063f1:	ff 75 88             	pushl  -0x78(%ebp)
c00063f4:	52                   	push   %edx
c00063f5:	50                   	push   %eax
c00063f6:	e8 73 16 00 00       	call   c0007a6e <Memcpy>
c00063fb:	83 c4 10             	add    $0x10,%esp
c00063fe:	8b 45 08             	mov    0x8(%ebp),%eax
c0006401:	8b 40 28             	mov    0x28(%eax),%eax
c0006404:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c000640a:	83 ec 08             	sub    $0x8,%esp
c000640d:	ff 75 d4             	pushl  -0x2c(%ebp)
c0006410:	ff 75 80             	pushl  -0x80(%ebp)
c0006413:	e8 0a 09 00 00       	call   c0006d22 <get_physical_address_proc>
c0006418:	83 c4 10             	add    $0x10,%esp
c000641b:	89 85 68 ff ff ff    	mov    %eax,-0x98(%ebp)
c0006421:	83 ec 08             	sub    $0x8,%esp
c0006424:	68 00 10 00 00       	push   $0x1000
c0006429:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
c000642f:	e8 20 08 00 00       	call   c0006c54 <alloc_virtual_memory>
c0006434:	83 c4 10             	add    $0x10,%esp
c0006437:	89 85 64 ff ff ff    	mov    %eax,-0x9c(%ebp)
c000643d:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
c0006443:	05 bc 0f 00 00       	add    $0xfbc,%eax
c0006448:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
c000644e:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c0006454:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c000645a:	89 50 20             	mov    %edx,0x20(%eax)
c000645d:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0006460:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c0006466:	89 50 28             	mov    %edx,0x28(%eax)
c0006469:	8b 45 b8             	mov    -0x48(%ebp),%eax
c000646c:	8b 40 18             	mov    0x18(%eax),%eax
c000646f:	89 c2                	mov    %eax,%edx
c0006471:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c0006477:	89 50 30             	mov    %edx,0x30(%eax)
c000647a:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c0006480:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0006486:	89 50 3c             	mov    %edx,0x3c(%eax)
c0006489:	8b 45 80             	mov    -0x80(%ebp),%eax
c000648c:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c0006493:	00 00 00 
c0006496:	c7 85 44 ff ff ff 65 	movl   $0x65,-0xbc(%ebp)
c000649d:	00 00 00 
c00064a0:	c7 85 24 ff ff ff 00 	movl   $0x0,-0xdc(%ebp)
c00064a7:	00 00 00 
c00064aa:	c7 85 28 ff ff ff 00 	movl   $0x0,-0xd8(%ebp)
c00064b1:	00 00 00 
c00064b4:	83 ec 04             	sub    $0x4,%esp
c00064b7:	ff 75 d4             	pushl  -0x2c(%ebp)
c00064ba:	8d 85 cc fe ff ff    	lea    -0x134(%ebp),%eax
c00064c0:	50                   	push   %eax
c00064c1:	6a 01                	push   $0x1
c00064c3:	e8 9c 39 00 00       	call   c0009e64 <send_rec>
c00064c8:	83 c4 10             	add    $0x10,%esp
c00064cb:	c9                   	leave  
c00064cc:	c3                   	ret    

c00064cd <do_fork>:
c00064cd:	55                   	push   %ebp
c00064ce:	89 e5                	mov    %esp,%ebp
c00064d0:	81 ec 98 00 00 00    	sub    $0x98,%esp
c00064d6:	8b 45 08             	mov    0x8(%ebp),%eax
c00064d9:	8b 00                	mov    (%eax),%eax
c00064db:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00064de:	83 ec 0c             	sub    $0xc,%esp
c00064e1:	ff 75 f4             	pushl  -0xc(%ebp)
c00064e4:	e8 5d 42 00 00       	call   c000a746 <fork_process>
c00064e9:	83 c4 10             	add    $0x10,%esp
c00064ec:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00064ef:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00064f2:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c00064f8:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00064fb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00064fe:	8b 90 24 01 00 00    	mov    0x124(%eax),%edx
c0006504:	8b 45 08             	mov    0x8(%ebp),%eax
c0006507:	89 50 5c             	mov    %edx,0x5c(%eax)
c000650a:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c0006511:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0006518:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c000651f:	83 ec 04             	sub    $0x4,%esp
c0006522:	ff 75 ec             	pushl  -0x14(%ebp)
c0006525:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
c000652b:	50                   	push   %eax
c000652c:	6a 01                	push   $0x1
c000652e:	e8 31 39 00 00       	call   c0009e64 <send_rec>
c0006533:	83 c4 10             	add    $0x10,%esp
c0006536:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006539:	c9                   	leave  
c000653a:	c3                   	ret    

c000653b <do_exit>:
c000653b:	55                   	push   %ebp
c000653c:	89 e5                	mov    %esp,%ebp
c000653e:	83 ec 18             	sub    $0x18,%esp
c0006541:	8b 45 08             	mov    0x8(%ebp),%eax
c0006544:	8b 00                	mov    (%eax),%eax
c0006546:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006549:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000654c:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006552:	05 00 32 08 c0       	add    $0xc0083200,%eax
c0006557:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000655a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000655d:	8b 80 64 02 00 00    	mov    0x264(%eax),%eax
c0006563:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006566:	8b 45 08             	mov    0x8(%ebp),%eax
c0006569:	8b 40 54             	mov    0x54(%eax),%eax
c000656c:	89 c2                	mov    %eax,%edx
c000656e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006571:	89 90 68 02 00 00    	mov    %edx,0x268(%eax)
c0006577:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000657a:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006580:	05 49 34 08 c0       	add    $0xc0083449,%eax
c0006585:	0f b6 00             	movzbl (%eax),%eax
c0006588:	3c 04                	cmp    $0x4,%al
c000658a:	75 21                	jne    c00065ad <do_exit+0x72>
c000658c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000658f:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006595:	05 49 34 08 c0       	add    $0xc0083449,%eax
c000659a:	c6 00 fb             	movb   $0xfb,(%eax)
c000659d:	83 ec 0c             	sub    $0xc,%esp
c00065a0:	ff 75 ec             	pushl  -0x14(%ebp)
c00065a3:	e8 5c 01 00 00       	call   c0006704 <cleanup>
c00065a8:	83 c4 10             	add    $0x10,%esp
c00065ab:	eb 0a                	jmp    c00065b7 <do_exit+0x7c>
c00065ad:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00065b0:	c6 80 48 02 00 00 03 	movb   $0x3,0x248(%eax)
c00065b7:	c7 45 f4 08 00 00 00 	movl   $0x8,-0xc(%ebp)
c00065be:	eb 6e                	jmp    c000662e <do_exit+0xf3>
c00065c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00065c3:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c00065c9:	05 64 34 08 c0       	add    $0xc0083464,%eax
c00065ce:	8b 00                	mov    (%eax),%eax
c00065d0:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c00065d3:	75 55                	jne    c000662a <do_exit+0xef>
c00065d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00065d8:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c00065de:	05 64 34 08 c0       	add    $0xc0083464,%eax
c00065e3:	c7 00 06 00 00 00    	movl   $0x6,(%eax)
c00065e9:	0f b6 05 81 44 08 c0 	movzbl 0xc0084481,%eax
c00065f0:	3c 04                	cmp    $0x4,%al
c00065f2:	75 36                	jne    c000662a <do_exit+0xef>
c00065f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00065f7:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c00065fd:	05 49 34 08 c0       	add    $0xc0083449,%eax
c0006602:	0f b6 00             	movzbl (%eax),%eax
c0006605:	3c 03                	cmp    $0x3,%al
c0006607:	75 21                	jne    c000662a <do_exit+0xef>
c0006609:	c6 05 81 44 08 c0 fb 	movb   $0xfb,0xc0084481
c0006610:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006613:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006619:	05 00 32 08 c0       	add    $0xc0083200,%eax
c000661e:	83 ec 0c             	sub    $0xc,%esp
c0006621:	50                   	push   %eax
c0006622:	e8 dd 00 00 00       	call   c0006704 <cleanup>
c0006627:	83 c4 10             	add    $0x10,%esp
c000662a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000662e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0006632:	7e 8c                	jle    c00065c0 <do_exit+0x85>
c0006634:	90                   	nop
c0006635:	c9                   	leave  
c0006636:	c3                   	ret    

c0006637 <do_wait>:
c0006637:	55                   	push   %ebp
c0006638:	89 e5                	mov    %esp,%ebp
c000663a:	81 ec 98 00 00 00    	sub    $0x98,%esp
c0006640:	8b 45 08             	mov    0x8(%ebp),%eax
c0006643:	8b 00                	mov    (%eax),%eax
c0006645:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006648:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000664f:	c7 45 f0 08 00 00 00 	movl   $0x8,-0x10(%ebp)
c0006656:	eb 5f                	jmp    c00066b7 <do_wait+0x80>
c0006658:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000665b:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006661:	05 64 34 08 c0       	add    $0xc0083464,%eax
c0006666:	8b 00                	mov    (%eax),%eax
c0006668:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c000666b:	75 46                	jne    c00066b3 <do_wait+0x7c>
c000666d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0006671:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006674:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c000667a:	05 49 34 08 c0       	add    $0xc0083449,%eax
c000667f:	0f b6 00             	movzbl (%eax),%eax
c0006682:	3c 03                	cmp    $0x3,%al
c0006684:	75 2d                	jne    c00066b3 <do_wait+0x7c>
c0006686:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006689:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c000668f:	05 49 34 08 c0       	add    $0xc0083449,%eax
c0006694:	c6 00 fb             	movb   $0xfb,(%eax)
c0006697:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000669a:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c00066a0:	05 00 32 08 c0       	add    $0xc0083200,%eax
c00066a5:	83 ec 0c             	sub    $0xc,%esp
c00066a8:	50                   	push   %eax
c00066a9:	e8 56 00 00 00       	call   c0006704 <cleanup>
c00066ae:	83 c4 10             	add    $0x10,%esp
c00066b1:	eb 4f                	jmp    c0006702 <do_wait+0xcb>
c00066b3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00066b7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c00066bb:	7e 9b                	jle    c0006658 <do_wait+0x21>
c00066bd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00066c1:	74 13                	je     c00066d6 <do_wait+0x9f>
c00066c3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00066c6:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c00066cc:	05 49 34 08 c0       	add    $0xc0083449,%eax
c00066d1:	c6 00 04             	movb   $0x4,(%eax)
c00066d4:	eb 2c                	jmp    c0006702 <do_wait+0xcb>
c00066d6:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c00066dd:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c00066e4:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c00066eb:	83 ec 04             	sub    $0x4,%esp
c00066ee:	ff 75 ec             	pushl  -0x14(%ebp)
c00066f1:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
c00066f7:	50                   	push   %eax
c00066f8:	6a 01                	push   $0x1
c00066fa:	e8 65 37 00 00       	call   c0009e64 <send_rec>
c00066ff:	83 c4 10             	add    $0x10,%esp
c0006702:	c9                   	leave  
c0006703:	c3                   	ret    

c0006704 <cleanup>:
c0006704:	55                   	push   %ebp
c0006705:	89 e5                	mov    %esp,%ebp
c0006707:	81 ec 88 00 00 00    	sub    $0x88,%esp
c000670d:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c0006714:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c000671b:	8b 45 08             	mov    0x8(%ebp),%eax
c000671e:	8b 80 64 02 00 00    	mov    0x264(%eax),%eax
c0006724:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006727:	8b 45 08             	mov    0x8(%ebp),%eax
c000672a:	8b 80 68 02 00 00    	mov    0x268(%eax),%eax
c0006730:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0006733:	8b 45 08             	mov    0x8(%ebp),%eax
c0006736:	8b 80 64 02 00 00    	mov    0x264(%eax),%eax
c000673c:	83 ec 04             	sub    $0x4,%esp
c000673f:	50                   	push   %eax
c0006740:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0006746:	50                   	push   %eax
c0006747:	6a 01                	push   $0x1
c0006749:	e8 16 37 00 00       	call   c0009e64 <send_rec>
c000674e:	83 c4 10             	add    $0x10,%esp
c0006751:	8b 45 08             	mov    0x8(%ebp),%eax
c0006754:	c6 80 48 02 00 00 ff 	movb   $0xff,0x248(%eax)
c000675b:	90                   	nop
c000675c:	c9                   	leave  
c000675d:	c3                   	ret    

c000675e <init_bitmap>:
c000675e:	55                   	push   %ebp
c000675f:	89 e5                	mov    %esp,%ebp
c0006761:	83 ec 08             	sub    $0x8,%esp
c0006764:	8b 45 08             	mov    0x8(%ebp),%eax
c0006767:	8b 50 04             	mov    0x4(%eax),%edx
c000676a:	8b 45 08             	mov    0x8(%ebp),%eax
c000676d:	8b 00                	mov    (%eax),%eax
c000676f:	83 ec 04             	sub    $0x4,%esp
c0006772:	52                   	push   %edx
c0006773:	6a 00                	push   $0x0
c0006775:	50                   	push   %eax
c0006776:	e8 a4 54 00 00       	call   c000bc1f <Memset>
c000677b:	83 c4 10             	add    $0x10,%esp
c000677e:	90                   	nop
c000677f:	c9                   	leave  
c0006780:	c3                   	ret    

c0006781 <test_bit_val>:
c0006781:	55                   	push   %ebp
c0006782:	89 e5                	mov    %esp,%ebp
c0006784:	53                   	push   %ebx
c0006785:	83 ec 10             	sub    $0x10,%esp
c0006788:	8b 45 0c             	mov    0xc(%ebp),%eax
c000678b:	8d 50 07             	lea    0x7(%eax),%edx
c000678e:	85 c0                	test   %eax,%eax
c0006790:	0f 48 c2             	cmovs  %edx,%eax
c0006793:	c1 f8 03             	sar    $0x3,%eax
c0006796:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006799:	8b 45 0c             	mov    0xc(%ebp),%eax
c000679c:	99                   	cltd   
c000679d:	c1 ea 1d             	shr    $0x1d,%edx
c00067a0:	01 d0                	add    %edx,%eax
c00067a2:	83 e0 07             	and    $0x7,%eax
c00067a5:	29 d0                	sub    %edx,%eax
c00067a7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00067aa:	8b 45 08             	mov    0x8(%ebp),%eax
c00067ad:	8b 10                	mov    (%eax),%edx
c00067af:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00067b2:	01 d0                	add    %edx,%eax
c00067b4:	0f b6 00             	movzbl (%eax),%eax
c00067b7:	88 45 f3             	mov    %al,-0xd(%ebp)
c00067ba:	0f be 55 f3          	movsbl -0xd(%ebp),%edx
c00067be:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00067c1:	bb 01 00 00 00       	mov    $0x1,%ebx
c00067c6:	89 c1                	mov    %eax,%ecx
c00067c8:	d3 e3                	shl    %cl,%ebx
c00067ca:	89 d8                	mov    %ebx,%eax
c00067cc:	21 c2                	and    %eax,%edx
c00067ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00067d1:	89 c1                	mov    %eax,%ecx
c00067d3:	d3 fa                	sar    %cl,%edx
c00067d5:	89 d0                	mov    %edx,%eax
c00067d7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00067da:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c00067de:	0f 9f c0             	setg   %al
c00067e1:	0f b6 c0             	movzbl %al,%eax
c00067e4:	83 c4 10             	add    $0x10,%esp
c00067e7:	5b                   	pop    %ebx
c00067e8:	5d                   	pop    %ebp
c00067e9:	c3                   	ret    

c00067ea <set_bit_val>:
c00067ea:	55                   	push   %ebp
c00067eb:	89 e5                	mov    %esp,%ebp
c00067ed:	83 ec 10             	sub    $0x10,%esp
c00067f0:	8b 45 0c             	mov    0xc(%ebp),%eax
c00067f3:	8d 50 07             	lea    0x7(%eax),%edx
c00067f6:	85 c0                	test   %eax,%eax
c00067f8:	0f 48 c2             	cmovs  %edx,%eax
c00067fb:	c1 f8 03             	sar    $0x3,%eax
c00067fe:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006801:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006804:	99                   	cltd   
c0006805:	c1 ea 1d             	shr    $0x1d,%edx
c0006808:	01 d0                	add    %edx,%eax
c000680a:	83 e0 07             	and    $0x7,%eax
c000680d:	29 d0                	sub    %edx,%eax
c000680f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006812:	8b 45 08             	mov    0x8(%ebp),%eax
c0006815:	8b 10                	mov    (%eax),%edx
c0006817:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000681a:	01 d0                	add    %edx,%eax
c000681c:	0f b6 00             	movzbl (%eax),%eax
c000681f:	88 45 ff             	mov    %al,-0x1(%ebp)
c0006822:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0006826:	7e 13                	jle    c000683b <set_bit_val+0x51>
c0006828:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000682b:	ba 01 00 00 00       	mov    $0x1,%edx
c0006830:	89 c1                	mov    %eax,%ecx
c0006832:	d3 e2                	shl    %cl,%edx
c0006834:	89 d0                	mov    %edx,%eax
c0006836:	08 45 ff             	or     %al,-0x1(%ebp)
c0006839:	eb 13                	jmp    c000684e <set_bit_val+0x64>
c000683b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000683e:	ba 01 00 00 00       	mov    $0x1,%edx
c0006843:	89 c1                	mov    %eax,%ecx
c0006845:	d3 e2                	shl    %cl,%edx
c0006847:	89 d0                	mov    %edx,%eax
c0006849:	f7 d0                	not    %eax
c000684b:	20 45 ff             	and    %al,-0x1(%ebp)
c000684e:	8b 45 08             	mov    0x8(%ebp),%eax
c0006851:	8b 10                	mov    (%eax),%edx
c0006853:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006856:	01 c2                	add    %eax,%edx
c0006858:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
c000685c:	88 02                	mov    %al,(%edx)
c000685e:	b8 01 00 00 00       	mov    $0x1,%eax
c0006863:	c9                   	leave  
c0006864:	c3                   	ret    

c0006865 <set_bits>:
c0006865:	55                   	push   %ebp
c0006866:	89 e5                	mov    %esp,%ebp
c0006868:	83 ec 10             	sub    $0x10,%esp
c000686b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0006872:	eb 1c                	jmp    c0006890 <set_bits+0x2b>
c0006874:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006877:	8d 50 01             	lea    0x1(%eax),%edx
c000687a:	89 55 0c             	mov    %edx,0xc(%ebp)
c000687d:	ff 75 10             	pushl  0x10(%ebp)
c0006880:	50                   	push   %eax
c0006881:	ff 75 08             	pushl  0x8(%ebp)
c0006884:	e8 61 ff ff ff       	call   c00067ea <set_bit_val>
c0006889:	83 c4 0c             	add    $0xc,%esp
c000688c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0006890:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006893:	3b 45 14             	cmp    0x14(%ebp),%eax
c0006896:	7c dc                	jl     c0006874 <set_bits+0xf>
c0006898:	b8 01 00 00 00       	mov    $0x1,%eax
c000689d:	c9                   	leave  
c000689e:	c3                   	ret    

c000689f <get_first_free_bit>:
c000689f:	55                   	push   %ebp
c00068a0:	89 e5                	mov    %esp,%ebp
c00068a2:	83 ec 10             	sub    $0x10,%esp
c00068a5:	8b 45 08             	mov    0x8(%ebp),%eax
c00068a8:	8b 40 04             	mov    0x4(%eax),%eax
c00068ab:	c1 e0 03             	shl    $0x3,%eax
c00068ae:	89 45 f8             	mov    %eax,-0x8(%ebp)
c00068b1:	8b 45 0c             	mov    0xc(%ebp),%eax
c00068b4:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00068b7:	eb 1b                	jmp    c00068d4 <get_first_free_bit+0x35>
c00068b9:	ff 75 fc             	pushl  -0x4(%ebp)
c00068bc:	ff 75 08             	pushl  0x8(%ebp)
c00068bf:	e8 bd fe ff ff       	call   c0006781 <test_bit_val>
c00068c4:	83 c4 08             	add    $0x8,%esp
c00068c7:	85 c0                	test   %eax,%eax
c00068c9:	75 05                	jne    c00068d0 <get_first_free_bit+0x31>
c00068cb:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00068ce:	eb 11                	jmp    c00068e1 <get_first_free_bit+0x42>
c00068d0:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c00068d4:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00068d7:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c00068da:	7c dd                	jl     c00068b9 <get_first_free_bit+0x1a>
c00068dc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c00068e1:	c9                   	leave  
c00068e2:	c3                   	ret    

c00068e3 <get_bits>:
c00068e3:	55                   	push   %ebp
c00068e4:	89 e5                	mov    %esp,%ebp
c00068e6:	83 ec 20             	sub    $0x20,%esp
c00068e9:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00068f0:	ff 75 f0             	pushl  -0x10(%ebp)
c00068f3:	ff 75 08             	pushl  0x8(%ebp)
c00068f6:	e8 a4 ff ff ff       	call   c000689f <get_first_free_bit>
c00068fb:	83 c4 08             	add    $0x8,%esp
c00068fe:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006901:	8b 45 08             	mov    0x8(%ebp),%eax
c0006904:	8b 40 04             	mov    0x4(%eax),%eax
c0006907:	c1 e0 03             	shl    $0x3,%eax
c000690a:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000690d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006910:	83 e8 01             	sub    $0x1,%eax
c0006913:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006916:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c000691a:	75 08                	jne    c0006924 <get_bits+0x41>
c000691c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000691f:	e9 85 00 00 00       	jmp    c00069a9 <get_bits+0xc6>
c0006924:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006927:	83 c0 01             	add    $0x1,%eax
c000692a:	89 45 f8             	mov    %eax,-0x8(%ebp)
c000692d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006930:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006933:	eb 58                	jmp    c000698d <get_bits+0xaa>
c0006935:	ff 75 f8             	pushl  -0x8(%ebp)
c0006938:	ff 75 08             	pushl  0x8(%ebp)
c000693b:	e8 41 fe ff ff       	call   c0006781 <test_bit_val>
c0006940:	83 c4 08             	add    $0x8,%esp
c0006943:	85 c0                	test   %eax,%eax
c0006945:	75 0a                	jne    c0006951 <get_bits+0x6e>
c0006947:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c000694b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000694f:	eb 2b                	jmp    c000697c <get_bits+0x99>
c0006951:	6a 00                	push   $0x0
c0006953:	ff 75 08             	pushl  0x8(%ebp)
c0006956:	e8 44 ff ff ff       	call   c000689f <get_first_free_bit>
c000695b:	83 c4 08             	add    $0x8,%esp
c000695e:	83 c0 01             	add    $0x1,%eax
c0006961:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006964:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006967:	83 c0 01             	add    $0x1,%eax
c000696a:	89 45 f8             	mov    %eax,-0x8(%ebp)
c000696d:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006970:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006973:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006976:	83 e8 01             	sub    $0x1,%eax
c0006979:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000697c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000697f:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c0006982:	7c 09                	jl     c000698d <get_bits+0xaa>
c0006984:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c000698b:	eb 0d                	jmp    c000699a <get_bits+0xb7>
c000698d:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006990:	8d 50 ff             	lea    -0x1(%eax),%edx
c0006993:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0006996:	85 c0                	test   %eax,%eax
c0006998:	7f 9b                	jg     c0006935 <get_bits+0x52>
c000699a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000699d:	2b 45 0c             	sub    0xc(%ebp),%eax
c00069a0:	83 c0 01             	add    $0x1,%eax
c00069a3:	89 45 f8             	mov    %eax,-0x8(%ebp)
c00069a6:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00069a9:	c9                   	leave  
c00069aa:	c3                   	ret    

c00069ab <get_a_page>:
c00069ab:	55                   	push   %ebp
c00069ac:	89 e5                	mov    %esp,%ebp
c00069ae:	83 ec 28             	sub    $0x28,%esp
c00069b1:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c00069b5:	75 22                	jne    c00069d9 <get_a_page+0x2e>
c00069b7:	a1 ac 16 01 c0       	mov    0xc00116ac,%eax
c00069bc:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00069bf:	a1 b0 16 01 c0       	mov    0xc00116b0,%eax
c00069c4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00069c7:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c00069cc:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00069cf:	a1 b8 16 01 c0       	mov    0xc00116b8,%eax
c00069d4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00069d7:	eb 20                	jmp    c00069f9 <get_a_page+0x4e>
c00069d9:	a1 f4 1e 01 c0       	mov    0xc0011ef4,%eax
c00069de:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00069e1:	a1 f8 1e 01 c0       	mov    0xc0011ef8,%eax
c00069e6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00069e9:	a1 fc 1e 01 c0       	mov    0xc0011efc,%eax
c00069ee:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00069f1:	a1 00 1f 01 c0       	mov    0xc0011f00,%eax
c00069f6:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00069f9:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00069fc:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c00069ff:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006a02:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0006a05:	6a 01                	push   $0x1
c0006a07:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0006a0a:	50                   	push   %eax
c0006a0b:	e8 d3 fe ff ff       	call   c00068e3 <get_bits>
c0006a10:	83 c4 08             	add    $0x8,%esp
c0006a13:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006a16:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c0006a1a:	75 1c                	jne    c0006a38 <get_a_page+0x8d>
c0006a1c:	68 84 00 00 00       	push   $0x84
c0006a21:	68 55 b3 00 c0       	push   $0xc000b355
c0006a26:	68 55 b3 00 c0       	push   $0xc000b355
c0006a2b:	68 5f b3 00 c0       	push   $0xc000b35f
c0006a30:	e8 12 2a 00 00       	call   c0009447 <assertion_failure>
c0006a35:	83 c4 10             	add    $0x10,%esp
c0006a38:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006a3b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0006a3e:	c1 e2 0c             	shl    $0xc,%edx
c0006a41:	01 d0                	add    %edx,%eax
c0006a43:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006a46:	83 ec 04             	sub    $0x4,%esp
c0006a49:	6a 01                	push   $0x1
c0006a4b:	ff 75 f4             	pushl  -0xc(%ebp)
c0006a4e:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0006a51:	50                   	push   %eax
c0006a52:	e8 93 fd ff ff       	call   c00067ea <set_bit_val>
c0006a57:	83 c4 10             	add    $0x10,%esp
c0006a5a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006a5d:	c9                   	leave  
c0006a5e:	c3                   	ret    

c0006a5f <get_virtual_address_start_with_addr>:
c0006a5f:	55                   	push   %ebp
c0006a60:	89 e5                	mov    %esp,%ebp
c0006a62:	83 ec 38             	sub    $0x38,%esp
c0006a65:	e8 2d a9 ff ff       	call   c0001397 <get_running_thread_pcb>
c0006a6a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006a6d:	83 ec 0c             	sub    $0xc,%esp
c0006a70:	ff 75 10             	pushl  0x10(%ebp)
c0006a73:	e8 a4 db ff ff       	call   c000461c <pid2proc>
c0006a78:	83 c4 10             	add    $0x10,%esp
c0006a7b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006a7e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006a81:	8b 40 0c             	mov    0xc(%eax),%eax
c0006a84:	83 ec 04             	sub    $0x4,%esp
c0006a87:	6a 0c                	push   $0xc
c0006a89:	50                   	push   %eax
c0006a8a:	8d 45 dc             	lea    -0x24(%ebp),%eax
c0006a8d:	50                   	push   %eax
c0006a8e:	e8 db 0f 00 00       	call   c0007a6e <Memcpy>
c0006a93:	83 c4 10             	add    $0x10,%esp
c0006a96:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0006a99:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0006a9c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0006a9f:	89 55 d8             	mov    %edx,-0x28(%ebp)
c0006aa2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006aa5:	8b 55 08             	mov    0x8(%ebp),%edx
c0006aa8:	29 c2                	sub    %eax,%edx
c0006aaa:	89 d0                	mov    %edx,%eax
c0006aac:	c1 e8 0c             	shr    $0xc,%eax
c0006aaf:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006ab2:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0006ab6:	79 1c                	jns    c0006ad4 <get_virtual_address_start_with_addr+0x75>
c0006ab8:	68 97 00 00 00       	push   $0x97
c0006abd:	68 55 b3 00 c0       	push   $0xc000b355
c0006ac2:	68 55 b3 00 c0       	push   $0xc000b355
c0006ac7:	68 6b b3 00 c0       	push   $0xc000b36b
c0006acc:	e8 76 29 00 00       	call   c0009447 <assertion_failure>
c0006ad1:	83 c4 10             	add    $0x10,%esp
c0006ad4:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006ad7:	50                   	push   %eax
c0006ad8:	6a 01                	push   $0x1
c0006ada:	ff 75 ec             	pushl  -0x14(%ebp)
c0006add:	8d 45 d4             	lea    -0x2c(%ebp),%eax
c0006ae0:	50                   	push   %eax
c0006ae1:	e8 7f fd ff ff       	call   c0006865 <set_bits>
c0006ae6:	83 c4 10             	add    $0x10,%esp
c0006ae9:	8b 45 08             	mov    0x8(%ebp),%eax
c0006aec:	25 ff 0f 00 00       	and    $0xfff,%eax
c0006af1:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006af4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006af7:	c9                   	leave  
c0006af8:	c3                   	ret    

c0006af9 <get_virtual_address>:
c0006af9:	55                   	push   %ebp
c0006afa:	89 e5                	mov    %esp,%ebp
c0006afc:	83 ec 28             	sub    $0x28,%esp
c0006aff:	e8 93 a8 ff ff       	call   c0001397 <get_running_thread_pcb>
c0006b04:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006b07:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0006b0b:	75 1a                	jne    c0006b27 <get_virtual_address+0x2e>
c0006b0d:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c0006b12:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006b15:	a1 98 07 01 c0       	mov    0xc0010798,%eax
c0006b1a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006b1d:	a1 9c 07 01 c0       	mov    0xc001079c,%eax
c0006b22:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006b25:	eb 18                	jmp    c0006b3f <get_virtual_address+0x46>
c0006b27:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006b2a:	8b 40 0c             	mov    0xc(%eax),%eax
c0006b2d:	83 ec 04             	sub    $0x4,%esp
c0006b30:	6a 0c                	push   $0xc
c0006b32:	50                   	push   %eax
c0006b33:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0006b36:	50                   	push   %eax
c0006b37:	e8 32 0f 00 00       	call   c0007a6e <Memcpy>
c0006b3c:	83 c4 10             	add    $0x10,%esp
c0006b3f:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006b42:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0006b45:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006b48:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0006b4b:	8b 45 08             	mov    0x8(%ebp),%eax
c0006b4e:	83 ec 08             	sub    $0x8,%esp
c0006b51:	50                   	push   %eax
c0006b52:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0006b55:	50                   	push   %eax
c0006b56:	e8 88 fd ff ff       	call   c00068e3 <get_bits>
c0006b5b:	83 c4 10             	add    $0x10,%esp
c0006b5e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006b61:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006b64:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0006b67:	c1 e2 0c             	shl    $0xc,%edx
c0006b6a:	01 d0                	add    %edx,%eax
c0006b6c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006b6f:	8b 45 08             	mov    0x8(%ebp),%eax
c0006b72:	50                   	push   %eax
c0006b73:	6a 01                	push   $0x1
c0006b75:	ff 75 f0             	pushl  -0x10(%ebp)
c0006b78:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0006b7b:	50                   	push   %eax
c0006b7c:	e8 e4 fc ff ff       	call   c0006865 <set_bits>
c0006b81:	83 c4 10             	add    $0x10,%esp
c0006b84:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006b87:	c9                   	leave  
c0006b88:	c3                   	ret    

c0006b89 <ptr_pde>:
c0006b89:	55                   	push   %ebp
c0006b8a:	89 e5                	mov    %esp,%ebp
c0006b8c:	8b 45 08             	mov    0x8(%ebp),%eax
c0006b8f:	c1 e8 16             	shr    $0x16,%eax
c0006b92:	05 00 fc ff 3f       	add    $0x3ffffc00,%eax
c0006b97:	c1 e0 02             	shl    $0x2,%eax
c0006b9a:	5d                   	pop    %ebp
c0006b9b:	c3                   	ret    

c0006b9c <ptr_pte>:
c0006b9c:	55                   	push   %ebp
c0006b9d:	89 e5                	mov    %esp,%ebp
c0006b9f:	8b 45 08             	mov    0x8(%ebp),%eax
c0006ba2:	c1 e8 0a             	shr    $0xa,%eax
c0006ba5:	25 00 f0 3f 00       	and    $0x3ff000,%eax
c0006baa:	89 c2                	mov    %eax,%edx
c0006bac:	8b 45 08             	mov    0x8(%ebp),%eax
c0006baf:	c1 e8 0c             	shr    $0xc,%eax
c0006bb2:	25 ff 03 00 00       	and    $0x3ff,%eax
c0006bb7:	c1 e0 02             	shl    $0x2,%eax
c0006bba:	01 d0                	add    %edx,%eax
c0006bbc:	2d 00 00 40 00       	sub    $0x400000,%eax
c0006bc1:	5d                   	pop    %ebp
c0006bc2:	c3                   	ret    

c0006bc3 <add_map_entry>:
c0006bc3:	55                   	push   %ebp
c0006bc4:	89 e5                	mov    %esp,%ebp
c0006bc6:	83 ec 18             	sub    $0x18,%esp
c0006bc9:	ff 75 08             	pushl  0x8(%ebp)
c0006bcc:	e8 b8 ff ff ff       	call   c0006b89 <ptr_pde>
c0006bd1:	83 c4 04             	add    $0x4,%esp
c0006bd4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006bd7:	ff 75 08             	pushl  0x8(%ebp)
c0006bda:	e8 bd ff ff ff       	call   c0006b9c <ptr_pte>
c0006bdf:	83 c4 04             	add    $0x4,%esp
c0006be2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006be5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006be8:	8b 00                	mov    (%eax),%eax
c0006bea:	83 e0 01             	and    $0x1,%eax
c0006bed:	85 c0                	test   %eax,%eax
c0006bef:	74 1b                	je     c0006c0c <add_map_entry+0x49>
c0006bf1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006bf4:	8b 00                	mov    (%eax),%eax
c0006bf6:	83 e0 01             	and    $0x1,%eax
c0006bf9:	85 c0                	test   %eax,%eax
c0006bfb:	75 54                	jne    c0006c51 <add_map_entry+0x8e>
c0006bfd:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006c00:	83 c8 07             	or     $0x7,%eax
c0006c03:	89 c2                	mov    %eax,%edx
c0006c05:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006c08:	89 10                	mov    %edx,(%eax)
c0006c0a:	eb 45                	jmp    c0006c51 <add_map_entry+0x8e>
c0006c0c:	83 ec 0c             	sub    $0xc,%esp
c0006c0f:	6a 00                	push   $0x0
c0006c11:	e8 95 fd ff ff       	call   c00069ab <get_a_page>
c0006c16:	83 c4 10             	add    $0x10,%esp
c0006c19:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006c1c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006c1f:	83 c8 07             	or     $0x7,%eax
c0006c22:	89 c2                	mov    %eax,%edx
c0006c24:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006c27:	89 10                	mov    %edx,(%eax)
c0006c29:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006c2c:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0006c31:	83 ec 04             	sub    $0x4,%esp
c0006c34:	68 00 10 00 00       	push   $0x1000
c0006c39:	6a 00                	push   $0x0
c0006c3b:	50                   	push   %eax
c0006c3c:	e8 de 4f 00 00       	call   c000bc1f <Memset>
c0006c41:	83 c4 10             	add    $0x10,%esp
c0006c44:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006c47:	83 c8 07             	or     $0x7,%eax
c0006c4a:	89 c2                	mov    %eax,%edx
c0006c4c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006c4f:	89 10                	mov    %edx,(%eax)
c0006c51:	90                   	nop
c0006c52:	c9                   	leave  
c0006c53:	c3                   	ret    

c0006c54 <alloc_virtual_memory>:
c0006c54:	55                   	push   %ebp
c0006c55:	89 e5                	mov    %esp,%ebp
c0006c57:	83 ec 28             	sub    $0x28,%esp
c0006c5a:	8b 45 08             	mov    0x8(%ebp),%eax
c0006c5d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0006c62:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006c65:	8b 45 08             	mov    0x8(%ebp),%eax
c0006c68:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0006c6b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006c6e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006c71:	01 45 e4             	add    %eax,-0x1c(%ebp)
c0006c74:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006c77:	05 ff 0f 00 00       	add    $0xfff,%eax
c0006c7c:	c1 e8 0c             	shr    $0xc,%eax
c0006c7f:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006c82:	e8 10 a7 ff ff       	call   c0001397 <get_running_thread_pcb>
c0006c87:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0006c8a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0006c8d:	8b 40 08             	mov    0x8(%eax),%eax
c0006c90:	85 c0                	test   %eax,%eax
c0006c92:	75 09                	jne    c0006c9d <alloc_virtual_memory+0x49>
c0006c94:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0006c9b:	eb 07                	jmp    c0006ca4 <alloc_virtual_memory+0x50>
c0006c9d:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0006ca4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0006cab:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0006cb2:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0006cb9:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0006cc0:	eb 47                	jmp    c0006d09 <alloc_virtual_memory+0xb5>
c0006cc2:	83 ec 08             	sub    $0x8,%esp
c0006cc5:	ff 75 f0             	pushl  -0x10(%ebp)
c0006cc8:	6a 01                	push   $0x1
c0006cca:	e8 2a fe ff ff       	call   c0006af9 <get_virtual_address>
c0006ccf:	83 c4 10             	add    $0x10,%esp
c0006cd2:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006cd5:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0006cd9:	74 13                	je     c0006cee <alloc_virtual_memory+0x9a>
c0006cdb:	83 ec 0c             	sub    $0xc,%esp
c0006cde:	ff 75 f0             	pushl  -0x10(%ebp)
c0006ce1:	e8 c5 fc ff ff       	call   c00069ab <get_a_page>
c0006ce6:	83 c4 10             	add    $0x10,%esp
c0006ce9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006cec:	eb 06                	jmp    c0006cf4 <alloc_virtual_memory+0xa0>
c0006cee:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006cf1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006cf4:	83 ec 08             	sub    $0x8,%esp
c0006cf7:	ff 75 f4             	pushl  -0xc(%ebp)
c0006cfa:	ff 75 d8             	pushl  -0x28(%ebp)
c0006cfd:	e8 c1 fe ff ff       	call   c0006bc3 <add_map_entry>
c0006d02:	83 c4 10             	add    $0x10,%esp
c0006d05:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0006d09:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006d0c:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c0006d0f:	72 b1                	jb     c0006cc2 <alloc_virtual_memory+0x6e>
c0006d11:	8b 45 08             	mov    0x8(%ebp),%eax
c0006d14:	25 ff 0f 00 00       	and    $0xfff,%eax
c0006d19:	89 c2                	mov    %eax,%edx
c0006d1b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006d1e:	01 d0                	add    %edx,%eax
c0006d20:	c9                   	leave  
c0006d21:	c3                   	ret    

c0006d22 <get_physical_address_proc>:
c0006d22:	55                   	push   %ebp
c0006d23:	89 e5                	mov    %esp,%ebp
c0006d25:	83 ec 18             	sub    $0x18,%esp
c0006d28:	e8 8e a5 ff ff       	call   c00012bb <disable_int>
c0006d2d:	e8 65 a6 ff ff       	call   c0001397 <get_running_thread_pcb>
c0006d32:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006d35:	83 ec 0c             	sub    $0xc,%esp
c0006d38:	ff 75 0c             	pushl  0xc(%ebp)
c0006d3b:	e8 dc d8 ff ff       	call   c000461c <pid2proc>
c0006d40:	83 c4 10             	add    $0x10,%esp
c0006d43:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006d46:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006d49:	8b 40 08             	mov    0x8(%eax),%eax
c0006d4c:	83 ec 0c             	sub    $0xc,%esp
c0006d4f:	50                   	push   %eax
c0006d50:	e8 26 a6 ff ff       	call   c000137b <update_cr3>
c0006d55:	83 c4 10             	add    $0x10,%esp
c0006d58:	83 ec 0c             	sub    $0xc,%esp
c0006d5b:	ff 75 08             	pushl  0x8(%ebp)
c0006d5e:	e8 39 fe ff ff       	call   c0006b9c <ptr_pte>
c0006d63:	83 c4 10             	add    $0x10,%esp
c0006d66:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006d69:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006d6c:	8b 00                	mov    (%eax),%eax
c0006d6e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0006d73:	89 c2                	mov    %eax,%edx
c0006d75:	8b 45 08             	mov    0x8(%ebp),%eax
c0006d78:	25 ff 0f 00 00       	and    $0xfff,%eax
c0006d7d:	09 d0                	or     %edx,%eax
c0006d7f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006d82:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006d85:	8b 40 08             	mov    0x8(%eax),%eax
c0006d88:	83 ec 0c             	sub    $0xc,%esp
c0006d8b:	50                   	push   %eax
c0006d8c:	e8 ea a5 ff ff       	call   c000137b <update_cr3>
c0006d91:	83 c4 10             	add    $0x10,%esp
c0006d94:	e8 24 a5 ff ff       	call   c00012bd <enable_int>
c0006d99:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006d9c:	c9                   	leave  
c0006d9d:	c3                   	ret    

c0006d9e <get_physical_address>:
c0006d9e:	55                   	push   %ebp
c0006d9f:	89 e5                	mov    %esp,%ebp
c0006da1:	83 ec 10             	sub    $0x10,%esp
c0006da4:	ff 75 08             	pushl  0x8(%ebp)
c0006da7:	e8 f0 fd ff ff       	call   c0006b9c <ptr_pte>
c0006dac:	83 c4 04             	add    $0x4,%esp
c0006daf:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006db2:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006db5:	8b 00                	mov    (%eax),%eax
c0006db7:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0006dbc:	89 c2                	mov    %eax,%edx
c0006dbe:	8b 45 08             	mov    0x8(%ebp),%eax
c0006dc1:	25 ff 0f 00 00       	and    $0xfff,%eax
c0006dc6:	09 d0                	or     %edx,%eax
c0006dc8:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006dcb:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006dce:	c9                   	leave  
c0006dcf:	c3                   	ret    

c0006dd0 <alloc_physical_memory_of_proc>:
c0006dd0:	55                   	push   %ebp
c0006dd1:	89 e5                	mov    %esp,%ebp
c0006dd3:	83 ec 48             	sub    $0x48,%esp
c0006dd6:	e8 e0 a4 ff ff       	call   c00012bb <disable_int>
c0006ddb:	8b 45 08             	mov    0x8(%ebp),%eax
c0006dde:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0006de3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006de6:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0006ded:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006df0:	83 ec 0c             	sub    $0xc,%esp
c0006df3:	50                   	push   %eax
c0006df4:	e8 23 d8 ff ff       	call   c000461c <pid2proc>
c0006df9:	83 c4 10             	add    $0x10,%esp
c0006dfc:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006dff:	e8 93 a5 ff ff       	call   c0001397 <get_running_thread_pcb>
c0006e04:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006e07:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006e0a:	8b 40 0c             	mov    0xc(%eax),%eax
c0006e0d:	83 ec 04             	sub    $0x4,%esp
c0006e10:	6a 0c                	push   $0xc
c0006e12:	50                   	push   %eax
c0006e13:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0006e16:	50                   	push   %eax
c0006e17:	e8 52 0c 00 00       	call   c0007a6e <Memcpy>
c0006e1c:	83 c4 10             	add    $0x10,%esp
c0006e1f:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0006e22:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0006e25:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0006e28:	89 55 c8             	mov    %edx,-0x38(%ebp)
c0006e2b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0006e2e:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0006e31:	29 c2                	sub    %eax,%edx
c0006e33:	89 d0                	mov    %edx,%eax
c0006e35:	c1 e8 0c             	shr    $0xc,%eax
c0006e38:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006e3b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0006e3e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0006e41:	c1 e2 0c             	shl    $0xc,%edx
c0006e44:	01 d0                	add    %edx,%eax
c0006e46:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006e49:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006e4c:	6a 01                	push   $0x1
c0006e4e:	6a 01                	push   $0x1
c0006e50:	50                   	push   %eax
c0006e51:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0006e54:	50                   	push   %eax
c0006e55:	e8 0b fa ff ff       	call   c0006865 <set_bits>
c0006e5a:	83 c4 10             	add    $0x10,%esp
c0006e5d:	83 ec 0c             	sub    $0xc,%esp
c0006e60:	ff 75 f0             	pushl  -0x10(%ebp)
c0006e63:	e8 43 fb ff ff       	call   c00069ab <get_a_page>
c0006e68:	83 c4 10             	add    $0x10,%esp
c0006e6b:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0006e6e:	8b 45 08             	mov    0x8(%ebp),%eax
c0006e71:	25 ff 0f 00 00       	and    $0xfff,%eax
c0006e76:	89 c2                	mov    %eax,%edx
c0006e78:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0006e7b:	01 d0                	add    %edx,%eax
c0006e7d:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006e80:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006e83:	8b 40 08             	mov    0x8(%eax),%eax
c0006e86:	83 ec 0c             	sub    $0xc,%esp
c0006e89:	50                   	push   %eax
c0006e8a:	e8 ec a4 ff ff       	call   c000137b <update_cr3>
c0006e8f:	83 c4 10             	add    $0x10,%esp
c0006e92:	83 ec 08             	sub    $0x8,%esp
c0006e95:	ff 75 dc             	pushl  -0x24(%ebp)
c0006e98:	ff 75 f4             	pushl  -0xc(%ebp)
c0006e9b:	e8 23 fd ff ff       	call   c0006bc3 <add_map_entry>
c0006ea0:	83 c4 10             	add    $0x10,%esp
c0006ea3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006ea6:	8b 40 08             	mov    0x8(%eax),%eax
c0006ea9:	83 ec 0c             	sub    $0xc,%esp
c0006eac:	50                   	push   %eax
c0006ead:	e8 c9 a4 ff ff       	call   c000137b <update_cr3>
c0006eb2:	83 c4 10             	add    $0x10,%esp
c0006eb5:	e8 03 a4 ff ff       	call   c00012bd <enable_int>
c0006eba:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006ebd:	c9                   	leave  
c0006ebe:	c3                   	ret    

c0006ebf <alloc_physical_memory>:
c0006ebf:	55                   	push   %ebp
c0006ec0:	89 e5                	mov    %esp,%ebp
c0006ec2:	83 ec 38             	sub    $0x38,%esp
c0006ec5:	8b 45 08             	mov    0x8(%ebp),%eax
c0006ec8:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0006ecd:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006ed0:	e8 c2 a4 ff ff       	call   c0001397 <get_running_thread_pcb>
c0006ed5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006ed8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0006edc:	75 1a                	jne    c0006ef8 <alloc_physical_memory+0x39>
c0006ede:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c0006ee3:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0006ee6:	a1 98 07 01 c0       	mov    0xc0010798,%eax
c0006eeb:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006eee:	a1 9c 07 01 c0       	mov    0xc001079c,%eax
c0006ef3:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0006ef6:	eb 18                	jmp    c0006f10 <alloc_physical_memory+0x51>
c0006ef8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006efb:	8b 40 0c             	mov    0xc(%eax),%eax
c0006efe:	83 ec 04             	sub    $0x4,%esp
c0006f01:	6a 0c                	push   $0xc
c0006f03:	50                   	push   %eax
c0006f04:	8d 45 d4             	lea    -0x2c(%ebp),%eax
c0006f07:	50                   	push   %eax
c0006f08:	e8 61 0b 00 00       	call   c0007a6e <Memcpy>
c0006f0d:	83 c4 10             	add    $0x10,%esp
c0006f10:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0006f13:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0006f16:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0006f19:	89 55 d0             	mov    %edx,-0x30(%ebp)
c0006f1c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0006f1f:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0006f22:	29 c2                	sub    %eax,%edx
c0006f24:	89 d0                	mov    %edx,%eax
c0006f26:	c1 e8 0c             	shr    $0xc,%eax
c0006f29:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006f2c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0006f2f:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0006f32:	c1 e2 0c             	shl    $0xc,%edx
c0006f35:	01 d0                	add    %edx,%eax
c0006f37:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006f3a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006f3d:	6a 01                	push   $0x1
c0006f3f:	6a 01                	push   $0x1
c0006f41:	50                   	push   %eax
c0006f42:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0006f45:	50                   	push   %eax
c0006f46:	e8 1a f9 ff ff       	call   c0006865 <set_bits>
c0006f4b:	83 c4 10             	add    $0x10,%esp
c0006f4e:	83 ec 0c             	sub    $0xc,%esp
c0006f51:	ff 75 0c             	pushl  0xc(%ebp)
c0006f54:	e8 52 fa ff ff       	call   c00069ab <get_a_page>
c0006f59:	83 c4 10             	add    $0x10,%esp
c0006f5c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006f5f:	8b 45 08             	mov    0x8(%ebp),%eax
c0006f62:	25 ff 0f 00 00       	and    $0xfff,%eax
c0006f67:	89 c2                	mov    %eax,%edx
c0006f69:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006f6c:	01 d0                	add    %edx,%eax
c0006f6e:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006f71:	83 ec 08             	sub    $0x8,%esp
c0006f74:	ff 75 e4             	pushl  -0x1c(%ebp)
c0006f77:	ff 75 f4             	pushl  -0xc(%ebp)
c0006f7a:	e8 44 fc ff ff       	call   c0006bc3 <add_map_entry>
c0006f7f:	83 c4 10             	add    $0x10,%esp
c0006f82:	8b 45 08             	mov    0x8(%ebp),%eax
c0006f85:	c9                   	leave  
c0006f86:	c3                   	ret    

c0006f87 <alloc_memory>:
c0006f87:	55                   	push   %ebp
c0006f88:	89 e5                	mov    %esp,%ebp
c0006f8a:	83 ec 18             	sub    $0x18,%esp
c0006f8d:	83 ec 08             	sub    $0x8,%esp
c0006f90:	ff 75 0c             	pushl  0xc(%ebp)
c0006f93:	ff 75 08             	pushl  0x8(%ebp)
c0006f96:	e8 5e fb ff ff       	call   c0006af9 <get_virtual_address>
c0006f9b:	83 c4 10             	add    $0x10,%esp
c0006f9e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006fa1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006fa4:	2d 00 10 00 00       	sub    $0x1000,%eax
c0006fa9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006fac:	eb 29                	jmp    c0006fd7 <alloc_memory+0x50>
c0006fae:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c0006fb5:	83 ec 0c             	sub    $0xc,%esp
c0006fb8:	ff 75 0c             	pushl  0xc(%ebp)
c0006fbb:	e8 eb f9 ff ff       	call   c00069ab <get_a_page>
c0006fc0:	83 c4 10             	add    $0x10,%esp
c0006fc3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006fc6:	83 ec 08             	sub    $0x8,%esp
c0006fc9:	ff 75 ec             	pushl  -0x14(%ebp)
c0006fcc:	ff 75 f4             	pushl  -0xc(%ebp)
c0006fcf:	e8 ef fb ff ff       	call   c0006bc3 <add_map_entry>
c0006fd4:	83 c4 10             	add    $0x10,%esp
c0006fd7:	8b 45 08             	mov    0x8(%ebp),%eax
c0006fda:	8d 50 ff             	lea    -0x1(%eax),%edx
c0006fdd:	89 55 08             	mov    %edx,0x8(%ebp)
c0006fe0:	85 c0                	test   %eax,%eax
c0006fe2:	75 ca                	jne    c0006fae <alloc_memory+0x27>
c0006fe4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006fe7:	c9                   	leave  
c0006fe8:	c3                   	ret    

c0006fe9 <get_a_virtual_page>:
c0006fe9:	55                   	push   %ebp
c0006fea:	89 e5                	mov    %esp,%ebp
c0006fec:	83 ec 18             	sub    $0x18,%esp
c0006fef:	83 ec 0c             	sub    $0xc,%esp
c0006ff2:	ff 75 08             	pushl  0x8(%ebp)
c0006ff5:	e8 b1 f9 ff ff       	call   c00069ab <get_a_page>
c0006ffa:	83 c4 10             	add    $0x10,%esp
c0006ffd:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007000:	8b 45 0c             	mov    0xc(%ebp),%eax
c0007003:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0007008:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000700b:	83 ec 08             	sub    $0x8,%esp
c000700e:	ff 75 f4             	pushl  -0xc(%ebp)
c0007011:	ff 75 f0             	pushl  -0x10(%ebp)
c0007014:	e8 aa fb ff ff       	call   c0006bc3 <add_map_entry>
c0007019:	83 c4 10             	add    $0x10,%esp
c000701c:	8b 45 0c             	mov    0xc(%ebp),%eax
c000701f:	c9                   	leave  
c0007020:	c3                   	ret    

c0007021 <block2arena>:
c0007021:	55                   	push   %ebp
c0007022:	89 e5                	mov    %esp,%ebp
c0007024:	83 ec 10             	sub    $0x10,%esp
c0007027:	8b 45 08             	mov    0x8(%ebp),%eax
c000702a:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c000702f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0007032:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007035:	c9                   	leave  
c0007036:	c3                   	ret    

c0007037 <sys_malloc2>:
c0007037:	55                   	push   %ebp
c0007038:	89 e5                	mov    %esp,%ebp
c000703a:	83 ec 68             	sub    $0x68,%esp
c000703d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007044:	e8 4e a3 ff ff       	call   c0001397 <get_running_thread_pcb>
c0007049:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000704c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000704f:	8b 40 08             	mov    0x8(%eax),%eax
c0007052:	85 c0                	test   %eax,%eax
c0007054:	75 10                	jne    c0007066 <sys_malloc2+0x2f>
c0007056:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000705d:	c7 45 ec a0 47 08 c0 	movl   $0xc00847a0,-0x14(%ebp)
c0007064:	eb 10                	jmp    c0007076 <sys_malloc2+0x3f>
c0007066:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c000706d:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0007070:	83 c0 10             	add    $0x10,%eax
c0007073:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007076:	81 7d 08 00 04 00 00 	cmpl   $0x400,0x8(%ebp)
c000707d:	76 52                	jbe    c00070d1 <sys_malloc2+0x9a>
c000707f:	8b 45 08             	mov    0x8(%ebp),%eax
c0007082:	05 0b 10 00 00       	add    $0x100b,%eax
c0007087:	c1 e8 0c             	shr    $0xc,%eax
c000708a:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000708d:	83 ec 08             	sub    $0x8,%esp
c0007090:	ff 75 f0             	pushl  -0x10(%ebp)
c0007093:	ff 75 d8             	pushl  -0x28(%ebp)
c0007096:	e8 ec fe ff ff       	call   c0006f87 <alloc_memory>
c000709b:	83 c4 10             	add    $0x10,%esp
c000709e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00070a1:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00070a4:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00070a7:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00070aa:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c00070b0:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00070b3:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c00070ba:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00070bd:	c6 40 08 01          	movb   $0x1,0x8(%eax)
c00070c1:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00070c4:	05 90 00 00 00       	add    $0x90,%eax
c00070c9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00070cc:	e9 f0 01 00 00       	jmp    c00072c1 <sys_malloc2+0x28a>
c00070d1:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00070d8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00070df:	eb 26                	jmp    c0007107 <sys_malloc2+0xd0>
c00070e1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c00070e4:	89 d0                	mov    %edx,%eax
c00070e6:	01 c0                	add    %eax,%eax
c00070e8:	01 d0                	add    %edx,%eax
c00070ea:	c1 e0 03             	shl    $0x3,%eax
c00070ed:	89 c2                	mov    %eax,%edx
c00070ef:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00070f2:	01 d0                	add    %edx,%eax
c00070f4:	8b 00                	mov    (%eax),%eax
c00070f6:	39 45 08             	cmp    %eax,0x8(%ebp)
c00070f9:	77 08                	ja     c0007103 <sys_malloc2+0xcc>
c00070fb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00070fe:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007101:	eb 0a                	jmp    c000710d <sys_malloc2+0xd6>
c0007103:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0007107:	83 7d e4 09          	cmpl   $0x9,-0x1c(%ebp)
c000710b:	7e d4                	jle    c00070e1 <sys_malloc2+0xaa>
c000710d:	83 ec 08             	sub    $0x8,%esp
c0007110:	ff 75 f0             	pushl  -0x10(%ebp)
c0007113:	6a 01                	push   $0x1
c0007115:	e8 6d fe ff ff       	call   c0006f87 <alloc_memory>
c000711a:	83 c4 10             	add    $0x10,%esp
c000711d:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0007120:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0007123:	89 d0                	mov    %edx,%eax
c0007125:	01 c0                	add    %eax,%eax
c0007127:	01 d0                	add    %edx,%eax
c0007129:	c1 e0 03             	shl    $0x3,%eax
c000712c:	89 c2                	mov    %eax,%edx
c000712e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007131:	01 d0                	add    %edx,%eax
c0007133:	83 ec 04             	sub    $0x4,%esp
c0007136:	6a 18                	push   $0x18
c0007138:	50                   	push   %eax
c0007139:	ff 75 cc             	pushl  -0x34(%ebp)
c000713c:	e8 2d 09 00 00       	call   c0007a6e <Memcpy>
c0007141:	83 c4 10             	add    $0x10,%esp
c0007144:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c000714b:	e8 ba 08 00 00       	call   c0007a0a <intr_disable>
c0007150:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0007153:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0007156:	89 d0                	mov    %edx,%eax
c0007158:	01 c0                	add    %eax,%eax
c000715a:	01 d0                	add    %edx,%eax
c000715c:	c1 e0 03             	shl    $0x3,%eax
c000715f:	89 c2                	mov    %eax,%edx
c0007161:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007164:	01 d0                	add    %edx,%eax
c0007166:	83 c0 08             	add    $0x8,%eax
c0007169:	83 ec 0c             	sub    $0xc,%esp
c000716c:	50                   	push   %eax
c000716d:	e8 51 38 00 00       	call   c000a9c3 <isListEmpty>
c0007172:	83 c4 10             	add    $0x10,%esp
c0007175:	3c 01                	cmp    $0x1,%al
c0007177:	0f 85 c1 00 00 00    	jne    c000723e <sys_malloc2+0x207>
c000717d:	c7 45 c8 01 00 00 00 	movl   $0x1,-0x38(%ebp)
c0007184:	83 ec 08             	sub    $0x8,%esp
c0007187:	ff 75 f0             	pushl  -0x10(%ebp)
c000718a:	6a 01                	push   $0x1
c000718c:	e8 f6 fd ff ff       	call   c0006f87 <alloc_memory>
c0007191:	83 c4 10             	add    $0x10,%esp
c0007194:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0007197:	8b 45 c0             	mov    -0x40(%ebp),%eax
c000719a:	83 ec 0c             	sub    $0xc,%esp
c000719d:	50                   	push   %eax
c000719e:	e8 7e fe ff ff       	call   c0007021 <block2arena>
c00071a3:	83 c4 10             	add    $0x10,%esp
c00071a6:	89 45 bc             	mov    %eax,-0x44(%ebp)
c00071a9:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00071ac:	89 d0                	mov    %edx,%eax
c00071ae:	01 c0                	add    %eax,%eax
c00071b0:	01 d0                	add    %edx,%eax
c00071b2:	c1 e0 03             	shl    $0x3,%eax
c00071b5:	89 c2                	mov    %eax,%edx
c00071b7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00071ba:	01 d0                	add    %edx,%eax
c00071bc:	8b 50 04             	mov    0x4(%eax),%edx
c00071bf:	8b 45 bc             	mov    -0x44(%ebp),%eax
c00071c2:	89 50 04             	mov    %edx,0x4(%eax)
c00071c5:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00071c8:	8b 00                	mov    (%eax),%eax
c00071ca:	89 45 b8             	mov    %eax,-0x48(%ebp)
c00071cd:	c7 45 b4 0c 00 00 00 	movl   $0xc,-0x4c(%ebp)
c00071d4:	b8 00 10 00 00       	mov    $0x1000,%eax
c00071d9:	2b 45 b4             	sub    -0x4c(%ebp),%eax
c00071dc:	ba 00 00 00 00       	mov    $0x0,%edx
c00071e1:	f7 75 b8             	divl   -0x48(%ebp)
c00071e4:	89 45 b0             	mov    %eax,-0x50(%ebp)
c00071e7:	8b 55 c0             	mov    -0x40(%ebp),%edx
c00071ea:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c00071ed:	01 d0                	add    %edx,%eax
c00071ef:	89 45 ac             	mov    %eax,-0x54(%ebp)
c00071f2:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c00071f9:	eb 3b                	jmp    c0007236 <sys_malloc2+0x1ff>
c00071fb:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00071fe:	0f af 45 b8          	imul   -0x48(%ebp),%eax
c0007202:	89 c2                	mov    %eax,%edx
c0007204:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0007207:	01 d0                	add    %edx,%eax
c0007209:	89 45 a8             	mov    %eax,-0x58(%ebp)
c000720c:	8b 4d a8             	mov    -0x58(%ebp),%ecx
c000720f:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0007212:	89 d0                	mov    %edx,%eax
c0007214:	01 c0                	add    %eax,%eax
c0007216:	01 d0                	add    %edx,%eax
c0007218:	c1 e0 03             	shl    $0x3,%eax
c000721b:	89 c2                	mov    %eax,%edx
c000721d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007220:	01 d0                	add    %edx,%eax
c0007222:	83 c0 08             	add    $0x8,%eax
c0007225:	83 ec 08             	sub    $0x8,%esp
c0007228:	51                   	push   %ecx
c0007229:	50                   	push   %eax
c000722a:	e8 91 38 00 00       	call   c000aac0 <appendToDoubleLinkList>
c000722f:	83 c4 10             	add    $0x10,%esp
c0007232:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0007236:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0007239:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c000723c:	77 bd                	ja     c00071fb <sys_malloc2+0x1c4>
c000723e:	83 ec 0c             	sub    $0xc,%esp
c0007241:	ff 75 c4             	pushl  -0x3c(%ebp)
c0007244:	e8 ea 07 00 00       	call   c0007a33 <intr_set_status>
c0007249:	83 c4 10             	add    $0x10,%esp
c000724c:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000724f:	89 d0                	mov    %edx,%eax
c0007251:	01 c0                	add    %eax,%eax
c0007253:	01 d0                	add    %edx,%eax
c0007255:	c1 e0 03             	shl    $0x3,%eax
c0007258:	89 c2                	mov    %eax,%edx
c000725a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000725d:	01 d0                	add    %edx,%eax
c000725f:	83 c0 08             	add    $0x8,%eax
c0007262:	83 ec 0c             	sub    $0xc,%esp
c0007265:	50                   	push   %eax
c0007266:	e8 bf 39 00 00       	call   c000ac2a <popFromDoubleLinkList>
c000726b:	83 c4 10             	add    $0x10,%esp
c000726e:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0007271:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0007274:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007277:	83 7d a8 00          	cmpl   $0x0,-0x58(%ebp)
c000727b:	75 1c                	jne    c0007299 <sys_malloc2+0x262>
c000727d:	68 ef 01 00 00       	push   $0x1ef
c0007282:	68 55 b3 00 c0       	push   $0xc000b355
c0007287:	68 55 b3 00 c0       	push   $0xc000b355
c000728c:	68 76 b3 00 c0       	push   $0xc000b376
c0007291:	e8 b1 21 00 00       	call   c0009447 <assertion_failure>
c0007296:	83 c4 10             	add    $0x10,%esp
c0007299:	8b 45 a8             	mov    -0x58(%ebp),%eax
c000729c:	83 ec 0c             	sub    $0xc,%esp
c000729f:	50                   	push   %eax
c00072a0:	e8 7c fd ff ff       	call   c0007021 <block2arena>
c00072a5:	83 c4 10             	add    $0x10,%esp
c00072a8:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c00072ab:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c00072ae:	8b 40 04             	mov    0x4(%eax),%eax
c00072b1:	8d 50 ff             	lea    -0x1(%eax),%edx
c00072b4:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c00072b7:	89 50 04             	mov    %edx,0x4(%eax)
c00072ba:	c7 45 c4 04 00 00 00 	movl   $0x4,-0x3c(%ebp)
c00072c1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00072c5:	75 1c                	jne    c00072e3 <sys_malloc2+0x2ac>
c00072c7:	68 f6 01 00 00       	push   $0x1f6
c00072cc:	68 55 b3 00 c0       	push   $0xc000b355
c00072d1:	68 55 b3 00 c0       	push   $0xc000b355
c00072d6:	68 88 b3 00 c0       	push   $0xc000b388
c00072db:	e8 67 21 00 00       	call   c0009447 <assertion_failure>
c00072e0:	83 c4 10             	add    $0x10,%esp
c00072e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00072e6:	c9                   	leave  
c00072e7:	c3                   	ret    

c00072e8 <remove_map_entry>:
c00072e8:	55                   	push   %ebp
c00072e9:	89 e5                	mov    %esp,%ebp
c00072eb:	83 ec 10             	sub    $0x10,%esp
c00072ee:	ff 75 08             	pushl  0x8(%ebp)
c00072f1:	e8 a6 f8 ff ff       	call   c0006b9c <ptr_pte>
c00072f6:	83 c4 04             	add    $0x4,%esp
c00072f9:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00072fc:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00072ff:	8b 10                	mov    (%eax),%edx
c0007301:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007304:	89 10                	mov    %edx,(%eax)
c0007306:	90                   	nop
c0007307:	c9                   	leave  
c0007308:	c3                   	ret    

c0007309 <free_a_page>:
c0007309:	55                   	push   %ebp
c000730a:	89 e5                	mov    %esp,%ebp
c000730c:	83 ec 20             	sub    $0x20,%esp
c000730f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0007313:	75 21                	jne    c0007336 <free_a_page+0x2d>
c0007315:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c000731a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000731d:	a1 98 07 01 c0       	mov    0xc0010798,%eax
c0007322:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007325:	a1 9c 07 01 c0       	mov    0xc001079c,%eax
c000732a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000732d:	c7 45 fc ac 16 01 c0 	movl   $0xc00116ac,-0x4(%ebp)
c0007334:	eb 1f                	jmp    c0007355 <free_a_page+0x4c>
c0007336:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c000733b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000733e:	a1 98 07 01 c0       	mov    0xc0010798,%eax
c0007343:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007346:	a1 9c 07 01 c0       	mov    0xc001079c,%eax
c000734b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000734e:	c7 45 fc f4 1e 01 c0 	movl   $0xc0011ef4,-0x4(%ebp)
c0007355:	8b 45 08             	mov    0x8(%ebp),%eax
c0007358:	c1 e8 0c             	shr    $0xc,%eax
c000735b:	89 45 f8             	mov    %eax,-0x8(%ebp)
c000735e:	6a 00                	push   $0x0
c0007360:	ff 75 f8             	pushl  -0x8(%ebp)
c0007363:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c0007366:	50                   	push   %eax
c0007367:	e8 7e f4 ff ff       	call   c00067ea <set_bit_val>
c000736c:	83 c4 0c             	add    $0xc,%esp
c000736f:	ff 75 08             	pushl  0x8(%ebp)
c0007372:	e8 27 fa ff ff       	call   c0006d9e <get_physical_address>
c0007377:	83 c4 04             	add    $0x4,%esp
c000737a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000737d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007380:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007386:	85 c0                	test   %eax,%eax
c0007388:	0f 48 c2             	cmovs  %edx,%eax
c000738b:	c1 f8 0c             	sar    $0xc,%eax
c000738e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0007391:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007394:	6a 00                	push   $0x0
c0007396:	ff 75 f0             	pushl  -0x10(%ebp)
c0007399:	50                   	push   %eax
c000739a:	e8 4b f4 ff ff       	call   c00067ea <set_bit_val>
c000739f:	83 c4 0c             	add    $0xc,%esp
c00073a2:	ff 75 08             	pushl  0x8(%ebp)
c00073a5:	e8 3e ff ff ff       	call   c00072e8 <remove_map_entry>
c00073aa:	83 c4 04             	add    $0x4,%esp
c00073ad:	90                   	nop
c00073ae:	c9                   	leave  
c00073af:	c3                   	ret    

c00073b0 <sys_free2>:
c00073b0:	55                   	push   %ebp
c00073b1:	89 e5                	mov    %esp,%ebp
c00073b3:	83 ec 58             	sub    $0x58,%esp
c00073b6:	e8 dc 9f ff ff       	call   c0001397 <get_running_thread_pcb>
c00073bb:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00073be:	e8 47 06 00 00       	call   c0007a0a <intr_disable>
c00073c3:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00073c6:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00073c9:	8b 40 08             	mov    0x8(%eax),%eax
c00073cc:	85 c0                	test   %eax,%eax
c00073ce:	75 10                	jne    c00073e0 <sys_free2+0x30>
c00073d0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00073d7:	c7 45 f0 a0 47 08 c0 	movl   $0xc00847a0,-0x10(%ebp)
c00073de:	eb 10                	jmp    c00073f0 <sys_free2+0x40>
c00073e0:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c00073e7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00073ea:	83 c0 10             	add    $0x10,%eax
c00073ed:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00073f0:	81 7d 0c 00 04 00 00 	cmpl   $0x400,0xc(%ebp)
c00073f7:	76 4d                	jbe    c0007446 <sys_free2+0x96>
c00073f9:	8b 45 08             	mov    0x8(%ebp),%eax
c00073fc:	83 e8 0c             	sub    $0xc,%eax
c00073ff:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007402:	83 45 0c 0c          	addl   $0xc,0xc(%ebp)
c0007406:	8b 45 0c             	mov    0xc(%ebp),%eax
c0007409:	05 ff 0f 00 00       	add    $0xfff,%eax
c000740e:	c1 e8 0c             	shr    $0xc,%eax
c0007411:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0007414:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000741b:	eb 1c                	jmp    c0007439 <sys_free2+0x89>
c000741d:	83 ec 08             	sub    $0x8,%esp
c0007420:	ff 75 f4             	pushl  -0xc(%ebp)
c0007423:	ff 75 ec             	pushl  -0x14(%ebp)
c0007426:	e8 de fe ff ff       	call   c0007309 <free_a_page>
c000742b:	83 c4 10             	add    $0x10,%esp
c000742e:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
c0007435:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0007439:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000743c:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
c000743f:	77 dc                	ja     c000741d <sys_free2+0x6d>
c0007441:	e9 dc 00 00 00       	jmp    c0007522 <sys_free2+0x172>
c0007446:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c000744d:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0007454:	eb 26                	jmp    c000747c <sys_free2+0xcc>
c0007456:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0007459:	89 d0                	mov    %edx,%eax
c000745b:	01 c0                	add    %eax,%eax
c000745d:	01 d0                	add    %edx,%eax
c000745f:	c1 e0 03             	shl    $0x3,%eax
c0007462:	89 c2                	mov    %eax,%edx
c0007464:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007467:	01 d0                	add    %edx,%eax
c0007469:	8b 00                	mov    (%eax),%eax
c000746b:	39 45 0c             	cmp    %eax,0xc(%ebp)
c000746e:	77 08                	ja     c0007478 <sys_free2+0xc8>
c0007470:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0007473:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007476:	eb 0a                	jmp    c0007482 <sys_free2+0xd2>
c0007478:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c000747c:	83 7d e0 09          	cmpl   $0x9,-0x20(%ebp)
c0007480:	7e d4                	jle    c0007456 <sys_free2+0xa6>
c0007482:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0007485:	89 d0                	mov    %edx,%eax
c0007487:	01 c0                	add    %eax,%eax
c0007489:	01 d0                	add    %edx,%eax
c000748b:	c1 e0 03             	shl    $0x3,%eax
c000748e:	89 c2                	mov    %eax,%edx
c0007490:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007493:	01 d0                	add    %edx,%eax
c0007495:	8b 10                	mov    (%eax),%edx
c0007497:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c000749a:	8b 50 04             	mov    0x4(%eax),%edx
c000749d:	89 55 b8             	mov    %edx,-0x48(%ebp)
c00074a0:	8b 50 08             	mov    0x8(%eax),%edx
c00074a3:	89 55 bc             	mov    %edx,-0x44(%ebp)
c00074a6:	8b 50 0c             	mov    0xc(%eax),%edx
c00074a9:	89 55 c0             	mov    %edx,-0x40(%ebp)
c00074ac:	8b 50 10             	mov    0x10(%eax),%edx
c00074af:	89 55 c4             	mov    %edx,-0x3c(%ebp)
c00074b2:	8b 40 14             	mov    0x14(%eax),%eax
c00074b5:	89 45 c8             	mov    %eax,-0x38(%ebp)
c00074b8:	8b 45 08             	mov    0x8(%ebp),%eax
c00074bb:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00074be:	83 ec 0c             	sub    $0xc,%esp
c00074c1:	ff 75 d0             	pushl  -0x30(%ebp)
c00074c4:	e8 58 fb ff ff       	call   c0007021 <block2arena>
c00074c9:	83 c4 10             	add    $0x10,%esp
c00074cc:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00074cf:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c00074d2:	89 d0                	mov    %edx,%eax
c00074d4:	01 c0                	add    %eax,%eax
c00074d6:	01 d0                	add    %edx,%eax
c00074d8:	c1 e0 03             	shl    $0x3,%eax
c00074db:	89 c2                	mov    %eax,%edx
c00074dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00074e0:	01 d0                	add    %edx,%eax
c00074e2:	83 c0 08             	add    $0x8,%eax
c00074e5:	83 ec 08             	sub    $0x8,%esp
c00074e8:	ff 75 d0             	pushl  -0x30(%ebp)
c00074eb:	50                   	push   %eax
c00074ec:	e8 cf 35 00 00       	call   c000aac0 <appendToDoubleLinkList>
c00074f1:	83 c4 10             	add    $0x10,%esp
c00074f4:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00074f7:	8b 40 04             	mov    0x4(%eax),%eax
c00074fa:	8d 50 01             	lea    0x1(%eax),%edx
c00074fd:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0007500:	89 50 04             	mov    %edx,0x4(%eax)
c0007503:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0007506:	8b 50 04             	mov    0x4(%eax),%edx
c0007509:	8b 45 b8             	mov    -0x48(%ebp),%eax
c000750c:	39 c2                	cmp    %eax,%edx
c000750e:	75 12                	jne    c0007522 <sys_free2+0x172>
c0007510:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0007513:	83 ec 08             	sub    $0x8,%esp
c0007516:	ff 75 f4             	pushl  -0xc(%ebp)
c0007519:	50                   	push   %eax
c000751a:	e8 ea fd ff ff       	call   c0007309 <free_a_page>
c000751f:	83 c4 10             	add    $0x10,%esp
c0007522:	83 ec 0c             	sub    $0xc,%esp
c0007525:	ff 75 d8             	pushl  -0x28(%ebp)
c0007528:	e8 06 05 00 00       	call   c0007a33 <intr_set_status>
c000752d:	83 c4 10             	add    $0x10,%esp
c0007530:	90                   	nop
c0007531:	c9                   	leave  
c0007532:	c3                   	ret    

c0007533 <init_memory_block_desc>:
c0007533:	55                   	push   %ebp
c0007534:	89 e5                	mov    %esp,%ebp
c0007536:	83 ec 18             	sub    $0x18,%esp
c0007539:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007540:	e9 b2 00 00 00       	jmp    c00075f7 <init_memory_block_desc+0xc4>
c0007545:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0007549:	75 1b                	jne    c0007566 <init_memory_block_desc+0x33>
c000754b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000754e:	89 d0                	mov    %edx,%eax
c0007550:	01 c0                	add    %eax,%eax
c0007552:	01 d0                	add    %edx,%eax
c0007554:	c1 e0 03             	shl    $0x3,%eax
c0007557:	89 c2                	mov    %eax,%edx
c0007559:	8b 45 08             	mov    0x8(%ebp),%eax
c000755c:	01 d0                	add    %edx,%eax
c000755e:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0007564:	eb 2e                	jmp    c0007594 <init_memory_block_desc+0x61>
c0007566:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007569:	89 d0                	mov    %edx,%eax
c000756b:	01 c0                	add    %eax,%eax
c000756d:	01 d0                	add    %edx,%eax
c000756f:	c1 e0 03             	shl    $0x3,%eax
c0007572:	8d 50 e8             	lea    -0x18(%eax),%edx
c0007575:	8b 45 08             	mov    0x8(%ebp),%eax
c0007578:	01 d0                	add    %edx,%eax
c000757a:	8b 08                	mov    (%eax),%ecx
c000757c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000757f:	89 d0                	mov    %edx,%eax
c0007581:	01 c0                	add    %eax,%eax
c0007583:	01 d0                	add    %edx,%eax
c0007585:	c1 e0 03             	shl    $0x3,%eax
c0007588:	89 c2                	mov    %eax,%edx
c000758a:	8b 45 08             	mov    0x8(%ebp),%eax
c000758d:	01 d0                	add    %edx,%eax
c000758f:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
c0007592:	89 10                	mov    %edx,(%eax)
c0007594:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007597:	89 d0                	mov    %edx,%eax
c0007599:	01 c0                	add    %eax,%eax
c000759b:	01 d0                	add    %edx,%eax
c000759d:	c1 e0 03             	shl    $0x3,%eax
c00075a0:	89 c2                	mov    %eax,%edx
c00075a2:	8b 45 08             	mov    0x8(%ebp),%eax
c00075a5:	01 d0                	add    %edx,%eax
c00075a7:	8b 00                	mov    (%eax),%eax
c00075a9:	89 c1                	mov    %eax,%ecx
c00075ab:	b8 f4 0f 00 00       	mov    $0xff4,%eax
c00075b0:	ba 00 00 00 00       	mov    $0x0,%edx
c00075b5:	f7 f1                	div    %ecx
c00075b7:	89 c1                	mov    %eax,%ecx
c00075b9:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00075bc:	89 d0                	mov    %edx,%eax
c00075be:	01 c0                	add    %eax,%eax
c00075c0:	01 d0                	add    %edx,%eax
c00075c2:	c1 e0 03             	shl    $0x3,%eax
c00075c5:	89 c2                	mov    %eax,%edx
c00075c7:	8b 45 08             	mov    0x8(%ebp),%eax
c00075ca:	01 d0                	add    %edx,%eax
c00075cc:	89 ca                	mov    %ecx,%edx
c00075ce:	89 50 04             	mov    %edx,0x4(%eax)
c00075d1:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00075d4:	89 d0                	mov    %edx,%eax
c00075d6:	01 c0                	add    %eax,%eax
c00075d8:	01 d0                	add    %edx,%eax
c00075da:	c1 e0 03             	shl    $0x3,%eax
c00075dd:	89 c2                	mov    %eax,%edx
c00075df:	8b 45 08             	mov    0x8(%ebp),%eax
c00075e2:	01 d0                	add    %edx,%eax
c00075e4:	83 c0 08             	add    $0x8,%eax
c00075e7:	83 ec 0c             	sub    $0xc,%esp
c00075ea:	50                   	push   %eax
c00075eb:	e8 a5 33 00 00       	call   c000a995 <initDoubleLinkList>
c00075f0:	83 c4 10             	add    $0x10,%esp
c00075f3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00075f7:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c00075fb:	0f 8e 44 ff ff ff    	jle    c0007545 <init_memory_block_desc+0x12>
c0007601:	90                   	nop
c0007602:	c9                   	leave  
c0007603:	c3                   	ret    

c0007604 <init_memory2>:
c0007604:	55                   	push   %ebp
c0007605:	89 e5                	mov    %esp,%ebp
c0007607:	83 ec 38             	sub    $0x38,%esp
c000760a:	c7 45 f4 00 00 00 02 	movl   $0x2000000,-0xc(%ebp)
c0007611:	c7 45 f0 00 20 10 00 	movl   $0x102000,-0x10(%ebp)
c0007618:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000761b:	a3 b4 16 01 c0       	mov    %eax,0xc00116b4
c0007620:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007623:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c0007628:	29 c2                	sub    %eax,%edx
c000762a:	89 d0                	mov    %edx,%eax
c000762c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000762f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007632:	89 c2                	mov    %eax,%edx
c0007634:	c1 ea 1f             	shr    $0x1f,%edx
c0007637:	01 d0                	add    %edx,%eax
c0007639:	d1 f8                	sar    %eax
c000763b:	a3 b8 16 01 c0       	mov    %eax,0xc00116b8
c0007640:	a1 b8 16 01 c0       	mov    0xc00116b8,%eax
c0007645:	83 ec 0c             	sub    $0xc,%esp
c0007648:	50                   	push   %eax
c0007649:	e8 09 08 00 00       	call   c0007e57 <disp_int>
c000764e:	83 c4 10             	add    $0x10,%esp
c0007651:	a1 b8 16 01 c0       	mov    0xc00116b8,%eax
c0007656:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007659:	29 c2                	sub    %eax,%edx
c000765b:	89 d0                	mov    %edx,%eax
c000765d:	a3 00 1f 01 c0       	mov    %eax,0xc0011f00
c0007662:	83 ec 0c             	sub    $0xc,%esp
c0007665:	68 94 b3 00 c0       	push   $0xc000b394
c000766a:	e8 1d 9a ff ff       	call   c000108c <disp_str>
c000766f:	83 c4 10             	add    $0x10,%esp
c0007672:	a1 00 1f 01 c0       	mov    0xc0011f00,%eax
c0007677:	83 ec 0c             	sub    $0xc,%esp
c000767a:	50                   	push   %eax
c000767b:	e8 d7 07 00 00       	call   c0007e57 <disp_int>
c0007680:	83 c4 10             	add    $0x10,%esp
c0007683:	83 ec 0c             	sub    $0xc,%esp
c0007686:	68 94 b3 00 c0       	push   $0xc000b394
c000768b:	e8 fc 99 ff ff       	call   c000108c <disp_str>
c0007690:	83 c4 10             	add    $0x10,%esp
c0007693:	a1 b8 16 01 c0       	mov    0xc00116b8,%eax
c0007698:	05 ff 0f 00 00       	add    $0xfff,%eax
c000769d:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c00076a3:	85 c0                	test   %eax,%eax
c00076a5:	0f 48 c2             	cmovs  %edx,%eax
c00076a8:	c1 f8 0c             	sar    $0xc,%eax
c00076ab:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00076ae:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00076b1:	83 c0 07             	add    $0x7,%eax
c00076b4:	8d 50 07             	lea    0x7(%eax),%edx
c00076b7:	85 c0                	test   %eax,%eax
c00076b9:	0f 48 c2             	cmovs  %edx,%eax
c00076bc:	c1 f8 03             	sar    $0x3,%eax
c00076bf:	a3 b0 16 01 c0       	mov    %eax,0xc00116b0
c00076c4:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c00076c9:	2d 00 00 00 40       	sub    $0x40000000,%eax
c00076ce:	a3 ac 16 01 c0       	mov    %eax,0xc00116ac
c00076d3:	8b 15 b0 16 01 c0    	mov    0xc00116b0,%edx
c00076d9:	a1 ac 16 01 c0       	mov    0xc00116ac,%eax
c00076de:	83 ec 04             	sub    $0x4,%esp
c00076e1:	52                   	push   %edx
c00076e2:	6a 00                	push   $0x0
c00076e4:	50                   	push   %eax
c00076e5:	e8 35 45 00 00       	call   c000bc1f <Memset>
c00076ea:	83 c4 10             	add    $0x10,%esp
c00076ed:	a1 b0 16 01 c0       	mov    0xc00116b0,%eax
c00076f2:	05 ff 0f 00 00       	add    $0xfff,%eax
c00076f7:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c00076fd:	85 c0                	test   %eax,%eax
c00076ff:	0f 48 c2             	cmovs  %edx,%eax
c0007702:	c1 f8 0c             	sar    $0xc,%eax
c0007705:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007708:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000770b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000770e:	ff 75 e8             	pushl  -0x18(%ebp)
c0007711:	6a 01                	push   $0x1
c0007713:	6a 00                	push   $0x0
c0007715:	68 ac 16 01 c0       	push   $0xc00116ac
c000771a:	e8 46 f1 ff ff       	call   c0006865 <set_bits>
c000771f:	83 c4 10             	add    $0x10,%esp
c0007722:	a1 00 1f 01 c0       	mov    0xc0011f00,%eax
c0007727:	05 ff 0f 00 00       	add    $0xfff,%eax
c000772c:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007732:	85 c0                	test   %eax,%eax
c0007734:	0f 48 c2             	cmovs  %edx,%eax
c0007737:	c1 f8 0c             	sar    $0xc,%eax
c000773a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000773d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007740:	83 c0 07             	add    $0x7,%eax
c0007743:	8d 50 07             	lea    0x7(%eax),%edx
c0007746:	85 c0                	test   %eax,%eax
c0007748:	0f 48 c2             	cmovs  %edx,%eax
c000774b:	c1 f8 03             	sar    $0x3,%eax
c000774e:	a3 f8 1e 01 c0       	mov    %eax,0xc0011ef8
c0007753:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c0007758:	8b 15 b0 16 01 c0    	mov    0xc00116b0,%edx
c000775e:	01 d0                	add    %edx,%eax
c0007760:	a3 f4 1e 01 c0       	mov    %eax,0xc0011ef4
c0007765:	8b 15 f8 1e 01 c0    	mov    0xc0011ef8,%edx
c000776b:	a1 f4 1e 01 c0       	mov    0xc0011ef4,%eax
c0007770:	83 ec 04             	sub    $0x4,%esp
c0007773:	52                   	push   %edx
c0007774:	6a 00                	push   $0x0
c0007776:	50                   	push   %eax
c0007777:	e8 a3 44 00 00       	call   c000bc1f <Memset>
c000777c:	83 c4 10             	add    $0x10,%esp
c000777f:	a1 f8 1e 01 c0       	mov    0xc0011ef8,%eax
c0007784:	05 ff 0f 00 00       	add    $0xfff,%eax
c0007789:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c000778f:	85 c0                	test   %eax,%eax
c0007791:	0f 48 c2             	cmovs  %edx,%eax
c0007794:	c1 f8 0c             	sar    $0xc,%eax
c0007797:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000779a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000779d:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00077a0:	ff 75 e8             	pushl  -0x18(%ebp)
c00077a3:	6a 01                	push   $0x1
c00077a5:	ff 75 e0             	pushl  -0x20(%ebp)
c00077a8:	68 ac 16 01 c0       	push   $0xc00116ac
c00077ad:	e8 b3 f0 ff ff       	call   c0006865 <set_bits>
c00077b2:	83 c4 10             	add    $0x10,%esp
c00077b5:	c7 45 dc 00 00 10 00 	movl   $0x100000,-0x24(%ebp)
c00077bc:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00077bf:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00077c2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00077c5:	83 c0 07             	add    $0x7,%eax
c00077c8:	8d 50 07             	lea    0x7(%eax),%edx
c00077cb:	85 c0                	test   %eax,%eax
c00077cd:	0f 48 c2             	cmovs  %edx,%eax
c00077d0:	c1 f8 03             	sar    $0x3,%eax
c00077d3:	a3 98 07 01 c0       	mov    %eax,0xc0010798
c00077d8:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c00077dd:	8b 15 b0 16 01 c0    	mov    0xc00116b0,%edx
c00077e3:	01 c2                	add    %eax,%edx
c00077e5:	a1 f8 1e 01 c0       	mov    0xc0011ef8,%eax
c00077ea:	01 d0                	add    %edx,%eax
c00077ec:	a3 94 07 01 c0       	mov    %eax,0xc0010794
c00077f1:	8b 15 98 07 01 c0    	mov    0xc0010798,%edx
c00077f7:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c00077fc:	83 ec 04             	sub    $0x4,%esp
c00077ff:	52                   	push   %edx
c0007800:	6a 00                	push   $0x0
c0007802:	50                   	push   %eax
c0007803:	e8 17 44 00 00       	call   c000bc1f <Memset>
c0007808:	83 c4 10             	add    $0x10,%esp
c000780b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c000780e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007811:	01 d0                	add    %edx,%eax
c0007813:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0007816:	a1 98 07 01 c0       	mov    0xc0010798,%eax
c000781b:	05 ff 0f 00 00       	add    $0xfff,%eax
c0007820:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007826:	85 c0                	test   %eax,%eax
c0007828:	0f 48 c2             	cmovs  %edx,%eax
c000782b:	c1 f8 0c             	sar    $0xc,%eax
c000782e:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007831:	ff 75 e8             	pushl  -0x18(%ebp)
c0007834:	6a 01                	push   $0x1
c0007836:	ff 75 e0             	pushl  -0x20(%ebp)
c0007839:	68 ac 16 01 c0       	push   $0xc00116ac
c000783e:	e8 22 f0 ff ff       	call   c0006865 <set_bits>
c0007843:	83 c4 10             	add    $0x10,%esp
c0007846:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0007849:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000784c:	01 d0                	add    %edx,%eax
c000784e:	c1 e0 0c             	shl    $0xc,%eax
c0007851:	a3 9c 07 01 c0       	mov    %eax,0xc001079c
c0007856:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007859:	83 c0 02             	add    $0x2,%eax
c000785c:	c1 e0 0c             	shl    $0xc,%eax
c000785f:	89 c2                	mov    %eax,%edx
c0007861:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007864:	01 d0                	add    %edx,%eax
c0007866:	a3 9c 07 01 c0       	mov    %eax,0xc001079c
c000786b:	c7 45 d8 05 00 00 00 	movl   $0x5,-0x28(%ebp)
c0007872:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007875:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0007878:	90                   	nop
c0007879:	c9                   	leave  
c000787a:	c3                   	ret    

c000787b <init_memory>:
c000787b:	55                   	push   %ebp
c000787c:	89 e5                	mov    %esp,%ebp
c000787e:	83 ec 38             	sub    $0x38,%esp
c0007881:	c7 45 f4 00 a0 09 c0 	movl   $0xc009a000,-0xc(%ebp)
c0007888:	c7 45 f0 00 00 10 c0 	movl   $0xc0100000,-0x10(%ebp)
c000788f:	c7 45 ec 00 00 10 00 	movl   $0x100000,-0x14(%ebp)
c0007896:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007899:	05 00 00 10 00       	add    $0x100000,%eax
c000789e:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00078a1:	8b 45 08             	mov    0x8(%ebp),%eax
c00078a4:	2b 45 e8             	sub    -0x18(%ebp),%eax
c00078a7:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c00078ad:	85 c0                	test   %eax,%eax
c00078af:	0f 48 c2             	cmovs  %edx,%eax
c00078b2:	c1 f8 0c             	sar    $0xc,%eax
c00078b5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00078b8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00078bb:	89 c2                	mov    %eax,%edx
c00078bd:	c1 ea 1f             	shr    $0x1f,%edx
c00078c0:	01 d0                	add    %edx,%eax
c00078c2:	d1 f8                	sar    %eax
c00078c4:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00078c7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00078ca:	2b 45 e0             	sub    -0x20(%ebp),%eax
c00078cd:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00078d0:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00078d3:	8d 50 07             	lea    0x7(%eax),%edx
c00078d6:	85 c0                	test   %eax,%eax
c00078d8:	0f 48 c2             	cmovs  %edx,%eax
c00078db:	c1 f8 03             	sar    $0x3,%eax
c00078de:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00078e1:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00078e4:	8d 50 07             	lea    0x7(%eax),%edx
c00078e7:	85 c0                	test   %eax,%eax
c00078e9:	0f 48 c2             	cmovs  %edx,%eax
c00078ec:	c1 f8 03             	sar    $0x3,%eax
c00078ef:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00078f2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00078f5:	a3 b4 16 01 c0       	mov    %eax,0xc00116b4
c00078fa:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c00078ff:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0007902:	c1 e2 0c             	shl    $0xc,%edx
c0007905:	01 d0                	add    %edx,%eax
c0007907:	a3 fc 1e 01 c0       	mov    %eax,0xc0011efc
c000790c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000790f:	a3 ac 16 01 c0       	mov    %eax,0xc00116ac
c0007914:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007917:	a3 b0 16 01 c0       	mov    %eax,0xc00116b0
c000791c:	a1 ac 16 01 c0       	mov    0xc00116ac,%eax
c0007921:	83 ec 04             	sub    $0x4,%esp
c0007924:	ff 75 d8             	pushl  -0x28(%ebp)
c0007927:	6a 00                	push   $0x0
c0007929:	50                   	push   %eax
c000792a:	e8 f0 42 00 00       	call   c000bc1f <Memset>
c000792f:	83 c4 10             	add    $0x10,%esp
c0007932:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007935:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007938:	01 d0                	add    %edx,%eax
c000793a:	a3 f4 1e 01 c0       	mov    %eax,0xc0011ef4
c000793f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007942:	a3 f8 1e 01 c0       	mov    %eax,0xc0011ef8
c0007947:	a1 f4 1e 01 c0       	mov    0xc0011ef4,%eax
c000794c:	83 ec 04             	sub    $0x4,%esp
c000794f:	ff 75 d4             	pushl  -0x2c(%ebp)
c0007952:	6a 00                	push   $0x0
c0007954:	50                   	push   %eax
c0007955:	e8 c5 42 00 00       	call   c000bc1f <Memset>
c000795a:	83 c4 10             	add    $0x10,%esp
c000795d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007960:	a3 98 07 01 c0       	mov    %eax,0xc0010798
c0007965:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007968:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000796b:	01 c2                	add    %eax,%edx
c000796d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007970:	01 d0                	add    %edx,%eax
c0007972:	a3 94 07 01 c0       	mov    %eax,0xc0010794
c0007977:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000797a:	05 00 00 10 00       	add    $0x100000,%eax
c000797f:	a3 9c 07 01 c0       	mov    %eax,0xc001079c
c0007984:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c0007989:	83 ec 04             	sub    $0x4,%esp
c000798c:	ff 75 d8             	pushl  -0x28(%ebp)
c000798f:	6a 00                	push   $0x0
c0007991:	50                   	push   %eax
c0007992:	e8 88 42 00 00       	call   c000bc1f <Memset>
c0007997:	83 c4 10             	add    $0x10,%esp
c000799a:	83 ec 04             	sub    $0x4,%esp
c000799d:	68 f0 00 00 00       	push   $0xf0
c00079a2:	6a 00                	push   $0x0
c00079a4:	68 a0 47 08 c0       	push   $0xc00847a0
c00079a9:	e8 71 42 00 00       	call   c000bc1f <Memset>
c00079ae:	83 c4 10             	add    $0x10,%esp
c00079b1:	83 ec 0c             	sub    $0xc,%esp
c00079b4:	68 a0 47 08 c0       	push   $0xc00847a0
c00079b9:	e8 75 fb ff ff       	call   c0007533 <init_memory_block_desc>
c00079be:	83 c4 10             	add    $0x10,%esp
c00079c1:	90                   	nop
c00079c2:	c9                   	leave  
c00079c3:	c3                   	ret    

c00079c4 <catch_error>:
c00079c4:	55                   	push   %ebp
c00079c5:	89 e5                	mov    %esp,%ebp
c00079c7:	a1 c4 0b 01 c0       	mov    0xc0010bc4,%eax
c00079cc:	83 c0 01             	add    $0x1,%eax
c00079cf:	a3 c4 0b 01 c0       	mov    %eax,0xc0010bc4
c00079d4:	a1 a4 07 01 c0       	mov    0xc00107a4,%eax
c00079d9:	a3 a0 07 01 c0       	mov    %eax,0xc00107a0
c00079de:	90                   	nop
c00079df:	5d                   	pop    %ebp
c00079e0:	c3                   	ret    

c00079e1 <intr_enable>:
c00079e1:	55                   	push   %ebp
c00079e2:	89 e5                	mov    %esp,%ebp
c00079e4:	83 ec 18             	sub    $0x18,%esp
c00079e7:	e8 65 00 00 00       	call   c0007a51 <intr_get_status>
c00079ec:	83 f8 01             	cmp    $0x1,%eax
c00079ef:	75 0c                	jne    c00079fd <intr_enable+0x1c>
c00079f1:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c00079f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00079fb:	eb 0b                	jmp    c0007a08 <intr_enable+0x27>
c00079fd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007a04:	fb                   	sti    
c0007a05:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007a08:	c9                   	leave  
c0007a09:	c3                   	ret    

c0007a0a <intr_disable>:
c0007a0a:	55                   	push   %ebp
c0007a0b:	89 e5                	mov    %esp,%ebp
c0007a0d:	83 ec 18             	sub    $0x18,%esp
c0007a10:	e8 3c 00 00 00       	call   c0007a51 <intr_get_status>
c0007a15:	83 f8 01             	cmp    $0x1,%eax
c0007a18:	75 0d                	jne    c0007a27 <intr_disable+0x1d>
c0007a1a:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0007a21:	fa                   	cli    
c0007a22:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007a25:	eb 0a                	jmp    c0007a31 <intr_disable+0x27>
c0007a27:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007a2e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007a31:	c9                   	leave  
c0007a32:	c3                   	ret    

c0007a33 <intr_set_status>:
c0007a33:	55                   	push   %ebp
c0007a34:	89 e5                	mov    %esp,%ebp
c0007a36:	83 ec 08             	sub    $0x8,%esp
c0007a39:	8b 45 08             	mov    0x8(%ebp),%eax
c0007a3c:	83 e0 01             	and    $0x1,%eax
c0007a3f:	85 c0                	test   %eax,%eax
c0007a41:	74 07                	je     c0007a4a <intr_set_status+0x17>
c0007a43:	e8 99 ff ff ff       	call   c00079e1 <intr_enable>
c0007a48:	eb 05                	jmp    c0007a4f <intr_set_status+0x1c>
c0007a4a:	e8 bb ff ff ff       	call   c0007a0a <intr_disable>
c0007a4f:	c9                   	leave  
c0007a50:	c3                   	ret    

c0007a51 <intr_get_status>:
c0007a51:	55                   	push   %ebp
c0007a52:	89 e5                	mov    %esp,%ebp
c0007a54:	83 ec 10             	sub    $0x10,%esp
c0007a57:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0007a5e:	9c                   	pushf  
c0007a5f:	58                   	pop    %eax
c0007a60:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0007a63:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007a66:	c1 e8 09             	shr    $0x9,%eax
c0007a69:	83 e0 01             	and    $0x1,%eax
c0007a6c:	c9                   	leave  
c0007a6d:	c3                   	ret    

c0007a6e <Memcpy>:
c0007a6e:	55                   	push   %ebp
c0007a6f:	89 e5                	mov    %esp,%ebp
c0007a71:	83 ec 18             	sub    $0x18,%esp
c0007a74:	e8 91 ff ff ff       	call   c0007a0a <intr_disable>
c0007a79:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007a7c:	83 ec 04             	sub    $0x4,%esp
c0007a7f:	ff 75 10             	pushl  0x10(%ebp)
c0007a82:	ff 75 0c             	pushl  0xc(%ebp)
c0007a85:	ff 75 08             	pushl  0x8(%ebp)
c0007a88:	e8 64 41 00 00       	call   c000bbf1 <Memcpy2>
c0007a8d:	83 c4 10             	add    $0x10,%esp
c0007a90:	83 ec 0c             	sub    $0xc,%esp
c0007a93:	ff 75 f4             	pushl  -0xc(%ebp)
c0007a96:	e8 98 ff ff ff       	call   c0007a33 <intr_set_status>
c0007a9b:	83 c4 10             	add    $0x10,%esp
c0007a9e:	90                   	nop
c0007a9f:	c9                   	leave  
c0007aa0:	c3                   	ret    

c0007aa1 <untar>:
c0007aa1:	55                   	push   %ebp
c0007aa2:	89 e5                	mov    %esp,%ebp
c0007aa4:	81 ec 48 0a 00 00    	sub    $0xa48,%esp
c0007aaa:	83 ec 08             	sub    $0x8,%esp
c0007aad:	6a 00                	push   $0x0
c0007aaf:	ff 75 08             	pushl  0x8(%ebp)
c0007ab2:	e8 67 de ff ff       	call   c000591e <open>
c0007ab7:	83 c4 10             	add    $0x10,%esp
c0007aba:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007abd:	83 ec 0c             	sub    $0xc,%esp
c0007ac0:	68 a0 b3 00 c0       	push   $0xc000b3a0
c0007ac5:	e8 20 16 00 00       	call   c00090ea <Printf>
c0007aca:	83 c4 10             	add    $0x10,%esp
c0007acd:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0007ad4:	c7 45 dc 00 02 00 00 	movl   $0x200,-0x24(%ebp)
c0007adb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007ae2:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0007ae9:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0007af0:	e9 5e 02 00 00       	jmp    c0007d53 <untar+0x2b2>
c0007af5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0007af9:	7e 58                	jle    c0007b53 <untar+0xb2>
c0007afb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007afe:	05 ff 01 00 00       	add    $0x1ff,%eax
c0007b03:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0007b09:	85 c0                	test   %eax,%eax
c0007b0b:	0f 48 c2             	cmovs  %edx,%eax
c0007b0e:	c1 f8 09             	sar    $0x9,%eax
c0007b11:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0007b14:	83 ec 04             	sub    $0x4,%esp
c0007b17:	68 00 02 00 00       	push   $0x200
c0007b1c:	6a 00                	push   $0x0
c0007b1e:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0007b24:	50                   	push   %eax
c0007b25:	e8 f5 40 00 00       	call   c000bc1f <Memset>
c0007b2a:	83 c4 10             	add    $0x10,%esp
c0007b2d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007b30:	c1 e0 09             	shl    $0x9,%eax
c0007b33:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0007b36:	83 ec 04             	sub    $0x4,%esp
c0007b39:	50                   	push   %eax
c0007b3a:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0007b40:	50                   	push   %eax
c0007b41:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007b44:	e8 6a de ff ff       	call   c00059b3 <read>
c0007b49:	83 c4 10             	add    $0x10,%esp
c0007b4c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007b53:	83 ec 04             	sub    $0x4,%esp
c0007b56:	68 00 02 00 00       	push   $0x200
c0007b5b:	6a 00                	push   $0x0
c0007b5d:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0007b63:	50                   	push   %eax
c0007b64:	e8 b6 40 00 00       	call   c000bc1f <Memset>
c0007b69:	83 c4 10             	add    $0x10,%esp
c0007b6c:	83 ec 04             	sub    $0x4,%esp
c0007b6f:	68 00 02 00 00       	push   $0x200
c0007b74:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0007b7a:	50                   	push   %eax
c0007b7b:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007b7e:	e8 30 de ff ff       	call   c00059b3 <read>
c0007b83:	83 c4 10             	add    $0x10,%esp
c0007b86:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0007b89:	83 ec 0c             	sub    $0xc,%esp
c0007b8c:	68 b2 b3 00 c0       	push   $0xc000b3b2
c0007b91:	e8 54 15 00 00       	call   c00090ea <Printf>
c0007b96:	83 c4 10             	add    $0x10,%esp
c0007b99:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0007b9d:	0f 84 bc 01 00 00    	je     c0007d5f <untar+0x2be>
c0007ba3:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007ba6:	01 45 f4             	add    %eax,-0xc(%ebp)
c0007ba9:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0007bb0:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0007bb6:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0007bb9:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0007bbc:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0007bbf:	83 ec 08             	sub    $0x8,%esp
c0007bc2:	6a 07                	push   $0x7
c0007bc4:	ff 75 cc             	pushl  -0x34(%ebp)
c0007bc7:	e8 52 dd ff ff       	call   c000591e <open>
c0007bcc:	83 c4 10             	add    $0x10,%esp
c0007bcf:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0007bd2:	83 ec 0c             	sub    $0xc,%esp
c0007bd5:	68 c4 b3 00 c0       	push   $0xc000b3c4
c0007bda:	e8 0b 15 00 00       	call   c00090ea <Printf>
c0007bdf:	83 c4 10             	add    $0x10,%esp
c0007be2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0007be9:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0007bec:	83 c0 7c             	add    $0x7c,%eax
c0007bef:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0007bf2:	83 ec 0c             	sub    $0xc,%esp
c0007bf5:	ff 75 cc             	pushl  -0x34(%ebp)
c0007bf8:	e8 5b 40 00 00       	call   c000bc58 <Strlen>
c0007bfd:	83 c4 10             	add    $0x10,%esp
c0007c00:	85 c0                	test   %eax,%eax
c0007c02:	75 28                	jne    c0007c2c <untar+0x18b>
c0007c04:	83 ec 0c             	sub    $0xc,%esp
c0007c07:	ff 75 c4             	pushl  -0x3c(%ebp)
c0007c0a:	e8 49 40 00 00       	call   c000bc58 <Strlen>
c0007c0f:	83 c4 10             	add    $0x10,%esp
c0007c12:	85 c0                	test   %eax,%eax
c0007c14:	75 16                	jne    c0007c2c <untar+0x18b>
c0007c16:	83 ec 0c             	sub    $0xc,%esp
c0007c19:	68 d6 b3 00 c0       	push   $0xc000b3d6
c0007c1e:	e8 c7 14 00 00       	call   c00090ea <Printf>
c0007c23:	83 c4 10             	add    $0x10,%esp
c0007c26:	90                   	nop
c0007c27:	e9 34 01 00 00       	jmp    c0007d60 <untar+0x2bf>
c0007c2c:	83 ec 0c             	sub    $0xc,%esp
c0007c2f:	68 dd b3 00 c0       	push   $0xc000b3dd
c0007c34:	e8 b1 14 00 00       	call   c00090ea <Printf>
c0007c39:	83 c4 10             	add    $0x10,%esp
c0007c3c:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0007c3f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007c42:	eb 1f                	jmp    c0007c63 <untar+0x1c2>
c0007c44:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007c47:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0007c4e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007c51:	0f b6 00             	movzbl (%eax),%eax
c0007c54:	0f be c0             	movsbl %al,%eax
c0007c57:	83 e8 30             	sub    $0x30,%eax
c0007c5a:	01 d0                	add    %edx,%eax
c0007c5c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007c5f:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0007c63:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007c66:	0f b6 00             	movzbl (%eax),%eax
c0007c69:	84 c0                	test   %al,%al
c0007c6b:	75 d7                	jne    c0007c44 <untar+0x1a3>
c0007c6d:	83 ec 0c             	sub    $0xc,%esp
c0007c70:	68 eb b3 00 c0       	push   $0xc000b3eb
c0007c75:	e8 70 14 00 00       	call   c00090ea <Printf>
c0007c7a:	83 c4 10             	add    $0x10,%esp
c0007c7d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007c80:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0007c83:	c7 45 bc 00 08 00 00 	movl   $0x800,-0x44(%ebp)
c0007c8a:	83 ec 08             	sub    $0x8,%esp
c0007c8d:	ff 75 c0             	pushl  -0x40(%ebp)
c0007c90:	68 f9 b3 00 c0       	push   $0xc000b3f9
c0007c95:	e8 50 14 00 00       	call   c00090ea <Printf>
c0007c9a:	83 c4 10             	add    $0x10,%esp
c0007c9d:	83 ec 08             	sub    $0x8,%esp
c0007ca0:	ff 75 c0             	pushl  -0x40(%ebp)
c0007ca3:	68 0b b4 00 c0       	push   $0xc000b40b
c0007ca8:	e8 3d 14 00 00       	call   c00090ea <Printf>
c0007cad:	83 c4 10             	add    $0x10,%esp
c0007cb0:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0007cb3:	39 45 bc             	cmp    %eax,-0x44(%ebp)
c0007cb6:	0f 4e 45 bc          	cmovle -0x44(%ebp),%eax
c0007cba:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0007cbd:	83 ec 04             	sub    $0x4,%esp
c0007cc0:	ff 75 b8             	pushl  -0x48(%ebp)
c0007cc3:	8d 85 b8 f5 ff ff    	lea    -0xa48(%ebp),%eax
c0007cc9:	50                   	push   %eax
c0007cca:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007ccd:	e8 e1 dc ff ff       	call   c00059b3 <read>
c0007cd2:	83 c4 10             	add    $0x10,%esp
c0007cd5:	01 45 f4             	add    %eax,-0xc(%ebp)
c0007cd8:	83 ec 04             	sub    $0x4,%esp
c0007cdb:	ff 75 b8             	pushl  -0x48(%ebp)
c0007cde:	8d 85 b8 f5 ff ff    	lea    -0xa48(%ebp),%eax
c0007ce4:	50                   	push   %eax
c0007ce5:	ff 75 c8             	pushl  -0x38(%ebp)
c0007ce8:	e8 47 de ff ff       	call   c0005b34 <write>
c0007ced:	83 c4 10             	add    $0x10,%esp
c0007cf0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007cf3:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0007cf6:	7d 02                	jge    c0007cfa <untar+0x259>
c0007cf8:	eb c3                	jmp    c0007cbd <untar+0x21c>
c0007cfa:	90                   	nop
c0007cfb:	83 ec 08             	sub    $0x8,%esp
c0007cfe:	ff 75 f4             	pushl  -0xc(%ebp)
c0007d01:	68 1d b4 00 c0       	push   $0xc000b41d
c0007d06:	e8 df 13 00 00       	call   c00090ea <Printf>
c0007d0b:	83 c4 10             	add    $0x10,%esp
c0007d0e:	83 ec 08             	sub    $0x8,%esp
c0007d11:	ff 75 c0             	pushl  -0x40(%ebp)
c0007d14:	68 2f b4 00 c0       	push   $0xc000b42f
c0007d19:	e8 cc 13 00 00       	call   c00090ea <Printf>
c0007d1e:	83 c4 10             	add    $0x10,%esp
c0007d21:	83 ec 0c             	sub    $0xc,%esp
c0007d24:	68 40 b4 00 c0       	push   $0xc000b440
c0007d29:	e8 bc 13 00 00       	call   c00090ea <Printf>
c0007d2e:	83 c4 10             	add    $0x10,%esp
c0007d31:	83 ec 0c             	sub    $0xc,%esp
c0007d34:	ff 75 c8             	pushl  -0x38(%ebp)
c0007d37:	e8 7d de ff ff       	call   c0005bb9 <close>
c0007d3c:	83 c4 10             	add    $0x10,%esp
c0007d3f:	83 ec 0c             	sub    $0xc,%esp
c0007d42:	68 4e b4 00 c0       	push   $0xc000b44e
c0007d47:	e8 9e 13 00 00       	call   c00090ea <Printf>
c0007d4c:	83 c4 10             	add    $0x10,%esp
c0007d4f:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c0007d53:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0007d57:	0f 8f 98 fd ff ff    	jg     c0007af5 <untar+0x54>
c0007d5d:	eb 01                	jmp    c0007d60 <untar+0x2bf>
c0007d5f:	90                   	nop
c0007d60:	83 ec 0c             	sub    $0xc,%esp
c0007d63:	68 5b b4 00 c0       	push   $0xc000b45b
c0007d68:	e8 7d 13 00 00       	call   c00090ea <Printf>
c0007d6d:	83 c4 10             	add    $0x10,%esp
c0007d70:	83 ec 0c             	sub    $0xc,%esp
c0007d73:	68 6d b4 00 c0       	push   $0xc000b46d
c0007d78:	e8 6d 13 00 00       	call   c00090ea <Printf>
c0007d7d:	83 c4 10             	add    $0x10,%esp
c0007d80:	83 ec 0c             	sub    $0xc,%esp
c0007d83:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007d86:	e8 2e de ff ff       	call   c0005bb9 <close>
c0007d8b:	83 c4 10             	add    $0x10,%esp
c0007d8e:	83 ec 0c             	sub    $0xc,%esp
c0007d91:	68 7d b4 00 c0       	push   $0xc000b47d
c0007d96:	e8 4f 13 00 00       	call   c00090ea <Printf>
c0007d9b:	83 c4 10             	add    $0x10,%esp
c0007d9e:	83 ec 0c             	sub    $0xc,%esp
c0007da1:	68 90 b4 00 c0       	push   $0xc000b490
c0007da6:	e8 3f 13 00 00       	call   c00090ea <Printf>
c0007dab:	83 c4 10             	add    $0x10,%esp
c0007dae:	90                   	nop
c0007daf:	c9                   	leave  
c0007db0:	c3                   	ret    

c0007db1 <atoi>:
c0007db1:	55                   	push   %ebp
c0007db2:	89 e5                	mov    %esp,%ebp
c0007db4:	83 ec 10             	sub    $0x10,%esp
c0007db7:	8b 45 08             	mov    0x8(%ebp),%eax
c0007dba:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0007dbd:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007dc0:	8d 50 01             	lea    0x1(%eax),%edx
c0007dc3:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0007dc6:	c6 00 30             	movb   $0x30,(%eax)
c0007dc9:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007dcc:	8d 50 01             	lea    0x1(%eax),%edx
c0007dcf:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0007dd2:	c6 00 78             	movb   $0x78,(%eax)
c0007dd5:	c6 45 fa 00          	movb   $0x0,-0x6(%ebp)
c0007dd9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0007ddd:	75 0e                	jne    c0007ded <atoi+0x3c>
c0007ddf:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007de2:	8d 50 01             	lea    0x1(%eax),%edx
c0007de5:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0007de8:	c6 00 30             	movb   $0x30,(%eax)
c0007deb:	eb 61                	jmp    c0007e4e <atoi+0x9d>
c0007ded:	c7 45 f4 1c 00 00 00 	movl   $0x1c,-0xc(%ebp)
c0007df4:	eb 52                	jmp    c0007e48 <atoi+0x97>
c0007df6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007df9:	8b 55 0c             	mov    0xc(%ebp),%edx
c0007dfc:	89 c1                	mov    %eax,%ecx
c0007dfe:	d3 fa                	sar    %cl,%edx
c0007e00:	89 d0                	mov    %edx,%eax
c0007e02:	83 e0 0f             	and    $0xf,%eax
c0007e05:	88 45 fb             	mov    %al,-0x5(%ebp)
c0007e08:	80 7d fa 00          	cmpb   $0x0,-0x6(%ebp)
c0007e0c:	75 06                	jne    c0007e14 <atoi+0x63>
c0007e0e:	80 7d fb 00          	cmpb   $0x0,-0x5(%ebp)
c0007e12:	74 2f                	je     c0007e43 <atoi+0x92>
c0007e14:	c6 45 fa 01          	movb   $0x1,-0x6(%ebp)
c0007e18:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0007e1c:	83 c0 30             	add    $0x30,%eax
c0007e1f:	88 45 fb             	mov    %al,-0x5(%ebp)
c0007e22:	80 7d fb 39          	cmpb   $0x39,-0x5(%ebp)
c0007e26:	7e 0a                	jle    c0007e32 <atoi+0x81>
c0007e28:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0007e2c:	83 c0 07             	add    $0x7,%eax
c0007e2f:	88 45 fb             	mov    %al,-0x5(%ebp)
c0007e32:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007e35:	8d 50 01             	lea    0x1(%eax),%edx
c0007e38:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0007e3b:	0f b6 55 fb          	movzbl -0x5(%ebp),%edx
c0007e3f:	88 10                	mov    %dl,(%eax)
c0007e41:	eb 01                	jmp    c0007e44 <atoi+0x93>
c0007e43:	90                   	nop
c0007e44:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c0007e48:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0007e4c:	79 a8                	jns    c0007df6 <atoi+0x45>
c0007e4e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007e51:	c6 00 00             	movb   $0x0,(%eax)
c0007e54:	90                   	nop
c0007e55:	c9                   	leave  
c0007e56:	c3                   	ret    

c0007e57 <disp_int>:
c0007e57:	55                   	push   %ebp
c0007e58:	89 e5                	mov    %esp,%ebp
c0007e5a:	83 ec 18             	sub    $0x18,%esp
c0007e5d:	ff 75 08             	pushl  0x8(%ebp)
c0007e60:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0007e63:	50                   	push   %eax
c0007e64:	e8 48 ff ff ff       	call   c0007db1 <atoi>
c0007e69:	83 c4 08             	add    $0x8,%esp
c0007e6c:	83 ec 08             	sub    $0x8,%esp
c0007e6f:	6a 0b                	push   $0xb
c0007e71:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0007e74:	50                   	push   %eax
c0007e75:	e8 4d 92 ff ff       	call   c00010c7 <disp_str_colour>
c0007e7a:	83 c4 10             	add    $0x10,%esp
c0007e7d:	90                   	nop
c0007e7e:	c9                   	leave  
c0007e7f:	c3                   	ret    

c0007e80 <do_page_fault>:
c0007e80:	55                   	push   %ebp
c0007e81:	89 e5                	mov    %esp,%ebp
c0007e83:	83 ec 28             	sub    $0x28,%esp
c0007e86:	0f 20 d0             	mov    %cr2,%eax
c0007e89:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007e8c:	c7 05 a4 07 01 c0 00 	movl   $0x0,0xc00107a4
c0007e93:	00 00 00 
c0007e96:	83 ec 0c             	sub    $0xc,%esp
c0007e99:	68 9b b4 00 c0       	push   $0xc000b49b
c0007e9e:	e8 e9 91 ff ff       	call   c000108c <disp_str>
c0007ea3:	83 c4 10             	add    $0x10,%esp
c0007ea6:	83 ec 0c             	sub    $0xc,%esp
c0007ea9:	68 aa b4 00 c0       	push   $0xc000b4aa
c0007eae:	e8 d9 91 ff ff       	call   c000108c <disp_str>
c0007eb3:	83 c4 10             	add    $0x10,%esp
c0007eb6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007eb9:	83 ec 0c             	sub    $0xc,%esp
c0007ebc:	50                   	push   %eax
c0007ebd:	e8 95 ff ff ff       	call   c0007e57 <disp_int>
c0007ec2:	83 c4 10             	add    $0x10,%esp
c0007ec5:	83 ec 0c             	sub    $0xc,%esp
c0007ec8:	68 af b4 00 c0       	push   $0xc000b4af
c0007ecd:	e8 ba 91 ff ff       	call   c000108c <disp_str>
c0007ed2:	83 c4 10             	add    $0x10,%esp
c0007ed5:	83 ec 0c             	sub    $0xc,%esp
c0007ed8:	ff 75 f4             	pushl  -0xc(%ebp)
c0007edb:	e8 a9 ec ff ff       	call   c0006b89 <ptr_pde>
c0007ee0:	83 c4 10             	add    $0x10,%esp
c0007ee3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0007ee6:	83 ec 0c             	sub    $0xc,%esp
c0007ee9:	ff 75 f4             	pushl  -0xc(%ebp)
c0007eec:	e8 ab ec ff ff       	call   c0006b9c <ptr_pte>
c0007ef1:	83 c4 10             	add    $0x10,%esp
c0007ef4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007ef7:	83 ec 0c             	sub    $0xc,%esp
c0007efa:	68 b1 b4 00 c0       	push   $0xc000b4b1
c0007eff:	e8 88 91 ff ff       	call   c000108c <disp_str>
c0007f04:	83 c4 10             	add    $0x10,%esp
c0007f07:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007f0a:	83 ec 0c             	sub    $0xc,%esp
c0007f0d:	50                   	push   %eax
c0007f0e:	e8 44 ff ff ff       	call   c0007e57 <disp_int>
c0007f13:	83 c4 10             	add    $0x10,%esp
c0007f16:	83 ec 0c             	sub    $0xc,%esp
c0007f19:	68 b6 b4 00 c0       	push   $0xc000b4b6
c0007f1e:	e8 69 91 ff ff       	call   c000108c <disp_str>
c0007f23:	83 c4 10             	add    $0x10,%esp
c0007f26:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007f29:	8b 00                	mov    (%eax),%eax
c0007f2b:	83 ec 0c             	sub    $0xc,%esp
c0007f2e:	50                   	push   %eax
c0007f2f:	e8 23 ff ff ff       	call   c0007e57 <disp_int>
c0007f34:	83 c4 10             	add    $0x10,%esp
c0007f37:	83 ec 0c             	sub    $0xc,%esp
c0007f3a:	68 af b4 00 c0       	push   $0xc000b4af
c0007f3f:	e8 48 91 ff ff       	call   c000108c <disp_str>
c0007f44:	83 c4 10             	add    $0x10,%esp
c0007f47:	83 ec 0c             	sub    $0xc,%esp
c0007f4a:	68 bf b4 00 c0       	push   $0xc000b4bf
c0007f4f:	e8 38 91 ff ff       	call   c000108c <disp_str>
c0007f54:	83 c4 10             	add    $0x10,%esp
c0007f57:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007f5a:	83 ec 0c             	sub    $0xc,%esp
c0007f5d:	50                   	push   %eax
c0007f5e:	e8 f4 fe ff ff       	call   c0007e57 <disp_int>
c0007f63:	83 c4 10             	add    $0x10,%esp
c0007f66:	83 ec 0c             	sub    $0xc,%esp
c0007f69:	68 c4 b4 00 c0       	push   $0xc000b4c4
c0007f6e:	e8 19 91 ff ff       	call   c000108c <disp_str>
c0007f73:	83 c4 10             	add    $0x10,%esp
c0007f76:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007f79:	8b 00                	mov    (%eax),%eax
c0007f7b:	83 ec 0c             	sub    $0xc,%esp
c0007f7e:	50                   	push   %eax
c0007f7f:	e8 d3 fe ff ff       	call   c0007e57 <disp_int>
c0007f84:	83 c4 10             	add    $0x10,%esp
c0007f87:	83 ec 0c             	sub    $0xc,%esp
c0007f8a:	68 af b4 00 c0       	push   $0xc000b4af
c0007f8f:	e8 f8 90 ff ff       	call   c000108c <disp_str>
c0007f94:	83 c4 10             	add    $0x10,%esp
c0007f97:	c7 45 e8 00 00 10 00 	movl   $0x100000,-0x18(%ebp)
c0007f9e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007fa1:	8b 00                	mov    (%eax),%eax
c0007fa3:	83 e0 01             	and    $0x1,%eax
c0007fa6:	85 c0                	test   %eax,%eax
c0007fa8:	74 09                	je     c0007fb3 <do_page_fault+0x133>
c0007faa:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
c0007fb1:	eb 07                	jmp    c0007fba <do_page_fault+0x13a>
c0007fb3:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0007fba:	90                   	nop
c0007fbb:	c9                   	leave  
c0007fbc:	c3                   	ret    

c0007fbd <exception_handler>:
c0007fbd:	55                   	push   %ebp
c0007fbe:	89 e5                	mov    %esp,%ebp
c0007fc0:	57                   	push   %edi
c0007fc1:	56                   	push   %esi
c0007fc2:	53                   	push   %ebx
c0007fc3:	83 ec 6c             	sub    $0x6c,%esp
c0007fc6:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0007fc9:	bb 40 b7 00 c0       	mov    $0xc000b740,%ebx
c0007fce:	ba 13 00 00 00       	mov    $0x13,%edx
c0007fd3:	89 c7                	mov    %eax,%edi
c0007fd5:	89 de                	mov    %ebx,%esi
c0007fd7:	89 d1                	mov    %edx,%ecx
c0007fd9:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0007fdb:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0007fe2:	eb 04                	jmp    c0007fe8 <exception_handler+0x2b>
c0007fe4:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0007fe8:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c0007fef:	7e f3                	jle    c0007fe4 <exception_handler+0x27>
c0007ff1:	c7 05 a4 07 01 c0 00 	movl   $0x0,0xc00107a4
c0007ff8:	00 00 00 
c0007ffb:	83 ec 0c             	sub    $0xc,%esp
c0007ffe:	68 cd b4 00 c0       	push   $0xc000b4cd
c0008003:	e8 84 90 ff ff       	call   c000108c <disp_str>
c0008008:	83 c4 10             	add    $0x10,%esp
c000800b:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c0008012:	8b 45 08             	mov    0x8(%ebp),%eax
c0008015:	8b 44 85 8c          	mov    -0x74(%ebp,%eax,4),%eax
c0008019:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000801c:	83 ec 0c             	sub    $0xc,%esp
c000801f:	ff 75 dc             	pushl  -0x24(%ebp)
c0008022:	e8 65 90 ff ff       	call   c000108c <disp_str>
c0008027:	83 c4 10             	add    $0x10,%esp
c000802a:	83 ec 0c             	sub    $0xc,%esp
c000802d:	68 db b4 00 c0       	push   $0xc000b4db
c0008032:	e8 55 90 ff ff       	call   c000108c <disp_str>
c0008037:	83 c4 10             	add    $0x10,%esp
c000803a:	83 ec 0c             	sub    $0xc,%esp
c000803d:	68 de b4 00 c0       	push   $0xc000b4de
c0008042:	e8 45 90 ff ff       	call   c000108c <disp_str>
c0008047:	83 c4 10             	add    $0x10,%esp
c000804a:	8b 45 08             	mov    0x8(%ebp),%eax
c000804d:	83 ec 0c             	sub    $0xc,%esp
c0008050:	50                   	push   %eax
c0008051:	e8 01 fe ff ff       	call   c0007e57 <disp_int>
c0008056:	83 c4 10             	add    $0x10,%esp
c0008059:	83 ec 0c             	sub    $0xc,%esp
c000805c:	68 db b4 00 c0       	push   $0xc000b4db
c0008061:	e8 26 90 ff ff       	call   c000108c <disp_str>
c0008066:	83 c4 10             	add    $0x10,%esp
c0008069:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c000806d:	74 2f                	je     c000809e <exception_handler+0xe1>
c000806f:	83 ec 0c             	sub    $0xc,%esp
c0008072:	68 e6 b4 00 c0       	push   $0xc000b4e6
c0008077:	e8 10 90 ff ff       	call   c000108c <disp_str>
c000807c:	83 c4 10             	add    $0x10,%esp
c000807f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0008082:	83 ec 0c             	sub    $0xc,%esp
c0008085:	50                   	push   %eax
c0008086:	e8 cc fd ff ff       	call   c0007e57 <disp_int>
c000808b:	83 c4 10             	add    $0x10,%esp
c000808e:	83 ec 0c             	sub    $0xc,%esp
c0008091:	68 db b4 00 c0       	push   $0xc000b4db
c0008096:	e8 f1 8f ff ff       	call   c000108c <disp_str>
c000809b:	83 c4 10             	add    $0x10,%esp
c000809e:	83 ec 0c             	sub    $0xc,%esp
c00080a1:	68 f0 b4 00 c0       	push   $0xc000b4f0
c00080a6:	e8 e1 8f ff ff       	call   c000108c <disp_str>
c00080ab:	83 c4 10             	add    $0x10,%esp
c00080ae:	83 ec 0c             	sub    $0xc,%esp
c00080b1:	ff 75 14             	pushl  0x14(%ebp)
c00080b4:	e8 9e fd ff ff       	call   c0007e57 <disp_int>
c00080b9:	83 c4 10             	add    $0x10,%esp
c00080bc:	83 ec 0c             	sub    $0xc,%esp
c00080bf:	68 db b4 00 c0       	push   $0xc000b4db
c00080c4:	e8 c3 8f ff ff       	call   c000108c <disp_str>
c00080c9:	83 c4 10             	add    $0x10,%esp
c00080cc:	83 ec 0c             	sub    $0xc,%esp
c00080cf:	68 f4 b4 00 c0       	push   $0xc000b4f4
c00080d4:	e8 b3 8f ff ff       	call   c000108c <disp_str>
c00080d9:	83 c4 10             	add    $0x10,%esp
c00080dc:	8b 45 10             	mov    0x10(%ebp),%eax
c00080df:	83 ec 0c             	sub    $0xc,%esp
c00080e2:	50                   	push   %eax
c00080e3:	e8 6f fd ff ff       	call   c0007e57 <disp_int>
c00080e8:	83 c4 10             	add    $0x10,%esp
c00080eb:	83 ec 0c             	sub    $0xc,%esp
c00080ee:	68 db b4 00 c0       	push   $0xc000b4db
c00080f3:	e8 94 8f ff ff       	call   c000108c <disp_str>
c00080f8:	83 c4 10             	add    $0x10,%esp
c00080fb:	83 ec 0c             	sub    $0xc,%esp
c00080fe:	68 f9 b4 00 c0       	push   $0xc000b4f9
c0008103:	e8 84 8f ff ff       	call   c000108c <disp_str>
c0008108:	83 c4 10             	add    $0x10,%esp
c000810b:	83 ec 0c             	sub    $0xc,%esp
c000810e:	ff 75 18             	pushl  0x18(%ebp)
c0008111:	e8 41 fd ff ff       	call   c0007e57 <disp_int>
c0008116:	83 c4 10             	add    $0x10,%esp
c0008119:	83 ec 0c             	sub    $0xc,%esp
c000811c:	68 db b4 00 c0       	push   $0xc000b4db
c0008121:	e8 66 8f ff ff       	call   c000108c <disp_str>
c0008126:	83 c4 10             	add    $0x10,%esp
c0008129:	83 ec 0c             	sub    $0xc,%esp
c000812c:	68 04 b5 00 c0       	push   $0xc000b504
c0008131:	e8 56 8f ff ff       	call   c000108c <disp_str>
c0008136:	83 c4 10             	add    $0x10,%esp
c0008139:	83 7d 08 0e          	cmpl   $0xe,0x8(%ebp)
c000813d:	75 45                	jne    c0008184 <exception_handler+0x1c7>
c000813f:	0f 20 d0             	mov    %cr2,%eax
c0008142:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0008145:	83 ec 0c             	sub    $0xc,%esp
c0008148:	68 23 b5 00 c0       	push   $0xc000b523
c000814d:	e8 3a 8f ff ff       	call   c000108c <disp_str>
c0008152:	83 c4 10             	add    $0x10,%esp
c0008155:	83 ec 0c             	sub    $0xc,%esp
c0008158:	68 aa b4 00 c0       	push   $0xc000b4aa
c000815d:	e8 2a 8f ff ff       	call   c000108c <disp_str>
c0008162:	83 c4 10             	add    $0x10,%esp
c0008165:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008168:	83 ec 0c             	sub    $0xc,%esp
c000816b:	50                   	push   %eax
c000816c:	e8 e6 fc ff ff       	call   c0007e57 <disp_int>
c0008171:	83 c4 10             	add    $0x10,%esp
c0008174:	83 ec 0c             	sub    $0xc,%esp
c0008177:	68 af b4 00 c0       	push   $0xc000b4af
c000817c:	e8 0b 8f ff ff       	call   c000108c <disp_str>
c0008181:	83 c4 10             	add    $0x10,%esp
c0008184:	83 7d 08 0d          	cmpl   $0xd,0x8(%ebp)
c0008188:	75 11                	jne    c000819b <exception_handler+0x1de>
c000818a:	83 ec 0c             	sub    $0xc,%esp
c000818d:	68 2f b5 00 c0       	push   $0xc000b52f
c0008192:	e8 f5 8e ff ff       	call   c000108c <disp_str>
c0008197:	83 c4 10             	add    $0x10,%esp
c000819a:	90                   	nop
c000819b:	90                   	nop
c000819c:	8d 65 f4             	lea    -0xc(%ebp),%esp
c000819f:	5b                   	pop    %ebx
c00081a0:	5e                   	pop    %esi
c00081a1:	5f                   	pop    %edi
c00081a2:	5d                   	pop    %ebp
c00081a3:	c3                   	ret    

c00081a4 <init_internal_interrupt>:
c00081a4:	55                   	push   %ebp
c00081a5:	89 e5                	mov    %esp,%ebp
c00081a7:	83 ec 08             	sub    $0x8,%esp
c00081aa:	6a 0e                	push   $0xe
c00081ac:	6a 08                	push   $0x8
c00081ae:	68 03 11 00 c0       	push   $0xc0001103
c00081b3:	6a 00                	push   $0x0
c00081b5:	e8 a4 c7 ff ff       	call   c000495e <InitInterruptDesc>
c00081ba:	83 c4 10             	add    $0x10,%esp
c00081bd:	6a 0e                	push   $0xe
c00081bf:	6a 08                	push   $0x8
c00081c1:	68 09 11 00 c0       	push   $0xc0001109
c00081c6:	6a 01                	push   $0x1
c00081c8:	e8 91 c7 ff ff       	call   c000495e <InitInterruptDesc>
c00081cd:	83 c4 10             	add    $0x10,%esp
c00081d0:	6a 0e                	push   $0xe
c00081d2:	6a 08                	push   $0x8
c00081d4:	68 0f 11 00 c0       	push   $0xc000110f
c00081d9:	6a 02                	push   $0x2
c00081db:	e8 7e c7 ff ff       	call   c000495e <InitInterruptDesc>
c00081e0:	83 c4 10             	add    $0x10,%esp
c00081e3:	6a 0e                	push   $0xe
c00081e5:	6a 08                	push   $0x8
c00081e7:	68 15 11 00 c0       	push   $0xc0001115
c00081ec:	6a 03                	push   $0x3
c00081ee:	e8 6b c7 ff ff       	call   c000495e <InitInterruptDesc>
c00081f3:	83 c4 10             	add    $0x10,%esp
c00081f6:	6a 0e                	push   $0xe
c00081f8:	6a 08                	push   $0x8
c00081fa:	68 1b 11 00 c0       	push   $0xc000111b
c00081ff:	6a 04                	push   $0x4
c0008201:	e8 58 c7 ff ff       	call   c000495e <InitInterruptDesc>
c0008206:	83 c4 10             	add    $0x10,%esp
c0008209:	6a 0e                	push   $0xe
c000820b:	6a 08                	push   $0x8
c000820d:	68 21 11 00 c0       	push   $0xc0001121
c0008212:	6a 05                	push   $0x5
c0008214:	e8 45 c7 ff ff       	call   c000495e <InitInterruptDesc>
c0008219:	83 c4 10             	add    $0x10,%esp
c000821c:	6a 0e                	push   $0xe
c000821e:	6a 08                	push   $0x8
c0008220:	68 27 11 00 c0       	push   $0xc0001127
c0008225:	6a 06                	push   $0x6
c0008227:	e8 32 c7 ff ff       	call   c000495e <InitInterruptDesc>
c000822c:	83 c4 10             	add    $0x10,%esp
c000822f:	6a 0e                	push   $0xe
c0008231:	6a 08                	push   $0x8
c0008233:	68 2d 11 00 c0       	push   $0xc000112d
c0008238:	6a 07                	push   $0x7
c000823a:	e8 1f c7 ff ff       	call   c000495e <InitInterruptDesc>
c000823f:	83 c4 10             	add    $0x10,%esp
c0008242:	6a 0e                	push   $0xe
c0008244:	6a 08                	push   $0x8
c0008246:	68 33 11 00 c0       	push   $0xc0001133
c000824b:	6a 08                	push   $0x8
c000824d:	e8 0c c7 ff ff       	call   c000495e <InitInterruptDesc>
c0008252:	83 c4 10             	add    $0x10,%esp
c0008255:	6a 0e                	push   $0xe
c0008257:	6a 08                	push   $0x8
c0008259:	68 37 11 00 c0       	push   $0xc0001137
c000825e:	6a 09                	push   $0x9
c0008260:	e8 f9 c6 ff ff       	call   c000495e <InitInterruptDesc>
c0008265:	83 c4 10             	add    $0x10,%esp
c0008268:	6a 0e                	push   $0xe
c000826a:	6a 08                	push   $0x8
c000826c:	68 3d 11 00 c0       	push   $0xc000113d
c0008271:	6a 0a                	push   $0xa
c0008273:	e8 e6 c6 ff ff       	call   c000495e <InitInterruptDesc>
c0008278:	83 c4 10             	add    $0x10,%esp
c000827b:	6a 0e                	push   $0xe
c000827d:	6a 08                	push   $0x8
c000827f:	68 41 11 00 c0       	push   $0xc0001141
c0008284:	6a 0b                	push   $0xb
c0008286:	e8 d3 c6 ff ff       	call   c000495e <InitInterruptDesc>
c000828b:	83 c4 10             	add    $0x10,%esp
c000828e:	6a 0e                	push   $0xe
c0008290:	6a 08                	push   $0x8
c0008292:	68 45 11 00 c0       	push   $0xc0001145
c0008297:	6a 0c                	push   $0xc
c0008299:	e8 c0 c6 ff ff       	call   c000495e <InitInterruptDesc>
c000829e:	83 c4 10             	add    $0x10,%esp
c00082a1:	6a 0e                	push   $0xe
c00082a3:	6a 08                	push   $0x8
c00082a5:	68 49 11 00 c0       	push   $0xc0001149
c00082aa:	6a 0d                	push   $0xd
c00082ac:	e8 ad c6 ff ff       	call   c000495e <InitInterruptDesc>
c00082b1:	83 c4 10             	add    $0x10,%esp
c00082b4:	6a 0e                	push   $0xe
c00082b6:	6a 08                	push   $0x8
c00082b8:	68 54 11 00 c0       	push   $0xc0001154
c00082bd:	6a 0e                	push   $0xe
c00082bf:	e8 9a c6 ff ff       	call   c000495e <InitInterruptDesc>
c00082c4:	83 c4 10             	add    $0x10,%esp
c00082c7:	6a 0e                	push   $0xe
c00082c9:	6a 08                	push   $0x8
c00082cb:	68 58 11 00 c0       	push   $0xc0001158
c00082d0:	6a 10                	push   $0x10
c00082d2:	e8 87 c6 ff ff       	call   c000495e <InitInterruptDesc>
c00082d7:	83 c4 10             	add    $0x10,%esp
c00082da:	6a 0e                	push   $0xe
c00082dc:	6a 08                	push   $0x8
c00082de:	68 5e 11 00 c0       	push   $0xc000115e
c00082e3:	6a 11                	push   $0x11
c00082e5:	e8 74 c6 ff ff       	call   c000495e <InitInterruptDesc>
c00082ea:	83 c4 10             	add    $0x10,%esp
c00082ed:	6a 0e                	push   $0xe
c00082ef:	6a 08                	push   $0x8
c00082f1:	68 62 11 00 c0       	push   $0xc0001162
c00082f6:	6a 12                	push   $0x12
c00082f8:	e8 61 c6 ff ff       	call   c000495e <InitInterruptDesc>
c00082fd:	83 c4 10             	add    $0x10,%esp
c0008300:	6a 0e                	push   $0xe
c0008302:	6a 0e                	push   $0xe
c0008304:	68 1e 12 00 c0       	push   $0xc000121e
c0008309:	68 90 00 00 00       	push   $0x90
c000830e:	e8 4b c6 ff ff       	call   c000495e <InitInterruptDesc>
c0008313:	83 c4 10             	add    $0x10,%esp
c0008316:	90                   	nop
c0008317:	c9                   	leave  
c0008318:	c3                   	ret    

c0008319 <spurious_irq>:
c0008319:	55                   	push   %ebp
c000831a:	89 e5                	mov    %esp,%ebp
c000831c:	83 ec 08             	sub    $0x8,%esp
c000831f:	83 ec 08             	sub    $0x8,%esp
c0008322:	6a 0b                	push   $0xb
c0008324:	68 8c b7 00 c0       	push   $0xc000b78c
c0008329:	e8 99 8d ff ff       	call   c00010c7 <disp_str_colour>
c000832e:	83 c4 10             	add    $0x10,%esp
c0008331:	83 ec 0c             	sub    $0xc,%esp
c0008334:	ff 75 08             	pushl  0x8(%ebp)
c0008337:	e8 1b fb ff ff       	call   c0007e57 <disp_int>
c000833c:	83 c4 10             	add    $0x10,%esp
c000833f:	a1 e8 1e 01 c0       	mov    0xc0011ee8,%eax
c0008344:	8b 15 ec 1e 01 c0    	mov    0xc0011eec,%edx
c000834a:	83 c0 01             	add    $0x1,%eax
c000834d:	83 d2 00             	adc    $0x0,%edx
c0008350:	a3 e8 1e 01 c0       	mov    %eax,0xc0011ee8
c0008355:	89 15 ec 1e 01 c0    	mov    %edx,0xc0011eec
c000835b:	83 ec 0c             	sub    $0xc,%esp
c000835e:	68 b3 b7 00 c0       	push   $0xc000b7b3
c0008363:	e8 24 8d ff ff       	call   c000108c <disp_str>
c0008368:	83 c4 10             	add    $0x10,%esp
c000836b:	a1 e8 1e 01 c0       	mov    0xc0011ee8,%eax
c0008370:	8b 15 ec 1e 01 c0    	mov    0xc0011eec,%edx
c0008376:	83 ec 0c             	sub    $0xc,%esp
c0008379:	50                   	push   %eax
c000837a:	e8 d8 fa ff ff       	call   c0007e57 <disp_int>
c000837f:	83 c4 10             	add    $0x10,%esp
c0008382:	83 ec 0c             	sub    $0xc,%esp
c0008385:	68 b5 b7 00 c0       	push   $0xc000b7b5
c000838a:	e8 fd 8c ff ff       	call   c000108c <disp_str>
c000838f:	83 c4 10             	add    $0x10,%esp
c0008392:	83 ec 08             	sub    $0x8,%esp
c0008395:	6a 0c                	push   $0xc
c0008397:	68 b8 b7 00 c0       	push   $0xc000b7b8
c000839c:	e8 26 8d ff ff       	call   c00010c7 <disp_str_colour>
c00083a1:	83 c4 10             	add    $0x10,%esp
c00083a4:	90                   	nop
c00083a5:	c9                   	leave  
c00083a6:	c3                   	ret    

c00083a7 <init_keyboard>:
c00083a7:	55                   	push   %ebp
c00083a8:	89 e5                	mov    %esp,%ebp
c00083aa:	83 ec 18             	sub    $0x18,%esp
c00083ad:	83 ec 04             	sub    $0x4,%esp
c00083b0:	68 00 02 00 00       	push   $0x200
c00083b5:	6a 00                	push   $0x0
c00083b7:	68 ec 0b 01 c0       	push   $0xc0010bec
c00083bc:	e8 5e 38 00 00       	call   c000bc1f <Memset>
c00083c1:	83 c4 10             	add    $0x10,%esp
c00083c4:	c7 05 e0 0b 01 c0 ec 	movl   $0xc0010bec,0xc0010be0
c00083cb:	0b 01 c0 
c00083ce:	a1 e0 0b 01 c0       	mov    0xc0010be0,%eax
c00083d3:	a3 e4 0b 01 c0       	mov    %eax,0xc0010be4
c00083d8:	c7 05 e8 0b 01 c0 00 	movl   $0x0,0xc0010be8
c00083df:	00 00 00 
c00083e2:	c7 05 a4 07 01 c0 00 	movl   $0x0,0xc00107a4
c00083e9:	00 00 00 
c00083ec:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00083f3:	eb 04                	jmp    c00083f9 <init_keyboard+0x52>
c00083f5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00083f9:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c0008400:	7e f3                	jle    c00083f5 <init_keyboard+0x4e>
c0008402:	c7 05 a4 07 01 c0 00 	movl   $0x0,0xc00107a4
c0008409:	00 00 00 
c000840c:	e8 67 d3 ff ff       	call   c0005778 <init_keyboard_handler>
c0008411:	90                   	nop
c0008412:	c9                   	leave  
c0008413:	c3                   	ret    

c0008414 <TestTTY>:
c0008414:	55                   	push   %ebp
c0008415:	89 e5                	mov    %esp,%ebp
c0008417:	83 ec 28             	sub    $0x28,%esp
c000841a:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0008421:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0008428:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c000842e:	83 ec 08             	sub    $0x8,%esp
c0008431:	6a 02                	push   $0x2
c0008433:	8d 45 de             	lea    -0x22(%ebp),%eax
c0008436:	50                   	push   %eax
c0008437:	e8 e2 d4 ff ff       	call   c000591e <open>
c000843c:	83 c4 10             	add    $0x10,%esp
c000843f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008442:	83 ec 08             	sub    $0x8,%esp
c0008445:	6a 02                	push   $0x2
c0008447:	8d 45 de             	lea    -0x22(%ebp),%eax
c000844a:	50                   	push   %eax
c000844b:	e8 ce d4 ff ff       	call   c000591e <open>
c0008450:	83 c4 10             	add    $0x10,%esp
c0008453:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008456:	83 ec 0c             	sub    $0xc,%esp
c0008459:	68 dd b7 00 c0       	push   $0xc000b7dd
c000845e:	e8 87 0c 00 00       	call   c00090ea <Printf>
c0008463:	83 c4 10             	add    $0x10,%esp
c0008466:	83 ec 0c             	sub    $0xc,%esp
c0008469:	6a 0a                	push   $0xa
c000846b:	e8 fc 9f ff ff       	call   c000246c <sys_malloc>
c0008470:	83 c4 10             	add    $0x10,%esp
c0008473:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008476:	83 ec 04             	sub    $0x4,%esp
c0008479:	6a 0a                	push   $0xa
c000847b:	6a 00                	push   $0x0
c000847d:	ff 75 ec             	pushl  -0x14(%ebp)
c0008480:	e8 9a 37 00 00       	call   c000bc1f <Memset>
c0008485:	83 c4 10             	add    $0x10,%esp
c0008488:	83 ec 04             	sub    $0x4,%esp
c000848b:	6a 0a                	push   $0xa
c000848d:	ff 75 ec             	pushl  -0x14(%ebp)
c0008490:	ff 75 f0             	pushl  -0x10(%ebp)
c0008493:	e8 1b d5 ff ff       	call   c00059b3 <read>
c0008498:	83 c4 10             	add    $0x10,%esp
c000849b:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000849e:	83 ec 08             	sub    $0x8,%esp
c00084a1:	ff 75 ec             	pushl  -0x14(%ebp)
c00084a4:	68 ef b7 00 c0       	push   $0xc000b7ef
c00084a9:	e8 3c 0c 00 00       	call   c00090ea <Printf>
c00084ae:	83 c4 10             	add    $0x10,%esp
c00084b1:	eb c3                	jmp    c0008476 <TestTTY+0x62>

c00084b3 <TestFS>:
c00084b3:	55                   	push   %ebp
c00084b4:	89 e5                	mov    %esp,%ebp
c00084b6:	81 ec 28 01 00 00    	sub    $0x128,%esp
c00084bc:	83 ec 0c             	sub    $0xc,%esp
c00084bf:	68 f9 b7 00 c0       	push   $0xc000b7f9
c00084c4:	e8 c3 8b ff ff       	call   c000108c <disp_str>
c00084c9:	83 c4 10             	add    $0x10,%esp
c00084cc:	c7 45 be 64 65 76 5f 	movl   $0x5f766564,-0x42(%ebp)
c00084d3:	c7 45 c2 74 74 79 31 	movl   $0x31797474,-0x3e(%ebp)
c00084da:	66 c7 45 c6 00 00    	movw   $0x0,-0x3a(%ebp)
c00084e0:	66 87 db             	xchg   %bx,%bx
c00084e3:	83 ec 08             	sub    $0x8,%esp
c00084e6:	6a 02                	push   $0x2
c00084e8:	8d 45 be             	lea    -0x42(%ebp),%eax
c00084eb:	50                   	push   %eax
c00084ec:	e8 2d d4 ff ff       	call   c000591e <open>
c00084f1:	83 c4 10             	add    $0x10,%esp
c00084f4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00084f7:	66 87 db             	xchg   %bx,%bx
c00084fa:	83 ec 08             	sub    $0x8,%esp
c00084fd:	6a 02                	push   $0x2
c00084ff:	8d 45 be             	lea    -0x42(%ebp),%eax
c0008502:	50                   	push   %eax
c0008503:	e8 16 d4 ff ff       	call   c000591e <open>
c0008508:	83 c4 10             	add    $0x10,%esp
c000850b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000850e:	66 87 db             	xchg   %bx,%bx
c0008511:	83 ec 0c             	sub    $0xc,%esp
c0008514:	68 dd b7 00 c0       	push   $0xc000b7dd
c0008519:	e8 cc 0b 00 00       	call   c00090ea <Printf>
c000851e:	83 c4 10             	add    $0x10,%esp
c0008521:	66 87 db             	xchg   %bx,%bx
c0008524:	c7 45 b9 41 43 00 00 	movl   $0x4341,-0x47(%ebp)
c000852b:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
c000852f:	c7 45 b4 63 41 42 00 	movl   $0x424163,-0x4c(%ebp)
c0008536:	c6 45 b8 00          	movb   $0x0,-0x48(%ebp)
c000853a:	c7 45 aa 49 4e 54 45 	movl   $0x45544e49,-0x56(%ebp)
c0008541:	c7 45 ae 52 52 55 50 	movl   $0x50555252,-0x52(%ebp)
c0008548:	66 c7 45 b2 54 00    	movw   $0x54,-0x4e(%ebp)
c000854e:	66 87 db             	xchg   %bx,%bx
c0008551:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c0008558:	66 87 db             	xchg   %bx,%bx
c000855b:	83 ec 0c             	sub    $0xc,%esp
c000855e:	68 01 b8 00 c0       	push   $0xc000b801
c0008563:	e8 82 0b 00 00       	call   c00090ea <Printf>
c0008568:	83 c4 10             	add    $0x10,%esp
c000856b:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c000856f:	0f 85 43 03 00 00    	jne    c00088b8 <TestFS+0x405>
c0008575:	83 ec 08             	sub    $0x8,%esp
c0008578:	6a 07                	push   $0x7
c000857a:	8d 45 b9             	lea    -0x47(%ebp),%eax
c000857d:	50                   	push   %eax
c000857e:	e8 9b d3 ff ff       	call   c000591e <open>
c0008583:	83 c4 10             	add    $0x10,%esp
c0008586:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0008589:	83 ec 08             	sub    $0x8,%esp
c000858c:	ff 75 e4             	pushl  -0x1c(%ebp)
c000858f:	68 19 b8 00 c0       	push   $0xc000b819
c0008594:	e8 51 0b 00 00       	call   c00090ea <Printf>
c0008599:	83 c4 10             	add    $0x10,%esp
c000859c:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00085a3:	c7 45 96 63 67 3a 68 	movl   $0x683a6763,-0x6a(%ebp)
c00085aa:	c7 45 9a 65 6c 6c 6f 	movl   $0x6f6c6c65,-0x66(%ebp)
c00085b1:	c7 45 9e 2c 77 6f 72 	movl   $0x726f772c,-0x62(%ebp)
c00085b8:	c7 45 a2 6c 64 21 00 	movl   $0x21646c,-0x5e(%ebp)
c00085bf:	c7 45 a6 00 00 00 00 	movl   $0x0,-0x5a(%ebp)
c00085c6:	83 ec 0c             	sub    $0xc,%esp
c00085c9:	8d 45 96             	lea    -0x6a(%ebp),%eax
c00085cc:	50                   	push   %eax
c00085cd:	e8 86 36 00 00       	call   c000bc58 <Strlen>
c00085d2:	83 c4 10             	add    $0x10,%esp
c00085d5:	83 ec 04             	sub    $0x4,%esp
c00085d8:	50                   	push   %eax
c00085d9:	8d 45 96             	lea    -0x6a(%ebp),%eax
c00085dc:	50                   	push   %eax
c00085dd:	ff 75 e4             	pushl  -0x1c(%ebp)
c00085e0:	e8 4f d5 ff ff       	call   c0005b34 <write>
c00085e5:	83 c4 10             	add    $0x10,%esp
c00085e8:	83 ec 04             	sub    $0x4,%esp
c00085eb:	6a 14                	push   $0x14
c00085ed:	6a 00                	push   $0x0
c00085ef:	8d 45 82             	lea    -0x7e(%ebp),%eax
c00085f2:	50                   	push   %eax
c00085f3:	e8 27 36 00 00       	call   c000bc1f <Memset>
c00085f8:	83 c4 10             	add    $0x10,%esp
c00085fb:	83 ec 04             	sub    $0x4,%esp
c00085fe:	6a 12                	push   $0x12
c0008600:	8d 45 82             	lea    -0x7e(%ebp),%eax
c0008603:	50                   	push   %eax
c0008604:	ff 75 e4             	pushl  -0x1c(%ebp)
c0008607:	e8 a7 d3 ff ff       	call   c00059b3 <read>
c000860c:	83 c4 10             	add    $0x10,%esp
c000860f:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0008612:	83 ec 08             	sub    $0x8,%esp
c0008615:	8d 45 82             	lea    -0x7e(%ebp),%eax
c0008618:	50                   	push   %eax
c0008619:	68 22 b8 00 c0       	push   $0xc000b822
c000861e:	e8 c7 0a 00 00       	call   c00090ea <Printf>
c0008623:	83 c4 10             	add    $0x10,%esp
c0008626:	66 87 db             	xchg   %bx,%bx
c0008629:	83 ec 0c             	sub    $0xc,%esp
c000862c:	6a 0a                	push   $0xa
c000862e:	e8 83 09 00 00       	call   c0008fb6 <delay>
c0008633:	83 c4 10             	add    $0x10,%esp
c0008636:	83 ec 08             	sub    $0x8,%esp
c0008639:	6a 07                	push   $0x7
c000863b:	8d 45 b4             	lea    -0x4c(%ebp),%eax
c000863e:	50                   	push   %eax
c000863f:	e8 da d2 ff ff       	call   c000591e <open>
c0008644:	83 c4 10             	add    $0x10,%esp
c0008647:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000864a:	83 ec 08             	sub    $0x8,%esp
c000864d:	ff 75 dc             	pushl  -0x24(%ebp)
c0008650:	68 2d b8 00 c0       	push   $0xc000b82d
c0008655:	e8 90 0a 00 00       	call   c00090ea <Printf>
c000865a:	83 c4 10             	add    $0x10,%esp
c000865d:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0008664:	c7 85 6e ff ff ff 63 	movl   $0x683a6763,-0x92(%ebp)
c000866b:	67 3a 68 
c000866e:	c7 85 72 ff ff ff 6f 	movl   $0x6120776f,-0x8e(%ebp)
c0008675:	77 20 61 
c0008678:	c7 85 76 ff ff ff 72 	movl   $0x79206572,-0x8a(%ebp)
c000867f:	65 20 79 
c0008682:	c7 85 7a ff ff ff 6f 	movl   $0x3f756f,-0x86(%ebp)
c0008689:	75 3f 00 
c000868c:	c7 85 7e ff ff ff 00 	movl   $0x0,-0x82(%ebp)
c0008693:	00 00 00 
c0008696:	83 ec 0c             	sub    $0xc,%esp
c0008699:	8d 85 6e ff ff ff    	lea    -0x92(%ebp),%eax
c000869f:	50                   	push   %eax
c00086a0:	e8 b3 35 00 00       	call   c000bc58 <Strlen>
c00086a5:	83 c4 10             	add    $0x10,%esp
c00086a8:	83 ec 04             	sub    $0x4,%esp
c00086ab:	50                   	push   %eax
c00086ac:	8d 85 6e ff ff ff    	lea    -0x92(%ebp),%eax
c00086b2:	50                   	push   %eax
c00086b3:	ff 75 dc             	pushl  -0x24(%ebp)
c00086b6:	e8 79 d4 ff ff       	call   c0005b34 <write>
c00086bb:	83 c4 10             	add    $0x10,%esp
c00086be:	83 ec 04             	sub    $0x4,%esp
c00086c1:	6a 14                	push   $0x14
c00086c3:	6a 00                	push   $0x0
c00086c5:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c00086cb:	50                   	push   %eax
c00086cc:	e8 4e 35 00 00       	call   c000bc1f <Memset>
c00086d1:	83 c4 10             	add    $0x10,%esp
c00086d4:	83 ec 04             	sub    $0x4,%esp
c00086d7:	6a 12                	push   $0x12
c00086d9:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c00086df:	50                   	push   %eax
c00086e0:	ff 75 dc             	pushl  -0x24(%ebp)
c00086e3:	e8 cb d2 ff ff       	call   c00059b3 <read>
c00086e8:	83 c4 10             	add    $0x10,%esp
c00086eb:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00086ee:	83 ec 08             	sub    $0x8,%esp
c00086f1:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c00086f7:	50                   	push   %eax
c00086f8:	68 37 b8 00 c0       	push   $0xc000b837
c00086fd:	e8 e8 09 00 00       	call   c00090ea <Printf>
c0008702:	83 c4 10             	add    $0x10,%esp
c0008705:	83 ec 08             	sub    $0x8,%esp
c0008708:	6a 07                	push   $0x7
c000870a:	8d 45 aa             	lea    -0x56(%ebp),%eax
c000870d:	50                   	push   %eax
c000870e:	e8 0b d2 ff ff       	call   c000591e <open>
c0008713:	83 c4 10             	add    $0x10,%esp
c0008716:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0008719:	83 ec 08             	sub    $0x8,%esp
c000871c:	ff 75 dc             	pushl  -0x24(%ebp)
c000871f:	68 2d b8 00 c0       	push   $0xc000b82d
c0008724:	e8 c1 09 00 00       	call   c00090ea <Printf>
c0008729:	83 c4 10             	add    $0x10,%esp
c000872c:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0008733:	c7 85 3c ff ff ff 49 	movl   $0x69772049,-0xc4(%ebp)
c000873a:	20 77 69 
c000873d:	c7 85 40 ff ff ff 6c 	movl   $0x73206c6c,-0xc0(%ebp)
c0008744:	6c 20 73 
c0008747:	c7 85 44 ff ff ff 75 	movl   $0x65636375,-0xbc(%ebp)
c000874e:	63 63 65 
c0008751:	c7 85 48 ff ff ff 73 	movl   $0x61207373,-0xb8(%ebp)
c0008758:	73 20 61 
c000875b:	c7 85 4c ff ff ff 74 	movl   $0x616c2074,-0xb4(%ebp)
c0008762:	20 6c 61 
c0008765:	c7 85 50 ff ff ff 73 	movl   $0x2e7473,-0xb0(%ebp)
c000876c:	74 2e 00 
c000876f:	c7 85 54 ff ff ff 00 	movl   $0x0,-0xac(%ebp)
c0008776:	00 00 00 
c0008779:	66 c7 85 58 ff ff ff 	movw   $0x0,-0xa8(%ebp)
c0008780:	00 00 
c0008782:	83 ec 0c             	sub    $0xc,%esp
c0008785:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c000878b:	50                   	push   %eax
c000878c:	e8 c7 34 00 00       	call   c000bc58 <Strlen>
c0008791:	83 c4 10             	add    $0x10,%esp
c0008794:	83 ec 04             	sub    $0x4,%esp
c0008797:	50                   	push   %eax
c0008798:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c000879e:	50                   	push   %eax
c000879f:	ff 75 d4             	pushl  -0x2c(%ebp)
c00087a2:	e8 8d d3 ff ff       	call   c0005b34 <write>
c00087a7:	83 c4 10             	add    $0x10,%esp
c00087aa:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00087b1:	eb 5c                	jmp    c000880f <TestFS+0x35c>
c00087b3:	83 ec 04             	sub    $0x4,%esp
c00087b6:	6a 1e                	push   $0x1e
c00087b8:	6a 00                	push   $0x0
c00087ba:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c00087c0:	50                   	push   %eax
c00087c1:	e8 59 34 00 00       	call   c000bc1f <Memset>
c00087c6:	83 c4 10             	add    $0x10,%esp
c00087c9:	83 ec 0c             	sub    $0xc,%esp
c00087cc:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c00087d2:	50                   	push   %eax
c00087d3:	e8 80 34 00 00       	call   c000bc58 <Strlen>
c00087d8:	83 c4 10             	add    $0x10,%esp
c00087db:	83 ec 04             	sub    $0x4,%esp
c00087de:	50                   	push   %eax
c00087df:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c00087e5:	50                   	push   %eax
c00087e6:	ff 75 d4             	pushl  -0x2c(%ebp)
c00087e9:	e8 c5 d1 ff ff       	call   c00059b3 <read>
c00087ee:	83 c4 10             	add    $0x10,%esp
c00087f1:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00087f4:	83 ec 08             	sub    $0x8,%esp
c00087f7:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c00087fd:	50                   	push   %eax
c00087fe:	68 42 b8 00 c0       	push   $0xc000b842
c0008803:	e8 e2 08 00 00       	call   c00090ea <Printf>
c0008808:	83 c4 10             	add    $0x10,%esp
c000880b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000880f:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c0008813:	7e 9e                	jle    c00087b3 <TestFS+0x300>
c0008815:	c7 85 0a ff ff ff 69 	movl   $0x74736e69,-0xf6(%ebp)
c000881c:	6e 73 74 
c000881f:	c7 85 0e ff ff ff 61 	movl   $0x2e6c6c61,-0xf2(%ebp)
c0008826:	6c 6c 2e 
c0008829:	c7 85 12 ff ff ff 74 	movl   $0x726174,-0xee(%ebp)
c0008830:	61 72 00 
c0008833:	c7 85 16 ff ff ff 00 	movl   $0x0,-0xea(%ebp)
c000883a:	00 00 00 
c000883d:	c7 85 1a ff ff ff 00 	movl   $0x0,-0xe6(%ebp)
c0008844:	00 00 00 
c0008847:	83 ec 08             	sub    $0x8,%esp
c000884a:	6a 00                	push   $0x0
c000884c:	8d 85 0a ff ff ff    	lea    -0xf6(%ebp),%eax
c0008852:	50                   	push   %eax
c0008853:	e8 c6 d0 ff ff       	call   c000591e <open>
c0008858:	83 c4 10             	add    $0x10,%esp
c000885b:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000885e:	83 ec 08             	sub    $0x8,%esp
c0008861:	ff 75 cc             	pushl  -0x34(%ebp)
c0008864:	68 4d b8 00 c0       	push   $0xc000b84d
c0008869:	e8 7c 08 00 00       	call   c00090ea <Printf>
c000886e:	83 c4 10             	add    $0x10,%esp
c0008871:	83 ec 04             	sub    $0x4,%esp
c0008874:	6a 28                	push   $0x28
c0008876:	6a 00                	push   $0x0
c0008878:	8d 85 e2 fe ff ff    	lea    -0x11e(%ebp),%eax
c000887e:	50                   	push   %eax
c000887f:	e8 9b 33 00 00       	call   c000bc1f <Memset>
c0008884:	83 c4 10             	add    $0x10,%esp
c0008887:	83 ec 04             	sub    $0x4,%esp
c000888a:	6a 28                	push   $0x28
c000888c:	8d 85 e2 fe ff ff    	lea    -0x11e(%ebp),%eax
c0008892:	50                   	push   %eax
c0008893:	ff 75 cc             	pushl  -0x34(%ebp)
c0008896:	e8 18 d1 ff ff       	call   c00059b3 <read>
c000889b:	83 c4 10             	add    $0x10,%esp
c000889e:	89 45 c8             	mov    %eax,-0x38(%ebp)
c00088a1:	83 ec 08             	sub    $0x8,%esp
c00088a4:	8d 85 e2 fe ff ff    	lea    -0x11e(%ebp),%eax
c00088aa:	50                   	push   %eax
c00088ab:	68 57 b8 00 c0       	push   $0xc000b857
c00088b0:	e8 35 08 00 00       	call   c00090ea <Printf>
c00088b5:	83 c4 10             	add    $0x10,%esp
c00088b8:	90                   	nop
c00088b9:	c9                   	leave  
c00088ba:	c3                   	ret    

c00088bb <wait_exit>:
c00088bb:	55                   	push   %ebp
c00088bc:	89 e5                	mov    %esp,%ebp
c00088be:	83 ec 28             	sub    $0x28,%esp
c00088c1:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c00088c8:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c00088cf:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c00088d5:	83 ec 08             	sub    $0x8,%esp
c00088d8:	6a 02                	push   $0x2
c00088da:	8d 45 de             	lea    -0x22(%ebp),%eax
c00088dd:	50                   	push   %eax
c00088de:	e8 3b d0 ff ff       	call   c000591e <open>
c00088e3:	83 c4 10             	add    $0x10,%esp
c00088e6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00088e9:	83 ec 08             	sub    $0x8,%esp
c00088ec:	6a 02                	push   $0x2
c00088ee:	8d 45 de             	lea    -0x22(%ebp),%eax
c00088f1:	50                   	push   %eax
c00088f2:	e8 27 d0 ff ff       	call   c000591e <open>
c00088f7:	83 c4 10             	add    $0x10,%esp
c00088fa:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00088fd:	e8 7c d3 ff ff       	call   c0005c7e <fork>
c0008902:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008905:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0008909:	7e 25                	jle    c0008930 <wait_exit+0x75>
c000890b:	83 ec 0c             	sub    $0xc,%esp
c000890e:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0008911:	50                   	push   %eax
c0008912:	e8 f4 d2 ff ff       	call   c0005c0b <wait>
c0008917:	83 c4 10             	add    $0x10,%esp
c000891a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000891d:	83 ec 08             	sub    $0x8,%esp
c0008920:	50                   	push   %eax
c0008921:	68 62 b8 00 c0       	push   $0xc000b862
c0008926:	e8 bf 07 00 00       	call   c00090ea <Printf>
c000892b:	83 c4 10             	add    $0x10,%esp
c000892e:	eb fe                	jmp    c000892e <wait_exit+0x73>
c0008930:	83 ec 0c             	sub    $0xc,%esp
c0008933:	68 7d b8 00 c0       	push   $0xc000b87d
c0008938:	e8 ad 07 00 00       	call   c00090ea <Printf>
c000893d:	83 c4 10             	add    $0x10,%esp
c0008940:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008947:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000894a:	8d 50 01             	lea    0x1(%eax),%edx
c000894d:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0008950:	3d 50 c3 00 00       	cmp    $0xc350,%eax
c0008955:	7f 02                	jg     c0008959 <wait_exit+0x9e>
c0008957:	eb ee                	jmp    c0008947 <wait_exit+0x8c>
c0008959:	90                   	nop
c000895a:	83 ec 0c             	sub    $0xc,%esp
c000895d:	68 89 b8 00 c0       	push   $0xc000b889
c0008962:	e8 83 07 00 00       	call   c00090ea <Printf>
c0008967:	83 c4 10             	add    $0x10,%esp
c000896a:	83 ec 0c             	sub    $0xc,%esp
c000896d:	6a 09                	push   $0x9
c000896f:	e8 db d2 ff ff       	call   c0005c4f <exit>
c0008974:	83 c4 10             	add    $0x10,%esp
c0008977:	83 ec 0c             	sub    $0xc,%esp
c000897a:	68 97 b8 00 c0       	push   $0xc000b897
c000897f:	e8 66 07 00 00       	call   c00090ea <Printf>
c0008984:	83 c4 10             	add    $0x10,%esp
c0008987:	eb fe                	jmp    c0008987 <wait_exit+0xcc>

c0008989 <INIT_fork>:
c0008989:	55                   	push   %ebp
c000898a:	89 e5                	mov    %esp,%ebp
c000898c:	83 ec 78             	sub    $0x78,%esp
c000898f:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0008996:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c000899d:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c00089a3:	83 ec 08             	sub    $0x8,%esp
c00089a6:	6a 02                	push   $0x2
c00089a8:	8d 45 de             	lea    -0x22(%ebp),%eax
c00089ab:	50                   	push   %eax
c00089ac:	e8 6d cf ff ff       	call   c000591e <open>
c00089b1:	83 c4 10             	add    $0x10,%esp
c00089b4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00089b7:	83 ec 08             	sub    $0x8,%esp
c00089ba:	6a 02                	push   $0x2
c00089bc:	8d 45 de             	lea    -0x22(%ebp),%eax
c00089bf:	50                   	push   %eax
c00089c0:	e8 59 cf ff ff       	call   c000591e <open>
c00089c5:	83 c4 10             	add    $0x10,%esp
c00089c8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00089cb:	c7 45 b6 49 4e 49 54 	movl   $0x54494e49,-0x4a(%ebp)
c00089d2:	c7 45 ba 20 69 73 20 	movl   $0x20736920,-0x46(%ebp)
c00089d9:	c7 45 be 72 75 6e 6e 	movl   $0x6e6e7572,-0x42(%ebp)
c00089e0:	c7 45 c2 69 6e 67 0a 	movl   $0xa676e69,-0x3e(%ebp)
c00089e7:	c7 45 c6 00 00 00 00 	movl   $0x0,-0x3a(%ebp)
c00089ee:	c7 45 ca 00 00 00 00 	movl   $0x0,-0x36(%ebp)
c00089f5:	c7 45 ce 00 00 00 00 	movl   $0x0,-0x32(%ebp)
c00089fc:	c7 45 d2 00 00 00 00 	movl   $0x0,-0x2e(%ebp)
c0008a03:	c7 45 d6 00 00 00 00 	movl   $0x0,-0x2a(%ebp)
c0008a0a:	c7 45 da 00 00 00 00 	movl   $0x0,-0x26(%ebp)
c0008a11:	83 ec 0c             	sub    $0xc,%esp
c0008a14:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008a17:	50                   	push   %eax
c0008a18:	e8 cd 06 00 00       	call   c00090ea <Printf>
c0008a1d:	83 c4 10             	add    $0x10,%esp
c0008a20:	83 ec 0c             	sub    $0xc,%esp
c0008a23:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008a26:	50                   	push   %eax
c0008a27:	e8 2c 32 00 00       	call   c000bc58 <Strlen>
c0008a2c:	83 c4 10             	add    $0x10,%esp
c0008a2f:	83 ec 04             	sub    $0x4,%esp
c0008a32:	50                   	push   %eax
c0008a33:	6a 00                	push   $0x0
c0008a35:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008a38:	50                   	push   %eax
c0008a39:	e8 e1 31 00 00       	call   c000bc1f <Memset>
c0008a3e:	83 c4 10             	add    $0x10,%esp
c0008a41:	83 ec 04             	sub    $0x4,%esp
c0008a44:	6a 28                	push   $0x28
c0008a46:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008a49:	50                   	push   %eax
c0008a4a:	ff 75 f0             	pushl  -0x10(%ebp)
c0008a4d:	e8 61 cf ff ff       	call   c00059b3 <read>
c0008a52:	83 c4 10             	add    $0x10,%esp
c0008a55:	83 ec 0c             	sub    $0xc,%esp
c0008a58:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008a5b:	50                   	push   %eax
c0008a5c:	e8 89 06 00 00       	call   c00090ea <Printf>
c0008a61:	83 c4 10             	add    $0x10,%esp
c0008a64:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0008a6b:	e8 0e d2 ff ff       	call   c0005c7e <fork>
c0008a70:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008a73:	83 ec 0c             	sub    $0xc,%esp
c0008a76:	6a 01                	push   $0x1
c0008a78:	e8 39 05 00 00       	call   c0008fb6 <delay>
c0008a7d:	83 c4 10             	add    $0x10,%esp
c0008a80:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0008a84:	0f 8e c5 00 00 00    	jle    c0008b4f <INIT_fork+0x1c6>
c0008a8a:	83 ec 0c             	sub    $0xc,%esp
c0008a8d:	68 a5 b8 00 c0       	push   $0xc000b8a5
c0008a92:	e8 53 06 00 00       	call   c00090ea <Printf>
c0008a97:	83 c4 10             	add    $0x10,%esp
c0008a9a:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0008a9e:	c7 45 8e 50 61 72 65 	movl   $0x65726150,-0x72(%ebp)
c0008aa5:	c7 45 92 6e 74 2e 4e 	movl   $0x4e2e746e,-0x6e(%ebp)
c0008aac:	c7 45 96 69 63 65 20 	movl   $0x20656369,-0x6a(%ebp)
c0008ab3:	c7 45 9a 74 6f 20 6d 	movl   $0x6d206f74,-0x66(%ebp)
c0008aba:	c7 45 9e 65 65 74 20 	movl   $0x20746565,-0x62(%ebp)
c0008ac1:	c7 45 a2 79 6f 75 21 	movl   $0x21756f79,-0x5e(%ebp)
c0008ac8:	c7 45 a6 0a 00 00 00 	movl   $0xa,-0x5a(%ebp)
c0008acf:	c7 45 aa 00 00 00 00 	movl   $0x0,-0x56(%ebp)
c0008ad6:	c7 45 ae 00 00 00 00 	movl   $0x0,-0x52(%ebp)
c0008add:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)
c0008ae4:	83 ec 0c             	sub    $0xc,%esp
c0008ae7:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008aea:	50                   	push   %eax
c0008aeb:	e8 68 31 00 00       	call   c000bc58 <Strlen>
c0008af0:	83 c4 10             	add    $0x10,%esp
c0008af3:	83 ec 04             	sub    $0x4,%esp
c0008af6:	50                   	push   %eax
c0008af7:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008afa:	50                   	push   %eax
c0008afb:	ff 75 f4             	pushl  -0xc(%ebp)
c0008afe:	e8 31 d0 ff ff       	call   c0005b34 <write>
c0008b03:	83 c4 10             	add    $0x10,%esp
c0008b06:	83 ec 0c             	sub    $0xc,%esp
c0008b09:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008b0c:	50                   	push   %eax
c0008b0d:	e8 46 31 00 00       	call   c000bc58 <Strlen>
c0008b12:	83 c4 10             	add    $0x10,%esp
c0008b15:	83 ec 04             	sub    $0x4,%esp
c0008b18:	50                   	push   %eax
c0008b19:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008b1c:	50                   	push   %eax
c0008b1d:	ff 75 f4             	pushl  -0xc(%ebp)
c0008b20:	e8 0f d0 ff ff       	call   c0005b34 <write>
c0008b25:	83 c4 10             	add    $0x10,%esp
c0008b28:	83 ec 0c             	sub    $0xc,%esp
c0008b2b:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008b2e:	50                   	push   %eax
c0008b2f:	e8 24 31 00 00       	call   c000bc58 <Strlen>
c0008b34:	83 c4 10             	add    $0x10,%esp
c0008b37:	83 ec 04             	sub    $0x4,%esp
c0008b3a:	50                   	push   %eax
c0008b3b:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008b3e:	50                   	push   %eax
c0008b3f:	ff 75 f4             	pushl  -0xc(%ebp)
c0008b42:	e8 ed cf ff ff       	call   c0005b34 <write>
c0008b47:	83 c4 10             	add    $0x10,%esp
c0008b4a:	e9 c3 00 00 00       	jmp    c0008c12 <INIT_fork+0x289>
c0008b4f:	83 ec 0c             	sub    $0xc,%esp
c0008b52:	6a 01                	push   $0x1
c0008b54:	e8 5d 04 00 00       	call   c0008fb6 <delay>
c0008b59:	83 c4 10             	add    $0x10,%esp
c0008b5c:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0008b60:	83 45 ec 02          	addl   $0x2,-0x14(%ebp)
c0008b64:	c7 45 8e 43 68 69 6c 	movl   $0x6c696843,-0x72(%ebp)
c0008b6b:	c7 45 92 64 2e 53 65 	movl   $0x65532e64,-0x6e(%ebp)
c0008b72:	c7 45 96 65 20 79 6f 	movl   $0x6f792065,-0x6a(%ebp)
c0008b79:	c7 45 9a 75 20 61 67 	movl   $0x67612075,-0x66(%ebp)
c0008b80:	c7 45 9e 61 69 6e 0a 	movl   $0xa6e6961,-0x62(%ebp)
c0008b87:	c7 45 a2 00 00 00 00 	movl   $0x0,-0x5e(%ebp)
c0008b8e:	c7 45 a6 00 00 00 00 	movl   $0x0,-0x5a(%ebp)
c0008b95:	c7 45 aa 00 00 00 00 	movl   $0x0,-0x56(%ebp)
c0008b9c:	c7 45 ae 00 00 00 00 	movl   $0x0,-0x52(%ebp)
c0008ba3:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)
c0008baa:	83 ec 0c             	sub    $0xc,%esp
c0008bad:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008bb0:	50                   	push   %eax
c0008bb1:	e8 a2 30 00 00       	call   c000bc58 <Strlen>
c0008bb6:	83 c4 10             	add    $0x10,%esp
c0008bb9:	83 ec 04             	sub    $0x4,%esp
c0008bbc:	50                   	push   %eax
c0008bbd:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008bc0:	50                   	push   %eax
c0008bc1:	ff 75 f4             	pushl  -0xc(%ebp)
c0008bc4:	e8 6b cf ff ff       	call   c0005b34 <write>
c0008bc9:	83 c4 10             	add    $0x10,%esp
c0008bcc:	83 ec 0c             	sub    $0xc,%esp
c0008bcf:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008bd2:	50                   	push   %eax
c0008bd3:	e8 80 30 00 00       	call   c000bc58 <Strlen>
c0008bd8:	83 c4 10             	add    $0x10,%esp
c0008bdb:	83 ec 04             	sub    $0x4,%esp
c0008bde:	50                   	push   %eax
c0008bdf:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008be2:	50                   	push   %eax
c0008be3:	ff 75 f4             	pushl  -0xc(%ebp)
c0008be6:	e8 49 cf ff ff       	call   c0005b34 <write>
c0008beb:	83 c4 10             	add    $0x10,%esp
c0008bee:	83 ec 0c             	sub    $0xc,%esp
c0008bf1:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008bf4:	50                   	push   %eax
c0008bf5:	e8 5e 30 00 00       	call   c000bc58 <Strlen>
c0008bfa:	83 c4 10             	add    $0x10,%esp
c0008bfd:	83 ec 04             	sub    $0x4,%esp
c0008c00:	50                   	push   %eax
c0008c01:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008c04:	50                   	push   %eax
c0008c05:	ff 75 f4             	pushl  -0xc(%ebp)
c0008c08:	e8 27 cf ff ff       	call   c0005b34 <write>
c0008c0d:	83 c4 10             	add    $0x10,%esp
c0008c10:	eb fe                	jmp    c0008c10 <INIT_fork+0x287>
c0008c12:	83 ec 04             	sub    $0x4,%esp
c0008c15:	6a 28                	push   $0x28
c0008c17:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008c1a:	50                   	push   %eax
c0008c1b:	ff 75 f0             	pushl  -0x10(%ebp)
c0008c1e:	e8 90 cd ff ff       	call   c00059b3 <read>
c0008c23:	83 c4 10             	add    $0x10,%esp
c0008c26:	83 ec 0c             	sub    $0xc,%esp
c0008c29:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008c2c:	50                   	push   %eax
c0008c2d:	e8 b8 04 00 00       	call   c00090ea <Printf>
c0008c32:	83 c4 10             	add    $0x10,%esp
c0008c35:	83 ec 0c             	sub    $0xc,%esp
c0008c38:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008c3b:	50                   	push   %eax
c0008c3c:	e8 a9 04 00 00       	call   c00090ea <Printf>
c0008c41:	83 c4 10             	add    $0x10,%esp
c0008c44:	83 ec 0c             	sub    $0xc,%esp
c0008c47:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008c4a:	50                   	push   %eax
c0008c4b:	e8 9a 04 00 00       	call   c00090ea <Printf>
c0008c50:	83 c4 10             	add    $0x10,%esp
c0008c53:	83 ec 0c             	sub    $0xc,%esp
c0008c56:	68 ab b8 00 c0       	push   $0xc000b8ab
c0008c5b:	e8 a3 07 00 00       	call   c0009403 <spin>
c0008c60:	83 c4 10             	add    $0x10,%esp
c0008c63:	90                   	nop
c0008c64:	c9                   	leave  
c0008c65:	c3                   	ret    

c0008c66 <simple_shell>:
c0008c66:	55                   	push   %ebp
c0008c67:	89 e5                	mov    %esp,%ebp
c0008c69:	81 ec f8 00 00 00    	sub    $0xf8,%esp
c0008c6f:	c7 45 c2 64 65 76 5f 	movl   $0x5f766564,-0x3e(%ebp)
c0008c76:	c7 45 c6 74 74 79 31 	movl   $0x31797474,-0x3a(%ebp)
c0008c7d:	66 c7 45 ca 00 00    	movw   $0x0,-0x36(%ebp)
c0008c83:	83 ec 08             	sub    $0x8,%esp
c0008c86:	6a 02                	push   $0x2
c0008c88:	8d 45 c2             	lea    -0x3e(%ebp),%eax
c0008c8b:	50                   	push   %eax
c0008c8c:	e8 8d cc ff ff       	call   c000591e <open>
c0008c91:	83 c4 10             	add    $0x10,%esp
c0008c94:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0008c97:	83 ec 08             	sub    $0x8,%esp
c0008c9a:	6a 02                	push   $0x2
c0008c9c:	8d 45 c2             	lea    -0x3e(%ebp),%eax
c0008c9f:	50                   	push   %eax
c0008ca0:	e8 79 cc ff ff       	call   c000591e <open>
c0008ca5:	83 c4 10             	add    $0x10,%esp
c0008ca8:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0008cab:	83 ec 04             	sub    $0x4,%esp
c0008cae:	68 80 00 00 00       	push   $0x80
c0008cb3:	6a 00                	push   $0x0
c0008cb5:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c0008cbb:	50                   	push   %eax
c0008cbc:	e8 5e 2f 00 00       	call   c000bc1f <Memset>
c0008cc1:	83 c4 10             	add    $0x10,%esp
c0008cc4:	83 ec 04             	sub    $0x4,%esp
c0008cc7:	68 80 00 00 00       	push   $0x80
c0008ccc:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c0008cd2:	50                   	push   %eax
c0008cd3:	ff 75 e0             	pushl  -0x20(%ebp)
c0008cd6:	e8 d8 cc ff ff       	call   c00059b3 <read>
c0008cdb:	83 c4 10             	add    $0x10,%esp
c0008cde:	83 ec 08             	sub    $0x8,%esp
c0008ce1:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c0008ce7:	50                   	push   %eax
c0008ce8:	68 b3 b8 00 c0       	push   $0xc000b8b3
c0008ced:	e8 f8 03 00 00       	call   c00090ea <Printf>
c0008cf2:	83 c4 10             	add    $0x10,%esp
c0008cf5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008cfc:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0008d03:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c0008d09:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008d0c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008d0f:	0f b6 00             	movzbl (%eax),%eax
c0008d12:	88 45 db             	mov    %al,-0x25(%ebp)
c0008d15:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008d18:	0f b6 00             	movzbl (%eax),%eax
c0008d1b:	3c 20                	cmp    $0x20,%al
c0008d1d:	74 1d                	je     c0008d3c <simple_shell+0xd6>
c0008d1f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008d22:	0f b6 00             	movzbl (%eax),%eax
c0008d25:	84 c0                	test   %al,%al
c0008d27:	74 13                	je     c0008d3c <simple_shell+0xd6>
c0008d29:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0008d2d:	75 0d                	jne    c0008d3c <simple_shell+0xd6>
c0008d2f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008d32:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008d35:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0008d3c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008d3f:	0f b6 00             	movzbl (%eax),%eax
c0008d42:	3c 20                	cmp    $0x20,%al
c0008d44:	74 0a                	je     c0008d50 <simple_shell+0xea>
c0008d46:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008d49:	0f b6 00             	movzbl (%eax),%eax
c0008d4c:	84 c0                	test   %al,%al
c0008d4e:	75 26                	jne    c0008d76 <simple_shell+0x110>
c0008d50:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
c0008d54:	75 20                	jne    c0008d76 <simple_shell+0x110>
c0008d56:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008d59:	8d 50 01             	lea    0x1(%eax),%edx
c0008d5c:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0008d5f:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0008d62:	89 94 85 14 ff ff ff 	mov    %edx,-0xec(%ebp,%eax,4)
c0008d69:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008d6c:	c6 00 00             	movb   $0x0,(%eax)
c0008d6f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0008d76:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0008d7a:	80 7d db 00          	cmpb   $0x0,-0x25(%ebp)
c0008d7e:	75 8c                	jne    c0008d0c <simple_shell+0xa6>
c0008d80:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008d83:	c7 84 85 14 ff ff ff 	movl   $0x0,-0xec(%ebp,%eax,4)
c0008d8a:	00 00 00 00 
c0008d8e:	c7 45 d4 ff ff ff ff 	movl   $0xffffffff,-0x2c(%ebp)
c0008d95:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0008d9b:	83 ec 08             	sub    $0x8,%esp
c0008d9e:	6a 02                	push   $0x2
c0008da0:	50                   	push   %eax
c0008da1:	e8 78 cb ff ff       	call   c000591e <open>
c0008da6:	83 c4 10             	add    $0x10,%esp
c0008da9:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0008dac:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0008db0:	75 54                	jne    c0008e06 <simple_shell+0x1a0>
c0008db2:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0008db9:	eb 29                	jmp    c0008de4 <simple_shell+0x17e>
c0008dbb:	8b 95 14 ff ff ff    	mov    -0xec(%ebp),%edx
c0008dc1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008dc4:	01 d0                	add    %edx,%eax
c0008dc6:	0f b6 00             	movzbl (%eax),%eax
c0008dc9:	0f be c0             	movsbl %al,%eax
c0008dcc:	83 ec 04             	sub    $0x4,%esp
c0008dcf:	50                   	push   %eax
c0008dd0:	ff 75 e4             	pushl  -0x1c(%ebp)
c0008dd3:	68 c2 b8 00 c0       	push   $0xc000b8c2
c0008dd8:	e8 0d 03 00 00       	call   c00090ea <Printf>
c0008ddd:	83 c4 10             	add    $0x10,%esp
c0008de0:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0008de4:	83 7d e4 05          	cmpl   $0x5,-0x1c(%ebp)
c0008de8:	7e d1                	jle    c0008dbb <simple_shell+0x155>
c0008dea:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0008df0:	83 ec 08             	sub    $0x8,%esp
c0008df3:	50                   	push   %eax
c0008df4:	68 c9 b8 00 c0       	push   $0xc000b8c9
c0008df9:	e8 ec 02 00 00       	call   c00090ea <Printf>
c0008dfe:	83 c4 10             	add    $0x10,%esp
c0008e01:	e9 a5 fe ff ff       	jmp    c0008cab <simple_shell+0x45>
c0008e06:	e8 73 ce ff ff       	call   c0005c7e <fork>
c0008e0b:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0008e0e:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0008e12:	7e 17                	jle    c0008e2b <simple_shell+0x1c5>
c0008e14:	83 ec 0c             	sub    $0xc,%esp
c0008e17:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c0008e1d:	50                   	push   %eax
c0008e1e:	e8 e8 cd ff ff       	call   c0005c0b <wait>
c0008e23:	83 c4 10             	add    $0x10,%esp
c0008e26:	e9 80 fe ff ff       	jmp    c0008cab <simple_shell+0x45>
c0008e2b:	83 ec 0c             	sub    $0xc,%esp
c0008e2e:	68 cf b8 00 c0       	push   $0xc000b8cf
c0008e33:	e8 b2 02 00 00       	call   c00090ea <Printf>
c0008e38:	83 c4 10             	add    $0x10,%esp
c0008e3b:	83 ec 0c             	sub    $0xc,%esp
c0008e3e:	ff 75 d0             	pushl  -0x30(%ebp)
c0008e41:	e8 73 cd ff ff       	call   c0005bb9 <close>
c0008e46:	83 c4 10             	add    $0x10,%esp
c0008e49:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0008e4f:	83 ec 08             	sub    $0x8,%esp
c0008e52:	8d 95 14 ff ff ff    	lea    -0xec(%ebp),%edx
c0008e58:	52                   	push   %edx
c0008e59:	50                   	push   %eax
c0008e5a:	e8 03 cf ff ff       	call   c0005d62 <execv>
c0008e5f:	83 c4 10             	add    $0x10,%esp
c0008e62:	eb fe                	jmp    c0008e62 <simple_shell+0x1fc>

c0008e64 <test_shell>:
c0008e64:	55                   	push   %ebp
c0008e65:	89 e5                	mov    %esp,%ebp
c0008e67:	83 ec 38             	sub    $0x38,%esp
c0008e6a:	c7 45 ea 64 65 76 5f 	movl   $0x5f766564,-0x16(%ebp)
c0008e71:	c7 45 ee 74 74 79 31 	movl   $0x31797474,-0x12(%ebp)
c0008e78:	66 c7 45 f2 00 00    	movw   $0x0,-0xe(%ebp)
c0008e7e:	83 ec 08             	sub    $0x8,%esp
c0008e81:	6a 02                	push   $0x2
c0008e83:	8d 45 ea             	lea    -0x16(%ebp),%eax
c0008e86:	50                   	push   %eax
c0008e87:	e8 92 ca ff ff       	call   c000591e <open>
c0008e8c:	83 c4 10             	add    $0x10,%esp
c0008e8f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008e92:	c7 45 d6 69 6e 73 74 	movl   $0x74736e69,-0x2a(%ebp)
c0008e99:	c7 45 da 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x26(%ebp)
c0008ea0:	c7 45 de 74 61 72 00 	movl   $0x726174,-0x22(%ebp)
c0008ea7:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c0008eae:	c7 45 e6 00 00 00 00 	movl   $0x0,-0x1a(%ebp)
c0008eb5:	83 ec 0c             	sub    $0xc,%esp
c0008eb8:	8d 45 d6             	lea    -0x2a(%ebp),%eax
c0008ebb:	50                   	push   %eax
c0008ebc:	e8 e0 eb ff ff       	call   c0007aa1 <untar>
c0008ec1:	83 c4 10             	add    $0x10,%esp
c0008ec4:	e8 9d fd ff ff       	call   c0008c66 <simple_shell>
c0008ec9:	90                   	nop
c0008eca:	c9                   	leave  
c0008ecb:	c3                   	ret    

c0008ecc <test_exec>:
c0008ecc:	55                   	push   %ebp
c0008ecd:	89 e5                	mov    %esp,%ebp
c0008ecf:	83 ec 38             	sub    $0x38,%esp
c0008ed2:	83 ec 0c             	sub    $0xc,%esp
c0008ed5:	68 b3 b7 00 c0       	push   $0xc000b7b3
c0008eda:	e8 ad 81 ff ff       	call   c000108c <disp_str>
c0008edf:	83 c4 10             	add    $0x10,%esp
c0008ee2:	83 ec 0c             	sub    $0xc,%esp
c0008ee5:	68 b5 b7 00 c0       	push   $0xc000b7b5
c0008eea:	e8 9d 81 ff ff       	call   c000108c <disp_str>
c0008eef:	83 c4 10             	add    $0x10,%esp
c0008ef2:	c7 45 ea 64 65 76 5f 	movl   $0x5f766564,-0x16(%ebp)
c0008ef9:	c7 45 ee 74 74 79 31 	movl   $0x31797474,-0x12(%ebp)
c0008f00:	66 c7 45 f2 00 00    	movw   $0x0,-0xe(%ebp)
c0008f06:	83 ec 08             	sub    $0x8,%esp
c0008f09:	6a 02                	push   $0x2
c0008f0b:	8d 45 ea             	lea    -0x16(%ebp),%eax
c0008f0e:	50                   	push   %eax
c0008f0f:	e8 0a ca ff ff       	call   c000591e <open>
c0008f14:	83 c4 10             	add    $0x10,%esp
c0008f17:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008f1a:	c7 45 d6 69 6e 73 74 	movl   $0x74736e69,-0x2a(%ebp)
c0008f21:	c7 45 da 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x26(%ebp)
c0008f28:	c7 45 de 74 61 72 00 	movl   $0x726174,-0x22(%ebp)
c0008f2f:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c0008f36:	c7 45 e6 00 00 00 00 	movl   $0x0,-0x1a(%ebp)
c0008f3d:	83 ec 0c             	sub    $0xc,%esp
c0008f40:	8d 45 d6             	lea    -0x2a(%ebp),%eax
c0008f43:	50                   	push   %eax
c0008f44:	e8 58 eb ff ff       	call   c0007aa1 <untar>
c0008f49:	83 c4 10             	add    $0x10,%esp
c0008f4c:	83 ec 08             	sub    $0x8,%esp
c0008f4f:	6a 00                	push   $0x0
c0008f51:	68 eb b8 00 c0       	push   $0xc000b8eb
c0008f56:	68 ef b8 00 c0       	push   $0xc000b8ef
c0008f5b:	68 f5 b8 00 c0       	push   $0xc000b8f5
c0008f60:	68 fb b8 00 c0       	push   $0xc000b8fb
c0008f65:	68 00 b9 00 c0       	push   $0xc000b900
c0008f6a:	e8 d8 cf ff ff       	call   c0005f47 <execl>
c0008f6f:	83 c4 20             	add    $0x20,%esp
c0008f72:	eb fe                	jmp    c0008f72 <test_exec+0xa6>

c0008f74 <INIT>:
c0008f74:	55                   	push   %ebp
c0008f75:	89 e5                	mov    %esp,%ebp
c0008f77:	83 ec 08             	sub    $0x8,%esp
c0008f7a:	e8 e5 fe ff ff       	call   c0008e64 <test_shell>
c0008f7f:	eb fe                	jmp    c0008f7f <INIT+0xb>

c0008f81 <TestA>:
c0008f81:	55                   	push   %ebp
c0008f82:	89 e5                	mov    %esp,%ebp
c0008f84:	83 ec 08             	sub    $0x8,%esp
c0008f87:	83 ec 0c             	sub    $0xc,%esp
c0008f8a:	6a 05                	push   $0x5
c0008f8c:	e8 c6 ee ff ff       	call   c0007e57 <disp_int>
c0008f91:	83 c4 10             	add    $0x10,%esp
c0008f94:	83 ec 0c             	sub    $0xc,%esp
c0008f97:	68 af b4 00 c0       	push   $0xc000b4af
c0008f9c:	e8 eb 80 ff ff       	call   c000108c <disp_str>
c0008fa1:	83 c4 10             	add    $0x10,%esp
c0008fa4:	83 ec 0c             	sub    $0xc,%esp
c0008fa7:	68 06 b9 00 c0       	push   $0xc000b906
c0008fac:	e8 db 80 ff ff       	call   c000108c <disp_str>
c0008fb1:	83 c4 10             	add    $0x10,%esp
c0008fb4:	eb fe                	jmp    c0008fb4 <TestA+0x33>

c0008fb6 <delay>:
c0008fb6:	55                   	push   %ebp
c0008fb7:	89 e5                	mov    %esp,%ebp
c0008fb9:	83 ec 10             	sub    $0x10,%esp
c0008fbc:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0008fc3:	eb 2a                	jmp    c0008fef <delay+0x39>
c0008fc5:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0008fcc:	eb 17                	jmp    c0008fe5 <delay+0x2f>
c0008fce:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008fd5:	eb 04                	jmp    c0008fdb <delay+0x25>
c0008fd7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0008fdb:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c0008fdf:	7e f6                	jle    c0008fd7 <delay+0x21>
c0008fe1:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0008fe5:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
c0008fe9:	7e e3                	jle    c0008fce <delay+0x18>
c0008feb:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0008fef:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0008ff2:	3b 45 08             	cmp    0x8(%ebp),%eax
c0008ff5:	7c ce                	jl     c0008fc5 <delay+0xf>
c0008ff7:	90                   	nop
c0008ff8:	c9                   	leave  
c0008ff9:	c3                   	ret    

c0008ffa <TestB>:
c0008ffa:	55                   	push   %ebp
c0008ffb:	89 e5                	mov    %esp,%ebp
c0008ffd:	83 ec 08             	sub    $0x8,%esp
c0009000:	83 ec 0c             	sub    $0xc,%esp
c0009003:	68 0d b9 00 c0       	push   $0xc000b90d
c0009008:	e8 7f 80 ff ff       	call   c000108c <disp_str>
c000900d:	83 c4 10             	add    $0x10,%esp
c0009010:	eb fe                	jmp    c0009010 <TestB+0x16>

c0009012 <TestC>:
c0009012:	55                   	push   %ebp
c0009013:	89 e5                	mov    %esp,%ebp
c0009015:	83 ec 18             	sub    $0x18,%esp
c0009018:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000901f:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c0009023:	77 1a                	ja     c000903f <TestC+0x2d>
c0009025:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
c000902c:	83 ec 08             	sub    $0x8,%esp
c000902f:	ff 75 f0             	pushl  -0x10(%ebp)
c0009032:	68 10 b9 00 c0       	push   $0xc000b910
c0009037:	e8 ae 00 00 00       	call   c00090ea <Printf>
c000903c:	83 c4 10             	add    $0x10,%esp
c000903f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0009043:	eb da                	jmp    c000901f <TestC+0xd>

c0009045 <sys_get_ticks>:
c0009045:	55                   	push   %ebp
c0009046:	89 e5                	mov    %esp,%ebp
c0009048:	a1 e8 1e 01 c0       	mov    0xc0011ee8,%eax
c000904d:	8b 15 ec 1e 01 c0    	mov    0xc0011eec,%edx
c0009053:	5d                   	pop    %ebp
c0009054:	c3                   	ret    

c0009055 <sys_write>:
c0009055:	55                   	push   %ebp
c0009056:	89 e5                	mov    %esp,%ebp
c0009058:	83 ec 18             	sub    $0x18,%esp
c000905b:	8b 45 10             	mov    0x10(%ebp),%eax
c000905e:	8b 80 30 01 00 00    	mov    0x130(%eax),%eax
c0009064:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c000906a:	05 00 0e 01 c0       	add    $0xc0010e00,%eax
c000906f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009072:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009075:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009078:	8b 45 08             	mov    0x8(%ebp),%eax
c000907b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000907e:	eb 20                	jmp    c00090a0 <sys_write+0x4b>
c0009080:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009083:	0f b6 00             	movzbl (%eax),%eax
c0009086:	0f b6 c0             	movzbl %al,%eax
c0009089:	83 ec 08             	sub    $0x8,%esp
c000908c:	50                   	push   %eax
c000908d:	ff 75 ec             	pushl  -0x14(%ebp)
c0009090:	e8 fa bb ff ff       	call   c0004c8f <out_char>
c0009095:	83 c4 10             	add    $0x10,%esp
c0009098:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c000909c:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
c00090a0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00090a4:	7f da                	jg     c0009080 <sys_write+0x2b>
c00090a6:	90                   	nop
c00090a7:	c9                   	leave  
c00090a8:	c3                   	ret    

c00090a9 <milli_delay>:
c00090a9:	55                   	push   %ebp
c00090aa:	89 e5                	mov    %esp,%ebp
c00090ac:	83 ec 18             	sub    $0x18,%esp
c00090af:	e8 37 0f 00 00       	call   c0009feb <get_ticks_ipc>
c00090b4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00090b7:	90                   	nop
c00090b8:	e8 2e 0f 00 00       	call   c0009feb <get_ticks_ipc>
c00090bd:	2b 45 f4             	sub    -0xc(%ebp),%eax
c00090c0:	89 c1                	mov    %eax,%ecx
c00090c2:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
c00090c7:	89 c8                	mov    %ecx,%eax
c00090c9:	f7 ea                	imul   %edx
c00090cb:	c1 fa 05             	sar    $0x5,%edx
c00090ce:	89 c8                	mov    %ecx,%eax
c00090d0:	c1 f8 1f             	sar    $0x1f,%eax
c00090d3:	29 c2                	sub    %eax,%edx
c00090d5:	89 d0                	mov    %edx,%eax
c00090d7:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
c00090dd:	39 45 08             	cmp    %eax,0x8(%ebp)
c00090e0:	77 d6                	ja     c00090b8 <milli_delay+0xf>
c00090e2:	90                   	nop
c00090e3:	c9                   	leave  
c00090e4:	c3                   	ret    

c00090e5 <TaskSys>:
c00090e5:	55                   	push   %ebp
c00090e6:	89 e5                	mov    %esp,%ebp
c00090e8:	eb fe                	jmp    c00090e8 <TaskSys+0x3>

c00090ea <Printf>:
c00090ea:	55                   	push   %ebp
c00090eb:	89 e5                	mov    %esp,%ebp
c00090ed:	81 ec 18 01 00 00    	sub    $0x118,%esp
c00090f3:	83 ec 04             	sub    $0x4,%esp
c00090f6:	68 00 01 00 00       	push   $0x100
c00090fb:	6a 00                	push   $0x0
c00090fd:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0009103:	50                   	push   %eax
c0009104:	e8 16 2b 00 00       	call   c000bc1f <Memset>
c0009109:	83 c4 10             	add    $0x10,%esp
c000910c:	8d 45 0c             	lea    0xc(%ebp),%eax
c000910f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009112:	8b 45 08             	mov    0x8(%ebp),%eax
c0009115:	83 ec 04             	sub    $0x4,%esp
c0009118:	ff 75 f4             	pushl  -0xc(%ebp)
c000911b:	50                   	push   %eax
c000911c:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0009122:	50                   	push   %eax
c0009123:	e8 20 00 00 00       	call   c0009148 <vsprintf>
c0009128:	83 c4 10             	add    $0x10,%esp
c000912b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000912e:	83 ec 04             	sub    $0x4,%esp
c0009131:	ff 75 f0             	pushl  -0x10(%ebp)
c0009134:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c000913a:	50                   	push   %eax
c000913b:	6a 00                	push   $0x0
c000913d:	e8 f2 c9 ff ff       	call   c0005b34 <write>
c0009142:	83 c4 10             	add    $0x10,%esp
c0009145:	90                   	nop
c0009146:	c9                   	leave  
c0009147:	c3                   	ret    

c0009148 <vsprintf>:
c0009148:	55                   	push   %ebp
c0009149:	89 e5                	mov    %esp,%ebp
c000914b:	81 ec 68 02 00 00    	sub    $0x268,%esp
c0009151:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0009157:	89 85 e4 fd ff ff    	mov    %eax,-0x21c(%ebp)
c000915d:	83 ec 04             	sub    $0x4,%esp
c0009160:	6a 40                	push   $0x40
c0009162:	6a 00                	push   $0x0
c0009164:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c000916a:	50                   	push   %eax
c000916b:	e8 af 2a 00 00       	call   c000bc1f <Memset>
c0009170:	83 c4 10             	add    $0x10,%esp
c0009173:	8b 45 10             	mov    0x10(%ebp),%eax
c0009176:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009179:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0009180:	8b 45 08             	mov    0x8(%ebp),%eax
c0009183:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009186:	e9 53 01 00 00       	jmp    c00092de <vsprintf+0x196>
c000918b:	8b 45 0c             	mov    0xc(%ebp),%eax
c000918e:	0f b6 00             	movzbl (%eax),%eax
c0009191:	3c 25                	cmp    $0x25,%al
c0009193:	74 16                	je     c00091ab <vsprintf+0x63>
c0009195:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009198:	8d 50 01             	lea    0x1(%eax),%edx
c000919b:	89 55 f4             	mov    %edx,-0xc(%ebp)
c000919e:	8b 55 0c             	mov    0xc(%ebp),%edx
c00091a1:	0f b6 12             	movzbl (%edx),%edx
c00091a4:	88 10                	mov    %dl,(%eax)
c00091a6:	e9 2f 01 00 00       	jmp    c00092da <vsprintf+0x192>
c00091ab:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c00091af:	8b 45 0c             	mov    0xc(%ebp),%eax
c00091b2:	0f b6 00             	movzbl (%eax),%eax
c00091b5:	0f be c0             	movsbl %al,%eax
c00091b8:	83 f8 64             	cmp    $0x64,%eax
c00091bb:	74 26                	je     c00091e3 <vsprintf+0x9b>
c00091bd:	83 f8 64             	cmp    $0x64,%eax
c00091c0:	7f 0e                	jg     c00091d0 <vsprintf+0x88>
c00091c2:	83 f8 63             	cmp    $0x63,%eax
c00091c5:	0f 84 f2 00 00 00    	je     c00092bd <vsprintf+0x175>
c00091cb:	e9 0a 01 00 00       	jmp    c00092da <vsprintf+0x192>
c00091d0:	83 f8 73             	cmp    $0x73,%eax
c00091d3:	0f 84 b0 00 00 00    	je     c0009289 <vsprintf+0x141>
c00091d9:	83 f8 78             	cmp    $0x78,%eax
c00091dc:	74 5d                	je     c000923b <vsprintf+0xf3>
c00091de:	e9 f7 00 00 00       	jmp    c00092da <vsprintf+0x192>
c00091e3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00091e6:	8b 00                	mov    (%eax),%eax
c00091e8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00091eb:	83 ec 04             	sub    $0x4,%esp
c00091ee:	6a 0a                	push   $0xa
c00091f0:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c00091f6:	50                   	push   %eax
c00091f7:	ff 75 e8             	pushl  -0x18(%ebp)
c00091fa:	e8 43 0e 00 00       	call   c000a042 <itoa>
c00091ff:	83 c4 10             	add    $0x10,%esp
c0009202:	83 ec 08             	sub    $0x8,%esp
c0009205:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c000920b:	50                   	push   %eax
c000920c:	ff 75 f4             	pushl  -0xc(%ebp)
c000920f:	e8 2a 2a 00 00       	call   c000bc3e <Strcpy>
c0009214:	83 c4 10             	add    $0x10,%esp
c0009217:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c000921b:	83 ec 0c             	sub    $0xc,%esp
c000921e:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0009224:	50                   	push   %eax
c0009225:	e8 2e 2a 00 00       	call   c000bc58 <Strlen>
c000922a:	83 c4 10             	add    $0x10,%esp
c000922d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009230:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009233:	01 45 f4             	add    %eax,-0xc(%ebp)
c0009236:	e9 9f 00 00 00       	jmp    c00092da <vsprintf+0x192>
c000923b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000923e:	8b 00                	mov    (%eax),%eax
c0009240:	83 ec 08             	sub    $0x8,%esp
c0009243:	50                   	push   %eax
c0009244:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c000924a:	50                   	push   %eax
c000924b:	e8 61 eb ff ff       	call   c0007db1 <atoi>
c0009250:	83 c4 10             	add    $0x10,%esp
c0009253:	83 ec 08             	sub    $0x8,%esp
c0009256:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c000925c:	50                   	push   %eax
c000925d:	ff 75 f4             	pushl  -0xc(%ebp)
c0009260:	e8 d9 29 00 00       	call   c000bc3e <Strcpy>
c0009265:	83 c4 10             	add    $0x10,%esp
c0009268:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c000926c:	83 ec 0c             	sub    $0xc,%esp
c000926f:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0009275:	50                   	push   %eax
c0009276:	e8 dd 29 00 00       	call   c000bc58 <Strlen>
c000927b:	83 c4 10             	add    $0x10,%esp
c000927e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009281:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009284:	01 45 f4             	add    %eax,-0xc(%ebp)
c0009287:	eb 51                	jmp    c00092da <vsprintf+0x192>
c0009289:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000928c:	8b 00                	mov    (%eax),%eax
c000928e:	83 ec 08             	sub    $0x8,%esp
c0009291:	50                   	push   %eax
c0009292:	ff 75 f4             	pushl  -0xc(%ebp)
c0009295:	e8 a4 29 00 00       	call   c000bc3e <Strcpy>
c000929a:	83 c4 10             	add    $0x10,%esp
c000929d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00092a0:	8b 00                	mov    (%eax),%eax
c00092a2:	83 ec 0c             	sub    $0xc,%esp
c00092a5:	50                   	push   %eax
c00092a6:	e8 ad 29 00 00       	call   c000bc58 <Strlen>
c00092ab:	83 c4 10             	add    $0x10,%esp
c00092ae:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00092b1:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c00092b5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00092b8:	01 45 f4             	add    %eax,-0xc(%ebp)
c00092bb:	eb 1d                	jmp    c00092da <vsprintf+0x192>
c00092bd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00092c0:	0f b6 10             	movzbl (%eax),%edx
c00092c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00092c6:	88 10                	mov    %dl,(%eax)
c00092c8:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c00092cc:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c00092d3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00092d6:	01 45 f4             	add    %eax,-0xc(%ebp)
c00092d9:	90                   	nop
c00092da:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c00092de:	8b 45 0c             	mov    0xc(%ebp),%eax
c00092e1:	0f b6 00             	movzbl (%eax),%eax
c00092e4:	84 c0                	test   %al,%al
c00092e6:	0f 85 9f fe ff ff    	jne    c000918b <vsprintf+0x43>
c00092ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00092ef:	2b 45 08             	sub    0x8(%ebp),%eax
c00092f2:	c9                   	leave  
c00092f3:	c3                   	ret    

c00092f4 <printx>:
c00092f4:	55                   	push   %ebp
c00092f5:	89 e5                	mov    %esp,%ebp
c00092f7:	81 ec 18 01 00 00    	sub    $0x118,%esp
c00092fd:	8d 45 0c             	lea    0xc(%ebp),%eax
c0009300:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009303:	8b 45 08             	mov    0x8(%ebp),%eax
c0009306:	83 ec 04             	sub    $0x4,%esp
c0009309:	ff 75 f4             	pushl  -0xc(%ebp)
c000930c:	50                   	push   %eax
c000930d:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0009313:	50                   	push   %eax
c0009314:	e8 2f fe ff ff       	call   c0009148 <vsprintf>
c0009319:	83 c4 10             	add    $0x10,%esp
c000931c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000931f:	83 ec 08             	sub    $0x8,%esp
c0009322:	ff 75 f0             	pushl  -0x10(%ebp)
c0009325:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c000932b:	50                   	push   %eax
c000932c:	e8 ff 90 ff ff       	call   c0002430 <write_debug>
c0009331:	83 c4 10             	add    $0x10,%esp
c0009334:	90                   	nop
c0009335:	c9                   	leave  
c0009336:	c3                   	ret    

c0009337 <sys_printx>:
c0009337:	55                   	push   %ebp
c0009338:	89 e5                	mov    %esp,%ebp
c000933a:	83 ec 28             	sub    $0x28,%esp
c000933d:	a1 a8 07 01 c0       	mov    0xc00107a8,%eax
c0009342:	85 c0                	test   %eax,%eax
c0009344:	75 15                	jne    c000935b <sys_printx+0x24>
c0009346:	8b 45 10             	mov    0x10(%ebp),%eax
c0009349:	8b 80 78 02 00 00    	mov    0x278(%eax),%eax
c000934f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009352:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0009359:	eb 10                	jmp    c000936b <sys_printx+0x34>
c000935b:	a1 a8 07 01 c0       	mov    0xc00107a8,%eax
c0009360:	85 c0                	test   %eax,%eax
c0009362:	74 07                	je     c000936b <sys_printx+0x34>
c0009364:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000936b:	8b 55 08             	mov    0x8(%ebp),%edx
c000936e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009371:	01 d0                	add    %edx,%eax
c0009373:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0009376:	8b 45 10             	mov    0x10(%ebp),%eax
c0009379:	8b 80 30 01 00 00    	mov    0x130(%eax),%eax
c000937f:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0009385:	05 00 0e 01 c0       	add    $0xc0010e00,%eax
c000938a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000938d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0009390:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009393:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009396:	0f b6 00             	movzbl (%eax),%eax
c0009399:	88 45 e3             	mov    %al,-0x1d(%ebp)
c000939c:	eb 3a                	jmp    c00093d8 <sys_printx+0xa1>
c000939e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00093a1:	0f b6 00             	movzbl (%eax),%eax
c00093a4:	3c 3b                	cmp    $0x3b,%al
c00093a6:	74 0a                	je     c00093b2 <sys_printx+0x7b>
c00093a8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00093ab:	0f b6 00             	movzbl (%eax),%eax
c00093ae:	3c 3a                	cmp    $0x3a,%al
c00093b0:	75 06                	jne    c00093b8 <sys_printx+0x81>
c00093b2:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00093b6:	eb 20                	jmp    c00093d8 <sys_printx+0xa1>
c00093b8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00093bb:	0f b6 00             	movzbl (%eax),%eax
c00093be:	0f b6 c0             	movzbl %al,%eax
c00093c1:	83 ec 08             	sub    $0x8,%esp
c00093c4:	50                   	push   %eax
c00093c5:	ff 75 e4             	pushl  -0x1c(%ebp)
c00093c8:	e8 c2 b8 ff ff       	call   c0004c8f <out_char>
c00093cd:	83 c4 10             	add    $0x10,%esp
c00093d0:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00093d4:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c00093d8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00093dc:	7f c0                	jg     c000939e <sys_printx+0x67>
c00093de:	80 7d e3 3b          	cmpb   $0x3b,-0x1d(%ebp)
c00093e2:	75 10                	jne    c00093f4 <sys_printx+0xbd>
c00093e4:	a1 a8 07 01 c0       	mov    0xc00107a8,%eax
c00093e9:	85 c0                	test   %eax,%eax
c00093eb:	74 13                	je     c0009400 <sys_printx+0xc9>
c00093ed:	e8 c9 7e ff ff       	call   c00012bb <disable_int>
c00093f2:	eb 0c                	jmp    c0009400 <sys_printx+0xc9>
c00093f4:	80 7d e3 3a          	cmpb   $0x3a,-0x1d(%ebp)
c00093f8:	75 06                	jne    c0009400 <sys_printx+0xc9>
c00093fa:	e8 bc 7e ff ff       	call   c00012bb <disable_int>
c00093ff:	90                   	nop
c0009400:	90                   	nop
c0009401:	c9                   	leave  
c0009402:	c3                   	ret    

c0009403 <spin>:
c0009403:	55                   	push   %ebp
c0009404:	89 e5                	mov    %esp,%ebp
c0009406:	83 ec 08             	sub    $0x8,%esp
c0009409:	83 ec 0c             	sub    $0xc,%esp
c000940c:	ff 75 08             	pushl  0x8(%ebp)
c000940f:	e8 78 7c ff ff       	call   c000108c <disp_str>
c0009414:	83 c4 10             	add    $0x10,%esp
c0009417:	83 ec 0c             	sub    $0xc,%esp
c000941a:	68 af b4 00 c0       	push   $0xc000b4af
c000941f:	e8 68 7c ff ff       	call   c000108c <disp_str>
c0009424:	83 c4 10             	add    $0x10,%esp
c0009427:	eb fe                	jmp    c0009427 <spin+0x24>

c0009429 <panic>:
c0009429:	55                   	push   %ebp
c000942a:	89 e5                	mov    %esp,%ebp
c000942c:	83 ec 08             	sub    $0x8,%esp
c000942f:	83 ec 04             	sub    $0x4,%esp
c0009432:	ff 75 08             	pushl  0x8(%ebp)
c0009435:	6a 3a                	push   $0x3a
c0009437:	68 1d b9 00 c0       	push   $0xc000b91d
c000943c:	e8 b3 fe ff ff       	call   c00092f4 <printx>
c0009441:	83 c4 10             	add    $0x10,%esp
c0009444:	90                   	nop
c0009445:	c9                   	leave  
c0009446:	c3                   	ret    

c0009447 <assertion_failure>:
c0009447:	55                   	push   %ebp
c0009448:	89 e5                	mov    %esp,%ebp
c000944a:	83 ec 08             	sub    $0x8,%esp
c000944d:	83 ec 08             	sub    $0x8,%esp
c0009450:	ff 75 14             	pushl  0x14(%ebp)
c0009453:	ff 75 10             	pushl  0x10(%ebp)
c0009456:	ff 75 0c             	pushl  0xc(%ebp)
c0009459:	ff 75 08             	pushl  0x8(%ebp)
c000945c:	6a 3b                	push   $0x3b
c000945e:	68 24 b9 00 c0       	push   $0xc000b924
c0009463:	e8 8c fe ff ff       	call   c00092f4 <printx>
c0009468:	83 c4 20             	add    $0x20,%esp
c000946b:	c7 05 a4 07 01 c0 00 	movl   $0x0,0xc00107a4
c0009472:	00 00 00 
c0009475:	83 ec 0c             	sub    $0xc,%esp
c0009478:	68 b3 b7 00 c0       	push   $0xc000b7b3
c000947d:	e8 0a 7c ff ff       	call   c000108c <disp_str>
c0009482:	83 c4 10             	add    $0x10,%esp
c0009485:	a1 c4 0b 01 c0       	mov    0xc0010bc4,%eax
c000948a:	83 ec 0c             	sub    $0xc,%esp
c000948d:	50                   	push   %eax
c000948e:	e8 c4 e9 ff ff       	call   c0007e57 <disp_int>
c0009493:	83 c4 10             	add    $0x10,%esp
c0009496:	83 ec 0c             	sub    $0xc,%esp
c0009499:	68 b5 b7 00 c0       	push   $0xc000b7b5
c000949e:	e8 e9 7b ff ff       	call   c000108c <disp_str>
c00094a3:	83 c4 10             	add    $0x10,%esp
c00094a6:	83 ec 0c             	sub    $0xc,%esp
c00094a9:	68 57 b9 00 c0       	push   $0xc000b957
c00094ae:	e8 50 ff ff ff       	call   c0009403 <spin>
c00094b3:	83 c4 10             	add    $0x10,%esp
c00094b6:	90                   	nop
c00094b7:	c9                   	leave  
c00094b8:	c3                   	ret    

c00094b9 <dead_lock>:
c00094b9:	55                   	push   %ebp
c00094ba:	89 e5                	mov    %esp,%ebp
c00094bc:	b8 00 00 00 00       	mov    $0x0,%eax
c00094c1:	5d                   	pop    %ebp
c00094c2:	c3                   	ret    

c00094c3 <sys_send_msg>:
c00094c3:	55                   	push   %ebp
c00094c4:	89 e5                	mov    %esp,%ebp
c00094c6:	83 ec 58             	sub    $0x58,%esp
c00094c9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c00094d0:	83 ec 0c             	sub    $0xc,%esp
c00094d3:	ff 75 0c             	pushl  0xc(%ebp)
c00094d6:	e8 41 b1 ff ff       	call   c000461c <pid2proc>
c00094db:	83 c4 10             	add    $0x10,%esp
c00094de:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00094e1:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c00094e5:	74 2c                	je     c0009513 <sys_send_msg+0x50>
c00094e7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00094ea:	8b 80 b0 02 00 00    	mov    0x2b0(%eax),%eax
c00094f0:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c00094f5:	74 1c                	je     c0009513 <sys_send_msg+0x50>
c00094f7:	68 03 05 00 00       	push   $0x503
c00094fc:	68 63 b9 00 c0       	push   $0xc000b963
c0009501:	68 63 b9 00 c0       	push   $0xc000b963
c0009506:	68 74 b9 00 c0       	push   $0xc000b974
c000950b:	e8 37 ff ff ff       	call   c0009447 <assertion_failure>
c0009510:	83 c4 10             	add    $0x10,%esp
c0009513:	8b 45 10             	mov    0x10(%ebp),%eax
c0009516:	8b 80 b0 02 00 00    	mov    0x2b0(%eax),%eax
c000951c:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0009521:	74 1c                	je     c000953f <sys_send_msg+0x7c>
c0009523:	68 05 05 00 00       	push   $0x505
c0009528:	68 63 b9 00 c0       	push   $0xc000b963
c000952d:	68 63 b9 00 c0       	push   $0xc000b963
c0009532:	68 9c b9 00 c0       	push   $0xc000b99c
c0009537:	e8 0b ff ff ff       	call   c0009447 <assertion_failure>
c000953c:	83 c4 10             	add    $0x10,%esp
c000953f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0009543:	75 22                	jne    c0009567 <sys_send_msg+0xa4>
c0009545:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0009549:	75 1c                	jne    c0009567 <sys_send_msg+0xa4>
c000954b:	68 08 05 00 00       	push   $0x508
c0009550:	68 63 b9 00 c0       	push   $0xc000b963
c0009555:	68 63 b9 00 c0       	push   $0xc000b963
c000955a:	68 bf b9 00 c0       	push   $0xc000b9bf
c000955f:	e8 e3 fe ff ff       	call   c0009447 <assertion_failure>
c0009564:	83 c4 10             	add    $0x10,%esp
c0009567:	83 ec 0c             	sub    $0xc,%esp
c000956a:	ff 75 10             	pushl  0x10(%ebp)
c000956d:	e8 1c b1 ff ff       	call   c000468e <proc2pid>
c0009572:	83 c4 10             	add    $0x10,%esp
c0009575:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0009578:	c7 45 e0 7c 00 00 00 	movl   $0x7c,-0x20(%ebp)
c000957f:	8b 45 08             	mov    0x8(%ebp),%eax
c0009582:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0009585:	83 ec 08             	sub    $0x8,%esp
c0009588:	ff 75 e4             	pushl  -0x1c(%ebp)
c000958b:	ff 75 dc             	pushl  -0x24(%ebp)
c000958e:	e8 8f d7 ff ff       	call   c0006d22 <get_physical_address_proc>
c0009593:	83 c4 10             	add    $0x10,%esp
c0009596:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0009599:	83 ec 08             	sub    $0x8,%esp
c000959c:	ff 75 e0             	pushl  -0x20(%ebp)
c000959f:	ff 75 d8             	pushl  -0x28(%ebp)
c00095a2:	e8 ad d6 ff ff       	call   c0006c54 <alloc_virtual_memory>
c00095a7:	83 c4 10             	add    $0x10,%esp
c00095aa:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00095ad:	8b 45 10             	mov    0x10(%ebp),%eax
c00095b0:	8b 80 78 02 00 00    	mov    0x278(%eax),%eax
c00095b6:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00095b9:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c00095c0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00095c3:	89 45 c8             	mov    %eax,-0x38(%ebp)
c00095c6:	8b 45 c8             	mov    -0x38(%ebp),%eax
c00095c9:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c00095cc:	89 10                	mov    %edx,(%eax)
c00095ce:	83 ec 08             	sub    $0x8,%esp
c00095d1:	ff 75 0c             	pushl  0xc(%ebp)
c00095d4:	ff 75 e4             	pushl  -0x1c(%ebp)
c00095d7:	e8 dd fe ff ff       	call   c00094b9 <dead_lock>
c00095dc:	83 c4 10             	add    $0x10,%esp
c00095df:	83 f8 01             	cmp    $0x1,%eax
c00095e2:	75 10                	jne    c00095f4 <sys_send_msg+0x131>
c00095e4:	83 ec 0c             	sub    $0xc,%esp
c00095e7:	68 cf b9 00 c0       	push   $0xc000b9cf
c00095ec:	e8 38 fe ff ff       	call   c0009429 <panic>
c00095f1:	83 c4 10             	add    $0x10,%esp
c00095f4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00095f7:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c00095fe:	3c 02                	cmp    $0x2,%al
c0009600:	0f 85 cf 01 00 00    	jne    c00097d5 <sys_send_msg+0x312>
c0009606:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0009609:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c000960f:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0009612:	74 12                	je     c0009626 <sys_send_msg+0x163>
c0009614:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0009617:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c000961d:	83 f8 12             	cmp    $0x12,%eax
c0009620:	0f 85 af 01 00 00    	jne    c00097d5 <sys_send_msg+0x312>
c0009626:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0009629:	8b 80 78 02 00 00    	mov    0x278(%eax),%eax
c000962f:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0009632:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0009635:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c000963b:	89 45 c0             	mov    %eax,-0x40(%ebp)
c000963e:	83 ec 08             	sub    $0x8,%esp
c0009641:	ff 75 0c             	pushl  0xc(%ebp)
c0009644:	ff 75 c0             	pushl  -0x40(%ebp)
c0009647:	e8 d6 d6 ff ff       	call   c0006d22 <get_physical_address_proc>
c000964c:	83 c4 10             	add    $0x10,%esp
c000964f:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0009652:	83 ec 08             	sub    $0x8,%esp
c0009655:	ff 75 e0             	pushl  -0x20(%ebp)
c0009658:	ff 75 bc             	pushl  -0x44(%ebp)
c000965b:	e8 f4 d5 ff ff       	call   c0006c54 <alloc_virtual_memory>
c0009660:	83 c4 10             	add    $0x10,%esp
c0009663:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0009666:	e8 59 e3 ff ff       	call   c00079c4 <catch_error>
c000966b:	8b 4d e0             	mov    -0x20(%ebp),%ecx
c000966e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0009671:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0009674:	83 ec 04             	sub    $0x4,%esp
c0009677:	51                   	push   %ecx
c0009678:	52                   	push   %edx
c0009679:	50                   	push   %eax
c000967a:	e8 ef e3 ff ff       	call   c0007a6e <Memcpy>
c000967f:	83 c4 10             	add    $0x10,%esp
c0009682:	a1 c4 0b 01 c0       	mov    0xc0010bc4,%eax
c0009687:	3d 41 05 00 00       	cmp    $0x541,%eax
c000968c:	75 0a                	jne    c0009698 <sys_send_msg+0x1d5>
c000968e:	c7 05 a0 07 01 c0 04 	movl   $0x4,0xc00107a0
c0009695:	00 00 00 
c0009698:	8b 45 10             	mov    0x10(%ebp),%eax
c000969b:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c00096a2:	00 00 00 
c00096a5:	8b 45 10             	mov    0x10(%ebp),%eax
c00096a8:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c00096af:	8b 45 10             	mov    0x10(%ebp),%eax
c00096b2:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c00096b9:	00 00 00 
c00096bc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00096bf:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c00096c6:	00 00 00 
c00096c9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00096cc:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c00096d3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00096d6:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c00096dd:	00 00 00 
c00096e0:	8b 45 10             	mov    0x10(%ebp),%eax
c00096e3:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c00096ea:	00 00 00 
c00096ed:	83 ec 0c             	sub    $0xc,%esp
c00096f0:	ff 75 e8             	pushl  -0x18(%ebp)
c00096f3:	e8 a3 08 00 00       	call   c0009f9b <unblock>
c00096f8:	83 c4 10             	add    $0x10,%esp
c00096fb:	8b 45 10             	mov    0x10(%ebp),%eax
c00096fe:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009705:	84 c0                	test   %al,%al
c0009707:	74 1c                	je     c0009725 <sys_send_msg+0x262>
c0009709:	68 41 05 00 00       	push   $0x541
c000970e:	68 63 b9 00 c0       	push   $0xc000b963
c0009713:	68 63 b9 00 c0       	push   $0xc000b963
c0009718:	68 da b9 00 c0       	push   $0xc000b9da
c000971d:	e8 25 fd ff ff       	call   c0009447 <assertion_failure>
c0009722:	83 c4 10             	add    $0x10,%esp
c0009725:	8b 45 10             	mov    0x10(%ebp),%eax
c0009728:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c000972e:	83 f8 21             	cmp    $0x21,%eax
c0009731:	74 1c                	je     c000974f <sys_send_msg+0x28c>
c0009733:	68 42 05 00 00       	push   $0x542
c0009738:	68 63 b9 00 c0       	push   $0xc000b963
c000973d:	68 63 b9 00 c0       	push   $0xc000b963
c0009742:	68 ee b9 00 c0       	push   $0xc000b9ee
c0009747:	e8 fb fc ff ff       	call   c0009447 <assertion_failure>
c000974c:	83 c4 10             	add    $0x10,%esp
c000974f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0009752:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009758:	85 c0                	test   %eax,%eax
c000975a:	74 1c                	je     c0009778 <sys_send_msg+0x2b5>
c000975c:	68 44 05 00 00       	push   $0x544
c0009761:	68 63 b9 00 c0       	push   $0xc000b963
c0009766:	68 63 b9 00 c0       	push   $0xc000b963
c000976b:	68 0b ba 00 c0       	push   $0xc000ba0b
c0009770:	e8 d2 fc ff ff       	call   c0009447 <assertion_failure>
c0009775:	83 c4 10             	add    $0x10,%esp
c0009778:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000977b:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009782:	84 c0                	test   %al,%al
c0009784:	74 1c                	je     c00097a2 <sys_send_msg+0x2df>
c0009786:	68 45 05 00 00       	push   $0x545
c000978b:	68 63 b9 00 c0       	push   $0xc000b963
c0009790:	68 63 b9 00 c0       	push   $0xc000b963
c0009795:	68 20 ba 00 c0       	push   $0xc000ba20
c000979a:	e8 a8 fc ff ff       	call   c0009447 <assertion_failure>
c000979f:	83 c4 10             	add    $0x10,%esp
c00097a2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00097a5:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c00097ab:	83 f8 21             	cmp    $0x21,%eax
c00097ae:	0f 84 45 01 00 00    	je     c00098f9 <sys_send_msg+0x436>
c00097b4:	68 46 05 00 00       	push   $0x546
c00097b9:	68 63 b9 00 c0       	push   $0xc000b963
c00097be:	68 63 b9 00 c0       	push   $0xc000b963
c00097c3:	68 38 ba 00 c0       	push   $0xc000ba38
c00097c8:	e8 7a fc ff ff       	call   c0009447 <assertion_failure>
c00097cd:	83 c4 10             	add    $0x10,%esp
c00097d0:	e9 24 01 00 00       	jmp    c00098f9 <sys_send_msg+0x436>
c00097d5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00097dc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00097df:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c00097e2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00097e5:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c00097eb:	85 c0                	test   %eax,%eax
c00097ed:	75 1b                	jne    c000980a <sys_send_msg+0x347>
c00097ef:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00097f2:	8b 55 10             	mov    0x10(%ebp),%edx
c00097f5:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c00097fb:	8b 45 10             	mov    0x10(%ebp),%eax
c00097fe:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c0009805:	00 00 00 
c0009808:	eb 3f                	jmp    c0009849 <sys_send_msg+0x386>
c000980a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000980d:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0009813:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009816:	eb 12                	jmp    c000982a <sys_send_msg+0x367>
c0009818:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000981b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000981e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009821:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c0009827:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000982a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000982e:	75 e8                	jne    c0009818 <sys_send_msg+0x355>
c0009830:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009833:	8b 55 10             	mov    0x10(%ebp),%edx
c0009836:	89 90 5c 02 00 00    	mov    %edx,0x25c(%eax)
c000983c:	8b 45 10             	mov    0x10(%ebp),%eax
c000983f:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c0009846:	00 00 00 
c0009849:	8b 45 10             	mov    0x10(%ebp),%eax
c000984c:	8b 55 08             	mov    0x8(%ebp),%edx
c000984f:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c0009855:	8b 45 10             	mov    0x10(%ebp),%eax
c0009858:	8b 55 0c             	mov    0xc(%ebp),%edx
c000985b:	89 90 50 02 00 00    	mov    %edx,0x250(%eax)
c0009861:	8b 45 10             	mov    0x10(%ebp),%eax
c0009864:	c6 80 48 02 00 00 01 	movb   $0x1,0x248(%eax)
c000986b:	8b 45 10             	mov    0x10(%ebp),%eax
c000986e:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009875:	3c 01                	cmp    $0x1,%al
c0009877:	74 1c                	je     c0009895 <sys_send_msg+0x3d2>
c0009879:	68 68 05 00 00       	push   $0x568
c000987e:	68 63 b9 00 c0       	push   $0xc000b963
c0009883:	68 63 b9 00 c0       	push   $0xc000b963
c0009888:	68 5c ba 00 c0       	push   $0xc000ba5c
c000988d:	e8 b5 fb ff ff       	call   c0009447 <assertion_failure>
c0009892:	83 c4 10             	add    $0x10,%esp
c0009895:	8b 45 10             	mov    0x10(%ebp),%eax
c0009898:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c000989e:	39 45 0c             	cmp    %eax,0xc(%ebp)
c00098a1:	74 1c                	je     c00098bf <sys_send_msg+0x3fc>
c00098a3:	68 69 05 00 00       	push   $0x569
c00098a8:	68 63 b9 00 c0       	push   $0xc000b963
c00098ad:	68 63 b9 00 c0       	push   $0xc000b963
c00098b2:	68 78 ba 00 c0       	push   $0xc000ba78
c00098b7:	e8 8b fb ff ff       	call   c0009447 <assertion_failure>
c00098bc:	83 c4 10             	add    $0x10,%esp
c00098bf:	8b 45 10             	mov    0x10(%ebp),%eax
c00098c2:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c00098c8:	39 45 08             	cmp    %eax,0x8(%ebp)
c00098cb:	74 1c                	je     c00098e9 <sys_send_msg+0x426>
c00098cd:	68 6a 05 00 00       	push   $0x56a
c00098d2:	68 63 b9 00 c0       	push   $0xc000b963
c00098d7:	68 63 b9 00 c0       	push   $0xc000b963
c00098dc:	68 9a ba 00 c0       	push   $0xc000ba9a
c00098e1:	e8 61 fb ff ff       	call   c0009447 <assertion_failure>
c00098e6:	83 c4 10             	add    $0x10,%esp
c00098e9:	83 ec 0c             	sub    $0xc,%esp
c00098ec:	ff 75 10             	pushl  0x10(%ebp)
c00098ef:	e8 6b 06 00 00       	call   c0009f5f <block>
c00098f4:	83 c4 10             	add    $0x10,%esp
c00098f7:	eb 01                	jmp    c00098fa <sys_send_msg+0x437>
c00098f9:	90                   	nop
c00098fa:	b8 00 00 00 00       	mov    $0x0,%eax
c00098ff:	c9                   	leave  
c0009900:	c3                   	ret    

c0009901 <sys_receive_msg>:
c0009901:	55                   	push   %ebp
c0009902:	89 e5                	mov    %esp,%ebp
c0009904:	83 ec 58             	sub    $0x58,%esp
c0009907:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000990e:	83 ec 0c             	sub    $0xc,%esp
c0009911:	ff 75 0c             	pushl  0xc(%ebp)
c0009914:	e8 03 ad ff ff       	call   c000461c <pid2proc>
c0009919:	83 c4 10             	add    $0x10,%esp
c000991c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000991f:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0009923:	74 2c                	je     c0009951 <sys_receive_msg+0x50>
c0009925:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009928:	8b 80 b0 02 00 00    	mov    0x2b0(%eax),%eax
c000992e:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0009933:	74 1c                	je     c0009951 <sys_receive_msg+0x50>
c0009935:	68 7e 05 00 00       	push   $0x57e
c000993a:	68 63 b9 00 c0       	push   $0xc000b963
c000993f:	68 63 b9 00 c0       	push   $0xc000b963
c0009944:	68 9c b9 00 c0       	push   $0xc000b99c
c0009949:	e8 f9 fa ff ff       	call   c0009447 <assertion_failure>
c000994e:	83 c4 10             	add    $0x10,%esp
c0009951:	8b 45 10             	mov    0x10(%ebp),%eax
c0009954:	8b 80 b0 02 00 00    	mov    0x2b0(%eax),%eax
c000995a:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c000995f:	74 1c                	je     c000997d <sys_receive_msg+0x7c>
c0009961:	68 80 05 00 00       	push   $0x580
c0009966:	68 63 b9 00 c0       	push   $0xc000b963
c000996b:	68 63 b9 00 c0       	push   $0xc000b963
c0009970:	68 74 b9 00 c0       	push   $0xc000b974
c0009975:	e8 cd fa ff ff       	call   c0009447 <assertion_failure>
c000997a:	83 c4 10             	add    $0x10,%esp
c000997d:	83 ec 0c             	sub    $0xc,%esp
c0009980:	ff 75 10             	pushl  0x10(%ebp)
c0009983:	e8 06 ad ff ff       	call   c000468e <proc2pid>
c0009988:	83 c4 10             	add    $0x10,%esp
c000998b:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000998e:	c7 45 dc 7c 00 00 00 	movl   $0x7c,-0x24(%ebp)
c0009995:	8b 45 08             	mov    0x8(%ebp),%eax
c0009998:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000999b:	8b 45 10             	mov    0x10(%ebp),%eax
c000999e:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c00099a4:	83 ec 08             	sub    $0x8,%esp
c00099a7:	50                   	push   %eax
c00099a8:	ff 75 d8             	pushl  -0x28(%ebp)
c00099ab:	e8 72 d3 ff ff       	call   c0006d22 <get_physical_address_proc>
c00099b0:	83 c4 10             	add    $0x10,%esp
c00099b3:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00099b6:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00099bd:	8b 45 10             	mov    0x10(%ebp),%eax
c00099c0:	8b 80 60 02 00 00    	mov    0x260(%eax),%eax
c00099c6:	85 c0                	test   %eax,%eax
c00099c8:	0f 84 c5 00 00 00    	je     c0009a93 <sys_receive_msg+0x192>
c00099ce:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c00099d2:	74 0d                	je     c00099e1 <sys_receive_msg+0xe0>
c00099d4:	81 7d 0c 13 02 00 00 	cmpl   $0x213,0xc(%ebp)
c00099db:	0f 85 b2 00 00 00    	jne    c0009a93 <sys_receive_msg+0x192>
c00099e1:	c7 45 d0 7c 00 00 00 	movl   $0x7c,-0x30(%ebp)
c00099e8:	83 ec 0c             	sub    $0xc,%esp
c00099eb:	ff 75 d0             	pushl  -0x30(%ebp)
c00099ee:	e8 79 8a ff ff       	call   c000246c <sys_malloc>
c00099f3:	83 c4 10             	add    $0x10,%esp
c00099f6:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00099f9:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00099fc:	83 ec 04             	sub    $0x4,%esp
c00099ff:	50                   	push   %eax
c0009a00:	6a 00                	push   $0x0
c0009a02:	ff 75 cc             	pushl  -0x34(%ebp)
c0009a05:	e8 15 22 00 00       	call   c000bc1f <Memset>
c0009a0a:	83 c4 10             	add    $0x10,%esp
c0009a0d:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0009a10:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c0009a16:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0009a19:	c7 40 78 d5 07 00 00 	movl   $0x7d5,0x78(%eax)
c0009a20:	83 ec 08             	sub    $0x8,%esp
c0009a23:	ff 75 d0             	pushl  -0x30(%ebp)
c0009a26:	ff 75 d4             	pushl  -0x2c(%ebp)
c0009a29:	e8 26 d2 ff ff       	call   c0006c54 <alloc_virtual_memory>
c0009a2e:	83 c4 10             	add    $0x10,%esp
c0009a31:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0009a34:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0009a37:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0009a3a:	83 ec 04             	sub    $0x4,%esp
c0009a3d:	52                   	push   %edx
c0009a3e:	ff 75 cc             	pushl  -0x34(%ebp)
c0009a41:	50                   	push   %eax
c0009a42:	e8 27 e0 ff ff       	call   c0007a6e <Memcpy>
c0009a47:	83 c4 10             	add    $0x10,%esp
c0009a4a:	8b 45 10             	mov    0x10(%ebp),%eax
c0009a4d:	c7 80 60 02 00 00 00 	movl   $0x0,0x260(%eax)
c0009a54:	00 00 00 
c0009a57:	8b 45 10             	mov    0x10(%ebp),%eax
c0009a5a:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c0009a61:	00 00 00 
c0009a64:	8b 45 10             	mov    0x10(%ebp),%eax
c0009a67:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c0009a6e:	00 00 00 
c0009a71:	8b 45 10             	mov    0x10(%ebp),%eax
c0009a74:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0009a7b:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c0009a82:	83 ec 08             	sub    $0x8,%esp
c0009a85:	ff 75 d0             	pushl  -0x30(%ebp)
c0009a88:	ff 75 cc             	pushl  -0x34(%ebp)
c0009a8b:	e8 f1 89 ff ff       	call   c0002481 <sys_free>
c0009a90:	83 c4 10             	add    $0x10,%esp
c0009a93:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c0009a97:	0f 84 c3 03 00 00    	je     c0009e60 <sys_receive_msg+0x55f>
c0009a9d:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0009aa1:	75 26                	jne    c0009ac9 <sys_receive_msg+0x1c8>
c0009aa3:	8b 45 10             	mov    0x10(%ebp),%eax
c0009aa6:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0009aac:	85 c0                	test   %eax,%eax
c0009aae:	0f 84 8a 00 00 00    	je     c0009b3e <sys_receive_msg+0x23d>
c0009ab4:	8b 45 10             	mov    0x10(%ebp),%eax
c0009ab7:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0009abd:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009ac0:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0009ac7:	eb 75                	jmp    c0009b3e <sys_receive_msg+0x23d>
c0009ac9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0009acd:	78 6f                	js     c0009b3e <sys_receive_msg+0x23d>
c0009acf:	83 7d 0c 07          	cmpl   $0x7,0xc(%ebp)
c0009ad3:	7f 69                	jg     c0009b3e <sys_receive_msg+0x23d>
c0009ad5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009ad8:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009adf:	3c 01                	cmp    $0x1,%al
c0009ae1:	75 5b                	jne    c0009b3e <sys_receive_msg+0x23d>
c0009ae3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009ae6:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009aec:	83 f8 12             	cmp    $0x12,%eax
c0009aef:	74 0e                	je     c0009aff <sys_receive_msg+0x1fe>
c0009af1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009af4:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009afa:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c0009afd:	75 3f                	jne    c0009b3e <sys_receive_msg+0x23d>
c0009aff:	8b 45 10             	mov    0x10(%ebp),%eax
c0009b02:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0009b08:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009b0b:	eb 2b                	jmp    c0009b38 <sys_receive_msg+0x237>
c0009b0d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009b10:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009b13:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009b16:	8b 90 24 01 00 00    	mov    0x124(%eax),%edx
c0009b1c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009b1f:	39 c2                	cmp    %eax,%edx
c0009b21:	75 09                	jne    c0009b2c <sys_receive_msg+0x22b>
c0009b23:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0009b2a:	eb 12                	jmp    c0009b3e <sys_receive_msg+0x23d>
c0009b2c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009b2f:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c0009b35:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009b38:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0009b3c:	75 cf                	jne    c0009b0d <sys_receive_msg+0x20c>
c0009b3e:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0009b42:	0f 85 4e 02 00 00    	jne    c0009d96 <sys_receive_msg+0x495>
c0009b48:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009b4b:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0009b4e:	83 ec 08             	sub    $0x8,%esp
c0009b51:	ff 75 dc             	pushl  -0x24(%ebp)
c0009b54:	ff 75 d4             	pushl  -0x2c(%ebp)
c0009b57:	e8 f8 d0 ff ff       	call   c0006c54 <alloc_virtual_memory>
c0009b5c:	83 c4 10             	add    $0x10,%esp
c0009b5f:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0009b62:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0009b65:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009b6b:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0009b6e:	83 ec 0c             	sub    $0xc,%esp
c0009b71:	ff 75 c4             	pushl  -0x3c(%ebp)
c0009b74:	e8 15 ab ff ff       	call   c000468e <proc2pid>
c0009b79:	83 c4 10             	add    $0x10,%esp
c0009b7c:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0009b7f:	83 ec 08             	sub    $0x8,%esp
c0009b82:	ff 75 b8             	pushl  -0x48(%ebp)
c0009b85:	ff 75 bc             	pushl  -0x44(%ebp)
c0009b88:	e8 95 d1 ff ff       	call   c0006d22 <get_physical_address_proc>
c0009b8d:	83 c4 10             	add    $0x10,%esp
c0009b90:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0009b93:	83 ec 08             	sub    $0x8,%esp
c0009b96:	ff 75 dc             	pushl  -0x24(%ebp)
c0009b99:	ff 75 b4             	pushl  -0x4c(%ebp)
c0009b9c:	e8 b3 d0 ff ff       	call   c0006c54 <alloc_virtual_memory>
c0009ba1:	83 c4 10             	add    $0x10,%esp
c0009ba4:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0009ba7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0009baa:	83 ec 04             	sub    $0x4,%esp
c0009bad:	50                   	push   %eax
c0009bae:	ff 75 b0             	pushl  -0x50(%ebp)
c0009bb1:	ff 75 c0             	pushl  -0x40(%ebp)
c0009bb4:	e8 b5 de ff ff       	call   c0007a6e <Memcpy>
c0009bb9:	83 c4 10             	add    $0x10,%esp
c0009bbc:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0009bbf:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0009bc2:	8b 45 10             	mov    0x10(%ebp),%eax
c0009bc5:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0009bcb:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0009bce:	75 21                	jne    c0009bf1 <sys_receive_msg+0x2f0>
c0009bd0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009bd3:	8b 90 5c 02 00 00    	mov    0x25c(%eax),%edx
c0009bd9:	8b 45 10             	mov    0x10(%ebp),%eax
c0009bdc:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c0009be2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009be5:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c0009bec:	00 00 00 
c0009bef:	eb 1f                	jmp    c0009c10 <sys_receive_msg+0x30f>
c0009bf1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009bf4:	8b 90 5c 02 00 00    	mov    0x25c(%eax),%edx
c0009bfa:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009bfd:	89 90 5c 02 00 00    	mov    %edx,0x25c(%eax)
c0009c03:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009c06:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c0009c0d:	00 00 00 
c0009c10:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0009c13:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c0009c1a:	00 00 00 
c0009c1d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0009c20:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0009c27:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0009c2a:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c0009c31:	00 00 00 
c0009c34:	8b 45 10             	mov    0x10(%ebp),%eax
c0009c37:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c0009c3e:	00 00 00 
c0009c41:	8b 45 10             	mov    0x10(%ebp),%eax
c0009c44:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c0009c4b:	00 00 00 
c0009c4e:	8b 45 10             	mov    0x10(%ebp),%eax
c0009c51:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c0009c58:	00 00 00 
c0009c5b:	83 ec 0c             	sub    $0xc,%esp
c0009c5e:	ff 75 c4             	pushl  -0x3c(%ebp)
c0009c61:	e8 35 03 00 00       	call   c0009f9b <unblock>
c0009c66:	83 c4 10             	add    $0x10,%esp
c0009c69:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0009c6c:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009c72:	85 c0                	test   %eax,%eax
c0009c74:	74 1c                	je     c0009c92 <sys_receive_msg+0x391>
c0009c76:	68 ef 05 00 00       	push   $0x5ef
c0009c7b:	68 63 b9 00 c0       	push   $0xc000b963
c0009c80:	68 63 b9 00 c0       	push   $0xc000b963
c0009c85:	68 af ba 00 c0       	push   $0xc000baaf
c0009c8a:	e8 b8 f7 ff ff       	call   c0009447 <assertion_failure>
c0009c8f:	83 c4 10             	add    $0x10,%esp
c0009c92:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0009c95:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009c9c:	84 c0                	test   %al,%al
c0009c9e:	74 1c                	je     c0009cbc <sys_receive_msg+0x3bb>
c0009ca0:	68 f0 05 00 00       	push   $0x5f0
c0009ca5:	68 63 b9 00 c0       	push   $0xc000b963
c0009caa:	68 63 b9 00 c0       	push   $0xc000b963
c0009caf:	68 c7 ba 00 c0       	push   $0xc000bac7
c0009cb4:	e8 8e f7 ff ff       	call   c0009447 <assertion_failure>
c0009cb9:	83 c4 10             	add    $0x10,%esp
c0009cbc:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0009cbf:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009cc5:	83 f8 21             	cmp    $0x21,%eax
c0009cc8:	74 1c                	je     c0009ce6 <sys_receive_msg+0x3e5>
c0009cca:	68 f1 05 00 00       	push   $0x5f1
c0009ccf:	68 63 b9 00 c0       	push   $0xc000b963
c0009cd4:	68 63 b9 00 c0       	push   $0xc000b963
c0009cd9:	68 e0 ba 00 c0       	push   $0xc000bae0
c0009cde:	e8 64 f7 ff ff       	call   c0009447 <assertion_failure>
c0009ce3:	83 c4 10             	add    $0x10,%esp
c0009ce6:	8b 45 10             	mov    0x10(%ebp),%eax
c0009ce9:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009cef:	85 c0                	test   %eax,%eax
c0009cf1:	74 1c                	je     c0009d0f <sys_receive_msg+0x40e>
c0009cf3:	68 f3 05 00 00       	push   $0x5f3
c0009cf8:	68 63 b9 00 c0       	push   $0xc000b963
c0009cfd:	68 63 b9 00 c0       	push   $0xc000b963
c0009d02:	68 0b ba 00 c0       	push   $0xc000ba0b
c0009d07:	e8 3b f7 ff ff       	call   c0009447 <assertion_failure>
c0009d0c:	83 c4 10             	add    $0x10,%esp
c0009d0f:	8b 45 10             	mov    0x10(%ebp),%eax
c0009d12:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009d19:	84 c0                	test   %al,%al
c0009d1b:	74 1c                	je     c0009d39 <sys_receive_msg+0x438>
c0009d1d:	68 f4 05 00 00       	push   $0x5f4
c0009d22:	68 63 b9 00 c0       	push   $0xc000b963
c0009d27:	68 63 b9 00 c0       	push   $0xc000b963
c0009d2c:	68 20 ba 00 c0       	push   $0xc000ba20
c0009d31:	e8 11 f7 ff ff       	call   c0009447 <assertion_failure>
c0009d36:	83 c4 10             	add    $0x10,%esp
c0009d39:	8b 45 10             	mov    0x10(%ebp),%eax
c0009d3c:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0009d42:	83 f8 21             	cmp    $0x21,%eax
c0009d45:	74 1c                	je     c0009d63 <sys_receive_msg+0x462>
c0009d47:	68 f5 05 00 00       	push   $0x5f5
c0009d4c:	68 63 b9 00 c0       	push   $0xc000b963
c0009d51:	68 63 b9 00 c0       	push   $0xc000b963
c0009d56:	68 38 ba 00 c0       	push   $0xc000ba38
c0009d5b:	e8 e7 f6 ff ff       	call   c0009447 <assertion_failure>
c0009d60:	83 c4 10             	add    $0x10,%esp
c0009d63:	8b 45 10             	mov    0x10(%ebp),%eax
c0009d66:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009d6c:	83 f8 21             	cmp    $0x21,%eax
c0009d6f:	0f 84 e4 00 00 00    	je     c0009e59 <sys_receive_msg+0x558>
c0009d75:	68 f6 05 00 00       	push   $0x5f6
c0009d7a:	68 63 b9 00 c0       	push   $0xc000b963
c0009d7f:	68 63 b9 00 c0       	push   $0xc000b963
c0009d84:	68 04 bb 00 c0       	push   $0xc000bb04
c0009d89:	e8 b9 f6 ff ff       	call   c0009447 <assertion_failure>
c0009d8e:	83 c4 10             	add    $0x10,%esp
c0009d91:	e9 c3 00 00 00       	jmp    c0009e59 <sys_receive_msg+0x558>
c0009d96:	8b 45 10             	mov    0x10(%ebp),%eax
c0009d99:	c6 80 48 02 00 00 02 	movb   $0x2,0x248(%eax)
c0009da0:	8b 45 10             	mov    0x10(%ebp),%eax
c0009da3:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009daa:	3c 02                	cmp    $0x2,%al
c0009dac:	74 1c                	je     c0009dca <sys_receive_msg+0x4c9>
c0009dae:	68 fb 05 00 00       	push   $0x5fb
c0009db3:	68 63 b9 00 c0       	push   $0xc000b963
c0009db8:	68 63 b9 00 c0       	push   $0xc000b963
c0009dbd:	68 23 bb 00 c0       	push   $0xc000bb23
c0009dc2:	e8 80 f6 ff ff       	call   c0009447 <assertion_failure>
c0009dc7:	83 c4 10             	add    $0x10,%esp
c0009dca:	8b 45 10             	mov    0x10(%ebp),%eax
c0009dcd:	8b 55 08             	mov    0x8(%ebp),%edx
c0009dd0:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c0009dd6:	8b 45 10             	mov    0x10(%ebp),%eax
c0009dd9:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009de0:	3c 02                	cmp    $0x2,%al
c0009de2:	74 1c                	je     c0009e00 <sys_receive_msg+0x4ff>
c0009de4:	68 fd 05 00 00       	push   $0x5fd
c0009de9:	68 63 b9 00 c0       	push   $0xc000b963
c0009dee:	68 63 b9 00 c0       	push   $0xc000b963
c0009df3:	68 23 bb 00 c0       	push   $0xc000bb23
c0009df8:	e8 4a f6 ff ff       	call   c0009447 <assertion_failure>
c0009dfd:	83 c4 10             	add    $0x10,%esp
c0009e00:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0009e04:	75 0f                	jne    c0009e15 <sys_receive_msg+0x514>
c0009e06:	8b 45 10             	mov    0x10(%ebp),%eax
c0009e09:	c7 80 54 02 00 00 12 	movl   $0x12,0x254(%eax)
c0009e10:	00 00 00 
c0009e13:	eb 0c                	jmp    c0009e21 <sys_receive_msg+0x520>
c0009e15:	8b 45 10             	mov    0x10(%ebp),%eax
c0009e18:	8b 55 0c             	mov    0xc(%ebp),%edx
c0009e1b:	89 90 54 02 00 00    	mov    %edx,0x254(%eax)
c0009e21:	8b 45 10             	mov    0x10(%ebp),%eax
c0009e24:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009e2b:	3c 02                	cmp    $0x2,%al
c0009e2d:	74 1c                	je     c0009e4b <sys_receive_msg+0x54a>
c0009e2f:	68 08 06 00 00       	push   $0x608
c0009e34:	68 63 b9 00 c0       	push   $0xc000b963
c0009e39:	68 63 b9 00 c0       	push   $0xc000b963
c0009e3e:	68 23 bb 00 c0       	push   $0xc000bb23
c0009e43:	e8 ff f5 ff ff       	call   c0009447 <assertion_failure>
c0009e48:	83 c4 10             	add    $0x10,%esp
c0009e4b:	83 ec 0c             	sub    $0xc,%esp
c0009e4e:	ff 75 10             	pushl  0x10(%ebp)
c0009e51:	e8 09 01 00 00       	call   c0009f5f <block>
c0009e56:	83 c4 10             	add    $0x10,%esp
c0009e59:	b8 00 00 00 00       	mov    $0x0,%eax
c0009e5e:	eb 02                	jmp    c0009e62 <sys_receive_msg+0x561>
c0009e60:	90                   	nop
c0009e61:	90                   	nop
c0009e62:	c9                   	leave  
c0009e63:	c3                   	ret    

c0009e64 <send_rec>:
c0009e64:	55                   	push   %ebp
c0009e65:	89 e5                	mov    %esp,%ebp
c0009e67:	83 ec 18             	sub    $0x18,%esp
c0009e6a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009e6d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009e70:	c7 45 f0 7c 00 00 00 	movl   $0x7c,-0x10(%ebp)
c0009e77:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c0009e7b:	74 28                	je     c0009ea5 <send_rec+0x41>
c0009e7d:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0009e81:	74 22                	je     c0009ea5 <send_rec+0x41>
c0009e83:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c0009e87:	74 1c                	je     c0009ea5 <send_rec+0x41>
c0009e89:	68 1a 06 00 00       	push   $0x61a
c0009e8e:	68 63 b9 00 c0       	push   $0xc000b963
c0009e93:	68 63 b9 00 c0       	push   $0xc000b963
c0009e98:	68 44 bb 00 c0       	push   $0xc000bb44
c0009e9d:	e8 a5 f5 ff ff       	call   c0009447 <assertion_failure>
c0009ea2:	83 c4 10             	add    $0x10,%esp
c0009ea5:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0009ea9:	75 14                	jne    c0009ebf <send_rec+0x5b>
c0009eab:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009eae:	83 ec 04             	sub    $0x4,%esp
c0009eb1:	50                   	push   %eax
c0009eb2:	6a 00                	push   $0x0
c0009eb4:	ff 75 0c             	pushl  0xc(%ebp)
c0009eb7:	e8 63 1d 00 00       	call   c000bc1f <Memset>
c0009ebc:	83 c4 10             	add    $0x10,%esp
c0009ebf:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0009ec3:	74 23                	je     c0009ee8 <send_rec+0x84>
c0009ec5:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c0009ec9:	74 34                	je     c0009eff <send_rec+0x9b>
c0009ecb:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c0009ecf:	75 74                	jne    c0009f45 <send_rec+0xe1>
c0009ed1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009ed4:	83 ec 08             	sub    $0x8,%esp
c0009ed7:	ff 75 10             	pushl  0x10(%ebp)
c0009eda:	50                   	push   %eax
c0009edb:	e8 60 85 ff ff       	call   c0002440 <send_msg>
c0009ee0:	83 c4 10             	add    $0x10,%esp
c0009ee3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009ee6:	eb 70                	jmp    c0009f58 <send_rec+0xf4>
c0009ee8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009eeb:	83 ec 08             	sub    $0x8,%esp
c0009eee:	ff 75 10             	pushl  0x10(%ebp)
c0009ef1:	50                   	push   %eax
c0009ef2:	e8 5f 85 ff ff       	call   c0002456 <receive_msg>
c0009ef7:	83 c4 10             	add    $0x10,%esp
c0009efa:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009efd:	eb 59                	jmp    c0009f58 <send_rec+0xf4>
c0009eff:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009f02:	83 ec 08             	sub    $0x8,%esp
c0009f05:	ff 75 10             	pushl  0x10(%ebp)
c0009f08:	50                   	push   %eax
c0009f09:	e8 32 85 ff ff       	call   c0002440 <send_msg>
c0009f0e:	83 c4 10             	add    $0x10,%esp
c0009f11:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009f14:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0009f18:	75 3d                	jne    c0009f57 <send_rec+0xf3>
c0009f1a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009f1d:	83 ec 04             	sub    $0x4,%esp
c0009f20:	50                   	push   %eax
c0009f21:	6a 00                	push   $0x0
c0009f23:	ff 75 0c             	pushl  0xc(%ebp)
c0009f26:	e8 f4 1c 00 00       	call   c000bc1f <Memset>
c0009f2b:	83 c4 10             	add    $0x10,%esp
c0009f2e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009f31:	83 ec 08             	sub    $0x8,%esp
c0009f34:	ff 75 10             	pushl  0x10(%ebp)
c0009f37:	50                   	push   %eax
c0009f38:	e8 19 85 ff ff       	call   c0002456 <receive_msg>
c0009f3d:	83 c4 10             	add    $0x10,%esp
c0009f40:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009f43:	eb 12                	jmp    c0009f57 <send_rec+0xf3>
c0009f45:	83 ec 0c             	sub    $0xc,%esp
c0009f48:	68 80 bb 00 c0       	push   $0xc000bb80
c0009f4d:	e8 d7 f4 ff ff       	call   c0009429 <panic>
c0009f52:	83 c4 10             	add    $0x10,%esp
c0009f55:	eb 01                	jmp    c0009f58 <send_rec+0xf4>
c0009f57:	90                   	nop
c0009f58:	b8 00 00 00 00       	mov    $0x0,%eax
c0009f5d:	c9                   	leave  
c0009f5e:	c3                   	ret    

c0009f5f <block>:
c0009f5f:	55                   	push   %ebp
c0009f60:	89 e5                	mov    %esp,%ebp
c0009f62:	83 ec 08             	sub    $0x8,%esp
c0009f65:	8b 45 08             	mov    0x8(%ebp),%eax
c0009f68:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009f6f:	84 c0                	test   %al,%al
c0009f71:	75 1c                	jne    c0009f8f <block+0x30>
c0009f73:	68 49 06 00 00       	push   $0x649
c0009f78:	68 63 b9 00 c0       	push   $0xc000b963
c0009f7d:	68 63 b9 00 c0       	push   $0xc000b963
c0009f82:	68 95 bb 00 c0       	push   $0xc000bb95
c0009f87:	e8 bb f4 ff ff       	call   c0009447 <assertion_failure>
c0009f8c:	83 c4 10             	add    $0x10,%esp
c0009f8f:	e8 34 a5 ff ff       	call   c00044c8 <schedule_process>
c0009f94:	b8 00 00 00 00       	mov    $0x0,%eax
c0009f99:	c9                   	leave  
c0009f9a:	c3                   	ret    

c0009f9b <unblock>:
c0009f9b:	55                   	push   %ebp
c0009f9c:	89 e5                	mov    %esp,%ebp
c0009f9e:	83 ec 08             	sub    $0x8,%esp
c0009fa1:	8b 45 08             	mov    0x8(%ebp),%eax
c0009fa4:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009fab:	84 c0                	test   %al,%al
c0009fad:	74 1c                	je     c0009fcb <unblock+0x30>
c0009faf:	68 52 06 00 00       	push   $0x652
c0009fb4:	68 63 b9 00 c0       	push   $0xc000b963
c0009fb9:	68 63 b9 00 c0       	push   $0xc000b963
c0009fbe:	68 ad bb 00 c0       	push   $0xc000bbad
c0009fc3:	e8 7f f4 ff ff       	call   c0009447 <assertion_failure>
c0009fc8:	83 c4 10             	add    $0x10,%esp
c0009fcb:	8b 45 08             	mov    0x8(%ebp),%eax
c0009fce:	05 00 01 00 00       	add    $0x100,%eax
c0009fd3:	83 ec 08             	sub    $0x8,%esp
c0009fd6:	50                   	push   %eax
c0009fd7:	68 ec 0d 01 c0       	push   $0xc0010dec
c0009fdc:	e8 df 0a 00 00       	call   c000aac0 <appendToDoubleLinkList>
c0009fe1:	83 c4 10             	add    $0x10,%esp
c0009fe4:	b8 00 00 00 00       	mov    $0x0,%eax
c0009fe9:	c9                   	leave  
c0009fea:	c3                   	ret    

c0009feb <get_ticks_ipc>:
c0009feb:	55                   	push   %ebp
c0009fec:	89 e5                	mov    %esp,%ebp
c0009fee:	81 ec 98 00 00 00    	sub    $0x98,%esp
c0009ff4:	83 ec 04             	sub    $0x4,%esp
c0009ff7:	6a 7c                	push   $0x7c
c0009ff9:	6a 00                	push   $0x0
c0009ffb:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c000a001:	50                   	push   %eax
c000a002:	e8 18 1c 00 00       	call   c000bc1f <Memset>
c000a007:	83 c4 10             	add    $0x10,%esp
c000a00a:	c7 85 78 ff ff ff 01 	movl   $0x1,-0x88(%ebp)
c000a011:	00 00 00 
c000a014:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c000a01b:	83 ec 04             	sub    $0x4,%esp
c000a01e:	6a 01                	push   $0x1
c000a020:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c000a026:	50                   	push   %eax
c000a027:	6a 03                	push   $0x3
c000a029:	e8 36 fe ff ff       	call   c0009e64 <send_rec>
c000a02e:	83 c4 10             	add    $0x10,%esp
c000a031:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a034:	8b 85 7c ff ff ff    	mov    -0x84(%ebp),%eax
c000a03a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a03d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a040:	c9                   	leave  
c000a041:	c3                   	ret    

c000a042 <itoa>:
c000a042:	55                   	push   %ebp
c000a043:	89 e5                	mov    %esp,%ebp
c000a045:	53                   	push   %ebx
c000a046:	83 ec 14             	sub    $0x14,%esp
c000a049:	8b 45 08             	mov    0x8(%ebp),%eax
c000a04c:	99                   	cltd   
c000a04d:	f7 7d 10             	idivl  0x10(%ebp)
c000a050:	89 55 f4             	mov    %edx,-0xc(%ebp)
c000a053:	8b 45 08             	mov    0x8(%ebp),%eax
c000a056:	99                   	cltd   
c000a057:	f7 7d 10             	idivl  0x10(%ebp)
c000a05a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a05d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000a061:	74 14                	je     c000a077 <itoa+0x35>
c000a063:	83 ec 04             	sub    $0x4,%esp
c000a066:	ff 75 10             	pushl  0x10(%ebp)
c000a069:	ff 75 0c             	pushl  0xc(%ebp)
c000a06c:	ff 75 f0             	pushl  -0x10(%ebp)
c000a06f:	e8 ce ff ff ff       	call   c000a042 <itoa>
c000a074:	83 c4 10             	add    $0x10,%esp
c000a077:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a07a:	8d 58 30             	lea    0x30(%eax),%ebx
c000a07d:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a080:	8b 00                	mov    (%eax),%eax
c000a082:	8d 48 01             	lea    0x1(%eax),%ecx
c000a085:	8b 55 0c             	mov    0xc(%ebp),%edx
c000a088:	89 0a                	mov    %ecx,(%edx)
c000a08a:	89 da                	mov    %ebx,%edx
c000a08c:	88 10                	mov    %dl,(%eax)
c000a08e:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a091:	8b 00                	mov    (%eax),%eax
c000a093:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c000a096:	c9                   	leave  
c000a097:	c3                   	ret    

c000a098 <i2a>:
c000a098:	55                   	push   %ebp
c000a099:	89 e5                	mov    %esp,%ebp
c000a09b:	53                   	push   %ebx
c000a09c:	83 ec 14             	sub    $0x14,%esp
c000a09f:	8b 45 08             	mov    0x8(%ebp),%eax
c000a0a2:	99                   	cltd   
c000a0a3:	f7 7d 0c             	idivl  0xc(%ebp)
c000a0a6:	89 55 f4             	mov    %edx,-0xc(%ebp)
c000a0a9:	8b 45 08             	mov    0x8(%ebp),%eax
c000a0ac:	99                   	cltd   
c000a0ad:	f7 7d 0c             	idivl  0xc(%ebp)
c000a0b0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a0b3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000a0b7:	74 14                	je     c000a0cd <i2a+0x35>
c000a0b9:	83 ec 04             	sub    $0x4,%esp
c000a0bc:	ff 75 10             	pushl  0x10(%ebp)
c000a0bf:	ff 75 0c             	pushl  0xc(%ebp)
c000a0c2:	ff 75 f0             	pushl  -0x10(%ebp)
c000a0c5:	e8 ce ff ff ff       	call   c000a098 <i2a>
c000a0ca:	83 c4 10             	add    $0x10,%esp
c000a0cd:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c000a0d1:	7f 0a                	jg     c000a0dd <i2a+0x45>
c000a0d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a0d6:	83 c0 30             	add    $0x30,%eax
c000a0d9:	89 c3                	mov    %eax,%ebx
c000a0db:	eb 08                	jmp    c000a0e5 <i2a+0x4d>
c000a0dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a0e0:	83 c0 37             	add    $0x37,%eax
c000a0e3:	89 c3                	mov    %eax,%ebx
c000a0e5:	8b 45 10             	mov    0x10(%ebp),%eax
c000a0e8:	8b 00                	mov    (%eax),%eax
c000a0ea:	8d 48 01             	lea    0x1(%eax),%ecx
c000a0ed:	8b 55 10             	mov    0x10(%ebp),%edx
c000a0f0:	89 0a                	mov    %ecx,(%edx)
c000a0f2:	88 18                	mov    %bl,(%eax)
c000a0f4:	8b 45 10             	mov    0x10(%ebp),%eax
c000a0f7:	8b 00                	mov    (%eax),%eax
c000a0f9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c000a0fc:	c9                   	leave  
c000a0fd:	c3                   	ret    

c000a0fe <inform_int>:
c000a0fe:	55                   	push   %ebp
c000a0ff:	89 e5                	mov    %esp,%ebp
c000a101:	83 ec 18             	sub    $0x18,%esp
c000a104:	83 ec 0c             	sub    $0xc,%esp
c000a107:	ff 75 08             	pushl  0x8(%ebp)
c000a10a:	e8 0d a5 ff ff       	call   c000461c <pid2proc>
c000a10f:	83 c4 10             	add    $0x10,%esp
c000a112:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a115:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a118:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a11f:	0f be c0             	movsbl %al,%eax
c000a122:	83 e0 02             	and    $0x2,%eax
c000a125:	85 c0                	test   %eax,%eax
c000a127:	0f 84 8e 00 00 00    	je     c000a1bb <inform_int+0xbd>
c000a12d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a130:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c000a136:	3d 13 02 00 00       	cmp    $0x213,%eax
c000a13b:	74 0e                	je     c000a14b <inform_int+0x4d>
c000a13d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a140:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c000a146:	83 f8 12             	cmp    $0x12,%eax
c000a149:	75 7d                	jne    c000a1c8 <inform_int+0xca>
c000a14b:	c7 45 f0 7c 00 00 00 	movl   $0x7c,-0x10(%ebp)
c000a152:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a155:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c000a15b:	83 ec 08             	sub    $0x8,%esp
c000a15e:	ff 75 f0             	pushl  -0x10(%ebp)
c000a161:	50                   	push   %eax
c000a162:	e8 ed ca ff ff       	call   c0006c54 <alloc_virtual_memory>
c000a167:	83 c4 10             	add    $0x10,%esp
c000a16a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a16d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a170:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c000a176:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a179:	c7 40 78 d5 07 00 00 	movl   $0x7d5,0x78(%eax)
c000a180:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a183:	c7 80 60 02 00 00 00 	movl   $0x0,0x260(%eax)
c000a18a:	00 00 00 
c000a18d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a190:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c000a197:	00 00 00 
c000a19a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000a1a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a1a4:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c000a1ab:	83 ec 0c             	sub    $0xc,%esp
c000a1ae:	ff 75 f4             	pushl  -0xc(%ebp)
c000a1b1:	e8 e5 fd ff ff       	call   c0009f9b <unblock>
c000a1b6:	83 c4 10             	add    $0x10,%esp
c000a1b9:	eb 0d                	jmp    c000a1c8 <inform_int+0xca>
c000a1bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a1be:	c7 80 60 02 00 00 01 	movl   $0x1,0x260(%eax)
c000a1c5:	00 00 00 
c000a1c8:	90                   	nop
c000a1c9:	c9                   	leave  
c000a1ca:	c3                   	ret    

c000a1cb <strcmp>:
c000a1cb:	55                   	push   %ebp
c000a1cc:	89 e5                	mov    %esp,%ebp
c000a1ce:	83 ec 10             	sub    $0x10,%esp
c000a1d1:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c000a1d5:	74 06                	je     c000a1dd <strcmp+0x12>
c000a1d7:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000a1db:	75 08                	jne    c000a1e5 <strcmp+0x1a>
c000a1dd:	8b 45 08             	mov    0x8(%ebp),%eax
c000a1e0:	2b 45 0c             	sub    0xc(%ebp),%eax
c000a1e3:	eb 53                	jmp    c000a238 <strcmp+0x6d>
c000a1e5:	8b 45 08             	mov    0x8(%ebp),%eax
c000a1e8:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000a1eb:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a1ee:	89 45 f8             	mov    %eax,-0x8(%ebp)
c000a1f1:	eb 18                	jmp    c000a20b <strcmp+0x40>
c000a1f3:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a1f6:	0f b6 10             	movzbl (%eax),%edx
c000a1f9:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000a1fc:	0f b6 00             	movzbl (%eax),%eax
c000a1ff:	38 c2                	cmp    %al,%dl
c000a201:	75 1e                	jne    c000a221 <strcmp+0x56>
c000a203:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c000a207:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c000a20b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a20e:	0f b6 00             	movzbl (%eax),%eax
c000a211:	84 c0                	test   %al,%al
c000a213:	74 0d                	je     c000a222 <strcmp+0x57>
c000a215:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000a218:	0f b6 00             	movzbl (%eax),%eax
c000a21b:	84 c0                	test   %al,%al
c000a21d:	75 d4                	jne    c000a1f3 <strcmp+0x28>
c000a21f:	eb 01                	jmp    c000a222 <strcmp+0x57>
c000a221:	90                   	nop
c000a222:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a225:	0f b6 00             	movzbl (%eax),%eax
c000a228:	0f be d0             	movsbl %al,%edx
c000a22b:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000a22e:	0f b6 00             	movzbl (%eax),%eax
c000a231:	0f be c0             	movsbl %al,%eax
c000a234:	29 c2                	sub    %eax,%edx
c000a236:	89 d0                	mov    %edx,%eax
c000a238:	c9                   	leave  
c000a239:	c3                   	ret    

c000a23a <create_user_process_address_space>:
c000a23a:	55                   	push   %ebp
c000a23b:	89 e5                	mov    %esp,%ebp
c000a23d:	83 ec 18             	sub    $0x18,%esp
c000a240:	83 ec 08             	sub    $0x8,%esp
c000a243:	6a 00                	push   $0x0
c000a245:	6a 01                	push   $0x1
c000a247:	e8 3b cd ff ff       	call   c0006f87 <alloc_memory>
c000a24c:	83 c4 10             	add    $0x10,%esp
c000a24f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a252:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a255:	c7 40 08 00 80 04 08 	movl   $0x8048000,0x8(%eax)
c000a25c:	c7 45 f0 00 80 fb b7 	movl   $0xb7fb8000,-0x10(%ebp)
c000a263:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a266:	05 ff 0f 00 00       	add    $0xfff,%eax
c000a26b:	c1 e8 0c             	shr    $0xc,%eax
c000a26e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a271:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a274:	83 c0 07             	add    $0x7,%eax
c000a277:	c1 e8 03             	shr    $0x3,%eax
c000a27a:	89 c2                	mov    %eax,%edx
c000a27c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a27f:	89 50 04             	mov    %edx,0x4(%eax)
c000a282:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a285:	8b 40 04             	mov    0x4(%eax),%eax
c000a288:	05 ff 0f 00 00       	add    $0xfff,%eax
c000a28d:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c000a293:	85 c0                	test   %eax,%eax
c000a295:	0f 48 c2             	cmovs  %edx,%eax
c000a298:	c1 f8 0c             	sar    $0xc,%eax
c000a29b:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000a29e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a2a1:	83 ec 08             	sub    $0x8,%esp
c000a2a4:	6a 00                	push   $0x0
c000a2a6:	50                   	push   %eax
c000a2a7:	e8 db cc ff ff       	call   c0006f87 <alloc_memory>
c000a2ac:	83 c4 10             	add    $0x10,%esp
c000a2af:	89 c2                	mov    %eax,%edx
c000a2b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a2b4:	89 10                	mov    %edx,(%eax)
c000a2b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a2b9:	83 ec 0c             	sub    $0xc,%esp
c000a2bc:	50                   	push   %eax
c000a2bd:	e8 9c c4 ff ff       	call   c000675e <init_bitmap>
c000a2c2:	83 c4 10             	add    $0x10,%esp
c000a2c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a2c8:	c9                   	leave  
c000a2c9:	c3                   	ret    

c000a2ca <user_process>:
c000a2ca:	55                   	push   %ebp
c000a2cb:	89 e5                	mov    %esp,%ebp
c000a2cd:	83 ec 38             	sub    $0x38,%esp
c000a2d0:	c7 45 f0 b2 0c 00 00 	movl   $0xcb2,-0x10(%ebp)
c000a2d7:	c7 45 ec ba 0c 00 00 	movl   $0xcba,-0x14(%ebp)
c000a2de:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%ebp)
c000a2e5:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c000a2e9:	75 0e                	jne    c000a2f9 <user_process+0x2f>
c000a2eb:	66 c7 45 f6 48 00    	movw   $0x48,-0xa(%ebp)
c000a2f1:	66 c7 45 f4 50 00    	movw   $0x50,-0xc(%ebp)
c000a2f7:	eb 0c                	jmp    c000a305 <user_process+0x3b>
c000a2f9:	66 c7 45 f6 59 00    	movw   $0x59,-0xa(%ebp)
c000a2ff:	66 c7 45 f4 61 00    	movw   $0x61,-0xc(%ebp)
c000a305:	e8 8d 70 ff ff       	call   c0001397 <get_running_thread_pcb>
c000a30a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000a30d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a310:	05 00 10 00 00       	add    $0x1000,%eax
c000a315:	89 c2                	mov    %eax,%edx
c000a317:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a31a:	89 10                	mov    %edx,(%eax)
c000a31c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a31f:	8b 00                	mov    (%eax),%eax
c000a321:	83 e8 44             	sub    $0x44,%eax
c000a324:	89 c2                	mov    %eax,%edx
c000a326:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a329:	89 10                	mov    %edx,(%eax)
c000a32b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a32e:	8b 00                	mov    (%eax),%eax
c000a330:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000a333:	c6 45 df 00          	movb   $0x0,-0x21(%ebp)
c000a337:	66 c7 45 dc 02 12    	movw   $0x1202,-0x24(%ebp)
c000a33d:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c000a341:	66 89 45 da          	mov    %ax,-0x26(%ebp)
c000a345:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c000a349:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
c000a34d:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c000a351:	66 89 45 d6          	mov    %ax,-0x2a(%ebp)
c000a355:	66 c7 45 d4 38 00    	movw   $0x38,-0x2c(%ebp)
c000a35b:	0f b7 55 f4          	movzwl -0xc(%ebp),%edx
c000a35f:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a362:	89 50 34             	mov    %edx,0x34(%eax)
c000a365:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c000a369:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a36c:	89 50 0c             	mov    %edx,0xc(%eax)
c000a36f:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c000a373:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a376:	89 50 04             	mov    %edx,0x4(%eax)
c000a379:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c000a37d:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a380:	89 50 08             	mov    %edx,0x8(%eax)
c000a383:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c000a387:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a38a:	89 50 40             	mov    %edx,0x40(%eax)
c000a38d:	0f b7 55 d4          	movzwl -0x2c(%ebp),%edx
c000a391:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a394:	89 10                	mov    %edx,(%eax)
c000a396:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a399:	8b 55 08             	mov    0x8(%ebp),%edx
c000a39c:	89 50 30             	mov    %edx,0x30(%eax)
c000a39f:	0f b7 55 dc          	movzwl -0x24(%ebp),%edx
c000a3a3:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a3a6:	89 50 38             	mov    %edx,0x38(%eax)
c000a3a9:	83 ec 08             	sub    $0x8,%esp
c000a3ac:	6a 01                	push   $0x1
c000a3ae:	68 00 f0 ff bf       	push   $0xbffff000
c000a3b3:	e8 07 cb ff ff       	call   c0006ebf <alloc_physical_memory>
c000a3b8:	83 c4 10             	add    $0x10,%esp
c000a3bb:	8d 90 00 10 00 00    	lea    0x1000(%eax),%edx
c000a3c1:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a3c4:	89 50 3c             	mov    %edx,0x3c(%eax)
c000a3c7:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a3ca:	83 ec 0c             	sub    $0xc,%esp
c000a3cd:	50                   	push   %eax
c000a3ce:	e8 99 6e ff ff       	call   c000126c <restart>
c000a3d3:	83 c4 10             	add    $0x10,%esp
c000a3d6:	90                   	nop
c000a3d7:	c9                   	leave  
c000a3d8:	c3                   	ret    

c000a3d9 <clone_pcb>:
c000a3d9:	55                   	push   %ebp
c000a3da:	89 e5                	mov    %esp,%ebp
c000a3dc:	83 ec 38             	sub    $0x38,%esp
c000a3df:	83 ec 08             	sub    $0x8,%esp
c000a3e2:	6a 00                	push   $0x0
c000a3e4:	6a 01                	push   $0x1
c000a3e6:	e8 9c cb ff ff       	call   c0006f87 <alloc_memory>
c000a3eb:	83 c4 10             	add    $0x10,%esp
c000a3ee:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a3f1:	83 ec 04             	sub    $0x4,%esp
c000a3f4:	68 00 10 00 00       	push   $0x1000
c000a3f9:	6a 00                	push   $0x0
c000a3fb:	ff 75 f4             	pushl  -0xc(%ebp)
c000a3fe:	e8 1c 18 00 00       	call   c000bc1f <Memset>
c000a403:	83 c4 10             	add    $0x10,%esp
c000a406:	83 ec 04             	sub    $0x4,%esp
c000a409:	68 00 10 00 00       	push   $0x1000
c000a40e:	ff 75 08             	pushl  0x8(%ebp)
c000a411:	ff 75 f4             	pushl  -0xc(%ebp)
c000a414:	e8 55 d6 ff ff       	call   c0007a6e <Memcpy>
c000a419:	83 c4 10             	add    $0x10,%esp
c000a41c:	a1 90 07 01 c0       	mov    0xc0010790,%eax
c000a421:	83 c0 01             	add    $0x1,%eax
c000a424:	a3 90 07 01 c0       	mov    %eax,0xc0010790
c000a429:	8b 15 90 07 01 c0    	mov    0xc0010790,%edx
c000a42f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a432:	89 90 24 01 00 00    	mov    %edx,0x124(%eax)
c000a438:	8b 45 08             	mov    0x8(%ebp),%eax
c000a43b:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c000a441:	89 c2                	mov    %eax,%edx
c000a443:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a446:	89 90 64 02 00 00    	mov    %edx,0x264(%eax)
c000a44c:	83 ec 08             	sub    $0x8,%esp
c000a44f:	6a 00                	push   $0x0
c000a451:	6a 01                	push   $0x1
c000a453:	e8 2f cb ff ff       	call   c0006f87 <alloc_memory>
c000a458:	83 c4 10             	add    $0x10,%esp
c000a45b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a45e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a461:	05 00 0c 00 00       	add    $0xc00,%eax
c000a466:	83 ec 04             	sub    $0x4,%esp
c000a469:	68 00 04 00 00       	push   $0x400
c000a46e:	68 00 fc ff ff       	push   $0xfffffc00
c000a473:	50                   	push   %eax
c000a474:	e8 f5 d5 ff ff       	call   c0007a6e <Memcpy>
c000a479:	83 c4 10             	add    $0x10,%esp
c000a47c:	83 ec 0c             	sub    $0xc,%esp
c000a47f:	ff 75 f0             	pushl  -0x10(%ebp)
c000a482:	e8 17 c9 ff ff       	call   c0006d9e <get_physical_address>
c000a487:	83 c4 10             	add    $0x10,%esp
c000a48a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a48d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a490:	05 fc 0f 00 00       	add    $0xffc,%eax
c000a495:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000a498:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a49b:	83 c8 07             	or     $0x7,%eax
c000a49e:	89 c2                	mov    %eax,%edx
c000a4a0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a4a3:	89 10                	mov    %edx,(%eax)
c000a4a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a4a8:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000a4ab:	89 50 08             	mov    %edx,0x8(%eax)
c000a4ae:	e8 87 fd ff ff       	call   c000a23a <create_user_process_address_space>
c000a4b3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000a4b6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c000a4b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a4bc:	89 50 0c             	mov    %edx,0xc(%eax)
c000a4bf:	8b 45 08             	mov    0x8(%ebp),%eax
c000a4c2:	8b 40 0c             	mov    0xc(%eax),%eax
c000a4c5:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000a4c8:	83 ec 04             	sub    $0x4,%esp
c000a4cb:	6a 0c                	push   $0xc
c000a4cd:	ff 75 e0             	pushl  -0x20(%ebp)
c000a4d0:	ff 75 e4             	pushl  -0x1c(%ebp)
c000a4d3:	e8 96 d5 ff ff       	call   c0007a6e <Memcpy>
c000a4d8:	83 c4 10             	add    $0x10,%esp
c000a4db:	c7 45 dc 00 80 fb b7 	movl   $0xb7fb8000,-0x24(%ebp)
c000a4e2:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000a4e5:	05 ff 0f 00 00       	add    $0xfff,%eax
c000a4ea:	c1 e8 0c             	shr    $0xc,%eax
c000a4ed:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000a4f0:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000a4f3:	83 c0 07             	add    $0x7,%eax
c000a4f6:	c1 e8 03             	shr    $0x3,%eax
c000a4f9:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000a4fc:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000a4ff:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000a502:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000a505:	05 ff 0f 00 00       	add    $0xfff,%eax
c000a50a:	c1 e8 0c             	shr    $0xc,%eax
c000a50d:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000a510:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000a513:	83 ec 08             	sub    $0x8,%esp
c000a516:	6a 00                	push   $0x0
c000a518:	50                   	push   %eax
c000a519:	e8 69 ca ff ff       	call   c0006f87 <alloc_memory>
c000a51e:	83 c4 10             	add    $0x10,%esp
c000a521:	89 c2                	mov    %eax,%edx
c000a523:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a526:	89 10                	mov    %edx,(%eax)
c000a528:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000a52b:	c1 e0 0c             	shl    $0xc,%eax
c000a52e:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000a531:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a534:	8b 10                	mov    (%eax),%edx
c000a536:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a539:	8b 00                	mov    (%eax),%eax
c000a53b:	83 ec 04             	sub    $0x4,%esp
c000a53e:	ff 75 cc             	pushl  -0x34(%ebp)
c000a541:	52                   	push   %edx
c000a542:	50                   	push   %eax
c000a543:	e8 26 d5 ff ff       	call   c0007a6e <Memcpy>
c000a548:	83 c4 10             	add    $0x10,%esp
c000a54b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a54e:	c9                   	leave  
c000a54f:	c3                   	ret    

c000a550 <build_body_stack>:
c000a550:	55                   	push   %ebp
c000a551:	89 e5                	mov    %esp,%ebp
c000a553:	83 ec 48             	sub    $0x48,%esp
c000a556:	8b 45 08             	mov    0x8(%ebp),%eax
c000a559:	8b 40 0c             	mov    0xc(%eax),%eax
c000a55c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000a55f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a562:	8b 50 04             	mov    0x4(%eax),%edx
c000a565:	8b 00                	mov    (%eax),%eax
c000a567:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c000a56a:	89 55 c8             	mov    %edx,-0x38(%ebp)
c000a56d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c000a570:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000a573:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000a576:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000a579:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a57c:	8b 40 08             	mov    0x8(%eax),%eax
c000a57f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000a582:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000a589:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000a590:	e8 75 d4 ff ff       	call   c0007a0a <intr_disable>
c000a595:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000a598:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000a59f:	e9 c2 00 00 00       	jmp    c000a666 <build_body_stack+0x116>
c000a5a4:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000a5a7:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a5aa:	01 d0                	add    %edx,%eax
c000a5ac:	0f b6 00             	movzbl (%eax),%eax
c000a5af:	88 45 d3             	mov    %al,-0x2d(%ebp)
c000a5b2:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000a5b9:	e9 9a 00 00 00       	jmp    c000a658 <build_body_stack+0x108>
c000a5be:	0f be 55 d3          	movsbl -0x2d(%ebp),%edx
c000a5c2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a5c5:	89 c1                	mov    %eax,%ecx
c000a5c7:	d3 fa                	sar    %cl,%edx
c000a5c9:	89 d0                	mov    %edx,%eax
c000a5cb:	83 e0 01             	and    $0x1,%eax
c000a5ce:	85 c0                	test   %eax,%eax
c000a5d0:	75 06                	jne    c000a5d8 <build_body_stack+0x88>
c000a5d2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000a5d6:	eb 7c                	jmp    c000a654 <build_body_stack+0x104>
c000a5d8:	8b 45 08             	mov    0x8(%ebp),%eax
c000a5db:	8b 40 08             	mov    0x8(%eax),%eax
c000a5de:	83 ec 0c             	sub    $0xc,%esp
c000a5e1:	50                   	push   %eax
c000a5e2:	e8 94 6d ff ff       	call   c000137b <update_cr3>
c000a5e7:	83 c4 10             	add    $0x10,%esp
c000a5ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a5ed:	c1 e0 0c             	shl    $0xc,%eax
c000a5f0:	89 c2                	mov    %eax,%edx
c000a5f2:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000a5f5:	01 d0                	add    %edx,%eax
c000a5f7:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000a5fa:	8b 55 cc             	mov    -0x34(%ebp),%edx
c000a5fd:	8b 45 10             	mov    0x10(%ebp),%eax
c000a600:	83 ec 04             	sub    $0x4,%esp
c000a603:	68 00 10 00 00       	push   $0x1000
c000a608:	52                   	push   %edx
c000a609:	50                   	push   %eax
c000a60a:	e8 5f d4 ff ff       	call   c0007a6e <Memcpy>
c000a60f:	83 c4 10             	add    $0x10,%esp
c000a612:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a615:	8b 40 08             	mov    0x8(%eax),%eax
c000a618:	83 ec 0c             	sub    $0xc,%esp
c000a61b:	50                   	push   %eax
c000a61c:	e8 5a 6d ff ff       	call   c000137b <update_cr3>
c000a621:	83 c4 10             	add    $0x10,%esp
c000a624:	83 ec 08             	sub    $0x8,%esp
c000a627:	ff 75 cc             	pushl  -0x34(%ebp)
c000a62a:	6a 01                	push   $0x1
c000a62c:	e8 b8 c9 ff ff       	call   c0006fe9 <get_a_virtual_page>
c000a631:	83 c4 10             	add    $0x10,%esp
c000a634:	8b 55 10             	mov    0x10(%ebp),%edx
c000a637:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000a63a:	83 ec 04             	sub    $0x4,%esp
c000a63d:	68 00 10 00 00       	push   $0x1000
c000a642:	52                   	push   %edx
c000a643:	50                   	push   %eax
c000a644:	e8 25 d4 ff ff       	call   c0007a6e <Memcpy>
c000a649:	83 c4 10             	add    $0x10,%esp
c000a64c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000a650:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c000a654:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c000a658:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c000a65c:	0f 8e 5c ff ff ff    	jle    c000a5be <build_body_stack+0x6e>
c000a662:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c000a666:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a669:	39 45 dc             	cmp    %eax,-0x24(%ebp)
c000a66c:	0f 87 32 ff ff ff    	ja     c000a5a4 <build_body_stack+0x54>
c000a672:	83 ec 0c             	sub    $0xc,%esp
c000a675:	ff 75 d4             	pushl  -0x2c(%ebp)
c000a678:	e8 b6 d3 ff ff       	call   c0007a33 <intr_set_status>
c000a67d:	83 c4 10             	add    $0x10,%esp
c000a680:	90                   	nop
c000a681:	c9                   	leave  
c000a682:	c3                   	ret    

c000a683 <build_process_kernel_stack>:
c000a683:	55                   	push   %ebp
c000a684:	89 e5                	mov    %esp,%ebp
c000a686:	83 ec 28             	sub    $0x28,%esp
c000a689:	e8 7c d3 ff ff       	call   c0007a0a <intr_disable>
c000a68e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a691:	8b 45 08             	mov    0x8(%ebp),%eax
c000a694:	05 00 10 00 00       	add    $0x1000,%eax
c000a699:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a69c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a69f:	8b 00                	mov    (%eax),%eax
c000a6a1:	83 f8 38             	cmp    $0x38,%eax
c000a6a4:	74 06                	je     c000a6ac <build_process_kernel_stack+0x29>
c000a6a6:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c000a6aa:	eb f0                	jmp    c000a69c <build_process_kernel_stack+0x19>
c000a6ac:	90                   	nop
c000a6ad:	8b 45 08             	mov    0x8(%ebp),%eax
c000a6b0:	05 00 10 00 00       	add    $0x1000,%eax
c000a6b5:	89 c2                	mov    %eax,%edx
c000a6b7:	8b 45 08             	mov    0x8(%ebp),%eax
c000a6ba:	89 50 04             	mov    %edx,0x4(%eax)
c000a6bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a6c0:	83 c0 2c             	add    $0x2c,%eax
c000a6c3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a6c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a6c9:	83 e8 04             	sub    $0x4,%eax
c000a6cc:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000a6cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a6d2:	83 e8 08             	sub    $0x8,%eax
c000a6d5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000a6d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a6db:	83 e8 0c             	sub    $0xc,%eax
c000a6de:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000a6e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a6e4:	83 e8 10             	sub    $0x10,%eax
c000a6e7:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000a6ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a6ed:	83 e8 14             	sub    $0x14,%eax
c000a6f0:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000a6f3:	ba 63 12 00 c0       	mov    $0xc0001263,%edx
c000a6f8:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a6fb:	89 10                	mov    %edx,(%eax)
c000a6fd:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000a700:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000a706:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000a709:	8b 10                	mov    (%eax),%edx
c000a70b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000a70e:	89 10                	mov    %edx,(%eax)
c000a710:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000a713:	8b 10                	mov    (%eax),%edx
c000a715:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a718:	89 10                	mov    %edx,(%eax)
c000a71a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a71d:	8b 10                	mov    (%eax),%edx
c000a71f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a722:	89 10                	mov    %edx,(%eax)
c000a724:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a727:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000a72d:	8b 45 08             	mov    0x8(%ebp),%eax
c000a730:	8b 55 d8             	mov    -0x28(%ebp),%edx
c000a733:	89 10                	mov    %edx,(%eax)
c000a735:	83 ec 0c             	sub    $0xc,%esp
c000a738:	ff 75 f0             	pushl  -0x10(%ebp)
c000a73b:	e8 f3 d2 ff ff       	call   c0007a33 <intr_set_status>
c000a740:	83 c4 10             	add    $0x10,%esp
c000a743:	90                   	nop
c000a744:	c9                   	leave  
c000a745:	c3                   	ret    

c000a746 <fork_process>:
c000a746:	55                   	push   %ebp
c000a747:	89 e5                	mov    %esp,%ebp
c000a749:	83 ec 18             	sub    $0x18,%esp
c000a74c:	8b 45 08             	mov    0x8(%ebp),%eax
c000a74f:	83 ec 0c             	sub    $0xc,%esp
c000a752:	50                   	push   %eax
c000a753:	e8 c4 9e ff ff       	call   c000461c <pid2proc>
c000a758:	83 c4 10             	add    $0x10,%esp
c000a75b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a75e:	83 ec 0c             	sub    $0xc,%esp
c000a761:	ff 75 f4             	pushl  -0xc(%ebp)
c000a764:	e8 70 fc ff ff       	call   c000a3d9 <clone_pcb>
c000a769:	83 c4 10             	add    $0x10,%esp
c000a76c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a76f:	83 ec 08             	sub    $0x8,%esp
c000a772:	6a 00                	push   $0x0
c000a774:	6a 01                	push   $0x1
c000a776:	e8 0c c8 ff ff       	call   c0006f87 <alloc_memory>
c000a77b:	83 c4 10             	add    $0x10,%esp
c000a77e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a781:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a784:	83 ec 04             	sub    $0x4,%esp
c000a787:	68 00 10 00 00       	push   $0x1000
c000a78c:	6a 00                	push   $0x0
c000a78e:	50                   	push   %eax
c000a78f:	e8 8b 14 00 00       	call   c000bc1f <Memset>
c000a794:	83 c4 10             	add    $0x10,%esp
c000a797:	83 ec 04             	sub    $0x4,%esp
c000a79a:	ff 75 ec             	pushl  -0x14(%ebp)
c000a79d:	ff 75 f0             	pushl  -0x10(%ebp)
c000a7a0:	ff 75 f4             	pushl  -0xc(%ebp)
c000a7a3:	e8 a8 fd ff ff       	call   c000a550 <build_body_stack>
c000a7a8:	83 c4 10             	add    $0x10,%esp
c000a7ab:	83 ec 0c             	sub    $0xc,%esp
c000a7ae:	ff 75 f0             	pushl  -0x10(%ebp)
c000a7b1:	e8 cd fe ff ff       	call   c000a683 <build_process_kernel_stack>
c000a7b6:	83 c4 10             	add    $0x10,%esp
c000a7b9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a7bc:	05 00 01 00 00       	add    $0x100,%eax
c000a7c1:	83 ec 04             	sub    $0x4,%esp
c000a7c4:	6a 08                	push   $0x8
c000a7c6:	6a 00                	push   $0x0
c000a7c8:	50                   	push   %eax
c000a7c9:	e8 51 14 00 00       	call   c000bc1f <Memset>
c000a7ce:	83 c4 10             	add    $0x10,%esp
c000a7d1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a7d4:	05 08 01 00 00       	add    $0x108,%eax
c000a7d9:	83 ec 04             	sub    $0x4,%esp
c000a7dc:	6a 08                	push   $0x8
c000a7de:	6a 00                	push   $0x0
c000a7e0:	50                   	push   %eax
c000a7e1:	e8 39 14 00 00       	call   c000bc1f <Memset>
c000a7e6:	83 c4 10             	add    $0x10,%esp
c000a7e9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a7ec:	05 08 01 00 00       	add    $0x108,%eax
c000a7f1:	83 ec 08             	sub    $0x8,%esp
c000a7f4:	50                   	push   %eax
c000a7f5:	68 04 1f 01 c0       	push   $0xc0011f04
c000a7fa:	e8 c1 02 00 00       	call   c000aac0 <appendToDoubleLinkList>
c000a7ff:	83 c4 10             	add    $0x10,%esp
c000a802:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a805:	c9                   	leave  
c000a806:	c3                   	ret    

c000a807 <process_execute>:
c000a807:	55                   	push   %ebp
c000a808:	89 e5                	mov    %esp,%ebp
c000a80a:	83 ec 28             	sub    $0x28,%esp
c000a80d:	e8 c4 04 00 00       	call   c000acd6 <thread_init>
c000a812:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a815:	83 ec 0c             	sub    $0xc,%esp
c000a818:	ff 75 f4             	pushl  -0xc(%ebp)
c000a81b:	e8 63 05 00 00       	call   c000ad83 <thread_create>
c000a820:	83 c4 10             	add    $0x10,%esp
c000a823:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a826:	05 34 01 00 00       	add    $0x134,%eax
c000a82b:	83 ec 08             	sub    $0x8,%esp
c000a82e:	ff 75 10             	pushl  0x10(%ebp)
c000a831:	50                   	push   %eax
c000a832:	e8 07 14 00 00       	call   c000bc3e <Strcpy>
c000a837:	83 c4 10             	add    $0x10,%esp
c000a83a:	83 ec 08             	sub    $0x8,%esp
c000a83d:	6a 00                	push   $0x0
c000a83f:	6a 01                	push   $0x1
c000a841:	e8 41 c7 ff ff       	call   c0006f87 <alloc_memory>
c000a846:	83 c4 10             	add    $0x10,%esp
c000a849:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a84c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a84f:	05 00 0c 00 00       	add    $0xc00,%eax
c000a854:	83 ec 04             	sub    $0x4,%esp
c000a857:	68 00 04 00 00       	push   $0x400
c000a85c:	68 00 fc ff ff       	push   $0xfffffc00
c000a861:	50                   	push   %eax
c000a862:	e8 07 d2 ff ff       	call   c0007a6e <Memcpy>
c000a867:	83 c4 10             	add    $0x10,%esp
c000a86a:	83 ec 0c             	sub    $0xc,%esp
c000a86d:	ff 75 f0             	pushl  -0x10(%ebp)
c000a870:	e8 29 c5 ff ff       	call   c0006d9e <get_physical_address>
c000a875:	83 c4 10             	add    $0x10,%esp
c000a878:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a87b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a87e:	05 fc 0f 00 00       	add    $0xffc,%eax
c000a883:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000a886:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a889:	83 c8 07             	or     $0x7,%eax
c000a88c:	89 c2                	mov    %eax,%edx
c000a88e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a891:	89 10                	mov    %edx,(%eax)
c000a893:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a896:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000a899:	89 50 08             	mov    %edx,0x8(%eax)
c000a89c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a89f:	83 c0 10             	add    $0x10,%eax
c000a8a2:	83 ec 0c             	sub    $0xc,%esp
c000a8a5:	50                   	push   %eax
c000a8a6:	e8 88 cc ff ff       	call   c0007533 <init_memory_block_desc>
c000a8ab:	83 c4 10             	add    $0x10,%esp
c000a8ae:	e8 87 f9 ff ff       	call   c000a23a <create_user_process_address_space>
c000a8b3:	89 c2                	mov    %eax,%edx
c000a8b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a8b8:	89 50 0c             	mov    %edx,0xc(%eax)
c000a8bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a8be:	8b 00                	mov    (%eax),%eax
c000a8c0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000a8c3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a8c6:	c7 40 10 ca a2 00 c0 	movl   $0xc000a2ca,0x10(%eax)
c000a8cd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a8d0:	8b 55 08             	mov    0x8(%ebp),%edx
c000a8d3:	89 50 18             	mov    %edx,0x18(%eax)
c000a8d6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a8d9:	8b 55 0c             	mov    0xc(%ebp),%edx
c000a8dc:	89 50 1c             	mov    %edx,0x1c(%eax)
c000a8df:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a8e2:	8b 55 14             	mov    0x14(%ebp),%edx
c000a8e5:	89 50 20             	mov    %edx,0x20(%eax)
c000a8e8:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000a8eb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a8ee:	89 50 24             	mov    %edx,0x24(%eax)
c000a8f1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a8f4:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000a8fa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a8fd:	8b 10                	mov    (%eax),%edx
c000a8ff:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a902:	89 50 04             	mov    %edx,0x4(%eax)
c000a905:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a908:	8b 50 04             	mov    0x4(%eax),%edx
c000a90b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a90e:	89 50 08             	mov    %edx,0x8(%eax)
c000a911:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a914:	8b 50 08             	mov    0x8(%eax),%edx
c000a917:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a91a:	89 50 0c             	mov    %edx,0xc(%eax)
c000a91d:	83 ec 0c             	sub    $0xc,%esp
c000a920:	68 ec 0d 01 c0       	push   $0xc0010dec
c000a925:	e8 99 00 00 00       	call   c000a9c3 <isListEmpty>
c000a92a:	83 c4 10             	add    $0x10,%esp
c000a92d:	e8 d8 d0 ff ff       	call   c0007a0a <intr_disable>
c000a932:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000a935:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a938:	05 00 01 00 00       	add    $0x100,%eax
c000a93d:	83 ec 08             	sub    $0x8,%esp
c000a940:	50                   	push   %eax
c000a941:	68 ec 0d 01 c0       	push   $0xc0010dec
c000a946:	e8 75 01 00 00       	call   c000aac0 <appendToDoubleLinkList>
c000a94b:	83 c4 10             	add    $0x10,%esp
c000a94e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a951:	05 08 01 00 00       	add    $0x108,%eax
c000a956:	83 ec 08             	sub    $0x8,%esp
c000a959:	50                   	push   %eax
c000a95a:	68 04 1f 01 c0       	push   $0xc0011f04
c000a95f:	e8 5c 01 00 00       	call   c000aac0 <appendToDoubleLinkList>
c000a964:	83 c4 10             	add    $0x10,%esp
c000a967:	83 ec 0c             	sub    $0xc,%esp
c000a96a:	ff 75 e0             	pushl  -0x20(%ebp)
c000a96d:	e8 c1 d0 ff ff       	call   c0007a33 <intr_set_status>
c000a972:	83 c4 10             	add    $0x10,%esp
c000a975:	90                   	nop
c000a976:	c9                   	leave  
c000a977:	c3                   	ret    
c000a978:	66 90                	xchg   %ax,%ax
c000a97a:	66 90                	xchg   %ax,%ax
c000a97c:	66 90                	xchg   %ax,%ax
c000a97e:	66 90                	xchg   %ax,%ax

c000a980 <switch_to>:
c000a980:	56                   	push   %esi
c000a981:	57                   	push   %edi
c000a982:	53                   	push   %ebx
c000a983:	55                   	push   %ebp
c000a984:	89 e5                	mov    %esp,%ebp
c000a986:	8b 45 14             	mov    0x14(%ebp),%eax
c000a989:	89 20                	mov    %esp,(%eax)
c000a98b:	8b 45 18             	mov    0x18(%ebp),%eax
c000a98e:	8b 20                	mov    (%eax),%esp
c000a990:	5d                   	pop    %ebp
c000a991:	5b                   	pop    %ebx
c000a992:	5f                   	pop    %edi
c000a993:	5e                   	pop    %esi
c000a994:	c3                   	ret    

c000a995 <initDoubleLinkList>:
c000a995:	55                   	push   %ebp
c000a996:	89 e5                	mov    %esp,%ebp
c000a998:	8b 45 08             	mov    0x8(%ebp),%eax
c000a99b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000a9a1:	8b 45 08             	mov    0x8(%ebp),%eax
c000a9a4:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c000a9ab:	8b 45 08             	mov    0x8(%ebp),%eax
c000a9ae:	8d 50 08             	lea    0x8(%eax),%edx
c000a9b1:	8b 45 08             	mov    0x8(%ebp),%eax
c000a9b4:	89 50 04             	mov    %edx,0x4(%eax)
c000a9b7:	8b 55 08             	mov    0x8(%ebp),%edx
c000a9ba:	8b 45 08             	mov    0x8(%ebp),%eax
c000a9bd:	89 50 08             	mov    %edx,0x8(%eax)
c000a9c0:	90                   	nop
c000a9c1:	5d                   	pop    %ebp
c000a9c2:	c3                   	ret    

c000a9c3 <isListEmpty>:
c000a9c3:	55                   	push   %ebp
c000a9c4:	89 e5                	mov    %esp,%ebp
c000a9c6:	8b 45 08             	mov    0x8(%ebp),%eax
c000a9c9:	8b 40 04             	mov    0x4(%eax),%eax
c000a9cc:	8b 55 08             	mov    0x8(%ebp),%edx
c000a9cf:	83 c2 08             	add    $0x8,%edx
c000a9d2:	39 d0                	cmp    %edx,%eax
c000a9d4:	75 07                	jne    c000a9dd <isListEmpty+0x1a>
c000a9d6:	b8 01 00 00 00       	mov    $0x1,%eax
c000a9db:	eb 05                	jmp    c000a9e2 <isListEmpty+0x1f>
c000a9dd:	b8 00 00 00 00       	mov    $0x0,%eax
c000a9e2:	5d                   	pop    %ebp
c000a9e3:	c3                   	ret    

c000a9e4 <findElementInList>:
c000a9e4:	55                   	push   %ebp
c000a9e5:	89 e5                	mov    %esp,%ebp
c000a9e7:	83 ec 28             	sub    $0x28,%esp
c000a9ea:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c000a9ee:	75 19                	jne    c000aa09 <findElementInList+0x25>
c000a9f0:	6a 60                	push   $0x60
c000a9f2:	68 c5 bb 00 c0       	push   $0xc000bbc5
c000a9f7:	68 c5 bb 00 c0       	push   $0xc000bbc5
c000a9fc:	68 d8 bb 00 c0       	push   $0xc000bbd8
c000aa01:	e8 41 ea ff ff       	call   c0009447 <assertion_failure>
c000aa06:	83 c4 10             	add    $0x10,%esp
c000aa09:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000aa0d:	75 19                	jne    c000aa28 <findElementInList+0x44>
c000aa0f:	6a 61                	push   $0x61
c000aa11:	68 c5 bb 00 c0       	push   $0xc000bbc5
c000aa16:	68 c5 bb 00 c0       	push   $0xc000bbc5
c000aa1b:	68 e4 bb 00 c0       	push   $0xc000bbe4
c000aa20:	e8 22 ea ff ff       	call   c0009447 <assertion_failure>
c000aa25:	83 c4 10             	add    $0x10,%esp
c000aa28:	e8 dd cf ff ff       	call   c0007a0a <intr_disable>
c000aa2d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000aa30:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000aa37:	8b 45 08             	mov    0x8(%ebp),%eax
c000aa3a:	8b 40 08             	mov    0x8(%eax),%eax
c000aa3d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000aa40:	8b 45 08             	mov    0x8(%ebp),%eax
c000aa43:	8b 40 04             	mov    0x4(%eax),%eax
c000aa46:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000aa49:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000aa4d:	75 07                	jne    c000aa56 <findElementInList+0x72>
c000aa4f:	b8 00 00 00 00       	mov    $0x0,%eax
c000aa54:	eb 68                	jmp    c000aabe <findElementInList+0xda>
c000aa56:	8b 45 0c             	mov    0xc(%ebp),%eax
c000aa59:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000aa5c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000aa5f:	2b 45 f0             	sub    -0x10(%ebp),%eax
c000aa62:	c1 f8 03             	sar    $0x3,%eax
c000aa65:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000aa68:	eb 36                	jmp    c000aaa0 <findElementInList+0xbc>
c000aa6a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aa6d:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c000aa70:	75 07                	jne    c000aa79 <findElementInList+0x95>
c000aa72:	b8 01 00 00 00       	mov    $0x1,%eax
c000aa77:	eb 45                	jmp    c000aabe <findElementInList+0xda>
c000aa79:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000aa7d:	75 07                	jne    c000aa86 <findElementInList+0xa2>
c000aa7f:	b8 00 00 00 00       	mov    $0x0,%eax
c000aa84:	eb 38                	jmp    c000aabe <findElementInList+0xda>
c000aa86:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000aa89:	8b 40 04             	mov    0x4(%eax),%eax
c000aa8c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000aa8f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000aa93:	75 07                	jne    c000aa9c <findElementInList+0xb8>
c000aa95:	b8 00 00 00 00       	mov    $0x0,%eax
c000aa9a:	eb 22                	jmp    c000aabe <findElementInList+0xda>
c000aa9c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000aaa0:	8b 45 08             	mov    0x8(%ebp),%eax
c000aaa3:	83 c0 08             	add    $0x8,%eax
c000aaa6:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c000aaa9:	75 bf                	jne    c000aa6a <findElementInList+0x86>
c000aaab:	83 ec 0c             	sub    $0xc,%esp
c000aaae:	ff 75 ec             	pushl  -0x14(%ebp)
c000aab1:	e8 7d cf ff ff       	call   c0007a33 <intr_set_status>
c000aab6:	83 c4 10             	add    $0x10,%esp
c000aab9:	b8 00 00 00 00       	mov    $0x0,%eax
c000aabe:	c9                   	leave  
c000aabf:	c3                   	ret    

c000aac0 <appendToDoubleLinkList>:
c000aac0:	55                   	push   %ebp
c000aac1:	89 e5                	mov    %esp,%ebp
c000aac3:	83 ec 18             	sub    $0x18,%esp
c000aac6:	83 ec 08             	sub    $0x8,%esp
c000aac9:	ff 75 0c             	pushl  0xc(%ebp)
c000aacc:	ff 75 08             	pushl  0x8(%ebp)
c000aacf:	e8 10 ff ff ff       	call   c000a9e4 <findElementInList>
c000aad4:	83 c4 10             	add    $0x10,%esp
c000aad7:	3c 01                	cmp    $0x1,%al
c000aad9:	0f 84 c2 00 00 00    	je     c000aba1 <appendToDoubleLinkList+0xe1>
c000aadf:	e8 26 cf ff ff       	call   c0007a0a <intr_disable>
c000aae4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000aae7:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c000aaeb:	75 1c                	jne    c000ab09 <appendToDoubleLinkList+0x49>
c000aaed:	68 9e 00 00 00       	push   $0x9e
c000aaf2:	68 c5 bb 00 c0       	push   $0xc000bbc5
c000aaf7:	68 c5 bb 00 c0       	push   $0xc000bbc5
c000aafc:	68 d8 bb 00 c0       	push   $0xc000bbd8
c000ab01:	e8 41 e9 ff ff       	call   c0009447 <assertion_failure>
c000ab06:	83 c4 10             	add    $0x10,%esp
c000ab09:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000ab0d:	75 1c                	jne    c000ab2b <appendToDoubleLinkList+0x6b>
c000ab0f:	68 9f 00 00 00       	push   $0x9f
c000ab14:	68 c5 bb 00 c0       	push   $0xc000bbc5
c000ab19:	68 c5 bb 00 c0       	push   $0xc000bbc5
c000ab1e:	68 e4 bb 00 c0       	push   $0xc000bbe4
c000ab23:	e8 1f e9 ff ff       	call   c0009447 <assertion_failure>
c000ab28:	83 c4 10             	add    $0x10,%esp
c000ab2b:	83 ec 08             	sub    $0x8,%esp
c000ab2e:	ff 75 0c             	pushl  0xc(%ebp)
c000ab31:	ff 75 08             	pushl  0x8(%ebp)
c000ab34:	e8 ab fe ff ff       	call   c000a9e4 <findElementInList>
c000ab39:	83 c4 10             	add    $0x10,%esp
c000ab3c:	3c 01                	cmp    $0x1,%al
c000ab3e:	74 64                	je     c000aba4 <appendToDoubleLinkList+0xe4>
c000ab40:	8b 45 0c             	mov    0xc(%ebp),%eax
c000ab43:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000ab46:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ab49:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c000ab50:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ab53:	8b 50 04             	mov    0x4(%eax),%edx
c000ab56:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ab59:	89 10                	mov    %edx,(%eax)
c000ab5b:	8b 45 08             	mov    0x8(%ebp),%eax
c000ab5e:	8b 50 08             	mov    0x8(%eax),%edx
c000ab61:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ab64:	89 10                	mov    %edx,(%eax)
c000ab66:	8b 45 08             	mov    0x8(%ebp),%eax
c000ab69:	8b 40 08             	mov    0x8(%eax),%eax
c000ab6c:	85 c0                	test   %eax,%eax
c000ab6e:	74 0c                	je     c000ab7c <appendToDoubleLinkList+0xbc>
c000ab70:	8b 45 08             	mov    0x8(%ebp),%eax
c000ab73:	8b 40 08             	mov    0x8(%eax),%eax
c000ab76:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000ab79:	89 50 04             	mov    %edx,0x4(%eax)
c000ab7c:	8b 45 08             	mov    0x8(%ebp),%eax
c000ab7f:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000ab82:	89 50 08             	mov    %edx,0x8(%eax)
c000ab85:	8b 45 08             	mov    0x8(%ebp),%eax
c000ab88:	8d 50 08             	lea    0x8(%eax),%edx
c000ab8b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ab8e:	89 50 04             	mov    %edx,0x4(%eax)
c000ab91:	83 ec 0c             	sub    $0xc,%esp
c000ab94:	ff 75 f4             	pushl  -0xc(%ebp)
c000ab97:	e8 97 ce ff ff       	call   c0007a33 <intr_set_status>
c000ab9c:	83 c4 10             	add    $0x10,%esp
c000ab9f:	eb 04                	jmp    c000aba5 <appendToDoubleLinkList+0xe5>
c000aba1:	90                   	nop
c000aba2:	eb 01                	jmp    c000aba5 <appendToDoubleLinkList+0xe5>
c000aba4:	90                   	nop
c000aba5:	c9                   	leave  
c000aba6:	c3                   	ret    

c000aba7 <insertToDoubleLinkList>:
c000aba7:	55                   	push   %ebp
c000aba8:	89 e5                	mov    %esp,%ebp
c000abaa:	83 ec 18             	sub    $0x18,%esp
c000abad:	83 ec 08             	sub    $0x8,%esp
c000abb0:	ff 75 0c             	pushl  0xc(%ebp)
c000abb3:	ff 75 08             	pushl  0x8(%ebp)
c000abb6:	e8 29 fe ff ff       	call   c000a9e4 <findElementInList>
c000abbb:	83 c4 10             	add    $0x10,%esp
c000abbe:	3c 01                	cmp    $0x1,%al
c000abc0:	74 65                	je     c000ac27 <insertToDoubleLinkList+0x80>
c000abc2:	e8 43 ce ff ff       	call   c0007a0a <intr_disable>
c000abc7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000abca:	8b 45 0c             	mov    0xc(%ebp),%eax
c000abcd:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000abd0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000abd3:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c000abda:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000abdd:	8b 50 04             	mov    0x4(%eax),%edx
c000abe0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000abe3:	89 10                	mov    %edx,(%eax)
c000abe5:	8b 45 08             	mov    0x8(%ebp),%eax
c000abe8:	8b 50 04             	mov    0x4(%eax),%edx
c000abeb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000abee:	89 50 04             	mov    %edx,0x4(%eax)
c000abf1:	8b 45 08             	mov    0x8(%ebp),%eax
c000abf4:	8b 40 04             	mov    0x4(%eax),%eax
c000abf7:	85 c0                	test   %eax,%eax
c000abf9:	74 0b                	je     c000ac06 <insertToDoubleLinkList+0x5f>
c000abfb:	8b 45 08             	mov    0x8(%ebp),%eax
c000abfe:	8b 40 04             	mov    0x4(%eax),%eax
c000ac01:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000ac04:	89 10                	mov    %edx,(%eax)
c000ac06:	8b 45 08             	mov    0x8(%ebp),%eax
c000ac09:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000ac0c:	89 50 04             	mov    %edx,0x4(%eax)
c000ac0f:	8b 55 08             	mov    0x8(%ebp),%edx
c000ac12:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ac15:	89 10                	mov    %edx,(%eax)
c000ac17:	83 ec 0c             	sub    $0xc,%esp
c000ac1a:	ff 75 f4             	pushl  -0xc(%ebp)
c000ac1d:	e8 11 ce ff ff       	call   c0007a33 <intr_set_status>
c000ac22:	83 c4 10             	add    $0x10,%esp
c000ac25:	eb 01                	jmp    c000ac28 <insertToDoubleLinkList+0x81>
c000ac27:	90                   	nop
c000ac28:	c9                   	leave  
c000ac29:	c3                   	ret    

c000ac2a <popFromDoubleLinkList>:
c000ac2a:	55                   	push   %ebp
c000ac2b:	89 e5                	mov    %esp,%ebp
c000ac2d:	83 ec 18             	sub    $0x18,%esp
c000ac30:	e8 d5 cd ff ff       	call   c0007a0a <intr_disable>
c000ac35:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000ac38:	83 ec 0c             	sub    $0xc,%esp
c000ac3b:	ff 75 08             	pushl  0x8(%ebp)
c000ac3e:	e8 80 fd ff ff       	call   c000a9c3 <isListEmpty>
c000ac43:	83 c4 10             	add    $0x10,%esp
c000ac46:	3c 01                	cmp    $0x1,%al
c000ac48:	75 07                	jne    c000ac51 <popFromDoubleLinkList+0x27>
c000ac4a:	b8 00 00 00 00       	mov    $0x0,%eax
c000ac4f:	eb 6b                	jmp    c000acbc <popFromDoubleLinkList+0x92>
c000ac51:	8b 45 08             	mov    0x8(%ebp),%eax
c000ac54:	8b 40 08             	mov    0x8(%eax),%eax
c000ac57:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000ac5a:	8b 45 08             	mov    0x8(%ebp),%eax
c000ac5d:	8b 40 08             	mov    0x8(%eax),%eax
c000ac60:	85 c0                	test   %eax,%eax
c000ac62:	75 07                	jne    c000ac6b <popFromDoubleLinkList+0x41>
c000ac64:	b8 00 00 00 00       	mov    $0x0,%eax
c000ac69:	eb 51                	jmp    c000acbc <popFromDoubleLinkList+0x92>
c000ac6b:	8b 45 08             	mov    0x8(%ebp),%eax
c000ac6e:	8b 40 08             	mov    0x8(%eax),%eax
c000ac71:	8b 00                	mov    (%eax),%eax
c000ac73:	85 c0                	test   %eax,%eax
c000ac75:	74 11                	je     c000ac88 <popFromDoubleLinkList+0x5e>
c000ac77:	8b 45 08             	mov    0x8(%ebp),%eax
c000ac7a:	8b 40 08             	mov    0x8(%eax),%eax
c000ac7d:	8b 00                	mov    (%eax),%eax
c000ac7f:	8b 55 08             	mov    0x8(%ebp),%edx
c000ac82:	83 c2 08             	add    $0x8,%edx
c000ac85:	89 50 04             	mov    %edx,0x4(%eax)
c000ac88:	8b 45 08             	mov    0x8(%ebp),%eax
c000ac8b:	8b 40 08             	mov    0x8(%eax),%eax
c000ac8e:	8b 10                	mov    (%eax),%edx
c000ac90:	8b 45 08             	mov    0x8(%ebp),%eax
c000ac93:	89 50 08             	mov    %edx,0x8(%eax)
c000ac96:	83 ec 0c             	sub    $0xc,%esp
c000ac99:	ff 75 f4             	pushl  -0xc(%ebp)
c000ac9c:	e8 92 cd ff ff       	call   c0007a33 <intr_set_status>
c000aca1:	83 c4 10             	add    $0x10,%esp
c000aca4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000aca7:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c000acae:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000acb1:	8b 50 04             	mov    0x4(%eax),%edx
c000acb4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000acb7:	89 10                	mov    %edx,(%eax)
c000acb9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000acbc:	c9                   	leave  
c000acbd:	c3                   	ret    

c000acbe <kernel_thread>:
c000acbe:	55                   	push   %ebp
c000acbf:	89 e5                	mov    %esp,%ebp
c000acc1:	83 ec 08             	sub    $0x8,%esp
c000acc4:	fb                   	sti    
c000acc5:	83 ec 0c             	sub    $0xc,%esp
c000acc8:	ff 75 0c             	pushl  0xc(%ebp)
c000accb:	8b 45 08             	mov    0x8(%ebp),%eax
c000acce:	ff d0                	call   *%eax
c000acd0:	83 c4 10             	add    $0x10,%esp
c000acd3:	90                   	nop
c000acd4:	c9                   	leave  
c000acd5:	c3                   	ret    

c000acd6 <thread_init>:
c000acd6:	55                   	push   %ebp
c000acd7:	89 e5                	mov    %esp,%ebp
c000acd9:	83 ec 18             	sub    $0x18,%esp
c000acdc:	83 ec 08             	sub    $0x8,%esp
c000acdf:	6a 00                	push   $0x0
c000ace1:	6a 01                	push   $0x1
c000ace3:	e8 9f c2 ff ff       	call   c0006f87 <alloc_memory>
c000ace8:	83 c4 10             	add    $0x10,%esp
c000aceb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000acee:	83 ec 04             	sub    $0x4,%esp
c000acf1:	68 00 10 00 00       	push   $0x1000
c000acf6:	6a 00                	push   $0x0
c000acf8:	ff 75 f4             	pushl  -0xc(%ebp)
c000acfb:	e8 1f 0f 00 00       	call   c000bc1f <Memset>
c000ad00:	83 c4 10             	add    $0x10,%esp
c000ad03:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ad06:	05 00 10 00 00       	add    $0x1000,%eax
c000ad0b:	89 c2                	mov    %eax,%edx
c000ad0d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ad10:	89 10                	mov    %edx,(%eax)
c000ad12:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ad15:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c000ad1c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ad1f:	c7 80 64 02 00 00 ff 	movl   $0xffffffff,0x264(%eax)
c000ad26:	ff ff ff 
c000ad29:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ad2c:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c000ad33:	00 00 00 
c000ad36:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ad39:	8b 90 5c 02 00 00    	mov    0x25c(%eax),%edx
c000ad3f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ad42:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c000ad48:	a1 90 07 01 c0       	mov    0xc0010790,%eax
c000ad4d:	83 c0 01             	add    $0x1,%eax
c000ad50:	a3 90 07 01 c0       	mov    %eax,0xc0010790
c000ad55:	8b 15 90 07 01 c0    	mov    0xc0010790,%edx
c000ad5b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ad5e:	89 90 24 01 00 00    	mov    %edx,0x124(%eax)
c000ad64:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ad67:	c7 80 28 01 00 00 0a 	movl   $0xa,0x128(%eax)
c000ad6e:	00 00 00 
c000ad71:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ad74:	c7 80 b0 02 00 00 e0 	movl   $0x99abcde0,0x2b0(%eax)
c000ad7b:	cd ab 99 
c000ad7e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ad81:	c9                   	leave  
c000ad82:	c3                   	ret    

c000ad83 <thread_create>:
c000ad83:	55                   	push   %ebp
c000ad84:	89 e5                	mov    %esp,%ebp
c000ad86:	83 ec 10             	sub    $0x10,%esp
c000ad89:	c7 45 fc 44 00 00 00 	movl   $0x44,-0x4(%ebp)
c000ad90:	c7 45 f8 2c 00 00 00 	movl   $0x2c,-0x8(%ebp)
c000ad97:	8b 45 08             	mov    0x8(%ebp),%eax
c000ad9a:	8b 00                	mov    (%eax),%eax
c000ad9c:	2b 45 fc             	sub    -0x4(%ebp),%eax
c000ad9f:	89 c2                	mov    %eax,%edx
c000ada1:	8b 45 08             	mov    0x8(%ebp),%eax
c000ada4:	89 10                	mov    %edx,(%eax)
c000ada6:	8b 45 08             	mov    0x8(%ebp),%eax
c000ada9:	8b 00                	mov    (%eax),%eax
c000adab:	2b 45 f8             	sub    -0x8(%ebp),%eax
c000adae:	89 c2                	mov    %eax,%edx
c000adb0:	8b 45 08             	mov    0x8(%ebp),%eax
c000adb3:	89 10                	mov    %edx,(%eax)
c000adb5:	90                   	nop
c000adb6:	c9                   	leave  
c000adb7:	c3                   	ret    

c000adb8 <thread_start>:
c000adb8:	55                   	push   %ebp
c000adb9:	89 e5                	mov    %esp,%ebp
c000adbb:	83 ec 18             	sub    $0x18,%esp
c000adbe:	e8 13 ff ff ff       	call   c000acd6 <thread_init>
c000adc3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000adc6:	83 ec 0c             	sub    $0xc,%esp
c000adc9:	ff 75 f4             	pushl  -0xc(%ebp)
c000adcc:	e8 b2 ff ff ff       	call   c000ad83 <thread_create>
c000add1:	83 c4 10             	add    $0x10,%esp
c000add4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000add7:	05 34 01 00 00       	add    $0x134,%eax
c000addc:	83 ec 08             	sub    $0x8,%esp
c000addf:	ff 75 10             	pushl  0x10(%ebp)
c000ade2:	50                   	push   %eax
c000ade3:	e8 56 0e 00 00       	call   c000bc3e <Strcpy>
c000ade8:	83 c4 10             	add    $0x10,%esp
c000adeb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000adee:	8b 00                	mov    (%eax),%eax
c000adf0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000adf3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000adf6:	c7 40 10 be ac 00 c0 	movl   $0xc000acbe,0x10(%eax)
c000adfd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ae00:	8b 55 08             	mov    0x8(%ebp),%edx
c000ae03:	89 50 18             	mov    %edx,0x18(%eax)
c000ae06:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ae09:	8b 55 0c             	mov    0xc(%ebp),%edx
c000ae0c:	89 50 1c             	mov    %edx,0x1c(%eax)
c000ae0f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ae12:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000ae18:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ae1b:	8b 10                	mov    (%eax),%edx
c000ae1d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ae20:	89 50 04             	mov    %edx,0x4(%eax)
c000ae23:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ae26:	8b 50 04             	mov    0x4(%eax),%edx
c000ae29:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ae2c:	89 50 08             	mov    %edx,0x8(%eax)
c000ae2f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ae32:	8b 50 08             	mov    0x8(%eax),%edx
c000ae35:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ae38:	89 50 0c             	mov    %edx,0xc(%eax)
c000ae3b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ae3e:	05 00 01 00 00       	add    $0x100,%eax
c000ae43:	83 ec 08             	sub    $0x8,%esp
c000ae46:	50                   	push   %eax
c000ae47:	68 ec 0d 01 c0       	push   $0xc0010dec
c000ae4c:	e8 6f fc ff ff       	call   c000aac0 <appendToDoubleLinkList>
c000ae51:	83 c4 10             	add    $0x10,%esp
c000ae54:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ae57:	05 08 01 00 00       	add    $0x108,%eax
c000ae5c:	83 ec 08             	sub    $0x8,%esp
c000ae5f:	50                   	push   %eax
c000ae60:	68 04 1f 01 c0       	push   $0xc0011f04
c000ae65:	e8 56 fc ff ff       	call   c000aac0 <appendToDoubleLinkList>
c000ae6a:	83 c4 10             	add    $0x10,%esp
c000ae6d:	90                   	nop
c000ae6e:	c9                   	leave  
c000ae6f:	c3                   	ret    
