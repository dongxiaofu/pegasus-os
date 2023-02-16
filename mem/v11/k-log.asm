
kernel.bin:     file format elf32-i386


Disassembly of section .text:

c0001000 <_start>:
c0001000:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c0001007:	00 00 00 
c000100a:	b4 0b                	mov    $0xb,%ah
c000100c:	b0 4c                	mov    $0x4c,%al
c000100e:	65 66 a3 d0 0c 00 00 	mov    %ax,%gs:0xcd0
c0001015:	66 c7 05 a0 07 01 c0 	movw   $0x0,0xc00107a0
c000101c:	00 00 
c000101e:	0f 01 05 c8 16 01 c0 	sgdtl  0xc00116c8
c0001025:	e8 30 3a 00 00       	call   c0004a5a <ReloadGDT>
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
c0001094:	8b 3d a0 07 01 c0    	mov    0xc00107a0,%edi

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
c00010bd:	89 3d a0 07 01 c0    	mov    %edi,0xc00107a0
c00010c3:	89 ec                	mov    %ebp,%esp
c00010c5:	5d                   	pop    %ebp
c00010c6:	c3                   	ret    

c00010c7 <disp_str_colour>:
c00010c7:	55                   	push   %ebp
c00010c8:	89 e5                	mov    %esp,%ebp
c00010ca:	8b 75 08             	mov    0x8(%ebp),%esi
c00010cd:	8a 65 0c             	mov    0xc(%ebp),%ah
c00010d0:	8b 3d a0 07 01 c0    	mov    0xc00107a0,%edi

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
c00010f9:	89 3d a0 07 01 c0    	mov    %edi,0xc00107a0
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
c000114b:	e8 16 6f 00 00       	call   c0008066 <exception_handler>
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
c0001168:	e8 f9 6e 00 00       	call   c0008066 <exception_handler>
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
c0001185:	ff 05 a4 07 01 c0    	incl   0xc00107a4
c000118b:	83 3d a4 07 01 c0 00 	cmpl   $0x0,0xc00107a4
c0001192:	75 00                	jne    c0001194 <hwint0.1>

c0001194 <hwint0.1>:
c0001194:	e8 b3 34 00 00       	call   c000464c <clock_handler>
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
c00011b6:	ff 05 a4 07 01 c0    	incl   0xc00107a4
c00011bc:	83 3d a4 07 01 c0 00 	cmpl   $0x0,0xc00107a4
c00011c3:	75 00                	jne    c00011c5 <hwint1.1>

c00011c5 <hwint1.1>:
c00011c5:	e8 e5 43 00 00       	call   c00055af <keyboard_handler>
c00011ca:	b0 f8                	mov    $0xf8,%al
c00011cc:	e6 21                	out    %al,$0x21
c00011ce:	83 3d a4 07 01 c0 00 	cmpl   $0x0,0xc00107a4
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
c00011fb:	ff 05 a4 07 01 c0    	incl   0xc00107a4
c0001201:	83 3d a4 07 01 c0 00 	cmpl   $0x0,0xc00107a4
c0001208:	75 00                	jne    c000120a <hwint14.1>

c000120a <hwint14.1>:
c000120a:	e8 a4 10 00 00       	call   c00022b3 <hd_handler>
c000120f:	b0 bf                	mov    $0xbf,%al
c0001211:	e6 a1                	out    %al,$0xa1
c0001213:	83 3d a4 07 01 c0 00 	cmpl   $0x0,0xc00107a4
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
c0001232:	ff 05 a4 07 01 c0    	incl   0xc00107a4
c0001238:	83 3d a4 07 01 c0 00 	cmpl   $0x0,0xc00107a4
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
c0001258:	83 3d a4 07 01 c0 00 	cmpl   $0x0,0xc00107a4
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
c000126c:	ff 0d a4 07 01 c0    	decl   0xc00107a4
c0001272:	89 e5                	mov    %esp,%ebp
c0001274:	8b 65 04             	mov    0x4(%ebp),%esp
c0001277:	0f a9                	pop    %gs
c0001279:	0f a1                	pop    %fs
c000127b:	07                   	pop    %es
c000127c:	1f                   	pop    %ds
c000127d:	61                   	popa   
c000127e:	cf                   	iret   

c000127f <reenter_restore>:
c000127f:	ff 0d a4 07 01 c0    	decl   0xc00107a4
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
c00012e9:	e8 12 6c 00 00       	call   c0007f00 <disp_int>
c00012ee:	83 c4 04             	add    $0x4,%esp
c00012f1:	58                   	pop    %eax
c00012f2:	5a                   	pop    %edx
c00012f3:	52                   	push   %edx
c00012f4:	50                   	push   %eax
c00012f5:	e8 06 6c 00 00       	call   c0007f00 <disp_int>
c00012fa:	58                   	pop    %eax
c00012fb:	5a                   	pop    %edx
c00012fc:	52                   	push   %edx
c00012fd:	50                   	push   %eax
c00012fe:	ff 35 a4 07 01 c0    	pushl  0xc00107a4
c0001304:	e8 f7 6b 00 00       	call   c0007f00 <disp_int>
c0001309:	83 c4 04             	add    $0x4,%esp
c000130c:	58                   	pop    %eax
c000130d:	5a                   	pop    %edx
c000130e:	52                   	push   %edx
c000130f:	50                   	push   %eax
c0001310:	ff 72 ec             	pushl  -0x14(%edx)
c0001313:	e8 e8 6b 00 00       	call   c0007f00 <disp_int>
c0001318:	83 c4 04             	add    $0x4,%esp
c000131b:	58                   	pop    %eax
c000131c:	5a                   	pop    %edx
c000131d:	52                   	push   %edx
c000131e:	50                   	push   %eax
c000131f:	ff 70 ec             	pushl  -0x14(%eax)
c0001322:	e8 d9 6b 00 00       	call   c0007f00 <disp_int>
c0001327:	83 c4 04             	add    $0x4,%esp
c000132a:	58                   	pop    %eax
c000132b:	5a                   	pop    %edx
c000132c:	52                   	push   %edx
c000132d:	50                   	push   %eax
c000132e:	ff 35 c0 0b 01 c0    	pushl  0xc0010bc0
c0001334:	e8 c7 6b 00 00       	call   c0007f00 <disp_int>
c0001339:	83 c4 04             	add    $0x4,%esp
c000133c:	58                   	pop    %eax
c000133d:	5a                   	pop    %edx
c000133e:	52                   	push   %edx
c000133f:	50                   	push   %eax
c0001340:	68 60 07 01 c0       	push   $0xc0010760
c0001345:	e8 b6 6b 00 00       	call   c0007f00 <disp_int>
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
c00013cd:	e8 5e 98 00 00       	call   c000ac30 <appendToDoubleLinkList>
c00013d2:	83 c4 10             	add    $0x10,%esp
c00013d5:	a1 e0 1e 01 c0       	mov    0xc0011ee0,%eax
c00013da:	05 08 01 00 00       	add    $0x108,%eax
c00013df:	83 ec 08             	sub    $0x8,%esp
c00013e2:	50                   	push   %eax
c00013e3:	68 ec 0d 01 c0       	push   $0xc0010dec
c00013e8:	e8 43 98 00 00       	call   c000ac30 <appendToDoubleLinkList>
c00013ed:	83 c4 10             	add    $0x10,%esp
c00013f0:	6a 00                	push   $0x0
c00013f2:	68 e0 af 00 c0       	push   $0xc000afe0
c00013f7:	68 e7 af 00 c0       	push   $0xc000afe7
c00013fc:	68 2c 60 00 c0       	push   $0xc000602c
c0001401:	e8 76 95 00 00       	call   c000a97c <process_execute>
c0001406:	83 c4 10             	add    $0x10,%esp
c0001409:	6a 00                	push   $0x0
c000140b:	68 f0 af 00 c0       	push   $0xc000aff0
c0001410:	68 f8 af 00 c0       	push   $0xc000aff8
c0001415:	68 f1 24 00 c0       	push   $0xc00024f1
c000141a:	e8 5d 95 00 00       	call   c000a97c <process_execute>
c000141f:	83 c4 10             	add    $0x10,%esp
c0001422:	6a 00                	push   $0x0
c0001424:	68 01 b0 00 c0       	push   $0xc000b001
c0001429:	68 08 b0 00 c0       	push   $0xc000b008
c000142e:	68 2b 16 00 c0       	push   $0xc000162b
c0001433:	e8 44 95 00 00       	call   c000a97c <process_execute>
c0001438:	83 c4 10             	add    $0x10,%esp
c000143b:	6a 00                	push   $0x0
c000143d:	68 11 b0 00 c0       	push   $0xc000b011
c0001442:	68 19 b0 00 c0       	push   $0xc000b019
c0001447:	68 ac 54 00 c0       	push   $0xc00054ac
c000144c:	e8 2b 95 00 00       	call   c000a97c <process_execute>
c0001451:	83 c4 10             	add    $0x10,%esp
c0001454:	6a 01                	push   $0x1
c0001456:	68 23 b0 00 c0       	push   $0xc000b023
c000145b:	68 2d b0 00 c0       	push   $0xc000b02d
c0001460:	68 f6 15 00 c0       	push   $0xc00015f6
c0001465:	e8 12 95 00 00       	call   c000a97c <process_execute>
c000146a:	83 c4 10             	add    $0x10,%esp
c000146d:	83 ec 0c             	sub    $0xc,%esp
c0001470:	68 3a b0 00 c0       	push   $0xc000b03a
c0001475:	e8 12 fc ff ff       	call   c000108c <disp_str>
c000147a:	83 c4 10             	add    $0x10,%esp
c000147d:	fb                   	sti    
c000147e:	eb fe                	jmp    c000147e <kernel_main+0xd9>

c0001480 <init>:
c0001480:	55                   	push   %ebp
c0001481:	89 e5                	mov    %esp,%ebp
c0001483:	83 ec 18             	sub    $0x18,%esp
c0001486:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c000148d:	00 00 00 
c0001490:	c7 05 90 07 01 c0 00 	movl   $0x0,0xc0010790
c0001497:	00 00 00 
c000149a:	c7 05 fc 0d 01 c0 09 	movl   $0x9,0xc0010dfc
c00014a1:	00 00 00 
c00014a4:	c7 05 c0 0b 01 c0 00 	movl   $0x0,0xc0010bc0
c00014ab:	00 00 00 
c00014ae:	83 ec 0c             	sub    $0xc,%esp
c00014b1:	68 44 b0 00 c0       	push   $0xc000b044
c00014b6:	e8 d1 fb ff ff       	call   c000108c <disp_str>
c00014bb:	83 c4 10             	add    $0x10,%esp
c00014be:	e8 8d 6f 00 00       	call   c0008450 <init_keyboard>
c00014c3:	83 ec 0c             	sub    $0xc,%esp
c00014c6:	68 00 00 00 04       	push   $0x4000000
c00014cb:	e8 71 64 00 00       	call   c0007941 <init_memory>
c00014d0:	83 c4 10             	add    $0x10,%esp
c00014d3:	83 ec 0c             	sub    $0xc,%esp
c00014d6:	68 ec 0d 01 c0       	push   $0xc0010dec
c00014db:	e8 25 96 00 00       	call   c000ab05 <initDoubleLinkList>
c00014e0:	83 c4 10             	add    $0x10,%esp
c00014e3:	83 ec 0c             	sub    $0xc,%esp
c00014e6:	68 04 1f 01 c0       	push   $0xc0011f04
c00014eb:	e8 15 96 00 00       	call   c000ab05 <initDoubleLinkList>
c00014f0:	83 c4 10             	add    $0x10,%esp
c00014f3:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c00014fa:	00 00 00 
c00014fd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0001504:	eb 14                	jmp    c000151a <init+0x9a>
c0001506:	83 ec 0c             	sub    $0xc,%esp
c0001509:	68 4a b0 00 c0       	push   $0xc000b04a
c000150e:	e8 79 fb ff ff       	call   c000108c <disp_str>
c0001513:	83 c4 10             	add    $0x10,%esp
c0001516:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000151a:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c0001521:	7e e3                	jle    c0001506 <init+0x86>
c0001523:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
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
c0001544:	a1 a0 07 01 c0       	mov    0xc00107a0,%eax
c0001549:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000154c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0001553:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001556:	a3 a0 07 01 c0       	mov    %eax,0xc00107a0
c000155b:	83 ec 0c             	sub    $0xc,%esp
c000155e:	68 4b b0 00 c0       	push   $0xc000b04b
c0001563:	e8 24 fb ff ff       	call   c000108c <disp_str>
c0001568:	83 c4 10             	add    $0x10,%esp
c000156b:	83 ec 0c             	sub    $0xc,%esp
c000156e:	68 54 b0 00 c0       	push   $0xc000b054
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
c0001591:	a1 a0 07 01 c0       	mov    0xc00107a0,%eax
c0001596:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0001599:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00015a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00015a3:	a3 a0 07 01 c0       	mov    %eax,0xc00107a0
c00015a8:	83 ec 0c             	sub    $0xc,%esp
c00015ab:	68 56 b0 00 c0       	push   $0xc000b056
c00015b0:	e8 d7 fa ff ff       	call   c000108c <disp_str>
c00015b5:	83 c4 10             	add    $0x10,%esp
c00015b8:	83 ec 0c             	sub    $0xc,%esp
c00015bb:	68 54 b0 00 c0       	push   $0xc000b054
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
c00015ff:	68 5f b0 00 c0       	push   $0xc000b05f
c0001604:	e8 83 fa ff ff       	call   c000108c <disp_str>
c0001609:	83 c4 10             	add    $0x10,%esp
c000160c:	e8 39 74 00 00       	call   c0008a4a <INIT_fork>
c0001611:	eb fe                	jmp    c0001611 <user_proc_a+0x1b>

c0001613 <user_proc_b>:
c0001613:	55                   	push   %ebp
c0001614:	89 e5                	mov    %esp,%ebp
c0001616:	83 ec 08             	sub    $0x8,%esp
c0001619:	83 ec 0c             	sub    $0xc,%esp
c000161c:	68 71 b0 00 c0       	push   $0xc000b071
c0001621:	e8 66 fa ff ff       	call   c000108c <disp_str>
c0001626:	83 c4 10             	add    $0x10,%esp
c0001629:	eb fe                	jmp    c0001629 <user_proc_b+0x16>

c000162b <TaskHD>:
c000162b:	55                   	push   %ebp
c000162c:	89 e5                	mov    %esp,%ebp
c000162e:	83 ec 18             	sub    $0x18,%esp
c0001631:	e8 61 fd ff ff       	call   c0001397 <get_running_thread_pcb>
c0001636:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0001639:	e8 32 00 00 00       	call   c0001670 <init_hd>
c000163e:	83 ec 0c             	sub    $0xc,%esp
c0001641:	6a 7c                	push   $0x7c
c0001643:	e8 7c 0e 00 00       	call   c00024c4 <sys_malloc>
c0001648:	83 c4 10             	add    $0x10,%esp
c000164b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000164e:	83 ec 04             	sub    $0x4,%esp
c0001651:	6a 7c                	push   $0x7c
c0001653:	6a 00                	push   $0x0
c0001655:	ff 75 f0             	pushl  -0x10(%ebp)
c0001658:	e8 e2 a7 00 00       	call   c000be3f <Memset>
c000165d:	83 c4 10             	add    $0x10,%esp
c0001660:	83 ec 0c             	sub    $0xc,%esp
c0001663:	ff 75 f0             	pushl  -0x10(%ebp)
c0001666:	e8 1f 00 00 00       	call   c000168a <hd_handle>
c000166b:	83 c4 10             	add    $0x10,%esp
c000166e:	eb de                	jmp    c000164e <TaskHD+0x23>

c0001670 <init_hd>:
c0001670:	55                   	push   %ebp
c0001671:	89 e5                	mov    %esp,%ebp
c0001673:	83 ec 18             	sub    $0x18,%esp
c0001676:	c7 45 f4 75 04 00 00 	movl   $0x475,-0xc(%ebp)
c000167d:	e8 d1 fc ff ff       	call   c0001353 <enable_8259A_casecade_irq>
c0001682:	e8 e0 fc ff ff       	call   c0001367 <enable_8259A_slave_winchester_irq>
c0001687:	90                   	nop
c0001688:	c9                   	leave  
c0001689:	c3                   	ret    

c000168a <hd_handle>:
c000168a:	55                   	push   %ebp
c000168b:	89 e5                	mov    %esp,%ebp
c000168d:	83 ec 18             	sub    $0x18,%esp
c0001690:	83 ec 04             	sub    $0x4,%esp
c0001693:	6a 12                	push   $0x12
c0001695:	ff 75 08             	pushl  0x8(%ebp)
c0001698:	6a 02                	push   $0x2
c000169a:	e8 39 89 00 00       	call   c0009fd8 <send_rec>
c000169f:	83 c4 10             	add    $0x10,%esp
c00016a2:	8b 45 08             	mov    0x8(%ebp),%eax
c00016a5:	8b 40 78             	mov    0x78(%eax),%eax
c00016a8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00016ab:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00016af:	0f 84 d4 00 00 00    	je     c0001789 <hd_handle+0xff>
c00016b5:	8b 45 08             	mov    0x8(%ebp),%eax
c00016b8:	8b 00                	mov    (%eax),%eax
c00016ba:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00016bd:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c00016c1:	74 28                	je     c00016eb <hd_handle+0x61>
c00016c3:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c00016c7:	74 22                	je     c00016eb <hd_handle+0x61>
c00016c9:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c00016cd:	74 1c                	je     c00016eb <hd_handle+0x61>
c00016cf:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c00016d3:	74 16                	je     c00016eb <hd_handle+0x61>
c00016d5:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c00016dc:	74 0d                	je     c00016eb <hd_handle+0x61>
c00016de:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c00016e5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00016e8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00016eb:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c00016ef:	74 34                	je     c0001725 <hd_handle+0x9b>
c00016f1:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c00016f5:	74 2e                	je     c0001725 <hd_handle+0x9b>
c00016f7:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c00016fb:	74 28                	je     c0001725 <hd_handle+0x9b>
c00016fd:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c0001701:	74 22                	je     c0001725 <hd_handle+0x9b>
c0001703:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c000170a:	74 19                	je     c0001725 <hd_handle+0x9b>
c000170c:	6a 6d                	push   $0x6d
c000170e:	68 84 b0 00 c0       	push   $0xc000b084
c0001713:	68 84 b0 00 c0       	push   $0xc000b084
c0001718:	68 8c b0 00 c0       	push   $0xc000b08c
c000171d:	e8 79 7f 00 00       	call   c000969b <assertion_failure>
c0001722:	83 c4 10             	add    $0x10,%esp
c0001725:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c0001729:	74 2c                	je     c0001757 <hd_handle+0xcd>
c000172b:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c000172f:	77 0e                	ja     c000173f <hd_handle+0xb5>
c0001731:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c0001735:	74 19                	je     c0001750 <hd_handle+0xc6>
c0001737:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c000173b:	74 1a                	je     c0001757 <hd_handle+0xcd>
c000173d:	eb 37                	jmp    c0001776 <hd_handle+0xec>
c000173f:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c0001743:	74 22                	je     c0001767 <hd_handle+0xdd>
c0001745:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c000174c:	74 3e                	je     c000178c <hd_handle+0x102>
c000174e:	eb 26                	jmp    c0001776 <hd_handle+0xec>
c0001750:	e8 e6 06 00 00       	call   c0001e3b <hd_open>
c0001755:	eb 36                	jmp    c000178d <hd_handle+0x103>
c0001757:	83 ec 0c             	sub    $0xc,%esp
c000175a:	ff 75 08             	pushl  0x8(%ebp)
c000175d:	e8 b2 08 00 00       	call   c0002014 <hd_rdwt>
c0001762:	83 c4 10             	add    $0x10,%esp
c0001765:	eb 26                	jmp    c000178d <hd_handle+0x103>
c0001767:	83 ec 0c             	sub    $0xc,%esp
c000176a:	6a 00                	push   $0x0
c000176c:	e8 71 07 00 00       	call   c0001ee2 <get_hd_ioctl>
c0001771:	83 c4 10             	add    $0x10,%esp
c0001774:	eb 17                	jmp    c000178d <hd_handle+0x103>
c0001776:	83 ec 0c             	sub    $0xc,%esp
c0001779:	68 e6 b0 00 c0       	push   $0xc000b0e6
c000177e:	e8 d4 7e 00 00       	call   c0009657 <spin>
c0001783:	83 c4 10             	add    $0x10,%esp
c0001786:	90                   	nop
c0001787:	eb 04                	jmp    c000178d <hd_handle+0x103>
c0001789:	90                   	nop
c000178a:	eb 01                	jmp    c000178d <hd_handle+0x103>
c000178c:	90                   	nop
c000178d:	c9                   	leave  
c000178e:	c3                   	ret    

c000178f <hd_cmd_out>:
c000178f:	55                   	push   %ebp
c0001790:	89 e5                	mov    %esp,%ebp
c0001792:	83 ec 08             	sub    $0x8,%esp
c0001795:	83 ec 04             	sub    $0x4,%esp
c0001798:	68 18 73 01 00       	push   $0x17318
c000179d:	6a 00                	push   $0x0
c000179f:	68 80 00 00 00       	push   $0x80
c00017a4:	e8 36 0b 00 00       	call   c00022df <waitfor>
c00017a9:	83 c4 10             	add    $0x10,%esp
c00017ac:	85 c0                	test   %eax,%eax
c00017ae:	75 10                	jne    c00017c0 <hd_cmd_out+0x31>
c00017b0:	83 ec 0c             	sub    $0xc,%esp
c00017b3:	68 f8 b0 00 c0       	push   $0xc000b0f8
c00017b8:	e8 c0 7e 00 00       	call   c000967d <panic>
c00017bd:	83 c4 10             	add    $0x10,%esp
c00017c0:	83 ec 08             	sub    $0x8,%esp
c00017c3:	6a 00                	push   $0x0
c00017c5:	68 f6 03 00 00       	push   $0x3f6
c00017ca:	e8 ca fa ff ff       	call   c0001299 <out_byte>
c00017cf:	83 c4 10             	add    $0x10,%esp
c00017d2:	8b 45 08             	mov    0x8(%ebp),%eax
c00017d5:	0f b6 00             	movzbl (%eax),%eax
c00017d8:	0f b6 c0             	movzbl %al,%eax
c00017db:	83 ec 08             	sub    $0x8,%esp
c00017de:	50                   	push   %eax
c00017df:	68 f1 01 00 00       	push   $0x1f1
c00017e4:	e8 b0 fa ff ff       	call   c0001299 <out_byte>
c00017e9:	83 c4 10             	add    $0x10,%esp
c00017ec:	8b 45 08             	mov    0x8(%ebp),%eax
c00017ef:	0f b6 40 01          	movzbl 0x1(%eax),%eax
c00017f3:	0f b6 c0             	movzbl %al,%eax
c00017f6:	83 ec 08             	sub    $0x8,%esp
c00017f9:	50                   	push   %eax
c00017fa:	68 f2 01 00 00       	push   $0x1f2
c00017ff:	e8 95 fa ff ff       	call   c0001299 <out_byte>
c0001804:	83 c4 10             	add    $0x10,%esp
c0001807:	8b 45 08             	mov    0x8(%ebp),%eax
c000180a:	0f b6 40 02          	movzbl 0x2(%eax),%eax
c000180e:	0f b6 c0             	movzbl %al,%eax
c0001811:	83 ec 08             	sub    $0x8,%esp
c0001814:	50                   	push   %eax
c0001815:	68 f3 01 00 00       	push   $0x1f3
c000181a:	e8 7a fa ff ff       	call   c0001299 <out_byte>
c000181f:	83 c4 10             	add    $0x10,%esp
c0001822:	8b 45 08             	mov    0x8(%ebp),%eax
c0001825:	0f b6 40 03          	movzbl 0x3(%eax),%eax
c0001829:	0f b6 c0             	movzbl %al,%eax
c000182c:	83 ec 08             	sub    $0x8,%esp
c000182f:	50                   	push   %eax
c0001830:	68 f4 01 00 00       	push   $0x1f4
c0001835:	e8 5f fa ff ff       	call   c0001299 <out_byte>
c000183a:	83 c4 10             	add    $0x10,%esp
c000183d:	8b 45 08             	mov    0x8(%ebp),%eax
c0001840:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0001844:	0f b6 c0             	movzbl %al,%eax
c0001847:	83 ec 08             	sub    $0x8,%esp
c000184a:	50                   	push   %eax
c000184b:	68 f5 01 00 00       	push   $0x1f5
c0001850:	e8 44 fa ff ff       	call   c0001299 <out_byte>
c0001855:	83 c4 10             	add    $0x10,%esp
c0001858:	8b 45 08             	mov    0x8(%ebp),%eax
c000185b:	0f b6 40 05          	movzbl 0x5(%eax),%eax
c000185f:	0f b6 c0             	movzbl %al,%eax
c0001862:	83 ec 08             	sub    $0x8,%esp
c0001865:	50                   	push   %eax
c0001866:	68 f6 01 00 00       	push   $0x1f6
c000186b:	e8 29 fa ff ff       	call   c0001299 <out_byte>
c0001870:	83 c4 10             	add    $0x10,%esp
c0001873:	8b 45 08             	mov    0x8(%ebp),%eax
c0001876:	0f b6 40 06          	movzbl 0x6(%eax),%eax
c000187a:	0f b6 c0             	movzbl %al,%eax
c000187d:	83 ec 08             	sub    $0x8,%esp
c0001880:	50                   	push   %eax
c0001881:	68 f7 01 00 00       	push   $0x1f7
c0001886:	e8 0e fa ff ff       	call   c0001299 <out_byte>
c000188b:	83 c4 10             	add    $0x10,%esp
c000188e:	90                   	nop
c000188f:	c9                   	leave  
c0001890:	c3                   	ret    

c0001891 <hd_identify>:
c0001891:	55                   	push   %ebp
c0001892:	89 e5                	mov    %esp,%ebp
c0001894:	53                   	push   %ebx
c0001895:	83 ec 24             	sub    $0x24,%esp
c0001898:	89 e0                	mov    %esp,%eax
c000189a:	89 c3                	mov    %eax,%ebx
c000189c:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
c00018a0:	c6 45 e6 01          	movb   $0x1,-0x1a(%ebp)
c00018a4:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
c00018a8:	c6 45 e8 00          	movb   $0x0,-0x18(%ebp)
c00018ac:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c00018b0:	8b 45 08             	mov    0x8(%ebp),%eax
c00018b3:	c1 e0 04             	shl    $0x4,%eax
c00018b6:	83 c8 e0             	or     $0xffffffe0,%eax
c00018b9:	88 45 ea             	mov    %al,-0x16(%ebp)
c00018bc:	c6 45 eb ec          	movb   $0xec,-0x15(%ebp)
c00018c0:	83 ec 0c             	sub    $0xc,%esp
c00018c3:	8d 45 e5             	lea    -0x1b(%ebp),%eax
c00018c6:	50                   	push   %eax
c00018c7:	e8 c3 fe ff ff       	call   c000178f <hd_cmd_out>
c00018cc:	83 c4 10             	add    $0x10,%esp
c00018cf:	e8 f0 06 00 00       	call   c0001fc4 <interrupt_wait>
c00018d4:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c00018db:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00018de:	8d 50 ff             	lea    -0x1(%eax),%edx
c00018e1:	89 55 f0             	mov    %edx,-0x10(%ebp)
c00018e4:	89 c2                	mov    %eax,%edx
c00018e6:	b8 10 00 00 00       	mov    $0x10,%eax
c00018eb:	83 e8 01             	sub    $0x1,%eax
c00018ee:	01 d0                	add    %edx,%eax
c00018f0:	b9 10 00 00 00       	mov    $0x10,%ecx
c00018f5:	ba 00 00 00 00       	mov    $0x0,%edx
c00018fa:	f7 f1                	div    %ecx
c00018fc:	6b c0 10             	imul   $0x10,%eax,%eax
c00018ff:	29 c4                	sub    %eax,%esp
c0001901:	89 e0                	mov    %esp,%eax
c0001903:	83 c0 00             	add    $0x0,%eax
c0001906:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0001909:	83 ec 04             	sub    $0x4,%esp
c000190c:	ff 75 f4             	pushl  -0xc(%ebp)
c000190f:	6a 00                	push   $0x0
c0001911:	ff 75 ec             	pushl  -0x14(%ebp)
c0001914:	e8 26 a5 00 00       	call   c000be3f <Memset>
c0001919:	83 c4 10             	add    $0x10,%esp
c000191c:	83 ec 04             	sub    $0x4,%esp
c000191f:	ff 75 f4             	pushl  -0xc(%ebp)
c0001922:	ff 75 ec             	pushl  -0x14(%ebp)
c0001925:	68 f0 01 00 00       	push   $0x1f0
c000192a:	e8 64 a5 00 00       	call   c000be93 <read_port>
c000192f:	83 c4 10             	add    $0x10,%esp
c0001932:	83 ec 0c             	sub    $0xc,%esp
c0001935:	ff 75 ec             	pushl  -0x14(%ebp)
c0001938:	e8 0b 00 00 00       	call   c0001948 <print_hdinfo>
c000193d:	83 c4 10             	add    $0x10,%esp
c0001940:	89 dc                	mov    %ebx,%esp
c0001942:	90                   	nop
c0001943:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0001946:	c9                   	leave  
c0001947:	c3                   	ret    

c0001948 <print_hdinfo>:
c0001948:	55                   	push   %ebp
c0001949:	89 e5                	mov    %esp,%ebp
c000194b:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0001951:	66 c7 45 b4 0a 00    	movw   $0xa,-0x4c(%ebp)
c0001957:	66 c7 45 b6 14 00    	movw   $0x14,-0x4a(%ebp)
c000195d:	c7 45 b8 53 65 72 69 	movl   $0x69726553,-0x48(%ebp)
c0001964:	c7 45 bc 61 6c 20 4e 	movl   $0x4e206c61,-0x44(%ebp)
c000196b:	c7 45 c0 75 6d 62 65 	movl   $0x65626d75,-0x40(%ebp)
c0001972:	c7 45 c4 72 00 00 00 	movl   $0x72,-0x3c(%ebp)
c0001979:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0001980:	66 c7 45 cc 1b 00    	movw   $0x1b,-0x34(%ebp)
c0001986:	66 c7 45 ce 28 00    	movw   $0x28,-0x32(%ebp)
c000198c:	c7 45 d0 4d 6f 64 65 	movl   $0x65646f4d,-0x30(%ebp)
c0001993:	c7 45 d4 6c 20 4e 75 	movl   $0x754e206c,-0x2c(%ebp)
c000199a:	c7 45 d8 6d 62 65 72 	movl   $0x7265626d,-0x28(%ebp)
c00019a1:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c00019a8:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c00019af:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00019b6:	e9 8f 00 00 00       	jmp    c0001a4a <print_hdinfo+0x102>
c00019bb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00019c2:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00019c5:	89 d0                	mov    %edx,%eax
c00019c7:	01 c0                	add    %eax,%eax
c00019c9:	01 d0                	add    %edx,%eax
c00019cb:	c1 e0 03             	shl    $0x3,%eax
c00019ce:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c00019d1:	01 c8                	add    %ecx,%eax
c00019d3:	83 e8 44             	sub    $0x44,%eax
c00019d6:	0f b7 00             	movzwl (%eax),%eax
c00019d9:	0f b7 c0             	movzwl %ax,%eax
c00019dc:	8d 14 00             	lea    (%eax,%eax,1),%edx
c00019df:	8b 45 08             	mov    0x8(%ebp),%eax
c00019e2:	01 d0                	add    %edx,%eax
c00019e4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00019e7:	eb 30                	jmp    c0001a19 <print_hdinfo+0xd1>
c00019e9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00019ec:	8d 50 01             	lea    0x1(%eax),%edx
c00019ef:	89 55 ec             	mov    %edx,-0x14(%ebp)
c00019f2:	8b 55 f0             	mov    -0x10(%ebp),%edx
c00019f5:	83 c2 01             	add    $0x1,%edx
c00019f8:	0f b6 00             	movzbl (%eax),%eax
c00019fb:	88 44 15 81          	mov    %al,-0x7f(%ebp,%edx,1)
c00019ff:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0001a02:	8d 50 01             	lea    0x1(%eax),%edx
c0001a05:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0001a08:	0f b6 00             	movzbl (%eax),%eax
c0001a0b:	8d 4d 81             	lea    -0x7f(%ebp),%ecx
c0001a0e:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0001a11:	01 ca                	add    %ecx,%edx
c0001a13:	88 02                	mov    %al,(%edx)
c0001a15:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0001a19:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0001a1c:	89 d0                	mov    %edx,%eax
c0001a1e:	01 c0                	add    %eax,%eax
c0001a20:	01 d0                	add    %edx,%eax
c0001a22:	c1 e0 03             	shl    $0x3,%eax
c0001a25:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0001a28:	01 c8                	add    %ecx,%eax
c0001a2a:	83 e8 42             	sub    $0x42,%eax
c0001a2d:	0f b7 00             	movzwl (%eax),%eax
c0001a30:	66 d1 e8             	shr    %ax
c0001a33:	0f b7 c0             	movzwl %ax,%eax
c0001a36:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0001a39:	7c ae                	jl     c00019e9 <print_hdinfo+0xa1>
c0001a3b:	8d 55 81             	lea    -0x7f(%ebp),%edx
c0001a3e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0001a41:	01 d0                	add    %edx,%eax
c0001a43:	c6 00 00             	movb   $0x0,(%eax)
c0001a46:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0001a4a:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0001a4e:	0f 8e 67 ff ff ff    	jle    c00019bb <print_hdinfo+0x73>
c0001a54:	8b 45 08             	mov    0x8(%ebp),%eax
c0001a57:	0f b7 40 62          	movzwl 0x62(%eax),%eax
c0001a5b:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
c0001a5f:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0001a63:	66 c1 e8 08          	shr    $0x8,%ax
c0001a67:	66 85 c0             	test   %ax,%ax
c0001a6a:	0f 95 c0             	setne  %al
c0001a6d:	88 45 e9             	mov    %al,-0x17(%ebp)
c0001a70:	c7 45 ac 59 65 73 00 	movl   $0x736559,-0x54(%ebp)
c0001a77:	66 c7 45 a9 4e 6f    	movw   $0x6f4e,-0x57(%ebp)
c0001a7d:	c6 45 ab 00          	movb   $0x0,-0x55(%ebp)
c0001a81:	80 7d e9 01          	cmpb   $0x1,-0x17(%ebp)
c0001a85:	75 15                	jne    c0001a9c <print_hdinfo+0x154>
c0001a87:	83 ec 08             	sub    $0x8,%esp
c0001a8a:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0001a8d:	50                   	push   %eax
c0001a8e:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0001a91:	50                   	push   %eax
c0001a92:	e8 c7 a3 00 00       	call   c000be5e <Strcpy>
c0001a97:	83 c4 10             	add    $0x10,%esp
c0001a9a:	eb 13                	jmp    c0001aaf <print_hdinfo+0x167>
c0001a9c:	83 ec 08             	sub    $0x8,%esp
c0001a9f:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0001aa2:	50                   	push   %eax
c0001aa3:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0001aa6:	50                   	push   %eax
c0001aa7:	e8 b2 a3 00 00       	call   c000be5e <Strcpy>
c0001aac:	83 c4 10             	add    $0x10,%esp
c0001aaf:	8b 45 08             	mov    0x8(%ebp),%eax
c0001ab2:	83 c0 7a             	add    $0x7a,%eax
c0001ab5:	0f b7 00             	movzwl (%eax),%eax
c0001ab8:	0f b7 d0             	movzwl %ax,%edx
c0001abb:	8b 45 08             	mov    0x8(%ebp),%eax
c0001abe:	83 c0 78             	add    $0x78,%eax
c0001ac1:	0f b7 00             	movzwl (%eax),%eax
c0001ac4:	0f b7 c0             	movzwl %ax,%eax
c0001ac7:	83 c0 10             	add    $0x10,%eax
c0001aca:	89 c1                	mov    %eax,%ecx
c0001acc:	d3 e2                	shl    %cl,%edx
c0001ace:	89 d0                	mov    %edx,%eax
c0001ad0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0001ad3:	90                   	nop
c0001ad4:	c9                   	leave  
c0001ad5:	c3                   	ret    

c0001ad6 <print_dpt_entry>:
c0001ad6:	55                   	push   %ebp
c0001ad7:	89 e5                	mov    %esp,%ebp
c0001ad9:	83 ec 08             	sub    $0x8,%esp
c0001adc:	8b 45 08             	mov    0x8(%ebp),%eax
c0001adf:	8b 40 08             	mov    0x8(%eax),%eax
c0001ae2:	83 ec 08             	sub    $0x8,%esp
c0001ae5:	50                   	push   %eax
c0001ae6:	68 02 b1 00 c0       	push   $0xc000b102
c0001aeb:	e8 4e 78 00 00       	call   c000933e <Printf>
c0001af0:	83 c4 10             	add    $0x10,%esp
c0001af3:	8b 45 08             	mov    0x8(%ebp),%eax
c0001af6:	8b 40 0c             	mov    0xc(%eax),%eax
c0001af9:	83 ec 08             	sub    $0x8,%esp
c0001afc:	50                   	push   %eax
c0001afd:	68 0a b1 00 c0       	push   $0xc000b10a
c0001b02:	e8 37 78 00 00       	call   c000933e <Printf>
c0001b07:	83 c4 10             	add    $0x10,%esp
c0001b0a:	8b 45 08             	mov    0x8(%ebp),%eax
c0001b0d:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0001b11:	0f b6 c0             	movzbl %al,%eax
c0001b14:	83 ec 08             	sub    $0x8,%esp
c0001b17:	50                   	push   %eax
c0001b18:	68 1b b1 00 c0       	push   $0xc000b11b
c0001b1d:	e8 1c 78 00 00       	call   c000933e <Printf>
c0001b22:	83 c4 10             	add    $0x10,%esp
c0001b25:	8b 45 08             	mov    0x8(%ebp),%eax
c0001b28:	0f b6 00             	movzbl (%eax),%eax
c0001b2b:	0f b6 c0             	movzbl %al,%eax
c0001b2e:	83 ec 08             	sub    $0x8,%esp
c0001b31:	50                   	push   %eax
c0001b32:	68 29 b1 00 c0       	push   $0xc000b129
c0001b37:	e8 02 78 00 00       	call   c000933e <Printf>
c0001b3c:	83 c4 10             	add    $0x10,%esp
c0001b3f:	90                   	nop
c0001b40:	c9                   	leave  
c0001b41:	c3                   	ret    

c0001b42 <get_partition_table>:
c0001b42:	55                   	push   %ebp
c0001b43:	89 e5                	mov    %esp,%ebp
c0001b45:	53                   	push   %ebx
c0001b46:	83 ec 24             	sub    $0x24,%esp
c0001b49:	89 e0                	mov    %esp,%eax
c0001b4b:	89 c3                	mov    %eax,%ebx
c0001b4d:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
c0001b51:	c6 45 e2 01          	movb   $0x1,-0x1e(%ebp)
c0001b55:	8b 45 0c             	mov    0xc(%ebp),%eax
c0001b58:	88 45 e3             	mov    %al,-0x1d(%ebp)
c0001b5b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0001b5e:	c1 f8 08             	sar    $0x8,%eax
c0001b61:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0001b64:	8b 45 0c             	mov    0xc(%ebp),%eax
c0001b67:	c1 f8 10             	sar    $0x10,%eax
c0001b6a:	88 45 e5             	mov    %al,-0x1b(%ebp)
c0001b6d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0001b70:	c1 f8 18             	sar    $0x18,%eax
c0001b73:	89 c2                	mov    %eax,%edx
c0001b75:	8b 45 08             	mov    0x8(%ebp),%eax
c0001b78:	c1 e0 04             	shl    $0x4,%eax
c0001b7b:	09 d0                	or     %edx,%eax
c0001b7d:	83 c8 e0             	or     $0xffffffe0,%eax
c0001b80:	88 45 e6             	mov    %al,-0x1a(%ebp)
c0001b83:	c6 45 e7 20          	movb   $0x20,-0x19(%ebp)
c0001b87:	83 ec 0c             	sub    $0xc,%esp
c0001b8a:	8d 45 e1             	lea    -0x1f(%ebp),%eax
c0001b8d:	50                   	push   %eax
c0001b8e:	e8 fc fb ff ff       	call   c000178f <hd_cmd_out>
c0001b93:	83 c4 10             	add    $0x10,%esp
c0001b96:	e8 29 04 00 00       	call   c0001fc4 <interrupt_wait>
c0001b9b:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c0001ba2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001ba5:	8d 50 ff             	lea    -0x1(%eax),%edx
c0001ba8:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0001bab:	89 c2                	mov    %eax,%edx
c0001bad:	b8 10 00 00 00       	mov    $0x10,%eax
c0001bb2:	83 e8 01             	sub    $0x1,%eax
c0001bb5:	01 d0                	add    %edx,%eax
c0001bb7:	b9 10 00 00 00       	mov    $0x10,%ecx
c0001bbc:	ba 00 00 00 00       	mov    $0x0,%edx
c0001bc1:	f7 f1                	div    %ecx
c0001bc3:	6b c0 10             	imul   $0x10,%eax,%eax
c0001bc6:	29 c4                	sub    %eax,%esp
c0001bc8:	89 e0                	mov    %esp,%eax
c0001bca:	83 c0 00             	add    $0x0,%eax
c0001bcd:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0001bd0:	83 ec 04             	sub    $0x4,%esp
c0001bd3:	ff 75 f4             	pushl  -0xc(%ebp)
c0001bd6:	6a 00                	push   $0x0
c0001bd8:	ff 75 ec             	pushl  -0x14(%ebp)
c0001bdb:	e8 5f a2 00 00       	call   c000be3f <Memset>
c0001be0:	83 c4 10             	add    $0x10,%esp
c0001be3:	83 ec 04             	sub    $0x4,%esp
c0001be6:	ff 75 f4             	pushl  -0xc(%ebp)
c0001be9:	ff 75 ec             	pushl  -0x14(%ebp)
c0001bec:	68 f0 01 00 00       	push   $0x1f0
c0001bf1:	e8 9d a2 00 00       	call   c000be93 <read_port>
c0001bf6:	83 c4 10             	add    $0x10,%esp
c0001bf9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0001bfc:	05 be 01 00 00       	add    $0x1be,%eax
c0001c01:	83 ec 04             	sub    $0x4,%esp
c0001c04:	6a 40                	push   $0x40
c0001c06:	50                   	push   %eax
c0001c07:	ff 75 10             	pushl  0x10(%ebp)
c0001c0a:	e8 08 5f 00 00       	call   c0007b17 <Memcpy>
c0001c0f:	83 c4 10             	add    $0x10,%esp
c0001c12:	c7 45 e8 05 00 00 00 	movl   $0x5,-0x18(%ebp)
c0001c19:	89 dc                	mov    %ebx,%esp
c0001c1b:	90                   	nop
c0001c1c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0001c1f:	c9                   	leave  
c0001c20:	c3                   	ret    

c0001c21 <partition>:
c0001c21:	55                   	push   %ebp
c0001c22:	89 e5                	mov    %esp,%ebp
c0001c24:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0001c2a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0001c2d:	88 45 84             	mov    %al,-0x7c(%ebp)
c0001c30:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c0001c34:	7f 19                	jg     c0001c4f <partition+0x2e>
c0001c36:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0001c39:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0001c3e:	89 c8                	mov    %ecx,%eax
c0001c40:	f7 ea                	imul   %edx
c0001c42:	d1 fa                	sar    %edx
c0001c44:	89 c8                	mov    %ecx,%eax
c0001c46:	c1 f8 1f             	sar    $0x1f,%eax
c0001c49:	29 c2                	sub    %eax,%edx
c0001c4b:	89 d0                	mov    %edx,%eax
c0001c4d:	eb 11                	jmp    c0001c60 <partition+0x3f>
c0001c4f:	8b 45 08             	mov    0x8(%ebp),%eax
c0001c52:	83 e8 10             	sub    $0x10,%eax
c0001c55:	8d 50 3f             	lea    0x3f(%eax),%edx
c0001c58:	85 c0                	test   %eax,%eax
c0001c5a:	0f 48 c2             	cmovs  %edx,%eax
c0001c5d:	c1 f8 06             	sar    $0x6,%eax
c0001c60:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0001c63:	80 7d 84 00          	cmpb   $0x0,-0x7c(%ebp)
c0001c67:	0f 85 cc 00 00 00    	jne    c0001d39 <partition+0x118>
c0001c6d:	83 ec 04             	sub    $0x4,%esp
c0001c70:	6a 40                	push   $0x40
c0001c72:	6a 00                	push   $0x0
c0001c74:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0001c77:	50                   	push   %eax
c0001c78:	e8 c2 a1 00 00       	call   c000be3f <Memset>
c0001c7d:	83 c4 10             	add    $0x10,%esp
c0001c80:	83 ec 04             	sub    $0x4,%esp
c0001c83:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0001c86:	50                   	push   %eax
c0001c87:	6a 00                	push   $0x0
c0001c89:	ff 75 e8             	pushl  -0x18(%ebp)
c0001c8c:	e8 b1 fe ff ff       	call   c0001b42 <get_partition_table>
c0001c91:	83 c4 10             	add    $0x10,%esp
c0001c94:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0001c9b:	e9 8a 00 00 00       	jmp    c0001d2a <partition+0x109>
c0001ca0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001ca3:	83 c0 01             	add    $0x1,%eax
c0001ca6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0001ca9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001cac:	c1 e0 04             	shl    $0x4,%eax
c0001caf:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0001cb2:	01 c8                	add    %ecx,%eax
c0001cb4:	83 e8 5c             	sub    $0x5c,%eax
c0001cb7:	8b 00                	mov    (%eax),%eax
c0001cb9:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0001cbc:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0001cbf:	c1 e1 03             	shl    $0x3,%ecx
c0001cc2:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0001cc8:	01 ca                	add    %ecx,%edx
c0001cca:	81 c2 44 1f 01 c0    	add    $0xc0011f44,%edx
c0001cd0:	89 02                	mov    %eax,(%edx)
c0001cd2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001cd5:	c1 e0 04             	shl    $0x4,%eax
c0001cd8:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0001cdb:	01 c8                	add    %ecx,%eax
c0001cdd:	83 e8 58             	sub    $0x58,%eax
c0001ce0:	8b 00                	mov    (%eax),%eax
c0001ce2:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0001ce5:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0001ce8:	c1 e1 03             	shl    $0x3,%ecx
c0001ceb:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0001cf1:	01 ca                	add    %ecx,%edx
c0001cf3:	81 c2 48 1f 01 c0    	add    $0xc0011f48,%edx
c0001cf9:	89 02                	mov    %eax,(%edx)
c0001cfb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001cfe:	c1 e0 04             	shl    $0x4,%eax
c0001d01:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0001d04:	01 c8                	add    %ecx,%eax
c0001d06:	83 e8 60             	sub    $0x60,%eax
c0001d09:	0f b6 00             	movzbl (%eax),%eax
c0001d0c:	3c 05                	cmp    $0x5,%al
c0001d0e:	75 16                	jne    c0001d26 <partition+0x105>
c0001d10:	8b 55 08             	mov    0x8(%ebp),%edx
c0001d13:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0001d16:	01 d0                	add    %edx,%eax
c0001d18:	83 ec 08             	sub    $0x8,%esp
c0001d1b:	6a 01                	push   $0x1
c0001d1d:	50                   	push   %eax
c0001d1e:	e8 fe fe ff ff       	call   c0001c21 <partition>
c0001d23:	83 c4 10             	add    $0x10,%esp
c0001d26:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0001d2a:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c0001d2e:	0f 8e 6c ff ff ff    	jle    c0001ca0 <partition+0x7f>
c0001d34:	e9 ff 00 00 00       	jmp    c0001e38 <partition+0x217>
c0001d39:	80 7d 84 01          	cmpb   $0x1,-0x7c(%ebp)
c0001d3d:	0f 85 f5 00 00 00    	jne    c0001e38 <partition+0x217>
c0001d43:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0001d46:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0001d4b:	89 c8                	mov    %ecx,%eax
c0001d4d:	f7 ea                	imul   %edx
c0001d4f:	d1 fa                	sar    %edx
c0001d51:	89 c8                	mov    %ecx,%eax
c0001d53:	c1 f8 1f             	sar    $0x1f,%eax
c0001d56:	29 c2                	sub    %eax,%edx
c0001d58:	89 d0                	mov    %edx,%eax
c0001d5a:	c1 e0 02             	shl    $0x2,%eax
c0001d5d:	01 d0                	add    %edx,%eax
c0001d5f:	29 c1                	sub    %eax,%ecx
c0001d61:	89 c8                	mov    %ecx,%eax
c0001d63:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0001d66:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0001d69:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0001d6c:	c1 e2 03             	shl    $0x3,%edx
c0001d6f:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0001d75:	01 d0                	add    %edx,%eax
c0001d77:	05 44 1f 01 c0       	add    $0xc0011f44,%eax
c0001d7c:	8b 00                	mov    (%eax),%eax
c0001d7e:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0001d81:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0001d84:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0001d87:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0001d8a:	83 e8 01             	sub    $0x1,%eax
c0001d8d:	c1 e0 04             	shl    $0x4,%eax
c0001d90:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0001d93:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0001d9a:	e9 8c 00 00 00       	jmp    c0001e2b <partition+0x20a>
c0001d9f:	83 ec 04             	sub    $0x4,%esp
c0001da2:	6a 40                	push   $0x40
c0001da4:	6a 00                	push   $0x0
c0001da6:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0001da9:	50                   	push   %eax
c0001daa:	e8 90 a0 00 00       	call   c000be3f <Memset>
c0001daf:	83 c4 10             	add    $0x10,%esp
c0001db2:	83 ec 04             	sub    $0x4,%esp
c0001db5:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0001db8:	50                   	push   %eax
c0001db9:	ff 75 f0             	pushl  -0x10(%ebp)
c0001dbc:	ff 75 e8             	pushl  -0x18(%ebp)
c0001dbf:	e8 7e fd ff ff       	call   c0001b42 <get_partition_table>
c0001dc4:	83 c4 10             	add    $0x10,%esp
c0001dc7:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0001dca:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0001dcd:	01 d0                	add    %edx,%eax
c0001dcf:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0001dd2:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0001dd5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0001dd8:	01 c2                	add    %eax,%edx
c0001dda:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0001ddd:	8d 48 04             	lea    0x4(%eax),%ecx
c0001de0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0001de3:	c1 e1 03             	shl    $0x3,%ecx
c0001de6:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0001dec:	01 c8                	add    %ecx,%eax
c0001dee:	05 44 1f 01 c0       	add    $0xc0011f44,%eax
c0001df3:	89 10                	mov    %edx,(%eax)
c0001df5:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0001df8:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0001dfb:	8d 4a 04             	lea    0x4(%edx),%ecx
c0001dfe:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0001e01:	c1 e1 03             	shl    $0x3,%ecx
c0001e04:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0001e0a:	01 ca                	add    %ecx,%edx
c0001e0c:	81 c2 48 1f 01 c0    	add    $0xc0011f48,%edx
c0001e12:	89 02                	mov    %eax,(%edx)
c0001e14:	0f b6 45 a8          	movzbl -0x58(%ebp),%eax
c0001e18:	84 c0                	test   %al,%al
c0001e1a:	74 1b                	je     c0001e37 <partition+0x216>
c0001e1c:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0001e1f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0001e22:	01 d0                	add    %edx,%eax
c0001e24:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0001e27:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0001e2b:	83 7d ec 0f          	cmpl   $0xf,-0x14(%ebp)
c0001e2f:	0f 8e 6a ff ff ff    	jle    c0001d9f <partition+0x17e>
c0001e35:	eb 01                	jmp    c0001e38 <partition+0x217>
c0001e37:	90                   	nop
c0001e38:	90                   	nop
c0001e39:	c9                   	leave  
c0001e3a:	c3                   	ret    

c0001e3b <hd_open>:
c0001e3b:	55                   	push   %ebp
c0001e3c:	89 e5                	mov    %esp,%ebp
c0001e3e:	83 ec 18             	sub    $0x18,%esp
c0001e41:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0001e48:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001e4b:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0001e51:	05 40 1f 01 c0       	add    $0xc0011f40,%eax
c0001e56:	8b 00                	mov    (%eax),%eax
c0001e58:	8d 50 01             	lea    0x1(%eax),%edx
c0001e5b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001e5e:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0001e64:	05 40 1f 01 c0       	add    $0xc0011f40,%eax
c0001e69:	89 10                	mov    %edx,(%eax)
c0001e6b:	83 ec 0c             	sub    $0xc,%esp
c0001e6e:	6a 00                	push   $0x0
c0001e70:	e8 1c fa ff ff       	call   c0001891 <hd_identify>
c0001e75:	83 c4 10             	add    $0x10,%esp
c0001e78:	83 ec 08             	sub    $0x8,%esp
c0001e7b:	6a 00                	push   $0x0
c0001e7d:	6a 00                	push   $0x0
c0001e7f:	e8 9d fd ff ff       	call   c0001c21 <partition>
c0001e84:	83 c4 10             	add    $0x10,%esp
c0001e87:	83 ec 0c             	sub    $0xc,%esp
c0001e8a:	6a 7c                	push   $0x7c
c0001e8c:	e8 33 06 00 00       	call   c00024c4 <sys_malloc>
c0001e91:	83 c4 10             	add    $0x10,%esp
c0001e94:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0001e97:	83 ec 04             	sub    $0x4,%esp
c0001e9a:	6a 7c                	push   $0x7c
c0001e9c:	6a 00                	push   $0x0
c0001e9e:	ff 75 f0             	pushl  -0x10(%ebp)
c0001ea1:	e8 99 9f 00 00       	call   c000be3f <Memset>
c0001ea6:	83 c4 10             	add    $0x10,%esp
c0001ea9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0001eac:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0001eb3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0001eb6:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0001ebd:	83 ec 04             	sub    $0x4,%esp
c0001ec0:	6a 02                	push   $0x2
c0001ec2:	ff 75 f0             	pushl  -0x10(%ebp)
c0001ec5:	6a 01                	push   $0x1
c0001ec7:	e8 0c 81 00 00       	call   c0009fd8 <send_rec>
c0001ecc:	83 c4 10             	add    $0x10,%esp
c0001ecf:	83 ec 08             	sub    $0x8,%esp
c0001ed2:	6a 7c                	push   $0x7c
c0001ed4:	ff 75 f0             	pushl  -0x10(%ebp)
c0001ed7:	e8 fd 05 00 00       	call   c00024d9 <sys_free>
c0001edc:	83 c4 10             	add    $0x10,%esp
c0001edf:	90                   	nop
c0001ee0:	c9                   	leave  
c0001ee1:	c3                   	ret    

c0001ee2 <get_hd_ioctl>:
c0001ee2:	55                   	push   %ebp
c0001ee3:	89 e5                	mov    %esp,%ebp
c0001ee5:	83 ec 18             	sub    $0x18,%esp
c0001ee8:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c0001eec:	7f 19                	jg     c0001f07 <get_hd_ioctl+0x25>
c0001eee:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0001ef1:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0001ef6:	89 c8                	mov    %ecx,%eax
c0001ef8:	f7 ea                	imul   %edx
c0001efa:	d1 fa                	sar    %edx
c0001efc:	89 c8                	mov    %ecx,%eax
c0001efe:	c1 f8 1f             	sar    $0x1f,%eax
c0001f01:	29 c2                	sub    %eax,%edx
c0001f03:	89 d0                	mov    %edx,%eax
c0001f05:	eb 11                	jmp    c0001f18 <get_hd_ioctl+0x36>
c0001f07:	8b 45 08             	mov    0x8(%ebp),%eax
c0001f0a:	83 e8 10             	sub    $0x10,%eax
c0001f0d:	8d 50 3f             	lea    0x3f(%eax),%edx
c0001f10:	85 c0                	test   %eax,%eax
c0001f12:	0f 48 c2             	cmovs  %edx,%eax
c0001f15:	c1 f8 06             	sar    $0x6,%eax
c0001f18:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0001f1b:	8b 55 08             	mov    0x8(%ebp),%edx
c0001f1e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001f21:	c1 e2 03             	shl    $0x3,%edx
c0001f24:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0001f2a:	01 d0                	add    %edx,%eax
c0001f2c:	05 48 1f 01 c0       	add    $0xc0011f48,%eax
c0001f31:	8b 00                	mov    (%eax),%eax
c0001f33:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0001f36:	83 ec 0c             	sub    $0xc,%esp
c0001f39:	6a 7c                	push   $0x7c
c0001f3b:	e8 84 05 00 00       	call   c00024c4 <sys_malloc>
c0001f40:	83 c4 10             	add    $0x10,%esp
c0001f43:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0001f46:	83 ec 04             	sub    $0x4,%esp
c0001f49:	6a 7c                	push   $0x7c
c0001f4b:	6a 00                	push   $0x0
c0001f4d:	ff 75 ec             	pushl  -0x14(%ebp)
c0001f50:	e8 ea 9e 00 00       	call   c000be3f <Memset>
c0001f55:	83 c4 10             	add    $0x10,%esp
c0001f58:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0001f5b:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0001f62:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0001f65:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0001f6c:	83 ec 04             	sub    $0x4,%esp
c0001f6f:	6a 02                	push   $0x2
c0001f71:	ff 75 ec             	pushl  -0x14(%ebp)
c0001f74:	6a 01                	push   $0x1
c0001f76:	e8 5d 80 00 00       	call   c0009fd8 <send_rec>
c0001f7b:	83 c4 10             	add    $0x10,%esp
c0001f7e:	83 ec 08             	sub    $0x8,%esp
c0001f81:	6a 7c                	push   $0x7c
c0001f83:	ff 75 ec             	pushl  -0x14(%ebp)
c0001f86:	e8 4e 05 00 00       	call   c00024d9 <sys_free>
c0001f8b:	83 c4 10             	add    $0x10,%esp
c0001f8e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0001f91:	c9                   	leave  
c0001f92:	c3                   	ret    

c0001f93 <wait_for>:
c0001f93:	55                   	push   %ebp
c0001f94:	89 e5                	mov    %esp,%ebp
c0001f96:	83 ec 08             	sub    $0x8,%esp
c0001f99:	83 ec 04             	sub    $0x4,%esp
c0001f9c:	68 50 c3 00 00       	push   $0xc350
c0001fa1:	6a 08                	push   $0x8
c0001fa3:	6a 08                	push   $0x8
c0001fa5:	e8 35 03 00 00       	call   c00022df <waitfor>
c0001faa:	83 c4 10             	add    $0x10,%esp
c0001fad:	85 c0                	test   %eax,%eax
c0001faf:	75 10                	jne    c0001fc1 <wait_for+0x2e>
c0001fb1:	83 ec 0c             	sub    $0xc,%esp
c0001fb4:	68 34 b1 00 c0       	push   $0xc000b134
c0001fb9:	e8 bf 76 00 00       	call   c000967d <panic>
c0001fbe:	83 c4 10             	add    $0x10,%esp
c0001fc1:	90                   	nop
c0001fc2:	c9                   	leave  
c0001fc3:	c3                   	ret    

c0001fc4 <interrupt_wait>:
c0001fc4:	55                   	push   %ebp
c0001fc5:	89 e5                	mov    %esp,%ebp
c0001fc7:	83 ec 18             	sub    $0x18,%esp
c0001fca:	83 ec 0c             	sub    $0xc,%esp
c0001fcd:	6a 7c                	push   $0x7c
c0001fcf:	e8 f0 04 00 00       	call   c00024c4 <sys_malloc>
c0001fd4:	83 c4 10             	add    $0x10,%esp
c0001fd7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0001fda:	83 ec 04             	sub    $0x4,%esp
c0001fdd:	6a 7c                	push   $0x7c
c0001fdf:	6a 00                	push   $0x0
c0001fe1:	ff 75 f4             	pushl  -0xc(%ebp)
c0001fe4:	e8 56 9e 00 00       	call   c000be3f <Memset>
c0001fe9:	83 c4 10             	add    $0x10,%esp
c0001fec:	83 ec 04             	sub    $0x4,%esp
c0001fef:	68 13 02 00 00       	push   $0x213
c0001ff4:	ff 75 f4             	pushl  -0xc(%ebp)
c0001ff7:	6a 02                	push   $0x2
c0001ff9:	e8 da 7f 00 00       	call   c0009fd8 <send_rec>
c0001ffe:	83 c4 10             	add    $0x10,%esp
c0002001:	83 ec 08             	sub    $0x8,%esp
c0002004:	6a 7c                	push   $0x7c
c0002006:	ff 75 f4             	pushl  -0xc(%ebp)
c0002009:	e8 cb 04 00 00       	call   c00024d9 <sys_free>
c000200e:	83 c4 10             	add    $0x10,%esp
c0002011:	90                   	nop
c0002012:	c9                   	leave  
c0002013:	c3                   	ret    

c0002014 <hd_rdwt>:
c0002014:	55                   	push   %ebp
c0002015:	89 e5                	mov    %esp,%ebp
c0002017:	81 ec c8 00 00 00    	sub    $0xc8,%esp
c000201d:	8b 45 08             	mov    0x8(%ebp),%eax
c0002020:	8b 40 18             	mov    0x18(%eax),%eax
c0002023:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0002026:	8b 45 08             	mov    0x8(%ebp),%eax
c0002029:	8b 40 14             	mov    0x14(%eax),%eax
c000202c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000202f:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c0002033:	7f 19                	jg     c000204e <hd_rdwt+0x3a>
c0002035:	8b 4d e8             	mov    -0x18(%ebp),%ecx
c0002038:	ba 67 66 66 66       	mov    $0x66666667,%edx
c000203d:	89 c8                	mov    %ecx,%eax
c000203f:	f7 ea                	imul   %edx
c0002041:	d1 fa                	sar    %edx
c0002043:	89 c8                	mov    %ecx,%eax
c0002045:	c1 f8 1f             	sar    $0x1f,%eax
c0002048:	29 c2                	sub    %eax,%edx
c000204a:	89 d0                	mov    %edx,%eax
c000204c:	eb 11                	jmp    c000205f <hd_rdwt+0x4b>
c000204e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002051:	83 e8 10             	sub    $0x10,%eax
c0002054:	8d 50 3f             	lea    0x3f(%eax),%edx
c0002057:	85 c0                	test   %eax,%eax
c0002059:	0f 48 c2             	cmovs  %edx,%eax
c000205c:	c1 f8 06             	sar    $0x6,%eax
c000205f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0002062:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002065:	8d 50 f0             	lea    -0x10(%eax),%edx
c0002068:	89 d0                	mov    %edx,%eax
c000206a:	c1 f8 1f             	sar    $0x1f,%eax
c000206d:	c1 e8 1a             	shr    $0x1a,%eax
c0002070:	01 c2                	add    %eax,%edx
c0002072:	83 e2 3f             	and    $0x3f,%edx
c0002075:	29 c2                	sub    %eax,%edx
c0002077:	89 d0                	mov    %edx,%eax
c0002079:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000207c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000207f:	c1 e8 09             	shr    $0x9,%eax
c0002082:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0002085:	83 7d e8 08          	cmpl   $0x8,-0x18(%ebp)
c0002089:	7f 1a                	jg     c00020a5 <hd_rdwt+0x91>
c000208b:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000208e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002091:	c1 e2 03             	shl    $0x3,%edx
c0002094:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c000209a:	01 d0                	add    %edx,%eax
c000209c:	05 44 1f 01 c0       	add    $0xc0011f44,%eax
c00020a1:	8b 00                	mov    (%eax),%eax
c00020a3:	eb 1b                	jmp    c00020c0 <hd_rdwt+0xac>
c00020a5:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00020a8:	8d 50 04             	lea    0x4(%eax),%edx
c00020ab:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00020ae:	c1 e2 03             	shl    $0x3,%edx
c00020b1:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c00020b7:	01 d0                	add    %edx,%eax
c00020b9:	05 44 1f 01 c0       	add    $0xc0011f44,%eax
c00020be:	8b 00                	mov    (%eax),%eax
c00020c0:	8b 55 dc             	mov    -0x24(%ebp),%edx
c00020c3:	01 d0                	add    %edx,%eax
c00020c5:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00020c8:	8b 45 08             	mov    0x8(%ebp),%eax
c00020cb:	8b 40 0c             	mov    0xc(%eax),%eax
c00020ce:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00020d1:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00020d4:	05 ff 01 00 00       	add    $0x1ff,%eax
c00020d9:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c00020df:	85 c0                	test   %eax,%eax
c00020e1:	0f 48 c2             	cmovs  %edx,%eax
c00020e4:	c1 f8 09             	sar    $0x9,%eax
c00020e7:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00020ea:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00020ed:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00020f0:	8b 45 08             	mov    0x8(%ebp),%eax
c00020f3:	8b 40 10             	mov    0x10(%eax),%eax
c00020f6:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00020f9:	8b 45 08             	mov    0x8(%ebp),%eax
c00020fc:	8b 00                	mov    (%eax),%eax
c00020fe:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0002101:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0002104:	83 ec 08             	sub    $0x8,%esp
c0002107:	50                   	push   %eax
c0002108:	ff 75 d0             	pushl  -0x30(%ebp)
c000210b:	e8 0a 4c 00 00       	call   c0006d1a <alloc_virtual_memory>
c0002110:	83 c4 10             	add    $0x10,%esp
c0002113:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0002116:	8b 45 08             	mov    0x8(%ebp),%eax
c0002119:	8b 40 78             	mov    0x78(%eax),%eax
c000211c:	89 45 c8             	mov    %eax,-0x38(%ebp)
c000211f:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c0002123:	74 22                	je     c0002147 <hd_rdwt+0x133>
c0002125:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c0002129:	74 1c                	je     c0002147 <hd_rdwt+0x133>
c000212b:	68 b7 01 00 00       	push   $0x1b7
c0002130:	68 84 b0 00 c0       	push   $0xc000b084
c0002135:	68 84 b0 00 c0       	push   $0xc000b084
c000213a:	68 46 b1 00 c0       	push   $0xc000b146
c000213f:	e8 57 75 00 00       	call   c000969b <assertion_failure>
c0002144:	83 c4 10             	add    $0x10,%esp
c0002147:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
c000214b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000214e:	88 45 be             	mov    %al,-0x42(%ebp)
c0002151:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002154:	88 45 bf             	mov    %al,-0x41(%ebp)
c0002157:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000215a:	c1 f8 08             	sar    $0x8,%eax
c000215d:	88 45 c0             	mov    %al,-0x40(%ebp)
c0002160:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002163:	c1 f8 10             	sar    $0x10,%eax
c0002166:	88 45 c1             	mov    %al,-0x3f(%ebp)
c0002169:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000216c:	c1 f8 18             	sar    $0x18,%eax
c000216f:	83 e0 0f             	and    $0xf,%eax
c0002172:	83 c8 e0             	or     $0xffffffe0,%eax
c0002175:	88 45 c2             	mov    %al,-0x3e(%ebp)
c0002178:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c000217c:	75 07                	jne    c0002185 <hd_rdwt+0x171>
c000217e:	b8 20 00 00 00       	mov    $0x20,%eax
c0002183:	eb 05                	jmp    c000218a <hd_rdwt+0x176>
c0002185:	b8 30 00 00 00       	mov    $0x30,%eax
c000218a:	88 45 c3             	mov    %al,-0x3d(%ebp)
c000218d:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c0002191:	3c 20                	cmp    $0x20,%al
c0002193:	74 24                	je     c00021b9 <hd_rdwt+0x1a5>
c0002195:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c0002199:	3c 30                	cmp    $0x30,%al
c000219b:	74 1c                	je     c00021b9 <hd_rdwt+0x1a5>
c000219d:	68 c5 01 00 00       	push   $0x1c5
c00021a2:	68 84 b0 00 c0       	push   $0xc000b084
c00021a7:	68 84 b0 00 c0       	push   $0xc000b084
c00021ac:	68 64 b1 00 c0       	push   $0xc000b164
c00021b1:	e8 e5 74 00 00       	call   c000969b <assertion_failure>
c00021b6:	83 c4 10             	add    $0x10,%esp
c00021b9:	83 ec 0c             	sub    $0xc,%esp
c00021bc:	8d 45 bd             	lea    -0x43(%ebp),%eax
c00021bf:	50                   	push   %eax
c00021c0:	e8 ca f5 ff ff       	call   c000178f <hd_cmd_out>
c00021c5:	83 c4 10             	add    $0x10,%esp
c00021c8:	e9 9c 00 00 00       	jmp    c0002269 <hd_rdwt+0x255>
c00021cd:	b8 00 02 00 00       	mov    $0x200,%eax
c00021d2:	81 7d f4 00 02 00 00 	cmpl   $0x200,-0xc(%ebp)
c00021d9:	0f 4e 45 f4          	cmovle -0xc(%ebp),%eax
c00021dd:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c00021e0:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c00021e4:	75 51                	jne    c0002237 <hd_rdwt+0x223>
c00021e6:	e8 a8 fd ff ff       	call   c0001f93 <wait_for>
c00021eb:	e8 d4 fd ff ff       	call   c0001fc4 <interrupt_wait>
c00021f0:	83 ec 04             	sub    $0x4,%esp
c00021f3:	ff 75 c4             	pushl  -0x3c(%ebp)
c00021f6:	6a 00                	push   $0x0
c00021f8:	68 80 21 01 c0       	push   $0xc0012180
c00021fd:	e8 3d 9c 00 00       	call   c000be3f <Memset>
c0002202:	83 c4 10             	add    $0x10,%esp
c0002205:	83 ec 04             	sub    $0x4,%esp
c0002208:	68 00 02 00 00       	push   $0x200
c000220d:	68 80 21 01 c0       	push   $0xc0012180
c0002212:	68 f0 01 00 00       	push   $0x1f0
c0002217:	e8 77 9c 00 00       	call   c000be93 <read_port>
c000221c:	83 c4 10             	add    $0x10,%esp
c000221f:	83 ec 04             	sub    $0x4,%esp
c0002222:	ff 75 c4             	pushl  -0x3c(%ebp)
c0002225:	68 80 21 01 c0       	push   $0xc0012180
c000222a:	ff 75 f0             	pushl  -0x10(%ebp)
c000222d:	e8 e5 58 00 00       	call   c0007b17 <Memcpy>
c0002232:	83 c4 10             	add    $0x10,%esp
c0002235:	eb 26                	jmp    c000225d <hd_rdwt+0x249>
c0002237:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c000223b:	75 20                	jne    c000225d <hd_rdwt+0x249>
c000223d:	e8 51 fd ff ff       	call   c0001f93 <wait_for>
c0002242:	83 ec 04             	sub    $0x4,%esp
c0002245:	ff 75 c4             	pushl  -0x3c(%ebp)
c0002248:	ff 75 f0             	pushl  -0x10(%ebp)
c000224b:	68 f0 01 00 00       	push   $0x1f0
c0002250:	e8 52 9c 00 00       	call   c000bea7 <write_port>
c0002255:	83 c4 10             	add    $0x10,%esp
c0002258:	e8 67 fd ff ff       	call   c0001fc4 <interrupt_wait>
c000225d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0002260:	29 45 f4             	sub    %eax,-0xc(%ebp)
c0002263:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0002266:	01 45 f0             	add    %eax,-0x10(%ebp)
c0002269:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000226d:	0f 85 5a ff ff ff    	jne    c00021cd <hd_rdwt+0x1b9>
c0002273:	83 ec 04             	sub    $0x4,%esp
c0002276:	6a 7c                	push   $0x7c
c0002278:	6a 00                	push   $0x0
c000227a:	8d 85 40 ff ff ff    	lea    -0xc0(%ebp),%eax
c0002280:	50                   	push   %eax
c0002281:	e8 b9 9b 00 00       	call   c000be3f <Memset>
c0002286:	83 c4 10             	add    $0x10,%esp
c0002289:	c7 45 b8 65 00 00 00 	movl   $0x65,-0x48(%ebp)
c0002290:	c7 85 48 ff ff ff 00 	movl   $0x0,-0xb8(%ebp)
c0002297:	00 00 00 
c000229a:	83 ec 04             	sub    $0x4,%esp
c000229d:	6a 02                	push   $0x2
c000229f:	8d 85 40 ff ff ff    	lea    -0xc0(%ebp),%eax
c00022a5:	50                   	push   %eax
c00022a6:	6a 01                	push   $0x1
c00022a8:	e8 2b 7d 00 00       	call   c0009fd8 <send_rec>
c00022ad:	83 c4 10             	add    $0x10,%esp
c00022b0:	90                   	nop
c00022b1:	c9                   	leave  
c00022b2:	c3                   	ret    

c00022b3 <hd_handler>:
c00022b3:	55                   	push   %ebp
c00022b4:	89 e5                	mov    %esp,%ebp
c00022b6:	83 ec 18             	sub    $0x18,%esp
c00022b9:	83 ec 0c             	sub    $0xc,%esp
c00022bc:	68 f7 01 00 00       	push   $0x1f7
c00022c1:	e8 c7 ef ff ff       	call   c000128d <in_byte>
c00022c6:	83 c4 10             	add    $0x10,%esp
c00022c9:	0f b6 c0             	movzbl %al,%eax
c00022cc:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00022cf:	83 ec 0c             	sub    $0xc,%esp
c00022d2:	6a 03                	push   $0x3
c00022d4:	e8 9a 7f 00 00       	call   c000a273 <inform_int>
c00022d9:	83 c4 10             	add    $0x10,%esp
c00022dc:	90                   	nop
c00022dd:	c9                   	leave  
c00022de:	c3                   	ret    

c00022df <waitfor>:
c00022df:	55                   	push   %ebp
c00022e0:	89 e5                	mov    %esp,%ebp
c00022e2:	83 ec 18             	sub    $0x18,%esp
c00022e5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00022ec:	eb 26                	jmp    c0002314 <waitfor+0x35>
c00022ee:	83 ec 0c             	sub    $0xc,%esp
c00022f1:	68 f7 01 00 00       	push   $0x1f7
c00022f6:	e8 92 ef ff ff       	call   c000128d <in_byte>
c00022fb:	83 c4 10             	add    $0x10,%esp
c00022fe:	0f b6 c0             	movzbl %al,%eax
c0002301:	23 45 08             	and    0x8(%ebp),%eax
c0002304:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0002307:	75 07                	jne    c0002310 <waitfor+0x31>
c0002309:	b8 01 00 00 00       	mov    $0x1,%eax
c000230e:	eb 11                	jmp    c0002321 <waitfor+0x42>
c0002310:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0002314:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002317:	3b 45 10             	cmp    0x10(%ebp),%eax
c000231a:	7c d2                	jl     c00022ee <waitfor+0xf>
c000231c:	b8 00 00 00 00       	mov    $0x0,%eax
c0002321:	c9                   	leave  
c0002322:	c3                   	ret    

c0002323 <print_hd_info>:
c0002323:	55                   	push   %ebp
c0002324:	89 e5                	mov    %esp,%ebp
c0002326:	83 ec 18             	sub    $0x18,%esp
c0002329:	83 ec 0c             	sub    $0xc,%esp
c000232c:	68 98 b1 00 c0       	push   $0xc000b198
c0002331:	e8 08 70 00 00       	call   c000933e <Printf>
c0002336:	83 c4 10             	add    $0x10,%esp
c0002339:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0002340:	eb 3b                	jmp    c000237d <print_hd_info+0x5a>
c0002342:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002345:	8b 04 c5 48 1f 01 c0 	mov    -0x3ffee0b8(,%eax,8),%eax
c000234c:	85 c0                	test   %eax,%eax
c000234e:	74 28                	je     c0002378 <print_hd_info+0x55>
c0002350:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002353:	8b 14 c5 48 1f 01 c0 	mov    -0x3ffee0b8(,%eax,8),%edx
c000235a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000235d:	8b 04 c5 44 1f 01 c0 	mov    -0x3ffee0bc(,%eax,8),%eax
c0002364:	ff 75 f4             	pushl  -0xc(%ebp)
c0002367:	52                   	push   %edx
c0002368:	50                   	push   %eax
c0002369:	68 b5 b1 00 c0       	push   $0xc000b1b5
c000236e:	e8 cb 6f 00 00       	call   c000933e <Printf>
c0002373:	83 c4 10             	add    $0x10,%esp
c0002376:	eb 01                	jmp    c0002379 <print_hd_info+0x56>
c0002378:	90                   	nop
c0002379:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000237d:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c0002381:	7e bf                	jle    c0002342 <print_hd_info+0x1f>
c0002383:	83 ec 0c             	sub    $0xc,%esp
c0002386:	68 cd b1 00 c0       	push   $0xc000b1cd
c000238b:	e8 ae 6f 00 00       	call   c000933e <Printf>
c0002390:	83 c4 10             	add    $0x10,%esp
c0002393:	83 ec 0c             	sub    $0xc,%esp
c0002396:	68 e8 b1 00 c0       	push   $0xc000b1e8
c000239b:	e8 9e 6f 00 00       	call   c000933e <Printf>
c00023a0:	83 c4 10             	add    $0x10,%esp
c00023a3:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%ebp)
c00023aa:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00023b1:	eb 44                	jmp    c00023f7 <print_hd_info+0xd4>
c00023b3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00023b6:	83 c0 04             	add    $0x4,%eax
c00023b9:	8b 04 c5 48 1f 01 c0 	mov    -0x3ffee0b8(,%eax,8),%eax
c00023c0:	85 c0                	test   %eax,%eax
c00023c2:	74 2e                	je     c00023f2 <print_hd_info+0xcf>
c00023c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00023c7:	83 c0 04             	add    $0x4,%eax
c00023ca:	8b 14 c5 48 1f 01 c0 	mov    -0x3ffee0b8(,%eax,8),%edx
c00023d1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00023d4:	83 c0 04             	add    $0x4,%eax
c00023d7:	8b 04 c5 44 1f 01 c0 	mov    -0x3ffee0bc(,%eax,8),%eax
c00023de:	ff 75 f0             	pushl  -0x10(%ebp)
c00023e1:	52                   	push   %edx
c00023e2:	50                   	push   %eax
c00023e3:	68 b5 b1 00 c0       	push   $0xc000b1b5
c00023e8:	e8 51 6f 00 00       	call   c000933e <Printf>
c00023ed:	83 c4 10             	add    $0x10,%esp
c00023f0:	eb 01                	jmp    c00023f3 <print_hd_info+0xd0>
c00023f2:	90                   	nop
c00023f3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00023f7:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c00023fb:	7e b6                	jle    c00023b3 <print_hd_info+0x90>
c00023fd:	83 ec 0c             	sub    $0xc,%esp
c0002400:	68 05 b2 00 c0       	push   $0xc000b205
c0002405:	e8 34 6f 00 00       	call   c000933e <Printf>
c000240a:	83 c4 10             	add    $0x10,%esp
c000240d:	90                   	nop
c000240e:	c9                   	leave  
c000240f:	c3                   	ret    

c0002410 <is_empty>:
c0002410:	55                   	push   %ebp
c0002411:	89 e5                	mov    %esp,%ebp
c0002413:	83 ec 10             	sub    $0x10,%esp
c0002416:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c000241d:	eb 1a                	jmp    c0002439 <is_empty+0x29>
c000241f:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0002422:	8b 45 08             	mov    0x8(%ebp),%eax
c0002425:	01 d0                	add    %edx,%eax
c0002427:	0f b6 00             	movzbl (%eax),%eax
c000242a:	84 c0                	test   %al,%al
c000242c:	74 07                	je     c0002435 <is_empty+0x25>
c000242e:	b8 00 00 00 00       	mov    $0x0,%eax
c0002433:	eb 11                	jmp    c0002446 <is_empty+0x36>
c0002435:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0002439:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000243c:	3b 45 0c             	cmp    0xc(%ebp),%eax
c000243f:	7c de                	jl     c000241f <is_empty+0xf>
c0002441:	b8 01 00 00 00       	mov    $0x1,%eax
c0002446:	c9                   	leave  
c0002447:	c3                   	ret    
c0002448:	66 90                	xchg   %ax,%ax
c000244a:	66 90                	xchg   %ax,%ax
c000244c:	66 90                	xchg   %ax,%ax
c000244e:	66 90                	xchg   %ax,%ax

c0002450 <get_ticks>:
c0002450:	b8 00 00 00 00       	mov    $0x0,%eax
c0002455:	cd 90                	int    $0x90
c0002457:	c3                   	ret    

c0002458 <write2>:
c0002458:	b8 01 00 00 00       	mov    $0x1,%eax
c000245d:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0002461:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c0002465:	cd 90                	int    $0x90
c0002467:	c3                   	ret    

c0002468 <write_debug>:
c0002468:	b8 02 00 00 00       	mov    $0x2,%eax
c000246d:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0002471:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c0002475:	cd 90                	int    $0x90
c0002477:	c3                   	ret    

c0002478 <send_msg2>:
c0002478:	b8 03 00 00 00       	mov    $0x3,%eax
c000247d:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0002481:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c0002485:	cd 90                	int    $0x90
c0002487:	c3                   	ret    

c0002488 <send_msg>:
c0002488:	55                   	push   %ebp
c0002489:	89 e5                	mov    %esp,%ebp
c000248b:	53                   	push   %ebx
c000248c:	51                   	push   %ecx
c000248d:	b8 03 00 00 00       	mov    $0x3,%eax
c0002492:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c0002495:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0002498:	cd 90                	int    $0x90
c000249a:	59                   	pop    %ecx
c000249b:	5b                   	pop    %ebx
c000249c:	5d                   	pop    %ebp
c000249d:	c3                   	ret    

c000249e <receive_msg2>:
c000249e:	b8 04 00 00 00       	mov    $0x4,%eax
c00024a3:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c00024a7:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c00024ab:	cd 90                	int    $0x90
c00024ad:	c3                   	ret    

c00024ae <receive_msg>:
c00024ae:	55                   	push   %ebp
c00024af:	89 e5                	mov    %esp,%ebp
c00024b1:	53                   	push   %ebx
c00024b2:	51                   	push   %ecx
c00024b3:	b8 04 00 00 00       	mov    $0x4,%eax
c00024b8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c00024bb:	8b 4d 08             	mov    0x8(%ebp),%ecx
c00024be:	cd 90                	int    $0x90
c00024c0:	59                   	pop    %ecx
c00024c1:	5b                   	pop    %ebx
c00024c2:	5d                   	pop    %ebp
c00024c3:	c3                   	ret    

c00024c4 <sys_malloc>:
c00024c4:	56                   	push   %esi
c00024c5:	57                   	push   %edi
c00024c6:	53                   	push   %ebx
c00024c7:	55                   	push   %ebp
c00024c8:	89 e5                	mov    %esp,%ebp
c00024ca:	b8 05 00 00 00       	mov    $0x5,%eax
c00024cf:	8b 4d 14             	mov    0x14(%ebp),%ecx
c00024d2:	cd 90                	int    $0x90
c00024d4:	5d                   	pop    %ebp
c00024d5:	5b                   	pop    %ebx
c00024d6:	5f                   	pop    %edi
c00024d7:	5e                   	pop    %esi
c00024d8:	c3                   	ret    

c00024d9 <sys_free>:
c00024d9:	56                   	push   %esi
c00024da:	57                   	push   %edi
c00024db:	53                   	push   %ebx
c00024dc:	55                   	push   %ebp
c00024dd:	89 e5                	mov    %esp,%ebp
c00024df:	b8 06 00 00 00       	mov    $0x6,%eax
c00024e4:	8b 4d 14             	mov    0x14(%ebp),%ecx
c00024e7:	8b 5d 18             	mov    0x18(%ebp),%ebx
c00024ea:	cd 90                	int    $0x90
c00024ec:	5d                   	pop    %ebp
c00024ed:	5b                   	pop    %ebx
c00024ee:	5f                   	pop    %edi
c00024ef:	5e                   	pop    %esi
c00024f0:	c3                   	ret    

c00024f1 <task_fs>:
c00024f1:	55                   	push   %ebp
c00024f2:	89 e5                	mov    %esp,%ebp
c00024f4:	83 ec 28             	sub    $0x28,%esp
c00024f7:	e8 bb 08 00 00       	call   c0002db7 <init_fs>
c00024fc:	83 ec 0c             	sub    $0xc,%esp
c00024ff:	6a 7c                	push   $0x7c
c0002501:	e8 be ff ff ff       	call   c00024c4 <sys_malloc>
c0002506:	83 c4 10             	add    $0x10,%esp
c0002509:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000250c:	83 ec 0c             	sub    $0xc,%esp
c000250f:	6a 7c                	push   $0x7c
c0002511:	e8 ae ff ff ff       	call   c00024c4 <sys_malloc>
c0002516:	83 c4 10             	add    $0x10,%esp
c0002519:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000251c:	83 ec 04             	sub    $0x4,%esp
c000251f:	6a 7c                	push   $0x7c
c0002521:	6a 00                	push   $0x0
c0002523:	ff 75 f4             	pushl  -0xc(%ebp)
c0002526:	e8 14 99 00 00       	call   c000be3f <Memset>
c000252b:	83 c4 10             	add    $0x10,%esp
c000252e:	83 ec 04             	sub    $0x4,%esp
c0002531:	6a 12                	push   $0x12
c0002533:	ff 75 f4             	pushl  -0xc(%ebp)
c0002536:	6a 02                	push   $0x2
c0002538:	e8 9b 7a 00 00       	call   c0009fd8 <send_rec>
c000253d:	83 c4 10             	add    $0x10,%esp
c0002540:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002543:	8b 40 78             	mov    0x78(%eax),%eax
c0002546:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0002549:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000254c:	8b 00                	mov    (%eax),%eax
c000254e:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0002551:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002554:	8b 40 50             	mov    0x50(%eax),%eax
c0002557:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000255a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000255d:	8b 40 68             	mov    0x68(%eax),%eax
c0002560:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0002563:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002566:	8b 00                	mov    (%eax),%eax
c0002568:	85 c0                	test   %eax,%eax
c000256a:	75 07                	jne    c0002573 <task_fs+0x82>
c000256c:	c7 45 dc 05 00 00 00 	movl   $0x5,-0x24(%ebp)
c0002573:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c000257a:	83 ec 0c             	sub    $0xc,%esp
c000257d:	ff 75 e8             	pushl  -0x18(%ebp)
c0002580:	e8 37 21 00 00       	call   c00046bc <pid2proc>
c0002585:	83 c4 10             	add    $0x10,%esp
c0002588:	a3 c8 0b 01 c0       	mov    %eax,0xc0010bc8
c000258d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0002591:	74 37                	je     c00025ca <task_fs+0xd9>
c0002593:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
c0002597:	74 31                	je     c00025ca <task_fs+0xd9>
c0002599:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c000259d:	74 2b                	je     c00025ca <task_fs+0xd9>
c000259f:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
c00025a3:	74 25                	je     c00025ca <task_fs+0xd9>
c00025a5:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
c00025a9:	74 1f                	je     c00025ca <task_fs+0xd9>
c00025ab:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
c00025af:	74 19                	je     c00025ca <task_fs+0xd9>
c00025b1:	6a 7a                	push   $0x7a
c00025b3:	68 24 b2 00 c0       	push   $0xc000b224
c00025b8:	68 24 b2 00 c0       	push   $0xc000b224
c00025bd:	68 34 b2 00 c0       	push   $0xc000b234
c00025c2:	e8 d4 70 00 00       	call   c000969b <assertion_failure>
c00025c7:	83 c4 10             	add    $0x10,%esp
c00025ca:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c00025ce:	74 3a                	je     c000260a <task_fs+0x119>
c00025d0:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c00025d4:	7f 19                	jg     c00025ef <task_fs+0xfe>
c00025d6:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c00025da:	0f 84 10 01 00 00    	je     c00026f0 <task_fs+0x1ff>
c00025e0:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
c00025e4:	0f 84 a1 00 00 00    	je     c000268b <task_fs+0x19a>
c00025ea:	e9 ef 00 00 00       	jmp    c00026de <task_fs+0x1ed>
c00025ef:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
c00025f3:	74 50                	je     c0002645 <task_fs+0x154>
c00025f5:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
c00025f9:	0f 84 c6 00 00 00    	je     c00026c5 <task_fs+0x1d4>
c00025ff:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
c0002603:	74 40                	je     c0002645 <task_fs+0x154>
c0002605:	e9 d4 00 00 00       	jmp    c00026de <task_fs+0x1ed>
c000260a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000260d:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0002614:	83 ec 0c             	sub    $0xc,%esp
c0002617:	ff 75 f4             	pushl  -0xc(%ebp)
c000261a:	e8 ec 07 00 00       	call   c0002e0b <do_open>
c000261f:	83 c4 10             	add    $0x10,%esp
c0002622:	89 c2                	mov    %eax,%edx
c0002624:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002627:	89 50 50             	mov    %edx,0x50(%eax)
c000262a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000262d:	8b 00                	mov    (%eax),%eax
c000262f:	83 ec 04             	sub    $0x4,%esp
c0002632:	50                   	push   %eax
c0002633:	ff 75 f4             	pushl  -0xc(%ebp)
c0002636:	6a 01                	push   $0x1
c0002638:	e8 9b 79 00 00       	call   c0009fd8 <send_rec>
c000263d:	83 c4 10             	add    $0x10,%esp
c0002640:	e9 b2 00 00 00       	jmp    c00026f7 <task_fs+0x206>
c0002645:	83 ec 0c             	sub    $0xc,%esp
c0002648:	ff 75 f4             	pushl  -0xc(%ebp)
c000264b:	e8 f9 18 00 00       	call   c0003f49 <do_rdwt>
c0002650:	83 c4 10             	add    $0x10,%esp
c0002653:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0002656:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
c000265a:	0f 84 96 00 00 00    	je     c00026f6 <task_fs+0x205>
c0002660:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002663:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c000266a:	8b 55 d8             	mov    -0x28(%ebp),%edx
c000266d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002670:	89 50 60             	mov    %edx,0x60(%eax)
c0002673:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002676:	8b 00                	mov    (%eax),%eax
c0002678:	83 ec 04             	sub    $0x4,%esp
c000267b:	50                   	push   %eax
c000267c:	ff 75 f4             	pushl  -0xc(%ebp)
c000267f:	6a 01                	push   $0x1
c0002681:	e8 52 79 00 00       	call   c0009fd8 <send_rec>
c0002686:	83 c4 10             	add    $0x10,%esp
c0002689:	eb 6b                	jmp    c00026f6 <task_fs+0x205>
c000268b:	83 ec 0c             	sub    $0xc,%esp
c000268e:	ff 75 e4             	pushl  -0x1c(%ebp)
c0002691:	e8 d0 1d 00 00       	call   c0004466 <do_close>
c0002696:	83 c4 10             	add    $0x10,%esp
c0002699:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000269c:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c00026a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00026a6:	c7 40 58 00 00 00 00 	movl   $0x0,0x58(%eax)
c00026ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00026b0:	8b 00                	mov    (%eax),%eax
c00026b2:	83 ec 04             	sub    $0x4,%esp
c00026b5:	50                   	push   %eax
c00026b6:	ff 75 f4             	pushl  -0xc(%ebp)
c00026b9:	6a 01                	push   $0x1
c00026bb:	e8 18 79 00 00       	call   c0009fd8 <send_rec>
c00026c0:	83 c4 10             	add    $0x10,%esp
c00026c3:	eb 32                	jmp    c00026f7 <task_fs+0x206>
c00026c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00026c8:	8b 40 68             	mov    0x68(%eax),%eax
c00026cb:	83 ec 04             	sub    $0x4,%esp
c00026ce:	50                   	push   %eax
c00026cf:	ff 75 f4             	pushl  -0xc(%ebp)
c00026d2:	6a 01                	push   $0x1
c00026d4:	e8 ff 78 00 00       	call   c0009fd8 <send_rec>
c00026d9:	83 c4 10             	add    $0x10,%esp
c00026dc:	eb 19                	jmp    c00026f7 <task_fs+0x206>
c00026de:	83 ec 0c             	sub    $0xc,%esp
c00026e1:	68 97 b2 00 c0       	push   $0xc000b297
c00026e6:	e8 92 6f 00 00       	call   c000967d <panic>
c00026eb:	83 c4 10             	add    $0x10,%esp
c00026ee:	eb 07                	jmp    c00026f7 <task_fs+0x206>
c00026f0:	90                   	nop
c00026f1:	e9 26 fe ff ff       	jmp    c000251c <task_fs+0x2b>
c00026f6:	90                   	nop
c00026f7:	e9 20 fe ff ff       	jmp    c000251c <task_fs+0x2b>

c00026fc <rd_wt>:
c00026fc:	55                   	push   %ebp
c00026fd:	89 e5                	mov    %esp,%ebp
c00026ff:	83 ec 18             	sub    $0x18,%esp
c0002702:	83 ec 0c             	sub    $0xc,%esp
c0002705:	6a 7c                	push   $0x7c
c0002707:	e8 b8 fd ff ff       	call   c00024c4 <sys_malloc>
c000270c:	83 c4 10             	add    $0x10,%esp
c000270f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0002712:	83 ec 04             	sub    $0x4,%esp
c0002715:	6a 7c                	push   $0x7c
c0002717:	6a 00                	push   $0x0
c0002719:	ff 75 f4             	pushl  -0xc(%ebp)
c000271c:	e8 1e 97 00 00       	call   c000be3f <Memset>
c0002721:	83 c4 10             	add    $0x10,%esp
c0002724:	8b 55 18             	mov    0x18(%ebp),%edx
c0002727:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000272a:	89 50 78             	mov    %edx,0x78(%eax)
c000272d:	8b 55 0c             	mov    0xc(%ebp),%edx
c0002730:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002733:	89 50 14             	mov    %edx,0x14(%eax)
c0002736:	8b 55 10             	mov    0x10(%ebp),%edx
c0002739:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000273c:	89 50 10             	mov    %edx,0x10(%eax)
c000273f:	8b 55 14             	mov    0x14(%ebp),%edx
c0002742:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002745:	89 50 0c             	mov    %edx,0xc(%eax)
c0002748:	8b 45 08             	mov    0x8(%ebp),%eax
c000274b:	c1 e0 09             	shl    $0x9,%eax
c000274e:	89 c2                	mov    %eax,%edx
c0002750:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002753:	89 50 18             	mov    %edx,0x18(%eax)
c0002756:	83 7d 18 07          	cmpl   $0x7,0x18(%ebp)
c000275a:	74 22                	je     c000277e <rd_wt+0x82>
c000275c:	83 7d 18 0a          	cmpl   $0xa,0x18(%ebp)
c0002760:	74 1c                	je     c000277e <rd_wt+0x82>
c0002762:	68 b1 00 00 00       	push   $0xb1
c0002767:	68 24 b2 00 c0       	push   $0xc000b224
c000276c:	68 24 b2 00 c0       	push   $0xc000b224
c0002771:	68 aa b2 00 c0       	push   $0xc000b2aa
c0002776:	e8 20 6f 00 00       	call   c000969b <assertion_failure>
c000277b:	83 c4 10             	add    $0x10,%esp
c000277e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002781:	8b 40 78             	mov    0x78(%eax),%eax
c0002784:	83 f8 07             	cmp    $0x7,%eax
c0002787:	74 27                	je     c00027b0 <rd_wt+0xb4>
c0002789:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000278c:	8b 40 78             	mov    0x78(%eax),%eax
c000278f:	83 f8 0a             	cmp    $0xa,%eax
c0002792:	74 1c                	je     c00027b0 <rd_wt+0xb4>
c0002794:	68 b2 00 00 00       	push   $0xb2
c0002799:	68 24 b2 00 c0       	push   $0xc000b224
c000279e:	68 24 b2 00 c0       	push   $0xc000b224
c00027a3:	68 c8 b2 00 c0       	push   $0xc000b2c8
c00027a8:	e8 ee 6e 00 00       	call   c000969b <assertion_failure>
c00027ad:	83 c4 10             	add    $0x10,%esp
c00027b0:	83 ec 04             	sub    $0x4,%esp
c00027b3:	6a 03                	push   $0x3
c00027b5:	ff 75 f4             	pushl  -0xc(%ebp)
c00027b8:	6a 03                	push   $0x3
c00027ba:	e8 19 78 00 00       	call   c0009fd8 <send_rec>
c00027bf:	83 c4 10             	add    $0x10,%esp
c00027c2:	83 ec 08             	sub    $0x8,%esp
c00027c5:	6a 7c                	push   $0x7c
c00027c7:	ff 75 f4             	pushl  -0xc(%ebp)
c00027ca:	e8 0a fd ff ff       	call   c00024d9 <sys_free>
c00027cf:	83 c4 10             	add    $0x10,%esp
c00027d2:	90                   	nop
c00027d3:	c9                   	leave  
c00027d4:	c3                   	ret    

c00027d5 <mkfs>:
c00027d5:	55                   	push   %ebp
c00027d6:	89 e5                	mov    %esp,%ebp
c00027d8:	57                   	push   %edi
c00027d9:	81 ec d4 00 00 00    	sub    $0xd4,%esp
c00027df:	83 ec 0c             	sub    $0xc,%esp
c00027e2:	68 00 80 00 00       	push   $0x8000
c00027e7:	e8 d8 fc ff ff       	call   c00024c4 <sys_malloc>
c00027ec:	83 c4 10             	add    $0x10,%esp
c00027ef:	a3 a4 31 01 c0       	mov    %eax,0xc00131a4
c00027f4:	83 ec 0c             	sub    $0xc,%esp
c00027f7:	6a 24                	push   $0x24
c00027f9:	e8 c6 fc ff ff       	call   c00024c4 <sys_malloc>
c00027fe:	83 c4 10             	add    $0x10,%esp
c0002801:	a3 a0 31 01 c0       	mov    %eax,0xc00131a0
c0002806:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c000280b:	83 ec 0c             	sub    $0xc,%esp
c000280e:	50                   	push   %eax
c000280f:	e8 50 46 00 00       	call   c0006e64 <get_physical_address>
c0002814:	83 c4 10             	add    $0x10,%esp
c0002817:	a3 84 27 01 c0       	mov    %eax,0xc0012784
c000281c:	a1 a0 31 01 c0       	mov    0xc00131a0,%eax
c0002821:	83 ec 0c             	sub    $0xc,%esp
c0002824:	50                   	push   %eax
c0002825:	e8 3a 46 00 00       	call   c0006e64 <get_physical_address>
c000282a:	83 c4 10             	add    $0x10,%esp
c000282d:	a3 80 27 01 c0       	mov    %eax,0xc0012780
c0002832:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002837:	83 ec 04             	sub    $0x4,%esp
c000283a:	68 00 02 00 00       	push   $0x200
c000283f:	6a 00                	push   $0x0
c0002841:	50                   	push   %eax
c0002842:	e8 f8 95 00 00       	call   c000be3f <Memset>
c0002847:	83 c4 10             	add    $0x10,%esp
c000284a:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c000284f:	83 ec 0c             	sub    $0xc,%esp
c0002852:	6a 0a                	push   $0xa
c0002854:	68 00 02 00 00       	push   $0x200
c0002859:	50                   	push   %eax
c000285a:	6a 20                	push   $0x20
c000285c:	6a 00                	push   $0x0
c000285e:	e8 99 fe ff ff       	call   c00026fc <rd_wt>
c0002863:	83 c4 20             	add    $0x20,%esp
c0002866:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c000286b:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000286e:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002871:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c0002878:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000287b:	c7 40 10 00 08 00 00 	movl   $0x800,0x10(%eax)
c0002882:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002885:	c7 40 08 00 08 00 00 	movl   $0x800,0x8(%eax)
c000288c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000288f:	c7 40 0c 00 01 00 00 	movl   $0x100,0xc(%eax)
c0002896:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002899:	8b 40 04             	mov    0x4(%eax),%eax
c000289c:	8d 50 02             	lea    0x2(%eax),%edx
c000289f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00028a2:	8b 40 08             	mov    0x8(%eax),%eax
c00028a5:	01 c2                	add    %eax,%edx
c00028a7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00028aa:	8b 40 0c             	mov    0xc(%eax),%eax
c00028ad:	01 c2                	add    %eax,%edx
c00028af:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00028b2:	89 10                	mov    %edx,(%eax)
c00028b4:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c00028bb:	b8 00 02 00 00       	mov    $0x200,%eax
c00028c0:	2b 45 d8             	sub    -0x28(%ebp),%eax
c00028c3:	8b 0d a4 31 01 c0    	mov    0xc00131a4,%ecx
c00028c9:	8b 55 d8             	mov    -0x28(%ebp),%edx
c00028cc:	01 ca                	add    %ecx,%edx
c00028ce:	83 ec 04             	sub    $0x4,%esp
c00028d1:	50                   	push   %eax
c00028d2:	6a 80                	push   $0xffffff80
c00028d4:	52                   	push   %edx
c00028d5:	e8 65 95 00 00       	call   c000be3f <Memset>
c00028da:	83 c4 10             	add    $0x10,%esp
c00028dd:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00028e2:	83 ec 0c             	sub    $0xc,%esp
c00028e5:	6a 0a                	push   $0xa
c00028e7:	68 00 02 00 00       	push   $0x200
c00028ec:	50                   	push   %eax
c00028ed:	6a 20                	push   $0x20
c00028ef:	6a 01                	push   $0x1
c00028f1:	e8 06 fe ff ff       	call   c00026fc <rd_wt>
c00028f6:	83 c4 20             	add    $0x20,%esp
c00028f9:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00028fc:	8b 10                	mov    (%eax),%edx
c00028fe:	89 55 98             	mov    %edx,-0x68(%ebp)
c0002901:	8b 50 04             	mov    0x4(%eax),%edx
c0002904:	89 55 9c             	mov    %edx,-0x64(%ebp)
c0002907:	8b 50 08             	mov    0x8(%eax),%edx
c000290a:	89 55 a0             	mov    %edx,-0x60(%ebp)
c000290d:	8b 50 0c             	mov    0xc(%eax),%edx
c0002910:	89 55 a4             	mov    %edx,-0x5c(%ebp)
c0002913:	8b 50 10             	mov    0x10(%eax),%edx
c0002916:	89 55 a8             	mov    %edx,-0x58(%ebp)
c0002919:	8b 50 14             	mov    0x14(%eax),%edx
c000291c:	89 55 ac             	mov    %edx,-0x54(%ebp)
c000291f:	8b 50 18             	mov    0x18(%eax),%edx
c0002922:	89 55 b0             	mov    %edx,-0x50(%ebp)
c0002925:	8b 50 1c             	mov    0x1c(%eax),%edx
c0002928:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c000292b:	8b 40 20             	mov    0x20(%eax),%eax
c000292e:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0002931:	c6 45 d7 3f          	movb   $0x3f,-0x29(%ebp)
c0002935:	0f be 55 d7          	movsbl -0x29(%ebp),%edx
c0002939:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c000293e:	83 ec 04             	sub    $0x4,%esp
c0002941:	6a 01                	push   $0x1
c0002943:	52                   	push   %edx
c0002944:	50                   	push   %eax
c0002945:	e8 f5 94 00 00       	call   c000be3f <Memset>
c000294a:	83 c4 10             	add    $0x10,%esp
c000294d:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002952:	83 c0 01             	add    $0x1,%eax
c0002955:	83 ec 04             	sub    $0x4,%esp
c0002958:	68 ff 01 00 00       	push   $0x1ff
c000295d:	6a 80                	push   $0xffffff80
c000295f:	50                   	push   %eax
c0002960:	e8 da 94 00 00       	call   c000be3f <Memset>
c0002965:	83 c4 10             	add    $0x10,%esp
c0002968:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c000296d:	83 ec 0c             	sub    $0xc,%esp
c0002970:	6a 0a                	push   $0xa
c0002972:	68 00 02 00 00       	push   $0x200
c0002977:	50                   	push   %eax
c0002978:	6a 20                	push   $0x20
c000297a:	6a 02                	push   $0x2
c000297c:	e8 7b fd ff ff       	call   c00026fc <rd_wt>
c0002981:	83 c4 20             	add    $0x20,%esp
c0002984:	c7 45 d0 03 00 00 00 	movl   $0x3,-0x30(%ebp)
c000298b:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002990:	83 ec 04             	sub    $0x4,%esp
c0002993:	68 00 02 00 00       	push   $0x200
c0002998:	6a ff                	push   $0xffffffff
c000299a:	50                   	push   %eax
c000299b:	e8 9f 94 00 00       	call   c000be3f <Memset>
c00029a0:	83 c4 10             	add    $0x10,%esp
c00029a3:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00029a8:	83 ec 0c             	sub    $0xc,%esp
c00029ab:	6a 0a                	push   $0xa
c00029ad:	68 00 02 00 00       	push   $0x200
c00029b2:	50                   	push   %eax
c00029b3:	6a 20                	push   $0x20
c00029b5:	ff 75 d0             	pushl  -0x30(%ebp)
c00029b8:	e8 3f fd ff ff       	call   c00026fc <rd_wt>
c00029bd:	83 c4 20             	add    $0x20,%esp
c00029c0:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c00029c5:	83 ec 04             	sub    $0x4,%esp
c00029c8:	6a 01                	push   $0x1
c00029ca:	6a 01                	push   $0x1
c00029cc:	50                   	push   %eax
c00029cd:	e8 6d 94 00 00       	call   c000be3f <Memset>
c00029d2:	83 c4 10             	add    $0x10,%esp
c00029d5:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c00029da:	83 c0 01             	add    $0x1,%eax
c00029dd:	83 ec 04             	sub    $0x4,%esp
c00029e0:	68 ff 01 00 00       	push   $0x1ff
c00029e5:	6a 00                	push   $0x0
c00029e7:	50                   	push   %eax
c00029e8:	e8 52 94 00 00       	call   c000be3f <Memset>
c00029ed:	83 c4 10             	add    $0x10,%esp
c00029f0:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00029f5:	89 c2                	mov    %eax,%edx
c00029f7:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00029fa:	83 c0 01             	add    $0x1,%eax
c00029fd:	83 ec 0c             	sub    $0xc,%esp
c0002a00:	6a 0a                	push   $0xa
c0002a02:	68 00 02 00 00       	push   $0x200
c0002a07:	52                   	push   %edx
c0002a08:	6a 20                	push   $0x20
c0002a0a:	50                   	push   %eax
c0002a0b:	e8 ec fc ff ff       	call   c00026fc <rd_wt>
c0002a10:	83 c4 20             	add    $0x20,%esp
c0002a13:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002a16:	83 e8 02             	sub    $0x2,%eax
c0002a19:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0002a1c:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0002a23:	eb 04                	jmp    c0002a29 <mkfs+0x254>
c0002a25:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0002a29:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0002a2c:	83 c0 01             	add    $0x1,%eax
c0002a2f:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0002a32:	7e f1                	jle    c0002a25 <mkfs+0x250>
c0002a34:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002a39:	89 c2                	mov    %eax,%edx
c0002a3b:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002a3e:	83 c0 03             	add    $0x3,%eax
c0002a41:	83 ec 0c             	sub    $0xc,%esp
c0002a44:	6a 0a                	push   $0xa
c0002a46:	68 00 02 00 00       	push   $0x200
c0002a4b:	52                   	push   %edx
c0002a4c:	6a 20                	push   $0x20
c0002a4e:	50                   	push   %eax
c0002a4f:	e8 a8 fc ff ff       	call   c00026fc <rd_wt>
c0002a54:	83 c4 20             	add    $0x20,%esp
c0002a57:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002a5c:	89 c2                	mov    %eax,%edx
c0002a5e:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002a61:	83 c0 03             	add    $0x3,%eax
c0002a64:	83 ec 0c             	sub    $0xc,%esp
c0002a67:	6a 07                	push   $0x7
c0002a69:	68 00 02 00 00       	push   $0x200
c0002a6e:	52                   	push   %edx
c0002a6f:	6a 20                	push   $0x20
c0002a71:	50                   	push   %eax
c0002a72:	e8 85 fc ff ff       	call   c00026fc <rd_wt>
c0002a77:	83 c4 20             	add    $0x20,%esp
c0002a7a:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002a7f:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0002a82:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002a85:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0002a8b:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002a8e:	c7 40 04 50 00 00 00 	movl   $0x50,0x4(%eax)
c0002a95:	8b 55 98             	mov    -0x68(%ebp),%edx
c0002a98:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002a9b:	89 50 08             	mov    %edx,0x8(%eax)
c0002a9e:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002aa1:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0002aa8:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002aab:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c0002ab2:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002ab5:	8b 10                	mov    (%eax),%edx
c0002ab7:	89 15 c0 31 01 c0    	mov    %edx,0xc00131c0
c0002abd:	8b 50 04             	mov    0x4(%eax),%edx
c0002ac0:	89 15 c4 31 01 c0    	mov    %edx,0xc00131c4
c0002ac6:	8b 50 08             	mov    0x8(%eax),%edx
c0002ac9:	89 15 c8 31 01 c0    	mov    %edx,0xc00131c8
c0002acf:	8b 50 0c             	mov    0xc(%eax),%edx
c0002ad2:	89 15 cc 31 01 c0    	mov    %edx,0xc00131cc
c0002ad8:	8b 50 10             	mov    0x10(%eax),%edx
c0002adb:	89 15 d0 31 01 c0    	mov    %edx,0xc00131d0
c0002ae1:	8b 50 14             	mov    0x14(%eax),%edx
c0002ae4:	89 15 d4 31 01 c0    	mov    %edx,0xc00131d4
c0002aea:	8b 50 18             	mov    0x18(%eax),%edx
c0002aed:	89 15 d8 31 01 c0    	mov    %edx,0xc00131d8
c0002af3:	8b 50 1c             	mov    0x1c(%eax),%edx
c0002af6:	89 15 dc 31 01 c0    	mov    %edx,0xc00131dc
c0002afc:	8b 50 20             	mov    0x20(%eax),%edx
c0002aff:	89 15 e0 31 01 c0    	mov    %edx,0xc00131e0
c0002b05:	8b 40 24             	mov    0x24(%eax),%eax
c0002b08:	a3 e4 31 01 c0       	mov    %eax,0xc00131e4
c0002b0d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0002b14:	eb 4c                	jmp    c0002b62 <mkfs+0x38d>
c0002b16:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002b1b:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0002b1e:	83 c2 01             	add    $0x1,%edx
c0002b21:	c1 e2 05             	shl    $0x5,%edx
c0002b24:	01 d0                	add    %edx,%eax
c0002b26:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0002b29:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002b2c:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0002b32:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002b35:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0002b3c:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002b3f:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c0002b46:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
c0002b4d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0002b50:	c1 e0 08             	shl    $0x8,%eax
c0002b53:	0b 45 f0             	or     -0x10(%ebp),%eax
c0002b56:	89 c2                	mov    %eax,%edx
c0002b58:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002b5b:	89 50 08             	mov    %edx,0x8(%eax)
c0002b5e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0002b62:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
c0002b66:	7e ae                	jle    c0002b16 <mkfs+0x341>
c0002b68:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
c0002b6f:	8d 95 70 ff ff ff    	lea    -0x90(%ebp),%edx
c0002b75:	b8 00 00 00 00       	mov    $0x0,%eax
c0002b7a:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0002b7f:	89 d7                	mov    %edx,%edi
c0002b81:	f3 ab                	rep stos %eax,%es:(%edi)
c0002b83:	c7 85 70 ff ff ff f0 	movl   $0xc000b2f0,-0x90(%ebp)
c0002b8a:	b2 00 c0 
c0002b8d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0002b94:	eb 54                	jmp    c0002bea <mkfs+0x415>
c0002b96:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002b9b:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0002b9e:	83 c2 04             	add    $0x4,%edx
c0002ba1:	c1 e2 05             	shl    $0x5,%edx
c0002ba4:	01 d0                	add    %edx,%eax
c0002ba6:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0002ba9:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002bac:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0002bb2:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002bb5:	c7 40 04 00 e8 08 00 	movl   $0x8e800,0x4(%eax)
c0002bbc:	8b 45 98             	mov    -0x68(%ebp),%eax
c0002bbf:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0002bc2:	83 c2 01             	add    $0x1,%edx
c0002bc5:	c1 e2 0b             	shl    $0xb,%edx
c0002bc8:	01 c2                	add    %eax,%edx
c0002bca:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002bcd:	89 50 08             	mov    %edx,0x8(%eax)
c0002bd0:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002bd3:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0002bda:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002bdd:	8d 50 05             	lea    0x5(%eax),%edx
c0002be0:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002be3:	89 50 10             	mov    %edx,0x10(%eax)
c0002be6:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0002bea:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002bed:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0002bf0:	7c a4                	jl     c0002b96 <mkfs+0x3c1>
c0002bf2:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002bf7:	89 c2                	mov    %eax,%edx
c0002bf9:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002bfc:	83 c0 03             	add    $0x3,%eax
c0002bff:	83 ec 0c             	sub    $0xc,%esp
c0002c02:	6a 0a                	push   $0xa
c0002c04:	68 00 02 00 00       	push   $0x200
c0002c09:	52                   	push   %edx
c0002c0a:	6a 20                	push   $0x20
c0002c0c:	50                   	push   %eax
c0002c0d:	e8 ea fa ff ff       	call   c00026fc <rd_wt>
c0002c12:	83 c4 20             	add    $0x20,%esp
c0002c15:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002c1a:	89 c2                	mov    %eax,%edx
c0002c1c:	8b 45 98             	mov    -0x68(%ebp),%eax
c0002c1f:	83 ec 0c             	sub    $0xc,%esp
c0002c22:	6a 07                	push   $0x7
c0002c24:	68 00 02 00 00       	push   $0x200
c0002c29:	52                   	push   %edx
c0002c2a:	6a 20                	push   $0x20
c0002c2c:	50                   	push   %eax
c0002c2d:	e8 ca fa ff ff       	call   c00026fc <rd_wt>
c0002c32:	83 c4 20             	add    $0x20,%esp
c0002c35:	c7 85 60 ff ff ff cc 	movl   $0xcc,-0xa0(%ebp)
c0002c3c:	00 00 00 
c0002c3f:	66 c7 85 5e ff ff ff 	movw   $0x2e,-0xa2(%ebp)
c0002c46:	2e 00 
c0002c48:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002c4d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0002c50:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002c53:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0002c59:	83 ec 0c             	sub    $0xc,%esp
c0002c5c:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0002c62:	50                   	push   %eax
c0002c63:	e8 10 92 00 00       	call   c000be78 <Strlen>
c0002c68:	83 c4 10             	add    $0x10,%esp
c0002c6b:	89 c1                	mov    %eax,%ecx
c0002c6d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002c70:	8d 50 04             	lea    0x4(%eax),%edx
c0002c73:	83 ec 04             	sub    $0x4,%esp
c0002c76:	51                   	push   %ecx
c0002c77:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0002c7d:	50                   	push   %eax
c0002c7e:	52                   	push   %edx
c0002c7f:	e8 93 4e 00 00       	call   c0007b17 <Memcpy>
c0002c84:	83 c4 10             	add    $0x10,%esp
c0002c87:	8d 95 34 ff ff ff    	lea    -0xcc(%ebp),%edx
c0002c8d:	b8 00 00 00 00       	mov    $0x0,%eax
c0002c92:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0002c97:	89 d7                	mov    %edx,%edi
c0002c99:	f3 ab                	rep stos %eax,%es:(%edi)
c0002c9b:	c7 85 34 ff ff ff fc 	movl   $0xc000b2fc,-0xcc(%ebp)
c0002ca2:	b2 00 c0 
c0002ca5:	c7 85 38 ff ff ff 05 	movl   $0xc000b305,-0xc8(%ebp)
c0002cac:	b3 00 c0 
c0002caf:	c7 85 3c ff ff ff 0e 	movl   $0xc000b30e,-0xc4(%ebp)
c0002cb6:	b3 00 c0 
c0002cb9:	c7 45 bc 03 00 00 00 	movl   $0x3,-0x44(%ebp)
c0002cc0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0002cc7:	eb 49                	jmp    c0002d12 <mkfs+0x53d>
c0002cc9:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0002ccd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002cd0:	8d 50 02             	lea    0x2(%eax),%edx
c0002cd3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002cd6:	89 10                	mov    %edx,(%eax)
c0002cd8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002cdb:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0002ce2:	83 ec 0c             	sub    $0xc,%esp
c0002ce5:	50                   	push   %eax
c0002ce6:	e8 8d 91 00 00       	call   c000be78 <Strlen>
c0002ceb:	83 c4 10             	add    $0x10,%esp
c0002cee:	89 c1                	mov    %eax,%ecx
c0002cf0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002cf3:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0002cfa:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0002cfd:	83 c2 04             	add    $0x4,%edx
c0002d00:	83 ec 04             	sub    $0x4,%esp
c0002d03:	51                   	push   %ecx
c0002d04:	50                   	push   %eax
c0002d05:	52                   	push   %edx
c0002d06:	e8 0c 4e 00 00       	call   c0007b17 <Memcpy>
c0002d0b:	83 c4 10             	add    $0x10,%esp
c0002d0e:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0002d12:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002d15:	3b 45 bc             	cmp    -0x44(%ebp),%eax
c0002d18:	7c af                	jl     c0002cc9 <mkfs+0x4f4>
c0002d1a:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0002d21:	eb 66                	jmp    c0002d89 <mkfs+0x5b4>
c0002d23:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002d26:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0002d2d:	83 ec 0c             	sub    $0xc,%esp
c0002d30:	50                   	push   %eax
c0002d31:	e8 42 91 00 00       	call   c000be78 <Strlen>
c0002d36:	83 c4 10             	add    $0x10,%esp
c0002d39:	85 c0                	test   %eax,%eax
c0002d3b:	74 47                	je     c0002d84 <mkfs+0x5af>
c0002d3d:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0002d41:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002d44:	8d 50 05             	lea    0x5(%eax),%edx
c0002d47:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002d4a:	89 10                	mov    %edx,(%eax)
c0002d4c:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002d4f:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0002d56:	83 ec 0c             	sub    $0xc,%esp
c0002d59:	50                   	push   %eax
c0002d5a:	e8 19 91 00 00       	call   c000be78 <Strlen>
c0002d5f:	83 c4 10             	add    $0x10,%esp
c0002d62:	89 c1                	mov    %eax,%ecx
c0002d64:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002d67:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0002d6e:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0002d71:	83 c2 04             	add    $0x4,%edx
c0002d74:	83 ec 04             	sub    $0x4,%esp
c0002d77:	51                   	push   %ecx
c0002d78:	50                   	push   %eax
c0002d79:	52                   	push   %edx
c0002d7a:	e8 98 4d 00 00       	call   c0007b17 <Memcpy>
c0002d7f:	83 c4 10             	add    $0x10,%esp
c0002d82:	eb 01                	jmp    c0002d85 <mkfs+0x5b0>
c0002d84:	90                   	nop
c0002d85:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0002d89:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002d8c:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0002d8f:	7c 92                	jl     c0002d23 <mkfs+0x54e>
c0002d91:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002d96:	89 c2                	mov    %eax,%edx
c0002d98:	8b 45 98             	mov    -0x68(%ebp),%eax
c0002d9b:	83 ec 0c             	sub    $0xc,%esp
c0002d9e:	6a 0a                	push   $0xa
c0002da0:	68 00 02 00 00       	push   $0x200
c0002da5:	52                   	push   %edx
c0002da6:	6a 20                	push   $0x20
c0002da8:	50                   	push   %eax
c0002da9:	e8 4e f9 ff ff       	call   c00026fc <rd_wt>
c0002dae:	83 c4 20             	add    $0x20,%esp
c0002db1:	90                   	nop
c0002db2:	8b 7d fc             	mov    -0x4(%ebp),%edi
c0002db5:	c9                   	leave  
c0002db6:	c3                   	ret    

c0002db7 <init_fs>:
c0002db7:	55                   	push   %ebp
c0002db8:	89 e5                	mov    %esp,%ebp
c0002dba:	83 ec 18             	sub    $0x18,%esp
c0002dbd:	83 ec 0c             	sub    $0xc,%esp
c0002dc0:	6a 7c                	push   $0x7c
c0002dc2:	e8 fd f6 ff ff       	call   c00024c4 <sys_malloc>
c0002dc7:	83 c4 10             	add    $0x10,%esp
c0002dca:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0002dcd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002dd0:	c7 40 78 06 00 00 00 	movl   $0x6,0x78(%eax)
c0002dd7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002dda:	c7 40 14 20 00 00 00 	movl   $0x20,0x14(%eax)
c0002de1:	83 ec 04             	sub    $0x4,%esp
c0002de4:	6a 03                	push   $0x3
c0002de6:	ff 75 f4             	pushl  -0xc(%ebp)
c0002de9:	6a 03                	push   $0x3
c0002deb:	e8 e8 71 00 00       	call   c0009fd8 <send_rec>
c0002df0:	83 c4 10             	add    $0x10,%esp
c0002df3:	e8 dd f9 ff ff       	call   c00027d5 <mkfs>
c0002df8:	83 ec 08             	sub    $0x8,%esp
c0002dfb:	6a 7c                	push   $0x7c
c0002dfd:	ff 75 f4             	pushl  -0xc(%ebp)
c0002e00:	e8 d4 f6 ff ff       	call   c00024d9 <sys_free>
c0002e05:	83 c4 10             	add    $0x10,%esp
c0002e08:	90                   	nop
c0002e09:	c9                   	leave  
c0002e0a:	c3                   	ret    

c0002e0b <do_open>:
c0002e0b:	55                   	push   %ebp
c0002e0c:	89 e5                	mov    %esp,%ebp
c0002e0e:	83 ec 68             	sub    $0x68,%esp
c0002e11:	83 ec 04             	sub    $0x4,%esp
c0002e14:	6a 0c                	push   $0xc
c0002e16:	6a 00                	push   $0x0
c0002e18:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0002e1b:	50                   	push   %eax
c0002e1c:	e8 1e 90 00 00       	call   c000be3f <Memset>
c0002e21:	83 c4 10             	add    $0x10,%esp
c0002e24:	8b 45 08             	mov    0x8(%ebp),%eax
c0002e27:	8b 40 44             	mov    0x44(%eax),%eax
c0002e2a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0002e2d:	83 ec 08             	sub    $0x8,%esp
c0002e30:	6a 0c                	push   $0xc
c0002e32:	ff 75 e4             	pushl  -0x1c(%ebp)
c0002e35:	e8 e0 3e 00 00       	call   c0006d1a <alloc_virtual_memory>
c0002e3a:	83 c4 10             	add    $0x10,%esp
c0002e3d:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0002e40:	8b 45 08             	mov    0x8(%ebp),%eax
c0002e43:	8b 40 40             	mov    0x40(%eax),%eax
c0002e46:	89 c2                	mov    %eax,%edx
c0002e48:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002e4b:	83 ec 04             	sub    $0x4,%esp
c0002e4e:	52                   	push   %edx
c0002e4f:	50                   	push   %eax
c0002e50:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0002e53:	50                   	push   %eax
c0002e54:	e8 be 4c 00 00       	call   c0007b17 <Memcpy>
c0002e59:	83 c4 10             	add    $0x10,%esp
c0002e5c:	8b 45 08             	mov    0x8(%ebp),%eax
c0002e5f:	8b 40 40             	mov    0x40(%eax),%eax
c0002e62:	c6 44 05 c4 00       	movb   $0x0,-0x3c(%ebp,%eax,1)
c0002e67:	8b 45 08             	mov    0x8(%ebp),%eax
c0002e6a:	8b 40 74             	mov    0x74(%eax),%eax
c0002e6d:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0002e70:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c0002e77:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0002e7e:	eb 1f                	jmp    c0002e9f <do_open+0x94>
c0002e80:	a1 c8 0b 01 c0       	mov    0xc0010bc8,%eax
c0002e85:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0002e88:	83 c2 50             	add    $0x50,%edx
c0002e8b:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
c0002e8f:	85 c0                	test   %eax,%eax
c0002e91:	75 08                	jne    c0002e9b <do_open+0x90>
c0002e93:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0002e96:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0002e99:	eb 0a                	jmp    c0002ea5 <do_open+0x9a>
c0002e9b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0002e9f:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c0002ea3:	7e db                	jle    c0002e80 <do_open+0x75>
c0002ea5:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c0002ea9:	75 1c                	jne    c0002ec7 <do_open+0xbc>
c0002eab:	68 c6 01 00 00       	push   $0x1c6
c0002eb0:	68 24 b2 00 c0       	push   $0xc000b224
c0002eb5:	68 24 b2 00 c0       	push   $0xc000b224
c0002eba:	68 17 b3 00 c0       	push   $0xc000b317
c0002ebf:	e8 d7 67 00 00       	call   c000969b <assertion_failure>
c0002ec4:	83 c4 10             	add    $0x10,%esp
c0002ec7:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%ebp)
c0002ece:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0002ed5:	eb 1d                	jmp    c0002ef4 <do_open+0xe9>
c0002ed7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002eda:	c1 e0 04             	shl    $0x4,%eax
c0002edd:	05 88 23 01 c0       	add    $0xc0012388,%eax
c0002ee2:	8b 00                	mov    (%eax),%eax
c0002ee4:	85 c0                	test   %eax,%eax
c0002ee6:	75 08                	jne    c0002ef0 <do_open+0xe5>
c0002ee8:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002eeb:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0002eee:	eb 0a                	jmp    c0002efa <do_open+0xef>
c0002ef0:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0002ef4:	83 7d e8 3f          	cmpl   $0x3f,-0x18(%ebp)
c0002ef8:	7e dd                	jle    c0002ed7 <do_open+0xcc>
c0002efa:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
c0002efe:	75 1c                	jne    c0002f1c <do_open+0x111>
c0002f00:	68 d2 01 00 00       	push   $0x1d2
c0002f05:	68 24 b2 00 c0       	push   $0xc000b224
c0002f0a:	68 24 b2 00 c0       	push   $0xc000b224
c0002f0f:	68 1f b3 00 c0       	push   $0xc000b31f
c0002f14:	e8 82 67 00 00       	call   c000969b <assertion_failure>
c0002f19:	83 c4 10             	add    $0x10,%esp
c0002f1c:	83 ec 0c             	sub    $0xc,%esp
c0002f1f:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0002f22:	50                   	push   %eax
c0002f23:	e8 b2 00 00 00       	call   c0002fda <search_file>
c0002f28:	83 c4 10             	add    $0x10,%esp
c0002f2b:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0002f2e:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c0002f32:	75 2b                	jne    c0002f5f <do_open+0x154>
c0002f34:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0002f38:	7e 10                	jle    c0002f4a <do_open+0x13f>
c0002f3a:	83 ec 0c             	sub    $0xc,%esp
c0002f3d:	68 27 b3 00 c0       	push   $0xc000b327
c0002f42:	e8 36 67 00 00       	call   c000967d <panic>
c0002f47:	83 c4 10             	add    $0x10,%esp
c0002f4a:	83 ec 08             	sub    $0x8,%esp
c0002f4d:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0002f50:	50                   	push   %eax
c0002f51:	8d 45 9c             	lea    -0x64(%ebp),%eax
c0002f54:	50                   	push   %eax
c0002f55:	e8 40 04 00 00       	call   c000339a <create_file>
c0002f5a:	83 c4 10             	add    $0x10,%esp
c0002f5d:	eb 22                	jmp    c0002f81 <do_open+0x176>
c0002f5f:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
c0002f63:	75 07                	jne    c0002f6c <do_open+0x161>
c0002f65:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0002f6a:	eb 6c                	jmp    c0002fd8 <do_open+0x1cd>
c0002f6c:	83 ec 08             	sub    $0x8,%esp
c0002f6f:	ff 75 d8             	pushl  -0x28(%ebp)
c0002f72:	8d 45 9c             	lea    -0x64(%ebp),%eax
c0002f75:	50                   	push   %eax
c0002f76:	e8 5d 02 00 00       	call   c00031d8 <get_inode>
c0002f7b:	83 c4 10             	add    $0x10,%esp
c0002f7e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0002f81:	a1 c8 0b 01 c0       	mov    0xc0010bc8,%eax
c0002f86:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0002f89:	c1 e2 04             	shl    $0x4,%edx
c0002f8c:	8d 8a 80 23 01 c0    	lea    -0x3ffedc80(%edx),%ecx
c0002f92:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0002f95:	83 c2 50             	add    $0x50,%edx
c0002f98:	89 4c 90 08          	mov    %ecx,0x8(%eax,%edx,4)
c0002f9c:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0002f9f:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0002fa2:	c1 e2 04             	shl    $0x4,%edx
c0002fa5:	81 c2 88 23 01 c0    	add    $0xc0012388,%edx
c0002fab:	89 02                	mov    %eax,(%edx)
c0002fad:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002fb0:	c1 e0 04             	shl    $0x4,%eax
c0002fb3:	05 84 23 01 c0       	add    $0xc0012384,%eax
c0002fb8:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0002fbe:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002fc1:	c1 e0 04             	shl    $0x4,%eax
c0002fc4:	05 80 23 01 c0       	add    $0xc0012380,%eax
c0002fc9:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0002fcf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002fd2:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0002fd5:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0002fd8:	c9                   	leave  
c0002fd9:	c3                   	ret    

c0002fda <search_file>:
c0002fda:	55                   	push   %ebp
c0002fdb:	89 e5                	mov    %esp,%ebp
c0002fdd:	83 ec 68             	sub    $0x68,%esp
c0002fe0:	83 ec 04             	sub    $0x4,%esp
c0002fe3:	6a 0c                	push   $0xc
c0002fe5:	6a 00                	push   $0x0
c0002fe7:	8d 45 c0             	lea    -0x40(%ebp),%eax
c0002fea:	50                   	push   %eax
c0002feb:	e8 4f 8e 00 00       	call   c000be3f <Memset>
c0002ff0:	83 c4 10             	add    $0x10,%esp
c0002ff3:	83 ec 04             	sub    $0x4,%esp
c0002ff6:	6a 28                	push   $0x28
c0002ff8:	6a 00                	push   $0x0
c0002ffa:	8d 45 98             	lea    -0x68(%ebp),%eax
c0002ffd:	50                   	push   %eax
c0002ffe:	e8 3c 8e 00 00       	call   c000be3f <Memset>
c0003003:	83 c4 10             	add    $0x10,%esp
c0003006:	83 ec 04             	sub    $0x4,%esp
c0003009:	8d 45 98             	lea    -0x68(%ebp),%eax
c000300c:	50                   	push   %eax
c000300d:	ff 75 08             	pushl  0x8(%ebp)
c0003010:	8d 45 c0             	lea    -0x40(%ebp),%eax
c0003013:	50                   	push   %eax
c0003014:	e8 f3 00 00 00       	call   c000310c <strip_path>
c0003019:	83 c4 10             	add    $0x10,%esp
c000301c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000301f:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%ebp)
c0003023:	75 0a                	jne    c000302f <search_file+0x55>
c0003025:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c000302a:	e9 db 00 00 00       	jmp    c000310a <search_file+0x130>
c000302f:	8b 45 9c             	mov    -0x64(%ebp),%eax
c0003032:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0003035:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0003038:	05 00 02 00 00       	add    $0x200,%eax
c000303d:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0003043:	85 c0                	test   %eax,%eax
c0003045:	0f 48 c2             	cmovs  %edx,%eax
c0003048:	c1 f8 09             	sar    $0x9,%eax
c000304b:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000304e:	8b 45 9c             	mov    -0x64(%ebp),%eax
c0003051:	c1 e8 04             	shr    $0x4,%eax
c0003054:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0003057:	e8 5c 14 00 00       	call   c00044b8 <get_super_block>
c000305c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000305f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0003062:	8b 00                	mov    (%eax),%eax
c0003064:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003067:	c7 45 cc 20 00 00 00 	movl   $0x20,-0x34(%ebp)
c000306e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003075:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000307c:	eb 7b                	jmp    c00030f9 <search_file+0x11f>
c000307e:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003083:	89 c1                	mov    %eax,%ecx
c0003085:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0003088:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000308b:	01 d0                	add    %edx,%eax
c000308d:	83 ec 0c             	sub    $0xc,%esp
c0003090:	6a 07                	push   $0x7
c0003092:	68 00 02 00 00       	push   $0x200
c0003097:	51                   	push   %ecx
c0003098:	ff 75 cc             	pushl  -0x34(%ebp)
c000309b:	50                   	push   %eax
c000309c:	e8 5b f6 ff ff       	call   c00026fc <rd_wt>
c00030a1:	83 c4 20             	add    $0x20,%esp
c00030a4:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c00030a9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00030ac:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00030b3:	eb 35                	jmp    c00030ea <search_file+0x110>
c00030b5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00030b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00030bc:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c00030bf:	7f 33                	jg     c00030f4 <search_file+0x11a>
c00030c1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00030c4:	83 c0 04             	add    $0x4,%eax
c00030c7:	83 ec 08             	sub    $0x8,%esp
c00030ca:	50                   	push   %eax
c00030cb:	8d 45 c0             	lea    -0x40(%ebp),%eax
c00030ce:	50                   	push   %eax
c00030cf:	e8 6c 72 00 00       	call   c000a340 <strcmp>
c00030d4:	83 c4 10             	add    $0x10,%esp
c00030d7:	85 c0                	test   %eax,%eax
c00030d9:	75 07                	jne    c00030e2 <search_file+0x108>
c00030db:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00030de:	8b 00                	mov    (%eax),%eax
c00030e0:	eb 28                	jmp    c000310a <search_file+0x130>
c00030e2:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c00030e6:	83 45 ec 10          	addl   $0x10,-0x14(%ebp)
c00030ea:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00030ed:	83 f8 1f             	cmp    $0x1f,%eax
c00030f0:	76 c3                	jbe    c00030b5 <search_file+0xdb>
c00030f2:	eb 01                	jmp    c00030f5 <search_file+0x11b>
c00030f4:	90                   	nop
c00030f5:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00030f9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00030fc:	3b 45 dc             	cmp    -0x24(%ebp),%eax
c00030ff:	0f 8c 79 ff ff ff    	jl     c000307e <search_file+0xa4>
c0003105:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c000310a:	c9                   	leave  
c000310b:	c3                   	ret    

c000310c <strip_path>:
c000310c:	55                   	push   %ebp
c000310d:	89 e5                	mov    %esp,%ebp
c000310f:	83 ec 10             	sub    $0x10,%esp
c0003112:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0003116:	75 0a                	jne    c0003122 <strip_path+0x16>
c0003118:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c000311d:	e9 b4 00 00 00       	jmp    c00031d6 <strip_path+0xca>
c0003122:	8b 45 08             	mov    0x8(%ebp),%eax
c0003125:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0003128:	8b 45 0c             	mov    0xc(%ebp),%eax
c000312b:	89 45 f8             	mov    %eax,-0x8(%ebp)
c000312e:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0003131:	0f b6 00             	movzbl (%eax),%eax
c0003134:	3c 2f                	cmp    $0x2f,%al
c0003136:	75 2d                	jne    c0003165 <strip_path+0x59>
c0003138:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c000313c:	eb 27                	jmp    c0003165 <strip_path+0x59>
c000313e:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0003141:	0f b6 00             	movzbl (%eax),%eax
c0003144:	3c 2f                	cmp    $0x2f,%al
c0003146:	75 0a                	jne    c0003152 <strip_path+0x46>
c0003148:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c000314d:	e9 84 00 00 00       	jmp    c00031d6 <strip_path+0xca>
c0003152:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0003155:	0f b6 10             	movzbl (%eax),%edx
c0003158:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000315b:	88 10                	mov    %dl,(%eax)
c000315d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0003161:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0003165:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0003168:	0f b6 00             	movzbl (%eax),%eax
c000316b:	84 c0                	test   %al,%al
c000316d:	75 cf                	jne    c000313e <strip_path+0x32>
c000316f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0003172:	c6 00 00             	movb   $0x0,(%eax)
c0003175:	8b 45 10             	mov    0x10(%ebp),%eax
c0003178:	8b 15 c0 31 01 c0    	mov    0xc00131c0,%edx
c000317e:	89 10                	mov    %edx,(%eax)
c0003180:	8b 15 c4 31 01 c0    	mov    0xc00131c4,%edx
c0003186:	89 50 04             	mov    %edx,0x4(%eax)
c0003189:	8b 15 c8 31 01 c0    	mov    0xc00131c8,%edx
c000318f:	89 50 08             	mov    %edx,0x8(%eax)
c0003192:	8b 15 cc 31 01 c0    	mov    0xc00131cc,%edx
c0003198:	89 50 0c             	mov    %edx,0xc(%eax)
c000319b:	8b 15 d0 31 01 c0    	mov    0xc00131d0,%edx
c00031a1:	89 50 10             	mov    %edx,0x10(%eax)
c00031a4:	8b 15 d4 31 01 c0    	mov    0xc00131d4,%edx
c00031aa:	89 50 14             	mov    %edx,0x14(%eax)
c00031ad:	8b 15 d8 31 01 c0    	mov    0xc00131d8,%edx
c00031b3:	89 50 18             	mov    %edx,0x18(%eax)
c00031b6:	8b 15 dc 31 01 c0    	mov    0xc00131dc,%edx
c00031bc:	89 50 1c             	mov    %edx,0x1c(%eax)
c00031bf:	8b 15 e0 31 01 c0    	mov    0xc00131e0,%edx
c00031c5:	89 50 20             	mov    %edx,0x20(%eax)
c00031c8:	8b 15 e4 31 01 c0    	mov    0xc00131e4,%edx
c00031ce:	89 50 24             	mov    %edx,0x24(%eax)
c00031d1:	b8 00 00 00 00       	mov    $0x0,%eax
c00031d6:	c9                   	leave  
c00031d7:	c3                   	ret    

c00031d8 <get_inode>:
c00031d8:	55                   	push   %ebp
c00031d9:	89 e5                	mov    %esp,%ebp
c00031db:	56                   	push   %esi
c00031dc:	53                   	push   %ebx
c00031dd:	83 ec 20             	sub    $0x20,%esp
c00031e0:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00031e4:	75 0a                	jne    c00031f0 <get_inode+0x18>
c00031e6:	b8 00 00 00 00       	mov    $0x0,%eax
c00031eb:	e9 a3 01 00 00       	jmp    c0003393 <get_inode+0x1bb>
c00031f0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00031f7:	c7 45 f0 a0 27 01 c0 	movl   $0xc00127a0,-0x10(%ebp)
c00031fe:	eb 69                	jmp    c0003269 <get_inode+0x91>
c0003200:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003203:	8b 40 24             	mov    0x24(%eax),%eax
c0003206:	85 c0                	test   %eax,%eax
c0003208:	7e 53                	jle    c000325d <get_inode+0x85>
c000320a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000320d:	8b 40 10             	mov    0x10(%eax),%eax
c0003210:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0003213:	75 50                	jne    c0003265 <get_inode+0x8d>
c0003215:	8b 45 08             	mov    0x8(%ebp),%eax
c0003218:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000321b:	8b 0a                	mov    (%edx),%ecx
c000321d:	89 08                	mov    %ecx,(%eax)
c000321f:	8b 4a 04             	mov    0x4(%edx),%ecx
c0003222:	89 48 04             	mov    %ecx,0x4(%eax)
c0003225:	8b 4a 08             	mov    0x8(%edx),%ecx
c0003228:	89 48 08             	mov    %ecx,0x8(%eax)
c000322b:	8b 4a 0c             	mov    0xc(%edx),%ecx
c000322e:	89 48 0c             	mov    %ecx,0xc(%eax)
c0003231:	8b 4a 10             	mov    0x10(%edx),%ecx
c0003234:	89 48 10             	mov    %ecx,0x10(%eax)
c0003237:	8b 4a 14             	mov    0x14(%edx),%ecx
c000323a:	89 48 14             	mov    %ecx,0x14(%eax)
c000323d:	8b 4a 18             	mov    0x18(%edx),%ecx
c0003240:	89 48 18             	mov    %ecx,0x18(%eax)
c0003243:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0003246:	89 48 1c             	mov    %ecx,0x1c(%eax)
c0003249:	8b 4a 20             	mov    0x20(%edx),%ecx
c000324c:	89 48 20             	mov    %ecx,0x20(%eax)
c000324f:	8b 52 24             	mov    0x24(%edx),%edx
c0003252:	89 50 24             	mov    %edx,0x24(%eax)
c0003255:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003258:	e9 36 01 00 00       	jmp    c0003393 <get_inode+0x1bb>
c000325d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003260:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003263:	eb 0d                	jmp    c0003272 <get_inode+0x9a>
c0003265:	83 45 f0 28          	addl   $0x28,-0x10(%ebp)
c0003269:	81 7d f0 a0 31 01 c0 	cmpl   $0xc00131a0,-0x10(%ebp)
c0003270:	76 8e                	jbe    c0003200 <get_inode+0x28>
c0003272:	e8 41 12 00 00       	call   c00044b8 <get_super_block>
c0003277:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000327a:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c0003281:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003284:	8b 40 04             	mov    0x4(%eax),%eax
c0003287:	8d 50 02             	lea    0x2(%eax),%edx
c000328a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000328d:	8b 40 08             	mov    0x8(%eax),%eax
c0003290:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c0003293:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003296:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0003299:	b8 00 02 00 00       	mov    $0x200,%eax
c000329e:	99                   	cltd   
c000329f:	f7 7d e8             	idivl  -0x18(%ebp)
c00032a2:	89 c6                	mov    %eax,%esi
c00032a4:	89 c8                	mov    %ecx,%eax
c00032a6:	99                   	cltd   
c00032a7:	f7 fe                	idiv   %esi
c00032a9:	01 d8                	add    %ebx,%eax
c00032ab:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00032ae:	c7 45 e0 20 00 00 00 	movl   $0x20,-0x20(%ebp)
c00032b5:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00032ba:	83 ec 0c             	sub    $0xc,%esp
c00032bd:	6a 07                	push   $0x7
c00032bf:	68 00 02 00 00       	push   $0x200
c00032c4:	50                   	push   %eax
c00032c5:	ff 75 e0             	pushl  -0x20(%ebp)
c00032c8:	ff 75 e4             	pushl  -0x1c(%ebp)
c00032cb:	e8 2c f4 ff ff       	call   c00026fc <rd_wt>
c00032d0:	83 c4 20             	add    $0x20,%esp
c00032d3:	8b 45 0c             	mov    0xc(%ebp),%eax
c00032d6:	8d 48 ff             	lea    -0x1(%eax),%ecx
c00032d9:	b8 00 02 00 00       	mov    $0x200,%eax
c00032de:	99                   	cltd   
c00032df:	f7 7d e8             	idivl  -0x18(%ebp)
c00032e2:	89 c3                	mov    %eax,%ebx
c00032e4:	89 c8                	mov    %ecx,%eax
c00032e6:	99                   	cltd   
c00032e7:	f7 fb                	idiv   %ebx
c00032e9:	89 55 dc             	mov    %edx,-0x24(%ebp)
c00032ec:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c00032f2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00032f5:	0f af 45 dc          	imul   -0x24(%ebp),%eax
c00032f9:	01 d0                	add    %edx,%eax
c00032fb:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00032fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003301:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0003304:	8b 0a                	mov    (%edx),%ecx
c0003306:	89 08                	mov    %ecx,(%eax)
c0003308:	8b 4a 04             	mov    0x4(%edx),%ecx
c000330b:	89 48 04             	mov    %ecx,0x4(%eax)
c000330e:	8b 4a 08             	mov    0x8(%edx),%ecx
c0003311:	89 48 08             	mov    %ecx,0x8(%eax)
c0003314:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0003317:	89 48 0c             	mov    %ecx,0xc(%eax)
c000331a:	8b 4a 10             	mov    0x10(%edx),%ecx
c000331d:	89 48 10             	mov    %ecx,0x10(%eax)
c0003320:	8b 4a 14             	mov    0x14(%edx),%ecx
c0003323:	89 48 14             	mov    %ecx,0x14(%eax)
c0003326:	8b 4a 18             	mov    0x18(%edx),%ecx
c0003329:	89 48 18             	mov    %ecx,0x18(%eax)
c000332c:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c000332f:	89 48 1c             	mov    %ecx,0x1c(%eax)
c0003332:	8b 4a 20             	mov    0x20(%edx),%ecx
c0003335:	89 48 20             	mov    %ecx,0x20(%eax)
c0003338:	8b 52 24             	mov    0x24(%edx),%edx
c000333b:	89 50 24             	mov    %edx,0x24(%eax)
c000333e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003341:	8b 55 0c             	mov    0xc(%ebp),%edx
c0003344:	89 50 10             	mov    %edx,0x10(%eax)
c0003347:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000334a:	8b 55 e0             	mov    -0x20(%ebp),%edx
c000334d:	89 50 20             	mov    %edx,0x20(%eax)
c0003350:	8b 45 08             	mov    0x8(%ebp),%eax
c0003353:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0003356:	8b 0a                	mov    (%edx),%ecx
c0003358:	89 08                	mov    %ecx,(%eax)
c000335a:	8b 4a 04             	mov    0x4(%edx),%ecx
c000335d:	89 48 04             	mov    %ecx,0x4(%eax)
c0003360:	8b 4a 08             	mov    0x8(%edx),%ecx
c0003363:	89 48 08             	mov    %ecx,0x8(%eax)
c0003366:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0003369:	89 48 0c             	mov    %ecx,0xc(%eax)
c000336c:	8b 4a 10             	mov    0x10(%edx),%ecx
c000336f:	89 48 10             	mov    %ecx,0x10(%eax)
c0003372:	8b 4a 14             	mov    0x14(%edx),%ecx
c0003375:	89 48 14             	mov    %ecx,0x14(%eax)
c0003378:	8b 4a 18             	mov    0x18(%edx),%ecx
c000337b:	89 48 18             	mov    %ecx,0x18(%eax)
c000337e:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0003381:	89 48 1c             	mov    %ecx,0x1c(%eax)
c0003384:	8b 4a 20             	mov    0x20(%edx),%ecx
c0003387:	89 48 20             	mov    %ecx,0x20(%eax)
c000338a:	8b 52 24             	mov    0x24(%edx),%edx
c000338d:	89 50 24             	mov    %edx,0x24(%eax)
c0003390:	8b 45 08             	mov    0x8(%ebp),%eax
c0003393:	8d 65 f8             	lea    -0x8(%ebp),%esp
c0003396:	5b                   	pop    %ebx
c0003397:	5e                   	pop    %esi
c0003398:	5d                   	pop    %ebp
c0003399:	c3                   	ret    

c000339a <create_file>:
c000339a:	55                   	push   %ebp
c000339b:	89 e5                	mov    %esp,%ebp
c000339d:	81 ec 98 00 00 00    	sub    $0x98,%esp
c00033a3:	8d 45 b8             	lea    -0x48(%ebp),%eax
c00033a6:	50                   	push   %eax
c00033a7:	ff 75 0c             	pushl  0xc(%ebp)
c00033aa:	8d 45 ac             	lea    -0x54(%ebp),%eax
c00033ad:	50                   	push   %eax
c00033ae:	e8 59 fd ff ff       	call   c000310c <strip_path>
c00033b3:	83 c4 0c             	add    $0xc,%esp
c00033b6:	83 f8 ff             	cmp    $0xffffffff,%eax
c00033b9:	75 0a                	jne    c00033c5 <create_file+0x2b>
c00033bb:	b8 00 00 00 00       	mov    $0x0,%eax
c00033c0:	e9 de 00 00 00       	jmp    c00034a3 <create_file+0x109>
c00033c5:	e8 db 00 00 00       	call   c00034a5 <alloc_imap_bit>
c00033ca:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00033cd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00033d1:	75 0a                	jne    c00033dd <create_file+0x43>
c00033d3:	b8 00 00 00 00       	mov    $0x0,%eax
c00033d8:	e9 c6 00 00 00       	jmp    c00034a3 <create_file+0x109>
c00033dd:	e8 d6 10 00 00       	call   c00044b8 <get_super_block>
c00033e2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00033e5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00033e8:	8b 40 10             	mov    0x10(%eax),%eax
c00033eb:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00033ee:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00033f1:	83 ec 08             	sub    $0x8,%esp
c00033f4:	50                   	push   %eax
c00033f5:	ff 75 f4             	pushl  -0xc(%ebp)
c00033f8:	e8 a5 01 00 00       	call   c00035a2 <alloc_smap_bit>
c00033fd:	83 c4 10             	add    $0x10,%esp
c0003400:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0003403:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0003407:	75 0a                	jne    c0003413 <create_file+0x79>
c0003409:	b8 00 00 00 00       	mov    $0x0,%eax
c000340e:	e9 90 00 00 00       	jmp    c00034a3 <create_file+0x109>
c0003413:	83 ec 04             	sub    $0x4,%esp
c0003416:	ff 75 e8             	pushl  -0x18(%ebp)
c0003419:	ff 75 f4             	pushl  -0xc(%ebp)
c000341c:	8d 45 84             	lea    -0x7c(%ebp),%eax
c000341f:	50                   	push   %eax
c0003420:	e8 1e 03 00 00       	call   c0003743 <new_inode>
c0003425:	83 c4 10             	add    $0x10,%esp
c0003428:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000342b:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c000342f:	75 07                	jne    c0003438 <create_file+0x9e>
c0003431:	b8 00 00 00 00       	mov    $0x0,%eax
c0003436:	eb 6b                	jmp    c00034a3 <create_file+0x109>
c0003438:	ff 75 f4             	pushl  -0xc(%ebp)
c000343b:	8d 45 ac             	lea    -0x54(%ebp),%eax
c000343e:	50                   	push   %eax
c000343f:	8d 45 b8             	lea    -0x48(%ebp),%eax
c0003442:	50                   	push   %eax
c0003443:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0003449:	50                   	push   %eax
c000344a:	e8 12 04 00 00       	call   c0003861 <new_dir_entry>
c000344f:	83 c4 10             	add    $0x10,%esp
c0003452:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0003455:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0003459:	75 07                	jne    c0003462 <create_file+0xc8>
c000345b:	b8 00 00 00 00       	mov    $0x0,%eax
c0003460:	eb 41                	jmp    c00034a3 <create_file+0x109>
c0003462:	8b 45 08             	mov    0x8(%ebp),%eax
c0003465:	8b 55 84             	mov    -0x7c(%ebp),%edx
c0003468:	89 10                	mov    %edx,(%eax)
c000346a:	8b 55 88             	mov    -0x78(%ebp),%edx
c000346d:	89 50 04             	mov    %edx,0x4(%eax)
c0003470:	8b 55 8c             	mov    -0x74(%ebp),%edx
c0003473:	89 50 08             	mov    %edx,0x8(%eax)
c0003476:	8b 55 90             	mov    -0x70(%ebp),%edx
c0003479:	89 50 0c             	mov    %edx,0xc(%eax)
c000347c:	8b 55 94             	mov    -0x6c(%ebp),%edx
c000347f:	89 50 10             	mov    %edx,0x10(%eax)
c0003482:	8b 55 98             	mov    -0x68(%ebp),%edx
c0003485:	89 50 14             	mov    %edx,0x14(%eax)
c0003488:	8b 55 9c             	mov    -0x64(%ebp),%edx
c000348b:	89 50 18             	mov    %edx,0x18(%eax)
c000348e:	8b 55 a0             	mov    -0x60(%ebp),%edx
c0003491:	89 50 1c             	mov    %edx,0x1c(%eax)
c0003494:	8b 55 a4             	mov    -0x5c(%ebp),%edx
c0003497:	89 50 20             	mov    %edx,0x20(%eax)
c000349a:	8b 55 a8             	mov    -0x58(%ebp),%edx
c000349d:	89 50 24             	mov    %edx,0x24(%eax)
c00034a0:	8b 45 08             	mov    0x8(%ebp),%eax
c00034a3:	c9                   	leave  
c00034a4:	c3                   	ret    

c00034a5 <alloc_imap_bit>:
c00034a5:	55                   	push   %ebp
c00034a6:	89 e5                	mov    %esp,%ebp
c00034a8:	53                   	push   %ebx
c00034a9:	83 ec 24             	sub    $0x24,%esp
c00034ac:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c00034b3:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c00034ba:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00034bf:	83 ec 0c             	sub    $0xc,%esp
c00034c2:	6a 07                	push   $0x7
c00034c4:	68 00 02 00 00       	push   $0x200
c00034c9:	50                   	push   %eax
c00034ca:	ff 75 e8             	pushl  -0x18(%ebp)
c00034cd:	ff 75 ec             	pushl  -0x14(%ebp)
c00034d0:	e8 27 f2 ff ff       	call   c00026fc <rd_wt>
c00034d5:	83 c4 20             	add    $0x20,%esp
c00034d8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00034df:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00034e6:	e9 a5 00 00 00       	jmp    c0003590 <alloc_imap_bit+0xeb>
c00034eb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00034f2:	e9 8b 00 00 00       	jmp    c0003582 <alloc_imap_bit+0xdd>
c00034f7:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c00034fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003500:	01 d0                	add    %edx,%eax
c0003502:	0f b6 00             	movzbl (%eax),%eax
c0003505:	0f be d0             	movsbl %al,%edx
c0003508:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000350b:	89 c1                	mov    %eax,%ecx
c000350d:	d3 fa                	sar    %cl,%edx
c000350f:	89 d0                	mov    %edx,%eax
c0003511:	83 e0 01             	and    $0x1,%eax
c0003514:	85 c0                	test   %eax,%eax
c0003516:	74 06                	je     c000351e <alloc_imap_bit+0x79>
c0003518:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c000351c:	eb 64                	jmp    c0003582 <alloc_imap_bit+0xdd>
c000351e:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003524:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003527:	01 d0                	add    %edx,%eax
c0003529:	0f b6 18             	movzbl (%eax),%ebx
c000352c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000352f:	ba 01 00 00 00       	mov    $0x1,%edx
c0003534:	89 c1                	mov    %eax,%ecx
c0003536:	d3 e2                	shl    %cl,%edx
c0003538:	89 d0                	mov    %edx,%eax
c000353a:	89 c1                	mov    %eax,%ecx
c000353c:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003542:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003545:	01 d0                	add    %edx,%eax
c0003547:	09 cb                	or     %ecx,%ebx
c0003549:	89 da                	mov    %ebx,%edx
c000354b:	88 10                	mov    %dl,(%eax)
c000354d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003550:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0003557:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000355a:	01 d0                	add    %edx,%eax
c000355c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000355f:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003564:	83 ec 0c             	sub    $0xc,%esp
c0003567:	6a 0a                	push   $0xa
c0003569:	68 00 02 00 00       	push   $0x200
c000356e:	50                   	push   %eax
c000356f:	ff 75 e8             	pushl  -0x18(%ebp)
c0003572:	ff 75 ec             	pushl  -0x14(%ebp)
c0003575:	e8 82 f1 ff ff       	call   c00026fc <rd_wt>
c000357a:	83 c4 20             	add    $0x20,%esp
c000357d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003580:	eb 1b                	jmp    c000359d <alloc_imap_bit+0xf8>
c0003582:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
c0003586:	0f 8e 6b ff ff ff    	jle    c00034f7 <alloc_imap_bit+0x52>
c000358c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0003590:	81 7d f4 ff 01 00 00 	cmpl   $0x1ff,-0xc(%ebp)
c0003597:	0f 8e 4e ff ff ff    	jle    c00034eb <alloc_imap_bit+0x46>
c000359d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c00035a0:	c9                   	leave  
c00035a1:	c3                   	ret    

c00035a2 <alloc_smap_bit>:
c00035a2:	55                   	push   %ebp
c00035a3:	89 e5                	mov    %esp,%ebp
c00035a5:	53                   	push   %ebx
c00035a6:	83 ec 34             	sub    $0x34,%esp
c00035a9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00035ad:	75 1c                	jne    c00035cb <alloc_smap_bit+0x29>
c00035af:	68 fc 02 00 00       	push   $0x2fc
c00035b4:	68 24 b2 00 c0       	push   $0xc000b224
c00035b9:	68 24 b2 00 c0       	push   $0xc000b224
c00035be:	68 34 b3 00 c0       	push   $0xc000b334
c00035c3:	e8 d3 60 00 00       	call   c000969b <assertion_failure>
c00035c8:	83 c4 10             	add    $0x10,%esp
c00035cb:	e8 e8 0e 00 00       	call   c00044b8 <get_super_block>
c00035d0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00035d3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00035d6:	8b 40 08             	mov    0x8(%eax),%eax
c00035d9:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00035dc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00035df:	8b 40 04             	mov    0x4(%eax),%eax
c00035e2:	83 c0 02             	add    $0x2,%eax
c00035e5:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00035e8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00035ef:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c00035f6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00035fd:	e9 20 01 00 00       	jmp    c0003722 <alloc_smap_bit+0x180>
c0003602:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0003605:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003608:	01 d0                	add    %edx,%eax
c000360a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000360d:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003612:	83 ec 0c             	sub    $0xc,%esp
c0003615:	6a 07                	push   $0x7
c0003617:	68 00 02 00 00       	push   $0x200
c000361c:	50                   	push   %eax
c000361d:	ff 75 d8             	pushl  -0x28(%ebp)
c0003620:	ff 75 d4             	pushl  -0x2c(%ebp)
c0003623:	e8 d4 f0 ff ff       	call   c00026fc <rd_wt>
c0003628:	83 c4 20             	add    $0x20,%esp
c000362b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0003632:	e9 b0 00 00 00       	jmp    c00036e7 <alloc_smap_bit+0x145>
c0003637:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000363e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003642:	0f 85 8c 00 00 00    	jne    c00036d4 <alloc_smap_bit+0x132>
c0003648:	eb 45                	jmp    c000368f <alloc_smap_bit+0xed>
c000364a:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003650:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003653:	01 d0                	add    %edx,%eax
c0003655:	0f b6 00             	movzbl (%eax),%eax
c0003658:	0f be d0             	movsbl %al,%edx
c000365b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000365e:	89 c1                	mov    %eax,%ecx
c0003660:	d3 fa                	sar    %cl,%edx
c0003662:	89 d0                	mov    %edx,%eax
c0003664:	83 e0 01             	and    $0x1,%eax
c0003667:	85 c0                	test   %eax,%eax
c0003669:	74 06                	je     c0003671 <alloc_smap_bit+0xcf>
c000366b:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c000366f:	eb 1e                	jmp    c000368f <alloc_smap_bit+0xed>
c0003671:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003674:	c1 e0 09             	shl    $0x9,%eax
c0003677:	89 c2                	mov    %eax,%edx
c0003679:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000367c:	01 d0                	add    %edx,%eax
c000367e:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0003685:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003688:	01 d0                	add    %edx,%eax
c000368a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000368d:	eb 06                	jmp    c0003695 <alloc_smap_bit+0xf3>
c000368f:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0003693:	7e b5                	jle    c000364a <alloc_smap_bit+0xa8>
c0003695:	eb 3d                	jmp    c00036d4 <alloc_smap_bit+0x132>
c0003697:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000369b:	74 45                	je     c00036e2 <alloc_smap_bit+0x140>
c000369d:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c00036a3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00036a6:	01 d0                	add    %edx,%eax
c00036a8:	0f b6 18             	movzbl (%eax),%ebx
c00036ab:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00036ae:	ba 01 00 00 00       	mov    $0x1,%edx
c00036b3:	89 c1                	mov    %eax,%ecx
c00036b5:	d3 e2                	shl    %cl,%edx
c00036b7:	89 d0                	mov    %edx,%eax
c00036b9:	89 c1                	mov    %eax,%ecx
c00036bb:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c00036c1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00036c4:	01 d0                	add    %edx,%eax
c00036c6:	09 cb                	or     %ecx,%ebx
c00036c8:	89 da                	mov    %ebx,%edx
c00036ca:	88 10                	mov    %dl,(%eax)
c00036cc:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c00036d0:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c00036d4:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00036d8:	74 09                	je     c00036e3 <alloc_smap_bit+0x141>
c00036da:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c00036de:	7e b7                	jle    c0003697 <alloc_smap_bit+0xf5>
c00036e0:	eb 01                	jmp    c00036e3 <alloc_smap_bit+0x141>
c00036e2:	90                   	nop
c00036e3:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c00036e7:	81 7d ec ff 01 00 00 	cmpl   $0x1ff,-0x14(%ebp)
c00036ee:	0f 8e 43 ff ff ff    	jle    c0003637 <alloc_smap_bit+0x95>
c00036f4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00036f8:	74 1e                	je     c0003718 <alloc_smap_bit+0x176>
c00036fa:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00036ff:	83 ec 0c             	sub    $0xc,%esp
c0003702:	6a 0a                	push   $0xa
c0003704:	68 00 02 00 00       	push   $0x200
c0003709:	50                   	push   %eax
c000370a:	ff 75 d8             	pushl  -0x28(%ebp)
c000370d:	ff 75 d4             	pushl  -0x2c(%ebp)
c0003710:	e8 e7 ef ff ff       	call   c00026fc <rd_wt>
c0003715:	83 c4 20             	add    $0x20,%esp
c0003718:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000371c:	74 12                	je     c0003730 <alloc_smap_bit+0x18e>
c000371e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0003722:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003725:	3b 45 e0             	cmp    -0x20(%ebp),%eax
c0003728:	0f 8c d4 fe ff ff    	jl     c0003602 <alloc_smap_bit+0x60>
c000372e:	eb 01                	jmp    c0003731 <alloc_smap_bit+0x18f>
c0003730:	90                   	nop
c0003731:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003734:	8d 50 ff             	lea    -0x1(%eax),%edx
c0003737:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000373a:	8b 00                	mov    (%eax),%eax
c000373c:	01 d0                	add    %edx,%eax
c000373e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0003741:	c9                   	leave  
c0003742:	c3                   	ret    

c0003743 <new_inode>:
c0003743:	55                   	push   %ebp
c0003744:	89 e5                	mov    %esp,%ebp
c0003746:	83 ec 38             	sub    $0x38,%esp
c0003749:	83 ec 08             	sub    $0x8,%esp
c000374c:	ff 75 0c             	pushl  0xc(%ebp)
c000374f:	8d 45 c8             	lea    -0x38(%ebp),%eax
c0003752:	50                   	push   %eax
c0003753:	e8 80 fa ff ff       	call   c00031d8 <get_inode>
c0003758:	83 c4 10             	add    $0x10,%esp
c000375b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000375e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0003762:	75 0a                	jne    c000376e <new_inode+0x2b>
c0003764:	b8 00 00 00 00       	mov    $0x0,%eax
c0003769:	e9 f1 00 00 00       	jmp    c000385f <new_inode+0x11c>
c000376e:	8b 45 10             	mov    0x10(%ebp),%eax
c0003771:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003774:	c7 45 d4 00 08 00 00 	movl   $0x800,-0x2c(%ebp)
c000377b:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0003782:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
c0003789:	8b 45 0c             	mov    0xc(%ebp),%eax
c000378c:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000378f:	83 ec 0c             	sub    $0xc,%esp
c0003792:	8d 45 c8             	lea    -0x38(%ebp),%eax
c0003795:	50                   	push   %eax
c0003796:	e8 39 0b 00 00       	call   c00042d4 <sync_inode>
c000379b:	83 c4 10             	add    $0x10,%esp
c000379e:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c00037a5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00037ac:	eb 1d                	jmp    c00037cb <new_inode+0x88>
c00037ae:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00037b1:	89 d0                	mov    %edx,%eax
c00037b3:	c1 e0 02             	shl    $0x2,%eax
c00037b6:	01 d0                	add    %edx,%eax
c00037b8:	c1 e0 03             	shl    $0x3,%eax
c00037bb:	05 b0 27 01 c0       	add    $0xc00127b0,%eax
c00037c0:	8b 00                	mov    (%eax),%eax
c00037c2:	39 45 0c             	cmp    %eax,0xc(%ebp)
c00037c5:	74 0c                	je     c00037d3 <new_inode+0x90>
c00037c7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00037cb:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c00037cf:	7e dd                	jle    c00037ae <new_inode+0x6b>
c00037d1:	eb 01                	jmp    c00037d4 <new_inode+0x91>
c00037d3:	90                   	nop
c00037d4:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00037d7:	89 d0                	mov    %edx,%eax
c00037d9:	c1 e0 02             	shl    $0x2,%eax
c00037dc:	01 d0                	add    %edx,%eax
c00037de:	c1 e0 03             	shl    $0x3,%eax
c00037e1:	05 a0 27 01 c0       	add    $0xc00127a0,%eax
c00037e6:	8b 55 c8             	mov    -0x38(%ebp),%edx
c00037e9:	89 10                	mov    %edx,(%eax)
c00037eb:	8b 55 cc             	mov    -0x34(%ebp),%edx
c00037ee:	89 50 04             	mov    %edx,0x4(%eax)
c00037f1:	8b 55 d0             	mov    -0x30(%ebp),%edx
c00037f4:	89 50 08             	mov    %edx,0x8(%eax)
c00037f7:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c00037fa:	89 50 0c             	mov    %edx,0xc(%eax)
c00037fd:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0003800:	89 50 10             	mov    %edx,0x10(%eax)
c0003803:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0003806:	89 50 14             	mov    %edx,0x14(%eax)
c0003809:	8b 55 e0             	mov    -0x20(%ebp),%edx
c000380c:	89 50 18             	mov    %edx,0x18(%eax)
c000380f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0003812:	89 50 1c             	mov    %edx,0x1c(%eax)
c0003815:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0003818:	89 50 20             	mov    %edx,0x20(%eax)
c000381b:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000381e:	89 50 24             	mov    %edx,0x24(%eax)
c0003821:	8b 45 08             	mov    0x8(%ebp),%eax
c0003824:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0003827:	89 10                	mov    %edx,(%eax)
c0003829:	8b 55 cc             	mov    -0x34(%ebp),%edx
c000382c:	89 50 04             	mov    %edx,0x4(%eax)
c000382f:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0003832:	89 50 08             	mov    %edx,0x8(%eax)
c0003835:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0003838:	89 50 0c             	mov    %edx,0xc(%eax)
c000383b:	8b 55 d8             	mov    -0x28(%ebp),%edx
c000383e:	89 50 10             	mov    %edx,0x10(%eax)
c0003841:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0003844:	89 50 14             	mov    %edx,0x14(%eax)
c0003847:	8b 55 e0             	mov    -0x20(%ebp),%edx
c000384a:	89 50 18             	mov    %edx,0x18(%eax)
c000384d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0003850:	89 50 1c             	mov    %edx,0x1c(%eax)
c0003853:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0003856:	89 50 20             	mov    %edx,0x20(%eax)
c0003859:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000385c:	89 50 24             	mov    %edx,0x24(%eax)
c000385f:	c9                   	leave  
c0003860:	c3                   	ret    

c0003861 <new_dir_entry>:
c0003861:	55                   	push   %ebp
c0003862:	89 e5                	mov    %esp,%ebp
c0003864:	83 ec 48             	sub    $0x48,%esp
c0003867:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
c000386e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003871:	8b 40 04             	mov    0x4(%eax),%eax
c0003874:	99                   	cltd   
c0003875:	f7 7d dc             	idivl  -0x24(%ebp)
c0003878:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000387b:	8b 45 0c             	mov    0xc(%ebp),%eax
c000387e:	8b 40 0c             	mov    0xc(%eax),%eax
c0003881:	99                   	cltd   
c0003882:	f7 7d dc             	idivl  -0x24(%ebp)
c0003885:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0003888:	e8 2b 0c 00 00       	call   c00044b8 <get_super_block>
c000388d:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003890:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0003893:	8b 00                	mov    (%eax),%eax
c0003895:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0003898:	8b 45 0c             	mov    0xc(%ebp),%eax
c000389b:	8b 40 0c             	mov    0xc(%eax),%eax
c000389e:	05 00 02 00 00       	add    $0x200,%eax
c00038a3:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c00038a9:	85 c0                	test   %eax,%eax
c00038ab:	0f 48 c2             	cmovs  %edx,%eax
c00038ae:	c1 f8 09             	sar    $0x9,%eax
c00038b1:	89 45 c8             	mov    %eax,-0x38(%ebp)
c00038b4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00038bb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c00038c2:	c7 45 c4 20 00 00 00 	movl   $0x20,-0x3c(%ebp)
c00038c9:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00038d0:	eb 7f                	jmp    c0003951 <new_dir_entry+0xf0>
c00038d2:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00038d7:	89 c1                	mov    %eax,%ecx
c00038d9:	8b 55 cc             	mov    -0x34(%ebp),%edx
c00038dc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00038df:	01 d0                	add    %edx,%eax
c00038e1:	83 ec 0c             	sub    $0xc,%esp
c00038e4:	6a 07                	push   $0x7
c00038e6:	68 00 02 00 00       	push   $0x200
c00038eb:	51                   	push   %ecx
c00038ec:	ff 75 c4             	pushl  -0x3c(%ebp)
c00038ef:	50                   	push   %eax
c00038f0:	e8 07 ee ff ff       	call   c00026fc <rd_wt>
c00038f5:	83 c4 20             	add    $0x20,%esp
c00038f8:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c00038fd:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0003900:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0003907:	eb 25                	jmp    c000392e <new_dir_entry+0xcd>
c0003909:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c000390d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003910:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0003913:	7f 29                	jg     c000393e <new_dir_entry+0xdd>
c0003915:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003918:	8b 00                	mov    (%eax),%eax
c000391a:	85 c0                	test   %eax,%eax
c000391c:	75 08                	jne    c0003926 <new_dir_entry+0xc5>
c000391e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003921:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003924:	eb 19                	jmp    c000393f <new_dir_entry+0xde>
c0003926:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c000392a:	83 45 f0 10          	addl   $0x10,-0x10(%ebp)
c000392e:	b8 00 02 00 00       	mov    $0x200,%eax
c0003933:	99                   	cltd   
c0003934:	f7 7d dc             	idivl  -0x24(%ebp)
c0003937:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c000393a:	7c cd                	jl     c0003909 <new_dir_entry+0xa8>
c000393c:	eb 01                	jmp    c000393f <new_dir_entry+0xde>
c000393e:	90                   	nop
c000393f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003942:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0003945:	7f 16                	jg     c000395d <new_dir_entry+0xfc>
c0003947:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000394b:	75 10                	jne    c000395d <new_dir_entry+0xfc>
c000394d:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0003951:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003954:	3b 45 c8             	cmp    -0x38(%ebp),%eax
c0003957:	0f 8c 75 ff ff ff    	jl     c00038d2 <new_dir_entry+0x71>
c000395d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0003960:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
c0003963:	75 0a                	jne    c000396f <new_dir_entry+0x10e>
c0003965:	b8 00 00 00 00       	mov    $0x0,%eax
c000396a:	e9 fc 00 00 00       	jmp    c0003a6b <new_dir_entry+0x20a>
c000396f:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0003976:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000397a:	75 1e                	jne    c000399a <new_dir_entry+0x139>
c000397c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000397f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003982:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003985:	8b 50 04             	mov    0x4(%eax),%edx
c0003988:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000398b:	01 c2                	add    %eax,%edx
c000398d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003990:	89 50 04             	mov    %edx,0x4(%eax)
c0003993:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c000399a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000399d:	8b 55 14             	mov    0x14(%ebp),%edx
c00039a0:	89 10                	mov    %edx,(%eax)
c00039a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00039a5:	83 c0 04             	add    $0x4,%eax
c00039a8:	83 ec 08             	sub    $0x8,%esp
c00039ab:	ff 75 10             	pushl  0x10(%ebp)
c00039ae:	50                   	push   %eax
c00039af:	e8 aa 84 00 00       	call   c000be5e <Strcpy>
c00039b4:	83 c4 10             	add    $0x10,%esp
c00039b7:	8b 45 08             	mov    0x8(%ebp),%eax
c00039ba:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00039bd:	8b 0a                	mov    (%edx),%ecx
c00039bf:	89 08                	mov    %ecx,(%eax)
c00039c1:	8b 4a 04             	mov    0x4(%edx),%ecx
c00039c4:	89 48 04             	mov    %ecx,0x4(%eax)
c00039c7:	8b 4a 08             	mov    0x8(%edx),%ecx
c00039ca:	89 48 08             	mov    %ecx,0x8(%eax)
c00039cd:	8b 52 0c             	mov    0xc(%edx),%edx
c00039d0:	89 50 0c             	mov    %edx,0xc(%eax)
c00039d3:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00039d8:	89 c1                	mov    %eax,%ecx
c00039da:	8b 55 cc             	mov    -0x34(%ebp),%edx
c00039dd:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00039e0:	01 d0                	add    %edx,%eax
c00039e2:	83 ec 0c             	sub    $0xc,%esp
c00039e5:	6a 0a                	push   $0xa
c00039e7:	68 00 02 00 00       	push   $0x200
c00039ec:	51                   	push   %ecx
c00039ed:	ff 75 c4             	pushl  -0x3c(%ebp)
c00039f0:	50                   	push   %eax
c00039f1:	e8 06 ed ff ff       	call   c00026fc <rd_wt>
c00039f6:	83 c4 20             	add    $0x20,%esp
c00039f9:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c00039fd:	74 69                	je     c0003a68 <new_dir_entry+0x207>
c00039ff:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003a02:	8b 10                	mov    (%eax),%edx
c0003a04:	89 15 c0 31 01 c0    	mov    %edx,0xc00131c0
c0003a0a:	8b 50 04             	mov    0x4(%eax),%edx
c0003a0d:	89 15 c4 31 01 c0    	mov    %edx,0xc00131c4
c0003a13:	8b 50 08             	mov    0x8(%eax),%edx
c0003a16:	89 15 c8 31 01 c0    	mov    %edx,0xc00131c8
c0003a1c:	8b 50 0c             	mov    0xc(%eax),%edx
c0003a1f:	89 15 cc 31 01 c0    	mov    %edx,0xc00131cc
c0003a25:	8b 50 10             	mov    0x10(%eax),%edx
c0003a28:	89 15 d0 31 01 c0    	mov    %edx,0xc00131d0
c0003a2e:	8b 50 14             	mov    0x14(%eax),%edx
c0003a31:	89 15 d4 31 01 c0    	mov    %edx,0xc00131d4
c0003a37:	8b 50 18             	mov    0x18(%eax),%edx
c0003a3a:	89 15 d8 31 01 c0    	mov    %edx,0xc00131d8
c0003a40:	8b 50 1c             	mov    0x1c(%eax),%edx
c0003a43:	89 15 dc 31 01 c0    	mov    %edx,0xc00131dc
c0003a49:	8b 50 20             	mov    0x20(%eax),%edx
c0003a4c:	89 15 e0 31 01 c0    	mov    %edx,0xc00131e0
c0003a52:	8b 40 24             	mov    0x24(%eax),%eax
c0003a55:	a3 e4 31 01 c0       	mov    %eax,0xc00131e4
c0003a5a:	83 ec 0c             	sub    $0xc,%esp
c0003a5d:	ff 75 0c             	pushl  0xc(%ebp)
c0003a60:	e8 6f 08 00 00       	call   c00042d4 <sync_inode>
c0003a65:	83 c4 10             	add    $0x10,%esp
c0003a68:	8b 45 08             	mov    0x8(%ebp),%eax
c0003a6b:	c9                   	leave  
c0003a6c:	c3                   	ret    

c0003a6d <do_unlink>:
c0003a6d:	55                   	push   %ebp
c0003a6e:	89 e5                	mov    %esp,%ebp
c0003a70:	53                   	push   %ebx
c0003a71:	81 ec a4 00 00 00    	sub    $0xa4,%esp
c0003a77:	83 ec 08             	sub    $0x8,%esp
c0003a7a:	ff 75 08             	pushl  0x8(%ebp)
c0003a7d:	68 49 b3 00 c0       	push   $0xc000b349
c0003a82:	e8 b9 68 00 00       	call   c000a340 <strcmp>
c0003a87:	83 c4 10             	add    $0x10,%esp
c0003a8a:	85 c0                	test   %eax,%eax
c0003a8c:	75 10                	jne    c0003a9e <do_unlink+0x31>
c0003a8e:	83 ec 0c             	sub    $0xc,%esp
c0003a91:	68 4b b3 00 c0       	push   $0xc000b34b
c0003a96:	e8 e2 5b 00 00       	call   c000967d <panic>
c0003a9b:	83 c4 10             	add    $0x10,%esp
c0003a9e:	83 ec 0c             	sub    $0xc,%esp
c0003aa1:	ff 75 08             	pushl  0x8(%ebp)
c0003aa4:	e8 31 f5 ff ff       	call   c0002fda <search_file>
c0003aa9:	83 c4 10             	add    $0x10,%esp
c0003aac:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003aaf:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0003ab3:	75 10                	jne    c0003ac5 <do_unlink+0x58>
c0003ab5:	83 ec 0c             	sub    $0xc,%esp
c0003ab8:	68 67 b3 00 c0       	push   $0xc000b367
c0003abd:	e8 bb 5b 00 00       	call   c000967d <panic>
c0003ac2:	83 c4 10             	add    $0x10,%esp
c0003ac5:	83 ec 08             	sub    $0x8,%esp
c0003ac8:	ff 75 d0             	pushl  -0x30(%ebp)
c0003acb:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0003ad1:	50                   	push   %eax
c0003ad2:	e8 01 f7 ff ff       	call   c00031d8 <get_inode>
c0003ad7:	83 c4 10             	add    $0x10,%esp
c0003ada:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0003add:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0003ae1:	75 10                	jne    c0003af3 <do_unlink+0x86>
c0003ae3:	83 ec 0c             	sub    $0xc,%esp
c0003ae6:	68 67 b3 00 c0       	push   $0xc000b367
c0003aeb:	e8 8d 5b 00 00       	call   c000967d <panic>
c0003af0:	83 c4 10             	add    $0x10,%esp
c0003af3:	8b 45 88             	mov    -0x78(%ebp),%eax
c0003af6:	85 c0                	test   %eax,%eax
c0003af8:	7e 10                	jle    c0003b0a <do_unlink+0x9d>
c0003afa:	83 ec 0c             	sub    $0xc,%esp
c0003afd:	68 80 b3 00 c0       	push   $0xc000b380
c0003b02:	e8 76 5b 00 00       	call   c000967d <panic>
c0003b07:	83 c4 10             	add    $0x10,%esp
c0003b0a:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0003b10:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0003b13:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0003b16:	8d 50 07             	lea    0x7(%eax),%edx
c0003b19:	85 c0                	test   %eax,%eax
c0003b1b:	0f 48 c2             	cmovs  %edx,%eax
c0003b1e:	c1 f8 03             	sar    $0x3,%eax
c0003b21:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0003b24:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0003b27:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0003b2d:	85 c0                	test   %eax,%eax
c0003b2f:	0f 48 c2             	cmovs  %edx,%eax
c0003b32:	c1 f8 09             	sar    $0x9,%eax
c0003b35:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0003b38:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0003b3b:	99                   	cltd   
c0003b3c:	c1 ea 1d             	shr    $0x1d,%edx
c0003b3f:	01 d0                	add    %edx,%eax
c0003b41:	83 e0 07             	and    $0x7,%eax
c0003b44:	29 d0                	sub    %edx,%eax
c0003b46:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0003b49:	c7 45 b8 20 00 00 00 	movl   $0x20,-0x48(%ebp)
c0003b50:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003b55:	89 c2                	mov    %eax,%edx
c0003b57:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0003b5a:	83 c0 02             	add    $0x2,%eax
c0003b5d:	83 ec 0c             	sub    $0xc,%esp
c0003b60:	6a 07                	push   $0x7
c0003b62:	68 00 02 00 00       	push   $0x200
c0003b67:	52                   	push   %edx
c0003b68:	ff 75 b8             	pushl  -0x48(%ebp)
c0003b6b:	50                   	push   %eax
c0003b6c:	e8 8b eb ff ff       	call   c00026fc <rd_wt>
c0003b71:	83 c4 20             	add    $0x20,%esp
c0003b74:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003b7a:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0003b7d:	01 d0                	add    %edx,%eax
c0003b7f:	0f b6 10             	movzbl (%eax),%edx
c0003b82:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0003b85:	bb 01 00 00 00       	mov    $0x1,%ebx
c0003b8a:	89 c1                	mov    %eax,%ecx
c0003b8c:	d3 e3                	shl    %cl,%ebx
c0003b8e:	89 d8                	mov    %ebx,%eax
c0003b90:	f7 d0                	not    %eax
c0003b92:	89 c3                	mov    %eax,%ebx
c0003b94:	8b 0d a4 31 01 c0    	mov    0xc00131a4,%ecx
c0003b9a:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0003b9d:	01 c8                	add    %ecx,%eax
c0003b9f:	21 da                	and    %ebx,%edx
c0003ba1:	88 10                	mov    %dl,(%eax)
c0003ba3:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003ba8:	89 c2                	mov    %eax,%edx
c0003baa:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0003bad:	83 c0 02             	add    $0x2,%eax
c0003bb0:	83 ec 0c             	sub    $0xc,%esp
c0003bb3:	6a 0a                	push   $0xa
c0003bb5:	68 00 02 00 00       	push   $0x200
c0003bba:	52                   	push   %edx
c0003bbb:	ff 75 b8             	pushl  -0x48(%ebp)
c0003bbe:	50                   	push   %eax
c0003bbf:	e8 38 eb ff ff       	call   c00026fc <rd_wt>
c0003bc4:	83 c4 20             	add    $0x20,%esp
c0003bc7:	e8 ec 08 00 00       	call   c00044b8 <get_super_block>
c0003bcc:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0003bcf:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0003bd5:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0003bd8:	8b 00                	mov    (%eax),%eax
c0003bda:	29 c2                	sub    %eax,%edx
c0003bdc:	89 d0                	mov    %edx,%eax
c0003bde:	83 c0 01             	add    $0x1,%eax
c0003be1:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0003be4:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0003be7:	8d 50 07             	lea    0x7(%eax),%edx
c0003bea:	85 c0                	test   %eax,%eax
c0003bec:	0f 48 c2             	cmovs  %edx,%eax
c0003bef:	c1 f8 03             	sar    $0x3,%eax
c0003bf2:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0003bf5:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0003bf8:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0003bfe:	85 c0                	test   %eax,%eax
c0003c00:	0f 48 c2             	cmovs  %edx,%eax
c0003c03:	c1 f8 09             	sar    $0x9,%eax
c0003c06:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0003c09:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0003c0c:	99                   	cltd   
c0003c0d:	c1 ea 1d             	shr    $0x1d,%edx
c0003c10:	01 d0                	add    %edx,%eax
c0003c12:	83 e0 07             	and    $0x7,%eax
c0003c15:	29 d0                	sub    %edx,%eax
c0003c17:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0003c1a:	b8 08 00 00 00       	mov    $0x8,%eax
c0003c1f:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c0003c22:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0003c25:	29 c2                	sub    %eax,%edx
c0003c27:	89 d0                	mov    %edx,%eax
c0003c29:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003c2c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003c2f:	8d 50 07             	lea    0x7(%eax),%edx
c0003c32:	85 c0                	test   %eax,%eax
c0003c34:	0f 48 c2             	cmovs  %edx,%eax
c0003c37:	c1 f8 03             	sar    $0x3,%eax
c0003c3a:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0003c3d:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003c42:	89 c1                	mov    %eax,%ecx
c0003c44:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0003c47:	8b 40 04             	mov    0x4(%eax),%eax
c0003c4a:	8d 50 02             	lea    0x2(%eax),%edx
c0003c4d:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0003c50:	01 d0                	add    %edx,%eax
c0003c52:	83 ec 0c             	sub    $0xc,%esp
c0003c55:	6a 07                	push   $0x7
c0003c57:	68 00 02 00 00       	push   $0x200
c0003c5c:	51                   	push   %ecx
c0003c5d:	ff 75 b8             	pushl  -0x48(%ebp)
c0003c60:	50                   	push   %eax
c0003c61:	e8 96 ea ff ff       	call   c00026fc <rd_wt>
c0003c66:	83 c4 20             	add    $0x20,%esp
c0003c69:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003c6f:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0003c72:	01 d0                	add    %edx,%eax
c0003c74:	0f b6 10             	movzbl (%eax),%edx
c0003c77:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0003c7a:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0003c7f:	89 c1                	mov    %eax,%ecx
c0003c81:	d3 e3                	shl    %cl,%ebx
c0003c83:	89 d8                	mov    %ebx,%eax
c0003c85:	f7 d0                	not    %eax
c0003c87:	89 c3                	mov    %eax,%ebx
c0003c89:	8b 0d a4 31 01 c0    	mov    0xc00131a4,%ecx
c0003c8f:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0003c92:	01 c8                	add    %ecx,%eax
c0003c94:	21 da                	and    %ebx,%edx
c0003c96:	88 10                	mov    %dl,(%eax)
c0003c98:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0003c9f:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0003ca2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0003ca5:	eb 6b                	jmp    c0003d12 <do_unlink+0x2a5>
c0003ca7:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0003cae:	75 4c                	jne    c0003cfc <do_unlink+0x28f>
c0003cb0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0003cb7:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003cbc:	83 ec 0c             	sub    $0xc,%esp
c0003cbf:	6a 0a                	push   $0xa
c0003cc1:	68 00 02 00 00       	push   $0x200
c0003cc6:	50                   	push   %eax
c0003cc7:	ff 75 b8             	pushl  -0x48(%ebp)
c0003cca:	ff 75 ec             	pushl  -0x14(%ebp)
c0003ccd:	e8 2a ea ff ff       	call   c00026fc <rd_wt>
c0003cd2:	83 c4 20             	add    $0x20,%esp
c0003cd5:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003cda:	89 c1                	mov    %eax,%ecx
c0003cdc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003cdf:	8d 50 01             	lea    0x1(%eax),%edx
c0003ce2:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0003ce5:	83 ec 0c             	sub    $0xc,%esp
c0003ce8:	6a 07                	push   $0x7
c0003cea:	68 00 02 00 00       	push   $0x200
c0003cef:	51                   	push   %ecx
c0003cf0:	ff 75 b8             	pushl  -0x48(%ebp)
c0003cf3:	50                   	push   %eax
c0003cf4:	e8 03 ea ff ff       	call   c00026fc <rd_wt>
c0003cf9:	83 c4 20             	add    $0x20,%esp
c0003cfc:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003d02:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003d05:	01 d0                	add    %edx,%eax
c0003d07:	c6 00 00             	movb   $0x0,(%eax)
c0003d0a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0003d0e:	83 6d f4 08          	subl   $0x8,-0xc(%ebp)
c0003d12:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003d15:	3b 45 a0             	cmp    -0x60(%ebp),%eax
c0003d18:	7c 8d                	jl     c0003ca7 <do_unlink+0x23a>
c0003d1a:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0003d21:	75 4c                	jne    c0003d6f <do_unlink+0x302>
c0003d23:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0003d2a:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003d2f:	83 ec 0c             	sub    $0xc,%esp
c0003d32:	6a 0a                	push   $0xa
c0003d34:	68 00 02 00 00       	push   $0x200
c0003d39:	50                   	push   %eax
c0003d3a:	ff 75 b8             	pushl  -0x48(%ebp)
c0003d3d:	ff 75 ec             	pushl  -0x14(%ebp)
c0003d40:	e8 b7 e9 ff ff       	call   c00026fc <rd_wt>
c0003d45:	83 c4 20             	add    $0x20,%esp
c0003d48:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003d4d:	89 c1                	mov    %eax,%ecx
c0003d4f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003d52:	8d 50 01             	lea    0x1(%eax),%edx
c0003d55:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0003d58:	83 ec 0c             	sub    $0xc,%esp
c0003d5b:	6a 07                	push   $0x7
c0003d5d:	68 00 02 00 00       	push   $0x200
c0003d62:	51                   	push   %ecx
c0003d63:	ff 75 b8             	pushl  -0x48(%ebp)
c0003d66:	50                   	push   %eax
c0003d67:	e8 90 e9 ff ff       	call   c00026fc <rd_wt>
c0003d6c:	83 c4 20             	add    $0x20,%esp
c0003d6f:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003d75:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003d78:	01 d0                	add    %edx,%eax
c0003d7a:	0f b6 10             	movzbl (%eax),%edx
c0003d7d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003d80:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0003d85:	89 c1                	mov    %eax,%ecx
c0003d87:	d3 e3                	shl    %cl,%ebx
c0003d89:	89 d8                	mov    %ebx,%eax
c0003d8b:	89 c3                	mov    %eax,%ebx
c0003d8d:	8b 0d a4 31 01 c0    	mov    0xc00131a4,%ecx
c0003d93:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003d96:	01 c8                	add    %ecx,%eax
c0003d98:	21 da                	and    %ebx,%edx
c0003d9a:	88 10                	mov    %dl,(%eax)
c0003d9c:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003da1:	83 ec 0c             	sub    $0xc,%esp
c0003da4:	6a 0a                	push   $0xa
c0003da6:	68 00 02 00 00       	push   $0x200
c0003dab:	50                   	push   %eax
c0003dac:	ff 75 b8             	pushl  -0x48(%ebp)
c0003daf:	ff 75 ec             	pushl  -0x14(%ebp)
c0003db2:	e8 45 e9 ff ff       	call   c00026fc <rd_wt>
c0003db7:	83 c4 20             	add    $0x20,%esp
c0003dba:	c7 85 6c ff ff ff 00 	movl   $0x0,-0x94(%ebp)
c0003dc1:	00 00 00 
c0003dc4:	c7 85 68 ff ff ff 00 	movl   $0x0,-0x98(%ebp)
c0003dcb:	00 00 00 
c0003dce:	c7 85 70 ff ff ff 00 	movl   $0x0,-0x90(%ebp)
c0003dd5:	00 00 00 
c0003dd8:	83 ec 0c             	sub    $0xc,%esp
c0003ddb:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0003de1:	50                   	push   %eax
c0003de2:	e8 ed 04 00 00       	call   c00042d4 <sync_inode>
c0003de7:	83 c4 10             	add    $0x10,%esp
c0003dea:	83 ec 0c             	sub    $0xc,%esp
c0003ded:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0003df3:	50                   	push   %eax
c0003df4:	e8 2f 06 00 00       	call   c0004428 <put_inode>
c0003df9:	83 c4 10             	add    $0x10,%esp
c0003dfc:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0003dff:	8b 00                	mov    (%eax),%eax
c0003e01:	89 45 9c             	mov    %eax,-0x64(%ebp)
c0003e04:	c7 45 98 c0 31 01 c0 	movl   $0xc00131c0,-0x68(%ebp)
c0003e0b:	8b 45 98             	mov    -0x68(%ebp),%eax
c0003e0e:	8b 40 04             	mov    0x4(%eax),%eax
c0003e11:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0003e14:	8b 45 98             	mov    -0x68(%ebp),%eax
c0003e17:	8b 40 0c             	mov    0xc(%eax),%eax
c0003e1a:	89 45 90             	mov    %eax,-0x70(%ebp)
c0003e1d:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0003e20:	c1 e8 04             	shr    $0x4,%eax
c0003e23:	89 45 8c             	mov    %eax,-0x74(%ebp)
c0003e26:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0003e2d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0003e34:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0003e3b:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0003e42:	e9 a5 00 00 00       	jmp    c0003eec <do_unlink+0x47f>
c0003e47:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003e4c:	89 c1                	mov    %eax,%ecx
c0003e4e:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0003e51:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0003e54:	01 d0                	add    %edx,%eax
c0003e56:	83 ec 0c             	sub    $0xc,%esp
c0003e59:	6a 07                	push   $0x7
c0003e5b:	68 00 02 00 00       	push   $0x200
c0003e60:	51                   	push   %ecx
c0003e61:	ff 75 b8             	pushl  -0x48(%ebp)
c0003e64:	50                   	push   %eax
c0003e65:	e8 92 e8 ff ff       	call   c00026fc <rd_wt>
c0003e6a:	83 c4 20             	add    $0x20,%esp
c0003e6d:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0003e72:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0003e75:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0003e7c:	eb 51                	jmp    c0003ecf <do_unlink+0x462>
c0003e7e:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0003e82:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003e85:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0003e88:	7f 4f                	jg     c0003ed9 <do_unlink+0x46c>
c0003e8a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0003e8d:	83 c0 10             	add    $0x10,%eax
c0003e90:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0003e93:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0003e96:	83 c0 04             	add    $0x4,%eax
c0003e99:	83 ec 08             	sub    $0x8,%esp
c0003e9c:	ff 75 08             	pushl  0x8(%ebp)
c0003e9f:	50                   	push   %eax
c0003ea0:	e8 9b 64 00 00       	call   c000a340 <strcmp>
c0003ea5:	83 c4 10             	add    $0x10,%esp
c0003ea8:	85 c0                	test   %eax,%eax
c0003eaa:	75 1b                	jne    c0003ec7 <do_unlink+0x45a>
c0003eac:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c0003eb3:	83 ec 04             	sub    $0x4,%esp
c0003eb6:	6a 10                	push   $0x10
c0003eb8:	6a 00                	push   $0x0
c0003eba:	ff 75 d4             	pushl  -0x2c(%ebp)
c0003ebd:	e8 7d 7f 00 00       	call   c000be3f <Memset>
c0003ec2:	83 c4 10             	add    $0x10,%esp
c0003ec5:	eb 13                	jmp    c0003eda <do_unlink+0x46d>
c0003ec7:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
c0003ecb:	83 45 d4 10          	addl   $0x10,-0x2c(%ebp)
c0003ecf:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0003ed2:	3b 45 90             	cmp    -0x70(%ebp),%eax
c0003ed5:	7c a7                	jl     c0003e7e <do_unlink+0x411>
c0003ed7:	eb 01                	jmp    c0003eda <do_unlink+0x46d>
c0003ed9:	90                   	nop
c0003eda:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003edd:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0003ee0:	7f 16                	jg     c0003ef8 <do_unlink+0x48b>
c0003ee2:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0003ee6:	75 10                	jne    c0003ef8 <do_unlink+0x48b>
c0003ee8:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
c0003eec:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0003eef:	3b 45 90             	cmp    -0x70(%ebp),%eax
c0003ef2:	0f 8c 4f ff ff ff    	jl     c0003e47 <do_unlink+0x3da>
c0003ef8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003efb:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0003efe:	75 17                	jne    c0003f17 <do_unlink+0x4aa>
c0003f00:	8b 45 98             	mov    -0x68(%ebp),%eax
c0003f03:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0003f06:	89 50 04             	mov    %edx,0x4(%eax)
c0003f09:	83 ec 0c             	sub    $0xc,%esp
c0003f0c:	ff 75 98             	pushl  -0x68(%ebp)
c0003f0f:	e8 c0 03 00 00       	call   c00042d4 <sync_inode>
c0003f14:	83 c4 10             	add    $0x10,%esp
c0003f17:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0003f1b:	74 26                	je     c0003f43 <do_unlink+0x4d6>
c0003f1d:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003f22:	89 c1                	mov    %eax,%ecx
c0003f24:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0003f27:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003f2a:	01 d0                	add    %edx,%eax
c0003f2c:	83 ec 0c             	sub    $0xc,%esp
c0003f2f:	6a 0a                	push   $0xa
c0003f31:	68 00 02 00 00       	push   $0x200
c0003f36:	51                   	push   %ecx
c0003f37:	ff 75 b8             	pushl  -0x48(%ebp)
c0003f3a:	50                   	push   %eax
c0003f3b:	e8 bc e7 ff ff       	call   c00026fc <rd_wt>
c0003f40:	83 c4 20             	add    $0x20,%esp
c0003f43:	90                   	nop
c0003f44:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0003f47:	c9                   	leave  
c0003f48:	c3                   	ret    

c0003f49 <do_rdwt>:
c0003f49:	55                   	push   %ebp
c0003f4a:	89 e5                	mov    %esp,%ebp
c0003f4c:	81 ec 98 00 00 00    	sub    $0x98,%esp
c0003f52:	8b 45 08             	mov    0x8(%ebp),%eax
c0003f55:	8b 40 78             	mov    0x78(%eax),%eax
c0003f58:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0003f5b:	8b 45 08             	mov    0x8(%ebp),%eax
c0003f5e:	8b 40 60             	mov    0x60(%eax),%eax
c0003f61:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0003f64:	8b 45 08             	mov    0x8(%ebp),%eax
c0003f67:	8b 40 6c             	mov    0x6c(%eax),%eax
c0003f6a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0003f6d:	8b 45 08             	mov    0x8(%ebp),%eax
c0003f70:	8b 00                	mov    (%eax),%eax
c0003f72:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003f75:	8b 45 08             	mov    0x8(%ebp),%eax
c0003f78:	8b 40 10             	mov    0x10(%eax),%eax
c0003f7b:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0003f7e:	8b 45 08             	mov    0x8(%ebp),%eax
c0003f81:	8b 40 50             	mov    0x50(%eax),%eax
c0003f84:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0003f87:	83 ec 0c             	sub    $0xc,%esp
c0003f8a:	ff 75 d0             	pushl  -0x30(%ebp)
c0003f8d:	e8 2a 07 00 00       	call   c00046bc <pid2proc>
c0003f92:	83 c4 10             	add    $0x10,%esp
c0003f95:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0003f98:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0003f9b:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0003f9e:	83 c2 50             	add    $0x50,%edx
c0003fa1:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
c0003fa5:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0003fa8:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0003fab:	8b 40 08             	mov    0x8(%eax),%eax
c0003fae:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0003fb1:	8b 45 08             	mov    0x8(%ebp),%eax
c0003fb4:	8b 00                	mov    (%eax),%eax
c0003fb6:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0003fb9:	83 ec 08             	sub    $0x8,%esp
c0003fbc:	ff 75 bc             	pushl  -0x44(%ebp)
c0003fbf:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c0003fc5:	50                   	push   %eax
c0003fc6:	e8 0d f2 ff ff       	call   c00031d8 <get_inode>
c0003fcb:	83 c4 10             	add    $0x10,%esp
c0003fce:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0003fd1:	83 7d b4 00          	cmpl   $0x0,-0x4c(%ebp)
c0003fd5:	75 10                	jne    c0003fe7 <do_rdwt+0x9e>
c0003fd7:	83 ec 0c             	sub    $0xc,%esp
c0003fda:	68 b8 b3 00 c0       	push   $0xc000b3b8
c0003fdf:	e8 99 56 00 00       	call   c000967d <panic>
c0003fe4:	83 c4 10             	add    $0x10,%esp
c0003fe7:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c0003fed:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0003ff0:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0003ff3:	8b 40 04             	mov    0x4(%eax),%eax
c0003ff6:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0003ff9:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c0003ffd:	74 22                	je     c0004021 <do_rdwt+0xd8>
c0003fff:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c0004003:	74 1c                	je     c0004021 <do_rdwt+0xd8>
c0004005:	68 a7 04 00 00       	push   $0x4a7
c000400a:	68 24 b2 00 c0       	push   $0xc000b224
c000400f:	68 24 b2 00 c0       	push   $0xc000b224
c0004014:	68 c8 b3 00 c0       	push   $0xc000b3c8
c0004019:	e8 7d 56 00 00       	call   c000969b <assertion_failure>
c000401e:	83 c4 10             	add    $0x10,%esp
c0004021:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
c0004027:	83 f8 01             	cmp    $0x1,%eax
c000402a:	0f 85 86 00 00 00    	jne    c00040b6 <do_rdwt+0x16d>
c0004030:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c0004034:	75 09                	jne    c000403f <do_rdwt+0xf6>
c0004036:	c7 45 f4 d2 07 00 00 	movl   $0x7d2,-0xc(%ebp)
c000403d:	eb 0d                	jmp    c000404c <do_rdwt+0x103>
c000403f:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c0004043:	75 07                	jne    c000404c <do_rdwt+0x103>
c0004045:	c7 45 f4 d3 07 00 00 	movl   $0x7d3,-0xc(%ebp)
c000404c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000404f:	8b 45 08             	mov    0x8(%ebp),%eax
c0004052:	89 50 78             	mov    %edx,0x78(%eax)
c0004055:	8b 55 b8             	mov    -0x48(%ebp),%edx
c0004058:	8b 45 08             	mov    0x8(%ebp),%eax
c000405b:	89 50 68             	mov    %edx,0x68(%eax)
c000405e:	83 ec 04             	sub    $0x4,%esp
c0004061:	6a 04                	push   $0x4
c0004063:	ff 75 08             	pushl  0x8(%ebp)
c0004066:	6a 03                	push   $0x3
c0004068:	e8 6b 5f 00 00       	call   c0009fd8 <send_rec>
c000406d:	83 c4 10             	add    $0x10,%esp
c0004070:	8b 45 08             	mov    0x8(%ebp),%eax
c0004073:	8b 40 78             	mov    0x78(%eax),%eax
c0004076:	83 f8 66             	cmp    $0x66,%eax
c0004079:	75 13                	jne    c000408e <do_rdwt+0x145>
c000407b:	83 ec 04             	sub    $0x4,%esp
c000407e:	ff 75 b8             	pushl  -0x48(%ebp)
c0004081:	ff 75 08             	pushl  0x8(%ebp)
c0004084:	6a 01                	push   $0x1
c0004086:	e8 4d 5f 00 00       	call   c0009fd8 <send_rec>
c000408b:	83 c4 10             	add    $0x10,%esp
c000408e:	8b 45 08             	mov    0x8(%ebp),%eax
c0004091:	8b 40 78             	mov    0x78(%eax),%eax
c0004094:	83 f8 65             	cmp    $0x65,%eax
c0004097:	75 13                	jne    c00040ac <do_rdwt+0x163>
c0004099:	83 ec 04             	sub    $0x4,%esp
c000409c:	ff 75 b8             	pushl  -0x48(%ebp)
c000409f:	ff 75 08             	pushl  0x8(%ebp)
c00040a2:	6a 01                	push   $0x1
c00040a4:	e8 2f 5f 00 00       	call   c0009fd8 <send_rec>
c00040a9:	83 c4 10             	add    $0x10,%esp
c00040ac:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c00040b1:	e9 1c 02 00 00       	jmp    c00042d2 <do_rdwt+0x389>
c00040b6:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c00040ba:	75 18                	jne    c00040d4 <do_rdwt+0x18b>
c00040bc:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c00040c2:	c1 e0 09             	shl    $0x9,%eax
c00040c5:	39 45 ac             	cmp    %eax,-0x54(%ebp)
c00040c8:	75 0a                	jne    c00040d4 <do_rdwt+0x18b>
c00040ca:	b8 00 00 00 00       	mov    $0x0,%eax
c00040cf:	e9 fe 01 00 00       	jmp    c00042d2 <do_rdwt+0x389>
c00040d4:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c00040d8:	75 14                	jne    c00040ee <do_rdwt+0x1a5>
c00040da:	8b 55 ac             	mov    -0x54(%ebp),%edx
c00040dd:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00040e0:	01 d0                	add    %edx,%eax
c00040e2:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c00040e5:	0f 4e 45 b0          	cmovle -0x50(%ebp),%eax
c00040e9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00040ec:	eb 19                	jmp    c0004107 <do_rdwt+0x1be>
c00040ee:	8b 55 ac             	mov    -0x54(%ebp),%edx
c00040f1:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00040f4:	01 c2                	add    %eax,%edx
c00040f6:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c00040fc:	c1 e0 09             	shl    $0x9,%eax
c00040ff:	39 c2                	cmp    %eax,%edx
c0004101:	0f 4e c2             	cmovle %edx,%eax
c0004104:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0004107:	8b 45 ac             	mov    -0x54(%ebp),%eax
c000410a:	99                   	cltd   
c000410b:	c1 ea 17             	shr    $0x17,%edx
c000410e:	01 d0                	add    %edx,%eax
c0004110:	25 ff 01 00 00       	and    $0x1ff,%eax
c0004115:	29 d0                	sub    %edx,%eax
c0004117:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000411a:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c0004120:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0004123:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c0004129:	85 c0                	test   %eax,%eax
c000412b:	0f 48 c1             	cmovs  %ecx,%eax
c000412e:	c1 f8 09             	sar    $0x9,%eax
c0004131:	01 d0                	add    %edx,%eax
c0004133:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0004136:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c000413c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000413f:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c0004145:	85 c0                	test   %eax,%eax
c0004147:	0f 48 c1             	cmovs  %ecx,%eax
c000414a:	c1 f8 09             	sar    $0x9,%eax
c000414d:	01 d0                	add    %edx,%eax
c000414f:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0004152:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0004155:	2b 45 a8             	sub    -0x58(%ebp),%eax
c0004158:	ba 00 00 10 00       	mov    $0x100000,%edx
c000415d:	39 d0                	cmp    %edx,%eax
c000415f:	7d 0b                	jge    c000416c <do_rdwt+0x223>
c0004161:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0004164:	2b 45 a8             	sub    -0x58(%ebp),%eax
c0004167:	83 c0 01             	add    $0x1,%eax
c000416a:	eb 05                	jmp    c0004171 <do_rdwt+0x228>
c000416c:	b8 00 00 10 00       	mov    $0x100000,%eax
c0004171:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0004174:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0004177:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000417a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0004181:	8b 45 08             	mov    0x8(%ebp),%eax
c0004184:	8b 00                	mov    (%eax),%eax
c0004186:	83 ec 0c             	sub    $0xc,%esp
c0004189:	50                   	push   %eax
c000418a:	e8 2d 05 00 00       	call   c00046bc <pid2proc>
c000418f:	83 c4 10             	add    $0x10,%esp
c0004192:	89 45 9c             	mov    %eax,-0x64(%ebp)
c0004195:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0004198:	83 ec 08             	sub    $0x8,%esp
c000419b:	50                   	push   %eax
c000419c:	ff 75 cc             	pushl  -0x34(%ebp)
c000419f:	e8 76 2b 00 00       	call   c0006d1a <alloc_virtual_memory>
c00041a4:	83 c4 10             	add    $0x10,%esp
c00041a7:	89 45 98             	mov    %eax,-0x68(%ebp)
c00041aa:	8b 45 a8             	mov    -0x58(%ebp),%eax
c00041ad:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00041b0:	e9 c5 00 00 00       	jmp    c000427a <do_rdwt+0x331>
c00041b5:	8b 45 a0             	mov    -0x60(%ebp),%eax
c00041b8:	c1 e0 09             	shl    $0x9,%eax
c00041bb:	2b 45 ec             	sub    -0x14(%ebp),%eax
c00041be:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c00041c1:	0f 4e 45 e8          	cmovle -0x18(%ebp),%eax
c00041c5:	89 45 94             	mov    %eax,-0x6c(%ebp)
c00041c8:	c7 45 90 20 00 00 00 	movl   $0x20,-0x70(%ebp)
c00041cf:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c00041d3:	75 46                	jne    c000421b <do_rdwt+0x2d2>
c00041d5:	8b 45 a0             	mov    -0x60(%ebp),%eax
c00041d8:	c1 e0 09             	shl    $0x9,%eax
c00041db:	8b 15 84 27 01 c0    	mov    0xc0012784,%edx
c00041e1:	83 ec 0c             	sub    $0xc,%esp
c00041e4:	6a 07                	push   $0x7
c00041e6:	50                   	push   %eax
c00041e7:	52                   	push   %edx
c00041e8:	ff 75 90             	pushl  -0x70(%ebp)
c00041eb:	ff 75 e0             	pushl  -0x20(%ebp)
c00041ee:	e8 09 e5 ff ff       	call   c00026fc <rd_wt>
c00041f3:	83 c4 20             	add    $0x20,%esp
c00041f6:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c00041fc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00041ff:	01 d0                	add    %edx,%eax
c0004201:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c0004204:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0004207:	01 ca                	add    %ecx,%edx
c0004209:	83 ec 04             	sub    $0x4,%esp
c000420c:	ff 75 94             	pushl  -0x6c(%ebp)
c000420f:	50                   	push   %eax
c0004210:	52                   	push   %edx
c0004211:	e8 01 39 00 00       	call   c0007b17 <Memcpy>
c0004216:	83 c4 10             	add    $0x10,%esp
c0004219:	eb 46                	jmp    c0004261 <do_rdwt+0x318>
c000421b:	8b 55 98             	mov    -0x68(%ebp),%edx
c000421e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004221:	01 d0                	add    %edx,%eax
c0004223:	89 c1                	mov    %eax,%ecx
c0004225:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c000422b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000422e:	01 d0                	add    %edx,%eax
c0004230:	83 ec 04             	sub    $0x4,%esp
c0004233:	ff 75 94             	pushl  -0x6c(%ebp)
c0004236:	51                   	push   %ecx
c0004237:	50                   	push   %eax
c0004238:	e8 da 38 00 00       	call   c0007b17 <Memcpy>
c000423d:	83 c4 10             	add    $0x10,%esp
c0004240:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0004243:	c1 e0 09             	shl    $0x9,%eax
c0004246:	8b 15 84 27 01 c0    	mov    0xc0012784,%edx
c000424c:	83 ec 0c             	sub    $0xc,%esp
c000424f:	6a 0a                	push   $0xa
c0004251:	50                   	push   %eax
c0004252:	52                   	push   %edx
c0004253:	ff 75 90             	pushl  -0x70(%ebp)
c0004256:	ff 75 e0             	pushl  -0x20(%ebp)
c0004259:	e8 9e e4 ff ff       	call   c00026fc <rd_wt>
c000425e:	83 c4 20             	add    $0x20,%esp
c0004261:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0004264:	29 45 e8             	sub    %eax,-0x18(%ebp)
c0004267:	8b 45 94             	mov    -0x6c(%ebp),%eax
c000426a:	01 45 e4             	add    %eax,-0x1c(%ebp)
c000426d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0004274:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0004277:	01 45 e0             	add    %eax,-0x20(%ebp)
c000427a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000427d:	3b 45 a4             	cmp    -0x5c(%ebp),%eax
c0004280:	7f 0a                	jg     c000428c <do_rdwt+0x343>
c0004282:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0004286:	0f 85 29 ff ff ff    	jne    c00041b5 <do_rdwt+0x26c>
c000428c:	8b 45 c0             	mov    -0x40(%ebp),%eax
c000428f:	8b 50 04             	mov    0x4(%eax),%edx
c0004292:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0004295:	01 c2                	add    %eax,%edx
c0004297:	8b 45 c0             	mov    -0x40(%ebp),%eax
c000429a:	89 50 04             	mov    %edx,0x4(%eax)
c000429d:	8b 55 ac             	mov    -0x54(%ebp),%edx
c00042a0:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00042a3:	01 c2                	add    %eax,%edx
c00042a5:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c00042ab:	39 c2                	cmp    %eax,%edx
c00042ad:	7e 20                	jle    c00042cf <do_rdwt+0x386>
c00042af:	8b 55 ac             	mov    -0x54(%ebp),%edx
c00042b2:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00042b5:	01 d0                	add    %edx,%eax
c00042b7:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c00042bd:	83 ec 0c             	sub    $0xc,%esp
c00042c0:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c00042c6:	50                   	push   %eax
c00042c7:	e8 08 00 00 00       	call   c00042d4 <sync_inode>
c00042cc:	83 c4 10             	add    $0x10,%esp
c00042cf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00042d2:	c9                   	leave  
c00042d3:	c3                   	ret    

c00042d4 <sync_inode>:
c00042d4:	55                   	push   %ebp
c00042d5:	89 e5                	mov    %esp,%ebp
c00042d7:	53                   	push   %ebx
c00042d8:	83 ec 34             	sub    $0x34,%esp
c00042db:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00042e2:	eb 74                	jmp    c0004358 <sync_inode+0x84>
c00042e4:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00042e7:	89 d0                	mov    %edx,%eax
c00042e9:	c1 e0 02             	shl    $0x2,%eax
c00042ec:	01 d0                	add    %edx,%eax
c00042ee:	c1 e0 03             	shl    $0x3,%eax
c00042f1:	05 b0 27 01 c0       	add    $0xc00127b0,%eax
c00042f6:	8b 10                	mov    (%eax),%edx
c00042f8:	8b 45 08             	mov    0x8(%ebp),%eax
c00042fb:	8b 40 10             	mov    0x10(%eax),%eax
c00042fe:	39 c2                	cmp    %eax,%edx
c0004300:	75 52                	jne    c0004354 <sync_inode+0x80>
c0004302:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0004305:	89 d0                	mov    %edx,%eax
c0004307:	c1 e0 02             	shl    $0x2,%eax
c000430a:	01 d0                	add    %edx,%eax
c000430c:	c1 e0 03             	shl    $0x3,%eax
c000430f:	8d 90 a0 27 01 c0    	lea    -0x3ffed860(%eax),%edx
c0004315:	8b 45 08             	mov    0x8(%ebp),%eax
c0004318:	8b 08                	mov    (%eax),%ecx
c000431a:	89 0a                	mov    %ecx,(%edx)
c000431c:	8b 48 04             	mov    0x4(%eax),%ecx
c000431f:	89 4a 04             	mov    %ecx,0x4(%edx)
c0004322:	8b 48 08             	mov    0x8(%eax),%ecx
c0004325:	89 4a 08             	mov    %ecx,0x8(%edx)
c0004328:	8b 48 0c             	mov    0xc(%eax),%ecx
c000432b:	89 4a 0c             	mov    %ecx,0xc(%edx)
c000432e:	8b 48 10             	mov    0x10(%eax),%ecx
c0004331:	89 4a 10             	mov    %ecx,0x10(%edx)
c0004334:	8b 48 14             	mov    0x14(%eax),%ecx
c0004337:	89 4a 14             	mov    %ecx,0x14(%edx)
c000433a:	8b 48 18             	mov    0x18(%eax),%ecx
c000433d:	89 4a 18             	mov    %ecx,0x18(%edx)
c0004340:	8b 48 1c             	mov    0x1c(%eax),%ecx
c0004343:	89 4a 1c             	mov    %ecx,0x1c(%edx)
c0004346:	8b 48 20             	mov    0x20(%eax),%ecx
c0004349:	89 4a 20             	mov    %ecx,0x20(%edx)
c000434c:	8b 40 24             	mov    0x24(%eax),%eax
c000434f:	89 42 24             	mov    %eax,0x24(%edx)
c0004352:	eb 0a                	jmp    c000435e <sync_inode+0x8a>
c0004354:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0004358:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c000435c:	7e 86                	jle    c00042e4 <sync_inode+0x10>
c000435e:	c7 45 f0 20 00 00 00 	movl   $0x20,-0x10(%ebp)
c0004365:	8b 45 08             	mov    0x8(%ebp),%eax
c0004368:	8b 40 10             	mov    0x10(%eax),%eax
c000436b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000436e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004371:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0004374:	b8 00 02 00 00       	mov    $0x200,%eax
c0004379:	99                   	cltd   
c000437a:	f7 7d f0             	idivl  -0x10(%ebp)
c000437d:	89 c3                	mov    %eax,%ebx
c000437f:	89 c8                	mov    %ecx,%eax
c0004381:	99                   	cltd   
c0004382:	f7 fb                	idiv   %ebx
c0004384:	89 55 e8             	mov    %edx,-0x18(%ebp)
c0004387:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000438a:	8d 48 ff             	lea    -0x1(%eax),%ecx
c000438d:	b8 00 02 00 00       	mov    $0x200,%eax
c0004392:	99                   	cltd   
c0004393:	f7 7d f0             	idivl  -0x10(%ebp)
c0004396:	89 c3                	mov    %eax,%ebx
c0004398:	89 c8                	mov    %ecx,%eax
c000439a:	99                   	cltd   
c000439b:	f7 fb                	idiv   %ebx
c000439d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00043a0:	8b 45 08             	mov    0x8(%ebp),%eax
c00043a3:	8b 40 20             	mov    0x20(%eax),%eax
c00043a6:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00043a9:	e8 0a 01 00 00       	call   c00044b8 <get_super_block>
c00043ae:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00043b1:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00043b4:	8b 40 04             	mov    0x4(%eax),%eax
c00043b7:	8d 50 02             	lea    0x2(%eax),%edx
c00043ba:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00043bd:	8b 40 08             	mov    0x8(%eax),%eax
c00043c0:	01 c2                	add    %eax,%edx
c00043c2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00043c5:	01 d0                	add    %edx,%eax
c00043c7:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00043ca:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00043cf:	83 ec 0c             	sub    $0xc,%esp
c00043d2:	6a 07                	push   $0x7
c00043d4:	68 00 02 00 00       	push   $0x200
c00043d9:	50                   	push   %eax
c00043da:	ff 75 e0             	pushl  -0x20(%ebp)
c00043dd:	ff 75 d8             	pushl  -0x28(%ebp)
c00043e0:	e8 17 e3 ff ff       	call   c00026fc <rd_wt>
c00043e5:	83 c4 20             	add    $0x20,%esp
c00043e8:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c00043ed:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00043f0:	83 ec 04             	sub    $0x4,%esp
c00043f3:	ff 75 f0             	pushl  -0x10(%ebp)
c00043f6:	ff 75 08             	pushl  0x8(%ebp)
c00043f9:	ff 75 d4             	pushl  -0x2c(%ebp)
c00043fc:	e8 16 37 00 00       	call   c0007b17 <Memcpy>
c0004401:	83 c4 10             	add    $0x10,%esp
c0004404:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0004409:	83 ec 0c             	sub    $0xc,%esp
c000440c:	6a 0a                	push   $0xa
c000440e:	68 00 02 00 00       	push   $0x200
c0004413:	50                   	push   %eax
c0004414:	ff 75 e0             	pushl  -0x20(%ebp)
c0004417:	ff 75 d8             	pushl  -0x28(%ebp)
c000441a:	e8 dd e2 ff ff       	call   c00026fc <rd_wt>
c000441f:	83 c4 20             	add    $0x20,%esp
c0004422:	90                   	nop
c0004423:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0004426:	c9                   	leave  
c0004427:	c3                   	ret    

c0004428 <put_inode>:
c0004428:	55                   	push   %ebp
c0004429:	89 e5                	mov    %esp,%ebp
c000442b:	83 ec 08             	sub    $0x8,%esp
c000442e:	8b 45 08             	mov    0x8(%ebp),%eax
c0004431:	8b 40 24             	mov    0x24(%eax),%eax
c0004434:	85 c0                	test   %eax,%eax
c0004436:	7f 1c                	jg     c0004454 <put_inode+0x2c>
c0004438:	68 4c 05 00 00       	push   $0x54c
c000443d:	68 24 b2 00 c0       	push   $0xc000b224
c0004442:	68 24 b2 00 c0       	push   $0xc000b224
c0004447:	68 fc b3 00 c0       	push   $0xc000b3fc
c000444c:	e8 4a 52 00 00       	call   c000969b <assertion_failure>
c0004451:	83 c4 10             	add    $0x10,%esp
c0004454:	8b 45 08             	mov    0x8(%ebp),%eax
c0004457:	8b 40 24             	mov    0x24(%eax),%eax
c000445a:	8d 50 ff             	lea    -0x1(%eax),%edx
c000445d:	8b 45 08             	mov    0x8(%ebp),%eax
c0004460:	89 50 24             	mov    %edx,0x24(%eax)
c0004463:	90                   	nop
c0004464:	c9                   	leave  
c0004465:	c3                   	ret    

c0004466 <do_close>:
c0004466:	55                   	push   %ebp
c0004467:	89 e5                	mov    %esp,%ebp
c0004469:	a1 c8 0b 01 c0       	mov    0xc0010bc8,%eax
c000446e:	8b 55 08             	mov    0x8(%ebp),%edx
c0004471:	83 c2 50             	add    $0x50,%edx
c0004474:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
c0004478:	8b 50 0c             	mov    0xc(%eax),%edx
c000447b:	83 ea 01             	sub    $0x1,%edx
c000447e:	89 50 0c             	mov    %edx,0xc(%eax)
c0004481:	8b 40 0c             	mov    0xc(%eax),%eax
c0004484:	85 c0                	test   %eax,%eax
c0004486:	75 16                	jne    c000449e <do_close+0x38>
c0004488:	a1 c8 0b 01 c0       	mov    0xc0010bc8,%eax
c000448d:	8b 55 08             	mov    0x8(%ebp),%edx
c0004490:	83 c2 50             	add    $0x50,%edx
c0004493:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
c0004497:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c000449e:	a1 c8 0b 01 c0       	mov    0xc0010bc8,%eax
c00044a3:	8b 55 08             	mov    0x8(%ebp),%edx
c00044a6:	83 c2 50             	add    $0x50,%edx
c00044a9:	c7 44 90 08 00 00 00 	movl   $0x0,0x8(%eax,%edx,4)
c00044b0:	00 
c00044b1:	b8 00 00 00 00       	mov    $0x0,%eax
c00044b6:	5d                   	pop    %ebp
c00044b7:	c3                   	ret    

c00044b8 <get_super_block>:
c00044b8:	55                   	push   %ebp
c00044b9:	89 e5                	mov    %esp,%ebp
c00044bb:	83 ec 08             	sub    $0x8,%esp
c00044be:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00044c3:	83 ec 0c             	sub    $0xc,%esp
c00044c6:	6a 07                	push   $0x7
c00044c8:	68 00 02 00 00       	push   $0x200
c00044cd:	50                   	push   %eax
c00044ce:	6a 20                	push   $0x20
c00044d0:	6a 01                	push   $0x1
c00044d2:	e8 25 e2 ff ff       	call   c00026fc <rd_wt>
c00044d7:	83 c4 20             	add    $0x20,%esp
c00044da:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c00044e0:	a1 a0 31 01 c0       	mov    0xc00131a0,%eax
c00044e5:	8b 0a                	mov    (%edx),%ecx
c00044e7:	89 08                	mov    %ecx,(%eax)
c00044e9:	8b 4a 04             	mov    0x4(%edx),%ecx
c00044ec:	89 48 04             	mov    %ecx,0x4(%eax)
c00044ef:	8b 4a 08             	mov    0x8(%edx),%ecx
c00044f2:	89 48 08             	mov    %ecx,0x8(%eax)
c00044f5:	8b 4a 0c             	mov    0xc(%edx),%ecx
c00044f8:	89 48 0c             	mov    %ecx,0xc(%eax)
c00044fb:	8b 4a 10             	mov    0x10(%edx),%ecx
c00044fe:	89 48 10             	mov    %ecx,0x10(%eax)
c0004501:	8b 4a 14             	mov    0x14(%edx),%ecx
c0004504:	89 48 14             	mov    %ecx,0x14(%eax)
c0004507:	8b 4a 18             	mov    0x18(%edx),%ecx
c000450a:	89 48 18             	mov    %ecx,0x18(%eax)
c000450d:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0004510:	89 48 1c             	mov    %ecx,0x1c(%eax)
c0004513:	8b 52 20             	mov    0x20(%edx),%edx
c0004516:	89 50 20             	mov    %edx,0x20(%eax)
c0004519:	a1 a0 31 01 c0       	mov    0xc00131a0,%eax
c000451e:	c9                   	leave  
c000451f:	c3                   	ret    

c0004520 <check>:
c0004520:	55                   	push   %ebp
c0004521:	89 e5                	mov    %esp,%ebp
c0004523:	83 ec 10             	sub    $0x10,%esp
c0004526:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c000452d:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0004534:	eb 08                	jmp    c000453e <check+0x1e>
c0004536:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c000453a:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c000453e:	83 7d f8 03          	cmpl   $0x3,-0x8(%ebp)
c0004542:	7e f2                	jle    c0004536 <check+0x16>
c0004544:	90                   	nop
c0004545:	c9                   	leave  
c0004546:	c3                   	ret    

c0004547 <schedule_process>:
c0004547:	55                   	push   %ebp
c0004548:	89 e5                	mov    %esp,%ebp
c000454a:	83 ec 18             	sub    $0x18,%esp
c000454d:	c7 45 f4 00 00 10 00 	movl   $0x100000,-0xc(%ebp)
c0004554:	e8 3e ce ff ff       	call   c0001397 <get_running_thread_pcb>
c0004559:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000455c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000455f:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0004566:	84 c0                	test   %al,%al
c0004568:	75 30                	jne    c000459a <schedule_process+0x53>
c000456a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000456d:	c7 80 28 01 00 00 0a 	movl   $0xa,0x128(%eax)
c0004574:	00 00 00 
c0004577:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000457a:	c6 80 48 02 00 00 03 	movb   $0x3,0x248(%eax)
c0004581:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004584:	05 00 01 00 00       	add    $0x100,%eax
c0004589:	83 ec 08             	sub    $0x8,%esp
c000458c:	50                   	push   %eax
c000458d:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004592:	e8 80 67 00 00       	call   c000ad17 <insertToDoubleLinkList>
c0004597:	83 c4 10             	add    $0x10,%esp
c000459a:	83 ec 0c             	sub    $0xc,%esp
c000459d:	68 ec 0d 01 c0       	push   $0xc0010dec
c00045a2:	e8 8c 65 00 00       	call   c000ab33 <isListEmpty>
c00045a7:	83 c4 10             	add    $0x10,%esp
c00045aa:	84 c0                	test   %al,%al
c00045ac:	74 19                	je     c00045c7 <schedule_process+0x80>
c00045ae:	6a 28                	push   $0x28
c00045b0:	68 0b b4 00 c0       	push   $0xc000b40b
c00045b5:	68 0b b4 00 c0       	push   $0xc000b40b
c00045ba:	68 15 b4 00 c0       	push   $0xc000b415
c00045bf:	e8 d7 50 00 00       	call   c000969b <assertion_failure>
c00045c4:	83 c4 10             	add    $0x10,%esp
c00045c7:	83 ec 0c             	sub    $0xc,%esp
c00045ca:	68 ec 0d 01 c0       	push   $0xc0010dec
c00045cf:	e8 c6 67 00 00       	call   c000ad9a <popFromDoubleLinkList>
c00045d4:	83 c4 10             	add    $0x10,%esp
c00045d7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00045da:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00045dd:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c00045e2:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00045e5:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00045e8:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c00045ef:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00045f2:	8b 40 08             	mov    0x8(%eax),%eax
c00045f5:	85 c0                	test   %eax,%eax
c00045f7:	74 28                	je     c0004621 <schedule_process+0xda>
c00045f9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00045fc:	05 00 10 00 00       	add    $0x1000,%eax
c0004601:	83 ec 0c             	sub    $0xc,%esp
c0004604:	50                   	push   %eax
c0004605:	e8 7e cd ff ff       	call   c0001388 <update_tss>
c000460a:	83 c4 10             	add    $0x10,%esp
c000460d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004610:	8b 40 08             	mov    0x8(%eax),%eax
c0004613:	83 ec 0c             	sub    $0xc,%esp
c0004616:	50                   	push   %eax
c0004617:	e8 5f cd ff ff       	call   c000137b <update_cr3>
c000461c:	83 c4 10             	add    $0x10,%esp
c000461f:	eb 0f                	jmp    c0004630 <schedule_process+0xe9>
c0004621:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004624:	83 ec 0c             	sub    $0xc,%esp
c0004627:	50                   	push   %eax
c0004628:	e8 4e cd ff ff       	call   c000137b <update_cr3>
c000462d:	83 c4 10             	add    $0x10,%esp
c0004630:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004633:	a3 c0 0b 01 c0       	mov    %eax,0xc0010bc0
c0004638:	83 ec 08             	sub    $0x8,%esp
c000463b:	ff 75 e8             	pushl  -0x18(%ebp)
c000463e:	ff 75 f0             	pushl  -0x10(%ebp)
c0004641:	e8 aa 64 00 00       	call   c000aaf0 <switch_to>
c0004646:	83 c4 10             	add    $0x10,%esp
c0004649:	90                   	nop
c000464a:	c9                   	leave  
c000464b:	c3                   	ret    

c000464c <clock_handler>:
c000464c:	55                   	push   %ebp
c000464d:	89 e5                	mov    %esp,%ebp
c000464f:	83 ec 18             	sub    $0x18,%esp
c0004652:	e8 40 cd ff ff       	call   c0001397 <get_running_thread_pcb>
c0004657:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000465a:	a1 c0 16 01 c0       	mov    0xc00116c0,%eax
c000465f:	85 c0                	test   %eax,%eax
c0004661:	74 0d                	je     c0004670 <clock_handler+0x24>
c0004663:	83 ec 0c             	sub    $0xc,%esp
c0004666:	6a 04                	push   $0x4
c0004668:	e8 06 5c 00 00       	call   c000a273 <inform_int>
c000466d:	83 c4 10             	add    $0x10,%esp
c0004670:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004673:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0004679:	83 f8 05             	cmp    $0x5,%eax
c000467c:	75 13                	jne    c0004691 <clock_handler+0x45>
c000467e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004681:	8b 80 28 01 00 00    	mov    0x128(%eax),%eax
c0004687:	83 f8 01             	cmp    $0x1,%eax
c000468a:	75 05                	jne    c0004691 <clock_handler+0x45>
c000468c:	e8 8f fe ff ff       	call   c0004520 <check>
c0004691:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004694:	8b 80 28 01 00 00    	mov    0x128(%eax),%eax
c000469a:	85 c0                	test   %eax,%eax
c000469c:	74 16                	je     c00046b4 <clock_handler+0x68>
c000469e:	a1 c0 0b 01 c0       	mov    0xc0010bc0,%eax
c00046a3:	8b 90 28 01 00 00    	mov    0x128(%eax),%edx
c00046a9:	83 ea 01             	sub    $0x1,%edx
c00046ac:	89 90 28 01 00 00    	mov    %edx,0x128(%eax)
c00046b2:	eb 05                	jmp    c00046b9 <clock_handler+0x6d>
c00046b4:	e8 8e fe ff ff       	call   c0004547 <schedule_process>
c00046b9:	90                   	nop
c00046ba:	c9                   	leave  
c00046bb:	c3                   	ret    

c00046bc <pid2proc>:
c00046bc:	55                   	push   %ebp
c00046bd:	89 e5                	mov    %esp,%ebp
c00046bf:	83 ec 20             	sub    $0x20,%esp
c00046c2:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c00046c9:	a1 04 1f 01 c0       	mov    0xc0011f04,%eax
c00046ce:	8b 15 08 1f 01 c0    	mov    0xc0011f08,%edx
c00046d4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00046d7:	89 55 f4             	mov    %edx,-0xc(%ebp)
c00046da:	a1 0c 1f 01 c0       	mov    0xc0011f0c,%eax
c00046df:	8b 15 10 1f 01 c0    	mov    0xc0011f10,%edx
c00046e5:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00046e8:	89 55 ec             	mov    %edx,-0x14(%ebp)
c00046eb:	a1 08 1f 01 c0       	mov    0xc0011f08,%eax
c00046f0:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00046f3:	eb 29                	jmp    c000471e <pid2proc+0x62>
c00046f5:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00046f8:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c00046fd:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0004700:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004703:	8b 90 24 01 00 00    	mov    0x124(%eax),%edx
c0004709:	8b 45 08             	mov    0x8(%ebp),%eax
c000470c:	39 c2                	cmp    %eax,%edx
c000470e:	75 05                	jne    c0004715 <pid2proc+0x59>
c0004710:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004713:	eb 17                	jmp    c000472c <pid2proc+0x70>
c0004715:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004718:	8b 40 04             	mov    0x4(%eax),%eax
c000471b:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000471e:	81 7d fc 0c 1f 01 c0 	cmpl   $0xc0011f0c,-0x4(%ebp)
c0004725:	75 ce                	jne    c00046f5 <pid2proc+0x39>
c0004727:	b8 00 00 00 00       	mov    $0x0,%eax
c000472c:	c9                   	leave  
c000472d:	c3                   	ret    

c000472e <proc2pid>:
c000472e:	55                   	push   %ebp
c000472f:	89 e5                	mov    %esp,%ebp
c0004731:	83 ec 10             	sub    $0x10,%esp
c0004734:	8b 45 08             	mov    0x8(%ebp),%eax
c0004737:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c000473d:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004740:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004743:	c9                   	leave  
c0004744:	c3                   	ret    

c0004745 <InitDescriptor>:
c0004745:	55                   	push   %ebp
c0004746:	89 e5                	mov    %esp,%ebp
c0004748:	83 ec 04             	sub    $0x4,%esp
c000474b:	8b 45 14             	mov    0x14(%ebp),%eax
c000474e:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
c0004752:	8b 45 10             	mov    0x10(%ebp),%eax
c0004755:	89 c2                	mov    %eax,%edx
c0004757:	8b 45 08             	mov    0x8(%ebp),%eax
c000475a:	66 89 10             	mov    %dx,(%eax)
c000475d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004760:	89 c2                	mov    %eax,%edx
c0004762:	8b 45 08             	mov    0x8(%ebp),%eax
c0004765:	66 89 50 02          	mov    %dx,0x2(%eax)
c0004769:	8b 45 0c             	mov    0xc(%ebp),%eax
c000476c:	c1 e8 10             	shr    $0x10,%eax
c000476f:	89 c2                	mov    %eax,%edx
c0004771:	8b 45 08             	mov    0x8(%ebp),%eax
c0004774:	88 50 04             	mov    %dl,0x4(%eax)
c0004777:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c000477b:	89 c2                	mov    %eax,%edx
c000477d:	8b 45 08             	mov    0x8(%ebp),%eax
c0004780:	88 50 05             	mov    %dl,0x5(%eax)
c0004783:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0004787:	66 c1 e8 08          	shr    $0x8,%ax
c000478b:	c1 e0 04             	shl    $0x4,%eax
c000478e:	89 c2                	mov    %eax,%edx
c0004790:	8b 45 10             	mov    0x10(%ebp),%eax
c0004793:	c1 e8 10             	shr    $0x10,%eax
c0004796:	83 e0 0f             	and    $0xf,%eax
c0004799:	09 c2                	or     %eax,%edx
c000479b:	8b 45 08             	mov    0x8(%ebp),%eax
c000479e:	88 50 06             	mov    %dl,0x6(%eax)
c00047a1:	8b 45 0c             	mov    0xc(%ebp),%eax
c00047a4:	c1 e8 18             	shr    $0x18,%eax
c00047a7:	89 c2                	mov    %eax,%edx
c00047a9:	8b 45 08             	mov    0x8(%ebp),%eax
c00047ac:	88 50 07             	mov    %dl,0x7(%eax)
c00047af:	90                   	nop
c00047b0:	c9                   	leave  
c00047b1:	c3                   	ret    

c00047b2 <Seg2PhyAddr>:
c00047b2:	55                   	push   %ebp
c00047b3:	89 e5                	mov    %esp,%ebp
c00047b5:	83 ec 10             	sub    $0x10,%esp
c00047b8:	8b 45 08             	mov    0x8(%ebp),%eax
c00047bb:	c1 e8 03             	shr    $0x3,%eax
c00047be:	8b 14 c5 c4 07 01 c0 	mov    -0x3ffef83c(,%eax,8),%edx
c00047c5:	8b 04 c5 c0 07 01 c0 	mov    -0x3ffef840(,%eax,8),%eax
c00047cc:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00047cf:	89 55 f8             	mov    %edx,-0x8(%ebp)
c00047d2:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c00047d6:	0f b7 c0             	movzwl %ax,%eax
c00047d9:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c00047dd:	0f b6 d2             	movzbl %dl,%edx
c00047e0:	c1 e2 10             	shl    $0x10,%edx
c00047e3:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c00047e9:	09 d0                	or     %edx,%eax
c00047eb:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00047ee:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00047f1:	c9                   	leave  
c00047f2:	c3                   	ret    

c00047f3 <Seg2PhyAddrLDT>:
c00047f3:	55                   	push   %ebp
c00047f4:	89 e5                	mov    %esp,%ebp
c00047f6:	83 ec 10             	sub    $0x10,%esp
c00047f9:	8b 45 08             	mov    0x8(%ebp),%eax
c00047fc:	c1 e8 03             	shr    $0x3,%eax
c00047ff:	89 c2                	mov    %eax,%edx
c0004801:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004804:	83 c2 22             	add    $0x22,%edx
c0004807:	8d 54 d0 02          	lea    0x2(%eax,%edx,8),%edx
c000480b:	8b 02                	mov    (%edx),%eax
c000480d:	8b 52 04             	mov    0x4(%edx),%edx
c0004810:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004813:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0004816:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c000481a:	0f b7 c0             	movzwl %ax,%eax
c000481d:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c0004821:	0f b6 d2             	movzbl %dl,%edx
c0004824:	c1 e2 10             	shl    $0x10,%edx
c0004827:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c000482d:	09 d0                	or     %edx,%eax
c000482f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004832:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004835:	c9                   	leave  
c0004836:	c3                   	ret    

c0004837 <VirAddr2PhyAddr>:
c0004837:	55                   	push   %ebp
c0004838:	89 e5                	mov    %esp,%ebp
c000483a:	83 ec 10             	sub    $0x10,%esp
c000483d:	8b 55 0c             	mov    0xc(%ebp),%edx
c0004840:	8b 45 08             	mov    0x8(%ebp),%eax
c0004843:	01 d0                	add    %edx,%eax
c0004845:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004848:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000484b:	c9                   	leave  
c000484c:	c3                   	ret    

c000484d <v2l>:
c000484d:	55                   	push   %ebp
c000484e:	89 e5                	mov    %esp,%ebp
c0004850:	83 ec 18             	sub    $0x18,%esp
c0004853:	83 ec 0c             	sub    $0xc,%esp
c0004856:	ff 75 08             	pushl  0x8(%ebp)
c0004859:	e8 5e fe ff ff       	call   c00046bc <pid2proc>
c000485e:	83 c4 10             	add    $0x10,%esp
c0004861:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004864:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c000486b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000486e:	83 ec 08             	sub    $0x8,%esp
c0004871:	ff 75 f4             	pushl  -0xc(%ebp)
c0004874:	50                   	push   %eax
c0004875:	e8 79 ff ff ff       	call   c00047f3 <Seg2PhyAddrLDT>
c000487a:	83 c4 10             	add    $0x10,%esp
c000487d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0004880:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0004883:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004886:	01 d0                	add    %edx,%eax
c0004888:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000488b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000488e:	c9                   	leave  
c000488f:	c3                   	ret    

c0004890 <init_propt>:
c0004890:	55                   	push   %ebp
c0004891:	89 e5                	mov    %esp,%ebp
c0004893:	83 ec 38             	sub    $0x38,%esp
c0004896:	6a 0e                	push   $0xe
c0004898:	6a 08                	push   $0x8
c000489a:	68 71 11 00 c0       	push   $0xc0001171
c000489f:	6a 20                	push   $0x20
c00048a1:	e8 58 01 00 00       	call   c00049fe <InitInterruptDesc>
c00048a6:	83 c4 10             	add    $0x10,%esp
c00048a9:	6a 0e                	push   $0xe
c00048ab:	6a 08                	push   $0x8
c00048ad:	68 9e 11 00 c0       	push   $0xc000119e
c00048b2:	6a 21                	push   $0x21
c00048b4:	e8 45 01 00 00       	call   c00049fe <InitInterruptDesc>
c00048b9:	83 c4 10             	add    $0x10,%esp
c00048bc:	6a 0e                	push   $0xe
c00048be:	6a 08                	push   $0x8
c00048c0:	68 e0 11 00 c0       	push   $0xc00011e0
c00048c5:	6a 2e                	push   $0x2e
c00048c7:	e8 32 01 00 00       	call   c00049fe <InitInterruptDesc>
c00048cc:	83 c4 10             	add    $0x10,%esp
c00048cf:	83 ec 04             	sub    $0x4,%esp
c00048d2:	68 a0 15 00 00       	push   $0x15a0
c00048d7:	6a 00                	push   $0x0
c00048d9:	68 00 32 08 c0       	push   $0xc0083200
c00048de:	e8 5c 75 00 00       	call   c000be3f <Memset>
c00048e3:	83 c4 10             	add    $0x10,%esp
c00048e6:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c00048ed:	83 ec 04             	sub    $0x4,%esp
c00048f0:	ff 75 f4             	pushl  -0xc(%ebp)
c00048f3:	6a 00                	push   $0x0
c00048f5:	68 40 16 01 c0       	push   $0xc0011640
c00048fa:	e8 40 75 00 00       	call   c000be3f <Memset>
c00048ff:	83 c4 10             	add    $0x10,%esp
c0004902:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004905:	a3 a8 16 01 c0       	mov    %eax,0xc00116a8
c000490a:	c7 05 48 16 01 c0 30 	movl   $0x30,0xc0011648
c0004911:	00 00 00 
c0004914:	83 ec 0c             	sub    $0xc,%esp
c0004917:	6a 30                	push   $0x30
c0004919:	e8 94 fe ff ff       	call   c00047b2 <Seg2PhyAddr>
c000491e:	83 c4 10             	add    $0x10,%esp
c0004921:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0004924:	c7 45 ec 40 16 01 c0 	movl   $0xc0011640,-0x14(%ebp)
c000492b:	c7 45 e8 89 00 00 00 	movl   $0x89,-0x18(%ebp)
c0004932:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004935:	0f b7 d0             	movzwl %ax,%edx
c0004938:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000493b:	83 e8 01             	sub    $0x1,%eax
c000493e:	89 c1                	mov    %eax,%ecx
c0004940:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004943:	52                   	push   %edx
c0004944:	51                   	push   %ecx
c0004945:	50                   	push   %eax
c0004946:	68 00 08 01 c0       	push   $0xc0010800
c000494b:	e8 f5 fd ff ff       	call   c0004745 <InitDescriptor>
c0004950:	83 c4 10             	add    $0x10,%esp
c0004953:	c7 45 e4 00 80 0b c0 	movl   $0xc00b8000,-0x1c(%ebp)
c000495a:	68 f2 00 00 00       	push   $0xf2
c000495f:	68 ff ff 00 00       	push   $0xffff
c0004964:	ff 75 e4             	pushl  -0x1c(%ebp)
c0004967:	68 f8 07 01 c0       	push   $0xc00107f8
c000496c:	e8 d4 fd ff ff       	call   c0004745 <InitDescriptor>
c0004971:	83 c4 10             	add    $0x10,%esp
c0004974:	c7 45 e0 b2 0c 00 00 	movl   $0xcb2,-0x20(%ebp)
c000497b:	c7 45 dc 9a 0c 00 00 	movl   $0xc9a,-0x24(%ebp)
c0004982:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%ebp)
c0004989:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000498c:	0f b7 c0             	movzwl %ax,%eax
c000498f:	50                   	push   %eax
c0004990:	ff 75 d8             	pushl  -0x28(%ebp)
c0004993:	6a 00                	push   $0x0
c0004995:	68 08 08 01 c0       	push   $0xc0010808
c000499a:	e8 a6 fd ff ff       	call   c0004745 <InitDescriptor>
c000499f:	83 c4 10             	add    $0x10,%esp
c00049a2:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00049a5:	0f b7 c0             	movzwl %ax,%eax
c00049a8:	50                   	push   %eax
c00049a9:	ff 75 d8             	pushl  -0x28(%ebp)
c00049ac:	6a 00                	push   $0x0
c00049ae:	68 10 08 01 c0       	push   $0xc0010810
c00049b3:	e8 8d fd ff ff       	call   c0004745 <InitDescriptor>
c00049b8:	83 c4 10             	add    $0x10,%esp
c00049bb:	c7 45 d4 b2 0c 00 00 	movl   $0xcb2,-0x2c(%ebp)
c00049c2:	c7 45 d0 ba 0c 00 00 	movl   $0xcba,-0x30(%ebp)
c00049c9:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00049cc:	0f b7 c0             	movzwl %ax,%eax
c00049cf:	50                   	push   %eax
c00049d0:	ff 75 d8             	pushl  -0x28(%ebp)
c00049d3:	6a 00                	push   $0x0
c00049d5:	68 18 08 01 c0       	push   $0xc0010818
c00049da:	e8 66 fd ff ff       	call   c0004745 <InitDescriptor>
c00049df:	83 c4 10             	add    $0x10,%esp
c00049e2:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00049e5:	0f b7 c0             	movzwl %ax,%eax
c00049e8:	50                   	push   %eax
c00049e9:	ff 75 d8             	pushl  -0x28(%ebp)
c00049ec:	6a 00                	push   $0x0
c00049ee:	68 20 08 01 c0       	push   $0xc0010820
c00049f3:	e8 4d fd ff ff       	call   c0004745 <InitDescriptor>
c00049f8:	83 c4 10             	add    $0x10,%esp
c00049fb:	90                   	nop
c00049fc:	c9                   	leave  
c00049fd:	c3                   	ret    

c00049fe <InitInterruptDesc>:
c00049fe:	55                   	push   %ebp
c00049ff:	89 e5                	mov    %esp,%ebp
c0004a01:	83 ec 10             	sub    $0x10,%esp
c0004a04:	8b 45 08             	mov    0x8(%ebp),%eax
c0004a07:	c1 e0 03             	shl    $0x3,%eax
c0004a0a:	05 e0 16 01 c0       	add    $0xc00116e0,%eax
c0004a0f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004a12:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004a15:	c6 40 04 00          	movb   $0x0,0x4(%eax)
c0004a19:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004a1c:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0004a1f:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004a22:	89 c2                	mov    %eax,%edx
c0004a24:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004a27:	66 89 10             	mov    %dx,(%eax)
c0004a2a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004a2d:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
c0004a33:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004a36:	c1 f8 10             	sar    $0x10,%eax
c0004a39:	89 c2                	mov    %eax,%edx
c0004a3b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004a3e:	66 89 50 06          	mov    %dx,0x6(%eax)
c0004a42:	8b 45 10             	mov    0x10(%ebp),%eax
c0004a45:	c1 e0 04             	shl    $0x4,%eax
c0004a48:	89 c2                	mov    %eax,%edx
c0004a4a:	8b 45 14             	mov    0x14(%ebp),%eax
c0004a4d:	09 d0                	or     %edx,%eax
c0004a4f:	89 c2                	mov    %eax,%edx
c0004a51:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004a54:	88 50 05             	mov    %dl,0x5(%eax)
c0004a57:	90                   	nop
c0004a58:	c9                   	leave  
c0004a59:	c3                   	ret    

c0004a5a <ReloadGDT>:
c0004a5a:	55                   	push   %ebp
c0004a5b:	89 e5                	mov    %esp,%ebp
c0004a5d:	83 ec 28             	sub    $0x28,%esp
c0004a60:	b8 c8 16 01 c0       	mov    $0xc00116c8,%eax
c0004a65:	0f b7 00             	movzwl (%eax),%eax
c0004a68:	98                   	cwtl   
c0004a69:	ba ca 16 01 c0       	mov    $0xc00116ca,%edx
c0004a6e:	8b 12                	mov    (%edx),%edx
c0004a70:	83 ec 04             	sub    $0x4,%esp
c0004a73:	50                   	push   %eax
c0004a74:	52                   	push   %edx
c0004a75:	68 c0 07 01 c0       	push   $0xc00107c0
c0004a7a:	e8 92 73 00 00       	call   c000be11 <Memcpy2>
c0004a7f:	83 c4 10             	add    $0x10,%esp
c0004a82:	c7 45 f0 c8 16 01 c0 	movl   $0xc00116c8,-0x10(%ebp)
c0004a89:	c7 45 ec ca 16 01 c0 	movl   $0xc00116ca,-0x14(%ebp)
c0004a90:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004a93:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
c0004a98:	ba c0 07 01 c0       	mov    $0xc00107c0,%edx
c0004a9d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004aa0:	89 10                	mov    %edx,(%eax)
c0004aa2:	c7 45 e8 88 07 01 c0 	movl   $0xc0010788,-0x18(%ebp)
c0004aa9:	c7 45 e4 8a 07 01 c0 	movl   $0xc001078a,-0x1c(%ebp)
c0004ab0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004ab3:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
c0004ab8:	ba e0 16 01 c0       	mov    $0xc00116e0,%edx
c0004abd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004ac0:	89 10                	mov    %edx,(%eax)
c0004ac2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0004ac9:	eb 04                	jmp    c0004acf <ReloadGDT+0x75>
c0004acb:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0004acf:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c0004ad6:	7e f3                	jle    c0004acb <ReloadGDT+0x71>
c0004ad8:	e8 70 37 00 00       	call   c000824d <init_internal_interrupt>
c0004add:	e8 ae fd ff ff       	call   c0004890 <init_propt>
c0004ae2:	90                   	nop
c0004ae3:	c9                   	leave  
c0004ae4:	c3                   	ret    

c0004ae5 <select_console>:
c0004ae5:	55                   	push   %ebp
c0004ae6:	89 e5                	mov    %esp,%ebp
c0004ae8:	83 ec 18             	sub    $0x18,%esp
c0004aeb:	8b 45 08             	mov    0x8(%ebp),%eax
c0004aee:	88 45 f4             	mov    %al,-0xc(%ebp)
c0004af1:	80 7d f4 00          	cmpb   $0x0,-0xc(%ebp)
c0004af5:	75 27                	jne    c0004b1e <select_console+0x39>
c0004af7:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
c0004afb:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0004b01:	05 00 0e 01 c0       	add    $0xc0010e00,%eax
c0004b06:	a3 80 07 01 c0       	mov    %eax,0xc0010780
c0004b0b:	a1 80 07 01 c0       	mov    0xc0010780,%eax
c0004b10:	83 ec 0c             	sub    $0xc,%esp
c0004b13:	50                   	push   %eax
c0004b14:	e8 08 00 00 00       	call   c0004b21 <flush>
c0004b19:	83 c4 10             	add    $0x10,%esp
c0004b1c:	eb 01                	jmp    c0004b1f <select_console+0x3a>
c0004b1e:	90                   	nop
c0004b1f:	c9                   	leave  
c0004b20:	c3                   	ret    

c0004b21 <flush>:
c0004b21:	55                   	push   %ebp
c0004b22:	89 e5                	mov    %esp,%ebp
c0004b24:	83 ec 08             	sub    $0x8,%esp
c0004b27:	8b 45 08             	mov    0x8(%ebp),%eax
c0004b2a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004b30:	8b 40 0c             	mov    0xc(%eax),%eax
c0004b33:	83 ec 0c             	sub    $0xc,%esp
c0004b36:	50                   	push   %eax
c0004b37:	e8 1e 00 00 00       	call   c0004b5a <set_cursor>
c0004b3c:	83 c4 10             	add    $0x10,%esp
c0004b3f:	8b 45 08             	mov    0x8(%ebp),%eax
c0004b42:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004b48:	8b 40 08             	mov    0x8(%eax),%eax
c0004b4b:	83 ec 0c             	sub    $0xc,%esp
c0004b4e:	50                   	push   %eax
c0004b4f:	e8 64 00 00 00       	call   c0004bb8 <set_console_start_video_addr>
c0004b54:	83 c4 10             	add    $0x10,%esp
c0004b57:	90                   	nop
c0004b58:	c9                   	leave  
c0004b59:	c3                   	ret    

c0004b5a <set_cursor>:
c0004b5a:	55                   	push   %ebp
c0004b5b:	89 e5                	mov    %esp,%ebp
c0004b5d:	83 ec 08             	sub    $0x8,%esp
c0004b60:	83 ec 08             	sub    $0x8,%esp
c0004b63:	6a 0e                	push   $0xe
c0004b65:	68 d4 03 00 00       	push   $0x3d4
c0004b6a:	e8 2a c7 ff ff       	call   c0001299 <out_byte>
c0004b6f:	83 c4 10             	add    $0x10,%esp
c0004b72:	8b 45 08             	mov    0x8(%ebp),%eax
c0004b75:	c1 e8 08             	shr    $0x8,%eax
c0004b78:	0f b7 c0             	movzwl %ax,%eax
c0004b7b:	83 ec 08             	sub    $0x8,%esp
c0004b7e:	50                   	push   %eax
c0004b7f:	68 d5 03 00 00       	push   $0x3d5
c0004b84:	e8 10 c7 ff ff       	call   c0001299 <out_byte>
c0004b89:	83 c4 10             	add    $0x10,%esp
c0004b8c:	83 ec 08             	sub    $0x8,%esp
c0004b8f:	6a 0f                	push   $0xf
c0004b91:	68 d4 03 00 00       	push   $0x3d4
c0004b96:	e8 fe c6 ff ff       	call   c0001299 <out_byte>
c0004b9b:	83 c4 10             	add    $0x10,%esp
c0004b9e:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ba1:	0f b7 c0             	movzwl %ax,%eax
c0004ba4:	83 ec 08             	sub    $0x8,%esp
c0004ba7:	50                   	push   %eax
c0004ba8:	68 d5 03 00 00       	push   $0x3d5
c0004bad:	e8 e7 c6 ff ff       	call   c0001299 <out_byte>
c0004bb2:	83 c4 10             	add    $0x10,%esp
c0004bb5:	90                   	nop
c0004bb6:	c9                   	leave  
c0004bb7:	c3                   	ret    

c0004bb8 <set_console_start_video_addr>:
c0004bb8:	55                   	push   %ebp
c0004bb9:	89 e5                	mov    %esp,%ebp
c0004bbb:	83 ec 08             	sub    $0x8,%esp
c0004bbe:	83 ec 08             	sub    $0x8,%esp
c0004bc1:	6a 0c                	push   $0xc
c0004bc3:	68 d4 03 00 00       	push   $0x3d4
c0004bc8:	e8 cc c6 ff ff       	call   c0001299 <out_byte>
c0004bcd:	83 c4 10             	add    $0x10,%esp
c0004bd0:	8b 45 08             	mov    0x8(%ebp),%eax
c0004bd3:	c1 e8 08             	shr    $0x8,%eax
c0004bd6:	0f b7 c0             	movzwl %ax,%eax
c0004bd9:	83 ec 08             	sub    $0x8,%esp
c0004bdc:	50                   	push   %eax
c0004bdd:	68 d5 03 00 00       	push   $0x3d5
c0004be2:	e8 b2 c6 ff ff       	call   c0001299 <out_byte>
c0004be7:	83 c4 10             	add    $0x10,%esp
c0004bea:	83 ec 08             	sub    $0x8,%esp
c0004bed:	6a 0d                	push   $0xd
c0004bef:	68 d4 03 00 00       	push   $0x3d4
c0004bf4:	e8 a0 c6 ff ff       	call   c0001299 <out_byte>
c0004bf9:	83 c4 10             	add    $0x10,%esp
c0004bfc:	8b 45 08             	mov    0x8(%ebp),%eax
c0004bff:	0f b7 c0             	movzwl %ax,%eax
c0004c02:	83 ec 08             	sub    $0x8,%esp
c0004c05:	50                   	push   %eax
c0004c06:	68 d5 03 00 00       	push   $0x3d5
c0004c0b:	e8 89 c6 ff ff       	call   c0001299 <out_byte>
c0004c10:	83 c4 10             	add    $0x10,%esp
c0004c13:	90                   	nop
c0004c14:	c9                   	leave  
c0004c15:	c3                   	ret    

c0004c16 <put_key>:
c0004c16:	55                   	push   %ebp
c0004c17:	89 e5                	mov    %esp,%ebp
c0004c19:	83 ec 04             	sub    $0x4,%esp
c0004c1c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004c1f:	88 45 fc             	mov    %al,-0x4(%ebp)
c0004c22:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c25:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0004c2b:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c0004c30:	77 4d                	ja     c0004c7f <put_key+0x69>
c0004c32:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c35:	8b 00                	mov    (%eax),%eax
c0004c37:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
c0004c3b:	89 10                	mov    %edx,(%eax)
c0004c3d:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c40:	8b 00                	mov    (%eax),%eax
c0004c42:	8d 50 04             	lea    0x4(%eax),%edx
c0004c45:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c48:	89 10                	mov    %edx,(%eax)
c0004c4a:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c4d:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0004c53:	8d 50 01             	lea    0x1(%eax),%edx
c0004c56:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c59:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0004c5f:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c62:	8b 00                	mov    (%eax),%eax
c0004c64:	8b 55 08             	mov    0x8(%ebp),%edx
c0004c67:	83 c2 08             	add    $0x8,%edx
c0004c6a:	81 c2 00 08 00 00    	add    $0x800,%edx
c0004c70:	39 d0                	cmp    %edx,%eax
c0004c72:	75 0b                	jne    c0004c7f <put_key+0x69>
c0004c74:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c77:	8d 50 08             	lea    0x8(%eax),%edx
c0004c7a:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c7d:	89 10                	mov    %edx,(%eax)
c0004c7f:	90                   	nop
c0004c80:	c9                   	leave  
c0004c81:	c3                   	ret    

c0004c82 <scroll_up>:
c0004c82:	55                   	push   %ebp
c0004c83:	89 e5                	mov    %esp,%ebp
c0004c85:	83 ec 08             	sub    $0x8,%esp
c0004c88:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c8b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004c91:	8b 40 08             	mov    0x8(%eax),%eax
c0004c94:	8d 50 b0             	lea    -0x50(%eax),%edx
c0004c97:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c9a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004ca0:	8b 00                	mov    (%eax),%eax
c0004ca2:	39 c2                	cmp    %eax,%edx
c0004ca4:	76 1b                	jbe    c0004cc1 <scroll_up+0x3f>
c0004ca6:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ca9:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004caf:	8b 40 08             	mov    0x8(%eax),%eax
c0004cb2:	83 e8 50             	sub    $0x50,%eax
c0004cb5:	83 ec 0c             	sub    $0xc,%esp
c0004cb8:	50                   	push   %eax
c0004cb9:	e8 fa fe ff ff       	call   c0004bb8 <set_console_start_video_addr>
c0004cbe:	83 c4 10             	add    $0x10,%esp
c0004cc1:	90                   	nop
c0004cc2:	c9                   	leave  
c0004cc3:	c3                   	ret    

c0004cc4 <scroll_down>:
c0004cc4:	55                   	push   %ebp
c0004cc5:	89 e5                	mov    %esp,%ebp
c0004cc7:	83 ec 08             	sub    $0x8,%esp
c0004cca:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ccd:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004cd3:	8b 40 08             	mov    0x8(%eax),%eax
c0004cd6:	8d 48 50             	lea    0x50(%eax),%ecx
c0004cd9:	8b 45 08             	mov    0x8(%ebp),%eax
c0004cdc:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004ce2:	8b 10                	mov    (%eax),%edx
c0004ce4:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ce7:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004ced:	8b 40 04             	mov    0x4(%eax),%eax
c0004cf0:	01 d0                	add    %edx,%eax
c0004cf2:	39 c1                	cmp    %eax,%ecx
c0004cf4:	73 36                	jae    c0004d2c <scroll_down+0x68>
c0004cf6:	8b 45 08             	mov    0x8(%ebp),%eax
c0004cf9:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004cff:	8b 40 08             	mov    0x8(%eax),%eax
c0004d02:	83 c0 50             	add    $0x50,%eax
c0004d05:	83 ec 0c             	sub    $0xc,%esp
c0004d08:	50                   	push   %eax
c0004d09:	e8 aa fe ff ff       	call   c0004bb8 <set_console_start_video_addr>
c0004d0e:	83 c4 10             	add    $0x10,%esp
c0004d11:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d14:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004d1a:	8b 50 08             	mov    0x8(%eax),%edx
c0004d1d:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d20:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004d26:	83 c2 50             	add    $0x50,%edx
c0004d29:	89 50 08             	mov    %edx,0x8(%eax)
c0004d2c:	90                   	nop
c0004d2d:	c9                   	leave  
c0004d2e:	c3                   	ret    

c0004d2f <out_char>:
c0004d2f:	55                   	push   %ebp
c0004d30:	89 e5                	mov    %esp,%ebp
c0004d32:	83 ec 28             	sub    $0x28,%esp
c0004d35:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004d38:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0004d3b:	e8 73 2d 00 00       	call   c0007ab3 <intr_disable>
c0004d40:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004d43:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d46:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004d4c:	8b 40 0c             	mov    0xc(%eax),%eax
c0004d4f:	05 00 c0 05 60       	add    $0x6005c000,%eax
c0004d54:	01 c0                	add    %eax,%eax
c0004d56:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0004d59:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
c0004d5d:	83 f8 08             	cmp    $0x8,%eax
c0004d60:	0f 84 8d 00 00 00    	je     c0004df3 <out_char+0xc4>
c0004d66:	83 f8 0a             	cmp    $0xa,%eax
c0004d69:	0f 85 c9 00 00 00    	jne    c0004e38 <out_char+0x109>
c0004d6f:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d72:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004d78:	8b 50 0c             	mov    0xc(%eax),%edx
c0004d7b:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d7e:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004d84:	8b 08                	mov    (%eax),%ecx
c0004d86:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d89:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004d8f:	8b 40 04             	mov    0x4(%eax),%eax
c0004d92:	01 c8                	add    %ecx,%eax
c0004d94:	83 e8 50             	sub    $0x50,%eax
c0004d97:	39 c2                	cmp    %eax,%edx
c0004d99:	0f 83 f4 00 00 00    	jae    c0004e93 <out_char+0x164>
c0004d9f:	8b 45 08             	mov    0x8(%ebp),%eax
c0004da2:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004da8:	8b 08                	mov    (%eax),%ecx
c0004daa:	8b 45 08             	mov    0x8(%ebp),%eax
c0004dad:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004db3:	8b 50 0c             	mov    0xc(%eax),%edx
c0004db6:	8b 45 08             	mov    0x8(%ebp),%eax
c0004db9:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004dbf:	8b 00                	mov    (%eax),%eax
c0004dc1:	29 c2                	sub    %eax,%edx
c0004dc3:	89 d0                	mov    %edx,%eax
c0004dc5:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
c0004dca:	f7 e2                	mul    %edx
c0004dcc:	89 d0                	mov    %edx,%eax
c0004dce:	c1 e8 06             	shr    $0x6,%eax
c0004dd1:	8d 50 01             	lea    0x1(%eax),%edx
c0004dd4:	89 d0                	mov    %edx,%eax
c0004dd6:	c1 e0 02             	shl    $0x2,%eax
c0004dd9:	01 d0                	add    %edx,%eax
c0004ddb:	c1 e0 04             	shl    $0x4,%eax
c0004dde:	89 c2                	mov    %eax,%edx
c0004de0:	8b 45 08             	mov    0x8(%ebp),%eax
c0004de3:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004de9:	01 ca                	add    %ecx,%edx
c0004deb:	89 50 0c             	mov    %edx,0xc(%eax)
c0004dee:	e9 a0 00 00 00       	jmp    c0004e93 <out_char+0x164>
c0004df3:	8b 45 08             	mov    0x8(%ebp),%eax
c0004df6:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004dfc:	8b 50 0c             	mov    0xc(%eax),%edx
c0004dff:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e02:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004e08:	8b 00                	mov    (%eax),%eax
c0004e0a:	39 c2                	cmp    %eax,%edx
c0004e0c:	0f 86 84 00 00 00    	jbe    c0004e96 <out_char+0x167>
c0004e12:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e15:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004e1b:	8b 50 0c             	mov    0xc(%eax),%edx
c0004e1e:	83 ea 01             	sub    $0x1,%edx
c0004e21:	89 50 0c             	mov    %edx,0xc(%eax)
c0004e24:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004e27:	83 e8 02             	sub    $0x2,%eax
c0004e2a:	c6 00 20             	movb   $0x20,(%eax)
c0004e2d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004e30:	83 e8 01             	sub    $0x1,%eax
c0004e33:	c6 00 00             	movb   $0x0,(%eax)
c0004e36:	eb 5e                	jmp    c0004e96 <out_char+0x167>
c0004e38:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e3b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004e41:	8b 40 0c             	mov    0xc(%eax),%eax
c0004e44:	8d 48 01             	lea    0x1(%eax),%ecx
c0004e47:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e4a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004e50:	8b 10                	mov    (%eax),%edx
c0004e52:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e55:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004e5b:	8b 40 04             	mov    0x4(%eax),%eax
c0004e5e:	01 d0                	add    %edx,%eax
c0004e60:	39 c1                	cmp    %eax,%ecx
c0004e62:	73 35                	jae    c0004e99 <out_char+0x16a>
c0004e64:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004e67:	8d 50 01             	lea    0x1(%eax),%edx
c0004e6a:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0004e6d:	0f b6 55 e4          	movzbl -0x1c(%ebp),%edx
c0004e71:	88 10                	mov    %dl,(%eax)
c0004e73:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004e76:	8d 50 01             	lea    0x1(%eax),%edx
c0004e79:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0004e7c:	c6 00 0a             	movb   $0xa,(%eax)
c0004e7f:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e82:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004e88:	8b 50 0c             	mov    0xc(%eax),%edx
c0004e8b:	83 c2 01             	add    $0x1,%edx
c0004e8e:	89 50 0c             	mov    %edx,0xc(%eax)
c0004e91:	eb 06                	jmp    c0004e99 <out_char+0x16a>
c0004e93:	90                   	nop
c0004e94:	eb 14                	jmp    c0004eaa <out_char+0x17b>
c0004e96:	90                   	nop
c0004e97:	eb 11                	jmp    c0004eaa <out_char+0x17b>
c0004e99:	90                   	nop
c0004e9a:	eb 0e                	jmp    c0004eaa <out_char+0x17b>
c0004e9c:	83 ec 0c             	sub    $0xc,%esp
c0004e9f:	ff 75 08             	pushl  0x8(%ebp)
c0004ea2:	e8 1d fe ff ff       	call   c0004cc4 <scroll_down>
c0004ea7:	83 c4 10             	add    $0x10,%esp
c0004eaa:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ead:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004eb3:	8b 50 0c             	mov    0xc(%eax),%edx
c0004eb6:	8b 45 08             	mov    0x8(%ebp),%eax
c0004eb9:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004ebf:	8b 40 08             	mov    0x8(%eax),%eax
c0004ec2:	29 c2                	sub    %eax,%edx
c0004ec4:	89 d0                	mov    %edx,%eax
c0004ec6:	3d d0 07 00 00       	cmp    $0x7d0,%eax
c0004ecb:	77 cf                	ja     c0004e9c <out_char+0x16d>
c0004ecd:	83 ec 0c             	sub    $0xc,%esp
c0004ed0:	ff 75 08             	pushl  0x8(%ebp)
c0004ed3:	e8 49 fc ff ff       	call   c0004b21 <flush>
c0004ed8:	83 c4 10             	add    $0x10,%esp
c0004edb:	83 ec 0c             	sub    $0xc,%esp
c0004ede:	ff 75 f4             	pushl  -0xc(%ebp)
c0004ee1:	e8 f6 2b 00 00       	call   c0007adc <intr_set_status>
c0004ee6:	83 c4 10             	add    $0x10,%esp
c0004ee9:	90                   	nop
c0004eea:	c9                   	leave  
c0004eeb:	c3                   	ret    

c0004eec <tty_dev_read>:
c0004eec:	55                   	push   %ebp
c0004eed:	89 e5                	mov    %esp,%ebp
c0004eef:	83 ec 08             	sub    $0x8,%esp
c0004ef2:	a1 80 07 01 c0       	mov    0xc0010780,%eax
c0004ef7:	39 45 08             	cmp    %eax,0x8(%ebp)
c0004efa:	75 17                	jne    c0004f13 <tty_dev_read+0x27>
c0004efc:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c0004f01:	85 c0                	test   %eax,%eax
c0004f03:	7e 0e                	jle    c0004f13 <tty_dev_read+0x27>
c0004f05:	83 ec 0c             	sub    $0xc,%esp
c0004f08:	ff 75 08             	pushl  0x8(%ebp)
c0004f0b:	e8 89 07 00 00       	call   c0005699 <keyboard_read>
c0004f10:	83 c4 10             	add    $0x10,%esp
c0004f13:	90                   	nop
c0004f14:	c9                   	leave  
c0004f15:	c3                   	ret    

c0004f16 <tty_dev_write>:
c0004f16:	55                   	push   %ebp
c0004f17:	89 e5                	mov    %esp,%ebp
c0004f19:	83 ec 28             	sub    $0x28,%esp
c0004f1c:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f1f:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0004f25:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0004f28:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0004f2f:	e9 88 01 00 00       	jmp    c00050bc <tty_dev_write+0x1a6>
c0004f34:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f37:	8b 40 04             	mov    0x4(%eax),%eax
c0004f3a:	8b 00                	mov    (%eax),%eax
c0004f3c:	88 45 e7             	mov    %al,-0x19(%ebp)
c0004f3f:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f42:	8b 40 04             	mov    0x4(%eax),%eax
c0004f45:	8d 50 04             	lea    0x4(%eax),%edx
c0004f48:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f4b:	89 50 04             	mov    %edx,0x4(%eax)
c0004f4e:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f51:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0004f57:	8d 50 ff             	lea    -0x1(%eax),%edx
c0004f5a:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f5d:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0004f63:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f66:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c0004f6c:	8d 50 01             	lea    0x1(%eax),%edx
c0004f6f:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f72:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0004f78:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f7b:	8b 40 04             	mov    0x4(%eax),%eax
c0004f7e:	8b 55 08             	mov    0x8(%ebp),%edx
c0004f81:	83 c2 08             	add    $0x8,%edx
c0004f84:	81 c2 00 08 00 00    	add    $0x800,%edx
c0004f8a:	39 d0                	cmp    %edx,%eax
c0004f8c:	75 0c                	jne    c0004f9a <tty_dev_write+0x84>
c0004f8e:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f91:	8d 50 08             	lea    0x8(%eax),%edx
c0004f94:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f97:	89 50 04             	mov    %edx,0x4(%eax)
c0004f9a:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f9d:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0004fa3:	85 c0                	test   %eax,%eax
c0004fa5:	0f 84 11 01 00 00    	je     c00050bc <tty_dev_write+0x1a6>
c0004fab:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0004faf:	3c 20                	cmp    $0x20,%al
c0004fb1:	76 08                	jbe    c0004fbb <tty_dev_write+0xa5>
c0004fb3:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0004fb7:	3c 7e                	cmp    $0x7e,%al
c0004fb9:	76 10                	jbe    c0004fcb <tty_dev_write+0xb5>
c0004fbb:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0004fbf:	3c 20                	cmp    $0x20,%al
c0004fc1:	74 08                	je     c0004fcb <tty_dev_write+0xb5>
c0004fc3:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0004fc7:	84 c0                	test   %al,%al
c0004fc9:	75 58                	jne    c0005023 <tty_dev_write+0x10d>
c0004fcb:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fce:	8b 90 18 08 00 00    	mov    0x818(%eax),%edx
c0004fd4:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fd7:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c0004fdd:	01 d0                	add    %edx,%eax
c0004fdf:	83 e8 01             	sub    $0x1,%eax
c0004fe2:	89 c2                	mov    %eax,%edx
c0004fe4:	83 ec 04             	sub    $0x4,%esp
c0004fe7:	6a 01                	push   $0x1
c0004fe9:	8d 45 e7             	lea    -0x19(%ebp),%eax
c0004fec:	50                   	push   %eax
c0004fed:	52                   	push   %edx
c0004fee:	e8 24 2b 00 00       	call   c0007b17 <Memcpy>
c0004ff3:	83 c4 10             	add    $0x10,%esp
c0004ff6:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ff9:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0004fff:	8d 50 ff             	lea    -0x1(%eax),%edx
c0005002:	8b 45 08             	mov    0x8(%ebp),%eax
c0005005:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c000500b:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c000500f:	0f b6 c0             	movzbl %al,%eax
c0005012:	83 ec 08             	sub    $0x8,%esp
c0005015:	50                   	push   %eax
c0005016:	ff 75 08             	pushl  0x8(%ebp)
c0005019:	e8 11 fd ff ff       	call   c0004d2f <out_char>
c000501e:	83 c4 10             	add    $0x10,%esp
c0005021:	eb 7c                	jmp    c000509f <tty_dev_write+0x189>
c0005023:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0005027:	3c 08                	cmp    $0x8,%al
c0005029:	75 42                	jne    c000506d <tty_dev_write+0x157>
c000502b:	8b 45 08             	mov    0x8(%ebp),%eax
c000502e:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0005034:	8d 50 01             	lea    0x1(%eax),%edx
c0005037:	8b 45 08             	mov    0x8(%ebp),%eax
c000503a:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c0005040:	8b 45 08             	mov    0x8(%ebp),%eax
c0005043:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c0005049:	8d 50 fe             	lea    -0x2(%eax),%edx
c000504c:	8b 45 08             	mov    0x8(%ebp),%eax
c000504f:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0005055:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0005059:	0f b6 c0             	movzbl %al,%eax
c000505c:	83 ec 08             	sub    $0x8,%esp
c000505f:	50                   	push   %eax
c0005060:	ff 75 08             	pushl  0x8(%ebp)
c0005063:	e8 c7 fc ff ff       	call   c0004d2f <out_char>
c0005068:	83 c4 10             	add    $0x10,%esp
c000506b:	eb 32                	jmp    c000509f <tty_dev_write+0x189>
c000506d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0005071:	3c 0a                	cmp    $0xa,%al
c0005073:	75 2a                	jne    c000509f <tty_dev_write+0x189>
c0005075:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0005079:	0f b6 c0             	movzbl %al,%eax
c000507c:	83 ec 08             	sub    $0x8,%esp
c000507f:	50                   	push   %eax
c0005080:	ff 75 08             	pushl  0x8(%ebp)
c0005083:	e8 a7 fc ff ff       	call   c0004d2f <out_char>
c0005088:	83 c4 10             	add    $0x10,%esp
c000508b:	8b 45 08             	mov    0x8(%ebp),%eax
c000508e:	c7 80 0c 08 00 00 00 	movl   $0x0,0x80c(%eax)
c0005095:	00 00 00 
c0005098:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c000509f:	8b 45 08             	mov    0x8(%ebp),%eax
c00050a2:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c00050a8:	8b 45 08             	mov    0x8(%ebp),%eax
c00050ab:	8b 80 14 08 00 00    	mov    0x814(%eax),%eax
c00050b1:	39 c2                	cmp    %eax,%edx
c00050b3:	75 07                	jne    c00050bc <tty_dev_write+0x1a6>
c00050b5:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c00050bc:	8b 45 08             	mov    0x8(%ebp),%eax
c00050bf:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c00050c5:	85 c0                	test   %eax,%eax
c00050c7:	0f 85 67 fe ff ff    	jne    c0004f34 <tty_dev_write+0x1e>
c00050cd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00050d1:	74 6d                	je     c0005140 <tty_dev_write+0x22a>
c00050d3:	c7 45 ec 7c 00 00 00 	movl   $0x7c,-0x14(%ebp)
c00050da:	83 ec 0c             	sub    $0xc,%esp
c00050dd:	ff 75 ec             	pushl  -0x14(%ebp)
c00050e0:	e8 df d3 ff ff       	call   c00024c4 <sys_malloc>
c00050e5:	83 c4 10             	add    $0x10,%esp
c00050e8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00050eb:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00050ee:	c7 40 78 66 00 00 00 	movl   $0x66,0x78(%eax)
c00050f5:	8b 45 08             	mov    0x8(%ebp),%eax
c00050f8:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c00050fe:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005101:	89 50 60             	mov    %edx,0x60(%eax)
c0005104:	8b 45 08             	mov    0x8(%ebp),%eax
c0005107:	8b 90 20 08 00 00    	mov    0x820(%eax),%edx
c000510d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005110:	89 50 68             	mov    %edx,0x68(%eax)
c0005113:	8b 45 08             	mov    0x8(%ebp),%eax
c0005116:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c000511c:	83 ec 04             	sub    $0x4,%esp
c000511f:	50                   	push   %eax
c0005120:	ff 75 e8             	pushl  -0x18(%ebp)
c0005123:	6a 01                	push   $0x1
c0005125:	e8 ae 4e 00 00       	call   c0009fd8 <send_rec>
c000512a:	83 c4 10             	add    $0x10,%esp
c000512d:	83 ec 08             	sub    $0x8,%esp
c0005130:	ff 75 ec             	pushl  -0x14(%ebp)
c0005133:	ff 75 e8             	pushl  -0x18(%ebp)
c0005136:	e8 9e d3 ff ff       	call   c00024d9 <sys_free>
c000513b:	83 c4 10             	add    $0x10,%esp
c000513e:	eb 01                	jmp    c0005141 <tty_dev_write+0x22b>
c0005140:	90                   	nop
c0005141:	c9                   	leave  
c0005142:	c3                   	ret    

c0005143 <tty_do_read>:
c0005143:	55                   	push   %ebp
c0005144:	89 e5                	mov    %esp,%ebp
c0005146:	83 ec 08             	sub    $0x8,%esp
c0005149:	8b 45 08             	mov    0x8(%ebp),%eax
c000514c:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c0005153:	00 00 00 
c0005156:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005159:	8b 50 68             	mov    0x68(%eax),%edx
c000515c:	8b 45 08             	mov    0x8(%ebp),%eax
c000515f:	89 90 20 08 00 00    	mov    %edx,0x820(%eax)
c0005165:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005168:	8b 00                	mov    (%eax),%eax
c000516a:	89 c2                	mov    %eax,%edx
c000516c:	8b 45 08             	mov    0x8(%ebp),%eax
c000516f:	89 90 1c 08 00 00    	mov    %edx,0x81c(%eax)
c0005175:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005178:	8b 50 60             	mov    0x60(%eax),%edx
c000517b:	8b 45 08             	mov    0x8(%ebp),%eax
c000517e:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c0005184:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005187:	8b 50 60             	mov    0x60(%eax),%edx
c000518a:	8b 45 08             	mov    0x8(%ebp),%eax
c000518d:	89 90 14 08 00 00    	mov    %edx,0x814(%eax)
c0005193:	8b 45 08             	mov    0x8(%ebp),%eax
c0005196:	8b 90 0c 08 00 00    	mov    0x80c(%eax),%edx
c000519c:	8b 45 0c             	mov    0xc(%ebp),%eax
c000519f:	8b 40 10             	mov    0x10(%eax),%eax
c00051a2:	83 ec 08             	sub    $0x8,%esp
c00051a5:	52                   	push   %edx
c00051a6:	50                   	push   %eax
c00051a7:	e8 6e 1b 00 00       	call   c0006d1a <alloc_virtual_memory>
c00051ac:	83 c4 10             	add    $0x10,%esp
c00051af:	89 c2                	mov    %eax,%edx
c00051b1:	8b 45 08             	mov    0x8(%ebp),%eax
c00051b4:	89 90 18 08 00 00    	mov    %edx,0x818(%eax)
c00051ba:	8b 45 08             	mov    0x8(%ebp),%eax
c00051bd:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c00051c3:	83 f8 02             	cmp    $0x2,%eax
c00051c6:	74 1c                	je     c00051e4 <tty_do_read+0xa1>
c00051c8:	68 3b 01 00 00       	push   $0x13b
c00051cd:	68 31 b4 00 c0       	push   $0xc000b431
c00051d2:	68 31 b4 00 c0       	push   $0xc000b431
c00051d7:	68 3b b4 00 c0       	push   $0xc000b43b
c00051dc:	e8 ba 44 00 00       	call   c000969b <assertion_failure>
c00051e1:	83 c4 10             	add    $0x10,%esp
c00051e4:	8b 45 0c             	mov    0xc(%ebp),%eax
c00051e7:	c7 40 78 67 00 00 00 	movl   $0x67,0x78(%eax)
c00051ee:	8b 45 08             	mov    0x8(%ebp),%eax
c00051f1:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c00051f7:	83 ec 04             	sub    $0x4,%esp
c00051fa:	50                   	push   %eax
c00051fb:	ff 75 0c             	pushl  0xc(%ebp)
c00051fe:	6a 01                	push   $0x1
c0005200:	e8 d3 4d 00 00       	call   c0009fd8 <send_rec>
c0005205:	83 c4 10             	add    $0x10,%esp
c0005208:	90                   	nop
c0005209:	c9                   	leave  
c000520a:	c3                   	ret    

c000520b <tty_do_write>:
c000520b:	55                   	push   %ebp
c000520c:	89 e5                	mov    %esp,%ebp
c000520e:	53                   	push   %ebx
c000520f:	83 ec 24             	sub    $0x24,%esp
c0005212:	89 e0                	mov    %esp,%eax
c0005214:	89 c3                	mov    %eax,%ebx
c0005216:	c7 45 e8 80 00 00 00 	movl   $0x80,-0x18(%ebp)
c000521d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005220:	8d 50 ff             	lea    -0x1(%eax),%edx
c0005223:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c0005226:	89 c2                	mov    %eax,%edx
c0005228:	b8 10 00 00 00       	mov    $0x10,%eax
c000522d:	83 e8 01             	sub    $0x1,%eax
c0005230:	01 d0                	add    %edx,%eax
c0005232:	b9 10 00 00 00       	mov    $0x10,%ecx
c0005237:	ba 00 00 00 00       	mov    $0x0,%edx
c000523c:	f7 f1                	div    %ecx
c000523e:	6b c0 10             	imul   $0x10,%eax,%eax
c0005241:	29 c4                	sub    %eax,%esp
c0005243:	89 e0                	mov    %esp,%eax
c0005245:	83 c0 00             	add    $0x0,%eax
c0005248:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000524b:	83 ec 04             	sub    $0x4,%esp
c000524e:	ff 75 e8             	pushl  -0x18(%ebp)
c0005251:	6a 00                	push   $0x0
c0005253:	ff 75 e0             	pushl  -0x20(%ebp)
c0005256:	e8 e4 6b 00 00       	call   c000be3f <Memset>
c000525b:	83 c4 10             	add    $0x10,%esp
c000525e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005261:	8b 40 60             	mov    0x60(%eax),%eax
c0005264:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005267:	8b 45 08             	mov    0x8(%ebp),%eax
c000526a:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c0005271:	00 00 00 
c0005274:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0005277:	8b 45 0c             	mov    0xc(%ebp),%eax
c000527a:	8b 40 10             	mov    0x10(%eax),%eax
c000527d:	83 ec 08             	sub    $0x8,%esp
c0005280:	52                   	push   %edx
c0005281:	50                   	push   %eax
c0005282:	e8 93 1a 00 00       	call   c0006d1a <alloc_virtual_memory>
c0005287:	83 c4 10             	add    $0x10,%esp
c000528a:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000528d:	eb 7e                	jmp    c000530d <tty_do_write+0x102>
c000528f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005292:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c0005295:	0f 4e 45 ec          	cmovle -0x14(%ebp),%eax
c0005299:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000529c:	8b 45 08             	mov    0x8(%ebp),%eax
c000529f:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c00052a5:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00052a8:	01 d0                	add    %edx,%eax
c00052aa:	83 ec 04             	sub    $0x4,%esp
c00052ad:	ff 75 f0             	pushl  -0x10(%ebp)
c00052b0:	50                   	push   %eax
c00052b1:	ff 75 e0             	pushl  -0x20(%ebp)
c00052b4:	e8 5e 28 00 00       	call   c0007b17 <Memcpy>
c00052b9:	83 c4 10             	add    $0x10,%esp
c00052bc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00052bf:	29 45 ec             	sub    %eax,-0x14(%ebp)
c00052c2:	8b 45 08             	mov    0x8(%ebp),%eax
c00052c5:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c00052cb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00052ce:	01 c2                	add    %eax,%edx
c00052d0:	8b 45 08             	mov    0x8(%ebp),%eax
c00052d3:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c00052d9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00052e0:	eb 25                	jmp    c0005307 <tty_do_write+0xfc>
c00052e2:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00052e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00052e8:	01 d0                	add    %edx,%eax
c00052ea:	0f b6 00             	movzbl (%eax),%eax
c00052ed:	0f b6 c0             	movzbl %al,%eax
c00052f0:	83 ec 08             	sub    $0x8,%esp
c00052f3:	50                   	push   %eax
c00052f4:	ff 75 08             	pushl  0x8(%ebp)
c00052f7:	e8 33 fa ff ff       	call   c0004d2f <out_char>
c00052fc:	83 c4 10             	add    $0x10,%esp
c00052ff:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0005303:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c0005307:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000530b:	75 d5                	jne    c00052e2 <tty_do_write+0xd7>
c000530d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0005311:	0f 85 78 ff ff ff    	jne    c000528f <tty_do_write+0x84>
c0005317:	83 ec 0c             	sub    $0xc,%esp
c000531a:	6a 7c                	push   $0x7c
c000531c:	e8 a3 d1 ff ff       	call   c00024c4 <sys_malloc>
c0005321:	83 c4 10             	add    $0x10,%esp
c0005324:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0005327:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000532a:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0005331:	8b 45 08             	mov    0x8(%ebp),%eax
c0005334:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c000533a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000533d:	89 50 58             	mov    %edx,0x58(%eax)
c0005340:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005343:	8b 00                	mov    (%eax),%eax
c0005345:	83 ec 04             	sub    $0x4,%esp
c0005348:	50                   	push   %eax
c0005349:	ff 75 d8             	pushl  -0x28(%ebp)
c000534c:	6a 01                	push   $0x1
c000534e:	e8 85 4c 00 00       	call   c0009fd8 <send_rec>
c0005353:	83 c4 10             	add    $0x10,%esp
c0005356:	83 ec 08             	sub    $0x8,%esp
c0005359:	6a 7c                	push   $0x7c
c000535b:	ff 75 d8             	pushl  -0x28(%ebp)
c000535e:	e8 76 d1 ff ff       	call   c00024d9 <sys_free>
c0005363:	83 c4 10             	add    $0x10,%esp
c0005366:	89 dc                	mov    %ebx,%esp
c0005368:	90                   	nop
c0005369:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c000536c:	c9                   	leave  
c000536d:	c3                   	ret    

c000536e <init_screen>:
c000536e:	55                   	push   %ebp
c000536f:	89 e5                	mov    %esp,%ebp
c0005371:	83 ec 10             	sub    $0x10,%esp
c0005374:	8b 45 08             	mov    0x8(%ebp),%eax
c0005377:	2d 00 0e 01 c0       	sub    $0xc0010e00,%eax
c000537c:	c1 f8 03             	sar    $0x3,%eax
c000537f:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c0005385:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0005388:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000538b:	c1 e0 04             	shl    $0x4,%eax
c000538e:	8d 90 14 1f 01 c0    	lea    -0x3ffee0ec(%eax),%edx
c0005394:	8b 45 08             	mov    0x8(%ebp),%eax
c0005397:	89 90 24 08 00 00    	mov    %edx,0x824(%eax)
c000539d:	c7 45 f8 ff 3f 00 00 	movl   $0x3fff,-0x8(%ebp)
c00053a4:	8b 45 08             	mov    0x8(%ebp),%eax
c00053a7:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00053ad:	8b 55 f8             	mov    -0x8(%ebp),%edx
c00053b0:	89 50 04             	mov    %edx,0x4(%eax)
c00053b3:	8b 45 08             	mov    0x8(%ebp),%eax
c00053b6:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00053bc:	8b 50 04             	mov    0x4(%eax),%edx
c00053bf:	8b 45 08             	mov    0x8(%ebp),%eax
c00053c2:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00053c8:	0f af 55 fc          	imul   -0x4(%ebp),%edx
c00053cc:	89 10                	mov    %edx,(%eax)
c00053ce:	8b 45 08             	mov    0x8(%ebp),%eax
c00053d1:	8b 90 24 08 00 00    	mov    0x824(%eax),%edx
c00053d7:	8b 45 08             	mov    0x8(%ebp),%eax
c00053da:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00053e0:	8b 12                	mov    (%edx),%edx
c00053e2:	89 50 08             	mov    %edx,0x8(%eax)
c00053e5:	8b 55 08             	mov    0x8(%ebp),%edx
c00053e8:	8b 92 24 08 00 00    	mov    0x824(%edx),%edx
c00053ee:	8b 40 08             	mov    0x8(%eax),%eax
c00053f1:	89 42 0c             	mov    %eax,0xc(%edx)
c00053f4:	90                   	nop
c00053f5:	c9                   	leave  
c00053f6:	c3                   	ret    

c00053f7 <init_tty>:
c00053f7:	55                   	push   %ebp
c00053f8:	89 e5                	mov    %esp,%ebp
c00053fa:	83 ec 18             	sub    $0x18,%esp
c00053fd:	c7 45 f4 00 0e 01 c0 	movl   $0xc0010e00,-0xc(%ebp)
c0005404:	e9 92 00 00 00       	jmp    c000549b <init_tty+0xa4>
c0005409:	83 ec 04             	sub    $0x4,%esp
c000540c:	68 28 08 00 00       	push   $0x828
c0005411:	6a 00                	push   $0x0
c0005413:	ff 75 f4             	pushl  -0xc(%ebp)
c0005416:	e8 24 6a 00 00       	call   c000be3f <Memset>
c000541b:	83 c4 10             	add    $0x10,%esp
c000541e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005421:	8d 50 08             	lea    0x8(%eax),%edx
c0005424:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005427:	89 50 04             	mov    %edx,0x4(%eax)
c000542a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000542d:	8b 50 04             	mov    0x4(%eax),%edx
c0005430:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005433:	89 10                	mov    %edx,(%eax)
c0005435:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005438:	c7 80 08 08 00 00 00 	movl   $0x0,0x808(%eax)
c000543f:	00 00 00 
c0005442:	83 ec 0c             	sub    $0xc,%esp
c0005445:	ff 75 f4             	pushl  -0xc(%ebp)
c0005448:	e8 21 ff ff ff       	call   c000536e <init_screen>
c000544d:	83 c4 10             	add    $0x10,%esp
c0005450:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005453:	2d 00 0e 01 c0       	sub    $0xc0010e00,%eax
c0005458:	85 c0                	test   %eax,%eax
c000545a:	7e 38                	jle    c0005494 <init_tty+0x9d>
c000545c:	83 ec 08             	sub    $0x8,%esp
c000545f:	6a 23                	push   $0x23
c0005461:	ff 75 f4             	pushl  -0xc(%ebp)
c0005464:	e8 c6 f8 ff ff       	call   c0004d2f <out_char>
c0005469:	83 c4 10             	add    $0x10,%esp
c000546c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000546f:	05 a8 8f 01 00       	add    $0x18fa8,%eax
c0005474:	2d 00 0e 01 c0       	sub    $0xc0010e00,%eax
c0005479:	c1 f8 03             	sar    $0x3,%eax
c000547c:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c0005482:	0f b6 c0             	movzbl %al,%eax
c0005485:	83 ec 08             	sub    $0x8,%esp
c0005488:	50                   	push   %eax
c0005489:	ff 75 f4             	pushl  -0xc(%ebp)
c000548c:	e8 9e f8 ff ff       	call   c0004d2f <out_char>
c0005491:	83 c4 10             	add    $0x10,%esp
c0005494:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c000549b:	b8 28 16 01 c0       	mov    $0xc0011628,%eax
c00054a0:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c00054a3:	0f 82 60 ff ff ff    	jb     c0005409 <init_tty+0x12>
c00054a9:	90                   	nop
c00054aa:	c9                   	leave  
c00054ab:	c3                   	ret    

c00054ac <TaskTTY>:
c00054ac:	55                   	push   %ebp
c00054ad:	89 e5                	mov    %esp,%ebp
c00054af:	83 ec 28             	sub    $0x28,%esp
c00054b2:	e8 40 ff ff ff       	call   c00053f7 <init_tty>
c00054b7:	83 ec 0c             	sub    $0xc,%esp
c00054ba:	6a 00                	push   $0x0
c00054bc:	e8 24 f6 ff ff       	call   c0004ae5 <select_console>
c00054c1:	83 c4 10             	add    $0x10,%esp
c00054c4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00054cb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c00054d2:	83 ec 0c             	sub    $0xc,%esp
c00054d5:	6a 7c                	push   $0x7c
c00054d7:	e8 e8 cf ff ff       	call   c00024c4 <sys_malloc>
c00054dc:	83 c4 10             	add    $0x10,%esp
c00054df:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00054e2:	c7 45 f4 00 0e 01 c0 	movl   $0xc0010e00,-0xc(%ebp)
c00054e9:	eb 30                	jmp    c000551b <TaskTTY+0x6f>
c00054eb:	83 ec 0c             	sub    $0xc,%esp
c00054ee:	ff 75 f4             	pushl  -0xc(%ebp)
c00054f1:	e8 f6 f9 ff ff       	call   c0004eec <tty_dev_read>
c00054f6:	83 c4 10             	add    $0x10,%esp
c00054f9:	83 ec 0c             	sub    $0xc,%esp
c00054fc:	ff 75 f4             	pushl  -0xc(%ebp)
c00054ff:	e8 12 fa ff ff       	call   c0004f16 <tty_dev_write>
c0005504:	83 c4 10             	add    $0x10,%esp
c0005507:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000550a:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0005510:	85 c0                	test   %eax,%eax
c0005512:	75 d7                	jne    c00054eb <TaskTTY+0x3f>
c0005514:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c000551b:	b8 28 16 01 c0       	mov    $0xc0011628,%eax
c0005520:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0005523:	72 c6                	jb     c00054eb <TaskTTY+0x3f>
c0005525:	83 ec 04             	sub    $0x4,%esp
c0005528:	6a 12                	push   $0x12
c000552a:	ff 75 e8             	pushl  -0x18(%ebp)
c000552d:	6a 02                	push   $0x2
c000552f:	e8 a4 4a 00 00       	call   c0009fd8 <send_rec>
c0005534:	83 c4 10             	add    $0x10,%esp
c0005537:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000553a:	8b 40 78             	mov    0x78(%eax),%eax
c000553d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0005540:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c0005547:	74 28                	je     c0005571 <TaskTTY+0xc5>
c0005549:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c0005550:	7f 0b                	jg     c000555d <TaskTTY+0xb1>
c0005552:	81 7d e4 d1 07 00 00 	cmpl   $0x7d1,-0x1c(%ebp)
c0005559:	74 4e                	je     c00055a9 <TaskTTY+0xfd>
c000555b:	eb 4d                	jmp    c00055aa <TaskTTY+0xfe>
c000555d:	81 7d e4 d3 07 00 00 	cmpl   $0x7d3,-0x1c(%ebp)
c0005564:	74 21                	je     c0005587 <TaskTTY+0xdb>
c0005566:	81 7d e4 d5 07 00 00 	cmpl   $0x7d5,-0x1c(%ebp)
c000556d:	74 2e                	je     c000559d <TaskTTY+0xf1>
c000556f:	eb 39                	jmp    c00055aa <TaskTTY+0xfe>
c0005571:	a1 80 07 01 c0       	mov    0xc0010780,%eax
c0005576:	83 ec 08             	sub    $0x8,%esp
c0005579:	ff 75 e8             	pushl  -0x18(%ebp)
c000557c:	50                   	push   %eax
c000557d:	e8 c1 fb ff ff       	call   c0005143 <tty_do_read>
c0005582:	83 c4 10             	add    $0x10,%esp
c0005585:	eb 23                	jmp    c00055aa <TaskTTY+0xfe>
c0005587:	a1 80 07 01 c0       	mov    0xc0010780,%eax
c000558c:	83 ec 08             	sub    $0x8,%esp
c000558f:	ff 75 e8             	pushl  -0x18(%ebp)
c0005592:	50                   	push   %eax
c0005593:	e8 73 fc ff ff       	call   c000520b <tty_do_write>
c0005598:	83 c4 10             	add    $0x10,%esp
c000559b:	eb 0d                	jmp    c00055aa <TaskTTY+0xfe>
c000559d:	c7 05 c0 16 01 c0 00 	movl   $0x0,0xc00116c0
c00055a4:	00 00 00 
c00055a7:	eb 01                	jmp    c00055aa <TaskTTY+0xfe>
c00055a9:	90                   	nop
c00055aa:	e9 33 ff ff ff       	jmp    c00054e2 <TaskTTY+0x36>

c00055af <keyboard_handler>:
c00055af:	55                   	push   %ebp
c00055b0:	89 e5                	mov    %esp,%ebp
c00055b2:	83 ec 18             	sub    $0x18,%esp
c00055b5:	c7 05 c0 16 01 c0 01 	movl   $0x1,0xc00116c0
c00055bc:	00 00 00 
c00055bf:	c7 45 f4 60 00 00 00 	movl   $0x60,-0xc(%ebp)
c00055c6:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c00055cb:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c00055d0:	7f 5e                	jg     c0005630 <keyboard_handler+0x81>
c00055d2:	e8 e4 bc ff ff       	call   c00012bb <disable_int>
c00055d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00055da:	0f b7 c0             	movzwl %ax,%eax
c00055dd:	83 ec 0c             	sub    $0xc,%esp
c00055e0:	50                   	push   %eax
c00055e1:	e8 a7 bc ff ff       	call   c000128d <in_byte>
c00055e6:	83 c4 10             	add    $0x10,%esp
c00055e9:	88 45 f3             	mov    %al,-0xd(%ebp)
c00055ec:	a1 e0 0b 01 c0       	mov    0xc0010be0,%eax
c00055f1:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
c00055f5:	88 10                	mov    %dl,(%eax)
c00055f7:	a1 e0 0b 01 c0       	mov    0xc0010be0,%eax
c00055fc:	83 c0 01             	add    $0x1,%eax
c00055ff:	a3 e0 0b 01 c0       	mov    %eax,0xc0010be0
c0005604:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c0005609:	83 c0 01             	add    $0x1,%eax
c000560c:	a3 e8 0b 01 c0       	mov    %eax,0xc0010be8
c0005611:	a1 e0 0b 01 c0       	mov    0xc0010be0,%eax
c0005616:	ba ec 0d 01 c0       	mov    $0xc0010dec,%edx
c000561b:	39 d0                	cmp    %edx,%eax
c000561d:	72 0a                	jb     c0005629 <keyboard_handler+0x7a>
c000561f:	c7 05 e0 0b 01 c0 ec 	movl   $0xc0010bec,0xc0010be0
c0005626:	0b 01 c0 
c0005629:	e8 8f bc ff ff       	call   c00012bd <enable_int>
c000562e:	eb 01                	jmp    c0005631 <keyboard_handler+0x82>
c0005630:	90                   	nop
c0005631:	c9                   	leave  
c0005632:	c3                   	ret    

c0005633 <read_from_keyboard_buf>:
c0005633:	55                   	push   %ebp
c0005634:	89 e5                	mov    %esp,%ebp
c0005636:	83 ec 18             	sub    $0x18,%esp
c0005639:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
c000563d:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c0005642:	85 c0                	test   %eax,%eax
c0005644:	7f 06                	jg     c000564c <read_from_keyboard_buf+0x19>
c0005646:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c000564a:	eb 4b                	jmp    c0005697 <read_from_keyboard_buf+0x64>
c000564c:	e8 6a bc ff ff       	call   c00012bb <disable_int>
c0005651:	a1 e4 0b 01 c0       	mov    0xc0010be4,%eax
c0005656:	0f b6 00             	movzbl (%eax),%eax
c0005659:	88 45 f7             	mov    %al,-0x9(%ebp)
c000565c:	a1 e4 0b 01 c0       	mov    0xc0010be4,%eax
c0005661:	83 c0 01             	add    $0x1,%eax
c0005664:	a3 e4 0b 01 c0       	mov    %eax,0xc0010be4
c0005669:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c000566e:	83 e8 01             	sub    $0x1,%eax
c0005671:	a3 e8 0b 01 c0       	mov    %eax,0xc0010be8
c0005676:	a1 e4 0b 01 c0       	mov    0xc0010be4,%eax
c000567b:	ba ec 0d 01 c0       	mov    $0xc0010dec,%edx
c0005680:	39 d0                	cmp    %edx,%eax
c0005682:	72 0a                	jb     c000568e <read_from_keyboard_buf+0x5b>
c0005684:	c7 05 e4 0b 01 c0 ec 	movl   $0xc0010bec,0xc0010be4
c000568b:	0b 01 c0 
c000568e:	e8 2a bc ff ff       	call   c00012bd <enable_int>
c0005693:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c0005697:	c9                   	leave  
c0005698:	c3                   	ret    

c0005699 <keyboard_read>:
c0005699:	55                   	push   %ebp
c000569a:	89 e5                	mov    %esp,%ebp
c000569c:	83 ec 28             	sub    $0x28,%esp
c000569f:	90                   	nop
c00056a0:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c00056a5:	85 c0                	test   %eax,%eax
c00056a7:	7e f7                	jle    c00056a0 <keyboard_read+0x7>
c00056a9:	e8 85 ff ff ff       	call   c0005633 <read_from_keyboard_buf>
c00056ae:	88 45 ea             	mov    %al,-0x16(%ebp)
c00056b1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00056b8:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c00056bc:	80 7d ea e1          	cmpb   $0xe1,-0x16(%ebp)
c00056c0:	75 5a                	jne    c000571c <keyboard_read+0x83>
c00056c2:	c6 45 e3 e1          	movb   $0xe1,-0x1d(%ebp)
c00056c6:	c6 45 e4 1d          	movb   $0x1d,-0x1c(%ebp)
c00056ca:	c6 45 e5 45          	movb   $0x45,-0x1b(%ebp)
c00056ce:	c6 45 e6 e1          	movb   $0xe1,-0x1a(%ebp)
c00056d2:	c6 45 e7 9d          	movb   $0x9d,-0x19(%ebp)
c00056d6:	c6 45 e8 c5          	movb   $0xc5,-0x18(%ebp)
c00056da:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
c00056de:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c00056e5:	eb 20                	jmp    c0005707 <keyboard_read+0x6e>
c00056e7:	e8 47 ff ff ff       	call   c0005633 <read_from_keyboard_buf>
c00056ec:	89 c1                	mov    %eax,%ecx
c00056ee:	8d 55 e3             	lea    -0x1d(%ebp),%edx
c00056f1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00056f4:	01 d0                	add    %edx,%eax
c00056f6:	0f b6 00             	movzbl (%eax),%eax
c00056f9:	38 c1                	cmp    %al,%cl
c00056fb:	74 06                	je     c0005703 <keyboard_read+0x6a>
c00056fd:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
c0005701:	eb 0a                	jmp    c000570d <keyboard_read+0x74>
c0005703:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0005707:	83 7d ec 05          	cmpl   $0x5,-0x14(%ebp)
c000570b:	7e da                	jle    c00056e7 <keyboard_read+0x4e>
c000570d:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
c0005711:	74 68                	je     c000577b <keyboard_read+0xe2>
c0005713:	c7 45 f4 80 01 00 00 	movl   $0x180,-0xc(%ebp)
c000571a:	eb 5f                	jmp    c000577b <keyboard_read+0xe2>
c000571c:	80 7d ea e0          	cmpb   $0xe0,-0x16(%ebp)
c0005720:	75 59                	jne    c000577b <keyboard_read+0xe2>
c0005722:	e8 0c ff ff ff       	call   c0005633 <read_from_keyboard_buf>
c0005727:	3c 2a                	cmp    $0x2a,%al
c0005729:	75 1d                	jne    c0005748 <keyboard_read+0xaf>
c000572b:	e8 03 ff ff ff       	call   c0005633 <read_from_keyboard_buf>
c0005730:	3c e0                	cmp    $0xe0,%al
c0005732:	75 14                	jne    c0005748 <keyboard_read+0xaf>
c0005734:	e8 fa fe ff ff       	call   c0005633 <read_from_keyboard_buf>
c0005739:	3c 37                	cmp    $0x37,%al
c000573b:	75 0b                	jne    c0005748 <keyboard_read+0xaf>
c000573d:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c0005744:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
c0005748:	e8 e6 fe ff ff       	call   c0005633 <read_from_keyboard_buf>
c000574d:	3c b7                	cmp    $0xb7,%al
c000574f:	75 1d                	jne    c000576e <keyboard_read+0xd5>
c0005751:	e8 dd fe ff ff       	call   c0005633 <read_from_keyboard_buf>
c0005756:	3c e0                	cmp    $0xe0,%al
c0005758:	75 14                	jne    c000576e <keyboard_read+0xd5>
c000575a:	e8 d4 fe ff ff       	call   c0005633 <read_from_keyboard_buf>
c000575f:	3c aa                	cmp    $0xaa,%al
c0005761:	75 0b                	jne    c000576e <keyboard_read+0xd5>
c0005763:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c000576a:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c000576e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0005772:	75 07                	jne    c000577b <keyboard_read+0xe2>
c0005774:	c6 05 84 07 01 c0 01 	movb   $0x1,0xc0010784
c000577b:	81 7d f4 80 01 00 00 	cmpl   $0x180,-0xc(%ebp)
c0005782:	0f 84 8d 00 00 00    	je     c0005815 <keyboard_read+0x17c>
c0005788:	81 7d f4 81 01 00 00 	cmpl   $0x181,-0xc(%ebp)
c000578f:	0f 84 80 00 00 00    	je     c0005815 <keyboard_read+0x17c>
c0005795:	80 7d ea 36          	cmpb   $0x36,-0x16(%ebp)
c0005799:	0f 94 c2             	sete   %dl
c000579c:	80 7d ea 2a          	cmpb   $0x2a,-0x16(%ebp)
c00057a0:	0f 94 c0             	sete   %al
c00057a3:	09 d0                	or     %edx,%eax
c00057a5:	84 c0                	test   %al,%al
c00057a7:	74 07                	je     c00057b0 <keyboard_read+0x117>
c00057a9:	c6 05 c4 16 01 c0 01 	movb   $0x1,0xc00116c4
c00057b0:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
c00057b4:	f7 d0                	not    %eax
c00057b6:	c0 e8 07             	shr    $0x7,%al
c00057b9:	88 45 e9             	mov    %al,-0x17(%ebp)
c00057bc:	80 7d ea 00          	cmpb   $0x0,-0x16(%ebp)
c00057c0:	74 53                	je     c0005815 <keyboard_read+0x17c>
c00057c2:	80 7d e9 00          	cmpb   $0x0,-0x17(%ebp)
c00057c6:	74 4d                	je     c0005815 <keyboard_read+0x17c>
c00057c8:	c6 45 eb 00          	movb   $0x0,-0x15(%ebp)
c00057cc:	0f b6 05 c4 16 01 c0 	movzbl 0xc00116c4,%eax
c00057d3:	3c 01                	cmp    $0x1,%al
c00057d5:	75 04                	jne    c00057db <keyboard_read+0x142>
c00057d7:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
c00057db:	0f b6 05 84 07 01 c0 	movzbl 0xc0010784,%eax
c00057e2:	84 c0                	test   %al,%al
c00057e4:	74 04                	je     c00057ea <keyboard_read+0x151>
c00057e6:	c6 45 eb 02          	movb   $0x2,-0x15(%ebp)
c00057ea:	0f b6 55 ea          	movzbl -0x16(%ebp),%edx
c00057ee:	89 d0                	mov    %edx,%eax
c00057f0:	01 c0                	add    %eax,%eax
c00057f2:	01 c2                	add    %eax,%edx
c00057f4:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c00057f8:	01 d0                	add    %edx,%eax
c00057fa:	8b 04 85 60 f1 00 c0 	mov    -0x3fff0ea0(,%eax,4),%eax
c0005801:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005804:	83 ec 08             	sub    $0x8,%esp
c0005807:	ff 75 f4             	pushl  -0xc(%ebp)
c000580a:	ff 75 08             	pushl  0x8(%ebp)
c000580d:	e8 1a 00 00 00       	call   c000582c <in_process>
c0005812:	83 c4 10             	add    $0x10,%esp
c0005815:	90                   	nop
c0005816:	c9                   	leave  
c0005817:	c3                   	ret    

c0005818 <init_keyboard_handler>:
c0005818:	55                   	push   %ebp
c0005819:	89 e5                	mov    %esp,%ebp
c000581b:	c6 05 84 07 01 c0 00 	movb   $0x0,0xc0010784
c0005822:	c6 05 c4 16 01 c0 00 	movb   $0x0,0xc00116c4
c0005829:	90                   	nop
c000582a:	5d                   	pop    %ebp
c000582b:	c3                   	ret    

c000582c <in_process>:
c000582c:	55                   	push   %ebp
c000582d:	89 e5                	mov    %esp,%ebp
c000582f:	83 ec 18             	sub    $0x18,%esp
c0005832:	83 ec 04             	sub    $0x4,%esp
c0005835:	6a 02                	push   $0x2
c0005837:	6a 00                	push   $0x0
c0005839:	8d 45 f6             	lea    -0xa(%ebp),%eax
c000583c:	50                   	push   %eax
c000583d:	e8 fd 65 00 00       	call   c000be3f <Memset>
c0005842:	83 c4 10             	add    $0x10,%esp
c0005845:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005848:	25 00 01 00 00       	and    $0x100,%eax
c000584d:	85 c0                	test   %eax,%eax
c000584f:	75 28                	jne    c0005879 <in_process+0x4d>
c0005851:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005854:	0f b6 c0             	movzbl %al,%eax
c0005857:	83 ec 08             	sub    $0x8,%esp
c000585a:	50                   	push   %eax
c000585b:	ff 75 08             	pushl  0x8(%ebp)
c000585e:	e8 b3 f3 ff ff       	call   c0004c16 <put_key>
c0005863:	83 c4 10             	add    $0x10,%esp
c0005866:	c6 05 84 07 01 c0 00 	movb   $0x0,0xc0010784
c000586d:	c6 05 c4 16 01 c0 00 	movb   $0x0,0xc00116c4
c0005874:	e9 42 01 00 00       	jmp    c00059bb <in_process+0x18f>
c0005879:	0f b6 05 c4 16 01 c0 	movzbl 0xc00116c4,%eax
c0005880:	84 c0                	test   %al,%al
c0005882:	0f 84 a9 00 00 00    	je     c0005931 <in_process+0x105>
c0005888:	83 7d 0c 2a          	cmpl   $0x2a,0xc(%ebp)
c000588c:	0f 84 9f 00 00 00    	je     c0005931 <in_process+0x105>
c0005892:	83 7d 0c 36          	cmpl   $0x36,0xc(%ebp)
c0005896:	0f 84 95 00 00 00    	je     c0005931 <in_process+0x105>
c000589c:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c00058a3:	74 64                	je     c0005909 <in_process+0xdd>
c00058a5:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c00058ac:	77 0b                	ja     c00058b9 <in_process+0x8d>
c00058ae:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c00058b5:	74 64                	je     c000591b <in_process+0xef>
c00058b7:	eb 73                	jmp    c000592c <in_process+0x100>
c00058b9:	81 7d 0c 55 01 00 00 	cmpl   $0x155,0xc(%ebp)
c00058c0:	74 0b                	je     c00058cd <in_process+0xa1>
c00058c2:	81 7d 0c 68 01 00 00 	cmpl   $0x168,0xc(%ebp)
c00058c9:	74 20                	je     c00058eb <in_process+0xbf>
c00058cb:	eb 5f                	jmp    c000592c <in_process+0x100>
c00058cd:	83 ec 0c             	sub    $0xc,%esp
c00058d0:	ff 75 08             	pushl  0x8(%ebp)
c00058d3:	e8 aa f3 ff ff       	call   c0004c82 <scroll_up>
c00058d8:	83 c4 10             	add    $0x10,%esp
c00058db:	c6 05 c4 16 01 c0 00 	movb   $0x0,0xc00116c4
c00058e2:	c6 05 84 07 01 c0 00 	movb   $0x0,0xc0010784
c00058e9:	eb 41                	jmp    c000592c <in_process+0x100>
c00058eb:	83 ec 0c             	sub    $0xc,%esp
c00058ee:	ff 75 08             	pushl  0x8(%ebp)
c00058f1:	e8 ce f3 ff ff       	call   c0004cc4 <scroll_down>
c00058f6:	83 c4 10             	add    $0x10,%esp
c00058f9:	c6 05 c4 16 01 c0 00 	movb   $0x0,0xc00116c4
c0005900:	c6 05 84 07 01 c0 00 	movb   $0x0,0xc0010784
c0005907:	eb 23                	jmp    c000592c <in_process+0x100>
c0005909:	83 ec 08             	sub    $0x8,%esp
c000590c:	6a 0a                	push   $0xa
c000590e:	ff 75 08             	pushl  0x8(%ebp)
c0005911:	e8 19 f4 ff ff       	call   c0004d2f <out_char>
c0005916:	83 c4 10             	add    $0x10,%esp
c0005919:	eb 11                	jmp    c000592c <in_process+0x100>
c000591b:	83 ec 08             	sub    $0x8,%esp
c000591e:	6a 08                	push   $0x8
c0005920:	ff 75 08             	pushl  0x8(%ebp)
c0005923:	e8 07 f4 ff ff       	call   c0004d2f <out_char>
c0005928:	83 c4 10             	add    $0x10,%esp
c000592b:	90                   	nop
c000592c:	e9 8a 00 00 00       	jmp    c00059bb <in_process+0x18f>
c0005931:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0005938:	74 55                	je     c000598f <in_process+0x163>
c000593a:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0005941:	77 14                	ja     c0005957 <in_process+0x12b>
c0005943:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c000594a:	74 31                	je     c000597d <in_process+0x151>
c000594c:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0005953:	74 16                	je     c000596b <in_process+0x13f>
c0005955:	eb 64                	jmp    c00059bb <in_process+0x18f>
c0005957:	81 7d 0c 41 01 00 00 	cmpl   $0x141,0xc(%ebp)
c000595e:	74 3e                	je     c000599e <in_process+0x172>
c0005960:	81 7d 0c 42 01 00 00 	cmpl   $0x142,0xc(%ebp)
c0005967:	74 44                	je     c00059ad <in_process+0x181>
c0005969:	eb 50                	jmp    c00059bb <in_process+0x18f>
c000596b:	83 ec 08             	sub    $0x8,%esp
c000596e:	6a 0a                	push   $0xa
c0005970:	ff 75 08             	pushl  0x8(%ebp)
c0005973:	e8 9e f2 ff ff       	call   c0004c16 <put_key>
c0005978:	83 c4 10             	add    $0x10,%esp
c000597b:	eb 3e                	jmp    c00059bb <in_process+0x18f>
c000597d:	83 ec 08             	sub    $0x8,%esp
c0005980:	6a 08                	push   $0x8
c0005982:	ff 75 08             	pushl  0x8(%ebp)
c0005985:	e8 8c f2 ff ff       	call   c0004c16 <put_key>
c000598a:	83 c4 10             	add    $0x10,%esp
c000598d:	eb 2c                	jmp    c00059bb <in_process+0x18f>
c000598f:	83 ec 0c             	sub    $0xc,%esp
c0005992:	6a 00                	push   $0x0
c0005994:	e8 4c f1 ff ff       	call   c0004ae5 <select_console>
c0005999:	83 c4 10             	add    $0x10,%esp
c000599c:	eb 1d                	jmp    c00059bb <in_process+0x18f>
c000599e:	83 ec 0c             	sub    $0xc,%esp
c00059a1:	6a 01                	push   $0x1
c00059a3:	e8 3d f1 ff ff       	call   c0004ae5 <select_console>
c00059a8:	83 c4 10             	add    $0x10,%esp
c00059ab:	eb 0e                	jmp    c00059bb <in_process+0x18f>
c00059ad:	83 ec 0c             	sub    $0xc,%esp
c00059b0:	6a 02                	push   $0x2
c00059b2:	e8 2e f1 ff ff       	call   c0004ae5 <select_console>
c00059b7:	83 c4 10             	add    $0x10,%esp
c00059ba:	90                   	nop
c00059bb:	90                   	nop
c00059bc:	c9                   	leave  
c00059bd:	c3                   	ret    

c00059be <open>:
c00059be:	55                   	push   %ebp
c00059bf:	89 e5                	mov    %esp,%ebp
c00059c1:	83 ec 18             	sub    $0x18,%esp
c00059c4:	83 ec 0c             	sub    $0xc,%esp
c00059c7:	6a 7c                	push   $0x7c
c00059c9:	e8 f6 ca ff ff       	call   c00024c4 <sys_malloc>
c00059ce:	83 c4 10             	add    $0x10,%esp
c00059d1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00059d4:	83 ec 04             	sub    $0x4,%esp
c00059d7:	6a 7c                	push   $0x7c
c00059d9:	6a 00                	push   $0x0
c00059db:	ff 75 f4             	pushl  -0xc(%ebp)
c00059de:	e8 5c 64 00 00       	call   c000be3f <Memset>
c00059e3:	83 c4 10             	add    $0x10,%esp
c00059e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00059e9:	c7 40 78 06 00 00 00 	movl   $0x6,0x78(%eax)
c00059f0:	83 ec 0c             	sub    $0xc,%esp
c00059f3:	ff 75 08             	pushl  0x8(%ebp)
c00059f6:	e8 69 14 00 00       	call   c0006e64 <get_physical_address>
c00059fb:	83 c4 10             	add    $0x10,%esp
c00059fe:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005a01:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005a04:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0005a07:	89 50 44             	mov    %edx,0x44(%eax)
c0005a0a:	8b 55 0c             	mov    0xc(%ebp),%edx
c0005a0d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005a10:	89 50 74             	mov    %edx,0x74(%eax)
c0005a13:	83 ec 0c             	sub    $0xc,%esp
c0005a16:	ff 75 08             	pushl  0x8(%ebp)
c0005a19:	e8 5a 64 00 00       	call   c000be78 <Strlen>
c0005a1e:	83 c4 10             	add    $0x10,%esp
c0005a21:	89 c2                	mov    %eax,%edx
c0005a23:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005a26:	89 50 40             	mov    %edx,0x40(%eax)
c0005a29:	83 ec 04             	sub    $0x4,%esp
c0005a2c:	6a 02                	push   $0x2
c0005a2e:	ff 75 f4             	pushl  -0xc(%ebp)
c0005a31:	6a 03                	push   $0x3
c0005a33:	e8 a0 45 00 00       	call   c0009fd8 <send_rec>
c0005a38:	83 c4 10             	add    $0x10,%esp
c0005a3b:	83 ec 08             	sub    $0x8,%esp
c0005a3e:	6a 7c                	push   $0x7c
c0005a40:	ff 75 f4             	pushl  -0xc(%ebp)
c0005a43:	e8 91 ca ff ff       	call   c00024d9 <sys_free>
c0005a48:	83 c4 10             	add    $0x10,%esp
c0005a4b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005a4e:	8b 40 50             	mov    0x50(%eax),%eax
c0005a51:	c9                   	leave  
c0005a52:	c3                   	ret    

c0005a53 <read>:
c0005a53:	55                   	push   %ebp
c0005a54:	89 e5                	mov    %esp,%ebp
c0005a56:	83 ec 38             	sub    $0x38,%esp
c0005a59:	c7 45 dc 7c 00 00 00 	movl   $0x7c,-0x24(%ebp)
c0005a60:	83 ec 0c             	sub    $0xc,%esp
c0005a63:	ff 75 dc             	pushl  -0x24(%ebp)
c0005a66:	e8 59 ca ff ff       	call   c00024c4 <sys_malloc>
c0005a6b:	83 c4 10             	add    $0x10,%esp
c0005a6e:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0005a71:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005a74:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0005a79:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005a7c:	83 ec 0c             	sub    $0xc,%esp
c0005a7f:	ff 75 0c             	pushl  0xc(%ebp)
c0005a82:	e8 dd 13 00 00       	call   c0006e64 <get_physical_address>
c0005a87:	83 c4 10             	add    $0x10,%esp
c0005a8a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005a8d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005a90:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0005a95:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005a98:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005a9b:	05 ff 0f 00 00       	add    $0xfff,%eax
c0005aa0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0005aa3:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0005aaa:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0005ab1:	8b 55 10             	mov    0x10(%ebp),%edx
c0005ab4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005ab7:	01 d0                	add    %edx,%eax
c0005ab9:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
c0005abc:	0f 83 a8 00 00 00    	jae    c0005b6a <read+0x117>
c0005ac2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005ac5:	2b 45 f0             	sub    -0x10(%ebp),%eax
c0005ac8:	05 00 10 00 00       	add    $0x1000,%eax
c0005acd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0005ad0:	8b 45 10             	mov    0x10(%ebp),%eax
c0005ad3:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0005ad6:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0005ad9:	83 ec 04             	sub    $0x4,%esp
c0005adc:	50                   	push   %eax
c0005add:	6a 00                	push   $0x0
c0005adf:	ff 75 d8             	pushl  -0x28(%ebp)
c0005ae2:	e8 58 63 00 00       	call   c000be3f <Memset>
c0005ae7:	83 c4 10             	add    $0x10,%esp
c0005aea:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005aed:	c7 40 78 07 00 00 00 	movl   $0x7,0x78(%eax)
c0005af4:	8b 55 08             	mov    0x8(%ebp),%edx
c0005af7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005afa:	89 50 50             	mov    %edx,0x50(%eax)
c0005afd:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005b00:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0005b03:	89 50 10             	mov    %edx,0x10(%eax)
c0005b06:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005b09:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0005b0c:	89 50 60             	mov    %edx,0x60(%eax)
c0005b0f:	83 ec 04             	sub    $0x4,%esp
c0005b12:	6a 02                	push   $0x2
c0005b14:	ff 75 d8             	pushl  -0x28(%ebp)
c0005b17:	6a 03                	push   $0x3
c0005b19:	e8 ba 44 00 00       	call   c0009fd8 <send_rec>
c0005b1e:	83 c4 10             	add    $0x10,%esp
c0005b21:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005b24:	8b 40 60             	mov    0x60(%eax),%eax
c0005b27:	01 45 e8             	add    %eax,-0x18(%ebp)
c0005b2a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0005b2d:	29 45 e0             	sub    %eax,-0x20(%ebp)
c0005b30:	8b 45 10             	mov    0x10(%ebp),%eax
c0005b33:	2b 45 e4             	sub    -0x1c(%ebp),%eax
c0005b36:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0005b39:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0005b3c:	89 45 10             	mov    %eax,0x10(%ebp)
c0005b3f:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
c0005b46:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c0005b4d:	83 ec 0c             	sub    $0xc,%esp
c0005b50:	ff 75 f4             	pushl  -0xc(%ebp)
c0005b53:	e8 0c 13 00 00       	call   c0006e64 <get_physical_address>
c0005b58:	83 c4 10             	add    $0x10,%esp
c0005b5b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005b5e:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0005b62:	0f 85 6e ff ff ff    	jne    c0005ad6 <read+0x83>
c0005b68:	eb 54                	jmp    c0005bbe <read+0x16b>
c0005b6a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0005b6d:	83 ec 04             	sub    $0x4,%esp
c0005b70:	50                   	push   %eax
c0005b71:	6a 00                	push   $0x0
c0005b73:	ff 75 d8             	pushl  -0x28(%ebp)
c0005b76:	e8 c4 62 00 00       	call   c000be3f <Memset>
c0005b7b:	83 c4 10             	add    $0x10,%esp
c0005b7e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005b81:	c7 40 78 07 00 00 00 	movl   $0x7,0x78(%eax)
c0005b88:	8b 55 08             	mov    0x8(%ebp),%edx
c0005b8b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005b8e:	89 50 50             	mov    %edx,0x50(%eax)
c0005b91:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005b94:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0005b97:	89 50 10             	mov    %edx,0x10(%eax)
c0005b9a:	8b 55 10             	mov    0x10(%ebp),%edx
c0005b9d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005ba0:	89 50 60             	mov    %edx,0x60(%eax)
c0005ba3:	83 ec 04             	sub    $0x4,%esp
c0005ba6:	6a 02                	push   $0x2
c0005ba8:	ff 75 d8             	pushl  -0x28(%ebp)
c0005bab:	6a 03                	push   $0x3
c0005bad:	e8 26 44 00 00       	call   c0009fd8 <send_rec>
c0005bb2:	83 c4 10             	add    $0x10,%esp
c0005bb5:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005bb8:	8b 40 60             	mov    0x60(%eax),%eax
c0005bbb:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0005bbe:	83 ec 08             	sub    $0x8,%esp
c0005bc1:	ff 75 dc             	pushl  -0x24(%ebp)
c0005bc4:	ff 75 d8             	pushl  -0x28(%ebp)
c0005bc7:	e8 0d c9 ff ff       	call   c00024d9 <sys_free>
c0005bcc:	83 c4 10             	add    $0x10,%esp
c0005bcf:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005bd2:	c9                   	leave  
c0005bd3:	c3                   	ret    

c0005bd4 <write>:
c0005bd4:	55                   	push   %ebp
c0005bd5:	89 e5                	mov    %esp,%ebp
c0005bd7:	83 ec 18             	sub    $0x18,%esp
c0005bda:	c7 45 f4 7c 00 00 00 	movl   $0x7c,-0xc(%ebp)
c0005be1:	83 ec 0c             	sub    $0xc,%esp
c0005be4:	ff 75 f4             	pushl  -0xc(%ebp)
c0005be7:	e8 d8 c8 ff ff       	call   c00024c4 <sys_malloc>
c0005bec:	83 c4 10             	add    $0x10,%esp
c0005bef:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005bf2:	83 ec 0c             	sub    $0xc,%esp
c0005bf5:	ff 75 0c             	pushl  0xc(%ebp)
c0005bf8:	e8 67 12 00 00       	call   c0006e64 <get_physical_address>
c0005bfd:	83 c4 10             	add    $0x10,%esp
c0005c00:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005c03:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005c06:	c7 40 78 0a 00 00 00 	movl   $0xa,0x78(%eax)
c0005c0d:	8b 55 08             	mov    0x8(%ebp),%edx
c0005c10:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005c13:	89 50 50             	mov    %edx,0x50(%eax)
c0005c16:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005c19:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0005c1c:	89 50 10             	mov    %edx,0x10(%eax)
c0005c1f:	8b 55 10             	mov    0x10(%ebp),%edx
c0005c22:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005c25:	89 50 60             	mov    %edx,0x60(%eax)
c0005c28:	83 ec 04             	sub    $0x4,%esp
c0005c2b:	6a 02                	push   $0x2
c0005c2d:	ff 75 f0             	pushl  -0x10(%ebp)
c0005c30:	6a 03                	push   $0x3
c0005c32:	e8 a1 43 00 00       	call   c0009fd8 <send_rec>
c0005c37:	83 c4 10             	add    $0x10,%esp
c0005c3a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005c3d:	8b 40 60             	mov    0x60(%eax),%eax
c0005c40:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0005c43:	83 ec 08             	sub    $0x8,%esp
c0005c46:	ff 75 f4             	pushl  -0xc(%ebp)
c0005c49:	ff 75 f0             	pushl  -0x10(%ebp)
c0005c4c:	e8 88 c8 ff ff       	call   c00024d9 <sys_free>
c0005c51:	83 c4 10             	add    $0x10,%esp
c0005c54:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005c57:	c9                   	leave  
c0005c58:	c3                   	ret    

c0005c59 <close>:
c0005c59:	55                   	push   %ebp
c0005c5a:	89 e5                	mov    %esp,%ebp
c0005c5c:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0005c62:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0005c69:	8b 45 08             	mov    0x8(%ebp),%eax
c0005c6c:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0005c6f:	83 ec 04             	sub    $0x4,%esp
c0005c72:	6a 02                	push   $0x2
c0005c74:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0005c7a:	50                   	push   %eax
c0005c7b:	6a 03                	push   $0x3
c0005c7d:	e8 56 43 00 00       	call   c0009fd8 <send_rec>
c0005c82:	83 c4 10             	add    $0x10,%esp
c0005c85:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005c88:	83 f8 65             	cmp    $0x65,%eax
c0005c8b:	74 19                	je     c0005ca6 <close+0x4d>
c0005c8d:	6a 13                	push   $0x13
c0005c8f:	68 53 b4 00 c0       	push   $0xc000b453
c0005c94:	68 53 b4 00 c0       	push   $0xc000b453
c0005c99:	68 5f b4 00 c0       	push   $0xc000b45f
c0005c9e:	e8 f8 39 00 00       	call   c000969b <assertion_failure>
c0005ca3:	83 c4 10             	add    $0x10,%esp
c0005ca6:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0005ca9:	c9                   	leave  
c0005caa:	c3                   	ret    

c0005cab <wait>:
c0005cab:	55                   	push   %ebp
c0005cac:	89 e5                	mov    %esp,%ebp
c0005cae:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0005cb4:	c7 45 f4 09 00 00 00 	movl   $0x9,-0xc(%ebp)
c0005cbb:	83 ec 04             	sub    $0x4,%esp
c0005cbe:	6a 01                	push   $0x1
c0005cc0:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0005cc6:	50                   	push   %eax
c0005cc7:	6a 03                	push   $0x3
c0005cc9:	e8 0a 43 00 00       	call   c0009fd8 <send_rec>
c0005cce:	83 c4 10             	add    $0x10,%esp
c0005cd1:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0005cd4:	89 c2                	mov    %eax,%edx
c0005cd6:	8b 45 08             	mov    0x8(%ebp),%eax
c0005cd9:	89 10                	mov    %edx,(%eax)
c0005cdb:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005cde:	83 f8 21             	cmp    $0x21,%eax
c0005ce1:	74 05                	je     c0005ce8 <wait+0x3d>
c0005ce3:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005ce6:	eb 05                	jmp    c0005ced <wait+0x42>
c0005ce8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0005ced:	c9                   	leave  
c0005cee:	c3                   	ret    

c0005cef <exit>:
c0005cef:	55                   	push   %ebp
c0005cf0:	89 e5                	mov    %esp,%ebp
c0005cf2:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0005cf8:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
c0005cff:	8b 45 08             	mov    0x8(%ebp),%eax
c0005d02:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0005d05:	83 ec 04             	sub    $0x4,%esp
c0005d08:	6a 01                	push   $0x1
c0005d0a:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0005d10:	50                   	push   %eax
c0005d11:	6a 03                	push   $0x3
c0005d13:	e8 c0 42 00 00       	call   c0009fd8 <send_rec>
c0005d18:	83 c4 10             	add    $0x10,%esp
c0005d1b:	90                   	nop
c0005d1c:	c9                   	leave  
c0005d1d:	c3                   	ret    

c0005d1e <fork>:
c0005d1e:	55                   	push   %ebp
c0005d1f:	89 e5                	mov    %esp,%ebp
c0005d21:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0005d27:	83 ec 04             	sub    $0x4,%esp
c0005d2a:	6a 7c                	push   $0x7c
c0005d2c:	6a 00                	push   $0x0
c0005d2e:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0005d34:	50                   	push   %eax
c0005d35:	e8 05 61 00 00       	call   c000be3f <Memset>
c0005d3a:	83 c4 10             	add    $0x10,%esp
c0005d3d:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
c0005d44:	83 ec 04             	sub    $0x4,%esp
c0005d47:	6a 01                	push   $0x1
c0005d49:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0005d4f:	50                   	push   %eax
c0005d50:	6a 03                	push   $0x3
c0005d52:	e8 81 42 00 00       	call   c0009fd8 <send_rec>
c0005d57:	83 c4 10             	add    $0x10,%esp
c0005d5a:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c0005d61:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0005d64:	85 c0                	test   %eax,%eax
c0005d66:	74 19                	je     c0005d81 <fork+0x63>
c0005d68:	6a 14                	push   $0x14
c0005d6a:	68 77 b4 00 c0       	push   $0xc000b477
c0005d6f:	68 77 b4 00 c0       	push   $0xc000b477
c0005d74:	68 82 b4 00 c0       	push   $0xc000b482
c0005d79:	e8 1d 39 00 00       	call   c000969b <assertion_failure>
c0005d7e:	83 c4 10             	add    $0x10,%esp
c0005d81:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005d84:	c9                   	leave  
c0005d85:	c3                   	ret    

c0005d86 <getpid>:
c0005d86:	55                   	push   %ebp
c0005d87:	89 e5                	mov    %esp,%ebp
c0005d89:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0005d8f:	c7 45 f4 05 00 00 00 	movl   $0x5,-0xc(%ebp)
c0005d96:	83 ec 04             	sub    $0x4,%esp
c0005d99:	6a 05                	push   $0x5
c0005d9b:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0005da1:	50                   	push   %eax
c0005da2:	6a 03                	push   $0x3
c0005da4:	e8 2f 42 00 00       	call   c0009fd8 <send_rec>
c0005da9:	83 c4 10             	add    $0x10,%esp
c0005dac:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005daf:	c9                   	leave  
c0005db0:	c3                   	ret    

c0005db1 <exec>:
c0005db1:	55                   	push   %ebp
c0005db2:	89 e5                	mov    %esp,%ebp
c0005db4:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0005dba:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0005dc1:	8b 45 08             	mov    0x8(%ebp),%eax
c0005dc4:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0005dc7:	83 ec 0c             	sub    $0xc,%esp
c0005dca:	ff 75 08             	pushl  0x8(%ebp)
c0005dcd:	e8 a6 60 00 00       	call   c000be78 <Strlen>
c0005dd2:	83 c4 10             	add    $0x10,%esp
c0005dd5:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0005dd8:	c7 45 8c 00 00 00 00 	movl   $0x0,-0x74(%ebp)
c0005ddf:	c7 45 98 00 00 00 00 	movl   $0x0,-0x68(%ebp)
c0005de6:	83 ec 04             	sub    $0x4,%esp
c0005de9:	6a 01                	push   $0x1
c0005deb:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0005df1:	50                   	push   %eax
c0005df2:	6a 03                	push   $0x3
c0005df4:	e8 df 41 00 00       	call   c0009fd8 <send_rec>
c0005df9:	83 c4 10             	add    $0x10,%esp
c0005dfc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005dff:	83 f8 65             	cmp    $0x65,%eax
c0005e02:	74 19                	je     c0005e1d <exec+0x6c>
c0005e04:	6a 19                	push   $0x19
c0005e06:	68 92 b4 00 c0       	push   $0xc000b492
c0005e0b:	68 92 b4 00 c0       	push   $0xc000b492
c0005e10:	68 9d b4 00 c0       	push   $0xc000b49d
c0005e15:	e8 81 38 00 00       	call   c000969b <assertion_failure>
c0005e1a:	83 c4 10             	add    $0x10,%esp
c0005e1d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0005e20:	c9                   	leave  
c0005e21:	c3                   	ret    

c0005e22 <execv>:
c0005e22:	55                   	push   %ebp
c0005e23:	89 e5                	mov    %esp,%ebp
c0005e25:	81 ec b8 00 00 00    	sub    $0xb8,%esp
c0005e2b:	83 ec 0c             	sub    $0xc,%esp
c0005e2e:	68 00 04 00 00       	push   $0x400
c0005e33:	e8 8c c6 ff ff       	call   c00024c4 <sys_malloc>
c0005e38:	83 c4 10             	add    $0x10,%esp
c0005e3b:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0005e3e:	83 ec 04             	sub    $0x4,%esp
c0005e41:	68 00 04 00 00       	push   $0x400
c0005e46:	6a 00                	push   $0x0
c0005e48:	ff 75 e0             	pushl  -0x20(%ebp)
c0005e4b:	e8 ef 5f 00 00       	call   c000be3f <Memset>
c0005e50:	83 c4 10             	add    $0x10,%esp
c0005e53:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005e56:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005e59:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0005e60:	eb 23                	jmp    c0005e85 <execv+0x63>
c0005e62:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005e65:	8b 00                	mov    (%eax),%eax
c0005e67:	83 ec 08             	sub    $0x8,%esp
c0005e6a:	50                   	push   %eax
c0005e6b:	68 b5 b4 00 c0       	push   $0xc000b4b5
c0005e70:	e8 c9 34 00 00       	call   c000933e <Printf>
c0005e75:	83 c4 10             	add    $0x10,%esp
c0005e78:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
c0005e7c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005e7f:	83 c0 04             	add    $0x4,%eax
c0005e82:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005e85:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005e88:	8b 00                	mov    (%eax),%eax
c0005e8a:	85 c0                	test   %eax,%eax
c0005e8c:	75 d4                	jne    c0005e62 <execv+0x40>
c0005e8e:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0005e91:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0005e94:	01 d0                	add    %edx,%eax
c0005e96:	c6 00 00             	movb   $0x0,(%eax)
c0005e99:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005e9c:	83 c0 04             	add    $0x4,%eax
c0005e9f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005ea2:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0005ea5:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005ea8:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005eab:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0005eae:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0005eb5:	eb 5b                	jmp    c0005f12 <execv+0xf0>
c0005eb7:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0005eba:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0005ebd:	01 c2                	add    %eax,%edx
c0005ebf:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005ec2:	89 10                	mov    %edx,(%eax)
c0005ec4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005ec7:	8b 00                	mov    (%eax),%eax
c0005ec9:	8b 4d f0             	mov    -0x10(%ebp),%ecx
c0005ecc:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0005ecf:	01 ca                	add    %ecx,%edx
c0005ed1:	83 ec 08             	sub    $0x8,%esp
c0005ed4:	50                   	push   %eax
c0005ed5:	52                   	push   %edx
c0005ed6:	e8 83 5f 00 00       	call   c000be5e <Strcpy>
c0005edb:	83 c4 10             	add    $0x10,%esp
c0005ede:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005ee1:	8b 00                	mov    (%eax),%eax
c0005ee3:	83 ec 0c             	sub    $0xc,%esp
c0005ee6:	50                   	push   %eax
c0005ee7:	e8 8c 5f 00 00       	call   c000be78 <Strlen>
c0005eec:	83 c4 10             	add    $0x10,%esp
c0005eef:	01 45 f0             	add    %eax,-0x10(%ebp)
c0005ef2:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0005ef5:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0005ef8:	01 d0                	add    %edx,%eax
c0005efa:	c6 00 00             	movb   $0x0,(%eax)
c0005efd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005f00:	83 c0 01             	add    $0x1,%eax
c0005f03:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005f06:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
c0005f0a:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c0005f0e:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0005f12:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005f15:	8b 00                	mov    (%eax),%eax
c0005f17:	85 c0                	test   %eax,%eax
c0005f19:	75 9c                	jne    c0005eb7 <execv+0x95>
c0005f1b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005f1e:	ba 00 00 00 c0       	mov    $0xc0000000,%edx
c0005f23:	29 c2                	sub    %eax,%edx
c0005f25:	89 d0                	mov    %edx,%eax
c0005f27:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0005f2a:	83 ec 0c             	sub    $0xc,%esp
c0005f2d:	ff 75 08             	pushl  0x8(%ebp)
c0005f30:	e8 2f 0f 00 00       	call   c0006e64 <get_physical_address>
c0005f35:	83 c4 10             	add    $0x10,%esp
c0005f38:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0005f3b:	83 ec 0c             	sub    $0xc,%esp
c0005f3e:	ff 75 e0             	pushl  -0x20(%ebp)
c0005f41:	e8 1e 0f 00 00       	call   c0006e64 <get_physical_address>
c0005f46:	83 c4 10             	add    $0x10,%esp
c0005f49:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0005f4c:	83 ec 0c             	sub    $0xc,%esp
c0005f4f:	ff 75 dc             	pushl  -0x24(%ebp)
c0005f52:	e8 0d 0f 00 00       	call   c0006e64 <get_physical_address>
c0005f57:	83 c4 10             	add    $0x10,%esp
c0005f5a:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0005f5d:	c7 45 cc 02 00 00 00 	movl   $0x2,-0x34(%ebp)
c0005f64:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005f67:	89 45 98             	mov    %eax,-0x68(%ebp)
c0005f6a:	83 ec 0c             	sub    $0xc,%esp
c0005f6d:	ff 75 08             	pushl  0x8(%ebp)
c0005f70:	e8 03 5f 00 00       	call   c000be78 <Strlen>
c0005f75:	83 c4 10             	add    $0x10,%esp
c0005f78:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0005f7b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0005f7e:	89 85 64 ff ff ff    	mov    %eax,-0x9c(%ebp)
c0005f84:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005f87:	89 85 70 ff ff ff    	mov    %eax,-0x90(%ebp)
c0005f8d:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0005f90:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
c0005f96:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0005f99:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0005f9f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0005fa2:	89 85 7c ff ff ff    	mov    %eax,-0x84(%ebp)
c0005fa8:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0005fab:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0005fae:	29 c2                	sub    %eax,%edx
c0005fb0:	89 d0                	mov    %edx,%eax
c0005fb2:	89 45 80             	mov    %eax,-0x80(%ebp)
c0005fb5:	83 ec 04             	sub    $0x4,%esp
c0005fb8:	6a 01                	push   $0x1
c0005fba:	8d 85 54 ff ff ff    	lea    -0xac(%ebp),%eax
c0005fc0:	50                   	push   %eax
c0005fc1:	6a 03                	push   $0x3
c0005fc3:	e8 10 40 00 00       	call   c0009fd8 <send_rec>
c0005fc8:	83 c4 10             	add    $0x10,%esp
c0005fcb:	83 ec 08             	sub    $0x8,%esp
c0005fce:	68 00 04 00 00       	push   $0x400
c0005fd3:	ff 75 e0             	pushl  -0x20(%ebp)
c0005fd6:	e8 fe c4 ff ff       	call   c00024d9 <sys_free>
c0005fdb:	83 c4 10             	add    $0x10,%esp
c0005fde:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0005fe1:	83 f8 65             	cmp    $0x65,%eax
c0005fe4:	74 1c                	je     c0006002 <execv+0x1e0>
c0005fe6:	68 93 00 00 00       	push   $0x93
c0005feb:	68 92 b4 00 c0       	push   $0xc000b492
c0005ff0:	68 92 b4 00 c0       	push   $0xc000b492
c0005ff5:	68 9d b4 00 c0       	push   $0xc000b49d
c0005ffa:	e8 9c 36 00 00       	call   c000969b <assertion_failure>
c0005fff:	83 c4 10             	add    $0x10,%esp
c0006002:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0006005:	c9                   	leave  
c0006006:	c3                   	ret    

c0006007 <execl>:
c0006007:	55                   	push   %ebp
c0006008:	89 e5                	mov    %esp,%ebp
c000600a:	83 ec 18             	sub    $0x18,%esp
c000600d:	8d 45 0c             	lea    0xc(%ebp),%eax
c0006010:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006013:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006016:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006019:	83 ec 08             	sub    $0x8,%esp
c000601c:	ff 75 f0             	pushl  -0x10(%ebp)
c000601f:	ff 75 08             	pushl  0x8(%ebp)
c0006022:	e8 fb fd ff ff       	call   c0005e22 <execv>
c0006027:	83 c4 10             	add    $0x10,%esp
c000602a:	c9                   	leave  
c000602b:	c3                   	ret    

c000602c <TaskMM>:
c000602c:	55                   	push   %ebp
c000602d:	89 e5                	mov    %esp,%ebp
c000602f:	83 ec 28             	sub    $0x28,%esp
c0006032:	83 ec 0c             	sub    $0xc,%esp
c0006035:	6a 7c                	push   $0x7c
c0006037:	e8 88 c4 ff ff       	call   c00024c4 <sys_malloc>
c000603c:	83 c4 10             	add    $0x10,%esp
c000603f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006042:	83 ec 0c             	sub    $0xc,%esp
c0006045:	6a 7c                	push   $0x7c
c0006047:	e8 78 c4 ff ff       	call   c00024c4 <sys_malloc>
c000604c:	83 c4 10             	add    $0x10,%esp
c000604f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006052:	83 ec 04             	sub    $0x4,%esp
c0006055:	6a 12                	push   $0x12
c0006057:	ff 75 f0             	pushl  -0x10(%ebp)
c000605a:	6a 02                	push   $0x2
c000605c:	e8 77 3f 00 00       	call   c0009fd8 <send_rec>
c0006061:	83 c4 10             	add    $0x10,%esp
c0006064:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006067:	8b 40 78             	mov    0x78(%eax),%eax
c000606a:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000606d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006070:	8b 00                	mov    (%eax),%eax
c0006072:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006075:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c000607c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000607f:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0006086:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006089:	c7 40 58 00 00 00 00 	movl   $0x0,0x58(%eax)
c0006090:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c0006094:	74 4e                	je     c00060e4 <TaskMM+0xb8>
c0006096:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c000609a:	7f 08                	jg     c00060a4 <TaskMM+0x78>
c000609c:	83 7d e8 02          	cmpl   $0x2,-0x18(%ebp)
c00060a0:	74 28                	je     c00060ca <TaskMM+0x9e>
c00060a2:	eb 71                	jmp    c0006115 <TaskMM+0xe9>
c00060a4:	83 7d e8 04          	cmpl   $0x4,-0x18(%ebp)
c00060a8:	74 08                	je     c00060b2 <TaskMM+0x86>
c00060aa:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c00060ae:	74 4e                	je     c00060fe <TaskMM+0xd2>
c00060b0:	eb 63                	jmp    c0006115 <TaskMM+0xe9>
c00060b2:	83 ec 0c             	sub    $0xc,%esp
c00060b5:	ff 75 f0             	pushl  -0x10(%ebp)
c00060b8:	e8 d6 04 00 00       	call   c0006593 <do_fork>
c00060bd:	83 c4 10             	add    $0x10,%esp
c00060c0:	89 c2                	mov    %eax,%edx
c00060c2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00060c5:	89 50 5c             	mov    %edx,0x5c(%eax)
c00060c8:	eb 5c                	jmp    c0006126 <TaskMM+0xfa>
c00060ca:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00060d1:	66 87 db             	xchg   %bx,%bx
c00060d4:	83 ec 0c             	sub    $0xc,%esp
c00060d7:	ff 75 f0             	pushl  -0x10(%ebp)
c00060da:	e8 95 00 00 00       	call   c0006174 <do_exec>
c00060df:	83 c4 10             	add    $0x10,%esp
c00060e2:	eb 42                	jmp    c0006126 <TaskMM+0xfa>
c00060e4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00060eb:	83 ec 08             	sub    $0x8,%esp
c00060ee:	ff 75 e0             	pushl  -0x20(%ebp)
c00060f1:	ff 75 f0             	pushl  -0x10(%ebp)
c00060f4:	e8 08 05 00 00       	call   c0006601 <do_exit>
c00060f9:	83 c4 10             	add    $0x10,%esp
c00060fc:	eb 28                	jmp    c0006126 <TaskMM+0xfa>
c00060fe:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006105:	83 ec 0c             	sub    $0xc,%esp
c0006108:	ff 75 f0             	pushl  -0x10(%ebp)
c000610b:	e8 ed 05 00 00       	call   c00066fd <do_wait>
c0006110:	83 c4 10             	add    $0x10,%esp
c0006113:	eb 11                	jmp    c0006126 <TaskMM+0xfa>
c0006115:	83 ec 0c             	sub    $0xc,%esp
c0006118:	68 bf b4 00 c0       	push   $0xc000b4bf
c000611d:	e8 5b 35 00 00       	call   c000967d <panic>
c0006122:	83 c4 10             	add    $0x10,%esp
c0006125:	90                   	nop
c0006126:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000612a:	0f 84 22 ff ff ff    	je     c0006052 <TaskMM+0x26>
c0006130:	83 ec 0c             	sub    $0xc,%esp
c0006133:	6a 03                	push   $0x3
c0006135:	e8 d0 30 00 00       	call   c000920a <delay>
c000613a:	83 c4 10             	add    $0x10,%esp
c000613d:	83 ec 04             	sub    $0x4,%esp
c0006140:	ff 75 e4             	pushl  -0x1c(%ebp)
c0006143:	ff 75 ec             	pushl  -0x14(%ebp)
c0006146:	6a 01                	push   $0x1
c0006148:	e8 8b 3e 00 00       	call   c0009fd8 <send_rec>
c000614d:	83 c4 10             	add    $0x10,%esp
c0006150:	e9 fd fe ff ff       	jmp    c0006052 <TaskMM+0x26>

c0006155 <alloc_mem>:
c0006155:	55                   	push   %ebp
c0006156:	89 e5                	mov    %esp,%ebp
c0006158:	83 ec 10             	sub    $0x10,%esp
c000615b:	8b 45 08             	mov    0x8(%ebp),%eax
c000615e:	83 e8 08             	sub    $0x8,%eax
c0006161:	69 c0 00 10 10 00    	imul   $0x101000,%eax,%eax
c0006167:	05 00 00 a0 00       	add    $0xa00000,%eax
c000616c:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000616f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006172:	c9                   	leave  
c0006173:	c3                   	ret    

c0006174 <do_exec>:
c0006174:	55                   	push   %ebp
c0006175:	89 e5                	mov    %esp,%ebp
c0006177:	81 ec 38 01 00 00    	sub    $0x138,%esp
c000617d:	c7 85 56 ff ff ff 64 	movl   $0x5f766564,-0xaa(%ebp)
c0006184:	65 76 5f 
c0006187:	c7 85 5a ff ff ff 74 	movl   $0x31797474,-0xa6(%ebp)
c000618e:	74 79 31 
c0006191:	66 c7 85 5e ff ff ff 	movw   $0x0,-0xa2(%ebp)
c0006198:	00 00 
c000619a:	83 ec 08             	sub    $0x8,%esp
c000619d:	6a 00                	push   $0x0
c000619f:	8d 85 56 ff ff ff    	lea    -0xaa(%ebp),%eax
c00061a5:	50                   	push   %eax
c00061a6:	e8 13 f8 ff ff       	call   c00059be <open>
c00061ab:	83 c4 10             	add    $0x10,%esp
c00061ae:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00061b1:	8b 45 08             	mov    0x8(%ebp),%eax
c00061b4:	8b 00                	mov    (%eax),%eax
c00061b6:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00061b9:	c7 45 d0 00 30 03 00 	movl   $0x33000,-0x30(%ebp)
c00061c0:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00061c3:	83 ec 0c             	sub    $0xc,%esp
c00061c6:	50                   	push   %eax
c00061c7:	e8 f8 c2 ff ff       	call   c00024c4 <sys_malloc>
c00061cc:	83 c4 10             	add    $0x10,%esp
c00061cf:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00061d2:	83 ec 04             	sub    $0x4,%esp
c00061d5:	ff 75 d0             	pushl  -0x30(%ebp)
c00061d8:	6a 00                	push   $0x0
c00061da:	ff 75 cc             	pushl  -0x34(%ebp)
c00061dd:	e8 5d 5c 00 00       	call   c000be3f <Memset>
c00061e2:	83 c4 10             	add    $0x10,%esp
c00061e5:	83 ec 04             	sub    $0x4,%esp
c00061e8:	6a 0c                	push   $0xc
c00061ea:	6a 00                	push   $0x0
c00061ec:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c00061f2:	50                   	push   %eax
c00061f3:	e8 47 5c 00 00       	call   c000be3f <Memset>
c00061f8:	83 c4 10             	add    $0x10,%esp
c00061fb:	8b 45 08             	mov    0x8(%ebp),%eax
c00061fe:	8b 40 44             	mov    0x44(%eax),%eax
c0006201:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0006204:	8b 45 08             	mov    0x8(%ebp),%eax
c0006207:	8b 40 40             	mov    0x40(%eax),%eax
c000620a:	83 ec 08             	sub    $0x8,%esp
c000620d:	50                   	push   %eax
c000620e:	ff 75 c8             	pushl  -0x38(%ebp)
c0006211:	e8 04 0b 00 00       	call   c0006d1a <alloc_virtual_memory>
c0006216:	83 c4 10             	add    $0x10,%esp
c0006219:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c000621c:	8b 45 08             	mov    0x8(%ebp),%eax
c000621f:	8b 40 40             	mov    0x40(%eax),%eax
c0006222:	89 c2                	mov    %eax,%edx
c0006224:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0006227:	83 ec 04             	sub    $0x4,%esp
c000622a:	52                   	push   %edx
c000622b:	50                   	push   %eax
c000622c:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c0006232:	50                   	push   %eax
c0006233:	e8 df 18 00 00       	call   c0007b17 <Memcpy>
c0006238:	83 c4 10             	add    $0x10,%esp
c000623b:	8b 45 08             	mov    0x8(%ebp),%eax
c000623e:	8b 40 40             	mov    0x40(%eax),%eax
c0006241:	c6 84 05 4a ff ff ff 	movb   $0x0,-0xb6(%ebp,%eax,1)
c0006248:	00 
c0006249:	83 ec 08             	sub    $0x8,%esp
c000624c:	6a 00                	push   $0x0
c000624e:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c0006254:	50                   	push   %eax
c0006255:	e8 64 f7 ff ff       	call   c00059be <open>
c000625a:	83 c4 10             	add    $0x10,%esp
c000625d:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0006260:	83 7d c0 ff          	cmpl   $0xffffffff,-0x40(%ebp)
c0006264:	75 15                	jne    c000627b <do_exec+0x107>
c0006266:	83 ec 0c             	sub    $0xc,%esp
c0006269:	68 d0 b4 00 c0       	push   $0xc000b4d0
c000626e:	e8 cb 30 00 00       	call   c000933e <Printf>
c0006273:	83 c4 10             	add    $0x10,%esp
c0006276:	e9 16 03 00 00       	jmp    c0006591 <do_exec+0x41d>
c000627b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006282:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0006285:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0006288:	01 d0                	add    %edx,%eax
c000628a:	83 ec 04             	sub    $0x4,%esp
c000628d:	68 00 10 00 00       	push   $0x1000
c0006292:	50                   	push   %eax
c0006293:	ff 75 c0             	pushl  -0x40(%ebp)
c0006296:	e8 b8 f7 ff ff       	call   c0005a53 <read>
c000629b:	83 c4 10             	add    $0x10,%esp
c000629e:	89 45 bc             	mov    %eax,-0x44(%ebp)
c00062a1:	8b 45 bc             	mov    -0x44(%ebp),%eax
c00062a4:	01 45 f4             	add    %eax,-0xc(%ebp)
c00062a7:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
c00062ab:	74 0a                	je     c00062b7 <do_exec+0x143>
c00062ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00062b0:	3b 45 d0             	cmp    -0x30(%ebp),%eax
c00062b3:	7d 05                	jge    c00062ba <do_exec+0x146>
c00062b5:	eb cb                	jmp    c0006282 <do_exec+0x10e>
c00062b7:	90                   	nop
c00062b8:	eb 01                	jmp    c00062bb <do_exec+0x147>
c00062ba:	90                   	nop
c00062bb:	83 ec 0c             	sub    $0xc,%esp
c00062be:	ff 75 c0             	pushl  -0x40(%ebp)
c00062c1:	e8 93 f9 ff ff       	call   c0005c59 <close>
c00062c6:	83 c4 10             	add    $0x10,%esp
c00062c9:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00062cc:	89 45 b8             	mov    %eax,-0x48(%ebp)
c00062cf:	8b 45 b8             	mov    -0x48(%ebp),%eax
c00062d2:	8b 40 18             	mov    0x18(%eax),%eax
c00062d5:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c00062d8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00062df:	e9 04 01 00 00       	jmp    c00063e8 <do_exec+0x274>
c00062e4:	8b 45 b8             	mov    -0x48(%ebp),%eax
c00062e7:	0f b7 40 28          	movzwl 0x28(%eax),%eax
c00062eb:	0f b7 d0             	movzwl %ax,%edx
c00062ee:	8b 45 b8             	mov    -0x48(%ebp),%eax
c00062f1:	0f b7 40 2a          	movzwl 0x2a(%eax),%eax
c00062f5:	0f b7 c0             	movzwl %ax,%eax
c00062f8:	0f af 45 f0          	imul   -0x10(%ebp),%eax
c00062fc:	01 c2                	add    %eax,%edx
c00062fe:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0006301:	01 d0                	add    %edx,%eax
c0006303:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0006306:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0006309:	8b 40 10             	mov    0x10(%eax),%eax
c000630c:	89 45 ac             	mov    %eax,-0x54(%ebp)
c000630f:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0006312:	05 ff 0f 00 00       	add    $0xfff,%eax
c0006317:	c1 e8 0c             	shr    $0xc,%eax
c000631a:	89 45 a8             	mov    %eax,-0x58(%ebp)
c000631d:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0006320:	8b 40 08             	mov    0x8(%eax),%eax
c0006323:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0006326:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000632d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0006330:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c0006333:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0006336:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0006339:	8b 50 04             	mov    0x4(%eax),%edx
c000633c:	8b 45 a0             	mov    -0x60(%ebp),%eax
c000633f:	01 d0                	add    %edx,%eax
c0006341:	89 45 9c             	mov    %eax,-0x64(%ebp)
c0006344:	83 7d ac 00          	cmpl   $0x0,-0x54(%ebp)
c0006348:	0f 84 95 00 00 00    	je     c00063e3 <do_exec+0x26f>
c000634e:	83 ec 04             	sub    $0x4,%esp
c0006351:	ff 75 d4             	pushl  -0x2c(%ebp)
c0006354:	ff 75 a8             	pushl  -0x58(%ebp)
c0006357:	ff 75 a4             	pushl  -0x5c(%ebp)
c000635a:	e8 c6 07 00 00       	call   c0006b25 <get_virtual_address_start_with_addr>
c000635f:	83 c4 10             	add    $0x10,%esp
c0006362:	89 45 98             	mov    %eax,-0x68(%ebp)
c0006365:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0006368:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000636b:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0006372:	eb 41                	jmp    c00063b5 <do_exec+0x241>
c0006374:	83 ec 08             	sub    $0x8,%esp
c0006377:	ff 75 d4             	pushl  -0x2c(%ebp)
c000637a:	ff 75 e8             	pushl  -0x18(%ebp)
c000637d:	e8 14 0b 00 00       	call   c0006e96 <alloc_physical_memory_of_proc>
c0006382:	83 c4 10             	add    $0x10,%esp
c0006385:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0006388:	83 ec 08             	sub    $0x8,%esp
c000638b:	68 00 10 00 00       	push   $0x1000
c0006390:	ff 75 94             	pushl  -0x6c(%ebp)
c0006393:	e8 82 09 00 00       	call   c0006d1a <alloc_virtual_memory>
c0006398:	83 c4 10             	add    $0x10,%esp
c000639b:	89 45 90             	mov    %eax,-0x70(%ebp)
c000639e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c00063a2:	75 06                	jne    c00063aa <do_exec+0x236>
c00063a4:	8b 45 90             	mov    -0x70(%ebp),%eax
c00063a7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00063aa:	81 45 e8 00 10 00 00 	addl   $0x1000,-0x18(%ebp)
c00063b1:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c00063b5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00063b8:	39 45 a8             	cmp    %eax,-0x58(%ebp)
c00063bb:	77 b7                	ja     c0006374 <do_exec+0x200>
c00063bd:	8b 45 b0             	mov    -0x50(%ebp),%eax
c00063c0:	8b 40 10             	mov    0x10(%eax),%eax
c00063c3:	89 c1                	mov    %eax,%ecx
c00063c5:	8b 45 b0             	mov    -0x50(%ebp),%eax
c00063c8:	8b 50 04             	mov    0x4(%eax),%edx
c00063cb:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00063ce:	01 c2                	add    %eax,%edx
c00063d0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00063d3:	83 ec 04             	sub    $0x4,%esp
c00063d6:	51                   	push   %ecx
c00063d7:	52                   	push   %edx
c00063d8:	50                   	push   %eax
c00063d9:	e8 39 17 00 00       	call   c0007b17 <Memcpy>
c00063de:	83 c4 10             	add    $0x10,%esp
c00063e1:	eb 01                	jmp    c00063e4 <do_exec+0x270>
c00063e3:	90                   	nop
c00063e4:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00063e8:	8b 45 b8             	mov    -0x48(%ebp),%eax
c00063eb:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
c00063ef:	0f b7 c0             	movzwl %ax,%eax
c00063f2:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c00063f5:	0f 8c e9 fe ff ff    	jl     c00062e4 <do_exec+0x170>
c00063fb:	8b 45 08             	mov    0x8(%ebp),%eax
c00063fe:	8b 40 10             	mov    0x10(%eax),%eax
c0006401:	89 45 8c             	mov    %eax,-0x74(%ebp)
c0006404:	8b 45 08             	mov    0x8(%ebp),%eax
c0006407:	8b 40 1c             	mov    0x1c(%eax),%eax
c000640a:	89 45 88             	mov    %eax,-0x78(%ebp)
c000640d:	8b 45 08             	mov    0x8(%ebp),%eax
c0006410:	8b 40 24             	mov    0x24(%eax),%eax
c0006413:	89 45 84             	mov    %eax,-0x7c(%ebp)
c0006416:	83 ec 0c             	sub    $0xc,%esp
c0006419:	ff 75 d4             	pushl  -0x2c(%ebp)
c000641c:	e8 9b e2 ff ff       	call   c00046bc <pid2proc>
c0006421:	83 c4 10             	add    $0x10,%esp
c0006424:	89 45 80             	mov    %eax,-0x80(%ebp)
c0006427:	8b 45 08             	mov    0x8(%ebp),%eax
c000642a:	8b 40 10             	mov    0x10(%eax),%eax
c000642d:	89 85 7c ff ff ff    	mov    %eax,-0x84(%ebp)
c0006433:	83 ec 08             	sub    $0x8,%esp
c0006436:	ff 75 88             	pushl  -0x78(%ebp)
c0006439:	ff b5 7c ff ff ff    	pushl  -0x84(%ebp)
c000643f:	e8 d6 08 00 00       	call   c0006d1a <alloc_virtual_memory>
c0006444:	83 c4 10             	add    $0x10,%esp
c0006447:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c000644d:	8b 45 08             	mov    0x8(%ebp),%eax
c0006450:	8b 40 2c             	mov    0x2c(%eax),%eax
c0006453:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
c0006459:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0006460:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0006466:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0006469:	eb 1a                	jmp    c0006485 <do_exec+0x311>
c000646b:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c000646f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0006472:	8b 10                	mov    (%eax),%edx
c0006474:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c000647a:	01 c2                	add    %eax,%edx
c000647c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000647f:	89 10                	mov    %edx,(%eax)
c0006481:	83 45 dc 04          	addl   $0x4,-0x24(%ebp)
c0006485:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0006488:	8b 00                	mov    (%eax),%eax
c000648a:	85 c0                	test   %eax,%eax
c000648c:	75 dd                	jne    c000646b <do_exec+0x2f7>
c000648e:	83 ec 0c             	sub    $0xc,%esp
c0006491:	ff 75 84             	pushl  -0x7c(%ebp)
c0006494:	e8 81 08 00 00       	call   c0006d1a <alloc_virtual_memory>
c0006499:	83 c4 10             	add    $0x10,%esp
c000649c:	89 85 70 ff ff ff    	mov    %eax,-0x90(%ebp)
c00064a2:	8b 95 78 ff ff ff    	mov    -0x88(%ebp),%edx
c00064a8:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
c00064ae:	83 ec 04             	sub    $0x4,%esp
c00064b1:	ff 75 88             	pushl  -0x78(%ebp)
c00064b4:	52                   	push   %edx
c00064b5:	50                   	push   %eax
c00064b6:	e8 5c 16 00 00       	call   c0007b17 <Memcpy>
c00064bb:	83 c4 10             	add    $0x10,%esp
c00064be:	8b 45 08             	mov    0x8(%ebp),%eax
c00064c1:	8b 40 28             	mov    0x28(%eax),%eax
c00064c4:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c00064ca:	83 ec 08             	sub    $0x8,%esp
c00064cd:	ff 75 d4             	pushl  -0x2c(%ebp)
c00064d0:	ff 75 80             	pushl  -0x80(%ebp)
c00064d3:	e8 10 09 00 00       	call   c0006de8 <get_physical_address_proc>
c00064d8:	83 c4 10             	add    $0x10,%esp
c00064db:	89 85 68 ff ff ff    	mov    %eax,-0x98(%ebp)
c00064e1:	83 ec 08             	sub    $0x8,%esp
c00064e4:	68 00 10 00 00       	push   $0x1000
c00064e9:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
c00064ef:	e8 26 08 00 00       	call   c0006d1a <alloc_virtual_memory>
c00064f4:	83 c4 10             	add    $0x10,%esp
c00064f7:	89 85 64 ff ff ff    	mov    %eax,-0x9c(%ebp)
c00064fd:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
c0006503:	05 bc 0f 00 00       	add    $0xfbc,%eax
c0006508:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
c000650e:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c0006514:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c000651a:	89 50 20             	mov    %edx,0x20(%eax)
c000651d:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0006520:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c0006526:	89 50 28             	mov    %edx,0x28(%eax)
c0006529:	66 87 db             	xchg   %bx,%bx
c000652c:	8b 45 b8             	mov    -0x48(%ebp),%eax
c000652f:	8b 40 18             	mov    0x18(%eax),%eax
c0006532:	89 c2                	mov    %eax,%edx
c0006534:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c000653a:	89 50 30             	mov    %edx,0x30(%eax)
c000653d:	66 87 db             	xchg   %bx,%bx
c0006540:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c0006546:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c000654c:	89 50 3c             	mov    %edx,0x3c(%eax)
c000654f:	8b 45 80             	mov    -0x80(%ebp),%eax
c0006552:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c0006559:	00 00 00 
c000655c:	c7 85 44 ff ff ff 65 	movl   $0x65,-0xbc(%ebp)
c0006563:	00 00 00 
c0006566:	c7 85 24 ff ff ff 00 	movl   $0x0,-0xdc(%ebp)
c000656d:	00 00 00 
c0006570:	c7 85 28 ff ff ff 00 	movl   $0x0,-0xd8(%ebp)
c0006577:	00 00 00 
c000657a:	83 ec 04             	sub    $0x4,%esp
c000657d:	ff 75 d4             	pushl  -0x2c(%ebp)
c0006580:	8d 85 cc fe ff ff    	lea    -0x134(%ebp),%eax
c0006586:	50                   	push   %eax
c0006587:	6a 01                	push   $0x1
c0006589:	e8 4a 3a 00 00       	call   c0009fd8 <send_rec>
c000658e:	83 c4 10             	add    $0x10,%esp
c0006591:	c9                   	leave  
c0006592:	c3                   	ret    

c0006593 <do_fork>:
c0006593:	55                   	push   %ebp
c0006594:	89 e5                	mov    %esp,%ebp
c0006596:	81 ec 98 00 00 00    	sub    $0x98,%esp
c000659c:	8b 45 08             	mov    0x8(%ebp),%eax
c000659f:	8b 00                	mov    (%eax),%eax
c00065a1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00065a4:	83 ec 0c             	sub    $0xc,%esp
c00065a7:	ff 75 f4             	pushl  -0xc(%ebp)
c00065aa:	e8 0c 43 00 00       	call   c000a8bb <fork_process>
c00065af:	83 c4 10             	add    $0x10,%esp
c00065b2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00065b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00065b8:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c00065be:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00065c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00065c4:	8b 90 24 01 00 00    	mov    0x124(%eax),%edx
c00065ca:	8b 45 08             	mov    0x8(%ebp),%eax
c00065cd:	89 50 5c             	mov    %edx,0x5c(%eax)
c00065d0:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c00065d7:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c00065de:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c00065e5:	83 ec 04             	sub    $0x4,%esp
c00065e8:	ff 75 ec             	pushl  -0x14(%ebp)
c00065eb:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
c00065f1:	50                   	push   %eax
c00065f2:	6a 01                	push   $0x1
c00065f4:	e8 df 39 00 00       	call   c0009fd8 <send_rec>
c00065f9:	83 c4 10             	add    $0x10,%esp
c00065fc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00065ff:	c9                   	leave  
c0006600:	c3                   	ret    

c0006601 <do_exit>:
c0006601:	55                   	push   %ebp
c0006602:	89 e5                	mov    %esp,%ebp
c0006604:	83 ec 18             	sub    $0x18,%esp
c0006607:	8b 45 08             	mov    0x8(%ebp),%eax
c000660a:	8b 00                	mov    (%eax),%eax
c000660c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000660f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006612:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006618:	05 00 32 08 c0       	add    $0xc0083200,%eax
c000661d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006620:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006623:	8b 80 64 02 00 00    	mov    0x264(%eax),%eax
c0006629:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000662c:	8b 45 08             	mov    0x8(%ebp),%eax
c000662f:	8b 40 54             	mov    0x54(%eax),%eax
c0006632:	89 c2                	mov    %eax,%edx
c0006634:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006637:	89 90 68 02 00 00    	mov    %edx,0x268(%eax)
c000663d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006640:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006646:	05 49 34 08 c0       	add    $0xc0083449,%eax
c000664b:	0f b6 00             	movzbl (%eax),%eax
c000664e:	3c 04                	cmp    $0x4,%al
c0006650:	75 21                	jne    c0006673 <do_exit+0x72>
c0006652:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006655:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c000665b:	05 49 34 08 c0       	add    $0xc0083449,%eax
c0006660:	c6 00 fb             	movb   $0xfb,(%eax)
c0006663:	83 ec 0c             	sub    $0xc,%esp
c0006666:	ff 75 ec             	pushl  -0x14(%ebp)
c0006669:	e8 5c 01 00 00       	call   c00067ca <cleanup>
c000666e:	83 c4 10             	add    $0x10,%esp
c0006671:	eb 0a                	jmp    c000667d <do_exit+0x7c>
c0006673:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006676:	c6 80 48 02 00 00 03 	movb   $0x3,0x248(%eax)
c000667d:	c7 45 f4 08 00 00 00 	movl   $0x8,-0xc(%ebp)
c0006684:	eb 6e                	jmp    c00066f4 <do_exit+0xf3>
c0006686:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006689:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c000668f:	05 64 34 08 c0       	add    $0xc0083464,%eax
c0006694:	8b 00                	mov    (%eax),%eax
c0006696:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0006699:	75 55                	jne    c00066f0 <do_exit+0xef>
c000669b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000669e:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c00066a4:	05 64 34 08 c0       	add    $0xc0083464,%eax
c00066a9:	c7 00 06 00 00 00    	movl   $0x6,(%eax)
c00066af:	0f b6 05 81 44 08 c0 	movzbl 0xc0084481,%eax
c00066b6:	3c 04                	cmp    $0x4,%al
c00066b8:	75 36                	jne    c00066f0 <do_exit+0xef>
c00066ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00066bd:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c00066c3:	05 49 34 08 c0       	add    $0xc0083449,%eax
c00066c8:	0f b6 00             	movzbl (%eax),%eax
c00066cb:	3c 03                	cmp    $0x3,%al
c00066cd:	75 21                	jne    c00066f0 <do_exit+0xef>
c00066cf:	c6 05 81 44 08 c0 fb 	movb   $0xfb,0xc0084481
c00066d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00066d9:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c00066df:	05 00 32 08 c0       	add    $0xc0083200,%eax
c00066e4:	83 ec 0c             	sub    $0xc,%esp
c00066e7:	50                   	push   %eax
c00066e8:	e8 dd 00 00 00       	call   c00067ca <cleanup>
c00066ed:	83 c4 10             	add    $0x10,%esp
c00066f0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00066f4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00066f8:	7e 8c                	jle    c0006686 <do_exit+0x85>
c00066fa:	90                   	nop
c00066fb:	c9                   	leave  
c00066fc:	c3                   	ret    

c00066fd <do_wait>:
c00066fd:	55                   	push   %ebp
c00066fe:	89 e5                	mov    %esp,%ebp
c0006700:	81 ec 98 00 00 00    	sub    $0x98,%esp
c0006706:	8b 45 08             	mov    0x8(%ebp),%eax
c0006709:	8b 00                	mov    (%eax),%eax
c000670b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000670e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006715:	c7 45 f0 08 00 00 00 	movl   $0x8,-0x10(%ebp)
c000671c:	eb 5f                	jmp    c000677d <do_wait+0x80>
c000671e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006721:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006727:	05 64 34 08 c0       	add    $0xc0083464,%eax
c000672c:	8b 00                	mov    (%eax),%eax
c000672e:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c0006731:	75 46                	jne    c0006779 <do_wait+0x7c>
c0006733:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0006737:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000673a:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006740:	05 49 34 08 c0       	add    $0xc0083449,%eax
c0006745:	0f b6 00             	movzbl (%eax),%eax
c0006748:	3c 03                	cmp    $0x3,%al
c000674a:	75 2d                	jne    c0006779 <do_wait+0x7c>
c000674c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000674f:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006755:	05 49 34 08 c0       	add    $0xc0083449,%eax
c000675a:	c6 00 fb             	movb   $0xfb,(%eax)
c000675d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006760:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006766:	05 00 32 08 c0       	add    $0xc0083200,%eax
c000676b:	83 ec 0c             	sub    $0xc,%esp
c000676e:	50                   	push   %eax
c000676f:	e8 56 00 00 00       	call   c00067ca <cleanup>
c0006774:	83 c4 10             	add    $0x10,%esp
c0006777:	eb 4f                	jmp    c00067c8 <do_wait+0xcb>
c0006779:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c000677d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0006781:	7e 9b                	jle    c000671e <do_wait+0x21>
c0006783:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0006787:	74 13                	je     c000679c <do_wait+0x9f>
c0006789:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000678c:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006792:	05 49 34 08 c0       	add    $0xc0083449,%eax
c0006797:	c6 00 04             	movb   $0x4,(%eax)
c000679a:	eb 2c                	jmp    c00067c8 <do_wait+0xcb>
c000679c:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c00067a3:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c00067aa:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c00067b1:	83 ec 04             	sub    $0x4,%esp
c00067b4:	ff 75 ec             	pushl  -0x14(%ebp)
c00067b7:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
c00067bd:	50                   	push   %eax
c00067be:	6a 01                	push   $0x1
c00067c0:	e8 13 38 00 00       	call   c0009fd8 <send_rec>
c00067c5:	83 c4 10             	add    $0x10,%esp
c00067c8:	c9                   	leave  
c00067c9:	c3                   	ret    

c00067ca <cleanup>:
c00067ca:	55                   	push   %ebp
c00067cb:	89 e5                	mov    %esp,%ebp
c00067cd:	81 ec 88 00 00 00    	sub    $0x88,%esp
c00067d3:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c00067da:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c00067e1:	8b 45 08             	mov    0x8(%ebp),%eax
c00067e4:	8b 80 64 02 00 00    	mov    0x264(%eax),%eax
c00067ea:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00067ed:	8b 45 08             	mov    0x8(%ebp),%eax
c00067f0:	8b 80 68 02 00 00    	mov    0x268(%eax),%eax
c00067f6:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00067f9:	8b 45 08             	mov    0x8(%ebp),%eax
c00067fc:	8b 80 64 02 00 00    	mov    0x264(%eax),%eax
c0006802:	83 ec 04             	sub    $0x4,%esp
c0006805:	50                   	push   %eax
c0006806:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c000680c:	50                   	push   %eax
c000680d:	6a 01                	push   $0x1
c000680f:	e8 c4 37 00 00       	call   c0009fd8 <send_rec>
c0006814:	83 c4 10             	add    $0x10,%esp
c0006817:	8b 45 08             	mov    0x8(%ebp),%eax
c000681a:	c6 80 48 02 00 00 ff 	movb   $0xff,0x248(%eax)
c0006821:	90                   	nop
c0006822:	c9                   	leave  
c0006823:	c3                   	ret    

c0006824 <init_bitmap>:
c0006824:	55                   	push   %ebp
c0006825:	89 e5                	mov    %esp,%ebp
c0006827:	83 ec 08             	sub    $0x8,%esp
c000682a:	8b 45 08             	mov    0x8(%ebp),%eax
c000682d:	8b 50 04             	mov    0x4(%eax),%edx
c0006830:	8b 45 08             	mov    0x8(%ebp),%eax
c0006833:	8b 00                	mov    (%eax),%eax
c0006835:	83 ec 04             	sub    $0x4,%esp
c0006838:	52                   	push   %edx
c0006839:	6a 00                	push   $0x0
c000683b:	50                   	push   %eax
c000683c:	e8 fe 55 00 00       	call   c000be3f <Memset>
c0006841:	83 c4 10             	add    $0x10,%esp
c0006844:	90                   	nop
c0006845:	c9                   	leave  
c0006846:	c3                   	ret    

c0006847 <test_bit_val>:
c0006847:	55                   	push   %ebp
c0006848:	89 e5                	mov    %esp,%ebp
c000684a:	53                   	push   %ebx
c000684b:	83 ec 10             	sub    $0x10,%esp
c000684e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006851:	8d 50 07             	lea    0x7(%eax),%edx
c0006854:	85 c0                	test   %eax,%eax
c0006856:	0f 48 c2             	cmovs  %edx,%eax
c0006859:	c1 f8 03             	sar    $0x3,%eax
c000685c:	89 45 f8             	mov    %eax,-0x8(%ebp)
c000685f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006862:	99                   	cltd   
c0006863:	c1 ea 1d             	shr    $0x1d,%edx
c0006866:	01 d0                	add    %edx,%eax
c0006868:	83 e0 07             	and    $0x7,%eax
c000686b:	29 d0                	sub    %edx,%eax
c000686d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006870:	8b 45 08             	mov    0x8(%ebp),%eax
c0006873:	8b 10                	mov    (%eax),%edx
c0006875:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006878:	01 d0                	add    %edx,%eax
c000687a:	0f b6 00             	movzbl (%eax),%eax
c000687d:	88 45 f3             	mov    %al,-0xd(%ebp)
c0006880:	0f be 55 f3          	movsbl -0xd(%ebp),%edx
c0006884:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006887:	bb 01 00 00 00       	mov    $0x1,%ebx
c000688c:	89 c1                	mov    %eax,%ecx
c000688e:	d3 e3                	shl    %cl,%ebx
c0006890:	89 d8                	mov    %ebx,%eax
c0006892:	21 c2                	and    %eax,%edx
c0006894:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006897:	89 c1                	mov    %eax,%ecx
c0006899:	d3 fa                	sar    %cl,%edx
c000689b:	89 d0                	mov    %edx,%eax
c000689d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00068a0:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c00068a4:	0f 9f c0             	setg   %al
c00068a7:	0f b6 c0             	movzbl %al,%eax
c00068aa:	83 c4 10             	add    $0x10,%esp
c00068ad:	5b                   	pop    %ebx
c00068ae:	5d                   	pop    %ebp
c00068af:	c3                   	ret    

c00068b0 <set_bit_val>:
c00068b0:	55                   	push   %ebp
c00068b1:	89 e5                	mov    %esp,%ebp
c00068b3:	83 ec 10             	sub    $0x10,%esp
c00068b6:	8b 45 0c             	mov    0xc(%ebp),%eax
c00068b9:	8d 50 07             	lea    0x7(%eax),%edx
c00068bc:	85 c0                	test   %eax,%eax
c00068be:	0f 48 c2             	cmovs  %edx,%eax
c00068c1:	c1 f8 03             	sar    $0x3,%eax
c00068c4:	89 45 f8             	mov    %eax,-0x8(%ebp)
c00068c7:	8b 45 0c             	mov    0xc(%ebp),%eax
c00068ca:	99                   	cltd   
c00068cb:	c1 ea 1d             	shr    $0x1d,%edx
c00068ce:	01 d0                	add    %edx,%eax
c00068d0:	83 e0 07             	and    $0x7,%eax
c00068d3:	29 d0                	sub    %edx,%eax
c00068d5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00068d8:	8b 45 08             	mov    0x8(%ebp),%eax
c00068db:	8b 10                	mov    (%eax),%edx
c00068dd:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00068e0:	01 d0                	add    %edx,%eax
c00068e2:	0f b6 00             	movzbl (%eax),%eax
c00068e5:	88 45 ff             	mov    %al,-0x1(%ebp)
c00068e8:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c00068ec:	7e 13                	jle    c0006901 <set_bit_val+0x51>
c00068ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00068f1:	ba 01 00 00 00       	mov    $0x1,%edx
c00068f6:	89 c1                	mov    %eax,%ecx
c00068f8:	d3 e2                	shl    %cl,%edx
c00068fa:	89 d0                	mov    %edx,%eax
c00068fc:	08 45 ff             	or     %al,-0x1(%ebp)
c00068ff:	eb 13                	jmp    c0006914 <set_bit_val+0x64>
c0006901:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006904:	ba 01 00 00 00       	mov    $0x1,%edx
c0006909:	89 c1                	mov    %eax,%ecx
c000690b:	d3 e2                	shl    %cl,%edx
c000690d:	89 d0                	mov    %edx,%eax
c000690f:	f7 d0                	not    %eax
c0006911:	20 45 ff             	and    %al,-0x1(%ebp)
c0006914:	8b 45 08             	mov    0x8(%ebp),%eax
c0006917:	8b 10                	mov    (%eax),%edx
c0006919:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000691c:	01 c2                	add    %eax,%edx
c000691e:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
c0006922:	88 02                	mov    %al,(%edx)
c0006924:	b8 01 00 00 00       	mov    $0x1,%eax
c0006929:	c9                   	leave  
c000692a:	c3                   	ret    

c000692b <set_bits>:
c000692b:	55                   	push   %ebp
c000692c:	89 e5                	mov    %esp,%ebp
c000692e:	83 ec 10             	sub    $0x10,%esp
c0006931:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0006938:	eb 1c                	jmp    c0006956 <set_bits+0x2b>
c000693a:	8b 45 0c             	mov    0xc(%ebp),%eax
c000693d:	8d 50 01             	lea    0x1(%eax),%edx
c0006940:	89 55 0c             	mov    %edx,0xc(%ebp)
c0006943:	ff 75 10             	pushl  0x10(%ebp)
c0006946:	50                   	push   %eax
c0006947:	ff 75 08             	pushl  0x8(%ebp)
c000694a:	e8 61 ff ff ff       	call   c00068b0 <set_bit_val>
c000694f:	83 c4 0c             	add    $0xc,%esp
c0006952:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0006956:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006959:	3b 45 14             	cmp    0x14(%ebp),%eax
c000695c:	7c dc                	jl     c000693a <set_bits+0xf>
c000695e:	b8 01 00 00 00       	mov    $0x1,%eax
c0006963:	c9                   	leave  
c0006964:	c3                   	ret    

c0006965 <get_first_free_bit>:
c0006965:	55                   	push   %ebp
c0006966:	89 e5                	mov    %esp,%ebp
c0006968:	83 ec 10             	sub    $0x10,%esp
c000696b:	8b 45 08             	mov    0x8(%ebp),%eax
c000696e:	8b 40 04             	mov    0x4(%eax),%eax
c0006971:	c1 e0 03             	shl    $0x3,%eax
c0006974:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006977:	8b 45 0c             	mov    0xc(%ebp),%eax
c000697a:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000697d:	eb 1b                	jmp    c000699a <get_first_free_bit+0x35>
c000697f:	ff 75 fc             	pushl  -0x4(%ebp)
c0006982:	ff 75 08             	pushl  0x8(%ebp)
c0006985:	e8 bd fe ff ff       	call   c0006847 <test_bit_val>
c000698a:	83 c4 08             	add    $0x8,%esp
c000698d:	85 c0                	test   %eax,%eax
c000698f:	75 05                	jne    c0006996 <get_first_free_bit+0x31>
c0006991:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006994:	eb 11                	jmp    c00069a7 <get_first_free_bit+0x42>
c0006996:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c000699a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000699d:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c00069a0:	7c dd                	jl     c000697f <get_first_free_bit+0x1a>
c00069a2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c00069a7:	c9                   	leave  
c00069a8:	c3                   	ret    

c00069a9 <get_bits>:
c00069a9:	55                   	push   %ebp
c00069aa:	89 e5                	mov    %esp,%ebp
c00069ac:	83 ec 20             	sub    $0x20,%esp
c00069af:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00069b6:	ff 75 f0             	pushl  -0x10(%ebp)
c00069b9:	ff 75 08             	pushl  0x8(%ebp)
c00069bc:	e8 a4 ff ff ff       	call   c0006965 <get_first_free_bit>
c00069c1:	83 c4 08             	add    $0x8,%esp
c00069c4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00069c7:	8b 45 08             	mov    0x8(%ebp),%eax
c00069ca:	8b 40 04             	mov    0x4(%eax),%eax
c00069cd:	c1 e0 03             	shl    $0x3,%eax
c00069d0:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00069d3:	8b 45 0c             	mov    0xc(%ebp),%eax
c00069d6:	83 e8 01             	sub    $0x1,%eax
c00069d9:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00069dc:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c00069e0:	75 08                	jne    c00069ea <get_bits+0x41>
c00069e2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00069e5:	e9 85 00 00 00       	jmp    c0006a6f <get_bits+0xc6>
c00069ea:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00069ed:	83 c0 01             	add    $0x1,%eax
c00069f0:	89 45 f8             	mov    %eax,-0x8(%ebp)
c00069f3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00069f6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00069f9:	eb 58                	jmp    c0006a53 <get_bits+0xaa>
c00069fb:	ff 75 f8             	pushl  -0x8(%ebp)
c00069fe:	ff 75 08             	pushl  0x8(%ebp)
c0006a01:	e8 41 fe ff ff       	call   c0006847 <test_bit_val>
c0006a06:	83 c4 08             	add    $0x8,%esp
c0006a09:	85 c0                	test   %eax,%eax
c0006a0b:	75 0a                	jne    c0006a17 <get_bits+0x6e>
c0006a0d:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0006a11:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0006a15:	eb 2b                	jmp    c0006a42 <get_bits+0x99>
c0006a17:	6a 00                	push   $0x0
c0006a19:	ff 75 08             	pushl  0x8(%ebp)
c0006a1c:	e8 44 ff ff ff       	call   c0006965 <get_first_free_bit>
c0006a21:	83 c4 08             	add    $0x8,%esp
c0006a24:	83 c0 01             	add    $0x1,%eax
c0006a27:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006a2a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006a2d:	83 c0 01             	add    $0x1,%eax
c0006a30:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006a33:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006a36:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006a39:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006a3c:	83 e8 01             	sub    $0x1,%eax
c0006a3f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006a42:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006a45:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c0006a48:	7c 09                	jl     c0006a53 <get_bits+0xaa>
c0006a4a:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c0006a51:	eb 0d                	jmp    c0006a60 <get_bits+0xb7>
c0006a53:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006a56:	8d 50 ff             	lea    -0x1(%eax),%edx
c0006a59:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0006a5c:	85 c0                	test   %eax,%eax
c0006a5e:	7f 9b                	jg     c00069fb <get_bits+0x52>
c0006a60:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006a63:	2b 45 0c             	sub    0xc(%ebp),%eax
c0006a66:	83 c0 01             	add    $0x1,%eax
c0006a69:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006a6c:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006a6f:	c9                   	leave  
c0006a70:	c3                   	ret    

c0006a71 <get_a_page>:
c0006a71:	55                   	push   %ebp
c0006a72:	89 e5                	mov    %esp,%ebp
c0006a74:	83 ec 28             	sub    $0x28,%esp
c0006a77:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0006a7b:	75 22                	jne    c0006a9f <get_a_page+0x2e>
c0006a7d:	a1 ac 16 01 c0       	mov    0xc00116ac,%eax
c0006a82:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006a85:	a1 b0 16 01 c0       	mov    0xc00116b0,%eax
c0006a8a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006a8d:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c0006a92:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006a95:	a1 b8 16 01 c0       	mov    0xc00116b8,%eax
c0006a9a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006a9d:	eb 20                	jmp    c0006abf <get_a_page+0x4e>
c0006a9f:	a1 f4 1e 01 c0       	mov    0xc0011ef4,%eax
c0006aa4:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006aa7:	a1 f8 1e 01 c0       	mov    0xc0011ef8,%eax
c0006aac:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006aaf:	a1 fc 1e 01 c0       	mov    0xc0011efc,%eax
c0006ab4:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006ab7:	a1 00 1f 01 c0       	mov    0xc0011f00,%eax
c0006abc:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006abf:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006ac2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0006ac5:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006ac8:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0006acb:	6a 01                	push   $0x1
c0006acd:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0006ad0:	50                   	push   %eax
c0006ad1:	e8 d3 fe ff ff       	call   c00069a9 <get_bits>
c0006ad6:	83 c4 08             	add    $0x8,%esp
c0006ad9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006adc:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c0006ae0:	75 1c                	jne    c0006afe <get_a_page+0x8d>
c0006ae2:	68 84 00 00 00       	push   $0x84
c0006ae7:	68 e0 b4 00 c0       	push   $0xc000b4e0
c0006aec:	68 e0 b4 00 c0       	push   $0xc000b4e0
c0006af1:	68 ea b4 00 c0       	push   $0xc000b4ea
c0006af6:	e8 a0 2b 00 00       	call   c000969b <assertion_failure>
c0006afb:	83 c4 10             	add    $0x10,%esp
c0006afe:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006b01:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0006b04:	c1 e2 0c             	shl    $0xc,%edx
c0006b07:	01 d0                	add    %edx,%eax
c0006b09:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006b0c:	83 ec 04             	sub    $0x4,%esp
c0006b0f:	6a 01                	push   $0x1
c0006b11:	ff 75 f4             	pushl  -0xc(%ebp)
c0006b14:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0006b17:	50                   	push   %eax
c0006b18:	e8 93 fd ff ff       	call   c00068b0 <set_bit_val>
c0006b1d:	83 c4 10             	add    $0x10,%esp
c0006b20:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006b23:	c9                   	leave  
c0006b24:	c3                   	ret    

c0006b25 <get_virtual_address_start_with_addr>:
c0006b25:	55                   	push   %ebp
c0006b26:	89 e5                	mov    %esp,%ebp
c0006b28:	83 ec 38             	sub    $0x38,%esp
c0006b2b:	e8 67 a8 ff ff       	call   c0001397 <get_running_thread_pcb>
c0006b30:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006b33:	83 ec 0c             	sub    $0xc,%esp
c0006b36:	ff 75 10             	pushl  0x10(%ebp)
c0006b39:	e8 7e db ff ff       	call   c00046bc <pid2proc>
c0006b3e:	83 c4 10             	add    $0x10,%esp
c0006b41:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006b44:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006b47:	8b 40 0c             	mov    0xc(%eax),%eax
c0006b4a:	83 ec 04             	sub    $0x4,%esp
c0006b4d:	6a 0c                	push   $0xc
c0006b4f:	50                   	push   %eax
c0006b50:	8d 45 dc             	lea    -0x24(%ebp),%eax
c0006b53:	50                   	push   %eax
c0006b54:	e8 be 0f 00 00       	call   c0007b17 <Memcpy>
c0006b59:	83 c4 10             	add    $0x10,%esp
c0006b5c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0006b5f:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0006b62:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0006b65:	89 55 d8             	mov    %edx,-0x28(%ebp)
c0006b68:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006b6b:	8b 55 08             	mov    0x8(%ebp),%edx
c0006b6e:	29 c2                	sub    %eax,%edx
c0006b70:	89 d0                	mov    %edx,%eax
c0006b72:	c1 e8 0c             	shr    $0xc,%eax
c0006b75:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006b78:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0006b7c:	79 1c                	jns    c0006b9a <get_virtual_address_start_with_addr+0x75>
c0006b7e:	68 97 00 00 00       	push   $0x97
c0006b83:	68 e0 b4 00 c0       	push   $0xc000b4e0
c0006b88:	68 e0 b4 00 c0       	push   $0xc000b4e0
c0006b8d:	68 f6 b4 00 c0       	push   $0xc000b4f6
c0006b92:	e8 04 2b 00 00       	call   c000969b <assertion_failure>
c0006b97:	83 c4 10             	add    $0x10,%esp
c0006b9a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006b9d:	50                   	push   %eax
c0006b9e:	6a 01                	push   $0x1
c0006ba0:	ff 75 ec             	pushl  -0x14(%ebp)
c0006ba3:	8d 45 d4             	lea    -0x2c(%ebp),%eax
c0006ba6:	50                   	push   %eax
c0006ba7:	e8 7f fd ff ff       	call   c000692b <set_bits>
c0006bac:	83 c4 10             	add    $0x10,%esp
c0006baf:	8b 45 08             	mov    0x8(%ebp),%eax
c0006bb2:	25 ff 0f 00 00       	and    $0xfff,%eax
c0006bb7:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006bba:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006bbd:	c9                   	leave  
c0006bbe:	c3                   	ret    

c0006bbf <get_virtual_address>:
c0006bbf:	55                   	push   %ebp
c0006bc0:	89 e5                	mov    %esp,%ebp
c0006bc2:	83 ec 28             	sub    $0x28,%esp
c0006bc5:	e8 cd a7 ff ff       	call   c0001397 <get_running_thread_pcb>
c0006bca:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006bcd:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0006bd1:	75 1a                	jne    c0006bed <get_virtual_address+0x2e>
c0006bd3:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c0006bd8:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006bdb:	a1 98 07 01 c0       	mov    0xc0010798,%eax
c0006be0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006be3:	a1 9c 07 01 c0       	mov    0xc001079c,%eax
c0006be8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006beb:	eb 18                	jmp    c0006c05 <get_virtual_address+0x46>
c0006bed:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006bf0:	8b 40 0c             	mov    0xc(%eax),%eax
c0006bf3:	83 ec 04             	sub    $0x4,%esp
c0006bf6:	6a 0c                	push   $0xc
c0006bf8:	50                   	push   %eax
c0006bf9:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0006bfc:	50                   	push   %eax
c0006bfd:	e8 15 0f 00 00       	call   c0007b17 <Memcpy>
c0006c02:	83 c4 10             	add    $0x10,%esp
c0006c05:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006c08:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0006c0b:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006c0e:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0006c11:	8b 45 08             	mov    0x8(%ebp),%eax
c0006c14:	83 ec 08             	sub    $0x8,%esp
c0006c17:	50                   	push   %eax
c0006c18:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0006c1b:	50                   	push   %eax
c0006c1c:	e8 88 fd ff ff       	call   c00069a9 <get_bits>
c0006c21:	83 c4 10             	add    $0x10,%esp
c0006c24:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006c27:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006c2a:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0006c2d:	c1 e2 0c             	shl    $0xc,%edx
c0006c30:	01 d0                	add    %edx,%eax
c0006c32:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006c35:	8b 45 08             	mov    0x8(%ebp),%eax
c0006c38:	50                   	push   %eax
c0006c39:	6a 01                	push   $0x1
c0006c3b:	ff 75 f0             	pushl  -0x10(%ebp)
c0006c3e:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0006c41:	50                   	push   %eax
c0006c42:	e8 e4 fc ff ff       	call   c000692b <set_bits>
c0006c47:	83 c4 10             	add    $0x10,%esp
c0006c4a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006c4d:	c9                   	leave  
c0006c4e:	c3                   	ret    

c0006c4f <ptr_pde>:
c0006c4f:	55                   	push   %ebp
c0006c50:	89 e5                	mov    %esp,%ebp
c0006c52:	8b 45 08             	mov    0x8(%ebp),%eax
c0006c55:	c1 e8 16             	shr    $0x16,%eax
c0006c58:	05 00 fc ff 3f       	add    $0x3ffffc00,%eax
c0006c5d:	c1 e0 02             	shl    $0x2,%eax
c0006c60:	5d                   	pop    %ebp
c0006c61:	c3                   	ret    

c0006c62 <ptr_pte>:
c0006c62:	55                   	push   %ebp
c0006c63:	89 e5                	mov    %esp,%ebp
c0006c65:	8b 45 08             	mov    0x8(%ebp),%eax
c0006c68:	c1 e8 0a             	shr    $0xa,%eax
c0006c6b:	25 00 f0 3f 00       	and    $0x3ff000,%eax
c0006c70:	89 c2                	mov    %eax,%edx
c0006c72:	8b 45 08             	mov    0x8(%ebp),%eax
c0006c75:	c1 e8 0c             	shr    $0xc,%eax
c0006c78:	25 ff 03 00 00       	and    $0x3ff,%eax
c0006c7d:	c1 e0 02             	shl    $0x2,%eax
c0006c80:	01 d0                	add    %edx,%eax
c0006c82:	2d 00 00 40 00       	sub    $0x400000,%eax
c0006c87:	5d                   	pop    %ebp
c0006c88:	c3                   	ret    

c0006c89 <add_map_entry>:
c0006c89:	55                   	push   %ebp
c0006c8a:	89 e5                	mov    %esp,%ebp
c0006c8c:	83 ec 18             	sub    $0x18,%esp
c0006c8f:	ff 75 08             	pushl  0x8(%ebp)
c0006c92:	e8 b8 ff ff ff       	call   c0006c4f <ptr_pde>
c0006c97:	83 c4 04             	add    $0x4,%esp
c0006c9a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006c9d:	ff 75 08             	pushl  0x8(%ebp)
c0006ca0:	e8 bd ff ff ff       	call   c0006c62 <ptr_pte>
c0006ca5:	83 c4 04             	add    $0x4,%esp
c0006ca8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006cab:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006cae:	8b 00                	mov    (%eax),%eax
c0006cb0:	83 e0 01             	and    $0x1,%eax
c0006cb3:	85 c0                	test   %eax,%eax
c0006cb5:	74 1b                	je     c0006cd2 <add_map_entry+0x49>
c0006cb7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006cba:	8b 00                	mov    (%eax),%eax
c0006cbc:	83 e0 01             	and    $0x1,%eax
c0006cbf:	85 c0                	test   %eax,%eax
c0006cc1:	75 54                	jne    c0006d17 <add_map_entry+0x8e>
c0006cc3:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006cc6:	83 c8 07             	or     $0x7,%eax
c0006cc9:	89 c2                	mov    %eax,%edx
c0006ccb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006cce:	89 10                	mov    %edx,(%eax)
c0006cd0:	eb 45                	jmp    c0006d17 <add_map_entry+0x8e>
c0006cd2:	83 ec 0c             	sub    $0xc,%esp
c0006cd5:	6a 00                	push   $0x0
c0006cd7:	e8 95 fd ff ff       	call   c0006a71 <get_a_page>
c0006cdc:	83 c4 10             	add    $0x10,%esp
c0006cdf:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006ce2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006ce5:	83 c8 07             	or     $0x7,%eax
c0006ce8:	89 c2                	mov    %eax,%edx
c0006cea:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006ced:	89 10                	mov    %edx,(%eax)
c0006cef:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006cf2:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0006cf7:	83 ec 04             	sub    $0x4,%esp
c0006cfa:	68 00 10 00 00       	push   $0x1000
c0006cff:	6a 00                	push   $0x0
c0006d01:	50                   	push   %eax
c0006d02:	e8 38 51 00 00       	call   c000be3f <Memset>
c0006d07:	83 c4 10             	add    $0x10,%esp
c0006d0a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006d0d:	83 c8 07             	or     $0x7,%eax
c0006d10:	89 c2                	mov    %eax,%edx
c0006d12:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006d15:	89 10                	mov    %edx,(%eax)
c0006d17:	90                   	nop
c0006d18:	c9                   	leave  
c0006d19:	c3                   	ret    

c0006d1a <alloc_virtual_memory>:
c0006d1a:	55                   	push   %ebp
c0006d1b:	89 e5                	mov    %esp,%ebp
c0006d1d:	83 ec 28             	sub    $0x28,%esp
c0006d20:	8b 45 08             	mov    0x8(%ebp),%eax
c0006d23:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0006d28:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006d2b:	8b 45 08             	mov    0x8(%ebp),%eax
c0006d2e:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0006d31:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006d34:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006d37:	01 45 e4             	add    %eax,-0x1c(%ebp)
c0006d3a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006d3d:	05 ff 0f 00 00       	add    $0xfff,%eax
c0006d42:	c1 e8 0c             	shr    $0xc,%eax
c0006d45:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006d48:	e8 4a a6 ff ff       	call   c0001397 <get_running_thread_pcb>
c0006d4d:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0006d50:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0006d53:	8b 40 08             	mov    0x8(%eax),%eax
c0006d56:	85 c0                	test   %eax,%eax
c0006d58:	75 09                	jne    c0006d63 <alloc_virtual_memory+0x49>
c0006d5a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0006d61:	eb 07                	jmp    c0006d6a <alloc_virtual_memory+0x50>
c0006d63:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0006d6a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0006d71:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0006d78:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0006d7f:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0006d86:	eb 47                	jmp    c0006dcf <alloc_virtual_memory+0xb5>
c0006d88:	83 ec 08             	sub    $0x8,%esp
c0006d8b:	ff 75 f0             	pushl  -0x10(%ebp)
c0006d8e:	6a 01                	push   $0x1
c0006d90:	e8 2a fe ff ff       	call   c0006bbf <get_virtual_address>
c0006d95:	83 c4 10             	add    $0x10,%esp
c0006d98:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006d9b:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0006d9f:	74 13                	je     c0006db4 <alloc_virtual_memory+0x9a>
c0006da1:	83 ec 0c             	sub    $0xc,%esp
c0006da4:	ff 75 f0             	pushl  -0x10(%ebp)
c0006da7:	e8 c5 fc ff ff       	call   c0006a71 <get_a_page>
c0006dac:	83 c4 10             	add    $0x10,%esp
c0006daf:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006db2:	eb 06                	jmp    c0006dba <alloc_virtual_memory+0xa0>
c0006db4:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006db7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006dba:	83 ec 08             	sub    $0x8,%esp
c0006dbd:	ff 75 f4             	pushl  -0xc(%ebp)
c0006dc0:	ff 75 d8             	pushl  -0x28(%ebp)
c0006dc3:	e8 c1 fe ff ff       	call   c0006c89 <add_map_entry>
c0006dc8:	83 c4 10             	add    $0x10,%esp
c0006dcb:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0006dcf:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006dd2:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c0006dd5:	72 b1                	jb     c0006d88 <alloc_virtual_memory+0x6e>
c0006dd7:	8b 45 08             	mov    0x8(%ebp),%eax
c0006dda:	25 ff 0f 00 00       	and    $0xfff,%eax
c0006ddf:	89 c2                	mov    %eax,%edx
c0006de1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006de4:	01 d0                	add    %edx,%eax
c0006de6:	c9                   	leave  
c0006de7:	c3                   	ret    

c0006de8 <get_physical_address_proc>:
c0006de8:	55                   	push   %ebp
c0006de9:	89 e5                	mov    %esp,%ebp
c0006deb:	83 ec 18             	sub    $0x18,%esp
c0006dee:	e8 c8 a4 ff ff       	call   c00012bb <disable_int>
c0006df3:	e8 9f a5 ff ff       	call   c0001397 <get_running_thread_pcb>
c0006df8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006dfb:	83 ec 0c             	sub    $0xc,%esp
c0006dfe:	ff 75 0c             	pushl  0xc(%ebp)
c0006e01:	e8 b6 d8 ff ff       	call   c00046bc <pid2proc>
c0006e06:	83 c4 10             	add    $0x10,%esp
c0006e09:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006e0c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006e0f:	8b 40 08             	mov    0x8(%eax),%eax
c0006e12:	83 ec 0c             	sub    $0xc,%esp
c0006e15:	50                   	push   %eax
c0006e16:	e8 60 a5 ff ff       	call   c000137b <update_cr3>
c0006e1b:	83 c4 10             	add    $0x10,%esp
c0006e1e:	83 ec 0c             	sub    $0xc,%esp
c0006e21:	ff 75 08             	pushl  0x8(%ebp)
c0006e24:	e8 39 fe ff ff       	call   c0006c62 <ptr_pte>
c0006e29:	83 c4 10             	add    $0x10,%esp
c0006e2c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006e2f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006e32:	8b 00                	mov    (%eax),%eax
c0006e34:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0006e39:	89 c2                	mov    %eax,%edx
c0006e3b:	8b 45 08             	mov    0x8(%ebp),%eax
c0006e3e:	25 ff 0f 00 00       	and    $0xfff,%eax
c0006e43:	09 d0                	or     %edx,%eax
c0006e45:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006e48:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006e4b:	8b 40 08             	mov    0x8(%eax),%eax
c0006e4e:	83 ec 0c             	sub    $0xc,%esp
c0006e51:	50                   	push   %eax
c0006e52:	e8 24 a5 ff ff       	call   c000137b <update_cr3>
c0006e57:	83 c4 10             	add    $0x10,%esp
c0006e5a:	e8 5e a4 ff ff       	call   c00012bd <enable_int>
c0006e5f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006e62:	c9                   	leave  
c0006e63:	c3                   	ret    

c0006e64 <get_physical_address>:
c0006e64:	55                   	push   %ebp
c0006e65:	89 e5                	mov    %esp,%ebp
c0006e67:	83 ec 10             	sub    $0x10,%esp
c0006e6a:	ff 75 08             	pushl  0x8(%ebp)
c0006e6d:	e8 f0 fd ff ff       	call   c0006c62 <ptr_pte>
c0006e72:	83 c4 04             	add    $0x4,%esp
c0006e75:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006e78:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006e7b:	8b 00                	mov    (%eax),%eax
c0006e7d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0006e82:	89 c2                	mov    %eax,%edx
c0006e84:	8b 45 08             	mov    0x8(%ebp),%eax
c0006e87:	25 ff 0f 00 00       	and    $0xfff,%eax
c0006e8c:	09 d0                	or     %edx,%eax
c0006e8e:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006e91:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006e94:	c9                   	leave  
c0006e95:	c3                   	ret    

c0006e96 <alloc_physical_memory_of_proc>:
c0006e96:	55                   	push   %ebp
c0006e97:	89 e5                	mov    %esp,%ebp
c0006e99:	83 ec 48             	sub    $0x48,%esp
c0006e9c:	e8 1a a4 ff ff       	call   c00012bb <disable_int>
c0006ea1:	8b 45 08             	mov    0x8(%ebp),%eax
c0006ea4:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0006ea9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006eac:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0006eb3:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006eb6:	83 ec 0c             	sub    $0xc,%esp
c0006eb9:	50                   	push   %eax
c0006eba:	e8 fd d7 ff ff       	call   c00046bc <pid2proc>
c0006ebf:	83 c4 10             	add    $0x10,%esp
c0006ec2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006ec5:	e8 cd a4 ff ff       	call   c0001397 <get_running_thread_pcb>
c0006eca:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006ecd:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006ed0:	8b 40 0c             	mov    0xc(%eax),%eax
c0006ed3:	83 ec 04             	sub    $0x4,%esp
c0006ed6:	6a 0c                	push   $0xc
c0006ed8:	50                   	push   %eax
c0006ed9:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0006edc:	50                   	push   %eax
c0006edd:	e8 35 0c 00 00       	call   c0007b17 <Memcpy>
c0006ee2:	83 c4 10             	add    $0x10,%esp
c0006ee5:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0006ee8:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0006eeb:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0006eee:	89 55 c8             	mov    %edx,-0x38(%ebp)
c0006ef1:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0006ef4:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0006ef7:	29 c2                	sub    %eax,%edx
c0006ef9:	89 d0                	mov    %edx,%eax
c0006efb:	c1 e8 0c             	shr    $0xc,%eax
c0006efe:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006f01:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0006f04:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0006f07:	c1 e2 0c             	shl    $0xc,%edx
c0006f0a:	01 d0                	add    %edx,%eax
c0006f0c:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006f0f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006f12:	6a 01                	push   $0x1
c0006f14:	6a 01                	push   $0x1
c0006f16:	50                   	push   %eax
c0006f17:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0006f1a:	50                   	push   %eax
c0006f1b:	e8 0b fa ff ff       	call   c000692b <set_bits>
c0006f20:	83 c4 10             	add    $0x10,%esp
c0006f23:	83 ec 0c             	sub    $0xc,%esp
c0006f26:	ff 75 f0             	pushl  -0x10(%ebp)
c0006f29:	e8 43 fb ff ff       	call   c0006a71 <get_a_page>
c0006f2e:	83 c4 10             	add    $0x10,%esp
c0006f31:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0006f34:	8b 45 08             	mov    0x8(%ebp),%eax
c0006f37:	25 ff 0f 00 00       	and    $0xfff,%eax
c0006f3c:	89 c2                	mov    %eax,%edx
c0006f3e:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0006f41:	01 d0                	add    %edx,%eax
c0006f43:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006f46:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006f49:	8b 40 08             	mov    0x8(%eax),%eax
c0006f4c:	83 ec 0c             	sub    $0xc,%esp
c0006f4f:	50                   	push   %eax
c0006f50:	e8 26 a4 ff ff       	call   c000137b <update_cr3>
c0006f55:	83 c4 10             	add    $0x10,%esp
c0006f58:	83 ec 08             	sub    $0x8,%esp
c0006f5b:	ff 75 dc             	pushl  -0x24(%ebp)
c0006f5e:	ff 75 f4             	pushl  -0xc(%ebp)
c0006f61:	e8 23 fd ff ff       	call   c0006c89 <add_map_entry>
c0006f66:	83 c4 10             	add    $0x10,%esp
c0006f69:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006f6c:	8b 40 08             	mov    0x8(%eax),%eax
c0006f6f:	83 ec 0c             	sub    $0xc,%esp
c0006f72:	50                   	push   %eax
c0006f73:	e8 03 a4 ff ff       	call   c000137b <update_cr3>
c0006f78:	83 c4 10             	add    $0x10,%esp
c0006f7b:	e8 3d a3 ff ff       	call   c00012bd <enable_int>
c0006f80:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006f83:	c9                   	leave  
c0006f84:	c3                   	ret    

c0006f85 <alloc_physical_memory>:
c0006f85:	55                   	push   %ebp
c0006f86:	89 e5                	mov    %esp,%ebp
c0006f88:	83 ec 38             	sub    $0x38,%esp
c0006f8b:	8b 45 08             	mov    0x8(%ebp),%eax
c0006f8e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0006f93:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006f96:	e8 fc a3 ff ff       	call   c0001397 <get_running_thread_pcb>
c0006f9b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006f9e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0006fa2:	75 1a                	jne    c0006fbe <alloc_physical_memory+0x39>
c0006fa4:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c0006fa9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0006fac:	a1 98 07 01 c0       	mov    0xc0010798,%eax
c0006fb1:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006fb4:	a1 9c 07 01 c0       	mov    0xc001079c,%eax
c0006fb9:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0006fbc:	eb 18                	jmp    c0006fd6 <alloc_physical_memory+0x51>
c0006fbe:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006fc1:	8b 40 0c             	mov    0xc(%eax),%eax
c0006fc4:	83 ec 04             	sub    $0x4,%esp
c0006fc7:	6a 0c                	push   $0xc
c0006fc9:	50                   	push   %eax
c0006fca:	8d 45 d4             	lea    -0x2c(%ebp),%eax
c0006fcd:	50                   	push   %eax
c0006fce:	e8 44 0b 00 00       	call   c0007b17 <Memcpy>
c0006fd3:	83 c4 10             	add    $0x10,%esp
c0006fd6:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0006fd9:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0006fdc:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0006fdf:	89 55 d0             	mov    %edx,-0x30(%ebp)
c0006fe2:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0006fe5:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0006fe8:	29 c2                	sub    %eax,%edx
c0006fea:	89 d0                	mov    %edx,%eax
c0006fec:	c1 e8 0c             	shr    $0xc,%eax
c0006fef:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006ff2:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0006ff5:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0006ff8:	c1 e2 0c             	shl    $0xc,%edx
c0006ffb:	01 d0                	add    %edx,%eax
c0006ffd:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007000:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007003:	6a 01                	push   $0x1
c0007005:	6a 01                	push   $0x1
c0007007:	50                   	push   %eax
c0007008:	8d 45 cc             	lea    -0x34(%ebp),%eax
c000700b:	50                   	push   %eax
c000700c:	e8 1a f9 ff ff       	call   c000692b <set_bits>
c0007011:	83 c4 10             	add    $0x10,%esp
c0007014:	83 ec 0c             	sub    $0xc,%esp
c0007017:	ff 75 0c             	pushl  0xc(%ebp)
c000701a:	e8 52 fa ff ff       	call   c0006a71 <get_a_page>
c000701f:	83 c4 10             	add    $0x10,%esp
c0007022:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007025:	8b 45 08             	mov    0x8(%ebp),%eax
c0007028:	25 ff 0f 00 00       	and    $0xfff,%eax
c000702d:	89 c2                	mov    %eax,%edx
c000702f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0007032:	01 d0                	add    %edx,%eax
c0007034:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0007037:	83 ec 08             	sub    $0x8,%esp
c000703a:	ff 75 e4             	pushl  -0x1c(%ebp)
c000703d:	ff 75 f4             	pushl  -0xc(%ebp)
c0007040:	e8 44 fc ff ff       	call   c0006c89 <add_map_entry>
c0007045:	83 c4 10             	add    $0x10,%esp
c0007048:	8b 45 08             	mov    0x8(%ebp),%eax
c000704b:	c9                   	leave  
c000704c:	c3                   	ret    

c000704d <alloc_memory>:
c000704d:	55                   	push   %ebp
c000704e:	89 e5                	mov    %esp,%ebp
c0007050:	83 ec 18             	sub    $0x18,%esp
c0007053:	83 ec 08             	sub    $0x8,%esp
c0007056:	ff 75 0c             	pushl  0xc(%ebp)
c0007059:	ff 75 08             	pushl  0x8(%ebp)
c000705c:	e8 5e fb ff ff       	call   c0006bbf <get_virtual_address>
c0007061:	83 c4 10             	add    $0x10,%esp
c0007064:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0007067:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000706a:	2d 00 10 00 00       	sub    $0x1000,%eax
c000706f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007072:	eb 29                	jmp    c000709d <alloc_memory+0x50>
c0007074:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c000707b:	83 ec 0c             	sub    $0xc,%esp
c000707e:	ff 75 0c             	pushl  0xc(%ebp)
c0007081:	e8 eb f9 ff ff       	call   c0006a71 <get_a_page>
c0007086:	83 c4 10             	add    $0x10,%esp
c0007089:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000708c:	83 ec 08             	sub    $0x8,%esp
c000708f:	ff 75 ec             	pushl  -0x14(%ebp)
c0007092:	ff 75 f4             	pushl  -0xc(%ebp)
c0007095:	e8 ef fb ff ff       	call   c0006c89 <add_map_entry>
c000709a:	83 c4 10             	add    $0x10,%esp
c000709d:	8b 45 08             	mov    0x8(%ebp),%eax
c00070a0:	8d 50 ff             	lea    -0x1(%eax),%edx
c00070a3:	89 55 08             	mov    %edx,0x8(%ebp)
c00070a6:	85 c0                	test   %eax,%eax
c00070a8:	75 ca                	jne    c0007074 <alloc_memory+0x27>
c00070aa:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00070ad:	c9                   	leave  
c00070ae:	c3                   	ret    

c00070af <get_a_virtual_page>:
c00070af:	55                   	push   %ebp
c00070b0:	89 e5                	mov    %esp,%ebp
c00070b2:	83 ec 18             	sub    $0x18,%esp
c00070b5:	83 ec 0c             	sub    $0xc,%esp
c00070b8:	ff 75 08             	pushl  0x8(%ebp)
c00070bb:	e8 b1 f9 ff ff       	call   c0006a71 <get_a_page>
c00070c0:	83 c4 10             	add    $0x10,%esp
c00070c3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00070c6:	8b 45 0c             	mov    0xc(%ebp),%eax
c00070c9:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c00070ce:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00070d1:	83 ec 08             	sub    $0x8,%esp
c00070d4:	ff 75 f4             	pushl  -0xc(%ebp)
c00070d7:	ff 75 f0             	pushl  -0x10(%ebp)
c00070da:	e8 aa fb ff ff       	call   c0006c89 <add_map_entry>
c00070df:	83 c4 10             	add    $0x10,%esp
c00070e2:	8b 45 0c             	mov    0xc(%ebp),%eax
c00070e5:	c9                   	leave  
c00070e6:	c3                   	ret    

c00070e7 <block2arena>:
c00070e7:	55                   	push   %ebp
c00070e8:	89 e5                	mov    %esp,%ebp
c00070ea:	83 ec 10             	sub    $0x10,%esp
c00070ed:	8b 45 08             	mov    0x8(%ebp),%eax
c00070f0:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c00070f5:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00070f8:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00070fb:	c9                   	leave  
c00070fc:	c3                   	ret    

c00070fd <sys_malloc2>:
c00070fd:	55                   	push   %ebp
c00070fe:	89 e5                	mov    %esp,%ebp
c0007100:	83 ec 68             	sub    $0x68,%esp
c0007103:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000710a:	e8 88 a2 ff ff       	call   c0001397 <get_running_thread_pcb>
c000710f:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0007112:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0007115:	8b 40 08             	mov    0x8(%eax),%eax
c0007118:	85 c0                	test   %eax,%eax
c000711a:	75 10                	jne    c000712c <sys_malloc2+0x2f>
c000711c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0007123:	c7 45 ec a0 47 08 c0 	movl   $0xc00847a0,-0x14(%ebp)
c000712a:	eb 10                	jmp    c000713c <sys_malloc2+0x3f>
c000712c:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0007133:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0007136:	83 c0 10             	add    $0x10,%eax
c0007139:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000713c:	81 7d 08 00 04 00 00 	cmpl   $0x400,0x8(%ebp)
c0007143:	76 52                	jbe    c0007197 <sys_malloc2+0x9a>
c0007145:	8b 45 08             	mov    0x8(%ebp),%eax
c0007148:	05 0b 10 00 00       	add    $0x100b,%eax
c000714d:	c1 e8 0c             	shr    $0xc,%eax
c0007150:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0007153:	83 ec 08             	sub    $0x8,%esp
c0007156:	ff 75 f0             	pushl  -0x10(%ebp)
c0007159:	ff 75 d8             	pushl  -0x28(%ebp)
c000715c:	e8 ec fe ff ff       	call   c000704d <alloc_memory>
c0007161:	83 c4 10             	add    $0x10,%esp
c0007164:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0007167:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000716a:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000716d:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0007170:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0007176:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0007179:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c0007180:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0007183:	c6 40 08 01          	movb   $0x1,0x8(%eax)
c0007187:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000718a:	05 90 00 00 00       	add    $0x90,%eax
c000718f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007192:	e9 f0 01 00 00       	jmp    c0007387 <sys_malloc2+0x28a>
c0007197:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000719e:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00071a5:	eb 26                	jmp    c00071cd <sys_malloc2+0xd0>
c00071a7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c00071aa:	89 d0                	mov    %edx,%eax
c00071ac:	01 c0                	add    %eax,%eax
c00071ae:	01 d0                	add    %edx,%eax
c00071b0:	c1 e0 03             	shl    $0x3,%eax
c00071b3:	89 c2                	mov    %eax,%edx
c00071b5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00071b8:	01 d0                	add    %edx,%eax
c00071ba:	8b 00                	mov    (%eax),%eax
c00071bc:	39 45 08             	cmp    %eax,0x8(%ebp)
c00071bf:	77 08                	ja     c00071c9 <sys_malloc2+0xcc>
c00071c1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00071c4:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00071c7:	eb 0a                	jmp    c00071d3 <sys_malloc2+0xd6>
c00071c9:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c00071cd:	83 7d e4 09          	cmpl   $0x9,-0x1c(%ebp)
c00071d1:	7e d4                	jle    c00071a7 <sys_malloc2+0xaa>
c00071d3:	83 ec 08             	sub    $0x8,%esp
c00071d6:	ff 75 f0             	pushl  -0x10(%ebp)
c00071d9:	6a 01                	push   $0x1
c00071db:	e8 6d fe ff ff       	call   c000704d <alloc_memory>
c00071e0:	83 c4 10             	add    $0x10,%esp
c00071e3:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00071e6:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00071e9:	89 d0                	mov    %edx,%eax
c00071eb:	01 c0                	add    %eax,%eax
c00071ed:	01 d0                	add    %edx,%eax
c00071ef:	c1 e0 03             	shl    $0x3,%eax
c00071f2:	89 c2                	mov    %eax,%edx
c00071f4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00071f7:	01 d0                	add    %edx,%eax
c00071f9:	83 ec 04             	sub    $0x4,%esp
c00071fc:	6a 18                	push   $0x18
c00071fe:	50                   	push   %eax
c00071ff:	ff 75 cc             	pushl  -0x34(%ebp)
c0007202:	e8 10 09 00 00       	call   c0007b17 <Memcpy>
c0007207:	83 c4 10             	add    $0x10,%esp
c000720a:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0007211:	e8 9d 08 00 00       	call   c0007ab3 <intr_disable>
c0007216:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0007219:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000721c:	89 d0                	mov    %edx,%eax
c000721e:	01 c0                	add    %eax,%eax
c0007220:	01 d0                	add    %edx,%eax
c0007222:	c1 e0 03             	shl    $0x3,%eax
c0007225:	89 c2                	mov    %eax,%edx
c0007227:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000722a:	01 d0                	add    %edx,%eax
c000722c:	83 c0 08             	add    $0x8,%eax
c000722f:	83 ec 0c             	sub    $0xc,%esp
c0007232:	50                   	push   %eax
c0007233:	e8 fb 38 00 00       	call   c000ab33 <isListEmpty>
c0007238:	83 c4 10             	add    $0x10,%esp
c000723b:	3c 01                	cmp    $0x1,%al
c000723d:	0f 85 c1 00 00 00    	jne    c0007304 <sys_malloc2+0x207>
c0007243:	c7 45 c8 01 00 00 00 	movl   $0x1,-0x38(%ebp)
c000724a:	83 ec 08             	sub    $0x8,%esp
c000724d:	ff 75 f0             	pushl  -0x10(%ebp)
c0007250:	6a 01                	push   $0x1
c0007252:	e8 f6 fd ff ff       	call   c000704d <alloc_memory>
c0007257:	83 c4 10             	add    $0x10,%esp
c000725a:	89 45 c0             	mov    %eax,-0x40(%ebp)
c000725d:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0007260:	83 ec 0c             	sub    $0xc,%esp
c0007263:	50                   	push   %eax
c0007264:	e8 7e fe ff ff       	call   c00070e7 <block2arena>
c0007269:	83 c4 10             	add    $0x10,%esp
c000726c:	89 45 bc             	mov    %eax,-0x44(%ebp)
c000726f:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0007272:	89 d0                	mov    %edx,%eax
c0007274:	01 c0                	add    %eax,%eax
c0007276:	01 d0                	add    %edx,%eax
c0007278:	c1 e0 03             	shl    $0x3,%eax
c000727b:	89 c2                	mov    %eax,%edx
c000727d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007280:	01 d0                	add    %edx,%eax
c0007282:	8b 50 04             	mov    0x4(%eax),%edx
c0007285:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0007288:	89 50 04             	mov    %edx,0x4(%eax)
c000728b:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000728e:	8b 00                	mov    (%eax),%eax
c0007290:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0007293:	c7 45 b4 0c 00 00 00 	movl   $0xc,-0x4c(%ebp)
c000729a:	b8 00 10 00 00       	mov    $0x1000,%eax
c000729f:	2b 45 b4             	sub    -0x4c(%ebp),%eax
c00072a2:	ba 00 00 00 00       	mov    $0x0,%edx
c00072a7:	f7 75 b8             	divl   -0x48(%ebp)
c00072aa:	89 45 b0             	mov    %eax,-0x50(%ebp)
c00072ad:	8b 55 c0             	mov    -0x40(%ebp),%edx
c00072b0:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c00072b3:	01 d0                	add    %edx,%eax
c00072b5:	89 45 ac             	mov    %eax,-0x54(%ebp)
c00072b8:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c00072bf:	eb 3b                	jmp    c00072fc <sys_malloc2+0x1ff>
c00072c1:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00072c4:	0f af 45 b8          	imul   -0x48(%ebp),%eax
c00072c8:	89 c2                	mov    %eax,%edx
c00072ca:	8b 45 ac             	mov    -0x54(%ebp),%eax
c00072cd:	01 d0                	add    %edx,%eax
c00072cf:	89 45 a8             	mov    %eax,-0x58(%ebp)
c00072d2:	8b 4d a8             	mov    -0x58(%ebp),%ecx
c00072d5:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00072d8:	89 d0                	mov    %edx,%eax
c00072da:	01 c0                	add    %eax,%eax
c00072dc:	01 d0                	add    %edx,%eax
c00072de:	c1 e0 03             	shl    $0x3,%eax
c00072e1:	89 c2                	mov    %eax,%edx
c00072e3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00072e6:	01 d0                	add    %edx,%eax
c00072e8:	83 c0 08             	add    $0x8,%eax
c00072eb:	83 ec 08             	sub    $0x8,%esp
c00072ee:	51                   	push   %ecx
c00072ef:	50                   	push   %eax
c00072f0:	e8 3b 39 00 00       	call   c000ac30 <appendToDoubleLinkList>
c00072f5:	83 c4 10             	add    $0x10,%esp
c00072f8:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c00072fc:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00072ff:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c0007302:	77 bd                	ja     c00072c1 <sys_malloc2+0x1c4>
c0007304:	83 ec 0c             	sub    $0xc,%esp
c0007307:	ff 75 c4             	pushl  -0x3c(%ebp)
c000730a:	e8 cd 07 00 00       	call   c0007adc <intr_set_status>
c000730f:	83 c4 10             	add    $0x10,%esp
c0007312:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0007315:	89 d0                	mov    %edx,%eax
c0007317:	01 c0                	add    %eax,%eax
c0007319:	01 d0                	add    %edx,%eax
c000731b:	c1 e0 03             	shl    $0x3,%eax
c000731e:	89 c2                	mov    %eax,%edx
c0007320:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007323:	01 d0                	add    %edx,%eax
c0007325:	83 c0 08             	add    $0x8,%eax
c0007328:	83 ec 0c             	sub    $0xc,%esp
c000732b:	50                   	push   %eax
c000732c:	e8 69 3a 00 00       	call   c000ad9a <popFromDoubleLinkList>
c0007331:	83 c4 10             	add    $0x10,%esp
c0007334:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0007337:	8b 45 a8             	mov    -0x58(%ebp),%eax
c000733a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000733d:	83 7d a8 00          	cmpl   $0x0,-0x58(%ebp)
c0007341:	75 1c                	jne    c000735f <sys_malloc2+0x262>
c0007343:	68 ef 01 00 00       	push   $0x1ef
c0007348:	68 e0 b4 00 c0       	push   $0xc000b4e0
c000734d:	68 e0 b4 00 c0       	push   $0xc000b4e0
c0007352:	68 01 b5 00 c0       	push   $0xc000b501
c0007357:	e8 3f 23 00 00       	call   c000969b <assertion_failure>
c000735c:	83 c4 10             	add    $0x10,%esp
c000735f:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0007362:	83 ec 0c             	sub    $0xc,%esp
c0007365:	50                   	push   %eax
c0007366:	e8 7c fd ff ff       	call   c00070e7 <block2arena>
c000736b:	83 c4 10             	add    $0x10,%esp
c000736e:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0007371:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0007374:	8b 40 04             	mov    0x4(%eax),%eax
c0007377:	8d 50 ff             	lea    -0x1(%eax),%edx
c000737a:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c000737d:	89 50 04             	mov    %edx,0x4(%eax)
c0007380:	c7 45 c4 04 00 00 00 	movl   $0x4,-0x3c(%ebp)
c0007387:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000738b:	75 1c                	jne    c00073a9 <sys_malloc2+0x2ac>
c000738d:	68 f6 01 00 00       	push   $0x1f6
c0007392:	68 e0 b4 00 c0       	push   $0xc000b4e0
c0007397:	68 e0 b4 00 c0       	push   $0xc000b4e0
c000739c:	68 13 b5 00 c0       	push   $0xc000b513
c00073a1:	e8 f5 22 00 00       	call   c000969b <assertion_failure>
c00073a6:	83 c4 10             	add    $0x10,%esp
c00073a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00073ac:	c9                   	leave  
c00073ad:	c3                   	ret    

c00073ae <remove_map_entry>:
c00073ae:	55                   	push   %ebp
c00073af:	89 e5                	mov    %esp,%ebp
c00073b1:	83 ec 10             	sub    $0x10,%esp
c00073b4:	ff 75 08             	pushl  0x8(%ebp)
c00073b7:	e8 a6 f8 ff ff       	call   c0006c62 <ptr_pte>
c00073bc:	83 c4 04             	add    $0x4,%esp
c00073bf:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00073c2:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00073c5:	8b 10                	mov    (%eax),%edx
c00073c7:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00073ca:	89 10                	mov    %edx,(%eax)
c00073cc:	90                   	nop
c00073cd:	c9                   	leave  
c00073ce:	c3                   	ret    

c00073cf <free_a_page>:
c00073cf:	55                   	push   %ebp
c00073d0:	89 e5                	mov    %esp,%ebp
c00073d2:	83 ec 20             	sub    $0x20,%esp
c00073d5:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00073d9:	75 21                	jne    c00073fc <free_a_page+0x2d>
c00073db:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c00073e0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00073e3:	a1 98 07 01 c0       	mov    0xc0010798,%eax
c00073e8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00073eb:	a1 9c 07 01 c0       	mov    0xc001079c,%eax
c00073f0:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00073f3:	c7 45 fc ac 16 01 c0 	movl   $0xc00116ac,-0x4(%ebp)
c00073fa:	eb 1f                	jmp    c000741b <free_a_page+0x4c>
c00073fc:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c0007401:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007404:	a1 98 07 01 c0       	mov    0xc0010798,%eax
c0007409:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000740c:	a1 9c 07 01 c0       	mov    0xc001079c,%eax
c0007411:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007414:	c7 45 fc f4 1e 01 c0 	movl   $0xc0011ef4,-0x4(%ebp)
c000741b:	8b 45 08             	mov    0x8(%ebp),%eax
c000741e:	c1 e8 0c             	shr    $0xc,%eax
c0007421:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0007424:	6a 00                	push   $0x0
c0007426:	ff 75 f8             	pushl  -0x8(%ebp)
c0007429:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c000742c:	50                   	push   %eax
c000742d:	e8 7e f4 ff ff       	call   c00068b0 <set_bit_val>
c0007432:	83 c4 0c             	add    $0xc,%esp
c0007435:	ff 75 08             	pushl  0x8(%ebp)
c0007438:	e8 27 fa ff ff       	call   c0006e64 <get_physical_address>
c000743d:	83 c4 04             	add    $0x4,%esp
c0007440:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007443:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007446:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c000744c:	85 c0                	test   %eax,%eax
c000744e:	0f 48 c2             	cmovs  %edx,%eax
c0007451:	c1 f8 0c             	sar    $0xc,%eax
c0007454:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0007457:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000745a:	6a 00                	push   $0x0
c000745c:	ff 75 f0             	pushl  -0x10(%ebp)
c000745f:	50                   	push   %eax
c0007460:	e8 4b f4 ff ff       	call   c00068b0 <set_bit_val>
c0007465:	83 c4 0c             	add    $0xc,%esp
c0007468:	ff 75 08             	pushl  0x8(%ebp)
c000746b:	e8 3e ff ff ff       	call   c00073ae <remove_map_entry>
c0007470:	83 c4 04             	add    $0x4,%esp
c0007473:	90                   	nop
c0007474:	c9                   	leave  
c0007475:	c3                   	ret    

c0007476 <sys_free2>:
c0007476:	55                   	push   %ebp
c0007477:	89 e5                	mov    %esp,%ebp
c0007479:	83 ec 58             	sub    $0x58,%esp
c000747c:	e8 16 9f ff ff       	call   c0001397 <get_running_thread_pcb>
c0007481:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0007484:	e8 2a 06 00 00       	call   c0007ab3 <intr_disable>
c0007489:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000748c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000748f:	8b 40 08             	mov    0x8(%eax),%eax
c0007492:	85 c0                	test   %eax,%eax
c0007494:	75 10                	jne    c00074a6 <sys_free2+0x30>
c0007496:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000749d:	c7 45 f0 a0 47 08 c0 	movl   $0xc00847a0,-0x10(%ebp)
c00074a4:	eb 10                	jmp    c00074b6 <sys_free2+0x40>
c00074a6:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c00074ad:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00074b0:	83 c0 10             	add    $0x10,%eax
c00074b3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00074b6:	81 7d 0c 00 04 00 00 	cmpl   $0x400,0xc(%ebp)
c00074bd:	76 4d                	jbe    c000750c <sys_free2+0x96>
c00074bf:	8b 45 08             	mov    0x8(%ebp),%eax
c00074c2:	83 e8 0c             	sub    $0xc,%eax
c00074c5:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00074c8:	83 45 0c 0c          	addl   $0xc,0xc(%ebp)
c00074cc:	8b 45 0c             	mov    0xc(%ebp),%eax
c00074cf:	05 ff 0f 00 00       	add    $0xfff,%eax
c00074d4:	c1 e8 0c             	shr    $0xc,%eax
c00074d7:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00074da:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00074e1:	eb 1c                	jmp    c00074ff <sys_free2+0x89>
c00074e3:	83 ec 08             	sub    $0x8,%esp
c00074e6:	ff 75 f4             	pushl  -0xc(%ebp)
c00074e9:	ff 75 ec             	pushl  -0x14(%ebp)
c00074ec:	e8 de fe ff ff       	call   c00073cf <free_a_page>
c00074f1:	83 c4 10             	add    $0x10,%esp
c00074f4:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
c00074fb:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c00074ff:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007502:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
c0007505:	77 dc                	ja     c00074e3 <sys_free2+0x6d>
c0007507:	e9 dc 00 00 00       	jmp    c00075e8 <sys_free2+0x172>
c000750c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0007513:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c000751a:	eb 26                	jmp    c0007542 <sys_free2+0xcc>
c000751c:	8b 55 e0             	mov    -0x20(%ebp),%edx
c000751f:	89 d0                	mov    %edx,%eax
c0007521:	01 c0                	add    %eax,%eax
c0007523:	01 d0                	add    %edx,%eax
c0007525:	c1 e0 03             	shl    $0x3,%eax
c0007528:	89 c2                	mov    %eax,%edx
c000752a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000752d:	01 d0                	add    %edx,%eax
c000752f:	8b 00                	mov    (%eax),%eax
c0007531:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0007534:	77 08                	ja     c000753e <sys_free2+0xc8>
c0007536:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0007539:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000753c:	eb 0a                	jmp    c0007548 <sys_free2+0xd2>
c000753e:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0007542:	83 7d e0 09          	cmpl   $0x9,-0x20(%ebp)
c0007546:	7e d4                	jle    c000751c <sys_free2+0xa6>
c0007548:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c000754b:	89 d0                	mov    %edx,%eax
c000754d:	01 c0                	add    %eax,%eax
c000754f:	01 d0                	add    %edx,%eax
c0007551:	c1 e0 03             	shl    $0x3,%eax
c0007554:	89 c2                	mov    %eax,%edx
c0007556:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007559:	01 d0                	add    %edx,%eax
c000755b:	8b 10                	mov    (%eax),%edx
c000755d:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c0007560:	8b 50 04             	mov    0x4(%eax),%edx
c0007563:	89 55 b8             	mov    %edx,-0x48(%ebp)
c0007566:	8b 50 08             	mov    0x8(%eax),%edx
c0007569:	89 55 bc             	mov    %edx,-0x44(%ebp)
c000756c:	8b 50 0c             	mov    0xc(%eax),%edx
c000756f:	89 55 c0             	mov    %edx,-0x40(%ebp)
c0007572:	8b 50 10             	mov    0x10(%eax),%edx
c0007575:	89 55 c4             	mov    %edx,-0x3c(%ebp)
c0007578:	8b 40 14             	mov    0x14(%eax),%eax
c000757b:	89 45 c8             	mov    %eax,-0x38(%ebp)
c000757e:	8b 45 08             	mov    0x8(%ebp),%eax
c0007581:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0007584:	83 ec 0c             	sub    $0xc,%esp
c0007587:	ff 75 d0             	pushl  -0x30(%ebp)
c000758a:	e8 58 fb ff ff       	call   c00070e7 <block2arena>
c000758f:	83 c4 10             	add    $0x10,%esp
c0007592:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0007595:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0007598:	89 d0                	mov    %edx,%eax
c000759a:	01 c0                	add    %eax,%eax
c000759c:	01 d0                	add    %edx,%eax
c000759e:	c1 e0 03             	shl    $0x3,%eax
c00075a1:	89 c2                	mov    %eax,%edx
c00075a3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00075a6:	01 d0                	add    %edx,%eax
c00075a8:	83 c0 08             	add    $0x8,%eax
c00075ab:	83 ec 08             	sub    $0x8,%esp
c00075ae:	ff 75 d0             	pushl  -0x30(%ebp)
c00075b1:	50                   	push   %eax
c00075b2:	e8 79 36 00 00       	call   c000ac30 <appendToDoubleLinkList>
c00075b7:	83 c4 10             	add    $0x10,%esp
c00075ba:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00075bd:	8b 40 04             	mov    0x4(%eax),%eax
c00075c0:	8d 50 01             	lea    0x1(%eax),%edx
c00075c3:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00075c6:	89 50 04             	mov    %edx,0x4(%eax)
c00075c9:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00075cc:	8b 50 04             	mov    0x4(%eax),%edx
c00075cf:	8b 45 b8             	mov    -0x48(%ebp),%eax
c00075d2:	39 c2                	cmp    %eax,%edx
c00075d4:	75 12                	jne    c00075e8 <sys_free2+0x172>
c00075d6:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00075d9:	83 ec 08             	sub    $0x8,%esp
c00075dc:	ff 75 f4             	pushl  -0xc(%ebp)
c00075df:	50                   	push   %eax
c00075e0:	e8 ea fd ff ff       	call   c00073cf <free_a_page>
c00075e5:	83 c4 10             	add    $0x10,%esp
c00075e8:	83 ec 0c             	sub    $0xc,%esp
c00075eb:	ff 75 d8             	pushl  -0x28(%ebp)
c00075ee:	e8 e9 04 00 00       	call   c0007adc <intr_set_status>
c00075f3:	83 c4 10             	add    $0x10,%esp
c00075f6:	90                   	nop
c00075f7:	c9                   	leave  
c00075f8:	c3                   	ret    

c00075f9 <init_memory_block_desc>:
c00075f9:	55                   	push   %ebp
c00075fa:	89 e5                	mov    %esp,%ebp
c00075fc:	83 ec 18             	sub    $0x18,%esp
c00075ff:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007606:	e9 b2 00 00 00       	jmp    c00076bd <init_memory_block_desc+0xc4>
c000760b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000760f:	75 1b                	jne    c000762c <init_memory_block_desc+0x33>
c0007611:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007614:	89 d0                	mov    %edx,%eax
c0007616:	01 c0                	add    %eax,%eax
c0007618:	01 d0                	add    %edx,%eax
c000761a:	c1 e0 03             	shl    $0x3,%eax
c000761d:	89 c2                	mov    %eax,%edx
c000761f:	8b 45 08             	mov    0x8(%ebp),%eax
c0007622:	01 d0                	add    %edx,%eax
c0007624:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c000762a:	eb 2e                	jmp    c000765a <init_memory_block_desc+0x61>
c000762c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000762f:	89 d0                	mov    %edx,%eax
c0007631:	01 c0                	add    %eax,%eax
c0007633:	01 d0                	add    %edx,%eax
c0007635:	c1 e0 03             	shl    $0x3,%eax
c0007638:	8d 50 e8             	lea    -0x18(%eax),%edx
c000763b:	8b 45 08             	mov    0x8(%ebp),%eax
c000763e:	01 d0                	add    %edx,%eax
c0007640:	8b 08                	mov    (%eax),%ecx
c0007642:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007645:	89 d0                	mov    %edx,%eax
c0007647:	01 c0                	add    %eax,%eax
c0007649:	01 d0                	add    %edx,%eax
c000764b:	c1 e0 03             	shl    $0x3,%eax
c000764e:	89 c2                	mov    %eax,%edx
c0007650:	8b 45 08             	mov    0x8(%ebp),%eax
c0007653:	01 d0                	add    %edx,%eax
c0007655:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
c0007658:	89 10                	mov    %edx,(%eax)
c000765a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000765d:	89 d0                	mov    %edx,%eax
c000765f:	01 c0                	add    %eax,%eax
c0007661:	01 d0                	add    %edx,%eax
c0007663:	c1 e0 03             	shl    $0x3,%eax
c0007666:	89 c2                	mov    %eax,%edx
c0007668:	8b 45 08             	mov    0x8(%ebp),%eax
c000766b:	01 d0                	add    %edx,%eax
c000766d:	8b 00                	mov    (%eax),%eax
c000766f:	89 c1                	mov    %eax,%ecx
c0007671:	b8 f4 0f 00 00       	mov    $0xff4,%eax
c0007676:	ba 00 00 00 00       	mov    $0x0,%edx
c000767b:	f7 f1                	div    %ecx
c000767d:	89 c1                	mov    %eax,%ecx
c000767f:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007682:	89 d0                	mov    %edx,%eax
c0007684:	01 c0                	add    %eax,%eax
c0007686:	01 d0                	add    %edx,%eax
c0007688:	c1 e0 03             	shl    $0x3,%eax
c000768b:	89 c2                	mov    %eax,%edx
c000768d:	8b 45 08             	mov    0x8(%ebp),%eax
c0007690:	01 d0                	add    %edx,%eax
c0007692:	89 ca                	mov    %ecx,%edx
c0007694:	89 50 04             	mov    %edx,0x4(%eax)
c0007697:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000769a:	89 d0                	mov    %edx,%eax
c000769c:	01 c0                	add    %eax,%eax
c000769e:	01 d0                	add    %edx,%eax
c00076a0:	c1 e0 03             	shl    $0x3,%eax
c00076a3:	89 c2                	mov    %eax,%edx
c00076a5:	8b 45 08             	mov    0x8(%ebp),%eax
c00076a8:	01 d0                	add    %edx,%eax
c00076aa:	83 c0 08             	add    $0x8,%eax
c00076ad:	83 ec 0c             	sub    $0xc,%esp
c00076b0:	50                   	push   %eax
c00076b1:	e8 4f 34 00 00       	call   c000ab05 <initDoubleLinkList>
c00076b6:	83 c4 10             	add    $0x10,%esp
c00076b9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00076bd:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c00076c1:	0f 8e 44 ff ff ff    	jle    c000760b <init_memory_block_desc+0x12>
c00076c7:	90                   	nop
c00076c8:	c9                   	leave  
c00076c9:	c3                   	ret    

c00076ca <init_memory2>:
c00076ca:	55                   	push   %ebp
c00076cb:	89 e5                	mov    %esp,%ebp
c00076cd:	83 ec 38             	sub    $0x38,%esp
c00076d0:	c7 45 f4 00 00 00 02 	movl   $0x2000000,-0xc(%ebp)
c00076d7:	c7 45 f0 00 20 10 00 	movl   $0x102000,-0x10(%ebp)
c00076de:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00076e1:	a3 b4 16 01 c0       	mov    %eax,0xc00116b4
c00076e6:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00076e9:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c00076ee:	29 c2                	sub    %eax,%edx
c00076f0:	89 d0                	mov    %edx,%eax
c00076f2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00076f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00076f8:	89 c2                	mov    %eax,%edx
c00076fa:	c1 ea 1f             	shr    $0x1f,%edx
c00076fd:	01 d0                	add    %edx,%eax
c00076ff:	d1 f8                	sar    %eax
c0007701:	a3 b8 16 01 c0       	mov    %eax,0xc00116b8
c0007706:	a1 b8 16 01 c0       	mov    0xc00116b8,%eax
c000770b:	83 ec 0c             	sub    $0xc,%esp
c000770e:	50                   	push   %eax
c000770f:	e8 ec 07 00 00       	call   c0007f00 <disp_int>
c0007714:	83 c4 10             	add    $0x10,%esp
c0007717:	a1 b8 16 01 c0       	mov    0xc00116b8,%eax
c000771c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000771f:	29 c2                	sub    %eax,%edx
c0007721:	89 d0                	mov    %edx,%eax
c0007723:	a3 00 1f 01 c0       	mov    %eax,0xc0011f00
c0007728:	83 ec 0c             	sub    $0xc,%esp
c000772b:	68 1f b5 00 c0       	push   $0xc000b51f
c0007730:	e8 57 99 ff ff       	call   c000108c <disp_str>
c0007735:	83 c4 10             	add    $0x10,%esp
c0007738:	a1 00 1f 01 c0       	mov    0xc0011f00,%eax
c000773d:	83 ec 0c             	sub    $0xc,%esp
c0007740:	50                   	push   %eax
c0007741:	e8 ba 07 00 00       	call   c0007f00 <disp_int>
c0007746:	83 c4 10             	add    $0x10,%esp
c0007749:	83 ec 0c             	sub    $0xc,%esp
c000774c:	68 1f b5 00 c0       	push   $0xc000b51f
c0007751:	e8 36 99 ff ff       	call   c000108c <disp_str>
c0007756:	83 c4 10             	add    $0x10,%esp
c0007759:	a1 b8 16 01 c0       	mov    0xc00116b8,%eax
c000775e:	05 ff 0f 00 00       	add    $0xfff,%eax
c0007763:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007769:	85 c0                	test   %eax,%eax
c000776b:	0f 48 c2             	cmovs  %edx,%eax
c000776e:	c1 f8 0c             	sar    $0xc,%eax
c0007771:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007774:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007777:	83 c0 07             	add    $0x7,%eax
c000777a:	8d 50 07             	lea    0x7(%eax),%edx
c000777d:	85 c0                	test   %eax,%eax
c000777f:	0f 48 c2             	cmovs  %edx,%eax
c0007782:	c1 f8 03             	sar    $0x3,%eax
c0007785:	a3 b0 16 01 c0       	mov    %eax,0xc00116b0
c000778a:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c000778f:	2d 00 00 00 40       	sub    $0x40000000,%eax
c0007794:	a3 ac 16 01 c0       	mov    %eax,0xc00116ac
c0007799:	8b 15 b0 16 01 c0    	mov    0xc00116b0,%edx
c000779f:	a1 ac 16 01 c0       	mov    0xc00116ac,%eax
c00077a4:	83 ec 04             	sub    $0x4,%esp
c00077a7:	52                   	push   %edx
c00077a8:	6a 00                	push   $0x0
c00077aa:	50                   	push   %eax
c00077ab:	e8 8f 46 00 00       	call   c000be3f <Memset>
c00077b0:	83 c4 10             	add    $0x10,%esp
c00077b3:	a1 b0 16 01 c0       	mov    0xc00116b0,%eax
c00077b8:	05 ff 0f 00 00       	add    $0xfff,%eax
c00077bd:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c00077c3:	85 c0                	test   %eax,%eax
c00077c5:	0f 48 c2             	cmovs  %edx,%eax
c00077c8:	c1 f8 0c             	sar    $0xc,%eax
c00077cb:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00077ce:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00077d1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00077d4:	ff 75 e8             	pushl  -0x18(%ebp)
c00077d7:	6a 01                	push   $0x1
c00077d9:	6a 00                	push   $0x0
c00077db:	68 ac 16 01 c0       	push   $0xc00116ac
c00077e0:	e8 46 f1 ff ff       	call   c000692b <set_bits>
c00077e5:	83 c4 10             	add    $0x10,%esp
c00077e8:	a1 00 1f 01 c0       	mov    0xc0011f00,%eax
c00077ed:	05 ff 0f 00 00       	add    $0xfff,%eax
c00077f2:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c00077f8:	85 c0                	test   %eax,%eax
c00077fa:	0f 48 c2             	cmovs  %edx,%eax
c00077fd:	c1 f8 0c             	sar    $0xc,%eax
c0007800:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007803:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007806:	83 c0 07             	add    $0x7,%eax
c0007809:	8d 50 07             	lea    0x7(%eax),%edx
c000780c:	85 c0                	test   %eax,%eax
c000780e:	0f 48 c2             	cmovs  %edx,%eax
c0007811:	c1 f8 03             	sar    $0x3,%eax
c0007814:	a3 f8 1e 01 c0       	mov    %eax,0xc0011ef8
c0007819:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c000781e:	8b 15 b0 16 01 c0    	mov    0xc00116b0,%edx
c0007824:	01 d0                	add    %edx,%eax
c0007826:	a3 f4 1e 01 c0       	mov    %eax,0xc0011ef4
c000782b:	8b 15 f8 1e 01 c0    	mov    0xc0011ef8,%edx
c0007831:	a1 f4 1e 01 c0       	mov    0xc0011ef4,%eax
c0007836:	83 ec 04             	sub    $0x4,%esp
c0007839:	52                   	push   %edx
c000783a:	6a 00                	push   $0x0
c000783c:	50                   	push   %eax
c000783d:	e8 fd 45 00 00       	call   c000be3f <Memset>
c0007842:	83 c4 10             	add    $0x10,%esp
c0007845:	a1 f8 1e 01 c0       	mov    0xc0011ef8,%eax
c000784a:	05 ff 0f 00 00       	add    $0xfff,%eax
c000784f:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007855:	85 c0                	test   %eax,%eax
c0007857:	0f 48 c2             	cmovs  %edx,%eax
c000785a:	c1 f8 0c             	sar    $0xc,%eax
c000785d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007860:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0007863:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0007866:	ff 75 e8             	pushl  -0x18(%ebp)
c0007869:	6a 01                	push   $0x1
c000786b:	ff 75 e0             	pushl  -0x20(%ebp)
c000786e:	68 ac 16 01 c0       	push   $0xc00116ac
c0007873:	e8 b3 f0 ff ff       	call   c000692b <set_bits>
c0007878:	83 c4 10             	add    $0x10,%esp
c000787b:	c7 45 dc 00 00 10 00 	movl   $0x100000,-0x24(%ebp)
c0007882:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0007885:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007888:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000788b:	83 c0 07             	add    $0x7,%eax
c000788e:	8d 50 07             	lea    0x7(%eax),%edx
c0007891:	85 c0                	test   %eax,%eax
c0007893:	0f 48 c2             	cmovs  %edx,%eax
c0007896:	c1 f8 03             	sar    $0x3,%eax
c0007899:	a3 98 07 01 c0       	mov    %eax,0xc0010798
c000789e:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c00078a3:	8b 15 b0 16 01 c0    	mov    0xc00116b0,%edx
c00078a9:	01 c2                	add    %eax,%edx
c00078ab:	a1 f8 1e 01 c0       	mov    0xc0011ef8,%eax
c00078b0:	01 d0                	add    %edx,%eax
c00078b2:	a3 94 07 01 c0       	mov    %eax,0xc0010794
c00078b7:	8b 15 98 07 01 c0    	mov    0xc0010798,%edx
c00078bd:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c00078c2:	83 ec 04             	sub    $0x4,%esp
c00078c5:	52                   	push   %edx
c00078c6:	6a 00                	push   $0x0
c00078c8:	50                   	push   %eax
c00078c9:	e8 71 45 00 00       	call   c000be3f <Memset>
c00078ce:	83 c4 10             	add    $0x10,%esp
c00078d1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c00078d4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00078d7:	01 d0                	add    %edx,%eax
c00078d9:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00078dc:	a1 98 07 01 c0       	mov    0xc0010798,%eax
c00078e1:	05 ff 0f 00 00       	add    $0xfff,%eax
c00078e6:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c00078ec:	85 c0                	test   %eax,%eax
c00078ee:	0f 48 c2             	cmovs  %edx,%eax
c00078f1:	c1 f8 0c             	sar    $0xc,%eax
c00078f4:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00078f7:	ff 75 e8             	pushl  -0x18(%ebp)
c00078fa:	6a 01                	push   $0x1
c00078fc:	ff 75 e0             	pushl  -0x20(%ebp)
c00078ff:	68 ac 16 01 c0       	push   $0xc00116ac
c0007904:	e8 22 f0 ff ff       	call   c000692b <set_bits>
c0007909:	83 c4 10             	add    $0x10,%esp
c000790c:	8b 55 e0             	mov    -0x20(%ebp),%edx
c000790f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007912:	01 d0                	add    %edx,%eax
c0007914:	c1 e0 0c             	shl    $0xc,%eax
c0007917:	a3 9c 07 01 c0       	mov    %eax,0xc001079c
c000791c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000791f:	83 c0 02             	add    $0x2,%eax
c0007922:	c1 e0 0c             	shl    $0xc,%eax
c0007925:	89 c2                	mov    %eax,%edx
c0007927:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000792a:	01 d0                	add    %edx,%eax
c000792c:	a3 9c 07 01 c0       	mov    %eax,0xc001079c
c0007931:	c7 45 d8 05 00 00 00 	movl   $0x5,-0x28(%ebp)
c0007938:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000793b:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000793e:	90                   	nop
c000793f:	c9                   	leave  
c0007940:	c3                   	ret    

c0007941 <init_memory>:
c0007941:	55                   	push   %ebp
c0007942:	89 e5                	mov    %esp,%ebp
c0007944:	83 ec 38             	sub    $0x38,%esp
c0007947:	c7 45 f4 00 a0 09 c0 	movl   $0xc009a000,-0xc(%ebp)
c000794e:	c7 45 f0 00 00 10 c0 	movl   $0xc0100000,-0x10(%ebp)
c0007955:	c7 45 ec 00 00 10 00 	movl   $0x100000,-0x14(%ebp)
c000795c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000795f:	05 00 00 10 00       	add    $0x100000,%eax
c0007964:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007967:	8b 45 08             	mov    0x8(%ebp),%eax
c000796a:	2b 45 e8             	sub    -0x18(%ebp),%eax
c000796d:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007973:	85 c0                	test   %eax,%eax
c0007975:	0f 48 c2             	cmovs  %edx,%eax
c0007978:	c1 f8 0c             	sar    $0xc,%eax
c000797b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000797e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0007981:	89 c2                	mov    %eax,%edx
c0007983:	c1 ea 1f             	shr    $0x1f,%edx
c0007986:	01 d0                	add    %edx,%eax
c0007988:	d1 f8                	sar    %eax
c000798a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000798d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0007990:	2b 45 e0             	sub    -0x20(%ebp),%eax
c0007993:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0007996:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0007999:	8d 50 07             	lea    0x7(%eax),%edx
c000799c:	85 c0                	test   %eax,%eax
c000799e:	0f 48 c2             	cmovs  %edx,%eax
c00079a1:	c1 f8 03             	sar    $0x3,%eax
c00079a4:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00079a7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00079aa:	8d 50 07             	lea    0x7(%eax),%edx
c00079ad:	85 c0                	test   %eax,%eax
c00079af:	0f 48 c2             	cmovs  %edx,%eax
c00079b2:	c1 f8 03             	sar    $0x3,%eax
c00079b5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00079b8:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00079bb:	a3 b4 16 01 c0       	mov    %eax,0xc00116b4
c00079c0:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c00079c5:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00079c8:	c1 e2 0c             	shl    $0xc,%edx
c00079cb:	01 d0                	add    %edx,%eax
c00079cd:	a3 fc 1e 01 c0       	mov    %eax,0xc0011efc
c00079d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00079d5:	a3 ac 16 01 c0       	mov    %eax,0xc00116ac
c00079da:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00079dd:	a3 b0 16 01 c0       	mov    %eax,0xc00116b0
c00079e2:	a1 ac 16 01 c0       	mov    0xc00116ac,%eax
c00079e7:	83 ec 04             	sub    $0x4,%esp
c00079ea:	ff 75 d8             	pushl  -0x28(%ebp)
c00079ed:	6a 00                	push   $0x0
c00079ef:	50                   	push   %eax
c00079f0:	e8 4a 44 00 00       	call   c000be3f <Memset>
c00079f5:	83 c4 10             	add    $0x10,%esp
c00079f8:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00079fb:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00079fe:	01 d0                	add    %edx,%eax
c0007a00:	a3 f4 1e 01 c0       	mov    %eax,0xc0011ef4
c0007a05:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007a08:	a3 f8 1e 01 c0       	mov    %eax,0xc0011ef8
c0007a0d:	a1 f4 1e 01 c0       	mov    0xc0011ef4,%eax
c0007a12:	83 ec 04             	sub    $0x4,%esp
c0007a15:	ff 75 d4             	pushl  -0x2c(%ebp)
c0007a18:	6a 00                	push   $0x0
c0007a1a:	50                   	push   %eax
c0007a1b:	e8 1f 44 00 00       	call   c000be3f <Memset>
c0007a20:	83 c4 10             	add    $0x10,%esp
c0007a23:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007a26:	a3 98 07 01 c0       	mov    %eax,0xc0010798
c0007a2b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007a2e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007a31:	01 c2                	add    %eax,%edx
c0007a33:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007a36:	01 d0                	add    %edx,%eax
c0007a38:	a3 94 07 01 c0       	mov    %eax,0xc0010794
c0007a3d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007a40:	05 00 00 10 00       	add    $0x100000,%eax
c0007a45:	a3 9c 07 01 c0       	mov    %eax,0xc001079c
c0007a4a:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c0007a4f:	83 ec 04             	sub    $0x4,%esp
c0007a52:	ff 75 d8             	pushl  -0x28(%ebp)
c0007a55:	6a 00                	push   $0x0
c0007a57:	50                   	push   %eax
c0007a58:	e8 e2 43 00 00       	call   c000be3f <Memset>
c0007a5d:	83 c4 10             	add    $0x10,%esp
c0007a60:	83 ec 04             	sub    $0x4,%esp
c0007a63:	68 f0 00 00 00       	push   $0xf0
c0007a68:	6a 00                	push   $0x0
c0007a6a:	68 a0 47 08 c0       	push   $0xc00847a0
c0007a6f:	e8 cb 43 00 00       	call   c000be3f <Memset>
c0007a74:	83 c4 10             	add    $0x10,%esp
c0007a77:	83 ec 0c             	sub    $0xc,%esp
c0007a7a:	68 a0 47 08 c0       	push   $0xc00847a0
c0007a7f:	e8 75 fb ff ff       	call   c00075f9 <init_memory_block_desc>
c0007a84:	83 c4 10             	add    $0x10,%esp
c0007a87:	90                   	nop
c0007a88:	c9                   	leave  
c0007a89:	c3                   	ret    

c0007a8a <intr_enable>:
c0007a8a:	55                   	push   %ebp
c0007a8b:	89 e5                	mov    %esp,%ebp
c0007a8d:	83 ec 18             	sub    $0x18,%esp
c0007a90:	e8 65 00 00 00       	call   c0007afa <intr_get_status>
c0007a95:	83 f8 01             	cmp    $0x1,%eax
c0007a98:	75 0c                	jne    c0007aa6 <intr_enable+0x1c>
c0007a9a:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0007aa1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007aa4:	eb 0b                	jmp    c0007ab1 <intr_enable+0x27>
c0007aa6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007aad:	fb                   	sti    
c0007aae:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007ab1:	c9                   	leave  
c0007ab2:	c3                   	ret    

c0007ab3 <intr_disable>:
c0007ab3:	55                   	push   %ebp
c0007ab4:	89 e5                	mov    %esp,%ebp
c0007ab6:	83 ec 18             	sub    $0x18,%esp
c0007ab9:	e8 3c 00 00 00       	call   c0007afa <intr_get_status>
c0007abe:	83 f8 01             	cmp    $0x1,%eax
c0007ac1:	75 0d                	jne    c0007ad0 <intr_disable+0x1d>
c0007ac3:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0007aca:	fa                   	cli    
c0007acb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007ace:	eb 0a                	jmp    c0007ada <intr_disable+0x27>
c0007ad0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007ad7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007ada:	c9                   	leave  
c0007adb:	c3                   	ret    

c0007adc <intr_set_status>:
c0007adc:	55                   	push   %ebp
c0007add:	89 e5                	mov    %esp,%ebp
c0007adf:	83 ec 08             	sub    $0x8,%esp
c0007ae2:	8b 45 08             	mov    0x8(%ebp),%eax
c0007ae5:	83 e0 01             	and    $0x1,%eax
c0007ae8:	85 c0                	test   %eax,%eax
c0007aea:	74 07                	je     c0007af3 <intr_set_status+0x17>
c0007aec:	e8 99 ff ff ff       	call   c0007a8a <intr_enable>
c0007af1:	eb 05                	jmp    c0007af8 <intr_set_status+0x1c>
c0007af3:	e8 bb ff ff ff       	call   c0007ab3 <intr_disable>
c0007af8:	c9                   	leave  
c0007af9:	c3                   	ret    

c0007afa <intr_get_status>:
c0007afa:	55                   	push   %ebp
c0007afb:	89 e5                	mov    %esp,%ebp
c0007afd:	83 ec 10             	sub    $0x10,%esp
c0007b00:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0007b07:	9c                   	pushf  
c0007b08:	58                   	pop    %eax
c0007b09:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0007b0c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007b0f:	c1 e8 09             	shr    $0x9,%eax
c0007b12:	83 e0 01             	and    $0x1,%eax
c0007b15:	c9                   	leave  
c0007b16:	c3                   	ret    

c0007b17 <Memcpy>:
c0007b17:	55                   	push   %ebp
c0007b18:	89 e5                	mov    %esp,%ebp
c0007b1a:	83 ec 18             	sub    $0x18,%esp
c0007b1d:	e8 91 ff ff ff       	call   c0007ab3 <intr_disable>
c0007b22:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007b25:	83 ec 04             	sub    $0x4,%esp
c0007b28:	ff 75 10             	pushl  0x10(%ebp)
c0007b2b:	ff 75 0c             	pushl  0xc(%ebp)
c0007b2e:	ff 75 08             	pushl  0x8(%ebp)
c0007b31:	e8 db 42 00 00       	call   c000be11 <Memcpy2>
c0007b36:	83 c4 10             	add    $0x10,%esp
c0007b39:	83 ec 0c             	sub    $0xc,%esp
c0007b3c:	ff 75 f4             	pushl  -0xc(%ebp)
c0007b3f:	e8 98 ff ff ff       	call   c0007adc <intr_set_status>
c0007b44:	83 c4 10             	add    $0x10,%esp
c0007b47:	90                   	nop
c0007b48:	c9                   	leave  
c0007b49:	c3                   	ret    

c0007b4a <untar>:
c0007b4a:	55                   	push   %ebp
c0007b4b:	89 e5                	mov    %esp,%ebp
c0007b4d:	81 ec 48 0a 00 00    	sub    $0xa48,%esp
c0007b53:	83 ec 08             	sub    $0x8,%esp
c0007b56:	6a 00                	push   $0x0
c0007b58:	ff 75 08             	pushl  0x8(%ebp)
c0007b5b:	e8 5e de ff ff       	call   c00059be <open>
c0007b60:	83 c4 10             	add    $0x10,%esp
c0007b63:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007b66:	83 ec 0c             	sub    $0xc,%esp
c0007b69:	68 40 b5 00 c0       	push   $0xc000b540
c0007b6e:	e8 cb 17 00 00       	call   c000933e <Printf>
c0007b73:	83 c4 10             	add    $0x10,%esp
c0007b76:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0007b7d:	c7 45 dc 00 02 00 00 	movl   $0x200,-0x24(%ebp)
c0007b84:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007b8b:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0007b92:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0007b99:	e9 5e 02 00 00       	jmp    c0007dfc <untar+0x2b2>
c0007b9e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0007ba2:	7e 58                	jle    c0007bfc <untar+0xb2>
c0007ba4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007ba7:	05 ff 01 00 00       	add    $0x1ff,%eax
c0007bac:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0007bb2:	85 c0                	test   %eax,%eax
c0007bb4:	0f 48 c2             	cmovs  %edx,%eax
c0007bb7:	c1 f8 09             	sar    $0x9,%eax
c0007bba:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0007bbd:	83 ec 04             	sub    $0x4,%esp
c0007bc0:	68 00 02 00 00       	push   $0x200
c0007bc5:	6a 00                	push   $0x0
c0007bc7:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0007bcd:	50                   	push   %eax
c0007bce:	e8 6c 42 00 00       	call   c000be3f <Memset>
c0007bd3:	83 c4 10             	add    $0x10,%esp
c0007bd6:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007bd9:	c1 e0 09             	shl    $0x9,%eax
c0007bdc:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0007bdf:	83 ec 04             	sub    $0x4,%esp
c0007be2:	50                   	push   %eax
c0007be3:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0007be9:	50                   	push   %eax
c0007bea:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007bed:	e8 61 de ff ff       	call   c0005a53 <read>
c0007bf2:	83 c4 10             	add    $0x10,%esp
c0007bf5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007bfc:	83 ec 04             	sub    $0x4,%esp
c0007bff:	68 00 02 00 00       	push   $0x200
c0007c04:	6a 00                	push   $0x0
c0007c06:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0007c0c:	50                   	push   %eax
c0007c0d:	e8 2d 42 00 00       	call   c000be3f <Memset>
c0007c12:	83 c4 10             	add    $0x10,%esp
c0007c15:	83 ec 04             	sub    $0x4,%esp
c0007c18:	68 00 02 00 00       	push   $0x200
c0007c1d:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0007c23:	50                   	push   %eax
c0007c24:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007c27:	e8 27 de ff ff       	call   c0005a53 <read>
c0007c2c:	83 c4 10             	add    $0x10,%esp
c0007c2f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0007c32:	83 ec 0c             	sub    $0xc,%esp
c0007c35:	68 52 b5 00 c0       	push   $0xc000b552
c0007c3a:	e8 ff 16 00 00       	call   c000933e <Printf>
c0007c3f:	83 c4 10             	add    $0x10,%esp
c0007c42:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0007c46:	0f 84 bc 01 00 00    	je     c0007e08 <untar+0x2be>
c0007c4c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007c4f:	01 45 f4             	add    %eax,-0xc(%ebp)
c0007c52:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0007c59:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0007c5f:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0007c62:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0007c65:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0007c68:	83 ec 08             	sub    $0x8,%esp
c0007c6b:	6a 07                	push   $0x7
c0007c6d:	ff 75 cc             	pushl  -0x34(%ebp)
c0007c70:	e8 49 dd ff ff       	call   c00059be <open>
c0007c75:	83 c4 10             	add    $0x10,%esp
c0007c78:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0007c7b:	83 ec 0c             	sub    $0xc,%esp
c0007c7e:	68 64 b5 00 c0       	push   $0xc000b564
c0007c83:	e8 b6 16 00 00       	call   c000933e <Printf>
c0007c88:	83 c4 10             	add    $0x10,%esp
c0007c8b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0007c92:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0007c95:	83 c0 7c             	add    $0x7c,%eax
c0007c98:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0007c9b:	83 ec 0c             	sub    $0xc,%esp
c0007c9e:	ff 75 cc             	pushl  -0x34(%ebp)
c0007ca1:	e8 d2 41 00 00       	call   c000be78 <Strlen>
c0007ca6:	83 c4 10             	add    $0x10,%esp
c0007ca9:	85 c0                	test   %eax,%eax
c0007cab:	75 28                	jne    c0007cd5 <untar+0x18b>
c0007cad:	83 ec 0c             	sub    $0xc,%esp
c0007cb0:	ff 75 c4             	pushl  -0x3c(%ebp)
c0007cb3:	e8 c0 41 00 00       	call   c000be78 <Strlen>
c0007cb8:	83 c4 10             	add    $0x10,%esp
c0007cbb:	85 c0                	test   %eax,%eax
c0007cbd:	75 16                	jne    c0007cd5 <untar+0x18b>
c0007cbf:	83 ec 0c             	sub    $0xc,%esp
c0007cc2:	68 76 b5 00 c0       	push   $0xc000b576
c0007cc7:	e8 72 16 00 00       	call   c000933e <Printf>
c0007ccc:	83 c4 10             	add    $0x10,%esp
c0007ccf:	90                   	nop
c0007cd0:	e9 34 01 00 00       	jmp    c0007e09 <untar+0x2bf>
c0007cd5:	83 ec 0c             	sub    $0xc,%esp
c0007cd8:	68 7d b5 00 c0       	push   $0xc000b57d
c0007cdd:	e8 5c 16 00 00       	call   c000933e <Printf>
c0007ce2:	83 c4 10             	add    $0x10,%esp
c0007ce5:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0007ce8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007ceb:	eb 1f                	jmp    c0007d0c <untar+0x1c2>
c0007ced:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007cf0:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0007cf7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007cfa:	0f b6 00             	movzbl (%eax),%eax
c0007cfd:	0f be c0             	movsbl %al,%eax
c0007d00:	83 e8 30             	sub    $0x30,%eax
c0007d03:	01 d0                	add    %edx,%eax
c0007d05:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007d08:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0007d0c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007d0f:	0f b6 00             	movzbl (%eax),%eax
c0007d12:	84 c0                	test   %al,%al
c0007d14:	75 d7                	jne    c0007ced <untar+0x1a3>
c0007d16:	83 ec 0c             	sub    $0xc,%esp
c0007d19:	68 8b b5 00 c0       	push   $0xc000b58b
c0007d1e:	e8 1b 16 00 00       	call   c000933e <Printf>
c0007d23:	83 c4 10             	add    $0x10,%esp
c0007d26:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007d29:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0007d2c:	c7 45 bc 00 08 00 00 	movl   $0x800,-0x44(%ebp)
c0007d33:	83 ec 08             	sub    $0x8,%esp
c0007d36:	ff 75 c0             	pushl  -0x40(%ebp)
c0007d39:	68 99 b5 00 c0       	push   $0xc000b599
c0007d3e:	e8 fb 15 00 00       	call   c000933e <Printf>
c0007d43:	83 c4 10             	add    $0x10,%esp
c0007d46:	83 ec 08             	sub    $0x8,%esp
c0007d49:	ff 75 c0             	pushl  -0x40(%ebp)
c0007d4c:	68 ab b5 00 c0       	push   $0xc000b5ab
c0007d51:	e8 e8 15 00 00       	call   c000933e <Printf>
c0007d56:	83 c4 10             	add    $0x10,%esp
c0007d59:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0007d5c:	39 45 bc             	cmp    %eax,-0x44(%ebp)
c0007d5f:	0f 4e 45 bc          	cmovle -0x44(%ebp),%eax
c0007d63:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0007d66:	83 ec 04             	sub    $0x4,%esp
c0007d69:	ff 75 b8             	pushl  -0x48(%ebp)
c0007d6c:	8d 85 b8 f5 ff ff    	lea    -0xa48(%ebp),%eax
c0007d72:	50                   	push   %eax
c0007d73:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007d76:	e8 d8 dc ff ff       	call   c0005a53 <read>
c0007d7b:	83 c4 10             	add    $0x10,%esp
c0007d7e:	01 45 f4             	add    %eax,-0xc(%ebp)
c0007d81:	83 ec 04             	sub    $0x4,%esp
c0007d84:	ff 75 b8             	pushl  -0x48(%ebp)
c0007d87:	8d 85 b8 f5 ff ff    	lea    -0xa48(%ebp),%eax
c0007d8d:	50                   	push   %eax
c0007d8e:	ff 75 c8             	pushl  -0x38(%ebp)
c0007d91:	e8 3e de ff ff       	call   c0005bd4 <write>
c0007d96:	83 c4 10             	add    $0x10,%esp
c0007d99:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007d9c:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0007d9f:	7d 02                	jge    c0007da3 <untar+0x259>
c0007da1:	eb c3                	jmp    c0007d66 <untar+0x21c>
c0007da3:	90                   	nop
c0007da4:	83 ec 08             	sub    $0x8,%esp
c0007da7:	ff 75 f4             	pushl  -0xc(%ebp)
c0007daa:	68 bd b5 00 c0       	push   $0xc000b5bd
c0007daf:	e8 8a 15 00 00       	call   c000933e <Printf>
c0007db4:	83 c4 10             	add    $0x10,%esp
c0007db7:	83 ec 08             	sub    $0x8,%esp
c0007dba:	ff 75 c0             	pushl  -0x40(%ebp)
c0007dbd:	68 cf b5 00 c0       	push   $0xc000b5cf
c0007dc2:	e8 77 15 00 00       	call   c000933e <Printf>
c0007dc7:	83 c4 10             	add    $0x10,%esp
c0007dca:	83 ec 0c             	sub    $0xc,%esp
c0007dcd:	68 e0 b5 00 c0       	push   $0xc000b5e0
c0007dd2:	e8 67 15 00 00       	call   c000933e <Printf>
c0007dd7:	83 c4 10             	add    $0x10,%esp
c0007dda:	83 ec 0c             	sub    $0xc,%esp
c0007ddd:	ff 75 c8             	pushl  -0x38(%ebp)
c0007de0:	e8 74 de ff ff       	call   c0005c59 <close>
c0007de5:	83 c4 10             	add    $0x10,%esp
c0007de8:	83 ec 0c             	sub    $0xc,%esp
c0007deb:	68 ee b5 00 c0       	push   $0xc000b5ee
c0007df0:	e8 49 15 00 00       	call   c000933e <Printf>
c0007df5:	83 c4 10             	add    $0x10,%esp
c0007df8:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c0007dfc:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0007e00:	0f 8f 98 fd ff ff    	jg     c0007b9e <untar+0x54>
c0007e06:	eb 01                	jmp    c0007e09 <untar+0x2bf>
c0007e08:	90                   	nop
c0007e09:	83 ec 0c             	sub    $0xc,%esp
c0007e0c:	68 fb b5 00 c0       	push   $0xc000b5fb
c0007e11:	e8 28 15 00 00       	call   c000933e <Printf>
c0007e16:	83 c4 10             	add    $0x10,%esp
c0007e19:	83 ec 0c             	sub    $0xc,%esp
c0007e1c:	68 0d b6 00 c0       	push   $0xc000b60d
c0007e21:	e8 18 15 00 00       	call   c000933e <Printf>
c0007e26:	83 c4 10             	add    $0x10,%esp
c0007e29:	83 ec 0c             	sub    $0xc,%esp
c0007e2c:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007e2f:	e8 25 de ff ff       	call   c0005c59 <close>
c0007e34:	83 c4 10             	add    $0x10,%esp
c0007e37:	83 ec 0c             	sub    $0xc,%esp
c0007e3a:	68 1d b6 00 c0       	push   $0xc000b61d
c0007e3f:	e8 fa 14 00 00       	call   c000933e <Printf>
c0007e44:	83 c4 10             	add    $0x10,%esp
c0007e47:	83 ec 0c             	sub    $0xc,%esp
c0007e4a:	68 30 b6 00 c0       	push   $0xc000b630
c0007e4f:	e8 ea 14 00 00       	call   c000933e <Printf>
c0007e54:	83 c4 10             	add    $0x10,%esp
c0007e57:	90                   	nop
c0007e58:	c9                   	leave  
c0007e59:	c3                   	ret    

c0007e5a <atoi>:
c0007e5a:	55                   	push   %ebp
c0007e5b:	89 e5                	mov    %esp,%ebp
c0007e5d:	83 ec 10             	sub    $0x10,%esp
c0007e60:	8b 45 08             	mov    0x8(%ebp),%eax
c0007e63:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0007e66:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007e69:	8d 50 01             	lea    0x1(%eax),%edx
c0007e6c:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0007e6f:	c6 00 30             	movb   $0x30,(%eax)
c0007e72:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007e75:	8d 50 01             	lea    0x1(%eax),%edx
c0007e78:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0007e7b:	c6 00 78             	movb   $0x78,(%eax)
c0007e7e:	c6 45 fa 00          	movb   $0x0,-0x6(%ebp)
c0007e82:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0007e86:	75 0e                	jne    c0007e96 <atoi+0x3c>
c0007e88:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007e8b:	8d 50 01             	lea    0x1(%eax),%edx
c0007e8e:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0007e91:	c6 00 30             	movb   $0x30,(%eax)
c0007e94:	eb 61                	jmp    c0007ef7 <atoi+0x9d>
c0007e96:	c7 45 f4 1c 00 00 00 	movl   $0x1c,-0xc(%ebp)
c0007e9d:	eb 52                	jmp    c0007ef1 <atoi+0x97>
c0007e9f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007ea2:	8b 55 0c             	mov    0xc(%ebp),%edx
c0007ea5:	89 c1                	mov    %eax,%ecx
c0007ea7:	d3 fa                	sar    %cl,%edx
c0007ea9:	89 d0                	mov    %edx,%eax
c0007eab:	83 e0 0f             	and    $0xf,%eax
c0007eae:	88 45 fb             	mov    %al,-0x5(%ebp)
c0007eb1:	80 7d fa 00          	cmpb   $0x0,-0x6(%ebp)
c0007eb5:	75 06                	jne    c0007ebd <atoi+0x63>
c0007eb7:	80 7d fb 00          	cmpb   $0x0,-0x5(%ebp)
c0007ebb:	74 2f                	je     c0007eec <atoi+0x92>
c0007ebd:	c6 45 fa 01          	movb   $0x1,-0x6(%ebp)
c0007ec1:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0007ec5:	83 c0 30             	add    $0x30,%eax
c0007ec8:	88 45 fb             	mov    %al,-0x5(%ebp)
c0007ecb:	80 7d fb 39          	cmpb   $0x39,-0x5(%ebp)
c0007ecf:	7e 0a                	jle    c0007edb <atoi+0x81>
c0007ed1:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0007ed5:	83 c0 07             	add    $0x7,%eax
c0007ed8:	88 45 fb             	mov    %al,-0x5(%ebp)
c0007edb:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007ede:	8d 50 01             	lea    0x1(%eax),%edx
c0007ee1:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0007ee4:	0f b6 55 fb          	movzbl -0x5(%ebp),%edx
c0007ee8:	88 10                	mov    %dl,(%eax)
c0007eea:	eb 01                	jmp    c0007eed <atoi+0x93>
c0007eec:	90                   	nop
c0007eed:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c0007ef1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0007ef5:	79 a8                	jns    c0007e9f <atoi+0x45>
c0007ef7:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007efa:	c6 00 00             	movb   $0x0,(%eax)
c0007efd:	90                   	nop
c0007efe:	c9                   	leave  
c0007eff:	c3                   	ret    

c0007f00 <disp_int>:
c0007f00:	55                   	push   %ebp
c0007f01:	89 e5                	mov    %esp,%ebp
c0007f03:	83 ec 18             	sub    $0x18,%esp
c0007f06:	ff 75 08             	pushl  0x8(%ebp)
c0007f09:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0007f0c:	50                   	push   %eax
c0007f0d:	e8 48 ff ff ff       	call   c0007e5a <atoi>
c0007f12:	83 c4 08             	add    $0x8,%esp
c0007f15:	83 ec 08             	sub    $0x8,%esp
c0007f18:	6a 0b                	push   $0xb
c0007f1a:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0007f1d:	50                   	push   %eax
c0007f1e:	e8 a4 91 ff ff       	call   c00010c7 <disp_str_colour>
c0007f23:	83 c4 10             	add    $0x10,%esp
c0007f26:	90                   	nop
c0007f27:	c9                   	leave  
c0007f28:	c3                   	ret    

c0007f29 <do_page_fault>:
c0007f29:	55                   	push   %ebp
c0007f2a:	89 e5                	mov    %esp,%ebp
c0007f2c:	83 ec 28             	sub    $0x28,%esp
c0007f2f:	0f 20 d0             	mov    %cr2,%eax
c0007f32:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007f35:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c0007f3c:	00 00 00 
c0007f3f:	83 ec 0c             	sub    $0xc,%esp
c0007f42:	68 3b b6 00 c0       	push   $0xc000b63b
c0007f47:	e8 40 91 ff ff       	call   c000108c <disp_str>
c0007f4c:	83 c4 10             	add    $0x10,%esp
c0007f4f:	83 ec 0c             	sub    $0xc,%esp
c0007f52:	68 4a b6 00 c0       	push   $0xc000b64a
c0007f57:	e8 30 91 ff ff       	call   c000108c <disp_str>
c0007f5c:	83 c4 10             	add    $0x10,%esp
c0007f5f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007f62:	83 ec 0c             	sub    $0xc,%esp
c0007f65:	50                   	push   %eax
c0007f66:	e8 95 ff ff ff       	call   c0007f00 <disp_int>
c0007f6b:	83 c4 10             	add    $0x10,%esp
c0007f6e:	83 ec 0c             	sub    $0xc,%esp
c0007f71:	68 4f b6 00 c0       	push   $0xc000b64f
c0007f76:	e8 11 91 ff ff       	call   c000108c <disp_str>
c0007f7b:	83 c4 10             	add    $0x10,%esp
c0007f7e:	83 ec 0c             	sub    $0xc,%esp
c0007f81:	ff 75 f4             	pushl  -0xc(%ebp)
c0007f84:	e8 c6 ec ff ff       	call   c0006c4f <ptr_pde>
c0007f89:	83 c4 10             	add    $0x10,%esp
c0007f8c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0007f8f:	83 ec 0c             	sub    $0xc,%esp
c0007f92:	ff 75 f4             	pushl  -0xc(%ebp)
c0007f95:	e8 c8 ec ff ff       	call   c0006c62 <ptr_pte>
c0007f9a:	83 c4 10             	add    $0x10,%esp
c0007f9d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007fa0:	83 ec 0c             	sub    $0xc,%esp
c0007fa3:	68 51 b6 00 c0       	push   $0xc000b651
c0007fa8:	e8 df 90 ff ff       	call   c000108c <disp_str>
c0007fad:	83 c4 10             	add    $0x10,%esp
c0007fb0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007fb3:	83 ec 0c             	sub    $0xc,%esp
c0007fb6:	50                   	push   %eax
c0007fb7:	e8 44 ff ff ff       	call   c0007f00 <disp_int>
c0007fbc:	83 c4 10             	add    $0x10,%esp
c0007fbf:	83 ec 0c             	sub    $0xc,%esp
c0007fc2:	68 56 b6 00 c0       	push   $0xc000b656
c0007fc7:	e8 c0 90 ff ff       	call   c000108c <disp_str>
c0007fcc:	83 c4 10             	add    $0x10,%esp
c0007fcf:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007fd2:	8b 00                	mov    (%eax),%eax
c0007fd4:	83 ec 0c             	sub    $0xc,%esp
c0007fd7:	50                   	push   %eax
c0007fd8:	e8 23 ff ff ff       	call   c0007f00 <disp_int>
c0007fdd:	83 c4 10             	add    $0x10,%esp
c0007fe0:	83 ec 0c             	sub    $0xc,%esp
c0007fe3:	68 4f b6 00 c0       	push   $0xc000b64f
c0007fe8:	e8 9f 90 ff ff       	call   c000108c <disp_str>
c0007fed:	83 c4 10             	add    $0x10,%esp
c0007ff0:	83 ec 0c             	sub    $0xc,%esp
c0007ff3:	68 5f b6 00 c0       	push   $0xc000b65f
c0007ff8:	e8 8f 90 ff ff       	call   c000108c <disp_str>
c0007ffd:	83 c4 10             	add    $0x10,%esp
c0008000:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008003:	83 ec 0c             	sub    $0xc,%esp
c0008006:	50                   	push   %eax
c0008007:	e8 f4 fe ff ff       	call   c0007f00 <disp_int>
c000800c:	83 c4 10             	add    $0x10,%esp
c000800f:	83 ec 0c             	sub    $0xc,%esp
c0008012:	68 64 b6 00 c0       	push   $0xc000b664
c0008017:	e8 70 90 ff ff       	call   c000108c <disp_str>
c000801c:	83 c4 10             	add    $0x10,%esp
c000801f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008022:	8b 00                	mov    (%eax),%eax
c0008024:	83 ec 0c             	sub    $0xc,%esp
c0008027:	50                   	push   %eax
c0008028:	e8 d3 fe ff ff       	call   c0007f00 <disp_int>
c000802d:	83 c4 10             	add    $0x10,%esp
c0008030:	83 ec 0c             	sub    $0xc,%esp
c0008033:	68 4f b6 00 c0       	push   $0xc000b64f
c0008038:	e8 4f 90 ff ff       	call   c000108c <disp_str>
c000803d:	83 c4 10             	add    $0x10,%esp
c0008040:	c7 45 e8 00 00 10 00 	movl   $0x100000,-0x18(%ebp)
c0008047:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000804a:	8b 00                	mov    (%eax),%eax
c000804c:	83 e0 01             	and    $0x1,%eax
c000804f:	85 c0                	test   %eax,%eax
c0008051:	74 09                	je     c000805c <do_page_fault+0x133>
c0008053:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
c000805a:	eb 07                	jmp    c0008063 <do_page_fault+0x13a>
c000805c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0008063:	90                   	nop
c0008064:	c9                   	leave  
c0008065:	c3                   	ret    

c0008066 <exception_handler>:
c0008066:	55                   	push   %ebp
c0008067:	89 e5                	mov    %esp,%ebp
c0008069:	57                   	push   %edi
c000806a:	56                   	push   %esi
c000806b:	53                   	push   %ebx
c000806c:	83 ec 6c             	sub    $0x6c,%esp
c000806f:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0008072:	bb e0 b8 00 c0       	mov    $0xc000b8e0,%ebx
c0008077:	ba 13 00 00 00       	mov    $0x13,%edx
c000807c:	89 c7                	mov    %eax,%edi
c000807e:	89 de                	mov    %ebx,%esi
c0008080:	89 d1                	mov    %edx,%ecx
c0008082:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0008084:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c000808b:	eb 04                	jmp    c0008091 <exception_handler+0x2b>
c000808d:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0008091:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c0008098:	7e f3                	jle    c000808d <exception_handler+0x27>
c000809a:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c00080a1:	00 00 00 
c00080a4:	83 ec 0c             	sub    $0xc,%esp
c00080a7:	68 6d b6 00 c0       	push   $0xc000b66d
c00080ac:	e8 db 8f ff ff       	call   c000108c <disp_str>
c00080b1:	83 c4 10             	add    $0x10,%esp
c00080b4:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c00080bb:	8b 45 08             	mov    0x8(%ebp),%eax
c00080be:	8b 44 85 8c          	mov    -0x74(%ebp,%eax,4),%eax
c00080c2:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00080c5:	83 ec 0c             	sub    $0xc,%esp
c00080c8:	ff 75 dc             	pushl  -0x24(%ebp)
c00080cb:	e8 bc 8f ff ff       	call   c000108c <disp_str>
c00080d0:	83 c4 10             	add    $0x10,%esp
c00080d3:	83 ec 0c             	sub    $0xc,%esp
c00080d6:	68 7b b6 00 c0       	push   $0xc000b67b
c00080db:	e8 ac 8f ff ff       	call   c000108c <disp_str>
c00080e0:	83 c4 10             	add    $0x10,%esp
c00080e3:	83 ec 0c             	sub    $0xc,%esp
c00080e6:	68 7e b6 00 c0       	push   $0xc000b67e
c00080eb:	e8 9c 8f ff ff       	call   c000108c <disp_str>
c00080f0:	83 c4 10             	add    $0x10,%esp
c00080f3:	8b 45 08             	mov    0x8(%ebp),%eax
c00080f6:	83 ec 0c             	sub    $0xc,%esp
c00080f9:	50                   	push   %eax
c00080fa:	e8 01 fe ff ff       	call   c0007f00 <disp_int>
c00080ff:	83 c4 10             	add    $0x10,%esp
c0008102:	83 ec 0c             	sub    $0xc,%esp
c0008105:	68 7b b6 00 c0       	push   $0xc000b67b
c000810a:	e8 7d 8f ff ff       	call   c000108c <disp_str>
c000810f:	83 c4 10             	add    $0x10,%esp
c0008112:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c0008116:	74 2f                	je     c0008147 <exception_handler+0xe1>
c0008118:	83 ec 0c             	sub    $0xc,%esp
c000811b:	68 86 b6 00 c0       	push   $0xc000b686
c0008120:	e8 67 8f ff ff       	call   c000108c <disp_str>
c0008125:	83 c4 10             	add    $0x10,%esp
c0008128:	8b 45 0c             	mov    0xc(%ebp),%eax
c000812b:	83 ec 0c             	sub    $0xc,%esp
c000812e:	50                   	push   %eax
c000812f:	e8 cc fd ff ff       	call   c0007f00 <disp_int>
c0008134:	83 c4 10             	add    $0x10,%esp
c0008137:	83 ec 0c             	sub    $0xc,%esp
c000813a:	68 7b b6 00 c0       	push   $0xc000b67b
c000813f:	e8 48 8f ff ff       	call   c000108c <disp_str>
c0008144:	83 c4 10             	add    $0x10,%esp
c0008147:	83 ec 0c             	sub    $0xc,%esp
c000814a:	68 90 b6 00 c0       	push   $0xc000b690
c000814f:	e8 38 8f ff ff       	call   c000108c <disp_str>
c0008154:	83 c4 10             	add    $0x10,%esp
c0008157:	83 ec 0c             	sub    $0xc,%esp
c000815a:	ff 75 14             	pushl  0x14(%ebp)
c000815d:	e8 9e fd ff ff       	call   c0007f00 <disp_int>
c0008162:	83 c4 10             	add    $0x10,%esp
c0008165:	83 ec 0c             	sub    $0xc,%esp
c0008168:	68 7b b6 00 c0       	push   $0xc000b67b
c000816d:	e8 1a 8f ff ff       	call   c000108c <disp_str>
c0008172:	83 c4 10             	add    $0x10,%esp
c0008175:	83 ec 0c             	sub    $0xc,%esp
c0008178:	68 94 b6 00 c0       	push   $0xc000b694
c000817d:	e8 0a 8f ff ff       	call   c000108c <disp_str>
c0008182:	83 c4 10             	add    $0x10,%esp
c0008185:	8b 45 10             	mov    0x10(%ebp),%eax
c0008188:	83 ec 0c             	sub    $0xc,%esp
c000818b:	50                   	push   %eax
c000818c:	e8 6f fd ff ff       	call   c0007f00 <disp_int>
c0008191:	83 c4 10             	add    $0x10,%esp
c0008194:	83 ec 0c             	sub    $0xc,%esp
c0008197:	68 7b b6 00 c0       	push   $0xc000b67b
c000819c:	e8 eb 8e ff ff       	call   c000108c <disp_str>
c00081a1:	83 c4 10             	add    $0x10,%esp
c00081a4:	83 ec 0c             	sub    $0xc,%esp
c00081a7:	68 99 b6 00 c0       	push   $0xc000b699
c00081ac:	e8 db 8e ff ff       	call   c000108c <disp_str>
c00081b1:	83 c4 10             	add    $0x10,%esp
c00081b4:	83 ec 0c             	sub    $0xc,%esp
c00081b7:	ff 75 18             	pushl  0x18(%ebp)
c00081ba:	e8 41 fd ff ff       	call   c0007f00 <disp_int>
c00081bf:	83 c4 10             	add    $0x10,%esp
c00081c2:	83 ec 0c             	sub    $0xc,%esp
c00081c5:	68 7b b6 00 c0       	push   $0xc000b67b
c00081ca:	e8 bd 8e ff ff       	call   c000108c <disp_str>
c00081cf:	83 c4 10             	add    $0x10,%esp
c00081d2:	83 ec 0c             	sub    $0xc,%esp
c00081d5:	68 a4 b6 00 c0       	push   $0xc000b6a4
c00081da:	e8 ad 8e ff ff       	call   c000108c <disp_str>
c00081df:	83 c4 10             	add    $0x10,%esp
c00081e2:	83 7d 08 0e          	cmpl   $0xe,0x8(%ebp)
c00081e6:	75 45                	jne    c000822d <exception_handler+0x1c7>
c00081e8:	0f 20 d0             	mov    %cr2,%eax
c00081eb:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00081ee:	83 ec 0c             	sub    $0xc,%esp
c00081f1:	68 c3 b6 00 c0       	push   $0xc000b6c3
c00081f6:	e8 91 8e ff ff       	call   c000108c <disp_str>
c00081fb:	83 c4 10             	add    $0x10,%esp
c00081fe:	83 ec 0c             	sub    $0xc,%esp
c0008201:	68 4a b6 00 c0       	push   $0xc000b64a
c0008206:	e8 81 8e ff ff       	call   c000108c <disp_str>
c000820b:	83 c4 10             	add    $0x10,%esp
c000820e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008211:	83 ec 0c             	sub    $0xc,%esp
c0008214:	50                   	push   %eax
c0008215:	e8 e6 fc ff ff       	call   c0007f00 <disp_int>
c000821a:	83 c4 10             	add    $0x10,%esp
c000821d:	83 ec 0c             	sub    $0xc,%esp
c0008220:	68 4f b6 00 c0       	push   $0xc000b64f
c0008225:	e8 62 8e ff ff       	call   c000108c <disp_str>
c000822a:	83 c4 10             	add    $0x10,%esp
c000822d:	83 7d 08 0d          	cmpl   $0xd,0x8(%ebp)
c0008231:	75 11                	jne    c0008244 <exception_handler+0x1de>
c0008233:	83 ec 0c             	sub    $0xc,%esp
c0008236:	68 cf b6 00 c0       	push   $0xc000b6cf
c000823b:	e8 4c 8e ff ff       	call   c000108c <disp_str>
c0008240:	83 c4 10             	add    $0x10,%esp
c0008243:	90                   	nop
c0008244:	90                   	nop
c0008245:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0008248:	5b                   	pop    %ebx
c0008249:	5e                   	pop    %esi
c000824a:	5f                   	pop    %edi
c000824b:	5d                   	pop    %ebp
c000824c:	c3                   	ret    

c000824d <init_internal_interrupt>:
c000824d:	55                   	push   %ebp
c000824e:	89 e5                	mov    %esp,%ebp
c0008250:	83 ec 08             	sub    $0x8,%esp
c0008253:	6a 0e                	push   $0xe
c0008255:	6a 08                	push   $0x8
c0008257:	68 03 11 00 c0       	push   $0xc0001103
c000825c:	6a 00                	push   $0x0
c000825e:	e8 9b c7 ff ff       	call   c00049fe <InitInterruptDesc>
c0008263:	83 c4 10             	add    $0x10,%esp
c0008266:	6a 0e                	push   $0xe
c0008268:	6a 08                	push   $0x8
c000826a:	68 09 11 00 c0       	push   $0xc0001109
c000826f:	6a 01                	push   $0x1
c0008271:	e8 88 c7 ff ff       	call   c00049fe <InitInterruptDesc>
c0008276:	83 c4 10             	add    $0x10,%esp
c0008279:	6a 0e                	push   $0xe
c000827b:	6a 08                	push   $0x8
c000827d:	68 0f 11 00 c0       	push   $0xc000110f
c0008282:	6a 02                	push   $0x2
c0008284:	e8 75 c7 ff ff       	call   c00049fe <InitInterruptDesc>
c0008289:	83 c4 10             	add    $0x10,%esp
c000828c:	6a 0e                	push   $0xe
c000828e:	6a 08                	push   $0x8
c0008290:	68 15 11 00 c0       	push   $0xc0001115
c0008295:	6a 03                	push   $0x3
c0008297:	e8 62 c7 ff ff       	call   c00049fe <InitInterruptDesc>
c000829c:	83 c4 10             	add    $0x10,%esp
c000829f:	6a 0e                	push   $0xe
c00082a1:	6a 08                	push   $0x8
c00082a3:	68 1b 11 00 c0       	push   $0xc000111b
c00082a8:	6a 04                	push   $0x4
c00082aa:	e8 4f c7 ff ff       	call   c00049fe <InitInterruptDesc>
c00082af:	83 c4 10             	add    $0x10,%esp
c00082b2:	6a 0e                	push   $0xe
c00082b4:	6a 08                	push   $0x8
c00082b6:	68 21 11 00 c0       	push   $0xc0001121
c00082bb:	6a 05                	push   $0x5
c00082bd:	e8 3c c7 ff ff       	call   c00049fe <InitInterruptDesc>
c00082c2:	83 c4 10             	add    $0x10,%esp
c00082c5:	6a 0e                	push   $0xe
c00082c7:	6a 08                	push   $0x8
c00082c9:	68 27 11 00 c0       	push   $0xc0001127
c00082ce:	6a 06                	push   $0x6
c00082d0:	e8 29 c7 ff ff       	call   c00049fe <InitInterruptDesc>
c00082d5:	83 c4 10             	add    $0x10,%esp
c00082d8:	6a 0e                	push   $0xe
c00082da:	6a 08                	push   $0x8
c00082dc:	68 2d 11 00 c0       	push   $0xc000112d
c00082e1:	6a 07                	push   $0x7
c00082e3:	e8 16 c7 ff ff       	call   c00049fe <InitInterruptDesc>
c00082e8:	83 c4 10             	add    $0x10,%esp
c00082eb:	6a 0e                	push   $0xe
c00082ed:	6a 08                	push   $0x8
c00082ef:	68 33 11 00 c0       	push   $0xc0001133
c00082f4:	6a 08                	push   $0x8
c00082f6:	e8 03 c7 ff ff       	call   c00049fe <InitInterruptDesc>
c00082fb:	83 c4 10             	add    $0x10,%esp
c00082fe:	6a 0e                	push   $0xe
c0008300:	6a 08                	push   $0x8
c0008302:	68 37 11 00 c0       	push   $0xc0001137
c0008307:	6a 09                	push   $0x9
c0008309:	e8 f0 c6 ff ff       	call   c00049fe <InitInterruptDesc>
c000830e:	83 c4 10             	add    $0x10,%esp
c0008311:	6a 0e                	push   $0xe
c0008313:	6a 08                	push   $0x8
c0008315:	68 3d 11 00 c0       	push   $0xc000113d
c000831a:	6a 0a                	push   $0xa
c000831c:	e8 dd c6 ff ff       	call   c00049fe <InitInterruptDesc>
c0008321:	83 c4 10             	add    $0x10,%esp
c0008324:	6a 0e                	push   $0xe
c0008326:	6a 08                	push   $0x8
c0008328:	68 41 11 00 c0       	push   $0xc0001141
c000832d:	6a 0b                	push   $0xb
c000832f:	e8 ca c6 ff ff       	call   c00049fe <InitInterruptDesc>
c0008334:	83 c4 10             	add    $0x10,%esp
c0008337:	6a 0e                	push   $0xe
c0008339:	6a 08                	push   $0x8
c000833b:	68 45 11 00 c0       	push   $0xc0001145
c0008340:	6a 0c                	push   $0xc
c0008342:	e8 b7 c6 ff ff       	call   c00049fe <InitInterruptDesc>
c0008347:	83 c4 10             	add    $0x10,%esp
c000834a:	6a 0e                	push   $0xe
c000834c:	6a 08                	push   $0x8
c000834e:	68 49 11 00 c0       	push   $0xc0001149
c0008353:	6a 0d                	push   $0xd
c0008355:	e8 a4 c6 ff ff       	call   c00049fe <InitInterruptDesc>
c000835a:	83 c4 10             	add    $0x10,%esp
c000835d:	6a 0e                	push   $0xe
c000835f:	6a 08                	push   $0x8
c0008361:	68 54 11 00 c0       	push   $0xc0001154
c0008366:	6a 0e                	push   $0xe
c0008368:	e8 91 c6 ff ff       	call   c00049fe <InitInterruptDesc>
c000836d:	83 c4 10             	add    $0x10,%esp
c0008370:	6a 0e                	push   $0xe
c0008372:	6a 08                	push   $0x8
c0008374:	68 58 11 00 c0       	push   $0xc0001158
c0008379:	6a 10                	push   $0x10
c000837b:	e8 7e c6 ff ff       	call   c00049fe <InitInterruptDesc>
c0008380:	83 c4 10             	add    $0x10,%esp
c0008383:	6a 0e                	push   $0xe
c0008385:	6a 08                	push   $0x8
c0008387:	68 5e 11 00 c0       	push   $0xc000115e
c000838c:	6a 11                	push   $0x11
c000838e:	e8 6b c6 ff ff       	call   c00049fe <InitInterruptDesc>
c0008393:	83 c4 10             	add    $0x10,%esp
c0008396:	6a 0e                	push   $0xe
c0008398:	6a 08                	push   $0x8
c000839a:	68 62 11 00 c0       	push   $0xc0001162
c000839f:	6a 12                	push   $0x12
c00083a1:	e8 58 c6 ff ff       	call   c00049fe <InitInterruptDesc>
c00083a6:	83 c4 10             	add    $0x10,%esp
c00083a9:	6a 0e                	push   $0xe
c00083ab:	6a 0e                	push   $0xe
c00083ad:	68 1e 12 00 c0       	push   $0xc000121e
c00083b2:	68 90 00 00 00       	push   $0x90
c00083b7:	e8 42 c6 ff ff       	call   c00049fe <InitInterruptDesc>
c00083bc:	83 c4 10             	add    $0x10,%esp
c00083bf:	90                   	nop
c00083c0:	c9                   	leave  
c00083c1:	c3                   	ret    

c00083c2 <spurious_irq>:
c00083c2:	55                   	push   %ebp
c00083c3:	89 e5                	mov    %esp,%ebp
c00083c5:	83 ec 08             	sub    $0x8,%esp
c00083c8:	83 ec 08             	sub    $0x8,%esp
c00083cb:	6a 0b                	push   $0xb
c00083cd:	68 2c b9 00 c0       	push   $0xc000b92c
c00083d2:	e8 f0 8c ff ff       	call   c00010c7 <disp_str_colour>
c00083d7:	83 c4 10             	add    $0x10,%esp
c00083da:	83 ec 0c             	sub    $0xc,%esp
c00083dd:	ff 75 08             	pushl  0x8(%ebp)
c00083e0:	e8 1b fb ff ff       	call   c0007f00 <disp_int>
c00083e5:	83 c4 10             	add    $0x10,%esp
c00083e8:	a1 e8 1e 01 c0       	mov    0xc0011ee8,%eax
c00083ed:	8b 15 ec 1e 01 c0    	mov    0xc0011eec,%edx
c00083f3:	83 c0 01             	add    $0x1,%eax
c00083f6:	83 d2 00             	adc    $0x0,%edx
c00083f9:	a3 e8 1e 01 c0       	mov    %eax,0xc0011ee8
c00083fe:	89 15 ec 1e 01 c0    	mov    %edx,0xc0011eec
c0008404:	83 ec 0c             	sub    $0xc,%esp
c0008407:	68 53 b9 00 c0       	push   $0xc000b953
c000840c:	e8 7b 8c ff ff       	call   c000108c <disp_str>
c0008411:	83 c4 10             	add    $0x10,%esp
c0008414:	a1 e8 1e 01 c0       	mov    0xc0011ee8,%eax
c0008419:	8b 15 ec 1e 01 c0    	mov    0xc0011eec,%edx
c000841f:	83 ec 0c             	sub    $0xc,%esp
c0008422:	50                   	push   %eax
c0008423:	e8 d8 fa ff ff       	call   c0007f00 <disp_int>
c0008428:	83 c4 10             	add    $0x10,%esp
c000842b:	83 ec 0c             	sub    $0xc,%esp
c000842e:	68 55 b9 00 c0       	push   $0xc000b955
c0008433:	e8 54 8c ff ff       	call   c000108c <disp_str>
c0008438:	83 c4 10             	add    $0x10,%esp
c000843b:	83 ec 08             	sub    $0x8,%esp
c000843e:	6a 0c                	push   $0xc
c0008440:	68 58 b9 00 c0       	push   $0xc000b958
c0008445:	e8 7d 8c ff ff       	call   c00010c7 <disp_str_colour>
c000844a:	83 c4 10             	add    $0x10,%esp
c000844d:	90                   	nop
c000844e:	c9                   	leave  
c000844f:	c3                   	ret    

c0008450 <init_keyboard>:
c0008450:	55                   	push   %ebp
c0008451:	89 e5                	mov    %esp,%ebp
c0008453:	83 ec 18             	sub    $0x18,%esp
c0008456:	83 ec 04             	sub    $0x4,%esp
c0008459:	68 00 02 00 00       	push   $0x200
c000845e:	6a 00                	push   $0x0
c0008460:	68 ec 0b 01 c0       	push   $0xc0010bec
c0008465:	e8 d5 39 00 00       	call   c000be3f <Memset>
c000846a:	83 c4 10             	add    $0x10,%esp
c000846d:	c7 05 e0 0b 01 c0 ec 	movl   $0xc0010bec,0xc0010be0
c0008474:	0b 01 c0 
c0008477:	a1 e0 0b 01 c0       	mov    0xc0010be0,%eax
c000847c:	a3 e4 0b 01 c0       	mov    %eax,0xc0010be4
c0008481:	c7 05 e8 0b 01 c0 00 	movl   $0x0,0xc0010be8
c0008488:	00 00 00 
c000848b:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c0008492:	00 00 00 
c0008495:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000849c:	eb 04                	jmp    c00084a2 <init_keyboard+0x52>
c000849e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00084a2:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c00084a9:	7e f3                	jle    c000849e <init_keyboard+0x4e>
c00084ab:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c00084b2:	00 00 00 
c00084b5:	e8 5e d3 ff ff       	call   c0005818 <init_keyboard_handler>
c00084ba:	90                   	nop
c00084bb:	c9                   	leave  
c00084bc:	c3                   	ret    

c00084bd <u_thread_a>:
c00084bd:	55                   	push   %ebp
c00084be:	89 e5                	mov    %esp,%ebp
c00084c0:	83 ec 08             	sub    $0x8,%esp
c00084c3:	83 ec 0c             	sub    $0xc,%esp
c00084c6:	68 7d b9 00 c0       	push   $0xc000b97d
c00084cb:	e8 bc 8b ff ff       	call   c000108c <disp_str>
c00084d0:	83 c4 10             	add    $0x10,%esp
c00084d3:	eb fe                	jmp    c00084d3 <u_thread_a+0x16>

c00084d5 <TestTTY>:
c00084d5:	55                   	push   %ebp
c00084d6:	89 e5                	mov    %esp,%ebp
c00084d8:	83 ec 28             	sub    $0x28,%esp
c00084db:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c00084e2:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c00084e9:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c00084ef:	83 ec 08             	sub    $0x8,%esp
c00084f2:	6a 02                	push   $0x2
c00084f4:	8d 45 de             	lea    -0x22(%ebp),%eax
c00084f7:	50                   	push   %eax
c00084f8:	e8 c1 d4 ff ff       	call   c00059be <open>
c00084fd:	83 c4 10             	add    $0x10,%esp
c0008500:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008503:	83 ec 08             	sub    $0x8,%esp
c0008506:	6a 02                	push   $0x2
c0008508:	8d 45 de             	lea    -0x22(%ebp),%eax
c000850b:	50                   	push   %eax
c000850c:	e8 ad d4 ff ff       	call   c00059be <open>
c0008511:	83 c4 10             	add    $0x10,%esp
c0008514:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008517:	83 ec 0c             	sub    $0xc,%esp
c000851a:	68 8b b9 00 c0       	push   $0xc000b98b
c000851f:	e8 1a 0e 00 00       	call   c000933e <Printf>
c0008524:	83 c4 10             	add    $0x10,%esp
c0008527:	83 ec 0c             	sub    $0xc,%esp
c000852a:	6a 0a                	push   $0xa
c000852c:	e8 93 9f ff ff       	call   c00024c4 <sys_malloc>
c0008531:	83 c4 10             	add    $0x10,%esp
c0008534:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008537:	83 ec 04             	sub    $0x4,%esp
c000853a:	6a 0a                	push   $0xa
c000853c:	6a 00                	push   $0x0
c000853e:	ff 75 ec             	pushl  -0x14(%ebp)
c0008541:	e8 f9 38 00 00       	call   c000be3f <Memset>
c0008546:	83 c4 10             	add    $0x10,%esp
c0008549:	83 ec 04             	sub    $0x4,%esp
c000854c:	6a 0a                	push   $0xa
c000854e:	ff 75 ec             	pushl  -0x14(%ebp)
c0008551:	ff 75 f0             	pushl  -0x10(%ebp)
c0008554:	e8 fa d4 ff ff       	call   c0005a53 <read>
c0008559:	83 c4 10             	add    $0x10,%esp
c000855c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000855f:	83 ec 08             	sub    $0x8,%esp
c0008562:	ff 75 ec             	pushl  -0x14(%ebp)
c0008565:	68 9d b9 00 c0       	push   $0xc000b99d
c000856a:	e8 cf 0d 00 00       	call   c000933e <Printf>
c000856f:	83 c4 10             	add    $0x10,%esp
c0008572:	eb c3                	jmp    c0008537 <TestTTY+0x62>

c0008574 <TestFS>:
c0008574:	55                   	push   %ebp
c0008575:	89 e5                	mov    %esp,%ebp
c0008577:	81 ec 28 01 00 00    	sub    $0x128,%esp
c000857d:	83 ec 0c             	sub    $0xc,%esp
c0008580:	68 a7 b9 00 c0       	push   $0xc000b9a7
c0008585:	e8 02 8b ff ff       	call   c000108c <disp_str>
c000858a:	83 c4 10             	add    $0x10,%esp
c000858d:	c7 45 be 64 65 76 5f 	movl   $0x5f766564,-0x42(%ebp)
c0008594:	c7 45 c2 74 74 79 31 	movl   $0x31797474,-0x3e(%ebp)
c000859b:	66 c7 45 c6 00 00    	movw   $0x0,-0x3a(%ebp)
c00085a1:	66 87 db             	xchg   %bx,%bx
c00085a4:	83 ec 08             	sub    $0x8,%esp
c00085a7:	6a 02                	push   $0x2
c00085a9:	8d 45 be             	lea    -0x42(%ebp),%eax
c00085ac:	50                   	push   %eax
c00085ad:	e8 0c d4 ff ff       	call   c00059be <open>
c00085b2:	83 c4 10             	add    $0x10,%esp
c00085b5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00085b8:	66 87 db             	xchg   %bx,%bx
c00085bb:	83 ec 08             	sub    $0x8,%esp
c00085be:	6a 02                	push   $0x2
c00085c0:	8d 45 be             	lea    -0x42(%ebp),%eax
c00085c3:	50                   	push   %eax
c00085c4:	e8 f5 d3 ff ff       	call   c00059be <open>
c00085c9:	83 c4 10             	add    $0x10,%esp
c00085cc:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00085cf:	66 87 db             	xchg   %bx,%bx
c00085d2:	83 ec 0c             	sub    $0xc,%esp
c00085d5:	68 8b b9 00 c0       	push   $0xc000b98b
c00085da:	e8 5f 0d 00 00       	call   c000933e <Printf>
c00085df:	83 c4 10             	add    $0x10,%esp
c00085e2:	66 87 db             	xchg   %bx,%bx
c00085e5:	c7 45 b9 41 43 00 00 	movl   $0x4341,-0x47(%ebp)
c00085ec:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
c00085f0:	c7 45 b4 63 41 42 00 	movl   $0x424163,-0x4c(%ebp)
c00085f7:	c6 45 b8 00          	movb   $0x0,-0x48(%ebp)
c00085fb:	c7 45 aa 49 4e 54 45 	movl   $0x45544e49,-0x56(%ebp)
c0008602:	c7 45 ae 52 52 55 50 	movl   $0x50555252,-0x52(%ebp)
c0008609:	66 c7 45 b2 54 00    	movw   $0x54,-0x4e(%ebp)
c000860f:	66 87 db             	xchg   %bx,%bx
c0008612:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c0008619:	66 87 db             	xchg   %bx,%bx
c000861c:	83 ec 0c             	sub    $0xc,%esp
c000861f:	68 af b9 00 c0       	push   $0xc000b9af
c0008624:	e8 15 0d 00 00       	call   c000933e <Printf>
c0008629:	83 c4 10             	add    $0x10,%esp
c000862c:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c0008630:	0f 85 43 03 00 00    	jne    c0008979 <TestFS+0x405>
c0008636:	83 ec 08             	sub    $0x8,%esp
c0008639:	6a 07                	push   $0x7
c000863b:	8d 45 b9             	lea    -0x47(%ebp),%eax
c000863e:	50                   	push   %eax
c000863f:	e8 7a d3 ff ff       	call   c00059be <open>
c0008644:	83 c4 10             	add    $0x10,%esp
c0008647:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000864a:	83 ec 08             	sub    $0x8,%esp
c000864d:	ff 75 e4             	pushl  -0x1c(%ebp)
c0008650:	68 c7 b9 00 c0       	push   $0xc000b9c7
c0008655:	e8 e4 0c 00 00       	call   c000933e <Printf>
c000865a:	83 c4 10             	add    $0x10,%esp
c000865d:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0008664:	c7 45 96 63 67 3a 68 	movl   $0x683a6763,-0x6a(%ebp)
c000866b:	c7 45 9a 65 6c 6c 6f 	movl   $0x6f6c6c65,-0x66(%ebp)
c0008672:	c7 45 9e 2c 77 6f 72 	movl   $0x726f772c,-0x62(%ebp)
c0008679:	c7 45 a2 6c 64 21 00 	movl   $0x21646c,-0x5e(%ebp)
c0008680:	c7 45 a6 00 00 00 00 	movl   $0x0,-0x5a(%ebp)
c0008687:	83 ec 0c             	sub    $0xc,%esp
c000868a:	8d 45 96             	lea    -0x6a(%ebp),%eax
c000868d:	50                   	push   %eax
c000868e:	e8 e5 37 00 00       	call   c000be78 <Strlen>
c0008693:	83 c4 10             	add    $0x10,%esp
c0008696:	83 ec 04             	sub    $0x4,%esp
c0008699:	50                   	push   %eax
c000869a:	8d 45 96             	lea    -0x6a(%ebp),%eax
c000869d:	50                   	push   %eax
c000869e:	ff 75 e4             	pushl  -0x1c(%ebp)
c00086a1:	e8 2e d5 ff ff       	call   c0005bd4 <write>
c00086a6:	83 c4 10             	add    $0x10,%esp
c00086a9:	83 ec 04             	sub    $0x4,%esp
c00086ac:	6a 14                	push   $0x14
c00086ae:	6a 00                	push   $0x0
c00086b0:	8d 45 82             	lea    -0x7e(%ebp),%eax
c00086b3:	50                   	push   %eax
c00086b4:	e8 86 37 00 00       	call   c000be3f <Memset>
c00086b9:	83 c4 10             	add    $0x10,%esp
c00086bc:	83 ec 04             	sub    $0x4,%esp
c00086bf:	6a 12                	push   $0x12
c00086c1:	8d 45 82             	lea    -0x7e(%ebp),%eax
c00086c4:	50                   	push   %eax
c00086c5:	ff 75 e4             	pushl  -0x1c(%ebp)
c00086c8:	e8 86 d3 ff ff       	call   c0005a53 <read>
c00086cd:	83 c4 10             	add    $0x10,%esp
c00086d0:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00086d3:	83 ec 08             	sub    $0x8,%esp
c00086d6:	8d 45 82             	lea    -0x7e(%ebp),%eax
c00086d9:	50                   	push   %eax
c00086da:	68 d0 b9 00 c0       	push   $0xc000b9d0
c00086df:	e8 5a 0c 00 00       	call   c000933e <Printf>
c00086e4:	83 c4 10             	add    $0x10,%esp
c00086e7:	66 87 db             	xchg   %bx,%bx
c00086ea:	83 ec 0c             	sub    $0xc,%esp
c00086ed:	6a 0a                	push   $0xa
c00086ef:	e8 16 0b 00 00       	call   c000920a <delay>
c00086f4:	83 c4 10             	add    $0x10,%esp
c00086f7:	83 ec 08             	sub    $0x8,%esp
c00086fa:	6a 07                	push   $0x7
c00086fc:	8d 45 b4             	lea    -0x4c(%ebp),%eax
c00086ff:	50                   	push   %eax
c0008700:	e8 b9 d2 ff ff       	call   c00059be <open>
c0008705:	83 c4 10             	add    $0x10,%esp
c0008708:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000870b:	83 ec 08             	sub    $0x8,%esp
c000870e:	ff 75 dc             	pushl  -0x24(%ebp)
c0008711:	68 db b9 00 c0       	push   $0xc000b9db
c0008716:	e8 23 0c 00 00       	call   c000933e <Printf>
c000871b:	83 c4 10             	add    $0x10,%esp
c000871e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0008725:	c7 85 6e ff ff ff 63 	movl   $0x683a6763,-0x92(%ebp)
c000872c:	67 3a 68 
c000872f:	c7 85 72 ff ff ff 6f 	movl   $0x6120776f,-0x8e(%ebp)
c0008736:	77 20 61 
c0008739:	c7 85 76 ff ff ff 72 	movl   $0x79206572,-0x8a(%ebp)
c0008740:	65 20 79 
c0008743:	c7 85 7a ff ff ff 6f 	movl   $0x3f756f,-0x86(%ebp)
c000874a:	75 3f 00 
c000874d:	c7 85 7e ff ff ff 00 	movl   $0x0,-0x82(%ebp)
c0008754:	00 00 00 
c0008757:	83 ec 0c             	sub    $0xc,%esp
c000875a:	8d 85 6e ff ff ff    	lea    -0x92(%ebp),%eax
c0008760:	50                   	push   %eax
c0008761:	e8 12 37 00 00       	call   c000be78 <Strlen>
c0008766:	83 c4 10             	add    $0x10,%esp
c0008769:	83 ec 04             	sub    $0x4,%esp
c000876c:	50                   	push   %eax
c000876d:	8d 85 6e ff ff ff    	lea    -0x92(%ebp),%eax
c0008773:	50                   	push   %eax
c0008774:	ff 75 dc             	pushl  -0x24(%ebp)
c0008777:	e8 58 d4 ff ff       	call   c0005bd4 <write>
c000877c:	83 c4 10             	add    $0x10,%esp
c000877f:	83 ec 04             	sub    $0x4,%esp
c0008782:	6a 14                	push   $0x14
c0008784:	6a 00                	push   $0x0
c0008786:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c000878c:	50                   	push   %eax
c000878d:	e8 ad 36 00 00       	call   c000be3f <Memset>
c0008792:	83 c4 10             	add    $0x10,%esp
c0008795:	83 ec 04             	sub    $0x4,%esp
c0008798:	6a 12                	push   $0x12
c000879a:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c00087a0:	50                   	push   %eax
c00087a1:	ff 75 dc             	pushl  -0x24(%ebp)
c00087a4:	e8 aa d2 ff ff       	call   c0005a53 <read>
c00087a9:	83 c4 10             	add    $0x10,%esp
c00087ac:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00087af:	83 ec 08             	sub    $0x8,%esp
c00087b2:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c00087b8:	50                   	push   %eax
c00087b9:	68 e5 b9 00 c0       	push   $0xc000b9e5
c00087be:	e8 7b 0b 00 00       	call   c000933e <Printf>
c00087c3:	83 c4 10             	add    $0x10,%esp
c00087c6:	83 ec 08             	sub    $0x8,%esp
c00087c9:	6a 07                	push   $0x7
c00087cb:	8d 45 aa             	lea    -0x56(%ebp),%eax
c00087ce:	50                   	push   %eax
c00087cf:	e8 ea d1 ff ff       	call   c00059be <open>
c00087d4:	83 c4 10             	add    $0x10,%esp
c00087d7:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00087da:	83 ec 08             	sub    $0x8,%esp
c00087dd:	ff 75 dc             	pushl  -0x24(%ebp)
c00087e0:	68 db b9 00 c0       	push   $0xc000b9db
c00087e5:	e8 54 0b 00 00       	call   c000933e <Printf>
c00087ea:	83 c4 10             	add    $0x10,%esp
c00087ed:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00087f4:	c7 85 3c ff ff ff 49 	movl   $0x69772049,-0xc4(%ebp)
c00087fb:	20 77 69 
c00087fe:	c7 85 40 ff ff ff 6c 	movl   $0x73206c6c,-0xc0(%ebp)
c0008805:	6c 20 73 
c0008808:	c7 85 44 ff ff ff 75 	movl   $0x65636375,-0xbc(%ebp)
c000880f:	63 63 65 
c0008812:	c7 85 48 ff ff ff 73 	movl   $0x61207373,-0xb8(%ebp)
c0008819:	73 20 61 
c000881c:	c7 85 4c ff ff ff 74 	movl   $0x616c2074,-0xb4(%ebp)
c0008823:	20 6c 61 
c0008826:	c7 85 50 ff ff ff 73 	movl   $0x2e7473,-0xb0(%ebp)
c000882d:	74 2e 00 
c0008830:	c7 85 54 ff ff ff 00 	movl   $0x0,-0xac(%ebp)
c0008837:	00 00 00 
c000883a:	66 c7 85 58 ff ff ff 	movw   $0x0,-0xa8(%ebp)
c0008841:	00 00 
c0008843:	83 ec 0c             	sub    $0xc,%esp
c0008846:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c000884c:	50                   	push   %eax
c000884d:	e8 26 36 00 00       	call   c000be78 <Strlen>
c0008852:	83 c4 10             	add    $0x10,%esp
c0008855:	83 ec 04             	sub    $0x4,%esp
c0008858:	50                   	push   %eax
c0008859:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c000885f:	50                   	push   %eax
c0008860:	ff 75 d4             	pushl  -0x2c(%ebp)
c0008863:	e8 6c d3 ff ff       	call   c0005bd4 <write>
c0008868:	83 c4 10             	add    $0x10,%esp
c000886b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008872:	eb 5c                	jmp    c00088d0 <TestFS+0x35c>
c0008874:	83 ec 04             	sub    $0x4,%esp
c0008877:	6a 1e                	push   $0x1e
c0008879:	6a 00                	push   $0x0
c000887b:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c0008881:	50                   	push   %eax
c0008882:	e8 b8 35 00 00       	call   c000be3f <Memset>
c0008887:	83 c4 10             	add    $0x10,%esp
c000888a:	83 ec 0c             	sub    $0xc,%esp
c000888d:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c0008893:	50                   	push   %eax
c0008894:	e8 df 35 00 00       	call   c000be78 <Strlen>
c0008899:	83 c4 10             	add    $0x10,%esp
c000889c:	83 ec 04             	sub    $0x4,%esp
c000889f:	50                   	push   %eax
c00088a0:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c00088a6:	50                   	push   %eax
c00088a7:	ff 75 d4             	pushl  -0x2c(%ebp)
c00088aa:	e8 a4 d1 ff ff       	call   c0005a53 <read>
c00088af:	83 c4 10             	add    $0x10,%esp
c00088b2:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00088b5:	83 ec 08             	sub    $0x8,%esp
c00088b8:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c00088be:	50                   	push   %eax
c00088bf:	68 f0 b9 00 c0       	push   $0xc000b9f0
c00088c4:	e8 75 0a 00 00       	call   c000933e <Printf>
c00088c9:	83 c4 10             	add    $0x10,%esp
c00088cc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00088d0:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c00088d4:	7e 9e                	jle    c0008874 <TestFS+0x300>
c00088d6:	c7 85 0a ff ff ff 69 	movl   $0x74736e69,-0xf6(%ebp)
c00088dd:	6e 73 74 
c00088e0:	c7 85 0e ff ff ff 61 	movl   $0x2e6c6c61,-0xf2(%ebp)
c00088e7:	6c 6c 2e 
c00088ea:	c7 85 12 ff ff ff 74 	movl   $0x726174,-0xee(%ebp)
c00088f1:	61 72 00 
c00088f4:	c7 85 16 ff ff ff 00 	movl   $0x0,-0xea(%ebp)
c00088fb:	00 00 00 
c00088fe:	c7 85 1a ff ff ff 00 	movl   $0x0,-0xe6(%ebp)
c0008905:	00 00 00 
c0008908:	83 ec 08             	sub    $0x8,%esp
c000890b:	6a 00                	push   $0x0
c000890d:	8d 85 0a ff ff ff    	lea    -0xf6(%ebp),%eax
c0008913:	50                   	push   %eax
c0008914:	e8 a5 d0 ff ff       	call   c00059be <open>
c0008919:	83 c4 10             	add    $0x10,%esp
c000891c:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000891f:	83 ec 08             	sub    $0x8,%esp
c0008922:	ff 75 cc             	pushl  -0x34(%ebp)
c0008925:	68 fb b9 00 c0       	push   $0xc000b9fb
c000892a:	e8 0f 0a 00 00       	call   c000933e <Printf>
c000892f:	83 c4 10             	add    $0x10,%esp
c0008932:	83 ec 04             	sub    $0x4,%esp
c0008935:	6a 28                	push   $0x28
c0008937:	6a 00                	push   $0x0
c0008939:	8d 85 e2 fe ff ff    	lea    -0x11e(%ebp),%eax
c000893f:	50                   	push   %eax
c0008940:	e8 fa 34 00 00       	call   c000be3f <Memset>
c0008945:	83 c4 10             	add    $0x10,%esp
c0008948:	83 ec 04             	sub    $0x4,%esp
c000894b:	6a 28                	push   $0x28
c000894d:	8d 85 e2 fe ff ff    	lea    -0x11e(%ebp),%eax
c0008953:	50                   	push   %eax
c0008954:	ff 75 cc             	pushl  -0x34(%ebp)
c0008957:	e8 f7 d0 ff ff       	call   c0005a53 <read>
c000895c:	83 c4 10             	add    $0x10,%esp
c000895f:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0008962:	83 ec 08             	sub    $0x8,%esp
c0008965:	8d 85 e2 fe ff ff    	lea    -0x11e(%ebp),%eax
c000896b:	50                   	push   %eax
c000896c:	68 05 ba 00 c0       	push   $0xc000ba05
c0008971:	e8 c8 09 00 00       	call   c000933e <Printf>
c0008976:	83 c4 10             	add    $0x10,%esp
c0008979:	90                   	nop
c000897a:	c9                   	leave  
c000897b:	c3                   	ret    

c000897c <wait_exit>:
c000897c:	55                   	push   %ebp
c000897d:	89 e5                	mov    %esp,%ebp
c000897f:	83 ec 28             	sub    $0x28,%esp
c0008982:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0008989:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0008990:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0008996:	83 ec 08             	sub    $0x8,%esp
c0008999:	6a 02                	push   $0x2
c000899b:	8d 45 de             	lea    -0x22(%ebp),%eax
c000899e:	50                   	push   %eax
c000899f:	e8 1a d0 ff ff       	call   c00059be <open>
c00089a4:	83 c4 10             	add    $0x10,%esp
c00089a7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00089aa:	83 ec 08             	sub    $0x8,%esp
c00089ad:	6a 02                	push   $0x2
c00089af:	8d 45 de             	lea    -0x22(%ebp),%eax
c00089b2:	50                   	push   %eax
c00089b3:	e8 06 d0 ff ff       	call   c00059be <open>
c00089b8:	83 c4 10             	add    $0x10,%esp
c00089bb:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00089be:	e8 5b d3 ff ff       	call   c0005d1e <fork>
c00089c3:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00089c6:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c00089ca:	7e 25                	jle    c00089f1 <wait_exit+0x75>
c00089cc:	83 ec 0c             	sub    $0xc,%esp
c00089cf:	8d 45 d8             	lea    -0x28(%ebp),%eax
c00089d2:	50                   	push   %eax
c00089d3:	e8 d3 d2 ff ff       	call   c0005cab <wait>
c00089d8:	83 c4 10             	add    $0x10,%esp
c00089db:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00089de:	83 ec 08             	sub    $0x8,%esp
c00089e1:	50                   	push   %eax
c00089e2:	68 10 ba 00 c0       	push   $0xc000ba10
c00089e7:	e8 52 09 00 00       	call   c000933e <Printf>
c00089ec:	83 c4 10             	add    $0x10,%esp
c00089ef:	eb fe                	jmp    c00089ef <wait_exit+0x73>
c00089f1:	83 ec 0c             	sub    $0xc,%esp
c00089f4:	68 2b ba 00 c0       	push   $0xc000ba2b
c00089f9:	e8 40 09 00 00       	call   c000933e <Printf>
c00089fe:	83 c4 10             	add    $0x10,%esp
c0008a01:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008a08:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008a0b:	8d 50 01             	lea    0x1(%eax),%edx
c0008a0e:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0008a11:	3d 50 c3 00 00       	cmp    $0xc350,%eax
c0008a16:	7f 02                	jg     c0008a1a <wait_exit+0x9e>
c0008a18:	eb ee                	jmp    c0008a08 <wait_exit+0x8c>
c0008a1a:	90                   	nop
c0008a1b:	83 ec 0c             	sub    $0xc,%esp
c0008a1e:	68 37 ba 00 c0       	push   $0xc000ba37
c0008a23:	e8 16 09 00 00       	call   c000933e <Printf>
c0008a28:	83 c4 10             	add    $0x10,%esp
c0008a2b:	83 ec 0c             	sub    $0xc,%esp
c0008a2e:	6a 09                	push   $0x9
c0008a30:	e8 ba d2 ff ff       	call   c0005cef <exit>
c0008a35:	83 c4 10             	add    $0x10,%esp
c0008a38:	83 ec 0c             	sub    $0xc,%esp
c0008a3b:	68 45 ba 00 c0       	push   $0xc000ba45
c0008a40:	e8 f9 08 00 00       	call   c000933e <Printf>
c0008a45:	83 c4 10             	add    $0x10,%esp
c0008a48:	eb fe                	jmp    c0008a48 <wait_exit+0xcc>

c0008a4a <INIT_fork>:
c0008a4a:	55                   	push   %ebp
c0008a4b:	89 e5                	mov    %esp,%ebp
c0008a4d:	83 ec 78             	sub    $0x78,%esp
c0008a50:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0008a57:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0008a5e:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0008a64:	83 ec 08             	sub    $0x8,%esp
c0008a67:	6a 02                	push   $0x2
c0008a69:	8d 45 de             	lea    -0x22(%ebp),%eax
c0008a6c:	50                   	push   %eax
c0008a6d:	e8 4c cf ff ff       	call   c00059be <open>
c0008a72:	83 c4 10             	add    $0x10,%esp
c0008a75:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008a78:	83 ec 08             	sub    $0x8,%esp
c0008a7b:	6a 02                	push   $0x2
c0008a7d:	8d 45 de             	lea    -0x22(%ebp),%eax
c0008a80:	50                   	push   %eax
c0008a81:	e8 38 cf ff ff       	call   c00059be <open>
c0008a86:	83 c4 10             	add    $0x10,%esp
c0008a89:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008a8c:	c7 45 b6 49 4e 49 54 	movl   $0x54494e49,-0x4a(%ebp)
c0008a93:	c7 45 ba 20 69 73 20 	movl   $0x20736920,-0x46(%ebp)
c0008a9a:	c7 45 be 72 75 6e 6e 	movl   $0x6e6e7572,-0x42(%ebp)
c0008aa1:	c7 45 c2 69 6e 67 0a 	movl   $0xa676e69,-0x3e(%ebp)
c0008aa8:	c7 45 c6 00 00 00 00 	movl   $0x0,-0x3a(%ebp)
c0008aaf:	c7 45 ca 00 00 00 00 	movl   $0x0,-0x36(%ebp)
c0008ab6:	c7 45 ce 00 00 00 00 	movl   $0x0,-0x32(%ebp)
c0008abd:	c7 45 d2 00 00 00 00 	movl   $0x0,-0x2e(%ebp)
c0008ac4:	c7 45 d6 00 00 00 00 	movl   $0x0,-0x2a(%ebp)
c0008acb:	c7 45 da 00 00 00 00 	movl   $0x0,-0x26(%ebp)
c0008ad2:	83 ec 0c             	sub    $0xc,%esp
c0008ad5:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008ad8:	50                   	push   %eax
c0008ad9:	e8 60 08 00 00       	call   c000933e <Printf>
c0008ade:	83 c4 10             	add    $0x10,%esp
c0008ae1:	83 ec 0c             	sub    $0xc,%esp
c0008ae4:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008ae7:	50                   	push   %eax
c0008ae8:	e8 8b 33 00 00       	call   c000be78 <Strlen>
c0008aed:	83 c4 10             	add    $0x10,%esp
c0008af0:	83 ec 04             	sub    $0x4,%esp
c0008af3:	50                   	push   %eax
c0008af4:	6a 00                	push   $0x0
c0008af6:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008af9:	50                   	push   %eax
c0008afa:	e8 40 33 00 00       	call   c000be3f <Memset>
c0008aff:	83 c4 10             	add    $0x10,%esp
c0008b02:	83 ec 04             	sub    $0x4,%esp
c0008b05:	6a 28                	push   $0x28
c0008b07:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008b0a:	50                   	push   %eax
c0008b0b:	ff 75 f0             	pushl  -0x10(%ebp)
c0008b0e:	e8 40 cf ff ff       	call   c0005a53 <read>
c0008b13:	83 c4 10             	add    $0x10,%esp
c0008b16:	83 ec 0c             	sub    $0xc,%esp
c0008b19:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008b1c:	50                   	push   %eax
c0008b1d:	e8 1c 08 00 00       	call   c000933e <Printf>
c0008b22:	83 c4 10             	add    $0x10,%esp
c0008b25:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0008b2c:	e8 ed d1 ff ff       	call   c0005d1e <fork>
c0008b31:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008b34:	66 87 db             	xchg   %bx,%bx
c0008b37:	83 ec 0c             	sub    $0xc,%esp
c0008b3a:	6a 01                	push   $0x1
c0008b3c:	e8 c9 06 00 00       	call   c000920a <delay>
c0008b41:	83 c4 10             	add    $0x10,%esp
c0008b44:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0008b48:	0f 8e c5 00 00 00    	jle    c0008c13 <INIT_fork+0x1c9>
c0008b4e:	83 ec 0c             	sub    $0xc,%esp
c0008b51:	68 53 ba 00 c0       	push   $0xc000ba53
c0008b56:	e8 e3 07 00 00       	call   c000933e <Printf>
c0008b5b:	83 c4 10             	add    $0x10,%esp
c0008b5e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0008b62:	c7 45 8e 50 61 72 65 	movl   $0x65726150,-0x72(%ebp)
c0008b69:	c7 45 92 6e 74 2e 4e 	movl   $0x4e2e746e,-0x6e(%ebp)
c0008b70:	c7 45 96 69 63 65 20 	movl   $0x20656369,-0x6a(%ebp)
c0008b77:	c7 45 9a 74 6f 20 6d 	movl   $0x6d206f74,-0x66(%ebp)
c0008b7e:	c7 45 9e 65 65 74 20 	movl   $0x20746565,-0x62(%ebp)
c0008b85:	c7 45 a2 79 6f 75 21 	movl   $0x21756f79,-0x5e(%ebp)
c0008b8c:	c7 45 a6 0a 00 00 00 	movl   $0xa,-0x5a(%ebp)
c0008b93:	c7 45 aa 00 00 00 00 	movl   $0x0,-0x56(%ebp)
c0008b9a:	c7 45 ae 00 00 00 00 	movl   $0x0,-0x52(%ebp)
c0008ba1:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)
c0008ba8:	83 ec 0c             	sub    $0xc,%esp
c0008bab:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008bae:	50                   	push   %eax
c0008baf:	e8 c4 32 00 00       	call   c000be78 <Strlen>
c0008bb4:	83 c4 10             	add    $0x10,%esp
c0008bb7:	83 ec 04             	sub    $0x4,%esp
c0008bba:	50                   	push   %eax
c0008bbb:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008bbe:	50                   	push   %eax
c0008bbf:	ff 75 f4             	pushl  -0xc(%ebp)
c0008bc2:	e8 0d d0 ff ff       	call   c0005bd4 <write>
c0008bc7:	83 c4 10             	add    $0x10,%esp
c0008bca:	83 ec 0c             	sub    $0xc,%esp
c0008bcd:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008bd0:	50                   	push   %eax
c0008bd1:	e8 a2 32 00 00       	call   c000be78 <Strlen>
c0008bd6:	83 c4 10             	add    $0x10,%esp
c0008bd9:	83 ec 04             	sub    $0x4,%esp
c0008bdc:	50                   	push   %eax
c0008bdd:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008be0:	50                   	push   %eax
c0008be1:	ff 75 f4             	pushl  -0xc(%ebp)
c0008be4:	e8 eb cf ff ff       	call   c0005bd4 <write>
c0008be9:	83 c4 10             	add    $0x10,%esp
c0008bec:	83 ec 0c             	sub    $0xc,%esp
c0008bef:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008bf2:	50                   	push   %eax
c0008bf3:	e8 80 32 00 00       	call   c000be78 <Strlen>
c0008bf8:	83 c4 10             	add    $0x10,%esp
c0008bfb:	83 ec 04             	sub    $0x4,%esp
c0008bfe:	50                   	push   %eax
c0008bff:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008c02:	50                   	push   %eax
c0008c03:	ff 75 f4             	pushl  -0xc(%ebp)
c0008c06:	e8 c9 cf ff ff       	call   c0005bd4 <write>
c0008c0b:	83 c4 10             	add    $0x10,%esp
c0008c0e:	e9 c6 00 00 00       	jmp    c0008cd9 <INIT_fork+0x28f>
c0008c13:	83 ec 0c             	sub    $0xc,%esp
c0008c16:	6a 01                	push   $0x1
c0008c18:	e8 ed 05 00 00       	call   c000920a <delay>
c0008c1d:	83 c4 10             	add    $0x10,%esp
c0008c20:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0008c24:	83 45 ec 02          	addl   $0x2,-0x14(%ebp)
c0008c28:	c7 45 8e 43 68 69 6c 	movl   $0x6c696843,-0x72(%ebp)
c0008c2f:	c7 45 92 64 2e 53 65 	movl   $0x65532e64,-0x6e(%ebp)
c0008c36:	c7 45 96 65 20 79 6f 	movl   $0x6f792065,-0x6a(%ebp)
c0008c3d:	c7 45 9a 75 20 61 67 	movl   $0x67612075,-0x66(%ebp)
c0008c44:	c7 45 9e 61 69 6e 0a 	movl   $0xa6e6961,-0x62(%ebp)
c0008c4b:	c7 45 a2 00 00 00 00 	movl   $0x0,-0x5e(%ebp)
c0008c52:	c7 45 a6 00 00 00 00 	movl   $0x0,-0x5a(%ebp)
c0008c59:	c7 45 aa 00 00 00 00 	movl   $0x0,-0x56(%ebp)
c0008c60:	c7 45 ae 00 00 00 00 	movl   $0x0,-0x52(%ebp)
c0008c67:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)
c0008c6e:	66 87 db             	xchg   %bx,%bx
c0008c71:	83 ec 0c             	sub    $0xc,%esp
c0008c74:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008c77:	50                   	push   %eax
c0008c78:	e8 fb 31 00 00       	call   c000be78 <Strlen>
c0008c7d:	83 c4 10             	add    $0x10,%esp
c0008c80:	83 ec 04             	sub    $0x4,%esp
c0008c83:	50                   	push   %eax
c0008c84:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008c87:	50                   	push   %eax
c0008c88:	ff 75 f4             	pushl  -0xc(%ebp)
c0008c8b:	e8 44 cf ff ff       	call   c0005bd4 <write>
c0008c90:	83 c4 10             	add    $0x10,%esp
c0008c93:	83 ec 0c             	sub    $0xc,%esp
c0008c96:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008c99:	50                   	push   %eax
c0008c9a:	e8 d9 31 00 00       	call   c000be78 <Strlen>
c0008c9f:	83 c4 10             	add    $0x10,%esp
c0008ca2:	83 ec 04             	sub    $0x4,%esp
c0008ca5:	50                   	push   %eax
c0008ca6:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008ca9:	50                   	push   %eax
c0008caa:	ff 75 f4             	pushl  -0xc(%ebp)
c0008cad:	e8 22 cf ff ff       	call   c0005bd4 <write>
c0008cb2:	83 c4 10             	add    $0x10,%esp
c0008cb5:	83 ec 0c             	sub    $0xc,%esp
c0008cb8:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008cbb:	50                   	push   %eax
c0008cbc:	e8 b7 31 00 00       	call   c000be78 <Strlen>
c0008cc1:	83 c4 10             	add    $0x10,%esp
c0008cc4:	83 ec 04             	sub    $0x4,%esp
c0008cc7:	50                   	push   %eax
c0008cc8:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008ccb:	50                   	push   %eax
c0008ccc:	ff 75 f4             	pushl  -0xc(%ebp)
c0008ccf:	e8 00 cf ff ff       	call   c0005bd4 <write>
c0008cd4:	83 c4 10             	add    $0x10,%esp
c0008cd7:	eb fe                	jmp    c0008cd7 <INIT_fork+0x28d>
c0008cd9:	83 ec 04             	sub    $0x4,%esp
c0008cdc:	6a 28                	push   $0x28
c0008cde:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008ce1:	50                   	push   %eax
c0008ce2:	ff 75 f0             	pushl  -0x10(%ebp)
c0008ce5:	e8 69 cd ff ff       	call   c0005a53 <read>
c0008cea:	83 c4 10             	add    $0x10,%esp
c0008ced:	83 ec 0c             	sub    $0xc,%esp
c0008cf0:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008cf3:	50                   	push   %eax
c0008cf4:	e8 45 06 00 00       	call   c000933e <Printf>
c0008cf9:	83 c4 10             	add    $0x10,%esp
c0008cfc:	83 ec 0c             	sub    $0xc,%esp
c0008cff:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008d02:	50                   	push   %eax
c0008d03:	e8 36 06 00 00       	call   c000933e <Printf>
c0008d08:	83 c4 10             	add    $0x10,%esp
c0008d0b:	83 ec 0c             	sub    $0xc,%esp
c0008d0e:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008d11:	50                   	push   %eax
c0008d12:	e8 27 06 00 00       	call   c000933e <Printf>
c0008d17:	83 c4 10             	add    $0x10,%esp
c0008d1a:	83 ec 0c             	sub    $0xc,%esp
c0008d1d:	68 59 ba 00 c0       	push   $0xc000ba59
c0008d22:	e8 30 09 00 00       	call   c0009657 <spin>
c0008d27:	83 c4 10             	add    $0x10,%esp
c0008d2a:	90                   	nop
c0008d2b:	c9                   	leave  
c0008d2c:	c3                   	ret    

c0008d2d <simple_shell>:
c0008d2d:	55                   	push   %ebp
c0008d2e:	89 e5                	mov    %esp,%ebp
c0008d30:	81 ec f8 00 00 00    	sub    $0xf8,%esp
c0008d36:	c7 45 c2 64 65 76 5f 	movl   $0x5f766564,-0x3e(%ebp)
c0008d3d:	c7 45 c6 74 74 79 31 	movl   $0x31797474,-0x3a(%ebp)
c0008d44:	66 c7 45 ca 00 00    	movw   $0x0,-0x36(%ebp)
c0008d4a:	83 ec 08             	sub    $0x8,%esp
c0008d4d:	6a 02                	push   $0x2
c0008d4f:	8d 45 c2             	lea    -0x3e(%ebp),%eax
c0008d52:	50                   	push   %eax
c0008d53:	e8 66 cc ff ff       	call   c00059be <open>
c0008d58:	83 c4 10             	add    $0x10,%esp
c0008d5b:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0008d5e:	83 ec 08             	sub    $0x8,%esp
c0008d61:	6a 02                	push   $0x2
c0008d63:	8d 45 c2             	lea    -0x3e(%ebp),%eax
c0008d66:	50                   	push   %eax
c0008d67:	e8 52 cc ff ff       	call   c00059be <open>
c0008d6c:	83 c4 10             	add    $0x10,%esp
c0008d6f:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0008d72:	83 ec 04             	sub    $0x4,%esp
c0008d75:	68 80 00 00 00       	push   $0x80
c0008d7a:	6a 00                	push   $0x0
c0008d7c:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c0008d82:	50                   	push   %eax
c0008d83:	e8 b7 30 00 00       	call   c000be3f <Memset>
c0008d88:	83 c4 10             	add    $0x10,%esp
c0008d8b:	83 ec 04             	sub    $0x4,%esp
c0008d8e:	68 80 00 00 00       	push   $0x80
c0008d93:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c0008d99:	50                   	push   %eax
c0008d9a:	ff 75 e0             	pushl  -0x20(%ebp)
c0008d9d:	e8 b1 cc ff ff       	call   c0005a53 <read>
c0008da2:	83 c4 10             	add    $0x10,%esp
c0008da5:	83 ec 08             	sub    $0x8,%esp
c0008da8:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c0008dae:	50                   	push   %eax
c0008daf:	68 61 ba 00 c0       	push   $0xc000ba61
c0008db4:	e8 85 05 00 00       	call   c000933e <Printf>
c0008db9:	83 c4 10             	add    $0x10,%esp
c0008dbc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008dc3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0008dca:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c0008dd0:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008dd3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008dd6:	0f b6 00             	movzbl (%eax),%eax
c0008dd9:	88 45 db             	mov    %al,-0x25(%ebp)
c0008ddc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008ddf:	0f b6 00             	movzbl (%eax),%eax
c0008de2:	3c 20                	cmp    $0x20,%al
c0008de4:	74 1d                	je     c0008e03 <simple_shell+0xd6>
c0008de6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008de9:	0f b6 00             	movzbl (%eax),%eax
c0008dec:	84 c0                	test   %al,%al
c0008dee:	74 13                	je     c0008e03 <simple_shell+0xd6>
c0008df0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0008df4:	75 0d                	jne    c0008e03 <simple_shell+0xd6>
c0008df6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008df9:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008dfc:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0008e03:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008e06:	0f b6 00             	movzbl (%eax),%eax
c0008e09:	3c 20                	cmp    $0x20,%al
c0008e0b:	74 0a                	je     c0008e17 <simple_shell+0xea>
c0008e0d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008e10:	0f b6 00             	movzbl (%eax),%eax
c0008e13:	84 c0                	test   %al,%al
c0008e15:	75 26                	jne    c0008e3d <simple_shell+0x110>
c0008e17:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
c0008e1b:	75 20                	jne    c0008e3d <simple_shell+0x110>
c0008e1d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008e20:	8d 50 01             	lea    0x1(%eax),%edx
c0008e23:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0008e26:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0008e29:	89 94 85 14 ff ff ff 	mov    %edx,-0xec(%ebp,%eax,4)
c0008e30:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008e33:	c6 00 00             	movb   $0x0,(%eax)
c0008e36:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0008e3d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0008e41:	80 7d db 00          	cmpb   $0x0,-0x25(%ebp)
c0008e45:	75 8c                	jne    c0008dd3 <simple_shell+0xa6>
c0008e47:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008e4a:	c7 84 85 14 ff ff ff 	movl   $0x0,-0xec(%ebp,%eax,4)
c0008e51:	00 00 00 00 
c0008e55:	c7 45 d4 ff ff ff ff 	movl   $0xffffffff,-0x2c(%ebp)
c0008e5c:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0008e62:	83 ec 08             	sub    $0x8,%esp
c0008e65:	6a 02                	push   $0x2
c0008e67:	50                   	push   %eax
c0008e68:	e8 51 cb ff ff       	call   c00059be <open>
c0008e6d:	83 c4 10             	add    $0x10,%esp
c0008e70:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0008e73:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0008e77:	75 54                	jne    c0008ecd <simple_shell+0x1a0>
c0008e79:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0008e80:	eb 29                	jmp    c0008eab <simple_shell+0x17e>
c0008e82:	8b 95 14 ff ff ff    	mov    -0xec(%ebp),%edx
c0008e88:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008e8b:	01 d0                	add    %edx,%eax
c0008e8d:	0f b6 00             	movzbl (%eax),%eax
c0008e90:	0f be c0             	movsbl %al,%eax
c0008e93:	83 ec 04             	sub    $0x4,%esp
c0008e96:	50                   	push   %eax
c0008e97:	ff 75 e4             	pushl  -0x1c(%ebp)
c0008e9a:	68 70 ba 00 c0       	push   $0xc000ba70
c0008e9f:	e8 9a 04 00 00       	call   c000933e <Printf>
c0008ea4:	83 c4 10             	add    $0x10,%esp
c0008ea7:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0008eab:	83 7d e4 05          	cmpl   $0x5,-0x1c(%ebp)
c0008eaf:	7e d1                	jle    c0008e82 <simple_shell+0x155>
c0008eb1:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0008eb7:	83 ec 08             	sub    $0x8,%esp
c0008eba:	50                   	push   %eax
c0008ebb:	68 77 ba 00 c0       	push   $0xc000ba77
c0008ec0:	e8 79 04 00 00       	call   c000933e <Printf>
c0008ec5:	83 c4 10             	add    $0x10,%esp
c0008ec8:	e9 a5 fe ff ff       	jmp    c0008d72 <simple_shell+0x45>
c0008ecd:	e8 4c ce ff ff       	call   c0005d1e <fork>
c0008ed2:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0008ed5:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0008ed9:	7e 17                	jle    c0008ef2 <simple_shell+0x1c5>
c0008edb:	83 ec 0c             	sub    $0xc,%esp
c0008ede:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c0008ee4:	50                   	push   %eax
c0008ee5:	e8 c1 cd ff ff       	call   c0005cab <wait>
c0008eea:	83 c4 10             	add    $0x10,%esp
c0008eed:	e9 80 fe ff ff       	jmp    c0008d72 <simple_shell+0x45>
c0008ef2:	83 ec 0c             	sub    $0xc,%esp
c0008ef5:	68 7d ba 00 c0       	push   $0xc000ba7d
c0008efa:	e8 3f 04 00 00       	call   c000933e <Printf>
c0008eff:	83 c4 10             	add    $0x10,%esp
c0008f02:	83 ec 0c             	sub    $0xc,%esp
c0008f05:	ff 75 d0             	pushl  -0x30(%ebp)
c0008f08:	e8 4c cd ff ff       	call   c0005c59 <close>
c0008f0d:	83 c4 10             	add    $0x10,%esp
c0008f10:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0008f16:	83 ec 08             	sub    $0x8,%esp
c0008f19:	8d 95 14 ff ff ff    	lea    -0xec(%ebp),%edx
c0008f1f:	52                   	push   %edx
c0008f20:	50                   	push   %eax
c0008f21:	e8 fc ce ff ff       	call   c0005e22 <execv>
c0008f26:	83 c4 10             	add    $0x10,%esp
c0008f29:	eb fe                	jmp    c0008f29 <simple_shell+0x1fc>

c0008f2b <test_split_str>:
c0008f2b:	55                   	push   %ebp
c0008f2c:	89 e5                	mov    %esp,%ebp
c0008f2e:	81 ec b8 01 00 00    	sub    $0x1b8,%esp
c0008f34:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008f3b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0008f42:	c7 45 ec 99 ba 00 c0 	movl   $0xc000ba99,-0x14(%ebp)
c0008f49:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0008f4d:	75 1a                	jne    c0008f69 <test_split_str+0x3e>
c0008f4f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008f52:	0f b6 00             	movzbl (%eax),%eax
c0008f55:	0f be c0             	movsbl %al,%eax
c0008f58:	83 ec 08             	sub    $0x8,%esp
c0008f5b:	50                   	push   %eax
c0008f5c:	68 aa ba 00 c0       	push   $0xc000baaa
c0008f61:	e8 d8 03 00 00       	call   c000933e <Printf>
c0008f66:	83 c4 10             	add    $0x10,%esp
c0008f69:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008f6c:	0f b6 00             	movzbl (%eax),%eax
c0008f6f:	3c 20                	cmp    $0x20,%al
c0008f71:	75 0a                	jne    c0008f7d <test_split_str+0x52>
c0008f73:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008f76:	0f b6 00             	movzbl (%eax),%eax
c0008f79:	84 c0                	test   %al,%al
c0008f7b:	74 13                	je     c0008f90 <test_split_str+0x65>
c0008f7d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0008f81:	75 0d                	jne    c0008f90 <test_split_str+0x65>
c0008f83:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008f86:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008f89:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0008f90:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008f93:	0f b6 00             	movzbl (%eax),%eax
c0008f96:	3c 20                	cmp    $0x20,%al
c0008f98:	74 0a                	je     c0008fa4 <test_split_str+0x79>
c0008f9a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008f9d:	0f b6 00             	movzbl (%eax),%eax
c0008fa0:	84 c0                	test   %al,%al
c0008fa2:	75 26                	jne    c0008fca <test_split_str+0x9f>
c0008fa4:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
c0008fa8:	75 20                	jne    c0008fca <test_split_str+0x9f>
c0008faa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008fad:	8d 50 01             	lea    0x1(%eax),%edx
c0008fb0:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0008fb3:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0008fb6:	89 94 85 50 fe ff ff 	mov    %edx,-0x1b0(%ebp,%eax,4)
c0008fbd:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008fc0:	c6 00 00             	movb   $0x0,(%eax)
c0008fc3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0008fca:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0008fce:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008fd1:	0f b6 00             	movzbl (%eax),%eax
c0008fd4:	84 c0                	test   %al,%al
c0008fd6:	0f 85 6d ff ff ff    	jne    c0008f49 <test_split_str+0x1e>
c0008fdc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008fdf:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0008fe2:	89 94 85 50 fe ff ff 	mov    %edx,-0x1b0(%ebp,%eax,4)
c0008fe9:	83 ec 08             	sub    $0x8,%esp
c0008fec:	ff 75 f4             	pushl  -0xc(%ebp)
c0008fef:	68 b3 ba 00 c0       	push   $0xc000bab3
c0008ff4:	e8 45 03 00 00       	call   c000933e <Printf>
c0008ff9:	83 c4 10             	add    $0x10,%esp
c0008ffc:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0009003:	eb 22                	jmp    c0009027 <test_split_str+0xfc>
c0009005:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009008:	8b 84 85 50 fe ff ff 	mov    -0x1b0(%ebp,%eax,4),%eax
c000900f:	83 ec 04             	sub    $0x4,%esp
c0009012:	50                   	push   %eax
c0009013:	ff 75 e4             	pushl  -0x1c(%ebp)
c0009016:	68 ca ba 00 c0       	push   $0xc000baca
c000901b:	e8 1e 03 00 00       	call   c000933e <Printf>
c0009020:	83 c4 10             	add    $0x10,%esp
c0009023:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0009027:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000902a:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c000902d:	7e d6                	jle    c0009005 <test_split_str+0xda>
c000902f:	8b 85 50 fe ff ff    	mov    -0x1b0(%ebp),%eax
c0009035:	83 ec 08             	sub    $0x8,%esp
c0009038:	68 d9 ba 00 c0       	push   $0xc000bad9
c000903d:	50                   	push   %eax
c000903e:	e8 fd 12 00 00       	call   c000a340 <strcmp>
c0009043:	83 c4 10             	add    $0x10,%esp
c0009046:	85 c0                	test   %eax,%eax
c0009048:	75 10                	jne    c000905a <test_split_str+0x12f>
c000904a:	83 ec 0c             	sub    $0xc,%esp
c000904d:	68 de ba 00 c0       	push   $0xc000bade
c0009052:	e8 e7 02 00 00       	call   c000933e <Printf>
c0009057:	83 c4 10             	add    $0x10,%esp
c000905a:	8b 85 50 fe ff ff    	mov    -0x1b0(%ebp),%eax
c0009060:	83 ec 08             	sub    $0x8,%esp
c0009063:	50                   	push   %eax
c0009064:	68 ea ba 00 c0       	push   $0xc000baea
c0009069:	e8 d0 02 00 00       	call   c000933e <Printf>
c000906e:	83 c4 10             	add    $0x10,%esp
c0009071:	83 ec 0c             	sub    $0xc,%esp
c0009074:	68 f8 ba 00 c0       	push   $0xc000baf8
c0009079:	e8 c0 02 00 00       	call   c000933e <Printf>
c000907e:	83 c4 10             	add    $0x10,%esp
c0009081:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0009088:	eb 26                	jmp    c00090b0 <test_split_str+0x185>
c000908a:	8b 95 50 fe ff ff    	mov    -0x1b0(%ebp),%edx
c0009090:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0009093:	01 d0                	add    %edx,%eax
c0009095:	0f b6 00             	movzbl (%eax),%eax
c0009098:	0f be c0             	movsbl %al,%eax
c000909b:	83 ec 08             	sub    $0x8,%esp
c000909e:	50                   	push   %eax
c000909f:	68 07 bb 00 c0       	push   $0xc000bb07
c00090a4:	e8 95 02 00 00       	call   c000933e <Printf>
c00090a9:	83 c4 10             	add    $0x10,%esp
c00090ac:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c00090b0:	83 7d e0 05          	cmpl   $0x5,-0x20(%ebp)
c00090b4:	7e d4                	jle    c000908a <test_split_str+0x15f>
c00090b6:	c9                   	leave  
c00090b7:	c3                   	ret    

c00090b8 <test_shell>:
c00090b8:	55                   	push   %ebp
c00090b9:	89 e5                	mov    %esp,%ebp
c00090bb:	83 ec 38             	sub    $0x38,%esp
c00090be:	c7 45 ea 64 65 76 5f 	movl   $0x5f766564,-0x16(%ebp)
c00090c5:	c7 45 ee 74 74 79 31 	movl   $0x31797474,-0x12(%ebp)
c00090cc:	66 c7 45 f2 00 00    	movw   $0x0,-0xe(%ebp)
c00090d2:	83 ec 08             	sub    $0x8,%esp
c00090d5:	6a 02                	push   $0x2
c00090d7:	8d 45 ea             	lea    -0x16(%ebp),%eax
c00090da:	50                   	push   %eax
c00090db:	e8 de c8 ff ff       	call   c00059be <open>
c00090e0:	83 c4 10             	add    $0x10,%esp
c00090e3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00090e6:	c7 45 d6 69 6e 73 74 	movl   $0x74736e69,-0x2a(%ebp)
c00090ed:	c7 45 da 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x26(%ebp)
c00090f4:	c7 45 de 74 61 72 00 	movl   $0x726174,-0x22(%ebp)
c00090fb:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c0009102:	c7 45 e6 00 00 00 00 	movl   $0x0,-0x1a(%ebp)
c0009109:	83 ec 0c             	sub    $0xc,%esp
c000910c:	8d 45 d6             	lea    -0x2a(%ebp),%eax
c000910f:	50                   	push   %eax
c0009110:	e8 35 ea ff ff       	call   c0007b4a <untar>
c0009115:	83 c4 10             	add    $0x10,%esp
c0009118:	e8 10 fc ff ff       	call   c0008d2d <simple_shell>
c000911d:	90                   	nop
c000911e:	c9                   	leave  
c000911f:	c3                   	ret    

c0009120 <test_exec>:
c0009120:	55                   	push   %ebp
c0009121:	89 e5                	mov    %esp,%ebp
c0009123:	83 ec 38             	sub    $0x38,%esp
c0009126:	83 ec 0c             	sub    $0xc,%esp
c0009129:	68 53 b9 00 c0       	push   $0xc000b953
c000912e:	e8 59 7f ff ff       	call   c000108c <disp_str>
c0009133:	83 c4 10             	add    $0x10,%esp
c0009136:	83 ec 0c             	sub    $0xc,%esp
c0009139:	68 55 b9 00 c0       	push   $0xc000b955
c000913e:	e8 49 7f ff ff       	call   c000108c <disp_str>
c0009143:	83 c4 10             	add    $0x10,%esp
c0009146:	c7 45 ea 64 65 76 5f 	movl   $0x5f766564,-0x16(%ebp)
c000914d:	c7 45 ee 74 74 79 31 	movl   $0x31797474,-0x12(%ebp)
c0009154:	66 c7 45 f2 00 00    	movw   $0x0,-0xe(%ebp)
c000915a:	83 ec 08             	sub    $0x8,%esp
c000915d:	6a 02                	push   $0x2
c000915f:	8d 45 ea             	lea    -0x16(%ebp),%eax
c0009162:	50                   	push   %eax
c0009163:	e8 56 c8 ff ff       	call   c00059be <open>
c0009168:	83 c4 10             	add    $0x10,%esp
c000916b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000916e:	c7 45 d6 69 6e 73 74 	movl   $0x74736e69,-0x2a(%ebp)
c0009175:	c7 45 da 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x26(%ebp)
c000917c:	c7 45 de 74 61 72 00 	movl   $0x726174,-0x22(%ebp)
c0009183:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c000918a:	c7 45 e6 00 00 00 00 	movl   $0x0,-0x1a(%ebp)
c0009191:	83 ec 0c             	sub    $0xc,%esp
c0009194:	8d 45 d6             	lea    -0x2a(%ebp),%eax
c0009197:	50                   	push   %eax
c0009198:	e8 ad e9 ff ff       	call   c0007b4a <untar>
c000919d:	83 c4 10             	add    $0x10,%esp
c00091a0:	83 ec 08             	sub    $0x8,%esp
c00091a3:	6a 00                	push   $0x0
c00091a5:	68 10 bb 00 c0       	push   $0xc000bb10
c00091aa:	68 14 bb 00 c0       	push   $0xc000bb14
c00091af:	68 1a bb 00 c0       	push   $0xc000bb1a
c00091b4:	68 d9 ba 00 c0       	push   $0xc000bad9
c00091b9:	68 20 bb 00 c0       	push   $0xc000bb20
c00091be:	e8 44 ce ff ff       	call   c0006007 <execl>
c00091c3:	83 c4 20             	add    $0x20,%esp
c00091c6:	eb fe                	jmp    c00091c6 <test_exec+0xa6>

c00091c8 <INIT>:
c00091c8:	55                   	push   %ebp
c00091c9:	89 e5                	mov    %esp,%ebp
c00091cb:	83 ec 08             	sub    $0x8,%esp
c00091ce:	e8 e5 fe ff ff       	call   c00090b8 <test_shell>
c00091d3:	eb fe                	jmp    c00091d3 <INIT+0xb>

c00091d5 <TestA>:
c00091d5:	55                   	push   %ebp
c00091d6:	89 e5                	mov    %esp,%ebp
c00091d8:	83 ec 08             	sub    $0x8,%esp
c00091db:	83 ec 0c             	sub    $0xc,%esp
c00091de:	6a 05                	push   $0x5
c00091e0:	e8 1b ed ff ff       	call   c0007f00 <disp_int>
c00091e5:	83 c4 10             	add    $0x10,%esp
c00091e8:	83 ec 0c             	sub    $0xc,%esp
c00091eb:	68 4f b6 00 c0       	push   $0xc000b64f
c00091f0:	e8 97 7e ff ff       	call   c000108c <disp_str>
c00091f5:	83 c4 10             	add    $0x10,%esp
c00091f8:	83 ec 0c             	sub    $0xc,%esp
c00091fb:	68 26 bb 00 c0       	push   $0xc000bb26
c0009200:	e8 87 7e ff ff       	call   c000108c <disp_str>
c0009205:	83 c4 10             	add    $0x10,%esp
c0009208:	eb fe                	jmp    c0009208 <TestA+0x33>

c000920a <delay>:
c000920a:	55                   	push   %ebp
c000920b:	89 e5                	mov    %esp,%ebp
c000920d:	83 ec 10             	sub    $0x10,%esp
c0009210:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0009217:	eb 2a                	jmp    c0009243 <delay+0x39>
c0009219:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0009220:	eb 17                	jmp    c0009239 <delay+0x2f>
c0009222:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0009229:	eb 04                	jmp    c000922f <delay+0x25>
c000922b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000922f:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c0009233:	7e f6                	jle    c000922b <delay+0x21>
c0009235:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0009239:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
c000923d:	7e e3                	jle    c0009222 <delay+0x18>
c000923f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0009243:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0009246:	3b 45 08             	cmp    0x8(%ebp),%eax
c0009249:	7c ce                	jl     c0009219 <delay+0xf>
c000924b:	90                   	nop
c000924c:	c9                   	leave  
c000924d:	c3                   	ret    

c000924e <TestB>:
c000924e:	55                   	push   %ebp
c000924f:	89 e5                	mov    %esp,%ebp
c0009251:	83 ec 08             	sub    $0x8,%esp
c0009254:	83 ec 0c             	sub    $0xc,%esp
c0009257:	68 2d bb 00 c0       	push   $0xc000bb2d
c000925c:	e8 2b 7e ff ff       	call   c000108c <disp_str>
c0009261:	83 c4 10             	add    $0x10,%esp
c0009264:	eb fe                	jmp    c0009264 <TestB+0x16>

c0009266 <TestC>:
c0009266:	55                   	push   %ebp
c0009267:	89 e5                	mov    %esp,%ebp
c0009269:	83 ec 18             	sub    $0x18,%esp
c000926c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0009273:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c0009277:	77 1a                	ja     c0009293 <TestC+0x2d>
c0009279:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
c0009280:	83 ec 08             	sub    $0x8,%esp
c0009283:	ff 75 f0             	pushl  -0x10(%ebp)
c0009286:	68 30 bb 00 c0       	push   $0xc000bb30
c000928b:	e8 ae 00 00 00       	call   c000933e <Printf>
c0009290:	83 c4 10             	add    $0x10,%esp
c0009293:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0009297:	eb da                	jmp    c0009273 <TestC+0xd>

c0009299 <sys_get_ticks>:
c0009299:	55                   	push   %ebp
c000929a:	89 e5                	mov    %esp,%ebp
c000929c:	a1 e8 1e 01 c0       	mov    0xc0011ee8,%eax
c00092a1:	8b 15 ec 1e 01 c0    	mov    0xc0011eec,%edx
c00092a7:	5d                   	pop    %ebp
c00092a8:	c3                   	ret    

c00092a9 <sys_write>:
c00092a9:	55                   	push   %ebp
c00092aa:	89 e5                	mov    %esp,%ebp
c00092ac:	83 ec 18             	sub    $0x18,%esp
c00092af:	8b 45 10             	mov    0x10(%ebp),%eax
c00092b2:	8b 80 30 01 00 00    	mov    0x130(%eax),%eax
c00092b8:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c00092be:	05 00 0e 01 c0       	add    $0xc0010e00,%eax
c00092c3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00092c6:	8b 45 0c             	mov    0xc(%ebp),%eax
c00092c9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00092cc:	8b 45 08             	mov    0x8(%ebp),%eax
c00092cf:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00092d2:	eb 20                	jmp    c00092f4 <sys_write+0x4b>
c00092d4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00092d7:	0f b6 00             	movzbl (%eax),%eax
c00092da:	0f b6 c0             	movzbl %al,%eax
c00092dd:	83 ec 08             	sub    $0x8,%esp
c00092e0:	50                   	push   %eax
c00092e1:	ff 75 ec             	pushl  -0x14(%ebp)
c00092e4:	e8 46 ba ff ff       	call   c0004d2f <out_char>
c00092e9:	83 c4 10             	add    $0x10,%esp
c00092ec:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00092f0:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
c00092f4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00092f8:	7f da                	jg     c00092d4 <sys_write+0x2b>
c00092fa:	90                   	nop
c00092fb:	c9                   	leave  
c00092fc:	c3                   	ret    

c00092fd <milli_delay>:
c00092fd:	55                   	push   %ebp
c00092fe:	89 e5                	mov    %esp,%ebp
c0009300:	83 ec 18             	sub    $0x18,%esp
c0009303:	e8 58 0e 00 00       	call   c000a160 <get_ticks_ipc>
c0009308:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000930b:	90                   	nop
c000930c:	e8 4f 0e 00 00       	call   c000a160 <get_ticks_ipc>
c0009311:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0009314:	89 c1                	mov    %eax,%ecx
c0009316:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
c000931b:	89 c8                	mov    %ecx,%eax
c000931d:	f7 ea                	imul   %edx
c000931f:	c1 fa 05             	sar    $0x5,%edx
c0009322:	89 c8                	mov    %ecx,%eax
c0009324:	c1 f8 1f             	sar    $0x1f,%eax
c0009327:	29 c2                	sub    %eax,%edx
c0009329:	89 d0                	mov    %edx,%eax
c000932b:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
c0009331:	39 45 08             	cmp    %eax,0x8(%ebp)
c0009334:	77 d6                	ja     c000930c <milli_delay+0xf>
c0009336:	90                   	nop
c0009337:	c9                   	leave  
c0009338:	c3                   	ret    

c0009339 <TaskSys>:
c0009339:	55                   	push   %ebp
c000933a:	89 e5                	mov    %esp,%ebp
c000933c:	eb fe                	jmp    c000933c <TaskSys+0x3>

c000933e <Printf>:
c000933e:	55                   	push   %ebp
c000933f:	89 e5                	mov    %esp,%ebp
c0009341:	81 ec 18 01 00 00    	sub    $0x118,%esp
c0009347:	83 ec 04             	sub    $0x4,%esp
c000934a:	68 00 01 00 00       	push   $0x100
c000934f:	6a 00                	push   $0x0
c0009351:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0009357:	50                   	push   %eax
c0009358:	e8 e2 2a 00 00       	call   c000be3f <Memset>
c000935d:	83 c4 10             	add    $0x10,%esp
c0009360:	8d 45 0c             	lea    0xc(%ebp),%eax
c0009363:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009366:	8b 45 08             	mov    0x8(%ebp),%eax
c0009369:	83 ec 04             	sub    $0x4,%esp
c000936c:	ff 75 f4             	pushl  -0xc(%ebp)
c000936f:	50                   	push   %eax
c0009370:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0009376:	50                   	push   %eax
c0009377:	e8 20 00 00 00       	call   c000939c <vsprintf>
c000937c:	83 c4 10             	add    $0x10,%esp
c000937f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009382:	83 ec 04             	sub    $0x4,%esp
c0009385:	ff 75 f0             	pushl  -0x10(%ebp)
c0009388:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c000938e:	50                   	push   %eax
c000938f:	6a 00                	push   $0x0
c0009391:	e8 3e c8 ff ff       	call   c0005bd4 <write>
c0009396:	83 c4 10             	add    $0x10,%esp
c0009399:	90                   	nop
c000939a:	c9                   	leave  
c000939b:	c3                   	ret    

c000939c <vsprintf>:
c000939c:	55                   	push   %ebp
c000939d:	89 e5                	mov    %esp,%ebp
c000939f:	81 ec 68 02 00 00    	sub    $0x268,%esp
c00093a5:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c00093ab:	89 85 e4 fd ff ff    	mov    %eax,-0x21c(%ebp)
c00093b1:	83 ec 04             	sub    $0x4,%esp
c00093b4:	6a 40                	push   $0x40
c00093b6:	6a 00                	push   $0x0
c00093b8:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c00093be:	50                   	push   %eax
c00093bf:	e8 7b 2a 00 00       	call   c000be3f <Memset>
c00093c4:	83 c4 10             	add    $0x10,%esp
c00093c7:	8b 45 10             	mov    0x10(%ebp),%eax
c00093ca:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00093cd:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c00093d4:	8b 45 08             	mov    0x8(%ebp),%eax
c00093d7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00093da:	e9 53 01 00 00       	jmp    c0009532 <vsprintf+0x196>
c00093df:	8b 45 0c             	mov    0xc(%ebp),%eax
c00093e2:	0f b6 00             	movzbl (%eax),%eax
c00093e5:	3c 25                	cmp    $0x25,%al
c00093e7:	74 16                	je     c00093ff <vsprintf+0x63>
c00093e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00093ec:	8d 50 01             	lea    0x1(%eax),%edx
c00093ef:	89 55 f4             	mov    %edx,-0xc(%ebp)
c00093f2:	8b 55 0c             	mov    0xc(%ebp),%edx
c00093f5:	0f b6 12             	movzbl (%edx),%edx
c00093f8:	88 10                	mov    %dl,(%eax)
c00093fa:	e9 2f 01 00 00       	jmp    c000952e <vsprintf+0x192>
c00093ff:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c0009403:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009406:	0f b6 00             	movzbl (%eax),%eax
c0009409:	0f be c0             	movsbl %al,%eax
c000940c:	83 f8 64             	cmp    $0x64,%eax
c000940f:	74 26                	je     c0009437 <vsprintf+0x9b>
c0009411:	83 f8 64             	cmp    $0x64,%eax
c0009414:	7f 0e                	jg     c0009424 <vsprintf+0x88>
c0009416:	83 f8 63             	cmp    $0x63,%eax
c0009419:	0f 84 f2 00 00 00    	je     c0009511 <vsprintf+0x175>
c000941f:	e9 0a 01 00 00       	jmp    c000952e <vsprintf+0x192>
c0009424:	83 f8 73             	cmp    $0x73,%eax
c0009427:	0f 84 b0 00 00 00    	je     c00094dd <vsprintf+0x141>
c000942d:	83 f8 78             	cmp    $0x78,%eax
c0009430:	74 5d                	je     c000948f <vsprintf+0xf3>
c0009432:	e9 f7 00 00 00       	jmp    c000952e <vsprintf+0x192>
c0009437:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000943a:	8b 00                	mov    (%eax),%eax
c000943c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000943f:	83 ec 04             	sub    $0x4,%esp
c0009442:	6a 0a                	push   $0xa
c0009444:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c000944a:	50                   	push   %eax
c000944b:	ff 75 e8             	pushl  -0x18(%ebp)
c000944e:	e8 64 0d 00 00       	call   c000a1b7 <itoa>
c0009453:	83 c4 10             	add    $0x10,%esp
c0009456:	83 ec 08             	sub    $0x8,%esp
c0009459:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c000945f:	50                   	push   %eax
c0009460:	ff 75 f4             	pushl  -0xc(%ebp)
c0009463:	e8 f6 29 00 00       	call   c000be5e <Strcpy>
c0009468:	83 c4 10             	add    $0x10,%esp
c000946b:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c000946f:	83 ec 0c             	sub    $0xc,%esp
c0009472:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0009478:	50                   	push   %eax
c0009479:	e8 fa 29 00 00       	call   c000be78 <Strlen>
c000947e:	83 c4 10             	add    $0x10,%esp
c0009481:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009484:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009487:	01 45 f4             	add    %eax,-0xc(%ebp)
c000948a:	e9 9f 00 00 00       	jmp    c000952e <vsprintf+0x192>
c000948f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009492:	8b 00                	mov    (%eax),%eax
c0009494:	83 ec 08             	sub    $0x8,%esp
c0009497:	50                   	push   %eax
c0009498:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c000949e:	50                   	push   %eax
c000949f:	e8 b6 e9 ff ff       	call   c0007e5a <atoi>
c00094a4:	83 c4 10             	add    $0x10,%esp
c00094a7:	83 ec 08             	sub    $0x8,%esp
c00094aa:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c00094b0:	50                   	push   %eax
c00094b1:	ff 75 f4             	pushl  -0xc(%ebp)
c00094b4:	e8 a5 29 00 00       	call   c000be5e <Strcpy>
c00094b9:	83 c4 10             	add    $0x10,%esp
c00094bc:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c00094c0:	83 ec 0c             	sub    $0xc,%esp
c00094c3:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c00094c9:	50                   	push   %eax
c00094ca:	e8 a9 29 00 00       	call   c000be78 <Strlen>
c00094cf:	83 c4 10             	add    $0x10,%esp
c00094d2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00094d5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00094d8:	01 45 f4             	add    %eax,-0xc(%ebp)
c00094db:	eb 51                	jmp    c000952e <vsprintf+0x192>
c00094dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00094e0:	8b 00                	mov    (%eax),%eax
c00094e2:	83 ec 08             	sub    $0x8,%esp
c00094e5:	50                   	push   %eax
c00094e6:	ff 75 f4             	pushl  -0xc(%ebp)
c00094e9:	e8 70 29 00 00       	call   c000be5e <Strcpy>
c00094ee:	83 c4 10             	add    $0x10,%esp
c00094f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00094f4:	8b 00                	mov    (%eax),%eax
c00094f6:	83 ec 0c             	sub    $0xc,%esp
c00094f9:	50                   	push   %eax
c00094fa:	e8 79 29 00 00       	call   c000be78 <Strlen>
c00094ff:	83 c4 10             	add    $0x10,%esp
c0009502:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009505:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0009509:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000950c:	01 45 f4             	add    %eax,-0xc(%ebp)
c000950f:	eb 1d                	jmp    c000952e <vsprintf+0x192>
c0009511:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009514:	0f b6 10             	movzbl (%eax),%edx
c0009517:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000951a:	88 10                	mov    %dl,(%eax)
c000951c:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0009520:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0009527:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000952a:	01 45 f4             	add    %eax,-0xc(%ebp)
c000952d:	90                   	nop
c000952e:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c0009532:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009535:	0f b6 00             	movzbl (%eax),%eax
c0009538:	84 c0                	test   %al,%al
c000953a:	0f 85 9f fe ff ff    	jne    c00093df <vsprintf+0x43>
c0009540:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009543:	2b 45 08             	sub    0x8(%ebp),%eax
c0009546:	c9                   	leave  
c0009547:	c3                   	ret    

c0009548 <printx>:
c0009548:	55                   	push   %ebp
c0009549:	89 e5                	mov    %esp,%ebp
c000954b:	81 ec 18 01 00 00    	sub    $0x118,%esp
c0009551:	8d 45 0c             	lea    0xc(%ebp),%eax
c0009554:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009557:	8b 45 08             	mov    0x8(%ebp),%eax
c000955a:	83 ec 04             	sub    $0x4,%esp
c000955d:	ff 75 f4             	pushl  -0xc(%ebp)
c0009560:	50                   	push   %eax
c0009561:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0009567:	50                   	push   %eax
c0009568:	e8 2f fe ff ff       	call   c000939c <vsprintf>
c000956d:	83 c4 10             	add    $0x10,%esp
c0009570:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009573:	83 ec 08             	sub    $0x8,%esp
c0009576:	ff 75 f0             	pushl  -0x10(%ebp)
c0009579:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c000957f:	50                   	push   %eax
c0009580:	e8 e3 8e ff ff       	call   c0002468 <write_debug>
c0009585:	83 c4 10             	add    $0x10,%esp
c0009588:	90                   	nop
c0009589:	c9                   	leave  
c000958a:	c3                   	ret    

c000958b <sys_printx>:
c000958b:	55                   	push   %ebp
c000958c:	89 e5                	mov    %esp,%ebp
c000958e:	83 ec 28             	sub    $0x28,%esp
c0009591:	a1 a4 07 01 c0       	mov    0xc00107a4,%eax
c0009596:	85 c0                	test   %eax,%eax
c0009598:	75 15                	jne    c00095af <sys_printx+0x24>
c000959a:	8b 45 10             	mov    0x10(%ebp),%eax
c000959d:	8b 80 78 02 00 00    	mov    0x278(%eax),%eax
c00095a3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00095a6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00095ad:	eb 10                	jmp    c00095bf <sys_printx+0x34>
c00095af:	a1 a4 07 01 c0       	mov    0xc00107a4,%eax
c00095b4:	85 c0                	test   %eax,%eax
c00095b6:	74 07                	je     c00095bf <sys_printx+0x34>
c00095b8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00095bf:	8b 55 08             	mov    0x8(%ebp),%edx
c00095c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00095c5:	01 d0                	add    %edx,%eax
c00095c7:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00095ca:	8b 45 10             	mov    0x10(%ebp),%eax
c00095cd:	8b 80 30 01 00 00    	mov    0x130(%eax),%eax
c00095d3:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c00095d9:	05 00 0e 01 c0       	add    $0xc0010e00,%eax
c00095de:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00095e1:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00095e4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00095e7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00095ea:	0f b6 00             	movzbl (%eax),%eax
c00095ed:	88 45 e3             	mov    %al,-0x1d(%ebp)
c00095f0:	eb 3a                	jmp    c000962c <sys_printx+0xa1>
c00095f2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00095f5:	0f b6 00             	movzbl (%eax),%eax
c00095f8:	3c 3b                	cmp    $0x3b,%al
c00095fa:	74 0a                	je     c0009606 <sys_printx+0x7b>
c00095fc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00095ff:	0f b6 00             	movzbl (%eax),%eax
c0009602:	3c 3a                	cmp    $0x3a,%al
c0009604:	75 06                	jne    c000960c <sys_printx+0x81>
c0009606:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c000960a:	eb 20                	jmp    c000962c <sys_printx+0xa1>
c000960c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000960f:	0f b6 00             	movzbl (%eax),%eax
c0009612:	0f b6 c0             	movzbl %al,%eax
c0009615:	83 ec 08             	sub    $0x8,%esp
c0009618:	50                   	push   %eax
c0009619:	ff 75 e4             	pushl  -0x1c(%ebp)
c000961c:	e8 0e b7 ff ff       	call   c0004d2f <out_char>
c0009621:	83 c4 10             	add    $0x10,%esp
c0009624:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0009628:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c000962c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0009630:	7f c0                	jg     c00095f2 <sys_printx+0x67>
c0009632:	80 7d e3 3b          	cmpb   $0x3b,-0x1d(%ebp)
c0009636:	75 10                	jne    c0009648 <sys_printx+0xbd>
c0009638:	a1 a4 07 01 c0       	mov    0xc00107a4,%eax
c000963d:	85 c0                	test   %eax,%eax
c000963f:	74 13                	je     c0009654 <sys_printx+0xc9>
c0009641:	e8 75 7c ff ff       	call   c00012bb <disable_int>
c0009646:	eb 0c                	jmp    c0009654 <sys_printx+0xc9>
c0009648:	80 7d e3 3a          	cmpb   $0x3a,-0x1d(%ebp)
c000964c:	75 06                	jne    c0009654 <sys_printx+0xc9>
c000964e:	e8 68 7c ff ff       	call   c00012bb <disable_int>
c0009653:	90                   	nop
c0009654:	90                   	nop
c0009655:	c9                   	leave  
c0009656:	c3                   	ret    

c0009657 <spin>:
c0009657:	55                   	push   %ebp
c0009658:	89 e5                	mov    %esp,%ebp
c000965a:	83 ec 08             	sub    $0x8,%esp
c000965d:	83 ec 0c             	sub    $0xc,%esp
c0009660:	ff 75 08             	pushl  0x8(%ebp)
c0009663:	e8 24 7a ff ff       	call   c000108c <disp_str>
c0009668:	83 c4 10             	add    $0x10,%esp
c000966b:	83 ec 0c             	sub    $0xc,%esp
c000966e:	68 4f b6 00 c0       	push   $0xc000b64f
c0009673:	e8 14 7a ff ff       	call   c000108c <disp_str>
c0009678:	83 c4 10             	add    $0x10,%esp
c000967b:	eb fe                	jmp    c000967b <spin+0x24>

c000967d <panic>:
c000967d:	55                   	push   %ebp
c000967e:	89 e5                	mov    %esp,%ebp
c0009680:	83 ec 08             	sub    $0x8,%esp
c0009683:	83 ec 04             	sub    $0x4,%esp
c0009686:	ff 75 08             	pushl  0x8(%ebp)
c0009689:	6a 3a                	push   $0x3a
c000968b:	68 3d bb 00 c0       	push   $0xc000bb3d
c0009690:	e8 b3 fe ff ff       	call   c0009548 <printx>
c0009695:	83 c4 10             	add    $0x10,%esp
c0009698:	90                   	nop
c0009699:	c9                   	leave  
c000969a:	c3                   	ret    

c000969b <assertion_failure>:
c000969b:	55                   	push   %ebp
c000969c:	89 e5                	mov    %esp,%ebp
c000969e:	83 ec 08             	sub    $0x8,%esp
c00096a1:	83 ec 08             	sub    $0x8,%esp
c00096a4:	ff 75 14             	pushl  0x14(%ebp)
c00096a7:	ff 75 10             	pushl  0x10(%ebp)
c00096aa:	ff 75 0c             	pushl  0xc(%ebp)
c00096ad:	ff 75 08             	pushl  0x8(%ebp)
c00096b0:	6a 3b                	push   $0x3b
c00096b2:	68 44 bb 00 c0       	push   $0xc000bb44
c00096b7:	e8 8c fe ff ff       	call   c0009548 <printx>
c00096bc:	83 c4 20             	add    $0x20,%esp
c00096bf:	83 ec 0c             	sub    $0xc,%esp
c00096c2:	68 77 bb 00 c0       	push   $0xc000bb77
c00096c7:	e8 8b ff ff ff       	call   c0009657 <spin>
c00096cc:	83 c4 10             	add    $0x10,%esp
c00096cf:	90                   	nop
c00096d0:	c9                   	leave  
c00096d1:	c3                   	ret    

c00096d2 <dead_lock>:
c00096d2:	55                   	push   %ebp
c00096d3:	89 e5                	mov    %esp,%ebp
c00096d5:	b8 00 00 00 00       	mov    $0x0,%eax
c00096da:	5d                   	pop    %ebp
c00096db:	c3                   	ret    

c00096dc <sys_send_msg>:
c00096dc:	55                   	push   %ebp
c00096dd:	89 e5                	mov    %esp,%ebp
c00096df:	83 ec 38             	sub    $0x38,%esp
c00096e2:	83 ec 0c             	sub    $0xc,%esp
c00096e5:	ff 75 0c             	pushl  0xc(%ebp)
c00096e8:	e8 cf af ff ff       	call   c00046bc <pid2proc>
c00096ed:	83 c4 10             	add    $0x10,%esp
c00096f0:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00096f3:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c00096f7:	74 2c                	je     c0009725 <sys_send_msg+0x49>
c00096f9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00096fc:	8b 80 b0 02 00 00    	mov    0x2b0(%eax),%eax
c0009702:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0009707:	74 1c                	je     c0009725 <sys_send_msg+0x49>
c0009709:	68 40 05 00 00       	push   $0x540
c000970e:	68 83 bb 00 c0       	push   $0xc000bb83
c0009713:	68 83 bb 00 c0       	push   $0xc000bb83
c0009718:	68 94 bb 00 c0       	push   $0xc000bb94
c000971d:	e8 79 ff ff ff       	call   c000969b <assertion_failure>
c0009722:	83 c4 10             	add    $0x10,%esp
c0009725:	8b 45 10             	mov    0x10(%ebp),%eax
c0009728:	8b 80 b0 02 00 00    	mov    0x2b0(%eax),%eax
c000972e:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0009733:	74 1c                	je     c0009751 <sys_send_msg+0x75>
c0009735:	68 42 05 00 00       	push   $0x542
c000973a:	68 83 bb 00 c0       	push   $0xc000bb83
c000973f:	68 83 bb 00 c0       	push   $0xc000bb83
c0009744:	68 bc bb 00 c0       	push   $0xc000bbbc
c0009749:	e8 4d ff ff ff       	call   c000969b <assertion_failure>
c000974e:	83 c4 10             	add    $0x10,%esp
c0009751:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0009755:	75 22                	jne    c0009779 <sys_send_msg+0x9d>
c0009757:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c000975b:	75 1c                	jne    c0009779 <sys_send_msg+0x9d>
c000975d:	68 45 05 00 00       	push   $0x545
c0009762:	68 83 bb 00 c0       	push   $0xc000bb83
c0009767:	68 83 bb 00 c0       	push   $0xc000bb83
c000976c:	68 df bb 00 c0       	push   $0xc000bbdf
c0009771:	e8 25 ff ff ff       	call   c000969b <assertion_failure>
c0009776:	83 c4 10             	add    $0x10,%esp
c0009779:	83 ec 0c             	sub    $0xc,%esp
c000977c:	ff 75 10             	pushl  0x10(%ebp)
c000977f:	e8 aa af ff ff       	call   c000472e <proc2pid>
c0009784:	83 c4 10             	add    $0x10,%esp
c0009787:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000978a:	8b 45 10             	mov    0x10(%ebp),%eax
c000978d:	8b 80 78 02 00 00    	mov    0x278(%eax),%eax
c0009793:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0009796:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c000979d:	8b 45 08             	mov    0x8(%ebp),%eax
c00097a0:	83 ec 08             	sub    $0x8,%esp
c00097a3:	6a 7c                	push   $0x7c
c00097a5:	50                   	push   %eax
c00097a6:	e8 6f d5 ff ff       	call   c0006d1a <alloc_virtual_memory>
c00097ab:	83 c4 10             	add    $0x10,%esp
c00097ae:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00097b1:	c7 45 d8 7c 00 00 00 	movl   $0x7c,-0x28(%ebp)
c00097b8:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00097bb:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00097be:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00097c1:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00097c4:	89 10                	mov    %edx,(%eax)
c00097c6:	83 ec 08             	sub    $0x8,%esp
c00097c9:	ff 75 0c             	pushl  0xc(%ebp)
c00097cc:	ff 75 e8             	pushl  -0x18(%ebp)
c00097cf:	e8 fe fe ff ff       	call   c00096d2 <dead_lock>
c00097d4:	83 c4 10             	add    $0x10,%esp
c00097d7:	83 f8 01             	cmp    $0x1,%eax
c00097da:	75 10                	jne    c00097ec <sys_send_msg+0x110>
c00097dc:	83 ec 0c             	sub    $0xc,%esp
c00097df:	68 ef bb 00 c0       	push   $0xc000bbef
c00097e4:	e8 94 fe ff ff       	call   c000967d <panic>
c00097e9:	83 c4 10             	add    $0x10,%esp
c00097ec:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00097ef:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c00097f6:	3c 02                	cmp    $0x2,%al
c00097f8:	0f 85 99 01 00 00    	jne    c0009997 <sys_send_msg+0x2bb>
c00097fe:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009801:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0009807:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c000980a:	74 12                	je     c000981e <sys_send_msg+0x142>
c000980c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000980f:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0009815:	83 f8 12             	cmp    $0x12,%eax
c0009818:	0f 85 79 01 00 00    	jne    c0009997 <sys_send_msg+0x2bb>
c000981e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009821:	8b 80 78 02 00 00    	mov    0x278(%eax),%eax
c0009827:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000982a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000982d:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009833:	83 ec 08             	sub    $0x8,%esp
c0009836:	6a 7c                	push   $0x7c
c0009838:	50                   	push   %eax
c0009839:	e8 dc d4 ff ff       	call   c0006d1a <alloc_virtual_memory>
c000983e:	83 c4 10             	add    $0x10,%esp
c0009841:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0009844:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0009847:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000984a:	83 ec 04             	sub    $0x4,%esp
c000984d:	ff 75 d8             	pushl  -0x28(%ebp)
c0009850:	52                   	push   %edx
c0009851:	50                   	push   %eax
c0009852:	e8 c0 e2 ff ff       	call   c0007b17 <Memcpy>
c0009857:	83 c4 10             	add    $0x10,%esp
c000985a:	8b 45 10             	mov    0x10(%ebp),%eax
c000985d:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c0009864:	00 00 00 
c0009867:	8b 45 10             	mov    0x10(%ebp),%eax
c000986a:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0009871:	8b 45 10             	mov    0x10(%ebp),%eax
c0009874:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c000987b:	00 00 00 
c000987e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009881:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c0009888:	00 00 00 
c000988b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000988e:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0009895:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009898:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c000989f:	00 00 00 
c00098a2:	8b 45 10             	mov    0x10(%ebp),%eax
c00098a5:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c00098ac:	00 00 00 
c00098af:	83 ec 0c             	sub    $0xc,%esp
c00098b2:	ff 75 ec             	pushl  -0x14(%ebp)
c00098b5:	e8 56 08 00 00       	call   c000a110 <unblock>
c00098ba:	83 c4 10             	add    $0x10,%esp
c00098bd:	8b 45 10             	mov    0x10(%ebp),%eax
c00098c0:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c00098c7:	84 c0                	test   %al,%al
c00098c9:	74 1c                	je     c00098e7 <sys_send_msg+0x20b>
c00098cb:	68 76 05 00 00       	push   $0x576
c00098d0:	68 83 bb 00 c0       	push   $0xc000bb83
c00098d5:	68 83 bb 00 c0       	push   $0xc000bb83
c00098da:	68 fa bb 00 c0       	push   $0xc000bbfa
c00098df:	e8 b7 fd ff ff       	call   c000969b <assertion_failure>
c00098e4:	83 c4 10             	add    $0x10,%esp
c00098e7:	8b 45 10             	mov    0x10(%ebp),%eax
c00098ea:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c00098f0:	83 f8 21             	cmp    $0x21,%eax
c00098f3:	74 1c                	je     c0009911 <sys_send_msg+0x235>
c00098f5:	68 77 05 00 00       	push   $0x577
c00098fa:	68 83 bb 00 c0       	push   $0xc000bb83
c00098ff:	68 83 bb 00 c0       	push   $0xc000bb83
c0009904:	68 0e bc 00 c0       	push   $0xc000bc0e
c0009909:	e8 8d fd ff ff       	call   c000969b <assertion_failure>
c000990e:	83 c4 10             	add    $0x10,%esp
c0009911:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009914:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c000991a:	85 c0                	test   %eax,%eax
c000991c:	74 1c                	je     c000993a <sys_send_msg+0x25e>
c000991e:	68 79 05 00 00       	push   $0x579
c0009923:	68 83 bb 00 c0       	push   $0xc000bb83
c0009928:	68 83 bb 00 c0       	push   $0xc000bb83
c000992d:	68 2b bc 00 c0       	push   $0xc000bc2b
c0009932:	e8 64 fd ff ff       	call   c000969b <assertion_failure>
c0009937:	83 c4 10             	add    $0x10,%esp
c000993a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000993d:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009944:	84 c0                	test   %al,%al
c0009946:	74 1c                	je     c0009964 <sys_send_msg+0x288>
c0009948:	68 7a 05 00 00       	push   $0x57a
c000994d:	68 83 bb 00 c0       	push   $0xc000bb83
c0009952:	68 83 bb 00 c0       	push   $0xc000bb83
c0009957:	68 40 bc 00 c0       	push   $0xc000bc40
c000995c:	e8 3a fd ff ff       	call   c000969b <assertion_failure>
c0009961:	83 c4 10             	add    $0x10,%esp
c0009964:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009967:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c000996d:	83 f8 21             	cmp    $0x21,%eax
c0009970:	0f 84 45 01 00 00    	je     c0009abb <sys_send_msg+0x3df>
c0009976:	68 7b 05 00 00       	push   $0x57b
c000997b:	68 83 bb 00 c0       	push   $0xc000bb83
c0009980:	68 83 bb 00 c0       	push   $0xc000bb83
c0009985:	68 58 bc 00 c0       	push   $0xc000bc58
c000998a:	e8 0c fd ff ff       	call   c000969b <assertion_failure>
c000998f:	83 c4 10             	add    $0x10,%esp
c0009992:	e9 24 01 00 00       	jmp    c0009abb <sys_send_msg+0x3df>
c0009997:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000999e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00099a1:	89 45 c8             	mov    %eax,-0x38(%ebp)
c00099a4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00099a7:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c00099ad:	85 c0                	test   %eax,%eax
c00099af:	75 1b                	jne    c00099cc <sys_send_msg+0x2f0>
c00099b1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00099b4:	8b 55 10             	mov    0x10(%ebp),%edx
c00099b7:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c00099bd:	8b 45 10             	mov    0x10(%ebp),%eax
c00099c0:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c00099c7:	00 00 00 
c00099ca:	eb 3f                	jmp    c0009a0b <sys_send_msg+0x32f>
c00099cc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00099cf:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c00099d5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00099d8:	eb 12                	jmp    c00099ec <sys_send_msg+0x310>
c00099da:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00099dd:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00099e0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00099e3:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c00099e9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00099ec:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c00099f0:	75 e8                	jne    c00099da <sys_send_msg+0x2fe>
c00099f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00099f5:	8b 55 10             	mov    0x10(%ebp),%edx
c00099f8:	89 90 5c 02 00 00    	mov    %edx,0x25c(%eax)
c00099fe:	8b 45 10             	mov    0x10(%ebp),%eax
c0009a01:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c0009a08:	00 00 00 
c0009a0b:	8b 45 10             	mov    0x10(%ebp),%eax
c0009a0e:	8b 55 08             	mov    0x8(%ebp),%edx
c0009a11:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c0009a17:	8b 45 10             	mov    0x10(%ebp),%eax
c0009a1a:	8b 55 0c             	mov    0xc(%ebp),%edx
c0009a1d:	89 90 50 02 00 00    	mov    %edx,0x250(%eax)
c0009a23:	8b 45 10             	mov    0x10(%ebp),%eax
c0009a26:	c6 80 48 02 00 00 01 	movb   $0x1,0x248(%eax)
c0009a2d:	8b 45 10             	mov    0x10(%ebp),%eax
c0009a30:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009a37:	3c 01                	cmp    $0x1,%al
c0009a39:	74 1c                	je     c0009a57 <sys_send_msg+0x37b>
c0009a3b:	68 9c 05 00 00       	push   $0x59c
c0009a40:	68 83 bb 00 c0       	push   $0xc000bb83
c0009a45:	68 83 bb 00 c0       	push   $0xc000bb83
c0009a4a:	68 7c bc 00 c0       	push   $0xc000bc7c
c0009a4f:	e8 47 fc ff ff       	call   c000969b <assertion_failure>
c0009a54:	83 c4 10             	add    $0x10,%esp
c0009a57:	8b 45 10             	mov    0x10(%ebp),%eax
c0009a5a:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009a60:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0009a63:	74 1c                	je     c0009a81 <sys_send_msg+0x3a5>
c0009a65:	68 9d 05 00 00       	push   $0x59d
c0009a6a:	68 83 bb 00 c0       	push   $0xc000bb83
c0009a6f:	68 83 bb 00 c0       	push   $0xc000bb83
c0009a74:	68 98 bc 00 c0       	push   $0xc000bc98
c0009a79:	e8 1d fc ff ff       	call   c000969b <assertion_failure>
c0009a7e:	83 c4 10             	add    $0x10,%esp
c0009a81:	8b 45 10             	mov    0x10(%ebp),%eax
c0009a84:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009a8a:	39 45 08             	cmp    %eax,0x8(%ebp)
c0009a8d:	74 1c                	je     c0009aab <sys_send_msg+0x3cf>
c0009a8f:	68 9e 05 00 00       	push   $0x59e
c0009a94:	68 83 bb 00 c0       	push   $0xc000bb83
c0009a99:	68 83 bb 00 c0       	push   $0xc000bb83
c0009a9e:	68 ba bc 00 c0       	push   $0xc000bcba
c0009aa3:	e8 f3 fb ff ff       	call   c000969b <assertion_failure>
c0009aa8:	83 c4 10             	add    $0x10,%esp
c0009aab:	83 ec 0c             	sub    $0xc,%esp
c0009aae:	ff 75 10             	pushl  0x10(%ebp)
c0009ab1:	e8 1e 06 00 00       	call   c000a0d4 <block>
c0009ab6:	83 c4 10             	add    $0x10,%esp
c0009ab9:	eb 01                	jmp    c0009abc <sys_send_msg+0x3e0>
c0009abb:	90                   	nop
c0009abc:	b8 00 00 00 00       	mov    $0x0,%eax
c0009ac1:	c9                   	leave  
c0009ac2:	c3                   	ret    

c0009ac3 <sys_receive_msg>:
c0009ac3:	55                   	push   %ebp
c0009ac4:	89 e5                	mov    %esp,%ebp
c0009ac6:	83 ec 48             	sub    $0x48,%esp
c0009ac9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0009ad0:	83 ec 0c             	sub    $0xc,%esp
c0009ad3:	ff 75 0c             	pushl  0xc(%ebp)
c0009ad6:	e8 e1 ab ff ff       	call   c00046bc <pid2proc>
c0009adb:	83 c4 10             	add    $0x10,%esp
c0009ade:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0009ae1:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0009ae5:	74 2c                	je     c0009b13 <sys_receive_msg+0x50>
c0009ae7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009aea:	8b 80 b0 02 00 00    	mov    0x2b0(%eax),%eax
c0009af0:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0009af5:	74 1c                	je     c0009b13 <sys_receive_msg+0x50>
c0009af7:	68 b2 05 00 00       	push   $0x5b2
c0009afc:	68 83 bb 00 c0       	push   $0xc000bb83
c0009b01:	68 83 bb 00 c0       	push   $0xc000bb83
c0009b06:	68 bc bb 00 c0       	push   $0xc000bbbc
c0009b0b:	e8 8b fb ff ff       	call   c000969b <assertion_failure>
c0009b10:	83 c4 10             	add    $0x10,%esp
c0009b13:	8b 45 10             	mov    0x10(%ebp),%eax
c0009b16:	8b 80 b0 02 00 00    	mov    0x2b0(%eax),%eax
c0009b1c:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0009b21:	74 1c                	je     c0009b3f <sys_receive_msg+0x7c>
c0009b23:	68 b4 05 00 00       	push   $0x5b4
c0009b28:	68 83 bb 00 c0       	push   $0xc000bb83
c0009b2d:	68 83 bb 00 c0       	push   $0xc000bb83
c0009b32:	68 94 bb 00 c0       	push   $0xc000bb94
c0009b37:	e8 5f fb ff ff       	call   c000969b <assertion_failure>
c0009b3c:	83 c4 10             	add    $0x10,%esp
c0009b3f:	83 ec 0c             	sub    $0xc,%esp
c0009b42:	ff 75 10             	pushl  0x10(%ebp)
c0009b45:	e8 e4 ab ff ff       	call   c000472e <proc2pid>
c0009b4a:	83 c4 10             	add    $0x10,%esp
c0009b4d:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0009b50:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0009b57:	8b 45 10             	mov    0x10(%ebp),%eax
c0009b5a:	8b 80 60 02 00 00    	mov    0x260(%eax),%eax
c0009b60:	85 c0                	test   %eax,%eax
c0009b62:	0f 84 c6 00 00 00    	je     c0009c2e <sys_receive_msg+0x16b>
c0009b68:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0009b6c:	74 0d                	je     c0009b7b <sys_receive_msg+0xb8>
c0009b6e:	81 7d 0c 13 02 00 00 	cmpl   $0x213,0xc(%ebp)
c0009b75:	0f 85 b3 00 00 00    	jne    c0009c2e <sys_receive_msg+0x16b>
c0009b7b:	c7 45 dc 7c 00 00 00 	movl   $0x7c,-0x24(%ebp)
c0009b82:	83 ec 0c             	sub    $0xc,%esp
c0009b85:	ff 75 dc             	pushl  -0x24(%ebp)
c0009b88:	e8 37 89 ff ff       	call   c00024c4 <sys_malloc>
c0009b8d:	83 c4 10             	add    $0x10,%esp
c0009b90:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0009b93:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0009b96:	83 ec 04             	sub    $0x4,%esp
c0009b99:	50                   	push   %eax
c0009b9a:	6a 00                	push   $0x0
c0009b9c:	ff 75 d8             	pushl  -0x28(%ebp)
c0009b9f:	e8 9b 22 00 00       	call   c000be3f <Memset>
c0009ba4:	83 c4 10             	add    $0x10,%esp
c0009ba7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0009baa:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c0009bb0:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0009bb3:	c7 40 78 d5 07 00 00 	movl   $0x7d5,0x78(%eax)
c0009bba:	8b 45 08             	mov    0x8(%ebp),%eax
c0009bbd:	83 ec 08             	sub    $0x8,%esp
c0009bc0:	ff 75 dc             	pushl  -0x24(%ebp)
c0009bc3:	50                   	push   %eax
c0009bc4:	e8 51 d1 ff ff       	call   c0006d1a <alloc_virtual_memory>
c0009bc9:	83 c4 10             	add    $0x10,%esp
c0009bcc:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0009bcf:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0009bd2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0009bd5:	83 ec 04             	sub    $0x4,%esp
c0009bd8:	52                   	push   %edx
c0009bd9:	ff 75 d8             	pushl  -0x28(%ebp)
c0009bdc:	50                   	push   %eax
c0009bdd:	e8 35 df ff ff       	call   c0007b17 <Memcpy>
c0009be2:	83 c4 10             	add    $0x10,%esp
c0009be5:	8b 45 10             	mov    0x10(%ebp),%eax
c0009be8:	c7 80 60 02 00 00 00 	movl   $0x0,0x260(%eax)
c0009bef:	00 00 00 
c0009bf2:	8b 45 10             	mov    0x10(%ebp),%eax
c0009bf5:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c0009bfc:	00 00 00 
c0009bff:	8b 45 10             	mov    0x10(%ebp),%eax
c0009c02:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c0009c09:	00 00 00 
c0009c0c:	8b 45 10             	mov    0x10(%ebp),%eax
c0009c0f:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0009c16:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c0009c1d:	83 ec 08             	sub    $0x8,%esp
c0009c20:	ff 75 dc             	pushl  -0x24(%ebp)
c0009c23:	ff 75 d8             	pushl  -0x28(%ebp)
c0009c26:	e8 ae 88 ff ff       	call   c00024d9 <sys_free>
c0009c2b:	83 c4 10             	add    $0x10,%esp
c0009c2e:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c0009c32:	0f 84 96 03 00 00    	je     c0009fce <sys_receive_msg+0x50b>
c0009c38:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0009c3c:	75 26                	jne    c0009c64 <sys_receive_msg+0x1a1>
c0009c3e:	8b 45 10             	mov    0x10(%ebp),%eax
c0009c41:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0009c47:	85 c0                	test   %eax,%eax
c0009c49:	0f 84 8a 00 00 00    	je     c0009cd9 <sys_receive_msg+0x216>
c0009c4f:	8b 45 10             	mov    0x10(%ebp),%eax
c0009c52:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0009c58:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009c5b:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0009c62:	eb 75                	jmp    c0009cd9 <sys_receive_msg+0x216>
c0009c64:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0009c68:	78 6f                	js     c0009cd9 <sys_receive_msg+0x216>
c0009c6a:	83 7d 0c 07          	cmpl   $0x7,0xc(%ebp)
c0009c6e:	7f 69                	jg     c0009cd9 <sys_receive_msg+0x216>
c0009c70:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009c73:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009c7a:	3c 01                	cmp    $0x1,%al
c0009c7c:	75 5b                	jne    c0009cd9 <sys_receive_msg+0x216>
c0009c7e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009c81:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009c87:	83 f8 12             	cmp    $0x12,%eax
c0009c8a:	74 0e                	je     c0009c9a <sys_receive_msg+0x1d7>
c0009c8c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009c8f:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009c95:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c0009c98:	75 3f                	jne    c0009cd9 <sys_receive_msg+0x216>
c0009c9a:	8b 45 10             	mov    0x10(%ebp),%eax
c0009c9d:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0009ca3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009ca6:	eb 2b                	jmp    c0009cd3 <sys_receive_msg+0x210>
c0009ca8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009cab:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009cae:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009cb1:	8b 90 24 01 00 00    	mov    0x124(%eax),%edx
c0009cb7:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009cba:	39 c2                	cmp    %eax,%edx
c0009cbc:	75 09                	jne    c0009cc7 <sys_receive_msg+0x204>
c0009cbe:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0009cc5:	eb 12                	jmp    c0009cd9 <sys_receive_msg+0x216>
c0009cc7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009cca:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c0009cd0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009cd3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0009cd7:	75 cf                	jne    c0009ca8 <sys_receive_msg+0x1e5>
c0009cd9:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0009cdd:	0f 85 21 02 00 00    	jne    c0009f04 <sys_receive_msg+0x441>
c0009ce3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009ce6:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0009ce9:	8b 45 08             	mov    0x8(%ebp),%eax
c0009cec:	83 ec 08             	sub    $0x8,%esp
c0009cef:	6a 7c                	push   $0x7c
c0009cf1:	50                   	push   %eax
c0009cf2:	e8 23 d0 ff ff       	call   c0006d1a <alloc_virtual_memory>
c0009cf7:	83 c4 10             	add    $0x10,%esp
c0009cfa:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0009cfd:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009d00:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009d06:	83 ec 08             	sub    $0x8,%esp
c0009d09:	6a 7c                	push   $0x7c
c0009d0b:	50                   	push   %eax
c0009d0c:	e8 09 d0 ff ff       	call   c0006d1a <alloc_virtual_memory>
c0009d11:	83 c4 10             	add    $0x10,%esp
c0009d14:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0009d17:	83 ec 04             	sub    $0x4,%esp
c0009d1a:	6a 7c                	push   $0x7c
c0009d1c:	ff 75 c8             	pushl  -0x38(%ebp)
c0009d1f:	ff 75 cc             	pushl  -0x34(%ebp)
c0009d22:	e8 f0 dd ff ff       	call   c0007b17 <Memcpy>
c0009d27:	83 c4 10             	add    $0x10,%esp
c0009d2a:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0009d2d:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0009d30:	8b 45 10             	mov    0x10(%ebp),%eax
c0009d33:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0009d39:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0009d3c:	75 21                	jne    c0009d5f <sys_receive_msg+0x29c>
c0009d3e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009d41:	8b 90 5c 02 00 00    	mov    0x25c(%eax),%edx
c0009d47:	8b 45 10             	mov    0x10(%ebp),%eax
c0009d4a:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c0009d50:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009d53:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c0009d5a:	00 00 00 
c0009d5d:	eb 1f                	jmp    c0009d7e <sys_receive_msg+0x2bb>
c0009d5f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009d62:	8b 90 5c 02 00 00    	mov    0x25c(%eax),%edx
c0009d68:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009d6b:	89 90 5c 02 00 00    	mov    %edx,0x25c(%eax)
c0009d71:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009d74:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c0009d7b:	00 00 00 
c0009d7e:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009d81:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c0009d88:	00 00 00 
c0009d8b:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009d8e:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0009d95:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009d98:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c0009d9f:	00 00 00 
c0009da2:	8b 45 10             	mov    0x10(%ebp),%eax
c0009da5:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c0009dac:	00 00 00 
c0009daf:	8b 45 10             	mov    0x10(%ebp),%eax
c0009db2:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c0009db9:	00 00 00 
c0009dbc:	8b 45 10             	mov    0x10(%ebp),%eax
c0009dbf:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c0009dc6:	00 00 00 
c0009dc9:	83 ec 0c             	sub    $0xc,%esp
c0009dcc:	ff 75 d0             	pushl  -0x30(%ebp)
c0009dcf:	e8 3c 03 00 00       	call   c000a110 <unblock>
c0009dd4:	83 c4 10             	add    $0x10,%esp
c0009dd7:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009dda:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009de0:	85 c0                	test   %eax,%eax
c0009de2:	74 1c                	je     c0009e00 <sys_receive_msg+0x33d>
c0009de4:	68 1e 06 00 00       	push   $0x61e
c0009de9:	68 83 bb 00 c0       	push   $0xc000bb83
c0009dee:	68 83 bb 00 c0       	push   $0xc000bb83
c0009df3:	68 cf bc 00 c0       	push   $0xc000bccf
c0009df8:	e8 9e f8 ff ff       	call   c000969b <assertion_failure>
c0009dfd:	83 c4 10             	add    $0x10,%esp
c0009e00:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009e03:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009e0a:	84 c0                	test   %al,%al
c0009e0c:	74 1c                	je     c0009e2a <sys_receive_msg+0x367>
c0009e0e:	68 1f 06 00 00       	push   $0x61f
c0009e13:	68 83 bb 00 c0       	push   $0xc000bb83
c0009e18:	68 83 bb 00 c0       	push   $0xc000bb83
c0009e1d:	68 e7 bc 00 c0       	push   $0xc000bce7
c0009e22:	e8 74 f8 ff ff       	call   c000969b <assertion_failure>
c0009e27:	83 c4 10             	add    $0x10,%esp
c0009e2a:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009e2d:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009e33:	83 f8 21             	cmp    $0x21,%eax
c0009e36:	74 1c                	je     c0009e54 <sys_receive_msg+0x391>
c0009e38:	68 20 06 00 00       	push   $0x620
c0009e3d:	68 83 bb 00 c0       	push   $0xc000bb83
c0009e42:	68 83 bb 00 c0       	push   $0xc000bb83
c0009e47:	68 00 bd 00 c0       	push   $0xc000bd00
c0009e4c:	e8 4a f8 ff ff       	call   c000969b <assertion_failure>
c0009e51:	83 c4 10             	add    $0x10,%esp
c0009e54:	8b 45 10             	mov    0x10(%ebp),%eax
c0009e57:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009e5d:	85 c0                	test   %eax,%eax
c0009e5f:	74 1c                	je     c0009e7d <sys_receive_msg+0x3ba>
c0009e61:	68 22 06 00 00       	push   $0x622
c0009e66:	68 83 bb 00 c0       	push   $0xc000bb83
c0009e6b:	68 83 bb 00 c0       	push   $0xc000bb83
c0009e70:	68 2b bc 00 c0       	push   $0xc000bc2b
c0009e75:	e8 21 f8 ff ff       	call   c000969b <assertion_failure>
c0009e7a:	83 c4 10             	add    $0x10,%esp
c0009e7d:	8b 45 10             	mov    0x10(%ebp),%eax
c0009e80:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009e87:	84 c0                	test   %al,%al
c0009e89:	74 1c                	je     c0009ea7 <sys_receive_msg+0x3e4>
c0009e8b:	68 23 06 00 00       	push   $0x623
c0009e90:	68 83 bb 00 c0       	push   $0xc000bb83
c0009e95:	68 83 bb 00 c0       	push   $0xc000bb83
c0009e9a:	68 40 bc 00 c0       	push   $0xc000bc40
c0009e9f:	e8 f7 f7 ff ff       	call   c000969b <assertion_failure>
c0009ea4:	83 c4 10             	add    $0x10,%esp
c0009ea7:	8b 45 10             	mov    0x10(%ebp),%eax
c0009eaa:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0009eb0:	83 f8 21             	cmp    $0x21,%eax
c0009eb3:	74 1c                	je     c0009ed1 <sys_receive_msg+0x40e>
c0009eb5:	68 24 06 00 00       	push   $0x624
c0009eba:	68 83 bb 00 c0       	push   $0xc000bb83
c0009ebf:	68 83 bb 00 c0       	push   $0xc000bb83
c0009ec4:	68 58 bc 00 c0       	push   $0xc000bc58
c0009ec9:	e8 cd f7 ff ff       	call   c000969b <assertion_failure>
c0009ece:	83 c4 10             	add    $0x10,%esp
c0009ed1:	8b 45 10             	mov    0x10(%ebp),%eax
c0009ed4:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009eda:	83 f8 21             	cmp    $0x21,%eax
c0009edd:	0f 84 e4 00 00 00    	je     c0009fc7 <sys_receive_msg+0x504>
c0009ee3:	68 25 06 00 00       	push   $0x625
c0009ee8:	68 83 bb 00 c0       	push   $0xc000bb83
c0009eed:	68 83 bb 00 c0       	push   $0xc000bb83
c0009ef2:	68 24 bd 00 c0       	push   $0xc000bd24
c0009ef7:	e8 9f f7 ff ff       	call   c000969b <assertion_failure>
c0009efc:	83 c4 10             	add    $0x10,%esp
c0009eff:	e9 c3 00 00 00       	jmp    c0009fc7 <sys_receive_msg+0x504>
c0009f04:	8b 45 10             	mov    0x10(%ebp),%eax
c0009f07:	c6 80 48 02 00 00 02 	movb   $0x2,0x248(%eax)
c0009f0e:	8b 45 10             	mov    0x10(%ebp),%eax
c0009f11:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009f18:	3c 02                	cmp    $0x2,%al
c0009f1a:	74 1c                	je     c0009f38 <sys_receive_msg+0x475>
c0009f1c:	68 2a 06 00 00       	push   $0x62a
c0009f21:	68 83 bb 00 c0       	push   $0xc000bb83
c0009f26:	68 83 bb 00 c0       	push   $0xc000bb83
c0009f2b:	68 43 bd 00 c0       	push   $0xc000bd43
c0009f30:	e8 66 f7 ff ff       	call   c000969b <assertion_failure>
c0009f35:	83 c4 10             	add    $0x10,%esp
c0009f38:	8b 45 10             	mov    0x10(%ebp),%eax
c0009f3b:	8b 55 08             	mov    0x8(%ebp),%edx
c0009f3e:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c0009f44:	8b 45 10             	mov    0x10(%ebp),%eax
c0009f47:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009f4e:	3c 02                	cmp    $0x2,%al
c0009f50:	74 1c                	je     c0009f6e <sys_receive_msg+0x4ab>
c0009f52:	68 2c 06 00 00       	push   $0x62c
c0009f57:	68 83 bb 00 c0       	push   $0xc000bb83
c0009f5c:	68 83 bb 00 c0       	push   $0xc000bb83
c0009f61:	68 43 bd 00 c0       	push   $0xc000bd43
c0009f66:	e8 30 f7 ff ff       	call   c000969b <assertion_failure>
c0009f6b:	83 c4 10             	add    $0x10,%esp
c0009f6e:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0009f72:	75 0f                	jne    c0009f83 <sys_receive_msg+0x4c0>
c0009f74:	8b 45 10             	mov    0x10(%ebp),%eax
c0009f77:	c7 80 54 02 00 00 12 	movl   $0x12,0x254(%eax)
c0009f7e:	00 00 00 
c0009f81:	eb 0c                	jmp    c0009f8f <sys_receive_msg+0x4cc>
c0009f83:	8b 45 10             	mov    0x10(%ebp),%eax
c0009f86:	8b 55 0c             	mov    0xc(%ebp),%edx
c0009f89:	89 90 54 02 00 00    	mov    %edx,0x254(%eax)
c0009f8f:	8b 45 10             	mov    0x10(%ebp),%eax
c0009f92:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009f99:	3c 02                	cmp    $0x2,%al
c0009f9b:	74 1c                	je     c0009fb9 <sys_receive_msg+0x4f6>
c0009f9d:	68 37 06 00 00       	push   $0x637
c0009fa2:	68 83 bb 00 c0       	push   $0xc000bb83
c0009fa7:	68 83 bb 00 c0       	push   $0xc000bb83
c0009fac:	68 43 bd 00 c0       	push   $0xc000bd43
c0009fb1:	e8 e5 f6 ff ff       	call   c000969b <assertion_failure>
c0009fb6:	83 c4 10             	add    $0x10,%esp
c0009fb9:	83 ec 0c             	sub    $0xc,%esp
c0009fbc:	ff 75 10             	pushl  0x10(%ebp)
c0009fbf:	e8 10 01 00 00       	call   c000a0d4 <block>
c0009fc4:	83 c4 10             	add    $0x10,%esp
c0009fc7:	b8 00 00 00 00       	mov    $0x0,%eax
c0009fcc:	eb 02                	jmp    c0009fd0 <sys_receive_msg+0x50d>
c0009fce:	90                   	nop
c0009fcf:	90                   	nop
c0009fd0:	c9                   	leave  
c0009fd1:	c3                   	ret    

c0009fd2 <disp_str_colour_debug>:
c0009fd2:	55                   	push   %ebp
c0009fd3:	89 e5                	mov    %esp,%ebp
c0009fd5:	90                   	nop
c0009fd6:	5d                   	pop    %ebp
c0009fd7:	c3                   	ret    

c0009fd8 <send_rec>:
c0009fd8:	55                   	push   %ebp
c0009fd9:	89 e5                	mov    %esp,%ebp
c0009fdb:	83 ec 18             	sub    $0x18,%esp
c0009fde:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009fe1:	83 ec 0c             	sub    $0xc,%esp
c0009fe4:	50                   	push   %eax
c0009fe5:	e8 7a ce ff ff       	call   c0006e64 <get_physical_address>
c0009fea:	83 c4 10             	add    $0x10,%esp
c0009fed:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009ff0:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c0009ff4:	74 28                	je     c000a01e <send_rec+0x46>
c0009ff6:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0009ffa:	74 22                	je     c000a01e <send_rec+0x46>
c0009ffc:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c000a000:	74 1c                	je     c000a01e <send_rec+0x46>
c000a002:	68 57 06 00 00       	push   $0x657
c000a007:	68 83 bb 00 c0       	push   $0xc000bb83
c000a00c:	68 83 bb 00 c0       	push   $0xc000bb83
c000a011:	68 64 bd 00 c0       	push   $0xc000bd64
c000a016:	e8 80 f6 ff ff       	call   c000969b <assertion_failure>
c000a01b:	83 c4 10             	add    $0x10,%esp
c000a01e:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c000a022:	75 12                	jne    c000a036 <send_rec+0x5e>
c000a024:	83 ec 04             	sub    $0x4,%esp
c000a027:	6a 7c                	push   $0x7c
c000a029:	6a 00                	push   $0x0
c000a02b:	ff 75 0c             	pushl  0xc(%ebp)
c000a02e:	e8 0c 1e 00 00       	call   c000be3f <Memset>
c000a033:	83 c4 10             	add    $0x10,%esp
c000a036:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c000a03a:	74 23                	je     c000a05f <send_rec+0x87>
c000a03c:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c000a040:	74 34                	je     c000a076 <send_rec+0x9e>
c000a042:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c000a046:	75 72                	jne    c000a0ba <send_rec+0xe2>
c000a048:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a04b:	83 ec 08             	sub    $0x8,%esp
c000a04e:	ff 75 10             	pushl  0x10(%ebp)
c000a051:	50                   	push   %eax
c000a052:	e8 31 84 ff ff       	call   c0002488 <send_msg>
c000a057:	83 c4 10             	add    $0x10,%esp
c000a05a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a05d:	eb 6e                	jmp    c000a0cd <send_rec+0xf5>
c000a05f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a062:	83 ec 08             	sub    $0x8,%esp
c000a065:	ff 75 10             	pushl  0x10(%ebp)
c000a068:	50                   	push   %eax
c000a069:	e8 40 84 ff ff       	call   c00024ae <receive_msg>
c000a06e:	83 c4 10             	add    $0x10,%esp
c000a071:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a074:	eb 57                	jmp    c000a0cd <send_rec+0xf5>
c000a076:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a079:	83 ec 08             	sub    $0x8,%esp
c000a07c:	ff 75 10             	pushl  0x10(%ebp)
c000a07f:	50                   	push   %eax
c000a080:	e8 03 84 ff ff       	call   c0002488 <send_msg>
c000a085:	83 c4 10             	add    $0x10,%esp
c000a088:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a08b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000a08f:	75 3b                	jne    c000a0cc <send_rec+0xf4>
c000a091:	83 ec 04             	sub    $0x4,%esp
c000a094:	6a 7c                	push   $0x7c
c000a096:	6a 00                	push   $0x0
c000a098:	ff 75 0c             	pushl  0xc(%ebp)
c000a09b:	e8 9f 1d 00 00       	call   c000be3f <Memset>
c000a0a0:	83 c4 10             	add    $0x10,%esp
c000a0a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a0a6:	83 ec 08             	sub    $0x8,%esp
c000a0a9:	ff 75 10             	pushl  0x10(%ebp)
c000a0ac:	50                   	push   %eax
c000a0ad:	e8 fc 83 ff ff       	call   c00024ae <receive_msg>
c000a0b2:	83 c4 10             	add    $0x10,%esp
c000a0b5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a0b8:	eb 12                	jmp    c000a0cc <send_rec+0xf4>
c000a0ba:	83 ec 0c             	sub    $0xc,%esp
c000a0bd:	68 a0 bd 00 c0       	push   $0xc000bda0
c000a0c2:	e8 b6 f5 ff ff       	call   c000967d <panic>
c000a0c7:	83 c4 10             	add    $0x10,%esp
c000a0ca:	eb 01                	jmp    c000a0cd <send_rec+0xf5>
c000a0cc:	90                   	nop
c000a0cd:	b8 00 00 00 00       	mov    $0x0,%eax
c000a0d2:	c9                   	leave  
c000a0d3:	c3                   	ret    

c000a0d4 <block>:
c000a0d4:	55                   	push   %ebp
c000a0d5:	89 e5                	mov    %esp,%ebp
c000a0d7:	83 ec 08             	sub    $0x8,%esp
c000a0da:	8b 45 08             	mov    0x8(%ebp),%eax
c000a0dd:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a0e4:	84 c0                	test   %al,%al
c000a0e6:	75 1c                	jne    c000a104 <block+0x30>
c000a0e8:	68 86 06 00 00       	push   $0x686
c000a0ed:	68 83 bb 00 c0       	push   $0xc000bb83
c000a0f2:	68 83 bb 00 c0       	push   $0xc000bb83
c000a0f7:	68 b5 bd 00 c0       	push   $0xc000bdb5
c000a0fc:	e8 9a f5 ff ff       	call   c000969b <assertion_failure>
c000a101:	83 c4 10             	add    $0x10,%esp
c000a104:	e8 3e a4 ff ff       	call   c0004547 <schedule_process>
c000a109:	b8 00 00 00 00       	mov    $0x0,%eax
c000a10e:	c9                   	leave  
c000a10f:	c3                   	ret    

c000a110 <unblock>:
c000a110:	55                   	push   %ebp
c000a111:	89 e5                	mov    %esp,%ebp
c000a113:	83 ec 08             	sub    $0x8,%esp
c000a116:	8b 45 08             	mov    0x8(%ebp),%eax
c000a119:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a120:	84 c0                	test   %al,%al
c000a122:	74 1c                	je     c000a140 <unblock+0x30>
c000a124:	68 8f 06 00 00       	push   $0x68f
c000a129:	68 83 bb 00 c0       	push   $0xc000bb83
c000a12e:	68 83 bb 00 c0       	push   $0xc000bb83
c000a133:	68 cd bd 00 c0       	push   $0xc000bdcd
c000a138:	e8 5e f5 ff ff       	call   c000969b <assertion_failure>
c000a13d:	83 c4 10             	add    $0x10,%esp
c000a140:	8b 45 08             	mov    0x8(%ebp),%eax
c000a143:	05 00 01 00 00       	add    $0x100,%eax
c000a148:	83 ec 08             	sub    $0x8,%esp
c000a14b:	50                   	push   %eax
c000a14c:	68 ec 0d 01 c0       	push   $0xc0010dec
c000a151:	e8 da 0a 00 00       	call   c000ac30 <appendToDoubleLinkList>
c000a156:	83 c4 10             	add    $0x10,%esp
c000a159:	b8 00 00 00 00       	mov    $0x0,%eax
c000a15e:	c9                   	leave  
c000a15f:	c3                   	ret    

c000a160 <get_ticks_ipc>:
c000a160:	55                   	push   %ebp
c000a161:	89 e5                	mov    %esp,%ebp
c000a163:	81 ec 98 00 00 00    	sub    $0x98,%esp
c000a169:	83 ec 04             	sub    $0x4,%esp
c000a16c:	6a 7c                	push   $0x7c
c000a16e:	6a 00                	push   $0x0
c000a170:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c000a176:	50                   	push   %eax
c000a177:	e8 c3 1c 00 00       	call   c000be3f <Memset>
c000a17c:	83 c4 10             	add    $0x10,%esp
c000a17f:	c7 85 78 ff ff ff 01 	movl   $0x1,-0x88(%ebp)
c000a186:	00 00 00 
c000a189:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c000a190:	83 ec 04             	sub    $0x4,%esp
c000a193:	6a 01                	push   $0x1
c000a195:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c000a19b:	50                   	push   %eax
c000a19c:	6a 03                	push   $0x3
c000a19e:	e8 35 fe ff ff       	call   c0009fd8 <send_rec>
c000a1a3:	83 c4 10             	add    $0x10,%esp
c000a1a6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a1a9:	8b 85 7c ff ff ff    	mov    -0x84(%ebp),%eax
c000a1af:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a1b2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a1b5:	c9                   	leave  
c000a1b6:	c3                   	ret    

c000a1b7 <itoa>:
c000a1b7:	55                   	push   %ebp
c000a1b8:	89 e5                	mov    %esp,%ebp
c000a1ba:	53                   	push   %ebx
c000a1bb:	83 ec 14             	sub    $0x14,%esp
c000a1be:	8b 45 08             	mov    0x8(%ebp),%eax
c000a1c1:	99                   	cltd   
c000a1c2:	f7 7d 10             	idivl  0x10(%ebp)
c000a1c5:	89 55 f4             	mov    %edx,-0xc(%ebp)
c000a1c8:	8b 45 08             	mov    0x8(%ebp),%eax
c000a1cb:	99                   	cltd   
c000a1cc:	f7 7d 10             	idivl  0x10(%ebp)
c000a1cf:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a1d2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000a1d6:	74 14                	je     c000a1ec <itoa+0x35>
c000a1d8:	83 ec 04             	sub    $0x4,%esp
c000a1db:	ff 75 10             	pushl  0x10(%ebp)
c000a1de:	ff 75 0c             	pushl  0xc(%ebp)
c000a1e1:	ff 75 f0             	pushl  -0x10(%ebp)
c000a1e4:	e8 ce ff ff ff       	call   c000a1b7 <itoa>
c000a1e9:	83 c4 10             	add    $0x10,%esp
c000a1ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a1ef:	8d 58 30             	lea    0x30(%eax),%ebx
c000a1f2:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a1f5:	8b 00                	mov    (%eax),%eax
c000a1f7:	8d 48 01             	lea    0x1(%eax),%ecx
c000a1fa:	8b 55 0c             	mov    0xc(%ebp),%edx
c000a1fd:	89 0a                	mov    %ecx,(%edx)
c000a1ff:	89 da                	mov    %ebx,%edx
c000a201:	88 10                	mov    %dl,(%eax)
c000a203:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a206:	8b 00                	mov    (%eax),%eax
c000a208:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c000a20b:	c9                   	leave  
c000a20c:	c3                   	ret    

c000a20d <i2a>:
c000a20d:	55                   	push   %ebp
c000a20e:	89 e5                	mov    %esp,%ebp
c000a210:	53                   	push   %ebx
c000a211:	83 ec 14             	sub    $0x14,%esp
c000a214:	8b 45 08             	mov    0x8(%ebp),%eax
c000a217:	99                   	cltd   
c000a218:	f7 7d 0c             	idivl  0xc(%ebp)
c000a21b:	89 55 f4             	mov    %edx,-0xc(%ebp)
c000a21e:	8b 45 08             	mov    0x8(%ebp),%eax
c000a221:	99                   	cltd   
c000a222:	f7 7d 0c             	idivl  0xc(%ebp)
c000a225:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a228:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000a22c:	74 14                	je     c000a242 <i2a+0x35>
c000a22e:	83 ec 04             	sub    $0x4,%esp
c000a231:	ff 75 10             	pushl  0x10(%ebp)
c000a234:	ff 75 0c             	pushl  0xc(%ebp)
c000a237:	ff 75 f0             	pushl  -0x10(%ebp)
c000a23a:	e8 ce ff ff ff       	call   c000a20d <i2a>
c000a23f:	83 c4 10             	add    $0x10,%esp
c000a242:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c000a246:	7f 0a                	jg     c000a252 <i2a+0x45>
c000a248:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a24b:	83 c0 30             	add    $0x30,%eax
c000a24e:	89 c3                	mov    %eax,%ebx
c000a250:	eb 08                	jmp    c000a25a <i2a+0x4d>
c000a252:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a255:	83 c0 37             	add    $0x37,%eax
c000a258:	89 c3                	mov    %eax,%ebx
c000a25a:	8b 45 10             	mov    0x10(%ebp),%eax
c000a25d:	8b 00                	mov    (%eax),%eax
c000a25f:	8d 48 01             	lea    0x1(%eax),%ecx
c000a262:	8b 55 10             	mov    0x10(%ebp),%edx
c000a265:	89 0a                	mov    %ecx,(%edx)
c000a267:	88 18                	mov    %bl,(%eax)
c000a269:	8b 45 10             	mov    0x10(%ebp),%eax
c000a26c:	8b 00                	mov    (%eax),%eax
c000a26e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c000a271:	c9                   	leave  
c000a272:	c3                   	ret    

c000a273 <inform_int>:
c000a273:	55                   	push   %ebp
c000a274:	89 e5                	mov    %esp,%ebp
c000a276:	83 ec 18             	sub    $0x18,%esp
c000a279:	83 ec 0c             	sub    $0xc,%esp
c000a27c:	ff 75 08             	pushl  0x8(%ebp)
c000a27f:	e8 38 a4 ff ff       	call   c00046bc <pid2proc>
c000a284:	83 c4 10             	add    $0x10,%esp
c000a287:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a28a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a28d:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a294:	0f be c0             	movsbl %al,%eax
c000a297:	83 e0 02             	and    $0x2,%eax
c000a29a:	85 c0                	test   %eax,%eax
c000a29c:	0f 84 8e 00 00 00    	je     c000a330 <inform_int+0xbd>
c000a2a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a2a5:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c000a2ab:	3d 13 02 00 00       	cmp    $0x213,%eax
c000a2b0:	74 0e                	je     c000a2c0 <inform_int+0x4d>
c000a2b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a2b5:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c000a2bb:	83 f8 12             	cmp    $0x12,%eax
c000a2be:	75 7d                	jne    c000a33d <inform_int+0xca>
c000a2c0:	c7 45 f0 7c 00 00 00 	movl   $0x7c,-0x10(%ebp)
c000a2c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a2ca:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c000a2d0:	83 ec 08             	sub    $0x8,%esp
c000a2d3:	ff 75 f0             	pushl  -0x10(%ebp)
c000a2d6:	50                   	push   %eax
c000a2d7:	e8 3e ca ff ff       	call   c0006d1a <alloc_virtual_memory>
c000a2dc:	83 c4 10             	add    $0x10,%esp
c000a2df:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a2e2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a2e5:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c000a2eb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a2ee:	c7 40 78 d5 07 00 00 	movl   $0x7d5,0x78(%eax)
c000a2f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a2f8:	c7 80 60 02 00 00 00 	movl   $0x0,0x260(%eax)
c000a2ff:	00 00 00 
c000a302:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a305:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c000a30c:	00 00 00 
c000a30f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000a316:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a319:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c000a320:	83 ec 0c             	sub    $0xc,%esp
c000a323:	ff 75 f4             	pushl  -0xc(%ebp)
c000a326:	e8 e5 fd ff ff       	call   c000a110 <unblock>
c000a32b:	83 c4 10             	add    $0x10,%esp
c000a32e:	eb 0d                	jmp    c000a33d <inform_int+0xca>
c000a330:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a333:	c7 80 60 02 00 00 01 	movl   $0x1,0x260(%eax)
c000a33a:	00 00 00 
c000a33d:	90                   	nop
c000a33e:	c9                   	leave  
c000a33f:	c3                   	ret    

c000a340 <strcmp>:
c000a340:	55                   	push   %ebp
c000a341:	89 e5                	mov    %esp,%ebp
c000a343:	83 ec 10             	sub    $0x10,%esp
c000a346:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c000a34a:	74 06                	je     c000a352 <strcmp+0x12>
c000a34c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000a350:	75 08                	jne    c000a35a <strcmp+0x1a>
c000a352:	8b 45 08             	mov    0x8(%ebp),%eax
c000a355:	2b 45 0c             	sub    0xc(%ebp),%eax
c000a358:	eb 53                	jmp    c000a3ad <strcmp+0x6d>
c000a35a:	8b 45 08             	mov    0x8(%ebp),%eax
c000a35d:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000a360:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a363:	89 45 f8             	mov    %eax,-0x8(%ebp)
c000a366:	eb 18                	jmp    c000a380 <strcmp+0x40>
c000a368:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a36b:	0f b6 10             	movzbl (%eax),%edx
c000a36e:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000a371:	0f b6 00             	movzbl (%eax),%eax
c000a374:	38 c2                	cmp    %al,%dl
c000a376:	75 1e                	jne    c000a396 <strcmp+0x56>
c000a378:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c000a37c:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c000a380:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a383:	0f b6 00             	movzbl (%eax),%eax
c000a386:	84 c0                	test   %al,%al
c000a388:	74 0d                	je     c000a397 <strcmp+0x57>
c000a38a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000a38d:	0f b6 00             	movzbl (%eax),%eax
c000a390:	84 c0                	test   %al,%al
c000a392:	75 d4                	jne    c000a368 <strcmp+0x28>
c000a394:	eb 01                	jmp    c000a397 <strcmp+0x57>
c000a396:	90                   	nop
c000a397:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a39a:	0f b6 00             	movzbl (%eax),%eax
c000a39d:	0f be d0             	movsbl %al,%edx
c000a3a0:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000a3a3:	0f b6 00             	movzbl (%eax),%eax
c000a3a6:	0f be c0             	movsbl %al,%eax
c000a3a9:	29 c2                	sub    %eax,%edx
c000a3ab:	89 d0                	mov    %edx,%eax
c000a3ad:	c9                   	leave  
c000a3ae:	c3                   	ret    

c000a3af <create_user_process_address_space>:
c000a3af:	55                   	push   %ebp
c000a3b0:	89 e5                	mov    %esp,%ebp
c000a3b2:	83 ec 18             	sub    $0x18,%esp
c000a3b5:	83 ec 08             	sub    $0x8,%esp
c000a3b8:	6a 00                	push   $0x0
c000a3ba:	6a 01                	push   $0x1
c000a3bc:	e8 8c cc ff ff       	call   c000704d <alloc_memory>
c000a3c1:	83 c4 10             	add    $0x10,%esp
c000a3c4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a3c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a3ca:	c7 40 08 00 80 04 08 	movl   $0x8048000,0x8(%eax)
c000a3d1:	c7 45 f0 00 80 fb b7 	movl   $0xb7fb8000,-0x10(%ebp)
c000a3d8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a3db:	05 ff 0f 00 00       	add    $0xfff,%eax
c000a3e0:	c1 e8 0c             	shr    $0xc,%eax
c000a3e3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a3e6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a3e9:	83 c0 07             	add    $0x7,%eax
c000a3ec:	c1 e8 03             	shr    $0x3,%eax
c000a3ef:	89 c2                	mov    %eax,%edx
c000a3f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a3f4:	89 50 04             	mov    %edx,0x4(%eax)
c000a3f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a3fa:	8b 40 04             	mov    0x4(%eax),%eax
c000a3fd:	05 ff 0f 00 00       	add    $0xfff,%eax
c000a402:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c000a408:	85 c0                	test   %eax,%eax
c000a40a:	0f 48 c2             	cmovs  %edx,%eax
c000a40d:	c1 f8 0c             	sar    $0xc,%eax
c000a410:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000a413:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a416:	83 ec 08             	sub    $0x8,%esp
c000a419:	6a 00                	push   $0x0
c000a41b:	50                   	push   %eax
c000a41c:	e8 2c cc ff ff       	call   c000704d <alloc_memory>
c000a421:	83 c4 10             	add    $0x10,%esp
c000a424:	89 c2                	mov    %eax,%edx
c000a426:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a429:	89 10                	mov    %edx,(%eax)
c000a42b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a42e:	83 ec 0c             	sub    $0xc,%esp
c000a431:	50                   	push   %eax
c000a432:	e8 ed c3 ff ff       	call   c0006824 <init_bitmap>
c000a437:	83 c4 10             	add    $0x10,%esp
c000a43a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a43d:	c9                   	leave  
c000a43e:	c3                   	ret    

c000a43f <user_process>:
c000a43f:	55                   	push   %ebp
c000a440:	89 e5                	mov    %esp,%ebp
c000a442:	83 ec 38             	sub    $0x38,%esp
c000a445:	c7 45 f0 b2 0c 00 00 	movl   $0xcb2,-0x10(%ebp)
c000a44c:	c7 45 ec ba 0c 00 00 	movl   $0xcba,-0x14(%ebp)
c000a453:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%ebp)
c000a45a:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c000a45e:	75 0e                	jne    c000a46e <user_process+0x2f>
c000a460:	66 c7 45 f6 48 00    	movw   $0x48,-0xa(%ebp)
c000a466:	66 c7 45 f4 50 00    	movw   $0x50,-0xc(%ebp)
c000a46c:	eb 0c                	jmp    c000a47a <user_process+0x3b>
c000a46e:	66 c7 45 f6 59 00    	movw   $0x59,-0xa(%ebp)
c000a474:	66 c7 45 f4 61 00    	movw   $0x61,-0xc(%ebp)
c000a47a:	e8 18 6f ff ff       	call   c0001397 <get_running_thread_pcb>
c000a47f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000a482:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a485:	05 00 10 00 00       	add    $0x1000,%eax
c000a48a:	89 c2                	mov    %eax,%edx
c000a48c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a48f:	89 10                	mov    %edx,(%eax)
c000a491:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a494:	8b 00                	mov    (%eax),%eax
c000a496:	83 e8 44             	sub    $0x44,%eax
c000a499:	89 c2                	mov    %eax,%edx
c000a49b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a49e:	89 10                	mov    %edx,(%eax)
c000a4a0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a4a3:	8b 00                	mov    (%eax),%eax
c000a4a5:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000a4a8:	c6 45 df 00          	movb   $0x0,-0x21(%ebp)
c000a4ac:	66 c7 45 dc 02 12    	movw   $0x1202,-0x24(%ebp)
c000a4b2:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c000a4b6:	66 89 45 da          	mov    %ax,-0x26(%ebp)
c000a4ba:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c000a4be:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
c000a4c2:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c000a4c6:	66 89 45 d6          	mov    %ax,-0x2a(%ebp)
c000a4ca:	66 c7 45 d4 38 00    	movw   $0x38,-0x2c(%ebp)
c000a4d0:	0f b7 55 f4          	movzwl -0xc(%ebp),%edx
c000a4d4:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a4d7:	89 50 34             	mov    %edx,0x34(%eax)
c000a4da:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c000a4de:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a4e1:	89 50 0c             	mov    %edx,0xc(%eax)
c000a4e4:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c000a4e8:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a4eb:	89 50 04             	mov    %edx,0x4(%eax)
c000a4ee:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c000a4f2:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a4f5:	89 50 08             	mov    %edx,0x8(%eax)
c000a4f8:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c000a4fc:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a4ff:	89 50 40             	mov    %edx,0x40(%eax)
c000a502:	0f b7 55 d4          	movzwl -0x2c(%ebp),%edx
c000a506:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a509:	89 10                	mov    %edx,(%eax)
c000a50b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a50e:	8b 55 08             	mov    0x8(%ebp),%edx
c000a511:	89 50 30             	mov    %edx,0x30(%eax)
c000a514:	0f b7 55 dc          	movzwl -0x24(%ebp),%edx
c000a518:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a51b:	89 50 38             	mov    %edx,0x38(%eax)
c000a51e:	83 ec 08             	sub    $0x8,%esp
c000a521:	6a 01                	push   $0x1
c000a523:	68 00 f0 ff bf       	push   $0xbffff000
c000a528:	e8 58 ca ff ff       	call   c0006f85 <alloc_physical_memory>
c000a52d:	83 c4 10             	add    $0x10,%esp
c000a530:	8d 90 00 10 00 00    	lea    0x1000(%eax),%edx
c000a536:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a539:	89 50 3c             	mov    %edx,0x3c(%eax)
c000a53c:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a53f:	83 ec 0c             	sub    $0xc,%esp
c000a542:	50                   	push   %eax
c000a543:	e8 24 6d ff ff       	call   c000126c <restart>
c000a548:	83 c4 10             	add    $0x10,%esp
c000a54b:	90                   	nop
c000a54c:	c9                   	leave  
c000a54d:	c3                   	ret    

c000a54e <clone_pcb>:
c000a54e:	55                   	push   %ebp
c000a54f:	89 e5                	mov    %esp,%ebp
c000a551:	83 ec 38             	sub    $0x38,%esp
c000a554:	83 ec 08             	sub    $0x8,%esp
c000a557:	6a 00                	push   $0x0
c000a559:	6a 01                	push   $0x1
c000a55b:	e8 ed ca ff ff       	call   c000704d <alloc_memory>
c000a560:	83 c4 10             	add    $0x10,%esp
c000a563:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a566:	83 ec 04             	sub    $0x4,%esp
c000a569:	68 00 10 00 00       	push   $0x1000
c000a56e:	6a 00                	push   $0x0
c000a570:	ff 75 f4             	pushl  -0xc(%ebp)
c000a573:	e8 c7 18 00 00       	call   c000be3f <Memset>
c000a578:	83 c4 10             	add    $0x10,%esp
c000a57b:	83 ec 04             	sub    $0x4,%esp
c000a57e:	68 00 10 00 00       	push   $0x1000
c000a583:	ff 75 08             	pushl  0x8(%ebp)
c000a586:	ff 75 f4             	pushl  -0xc(%ebp)
c000a589:	e8 89 d5 ff ff       	call   c0007b17 <Memcpy>
c000a58e:	83 c4 10             	add    $0x10,%esp
c000a591:	a1 90 07 01 c0       	mov    0xc0010790,%eax
c000a596:	83 c0 01             	add    $0x1,%eax
c000a599:	a3 90 07 01 c0       	mov    %eax,0xc0010790
c000a59e:	8b 15 90 07 01 c0    	mov    0xc0010790,%edx
c000a5a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a5a7:	89 90 24 01 00 00    	mov    %edx,0x124(%eax)
c000a5ad:	8b 45 08             	mov    0x8(%ebp),%eax
c000a5b0:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c000a5b6:	89 c2                	mov    %eax,%edx
c000a5b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a5bb:	89 90 64 02 00 00    	mov    %edx,0x264(%eax)
c000a5c1:	83 ec 08             	sub    $0x8,%esp
c000a5c4:	6a 00                	push   $0x0
c000a5c6:	6a 01                	push   $0x1
c000a5c8:	e8 80 ca ff ff       	call   c000704d <alloc_memory>
c000a5cd:	83 c4 10             	add    $0x10,%esp
c000a5d0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a5d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a5d6:	05 00 0c 00 00       	add    $0xc00,%eax
c000a5db:	83 ec 04             	sub    $0x4,%esp
c000a5de:	68 00 04 00 00       	push   $0x400
c000a5e3:	68 00 fc ff ff       	push   $0xfffffc00
c000a5e8:	50                   	push   %eax
c000a5e9:	e8 29 d5 ff ff       	call   c0007b17 <Memcpy>
c000a5ee:	83 c4 10             	add    $0x10,%esp
c000a5f1:	83 ec 0c             	sub    $0xc,%esp
c000a5f4:	ff 75 f0             	pushl  -0x10(%ebp)
c000a5f7:	e8 68 c8 ff ff       	call   c0006e64 <get_physical_address>
c000a5fc:	83 c4 10             	add    $0x10,%esp
c000a5ff:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a602:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a605:	05 fc 0f 00 00       	add    $0xffc,%eax
c000a60a:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000a60d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a610:	83 c8 07             	or     $0x7,%eax
c000a613:	89 c2                	mov    %eax,%edx
c000a615:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a618:	89 10                	mov    %edx,(%eax)
c000a61a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a61d:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000a620:	89 50 08             	mov    %edx,0x8(%eax)
c000a623:	e8 87 fd ff ff       	call   c000a3af <create_user_process_address_space>
c000a628:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000a62b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c000a62e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a631:	89 50 0c             	mov    %edx,0xc(%eax)
c000a634:	8b 45 08             	mov    0x8(%ebp),%eax
c000a637:	8b 40 0c             	mov    0xc(%eax),%eax
c000a63a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000a63d:	83 ec 04             	sub    $0x4,%esp
c000a640:	6a 0c                	push   $0xc
c000a642:	ff 75 e0             	pushl  -0x20(%ebp)
c000a645:	ff 75 e4             	pushl  -0x1c(%ebp)
c000a648:	e8 ca d4 ff ff       	call   c0007b17 <Memcpy>
c000a64d:	83 c4 10             	add    $0x10,%esp
c000a650:	c7 45 dc 00 80 fb b7 	movl   $0xb7fb8000,-0x24(%ebp)
c000a657:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000a65a:	05 ff 0f 00 00       	add    $0xfff,%eax
c000a65f:	c1 e8 0c             	shr    $0xc,%eax
c000a662:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000a665:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000a668:	83 c0 07             	add    $0x7,%eax
c000a66b:	c1 e8 03             	shr    $0x3,%eax
c000a66e:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000a671:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000a674:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000a677:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000a67a:	05 ff 0f 00 00       	add    $0xfff,%eax
c000a67f:	c1 e8 0c             	shr    $0xc,%eax
c000a682:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000a685:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000a688:	83 ec 08             	sub    $0x8,%esp
c000a68b:	6a 00                	push   $0x0
c000a68d:	50                   	push   %eax
c000a68e:	e8 ba c9 ff ff       	call   c000704d <alloc_memory>
c000a693:	83 c4 10             	add    $0x10,%esp
c000a696:	89 c2                	mov    %eax,%edx
c000a698:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a69b:	89 10                	mov    %edx,(%eax)
c000a69d:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000a6a0:	c1 e0 0c             	shl    $0xc,%eax
c000a6a3:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000a6a6:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a6a9:	8b 10                	mov    (%eax),%edx
c000a6ab:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a6ae:	8b 00                	mov    (%eax),%eax
c000a6b0:	83 ec 04             	sub    $0x4,%esp
c000a6b3:	ff 75 cc             	pushl  -0x34(%ebp)
c000a6b6:	52                   	push   %edx
c000a6b7:	50                   	push   %eax
c000a6b8:	e8 5a d4 ff ff       	call   c0007b17 <Memcpy>
c000a6bd:	83 c4 10             	add    $0x10,%esp
c000a6c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a6c3:	c9                   	leave  
c000a6c4:	c3                   	ret    

c000a6c5 <build_body_stack>:
c000a6c5:	55                   	push   %ebp
c000a6c6:	89 e5                	mov    %esp,%ebp
c000a6c8:	83 ec 48             	sub    $0x48,%esp
c000a6cb:	8b 45 08             	mov    0x8(%ebp),%eax
c000a6ce:	8b 40 0c             	mov    0xc(%eax),%eax
c000a6d1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000a6d4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a6d7:	8b 50 04             	mov    0x4(%eax),%edx
c000a6da:	8b 00                	mov    (%eax),%eax
c000a6dc:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c000a6df:	89 55 c8             	mov    %edx,-0x38(%ebp)
c000a6e2:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c000a6e5:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000a6e8:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000a6eb:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000a6ee:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a6f1:	8b 40 08             	mov    0x8(%eax),%eax
c000a6f4:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000a6f7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000a6fe:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000a705:	e8 a9 d3 ff ff       	call   c0007ab3 <intr_disable>
c000a70a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000a70d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000a714:	e9 c2 00 00 00       	jmp    c000a7db <build_body_stack+0x116>
c000a719:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000a71c:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a71f:	01 d0                	add    %edx,%eax
c000a721:	0f b6 00             	movzbl (%eax),%eax
c000a724:	88 45 d3             	mov    %al,-0x2d(%ebp)
c000a727:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000a72e:	e9 9a 00 00 00       	jmp    c000a7cd <build_body_stack+0x108>
c000a733:	0f be 55 d3          	movsbl -0x2d(%ebp),%edx
c000a737:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a73a:	89 c1                	mov    %eax,%ecx
c000a73c:	d3 fa                	sar    %cl,%edx
c000a73e:	89 d0                	mov    %edx,%eax
c000a740:	83 e0 01             	and    $0x1,%eax
c000a743:	85 c0                	test   %eax,%eax
c000a745:	75 06                	jne    c000a74d <build_body_stack+0x88>
c000a747:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000a74b:	eb 7c                	jmp    c000a7c9 <build_body_stack+0x104>
c000a74d:	8b 45 08             	mov    0x8(%ebp),%eax
c000a750:	8b 40 08             	mov    0x8(%eax),%eax
c000a753:	83 ec 0c             	sub    $0xc,%esp
c000a756:	50                   	push   %eax
c000a757:	e8 1f 6c ff ff       	call   c000137b <update_cr3>
c000a75c:	83 c4 10             	add    $0x10,%esp
c000a75f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a762:	c1 e0 0c             	shl    $0xc,%eax
c000a765:	89 c2                	mov    %eax,%edx
c000a767:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000a76a:	01 d0                	add    %edx,%eax
c000a76c:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000a76f:	8b 55 cc             	mov    -0x34(%ebp),%edx
c000a772:	8b 45 10             	mov    0x10(%ebp),%eax
c000a775:	83 ec 04             	sub    $0x4,%esp
c000a778:	68 00 10 00 00       	push   $0x1000
c000a77d:	52                   	push   %edx
c000a77e:	50                   	push   %eax
c000a77f:	e8 93 d3 ff ff       	call   c0007b17 <Memcpy>
c000a784:	83 c4 10             	add    $0x10,%esp
c000a787:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a78a:	8b 40 08             	mov    0x8(%eax),%eax
c000a78d:	83 ec 0c             	sub    $0xc,%esp
c000a790:	50                   	push   %eax
c000a791:	e8 e5 6b ff ff       	call   c000137b <update_cr3>
c000a796:	83 c4 10             	add    $0x10,%esp
c000a799:	83 ec 08             	sub    $0x8,%esp
c000a79c:	ff 75 cc             	pushl  -0x34(%ebp)
c000a79f:	6a 01                	push   $0x1
c000a7a1:	e8 09 c9 ff ff       	call   c00070af <get_a_virtual_page>
c000a7a6:	83 c4 10             	add    $0x10,%esp
c000a7a9:	8b 55 10             	mov    0x10(%ebp),%edx
c000a7ac:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000a7af:	83 ec 04             	sub    $0x4,%esp
c000a7b2:	68 00 10 00 00       	push   $0x1000
c000a7b7:	52                   	push   %edx
c000a7b8:	50                   	push   %eax
c000a7b9:	e8 59 d3 ff ff       	call   c0007b17 <Memcpy>
c000a7be:	83 c4 10             	add    $0x10,%esp
c000a7c1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000a7c5:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c000a7c9:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c000a7cd:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c000a7d1:	0f 8e 5c ff ff ff    	jle    c000a733 <build_body_stack+0x6e>
c000a7d7:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c000a7db:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a7de:	39 45 dc             	cmp    %eax,-0x24(%ebp)
c000a7e1:	0f 87 32 ff ff ff    	ja     c000a719 <build_body_stack+0x54>
c000a7e7:	83 ec 0c             	sub    $0xc,%esp
c000a7ea:	ff 75 d4             	pushl  -0x2c(%ebp)
c000a7ed:	e8 ea d2 ff ff       	call   c0007adc <intr_set_status>
c000a7f2:	83 c4 10             	add    $0x10,%esp
c000a7f5:	90                   	nop
c000a7f6:	c9                   	leave  
c000a7f7:	c3                   	ret    

c000a7f8 <build_process_kernel_stack>:
c000a7f8:	55                   	push   %ebp
c000a7f9:	89 e5                	mov    %esp,%ebp
c000a7fb:	83 ec 28             	sub    $0x28,%esp
c000a7fe:	e8 b0 d2 ff ff       	call   c0007ab3 <intr_disable>
c000a803:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a806:	8b 45 08             	mov    0x8(%ebp),%eax
c000a809:	05 00 10 00 00       	add    $0x1000,%eax
c000a80e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a811:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a814:	8b 00                	mov    (%eax),%eax
c000a816:	83 f8 38             	cmp    $0x38,%eax
c000a819:	74 06                	je     c000a821 <build_process_kernel_stack+0x29>
c000a81b:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c000a81f:	eb f0                	jmp    c000a811 <build_process_kernel_stack+0x19>
c000a821:	90                   	nop
c000a822:	8b 45 08             	mov    0x8(%ebp),%eax
c000a825:	05 00 10 00 00       	add    $0x1000,%eax
c000a82a:	89 c2                	mov    %eax,%edx
c000a82c:	8b 45 08             	mov    0x8(%ebp),%eax
c000a82f:	89 50 04             	mov    %edx,0x4(%eax)
c000a832:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a835:	83 c0 2c             	add    $0x2c,%eax
c000a838:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a83b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a83e:	83 e8 04             	sub    $0x4,%eax
c000a841:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000a844:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a847:	83 e8 08             	sub    $0x8,%eax
c000a84a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000a84d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a850:	83 e8 0c             	sub    $0xc,%eax
c000a853:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000a856:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a859:	83 e8 10             	sub    $0x10,%eax
c000a85c:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000a85f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a862:	83 e8 14             	sub    $0x14,%eax
c000a865:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000a868:	ba 63 12 00 c0       	mov    $0xc0001263,%edx
c000a86d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a870:	89 10                	mov    %edx,(%eax)
c000a872:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000a875:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000a87b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000a87e:	8b 10                	mov    (%eax),%edx
c000a880:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000a883:	89 10                	mov    %edx,(%eax)
c000a885:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000a888:	8b 10                	mov    (%eax),%edx
c000a88a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a88d:	89 10                	mov    %edx,(%eax)
c000a88f:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a892:	8b 10                	mov    (%eax),%edx
c000a894:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a897:	89 10                	mov    %edx,(%eax)
c000a899:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a89c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000a8a2:	8b 45 08             	mov    0x8(%ebp),%eax
c000a8a5:	8b 55 d8             	mov    -0x28(%ebp),%edx
c000a8a8:	89 10                	mov    %edx,(%eax)
c000a8aa:	83 ec 0c             	sub    $0xc,%esp
c000a8ad:	ff 75 f0             	pushl  -0x10(%ebp)
c000a8b0:	e8 27 d2 ff ff       	call   c0007adc <intr_set_status>
c000a8b5:	83 c4 10             	add    $0x10,%esp
c000a8b8:	90                   	nop
c000a8b9:	c9                   	leave  
c000a8ba:	c3                   	ret    

c000a8bb <fork_process>:
c000a8bb:	55                   	push   %ebp
c000a8bc:	89 e5                	mov    %esp,%ebp
c000a8be:	83 ec 18             	sub    $0x18,%esp
c000a8c1:	8b 45 08             	mov    0x8(%ebp),%eax
c000a8c4:	83 ec 0c             	sub    $0xc,%esp
c000a8c7:	50                   	push   %eax
c000a8c8:	e8 ef 9d ff ff       	call   c00046bc <pid2proc>
c000a8cd:	83 c4 10             	add    $0x10,%esp
c000a8d0:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a8d3:	83 ec 0c             	sub    $0xc,%esp
c000a8d6:	ff 75 f4             	pushl  -0xc(%ebp)
c000a8d9:	e8 70 fc ff ff       	call   c000a54e <clone_pcb>
c000a8de:	83 c4 10             	add    $0x10,%esp
c000a8e1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a8e4:	83 ec 08             	sub    $0x8,%esp
c000a8e7:	6a 00                	push   $0x0
c000a8e9:	6a 01                	push   $0x1
c000a8eb:	e8 5d c7 ff ff       	call   c000704d <alloc_memory>
c000a8f0:	83 c4 10             	add    $0x10,%esp
c000a8f3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a8f6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a8f9:	83 ec 04             	sub    $0x4,%esp
c000a8fc:	68 00 10 00 00       	push   $0x1000
c000a901:	6a 00                	push   $0x0
c000a903:	50                   	push   %eax
c000a904:	e8 36 15 00 00       	call   c000be3f <Memset>
c000a909:	83 c4 10             	add    $0x10,%esp
c000a90c:	83 ec 04             	sub    $0x4,%esp
c000a90f:	ff 75 ec             	pushl  -0x14(%ebp)
c000a912:	ff 75 f0             	pushl  -0x10(%ebp)
c000a915:	ff 75 f4             	pushl  -0xc(%ebp)
c000a918:	e8 a8 fd ff ff       	call   c000a6c5 <build_body_stack>
c000a91d:	83 c4 10             	add    $0x10,%esp
c000a920:	83 ec 0c             	sub    $0xc,%esp
c000a923:	ff 75 f0             	pushl  -0x10(%ebp)
c000a926:	e8 cd fe ff ff       	call   c000a7f8 <build_process_kernel_stack>
c000a92b:	83 c4 10             	add    $0x10,%esp
c000a92e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a931:	05 00 01 00 00       	add    $0x100,%eax
c000a936:	83 ec 04             	sub    $0x4,%esp
c000a939:	6a 08                	push   $0x8
c000a93b:	6a 00                	push   $0x0
c000a93d:	50                   	push   %eax
c000a93e:	e8 fc 14 00 00       	call   c000be3f <Memset>
c000a943:	83 c4 10             	add    $0x10,%esp
c000a946:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a949:	05 08 01 00 00       	add    $0x108,%eax
c000a94e:	83 ec 04             	sub    $0x4,%esp
c000a951:	6a 08                	push   $0x8
c000a953:	6a 00                	push   $0x0
c000a955:	50                   	push   %eax
c000a956:	e8 e4 14 00 00       	call   c000be3f <Memset>
c000a95b:	83 c4 10             	add    $0x10,%esp
c000a95e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a961:	05 08 01 00 00       	add    $0x108,%eax
c000a966:	83 ec 08             	sub    $0x8,%esp
c000a969:	50                   	push   %eax
c000a96a:	68 04 1f 01 c0       	push   $0xc0011f04
c000a96f:	e8 bc 02 00 00       	call   c000ac30 <appendToDoubleLinkList>
c000a974:	83 c4 10             	add    $0x10,%esp
c000a977:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a97a:	c9                   	leave  
c000a97b:	c3                   	ret    

c000a97c <process_execute>:
c000a97c:	55                   	push   %ebp
c000a97d:	89 e5                	mov    %esp,%ebp
c000a97f:	83 ec 28             	sub    $0x28,%esp
c000a982:	e8 bf 04 00 00       	call   c000ae46 <thread_init>
c000a987:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a98a:	83 ec 0c             	sub    $0xc,%esp
c000a98d:	ff 75 f4             	pushl  -0xc(%ebp)
c000a990:	e8 5e 05 00 00       	call   c000aef3 <thread_create>
c000a995:	83 c4 10             	add    $0x10,%esp
c000a998:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a99b:	05 34 01 00 00       	add    $0x134,%eax
c000a9a0:	83 ec 08             	sub    $0x8,%esp
c000a9a3:	ff 75 10             	pushl  0x10(%ebp)
c000a9a6:	50                   	push   %eax
c000a9a7:	e8 b2 14 00 00       	call   c000be5e <Strcpy>
c000a9ac:	83 c4 10             	add    $0x10,%esp
c000a9af:	83 ec 08             	sub    $0x8,%esp
c000a9b2:	6a 00                	push   $0x0
c000a9b4:	6a 01                	push   $0x1
c000a9b6:	e8 92 c6 ff ff       	call   c000704d <alloc_memory>
c000a9bb:	83 c4 10             	add    $0x10,%esp
c000a9be:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a9c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a9c4:	05 00 0c 00 00       	add    $0xc00,%eax
c000a9c9:	83 ec 04             	sub    $0x4,%esp
c000a9cc:	68 00 04 00 00       	push   $0x400
c000a9d1:	68 00 fc ff ff       	push   $0xfffffc00
c000a9d6:	50                   	push   %eax
c000a9d7:	e8 3b d1 ff ff       	call   c0007b17 <Memcpy>
c000a9dc:	83 c4 10             	add    $0x10,%esp
c000a9df:	83 ec 0c             	sub    $0xc,%esp
c000a9e2:	ff 75 f0             	pushl  -0x10(%ebp)
c000a9e5:	e8 7a c4 ff ff       	call   c0006e64 <get_physical_address>
c000a9ea:	83 c4 10             	add    $0x10,%esp
c000a9ed:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a9f0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a9f3:	05 fc 0f 00 00       	add    $0xffc,%eax
c000a9f8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000a9fb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a9fe:	83 c8 07             	or     $0x7,%eax
c000aa01:	89 c2                	mov    %eax,%edx
c000aa03:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000aa06:	89 10                	mov    %edx,(%eax)
c000aa08:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aa0b:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000aa0e:	89 50 08             	mov    %edx,0x8(%eax)
c000aa11:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aa14:	83 c0 10             	add    $0x10,%eax
c000aa17:	83 ec 0c             	sub    $0xc,%esp
c000aa1a:	50                   	push   %eax
c000aa1b:	e8 d9 cb ff ff       	call   c00075f9 <init_memory_block_desc>
c000aa20:	83 c4 10             	add    $0x10,%esp
c000aa23:	e8 87 f9 ff ff       	call   c000a3af <create_user_process_address_space>
c000aa28:	89 c2                	mov    %eax,%edx
c000aa2a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aa2d:	89 50 0c             	mov    %edx,0xc(%eax)
c000aa30:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aa33:	8b 00                	mov    (%eax),%eax
c000aa35:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000aa38:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aa3b:	c7 40 10 3f a4 00 c0 	movl   $0xc000a43f,0x10(%eax)
c000aa42:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aa45:	8b 55 08             	mov    0x8(%ebp),%edx
c000aa48:	89 50 18             	mov    %edx,0x18(%eax)
c000aa4b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aa4e:	8b 55 0c             	mov    0xc(%ebp),%edx
c000aa51:	89 50 1c             	mov    %edx,0x1c(%eax)
c000aa54:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aa57:	8b 55 14             	mov    0x14(%ebp),%edx
c000aa5a:	89 50 20             	mov    %edx,0x20(%eax)
c000aa5d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000aa60:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aa63:	89 50 24             	mov    %edx,0x24(%eax)
c000aa66:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aa69:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000aa6f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aa72:	8b 10                	mov    (%eax),%edx
c000aa74:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aa77:	89 50 04             	mov    %edx,0x4(%eax)
c000aa7a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aa7d:	8b 50 04             	mov    0x4(%eax),%edx
c000aa80:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aa83:	89 50 08             	mov    %edx,0x8(%eax)
c000aa86:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aa89:	8b 50 08             	mov    0x8(%eax),%edx
c000aa8c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aa8f:	89 50 0c             	mov    %edx,0xc(%eax)
c000aa92:	83 ec 0c             	sub    $0xc,%esp
c000aa95:	68 ec 0d 01 c0       	push   $0xc0010dec
c000aa9a:	e8 94 00 00 00       	call   c000ab33 <isListEmpty>
c000aa9f:	83 c4 10             	add    $0x10,%esp
c000aaa2:	e8 0c d0 ff ff       	call   c0007ab3 <intr_disable>
c000aaa7:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000aaaa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aaad:	05 00 01 00 00       	add    $0x100,%eax
c000aab2:	83 ec 08             	sub    $0x8,%esp
c000aab5:	50                   	push   %eax
c000aab6:	68 ec 0d 01 c0       	push   $0xc0010dec
c000aabb:	e8 70 01 00 00       	call   c000ac30 <appendToDoubleLinkList>
c000aac0:	83 c4 10             	add    $0x10,%esp
c000aac3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aac6:	05 08 01 00 00       	add    $0x108,%eax
c000aacb:	83 ec 08             	sub    $0x8,%esp
c000aace:	50                   	push   %eax
c000aacf:	68 04 1f 01 c0       	push   $0xc0011f04
c000aad4:	e8 57 01 00 00       	call   c000ac30 <appendToDoubleLinkList>
c000aad9:	83 c4 10             	add    $0x10,%esp
c000aadc:	83 ec 0c             	sub    $0xc,%esp
c000aadf:	ff 75 e0             	pushl  -0x20(%ebp)
c000aae2:	e8 f5 cf ff ff       	call   c0007adc <intr_set_status>
c000aae7:	83 c4 10             	add    $0x10,%esp
c000aaea:	90                   	nop
c000aaeb:	c9                   	leave  
c000aaec:	c3                   	ret    
c000aaed:	66 90                	xchg   %ax,%ax
c000aaef:	90                   	nop

c000aaf0 <switch_to>:
c000aaf0:	56                   	push   %esi
c000aaf1:	57                   	push   %edi
c000aaf2:	53                   	push   %ebx
c000aaf3:	55                   	push   %ebp
c000aaf4:	89 e5                	mov    %esp,%ebp
c000aaf6:	8b 45 14             	mov    0x14(%ebp),%eax
c000aaf9:	89 20                	mov    %esp,(%eax)
c000aafb:	8b 45 18             	mov    0x18(%ebp),%eax
c000aafe:	8b 20                	mov    (%eax),%esp
c000ab00:	5d                   	pop    %ebp
c000ab01:	5b                   	pop    %ebx
c000ab02:	5f                   	pop    %edi
c000ab03:	5e                   	pop    %esi
c000ab04:	c3                   	ret    

c000ab05 <initDoubleLinkList>:
c000ab05:	55                   	push   %ebp
c000ab06:	89 e5                	mov    %esp,%ebp
c000ab08:	8b 45 08             	mov    0x8(%ebp),%eax
c000ab0b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000ab11:	8b 45 08             	mov    0x8(%ebp),%eax
c000ab14:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c000ab1b:	8b 45 08             	mov    0x8(%ebp),%eax
c000ab1e:	8d 50 08             	lea    0x8(%eax),%edx
c000ab21:	8b 45 08             	mov    0x8(%ebp),%eax
c000ab24:	89 50 04             	mov    %edx,0x4(%eax)
c000ab27:	8b 55 08             	mov    0x8(%ebp),%edx
c000ab2a:	8b 45 08             	mov    0x8(%ebp),%eax
c000ab2d:	89 50 08             	mov    %edx,0x8(%eax)
c000ab30:	90                   	nop
c000ab31:	5d                   	pop    %ebp
c000ab32:	c3                   	ret    

c000ab33 <isListEmpty>:
c000ab33:	55                   	push   %ebp
c000ab34:	89 e5                	mov    %esp,%ebp
c000ab36:	8b 45 08             	mov    0x8(%ebp),%eax
c000ab39:	8b 40 04             	mov    0x4(%eax),%eax
c000ab3c:	8b 55 08             	mov    0x8(%ebp),%edx
c000ab3f:	83 c2 08             	add    $0x8,%edx
c000ab42:	39 d0                	cmp    %edx,%eax
c000ab44:	75 07                	jne    c000ab4d <isListEmpty+0x1a>
c000ab46:	b8 01 00 00 00       	mov    $0x1,%eax
c000ab4b:	eb 05                	jmp    c000ab52 <isListEmpty+0x1f>
c000ab4d:	b8 00 00 00 00       	mov    $0x0,%eax
c000ab52:	5d                   	pop    %ebp
c000ab53:	c3                   	ret    

c000ab54 <findElementInList>:
c000ab54:	55                   	push   %ebp
c000ab55:	89 e5                	mov    %esp,%ebp
c000ab57:	83 ec 28             	sub    $0x28,%esp
c000ab5a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c000ab5e:	75 19                	jne    c000ab79 <findElementInList+0x25>
c000ab60:	6a 60                	push   $0x60
c000ab62:	68 e5 bd 00 c0       	push   $0xc000bde5
c000ab67:	68 e5 bd 00 c0       	push   $0xc000bde5
c000ab6c:	68 f8 bd 00 c0       	push   $0xc000bdf8
c000ab71:	e8 25 eb ff ff       	call   c000969b <assertion_failure>
c000ab76:	83 c4 10             	add    $0x10,%esp
c000ab79:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000ab7d:	75 19                	jne    c000ab98 <findElementInList+0x44>
c000ab7f:	6a 61                	push   $0x61
c000ab81:	68 e5 bd 00 c0       	push   $0xc000bde5
c000ab86:	68 e5 bd 00 c0       	push   $0xc000bde5
c000ab8b:	68 04 be 00 c0       	push   $0xc000be04
c000ab90:	e8 06 eb ff ff       	call   c000969b <assertion_failure>
c000ab95:	83 c4 10             	add    $0x10,%esp
c000ab98:	e8 16 cf ff ff       	call   c0007ab3 <intr_disable>
c000ab9d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000aba0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000aba7:	8b 45 08             	mov    0x8(%ebp),%eax
c000abaa:	8b 40 08             	mov    0x8(%eax),%eax
c000abad:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000abb0:	8b 45 08             	mov    0x8(%ebp),%eax
c000abb3:	8b 40 04             	mov    0x4(%eax),%eax
c000abb6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000abb9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000abbd:	75 07                	jne    c000abc6 <findElementInList+0x72>
c000abbf:	b8 00 00 00 00       	mov    $0x0,%eax
c000abc4:	eb 68                	jmp    c000ac2e <findElementInList+0xda>
c000abc6:	8b 45 0c             	mov    0xc(%ebp),%eax
c000abc9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000abcc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000abcf:	2b 45 f0             	sub    -0x10(%ebp),%eax
c000abd2:	c1 f8 03             	sar    $0x3,%eax
c000abd5:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000abd8:	eb 36                	jmp    c000ac10 <findElementInList+0xbc>
c000abda:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000abdd:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c000abe0:	75 07                	jne    c000abe9 <findElementInList+0x95>
c000abe2:	b8 01 00 00 00       	mov    $0x1,%eax
c000abe7:	eb 45                	jmp    c000ac2e <findElementInList+0xda>
c000abe9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000abed:	75 07                	jne    c000abf6 <findElementInList+0xa2>
c000abef:	b8 00 00 00 00       	mov    $0x0,%eax
c000abf4:	eb 38                	jmp    c000ac2e <findElementInList+0xda>
c000abf6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000abf9:	8b 40 04             	mov    0x4(%eax),%eax
c000abfc:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000abff:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000ac03:	75 07                	jne    c000ac0c <findElementInList+0xb8>
c000ac05:	b8 00 00 00 00       	mov    $0x0,%eax
c000ac0a:	eb 22                	jmp    c000ac2e <findElementInList+0xda>
c000ac0c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000ac10:	8b 45 08             	mov    0x8(%ebp),%eax
c000ac13:	83 c0 08             	add    $0x8,%eax
c000ac16:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c000ac19:	75 bf                	jne    c000abda <findElementInList+0x86>
c000ac1b:	83 ec 0c             	sub    $0xc,%esp
c000ac1e:	ff 75 ec             	pushl  -0x14(%ebp)
c000ac21:	e8 b6 ce ff ff       	call   c0007adc <intr_set_status>
c000ac26:	83 c4 10             	add    $0x10,%esp
c000ac29:	b8 00 00 00 00       	mov    $0x0,%eax
c000ac2e:	c9                   	leave  
c000ac2f:	c3                   	ret    

c000ac30 <appendToDoubleLinkList>:
c000ac30:	55                   	push   %ebp
c000ac31:	89 e5                	mov    %esp,%ebp
c000ac33:	83 ec 18             	sub    $0x18,%esp
c000ac36:	83 ec 08             	sub    $0x8,%esp
c000ac39:	ff 75 0c             	pushl  0xc(%ebp)
c000ac3c:	ff 75 08             	pushl  0x8(%ebp)
c000ac3f:	e8 10 ff ff ff       	call   c000ab54 <findElementInList>
c000ac44:	83 c4 10             	add    $0x10,%esp
c000ac47:	3c 01                	cmp    $0x1,%al
c000ac49:	0f 84 c2 00 00 00    	je     c000ad11 <appendToDoubleLinkList+0xe1>
c000ac4f:	e8 5f ce ff ff       	call   c0007ab3 <intr_disable>
c000ac54:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000ac57:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c000ac5b:	75 1c                	jne    c000ac79 <appendToDoubleLinkList+0x49>
c000ac5d:	68 9e 00 00 00       	push   $0x9e
c000ac62:	68 e5 bd 00 c0       	push   $0xc000bde5
c000ac67:	68 e5 bd 00 c0       	push   $0xc000bde5
c000ac6c:	68 f8 bd 00 c0       	push   $0xc000bdf8
c000ac71:	e8 25 ea ff ff       	call   c000969b <assertion_failure>
c000ac76:	83 c4 10             	add    $0x10,%esp
c000ac79:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000ac7d:	75 1c                	jne    c000ac9b <appendToDoubleLinkList+0x6b>
c000ac7f:	68 9f 00 00 00       	push   $0x9f
c000ac84:	68 e5 bd 00 c0       	push   $0xc000bde5
c000ac89:	68 e5 bd 00 c0       	push   $0xc000bde5
c000ac8e:	68 04 be 00 c0       	push   $0xc000be04
c000ac93:	e8 03 ea ff ff       	call   c000969b <assertion_failure>
c000ac98:	83 c4 10             	add    $0x10,%esp
c000ac9b:	83 ec 08             	sub    $0x8,%esp
c000ac9e:	ff 75 0c             	pushl  0xc(%ebp)
c000aca1:	ff 75 08             	pushl  0x8(%ebp)
c000aca4:	e8 ab fe ff ff       	call   c000ab54 <findElementInList>
c000aca9:	83 c4 10             	add    $0x10,%esp
c000acac:	3c 01                	cmp    $0x1,%al
c000acae:	74 64                	je     c000ad14 <appendToDoubleLinkList+0xe4>
c000acb0:	8b 45 0c             	mov    0xc(%ebp),%eax
c000acb3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000acb6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000acb9:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c000acc0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000acc3:	8b 50 04             	mov    0x4(%eax),%edx
c000acc6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000acc9:	89 10                	mov    %edx,(%eax)
c000accb:	8b 45 08             	mov    0x8(%ebp),%eax
c000acce:	8b 50 08             	mov    0x8(%eax),%edx
c000acd1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000acd4:	89 10                	mov    %edx,(%eax)
c000acd6:	8b 45 08             	mov    0x8(%ebp),%eax
c000acd9:	8b 40 08             	mov    0x8(%eax),%eax
c000acdc:	85 c0                	test   %eax,%eax
c000acde:	74 0c                	je     c000acec <appendToDoubleLinkList+0xbc>
c000ace0:	8b 45 08             	mov    0x8(%ebp),%eax
c000ace3:	8b 40 08             	mov    0x8(%eax),%eax
c000ace6:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000ace9:	89 50 04             	mov    %edx,0x4(%eax)
c000acec:	8b 45 08             	mov    0x8(%ebp),%eax
c000acef:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000acf2:	89 50 08             	mov    %edx,0x8(%eax)
c000acf5:	8b 45 08             	mov    0x8(%ebp),%eax
c000acf8:	8d 50 08             	lea    0x8(%eax),%edx
c000acfb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000acfe:	89 50 04             	mov    %edx,0x4(%eax)
c000ad01:	83 ec 0c             	sub    $0xc,%esp
c000ad04:	ff 75 f4             	pushl  -0xc(%ebp)
c000ad07:	e8 d0 cd ff ff       	call   c0007adc <intr_set_status>
c000ad0c:	83 c4 10             	add    $0x10,%esp
c000ad0f:	eb 04                	jmp    c000ad15 <appendToDoubleLinkList+0xe5>
c000ad11:	90                   	nop
c000ad12:	eb 01                	jmp    c000ad15 <appendToDoubleLinkList+0xe5>
c000ad14:	90                   	nop
c000ad15:	c9                   	leave  
c000ad16:	c3                   	ret    

c000ad17 <insertToDoubleLinkList>:
c000ad17:	55                   	push   %ebp
c000ad18:	89 e5                	mov    %esp,%ebp
c000ad1a:	83 ec 18             	sub    $0x18,%esp
c000ad1d:	83 ec 08             	sub    $0x8,%esp
c000ad20:	ff 75 0c             	pushl  0xc(%ebp)
c000ad23:	ff 75 08             	pushl  0x8(%ebp)
c000ad26:	e8 29 fe ff ff       	call   c000ab54 <findElementInList>
c000ad2b:	83 c4 10             	add    $0x10,%esp
c000ad2e:	3c 01                	cmp    $0x1,%al
c000ad30:	74 65                	je     c000ad97 <insertToDoubleLinkList+0x80>
c000ad32:	e8 7c cd ff ff       	call   c0007ab3 <intr_disable>
c000ad37:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000ad3a:	8b 45 0c             	mov    0xc(%ebp),%eax
c000ad3d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000ad40:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ad43:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c000ad4a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ad4d:	8b 50 04             	mov    0x4(%eax),%edx
c000ad50:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ad53:	89 10                	mov    %edx,(%eax)
c000ad55:	8b 45 08             	mov    0x8(%ebp),%eax
c000ad58:	8b 50 04             	mov    0x4(%eax),%edx
c000ad5b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ad5e:	89 50 04             	mov    %edx,0x4(%eax)
c000ad61:	8b 45 08             	mov    0x8(%ebp),%eax
c000ad64:	8b 40 04             	mov    0x4(%eax),%eax
c000ad67:	85 c0                	test   %eax,%eax
c000ad69:	74 0b                	je     c000ad76 <insertToDoubleLinkList+0x5f>
c000ad6b:	8b 45 08             	mov    0x8(%ebp),%eax
c000ad6e:	8b 40 04             	mov    0x4(%eax),%eax
c000ad71:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000ad74:	89 10                	mov    %edx,(%eax)
c000ad76:	8b 45 08             	mov    0x8(%ebp),%eax
c000ad79:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000ad7c:	89 50 04             	mov    %edx,0x4(%eax)
c000ad7f:	8b 55 08             	mov    0x8(%ebp),%edx
c000ad82:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ad85:	89 10                	mov    %edx,(%eax)
c000ad87:	83 ec 0c             	sub    $0xc,%esp
c000ad8a:	ff 75 f4             	pushl  -0xc(%ebp)
c000ad8d:	e8 4a cd ff ff       	call   c0007adc <intr_set_status>
c000ad92:	83 c4 10             	add    $0x10,%esp
c000ad95:	eb 01                	jmp    c000ad98 <insertToDoubleLinkList+0x81>
c000ad97:	90                   	nop
c000ad98:	c9                   	leave  
c000ad99:	c3                   	ret    

c000ad9a <popFromDoubleLinkList>:
c000ad9a:	55                   	push   %ebp
c000ad9b:	89 e5                	mov    %esp,%ebp
c000ad9d:	83 ec 18             	sub    $0x18,%esp
c000ada0:	e8 0e cd ff ff       	call   c0007ab3 <intr_disable>
c000ada5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000ada8:	83 ec 0c             	sub    $0xc,%esp
c000adab:	ff 75 08             	pushl  0x8(%ebp)
c000adae:	e8 80 fd ff ff       	call   c000ab33 <isListEmpty>
c000adb3:	83 c4 10             	add    $0x10,%esp
c000adb6:	3c 01                	cmp    $0x1,%al
c000adb8:	75 07                	jne    c000adc1 <popFromDoubleLinkList+0x27>
c000adba:	b8 00 00 00 00       	mov    $0x0,%eax
c000adbf:	eb 6b                	jmp    c000ae2c <popFromDoubleLinkList+0x92>
c000adc1:	8b 45 08             	mov    0x8(%ebp),%eax
c000adc4:	8b 40 08             	mov    0x8(%eax),%eax
c000adc7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000adca:	8b 45 08             	mov    0x8(%ebp),%eax
c000adcd:	8b 40 08             	mov    0x8(%eax),%eax
c000add0:	85 c0                	test   %eax,%eax
c000add2:	75 07                	jne    c000addb <popFromDoubleLinkList+0x41>
c000add4:	b8 00 00 00 00       	mov    $0x0,%eax
c000add9:	eb 51                	jmp    c000ae2c <popFromDoubleLinkList+0x92>
c000addb:	8b 45 08             	mov    0x8(%ebp),%eax
c000adde:	8b 40 08             	mov    0x8(%eax),%eax
c000ade1:	8b 00                	mov    (%eax),%eax
c000ade3:	85 c0                	test   %eax,%eax
c000ade5:	74 11                	je     c000adf8 <popFromDoubleLinkList+0x5e>
c000ade7:	8b 45 08             	mov    0x8(%ebp),%eax
c000adea:	8b 40 08             	mov    0x8(%eax),%eax
c000aded:	8b 00                	mov    (%eax),%eax
c000adef:	8b 55 08             	mov    0x8(%ebp),%edx
c000adf2:	83 c2 08             	add    $0x8,%edx
c000adf5:	89 50 04             	mov    %edx,0x4(%eax)
c000adf8:	8b 45 08             	mov    0x8(%ebp),%eax
c000adfb:	8b 40 08             	mov    0x8(%eax),%eax
c000adfe:	8b 10                	mov    (%eax),%edx
c000ae00:	8b 45 08             	mov    0x8(%ebp),%eax
c000ae03:	89 50 08             	mov    %edx,0x8(%eax)
c000ae06:	83 ec 0c             	sub    $0xc,%esp
c000ae09:	ff 75 f4             	pushl  -0xc(%ebp)
c000ae0c:	e8 cb cc ff ff       	call   c0007adc <intr_set_status>
c000ae11:	83 c4 10             	add    $0x10,%esp
c000ae14:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ae17:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c000ae1e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ae21:	8b 50 04             	mov    0x4(%eax),%edx
c000ae24:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ae27:	89 10                	mov    %edx,(%eax)
c000ae29:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ae2c:	c9                   	leave  
c000ae2d:	c3                   	ret    

c000ae2e <kernel_thread>:
c000ae2e:	55                   	push   %ebp
c000ae2f:	89 e5                	mov    %esp,%ebp
c000ae31:	83 ec 08             	sub    $0x8,%esp
c000ae34:	fb                   	sti    
c000ae35:	83 ec 0c             	sub    $0xc,%esp
c000ae38:	ff 75 0c             	pushl  0xc(%ebp)
c000ae3b:	8b 45 08             	mov    0x8(%ebp),%eax
c000ae3e:	ff d0                	call   *%eax
c000ae40:	83 c4 10             	add    $0x10,%esp
c000ae43:	90                   	nop
c000ae44:	c9                   	leave  
c000ae45:	c3                   	ret    

c000ae46 <thread_init>:
c000ae46:	55                   	push   %ebp
c000ae47:	89 e5                	mov    %esp,%ebp
c000ae49:	83 ec 18             	sub    $0x18,%esp
c000ae4c:	83 ec 08             	sub    $0x8,%esp
c000ae4f:	6a 00                	push   $0x0
c000ae51:	6a 01                	push   $0x1
c000ae53:	e8 f5 c1 ff ff       	call   c000704d <alloc_memory>
c000ae58:	83 c4 10             	add    $0x10,%esp
c000ae5b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000ae5e:	83 ec 04             	sub    $0x4,%esp
c000ae61:	68 00 10 00 00       	push   $0x1000
c000ae66:	6a 00                	push   $0x0
c000ae68:	ff 75 f4             	pushl  -0xc(%ebp)
c000ae6b:	e8 cf 0f 00 00       	call   c000be3f <Memset>
c000ae70:	83 c4 10             	add    $0x10,%esp
c000ae73:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ae76:	05 00 10 00 00       	add    $0x1000,%eax
c000ae7b:	89 c2                	mov    %eax,%edx
c000ae7d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ae80:	89 10                	mov    %edx,(%eax)
c000ae82:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ae85:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c000ae8c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ae8f:	c7 80 64 02 00 00 ff 	movl   $0xffffffff,0x264(%eax)
c000ae96:	ff ff ff 
c000ae99:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ae9c:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c000aea3:	00 00 00 
c000aea6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aea9:	8b 90 5c 02 00 00    	mov    0x25c(%eax),%edx
c000aeaf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aeb2:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c000aeb8:	a1 90 07 01 c0       	mov    0xc0010790,%eax
c000aebd:	83 c0 01             	add    $0x1,%eax
c000aec0:	a3 90 07 01 c0       	mov    %eax,0xc0010790
c000aec5:	8b 15 90 07 01 c0    	mov    0xc0010790,%edx
c000aecb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aece:	89 90 24 01 00 00    	mov    %edx,0x124(%eax)
c000aed4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aed7:	c7 80 28 01 00 00 0a 	movl   $0xa,0x128(%eax)
c000aede:	00 00 00 
c000aee1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aee4:	c7 80 b0 02 00 00 e0 	movl   $0x99abcde0,0x2b0(%eax)
c000aeeb:	cd ab 99 
c000aeee:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aef1:	c9                   	leave  
c000aef2:	c3                   	ret    

c000aef3 <thread_create>:
c000aef3:	55                   	push   %ebp
c000aef4:	89 e5                	mov    %esp,%ebp
c000aef6:	83 ec 10             	sub    $0x10,%esp
c000aef9:	c7 45 fc 44 00 00 00 	movl   $0x44,-0x4(%ebp)
c000af00:	c7 45 f8 2c 00 00 00 	movl   $0x2c,-0x8(%ebp)
c000af07:	8b 45 08             	mov    0x8(%ebp),%eax
c000af0a:	8b 00                	mov    (%eax),%eax
c000af0c:	2b 45 fc             	sub    -0x4(%ebp),%eax
c000af0f:	89 c2                	mov    %eax,%edx
c000af11:	8b 45 08             	mov    0x8(%ebp),%eax
c000af14:	89 10                	mov    %edx,(%eax)
c000af16:	8b 45 08             	mov    0x8(%ebp),%eax
c000af19:	8b 00                	mov    (%eax),%eax
c000af1b:	2b 45 f8             	sub    -0x8(%ebp),%eax
c000af1e:	89 c2                	mov    %eax,%edx
c000af20:	8b 45 08             	mov    0x8(%ebp),%eax
c000af23:	89 10                	mov    %edx,(%eax)
c000af25:	90                   	nop
c000af26:	c9                   	leave  
c000af27:	c3                   	ret    

c000af28 <thread_start>:
c000af28:	55                   	push   %ebp
c000af29:	89 e5                	mov    %esp,%ebp
c000af2b:	83 ec 18             	sub    $0x18,%esp
c000af2e:	e8 13 ff ff ff       	call   c000ae46 <thread_init>
c000af33:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000af36:	83 ec 0c             	sub    $0xc,%esp
c000af39:	ff 75 f4             	pushl  -0xc(%ebp)
c000af3c:	e8 b2 ff ff ff       	call   c000aef3 <thread_create>
c000af41:	83 c4 10             	add    $0x10,%esp
c000af44:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000af47:	05 34 01 00 00       	add    $0x134,%eax
c000af4c:	83 ec 08             	sub    $0x8,%esp
c000af4f:	ff 75 10             	pushl  0x10(%ebp)
c000af52:	50                   	push   %eax
c000af53:	e8 06 0f 00 00       	call   c000be5e <Strcpy>
c000af58:	83 c4 10             	add    $0x10,%esp
c000af5b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000af5e:	8b 00                	mov    (%eax),%eax
c000af60:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000af63:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000af66:	c7 40 10 2e ae 00 c0 	movl   $0xc000ae2e,0x10(%eax)
c000af6d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000af70:	8b 55 08             	mov    0x8(%ebp),%edx
c000af73:	89 50 18             	mov    %edx,0x18(%eax)
c000af76:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000af79:	8b 55 0c             	mov    0xc(%ebp),%edx
c000af7c:	89 50 1c             	mov    %edx,0x1c(%eax)
c000af7f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000af82:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000af88:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000af8b:	8b 10                	mov    (%eax),%edx
c000af8d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000af90:	89 50 04             	mov    %edx,0x4(%eax)
c000af93:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000af96:	8b 50 04             	mov    0x4(%eax),%edx
c000af99:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000af9c:	89 50 08             	mov    %edx,0x8(%eax)
c000af9f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000afa2:	8b 50 08             	mov    0x8(%eax),%edx
c000afa5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000afa8:	89 50 0c             	mov    %edx,0xc(%eax)
c000afab:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000afae:	05 00 01 00 00       	add    $0x100,%eax
c000afb3:	83 ec 08             	sub    $0x8,%esp
c000afb6:	50                   	push   %eax
c000afb7:	68 ec 0d 01 c0       	push   $0xc0010dec
c000afbc:	e8 6f fc ff ff       	call   c000ac30 <appendToDoubleLinkList>
c000afc1:	83 c4 10             	add    $0x10,%esp
c000afc4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000afc7:	05 08 01 00 00       	add    $0x108,%eax
c000afcc:	83 ec 08             	sub    $0x8,%esp
c000afcf:	50                   	push   %eax
c000afd0:	68 04 1f 01 c0       	push   $0xc0011f04
c000afd5:	e8 56 fc ff ff       	call   c000ac30 <appendToDoubleLinkList>
c000afda:	83 c4 10             	add    $0x10,%esp
c000afdd:	90                   	nop
c000afde:	c9                   	leave  
c000afdf:	c3                   	ret    
