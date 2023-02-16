
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
c000114b:	e8 03 6f 00 00       	call   c0008053 <exception_handler>
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
c0001168:	e8 e6 6e 00 00       	call   c0008053 <exception_handler>
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
c00012e9:	e8 ff 6b 00 00       	call   c0007eed <disp_int>
c00012ee:	83 c4 04             	add    $0x4,%esp
c00012f1:	58                   	pop    %eax
c00012f2:	5a                   	pop    %edx
c00012f3:	52                   	push   %edx
c00012f4:	50                   	push   %eax
c00012f5:	e8 f3 6b 00 00       	call   c0007eed <disp_int>
c00012fa:	58                   	pop    %eax
c00012fb:	5a                   	pop    %edx
c00012fc:	52                   	push   %edx
c00012fd:	50                   	push   %eax
c00012fe:	ff 35 a4 07 01 c0    	pushl  0xc00107a4
c0001304:	e8 e4 6b 00 00       	call   c0007eed <disp_int>
c0001309:	83 c4 04             	add    $0x4,%esp
c000130c:	58                   	pop    %eax
c000130d:	5a                   	pop    %edx
c000130e:	52                   	push   %edx
c000130f:	50                   	push   %eax
c0001310:	ff 72 ec             	pushl  -0x14(%edx)
c0001313:	e8 d5 6b 00 00       	call   c0007eed <disp_int>
c0001318:	83 c4 04             	add    $0x4,%esp
c000131b:	58                   	pop    %eax
c000131c:	5a                   	pop    %edx
c000131d:	52                   	push   %edx
c000131e:	50                   	push   %eax
c000131f:	ff 70 ec             	pushl  -0x14(%eax)
c0001322:	e8 c6 6b 00 00       	call   c0007eed <disp_int>
c0001327:	83 c4 04             	add    $0x4,%esp
c000132a:	58                   	pop    %eax
c000132b:	5a                   	pop    %edx
c000132c:	52                   	push   %edx
c000132d:	50                   	push   %eax
c000132e:	ff 35 c0 0b 01 c0    	pushl  0xc0010bc0
c0001334:	e8 b4 6b 00 00       	call   c0007eed <disp_int>
c0001339:	83 c4 04             	add    $0x4,%esp
c000133c:	58                   	pop    %eax
c000133d:	5a                   	pop    %edx
c000133e:	52                   	push   %edx
c000133f:	50                   	push   %eax
c0001340:	68 60 07 01 c0       	push   $0xc0010760
c0001345:	e8 a3 6b 00 00       	call   c0007eed <disp_int>
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
c00013cd:	e8 4e 98 00 00       	call   c000ac20 <appendToDoubleLinkList>
c00013d2:	83 c4 10             	add    $0x10,%esp
c00013d5:	a1 e0 1e 01 c0       	mov    0xc0011ee0,%eax
c00013da:	05 08 01 00 00       	add    $0x108,%eax
c00013df:	83 ec 08             	sub    $0x8,%esp
c00013e2:	50                   	push   %eax
c00013e3:	68 ec 0d 01 c0       	push   $0xc0010dec
c00013e8:	e8 33 98 00 00       	call   c000ac20 <appendToDoubleLinkList>
c00013ed:	83 c4 10             	add    $0x10,%esp
c00013f0:	6a 00                	push   $0x0
c00013f2:	68 e0 af 00 c0       	push   $0xc000afe0
c00013f7:	68 e7 af 00 c0       	push   $0xc000afe7
c00013fc:	68 2c 60 00 c0       	push   $0xc000602c
c0001401:	e8 63 95 00 00       	call   c000a969 <process_execute>
c0001406:	83 c4 10             	add    $0x10,%esp
c0001409:	6a 00                	push   $0x0
c000140b:	68 f0 af 00 c0       	push   $0xc000aff0
c0001410:	68 f8 af 00 c0       	push   $0xc000aff8
c0001415:	68 f1 24 00 c0       	push   $0xc00024f1
c000141a:	e8 4a 95 00 00       	call   c000a969 <process_execute>
c000141f:	83 c4 10             	add    $0x10,%esp
c0001422:	6a 00                	push   $0x0
c0001424:	68 01 b0 00 c0       	push   $0xc000b001
c0001429:	68 08 b0 00 c0       	push   $0xc000b008
c000142e:	68 2b 16 00 c0       	push   $0xc000162b
c0001433:	e8 31 95 00 00       	call   c000a969 <process_execute>
c0001438:	83 c4 10             	add    $0x10,%esp
c000143b:	6a 00                	push   $0x0
c000143d:	68 11 b0 00 c0       	push   $0xc000b011
c0001442:	68 19 b0 00 c0       	push   $0xc000b019
c0001447:	68 ac 54 00 c0       	push   $0xc00054ac
c000144c:	e8 18 95 00 00       	call   c000a969 <process_execute>
c0001451:	83 c4 10             	add    $0x10,%esp
c0001454:	6a 01                	push   $0x1
c0001456:	68 23 b0 00 c0       	push   $0xc000b023
c000145b:	68 2d b0 00 c0       	push   $0xc000b02d
c0001460:	68 f6 15 00 c0       	push   $0xc00015f6
c0001465:	e8 ff 94 00 00       	call   c000a969 <process_execute>
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
c00014be:	e8 7a 6f 00 00       	call   c000843d <init_keyboard>
c00014c3:	83 ec 0c             	sub    $0xc,%esp
c00014c6:	68 00 00 00 04       	push   $0x4000000
c00014cb:	e8 5e 64 00 00       	call   c000792e <init_memory>
c00014d0:	83 c4 10             	add    $0x10,%esp
c00014d3:	83 ec 0c             	sub    $0xc,%esp
c00014d6:	68 ec 0d 01 c0       	push   $0xc0010dec
c00014db:	e8 15 96 00 00       	call   c000aaf5 <initDoubleLinkList>
c00014e0:	83 c4 10             	add    $0x10,%esp
c00014e3:	83 ec 0c             	sub    $0xc,%esp
c00014e6:	68 04 1f 01 c0       	push   $0xc0011f04
c00014eb:	e8 05 96 00 00       	call   c000aaf5 <initDoubleLinkList>
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
c000160c:	e8 26 74 00 00       	call   c0008a37 <INIT_fork>
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
c000169a:	e8 26 89 00 00       	call   c0009fc5 <send_rec>
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
c000171d:	e8 66 7f 00 00       	call   c0009688 <assertion_failure>
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
c000177e:	e8 c1 7e 00 00       	call   c0009644 <spin>
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
c00017b8:	e8 ad 7e 00 00       	call   c000966a <panic>
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
c0001aeb:	e8 3b 78 00 00       	call   c000932b <Printf>
c0001af0:	83 c4 10             	add    $0x10,%esp
c0001af3:	8b 45 08             	mov    0x8(%ebp),%eax
c0001af6:	8b 40 0c             	mov    0xc(%eax),%eax
c0001af9:	83 ec 08             	sub    $0x8,%esp
c0001afc:	50                   	push   %eax
c0001afd:	68 0a b1 00 c0       	push   $0xc000b10a
c0001b02:	e8 24 78 00 00       	call   c000932b <Printf>
c0001b07:	83 c4 10             	add    $0x10,%esp
c0001b0a:	8b 45 08             	mov    0x8(%ebp),%eax
c0001b0d:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0001b11:	0f b6 c0             	movzbl %al,%eax
c0001b14:	83 ec 08             	sub    $0x8,%esp
c0001b17:	50                   	push   %eax
c0001b18:	68 1b b1 00 c0       	push   $0xc000b11b
c0001b1d:	e8 09 78 00 00       	call   c000932b <Printf>
c0001b22:	83 c4 10             	add    $0x10,%esp
c0001b25:	8b 45 08             	mov    0x8(%ebp),%eax
c0001b28:	0f b6 00             	movzbl (%eax),%eax
c0001b2b:	0f b6 c0             	movzbl %al,%eax
c0001b2e:	83 ec 08             	sub    $0x8,%esp
c0001b31:	50                   	push   %eax
c0001b32:	68 29 b1 00 c0       	push   $0xc000b129
c0001b37:	e8 ef 77 00 00       	call   c000932b <Printf>
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
c0001c0a:	e8 f5 5e 00 00       	call   c0007b04 <Memcpy>
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
c0001ec7:	e8 f9 80 00 00       	call   c0009fc5 <send_rec>
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
c0001f76:	e8 4a 80 00 00       	call   c0009fc5 <send_rec>
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
c0001fb9:	e8 ac 76 00 00       	call   c000966a <panic>
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
c0001ff9:	e8 c7 7f 00 00       	call   c0009fc5 <send_rec>
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
c000210b:	e8 f7 4b 00 00       	call   c0006d07 <alloc_virtual_memory>
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
c000213f:	e8 44 75 00 00       	call   c0009688 <assertion_failure>
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
c00021b1:	e8 d2 74 00 00       	call   c0009688 <assertion_failure>
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
c000222d:	e8 d2 58 00 00       	call   c0007b04 <Memcpy>
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
c00022a8:	e8 18 7d 00 00       	call   c0009fc5 <send_rec>
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
c00022d4:	e8 87 7f 00 00       	call   c000a260 <inform_int>
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
c0002331:	e8 f5 6f 00 00       	call   c000932b <Printf>
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
c000236e:	e8 b8 6f 00 00       	call   c000932b <Printf>
c0002373:	83 c4 10             	add    $0x10,%esp
c0002376:	eb 01                	jmp    c0002379 <print_hd_info+0x56>
c0002378:	90                   	nop
c0002379:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000237d:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c0002381:	7e bf                	jle    c0002342 <print_hd_info+0x1f>
c0002383:	83 ec 0c             	sub    $0xc,%esp
c0002386:	68 cd b1 00 c0       	push   $0xc000b1cd
c000238b:	e8 9b 6f 00 00       	call   c000932b <Printf>
c0002390:	83 c4 10             	add    $0x10,%esp
c0002393:	83 ec 0c             	sub    $0xc,%esp
c0002396:	68 e8 b1 00 c0       	push   $0xc000b1e8
c000239b:	e8 8b 6f 00 00       	call   c000932b <Printf>
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
c00023e8:	e8 3e 6f 00 00       	call   c000932b <Printf>
c00023ed:	83 c4 10             	add    $0x10,%esp
c00023f0:	eb 01                	jmp    c00023f3 <print_hd_info+0xd0>
c00023f2:	90                   	nop
c00023f3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00023f7:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c00023fb:	7e b6                	jle    c00023b3 <print_hd_info+0x90>
c00023fd:	83 ec 0c             	sub    $0xc,%esp
c0002400:	68 05 b2 00 c0       	push   $0xc000b205
c0002405:	e8 21 6f 00 00       	call   c000932b <Printf>
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
c0002538:	e8 88 7a 00 00       	call   c0009fc5 <send_rec>
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
c00025c2:	e8 c1 70 00 00       	call   c0009688 <assertion_failure>
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
c0002638:	e8 88 79 00 00       	call   c0009fc5 <send_rec>
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
c0002681:	e8 3f 79 00 00       	call   c0009fc5 <send_rec>
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
c00026bb:	e8 05 79 00 00       	call   c0009fc5 <send_rec>
c00026c0:	83 c4 10             	add    $0x10,%esp
c00026c3:	eb 32                	jmp    c00026f7 <task_fs+0x206>
c00026c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00026c8:	8b 40 68             	mov    0x68(%eax),%eax
c00026cb:	83 ec 04             	sub    $0x4,%esp
c00026ce:	50                   	push   %eax
c00026cf:	ff 75 f4             	pushl  -0xc(%ebp)
c00026d2:	6a 01                	push   $0x1
c00026d4:	e8 ec 78 00 00       	call   c0009fc5 <send_rec>
c00026d9:	83 c4 10             	add    $0x10,%esp
c00026dc:	eb 19                	jmp    c00026f7 <task_fs+0x206>
c00026de:	83 ec 0c             	sub    $0xc,%esp
c00026e1:	68 97 b2 00 c0       	push   $0xc000b297
c00026e6:	e8 7f 6f 00 00       	call   c000966a <panic>
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
c0002776:	e8 0d 6f 00 00       	call   c0009688 <assertion_failure>
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
c00027a8:	e8 db 6e 00 00       	call   c0009688 <assertion_failure>
c00027ad:	83 c4 10             	add    $0x10,%esp
c00027b0:	83 ec 04             	sub    $0x4,%esp
c00027b3:	6a 03                	push   $0x3
c00027b5:	ff 75 f4             	pushl  -0xc(%ebp)
c00027b8:	6a 03                	push   $0x3
c00027ba:	e8 06 78 00 00       	call   c0009fc5 <send_rec>
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
c000280f:	e8 3d 46 00 00       	call   c0006e51 <get_physical_address>
c0002814:	83 c4 10             	add    $0x10,%esp
c0002817:	a3 84 27 01 c0       	mov    %eax,0xc0012784
c000281c:	a1 a0 31 01 c0       	mov    0xc00131a0,%eax
c0002821:	83 ec 0c             	sub    $0xc,%esp
c0002824:	50                   	push   %eax
c0002825:	e8 27 46 00 00       	call   c0006e51 <get_physical_address>
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
c0002c7f:	e8 80 4e 00 00       	call   c0007b04 <Memcpy>
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
c0002d06:	e8 f9 4d 00 00       	call   c0007b04 <Memcpy>
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
c0002d7a:	e8 85 4d 00 00       	call   c0007b04 <Memcpy>
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
c0002deb:	e8 d5 71 00 00       	call   c0009fc5 <send_rec>
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
c0002e35:	e8 cd 3e 00 00       	call   c0006d07 <alloc_virtual_memory>
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
c0002e54:	e8 ab 4c 00 00       	call   c0007b04 <Memcpy>
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
c0002ebf:	e8 c4 67 00 00       	call   c0009688 <assertion_failure>
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
c0002f14:	e8 6f 67 00 00       	call   c0009688 <assertion_failure>
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
c0002f42:	e8 23 67 00 00       	call   c000966a <panic>
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
c00030cf:	e8 59 72 00 00       	call   c000a32d <strcmp>
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
c00035c3:	e8 c0 60 00 00       	call   c0009688 <assertion_failure>
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
c0003a82:	e8 a6 68 00 00       	call   c000a32d <strcmp>
c0003a87:	83 c4 10             	add    $0x10,%esp
c0003a8a:	85 c0                	test   %eax,%eax
c0003a8c:	75 10                	jne    c0003a9e <do_unlink+0x31>
c0003a8e:	83 ec 0c             	sub    $0xc,%esp
c0003a91:	68 4b b3 00 c0       	push   $0xc000b34b
c0003a96:	e8 cf 5b 00 00       	call   c000966a <panic>
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
c0003abd:	e8 a8 5b 00 00       	call   c000966a <panic>
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
c0003aeb:	e8 7a 5b 00 00       	call   c000966a <panic>
c0003af0:	83 c4 10             	add    $0x10,%esp
c0003af3:	8b 45 88             	mov    -0x78(%ebp),%eax
c0003af6:	85 c0                	test   %eax,%eax
c0003af8:	7e 10                	jle    c0003b0a <do_unlink+0x9d>
c0003afa:	83 ec 0c             	sub    $0xc,%esp
c0003afd:	68 80 b3 00 c0       	push   $0xc000b380
c0003b02:	e8 63 5b 00 00       	call   c000966a <panic>
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
c0003ea0:	e8 88 64 00 00       	call   c000a32d <strcmp>
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
c0003fdf:	e8 86 56 00 00       	call   c000966a <panic>
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
c0004019:	e8 6a 56 00 00       	call   c0009688 <assertion_failure>
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
c0004068:	e8 58 5f 00 00       	call   c0009fc5 <send_rec>
c000406d:	83 c4 10             	add    $0x10,%esp
c0004070:	8b 45 08             	mov    0x8(%ebp),%eax
c0004073:	8b 40 78             	mov    0x78(%eax),%eax
c0004076:	83 f8 66             	cmp    $0x66,%eax
c0004079:	75 13                	jne    c000408e <do_rdwt+0x145>
c000407b:	83 ec 04             	sub    $0x4,%esp
c000407e:	ff 75 b8             	pushl  -0x48(%ebp)
c0004081:	ff 75 08             	pushl  0x8(%ebp)
c0004084:	6a 01                	push   $0x1
c0004086:	e8 3a 5f 00 00       	call   c0009fc5 <send_rec>
c000408b:	83 c4 10             	add    $0x10,%esp
c000408e:	8b 45 08             	mov    0x8(%ebp),%eax
c0004091:	8b 40 78             	mov    0x78(%eax),%eax
c0004094:	83 f8 65             	cmp    $0x65,%eax
c0004097:	75 13                	jne    c00040ac <do_rdwt+0x163>
c0004099:	83 ec 04             	sub    $0x4,%esp
c000409c:	ff 75 b8             	pushl  -0x48(%ebp)
c000409f:	ff 75 08             	pushl  0x8(%ebp)
c00040a2:	6a 01                	push   $0x1
c00040a4:	e8 1c 5f 00 00       	call   c0009fc5 <send_rec>
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
c000419f:	e8 63 2b 00 00       	call   c0006d07 <alloc_virtual_memory>
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
c0004211:	e8 ee 38 00 00       	call   c0007b04 <Memcpy>
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
c0004238:	e8 c7 38 00 00       	call   c0007b04 <Memcpy>
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
c00043fc:	e8 03 37 00 00       	call   c0007b04 <Memcpy>
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
c000444c:	e8 37 52 00 00       	call   c0009688 <assertion_failure>
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
c0004592:	e8 70 67 00 00       	call   c000ad07 <insertToDoubleLinkList>
c0004597:	83 c4 10             	add    $0x10,%esp
c000459a:	83 ec 0c             	sub    $0xc,%esp
c000459d:	68 ec 0d 01 c0       	push   $0xc0010dec
c00045a2:	e8 7c 65 00 00       	call   c000ab23 <isListEmpty>
c00045a7:	83 c4 10             	add    $0x10,%esp
c00045aa:	84 c0                	test   %al,%al
c00045ac:	74 19                	je     c00045c7 <schedule_process+0x80>
c00045ae:	6a 28                	push   $0x28
c00045b0:	68 0b b4 00 c0       	push   $0xc000b40b
c00045b5:	68 0b b4 00 c0       	push   $0xc000b40b
c00045ba:	68 15 b4 00 c0       	push   $0xc000b415
c00045bf:	e8 c4 50 00 00       	call   c0009688 <assertion_failure>
c00045c4:	83 c4 10             	add    $0x10,%esp
c00045c7:	83 ec 0c             	sub    $0xc,%esp
c00045ca:	68 ec 0d 01 c0       	push   $0xc0010dec
c00045cf:	e8 b6 67 00 00       	call   c000ad8a <popFromDoubleLinkList>
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
c0004641:	e8 9a 64 00 00       	call   c000aae0 <switch_to>
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
c0004668:	e8 f3 5b 00 00       	call   c000a260 <inform_int>
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
c0004ad8:	e8 5d 37 00 00       	call   c000823a <init_internal_interrupt>
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
c0004d3b:	e8 60 2d 00 00       	call   c0007aa0 <intr_disable>
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
c0004ee1:	e8 e3 2b 00 00       	call   c0007ac9 <intr_set_status>
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
c0004fee:	e8 11 2b 00 00       	call   c0007b04 <Memcpy>
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
c0005125:	e8 9b 4e 00 00       	call   c0009fc5 <send_rec>
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
c00051a7:	e8 5b 1b 00 00       	call   c0006d07 <alloc_virtual_memory>
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
c00051dc:	e8 a7 44 00 00       	call   c0009688 <assertion_failure>
c00051e1:	83 c4 10             	add    $0x10,%esp
c00051e4:	8b 45 0c             	mov    0xc(%ebp),%eax
c00051e7:	c7 40 78 67 00 00 00 	movl   $0x67,0x78(%eax)
c00051ee:	8b 45 08             	mov    0x8(%ebp),%eax
c00051f1:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c00051f7:	83 ec 04             	sub    $0x4,%esp
c00051fa:	50                   	push   %eax
c00051fb:	ff 75 0c             	pushl  0xc(%ebp)
c00051fe:	6a 01                	push   $0x1
c0005200:	e8 c0 4d 00 00       	call   c0009fc5 <send_rec>
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
c0005282:	e8 80 1a 00 00       	call   c0006d07 <alloc_virtual_memory>
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
c00052b4:	e8 4b 28 00 00       	call   c0007b04 <Memcpy>
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
c000534e:	e8 72 4c 00 00       	call   c0009fc5 <send_rec>
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
c000552f:	e8 91 4a 00 00       	call   c0009fc5 <send_rec>
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
c00059f6:	e8 56 14 00 00       	call   c0006e51 <get_physical_address>
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
c0005a33:	e8 8d 45 00 00       	call   c0009fc5 <send_rec>
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
c0005a82:	e8 ca 13 00 00       	call   c0006e51 <get_physical_address>
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
c0005b19:	e8 a7 44 00 00       	call   c0009fc5 <send_rec>
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
c0005b53:	e8 f9 12 00 00       	call   c0006e51 <get_physical_address>
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
c0005bad:	e8 13 44 00 00       	call   c0009fc5 <send_rec>
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
c0005bf8:	e8 54 12 00 00       	call   c0006e51 <get_physical_address>
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
c0005c32:	e8 8e 43 00 00       	call   c0009fc5 <send_rec>
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
c0005c7d:	e8 43 43 00 00       	call   c0009fc5 <send_rec>
c0005c82:	83 c4 10             	add    $0x10,%esp
c0005c85:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005c88:	83 f8 65             	cmp    $0x65,%eax
c0005c8b:	74 19                	je     c0005ca6 <close+0x4d>
c0005c8d:	6a 13                	push   $0x13
c0005c8f:	68 53 b4 00 c0       	push   $0xc000b453
c0005c94:	68 53 b4 00 c0       	push   $0xc000b453
c0005c99:	68 5f b4 00 c0       	push   $0xc000b45f
c0005c9e:	e8 e5 39 00 00       	call   c0009688 <assertion_failure>
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
c0005cc9:	e8 f7 42 00 00       	call   c0009fc5 <send_rec>
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
c0005d13:	e8 ad 42 00 00       	call   c0009fc5 <send_rec>
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
c0005d52:	e8 6e 42 00 00       	call   c0009fc5 <send_rec>
c0005d57:	83 c4 10             	add    $0x10,%esp
c0005d5a:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c0005d61:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0005d64:	85 c0                	test   %eax,%eax
c0005d66:	74 19                	je     c0005d81 <fork+0x63>
c0005d68:	6a 14                	push   $0x14
c0005d6a:	68 77 b4 00 c0       	push   $0xc000b477
c0005d6f:	68 77 b4 00 c0       	push   $0xc000b477
c0005d74:	68 82 b4 00 c0       	push   $0xc000b482
c0005d79:	e8 0a 39 00 00       	call   c0009688 <assertion_failure>
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
c0005da4:	e8 1c 42 00 00       	call   c0009fc5 <send_rec>
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
c0005df4:	e8 cc 41 00 00       	call   c0009fc5 <send_rec>
c0005df9:	83 c4 10             	add    $0x10,%esp
c0005dfc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005dff:	83 f8 65             	cmp    $0x65,%eax
c0005e02:	74 19                	je     c0005e1d <exec+0x6c>
c0005e04:	6a 19                	push   $0x19
c0005e06:	68 92 b4 00 c0       	push   $0xc000b492
c0005e0b:	68 92 b4 00 c0       	push   $0xc000b492
c0005e10:	68 9d b4 00 c0       	push   $0xc000b49d
c0005e15:	e8 6e 38 00 00       	call   c0009688 <assertion_failure>
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
c0005e70:	e8 b6 34 00 00       	call   c000932b <Printf>
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
c0005f30:	e8 1c 0f 00 00       	call   c0006e51 <get_physical_address>
c0005f35:	83 c4 10             	add    $0x10,%esp
c0005f38:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0005f3b:	83 ec 0c             	sub    $0xc,%esp
c0005f3e:	ff 75 e0             	pushl  -0x20(%ebp)
c0005f41:	e8 0b 0f 00 00       	call   c0006e51 <get_physical_address>
c0005f46:	83 c4 10             	add    $0x10,%esp
c0005f49:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0005f4c:	83 ec 0c             	sub    $0xc,%esp
c0005f4f:	ff 75 dc             	pushl  -0x24(%ebp)
c0005f52:	e8 fa 0e 00 00       	call   c0006e51 <get_physical_address>
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
c0005fc3:	e8 fd 3f 00 00       	call   c0009fc5 <send_rec>
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
c0005ffa:	e8 89 36 00 00       	call   c0009688 <assertion_failure>
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
c000605c:	e8 64 3f 00 00       	call   c0009fc5 <send_rec>
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
c00060b8:	e8 c3 04 00 00       	call   c0006580 <do_fork>
c00060bd:	83 c4 10             	add    $0x10,%esp
c00060c0:	89 c2                	mov    %eax,%edx
c00060c2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00060c5:	89 50 5c             	mov    %edx,0x5c(%eax)
c00060c8:	eb 5c                	jmp    c0006126 <TaskMM+0xfa>
c00060ca:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00060d1:	66 87 db             	xchg   %bx,%bx
c00060d4:	83 ec 0c             	sub    $0xc,%esp
c00060d7:	ff 75 f0             	pushl  -0x10(%ebp)
c00060da:	e8 82 00 00 00       	call   c0006161 <do_exec>
c00060df:	83 c4 10             	add    $0x10,%esp
c00060e2:	eb 42                	jmp    c0006126 <TaskMM+0xfa>
c00060e4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00060eb:	83 ec 08             	sub    $0x8,%esp
c00060ee:	ff 75 e0             	pushl  -0x20(%ebp)
c00060f1:	ff 75 f0             	pushl  -0x10(%ebp)
c00060f4:	e8 f5 04 00 00       	call   c00065ee <do_exit>
c00060f9:	83 c4 10             	add    $0x10,%esp
c00060fc:	eb 28                	jmp    c0006126 <TaskMM+0xfa>
c00060fe:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006105:	83 ec 0c             	sub    $0xc,%esp
c0006108:	ff 75 f0             	pushl  -0x10(%ebp)
c000610b:	e8 da 05 00 00       	call   c00066ea <do_wait>
c0006110:	83 c4 10             	add    $0x10,%esp
c0006113:	eb 11                	jmp    c0006126 <TaskMM+0xfa>
c0006115:	83 ec 0c             	sub    $0xc,%esp
c0006118:	68 bf b4 00 c0       	push   $0xc000b4bf
c000611d:	e8 48 35 00 00       	call   c000966a <panic>
c0006122:	83 c4 10             	add    $0x10,%esp
c0006125:	90                   	nop
c0006126:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000612a:	0f 84 22 ff ff ff    	je     c0006052 <TaskMM+0x26>
c0006130:	83 ec 0c             	sub    $0xc,%esp
c0006133:	6a 03                	push   $0x3
c0006135:	e8 bd 30 00 00       	call   c00091f7 <delay>
c000613a:	83 c4 10             	add    $0x10,%esp
c000613d:	e9 10 ff ff ff       	jmp    c0006052 <TaskMM+0x26>

c0006142 <alloc_mem>:
c0006142:	55                   	push   %ebp
c0006143:	89 e5                	mov    %esp,%ebp
c0006145:	83 ec 10             	sub    $0x10,%esp
c0006148:	8b 45 08             	mov    0x8(%ebp),%eax
c000614b:	83 e8 08             	sub    $0x8,%eax
c000614e:	69 c0 00 10 10 00    	imul   $0x101000,%eax,%eax
c0006154:	05 00 00 a0 00       	add    $0xa00000,%eax
c0006159:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000615c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000615f:	c9                   	leave  
c0006160:	c3                   	ret    

c0006161 <do_exec>:
c0006161:	55                   	push   %ebp
c0006162:	89 e5                	mov    %esp,%ebp
c0006164:	81 ec 38 01 00 00    	sub    $0x138,%esp
c000616a:	c7 85 56 ff ff ff 64 	movl   $0x5f766564,-0xaa(%ebp)
c0006171:	65 76 5f 
c0006174:	c7 85 5a ff ff ff 74 	movl   $0x31797474,-0xa6(%ebp)
c000617b:	74 79 31 
c000617e:	66 c7 85 5e ff ff ff 	movw   $0x0,-0xa2(%ebp)
c0006185:	00 00 
c0006187:	83 ec 08             	sub    $0x8,%esp
c000618a:	6a 00                	push   $0x0
c000618c:	8d 85 56 ff ff ff    	lea    -0xaa(%ebp),%eax
c0006192:	50                   	push   %eax
c0006193:	e8 26 f8 ff ff       	call   c00059be <open>
c0006198:	83 c4 10             	add    $0x10,%esp
c000619b:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000619e:	8b 45 08             	mov    0x8(%ebp),%eax
c00061a1:	8b 00                	mov    (%eax),%eax
c00061a3:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00061a6:	c7 45 d0 00 30 03 00 	movl   $0x33000,-0x30(%ebp)
c00061ad:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00061b0:	83 ec 0c             	sub    $0xc,%esp
c00061b3:	50                   	push   %eax
c00061b4:	e8 0b c3 ff ff       	call   c00024c4 <sys_malloc>
c00061b9:	83 c4 10             	add    $0x10,%esp
c00061bc:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00061bf:	83 ec 04             	sub    $0x4,%esp
c00061c2:	ff 75 d0             	pushl  -0x30(%ebp)
c00061c5:	6a 00                	push   $0x0
c00061c7:	ff 75 cc             	pushl  -0x34(%ebp)
c00061ca:	e8 70 5c 00 00       	call   c000be3f <Memset>
c00061cf:	83 c4 10             	add    $0x10,%esp
c00061d2:	83 ec 04             	sub    $0x4,%esp
c00061d5:	6a 0c                	push   $0xc
c00061d7:	6a 00                	push   $0x0
c00061d9:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c00061df:	50                   	push   %eax
c00061e0:	e8 5a 5c 00 00       	call   c000be3f <Memset>
c00061e5:	83 c4 10             	add    $0x10,%esp
c00061e8:	8b 45 08             	mov    0x8(%ebp),%eax
c00061eb:	8b 40 44             	mov    0x44(%eax),%eax
c00061ee:	89 45 c8             	mov    %eax,-0x38(%ebp)
c00061f1:	8b 45 08             	mov    0x8(%ebp),%eax
c00061f4:	8b 40 40             	mov    0x40(%eax),%eax
c00061f7:	83 ec 08             	sub    $0x8,%esp
c00061fa:	50                   	push   %eax
c00061fb:	ff 75 c8             	pushl  -0x38(%ebp)
c00061fe:	e8 04 0b 00 00       	call   c0006d07 <alloc_virtual_memory>
c0006203:	83 c4 10             	add    $0x10,%esp
c0006206:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0006209:	8b 45 08             	mov    0x8(%ebp),%eax
c000620c:	8b 40 40             	mov    0x40(%eax),%eax
c000620f:	89 c2                	mov    %eax,%edx
c0006211:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0006214:	83 ec 04             	sub    $0x4,%esp
c0006217:	52                   	push   %edx
c0006218:	50                   	push   %eax
c0006219:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c000621f:	50                   	push   %eax
c0006220:	e8 df 18 00 00       	call   c0007b04 <Memcpy>
c0006225:	83 c4 10             	add    $0x10,%esp
c0006228:	8b 45 08             	mov    0x8(%ebp),%eax
c000622b:	8b 40 40             	mov    0x40(%eax),%eax
c000622e:	c6 84 05 4a ff ff ff 	movb   $0x0,-0xb6(%ebp,%eax,1)
c0006235:	00 
c0006236:	83 ec 08             	sub    $0x8,%esp
c0006239:	6a 00                	push   $0x0
c000623b:	8d 85 4a ff ff ff    	lea    -0xb6(%ebp),%eax
c0006241:	50                   	push   %eax
c0006242:	e8 77 f7 ff ff       	call   c00059be <open>
c0006247:	83 c4 10             	add    $0x10,%esp
c000624a:	89 45 c0             	mov    %eax,-0x40(%ebp)
c000624d:	83 7d c0 ff          	cmpl   $0xffffffff,-0x40(%ebp)
c0006251:	75 15                	jne    c0006268 <do_exec+0x107>
c0006253:	83 ec 0c             	sub    $0xc,%esp
c0006256:	68 d0 b4 00 c0       	push   $0xc000b4d0
c000625b:	e8 cb 30 00 00       	call   c000932b <Printf>
c0006260:	83 c4 10             	add    $0x10,%esp
c0006263:	e9 16 03 00 00       	jmp    c000657e <do_exec+0x41d>
c0006268:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000626f:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0006272:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0006275:	01 d0                	add    %edx,%eax
c0006277:	83 ec 04             	sub    $0x4,%esp
c000627a:	68 00 10 00 00       	push   $0x1000
c000627f:	50                   	push   %eax
c0006280:	ff 75 c0             	pushl  -0x40(%ebp)
c0006283:	e8 cb f7 ff ff       	call   c0005a53 <read>
c0006288:	83 c4 10             	add    $0x10,%esp
c000628b:	89 45 bc             	mov    %eax,-0x44(%ebp)
c000628e:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0006291:	01 45 f4             	add    %eax,-0xc(%ebp)
c0006294:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
c0006298:	74 0a                	je     c00062a4 <do_exec+0x143>
c000629a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000629d:	3b 45 d0             	cmp    -0x30(%ebp),%eax
c00062a0:	7d 05                	jge    c00062a7 <do_exec+0x146>
c00062a2:	eb cb                	jmp    c000626f <do_exec+0x10e>
c00062a4:	90                   	nop
c00062a5:	eb 01                	jmp    c00062a8 <do_exec+0x147>
c00062a7:	90                   	nop
c00062a8:	83 ec 0c             	sub    $0xc,%esp
c00062ab:	ff 75 c0             	pushl  -0x40(%ebp)
c00062ae:	e8 a6 f9 ff ff       	call   c0005c59 <close>
c00062b3:	83 c4 10             	add    $0x10,%esp
c00062b6:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00062b9:	89 45 b8             	mov    %eax,-0x48(%ebp)
c00062bc:	8b 45 b8             	mov    -0x48(%ebp),%eax
c00062bf:	8b 40 18             	mov    0x18(%eax),%eax
c00062c2:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c00062c5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00062cc:	e9 04 01 00 00       	jmp    c00063d5 <do_exec+0x274>
c00062d1:	8b 45 b8             	mov    -0x48(%ebp),%eax
c00062d4:	0f b7 40 28          	movzwl 0x28(%eax),%eax
c00062d8:	0f b7 d0             	movzwl %ax,%edx
c00062db:	8b 45 b8             	mov    -0x48(%ebp),%eax
c00062de:	0f b7 40 2a          	movzwl 0x2a(%eax),%eax
c00062e2:	0f b7 c0             	movzwl %ax,%eax
c00062e5:	0f af 45 f0          	imul   -0x10(%ebp),%eax
c00062e9:	01 c2                	add    %eax,%edx
c00062eb:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00062ee:	01 d0                	add    %edx,%eax
c00062f0:	89 45 b0             	mov    %eax,-0x50(%ebp)
c00062f3:	8b 45 b0             	mov    -0x50(%ebp),%eax
c00062f6:	8b 40 10             	mov    0x10(%eax),%eax
c00062f9:	89 45 ac             	mov    %eax,-0x54(%ebp)
c00062fc:	8b 45 ac             	mov    -0x54(%ebp),%eax
c00062ff:	05 ff 0f 00 00       	add    $0xfff,%eax
c0006304:	c1 e8 0c             	shr    $0xc,%eax
c0006307:	89 45 a8             	mov    %eax,-0x58(%ebp)
c000630a:	8b 45 b0             	mov    -0x50(%ebp),%eax
c000630d:	8b 40 08             	mov    0x8(%eax),%eax
c0006310:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0006313:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000631a:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c000631d:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c0006320:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0006323:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0006326:	8b 50 04             	mov    0x4(%eax),%edx
c0006329:	8b 45 a0             	mov    -0x60(%ebp),%eax
c000632c:	01 d0                	add    %edx,%eax
c000632e:	89 45 9c             	mov    %eax,-0x64(%ebp)
c0006331:	83 7d ac 00          	cmpl   $0x0,-0x54(%ebp)
c0006335:	0f 84 95 00 00 00    	je     c00063d0 <do_exec+0x26f>
c000633b:	83 ec 04             	sub    $0x4,%esp
c000633e:	ff 75 d4             	pushl  -0x2c(%ebp)
c0006341:	ff 75 a8             	pushl  -0x58(%ebp)
c0006344:	ff 75 a4             	pushl  -0x5c(%ebp)
c0006347:	e8 c6 07 00 00       	call   c0006b12 <get_virtual_address_start_with_addr>
c000634c:	83 c4 10             	add    $0x10,%esp
c000634f:	89 45 98             	mov    %eax,-0x68(%ebp)
c0006352:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0006355:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006358:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c000635f:	eb 41                	jmp    c00063a2 <do_exec+0x241>
c0006361:	83 ec 08             	sub    $0x8,%esp
c0006364:	ff 75 d4             	pushl  -0x2c(%ebp)
c0006367:	ff 75 e8             	pushl  -0x18(%ebp)
c000636a:	e8 14 0b 00 00       	call   c0006e83 <alloc_physical_memory_of_proc>
c000636f:	83 c4 10             	add    $0x10,%esp
c0006372:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0006375:	83 ec 08             	sub    $0x8,%esp
c0006378:	68 00 10 00 00       	push   $0x1000
c000637d:	ff 75 94             	pushl  -0x6c(%ebp)
c0006380:	e8 82 09 00 00       	call   c0006d07 <alloc_virtual_memory>
c0006385:	83 c4 10             	add    $0x10,%esp
c0006388:	89 45 90             	mov    %eax,-0x70(%ebp)
c000638b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c000638f:	75 06                	jne    c0006397 <do_exec+0x236>
c0006391:	8b 45 90             	mov    -0x70(%ebp),%eax
c0006394:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006397:	81 45 e8 00 10 00 00 	addl   $0x1000,-0x18(%ebp)
c000639e:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c00063a2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00063a5:	39 45 a8             	cmp    %eax,-0x58(%ebp)
c00063a8:	77 b7                	ja     c0006361 <do_exec+0x200>
c00063aa:	8b 45 b0             	mov    -0x50(%ebp),%eax
c00063ad:	8b 40 10             	mov    0x10(%eax),%eax
c00063b0:	89 c1                	mov    %eax,%ecx
c00063b2:	8b 45 b0             	mov    -0x50(%ebp),%eax
c00063b5:	8b 50 04             	mov    0x4(%eax),%edx
c00063b8:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00063bb:	01 c2                	add    %eax,%edx
c00063bd:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00063c0:	83 ec 04             	sub    $0x4,%esp
c00063c3:	51                   	push   %ecx
c00063c4:	52                   	push   %edx
c00063c5:	50                   	push   %eax
c00063c6:	e8 39 17 00 00       	call   c0007b04 <Memcpy>
c00063cb:	83 c4 10             	add    $0x10,%esp
c00063ce:	eb 01                	jmp    c00063d1 <do_exec+0x270>
c00063d0:	90                   	nop
c00063d1:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00063d5:	8b 45 b8             	mov    -0x48(%ebp),%eax
c00063d8:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
c00063dc:	0f b7 c0             	movzwl %ax,%eax
c00063df:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c00063e2:	0f 8c e9 fe ff ff    	jl     c00062d1 <do_exec+0x170>
c00063e8:	8b 45 08             	mov    0x8(%ebp),%eax
c00063eb:	8b 40 10             	mov    0x10(%eax),%eax
c00063ee:	89 45 8c             	mov    %eax,-0x74(%ebp)
c00063f1:	8b 45 08             	mov    0x8(%ebp),%eax
c00063f4:	8b 40 1c             	mov    0x1c(%eax),%eax
c00063f7:	89 45 88             	mov    %eax,-0x78(%ebp)
c00063fa:	8b 45 08             	mov    0x8(%ebp),%eax
c00063fd:	8b 40 24             	mov    0x24(%eax),%eax
c0006400:	89 45 84             	mov    %eax,-0x7c(%ebp)
c0006403:	83 ec 0c             	sub    $0xc,%esp
c0006406:	ff 75 d4             	pushl  -0x2c(%ebp)
c0006409:	e8 ae e2 ff ff       	call   c00046bc <pid2proc>
c000640e:	83 c4 10             	add    $0x10,%esp
c0006411:	89 45 80             	mov    %eax,-0x80(%ebp)
c0006414:	8b 45 08             	mov    0x8(%ebp),%eax
c0006417:	8b 40 10             	mov    0x10(%eax),%eax
c000641a:	89 85 7c ff ff ff    	mov    %eax,-0x84(%ebp)
c0006420:	83 ec 08             	sub    $0x8,%esp
c0006423:	ff 75 88             	pushl  -0x78(%ebp)
c0006426:	ff b5 7c ff ff ff    	pushl  -0x84(%ebp)
c000642c:	e8 d6 08 00 00       	call   c0006d07 <alloc_virtual_memory>
c0006431:	83 c4 10             	add    $0x10,%esp
c0006434:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c000643a:	8b 45 08             	mov    0x8(%ebp),%eax
c000643d:	8b 40 2c             	mov    0x2c(%eax),%eax
c0006440:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
c0006446:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c000644d:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0006453:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0006456:	eb 1a                	jmp    c0006472 <do_exec+0x311>
c0006458:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c000645c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000645f:	8b 10                	mov    (%eax),%edx
c0006461:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0006467:	01 c2                	add    %eax,%edx
c0006469:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000646c:	89 10                	mov    %edx,(%eax)
c000646e:	83 45 dc 04          	addl   $0x4,-0x24(%ebp)
c0006472:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0006475:	8b 00                	mov    (%eax),%eax
c0006477:	85 c0                	test   %eax,%eax
c0006479:	75 dd                	jne    c0006458 <do_exec+0x2f7>
c000647b:	83 ec 0c             	sub    $0xc,%esp
c000647e:	ff 75 84             	pushl  -0x7c(%ebp)
c0006481:	e8 81 08 00 00       	call   c0006d07 <alloc_virtual_memory>
c0006486:	83 c4 10             	add    $0x10,%esp
c0006489:	89 85 70 ff ff ff    	mov    %eax,-0x90(%ebp)
c000648f:	8b 95 78 ff ff ff    	mov    -0x88(%ebp),%edx
c0006495:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
c000649b:	83 ec 04             	sub    $0x4,%esp
c000649e:	ff 75 88             	pushl  -0x78(%ebp)
c00064a1:	52                   	push   %edx
c00064a2:	50                   	push   %eax
c00064a3:	e8 5c 16 00 00       	call   c0007b04 <Memcpy>
c00064a8:	83 c4 10             	add    $0x10,%esp
c00064ab:	8b 45 08             	mov    0x8(%ebp),%eax
c00064ae:	8b 40 28             	mov    0x28(%eax),%eax
c00064b1:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c00064b7:	83 ec 08             	sub    $0x8,%esp
c00064ba:	ff 75 d4             	pushl  -0x2c(%ebp)
c00064bd:	ff 75 80             	pushl  -0x80(%ebp)
c00064c0:	e8 10 09 00 00       	call   c0006dd5 <get_physical_address_proc>
c00064c5:	83 c4 10             	add    $0x10,%esp
c00064c8:	89 85 68 ff ff ff    	mov    %eax,-0x98(%ebp)
c00064ce:	83 ec 08             	sub    $0x8,%esp
c00064d1:	68 00 10 00 00       	push   $0x1000
c00064d6:	ff b5 68 ff ff ff    	pushl  -0x98(%ebp)
c00064dc:	e8 26 08 00 00       	call   c0006d07 <alloc_virtual_memory>
c00064e1:	83 c4 10             	add    $0x10,%esp
c00064e4:	89 85 64 ff ff ff    	mov    %eax,-0x9c(%ebp)
c00064ea:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
c00064f0:	05 bc 0f 00 00       	add    $0xfbc,%eax
c00064f5:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
c00064fb:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c0006501:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0006507:	89 50 20             	mov    %edx,0x20(%eax)
c000650a:	8b 55 e0             	mov    -0x20(%ebp),%edx
c000650d:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c0006513:	89 50 28             	mov    %edx,0x28(%eax)
c0006516:	66 87 db             	xchg   %bx,%bx
c0006519:	8b 45 b8             	mov    -0x48(%ebp),%eax
c000651c:	8b 40 18             	mov    0x18(%eax),%eax
c000651f:	89 c2                	mov    %eax,%edx
c0006521:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c0006527:	89 50 30             	mov    %edx,0x30(%eax)
c000652a:	66 87 db             	xchg   %bx,%bx
c000652d:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c0006533:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0006539:	89 50 3c             	mov    %edx,0x3c(%eax)
c000653c:	8b 45 80             	mov    -0x80(%ebp),%eax
c000653f:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c0006546:	00 00 00 
c0006549:	c7 85 44 ff ff ff 65 	movl   $0x65,-0xbc(%ebp)
c0006550:	00 00 00 
c0006553:	c7 85 24 ff ff ff 00 	movl   $0x0,-0xdc(%ebp)
c000655a:	00 00 00 
c000655d:	c7 85 28 ff ff ff 00 	movl   $0x0,-0xd8(%ebp)
c0006564:	00 00 00 
c0006567:	83 ec 04             	sub    $0x4,%esp
c000656a:	ff 75 d4             	pushl  -0x2c(%ebp)
c000656d:	8d 85 cc fe ff ff    	lea    -0x134(%ebp),%eax
c0006573:	50                   	push   %eax
c0006574:	6a 01                	push   $0x1
c0006576:	e8 4a 3a 00 00       	call   c0009fc5 <send_rec>
c000657b:	83 c4 10             	add    $0x10,%esp
c000657e:	c9                   	leave  
c000657f:	c3                   	ret    

c0006580 <do_fork>:
c0006580:	55                   	push   %ebp
c0006581:	89 e5                	mov    %esp,%ebp
c0006583:	81 ec 98 00 00 00    	sub    $0x98,%esp
c0006589:	8b 45 08             	mov    0x8(%ebp),%eax
c000658c:	8b 00                	mov    (%eax),%eax
c000658e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006591:	83 ec 0c             	sub    $0xc,%esp
c0006594:	ff 75 f4             	pushl  -0xc(%ebp)
c0006597:	e8 0c 43 00 00       	call   c000a8a8 <fork_process>
c000659c:	83 c4 10             	add    $0x10,%esp
c000659f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00065a2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00065a5:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c00065ab:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00065ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00065b1:	8b 90 24 01 00 00    	mov    0x124(%eax),%edx
c00065b7:	8b 45 08             	mov    0x8(%ebp),%eax
c00065ba:	89 50 5c             	mov    %edx,0x5c(%eax)
c00065bd:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c00065c4:	c7 45 c8 03 00 00 00 	movl   $0x3,-0x38(%ebp)
c00065cb:	c7 45 cc 02 00 00 00 	movl   $0x2,-0x34(%ebp)
c00065d2:	83 ec 04             	sub    $0x4,%esp
c00065d5:	ff 75 ec             	pushl  -0x14(%ebp)
c00065d8:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
c00065de:	50                   	push   %eax
c00065df:	6a 01                	push   $0x1
c00065e1:	e8 df 39 00 00       	call   c0009fc5 <send_rec>
c00065e6:	83 c4 10             	add    $0x10,%esp
c00065e9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00065ec:	c9                   	leave  
c00065ed:	c3                   	ret    

c00065ee <do_exit>:
c00065ee:	55                   	push   %ebp
c00065ef:	89 e5                	mov    %esp,%ebp
c00065f1:	83 ec 18             	sub    $0x18,%esp
c00065f4:	8b 45 08             	mov    0x8(%ebp),%eax
c00065f7:	8b 00                	mov    (%eax),%eax
c00065f9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00065fc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00065ff:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006605:	05 00 32 08 c0       	add    $0xc0083200,%eax
c000660a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000660d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006610:	8b 80 64 02 00 00    	mov    0x264(%eax),%eax
c0006616:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006619:	8b 45 08             	mov    0x8(%ebp),%eax
c000661c:	8b 40 54             	mov    0x54(%eax),%eax
c000661f:	89 c2                	mov    %eax,%edx
c0006621:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006624:	89 90 68 02 00 00    	mov    %edx,0x268(%eax)
c000662a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000662d:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006633:	05 49 34 08 c0       	add    $0xc0083449,%eax
c0006638:	0f b6 00             	movzbl (%eax),%eax
c000663b:	3c 04                	cmp    $0x4,%al
c000663d:	75 21                	jne    c0006660 <do_exit+0x72>
c000663f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006642:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006648:	05 49 34 08 c0       	add    $0xc0083449,%eax
c000664d:	c6 00 fb             	movb   $0xfb,(%eax)
c0006650:	83 ec 0c             	sub    $0xc,%esp
c0006653:	ff 75 ec             	pushl  -0x14(%ebp)
c0006656:	e8 5c 01 00 00       	call   c00067b7 <cleanup>
c000665b:	83 c4 10             	add    $0x10,%esp
c000665e:	eb 0a                	jmp    c000666a <do_exit+0x7c>
c0006660:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006663:	c6 80 48 02 00 00 03 	movb   $0x3,0x248(%eax)
c000666a:	c7 45 f4 08 00 00 00 	movl   $0x8,-0xc(%ebp)
c0006671:	eb 6e                	jmp    c00066e1 <do_exit+0xf3>
c0006673:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006676:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c000667c:	05 64 34 08 c0       	add    $0xc0083464,%eax
c0006681:	8b 00                	mov    (%eax),%eax
c0006683:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0006686:	75 55                	jne    c00066dd <do_exit+0xef>
c0006688:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000668b:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006691:	05 64 34 08 c0       	add    $0xc0083464,%eax
c0006696:	c7 00 06 00 00 00    	movl   $0x6,(%eax)
c000669c:	0f b6 05 81 44 08 c0 	movzbl 0xc0084481,%eax
c00066a3:	3c 04                	cmp    $0x4,%al
c00066a5:	75 36                	jne    c00066dd <do_exit+0xef>
c00066a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00066aa:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c00066b0:	05 49 34 08 c0       	add    $0xc0083449,%eax
c00066b5:	0f b6 00             	movzbl (%eax),%eax
c00066b8:	3c 03                	cmp    $0x3,%al
c00066ba:	75 21                	jne    c00066dd <do_exit+0xef>
c00066bc:	c6 05 81 44 08 c0 fb 	movb   $0xfb,0xc0084481
c00066c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00066c6:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c00066cc:	05 00 32 08 c0       	add    $0xc0083200,%eax
c00066d1:	83 ec 0c             	sub    $0xc,%esp
c00066d4:	50                   	push   %eax
c00066d5:	e8 dd 00 00 00       	call   c00067b7 <cleanup>
c00066da:	83 c4 10             	add    $0x10,%esp
c00066dd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00066e1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00066e5:	7e 8c                	jle    c0006673 <do_exit+0x85>
c00066e7:	90                   	nop
c00066e8:	c9                   	leave  
c00066e9:	c3                   	ret    

c00066ea <do_wait>:
c00066ea:	55                   	push   %ebp
c00066eb:	89 e5                	mov    %esp,%ebp
c00066ed:	81 ec 98 00 00 00    	sub    $0x98,%esp
c00066f3:	8b 45 08             	mov    0x8(%ebp),%eax
c00066f6:	8b 00                	mov    (%eax),%eax
c00066f8:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00066fb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006702:	c7 45 f0 08 00 00 00 	movl   $0x8,-0x10(%ebp)
c0006709:	eb 5f                	jmp    c000676a <do_wait+0x80>
c000670b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000670e:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006714:	05 64 34 08 c0       	add    $0xc0083464,%eax
c0006719:	8b 00                	mov    (%eax),%eax
c000671b:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c000671e:	75 46                	jne    c0006766 <do_wait+0x7c>
c0006720:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0006724:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006727:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c000672d:	05 49 34 08 c0       	add    $0xc0083449,%eax
c0006732:	0f b6 00             	movzbl (%eax),%eax
c0006735:	3c 03                	cmp    $0x3,%al
c0006737:	75 2d                	jne    c0006766 <do_wait+0x7c>
c0006739:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000673c:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006742:	05 49 34 08 c0       	add    $0xc0083449,%eax
c0006747:	c6 00 fb             	movb   $0xfb,(%eax)
c000674a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000674d:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006753:	05 00 32 08 c0       	add    $0xc0083200,%eax
c0006758:	83 ec 0c             	sub    $0xc,%esp
c000675b:	50                   	push   %eax
c000675c:	e8 56 00 00 00       	call   c00067b7 <cleanup>
c0006761:	83 c4 10             	add    $0x10,%esp
c0006764:	eb 4f                	jmp    c00067b5 <do_wait+0xcb>
c0006766:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c000676a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000676e:	7e 9b                	jle    c000670b <do_wait+0x21>
c0006770:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0006774:	74 13                	je     c0006789 <do_wait+0x9f>
c0006776:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006779:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c000677f:	05 49 34 08 c0       	add    $0xc0083449,%eax
c0006784:	c6 00 04             	movb   $0x4,(%eax)
c0006787:	eb 2c                	jmp    c00067b5 <do_wait+0xcb>
c0006789:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c0006790:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0006797:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c000679e:	83 ec 04             	sub    $0x4,%esp
c00067a1:	ff 75 ec             	pushl  -0x14(%ebp)
c00067a4:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
c00067aa:	50                   	push   %eax
c00067ab:	6a 01                	push   $0x1
c00067ad:	e8 13 38 00 00       	call   c0009fc5 <send_rec>
c00067b2:	83 c4 10             	add    $0x10,%esp
c00067b5:	c9                   	leave  
c00067b6:	c3                   	ret    

c00067b7 <cleanup>:
c00067b7:	55                   	push   %ebp
c00067b8:	89 e5                	mov    %esp,%ebp
c00067ba:	81 ec 88 00 00 00    	sub    $0x88,%esp
c00067c0:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c00067c7:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c00067ce:	8b 45 08             	mov    0x8(%ebp),%eax
c00067d1:	8b 80 64 02 00 00    	mov    0x264(%eax),%eax
c00067d7:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00067da:	8b 45 08             	mov    0x8(%ebp),%eax
c00067dd:	8b 80 68 02 00 00    	mov    0x268(%eax),%eax
c00067e3:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00067e6:	8b 45 08             	mov    0x8(%ebp),%eax
c00067e9:	8b 80 64 02 00 00    	mov    0x264(%eax),%eax
c00067ef:	83 ec 04             	sub    $0x4,%esp
c00067f2:	50                   	push   %eax
c00067f3:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c00067f9:	50                   	push   %eax
c00067fa:	6a 01                	push   $0x1
c00067fc:	e8 c4 37 00 00       	call   c0009fc5 <send_rec>
c0006801:	83 c4 10             	add    $0x10,%esp
c0006804:	8b 45 08             	mov    0x8(%ebp),%eax
c0006807:	c6 80 48 02 00 00 ff 	movb   $0xff,0x248(%eax)
c000680e:	90                   	nop
c000680f:	c9                   	leave  
c0006810:	c3                   	ret    

c0006811 <init_bitmap>:
c0006811:	55                   	push   %ebp
c0006812:	89 e5                	mov    %esp,%ebp
c0006814:	83 ec 08             	sub    $0x8,%esp
c0006817:	8b 45 08             	mov    0x8(%ebp),%eax
c000681a:	8b 50 04             	mov    0x4(%eax),%edx
c000681d:	8b 45 08             	mov    0x8(%ebp),%eax
c0006820:	8b 00                	mov    (%eax),%eax
c0006822:	83 ec 04             	sub    $0x4,%esp
c0006825:	52                   	push   %edx
c0006826:	6a 00                	push   $0x0
c0006828:	50                   	push   %eax
c0006829:	e8 11 56 00 00       	call   c000be3f <Memset>
c000682e:	83 c4 10             	add    $0x10,%esp
c0006831:	90                   	nop
c0006832:	c9                   	leave  
c0006833:	c3                   	ret    

c0006834 <test_bit_val>:
c0006834:	55                   	push   %ebp
c0006835:	89 e5                	mov    %esp,%ebp
c0006837:	53                   	push   %ebx
c0006838:	83 ec 10             	sub    $0x10,%esp
c000683b:	8b 45 0c             	mov    0xc(%ebp),%eax
c000683e:	8d 50 07             	lea    0x7(%eax),%edx
c0006841:	85 c0                	test   %eax,%eax
c0006843:	0f 48 c2             	cmovs  %edx,%eax
c0006846:	c1 f8 03             	sar    $0x3,%eax
c0006849:	89 45 f8             	mov    %eax,-0x8(%ebp)
c000684c:	8b 45 0c             	mov    0xc(%ebp),%eax
c000684f:	99                   	cltd   
c0006850:	c1 ea 1d             	shr    $0x1d,%edx
c0006853:	01 d0                	add    %edx,%eax
c0006855:	83 e0 07             	and    $0x7,%eax
c0006858:	29 d0                	sub    %edx,%eax
c000685a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000685d:	8b 45 08             	mov    0x8(%ebp),%eax
c0006860:	8b 10                	mov    (%eax),%edx
c0006862:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006865:	01 d0                	add    %edx,%eax
c0006867:	0f b6 00             	movzbl (%eax),%eax
c000686a:	88 45 f3             	mov    %al,-0xd(%ebp)
c000686d:	0f be 55 f3          	movsbl -0xd(%ebp),%edx
c0006871:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006874:	bb 01 00 00 00       	mov    $0x1,%ebx
c0006879:	89 c1                	mov    %eax,%ecx
c000687b:	d3 e3                	shl    %cl,%ebx
c000687d:	89 d8                	mov    %ebx,%eax
c000687f:	21 c2                	and    %eax,%edx
c0006881:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006884:	89 c1                	mov    %eax,%ecx
c0006886:	d3 fa                	sar    %cl,%edx
c0006888:	89 d0                	mov    %edx,%eax
c000688a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000688d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0006891:	0f 9f c0             	setg   %al
c0006894:	0f b6 c0             	movzbl %al,%eax
c0006897:	83 c4 10             	add    $0x10,%esp
c000689a:	5b                   	pop    %ebx
c000689b:	5d                   	pop    %ebp
c000689c:	c3                   	ret    

c000689d <set_bit_val>:
c000689d:	55                   	push   %ebp
c000689e:	89 e5                	mov    %esp,%ebp
c00068a0:	83 ec 10             	sub    $0x10,%esp
c00068a3:	8b 45 0c             	mov    0xc(%ebp),%eax
c00068a6:	8d 50 07             	lea    0x7(%eax),%edx
c00068a9:	85 c0                	test   %eax,%eax
c00068ab:	0f 48 c2             	cmovs  %edx,%eax
c00068ae:	c1 f8 03             	sar    $0x3,%eax
c00068b1:	89 45 f8             	mov    %eax,-0x8(%ebp)
c00068b4:	8b 45 0c             	mov    0xc(%ebp),%eax
c00068b7:	99                   	cltd   
c00068b8:	c1 ea 1d             	shr    $0x1d,%edx
c00068bb:	01 d0                	add    %edx,%eax
c00068bd:	83 e0 07             	and    $0x7,%eax
c00068c0:	29 d0                	sub    %edx,%eax
c00068c2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00068c5:	8b 45 08             	mov    0x8(%ebp),%eax
c00068c8:	8b 10                	mov    (%eax),%edx
c00068ca:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00068cd:	01 d0                	add    %edx,%eax
c00068cf:	0f b6 00             	movzbl (%eax),%eax
c00068d2:	88 45 ff             	mov    %al,-0x1(%ebp)
c00068d5:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c00068d9:	7e 13                	jle    c00068ee <set_bit_val+0x51>
c00068db:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00068de:	ba 01 00 00 00       	mov    $0x1,%edx
c00068e3:	89 c1                	mov    %eax,%ecx
c00068e5:	d3 e2                	shl    %cl,%edx
c00068e7:	89 d0                	mov    %edx,%eax
c00068e9:	08 45 ff             	or     %al,-0x1(%ebp)
c00068ec:	eb 13                	jmp    c0006901 <set_bit_val+0x64>
c00068ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00068f1:	ba 01 00 00 00       	mov    $0x1,%edx
c00068f6:	89 c1                	mov    %eax,%ecx
c00068f8:	d3 e2                	shl    %cl,%edx
c00068fa:	89 d0                	mov    %edx,%eax
c00068fc:	f7 d0                	not    %eax
c00068fe:	20 45 ff             	and    %al,-0x1(%ebp)
c0006901:	8b 45 08             	mov    0x8(%ebp),%eax
c0006904:	8b 10                	mov    (%eax),%edx
c0006906:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006909:	01 c2                	add    %eax,%edx
c000690b:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
c000690f:	88 02                	mov    %al,(%edx)
c0006911:	b8 01 00 00 00       	mov    $0x1,%eax
c0006916:	c9                   	leave  
c0006917:	c3                   	ret    

c0006918 <set_bits>:
c0006918:	55                   	push   %ebp
c0006919:	89 e5                	mov    %esp,%ebp
c000691b:	83 ec 10             	sub    $0x10,%esp
c000691e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0006925:	eb 1c                	jmp    c0006943 <set_bits+0x2b>
c0006927:	8b 45 0c             	mov    0xc(%ebp),%eax
c000692a:	8d 50 01             	lea    0x1(%eax),%edx
c000692d:	89 55 0c             	mov    %edx,0xc(%ebp)
c0006930:	ff 75 10             	pushl  0x10(%ebp)
c0006933:	50                   	push   %eax
c0006934:	ff 75 08             	pushl  0x8(%ebp)
c0006937:	e8 61 ff ff ff       	call   c000689d <set_bit_val>
c000693c:	83 c4 0c             	add    $0xc,%esp
c000693f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0006943:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006946:	3b 45 14             	cmp    0x14(%ebp),%eax
c0006949:	7c dc                	jl     c0006927 <set_bits+0xf>
c000694b:	b8 01 00 00 00       	mov    $0x1,%eax
c0006950:	c9                   	leave  
c0006951:	c3                   	ret    

c0006952 <get_first_free_bit>:
c0006952:	55                   	push   %ebp
c0006953:	89 e5                	mov    %esp,%ebp
c0006955:	83 ec 10             	sub    $0x10,%esp
c0006958:	8b 45 08             	mov    0x8(%ebp),%eax
c000695b:	8b 40 04             	mov    0x4(%eax),%eax
c000695e:	c1 e0 03             	shl    $0x3,%eax
c0006961:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006964:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006967:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000696a:	eb 1b                	jmp    c0006987 <get_first_free_bit+0x35>
c000696c:	ff 75 fc             	pushl  -0x4(%ebp)
c000696f:	ff 75 08             	pushl  0x8(%ebp)
c0006972:	e8 bd fe ff ff       	call   c0006834 <test_bit_val>
c0006977:	83 c4 08             	add    $0x8,%esp
c000697a:	85 c0                	test   %eax,%eax
c000697c:	75 05                	jne    c0006983 <get_first_free_bit+0x31>
c000697e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006981:	eb 11                	jmp    c0006994 <get_first_free_bit+0x42>
c0006983:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0006987:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000698a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c000698d:	7c dd                	jl     c000696c <get_first_free_bit+0x1a>
c000698f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0006994:	c9                   	leave  
c0006995:	c3                   	ret    

c0006996 <get_bits>:
c0006996:	55                   	push   %ebp
c0006997:	89 e5                	mov    %esp,%ebp
c0006999:	83 ec 20             	sub    $0x20,%esp
c000699c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00069a3:	ff 75 f0             	pushl  -0x10(%ebp)
c00069a6:	ff 75 08             	pushl  0x8(%ebp)
c00069a9:	e8 a4 ff ff ff       	call   c0006952 <get_first_free_bit>
c00069ae:	83 c4 08             	add    $0x8,%esp
c00069b1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00069b4:	8b 45 08             	mov    0x8(%ebp),%eax
c00069b7:	8b 40 04             	mov    0x4(%eax),%eax
c00069ba:	c1 e0 03             	shl    $0x3,%eax
c00069bd:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00069c0:	8b 45 0c             	mov    0xc(%ebp),%eax
c00069c3:	83 e8 01             	sub    $0x1,%eax
c00069c6:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00069c9:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c00069cd:	75 08                	jne    c00069d7 <get_bits+0x41>
c00069cf:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00069d2:	e9 85 00 00 00       	jmp    c0006a5c <get_bits+0xc6>
c00069d7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00069da:	83 c0 01             	add    $0x1,%eax
c00069dd:	89 45 f8             	mov    %eax,-0x8(%ebp)
c00069e0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00069e3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00069e6:	eb 58                	jmp    c0006a40 <get_bits+0xaa>
c00069e8:	ff 75 f8             	pushl  -0x8(%ebp)
c00069eb:	ff 75 08             	pushl  0x8(%ebp)
c00069ee:	e8 41 fe ff ff       	call   c0006834 <test_bit_val>
c00069f3:	83 c4 08             	add    $0x8,%esp
c00069f6:	85 c0                	test   %eax,%eax
c00069f8:	75 0a                	jne    c0006a04 <get_bits+0x6e>
c00069fa:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c00069fe:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0006a02:	eb 2b                	jmp    c0006a2f <get_bits+0x99>
c0006a04:	6a 00                	push   $0x0
c0006a06:	ff 75 08             	pushl  0x8(%ebp)
c0006a09:	e8 44 ff ff ff       	call   c0006952 <get_first_free_bit>
c0006a0e:	83 c4 08             	add    $0x8,%esp
c0006a11:	83 c0 01             	add    $0x1,%eax
c0006a14:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006a17:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006a1a:	83 c0 01             	add    $0x1,%eax
c0006a1d:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006a20:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006a23:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006a26:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006a29:	83 e8 01             	sub    $0x1,%eax
c0006a2c:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006a2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006a32:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c0006a35:	7c 09                	jl     c0006a40 <get_bits+0xaa>
c0006a37:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c0006a3e:	eb 0d                	jmp    c0006a4d <get_bits+0xb7>
c0006a40:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006a43:	8d 50 ff             	lea    -0x1(%eax),%edx
c0006a46:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0006a49:	85 c0                	test   %eax,%eax
c0006a4b:	7f 9b                	jg     c00069e8 <get_bits+0x52>
c0006a4d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006a50:	2b 45 0c             	sub    0xc(%ebp),%eax
c0006a53:	83 c0 01             	add    $0x1,%eax
c0006a56:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006a59:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006a5c:	c9                   	leave  
c0006a5d:	c3                   	ret    

c0006a5e <get_a_page>:
c0006a5e:	55                   	push   %ebp
c0006a5f:	89 e5                	mov    %esp,%ebp
c0006a61:	83 ec 28             	sub    $0x28,%esp
c0006a64:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0006a68:	75 22                	jne    c0006a8c <get_a_page+0x2e>
c0006a6a:	a1 ac 16 01 c0       	mov    0xc00116ac,%eax
c0006a6f:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006a72:	a1 b0 16 01 c0       	mov    0xc00116b0,%eax
c0006a77:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006a7a:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c0006a7f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006a82:	a1 b8 16 01 c0       	mov    0xc00116b8,%eax
c0006a87:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006a8a:	eb 20                	jmp    c0006aac <get_a_page+0x4e>
c0006a8c:	a1 f4 1e 01 c0       	mov    0xc0011ef4,%eax
c0006a91:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006a94:	a1 f8 1e 01 c0       	mov    0xc0011ef8,%eax
c0006a99:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006a9c:	a1 fc 1e 01 c0       	mov    0xc0011efc,%eax
c0006aa1:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006aa4:	a1 00 1f 01 c0       	mov    0xc0011f00,%eax
c0006aa9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006aac:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006aaf:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0006ab2:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006ab5:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0006ab8:	6a 01                	push   $0x1
c0006aba:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0006abd:	50                   	push   %eax
c0006abe:	e8 d3 fe ff ff       	call   c0006996 <get_bits>
c0006ac3:	83 c4 08             	add    $0x8,%esp
c0006ac6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006ac9:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c0006acd:	75 1c                	jne    c0006aeb <get_a_page+0x8d>
c0006acf:	68 84 00 00 00       	push   $0x84
c0006ad4:	68 e0 b4 00 c0       	push   $0xc000b4e0
c0006ad9:	68 e0 b4 00 c0       	push   $0xc000b4e0
c0006ade:	68 ea b4 00 c0       	push   $0xc000b4ea
c0006ae3:	e8 a0 2b 00 00       	call   c0009688 <assertion_failure>
c0006ae8:	83 c4 10             	add    $0x10,%esp
c0006aeb:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006aee:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0006af1:	c1 e2 0c             	shl    $0xc,%edx
c0006af4:	01 d0                	add    %edx,%eax
c0006af6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006af9:	83 ec 04             	sub    $0x4,%esp
c0006afc:	6a 01                	push   $0x1
c0006afe:	ff 75 f4             	pushl  -0xc(%ebp)
c0006b01:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0006b04:	50                   	push   %eax
c0006b05:	e8 93 fd ff ff       	call   c000689d <set_bit_val>
c0006b0a:	83 c4 10             	add    $0x10,%esp
c0006b0d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006b10:	c9                   	leave  
c0006b11:	c3                   	ret    

c0006b12 <get_virtual_address_start_with_addr>:
c0006b12:	55                   	push   %ebp
c0006b13:	89 e5                	mov    %esp,%ebp
c0006b15:	83 ec 38             	sub    $0x38,%esp
c0006b18:	e8 7a a8 ff ff       	call   c0001397 <get_running_thread_pcb>
c0006b1d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006b20:	83 ec 0c             	sub    $0xc,%esp
c0006b23:	ff 75 10             	pushl  0x10(%ebp)
c0006b26:	e8 91 db ff ff       	call   c00046bc <pid2proc>
c0006b2b:	83 c4 10             	add    $0x10,%esp
c0006b2e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006b31:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006b34:	8b 40 0c             	mov    0xc(%eax),%eax
c0006b37:	83 ec 04             	sub    $0x4,%esp
c0006b3a:	6a 0c                	push   $0xc
c0006b3c:	50                   	push   %eax
c0006b3d:	8d 45 dc             	lea    -0x24(%ebp),%eax
c0006b40:	50                   	push   %eax
c0006b41:	e8 be 0f 00 00       	call   c0007b04 <Memcpy>
c0006b46:	83 c4 10             	add    $0x10,%esp
c0006b49:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0006b4c:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0006b4f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0006b52:	89 55 d8             	mov    %edx,-0x28(%ebp)
c0006b55:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006b58:	8b 55 08             	mov    0x8(%ebp),%edx
c0006b5b:	29 c2                	sub    %eax,%edx
c0006b5d:	89 d0                	mov    %edx,%eax
c0006b5f:	c1 e8 0c             	shr    $0xc,%eax
c0006b62:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006b65:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0006b69:	79 1c                	jns    c0006b87 <get_virtual_address_start_with_addr+0x75>
c0006b6b:	68 97 00 00 00       	push   $0x97
c0006b70:	68 e0 b4 00 c0       	push   $0xc000b4e0
c0006b75:	68 e0 b4 00 c0       	push   $0xc000b4e0
c0006b7a:	68 f6 b4 00 c0       	push   $0xc000b4f6
c0006b7f:	e8 04 2b 00 00       	call   c0009688 <assertion_failure>
c0006b84:	83 c4 10             	add    $0x10,%esp
c0006b87:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006b8a:	50                   	push   %eax
c0006b8b:	6a 01                	push   $0x1
c0006b8d:	ff 75 ec             	pushl  -0x14(%ebp)
c0006b90:	8d 45 d4             	lea    -0x2c(%ebp),%eax
c0006b93:	50                   	push   %eax
c0006b94:	e8 7f fd ff ff       	call   c0006918 <set_bits>
c0006b99:	83 c4 10             	add    $0x10,%esp
c0006b9c:	8b 45 08             	mov    0x8(%ebp),%eax
c0006b9f:	25 ff 0f 00 00       	and    $0xfff,%eax
c0006ba4:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006ba7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006baa:	c9                   	leave  
c0006bab:	c3                   	ret    

c0006bac <get_virtual_address>:
c0006bac:	55                   	push   %ebp
c0006bad:	89 e5                	mov    %esp,%ebp
c0006baf:	83 ec 28             	sub    $0x28,%esp
c0006bb2:	e8 e0 a7 ff ff       	call   c0001397 <get_running_thread_pcb>
c0006bb7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006bba:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0006bbe:	75 1a                	jne    c0006bda <get_virtual_address+0x2e>
c0006bc0:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c0006bc5:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006bc8:	a1 98 07 01 c0       	mov    0xc0010798,%eax
c0006bcd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006bd0:	a1 9c 07 01 c0       	mov    0xc001079c,%eax
c0006bd5:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006bd8:	eb 18                	jmp    c0006bf2 <get_virtual_address+0x46>
c0006bda:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006bdd:	8b 40 0c             	mov    0xc(%eax),%eax
c0006be0:	83 ec 04             	sub    $0x4,%esp
c0006be3:	6a 0c                	push   $0xc
c0006be5:	50                   	push   %eax
c0006be6:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0006be9:	50                   	push   %eax
c0006bea:	e8 15 0f 00 00       	call   c0007b04 <Memcpy>
c0006bef:	83 c4 10             	add    $0x10,%esp
c0006bf2:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006bf5:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0006bf8:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006bfb:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0006bfe:	8b 45 08             	mov    0x8(%ebp),%eax
c0006c01:	83 ec 08             	sub    $0x8,%esp
c0006c04:	50                   	push   %eax
c0006c05:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0006c08:	50                   	push   %eax
c0006c09:	e8 88 fd ff ff       	call   c0006996 <get_bits>
c0006c0e:	83 c4 10             	add    $0x10,%esp
c0006c11:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006c14:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006c17:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0006c1a:	c1 e2 0c             	shl    $0xc,%edx
c0006c1d:	01 d0                	add    %edx,%eax
c0006c1f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006c22:	8b 45 08             	mov    0x8(%ebp),%eax
c0006c25:	50                   	push   %eax
c0006c26:	6a 01                	push   $0x1
c0006c28:	ff 75 f0             	pushl  -0x10(%ebp)
c0006c2b:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0006c2e:	50                   	push   %eax
c0006c2f:	e8 e4 fc ff ff       	call   c0006918 <set_bits>
c0006c34:	83 c4 10             	add    $0x10,%esp
c0006c37:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006c3a:	c9                   	leave  
c0006c3b:	c3                   	ret    

c0006c3c <ptr_pde>:
c0006c3c:	55                   	push   %ebp
c0006c3d:	89 e5                	mov    %esp,%ebp
c0006c3f:	8b 45 08             	mov    0x8(%ebp),%eax
c0006c42:	c1 e8 16             	shr    $0x16,%eax
c0006c45:	05 00 fc ff 3f       	add    $0x3ffffc00,%eax
c0006c4a:	c1 e0 02             	shl    $0x2,%eax
c0006c4d:	5d                   	pop    %ebp
c0006c4e:	c3                   	ret    

c0006c4f <ptr_pte>:
c0006c4f:	55                   	push   %ebp
c0006c50:	89 e5                	mov    %esp,%ebp
c0006c52:	8b 45 08             	mov    0x8(%ebp),%eax
c0006c55:	c1 e8 0a             	shr    $0xa,%eax
c0006c58:	25 00 f0 3f 00       	and    $0x3ff000,%eax
c0006c5d:	89 c2                	mov    %eax,%edx
c0006c5f:	8b 45 08             	mov    0x8(%ebp),%eax
c0006c62:	c1 e8 0c             	shr    $0xc,%eax
c0006c65:	25 ff 03 00 00       	and    $0x3ff,%eax
c0006c6a:	c1 e0 02             	shl    $0x2,%eax
c0006c6d:	01 d0                	add    %edx,%eax
c0006c6f:	2d 00 00 40 00       	sub    $0x400000,%eax
c0006c74:	5d                   	pop    %ebp
c0006c75:	c3                   	ret    

c0006c76 <add_map_entry>:
c0006c76:	55                   	push   %ebp
c0006c77:	89 e5                	mov    %esp,%ebp
c0006c79:	83 ec 18             	sub    $0x18,%esp
c0006c7c:	ff 75 08             	pushl  0x8(%ebp)
c0006c7f:	e8 b8 ff ff ff       	call   c0006c3c <ptr_pde>
c0006c84:	83 c4 04             	add    $0x4,%esp
c0006c87:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006c8a:	ff 75 08             	pushl  0x8(%ebp)
c0006c8d:	e8 bd ff ff ff       	call   c0006c4f <ptr_pte>
c0006c92:	83 c4 04             	add    $0x4,%esp
c0006c95:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006c98:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006c9b:	8b 00                	mov    (%eax),%eax
c0006c9d:	83 e0 01             	and    $0x1,%eax
c0006ca0:	85 c0                	test   %eax,%eax
c0006ca2:	74 1b                	je     c0006cbf <add_map_entry+0x49>
c0006ca4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006ca7:	8b 00                	mov    (%eax),%eax
c0006ca9:	83 e0 01             	and    $0x1,%eax
c0006cac:	85 c0                	test   %eax,%eax
c0006cae:	75 54                	jne    c0006d04 <add_map_entry+0x8e>
c0006cb0:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006cb3:	83 c8 07             	or     $0x7,%eax
c0006cb6:	89 c2                	mov    %eax,%edx
c0006cb8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006cbb:	89 10                	mov    %edx,(%eax)
c0006cbd:	eb 45                	jmp    c0006d04 <add_map_entry+0x8e>
c0006cbf:	83 ec 0c             	sub    $0xc,%esp
c0006cc2:	6a 00                	push   $0x0
c0006cc4:	e8 95 fd ff ff       	call   c0006a5e <get_a_page>
c0006cc9:	83 c4 10             	add    $0x10,%esp
c0006ccc:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006ccf:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006cd2:	83 c8 07             	or     $0x7,%eax
c0006cd5:	89 c2                	mov    %eax,%edx
c0006cd7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006cda:	89 10                	mov    %edx,(%eax)
c0006cdc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006cdf:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0006ce4:	83 ec 04             	sub    $0x4,%esp
c0006ce7:	68 00 10 00 00       	push   $0x1000
c0006cec:	6a 00                	push   $0x0
c0006cee:	50                   	push   %eax
c0006cef:	e8 4b 51 00 00       	call   c000be3f <Memset>
c0006cf4:	83 c4 10             	add    $0x10,%esp
c0006cf7:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006cfa:	83 c8 07             	or     $0x7,%eax
c0006cfd:	89 c2                	mov    %eax,%edx
c0006cff:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006d02:	89 10                	mov    %edx,(%eax)
c0006d04:	90                   	nop
c0006d05:	c9                   	leave  
c0006d06:	c3                   	ret    

c0006d07 <alloc_virtual_memory>:
c0006d07:	55                   	push   %ebp
c0006d08:	89 e5                	mov    %esp,%ebp
c0006d0a:	83 ec 28             	sub    $0x28,%esp
c0006d0d:	8b 45 08             	mov    0x8(%ebp),%eax
c0006d10:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0006d15:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006d18:	8b 45 08             	mov    0x8(%ebp),%eax
c0006d1b:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0006d1e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006d21:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006d24:	01 45 e4             	add    %eax,-0x1c(%ebp)
c0006d27:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006d2a:	05 ff 0f 00 00       	add    $0xfff,%eax
c0006d2f:	c1 e8 0c             	shr    $0xc,%eax
c0006d32:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006d35:	e8 5d a6 ff ff       	call   c0001397 <get_running_thread_pcb>
c0006d3a:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0006d3d:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0006d40:	8b 40 08             	mov    0x8(%eax),%eax
c0006d43:	85 c0                	test   %eax,%eax
c0006d45:	75 09                	jne    c0006d50 <alloc_virtual_memory+0x49>
c0006d47:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0006d4e:	eb 07                	jmp    c0006d57 <alloc_virtual_memory+0x50>
c0006d50:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0006d57:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0006d5e:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0006d65:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0006d6c:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0006d73:	eb 47                	jmp    c0006dbc <alloc_virtual_memory+0xb5>
c0006d75:	83 ec 08             	sub    $0x8,%esp
c0006d78:	ff 75 f0             	pushl  -0x10(%ebp)
c0006d7b:	6a 01                	push   $0x1
c0006d7d:	e8 2a fe ff ff       	call   c0006bac <get_virtual_address>
c0006d82:	83 c4 10             	add    $0x10,%esp
c0006d85:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006d88:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0006d8c:	74 13                	je     c0006da1 <alloc_virtual_memory+0x9a>
c0006d8e:	83 ec 0c             	sub    $0xc,%esp
c0006d91:	ff 75 f0             	pushl  -0x10(%ebp)
c0006d94:	e8 c5 fc ff ff       	call   c0006a5e <get_a_page>
c0006d99:	83 c4 10             	add    $0x10,%esp
c0006d9c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006d9f:	eb 06                	jmp    c0006da7 <alloc_virtual_memory+0xa0>
c0006da1:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006da4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006da7:	83 ec 08             	sub    $0x8,%esp
c0006daa:	ff 75 f4             	pushl  -0xc(%ebp)
c0006dad:	ff 75 d8             	pushl  -0x28(%ebp)
c0006db0:	e8 c1 fe ff ff       	call   c0006c76 <add_map_entry>
c0006db5:	83 c4 10             	add    $0x10,%esp
c0006db8:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0006dbc:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006dbf:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c0006dc2:	72 b1                	jb     c0006d75 <alloc_virtual_memory+0x6e>
c0006dc4:	8b 45 08             	mov    0x8(%ebp),%eax
c0006dc7:	25 ff 0f 00 00       	and    $0xfff,%eax
c0006dcc:	89 c2                	mov    %eax,%edx
c0006dce:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006dd1:	01 d0                	add    %edx,%eax
c0006dd3:	c9                   	leave  
c0006dd4:	c3                   	ret    

c0006dd5 <get_physical_address_proc>:
c0006dd5:	55                   	push   %ebp
c0006dd6:	89 e5                	mov    %esp,%ebp
c0006dd8:	83 ec 18             	sub    $0x18,%esp
c0006ddb:	e8 db a4 ff ff       	call   c00012bb <disable_int>
c0006de0:	e8 b2 a5 ff ff       	call   c0001397 <get_running_thread_pcb>
c0006de5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006de8:	83 ec 0c             	sub    $0xc,%esp
c0006deb:	ff 75 0c             	pushl  0xc(%ebp)
c0006dee:	e8 c9 d8 ff ff       	call   c00046bc <pid2proc>
c0006df3:	83 c4 10             	add    $0x10,%esp
c0006df6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006df9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006dfc:	8b 40 08             	mov    0x8(%eax),%eax
c0006dff:	83 ec 0c             	sub    $0xc,%esp
c0006e02:	50                   	push   %eax
c0006e03:	e8 73 a5 ff ff       	call   c000137b <update_cr3>
c0006e08:	83 c4 10             	add    $0x10,%esp
c0006e0b:	83 ec 0c             	sub    $0xc,%esp
c0006e0e:	ff 75 08             	pushl  0x8(%ebp)
c0006e11:	e8 39 fe ff ff       	call   c0006c4f <ptr_pte>
c0006e16:	83 c4 10             	add    $0x10,%esp
c0006e19:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006e1c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006e1f:	8b 00                	mov    (%eax),%eax
c0006e21:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0006e26:	89 c2                	mov    %eax,%edx
c0006e28:	8b 45 08             	mov    0x8(%ebp),%eax
c0006e2b:	25 ff 0f 00 00       	and    $0xfff,%eax
c0006e30:	09 d0                	or     %edx,%eax
c0006e32:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006e35:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006e38:	8b 40 08             	mov    0x8(%eax),%eax
c0006e3b:	83 ec 0c             	sub    $0xc,%esp
c0006e3e:	50                   	push   %eax
c0006e3f:	e8 37 a5 ff ff       	call   c000137b <update_cr3>
c0006e44:	83 c4 10             	add    $0x10,%esp
c0006e47:	e8 71 a4 ff ff       	call   c00012bd <enable_int>
c0006e4c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006e4f:	c9                   	leave  
c0006e50:	c3                   	ret    

c0006e51 <get_physical_address>:
c0006e51:	55                   	push   %ebp
c0006e52:	89 e5                	mov    %esp,%ebp
c0006e54:	83 ec 10             	sub    $0x10,%esp
c0006e57:	ff 75 08             	pushl  0x8(%ebp)
c0006e5a:	e8 f0 fd ff ff       	call   c0006c4f <ptr_pte>
c0006e5f:	83 c4 04             	add    $0x4,%esp
c0006e62:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006e65:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006e68:	8b 00                	mov    (%eax),%eax
c0006e6a:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0006e6f:	89 c2                	mov    %eax,%edx
c0006e71:	8b 45 08             	mov    0x8(%ebp),%eax
c0006e74:	25 ff 0f 00 00       	and    $0xfff,%eax
c0006e79:	09 d0                	or     %edx,%eax
c0006e7b:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006e7e:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006e81:	c9                   	leave  
c0006e82:	c3                   	ret    

c0006e83 <alloc_physical_memory_of_proc>:
c0006e83:	55                   	push   %ebp
c0006e84:	89 e5                	mov    %esp,%ebp
c0006e86:	83 ec 48             	sub    $0x48,%esp
c0006e89:	e8 2d a4 ff ff       	call   c00012bb <disable_int>
c0006e8e:	8b 45 08             	mov    0x8(%ebp),%eax
c0006e91:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0006e96:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006e99:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0006ea0:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006ea3:	83 ec 0c             	sub    $0xc,%esp
c0006ea6:	50                   	push   %eax
c0006ea7:	e8 10 d8 ff ff       	call   c00046bc <pid2proc>
c0006eac:	83 c4 10             	add    $0x10,%esp
c0006eaf:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006eb2:	e8 e0 a4 ff ff       	call   c0001397 <get_running_thread_pcb>
c0006eb7:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006eba:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006ebd:	8b 40 0c             	mov    0xc(%eax),%eax
c0006ec0:	83 ec 04             	sub    $0x4,%esp
c0006ec3:	6a 0c                	push   $0xc
c0006ec5:	50                   	push   %eax
c0006ec6:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0006ec9:	50                   	push   %eax
c0006eca:	e8 35 0c 00 00       	call   c0007b04 <Memcpy>
c0006ecf:	83 c4 10             	add    $0x10,%esp
c0006ed2:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0006ed5:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0006ed8:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0006edb:	89 55 c8             	mov    %edx,-0x38(%ebp)
c0006ede:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0006ee1:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0006ee4:	29 c2                	sub    %eax,%edx
c0006ee6:	89 d0                	mov    %edx,%eax
c0006ee8:	c1 e8 0c             	shr    $0xc,%eax
c0006eeb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006eee:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0006ef1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0006ef4:	c1 e2 0c             	shl    $0xc,%edx
c0006ef7:	01 d0                	add    %edx,%eax
c0006ef9:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006efc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006eff:	6a 01                	push   $0x1
c0006f01:	6a 01                	push   $0x1
c0006f03:	50                   	push   %eax
c0006f04:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0006f07:	50                   	push   %eax
c0006f08:	e8 0b fa ff ff       	call   c0006918 <set_bits>
c0006f0d:	83 c4 10             	add    $0x10,%esp
c0006f10:	83 ec 0c             	sub    $0xc,%esp
c0006f13:	ff 75 f0             	pushl  -0x10(%ebp)
c0006f16:	e8 43 fb ff ff       	call   c0006a5e <get_a_page>
c0006f1b:	83 c4 10             	add    $0x10,%esp
c0006f1e:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0006f21:	8b 45 08             	mov    0x8(%ebp),%eax
c0006f24:	25 ff 0f 00 00       	and    $0xfff,%eax
c0006f29:	89 c2                	mov    %eax,%edx
c0006f2b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0006f2e:	01 d0                	add    %edx,%eax
c0006f30:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006f33:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006f36:	8b 40 08             	mov    0x8(%eax),%eax
c0006f39:	83 ec 0c             	sub    $0xc,%esp
c0006f3c:	50                   	push   %eax
c0006f3d:	e8 39 a4 ff ff       	call   c000137b <update_cr3>
c0006f42:	83 c4 10             	add    $0x10,%esp
c0006f45:	83 ec 08             	sub    $0x8,%esp
c0006f48:	ff 75 dc             	pushl  -0x24(%ebp)
c0006f4b:	ff 75 f4             	pushl  -0xc(%ebp)
c0006f4e:	e8 23 fd ff ff       	call   c0006c76 <add_map_entry>
c0006f53:	83 c4 10             	add    $0x10,%esp
c0006f56:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006f59:	8b 40 08             	mov    0x8(%eax),%eax
c0006f5c:	83 ec 0c             	sub    $0xc,%esp
c0006f5f:	50                   	push   %eax
c0006f60:	e8 16 a4 ff ff       	call   c000137b <update_cr3>
c0006f65:	83 c4 10             	add    $0x10,%esp
c0006f68:	e8 50 a3 ff ff       	call   c00012bd <enable_int>
c0006f6d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006f70:	c9                   	leave  
c0006f71:	c3                   	ret    

c0006f72 <alloc_physical_memory>:
c0006f72:	55                   	push   %ebp
c0006f73:	89 e5                	mov    %esp,%ebp
c0006f75:	83 ec 38             	sub    $0x38,%esp
c0006f78:	8b 45 08             	mov    0x8(%ebp),%eax
c0006f7b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0006f80:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006f83:	e8 0f a4 ff ff       	call   c0001397 <get_running_thread_pcb>
c0006f88:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006f8b:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0006f8f:	75 1a                	jne    c0006fab <alloc_physical_memory+0x39>
c0006f91:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c0006f96:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0006f99:	a1 98 07 01 c0       	mov    0xc0010798,%eax
c0006f9e:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006fa1:	a1 9c 07 01 c0       	mov    0xc001079c,%eax
c0006fa6:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0006fa9:	eb 18                	jmp    c0006fc3 <alloc_physical_memory+0x51>
c0006fab:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006fae:	8b 40 0c             	mov    0xc(%eax),%eax
c0006fb1:	83 ec 04             	sub    $0x4,%esp
c0006fb4:	6a 0c                	push   $0xc
c0006fb6:	50                   	push   %eax
c0006fb7:	8d 45 d4             	lea    -0x2c(%ebp),%eax
c0006fba:	50                   	push   %eax
c0006fbb:	e8 44 0b 00 00       	call   c0007b04 <Memcpy>
c0006fc0:	83 c4 10             	add    $0x10,%esp
c0006fc3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0006fc6:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0006fc9:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0006fcc:	89 55 d0             	mov    %edx,-0x30(%ebp)
c0006fcf:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0006fd2:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0006fd5:	29 c2                	sub    %eax,%edx
c0006fd7:	89 d0                	mov    %edx,%eax
c0006fd9:	c1 e8 0c             	shr    $0xc,%eax
c0006fdc:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006fdf:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0006fe2:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0006fe5:	c1 e2 0c             	shl    $0xc,%edx
c0006fe8:	01 d0                	add    %edx,%eax
c0006fea:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006fed:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006ff0:	6a 01                	push   $0x1
c0006ff2:	6a 01                	push   $0x1
c0006ff4:	50                   	push   %eax
c0006ff5:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0006ff8:	50                   	push   %eax
c0006ff9:	e8 1a f9 ff ff       	call   c0006918 <set_bits>
c0006ffe:	83 c4 10             	add    $0x10,%esp
c0007001:	83 ec 0c             	sub    $0xc,%esp
c0007004:	ff 75 0c             	pushl  0xc(%ebp)
c0007007:	e8 52 fa ff ff       	call   c0006a5e <get_a_page>
c000700c:	83 c4 10             	add    $0x10,%esp
c000700f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007012:	8b 45 08             	mov    0x8(%ebp),%eax
c0007015:	25 ff 0f 00 00       	and    $0xfff,%eax
c000701a:	89 c2                	mov    %eax,%edx
c000701c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000701f:	01 d0                	add    %edx,%eax
c0007021:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0007024:	83 ec 08             	sub    $0x8,%esp
c0007027:	ff 75 e4             	pushl  -0x1c(%ebp)
c000702a:	ff 75 f4             	pushl  -0xc(%ebp)
c000702d:	e8 44 fc ff ff       	call   c0006c76 <add_map_entry>
c0007032:	83 c4 10             	add    $0x10,%esp
c0007035:	8b 45 08             	mov    0x8(%ebp),%eax
c0007038:	c9                   	leave  
c0007039:	c3                   	ret    

c000703a <alloc_memory>:
c000703a:	55                   	push   %ebp
c000703b:	89 e5                	mov    %esp,%ebp
c000703d:	83 ec 18             	sub    $0x18,%esp
c0007040:	83 ec 08             	sub    $0x8,%esp
c0007043:	ff 75 0c             	pushl  0xc(%ebp)
c0007046:	ff 75 08             	pushl  0x8(%ebp)
c0007049:	e8 5e fb ff ff       	call   c0006bac <get_virtual_address>
c000704e:	83 c4 10             	add    $0x10,%esp
c0007051:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0007054:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007057:	2d 00 10 00 00       	sub    $0x1000,%eax
c000705c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000705f:	eb 29                	jmp    c000708a <alloc_memory+0x50>
c0007061:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c0007068:	83 ec 0c             	sub    $0xc,%esp
c000706b:	ff 75 0c             	pushl  0xc(%ebp)
c000706e:	e8 eb f9 ff ff       	call   c0006a5e <get_a_page>
c0007073:	83 c4 10             	add    $0x10,%esp
c0007076:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007079:	83 ec 08             	sub    $0x8,%esp
c000707c:	ff 75 ec             	pushl  -0x14(%ebp)
c000707f:	ff 75 f4             	pushl  -0xc(%ebp)
c0007082:	e8 ef fb ff ff       	call   c0006c76 <add_map_entry>
c0007087:	83 c4 10             	add    $0x10,%esp
c000708a:	8b 45 08             	mov    0x8(%ebp),%eax
c000708d:	8d 50 ff             	lea    -0x1(%eax),%edx
c0007090:	89 55 08             	mov    %edx,0x8(%ebp)
c0007093:	85 c0                	test   %eax,%eax
c0007095:	75 ca                	jne    c0007061 <alloc_memory+0x27>
c0007097:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000709a:	c9                   	leave  
c000709b:	c3                   	ret    

c000709c <get_a_virtual_page>:
c000709c:	55                   	push   %ebp
c000709d:	89 e5                	mov    %esp,%ebp
c000709f:	83 ec 18             	sub    $0x18,%esp
c00070a2:	83 ec 0c             	sub    $0xc,%esp
c00070a5:	ff 75 08             	pushl  0x8(%ebp)
c00070a8:	e8 b1 f9 ff ff       	call   c0006a5e <get_a_page>
c00070ad:	83 c4 10             	add    $0x10,%esp
c00070b0:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00070b3:	8b 45 0c             	mov    0xc(%ebp),%eax
c00070b6:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c00070bb:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00070be:	83 ec 08             	sub    $0x8,%esp
c00070c1:	ff 75 f4             	pushl  -0xc(%ebp)
c00070c4:	ff 75 f0             	pushl  -0x10(%ebp)
c00070c7:	e8 aa fb ff ff       	call   c0006c76 <add_map_entry>
c00070cc:	83 c4 10             	add    $0x10,%esp
c00070cf:	8b 45 0c             	mov    0xc(%ebp),%eax
c00070d2:	c9                   	leave  
c00070d3:	c3                   	ret    

c00070d4 <block2arena>:
c00070d4:	55                   	push   %ebp
c00070d5:	89 e5                	mov    %esp,%ebp
c00070d7:	83 ec 10             	sub    $0x10,%esp
c00070da:	8b 45 08             	mov    0x8(%ebp),%eax
c00070dd:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c00070e2:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00070e5:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00070e8:	c9                   	leave  
c00070e9:	c3                   	ret    

c00070ea <sys_malloc2>:
c00070ea:	55                   	push   %ebp
c00070eb:	89 e5                	mov    %esp,%ebp
c00070ed:	83 ec 68             	sub    $0x68,%esp
c00070f0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00070f7:	e8 9b a2 ff ff       	call   c0001397 <get_running_thread_pcb>
c00070fc:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00070ff:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0007102:	8b 40 08             	mov    0x8(%eax),%eax
c0007105:	85 c0                	test   %eax,%eax
c0007107:	75 10                	jne    c0007119 <sys_malloc2+0x2f>
c0007109:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0007110:	c7 45 ec a0 47 08 c0 	movl   $0xc00847a0,-0x14(%ebp)
c0007117:	eb 10                	jmp    c0007129 <sys_malloc2+0x3f>
c0007119:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0007120:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0007123:	83 c0 10             	add    $0x10,%eax
c0007126:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007129:	81 7d 08 00 04 00 00 	cmpl   $0x400,0x8(%ebp)
c0007130:	76 52                	jbe    c0007184 <sys_malloc2+0x9a>
c0007132:	8b 45 08             	mov    0x8(%ebp),%eax
c0007135:	05 0b 10 00 00       	add    $0x100b,%eax
c000713a:	c1 e8 0c             	shr    $0xc,%eax
c000713d:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0007140:	83 ec 08             	sub    $0x8,%esp
c0007143:	ff 75 f0             	pushl  -0x10(%ebp)
c0007146:	ff 75 d8             	pushl  -0x28(%ebp)
c0007149:	e8 ec fe ff ff       	call   c000703a <alloc_memory>
c000714e:	83 c4 10             	add    $0x10,%esp
c0007151:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0007154:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007157:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000715a:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000715d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0007163:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0007166:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c000716d:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0007170:	c6 40 08 01          	movb   $0x1,0x8(%eax)
c0007174:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0007177:	05 90 00 00 00       	add    $0x90,%eax
c000717c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000717f:	e9 f0 01 00 00       	jmp    c0007374 <sys_malloc2+0x28a>
c0007184:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000718b:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0007192:	eb 26                	jmp    c00071ba <sys_malloc2+0xd0>
c0007194:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0007197:	89 d0                	mov    %edx,%eax
c0007199:	01 c0                	add    %eax,%eax
c000719b:	01 d0                	add    %edx,%eax
c000719d:	c1 e0 03             	shl    $0x3,%eax
c00071a0:	89 c2                	mov    %eax,%edx
c00071a2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00071a5:	01 d0                	add    %edx,%eax
c00071a7:	8b 00                	mov    (%eax),%eax
c00071a9:	39 45 08             	cmp    %eax,0x8(%ebp)
c00071ac:	77 08                	ja     c00071b6 <sys_malloc2+0xcc>
c00071ae:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00071b1:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00071b4:	eb 0a                	jmp    c00071c0 <sys_malloc2+0xd6>
c00071b6:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c00071ba:	83 7d e4 09          	cmpl   $0x9,-0x1c(%ebp)
c00071be:	7e d4                	jle    c0007194 <sys_malloc2+0xaa>
c00071c0:	83 ec 08             	sub    $0x8,%esp
c00071c3:	ff 75 f0             	pushl  -0x10(%ebp)
c00071c6:	6a 01                	push   $0x1
c00071c8:	e8 6d fe ff ff       	call   c000703a <alloc_memory>
c00071cd:	83 c4 10             	add    $0x10,%esp
c00071d0:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00071d3:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00071d6:	89 d0                	mov    %edx,%eax
c00071d8:	01 c0                	add    %eax,%eax
c00071da:	01 d0                	add    %edx,%eax
c00071dc:	c1 e0 03             	shl    $0x3,%eax
c00071df:	89 c2                	mov    %eax,%edx
c00071e1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00071e4:	01 d0                	add    %edx,%eax
c00071e6:	83 ec 04             	sub    $0x4,%esp
c00071e9:	6a 18                	push   $0x18
c00071eb:	50                   	push   %eax
c00071ec:	ff 75 cc             	pushl  -0x34(%ebp)
c00071ef:	e8 10 09 00 00       	call   c0007b04 <Memcpy>
c00071f4:	83 c4 10             	add    $0x10,%esp
c00071f7:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c00071fe:	e8 9d 08 00 00       	call   c0007aa0 <intr_disable>
c0007203:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0007206:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0007209:	89 d0                	mov    %edx,%eax
c000720b:	01 c0                	add    %eax,%eax
c000720d:	01 d0                	add    %edx,%eax
c000720f:	c1 e0 03             	shl    $0x3,%eax
c0007212:	89 c2                	mov    %eax,%edx
c0007214:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007217:	01 d0                	add    %edx,%eax
c0007219:	83 c0 08             	add    $0x8,%eax
c000721c:	83 ec 0c             	sub    $0xc,%esp
c000721f:	50                   	push   %eax
c0007220:	e8 fe 38 00 00       	call   c000ab23 <isListEmpty>
c0007225:	83 c4 10             	add    $0x10,%esp
c0007228:	3c 01                	cmp    $0x1,%al
c000722a:	0f 85 c1 00 00 00    	jne    c00072f1 <sys_malloc2+0x207>
c0007230:	c7 45 c8 01 00 00 00 	movl   $0x1,-0x38(%ebp)
c0007237:	83 ec 08             	sub    $0x8,%esp
c000723a:	ff 75 f0             	pushl  -0x10(%ebp)
c000723d:	6a 01                	push   $0x1
c000723f:	e8 f6 fd ff ff       	call   c000703a <alloc_memory>
c0007244:	83 c4 10             	add    $0x10,%esp
c0007247:	89 45 c0             	mov    %eax,-0x40(%ebp)
c000724a:	8b 45 c0             	mov    -0x40(%ebp),%eax
c000724d:	83 ec 0c             	sub    $0xc,%esp
c0007250:	50                   	push   %eax
c0007251:	e8 7e fe ff ff       	call   c00070d4 <block2arena>
c0007256:	83 c4 10             	add    $0x10,%esp
c0007259:	89 45 bc             	mov    %eax,-0x44(%ebp)
c000725c:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000725f:	89 d0                	mov    %edx,%eax
c0007261:	01 c0                	add    %eax,%eax
c0007263:	01 d0                	add    %edx,%eax
c0007265:	c1 e0 03             	shl    $0x3,%eax
c0007268:	89 c2                	mov    %eax,%edx
c000726a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000726d:	01 d0                	add    %edx,%eax
c000726f:	8b 50 04             	mov    0x4(%eax),%edx
c0007272:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0007275:	89 50 04             	mov    %edx,0x4(%eax)
c0007278:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000727b:	8b 00                	mov    (%eax),%eax
c000727d:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0007280:	c7 45 b4 0c 00 00 00 	movl   $0xc,-0x4c(%ebp)
c0007287:	b8 00 10 00 00       	mov    $0x1000,%eax
c000728c:	2b 45 b4             	sub    -0x4c(%ebp),%eax
c000728f:	ba 00 00 00 00       	mov    $0x0,%edx
c0007294:	f7 75 b8             	divl   -0x48(%ebp)
c0007297:	89 45 b0             	mov    %eax,-0x50(%ebp)
c000729a:	8b 55 c0             	mov    -0x40(%ebp),%edx
c000729d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c00072a0:	01 d0                	add    %edx,%eax
c00072a2:	89 45 ac             	mov    %eax,-0x54(%ebp)
c00072a5:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c00072ac:	eb 3b                	jmp    c00072e9 <sys_malloc2+0x1ff>
c00072ae:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00072b1:	0f af 45 b8          	imul   -0x48(%ebp),%eax
c00072b5:	89 c2                	mov    %eax,%edx
c00072b7:	8b 45 ac             	mov    -0x54(%ebp),%eax
c00072ba:	01 d0                	add    %edx,%eax
c00072bc:	89 45 a8             	mov    %eax,-0x58(%ebp)
c00072bf:	8b 4d a8             	mov    -0x58(%ebp),%ecx
c00072c2:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00072c5:	89 d0                	mov    %edx,%eax
c00072c7:	01 c0                	add    %eax,%eax
c00072c9:	01 d0                	add    %edx,%eax
c00072cb:	c1 e0 03             	shl    $0x3,%eax
c00072ce:	89 c2                	mov    %eax,%edx
c00072d0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00072d3:	01 d0                	add    %edx,%eax
c00072d5:	83 c0 08             	add    $0x8,%eax
c00072d8:	83 ec 08             	sub    $0x8,%esp
c00072db:	51                   	push   %ecx
c00072dc:	50                   	push   %eax
c00072dd:	e8 3e 39 00 00       	call   c000ac20 <appendToDoubleLinkList>
c00072e2:	83 c4 10             	add    $0x10,%esp
c00072e5:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c00072e9:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00072ec:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c00072ef:	77 bd                	ja     c00072ae <sys_malloc2+0x1c4>
c00072f1:	83 ec 0c             	sub    $0xc,%esp
c00072f4:	ff 75 c4             	pushl  -0x3c(%ebp)
c00072f7:	e8 cd 07 00 00       	call   c0007ac9 <intr_set_status>
c00072fc:	83 c4 10             	add    $0x10,%esp
c00072ff:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0007302:	89 d0                	mov    %edx,%eax
c0007304:	01 c0                	add    %eax,%eax
c0007306:	01 d0                	add    %edx,%eax
c0007308:	c1 e0 03             	shl    $0x3,%eax
c000730b:	89 c2                	mov    %eax,%edx
c000730d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007310:	01 d0                	add    %edx,%eax
c0007312:	83 c0 08             	add    $0x8,%eax
c0007315:	83 ec 0c             	sub    $0xc,%esp
c0007318:	50                   	push   %eax
c0007319:	e8 6c 3a 00 00       	call   c000ad8a <popFromDoubleLinkList>
c000731e:	83 c4 10             	add    $0x10,%esp
c0007321:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0007324:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0007327:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000732a:	83 7d a8 00          	cmpl   $0x0,-0x58(%ebp)
c000732e:	75 1c                	jne    c000734c <sys_malloc2+0x262>
c0007330:	68 ef 01 00 00       	push   $0x1ef
c0007335:	68 e0 b4 00 c0       	push   $0xc000b4e0
c000733a:	68 e0 b4 00 c0       	push   $0xc000b4e0
c000733f:	68 01 b5 00 c0       	push   $0xc000b501
c0007344:	e8 3f 23 00 00       	call   c0009688 <assertion_failure>
c0007349:	83 c4 10             	add    $0x10,%esp
c000734c:	8b 45 a8             	mov    -0x58(%ebp),%eax
c000734f:	83 ec 0c             	sub    $0xc,%esp
c0007352:	50                   	push   %eax
c0007353:	e8 7c fd ff ff       	call   c00070d4 <block2arena>
c0007358:	83 c4 10             	add    $0x10,%esp
c000735b:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c000735e:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0007361:	8b 40 04             	mov    0x4(%eax),%eax
c0007364:	8d 50 ff             	lea    -0x1(%eax),%edx
c0007367:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c000736a:	89 50 04             	mov    %edx,0x4(%eax)
c000736d:	c7 45 c4 04 00 00 00 	movl   $0x4,-0x3c(%ebp)
c0007374:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0007378:	75 1c                	jne    c0007396 <sys_malloc2+0x2ac>
c000737a:	68 f6 01 00 00       	push   $0x1f6
c000737f:	68 e0 b4 00 c0       	push   $0xc000b4e0
c0007384:	68 e0 b4 00 c0       	push   $0xc000b4e0
c0007389:	68 13 b5 00 c0       	push   $0xc000b513
c000738e:	e8 f5 22 00 00       	call   c0009688 <assertion_failure>
c0007393:	83 c4 10             	add    $0x10,%esp
c0007396:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007399:	c9                   	leave  
c000739a:	c3                   	ret    

c000739b <remove_map_entry>:
c000739b:	55                   	push   %ebp
c000739c:	89 e5                	mov    %esp,%ebp
c000739e:	83 ec 10             	sub    $0x10,%esp
c00073a1:	ff 75 08             	pushl  0x8(%ebp)
c00073a4:	e8 a6 f8 ff ff       	call   c0006c4f <ptr_pte>
c00073a9:	83 c4 04             	add    $0x4,%esp
c00073ac:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00073af:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00073b2:	8b 10                	mov    (%eax),%edx
c00073b4:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00073b7:	89 10                	mov    %edx,(%eax)
c00073b9:	90                   	nop
c00073ba:	c9                   	leave  
c00073bb:	c3                   	ret    

c00073bc <free_a_page>:
c00073bc:	55                   	push   %ebp
c00073bd:	89 e5                	mov    %esp,%ebp
c00073bf:	83 ec 20             	sub    $0x20,%esp
c00073c2:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00073c6:	75 21                	jne    c00073e9 <free_a_page+0x2d>
c00073c8:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c00073cd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00073d0:	a1 98 07 01 c0       	mov    0xc0010798,%eax
c00073d5:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00073d8:	a1 9c 07 01 c0       	mov    0xc001079c,%eax
c00073dd:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00073e0:	c7 45 fc ac 16 01 c0 	movl   $0xc00116ac,-0x4(%ebp)
c00073e7:	eb 1f                	jmp    c0007408 <free_a_page+0x4c>
c00073e9:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c00073ee:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00073f1:	a1 98 07 01 c0       	mov    0xc0010798,%eax
c00073f6:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00073f9:	a1 9c 07 01 c0       	mov    0xc001079c,%eax
c00073fe:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007401:	c7 45 fc f4 1e 01 c0 	movl   $0xc0011ef4,-0x4(%ebp)
c0007408:	8b 45 08             	mov    0x8(%ebp),%eax
c000740b:	c1 e8 0c             	shr    $0xc,%eax
c000740e:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0007411:	6a 00                	push   $0x0
c0007413:	ff 75 f8             	pushl  -0x8(%ebp)
c0007416:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c0007419:	50                   	push   %eax
c000741a:	e8 7e f4 ff ff       	call   c000689d <set_bit_val>
c000741f:	83 c4 0c             	add    $0xc,%esp
c0007422:	ff 75 08             	pushl  0x8(%ebp)
c0007425:	e8 27 fa ff ff       	call   c0006e51 <get_physical_address>
c000742a:	83 c4 04             	add    $0x4,%esp
c000742d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007430:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007433:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007439:	85 c0                	test   %eax,%eax
c000743b:	0f 48 c2             	cmovs  %edx,%eax
c000743e:	c1 f8 0c             	sar    $0xc,%eax
c0007441:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0007444:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007447:	6a 00                	push   $0x0
c0007449:	ff 75 f0             	pushl  -0x10(%ebp)
c000744c:	50                   	push   %eax
c000744d:	e8 4b f4 ff ff       	call   c000689d <set_bit_val>
c0007452:	83 c4 0c             	add    $0xc,%esp
c0007455:	ff 75 08             	pushl  0x8(%ebp)
c0007458:	e8 3e ff ff ff       	call   c000739b <remove_map_entry>
c000745d:	83 c4 04             	add    $0x4,%esp
c0007460:	90                   	nop
c0007461:	c9                   	leave  
c0007462:	c3                   	ret    

c0007463 <sys_free2>:
c0007463:	55                   	push   %ebp
c0007464:	89 e5                	mov    %esp,%ebp
c0007466:	83 ec 58             	sub    $0x58,%esp
c0007469:	e8 29 9f ff ff       	call   c0001397 <get_running_thread_pcb>
c000746e:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0007471:	e8 2a 06 00 00       	call   c0007aa0 <intr_disable>
c0007476:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0007479:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000747c:	8b 40 08             	mov    0x8(%eax),%eax
c000747f:	85 c0                	test   %eax,%eax
c0007481:	75 10                	jne    c0007493 <sys_free2+0x30>
c0007483:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000748a:	c7 45 f0 a0 47 08 c0 	movl   $0xc00847a0,-0x10(%ebp)
c0007491:	eb 10                	jmp    c00074a3 <sys_free2+0x40>
c0007493:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c000749a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000749d:	83 c0 10             	add    $0x10,%eax
c00074a0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00074a3:	81 7d 0c 00 04 00 00 	cmpl   $0x400,0xc(%ebp)
c00074aa:	76 4d                	jbe    c00074f9 <sys_free2+0x96>
c00074ac:	8b 45 08             	mov    0x8(%ebp),%eax
c00074af:	83 e8 0c             	sub    $0xc,%eax
c00074b2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00074b5:	83 45 0c 0c          	addl   $0xc,0xc(%ebp)
c00074b9:	8b 45 0c             	mov    0xc(%ebp),%eax
c00074bc:	05 ff 0f 00 00       	add    $0xfff,%eax
c00074c1:	c1 e8 0c             	shr    $0xc,%eax
c00074c4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00074c7:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00074ce:	eb 1c                	jmp    c00074ec <sys_free2+0x89>
c00074d0:	83 ec 08             	sub    $0x8,%esp
c00074d3:	ff 75 f4             	pushl  -0xc(%ebp)
c00074d6:	ff 75 ec             	pushl  -0x14(%ebp)
c00074d9:	e8 de fe ff ff       	call   c00073bc <free_a_page>
c00074de:	83 c4 10             	add    $0x10,%esp
c00074e1:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
c00074e8:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c00074ec:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00074ef:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
c00074f2:	77 dc                	ja     c00074d0 <sys_free2+0x6d>
c00074f4:	e9 dc 00 00 00       	jmp    c00075d5 <sys_free2+0x172>
c00074f9:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0007500:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0007507:	eb 26                	jmp    c000752f <sys_free2+0xcc>
c0007509:	8b 55 e0             	mov    -0x20(%ebp),%edx
c000750c:	89 d0                	mov    %edx,%eax
c000750e:	01 c0                	add    %eax,%eax
c0007510:	01 d0                	add    %edx,%eax
c0007512:	c1 e0 03             	shl    $0x3,%eax
c0007515:	89 c2                	mov    %eax,%edx
c0007517:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000751a:	01 d0                	add    %edx,%eax
c000751c:	8b 00                	mov    (%eax),%eax
c000751e:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0007521:	77 08                	ja     c000752b <sys_free2+0xc8>
c0007523:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0007526:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007529:	eb 0a                	jmp    c0007535 <sys_free2+0xd2>
c000752b:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c000752f:	83 7d e0 09          	cmpl   $0x9,-0x20(%ebp)
c0007533:	7e d4                	jle    c0007509 <sys_free2+0xa6>
c0007535:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0007538:	89 d0                	mov    %edx,%eax
c000753a:	01 c0                	add    %eax,%eax
c000753c:	01 d0                	add    %edx,%eax
c000753e:	c1 e0 03             	shl    $0x3,%eax
c0007541:	89 c2                	mov    %eax,%edx
c0007543:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007546:	01 d0                	add    %edx,%eax
c0007548:	8b 10                	mov    (%eax),%edx
c000754a:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c000754d:	8b 50 04             	mov    0x4(%eax),%edx
c0007550:	89 55 b8             	mov    %edx,-0x48(%ebp)
c0007553:	8b 50 08             	mov    0x8(%eax),%edx
c0007556:	89 55 bc             	mov    %edx,-0x44(%ebp)
c0007559:	8b 50 0c             	mov    0xc(%eax),%edx
c000755c:	89 55 c0             	mov    %edx,-0x40(%ebp)
c000755f:	8b 50 10             	mov    0x10(%eax),%edx
c0007562:	89 55 c4             	mov    %edx,-0x3c(%ebp)
c0007565:	8b 40 14             	mov    0x14(%eax),%eax
c0007568:	89 45 c8             	mov    %eax,-0x38(%ebp)
c000756b:	8b 45 08             	mov    0x8(%ebp),%eax
c000756e:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0007571:	83 ec 0c             	sub    $0xc,%esp
c0007574:	ff 75 d0             	pushl  -0x30(%ebp)
c0007577:	e8 58 fb ff ff       	call   c00070d4 <block2arena>
c000757c:	83 c4 10             	add    $0x10,%esp
c000757f:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0007582:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0007585:	89 d0                	mov    %edx,%eax
c0007587:	01 c0                	add    %eax,%eax
c0007589:	01 d0                	add    %edx,%eax
c000758b:	c1 e0 03             	shl    $0x3,%eax
c000758e:	89 c2                	mov    %eax,%edx
c0007590:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007593:	01 d0                	add    %edx,%eax
c0007595:	83 c0 08             	add    $0x8,%eax
c0007598:	83 ec 08             	sub    $0x8,%esp
c000759b:	ff 75 d0             	pushl  -0x30(%ebp)
c000759e:	50                   	push   %eax
c000759f:	e8 7c 36 00 00       	call   c000ac20 <appendToDoubleLinkList>
c00075a4:	83 c4 10             	add    $0x10,%esp
c00075a7:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00075aa:	8b 40 04             	mov    0x4(%eax),%eax
c00075ad:	8d 50 01             	lea    0x1(%eax),%edx
c00075b0:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00075b3:	89 50 04             	mov    %edx,0x4(%eax)
c00075b6:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00075b9:	8b 50 04             	mov    0x4(%eax),%edx
c00075bc:	8b 45 b8             	mov    -0x48(%ebp),%eax
c00075bf:	39 c2                	cmp    %eax,%edx
c00075c1:	75 12                	jne    c00075d5 <sys_free2+0x172>
c00075c3:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00075c6:	83 ec 08             	sub    $0x8,%esp
c00075c9:	ff 75 f4             	pushl  -0xc(%ebp)
c00075cc:	50                   	push   %eax
c00075cd:	e8 ea fd ff ff       	call   c00073bc <free_a_page>
c00075d2:	83 c4 10             	add    $0x10,%esp
c00075d5:	83 ec 0c             	sub    $0xc,%esp
c00075d8:	ff 75 d8             	pushl  -0x28(%ebp)
c00075db:	e8 e9 04 00 00       	call   c0007ac9 <intr_set_status>
c00075e0:	83 c4 10             	add    $0x10,%esp
c00075e3:	90                   	nop
c00075e4:	c9                   	leave  
c00075e5:	c3                   	ret    

c00075e6 <init_memory_block_desc>:
c00075e6:	55                   	push   %ebp
c00075e7:	89 e5                	mov    %esp,%ebp
c00075e9:	83 ec 18             	sub    $0x18,%esp
c00075ec:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00075f3:	e9 b2 00 00 00       	jmp    c00076aa <init_memory_block_desc+0xc4>
c00075f8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00075fc:	75 1b                	jne    c0007619 <init_memory_block_desc+0x33>
c00075fe:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007601:	89 d0                	mov    %edx,%eax
c0007603:	01 c0                	add    %eax,%eax
c0007605:	01 d0                	add    %edx,%eax
c0007607:	c1 e0 03             	shl    $0x3,%eax
c000760a:	89 c2                	mov    %eax,%edx
c000760c:	8b 45 08             	mov    0x8(%ebp),%eax
c000760f:	01 d0                	add    %edx,%eax
c0007611:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0007617:	eb 2e                	jmp    c0007647 <init_memory_block_desc+0x61>
c0007619:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000761c:	89 d0                	mov    %edx,%eax
c000761e:	01 c0                	add    %eax,%eax
c0007620:	01 d0                	add    %edx,%eax
c0007622:	c1 e0 03             	shl    $0x3,%eax
c0007625:	8d 50 e8             	lea    -0x18(%eax),%edx
c0007628:	8b 45 08             	mov    0x8(%ebp),%eax
c000762b:	01 d0                	add    %edx,%eax
c000762d:	8b 08                	mov    (%eax),%ecx
c000762f:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007632:	89 d0                	mov    %edx,%eax
c0007634:	01 c0                	add    %eax,%eax
c0007636:	01 d0                	add    %edx,%eax
c0007638:	c1 e0 03             	shl    $0x3,%eax
c000763b:	89 c2                	mov    %eax,%edx
c000763d:	8b 45 08             	mov    0x8(%ebp),%eax
c0007640:	01 d0                	add    %edx,%eax
c0007642:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
c0007645:	89 10                	mov    %edx,(%eax)
c0007647:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000764a:	89 d0                	mov    %edx,%eax
c000764c:	01 c0                	add    %eax,%eax
c000764e:	01 d0                	add    %edx,%eax
c0007650:	c1 e0 03             	shl    $0x3,%eax
c0007653:	89 c2                	mov    %eax,%edx
c0007655:	8b 45 08             	mov    0x8(%ebp),%eax
c0007658:	01 d0                	add    %edx,%eax
c000765a:	8b 00                	mov    (%eax),%eax
c000765c:	89 c1                	mov    %eax,%ecx
c000765e:	b8 f4 0f 00 00       	mov    $0xff4,%eax
c0007663:	ba 00 00 00 00       	mov    $0x0,%edx
c0007668:	f7 f1                	div    %ecx
c000766a:	89 c1                	mov    %eax,%ecx
c000766c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000766f:	89 d0                	mov    %edx,%eax
c0007671:	01 c0                	add    %eax,%eax
c0007673:	01 d0                	add    %edx,%eax
c0007675:	c1 e0 03             	shl    $0x3,%eax
c0007678:	89 c2                	mov    %eax,%edx
c000767a:	8b 45 08             	mov    0x8(%ebp),%eax
c000767d:	01 d0                	add    %edx,%eax
c000767f:	89 ca                	mov    %ecx,%edx
c0007681:	89 50 04             	mov    %edx,0x4(%eax)
c0007684:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007687:	89 d0                	mov    %edx,%eax
c0007689:	01 c0                	add    %eax,%eax
c000768b:	01 d0                	add    %edx,%eax
c000768d:	c1 e0 03             	shl    $0x3,%eax
c0007690:	89 c2                	mov    %eax,%edx
c0007692:	8b 45 08             	mov    0x8(%ebp),%eax
c0007695:	01 d0                	add    %edx,%eax
c0007697:	83 c0 08             	add    $0x8,%eax
c000769a:	83 ec 0c             	sub    $0xc,%esp
c000769d:	50                   	push   %eax
c000769e:	e8 52 34 00 00       	call   c000aaf5 <initDoubleLinkList>
c00076a3:	83 c4 10             	add    $0x10,%esp
c00076a6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00076aa:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c00076ae:	0f 8e 44 ff ff ff    	jle    c00075f8 <init_memory_block_desc+0x12>
c00076b4:	90                   	nop
c00076b5:	c9                   	leave  
c00076b6:	c3                   	ret    

c00076b7 <init_memory2>:
c00076b7:	55                   	push   %ebp
c00076b8:	89 e5                	mov    %esp,%ebp
c00076ba:	83 ec 38             	sub    $0x38,%esp
c00076bd:	c7 45 f4 00 00 00 02 	movl   $0x2000000,-0xc(%ebp)
c00076c4:	c7 45 f0 00 20 10 00 	movl   $0x102000,-0x10(%ebp)
c00076cb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00076ce:	a3 b4 16 01 c0       	mov    %eax,0xc00116b4
c00076d3:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00076d6:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c00076db:	29 c2                	sub    %eax,%edx
c00076dd:	89 d0                	mov    %edx,%eax
c00076df:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00076e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00076e5:	89 c2                	mov    %eax,%edx
c00076e7:	c1 ea 1f             	shr    $0x1f,%edx
c00076ea:	01 d0                	add    %edx,%eax
c00076ec:	d1 f8                	sar    %eax
c00076ee:	a3 b8 16 01 c0       	mov    %eax,0xc00116b8
c00076f3:	a1 b8 16 01 c0       	mov    0xc00116b8,%eax
c00076f8:	83 ec 0c             	sub    $0xc,%esp
c00076fb:	50                   	push   %eax
c00076fc:	e8 ec 07 00 00       	call   c0007eed <disp_int>
c0007701:	83 c4 10             	add    $0x10,%esp
c0007704:	a1 b8 16 01 c0       	mov    0xc00116b8,%eax
c0007709:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000770c:	29 c2                	sub    %eax,%edx
c000770e:	89 d0                	mov    %edx,%eax
c0007710:	a3 00 1f 01 c0       	mov    %eax,0xc0011f00
c0007715:	83 ec 0c             	sub    $0xc,%esp
c0007718:	68 1f b5 00 c0       	push   $0xc000b51f
c000771d:	e8 6a 99 ff ff       	call   c000108c <disp_str>
c0007722:	83 c4 10             	add    $0x10,%esp
c0007725:	a1 00 1f 01 c0       	mov    0xc0011f00,%eax
c000772a:	83 ec 0c             	sub    $0xc,%esp
c000772d:	50                   	push   %eax
c000772e:	e8 ba 07 00 00       	call   c0007eed <disp_int>
c0007733:	83 c4 10             	add    $0x10,%esp
c0007736:	83 ec 0c             	sub    $0xc,%esp
c0007739:	68 1f b5 00 c0       	push   $0xc000b51f
c000773e:	e8 49 99 ff ff       	call   c000108c <disp_str>
c0007743:	83 c4 10             	add    $0x10,%esp
c0007746:	a1 b8 16 01 c0       	mov    0xc00116b8,%eax
c000774b:	05 ff 0f 00 00       	add    $0xfff,%eax
c0007750:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007756:	85 c0                	test   %eax,%eax
c0007758:	0f 48 c2             	cmovs  %edx,%eax
c000775b:	c1 f8 0c             	sar    $0xc,%eax
c000775e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007761:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007764:	83 c0 07             	add    $0x7,%eax
c0007767:	8d 50 07             	lea    0x7(%eax),%edx
c000776a:	85 c0                	test   %eax,%eax
c000776c:	0f 48 c2             	cmovs  %edx,%eax
c000776f:	c1 f8 03             	sar    $0x3,%eax
c0007772:	a3 b0 16 01 c0       	mov    %eax,0xc00116b0
c0007777:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c000777c:	2d 00 00 00 40       	sub    $0x40000000,%eax
c0007781:	a3 ac 16 01 c0       	mov    %eax,0xc00116ac
c0007786:	8b 15 b0 16 01 c0    	mov    0xc00116b0,%edx
c000778c:	a1 ac 16 01 c0       	mov    0xc00116ac,%eax
c0007791:	83 ec 04             	sub    $0x4,%esp
c0007794:	52                   	push   %edx
c0007795:	6a 00                	push   $0x0
c0007797:	50                   	push   %eax
c0007798:	e8 a2 46 00 00       	call   c000be3f <Memset>
c000779d:	83 c4 10             	add    $0x10,%esp
c00077a0:	a1 b0 16 01 c0       	mov    0xc00116b0,%eax
c00077a5:	05 ff 0f 00 00       	add    $0xfff,%eax
c00077aa:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c00077b0:	85 c0                	test   %eax,%eax
c00077b2:	0f 48 c2             	cmovs  %edx,%eax
c00077b5:	c1 f8 0c             	sar    $0xc,%eax
c00077b8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00077bb:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00077be:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00077c1:	ff 75 e8             	pushl  -0x18(%ebp)
c00077c4:	6a 01                	push   $0x1
c00077c6:	6a 00                	push   $0x0
c00077c8:	68 ac 16 01 c0       	push   $0xc00116ac
c00077cd:	e8 46 f1 ff ff       	call   c0006918 <set_bits>
c00077d2:	83 c4 10             	add    $0x10,%esp
c00077d5:	a1 00 1f 01 c0       	mov    0xc0011f00,%eax
c00077da:	05 ff 0f 00 00       	add    $0xfff,%eax
c00077df:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c00077e5:	85 c0                	test   %eax,%eax
c00077e7:	0f 48 c2             	cmovs  %edx,%eax
c00077ea:	c1 f8 0c             	sar    $0xc,%eax
c00077ed:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00077f0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00077f3:	83 c0 07             	add    $0x7,%eax
c00077f6:	8d 50 07             	lea    0x7(%eax),%edx
c00077f9:	85 c0                	test   %eax,%eax
c00077fb:	0f 48 c2             	cmovs  %edx,%eax
c00077fe:	c1 f8 03             	sar    $0x3,%eax
c0007801:	a3 f8 1e 01 c0       	mov    %eax,0xc0011ef8
c0007806:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c000780b:	8b 15 b0 16 01 c0    	mov    0xc00116b0,%edx
c0007811:	01 d0                	add    %edx,%eax
c0007813:	a3 f4 1e 01 c0       	mov    %eax,0xc0011ef4
c0007818:	8b 15 f8 1e 01 c0    	mov    0xc0011ef8,%edx
c000781e:	a1 f4 1e 01 c0       	mov    0xc0011ef4,%eax
c0007823:	83 ec 04             	sub    $0x4,%esp
c0007826:	52                   	push   %edx
c0007827:	6a 00                	push   $0x0
c0007829:	50                   	push   %eax
c000782a:	e8 10 46 00 00       	call   c000be3f <Memset>
c000782f:	83 c4 10             	add    $0x10,%esp
c0007832:	a1 f8 1e 01 c0       	mov    0xc0011ef8,%eax
c0007837:	05 ff 0f 00 00       	add    $0xfff,%eax
c000783c:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007842:	85 c0                	test   %eax,%eax
c0007844:	0f 48 c2             	cmovs  %edx,%eax
c0007847:	c1 f8 0c             	sar    $0xc,%eax
c000784a:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000784d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0007850:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0007853:	ff 75 e8             	pushl  -0x18(%ebp)
c0007856:	6a 01                	push   $0x1
c0007858:	ff 75 e0             	pushl  -0x20(%ebp)
c000785b:	68 ac 16 01 c0       	push   $0xc00116ac
c0007860:	e8 b3 f0 ff ff       	call   c0006918 <set_bits>
c0007865:	83 c4 10             	add    $0x10,%esp
c0007868:	c7 45 dc 00 00 10 00 	movl   $0x100000,-0x24(%ebp)
c000786f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0007872:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007875:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007878:	83 c0 07             	add    $0x7,%eax
c000787b:	8d 50 07             	lea    0x7(%eax),%edx
c000787e:	85 c0                	test   %eax,%eax
c0007880:	0f 48 c2             	cmovs  %edx,%eax
c0007883:	c1 f8 03             	sar    $0x3,%eax
c0007886:	a3 98 07 01 c0       	mov    %eax,0xc0010798
c000788b:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c0007890:	8b 15 b0 16 01 c0    	mov    0xc00116b0,%edx
c0007896:	01 c2                	add    %eax,%edx
c0007898:	a1 f8 1e 01 c0       	mov    0xc0011ef8,%eax
c000789d:	01 d0                	add    %edx,%eax
c000789f:	a3 94 07 01 c0       	mov    %eax,0xc0010794
c00078a4:	8b 15 98 07 01 c0    	mov    0xc0010798,%edx
c00078aa:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c00078af:	83 ec 04             	sub    $0x4,%esp
c00078b2:	52                   	push   %edx
c00078b3:	6a 00                	push   $0x0
c00078b5:	50                   	push   %eax
c00078b6:	e8 84 45 00 00       	call   c000be3f <Memset>
c00078bb:	83 c4 10             	add    $0x10,%esp
c00078be:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c00078c1:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00078c4:	01 d0                	add    %edx,%eax
c00078c6:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00078c9:	a1 98 07 01 c0       	mov    0xc0010798,%eax
c00078ce:	05 ff 0f 00 00       	add    $0xfff,%eax
c00078d3:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c00078d9:	85 c0                	test   %eax,%eax
c00078db:	0f 48 c2             	cmovs  %edx,%eax
c00078de:	c1 f8 0c             	sar    $0xc,%eax
c00078e1:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00078e4:	ff 75 e8             	pushl  -0x18(%ebp)
c00078e7:	6a 01                	push   $0x1
c00078e9:	ff 75 e0             	pushl  -0x20(%ebp)
c00078ec:	68 ac 16 01 c0       	push   $0xc00116ac
c00078f1:	e8 22 f0 ff ff       	call   c0006918 <set_bits>
c00078f6:	83 c4 10             	add    $0x10,%esp
c00078f9:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00078fc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00078ff:	01 d0                	add    %edx,%eax
c0007901:	c1 e0 0c             	shl    $0xc,%eax
c0007904:	a3 9c 07 01 c0       	mov    %eax,0xc001079c
c0007909:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000790c:	83 c0 02             	add    $0x2,%eax
c000790f:	c1 e0 0c             	shl    $0xc,%eax
c0007912:	89 c2                	mov    %eax,%edx
c0007914:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007917:	01 d0                	add    %edx,%eax
c0007919:	a3 9c 07 01 c0       	mov    %eax,0xc001079c
c000791e:	c7 45 d8 05 00 00 00 	movl   $0x5,-0x28(%ebp)
c0007925:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007928:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000792b:	90                   	nop
c000792c:	c9                   	leave  
c000792d:	c3                   	ret    

c000792e <init_memory>:
c000792e:	55                   	push   %ebp
c000792f:	89 e5                	mov    %esp,%ebp
c0007931:	83 ec 38             	sub    $0x38,%esp
c0007934:	c7 45 f4 00 a0 09 c0 	movl   $0xc009a000,-0xc(%ebp)
c000793b:	c7 45 f0 00 00 10 c0 	movl   $0xc0100000,-0x10(%ebp)
c0007942:	c7 45 ec 00 00 10 00 	movl   $0x100000,-0x14(%ebp)
c0007949:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000794c:	05 00 00 10 00       	add    $0x100000,%eax
c0007951:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007954:	8b 45 08             	mov    0x8(%ebp),%eax
c0007957:	2b 45 e8             	sub    -0x18(%ebp),%eax
c000795a:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007960:	85 c0                	test   %eax,%eax
c0007962:	0f 48 c2             	cmovs  %edx,%eax
c0007965:	c1 f8 0c             	sar    $0xc,%eax
c0007968:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000796b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000796e:	89 c2                	mov    %eax,%edx
c0007970:	c1 ea 1f             	shr    $0x1f,%edx
c0007973:	01 d0                	add    %edx,%eax
c0007975:	d1 f8                	sar    %eax
c0007977:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000797a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000797d:	2b 45 e0             	sub    -0x20(%ebp),%eax
c0007980:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0007983:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0007986:	8d 50 07             	lea    0x7(%eax),%edx
c0007989:	85 c0                	test   %eax,%eax
c000798b:	0f 48 c2             	cmovs  %edx,%eax
c000798e:	c1 f8 03             	sar    $0x3,%eax
c0007991:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0007994:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0007997:	8d 50 07             	lea    0x7(%eax),%edx
c000799a:	85 c0                	test   %eax,%eax
c000799c:	0f 48 c2             	cmovs  %edx,%eax
c000799f:	c1 f8 03             	sar    $0x3,%eax
c00079a2:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00079a5:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00079a8:	a3 b4 16 01 c0       	mov    %eax,0xc00116b4
c00079ad:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c00079b2:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00079b5:	c1 e2 0c             	shl    $0xc,%edx
c00079b8:	01 d0                	add    %edx,%eax
c00079ba:	a3 fc 1e 01 c0       	mov    %eax,0xc0011efc
c00079bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00079c2:	a3 ac 16 01 c0       	mov    %eax,0xc00116ac
c00079c7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00079ca:	a3 b0 16 01 c0       	mov    %eax,0xc00116b0
c00079cf:	a1 ac 16 01 c0       	mov    0xc00116ac,%eax
c00079d4:	83 ec 04             	sub    $0x4,%esp
c00079d7:	ff 75 d8             	pushl  -0x28(%ebp)
c00079da:	6a 00                	push   $0x0
c00079dc:	50                   	push   %eax
c00079dd:	e8 5d 44 00 00       	call   c000be3f <Memset>
c00079e2:	83 c4 10             	add    $0x10,%esp
c00079e5:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00079e8:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00079eb:	01 d0                	add    %edx,%eax
c00079ed:	a3 f4 1e 01 c0       	mov    %eax,0xc0011ef4
c00079f2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00079f5:	a3 f8 1e 01 c0       	mov    %eax,0xc0011ef8
c00079fa:	a1 f4 1e 01 c0       	mov    0xc0011ef4,%eax
c00079ff:	83 ec 04             	sub    $0x4,%esp
c0007a02:	ff 75 d4             	pushl  -0x2c(%ebp)
c0007a05:	6a 00                	push   $0x0
c0007a07:	50                   	push   %eax
c0007a08:	e8 32 44 00 00       	call   c000be3f <Memset>
c0007a0d:	83 c4 10             	add    $0x10,%esp
c0007a10:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007a13:	a3 98 07 01 c0       	mov    %eax,0xc0010798
c0007a18:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007a1b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007a1e:	01 c2                	add    %eax,%edx
c0007a20:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007a23:	01 d0                	add    %edx,%eax
c0007a25:	a3 94 07 01 c0       	mov    %eax,0xc0010794
c0007a2a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007a2d:	05 00 00 10 00       	add    $0x100000,%eax
c0007a32:	a3 9c 07 01 c0       	mov    %eax,0xc001079c
c0007a37:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c0007a3c:	83 ec 04             	sub    $0x4,%esp
c0007a3f:	ff 75 d8             	pushl  -0x28(%ebp)
c0007a42:	6a 00                	push   $0x0
c0007a44:	50                   	push   %eax
c0007a45:	e8 f5 43 00 00       	call   c000be3f <Memset>
c0007a4a:	83 c4 10             	add    $0x10,%esp
c0007a4d:	83 ec 04             	sub    $0x4,%esp
c0007a50:	68 f0 00 00 00       	push   $0xf0
c0007a55:	6a 00                	push   $0x0
c0007a57:	68 a0 47 08 c0       	push   $0xc00847a0
c0007a5c:	e8 de 43 00 00       	call   c000be3f <Memset>
c0007a61:	83 c4 10             	add    $0x10,%esp
c0007a64:	83 ec 0c             	sub    $0xc,%esp
c0007a67:	68 a0 47 08 c0       	push   $0xc00847a0
c0007a6c:	e8 75 fb ff ff       	call   c00075e6 <init_memory_block_desc>
c0007a71:	83 c4 10             	add    $0x10,%esp
c0007a74:	90                   	nop
c0007a75:	c9                   	leave  
c0007a76:	c3                   	ret    

c0007a77 <intr_enable>:
c0007a77:	55                   	push   %ebp
c0007a78:	89 e5                	mov    %esp,%ebp
c0007a7a:	83 ec 18             	sub    $0x18,%esp
c0007a7d:	e8 65 00 00 00       	call   c0007ae7 <intr_get_status>
c0007a82:	83 f8 01             	cmp    $0x1,%eax
c0007a85:	75 0c                	jne    c0007a93 <intr_enable+0x1c>
c0007a87:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0007a8e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007a91:	eb 0b                	jmp    c0007a9e <intr_enable+0x27>
c0007a93:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007a9a:	fb                   	sti    
c0007a9b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007a9e:	c9                   	leave  
c0007a9f:	c3                   	ret    

c0007aa0 <intr_disable>:
c0007aa0:	55                   	push   %ebp
c0007aa1:	89 e5                	mov    %esp,%ebp
c0007aa3:	83 ec 18             	sub    $0x18,%esp
c0007aa6:	e8 3c 00 00 00       	call   c0007ae7 <intr_get_status>
c0007aab:	83 f8 01             	cmp    $0x1,%eax
c0007aae:	75 0d                	jne    c0007abd <intr_disable+0x1d>
c0007ab0:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0007ab7:	fa                   	cli    
c0007ab8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007abb:	eb 0a                	jmp    c0007ac7 <intr_disable+0x27>
c0007abd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007ac4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007ac7:	c9                   	leave  
c0007ac8:	c3                   	ret    

c0007ac9 <intr_set_status>:
c0007ac9:	55                   	push   %ebp
c0007aca:	89 e5                	mov    %esp,%ebp
c0007acc:	83 ec 08             	sub    $0x8,%esp
c0007acf:	8b 45 08             	mov    0x8(%ebp),%eax
c0007ad2:	83 e0 01             	and    $0x1,%eax
c0007ad5:	85 c0                	test   %eax,%eax
c0007ad7:	74 07                	je     c0007ae0 <intr_set_status+0x17>
c0007ad9:	e8 99 ff ff ff       	call   c0007a77 <intr_enable>
c0007ade:	eb 05                	jmp    c0007ae5 <intr_set_status+0x1c>
c0007ae0:	e8 bb ff ff ff       	call   c0007aa0 <intr_disable>
c0007ae5:	c9                   	leave  
c0007ae6:	c3                   	ret    

c0007ae7 <intr_get_status>:
c0007ae7:	55                   	push   %ebp
c0007ae8:	89 e5                	mov    %esp,%ebp
c0007aea:	83 ec 10             	sub    $0x10,%esp
c0007aed:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0007af4:	9c                   	pushf  
c0007af5:	58                   	pop    %eax
c0007af6:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0007af9:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007afc:	c1 e8 09             	shr    $0x9,%eax
c0007aff:	83 e0 01             	and    $0x1,%eax
c0007b02:	c9                   	leave  
c0007b03:	c3                   	ret    

c0007b04 <Memcpy>:
c0007b04:	55                   	push   %ebp
c0007b05:	89 e5                	mov    %esp,%ebp
c0007b07:	83 ec 18             	sub    $0x18,%esp
c0007b0a:	e8 91 ff ff ff       	call   c0007aa0 <intr_disable>
c0007b0f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007b12:	83 ec 04             	sub    $0x4,%esp
c0007b15:	ff 75 10             	pushl  0x10(%ebp)
c0007b18:	ff 75 0c             	pushl  0xc(%ebp)
c0007b1b:	ff 75 08             	pushl  0x8(%ebp)
c0007b1e:	e8 ee 42 00 00       	call   c000be11 <Memcpy2>
c0007b23:	83 c4 10             	add    $0x10,%esp
c0007b26:	83 ec 0c             	sub    $0xc,%esp
c0007b29:	ff 75 f4             	pushl  -0xc(%ebp)
c0007b2c:	e8 98 ff ff ff       	call   c0007ac9 <intr_set_status>
c0007b31:	83 c4 10             	add    $0x10,%esp
c0007b34:	90                   	nop
c0007b35:	c9                   	leave  
c0007b36:	c3                   	ret    

c0007b37 <untar>:
c0007b37:	55                   	push   %ebp
c0007b38:	89 e5                	mov    %esp,%ebp
c0007b3a:	81 ec 48 0a 00 00    	sub    $0xa48,%esp
c0007b40:	83 ec 08             	sub    $0x8,%esp
c0007b43:	6a 00                	push   $0x0
c0007b45:	ff 75 08             	pushl  0x8(%ebp)
c0007b48:	e8 71 de ff ff       	call   c00059be <open>
c0007b4d:	83 c4 10             	add    $0x10,%esp
c0007b50:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007b53:	83 ec 0c             	sub    $0xc,%esp
c0007b56:	68 40 b5 00 c0       	push   $0xc000b540
c0007b5b:	e8 cb 17 00 00       	call   c000932b <Printf>
c0007b60:	83 c4 10             	add    $0x10,%esp
c0007b63:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0007b6a:	c7 45 dc 00 02 00 00 	movl   $0x200,-0x24(%ebp)
c0007b71:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007b78:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0007b7f:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0007b86:	e9 5e 02 00 00       	jmp    c0007de9 <untar+0x2b2>
c0007b8b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0007b8f:	7e 58                	jle    c0007be9 <untar+0xb2>
c0007b91:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007b94:	05 ff 01 00 00       	add    $0x1ff,%eax
c0007b99:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0007b9f:	85 c0                	test   %eax,%eax
c0007ba1:	0f 48 c2             	cmovs  %edx,%eax
c0007ba4:	c1 f8 09             	sar    $0x9,%eax
c0007ba7:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0007baa:	83 ec 04             	sub    $0x4,%esp
c0007bad:	68 00 02 00 00       	push   $0x200
c0007bb2:	6a 00                	push   $0x0
c0007bb4:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0007bba:	50                   	push   %eax
c0007bbb:	e8 7f 42 00 00       	call   c000be3f <Memset>
c0007bc0:	83 c4 10             	add    $0x10,%esp
c0007bc3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007bc6:	c1 e0 09             	shl    $0x9,%eax
c0007bc9:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0007bcc:	83 ec 04             	sub    $0x4,%esp
c0007bcf:	50                   	push   %eax
c0007bd0:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0007bd6:	50                   	push   %eax
c0007bd7:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007bda:	e8 74 de ff ff       	call   c0005a53 <read>
c0007bdf:	83 c4 10             	add    $0x10,%esp
c0007be2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007be9:	83 ec 04             	sub    $0x4,%esp
c0007bec:	68 00 02 00 00       	push   $0x200
c0007bf1:	6a 00                	push   $0x0
c0007bf3:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0007bf9:	50                   	push   %eax
c0007bfa:	e8 40 42 00 00       	call   c000be3f <Memset>
c0007bff:	83 c4 10             	add    $0x10,%esp
c0007c02:	83 ec 04             	sub    $0x4,%esp
c0007c05:	68 00 02 00 00       	push   $0x200
c0007c0a:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0007c10:	50                   	push   %eax
c0007c11:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007c14:	e8 3a de ff ff       	call   c0005a53 <read>
c0007c19:	83 c4 10             	add    $0x10,%esp
c0007c1c:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0007c1f:	83 ec 0c             	sub    $0xc,%esp
c0007c22:	68 52 b5 00 c0       	push   $0xc000b552
c0007c27:	e8 ff 16 00 00       	call   c000932b <Printf>
c0007c2c:	83 c4 10             	add    $0x10,%esp
c0007c2f:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0007c33:	0f 84 bc 01 00 00    	je     c0007df5 <untar+0x2be>
c0007c39:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007c3c:	01 45 f4             	add    %eax,-0xc(%ebp)
c0007c3f:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0007c46:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0007c4c:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0007c4f:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0007c52:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0007c55:	83 ec 08             	sub    $0x8,%esp
c0007c58:	6a 07                	push   $0x7
c0007c5a:	ff 75 cc             	pushl  -0x34(%ebp)
c0007c5d:	e8 5c dd ff ff       	call   c00059be <open>
c0007c62:	83 c4 10             	add    $0x10,%esp
c0007c65:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0007c68:	83 ec 0c             	sub    $0xc,%esp
c0007c6b:	68 64 b5 00 c0       	push   $0xc000b564
c0007c70:	e8 b6 16 00 00       	call   c000932b <Printf>
c0007c75:	83 c4 10             	add    $0x10,%esp
c0007c78:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0007c7f:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0007c82:	83 c0 7c             	add    $0x7c,%eax
c0007c85:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0007c88:	83 ec 0c             	sub    $0xc,%esp
c0007c8b:	ff 75 cc             	pushl  -0x34(%ebp)
c0007c8e:	e8 e5 41 00 00       	call   c000be78 <Strlen>
c0007c93:	83 c4 10             	add    $0x10,%esp
c0007c96:	85 c0                	test   %eax,%eax
c0007c98:	75 28                	jne    c0007cc2 <untar+0x18b>
c0007c9a:	83 ec 0c             	sub    $0xc,%esp
c0007c9d:	ff 75 c4             	pushl  -0x3c(%ebp)
c0007ca0:	e8 d3 41 00 00       	call   c000be78 <Strlen>
c0007ca5:	83 c4 10             	add    $0x10,%esp
c0007ca8:	85 c0                	test   %eax,%eax
c0007caa:	75 16                	jne    c0007cc2 <untar+0x18b>
c0007cac:	83 ec 0c             	sub    $0xc,%esp
c0007caf:	68 76 b5 00 c0       	push   $0xc000b576
c0007cb4:	e8 72 16 00 00       	call   c000932b <Printf>
c0007cb9:	83 c4 10             	add    $0x10,%esp
c0007cbc:	90                   	nop
c0007cbd:	e9 34 01 00 00       	jmp    c0007df6 <untar+0x2bf>
c0007cc2:	83 ec 0c             	sub    $0xc,%esp
c0007cc5:	68 7d b5 00 c0       	push   $0xc000b57d
c0007cca:	e8 5c 16 00 00       	call   c000932b <Printf>
c0007ccf:	83 c4 10             	add    $0x10,%esp
c0007cd2:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0007cd5:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007cd8:	eb 1f                	jmp    c0007cf9 <untar+0x1c2>
c0007cda:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007cdd:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0007ce4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007ce7:	0f b6 00             	movzbl (%eax),%eax
c0007cea:	0f be c0             	movsbl %al,%eax
c0007ced:	83 e8 30             	sub    $0x30,%eax
c0007cf0:	01 d0                	add    %edx,%eax
c0007cf2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007cf5:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0007cf9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007cfc:	0f b6 00             	movzbl (%eax),%eax
c0007cff:	84 c0                	test   %al,%al
c0007d01:	75 d7                	jne    c0007cda <untar+0x1a3>
c0007d03:	83 ec 0c             	sub    $0xc,%esp
c0007d06:	68 8b b5 00 c0       	push   $0xc000b58b
c0007d0b:	e8 1b 16 00 00       	call   c000932b <Printf>
c0007d10:	83 c4 10             	add    $0x10,%esp
c0007d13:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007d16:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0007d19:	c7 45 bc 00 08 00 00 	movl   $0x800,-0x44(%ebp)
c0007d20:	83 ec 08             	sub    $0x8,%esp
c0007d23:	ff 75 c0             	pushl  -0x40(%ebp)
c0007d26:	68 99 b5 00 c0       	push   $0xc000b599
c0007d2b:	e8 fb 15 00 00       	call   c000932b <Printf>
c0007d30:	83 c4 10             	add    $0x10,%esp
c0007d33:	83 ec 08             	sub    $0x8,%esp
c0007d36:	ff 75 c0             	pushl  -0x40(%ebp)
c0007d39:	68 ab b5 00 c0       	push   $0xc000b5ab
c0007d3e:	e8 e8 15 00 00       	call   c000932b <Printf>
c0007d43:	83 c4 10             	add    $0x10,%esp
c0007d46:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0007d49:	39 45 bc             	cmp    %eax,-0x44(%ebp)
c0007d4c:	0f 4e 45 bc          	cmovle -0x44(%ebp),%eax
c0007d50:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0007d53:	83 ec 04             	sub    $0x4,%esp
c0007d56:	ff 75 b8             	pushl  -0x48(%ebp)
c0007d59:	8d 85 b8 f5 ff ff    	lea    -0xa48(%ebp),%eax
c0007d5f:	50                   	push   %eax
c0007d60:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007d63:	e8 eb dc ff ff       	call   c0005a53 <read>
c0007d68:	83 c4 10             	add    $0x10,%esp
c0007d6b:	01 45 f4             	add    %eax,-0xc(%ebp)
c0007d6e:	83 ec 04             	sub    $0x4,%esp
c0007d71:	ff 75 b8             	pushl  -0x48(%ebp)
c0007d74:	8d 85 b8 f5 ff ff    	lea    -0xa48(%ebp),%eax
c0007d7a:	50                   	push   %eax
c0007d7b:	ff 75 c8             	pushl  -0x38(%ebp)
c0007d7e:	e8 51 de ff ff       	call   c0005bd4 <write>
c0007d83:	83 c4 10             	add    $0x10,%esp
c0007d86:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007d89:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0007d8c:	7d 02                	jge    c0007d90 <untar+0x259>
c0007d8e:	eb c3                	jmp    c0007d53 <untar+0x21c>
c0007d90:	90                   	nop
c0007d91:	83 ec 08             	sub    $0x8,%esp
c0007d94:	ff 75 f4             	pushl  -0xc(%ebp)
c0007d97:	68 bd b5 00 c0       	push   $0xc000b5bd
c0007d9c:	e8 8a 15 00 00       	call   c000932b <Printf>
c0007da1:	83 c4 10             	add    $0x10,%esp
c0007da4:	83 ec 08             	sub    $0x8,%esp
c0007da7:	ff 75 c0             	pushl  -0x40(%ebp)
c0007daa:	68 cf b5 00 c0       	push   $0xc000b5cf
c0007daf:	e8 77 15 00 00       	call   c000932b <Printf>
c0007db4:	83 c4 10             	add    $0x10,%esp
c0007db7:	83 ec 0c             	sub    $0xc,%esp
c0007dba:	68 e0 b5 00 c0       	push   $0xc000b5e0
c0007dbf:	e8 67 15 00 00       	call   c000932b <Printf>
c0007dc4:	83 c4 10             	add    $0x10,%esp
c0007dc7:	83 ec 0c             	sub    $0xc,%esp
c0007dca:	ff 75 c8             	pushl  -0x38(%ebp)
c0007dcd:	e8 87 de ff ff       	call   c0005c59 <close>
c0007dd2:	83 c4 10             	add    $0x10,%esp
c0007dd5:	83 ec 0c             	sub    $0xc,%esp
c0007dd8:	68 ee b5 00 c0       	push   $0xc000b5ee
c0007ddd:	e8 49 15 00 00       	call   c000932b <Printf>
c0007de2:	83 c4 10             	add    $0x10,%esp
c0007de5:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c0007de9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0007ded:	0f 8f 98 fd ff ff    	jg     c0007b8b <untar+0x54>
c0007df3:	eb 01                	jmp    c0007df6 <untar+0x2bf>
c0007df5:	90                   	nop
c0007df6:	83 ec 0c             	sub    $0xc,%esp
c0007df9:	68 fb b5 00 c0       	push   $0xc000b5fb
c0007dfe:	e8 28 15 00 00       	call   c000932b <Printf>
c0007e03:	83 c4 10             	add    $0x10,%esp
c0007e06:	83 ec 0c             	sub    $0xc,%esp
c0007e09:	68 0d b6 00 c0       	push   $0xc000b60d
c0007e0e:	e8 18 15 00 00       	call   c000932b <Printf>
c0007e13:	83 c4 10             	add    $0x10,%esp
c0007e16:	83 ec 0c             	sub    $0xc,%esp
c0007e19:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007e1c:	e8 38 de ff ff       	call   c0005c59 <close>
c0007e21:	83 c4 10             	add    $0x10,%esp
c0007e24:	83 ec 0c             	sub    $0xc,%esp
c0007e27:	68 1d b6 00 c0       	push   $0xc000b61d
c0007e2c:	e8 fa 14 00 00       	call   c000932b <Printf>
c0007e31:	83 c4 10             	add    $0x10,%esp
c0007e34:	83 ec 0c             	sub    $0xc,%esp
c0007e37:	68 30 b6 00 c0       	push   $0xc000b630
c0007e3c:	e8 ea 14 00 00       	call   c000932b <Printf>
c0007e41:	83 c4 10             	add    $0x10,%esp
c0007e44:	90                   	nop
c0007e45:	c9                   	leave  
c0007e46:	c3                   	ret    

c0007e47 <atoi>:
c0007e47:	55                   	push   %ebp
c0007e48:	89 e5                	mov    %esp,%ebp
c0007e4a:	83 ec 10             	sub    $0x10,%esp
c0007e4d:	8b 45 08             	mov    0x8(%ebp),%eax
c0007e50:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0007e53:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007e56:	8d 50 01             	lea    0x1(%eax),%edx
c0007e59:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0007e5c:	c6 00 30             	movb   $0x30,(%eax)
c0007e5f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007e62:	8d 50 01             	lea    0x1(%eax),%edx
c0007e65:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0007e68:	c6 00 78             	movb   $0x78,(%eax)
c0007e6b:	c6 45 fa 00          	movb   $0x0,-0x6(%ebp)
c0007e6f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0007e73:	75 0e                	jne    c0007e83 <atoi+0x3c>
c0007e75:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007e78:	8d 50 01             	lea    0x1(%eax),%edx
c0007e7b:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0007e7e:	c6 00 30             	movb   $0x30,(%eax)
c0007e81:	eb 61                	jmp    c0007ee4 <atoi+0x9d>
c0007e83:	c7 45 f4 1c 00 00 00 	movl   $0x1c,-0xc(%ebp)
c0007e8a:	eb 52                	jmp    c0007ede <atoi+0x97>
c0007e8c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007e8f:	8b 55 0c             	mov    0xc(%ebp),%edx
c0007e92:	89 c1                	mov    %eax,%ecx
c0007e94:	d3 fa                	sar    %cl,%edx
c0007e96:	89 d0                	mov    %edx,%eax
c0007e98:	83 e0 0f             	and    $0xf,%eax
c0007e9b:	88 45 fb             	mov    %al,-0x5(%ebp)
c0007e9e:	80 7d fa 00          	cmpb   $0x0,-0x6(%ebp)
c0007ea2:	75 06                	jne    c0007eaa <atoi+0x63>
c0007ea4:	80 7d fb 00          	cmpb   $0x0,-0x5(%ebp)
c0007ea8:	74 2f                	je     c0007ed9 <atoi+0x92>
c0007eaa:	c6 45 fa 01          	movb   $0x1,-0x6(%ebp)
c0007eae:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0007eb2:	83 c0 30             	add    $0x30,%eax
c0007eb5:	88 45 fb             	mov    %al,-0x5(%ebp)
c0007eb8:	80 7d fb 39          	cmpb   $0x39,-0x5(%ebp)
c0007ebc:	7e 0a                	jle    c0007ec8 <atoi+0x81>
c0007ebe:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0007ec2:	83 c0 07             	add    $0x7,%eax
c0007ec5:	88 45 fb             	mov    %al,-0x5(%ebp)
c0007ec8:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007ecb:	8d 50 01             	lea    0x1(%eax),%edx
c0007ece:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0007ed1:	0f b6 55 fb          	movzbl -0x5(%ebp),%edx
c0007ed5:	88 10                	mov    %dl,(%eax)
c0007ed7:	eb 01                	jmp    c0007eda <atoi+0x93>
c0007ed9:	90                   	nop
c0007eda:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c0007ede:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0007ee2:	79 a8                	jns    c0007e8c <atoi+0x45>
c0007ee4:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007ee7:	c6 00 00             	movb   $0x0,(%eax)
c0007eea:	90                   	nop
c0007eeb:	c9                   	leave  
c0007eec:	c3                   	ret    

c0007eed <disp_int>:
c0007eed:	55                   	push   %ebp
c0007eee:	89 e5                	mov    %esp,%ebp
c0007ef0:	83 ec 18             	sub    $0x18,%esp
c0007ef3:	ff 75 08             	pushl  0x8(%ebp)
c0007ef6:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0007ef9:	50                   	push   %eax
c0007efa:	e8 48 ff ff ff       	call   c0007e47 <atoi>
c0007eff:	83 c4 08             	add    $0x8,%esp
c0007f02:	83 ec 08             	sub    $0x8,%esp
c0007f05:	6a 0b                	push   $0xb
c0007f07:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0007f0a:	50                   	push   %eax
c0007f0b:	e8 b7 91 ff ff       	call   c00010c7 <disp_str_colour>
c0007f10:	83 c4 10             	add    $0x10,%esp
c0007f13:	90                   	nop
c0007f14:	c9                   	leave  
c0007f15:	c3                   	ret    

c0007f16 <do_page_fault>:
c0007f16:	55                   	push   %ebp
c0007f17:	89 e5                	mov    %esp,%ebp
c0007f19:	83 ec 28             	sub    $0x28,%esp
c0007f1c:	0f 20 d0             	mov    %cr2,%eax
c0007f1f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007f22:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c0007f29:	00 00 00 
c0007f2c:	83 ec 0c             	sub    $0xc,%esp
c0007f2f:	68 3b b6 00 c0       	push   $0xc000b63b
c0007f34:	e8 53 91 ff ff       	call   c000108c <disp_str>
c0007f39:	83 c4 10             	add    $0x10,%esp
c0007f3c:	83 ec 0c             	sub    $0xc,%esp
c0007f3f:	68 4a b6 00 c0       	push   $0xc000b64a
c0007f44:	e8 43 91 ff ff       	call   c000108c <disp_str>
c0007f49:	83 c4 10             	add    $0x10,%esp
c0007f4c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007f4f:	83 ec 0c             	sub    $0xc,%esp
c0007f52:	50                   	push   %eax
c0007f53:	e8 95 ff ff ff       	call   c0007eed <disp_int>
c0007f58:	83 c4 10             	add    $0x10,%esp
c0007f5b:	83 ec 0c             	sub    $0xc,%esp
c0007f5e:	68 4f b6 00 c0       	push   $0xc000b64f
c0007f63:	e8 24 91 ff ff       	call   c000108c <disp_str>
c0007f68:	83 c4 10             	add    $0x10,%esp
c0007f6b:	83 ec 0c             	sub    $0xc,%esp
c0007f6e:	ff 75 f4             	pushl  -0xc(%ebp)
c0007f71:	e8 c6 ec ff ff       	call   c0006c3c <ptr_pde>
c0007f76:	83 c4 10             	add    $0x10,%esp
c0007f79:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0007f7c:	83 ec 0c             	sub    $0xc,%esp
c0007f7f:	ff 75 f4             	pushl  -0xc(%ebp)
c0007f82:	e8 c8 ec ff ff       	call   c0006c4f <ptr_pte>
c0007f87:	83 c4 10             	add    $0x10,%esp
c0007f8a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007f8d:	83 ec 0c             	sub    $0xc,%esp
c0007f90:	68 51 b6 00 c0       	push   $0xc000b651
c0007f95:	e8 f2 90 ff ff       	call   c000108c <disp_str>
c0007f9a:	83 c4 10             	add    $0x10,%esp
c0007f9d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007fa0:	83 ec 0c             	sub    $0xc,%esp
c0007fa3:	50                   	push   %eax
c0007fa4:	e8 44 ff ff ff       	call   c0007eed <disp_int>
c0007fa9:	83 c4 10             	add    $0x10,%esp
c0007fac:	83 ec 0c             	sub    $0xc,%esp
c0007faf:	68 56 b6 00 c0       	push   $0xc000b656
c0007fb4:	e8 d3 90 ff ff       	call   c000108c <disp_str>
c0007fb9:	83 c4 10             	add    $0x10,%esp
c0007fbc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007fbf:	8b 00                	mov    (%eax),%eax
c0007fc1:	83 ec 0c             	sub    $0xc,%esp
c0007fc4:	50                   	push   %eax
c0007fc5:	e8 23 ff ff ff       	call   c0007eed <disp_int>
c0007fca:	83 c4 10             	add    $0x10,%esp
c0007fcd:	83 ec 0c             	sub    $0xc,%esp
c0007fd0:	68 4f b6 00 c0       	push   $0xc000b64f
c0007fd5:	e8 b2 90 ff ff       	call   c000108c <disp_str>
c0007fda:	83 c4 10             	add    $0x10,%esp
c0007fdd:	83 ec 0c             	sub    $0xc,%esp
c0007fe0:	68 5f b6 00 c0       	push   $0xc000b65f
c0007fe5:	e8 a2 90 ff ff       	call   c000108c <disp_str>
c0007fea:	83 c4 10             	add    $0x10,%esp
c0007fed:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007ff0:	83 ec 0c             	sub    $0xc,%esp
c0007ff3:	50                   	push   %eax
c0007ff4:	e8 f4 fe ff ff       	call   c0007eed <disp_int>
c0007ff9:	83 c4 10             	add    $0x10,%esp
c0007ffc:	83 ec 0c             	sub    $0xc,%esp
c0007fff:	68 64 b6 00 c0       	push   $0xc000b664
c0008004:	e8 83 90 ff ff       	call   c000108c <disp_str>
c0008009:	83 c4 10             	add    $0x10,%esp
c000800c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000800f:	8b 00                	mov    (%eax),%eax
c0008011:	83 ec 0c             	sub    $0xc,%esp
c0008014:	50                   	push   %eax
c0008015:	e8 d3 fe ff ff       	call   c0007eed <disp_int>
c000801a:	83 c4 10             	add    $0x10,%esp
c000801d:	83 ec 0c             	sub    $0xc,%esp
c0008020:	68 4f b6 00 c0       	push   $0xc000b64f
c0008025:	e8 62 90 ff ff       	call   c000108c <disp_str>
c000802a:	83 c4 10             	add    $0x10,%esp
c000802d:	c7 45 e8 00 00 10 00 	movl   $0x100000,-0x18(%ebp)
c0008034:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008037:	8b 00                	mov    (%eax),%eax
c0008039:	83 e0 01             	and    $0x1,%eax
c000803c:	85 c0                	test   %eax,%eax
c000803e:	74 09                	je     c0008049 <do_page_fault+0x133>
c0008040:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
c0008047:	eb 07                	jmp    c0008050 <do_page_fault+0x13a>
c0008049:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0008050:	90                   	nop
c0008051:	c9                   	leave  
c0008052:	c3                   	ret    

c0008053 <exception_handler>:
c0008053:	55                   	push   %ebp
c0008054:	89 e5                	mov    %esp,%ebp
c0008056:	57                   	push   %edi
c0008057:	56                   	push   %esi
c0008058:	53                   	push   %ebx
c0008059:	83 ec 6c             	sub    $0x6c,%esp
c000805c:	8d 45 8c             	lea    -0x74(%ebp),%eax
c000805f:	bb e0 b8 00 c0       	mov    $0xc000b8e0,%ebx
c0008064:	ba 13 00 00 00       	mov    $0x13,%edx
c0008069:	89 c7                	mov    %eax,%edi
c000806b:	89 de                	mov    %ebx,%esi
c000806d:	89 d1                	mov    %edx,%ecx
c000806f:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0008071:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0008078:	eb 04                	jmp    c000807e <exception_handler+0x2b>
c000807a:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c000807e:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c0008085:	7e f3                	jle    c000807a <exception_handler+0x27>
c0008087:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c000808e:	00 00 00 
c0008091:	83 ec 0c             	sub    $0xc,%esp
c0008094:	68 6d b6 00 c0       	push   $0xc000b66d
c0008099:	e8 ee 8f ff ff       	call   c000108c <disp_str>
c000809e:	83 c4 10             	add    $0x10,%esp
c00080a1:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c00080a8:	8b 45 08             	mov    0x8(%ebp),%eax
c00080ab:	8b 44 85 8c          	mov    -0x74(%ebp,%eax,4),%eax
c00080af:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00080b2:	83 ec 0c             	sub    $0xc,%esp
c00080b5:	ff 75 dc             	pushl  -0x24(%ebp)
c00080b8:	e8 cf 8f ff ff       	call   c000108c <disp_str>
c00080bd:	83 c4 10             	add    $0x10,%esp
c00080c0:	83 ec 0c             	sub    $0xc,%esp
c00080c3:	68 7b b6 00 c0       	push   $0xc000b67b
c00080c8:	e8 bf 8f ff ff       	call   c000108c <disp_str>
c00080cd:	83 c4 10             	add    $0x10,%esp
c00080d0:	83 ec 0c             	sub    $0xc,%esp
c00080d3:	68 7e b6 00 c0       	push   $0xc000b67e
c00080d8:	e8 af 8f ff ff       	call   c000108c <disp_str>
c00080dd:	83 c4 10             	add    $0x10,%esp
c00080e0:	8b 45 08             	mov    0x8(%ebp),%eax
c00080e3:	83 ec 0c             	sub    $0xc,%esp
c00080e6:	50                   	push   %eax
c00080e7:	e8 01 fe ff ff       	call   c0007eed <disp_int>
c00080ec:	83 c4 10             	add    $0x10,%esp
c00080ef:	83 ec 0c             	sub    $0xc,%esp
c00080f2:	68 7b b6 00 c0       	push   $0xc000b67b
c00080f7:	e8 90 8f ff ff       	call   c000108c <disp_str>
c00080fc:	83 c4 10             	add    $0x10,%esp
c00080ff:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c0008103:	74 2f                	je     c0008134 <exception_handler+0xe1>
c0008105:	83 ec 0c             	sub    $0xc,%esp
c0008108:	68 86 b6 00 c0       	push   $0xc000b686
c000810d:	e8 7a 8f ff ff       	call   c000108c <disp_str>
c0008112:	83 c4 10             	add    $0x10,%esp
c0008115:	8b 45 0c             	mov    0xc(%ebp),%eax
c0008118:	83 ec 0c             	sub    $0xc,%esp
c000811b:	50                   	push   %eax
c000811c:	e8 cc fd ff ff       	call   c0007eed <disp_int>
c0008121:	83 c4 10             	add    $0x10,%esp
c0008124:	83 ec 0c             	sub    $0xc,%esp
c0008127:	68 7b b6 00 c0       	push   $0xc000b67b
c000812c:	e8 5b 8f ff ff       	call   c000108c <disp_str>
c0008131:	83 c4 10             	add    $0x10,%esp
c0008134:	83 ec 0c             	sub    $0xc,%esp
c0008137:	68 90 b6 00 c0       	push   $0xc000b690
c000813c:	e8 4b 8f ff ff       	call   c000108c <disp_str>
c0008141:	83 c4 10             	add    $0x10,%esp
c0008144:	83 ec 0c             	sub    $0xc,%esp
c0008147:	ff 75 14             	pushl  0x14(%ebp)
c000814a:	e8 9e fd ff ff       	call   c0007eed <disp_int>
c000814f:	83 c4 10             	add    $0x10,%esp
c0008152:	83 ec 0c             	sub    $0xc,%esp
c0008155:	68 7b b6 00 c0       	push   $0xc000b67b
c000815a:	e8 2d 8f ff ff       	call   c000108c <disp_str>
c000815f:	83 c4 10             	add    $0x10,%esp
c0008162:	83 ec 0c             	sub    $0xc,%esp
c0008165:	68 94 b6 00 c0       	push   $0xc000b694
c000816a:	e8 1d 8f ff ff       	call   c000108c <disp_str>
c000816f:	83 c4 10             	add    $0x10,%esp
c0008172:	8b 45 10             	mov    0x10(%ebp),%eax
c0008175:	83 ec 0c             	sub    $0xc,%esp
c0008178:	50                   	push   %eax
c0008179:	e8 6f fd ff ff       	call   c0007eed <disp_int>
c000817e:	83 c4 10             	add    $0x10,%esp
c0008181:	83 ec 0c             	sub    $0xc,%esp
c0008184:	68 7b b6 00 c0       	push   $0xc000b67b
c0008189:	e8 fe 8e ff ff       	call   c000108c <disp_str>
c000818e:	83 c4 10             	add    $0x10,%esp
c0008191:	83 ec 0c             	sub    $0xc,%esp
c0008194:	68 99 b6 00 c0       	push   $0xc000b699
c0008199:	e8 ee 8e ff ff       	call   c000108c <disp_str>
c000819e:	83 c4 10             	add    $0x10,%esp
c00081a1:	83 ec 0c             	sub    $0xc,%esp
c00081a4:	ff 75 18             	pushl  0x18(%ebp)
c00081a7:	e8 41 fd ff ff       	call   c0007eed <disp_int>
c00081ac:	83 c4 10             	add    $0x10,%esp
c00081af:	83 ec 0c             	sub    $0xc,%esp
c00081b2:	68 7b b6 00 c0       	push   $0xc000b67b
c00081b7:	e8 d0 8e ff ff       	call   c000108c <disp_str>
c00081bc:	83 c4 10             	add    $0x10,%esp
c00081bf:	83 ec 0c             	sub    $0xc,%esp
c00081c2:	68 a4 b6 00 c0       	push   $0xc000b6a4
c00081c7:	e8 c0 8e ff ff       	call   c000108c <disp_str>
c00081cc:	83 c4 10             	add    $0x10,%esp
c00081cf:	83 7d 08 0e          	cmpl   $0xe,0x8(%ebp)
c00081d3:	75 45                	jne    c000821a <exception_handler+0x1c7>
c00081d5:	0f 20 d0             	mov    %cr2,%eax
c00081d8:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00081db:	83 ec 0c             	sub    $0xc,%esp
c00081de:	68 c3 b6 00 c0       	push   $0xc000b6c3
c00081e3:	e8 a4 8e ff ff       	call   c000108c <disp_str>
c00081e8:	83 c4 10             	add    $0x10,%esp
c00081eb:	83 ec 0c             	sub    $0xc,%esp
c00081ee:	68 4a b6 00 c0       	push   $0xc000b64a
c00081f3:	e8 94 8e ff ff       	call   c000108c <disp_str>
c00081f8:	83 c4 10             	add    $0x10,%esp
c00081fb:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00081fe:	83 ec 0c             	sub    $0xc,%esp
c0008201:	50                   	push   %eax
c0008202:	e8 e6 fc ff ff       	call   c0007eed <disp_int>
c0008207:	83 c4 10             	add    $0x10,%esp
c000820a:	83 ec 0c             	sub    $0xc,%esp
c000820d:	68 4f b6 00 c0       	push   $0xc000b64f
c0008212:	e8 75 8e ff ff       	call   c000108c <disp_str>
c0008217:	83 c4 10             	add    $0x10,%esp
c000821a:	83 7d 08 0d          	cmpl   $0xd,0x8(%ebp)
c000821e:	75 11                	jne    c0008231 <exception_handler+0x1de>
c0008220:	83 ec 0c             	sub    $0xc,%esp
c0008223:	68 cf b6 00 c0       	push   $0xc000b6cf
c0008228:	e8 5f 8e ff ff       	call   c000108c <disp_str>
c000822d:	83 c4 10             	add    $0x10,%esp
c0008230:	90                   	nop
c0008231:	90                   	nop
c0008232:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0008235:	5b                   	pop    %ebx
c0008236:	5e                   	pop    %esi
c0008237:	5f                   	pop    %edi
c0008238:	5d                   	pop    %ebp
c0008239:	c3                   	ret    

c000823a <init_internal_interrupt>:
c000823a:	55                   	push   %ebp
c000823b:	89 e5                	mov    %esp,%ebp
c000823d:	83 ec 08             	sub    $0x8,%esp
c0008240:	6a 0e                	push   $0xe
c0008242:	6a 08                	push   $0x8
c0008244:	68 03 11 00 c0       	push   $0xc0001103
c0008249:	6a 00                	push   $0x0
c000824b:	e8 ae c7 ff ff       	call   c00049fe <InitInterruptDesc>
c0008250:	83 c4 10             	add    $0x10,%esp
c0008253:	6a 0e                	push   $0xe
c0008255:	6a 08                	push   $0x8
c0008257:	68 09 11 00 c0       	push   $0xc0001109
c000825c:	6a 01                	push   $0x1
c000825e:	e8 9b c7 ff ff       	call   c00049fe <InitInterruptDesc>
c0008263:	83 c4 10             	add    $0x10,%esp
c0008266:	6a 0e                	push   $0xe
c0008268:	6a 08                	push   $0x8
c000826a:	68 0f 11 00 c0       	push   $0xc000110f
c000826f:	6a 02                	push   $0x2
c0008271:	e8 88 c7 ff ff       	call   c00049fe <InitInterruptDesc>
c0008276:	83 c4 10             	add    $0x10,%esp
c0008279:	6a 0e                	push   $0xe
c000827b:	6a 08                	push   $0x8
c000827d:	68 15 11 00 c0       	push   $0xc0001115
c0008282:	6a 03                	push   $0x3
c0008284:	e8 75 c7 ff ff       	call   c00049fe <InitInterruptDesc>
c0008289:	83 c4 10             	add    $0x10,%esp
c000828c:	6a 0e                	push   $0xe
c000828e:	6a 08                	push   $0x8
c0008290:	68 1b 11 00 c0       	push   $0xc000111b
c0008295:	6a 04                	push   $0x4
c0008297:	e8 62 c7 ff ff       	call   c00049fe <InitInterruptDesc>
c000829c:	83 c4 10             	add    $0x10,%esp
c000829f:	6a 0e                	push   $0xe
c00082a1:	6a 08                	push   $0x8
c00082a3:	68 21 11 00 c0       	push   $0xc0001121
c00082a8:	6a 05                	push   $0x5
c00082aa:	e8 4f c7 ff ff       	call   c00049fe <InitInterruptDesc>
c00082af:	83 c4 10             	add    $0x10,%esp
c00082b2:	6a 0e                	push   $0xe
c00082b4:	6a 08                	push   $0x8
c00082b6:	68 27 11 00 c0       	push   $0xc0001127
c00082bb:	6a 06                	push   $0x6
c00082bd:	e8 3c c7 ff ff       	call   c00049fe <InitInterruptDesc>
c00082c2:	83 c4 10             	add    $0x10,%esp
c00082c5:	6a 0e                	push   $0xe
c00082c7:	6a 08                	push   $0x8
c00082c9:	68 2d 11 00 c0       	push   $0xc000112d
c00082ce:	6a 07                	push   $0x7
c00082d0:	e8 29 c7 ff ff       	call   c00049fe <InitInterruptDesc>
c00082d5:	83 c4 10             	add    $0x10,%esp
c00082d8:	6a 0e                	push   $0xe
c00082da:	6a 08                	push   $0x8
c00082dc:	68 33 11 00 c0       	push   $0xc0001133
c00082e1:	6a 08                	push   $0x8
c00082e3:	e8 16 c7 ff ff       	call   c00049fe <InitInterruptDesc>
c00082e8:	83 c4 10             	add    $0x10,%esp
c00082eb:	6a 0e                	push   $0xe
c00082ed:	6a 08                	push   $0x8
c00082ef:	68 37 11 00 c0       	push   $0xc0001137
c00082f4:	6a 09                	push   $0x9
c00082f6:	e8 03 c7 ff ff       	call   c00049fe <InitInterruptDesc>
c00082fb:	83 c4 10             	add    $0x10,%esp
c00082fe:	6a 0e                	push   $0xe
c0008300:	6a 08                	push   $0x8
c0008302:	68 3d 11 00 c0       	push   $0xc000113d
c0008307:	6a 0a                	push   $0xa
c0008309:	e8 f0 c6 ff ff       	call   c00049fe <InitInterruptDesc>
c000830e:	83 c4 10             	add    $0x10,%esp
c0008311:	6a 0e                	push   $0xe
c0008313:	6a 08                	push   $0x8
c0008315:	68 41 11 00 c0       	push   $0xc0001141
c000831a:	6a 0b                	push   $0xb
c000831c:	e8 dd c6 ff ff       	call   c00049fe <InitInterruptDesc>
c0008321:	83 c4 10             	add    $0x10,%esp
c0008324:	6a 0e                	push   $0xe
c0008326:	6a 08                	push   $0x8
c0008328:	68 45 11 00 c0       	push   $0xc0001145
c000832d:	6a 0c                	push   $0xc
c000832f:	e8 ca c6 ff ff       	call   c00049fe <InitInterruptDesc>
c0008334:	83 c4 10             	add    $0x10,%esp
c0008337:	6a 0e                	push   $0xe
c0008339:	6a 08                	push   $0x8
c000833b:	68 49 11 00 c0       	push   $0xc0001149
c0008340:	6a 0d                	push   $0xd
c0008342:	e8 b7 c6 ff ff       	call   c00049fe <InitInterruptDesc>
c0008347:	83 c4 10             	add    $0x10,%esp
c000834a:	6a 0e                	push   $0xe
c000834c:	6a 08                	push   $0x8
c000834e:	68 54 11 00 c0       	push   $0xc0001154
c0008353:	6a 0e                	push   $0xe
c0008355:	e8 a4 c6 ff ff       	call   c00049fe <InitInterruptDesc>
c000835a:	83 c4 10             	add    $0x10,%esp
c000835d:	6a 0e                	push   $0xe
c000835f:	6a 08                	push   $0x8
c0008361:	68 58 11 00 c0       	push   $0xc0001158
c0008366:	6a 10                	push   $0x10
c0008368:	e8 91 c6 ff ff       	call   c00049fe <InitInterruptDesc>
c000836d:	83 c4 10             	add    $0x10,%esp
c0008370:	6a 0e                	push   $0xe
c0008372:	6a 08                	push   $0x8
c0008374:	68 5e 11 00 c0       	push   $0xc000115e
c0008379:	6a 11                	push   $0x11
c000837b:	e8 7e c6 ff ff       	call   c00049fe <InitInterruptDesc>
c0008380:	83 c4 10             	add    $0x10,%esp
c0008383:	6a 0e                	push   $0xe
c0008385:	6a 08                	push   $0x8
c0008387:	68 62 11 00 c0       	push   $0xc0001162
c000838c:	6a 12                	push   $0x12
c000838e:	e8 6b c6 ff ff       	call   c00049fe <InitInterruptDesc>
c0008393:	83 c4 10             	add    $0x10,%esp
c0008396:	6a 0e                	push   $0xe
c0008398:	6a 0e                	push   $0xe
c000839a:	68 1e 12 00 c0       	push   $0xc000121e
c000839f:	68 90 00 00 00       	push   $0x90
c00083a4:	e8 55 c6 ff ff       	call   c00049fe <InitInterruptDesc>
c00083a9:	83 c4 10             	add    $0x10,%esp
c00083ac:	90                   	nop
c00083ad:	c9                   	leave  
c00083ae:	c3                   	ret    

c00083af <spurious_irq>:
c00083af:	55                   	push   %ebp
c00083b0:	89 e5                	mov    %esp,%ebp
c00083b2:	83 ec 08             	sub    $0x8,%esp
c00083b5:	83 ec 08             	sub    $0x8,%esp
c00083b8:	6a 0b                	push   $0xb
c00083ba:	68 2c b9 00 c0       	push   $0xc000b92c
c00083bf:	e8 03 8d ff ff       	call   c00010c7 <disp_str_colour>
c00083c4:	83 c4 10             	add    $0x10,%esp
c00083c7:	83 ec 0c             	sub    $0xc,%esp
c00083ca:	ff 75 08             	pushl  0x8(%ebp)
c00083cd:	e8 1b fb ff ff       	call   c0007eed <disp_int>
c00083d2:	83 c4 10             	add    $0x10,%esp
c00083d5:	a1 e8 1e 01 c0       	mov    0xc0011ee8,%eax
c00083da:	8b 15 ec 1e 01 c0    	mov    0xc0011eec,%edx
c00083e0:	83 c0 01             	add    $0x1,%eax
c00083e3:	83 d2 00             	adc    $0x0,%edx
c00083e6:	a3 e8 1e 01 c0       	mov    %eax,0xc0011ee8
c00083eb:	89 15 ec 1e 01 c0    	mov    %edx,0xc0011eec
c00083f1:	83 ec 0c             	sub    $0xc,%esp
c00083f4:	68 53 b9 00 c0       	push   $0xc000b953
c00083f9:	e8 8e 8c ff ff       	call   c000108c <disp_str>
c00083fe:	83 c4 10             	add    $0x10,%esp
c0008401:	a1 e8 1e 01 c0       	mov    0xc0011ee8,%eax
c0008406:	8b 15 ec 1e 01 c0    	mov    0xc0011eec,%edx
c000840c:	83 ec 0c             	sub    $0xc,%esp
c000840f:	50                   	push   %eax
c0008410:	e8 d8 fa ff ff       	call   c0007eed <disp_int>
c0008415:	83 c4 10             	add    $0x10,%esp
c0008418:	83 ec 0c             	sub    $0xc,%esp
c000841b:	68 55 b9 00 c0       	push   $0xc000b955
c0008420:	e8 67 8c ff ff       	call   c000108c <disp_str>
c0008425:	83 c4 10             	add    $0x10,%esp
c0008428:	83 ec 08             	sub    $0x8,%esp
c000842b:	6a 0c                	push   $0xc
c000842d:	68 58 b9 00 c0       	push   $0xc000b958
c0008432:	e8 90 8c ff ff       	call   c00010c7 <disp_str_colour>
c0008437:	83 c4 10             	add    $0x10,%esp
c000843a:	90                   	nop
c000843b:	c9                   	leave  
c000843c:	c3                   	ret    

c000843d <init_keyboard>:
c000843d:	55                   	push   %ebp
c000843e:	89 e5                	mov    %esp,%ebp
c0008440:	83 ec 18             	sub    $0x18,%esp
c0008443:	83 ec 04             	sub    $0x4,%esp
c0008446:	68 00 02 00 00       	push   $0x200
c000844b:	6a 00                	push   $0x0
c000844d:	68 ec 0b 01 c0       	push   $0xc0010bec
c0008452:	e8 e8 39 00 00       	call   c000be3f <Memset>
c0008457:	83 c4 10             	add    $0x10,%esp
c000845a:	c7 05 e0 0b 01 c0 ec 	movl   $0xc0010bec,0xc0010be0
c0008461:	0b 01 c0 
c0008464:	a1 e0 0b 01 c0       	mov    0xc0010be0,%eax
c0008469:	a3 e4 0b 01 c0       	mov    %eax,0xc0010be4
c000846e:	c7 05 e8 0b 01 c0 00 	movl   $0x0,0xc0010be8
c0008475:	00 00 00 
c0008478:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c000847f:	00 00 00 
c0008482:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008489:	eb 04                	jmp    c000848f <init_keyboard+0x52>
c000848b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000848f:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c0008496:	7e f3                	jle    c000848b <init_keyboard+0x4e>
c0008498:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c000849f:	00 00 00 
c00084a2:	e8 71 d3 ff ff       	call   c0005818 <init_keyboard_handler>
c00084a7:	90                   	nop
c00084a8:	c9                   	leave  
c00084a9:	c3                   	ret    

c00084aa <u_thread_a>:
c00084aa:	55                   	push   %ebp
c00084ab:	89 e5                	mov    %esp,%ebp
c00084ad:	83 ec 08             	sub    $0x8,%esp
c00084b0:	83 ec 0c             	sub    $0xc,%esp
c00084b3:	68 7d b9 00 c0       	push   $0xc000b97d
c00084b8:	e8 cf 8b ff ff       	call   c000108c <disp_str>
c00084bd:	83 c4 10             	add    $0x10,%esp
c00084c0:	eb fe                	jmp    c00084c0 <u_thread_a+0x16>

c00084c2 <TestTTY>:
c00084c2:	55                   	push   %ebp
c00084c3:	89 e5                	mov    %esp,%ebp
c00084c5:	83 ec 28             	sub    $0x28,%esp
c00084c8:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c00084cf:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c00084d6:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c00084dc:	83 ec 08             	sub    $0x8,%esp
c00084df:	6a 02                	push   $0x2
c00084e1:	8d 45 de             	lea    -0x22(%ebp),%eax
c00084e4:	50                   	push   %eax
c00084e5:	e8 d4 d4 ff ff       	call   c00059be <open>
c00084ea:	83 c4 10             	add    $0x10,%esp
c00084ed:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00084f0:	83 ec 08             	sub    $0x8,%esp
c00084f3:	6a 02                	push   $0x2
c00084f5:	8d 45 de             	lea    -0x22(%ebp),%eax
c00084f8:	50                   	push   %eax
c00084f9:	e8 c0 d4 ff ff       	call   c00059be <open>
c00084fe:	83 c4 10             	add    $0x10,%esp
c0008501:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008504:	83 ec 0c             	sub    $0xc,%esp
c0008507:	68 8b b9 00 c0       	push   $0xc000b98b
c000850c:	e8 1a 0e 00 00       	call   c000932b <Printf>
c0008511:	83 c4 10             	add    $0x10,%esp
c0008514:	83 ec 0c             	sub    $0xc,%esp
c0008517:	6a 0a                	push   $0xa
c0008519:	e8 a6 9f ff ff       	call   c00024c4 <sys_malloc>
c000851e:	83 c4 10             	add    $0x10,%esp
c0008521:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008524:	83 ec 04             	sub    $0x4,%esp
c0008527:	6a 0a                	push   $0xa
c0008529:	6a 00                	push   $0x0
c000852b:	ff 75 ec             	pushl  -0x14(%ebp)
c000852e:	e8 0c 39 00 00       	call   c000be3f <Memset>
c0008533:	83 c4 10             	add    $0x10,%esp
c0008536:	83 ec 04             	sub    $0x4,%esp
c0008539:	6a 0a                	push   $0xa
c000853b:	ff 75 ec             	pushl  -0x14(%ebp)
c000853e:	ff 75 f0             	pushl  -0x10(%ebp)
c0008541:	e8 0d d5 ff ff       	call   c0005a53 <read>
c0008546:	83 c4 10             	add    $0x10,%esp
c0008549:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000854c:	83 ec 08             	sub    $0x8,%esp
c000854f:	ff 75 ec             	pushl  -0x14(%ebp)
c0008552:	68 9d b9 00 c0       	push   $0xc000b99d
c0008557:	e8 cf 0d 00 00       	call   c000932b <Printf>
c000855c:	83 c4 10             	add    $0x10,%esp
c000855f:	eb c3                	jmp    c0008524 <TestTTY+0x62>

c0008561 <TestFS>:
c0008561:	55                   	push   %ebp
c0008562:	89 e5                	mov    %esp,%ebp
c0008564:	81 ec 28 01 00 00    	sub    $0x128,%esp
c000856a:	83 ec 0c             	sub    $0xc,%esp
c000856d:	68 a7 b9 00 c0       	push   $0xc000b9a7
c0008572:	e8 15 8b ff ff       	call   c000108c <disp_str>
c0008577:	83 c4 10             	add    $0x10,%esp
c000857a:	c7 45 be 64 65 76 5f 	movl   $0x5f766564,-0x42(%ebp)
c0008581:	c7 45 c2 74 74 79 31 	movl   $0x31797474,-0x3e(%ebp)
c0008588:	66 c7 45 c6 00 00    	movw   $0x0,-0x3a(%ebp)
c000858e:	66 87 db             	xchg   %bx,%bx
c0008591:	83 ec 08             	sub    $0x8,%esp
c0008594:	6a 02                	push   $0x2
c0008596:	8d 45 be             	lea    -0x42(%ebp),%eax
c0008599:	50                   	push   %eax
c000859a:	e8 1f d4 ff ff       	call   c00059be <open>
c000859f:	83 c4 10             	add    $0x10,%esp
c00085a2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00085a5:	66 87 db             	xchg   %bx,%bx
c00085a8:	83 ec 08             	sub    $0x8,%esp
c00085ab:	6a 02                	push   $0x2
c00085ad:	8d 45 be             	lea    -0x42(%ebp),%eax
c00085b0:	50                   	push   %eax
c00085b1:	e8 08 d4 ff ff       	call   c00059be <open>
c00085b6:	83 c4 10             	add    $0x10,%esp
c00085b9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00085bc:	66 87 db             	xchg   %bx,%bx
c00085bf:	83 ec 0c             	sub    $0xc,%esp
c00085c2:	68 8b b9 00 c0       	push   $0xc000b98b
c00085c7:	e8 5f 0d 00 00       	call   c000932b <Printf>
c00085cc:	83 c4 10             	add    $0x10,%esp
c00085cf:	66 87 db             	xchg   %bx,%bx
c00085d2:	c7 45 b9 41 43 00 00 	movl   $0x4341,-0x47(%ebp)
c00085d9:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
c00085dd:	c7 45 b4 63 41 42 00 	movl   $0x424163,-0x4c(%ebp)
c00085e4:	c6 45 b8 00          	movb   $0x0,-0x48(%ebp)
c00085e8:	c7 45 aa 49 4e 54 45 	movl   $0x45544e49,-0x56(%ebp)
c00085ef:	c7 45 ae 52 52 55 50 	movl   $0x50555252,-0x52(%ebp)
c00085f6:	66 c7 45 b2 54 00    	movw   $0x54,-0x4e(%ebp)
c00085fc:	66 87 db             	xchg   %bx,%bx
c00085ff:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c0008606:	66 87 db             	xchg   %bx,%bx
c0008609:	83 ec 0c             	sub    $0xc,%esp
c000860c:	68 af b9 00 c0       	push   $0xc000b9af
c0008611:	e8 15 0d 00 00       	call   c000932b <Printf>
c0008616:	83 c4 10             	add    $0x10,%esp
c0008619:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c000861d:	0f 85 43 03 00 00    	jne    c0008966 <TestFS+0x405>
c0008623:	83 ec 08             	sub    $0x8,%esp
c0008626:	6a 07                	push   $0x7
c0008628:	8d 45 b9             	lea    -0x47(%ebp),%eax
c000862b:	50                   	push   %eax
c000862c:	e8 8d d3 ff ff       	call   c00059be <open>
c0008631:	83 c4 10             	add    $0x10,%esp
c0008634:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0008637:	83 ec 08             	sub    $0x8,%esp
c000863a:	ff 75 e4             	pushl  -0x1c(%ebp)
c000863d:	68 c7 b9 00 c0       	push   $0xc000b9c7
c0008642:	e8 e4 0c 00 00       	call   c000932b <Printf>
c0008647:	83 c4 10             	add    $0x10,%esp
c000864a:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0008651:	c7 45 96 63 67 3a 68 	movl   $0x683a6763,-0x6a(%ebp)
c0008658:	c7 45 9a 65 6c 6c 6f 	movl   $0x6f6c6c65,-0x66(%ebp)
c000865f:	c7 45 9e 2c 77 6f 72 	movl   $0x726f772c,-0x62(%ebp)
c0008666:	c7 45 a2 6c 64 21 00 	movl   $0x21646c,-0x5e(%ebp)
c000866d:	c7 45 a6 00 00 00 00 	movl   $0x0,-0x5a(%ebp)
c0008674:	83 ec 0c             	sub    $0xc,%esp
c0008677:	8d 45 96             	lea    -0x6a(%ebp),%eax
c000867a:	50                   	push   %eax
c000867b:	e8 f8 37 00 00       	call   c000be78 <Strlen>
c0008680:	83 c4 10             	add    $0x10,%esp
c0008683:	83 ec 04             	sub    $0x4,%esp
c0008686:	50                   	push   %eax
c0008687:	8d 45 96             	lea    -0x6a(%ebp),%eax
c000868a:	50                   	push   %eax
c000868b:	ff 75 e4             	pushl  -0x1c(%ebp)
c000868e:	e8 41 d5 ff ff       	call   c0005bd4 <write>
c0008693:	83 c4 10             	add    $0x10,%esp
c0008696:	83 ec 04             	sub    $0x4,%esp
c0008699:	6a 14                	push   $0x14
c000869b:	6a 00                	push   $0x0
c000869d:	8d 45 82             	lea    -0x7e(%ebp),%eax
c00086a0:	50                   	push   %eax
c00086a1:	e8 99 37 00 00       	call   c000be3f <Memset>
c00086a6:	83 c4 10             	add    $0x10,%esp
c00086a9:	83 ec 04             	sub    $0x4,%esp
c00086ac:	6a 12                	push   $0x12
c00086ae:	8d 45 82             	lea    -0x7e(%ebp),%eax
c00086b1:	50                   	push   %eax
c00086b2:	ff 75 e4             	pushl  -0x1c(%ebp)
c00086b5:	e8 99 d3 ff ff       	call   c0005a53 <read>
c00086ba:	83 c4 10             	add    $0x10,%esp
c00086bd:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00086c0:	83 ec 08             	sub    $0x8,%esp
c00086c3:	8d 45 82             	lea    -0x7e(%ebp),%eax
c00086c6:	50                   	push   %eax
c00086c7:	68 d0 b9 00 c0       	push   $0xc000b9d0
c00086cc:	e8 5a 0c 00 00       	call   c000932b <Printf>
c00086d1:	83 c4 10             	add    $0x10,%esp
c00086d4:	66 87 db             	xchg   %bx,%bx
c00086d7:	83 ec 0c             	sub    $0xc,%esp
c00086da:	6a 0a                	push   $0xa
c00086dc:	e8 16 0b 00 00       	call   c00091f7 <delay>
c00086e1:	83 c4 10             	add    $0x10,%esp
c00086e4:	83 ec 08             	sub    $0x8,%esp
c00086e7:	6a 07                	push   $0x7
c00086e9:	8d 45 b4             	lea    -0x4c(%ebp),%eax
c00086ec:	50                   	push   %eax
c00086ed:	e8 cc d2 ff ff       	call   c00059be <open>
c00086f2:	83 c4 10             	add    $0x10,%esp
c00086f5:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00086f8:	83 ec 08             	sub    $0x8,%esp
c00086fb:	ff 75 dc             	pushl  -0x24(%ebp)
c00086fe:	68 db b9 00 c0       	push   $0xc000b9db
c0008703:	e8 23 0c 00 00       	call   c000932b <Printf>
c0008708:	83 c4 10             	add    $0x10,%esp
c000870b:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0008712:	c7 85 6e ff ff ff 63 	movl   $0x683a6763,-0x92(%ebp)
c0008719:	67 3a 68 
c000871c:	c7 85 72 ff ff ff 6f 	movl   $0x6120776f,-0x8e(%ebp)
c0008723:	77 20 61 
c0008726:	c7 85 76 ff ff ff 72 	movl   $0x79206572,-0x8a(%ebp)
c000872d:	65 20 79 
c0008730:	c7 85 7a ff ff ff 6f 	movl   $0x3f756f,-0x86(%ebp)
c0008737:	75 3f 00 
c000873a:	c7 85 7e ff ff ff 00 	movl   $0x0,-0x82(%ebp)
c0008741:	00 00 00 
c0008744:	83 ec 0c             	sub    $0xc,%esp
c0008747:	8d 85 6e ff ff ff    	lea    -0x92(%ebp),%eax
c000874d:	50                   	push   %eax
c000874e:	e8 25 37 00 00       	call   c000be78 <Strlen>
c0008753:	83 c4 10             	add    $0x10,%esp
c0008756:	83 ec 04             	sub    $0x4,%esp
c0008759:	50                   	push   %eax
c000875a:	8d 85 6e ff ff ff    	lea    -0x92(%ebp),%eax
c0008760:	50                   	push   %eax
c0008761:	ff 75 dc             	pushl  -0x24(%ebp)
c0008764:	e8 6b d4 ff ff       	call   c0005bd4 <write>
c0008769:	83 c4 10             	add    $0x10,%esp
c000876c:	83 ec 04             	sub    $0x4,%esp
c000876f:	6a 14                	push   $0x14
c0008771:	6a 00                	push   $0x0
c0008773:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c0008779:	50                   	push   %eax
c000877a:	e8 c0 36 00 00       	call   c000be3f <Memset>
c000877f:	83 c4 10             	add    $0x10,%esp
c0008782:	83 ec 04             	sub    $0x4,%esp
c0008785:	6a 12                	push   $0x12
c0008787:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c000878d:	50                   	push   %eax
c000878e:	ff 75 dc             	pushl  -0x24(%ebp)
c0008791:	e8 bd d2 ff ff       	call   c0005a53 <read>
c0008796:	83 c4 10             	add    $0x10,%esp
c0008799:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000879c:	83 ec 08             	sub    $0x8,%esp
c000879f:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c00087a5:	50                   	push   %eax
c00087a6:	68 e5 b9 00 c0       	push   $0xc000b9e5
c00087ab:	e8 7b 0b 00 00       	call   c000932b <Printf>
c00087b0:	83 c4 10             	add    $0x10,%esp
c00087b3:	83 ec 08             	sub    $0x8,%esp
c00087b6:	6a 07                	push   $0x7
c00087b8:	8d 45 aa             	lea    -0x56(%ebp),%eax
c00087bb:	50                   	push   %eax
c00087bc:	e8 fd d1 ff ff       	call   c00059be <open>
c00087c1:	83 c4 10             	add    $0x10,%esp
c00087c4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00087c7:	83 ec 08             	sub    $0x8,%esp
c00087ca:	ff 75 dc             	pushl  -0x24(%ebp)
c00087cd:	68 db b9 00 c0       	push   $0xc000b9db
c00087d2:	e8 54 0b 00 00       	call   c000932b <Printf>
c00087d7:	83 c4 10             	add    $0x10,%esp
c00087da:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00087e1:	c7 85 3c ff ff ff 49 	movl   $0x69772049,-0xc4(%ebp)
c00087e8:	20 77 69 
c00087eb:	c7 85 40 ff ff ff 6c 	movl   $0x73206c6c,-0xc0(%ebp)
c00087f2:	6c 20 73 
c00087f5:	c7 85 44 ff ff ff 75 	movl   $0x65636375,-0xbc(%ebp)
c00087fc:	63 63 65 
c00087ff:	c7 85 48 ff ff ff 73 	movl   $0x61207373,-0xb8(%ebp)
c0008806:	73 20 61 
c0008809:	c7 85 4c ff ff ff 74 	movl   $0x616c2074,-0xb4(%ebp)
c0008810:	20 6c 61 
c0008813:	c7 85 50 ff ff ff 73 	movl   $0x2e7473,-0xb0(%ebp)
c000881a:	74 2e 00 
c000881d:	c7 85 54 ff ff ff 00 	movl   $0x0,-0xac(%ebp)
c0008824:	00 00 00 
c0008827:	66 c7 85 58 ff ff ff 	movw   $0x0,-0xa8(%ebp)
c000882e:	00 00 
c0008830:	83 ec 0c             	sub    $0xc,%esp
c0008833:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c0008839:	50                   	push   %eax
c000883a:	e8 39 36 00 00       	call   c000be78 <Strlen>
c000883f:	83 c4 10             	add    $0x10,%esp
c0008842:	83 ec 04             	sub    $0x4,%esp
c0008845:	50                   	push   %eax
c0008846:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c000884c:	50                   	push   %eax
c000884d:	ff 75 d4             	pushl  -0x2c(%ebp)
c0008850:	e8 7f d3 ff ff       	call   c0005bd4 <write>
c0008855:	83 c4 10             	add    $0x10,%esp
c0008858:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000885f:	eb 5c                	jmp    c00088bd <TestFS+0x35c>
c0008861:	83 ec 04             	sub    $0x4,%esp
c0008864:	6a 1e                	push   $0x1e
c0008866:	6a 00                	push   $0x0
c0008868:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c000886e:	50                   	push   %eax
c000886f:	e8 cb 35 00 00       	call   c000be3f <Memset>
c0008874:	83 c4 10             	add    $0x10,%esp
c0008877:	83 ec 0c             	sub    $0xc,%esp
c000887a:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c0008880:	50                   	push   %eax
c0008881:	e8 f2 35 00 00       	call   c000be78 <Strlen>
c0008886:	83 c4 10             	add    $0x10,%esp
c0008889:	83 ec 04             	sub    $0x4,%esp
c000888c:	50                   	push   %eax
c000888d:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c0008893:	50                   	push   %eax
c0008894:	ff 75 d4             	pushl  -0x2c(%ebp)
c0008897:	e8 b7 d1 ff ff       	call   c0005a53 <read>
c000889c:	83 c4 10             	add    $0x10,%esp
c000889f:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00088a2:	83 ec 08             	sub    $0x8,%esp
c00088a5:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c00088ab:	50                   	push   %eax
c00088ac:	68 f0 b9 00 c0       	push   $0xc000b9f0
c00088b1:	e8 75 0a 00 00       	call   c000932b <Printf>
c00088b6:	83 c4 10             	add    $0x10,%esp
c00088b9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00088bd:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c00088c1:	7e 9e                	jle    c0008861 <TestFS+0x300>
c00088c3:	c7 85 0a ff ff ff 69 	movl   $0x74736e69,-0xf6(%ebp)
c00088ca:	6e 73 74 
c00088cd:	c7 85 0e ff ff ff 61 	movl   $0x2e6c6c61,-0xf2(%ebp)
c00088d4:	6c 6c 2e 
c00088d7:	c7 85 12 ff ff ff 74 	movl   $0x726174,-0xee(%ebp)
c00088de:	61 72 00 
c00088e1:	c7 85 16 ff ff ff 00 	movl   $0x0,-0xea(%ebp)
c00088e8:	00 00 00 
c00088eb:	c7 85 1a ff ff ff 00 	movl   $0x0,-0xe6(%ebp)
c00088f2:	00 00 00 
c00088f5:	83 ec 08             	sub    $0x8,%esp
c00088f8:	6a 00                	push   $0x0
c00088fa:	8d 85 0a ff ff ff    	lea    -0xf6(%ebp),%eax
c0008900:	50                   	push   %eax
c0008901:	e8 b8 d0 ff ff       	call   c00059be <open>
c0008906:	83 c4 10             	add    $0x10,%esp
c0008909:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000890c:	83 ec 08             	sub    $0x8,%esp
c000890f:	ff 75 cc             	pushl  -0x34(%ebp)
c0008912:	68 fb b9 00 c0       	push   $0xc000b9fb
c0008917:	e8 0f 0a 00 00       	call   c000932b <Printf>
c000891c:	83 c4 10             	add    $0x10,%esp
c000891f:	83 ec 04             	sub    $0x4,%esp
c0008922:	6a 28                	push   $0x28
c0008924:	6a 00                	push   $0x0
c0008926:	8d 85 e2 fe ff ff    	lea    -0x11e(%ebp),%eax
c000892c:	50                   	push   %eax
c000892d:	e8 0d 35 00 00       	call   c000be3f <Memset>
c0008932:	83 c4 10             	add    $0x10,%esp
c0008935:	83 ec 04             	sub    $0x4,%esp
c0008938:	6a 28                	push   $0x28
c000893a:	8d 85 e2 fe ff ff    	lea    -0x11e(%ebp),%eax
c0008940:	50                   	push   %eax
c0008941:	ff 75 cc             	pushl  -0x34(%ebp)
c0008944:	e8 0a d1 ff ff       	call   c0005a53 <read>
c0008949:	83 c4 10             	add    $0x10,%esp
c000894c:	89 45 c8             	mov    %eax,-0x38(%ebp)
c000894f:	83 ec 08             	sub    $0x8,%esp
c0008952:	8d 85 e2 fe ff ff    	lea    -0x11e(%ebp),%eax
c0008958:	50                   	push   %eax
c0008959:	68 05 ba 00 c0       	push   $0xc000ba05
c000895e:	e8 c8 09 00 00       	call   c000932b <Printf>
c0008963:	83 c4 10             	add    $0x10,%esp
c0008966:	90                   	nop
c0008967:	c9                   	leave  
c0008968:	c3                   	ret    

c0008969 <wait_exit>:
c0008969:	55                   	push   %ebp
c000896a:	89 e5                	mov    %esp,%ebp
c000896c:	83 ec 28             	sub    $0x28,%esp
c000896f:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0008976:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c000897d:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0008983:	83 ec 08             	sub    $0x8,%esp
c0008986:	6a 02                	push   $0x2
c0008988:	8d 45 de             	lea    -0x22(%ebp),%eax
c000898b:	50                   	push   %eax
c000898c:	e8 2d d0 ff ff       	call   c00059be <open>
c0008991:	83 c4 10             	add    $0x10,%esp
c0008994:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008997:	83 ec 08             	sub    $0x8,%esp
c000899a:	6a 02                	push   $0x2
c000899c:	8d 45 de             	lea    -0x22(%ebp),%eax
c000899f:	50                   	push   %eax
c00089a0:	e8 19 d0 ff ff       	call   c00059be <open>
c00089a5:	83 c4 10             	add    $0x10,%esp
c00089a8:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00089ab:	e8 6e d3 ff ff       	call   c0005d1e <fork>
c00089b0:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00089b3:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c00089b7:	7e 25                	jle    c00089de <wait_exit+0x75>
c00089b9:	83 ec 0c             	sub    $0xc,%esp
c00089bc:	8d 45 d8             	lea    -0x28(%ebp),%eax
c00089bf:	50                   	push   %eax
c00089c0:	e8 e6 d2 ff ff       	call   c0005cab <wait>
c00089c5:	83 c4 10             	add    $0x10,%esp
c00089c8:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00089cb:	83 ec 08             	sub    $0x8,%esp
c00089ce:	50                   	push   %eax
c00089cf:	68 10 ba 00 c0       	push   $0xc000ba10
c00089d4:	e8 52 09 00 00       	call   c000932b <Printf>
c00089d9:	83 c4 10             	add    $0x10,%esp
c00089dc:	eb fe                	jmp    c00089dc <wait_exit+0x73>
c00089de:	83 ec 0c             	sub    $0xc,%esp
c00089e1:	68 2b ba 00 c0       	push   $0xc000ba2b
c00089e6:	e8 40 09 00 00       	call   c000932b <Printf>
c00089eb:	83 c4 10             	add    $0x10,%esp
c00089ee:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00089f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00089f8:	8d 50 01             	lea    0x1(%eax),%edx
c00089fb:	89 55 f4             	mov    %edx,-0xc(%ebp)
c00089fe:	3d 50 c3 00 00       	cmp    $0xc350,%eax
c0008a03:	7f 02                	jg     c0008a07 <wait_exit+0x9e>
c0008a05:	eb ee                	jmp    c00089f5 <wait_exit+0x8c>
c0008a07:	90                   	nop
c0008a08:	83 ec 0c             	sub    $0xc,%esp
c0008a0b:	68 37 ba 00 c0       	push   $0xc000ba37
c0008a10:	e8 16 09 00 00       	call   c000932b <Printf>
c0008a15:	83 c4 10             	add    $0x10,%esp
c0008a18:	83 ec 0c             	sub    $0xc,%esp
c0008a1b:	6a 09                	push   $0x9
c0008a1d:	e8 cd d2 ff ff       	call   c0005cef <exit>
c0008a22:	83 c4 10             	add    $0x10,%esp
c0008a25:	83 ec 0c             	sub    $0xc,%esp
c0008a28:	68 45 ba 00 c0       	push   $0xc000ba45
c0008a2d:	e8 f9 08 00 00       	call   c000932b <Printf>
c0008a32:	83 c4 10             	add    $0x10,%esp
c0008a35:	eb fe                	jmp    c0008a35 <wait_exit+0xcc>

c0008a37 <INIT_fork>:
c0008a37:	55                   	push   %ebp
c0008a38:	89 e5                	mov    %esp,%ebp
c0008a3a:	83 ec 78             	sub    $0x78,%esp
c0008a3d:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0008a44:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0008a4b:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0008a51:	83 ec 08             	sub    $0x8,%esp
c0008a54:	6a 02                	push   $0x2
c0008a56:	8d 45 de             	lea    -0x22(%ebp),%eax
c0008a59:	50                   	push   %eax
c0008a5a:	e8 5f cf ff ff       	call   c00059be <open>
c0008a5f:	83 c4 10             	add    $0x10,%esp
c0008a62:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008a65:	83 ec 08             	sub    $0x8,%esp
c0008a68:	6a 02                	push   $0x2
c0008a6a:	8d 45 de             	lea    -0x22(%ebp),%eax
c0008a6d:	50                   	push   %eax
c0008a6e:	e8 4b cf ff ff       	call   c00059be <open>
c0008a73:	83 c4 10             	add    $0x10,%esp
c0008a76:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008a79:	c7 45 b6 49 4e 49 54 	movl   $0x54494e49,-0x4a(%ebp)
c0008a80:	c7 45 ba 20 69 73 20 	movl   $0x20736920,-0x46(%ebp)
c0008a87:	c7 45 be 72 75 6e 6e 	movl   $0x6e6e7572,-0x42(%ebp)
c0008a8e:	c7 45 c2 69 6e 67 0a 	movl   $0xa676e69,-0x3e(%ebp)
c0008a95:	c7 45 c6 00 00 00 00 	movl   $0x0,-0x3a(%ebp)
c0008a9c:	c7 45 ca 00 00 00 00 	movl   $0x0,-0x36(%ebp)
c0008aa3:	c7 45 ce 00 00 00 00 	movl   $0x0,-0x32(%ebp)
c0008aaa:	c7 45 d2 00 00 00 00 	movl   $0x0,-0x2e(%ebp)
c0008ab1:	c7 45 d6 00 00 00 00 	movl   $0x0,-0x2a(%ebp)
c0008ab8:	c7 45 da 00 00 00 00 	movl   $0x0,-0x26(%ebp)
c0008abf:	83 ec 0c             	sub    $0xc,%esp
c0008ac2:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008ac5:	50                   	push   %eax
c0008ac6:	e8 60 08 00 00       	call   c000932b <Printf>
c0008acb:	83 c4 10             	add    $0x10,%esp
c0008ace:	83 ec 0c             	sub    $0xc,%esp
c0008ad1:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008ad4:	50                   	push   %eax
c0008ad5:	e8 9e 33 00 00       	call   c000be78 <Strlen>
c0008ada:	83 c4 10             	add    $0x10,%esp
c0008add:	83 ec 04             	sub    $0x4,%esp
c0008ae0:	50                   	push   %eax
c0008ae1:	6a 00                	push   $0x0
c0008ae3:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008ae6:	50                   	push   %eax
c0008ae7:	e8 53 33 00 00       	call   c000be3f <Memset>
c0008aec:	83 c4 10             	add    $0x10,%esp
c0008aef:	83 ec 04             	sub    $0x4,%esp
c0008af2:	6a 28                	push   $0x28
c0008af4:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008af7:	50                   	push   %eax
c0008af8:	ff 75 f0             	pushl  -0x10(%ebp)
c0008afb:	e8 53 cf ff ff       	call   c0005a53 <read>
c0008b00:	83 c4 10             	add    $0x10,%esp
c0008b03:	83 ec 0c             	sub    $0xc,%esp
c0008b06:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008b09:	50                   	push   %eax
c0008b0a:	e8 1c 08 00 00       	call   c000932b <Printf>
c0008b0f:	83 c4 10             	add    $0x10,%esp
c0008b12:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0008b19:	e8 00 d2 ff ff       	call   c0005d1e <fork>
c0008b1e:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008b21:	66 87 db             	xchg   %bx,%bx
c0008b24:	83 ec 0c             	sub    $0xc,%esp
c0008b27:	6a 01                	push   $0x1
c0008b29:	e8 c9 06 00 00       	call   c00091f7 <delay>
c0008b2e:	83 c4 10             	add    $0x10,%esp
c0008b31:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0008b35:	0f 8e c5 00 00 00    	jle    c0008c00 <INIT_fork+0x1c9>
c0008b3b:	83 ec 0c             	sub    $0xc,%esp
c0008b3e:	68 53 ba 00 c0       	push   $0xc000ba53
c0008b43:	e8 e3 07 00 00       	call   c000932b <Printf>
c0008b48:	83 c4 10             	add    $0x10,%esp
c0008b4b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0008b4f:	c7 45 8e 50 61 72 65 	movl   $0x65726150,-0x72(%ebp)
c0008b56:	c7 45 92 6e 74 2e 4e 	movl   $0x4e2e746e,-0x6e(%ebp)
c0008b5d:	c7 45 96 69 63 65 20 	movl   $0x20656369,-0x6a(%ebp)
c0008b64:	c7 45 9a 74 6f 20 6d 	movl   $0x6d206f74,-0x66(%ebp)
c0008b6b:	c7 45 9e 65 65 74 20 	movl   $0x20746565,-0x62(%ebp)
c0008b72:	c7 45 a2 79 6f 75 21 	movl   $0x21756f79,-0x5e(%ebp)
c0008b79:	c7 45 a6 0a 00 00 00 	movl   $0xa,-0x5a(%ebp)
c0008b80:	c7 45 aa 00 00 00 00 	movl   $0x0,-0x56(%ebp)
c0008b87:	c7 45 ae 00 00 00 00 	movl   $0x0,-0x52(%ebp)
c0008b8e:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)
c0008b95:	83 ec 0c             	sub    $0xc,%esp
c0008b98:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008b9b:	50                   	push   %eax
c0008b9c:	e8 d7 32 00 00       	call   c000be78 <Strlen>
c0008ba1:	83 c4 10             	add    $0x10,%esp
c0008ba4:	83 ec 04             	sub    $0x4,%esp
c0008ba7:	50                   	push   %eax
c0008ba8:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008bab:	50                   	push   %eax
c0008bac:	ff 75 f4             	pushl  -0xc(%ebp)
c0008baf:	e8 20 d0 ff ff       	call   c0005bd4 <write>
c0008bb4:	83 c4 10             	add    $0x10,%esp
c0008bb7:	83 ec 0c             	sub    $0xc,%esp
c0008bba:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008bbd:	50                   	push   %eax
c0008bbe:	e8 b5 32 00 00       	call   c000be78 <Strlen>
c0008bc3:	83 c4 10             	add    $0x10,%esp
c0008bc6:	83 ec 04             	sub    $0x4,%esp
c0008bc9:	50                   	push   %eax
c0008bca:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008bcd:	50                   	push   %eax
c0008bce:	ff 75 f4             	pushl  -0xc(%ebp)
c0008bd1:	e8 fe cf ff ff       	call   c0005bd4 <write>
c0008bd6:	83 c4 10             	add    $0x10,%esp
c0008bd9:	83 ec 0c             	sub    $0xc,%esp
c0008bdc:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008bdf:	50                   	push   %eax
c0008be0:	e8 93 32 00 00       	call   c000be78 <Strlen>
c0008be5:	83 c4 10             	add    $0x10,%esp
c0008be8:	83 ec 04             	sub    $0x4,%esp
c0008beb:	50                   	push   %eax
c0008bec:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008bef:	50                   	push   %eax
c0008bf0:	ff 75 f4             	pushl  -0xc(%ebp)
c0008bf3:	e8 dc cf ff ff       	call   c0005bd4 <write>
c0008bf8:	83 c4 10             	add    $0x10,%esp
c0008bfb:	e9 c6 00 00 00       	jmp    c0008cc6 <INIT_fork+0x28f>
c0008c00:	83 ec 0c             	sub    $0xc,%esp
c0008c03:	6a 01                	push   $0x1
c0008c05:	e8 ed 05 00 00       	call   c00091f7 <delay>
c0008c0a:	83 c4 10             	add    $0x10,%esp
c0008c0d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0008c11:	83 45 ec 02          	addl   $0x2,-0x14(%ebp)
c0008c15:	c7 45 8e 43 68 69 6c 	movl   $0x6c696843,-0x72(%ebp)
c0008c1c:	c7 45 92 64 2e 53 65 	movl   $0x65532e64,-0x6e(%ebp)
c0008c23:	c7 45 96 65 20 79 6f 	movl   $0x6f792065,-0x6a(%ebp)
c0008c2a:	c7 45 9a 75 20 61 67 	movl   $0x67612075,-0x66(%ebp)
c0008c31:	c7 45 9e 61 69 6e 0a 	movl   $0xa6e6961,-0x62(%ebp)
c0008c38:	c7 45 a2 00 00 00 00 	movl   $0x0,-0x5e(%ebp)
c0008c3f:	c7 45 a6 00 00 00 00 	movl   $0x0,-0x5a(%ebp)
c0008c46:	c7 45 aa 00 00 00 00 	movl   $0x0,-0x56(%ebp)
c0008c4d:	c7 45 ae 00 00 00 00 	movl   $0x0,-0x52(%ebp)
c0008c54:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)
c0008c5b:	66 87 db             	xchg   %bx,%bx
c0008c5e:	83 ec 0c             	sub    $0xc,%esp
c0008c61:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008c64:	50                   	push   %eax
c0008c65:	e8 0e 32 00 00       	call   c000be78 <Strlen>
c0008c6a:	83 c4 10             	add    $0x10,%esp
c0008c6d:	83 ec 04             	sub    $0x4,%esp
c0008c70:	50                   	push   %eax
c0008c71:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008c74:	50                   	push   %eax
c0008c75:	ff 75 f4             	pushl  -0xc(%ebp)
c0008c78:	e8 57 cf ff ff       	call   c0005bd4 <write>
c0008c7d:	83 c4 10             	add    $0x10,%esp
c0008c80:	83 ec 0c             	sub    $0xc,%esp
c0008c83:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008c86:	50                   	push   %eax
c0008c87:	e8 ec 31 00 00       	call   c000be78 <Strlen>
c0008c8c:	83 c4 10             	add    $0x10,%esp
c0008c8f:	83 ec 04             	sub    $0x4,%esp
c0008c92:	50                   	push   %eax
c0008c93:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008c96:	50                   	push   %eax
c0008c97:	ff 75 f4             	pushl  -0xc(%ebp)
c0008c9a:	e8 35 cf ff ff       	call   c0005bd4 <write>
c0008c9f:	83 c4 10             	add    $0x10,%esp
c0008ca2:	83 ec 0c             	sub    $0xc,%esp
c0008ca5:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008ca8:	50                   	push   %eax
c0008ca9:	e8 ca 31 00 00       	call   c000be78 <Strlen>
c0008cae:	83 c4 10             	add    $0x10,%esp
c0008cb1:	83 ec 04             	sub    $0x4,%esp
c0008cb4:	50                   	push   %eax
c0008cb5:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008cb8:	50                   	push   %eax
c0008cb9:	ff 75 f4             	pushl  -0xc(%ebp)
c0008cbc:	e8 13 cf ff ff       	call   c0005bd4 <write>
c0008cc1:	83 c4 10             	add    $0x10,%esp
c0008cc4:	eb fe                	jmp    c0008cc4 <INIT_fork+0x28d>
c0008cc6:	83 ec 04             	sub    $0x4,%esp
c0008cc9:	6a 28                	push   $0x28
c0008ccb:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008cce:	50                   	push   %eax
c0008ccf:	ff 75 f0             	pushl  -0x10(%ebp)
c0008cd2:	e8 7c cd ff ff       	call   c0005a53 <read>
c0008cd7:	83 c4 10             	add    $0x10,%esp
c0008cda:	83 ec 0c             	sub    $0xc,%esp
c0008cdd:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008ce0:	50                   	push   %eax
c0008ce1:	e8 45 06 00 00       	call   c000932b <Printf>
c0008ce6:	83 c4 10             	add    $0x10,%esp
c0008ce9:	83 ec 0c             	sub    $0xc,%esp
c0008cec:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008cef:	50                   	push   %eax
c0008cf0:	e8 36 06 00 00       	call   c000932b <Printf>
c0008cf5:	83 c4 10             	add    $0x10,%esp
c0008cf8:	83 ec 0c             	sub    $0xc,%esp
c0008cfb:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008cfe:	50                   	push   %eax
c0008cff:	e8 27 06 00 00       	call   c000932b <Printf>
c0008d04:	83 c4 10             	add    $0x10,%esp
c0008d07:	83 ec 0c             	sub    $0xc,%esp
c0008d0a:	68 59 ba 00 c0       	push   $0xc000ba59
c0008d0f:	e8 30 09 00 00       	call   c0009644 <spin>
c0008d14:	83 c4 10             	add    $0x10,%esp
c0008d17:	90                   	nop
c0008d18:	c9                   	leave  
c0008d19:	c3                   	ret    

c0008d1a <simple_shell>:
c0008d1a:	55                   	push   %ebp
c0008d1b:	89 e5                	mov    %esp,%ebp
c0008d1d:	81 ec f8 00 00 00    	sub    $0xf8,%esp
c0008d23:	c7 45 c2 64 65 76 5f 	movl   $0x5f766564,-0x3e(%ebp)
c0008d2a:	c7 45 c6 74 74 79 31 	movl   $0x31797474,-0x3a(%ebp)
c0008d31:	66 c7 45 ca 00 00    	movw   $0x0,-0x36(%ebp)
c0008d37:	83 ec 08             	sub    $0x8,%esp
c0008d3a:	6a 02                	push   $0x2
c0008d3c:	8d 45 c2             	lea    -0x3e(%ebp),%eax
c0008d3f:	50                   	push   %eax
c0008d40:	e8 79 cc ff ff       	call   c00059be <open>
c0008d45:	83 c4 10             	add    $0x10,%esp
c0008d48:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0008d4b:	83 ec 08             	sub    $0x8,%esp
c0008d4e:	6a 02                	push   $0x2
c0008d50:	8d 45 c2             	lea    -0x3e(%ebp),%eax
c0008d53:	50                   	push   %eax
c0008d54:	e8 65 cc ff ff       	call   c00059be <open>
c0008d59:	83 c4 10             	add    $0x10,%esp
c0008d5c:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0008d5f:	83 ec 04             	sub    $0x4,%esp
c0008d62:	68 80 00 00 00       	push   $0x80
c0008d67:	6a 00                	push   $0x0
c0008d69:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c0008d6f:	50                   	push   %eax
c0008d70:	e8 ca 30 00 00       	call   c000be3f <Memset>
c0008d75:	83 c4 10             	add    $0x10,%esp
c0008d78:	83 ec 04             	sub    $0x4,%esp
c0008d7b:	68 80 00 00 00       	push   $0x80
c0008d80:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c0008d86:	50                   	push   %eax
c0008d87:	ff 75 e0             	pushl  -0x20(%ebp)
c0008d8a:	e8 c4 cc ff ff       	call   c0005a53 <read>
c0008d8f:	83 c4 10             	add    $0x10,%esp
c0008d92:	83 ec 08             	sub    $0x8,%esp
c0008d95:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c0008d9b:	50                   	push   %eax
c0008d9c:	68 61 ba 00 c0       	push   $0xc000ba61
c0008da1:	e8 85 05 00 00       	call   c000932b <Printf>
c0008da6:	83 c4 10             	add    $0x10,%esp
c0008da9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008db0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0008db7:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c0008dbd:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008dc0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008dc3:	0f b6 00             	movzbl (%eax),%eax
c0008dc6:	88 45 db             	mov    %al,-0x25(%ebp)
c0008dc9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008dcc:	0f b6 00             	movzbl (%eax),%eax
c0008dcf:	3c 20                	cmp    $0x20,%al
c0008dd1:	74 1d                	je     c0008df0 <simple_shell+0xd6>
c0008dd3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008dd6:	0f b6 00             	movzbl (%eax),%eax
c0008dd9:	84 c0                	test   %al,%al
c0008ddb:	74 13                	je     c0008df0 <simple_shell+0xd6>
c0008ddd:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0008de1:	75 0d                	jne    c0008df0 <simple_shell+0xd6>
c0008de3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008de6:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008de9:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0008df0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008df3:	0f b6 00             	movzbl (%eax),%eax
c0008df6:	3c 20                	cmp    $0x20,%al
c0008df8:	74 0a                	je     c0008e04 <simple_shell+0xea>
c0008dfa:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008dfd:	0f b6 00             	movzbl (%eax),%eax
c0008e00:	84 c0                	test   %al,%al
c0008e02:	75 26                	jne    c0008e2a <simple_shell+0x110>
c0008e04:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
c0008e08:	75 20                	jne    c0008e2a <simple_shell+0x110>
c0008e0a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008e0d:	8d 50 01             	lea    0x1(%eax),%edx
c0008e10:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0008e13:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0008e16:	89 94 85 14 ff ff ff 	mov    %edx,-0xec(%ebp,%eax,4)
c0008e1d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008e20:	c6 00 00             	movb   $0x0,(%eax)
c0008e23:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0008e2a:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0008e2e:	80 7d db 00          	cmpb   $0x0,-0x25(%ebp)
c0008e32:	75 8c                	jne    c0008dc0 <simple_shell+0xa6>
c0008e34:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008e37:	c7 84 85 14 ff ff ff 	movl   $0x0,-0xec(%ebp,%eax,4)
c0008e3e:	00 00 00 00 
c0008e42:	c7 45 d4 ff ff ff ff 	movl   $0xffffffff,-0x2c(%ebp)
c0008e49:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0008e4f:	83 ec 08             	sub    $0x8,%esp
c0008e52:	6a 02                	push   $0x2
c0008e54:	50                   	push   %eax
c0008e55:	e8 64 cb ff ff       	call   c00059be <open>
c0008e5a:	83 c4 10             	add    $0x10,%esp
c0008e5d:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0008e60:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0008e64:	75 54                	jne    c0008eba <simple_shell+0x1a0>
c0008e66:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0008e6d:	eb 29                	jmp    c0008e98 <simple_shell+0x17e>
c0008e6f:	8b 95 14 ff ff ff    	mov    -0xec(%ebp),%edx
c0008e75:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008e78:	01 d0                	add    %edx,%eax
c0008e7a:	0f b6 00             	movzbl (%eax),%eax
c0008e7d:	0f be c0             	movsbl %al,%eax
c0008e80:	83 ec 04             	sub    $0x4,%esp
c0008e83:	50                   	push   %eax
c0008e84:	ff 75 e4             	pushl  -0x1c(%ebp)
c0008e87:	68 70 ba 00 c0       	push   $0xc000ba70
c0008e8c:	e8 9a 04 00 00       	call   c000932b <Printf>
c0008e91:	83 c4 10             	add    $0x10,%esp
c0008e94:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0008e98:	83 7d e4 05          	cmpl   $0x5,-0x1c(%ebp)
c0008e9c:	7e d1                	jle    c0008e6f <simple_shell+0x155>
c0008e9e:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0008ea4:	83 ec 08             	sub    $0x8,%esp
c0008ea7:	50                   	push   %eax
c0008ea8:	68 77 ba 00 c0       	push   $0xc000ba77
c0008ead:	e8 79 04 00 00       	call   c000932b <Printf>
c0008eb2:	83 c4 10             	add    $0x10,%esp
c0008eb5:	e9 a5 fe ff ff       	jmp    c0008d5f <simple_shell+0x45>
c0008eba:	e8 5f ce ff ff       	call   c0005d1e <fork>
c0008ebf:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0008ec2:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0008ec6:	7e 17                	jle    c0008edf <simple_shell+0x1c5>
c0008ec8:	83 ec 0c             	sub    $0xc,%esp
c0008ecb:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c0008ed1:	50                   	push   %eax
c0008ed2:	e8 d4 cd ff ff       	call   c0005cab <wait>
c0008ed7:	83 c4 10             	add    $0x10,%esp
c0008eda:	e9 80 fe ff ff       	jmp    c0008d5f <simple_shell+0x45>
c0008edf:	83 ec 0c             	sub    $0xc,%esp
c0008ee2:	68 7d ba 00 c0       	push   $0xc000ba7d
c0008ee7:	e8 3f 04 00 00       	call   c000932b <Printf>
c0008eec:	83 c4 10             	add    $0x10,%esp
c0008eef:	83 ec 0c             	sub    $0xc,%esp
c0008ef2:	ff 75 d0             	pushl  -0x30(%ebp)
c0008ef5:	e8 5f cd ff ff       	call   c0005c59 <close>
c0008efa:	83 c4 10             	add    $0x10,%esp
c0008efd:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0008f03:	83 ec 08             	sub    $0x8,%esp
c0008f06:	8d 95 14 ff ff ff    	lea    -0xec(%ebp),%edx
c0008f0c:	52                   	push   %edx
c0008f0d:	50                   	push   %eax
c0008f0e:	e8 0f cf ff ff       	call   c0005e22 <execv>
c0008f13:	83 c4 10             	add    $0x10,%esp
c0008f16:	eb fe                	jmp    c0008f16 <simple_shell+0x1fc>

c0008f18 <test_split_str>:
c0008f18:	55                   	push   %ebp
c0008f19:	89 e5                	mov    %esp,%ebp
c0008f1b:	81 ec b8 01 00 00    	sub    $0x1b8,%esp
c0008f21:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008f28:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0008f2f:	c7 45 ec 99 ba 00 c0 	movl   $0xc000ba99,-0x14(%ebp)
c0008f36:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0008f3a:	75 1a                	jne    c0008f56 <test_split_str+0x3e>
c0008f3c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008f3f:	0f b6 00             	movzbl (%eax),%eax
c0008f42:	0f be c0             	movsbl %al,%eax
c0008f45:	83 ec 08             	sub    $0x8,%esp
c0008f48:	50                   	push   %eax
c0008f49:	68 aa ba 00 c0       	push   $0xc000baaa
c0008f4e:	e8 d8 03 00 00       	call   c000932b <Printf>
c0008f53:	83 c4 10             	add    $0x10,%esp
c0008f56:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008f59:	0f b6 00             	movzbl (%eax),%eax
c0008f5c:	3c 20                	cmp    $0x20,%al
c0008f5e:	75 0a                	jne    c0008f6a <test_split_str+0x52>
c0008f60:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008f63:	0f b6 00             	movzbl (%eax),%eax
c0008f66:	84 c0                	test   %al,%al
c0008f68:	74 13                	je     c0008f7d <test_split_str+0x65>
c0008f6a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0008f6e:	75 0d                	jne    c0008f7d <test_split_str+0x65>
c0008f70:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008f73:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008f76:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0008f7d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008f80:	0f b6 00             	movzbl (%eax),%eax
c0008f83:	3c 20                	cmp    $0x20,%al
c0008f85:	74 0a                	je     c0008f91 <test_split_str+0x79>
c0008f87:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008f8a:	0f b6 00             	movzbl (%eax),%eax
c0008f8d:	84 c0                	test   %al,%al
c0008f8f:	75 26                	jne    c0008fb7 <test_split_str+0x9f>
c0008f91:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
c0008f95:	75 20                	jne    c0008fb7 <test_split_str+0x9f>
c0008f97:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008f9a:	8d 50 01             	lea    0x1(%eax),%edx
c0008f9d:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0008fa0:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0008fa3:	89 94 85 50 fe ff ff 	mov    %edx,-0x1b0(%ebp,%eax,4)
c0008faa:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008fad:	c6 00 00             	movb   $0x0,(%eax)
c0008fb0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0008fb7:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0008fbb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008fbe:	0f b6 00             	movzbl (%eax),%eax
c0008fc1:	84 c0                	test   %al,%al
c0008fc3:	0f 85 6d ff ff ff    	jne    c0008f36 <test_split_str+0x1e>
c0008fc9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008fcc:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0008fcf:	89 94 85 50 fe ff ff 	mov    %edx,-0x1b0(%ebp,%eax,4)
c0008fd6:	83 ec 08             	sub    $0x8,%esp
c0008fd9:	ff 75 f4             	pushl  -0xc(%ebp)
c0008fdc:	68 b3 ba 00 c0       	push   $0xc000bab3
c0008fe1:	e8 45 03 00 00       	call   c000932b <Printf>
c0008fe6:	83 c4 10             	add    $0x10,%esp
c0008fe9:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0008ff0:	eb 22                	jmp    c0009014 <test_split_str+0xfc>
c0008ff2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008ff5:	8b 84 85 50 fe ff ff 	mov    -0x1b0(%ebp,%eax,4),%eax
c0008ffc:	83 ec 04             	sub    $0x4,%esp
c0008fff:	50                   	push   %eax
c0009000:	ff 75 e4             	pushl  -0x1c(%ebp)
c0009003:	68 ca ba 00 c0       	push   $0xc000baca
c0009008:	e8 1e 03 00 00       	call   c000932b <Printf>
c000900d:	83 c4 10             	add    $0x10,%esp
c0009010:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0009014:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009017:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c000901a:	7e d6                	jle    c0008ff2 <test_split_str+0xda>
c000901c:	8b 85 50 fe ff ff    	mov    -0x1b0(%ebp),%eax
c0009022:	83 ec 08             	sub    $0x8,%esp
c0009025:	68 d9 ba 00 c0       	push   $0xc000bad9
c000902a:	50                   	push   %eax
c000902b:	e8 fd 12 00 00       	call   c000a32d <strcmp>
c0009030:	83 c4 10             	add    $0x10,%esp
c0009033:	85 c0                	test   %eax,%eax
c0009035:	75 10                	jne    c0009047 <test_split_str+0x12f>
c0009037:	83 ec 0c             	sub    $0xc,%esp
c000903a:	68 de ba 00 c0       	push   $0xc000bade
c000903f:	e8 e7 02 00 00       	call   c000932b <Printf>
c0009044:	83 c4 10             	add    $0x10,%esp
c0009047:	8b 85 50 fe ff ff    	mov    -0x1b0(%ebp),%eax
c000904d:	83 ec 08             	sub    $0x8,%esp
c0009050:	50                   	push   %eax
c0009051:	68 ea ba 00 c0       	push   $0xc000baea
c0009056:	e8 d0 02 00 00       	call   c000932b <Printf>
c000905b:	83 c4 10             	add    $0x10,%esp
c000905e:	83 ec 0c             	sub    $0xc,%esp
c0009061:	68 f8 ba 00 c0       	push   $0xc000baf8
c0009066:	e8 c0 02 00 00       	call   c000932b <Printf>
c000906b:	83 c4 10             	add    $0x10,%esp
c000906e:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0009075:	eb 26                	jmp    c000909d <test_split_str+0x185>
c0009077:	8b 95 50 fe ff ff    	mov    -0x1b0(%ebp),%edx
c000907d:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0009080:	01 d0                	add    %edx,%eax
c0009082:	0f b6 00             	movzbl (%eax),%eax
c0009085:	0f be c0             	movsbl %al,%eax
c0009088:	83 ec 08             	sub    $0x8,%esp
c000908b:	50                   	push   %eax
c000908c:	68 07 bb 00 c0       	push   $0xc000bb07
c0009091:	e8 95 02 00 00       	call   c000932b <Printf>
c0009096:	83 c4 10             	add    $0x10,%esp
c0009099:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c000909d:	83 7d e0 05          	cmpl   $0x5,-0x20(%ebp)
c00090a1:	7e d4                	jle    c0009077 <test_split_str+0x15f>
c00090a3:	c9                   	leave  
c00090a4:	c3                   	ret    

c00090a5 <test_shell>:
c00090a5:	55                   	push   %ebp
c00090a6:	89 e5                	mov    %esp,%ebp
c00090a8:	83 ec 38             	sub    $0x38,%esp
c00090ab:	c7 45 ea 64 65 76 5f 	movl   $0x5f766564,-0x16(%ebp)
c00090b2:	c7 45 ee 74 74 79 31 	movl   $0x31797474,-0x12(%ebp)
c00090b9:	66 c7 45 f2 00 00    	movw   $0x0,-0xe(%ebp)
c00090bf:	83 ec 08             	sub    $0x8,%esp
c00090c2:	6a 02                	push   $0x2
c00090c4:	8d 45 ea             	lea    -0x16(%ebp),%eax
c00090c7:	50                   	push   %eax
c00090c8:	e8 f1 c8 ff ff       	call   c00059be <open>
c00090cd:	83 c4 10             	add    $0x10,%esp
c00090d0:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00090d3:	c7 45 d6 69 6e 73 74 	movl   $0x74736e69,-0x2a(%ebp)
c00090da:	c7 45 da 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x26(%ebp)
c00090e1:	c7 45 de 74 61 72 00 	movl   $0x726174,-0x22(%ebp)
c00090e8:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c00090ef:	c7 45 e6 00 00 00 00 	movl   $0x0,-0x1a(%ebp)
c00090f6:	83 ec 0c             	sub    $0xc,%esp
c00090f9:	8d 45 d6             	lea    -0x2a(%ebp),%eax
c00090fc:	50                   	push   %eax
c00090fd:	e8 35 ea ff ff       	call   c0007b37 <untar>
c0009102:	83 c4 10             	add    $0x10,%esp
c0009105:	e8 10 fc ff ff       	call   c0008d1a <simple_shell>
c000910a:	90                   	nop
c000910b:	c9                   	leave  
c000910c:	c3                   	ret    

c000910d <test_exec>:
c000910d:	55                   	push   %ebp
c000910e:	89 e5                	mov    %esp,%ebp
c0009110:	83 ec 38             	sub    $0x38,%esp
c0009113:	83 ec 0c             	sub    $0xc,%esp
c0009116:	68 53 b9 00 c0       	push   $0xc000b953
c000911b:	e8 6c 7f ff ff       	call   c000108c <disp_str>
c0009120:	83 c4 10             	add    $0x10,%esp
c0009123:	83 ec 0c             	sub    $0xc,%esp
c0009126:	68 55 b9 00 c0       	push   $0xc000b955
c000912b:	e8 5c 7f ff ff       	call   c000108c <disp_str>
c0009130:	83 c4 10             	add    $0x10,%esp
c0009133:	c7 45 ea 64 65 76 5f 	movl   $0x5f766564,-0x16(%ebp)
c000913a:	c7 45 ee 74 74 79 31 	movl   $0x31797474,-0x12(%ebp)
c0009141:	66 c7 45 f2 00 00    	movw   $0x0,-0xe(%ebp)
c0009147:	83 ec 08             	sub    $0x8,%esp
c000914a:	6a 02                	push   $0x2
c000914c:	8d 45 ea             	lea    -0x16(%ebp),%eax
c000914f:	50                   	push   %eax
c0009150:	e8 69 c8 ff ff       	call   c00059be <open>
c0009155:	83 c4 10             	add    $0x10,%esp
c0009158:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000915b:	c7 45 d6 69 6e 73 74 	movl   $0x74736e69,-0x2a(%ebp)
c0009162:	c7 45 da 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x26(%ebp)
c0009169:	c7 45 de 74 61 72 00 	movl   $0x726174,-0x22(%ebp)
c0009170:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c0009177:	c7 45 e6 00 00 00 00 	movl   $0x0,-0x1a(%ebp)
c000917e:	83 ec 0c             	sub    $0xc,%esp
c0009181:	8d 45 d6             	lea    -0x2a(%ebp),%eax
c0009184:	50                   	push   %eax
c0009185:	e8 ad e9 ff ff       	call   c0007b37 <untar>
c000918a:	83 c4 10             	add    $0x10,%esp
c000918d:	83 ec 08             	sub    $0x8,%esp
c0009190:	6a 00                	push   $0x0
c0009192:	68 10 bb 00 c0       	push   $0xc000bb10
c0009197:	68 14 bb 00 c0       	push   $0xc000bb14
c000919c:	68 1a bb 00 c0       	push   $0xc000bb1a
c00091a1:	68 d9 ba 00 c0       	push   $0xc000bad9
c00091a6:	68 20 bb 00 c0       	push   $0xc000bb20
c00091ab:	e8 57 ce ff ff       	call   c0006007 <execl>
c00091b0:	83 c4 20             	add    $0x20,%esp
c00091b3:	eb fe                	jmp    c00091b3 <test_exec+0xa6>

c00091b5 <INIT>:
c00091b5:	55                   	push   %ebp
c00091b6:	89 e5                	mov    %esp,%ebp
c00091b8:	83 ec 08             	sub    $0x8,%esp
c00091bb:	e8 e5 fe ff ff       	call   c00090a5 <test_shell>
c00091c0:	eb fe                	jmp    c00091c0 <INIT+0xb>

c00091c2 <TestA>:
c00091c2:	55                   	push   %ebp
c00091c3:	89 e5                	mov    %esp,%ebp
c00091c5:	83 ec 08             	sub    $0x8,%esp
c00091c8:	83 ec 0c             	sub    $0xc,%esp
c00091cb:	6a 05                	push   $0x5
c00091cd:	e8 1b ed ff ff       	call   c0007eed <disp_int>
c00091d2:	83 c4 10             	add    $0x10,%esp
c00091d5:	83 ec 0c             	sub    $0xc,%esp
c00091d8:	68 4f b6 00 c0       	push   $0xc000b64f
c00091dd:	e8 aa 7e ff ff       	call   c000108c <disp_str>
c00091e2:	83 c4 10             	add    $0x10,%esp
c00091e5:	83 ec 0c             	sub    $0xc,%esp
c00091e8:	68 26 bb 00 c0       	push   $0xc000bb26
c00091ed:	e8 9a 7e ff ff       	call   c000108c <disp_str>
c00091f2:	83 c4 10             	add    $0x10,%esp
c00091f5:	eb fe                	jmp    c00091f5 <TestA+0x33>

c00091f7 <delay>:
c00091f7:	55                   	push   %ebp
c00091f8:	89 e5                	mov    %esp,%ebp
c00091fa:	83 ec 10             	sub    $0x10,%esp
c00091fd:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0009204:	eb 2a                	jmp    c0009230 <delay+0x39>
c0009206:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c000920d:	eb 17                	jmp    c0009226 <delay+0x2f>
c000920f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0009216:	eb 04                	jmp    c000921c <delay+0x25>
c0009218:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000921c:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c0009220:	7e f6                	jle    c0009218 <delay+0x21>
c0009222:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0009226:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
c000922a:	7e e3                	jle    c000920f <delay+0x18>
c000922c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0009230:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0009233:	3b 45 08             	cmp    0x8(%ebp),%eax
c0009236:	7c ce                	jl     c0009206 <delay+0xf>
c0009238:	90                   	nop
c0009239:	c9                   	leave  
c000923a:	c3                   	ret    

c000923b <TestB>:
c000923b:	55                   	push   %ebp
c000923c:	89 e5                	mov    %esp,%ebp
c000923e:	83 ec 08             	sub    $0x8,%esp
c0009241:	83 ec 0c             	sub    $0xc,%esp
c0009244:	68 2d bb 00 c0       	push   $0xc000bb2d
c0009249:	e8 3e 7e ff ff       	call   c000108c <disp_str>
c000924e:	83 c4 10             	add    $0x10,%esp
c0009251:	eb fe                	jmp    c0009251 <TestB+0x16>

c0009253 <TestC>:
c0009253:	55                   	push   %ebp
c0009254:	89 e5                	mov    %esp,%ebp
c0009256:	83 ec 18             	sub    $0x18,%esp
c0009259:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0009260:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c0009264:	77 1a                	ja     c0009280 <TestC+0x2d>
c0009266:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
c000926d:	83 ec 08             	sub    $0x8,%esp
c0009270:	ff 75 f0             	pushl  -0x10(%ebp)
c0009273:	68 30 bb 00 c0       	push   $0xc000bb30
c0009278:	e8 ae 00 00 00       	call   c000932b <Printf>
c000927d:	83 c4 10             	add    $0x10,%esp
c0009280:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0009284:	eb da                	jmp    c0009260 <TestC+0xd>

c0009286 <sys_get_ticks>:
c0009286:	55                   	push   %ebp
c0009287:	89 e5                	mov    %esp,%ebp
c0009289:	a1 e8 1e 01 c0       	mov    0xc0011ee8,%eax
c000928e:	8b 15 ec 1e 01 c0    	mov    0xc0011eec,%edx
c0009294:	5d                   	pop    %ebp
c0009295:	c3                   	ret    

c0009296 <sys_write>:
c0009296:	55                   	push   %ebp
c0009297:	89 e5                	mov    %esp,%ebp
c0009299:	83 ec 18             	sub    $0x18,%esp
c000929c:	8b 45 10             	mov    0x10(%ebp),%eax
c000929f:	8b 80 30 01 00 00    	mov    0x130(%eax),%eax
c00092a5:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c00092ab:	05 00 0e 01 c0       	add    $0xc0010e00,%eax
c00092b0:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00092b3:	8b 45 0c             	mov    0xc(%ebp),%eax
c00092b6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00092b9:	8b 45 08             	mov    0x8(%ebp),%eax
c00092bc:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00092bf:	eb 20                	jmp    c00092e1 <sys_write+0x4b>
c00092c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00092c4:	0f b6 00             	movzbl (%eax),%eax
c00092c7:	0f b6 c0             	movzbl %al,%eax
c00092ca:	83 ec 08             	sub    $0x8,%esp
c00092cd:	50                   	push   %eax
c00092ce:	ff 75 ec             	pushl  -0x14(%ebp)
c00092d1:	e8 59 ba ff ff       	call   c0004d2f <out_char>
c00092d6:	83 c4 10             	add    $0x10,%esp
c00092d9:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00092dd:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
c00092e1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00092e5:	7f da                	jg     c00092c1 <sys_write+0x2b>
c00092e7:	90                   	nop
c00092e8:	c9                   	leave  
c00092e9:	c3                   	ret    

c00092ea <milli_delay>:
c00092ea:	55                   	push   %ebp
c00092eb:	89 e5                	mov    %esp,%ebp
c00092ed:	83 ec 18             	sub    $0x18,%esp
c00092f0:	e8 58 0e 00 00       	call   c000a14d <get_ticks_ipc>
c00092f5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00092f8:	90                   	nop
c00092f9:	e8 4f 0e 00 00       	call   c000a14d <get_ticks_ipc>
c00092fe:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0009301:	89 c1                	mov    %eax,%ecx
c0009303:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
c0009308:	89 c8                	mov    %ecx,%eax
c000930a:	f7 ea                	imul   %edx
c000930c:	c1 fa 05             	sar    $0x5,%edx
c000930f:	89 c8                	mov    %ecx,%eax
c0009311:	c1 f8 1f             	sar    $0x1f,%eax
c0009314:	29 c2                	sub    %eax,%edx
c0009316:	89 d0                	mov    %edx,%eax
c0009318:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
c000931e:	39 45 08             	cmp    %eax,0x8(%ebp)
c0009321:	77 d6                	ja     c00092f9 <milli_delay+0xf>
c0009323:	90                   	nop
c0009324:	c9                   	leave  
c0009325:	c3                   	ret    

c0009326 <TaskSys>:
c0009326:	55                   	push   %ebp
c0009327:	89 e5                	mov    %esp,%ebp
c0009329:	eb fe                	jmp    c0009329 <TaskSys+0x3>

c000932b <Printf>:
c000932b:	55                   	push   %ebp
c000932c:	89 e5                	mov    %esp,%ebp
c000932e:	81 ec 18 01 00 00    	sub    $0x118,%esp
c0009334:	83 ec 04             	sub    $0x4,%esp
c0009337:	68 00 01 00 00       	push   $0x100
c000933c:	6a 00                	push   $0x0
c000933e:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0009344:	50                   	push   %eax
c0009345:	e8 f5 2a 00 00       	call   c000be3f <Memset>
c000934a:	83 c4 10             	add    $0x10,%esp
c000934d:	8d 45 0c             	lea    0xc(%ebp),%eax
c0009350:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009353:	8b 45 08             	mov    0x8(%ebp),%eax
c0009356:	83 ec 04             	sub    $0x4,%esp
c0009359:	ff 75 f4             	pushl  -0xc(%ebp)
c000935c:	50                   	push   %eax
c000935d:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0009363:	50                   	push   %eax
c0009364:	e8 20 00 00 00       	call   c0009389 <vsprintf>
c0009369:	83 c4 10             	add    $0x10,%esp
c000936c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000936f:	83 ec 04             	sub    $0x4,%esp
c0009372:	ff 75 f0             	pushl  -0x10(%ebp)
c0009375:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c000937b:	50                   	push   %eax
c000937c:	6a 00                	push   $0x0
c000937e:	e8 51 c8 ff ff       	call   c0005bd4 <write>
c0009383:	83 c4 10             	add    $0x10,%esp
c0009386:	90                   	nop
c0009387:	c9                   	leave  
c0009388:	c3                   	ret    

c0009389 <vsprintf>:
c0009389:	55                   	push   %ebp
c000938a:	89 e5                	mov    %esp,%ebp
c000938c:	81 ec 68 02 00 00    	sub    $0x268,%esp
c0009392:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0009398:	89 85 e4 fd ff ff    	mov    %eax,-0x21c(%ebp)
c000939e:	83 ec 04             	sub    $0x4,%esp
c00093a1:	6a 40                	push   $0x40
c00093a3:	6a 00                	push   $0x0
c00093a5:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c00093ab:	50                   	push   %eax
c00093ac:	e8 8e 2a 00 00       	call   c000be3f <Memset>
c00093b1:	83 c4 10             	add    $0x10,%esp
c00093b4:	8b 45 10             	mov    0x10(%ebp),%eax
c00093b7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00093ba:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c00093c1:	8b 45 08             	mov    0x8(%ebp),%eax
c00093c4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00093c7:	e9 53 01 00 00       	jmp    c000951f <vsprintf+0x196>
c00093cc:	8b 45 0c             	mov    0xc(%ebp),%eax
c00093cf:	0f b6 00             	movzbl (%eax),%eax
c00093d2:	3c 25                	cmp    $0x25,%al
c00093d4:	74 16                	je     c00093ec <vsprintf+0x63>
c00093d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00093d9:	8d 50 01             	lea    0x1(%eax),%edx
c00093dc:	89 55 f4             	mov    %edx,-0xc(%ebp)
c00093df:	8b 55 0c             	mov    0xc(%ebp),%edx
c00093e2:	0f b6 12             	movzbl (%edx),%edx
c00093e5:	88 10                	mov    %dl,(%eax)
c00093e7:	e9 2f 01 00 00       	jmp    c000951b <vsprintf+0x192>
c00093ec:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c00093f0:	8b 45 0c             	mov    0xc(%ebp),%eax
c00093f3:	0f b6 00             	movzbl (%eax),%eax
c00093f6:	0f be c0             	movsbl %al,%eax
c00093f9:	83 f8 64             	cmp    $0x64,%eax
c00093fc:	74 26                	je     c0009424 <vsprintf+0x9b>
c00093fe:	83 f8 64             	cmp    $0x64,%eax
c0009401:	7f 0e                	jg     c0009411 <vsprintf+0x88>
c0009403:	83 f8 63             	cmp    $0x63,%eax
c0009406:	0f 84 f2 00 00 00    	je     c00094fe <vsprintf+0x175>
c000940c:	e9 0a 01 00 00       	jmp    c000951b <vsprintf+0x192>
c0009411:	83 f8 73             	cmp    $0x73,%eax
c0009414:	0f 84 b0 00 00 00    	je     c00094ca <vsprintf+0x141>
c000941a:	83 f8 78             	cmp    $0x78,%eax
c000941d:	74 5d                	je     c000947c <vsprintf+0xf3>
c000941f:	e9 f7 00 00 00       	jmp    c000951b <vsprintf+0x192>
c0009424:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009427:	8b 00                	mov    (%eax),%eax
c0009429:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000942c:	83 ec 04             	sub    $0x4,%esp
c000942f:	6a 0a                	push   $0xa
c0009431:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c0009437:	50                   	push   %eax
c0009438:	ff 75 e8             	pushl  -0x18(%ebp)
c000943b:	e8 64 0d 00 00       	call   c000a1a4 <itoa>
c0009440:	83 c4 10             	add    $0x10,%esp
c0009443:	83 ec 08             	sub    $0x8,%esp
c0009446:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c000944c:	50                   	push   %eax
c000944d:	ff 75 f4             	pushl  -0xc(%ebp)
c0009450:	e8 09 2a 00 00       	call   c000be5e <Strcpy>
c0009455:	83 c4 10             	add    $0x10,%esp
c0009458:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c000945c:	83 ec 0c             	sub    $0xc,%esp
c000945f:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0009465:	50                   	push   %eax
c0009466:	e8 0d 2a 00 00       	call   c000be78 <Strlen>
c000946b:	83 c4 10             	add    $0x10,%esp
c000946e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009471:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009474:	01 45 f4             	add    %eax,-0xc(%ebp)
c0009477:	e9 9f 00 00 00       	jmp    c000951b <vsprintf+0x192>
c000947c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000947f:	8b 00                	mov    (%eax),%eax
c0009481:	83 ec 08             	sub    $0x8,%esp
c0009484:	50                   	push   %eax
c0009485:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c000948b:	50                   	push   %eax
c000948c:	e8 b6 e9 ff ff       	call   c0007e47 <atoi>
c0009491:	83 c4 10             	add    $0x10,%esp
c0009494:	83 ec 08             	sub    $0x8,%esp
c0009497:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c000949d:	50                   	push   %eax
c000949e:	ff 75 f4             	pushl  -0xc(%ebp)
c00094a1:	e8 b8 29 00 00       	call   c000be5e <Strcpy>
c00094a6:	83 c4 10             	add    $0x10,%esp
c00094a9:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c00094ad:	83 ec 0c             	sub    $0xc,%esp
c00094b0:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c00094b6:	50                   	push   %eax
c00094b7:	e8 bc 29 00 00       	call   c000be78 <Strlen>
c00094bc:	83 c4 10             	add    $0x10,%esp
c00094bf:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00094c2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00094c5:	01 45 f4             	add    %eax,-0xc(%ebp)
c00094c8:	eb 51                	jmp    c000951b <vsprintf+0x192>
c00094ca:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00094cd:	8b 00                	mov    (%eax),%eax
c00094cf:	83 ec 08             	sub    $0x8,%esp
c00094d2:	50                   	push   %eax
c00094d3:	ff 75 f4             	pushl  -0xc(%ebp)
c00094d6:	e8 83 29 00 00       	call   c000be5e <Strcpy>
c00094db:	83 c4 10             	add    $0x10,%esp
c00094de:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00094e1:	8b 00                	mov    (%eax),%eax
c00094e3:	83 ec 0c             	sub    $0xc,%esp
c00094e6:	50                   	push   %eax
c00094e7:	e8 8c 29 00 00       	call   c000be78 <Strlen>
c00094ec:	83 c4 10             	add    $0x10,%esp
c00094ef:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00094f2:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c00094f6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00094f9:	01 45 f4             	add    %eax,-0xc(%ebp)
c00094fc:	eb 1d                	jmp    c000951b <vsprintf+0x192>
c00094fe:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009501:	0f b6 10             	movzbl (%eax),%edx
c0009504:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009507:	88 10                	mov    %dl,(%eax)
c0009509:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c000950d:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0009514:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009517:	01 45 f4             	add    %eax,-0xc(%ebp)
c000951a:	90                   	nop
c000951b:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c000951f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009522:	0f b6 00             	movzbl (%eax),%eax
c0009525:	84 c0                	test   %al,%al
c0009527:	0f 85 9f fe ff ff    	jne    c00093cc <vsprintf+0x43>
c000952d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009530:	2b 45 08             	sub    0x8(%ebp),%eax
c0009533:	c9                   	leave  
c0009534:	c3                   	ret    

c0009535 <printx>:
c0009535:	55                   	push   %ebp
c0009536:	89 e5                	mov    %esp,%ebp
c0009538:	81 ec 18 01 00 00    	sub    $0x118,%esp
c000953e:	8d 45 0c             	lea    0xc(%ebp),%eax
c0009541:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009544:	8b 45 08             	mov    0x8(%ebp),%eax
c0009547:	83 ec 04             	sub    $0x4,%esp
c000954a:	ff 75 f4             	pushl  -0xc(%ebp)
c000954d:	50                   	push   %eax
c000954e:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0009554:	50                   	push   %eax
c0009555:	e8 2f fe ff ff       	call   c0009389 <vsprintf>
c000955a:	83 c4 10             	add    $0x10,%esp
c000955d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009560:	83 ec 08             	sub    $0x8,%esp
c0009563:	ff 75 f0             	pushl  -0x10(%ebp)
c0009566:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c000956c:	50                   	push   %eax
c000956d:	e8 f6 8e ff ff       	call   c0002468 <write_debug>
c0009572:	83 c4 10             	add    $0x10,%esp
c0009575:	90                   	nop
c0009576:	c9                   	leave  
c0009577:	c3                   	ret    

c0009578 <sys_printx>:
c0009578:	55                   	push   %ebp
c0009579:	89 e5                	mov    %esp,%ebp
c000957b:	83 ec 28             	sub    $0x28,%esp
c000957e:	a1 a4 07 01 c0       	mov    0xc00107a4,%eax
c0009583:	85 c0                	test   %eax,%eax
c0009585:	75 15                	jne    c000959c <sys_printx+0x24>
c0009587:	8b 45 10             	mov    0x10(%ebp),%eax
c000958a:	8b 80 78 02 00 00    	mov    0x278(%eax),%eax
c0009590:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009593:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000959a:	eb 10                	jmp    c00095ac <sys_printx+0x34>
c000959c:	a1 a4 07 01 c0       	mov    0xc00107a4,%eax
c00095a1:	85 c0                	test   %eax,%eax
c00095a3:	74 07                	je     c00095ac <sys_printx+0x34>
c00095a5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00095ac:	8b 55 08             	mov    0x8(%ebp),%edx
c00095af:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00095b2:	01 d0                	add    %edx,%eax
c00095b4:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00095b7:	8b 45 10             	mov    0x10(%ebp),%eax
c00095ba:	8b 80 30 01 00 00    	mov    0x130(%eax),%eax
c00095c0:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c00095c6:	05 00 0e 01 c0       	add    $0xc0010e00,%eax
c00095cb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00095ce:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00095d1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00095d4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00095d7:	0f b6 00             	movzbl (%eax),%eax
c00095da:	88 45 e3             	mov    %al,-0x1d(%ebp)
c00095dd:	eb 3a                	jmp    c0009619 <sys_printx+0xa1>
c00095df:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00095e2:	0f b6 00             	movzbl (%eax),%eax
c00095e5:	3c 3b                	cmp    $0x3b,%al
c00095e7:	74 0a                	je     c00095f3 <sys_printx+0x7b>
c00095e9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00095ec:	0f b6 00             	movzbl (%eax),%eax
c00095ef:	3c 3a                	cmp    $0x3a,%al
c00095f1:	75 06                	jne    c00095f9 <sys_printx+0x81>
c00095f3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00095f7:	eb 20                	jmp    c0009619 <sys_printx+0xa1>
c00095f9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00095fc:	0f b6 00             	movzbl (%eax),%eax
c00095ff:	0f b6 c0             	movzbl %al,%eax
c0009602:	83 ec 08             	sub    $0x8,%esp
c0009605:	50                   	push   %eax
c0009606:	ff 75 e4             	pushl  -0x1c(%ebp)
c0009609:	e8 21 b7 ff ff       	call   c0004d2f <out_char>
c000960e:	83 c4 10             	add    $0x10,%esp
c0009611:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0009615:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0009619:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000961d:	7f c0                	jg     c00095df <sys_printx+0x67>
c000961f:	80 7d e3 3b          	cmpb   $0x3b,-0x1d(%ebp)
c0009623:	75 10                	jne    c0009635 <sys_printx+0xbd>
c0009625:	a1 a4 07 01 c0       	mov    0xc00107a4,%eax
c000962a:	85 c0                	test   %eax,%eax
c000962c:	74 13                	je     c0009641 <sys_printx+0xc9>
c000962e:	e8 88 7c ff ff       	call   c00012bb <disable_int>
c0009633:	eb 0c                	jmp    c0009641 <sys_printx+0xc9>
c0009635:	80 7d e3 3a          	cmpb   $0x3a,-0x1d(%ebp)
c0009639:	75 06                	jne    c0009641 <sys_printx+0xc9>
c000963b:	e8 7b 7c ff ff       	call   c00012bb <disable_int>
c0009640:	90                   	nop
c0009641:	90                   	nop
c0009642:	c9                   	leave  
c0009643:	c3                   	ret    

c0009644 <spin>:
c0009644:	55                   	push   %ebp
c0009645:	89 e5                	mov    %esp,%ebp
c0009647:	83 ec 08             	sub    $0x8,%esp
c000964a:	83 ec 0c             	sub    $0xc,%esp
c000964d:	ff 75 08             	pushl  0x8(%ebp)
c0009650:	e8 37 7a ff ff       	call   c000108c <disp_str>
c0009655:	83 c4 10             	add    $0x10,%esp
c0009658:	83 ec 0c             	sub    $0xc,%esp
c000965b:	68 4f b6 00 c0       	push   $0xc000b64f
c0009660:	e8 27 7a ff ff       	call   c000108c <disp_str>
c0009665:	83 c4 10             	add    $0x10,%esp
c0009668:	eb fe                	jmp    c0009668 <spin+0x24>

c000966a <panic>:
c000966a:	55                   	push   %ebp
c000966b:	89 e5                	mov    %esp,%ebp
c000966d:	83 ec 08             	sub    $0x8,%esp
c0009670:	83 ec 04             	sub    $0x4,%esp
c0009673:	ff 75 08             	pushl  0x8(%ebp)
c0009676:	6a 3a                	push   $0x3a
c0009678:	68 3d bb 00 c0       	push   $0xc000bb3d
c000967d:	e8 b3 fe ff ff       	call   c0009535 <printx>
c0009682:	83 c4 10             	add    $0x10,%esp
c0009685:	90                   	nop
c0009686:	c9                   	leave  
c0009687:	c3                   	ret    

c0009688 <assertion_failure>:
c0009688:	55                   	push   %ebp
c0009689:	89 e5                	mov    %esp,%ebp
c000968b:	83 ec 08             	sub    $0x8,%esp
c000968e:	83 ec 08             	sub    $0x8,%esp
c0009691:	ff 75 14             	pushl  0x14(%ebp)
c0009694:	ff 75 10             	pushl  0x10(%ebp)
c0009697:	ff 75 0c             	pushl  0xc(%ebp)
c000969a:	ff 75 08             	pushl  0x8(%ebp)
c000969d:	6a 3b                	push   $0x3b
c000969f:	68 44 bb 00 c0       	push   $0xc000bb44
c00096a4:	e8 8c fe ff ff       	call   c0009535 <printx>
c00096a9:	83 c4 20             	add    $0x20,%esp
c00096ac:	83 ec 0c             	sub    $0xc,%esp
c00096af:	68 77 bb 00 c0       	push   $0xc000bb77
c00096b4:	e8 8b ff ff ff       	call   c0009644 <spin>
c00096b9:	83 c4 10             	add    $0x10,%esp
c00096bc:	90                   	nop
c00096bd:	c9                   	leave  
c00096be:	c3                   	ret    

c00096bf <dead_lock>:
c00096bf:	55                   	push   %ebp
c00096c0:	89 e5                	mov    %esp,%ebp
c00096c2:	b8 00 00 00 00       	mov    $0x0,%eax
c00096c7:	5d                   	pop    %ebp
c00096c8:	c3                   	ret    

c00096c9 <sys_send_msg>:
c00096c9:	55                   	push   %ebp
c00096ca:	89 e5                	mov    %esp,%ebp
c00096cc:	83 ec 38             	sub    $0x38,%esp
c00096cf:	83 ec 0c             	sub    $0xc,%esp
c00096d2:	ff 75 0c             	pushl  0xc(%ebp)
c00096d5:	e8 e2 af ff ff       	call   c00046bc <pid2proc>
c00096da:	83 c4 10             	add    $0x10,%esp
c00096dd:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00096e0:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c00096e4:	74 2c                	je     c0009712 <sys_send_msg+0x49>
c00096e6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00096e9:	8b 80 b0 02 00 00    	mov    0x2b0(%eax),%eax
c00096ef:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c00096f4:	74 1c                	je     c0009712 <sys_send_msg+0x49>
c00096f6:	68 40 05 00 00       	push   $0x540
c00096fb:	68 83 bb 00 c0       	push   $0xc000bb83
c0009700:	68 83 bb 00 c0       	push   $0xc000bb83
c0009705:	68 94 bb 00 c0       	push   $0xc000bb94
c000970a:	e8 79 ff ff ff       	call   c0009688 <assertion_failure>
c000970f:	83 c4 10             	add    $0x10,%esp
c0009712:	8b 45 10             	mov    0x10(%ebp),%eax
c0009715:	8b 80 b0 02 00 00    	mov    0x2b0(%eax),%eax
c000971b:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0009720:	74 1c                	je     c000973e <sys_send_msg+0x75>
c0009722:	68 42 05 00 00       	push   $0x542
c0009727:	68 83 bb 00 c0       	push   $0xc000bb83
c000972c:	68 83 bb 00 c0       	push   $0xc000bb83
c0009731:	68 bc bb 00 c0       	push   $0xc000bbbc
c0009736:	e8 4d ff ff ff       	call   c0009688 <assertion_failure>
c000973b:	83 c4 10             	add    $0x10,%esp
c000973e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0009742:	75 22                	jne    c0009766 <sys_send_msg+0x9d>
c0009744:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0009748:	75 1c                	jne    c0009766 <sys_send_msg+0x9d>
c000974a:	68 45 05 00 00       	push   $0x545
c000974f:	68 83 bb 00 c0       	push   $0xc000bb83
c0009754:	68 83 bb 00 c0       	push   $0xc000bb83
c0009759:	68 df bb 00 c0       	push   $0xc000bbdf
c000975e:	e8 25 ff ff ff       	call   c0009688 <assertion_failure>
c0009763:	83 c4 10             	add    $0x10,%esp
c0009766:	83 ec 0c             	sub    $0xc,%esp
c0009769:	ff 75 10             	pushl  0x10(%ebp)
c000976c:	e8 bd af ff ff       	call   c000472e <proc2pid>
c0009771:	83 c4 10             	add    $0x10,%esp
c0009774:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0009777:	8b 45 10             	mov    0x10(%ebp),%eax
c000977a:	8b 80 78 02 00 00    	mov    0x278(%eax),%eax
c0009780:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0009783:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c000978a:	8b 45 08             	mov    0x8(%ebp),%eax
c000978d:	83 ec 08             	sub    $0x8,%esp
c0009790:	6a 7c                	push   $0x7c
c0009792:	50                   	push   %eax
c0009793:	e8 6f d5 ff ff       	call   c0006d07 <alloc_virtual_memory>
c0009798:	83 c4 10             	add    $0x10,%esp
c000979b:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000979e:	c7 45 d8 7c 00 00 00 	movl   $0x7c,-0x28(%ebp)
c00097a5:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00097a8:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00097ab:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00097ae:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00097b1:	89 10                	mov    %edx,(%eax)
c00097b3:	83 ec 08             	sub    $0x8,%esp
c00097b6:	ff 75 0c             	pushl  0xc(%ebp)
c00097b9:	ff 75 e8             	pushl  -0x18(%ebp)
c00097bc:	e8 fe fe ff ff       	call   c00096bf <dead_lock>
c00097c1:	83 c4 10             	add    $0x10,%esp
c00097c4:	83 f8 01             	cmp    $0x1,%eax
c00097c7:	75 10                	jne    c00097d9 <sys_send_msg+0x110>
c00097c9:	83 ec 0c             	sub    $0xc,%esp
c00097cc:	68 ef bb 00 c0       	push   $0xc000bbef
c00097d1:	e8 94 fe ff ff       	call   c000966a <panic>
c00097d6:	83 c4 10             	add    $0x10,%esp
c00097d9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00097dc:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c00097e3:	3c 02                	cmp    $0x2,%al
c00097e5:	0f 85 99 01 00 00    	jne    c0009984 <sys_send_msg+0x2bb>
c00097eb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00097ee:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c00097f4:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c00097f7:	74 12                	je     c000980b <sys_send_msg+0x142>
c00097f9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00097fc:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0009802:	83 f8 12             	cmp    $0x12,%eax
c0009805:	0f 85 79 01 00 00    	jne    c0009984 <sys_send_msg+0x2bb>
c000980b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000980e:	8b 80 78 02 00 00    	mov    0x278(%eax),%eax
c0009814:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0009817:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000981a:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009820:	83 ec 08             	sub    $0x8,%esp
c0009823:	6a 7c                	push   $0x7c
c0009825:	50                   	push   %eax
c0009826:	e8 dc d4 ff ff       	call   c0006d07 <alloc_virtual_memory>
c000982b:	83 c4 10             	add    $0x10,%esp
c000982e:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0009831:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0009834:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0009837:	83 ec 04             	sub    $0x4,%esp
c000983a:	ff 75 d8             	pushl  -0x28(%ebp)
c000983d:	52                   	push   %edx
c000983e:	50                   	push   %eax
c000983f:	e8 c0 e2 ff ff       	call   c0007b04 <Memcpy>
c0009844:	83 c4 10             	add    $0x10,%esp
c0009847:	8b 45 10             	mov    0x10(%ebp),%eax
c000984a:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c0009851:	00 00 00 
c0009854:	8b 45 10             	mov    0x10(%ebp),%eax
c0009857:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c000985e:	8b 45 10             	mov    0x10(%ebp),%eax
c0009861:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c0009868:	00 00 00 
c000986b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000986e:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c0009875:	00 00 00 
c0009878:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000987b:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0009882:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009885:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c000988c:	00 00 00 
c000988f:	8b 45 10             	mov    0x10(%ebp),%eax
c0009892:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c0009899:	00 00 00 
c000989c:	83 ec 0c             	sub    $0xc,%esp
c000989f:	ff 75 ec             	pushl  -0x14(%ebp)
c00098a2:	e8 56 08 00 00       	call   c000a0fd <unblock>
c00098a7:	83 c4 10             	add    $0x10,%esp
c00098aa:	8b 45 10             	mov    0x10(%ebp),%eax
c00098ad:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c00098b4:	84 c0                	test   %al,%al
c00098b6:	74 1c                	je     c00098d4 <sys_send_msg+0x20b>
c00098b8:	68 76 05 00 00       	push   $0x576
c00098bd:	68 83 bb 00 c0       	push   $0xc000bb83
c00098c2:	68 83 bb 00 c0       	push   $0xc000bb83
c00098c7:	68 fa bb 00 c0       	push   $0xc000bbfa
c00098cc:	e8 b7 fd ff ff       	call   c0009688 <assertion_failure>
c00098d1:	83 c4 10             	add    $0x10,%esp
c00098d4:	8b 45 10             	mov    0x10(%ebp),%eax
c00098d7:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c00098dd:	83 f8 21             	cmp    $0x21,%eax
c00098e0:	74 1c                	je     c00098fe <sys_send_msg+0x235>
c00098e2:	68 77 05 00 00       	push   $0x577
c00098e7:	68 83 bb 00 c0       	push   $0xc000bb83
c00098ec:	68 83 bb 00 c0       	push   $0xc000bb83
c00098f1:	68 0e bc 00 c0       	push   $0xc000bc0e
c00098f6:	e8 8d fd ff ff       	call   c0009688 <assertion_failure>
c00098fb:	83 c4 10             	add    $0x10,%esp
c00098fe:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009901:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009907:	85 c0                	test   %eax,%eax
c0009909:	74 1c                	je     c0009927 <sys_send_msg+0x25e>
c000990b:	68 79 05 00 00       	push   $0x579
c0009910:	68 83 bb 00 c0       	push   $0xc000bb83
c0009915:	68 83 bb 00 c0       	push   $0xc000bb83
c000991a:	68 2b bc 00 c0       	push   $0xc000bc2b
c000991f:	e8 64 fd ff ff       	call   c0009688 <assertion_failure>
c0009924:	83 c4 10             	add    $0x10,%esp
c0009927:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000992a:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009931:	84 c0                	test   %al,%al
c0009933:	74 1c                	je     c0009951 <sys_send_msg+0x288>
c0009935:	68 7a 05 00 00       	push   $0x57a
c000993a:	68 83 bb 00 c0       	push   $0xc000bb83
c000993f:	68 83 bb 00 c0       	push   $0xc000bb83
c0009944:	68 40 bc 00 c0       	push   $0xc000bc40
c0009949:	e8 3a fd ff ff       	call   c0009688 <assertion_failure>
c000994e:	83 c4 10             	add    $0x10,%esp
c0009951:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009954:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c000995a:	83 f8 21             	cmp    $0x21,%eax
c000995d:	0f 84 45 01 00 00    	je     c0009aa8 <sys_send_msg+0x3df>
c0009963:	68 7b 05 00 00       	push   $0x57b
c0009968:	68 83 bb 00 c0       	push   $0xc000bb83
c000996d:	68 83 bb 00 c0       	push   $0xc000bb83
c0009972:	68 58 bc 00 c0       	push   $0xc000bc58
c0009977:	e8 0c fd ff ff       	call   c0009688 <assertion_failure>
c000997c:	83 c4 10             	add    $0x10,%esp
c000997f:	e9 24 01 00 00       	jmp    c0009aa8 <sys_send_msg+0x3df>
c0009984:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000998b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000998e:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0009991:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009994:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c000999a:	85 c0                	test   %eax,%eax
c000999c:	75 1b                	jne    c00099b9 <sys_send_msg+0x2f0>
c000999e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00099a1:	8b 55 10             	mov    0x10(%ebp),%edx
c00099a4:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c00099aa:	8b 45 10             	mov    0x10(%ebp),%eax
c00099ad:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c00099b4:	00 00 00 
c00099b7:	eb 3f                	jmp    c00099f8 <sys_send_msg+0x32f>
c00099b9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00099bc:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c00099c2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00099c5:	eb 12                	jmp    c00099d9 <sys_send_msg+0x310>
c00099c7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00099ca:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00099cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00099d0:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c00099d6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00099d9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c00099dd:	75 e8                	jne    c00099c7 <sys_send_msg+0x2fe>
c00099df:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00099e2:	8b 55 10             	mov    0x10(%ebp),%edx
c00099e5:	89 90 5c 02 00 00    	mov    %edx,0x25c(%eax)
c00099eb:	8b 45 10             	mov    0x10(%ebp),%eax
c00099ee:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c00099f5:	00 00 00 
c00099f8:	8b 45 10             	mov    0x10(%ebp),%eax
c00099fb:	8b 55 08             	mov    0x8(%ebp),%edx
c00099fe:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c0009a04:	8b 45 10             	mov    0x10(%ebp),%eax
c0009a07:	8b 55 0c             	mov    0xc(%ebp),%edx
c0009a0a:	89 90 50 02 00 00    	mov    %edx,0x250(%eax)
c0009a10:	8b 45 10             	mov    0x10(%ebp),%eax
c0009a13:	c6 80 48 02 00 00 01 	movb   $0x1,0x248(%eax)
c0009a1a:	8b 45 10             	mov    0x10(%ebp),%eax
c0009a1d:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009a24:	3c 01                	cmp    $0x1,%al
c0009a26:	74 1c                	je     c0009a44 <sys_send_msg+0x37b>
c0009a28:	68 9c 05 00 00       	push   $0x59c
c0009a2d:	68 83 bb 00 c0       	push   $0xc000bb83
c0009a32:	68 83 bb 00 c0       	push   $0xc000bb83
c0009a37:	68 7c bc 00 c0       	push   $0xc000bc7c
c0009a3c:	e8 47 fc ff ff       	call   c0009688 <assertion_failure>
c0009a41:	83 c4 10             	add    $0x10,%esp
c0009a44:	8b 45 10             	mov    0x10(%ebp),%eax
c0009a47:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009a4d:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0009a50:	74 1c                	je     c0009a6e <sys_send_msg+0x3a5>
c0009a52:	68 9d 05 00 00       	push   $0x59d
c0009a57:	68 83 bb 00 c0       	push   $0xc000bb83
c0009a5c:	68 83 bb 00 c0       	push   $0xc000bb83
c0009a61:	68 98 bc 00 c0       	push   $0xc000bc98
c0009a66:	e8 1d fc ff ff       	call   c0009688 <assertion_failure>
c0009a6b:	83 c4 10             	add    $0x10,%esp
c0009a6e:	8b 45 10             	mov    0x10(%ebp),%eax
c0009a71:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009a77:	39 45 08             	cmp    %eax,0x8(%ebp)
c0009a7a:	74 1c                	je     c0009a98 <sys_send_msg+0x3cf>
c0009a7c:	68 9e 05 00 00       	push   $0x59e
c0009a81:	68 83 bb 00 c0       	push   $0xc000bb83
c0009a86:	68 83 bb 00 c0       	push   $0xc000bb83
c0009a8b:	68 ba bc 00 c0       	push   $0xc000bcba
c0009a90:	e8 f3 fb ff ff       	call   c0009688 <assertion_failure>
c0009a95:	83 c4 10             	add    $0x10,%esp
c0009a98:	83 ec 0c             	sub    $0xc,%esp
c0009a9b:	ff 75 10             	pushl  0x10(%ebp)
c0009a9e:	e8 1e 06 00 00       	call   c000a0c1 <block>
c0009aa3:	83 c4 10             	add    $0x10,%esp
c0009aa6:	eb 01                	jmp    c0009aa9 <sys_send_msg+0x3e0>
c0009aa8:	90                   	nop
c0009aa9:	b8 00 00 00 00       	mov    $0x0,%eax
c0009aae:	c9                   	leave  
c0009aaf:	c3                   	ret    

c0009ab0 <sys_receive_msg>:
c0009ab0:	55                   	push   %ebp
c0009ab1:	89 e5                	mov    %esp,%ebp
c0009ab3:	83 ec 48             	sub    $0x48,%esp
c0009ab6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0009abd:	83 ec 0c             	sub    $0xc,%esp
c0009ac0:	ff 75 0c             	pushl  0xc(%ebp)
c0009ac3:	e8 f4 ab ff ff       	call   c00046bc <pid2proc>
c0009ac8:	83 c4 10             	add    $0x10,%esp
c0009acb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0009ace:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0009ad2:	74 2c                	je     c0009b00 <sys_receive_msg+0x50>
c0009ad4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009ad7:	8b 80 b0 02 00 00    	mov    0x2b0(%eax),%eax
c0009add:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0009ae2:	74 1c                	je     c0009b00 <sys_receive_msg+0x50>
c0009ae4:	68 b2 05 00 00       	push   $0x5b2
c0009ae9:	68 83 bb 00 c0       	push   $0xc000bb83
c0009aee:	68 83 bb 00 c0       	push   $0xc000bb83
c0009af3:	68 bc bb 00 c0       	push   $0xc000bbbc
c0009af8:	e8 8b fb ff ff       	call   c0009688 <assertion_failure>
c0009afd:	83 c4 10             	add    $0x10,%esp
c0009b00:	8b 45 10             	mov    0x10(%ebp),%eax
c0009b03:	8b 80 b0 02 00 00    	mov    0x2b0(%eax),%eax
c0009b09:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0009b0e:	74 1c                	je     c0009b2c <sys_receive_msg+0x7c>
c0009b10:	68 b4 05 00 00       	push   $0x5b4
c0009b15:	68 83 bb 00 c0       	push   $0xc000bb83
c0009b1a:	68 83 bb 00 c0       	push   $0xc000bb83
c0009b1f:	68 94 bb 00 c0       	push   $0xc000bb94
c0009b24:	e8 5f fb ff ff       	call   c0009688 <assertion_failure>
c0009b29:	83 c4 10             	add    $0x10,%esp
c0009b2c:	83 ec 0c             	sub    $0xc,%esp
c0009b2f:	ff 75 10             	pushl  0x10(%ebp)
c0009b32:	e8 f7 ab ff ff       	call   c000472e <proc2pid>
c0009b37:	83 c4 10             	add    $0x10,%esp
c0009b3a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0009b3d:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0009b44:	8b 45 10             	mov    0x10(%ebp),%eax
c0009b47:	8b 80 60 02 00 00    	mov    0x260(%eax),%eax
c0009b4d:	85 c0                	test   %eax,%eax
c0009b4f:	0f 84 c6 00 00 00    	je     c0009c1b <sys_receive_msg+0x16b>
c0009b55:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0009b59:	74 0d                	je     c0009b68 <sys_receive_msg+0xb8>
c0009b5b:	81 7d 0c 13 02 00 00 	cmpl   $0x213,0xc(%ebp)
c0009b62:	0f 85 b3 00 00 00    	jne    c0009c1b <sys_receive_msg+0x16b>
c0009b68:	c7 45 dc 7c 00 00 00 	movl   $0x7c,-0x24(%ebp)
c0009b6f:	83 ec 0c             	sub    $0xc,%esp
c0009b72:	ff 75 dc             	pushl  -0x24(%ebp)
c0009b75:	e8 4a 89 ff ff       	call   c00024c4 <sys_malloc>
c0009b7a:	83 c4 10             	add    $0x10,%esp
c0009b7d:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0009b80:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0009b83:	83 ec 04             	sub    $0x4,%esp
c0009b86:	50                   	push   %eax
c0009b87:	6a 00                	push   $0x0
c0009b89:	ff 75 d8             	pushl  -0x28(%ebp)
c0009b8c:	e8 ae 22 00 00       	call   c000be3f <Memset>
c0009b91:	83 c4 10             	add    $0x10,%esp
c0009b94:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0009b97:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c0009b9d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0009ba0:	c7 40 78 d5 07 00 00 	movl   $0x7d5,0x78(%eax)
c0009ba7:	8b 45 08             	mov    0x8(%ebp),%eax
c0009baa:	83 ec 08             	sub    $0x8,%esp
c0009bad:	ff 75 dc             	pushl  -0x24(%ebp)
c0009bb0:	50                   	push   %eax
c0009bb1:	e8 51 d1 ff ff       	call   c0006d07 <alloc_virtual_memory>
c0009bb6:	83 c4 10             	add    $0x10,%esp
c0009bb9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0009bbc:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0009bbf:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0009bc2:	83 ec 04             	sub    $0x4,%esp
c0009bc5:	52                   	push   %edx
c0009bc6:	ff 75 d8             	pushl  -0x28(%ebp)
c0009bc9:	50                   	push   %eax
c0009bca:	e8 35 df ff ff       	call   c0007b04 <Memcpy>
c0009bcf:	83 c4 10             	add    $0x10,%esp
c0009bd2:	8b 45 10             	mov    0x10(%ebp),%eax
c0009bd5:	c7 80 60 02 00 00 00 	movl   $0x0,0x260(%eax)
c0009bdc:	00 00 00 
c0009bdf:	8b 45 10             	mov    0x10(%ebp),%eax
c0009be2:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c0009be9:	00 00 00 
c0009bec:	8b 45 10             	mov    0x10(%ebp),%eax
c0009bef:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c0009bf6:	00 00 00 
c0009bf9:	8b 45 10             	mov    0x10(%ebp),%eax
c0009bfc:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0009c03:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c0009c0a:	83 ec 08             	sub    $0x8,%esp
c0009c0d:	ff 75 dc             	pushl  -0x24(%ebp)
c0009c10:	ff 75 d8             	pushl  -0x28(%ebp)
c0009c13:	e8 c1 88 ff ff       	call   c00024d9 <sys_free>
c0009c18:	83 c4 10             	add    $0x10,%esp
c0009c1b:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c0009c1f:	0f 84 96 03 00 00    	je     c0009fbb <sys_receive_msg+0x50b>
c0009c25:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0009c29:	75 26                	jne    c0009c51 <sys_receive_msg+0x1a1>
c0009c2b:	8b 45 10             	mov    0x10(%ebp),%eax
c0009c2e:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0009c34:	85 c0                	test   %eax,%eax
c0009c36:	0f 84 8a 00 00 00    	je     c0009cc6 <sys_receive_msg+0x216>
c0009c3c:	8b 45 10             	mov    0x10(%ebp),%eax
c0009c3f:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0009c45:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009c48:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0009c4f:	eb 75                	jmp    c0009cc6 <sys_receive_msg+0x216>
c0009c51:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0009c55:	78 6f                	js     c0009cc6 <sys_receive_msg+0x216>
c0009c57:	83 7d 0c 07          	cmpl   $0x7,0xc(%ebp)
c0009c5b:	7f 69                	jg     c0009cc6 <sys_receive_msg+0x216>
c0009c5d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009c60:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009c67:	3c 01                	cmp    $0x1,%al
c0009c69:	75 5b                	jne    c0009cc6 <sys_receive_msg+0x216>
c0009c6b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009c6e:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009c74:	83 f8 12             	cmp    $0x12,%eax
c0009c77:	74 0e                	je     c0009c87 <sys_receive_msg+0x1d7>
c0009c79:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009c7c:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009c82:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c0009c85:	75 3f                	jne    c0009cc6 <sys_receive_msg+0x216>
c0009c87:	8b 45 10             	mov    0x10(%ebp),%eax
c0009c8a:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0009c90:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009c93:	eb 2b                	jmp    c0009cc0 <sys_receive_msg+0x210>
c0009c95:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009c98:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009c9b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009c9e:	8b 90 24 01 00 00    	mov    0x124(%eax),%edx
c0009ca4:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009ca7:	39 c2                	cmp    %eax,%edx
c0009ca9:	75 09                	jne    c0009cb4 <sys_receive_msg+0x204>
c0009cab:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0009cb2:	eb 12                	jmp    c0009cc6 <sys_receive_msg+0x216>
c0009cb4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009cb7:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c0009cbd:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009cc0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0009cc4:	75 cf                	jne    c0009c95 <sys_receive_msg+0x1e5>
c0009cc6:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0009cca:	0f 85 21 02 00 00    	jne    c0009ef1 <sys_receive_msg+0x441>
c0009cd0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009cd3:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0009cd6:	8b 45 08             	mov    0x8(%ebp),%eax
c0009cd9:	83 ec 08             	sub    $0x8,%esp
c0009cdc:	6a 7c                	push   $0x7c
c0009cde:	50                   	push   %eax
c0009cdf:	e8 23 d0 ff ff       	call   c0006d07 <alloc_virtual_memory>
c0009ce4:	83 c4 10             	add    $0x10,%esp
c0009ce7:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0009cea:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009ced:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009cf3:	83 ec 08             	sub    $0x8,%esp
c0009cf6:	6a 7c                	push   $0x7c
c0009cf8:	50                   	push   %eax
c0009cf9:	e8 09 d0 ff ff       	call   c0006d07 <alloc_virtual_memory>
c0009cfe:	83 c4 10             	add    $0x10,%esp
c0009d01:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0009d04:	83 ec 04             	sub    $0x4,%esp
c0009d07:	6a 7c                	push   $0x7c
c0009d09:	ff 75 c8             	pushl  -0x38(%ebp)
c0009d0c:	ff 75 cc             	pushl  -0x34(%ebp)
c0009d0f:	e8 f0 dd ff ff       	call   c0007b04 <Memcpy>
c0009d14:	83 c4 10             	add    $0x10,%esp
c0009d17:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0009d1a:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0009d1d:	8b 45 10             	mov    0x10(%ebp),%eax
c0009d20:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0009d26:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0009d29:	75 21                	jne    c0009d4c <sys_receive_msg+0x29c>
c0009d2b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009d2e:	8b 90 5c 02 00 00    	mov    0x25c(%eax),%edx
c0009d34:	8b 45 10             	mov    0x10(%ebp),%eax
c0009d37:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c0009d3d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009d40:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c0009d47:	00 00 00 
c0009d4a:	eb 1f                	jmp    c0009d6b <sys_receive_msg+0x2bb>
c0009d4c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009d4f:	8b 90 5c 02 00 00    	mov    0x25c(%eax),%edx
c0009d55:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009d58:	89 90 5c 02 00 00    	mov    %edx,0x25c(%eax)
c0009d5e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009d61:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c0009d68:	00 00 00 
c0009d6b:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009d6e:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c0009d75:	00 00 00 
c0009d78:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009d7b:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0009d82:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009d85:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c0009d8c:	00 00 00 
c0009d8f:	8b 45 10             	mov    0x10(%ebp),%eax
c0009d92:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c0009d99:	00 00 00 
c0009d9c:	8b 45 10             	mov    0x10(%ebp),%eax
c0009d9f:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c0009da6:	00 00 00 
c0009da9:	8b 45 10             	mov    0x10(%ebp),%eax
c0009dac:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c0009db3:	00 00 00 
c0009db6:	83 ec 0c             	sub    $0xc,%esp
c0009db9:	ff 75 d0             	pushl  -0x30(%ebp)
c0009dbc:	e8 3c 03 00 00       	call   c000a0fd <unblock>
c0009dc1:	83 c4 10             	add    $0x10,%esp
c0009dc4:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009dc7:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009dcd:	85 c0                	test   %eax,%eax
c0009dcf:	74 1c                	je     c0009ded <sys_receive_msg+0x33d>
c0009dd1:	68 1e 06 00 00       	push   $0x61e
c0009dd6:	68 83 bb 00 c0       	push   $0xc000bb83
c0009ddb:	68 83 bb 00 c0       	push   $0xc000bb83
c0009de0:	68 cf bc 00 c0       	push   $0xc000bccf
c0009de5:	e8 9e f8 ff ff       	call   c0009688 <assertion_failure>
c0009dea:	83 c4 10             	add    $0x10,%esp
c0009ded:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009df0:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009df7:	84 c0                	test   %al,%al
c0009df9:	74 1c                	je     c0009e17 <sys_receive_msg+0x367>
c0009dfb:	68 1f 06 00 00       	push   $0x61f
c0009e00:	68 83 bb 00 c0       	push   $0xc000bb83
c0009e05:	68 83 bb 00 c0       	push   $0xc000bb83
c0009e0a:	68 e7 bc 00 c0       	push   $0xc000bce7
c0009e0f:	e8 74 f8 ff ff       	call   c0009688 <assertion_failure>
c0009e14:	83 c4 10             	add    $0x10,%esp
c0009e17:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009e1a:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009e20:	83 f8 21             	cmp    $0x21,%eax
c0009e23:	74 1c                	je     c0009e41 <sys_receive_msg+0x391>
c0009e25:	68 20 06 00 00       	push   $0x620
c0009e2a:	68 83 bb 00 c0       	push   $0xc000bb83
c0009e2f:	68 83 bb 00 c0       	push   $0xc000bb83
c0009e34:	68 00 bd 00 c0       	push   $0xc000bd00
c0009e39:	e8 4a f8 ff ff       	call   c0009688 <assertion_failure>
c0009e3e:	83 c4 10             	add    $0x10,%esp
c0009e41:	8b 45 10             	mov    0x10(%ebp),%eax
c0009e44:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009e4a:	85 c0                	test   %eax,%eax
c0009e4c:	74 1c                	je     c0009e6a <sys_receive_msg+0x3ba>
c0009e4e:	68 22 06 00 00       	push   $0x622
c0009e53:	68 83 bb 00 c0       	push   $0xc000bb83
c0009e58:	68 83 bb 00 c0       	push   $0xc000bb83
c0009e5d:	68 2b bc 00 c0       	push   $0xc000bc2b
c0009e62:	e8 21 f8 ff ff       	call   c0009688 <assertion_failure>
c0009e67:	83 c4 10             	add    $0x10,%esp
c0009e6a:	8b 45 10             	mov    0x10(%ebp),%eax
c0009e6d:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009e74:	84 c0                	test   %al,%al
c0009e76:	74 1c                	je     c0009e94 <sys_receive_msg+0x3e4>
c0009e78:	68 23 06 00 00       	push   $0x623
c0009e7d:	68 83 bb 00 c0       	push   $0xc000bb83
c0009e82:	68 83 bb 00 c0       	push   $0xc000bb83
c0009e87:	68 40 bc 00 c0       	push   $0xc000bc40
c0009e8c:	e8 f7 f7 ff ff       	call   c0009688 <assertion_failure>
c0009e91:	83 c4 10             	add    $0x10,%esp
c0009e94:	8b 45 10             	mov    0x10(%ebp),%eax
c0009e97:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0009e9d:	83 f8 21             	cmp    $0x21,%eax
c0009ea0:	74 1c                	je     c0009ebe <sys_receive_msg+0x40e>
c0009ea2:	68 24 06 00 00       	push   $0x624
c0009ea7:	68 83 bb 00 c0       	push   $0xc000bb83
c0009eac:	68 83 bb 00 c0       	push   $0xc000bb83
c0009eb1:	68 58 bc 00 c0       	push   $0xc000bc58
c0009eb6:	e8 cd f7 ff ff       	call   c0009688 <assertion_failure>
c0009ebb:	83 c4 10             	add    $0x10,%esp
c0009ebe:	8b 45 10             	mov    0x10(%ebp),%eax
c0009ec1:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009ec7:	83 f8 21             	cmp    $0x21,%eax
c0009eca:	0f 84 e4 00 00 00    	je     c0009fb4 <sys_receive_msg+0x504>
c0009ed0:	68 25 06 00 00       	push   $0x625
c0009ed5:	68 83 bb 00 c0       	push   $0xc000bb83
c0009eda:	68 83 bb 00 c0       	push   $0xc000bb83
c0009edf:	68 24 bd 00 c0       	push   $0xc000bd24
c0009ee4:	e8 9f f7 ff ff       	call   c0009688 <assertion_failure>
c0009ee9:	83 c4 10             	add    $0x10,%esp
c0009eec:	e9 c3 00 00 00       	jmp    c0009fb4 <sys_receive_msg+0x504>
c0009ef1:	8b 45 10             	mov    0x10(%ebp),%eax
c0009ef4:	c6 80 48 02 00 00 02 	movb   $0x2,0x248(%eax)
c0009efb:	8b 45 10             	mov    0x10(%ebp),%eax
c0009efe:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009f05:	3c 02                	cmp    $0x2,%al
c0009f07:	74 1c                	je     c0009f25 <sys_receive_msg+0x475>
c0009f09:	68 2a 06 00 00       	push   $0x62a
c0009f0e:	68 83 bb 00 c0       	push   $0xc000bb83
c0009f13:	68 83 bb 00 c0       	push   $0xc000bb83
c0009f18:	68 43 bd 00 c0       	push   $0xc000bd43
c0009f1d:	e8 66 f7 ff ff       	call   c0009688 <assertion_failure>
c0009f22:	83 c4 10             	add    $0x10,%esp
c0009f25:	8b 45 10             	mov    0x10(%ebp),%eax
c0009f28:	8b 55 08             	mov    0x8(%ebp),%edx
c0009f2b:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c0009f31:	8b 45 10             	mov    0x10(%ebp),%eax
c0009f34:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009f3b:	3c 02                	cmp    $0x2,%al
c0009f3d:	74 1c                	je     c0009f5b <sys_receive_msg+0x4ab>
c0009f3f:	68 2c 06 00 00       	push   $0x62c
c0009f44:	68 83 bb 00 c0       	push   $0xc000bb83
c0009f49:	68 83 bb 00 c0       	push   $0xc000bb83
c0009f4e:	68 43 bd 00 c0       	push   $0xc000bd43
c0009f53:	e8 30 f7 ff ff       	call   c0009688 <assertion_failure>
c0009f58:	83 c4 10             	add    $0x10,%esp
c0009f5b:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0009f5f:	75 0f                	jne    c0009f70 <sys_receive_msg+0x4c0>
c0009f61:	8b 45 10             	mov    0x10(%ebp),%eax
c0009f64:	c7 80 54 02 00 00 12 	movl   $0x12,0x254(%eax)
c0009f6b:	00 00 00 
c0009f6e:	eb 0c                	jmp    c0009f7c <sys_receive_msg+0x4cc>
c0009f70:	8b 45 10             	mov    0x10(%ebp),%eax
c0009f73:	8b 55 0c             	mov    0xc(%ebp),%edx
c0009f76:	89 90 54 02 00 00    	mov    %edx,0x254(%eax)
c0009f7c:	8b 45 10             	mov    0x10(%ebp),%eax
c0009f7f:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009f86:	3c 02                	cmp    $0x2,%al
c0009f88:	74 1c                	je     c0009fa6 <sys_receive_msg+0x4f6>
c0009f8a:	68 37 06 00 00       	push   $0x637
c0009f8f:	68 83 bb 00 c0       	push   $0xc000bb83
c0009f94:	68 83 bb 00 c0       	push   $0xc000bb83
c0009f99:	68 43 bd 00 c0       	push   $0xc000bd43
c0009f9e:	e8 e5 f6 ff ff       	call   c0009688 <assertion_failure>
c0009fa3:	83 c4 10             	add    $0x10,%esp
c0009fa6:	83 ec 0c             	sub    $0xc,%esp
c0009fa9:	ff 75 10             	pushl  0x10(%ebp)
c0009fac:	e8 10 01 00 00       	call   c000a0c1 <block>
c0009fb1:	83 c4 10             	add    $0x10,%esp
c0009fb4:	b8 00 00 00 00       	mov    $0x0,%eax
c0009fb9:	eb 02                	jmp    c0009fbd <sys_receive_msg+0x50d>
c0009fbb:	90                   	nop
c0009fbc:	90                   	nop
c0009fbd:	c9                   	leave  
c0009fbe:	c3                   	ret    

c0009fbf <disp_str_colour_debug>:
c0009fbf:	55                   	push   %ebp
c0009fc0:	89 e5                	mov    %esp,%ebp
c0009fc2:	90                   	nop
c0009fc3:	5d                   	pop    %ebp
c0009fc4:	c3                   	ret    

c0009fc5 <send_rec>:
c0009fc5:	55                   	push   %ebp
c0009fc6:	89 e5                	mov    %esp,%ebp
c0009fc8:	83 ec 18             	sub    $0x18,%esp
c0009fcb:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009fce:	83 ec 0c             	sub    $0xc,%esp
c0009fd1:	50                   	push   %eax
c0009fd2:	e8 7a ce ff ff       	call   c0006e51 <get_physical_address>
c0009fd7:	83 c4 10             	add    $0x10,%esp
c0009fda:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009fdd:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c0009fe1:	74 28                	je     c000a00b <send_rec+0x46>
c0009fe3:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0009fe7:	74 22                	je     c000a00b <send_rec+0x46>
c0009fe9:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c0009fed:	74 1c                	je     c000a00b <send_rec+0x46>
c0009fef:	68 57 06 00 00       	push   $0x657
c0009ff4:	68 83 bb 00 c0       	push   $0xc000bb83
c0009ff9:	68 83 bb 00 c0       	push   $0xc000bb83
c0009ffe:	68 64 bd 00 c0       	push   $0xc000bd64
c000a003:	e8 80 f6 ff ff       	call   c0009688 <assertion_failure>
c000a008:	83 c4 10             	add    $0x10,%esp
c000a00b:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c000a00f:	75 12                	jne    c000a023 <send_rec+0x5e>
c000a011:	83 ec 04             	sub    $0x4,%esp
c000a014:	6a 7c                	push   $0x7c
c000a016:	6a 00                	push   $0x0
c000a018:	ff 75 0c             	pushl  0xc(%ebp)
c000a01b:	e8 1f 1e 00 00       	call   c000be3f <Memset>
c000a020:	83 c4 10             	add    $0x10,%esp
c000a023:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c000a027:	74 23                	je     c000a04c <send_rec+0x87>
c000a029:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c000a02d:	74 34                	je     c000a063 <send_rec+0x9e>
c000a02f:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c000a033:	75 72                	jne    c000a0a7 <send_rec+0xe2>
c000a035:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a038:	83 ec 08             	sub    $0x8,%esp
c000a03b:	ff 75 10             	pushl  0x10(%ebp)
c000a03e:	50                   	push   %eax
c000a03f:	e8 44 84 ff ff       	call   c0002488 <send_msg>
c000a044:	83 c4 10             	add    $0x10,%esp
c000a047:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a04a:	eb 6e                	jmp    c000a0ba <send_rec+0xf5>
c000a04c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a04f:	83 ec 08             	sub    $0x8,%esp
c000a052:	ff 75 10             	pushl  0x10(%ebp)
c000a055:	50                   	push   %eax
c000a056:	e8 53 84 ff ff       	call   c00024ae <receive_msg>
c000a05b:	83 c4 10             	add    $0x10,%esp
c000a05e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a061:	eb 57                	jmp    c000a0ba <send_rec+0xf5>
c000a063:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a066:	83 ec 08             	sub    $0x8,%esp
c000a069:	ff 75 10             	pushl  0x10(%ebp)
c000a06c:	50                   	push   %eax
c000a06d:	e8 16 84 ff ff       	call   c0002488 <send_msg>
c000a072:	83 c4 10             	add    $0x10,%esp
c000a075:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a078:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000a07c:	75 3b                	jne    c000a0b9 <send_rec+0xf4>
c000a07e:	83 ec 04             	sub    $0x4,%esp
c000a081:	6a 7c                	push   $0x7c
c000a083:	6a 00                	push   $0x0
c000a085:	ff 75 0c             	pushl  0xc(%ebp)
c000a088:	e8 b2 1d 00 00       	call   c000be3f <Memset>
c000a08d:	83 c4 10             	add    $0x10,%esp
c000a090:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a093:	83 ec 08             	sub    $0x8,%esp
c000a096:	ff 75 10             	pushl  0x10(%ebp)
c000a099:	50                   	push   %eax
c000a09a:	e8 0f 84 ff ff       	call   c00024ae <receive_msg>
c000a09f:	83 c4 10             	add    $0x10,%esp
c000a0a2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a0a5:	eb 12                	jmp    c000a0b9 <send_rec+0xf4>
c000a0a7:	83 ec 0c             	sub    $0xc,%esp
c000a0aa:	68 a0 bd 00 c0       	push   $0xc000bda0
c000a0af:	e8 b6 f5 ff ff       	call   c000966a <panic>
c000a0b4:	83 c4 10             	add    $0x10,%esp
c000a0b7:	eb 01                	jmp    c000a0ba <send_rec+0xf5>
c000a0b9:	90                   	nop
c000a0ba:	b8 00 00 00 00       	mov    $0x0,%eax
c000a0bf:	c9                   	leave  
c000a0c0:	c3                   	ret    

c000a0c1 <block>:
c000a0c1:	55                   	push   %ebp
c000a0c2:	89 e5                	mov    %esp,%ebp
c000a0c4:	83 ec 08             	sub    $0x8,%esp
c000a0c7:	8b 45 08             	mov    0x8(%ebp),%eax
c000a0ca:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a0d1:	84 c0                	test   %al,%al
c000a0d3:	75 1c                	jne    c000a0f1 <block+0x30>
c000a0d5:	68 86 06 00 00       	push   $0x686
c000a0da:	68 83 bb 00 c0       	push   $0xc000bb83
c000a0df:	68 83 bb 00 c0       	push   $0xc000bb83
c000a0e4:	68 b5 bd 00 c0       	push   $0xc000bdb5
c000a0e9:	e8 9a f5 ff ff       	call   c0009688 <assertion_failure>
c000a0ee:	83 c4 10             	add    $0x10,%esp
c000a0f1:	e8 51 a4 ff ff       	call   c0004547 <schedule_process>
c000a0f6:	b8 00 00 00 00       	mov    $0x0,%eax
c000a0fb:	c9                   	leave  
c000a0fc:	c3                   	ret    

c000a0fd <unblock>:
c000a0fd:	55                   	push   %ebp
c000a0fe:	89 e5                	mov    %esp,%ebp
c000a100:	83 ec 08             	sub    $0x8,%esp
c000a103:	8b 45 08             	mov    0x8(%ebp),%eax
c000a106:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a10d:	84 c0                	test   %al,%al
c000a10f:	74 1c                	je     c000a12d <unblock+0x30>
c000a111:	68 8f 06 00 00       	push   $0x68f
c000a116:	68 83 bb 00 c0       	push   $0xc000bb83
c000a11b:	68 83 bb 00 c0       	push   $0xc000bb83
c000a120:	68 cd bd 00 c0       	push   $0xc000bdcd
c000a125:	e8 5e f5 ff ff       	call   c0009688 <assertion_failure>
c000a12a:	83 c4 10             	add    $0x10,%esp
c000a12d:	8b 45 08             	mov    0x8(%ebp),%eax
c000a130:	05 00 01 00 00       	add    $0x100,%eax
c000a135:	83 ec 08             	sub    $0x8,%esp
c000a138:	50                   	push   %eax
c000a139:	68 ec 0d 01 c0       	push   $0xc0010dec
c000a13e:	e8 dd 0a 00 00       	call   c000ac20 <appendToDoubleLinkList>
c000a143:	83 c4 10             	add    $0x10,%esp
c000a146:	b8 00 00 00 00       	mov    $0x0,%eax
c000a14b:	c9                   	leave  
c000a14c:	c3                   	ret    

c000a14d <get_ticks_ipc>:
c000a14d:	55                   	push   %ebp
c000a14e:	89 e5                	mov    %esp,%ebp
c000a150:	81 ec 98 00 00 00    	sub    $0x98,%esp
c000a156:	83 ec 04             	sub    $0x4,%esp
c000a159:	6a 7c                	push   $0x7c
c000a15b:	6a 00                	push   $0x0
c000a15d:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c000a163:	50                   	push   %eax
c000a164:	e8 d6 1c 00 00       	call   c000be3f <Memset>
c000a169:	83 c4 10             	add    $0x10,%esp
c000a16c:	c7 85 78 ff ff ff 01 	movl   $0x1,-0x88(%ebp)
c000a173:	00 00 00 
c000a176:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c000a17d:	83 ec 04             	sub    $0x4,%esp
c000a180:	6a 01                	push   $0x1
c000a182:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c000a188:	50                   	push   %eax
c000a189:	6a 03                	push   $0x3
c000a18b:	e8 35 fe ff ff       	call   c0009fc5 <send_rec>
c000a190:	83 c4 10             	add    $0x10,%esp
c000a193:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a196:	8b 85 7c ff ff ff    	mov    -0x84(%ebp),%eax
c000a19c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a19f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a1a2:	c9                   	leave  
c000a1a3:	c3                   	ret    

c000a1a4 <itoa>:
c000a1a4:	55                   	push   %ebp
c000a1a5:	89 e5                	mov    %esp,%ebp
c000a1a7:	53                   	push   %ebx
c000a1a8:	83 ec 14             	sub    $0x14,%esp
c000a1ab:	8b 45 08             	mov    0x8(%ebp),%eax
c000a1ae:	99                   	cltd   
c000a1af:	f7 7d 10             	idivl  0x10(%ebp)
c000a1b2:	89 55 f4             	mov    %edx,-0xc(%ebp)
c000a1b5:	8b 45 08             	mov    0x8(%ebp),%eax
c000a1b8:	99                   	cltd   
c000a1b9:	f7 7d 10             	idivl  0x10(%ebp)
c000a1bc:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a1bf:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000a1c3:	74 14                	je     c000a1d9 <itoa+0x35>
c000a1c5:	83 ec 04             	sub    $0x4,%esp
c000a1c8:	ff 75 10             	pushl  0x10(%ebp)
c000a1cb:	ff 75 0c             	pushl  0xc(%ebp)
c000a1ce:	ff 75 f0             	pushl  -0x10(%ebp)
c000a1d1:	e8 ce ff ff ff       	call   c000a1a4 <itoa>
c000a1d6:	83 c4 10             	add    $0x10,%esp
c000a1d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a1dc:	8d 58 30             	lea    0x30(%eax),%ebx
c000a1df:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a1e2:	8b 00                	mov    (%eax),%eax
c000a1e4:	8d 48 01             	lea    0x1(%eax),%ecx
c000a1e7:	8b 55 0c             	mov    0xc(%ebp),%edx
c000a1ea:	89 0a                	mov    %ecx,(%edx)
c000a1ec:	89 da                	mov    %ebx,%edx
c000a1ee:	88 10                	mov    %dl,(%eax)
c000a1f0:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a1f3:	8b 00                	mov    (%eax),%eax
c000a1f5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c000a1f8:	c9                   	leave  
c000a1f9:	c3                   	ret    

c000a1fa <i2a>:
c000a1fa:	55                   	push   %ebp
c000a1fb:	89 e5                	mov    %esp,%ebp
c000a1fd:	53                   	push   %ebx
c000a1fe:	83 ec 14             	sub    $0x14,%esp
c000a201:	8b 45 08             	mov    0x8(%ebp),%eax
c000a204:	99                   	cltd   
c000a205:	f7 7d 0c             	idivl  0xc(%ebp)
c000a208:	89 55 f4             	mov    %edx,-0xc(%ebp)
c000a20b:	8b 45 08             	mov    0x8(%ebp),%eax
c000a20e:	99                   	cltd   
c000a20f:	f7 7d 0c             	idivl  0xc(%ebp)
c000a212:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a215:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000a219:	74 14                	je     c000a22f <i2a+0x35>
c000a21b:	83 ec 04             	sub    $0x4,%esp
c000a21e:	ff 75 10             	pushl  0x10(%ebp)
c000a221:	ff 75 0c             	pushl  0xc(%ebp)
c000a224:	ff 75 f0             	pushl  -0x10(%ebp)
c000a227:	e8 ce ff ff ff       	call   c000a1fa <i2a>
c000a22c:	83 c4 10             	add    $0x10,%esp
c000a22f:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c000a233:	7f 0a                	jg     c000a23f <i2a+0x45>
c000a235:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a238:	83 c0 30             	add    $0x30,%eax
c000a23b:	89 c3                	mov    %eax,%ebx
c000a23d:	eb 08                	jmp    c000a247 <i2a+0x4d>
c000a23f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a242:	83 c0 37             	add    $0x37,%eax
c000a245:	89 c3                	mov    %eax,%ebx
c000a247:	8b 45 10             	mov    0x10(%ebp),%eax
c000a24a:	8b 00                	mov    (%eax),%eax
c000a24c:	8d 48 01             	lea    0x1(%eax),%ecx
c000a24f:	8b 55 10             	mov    0x10(%ebp),%edx
c000a252:	89 0a                	mov    %ecx,(%edx)
c000a254:	88 18                	mov    %bl,(%eax)
c000a256:	8b 45 10             	mov    0x10(%ebp),%eax
c000a259:	8b 00                	mov    (%eax),%eax
c000a25b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c000a25e:	c9                   	leave  
c000a25f:	c3                   	ret    

c000a260 <inform_int>:
c000a260:	55                   	push   %ebp
c000a261:	89 e5                	mov    %esp,%ebp
c000a263:	83 ec 18             	sub    $0x18,%esp
c000a266:	83 ec 0c             	sub    $0xc,%esp
c000a269:	ff 75 08             	pushl  0x8(%ebp)
c000a26c:	e8 4b a4 ff ff       	call   c00046bc <pid2proc>
c000a271:	83 c4 10             	add    $0x10,%esp
c000a274:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a277:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a27a:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a281:	0f be c0             	movsbl %al,%eax
c000a284:	83 e0 02             	and    $0x2,%eax
c000a287:	85 c0                	test   %eax,%eax
c000a289:	0f 84 8e 00 00 00    	je     c000a31d <inform_int+0xbd>
c000a28f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a292:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c000a298:	3d 13 02 00 00       	cmp    $0x213,%eax
c000a29d:	74 0e                	je     c000a2ad <inform_int+0x4d>
c000a29f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a2a2:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c000a2a8:	83 f8 12             	cmp    $0x12,%eax
c000a2ab:	75 7d                	jne    c000a32a <inform_int+0xca>
c000a2ad:	c7 45 f0 7c 00 00 00 	movl   $0x7c,-0x10(%ebp)
c000a2b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a2b7:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c000a2bd:	83 ec 08             	sub    $0x8,%esp
c000a2c0:	ff 75 f0             	pushl  -0x10(%ebp)
c000a2c3:	50                   	push   %eax
c000a2c4:	e8 3e ca ff ff       	call   c0006d07 <alloc_virtual_memory>
c000a2c9:	83 c4 10             	add    $0x10,%esp
c000a2cc:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a2cf:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a2d2:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c000a2d8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a2db:	c7 40 78 d5 07 00 00 	movl   $0x7d5,0x78(%eax)
c000a2e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a2e5:	c7 80 60 02 00 00 00 	movl   $0x0,0x260(%eax)
c000a2ec:	00 00 00 
c000a2ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a2f2:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c000a2f9:	00 00 00 
c000a2fc:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000a303:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a306:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c000a30d:	83 ec 0c             	sub    $0xc,%esp
c000a310:	ff 75 f4             	pushl  -0xc(%ebp)
c000a313:	e8 e5 fd ff ff       	call   c000a0fd <unblock>
c000a318:	83 c4 10             	add    $0x10,%esp
c000a31b:	eb 0d                	jmp    c000a32a <inform_int+0xca>
c000a31d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a320:	c7 80 60 02 00 00 01 	movl   $0x1,0x260(%eax)
c000a327:	00 00 00 
c000a32a:	90                   	nop
c000a32b:	c9                   	leave  
c000a32c:	c3                   	ret    

c000a32d <strcmp>:
c000a32d:	55                   	push   %ebp
c000a32e:	89 e5                	mov    %esp,%ebp
c000a330:	83 ec 10             	sub    $0x10,%esp
c000a333:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c000a337:	74 06                	je     c000a33f <strcmp+0x12>
c000a339:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000a33d:	75 08                	jne    c000a347 <strcmp+0x1a>
c000a33f:	8b 45 08             	mov    0x8(%ebp),%eax
c000a342:	2b 45 0c             	sub    0xc(%ebp),%eax
c000a345:	eb 53                	jmp    c000a39a <strcmp+0x6d>
c000a347:	8b 45 08             	mov    0x8(%ebp),%eax
c000a34a:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000a34d:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a350:	89 45 f8             	mov    %eax,-0x8(%ebp)
c000a353:	eb 18                	jmp    c000a36d <strcmp+0x40>
c000a355:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a358:	0f b6 10             	movzbl (%eax),%edx
c000a35b:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000a35e:	0f b6 00             	movzbl (%eax),%eax
c000a361:	38 c2                	cmp    %al,%dl
c000a363:	75 1e                	jne    c000a383 <strcmp+0x56>
c000a365:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c000a369:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c000a36d:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a370:	0f b6 00             	movzbl (%eax),%eax
c000a373:	84 c0                	test   %al,%al
c000a375:	74 0d                	je     c000a384 <strcmp+0x57>
c000a377:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000a37a:	0f b6 00             	movzbl (%eax),%eax
c000a37d:	84 c0                	test   %al,%al
c000a37f:	75 d4                	jne    c000a355 <strcmp+0x28>
c000a381:	eb 01                	jmp    c000a384 <strcmp+0x57>
c000a383:	90                   	nop
c000a384:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a387:	0f b6 00             	movzbl (%eax),%eax
c000a38a:	0f be d0             	movsbl %al,%edx
c000a38d:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000a390:	0f b6 00             	movzbl (%eax),%eax
c000a393:	0f be c0             	movsbl %al,%eax
c000a396:	29 c2                	sub    %eax,%edx
c000a398:	89 d0                	mov    %edx,%eax
c000a39a:	c9                   	leave  
c000a39b:	c3                   	ret    

c000a39c <create_user_process_address_space>:
c000a39c:	55                   	push   %ebp
c000a39d:	89 e5                	mov    %esp,%ebp
c000a39f:	83 ec 18             	sub    $0x18,%esp
c000a3a2:	83 ec 08             	sub    $0x8,%esp
c000a3a5:	6a 00                	push   $0x0
c000a3a7:	6a 01                	push   $0x1
c000a3a9:	e8 8c cc ff ff       	call   c000703a <alloc_memory>
c000a3ae:	83 c4 10             	add    $0x10,%esp
c000a3b1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a3b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a3b7:	c7 40 08 00 80 04 08 	movl   $0x8048000,0x8(%eax)
c000a3be:	c7 45 f0 00 80 fb b7 	movl   $0xb7fb8000,-0x10(%ebp)
c000a3c5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a3c8:	05 ff 0f 00 00       	add    $0xfff,%eax
c000a3cd:	c1 e8 0c             	shr    $0xc,%eax
c000a3d0:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a3d3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a3d6:	83 c0 07             	add    $0x7,%eax
c000a3d9:	c1 e8 03             	shr    $0x3,%eax
c000a3dc:	89 c2                	mov    %eax,%edx
c000a3de:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a3e1:	89 50 04             	mov    %edx,0x4(%eax)
c000a3e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a3e7:	8b 40 04             	mov    0x4(%eax),%eax
c000a3ea:	05 ff 0f 00 00       	add    $0xfff,%eax
c000a3ef:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c000a3f5:	85 c0                	test   %eax,%eax
c000a3f7:	0f 48 c2             	cmovs  %edx,%eax
c000a3fa:	c1 f8 0c             	sar    $0xc,%eax
c000a3fd:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000a400:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a403:	83 ec 08             	sub    $0x8,%esp
c000a406:	6a 00                	push   $0x0
c000a408:	50                   	push   %eax
c000a409:	e8 2c cc ff ff       	call   c000703a <alloc_memory>
c000a40e:	83 c4 10             	add    $0x10,%esp
c000a411:	89 c2                	mov    %eax,%edx
c000a413:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a416:	89 10                	mov    %edx,(%eax)
c000a418:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a41b:	83 ec 0c             	sub    $0xc,%esp
c000a41e:	50                   	push   %eax
c000a41f:	e8 ed c3 ff ff       	call   c0006811 <init_bitmap>
c000a424:	83 c4 10             	add    $0x10,%esp
c000a427:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a42a:	c9                   	leave  
c000a42b:	c3                   	ret    

c000a42c <user_process>:
c000a42c:	55                   	push   %ebp
c000a42d:	89 e5                	mov    %esp,%ebp
c000a42f:	83 ec 38             	sub    $0x38,%esp
c000a432:	c7 45 f0 b2 0c 00 00 	movl   $0xcb2,-0x10(%ebp)
c000a439:	c7 45 ec ba 0c 00 00 	movl   $0xcba,-0x14(%ebp)
c000a440:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%ebp)
c000a447:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c000a44b:	75 0e                	jne    c000a45b <user_process+0x2f>
c000a44d:	66 c7 45 f6 48 00    	movw   $0x48,-0xa(%ebp)
c000a453:	66 c7 45 f4 50 00    	movw   $0x50,-0xc(%ebp)
c000a459:	eb 0c                	jmp    c000a467 <user_process+0x3b>
c000a45b:	66 c7 45 f6 59 00    	movw   $0x59,-0xa(%ebp)
c000a461:	66 c7 45 f4 61 00    	movw   $0x61,-0xc(%ebp)
c000a467:	e8 2b 6f ff ff       	call   c0001397 <get_running_thread_pcb>
c000a46c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000a46f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a472:	05 00 10 00 00       	add    $0x1000,%eax
c000a477:	89 c2                	mov    %eax,%edx
c000a479:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a47c:	89 10                	mov    %edx,(%eax)
c000a47e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a481:	8b 00                	mov    (%eax),%eax
c000a483:	83 e8 44             	sub    $0x44,%eax
c000a486:	89 c2                	mov    %eax,%edx
c000a488:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a48b:	89 10                	mov    %edx,(%eax)
c000a48d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a490:	8b 00                	mov    (%eax),%eax
c000a492:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000a495:	c6 45 df 00          	movb   $0x0,-0x21(%ebp)
c000a499:	66 c7 45 dc 02 12    	movw   $0x1202,-0x24(%ebp)
c000a49f:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c000a4a3:	66 89 45 da          	mov    %ax,-0x26(%ebp)
c000a4a7:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c000a4ab:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
c000a4af:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c000a4b3:	66 89 45 d6          	mov    %ax,-0x2a(%ebp)
c000a4b7:	66 c7 45 d4 38 00    	movw   $0x38,-0x2c(%ebp)
c000a4bd:	0f b7 55 f4          	movzwl -0xc(%ebp),%edx
c000a4c1:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a4c4:	89 50 34             	mov    %edx,0x34(%eax)
c000a4c7:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c000a4cb:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a4ce:	89 50 0c             	mov    %edx,0xc(%eax)
c000a4d1:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c000a4d5:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a4d8:	89 50 04             	mov    %edx,0x4(%eax)
c000a4db:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c000a4df:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a4e2:	89 50 08             	mov    %edx,0x8(%eax)
c000a4e5:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c000a4e9:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a4ec:	89 50 40             	mov    %edx,0x40(%eax)
c000a4ef:	0f b7 55 d4          	movzwl -0x2c(%ebp),%edx
c000a4f3:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a4f6:	89 10                	mov    %edx,(%eax)
c000a4f8:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a4fb:	8b 55 08             	mov    0x8(%ebp),%edx
c000a4fe:	89 50 30             	mov    %edx,0x30(%eax)
c000a501:	0f b7 55 dc          	movzwl -0x24(%ebp),%edx
c000a505:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a508:	89 50 38             	mov    %edx,0x38(%eax)
c000a50b:	83 ec 08             	sub    $0x8,%esp
c000a50e:	6a 01                	push   $0x1
c000a510:	68 00 f0 ff bf       	push   $0xbffff000
c000a515:	e8 58 ca ff ff       	call   c0006f72 <alloc_physical_memory>
c000a51a:	83 c4 10             	add    $0x10,%esp
c000a51d:	8d 90 00 10 00 00    	lea    0x1000(%eax),%edx
c000a523:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a526:	89 50 3c             	mov    %edx,0x3c(%eax)
c000a529:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a52c:	83 ec 0c             	sub    $0xc,%esp
c000a52f:	50                   	push   %eax
c000a530:	e8 37 6d ff ff       	call   c000126c <restart>
c000a535:	83 c4 10             	add    $0x10,%esp
c000a538:	90                   	nop
c000a539:	c9                   	leave  
c000a53a:	c3                   	ret    

c000a53b <clone_pcb>:
c000a53b:	55                   	push   %ebp
c000a53c:	89 e5                	mov    %esp,%ebp
c000a53e:	83 ec 38             	sub    $0x38,%esp
c000a541:	83 ec 08             	sub    $0x8,%esp
c000a544:	6a 00                	push   $0x0
c000a546:	6a 01                	push   $0x1
c000a548:	e8 ed ca ff ff       	call   c000703a <alloc_memory>
c000a54d:	83 c4 10             	add    $0x10,%esp
c000a550:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a553:	83 ec 04             	sub    $0x4,%esp
c000a556:	68 00 10 00 00       	push   $0x1000
c000a55b:	6a 00                	push   $0x0
c000a55d:	ff 75 f4             	pushl  -0xc(%ebp)
c000a560:	e8 da 18 00 00       	call   c000be3f <Memset>
c000a565:	83 c4 10             	add    $0x10,%esp
c000a568:	83 ec 04             	sub    $0x4,%esp
c000a56b:	68 00 10 00 00       	push   $0x1000
c000a570:	ff 75 08             	pushl  0x8(%ebp)
c000a573:	ff 75 f4             	pushl  -0xc(%ebp)
c000a576:	e8 89 d5 ff ff       	call   c0007b04 <Memcpy>
c000a57b:	83 c4 10             	add    $0x10,%esp
c000a57e:	a1 90 07 01 c0       	mov    0xc0010790,%eax
c000a583:	83 c0 01             	add    $0x1,%eax
c000a586:	a3 90 07 01 c0       	mov    %eax,0xc0010790
c000a58b:	8b 15 90 07 01 c0    	mov    0xc0010790,%edx
c000a591:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a594:	89 90 24 01 00 00    	mov    %edx,0x124(%eax)
c000a59a:	8b 45 08             	mov    0x8(%ebp),%eax
c000a59d:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c000a5a3:	89 c2                	mov    %eax,%edx
c000a5a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a5a8:	89 90 64 02 00 00    	mov    %edx,0x264(%eax)
c000a5ae:	83 ec 08             	sub    $0x8,%esp
c000a5b1:	6a 00                	push   $0x0
c000a5b3:	6a 01                	push   $0x1
c000a5b5:	e8 80 ca ff ff       	call   c000703a <alloc_memory>
c000a5ba:	83 c4 10             	add    $0x10,%esp
c000a5bd:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a5c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a5c3:	05 00 0c 00 00       	add    $0xc00,%eax
c000a5c8:	83 ec 04             	sub    $0x4,%esp
c000a5cb:	68 00 04 00 00       	push   $0x400
c000a5d0:	68 00 fc ff ff       	push   $0xfffffc00
c000a5d5:	50                   	push   %eax
c000a5d6:	e8 29 d5 ff ff       	call   c0007b04 <Memcpy>
c000a5db:	83 c4 10             	add    $0x10,%esp
c000a5de:	83 ec 0c             	sub    $0xc,%esp
c000a5e1:	ff 75 f0             	pushl  -0x10(%ebp)
c000a5e4:	e8 68 c8 ff ff       	call   c0006e51 <get_physical_address>
c000a5e9:	83 c4 10             	add    $0x10,%esp
c000a5ec:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a5ef:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a5f2:	05 fc 0f 00 00       	add    $0xffc,%eax
c000a5f7:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000a5fa:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a5fd:	83 c8 07             	or     $0x7,%eax
c000a600:	89 c2                	mov    %eax,%edx
c000a602:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a605:	89 10                	mov    %edx,(%eax)
c000a607:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a60a:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000a60d:	89 50 08             	mov    %edx,0x8(%eax)
c000a610:	e8 87 fd ff ff       	call   c000a39c <create_user_process_address_space>
c000a615:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000a618:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c000a61b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a61e:	89 50 0c             	mov    %edx,0xc(%eax)
c000a621:	8b 45 08             	mov    0x8(%ebp),%eax
c000a624:	8b 40 0c             	mov    0xc(%eax),%eax
c000a627:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000a62a:	83 ec 04             	sub    $0x4,%esp
c000a62d:	6a 0c                	push   $0xc
c000a62f:	ff 75 e0             	pushl  -0x20(%ebp)
c000a632:	ff 75 e4             	pushl  -0x1c(%ebp)
c000a635:	e8 ca d4 ff ff       	call   c0007b04 <Memcpy>
c000a63a:	83 c4 10             	add    $0x10,%esp
c000a63d:	c7 45 dc 00 80 fb b7 	movl   $0xb7fb8000,-0x24(%ebp)
c000a644:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000a647:	05 ff 0f 00 00       	add    $0xfff,%eax
c000a64c:	c1 e8 0c             	shr    $0xc,%eax
c000a64f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000a652:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000a655:	83 c0 07             	add    $0x7,%eax
c000a658:	c1 e8 03             	shr    $0x3,%eax
c000a65b:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000a65e:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000a661:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000a664:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000a667:	05 ff 0f 00 00       	add    $0xfff,%eax
c000a66c:	c1 e8 0c             	shr    $0xc,%eax
c000a66f:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000a672:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000a675:	83 ec 08             	sub    $0x8,%esp
c000a678:	6a 00                	push   $0x0
c000a67a:	50                   	push   %eax
c000a67b:	e8 ba c9 ff ff       	call   c000703a <alloc_memory>
c000a680:	83 c4 10             	add    $0x10,%esp
c000a683:	89 c2                	mov    %eax,%edx
c000a685:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a688:	89 10                	mov    %edx,(%eax)
c000a68a:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000a68d:	c1 e0 0c             	shl    $0xc,%eax
c000a690:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000a693:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a696:	8b 10                	mov    (%eax),%edx
c000a698:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a69b:	8b 00                	mov    (%eax),%eax
c000a69d:	83 ec 04             	sub    $0x4,%esp
c000a6a0:	ff 75 cc             	pushl  -0x34(%ebp)
c000a6a3:	52                   	push   %edx
c000a6a4:	50                   	push   %eax
c000a6a5:	e8 5a d4 ff ff       	call   c0007b04 <Memcpy>
c000a6aa:	83 c4 10             	add    $0x10,%esp
c000a6ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a6b0:	c9                   	leave  
c000a6b1:	c3                   	ret    

c000a6b2 <build_body_stack>:
c000a6b2:	55                   	push   %ebp
c000a6b3:	89 e5                	mov    %esp,%ebp
c000a6b5:	83 ec 48             	sub    $0x48,%esp
c000a6b8:	8b 45 08             	mov    0x8(%ebp),%eax
c000a6bb:	8b 40 0c             	mov    0xc(%eax),%eax
c000a6be:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000a6c1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a6c4:	8b 50 04             	mov    0x4(%eax),%edx
c000a6c7:	8b 00                	mov    (%eax),%eax
c000a6c9:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c000a6cc:	89 55 c8             	mov    %edx,-0x38(%ebp)
c000a6cf:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c000a6d2:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000a6d5:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000a6d8:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000a6db:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a6de:	8b 40 08             	mov    0x8(%eax),%eax
c000a6e1:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000a6e4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000a6eb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000a6f2:	e8 a9 d3 ff ff       	call   c0007aa0 <intr_disable>
c000a6f7:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000a6fa:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000a701:	e9 c2 00 00 00       	jmp    c000a7c8 <build_body_stack+0x116>
c000a706:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000a709:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a70c:	01 d0                	add    %edx,%eax
c000a70e:	0f b6 00             	movzbl (%eax),%eax
c000a711:	88 45 d3             	mov    %al,-0x2d(%ebp)
c000a714:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000a71b:	e9 9a 00 00 00       	jmp    c000a7ba <build_body_stack+0x108>
c000a720:	0f be 55 d3          	movsbl -0x2d(%ebp),%edx
c000a724:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a727:	89 c1                	mov    %eax,%ecx
c000a729:	d3 fa                	sar    %cl,%edx
c000a72b:	89 d0                	mov    %edx,%eax
c000a72d:	83 e0 01             	and    $0x1,%eax
c000a730:	85 c0                	test   %eax,%eax
c000a732:	75 06                	jne    c000a73a <build_body_stack+0x88>
c000a734:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000a738:	eb 7c                	jmp    c000a7b6 <build_body_stack+0x104>
c000a73a:	8b 45 08             	mov    0x8(%ebp),%eax
c000a73d:	8b 40 08             	mov    0x8(%eax),%eax
c000a740:	83 ec 0c             	sub    $0xc,%esp
c000a743:	50                   	push   %eax
c000a744:	e8 32 6c ff ff       	call   c000137b <update_cr3>
c000a749:	83 c4 10             	add    $0x10,%esp
c000a74c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a74f:	c1 e0 0c             	shl    $0xc,%eax
c000a752:	89 c2                	mov    %eax,%edx
c000a754:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000a757:	01 d0                	add    %edx,%eax
c000a759:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000a75c:	8b 55 cc             	mov    -0x34(%ebp),%edx
c000a75f:	8b 45 10             	mov    0x10(%ebp),%eax
c000a762:	83 ec 04             	sub    $0x4,%esp
c000a765:	68 00 10 00 00       	push   $0x1000
c000a76a:	52                   	push   %edx
c000a76b:	50                   	push   %eax
c000a76c:	e8 93 d3 ff ff       	call   c0007b04 <Memcpy>
c000a771:	83 c4 10             	add    $0x10,%esp
c000a774:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a777:	8b 40 08             	mov    0x8(%eax),%eax
c000a77a:	83 ec 0c             	sub    $0xc,%esp
c000a77d:	50                   	push   %eax
c000a77e:	e8 f8 6b ff ff       	call   c000137b <update_cr3>
c000a783:	83 c4 10             	add    $0x10,%esp
c000a786:	83 ec 08             	sub    $0x8,%esp
c000a789:	ff 75 cc             	pushl  -0x34(%ebp)
c000a78c:	6a 01                	push   $0x1
c000a78e:	e8 09 c9 ff ff       	call   c000709c <get_a_virtual_page>
c000a793:	83 c4 10             	add    $0x10,%esp
c000a796:	8b 55 10             	mov    0x10(%ebp),%edx
c000a799:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000a79c:	83 ec 04             	sub    $0x4,%esp
c000a79f:	68 00 10 00 00       	push   $0x1000
c000a7a4:	52                   	push   %edx
c000a7a5:	50                   	push   %eax
c000a7a6:	e8 59 d3 ff ff       	call   c0007b04 <Memcpy>
c000a7ab:	83 c4 10             	add    $0x10,%esp
c000a7ae:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000a7b2:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c000a7b6:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c000a7ba:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c000a7be:	0f 8e 5c ff ff ff    	jle    c000a720 <build_body_stack+0x6e>
c000a7c4:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c000a7c8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a7cb:	39 45 dc             	cmp    %eax,-0x24(%ebp)
c000a7ce:	0f 87 32 ff ff ff    	ja     c000a706 <build_body_stack+0x54>
c000a7d4:	83 ec 0c             	sub    $0xc,%esp
c000a7d7:	ff 75 d4             	pushl  -0x2c(%ebp)
c000a7da:	e8 ea d2 ff ff       	call   c0007ac9 <intr_set_status>
c000a7df:	83 c4 10             	add    $0x10,%esp
c000a7e2:	90                   	nop
c000a7e3:	c9                   	leave  
c000a7e4:	c3                   	ret    

c000a7e5 <build_process_kernel_stack>:
c000a7e5:	55                   	push   %ebp
c000a7e6:	89 e5                	mov    %esp,%ebp
c000a7e8:	83 ec 28             	sub    $0x28,%esp
c000a7eb:	e8 b0 d2 ff ff       	call   c0007aa0 <intr_disable>
c000a7f0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a7f3:	8b 45 08             	mov    0x8(%ebp),%eax
c000a7f6:	05 00 10 00 00       	add    $0x1000,%eax
c000a7fb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a7fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a801:	8b 00                	mov    (%eax),%eax
c000a803:	83 f8 38             	cmp    $0x38,%eax
c000a806:	74 06                	je     c000a80e <build_process_kernel_stack+0x29>
c000a808:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c000a80c:	eb f0                	jmp    c000a7fe <build_process_kernel_stack+0x19>
c000a80e:	90                   	nop
c000a80f:	8b 45 08             	mov    0x8(%ebp),%eax
c000a812:	05 00 10 00 00       	add    $0x1000,%eax
c000a817:	89 c2                	mov    %eax,%edx
c000a819:	8b 45 08             	mov    0x8(%ebp),%eax
c000a81c:	89 50 04             	mov    %edx,0x4(%eax)
c000a81f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a822:	83 c0 2c             	add    $0x2c,%eax
c000a825:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a828:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a82b:	83 e8 04             	sub    $0x4,%eax
c000a82e:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000a831:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a834:	83 e8 08             	sub    $0x8,%eax
c000a837:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000a83a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a83d:	83 e8 0c             	sub    $0xc,%eax
c000a840:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000a843:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a846:	83 e8 10             	sub    $0x10,%eax
c000a849:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000a84c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a84f:	83 e8 14             	sub    $0x14,%eax
c000a852:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000a855:	ba 63 12 00 c0       	mov    $0xc0001263,%edx
c000a85a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a85d:	89 10                	mov    %edx,(%eax)
c000a85f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000a862:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000a868:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000a86b:	8b 10                	mov    (%eax),%edx
c000a86d:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000a870:	89 10                	mov    %edx,(%eax)
c000a872:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000a875:	8b 10                	mov    (%eax),%edx
c000a877:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a87a:	89 10                	mov    %edx,(%eax)
c000a87c:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a87f:	8b 10                	mov    (%eax),%edx
c000a881:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a884:	89 10                	mov    %edx,(%eax)
c000a886:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a889:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000a88f:	8b 45 08             	mov    0x8(%ebp),%eax
c000a892:	8b 55 d8             	mov    -0x28(%ebp),%edx
c000a895:	89 10                	mov    %edx,(%eax)
c000a897:	83 ec 0c             	sub    $0xc,%esp
c000a89a:	ff 75 f0             	pushl  -0x10(%ebp)
c000a89d:	e8 27 d2 ff ff       	call   c0007ac9 <intr_set_status>
c000a8a2:	83 c4 10             	add    $0x10,%esp
c000a8a5:	90                   	nop
c000a8a6:	c9                   	leave  
c000a8a7:	c3                   	ret    

c000a8a8 <fork_process>:
c000a8a8:	55                   	push   %ebp
c000a8a9:	89 e5                	mov    %esp,%ebp
c000a8ab:	83 ec 18             	sub    $0x18,%esp
c000a8ae:	8b 45 08             	mov    0x8(%ebp),%eax
c000a8b1:	83 ec 0c             	sub    $0xc,%esp
c000a8b4:	50                   	push   %eax
c000a8b5:	e8 02 9e ff ff       	call   c00046bc <pid2proc>
c000a8ba:	83 c4 10             	add    $0x10,%esp
c000a8bd:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a8c0:	83 ec 0c             	sub    $0xc,%esp
c000a8c3:	ff 75 f4             	pushl  -0xc(%ebp)
c000a8c6:	e8 70 fc ff ff       	call   c000a53b <clone_pcb>
c000a8cb:	83 c4 10             	add    $0x10,%esp
c000a8ce:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a8d1:	83 ec 08             	sub    $0x8,%esp
c000a8d4:	6a 00                	push   $0x0
c000a8d6:	6a 01                	push   $0x1
c000a8d8:	e8 5d c7 ff ff       	call   c000703a <alloc_memory>
c000a8dd:	83 c4 10             	add    $0x10,%esp
c000a8e0:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a8e3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a8e6:	83 ec 04             	sub    $0x4,%esp
c000a8e9:	68 00 10 00 00       	push   $0x1000
c000a8ee:	6a 00                	push   $0x0
c000a8f0:	50                   	push   %eax
c000a8f1:	e8 49 15 00 00       	call   c000be3f <Memset>
c000a8f6:	83 c4 10             	add    $0x10,%esp
c000a8f9:	83 ec 04             	sub    $0x4,%esp
c000a8fc:	ff 75 ec             	pushl  -0x14(%ebp)
c000a8ff:	ff 75 f0             	pushl  -0x10(%ebp)
c000a902:	ff 75 f4             	pushl  -0xc(%ebp)
c000a905:	e8 a8 fd ff ff       	call   c000a6b2 <build_body_stack>
c000a90a:	83 c4 10             	add    $0x10,%esp
c000a90d:	83 ec 0c             	sub    $0xc,%esp
c000a910:	ff 75 f0             	pushl  -0x10(%ebp)
c000a913:	e8 cd fe ff ff       	call   c000a7e5 <build_process_kernel_stack>
c000a918:	83 c4 10             	add    $0x10,%esp
c000a91b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a91e:	05 00 01 00 00       	add    $0x100,%eax
c000a923:	83 ec 04             	sub    $0x4,%esp
c000a926:	6a 08                	push   $0x8
c000a928:	6a 00                	push   $0x0
c000a92a:	50                   	push   %eax
c000a92b:	e8 0f 15 00 00       	call   c000be3f <Memset>
c000a930:	83 c4 10             	add    $0x10,%esp
c000a933:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a936:	05 08 01 00 00       	add    $0x108,%eax
c000a93b:	83 ec 04             	sub    $0x4,%esp
c000a93e:	6a 08                	push   $0x8
c000a940:	6a 00                	push   $0x0
c000a942:	50                   	push   %eax
c000a943:	e8 f7 14 00 00       	call   c000be3f <Memset>
c000a948:	83 c4 10             	add    $0x10,%esp
c000a94b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a94e:	05 08 01 00 00       	add    $0x108,%eax
c000a953:	83 ec 08             	sub    $0x8,%esp
c000a956:	50                   	push   %eax
c000a957:	68 04 1f 01 c0       	push   $0xc0011f04
c000a95c:	e8 bf 02 00 00       	call   c000ac20 <appendToDoubleLinkList>
c000a961:	83 c4 10             	add    $0x10,%esp
c000a964:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a967:	c9                   	leave  
c000a968:	c3                   	ret    

c000a969 <process_execute>:
c000a969:	55                   	push   %ebp
c000a96a:	89 e5                	mov    %esp,%ebp
c000a96c:	83 ec 28             	sub    $0x28,%esp
c000a96f:	e8 c2 04 00 00       	call   c000ae36 <thread_init>
c000a974:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a977:	83 ec 0c             	sub    $0xc,%esp
c000a97a:	ff 75 f4             	pushl  -0xc(%ebp)
c000a97d:	e8 61 05 00 00       	call   c000aee3 <thread_create>
c000a982:	83 c4 10             	add    $0x10,%esp
c000a985:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a988:	05 34 01 00 00       	add    $0x134,%eax
c000a98d:	83 ec 08             	sub    $0x8,%esp
c000a990:	ff 75 10             	pushl  0x10(%ebp)
c000a993:	50                   	push   %eax
c000a994:	e8 c5 14 00 00       	call   c000be5e <Strcpy>
c000a999:	83 c4 10             	add    $0x10,%esp
c000a99c:	83 ec 08             	sub    $0x8,%esp
c000a99f:	6a 00                	push   $0x0
c000a9a1:	6a 01                	push   $0x1
c000a9a3:	e8 92 c6 ff ff       	call   c000703a <alloc_memory>
c000a9a8:	83 c4 10             	add    $0x10,%esp
c000a9ab:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a9ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a9b1:	05 00 0c 00 00       	add    $0xc00,%eax
c000a9b6:	83 ec 04             	sub    $0x4,%esp
c000a9b9:	68 00 04 00 00       	push   $0x400
c000a9be:	68 00 fc ff ff       	push   $0xfffffc00
c000a9c3:	50                   	push   %eax
c000a9c4:	e8 3b d1 ff ff       	call   c0007b04 <Memcpy>
c000a9c9:	83 c4 10             	add    $0x10,%esp
c000a9cc:	83 ec 0c             	sub    $0xc,%esp
c000a9cf:	ff 75 f0             	pushl  -0x10(%ebp)
c000a9d2:	e8 7a c4 ff ff       	call   c0006e51 <get_physical_address>
c000a9d7:	83 c4 10             	add    $0x10,%esp
c000a9da:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a9dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a9e0:	05 fc 0f 00 00       	add    $0xffc,%eax
c000a9e5:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000a9e8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a9eb:	83 c8 07             	or     $0x7,%eax
c000a9ee:	89 c2                	mov    %eax,%edx
c000a9f0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a9f3:	89 10                	mov    %edx,(%eax)
c000a9f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a9f8:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000a9fb:	89 50 08             	mov    %edx,0x8(%eax)
c000a9fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aa01:	83 c0 10             	add    $0x10,%eax
c000aa04:	83 ec 0c             	sub    $0xc,%esp
c000aa07:	50                   	push   %eax
c000aa08:	e8 d9 cb ff ff       	call   c00075e6 <init_memory_block_desc>
c000aa0d:	83 c4 10             	add    $0x10,%esp
c000aa10:	e8 87 f9 ff ff       	call   c000a39c <create_user_process_address_space>
c000aa15:	89 c2                	mov    %eax,%edx
c000aa17:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aa1a:	89 50 0c             	mov    %edx,0xc(%eax)
c000aa1d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aa20:	8b 00                	mov    (%eax),%eax
c000aa22:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000aa25:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aa28:	c7 40 10 2c a4 00 c0 	movl   $0xc000a42c,0x10(%eax)
c000aa2f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aa32:	8b 55 08             	mov    0x8(%ebp),%edx
c000aa35:	89 50 18             	mov    %edx,0x18(%eax)
c000aa38:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aa3b:	8b 55 0c             	mov    0xc(%ebp),%edx
c000aa3e:	89 50 1c             	mov    %edx,0x1c(%eax)
c000aa41:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aa44:	8b 55 14             	mov    0x14(%ebp),%edx
c000aa47:	89 50 20             	mov    %edx,0x20(%eax)
c000aa4a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000aa4d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aa50:	89 50 24             	mov    %edx,0x24(%eax)
c000aa53:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aa56:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000aa5c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aa5f:	8b 10                	mov    (%eax),%edx
c000aa61:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aa64:	89 50 04             	mov    %edx,0x4(%eax)
c000aa67:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aa6a:	8b 50 04             	mov    0x4(%eax),%edx
c000aa6d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aa70:	89 50 08             	mov    %edx,0x8(%eax)
c000aa73:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aa76:	8b 50 08             	mov    0x8(%eax),%edx
c000aa79:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aa7c:	89 50 0c             	mov    %edx,0xc(%eax)
c000aa7f:	83 ec 0c             	sub    $0xc,%esp
c000aa82:	68 ec 0d 01 c0       	push   $0xc0010dec
c000aa87:	e8 97 00 00 00       	call   c000ab23 <isListEmpty>
c000aa8c:	83 c4 10             	add    $0x10,%esp
c000aa8f:	e8 0c d0 ff ff       	call   c0007aa0 <intr_disable>
c000aa94:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000aa97:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aa9a:	05 00 01 00 00       	add    $0x100,%eax
c000aa9f:	83 ec 08             	sub    $0x8,%esp
c000aaa2:	50                   	push   %eax
c000aaa3:	68 ec 0d 01 c0       	push   $0xc0010dec
c000aaa8:	e8 73 01 00 00       	call   c000ac20 <appendToDoubleLinkList>
c000aaad:	83 c4 10             	add    $0x10,%esp
c000aab0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aab3:	05 08 01 00 00       	add    $0x108,%eax
c000aab8:	83 ec 08             	sub    $0x8,%esp
c000aabb:	50                   	push   %eax
c000aabc:	68 04 1f 01 c0       	push   $0xc0011f04
c000aac1:	e8 5a 01 00 00       	call   c000ac20 <appendToDoubleLinkList>
c000aac6:	83 c4 10             	add    $0x10,%esp
c000aac9:	83 ec 0c             	sub    $0xc,%esp
c000aacc:	ff 75 e0             	pushl  -0x20(%ebp)
c000aacf:	e8 f5 cf ff ff       	call   c0007ac9 <intr_set_status>
c000aad4:	83 c4 10             	add    $0x10,%esp
c000aad7:	90                   	nop
c000aad8:	c9                   	leave  
c000aad9:	c3                   	ret    
c000aada:	66 90                	xchg   %ax,%ax
c000aadc:	66 90                	xchg   %ax,%ax
c000aade:	66 90                	xchg   %ax,%ax

c000aae0 <switch_to>:
c000aae0:	56                   	push   %esi
c000aae1:	57                   	push   %edi
c000aae2:	53                   	push   %ebx
c000aae3:	55                   	push   %ebp
c000aae4:	89 e5                	mov    %esp,%ebp
c000aae6:	8b 45 14             	mov    0x14(%ebp),%eax
c000aae9:	89 20                	mov    %esp,(%eax)
c000aaeb:	8b 45 18             	mov    0x18(%ebp),%eax
c000aaee:	8b 20                	mov    (%eax),%esp
c000aaf0:	5d                   	pop    %ebp
c000aaf1:	5b                   	pop    %ebx
c000aaf2:	5f                   	pop    %edi
c000aaf3:	5e                   	pop    %esi
c000aaf4:	c3                   	ret    

c000aaf5 <initDoubleLinkList>:
c000aaf5:	55                   	push   %ebp
c000aaf6:	89 e5                	mov    %esp,%ebp
c000aaf8:	8b 45 08             	mov    0x8(%ebp),%eax
c000aafb:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000ab01:	8b 45 08             	mov    0x8(%ebp),%eax
c000ab04:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c000ab0b:	8b 45 08             	mov    0x8(%ebp),%eax
c000ab0e:	8d 50 08             	lea    0x8(%eax),%edx
c000ab11:	8b 45 08             	mov    0x8(%ebp),%eax
c000ab14:	89 50 04             	mov    %edx,0x4(%eax)
c000ab17:	8b 55 08             	mov    0x8(%ebp),%edx
c000ab1a:	8b 45 08             	mov    0x8(%ebp),%eax
c000ab1d:	89 50 08             	mov    %edx,0x8(%eax)
c000ab20:	90                   	nop
c000ab21:	5d                   	pop    %ebp
c000ab22:	c3                   	ret    

c000ab23 <isListEmpty>:
c000ab23:	55                   	push   %ebp
c000ab24:	89 e5                	mov    %esp,%ebp
c000ab26:	8b 45 08             	mov    0x8(%ebp),%eax
c000ab29:	8b 40 04             	mov    0x4(%eax),%eax
c000ab2c:	8b 55 08             	mov    0x8(%ebp),%edx
c000ab2f:	83 c2 08             	add    $0x8,%edx
c000ab32:	39 d0                	cmp    %edx,%eax
c000ab34:	75 07                	jne    c000ab3d <isListEmpty+0x1a>
c000ab36:	b8 01 00 00 00       	mov    $0x1,%eax
c000ab3b:	eb 05                	jmp    c000ab42 <isListEmpty+0x1f>
c000ab3d:	b8 00 00 00 00       	mov    $0x0,%eax
c000ab42:	5d                   	pop    %ebp
c000ab43:	c3                   	ret    

c000ab44 <findElementInList>:
c000ab44:	55                   	push   %ebp
c000ab45:	89 e5                	mov    %esp,%ebp
c000ab47:	83 ec 28             	sub    $0x28,%esp
c000ab4a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c000ab4e:	75 19                	jne    c000ab69 <findElementInList+0x25>
c000ab50:	6a 60                	push   $0x60
c000ab52:	68 e5 bd 00 c0       	push   $0xc000bde5
c000ab57:	68 e5 bd 00 c0       	push   $0xc000bde5
c000ab5c:	68 f8 bd 00 c0       	push   $0xc000bdf8
c000ab61:	e8 22 eb ff ff       	call   c0009688 <assertion_failure>
c000ab66:	83 c4 10             	add    $0x10,%esp
c000ab69:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000ab6d:	75 19                	jne    c000ab88 <findElementInList+0x44>
c000ab6f:	6a 61                	push   $0x61
c000ab71:	68 e5 bd 00 c0       	push   $0xc000bde5
c000ab76:	68 e5 bd 00 c0       	push   $0xc000bde5
c000ab7b:	68 04 be 00 c0       	push   $0xc000be04
c000ab80:	e8 03 eb ff ff       	call   c0009688 <assertion_failure>
c000ab85:	83 c4 10             	add    $0x10,%esp
c000ab88:	e8 13 cf ff ff       	call   c0007aa0 <intr_disable>
c000ab8d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000ab90:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000ab97:	8b 45 08             	mov    0x8(%ebp),%eax
c000ab9a:	8b 40 08             	mov    0x8(%eax),%eax
c000ab9d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000aba0:	8b 45 08             	mov    0x8(%ebp),%eax
c000aba3:	8b 40 04             	mov    0x4(%eax),%eax
c000aba6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000aba9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000abad:	75 07                	jne    c000abb6 <findElementInList+0x72>
c000abaf:	b8 00 00 00 00       	mov    $0x0,%eax
c000abb4:	eb 68                	jmp    c000ac1e <findElementInList+0xda>
c000abb6:	8b 45 0c             	mov    0xc(%ebp),%eax
c000abb9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000abbc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000abbf:	2b 45 f0             	sub    -0x10(%ebp),%eax
c000abc2:	c1 f8 03             	sar    $0x3,%eax
c000abc5:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000abc8:	eb 36                	jmp    c000ac00 <findElementInList+0xbc>
c000abca:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000abcd:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c000abd0:	75 07                	jne    c000abd9 <findElementInList+0x95>
c000abd2:	b8 01 00 00 00       	mov    $0x1,%eax
c000abd7:	eb 45                	jmp    c000ac1e <findElementInList+0xda>
c000abd9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000abdd:	75 07                	jne    c000abe6 <findElementInList+0xa2>
c000abdf:	b8 00 00 00 00       	mov    $0x0,%eax
c000abe4:	eb 38                	jmp    c000ac1e <findElementInList+0xda>
c000abe6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000abe9:	8b 40 04             	mov    0x4(%eax),%eax
c000abec:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000abef:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000abf3:	75 07                	jne    c000abfc <findElementInList+0xb8>
c000abf5:	b8 00 00 00 00       	mov    $0x0,%eax
c000abfa:	eb 22                	jmp    c000ac1e <findElementInList+0xda>
c000abfc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000ac00:	8b 45 08             	mov    0x8(%ebp),%eax
c000ac03:	83 c0 08             	add    $0x8,%eax
c000ac06:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c000ac09:	75 bf                	jne    c000abca <findElementInList+0x86>
c000ac0b:	83 ec 0c             	sub    $0xc,%esp
c000ac0e:	ff 75 ec             	pushl  -0x14(%ebp)
c000ac11:	e8 b3 ce ff ff       	call   c0007ac9 <intr_set_status>
c000ac16:	83 c4 10             	add    $0x10,%esp
c000ac19:	b8 00 00 00 00       	mov    $0x0,%eax
c000ac1e:	c9                   	leave  
c000ac1f:	c3                   	ret    

c000ac20 <appendToDoubleLinkList>:
c000ac20:	55                   	push   %ebp
c000ac21:	89 e5                	mov    %esp,%ebp
c000ac23:	83 ec 18             	sub    $0x18,%esp
c000ac26:	83 ec 08             	sub    $0x8,%esp
c000ac29:	ff 75 0c             	pushl  0xc(%ebp)
c000ac2c:	ff 75 08             	pushl  0x8(%ebp)
c000ac2f:	e8 10 ff ff ff       	call   c000ab44 <findElementInList>
c000ac34:	83 c4 10             	add    $0x10,%esp
c000ac37:	3c 01                	cmp    $0x1,%al
c000ac39:	0f 84 c2 00 00 00    	je     c000ad01 <appendToDoubleLinkList+0xe1>
c000ac3f:	e8 5c ce ff ff       	call   c0007aa0 <intr_disable>
c000ac44:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000ac47:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c000ac4b:	75 1c                	jne    c000ac69 <appendToDoubleLinkList+0x49>
c000ac4d:	68 9e 00 00 00       	push   $0x9e
c000ac52:	68 e5 bd 00 c0       	push   $0xc000bde5
c000ac57:	68 e5 bd 00 c0       	push   $0xc000bde5
c000ac5c:	68 f8 bd 00 c0       	push   $0xc000bdf8
c000ac61:	e8 22 ea ff ff       	call   c0009688 <assertion_failure>
c000ac66:	83 c4 10             	add    $0x10,%esp
c000ac69:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000ac6d:	75 1c                	jne    c000ac8b <appendToDoubleLinkList+0x6b>
c000ac6f:	68 9f 00 00 00       	push   $0x9f
c000ac74:	68 e5 bd 00 c0       	push   $0xc000bde5
c000ac79:	68 e5 bd 00 c0       	push   $0xc000bde5
c000ac7e:	68 04 be 00 c0       	push   $0xc000be04
c000ac83:	e8 00 ea ff ff       	call   c0009688 <assertion_failure>
c000ac88:	83 c4 10             	add    $0x10,%esp
c000ac8b:	83 ec 08             	sub    $0x8,%esp
c000ac8e:	ff 75 0c             	pushl  0xc(%ebp)
c000ac91:	ff 75 08             	pushl  0x8(%ebp)
c000ac94:	e8 ab fe ff ff       	call   c000ab44 <findElementInList>
c000ac99:	83 c4 10             	add    $0x10,%esp
c000ac9c:	3c 01                	cmp    $0x1,%al
c000ac9e:	74 64                	je     c000ad04 <appendToDoubleLinkList+0xe4>
c000aca0:	8b 45 0c             	mov    0xc(%ebp),%eax
c000aca3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000aca6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000aca9:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c000acb0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000acb3:	8b 50 04             	mov    0x4(%eax),%edx
c000acb6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000acb9:	89 10                	mov    %edx,(%eax)
c000acbb:	8b 45 08             	mov    0x8(%ebp),%eax
c000acbe:	8b 50 08             	mov    0x8(%eax),%edx
c000acc1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000acc4:	89 10                	mov    %edx,(%eax)
c000acc6:	8b 45 08             	mov    0x8(%ebp),%eax
c000acc9:	8b 40 08             	mov    0x8(%eax),%eax
c000accc:	85 c0                	test   %eax,%eax
c000acce:	74 0c                	je     c000acdc <appendToDoubleLinkList+0xbc>
c000acd0:	8b 45 08             	mov    0x8(%ebp),%eax
c000acd3:	8b 40 08             	mov    0x8(%eax),%eax
c000acd6:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000acd9:	89 50 04             	mov    %edx,0x4(%eax)
c000acdc:	8b 45 08             	mov    0x8(%ebp),%eax
c000acdf:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000ace2:	89 50 08             	mov    %edx,0x8(%eax)
c000ace5:	8b 45 08             	mov    0x8(%ebp),%eax
c000ace8:	8d 50 08             	lea    0x8(%eax),%edx
c000aceb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000acee:	89 50 04             	mov    %edx,0x4(%eax)
c000acf1:	83 ec 0c             	sub    $0xc,%esp
c000acf4:	ff 75 f4             	pushl  -0xc(%ebp)
c000acf7:	e8 cd cd ff ff       	call   c0007ac9 <intr_set_status>
c000acfc:	83 c4 10             	add    $0x10,%esp
c000acff:	eb 04                	jmp    c000ad05 <appendToDoubleLinkList+0xe5>
c000ad01:	90                   	nop
c000ad02:	eb 01                	jmp    c000ad05 <appendToDoubleLinkList+0xe5>
c000ad04:	90                   	nop
c000ad05:	c9                   	leave  
c000ad06:	c3                   	ret    

c000ad07 <insertToDoubleLinkList>:
c000ad07:	55                   	push   %ebp
c000ad08:	89 e5                	mov    %esp,%ebp
c000ad0a:	83 ec 18             	sub    $0x18,%esp
c000ad0d:	83 ec 08             	sub    $0x8,%esp
c000ad10:	ff 75 0c             	pushl  0xc(%ebp)
c000ad13:	ff 75 08             	pushl  0x8(%ebp)
c000ad16:	e8 29 fe ff ff       	call   c000ab44 <findElementInList>
c000ad1b:	83 c4 10             	add    $0x10,%esp
c000ad1e:	3c 01                	cmp    $0x1,%al
c000ad20:	74 65                	je     c000ad87 <insertToDoubleLinkList+0x80>
c000ad22:	e8 79 cd ff ff       	call   c0007aa0 <intr_disable>
c000ad27:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000ad2a:	8b 45 0c             	mov    0xc(%ebp),%eax
c000ad2d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000ad30:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ad33:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c000ad3a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ad3d:	8b 50 04             	mov    0x4(%eax),%edx
c000ad40:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ad43:	89 10                	mov    %edx,(%eax)
c000ad45:	8b 45 08             	mov    0x8(%ebp),%eax
c000ad48:	8b 50 04             	mov    0x4(%eax),%edx
c000ad4b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ad4e:	89 50 04             	mov    %edx,0x4(%eax)
c000ad51:	8b 45 08             	mov    0x8(%ebp),%eax
c000ad54:	8b 40 04             	mov    0x4(%eax),%eax
c000ad57:	85 c0                	test   %eax,%eax
c000ad59:	74 0b                	je     c000ad66 <insertToDoubleLinkList+0x5f>
c000ad5b:	8b 45 08             	mov    0x8(%ebp),%eax
c000ad5e:	8b 40 04             	mov    0x4(%eax),%eax
c000ad61:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000ad64:	89 10                	mov    %edx,(%eax)
c000ad66:	8b 45 08             	mov    0x8(%ebp),%eax
c000ad69:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000ad6c:	89 50 04             	mov    %edx,0x4(%eax)
c000ad6f:	8b 55 08             	mov    0x8(%ebp),%edx
c000ad72:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ad75:	89 10                	mov    %edx,(%eax)
c000ad77:	83 ec 0c             	sub    $0xc,%esp
c000ad7a:	ff 75 f4             	pushl  -0xc(%ebp)
c000ad7d:	e8 47 cd ff ff       	call   c0007ac9 <intr_set_status>
c000ad82:	83 c4 10             	add    $0x10,%esp
c000ad85:	eb 01                	jmp    c000ad88 <insertToDoubleLinkList+0x81>
c000ad87:	90                   	nop
c000ad88:	c9                   	leave  
c000ad89:	c3                   	ret    

c000ad8a <popFromDoubleLinkList>:
c000ad8a:	55                   	push   %ebp
c000ad8b:	89 e5                	mov    %esp,%ebp
c000ad8d:	83 ec 18             	sub    $0x18,%esp
c000ad90:	e8 0b cd ff ff       	call   c0007aa0 <intr_disable>
c000ad95:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000ad98:	83 ec 0c             	sub    $0xc,%esp
c000ad9b:	ff 75 08             	pushl  0x8(%ebp)
c000ad9e:	e8 80 fd ff ff       	call   c000ab23 <isListEmpty>
c000ada3:	83 c4 10             	add    $0x10,%esp
c000ada6:	3c 01                	cmp    $0x1,%al
c000ada8:	75 07                	jne    c000adb1 <popFromDoubleLinkList+0x27>
c000adaa:	b8 00 00 00 00       	mov    $0x0,%eax
c000adaf:	eb 6b                	jmp    c000ae1c <popFromDoubleLinkList+0x92>
c000adb1:	8b 45 08             	mov    0x8(%ebp),%eax
c000adb4:	8b 40 08             	mov    0x8(%eax),%eax
c000adb7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000adba:	8b 45 08             	mov    0x8(%ebp),%eax
c000adbd:	8b 40 08             	mov    0x8(%eax),%eax
c000adc0:	85 c0                	test   %eax,%eax
c000adc2:	75 07                	jne    c000adcb <popFromDoubleLinkList+0x41>
c000adc4:	b8 00 00 00 00       	mov    $0x0,%eax
c000adc9:	eb 51                	jmp    c000ae1c <popFromDoubleLinkList+0x92>
c000adcb:	8b 45 08             	mov    0x8(%ebp),%eax
c000adce:	8b 40 08             	mov    0x8(%eax),%eax
c000add1:	8b 00                	mov    (%eax),%eax
c000add3:	85 c0                	test   %eax,%eax
c000add5:	74 11                	je     c000ade8 <popFromDoubleLinkList+0x5e>
c000add7:	8b 45 08             	mov    0x8(%ebp),%eax
c000adda:	8b 40 08             	mov    0x8(%eax),%eax
c000addd:	8b 00                	mov    (%eax),%eax
c000addf:	8b 55 08             	mov    0x8(%ebp),%edx
c000ade2:	83 c2 08             	add    $0x8,%edx
c000ade5:	89 50 04             	mov    %edx,0x4(%eax)
c000ade8:	8b 45 08             	mov    0x8(%ebp),%eax
c000adeb:	8b 40 08             	mov    0x8(%eax),%eax
c000adee:	8b 10                	mov    (%eax),%edx
c000adf0:	8b 45 08             	mov    0x8(%ebp),%eax
c000adf3:	89 50 08             	mov    %edx,0x8(%eax)
c000adf6:	83 ec 0c             	sub    $0xc,%esp
c000adf9:	ff 75 f4             	pushl  -0xc(%ebp)
c000adfc:	e8 c8 cc ff ff       	call   c0007ac9 <intr_set_status>
c000ae01:	83 c4 10             	add    $0x10,%esp
c000ae04:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ae07:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c000ae0e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ae11:	8b 50 04             	mov    0x4(%eax),%edx
c000ae14:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ae17:	89 10                	mov    %edx,(%eax)
c000ae19:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ae1c:	c9                   	leave  
c000ae1d:	c3                   	ret    

c000ae1e <kernel_thread>:
c000ae1e:	55                   	push   %ebp
c000ae1f:	89 e5                	mov    %esp,%ebp
c000ae21:	83 ec 08             	sub    $0x8,%esp
c000ae24:	fb                   	sti    
c000ae25:	83 ec 0c             	sub    $0xc,%esp
c000ae28:	ff 75 0c             	pushl  0xc(%ebp)
c000ae2b:	8b 45 08             	mov    0x8(%ebp),%eax
c000ae2e:	ff d0                	call   *%eax
c000ae30:	83 c4 10             	add    $0x10,%esp
c000ae33:	90                   	nop
c000ae34:	c9                   	leave  
c000ae35:	c3                   	ret    

c000ae36 <thread_init>:
c000ae36:	55                   	push   %ebp
c000ae37:	89 e5                	mov    %esp,%ebp
c000ae39:	83 ec 18             	sub    $0x18,%esp
c000ae3c:	83 ec 08             	sub    $0x8,%esp
c000ae3f:	6a 00                	push   $0x0
c000ae41:	6a 01                	push   $0x1
c000ae43:	e8 f2 c1 ff ff       	call   c000703a <alloc_memory>
c000ae48:	83 c4 10             	add    $0x10,%esp
c000ae4b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000ae4e:	83 ec 04             	sub    $0x4,%esp
c000ae51:	68 00 10 00 00       	push   $0x1000
c000ae56:	6a 00                	push   $0x0
c000ae58:	ff 75 f4             	pushl  -0xc(%ebp)
c000ae5b:	e8 df 0f 00 00       	call   c000be3f <Memset>
c000ae60:	83 c4 10             	add    $0x10,%esp
c000ae63:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ae66:	05 00 10 00 00       	add    $0x1000,%eax
c000ae6b:	89 c2                	mov    %eax,%edx
c000ae6d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ae70:	89 10                	mov    %edx,(%eax)
c000ae72:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ae75:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c000ae7c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ae7f:	c7 80 64 02 00 00 ff 	movl   $0xffffffff,0x264(%eax)
c000ae86:	ff ff ff 
c000ae89:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ae8c:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c000ae93:	00 00 00 
c000ae96:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ae99:	8b 90 5c 02 00 00    	mov    0x25c(%eax),%edx
c000ae9f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aea2:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c000aea8:	a1 90 07 01 c0       	mov    0xc0010790,%eax
c000aead:	83 c0 01             	add    $0x1,%eax
c000aeb0:	a3 90 07 01 c0       	mov    %eax,0xc0010790
c000aeb5:	8b 15 90 07 01 c0    	mov    0xc0010790,%edx
c000aebb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aebe:	89 90 24 01 00 00    	mov    %edx,0x124(%eax)
c000aec4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aec7:	c7 80 28 01 00 00 0a 	movl   $0xa,0x128(%eax)
c000aece:	00 00 00 
c000aed1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aed4:	c7 80 b0 02 00 00 e0 	movl   $0x99abcde0,0x2b0(%eax)
c000aedb:	cd ab 99 
c000aede:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aee1:	c9                   	leave  
c000aee2:	c3                   	ret    

c000aee3 <thread_create>:
c000aee3:	55                   	push   %ebp
c000aee4:	89 e5                	mov    %esp,%ebp
c000aee6:	83 ec 10             	sub    $0x10,%esp
c000aee9:	c7 45 fc 44 00 00 00 	movl   $0x44,-0x4(%ebp)
c000aef0:	c7 45 f8 2c 00 00 00 	movl   $0x2c,-0x8(%ebp)
c000aef7:	8b 45 08             	mov    0x8(%ebp),%eax
c000aefa:	8b 00                	mov    (%eax),%eax
c000aefc:	2b 45 fc             	sub    -0x4(%ebp),%eax
c000aeff:	89 c2                	mov    %eax,%edx
c000af01:	8b 45 08             	mov    0x8(%ebp),%eax
c000af04:	89 10                	mov    %edx,(%eax)
c000af06:	8b 45 08             	mov    0x8(%ebp),%eax
c000af09:	8b 00                	mov    (%eax),%eax
c000af0b:	2b 45 f8             	sub    -0x8(%ebp),%eax
c000af0e:	89 c2                	mov    %eax,%edx
c000af10:	8b 45 08             	mov    0x8(%ebp),%eax
c000af13:	89 10                	mov    %edx,(%eax)
c000af15:	90                   	nop
c000af16:	c9                   	leave  
c000af17:	c3                   	ret    

c000af18 <thread_start>:
c000af18:	55                   	push   %ebp
c000af19:	89 e5                	mov    %esp,%ebp
c000af1b:	83 ec 18             	sub    $0x18,%esp
c000af1e:	e8 13 ff ff ff       	call   c000ae36 <thread_init>
c000af23:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000af26:	83 ec 0c             	sub    $0xc,%esp
c000af29:	ff 75 f4             	pushl  -0xc(%ebp)
c000af2c:	e8 b2 ff ff ff       	call   c000aee3 <thread_create>
c000af31:	83 c4 10             	add    $0x10,%esp
c000af34:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000af37:	05 34 01 00 00       	add    $0x134,%eax
c000af3c:	83 ec 08             	sub    $0x8,%esp
c000af3f:	ff 75 10             	pushl  0x10(%ebp)
c000af42:	50                   	push   %eax
c000af43:	e8 16 0f 00 00       	call   c000be5e <Strcpy>
c000af48:	83 c4 10             	add    $0x10,%esp
c000af4b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000af4e:	8b 00                	mov    (%eax),%eax
c000af50:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000af53:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000af56:	c7 40 10 1e ae 00 c0 	movl   $0xc000ae1e,0x10(%eax)
c000af5d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000af60:	8b 55 08             	mov    0x8(%ebp),%edx
c000af63:	89 50 18             	mov    %edx,0x18(%eax)
c000af66:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000af69:	8b 55 0c             	mov    0xc(%ebp),%edx
c000af6c:	89 50 1c             	mov    %edx,0x1c(%eax)
c000af6f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000af72:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000af78:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000af7b:	8b 10                	mov    (%eax),%edx
c000af7d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000af80:	89 50 04             	mov    %edx,0x4(%eax)
c000af83:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000af86:	8b 50 04             	mov    0x4(%eax),%edx
c000af89:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000af8c:	89 50 08             	mov    %edx,0x8(%eax)
c000af8f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000af92:	8b 50 08             	mov    0x8(%eax),%edx
c000af95:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000af98:	89 50 0c             	mov    %edx,0xc(%eax)
c000af9b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000af9e:	05 00 01 00 00       	add    $0x100,%eax
c000afa3:	83 ec 08             	sub    $0x8,%esp
c000afa6:	50                   	push   %eax
c000afa7:	68 ec 0d 01 c0       	push   $0xc0010dec
c000afac:	e8 6f fc ff ff       	call   c000ac20 <appendToDoubleLinkList>
c000afb1:	83 c4 10             	add    $0x10,%esp
c000afb4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000afb7:	05 08 01 00 00       	add    $0x108,%eax
c000afbc:	83 ec 08             	sub    $0x8,%esp
c000afbf:	50                   	push   %eax
c000afc0:	68 04 1f 01 c0       	push   $0xc0011f04
c000afc5:	e8 56 fc ff ff       	call   c000ac20 <appendToDoubleLinkList>
c000afca:	83 c4 10             	add    $0x10,%esp
c000afcd:	90                   	nop
c000afce:	c9                   	leave  
c000afcf:	c3                   	ret    
